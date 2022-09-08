//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSSNSModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSSNSErrorDomain = @"com.amazonaws.AWSSNSErrorDomain";

@implementation AWSSNSAddPermissionInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"AWSAccountId" : @"AWSAccountId",
             @"actionName" : @"ActionName",
             @"label" : @"Label",
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSNSBatchResultErrorEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"identifier" : @"Id",
             @"message" : @"Message",
             @"senderFault" : @"SenderFault",
             };
}

@end

@implementation AWSSNSCheckIfPhoneNumberIsOptedOutInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumber" : @"phoneNumber",
             };
}

@end

@implementation AWSSNSCheckIfPhoneNumberIsOptedOutResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isOptedOut" : @"isOptedOut",
             };
}

@end

@implementation AWSSNSConfirmSubscriptionInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authenticateOnUnsubscribe" : @"AuthenticateOnUnsubscribe",
             @"token" : @"Token",
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSNSConfirmSubscriptionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subscriptionArn" : @"SubscriptionArn",
             };
}

@end

@implementation AWSSNSCreateEndpointResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSSNSCreatePlatformApplicationInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"name" : @"Name",
             @"platform" : @"Platform",
             };
}

@end

@implementation AWSSNSCreatePlatformApplicationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"platformApplicationArn" : @"PlatformApplicationArn",
             };
}

@end

@implementation AWSSNSCreatePlatformEndpointInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"customUserData" : @"CustomUserData",
             @"platformApplicationArn" : @"PlatformApplicationArn",
             @"token" : @"Token",
             };
}

@end

@implementation AWSSNSCreateSMSSandboxPhoneNumberInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"phoneNumber" : @"PhoneNumber",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSSNSLanguageCodeStringEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSSNSLanguageCodeStringEnGB);
        }
        if ([value caseInsensitiveCompare:@"es-419"] == NSOrderedSame) {
            return @(AWSSNSLanguageCodeStringEs419);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSSNSLanguageCodeStringEsES);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSSNSLanguageCodeStringDeDE);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSSNSLanguageCodeStringFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSSNSLanguageCodeStringFrFR);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSSNSLanguageCodeStringItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSSNSLanguageCodeStringJaJP);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSSNSLanguageCodeStringPtBR);
        }
        if ([value caseInsensitiveCompare:@"kr-KR"] == NSOrderedSame) {
            return @(AWSSNSLanguageCodeStringKrKR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSSNSLanguageCodeStringZhCN);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSSNSLanguageCodeStringZhTW);
        }
        return @(AWSSNSLanguageCodeStringUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSNSLanguageCodeStringEnUS:
                return @"en-US";
            case AWSSNSLanguageCodeStringEnGB:
                return @"en-GB";
            case AWSSNSLanguageCodeStringEs419:
                return @"es-419";
            case AWSSNSLanguageCodeStringEsES:
                return @"es-ES";
            case AWSSNSLanguageCodeStringDeDE:
                return @"de-DE";
            case AWSSNSLanguageCodeStringFrCA:
                return @"fr-CA";
            case AWSSNSLanguageCodeStringFrFR:
                return @"fr-FR";
            case AWSSNSLanguageCodeStringItIT:
                return @"it-IT";
            case AWSSNSLanguageCodeStringJaJP:
                return @"ja-JP";
            case AWSSNSLanguageCodeStringPtBR:
                return @"pt-BR";
            case AWSSNSLanguageCodeStringKrKR:
                return @"kr-KR";
            case AWSSNSLanguageCodeStringZhCN:
                return @"zh-CN";
            case AWSSNSLanguageCodeStringZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSNSCreateSMSSandboxPhoneNumberResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSNSCreateTopicInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"dataProtectionPolicy" : @"DataProtectionPolicy",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSNSTag class]];
}

@end

@implementation AWSSNSCreateTopicResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSNSDeleteEndpointInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSSNSDeletePlatformApplicationInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"platformApplicationArn" : @"PlatformApplicationArn",
             };
}

@end

@implementation AWSSNSDeleteSMSSandboxPhoneNumberInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumber" : @"PhoneNumber",
             };
}

@end

@implementation AWSSNSDeleteSMSSandboxPhoneNumberResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSNSDeleteTopicInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSNSEndpoint

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSSNSGetDataProtectionPolicyInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSSNSGetDataProtectionPolicyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataProtectionPolicy" : @"DataProtectionPolicy",
             };
}

@end

@implementation AWSSNSGetEndpointAttributesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSSNSGetEndpointAttributesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             };
}

@end

@implementation AWSSNSGetPlatformApplicationAttributesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"platformApplicationArn" : @"PlatformApplicationArn",
             };
}

@end

@implementation AWSSNSGetPlatformApplicationAttributesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             };
}

@end

@implementation AWSSNSGetSMSAttributesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"attributes",
             };
}

@end

@implementation AWSSNSGetSMSAttributesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"attributes",
             };
}

@end

@implementation AWSSNSGetSMSSandboxAccountStatusInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSNSGetSMSSandboxAccountStatusResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isInSandbox" : @"IsInSandbox",
             };
}

@end

@implementation AWSSNSGetSubscriptionAttributesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subscriptionArn" : @"SubscriptionArn",
             };
}

@end

@implementation AWSSNSGetSubscriptionAttributesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             };
}

@end

@implementation AWSSNSGetTopicAttributesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSNSGetTopicAttributesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             };
}

@end

@implementation AWSSNSListEndpointsByPlatformApplicationInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"platformApplicationArn" : @"PlatformApplicationArn",
             };
}

@end

@implementation AWSSNSListEndpointsByPlatformApplicationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoints" : @"Endpoints",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)endpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSNSEndpoint class]];
}

@end

@implementation AWSSNSListOriginationNumbersRequest

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

@implementation AWSSNSListOriginationNumbersResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"phoneNumbers" : @"PhoneNumbers",
             };
}

+ (NSValueTransformer *)phoneNumbersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSNSPhoneNumberInformation class]];
}

@end

@implementation AWSSNSListPhoneNumbersOptedOutInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSSNSListPhoneNumbersOptedOutResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"phoneNumbers" : @"phoneNumbers",
             };
}

@end

@implementation AWSSNSListPlatformApplicationsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSNSListPlatformApplicationsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"platformApplications" : @"PlatformApplications",
             };
}

+ (NSValueTransformer *)platformApplicationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSNSPlatformApplication class]];
}

@end

@implementation AWSSNSListSMSSandboxPhoneNumbersInput

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

@implementation AWSSNSListSMSSandboxPhoneNumbersResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"phoneNumbers" : @"PhoneNumbers",
             };
}

+ (NSValueTransformer *)phoneNumbersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSNSSMSSandboxPhoneNumber class]];
}

@end

@implementation AWSSNSListSubscriptionsByTopicInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSNSListSubscriptionsByTopicResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"subscriptions" : @"Subscriptions",
             };
}

+ (NSValueTransformer *)subscriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSNSSubscription class]];
}

@end

@implementation AWSSNSListSubscriptionsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSNSListSubscriptionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"subscriptions" : @"Subscriptions",
             };
}

+ (NSValueTransformer *)subscriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSNSSubscription class]];
}

@end

@implementation AWSSNSListTagsForResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSSNSListTagsForResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSNSTag class]];
}

@end

@implementation AWSSNSListTopicsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSNSListTopicsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"topics" : @"Topics",
             };
}

+ (NSValueTransformer *)topicsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSNSTopic class]];
}

@end

@implementation AWSSNSMessageAttributeValue

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"binaryValue" : @"BinaryValue",
             @"dataType" : @"DataType",
             @"stringValue" : @"StringValue",
             };
}

@end

@implementation AWSSNSOptInPhoneNumberInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumber" : @"phoneNumber",
             };
}

@end

@implementation AWSSNSOptInPhoneNumberResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSNSPhoneNumberInformation

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAt" : @"CreatedAt",
             @"iso2CountryCode" : @"Iso2CountryCode",
             @"numberCapabilities" : @"NumberCapabilities",
             @"phoneNumber" : @"PhoneNumber",
             @"routeType" : @"RouteType",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)routeTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Transactional"] == NSOrderedSame) {
            return @(AWSSNSRouteTypeTransactional);
        }
        if ([value caseInsensitiveCompare:@"Promotional"] == NSOrderedSame) {
            return @(AWSSNSRouteTypePromotional);
        }
        if ([value caseInsensitiveCompare:@"Premium"] == NSOrderedSame) {
            return @(AWSSNSRouteTypePremium);
        }
        return @(AWSSNSRouteTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSNSRouteTypeTransactional:
                return @"Transactional";
            case AWSSNSRouteTypePromotional:
                return @"Promotional";
            case AWSSNSRouteTypePremium:
                return @"Premium";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSNSPlatformApplication

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"platformApplicationArn" : @"PlatformApplicationArn",
             };
}

@end

@implementation AWSSNSPublishBatchInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"publishBatchRequestEntries" : @"PublishBatchRequestEntries",
             @"topicArn" : @"TopicArn",
             };
}

+ (NSValueTransformer *)publishBatchRequestEntriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSNSPublishBatchRequestEntry class]];
}

@end

@implementation AWSSNSPublishBatchRequestEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"message" : @"Message",
             @"messageAttributes" : @"MessageAttributes",
             @"messageDeduplicationId" : @"MessageDeduplicationId",
             @"messageGroupId" : @"MessageGroupId",
             @"messageStructure" : @"MessageStructure",
             @"subject" : @"Subject",
             };
}

+ (NSValueTransformer *)messageAttributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSNSMessageAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSSNSPublishBatchResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failed" : @"Failed",
             @"successful" : @"Successful",
             };
}

+ (NSValueTransformer *)failedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSNSBatchResultErrorEntry class]];
}

+ (NSValueTransformer *)successfulJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSNSPublishBatchResultEntry class]];
}

@end

@implementation AWSSNSPublishBatchResultEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"messageId" : @"MessageId",
             @"sequenceNumber" : @"SequenceNumber",
             };
}

@end

@implementation AWSSNSPublishInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"messageAttributes" : @"MessageAttributes",
             @"messageDeduplicationId" : @"MessageDeduplicationId",
             @"messageGroupId" : @"MessageGroupId",
             @"messageStructure" : @"MessageStructure",
             @"phoneNumber" : @"PhoneNumber",
             @"subject" : @"Subject",
             @"targetArn" : @"TargetArn",
             @"topicArn" : @"TopicArn",
             };
}

+ (NSValueTransformer *)messageAttributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSNSMessageAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSSNSPublishResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageId" : @"MessageId",
             @"sequenceNumber" : @"SequenceNumber",
             };
}

@end

@implementation AWSSNSPutDataProtectionPolicyInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataProtectionPolicy" : @"DataProtectionPolicy",
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSSNSRemovePermissionInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"label" : @"Label",
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSNSSMSSandboxPhoneNumber

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumber" : @"PhoneNumber",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSNSSMSSandboxPhoneNumberVerificationStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Verified"] == NSOrderedSame) {
            return @(AWSSNSSMSSandboxPhoneNumberVerificationStatusVerified);
        }
        return @(AWSSNSSMSSandboxPhoneNumberVerificationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSNSSMSSandboxPhoneNumberVerificationStatusPending:
                return @"Pending";
            case AWSSNSSMSSandboxPhoneNumberVerificationStatusVerified:
                return @"Verified";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSNSSetEndpointAttributesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSSNSSetPlatformApplicationAttributesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"platformApplicationArn" : @"PlatformApplicationArn",
             };
}

@end

@implementation AWSSNSSetSMSAttributesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"attributes",
             };
}

@end

@implementation AWSSNSSetSMSAttributesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSNSSetSubscriptionAttributesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"attributeValue" : @"AttributeValue",
             @"subscriptionArn" : @"SubscriptionArn",
             };
}

@end

@implementation AWSSNSSetTopicAttributesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"attributeValue" : @"AttributeValue",
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSNSSubscribeInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"endpoint" : @"Endpoint",
             @"protocols" : @"Protocol",
             @"returnSubscriptionArn" : @"ReturnSubscriptionArn",
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSNSSubscribeResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subscriptionArn" : @"SubscriptionArn",
             };
}

@end

@implementation AWSSNSSubscription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoint" : @"Endpoint",
             @"owner" : @"Owner",
             @"protocols" : @"Protocol",
             @"subscriptionArn" : @"SubscriptionArn",
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSNSTag

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSSNSTagResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSNSTag class]];
}

@end

@implementation AWSSNSTagResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSNSTopic

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSNSUnsubscribeInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subscriptionArn" : @"SubscriptionArn",
             };
}

@end

@implementation AWSSNSUntagResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSSNSUntagResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSNSVerifySMSSandboxPhoneNumberInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"oneTimePassword" : @"OneTimePassword",
             @"phoneNumber" : @"PhoneNumber",
             };
}

@end

@implementation AWSSNSVerifySMSSandboxPhoneNumberResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end
