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

#import "AWSguarddutyModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSguarddutyErrorDomain = @"com.amazonaws.AWSguarddutyErrorDomain";

@implementation AWSguarddutyAcceptInvitationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"invitationId" : @"InvitationId",
             @"masterId" : @"MasterId",
             };
}

@end

@implementation AWSguarddutyAcceptInvitationResponse

@end

@implementation AWSguarddutyAccessKeyDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessKeyId" : @"AccessKeyId",
             @"principalId" : @"PrincipalId",
             @"userName" : @"UserName",
             @"userType" : @"UserType",
             };
}

@end

@implementation AWSguarddutyAccountDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"email" : @"Email",
             };
}

@end

@implementation AWSguarddutyAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionType" : @"ActionType",
             @"awsApiCallAction" : @"AwsApiCallAction",
             @"dnsRequestAction" : @"DnsRequestAction",
             @"networkConnectionAction" : @"NetworkConnectionAction",
             @"portProbeAction" : @"PortProbeAction",
             };
}

+ (NSValueTransformer *)awsApiCallActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyAwsApiCallAction class]];
}

+ (NSValueTransformer *)dnsRequestActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyDnsRequestAction class]];
}

+ (NSValueTransformer *)networkConnectionActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyNetworkConnectionAction class]];
}

+ (NSValueTransformer *)portProbeActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyPortProbeAction class]];
}

@end

@implementation AWSguarddutyAdminAccount

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adminAccountId" : @"AdminAccountId",
             @"adminStatus" : @"AdminStatus",
             };
}

+ (NSValueTransformer *)adminStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSguarddutyAdminStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSguarddutyAdminStatusDisableInProgress);
        }
        return @(AWSguarddutyAdminStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSguarddutyAdminStatusEnabled:
                return @"ENABLED";
            case AWSguarddutyAdminStatusDisableInProgress:
                return @"DISABLE_IN_PROGRESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSguarddutyArchiveFindingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"findingIds" : @"FindingIds",
             };
}

@end

@implementation AWSguarddutyArchiveFindingsResponse

@end

@implementation AWSguarddutyAwsApiCallAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"api" : @"Api",
             @"callerType" : @"CallerType",
             @"domainDetails" : @"DomainDetails",
             @"remoteIpDetails" : @"RemoteIpDetails",
             @"serviceName" : @"ServiceName",
             };
}

+ (NSValueTransformer *)domainDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyDomainDetails class]];
}

+ (NSValueTransformer *)remoteIpDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyRemoteIpDetails class]];
}

@end

@implementation AWSguarddutyCity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cityName" : @"CityName",
             };
}

@end

@implementation AWSguarddutyCondition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eq" : @"Eq",
             @"equals" : @"Equals",
             @"greaterThan" : @"GreaterThan",
             @"greaterThanOrEqual" : @"GreaterThanOrEqual",
             @"gt" : @"Gt",
             @"gte" : @"Gte",
             @"lessThan" : @"LessThan",
             @"lessThanOrEqual" : @"LessThanOrEqual",
             @"lt" : @"Lt",
             @"lte" : @"Lte",
             @"neq" : @"Neq",
             @"notEquals" : @"NotEquals",
             };
}

@end

@implementation AWSguarddutyCountry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"countryCode" : @"CountryCode",
             @"countryName" : @"CountryName",
             };
}

@end

@implementation AWSguarddutyCreateDetectorRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"enable" : @"Enable",
             @"findingPublishingFrequency" : @"FindingPublishingFrequency",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)findingPublishingFrequencyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FIFTEEN_MINUTES"] == NSOrderedSame) {
            return @(AWSguarddutyFindingPublishingFrequencyFifteenMinutes);
        }
        if ([value caseInsensitiveCompare:@"ONE_HOUR"] == NSOrderedSame) {
            return @(AWSguarddutyFindingPublishingFrequencyOneHour);
        }
        if ([value caseInsensitiveCompare:@"SIX_HOURS"] == NSOrderedSame) {
            return @(AWSguarddutyFindingPublishingFrequencySixHours);
        }
        return @(AWSguarddutyFindingPublishingFrequencyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSguarddutyFindingPublishingFrequencyFifteenMinutes:
                return @"FIFTEEN_MINUTES";
            case AWSguarddutyFindingPublishingFrequencyOneHour:
                return @"ONE_HOUR";
            case AWSguarddutyFindingPublishingFrequencySixHours:
                return @"SIX_HOURS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSguarddutyCreateDetectorResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSguarddutyCreateFilterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"clientToken" : @"ClientToken",
             @"detail" : @"Description",
             @"detectorId" : @"DetectorId",
             @"findingCriteria" : @"FindingCriteria",
             @"name" : @"Name",
             @"rank" : @"Rank",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOOP"] == NSOrderedSame) {
            return @(AWSguarddutyFilterActionNoop);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVE"] == NSOrderedSame) {
            return @(AWSguarddutyFilterActionArchive);
        }
        return @(AWSguarddutyFilterActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSguarddutyFilterActionNoop:
                return @"NOOP";
            case AWSguarddutyFilterActionArchive:
                return @"ARCHIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)findingCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyFindingCriteria class]];
}

@end

@implementation AWSguarddutyCreateFilterResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSguarddutyCreateIPSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activate" : @"Activate",
             @"clientToken" : @"ClientToken",
             @"detectorId" : @"DetectorId",
             @"format" : @"Format",
             @"location" : @"Location",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSguarddutyIpSetFormatTxt);
        }
        if ([value caseInsensitiveCompare:@"STIX"] == NSOrderedSame) {
            return @(AWSguarddutyIpSetFormatStix);
        }
        if ([value caseInsensitiveCompare:@"OTX_CSV"] == NSOrderedSame) {
            return @(AWSguarddutyIpSetFormatOtxCsv);
        }
        if ([value caseInsensitiveCompare:@"ALIEN_VAULT"] == NSOrderedSame) {
            return @(AWSguarddutyIpSetFormatAlienVault);
        }
        if ([value caseInsensitiveCompare:@"PROOF_POINT"] == NSOrderedSame) {
            return @(AWSguarddutyIpSetFormatProofPoint);
        }
        if ([value caseInsensitiveCompare:@"FIRE_EYE"] == NSOrderedSame) {
            return @(AWSguarddutyIpSetFormatFireEye);
        }
        return @(AWSguarddutyIpSetFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSguarddutyIpSetFormatTxt:
                return @"TXT";
            case AWSguarddutyIpSetFormatStix:
                return @"STIX";
            case AWSguarddutyIpSetFormatOtxCsv:
                return @"OTX_CSV";
            case AWSguarddutyIpSetFormatAlienVault:
                return @"ALIEN_VAULT";
            case AWSguarddutyIpSetFormatProofPoint:
                return @"PROOF_POINT";
            case AWSguarddutyIpSetFormatFireEye:
                return @"FIRE_EYE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSguarddutyCreateIPSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ipSetId" : @"IpSetId",
             };
}

@end

@implementation AWSguarddutyCreateMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountDetails" : @"AccountDetails",
             @"detectorId" : @"DetectorId",
             };
}

+ (NSValueTransformer *)accountDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSguarddutyAccountDetail class]];
}

@end

@implementation AWSguarddutyCreateMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSguarddutyUnprocessedAccount class]];
}

@end

@implementation AWSguarddutyCreatePublishingDestinationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"destinationProperties" : @"DestinationProperties",
             @"destinationType" : @"DestinationType",
             @"detectorId" : @"DetectorId",
             };
}

+ (NSValueTransformer *)destinationPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyDestinationProperties class]];
}

+ (NSValueTransformer *)destinationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSguarddutyDestinationTypeS3);
        }
        return @(AWSguarddutyDestinationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSguarddutyDestinationTypeS3:
                return @"S3";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSguarddutyCreatePublishingDestinationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationId" : @"DestinationId",
             };
}

@end

@implementation AWSguarddutyCreateSampleFindingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"findingTypes" : @"FindingTypes",
             };
}

@end

@implementation AWSguarddutyCreateSampleFindingsResponse

@end

@implementation AWSguarddutyCreateThreatIntelSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activate" : @"Activate",
             @"clientToken" : @"ClientToken",
             @"detectorId" : @"DetectorId",
             @"format" : @"Format",
             @"location" : @"Location",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSguarddutyThreatIntelSetFormatTxt);
        }
        if ([value caseInsensitiveCompare:@"STIX"] == NSOrderedSame) {
            return @(AWSguarddutyThreatIntelSetFormatStix);
        }
        if ([value caseInsensitiveCompare:@"OTX_CSV"] == NSOrderedSame) {
            return @(AWSguarddutyThreatIntelSetFormatOtxCsv);
        }
        if ([value caseInsensitiveCompare:@"ALIEN_VAULT"] == NSOrderedSame) {
            return @(AWSguarddutyThreatIntelSetFormatAlienVault);
        }
        if ([value caseInsensitiveCompare:@"PROOF_POINT"] == NSOrderedSame) {
            return @(AWSguarddutyThreatIntelSetFormatProofPoint);
        }
        if ([value caseInsensitiveCompare:@"FIRE_EYE"] == NSOrderedSame) {
            return @(AWSguarddutyThreatIntelSetFormatFireEye);
        }
        return @(AWSguarddutyThreatIntelSetFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSguarddutyThreatIntelSetFormatTxt:
                return @"TXT";
            case AWSguarddutyThreatIntelSetFormatStix:
                return @"STIX";
            case AWSguarddutyThreatIntelSetFormatOtxCsv:
                return @"OTX_CSV";
            case AWSguarddutyThreatIntelSetFormatAlienVault:
                return @"ALIEN_VAULT";
            case AWSguarddutyThreatIntelSetFormatProofPoint:
                return @"PROOF_POINT";
            case AWSguarddutyThreatIntelSetFormatFireEye:
                return @"FIRE_EYE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSguarddutyCreateThreatIntelSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"threatIntelSetId" : @"ThreatIntelSetId",
             };
}

@end

@implementation AWSguarddutyDeclineInvitationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             };
}

@end

@implementation AWSguarddutyDeclineInvitationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSguarddutyUnprocessedAccount class]];
}

@end

@implementation AWSguarddutyDeleteDetectorRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSguarddutyDeleteDetectorResponse

@end

@implementation AWSguarddutyDeleteFilterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"filterName" : @"FilterName",
             };
}

@end

@implementation AWSguarddutyDeleteFilterResponse

@end

@implementation AWSguarddutyDeleteIPSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"ipSetId" : @"IpSetId",
             };
}

@end

@implementation AWSguarddutyDeleteIPSetResponse

@end

@implementation AWSguarddutyDeleteInvitationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             };
}

@end

@implementation AWSguarddutyDeleteInvitationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSguarddutyUnprocessedAccount class]];
}

@end

@implementation AWSguarddutyDeleteMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSguarddutyDeleteMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSguarddutyUnprocessedAccount class]];
}

@end

@implementation AWSguarddutyDeletePublishingDestinationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationId" : @"DestinationId",
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSguarddutyDeletePublishingDestinationResponse

@end

@implementation AWSguarddutyDeleteThreatIntelSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"threatIntelSetId" : @"ThreatIntelSetId",
             };
}

@end

@implementation AWSguarddutyDeleteThreatIntelSetResponse

@end

@implementation AWSguarddutyDescribeOrganizationConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSguarddutyDescribeOrganizationConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoEnable" : @"AutoEnable",
             @"memberAccountLimitReached" : @"MemberAccountLimitReached",
             };
}

@end

@implementation AWSguarddutyDescribePublishingDestinationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationId" : @"DestinationId",
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSguarddutyDescribePublishingDestinationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationId" : @"DestinationId",
             @"destinationProperties" : @"DestinationProperties",
             @"destinationType" : @"DestinationType",
             @"publishingFailureStartTimestamp" : @"PublishingFailureStartTimestamp",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)destinationPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyDestinationProperties class]];
}

+ (NSValueTransformer *)destinationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSguarddutyDestinationTypeS3);
        }
        return @(AWSguarddutyDestinationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSguarddutyDestinationTypeS3:
                return @"S3";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING_VERIFICATION"] == NSOrderedSame) {
            return @(AWSguarddutyPublishingStatusPendingVerification);
        }
        if ([value caseInsensitiveCompare:@"PUBLISHING"] == NSOrderedSame) {
            return @(AWSguarddutyPublishingStatusPublishing);
        }
        if ([value caseInsensitiveCompare:@"UNABLE_TO_PUBLISH_FIX_DESTINATION_PROPERTY"] == NSOrderedSame) {
            return @(AWSguarddutyPublishingStatusUnableToPublishFixDestinationProperty);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSguarddutyPublishingStatusStopped);
        }
        return @(AWSguarddutyPublishingStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSguarddutyPublishingStatusPendingVerification:
                return @"PENDING_VERIFICATION";
            case AWSguarddutyPublishingStatusPublishing:
                return @"PUBLISHING";
            case AWSguarddutyPublishingStatusUnableToPublishFixDestinationProperty:
                return @"UNABLE_TO_PUBLISH_FIX_DESTINATION_PROPERTY";
            case AWSguarddutyPublishingStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSguarddutyDestination

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationId" : @"DestinationId",
             @"destinationType" : @"DestinationType",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)destinationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSguarddutyDestinationTypeS3);
        }
        return @(AWSguarddutyDestinationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSguarddutyDestinationTypeS3:
                return @"S3";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING_VERIFICATION"] == NSOrderedSame) {
            return @(AWSguarddutyPublishingStatusPendingVerification);
        }
        if ([value caseInsensitiveCompare:@"PUBLISHING"] == NSOrderedSame) {
            return @(AWSguarddutyPublishingStatusPublishing);
        }
        if ([value caseInsensitiveCompare:@"UNABLE_TO_PUBLISH_FIX_DESTINATION_PROPERTY"] == NSOrderedSame) {
            return @(AWSguarddutyPublishingStatusUnableToPublishFixDestinationProperty);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSguarddutyPublishingStatusStopped);
        }
        return @(AWSguarddutyPublishingStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSguarddutyPublishingStatusPendingVerification:
                return @"PENDING_VERIFICATION";
            case AWSguarddutyPublishingStatusPublishing:
                return @"PUBLISHING";
            case AWSguarddutyPublishingStatusUnableToPublishFixDestinationProperty:
                return @"UNABLE_TO_PUBLISH_FIX_DESTINATION_PROPERTY";
            case AWSguarddutyPublishingStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSguarddutyDestinationProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationArn" : @"DestinationArn",
             @"kmsKeyArn" : @"KmsKeyArn",
             };
}

@end

@implementation AWSguarddutyDisableOrganizationAdminAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adminAccountId" : @"AdminAccountId",
             };
}

@end

@implementation AWSguarddutyDisableOrganizationAdminAccountResponse

@end

@implementation AWSguarddutyDisassociateFromMasterAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSguarddutyDisassociateFromMasterAccountResponse

@end

@implementation AWSguarddutyDisassociateMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSguarddutyDisassociateMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSguarddutyUnprocessedAccount class]];
}

@end

@implementation AWSguarddutyDnsRequestAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domain" : @"Domain",
             };
}

@end

@implementation AWSguarddutyDomainDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domain" : @"Domain",
             };
}

@end

@implementation AWSguarddutyEnableOrganizationAdminAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adminAccountId" : @"AdminAccountId",
             };
}

@end

@implementation AWSguarddutyEnableOrganizationAdminAccountResponse

@end

@implementation AWSguarddutyEvidence

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"threatIntelligenceDetails" : @"ThreatIntelligenceDetails",
             };
}

+ (NSValueTransformer *)threatIntelligenceDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSguarddutyThreatIntelligenceDetail class]];
}

@end

@implementation AWSguarddutyFinding

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"arn" : @"Arn",
             @"confidence" : @"Confidence",
             @"createdAt" : @"CreatedAt",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"partition" : @"Partition",
             @"region" : @"Region",
             @"resource" : @"Resource",
             @"schemaVersion" : @"SchemaVersion",
             @"service" : @"Service",
             @"severity" : @"Severity",
             @"title" : @"Title",
             @"types" : @"Type",
             @"updatedAt" : @"UpdatedAt",
             };
}

+ (NSValueTransformer *)resourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyResource class]];
}

+ (NSValueTransformer *)serviceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyService class]];
}

@end

@implementation AWSguarddutyFindingCriteria

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"criterion" : @"Criterion",
             };
}

+ (NSValueTransformer *)criterionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSguarddutyCondition class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSguarddutyFindingStatistics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"countBySeverity" : @"CountBySeverity",
             };
}

@end

@implementation AWSguarddutyGeoLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lat" : @"Lat",
             @"lon" : @"Lon",
             };
}

@end

@implementation AWSguarddutyGetDetectorRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSguarddutyGetDetectorResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAt" : @"CreatedAt",
             @"findingPublishingFrequency" : @"FindingPublishingFrequency",
             @"serviceRole" : @"ServiceRole",
             @"status" : @"Status",
             @"tags" : @"Tags",
             @"updatedAt" : @"UpdatedAt",
             };
}

+ (NSValueTransformer *)findingPublishingFrequencyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FIFTEEN_MINUTES"] == NSOrderedSame) {
            return @(AWSguarddutyFindingPublishingFrequencyFifteenMinutes);
        }
        if ([value caseInsensitiveCompare:@"ONE_HOUR"] == NSOrderedSame) {
            return @(AWSguarddutyFindingPublishingFrequencyOneHour);
        }
        if ([value caseInsensitiveCompare:@"SIX_HOURS"] == NSOrderedSame) {
            return @(AWSguarddutyFindingPublishingFrequencySixHours);
        }
        return @(AWSguarddutyFindingPublishingFrequencyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSguarddutyFindingPublishingFrequencyFifteenMinutes:
                return @"FIFTEEN_MINUTES";
            case AWSguarddutyFindingPublishingFrequencyOneHour:
                return @"ONE_HOUR";
            case AWSguarddutyFindingPublishingFrequencySixHours:
                return @"SIX_HOURS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSguarddutyDetectorStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSguarddutyDetectorStatusDisabled);
        }
        return @(AWSguarddutyDetectorStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSguarddutyDetectorStatusEnabled:
                return @"ENABLED";
            case AWSguarddutyDetectorStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSguarddutyGetFilterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"filterName" : @"FilterName",
             };
}

@end

@implementation AWSguarddutyGetFilterResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"detail" : @"Description",
             @"findingCriteria" : @"FindingCriteria",
             @"name" : @"Name",
             @"rank" : @"Rank",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOOP"] == NSOrderedSame) {
            return @(AWSguarddutyFilterActionNoop);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVE"] == NSOrderedSame) {
            return @(AWSguarddutyFilterActionArchive);
        }
        return @(AWSguarddutyFilterActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSguarddutyFilterActionNoop:
                return @"NOOP";
            case AWSguarddutyFilterActionArchive:
                return @"ARCHIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)findingCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyFindingCriteria class]];
}

@end

@implementation AWSguarddutyGetFindingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"findingIds" : @"FindingIds",
             @"sortCriteria" : @"SortCriteria",
             };
}

+ (NSValueTransformer *)sortCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutySortCriteria class]];
}

@end

@implementation AWSguarddutyGetFindingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findings" : @"Findings",
             };
}

+ (NSValueTransformer *)findingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSguarddutyFinding class]];
}

@end

@implementation AWSguarddutyGetFindingsStatisticsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"findingCriteria" : @"FindingCriteria",
             @"findingStatisticTypes" : @"FindingStatisticTypes",
             };
}

+ (NSValueTransformer *)findingCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyFindingCriteria class]];
}

@end

@implementation AWSguarddutyGetFindingsStatisticsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findingStatistics" : @"FindingStatistics",
             };
}

+ (NSValueTransformer *)findingStatisticsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyFindingStatistics class]];
}

@end

@implementation AWSguarddutyGetIPSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"ipSetId" : @"IpSetId",
             };
}

@end

@implementation AWSguarddutyGetIPSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"format" : @"Format",
             @"location" : @"Location",
             @"name" : @"Name",
             @"status" : @"Status",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSguarddutyIpSetFormatTxt);
        }
        if ([value caseInsensitiveCompare:@"STIX"] == NSOrderedSame) {
            return @(AWSguarddutyIpSetFormatStix);
        }
        if ([value caseInsensitiveCompare:@"OTX_CSV"] == NSOrderedSame) {
            return @(AWSguarddutyIpSetFormatOtxCsv);
        }
        if ([value caseInsensitiveCompare:@"ALIEN_VAULT"] == NSOrderedSame) {
            return @(AWSguarddutyIpSetFormatAlienVault);
        }
        if ([value caseInsensitiveCompare:@"PROOF_POINT"] == NSOrderedSame) {
            return @(AWSguarddutyIpSetFormatProofPoint);
        }
        if ([value caseInsensitiveCompare:@"FIRE_EYE"] == NSOrderedSame) {
            return @(AWSguarddutyIpSetFormatFireEye);
        }
        return @(AWSguarddutyIpSetFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSguarddutyIpSetFormatTxt:
                return @"TXT";
            case AWSguarddutyIpSetFormatStix:
                return @"STIX";
            case AWSguarddutyIpSetFormatOtxCsv:
                return @"OTX_CSV";
            case AWSguarddutyIpSetFormatAlienVault:
                return @"ALIEN_VAULT";
            case AWSguarddutyIpSetFormatProofPoint:
                return @"PROOF_POINT";
            case AWSguarddutyIpSetFormatFireEye:
                return @"FIRE_EYE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSguarddutyIpSetStatusInactive);
        }
        if ([value caseInsensitiveCompare:@"ACTIVATING"] == NSOrderedSame) {
            return @(AWSguarddutyIpSetStatusActivating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSguarddutyIpSetStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DEACTIVATING"] == NSOrderedSame) {
            return @(AWSguarddutyIpSetStatusDeactivating);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSguarddutyIpSetStatusError);
        }
        if ([value caseInsensitiveCompare:@"DELETE_PENDING"] == NSOrderedSame) {
            return @(AWSguarddutyIpSetStatusDeletePending);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSguarddutyIpSetStatusDeleted);
        }
        return @(AWSguarddutyIpSetStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSguarddutyIpSetStatusInactive:
                return @"INACTIVE";
            case AWSguarddutyIpSetStatusActivating:
                return @"ACTIVATING";
            case AWSguarddutyIpSetStatusActive:
                return @"ACTIVE";
            case AWSguarddutyIpSetStatusDeactivating:
                return @"DEACTIVATING";
            case AWSguarddutyIpSetStatusError:
                return @"ERROR";
            case AWSguarddutyIpSetStatusDeletePending:
                return @"DELETE_PENDING";
            case AWSguarddutyIpSetStatusDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSguarddutyGetInvitationsCountRequest

@end

@implementation AWSguarddutyGetInvitationsCountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invitationsCount" : @"InvitationsCount",
             };
}

@end

@implementation AWSguarddutyGetMasterAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSguarddutyGetMasterAccountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"master" : @"Master",
             };
}

+ (NSValueTransformer *)masterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyMaster class]];
}

@end

@implementation AWSguarddutyGetMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSguarddutyGetMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"members" : @"Members",
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)membersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSguarddutyMember class]];
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSguarddutyUnprocessedAccount class]];
}

@end

@implementation AWSguarddutyGetThreatIntelSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"threatIntelSetId" : @"ThreatIntelSetId",
             };
}

@end

@implementation AWSguarddutyGetThreatIntelSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"format" : @"Format",
             @"location" : @"Location",
             @"name" : @"Name",
             @"status" : @"Status",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TXT"] == NSOrderedSame) {
            return @(AWSguarddutyThreatIntelSetFormatTxt);
        }
        if ([value caseInsensitiveCompare:@"STIX"] == NSOrderedSame) {
            return @(AWSguarddutyThreatIntelSetFormatStix);
        }
        if ([value caseInsensitiveCompare:@"OTX_CSV"] == NSOrderedSame) {
            return @(AWSguarddutyThreatIntelSetFormatOtxCsv);
        }
        if ([value caseInsensitiveCompare:@"ALIEN_VAULT"] == NSOrderedSame) {
            return @(AWSguarddutyThreatIntelSetFormatAlienVault);
        }
        if ([value caseInsensitiveCompare:@"PROOF_POINT"] == NSOrderedSame) {
            return @(AWSguarddutyThreatIntelSetFormatProofPoint);
        }
        if ([value caseInsensitiveCompare:@"FIRE_EYE"] == NSOrderedSame) {
            return @(AWSguarddutyThreatIntelSetFormatFireEye);
        }
        return @(AWSguarddutyThreatIntelSetFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSguarddutyThreatIntelSetFormatTxt:
                return @"TXT";
            case AWSguarddutyThreatIntelSetFormatStix:
                return @"STIX";
            case AWSguarddutyThreatIntelSetFormatOtxCsv:
                return @"OTX_CSV";
            case AWSguarddutyThreatIntelSetFormatAlienVault:
                return @"ALIEN_VAULT";
            case AWSguarddutyThreatIntelSetFormatProofPoint:
                return @"PROOF_POINT";
            case AWSguarddutyThreatIntelSetFormatFireEye:
                return @"FIRE_EYE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSguarddutyThreatIntelSetStatusInactive);
        }
        if ([value caseInsensitiveCompare:@"ACTIVATING"] == NSOrderedSame) {
            return @(AWSguarddutyThreatIntelSetStatusActivating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSguarddutyThreatIntelSetStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DEACTIVATING"] == NSOrderedSame) {
            return @(AWSguarddutyThreatIntelSetStatusDeactivating);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSguarddutyThreatIntelSetStatusError);
        }
        if ([value caseInsensitiveCompare:@"DELETE_PENDING"] == NSOrderedSame) {
            return @(AWSguarddutyThreatIntelSetStatusDeletePending);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSguarddutyThreatIntelSetStatusDeleted);
        }
        return @(AWSguarddutyThreatIntelSetStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSguarddutyThreatIntelSetStatusInactive:
                return @"INACTIVE";
            case AWSguarddutyThreatIntelSetStatusActivating:
                return @"ACTIVATING";
            case AWSguarddutyThreatIntelSetStatusActive:
                return @"ACTIVE";
            case AWSguarddutyThreatIntelSetStatusDeactivating:
                return @"DEACTIVATING";
            case AWSguarddutyThreatIntelSetStatusError:
                return @"ERROR";
            case AWSguarddutyThreatIntelSetStatusDeletePending:
                return @"DELETE_PENDING";
            case AWSguarddutyThreatIntelSetStatusDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSguarddutyIamInstanceProfile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSguarddutyInstanceDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"iamInstanceProfile" : @"IamInstanceProfile",
             @"imageDescription" : @"ImageDescription",
             @"imageId" : @"ImageId",
             @"instanceId" : @"InstanceId",
             @"instanceState" : @"InstanceState",
             @"instanceType" : @"InstanceType",
             @"launchTime" : @"LaunchTime",
             @"networkInterfaces" : @"NetworkInterfaces",
             @"outpostArn" : @"OutpostArn",
             @"platform" : @"Platform",
             @"productCodes" : @"ProductCodes",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)iamInstanceProfileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyIamInstanceProfile class]];
}

+ (NSValueTransformer *)networkInterfacesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSguarddutyNetworkInterface class]];
}

+ (NSValueTransformer *)productCodesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSguarddutyProductCode class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSguarddutyTag class]];
}

@end

@implementation AWSguarddutyInvitation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"invitationId" : @"InvitationId",
             @"invitedAt" : @"InvitedAt",
             @"relationshipStatus" : @"RelationshipStatus",
             };
}

@end

@implementation AWSguarddutyInviteMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             @"detectorId" : @"DetectorId",
             @"disableEmailNotification" : @"DisableEmailNotification",
             @"message" : @"Message",
             };
}

@end

@implementation AWSguarddutyInviteMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSguarddutyUnprocessedAccount class]];
}

@end

@implementation AWSguarddutyListDetectorsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSguarddutyListDetectorsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorIds" : @"DetectorIds",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSguarddutyListFiltersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSguarddutyListFiltersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterNames" : @"FilterNames",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSguarddutyListFindingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"findingCriteria" : @"FindingCriteria",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortCriteria" : @"SortCriteria",
             };
}

+ (NSValueTransformer *)findingCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyFindingCriteria class]];
}

+ (NSValueTransformer *)sortCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutySortCriteria class]];
}

@end

@implementation AWSguarddutyListFindingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findingIds" : @"FindingIds",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSguarddutyListIPSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSguarddutyListIPSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ipSetIds" : @"IpSetIds",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSguarddutyListInvitationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSguarddutyListInvitationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invitations" : @"Invitations",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)invitationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSguarddutyInvitation class]];
}

@end

@implementation AWSguarddutyListMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"onlyAssociated" : @"OnlyAssociated",
             };
}

@end

@implementation AWSguarddutyListMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"members" : @"Members",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)membersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSguarddutyMember class]];
}

@end

@implementation AWSguarddutyListOrganizationAdminAccountsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSguarddutyListOrganizationAdminAccountsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adminAccounts" : @"AdminAccounts",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)adminAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSguarddutyAdminAccount class]];
}

@end

@implementation AWSguarddutyListPublishingDestinationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSguarddutyListPublishingDestinationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinations" : @"Destinations",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSguarddutyDestination class]];
}

@end

@implementation AWSguarddutyListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSguarddutyListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSguarddutyListThreatIntelSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSguarddutyListThreatIntelSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"threatIntelSetIds" : @"ThreatIntelSetIds",
             };
}

@end

@implementation AWSguarddutyLocalIpDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ipAddressV4" : @"IpAddressV4",
             };
}

@end

@implementation AWSguarddutyLocalPortDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"port" : @"Port",
             @"portName" : @"PortName",
             };
}

@end

@implementation AWSguarddutyMaster

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"invitationId" : @"InvitationId",
             @"invitedAt" : @"InvitedAt",
             @"relationshipStatus" : @"RelationshipStatus",
             };
}

@end

@implementation AWSguarddutyMember

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"detectorId" : @"DetectorId",
             @"email" : @"Email",
             @"invitedAt" : @"InvitedAt",
             @"masterId" : @"MasterId",
             @"relationshipStatus" : @"RelationshipStatus",
             @"updatedAt" : @"UpdatedAt",
             };
}

@end

@implementation AWSguarddutyNetworkConnectionAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blocked" : @"Blocked",
             @"connectionDirection" : @"ConnectionDirection",
             @"localIpDetails" : @"LocalIpDetails",
             @"localPortDetails" : @"LocalPortDetails",
             @"protocols" : @"Protocol",
             @"remoteIpDetails" : @"RemoteIpDetails",
             @"remotePortDetails" : @"RemotePortDetails",
             };
}

+ (NSValueTransformer *)localIpDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyLocalIpDetails class]];
}

+ (NSValueTransformer *)localPortDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyLocalPortDetails class]];
}

+ (NSValueTransformer *)remoteIpDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyRemoteIpDetails class]];
}

+ (NSValueTransformer *)remotePortDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyRemotePortDetails class]];
}

@end

@implementation AWSguarddutyNetworkInterface

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ipv6Addresses" : @"Ipv6Addresses",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"privateDnsName" : @"PrivateDnsName",
             @"privateIpAddress" : @"PrivateIpAddress",
             @"privateIpAddresses" : @"PrivateIpAddresses",
             @"publicDnsName" : @"PublicDnsName",
             @"publicIp" : @"PublicIp",
             @"securityGroups" : @"SecurityGroups",
             @"subnetId" : @"SubnetId",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)privateIpAddressesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSguarddutyPrivateIpAddressDetails class]];
}

+ (NSValueTransformer *)securityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSguarddutySecurityGroup class]];
}

@end

@implementation AWSguarddutyOrganization

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"asn" : @"Asn",
             @"asnOrg" : @"AsnOrg",
             @"isp" : @"Isp",
             @"org" : @"Org",
             };
}

@end

@implementation AWSguarddutyPortProbeAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blocked" : @"Blocked",
             @"portProbeDetails" : @"PortProbeDetails",
             };
}

+ (NSValueTransformer *)portProbeDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSguarddutyPortProbeDetail class]];
}

@end

@implementation AWSguarddutyPortProbeDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"localIpDetails" : @"LocalIpDetails",
             @"localPortDetails" : @"LocalPortDetails",
             @"remoteIpDetails" : @"RemoteIpDetails",
             };
}

+ (NSValueTransformer *)localIpDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyLocalIpDetails class]];
}

+ (NSValueTransformer *)localPortDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyLocalPortDetails class]];
}

+ (NSValueTransformer *)remoteIpDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyRemoteIpDetails class]];
}

@end

@implementation AWSguarddutyPrivateIpAddressDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"privateDnsName" : @"PrivateDnsName",
             @"privateIpAddress" : @"PrivateIpAddress",
             };
}

@end

@implementation AWSguarddutyProductCode

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"productType" : @"ProductType",
             };
}

@end

@implementation AWSguarddutyRemoteIpDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"city" : @"City",
             @"country" : @"Country",
             @"geoLocation" : @"GeoLocation",
             @"ipAddressV4" : @"IpAddressV4",
             @"organization" : @"Organization",
             };
}

+ (NSValueTransformer *)cityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyCity class]];
}

+ (NSValueTransformer *)countryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyCountry class]];
}

+ (NSValueTransformer *)geoLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyGeoLocation class]];
}

+ (NSValueTransformer *)organizationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyOrganization class]];
}

@end

@implementation AWSguarddutyRemotePortDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"port" : @"Port",
             @"portName" : @"PortName",
             };
}

@end

@implementation AWSguarddutyResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessKeyDetails" : @"AccessKeyDetails",
             @"instanceDetails" : @"InstanceDetails",
             @"resourceType" : @"ResourceType",
             };
}

+ (NSValueTransformer *)accessKeyDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyAccessKeyDetails class]];
}

+ (NSValueTransformer *)instanceDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyInstanceDetails class]];
}

@end

@implementation AWSguarddutySecurityGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupId" : @"GroupId",
             @"groupName" : @"GroupName",
             };
}

@end

@implementation AWSguarddutyService

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"archived" : @"Archived",
             @"count" : @"Count",
             @"detectorId" : @"DetectorId",
             @"eventFirstSeen" : @"EventFirstSeen",
             @"eventLastSeen" : @"EventLastSeen",
             @"evidence" : @"Evidence",
             @"resourceRole" : @"ResourceRole",
             @"serviceName" : @"ServiceName",
             @"userFeedback" : @"UserFeedback",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyAction class]];
}

+ (NSValueTransformer *)evidenceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyEvidence class]];
}

@end

@implementation AWSguarddutySortCriteria

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"orderBy" : @"OrderBy",
             };
}

+ (NSValueTransformer *)orderByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASC"] == NSOrderedSame) {
            return @(AWSguarddutyOrderByAsc);
        }
        if ([value caseInsensitiveCompare:@"DESC"] == NSOrderedSame) {
            return @(AWSguarddutyOrderByDesc);
        }
        return @(AWSguarddutyOrderByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSguarddutyOrderByAsc:
                return @"ASC";
            case AWSguarddutyOrderByDesc:
                return @"DESC";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSguarddutyStartMonitoringMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSguarddutyStartMonitoringMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSguarddutyUnprocessedAccount class]];
}

@end

@implementation AWSguarddutyStopMonitoringMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSguarddutyStopMonitoringMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSguarddutyUnprocessedAccount class]];
}

@end

@implementation AWSguarddutyTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSguarddutyTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSguarddutyTagResourceResponse

@end

@implementation AWSguarddutyThreatIntelligenceDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"threatListName" : @"ThreatListName",
             @"threatNames" : @"ThreatNames",
             };
}

@end

@implementation AWSguarddutyUnarchiveFindingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"findingIds" : @"FindingIds",
             };
}

@end

@implementation AWSguarddutyUnarchiveFindingsResponse

@end

@implementation AWSguarddutyUnprocessedAccount

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"result" : @"Result",
             };
}

@end

@implementation AWSguarddutyUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSguarddutyUntagResourceResponse

@end

@implementation AWSguarddutyUpdateDetectorRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"enable" : @"Enable",
             @"findingPublishingFrequency" : @"FindingPublishingFrequency",
             };
}

+ (NSValueTransformer *)findingPublishingFrequencyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FIFTEEN_MINUTES"] == NSOrderedSame) {
            return @(AWSguarddutyFindingPublishingFrequencyFifteenMinutes);
        }
        if ([value caseInsensitiveCompare:@"ONE_HOUR"] == NSOrderedSame) {
            return @(AWSguarddutyFindingPublishingFrequencyOneHour);
        }
        if ([value caseInsensitiveCompare:@"SIX_HOURS"] == NSOrderedSame) {
            return @(AWSguarddutyFindingPublishingFrequencySixHours);
        }
        return @(AWSguarddutyFindingPublishingFrequencyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSguarddutyFindingPublishingFrequencyFifteenMinutes:
                return @"FIFTEEN_MINUTES";
            case AWSguarddutyFindingPublishingFrequencyOneHour:
                return @"ONE_HOUR";
            case AWSguarddutyFindingPublishingFrequencySixHours:
                return @"SIX_HOURS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSguarddutyUpdateDetectorResponse

@end

@implementation AWSguarddutyUpdateFilterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"detail" : @"Description",
             @"detectorId" : @"DetectorId",
             @"filterName" : @"FilterName",
             @"findingCriteria" : @"FindingCriteria",
             @"rank" : @"Rank",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOOP"] == NSOrderedSame) {
            return @(AWSguarddutyFilterActionNoop);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVE"] == NSOrderedSame) {
            return @(AWSguarddutyFilterActionArchive);
        }
        return @(AWSguarddutyFilterActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSguarddutyFilterActionNoop:
                return @"NOOP";
            case AWSguarddutyFilterActionArchive:
                return @"ARCHIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)findingCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyFindingCriteria class]];
}

@end

@implementation AWSguarddutyUpdateFilterResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSguarddutyUpdateFindingsFeedbackRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comments" : @"Comments",
             @"detectorId" : @"DetectorId",
             @"feedback" : @"Feedback",
             @"findingIds" : @"FindingIds",
             };
}

+ (NSValueTransformer *)feedbackJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USEFUL"] == NSOrderedSame) {
            return @(AWSguarddutyFeedbackUseful);
        }
        if ([value caseInsensitiveCompare:@"NOT_USEFUL"] == NSOrderedSame) {
            return @(AWSguarddutyFeedbackNotUseful);
        }
        return @(AWSguarddutyFeedbackUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSguarddutyFeedbackUseful:
                return @"USEFUL";
            case AWSguarddutyFeedbackNotUseful:
                return @"NOT_USEFUL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSguarddutyUpdateFindingsFeedbackResponse

@end

@implementation AWSguarddutyUpdateIPSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activate" : @"Activate",
             @"detectorId" : @"DetectorId",
             @"ipSetId" : @"IpSetId",
             @"location" : @"Location",
             @"name" : @"Name",
             };
}

@end

@implementation AWSguarddutyUpdateIPSetResponse

@end

@implementation AWSguarddutyUpdateOrganizationConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoEnable" : @"AutoEnable",
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSguarddutyUpdateOrganizationConfigurationResponse

@end

@implementation AWSguarddutyUpdatePublishingDestinationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationId" : @"DestinationId",
             @"destinationProperties" : @"DestinationProperties",
             @"detectorId" : @"DetectorId",
             };
}

+ (NSValueTransformer *)destinationPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSguarddutyDestinationProperties class]];
}

@end

@implementation AWSguarddutyUpdatePublishingDestinationResponse

@end

@implementation AWSguarddutyUpdateThreatIntelSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activate" : @"Activate",
             @"detectorId" : @"DetectorId",
             @"location" : @"Location",
             @"name" : @"Name",
             @"threatIntelSetId" : @"ThreatIntelSetId",
             };
}

@end

@implementation AWSguarddutyUpdateThreatIntelSetResponse

@end
