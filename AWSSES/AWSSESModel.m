//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"headerName" : @"HeaderName",
             @"headerValue" : @"HeaderValue",
             };
}

@end

@implementation AWSSESBody

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

@implementation AWSSESCloneReceiptRuleSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"originalRuleSetName" : @"OriginalRuleSetName",
             @"ruleSetName" : @"RuleSetName",
             };
}

@end

@implementation AWSSESCloneReceiptRuleSetResponse

@end

@implementation AWSSESContent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"charset" : @"Charset",
             @"data" : @"Data",
             };
}

@end

@implementation AWSSESCreateReceiptFilterRequest

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

@end

@implementation AWSSESCreateReceiptRuleRequest

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

@end

@implementation AWSSESCreateReceiptRuleSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleSetName" : @"RuleSetName",
             };
}

@end

@implementation AWSSESCreateReceiptRuleSetResponse

@end

@implementation AWSSESDeleteIdentityPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identity" : @"Identity",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSSESDeleteIdentityPolicyResponse

@end

@implementation AWSSESDeleteIdentityRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identity" : @"Identity",
             };
}

@end

@implementation AWSSESDeleteIdentityResponse

@end

@implementation AWSSESDeleteReceiptFilterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterName" : @"FilterName",
             };
}

@end

@implementation AWSSESDeleteReceiptFilterResponse

@end

@implementation AWSSESDeleteReceiptRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleName" : @"RuleName",
             @"ruleSetName" : @"RuleSetName",
             };
}

@end

@implementation AWSSESDeleteReceiptRuleResponse

@end

@implementation AWSSESDeleteReceiptRuleSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleSetName" : @"RuleSetName",
             };
}

@end

@implementation AWSSESDeleteReceiptRuleSetResponse

@end

@implementation AWSSESDeleteVerifiedEmailAddressRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailAddress" : @"EmailAddress",
             };
}

@end

@implementation AWSSESDescribeActiveReceiptRuleSetRequest

@end

@implementation AWSSESDescribeActiveReceiptRuleSetResponse

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

@implementation AWSSESDescribeReceiptRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleName" : @"RuleName",
             @"ruleSetName" : @"RuleSetName",
             };
}

@end

@implementation AWSSESDescribeReceiptRuleResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleSetName" : @"RuleSetName",
             };
}

@end

@implementation AWSSESDescribeReceiptRuleSetResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bccAddresses" : @"BccAddresses",
             @"ccAddresses" : @"CcAddresses",
             @"toAddresses" : @"ToAddresses",
             };
}

@end

@implementation AWSSESExtensionField

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSSESGetIdentityDkimAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identities" : @"Identities",
             };
}

@end

@implementation AWSSESGetIdentityDkimAttributesResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identities" : @"Identities",
             };
}

@end

@implementation AWSSESGetIdentityMailFromDomainAttributesResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identities" : @"Identities",
             };
}

@end

@implementation AWSSESGetIdentityNotificationAttributesResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identity" : @"Identity",
             @"policyNames" : @"PolicyNames",
             };
}

@end

@implementation AWSSESGetIdentityPoliciesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policies" : @"Policies",
             };
}

@end

@implementation AWSSESGetIdentityVerificationAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identities" : @"Identities",
             };
}

@end

@implementation AWSSESGetIdentityVerificationAttributesResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"max24HourSend" : @"Max24HourSend",
             @"maxSendRate" : @"MaxSendRate",
             @"sentLast24Hours" : @"SentLast24Hours",
             };
}

@end

@implementation AWSSESGetSendStatisticsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sendDataPoints" : @"SendDataPoints",
             };
}

+ (NSValueTransformer *)sendDataPointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESSendDataPoint class]];
}

@end

@implementation AWSSESIdentityDkimAttributes

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

@implementation AWSSESLambdaAction

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

@implementation AWSSESListIdentitiesRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identities" : @"Identities",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSESListIdentityPoliciesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identity" : @"Identity",
             };
}

@end

@implementation AWSSESListIdentityPoliciesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyNames" : @"PolicyNames",
             };
}

@end

@implementation AWSSESListReceiptFiltersRequest

@end

@implementation AWSSESListReceiptFiltersResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSESListReceiptRuleSetsResponse

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

@implementation AWSSESListVerifiedEmailAddressesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"verifiedEmailAddresses" : @"VerifiedEmailAddresses",
             };
}

@end

@implementation AWSSESMessage

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

@implementation AWSSESPutIdentityPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identity" : @"Identity",
             @"policy" : @"Policy",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSSESPutIdentityPolicyResponse

@end

@implementation AWSSESRawMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"Data",
             };
}

@end

@implementation AWSSESReceiptAction

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleNames" : @"RuleNames",
             @"ruleSetName" : @"RuleSetName",
             };
}

@end

@implementation AWSSESReorderReceiptRuleSetResponse

@end

@implementation AWSSESS3Action

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

@implementation AWSSESSendBounceRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageId" : @"MessageId",
             };
}

@end

@implementation AWSSESSendDataPoint

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"Destination",
             @"message" : @"Message",
             @"replyToAddresses" : @"ReplyToAddresses",
             @"returnPath" : @"ReturnPath",
             @"returnPathArn" : @"ReturnPathArn",
             @"source" : @"Source",
             @"sourceArn" : @"SourceArn",
             };
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESDestination class]];
}

+ (NSValueTransformer *)messageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESMessage class]];
}

@end

@implementation AWSSESSendEmailResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageId" : @"MessageId",
             };
}

@end

@implementation AWSSESSendRawEmailRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinations" : @"Destinations",
             @"fromArn" : @"FromArn",
             @"rawMessage" : @"RawMessage",
             @"returnPathArn" : @"ReturnPathArn",
             @"source" : @"Source",
             @"sourceArn" : @"SourceArn",
             };
}

+ (NSValueTransformer *)rawMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESRawMessage class]];
}

@end

@implementation AWSSESSendRawEmailResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageId" : @"MessageId",
             };
}

@end

@implementation AWSSESSetActiveReceiptRuleSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleSetName" : @"RuleSetName",
             };
}

@end

@implementation AWSSESSetActiveReceiptRuleSetResponse

@end

@implementation AWSSESSetIdentityDkimEnabledRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dkimEnabled" : @"DkimEnabled",
             @"identity" : @"Identity",
             };
}

@end

@implementation AWSSESSetIdentityDkimEnabledResponse

@end

@implementation AWSSESSetIdentityFeedbackForwardingEnabledRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"forwardingEnabled" : @"ForwardingEnabled",
             @"identity" : @"Identity",
             };
}

@end

@implementation AWSSESSetIdentityFeedbackForwardingEnabledResponse

@end

@implementation AWSSESSetIdentityHeadersInNotificationsEnabledRequest

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

@end

@implementation AWSSESSetIdentityMailFromDomainRequest

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

@end

@implementation AWSSESSetIdentityNotificationTopicRequest

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

@end

@implementation AWSSESSetReceiptRulePositionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"after" : @"After",
             @"ruleName" : @"RuleName",
             @"ruleSetName" : @"RuleSetName",
             };
}

@end

@implementation AWSSESSetReceiptRulePositionResponse

@end

@implementation AWSSESStopAction

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

@implementation AWSSESUpdateReceiptRuleRequest

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

@end

@implementation AWSSESVerifyDomainDkimRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domain" : @"Domain",
             };
}

@end

@implementation AWSSESVerifyDomainDkimResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dkimTokens" : @"DkimTokens",
             };
}

@end

@implementation AWSSESVerifyDomainIdentityRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domain" : @"Domain",
             };
}

@end

@implementation AWSSESVerifyDomainIdentityResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"verificationToken" : @"VerificationToken",
             };
}

@end

@implementation AWSSESVerifyEmailAddressRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailAddress" : @"EmailAddress",
             };
}

@end

@implementation AWSSESVerifyEmailIdentityRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailAddress" : @"EmailAddress",
             };
}

@end

@implementation AWSSESVerifyEmailIdentityResponse

@end

@implementation AWSSESWorkmailAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"organizationArn" : @"OrganizationArn",
             @"topicArn" : @"TopicArn",
             };
}

@end
