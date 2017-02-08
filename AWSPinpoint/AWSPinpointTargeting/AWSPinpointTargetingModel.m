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

#import "AWSPinpointTargetingModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSPinpointTargetingErrorDomain = @"com.amazonaws.AWSPinpointTargetingErrorDomain";

@implementation AWSPinpointTargetingAPNSChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificate" : @"Certificate",
             @"privateKey" : @"PrivateKey",
             };
}

@end

@implementation AWSPinpointTargetingAPNSChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"identifier" : @"Id",
             @"isArchived" : @"IsArchived",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"platform" : @"Platform",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingActivitiesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingActivityResponse class]];
}

@end

@implementation AWSPinpointTargetingActivityResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             @"end" : @"End",
             @"identifier" : @"Id",
             @"result" : @"Result",
             @"scheduledStart" : @"ScheduledStart",
             @"start" : @"Start",
             @"state" : @"State",
             @"successfulEndpointCount" : @"SuccessfulEndpointCount",
             @"totalEndpointCount" : @"TotalEndpointCount",
             @"treatmentId" : @"TreatmentId",
             };
}

@end

@implementation AWSPinpointTargetingApplicationSettingsResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"limits" : @"Limits",
             @"quietTime" : @"QuietTime",
             };
}

+ (NSValueTransformer *)limitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignLimits class]];
}

+ (NSValueTransformer *)quietTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingQuietTime class]];
}

@end

@implementation AWSPinpointTargetingAttributeDimension

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeType" : @"AttributeType",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)attributeTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUSIVE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingAttributeTypeInclusive);
        }
        if ([value caseInsensitiveCompare:@"EXCLUSIVE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingAttributeTypeExclusive);
        }
        return @(AWSPinpointTargetingAttributeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingAttributeTypeInclusive:
                return @"INCLUSIVE";
            case AWSPinpointTargetingAttributeTypeExclusive:
                return @"EXCLUSIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingCampaignLimits

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"daily" : @"Daily",
             @"total" : @"Total",
             };
}

@end

@implementation AWSPinpointTargetingCampaignResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalTreatments" : @"AdditionalTreatments",
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"defaultState" : @"DefaultState",
             @"detail" : @"Description",
             @"holdoutPercent" : @"HoldoutPercent",
             @"identifier" : @"Id",
             @"isPaused" : @"IsPaused",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"limits" : @"Limits",
             @"messageConfiguration" : @"MessageConfiguration",
             @"name" : @"Name",
             @"schedule" : @"Schedule",
             @"segmentId" : @"SegmentId",
             @"segmentVersion" : @"SegmentVersion",
             @"state" : @"State",
             @"treatmentDescription" : @"TreatmentDescription",
             @"treatmentName" : @"TreatmentName",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)additionalTreatmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingTreatmentResource class]];
}

+ (NSValueTransformer *)defaultStateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignState class]];
}

+ (NSValueTransformer *)limitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignLimits class]];
}

+ (NSValueTransformer *)messageConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageConfiguration class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSchedule class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignState class]];
}

@end

@implementation AWSPinpointTargetingCampaignState

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignStatus" : @"CampaignStatus",
             };
}

+ (NSValueTransformer *)campaignStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SCHEDULED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingCampaignStatusScheduled);
        }
        if ([value caseInsensitiveCompare:@"EXECUTING"] == NSOrderedSame) {
            return @(AWSPinpointTargetingCampaignStatusExecuting);
        }
        if ([value caseInsensitiveCompare:@"PENDING_NEXT_RUN"] == NSOrderedSame) {
            return @(AWSPinpointTargetingCampaignStatusPendingNextRun);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingCampaignStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"PAUSED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingCampaignStatusPaused);
        }
        return @(AWSPinpointTargetingCampaignStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingCampaignStatusScheduled:
                return @"SCHEDULED";
            case AWSPinpointTargetingCampaignStatusExecuting:
                return @"EXECUTING";
            case AWSPinpointTargetingCampaignStatusPendingNextRun:
                return @"PENDING_NEXT_RUN";
            case AWSPinpointTargetingCampaignStatusCompleted:
                return @"COMPLETED";
            case AWSPinpointTargetingCampaignStatusPaused:
                return @"PAUSED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingCampaignsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingCampaignResponse class]];
}

@end

@implementation AWSPinpointTargetingCreateCampaignRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"writeCampaignRequest" : @"WriteCampaignRequest",
             };
}

+ (NSValueTransformer *)writeCampaignRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingWriteCampaignRequest class]];
}

@end

@implementation AWSPinpointTargetingCreateCampaignResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignResponse" : @"CampaignResponse",
             };
}

+ (NSValueTransformer *)campaignResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignResponse class]];
}

@end

@implementation AWSPinpointTargetingCreateImportJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"importJobRequest" : @"ImportJobRequest",
             };
}

+ (NSValueTransformer *)importJobRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingImportJobRequest class]];
}

@end

@implementation AWSPinpointTargetingCreateImportJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importJobResponse" : @"ImportJobResponse",
             };
}

+ (NSValueTransformer *)importJobResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingImportJobResponse class]];
}

@end

@implementation AWSPinpointTargetingCreateSegmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"writeSegmentRequest" : @"WriteSegmentRequest",
             };
}

+ (NSValueTransformer *)writeSegmentRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingWriteSegmentRequest class]];
}

@end

@implementation AWSPinpointTargetingCreateSegmentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentResponse" : @"SegmentResponse",
             };
}

+ (NSValueTransformer *)segmentResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentResponse class]];
}

@end

@implementation AWSPinpointTargetingDeleteApnsChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteApnsChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSChannelResponse" : @"APNSChannelResponse",
             };
}

+ (NSValueTransformer *)APNSChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAPNSChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingDeleteCampaignRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteCampaignResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignResponse" : @"CampaignResponse",
             };
}

+ (NSValueTransformer *)campaignResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignResponse class]];
}

@end

@implementation AWSPinpointTargetingDeleteGcmChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteGcmChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"GCMChannelResponse" : @"GCMChannelResponse",
             };
}

+ (NSValueTransformer *)GCMChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingGCMChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingDeleteSegmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"segmentId" : @"SegmentId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteSegmentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentResponse" : @"SegmentResponse",
             };
}

+ (NSValueTransformer *)segmentResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentResponse class]];
}

@end

@implementation AWSPinpointTargetingEndpointBatchItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"attributes" : @"Attributes",
             @"channelType" : @"ChannelType",
             @"demographic" : @"Demographic",
             @"effectiveDate" : @"EffectiveDate",
             @"endpointStatus" : @"EndpointStatus",
             @"identifier" : @"Id",
             @"location" : @"Location",
             @"metrics" : @"Metrics",
             @"optOut" : @"OptOut",
             @"requestId" : @"RequestId",
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)channelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"APNS"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeApns);
        }
        if ([value caseInsensitiveCompare:@"GCM"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeGcm);
        }
        return @(AWSPinpointTargetingChannelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingChannelTypeApns:
                return @"APNS";
            case AWSPinpointTargetingChannelTypeGcm:
                return @"GCM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)demographicJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointDemographic class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointLocation class]];
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointUser class]];
}

@end

@implementation AWSPinpointTargetingEndpointBatchRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingEndpointBatchItem class]];
}

@end

@implementation AWSPinpointTargetingEndpointDemographic

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appVersion" : @"AppVersion",
             @"locale" : @"Locale",
             @"make" : @"Make",
             @"model" : @"Model",
             @"modelVersion" : @"ModelVersion",
             @"platform" : @"Platform",
             @"platformVersion" : @"PlatformVersion",
             @"timezone" : @"Timezone",
             };
}

@end

@implementation AWSPinpointTargetingEndpointLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"city" : @"City",
             @"country" : @"Country",
             @"latitude" : @"Latitude",
             @"longitude" : @"Longitude",
             @"postalCode" : @"PostalCode",
             @"region" : @"Region",
             };
}

@end

@implementation AWSPinpointTargetingEndpointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"attributes" : @"Attributes",
             @"channelType" : @"ChannelType",
             @"demographic" : @"Demographic",
             @"effectiveDate" : @"EffectiveDate",
             @"endpointStatus" : @"EndpointStatus",
             @"location" : @"Location",
             @"metrics" : @"Metrics",
             @"optOut" : @"OptOut",
             @"requestId" : @"RequestId",
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)channelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"APNS"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeApns);
        }
        if ([value caseInsensitiveCompare:@"GCM"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeGcm);
        }
        return @(AWSPinpointTargetingChannelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingChannelTypeApns:
                return @"APNS";
            case AWSPinpointTargetingChannelTypeGcm:
                return @"GCM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)demographicJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointDemographic class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointLocation class]];
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointUser class]];
}

@end

@implementation AWSPinpointTargetingEndpointResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"applicationId" : @"ApplicationId",
             @"attributes" : @"Attributes",
             @"channelType" : @"ChannelType",
             @"cohortId" : @"CohortId",
             @"creationDate" : @"CreationDate",
             @"demographic" : @"Demographic",
             @"effectiveDate" : @"EffectiveDate",
             @"endpointStatus" : @"EndpointStatus",
             @"identifier" : @"Id",
             @"location" : @"Location",
             @"metrics" : @"Metrics",
             @"optOut" : @"OptOut",
             @"requestId" : @"RequestId",
             @"shardId" : @"ShardId",
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)channelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"APNS"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeApns);
        }
        if ([value caseInsensitiveCompare:@"GCM"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeGcm);
        }
        return @(AWSPinpointTargetingChannelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingChannelTypeApns:
                return @"APNS";
            case AWSPinpointTargetingChannelTypeGcm:
                return @"GCM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)demographicJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointDemographic class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointLocation class]];
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointUser class]];
}

@end

@implementation AWSPinpointTargetingEndpointUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userAttributes" : @"UserAttributes",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSPinpointTargetingGCMChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiKey" : @"ApiKey",
             };
}

@end

@implementation AWSPinpointTargetingGCMChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"credential" : @"Credential",
             @"identifier" : @"Id",
             @"isArchived" : @"IsArchived",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"platform" : @"Platform",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingGetApnsChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetApnsChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSChannelResponse" : @"APNSChannelResponse",
             };
}

+ (NSValueTransformer *)APNSChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAPNSChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingGetApplicationSettingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetApplicationSettingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationSettingsResource" : @"ApplicationSettingsResource",
             };
}

+ (NSValueTransformer *)applicationSettingsResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingApplicationSettingsResource class]];
}

@end

@implementation AWSPinpointTargetingGetCampaignActivitiesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointTargetingGetCampaignActivitiesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activitiesResponse" : @"ActivitiesResponse",
             };
}

+ (NSValueTransformer *)activitiesResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingActivitiesResponse class]];
}

@end

@implementation AWSPinpointTargetingGetCampaignRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             };
}

@end

@implementation AWSPinpointTargetingGetCampaignResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignResponse" : @"CampaignResponse",
             };
}

+ (NSValueTransformer *)campaignResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignResponse class]];
}

@end

@implementation AWSPinpointTargetingGetCampaignVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingGetCampaignVersionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignResponse" : @"CampaignResponse",
             };
}

+ (NSValueTransformer *)campaignResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignResponse class]];
}

@end

@implementation AWSPinpointTargetingGetCampaignVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointTargetingGetCampaignVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignsResponse" : @"CampaignsResponse",
             };
}

+ (NSValueTransformer *)campaignsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignsResponse class]];
}

@end

@implementation AWSPinpointTargetingGetCampaignsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointTargetingGetCampaignsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignsResponse" : @"CampaignsResponse",
             };
}

+ (NSValueTransformer *)campaignsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignsResponse class]];
}

@end

@implementation AWSPinpointTargetingGetEndpointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"endpointId" : @"EndpointId",
             };
}

@end

@implementation AWSPinpointTargetingGetEndpointResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointResponse" : @"EndpointResponse",
             };
}

+ (NSValueTransformer *)endpointResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointResponse class]];
}

@end

@implementation AWSPinpointTargetingGetGcmChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetGcmChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"GCMChannelResponse" : @"GCMChannelResponse",
             };
}

+ (NSValueTransformer *)GCMChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingGCMChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingGetImportJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSPinpointTargetingGetImportJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importJobResponse" : @"ImportJobResponse",
             };
}

+ (NSValueTransformer *)importJobResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingImportJobResponse class]];
}

@end

@implementation AWSPinpointTargetingGetImportJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointTargetingGetImportJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importJobsResponse" : @"ImportJobsResponse",
             };
}

+ (NSValueTransformer *)importJobsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingImportJobsResponse class]];
}

@end

@implementation AWSPinpointTargetingGetSegmentImportJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"pageSize" : @"PageSize",
             @"segmentId" : @"SegmentId",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointTargetingGetSegmentImportJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importJobsResponse" : @"ImportJobsResponse",
             };
}

+ (NSValueTransformer *)importJobsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingImportJobsResponse class]];
}

@end

@implementation AWSPinpointTargetingGetSegmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"segmentId" : @"SegmentId",
             };
}

@end

@implementation AWSPinpointTargetingGetSegmentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentResponse" : @"SegmentResponse",
             };
}

+ (NSValueTransformer *)segmentResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentResponse class]];
}

@end

@implementation AWSPinpointTargetingGetSegmentVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"segmentId" : @"SegmentId",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingGetSegmentVersionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentResponse" : @"SegmentResponse",
             };
}

+ (NSValueTransformer *)segmentResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentResponse class]];
}

@end

@implementation AWSPinpointTargetingGetSegmentVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"pageSize" : @"PageSize",
             @"segmentId" : @"SegmentId",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointTargetingGetSegmentVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentsResponse" : @"SegmentsResponse",
             };
}

+ (NSValueTransformer *)segmentsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentsResponse class]];
}

@end

@implementation AWSPinpointTargetingGetSegmentsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointTargetingGetSegmentsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentsResponse" : @"SegmentsResponse",
             };
}

+ (NSValueTransformer *)segmentsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentsResponse class]];
}

@end

@implementation AWSPinpointTargetingImportJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defineSegment" : @"DefineSegment",
             @"externalId" : @"ExternalId",
             @"format" : @"Format",
             @"registerEndpoints" : @"RegisterEndpoints",
             @"roleArn" : @"RoleArn",
             @"s3Url" : @"S3Url",
             @"segmentId" : @"SegmentId",
             @"segmentName" : @"SegmentName",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CSV"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFormatCsv);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFormatJson);
        }
        return @(AWSPinpointTargetingFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingFormatCsv:
                return @"CSV";
            case AWSPinpointTargetingFormatJson:
                return @"JSON";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingImportJobResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defineSegment" : @"DefineSegment",
             @"externalId" : @"ExternalId",
             @"format" : @"Format",
             @"registerEndpoints" : @"RegisterEndpoints",
             @"roleArn" : @"RoleArn",
             @"s3Url" : @"S3Url",
             @"segmentId" : @"SegmentId",
             @"segmentName" : @"SegmentName",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CSV"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFormatCsv);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFormatJson);
        }
        return @(AWSPinpointTargetingFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingFormatCsv:
                return @"CSV";
            case AWSPinpointTargetingFormatJson:
                return @"JSON";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingImportJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"completedPieces" : @"CompletedPieces",
             @"completionDate" : @"CompletionDate",
             @"creationDate" : @"CreationDate",
             @"definition" : @"Definition",
             @"failedPieces" : @"FailedPieces",
             @"failures" : @"Failures",
             @"identifier" : @"Id",
             @"jobStatus" : @"JobStatus",
             @"totalFailures" : @"TotalFailures",
             @"totalPieces" : @"TotalPieces",
             @"totalProcessed" : @"TotalProcessed",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)definitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingImportJobResource class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusCreated);
        }
        if ([value caseInsensitiveCompare:@"INITIALIZING"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusInitializing);
        }
        if ([value caseInsensitiveCompare:@"PROCESSING"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusProcessing);
        }
        if ([value caseInsensitiveCompare:@"COMPLETING"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusCompleting);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILING"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusFailing);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusFailed);
        }
        return @(AWSPinpointTargetingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingJobStatusCreated:
                return @"CREATED";
            case AWSPinpointTargetingJobStatusInitializing:
                return @"INITIALIZING";
            case AWSPinpointTargetingJobStatusProcessing:
                return @"PROCESSING";
            case AWSPinpointTargetingJobStatusCompleting:
                return @"COMPLETING";
            case AWSPinpointTargetingJobStatusCompleted:
                return @"COMPLETED";
            case AWSPinpointTargetingJobStatusFailing:
                return @"FAILING";
            case AWSPinpointTargetingJobStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingImportJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingImportJobResponse class]];
}

@end

@implementation AWSPinpointTargetingMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"body" : @"Body",
             @"imageIconUrl" : @"ImageIconUrl",
             @"imageUrl" : @"ImageUrl",
             @"jsonBody" : @"JsonBody",
             @"mediaUrl" : @"MediaUrl",
             @"silentPush" : @"SilentPush",
             @"title" : @"Title",
             @"url" : @"Url",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OPEN_APP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionOpenApp);
        }
        if ([value caseInsensitiveCompare:@"DEEP_LINK"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionDeepLink);
        }
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionUrl);
        }
        return @(AWSPinpointTargetingActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingActionOpenApp:
                return @"OPEN_APP";
            case AWSPinpointTargetingActionDeepLink:
                return @"DEEP_LINK";
            case AWSPinpointTargetingActionUrl:
                return @"URL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingMessageBody

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"requestID" : @"RequestID",
             };
}

@end

@implementation AWSPinpointTargetingMessageConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSMessage" : @"APNSMessage",
             @"defaultMessage" : @"DefaultMessage",
             @"GCMMessage" : @"GCMMessage",
             };
}

+ (NSValueTransformer *)APNSMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessage class]];
}

+ (NSValueTransformer *)defaultMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessage class]];
}

+ (NSValueTransformer *)GCMMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessage class]];
}

@end

@implementation AWSPinpointTargetingQuietTime

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"end" : @"End",
             @"start" : @"Start",
             };
}

@end

@implementation AWSPinpointTargetingRecencyDimension

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"duration" : @"Duration",
             @"recencyType" : @"RecencyType",
             };
}

+ (NSValueTransformer *)durationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HR_24"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDurationHr24);
        }
        if ([value caseInsensitiveCompare:@"DAY_7"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDurationDay7);
        }
        if ([value caseInsensitiveCompare:@"DAY_14"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDurationDay14);
        }
        if ([value caseInsensitiveCompare:@"DAY_30"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDurationDay30);
        }
        return @(AWSPinpointTargetingDurationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingDurationHr24:
                return @"HR_24";
            case AWSPinpointTargetingDurationDay7:
                return @"DAY_7";
            case AWSPinpointTargetingDurationDay14:
                return @"DAY_14";
            case AWSPinpointTargetingDurationDay30:
                return @"DAY_30";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)recencyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingRecencyTypeActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingRecencyTypeInactive);
        }
        return @(AWSPinpointTargetingRecencyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingRecencyTypeActive:
                return @"ACTIVE";
            case AWSPinpointTargetingRecencyTypeInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingSchedule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"EndTime",
             @"frequency" : @"Frequency",
             @"isLocalTime" : @"IsLocalTime",
             @"quietTime" : @"QuietTime",
             @"startTime" : @"StartTime",
             @"timezone" : @"Timezone",
             };
}

+ (NSValueTransformer *)frequencyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONCE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFrequencyOnce);
        }
        if ([value caseInsensitiveCompare:@"HOURLY"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFrequencyHourly);
        }
        if ([value caseInsensitiveCompare:@"DAILY"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFrequencyDaily);
        }
        if ([value caseInsensitiveCompare:@"WEEKLY"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFrequencyWeekly);
        }
        if ([value caseInsensitiveCompare:@"MONTHLY"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFrequencyMonthly);
        }
        return @(AWSPinpointTargetingFrequencyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingFrequencyOnce:
                return @"ONCE";
            case AWSPinpointTargetingFrequencyHourly:
                return @"HOURLY";
            case AWSPinpointTargetingFrequencyDaily:
                return @"DAILY";
            case AWSPinpointTargetingFrequencyWeekly:
                return @"WEEKLY";
            case AWSPinpointTargetingFrequencyMonthly:
                return @"MONTHLY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)quietTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingQuietTime class]];
}

@end

@implementation AWSPinpointTargetingSegmentBehaviors

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recency" : @"Recency",
             };
}

+ (NSValueTransformer *)recencyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingRecencyDimension class]];
}

@end

@implementation AWSPinpointTargetingSegmentDemographics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appVersion" : @"AppVersion",
             @"deviceType" : @"DeviceType",
             @"make" : @"Make",
             @"model" : @"Model",
             @"platform" : @"Platform",
             };
}

+ (NSValueTransformer *)appVersionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSetDimension class]];
}

+ (NSValueTransformer *)deviceTypeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSetDimension class]];
}

+ (NSValueTransformer *)makeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSetDimension class]];
}

+ (NSValueTransformer *)modelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSetDimension class]];
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSetDimension class]];
}

@end

@implementation AWSPinpointTargetingSegmentDimensions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"behavior" : @"Behavior",
             @"demographic" : @"Demographic",
             @"location" : @"Location",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointTargetingAttributeDimension class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)behaviorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentBehaviors class]];
}

+ (NSValueTransformer *)demographicJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentDemographics class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentLocation class]];
}

@end

@implementation AWSPinpointTargetingSegmentImportResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"externalId" : @"ExternalId",
             @"format" : @"Format",
             @"roleArn" : @"RoleArn",
             @"s3Url" : @"S3Url",
             @"size" : @"Size",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CSV"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFormatCsv);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFormatJson);
        }
        return @(AWSPinpointTargetingFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingFormatCsv:
                return @"CSV";
            case AWSPinpointTargetingFormatJson:
                return @"JSON";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingSegmentLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"country" : @"Country",
             };
}

+ (NSValueTransformer *)countryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSetDimension class]];
}

@end

@implementation AWSPinpointTargetingSegmentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"dimensions" : @"Dimensions",
             @"identifier" : @"Id",
             @"importDefinition" : @"ImportDefinition",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"name" : @"Name",
             @"segmentType" : @"SegmentType",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentDimensions class]];
}

+ (NSValueTransformer *)importDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentImportResource class]];
}

+ (NSValueTransformer *)segmentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DIMENSIONAL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingSegmentTypeDimensional);
        }
        if ([value caseInsensitiveCompare:@"IMPORT"] == NSOrderedSame) {
            return @(AWSPinpointTargetingSegmentTypeImport);
        }
        return @(AWSPinpointTargetingSegmentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingSegmentTypeDimensional:
                return @"DIMENSIONAL";
            case AWSPinpointTargetingSegmentTypeImport:
                return @"IMPORT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingSegmentsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingSegmentResponse class]];
}

@end

@implementation AWSPinpointTargetingSetDimension

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensionType" : @"DimensionType",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)dimensionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUSIVE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDimensionTypeInclusive);
        }
        if ([value caseInsensitiveCompare:@"EXCLUSIVE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDimensionTypeExclusive);
        }
        return @(AWSPinpointTargetingDimensionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingDimensionTypeInclusive:
                return @"INCLUSIVE";
            case AWSPinpointTargetingDimensionTypeExclusive:
                return @"EXCLUSIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingTreatmentResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"messageConfiguration" : @"MessageConfiguration",
             @"schedule" : @"Schedule",
             @"sizePercent" : @"SizePercent",
             @"state" : @"State",
             @"treatmentDescription" : @"TreatmentDescription",
             @"treatmentName" : @"TreatmentName",
             };
}

+ (NSValueTransformer *)messageConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageConfiguration class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSchedule class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignState class]];
}

@end

@implementation AWSPinpointTargetingUpdateApnsChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSChannelRequest" : @"APNSChannelRequest",
             @"applicationId" : @"ApplicationId",
             };
}

+ (NSValueTransformer *)APNSChannelRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAPNSChannelRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateApnsChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSChannelResponse" : @"APNSChannelResponse",
             };
}

+ (NSValueTransformer *)APNSChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAPNSChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingUpdateApplicationSettingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"writeApplicationSettingsRequest" : @"WriteApplicationSettingsRequest",
             };
}

+ (NSValueTransformer *)writeApplicationSettingsRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingWriteApplicationSettingsRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateApplicationSettingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationSettingsResource" : @"ApplicationSettingsResource",
             };
}

+ (NSValueTransformer *)applicationSettingsResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingApplicationSettingsResource class]];
}

@end

@implementation AWSPinpointTargetingUpdateCampaignRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             @"writeCampaignRequest" : @"WriteCampaignRequest",
             };
}

+ (NSValueTransformer *)writeCampaignRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingWriteCampaignRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateCampaignResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignResponse" : @"CampaignResponse",
             };
}

+ (NSValueTransformer *)campaignResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignResponse class]];
}

@end

@implementation AWSPinpointTargetingUpdateEndpointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"endpointId" : @"EndpointId",
             @"endpointRequest" : @"EndpointRequest",
             };
}

+ (NSValueTransformer *)endpointRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateEndpointResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageBody" : @"MessageBody",
             };
}

+ (NSValueTransformer *)messageBodyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageBody class]];
}

@end

@implementation AWSPinpointTargetingUpdateEndpointsBatchRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"endpointBatchRequest" : @"EndpointBatchRequest",
             };
}

+ (NSValueTransformer *)endpointBatchRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointBatchRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateEndpointsBatchResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageBody" : @"MessageBody",
             };
}

+ (NSValueTransformer *)messageBodyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageBody class]];
}

@end

@implementation AWSPinpointTargetingUpdateGcmChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"GCMChannelRequest" : @"GCMChannelRequest",
             };
}

+ (NSValueTransformer *)GCMChannelRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingGCMChannelRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateGcmChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"GCMChannelResponse" : @"GCMChannelResponse",
             };
}

+ (NSValueTransformer *)GCMChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingGCMChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingUpdateSegmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"segmentId" : @"SegmentId",
             @"writeSegmentRequest" : @"WriteSegmentRequest",
             };
}

+ (NSValueTransformer *)writeSegmentRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingWriteSegmentRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateSegmentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentResponse" : @"SegmentResponse",
             };
}

+ (NSValueTransformer *)segmentResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentResponse class]];
}

@end

@implementation AWSPinpointTargetingWriteApplicationSettingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limits" : @"Limits",
             @"quietTime" : @"QuietTime",
             };
}

+ (NSValueTransformer *)limitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignLimits class]];
}

+ (NSValueTransformer *)quietTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingQuietTime class]];
}

@end

@implementation AWSPinpointTargetingWriteCampaignRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalTreatments" : @"AdditionalTreatments",
             @"detail" : @"Description",
             @"holdoutPercent" : @"HoldoutPercent",
             @"isPaused" : @"IsPaused",
             @"limits" : @"Limits",
             @"messageConfiguration" : @"MessageConfiguration",
             @"name" : @"Name",
             @"schedule" : @"Schedule",
             @"segmentId" : @"SegmentId",
             @"segmentVersion" : @"SegmentVersion",
             @"treatmentDescription" : @"TreatmentDescription",
             @"treatmentName" : @"TreatmentName",
             };
}

+ (NSValueTransformer *)additionalTreatmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingWriteTreatmentResource class]];
}

+ (NSValueTransformer *)limitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignLimits class]];
}

+ (NSValueTransformer *)messageConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageConfiguration class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSchedule class]];
}

@end

@implementation AWSPinpointTargetingWriteSegmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensions" : @"Dimensions",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentDimensions class]];
}

@end

@implementation AWSPinpointTargetingWriteTreatmentResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageConfiguration" : @"MessageConfiguration",
             @"schedule" : @"Schedule",
             @"sizePercent" : @"SizePercent",
             @"treatmentDescription" : @"TreatmentDescription",
             @"treatmentName" : @"TreatmentName",
             };
}

+ (NSValueTransformer *)messageConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageConfiguration class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSchedule class]];
}

@end
