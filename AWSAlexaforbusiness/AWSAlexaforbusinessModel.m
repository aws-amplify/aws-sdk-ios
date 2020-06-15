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

#import "AWSAlexaforbusinessModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSAlexaforbusinessErrorDomain = @"com.amazonaws.AWSAlexaforbusinessErrorDomain";

@implementation AWSAlexaforbusinessAddressBook

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressBookArn" : @"AddressBookArn",
             @"detail" : @"Description",
             @"name" : @"Name",
             };
}

@end

@implementation AWSAlexaforbusinessAddressBookData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressBookArn" : @"AddressBookArn",
             @"detail" : @"Description",
             @"name" : @"Name",
             };
}

@end

@implementation AWSAlexaforbusinessApproveSkillRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"skillId" : @"SkillId",
             };
}

@end

@implementation AWSAlexaforbusinessApproveSkillResponse

@end

@implementation AWSAlexaforbusinessAssociateContactWithAddressBookRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressBookArn" : @"AddressBookArn",
             @"contactArn" : @"ContactArn",
             };
}

@end

@implementation AWSAlexaforbusinessAssociateContactWithAddressBookResponse

@end

@implementation AWSAlexaforbusinessAssociateDeviceWithNetworkProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceArn" : @"DeviceArn",
             @"networkProfileArn" : @"NetworkProfileArn",
             };
}

@end

@implementation AWSAlexaforbusinessAssociateDeviceWithNetworkProfileResponse

@end

@implementation AWSAlexaforbusinessAssociateDeviceWithRoomRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceArn" : @"DeviceArn",
             @"roomArn" : @"RoomArn",
             };
}

@end

@implementation AWSAlexaforbusinessAssociateDeviceWithRoomResponse

@end

@implementation AWSAlexaforbusinessAssociateSkillGroupWithRoomRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roomArn" : @"RoomArn",
             @"skillGroupArn" : @"SkillGroupArn",
             };
}

@end

@implementation AWSAlexaforbusinessAssociateSkillGroupWithRoomResponse

@end

@implementation AWSAlexaforbusinessAssociateSkillWithSkillGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"skillGroupArn" : @"SkillGroupArn",
             @"skillId" : @"SkillId",
             };
}

@end

@implementation AWSAlexaforbusinessAssociateSkillWithSkillGroupResponse

@end

@implementation AWSAlexaforbusinessAssociateSkillWithUsersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"skillId" : @"SkillId",
             };
}

@end

@implementation AWSAlexaforbusinessAssociateSkillWithUsersResponse

@end

@implementation AWSAlexaforbusinessAudio

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"locale" : @"Locale",
             @"location" : @"Location",
             };
}

+ (NSValueTransformer *)localeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessLocaleEnUS);
        }
        return @(AWSAlexaforbusinessLocaleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessLocaleEnUS:
                return @"en-US";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessBusinessReport

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryTime" : @"DeliveryTime",
             @"downloadUrl" : @"DownloadUrl",
             @"failureCode" : @"FailureCode",
             @"s3Location" : @"S3Location",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)deliveryTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)failureCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACCESS_DENIED"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessBusinessReportFailureCodeAccessDenied);
        }
        if ([value caseInsensitiveCompare:@"NO_SUCH_BUCKET"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessBusinessReportFailureCodeNoSuchBucket);
        }
        if ([value caseInsensitiveCompare:@"INTERNAL_FAILURE"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessBusinessReportFailureCodeInternalFailure);
        }
        return @(AWSAlexaforbusinessBusinessReportFailureCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessBusinessReportFailureCodeAccessDenied:
                return @"ACCESS_DENIED";
            case AWSAlexaforbusinessBusinessReportFailureCodeNoSuchBucket:
                return @"NO_SUCH_BUCKET";
            case AWSAlexaforbusinessBusinessReportFailureCodeInternalFailure:
                return @"INTERNAL_FAILURE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3LocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessBusinessReportS3Location class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessBusinessReportStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessBusinessReportStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessBusinessReportStatusFailed);
        }
        return @(AWSAlexaforbusinessBusinessReportStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessBusinessReportStatusRunning:
                return @"RUNNING";
            case AWSAlexaforbusinessBusinessReportStatusSucceeded:
                return @"SUCCEEDED";
            case AWSAlexaforbusinessBusinessReportStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessBusinessReportContentRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"interval" : @"Interval",
             };
}

+ (NSValueTransformer *)intervalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONE_DAY"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessBusinessReportIntervalOneDay);
        }
        if ([value caseInsensitiveCompare:@"ONE_WEEK"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessBusinessReportIntervalOneWeek);
        }
        if ([value caseInsensitiveCompare:@"THIRTY_DAYS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessBusinessReportIntervalThirtyDays);
        }
        return @(AWSAlexaforbusinessBusinessReportIntervalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessBusinessReportIntervalOneDay:
                return @"ONE_DAY";
            case AWSAlexaforbusinessBusinessReportIntervalOneWeek:
                return @"ONE_WEEK";
            case AWSAlexaforbusinessBusinessReportIntervalThirtyDays:
                return @"THIRTY_DAYS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessBusinessReportRecurrence

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"startDate" : @"StartDate",
             };
}

@end

@implementation AWSAlexaforbusinessBusinessReportS3Location

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketName" : @"BucketName",
             @"path" : @"Path",
             };
}

@end

@implementation AWSAlexaforbusinessBusinessReportSchedule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentRange" : @"ContentRange",
             @"format" : @"Format",
             @"lastBusinessReport" : @"LastBusinessReport",
             @"recurrence" : @"Recurrence",
             @"s3BucketName" : @"S3BucketName",
             @"s3KeyPrefix" : @"S3KeyPrefix",
             @"scheduleArn" : @"ScheduleArn",
             @"scheduleName" : @"ScheduleName",
             };
}

+ (NSValueTransformer *)contentRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessBusinessReportContentRange class]];
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CSV"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessBusinessReportFormatCsv);
        }
        if ([value caseInsensitiveCompare:@"CSV_ZIP"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessBusinessReportFormatCsvZip);
        }
        return @(AWSAlexaforbusinessBusinessReportFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessBusinessReportFormatCsv:
                return @"CSV";
            case AWSAlexaforbusinessBusinessReportFormatCsvZip:
                return @"CSV_ZIP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastBusinessReportJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessBusinessReport class]];
}

+ (NSValueTransformer *)recurrenceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessBusinessReportRecurrence class]];
}

@end

@implementation AWSAlexaforbusinessCategory

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"categoryId" : @"CategoryId",
             @"categoryName" : @"CategoryName",
             };
}

@end

@implementation AWSAlexaforbusinessConferencePreference

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultConferenceProviderArn" : @"DefaultConferenceProviderArn",
             };
}

@end

@implementation AWSAlexaforbusinessConferenceProvider

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"IPDialIn" : @"IPDialIn",
             @"meetingSetting" : @"MeetingSetting",
             @"name" : @"Name",
             @"PSTNDialIn" : @"PSTNDialIn",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)IPDialInJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessIPDialIn class]];
}

+ (NSValueTransformer *)meetingSettingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessMeetingSetting class]];
}

+ (NSValueTransformer *)PSTNDialInJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessPSTNDialIn class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CHIME"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeChime);
        }
        if ([value caseInsensitiveCompare:@"BLUEJEANS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeBluejeans);
        }
        if ([value caseInsensitiveCompare:@"FUZE"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeFuze);
        }
        if ([value caseInsensitiveCompare:@"GOOGLE_HANGOUTS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeGoogleHangouts);
        }
        if ([value caseInsensitiveCompare:@"POLYCOM"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypePolycom);
        }
        if ([value caseInsensitiveCompare:@"RINGCENTRAL"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeRingcentral);
        }
        if ([value caseInsensitiveCompare:@"SKYPE_FOR_BUSINESS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeSkypeForBusiness);
        }
        if ([value caseInsensitiveCompare:@"WEBEX"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeWebex);
        }
        if ([value caseInsensitiveCompare:@"ZOOM"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeZoom);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeCustom);
        }
        return @(AWSAlexaforbusinessConferenceProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessConferenceProviderTypeChime:
                return @"CHIME";
            case AWSAlexaforbusinessConferenceProviderTypeBluejeans:
                return @"BLUEJEANS";
            case AWSAlexaforbusinessConferenceProviderTypeFuze:
                return @"FUZE";
            case AWSAlexaforbusinessConferenceProviderTypeGoogleHangouts:
                return @"GOOGLE_HANGOUTS";
            case AWSAlexaforbusinessConferenceProviderTypePolycom:
                return @"POLYCOM";
            case AWSAlexaforbusinessConferenceProviderTypeRingcentral:
                return @"RINGCENTRAL";
            case AWSAlexaforbusinessConferenceProviderTypeSkypeForBusiness:
                return @"SKYPE_FOR_BUSINESS";
            case AWSAlexaforbusinessConferenceProviderTypeWebex:
                return @"WEBEX";
            case AWSAlexaforbusinessConferenceProviderTypeZoom:
                return @"ZOOM";
            case AWSAlexaforbusinessConferenceProviderTypeCustom:
                return @"CUSTOM";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessContact

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactArn" : @"ContactArn",
             @"displayName" : @"DisplayName",
             @"firstName" : @"FirstName",
             @"lastName" : @"LastName",
             @"phoneNumber" : @"PhoneNumber",
             @"phoneNumbers" : @"PhoneNumbers",
             @"sipAddresses" : @"SipAddresses",
             };
}

+ (NSValueTransformer *)phoneNumbersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessPhoneNumber class]];
}

+ (NSValueTransformer *)sipAddressesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessSipAddress class]];
}

@end

@implementation AWSAlexaforbusinessContactData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactArn" : @"ContactArn",
             @"displayName" : @"DisplayName",
             @"firstName" : @"FirstName",
             @"lastName" : @"LastName",
             @"phoneNumber" : @"PhoneNumber",
             @"phoneNumbers" : @"PhoneNumbers",
             @"sipAddresses" : @"SipAddresses",
             };
}

+ (NSValueTransformer *)phoneNumbersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessPhoneNumber class]];
}

+ (NSValueTransformer *)sipAddressesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessSipAddress class]];
}

@end

@implementation AWSAlexaforbusinessContent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioList" : @"AudioList",
             @"ssmlList" : @"SsmlList",
             @"textList" : @"TextList",
             };
}

+ (NSValueTransformer *)audioListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessAudio class]];
}

+ (NSValueTransformer *)ssmlListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessSsml class]];
}

+ (NSValueTransformer *)textListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessText class]];
}

@end

@implementation AWSAlexaforbusinessCreateAddressBookRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"detail" : @"Description",
             @"name" : @"Name",
             };
}

@end

@implementation AWSAlexaforbusinessCreateAddressBookResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressBookArn" : @"AddressBookArn",
             };
}

@end

@implementation AWSAlexaforbusinessCreateBusinessReportScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"contentRange" : @"ContentRange",
             @"format" : @"Format",
             @"recurrence" : @"Recurrence",
             @"s3BucketName" : @"S3BucketName",
             @"s3KeyPrefix" : @"S3KeyPrefix",
             @"scheduleName" : @"ScheduleName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)contentRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessBusinessReportContentRange class]];
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CSV"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessBusinessReportFormatCsv);
        }
        if ([value caseInsensitiveCompare:@"CSV_ZIP"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessBusinessReportFormatCsvZip);
        }
        return @(AWSAlexaforbusinessBusinessReportFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessBusinessReportFormatCsv:
                return @"CSV";
            case AWSAlexaforbusinessBusinessReportFormatCsvZip:
                return @"CSV_ZIP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)recurrenceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessBusinessReportRecurrence class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessTag class]];
}

@end

@implementation AWSAlexaforbusinessCreateBusinessReportScheduleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduleArn" : @"ScheduleArn",
             };
}

@end

@implementation AWSAlexaforbusinessCreateConferenceProviderRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"conferenceProviderName" : @"ConferenceProviderName",
             @"conferenceProviderType" : @"ConferenceProviderType",
             @"IPDialIn" : @"IPDialIn",
             @"meetingSetting" : @"MeetingSetting",
             @"PSTNDialIn" : @"PSTNDialIn",
             };
}

+ (NSValueTransformer *)conferenceProviderTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CHIME"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeChime);
        }
        if ([value caseInsensitiveCompare:@"BLUEJEANS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeBluejeans);
        }
        if ([value caseInsensitiveCompare:@"FUZE"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeFuze);
        }
        if ([value caseInsensitiveCompare:@"GOOGLE_HANGOUTS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeGoogleHangouts);
        }
        if ([value caseInsensitiveCompare:@"POLYCOM"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypePolycom);
        }
        if ([value caseInsensitiveCompare:@"RINGCENTRAL"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeRingcentral);
        }
        if ([value caseInsensitiveCompare:@"SKYPE_FOR_BUSINESS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeSkypeForBusiness);
        }
        if ([value caseInsensitiveCompare:@"WEBEX"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeWebex);
        }
        if ([value caseInsensitiveCompare:@"ZOOM"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeZoom);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeCustom);
        }
        return @(AWSAlexaforbusinessConferenceProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessConferenceProviderTypeChime:
                return @"CHIME";
            case AWSAlexaforbusinessConferenceProviderTypeBluejeans:
                return @"BLUEJEANS";
            case AWSAlexaforbusinessConferenceProviderTypeFuze:
                return @"FUZE";
            case AWSAlexaforbusinessConferenceProviderTypeGoogleHangouts:
                return @"GOOGLE_HANGOUTS";
            case AWSAlexaforbusinessConferenceProviderTypePolycom:
                return @"POLYCOM";
            case AWSAlexaforbusinessConferenceProviderTypeRingcentral:
                return @"RINGCENTRAL";
            case AWSAlexaforbusinessConferenceProviderTypeSkypeForBusiness:
                return @"SKYPE_FOR_BUSINESS";
            case AWSAlexaforbusinessConferenceProviderTypeWebex:
                return @"WEBEX";
            case AWSAlexaforbusinessConferenceProviderTypeZoom:
                return @"ZOOM";
            case AWSAlexaforbusinessConferenceProviderTypeCustom:
                return @"CUSTOM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)IPDialInJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessIPDialIn class]];
}

+ (NSValueTransformer *)meetingSettingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessMeetingSetting class]];
}

+ (NSValueTransformer *)PSTNDialInJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessPSTNDialIn class]];
}

@end

@implementation AWSAlexaforbusinessCreateConferenceProviderResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conferenceProviderArn" : @"ConferenceProviderArn",
             };
}

@end

@implementation AWSAlexaforbusinessCreateContactRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"displayName" : @"DisplayName",
             @"firstName" : @"FirstName",
             @"lastName" : @"LastName",
             @"phoneNumber" : @"PhoneNumber",
             @"phoneNumbers" : @"PhoneNumbers",
             @"sipAddresses" : @"SipAddresses",
             };
}

+ (NSValueTransformer *)phoneNumbersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessPhoneNumber class]];
}

+ (NSValueTransformer *)sipAddressesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessSipAddress class]];
}

@end

@implementation AWSAlexaforbusinessCreateContactResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactArn" : @"ContactArn",
             };
}

@end

@implementation AWSAlexaforbusinessCreateEndOfMeetingReminder

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"reminderAtMinutes" : @"ReminderAtMinutes",
             @"reminderType" : @"ReminderType",
             };
}

+ (NSValueTransformer *)reminderTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ANNOUNCEMENT_TIME_CHECK"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessEndOfMeetingReminderTypeAnnouncementTimeCheck);
        }
        if ([value caseInsensitiveCompare:@"ANNOUNCEMENT_VARIABLE_TIME_LEFT"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessEndOfMeetingReminderTypeAnnouncementVariableTimeLeft);
        }
        if ([value caseInsensitiveCompare:@"CHIME"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessEndOfMeetingReminderTypeChime);
        }
        if ([value caseInsensitiveCompare:@"KNOCK"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessEndOfMeetingReminderTypeKnock);
        }
        return @(AWSAlexaforbusinessEndOfMeetingReminderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessEndOfMeetingReminderTypeAnnouncementTimeCheck:
                return @"ANNOUNCEMENT_TIME_CHECK";
            case AWSAlexaforbusinessEndOfMeetingReminderTypeAnnouncementVariableTimeLeft:
                return @"ANNOUNCEMENT_VARIABLE_TIME_LEFT";
            case AWSAlexaforbusinessEndOfMeetingReminderTypeChime:
                return @"CHIME";
            case AWSAlexaforbusinessEndOfMeetingReminderTypeKnock:
                return @"KNOCK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessCreateGatewayGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"detail" : @"Description",
             @"name" : @"Name",
             };
}

@end

@implementation AWSAlexaforbusinessCreateGatewayGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayGroupArn" : @"GatewayGroupArn",
             };
}

@end

@implementation AWSAlexaforbusinessCreateInstantBooking

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInMinutes" : @"DurationInMinutes",
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSAlexaforbusinessCreateMeetingRoomConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endOfMeetingReminder" : @"EndOfMeetingReminder",
             @"instantBooking" : @"InstantBooking",
             @"requireCheckIn" : @"RequireCheckIn",
             @"roomUtilizationMetricsEnabled" : @"RoomUtilizationMetricsEnabled",
             };
}

+ (NSValueTransformer *)endOfMeetingReminderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessCreateEndOfMeetingReminder class]];
}

+ (NSValueTransformer *)instantBookingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessCreateInstantBooking class]];
}

+ (NSValueTransformer *)requireCheckInJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessCreateRequireCheckIn class]];
}

@end

@implementation AWSAlexaforbusinessCreateNetworkProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateAuthorityArn" : @"CertificateAuthorityArn",
             @"clientRequestToken" : @"ClientRequestToken",
             @"currentPassword" : @"CurrentPassword",
             @"detail" : @"Description",
             @"eapMethod" : @"EapMethod",
             @"networkProfileName" : @"NetworkProfileName",
             @"nextPassword" : @"NextPassword",
             @"securityType" : @"SecurityType",
             @"ssid" : @"Ssid",
             @"trustAnchors" : @"TrustAnchors",
             };
}

+ (NSValueTransformer *)eapMethodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EAP_TLS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessNetworkEapMethodEapTls);
        }
        return @(AWSAlexaforbusinessNetworkEapMethodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessNetworkEapMethodEapTls:
                return @"EAP_TLS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)securityTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OPEN"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessNetworkSecurityTypeOpen);
        }
        if ([value caseInsensitiveCompare:@"WEP"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessNetworkSecurityTypeWep);
        }
        if ([value caseInsensitiveCompare:@"WPA_PSK"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessNetworkSecurityTypeWpaPsk);
        }
        if ([value caseInsensitiveCompare:@"WPA2_PSK"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessNetworkSecurityTypeWpa2Psk);
        }
        if ([value caseInsensitiveCompare:@"WPA2_ENTERPRISE"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessNetworkSecurityTypeWpa2Enterprise);
        }
        return @(AWSAlexaforbusinessNetworkSecurityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessNetworkSecurityTypeOpen:
                return @"OPEN";
            case AWSAlexaforbusinessNetworkSecurityTypeWep:
                return @"WEP";
            case AWSAlexaforbusinessNetworkSecurityTypeWpaPsk:
                return @"WPA_PSK";
            case AWSAlexaforbusinessNetworkSecurityTypeWpa2Psk:
                return @"WPA2_PSK";
            case AWSAlexaforbusinessNetworkSecurityTypeWpa2Enterprise:
                return @"WPA2_ENTERPRISE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessCreateNetworkProfileResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"networkProfileArn" : @"NetworkProfileArn",
             };
}

@end

@implementation AWSAlexaforbusinessCreateProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"clientRequestToken" : @"ClientRequestToken",
             @"distanceUnit" : @"DistanceUnit",
             @"locale" : @"Locale",
             @"maxVolumeLimit" : @"MaxVolumeLimit",
             @"meetingRoomConfiguration" : @"MeetingRoomConfiguration",
             @"PSTNEnabled" : @"PSTNEnabled",
             @"profileName" : @"ProfileName",
             @"setupModeDisabled" : @"SetupModeDisabled",
             @"tags" : @"Tags",
             @"temperatureUnit" : @"TemperatureUnit",
             @"timezone" : @"Timezone",
             @"wakeWord" : @"WakeWord",
             };
}

+ (NSValueTransformer *)distanceUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"METRIC"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDistanceUnitMetric);
        }
        if ([value caseInsensitiveCompare:@"IMPERIAL"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDistanceUnitImperial);
        }
        return @(AWSAlexaforbusinessDistanceUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessDistanceUnitMetric:
                return @"METRIC";
            case AWSAlexaforbusinessDistanceUnitImperial:
                return @"IMPERIAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)meetingRoomConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessCreateMeetingRoomConfiguration class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessTag class]];
}

+ (NSValueTransformer *)temperatureUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FAHRENHEIT"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessTemperatureUnitFahrenheit);
        }
        if ([value caseInsensitiveCompare:@"CELSIUS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessTemperatureUnitCelsius);
        }
        return @(AWSAlexaforbusinessTemperatureUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessTemperatureUnitFahrenheit:
                return @"FAHRENHEIT";
            case AWSAlexaforbusinessTemperatureUnitCelsius:
                return @"CELSIUS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)wakeWordJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALEXA"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessWakeWordAlexa);
        }
        if ([value caseInsensitiveCompare:@"AMAZON"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessWakeWordAmazon);
        }
        if ([value caseInsensitiveCompare:@"ECHO"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessWakeWordEcho);
        }
        if ([value caseInsensitiveCompare:@"COMPUTER"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessWakeWordComputer);
        }
        return @(AWSAlexaforbusinessWakeWordUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessWakeWordAlexa:
                return @"ALEXA";
            case AWSAlexaforbusinessWakeWordAmazon:
                return @"AMAZON";
            case AWSAlexaforbusinessWakeWordEcho:
                return @"ECHO";
            case AWSAlexaforbusinessWakeWordComputer:
                return @"COMPUTER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessCreateProfileResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"profileArn" : @"ProfileArn",
             };
}

@end

@implementation AWSAlexaforbusinessCreateRequireCheckIn

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"releaseAfterMinutes" : @"ReleaseAfterMinutes",
             };
}

@end

@implementation AWSAlexaforbusinessCreateRoomRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"detail" : @"Description",
             @"profileArn" : @"ProfileArn",
             @"providerCalendarId" : @"ProviderCalendarId",
             @"roomName" : @"RoomName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessTag class]];
}

@end

@implementation AWSAlexaforbusinessCreateRoomResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roomArn" : @"RoomArn",
             };
}

@end

@implementation AWSAlexaforbusinessCreateSkillGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"detail" : @"Description",
             @"skillGroupName" : @"SkillGroupName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessTag class]];
}

@end

@implementation AWSAlexaforbusinessCreateSkillGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"skillGroupArn" : @"SkillGroupArn",
             };
}

@end

@implementation AWSAlexaforbusinessCreateUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"email" : @"Email",
             @"firstName" : @"FirstName",
             @"lastName" : @"LastName",
             @"tags" : @"Tags",
             @"userId" : @"UserId",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessTag class]];
}

@end

@implementation AWSAlexaforbusinessCreateUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userArn" : @"UserArn",
             };
}

@end

@implementation AWSAlexaforbusinessDeleteAddressBookRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressBookArn" : @"AddressBookArn",
             };
}

@end

@implementation AWSAlexaforbusinessDeleteAddressBookResponse

@end

@implementation AWSAlexaforbusinessDeleteBusinessReportScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduleArn" : @"ScheduleArn",
             };
}

@end

@implementation AWSAlexaforbusinessDeleteBusinessReportScheduleResponse

@end

@implementation AWSAlexaforbusinessDeleteConferenceProviderRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conferenceProviderArn" : @"ConferenceProviderArn",
             };
}

@end

@implementation AWSAlexaforbusinessDeleteConferenceProviderResponse

@end

@implementation AWSAlexaforbusinessDeleteContactRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactArn" : @"ContactArn",
             };
}

@end

@implementation AWSAlexaforbusinessDeleteContactResponse

@end

@implementation AWSAlexaforbusinessDeleteDeviceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceArn" : @"DeviceArn",
             };
}

@end

@implementation AWSAlexaforbusinessDeleteDeviceResponse

@end

@implementation AWSAlexaforbusinessDeleteDeviceUsageDataRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceArn" : @"DeviceArn",
             @"deviceUsageType" : @"DeviceUsageType",
             };
}

+ (NSValueTransformer *)deviceUsageTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VOICE"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceUsageTypeVoice);
        }
        return @(AWSAlexaforbusinessDeviceUsageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessDeviceUsageTypeVoice:
                return @"VOICE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessDeleteDeviceUsageDataResponse

@end

@implementation AWSAlexaforbusinessDeleteGatewayGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayGroupArn" : @"GatewayGroupArn",
             };
}

@end

@implementation AWSAlexaforbusinessDeleteGatewayGroupResponse

@end

@implementation AWSAlexaforbusinessDeleteNetworkProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"networkProfileArn" : @"NetworkProfileArn",
             };
}

@end

@implementation AWSAlexaforbusinessDeleteNetworkProfileResponse

@end

@implementation AWSAlexaforbusinessDeleteProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"profileArn" : @"ProfileArn",
             };
}

@end

@implementation AWSAlexaforbusinessDeleteProfileResponse

@end

@implementation AWSAlexaforbusinessDeleteRoomRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roomArn" : @"RoomArn",
             };
}

@end

@implementation AWSAlexaforbusinessDeleteRoomResponse

@end

@implementation AWSAlexaforbusinessDeleteRoomSkillParameterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameterKey" : @"ParameterKey",
             @"roomArn" : @"RoomArn",
             @"skillId" : @"SkillId",
             };
}

@end

@implementation AWSAlexaforbusinessDeleteRoomSkillParameterResponse

@end

@implementation AWSAlexaforbusinessDeleteSkillAuthorizationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roomArn" : @"RoomArn",
             @"skillId" : @"SkillId",
             };
}

@end

@implementation AWSAlexaforbusinessDeleteSkillAuthorizationResponse

@end

@implementation AWSAlexaforbusinessDeleteSkillGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"skillGroupArn" : @"SkillGroupArn",
             };
}

@end

@implementation AWSAlexaforbusinessDeleteSkillGroupResponse

@end

@implementation AWSAlexaforbusinessDeleteUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enrollmentId" : @"EnrollmentId",
             @"userArn" : @"UserArn",
             };
}

@end

@implementation AWSAlexaforbusinessDeleteUserResponse

@end

@implementation AWSAlexaforbusinessDeveloperInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"developerName" : @"DeveloperName",
             @"email" : @"Email",
             @"privacyPolicy" : @"PrivacyPolicy",
             @"url" : @"Url",
             };
}

@end

@implementation AWSAlexaforbusinessDevice

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceArn" : @"DeviceArn",
             @"deviceName" : @"DeviceName",
             @"deviceSerialNumber" : @"DeviceSerialNumber",
             @"deviceStatus" : @"DeviceStatus",
             @"deviceStatusInfo" : @"DeviceStatusInfo",
             @"deviceType" : @"DeviceType",
             @"macAddress" : @"MacAddress",
             @"networkProfileInfo" : @"NetworkProfileInfo",
             @"roomArn" : @"RoomArn",
             @"softwareVersion" : @"SoftwareVersion",
             };
}

+ (NSValueTransformer *)deviceStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusReady);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusPending);
        }
        if ([value caseInsensitiveCompare:@"WAS_OFFLINE"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusWasOffline);
        }
        if ([value caseInsensitiveCompare:@"DEREGISTERED"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusDeregistered);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusFailed);
        }
        return @(AWSAlexaforbusinessDeviceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessDeviceStatusReady:
                return @"READY";
            case AWSAlexaforbusinessDeviceStatusPending:
                return @"PENDING";
            case AWSAlexaforbusinessDeviceStatusWasOffline:
                return @"WAS_OFFLINE";
            case AWSAlexaforbusinessDeviceStatusDeregistered:
                return @"DEREGISTERED";
            case AWSAlexaforbusinessDeviceStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)deviceStatusInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessDeviceStatusInfo class]];
}

+ (NSValueTransformer *)networkProfileInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessDeviceNetworkProfileInfo class]];
}

@end

@implementation AWSAlexaforbusinessDeviceData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdTime" : @"CreatedTime",
             @"deviceArn" : @"DeviceArn",
             @"deviceName" : @"DeviceName",
             @"deviceSerialNumber" : @"DeviceSerialNumber",
             @"deviceStatus" : @"DeviceStatus",
             @"deviceStatusInfo" : @"DeviceStatusInfo",
             @"deviceType" : @"DeviceType",
             @"macAddress" : @"MacAddress",
             @"networkProfileArn" : @"NetworkProfileArn",
             @"networkProfileName" : @"NetworkProfileName",
             @"roomArn" : @"RoomArn",
             @"roomName" : @"RoomName",
             @"softwareVersion" : @"SoftwareVersion",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)deviceStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusReady);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusPending);
        }
        if ([value caseInsensitiveCompare:@"WAS_OFFLINE"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusWasOffline);
        }
        if ([value caseInsensitiveCompare:@"DEREGISTERED"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusDeregistered);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusFailed);
        }
        return @(AWSAlexaforbusinessDeviceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessDeviceStatusReady:
                return @"READY";
            case AWSAlexaforbusinessDeviceStatusPending:
                return @"PENDING";
            case AWSAlexaforbusinessDeviceStatusWasOffline:
                return @"WAS_OFFLINE";
            case AWSAlexaforbusinessDeviceStatusDeregistered:
                return @"DEREGISTERED";
            case AWSAlexaforbusinessDeviceStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)deviceStatusInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessDeviceStatusInfo class]];
}

@end

@implementation AWSAlexaforbusinessDeviceEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"timestamp" : @"Timestamp",
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)timestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONNECTION_STATUS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceEventTypeConnectionStatus);
        }
        if ([value caseInsensitiveCompare:@"DEVICE_STATUS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceEventTypeDeviceStatus);
        }
        return @(AWSAlexaforbusinessDeviceEventTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessDeviceEventTypeConnectionStatus:
                return @"CONNECTION_STATUS";
            case AWSAlexaforbusinessDeviceEventTypeDeviceStatus:
                return @"DEVICE_STATUS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessDeviceNetworkProfileInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"CertificateArn",
             @"certificateExpirationTime" : @"CertificateExpirationTime",
             @"networkProfileArn" : @"NetworkProfileArn",
             };
}

+ (NSValueTransformer *)certificateExpirationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSAlexaforbusinessDeviceStatusDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"feature" : @"Feature",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEVICE_SOFTWARE_UPDATE_NEEDED"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusDetailCodeDeviceSoftwareUpdateNeeded);
        }
        if ([value caseInsensitiveCompare:@"DEVICE_WAS_OFFLINE"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusDetailCodeDeviceWasOffline);
        }
        if ([value caseInsensitiveCompare:@"CREDENTIALS_ACCESS_FAILURE"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusDetailCodeCredentialsAccessFailure);
        }
        if ([value caseInsensitiveCompare:@"TLS_VERSION_MISMATCH"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusDetailCodeTlsVersionMismatch);
        }
        if ([value caseInsensitiveCompare:@"ASSOCIATION_REJECTION"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusDetailCodeAssociationRejection);
        }
        if ([value caseInsensitiveCompare:@"AUTHENTICATION_FAILURE"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusDetailCodeAuthenticationFailure);
        }
        if ([value caseInsensitiveCompare:@"DHCP_FAILURE"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusDetailCodeDhcpFailure);
        }
        if ([value caseInsensitiveCompare:@"INTERNET_UNAVAILABLE"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusDetailCodeInternetUnavailable);
        }
        if ([value caseInsensitiveCompare:@"DNS_FAILURE"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusDetailCodeDnsFailure);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN_FAILURE"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusDetailCodeUnknownFailure);
        }
        if ([value caseInsensitiveCompare:@"CERTIFICATE_ISSUING_LIMIT_EXCEEDED"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusDetailCodeCertificateIssuingLimitExceeded);
        }
        if ([value caseInsensitiveCompare:@"INVALID_CERTIFICATE_AUTHORITY"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusDetailCodeInvalidCertificateAuthority);
        }
        if ([value caseInsensitiveCompare:@"NETWORK_PROFILE_NOT_FOUND"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusDetailCodeNetworkProfileNotFound);
        }
        if ([value caseInsensitiveCompare:@"INVALID_PASSWORD_STATE"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusDetailCodeInvalidPasswordState);
        }
        if ([value caseInsensitiveCompare:@"PASSWORD_NOT_FOUND"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusDetailCodePasswordNotFound);
        }
        if ([value caseInsensitiveCompare:@"PASSWORD_MANAGER_ACCESS_DENIED"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusDetailCodePasswordManagerAccessDenied);
        }
        if ([value caseInsensitiveCompare:@"CERTIFICATE_AUTHORITY_ACCESS_DENIED"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceStatusDetailCodeCertificateAuthorityAccessDenied);
        }
        return @(AWSAlexaforbusinessDeviceStatusDetailCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessDeviceStatusDetailCodeDeviceSoftwareUpdateNeeded:
                return @"DEVICE_SOFTWARE_UPDATE_NEEDED";
            case AWSAlexaforbusinessDeviceStatusDetailCodeDeviceWasOffline:
                return @"DEVICE_WAS_OFFLINE";
            case AWSAlexaforbusinessDeviceStatusDetailCodeCredentialsAccessFailure:
                return @"CREDENTIALS_ACCESS_FAILURE";
            case AWSAlexaforbusinessDeviceStatusDetailCodeTlsVersionMismatch:
                return @"TLS_VERSION_MISMATCH";
            case AWSAlexaforbusinessDeviceStatusDetailCodeAssociationRejection:
                return @"ASSOCIATION_REJECTION";
            case AWSAlexaforbusinessDeviceStatusDetailCodeAuthenticationFailure:
                return @"AUTHENTICATION_FAILURE";
            case AWSAlexaforbusinessDeviceStatusDetailCodeDhcpFailure:
                return @"DHCP_FAILURE";
            case AWSAlexaforbusinessDeviceStatusDetailCodeInternetUnavailable:
                return @"INTERNET_UNAVAILABLE";
            case AWSAlexaforbusinessDeviceStatusDetailCodeDnsFailure:
                return @"DNS_FAILURE";
            case AWSAlexaforbusinessDeviceStatusDetailCodeUnknownFailure:
                return @"UNKNOWN_FAILURE";
            case AWSAlexaforbusinessDeviceStatusDetailCodeCertificateIssuingLimitExceeded:
                return @"CERTIFICATE_ISSUING_LIMIT_EXCEEDED";
            case AWSAlexaforbusinessDeviceStatusDetailCodeInvalidCertificateAuthority:
                return @"INVALID_CERTIFICATE_AUTHORITY";
            case AWSAlexaforbusinessDeviceStatusDetailCodeNetworkProfileNotFound:
                return @"NETWORK_PROFILE_NOT_FOUND";
            case AWSAlexaforbusinessDeviceStatusDetailCodeInvalidPasswordState:
                return @"INVALID_PASSWORD_STATE";
            case AWSAlexaforbusinessDeviceStatusDetailCodePasswordNotFound:
                return @"PASSWORD_NOT_FOUND";
            case AWSAlexaforbusinessDeviceStatusDetailCodePasswordManagerAccessDenied:
                return @"PASSWORD_MANAGER_ACCESS_DENIED";
            case AWSAlexaforbusinessDeviceStatusDetailCodeCertificateAuthorityAccessDenied:
                return @"CERTIFICATE_AUTHORITY_ACCESS_DENIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)featureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLUETOOTH"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessFeatureBluetooth);
        }
        if ([value caseInsensitiveCompare:@"VOLUME"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessFeatureVolume);
        }
        if ([value caseInsensitiveCompare:@"NOTIFICATIONS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessFeatureNotifications);
        }
        if ([value caseInsensitiveCompare:@"LISTS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessFeatureLists);
        }
        if ([value caseInsensitiveCompare:@"SKILLS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessFeatureSkills);
        }
        if ([value caseInsensitiveCompare:@"NETWORK_PROFILE"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessFeatureNetworkProfile);
        }
        if ([value caseInsensitiveCompare:@"SETTINGS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessFeatureSettings);
        }
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessFeatureAll);
        }
        return @(AWSAlexaforbusinessFeatureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessFeatureBluetooth:
                return @"BLUETOOTH";
            case AWSAlexaforbusinessFeatureVolume:
                return @"VOLUME";
            case AWSAlexaforbusinessFeatureNotifications:
                return @"NOTIFICATIONS";
            case AWSAlexaforbusinessFeatureLists:
                return @"LISTS";
            case AWSAlexaforbusinessFeatureSkills:
                return @"SKILLS";
            case AWSAlexaforbusinessFeatureNetworkProfile:
                return @"NETWORK_PROFILE";
            case AWSAlexaforbusinessFeatureSettings:
                return @"SETTINGS";
            case AWSAlexaforbusinessFeatureAll:
                return @"ALL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessDeviceStatusInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionStatus" : @"ConnectionStatus",
             @"connectionStatusUpdatedTime" : @"ConnectionStatusUpdatedTime",
             @"deviceStatusDetails" : @"DeviceStatusDetails",
             };
}

+ (NSValueTransformer *)connectionStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONLINE"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConnectionStatusOnline);
        }
        if ([value caseInsensitiveCompare:@"OFFLINE"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConnectionStatusOffline);
        }
        return @(AWSAlexaforbusinessConnectionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessConnectionStatusOnline:
                return @"ONLINE";
            case AWSAlexaforbusinessConnectionStatusOffline:
                return @"OFFLINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)connectionStatusUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)deviceStatusDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessDeviceStatusDetail class]];
}

@end

@implementation AWSAlexaforbusinessDisassociateContactFromAddressBookRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressBookArn" : @"AddressBookArn",
             @"contactArn" : @"ContactArn",
             };
}

@end

@implementation AWSAlexaforbusinessDisassociateContactFromAddressBookResponse

@end

@implementation AWSAlexaforbusinessDisassociateDeviceFromRoomRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceArn" : @"DeviceArn",
             };
}

@end

@implementation AWSAlexaforbusinessDisassociateDeviceFromRoomResponse

@end

@implementation AWSAlexaforbusinessDisassociateSkillFromSkillGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"skillGroupArn" : @"SkillGroupArn",
             @"skillId" : @"SkillId",
             };
}

@end

@implementation AWSAlexaforbusinessDisassociateSkillFromSkillGroupResponse

@end

@implementation AWSAlexaforbusinessDisassociateSkillFromUsersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"skillId" : @"SkillId",
             };
}

@end

@implementation AWSAlexaforbusinessDisassociateSkillFromUsersResponse

@end

@implementation AWSAlexaforbusinessDisassociateSkillGroupFromRoomRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roomArn" : @"RoomArn",
             @"skillGroupArn" : @"SkillGroupArn",
             };
}

@end

@implementation AWSAlexaforbusinessDisassociateSkillGroupFromRoomResponse

@end

@implementation AWSAlexaforbusinessEndOfMeetingReminder

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"reminderAtMinutes" : @"ReminderAtMinutes",
             @"reminderType" : @"ReminderType",
             };
}

+ (NSValueTransformer *)reminderTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ANNOUNCEMENT_TIME_CHECK"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessEndOfMeetingReminderTypeAnnouncementTimeCheck);
        }
        if ([value caseInsensitiveCompare:@"ANNOUNCEMENT_VARIABLE_TIME_LEFT"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessEndOfMeetingReminderTypeAnnouncementVariableTimeLeft);
        }
        if ([value caseInsensitiveCompare:@"CHIME"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessEndOfMeetingReminderTypeChime);
        }
        if ([value caseInsensitiveCompare:@"KNOCK"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessEndOfMeetingReminderTypeKnock);
        }
        return @(AWSAlexaforbusinessEndOfMeetingReminderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessEndOfMeetingReminderTypeAnnouncementTimeCheck:
                return @"ANNOUNCEMENT_TIME_CHECK";
            case AWSAlexaforbusinessEndOfMeetingReminderTypeAnnouncementVariableTimeLeft:
                return @"ANNOUNCEMENT_VARIABLE_TIME_LEFT";
            case AWSAlexaforbusinessEndOfMeetingReminderTypeChime:
                return @"CHIME";
            case AWSAlexaforbusinessEndOfMeetingReminderTypeKnock:
                return @"KNOCK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

@end

@implementation AWSAlexaforbusinessForgetSmartHomeAppliancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roomArn" : @"RoomArn",
             };
}

@end

@implementation AWSAlexaforbusinessForgetSmartHomeAppliancesResponse

@end

@implementation AWSAlexaforbusinessGateway

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"detail" : @"Description",
             @"gatewayGroupArn" : @"GatewayGroupArn",
             @"name" : @"Name",
             @"softwareVersion" : @"SoftwareVersion",
             };
}

@end

@implementation AWSAlexaforbusinessGatewayGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"detail" : @"Description",
             @"name" : @"Name",
             };
}

@end

@implementation AWSAlexaforbusinessGatewayGroupSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"detail" : @"Description",
             @"name" : @"Name",
             };
}

@end

@implementation AWSAlexaforbusinessGatewaySummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"detail" : @"Description",
             @"gatewayGroupArn" : @"GatewayGroupArn",
             @"name" : @"Name",
             @"softwareVersion" : @"SoftwareVersion",
             };
}

@end

@implementation AWSAlexaforbusinessGetAddressBookRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressBookArn" : @"AddressBookArn",
             };
}

@end

@implementation AWSAlexaforbusinessGetAddressBookResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressBook" : @"AddressBook",
             };
}

+ (NSValueTransformer *)addressBookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessAddressBook class]];
}

@end

@implementation AWSAlexaforbusinessGetConferencePreferenceRequest

@end

@implementation AWSAlexaforbusinessGetConferencePreferenceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"preference" : @"Preference",
             };
}

+ (NSValueTransformer *)preferenceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessConferencePreference class]];
}

@end

@implementation AWSAlexaforbusinessGetConferenceProviderRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conferenceProviderArn" : @"ConferenceProviderArn",
             };
}

@end

@implementation AWSAlexaforbusinessGetConferenceProviderResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conferenceProvider" : @"ConferenceProvider",
             };
}

+ (NSValueTransformer *)conferenceProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessConferenceProvider class]];
}

@end

@implementation AWSAlexaforbusinessGetContactRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactArn" : @"ContactArn",
             };
}

@end

@implementation AWSAlexaforbusinessGetContactResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contact" : @"Contact",
             };
}

+ (NSValueTransformer *)contactJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessContact class]];
}

@end

@implementation AWSAlexaforbusinessGetDeviceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceArn" : @"DeviceArn",
             };
}

@end

@implementation AWSAlexaforbusinessGetDeviceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"device" : @"Device",
             };
}

+ (NSValueTransformer *)deviceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessDevice class]];
}

@end

@implementation AWSAlexaforbusinessGetGatewayGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayGroupArn" : @"GatewayGroupArn",
             };
}

@end

@implementation AWSAlexaforbusinessGetGatewayGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayGroup" : @"GatewayGroup",
             };
}

+ (NSValueTransformer *)gatewayGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessGatewayGroup class]];
}

@end

@implementation AWSAlexaforbusinessGetGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayArn" : @"GatewayArn",
             };
}

@end

@implementation AWSAlexaforbusinessGetGatewayResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gateway" : @"Gateway",
             };
}

+ (NSValueTransformer *)gatewayJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessGateway class]];
}

@end

@implementation AWSAlexaforbusinessGetInvitationConfigurationRequest

@end

@implementation AWSAlexaforbusinessGetInvitationConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactEmail" : @"ContactEmail",
             @"organizationName" : @"OrganizationName",
             @"privateSkillIds" : @"PrivateSkillIds",
             };
}

@end

@implementation AWSAlexaforbusinessGetNetworkProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"networkProfileArn" : @"NetworkProfileArn",
             };
}

@end

@implementation AWSAlexaforbusinessGetNetworkProfileResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"networkProfile" : @"NetworkProfile",
             };
}

+ (NSValueTransformer *)networkProfileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessNetworkProfile class]];
}

@end

@implementation AWSAlexaforbusinessGetProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"profileArn" : @"ProfileArn",
             };
}

@end

@implementation AWSAlexaforbusinessGetProfileResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"profile" : @"Profile",
             };
}

+ (NSValueTransformer *)profileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessProfile class]];
}

@end

@implementation AWSAlexaforbusinessGetRoomRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roomArn" : @"RoomArn",
             };
}

@end

@implementation AWSAlexaforbusinessGetRoomResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"room" : @"Room",
             };
}

+ (NSValueTransformer *)roomJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessRoom class]];
}

@end

@implementation AWSAlexaforbusinessGetRoomSkillParameterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameterKey" : @"ParameterKey",
             @"roomArn" : @"RoomArn",
             @"skillId" : @"SkillId",
             };
}

@end

@implementation AWSAlexaforbusinessGetRoomSkillParameterResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roomSkillParameter" : @"RoomSkillParameter",
             };
}

+ (NSValueTransformer *)roomSkillParameterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessRoomSkillParameter class]];
}

@end

@implementation AWSAlexaforbusinessGetSkillGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"skillGroupArn" : @"SkillGroupArn",
             };
}

@end

@implementation AWSAlexaforbusinessGetSkillGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"skillGroup" : @"SkillGroup",
             };
}

+ (NSValueTransformer *)skillGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessSkillGroup class]];
}

@end

@implementation AWSAlexaforbusinessIPDialIn

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commsProtocol" : @"CommsProtocol",
             @"endpoint" : @"Endpoint",
             };
}

+ (NSValueTransformer *)commsProtocolJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SIP"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessCommsProtocolSip);
        }
        if ([value caseInsensitiveCompare:@"SIPS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessCommsProtocolSips);
        }
        if ([value caseInsensitiveCompare:@"H323"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessCommsProtocolH323);
        }
        return @(AWSAlexaforbusinessCommsProtocolUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessCommsProtocolSip:
                return @"SIP";
            case AWSAlexaforbusinessCommsProtocolSips:
                return @"SIPS";
            case AWSAlexaforbusinessCommsProtocolH323:
                return @"H323";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessInstantBooking

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInMinutes" : @"DurationInMinutes",
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSAlexaforbusinessListBusinessReportSchedulesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAlexaforbusinessListBusinessReportSchedulesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"businessReportSchedules" : @"BusinessReportSchedules",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)businessReportSchedulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessBusinessReportSchedule class]];
}

@end

@implementation AWSAlexaforbusinessListConferenceProvidersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAlexaforbusinessListConferenceProvidersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conferenceProviders" : @"ConferenceProviders",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)conferenceProvidersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessConferenceProvider class]];
}

@end

@implementation AWSAlexaforbusinessListDeviceEventsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceArn" : @"DeviceArn",
             @"eventType" : @"EventType",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)eventTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONNECTION_STATUS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceEventTypeConnectionStatus);
        }
        if ([value caseInsensitiveCompare:@"DEVICE_STATUS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDeviceEventTypeDeviceStatus);
        }
        return @(AWSAlexaforbusinessDeviceEventTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessDeviceEventTypeConnectionStatus:
                return @"CONNECTION_STATUS";
            case AWSAlexaforbusinessDeviceEventTypeDeviceStatus:
                return @"DEVICE_STATUS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessListDeviceEventsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceEvents" : @"DeviceEvents",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)deviceEventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessDeviceEvent class]];
}

@end

@implementation AWSAlexaforbusinessListGatewayGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAlexaforbusinessListGatewayGroupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayGroups" : @"GatewayGroups",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)gatewayGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessGatewayGroupSummary class]];
}

@end

@implementation AWSAlexaforbusinessListGatewaysRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayGroupArn" : @"GatewayGroupArn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAlexaforbusinessListGatewaysResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gateways" : @"Gateways",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)gatewaysJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessGatewaySummary class]];
}

@end

@implementation AWSAlexaforbusinessListSkillsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enablementType" : @"EnablementType",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"skillGroupArn" : @"SkillGroupArn",
             @"skillType" : @"SkillType",
             };
}

+ (NSValueTransformer *)enablementTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessEnablementTypeFilterEnabled);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessEnablementTypeFilterPending);
        }
        return @(AWSAlexaforbusinessEnablementTypeFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessEnablementTypeFilterEnabled:
                return @"ENABLED";
            case AWSAlexaforbusinessEnablementTypeFilterPending:
                return @"PENDING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)skillTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUBLIC"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessSkillTypeFilterPublic);
        }
        if ([value caseInsensitiveCompare:@"PRIVATE"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessSkillTypeFilterPrivate);
        }
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessSkillTypeFilterAll);
        }
        return @(AWSAlexaforbusinessSkillTypeFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessSkillTypeFilterPublic:
                return @"PUBLIC";
            case AWSAlexaforbusinessSkillTypeFilterPrivate:
                return @"PRIVATE";
            case AWSAlexaforbusinessSkillTypeFilterAll:
                return @"ALL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessListSkillsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"skillSummaries" : @"SkillSummaries",
             };
}

+ (NSValueTransformer *)skillSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessSkillSummary class]];
}

@end

@implementation AWSAlexaforbusinessListSkillsStoreCategoriesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAlexaforbusinessListSkillsStoreCategoriesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"categoryList" : @"CategoryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)categoryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessCategory class]];
}

@end

@implementation AWSAlexaforbusinessListSkillsStoreSkillsByCategoryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"categoryId" : @"CategoryId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAlexaforbusinessListSkillsStoreSkillsByCategoryResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"skillsStoreSkills" : @"SkillsStoreSkills",
             };
}

+ (NSValueTransformer *)skillsStoreSkillsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessSkillsStoreSkill class]];
}

@end

@implementation AWSAlexaforbusinessListSmartHomeAppliancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"roomArn" : @"RoomArn",
             };
}

@end

@implementation AWSAlexaforbusinessListSmartHomeAppliancesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"smartHomeAppliances" : @"SmartHomeAppliances",
             };
}

+ (NSValueTransformer *)smartHomeAppliancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessSmartHomeAppliance class]];
}

@end

@implementation AWSAlexaforbusinessListTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAlexaforbusinessListTagsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessTag class]];
}

@end

@implementation AWSAlexaforbusinessMeetingRoomConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endOfMeetingReminder" : @"EndOfMeetingReminder",
             @"instantBooking" : @"InstantBooking",
             @"requireCheckIn" : @"RequireCheckIn",
             @"roomUtilizationMetricsEnabled" : @"RoomUtilizationMetricsEnabled",
             };
}

+ (NSValueTransformer *)endOfMeetingReminderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessEndOfMeetingReminder class]];
}

+ (NSValueTransformer *)instantBookingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessInstantBooking class]];
}

+ (NSValueTransformer *)requireCheckInJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessRequireCheckIn class]];
}

@end

@implementation AWSAlexaforbusinessMeetingSetting

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requirePin" : @"RequirePin",
             };
}

+ (NSValueTransformer *)requirePinJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"YES"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessRequirePinYes);
        }
        if ([value caseInsensitiveCompare:@"NO"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessRequirePinNo);
        }
        if ([value caseInsensitiveCompare:@"OPTIONAL"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessRequirePinOptional);
        }
        return @(AWSAlexaforbusinessRequirePinUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessRequirePinYes:
                return @"YES";
            case AWSAlexaforbusinessRequirePinNo:
                return @"NO";
            case AWSAlexaforbusinessRequirePinOptional:
                return @"OPTIONAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessNetworkProfile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateAuthorityArn" : @"CertificateAuthorityArn",
             @"currentPassword" : @"CurrentPassword",
             @"detail" : @"Description",
             @"eapMethod" : @"EapMethod",
             @"networkProfileArn" : @"NetworkProfileArn",
             @"networkProfileName" : @"NetworkProfileName",
             @"nextPassword" : @"NextPassword",
             @"securityType" : @"SecurityType",
             @"ssid" : @"Ssid",
             @"trustAnchors" : @"TrustAnchors",
             };
}

+ (NSValueTransformer *)eapMethodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EAP_TLS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessNetworkEapMethodEapTls);
        }
        return @(AWSAlexaforbusinessNetworkEapMethodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessNetworkEapMethodEapTls:
                return @"EAP_TLS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)securityTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OPEN"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessNetworkSecurityTypeOpen);
        }
        if ([value caseInsensitiveCompare:@"WEP"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessNetworkSecurityTypeWep);
        }
        if ([value caseInsensitiveCompare:@"WPA_PSK"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessNetworkSecurityTypeWpaPsk);
        }
        if ([value caseInsensitiveCompare:@"WPA2_PSK"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessNetworkSecurityTypeWpa2Psk);
        }
        if ([value caseInsensitiveCompare:@"WPA2_ENTERPRISE"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessNetworkSecurityTypeWpa2Enterprise);
        }
        return @(AWSAlexaforbusinessNetworkSecurityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessNetworkSecurityTypeOpen:
                return @"OPEN";
            case AWSAlexaforbusinessNetworkSecurityTypeWep:
                return @"WEP";
            case AWSAlexaforbusinessNetworkSecurityTypeWpaPsk:
                return @"WPA_PSK";
            case AWSAlexaforbusinessNetworkSecurityTypeWpa2Psk:
                return @"WPA2_PSK";
            case AWSAlexaforbusinessNetworkSecurityTypeWpa2Enterprise:
                return @"WPA2_ENTERPRISE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessNetworkProfileData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateAuthorityArn" : @"CertificateAuthorityArn",
             @"detail" : @"Description",
             @"eapMethod" : @"EapMethod",
             @"networkProfileArn" : @"NetworkProfileArn",
             @"networkProfileName" : @"NetworkProfileName",
             @"securityType" : @"SecurityType",
             @"ssid" : @"Ssid",
             };
}

+ (NSValueTransformer *)eapMethodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EAP_TLS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessNetworkEapMethodEapTls);
        }
        return @(AWSAlexaforbusinessNetworkEapMethodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessNetworkEapMethodEapTls:
                return @"EAP_TLS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)securityTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OPEN"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessNetworkSecurityTypeOpen);
        }
        if ([value caseInsensitiveCompare:@"WEP"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessNetworkSecurityTypeWep);
        }
        if ([value caseInsensitiveCompare:@"WPA_PSK"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessNetworkSecurityTypeWpaPsk);
        }
        if ([value caseInsensitiveCompare:@"WPA2_PSK"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessNetworkSecurityTypeWpa2Psk);
        }
        if ([value caseInsensitiveCompare:@"WPA2_ENTERPRISE"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessNetworkSecurityTypeWpa2Enterprise);
        }
        return @(AWSAlexaforbusinessNetworkSecurityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessNetworkSecurityTypeOpen:
                return @"OPEN";
            case AWSAlexaforbusinessNetworkSecurityTypeWep:
                return @"WEP";
            case AWSAlexaforbusinessNetworkSecurityTypeWpaPsk:
                return @"WPA_PSK";
            case AWSAlexaforbusinessNetworkSecurityTypeWpa2Psk:
                return @"WPA2_PSK";
            case AWSAlexaforbusinessNetworkSecurityTypeWpa2Enterprise:
                return @"WPA2_ENTERPRISE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessPSTNDialIn

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"countryCode" : @"CountryCode",
             @"oneClickIdDelay" : @"OneClickIdDelay",
             @"oneClickPinDelay" : @"OneClickPinDelay",
             @"phoneNumber" : @"PhoneNumber",
             };
}

@end

@implementation AWSAlexaforbusinessPhoneNumber

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"number" : @"Number",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MOBILE"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessPhoneNumberTypeMobile);
        }
        if ([value caseInsensitiveCompare:@"WORK"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessPhoneNumberTypeWork);
        }
        if ([value caseInsensitiveCompare:@"HOME"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessPhoneNumberTypeHome);
        }
        return @(AWSAlexaforbusinessPhoneNumberTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessPhoneNumberTypeMobile:
                return @"MOBILE";
            case AWSAlexaforbusinessPhoneNumberTypeWork:
                return @"WORK";
            case AWSAlexaforbusinessPhoneNumberTypeHome:
                return @"HOME";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessProfile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"addressBookArn" : @"AddressBookArn",
             @"distanceUnit" : @"DistanceUnit",
             @"isDefault" : @"IsDefault",
             @"locale" : @"Locale",
             @"maxVolumeLimit" : @"MaxVolumeLimit",
             @"meetingRoomConfiguration" : @"MeetingRoomConfiguration",
             @"PSTNEnabled" : @"PSTNEnabled",
             @"profileArn" : @"ProfileArn",
             @"profileName" : @"ProfileName",
             @"setupModeDisabled" : @"SetupModeDisabled",
             @"temperatureUnit" : @"TemperatureUnit",
             @"timezone" : @"Timezone",
             @"wakeWord" : @"WakeWord",
             };
}

+ (NSValueTransformer *)distanceUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"METRIC"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDistanceUnitMetric);
        }
        if ([value caseInsensitiveCompare:@"IMPERIAL"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDistanceUnitImperial);
        }
        return @(AWSAlexaforbusinessDistanceUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessDistanceUnitMetric:
                return @"METRIC";
            case AWSAlexaforbusinessDistanceUnitImperial:
                return @"IMPERIAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)meetingRoomConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessMeetingRoomConfiguration class]];
}

+ (NSValueTransformer *)temperatureUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FAHRENHEIT"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessTemperatureUnitFahrenheit);
        }
        if ([value caseInsensitiveCompare:@"CELSIUS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessTemperatureUnitCelsius);
        }
        return @(AWSAlexaforbusinessTemperatureUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessTemperatureUnitFahrenheit:
                return @"FAHRENHEIT";
            case AWSAlexaforbusinessTemperatureUnitCelsius:
                return @"CELSIUS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)wakeWordJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALEXA"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessWakeWordAlexa);
        }
        if ([value caseInsensitiveCompare:@"AMAZON"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessWakeWordAmazon);
        }
        if ([value caseInsensitiveCompare:@"ECHO"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessWakeWordEcho);
        }
        if ([value caseInsensitiveCompare:@"COMPUTER"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessWakeWordComputer);
        }
        return @(AWSAlexaforbusinessWakeWordUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessWakeWordAlexa:
                return @"ALEXA";
            case AWSAlexaforbusinessWakeWordAmazon:
                return @"AMAZON";
            case AWSAlexaforbusinessWakeWordEcho:
                return @"ECHO";
            case AWSAlexaforbusinessWakeWordComputer:
                return @"COMPUTER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessProfileData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"distanceUnit" : @"DistanceUnit",
             @"isDefault" : @"IsDefault",
             @"locale" : @"Locale",
             @"profileArn" : @"ProfileArn",
             @"profileName" : @"ProfileName",
             @"temperatureUnit" : @"TemperatureUnit",
             @"timezone" : @"Timezone",
             @"wakeWord" : @"WakeWord",
             };
}

+ (NSValueTransformer *)distanceUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"METRIC"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDistanceUnitMetric);
        }
        if ([value caseInsensitiveCompare:@"IMPERIAL"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDistanceUnitImperial);
        }
        return @(AWSAlexaforbusinessDistanceUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessDistanceUnitMetric:
                return @"METRIC";
            case AWSAlexaforbusinessDistanceUnitImperial:
                return @"IMPERIAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)temperatureUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FAHRENHEIT"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessTemperatureUnitFahrenheit);
        }
        if ([value caseInsensitiveCompare:@"CELSIUS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessTemperatureUnitCelsius);
        }
        return @(AWSAlexaforbusinessTemperatureUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessTemperatureUnitFahrenheit:
                return @"FAHRENHEIT";
            case AWSAlexaforbusinessTemperatureUnitCelsius:
                return @"CELSIUS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)wakeWordJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALEXA"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessWakeWordAlexa);
        }
        if ([value caseInsensitiveCompare:@"AMAZON"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessWakeWordAmazon);
        }
        if ([value caseInsensitiveCompare:@"ECHO"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessWakeWordEcho);
        }
        if ([value caseInsensitiveCompare:@"COMPUTER"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessWakeWordComputer);
        }
        return @(AWSAlexaforbusinessWakeWordUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessWakeWordAlexa:
                return @"ALEXA";
            case AWSAlexaforbusinessWakeWordAmazon:
                return @"AMAZON";
            case AWSAlexaforbusinessWakeWordEcho:
                return @"ECHO";
            case AWSAlexaforbusinessWakeWordComputer:
                return @"COMPUTER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessPutConferencePreferenceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conferencePreference" : @"ConferencePreference",
             };
}

+ (NSValueTransformer *)conferencePreferenceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessConferencePreference class]];
}

@end

@implementation AWSAlexaforbusinessPutConferencePreferenceResponse

@end

@implementation AWSAlexaforbusinessPutInvitationConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactEmail" : @"ContactEmail",
             @"organizationName" : @"OrganizationName",
             @"privateSkillIds" : @"PrivateSkillIds",
             };
}

@end

@implementation AWSAlexaforbusinessPutInvitationConfigurationResponse

@end

@implementation AWSAlexaforbusinessPutRoomSkillParameterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roomArn" : @"RoomArn",
             @"roomSkillParameter" : @"RoomSkillParameter",
             @"skillId" : @"SkillId",
             };
}

+ (NSValueTransformer *)roomSkillParameterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessRoomSkillParameter class]];
}

@end

@implementation AWSAlexaforbusinessPutRoomSkillParameterResponse

@end

@implementation AWSAlexaforbusinessPutSkillAuthorizationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizationResult" : @"AuthorizationResult",
             @"roomArn" : @"RoomArn",
             @"skillId" : @"SkillId",
             };
}

@end

@implementation AWSAlexaforbusinessPutSkillAuthorizationResponse

@end

@implementation AWSAlexaforbusinessRegisterAVSDeviceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amazonId" : @"AmazonId",
             @"clientId" : @"ClientId",
             @"deviceSerialNumber" : @"DeviceSerialNumber",
             @"productId" : @"ProductId",
             @"userCode" : @"UserCode",
             };
}

@end

@implementation AWSAlexaforbusinessRegisterAVSDeviceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceArn" : @"DeviceArn",
             };
}

@end

@implementation AWSAlexaforbusinessRejectSkillRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"skillId" : @"SkillId",
             };
}

@end

@implementation AWSAlexaforbusinessRejectSkillResponse

@end

@implementation AWSAlexaforbusinessRequireCheckIn

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"releaseAfterMinutes" : @"ReleaseAfterMinutes",
             };
}

@end

@implementation AWSAlexaforbusinessResolveRoomRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"skillId" : @"SkillId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSAlexaforbusinessResolveRoomResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roomArn" : @"RoomArn",
             @"roomName" : @"RoomName",
             @"roomSkillParameters" : @"RoomSkillParameters",
             };
}

+ (NSValueTransformer *)roomSkillParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessRoomSkillParameter class]];
}

@end

@implementation AWSAlexaforbusinessRevokeInvitationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enrollmentId" : @"EnrollmentId",
             @"userArn" : @"UserArn",
             };
}

@end

@implementation AWSAlexaforbusinessRevokeInvitationResponse

@end

@implementation AWSAlexaforbusinessRoom

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"profileArn" : @"ProfileArn",
             @"providerCalendarId" : @"ProviderCalendarId",
             @"roomArn" : @"RoomArn",
             @"roomName" : @"RoomName",
             };
}

@end

@implementation AWSAlexaforbusinessRoomData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"profileArn" : @"ProfileArn",
             @"profileName" : @"ProfileName",
             @"providerCalendarId" : @"ProviderCalendarId",
             @"roomArn" : @"RoomArn",
             @"roomName" : @"RoomName",
             };
}

@end

@implementation AWSAlexaforbusinessRoomSkillParameter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameterKey" : @"ParameterKey",
             @"parameterValue" : @"ParameterValue",
             };
}

@end

@implementation AWSAlexaforbusinessSearchAddressBooksRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortCriteria" : @"SortCriteria",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessFilter class]];
}

+ (NSValueTransformer *)sortCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessSort class]];
}

@end

@implementation AWSAlexaforbusinessSearchAddressBooksResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressBooks" : @"AddressBooks",
             @"nextToken" : @"NextToken",
             @"totalCount" : @"TotalCount",
             };
}

+ (NSValueTransformer *)addressBooksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessAddressBookData class]];
}

@end

@implementation AWSAlexaforbusinessSearchContactsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortCriteria" : @"SortCriteria",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessFilter class]];
}

+ (NSValueTransformer *)sortCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessSort class]];
}

@end

@implementation AWSAlexaforbusinessSearchContactsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contacts" : @"Contacts",
             @"nextToken" : @"NextToken",
             @"totalCount" : @"TotalCount",
             };
}

+ (NSValueTransformer *)contactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessContactData class]];
}

@end

@implementation AWSAlexaforbusinessSearchDevicesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortCriteria" : @"SortCriteria",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessFilter class]];
}

+ (NSValueTransformer *)sortCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessSort class]];
}

@end

@implementation AWSAlexaforbusinessSearchDevicesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"devices" : @"Devices",
             @"nextToken" : @"NextToken",
             @"totalCount" : @"TotalCount",
             };
}

+ (NSValueTransformer *)devicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessDeviceData class]];
}

@end

@implementation AWSAlexaforbusinessSearchNetworkProfilesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortCriteria" : @"SortCriteria",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessFilter class]];
}

+ (NSValueTransformer *)sortCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessSort class]];
}

@end

@implementation AWSAlexaforbusinessSearchNetworkProfilesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"networkProfiles" : @"NetworkProfiles",
             @"nextToken" : @"NextToken",
             @"totalCount" : @"TotalCount",
             };
}

+ (NSValueTransformer *)networkProfilesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessNetworkProfileData class]];
}

@end

@implementation AWSAlexaforbusinessSearchProfilesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortCriteria" : @"SortCriteria",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessFilter class]];
}

+ (NSValueTransformer *)sortCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessSort class]];
}

@end

@implementation AWSAlexaforbusinessSearchProfilesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"profiles" : @"Profiles",
             @"totalCount" : @"TotalCount",
             };
}

+ (NSValueTransformer *)profilesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessProfileData class]];
}

@end

@implementation AWSAlexaforbusinessSearchRoomsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortCriteria" : @"SortCriteria",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessFilter class]];
}

+ (NSValueTransformer *)sortCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessSort class]];
}

@end

@implementation AWSAlexaforbusinessSearchRoomsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"rooms" : @"Rooms",
             @"totalCount" : @"TotalCount",
             };
}

+ (NSValueTransformer *)roomsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessRoomData class]];
}

@end

@implementation AWSAlexaforbusinessSearchSkillGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortCriteria" : @"SortCriteria",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessFilter class]];
}

+ (NSValueTransformer *)sortCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessSort class]];
}

@end

@implementation AWSAlexaforbusinessSearchSkillGroupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"skillGroups" : @"SkillGroups",
             @"totalCount" : @"TotalCount",
             };
}

+ (NSValueTransformer *)skillGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessSkillGroupData class]];
}

@end

@implementation AWSAlexaforbusinessSearchUsersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortCriteria" : @"SortCriteria",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessFilter class]];
}

+ (NSValueTransformer *)sortCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessSort class]];
}

@end

@implementation AWSAlexaforbusinessSearchUsersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"totalCount" : @"TotalCount",
             @"users" : @"Users",
             };
}

+ (NSValueTransformer *)usersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessUserData class]];
}

@end

@implementation AWSAlexaforbusinessSendAnnouncementRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"content" : @"Content",
             @"roomFilters" : @"RoomFilters",
             @"timeToLiveInSeconds" : @"TimeToLiveInSeconds",
             };
}

+ (NSValueTransformer *)contentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessContent class]];
}

+ (NSValueTransformer *)roomFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessFilter class]];
}

@end

@implementation AWSAlexaforbusinessSendAnnouncementResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"announcementArn" : @"AnnouncementArn",
             };
}

@end

@implementation AWSAlexaforbusinessSendInvitationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userArn" : @"UserArn",
             };
}

@end

@implementation AWSAlexaforbusinessSendInvitationResponse

@end

@implementation AWSAlexaforbusinessSipAddress

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             @"uri" : @"Uri",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WORK"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessSipTypeWork);
        }
        return @(AWSAlexaforbusinessSipTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessSipTypeWork:
                return @"WORK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessSkillDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bulletPoints" : @"BulletPoints",
             @"developerInfo" : @"DeveloperInfo",
             @"endUserLicenseAgreement" : @"EndUserLicenseAgreement",
             @"genericKeywords" : @"GenericKeywords",
             @"invocationPhrase" : @"InvocationPhrase",
             @"latestInThisVersionBulletPoints" : @"NewInThisVersionBulletPoints",
             @"productDescription" : @"ProductDescription",
             @"releaseDate" : @"ReleaseDate",
             @"reviews" : @"Reviews",
             @"skillTypes" : @"SkillTypes",
             };
}

+ (NSValueTransformer *)developerInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessDeveloperInfo class]];
}

@end

@implementation AWSAlexaforbusinessSkillGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"skillGroupArn" : @"SkillGroupArn",
             @"skillGroupName" : @"SkillGroupName",
             };
}

@end

@implementation AWSAlexaforbusinessSkillGroupData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"skillGroupArn" : @"SkillGroupArn",
             @"skillGroupName" : @"SkillGroupName",
             };
}

@end

@implementation AWSAlexaforbusinessSkillSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enablementType" : @"EnablementType",
             @"skillId" : @"SkillId",
             @"skillName" : @"SkillName",
             @"skillType" : @"SkillType",
             @"supportsLinking" : @"SupportsLinking",
             };
}

+ (NSValueTransformer *)enablementTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessEnablementTypeEnabled);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessEnablementTypePending);
        }
        return @(AWSAlexaforbusinessEnablementTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessEnablementTypeEnabled:
                return @"ENABLED";
            case AWSAlexaforbusinessEnablementTypePending:
                return @"PENDING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)skillTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUBLIC"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessSkillTypePublic);
        }
        if ([value caseInsensitiveCompare:@"PRIVATE"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessSkillTypePrivate);
        }
        return @(AWSAlexaforbusinessSkillTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessSkillTypePublic:
                return @"PUBLIC";
            case AWSAlexaforbusinessSkillTypePrivate:
                return @"PRIVATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessSkillsStoreSkill

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"iconUrl" : @"IconUrl",
             @"sampleUtterances" : @"SampleUtterances",
             @"shortDescription" : @"ShortDescription",
             @"skillDetails" : @"SkillDetails",
             @"skillId" : @"SkillId",
             @"skillName" : @"SkillName",
             @"supportsLinking" : @"SupportsLinking",
             };
}

+ (NSValueTransformer *)skillDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessSkillDetails class]];
}

@end

@implementation AWSAlexaforbusinessSmartHomeAppliance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"friendlyName" : @"FriendlyName",
             @"manufacturerName" : @"ManufacturerName",
             };
}

@end

@implementation AWSAlexaforbusinessSort

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)valueJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASC"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessSortValueAsc);
        }
        if ([value caseInsensitiveCompare:@"DESC"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessSortValueDesc);
        }
        return @(AWSAlexaforbusinessSortValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessSortValueAsc:
                return @"ASC";
            case AWSAlexaforbusinessSortValueDesc:
                return @"DESC";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessSsml

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"locale" : @"Locale",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)localeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessLocaleEnUS);
        }
        return @(AWSAlexaforbusinessLocaleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessLocaleEnUS:
                return @"en-US";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessStartDeviceSyncRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceArn" : @"DeviceArn",
             @"features" : @"Features",
             @"roomArn" : @"RoomArn",
             };
}

@end

@implementation AWSAlexaforbusinessStartDeviceSyncResponse

@end

@implementation AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roomArn" : @"RoomArn",
             };
}

@end

@implementation AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryResponse

@end

@implementation AWSAlexaforbusinessTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSAlexaforbusinessTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessTag class]];
}

@end

@implementation AWSAlexaforbusinessTagResourceResponse

@end

@implementation AWSAlexaforbusinessText

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"locale" : @"Locale",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)localeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessLocaleEnUS);
        }
        return @(AWSAlexaforbusinessLocaleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessLocaleEnUS:
                return @"en-US";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSAlexaforbusinessUntagResourceResponse

@end

@implementation AWSAlexaforbusinessUpdateAddressBookRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressBookArn" : @"AddressBookArn",
             @"detail" : @"Description",
             @"name" : @"Name",
             };
}

@end

@implementation AWSAlexaforbusinessUpdateAddressBookResponse

@end

@implementation AWSAlexaforbusinessUpdateBusinessReportScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"format" : @"Format",
             @"recurrence" : @"Recurrence",
             @"s3BucketName" : @"S3BucketName",
             @"s3KeyPrefix" : @"S3KeyPrefix",
             @"scheduleArn" : @"ScheduleArn",
             @"scheduleName" : @"ScheduleName",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CSV"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessBusinessReportFormatCsv);
        }
        if ([value caseInsensitiveCompare:@"CSV_ZIP"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessBusinessReportFormatCsvZip);
        }
        return @(AWSAlexaforbusinessBusinessReportFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessBusinessReportFormatCsv:
                return @"CSV";
            case AWSAlexaforbusinessBusinessReportFormatCsvZip:
                return @"CSV_ZIP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)recurrenceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessBusinessReportRecurrence class]];
}

@end

@implementation AWSAlexaforbusinessUpdateBusinessReportScheduleResponse

@end

@implementation AWSAlexaforbusinessUpdateConferenceProviderRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conferenceProviderArn" : @"ConferenceProviderArn",
             @"conferenceProviderType" : @"ConferenceProviderType",
             @"IPDialIn" : @"IPDialIn",
             @"meetingSetting" : @"MeetingSetting",
             @"PSTNDialIn" : @"PSTNDialIn",
             };
}

+ (NSValueTransformer *)conferenceProviderTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CHIME"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeChime);
        }
        if ([value caseInsensitiveCompare:@"BLUEJEANS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeBluejeans);
        }
        if ([value caseInsensitiveCompare:@"FUZE"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeFuze);
        }
        if ([value caseInsensitiveCompare:@"GOOGLE_HANGOUTS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeGoogleHangouts);
        }
        if ([value caseInsensitiveCompare:@"POLYCOM"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypePolycom);
        }
        if ([value caseInsensitiveCompare:@"RINGCENTRAL"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeRingcentral);
        }
        if ([value caseInsensitiveCompare:@"SKYPE_FOR_BUSINESS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeSkypeForBusiness);
        }
        if ([value caseInsensitiveCompare:@"WEBEX"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeWebex);
        }
        if ([value caseInsensitiveCompare:@"ZOOM"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeZoom);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessConferenceProviderTypeCustom);
        }
        return @(AWSAlexaforbusinessConferenceProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessConferenceProviderTypeChime:
                return @"CHIME";
            case AWSAlexaforbusinessConferenceProviderTypeBluejeans:
                return @"BLUEJEANS";
            case AWSAlexaforbusinessConferenceProviderTypeFuze:
                return @"FUZE";
            case AWSAlexaforbusinessConferenceProviderTypeGoogleHangouts:
                return @"GOOGLE_HANGOUTS";
            case AWSAlexaforbusinessConferenceProviderTypePolycom:
                return @"POLYCOM";
            case AWSAlexaforbusinessConferenceProviderTypeRingcentral:
                return @"RINGCENTRAL";
            case AWSAlexaforbusinessConferenceProviderTypeSkypeForBusiness:
                return @"SKYPE_FOR_BUSINESS";
            case AWSAlexaforbusinessConferenceProviderTypeWebex:
                return @"WEBEX";
            case AWSAlexaforbusinessConferenceProviderTypeZoom:
                return @"ZOOM";
            case AWSAlexaforbusinessConferenceProviderTypeCustom:
                return @"CUSTOM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)IPDialInJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessIPDialIn class]];
}

+ (NSValueTransformer *)meetingSettingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessMeetingSetting class]];
}

+ (NSValueTransformer *)PSTNDialInJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessPSTNDialIn class]];
}

@end

@implementation AWSAlexaforbusinessUpdateConferenceProviderResponse

@end

@implementation AWSAlexaforbusinessUpdateContactRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contactArn" : @"ContactArn",
             @"displayName" : @"DisplayName",
             @"firstName" : @"FirstName",
             @"lastName" : @"LastName",
             @"phoneNumber" : @"PhoneNumber",
             @"phoneNumbers" : @"PhoneNumbers",
             @"sipAddresses" : @"SipAddresses",
             };
}

+ (NSValueTransformer *)phoneNumbersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessPhoneNumber class]];
}

+ (NSValueTransformer *)sipAddressesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAlexaforbusinessSipAddress class]];
}

@end

@implementation AWSAlexaforbusinessUpdateContactResponse

@end

@implementation AWSAlexaforbusinessUpdateDeviceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceArn" : @"DeviceArn",
             @"deviceName" : @"DeviceName",
             };
}

@end

@implementation AWSAlexaforbusinessUpdateDeviceResponse

@end

@implementation AWSAlexaforbusinessUpdateEndOfMeetingReminder

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"reminderAtMinutes" : @"ReminderAtMinutes",
             @"reminderType" : @"ReminderType",
             };
}

+ (NSValueTransformer *)reminderTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ANNOUNCEMENT_TIME_CHECK"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessEndOfMeetingReminderTypeAnnouncementTimeCheck);
        }
        if ([value caseInsensitiveCompare:@"ANNOUNCEMENT_VARIABLE_TIME_LEFT"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessEndOfMeetingReminderTypeAnnouncementVariableTimeLeft);
        }
        if ([value caseInsensitiveCompare:@"CHIME"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessEndOfMeetingReminderTypeChime);
        }
        if ([value caseInsensitiveCompare:@"KNOCK"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessEndOfMeetingReminderTypeKnock);
        }
        return @(AWSAlexaforbusinessEndOfMeetingReminderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessEndOfMeetingReminderTypeAnnouncementTimeCheck:
                return @"ANNOUNCEMENT_TIME_CHECK";
            case AWSAlexaforbusinessEndOfMeetingReminderTypeAnnouncementVariableTimeLeft:
                return @"ANNOUNCEMENT_VARIABLE_TIME_LEFT";
            case AWSAlexaforbusinessEndOfMeetingReminderTypeChime:
                return @"CHIME";
            case AWSAlexaforbusinessEndOfMeetingReminderTypeKnock:
                return @"KNOCK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessUpdateGatewayGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"gatewayGroupArn" : @"GatewayGroupArn",
             @"name" : @"Name",
             };
}

@end

@implementation AWSAlexaforbusinessUpdateGatewayGroupResponse

@end

@implementation AWSAlexaforbusinessUpdateGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"gatewayArn" : @"GatewayArn",
             @"name" : @"Name",
             @"softwareVersion" : @"SoftwareVersion",
             };
}

@end

@implementation AWSAlexaforbusinessUpdateGatewayResponse

@end

@implementation AWSAlexaforbusinessUpdateInstantBooking

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInMinutes" : @"DurationInMinutes",
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSAlexaforbusinessUpdateMeetingRoomConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endOfMeetingReminder" : @"EndOfMeetingReminder",
             @"instantBooking" : @"InstantBooking",
             @"requireCheckIn" : @"RequireCheckIn",
             @"roomUtilizationMetricsEnabled" : @"RoomUtilizationMetricsEnabled",
             };
}

+ (NSValueTransformer *)endOfMeetingReminderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessUpdateEndOfMeetingReminder class]];
}

+ (NSValueTransformer *)instantBookingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessUpdateInstantBooking class]];
}

+ (NSValueTransformer *)requireCheckInJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessUpdateRequireCheckIn class]];
}

@end

@implementation AWSAlexaforbusinessUpdateNetworkProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateAuthorityArn" : @"CertificateAuthorityArn",
             @"currentPassword" : @"CurrentPassword",
             @"detail" : @"Description",
             @"networkProfileArn" : @"NetworkProfileArn",
             @"networkProfileName" : @"NetworkProfileName",
             @"nextPassword" : @"NextPassword",
             @"trustAnchors" : @"TrustAnchors",
             };
}

@end

@implementation AWSAlexaforbusinessUpdateNetworkProfileResponse

@end

@implementation AWSAlexaforbusinessUpdateProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"distanceUnit" : @"DistanceUnit",
             @"isDefault" : @"IsDefault",
             @"locale" : @"Locale",
             @"maxVolumeLimit" : @"MaxVolumeLimit",
             @"meetingRoomConfiguration" : @"MeetingRoomConfiguration",
             @"PSTNEnabled" : @"PSTNEnabled",
             @"profileArn" : @"ProfileArn",
             @"profileName" : @"ProfileName",
             @"setupModeDisabled" : @"SetupModeDisabled",
             @"temperatureUnit" : @"TemperatureUnit",
             @"timezone" : @"Timezone",
             @"wakeWord" : @"WakeWord",
             };
}

+ (NSValueTransformer *)distanceUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"METRIC"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDistanceUnitMetric);
        }
        if ([value caseInsensitiveCompare:@"IMPERIAL"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessDistanceUnitImperial);
        }
        return @(AWSAlexaforbusinessDistanceUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessDistanceUnitMetric:
                return @"METRIC";
            case AWSAlexaforbusinessDistanceUnitImperial:
                return @"IMPERIAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)meetingRoomConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAlexaforbusinessUpdateMeetingRoomConfiguration class]];
}

+ (NSValueTransformer *)temperatureUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FAHRENHEIT"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessTemperatureUnitFahrenheit);
        }
        if ([value caseInsensitiveCompare:@"CELSIUS"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessTemperatureUnitCelsius);
        }
        return @(AWSAlexaforbusinessTemperatureUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessTemperatureUnitFahrenheit:
                return @"FAHRENHEIT";
            case AWSAlexaforbusinessTemperatureUnitCelsius:
                return @"CELSIUS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)wakeWordJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALEXA"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessWakeWordAlexa);
        }
        if ([value caseInsensitiveCompare:@"AMAZON"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessWakeWordAmazon);
        }
        if ([value caseInsensitiveCompare:@"ECHO"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessWakeWordEcho);
        }
        if ([value caseInsensitiveCompare:@"COMPUTER"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessWakeWordComputer);
        }
        return @(AWSAlexaforbusinessWakeWordUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessWakeWordAlexa:
                return @"ALEXA";
            case AWSAlexaforbusinessWakeWordAmazon:
                return @"AMAZON";
            case AWSAlexaforbusinessWakeWordEcho:
                return @"ECHO";
            case AWSAlexaforbusinessWakeWordComputer:
                return @"COMPUTER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAlexaforbusinessUpdateProfileResponse

@end

@implementation AWSAlexaforbusinessUpdateRequireCheckIn

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"releaseAfterMinutes" : @"ReleaseAfterMinutes",
             };
}

@end

@implementation AWSAlexaforbusinessUpdateRoomRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"profileArn" : @"ProfileArn",
             @"providerCalendarId" : @"ProviderCalendarId",
             @"roomArn" : @"RoomArn",
             @"roomName" : @"RoomName",
             };
}

@end

@implementation AWSAlexaforbusinessUpdateRoomResponse

@end

@implementation AWSAlexaforbusinessUpdateSkillGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"skillGroupArn" : @"SkillGroupArn",
             @"skillGroupName" : @"SkillGroupName",
             };
}

@end

@implementation AWSAlexaforbusinessUpdateSkillGroupResponse

@end

@implementation AWSAlexaforbusinessUserData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"email" : @"Email",
             @"enrollmentId" : @"EnrollmentId",
             @"enrollmentStatus" : @"EnrollmentStatus",
             @"firstName" : @"FirstName",
             @"lastName" : @"LastName",
             @"userArn" : @"UserArn",
             };
}

+ (NSValueTransformer *)enrollmentStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZED"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessEnrollmentStatusInitialized);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessEnrollmentStatusPending);
        }
        if ([value caseInsensitiveCompare:@"REGISTERED"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessEnrollmentStatusRegistered);
        }
        if ([value caseInsensitiveCompare:@"DISASSOCIATING"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessEnrollmentStatusDisassociating);
        }
        if ([value caseInsensitiveCompare:@"DEREGISTERING"] == NSOrderedSame) {
            return @(AWSAlexaforbusinessEnrollmentStatusDeregistering);
        }
        return @(AWSAlexaforbusinessEnrollmentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAlexaforbusinessEnrollmentStatusInitialized:
                return @"INITIALIZED";
            case AWSAlexaforbusinessEnrollmentStatusPending:
                return @"PENDING";
            case AWSAlexaforbusinessEnrollmentStatusRegistered:
                return @"REGISTERED";
            case AWSAlexaforbusinessEnrollmentStatusDisassociating:
                return @"DISASSOCIATING";
            case AWSAlexaforbusinessEnrollmentStatusDeregistering:
                return @"DEREGISTERING";
            default:
                return nil;
        }
    }];
}

@end
