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

#import "AWSSESModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSSESErrorDomain = @"com.amazonaws.AWSSESErrorDomain";

@implementation AWSSESBlacklistEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"listingTime" : @"ListingTime",
             @"rblName" : @"RblName",
             };
}

+ (NSValueTransformer *)listingTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
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

@implementation AWSSESCloudWatchDestination

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultDimensionValue" : @"DefaultDimensionValue",
             @"dimensionName" : @"DimensionName",
             @"dimensionValueSource" : @"DimensionValueSource",
             };
}

+ (NSValueTransformer *)dimensionValueSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MESSAGE_TAG"] == NSOrderedSame) {
            return @(AWSSESDimensionValueSourceMessageTag);
        }
        if ([value caseInsensitiveCompare:@"EMAIL_HEADER"] == NSOrderedSame) {
            return @(AWSSESDimensionValueSourceEmailHeader);
        }
        if ([value caseInsensitiveCompare:@"LINK_TAG"] == NSOrderedSame) {
            return @(AWSSESDimensionValueSourceLinkTag);
        }
        return @(AWSSESDimensionValueSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESDimensionValueSourceMessageTag:
                return @"MESSAGE_TAG";
            case AWSSESDimensionValueSourceEmailHeader:
                return @"EMAIL_HEADER";
            case AWSSESDimensionValueSourceLinkTag:
                return @"LINK_TAG";
            default:
                return nil;
        }
    }];
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

@implementation AWSSESCreateConfigurationSetEventDestinationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             @"eventDestination" : @"EventDestination",
             @"eventDestinationName" : @"EventDestinationName",
             };
}

+ (NSValueTransformer *)eventDestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESEventDestinationDefinition class]];
}

@end

@implementation AWSSESCreateConfigurationSetEventDestinationResponse

@end

@implementation AWSSESCreateConfigurationSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             @"deliveryOptions" : @"DeliveryOptions",
             @"reputationOptions" : @"ReputationOptions",
             @"sendingOptions" : @"SendingOptions",
             @"suppressionOptions" : @"SuppressionOptions",
             @"tags" : @"Tags",
             @"trackingOptions" : @"TrackingOptions",
             };
}

+ (NSValueTransformer *)deliveryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESDeliveryOptions class]];
}

+ (NSValueTransformer *)reputationOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESReputationOptions class]];
}

+ (NSValueTransformer *)sendingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESSendingOptions class]];
}

+ (NSValueTransformer *)suppressionOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESSuppressionOptions class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESTag class]];
}

+ (NSValueTransformer *)trackingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESTrackingOptions class]];
}

@end

@implementation AWSSESCreateConfigurationSetResponse

@end

@implementation AWSSESCreateDedicatedIpPoolRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"poolName" : @"PoolName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESTag class]];
}

@end

@implementation AWSSESCreateDedicatedIpPoolResponse

@end

@implementation AWSSESCreateDeliverabilityTestReportRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             @"fromEmailAddress" : @"FromEmailAddress",
             @"reportName" : @"ReportName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)contentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESEmailContent class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESTag class]];
}

@end

@implementation AWSSESCreateDeliverabilityTestReportResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliverabilityTestStatus" : @"DeliverabilityTestStatus",
             @"reportId" : @"ReportId",
             };
}

+ (NSValueTransformer *)deliverabilityTestStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSSESDeliverabilityTestStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSSESDeliverabilityTestStatusCompleted);
        }
        return @(AWSSESDeliverabilityTestStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESDeliverabilityTestStatusInProgress:
                return @"IN_PROGRESS";
            case AWSSESDeliverabilityTestStatusCompleted:
                return @"COMPLETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESCreateEmailIdentityRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dkimSigningAttributes" : @"DkimSigningAttributes",
             @"emailIdentity" : @"EmailIdentity",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)dkimSigningAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESDkimSigningAttributes class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESTag class]];
}

@end

@implementation AWSSESCreateEmailIdentityResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dkimAttributes" : @"DkimAttributes",
             @"identityType" : @"IdentityType",
             @"verifiedForSendingStatus" : @"VerifiedForSendingStatus",
             };
}

+ (NSValueTransformer *)dkimAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESDkimAttributes class]];
}

+ (NSValueTransformer *)identityTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EMAIL_ADDRESS"] == NSOrderedSame) {
            return @(AWSSESIdentityTypeEmailAddress);
        }
        if ([value caseInsensitiveCompare:@"DOMAIN"] == NSOrderedSame) {
            return @(AWSSESIdentityTypeDomain);
        }
        if ([value caseInsensitiveCompare:@"MANAGED_DOMAIN"] == NSOrderedSame) {
            return @(AWSSESIdentityTypeManagedDomain);
        }
        return @(AWSSESIdentityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESIdentityTypeEmailAddress:
                return @"EMAIL_ADDRESS";
            case AWSSESIdentityTypeDomain:
                return @"DOMAIN";
            case AWSSESIdentityTypeManagedDomain:
                return @"MANAGED_DOMAIN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESDailyVolume

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainIspPlacements" : @"DomainIspPlacements",
             @"startDate" : @"StartDate",
             @"volumeStatistics" : @"VolumeStatistics",
             };
}

+ (NSValueTransformer *)domainIspPlacementsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESDomainIspPlacement class]];
}

+ (NSValueTransformer *)startDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)volumeStatisticsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESVolumeStatistics class]];
}

@end

@implementation AWSSESDedicatedIp

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ip" : @"Ip",
             @"poolName" : @"PoolName",
             @"warmupPercentage" : @"WarmupPercentage",
             @"warmupStatus" : @"WarmupStatus",
             };
}

+ (NSValueTransformer *)warmupStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSSESWarmupStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"DONE"] == NSOrderedSame) {
            return @(AWSSESWarmupStatusDone);
        }
        return @(AWSSESWarmupStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESWarmupStatusInProgress:
                return @"IN_PROGRESS";
            case AWSSESWarmupStatusDone:
                return @"DONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESDeleteConfigurationSetEventDestinationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             @"eventDestinationName" : @"EventDestinationName",
             };
}

@end

@implementation AWSSESDeleteConfigurationSetEventDestinationResponse

@end

@implementation AWSSESDeleteConfigurationSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             };
}

@end

@implementation AWSSESDeleteConfigurationSetResponse

@end

@implementation AWSSESDeleteDedicatedIpPoolRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"poolName" : @"PoolName",
             };
}

@end

@implementation AWSSESDeleteDedicatedIpPoolResponse

@end

@implementation AWSSESDeleteEmailIdentityRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailIdentity" : @"EmailIdentity",
             };
}

@end

@implementation AWSSESDeleteEmailIdentityResponse

@end

@implementation AWSSESDeleteSuppressedDestinationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailAddress" : @"EmailAddress",
             };
}

@end

@implementation AWSSESDeleteSuppressedDestinationResponse

@end

@implementation AWSSESDeliverabilityTestReport

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createDate" : @"CreateDate",
             @"deliverabilityTestStatus" : @"DeliverabilityTestStatus",
             @"fromEmailAddress" : @"FromEmailAddress",
             @"reportId" : @"ReportId",
             @"reportName" : @"ReportName",
             @"subject" : @"Subject",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)deliverabilityTestStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSSESDeliverabilityTestStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSSESDeliverabilityTestStatusCompleted);
        }
        return @(AWSSESDeliverabilityTestStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESDeliverabilityTestStatusInProgress:
                return @"IN_PROGRESS";
            case AWSSESDeliverabilityTestStatusCompleted:
                return @"COMPLETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESDeliveryOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sendingPoolName" : @"SendingPoolName",
             @"tlsPolicy" : @"TlsPolicy",
             };
}

+ (NSValueTransformer *)tlsPolicyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REQUIRE"] == NSOrderedSame) {
            return @(AWSSESTlsPolicyRequire);
        }
        if ([value caseInsensitiveCompare:@"OPTIONAL"] == NSOrderedSame) {
            return @(AWSSESTlsPolicyOptional);
        }
        return @(AWSSESTlsPolicyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESTlsPolicyRequire:
                return @"REQUIRE";
            case AWSSESTlsPolicyOptional:
                return @"OPTIONAL";
            default:
                return nil;
        }
    }];
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

@implementation AWSSESDkimAttributes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"signingAttributesOrigin" : @"SigningAttributesOrigin",
             @"signingEnabled" : @"SigningEnabled",
             @"status" : @"Status",
             @"tokens" : @"Tokens",
             };
}

+ (NSValueTransformer *)signingAttributesOriginJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS_SES"] == NSOrderedSame) {
            return @(AWSSESDkimSigningAttributesOriginAwsSes);
        }
        if ([value caseInsensitiveCompare:@"EXTERNAL"] == NSOrderedSame) {
            return @(AWSSESDkimSigningAttributesOriginExternal);
        }
        return @(AWSSESDkimSigningAttributesOriginUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESDkimSigningAttributesOriginAwsSes:
                return @"AWS_SES";
            case AWSSESDkimSigningAttributesOriginExternal:
                return @"EXTERNAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSSESDkimStatusPending);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSSESDkimStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSESDkimStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TEMPORARY_FAILURE"] == NSOrderedSame) {
            return @(AWSSESDkimStatusTemporaryFailure);
        }
        if ([value caseInsensitiveCompare:@"NOT_STARTED"] == NSOrderedSame) {
            return @(AWSSESDkimStatusNotStarted);
        }
        return @(AWSSESDkimStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESDkimStatusPending:
                return @"PENDING";
            case AWSSESDkimStatusSuccess:
                return @"SUCCESS";
            case AWSSESDkimStatusFailed:
                return @"FAILED";
            case AWSSESDkimStatusTemporaryFailure:
                return @"TEMPORARY_FAILURE";
            case AWSSESDkimStatusNotStarted:
                return @"NOT_STARTED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESDkimSigningAttributes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainSigningPrivateKey" : @"DomainSigningPrivateKey",
             @"domainSigningSelector" : @"DomainSigningSelector",
             };
}

@end

@implementation AWSSESDomainDeliverabilityCampaign

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignId" : @"CampaignId",
             @"deleteRate" : @"DeleteRate",
             @"esps" : @"Esps",
             @"firstSeenDateTime" : @"FirstSeenDateTime",
             @"fromAddress" : @"FromAddress",
             @"imageUrl" : @"ImageUrl",
             @"inboxCount" : @"InboxCount",
             @"lastSeenDateTime" : @"LastSeenDateTime",
             @"projectedVolume" : @"ProjectedVolume",
             @"readDeleteRate" : @"ReadDeleteRate",
             @"readRate" : @"ReadRate",
             @"sendingIps" : @"SendingIps",
             @"spamCount" : @"SpamCount",
             @"subject" : @"Subject",
             };
}

+ (NSValueTransformer *)firstSeenDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastSeenDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSESDomainDeliverabilityTrackingOption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domain" : @"Domain",
             @"inboxPlacementTrackingOption" : @"InboxPlacementTrackingOption",
             @"subscriptionStartDate" : @"SubscriptionStartDate",
             };
}

+ (NSValueTransformer *)inboxPlacementTrackingOptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESInboxPlacementTrackingOption class]];
}

+ (NSValueTransformer *)subscriptionStartDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSESDomainIspPlacement

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inboxPercentage" : @"InboxPercentage",
             @"inboxRawCount" : @"InboxRawCount",
             @"ispName" : @"IspName",
             @"spamPercentage" : @"SpamPercentage",
             @"spamRawCount" : @"SpamRawCount",
             };
}

@end

@implementation AWSSESEmailContent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"raw" : @"Raw",
             @"simple" : @"Simple",
             @"template" : @"Template",
             };
}

+ (NSValueTransformer *)rawJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESRawMessage class]];
}

+ (NSValueTransformer *)simpleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESMessage class]];
}

+ (NSValueTransformer *)templateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESTemplate class]];
}

@end

@implementation AWSSESEventDestination

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchDestination" : @"CloudWatchDestination",
             @"enabled" : @"Enabled",
             @"kinesisFirehoseDestination" : @"KinesisFirehoseDestination",
             @"matchingEventTypes" : @"MatchingEventTypes",
             @"name" : @"Name",
             @"pinpointDestination" : @"PinpointDestination",
             @"snsDestination" : @"SnsDestination",
             };
}

+ (NSValueTransformer *)cloudWatchDestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESCloudWatchDestination class]];
}

+ (NSValueTransformer *)kinesisFirehoseDestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESKinesisFirehoseDestination class]];
}

+ (NSValueTransformer *)pinpointDestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESPinpointDestination class]];
}

+ (NSValueTransformer *)snsDestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESSnsDestination class]];
}

@end

@implementation AWSSESEventDestinationDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchDestination" : @"CloudWatchDestination",
             @"enabled" : @"Enabled",
             @"kinesisFirehoseDestination" : @"KinesisFirehoseDestination",
             @"matchingEventTypes" : @"MatchingEventTypes",
             @"pinpointDestination" : @"PinpointDestination",
             @"snsDestination" : @"SnsDestination",
             };
}

+ (NSValueTransformer *)cloudWatchDestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESCloudWatchDestination class]];
}

+ (NSValueTransformer *)kinesisFirehoseDestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESKinesisFirehoseDestination class]];
}

+ (NSValueTransformer *)pinpointDestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESPinpointDestination class]];
}

+ (NSValueTransformer *)snsDestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESSnsDestination class]];
}

@end

@implementation AWSSESGetAccountRequest

@end

@implementation AWSSESGetAccountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dedicatedIpAutoWarmupEnabled" : @"DedicatedIpAutoWarmupEnabled",
             @"enforcementStatus" : @"EnforcementStatus",
             @"productionAccessEnabled" : @"ProductionAccessEnabled",
             @"sendQuota" : @"SendQuota",
             @"sendingEnabled" : @"SendingEnabled",
             @"suppressionAttributes" : @"SuppressionAttributes",
             };
}

+ (NSValueTransformer *)sendQuotaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESSendQuota class]];
}

+ (NSValueTransformer *)suppressionAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESSuppressionAttributes class]];
}

@end

@implementation AWSSESGetBlacklistReportsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blacklistItemNames" : @"BlacklistItemNames",
             };
}

@end

@implementation AWSSESGetBlacklistReportsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blacklistReport" : @"BlacklistReport",
             };
}

+ (NSValueTransformer *)blacklistReportJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONArrayDictionary:JSONDictionary arrayElementType:@"structure" withModelClass:[AWSSESBlacklistEntry class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONArrayDictionaryFromMapMTLDictionary:mapMTLDictionary arrayElementType:@"structure"];
    }];
}

@end

@implementation AWSSESGetConfigurationSetEventDestinationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             };
}

@end

@implementation AWSSESGetConfigurationSetEventDestinationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventDestinations" : @"EventDestinations",
             };
}

+ (NSValueTransformer *)eventDestinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESEventDestination class]];
}

@end

@implementation AWSSESGetConfigurationSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             };
}

@end

@implementation AWSSESGetConfigurationSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             @"deliveryOptions" : @"DeliveryOptions",
             @"reputationOptions" : @"ReputationOptions",
             @"sendingOptions" : @"SendingOptions",
             @"suppressionOptions" : @"SuppressionOptions",
             @"tags" : @"Tags",
             @"trackingOptions" : @"TrackingOptions",
             };
}

+ (NSValueTransformer *)deliveryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESDeliveryOptions class]];
}

+ (NSValueTransformer *)reputationOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESReputationOptions class]];
}

+ (NSValueTransformer *)sendingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESSendingOptions class]];
}

+ (NSValueTransformer *)suppressionOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESSuppressionOptions class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESTag class]];
}

+ (NSValueTransformer *)trackingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESTrackingOptions class]];
}

@end

@implementation AWSSESGetDedicatedIpRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ip" : @"Ip",
             };
}

@end

@implementation AWSSESGetDedicatedIpResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dedicatedIp" : @"DedicatedIp",
             };
}

+ (NSValueTransformer *)dedicatedIpJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESDedicatedIp class]];
}

@end

@implementation AWSSESGetDedicatedIpsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"pageSize" : @"PageSize",
             @"poolName" : @"PoolName",
             };
}

@end

@implementation AWSSESGetDedicatedIpsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dedicatedIps" : @"DedicatedIps",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)dedicatedIpsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESDedicatedIp class]];
}

@end

@implementation AWSSESGetDeliverabilityDashboardOptionsRequest

@end

@implementation AWSSESGetDeliverabilityDashboardOptionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountStatus" : @"AccountStatus",
             @"activeSubscribedDomains" : @"ActiveSubscribedDomains",
             @"dashboardEnabled" : @"DashboardEnabled",
             @"pendingExpirationSubscribedDomains" : @"PendingExpirationSubscribedDomains",
             @"subscriptionExpiryDate" : @"SubscriptionExpiryDate",
             };
}

+ (NSValueTransformer *)accountStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSSESDeliverabilityDashboardAccountStatusActive);
        }
        if ([value caseInsensitiveCompare:@"PENDING_EXPIRATION"] == NSOrderedSame) {
            return @(AWSSESDeliverabilityDashboardAccountStatusPendingExpiration);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSSESDeliverabilityDashboardAccountStatusDisabled);
        }
        return @(AWSSESDeliverabilityDashboardAccountStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESDeliverabilityDashboardAccountStatusActive:
                return @"ACTIVE";
            case AWSSESDeliverabilityDashboardAccountStatusPendingExpiration:
                return @"PENDING_EXPIRATION";
            case AWSSESDeliverabilityDashboardAccountStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)activeSubscribedDomainsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESDomainDeliverabilityTrackingOption class]];
}

+ (NSValueTransformer *)pendingExpirationSubscribedDomainsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESDomainDeliverabilityTrackingOption class]];
}

+ (NSValueTransformer *)subscriptionExpiryDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSESGetDeliverabilityTestReportRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reportId" : @"ReportId",
             };
}

@end

@implementation AWSSESGetDeliverabilityTestReportResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliverabilityTestReport" : @"DeliverabilityTestReport",
             @"ispPlacements" : @"IspPlacements",
             @"message" : @"Message",
             @"overallPlacement" : @"OverallPlacement",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)deliverabilityTestReportJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESDeliverabilityTestReport class]];
}

+ (NSValueTransformer *)ispPlacementsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESIspPlacement class]];
}

+ (NSValueTransformer *)overallPlacementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESPlacementStatistics class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESTag class]];
}

@end

@implementation AWSSESGetDomainDeliverabilityCampaignRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignId" : @"CampaignId",
             };
}

@end

@implementation AWSSESGetDomainDeliverabilityCampaignResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainDeliverabilityCampaign" : @"DomainDeliverabilityCampaign",
             };
}

+ (NSValueTransformer *)domainDeliverabilityCampaignJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESDomainDeliverabilityCampaign class]];
}

@end

@implementation AWSSESGetDomainStatisticsReportRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domain" : @"Domain",
             @"endDate" : @"EndDate",
             @"startDate" : @"StartDate",
             };
}

+ (NSValueTransformer *)endDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSESGetDomainStatisticsReportResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dailyVolumes" : @"DailyVolumes",
             @"overallVolume" : @"OverallVolume",
             };
}

+ (NSValueTransformer *)dailyVolumesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESDailyVolume class]];
}

+ (NSValueTransformer *)overallVolumeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESOverallVolume class]];
}

@end

@implementation AWSSESGetEmailIdentityRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailIdentity" : @"EmailIdentity",
             };
}

@end

@implementation AWSSESGetEmailIdentityResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dkimAttributes" : @"DkimAttributes",
             @"feedbackForwardingStatus" : @"FeedbackForwardingStatus",
             @"identityType" : @"IdentityType",
             @"mailFromAttributes" : @"MailFromAttributes",
             @"tags" : @"Tags",
             @"verifiedForSendingStatus" : @"VerifiedForSendingStatus",
             };
}

+ (NSValueTransformer *)dkimAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESDkimAttributes class]];
}

+ (NSValueTransformer *)identityTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EMAIL_ADDRESS"] == NSOrderedSame) {
            return @(AWSSESIdentityTypeEmailAddress);
        }
        if ([value caseInsensitiveCompare:@"DOMAIN"] == NSOrderedSame) {
            return @(AWSSESIdentityTypeDomain);
        }
        if ([value caseInsensitiveCompare:@"MANAGED_DOMAIN"] == NSOrderedSame) {
            return @(AWSSESIdentityTypeManagedDomain);
        }
        return @(AWSSESIdentityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESIdentityTypeEmailAddress:
                return @"EMAIL_ADDRESS";
            case AWSSESIdentityTypeDomain:
                return @"DOMAIN";
            case AWSSESIdentityTypeManagedDomain:
                return @"MANAGED_DOMAIN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mailFromAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESMailFromAttributes class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESTag class]];
}

@end

@implementation AWSSESGetSuppressedDestinationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailAddress" : @"EmailAddress",
             };
}

@end

@implementation AWSSESGetSuppressedDestinationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"suppressedDestination" : @"SuppressedDestination",
             };
}

+ (NSValueTransformer *)suppressedDestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESSuppressedDestination class]];
}

@end

@implementation AWSSESIdentityInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityName" : @"IdentityName",
             @"identityType" : @"IdentityType",
             @"sendingEnabled" : @"SendingEnabled",
             };
}

+ (NSValueTransformer *)identityTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EMAIL_ADDRESS"] == NSOrderedSame) {
            return @(AWSSESIdentityTypeEmailAddress);
        }
        if ([value caseInsensitiveCompare:@"DOMAIN"] == NSOrderedSame) {
            return @(AWSSESIdentityTypeDomain);
        }
        if ([value caseInsensitiveCompare:@"MANAGED_DOMAIN"] == NSOrderedSame) {
            return @(AWSSESIdentityTypeManagedDomain);
        }
        return @(AWSSESIdentityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESIdentityTypeEmailAddress:
                return @"EMAIL_ADDRESS";
            case AWSSESIdentityTypeDomain:
                return @"DOMAIN";
            case AWSSESIdentityTypeManagedDomain:
                return @"MANAGED_DOMAIN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESInboxPlacementTrackingOption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"global" : @"Global",
             @"trackedIsps" : @"TrackedIsps",
             };
}

@end

@implementation AWSSESIspPlacement

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ispName" : @"IspName",
             @"placementStatistics" : @"PlacementStatistics",
             };
}

+ (NSValueTransformer *)placementStatisticsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESPlacementStatistics class]];
}

@end

@implementation AWSSESKinesisFirehoseDestination

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamArn" : @"DeliveryStreamArn",
             @"iamRoleArn" : @"IamRoleArn",
             };
}

@end

@implementation AWSSESListConfigurationSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"pageSize" : @"PageSize",
             };
}

@end

@implementation AWSSESListConfigurationSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSets" : @"ConfigurationSets",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSESListDedicatedIpPoolsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"pageSize" : @"PageSize",
             };
}

@end

@implementation AWSSESListDedicatedIpPoolsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dedicatedIpPools" : @"DedicatedIpPools",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSESListDeliverabilityTestReportsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"pageSize" : @"PageSize",
             };
}

@end

@implementation AWSSESListDeliverabilityTestReportsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliverabilityTestReports" : @"DeliverabilityTestReports",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)deliverabilityTestReportsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESDeliverabilityTestReport class]];
}

@end

@implementation AWSSESListDomainDeliverabilityCampaignsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endDate" : @"EndDate",
             @"nextToken" : @"NextToken",
             @"pageSize" : @"PageSize",
             @"startDate" : @"StartDate",
             @"subscribedDomain" : @"SubscribedDomain",
             };
}

+ (NSValueTransformer *)endDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSESListDomainDeliverabilityCampaignsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainDeliverabilityCampaigns" : @"DomainDeliverabilityCampaigns",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)domainDeliverabilityCampaignsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESDomainDeliverabilityCampaign class]];
}

@end

@implementation AWSSESListEmailIdentitiesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"pageSize" : @"PageSize",
             };
}

@end

@implementation AWSSESListEmailIdentitiesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailIdentities" : @"EmailIdentities",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)emailIdentitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESIdentityInfo class]];
}

@end

@implementation AWSSESListSuppressedDestinationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endDate" : @"EndDate",
             @"nextToken" : @"NextToken",
             @"pageSize" : @"PageSize",
             @"reasons" : @"Reasons",
             @"startDate" : @"StartDate",
             };
}

+ (NSValueTransformer *)endDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSESListSuppressedDestinationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"suppressedDestinationSummaries" : @"SuppressedDestinationSummaries",
             };
}

+ (NSValueTransformer *)suppressedDestinationSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESSuppressedDestinationSummary class]];
}

@end

@implementation AWSSESListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSSESListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESTag class]];
}

@end

@implementation AWSSESMailFromAttributes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"behaviorOnMxFailure" : @"BehaviorOnMxFailure",
             @"mailFromDomain" : @"MailFromDomain",
             @"mailFromDomainStatus" : @"MailFromDomainStatus",
             };
}

+ (NSValueTransformer *)behaviorOnMxFailureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USE_DEFAULT_VALUE"] == NSOrderedSame) {
            return @(AWSSESBehaviorOnMxFailureUseDefaultValue);
        }
        if ([value caseInsensitiveCompare:@"REJECT_MESSAGE"] == NSOrderedSame) {
            return @(AWSSESBehaviorOnMxFailureRejectMessage);
        }
        return @(AWSSESBehaviorOnMxFailureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESBehaviorOnMxFailureUseDefaultValue:
                return @"USE_DEFAULT_VALUE";
            case AWSSESBehaviorOnMxFailureRejectMessage:
                return @"REJECT_MESSAGE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mailFromDomainStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSSESMailFromDomainStatusPending);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSSESMailFromDomainStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSESMailFromDomainStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TEMPORARY_FAILURE"] == NSOrderedSame) {
            return @(AWSSESMailFromDomainStatusTemporaryFailure);
        }
        return @(AWSSESMailFromDomainStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESMailFromDomainStatusPending:
                return @"PENDING";
            case AWSSESMailFromDomainStatusSuccess:
                return @"SUCCESS";
            case AWSSESMailFromDomainStatusFailed:
                return @"FAILED";
            case AWSSESMailFromDomainStatusTemporaryFailure:
                return @"TEMPORARY_FAILURE";
            default:
                return nil;
        }
    }];
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

@implementation AWSSESMessageTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSSESOverallVolume

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainIspPlacements" : @"DomainIspPlacements",
             @"readRatePercent" : @"ReadRatePercent",
             @"volumeStatistics" : @"VolumeStatistics",
             };
}

+ (NSValueTransformer *)domainIspPlacementsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESDomainIspPlacement class]];
}

+ (NSValueTransformer *)volumeStatisticsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESVolumeStatistics class]];
}

@end

@implementation AWSSESPinpointDestination

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationArn" : @"ApplicationArn",
             };
}

@end

@implementation AWSSESPlacementStatistics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dkimPercentage" : @"DkimPercentage",
             @"inboxPercentage" : @"InboxPercentage",
             @"missingPercentage" : @"MissingPercentage",
             @"spamPercentage" : @"SpamPercentage",
             @"spfPercentage" : @"SpfPercentage",
             };
}

@end

@implementation AWSSESPutAccountDedicatedIpWarmupAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoWarmupEnabled" : @"AutoWarmupEnabled",
             };
}

@end

@implementation AWSSESPutAccountDedicatedIpWarmupAttributesResponse

@end

@implementation AWSSESPutAccountSendingAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sendingEnabled" : @"SendingEnabled",
             };
}

@end

@implementation AWSSESPutAccountSendingAttributesResponse

@end

@implementation AWSSESPutAccountSuppressionAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"suppressedReasons" : @"SuppressedReasons",
             };
}

@end

@implementation AWSSESPutAccountSuppressionAttributesResponse

@end

@implementation AWSSESPutConfigurationSetDeliveryOptionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             @"sendingPoolName" : @"SendingPoolName",
             @"tlsPolicy" : @"TlsPolicy",
             };
}

+ (NSValueTransformer *)tlsPolicyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REQUIRE"] == NSOrderedSame) {
            return @(AWSSESTlsPolicyRequire);
        }
        if ([value caseInsensitiveCompare:@"OPTIONAL"] == NSOrderedSame) {
            return @(AWSSESTlsPolicyOptional);
        }
        return @(AWSSESTlsPolicyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESTlsPolicyRequire:
                return @"REQUIRE";
            case AWSSESTlsPolicyOptional:
                return @"OPTIONAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESPutConfigurationSetDeliveryOptionsResponse

@end

@implementation AWSSESPutConfigurationSetReputationOptionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             @"reputationMetricsEnabled" : @"ReputationMetricsEnabled",
             };
}

@end

@implementation AWSSESPutConfigurationSetReputationOptionsResponse

@end

@implementation AWSSESPutConfigurationSetSendingOptionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             @"sendingEnabled" : @"SendingEnabled",
             };
}

@end

@implementation AWSSESPutConfigurationSetSendingOptionsResponse

@end

@implementation AWSSESPutConfigurationSetSuppressionOptionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             @"suppressedReasons" : @"SuppressedReasons",
             };
}

@end

@implementation AWSSESPutConfigurationSetSuppressionOptionsResponse

@end

@implementation AWSSESPutConfigurationSetTrackingOptionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             @"customRedirectDomain" : @"CustomRedirectDomain",
             };
}

@end

@implementation AWSSESPutConfigurationSetTrackingOptionsResponse

@end

@implementation AWSSESPutDedicatedIpInPoolRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationPoolName" : @"DestinationPoolName",
             @"ip" : @"Ip",
             };
}

@end

@implementation AWSSESPutDedicatedIpInPoolResponse

@end

@implementation AWSSESPutDedicatedIpWarmupAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ip" : @"Ip",
             @"warmupPercentage" : @"WarmupPercentage",
             };
}

@end

@implementation AWSSESPutDedicatedIpWarmupAttributesResponse

@end

@implementation AWSSESPutDeliverabilityDashboardOptionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dashboardEnabled" : @"DashboardEnabled",
             @"subscribedDomains" : @"SubscribedDomains",
             };
}

+ (NSValueTransformer *)subscribedDomainsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESDomainDeliverabilityTrackingOption class]];
}

@end

@implementation AWSSESPutDeliverabilityDashboardOptionResponse

@end

@implementation AWSSESPutEmailIdentityDkimAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailIdentity" : @"EmailIdentity",
             @"signingEnabled" : @"SigningEnabled",
             };
}

@end

@implementation AWSSESPutEmailIdentityDkimAttributesResponse

@end

@implementation AWSSESPutEmailIdentityDkimSigningAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailIdentity" : @"EmailIdentity",
             @"signingAttributes" : @"SigningAttributes",
             @"signingAttributesOrigin" : @"SigningAttributesOrigin",
             };
}

+ (NSValueTransformer *)signingAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESDkimSigningAttributes class]];
}

+ (NSValueTransformer *)signingAttributesOriginJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS_SES"] == NSOrderedSame) {
            return @(AWSSESDkimSigningAttributesOriginAwsSes);
        }
        if ([value caseInsensitiveCompare:@"EXTERNAL"] == NSOrderedSame) {
            return @(AWSSESDkimSigningAttributesOriginExternal);
        }
        return @(AWSSESDkimSigningAttributesOriginUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESDkimSigningAttributesOriginAwsSes:
                return @"AWS_SES";
            case AWSSESDkimSigningAttributesOriginExternal:
                return @"EXTERNAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESPutEmailIdentityDkimSigningAttributesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dkimStatus" : @"DkimStatus",
             @"dkimTokens" : @"DkimTokens",
             };
}

+ (NSValueTransformer *)dkimStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSSESDkimStatusPending);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSSESDkimStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSESDkimStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TEMPORARY_FAILURE"] == NSOrderedSame) {
            return @(AWSSESDkimStatusTemporaryFailure);
        }
        if ([value caseInsensitiveCompare:@"NOT_STARTED"] == NSOrderedSame) {
            return @(AWSSESDkimStatusNotStarted);
        }
        return @(AWSSESDkimStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESDkimStatusPending:
                return @"PENDING";
            case AWSSESDkimStatusSuccess:
                return @"SUCCESS";
            case AWSSESDkimStatusFailed:
                return @"FAILED";
            case AWSSESDkimStatusTemporaryFailure:
                return @"TEMPORARY_FAILURE";
            case AWSSESDkimStatusNotStarted:
                return @"NOT_STARTED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESPutEmailIdentityFeedbackAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailForwardingEnabled" : @"EmailForwardingEnabled",
             @"emailIdentity" : @"EmailIdentity",
             };
}

@end

@implementation AWSSESPutEmailIdentityFeedbackAttributesResponse

@end

@implementation AWSSESPutEmailIdentityMailFromAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"behaviorOnMxFailure" : @"BehaviorOnMxFailure",
             @"emailIdentity" : @"EmailIdentity",
             @"mailFromDomain" : @"MailFromDomain",
             };
}

+ (NSValueTransformer *)behaviorOnMxFailureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USE_DEFAULT_VALUE"] == NSOrderedSame) {
            return @(AWSSESBehaviorOnMxFailureUseDefaultValue);
        }
        if ([value caseInsensitiveCompare:@"REJECT_MESSAGE"] == NSOrderedSame) {
            return @(AWSSESBehaviorOnMxFailureRejectMessage);
        }
        return @(AWSSESBehaviorOnMxFailureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESBehaviorOnMxFailureUseDefaultValue:
                return @"USE_DEFAULT_VALUE";
            case AWSSESBehaviorOnMxFailureRejectMessage:
                return @"REJECT_MESSAGE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESPutEmailIdentityMailFromAttributesResponse

@end

@implementation AWSSESPutSuppressedDestinationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailAddress" : @"EmailAddress",
             @"reason" : @"Reason",
             };
}

+ (NSValueTransformer *)reasonJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BOUNCE"] == NSOrderedSame) {
            return @(AWSSESSuppressionListReasonBounce);
        }
        if ([value caseInsensitiveCompare:@"COMPLAINT"] == NSOrderedSame) {
            return @(AWSSESSuppressionListReasonComplaint);
        }
        return @(AWSSESSuppressionListReasonUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESSuppressionListReasonBounce:
                return @"BOUNCE";
            case AWSSESSuppressionListReasonComplaint:
                return @"COMPLAINT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESPutSuppressedDestinationResponse

@end

@implementation AWSSESRawMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"Data",
             };
}

@end

@implementation AWSSESReputationOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastFreshStart" : @"LastFreshStart",
             @"reputationMetricsEnabled" : @"ReputationMetricsEnabled",
             };
}

+ (NSValueTransformer *)lastFreshStartJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSESSendEmailRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             @"content" : @"Content",
             @"destination" : @"Destination",
             @"emailTags" : @"EmailTags",
             @"feedbackForwardingEmailAddress" : @"FeedbackForwardingEmailAddress",
             @"fromEmailAddress" : @"FromEmailAddress",
             @"replyToAddresses" : @"ReplyToAddresses",
             };
}

+ (NSValueTransformer *)contentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESEmailContent class]];
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESDestination class]];
}

+ (NSValueTransformer *)emailTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESMessageTag class]];
}

@end

@implementation AWSSESSendEmailResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageId" : @"MessageId",
             };
}

@end

@implementation AWSSESSendQuota

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"max24HourSend" : @"Max24HourSend",
             @"maxSendRate" : @"MaxSendRate",
             @"sentLast24Hours" : @"SentLast24Hours",
             };
}

@end

@implementation AWSSESSendingOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sendingEnabled" : @"SendingEnabled",
             };
}

@end

@implementation AWSSESSnsDestination

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSESSuppressedDestination

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"emailAddress" : @"EmailAddress",
             @"lastUpdateTime" : @"LastUpdateTime",
             @"reason" : @"Reason",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESSuppressedDestinationAttributes class]];
}

+ (NSValueTransformer *)lastUpdateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)reasonJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BOUNCE"] == NSOrderedSame) {
            return @(AWSSESSuppressionListReasonBounce);
        }
        if ([value caseInsensitiveCompare:@"COMPLAINT"] == NSOrderedSame) {
            return @(AWSSESSuppressionListReasonComplaint);
        }
        return @(AWSSESSuppressionListReasonUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESSuppressionListReasonBounce:
                return @"BOUNCE";
            case AWSSESSuppressionListReasonComplaint:
                return @"COMPLAINT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESSuppressedDestinationAttributes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"feedbackId" : @"FeedbackId",
             @"messageId" : @"MessageId",
             };
}

@end

@implementation AWSSESSuppressedDestinationSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailAddress" : @"EmailAddress",
             @"lastUpdateTime" : @"LastUpdateTime",
             @"reason" : @"Reason",
             };
}

+ (NSValueTransformer *)lastUpdateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)reasonJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BOUNCE"] == NSOrderedSame) {
            return @(AWSSESSuppressionListReasonBounce);
        }
        if ([value caseInsensitiveCompare:@"COMPLAINT"] == NSOrderedSame) {
            return @(AWSSESSuppressionListReasonComplaint);
        }
        return @(AWSSESSuppressionListReasonUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSESSuppressionListReasonBounce:
                return @"BOUNCE";
            case AWSSESSuppressionListReasonComplaint:
                return @"COMPLAINT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSESSuppressionAttributes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"suppressedReasons" : @"SuppressedReasons",
             };
}

@end

@implementation AWSSESSuppressionOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"suppressedReasons" : @"SuppressedReasons",
             };
}

@end

@implementation AWSSESTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSSESTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSESTag class]];
}

@end

@implementation AWSSESTagResourceResponse

@end

@implementation AWSSESTemplate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateArn" : @"TemplateArn",
             @"templateData" : @"TemplateData",
             };
}

@end

@implementation AWSSESTrackingOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customRedirectDomain" : @"CustomRedirectDomain",
             };
}

@end

@implementation AWSSESUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSSESUntagResourceResponse

@end

@implementation AWSSESUpdateConfigurationSetEventDestinationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSetName" : @"ConfigurationSetName",
             @"eventDestination" : @"EventDestination",
             @"eventDestinationName" : @"EventDestinationName",
             };
}

+ (NSValueTransformer *)eventDestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSESEventDestinationDefinition class]];
}

@end

@implementation AWSSESUpdateConfigurationSetEventDestinationResponse

@end

@implementation AWSSESVolumeStatistics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inboxRawCount" : @"InboxRawCount",
             @"projectedInbox" : @"ProjectedInbox",
             @"projectedSpam" : @"ProjectedSpam",
             @"spamRawCount" : @"SpamRawCount",
             };
}

@end
