//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSSESModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSSESErrorDomain = @"com.amazonaws.AWSSESErrorDomain";

@implementation AWSSESAddHeaderAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"headerName" : @"HeaderName",
             @"headerValue" : @"HeaderValue",
             };
}

@end

@implementation AWSSESBody

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"html" : @"Html",
             @"text" : @"Text",
             };
}

+ (NSValueTransformer *)htmlJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESContent class]];
}

+ (NSValueTransformer *)textJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESContent class]];
}

@end

@implementation AWSSESBounceAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"sender" : @"Sender",
             @"smtpReplyCode" : @"SmtpReplyCode",
             @"statusCode" : @"StatusCode",
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSESBouncedRecipientInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bounceType" : @"BounceType",
             @"recipient" : @"Recipient",
             @"recipientArn" : @"RecipientArn",
             @"recipientDsnFields" : @"RecipientDsnFields",
             };
}

+ (NSValueTransformer *)bounceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DoesNotExist"] == NSOrderedSame) {
            return @(AWSSESBounceTypeDoesNotExist);
        }
        if ([value caseInsensitiveCompare:@"MessageTooLarge"] == NSOrderedSame) {
            return @(AWSSESBounceTypeMessageTooLarge);
        }
        if ([value caseInsensitiveCompare:@"ExceededQuota"] == NSOrderedSame) {
            return @(AWSSESBounceTypeExceededQuota);
        }
        if ([value caseInsensitiveCompare:@"ContentRejected"] == NSOrderedSame) {
            return @(AWSSESBounceTypeContentRejected);
        }
        if ([value caseInsensitiveCompare:@"Undefined"] == NSOrderedSame) {
            return @(AWSSESBounceTypeUndefined);
        }
        if ([value caseInsensitiveCompare:@"TemporaryFailure"] == NSOrderedSame) {
            return @(AWSSESBounceTypeTemporaryFailure);
        }
        return @(AWSSESBounceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESBounceTypeDoesNotExist:
                return @"DoesNotExist";
            case AWSSESBounceTypeMessageTooLarge:
                return @"MessageTooLarge";
            case AWSSESBounceTypeExceededQuota:
                return @"ExceededQuota";
            case AWSSESBounceTypeContentRejected:
                return @"ContentRejected";
            case AWSSESBounceTypeUndefined:
                return @"Undefined";
            case AWSSESBounceTypeTemporaryFailure:
                return @"TemporaryFailure";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)recipientDsnFieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESRecipientDsnFields class]];
}

@end

@implementation AWSSESBulkEmailDestination

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"Destination",
             @"replacementTags" : @"ReplacementTags",
             @"replacementTemplateData" : @"ReplacementTemplateData",
             };
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESDestination class]];
}

+ (NSValueTransformer *)replacementTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESMessageTag class]];
}

@end

@implementation AWSSESBulkEmailDestinationStatus

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"error" : @"Error",
             @"messageId" : @"MessageId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSESBulkEmailStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"MessageRejected"] == NSOrderedSame) {
            return @(AWSSESBulkEmailStatusMessageRejected);
        }
        if ([value caseInsensitiveCompare:@"MailFromDomainNotVerified"] == NSOrderedSame) {
            return @(AWSSESBulkEmailStatusMailFromDomainNotVerified);
        }
        if ([value caseInsensitiveCompare:@"ConfigurationSetDoesNotExist"] == NSOrderedSame) {
            return @(AWSSESBulkEmailStatusConfigurationSetDoesNotExist);
        }
        if ([value caseInsensitiveCompare:@"TemplateDoesNotExist"] == NSOrderedSame) {
            return @(AWSSESBulkEmailStatusTemplateDoesNotExist);
        }
        if ([value caseInsensitiveCompare:@"AccountSuspended"] == NSOrderedSame) {
            return @(AWSSESBulkEmailStatusAccountSuspended);
        }
        if ([value caseInsensitiveCompare:@"AccountThrottled"] == NSOrderedSame) {
            return @(AWSSESBulkEmailStatusAccountThrottled);
        }
        if ([value caseInsensitiveCompare:@"AccountDailyQuotaExceeded"] == NSOrderedSame) {
            return @(AWSSESBulkEmailStatusAccountDailyQuotaExceeded);
        }
        if ([value caseInsensitiveCompare:@"InvalidSendingPoolName"] == NSOrderedSame) {
            return @(AWSSESBulkEmailStatusInvalidSendingPoolName);
        }
        if ([value caseInsensitiveCompare:@"AccountSendingPaused"] == NSOrderedSame) {
            return @(AWSSESBulkEmailStatusAccountSendingPaused);
        }
        if ([value caseInsensitiveCompare:@"ConfigurationSetSendingPaused"] == NSOrderedSame) {
            return @(AWSSESBulkEmailStatusConfigurationSetSendingPaused);
        }
        if ([value caseInsensitiveCompare:@"InvalidParameterValue"] == NSOrderedSame) {
            return @(AWSSESBulkEmailStatusInvalidParameterValue);
        }
        if ([value caseInsensitiveCompare:@"TransientFailure"] == NSOrderedSame) {
            return @(AWSSESBulkEmailStatusTransientFailure);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSESBulkEmailStatusFailed);
        }
        return @(AWSSESBulkEmailStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESBulkEmailStatusSuccess:
                return @"Success";
            case AWSSESBulkEmailStatusMessageRejected:
                return @"MessageRejected";
            case AWSSESBulkEmailStatusMailFromDomainNotVerified:
                return @"MailFromDomainNotVerified";
            case AWSSESBulkEmailStatusConfigurationSetDoesNotExist:
                return @"ConfigurationSetDoesNotExist";
            case AWSSESBulkEmailStatusTemplateDoesNotExist:
                return @"TemplateDoesNotExist";
            case AWSSESBulkEmailStatusAccountSuspended:
                return @"AccountSuspended";
            case AWSSESBulkEmailStatusAccountThrottled:
                return @"AccountThrottled";
            case AWSSESBulkEmailStatusAccountDailyQuotaExceeded:
                return @"AccountDailyQuotaExceeded";
            case AWSSESBulkEmailStatusInvalidSendingPoolName:
                return @"InvalidSendingPoolName";
            case AWSSESBulkEmailStatusAccountSendingPaused:
                return @"AccountSendingPaused";
            case AWSSESBulkEmailStatusConfigurationSetSendingPaused:
                return @"ConfigurationSetSendingPaused";
            case AWSSESBulkEmailStatusInvalidParameterValue:
                return @"InvalidParameterValue";
            case AWSSESBulkEmailStatusTransientFailure:
                return @"TransientFailure";
            case AWSSESBulkEmailStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESCloneReceiptRuleSetRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"originalRuleSetName" : @"OriginalRuleSetName",
             @"ruleSetName" : @"RuleSetName",
             };
}

@end

@implementation AWSSESCloneReceiptRuleSetResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESCloudWatchDestination

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensionConfigurations" : @"DimensionConfigurations",
             };
}

+ (NSValueTransformer *)dimensionConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESCloudWatchDimensionConfiguration class]];
}

@end

@implementation AWSSESCloudWatchDimensionConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultDimensionValue" : @"DefaultDimensionValue",
             @"dimensionName" : @"DimensionName",
             @"dimensionValueSource" : @"DimensionValueSource",
             };
}

+ (NSValueTransformer *)dimensionValueSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"messageTag"] == NSOrderedSame) {
            return @(AWSSESDimensionValueSourceMessageTag);
        }
        if ([value caseInsensitiveCompare:@"emailHeader"] == NSOrderedSame) {
            return @(AWSSESDimensionValueSourceEmailHeader);
        }
        if ([value caseInsensitiveCompare:@"linkTag"] == NSOrderedSame) {
            return @(AWSSESDimensionValueSourceLinkTag);
        }
        return @(AWSSESDimensionValueSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESDimensionValueSourceMessageTag:
                return @"messageTag";
            case AWSSESDimensionValueSourceEmailHeader:
                return @"emailHeader";
            case AWSSESDimensionValueSourceLinkTag:
                return @"linkTag";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESConfigurationSet

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSSESContent

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"charset" : @"Charset",
             @"data" : @"Data",
             };
}

@end

@implementation AWSSESCreateConfigurationSetEventDestinationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             @"eventDestination" : @"EventDestination",
             };
}

+ (NSValueTransformer *)eventDestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESEventDestination class]];
}

@end

@implementation AWSSESCreateConfigurationSetEventDestinationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESCreateConfigurationSetRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSet" : @"ConfigurationSet",
             };
}

+ (NSValueTransformer *)configurationSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESConfigurationSet class]];
}

@end

@implementation AWSSESCreateConfigurationSetResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESCreateConfigurationSetTrackingOptionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             @"trackingOptions" : @"TrackingOptions",
             };
}

+ (NSValueTransformer *)trackingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESTrackingOptions class]];
}

@end

@implementation AWSSESCreateConfigurationSetTrackingOptionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESCreateCustomVerificationEmailTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failureRedirectionURL" : @"FailureRedirectionURL",
             @"fromEmailAddress" : @"FromEmailAddress",
             @"successRedirectionURL" : @"SuccessRedirectionURL",
             @"templateContent" : @"TemplateContent",
             @"templateName" : @"TemplateName",
             @"templateSubject" : @"TemplateSubject",
             };
}

@end

@implementation AWSSESCreateReceiptFilterRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESReceiptFilter class]];
}

@end

@implementation AWSSESCreateReceiptFilterResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESCreateReceiptRuleRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"after" : @"After",
             @"rule" : @"Rule",
             @"ruleSetName" : @"RuleSetName",
             };
}

+ (NSValueTransformer *)ruleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESReceiptRule class]];
}

@end

@implementation AWSSESCreateReceiptRuleResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESCreateReceiptRuleSetRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleSetName" : @"RuleSetName",
             };
}

@end

@implementation AWSSESCreateReceiptRuleSetResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESCreateTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"template" : @"Template",
             };
}

+ (NSValueTransformer *)templateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESTemplate class]];
}

@end

@implementation AWSSESCreateTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESCustomVerificationEmailTemplate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failureRedirectionURL" : @"FailureRedirectionURL",
             @"fromEmailAddress" : @"FromEmailAddress",
             @"successRedirectionURL" : @"SuccessRedirectionURL",
             @"templateName" : @"TemplateName",
             @"templateSubject" : @"TemplateSubject",
             };
}

@end

@implementation AWSSESDeleteConfigurationSetEventDestinationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             @"eventDestinationName" : @"EventDestinationName",
             };
}

@end

@implementation AWSSESDeleteConfigurationSetEventDestinationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESDeleteConfigurationSetRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             };
}

@end

@implementation AWSSESDeleteConfigurationSetResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESDeleteConfigurationSetTrackingOptionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             };
}

@end

@implementation AWSSESDeleteConfigurationSetTrackingOptionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESDeleteCustomVerificationEmailTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateName" : @"TemplateName",
             };
}

@end

@implementation AWSSESDeleteIdentityPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identity" : @"Identity",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSSESDeleteIdentityPolicyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESDeleteIdentityRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identity" : @"Identity",
             };
}

@end

@implementation AWSSESDeleteIdentityResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESDeleteReceiptFilterRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterName" : @"FilterName",
             };
}

@end

@implementation AWSSESDeleteReceiptFilterResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESDeleteReceiptRuleRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleName" : @"RuleName",
             @"ruleSetName" : @"RuleSetName",
             };
}

@end

@implementation AWSSESDeleteReceiptRuleResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESDeleteReceiptRuleSetRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleSetName" : @"RuleSetName",
             };
}

@end

@implementation AWSSESDeleteReceiptRuleSetResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESDeleteTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateName" : @"TemplateName",
             };
}

@end

@implementation AWSSESDeleteTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESDeleteVerifiedEmailAddressRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailAddress" : @"EmailAddress",
             };
}

@end

@implementation AWSSESDeliveryOptions

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tlsPolicy" : @"TlsPolicy",
             };
}

+ (NSValueTransformer *)tlsPolicyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Require"] == NSOrderedSame) {
            return @(AWSSESTlsPolicyRequire);
        }
        if ([value caseInsensitiveCompare:@"Optional"] == NSOrderedSame) {
            return @(AWSSESTlsPolicyOptional);
        }
        return @(AWSSESTlsPolicyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESTlsPolicyRequire:
                return @"Require";
            case AWSSESTlsPolicyOptional:
                return @"Optional";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESDescribeActiveReceiptRuleSetRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESDescribeActiveReceiptRuleSetResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metadata" : @"Metadata",
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)metadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESReceiptRuleSetMetadata class]];
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESReceiptRule class]];
}

@end

@implementation AWSSESDescribeConfigurationSetRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetAttributeNames" : @"ConfigurationSetAttributeNames",
             @"configurationSetName" : @"ConfigurationSetName",
             };
}

@end

@implementation AWSSESDescribeConfigurationSetResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSet" : @"ConfigurationSet",
             @"deliveryOptions" : @"DeliveryOptions",
             @"eventDestinations" : @"EventDestinations",
             @"reputationOptions" : @"ReputationOptions",
             @"trackingOptions" : @"TrackingOptions",
             };
}

+ (NSValueTransformer *)configurationSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESConfigurationSet class]];
}

+ (NSValueTransformer *)deliveryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESDeliveryOptions class]];
}

+ (NSValueTransformer *)eventDestinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESEventDestination class]];
}

+ (NSValueTransformer *)reputationOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESReputationOptions class]];
}

+ (NSValueTransformer *)trackingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESTrackingOptions class]];
}

@end

@implementation AWSSESDescribeReceiptRuleRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleName" : @"RuleName",
             @"ruleSetName" : @"RuleSetName",
             };
}

@end

@implementation AWSSESDescribeReceiptRuleResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rule" : @"Rule",
             };
}

+ (NSValueTransformer *)ruleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESReceiptRule class]];
}

@end

@implementation AWSSESDescribeReceiptRuleSetRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleSetName" : @"RuleSetName",
             };
}

@end

@implementation AWSSESDescribeReceiptRuleSetResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metadata" : @"Metadata",
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)metadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESReceiptRuleSetMetadata class]];
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESReceiptRule class]];
}

@end

@implementation AWSSESDestination

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bccAddresses" : @"BccAddresses",
             @"ccAddresses" : @"CcAddresses",
             @"toAddresses" : @"ToAddresses",
             };
}

@end

@implementation AWSSESEventDestination

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchDestination" : @"CloudWatchDestination",
             @"enabled" : @"Enabled",
             @"kinesisFirehoseDestination" : @"KinesisFirehoseDestination",
             @"matchingEventTypes" : @"MatchingEventTypes",
             @"name" : @"Name",
             @"SNSDestination" : @"SNSDestination",
             };
}

+ (NSValueTransformer *)cloudWatchDestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESCloudWatchDestination class]];
}

+ (NSValueTransformer *)kinesisFirehoseDestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESKinesisFirehoseDestination class]];
}

+ (NSValueTransformer *)SNSDestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESSNSDestination class]];
}

@end

@implementation AWSSESExtensionField

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSSESGetAccountSendingEnabledResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSSESGetCustomVerificationEmailTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateName" : @"TemplateName",
             };
}

@end

@implementation AWSSESGetCustomVerificationEmailTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failureRedirectionURL" : @"FailureRedirectionURL",
             @"fromEmailAddress" : @"FromEmailAddress",
             @"successRedirectionURL" : @"SuccessRedirectionURL",
             @"templateContent" : @"TemplateContent",
             @"templateName" : @"TemplateName",
             @"templateSubject" : @"TemplateSubject",
             };
}

@end

@implementation AWSSESGetIdentityDkimAttributesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identities" : @"Identities",
             };
}

@end

@implementation AWSSESGetIdentityDkimAttributesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dkimAttributes" : @"DkimAttributes",
             };
}

+ (NSValueTransformer *)dkimAttributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSESIdentityDkimAttributes class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSSESGetIdentityMailFromDomainAttributesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identities" : @"Identities",
             };
}

@end

@implementation AWSSESGetIdentityMailFromDomainAttributesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mailFromDomainAttributes" : @"MailFromDomainAttributes",
             };
}

+ (NSValueTransformer *)mailFromDomainAttributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSESIdentityMailFromDomainAttributes class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSSESGetIdentityNotificationAttributesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identities" : @"Identities",
             };
}

@end

@implementation AWSSESGetIdentityNotificationAttributesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notificationAttributes" : @"NotificationAttributes",
             };
}

+ (NSValueTransformer *)notificationAttributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSESIdentityNotificationAttributes class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSSESGetIdentityPoliciesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identity" : @"Identity",
             @"policyNames" : @"PolicyNames",
             };
}

@end

@implementation AWSSESGetIdentityPoliciesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policies" : @"Policies",
             };
}

@end

@implementation AWSSESGetIdentityVerificationAttributesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identities" : @"Identities",
             };
}

@end

@implementation AWSSESGetIdentityVerificationAttributesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"verificationAttributes" : @"VerificationAttributes",
             };
}

+ (NSValueTransformer *)verificationAttributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSESIdentityVerificationAttributes class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSSESGetSendQuotaResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"max24HourSend" : @"Max24HourSend",
             @"maxSendRate" : @"MaxSendRate",
             @"sentLast24Hours" : @"SentLast24Hours",
             };
}

@end

@implementation AWSSESGetSendStatisticsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sendDataPoints" : @"SendDataPoints",
             };
}

+ (NSValueTransformer *)sendDataPointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESSendDataPoint class]];
}

@end

@implementation AWSSESGetTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateName" : @"TemplateName",
             };
}

@end

@implementation AWSSESGetTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"template" : @"Template",
             };
}

+ (NSValueTransformer *)templateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESTemplate class]];
}

@end

@implementation AWSSESIdentityDkimAttributes

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dkimEnabled" : @"DkimEnabled",
             @"dkimTokens" : @"DkimTokens",
             @"dkimVerificationStatus" : @"DkimVerificationStatus",
             };
}

+ (NSValueTransformer *)dkimVerificationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSESVerificationStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSESVerificationStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSESVerificationStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TemporaryFailure"] == NSOrderedSame) {
            return @(AWSSESVerificationStatusTemporaryFailure);
        }
        if ([value caseInsensitiveCompare:@"NotStarted"] == NSOrderedSame) {
            return @(AWSSESVerificationStatusNotStarted);
        }
        return @(AWSSESVerificationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESVerificationStatusPending:
                return @"Pending";
            case AWSSESVerificationStatusSuccess:
                return @"Success";
            case AWSSESVerificationStatusFailed:
                return @"Failed";
            case AWSSESVerificationStatusTemporaryFailure:
                return @"TemporaryFailure";
            case AWSSESVerificationStatusNotStarted:
                return @"NotStarted";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESIdentityMailFromDomainAttributes

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"behaviorOnMXFailure" : @"BehaviorOnMXFailure",
             @"mailFromDomain" : @"MailFromDomain",
             @"mailFromDomainStatus" : @"MailFromDomainStatus",
             };
}

+ (NSValueTransformer *)behaviorOnMXFailureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UseDefaultValue"] == NSOrderedSame) {
            return @(AWSSESBehaviorOnMXFailureUseDefaultValue);
        }
        if ([value caseInsensitiveCompare:@"RejectMessage"] == NSOrderedSame) {
            return @(AWSSESBehaviorOnMXFailureRejectMessage);
        }
        return @(AWSSESBehaviorOnMXFailureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESBehaviorOnMXFailureUseDefaultValue:
                return @"UseDefaultValue";
            case AWSSESBehaviorOnMXFailureRejectMessage:
                return @"RejectMessage";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mailFromDomainStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSESCustomMailFromStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSESCustomMailFromStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSESCustomMailFromStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TemporaryFailure"] == NSOrderedSame) {
            return @(AWSSESCustomMailFromStatusTemporaryFailure);
        }
        return @(AWSSESCustomMailFromStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESCustomMailFromStatusPending:
                return @"Pending";
            case AWSSESCustomMailFromStatusSuccess:
                return @"Success";
            case AWSSESCustomMailFromStatusFailed:
                return @"Failed";
            case AWSSESCustomMailFromStatusTemporaryFailure:
                return @"TemporaryFailure";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESIdentityNotificationAttributes

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bounceTopic" : @"BounceTopic",
             @"complaintTopic" : @"ComplaintTopic",
             @"deliveryTopic" : @"DeliveryTopic",
             @"forwardingEnabled" : @"ForwardingEnabled",
             @"headersInBounceNotificationsEnabled" : @"HeadersInBounceNotificationsEnabled",
             @"headersInComplaintNotificationsEnabled" : @"HeadersInComplaintNotificationsEnabled",
             @"headersInDeliveryNotificationsEnabled" : @"HeadersInDeliveryNotificationsEnabled",
             };
}

@end

@implementation AWSSESIdentityVerificationAttributes

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"verificationStatus" : @"VerificationStatus",
             @"verificationToken" : @"VerificationToken",
             };
}

+ (NSValueTransformer *)verificationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSESVerificationStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSESVerificationStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSESVerificationStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TemporaryFailure"] == NSOrderedSame) {
            return @(AWSSESVerificationStatusTemporaryFailure);
        }
        if ([value caseInsensitiveCompare:@"NotStarted"] == NSOrderedSame) {
            return @(AWSSESVerificationStatusNotStarted);
        }
        return @(AWSSESVerificationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESVerificationStatusPending:
                return @"Pending";
            case AWSSESVerificationStatusSuccess:
                return @"Success";
            case AWSSESVerificationStatusFailed:
                return @"Failed";
            case AWSSESVerificationStatusTemporaryFailure:
                return @"TemporaryFailure";
            case AWSSESVerificationStatusNotStarted:
                return @"NotStarted";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESKinesisFirehoseDestination

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamARN" : @"DeliveryStreamARN",
             @"IAMRoleARN" : @"IAMRoleARN",
             };
}

@end

@implementation AWSSESLambdaAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionArn" : @"FunctionArn",
             @"invocationType" : @"InvocationType",
             @"topicArn" : @"TopicArn",
             };
}

+ (NSValueTransformer *)invocationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Event"] == NSOrderedSame) {
            return @(AWSSESInvocationTypeEvent);
        }
        if ([value caseInsensitiveCompare:@"RequestResponse"] == NSOrderedSame) {
            return @(AWSSESInvocationTypeRequestResponse);
        }
        return @(AWSSESInvocationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESInvocationTypeEvent:
                return @"Event";
            case AWSSESInvocationTypeRequestResponse:
                return @"RequestResponse";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESListConfigurationSetsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxItems" : @"MaxItems",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSESListConfigurationSetsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSets" : @"ConfigurationSets",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)configurationSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESConfigurationSet class]];
}

@end

@implementation AWSSESListCustomVerificationEmailTemplatesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSESListCustomVerificationEmailTemplatesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customVerificationEmailTemplates" : @"CustomVerificationEmailTemplates",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)customVerificationEmailTemplatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESCustomVerificationEmailTemplate class]];
}

@end

@implementation AWSSESListIdentitiesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityType" : @"IdentityType",
             @"maxItems" : @"MaxItems",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)identityTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EmailAddress"] == NSOrderedSame) {
            return @(AWSSESIdentityTypeEmailAddress);
        }
        if ([value caseInsensitiveCompare:@"Domain"] == NSOrderedSame) {
            return @(AWSSESIdentityTypeDomain);
        }
        return @(AWSSESIdentityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESIdentityTypeEmailAddress:
                return @"EmailAddress";
            case AWSSESIdentityTypeDomain:
                return @"Domain";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESListIdentitiesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identities" : @"Identities",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSESListIdentityPoliciesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identity" : @"Identity",
             };
}

@end

@implementation AWSSESListIdentityPoliciesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyNames" : @"PolicyNames",
             };
}

@end

@implementation AWSSESListReceiptFiltersRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESListReceiptFiltersResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESReceiptFilter class]];
}

@end

@implementation AWSSESListReceiptRuleSetsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSESListReceiptRuleSetsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"ruleSets" : @"RuleSets",
             };
}

+ (NSValueTransformer *)ruleSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESReceiptRuleSetMetadata class]];
}

@end

@implementation AWSSESListTemplatesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxItems" : @"MaxItems",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSESListTemplatesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"templatesMetadata" : @"TemplatesMetadata",
             };
}

+ (NSValueTransformer *)templatesMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESTemplateMetadata class]];
}

@end

@implementation AWSSESListVerifiedEmailAddressesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"verifiedEmailAddresses" : @"VerifiedEmailAddresses",
             };
}

@end

@implementation AWSSESMessage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"subject" : @"Subject",
             };
}

+ (NSValueTransformer *)bodyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESBody class]];
}

+ (NSValueTransformer *)subjectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESContent class]];
}

@end

@implementation AWSSESMessageDsn

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arrivalDate" : @"ArrivalDate",
             @"extensionFields" : @"ExtensionFields",
             @"reportingMta" : @"ReportingMta",
             };
}

+ (NSValueTransformer *)arrivalDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)extensionFieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESExtensionField class]];
}

@end

@implementation AWSSESMessageTag

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSSESPutConfigurationSetDeliveryOptionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             @"deliveryOptions" : @"DeliveryOptions",
             };
}

+ (NSValueTransformer *)deliveryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESDeliveryOptions class]];
}

@end

@implementation AWSSESPutConfigurationSetDeliveryOptionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESPutIdentityPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identity" : @"Identity",
             @"policy" : @"Policy",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSSESPutIdentityPolicyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESRawMessage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"Data",
             };
}

@end

@implementation AWSSESReceiptAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addHeaderAction" : @"AddHeaderAction",
             @"bounceAction" : @"BounceAction",
             @"lambdaAction" : @"LambdaAction",
             @"s3Action" : @"S3Action",
             @"SNSAction" : @"SNSAction",
             @"stopAction" : @"StopAction",
             @"workmailAction" : @"WorkmailAction",
             };
}

+ (NSValueTransformer *)addHeaderActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESAddHeaderAction class]];
}

+ (NSValueTransformer *)bounceActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESBounceAction class]];
}

+ (NSValueTransformer *)lambdaActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESLambdaAction class]];
}

+ (NSValueTransformer *)s3ActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESS3Action class]];
}

+ (NSValueTransformer *)SNSActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESSNSAction class]];
}

+ (NSValueTransformer *)stopActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESStopAction class]];
}

+ (NSValueTransformer *)workmailActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESWorkmailAction class]];
}

@end

@implementation AWSSESReceiptFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ipFilter" : @"IpFilter",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)ipFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESReceiptIpFilter class]];
}

@end

@implementation AWSSESReceiptIpFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidr" : @"Cidr",
             @"policy" : @"Policy",
             };
}

+ (NSValueTransformer *)policyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Block"] == NSOrderedSame) {
            return @(AWSSESReceiptFilterPolicyBlock);
        }
        if ([value caseInsensitiveCompare:@"Allow"] == NSOrderedSame) {
            return @(AWSSESReceiptFilterPolicyAllow);
        }
        return @(AWSSESReceiptFilterPolicyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESReceiptFilterPolicyBlock:
                return @"Block";
            case AWSSESReceiptFilterPolicyAllow:
                return @"Allow";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESReceiptRule

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actions" : @"Actions",
             @"enabled" : @"Enabled",
             @"name" : @"Name",
             @"recipients" : @"Recipients",
             @"scanEnabled" : @"ScanEnabled",
             @"tlsPolicy" : @"TlsPolicy",
             };
}

+ (NSValueTransformer *)actionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESReceiptAction class]];
}

+ (NSValueTransformer *)tlsPolicyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Require"] == NSOrderedSame) {
            return @(AWSSESTlsPolicyRequire);
        }
        if ([value caseInsensitiveCompare:@"Optional"] == NSOrderedSame) {
            return @(AWSSESTlsPolicyOptional);
        }
        return @(AWSSESTlsPolicyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESTlsPolicyRequire:
                return @"Require";
            case AWSSESTlsPolicyOptional:
                return @"Optional";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESReceiptRuleSetMetadata

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdTimestamp" : @"CreatedTimestamp",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSSESRecipientDsnFields

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"diagnosticCode" : @"DiagnosticCode",
             @"extensionFields" : @"ExtensionFields",
             @"finalRecipient" : @"FinalRecipient",
             @"lastAttemptDate" : @"LastAttemptDate",
             @"remoteMta" : @"RemoteMta",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"failed"] == NSOrderedSame) {
            return @(AWSSESDsnActionFailed);
        }
        if ([value caseInsensitiveCompare:@"delayed"] == NSOrderedSame) {
            return @(AWSSESDsnActionDelayed);
        }
        if ([value caseInsensitiveCompare:@"delivered"] == NSOrderedSame) {
            return @(AWSSESDsnActionDelivered);
        }
        if ([value caseInsensitiveCompare:@"relayed"] == NSOrderedSame) {
            return @(AWSSESDsnActionRelayed);
        }
        if ([value caseInsensitiveCompare:@"expanded"] == NSOrderedSame) {
            return @(AWSSESDsnActionExpanded);
        }
        return @(AWSSESDsnActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESDsnActionFailed:
                return @"failed";
            case AWSSESDsnActionDelayed:
                return @"delayed";
            case AWSSESDsnActionDelivered:
                return @"delivered";
            case AWSSESDsnActionRelayed:
                return @"relayed";
            case AWSSESDsnActionExpanded:
                return @"expanded";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)extensionFieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESExtensionField class]];
}

+ (NSValueTransformer *)lastAttemptDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSSESReorderReceiptRuleSetRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleNames" : @"RuleNames",
             @"ruleSetName" : @"RuleSetName",
             };
}

@end

@implementation AWSSESReorderReceiptRuleSetResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESReputationOptions

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastFreshStart" : @"LastFreshStart",
             @"reputationMetricsEnabled" : @"ReputationMetricsEnabled",
             @"sendingEnabled" : @"SendingEnabled",
             };
}

+ (NSValueTransformer *)lastFreshStartJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSSESS3Action

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketName" : @"BucketName",
             @"kmsKeyArn" : @"KmsKeyArn",
             @"objectKeyPrefix" : @"ObjectKeyPrefix",
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSESSNSAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encoding" : @"Encoding",
             @"topicArn" : @"TopicArn",
             };
}

+ (NSValueTransformer *)encodingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UTF-8"] == NSOrderedSame) {
            return @(AWSSESSNSActionEncodingUtf8);
        }
        if ([value caseInsensitiveCompare:@"Base64"] == NSOrderedSame) {
            return @(AWSSESSNSActionEncodingBase64);
        }
        return @(AWSSESSNSActionEncodingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESSNSActionEncodingUtf8:
                return @"UTF-8";
            case AWSSESSNSActionEncodingBase64:
                return @"Base64";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESSNSDestination

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"topicARN" : @"TopicARN",
             };
}

@end

@implementation AWSSESSendBounceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bounceSender" : @"BounceSender",
             @"bounceSenderArn" : @"BounceSenderArn",
             @"bouncedRecipientInfoList" : @"BouncedRecipientInfoList",
             @"explanation" : @"Explanation",
             @"messageDsn" : @"MessageDsn",
             @"originalMessageId" : @"OriginalMessageId",
             };
}

+ (NSValueTransformer *)bouncedRecipientInfoListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESBouncedRecipientInfo class]];
}

+ (NSValueTransformer *)messageDsnJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESMessageDsn class]];
}

@end

@implementation AWSSESSendBounceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageId" : @"MessageId",
             };
}

@end

@implementation AWSSESSendBulkTemplatedEmailRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             @"defaultTags" : @"DefaultTags",
             @"defaultTemplateData" : @"DefaultTemplateData",
             @"destinations" : @"Destinations",
             @"replyToAddresses" : @"ReplyToAddresses",
             @"returnPath" : @"ReturnPath",
             @"returnPathArn" : @"ReturnPathArn",
             @"source" : @"Source",
             @"sourceArn" : @"SourceArn",
             @"template" : @"Template",
             @"templateArn" : @"TemplateArn",
             };
}

+ (NSValueTransformer *)defaultTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESMessageTag class]];
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESBulkEmailDestination class]];
}

@end

@implementation AWSSESSendBulkTemplatedEmailResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESBulkEmailDestinationStatus class]];
}

@end

@implementation AWSSESSendCustomVerificationEmailRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             @"emailAddress" : @"EmailAddress",
             @"templateName" : @"TemplateName",
             };
}

@end

@implementation AWSSESSendCustomVerificationEmailResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageId" : @"MessageId",
             };
}

@end

@implementation AWSSESSendDataPoint

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bounces" : @"Bounces",
             @"complaints" : @"Complaints",
             @"deliveryAttempts" : @"DeliveryAttempts",
             @"rejects" : @"Rejects",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)timestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSSESSendEmailRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             @"destination" : @"Destination",
             @"message" : @"Message",
             @"replyToAddresses" : @"ReplyToAddresses",
             @"returnPath" : @"ReturnPath",
             @"returnPathArn" : @"ReturnPathArn",
             @"source" : @"Source",
             @"sourceArn" : @"SourceArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESDestination class]];
}

+ (NSValueTransformer *)messageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESMessage class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESMessageTag class]];
}

@end

@implementation AWSSESSendEmailResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageId" : @"MessageId",
             };
}

@end

@implementation AWSSESSendRawEmailRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             @"destinations" : @"Destinations",
             @"fromArn" : @"FromArn",
             @"rawMessage" : @"RawMessage",
             @"returnPathArn" : @"ReturnPathArn",
             @"source" : @"Source",
             @"sourceArn" : @"SourceArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)rawMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESRawMessage class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESMessageTag class]];
}

@end

@implementation AWSSESSendRawEmailResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageId" : @"MessageId",
             };
}

@end

@implementation AWSSESSendTemplatedEmailRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             @"destination" : @"Destination",
             @"replyToAddresses" : @"ReplyToAddresses",
             @"returnPath" : @"ReturnPath",
             @"returnPathArn" : @"ReturnPathArn",
             @"source" : @"Source",
             @"sourceArn" : @"SourceArn",
             @"tags" : @"Tags",
             @"template" : @"Template",
             @"templateArn" : @"TemplateArn",
             @"templateData" : @"TemplateData",
             };
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESDestination class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESMessageTag class]];
}

@end

@implementation AWSSESSendTemplatedEmailResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageId" : @"MessageId",
             };
}

@end

@implementation AWSSESSetActiveReceiptRuleSetRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleSetName" : @"RuleSetName",
             };
}

@end

@implementation AWSSESSetActiveReceiptRuleSetResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESSetIdentityDkimEnabledRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dkimEnabled" : @"DkimEnabled",
             @"identity" : @"Identity",
             };
}

@end

@implementation AWSSESSetIdentityDkimEnabledResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESSetIdentityFeedbackForwardingEnabledRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"forwardingEnabled" : @"ForwardingEnabled",
             @"identity" : @"Identity",
             };
}

@end

@implementation AWSSESSetIdentityFeedbackForwardingEnabledResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESSetIdentityHeadersInNotificationsEnabledRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"identity" : @"Identity",
             @"notificationType" : @"NotificationType",
             };
}

+ (NSValueTransformer *)notificationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Bounce"] == NSOrderedSame) {
            return @(AWSSESNotificationTypeBounce);
        }
        if ([value caseInsensitiveCompare:@"Complaint"] == NSOrderedSame) {
            return @(AWSSESNotificationTypeComplaint);
        }
        if ([value caseInsensitiveCompare:@"Delivery"] == NSOrderedSame) {
            return @(AWSSESNotificationTypeDelivery);
        }
        return @(AWSSESNotificationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESNotificationTypeBounce:
                return @"Bounce";
            case AWSSESNotificationTypeComplaint:
                return @"Complaint";
            case AWSSESNotificationTypeDelivery:
                return @"Delivery";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESSetIdentityHeadersInNotificationsEnabledResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESSetIdentityMailFromDomainRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"behaviorOnMXFailure" : @"BehaviorOnMXFailure",
             @"identity" : @"Identity",
             @"mailFromDomain" : @"MailFromDomain",
             };
}

+ (NSValueTransformer *)behaviorOnMXFailureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UseDefaultValue"] == NSOrderedSame) {
            return @(AWSSESBehaviorOnMXFailureUseDefaultValue);
        }
        if ([value caseInsensitiveCompare:@"RejectMessage"] == NSOrderedSame) {
            return @(AWSSESBehaviorOnMXFailureRejectMessage);
        }
        return @(AWSSESBehaviorOnMXFailureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESBehaviorOnMXFailureUseDefaultValue:
                return @"UseDefaultValue";
            case AWSSESBehaviorOnMXFailureRejectMessage:
                return @"RejectMessage";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESSetIdentityMailFromDomainResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESSetIdentityNotificationTopicRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identity" : @"Identity",
             @"notificationType" : @"NotificationType",
             @"snsTopic" : @"SnsTopic",
             };
}

+ (NSValueTransformer *)notificationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Bounce"] == NSOrderedSame) {
            return @(AWSSESNotificationTypeBounce);
        }
        if ([value caseInsensitiveCompare:@"Complaint"] == NSOrderedSame) {
            return @(AWSSESNotificationTypeComplaint);
        }
        if ([value caseInsensitiveCompare:@"Delivery"] == NSOrderedSame) {
            return @(AWSSESNotificationTypeDelivery);
        }
        return @(AWSSESNotificationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESNotificationTypeBounce:
                return @"Bounce";
            case AWSSESNotificationTypeComplaint:
                return @"Complaint";
            case AWSSESNotificationTypeDelivery:
                return @"Delivery";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESSetIdentityNotificationTopicResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESSetReceiptRulePositionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"after" : @"After",
             @"ruleName" : @"RuleName",
             @"ruleSetName" : @"RuleSetName",
             };
}

@end

@implementation AWSSESSetReceiptRulePositionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESStopAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scope" : @"Scope",
             @"topicArn" : @"TopicArn",
             };
}

+ (NSValueTransformer *)scopeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RuleSet"] == NSOrderedSame) {
            return @(AWSSESStopScopeRuleSet);
        }
        return @(AWSSESStopScopeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESStopScopeRuleSet:
                return @"RuleSet";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESTemplate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"htmlPart" : @"HtmlPart",
             @"subjectPart" : @"SubjectPart",
             @"templateName" : @"TemplateName",
             @"textPart" : @"TextPart",
             };
}

@end

@implementation AWSSESTemplateMetadata

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdTimestamp" : @"CreatedTimestamp",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSSESTestRenderTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateData" : @"TemplateData",
             @"templateName" : @"TemplateName",
             };
}

@end

@implementation AWSSESTestRenderTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"renderedTemplate" : @"RenderedTemplate",
             };
}

@end

@implementation AWSSESTrackingOptions

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customRedirectDomain" : @"CustomRedirectDomain",
             };
}

@end

@implementation AWSSESUpdateAccountSendingEnabledRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSSESUpdateConfigurationSetEventDestinationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             @"eventDestination" : @"EventDestination",
             };
}

+ (NSValueTransformer *)eventDestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESEventDestination class]];
}

@end

@implementation AWSSESUpdateConfigurationSetEventDestinationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESUpdateConfigurationSetReputationMetricsEnabledRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSSESUpdateConfigurationSetSendingEnabledRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSSESUpdateConfigurationSetTrackingOptionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             @"trackingOptions" : @"TrackingOptions",
             };
}

+ (NSValueTransformer *)trackingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESTrackingOptions class]];
}

@end

@implementation AWSSESUpdateConfigurationSetTrackingOptionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESUpdateCustomVerificationEmailTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failureRedirectionURL" : @"FailureRedirectionURL",
             @"fromEmailAddress" : @"FromEmailAddress",
             @"successRedirectionURL" : @"SuccessRedirectionURL",
             @"templateContent" : @"TemplateContent",
             @"templateName" : @"TemplateName",
             @"templateSubject" : @"TemplateSubject",
             };
}

@end

@implementation AWSSESUpdateReceiptRuleRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rule" : @"Rule",
             @"ruleSetName" : @"RuleSetName",
             };
}

+ (NSValueTransformer *)ruleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESReceiptRule class]];
}

@end

@implementation AWSSESUpdateReceiptRuleResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESUpdateTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"template" : @"Template",
             };
}

+ (NSValueTransformer *)templateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESTemplate class]];
}

@end

@implementation AWSSESUpdateTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESVerifyDomainDkimRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domain" : @"Domain",
             };
}

@end

@implementation AWSSESVerifyDomainDkimResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dkimTokens" : @"DkimTokens",
             };
}

@end

@implementation AWSSESVerifyDomainIdentityRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domain" : @"Domain",
             };
}

@end

@implementation AWSSESVerifyDomainIdentityResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"verificationToken" : @"VerificationToken",
             };
}

@end

@implementation AWSSESVerifyEmailAddressRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailAddress" : @"EmailAddress",
             };
}

@end

@implementation AWSSESVerifyEmailIdentityRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailAddress" : @"EmailAddress",
             };
}

@end

@implementation AWSSESVerifyEmailIdentityResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSESWorkmailAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"organizationArn" : @"OrganizationArn",
             @"topicArn" : @"TopicArn",
             };
}

@end
