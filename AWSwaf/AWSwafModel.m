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

#import "AWSwafModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSwafErrorDomain = @"com.amazonaws.AWSwafErrorDomain";

@implementation AWSwafActivatedRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"excludedRules" : @"ExcludedRules",
             @"overrideAction" : @"OverrideAction",
             @"priority" : @"Priority",
             @"ruleId" : @"RuleId",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafWafAction class]];
}

+ (NSValueTransformer *)excludedRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafExcludedRule class]];
}

+ (NSValueTransformer *)overrideActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafWafOverrideAction class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REGULAR"] == NSOrderedSame) {
            return @(AWSwafWafRuleTypeRegular);
        }
        if ([value caseInsensitiveCompare:@"RATE_BASED"] == NSOrderedSame) {
            return @(AWSwafWafRuleTypeRateBased);
        }
        if ([value caseInsensitiveCompare:@"GROUP"] == NSOrderedSame) {
            return @(AWSwafWafRuleTypeGroup);
        }
        return @(AWSwafWafRuleTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafWafRuleTypeRegular:
                return @"REGULAR";
            case AWSwafWafRuleTypeRateBased:
                return @"RATE_BASED";
            case AWSwafWafRuleTypeGroup:
                return @"GROUP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwafByteMatchSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"byteMatchSetId" : @"ByteMatchSetId",
             @"byteMatchTuples" : @"ByteMatchTuples",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)byteMatchTuplesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafByteMatchTuple class]];
}

@end

@implementation AWSwafByteMatchSetSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"byteMatchSetId" : @"ByteMatchSetId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSwafByteMatchSetUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"byteMatchTuple" : @"ByteMatchTuple",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSwafChangeActionInsert);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSwafChangeActionDelete);
        }
        return @(AWSwafChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafChangeActionInsert:
                return @"INSERT";
            case AWSwafChangeActionDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)byteMatchTupleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafByteMatchTuple class]];
}

@end

@implementation AWSwafByteMatchTuple

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fieldToMatch" : @"FieldToMatch",
             @"positionalConstraint" : @"PositionalConstraint",
             @"targetString" : @"TargetString",
             @"textTransformation" : @"TextTransformation",
             };
}

+ (NSValueTransformer *)fieldToMatchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafFieldToMatch class]];
}

+ (NSValueTransformer *)positionalConstraintJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXACTLY"] == NSOrderedSame) {
            return @(AWSwafPositionalConstraintExactly);
        }
        if ([value caseInsensitiveCompare:@"STARTS_WITH"] == NSOrderedSame) {
            return @(AWSwafPositionalConstraintStartsWith);
        }
        if ([value caseInsensitiveCompare:@"ENDS_WITH"] == NSOrderedSame) {
            return @(AWSwafPositionalConstraintEndsWith);
        }
        if ([value caseInsensitiveCompare:@"CONTAINS"] == NSOrderedSame) {
            return @(AWSwafPositionalConstraintContains);
        }
        if ([value caseInsensitiveCompare:@"CONTAINS_WORD"] == NSOrderedSame) {
            return @(AWSwafPositionalConstraintContainsWord);
        }
        return @(AWSwafPositionalConstraintUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafPositionalConstraintExactly:
                return @"EXACTLY";
            case AWSwafPositionalConstraintStartsWith:
                return @"STARTS_WITH";
            case AWSwafPositionalConstraintEndsWith:
                return @"ENDS_WITH";
            case AWSwafPositionalConstraintContains:
                return @"CONTAINS";
            case AWSwafPositionalConstraintContainsWord:
                return @"CONTAINS_WORD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)textTransformationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationNone);
        }
        if ([value caseInsensitiveCompare:@"COMPRESS_WHITE_SPACE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationCompressWhiteSpace);
        }
        if ([value caseInsensitiveCompare:@"HTML_ENTITY_DECODE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationHtmlEntityDecode);
        }
        if ([value caseInsensitiveCompare:@"LOWERCASE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationLowercase);
        }
        if ([value caseInsensitiveCompare:@"CMD_LINE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationCmdLine);
        }
        if ([value caseInsensitiveCompare:@"URL_DECODE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationUrlDecode);
        }
        return @(AWSwafTextTransformationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafTextTransformationNone:
                return @"NONE";
            case AWSwafTextTransformationCompressWhiteSpace:
                return @"COMPRESS_WHITE_SPACE";
            case AWSwafTextTransformationHtmlEntityDecode:
                return @"HTML_ENTITY_DECODE";
            case AWSwafTextTransformationLowercase:
                return @"LOWERCASE";
            case AWSwafTextTransformationCmdLine:
                return @"CMD_LINE";
            case AWSwafTextTransformationUrlDecode:
                return @"URL_DECODE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwafCreateByteMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"name" : @"Name",
             };
}

@end

@implementation AWSwafCreateByteMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"byteMatchSet" : @"ByteMatchSet",
             @"changeToken" : @"ChangeToken",
             };
}

+ (NSValueTransformer *)byteMatchSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafByteMatchSet class]];
}

@end

@implementation AWSwafCreateGeoMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"name" : @"Name",
             };
}

@end

@implementation AWSwafCreateGeoMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"geoMatchSet" : @"GeoMatchSet",
             };
}

+ (NSValueTransformer *)geoMatchSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafGeoMatchSet class]];
}

@end

@implementation AWSwafCreateIPSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"name" : @"Name",
             };
}

@end

@implementation AWSwafCreateIPSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"IPSet" : @"IPSet",
             };
}

+ (NSValueTransformer *)IPSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafIPSet class]];
}

@end

@implementation AWSwafCreateRateBasedRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"metricName" : @"MetricName",
             @"name" : @"Name",
             @"rateKey" : @"RateKey",
             @"rateLimit" : @"RateLimit",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)rateKeyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IP"] == NSOrderedSame) {
            return @(AWSwafRateKeyIp);
        }
        return @(AWSwafRateKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafRateKeyIp:
                return @"IP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafTag class]];
}

@end

@implementation AWSwafCreateRateBasedRuleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"rule" : @"Rule",
             };
}

+ (NSValueTransformer *)ruleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafRateBasedRule class]];
}

@end

@implementation AWSwafCreateRegexMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"name" : @"Name",
             };
}

@end

@implementation AWSwafCreateRegexMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"regexMatchSet" : @"RegexMatchSet",
             };
}

+ (NSValueTransformer *)regexMatchSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafRegexMatchSet class]];
}

@end

@implementation AWSwafCreateRegexPatternSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"name" : @"Name",
             };
}

@end

@implementation AWSwafCreateRegexPatternSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"regexPatternSet" : @"RegexPatternSet",
             };
}

+ (NSValueTransformer *)regexPatternSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafRegexPatternSet class]];
}

@end

@implementation AWSwafCreateRuleGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"metricName" : @"MetricName",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafTag class]];
}

@end

@implementation AWSwafCreateRuleGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"ruleGroup" : @"RuleGroup",
             };
}

+ (NSValueTransformer *)ruleGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafRuleGroup class]];
}

@end

@implementation AWSwafCreateRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"metricName" : @"MetricName",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafTag class]];
}

@end

@implementation AWSwafCreateRuleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"rule" : @"Rule",
             };
}

+ (NSValueTransformer *)ruleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafRule class]];
}

@end

@implementation AWSwafCreateSizeConstraintSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"name" : @"Name",
             };
}

@end

@implementation AWSwafCreateSizeConstraintSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"sizeConstraintSet" : @"SizeConstraintSet",
             };
}

+ (NSValueTransformer *)sizeConstraintSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafSizeConstraintSet class]];
}

@end

@implementation AWSwafCreateSqlInjectionMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"name" : @"Name",
             };
}

@end

@implementation AWSwafCreateSqlInjectionMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"sqlInjectionMatchSet" : @"SqlInjectionMatchSet",
             };
}

+ (NSValueTransformer *)sqlInjectionMatchSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafSqlInjectionMatchSet class]];
}

@end

@implementation AWSwafCreateWebACLMigrationStackRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ignoreUnsupportedType" : @"IgnoreUnsupportedType",
             @"s3BucketName" : @"S3BucketName",
             @"webACLId" : @"WebACLId",
             };
}

@end

@implementation AWSwafCreateWebACLMigrationStackResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3ObjectUrl" : @"S3ObjectUrl",
             };
}

@end

@implementation AWSwafCreateWebACLRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"defaultAction" : @"DefaultAction",
             @"metricName" : @"MetricName",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)defaultActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafWafAction class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafTag class]];
}

@end

@implementation AWSwafCreateWebACLResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"webACL" : @"WebACL",
             };
}

+ (NSValueTransformer *)webACLJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafWebACL class]];
}

@end

@implementation AWSwafCreateXssMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"name" : @"Name",
             };
}

@end

@implementation AWSwafCreateXssMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"xssMatchSet" : @"XssMatchSet",
             };
}

+ (NSValueTransformer *)xssMatchSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafXssMatchSet class]];
}

@end

@implementation AWSwafDeleteByteMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"byteMatchSetId" : @"ByteMatchSetId",
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafDeleteByteMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafDeleteGeoMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"geoMatchSetId" : @"GeoMatchSetId",
             };
}

@end

@implementation AWSwafDeleteGeoMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafDeleteIPSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"IPSetId" : @"IPSetId",
             };
}

@end

@implementation AWSwafDeleteIPSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafDeleteLoggingConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSwafDeleteLoggingConfigurationResponse

@end

@implementation AWSwafDeletePermissionPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSwafDeletePermissionPolicyResponse

@end

@implementation AWSwafDeleteRateBasedRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"ruleId" : @"RuleId",
             };
}

@end

@implementation AWSwafDeleteRateBasedRuleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafDeleteRegexMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"regexMatchSetId" : @"RegexMatchSetId",
             };
}

@end

@implementation AWSwafDeleteRegexMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafDeleteRegexPatternSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"regexPatternSetId" : @"RegexPatternSetId",
             };
}

@end

@implementation AWSwafDeleteRegexPatternSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafDeleteRuleGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"ruleGroupId" : @"RuleGroupId",
             };
}

@end

@implementation AWSwafDeleteRuleGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafDeleteRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"ruleId" : @"RuleId",
             };
}

@end

@implementation AWSwafDeleteRuleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafDeleteSizeConstraintSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"sizeConstraintSetId" : @"SizeConstraintSetId",
             };
}

@end

@implementation AWSwafDeleteSizeConstraintSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafDeleteSqlInjectionMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"sqlInjectionMatchSetId" : @"SqlInjectionMatchSetId",
             };
}

@end

@implementation AWSwafDeleteSqlInjectionMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafDeleteWebACLRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"webACLId" : @"WebACLId",
             };
}

@end

@implementation AWSwafDeleteWebACLResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafDeleteXssMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"xssMatchSetId" : @"XssMatchSetId",
             };
}

@end

@implementation AWSwafDeleteXssMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafExcludedRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleId" : @"RuleId",
             };
}

@end

@implementation AWSwafFieldToMatch

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"Data",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"URI"] == NSOrderedSame) {
            return @(AWSwafMatchFieldTypeUri);
        }
        if ([value caseInsensitiveCompare:@"QUERY_STRING"] == NSOrderedSame) {
            return @(AWSwafMatchFieldTypeQueryString);
        }
        if ([value caseInsensitiveCompare:@"HEADER"] == NSOrderedSame) {
            return @(AWSwafMatchFieldTypeHeader);
        }
        if ([value caseInsensitiveCompare:@"METHOD"] == NSOrderedSame) {
            return @(AWSwafMatchFieldTypeMethod);
        }
        if ([value caseInsensitiveCompare:@"BODY"] == NSOrderedSame) {
            return @(AWSwafMatchFieldTypeBody);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_QUERY_ARG"] == NSOrderedSame) {
            return @(AWSwafMatchFieldTypeSingleQueryArg);
        }
        if ([value caseInsensitiveCompare:@"ALL_QUERY_ARGS"] == NSOrderedSame) {
            return @(AWSwafMatchFieldTypeAllQueryArgs);
        }
        return @(AWSwafMatchFieldTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafMatchFieldTypeUri:
                return @"URI";
            case AWSwafMatchFieldTypeQueryString:
                return @"QUERY_STRING";
            case AWSwafMatchFieldTypeHeader:
                return @"HEADER";
            case AWSwafMatchFieldTypeMethod:
                return @"METHOD";
            case AWSwafMatchFieldTypeBody:
                return @"BODY";
            case AWSwafMatchFieldTypeSingleQueryArg:
                return @"SINGLE_QUERY_ARG";
            case AWSwafMatchFieldTypeAllQueryArgs:
                return @"ALL_QUERY_ARGS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwafGeoMatchConstraint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Country"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintTypeCountry);
        }
        return @(AWSwafGeoMatchConstraintTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafGeoMatchConstraintTypeCountry:
                return @"Country";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)valueJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AF"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueAf);
        }
        if ([value caseInsensitiveCompare:@"AX"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueAx);
        }
        if ([value caseInsensitiveCompare:@"AL"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueAl);
        }
        if ([value caseInsensitiveCompare:@"DZ"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueDz);
        }
        if ([value caseInsensitiveCompare:@"AS"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueAs);
        }
        if ([value caseInsensitiveCompare:@"AD"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueAd);
        }
        if ([value caseInsensitiveCompare:@"AO"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueAo);
        }
        if ([value caseInsensitiveCompare:@"AI"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueAi);
        }
        if ([value caseInsensitiveCompare:@"AQ"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueAq);
        }
        if ([value caseInsensitiveCompare:@"AG"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueAg);
        }
        if ([value caseInsensitiveCompare:@"AR"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueAr);
        }
        if ([value caseInsensitiveCompare:@"AM"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueAm);
        }
        if ([value caseInsensitiveCompare:@"AW"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueAw);
        }
        if ([value caseInsensitiveCompare:@"AU"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueAu);
        }
        if ([value caseInsensitiveCompare:@"AT"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueAt);
        }
        if ([value caseInsensitiveCompare:@"AZ"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueAz);
        }
        if ([value caseInsensitiveCompare:@"BS"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueBs);
        }
        if ([value caseInsensitiveCompare:@"BH"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueBh);
        }
        if ([value caseInsensitiveCompare:@"BD"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueBd);
        }
        if ([value caseInsensitiveCompare:@"BB"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueBb);
        }
        if ([value caseInsensitiveCompare:@"BY"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueBy);
        }
        if ([value caseInsensitiveCompare:@"BE"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueBe);
        }
        if ([value caseInsensitiveCompare:@"BZ"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueBz);
        }
        if ([value caseInsensitiveCompare:@"BJ"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueBj);
        }
        if ([value caseInsensitiveCompare:@"BM"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueBm);
        }
        if ([value caseInsensitiveCompare:@"BT"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueBt);
        }
        if ([value caseInsensitiveCompare:@"BO"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueBo);
        }
        if ([value caseInsensitiveCompare:@"BQ"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueBq);
        }
        if ([value caseInsensitiveCompare:@"BA"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueBa);
        }
        if ([value caseInsensitiveCompare:@"BW"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueBw);
        }
        if ([value caseInsensitiveCompare:@"BV"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueBv);
        }
        if ([value caseInsensitiveCompare:@"BR"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueBr);
        }
        if ([value caseInsensitiveCompare:@"IO"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueIo);
        }
        if ([value caseInsensitiveCompare:@"BN"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueBn);
        }
        if ([value caseInsensitiveCompare:@"BG"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueBg);
        }
        if ([value caseInsensitiveCompare:@"BF"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueBf);
        }
        if ([value caseInsensitiveCompare:@"BI"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueBi);
        }
        if ([value caseInsensitiveCompare:@"KH"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueKh);
        }
        if ([value caseInsensitiveCompare:@"CM"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueCm);
        }
        if ([value caseInsensitiveCompare:@"CA"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueCa);
        }
        if ([value caseInsensitiveCompare:@"CV"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueCv);
        }
        if ([value caseInsensitiveCompare:@"KY"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueKy);
        }
        if ([value caseInsensitiveCompare:@"CF"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueCf);
        }
        if ([value caseInsensitiveCompare:@"TD"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueTd);
        }
        if ([value caseInsensitiveCompare:@"CL"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueCl);
        }
        if ([value caseInsensitiveCompare:@"CN"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueCn);
        }
        if ([value caseInsensitiveCompare:@"CX"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueCx);
        }
        if ([value caseInsensitiveCompare:@"CC"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueCc);
        }
        if ([value caseInsensitiveCompare:@"CO"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueCo);
        }
        if ([value caseInsensitiveCompare:@"KM"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueKm);
        }
        if ([value caseInsensitiveCompare:@"CG"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueCg);
        }
        if ([value caseInsensitiveCompare:@"CD"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueCd);
        }
        if ([value caseInsensitiveCompare:@"CK"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueCk);
        }
        if ([value caseInsensitiveCompare:@"CR"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueCr);
        }
        if ([value caseInsensitiveCompare:@"CI"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueCi);
        }
        if ([value caseInsensitiveCompare:@"HR"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueHr);
        }
        if ([value caseInsensitiveCompare:@"CU"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueCu);
        }
        if ([value caseInsensitiveCompare:@"CW"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueCw);
        }
        if ([value caseInsensitiveCompare:@"CY"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueCy);
        }
        if ([value caseInsensitiveCompare:@"CZ"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueCz);
        }
        if ([value caseInsensitiveCompare:@"DK"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueDk);
        }
        if ([value caseInsensitiveCompare:@"DJ"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueDj);
        }
        if ([value caseInsensitiveCompare:@"DM"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueDm);
        }
        if ([value caseInsensitiveCompare:@"DO"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueDo);
        }
        if ([value caseInsensitiveCompare:@"EC"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueEc);
        }
        if ([value caseInsensitiveCompare:@"EG"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueEg);
        }
        if ([value caseInsensitiveCompare:@"SV"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueSv);
        }
        if ([value caseInsensitiveCompare:@"GQ"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueGq);
        }
        if ([value caseInsensitiveCompare:@"ER"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueEr);
        }
        if ([value caseInsensitiveCompare:@"EE"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueEe);
        }
        if ([value caseInsensitiveCompare:@"ET"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueEt);
        }
        if ([value caseInsensitiveCompare:@"FK"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueFk);
        }
        if ([value caseInsensitiveCompare:@"FO"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueFo);
        }
        if ([value caseInsensitiveCompare:@"FJ"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueFj);
        }
        if ([value caseInsensitiveCompare:@"FI"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueFi);
        }
        if ([value caseInsensitiveCompare:@"FR"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueFr);
        }
        if ([value caseInsensitiveCompare:@"GF"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueGf);
        }
        if ([value caseInsensitiveCompare:@"PF"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValuePf);
        }
        if ([value caseInsensitiveCompare:@"TF"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueTf);
        }
        if ([value caseInsensitiveCompare:@"GA"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueGa);
        }
        if ([value caseInsensitiveCompare:@"GM"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueGm);
        }
        if ([value caseInsensitiveCompare:@"GE"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueGE);
        }
        if ([value caseInsensitiveCompare:@"DE"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueDe);
        }
        if ([value caseInsensitiveCompare:@"GH"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueGh);
        }
        if ([value caseInsensitiveCompare:@"GI"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueGi);
        }
        if ([value caseInsensitiveCompare:@"GR"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueGr);
        }
        if ([value caseInsensitiveCompare:@"GL"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueGl);
        }
        if ([value caseInsensitiveCompare:@"GD"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueGd);
        }
        if ([value caseInsensitiveCompare:@"GP"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueGp);
        }
        if ([value caseInsensitiveCompare:@"GU"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueGu);
        }
        if ([value caseInsensitiveCompare:@"GT"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueGT);
        }
        if ([value caseInsensitiveCompare:@"GG"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueGg);
        }
        if ([value caseInsensitiveCompare:@"GN"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueGn);
        }
        if ([value caseInsensitiveCompare:@"GW"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueGw);
        }
        if ([value caseInsensitiveCompare:@"GY"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueGy);
        }
        if ([value caseInsensitiveCompare:@"HT"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueHt);
        }
        if ([value caseInsensitiveCompare:@"HM"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueHm);
        }
        if ([value caseInsensitiveCompare:@"VA"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueVa);
        }
        if ([value caseInsensitiveCompare:@"HN"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueHn);
        }
        if ([value caseInsensitiveCompare:@"HK"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueHk);
        }
        if ([value caseInsensitiveCompare:@"HU"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueHu);
        }
        if ([value caseInsensitiveCompare:@"IS"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueIs);
        }
        if ([value caseInsensitiveCompare:@"IN"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueIN);
        }
        if ([value caseInsensitiveCompare:@"ID"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueId);
        }
        if ([value caseInsensitiveCompare:@"IR"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueIr);
        }
        if ([value caseInsensitiveCompare:@"IQ"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueIq);
        }
        if ([value caseInsensitiveCompare:@"IE"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueIe);
        }
        if ([value caseInsensitiveCompare:@"IM"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueIm);
        }
        if ([value caseInsensitiveCompare:@"IL"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueIl);
        }
        if ([value caseInsensitiveCompare:@"IT"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueIt);
        }
        if ([value caseInsensitiveCompare:@"JM"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueJm);
        }
        if ([value caseInsensitiveCompare:@"JP"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueJp);
        }
        if ([value caseInsensitiveCompare:@"JE"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueJe);
        }
        if ([value caseInsensitiveCompare:@"JO"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueJo);
        }
        if ([value caseInsensitiveCompare:@"KZ"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueKz);
        }
        if ([value caseInsensitiveCompare:@"KE"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueKe);
        }
        if ([value caseInsensitiveCompare:@"KI"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueKi);
        }
        if ([value caseInsensitiveCompare:@"KP"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueKp);
        }
        if ([value caseInsensitiveCompare:@"KR"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueKr);
        }
        if ([value caseInsensitiveCompare:@"KW"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueKw);
        }
        if ([value caseInsensitiveCompare:@"KG"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueKg);
        }
        if ([value caseInsensitiveCompare:@"LA"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueLa);
        }
        if ([value caseInsensitiveCompare:@"LV"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueLv);
        }
        if ([value caseInsensitiveCompare:@"LB"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueLb);
        }
        if ([value caseInsensitiveCompare:@"LS"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueLs);
        }
        if ([value caseInsensitiveCompare:@"LR"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueLr);
        }
        if ([value caseInsensitiveCompare:@"LY"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueLy);
        }
        if ([value caseInsensitiveCompare:@"LI"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueLi);
        }
        if ([value caseInsensitiveCompare:@"LT"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueLT);
        }
        if ([value caseInsensitiveCompare:@"LU"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueLu);
        }
        if ([value caseInsensitiveCompare:@"MO"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueMo);
        }
        if ([value caseInsensitiveCompare:@"MK"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueMk);
        }
        if ([value caseInsensitiveCompare:@"MG"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueMg);
        }
        if ([value caseInsensitiveCompare:@"MW"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueMw);
        }
        if ([value caseInsensitiveCompare:@"MY"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueMy);
        }
        if ([value caseInsensitiveCompare:@"MV"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueMv);
        }
        if ([value caseInsensitiveCompare:@"ML"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueMl);
        }
        if ([value caseInsensitiveCompare:@"MT"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueMt);
        }
        if ([value caseInsensitiveCompare:@"MH"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueMh);
        }
        if ([value caseInsensitiveCompare:@"MQ"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueMq);
        }
        if ([value caseInsensitiveCompare:@"MR"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueMr);
        }
        if ([value caseInsensitiveCompare:@"MU"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueMu);
        }
        if ([value caseInsensitiveCompare:@"YT"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueYt);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueMx);
        }
        if ([value caseInsensitiveCompare:@"FM"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueFm);
        }
        if ([value caseInsensitiveCompare:@"MD"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueMd);
        }
        if ([value caseInsensitiveCompare:@"MC"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueMc);
        }
        if ([value caseInsensitiveCompare:@"MN"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueMn);
        }
        if ([value caseInsensitiveCompare:@"ME"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueMe);
        }
        if ([value caseInsensitiveCompare:@"MS"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueMs);
        }
        if ([value caseInsensitiveCompare:@"MA"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueMa);
        }
        if ([value caseInsensitiveCompare:@"MZ"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueMz);
        }
        if ([value caseInsensitiveCompare:@"MM"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueMm);
        }
        if ([value caseInsensitiveCompare:@"NA"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueNa);
        }
        if ([value caseInsensitiveCompare:@"NR"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueNr);
        }
        if ([value caseInsensitiveCompare:@"NP"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueNp);
        }
        if ([value caseInsensitiveCompare:@"NL"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueNl);
        }
        if ([value caseInsensitiveCompare:@"NC"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueNc);
        }
        if ([value caseInsensitiveCompare:@"NZ"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueNz);
        }
        if ([value caseInsensitiveCompare:@"NI"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueNi);
        }
        if ([value caseInsensitiveCompare:@"NE"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueNE);
        }
        if ([value caseInsensitiveCompare:@"NG"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueNg);
        }
        if ([value caseInsensitiveCompare:@"NU"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueNu);
        }
        if ([value caseInsensitiveCompare:@"NF"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueNf);
        }
        if ([value caseInsensitiveCompare:@"MP"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueMp);
        }
        if ([value caseInsensitiveCompare:@"NO"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueNo);
        }
        if ([value caseInsensitiveCompare:@"OM"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueOm);
        }
        if ([value caseInsensitiveCompare:@"PK"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValuePk);
        }
        if ([value caseInsensitiveCompare:@"PW"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValuePw);
        }
        if ([value caseInsensitiveCompare:@"PS"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValuePs);
        }
        if ([value caseInsensitiveCompare:@"PA"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValuePa);
        }
        if ([value caseInsensitiveCompare:@"PG"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValuePg);
        }
        if ([value caseInsensitiveCompare:@"PY"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValuePy);
        }
        if ([value caseInsensitiveCompare:@"PE"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValuePe);
        }
        if ([value caseInsensitiveCompare:@"PH"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValuePh);
        }
        if ([value caseInsensitiveCompare:@"PN"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValuePn);
        }
        if ([value caseInsensitiveCompare:@"PL"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValuePl);
        }
        if ([value caseInsensitiveCompare:@"PT"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValuePt);
        }
        if ([value caseInsensitiveCompare:@"PR"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValuePr);
        }
        if ([value caseInsensitiveCompare:@"QA"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueQa);
        }
        if ([value caseInsensitiveCompare:@"RE"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueRe);
        }
        if ([value caseInsensitiveCompare:@"RO"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueRo);
        }
        if ([value caseInsensitiveCompare:@"RU"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueRu);
        }
        if ([value caseInsensitiveCompare:@"RW"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueRw);
        }
        if ([value caseInsensitiveCompare:@"BL"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueBl);
        }
        if ([value caseInsensitiveCompare:@"SH"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueSh);
        }
        if ([value caseInsensitiveCompare:@"KN"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueKn);
        }
        if ([value caseInsensitiveCompare:@"LC"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueLc);
        }
        if ([value caseInsensitiveCompare:@"MF"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueMf);
        }
        if ([value caseInsensitiveCompare:@"PM"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValuePm);
        }
        if ([value caseInsensitiveCompare:@"VC"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueVc);
        }
        if ([value caseInsensitiveCompare:@"WS"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueWs);
        }
        if ([value caseInsensitiveCompare:@"SM"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueSm);
        }
        if ([value caseInsensitiveCompare:@"ST"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueSt);
        }
        if ([value caseInsensitiveCompare:@"SA"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueSa);
        }
        if ([value caseInsensitiveCompare:@"SN"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueSn);
        }
        if ([value caseInsensitiveCompare:@"RS"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueRs);
        }
        if ([value caseInsensitiveCompare:@"SC"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueSc);
        }
        if ([value caseInsensitiveCompare:@"SL"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueSl);
        }
        if ([value caseInsensitiveCompare:@"SG"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueSg);
        }
        if ([value caseInsensitiveCompare:@"SX"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueSx);
        }
        if ([value caseInsensitiveCompare:@"SK"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueSk);
        }
        if ([value caseInsensitiveCompare:@"SI"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueSi);
        }
        if ([value caseInsensitiveCompare:@"SB"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueSb);
        }
        if ([value caseInsensitiveCompare:@"SO"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueSo);
        }
        if ([value caseInsensitiveCompare:@"ZA"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueZa);
        }
        if ([value caseInsensitiveCompare:@"GS"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueGs);
        }
        if ([value caseInsensitiveCompare:@"SS"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueSs);
        }
        if ([value caseInsensitiveCompare:@"ES"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueEs);
        }
        if ([value caseInsensitiveCompare:@"LK"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueLk);
        }
        if ([value caseInsensitiveCompare:@"SD"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueSd);
        }
        if ([value caseInsensitiveCompare:@"SR"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueSr);
        }
        if ([value caseInsensitiveCompare:@"SJ"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueSj);
        }
        if ([value caseInsensitiveCompare:@"SZ"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueSz);
        }
        if ([value caseInsensitiveCompare:@"SE"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueSe);
        }
        if ([value caseInsensitiveCompare:@"CH"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueCh);
        }
        if ([value caseInsensitiveCompare:@"SY"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueSy);
        }
        if ([value caseInsensitiveCompare:@"TW"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueTw);
        }
        if ([value caseInsensitiveCompare:@"TJ"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueTj);
        }
        if ([value caseInsensitiveCompare:@"TZ"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueTz);
        }
        if ([value caseInsensitiveCompare:@"TH"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueTh);
        }
        if ([value caseInsensitiveCompare:@"TL"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueTl);
        }
        if ([value caseInsensitiveCompare:@"TG"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueTg);
        }
        if ([value caseInsensitiveCompare:@"TK"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueTk);
        }
        if ([value caseInsensitiveCompare:@"TO"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueTo);
        }
        if ([value caseInsensitiveCompare:@"TT"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueTt);
        }
        if ([value caseInsensitiveCompare:@"TN"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueTn);
        }
        if ([value caseInsensitiveCompare:@"TR"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueTr);
        }
        if ([value caseInsensitiveCompare:@"TM"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueTm);
        }
        if ([value caseInsensitiveCompare:@"TC"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueTc);
        }
        if ([value caseInsensitiveCompare:@"TV"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueTv);
        }
        if ([value caseInsensitiveCompare:@"UG"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueUg);
        }
        if ([value caseInsensitiveCompare:@"UA"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueUa);
        }
        if ([value caseInsensitiveCompare:@"AE"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueAe);
        }
        if ([value caseInsensitiveCompare:@"GB"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueGb);
        }
        if ([value caseInsensitiveCompare:@"US"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueUs);
        }
        if ([value caseInsensitiveCompare:@"UM"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueUm);
        }
        if ([value caseInsensitiveCompare:@"UY"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueUy);
        }
        if ([value caseInsensitiveCompare:@"UZ"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueUz);
        }
        if ([value caseInsensitiveCompare:@"VU"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueVu);
        }
        if ([value caseInsensitiveCompare:@"VE"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueVe);
        }
        if ([value caseInsensitiveCompare:@"VN"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueVn);
        }
        if ([value caseInsensitiveCompare:@"VG"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueVg);
        }
        if ([value caseInsensitiveCompare:@"VI"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueVi);
        }
        if ([value caseInsensitiveCompare:@"WF"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueWf);
        }
        if ([value caseInsensitiveCompare:@"EH"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueEh);
        }
        if ([value caseInsensitiveCompare:@"YE"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueYe);
        }
        if ([value caseInsensitiveCompare:@"ZM"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueZm);
        }
        if ([value caseInsensitiveCompare:@"ZW"] == NSOrderedSame) {
            return @(AWSwafGeoMatchConstraintValueZw);
        }
        return @(AWSwafGeoMatchConstraintValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafGeoMatchConstraintValueAf:
                return @"AF";
            case AWSwafGeoMatchConstraintValueAx:
                return @"AX";
            case AWSwafGeoMatchConstraintValueAl:
                return @"AL";
            case AWSwafGeoMatchConstraintValueDz:
                return @"DZ";
            case AWSwafGeoMatchConstraintValueAs:
                return @"AS";
            case AWSwafGeoMatchConstraintValueAd:
                return @"AD";
            case AWSwafGeoMatchConstraintValueAo:
                return @"AO";
            case AWSwafGeoMatchConstraintValueAi:
                return @"AI";
            case AWSwafGeoMatchConstraintValueAq:
                return @"AQ";
            case AWSwafGeoMatchConstraintValueAg:
                return @"AG";
            case AWSwafGeoMatchConstraintValueAr:
                return @"AR";
            case AWSwafGeoMatchConstraintValueAm:
                return @"AM";
            case AWSwafGeoMatchConstraintValueAw:
                return @"AW";
            case AWSwafGeoMatchConstraintValueAu:
                return @"AU";
            case AWSwafGeoMatchConstraintValueAt:
                return @"AT";
            case AWSwafGeoMatchConstraintValueAz:
                return @"AZ";
            case AWSwafGeoMatchConstraintValueBs:
                return @"BS";
            case AWSwafGeoMatchConstraintValueBh:
                return @"BH";
            case AWSwafGeoMatchConstraintValueBd:
                return @"BD";
            case AWSwafGeoMatchConstraintValueBb:
                return @"BB";
            case AWSwafGeoMatchConstraintValueBy:
                return @"BY";
            case AWSwafGeoMatchConstraintValueBe:
                return @"BE";
            case AWSwafGeoMatchConstraintValueBz:
                return @"BZ";
            case AWSwafGeoMatchConstraintValueBj:
                return @"BJ";
            case AWSwafGeoMatchConstraintValueBm:
                return @"BM";
            case AWSwafGeoMatchConstraintValueBt:
                return @"BT";
            case AWSwafGeoMatchConstraintValueBo:
                return @"BO";
            case AWSwafGeoMatchConstraintValueBq:
                return @"BQ";
            case AWSwafGeoMatchConstraintValueBa:
                return @"BA";
            case AWSwafGeoMatchConstraintValueBw:
                return @"BW";
            case AWSwafGeoMatchConstraintValueBv:
                return @"BV";
            case AWSwafGeoMatchConstraintValueBr:
                return @"BR";
            case AWSwafGeoMatchConstraintValueIo:
                return @"IO";
            case AWSwafGeoMatchConstraintValueBn:
                return @"BN";
            case AWSwafGeoMatchConstraintValueBg:
                return @"BG";
            case AWSwafGeoMatchConstraintValueBf:
                return @"BF";
            case AWSwafGeoMatchConstraintValueBi:
                return @"BI";
            case AWSwafGeoMatchConstraintValueKh:
                return @"KH";
            case AWSwafGeoMatchConstraintValueCm:
                return @"CM";
            case AWSwafGeoMatchConstraintValueCa:
                return @"CA";
            case AWSwafGeoMatchConstraintValueCv:
                return @"CV";
            case AWSwafGeoMatchConstraintValueKy:
                return @"KY";
            case AWSwafGeoMatchConstraintValueCf:
                return @"CF";
            case AWSwafGeoMatchConstraintValueTd:
                return @"TD";
            case AWSwafGeoMatchConstraintValueCl:
                return @"CL";
            case AWSwafGeoMatchConstraintValueCn:
                return @"CN";
            case AWSwafGeoMatchConstraintValueCx:
                return @"CX";
            case AWSwafGeoMatchConstraintValueCc:
                return @"CC";
            case AWSwafGeoMatchConstraintValueCo:
                return @"CO";
            case AWSwafGeoMatchConstraintValueKm:
                return @"KM";
            case AWSwafGeoMatchConstraintValueCg:
                return @"CG";
            case AWSwafGeoMatchConstraintValueCd:
                return @"CD";
            case AWSwafGeoMatchConstraintValueCk:
                return @"CK";
            case AWSwafGeoMatchConstraintValueCr:
                return @"CR";
            case AWSwafGeoMatchConstraintValueCi:
                return @"CI";
            case AWSwafGeoMatchConstraintValueHr:
                return @"HR";
            case AWSwafGeoMatchConstraintValueCu:
                return @"CU";
            case AWSwafGeoMatchConstraintValueCw:
                return @"CW";
            case AWSwafGeoMatchConstraintValueCy:
                return @"CY";
            case AWSwafGeoMatchConstraintValueCz:
                return @"CZ";
            case AWSwafGeoMatchConstraintValueDk:
                return @"DK";
            case AWSwafGeoMatchConstraintValueDj:
                return @"DJ";
            case AWSwafGeoMatchConstraintValueDm:
                return @"DM";
            case AWSwafGeoMatchConstraintValueDo:
                return @"DO";
            case AWSwafGeoMatchConstraintValueEc:
                return @"EC";
            case AWSwafGeoMatchConstraintValueEg:
                return @"EG";
            case AWSwafGeoMatchConstraintValueSv:
                return @"SV";
            case AWSwafGeoMatchConstraintValueGq:
                return @"GQ";
            case AWSwafGeoMatchConstraintValueEr:
                return @"ER";
            case AWSwafGeoMatchConstraintValueEe:
                return @"EE";
            case AWSwafGeoMatchConstraintValueEt:
                return @"ET";
            case AWSwafGeoMatchConstraintValueFk:
                return @"FK";
            case AWSwafGeoMatchConstraintValueFo:
                return @"FO";
            case AWSwafGeoMatchConstraintValueFj:
                return @"FJ";
            case AWSwafGeoMatchConstraintValueFi:
                return @"FI";
            case AWSwafGeoMatchConstraintValueFr:
                return @"FR";
            case AWSwafGeoMatchConstraintValueGf:
                return @"GF";
            case AWSwafGeoMatchConstraintValuePf:
                return @"PF";
            case AWSwafGeoMatchConstraintValueTf:
                return @"TF";
            case AWSwafGeoMatchConstraintValueGa:
                return @"GA";
            case AWSwafGeoMatchConstraintValueGm:
                return @"GM";
            case AWSwafGeoMatchConstraintValueGE:
                return @"GE";
            case AWSwafGeoMatchConstraintValueDe:
                return @"DE";
            case AWSwafGeoMatchConstraintValueGh:
                return @"GH";
            case AWSwafGeoMatchConstraintValueGi:
                return @"GI";
            case AWSwafGeoMatchConstraintValueGr:
                return @"GR";
            case AWSwafGeoMatchConstraintValueGl:
                return @"GL";
            case AWSwafGeoMatchConstraintValueGd:
                return @"GD";
            case AWSwafGeoMatchConstraintValueGp:
                return @"GP";
            case AWSwafGeoMatchConstraintValueGu:
                return @"GU";
            case AWSwafGeoMatchConstraintValueGT:
                return @"GT";
            case AWSwafGeoMatchConstraintValueGg:
                return @"GG";
            case AWSwafGeoMatchConstraintValueGn:
                return @"GN";
            case AWSwafGeoMatchConstraintValueGw:
                return @"GW";
            case AWSwafGeoMatchConstraintValueGy:
                return @"GY";
            case AWSwafGeoMatchConstraintValueHt:
                return @"HT";
            case AWSwafGeoMatchConstraintValueHm:
                return @"HM";
            case AWSwafGeoMatchConstraintValueVa:
                return @"VA";
            case AWSwafGeoMatchConstraintValueHn:
                return @"HN";
            case AWSwafGeoMatchConstraintValueHk:
                return @"HK";
            case AWSwafGeoMatchConstraintValueHu:
                return @"HU";
            case AWSwafGeoMatchConstraintValueIs:
                return @"IS";
            case AWSwafGeoMatchConstraintValueIN:
                return @"IN";
            case AWSwafGeoMatchConstraintValueId:
                return @"ID";
            case AWSwafGeoMatchConstraintValueIr:
                return @"IR";
            case AWSwafGeoMatchConstraintValueIq:
                return @"IQ";
            case AWSwafGeoMatchConstraintValueIe:
                return @"IE";
            case AWSwafGeoMatchConstraintValueIm:
                return @"IM";
            case AWSwafGeoMatchConstraintValueIl:
                return @"IL";
            case AWSwafGeoMatchConstraintValueIt:
                return @"IT";
            case AWSwafGeoMatchConstraintValueJm:
                return @"JM";
            case AWSwafGeoMatchConstraintValueJp:
                return @"JP";
            case AWSwafGeoMatchConstraintValueJe:
                return @"JE";
            case AWSwafGeoMatchConstraintValueJo:
                return @"JO";
            case AWSwafGeoMatchConstraintValueKz:
                return @"KZ";
            case AWSwafGeoMatchConstraintValueKe:
                return @"KE";
            case AWSwafGeoMatchConstraintValueKi:
                return @"KI";
            case AWSwafGeoMatchConstraintValueKp:
                return @"KP";
            case AWSwafGeoMatchConstraintValueKr:
                return @"KR";
            case AWSwafGeoMatchConstraintValueKw:
                return @"KW";
            case AWSwafGeoMatchConstraintValueKg:
                return @"KG";
            case AWSwafGeoMatchConstraintValueLa:
                return @"LA";
            case AWSwafGeoMatchConstraintValueLv:
                return @"LV";
            case AWSwafGeoMatchConstraintValueLb:
                return @"LB";
            case AWSwafGeoMatchConstraintValueLs:
                return @"LS";
            case AWSwafGeoMatchConstraintValueLr:
                return @"LR";
            case AWSwafGeoMatchConstraintValueLy:
                return @"LY";
            case AWSwafGeoMatchConstraintValueLi:
                return @"LI";
            case AWSwafGeoMatchConstraintValueLT:
                return @"LT";
            case AWSwafGeoMatchConstraintValueLu:
                return @"LU";
            case AWSwafGeoMatchConstraintValueMo:
                return @"MO";
            case AWSwafGeoMatchConstraintValueMk:
                return @"MK";
            case AWSwafGeoMatchConstraintValueMg:
                return @"MG";
            case AWSwafGeoMatchConstraintValueMw:
                return @"MW";
            case AWSwafGeoMatchConstraintValueMy:
                return @"MY";
            case AWSwafGeoMatchConstraintValueMv:
                return @"MV";
            case AWSwafGeoMatchConstraintValueMl:
                return @"ML";
            case AWSwafGeoMatchConstraintValueMt:
                return @"MT";
            case AWSwafGeoMatchConstraintValueMh:
                return @"MH";
            case AWSwafGeoMatchConstraintValueMq:
                return @"MQ";
            case AWSwafGeoMatchConstraintValueMr:
                return @"MR";
            case AWSwafGeoMatchConstraintValueMu:
                return @"MU";
            case AWSwafGeoMatchConstraintValueYt:
                return @"YT";
            case AWSwafGeoMatchConstraintValueMx:
                return @"MX";
            case AWSwafGeoMatchConstraintValueFm:
                return @"FM";
            case AWSwafGeoMatchConstraintValueMd:
                return @"MD";
            case AWSwafGeoMatchConstraintValueMc:
                return @"MC";
            case AWSwafGeoMatchConstraintValueMn:
                return @"MN";
            case AWSwafGeoMatchConstraintValueMe:
                return @"ME";
            case AWSwafGeoMatchConstraintValueMs:
                return @"MS";
            case AWSwafGeoMatchConstraintValueMa:
                return @"MA";
            case AWSwafGeoMatchConstraintValueMz:
                return @"MZ";
            case AWSwafGeoMatchConstraintValueMm:
                return @"MM";
            case AWSwafGeoMatchConstraintValueNa:
                return @"NA";
            case AWSwafGeoMatchConstraintValueNr:
                return @"NR";
            case AWSwafGeoMatchConstraintValueNp:
                return @"NP";
            case AWSwafGeoMatchConstraintValueNl:
                return @"NL";
            case AWSwafGeoMatchConstraintValueNc:
                return @"NC";
            case AWSwafGeoMatchConstraintValueNz:
                return @"NZ";
            case AWSwafGeoMatchConstraintValueNi:
                return @"NI";
            case AWSwafGeoMatchConstraintValueNE:
                return @"NE";
            case AWSwafGeoMatchConstraintValueNg:
                return @"NG";
            case AWSwafGeoMatchConstraintValueNu:
                return @"NU";
            case AWSwafGeoMatchConstraintValueNf:
                return @"NF";
            case AWSwafGeoMatchConstraintValueMp:
                return @"MP";
            case AWSwafGeoMatchConstraintValueNo:
                return @"NO";
            case AWSwafGeoMatchConstraintValueOm:
                return @"OM";
            case AWSwafGeoMatchConstraintValuePk:
                return @"PK";
            case AWSwafGeoMatchConstraintValuePw:
                return @"PW";
            case AWSwafGeoMatchConstraintValuePs:
                return @"PS";
            case AWSwafGeoMatchConstraintValuePa:
                return @"PA";
            case AWSwafGeoMatchConstraintValuePg:
                return @"PG";
            case AWSwafGeoMatchConstraintValuePy:
                return @"PY";
            case AWSwafGeoMatchConstraintValuePe:
                return @"PE";
            case AWSwafGeoMatchConstraintValuePh:
                return @"PH";
            case AWSwafGeoMatchConstraintValuePn:
                return @"PN";
            case AWSwafGeoMatchConstraintValuePl:
                return @"PL";
            case AWSwafGeoMatchConstraintValuePt:
                return @"PT";
            case AWSwafGeoMatchConstraintValuePr:
                return @"PR";
            case AWSwafGeoMatchConstraintValueQa:
                return @"QA";
            case AWSwafGeoMatchConstraintValueRe:
                return @"RE";
            case AWSwafGeoMatchConstraintValueRo:
                return @"RO";
            case AWSwafGeoMatchConstraintValueRu:
                return @"RU";
            case AWSwafGeoMatchConstraintValueRw:
                return @"RW";
            case AWSwafGeoMatchConstraintValueBl:
                return @"BL";
            case AWSwafGeoMatchConstraintValueSh:
                return @"SH";
            case AWSwafGeoMatchConstraintValueKn:
                return @"KN";
            case AWSwafGeoMatchConstraintValueLc:
                return @"LC";
            case AWSwafGeoMatchConstraintValueMf:
                return @"MF";
            case AWSwafGeoMatchConstraintValuePm:
                return @"PM";
            case AWSwafGeoMatchConstraintValueVc:
                return @"VC";
            case AWSwafGeoMatchConstraintValueWs:
                return @"WS";
            case AWSwafGeoMatchConstraintValueSm:
                return @"SM";
            case AWSwafGeoMatchConstraintValueSt:
                return @"ST";
            case AWSwafGeoMatchConstraintValueSa:
                return @"SA";
            case AWSwafGeoMatchConstraintValueSn:
                return @"SN";
            case AWSwafGeoMatchConstraintValueRs:
                return @"RS";
            case AWSwafGeoMatchConstraintValueSc:
                return @"SC";
            case AWSwafGeoMatchConstraintValueSl:
                return @"SL";
            case AWSwafGeoMatchConstraintValueSg:
                return @"SG";
            case AWSwafGeoMatchConstraintValueSx:
                return @"SX";
            case AWSwafGeoMatchConstraintValueSk:
                return @"SK";
            case AWSwafGeoMatchConstraintValueSi:
                return @"SI";
            case AWSwafGeoMatchConstraintValueSb:
                return @"SB";
            case AWSwafGeoMatchConstraintValueSo:
                return @"SO";
            case AWSwafGeoMatchConstraintValueZa:
                return @"ZA";
            case AWSwafGeoMatchConstraintValueGs:
                return @"GS";
            case AWSwafGeoMatchConstraintValueSs:
                return @"SS";
            case AWSwafGeoMatchConstraintValueEs:
                return @"ES";
            case AWSwafGeoMatchConstraintValueLk:
                return @"LK";
            case AWSwafGeoMatchConstraintValueSd:
                return @"SD";
            case AWSwafGeoMatchConstraintValueSr:
                return @"SR";
            case AWSwafGeoMatchConstraintValueSj:
                return @"SJ";
            case AWSwafGeoMatchConstraintValueSz:
                return @"SZ";
            case AWSwafGeoMatchConstraintValueSe:
                return @"SE";
            case AWSwafGeoMatchConstraintValueCh:
                return @"CH";
            case AWSwafGeoMatchConstraintValueSy:
                return @"SY";
            case AWSwafGeoMatchConstraintValueTw:
                return @"TW";
            case AWSwafGeoMatchConstraintValueTj:
                return @"TJ";
            case AWSwafGeoMatchConstraintValueTz:
                return @"TZ";
            case AWSwafGeoMatchConstraintValueTh:
                return @"TH";
            case AWSwafGeoMatchConstraintValueTl:
                return @"TL";
            case AWSwafGeoMatchConstraintValueTg:
                return @"TG";
            case AWSwafGeoMatchConstraintValueTk:
                return @"TK";
            case AWSwafGeoMatchConstraintValueTo:
                return @"TO";
            case AWSwafGeoMatchConstraintValueTt:
                return @"TT";
            case AWSwafGeoMatchConstraintValueTn:
                return @"TN";
            case AWSwafGeoMatchConstraintValueTr:
                return @"TR";
            case AWSwafGeoMatchConstraintValueTm:
                return @"TM";
            case AWSwafGeoMatchConstraintValueTc:
                return @"TC";
            case AWSwafGeoMatchConstraintValueTv:
                return @"TV";
            case AWSwafGeoMatchConstraintValueUg:
                return @"UG";
            case AWSwafGeoMatchConstraintValueUa:
                return @"UA";
            case AWSwafGeoMatchConstraintValueAe:
                return @"AE";
            case AWSwafGeoMatchConstraintValueGb:
                return @"GB";
            case AWSwafGeoMatchConstraintValueUs:
                return @"US";
            case AWSwafGeoMatchConstraintValueUm:
                return @"UM";
            case AWSwafGeoMatchConstraintValueUy:
                return @"UY";
            case AWSwafGeoMatchConstraintValueUz:
                return @"UZ";
            case AWSwafGeoMatchConstraintValueVu:
                return @"VU";
            case AWSwafGeoMatchConstraintValueVe:
                return @"VE";
            case AWSwafGeoMatchConstraintValueVn:
                return @"VN";
            case AWSwafGeoMatchConstraintValueVg:
                return @"VG";
            case AWSwafGeoMatchConstraintValueVi:
                return @"VI";
            case AWSwafGeoMatchConstraintValueWf:
                return @"WF";
            case AWSwafGeoMatchConstraintValueEh:
                return @"EH";
            case AWSwafGeoMatchConstraintValueYe:
                return @"YE";
            case AWSwafGeoMatchConstraintValueZm:
                return @"ZM";
            case AWSwafGeoMatchConstraintValueZw:
                return @"ZW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwafGeoMatchSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"geoMatchConstraints" : @"GeoMatchConstraints",
             @"geoMatchSetId" : @"GeoMatchSetId",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)geoMatchConstraintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafGeoMatchConstraint class]];
}

@end

@implementation AWSwafGeoMatchSetSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"geoMatchSetId" : @"GeoMatchSetId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSwafGeoMatchSetUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"geoMatchConstraint" : @"GeoMatchConstraint",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSwafChangeActionInsert);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSwafChangeActionDelete);
        }
        return @(AWSwafChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafChangeActionInsert:
                return @"INSERT";
            case AWSwafChangeActionDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)geoMatchConstraintJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafGeoMatchConstraint class]];
}

@end

@implementation AWSwafGetByteMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"byteMatchSetId" : @"ByteMatchSetId",
             };
}

@end

@implementation AWSwafGetByteMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"byteMatchSet" : @"ByteMatchSet",
             };
}

+ (NSValueTransformer *)byteMatchSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafByteMatchSet class]];
}

@end

@implementation AWSwafGetChangeTokenRequest

@end

@implementation AWSwafGetChangeTokenResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafGetChangeTokenStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafGetChangeTokenStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeTokenStatus" : @"ChangeTokenStatus",
             };
}

+ (NSValueTransformer *)changeTokenStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROVISIONED"] == NSOrderedSame) {
            return @(AWSwafChangeTokenStatusProvisioned);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSwafChangeTokenStatusPending);
        }
        if ([value caseInsensitiveCompare:@"INSYNC"] == NSOrderedSame) {
            return @(AWSwafChangeTokenStatusInsync);
        }
        return @(AWSwafChangeTokenStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafChangeTokenStatusProvisioned:
                return @"PROVISIONED";
            case AWSwafChangeTokenStatusPending:
                return @"PENDING";
            case AWSwafChangeTokenStatusInsync:
                return @"INSYNC";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwafGetGeoMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"geoMatchSetId" : @"GeoMatchSetId",
             };
}

@end

@implementation AWSwafGetGeoMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"geoMatchSet" : @"GeoMatchSet",
             };
}

+ (NSValueTransformer *)geoMatchSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafGeoMatchSet class]];
}

@end

@implementation AWSwafGetIPSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"IPSetId" : @"IPSetId",
             };
}

@end

@implementation AWSwafGetIPSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"IPSet" : @"IPSet",
             };
}

+ (NSValueTransformer *)IPSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafIPSet class]];
}

@end

@implementation AWSwafGetLoggingConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSwafGetLoggingConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loggingConfiguration" : @"LoggingConfiguration",
             };
}

+ (NSValueTransformer *)loggingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafLoggingConfiguration class]];
}

@end

@implementation AWSwafGetPermissionPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSwafGetPermissionPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             };
}

@end

@implementation AWSwafGetRateBasedRuleManagedKeysRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"ruleId" : @"RuleId",
             };
}

@end

@implementation AWSwafGetRateBasedRuleManagedKeysResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"managedKeys" : @"ManagedKeys",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwafGetRateBasedRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleId" : @"RuleId",
             };
}

@end

@implementation AWSwafGetRateBasedRuleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rule" : @"Rule",
             };
}

+ (NSValueTransformer *)ruleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafRateBasedRule class]];
}

@end

@implementation AWSwafGetRegexMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regexMatchSetId" : @"RegexMatchSetId",
             };
}

@end

@implementation AWSwafGetRegexMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regexMatchSet" : @"RegexMatchSet",
             };
}

+ (NSValueTransformer *)regexMatchSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafRegexMatchSet class]];
}

@end

@implementation AWSwafGetRegexPatternSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regexPatternSetId" : @"RegexPatternSetId",
             };
}

@end

@implementation AWSwafGetRegexPatternSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regexPatternSet" : @"RegexPatternSet",
             };
}

+ (NSValueTransformer *)regexPatternSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafRegexPatternSet class]];
}

@end

@implementation AWSwafGetRuleGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleGroupId" : @"RuleGroupId",
             };
}

@end

@implementation AWSwafGetRuleGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleGroup" : @"RuleGroup",
             };
}

+ (NSValueTransformer *)ruleGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafRuleGroup class]];
}

@end

@implementation AWSwafGetRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleId" : @"RuleId",
             };
}

@end

@implementation AWSwafGetRuleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rule" : @"Rule",
             };
}

+ (NSValueTransformer *)ruleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafRule class]];
}

@end

@implementation AWSwafGetSampledRequestsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxItems" : @"MaxItems",
             @"ruleId" : @"RuleId",
             @"timeWindow" : @"TimeWindow",
             @"webAclId" : @"WebAclId",
             };
}

+ (NSValueTransformer *)timeWindowJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafTimeWindow class]];
}

@end

@implementation AWSwafGetSampledRequestsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"populationSize" : @"PopulationSize",
             @"sampledRequests" : @"SampledRequests",
             @"timeWindow" : @"TimeWindow",
             };
}

+ (NSValueTransformer *)sampledRequestsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafSampledHTTPRequest class]];
}

+ (NSValueTransformer *)timeWindowJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafTimeWindow class]];
}

@end

@implementation AWSwafGetSizeConstraintSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sizeConstraintSetId" : @"SizeConstraintSetId",
             };
}

@end

@implementation AWSwafGetSizeConstraintSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sizeConstraintSet" : @"SizeConstraintSet",
             };
}

+ (NSValueTransformer *)sizeConstraintSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafSizeConstraintSet class]];
}

@end

@implementation AWSwafGetSqlInjectionMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sqlInjectionMatchSetId" : @"SqlInjectionMatchSetId",
             };
}

@end

@implementation AWSwafGetSqlInjectionMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sqlInjectionMatchSet" : @"SqlInjectionMatchSet",
             };
}

+ (NSValueTransformer *)sqlInjectionMatchSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafSqlInjectionMatchSet class]];
}

@end

@implementation AWSwafGetWebACLRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"webACLId" : @"WebACLId",
             };
}

@end

@implementation AWSwafGetWebACLResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"webACL" : @"WebACL",
             };
}

+ (NSValueTransformer *)webACLJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafWebACL class]];
}

@end

@implementation AWSwafGetXssMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"xssMatchSetId" : @"XssMatchSetId",
             };
}

@end

@implementation AWSwafGetXssMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"xssMatchSet" : @"XssMatchSet",
             };
}

+ (NSValueTransformer *)xssMatchSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafXssMatchSet class]];
}

@end

@implementation AWSwafHTTPHeader

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSwafHTTPRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientIP" : @"ClientIP",
             @"country" : @"Country",
             @"HTTPVersion" : @"HTTPVersion",
             @"headers" : @"Headers",
             @"method" : @"Method",
             @"URI" : @"URI",
             };
}

+ (NSValueTransformer *)headersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafHTTPHeader class]];
}

@end

@implementation AWSwafIPSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"IPSetDescriptors" : @"IPSetDescriptors",
             @"IPSetId" : @"IPSetId",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)IPSetDescriptorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafIPSetDescriptor class]];
}

@end

@implementation AWSwafIPSetDescriptor

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IPV4"] == NSOrderedSame) {
            return @(AWSwafIPSetDescriptorTypeIpv4);
        }
        if ([value caseInsensitiveCompare:@"IPV6"] == NSOrderedSame) {
            return @(AWSwafIPSetDescriptorTypeIpv6);
        }
        return @(AWSwafIPSetDescriptorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafIPSetDescriptorTypeIpv4:
                return @"IPV4";
            case AWSwafIPSetDescriptorTypeIpv6:
                return @"IPV6";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwafIPSetSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"IPSetId" : @"IPSetId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSwafIPSetUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"IPSetDescriptor" : @"IPSetDescriptor",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSwafChangeActionInsert);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSwafChangeActionDelete);
        }
        return @(AWSwafChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafChangeActionInsert:
                return @"INSERT";
            case AWSwafChangeActionDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)IPSetDescriptorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafIPSetDescriptor class]];
}

@end

@implementation AWSwafListActivatedRulesInRuleGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             @"ruleGroupId" : @"RuleGroupId",
             };
}

@end

@implementation AWSwafListActivatedRulesInRuleGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activatedRules" : @"ActivatedRules",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)activatedRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafActivatedRule class]];
}

@end

@implementation AWSwafListByteMatchSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwafListByteMatchSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"byteMatchSets" : @"ByteMatchSets",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)byteMatchSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafByteMatchSetSummary class]];
}

@end

@implementation AWSwafListGeoMatchSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwafListGeoMatchSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"geoMatchSets" : @"GeoMatchSets",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)geoMatchSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafGeoMatchSetSummary class]];
}

@end

@implementation AWSwafListIPSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwafListIPSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"IPSets" : @"IPSets",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)IPSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafIPSetSummary class]];
}

@end

@implementation AWSwafListLoggingConfigurationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwafListLoggingConfigurationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loggingConfigurations" : @"LoggingConfigurations",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)loggingConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafLoggingConfiguration class]];
}

@end

@implementation AWSwafListRateBasedRulesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwafListRateBasedRulesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafRuleSummary class]];
}

@end

@implementation AWSwafListRegexMatchSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwafListRegexMatchSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"regexMatchSets" : @"RegexMatchSets",
             };
}

+ (NSValueTransformer *)regexMatchSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafRegexMatchSetSummary class]];
}

@end

@implementation AWSwafListRegexPatternSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwafListRegexPatternSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"regexPatternSets" : @"RegexPatternSets",
             };
}

+ (NSValueTransformer *)regexPatternSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafRegexPatternSetSummary class]];
}

@end

@implementation AWSwafListRuleGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwafListRuleGroupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"ruleGroups" : @"RuleGroups",
             };
}

+ (NSValueTransformer *)ruleGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafRuleGroupSummary class]];
}

@end

@implementation AWSwafListRulesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwafListRulesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafRuleSummary class]];
}

@end

@implementation AWSwafListSizeConstraintSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwafListSizeConstraintSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"sizeConstraintSets" : @"SizeConstraintSets",
             };
}

+ (NSValueTransformer *)sizeConstraintSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafSizeConstraintSetSummary class]];
}

@end

@implementation AWSwafListSqlInjectionMatchSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwafListSqlInjectionMatchSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"sqlInjectionMatchSets" : @"SqlInjectionMatchSets",
             };
}

+ (NSValueTransformer *)sqlInjectionMatchSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafSqlInjectionMatchSetSummary class]];
}

@end

@implementation AWSwafListSubscribedRuleGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwafListSubscribedRuleGroupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"ruleGroups" : @"RuleGroups",
             };
}

+ (NSValueTransformer *)ruleGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafSubscribedRuleGroupSummary class]];
}

@end

@implementation AWSwafListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             @"resourceARN" : @"ResourceARN",
             };
}

@end

@implementation AWSwafListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"tagInfoForResource" : @"TagInfoForResource",
             };
}

+ (NSValueTransformer *)tagInfoForResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafTagInfoForResource class]];
}

@end

@implementation AWSwafListWebACLsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwafListWebACLsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"webACLs" : @"WebACLs",
             };
}

+ (NSValueTransformer *)webACLsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafWebACLSummary class]];
}

@end

@implementation AWSwafListXssMatchSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwafListXssMatchSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"xssMatchSets" : @"XssMatchSets",
             };
}

+ (NSValueTransformer *)xssMatchSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafXssMatchSetSummary class]];
}

@end

@implementation AWSwafLoggingConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logDestinationConfigs" : @"LogDestinationConfigs",
             @"redactedFields" : @"RedactedFields",
             @"resourceArn" : @"ResourceArn",
             };
}

+ (NSValueTransformer *)redactedFieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafFieldToMatch class]];
}

@end

@implementation AWSwafPredicate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataId" : @"DataId",
             @"negated" : @"Negated",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IPMatch"] == NSOrderedSame) {
            return @(AWSwafPredicateTypeIPMatch);
        }
        if ([value caseInsensitiveCompare:@"ByteMatch"] == NSOrderedSame) {
            return @(AWSwafPredicateTypeByteMatch);
        }
        if ([value caseInsensitiveCompare:@"SqlInjectionMatch"] == NSOrderedSame) {
            return @(AWSwafPredicateTypeSqlInjectionMatch);
        }
        if ([value caseInsensitiveCompare:@"GeoMatch"] == NSOrderedSame) {
            return @(AWSwafPredicateTypeGeoMatch);
        }
        if ([value caseInsensitiveCompare:@"SizeConstraint"] == NSOrderedSame) {
            return @(AWSwafPredicateTypeSizeConstraint);
        }
        if ([value caseInsensitiveCompare:@"XssMatch"] == NSOrderedSame) {
            return @(AWSwafPredicateTypeXssMatch);
        }
        if ([value caseInsensitiveCompare:@"RegexMatch"] == NSOrderedSame) {
            return @(AWSwafPredicateTypeRegexMatch);
        }
        return @(AWSwafPredicateTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafPredicateTypeIPMatch:
                return @"IPMatch";
            case AWSwafPredicateTypeByteMatch:
                return @"ByteMatch";
            case AWSwafPredicateTypeSqlInjectionMatch:
                return @"SqlInjectionMatch";
            case AWSwafPredicateTypeGeoMatch:
                return @"GeoMatch";
            case AWSwafPredicateTypeSizeConstraint:
                return @"SizeConstraint";
            case AWSwafPredicateTypeXssMatch:
                return @"XssMatch";
            case AWSwafPredicateTypeRegexMatch:
                return @"RegexMatch";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwafPutLoggingConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loggingConfiguration" : @"LoggingConfiguration",
             };
}

+ (NSValueTransformer *)loggingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafLoggingConfiguration class]];
}

@end

@implementation AWSwafPutLoggingConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loggingConfiguration" : @"LoggingConfiguration",
             };
}

+ (NSValueTransformer *)loggingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafLoggingConfiguration class]];
}

@end

@implementation AWSwafPutPermissionPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSwafPutPermissionPolicyResponse

@end

@implementation AWSwafRateBasedRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"matchPredicates" : @"MatchPredicates",
             @"metricName" : @"MetricName",
             @"name" : @"Name",
             @"rateKey" : @"RateKey",
             @"rateLimit" : @"RateLimit",
             @"ruleId" : @"RuleId",
             };
}

+ (NSValueTransformer *)matchPredicatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafPredicate class]];
}

+ (NSValueTransformer *)rateKeyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IP"] == NSOrderedSame) {
            return @(AWSwafRateKeyIp);
        }
        return @(AWSwafRateKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafRateKeyIp:
                return @"IP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwafRegexMatchSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"regexMatchSetId" : @"RegexMatchSetId",
             @"regexMatchTuples" : @"RegexMatchTuples",
             };
}

+ (NSValueTransformer *)regexMatchTuplesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafRegexMatchTuple class]];
}

@end

@implementation AWSwafRegexMatchSetSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"regexMatchSetId" : @"RegexMatchSetId",
             };
}

@end

@implementation AWSwafRegexMatchSetUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"regexMatchTuple" : @"RegexMatchTuple",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSwafChangeActionInsert);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSwafChangeActionDelete);
        }
        return @(AWSwafChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafChangeActionInsert:
                return @"INSERT";
            case AWSwafChangeActionDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)regexMatchTupleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafRegexMatchTuple class]];
}

@end

@implementation AWSwafRegexMatchTuple

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fieldToMatch" : @"FieldToMatch",
             @"regexPatternSetId" : @"RegexPatternSetId",
             @"textTransformation" : @"TextTransformation",
             };
}

+ (NSValueTransformer *)fieldToMatchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafFieldToMatch class]];
}

+ (NSValueTransformer *)textTransformationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationNone);
        }
        if ([value caseInsensitiveCompare:@"COMPRESS_WHITE_SPACE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationCompressWhiteSpace);
        }
        if ([value caseInsensitiveCompare:@"HTML_ENTITY_DECODE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationHtmlEntityDecode);
        }
        if ([value caseInsensitiveCompare:@"LOWERCASE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationLowercase);
        }
        if ([value caseInsensitiveCompare:@"CMD_LINE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationCmdLine);
        }
        if ([value caseInsensitiveCompare:@"URL_DECODE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationUrlDecode);
        }
        return @(AWSwafTextTransformationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafTextTransformationNone:
                return @"NONE";
            case AWSwafTextTransformationCompressWhiteSpace:
                return @"COMPRESS_WHITE_SPACE";
            case AWSwafTextTransformationHtmlEntityDecode:
                return @"HTML_ENTITY_DECODE";
            case AWSwafTextTransformationLowercase:
                return @"LOWERCASE";
            case AWSwafTextTransformationCmdLine:
                return @"CMD_LINE";
            case AWSwafTextTransformationUrlDecode:
                return @"URL_DECODE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwafRegexPatternSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"regexPatternSetId" : @"RegexPatternSetId",
             @"regexPatternStrings" : @"RegexPatternStrings",
             };
}

@end

@implementation AWSwafRegexPatternSetSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"regexPatternSetId" : @"RegexPatternSetId",
             };
}

@end

@implementation AWSwafRegexPatternSetUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"regexPatternString" : @"RegexPatternString",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSwafChangeActionInsert);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSwafChangeActionDelete);
        }
        return @(AWSwafChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafChangeActionInsert:
                return @"INSERT";
            case AWSwafChangeActionDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwafRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricName" : @"MetricName",
             @"name" : @"Name",
             @"predicates" : @"Predicates",
             @"ruleId" : @"RuleId",
             };
}

+ (NSValueTransformer *)predicatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafPredicate class]];
}

@end

@implementation AWSwafRuleGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricName" : @"MetricName",
             @"name" : @"Name",
             @"ruleGroupId" : @"RuleGroupId",
             };
}

@end

@implementation AWSwafRuleGroupSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"ruleGroupId" : @"RuleGroupId",
             };
}

@end

@implementation AWSwafRuleGroupUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"activatedRule" : @"ActivatedRule",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSwafChangeActionInsert);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSwafChangeActionDelete);
        }
        return @(AWSwafChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafChangeActionInsert:
                return @"INSERT";
            case AWSwafChangeActionDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)activatedRuleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafActivatedRule class]];
}

@end

@implementation AWSwafRuleSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"ruleId" : @"RuleId",
             };
}

@end

@implementation AWSwafRuleUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"predicate" : @"Predicate",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSwafChangeActionInsert);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSwafChangeActionDelete);
        }
        return @(AWSwafChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafChangeActionInsert:
                return @"INSERT";
            case AWSwafChangeActionDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)predicateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafPredicate class]];
}

@end

@implementation AWSwafSampledHTTPRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"request" : @"Request",
             @"ruleWithinRuleGroup" : @"RuleWithinRuleGroup",
             @"timestamp" : @"Timestamp",
             @"weight" : @"Weight",
             };
}

+ (NSValueTransformer *)requestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafHTTPRequest class]];
}

+ (NSValueTransformer *)timestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSwafSizeConstraint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comparisonOperator" : @"ComparisonOperator",
             @"fieldToMatch" : @"FieldToMatch",
             @"size" : @"Size",
             @"textTransformation" : @"TextTransformation",
             };
}

+ (NSValueTransformer *)comparisonOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EQ"] == NSOrderedSame) {
            return @(AWSwafComparisonOperatorEQ);
        }
        if ([value caseInsensitiveCompare:@"NE"] == NSOrderedSame) {
            return @(AWSwafComparisonOperatorNE);
        }
        if ([value caseInsensitiveCompare:@"LE"] == NSOrderedSame) {
            return @(AWSwafComparisonOperatorLE);
        }
        if ([value caseInsensitiveCompare:@"LT"] == NSOrderedSame) {
            return @(AWSwafComparisonOperatorLT);
        }
        if ([value caseInsensitiveCompare:@"GE"] == NSOrderedSame) {
            return @(AWSwafComparisonOperatorGE);
        }
        if ([value caseInsensitiveCompare:@"GT"] == NSOrderedSame) {
            return @(AWSwafComparisonOperatorGT);
        }
        return @(AWSwafComparisonOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafComparisonOperatorEQ:
                return @"EQ";
            case AWSwafComparisonOperatorNE:
                return @"NE";
            case AWSwafComparisonOperatorLE:
                return @"LE";
            case AWSwafComparisonOperatorLT:
                return @"LT";
            case AWSwafComparisonOperatorGE:
                return @"GE";
            case AWSwafComparisonOperatorGT:
                return @"GT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)fieldToMatchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafFieldToMatch class]];
}

+ (NSValueTransformer *)textTransformationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationNone);
        }
        if ([value caseInsensitiveCompare:@"COMPRESS_WHITE_SPACE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationCompressWhiteSpace);
        }
        if ([value caseInsensitiveCompare:@"HTML_ENTITY_DECODE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationHtmlEntityDecode);
        }
        if ([value caseInsensitiveCompare:@"LOWERCASE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationLowercase);
        }
        if ([value caseInsensitiveCompare:@"CMD_LINE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationCmdLine);
        }
        if ([value caseInsensitiveCompare:@"URL_DECODE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationUrlDecode);
        }
        return @(AWSwafTextTransformationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafTextTransformationNone:
                return @"NONE";
            case AWSwafTextTransformationCompressWhiteSpace:
                return @"COMPRESS_WHITE_SPACE";
            case AWSwafTextTransformationHtmlEntityDecode:
                return @"HTML_ENTITY_DECODE";
            case AWSwafTextTransformationLowercase:
                return @"LOWERCASE";
            case AWSwafTextTransformationCmdLine:
                return @"CMD_LINE";
            case AWSwafTextTransformationUrlDecode:
                return @"URL_DECODE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwafSizeConstraintSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"sizeConstraintSetId" : @"SizeConstraintSetId",
             @"sizeConstraints" : @"SizeConstraints",
             };
}

+ (NSValueTransformer *)sizeConstraintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafSizeConstraint class]];
}

@end

@implementation AWSwafSizeConstraintSetSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"sizeConstraintSetId" : @"SizeConstraintSetId",
             };
}

@end

@implementation AWSwafSizeConstraintSetUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"sizeConstraint" : @"SizeConstraint",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSwafChangeActionInsert);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSwafChangeActionDelete);
        }
        return @(AWSwafChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafChangeActionInsert:
                return @"INSERT";
            case AWSwafChangeActionDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sizeConstraintJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafSizeConstraint class]];
}

@end

@implementation AWSwafSqlInjectionMatchSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"sqlInjectionMatchSetId" : @"SqlInjectionMatchSetId",
             @"sqlInjectionMatchTuples" : @"SqlInjectionMatchTuples",
             };
}

+ (NSValueTransformer *)sqlInjectionMatchTuplesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafSqlInjectionMatchTuple class]];
}

@end

@implementation AWSwafSqlInjectionMatchSetSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"sqlInjectionMatchSetId" : @"SqlInjectionMatchSetId",
             };
}

@end

@implementation AWSwafSqlInjectionMatchSetUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"sqlInjectionMatchTuple" : @"SqlInjectionMatchTuple",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSwafChangeActionInsert);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSwafChangeActionDelete);
        }
        return @(AWSwafChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafChangeActionInsert:
                return @"INSERT";
            case AWSwafChangeActionDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sqlInjectionMatchTupleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafSqlInjectionMatchTuple class]];
}

@end

@implementation AWSwafSqlInjectionMatchTuple

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fieldToMatch" : @"FieldToMatch",
             @"textTransformation" : @"TextTransformation",
             };
}

+ (NSValueTransformer *)fieldToMatchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafFieldToMatch class]];
}

+ (NSValueTransformer *)textTransformationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationNone);
        }
        if ([value caseInsensitiveCompare:@"COMPRESS_WHITE_SPACE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationCompressWhiteSpace);
        }
        if ([value caseInsensitiveCompare:@"HTML_ENTITY_DECODE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationHtmlEntityDecode);
        }
        if ([value caseInsensitiveCompare:@"LOWERCASE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationLowercase);
        }
        if ([value caseInsensitiveCompare:@"CMD_LINE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationCmdLine);
        }
        if ([value caseInsensitiveCompare:@"URL_DECODE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationUrlDecode);
        }
        return @(AWSwafTextTransformationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafTextTransformationNone:
                return @"NONE";
            case AWSwafTextTransformationCompressWhiteSpace:
                return @"COMPRESS_WHITE_SPACE";
            case AWSwafTextTransformationHtmlEntityDecode:
                return @"HTML_ENTITY_DECODE";
            case AWSwafTextTransformationLowercase:
                return @"LOWERCASE";
            case AWSwafTextTransformationCmdLine:
                return @"CMD_LINE";
            case AWSwafTextTransformationUrlDecode:
                return @"URL_DECODE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwafSubscribedRuleGroupSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricName" : @"MetricName",
             @"name" : @"Name",
             @"ruleGroupId" : @"RuleGroupId",
             };
}

@end

@implementation AWSwafTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSwafTagInfoForResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tagList" : @"TagList",
             };
}

+ (NSValueTransformer *)tagListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafTag class]];
}

@end

@implementation AWSwafTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafTag class]];
}

@end

@implementation AWSwafTagResourceResponse

@end

@implementation AWSwafTimeWindow

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"EndTime",
             @"startTime" : @"StartTime",
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

@implementation AWSwafUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSwafUntagResourceResponse

@end

@implementation AWSwafUpdateByteMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"byteMatchSetId" : @"ByteMatchSetId",
             @"changeToken" : @"ChangeToken",
             @"updates" : @"Updates",
             };
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafByteMatchSetUpdate class]];
}

@end

@implementation AWSwafUpdateByteMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafUpdateGeoMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"geoMatchSetId" : @"GeoMatchSetId",
             @"updates" : @"Updates",
             };
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafGeoMatchSetUpdate class]];
}

@end

@implementation AWSwafUpdateGeoMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafUpdateIPSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"IPSetId" : @"IPSetId",
             @"updates" : @"Updates",
             };
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafIPSetUpdate class]];
}

@end

@implementation AWSwafUpdateIPSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafUpdateRateBasedRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"rateLimit" : @"RateLimit",
             @"ruleId" : @"RuleId",
             @"updates" : @"Updates",
             };
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafRuleUpdate class]];
}

@end

@implementation AWSwafUpdateRateBasedRuleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafUpdateRegexMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"regexMatchSetId" : @"RegexMatchSetId",
             @"updates" : @"Updates",
             };
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafRegexMatchSetUpdate class]];
}

@end

@implementation AWSwafUpdateRegexMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafUpdateRegexPatternSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"regexPatternSetId" : @"RegexPatternSetId",
             @"updates" : @"Updates",
             };
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafRegexPatternSetUpdate class]];
}

@end

@implementation AWSwafUpdateRegexPatternSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafUpdateRuleGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"ruleGroupId" : @"RuleGroupId",
             @"updates" : @"Updates",
             };
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafRuleGroupUpdate class]];
}

@end

@implementation AWSwafUpdateRuleGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafUpdateRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"ruleId" : @"RuleId",
             @"updates" : @"Updates",
             };
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafRuleUpdate class]];
}

@end

@implementation AWSwafUpdateRuleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafUpdateSizeConstraintSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"sizeConstraintSetId" : @"SizeConstraintSetId",
             @"updates" : @"Updates",
             };
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafSizeConstraintSetUpdate class]];
}

@end

@implementation AWSwafUpdateSizeConstraintSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafUpdateSqlInjectionMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"sqlInjectionMatchSetId" : @"SqlInjectionMatchSetId",
             @"updates" : @"Updates",
             };
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafSqlInjectionMatchSetUpdate class]];
}

@end

@implementation AWSwafUpdateSqlInjectionMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafUpdateWebACLRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"defaultAction" : @"DefaultAction",
             @"updates" : @"Updates",
             @"webACLId" : @"WebACLId",
             };
}

+ (NSValueTransformer *)defaultActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafWafAction class]];
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafWebACLUpdate class]];
}

@end

@implementation AWSwafUpdateWebACLResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafUpdateXssMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"updates" : @"Updates",
             @"xssMatchSetId" : @"XssMatchSetId",
             };
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafXssMatchSetUpdate class]];
}

@end

@implementation AWSwafUpdateXssMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwafWafAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLOCK"] == NSOrderedSame) {
            return @(AWSwafWafActionTypeBlock);
        }
        if ([value caseInsensitiveCompare:@"ALLOW"] == NSOrderedSame) {
            return @(AWSwafWafActionTypeAllow);
        }
        if ([value caseInsensitiveCompare:@"COUNT"] == NSOrderedSame) {
            return @(AWSwafWafActionTypeCount);
        }
        return @(AWSwafWafActionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafWafActionTypeBlock:
                return @"BLOCK";
            case AWSwafWafActionTypeAllow:
                return @"ALLOW";
            case AWSwafWafActionTypeCount:
                return @"COUNT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwafWafOverrideAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSwafWafOverrideActionTypeNone);
        }
        if ([value caseInsensitiveCompare:@"COUNT"] == NSOrderedSame) {
            return @(AWSwafWafOverrideActionTypeCount);
        }
        return @(AWSwafWafOverrideActionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafWafOverrideActionTypeNone:
                return @"NONE";
            case AWSwafWafOverrideActionTypeCount:
                return @"COUNT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwafWebACL

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultAction" : @"DefaultAction",
             @"metricName" : @"MetricName",
             @"name" : @"Name",
             @"rules" : @"Rules",
             @"webACLArn" : @"WebACLArn",
             @"webACLId" : @"WebACLId",
             };
}

+ (NSValueTransformer *)defaultActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafWafAction class]];
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafActivatedRule class]];
}

@end

@implementation AWSwafWebACLSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"webACLId" : @"WebACLId",
             };
}

@end

@implementation AWSwafWebACLUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"activatedRule" : @"ActivatedRule",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSwafChangeActionInsert);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSwafChangeActionDelete);
        }
        return @(AWSwafChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafChangeActionInsert:
                return @"INSERT";
            case AWSwafChangeActionDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)activatedRuleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafActivatedRule class]];
}

@end

@implementation AWSwafXssMatchSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"xssMatchSetId" : @"XssMatchSetId",
             @"xssMatchTuples" : @"XssMatchTuples",
             };
}

+ (NSValueTransformer *)xssMatchTuplesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwafXssMatchTuple class]];
}

@end

@implementation AWSwafXssMatchSetSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"xssMatchSetId" : @"XssMatchSetId",
             };
}

@end

@implementation AWSwafXssMatchSetUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"xssMatchTuple" : @"XssMatchTuple",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSwafChangeActionInsert);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSwafChangeActionDelete);
        }
        return @(AWSwafChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafChangeActionInsert:
                return @"INSERT";
            case AWSwafChangeActionDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)xssMatchTupleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafXssMatchTuple class]];
}

@end

@implementation AWSwafXssMatchTuple

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fieldToMatch" : @"FieldToMatch",
             @"textTransformation" : @"TextTransformation",
             };
}

+ (NSValueTransformer *)fieldToMatchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwafFieldToMatch class]];
}

+ (NSValueTransformer *)textTransformationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationNone);
        }
        if ([value caseInsensitiveCompare:@"COMPRESS_WHITE_SPACE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationCompressWhiteSpace);
        }
        if ([value caseInsensitiveCompare:@"HTML_ENTITY_DECODE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationHtmlEntityDecode);
        }
        if ([value caseInsensitiveCompare:@"LOWERCASE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationLowercase);
        }
        if ([value caseInsensitiveCompare:@"CMD_LINE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationCmdLine);
        }
        if ([value caseInsensitiveCompare:@"URL_DECODE"] == NSOrderedSame) {
            return @(AWSwafTextTransformationUrlDecode);
        }
        return @(AWSwafTextTransformationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwafTextTransformationNone:
                return @"NONE";
            case AWSwafTextTransformationCompressWhiteSpace:
                return @"COMPRESS_WHITE_SPACE";
            case AWSwafTextTransformationHtmlEntityDecode:
                return @"HTML_ENTITY_DECODE";
            case AWSwafTextTransformationLowercase:
                return @"LOWERCASE";
            case AWSwafTextTransformationCmdLine:
                return @"CMD_LINE";
            case AWSwafTextTransformationUrlDecode:
                return @"URL_DECODE";
            default:
                return nil;
        }
    }];
}

@end
