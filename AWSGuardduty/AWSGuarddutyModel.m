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

#import "AWSGuarddutyModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSGuarddutyErrorDomain = @"com.amazonaws.AWSGuarddutyErrorDomain";

@implementation AWSGuarddutyAcceptInvitationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"invitationId" : @"InvitationId",
             @"masterId" : @"MasterId",
             };
}

@end

@implementation AWSGuarddutyAcceptInvitationResponse

@end

@implementation AWSGuarddutyAccessControlList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowsPublicReadAccess" : @"AllowsPublicReadAccess",
             @"allowsPublicWriteAccess" : @"AllowsPublicWriteAccess",
             };
}

@end

@implementation AWSGuarddutyAccessKeyDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessKeyId" : @"AccessKeyId",
             @"principalId" : @"PrincipalId",
             @"userName" : @"UserName",
             @"userType" : @"UserType",
             };
}

@end

@implementation AWSGuarddutyAccountDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"email" : @"Email",
             };
}

@end

@implementation AWSGuarddutyAccountLevelPermissions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blockPublicAccess" : @"BlockPublicAccess",
             };
}

+ (NSValueTransformer *)blockPublicAccessJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyBlockPublicAccess class]];
}

@end

@implementation AWSGuarddutyAction

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyAwsApiCallAction class]];
}

+ (NSValueTransformer *)dnsRequestActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyDnsRequestAction class]];
}

+ (NSValueTransformer *)networkConnectionActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyNetworkConnectionAction class]];
}

+ (NSValueTransformer *)portProbeActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyPortProbeAction class]];
}

@end

@implementation AWSGuarddutyAdminAccount

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adminAccountId" : @"AdminAccountId",
             @"adminStatus" : @"AdminStatus",
             };
}

+ (NSValueTransformer *)adminStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSGuarddutyAdminStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSGuarddutyAdminStatusDisableInProgress);
        }
        return @(AWSGuarddutyAdminStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuarddutyAdminStatusEnabled:
                return @"ENABLED";
            case AWSGuarddutyAdminStatusDisableInProgress:
                return @"DISABLE_IN_PROGRESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuarddutyArchiveFindingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"findingIds" : @"FindingIds",
             };
}

@end

@implementation AWSGuarddutyArchiveFindingsResponse

@end

@implementation AWSGuarddutyAwsApiCallAction

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyDomainDetails class]];
}

+ (NSValueTransformer *)remoteIpDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyRemoteIpDetails class]];
}

@end

@implementation AWSGuarddutyBlockPublicAccess

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blockPublicAcls" : @"BlockPublicAcls",
             @"blockPublicPolicy" : @"BlockPublicPolicy",
             @"ignorePublicAcls" : @"IgnorePublicAcls",
             @"restrictPublicBuckets" : @"RestrictPublicBuckets",
             };
}

@end

@implementation AWSGuarddutyBucketLevelPermissions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessControlList" : @"AccessControlList",
             @"blockPublicAccess" : @"BlockPublicAccess",
             @"bucketPolicy" : @"BucketPolicy",
             };
}

+ (NSValueTransformer *)accessControlListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyAccessControlList class]];
}

+ (NSValueTransformer *)blockPublicAccessJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyBlockPublicAccess class]];
}

+ (NSValueTransformer *)bucketPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyBucketPolicy class]];
}

@end

@implementation AWSGuarddutyBucketPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowsPublicReadAccess" : @"AllowsPublicReadAccess",
             @"allowsPublicWriteAccess" : @"AllowsPublicWriteAccess",
             };
}

@end

@implementation AWSGuarddutyCity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cityName" : @"CityName",
             };
}

@end

@implementation AWSGuarddutyCondition

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

@implementation AWSGuarddutyCountry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"countryCode" : @"CountryCode",
             @"countryName" : @"CountryName",
             };
}

@end

@implementation AWSGuarddutyCreateDetectorRequest

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
            return @(AWSGuarddutyFindingPublishingFrequencyFifteenMinutes);
        }
        if ([value caseInsensitiveCompare:@"ONE_HOUR"] == NSOrderedSame) {
            return @(AWSGuarddutyFindingPublishingFrequencyOneHour);
        }
        if ([value caseInsensitiveCompare:@"SIX_HOURS"] == NSOrderedSame) {
            return @(AWSGuarddutyFindingPublishingFrequencySixHours);
        }
        return @(AWSGuarddutyFindingPublishingFrequencyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuarddutyFindingPublishingFrequencyFifteenMinutes:
                return @"FIFTEEN_MINUTES";
            case AWSGuarddutyFindingPublishingFrequencyOneHour:
                return @"ONE_HOUR";
            case AWSGuarddutyFindingPublishingFrequencySixHours:
                return @"SIX_HOURS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuarddutyCreateDetectorResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuarddutyCreateFilterRequest

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
            return @(AWSGuarddutyFilterActionNoop);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVE"] == NSOrderedSame) {
            return @(AWSGuarddutyFilterActionArchive);
        }
        return @(AWSGuarddutyFilterActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuarddutyFilterActionNoop:
                return @"NOOP";
            case AWSGuarddutyFilterActionArchive:
                return @"ARCHIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)findingCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyFindingCriteria class]];
}

@end

@implementation AWSGuarddutyCreateFilterResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGuarddutyCreateIPSetRequest

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
            return @(AWSGuarddutyIpSetFormatTxt);
        }
        if ([value caseInsensitiveCompare:@"STIX"] == NSOrderedSame) {
            return @(AWSGuarddutyIpSetFormatStix);
        }
        if ([value caseInsensitiveCompare:@"OTX_CSV"] == NSOrderedSame) {
            return @(AWSGuarddutyIpSetFormatOtxCsv);
        }
        if ([value caseInsensitiveCompare:@"ALIEN_VAULT"] == NSOrderedSame) {
            return @(AWSGuarddutyIpSetFormatAlienVault);
        }
        if ([value caseInsensitiveCompare:@"PROOF_POINT"] == NSOrderedSame) {
            return @(AWSGuarddutyIpSetFormatProofPoint);
        }
        if ([value caseInsensitiveCompare:@"FIRE_EYE"] == NSOrderedSame) {
            return @(AWSGuarddutyIpSetFormatFireEye);
        }
        return @(AWSGuarddutyIpSetFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuarddutyIpSetFormatTxt:
                return @"TXT";
            case AWSGuarddutyIpSetFormatStix:
                return @"STIX";
            case AWSGuarddutyIpSetFormatOtxCsv:
                return @"OTX_CSV";
            case AWSGuarddutyIpSetFormatAlienVault:
                return @"ALIEN_VAULT";
            case AWSGuarddutyIpSetFormatProofPoint:
                return @"PROOF_POINT";
            case AWSGuarddutyIpSetFormatFireEye:
                return @"FIRE_EYE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuarddutyCreateIPSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ipSetId" : @"IpSetId",
             };
}

@end

@implementation AWSGuarddutyCreateMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountDetails" : @"AccountDetails",
             @"detectorId" : @"DetectorId",
             };
}

+ (NSValueTransformer *)accountDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutyAccountDetail class]];
}

@end

@implementation AWSGuarddutyCreateMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutyUnprocessedAccount class]];
}

@end

@implementation AWSGuarddutyCreatePublishingDestinationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"destinationProperties" : @"DestinationProperties",
             @"destinationType" : @"DestinationType",
             @"detectorId" : @"DetectorId",
             };
}

+ (NSValueTransformer *)destinationPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyDestinationProperties class]];
}

+ (NSValueTransformer *)destinationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSGuarddutyDestinationTypeS3);
        }
        return @(AWSGuarddutyDestinationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuarddutyDestinationTypeS3:
                return @"S3";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuarddutyCreatePublishingDestinationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationId" : @"DestinationId",
             };
}

@end

@implementation AWSGuarddutyCreateSampleFindingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"findingTypes" : @"FindingTypes",
             };
}

@end

@implementation AWSGuarddutyCreateSampleFindingsResponse

@end

@implementation AWSGuarddutyCreateThreatIntelSetRequest

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
            return @(AWSGuarddutyThreatIntelSetFormatTxt);
        }
        if ([value caseInsensitiveCompare:@"STIX"] == NSOrderedSame) {
            return @(AWSGuarddutyThreatIntelSetFormatStix);
        }
        if ([value caseInsensitiveCompare:@"OTX_CSV"] == NSOrderedSame) {
            return @(AWSGuarddutyThreatIntelSetFormatOtxCsv);
        }
        if ([value caseInsensitiveCompare:@"ALIEN_VAULT"] == NSOrderedSame) {
            return @(AWSGuarddutyThreatIntelSetFormatAlienVault);
        }
        if ([value caseInsensitiveCompare:@"PROOF_POINT"] == NSOrderedSame) {
            return @(AWSGuarddutyThreatIntelSetFormatProofPoint);
        }
        if ([value caseInsensitiveCompare:@"FIRE_EYE"] == NSOrderedSame) {
            return @(AWSGuarddutyThreatIntelSetFormatFireEye);
        }
        return @(AWSGuarddutyThreatIntelSetFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuarddutyThreatIntelSetFormatTxt:
                return @"TXT";
            case AWSGuarddutyThreatIntelSetFormatStix:
                return @"STIX";
            case AWSGuarddutyThreatIntelSetFormatOtxCsv:
                return @"OTX_CSV";
            case AWSGuarddutyThreatIntelSetFormatAlienVault:
                return @"ALIEN_VAULT";
            case AWSGuarddutyThreatIntelSetFormatProofPoint:
                return @"PROOF_POINT";
            case AWSGuarddutyThreatIntelSetFormatFireEye:
                return @"FIRE_EYE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuarddutyCreateThreatIntelSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"threatIntelSetId" : @"ThreatIntelSetId",
             };
}

@end

@implementation AWSGuarddutyDeclineInvitationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             };
}

@end

@implementation AWSGuarddutyDeclineInvitationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutyUnprocessedAccount class]];
}

@end

@implementation AWSGuarddutyDefaultServerSideEncryption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionType" : @"EncryptionType",
             @"kmsMasterKeyArn" : @"KmsMasterKeyArn",
             };
}

@end

@implementation AWSGuarddutyDeleteDetectorRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuarddutyDeleteDetectorResponse

@end

@implementation AWSGuarddutyDeleteFilterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"filterName" : @"FilterName",
             };
}

@end

@implementation AWSGuarddutyDeleteFilterResponse

@end

@implementation AWSGuarddutyDeleteIPSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"ipSetId" : @"IpSetId",
             };
}

@end

@implementation AWSGuarddutyDeleteIPSetResponse

@end

@implementation AWSGuarddutyDeleteInvitationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             };
}

@end

@implementation AWSGuarddutyDeleteInvitationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutyUnprocessedAccount class]];
}

@end

@implementation AWSGuarddutyDeleteMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuarddutyDeleteMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutyUnprocessedAccount class]];
}

@end

@implementation AWSGuarddutyDeletePublishingDestinationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationId" : @"DestinationId",
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuarddutyDeletePublishingDestinationResponse

@end

@implementation AWSGuarddutyDeleteThreatIntelSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"threatIntelSetId" : @"ThreatIntelSetId",
             };
}

@end

@implementation AWSGuarddutyDeleteThreatIntelSetResponse

@end

@implementation AWSGuarddutyDescribeOrganizationConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuarddutyDescribeOrganizationConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoEnable" : @"AutoEnable",
             @"memberAccountLimitReached" : @"MemberAccountLimitReached",
             };
}

@end

@implementation AWSGuarddutyDescribePublishingDestinationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationId" : @"DestinationId",
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuarddutyDescribePublishingDestinationResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyDestinationProperties class]];
}

+ (NSValueTransformer *)destinationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSGuarddutyDestinationTypeS3);
        }
        return @(AWSGuarddutyDestinationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuarddutyDestinationTypeS3:
                return @"S3";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING_VERIFICATION"] == NSOrderedSame) {
            return @(AWSGuarddutyPublishingStatusPendingVerification);
        }
        if ([value caseInsensitiveCompare:@"PUBLISHING"] == NSOrderedSame) {
            return @(AWSGuarddutyPublishingStatusPublishing);
        }
        if ([value caseInsensitiveCompare:@"UNABLE_TO_PUBLISH_FIX_DESTINATION_PROPERTY"] == NSOrderedSame) {
            return @(AWSGuarddutyPublishingStatusUnableToPublishFixDestinationProperty);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSGuarddutyPublishingStatusStopped);
        }
        return @(AWSGuarddutyPublishingStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuarddutyPublishingStatusPendingVerification:
                return @"PENDING_VERIFICATION";
            case AWSGuarddutyPublishingStatusPublishing:
                return @"PUBLISHING";
            case AWSGuarddutyPublishingStatusUnableToPublishFixDestinationProperty:
                return @"UNABLE_TO_PUBLISH_FIX_DESTINATION_PROPERTY";
            case AWSGuarddutyPublishingStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuarddutyDestination

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
            return @(AWSGuarddutyDestinationTypeS3);
        }
        return @(AWSGuarddutyDestinationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuarddutyDestinationTypeS3:
                return @"S3";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING_VERIFICATION"] == NSOrderedSame) {
            return @(AWSGuarddutyPublishingStatusPendingVerification);
        }
        if ([value caseInsensitiveCompare:@"PUBLISHING"] == NSOrderedSame) {
            return @(AWSGuarddutyPublishingStatusPublishing);
        }
        if ([value caseInsensitiveCompare:@"UNABLE_TO_PUBLISH_FIX_DESTINATION_PROPERTY"] == NSOrderedSame) {
            return @(AWSGuarddutyPublishingStatusUnableToPublishFixDestinationProperty);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSGuarddutyPublishingStatusStopped);
        }
        return @(AWSGuarddutyPublishingStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuarddutyPublishingStatusPendingVerification:
                return @"PENDING_VERIFICATION";
            case AWSGuarddutyPublishingStatusPublishing:
                return @"PUBLISHING";
            case AWSGuarddutyPublishingStatusUnableToPublishFixDestinationProperty:
                return @"UNABLE_TO_PUBLISH_FIX_DESTINATION_PROPERTY";
            case AWSGuarddutyPublishingStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuarddutyDestinationProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationArn" : @"DestinationArn",
             @"kmsKeyArn" : @"KmsKeyArn",
             };
}

@end

@implementation AWSGuarddutyDisableOrganizationAdminAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adminAccountId" : @"AdminAccountId",
             };
}

@end

@implementation AWSGuarddutyDisableOrganizationAdminAccountResponse

@end

@implementation AWSGuarddutyDisassociateFromMasterAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuarddutyDisassociateFromMasterAccountResponse

@end

@implementation AWSGuarddutyDisassociateMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuarddutyDisassociateMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutyUnprocessedAccount class]];
}

@end

@implementation AWSGuarddutyDnsRequestAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domain" : @"Domain",
             };
}

@end

@implementation AWSGuarddutyDomainDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domain" : @"Domain",
             };
}

@end

@implementation AWSGuarddutyEnableOrganizationAdminAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adminAccountId" : @"AdminAccountId",
             };
}

@end

@implementation AWSGuarddutyEnableOrganizationAdminAccountResponse

@end

@implementation AWSGuarddutyEvidence

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"threatIntelligenceDetails" : @"ThreatIntelligenceDetails",
             };
}

+ (NSValueTransformer *)threatIntelligenceDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutyThreatIntelligenceDetail class]];
}

@end

@implementation AWSGuarddutyFinding

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyResource class]];
}

+ (NSValueTransformer *)serviceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyService class]];
}

@end

@implementation AWSGuarddutyFindingCriteria

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"criterion" : @"Criterion",
             };
}

+ (NSValueTransformer *)criterionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSGuarddutyCondition class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSGuarddutyFindingStatistics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"countBySeverity" : @"CountBySeverity",
             };
}

@end

@implementation AWSGuarddutyGeoLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lat" : @"Lat",
             @"lon" : @"Lon",
             };
}

@end

@implementation AWSGuarddutyGetDetectorRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuarddutyGetDetectorResponse

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
            return @(AWSGuarddutyFindingPublishingFrequencyFifteenMinutes);
        }
        if ([value caseInsensitiveCompare:@"ONE_HOUR"] == NSOrderedSame) {
            return @(AWSGuarddutyFindingPublishingFrequencyOneHour);
        }
        if ([value caseInsensitiveCompare:@"SIX_HOURS"] == NSOrderedSame) {
            return @(AWSGuarddutyFindingPublishingFrequencySixHours);
        }
        return @(AWSGuarddutyFindingPublishingFrequencyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuarddutyFindingPublishingFrequencyFifteenMinutes:
                return @"FIFTEEN_MINUTES";
            case AWSGuarddutyFindingPublishingFrequencyOneHour:
                return @"ONE_HOUR";
            case AWSGuarddutyFindingPublishingFrequencySixHours:
                return @"SIX_HOURS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSGuarddutyDetectorStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSGuarddutyDetectorStatusDisabled);
        }
        return @(AWSGuarddutyDetectorStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuarddutyDetectorStatusEnabled:
                return @"ENABLED";
            case AWSGuarddutyDetectorStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuarddutyGetFilterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"filterName" : @"FilterName",
             };
}

@end

@implementation AWSGuarddutyGetFilterResponse

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
            return @(AWSGuarddutyFilterActionNoop);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVE"] == NSOrderedSame) {
            return @(AWSGuarddutyFilterActionArchive);
        }
        return @(AWSGuarddutyFilterActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuarddutyFilterActionNoop:
                return @"NOOP";
            case AWSGuarddutyFilterActionArchive:
                return @"ARCHIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)findingCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyFindingCriteria class]];
}

@end

@implementation AWSGuarddutyGetFindingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"findingIds" : @"FindingIds",
             @"sortCriteria" : @"SortCriteria",
             };
}

+ (NSValueTransformer *)sortCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutySortCriteria class]];
}

@end

@implementation AWSGuarddutyGetFindingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findings" : @"Findings",
             };
}

+ (NSValueTransformer *)findingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutyFinding class]];
}

@end

@implementation AWSGuarddutyGetFindingsStatisticsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"findingCriteria" : @"FindingCriteria",
             @"findingStatisticTypes" : @"FindingStatisticTypes",
             };
}

+ (NSValueTransformer *)findingCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyFindingCriteria class]];
}

@end

@implementation AWSGuarddutyGetFindingsStatisticsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findingStatistics" : @"FindingStatistics",
             };
}

+ (NSValueTransformer *)findingStatisticsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyFindingStatistics class]];
}

@end

@implementation AWSGuarddutyGetIPSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"ipSetId" : @"IpSetId",
             };
}

@end

@implementation AWSGuarddutyGetIPSetResponse

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
            return @(AWSGuarddutyIpSetFormatTxt);
        }
        if ([value caseInsensitiveCompare:@"STIX"] == NSOrderedSame) {
            return @(AWSGuarddutyIpSetFormatStix);
        }
        if ([value caseInsensitiveCompare:@"OTX_CSV"] == NSOrderedSame) {
            return @(AWSGuarddutyIpSetFormatOtxCsv);
        }
        if ([value caseInsensitiveCompare:@"ALIEN_VAULT"] == NSOrderedSame) {
            return @(AWSGuarddutyIpSetFormatAlienVault);
        }
        if ([value caseInsensitiveCompare:@"PROOF_POINT"] == NSOrderedSame) {
            return @(AWSGuarddutyIpSetFormatProofPoint);
        }
        if ([value caseInsensitiveCompare:@"FIRE_EYE"] == NSOrderedSame) {
            return @(AWSGuarddutyIpSetFormatFireEye);
        }
        return @(AWSGuarddutyIpSetFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuarddutyIpSetFormatTxt:
                return @"TXT";
            case AWSGuarddutyIpSetFormatStix:
                return @"STIX";
            case AWSGuarddutyIpSetFormatOtxCsv:
                return @"OTX_CSV";
            case AWSGuarddutyIpSetFormatAlienVault:
                return @"ALIEN_VAULT";
            case AWSGuarddutyIpSetFormatProofPoint:
                return @"PROOF_POINT";
            case AWSGuarddutyIpSetFormatFireEye:
                return @"FIRE_EYE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSGuarddutyIpSetStatusInactive);
        }
        if ([value caseInsensitiveCompare:@"ACTIVATING"] == NSOrderedSame) {
            return @(AWSGuarddutyIpSetStatusActivating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSGuarddutyIpSetStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DEACTIVATING"] == NSOrderedSame) {
            return @(AWSGuarddutyIpSetStatusDeactivating);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSGuarddutyIpSetStatusError);
        }
        if ([value caseInsensitiveCompare:@"DELETE_PENDING"] == NSOrderedSame) {
            return @(AWSGuarddutyIpSetStatusDeletePending);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSGuarddutyIpSetStatusDeleted);
        }
        return @(AWSGuarddutyIpSetStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuarddutyIpSetStatusInactive:
                return @"INACTIVE";
            case AWSGuarddutyIpSetStatusActivating:
                return @"ACTIVATING";
            case AWSGuarddutyIpSetStatusActive:
                return @"ACTIVE";
            case AWSGuarddutyIpSetStatusDeactivating:
                return @"DEACTIVATING";
            case AWSGuarddutyIpSetStatusError:
                return @"ERROR";
            case AWSGuarddutyIpSetStatusDeletePending:
                return @"DELETE_PENDING";
            case AWSGuarddutyIpSetStatusDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuarddutyGetInvitationsCountRequest

@end

@implementation AWSGuarddutyGetInvitationsCountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invitationsCount" : @"InvitationsCount",
             };
}

@end

@implementation AWSGuarddutyGetMasterAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuarddutyGetMasterAccountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"master" : @"Master",
             };
}

+ (NSValueTransformer *)masterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyMaster class]];
}

@end

@implementation AWSGuarddutyGetMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuarddutyGetMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"members" : @"Members",
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)membersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutyMember class]];
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutyUnprocessedAccount class]];
}

@end

@implementation AWSGuarddutyGetThreatIntelSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"threatIntelSetId" : @"ThreatIntelSetId",
             };
}

@end

@implementation AWSGuarddutyGetThreatIntelSetResponse

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
            return @(AWSGuarddutyThreatIntelSetFormatTxt);
        }
        if ([value caseInsensitiveCompare:@"STIX"] == NSOrderedSame) {
            return @(AWSGuarddutyThreatIntelSetFormatStix);
        }
        if ([value caseInsensitiveCompare:@"OTX_CSV"] == NSOrderedSame) {
            return @(AWSGuarddutyThreatIntelSetFormatOtxCsv);
        }
        if ([value caseInsensitiveCompare:@"ALIEN_VAULT"] == NSOrderedSame) {
            return @(AWSGuarddutyThreatIntelSetFormatAlienVault);
        }
        if ([value caseInsensitiveCompare:@"PROOF_POINT"] == NSOrderedSame) {
            return @(AWSGuarddutyThreatIntelSetFormatProofPoint);
        }
        if ([value caseInsensitiveCompare:@"FIRE_EYE"] == NSOrderedSame) {
            return @(AWSGuarddutyThreatIntelSetFormatFireEye);
        }
        return @(AWSGuarddutyThreatIntelSetFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuarddutyThreatIntelSetFormatTxt:
                return @"TXT";
            case AWSGuarddutyThreatIntelSetFormatStix:
                return @"STIX";
            case AWSGuarddutyThreatIntelSetFormatOtxCsv:
                return @"OTX_CSV";
            case AWSGuarddutyThreatIntelSetFormatAlienVault:
                return @"ALIEN_VAULT";
            case AWSGuarddutyThreatIntelSetFormatProofPoint:
                return @"PROOF_POINT";
            case AWSGuarddutyThreatIntelSetFormatFireEye:
                return @"FIRE_EYE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSGuarddutyThreatIntelSetStatusInactive);
        }
        if ([value caseInsensitiveCompare:@"ACTIVATING"] == NSOrderedSame) {
            return @(AWSGuarddutyThreatIntelSetStatusActivating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSGuarddutyThreatIntelSetStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DEACTIVATING"] == NSOrderedSame) {
            return @(AWSGuarddutyThreatIntelSetStatusDeactivating);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSGuarddutyThreatIntelSetStatusError);
        }
        if ([value caseInsensitiveCompare:@"DELETE_PENDING"] == NSOrderedSame) {
            return @(AWSGuarddutyThreatIntelSetStatusDeletePending);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSGuarddutyThreatIntelSetStatusDeleted);
        }
        return @(AWSGuarddutyThreatIntelSetStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuarddutyThreatIntelSetStatusInactive:
                return @"INACTIVE";
            case AWSGuarddutyThreatIntelSetStatusActivating:
                return @"ACTIVATING";
            case AWSGuarddutyThreatIntelSetStatusActive:
                return @"ACTIVE";
            case AWSGuarddutyThreatIntelSetStatusDeactivating:
                return @"DEACTIVATING";
            case AWSGuarddutyThreatIntelSetStatusError:
                return @"ERROR";
            case AWSGuarddutyThreatIntelSetStatusDeletePending:
                return @"DELETE_PENDING";
            case AWSGuarddutyThreatIntelSetStatusDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuarddutyIamInstanceProfile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSGuarddutyInstanceDetails

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyIamInstanceProfile class]];
}

+ (NSValueTransformer *)networkInterfacesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutyNetworkInterface class]];
}

+ (NSValueTransformer *)productCodesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutyProductCode class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutyTag class]];
}

@end

@implementation AWSGuarddutyInvitation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"invitationId" : @"InvitationId",
             @"invitedAt" : @"InvitedAt",
             @"relationshipStatus" : @"RelationshipStatus",
             };
}

@end

@implementation AWSGuarddutyInviteMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             @"detectorId" : @"DetectorId",
             @"disableEmailNotification" : @"DisableEmailNotification",
             @"message" : @"Message",
             };
}

@end

@implementation AWSGuarddutyInviteMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutyUnprocessedAccount class]];
}

@end

@implementation AWSGuarddutyListDetectorsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGuarddutyListDetectorsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorIds" : @"DetectorIds",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGuarddutyListFiltersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGuarddutyListFiltersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterNames" : @"FilterNames",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGuarddutyListFindingsRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyFindingCriteria class]];
}

+ (NSValueTransformer *)sortCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutySortCriteria class]];
}

@end

@implementation AWSGuarddutyListFindingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findingIds" : @"FindingIds",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGuarddutyListIPSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGuarddutyListIPSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ipSetIds" : @"IpSetIds",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGuarddutyListInvitationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGuarddutyListInvitationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invitations" : @"Invitations",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)invitationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutyInvitation class]];
}

@end

@implementation AWSGuarddutyListMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"onlyAssociated" : @"OnlyAssociated",
             };
}

@end

@implementation AWSGuarddutyListMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"members" : @"Members",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)membersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutyMember class]];
}

@end

@implementation AWSGuarddutyListOrganizationAdminAccountsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGuarddutyListOrganizationAdminAccountsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adminAccounts" : @"AdminAccounts",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)adminAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutyAdminAccount class]];
}

@end

@implementation AWSGuarddutyListPublishingDestinationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGuarddutyListPublishingDestinationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinations" : @"Destinations",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutyDestination class]];
}

@end

@implementation AWSGuarddutyListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSGuarddutyListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSGuarddutyListThreatIntelSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGuarddutyListThreatIntelSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"threatIntelSetIds" : @"ThreatIntelSetIds",
             };
}

@end

@implementation AWSGuarddutyLocalIpDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ipAddressV4" : @"IpAddressV4",
             };
}

@end

@implementation AWSGuarddutyLocalPortDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"port" : @"Port",
             @"portName" : @"PortName",
             };
}

@end

@implementation AWSGuarddutyMaster

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"invitationId" : @"InvitationId",
             @"invitedAt" : @"InvitedAt",
             @"relationshipStatus" : @"RelationshipStatus",
             };
}

@end

@implementation AWSGuarddutyMember

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

@implementation AWSGuarddutyNetworkConnectionAction

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyLocalIpDetails class]];
}

+ (NSValueTransformer *)localPortDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyLocalPortDetails class]];
}

+ (NSValueTransformer *)remoteIpDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyRemoteIpDetails class]];
}

+ (NSValueTransformer *)remotePortDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyRemotePortDetails class]];
}

@end

@implementation AWSGuarddutyNetworkInterface

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutyPrivateIpAddressDetails class]];
}

+ (NSValueTransformer *)securityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutySecurityGroup class]];
}

@end

@implementation AWSGuarddutyOrganization

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"asn" : @"Asn",
             @"asnOrg" : @"AsnOrg",
             @"isp" : @"Isp",
             @"org" : @"Org",
             };
}

@end

@implementation AWSGuarddutyOwner

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSGuarddutyPermissionConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountLevelPermissions" : @"AccountLevelPermissions",
             @"bucketLevelPermissions" : @"BucketLevelPermissions",
             };
}

+ (NSValueTransformer *)accountLevelPermissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyAccountLevelPermissions class]];
}

+ (NSValueTransformer *)bucketLevelPermissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyBucketLevelPermissions class]];
}

@end

@implementation AWSGuarddutyPortProbeAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blocked" : @"Blocked",
             @"portProbeDetails" : @"PortProbeDetails",
             };
}

+ (NSValueTransformer *)portProbeDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutyPortProbeDetail class]];
}

@end

@implementation AWSGuarddutyPortProbeDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"localIpDetails" : @"LocalIpDetails",
             @"localPortDetails" : @"LocalPortDetails",
             @"remoteIpDetails" : @"RemoteIpDetails",
             };
}

+ (NSValueTransformer *)localIpDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyLocalIpDetails class]];
}

+ (NSValueTransformer *)localPortDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyLocalPortDetails class]];
}

+ (NSValueTransformer *)remoteIpDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyRemoteIpDetails class]];
}

@end

@implementation AWSGuarddutyPrivateIpAddressDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"privateDnsName" : @"PrivateDnsName",
             @"privateIpAddress" : @"PrivateIpAddress",
             };
}

@end

@implementation AWSGuarddutyProductCode

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"productType" : @"ProductType",
             };
}

@end

@implementation AWSGuarddutyPublicAccess

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"effectivePermission" : @"EffectivePermission",
             @"permissionConfiguration" : @"PermissionConfiguration",
             };
}

+ (NSValueTransformer *)permissionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyPermissionConfiguration class]];
}

@end

@implementation AWSGuarddutyRemoteIpDetails

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyCity class]];
}

+ (NSValueTransformer *)countryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyCountry class]];
}

+ (NSValueTransformer *)geoLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyGeoLocation class]];
}

+ (NSValueTransformer *)organizationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyOrganization class]];
}

@end

@implementation AWSGuarddutyRemotePortDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"port" : @"Port",
             @"portName" : @"PortName",
             };
}

@end

@implementation AWSGuarddutyResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessKeyDetails" : @"AccessKeyDetails",
             @"instanceDetails" : @"InstanceDetails",
             @"resourceType" : @"ResourceType",
             @"s3BucketDetails" : @"S3BucketDetails",
             };
}

+ (NSValueTransformer *)accessKeyDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyAccessKeyDetails class]];
}

+ (NSValueTransformer *)instanceDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyInstanceDetails class]];
}

+ (NSValueTransformer *)s3BucketDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutyS3BucketDetail class]];
}

@end

@implementation AWSGuarddutyS3BucketDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdAt" : @"CreatedAt",
             @"defaultServerSideEncryption" : @"DefaultServerSideEncryption",
             @"name" : @"Name",
             @"owner" : @"Owner",
             @"publicAccess" : @"PublicAccess",
             @"tags" : @"Tags",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)defaultServerSideEncryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyDefaultServerSideEncryption class]];
}

+ (NSValueTransformer *)ownerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyOwner class]];
}

+ (NSValueTransformer *)publicAccessJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyPublicAccess class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutyTag class]];
}

@end

@implementation AWSGuarddutySecurityGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupId" : @"GroupId",
             @"groupName" : @"GroupName",
             };
}

@end

@implementation AWSGuarddutyService

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyAction class]];
}

+ (NSValueTransformer *)evidenceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyEvidence class]];
}

@end

@implementation AWSGuarddutySortCriteria

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"orderBy" : @"OrderBy",
             };
}

+ (NSValueTransformer *)orderByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASC"] == NSOrderedSame) {
            return @(AWSGuarddutyOrderByAsc);
        }
        if ([value caseInsensitiveCompare:@"DESC"] == NSOrderedSame) {
            return @(AWSGuarddutyOrderByDesc);
        }
        return @(AWSGuarddutyOrderByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuarddutyOrderByAsc:
                return @"ASC";
            case AWSGuarddutyOrderByDesc:
                return @"DESC";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuarddutyStartMonitoringMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuarddutyStartMonitoringMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutyUnprocessedAccount class]];
}

@end

@implementation AWSGuarddutyStopMonitoringMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuarddutyStopMonitoringMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedAccounts" : @"UnprocessedAccounts",
             };
}

+ (NSValueTransformer *)unprocessedAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGuarddutyUnprocessedAccount class]];
}

@end

@implementation AWSGuarddutyTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSGuarddutyTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSGuarddutyTagResourceResponse

@end

@implementation AWSGuarddutyThreatIntelligenceDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"threatListName" : @"ThreatListName",
             @"threatNames" : @"ThreatNames",
             };
}

@end

@implementation AWSGuarddutyUnarchiveFindingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"DetectorId",
             @"findingIds" : @"FindingIds",
             };
}

@end

@implementation AWSGuarddutyUnarchiveFindingsResponse

@end

@implementation AWSGuarddutyUnprocessedAccount

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"result" : @"Result",
             };
}

@end

@implementation AWSGuarddutyUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSGuarddutyUntagResourceResponse

@end

@implementation AWSGuarddutyUpdateDetectorRequest

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
            return @(AWSGuarddutyFindingPublishingFrequencyFifteenMinutes);
        }
        if ([value caseInsensitiveCompare:@"ONE_HOUR"] == NSOrderedSame) {
            return @(AWSGuarddutyFindingPublishingFrequencyOneHour);
        }
        if ([value caseInsensitiveCompare:@"SIX_HOURS"] == NSOrderedSame) {
            return @(AWSGuarddutyFindingPublishingFrequencySixHours);
        }
        return @(AWSGuarddutyFindingPublishingFrequencyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuarddutyFindingPublishingFrequencyFifteenMinutes:
                return @"FIFTEEN_MINUTES";
            case AWSGuarddutyFindingPublishingFrequencyOneHour:
                return @"ONE_HOUR";
            case AWSGuarddutyFindingPublishingFrequencySixHours:
                return @"SIX_HOURS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuarddutyUpdateDetectorResponse

@end

@implementation AWSGuarddutyUpdateFilterRequest

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
            return @(AWSGuarddutyFilterActionNoop);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVE"] == NSOrderedSame) {
            return @(AWSGuarddutyFilterActionArchive);
        }
        return @(AWSGuarddutyFilterActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuarddutyFilterActionNoop:
                return @"NOOP";
            case AWSGuarddutyFilterActionArchive:
                return @"ARCHIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)findingCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyFindingCriteria class]];
}

@end

@implementation AWSGuarddutyUpdateFilterResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGuarddutyUpdateFindingsFeedbackRequest

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
            return @(AWSGuarddutyFeedbackUseful);
        }
        if ([value caseInsensitiveCompare:@"NOT_USEFUL"] == NSOrderedSame) {
            return @(AWSGuarddutyFeedbackNotUseful);
        }
        return @(AWSGuarddutyFeedbackUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGuarddutyFeedbackUseful:
                return @"USEFUL";
            case AWSGuarddutyFeedbackNotUseful:
                return @"NOT_USEFUL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGuarddutyUpdateFindingsFeedbackResponse

@end

@implementation AWSGuarddutyUpdateIPSetRequest

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

@implementation AWSGuarddutyUpdateIPSetResponse

@end

@implementation AWSGuarddutyUpdateOrganizationConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoEnable" : @"AutoEnable",
             @"detectorId" : @"DetectorId",
             };
}

@end

@implementation AWSGuarddutyUpdateOrganizationConfigurationResponse

@end

@implementation AWSGuarddutyUpdatePublishingDestinationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationId" : @"DestinationId",
             @"destinationProperties" : @"DestinationProperties",
             @"detectorId" : @"DetectorId",
             };
}

+ (NSValueTransformer *)destinationPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGuarddutyDestinationProperties class]];
}

@end

@implementation AWSGuarddutyUpdatePublishingDestinationResponse

@end

@implementation AWSGuarddutyUpdateThreatIntelSetRequest

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

@implementation AWSGuarddutyUpdateThreatIntelSetResponse

@end
