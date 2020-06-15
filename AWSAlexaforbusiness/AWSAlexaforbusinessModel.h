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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSAlexaforbusinessErrorDomain;

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessErrorType) {
    AWSAlexaforbusinessErrorUnknown,
    AWSAlexaforbusinessErrorAlreadyExists,
    AWSAlexaforbusinessErrorConcurrentModification,
    AWSAlexaforbusinessErrorDeviceNotRegistered,
    AWSAlexaforbusinessErrorInvalidCertificateAuthority,
    AWSAlexaforbusinessErrorInvalidDevice,
    AWSAlexaforbusinessErrorInvalidSecretsManagerResource,
    AWSAlexaforbusinessErrorInvalidServiceLinkedRoleState,
    AWSAlexaforbusinessErrorInvalidUserStatus,
    AWSAlexaforbusinessErrorLimitExceeded,
    AWSAlexaforbusinessErrorNameInUse,
    AWSAlexaforbusinessErrorNotFound,
    AWSAlexaforbusinessErrorResourceAssociated,
    AWSAlexaforbusinessErrorResourceInUse,
    AWSAlexaforbusinessErrorSkillNotLinked,
    AWSAlexaforbusinessErrorUnauthorized,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessBusinessReportFailureCode) {
    AWSAlexaforbusinessBusinessReportFailureCodeUnknown,
    AWSAlexaforbusinessBusinessReportFailureCodeAccessDenied,
    AWSAlexaforbusinessBusinessReportFailureCodeNoSuchBucket,
    AWSAlexaforbusinessBusinessReportFailureCodeInternalFailure,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessBusinessReportFormat) {
    AWSAlexaforbusinessBusinessReportFormatUnknown,
    AWSAlexaforbusinessBusinessReportFormatCsv,
    AWSAlexaforbusinessBusinessReportFormatCsvZip,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessBusinessReportInterval) {
    AWSAlexaforbusinessBusinessReportIntervalUnknown,
    AWSAlexaforbusinessBusinessReportIntervalOneDay,
    AWSAlexaforbusinessBusinessReportIntervalOneWeek,
    AWSAlexaforbusinessBusinessReportIntervalThirtyDays,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessBusinessReportStatus) {
    AWSAlexaforbusinessBusinessReportStatusUnknown,
    AWSAlexaforbusinessBusinessReportStatusRunning,
    AWSAlexaforbusinessBusinessReportStatusSucceeded,
    AWSAlexaforbusinessBusinessReportStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessCommsProtocol) {
    AWSAlexaforbusinessCommsProtocolUnknown,
    AWSAlexaforbusinessCommsProtocolSip,
    AWSAlexaforbusinessCommsProtocolSips,
    AWSAlexaforbusinessCommsProtocolH323,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessConferenceProviderType) {
    AWSAlexaforbusinessConferenceProviderTypeUnknown,
    AWSAlexaforbusinessConferenceProviderTypeChime,
    AWSAlexaforbusinessConferenceProviderTypeBluejeans,
    AWSAlexaforbusinessConferenceProviderTypeFuze,
    AWSAlexaforbusinessConferenceProviderTypeGoogleHangouts,
    AWSAlexaforbusinessConferenceProviderTypePolycom,
    AWSAlexaforbusinessConferenceProviderTypeRingcentral,
    AWSAlexaforbusinessConferenceProviderTypeSkypeForBusiness,
    AWSAlexaforbusinessConferenceProviderTypeWebex,
    AWSAlexaforbusinessConferenceProviderTypeZoom,
    AWSAlexaforbusinessConferenceProviderTypeCustom,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessConnectionStatus) {
    AWSAlexaforbusinessConnectionStatusUnknown,
    AWSAlexaforbusinessConnectionStatusOnline,
    AWSAlexaforbusinessConnectionStatusOffline,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessDeviceEventType) {
    AWSAlexaforbusinessDeviceEventTypeUnknown,
    AWSAlexaforbusinessDeviceEventTypeConnectionStatus,
    AWSAlexaforbusinessDeviceEventTypeDeviceStatus,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessDeviceStatus) {
    AWSAlexaforbusinessDeviceStatusUnknown,
    AWSAlexaforbusinessDeviceStatusReady,
    AWSAlexaforbusinessDeviceStatusPending,
    AWSAlexaforbusinessDeviceStatusWasOffline,
    AWSAlexaforbusinessDeviceStatusDeregistered,
    AWSAlexaforbusinessDeviceStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessDeviceStatusDetailCode) {
    AWSAlexaforbusinessDeviceStatusDetailCodeUnknown,
    AWSAlexaforbusinessDeviceStatusDetailCodeDeviceSoftwareUpdateNeeded,
    AWSAlexaforbusinessDeviceStatusDetailCodeDeviceWasOffline,
    AWSAlexaforbusinessDeviceStatusDetailCodeCredentialsAccessFailure,
    AWSAlexaforbusinessDeviceStatusDetailCodeTlsVersionMismatch,
    AWSAlexaforbusinessDeviceStatusDetailCodeAssociationRejection,
    AWSAlexaforbusinessDeviceStatusDetailCodeAuthenticationFailure,
    AWSAlexaforbusinessDeviceStatusDetailCodeDhcpFailure,
    AWSAlexaforbusinessDeviceStatusDetailCodeInternetUnavailable,
    AWSAlexaforbusinessDeviceStatusDetailCodeDnsFailure,
    AWSAlexaforbusinessDeviceStatusDetailCodeUnknownFailure,
    AWSAlexaforbusinessDeviceStatusDetailCodeCertificateIssuingLimitExceeded,
    AWSAlexaforbusinessDeviceStatusDetailCodeInvalidCertificateAuthority,
    AWSAlexaforbusinessDeviceStatusDetailCodeNetworkProfileNotFound,
    AWSAlexaforbusinessDeviceStatusDetailCodeInvalidPasswordState,
    AWSAlexaforbusinessDeviceStatusDetailCodePasswordNotFound,
    AWSAlexaforbusinessDeviceStatusDetailCodePasswordManagerAccessDenied,
    AWSAlexaforbusinessDeviceStatusDetailCodeCertificateAuthorityAccessDenied,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessDeviceUsageType) {
    AWSAlexaforbusinessDeviceUsageTypeUnknown,
    AWSAlexaforbusinessDeviceUsageTypeVoice,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessDistanceUnit) {
    AWSAlexaforbusinessDistanceUnitUnknown,
    AWSAlexaforbusinessDistanceUnitMetric,
    AWSAlexaforbusinessDistanceUnitImperial,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessEnablementType) {
    AWSAlexaforbusinessEnablementTypeUnknown,
    AWSAlexaforbusinessEnablementTypeEnabled,
    AWSAlexaforbusinessEnablementTypePending,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessEnablementTypeFilter) {
    AWSAlexaforbusinessEnablementTypeFilterUnknown,
    AWSAlexaforbusinessEnablementTypeFilterEnabled,
    AWSAlexaforbusinessEnablementTypeFilterPending,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessEndOfMeetingReminderType) {
    AWSAlexaforbusinessEndOfMeetingReminderTypeUnknown,
    AWSAlexaforbusinessEndOfMeetingReminderTypeAnnouncementTimeCheck,
    AWSAlexaforbusinessEndOfMeetingReminderTypeAnnouncementVariableTimeLeft,
    AWSAlexaforbusinessEndOfMeetingReminderTypeChime,
    AWSAlexaforbusinessEndOfMeetingReminderTypeKnock,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessEnrollmentStatus) {
    AWSAlexaforbusinessEnrollmentStatusUnknown,
    AWSAlexaforbusinessEnrollmentStatusInitialized,
    AWSAlexaforbusinessEnrollmentStatusPending,
    AWSAlexaforbusinessEnrollmentStatusRegistered,
    AWSAlexaforbusinessEnrollmentStatusDisassociating,
    AWSAlexaforbusinessEnrollmentStatusDeregistering,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessFeature) {
    AWSAlexaforbusinessFeatureUnknown,
    AWSAlexaforbusinessFeatureBluetooth,
    AWSAlexaforbusinessFeatureVolume,
    AWSAlexaforbusinessFeatureNotifications,
    AWSAlexaforbusinessFeatureLists,
    AWSAlexaforbusinessFeatureSkills,
    AWSAlexaforbusinessFeatureNetworkProfile,
    AWSAlexaforbusinessFeatureSettings,
    AWSAlexaforbusinessFeatureAll,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessLocale) {
    AWSAlexaforbusinessLocaleUnknown,
    AWSAlexaforbusinessLocaleEnUS,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessNetworkEapMethod) {
    AWSAlexaforbusinessNetworkEapMethodUnknown,
    AWSAlexaforbusinessNetworkEapMethodEapTls,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessNetworkSecurityType) {
    AWSAlexaforbusinessNetworkSecurityTypeUnknown,
    AWSAlexaforbusinessNetworkSecurityTypeOpen,
    AWSAlexaforbusinessNetworkSecurityTypeWep,
    AWSAlexaforbusinessNetworkSecurityTypeWpaPsk,
    AWSAlexaforbusinessNetworkSecurityTypeWpa2Psk,
    AWSAlexaforbusinessNetworkSecurityTypeWpa2Enterprise,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessPhoneNumberType) {
    AWSAlexaforbusinessPhoneNumberTypeUnknown,
    AWSAlexaforbusinessPhoneNumberTypeMobile,
    AWSAlexaforbusinessPhoneNumberTypeWork,
    AWSAlexaforbusinessPhoneNumberTypeHome,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessRequirePin) {
    AWSAlexaforbusinessRequirePinUnknown,
    AWSAlexaforbusinessRequirePinYes,
    AWSAlexaforbusinessRequirePinNo,
    AWSAlexaforbusinessRequirePinOptional,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessSipType) {
    AWSAlexaforbusinessSipTypeUnknown,
    AWSAlexaforbusinessSipTypeWork,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessSkillType) {
    AWSAlexaforbusinessSkillTypeUnknown,
    AWSAlexaforbusinessSkillTypePublic,
    AWSAlexaforbusinessSkillTypePrivate,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessSkillTypeFilter) {
    AWSAlexaforbusinessSkillTypeFilterUnknown,
    AWSAlexaforbusinessSkillTypeFilterPublic,
    AWSAlexaforbusinessSkillTypeFilterPrivate,
    AWSAlexaforbusinessSkillTypeFilterAll,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessSortValue) {
    AWSAlexaforbusinessSortValueUnknown,
    AWSAlexaforbusinessSortValueAsc,
    AWSAlexaforbusinessSortValueDesc,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessTemperatureUnit) {
    AWSAlexaforbusinessTemperatureUnitUnknown,
    AWSAlexaforbusinessTemperatureUnitFahrenheit,
    AWSAlexaforbusinessTemperatureUnitCelsius,
};

typedef NS_ENUM(NSInteger, AWSAlexaforbusinessWakeWord) {
    AWSAlexaforbusinessWakeWordUnknown,
    AWSAlexaforbusinessWakeWordAlexa,
    AWSAlexaforbusinessWakeWordAmazon,
    AWSAlexaforbusinessWakeWordEcho,
    AWSAlexaforbusinessWakeWordComputer,
};

@class AWSAlexaforbusinessAddressBook;
@class AWSAlexaforbusinessAddressBookData;
@class AWSAlexaforbusinessApproveSkillRequest;
@class AWSAlexaforbusinessApproveSkillResponse;
@class AWSAlexaforbusinessAssociateContactWithAddressBookRequest;
@class AWSAlexaforbusinessAssociateContactWithAddressBookResponse;
@class AWSAlexaforbusinessAssociateDeviceWithNetworkProfileRequest;
@class AWSAlexaforbusinessAssociateDeviceWithNetworkProfileResponse;
@class AWSAlexaforbusinessAssociateDeviceWithRoomRequest;
@class AWSAlexaforbusinessAssociateDeviceWithRoomResponse;
@class AWSAlexaforbusinessAssociateSkillGroupWithRoomRequest;
@class AWSAlexaforbusinessAssociateSkillGroupWithRoomResponse;
@class AWSAlexaforbusinessAssociateSkillWithSkillGroupRequest;
@class AWSAlexaforbusinessAssociateSkillWithSkillGroupResponse;
@class AWSAlexaforbusinessAssociateSkillWithUsersRequest;
@class AWSAlexaforbusinessAssociateSkillWithUsersResponse;
@class AWSAlexaforbusinessAudio;
@class AWSAlexaforbusinessBusinessReport;
@class AWSAlexaforbusinessBusinessReportContentRange;
@class AWSAlexaforbusinessBusinessReportRecurrence;
@class AWSAlexaforbusinessBusinessReportS3Location;
@class AWSAlexaforbusinessBusinessReportSchedule;
@class AWSAlexaforbusinessCategory;
@class AWSAlexaforbusinessConferencePreference;
@class AWSAlexaforbusinessConferenceProvider;
@class AWSAlexaforbusinessContact;
@class AWSAlexaforbusinessContactData;
@class AWSAlexaforbusinessContent;
@class AWSAlexaforbusinessCreateAddressBookRequest;
@class AWSAlexaforbusinessCreateAddressBookResponse;
@class AWSAlexaforbusinessCreateBusinessReportScheduleRequest;
@class AWSAlexaforbusinessCreateBusinessReportScheduleResponse;
@class AWSAlexaforbusinessCreateConferenceProviderRequest;
@class AWSAlexaforbusinessCreateConferenceProviderResponse;
@class AWSAlexaforbusinessCreateContactRequest;
@class AWSAlexaforbusinessCreateContactResponse;
@class AWSAlexaforbusinessCreateEndOfMeetingReminder;
@class AWSAlexaforbusinessCreateGatewayGroupRequest;
@class AWSAlexaforbusinessCreateGatewayGroupResponse;
@class AWSAlexaforbusinessCreateInstantBooking;
@class AWSAlexaforbusinessCreateMeetingRoomConfiguration;
@class AWSAlexaforbusinessCreateNetworkProfileRequest;
@class AWSAlexaforbusinessCreateNetworkProfileResponse;
@class AWSAlexaforbusinessCreateProfileRequest;
@class AWSAlexaforbusinessCreateProfileResponse;
@class AWSAlexaforbusinessCreateRequireCheckIn;
@class AWSAlexaforbusinessCreateRoomRequest;
@class AWSAlexaforbusinessCreateRoomResponse;
@class AWSAlexaforbusinessCreateSkillGroupRequest;
@class AWSAlexaforbusinessCreateSkillGroupResponse;
@class AWSAlexaforbusinessCreateUserRequest;
@class AWSAlexaforbusinessCreateUserResponse;
@class AWSAlexaforbusinessDeleteAddressBookRequest;
@class AWSAlexaforbusinessDeleteAddressBookResponse;
@class AWSAlexaforbusinessDeleteBusinessReportScheduleRequest;
@class AWSAlexaforbusinessDeleteBusinessReportScheduleResponse;
@class AWSAlexaforbusinessDeleteConferenceProviderRequest;
@class AWSAlexaforbusinessDeleteConferenceProviderResponse;
@class AWSAlexaforbusinessDeleteContactRequest;
@class AWSAlexaforbusinessDeleteContactResponse;
@class AWSAlexaforbusinessDeleteDeviceRequest;
@class AWSAlexaforbusinessDeleteDeviceResponse;
@class AWSAlexaforbusinessDeleteDeviceUsageDataRequest;
@class AWSAlexaforbusinessDeleteDeviceUsageDataResponse;
@class AWSAlexaforbusinessDeleteGatewayGroupRequest;
@class AWSAlexaforbusinessDeleteGatewayGroupResponse;
@class AWSAlexaforbusinessDeleteNetworkProfileRequest;
@class AWSAlexaforbusinessDeleteNetworkProfileResponse;
@class AWSAlexaforbusinessDeleteProfileRequest;
@class AWSAlexaforbusinessDeleteProfileResponse;
@class AWSAlexaforbusinessDeleteRoomRequest;
@class AWSAlexaforbusinessDeleteRoomResponse;
@class AWSAlexaforbusinessDeleteRoomSkillParameterRequest;
@class AWSAlexaforbusinessDeleteRoomSkillParameterResponse;
@class AWSAlexaforbusinessDeleteSkillAuthorizationRequest;
@class AWSAlexaforbusinessDeleteSkillAuthorizationResponse;
@class AWSAlexaforbusinessDeleteSkillGroupRequest;
@class AWSAlexaforbusinessDeleteSkillGroupResponse;
@class AWSAlexaforbusinessDeleteUserRequest;
@class AWSAlexaforbusinessDeleteUserResponse;
@class AWSAlexaforbusinessDeveloperInfo;
@class AWSAlexaforbusinessDevice;
@class AWSAlexaforbusinessDeviceData;
@class AWSAlexaforbusinessDeviceEvent;
@class AWSAlexaforbusinessDeviceNetworkProfileInfo;
@class AWSAlexaforbusinessDeviceStatusDetail;
@class AWSAlexaforbusinessDeviceStatusInfo;
@class AWSAlexaforbusinessDisassociateContactFromAddressBookRequest;
@class AWSAlexaforbusinessDisassociateContactFromAddressBookResponse;
@class AWSAlexaforbusinessDisassociateDeviceFromRoomRequest;
@class AWSAlexaforbusinessDisassociateDeviceFromRoomResponse;
@class AWSAlexaforbusinessDisassociateSkillFromSkillGroupRequest;
@class AWSAlexaforbusinessDisassociateSkillFromSkillGroupResponse;
@class AWSAlexaforbusinessDisassociateSkillFromUsersRequest;
@class AWSAlexaforbusinessDisassociateSkillFromUsersResponse;
@class AWSAlexaforbusinessDisassociateSkillGroupFromRoomRequest;
@class AWSAlexaforbusinessDisassociateSkillGroupFromRoomResponse;
@class AWSAlexaforbusinessEndOfMeetingReminder;
@class AWSAlexaforbusinessFilter;
@class AWSAlexaforbusinessForgetSmartHomeAppliancesRequest;
@class AWSAlexaforbusinessForgetSmartHomeAppliancesResponse;
@class AWSAlexaforbusinessGateway;
@class AWSAlexaforbusinessGatewayGroup;
@class AWSAlexaforbusinessGatewayGroupSummary;
@class AWSAlexaforbusinessGatewaySummary;
@class AWSAlexaforbusinessGetAddressBookRequest;
@class AWSAlexaforbusinessGetAddressBookResponse;
@class AWSAlexaforbusinessGetConferencePreferenceRequest;
@class AWSAlexaforbusinessGetConferencePreferenceResponse;
@class AWSAlexaforbusinessGetConferenceProviderRequest;
@class AWSAlexaforbusinessGetConferenceProviderResponse;
@class AWSAlexaforbusinessGetContactRequest;
@class AWSAlexaforbusinessGetContactResponse;
@class AWSAlexaforbusinessGetDeviceRequest;
@class AWSAlexaforbusinessGetDeviceResponse;
@class AWSAlexaforbusinessGetGatewayGroupRequest;
@class AWSAlexaforbusinessGetGatewayGroupResponse;
@class AWSAlexaforbusinessGetGatewayRequest;
@class AWSAlexaforbusinessGetGatewayResponse;
@class AWSAlexaforbusinessGetInvitationConfigurationRequest;
@class AWSAlexaforbusinessGetInvitationConfigurationResponse;
@class AWSAlexaforbusinessGetNetworkProfileRequest;
@class AWSAlexaforbusinessGetNetworkProfileResponse;
@class AWSAlexaforbusinessGetProfileRequest;
@class AWSAlexaforbusinessGetProfileResponse;
@class AWSAlexaforbusinessGetRoomRequest;
@class AWSAlexaforbusinessGetRoomResponse;
@class AWSAlexaforbusinessGetRoomSkillParameterRequest;
@class AWSAlexaforbusinessGetRoomSkillParameterResponse;
@class AWSAlexaforbusinessGetSkillGroupRequest;
@class AWSAlexaforbusinessGetSkillGroupResponse;
@class AWSAlexaforbusinessIPDialIn;
@class AWSAlexaforbusinessInstantBooking;
@class AWSAlexaforbusinessListBusinessReportSchedulesRequest;
@class AWSAlexaforbusinessListBusinessReportSchedulesResponse;
@class AWSAlexaforbusinessListConferenceProvidersRequest;
@class AWSAlexaforbusinessListConferenceProvidersResponse;
@class AWSAlexaforbusinessListDeviceEventsRequest;
@class AWSAlexaforbusinessListDeviceEventsResponse;
@class AWSAlexaforbusinessListGatewayGroupsRequest;
@class AWSAlexaforbusinessListGatewayGroupsResponse;
@class AWSAlexaforbusinessListGatewaysRequest;
@class AWSAlexaforbusinessListGatewaysResponse;
@class AWSAlexaforbusinessListSkillsRequest;
@class AWSAlexaforbusinessListSkillsResponse;
@class AWSAlexaforbusinessListSkillsStoreCategoriesRequest;
@class AWSAlexaforbusinessListSkillsStoreCategoriesResponse;
@class AWSAlexaforbusinessListSkillsStoreSkillsByCategoryRequest;
@class AWSAlexaforbusinessListSkillsStoreSkillsByCategoryResponse;
@class AWSAlexaforbusinessListSmartHomeAppliancesRequest;
@class AWSAlexaforbusinessListSmartHomeAppliancesResponse;
@class AWSAlexaforbusinessListTagsRequest;
@class AWSAlexaforbusinessListTagsResponse;
@class AWSAlexaforbusinessMeetingRoomConfiguration;
@class AWSAlexaforbusinessMeetingSetting;
@class AWSAlexaforbusinessNetworkProfile;
@class AWSAlexaforbusinessNetworkProfileData;
@class AWSAlexaforbusinessPSTNDialIn;
@class AWSAlexaforbusinessPhoneNumber;
@class AWSAlexaforbusinessProfile;
@class AWSAlexaforbusinessProfileData;
@class AWSAlexaforbusinessPutConferencePreferenceRequest;
@class AWSAlexaforbusinessPutConferencePreferenceResponse;
@class AWSAlexaforbusinessPutInvitationConfigurationRequest;
@class AWSAlexaforbusinessPutInvitationConfigurationResponse;
@class AWSAlexaforbusinessPutRoomSkillParameterRequest;
@class AWSAlexaforbusinessPutRoomSkillParameterResponse;
@class AWSAlexaforbusinessPutSkillAuthorizationRequest;
@class AWSAlexaforbusinessPutSkillAuthorizationResponse;
@class AWSAlexaforbusinessRegisterAVSDeviceRequest;
@class AWSAlexaforbusinessRegisterAVSDeviceResponse;
@class AWSAlexaforbusinessRejectSkillRequest;
@class AWSAlexaforbusinessRejectSkillResponse;
@class AWSAlexaforbusinessRequireCheckIn;
@class AWSAlexaforbusinessResolveRoomRequest;
@class AWSAlexaforbusinessResolveRoomResponse;
@class AWSAlexaforbusinessRevokeInvitationRequest;
@class AWSAlexaforbusinessRevokeInvitationResponse;
@class AWSAlexaforbusinessRoom;
@class AWSAlexaforbusinessRoomData;
@class AWSAlexaforbusinessRoomSkillParameter;
@class AWSAlexaforbusinessSearchAddressBooksRequest;
@class AWSAlexaforbusinessSearchAddressBooksResponse;
@class AWSAlexaforbusinessSearchContactsRequest;
@class AWSAlexaforbusinessSearchContactsResponse;
@class AWSAlexaforbusinessSearchDevicesRequest;
@class AWSAlexaforbusinessSearchDevicesResponse;
@class AWSAlexaforbusinessSearchNetworkProfilesRequest;
@class AWSAlexaforbusinessSearchNetworkProfilesResponse;
@class AWSAlexaforbusinessSearchProfilesRequest;
@class AWSAlexaforbusinessSearchProfilesResponse;
@class AWSAlexaforbusinessSearchRoomsRequest;
@class AWSAlexaforbusinessSearchRoomsResponse;
@class AWSAlexaforbusinessSearchSkillGroupsRequest;
@class AWSAlexaforbusinessSearchSkillGroupsResponse;
@class AWSAlexaforbusinessSearchUsersRequest;
@class AWSAlexaforbusinessSearchUsersResponse;
@class AWSAlexaforbusinessSendAnnouncementRequest;
@class AWSAlexaforbusinessSendAnnouncementResponse;
@class AWSAlexaforbusinessSendInvitationRequest;
@class AWSAlexaforbusinessSendInvitationResponse;
@class AWSAlexaforbusinessSipAddress;
@class AWSAlexaforbusinessSkillDetails;
@class AWSAlexaforbusinessSkillGroup;
@class AWSAlexaforbusinessSkillGroupData;
@class AWSAlexaforbusinessSkillSummary;
@class AWSAlexaforbusinessSkillsStoreSkill;
@class AWSAlexaforbusinessSmartHomeAppliance;
@class AWSAlexaforbusinessSort;
@class AWSAlexaforbusinessSsml;
@class AWSAlexaforbusinessStartDeviceSyncRequest;
@class AWSAlexaforbusinessStartDeviceSyncResponse;
@class AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryRequest;
@class AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryResponse;
@class AWSAlexaforbusinessTag;
@class AWSAlexaforbusinessTagResourceRequest;
@class AWSAlexaforbusinessTagResourceResponse;
@class AWSAlexaforbusinessText;
@class AWSAlexaforbusinessUntagResourceRequest;
@class AWSAlexaforbusinessUntagResourceResponse;
@class AWSAlexaforbusinessUpdateAddressBookRequest;
@class AWSAlexaforbusinessUpdateAddressBookResponse;
@class AWSAlexaforbusinessUpdateBusinessReportScheduleRequest;
@class AWSAlexaforbusinessUpdateBusinessReportScheduleResponse;
@class AWSAlexaforbusinessUpdateConferenceProviderRequest;
@class AWSAlexaforbusinessUpdateConferenceProviderResponse;
@class AWSAlexaforbusinessUpdateContactRequest;
@class AWSAlexaforbusinessUpdateContactResponse;
@class AWSAlexaforbusinessUpdateDeviceRequest;
@class AWSAlexaforbusinessUpdateDeviceResponse;
@class AWSAlexaforbusinessUpdateEndOfMeetingReminder;
@class AWSAlexaforbusinessUpdateGatewayGroupRequest;
@class AWSAlexaforbusinessUpdateGatewayGroupResponse;
@class AWSAlexaforbusinessUpdateGatewayRequest;
@class AWSAlexaforbusinessUpdateGatewayResponse;
@class AWSAlexaforbusinessUpdateInstantBooking;
@class AWSAlexaforbusinessUpdateMeetingRoomConfiguration;
@class AWSAlexaforbusinessUpdateNetworkProfileRequest;
@class AWSAlexaforbusinessUpdateNetworkProfileResponse;
@class AWSAlexaforbusinessUpdateProfileRequest;
@class AWSAlexaforbusinessUpdateProfileResponse;
@class AWSAlexaforbusinessUpdateRequireCheckIn;
@class AWSAlexaforbusinessUpdateRoomRequest;
@class AWSAlexaforbusinessUpdateRoomResponse;
@class AWSAlexaforbusinessUpdateSkillGroupRequest;
@class AWSAlexaforbusinessUpdateSkillGroupResponse;
@class AWSAlexaforbusinessUserData;

/**
 <p>An address book with attributes.</p>
 */
@interface AWSAlexaforbusinessAddressBook : AWSModel


/**
 <p>The ARN of the address book.</p>
 */
@property (nonatomic, strong) NSString * _Nullable addressBookArn;

/**
 <p>The description of the address book.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the address book.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Information related to an address book.</p>
 */
@interface AWSAlexaforbusinessAddressBookData : AWSModel


/**
 <p>The ARN of the address book.</p>
 */
@property (nonatomic, strong) NSString * _Nullable addressBookArn;

/**
 <p>The description of the address book.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the address book.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSAlexaforbusinessApproveSkillRequest : AWSRequest


/**
 <p>The unique identifier of the skill.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillId;

@end

/**
 
 */
@interface AWSAlexaforbusinessApproveSkillResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessAssociateContactWithAddressBookRequest : AWSRequest


/**
 <p>The ARN of the address book with which to associate the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable addressBookArn;

/**
 <p>The ARN of the contact to associate with an address book.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessAssociateContactWithAddressBookResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessAssociateDeviceWithNetworkProfileRequest : AWSRequest


/**
 <p>The device ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceArn;

/**
 <p>The ARN of the network profile to associate with a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkProfileArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessAssociateDeviceWithNetworkProfileResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessAssociateDeviceWithRoomRequest : AWSRequest


/**
 <p>The ARN of the device to associate to a room. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceArn;

/**
 <p>The ARN of the room with which to associate the device. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessAssociateDeviceWithRoomResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessAssociateSkillGroupWithRoomRequest : AWSRequest


/**
 <p>The ARN of the room with which to associate the skill group. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomArn;

/**
 <p>The ARN of the skill group to associate with a room. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillGroupArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessAssociateSkillGroupWithRoomResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessAssociateSkillWithSkillGroupRequest : AWSRequest


/**
 <p>The ARN of the skill group to associate the skill to. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillGroupArn;

/**
 <p>The unique identifier of the skill.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillId;

@end

/**
 
 */
@interface AWSAlexaforbusinessAssociateSkillWithSkillGroupResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessAssociateSkillWithUsersRequest : AWSRequest


/**
 <p>The private skill ID you want to make available to enrolled users.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillId;

@end

/**
 
 */
@interface AWSAlexaforbusinessAssociateSkillWithUsersResponse : AWSModel


@end

/**
 <p>The audio message. There is a 1 MB limit on the audio file input and the only supported format is MP3. To convert your MP3 audio files to an Alexa-friendly, </p><p>required codec version (MPEG version 2) and bit rate (48 kbps), you might use converter software. One option for this is a command-line tool, FFmpeg. For more information, see <a href="https://www.ffmpeg.org/">FFmpeg</a>. The following command converts the provided &lt;input-file&gt; to an MP3 file that is played in the announcement:</p><p><code>ffmpeg -i &lt;input-file&gt; -ac 2 -codec:a libmp3lame -b:a 48k -ar 16000 &lt;output-file.mp3&gt;</code></p>
 Required parameters: [Locale, Location]
 */
@interface AWSAlexaforbusinessAudio : AWSModel


/**
 <p>The locale of the audio message. Currently, en-US is supported.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessLocale locale;

/**
 <p>The location of the audio file. Currently, S3 URLs are supported. Only S3 locations comprised of safe characters are valid. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#Safe%20Characters">Safe Characters</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

@end

/**
 <p>Usage report with specified parameters.</p>
 */
@interface AWSAlexaforbusinessBusinessReport : AWSModel


/**
 <p>The time of report delivery.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deliveryTime;

/**
 <p>The download link where a user can download the report.</p>
 */
@property (nonatomic, strong) NSString * _Nullable downloadUrl;

/**
 <p>The failure code.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessBusinessReportFailureCode failureCode;

/**
 <p>The S3 location of the output reports.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessBusinessReportS3Location * _Nullable s3Location;

/**
 <p>The status of the report generation execution (RUNNING, SUCCEEDED, or FAILED).</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessBusinessReportStatus status;

@end

/**
 <p>The content range of the report.</p>
 Required parameters: [Interval]
 */
@interface AWSAlexaforbusinessBusinessReportContentRange : AWSModel


/**
 <p>The interval of the content range.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessBusinessReportInterval interval;

@end

/**
 <p>The recurrence of the reports.</p>
 */
@interface AWSAlexaforbusinessBusinessReportRecurrence : AWSModel


/**
 <p>The start date.</p>
 */
@property (nonatomic, strong) NSString * _Nullable startDate;

@end

/**
 <p>The S3 location of the output reports.</p>
 */
@interface AWSAlexaforbusinessBusinessReportS3Location : AWSModel


/**
 <p>The S3 bucket name of the output reports.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketName;

/**
 <p>The path of the business report.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

@end

/**
 <p>The schedule of the usage report.</p>
 */
@interface AWSAlexaforbusinessBusinessReportSchedule : AWSModel


/**
 <p>The content range of the reports.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessBusinessReportContentRange * _Nullable contentRange;

/**
 <p>The format of the generated report (individual CSV files or zipped files of individual files).</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessBusinessReportFormat format;

/**
 <p>The details of the last business report delivery for a specified time interval.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessBusinessReport * _Nullable lastBusinessReport;

/**
 <p>The recurrence of the reports.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessBusinessReportRecurrence * _Nullable recurrence;

/**
 <p>The S3 bucket name of the output reports.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3BucketName;

/**
 <p>The S3 key where the report is delivered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3KeyPrefix;

/**
 <p>The ARN of the business report schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleArn;

/**
 <p>The name identifier of the schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleName;

@end

/**
 <p>The skill store category that is shown. Alexa skills are assigned a specific skill category during creation, such as News, Social, and Sports.</p>
 */
@interface AWSAlexaforbusinessCategory : AWSModel


/**
 <p>The ID of the skill store category.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable categoryId;

/**
 <p>The name of the skill store category.</p>
 */
@property (nonatomic, strong) NSString * _Nullable categoryName;

@end

/**
 <p>The default conference provider that is used if no other scheduled meetings are detected.</p>
 */
@interface AWSAlexaforbusinessConferencePreference : AWSModel


/**
 <p>The ARN of the default conference provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultConferenceProviderArn;

@end

/**
 <p>An entity that provides a conferencing solution. Alexa for Business acts as the voice interface and mediator that connects users to their preferred conference provider. Examples of conference providers include Amazon Chime, Zoom, Cisco, and Polycom. </p>
 */
@interface AWSAlexaforbusinessConferenceProvider : AWSModel


/**
 <p>The ARN of the newly created conference provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The IP endpoint and protocol for calling.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessIPDialIn * _Nullable IPDialIn;

/**
 <p>The meeting settings for the conference provider.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessMeetingSetting * _Nullable meetingSetting;

/**
 <p>The name of the conference provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The information for PSTN conferencing.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessPSTNDialIn * _Nullable PSTNDialIn;

/**
 <p>The type of conference providers.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessConferenceProviderType types;

@end

/**
 <p>A contact with attributes.</p>
 */
@interface AWSAlexaforbusinessContact : AWSModel


/**
 <p>The ARN of the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactArn;

/**
 <p>The name of the contact to display on the console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The first name of the contact, used to call the contact on the device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable firstName;

/**
 <p>The last name of the contact, used to call the contact on the device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastName;

/**
 <p>The phone number of the contact. The phone number type defaults to WORK. You can either specify PhoneNumber or PhoneNumbers. We recommend that you use PhoneNumbers, which lets you specify the phone number type and multiple numbers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumber;

/**
 <p>The list of phone numbers for the contact.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessPhoneNumber *> * _Nullable phoneNumbers;

/**
 <p>The list of SIP addresses for the contact.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessSipAddress *> * _Nullable sipAddresses;

@end

/**
 <p>Information related to a contact.</p>
 */
@interface AWSAlexaforbusinessContactData : AWSModel


/**
 <p>The ARN of the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactArn;

/**
 <p>The name of the contact to display on the console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The first name of the contact, used to call the contact on the device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable firstName;

/**
 <p>The last name of the contact, used to call the contact on the device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastName;

/**
 <p>The phone number of the contact. The phone number type defaults to WORK. You can specify PhoneNumber or PhoneNumbers. We recommend that you use PhoneNumbers, which lets you specify the phone number type and multiple numbers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumber;

/**
 <p>The list of phone numbers for the contact.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessPhoneNumber *> * _Nullable phoneNumbers;

/**
 <p>The list of SIP addresses for the contact.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessSipAddress *> * _Nullable sipAddresses;

@end

/**
 <p>The content definition. This can contain only one text, SSML, or audio list object.</p>
 */
@interface AWSAlexaforbusinessContent : AWSModel


/**
 <p>The list of audio messages.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessAudio *> * _Nullable audioList;

/**
 <p>The list of SSML messages.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessSsml *> * _Nullable ssmlList;

/**
 <p>The list of text messages.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessText *> * _Nullable textList;

@end

/**
 
 */
@interface AWSAlexaforbusinessCreateAddressBookRequest : AWSRequest


/**
 <p>A unique, user-specified identifier for the request that ensures idempotency.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The description of the address book.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the address book.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSAlexaforbusinessCreateAddressBookResponse : AWSModel


/**
 <p>The ARN of the newly created address book.</p>
 */
@property (nonatomic, strong) NSString * _Nullable addressBookArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessCreateBusinessReportScheduleRequest : AWSRequest


/**
 <p>The client request token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The content range of the reports.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessBusinessReportContentRange * _Nullable contentRange;

/**
 <p>The format of the generated report (individual CSV files or zipped files of individual files).</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessBusinessReportFormat format;

/**
 <p>The recurrence of the reports. If this isn't specified, the report will only be delivered one time when the API is called. </p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessBusinessReportRecurrence * _Nullable recurrence;

/**
 <p>The S3 bucket name of the output reports. If this isn't specified, the report can be retrieved from a download link by calling ListBusinessReportSchedule. </p>
 */
@property (nonatomic, strong) NSString * _Nullable s3BucketName;

/**
 <p>The S3 key where the report is delivered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3KeyPrefix;

/**
 <p>The name identifier of the schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleName;

/**
 <p>The tags for the business report schedule.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSAlexaforbusinessCreateBusinessReportScheduleResponse : AWSModel


/**
 <p>The ARN of the business report schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessCreateConferenceProviderRequest : AWSRequest


/**
 <p>The request token of the client.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The name of the conference provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable conferenceProviderName;

/**
 <p>Represents a type within a list of predefined types.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessConferenceProviderType conferenceProviderType;

/**
 <p>The IP endpoint and protocol for calling.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessIPDialIn * _Nullable IPDialIn;

/**
 <p>The meeting settings for the conference provider.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessMeetingSetting * _Nullable meetingSetting;

/**
 <p>The information for PSTN conferencing.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessPSTNDialIn * _Nullable PSTNDialIn;

@end

/**
 
 */
@interface AWSAlexaforbusinessCreateConferenceProviderResponse : AWSModel


/**
 <p>The ARN of the newly-created conference provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable conferenceProviderArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessCreateContactRequest : AWSRequest


/**
 <p>A unique, user-specified identifier for this request that ensures idempotency.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The name of the contact to display on the console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The first name of the contact that is used to call the contact on the device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable firstName;

/**
 <p>The last name of the contact that is used to call the contact on the device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastName;

/**
 <p>The phone number of the contact in E.164 format. The phone number type defaults to WORK. You can specify PhoneNumber or PhoneNumbers. We recommend that you use PhoneNumbers, which lets you specify the phone number type and multiple numbers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumber;

/**
 <p>The list of phone numbers for the contact.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessPhoneNumber *> * _Nullable phoneNumbers;

/**
 <p>The list of SIP addresses for the contact.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessSipAddress *> * _Nullable sipAddresses;

@end

/**
 
 */
@interface AWSAlexaforbusinessCreateContactResponse : AWSModel


/**
 <p>The ARN of the newly created address book.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactArn;

@end

/**
 <p>Creates settings for the end of meeting reminder feature that are applied to a room profile. The end of meeting reminder enables Alexa to remind users when a meeting is ending.</p>
 Required parameters: [ReminderAtMinutes, ReminderType, Enabled]
 */
@interface AWSAlexaforbusinessCreateEndOfMeetingReminder : AWSModel


/**
 <p>Whether an end of meeting reminder is enabled or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p> A range of 3 to 15 minutes that determines when the reminder begins.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable reminderAtMinutes;

/**
 <p>The type of sound that users hear during the end of meeting reminder. </p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessEndOfMeetingReminderType reminderType;

@end

/**
 
 */
@interface AWSAlexaforbusinessCreateGatewayGroupRequest : AWSRequest


/**
 <p> A unique, user-specified identifier for the request that ensures idempotency.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The description of the gateway group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the gateway group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSAlexaforbusinessCreateGatewayGroupResponse : AWSModel


/**
 <p>The ARN of the created gateway group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayGroupArn;

@end

/**
 <p>Creates settings for the instant booking feature that are applied to a room profile. When users start their meeting with Alexa, Alexa automatically books the room for the configured duration if the room is available.</p>
 Required parameters: [DurationInMinutes, Enabled]
 */
@interface AWSAlexaforbusinessCreateInstantBooking : AWSModel


/**
 <p>Duration between 15 and 240 minutes at increments of 15 that determines how long to book an available room when a meeting is started with Alexa.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationInMinutes;

/**
 <p>Whether instant booking is enabled or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 <p>Creates meeting room settings of a room profile.</p>
 */
@interface AWSAlexaforbusinessCreateMeetingRoomConfiguration : AWSModel


/**
 <p>Creates settings for the end of meeting reminder feature that are applied to a room profile. The end of meeting reminder enables Alexa to remind users when a meeting is ending.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessCreateEndOfMeetingReminder * _Nullable endOfMeetingReminder;

/**
 <p>Settings to automatically book a room for a configured duration if it's free when joining a meeting with Alexa.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessCreateInstantBooking * _Nullable instantBooking;

/**
 <p>Settings for requiring a check in when a room is reserved. Alexa can cancel a room reservation if it's not checked into to make the room available for others. Users can check in by joining the meeting with Alexa or an AVS device, or by saying “Alexa, check in.”</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessCreateRequireCheckIn * _Nullable requireCheckIn;

/**
 <p>Whether room utilization metrics are enabled or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable roomUtilizationMetricsEnabled;

@end

/**
 
 */
@interface AWSAlexaforbusinessCreateNetworkProfileRequest : AWSRequest


/**
 <p>The ARN of the Private Certificate Authority (PCA) created in AWS Certificate Manager (ACM). This is used to issue certificates to the devices. </p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateAuthorityArn;

/**
 <p>A unique, user-specified identifier for the request that ensures idempotency.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The current password of the Wi-Fi network.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentPassword;

/**
 <p>Detailed information about a device's network profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The authentication standard that is used in the EAP framework. Currently, EAP_TLS is supported.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessNetworkEapMethod eapMethod;

/**
 <p>The name of the network profile associated with a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkProfileName;

/**
 <p>The next, or subsequent, password of the Wi-Fi network. This password is asynchronously transmitted to the device and is used when the password of the network changes to NextPassword. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPassword;

/**
 <p>The security type of the Wi-Fi network. This can be WPA2_ENTERPRISE, WPA2_PSK, WPA_PSK, WEP, or OPEN.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessNetworkSecurityType securityType;

/**
 <p>The SSID of the Wi-Fi network.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ssid;

/**
 <p>The root certificates of your authentication server that is installed on your devices and used to trust your authentication server during EAP negotiation. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable trustAnchors;

@end

/**
 
 */
@interface AWSAlexaforbusinessCreateNetworkProfileResponse : AWSModel


/**
 <p>The ARN of the network profile associated with a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkProfileArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessCreateProfileRequest : AWSRequest


/**
 <p>The valid address for the room.</p>
 */
@property (nonatomic, strong) NSString * _Nullable address;

/**
 <p>The user-specified token that is used during the creation of a profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The distance unit to be used by devices in the profile.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessDistanceUnit distanceUnit;

/**
 <p>The locale of the room profile. (This is currently only available to a limited preview audience.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable locale;

/**
 <p>The maximum volume limit for a room profile.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxVolumeLimit;

/**
 <p>The meeting room settings of a room profile.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessCreateMeetingRoomConfiguration * _Nullable meetingRoomConfiguration;

/**
 <p>Whether PSTN calling is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable PSTNEnabled;

/**
 <p>The name of a room profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable profileName;

/**
 <p>Whether room profile setup is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setupModeDisabled;

/**
 <p>The tags for the profile.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessTag *> * _Nullable tags;

/**
 <p>The temperature unit to be used by devices in the profile.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessTemperatureUnit temperatureUnit;

/**
 <p>The time zone used by a room profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timezone;

/**
 <p>A wake word for Alexa, Echo, Amazon, or a computer.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessWakeWord wakeWord;

@end

/**
 
 */
@interface AWSAlexaforbusinessCreateProfileResponse : AWSModel


/**
 <p>The ARN of the newly created room profile in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable profileArn;

@end

/**
 <p>Creates settings for the require check in feature that are applied to a room profile. Require check in allows a meeting room’s Alexa or AVS device to prompt the user to check in; otherwise, the room will be released.</p>
 Required parameters: [ReleaseAfterMinutes, Enabled]
 */
@interface AWSAlexaforbusinessCreateRequireCheckIn : AWSModel


/**
 <p>Whether require check in is enabled or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>Duration between 5 and 20 minutes to determine when to release the room if it's not checked into.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable releaseAfterMinutes;

@end

/**
 
 */
@interface AWSAlexaforbusinessCreateRoomRequest : AWSRequest


/**
 <p>A unique, user-specified identifier for this request that ensures idempotency. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The description for the room.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The profile ARN for the room. This is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable profileArn;

/**
 <p>The calendar ARN for the room.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerCalendarId;

/**
 <p>The name for the room.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomName;

/**
 <p>The tags for the room.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSAlexaforbusinessCreateRoomResponse : AWSModel


/**
 <p>The ARN of the newly created room in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessCreateSkillGroupRequest : AWSRequest


/**
 <p>A unique, user-specified identifier for this request that ensures idempotency. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The description for the skill group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name for the skill group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillGroupName;

/**
 <p>The tags for the skill group.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSAlexaforbusinessCreateSkillGroupResponse : AWSModel


/**
 <p>The ARN of the newly created skill group in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillGroupArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessCreateUserRequest : AWSRequest


/**
 <p>A unique, user-specified identifier for this request that ensures idempotency. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The email address for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>The first name for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable firstName;

/**
 <p>The last name for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastName;

/**
 <p>The tags for the user.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessTag *> * _Nullable tags;

/**
 <p>The ARN for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSAlexaforbusinessCreateUserResponse : AWSModel


/**
 <p>The ARN of the newly created user in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteAddressBookRequest : AWSRequest


/**
 <p>The ARN of the address book to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable addressBookArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteAddressBookResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteBusinessReportScheduleRequest : AWSRequest


/**
 <p>The ARN of the business report schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteBusinessReportScheduleResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteConferenceProviderRequest : AWSRequest


/**
 <p>The ARN of the conference provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable conferenceProviderArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteConferenceProviderResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteContactRequest : AWSRequest


/**
 <p>The ARN of the contact to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteContactResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteDeviceRequest : AWSRequest


/**
 <p>The ARN of the device for which to request details.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteDeviceResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteDeviceUsageDataRequest : AWSRequest


/**
 <p>The ARN of the device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceArn;

/**
 <p>The type of usage data to delete.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessDeviceUsageType deviceUsageType;

@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteDeviceUsageDataResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteGatewayGroupRequest : AWSRequest


/**
 <p>The ARN of the gateway group to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayGroupArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteGatewayGroupResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteNetworkProfileRequest : AWSRequest


/**
 <p>The ARN of the network profile associated with a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkProfileArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteNetworkProfileResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteProfileRequest : AWSRequest


/**
 <p>The ARN of the room profile to delete. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable profileArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteProfileResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteRoomRequest : AWSRequest


/**
 <p>The ARN of the room to delete. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteRoomResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteRoomSkillParameterRequest : AWSRequest


/**
 <p>The room skill parameter key for which to remove details.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterKey;

/**
 <p>The ARN of the room from which to remove the room skill parameter details.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomArn;

/**
 <p>The ID of the skill from which to remove the room skill parameter details.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillId;

@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteRoomSkillParameterResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteSkillAuthorizationRequest : AWSRequest


/**
 <p>The room that the skill is authorized for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomArn;

/**
 <p>The unique identifier of a skill.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillId;

@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteSkillAuthorizationResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteSkillGroupRequest : AWSRequest


/**
 <p>The ARN of the skill group to delete. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillGroupArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteSkillGroupResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteUserRequest : AWSRequest


/**
 <p>The ARN of the user's enrollment in the organization. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable enrollmentId;

/**
 <p>The ARN of the user to delete in the organization. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessDeleteUserResponse : AWSModel


@end

/**
 <p>The details about the developer that published the skill.</p>
 */
@interface AWSAlexaforbusinessDeveloperInfo : AWSModel


/**
 <p>The name of the developer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable developerName;

/**
 <p>The email of the developer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>The URL of the privacy policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privacyPolicy;

/**
 <p>The website of the developer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 <p>A device with attributes.</p>
 */
@interface AWSAlexaforbusinessDevice : AWSModel


/**
 <p>The ARN of a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceArn;

/**
 <p>The name of a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceName;

/**
 <p>The serial number of a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceSerialNumber;

/**
 <p>The status of a device. If the status is not READY, check the DeviceStatusInfo value for details.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessDeviceStatus deviceStatus;

/**
 <p>Detailed information about a device's status.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessDeviceStatusInfo * _Nullable deviceStatusInfo;

/**
 <p>The type of a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceType;

/**
 <p>The MAC address of a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable macAddress;

/**
 <p>Detailed information about a device's network profile.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessDeviceNetworkProfileInfo * _Nullable networkProfileInfo;

/**
 <p>The room ARN of a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomArn;

/**
 <p>The software version of a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable softwareVersion;

@end

/**
 <p>Device attributes.</p>
 */
@interface AWSAlexaforbusinessDeviceData : AWSModel


/**
 <p>The time (in epoch) when the device data was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The ARN of a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceArn;

/**
 <p>The name of a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceName;

/**
 <p>The serial number of a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceSerialNumber;

/**
 <p>The status of a device.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessDeviceStatus deviceStatus;

/**
 <p>Detailed information about a device's status.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessDeviceStatusInfo * _Nullable deviceStatusInfo;

/**
 <p>The type of a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceType;

/**
 <p>The MAC address of a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable macAddress;

/**
 <p>The ARN of the network profile associated with a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkProfileArn;

/**
 <p>The name of the network profile associated with a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkProfileName;

/**
 <p>The room ARN associated with a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomArn;

/**
 <p>The name of the room associated with a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomName;

/**
 <p>The software version of a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable softwareVersion;

@end

/**
 <p>The list of device events.</p>
 */
@interface AWSAlexaforbusinessDeviceEvent : AWSModel


/**
 <p>The time (in epoch) when the event occurred. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

/**
 <p>The type of device event.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessDeviceEventType types;

/**
 <p>The value of the event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Detailed information about a device's network profile.</p>
 */
@interface AWSAlexaforbusinessDeviceNetworkProfileInfo : AWSModel


/**
 <p>The ARN of the certificate associated with a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The time (in epoch) when the certificate expires.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable certificateExpirationTime;

/**
 <p>The ARN of the network profile associated with a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkProfileArn;

@end

/**
 <p>Details of a device’s status.</p>
 */
@interface AWSAlexaforbusinessDeviceStatusDetail : AWSModel


/**
 <p>The device status detail code.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessDeviceStatusDetailCode code;

/**
 <p>The list of available features on the device.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessFeature feature;

@end

/**
 <p>Detailed information about a device's status.</p>
 */
@interface AWSAlexaforbusinessDeviceStatusInfo : AWSModel


/**
 <p>The latest available information about the connection status of a device. </p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessConnectionStatus connectionStatus;

/**
 <p>The time (in epoch) when the device connection status changed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable connectionStatusUpdatedTime;

/**
 <p>One or more device status detail descriptions.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessDeviceStatusDetail *> * _Nullable deviceStatusDetails;

@end

/**
 
 */
@interface AWSAlexaforbusinessDisassociateContactFromAddressBookRequest : AWSRequest


/**
 <p>The ARN of the address from which to disassociate the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable addressBookArn;

/**
 <p>The ARN of the contact to disassociate from an address book.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessDisassociateContactFromAddressBookResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessDisassociateDeviceFromRoomRequest : AWSRequest


/**
 <p>The ARN of the device to disassociate from a room. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessDisassociateDeviceFromRoomResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessDisassociateSkillFromSkillGroupRequest : AWSRequest


/**
 <p>The unique identifier of a skill. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillGroupArn;

/**
 <p>The ARN of a skill group to associate to a skill.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillId;

@end

/**
 
 */
@interface AWSAlexaforbusinessDisassociateSkillFromSkillGroupResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessDisassociateSkillFromUsersRequest : AWSRequest


/**
 <p> The private skill ID you want to make unavailable for enrolled users.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillId;

@end

/**
 
 */
@interface AWSAlexaforbusinessDisassociateSkillFromUsersResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessDisassociateSkillGroupFromRoomRequest : AWSRequest


/**
 <p>The ARN of the room from which the skill group is to be disassociated. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomArn;

/**
 <p>The ARN of the skill group to disassociate from a room. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillGroupArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessDisassociateSkillGroupFromRoomResponse : AWSModel


@end

/**
 <p>Settings for the end of meeting reminder feature that are applied to a room profile. The end of meeting reminder enables Alexa to remind users when a meeting is ending. </p>
 */
@interface AWSAlexaforbusinessEndOfMeetingReminder : AWSModel


/**
 <p>Whether an end of meeting reminder is enabled or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>A range of 3 to 15 minutes that determines when the reminder begins.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable reminderAtMinutes;

/**
 <p>The type of sound that users hear during the end of meeting reminder. </p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessEndOfMeetingReminderType reminderType;

@end

/**
 <p>A filter name and value pair that is used to return a more specific list of results. Filters can be used to match a set of resources by various criteria.</p>
 Required parameters: [Key, Values]
 */
@interface AWSAlexaforbusinessFilter : AWSModel


/**
 <p>The key of a filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The values of a filter.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 
 */
@interface AWSAlexaforbusinessForgetSmartHomeAppliancesRequest : AWSRequest


/**
 <p>The room that the appliances are associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessForgetSmartHomeAppliancesResponse : AWSModel


@end

/**
 <p>The details of the gateway. </p>
 */
@interface AWSAlexaforbusinessGateway : AWSModel


/**
 <p>The ARN of the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The description of the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN of the gateway group that the gateway is associated to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayGroupArn;

/**
 <p>The name of the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The software version of the gateway. The gateway automatically updates its software version during normal operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable softwareVersion;

@end

/**
 <p>The details of the gateway group.</p>
 */
@interface AWSAlexaforbusinessGatewayGroup : AWSModel


/**
 <p>The ARN of the gateway group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The description of the gateway group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the gateway group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>The summary of a gateway group.</p>
 */
@interface AWSAlexaforbusinessGatewayGroupSummary : AWSModel


/**
 <p>The ARN of the gateway group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The description of the gateway group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the gateway group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>The summary of a gateway.</p>
 */
@interface AWSAlexaforbusinessGatewaySummary : AWSModel


/**
 <p>The ARN of the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The description of the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN of the gateway group that the gateway is associated to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayGroupArn;

/**
 <p>The name of the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The software version of the gateway. The gateway automatically updates its software version during normal operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable softwareVersion;

@end

/**
 
 */
@interface AWSAlexaforbusinessGetAddressBookRequest : AWSRequest


/**
 <p>The ARN of the address book for which to request details.</p>
 */
@property (nonatomic, strong) NSString * _Nullable addressBookArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessGetAddressBookResponse : AWSModel


/**
 <p>The details of the requested address book.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessAddressBook * _Nullable addressBook;

@end

/**
 
 */
@interface AWSAlexaforbusinessGetConferencePreferenceRequest : AWSRequest


@end

/**
 
 */
@interface AWSAlexaforbusinessGetConferencePreferenceResponse : AWSModel


/**
 <p>The conference preference.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessConferencePreference * _Nullable preference;

@end

/**
 
 */
@interface AWSAlexaforbusinessGetConferenceProviderRequest : AWSRequest


/**
 <p>The ARN of the newly created conference provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable conferenceProviderArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessGetConferenceProviderResponse : AWSModel


/**
 <p>The conference provider.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessConferenceProvider * _Nullable conferenceProvider;

@end

/**
 
 */
@interface AWSAlexaforbusinessGetContactRequest : AWSRequest


/**
 <p>The ARN of the contact for which to request details.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessGetContactResponse : AWSModel


/**
 <p>The details of the requested contact.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessContact * _Nullable contact;

@end

/**
 
 */
@interface AWSAlexaforbusinessGetDeviceRequest : AWSRequest


/**
 <p>The ARN of the device for which to request details. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessGetDeviceResponse : AWSModel


/**
 <p>The details of the device requested. Required.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessDevice * _Nullable device;

@end

/**
 
 */
@interface AWSAlexaforbusinessGetGatewayGroupRequest : AWSRequest


/**
 <p>The ARN of the gateway group to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayGroupArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessGetGatewayGroupResponse : AWSModel


/**
 <p>The details of the gateway group.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessGatewayGroup * _Nullable gatewayGroup;

@end

/**
 
 */
@interface AWSAlexaforbusinessGetGatewayRequest : AWSRequest


/**
 <p>The ARN of the gateway to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessGetGatewayResponse : AWSModel


/**
 <p>The details of the gateway.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessGateway * _Nullable gateway;

@end

/**
 
 */
@interface AWSAlexaforbusinessGetInvitationConfigurationRequest : AWSRequest


@end

/**
 
 */
@interface AWSAlexaforbusinessGetInvitationConfigurationResponse : AWSModel


/**
 <p>The email ID of the organization or individual contact that the enrolled user can use. </p>
 */
@property (nonatomic, strong) NSString * _Nullable contactEmail;

/**
 <p>The name of the organization sending the enrollment invite to a user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationName;

/**
 <p>The list of private skill IDs that you want to recommend to the user to enable in the invitation.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable privateSkillIds;

@end

/**
 
 */
@interface AWSAlexaforbusinessGetNetworkProfileRequest : AWSRequest


/**
 <p>The ARN of the network profile associated with a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkProfileArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessGetNetworkProfileResponse : AWSModel


/**
 <p>The network profile associated with a device.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessNetworkProfile * _Nullable networkProfile;

@end

/**
 
 */
@interface AWSAlexaforbusinessGetProfileRequest : AWSRequest


/**
 <p>The ARN of the room profile for which to request details. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable profileArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessGetProfileResponse : AWSModel


/**
 <p>The details of the room profile requested. Required.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessProfile * _Nullable profile;

@end

/**
 
 */
@interface AWSAlexaforbusinessGetRoomRequest : AWSRequest


/**
 <p>The ARN of the room for which to request details. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessGetRoomResponse : AWSModel


/**
 <p>The details of the room requested.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessRoom * _Nullable room;

@end

/**
 
 */
@interface AWSAlexaforbusinessGetRoomSkillParameterRequest : AWSRequest


/**
 <p>The room skill parameter key for which to get details. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterKey;

/**
 <p>The ARN of the room from which to get the room skill parameter details. </p>
 */
@property (nonatomic, strong) NSString * _Nullable roomArn;

/**
 <p>The ARN of the skill from which to get the room skill parameter details. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillId;

@end

/**
 
 */
@interface AWSAlexaforbusinessGetRoomSkillParameterResponse : AWSModel


/**
 <p>The details of the room skill parameter requested. Required.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessRoomSkillParameter * _Nullable roomSkillParameter;

@end

/**
 
 */
@interface AWSAlexaforbusinessGetSkillGroupRequest : AWSRequest


/**
 <p>The ARN of the skill group for which to get details. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillGroupArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessGetSkillGroupResponse : AWSModel


/**
 <p>The details of the skill group requested. Required.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessSkillGroup * _Nullable skillGroup;

@end

/**
 <p>The IP endpoint and protocol for calling.</p>
 Required parameters: [Endpoint, CommsProtocol]
 */
@interface AWSAlexaforbusinessIPDialIn : AWSModel


/**
 <p>The protocol, including SIP, SIPS, and H323.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessCommsProtocol commsProtocol;

/**
 <p>The IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpoint;

@end

/**
 <p>Settings for the instant booking feature that are applied to a room profile. When users start their meeting with Alexa, Alexa automatically books the room for the configured duration if the room is available.</p>
 */
@interface AWSAlexaforbusinessInstantBooking : AWSModel


/**
 <p>Duration between 15 and 240 minutes at increments of 15 that determines how long to book an available room when a meeting is started with Alexa. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationInMinutes;

/**
 <p>Whether instant booking is enabled or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 
 */
@interface AWSAlexaforbusinessListBusinessReportSchedulesRequest : AWSRequest


/**
 <p>The maximum number of schedules listed in the call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token used to list the remaining schedules from the previous API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAlexaforbusinessListBusinessReportSchedulesResponse : AWSModel


/**
 <p>The schedule of the reports.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessBusinessReportSchedule *> * _Nullable businessReportSchedules;

/**
 <p>The token used to list the remaining schedules from the previous API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAlexaforbusinessListConferenceProvidersRequest : AWSRequest


/**
 <p>The maximum number of conference providers to be returned, per paginated calls.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The tokens used for pagination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAlexaforbusinessListConferenceProvidersResponse : AWSModel


/**
 <p>The conference providers.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessConferenceProvider *> * _Nullable conferenceProviders;

/**
 <p>The tokens used for pagination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAlexaforbusinessListDeviceEventsRequest : AWSRequest


/**
 <p>The ARN of a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceArn;

/**
 <p>The event type to filter device events. If EventType isn't specified, this returns a list of all device events in reverse chronological order. If EventType is specified, this returns a list of device events for that EventType in reverse chronological order. </p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessDeviceEventType eventType;

/**
 <p>The maximum number of results to include in the response. The default value is 50. If more results exist than the specified MaxResults value, a token is included in the response so that the remaining results can be retrieved. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response only includes results beyond the token, up to the value specified by MaxResults. When the end of results is reached, the response has a value of null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAlexaforbusinessListDeviceEventsResponse : AWSModel


/**
 <p>The device events requested for the device ARN.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessDeviceEvent *> * _Nullable deviceEvents;

/**
 <p>The token returned to indicate that there is more data available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAlexaforbusinessListGatewayGroupsRequest : AWSRequest


/**
 <p>The maximum number of gateway group summaries to return. The default is 50.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token used to paginate though multiple pages of gateway group summaries.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAlexaforbusinessListGatewayGroupsResponse : AWSModel


/**
 <p>The gateway groups in the list.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessGatewayGroupSummary *> * _Nullable gatewayGroups;

/**
 <p>The token used to paginate though multiple pages of gateway group summaries.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAlexaforbusinessListGatewaysRequest : AWSRequest


/**
 <p>The gateway group ARN for which to list gateways.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayGroupArn;

/**
 <p>The maximum number of gateway summaries to return. The default is 50.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token used to paginate though multiple pages of gateway summaries.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAlexaforbusinessListGatewaysResponse : AWSModel


/**
 <p>The gateways in the list.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessGatewaySummary *> * _Nullable gateways;

/**
 <p>The token used to paginate though multiple pages of gateway summaries.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAlexaforbusinessListSkillsRequest : AWSRequest


/**
 <p>Whether the skill is enabled under the user's account.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessEnablementTypeFilter enablementType;

/**
 <p>The maximum number of results to include in the response. If more results exist than the specified <code>MaxResults</code> value, a token is included in the response so that the remaining results can be retrieved.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by <code>MaxResults</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ARN of the skill group for which to list enabled skills.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillGroupArn;

/**
 <p>Whether the skill is publicly available or is a private skill.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessSkillTypeFilter skillType;

@end

/**
 
 */
@interface AWSAlexaforbusinessListSkillsResponse : AWSModel


/**
 <p>The token returned to indicate that there is more data available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of enabled skills requested. Required.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessSkillSummary *> * _Nullable skillSummaries;

@end

/**
 
 */
@interface AWSAlexaforbusinessListSkillsStoreCategoriesRequest : AWSRequest


/**
 <p>The maximum number of categories returned, per paginated calls.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The tokens used for pagination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAlexaforbusinessListSkillsStoreCategoriesResponse : AWSModel


/**
 <p>The list of categories.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessCategory *> * _Nullable categoryList;

/**
 <p>The tokens used for pagination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAlexaforbusinessListSkillsStoreSkillsByCategoryRequest : AWSRequest


/**
 <p>The category ID for which the skills are being retrieved from the skill store.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable categoryId;

/**
 <p>The maximum number of skills returned per paginated calls.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The tokens used for pagination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAlexaforbusinessListSkillsStoreSkillsByCategoryResponse : AWSModel


/**
 <p>The tokens used for pagination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The skill store skills.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessSkillsStoreSkill *> * _Nullable skillsStoreSkills;

@end

/**
 
 */
@interface AWSAlexaforbusinessListSmartHomeAppliancesRequest : AWSRequest


/**
 <p>The maximum number of appliances to be returned, per paginated calls.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The tokens used for pagination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The room that the appliances are associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessListSmartHomeAppliancesResponse : AWSModel


/**
 <p>The tokens used for pagination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The smart home appliances.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessSmartHomeAppliance *> * _Nullable smartHomeAppliances;

@end

/**
 
 */
@interface AWSAlexaforbusinessListTagsRequest : AWSRequest


/**
 <p>The ARN of the specified resource for which to list tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The maximum number of results to include in the response. If more results exist than the specified <code>MaxResults</code> value, a token is included in the response so that the remaining results can be retrieved.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by <code>MaxResults</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAlexaforbusinessListTagsResponse : AWSModel


/**
 <p>The token returned to indicate that there is more data available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The tags requested for the specified resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessTag *> * _Nullable tags;

@end

/**
 <p>Meeting room settings of a room profile.</p>
 */
@interface AWSAlexaforbusinessMeetingRoomConfiguration : AWSModel


/**
 <p>Settings for the end of meeting reminder feature that are applied to a room profile. The end of meeting reminder enables Alexa to remind users when a meeting is ending. </p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessEndOfMeetingReminder * _Nullable endOfMeetingReminder;

/**
 <p>Settings to automatically book the room if available for a configured duration when joining a meeting with Alexa. </p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessInstantBooking * _Nullable instantBooking;

/**
 <p>Settings for requiring a check in when a room is reserved. Alexa can cancel a room reservation if it's not checked into. This makes the room available for others. Users can check in by joining the meeting with Alexa or an AVS device, or by saying “Alexa, check in.” </p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessRequireCheckIn * _Nullable requireCheckIn;

/**
 <p>Whether room utilization metrics are enabled or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable roomUtilizationMetricsEnabled;

@end

/**
 <p>The values that indicate whether a pin is always required (YES), never required (NO), or OPTIONAL.</p><ul><li><p>If YES, Alexa will always ask for a meeting pin.</p></li><li><p>If NO, Alexa will never ask for a meeting pin.</p></li><li><p>If OPTIONAL, Alexa will ask if you have a meeting pin and if the customer responds with yes, it will ask for the meeting pin.</p></li></ul>
 Required parameters: [RequirePin]
 */
@interface AWSAlexaforbusinessMeetingSetting : AWSModel


/**
 <p>The values that indicate whether the pin is always required.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessRequirePin requirePin;

@end

/**
 <p>The network profile associated with a device.</p>
 */
@interface AWSAlexaforbusinessNetworkProfile : AWSModel


/**
 <p>The ARN of the Private Certificate Authority (PCA) created in AWS Certificate Manager (ACM). This is used to issue certificates to the devices. </p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateAuthorityArn;

/**
 <p>The current password of the Wi-Fi network.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentPassword;

/**
 <p>Detailed information about a device's network profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The authentication standard that is used in the EAP framework. Currently, EAP_TLS is supported. </p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessNetworkEapMethod eapMethod;

/**
 <p>The ARN of the network profile associated with a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkProfileArn;

/**
 <p>The name of the network profile associated with a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkProfileName;

/**
 <p>The next, or subsequent, password of the Wi-Fi network. This password is asynchronously transmitted to the device and is used when the password of the network changes to NextPassword. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPassword;

/**
 <p>The security type of the Wi-Fi network. This can be WPA2_ENTERPRISE, WPA2_PSK, WPA_PSK, WEP, or OPEN.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessNetworkSecurityType securityType;

/**
 <p>The SSID of the Wi-Fi network.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ssid;

/**
 <p>The root certificates of your authentication server, which is installed on your devices and used to trust your authentication server during EAP negotiation.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable trustAnchors;

@end

/**
 <p>The data associated with a network profile.</p>
 */
@interface AWSAlexaforbusinessNetworkProfileData : AWSModel


/**
 <p>The ARN of the Private Certificate Authority (PCA) created in AWS Certificate Manager (ACM). This is used to issue certificates to the devices.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateAuthorityArn;

/**
 <p>Detailed information about a device's network profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The authentication standard that is used in the EAP framework. Currently, EAP_TLS is supported.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessNetworkEapMethod eapMethod;

/**
 <p>The ARN of the network profile associated with a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkProfileArn;

/**
 <p>The name of the network profile associated with a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkProfileName;

/**
 <p>The security type of the Wi-Fi network. This can be WPA2_ENTERPRISE, WPA2_PSK, WPA_PSK, WEP, or OPEN.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessNetworkSecurityType securityType;

/**
 <p>The SSID of the Wi-Fi network.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ssid;

@end

/**
 <p>The information for public switched telephone network (PSTN) conferencing.</p>
 Required parameters: [CountryCode, PhoneNumber, OneClickIdDelay, OneClickPinDelay]
 */
@interface AWSAlexaforbusinessPSTNDialIn : AWSModel


/**
 <p>The zip code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable countryCode;

/**
 <p>The delay duration before Alexa enters the conference ID with dual-tone multi-frequency (DTMF). Each number on the dial pad corresponds to a DTMF tone, which is how we send data over the telephone network.</p>
 */
@property (nonatomic, strong) NSString * _Nullable oneClickIdDelay;

/**
 <p>The delay duration before Alexa enters the conference pin with dual-tone multi-frequency (DTMF). Each number on the dial pad corresponds to a DTMF tone, which is how we send data over the telephone network.</p>
 */
@property (nonatomic, strong) NSString * _Nullable oneClickPinDelay;

/**
 <p>The phone number to call to join the conference.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumber;

@end

/**
 <p>The phone number for the contact containing the raw number and phone number type.</p>
 Required parameters: [Number, Type]
 */
@interface AWSAlexaforbusinessPhoneNumber : AWSModel


/**
 <p>The raw value of the phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable number;

/**
 <p>The type of the phone number.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessPhoneNumberType types;

@end

/**
 <p>A room profile with attributes.</p>
 */
@interface AWSAlexaforbusinessProfile : AWSModel


/**
 <p>The address of a room profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable address;

/**
 <p>The ARN of the address book.</p>
 */
@property (nonatomic, strong) NSString * _Nullable addressBookArn;

/**
 <p>The distance unit of a room profile.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessDistanceUnit distanceUnit;

/**
 <p>Retrieves if the profile is default or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefault;

/**
 <p>The locale of a room profile. (This is currently available only to a limited preview audience.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable locale;

/**
 <p>The max volume limit of a room profile.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxVolumeLimit;

/**
 <p>Meeting room settings of a room profile.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessMeetingRoomConfiguration * _Nullable meetingRoomConfiguration;

/**
 <p>The PSTN setting of a room profile.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable PSTNEnabled;

/**
 <p>The ARN of a room profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable profileArn;

/**
 <p>The name of a room profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable profileName;

/**
 <p>The setup mode of a room profile.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setupModeDisabled;

/**
 <p>The temperature unit of a room profile.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessTemperatureUnit temperatureUnit;

/**
 <p>The time zone of a room profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timezone;

/**
 <p>The wake word of a room profile.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessWakeWord wakeWord;

@end

/**
 <p>The data of a room profile.</p>
 */
@interface AWSAlexaforbusinessProfileData : AWSModel


/**
 <p>The address of a room profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable address;

/**
 <p>The distance unit of a room profile.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessDistanceUnit distanceUnit;

/**
 <p>Retrieves if the profile data is default or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefault;

/**
 <p>The locale of a room profile. (This is currently available only to a limited preview audience.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable locale;

/**
 <p>The ARN of a room profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable profileArn;

/**
 <p>The name of a room profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable profileName;

/**
 <p>The temperature unit of a room profile.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessTemperatureUnit temperatureUnit;

/**
 <p>The time zone of a room profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timezone;

/**
 <p>The wake word of a room profile.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessWakeWord wakeWord;

@end

/**
 
 */
@interface AWSAlexaforbusinessPutConferencePreferenceRequest : AWSRequest


/**
 <p>The conference preference of a specific conference provider.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessConferencePreference * _Nullable conferencePreference;

@end

/**
 
 */
@interface AWSAlexaforbusinessPutConferencePreferenceResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessPutInvitationConfigurationRequest : AWSRequest


/**
 <p>The email ID of the organization or individual contact that the enrolled user can use. </p>
 */
@property (nonatomic, strong) NSString * _Nullable contactEmail;

/**
 <p>The name of the organization sending the enrollment invite to a user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationName;

/**
 <p>The list of private skill IDs that you want to recommend to the user to enable in the invitation.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable privateSkillIds;

@end

/**
 
 */
@interface AWSAlexaforbusinessPutInvitationConfigurationResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessPutRoomSkillParameterRequest : AWSRequest


/**
 <p>The ARN of the room associated with the room skill parameter. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomArn;

/**
 <p>The updated room skill parameter. Required.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessRoomSkillParameter * _Nullable roomSkillParameter;

/**
 <p>The ARN of the skill associated with the room skill parameter. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillId;

@end

/**
 
 */
@interface AWSAlexaforbusinessPutRoomSkillParameterResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessPutSkillAuthorizationRequest : AWSRequest


/**
 <p>The authorization result specific to OAUTH code grant output. "Code” must be populated in the AuthorizationResult map to establish the authorization.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable authorizationResult;

/**
 <p>The room that the skill is authorized for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomArn;

/**
 <p>The unique identifier of a skill.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillId;

@end

/**
 
 */
@interface AWSAlexaforbusinessPutSkillAuthorizationResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessRegisterAVSDeviceRequest : AWSRequest


/**
 <p>The device type ID for your AVS device generated by Amazon when the OEM creates a new product on Amazon's Developer Console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable amazonId;

/**
 <p>The client ID of the OEM used for code-based linking authorization on an AVS device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The key generated by the OEM that uniquely identifies a specified instance of your AVS device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceSerialNumber;

/**
 <p>The product ID used to identify your AVS device during authorization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

/**
 <p>The code that is obtained after your AVS device has made a POST request to LWA as a part of the Device Authorization Request component of the OAuth code-based linking specification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userCode;

@end

/**
 
 */
@interface AWSAlexaforbusinessRegisterAVSDeviceResponse : AWSModel


/**
 <p>The ARN of the device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessRejectSkillRequest : AWSRequest


/**
 <p>The unique identifier of the skill.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillId;

@end

/**
 
 */
@interface AWSAlexaforbusinessRejectSkillResponse : AWSModel


@end

/**
 <p>Settings for the require check in feature that are applied to a room profile. Require check in allows a meeting room’s Alexa or AVS device to prompt the user to check in; otherwise, the room will be released. </p>
 */
@interface AWSAlexaforbusinessRequireCheckIn : AWSModel


/**
 <p>Whether require check in is enabled or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>Duration between 5 and 20 minutes to determine when to release the room if it's not checked into. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable releaseAfterMinutes;

@end

/**
 
 */
@interface AWSAlexaforbusinessResolveRoomRequest : AWSRequest


/**
 <p>The ARN of the skill that was requested. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillId;

/**
 <p>The ARN of the user. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSAlexaforbusinessResolveRoomResponse : AWSModel


/**
 <p>The ARN of the room from which the skill request was invoked.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomArn;

/**
 <p>The name of the room from which the skill request was invoked.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomName;

/**
 <p>Response to get the room profile request. Required.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessRoomSkillParameter *> * _Nullable roomSkillParameters;

@end

/**
 
 */
@interface AWSAlexaforbusinessRevokeInvitationRequest : AWSRequest


/**
 <p>The ARN of the enrollment invitation to revoke. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable enrollmentId;

/**
 <p>The ARN of the user for whom to revoke an enrollment invitation. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessRevokeInvitationResponse : AWSModel


@end

/**
 <p>A room with attributes.</p>
 */
@interface AWSAlexaforbusinessRoom : AWSModel


/**
 <p>The description of a room.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The profile ARN of a room.</p>
 */
@property (nonatomic, strong) NSString * _Nullable profileArn;

/**
 <p>The provider calendar ARN of a room.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerCalendarId;

/**
 <p>The ARN of a room.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomArn;

/**
 <p>The name of a room.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomName;

@end

/**
 <p>The data of a room.</p>
 */
@interface AWSAlexaforbusinessRoomData : AWSModel


/**
 <p>The description of a room.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The profile ARN of a room.</p>
 */
@property (nonatomic, strong) NSString * _Nullable profileArn;

/**
 <p>The profile name of a room.</p>
 */
@property (nonatomic, strong) NSString * _Nullable profileName;

/**
 <p>The provider calendar ARN of a room.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerCalendarId;

/**
 <p>The ARN of a room.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomArn;

/**
 <p>The name of a room.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomName;

@end

/**
 <p>A skill parameter associated with a room.</p>
 Required parameters: [ParameterKey, ParameterValue]
 */
@interface AWSAlexaforbusinessRoomSkillParameter : AWSModel


/**
 <p>The parameter key of a room skill parameter. ParameterKey is an enumerated type that only takes “DEFAULT” or “SCOPE” as valid values.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterKey;

/**
 <p>The parameter value of a room skill parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterValue;

@end

/**
 
 */
@interface AWSAlexaforbusinessSearchAddressBooksRequest : AWSRequest


/**
 <p>The filters to use to list a specified set of address books. The supported filter key is AddressBookName.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessFilter *> * _Nullable filters;

/**
 <p>The maximum number of results to include in the response. If more results exist than the specified MaxResults value, a token is included in the response so that the remaining results can be retrieved.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response only includes results beyond the token, up to the value specified by MaxResults.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The sort order to use in listing the specified set of address books. The supported sort key is AddressBookName.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessSort *> * _Nullable sortCriteria;

@end

/**
 
 */
@interface AWSAlexaforbusinessSearchAddressBooksResponse : AWSModel


/**
 <p>The address books that meet the specified set of filter criteria, in sort order.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessAddressBookData *> * _Nullable addressBooks;

/**
 <p>The token returned to indicate that there is more data available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The total number of address books returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalCount;

@end

/**
 
 */
@interface AWSAlexaforbusinessSearchContactsRequest : AWSRequest


/**
 <p>The filters to use to list a specified set of address books. The supported filter keys are DisplayName, FirstName, LastName, and AddressBookArns.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessFilter *> * _Nullable filters;

/**
 <p>The maximum number of results to include in the response. If more results exist than the specified MaxResults value, a token is included in the response so that the remaining results can be retrieved.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response only includes results beyond the token, up to the value specified by MaxResults.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The sort order to use in listing the specified set of contacts. The supported sort keys are DisplayName, FirstName, and LastName.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessSort *> * _Nullable sortCriteria;

@end

/**
 
 */
@interface AWSAlexaforbusinessSearchContactsResponse : AWSModel


/**
 <p>The contacts that meet the specified set of filter criteria, in sort order.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessContactData *> * _Nullable contacts;

/**
 <p>The token returned to indicate that there is more data available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The total number of contacts returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalCount;

@end

/**
 
 */
@interface AWSAlexaforbusinessSearchDevicesRequest : AWSRequest


/**
 <p>The filters to use to list a specified set of devices. Supported filter keys are DeviceName, DeviceStatus, DeviceStatusDetailCode, RoomName, DeviceType, DeviceSerialNumber, UnassociatedOnly, ConnectionStatus (ONLINE and OFFLINE), NetworkProfileName, NetworkProfileArn, Feature, and FailureCode.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessFilter *> * _Nullable filters;

/**
 <p>The maximum number of results to include in the response. If more results exist than the specified <code>MaxResults</code> value, a token is included in the response so that the remaining results can be retrieved.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by <code>MaxResults</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The sort order to use in listing the specified set of devices. Supported sort keys are DeviceName, DeviceStatus, RoomName, DeviceType, DeviceSerialNumber, ConnectionStatus, NetworkProfileName, NetworkProfileArn, Feature, and FailureCode.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessSort *> * _Nullable sortCriteria;

@end

/**
 
 */
@interface AWSAlexaforbusinessSearchDevicesResponse : AWSModel


/**
 <p>The devices that meet the specified set of filter criteria, in sort order.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessDeviceData *> * _Nullable devices;

/**
 <p>The token returned to indicate that there is more data available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The total number of devices returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalCount;

@end

/**
 
 */
@interface AWSAlexaforbusinessSearchNetworkProfilesRequest : AWSRequest


/**
 <p>The filters to use to list a specified set of network profiles. Valid filters are NetworkProfileName, Ssid, and SecurityType.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessFilter *> * _Nullable filters;

/**
 <p>The maximum number of results to include in the response. If more results exist than the specified MaxResults value, a token is included in the response so that the remaining results can be retrieved. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by MaxResults. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The sort order to use to list the specified set of network profiles. Valid sort criteria includes NetworkProfileName, Ssid, and SecurityType.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessSort *> * _Nullable sortCriteria;

@end

/**
 
 */
@interface AWSAlexaforbusinessSearchNetworkProfilesResponse : AWSModel


/**
 <p>The network profiles that meet the specified set of filter criteria, in sort order. It is a list of NetworkProfileData objects. </p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessNetworkProfileData *> * _Nullable networkProfiles;

/**
 <p>An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by MaxResults.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The total number of network profiles returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalCount;

@end

/**
 
 */
@interface AWSAlexaforbusinessSearchProfilesRequest : AWSRequest


/**
 <p>The filters to use to list a specified set of room profiles. Supported filter keys are ProfileName and Address. Required. </p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessFilter *> * _Nullable filters;

/**
 <p>The maximum number of results to include in the response. If more results exist than the specified <code>MaxResults</code> value, a token is included in the response so that the remaining results can be retrieved.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by <code>MaxResults</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The sort order to use in listing the specified set of room profiles. Supported sort keys are ProfileName and Address.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessSort *> * _Nullable sortCriteria;

@end

/**
 
 */
@interface AWSAlexaforbusinessSearchProfilesResponse : AWSModel


/**
 <p>The token returned to indicate that there is more data available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The profiles that meet the specified set of filter criteria, in sort order.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessProfileData *> * _Nullable profiles;

/**
 <p>The total number of room profiles returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalCount;

@end

/**
 
 */
@interface AWSAlexaforbusinessSearchRoomsRequest : AWSRequest


/**
 <p>The filters to use to list a specified set of rooms. The supported filter keys are RoomName and ProfileName.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessFilter *> * _Nullable filters;

/**
 <p>The maximum number of results to include in the response. If more results exist than the specified <code>MaxResults</code> value, a token is included in the response so that the remaining results can be retrieved. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by <code>MaxResults</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The sort order to use in listing the specified set of rooms. The supported sort keys are RoomName and ProfileName.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessSort *> * _Nullable sortCriteria;

@end

/**
 
 */
@interface AWSAlexaforbusinessSearchRoomsResponse : AWSModel


/**
 <p>The token returned to indicate that there is more data available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The rooms that meet the specified set of filter criteria, in sort order.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessRoomData *> * _Nullable rooms;

/**
 <p>The total number of rooms returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalCount;

@end

/**
 
 */
@interface AWSAlexaforbusinessSearchSkillGroupsRequest : AWSRequest


/**
 <p>The filters to use to list a specified set of skill groups. The supported filter key is SkillGroupName. </p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessFilter *> * _Nullable filters;

/**
 <p>The maximum number of results to include in the response. If more results exist than the specified <code>MaxResults</code> value, a token is included in the response so that the remaining results can be retrieved. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by <code>MaxResults</code>. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The sort order to use in listing the specified set of skill groups. The supported sort key is SkillGroupName. </p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessSort *> * _Nullable sortCriteria;

@end

/**
 
 */
@interface AWSAlexaforbusinessSearchSkillGroupsResponse : AWSModel


/**
 <p>The token returned to indicate that there is more data available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The skill groups that meet the filter criteria, in sort order.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessSkillGroupData *> * _Nullable skillGroups;

/**
 <p>The total number of skill groups returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalCount;

@end

/**
 
 */
@interface AWSAlexaforbusinessSearchUsersRequest : AWSRequest


/**
 <p>The filters to use for listing a specific set of users. Required. Supported filter keys are UserId, FirstName, LastName, Email, and EnrollmentStatus.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessFilter *> * _Nullable filters;

/**
 <p>The maximum number of results to include in the response. If more results exist than the specified <code>MaxResults</code> value, a token is included in the response so that the remaining results can be retrieved. Required.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by <code>MaxResults</code>. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The sort order to use in listing the filtered set of users. Required. Supported sort keys are UserId, FirstName, LastName, Email, and EnrollmentStatus.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessSort *> * _Nullable sortCriteria;

@end

/**
 
 */
@interface AWSAlexaforbusinessSearchUsersResponse : AWSModel


/**
 <p>The token returned to indicate that there is more data available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The total number of users returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalCount;

/**
 <p>The users that meet the specified set of filter criteria, in sort order.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessUserData *> * _Nullable users;

@end

/**
 
 */
@interface AWSAlexaforbusinessSendAnnouncementRequest : AWSRequest


/**
 <p>The unique, user-specified identifier for the request that ensures idempotency.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The announcement content. This can contain only one of the three possible announcement types (text, SSML or audio).</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessContent * _Nullable content;

/**
 <p>The filters to use to send an announcement to a specified list of rooms. The supported filter keys are RoomName, ProfileName, RoomArn, and ProfileArn. To send to all rooms, specify an empty RoomFilters list.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessFilter *> * _Nullable roomFilters;

/**
 <p>The time to live for an announcement. Default is 300. If delivery doesn't occur within this time, the announcement is not delivered.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeToLiveInSeconds;

@end

/**
 
 */
@interface AWSAlexaforbusinessSendAnnouncementResponse : AWSModel


/**
 <p>The identifier of the announcement.</p>
 */
@property (nonatomic, strong) NSString * _Nullable announcementArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessSendInvitationRequest : AWSRequest


/**
 <p>The ARN of the user to whom to send an invitation. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessSendInvitationResponse : AWSModel


@end

/**
 <p>The SIP address for the contact containing the URI and SIP address type.</p>
 Required parameters: [Uri, Type]
 */
@interface AWSAlexaforbusinessSipAddress : AWSModel


/**
 <p>The type of the SIP address.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessSipType types;

/**
 <p>The URI for the SIP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uri;

@end

/**
 <p>Granular information about the skill.</p>
 */
@interface AWSAlexaforbusinessSkillDetails : AWSModel


/**
 <p>The details about what the skill supports organized as bullet points.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable bulletPoints;

/**
 <p>The details about the developer that published the skill.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessDeveloperInfo * _Nullable developerInfo;

/**
 <p>The URL of the end user license agreement.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endUserLicenseAgreement;

/**
 <p>The generic keywords associated with the skill that can be used to find a skill.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable genericKeywords;

/**
 <p>The phrase used to trigger the skill.</p>
 */
@property (nonatomic, strong) NSString * _Nullable invocationPhrase;

/**
 <p>The updates added in bullet points.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable latestInThisVersionBulletPoints;

/**
 <p>The description of the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productDescription;

/**
 <p>The date when the skill was released.</p>
 */
@property (nonatomic, strong) NSString * _Nullable releaseDate;

/**
 <p><i>This member has been deprecated.</i></p><p>The list of reviews for the skill, including Key and Value pair.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable reviews;

/**
 <p>The types of skills.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable skillTypes;

@end

/**
 <p>A skill group with attributes.</p>
 */
@interface AWSAlexaforbusinessSkillGroup : AWSModel


/**
 <p>The description of a skill group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN of a skill group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillGroupArn;

/**
 <p>The name of a skill group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillGroupName;

@end

/**
 <p>The attributes of a skill group.</p>
 */
@interface AWSAlexaforbusinessSkillGroupData : AWSModel


/**
 <p>The description of a skill group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The skill group ARN of a skill group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillGroupArn;

/**
 <p>The skill group name of a skill group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillGroupName;

@end

/**
 <p>The summary of skills.</p>
 */
@interface AWSAlexaforbusinessSkillSummary : AWSModel


/**
 <p>Whether the skill is enabled under the user's account, or if it requires linking to be used.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessEnablementType enablementType;

/**
 <p>The ARN of the skill summary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillId;

/**
 <p>The name of the skill.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillName;

/**
 <p>Whether the skill is publicly available or is a private skill.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessSkillType skillType;

/**
 <p>Linking support for a skill.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable supportsLinking;

@end

/**
 <p>The detailed information about an Alexa skill.</p>
 */
@interface AWSAlexaforbusinessSkillsStoreSkill : AWSModel


/**
 <p>The URL where the skill icon resides.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iconUrl;

/**
 <p>Sample utterances that interact with the skill.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable sampleUtterances;

/**
 <p>Short description about the skill.</p>
 */
@property (nonatomic, strong) NSString * _Nullable shortDescription;

/**
 <p>Information about the skill.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessSkillDetails * _Nullable skillDetails;

/**
 <p>The ARN of the skill.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillId;

/**
 <p>The name of the skill.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillName;

/**
 <p>Linking support for a skill.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable supportsLinking;

@end

/**
 <p>A smart home appliance that can connect to a central system. Any domestic device can be a smart appliance. </p>
 */
@interface AWSAlexaforbusinessSmartHomeAppliance : AWSModel


/**
 <p>The description of the smart home appliance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The friendly name of the smart home appliance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable friendlyName;

/**
 <p>The name of the manufacturer of the smart home appliance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable manufacturerName;

@end

/**
 <p>An object representing a sort criteria. </p>
 Required parameters: [Key, Value]
 */
@interface AWSAlexaforbusinessSort : AWSModel


/**
 <p>The sort key of a sort object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The sort value of a sort object.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessSortValue value;

@end

/**
 <p>The SSML message. For more information, see <a href="https://developer.amazon.com/docs/custom-skills/speech-synthesis-markup-language-ssml-reference.html">SSML Reference</a>.</p>
 Required parameters: [Locale, Value]
 */
@interface AWSAlexaforbusinessSsml : AWSModel


/**
 <p>The locale of the SSML message. Currently, en-US is supported.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessLocale locale;

/**
 <p>The value of the SSML message in the correct SSML format. The audio tag is not supported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSAlexaforbusinessStartDeviceSyncRequest : AWSRequest


/**
 <p>The ARN of the device to sync. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceArn;

/**
 <p>Request structure to start the device sync. Required.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable features;

/**
 <p>The ARN of the room with which the device to sync is associated. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessStartDeviceSyncResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryRequest : AWSRequest


/**
 <p>The room where smart home appliance discovery was initiated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomArn;

@end

/**
 
 */
@interface AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryResponse : AWSModel


@end

/**
 <p>A key-value pair that can be associated with a resource. </p>
 Required parameters: [Key, Value]
 */
@interface AWSAlexaforbusinessTag : AWSModel


/**
 <p>The key of a tag. Tag keys are case-sensitive. </p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value of a tag. Tag values are case sensitive and can be null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSAlexaforbusinessTagResourceRequest : AWSRequest


/**
 <p>The ARN of the resource to which to add metadata tags. Required. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The tags to be added to the specified resource. Do not provide system tags. Required. </p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSAlexaforbusinessTagResourceResponse : AWSModel


@end

/**
 <p>The text message.</p>
 Required parameters: [Locale, Value]
 */
@interface AWSAlexaforbusinessText : AWSModel


/**
 <p>The locale of the text message. Currently, en-US is supported.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessLocale locale;

/**
 <p>The value of the text message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSAlexaforbusinessUntagResourceRequest : AWSRequest


/**
 <p>The ARN of the resource from which to remove metadata tags. Required. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The tags to be removed from the specified resource. Do not provide system tags. Required. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSAlexaforbusinessUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessUpdateAddressBookRequest : AWSRequest


/**
 <p>The ARN of the room to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable addressBookArn;

/**
 <p>The updated description of the room.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The updated name of the room.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSAlexaforbusinessUpdateAddressBookResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessUpdateBusinessReportScheduleRequest : AWSRequest


/**
 <p>The format of the generated report (individual CSV files or zipped files of individual files).</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessBusinessReportFormat format;

/**
 <p>The recurrence of the reports.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessBusinessReportRecurrence * _Nullable recurrence;

/**
 <p>The S3 location of the output reports.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3BucketName;

/**
 <p>The S3 key where the report is delivered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3KeyPrefix;

/**
 <p>The ARN of the business report schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleArn;

/**
 <p>The name identifier of the schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleName;

@end

/**
 
 */
@interface AWSAlexaforbusinessUpdateBusinessReportScheduleResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessUpdateConferenceProviderRequest : AWSRequest


/**
 <p>The ARN of the conference provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable conferenceProviderArn;

/**
 <p>The type of the conference provider.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessConferenceProviderType conferenceProviderType;

/**
 <p>The IP endpoint and protocol for calling.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessIPDialIn * _Nullable IPDialIn;

/**
 <p>The meeting settings for the conference provider.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessMeetingSetting * _Nullable meetingSetting;

/**
 <p>The information for PSTN conferencing.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessPSTNDialIn * _Nullable PSTNDialIn;

@end

/**
 
 */
@interface AWSAlexaforbusinessUpdateConferenceProviderResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessUpdateContactRequest : AWSRequest


/**
 <p>The ARN of the contact to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactArn;

/**
 <p>The updated display name of the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The updated first name of the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable firstName;

/**
 <p>The updated last name of the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastName;

/**
 <p>The updated phone number of the contact. The phone number type defaults to WORK. You can either specify PhoneNumber or PhoneNumbers. We recommend that you use PhoneNumbers, which lets you specify the phone number type and multiple numbers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumber;

/**
 <p>The list of phone numbers for the contact.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessPhoneNumber *> * _Nullable phoneNumbers;

/**
 <p>The list of SIP addresses for the contact.</p>
 */
@property (nonatomic, strong) NSArray<AWSAlexaforbusinessSipAddress *> * _Nullable sipAddresses;

@end

/**
 
 */
@interface AWSAlexaforbusinessUpdateContactResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessUpdateDeviceRequest : AWSRequest


/**
 <p>The ARN of the device to update. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceArn;

/**
 <p>The updated device name. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceName;

@end

/**
 
 */
@interface AWSAlexaforbusinessUpdateDeviceResponse : AWSModel


@end

/**
 <p>Settings for the end of meeting reminder feature that are applied to a room profile. The end of meeting reminder enables Alexa to remind users when a meeting is ending. </p>
 */
@interface AWSAlexaforbusinessUpdateEndOfMeetingReminder : AWSModel


/**
 <p>Whether an end of meeting reminder is enabled or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>Updates settings for the end of meeting reminder feature that are applied to a room profile. The end of meeting reminder enables Alexa to remind users when a meeting is ending. </p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable reminderAtMinutes;

/**
 <p>The type of sound that users hear during the end of meeting reminder. </p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessEndOfMeetingReminderType reminderType;

@end

/**
 
 */
@interface AWSAlexaforbusinessUpdateGatewayGroupRequest : AWSRequest


/**
 <p>The updated description of the gateway group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN of the gateway group to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayGroupArn;

/**
 <p>The updated name of the gateway group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSAlexaforbusinessUpdateGatewayGroupResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessUpdateGatewayRequest : AWSRequest


/**
 <p>The updated description of the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN of the gateway to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayArn;

/**
 <p>The updated name of the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The updated software version of the gateway. The gateway automatically updates its software version during normal operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable softwareVersion;

@end

/**
 
 */
@interface AWSAlexaforbusinessUpdateGatewayResponse : AWSModel


@end

/**
 <p>Updates settings for the instant booking feature that are applied to a room profile. If instant booking is enabled, Alexa automatically reserves a room if it is free when a user joins a meeting with Alexa.</p>
 */
@interface AWSAlexaforbusinessUpdateInstantBooking : AWSModel


/**
 <p>Duration between 15 and 240 minutes at increments of 15 that determines how long to book an available room when a meeting is started with Alexa.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationInMinutes;

/**
 <p>Whether instant booking is enabled or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 <p>Updates meeting room settings of a room profile.</p>
 */
@interface AWSAlexaforbusinessUpdateMeetingRoomConfiguration : AWSModel


/**
 <p>Settings for the end of meeting reminder feature that are applied to a room profile. The end of meeting reminder enables Alexa to remind users when a meeting is ending. </p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessUpdateEndOfMeetingReminder * _Nullable endOfMeetingReminder;

/**
 <p>Settings to automatically book an available room available for a configured duration when joining a meeting with Alexa.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessUpdateInstantBooking * _Nullable instantBooking;

/**
 <p>Settings for requiring a check in when a room is reserved. Alexa can cancel a room reservation if it's not checked into to make the room available for others. Users can check in by joining the meeting with Alexa or an AVS device, or by saying “Alexa, check in.” </p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessUpdateRequireCheckIn * _Nullable requireCheckIn;

/**
 <p>Whether room utilization metrics are enabled or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable roomUtilizationMetricsEnabled;

@end

/**
 
 */
@interface AWSAlexaforbusinessUpdateNetworkProfileRequest : AWSRequest


/**
 <p>The ARN of the Private Certificate Authority (PCA) created in AWS Certificate Manager (ACM). This is used to issue certificates to the devices. </p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateAuthorityArn;

/**
 <p>The current password of the Wi-Fi network.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentPassword;

/**
 <p>Detailed information about a device's network profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN of the network profile associated with a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkProfileArn;

/**
 <p>The name of the network profile associated with a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkProfileName;

/**
 <p>The next, or subsequent, password of the Wi-Fi network. This password is asynchronously transmitted to the device and is used when the password of the network changes to NextPassword. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPassword;

/**
 <p>The root certificate(s) of your authentication server that will be installed on your devices and used to trust your authentication server during EAP negotiation. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable trustAnchors;

@end

/**
 
 */
@interface AWSAlexaforbusinessUpdateNetworkProfileResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessUpdateProfileRequest : AWSRequest


/**
 <p>The updated address for the room profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable address;

/**
 <p>The updated distance unit for the room profile.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessDistanceUnit distanceUnit;

/**
 <p>Sets the profile as default if selected. If this is missing, no update is done to the default status.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefault;

/**
 <p>The updated locale for the room profile. (This is currently only available to a limited preview audience.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable locale;

/**
 <p>The updated maximum volume limit for the room profile.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxVolumeLimit;

/**
 <p>The updated meeting room settings of a room profile.</p>
 */
@property (nonatomic, strong) AWSAlexaforbusinessUpdateMeetingRoomConfiguration * _Nullable meetingRoomConfiguration;

/**
 <p>Whether the PSTN setting of the room profile is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable PSTNEnabled;

/**
 <p>The ARN of the room profile to update. Required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable profileArn;

/**
 <p>The updated name for the room profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable profileName;

/**
 <p>Whether the setup mode of the profile is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setupModeDisabled;

/**
 <p>The updated temperature unit for the room profile.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessTemperatureUnit temperatureUnit;

/**
 <p>The updated timezone for the room profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timezone;

/**
 <p>The updated wake word for the room profile.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessWakeWord wakeWord;

@end

/**
 
 */
@interface AWSAlexaforbusinessUpdateProfileResponse : AWSModel


@end

/**
 <p>Updates settings for the require check in feature that are applied to a room profile. Require check in allows a meeting room’s Alexa or AVS device to prompt the user to check in; otherwise, the room will be released. </p>
 */
@interface AWSAlexaforbusinessUpdateRequireCheckIn : AWSModel


/**
 <p>Whether require check in is enabled or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>Duration between 5 and 20 minutes to determine when to release the room if it's not checked into. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable releaseAfterMinutes;

@end

/**
 
 */
@interface AWSAlexaforbusinessUpdateRoomRequest : AWSRequest


/**
 <p>The updated description for the room.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The updated profile ARN for the room.</p>
 */
@property (nonatomic, strong) NSString * _Nullable profileArn;

/**
 <p>The updated provider calendar ARN for the room.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerCalendarId;

/**
 <p>The ARN of the room to update. </p>
 */
@property (nonatomic, strong) NSString * _Nullable roomArn;

/**
 <p>The updated name for the room.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomName;

@end

/**
 
 */
@interface AWSAlexaforbusinessUpdateRoomResponse : AWSModel


@end

/**
 
 */
@interface AWSAlexaforbusinessUpdateSkillGroupRequest : AWSRequest


/**
 <p>The updated description for the skill group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN of the skill group to update. </p>
 */
@property (nonatomic, strong) NSString * _Nullable skillGroupArn;

/**
 <p>The updated name for the skill group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable skillGroupName;

@end

/**
 
 */
@interface AWSAlexaforbusinessUpdateSkillGroupResponse : AWSModel


@end

/**
 <p>Information related to a user.</p>
 */
@interface AWSAlexaforbusinessUserData : AWSModel


/**
 <p>The email of a user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>The enrollment ARN of a user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable enrollmentId;

/**
 <p>The enrollment status of a user.</p>
 */
@property (nonatomic, assign) AWSAlexaforbusinessEnrollmentStatus enrollmentStatus;

/**
 <p>The first name of a user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable firstName;

/**
 <p>The last name of a user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastName;

/**
 <p>The ARN of a user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userArn;

@end

NS_ASSUME_NONNULL_END
