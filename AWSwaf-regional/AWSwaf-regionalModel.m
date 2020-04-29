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

#import "AWSwaf-regionalModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSwaf-regionalErrorDomain = @"com.amazonaws.AWSwaf-regionalErrorDomain";

@implementation AWSwaf-regionalActivatedRule

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalWafAction class]];
}

+ (NSValueTransformer *)excludedRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalExcludedRule class]];
}

+ (NSValueTransformer *)overrideActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalWafOverrideAction class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REGULAR"] == NSOrderedSame) {
            return @(AWSwaf-regionalWafRuleTypeRegular);
        }
        if ([value caseInsensitiveCompare:@"RATE_BASED"] == NSOrderedSame) {
            return @(AWSwaf-regionalWafRuleTypeRateBased);
        }
        if ([value caseInsensitiveCompare:@"GROUP"] == NSOrderedSame) {
            return @(AWSwaf-regionalWafRuleTypeGroup);
        }
        return @(AWSwaf-regionalWafRuleTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalWafRuleTypeRegular:
                return @"REGULAR";
            case AWSwaf-regionalWafRuleTypeRateBased:
                return @"RATE_BASED";
            case AWSwaf-regionalWafRuleTypeGroup:
                return @"GROUP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwaf-regionalAssociateWebACLRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"webACLId" : @"WebACLId",
             };
}

@end

@implementation AWSwaf-regionalAssociateWebACLResponse

@end

@implementation AWSwaf-regionalByteMatchSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"byteMatchSetId" : @"ByteMatchSetId",
             @"byteMatchTuples" : @"ByteMatchTuples",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)byteMatchTuplesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalByteMatchTuple class]];
}

@end

@implementation AWSwaf-regionalByteMatchSetSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"byteMatchSetId" : @"ByteMatchSetId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSwaf-regionalByteMatchSetUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"byteMatchTuple" : @"ByteMatchTuple",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeActionInsert);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeActionDelete);
        }
        return @(AWSwaf-regionalChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalChangeActionInsert:
                return @"INSERT";
            case AWSwaf-regionalChangeActionDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)byteMatchTupleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalByteMatchTuple class]];
}

@end

@implementation AWSwaf-regionalByteMatchTuple

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fieldToMatch" : @"FieldToMatch",
             @"positionalConstraint" : @"PositionalConstraint",
             @"targetString" : @"TargetString",
             @"textTransformation" : @"TextTransformation",
             };
}

+ (NSValueTransformer *)fieldToMatchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalFieldToMatch class]];
}

+ (NSValueTransformer *)positionalConstraintJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXACTLY"] == NSOrderedSame) {
            return @(AWSwaf-regionalPositionalConstraintExactly);
        }
        if ([value caseInsensitiveCompare:@"STARTS_WITH"] == NSOrderedSame) {
            return @(AWSwaf-regionalPositionalConstraintStartsWith);
        }
        if ([value caseInsensitiveCompare:@"ENDS_WITH"] == NSOrderedSame) {
            return @(AWSwaf-regionalPositionalConstraintEndsWith);
        }
        if ([value caseInsensitiveCompare:@"CONTAINS"] == NSOrderedSame) {
            return @(AWSwaf-regionalPositionalConstraintContains);
        }
        if ([value caseInsensitiveCompare:@"CONTAINS_WORD"] == NSOrderedSame) {
            return @(AWSwaf-regionalPositionalConstraintContainsWord);
        }
        return @(AWSwaf-regionalPositionalConstraintUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalPositionalConstraintExactly:
                return @"EXACTLY";
            case AWSwaf-regionalPositionalConstraintStartsWith:
                return @"STARTS_WITH";
            case AWSwaf-regionalPositionalConstraintEndsWith:
                return @"ENDS_WITH";
            case AWSwaf-regionalPositionalConstraintContains:
                return @"CONTAINS";
            case AWSwaf-regionalPositionalConstraintContainsWord:
                return @"CONTAINS_WORD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)textTransformationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationNone);
        }
        if ([value caseInsensitiveCompare:@"COMPRESS_WHITE_SPACE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationCompressWhiteSpace);
        }
        if ([value caseInsensitiveCompare:@"HTML_ENTITY_DECODE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationHtmlEntityDecode);
        }
        if ([value caseInsensitiveCompare:@"LOWERCASE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationLowercase);
        }
        if ([value caseInsensitiveCompare:@"CMD_LINE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationCmdLine);
        }
        if ([value caseInsensitiveCompare:@"URL_DECODE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationUrlDecode);
        }
        return @(AWSwaf-regionalTextTransformationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalTextTransformationNone:
                return @"NONE";
            case AWSwaf-regionalTextTransformationCompressWhiteSpace:
                return @"COMPRESS_WHITE_SPACE";
            case AWSwaf-regionalTextTransformationHtmlEntityDecode:
                return @"HTML_ENTITY_DECODE";
            case AWSwaf-regionalTextTransformationLowercase:
                return @"LOWERCASE";
            case AWSwaf-regionalTextTransformationCmdLine:
                return @"CMD_LINE";
            case AWSwaf-regionalTextTransformationUrlDecode:
                return @"URL_DECODE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwaf-regionalCreateByteMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"name" : @"Name",
             };
}

@end

@implementation AWSwaf-regionalCreateByteMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"byteMatchSet" : @"ByteMatchSet",
             @"changeToken" : @"ChangeToken",
             };
}

+ (NSValueTransformer *)byteMatchSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalByteMatchSet class]];
}

@end

@implementation AWSwaf-regionalCreateGeoMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"name" : @"Name",
             };
}

@end

@implementation AWSwaf-regionalCreateGeoMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"geoMatchSet" : @"GeoMatchSet",
             };
}

+ (NSValueTransformer *)geoMatchSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalGeoMatchSet class]];
}

@end

@implementation AWSwaf-regionalCreateIPSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"name" : @"Name",
             };
}

@end

@implementation AWSwaf-regionalCreateIPSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"IPSet" : @"IPSet",
             };
}

+ (NSValueTransformer *)IPSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalIPSet class]];
}

@end

@implementation AWSwaf-regionalCreateRateBasedRuleRequest

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
            return @(AWSwaf-regionalRateKeyIp);
        }
        return @(AWSwaf-regionalRateKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalRateKeyIp:
                return @"IP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalTag class]];
}

@end

@implementation AWSwaf-regionalCreateRateBasedRuleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"rule" : @"Rule",
             };
}

+ (NSValueTransformer *)ruleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalRateBasedRule class]];
}

@end

@implementation AWSwaf-regionalCreateRegexMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"name" : @"Name",
             };
}

@end

@implementation AWSwaf-regionalCreateRegexMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"regexMatchSet" : @"RegexMatchSet",
             };
}

+ (NSValueTransformer *)regexMatchSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalRegexMatchSet class]];
}

@end

@implementation AWSwaf-regionalCreateRegexPatternSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"name" : @"Name",
             };
}

@end

@implementation AWSwaf-regionalCreateRegexPatternSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"regexPatternSet" : @"RegexPatternSet",
             };
}

+ (NSValueTransformer *)regexPatternSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalRegexPatternSet class]];
}

@end

@implementation AWSwaf-regionalCreateRuleGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"metricName" : @"MetricName",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalTag class]];
}

@end

@implementation AWSwaf-regionalCreateRuleGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"ruleGroup" : @"RuleGroup",
             };
}

+ (NSValueTransformer *)ruleGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalRuleGroup class]];
}

@end

@implementation AWSwaf-regionalCreateRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"metricName" : @"MetricName",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalTag class]];
}

@end

@implementation AWSwaf-regionalCreateRuleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"rule" : @"Rule",
             };
}

+ (NSValueTransformer *)ruleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalRule class]];
}

@end

@implementation AWSwaf-regionalCreateSizeConstraintSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"name" : @"Name",
             };
}

@end

@implementation AWSwaf-regionalCreateSizeConstraintSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"sizeConstraintSet" : @"SizeConstraintSet",
             };
}

+ (NSValueTransformer *)sizeConstraintSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalSizeConstraintSet class]];
}

@end

@implementation AWSwaf-regionalCreateSqlInjectionMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"name" : @"Name",
             };
}

@end

@implementation AWSwaf-regionalCreateSqlInjectionMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"sqlInjectionMatchSet" : @"SqlInjectionMatchSet",
             };
}

+ (NSValueTransformer *)sqlInjectionMatchSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalSqlInjectionMatchSet class]];
}

@end

@implementation AWSwaf-regionalCreateWebACLMigrationStackRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ignoreUnsupportedType" : @"IgnoreUnsupportedType",
             @"s3BucketName" : @"S3BucketName",
             @"webACLId" : @"WebACLId",
             };
}

@end

@implementation AWSwaf-regionalCreateWebACLMigrationStackResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3ObjectUrl" : @"S3ObjectUrl",
             };
}

@end

@implementation AWSwaf-regionalCreateWebACLRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalWafAction class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalTag class]];
}

@end

@implementation AWSwaf-regionalCreateWebACLResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"webACL" : @"WebACL",
             };
}

+ (NSValueTransformer *)webACLJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalWebACL class]];
}

@end

@implementation AWSwaf-regionalCreateXssMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"name" : @"Name",
             };
}

@end

@implementation AWSwaf-regionalCreateXssMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"xssMatchSet" : @"XssMatchSet",
             };
}

+ (NSValueTransformer *)xssMatchSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalXssMatchSet class]];
}

@end

@implementation AWSwaf-regionalDeleteByteMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"byteMatchSetId" : @"ByteMatchSetId",
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalDeleteByteMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalDeleteGeoMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"geoMatchSetId" : @"GeoMatchSetId",
             };
}

@end

@implementation AWSwaf-regionalDeleteGeoMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalDeleteIPSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"IPSetId" : @"IPSetId",
             };
}

@end

@implementation AWSwaf-regionalDeleteIPSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalDeleteLoggingConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSwaf-regionalDeleteLoggingConfigurationResponse

@end

@implementation AWSwaf-regionalDeletePermissionPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSwaf-regionalDeletePermissionPolicyResponse

@end

@implementation AWSwaf-regionalDeleteRateBasedRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"ruleId" : @"RuleId",
             };
}

@end

@implementation AWSwaf-regionalDeleteRateBasedRuleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalDeleteRegexMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"regexMatchSetId" : @"RegexMatchSetId",
             };
}

@end

@implementation AWSwaf-regionalDeleteRegexMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalDeleteRegexPatternSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"regexPatternSetId" : @"RegexPatternSetId",
             };
}

@end

@implementation AWSwaf-regionalDeleteRegexPatternSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalDeleteRuleGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"ruleGroupId" : @"RuleGroupId",
             };
}

@end

@implementation AWSwaf-regionalDeleteRuleGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalDeleteRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"ruleId" : @"RuleId",
             };
}

@end

@implementation AWSwaf-regionalDeleteRuleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalDeleteSizeConstraintSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"sizeConstraintSetId" : @"SizeConstraintSetId",
             };
}

@end

@implementation AWSwaf-regionalDeleteSizeConstraintSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalDeleteSqlInjectionMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"sqlInjectionMatchSetId" : @"SqlInjectionMatchSetId",
             };
}

@end

@implementation AWSwaf-regionalDeleteSqlInjectionMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalDeleteWebACLRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"webACLId" : @"WebACLId",
             };
}

@end

@implementation AWSwaf-regionalDeleteWebACLResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalDeleteXssMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"xssMatchSetId" : @"XssMatchSetId",
             };
}

@end

@implementation AWSwaf-regionalDeleteXssMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalDisassociateWebACLRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSwaf-regionalDisassociateWebACLResponse

@end

@implementation AWSwaf-regionalExcludedRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleId" : @"RuleId",
             };
}

@end

@implementation AWSwaf-regionalFieldToMatch

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"Data",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"URI"] == NSOrderedSame) {
            return @(AWSwaf-regionalMatchFieldTypeUri);
        }
        if ([value caseInsensitiveCompare:@"QUERY_STRING"] == NSOrderedSame) {
            return @(AWSwaf-regionalMatchFieldTypeQueryString);
        }
        if ([value caseInsensitiveCompare:@"HEADER"] == NSOrderedSame) {
            return @(AWSwaf-regionalMatchFieldTypeHeader);
        }
        if ([value caseInsensitiveCompare:@"METHOD"] == NSOrderedSame) {
            return @(AWSwaf-regionalMatchFieldTypeMethod);
        }
        if ([value caseInsensitiveCompare:@"BODY"] == NSOrderedSame) {
            return @(AWSwaf-regionalMatchFieldTypeBody);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_QUERY_ARG"] == NSOrderedSame) {
            return @(AWSwaf-regionalMatchFieldTypeSingleQueryArg);
        }
        if ([value caseInsensitiveCompare:@"ALL_QUERY_ARGS"] == NSOrderedSame) {
            return @(AWSwaf-regionalMatchFieldTypeAllQueryArgs);
        }
        return @(AWSwaf-regionalMatchFieldTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalMatchFieldTypeUri:
                return @"URI";
            case AWSwaf-regionalMatchFieldTypeQueryString:
                return @"QUERY_STRING";
            case AWSwaf-regionalMatchFieldTypeHeader:
                return @"HEADER";
            case AWSwaf-regionalMatchFieldTypeMethod:
                return @"METHOD";
            case AWSwaf-regionalMatchFieldTypeBody:
                return @"BODY";
            case AWSwaf-regionalMatchFieldTypeSingleQueryArg:
                return @"SINGLE_QUERY_ARG";
            case AWSwaf-regionalMatchFieldTypeAllQueryArgs:
                return @"ALL_QUERY_ARGS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwaf-regionalGeoMatchConstraint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Country"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintTypeCountry);
        }
        return @(AWSwaf-regionalGeoMatchConstraintTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalGeoMatchConstraintTypeCountry:
                return @"Country";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)valueJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AF"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueAf);
        }
        if ([value caseInsensitiveCompare:@"AX"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueAx);
        }
        if ([value caseInsensitiveCompare:@"AL"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueAl);
        }
        if ([value caseInsensitiveCompare:@"DZ"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueDz);
        }
        if ([value caseInsensitiveCompare:@"AS"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueAs);
        }
        if ([value caseInsensitiveCompare:@"AD"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueAd);
        }
        if ([value caseInsensitiveCompare:@"AO"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueAo);
        }
        if ([value caseInsensitiveCompare:@"AI"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueAi);
        }
        if ([value caseInsensitiveCompare:@"AQ"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueAq);
        }
        if ([value caseInsensitiveCompare:@"AG"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueAg);
        }
        if ([value caseInsensitiveCompare:@"AR"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueAr);
        }
        if ([value caseInsensitiveCompare:@"AM"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueAm);
        }
        if ([value caseInsensitiveCompare:@"AW"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueAw);
        }
        if ([value caseInsensitiveCompare:@"AU"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueAu);
        }
        if ([value caseInsensitiveCompare:@"AT"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueAt);
        }
        if ([value caseInsensitiveCompare:@"AZ"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueAz);
        }
        if ([value caseInsensitiveCompare:@"BS"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueBs);
        }
        if ([value caseInsensitiveCompare:@"BH"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueBh);
        }
        if ([value caseInsensitiveCompare:@"BD"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueBd);
        }
        if ([value caseInsensitiveCompare:@"BB"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueBb);
        }
        if ([value caseInsensitiveCompare:@"BY"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueBy);
        }
        if ([value caseInsensitiveCompare:@"BE"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueBe);
        }
        if ([value caseInsensitiveCompare:@"BZ"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueBz);
        }
        if ([value caseInsensitiveCompare:@"BJ"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueBj);
        }
        if ([value caseInsensitiveCompare:@"BM"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueBm);
        }
        if ([value caseInsensitiveCompare:@"BT"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueBt);
        }
        if ([value caseInsensitiveCompare:@"BO"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueBo);
        }
        if ([value caseInsensitiveCompare:@"BQ"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueBq);
        }
        if ([value caseInsensitiveCompare:@"BA"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueBa);
        }
        if ([value caseInsensitiveCompare:@"BW"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueBw);
        }
        if ([value caseInsensitiveCompare:@"BV"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueBv);
        }
        if ([value caseInsensitiveCompare:@"BR"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueBr);
        }
        if ([value caseInsensitiveCompare:@"IO"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueIo);
        }
        if ([value caseInsensitiveCompare:@"BN"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueBn);
        }
        if ([value caseInsensitiveCompare:@"BG"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueBg);
        }
        if ([value caseInsensitiveCompare:@"BF"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueBf);
        }
        if ([value caseInsensitiveCompare:@"BI"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueBi);
        }
        if ([value caseInsensitiveCompare:@"KH"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueKh);
        }
        if ([value caseInsensitiveCompare:@"CM"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueCm);
        }
        if ([value caseInsensitiveCompare:@"CA"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueCa);
        }
        if ([value caseInsensitiveCompare:@"CV"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueCv);
        }
        if ([value caseInsensitiveCompare:@"KY"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueKy);
        }
        if ([value caseInsensitiveCompare:@"CF"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueCf);
        }
        if ([value caseInsensitiveCompare:@"TD"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueTd);
        }
        if ([value caseInsensitiveCompare:@"CL"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueCl);
        }
        if ([value caseInsensitiveCompare:@"CN"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueCn);
        }
        if ([value caseInsensitiveCompare:@"CX"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueCx);
        }
        if ([value caseInsensitiveCompare:@"CC"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueCc);
        }
        if ([value caseInsensitiveCompare:@"CO"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueCo);
        }
        if ([value caseInsensitiveCompare:@"KM"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueKm);
        }
        if ([value caseInsensitiveCompare:@"CG"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueCg);
        }
        if ([value caseInsensitiveCompare:@"CD"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueCd);
        }
        if ([value caseInsensitiveCompare:@"CK"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueCk);
        }
        if ([value caseInsensitiveCompare:@"CR"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueCr);
        }
        if ([value caseInsensitiveCompare:@"CI"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueCi);
        }
        if ([value caseInsensitiveCompare:@"HR"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueHr);
        }
        if ([value caseInsensitiveCompare:@"CU"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueCu);
        }
        if ([value caseInsensitiveCompare:@"CW"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueCw);
        }
        if ([value caseInsensitiveCompare:@"CY"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueCy);
        }
        if ([value caseInsensitiveCompare:@"CZ"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueCz);
        }
        if ([value caseInsensitiveCompare:@"DK"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueDk);
        }
        if ([value caseInsensitiveCompare:@"DJ"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueDj);
        }
        if ([value caseInsensitiveCompare:@"DM"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueDm);
        }
        if ([value caseInsensitiveCompare:@"DO"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueDo);
        }
        if ([value caseInsensitiveCompare:@"EC"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueEc);
        }
        if ([value caseInsensitiveCompare:@"EG"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueEg);
        }
        if ([value caseInsensitiveCompare:@"SV"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueSv);
        }
        if ([value caseInsensitiveCompare:@"GQ"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueGq);
        }
        if ([value caseInsensitiveCompare:@"ER"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueEr);
        }
        if ([value caseInsensitiveCompare:@"EE"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueEe);
        }
        if ([value caseInsensitiveCompare:@"ET"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueEt);
        }
        if ([value caseInsensitiveCompare:@"FK"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueFk);
        }
        if ([value caseInsensitiveCompare:@"FO"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueFo);
        }
        if ([value caseInsensitiveCompare:@"FJ"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueFj);
        }
        if ([value caseInsensitiveCompare:@"FI"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueFi);
        }
        if ([value caseInsensitiveCompare:@"FR"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueFr);
        }
        if ([value caseInsensitiveCompare:@"GF"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueGf);
        }
        if ([value caseInsensitiveCompare:@"PF"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValuePf);
        }
        if ([value caseInsensitiveCompare:@"TF"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueTf);
        }
        if ([value caseInsensitiveCompare:@"GA"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueGa);
        }
        if ([value caseInsensitiveCompare:@"GM"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueGm);
        }
        if ([value caseInsensitiveCompare:@"GE"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueGE);
        }
        if ([value caseInsensitiveCompare:@"DE"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueDe);
        }
        if ([value caseInsensitiveCompare:@"GH"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueGh);
        }
        if ([value caseInsensitiveCompare:@"GI"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueGi);
        }
        if ([value caseInsensitiveCompare:@"GR"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueGr);
        }
        if ([value caseInsensitiveCompare:@"GL"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueGl);
        }
        if ([value caseInsensitiveCompare:@"GD"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueGd);
        }
        if ([value caseInsensitiveCompare:@"GP"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueGp);
        }
        if ([value caseInsensitiveCompare:@"GU"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueGu);
        }
        if ([value caseInsensitiveCompare:@"GT"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueGT);
        }
        if ([value caseInsensitiveCompare:@"GG"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueGg);
        }
        if ([value caseInsensitiveCompare:@"GN"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueGn);
        }
        if ([value caseInsensitiveCompare:@"GW"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueGw);
        }
        if ([value caseInsensitiveCompare:@"GY"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueGy);
        }
        if ([value caseInsensitiveCompare:@"HT"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueHt);
        }
        if ([value caseInsensitiveCompare:@"HM"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueHm);
        }
        if ([value caseInsensitiveCompare:@"VA"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueVa);
        }
        if ([value caseInsensitiveCompare:@"HN"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueHn);
        }
        if ([value caseInsensitiveCompare:@"HK"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueHk);
        }
        if ([value caseInsensitiveCompare:@"HU"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueHu);
        }
        if ([value caseInsensitiveCompare:@"IS"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueIs);
        }
        if ([value caseInsensitiveCompare:@"IN"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueIN);
        }
        if ([value caseInsensitiveCompare:@"ID"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueId);
        }
        if ([value caseInsensitiveCompare:@"IR"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueIr);
        }
        if ([value caseInsensitiveCompare:@"IQ"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueIq);
        }
        if ([value caseInsensitiveCompare:@"IE"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueIe);
        }
        if ([value caseInsensitiveCompare:@"IM"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueIm);
        }
        if ([value caseInsensitiveCompare:@"IL"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueIl);
        }
        if ([value caseInsensitiveCompare:@"IT"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueIt);
        }
        if ([value caseInsensitiveCompare:@"JM"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueJm);
        }
        if ([value caseInsensitiveCompare:@"JP"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueJp);
        }
        if ([value caseInsensitiveCompare:@"JE"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueJe);
        }
        if ([value caseInsensitiveCompare:@"JO"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueJo);
        }
        if ([value caseInsensitiveCompare:@"KZ"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueKz);
        }
        if ([value caseInsensitiveCompare:@"KE"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueKe);
        }
        if ([value caseInsensitiveCompare:@"KI"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueKi);
        }
        if ([value caseInsensitiveCompare:@"KP"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueKp);
        }
        if ([value caseInsensitiveCompare:@"KR"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueKr);
        }
        if ([value caseInsensitiveCompare:@"KW"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueKw);
        }
        if ([value caseInsensitiveCompare:@"KG"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueKg);
        }
        if ([value caseInsensitiveCompare:@"LA"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueLa);
        }
        if ([value caseInsensitiveCompare:@"LV"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueLv);
        }
        if ([value caseInsensitiveCompare:@"LB"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueLb);
        }
        if ([value caseInsensitiveCompare:@"LS"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueLs);
        }
        if ([value caseInsensitiveCompare:@"LR"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueLr);
        }
        if ([value caseInsensitiveCompare:@"LY"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueLy);
        }
        if ([value caseInsensitiveCompare:@"LI"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueLi);
        }
        if ([value caseInsensitiveCompare:@"LT"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueLT);
        }
        if ([value caseInsensitiveCompare:@"LU"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueLu);
        }
        if ([value caseInsensitiveCompare:@"MO"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueMo);
        }
        if ([value caseInsensitiveCompare:@"MK"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueMk);
        }
        if ([value caseInsensitiveCompare:@"MG"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueMg);
        }
        if ([value caseInsensitiveCompare:@"MW"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueMw);
        }
        if ([value caseInsensitiveCompare:@"MY"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueMy);
        }
        if ([value caseInsensitiveCompare:@"MV"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueMv);
        }
        if ([value caseInsensitiveCompare:@"ML"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueMl);
        }
        if ([value caseInsensitiveCompare:@"MT"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueMt);
        }
        if ([value caseInsensitiveCompare:@"MH"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueMh);
        }
        if ([value caseInsensitiveCompare:@"MQ"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueMq);
        }
        if ([value caseInsensitiveCompare:@"MR"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueMr);
        }
        if ([value caseInsensitiveCompare:@"MU"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueMu);
        }
        if ([value caseInsensitiveCompare:@"YT"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueYt);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueMx);
        }
        if ([value caseInsensitiveCompare:@"FM"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueFm);
        }
        if ([value caseInsensitiveCompare:@"MD"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueMd);
        }
        if ([value caseInsensitiveCompare:@"MC"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueMc);
        }
        if ([value caseInsensitiveCompare:@"MN"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueMn);
        }
        if ([value caseInsensitiveCompare:@"ME"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueMe);
        }
        if ([value caseInsensitiveCompare:@"MS"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueMs);
        }
        if ([value caseInsensitiveCompare:@"MA"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueMa);
        }
        if ([value caseInsensitiveCompare:@"MZ"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueMz);
        }
        if ([value caseInsensitiveCompare:@"MM"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueMm);
        }
        if ([value caseInsensitiveCompare:@"NA"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueNa);
        }
        if ([value caseInsensitiveCompare:@"NR"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueNr);
        }
        if ([value caseInsensitiveCompare:@"NP"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueNp);
        }
        if ([value caseInsensitiveCompare:@"NL"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueNl);
        }
        if ([value caseInsensitiveCompare:@"NC"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueNc);
        }
        if ([value caseInsensitiveCompare:@"NZ"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueNz);
        }
        if ([value caseInsensitiveCompare:@"NI"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueNi);
        }
        if ([value caseInsensitiveCompare:@"NE"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueNE);
        }
        if ([value caseInsensitiveCompare:@"NG"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueNg);
        }
        if ([value caseInsensitiveCompare:@"NU"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueNu);
        }
        if ([value caseInsensitiveCompare:@"NF"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueNf);
        }
        if ([value caseInsensitiveCompare:@"MP"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueMp);
        }
        if ([value caseInsensitiveCompare:@"NO"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueNo);
        }
        if ([value caseInsensitiveCompare:@"OM"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueOm);
        }
        if ([value caseInsensitiveCompare:@"PK"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValuePk);
        }
        if ([value caseInsensitiveCompare:@"PW"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValuePw);
        }
        if ([value caseInsensitiveCompare:@"PS"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValuePs);
        }
        if ([value caseInsensitiveCompare:@"PA"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValuePa);
        }
        if ([value caseInsensitiveCompare:@"PG"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValuePg);
        }
        if ([value caseInsensitiveCompare:@"PY"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValuePy);
        }
        if ([value caseInsensitiveCompare:@"PE"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValuePe);
        }
        if ([value caseInsensitiveCompare:@"PH"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValuePh);
        }
        if ([value caseInsensitiveCompare:@"PN"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValuePn);
        }
        if ([value caseInsensitiveCompare:@"PL"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValuePl);
        }
        if ([value caseInsensitiveCompare:@"PT"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValuePt);
        }
        if ([value caseInsensitiveCompare:@"PR"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValuePr);
        }
        if ([value caseInsensitiveCompare:@"QA"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueQa);
        }
        if ([value caseInsensitiveCompare:@"RE"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueRe);
        }
        if ([value caseInsensitiveCompare:@"RO"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueRo);
        }
        if ([value caseInsensitiveCompare:@"RU"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueRu);
        }
        if ([value caseInsensitiveCompare:@"RW"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueRw);
        }
        if ([value caseInsensitiveCompare:@"BL"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueBl);
        }
        if ([value caseInsensitiveCompare:@"SH"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueSh);
        }
        if ([value caseInsensitiveCompare:@"KN"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueKn);
        }
        if ([value caseInsensitiveCompare:@"LC"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueLc);
        }
        if ([value caseInsensitiveCompare:@"MF"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueMf);
        }
        if ([value caseInsensitiveCompare:@"PM"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValuePm);
        }
        if ([value caseInsensitiveCompare:@"VC"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueVc);
        }
        if ([value caseInsensitiveCompare:@"WS"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueWs);
        }
        if ([value caseInsensitiveCompare:@"SM"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueSm);
        }
        if ([value caseInsensitiveCompare:@"ST"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueSt);
        }
        if ([value caseInsensitiveCompare:@"SA"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueSa);
        }
        if ([value caseInsensitiveCompare:@"SN"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueSn);
        }
        if ([value caseInsensitiveCompare:@"RS"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueRs);
        }
        if ([value caseInsensitiveCompare:@"SC"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueSc);
        }
        if ([value caseInsensitiveCompare:@"SL"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueSl);
        }
        if ([value caseInsensitiveCompare:@"SG"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueSg);
        }
        if ([value caseInsensitiveCompare:@"SX"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueSx);
        }
        if ([value caseInsensitiveCompare:@"SK"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueSk);
        }
        if ([value caseInsensitiveCompare:@"SI"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueSi);
        }
        if ([value caseInsensitiveCompare:@"SB"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueSb);
        }
        if ([value caseInsensitiveCompare:@"SO"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueSo);
        }
        if ([value caseInsensitiveCompare:@"ZA"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueZa);
        }
        if ([value caseInsensitiveCompare:@"GS"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueGs);
        }
        if ([value caseInsensitiveCompare:@"SS"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueSs);
        }
        if ([value caseInsensitiveCompare:@"ES"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueEs);
        }
        if ([value caseInsensitiveCompare:@"LK"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueLk);
        }
        if ([value caseInsensitiveCompare:@"SD"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueSd);
        }
        if ([value caseInsensitiveCompare:@"SR"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueSr);
        }
        if ([value caseInsensitiveCompare:@"SJ"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueSj);
        }
        if ([value caseInsensitiveCompare:@"SZ"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueSz);
        }
        if ([value caseInsensitiveCompare:@"SE"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueSe);
        }
        if ([value caseInsensitiveCompare:@"CH"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueCh);
        }
        if ([value caseInsensitiveCompare:@"SY"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueSy);
        }
        if ([value caseInsensitiveCompare:@"TW"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueTw);
        }
        if ([value caseInsensitiveCompare:@"TJ"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueTj);
        }
        if ([value caseInsensitiveCompare:@"TZ"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueTz);
        }
        if ([value caseInsensitiveCompare:@"TH"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueTh);
        }
        if ([value caseInsensitiveCompare:@"TL"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueTl);
        }
        if ([value caseInsensitiveCompare:@"TG"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueTg);
        }
        if ([value caseInsensitiveCompare:@"TK"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueTk);
        }
        if ([value caseInsensitiveCompare:@"TO"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueTo);
        }
        if ([value caseInsensitiveCompare:@"TT"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueTt);
        }
        if ([value caseInsensitiveCompare:@"TN"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueTn);
        }
        if ([value caseInsensitiveCompare:@"TR"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueTr);
        }
        if ([value caseInsensitiveCompare:@"TM"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueTm);
        }
        if ([value caseInsensitiveCompare:@"TC"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueTc);
        }
        if ([value caseInsensitiveCompare:@"TV"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueTv);
        }
        if ([value caseInsensitiveCompare:@"UG"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueUg);
        }
        if ([value caseInsensitiveCompare:@"UA"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueUa);
        }
        if ([value caseInsensitiveCompare:@"AE"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueAe);
        }
        if ([value caseInsensitiveCompare:@"GB"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueGb);
        }
        if ([value caseInsensitiveCompare:@"US"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueUs);
        }
        if ([value caseInsensitiveCompare:@"UM"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueUm);
        }
        if ([value caseInsensitiveCompare:@"UY"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueUy);
        }
        if ([value caseInsensitiveCompare:@"UZ"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueUz);
        }
        if ([value caseInsensitiveCompare:@"VU"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueVu);
        }
        if ([value caseInsensitiveCompare:@"VE"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueVe);
        }
        if ([value caseInsensitiveCompare:@"VN"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueVn);
        }
        if ([value caseInsensitiveCompare:@"VG"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueVg);
        }
        if ([value caseInsensitiveCompare:@"VI"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueVi);
        }
        if ([value caseInsensitiveCompare:@"WF"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueWf);
        }
        if ([value caseInsensitiveCompare:@"EH"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueEh);
        }
        if ([value caseInsensitiveCompare:@"YE"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueYe);
        }
        if ([value caseInsensitiveCompare:@"ZM"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueZm);
        }
        if ([value caseInsensitiveCompare:@"ZW"] == NSOrderedSame) {
            return @(AWSwaf-regionalGeoMatchConstraintValueZw);
        }
        return @(AWSwaf-regionalGeoMatchConstraintValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalGeoMatchConstraintValueAf:
                return @"AF";
            case AWSwaf-regionalGeoMatchConstraintValueAx:
                return @"AX";
            case AWSwaf-regionalGeoMatchConstraintValueAl:
                return @"AL";
            case AWSwaf-regionalGeoMatchConstraintValueDz:
                return @"DZ";
            case AWSwaf-regionalGeoMatchConstraintValueAs:
                return @"AS";
            case AWSwaf-regionalGeoMatchConstraintValueAd:
                return @"AD";
            case AWSwaf-regionalGeoMatchConstraintValueAo:
                return @"AO";
            case AWSwaf-regionalGeoMatchConstraintValueAi:
                return @"AI";
            case AWSwaf-regionalGeoMatchConstraintValueAq:
                return @"AQ";
            case AWSwaf-regionalGeoMatchConstraintValueAg:
                return @"AG";
            case AWSwaf-regionalGeoMatchConstraintValueAr:
                return @"AR";
            case AWSwaf-regionalGeoMatchConstraintValueAm:
                return @"AM";
            case AWSwaf-regionalGeoMatchConstraintValueAw:
                return @"AW";
            case AWSwaf-regionalGeoMatchConstraintValueAu:
                return @"AU";
            case AWSwaf-regionalGeoMatchConstraintValueAt:
                return @"AT";
            case AWSwaf-regionalGeoMatchConstraintValueAz:
                return @"AZ";
            case AWSwaf-regionalGeoMatchConstraintValueBs:
                return @"BS";
            case AWSwaf-regionalGeoMatchConstraintValueBh:
                return @"BH";
            case AWSwaf-regionalGeoMatchConstraintValueBd:
                return @"BD";
            case AWSwaf-regionalGeoMatchConstraintValueBb:
                return @"BB";
            case AWSwaf-regionalGeoMatchConstraintValueBy:
                return @"BY";
            case AWSwaf-regionalGeoMatchConstraintValueBe:
                return @"BE";
            case AWSwaf-regionalGeoMatchConstraintValueBz:
                return @"BZ";
            case AWSwaf-regionalGeoMatchConstraintValueBj:
                return @"BJ";
            case AWSwaf-regionalGeoMatchConstraintValueBm:
                return @"BM";
            case AWSwaf-regionalGeoMatchConstraintValueBt:
                return @"BT";
            case AWSwaf-regionalGeoMatchConstraintValueBo:
                return @"BO";
            case AWSwaf-regionalGeoMatchConstraintValueBq:
                return @"BQ";
            case AWSwaf-regionalGeoMatchConstraintValueBa:
                return @"BA";
            case AWSwaf-regionalGeoMatchConstraintValueBw:
                return @"BW";
            case AWSwaf-regionalGeoMatchConstraintValueBv:
                return @"BV";
            case AWSwaf-regionalGeoMatchConstraintValueBr:
                return @"BR";
            case AWSwaf-regionalGeoMatchConstraintValueIo:
                return @"IO";
            case AWSwaf-regionalGeoMatchConstraintValueBn:
                return @"BN";
            case AWSwaf-regionalGeoMatchConstraintValueBg:
                return @"BG";
            case AWSwaf-regionalGeoMatchConstraintValueBf:
                return @"BF";
            case AWSwaf-regionalGeoMatchConstraintValueBi:
                return @"BI";
            case AWSwaf-regionalGeoMatchConstraintValueKh:
                return @"KH";
            case AWSwaf-regionalGeoMatchConstraintValueCm:
                return @"CM";
            case AWSwaf-regionalGeoMatchConstraintValueCa:
                return @"CA";
            case AWSwaf-regionalGeoMatchConstraintValueCv:
                return @"CV";
            case AWSwaf-regionalGeoMatchConstraintValueKy:
                return @"KY";
            case AWSwaf-regionalGeoMatchConstraintValueCf:
                return @"CF";
            case AWSwaf-regionalGeoMatchConstraintValueTd:
                return @"TD";
            case AWSwaf-regionalGeoMatchConstraintValueCl:
                return @"CL";
            case AWSwaf-regionalGeoMatchConstraintValueCn:
                return @"CN";
            case AWSwaf-regionalGeoMatchConstraintValueCx:
                return @"CX";
            case AWSwaf-regionalGeoMatchConstraintValueCc:
                return @"CC";
            case AWSwaf-regionalGeoMatchConstraintValueCo:
                return @"CO";
            case AWSwaf-regionalGeoMatchConstraintValueKm:
                return @"KM";
            case AWSwaf-regionalGeoMatchConstraintValueCg:
                return @"CG";
            case AWSwaf-regionalGeoMatchConstraintValueCd:
                return @"CD";
            case AWSwaf-regionalGeoMatchConstraintValueCk:
                return @"CK";
            case AWSwaf-regionalGeoMatchConstraintValueCr:
                return @"CR";
            case AWSwaf-regionalGeoMatchConstraintValueCi:
                return @"CI";
            case AWSwaf-regionalGeoMatchConstraintValueHr:
                return @"HR";
            case AWSwaf-regionalGeoMatchConstraintValueCu:
                return @"CU";
            case AWSwaf-regionalGeoMatchConstraintValueCw:
                return @"CW";
            case AWSwaf-regionalGeoMatchConstraintValueCy:
                return @"CY";
            case AWSwaf-regionalGeoMatchConstraintValueCz:
                return @"CZ";
            case AWSwaf-regionalGeoMatchConstraintValueDk:
                return @"DK";
            case AWSwaf-regionalGeoMatchConstraintValueDj:
                return @"DJ";
            case AWSwaf-regionalGeoMatchConstraintValueDm:
                return @"DM";
            case AWSwaf-regionalGeoMatchConstraintValueDo:
                return @"DO";
            case AWSwaf-regionalGeoMatchConstraintValueEc:
                return @"EC";
            case AWSwaf-regionalGeoMatchConstraintValueEg:
                return @"EG";
            case AWSwaf-regionalGeoMatchConstraintValueSv:
                return @"SV";
            case AWSwaf-regionalGeoMatchConstraintValueGq:
                return @"GQ";
            case AWSwaf-regionalGeoMatchConstraintValueEr:
                return @"ER";
            case AWSwaf-regionalGeoMatchConstraintValueEe:
                return @"EE";
            case AWSwaf-regionalGeoMatchConstraintValueEt:
                return @"ET";
            case AWSwaf-regionalGeoMatchConstraintValueFk:
                return @"FK";
            case AWSwaf-regionalGeoMatchConstraintValueFo:
                return @"FO";
            case AWSwaf-regionalGeoMatchConstraintValueFj:
                return @"FJ";
            case AWSwaf-regionalGeoMatchConstraintValueFi:
                return @"FI";
            case AWSwaf-regionalGeoMatchConstraintValueFr:
                return @"FR";
            case AWSwaf-regionalGeoMatchConstraintValueGf:
                return @"GF";
            case AWSwaf-regionalGeoMatchConstraintValuePf:
                return @"PF";
            case AWSwaf-regionalGeoMatchConstraintValueTf:
                return @"TF";
            case AWSwaf-regionalGeoMatchConstraintValueGa:
                return @"GA";
            case AWSwaf-regionalGeoMatchConstraintValueGm:
                return @"GM";
            case AWSwaf-regionalGeoMatchConstraintValueGE:
                return @"GE";
            case AWSwaf-regionalGeoMatchConstraintValueDe:
                return @"DE";
            case AWSwaf-regionalGeoMatchConstraintValueGh:
                return @"GH";
            case AWSwaf-regionalGeoMatchConstraintValueGi:
                return @"GI";
            case AWSwaf-regionalGeoMatchConstraintValueGr:
                return @"GR";
            case AWSwaf-regionalGeoMatchConstraintValueGl:
                return @"GL";
            case AWSwaf-regionalGeoMatchConstraintValueGd:
                return @"GD";
            case AWSwaf-regionalGeoMatchConstraintValueGp:
                return @"GP";
            case AWSwaf-regionalGeoMatchConstraintValueGu:
                return @"GU";
            case AWSwaf-regionalGeoMatchConstraintValueGT:
                return @"GT";
            case AWSwaf-regionalGeoMatchConstraintValueGg:
                return @"GG";
            case AWSwaf-regionalGeoMatchConstraintValueGn:
                return @"GN";
            case AWSwaf-regionalGeoMatchConstraintValueGw:
                return @"GW";
            case AWSwaf-regionalGeoMatchConstraintValueGy:
                return @"GY";
            case AWSwaf-regionalGeoMatchConstraintValueHt:
                return @"HT";
            case AWSwaf-regionalGeoMatchConstraintValueHm:
                return @"HM";
            case AWSwaf-regionalGeoMatchConstraintValueVa:
                return @"VA";
            case AWSwaf-regionalGeoMatchConstraintValueHn:
                return @"HN";
            case AWSwaf-regionalGeoMatchConstraintValueHk:
                return @"HK";
            case AWSwaf-regionalGeoMatchConstraintValueHu:
                return @"HU";
            case AWSwaf-regionalGeoMatchConstraintValueIs:
                return @"IS";
            case AWSwaf-regionalGeoMatchConstraintValueIN:
                return @"IN";
            case AWSwaf-regionalGeoMatchConstraintValueId:
                return @"ID";
            case AWSwaf-regionalGeoMatchConstraintValueIr:
                return @"IR";
            case AWSwaf-regionalGeoMatchConstraintValueIq:
                return @"IQ";
            case AWSwaf-regionalGeoMatchConstraintValueIe:
                return @"IE";
            case AWSwaf-regionalGeoMatchConstraintValueIm:
                return @"IM";
            case AWSwaf-regionalGeoMatchConstraintValueIl:
                return @"IL";
            case AWSwaf-regionalGeoMatchConstraintValueIt:
                return @"IT";
            case AWSwaf-regionalGeoMatchConstraintValueJm:
                return @"JM";
            case AWSwaf-regionalGeoMatchConstraintValueJp:
                return @"JP";
            case AWSwaf-regionalGeoMatchConstraintValueJe:
                return @"JE";
            case AWSwaf-regionalGeoMatchConstraintValueJo:
                return @"JO";
            case AWSwaf-regionalGeoMatchConstraintValueKz:
                return @"KZ";
            case AWSwaf-regionalGeoMatchConstraintValueKe:
                return @"KE";
            case AWSwaf-regionalGeoMatchConstraintValueKi:
                return @"KI";
            case AWSwaf-regionalGeoMatchConstraintValueKp:
                return @"KP";
            case AWSwaf-regionalGeoMatchConstraintValueKr:
                return @"KR";
            case AWSwaf-regionalGeoMatchConstraintValueKw:
                return @"KW";
            case AWSwaf-regionalGeoMatchConstraintValueKg:
                return @"KG";
            case AWSwaf-regionalGeoMatchConstraintValueLa:
                return @"LA";
            case AWSwaf-regionalGeoMatchConstraintValueLv:
                return @"LV";
            case AWSwaf-regionalGeoMatchConstraintValueLb:
                return @"LB";
            case AWSwaf-regionalGeoMatchConstraintValueLs:
                return @"LS";
            case AWSwaf-regionalGeoMatchConstraintValueLr:
                return @"LR";
            case AWSwaf-regionalGeoMatchConstraintValueLy:
                return @"LY";
            case AWSwaf-regionalGeoMatchConstraintValueLi:
                return @"LI";
            case AWSwaf-regionalGeoMatchConstraintValueLT:
                return @"LT";
            case AWSwaf-regionalGeoMatchConstraintValueLu:
                return @"LU";
            case AWSwaf-regionalGeoMatchConstraintValueMo:
                return @"MO";
            case AWSwaf-regionalGeoMatchConstraintValueMk:
                return @"MK";
            case AWSwaf-regionalGeoMatchConstraintValueMg:
                return @"MG";
            case AWSwaf-regionalGeoMatchConstraintValueMw:
                return @"MW";
            case AWSwaf-regionalGeoMatchConstraintValueMy:
                return @"MY";
            case AWSwaf-regionalGeoMatchConstraintValueMv:
                return @"MV";
            case AWSwaf-regionalGeoMatchConstraintValueMl:
                return @"ML";
            case AWSwaf-regionalGeoMatchConstraintValueMt:
                return @"MT";
            case AWSwaf-regionalGeoMatchConstraintValueMh:
                return @"MH";
            case AWSwaf-regionalGeoMatchConstraintValueMq:
                return @"MQ";
            case AWSwaf-regionalGeoMatchConstraintValueMr:
                return @"MR";
            case AWSwaf-regionalGeoMatchConstraintValueMu:
                return @"MU";
            case AWSwaf-regionalGeoMatchConstraintValueYt:
                return @"YT";
            case AWSwaf-regionalGeoMatchConstraintValueMx:
                return @"MX";
            case AWSwaf-regionalGeoMatchConstraintValueFm:
                return @"FM";
            case AWSwaf-regionalGeoMatchConstraintValueMd:
                return @"MD";
            case AWSwaf-regionalGeoMatchConstraintValueMc:
                return @"MC";
            case AWSwaf-regionalGeoMatchConstraintValueMn:
                return @"MN";
            case AWSwaf-regionalGeoMatchConstraintValueMe:
                return @"ME";
            case AWSwaf-regionalGeoMatchConstraintValueMs:
                return @"MS";
            case AWSwaf-regionalGeoMatchConstraintValueMa:
                return @"MA";
            case AWSwaf-regionalGeoMatchConstraintValueMz:
                return @"MZ";
            case AWSwaf-regionalGeoMatchConstraintValueMm:
                return @"MM";
            case AWSwaf-regionalGeoMatchConstraintValueNa:
                return @"NA";
            case AWSwaf-regionalGeoMatchConstraintValueNr:
                return @"NR";
            case AWSwaf-regionalGeoMatchConstraintValueNp:
                return @"NP";
            case AWSwaf-regionalGeoMatchConstraintValueNl:
                return @"NL";
            case AWSwaf-regionalGeoMatchConstraintValueNc:
                return @"NC";
            case AWSwaf-regionalGeoMatchConstraintValueNz:
                return @"NZ";
            case AWSwaf-regionalGeoMatchConstraintValueNi:
                return @"NI";
            case AWSwaf-regionalGeoMatchConstraintValueNE:
                return @"NE";
            case AWSwaf-regionalGeoMatchConstraintValueNg:
                return @"NG";
            case AWSwaf-regionalGeoMatchConstraintValueNu:
                return @"NU";
            case AWSwaf-regionalGeoMatchConstraintValueNf:
                return @"NF";
            case AWSwaf-regionalGeoMatchConstraintValueMp:
                return @"MP";
            case AWSwaf-regionalGeoMatchConstraintValueNo:
                return @"NO";
            case AWSwaf-regionalGeoMatchConstraintValueOm:
                return @"OM";
            case AWSwaf-regionalGeoMatchConstraintValuePk:
                return @"PK";
            case AWSwaf-regionalGeoMatchConstraintValuePw:
                return @"PW";
            case AWSwaf-regionalGeoMatchConstraintValuePs:
                return @"PS";
            case AWSwaf-regionalGeoMatchConstraintValuePa:
                return @"PA";
            case AWSwaf-regionalGeoMatchConstraintValuePg:
                return @"PG";
            case AWSwaf-regionalGeoMatchConstraintValuePy:
                return @"PY";
            case AWSwaf-regionalGeoMatchConstraintValuePe:
                return @"PE";
            case AWSwaf-regionalGeoMatchConstraintValuePh:
                return @"PH";
            case AWSwaf-regionalGeoMatchConstraintValuePn:
                return @"PN";
            case AWSwaf-regionalGeoMatchConstraintValuePl:
                return @"PL";
            case AWSwaf-regionalGeoMatchConstraintValuePt:
                return @"PT";
            case AWSwaf-regionalGeoMatchConstraintValuePr:
                return @"PR";
            case AWSwaf-regionalGeoMatchConstraintValueQa:
                return @"QA";
            case AWSwaf-regionalGeoMatchConstraintValueRe:
                return @"RE";
            case AWSwaf-regionalGeoMatchConstraintValueRo:
                return @"RO";
            case AWSwaf-regionalGeoMatchConstraintValueRu:
                return @"RU";
            case AWSwaf-regionalGeoMatchConstraintValueRw:
                return @"RW";
            case AWSwaf-regionalGeoMatchConstraintValueBl:
                return @"BL";
            case AWSwaf-regionalGeoMatchConstraintValueSh:
                return @"SH";
            case AWSwaf-regionalGeoMatchConstraintValueKn:
                return @"KN";
            case AWSwaf-regionalGeoMatchConstraintValueLc:
                return @"LC";
            case AWSwaf-regionalGeoMatchConstraintValueMf:
                return @"MF";
            case AWSwaf-regionalGeoMatchConstraintValuePm:
                return @"PM";
            case AWSwaf-regionalGeoMatchConstraintValueVc:
                return @"VC";
            case AWSwaf-regionalGeoMatchConstraintValueWs:
                return @"WS";
            case AWSwaf-regionalGeoMatchConstraintValueSm:
                return @"SM";
            case AWSwaf-regionalGeoMatchConstraintValueSt:
                return @"ST";
            case AWSwaf-regionalGeoMatchConstraintValueSa:
                return @"SA";
            case AWSwaf-regionalGeoMatchConstraintValueSn:
                return @"SN";
            case AWSwaf-regionalGeoMatchConstraintValueRs:
                return @"RS";
            case AWSwaf-regionalGeoMatchConstraintValueSc:
                return @"SC";
            case AWSwaf-regionalGeoMatchConstraintValueSl:
                return @"SL";
            case AWSwaf-regionalGeoMatchConstraintValueSg:
                return @"SG";
            case AWSwaf-regionalGeoMatchConstraintValueSx:
                return @"SX";
            case AWSwaf-regionalGeoMatchConstraintValueSk:
                return @"SK";
            case AWSwaf-regionalGeoMatchConstraintValueSi:
                return @"SI";
            case AWSwaf-regionalGeoMatchConstraintValueSb:
                return @"SB";
            case AWSwaf-regionalGeoMatchConstraintValueSo:
                return @"SO";
            case AWSwaf-regionalGeoMatchConstraintValueZa:
                return @"ZA";
            case AWSwaf-regionalGeoMatchConstraintValueGs:
                return @"GS";
            case AWSwaf-regionalGeoMatchConstraintValueSs:
                return @"SS";
            case AWSwaf-regionalGeoMatchConstraintValueEs:
                return @"ES";
            case AWSwaf-regionalGeoMatchConstraintValueLk:
                return @"LK";
            case AWSwaf-regionalGeoMatchConstraintValueSd:
                return @"SD";
            case AWSwaf-regionalGeoMatchConstraintValueSr:
                return @"SR";
            case AWSwaf-regionalGeoMatchConstraintValueSj:
                return @"SJ";
            case AWSwaf-regionalGeoMatchConstraintValueSz:
                return @"SZ";
            case AWSwaf-regionalGeoMatchConstraintValueSe:
                return @"SE";
            case AWSwaf-regionalGeoMatchConstraintValueCh:
                return @"CH";
            case AWSwaf-regionalGeoMatchConstraintValueSy:
                return @"SY";
            case AWSwaf-regionalGeoMatchConstraintValueTw:
                return @"TW";
            case AWSwaf-regionalGeoMatchConstraintValueTj:
                return @"TJ";
            case AWSwaf-regionalGeoMatchConstraintValueTz:
                return @"TZ";
            case AWSwaf-regionalGeoMatchConstraintValueTh:
                return @"TH";
            case AWSwaf-regionalGeoMatchConstraintValueTl:
                return @"TL";
            case AWSwaf-regionalGeoMatchConstraintValueTg:
                return @"TG";
            case AWSwaf-regionalGeoMatchConstraintValueTk:
                return @"TK";
            case AWSwaf-regionalGeoMatchConstraintValueTo:
                return @"TO";
            case AWSwaf-regionalGeoMatchConstraintValueTt:
                return @"TT";
            case AWSwaf-regionalGeoMatchConstraintValueTn:
                return @"TN";
            case AWSwaf-regionalGeoMatchConstraintValueTr:
                return @"TR";
            case AWSwaf-regionalGeoMatchConstraintValueTm:
                return @"TM";
            case AWSwaf-regionalGeoMatchConstraintValueTc:
                return @"TC";
            case AWSwaf-regionalGeoMatchConstraintValueTv:
                return @"TV";
            case AWSwaf-regionalGeoMatchConstraintValueUg:
                return @"UG";
            case AWSwaf-regionalGeoMatchConstraintValueUa:
                return @"UA";
            case AWSwaf-regionalGeoMatchConstraintValueAe:
                return @"AE";
            case AWSwaf-regionalGeoMatchConstraintValueGb:
                return @"GB";
            case AWSwaf-regionalGeoMatchConstraintValueUs:
                return @"US";
            case AWSwaf-regionalGeoMatchConstraintValueUm:
                return @"UM";
            case AWSwaf-regionalGeoMatchConstraintValueUy:
                return @"UY";
            case AWSwaf-regionalGeoMatchConstraintValueUz:
                return @"UZ";
            case AWSwaf-regionalGeoMatchConstraintValueVu:
                return @"VU";
            case AWSwaf-regionalGeoMatchConstraintValueVe:
                return @"VE";
            case AWSwaf-regionalGeoMatchConstraintValueVn:
                return @"VN";
            case AWSwaf-regionalGeoMatchConstraintValueVg:
                return @"VG";
            case AWSwaf-regionalGeoMatchConstraintValueVi:
                return @"VI";
            case AWSwaf-regionalGeoMatchConstraintValueWf:
                return @"WF";
            case AWSwaf-regionalGeoMatchConstraintValueEh:
                return @"EH";
            case AWSwaf-regionalGeoMatchConstraintValueYe:
                return @"YE";
            case AWSwaf-regionalGeoMatchConstraintValueZm:
                return @"ZM";
            case AWSwaf-regionalGeoMatchConstraintValueZw:
                return @"ZW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwaf-regionalGeoMatchSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"geoMatchConstraints" : @"GeoMatchConstraints",
             @"geoMatchSetId" : @"GeoMatchSetId",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)geoMatchConstraintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalGeoMatchConstraint class]];
}

@end

@implementation AWSwaf-regionalGeoMatchSetSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"geoMatchSetId" : @"GeoMatchSetId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSwaf-regionalGeoMatchSetUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"geoMatchConstraint" : @"GeoMatchConstraint",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeActionInsert);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeActionDelete);
        }
        return @(AWSwaf-regionalChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalChangeActionInsert:
                return @"INSERT";
            case AWSwaf-regionalChangeActionDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)geoMatchConstraintJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalGeoMatchConstraint class]];
}

@end

@implementation AWSwaf-regionalGetByteMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"byteMatchSetId" : @"ByteMatchSetId",
             };
}

@end

@implementation AWSwaf-regionalGetByteMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"byteMatchSet" : @"ByteMatchSet",
             };
}

+ (NSValueTransformer *)byteMatchSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalByteMatchSet class]];
}

@end

@implementation AWSwaf-regionalGetChangeTokenRequest

@end

@implementation AWSwaf-regionalGetChangeTokenResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalGetChangeTokenStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalGetChangeTokenStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeTokenStatus" : @"ChangeTokenStatus",
             };
}

+ (NSValueTransformer *)changeTokenStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROVISIONED"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeTokenStatusProvisioned);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeTokenStatusPending);
        }
        if ([value caseInsensitiveCompare:@"INSYNC"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeTokenStatusInsync);
        }
        return @(AWSwaf-regionalChangeTokenStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalChangeTokenStatusProvisioned:
                return @"PROVISIONED";
            case AWSwaf-regionalChangeTokenStatusPending:
                return @"PENDING";
            case AWSwaf-regionalChangeTokenStatusInsync:
                return @"INSYNC";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwaf-regionalGetGeoMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"geoMatchSetId" : @"GeoMatchSetId",
             };
}

@end

@implementation AWSwaf-regionalGetGeoMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"geoMatchSet" : @"GeoMatchSet",
             };
}

+ (NSValueTransformer *)geoMatchSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalGeoMatchSet class]];
}

@end

@implementation AWSwaf-regionalGetIPSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"IPSetId" : @"IPSetId",
             };
}

@end

@implementation AWSwaf-regionalGetIPSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"IPSet" : @"IPSet",
             };
}

+ (NSValueTransformer *)IPSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalIPSet class]];
}

@end

@implementation AWSwaf-regionalGetLoggingConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSwaf-regionalGetLoggingConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loggingConfiguration" : @"LoggingConfiguration",
             };
}

+ (NSValueTransformer *)loggingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalLoggingConfiguration class]];
}

@end

@implementation AWSwaf-regionalGetPermissionPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSwaf-regionalGetPermissionPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             };
}

@end

@implementation AWSwaf-regionalGetRateBasedRuleManagedKeysRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"ruleId" : @"RuleId",
             };
}

@end

@implementation AWSwaf-regionalGetRateBasedRuleManagedKeysResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"managedKeys" : @"ManagedKeys",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwaf-regionalGetRateBasedRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleId" : @"RuleId",
             };
}

@end

@implementation AWSwaf-regionalGetRateBasedRuleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rule" : @"Rule",
             };
}

+ (NSValueTransformer *)ruleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalRateBasedRule class]];
}

@end

@implementation AWSwaf-regionalGetRegexMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regexMatchSetId" : @"RegexMatchSetId",
             };
}

@end

@implementation AWSwaf-regionalGetRegexMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regexMatchSet" : @"RegexMatchSet",
             };
}

+ (NSValueTransformer *)regexMatchSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalRegexMatchSet class]];
}

@end

@implementation AWSwaf-regionalGetRegexPatternSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regexPatternSetId" : @"RegexPatternSetId",
             };
}

@end

@implementation AWSwaf-regionalGetRegexPatternSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regexPatternSet" : @"RegexPatternSet",
             };
}

+ (NSValueTransformer *)regexPatternSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalRegexPatternSet class]];
}

@end

@implementation AWSwaf-regionalGetRuleGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleGroupId" : @"RuleGroupId",
             };
}

@end

@implementation AWSwaf-regionalGetRuleGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleGroup" : @"RuleGroup",
             };
}

+ (NSValueTransformer *)ruleGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalRuleGroup class]];
}

@end

@implementation AWSwaf-regionalGetRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleId" : @"RuleId",
             };
}

@end

@implementation AWSwaf-regionalGetRuleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rule" : @"Rule",
             };
}

+ (NSValueTransformer *)ruleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalRule class]];
}

@end

@implementation AWSwaf-regionalGetSampledRequestsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxItems" : @"MaxItems",
             @"ruleId" : @"RuleId",
             @"timeWindow" : @"TimeWindow",
             @"webAclId" : @"WebAclId",
             };
}

+ (NSValueTransformer *)timeWindowJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalTimeWindow class]];
}

@end

@implementation AWSwaf-regionalGetSampledRequestsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"populationSize" : @"PopulationSize",
             @"sampledRequests" : @"SampledRequests",
             @"timeWindow" : @"TimeWindow",
             };
}

+ (NSValueTransformer *)sampledRequestsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalSampledHTTPRequest class]];
}

+ (NSValueTransformer *)timeWindowJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalTimeWindow class]];
}

@end

@implementation AWSwaf-regionalGetSizeConstraintSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sizeConstraintSetId" : @"SizeConstraintSetId",
             };
}

@end

@implementation AWSwaf-regionalGetSizeConstraintSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sizeConstraintSet" : @"SizeConstraintSet",
             };
}

+ (NSValueTransformer *)sizeConstraintSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalSizeConstraintSet class]];
}

@end

@implementation AWSwaf-regionalGetSqlInjectionMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sqlInjectionMatchSetId" : @"SqlInjectionMatchSetId",
             };
}

@end

@implementation AWSwaf-regionalGetSqlInjectionMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sqlInjectionMatchSet" : @"SqlInjectionMatchSet",
             };
}

+ (NSValueTransformer *)sqlInjectionMatchSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalSqlInjectionMatchSet class]];
}

@end

@implementation AWSwaf-regionalGetWebACLForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSwaf-regionalGetWebACLForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"webACLSummary" : @"WebACLSummary",
             };
}

+ (NSValueTransformer *)webACLSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalWebACLSummary class]];
}

@end

@implementation AWSwaf-regionalGetWebACLRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"webACLId" : @"WebACLId",
             };
}

@end

@implementation AWSwaf-regionalGetWebACLResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"webACL" : @"WebACL",
             };
}

+ (NSValueTransformer *)webACLJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalWebACL class]];
}

@end

@implementation AWSwaf-regionalGetXssMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"xssMatchSetId" : @"XssMatchSetId",
             };
}

@end

@implementation AWSwaf-regionalGetXssMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"xssMatchSet" : @"XssMatchSet",
             };
}

+ (NSValueTransformer *)xssMatchSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalXssMatchSet class]];
}

@end

@implementation AWSwaf-regionalHTTPHeader

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSwaf-regionalHTTPRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalHTTPHeader class]];
}

@end

@implementation AWSwaf-regionalIPSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"IPSetDescriptors" : @"IPSetDescriptors",
             @"IPSetId" : @"IPSetId",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)IPSetDescriptorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalIPSetDescriptor class]];
}

@end

@implementation AWSwaf-regionalIPSetDescriptor

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IPV4"] == NSOrderedSame) {
            return @(AWSwaf-regionalIPSetDescriptorTypeIpv4);
        }
        if ([value caseInsensitiveCompare:@"IPV6"] == NSOrderedSame) {
            return @(AWSwaf-regionalIPSetDescriptorTypeIpv6);
        }
        return @(AWSwaf-regionalIPSetDescriptorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalIPSetDescriptorTypeIpv4:
                return @"IPV4";
            case AWSwaf-regionalIPSetDescriptorTypeIpv6:
                return @"IPV6";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwaf-regionalIPSetSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"IPSetId" : @"IPSetId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSwaf-regionalIPSetUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"IPSetDescriptor" : @"IPSetDescriptor",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeActionInsert);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeActionDelete);
        }
        return @(AWSwaf-regionalChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalChangeActionInsert:
                return @"INSERT";
            case AWSwaf-regionalChangeActionDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)IPSetDescriptorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalIPSetDescriptor class]];
}

@end

@implementation AWSwaf-regionalListActivatedRulesInRuleGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             @"ruleGroupId" : @"RuleGroupId",
             };
}

@end

@implementation AWSwaf-regionalListActivatedRulesInRuleGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activatedRules" : @"ActivatedRules",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)activatedRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalActivatedRule class]];
}

@end

@implementation AWSwaf-regionalListByteMatchSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwaf-regionalListByteMatchSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"byteMatchSets" : @"ByteMatchSets",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)byteMatchSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalByteMatchSetSummary class]];
}

@end

@implementation AWSwaf-regionalListGeoMatchSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwaf-regionalListGeoMatchSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"geoMatchSets" : @"GeoMatchSets",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)geoMatchSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalGeoMatchSetSummary class]];
}

@end

@implementation AWSwaf-regionalListIPSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwaf-regionalListIPSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"IPSets" : @"IPSets",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)IPSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalIPSetSummary class]];
}

@end

@implementation AWSwaf-regionalListLoggingConfigurationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwaf-regionalListLoggingConfigurationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loggingConfigurations" : @"LoggingConfigurations",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)loggingConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalLoggingConfiguration class]];
}

@end

@implementation AWSwaf-regionalListRateBasedRulesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwaf-regionalListRateBasedRulesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalRuleSummary class]];
}

@end

@implementation AWSwaf-regionalListRegexMatchSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwaf-regionalListRegexMatchSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"regexMatchSets" : @"RegexMatchSets",
             };
}

+ (NSValueTransformer *)regexMatchSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalRegexMatchSetSummary class]];
}

@end

@implementation AWSwaf-regionalListRegexPatternSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwaf-regionalListRegexPatternSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"regexPatternSets" : @"RegexPatternSets",
             };
}

+ (NSValueTransformer *)regexPatternSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalRegexPatternSetSummary class]];
}

@end

@implementation AWSwaf-regionalListResourcesForWebACLRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceType" : @"ResourceType",
             @"webACLId" : @"WebACLId",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"APPLICATION_LOAD_BALANCER"] == NSOrderedSame) {
            return @(AWSwaf-regionalResourceTypeApplicationLoadBalancer);
        }
        if ([value caseInsensitiveCompare:@"API_GATEWAY"] == NSOrderedSame) {
            return @(AWSwaf-regionalResourceTypeApiGateway);
        }
        return @(AWSwaf-regionalResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalResourceTypeApplicationLoadBalancer:
                return @"APPLICATION_LOAD_BALANCER";
            case AWSwaf-regionalResourceTypeApiGateway:
                return @"API_GATEWAY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwaf-regionalListResourcesForWebACLResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArns" : @"ResourceArns",
             };
}

@end

@implementation AWSwaf-regionalListRuleGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwaf-regionalListRuleGroupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"ruleGroups" : @"RuleGroups",
             };
}

+ (NSValueTransformer *)ruleGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalRuleGroupSummary class]];
}

@end

@implementation AWSwaf-regionalListRulesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwaf-regionalListRulesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalRuleSummary class]];
}

@end

@implementation AWSwaf-regionalListSizeConstraintSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwaf-regionalListSizeConstraintSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"sizeConstraintSets" : @"SizeConstraintSets",
             };
}

+ (NSValueTransformer *)sizeConstraintSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalSizeConstraintSetSummary class]];
}

@end

@implementation AWSwaf-regionalListSqlInjectionMatchSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwaf-regionalListSqlInjectionMatchSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"sqlInjectionMatchSets" : @"SqlInjectionMatchSets",
             };
}

+ (NSValueTransformer *)sqlInjectionMatchSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalSqlInjectionMatchSetSummary class]];
}

@end

@implementation AWSwaf-regionalListSubscribedRuleGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwaf-regionalListSubscribedRuleGroupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"ruleGroups" : @"RuleGroups",
             };
}

+ (NSValueTransformer *)ruleGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalSubscribedRuleGroupSummary class]];
}

@end

@implementation AWSwaf-regionalListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             @"resourceARN" : @"ResourceARN",
             };
}

@end

@implementation AWSwaf-regionalListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"tagInfoForResource" : @"TagInfoForResource",
             };
}

+ (NSValueTransformer *)tagInfoForResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalTagInfoForResource class]];
}

@end

@implementation AWSwaf-regionalListWebACLsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwaf-regionalListWebACLsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"webACLs" : @"WebACLs",
             };
}

+ (NSValueTransformer *)webACLsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalWebACLSummary class]];
}

@end

@implementation AWSwaf-regionalListXssMatchSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSwaf-regionalListXssMatchSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"xssMatchSets" : @"XssMatchSets",
             };
}

+ (NSValueTransformer *)xssMatchSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalXssMatchSetSummary class]];
}

@end

@implementation AWSwaf-regionalLoggingConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logDestinationConfigs" : @"LogDestinationConfigs",
             @"redactedFields" : @"RedactedFields",
             @"resourceArn" : @"ResourceArn",
             };
}

+ (NSValueTransformer *)redactedFieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalFieldToMatch class]];
}

@end

@implementation AWSwaf-regionalPredicate

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
            return @(AWSwaf-regionalPredicateTypeIPMatch);
        }
        if ([value caseInsensitiveCompare:@"ByteMatch"] == NSOrderedSame) {
            return @(AWSwaf-regionalPredicateTypeByteMatch);
        }
        if ([value caseInsensitiveCompare:@"SqlInjectionMatch"] == NSOrderedSame) {
            return @(AWSwaf-regionalPredicateTypeSqlInjectionMatch);
        }
        if ([value caseInsensitiveCompare:@"GeoMatch"] == NSOrderedSame) {
            return @(AWSwaf-regionalPredicateTypeGeoMatch);
        }
        if ([value caseInsensitiveCompare:@"SizeConstraint"] == NSOrderedSame) {
            return @(AWSwaf-regionalPredicateTypeSizeConstraint);
        }
        if ([value caseInsensitiveCompare:@"XssMatch"] == NSOrderedSame) {
            return @(AWSwaf-regionalPredicateTypeXssMatch);
        }
        if ([value caseInsensitiveCompare:@"RegexMatch"] == NSOrderedSame) {
            return @(AWSwaf-regionalPredicateTypeRegexMatch);
        }
        return @(AWSwaf-regionalPredicateTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalPredicateTypeIPMatch:
                return @"IPMatch";
            case AWSwaf-regionalPredicateTypeByteMatch:
                return @"ByteMatch";
            case AWSwaf-regionalPredicateTypeSqlInjectionMatch:
                return @"SqlInjectionMatch";
            case AWSwaf-regionalPredicateTypeGeoMatch:
                return @"GeoMatch";
            case AWSwaf-regionalPredicateTypeSizeConstraint:
                return @"SizeConstraint";
            case AWSwaf-regionalPredicateTypeXssMatch:
                return @"XssMatch";
            case AWSwaf-regionalPredicateTypeRegexMatch:
                return @"RegexMatch";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwaf-regionalPutLoggingConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loggingConfiguration" : @"LoggingConfiguration",
             };
}

+ (NSValueTransformer *)loggingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalLoggingConfiguration class]];
}

@end

@implementation AWSwaf-regionalPutLoggingConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loggingConfiguration" : @"LoggingConfiguration",
             };
}

+ (NSValueTransformer *)loggingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalLoggingConfiguration class]];
}

@end

@implementation AWSwaf-regionalPutPermissionPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSwaf-regionalPutPermissionPolicyResponse

@end

@implementation AWSwaf-regionalRateBasedRule

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalPredicate class]];
}

+ (NSValueTransformer *)rateKeyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IP"] == NSOrderedSame) {
            return @(AWSwaf-regionalRateKeyIp);
        }
        return @(AWSwaf-regionalRateKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalRateKeyIp:
                return @"IP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwaf-regionalRegexMatchSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"regexMatchSetId" : @"RegexMatchSetId",
             @"regexMatchTuples" : @"RegexMatchTuples",
             };
}

+ (NSValueTransformer *)regexMatchTuplesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalRegexMatchTuple class]];
}

@end

@implementation AWSwaf-regionalRegexMatchSetSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"regexMatchSetId" : @"RegexMatchSetId",
             };
}

@end

@implementation AWSwaf-regionalRegexMatchSetUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"regexMatchTuple" : @"RegexMatchTuple",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeActionInsert);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeActionDelete);
        }
        return @(AWSwaf-regionalChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalChangeActionInsert:
                return @"INSERT";
            case AWSwaf-regionalChangeActionDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)regexMatchTupleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalRegexMatchTuple class]];
}

@end

@implementation AWSwaf-regionalRegexMatchTuple

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fieldToMatch" : @"FieldToMatch",
             @"regexPatternSetId" : @"RegexPatternSetId",
             @"textTransformation" : @"TextTransformation",
             };
}

+ (NSValueTransformer *)fieldToMatchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalFieldToMatch class]];
}

+ (NSValueTransformer *)textTransformationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationNone);
        }
        if ([value caseInsensitiveCompare:@"COMPRESS_WHITE_SPACE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationCompressWhiteSpace);
        }
        if ([value caseInsensitiveCompare:@"HTML_ENTITY_DECODE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationHtmlEntityDecode);
        }
        if ([value caseInsensitiveCompare:@"LOWERCASE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationLowercase);
        }
        if ([value caseInsensitiveCompare:@"CMD_LINE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationCmdLine);
        }
        if ([value caseInsensitiveCompare:@"URL_DECODE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationUrlDecode);
        }
        return @(AWSwaf-regionalTextTransformationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalTextTransformationNone:
                return @"NONE";
            case AWSwaf-regionalTextTransformationCompressWhiteSpace:
                return @"COMPRESS_WHITE_SPACE";
            case AWSwaf-regionalTextTransformationHtmlEntityDecode:
                return @"HTML_ENTITY_DECODE";
            case AWSwaf-regionalTextTransformationLowercase:
                return @"LOWERCASE";
            case AWSwaf-regionalTextTransformationCmdLine:
                return @"CMD_LINE";
            case AWSwaf-regionalTextTransformationUrlDecode:
                return @"URL_DECODE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwaf-regionalRegexPatternSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"regexPatternSetId" : @"RegexPatternSetId",
             @"regexPatternStrings" : @"RegexPatternStrings",
             };
}

@end

@implementation AWSwaf-regionalRegexPatternSetSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"regexPatternSetId" : @"RegexPatternSetId",
             };
}

@end

@implementation AWSwaf-regionalRegexPatternSetUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"regexPatternString" : @"RegexPatternString",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeActionInsert);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeActionDelete);
        }
        return @(AWSwaf-regionalChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalChangeActionInsert:
                return @"INSERT";
            case AWSwaf-regionalChangeActionDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwaf-regionalRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricName" : @"MetricName",
             @"name" : @"Name",
             @"predicates" : @"Predicates",
             @"ruleId" : @"RuleId",
             };
}

+ (NSValueTransformer *)predicatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalPredicate class]];
}

@end

@implementation AWSwaf-regionalRuleGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricName" : @"MetricName",
             @"name" : @"Name",
             @"ruleGroupId" : @"RuleGroupId",
             };
}

@end

@implementation AWSwaf-regionalRuleGroupSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"ruleGroupId" : @"RuleGroupId",
             };
}

@end

@implementation AWSwaf-regionalRuleGroupUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"activatedRule" : @"ActivatedRule",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeActionInsert);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeActionDelete);
        }
        return @(AWSwaf-regionalChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalChangeActionInsert:
                return @"INSERT";
            case AWSwaf-regionalChangeActionDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)activatedRuleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalActivatedRule class]];
}

@end

@implementation AWSwaf-regionalRuleSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"ruleId" : @"RuleId",
             };
}

@end

@implementation AWSwaf-regionalRuleUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"predicate" : @"Predicate",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeActionInsert);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeActionDelete);
        }
        return @(AWSwaf-regionalChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalChangeActionInsert:
                return @"INSERT";
            case AWSwaf-regionalChangeActionDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)predicateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalPredicate class]];
}

@end

@implementation AWSwaf-regionalSampledHTTPRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalHTTPRequest class]];
}

+ (NSValueTransformer *)timestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSwaf-regionalSizeConstraint

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
            return @(AWSwaf-regionalComparisonOperatorEQ);
        }
        if ([value caseInsensitiveCompare:@"NE"] == NSOrderedSame) {
            return @(AWSwaf-regionalComparisonOperatorNE);
        }
        if ([value caseInsensitiveCompare:@"LE"] == NSOrderedSame) {
            return @(AWSwaf-regionalComparisonOperatorLE);
        }
        if ([value caseInsensitiveCompare:@"LT"] == NSOrderedSame) {
            return @(AWSwaf-regionalComparisonOperatorLT);
        }
        if ([value caseInsensitiveCompare:@"GE"] == NSOrderedSame) {
            return @(AWSwaf-regionalComparisonOperatorGE);
        }
        if ([value caseInsensitiveCompare:@"GT"] == NSOrderedSame) {
            return @(AWSwaf-regionalComparisonOperatorGT);
        }
        return @(AWSwaf-regionalComparisonOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalComparisonOperatorEQ:
                return @"EQ";
            case AWSwaf-regionalComparisonOperatorNE:
                return @"NE";
            case AWSwaf-regionalComparisonOperatorLE:
                return @"LE";
            case AWSwaf-regionalComparisonOperatorLT:
                return @"LT";
            case AWSwaf-regionalComparisonOperatorGE:
                return @"GE";
            case AWSwaf-regionalComparisonOperatorGT:
                return @"GT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)fieldToMatchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalFieldToMatch class]];
}

+ (NSValueTransformer *)textTransformationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationNone);
        }
        if ([value caseInsensitiveCompare:@"COMPRESS_WHITE_SPACE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationCompressWhiteSpace);
        }
        if ([value caseInsensitiveCompare:@"HTML_ENTITY_DECODE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationHtmlEntityDecode);
        }
        if ([value caseInsensitiveCompare:@"LOWERCASE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationLowercase);
        }
        if ([value caseInsensitiveCompare:@"CMD_LINE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationCmdLine);
        }
        if ([value caseInsensitiveCompare:@"URL_DECODE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationUrlDecode);
        }
        return @(AWSwaf-regionalTextTransformationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalTextTransformationNone:
                return @"NONE";
            case AWSwaf-regionalTextTransformationCompressWhiteSpace:
                return @"COMPRESS_WHITE_SPACE";
            case AWSwaf-regionalTextTransformationHtmlEntityDecode:
                return @"HTML_ENTITY_DECODE";
            case AWSwaf-regionalTextTransformationLowercase:
                return @"LOWERCASE";
            case AWSwaf-regionalTextTransformationCmdLine:
                return @"CMD_LINE";
            case AWSwaf-regionalTextTransformationUrlDecode:
                return @"URL_DECODE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwaf-regionalSizeConstraintSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"sizeConstraintSetId" : @"SizeConstraintSetId",
             @"sizeConstraints" : @"SizeConstraints",
             };
}

+ (NSValueTransformer *)sizeConstraintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalSizeConstraint class]];
}

@end

@implementation AWSwaf-regionalSizeConstraintSetSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"sizeConstraintSetId" : @"SizeConstraintSetId",
             };
}

@end

@implementation AWSwaf-regionalSizeConstraintSetUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"sizeConstraint" : @"SizeConstraint",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeActionInsert);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeActionDelete);
        }
        return @(AWSwaf-regionalChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalChangeActionInsert:
                return @"INSERT";
            case AWSwaf-regionalChangeActionDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sizeConstraintJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalSizeConstraint class]];
}

@end

@implementation AWSwaf-regionalSqlInjectionMatchSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"sqlInjectionMatchSetId" : @"SqlInjectionMatchSetId",
             @"sqlInjectionMatchTuples" : @"SqlInjectionMatchTuples",
             };
}

+ (NSValueTransformer *)sqlInjectionMatchTuplesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalSqlInjectionMatchTuple class]];
}

@end

@implementation AWSwaf-regionalSqlInjectionMatchSetSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"sqlInjectionMatchSetId" : @"SqlInjectionMatchSetId",
             };
}

@end

@implementation AWSwaf-regionalSqlInjectionMatchSetUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"sqlInjectionMatchTuple" : @"SqlInjectionMatchTuple",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeActionInsert);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeActionDelete);
        }
        return @(AWSwaf-regionalChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalChangeActionInsert:
                return @"INSERT";
            case AWSwaf-regionalChangeActionDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sqlInjectionMatchTupleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalSqlInjectionMatchTuple class]];
}

@end

@implementation AWSwaf-regionalSqlInjectionMatchTuple

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fieldToMatch" : @"FieldToMatch",
             @"textTransformation" : @"TextTransformation",
             };
}

+ (NSValueTransformer *)fieldToMatchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalFieldToMatch class]];
}

+ (NSValueTransformer *)textTransformationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationNone);
        }
        if ([value caseInsensitiveCompare:@"COMPRESS_WHITE_SPACE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationCompressWhiteSpace);
        }
        if ([value caseInsensitiveCompare:@"HTML_ENTITY_DECODE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationHtmlEntityDecode);
        }
        if ([value caseInsensitiveCompare:@"LOWERCASE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationLowercase);
        }
        if ([value caseInsensitiveCompare:@"CMD_LINE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationCmdLine);
        }
        if ([value caseInsensitiveCompare:@"URL_DECODE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationUrlDecode);
        }
        return @(AWSwaf-regionalTextTransformationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalTextTransformationNone:
                return @"NONE";
            case AWSwaf-regionalTextTransformationCompressWhiteSpace:
                return @"COMPRESS_WHITE_SPACE";
            case AWSwaf-regionalTextTransformationHtmlEntityDecode:
                return @"HTML_ENTITY_DECODE";
            case AWSwaf-regionalTextTransformationLowercase:
                return @"LOWERCASE";
            case AWSwaf-regionalTextTransformationCmdLine:
                return @"CMD_LINE";
            case AWSwaf-regionalTextTransformationUrlDecode:
                return @"URL_DECODE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwaf-regionalSubscribedRuleGroupSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricName" : @"MetricName",
             @"name" : @"Name",
             @"ruleGroupId" : @"RuleGroupId",
             };
}

@end

@implementation AWSwaf-regionalTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSwaf-regionalTagInfoForResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tagList" : @"TagList",
             };
}

+ (NSValueTransformer *)tagListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalTag class]];
}

@end

@implementation AWSwaf-regionalTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalTag class]];
}

@end

@implementation AWSwaf-regionalTagResourceResponse

@end

@implementation AWSwaf-regionalTimeWindow

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

@implementation AWSwaf-regionalUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSwaf-regionalUntagResourceResponse

@end

@implementation AWSwaf-regionalUpdateByteMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"byteMatchSetId" : @"ByteMatchSetId",
             @"changeToken" : @"ChangeToken",
             @"updates" : @"Updates",
             };
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalByteMatchSetUpdate class]];
}

@end

@implementation AWSwaf-regionalUpdateByteMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalUpdateGeoMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"geoMatchSetId" : @"GeoMatchSetId",
             @"updates" : @"Updates",
             };
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalGeoMatchSetUpdate class]];
}

@end

@implementation AWSwaf-regionalUpdateGeoMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalUpdateIPSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"IPSetId" : @"IPSetId",
             @"updates" : @"Updates",
             };
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalIPSetUpdate class]];
}

@end

@implementation AWSwaf-regionalUpdateIPSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalUpdateRateBasedRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"rateLimit" : @"RateLimit",
             @"ruleId" : @"RuleId",
             @"updates" : @"Updates",
             };
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalRuleUpdate class]];
}

@end

@implementation AWSwaf-regionalUpdateRateBasedRuleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalUpdateRegexMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"regexMatchSetId" : @"RegexMatchSetId",
             @"updates" : @"Updates",
             };
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalRegexMatchSetUpdate class]];
}

@end

@implementation AWSwaf-regionalUpdateRegexMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalUpdateRegexPatternSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"regexPatternSetId" : @"RegexPatternSetId",
             @"updates" : @"Updates",
             };
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalRegexPatternSetUpdate class]];
}

@end

@implementation AWSwaf-regionalUpdateRegexPatternSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalUpdateRuleGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"ruleGroupId" : @"RuleGroupId",
             @"updates" : @"Updates",
             };
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalRuleGroupUpdate class]];
}

@end

@implementation AWSwaf-regionalUpdateRuleGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalUpdateRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"ruleId" : @"RuleId",
             @"updates" : @"Updates",
             };
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalRuleUpdate class]];
}

@end

@implementation AWSwaf-regionalUpdateRuleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalUpdateSizeConstraintSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"sizeConstraintSetId" : @"SizeConstraintSetId",
             @"updates" : @"Updates",
             };
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalSizeConstraintSetUpdate class]];
}

@end

@implementation AWSwaf-regionalUpdateSizeConstraintSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalUpdateSqlInjectionMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"sqlInjectionMatchSetId" : @"SqlInjectionMatchSetId",
             @"updates" : @"Updates",
             };
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalSqlInjectionMatchSetUpdate class]];
}

@end

@implementation AWSwaf-regionalUpdateSqlInjectionMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalUpdateWebACLRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"defaultAction" : @"DefaultAction",
             @"updates" : @"Updates",
             @"webACLId" : @"WebACLId",
             };
}

+ (NSValueTransformer *)defaultActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalWafAction class]];
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalWebACLUpdate class]];
}

@end

@implementation AWSwaf-regionalUpdateWebACLResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalUpdateXssMatchSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             @"updates" : @"Updates",
             @"xssMatchSetId" : @"XssMatchSetId",
             };
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalXssMatchSetUpdate class]];
}

@end

@implementation AWSwaf-regionalUpdateXssMatchSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeToken" : @"ChangeToken",
             };
}

@end

@implementation AWSwaf-regionalWafAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLOCK"] == NSOrderedSame) {
            return @(AWSwaf-regionalWafActionTypeBlock);
        }
        if ([value caseInsensitiveCompare:@"ALLOW"] == NSOrderedSame) {
            return @(AWSwaf-regionalWafActionTypeAllow);
        }
        if ([value caseInsensitiveCompare:@"COUNT"] == NSOrderedSame) {
            return @(AWSwaf-regionalWafActionTypeCount);
        }
        return @(AWSwaf-regionalWafActionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalWafActionTypeBlock:
                return @"BLOCK";
            case AWSwaf-regionalWafActionTypeAllow:
                return @"ALLOW";
            case AWSwaf-regionalWafActionTypeCount:
                return @"COUNT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwaf-regionalWafOverrideAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSwaf-regionalWafOverrideActionTypeNone);
        }
        if ([value caseInsensitiveCompare:@"COUNT"] == NSOrderedSame) {
            return @(AWSwaf-regionalWafOverrideActionTypeCount);
        }
        return @(AWSwaf-regionalWafOverrideActionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalWafOverrideActionTypeNone:
                return @"NONE";
            case AWSwaf-regionalWafOverrideActionTypeCount:
                return @"COUNT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSwaf-regionalWebACL

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalWafAction class]];
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalActivatedRule class]];
}

@end

@implementation AWSwaf-regionalWebACLSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"webACLId" : @"WebACLId",
             };
}

@end

@implementation AWSwaf-regionalWebACLUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"activatedRule" : @"ActivatedRule",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeActionInsert);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeActionDelete);
        }
        return @(AWSwaf-regionalChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalChangeActionInsert:
                return @"INSERT";
            case AWSwaf-regionalChangeActionDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)activatedRuleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalActivatedRule class]];
}

@end

@implementation AWSwaf-regionalXssMatchSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"xssMatchSetId" : @"XssMatchSetId",
             @"xssMatchTuples" : @"XssMatchTuples",
             };
}

+ (NSValueTransformer *)xssMatchTuplesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSwaf-regionalXssMatchTuple class]];
}

@end

@implementation AWSwaf-regionalXssMatchSetSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"xssMatchSetId" : @"XssMatchSetId",
             };
}

@end

@implementation AWSwaf-regionalXssMatchSetUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"xssMatchTuple" : @"XssMatchTuple",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeActionInsert);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSwaf-regionalChangeActionDelete);
        }
        return @(AWSwaf-regionalChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalChangeActionInsert:
                return @"INSERT";
            case AWSwaf-regionalChangeActionDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)xssMatchTupleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalXssMatchTuple class]];
}

@end

@implementation AWSwaf-regionalXssMatchTuple

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fieldToMatch" : @"FieldToMatch",
             @"textTransformation" : @"TextTransformation",
             };
}

+ (NSValueTransformer *)fieldToMatchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSwaf-regionalFieldToMatch class]];
}

+ (NSValueTransformer *)textTransformationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationNone);
        }
        if ([value caseInsensitiveCompare:@"COMPRESS_WHITE_SPACE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationCompressWhiteSpace);
        }
        if ([value caseInsensitiveCompare:@"HTML_ENTITY_DECODE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationHtmlEntityDecode);
        }
        if ([value caseInsensitiveCompare:@"LOWERCASE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationLowercase);
        }
        if ([value caseInsensitiveCompare:@"CMD_LINE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationCmdLine);
        }
        if ([value caseInsensitiveCompare:@"URL_DECODE"] == NSOrderedSame) {
            return @(AWSwaf-regionalTextTransformationUrlDecode);
        }
        return @(AWSwaf-regionalTextTransformationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSwaf-regionalTextTransformationNone:
                return @"NONE";
            case AWSwaf-regionalTextTransformationCompressWhiteSpace:
                return @"COMPRESS_WHITE_SPACE";
            case AWSwaf-regionalTextTransformationHtmlEntityDecode:
                return @"HTML_ENTITY_DECODE";
            case AWSwaf-regionalTextTransformationLowercase:
                return @"LOWERCASE";
            case AWSwaf-regionalTextTransformationCmdLine:
                return @"CMD_LINE";
            case AWSwaf-regionalTextTransformationUrlDecode:
                return @"URL_DECODE";
            default:
                return nil;
        }
    }];
}

@end
