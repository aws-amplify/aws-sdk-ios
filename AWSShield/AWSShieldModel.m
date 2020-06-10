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

#import "AWSShieldModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSShieldErrorDomain = @"com.amazonaws.AWSShieldErrorDomain";

@implementation AWSShieldAssociateDRTLogBucketRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logBucket" : @"LogBucket",
             };
}

@end

@implementation AWSShieldAssociateDRTLogBucketResponse

@end

@implementation AWSShieldAssociateDRTRoleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"RoleArn",
             };
}

@end

@implementation AWSShieldAssociateDRTRoleResponse

@end

@implementation AWSShieldAssociateHealthCheckRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheckArn" : @"HealthCheckArn",
             @"protectionId" : @"ProtectionId",
             };
}

@end

@implementation AWSShieldAssociateHealthCheckResponse

@end

@implementation AWSShieldAssociateProactiveEngagementDetailsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emergencyContactList" : @"EmergencyContactList",
             };
}

+ (NSValueTransformer *)emergencyContactListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSShieldEmergencyContact class]];
}

@end

@implementation AWSShieldAssociateProactiveEngagementDetailsResponse

@end

@implementation AWSShieldAttackDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attackCounters" : @"AttackCounters",
             @"attackId" : @"AttackId",
             @"attackProperties" : @"AttackProperties",
             @"endTime" : @"EndTime",
             @"mitigations" : @"Mitigations",
             @"resourceArn" : @"ResourceArn",
             @"startTime" : @"StartTime",
             @"subResources" : @"SubResources",
             };
}

+ (NSValueTransformer *)attackCountersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSShieldSummarizedCounter class]];
}

+ (NSValueTransformer *)attackPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSShieldAttackProperty class]];
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)mitigationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSShieldMitigation class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)subResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSShieldSubResourceSummary class]];
}

@end

@implementation AWSShieldAttackProperty

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attackLayer" : @"AttackLayer",
             @"attackPropertyIdentifier" : @"AttackPropertyIdentifier",
             @"topContributors" : @"TopContributors",
             @"total" : @"Total",
             @"unit" : @"Unit",
             };
}

+ (NSValueTransformer *)attackLayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NETWORK"] == NSOrderedSame) {
            return @(AWSShieldAttackLayerNetwork);
        }
        if ([value caseInsensitiveCompare:@"APPLICATION"] == NSOrderedSame) {
            return @(AWSShieldAttackLayerApplication);
        }
        return @(AWSShieldAttackLayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSShieldAttackLayerNetwork:
                return @"NETWORK";
            case AWSShieldAttackLayerApplication:
                return @"APPLICATION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)attackPropertyIdentifierJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DESTINATION_URL"] == NSOrderedSame) {
            return @(AWSShieldAttackPropertyIdentifierDestinationUrl);
        }
        if ([value caseInsensitiveCompare:@"REFERRER"] == NSOrderedSame) {
            return @(AWSShieldAttackPropertyIdentifierReferrer);
        }
        if ([value caseInsensitiveCompare:@"SOURCE_ASN"] == NSOrderedSame) {
            return @(AWSShieldAttackPropertyIdentifierSourceAsn);
        }
        if ([value caseInsensitiveCompare:@"SOURCE_COUNTRY"] == NSOrderedSame) {
            return @(AWSShieldAttackPropertyIdentifierSourceCountry);
        }
        if ([value caseInsensitiveCompare:@"SOURCE_IP_ADDRESS"] == NSOrderedSame) {
            return @(AWSShieldAttackPropertyIdentifierSourceIpAddress);
        }
        if ([value caseInsensitiveCompare:@"SOURCE_USER_AGENT"] == NSOrderedSame) {
            return @(AWSShieldAttackPropertyIdentifierSourceUserAgent);
        }
        if ([value caseInsensitiveCompare:@"WORDPRESS_PINGBACK_REFLECTOR"] == NSOrderedSame) {
            return @(AWSShieldAttackPropertyIdentifierWordpressPingbackReflector);
        }
        if ([value caseInsensitiveCompare:@"WORDPRESS_PINGBACK_SOURCE"] == NSOrderedSame) {
            return @(AWSShieldAttackPropertyIdentifierWordpressPingbackSource);
        }
        return @(AWSShieldAttackPropertyIdentifierUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSShieldAttackPropertyIdentifierDestinationUrl:
                return @"DESTINATION_URL";
            case AWSShieldAttackPropertyIdentifierReferrer:
                return @"REFERRER";
            case AWSShieldAttackPropertyIdentifierSourceAsn:
                return @"SOURCE_ASN";
            case AWSShieldAttackPropertyIdentifierSourceCountry:
                return @"SOURCE_COUNTRY";
            case AWSShieldAttackPropertyIdentifierSourceIpAddress:
                return @"SOURCE_IP_ADDRESS";
            case AWSShieldAttackPropertyIdentifierSourceUserAgent:
                return @"SOURCE_USER_AGENT";
            case AWSShieldAttackPropertyIdentifierWordpressPingbackReflector:
                return @"WORDPRESS_PINGBACK_REFLECTOR";
            case AWSShieldAttackPropertyIdentifierWordpressPingbackSource:
                return @"WORDPRESS_PINGBACK_SOURCE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)topContributorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSShieldContributor class]];
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BITS"] == NSOrderedSame) {
            return @(AWSShieldUnitBits);
        }
        if ([value caseInsensitiveCompare:@"BYTES"] == NSOrderedSame) {
            return @(AWSShieldUnitBytes);
        }
        if ([value caseInsensitiveCompare:@"PACKETS"] == NSOrderedSame) {
            return @(AWSShieldUnitPackets);
        }
        if ([value caseInsensitiveCompare:@"REQUESTS"] == NSOrderedSame) {
            return @(AWSShieldUnitRequests);
        }
        return @(AWSShieldUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSShieldUnitBits:
                return @"BITS";
            case AWSShieldUnitBytes:
                return @"BYTES";
            case AWSShieldUnitPackets:
                return @"PACKETS";
            case AWSShieldUnitRequests:
                return @"REQUESTS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSShieldAttackSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attackId" : @"AttackId",
             @"attackVectors" : @"AttackVectors",
             @"endTime" : @"EndTime",
             @"resourceArn" : @"ResourceArn",
             @"startTime" : @"StartTime",
             };
}

+ (NSValueTransformer *)attackVectorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSShieldAttackVectorDescription class]];
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

@implementation AWSShieldAttackVectorDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vectorType" : @"VectorType",
             };
}

@end

@implementation AWSShieldContributor

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSShieldCreateProtectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSShieldCreateProtectionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"protectionId" : @"ProtectionId",
             };
}

@end

@implementation AWSShieldCreateSubscriptionRequest

@end

@implementation AWSShieldCreateSubscriptionResponse

@end

@implementation AWSShieldDeleteProtectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"protectionId" : @"ProtectionId",
             };
}

@end

@implementation AWSShieldDeleteProtectionResponse

@end

@implementation AWSShieldDeleteSubscriptionRequest

@end

@implementation AWSShieldDeleteSubscriptionResponse

@end

@implementation AWSShieldDescribeAttackRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attackId" : @"AttackId",
             };
}

@end

@implementation AWSShieldDescribeAttackResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attack" : @"Attack",
             };
}

+ (NSValueTransformer *)attackJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSShieldAttackDetail class]];
}

@end

@implementation AWSShieldDescribeDRTAccessRequest

@end

@implementation AWSShieldDescribeDRTAccessResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logBucketList" : @"LogBucketList",
             @"roleArn" : @"RoleArn",
             };
}

@end

@implementation AWSShieldDescribeEmergencyContactSettingsRequest

@end

@implementation AWSShieldDescribeEmergencyContactSettingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emergencyContactList" : @"EmergencyContactList",
             };
}

+ (NSValueTransformer *)emergencyContactListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSShieldEmergencyContact class]];
}

@end

@implementation AWSShieldDescribeProtectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"protectionId" : @"ProtectionId",
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSShieldDescribeProtectionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"protection" : @"Protection",
             };
}

+ (NSValueTransformer *)protectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSShieldProtection class]];
}

@end

@implementation AWSShieldDescribeSubscriptionRequest

@end

@implementation AWSShieldDescribeSubscriptionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subscription" : @"Subscription",
             };
}

+ (NSValueTransformer *)subscriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSShieldSubscription class]];
}

@end

@implementation AWSShieldDisableProactiveEngagementRequest

@end

@implementation AWSShieldDisableProactiveEngagementResponse

@end

@implementation AWSShieldDisassociateDRTLogBucketRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logBucket" : @"LogBucket",
             };
}

@end

@implementation AWSShieldDisassociateDRTLogBucketResponse

@end

@implementation AWSShieldDisassociateDRTRoleRequest

@end

@implementation AWSShieldDisassociateDRTRoleResponse

@end

@implementation AWSShieldDisassociateHealthCheckRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheckArn" : @"HealthCheckArn",
             @"protectionId" : @"ProtectionId",
             };
}

@end

@implementation AWSShieldDisassociateHealthCheckResponse

@end

@implementation AWSShieldEmergencyContact

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactNotes" : @"ContactNotes",
             @"emailAddress" : @"EmailAddress",
             @"phoneNumber" : @"PhoneNumber",
             };
}

@end

@implementation AWSShieldEnableProactiveEngagementRequest

@end

@implementation AWSShieldEnableProactiveEngagementResponse

@end

@implementation AWSShieldGetSubscriptionStateRequest

@end

@implementation AWSShieldGetSubscriptionStateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subscriptionState" : @"SubscriptionState",
             };
}

+ (NSValueTransformer *)subscriptionStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSShieldSubscriptionStateActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSShieldSubscriptionStateInactive);
        }
        return @(AWSShieldSubscriptionStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSShieldSubscriptionStateActive:
                return @"ACTIVE";
            case AWSShieldSubscriptionStateInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSShieldLimit

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"max" : @"Max",
             @"types" : @"Type",
             };
}

@end

@implementation AWSShieldListAttacksRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"EndTime",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"resourceArns" : @"ResourceArns",
             @"startTime" : @"StartTime",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSShieldTimeRange class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSShieldTimeRange class]];
}

@end

@implementation AWSShieldListAttacksResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attackSummaries" : @"AttackSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)attackSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSShieldAttackSummary class]];
}

@end

@implementation AWSShieldListProtectionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSShieldListProtectionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"protections" : @"Protections",
             };
}

+ (NSValueTransformer *)protectionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSShieldProtection class]];
}

@end

@implementation AWSShieldMitigation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mitigationName" : @"MitigationName",
             };
}

@end

@implementation AWSShieldProtection

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheckIds" : @"HealthCheckIds",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSShieldSubResourceSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attackVectors" : @"AttackVectors",
             @"counters" : @"Counters",
             @"identifier" : @"Id",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)attackVectorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSShieldSummarizedAttackVector class]];
}

+ (NSValueTransformer *)countersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSShieldSummarizedCounter class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IP"] == NSOrderedSame) {
            return @(AWSShieldSubResourceTypeIp);
        }
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSShieldSubResourceTypeUrl);
        }
        return @(AWSShieldSubResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSShieldSubResourceTypeIp:
                return @"IP";
            case AWSShieldSubResourceTypeUrl:
                return @"URL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSShieldSubscription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoRenew" : @"AutoRenew",
             @"endTime" : @"EndTime",
             @"limits" : @"Limits",
             @"proactiveEngagementStatus" : @"ProactiveEngagementStatus",
             @"startTime" : @"StartTime",
             @"timeCommitmentInSeconds" : @"TimeCommitmentInSeconds",
             };
}

+ (NSValueTransformer *)autoRenewJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSShieldAutoRenewEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSShieldAutoRenewDisabled);
        }
        return @(AWSShieldAutoRenewUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSShieldAutoRenewEnabled:
                return @"ENABLED";
            case AWSShieldAutoRenewDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)limitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSShieldLimit class]];
}

+ (NSValueTransformer *)proactiveEngagementStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSShieldProactiveEngagementStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSShieldProactiveEngagementStatusDisabled);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSShieldProactiveEngagementStatusPending);
        }
        return @(AWSShieldProactiveEngagementStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSShieldProactiveEngagementStatusEnabled:
                return @"ENABLED";
            case AWSShieldProactiveEngagementStatusDisabled:
                return @"DISABLED";
            case AWSShieldProactiveEngagementStatusPending:
                return @"PENDING";
            default:
                return nil;
        }
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

@implementation AWSShieldSummarizedAttackVector

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vectorCounters" : @"VectorCounters",
             @"vectorType" : @"VectorType",
             };
}

+ (NSValueTransformer *)vectorCountersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSShieldSummarizedCounter class]];
}

@end

@implementation AWSShieldSummarizedCounter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"average" : @"Average",
             @"max" : @"Max",
             @"N" : @"N",
             @"name" : @"Name",
             @"sum" : @"Sum",
             @"unit" : @"Unit",
             };
}

@end

@implementation AWSShieldTimeRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fromInclusive" : @"FromInclusive",
             @"toExclusive" : @"ToExclusive",
             };
}

+ (NSValueTransformer *)fromInclusiveJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)toExclusiveJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSShieldUpdateEmergencyContactSettingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emergencyContactList" : @"EmergencyContactList",
             };
}

+ (NSValueTransformer *)emergencyContactListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSShieldEmergencyContact class]];
}

@end

@implementation AWSShieldUpdateEmergencyContactSettingsResponse

@end

@implementation AWSShieldUpdateSubscriptionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoRenew" : @"AutoRenew",
             };
}

+ (NSValueTransformer *)autoRenewJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSShieldAutoRenewEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSShieldAutoRenewDisabled);
        }
        return @(AWSShieldAutoRenewUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSShieldAutoRenewEnabled:
                return @"ENABLED";
            case AWSShieldAutoRenewDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSShieldUpdateSubscriptionResponse

@end
