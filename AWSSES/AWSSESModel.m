//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

@implementation AWSSESContent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"charset" : @"Charset",
             @"data" : @"Data",
             };
}

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

@implementation AWSSESDeleteVerifiedEmailAddressRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailAddress" : @"EmailAddress",
             };
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
        if ([value isEqualToString:@"Pending"]) {
            return @(AWSSESVerificationStatusPending);
        }
        if ([value isEqualToString:@"Success"]) {
            return @(AWSSESVerificationStatusSuccess);
        }
        if ([value isEqualToString:@"Failed"]) {
            return @(AWSSESVerificationStatusFailed);
        }
        if ([value isEqualToString:@"TemporaryFailure"]) {
            return @(AWSSESVerificationStatusTemporaryFailure);
        }
        if ([value isEqualToString:@"NotStarted"]) {
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
            case AWSSESVerificationStatusUnknown:
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
        if ([value isEqualToString:@"Pending"]) {
            return @(AWSSESVerificationStatusPending);
        }
        if ([value isEqualToString:@"Success"]) {
            return @(AWSSESVerificationStatusSuccess);
        }
        if ([value isEqualToString:@"Failed"]) {
            return @(AWSSESVerificationStatusFailed);
        }
        if ([value isEqualToString:@"TemporaryFailure"]) {
            return @(AWSSESVerificationStatusTemporaryFailure);
        }
        if ([value isEqualToString:@"NotStarted"]) {
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
            case AWSSESVerificationStatusUnknown:
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
        if ([value isEqualToString:@"EmailAddress"]) {
            return @(AWSSESIdentityTypeEmailAddress);
        }
        if ([value isEqualToString:@"Domain"]) {
            return @(AWSSESIdentityTypeDomain);
        }
        return @(AWSSESIdentityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESIdentityTypeEmailAddress:
                return @"EmailAddress";
            case AWSSESIdentityTypeDomain:
                return @"Domain";
            case AWSSESIdentityTypeUnknown:
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

@implementation AWSSESRawMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"Data",
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
             @"source" : @"Source",
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
             @"rawMessage" : @"RawMessage",
             @"source" : @"Source",
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
        if ([value isEqualToString:@"Bounce"]) {
            return @(AWSSESNotificationTypeBounce);
        }
        if ([value isEqualToString:@"Complaint"]) {
            return @(AWSSESNotificationTypeComplaint);
        }
        if ([value isEqualToString:@"Delivery"]) {
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
            case AWSSESNotificationTypeUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESSetIdentityNotificationTopicResponse

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
