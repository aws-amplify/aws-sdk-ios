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

#import "AWSGuardDutyModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSGuardDutyErrorDomain = @"com.amazonaws.AWSGuardDutyErrorDomain";

@implementation AWSGuardDutyAcceptInvitationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"invitationId" : @"InvitationId",
             @"masterId" : @"MasterId",
             };
}

@end

@implementation AWSGuardDutyAcceptInvitationResponse

@end

@implementation AWSGuardDutyAccessKeyDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessKeyId" : @"AccessKeyId",
             @"principalId" : @"PrincipalId",
             @"userName" : @"UserName",
             @"userType" : @"UserType",
             };
}

@end

@implementation AWSGuardDutyAccountDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"email" : @"Email",
             };
}

@end

@implementation AWSGuardDutyAction

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyAwsApiCallAction class]];
}

+ (NSValueTransformer *)dnsRequestActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyDnsRequestAction class]];
}

+ (NSValueTransformer *)networkConnectionActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyNetworkConnectionAction class]];
}

+ (NSValueTransformer *)portProbeActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyPortProbeAction class]];
}

@end

@implementation AWSGuardDutyAdminAccount

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adminAccountId" : @"AdminAccountId",
             @"adminStatus" : @"AdminStatus",
             };
}

+ (NSValueTransformer *)adminStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSGuardDutyAdminStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSGuardDutyAdminStatusDisableInProgress);
        }
        return @(AWSGuardDutyAdminStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuardDutyAdminStatusEnabled:
                return @"ENABLED";
            case AWSGuardDutyAdminStatusDisableInProgress:
                return @"DISABLE_IN_PROGRESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuardDutyArchiveFindingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"findingIds" : @"FindingIds",
             };
}

@end

@implementation AWSGuardDutyArchiveFindingsResponse

@end

@implementation AWSGuardDutyAwsApiCallAction

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyDomainDetails class]];
}

+ (NSValueTransformer *)remoteIpDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyRemoteIpDetails class]];
}

@end

@implementation AWSGuardDutyCity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cityName" : @"CityName",
             };
}

@end

@implementation AWSGuardDutyCondition

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

@implementation AWSGuardDutyCountry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"countryCode" : @"CountryCode",
             @"countryName" : @"CountryName",
             };
}

@end

@implementation AWSGuardDutyCreateDetectorRequest

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
            return @(AWSGuardDutyFindingPublishingFrequencyFifteenMinutes);
        }
        if ([value caseInsensitiveCompare:@"ONE_HOUR"] == NSOrderedSame) {
            return @(AWSGuardDutyFindingPublishingFrequencyOneHour);
        }
        if ([value caseInsensitiveCompare:@"SIX_HOURS"] == NSOrderedSame) {
            return @(AWSGuardDutyFindingPublishingFrequencySixHours);
        }
        return @(AWSGuardDutyFindingPublishingFrequencyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuardDutyFindingPublishingFrequencyFifteenMinutes:
                return @"FIFTEEN_MINUTES";
            case AWSGuardDutyFindingPublishingFrequencyOneHour:
                return @"ONE_HOUR";
            case AWSGuardDutyFindingPublishingFrequencySixHours:
                return @"SIX_HOURS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuardDutyCreateDetectorResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuardDutyCreateFilterRequest

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
            return @(AWSGuardDutyFilterActionNoop);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVE"] == NSOrderedSame) {
            return @(AWSGuardDutyFilterActionArchive);
        }
        return @(AWSGuardDutyFilterActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuardDutyFilterActionNoop:
                return @"NOOP";
            case AWSGuardDutyFilterActionArchive:
                return @"ARCHIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)findingCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyFindingCriteria class]];
}

@end

@implementation AWSGuardDutyCreateFilterResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGuardDutyCreateIPSetRequest

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
            return @(AWSGuardDutyIpSetFormatTxt);
        }
        if ([value caseInsensitiveCompare:@"STIX"] == NSOrderedSame) {
            return @(AWSGuardDutyIpSetFormatStix);
        }
        if ([value caseInsensitiveCompare:@"OTX_CSV"] == NSOrderedSame) {
            return @(AWSGuardDutyIpSetFormatOtxCsv);
        }
        if ([value caseInsensitiveCompare:@"ALIEN_VAULT"] == NSOrderedSame) {
            return @(AWSGuardDutyIpSetFormatAlienVault);
        }
        if ([value caseInsensitiveCompare:@"PROOF_POINT"] == NSOrderedSame) {
            return @(AWSGuardDutyIpSetFormatProofPoint);
        }
        if ([value caseInsensitiveCompare:@"FIRE_EYE"] == NSOrderedSame) {
            return @(AWSGuardDutyIpSetFormatFireEye);
        }
        return @(AWSGuardDutyIpSetFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuardDutyIpSetFormatTxt:
                return @"TXT";
            case AWSGuardDutyIpSetFormatStix:
                return @"STIX";
            case AWSGuardDutyIpSetFormatOtxCsv:
                return @"OTX_CSV";
            case AWSGuardDutyIpSetFormatAlienVault:
                return @"ALIEN_VAULT";
            case AWSGuardDutyIpSetFormatProofPoint:
                return @"PROOF_POINT";
            case AWSGuardDutyIpSetFormatFireEye:
                return @"FIRE_EYE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuardDutyCreateIPSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ipSetId" : @"IpSetId",
             };
}

@end

@implementation AWSGuardDutyCreateMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountDetails" : @"AccountDetails",
             @"detectorId" : @"DetectorId",
             };
}

+ (NSValueTransformer *)accountDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuardDutyAccountDetail class]];
}

@end

@implementation AWSGuardDutyCreateMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuardDutyUnprocessedAccount class]];
}

@end

@implementation AWSGuardDutyCreatePublishingDestinationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"destinationProperties" : @"DestinationProperties",
             @"destinationType" : @"DestinationType",
             @"detectorId" : @"DetectorId",
             };
}

+ (NSValueTransformer *)destinationPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyDestinationProperties class]];
}

+ (NSValueTransformer *)destinationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSGuardDutyDestinationTypeS3);
        }
        return @(AWSGuardDutyDestinationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuardDutyDestinationTypeS3:
                return @"S3";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuardDutyCreatePublishingDestinationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationId" : @"DestinationId",
             };
}

@end

@implementation AWSGuardDutyCreateSampleFindingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"findingTypes" : @"FindingTypes",
             };
}

@end

@implementation AWSGuardDutyCreateSampleFindingsResponse

@end

@implementation AWSGuardDutyCreateThreatIntelSetRequest

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
            return @(AWSGuardDutyThreatIntelSetFormatTxt);
        }
        if ([value caseInsensitiveCompare:@"STIX"] == NSOrderedSame) {
            return @(AWSGuardDutyThreatIntelSetFormatStix);
        }
        if ([value caseInsensitiveCompare:@"OTX_CSV"] == NSOrderedSame) {
            return @(AWSGuardDutyThreatIntelSetFormatOtxCsv);
        }
        if ([value caseInsensitiveCompare:@"ALIEN_VAULT"] == NSOrderedSame) {
            return @(AWSGuardDutyThreatIntelSetFormatAlienVault);
        }
        if ([value caseInsensitiveCompare:@"PROOF_POINT"] == NSOrderedSame) {
            return @(AWSGuardDutyThreatIntelSetFormatProofPoint);
        }
        if ([value caseInsensitiveCompare:@"FIRE_EYE"] == NSOrderedSame) {
            return @(AWSGuardDutyThreatIntelSetFormatFireEye);
        }
        return @(AWSGuardDutyThreatIntelSetFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuardDutyThreatIntelSetFormatTxt:
                return @"TXT";
            case AWSGuardDutyThreatIntelSetFormatStix:
                return @"STIX";
            case AWSGuardDutyThreatIntelSetFormatOtxCsv:
                return @"OTX_CSV";
            case AWSGuardDutyThreatIntelSetFormatAlienVault:
                return @"ALIEN_VAULT";
            case AWSGuardDutyThreatIntelSetFormatProofPoint:
                return @"PROOF_POINT";
            case AWSGuardDutyThreatIntelSetFormatFireEye:
                return @"FIRE_EYE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuardDutyCreateThreatIntelSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"threatIntelSetId" : @"ThreatIntelSetId",
             };
}

@end

@implementation AWSGuardDutyDeclineInvitationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             };
}

@end

@implementation AWSGuardDutyDeclineInvitationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuardDutyUnprocessedAccount class]];
}

@end

@implementation AWSGuardDutyDeleteDetectorRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuardDutyDeleteDetectorResponse

@end

@implementation AWSGuardDutyDeleteFilterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"filterName" : @"FilterName",
             };
}

@end

@implementation AWSGuardDutyDeleteFilterResponse

@end

@implementation AWSGuardDutyDeleteIPSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"ipSetId" : @"IpSetId",
             };
}

@end

@implementation AWSGuardDutyDeleteIPSetResponse

@end

@implementation AWSGuardDutyDeleteInvitationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             };
}

@end

@implementation AWSGuardDutyDeleteInvitationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuardDutyUnprocessedAccount class]];
}

@end

@implementation AWSGuardDutyDeleteMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuardDutyDeleteMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuardDutyUnprocessedAccount class]];
}

@end

@implementation AWSGuardDutyDeletePublishingDestinationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationId" : @"DestinationId",
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuardDutyDeletePublishingDestinationResponse

@end

@implementation AWSGuardDutyDeleteThreatIntelSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"threatIntelSetId" : @"ThreatIntelSetId",
             };
}

@end

@implementation AWSGuardDutyDeleteThreatIntelSetResponse

@end

@implementation AWSGuardDutyDescribeOrganizationConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuardDutyDescribeOrganizationConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoEnable" : @"AutoEnable",
             @"memberAccountLimitReached" : @"MemberAccountLimitReached",
             };
}

@end

@implementation AWSGuardDutyDescribePublishingDestinationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationId" : @"DestinationId",
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuardDutyDescribePublishingDestinationResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyDestinationProperties class]];
}

+ (NSValueTransformer *)destinationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSGuardDutyDestinationTypeS3);
        }
        return @(AWSGuardDutyDestinationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuardDutyDestinationTypeS3:
                return @"S3";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING_VERIFICATION"] == NSOrderedSame) {
            return @(AWSGuardDutyPublishingStatusPendingVerification);
        }
        if ([value caseInsensitiveCompare:@"PUBLISHING"] == NSOrderedSame) {
            return @(AWSGuardDutyPublishingStatusPublishing);
        }
        if ([value caseInsensitiveCompare:@"UNABLE_TO_PUBLISH_FIX_DESTINATION_PROPERTY"] == NSOrderedSame) {
            return @(AWSGuardDutyPublishingStatusUnableToPublishFixDestinationProperty);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSGuardDutyPublishingStatusStopped);
        }
        return @(AWSGuardDutyPublishingStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuardDutyPublishingStatusPendingVerification:
                return @"PENDING_VERIFICATION";
            case AWSGuardDutyPublishingStatusPublishing:
                return @"PUBLISHING";
            case AWSGuardDutyPublishingStatusUnableToPublishFixDestinationProperty:
                return @"UNABLE_TO_PUBLISH_FIX_DESTINATION_PROPERTY";
            case AWSGuardDutyPublishingStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuardDutyDestination

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
            return @(AWSGuardDutyDestinationTypeS3);
        }
        return @(AWSGuardDutyDestinationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuardDutyDestinationTypeS3:
                return @"S3";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING_VERIFICATION"] == NSOrderedSame) {
            return @(AWSGuardDutyPublishingStatusPendingVerification);
        }
        if ([value caseInsensitiveCompare:@"PUBLISHING"] == NSOrderedSame) {
            return @(AWSGuardDutyPublishingStatusPublishing);
        }
        if ([value caseInsensitiveCompare:@"UNABLE_TO_PUBLISH_FIX_DESTINATION_PROPERTY"] == NSOrderedSame) {
            return @(AWSGuardDutyPublishingStatusUnableToPublishFixDestinationProperty);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSGuardDutyPublishingStatusStopped);
        }
        return @(AWSGuardDutyPublishingStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuardDutyPublishingStatusPendingVerification:
                return @"PENDING_VERIFICATION";
            case AWSGuardDutyPublishingStatusPublishing:
                return @"PUBLISHING";
            case AWSGuardDutyPublishingStatusUnableToPublishFixDestinationProperty:
                return @"UNABLE_TO_PUBLISH_FIX_DESTINATION_PROPERTY";
            case AWSGuardDutyPublishingStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuardDutyDestinationProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationArn" : @"DestinationArn",
             @"kmsKeyArn" : @"KmsKeyArn",
             };
}

@end

@implementation AWSGuardDutyDisableOrganizationAdminAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adminAccountId" : @"AdminAccountId",
             };
}

@end

@implementation AWSGuardDutyDisableOrganizationAdminAccountResponse

@end

@implementation AWSGuardDutyDisassociateFromMasterAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuardDutyDisassociateFromMasterAccountResponse

@end

@implementation AWSGuardDutyDisassociateMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuardDutyDisassociateMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuardDutyUnprocessedAccount class]];
}

@end

@implementation AWSGuardDutyDnsRequestAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domain" : @"Domain",
             };
}

@end

@implementation AWSGuardDutyDomainDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domain" : @"Domain",
             };
}

@end

@implementation AWSGuardDutyEnableOrganizationAdminAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adminAccountId" : @"AdminAccountId",
             };
}

@end

@implementation AWSGuardDutyEnableOrganizationAdminAccountResponse

@end

@implementation AWSGuardDutyEvidence

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"threatIntelligenceDetails" : @"ThreatIntelligenceDetails",
             };
}

+ (NSValueTransformer *)threatIntelligenceDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuardDutyThreatIntelligenceDetail class]];
}

@end

@implementation AWSGuardDutyFinding

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyResource class]];
}

+ (NSValueTransformer *)serviceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyService class]];
}

@end

@implementation AWSGuardDutyFindingCriteria

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"criterion" : @"Criterion",
             };
}

+ (NSValueTransformer *)criterionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSGuardDutyCondition class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSGuardDutyFindingStatistics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"countBySeverity" : @"CountBySeverity",
             };
}

@end

@implementation AWSGuardDutyGeoLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lat" : @"Lat",
             @"lon" : @"Lon",
             };
}

@end

@implementation AWSGuardDutyGetDetectorRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuardDutyGetDetectorResponse

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
            return @(AWSGuardDutyFindingPublishingFrequencyFifteenMinutes);
        }
        if ([value caseInsensitiveCompare:@"ONE_HOUR"] == NSOrderedSame) {
            return @(AWSGuardDutyFindingPublishingFrequencyOneHour);
        }
        if ([value caseInsensitiveCompare:@"SIX_HOURS"] == NSOrderedSame) {
            return @(AWSGuardDutyFindingPublishingFrequencySixHours);
        }
        return @(AWSGuardDutyFindingPublishingFrequencyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuardDutyFindingPublishingFrequencyFifteenMinutes:
                return @"FIFTEEN_MINUTES";
            case AWSGuardDutyFindingPublishingFrequencyOneHour:
                return @"ONE_HOUR";
            case AWSGuardDutyFindingPublishingFrequencySixHours:
                return @"SIX_HOURS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSGuardDutyDetectorStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSGuardDutyDetectorStatusDisabled);
        }
        return @(AWSGuardDutyDetectorStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuardDutyDetectorStatusEnabled:
                return @"ENABLED";
            case AWSGuardDutyDetectorStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuardDutyGetFilterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"filterName" : @"FilterName",
             };
}

@end

@implementation AWSGuardDutyGetFilterResponse

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
            return @(AWSGuardDutyFilterActionNoop);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVE"] == NSOrderedSame) {
            return @(AWSGuardDutyFilterActionArchive);
        }
        return @(AWSGuardDutyFilterActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuardDutyFilterActionNoop:
                return @"NOOP";
            case AWSGuardDutyFilterActionArchive:
                return @"ARCHIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)findingCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyFindingCriteria class]];
}

@end

@implementation AWSGuardDutyGetFindingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"findingIds" : @"FindingIds",
             @"sortCriteria" : @"SortCriteria",
             };
}

+ (NSValueTransformer *)sortCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutySortCriteria class]];
}

@end

@implementation AWSGuardDutyGetFindingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findings" : @"Findings",
             };
}

+ (NSValueTransformer *)findingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuardDutyFinding class]];
}

@end

@implementation AWSGuardDutyGetFindingsStatisticsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"findingCriteria" : @"FindingCriteria",
             @"findingStatisticTypes" : @"FindingStatisticTypes",
             };
}

+ (NSValueTransformer *)findingCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyFindingCriteria class]];
}

@end

@implementation AWSGuardDutyGetFindingsStatisticsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findingStatistics" : @"FindingStatistics",
             };
}

+ (NSValueTransformer *)findingStatisticsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyFindingStatistics class]];
}

@end

@implementation AWSGuardDutyGetIPSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"ipSetId" : @"IpSetId",
             };
}

@end

@implementation AWSGuardDutyGetIPSetResponse

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
            return @(AWSGuardDutyIpSetFormatTxt);
        }
        if ([value caseInsensitiveCompare:@"STIX"] == NSOrderedSame) {
            return @(AWSGuardDutyIpSetFormatStix);
        }
        if ([value caseInsensitiveCompare:@"OTX_CSV"] == NSOrderedSame) {
            return @(AWSGuardDutyIpSetFormatOtxCsv);
        }
        if ([value caseInsensitiveCompare:@"ALIEN_VAULT"] == NSOrderedSame) {
            return @(AWSGuardDutyIpSetFormatAlienVault);
        }
        if ([value caseInsensitiveCompare:@"PROOF_POINT"] == NSOrderedSame) {
            return @(AWSGuardDutyIpSetFormatProofPoint);
        }
        if ([value caseInsensitiveCompare:@"FIRE_EYE"] == NSOrderedSame) {
            return @(AWSGuardDutyIpSetFormatFireEye);
        }
        return @(AWSGuardDutyIpSetFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuardDutyIpSetFormatTxt:
                return @"TXT";
            case AWSGuardDutyIpSetFormatStix:
                return @"STIX";
            case AWSGuardDutyIpSetFormatOtxCsv:
                return @"OTX_CSV";
            case AWSGuardDutyIpSetFormatAlienVault:
                return @"ALIEN_VAULT";
            case AWSGuardDutyIpSetFormatProofPoint:
                return @"PROOF_POINT";
            case AWSGuardDutyIpSetFormatFireEye:
                return @"FIRE_EYE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSGuardDutyIpSetStatusInactive);
        }
        if ([value caseInsensitiveCompare:@"ACTIVATING"] == NSOrderedSame) {
            return @(AWSGuardDutyIpSetStatusActivating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSGuardDutyIpSetStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DEACTIVATING"] == NSOrderedSame) {
            return @(AWSGuardDutyIpSetStatusDeactivating);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSGuardDutyIpSetStatusError);
        }
        if ([value caseInsensitiveCompare:@"DELETE_PENDING"] == NSOrderedSame) {
            return @(AWSGuardDutyIpSetStatusDeletePending);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSGuardDutyIpSetStatusDeleted);
        }
        return @(AWSGuardDutyIpSetStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuardDutyIpSetStatusInactive:
                return @"INACTIVE";
            case AWSGuardDutyIpSetStatusActivating:
                return @"ACTIVATING";
            case AWSGuardDutyIpSetStatusActive:
                return @"ACTIVE";
            case AWSGuardDutyIpSetStatusDeactivating:
                return @"DEACTIVATING";
            case AWSGuardDutyIpSetStatusError:
                return @"ERROR";
            case AWSGuardDutyIpSetStatusDeletePending:
                return @"DELETE_PENDING";
            case AWSGuardDutyIpSetStatusDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuardDutyGetInvitationsCountRequest

@end

@implementation AWSGuardDutyGetInvitationsCountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invitationsCount" : @"InvitationsCount",
             };
}

@end

@implementation AWSGuardDutyGetMasterAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuardDutyGetMasterAccountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"master" : @"Master",
             };
}

+ (NSValueTransformer *)masterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyMaster class]];
}

@end

@implementation AWSGuardDutyGetMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuardDutyGetMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"members" : @"Members",
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)membersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuardDutyMember class]];
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuardDutyUnprocessedAccount class]];
}

@end

@implementation AWSGuardDutyGetThreatIntelSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"threatIntelSetId" : @"ThreatIntelSetId",
             };
}

@end

@implementation AWSGuardDutyGetThreatIntelSetResponse

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
            return @(AWSGuardDutyThreatIntelSetFormatTxt);
        }
        if ([value caseInsensitiveCompare:@"STIX"] == NSOrderedSame) {
            return @(AWSGuardDutyThreatIntelSetFormatStix);
        }
        if ([value caseInsensitiveCompare:@"OTX_CSV"] == NSOrderedSame) {
            return @(AWSGuardDutyThreatIntelSetFormatOtxCsv);
        }
        if ([value caseInsensitiveCompare:@"ALIEN_VAULT"] == NSOrderedSame) {
            return @(AWSGuardDutyThreatIntelSetFormatAlienVault);
        }
        if ([value caseInsensitiveCompare:@"PROOF_POINT"] == NSOrderedSame) {
            return @(AWSGuardDutyThreatIntelSetFormatProofPoint);
        }
        if ([value caseInsensitiveCompare:@"FIRE_EYE"] == NSOrderedSame) {
            return @(AWSGuardDutyThreatIntelSetFormatFireEye);
        }
        return @(AWSGuardDutyThreatIntelSetFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuardDutyThreatIntelSetFormatTxt:
                return @"TXT";
            case AWSGuardDutyThreatIntelSetFormatStix:
                return @"STIX";
            case AWSGuardDutyThreatIntelSetFormatOtxCsv:
                return @"OTX_CSV";
            case AWSGuardDutyThreatIntelSetFormatAlienVault:
                return @"ALIEN_VAULT";
            case AWSGuardDutyThreatIntelSetFormatProofPoint:
                return @"PROOF_POINT";
            case AWSGuardDutyThreatIntelSetFormatFireEye:
                return @"FIRE_EYE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSGuardDutyThreatIntelSetStatusInactive);
        }
        if ([value caseInsensitiveCompare:@"ACTIVATING"] == NSOrderedSame) {
            return @(AWSGuardDutyThreatIntelSetStatusActivating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSGuardDutyThreatIntelSetStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DEACTIVATING"] == NSOrderedSame) {
            return @(AWSGuardDutyThreatIntelSetStatusDeactivating);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSGuardDutyThreatIntelSetStatusError);
        }
        if ([value caseInsensitiveCompare:@"DELETE_PENDING"] == NSOrderedSame) {
            return @(AWSGuardDutyThreatIntelSetStatusDeletePending);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSGuardDutyThreatIntelSetStatusDeleted);
        }
        return @(AWSGuardDutyThreatIntelSetStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuardDutyThreatIntelSetStatusInactive:
                return @"INACTIVE";
            case AWSGuardDutyThreatIntelSetStatusActivating:
                return @"ACTIVATING";
            case AWSGuardDutyThreatIntelSetStatusActive:
                return @"ACTIVE";
            case AWSGuardDutyThreatIntelSetStatusDeactivating:
                return @"DEACTIVATING";
            case AWSGuardDutyThreatIntelSetStatusError:
                return @"ERROR";
            case AWSGuardDutyThreatIntelSetStatusDeletePending:
                return @"DELETE_PENDING";
            case AWSGuardDutyThreatIntelSetStatusDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuardDutyIamInstanceProfile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSGuardDutyInstanceDetails

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyIamInstanceProfile class]];
}

+ (NSValueTransformer *)networkInterfacesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuardDutyNetworkInterface class]];
}

+ (NSValueTransformer *)productCodesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuardDutyProductCode class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuardDutyTag class]];
}

@end

@implementation AWSGuardDutyInvitation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"invitationId" : @"InvitationId",
             @"invitedAt" : @"InvitedAt",
             @"relationshipStatus" : @"RelationshipStatus",
             };
}

@end

@implementation AWSGuardDutyInviteMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             @"detectorId" : @"DetectorId",
             @"disableEmailNotification" : @"DisableEmailNotification",
             @"message" : @"Message",
             };
}

@end

@implementation AWSGuardDutyInviteMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuardDutyUnprocessedAccount class]];
}

@end

@implementation AWSGuardDutyListDetectorsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGuardDutyListDetectorsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorIds" : @"DetectorIds",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGuardDutyListFiltersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGuardDutyListFiltersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterNames" : @"FilterNames",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGuardDutyListFindingsRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyFindingCriteria class]];
}

+ (NSValueTransformer *)sortCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutySortCriteria class]];
}

@end

@implementation AWSGuardDutyListFindingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findingIds" : @"FindingIds",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGuardDutyListIPSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGuardDutyListIPSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ipSetIds" : @"IpSetIds",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGuardDutyListInvitationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGuardDutyListInvitationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invitations" : @"Invitations",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)invitationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuardDutyInvitation class]];
}

@end

@implementation AWSGuardDutyListMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"onlyAssociated" : @"OnlyAssociated",
             };
}

@end

@implementation AWSGuardDutyListMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"members" : @"Members",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)membersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuardDutyMember class]];
}

@end

@implementation AWSGuardDutyListOrganizationAdminAccountsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGuardDutyListOrganizationAdminAccountsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adminAccounts" : @"AdminAccounts",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)adminAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuardDutyAdminAccount class]];
}

@end

@implementation AWSGuardDutyListPublishingDestinationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGuardDutyListPublishingDestinationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinations" : @"Destinations",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuardDutyDestination class]];
}

@end

@implementation AWSGuardDutyListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSGuardDutyListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSGuardDutyListThreatIntelSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGuardDutyListThreatIntelSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"threatIntelSetIds" : @"ThreatIntelSetIds",
             };
}

@end

@implementation AWSGuardDutyLocalIpDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ipAddressV4" : @"IpAddressV4",
             };
}

@end

@implementation AWSGuardDutyLocalPortDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"port" : @"Port",
             @"portName" : @"PortName",
             };
}

@end

@implementation AWSGuardDutyMaster

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"invitationId" : @"InvitationId",
             @"invitedAt" : @"InvitedAt",
             @"relationshipStatus" : @"RelationshipStatus",
             };
}

@end

@implementation AWSGuardDutyMember

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

@implementation AWSGuardDutyNetworkConnectionAction

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyLocalIpDetails class]];
}

+ (NSValueTransformer *)localPortDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyLocalPortDetails class]];
}

+ (NSValueTransformer *)remoteIpDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyRemoteIpDetails class]];
}

+ (NSValueTransformer *)remotePortDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyRemotePortDetails class]];
}

@end

@implementation AWSGuardDutyNetworkInterface

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuardDutyPrivateIpAddressDetails class]];
}

+ (NSValueTransformer *)securityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuardDutySecurityGroup class]];
}

@end

@implementation AWSGuardDutyOrganization

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"asn" : @"Asn",
             @"asnOrg" : @"AsnOrg",
             @"isp" : @"Isp",
             @"org" : @"Org",
             };
}

@end

@implementation AWSGuardDutyPortProbeAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blocked" : @"Blocked",
             @"portProbeDetails" : @"PortProbeDetails",
             };
}

+ (NSValueTransformer *)portProbeDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuardDutyPortProbeDetail class]];
}

@end

@implementation AWSGuardDutyPortProbeDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"localIpDetails" : @"LocalIpDetails",
             @"localPortDetails" : @"LocalPortDetails",
             @"remoteIpDetails" : @"RemoteIpDetails",
             };
}

+ (NSValueTransformer *)localIpDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyLocalIpDetails class]];
}

+ (NSValueTransformer *)localPortDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyLocalPortDetails class]];
}

+ (NSValueTransformer *)remoteIpDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyRemoteIpDetails class]];
}

@end

@implementation AWSGuardDutyPrivateIpAddressDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"privateDnsName" : @"PrivateDnsName",
             @"privateIpAddress" : @"PrivateIpAddress",
             };
}

@end

@implementation AWSGuardDutyProductCode

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"productType" : @"ProductType",
             };
}

@end

@implementation AWSGuardDutyRemoteIpDetails

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyCity class]];
}

+ (NSValueTransformer *)countryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyCountry class]];
}

+ (NSValueTransformer *)geoLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyGeoLocation class]];
}

+ (NSValueTransformer *)organizationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyOrganization class]];
}

@end

@implementation AWSGuardDutyRemotePortDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"port" : @"Port",
             @"portName" : @"PortName",
             };
}

@end

@implementation AWSGuardDutyResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessKeyDetails" : @"AccessKeyDetails",
             @"instanceDetails" : @"InstanceDetails",
             @"resourceType" : @"ResourceType",
             };
}

+ (NSValueTransformer *)accessKeyDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyAccessKeyDetails class]];
}

+ (NSValueTransformer *)instanceDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyInstanceDetails class]];
}

@end

@implementation AWSGuardDutySecurityGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupId" : @"GroupId",
             @"groupName" : @"GroupName",
             };
}

@end

@implementation AWSGuardDutyService

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyAction class]];
}

+ (NSValueTransformer *)evidenceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyEvidence class]];
}

@end

@implementation AWSGuardDutySortCriteria

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"orderBy" : @"OrderBy",
             };
}

+ (NSValueTransformer *)orderByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASC"] == NSOrderedSame) {
            return @(AWSGuardDutyOrderByAsc);
        }
        if ([value caseInsensitiveCompare:@"DESC"] == NSOrderedSame) {
            return @(AWSGuardDutyOrderByDesc);
        }
        return @(AWSGuardDutyOrderByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuardDutyOrderByAsc:
                return @"ASC";
            case AWSGuardDutyOrderByDesc:
                return @"DESC";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuardDutyStartMonitoringMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuardDutyStartMonitoringMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuardDutyUnprocessedAccount class]];
}

@end

@implementation AWSGuardDutyStopMonitoringMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuardDutyStopMonitoringMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuardDutyUnprocessedAccount class]];
}

@end

@implementation AWSGuardDutyTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSGuardDutyTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSGuardDutyTagResourceResponse

@end

@implementation AWSGuardDutyThreatIntelligenceDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"threatListName" : @"ThreatListName",
             @"threatNames" : @"ThreatNames",
             };
}

@end

@implementation AWSGuardDutyUnarchiveFindingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"findingIds" : @"FindingIds",
             };
}

@end

@implementation AWSGuardDutyUnarchiveFindingsResponse

@end

@implementation AWSGuardDutyUnprocessedAccount

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"result" : @"Result",
             };
}

@end

@implementation AWSGuardDutyUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSGuardDutyUntagResourceResponse

@end

@implementation AWSGuardDutyUpdateDetectorRequest

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
            return @(AWSGuardDutyFindingPublishingFrequencyFifteenMinutes);
        }
        if ([value caseInsensitiveCompare:@"ONE_HOUR"] == NSOrderedSame) {
            return @(AWSGuardDutyFindingPublishingFrequencyOneHour);
        }
        if ([value caseInsensitiveCompare:@"SIX_HOURS"] == NSOrderedSame) {
            return @(AWSGuardDutyFindingPublishingFrequencySixHours);
        }
        return @(AWSGuardDutyFindingPublishingFrequencyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuardDutyFindingPublishingFrequencyFifteenMinutes:
                return @"FIFTEEN_MINUTES";
            case AWSGuardDutyFindingPublishingFrequencyOneHour:
                return @"ONE_HOUR";
            case AWSGuardDutyFindingPublishingFrequencySixHours:
                return @"SIX_HOURS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuardDutyUpdateDetectorResponse

@end

@implementation AWSGuardDutyUpdateFilterRequest

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
            return @(AWSGuardDutyFilterActionNoop);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVE"] == NSOrderedSame) {
            return @(AWSGuardDutyFilterActionArchive);
        }
        return @(AWSGuardDutyFilterActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuardDutyFilterActionNoop:
                return @"NOOP";
            case AWSGuardDutyFilterActionArchive:
                return @"ARCHIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)findingCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyFindingCriteria class]];
}

@end

@implementation AWSGuardDutyUpdateFilterResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGuardDutyUpdateFindingsFeedbackRequest

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
            return @(AWSGuardDutyFeedbackUseful);
        }
        if ([value caseInsensitiveCompare:@"NOT_USEFUL"] == NSOrderedSame) {
            return @(AWSGuardDutyFeedbackNotUseful);
        }
        return @(AWSGuardDutyFeedbackUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuardDutyFeedbackUseful:
                return @"USEFUL";
            case AWSGuardDutyFeedbackNotUseful:
                return @"NOT_USEFUL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuardDutyUpdateFindingsFeedbackResponse

@end

@implementation AWSGuardDutyUpdateIPSetRequest

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

@implementation AWSGuardDutyUpdateIPSetResponse

@end

@implementation AWSGuardDutyUpdateOrganizationConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoEnable" : @"AutoEnable",
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuardDutyUpdateOrganizationConfigurationResponse

@end

@implementation AWSGuardDutyUpdatePublishingDestinationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationId" : @"DestinationId",
             @"destinationProperties" : @"DestinationProperties",
             @"detectorId" : @"DetectorId",
             };
}

+ (NSValueTransformer *)destinationPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuardDutyDestinationProperties class]];
}

@end

@implementation AWSGuardDutyUpdatePublishingDestinationResponse

@end

@implementation AWSGuardDutyUpdateThreatIntelSetRequest

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

@implementation AWSGuardDutyUpdateThreatIntelSetResponse

@end
