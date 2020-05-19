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

FOUNDATION_EXPORT NSString *const AWSChimeErrorDomain;

typedef NS_ENUM(NSInteger, AWSChimeErrorType) {
    AWSChimeErrorUnknown,
    AWSChimeErrorAccessDenied,
    AWSChimeErrorBadRequest,
    AWSChimeErrorConflict,
    AWSChimeErrorForbidden,
    AWSChimeErrorNotFound,
    AWSChimeErrorResourceLimitExceeded,
    AWSChimeErrorServiceFailure,
    AWSChimeErrorServiceUnavailable,
    AWSChimeErrorThrottledClient,
    AWSChimeErrorUnauthorizedClient,
    AWSChimeErrorUnprocessableEntity,
};

typedef NS_ENUM(NSInteger, AWSChimeAccountType) {
    AWSChimeAccountTypeUnknown,
    AWSChimeAccountTypeTeam,
    AWSChimeAccountTypeEnterpriseDirectory,
    AWSChimeAccountTypeEnterpriseLWA,
    AWSChimeAccountTypeEnterpriseOIDC,
};

typedef NS_ENUM(NSInteger, AWSChimeBotType) {
    AWSChimeBotTypeUnknown,
    AWSChimeBotTypeChatBot,
};

typedef NS_ENUM(NSInteger, AWSChimeCallingNameStatus) {
    AWSChimeCallingNameStatusUnknown,
    AWSChimeCallingNameStatusUnassigned,
    AWSChimeCallingNameStatusUpdateInProgress,
    AWSChimeCallingNameStatusUpdateSucceeded,
    AWSChimeCallingNameStatusUpdateFailed,
};

typedef NS_ENUM(NSInteger, AWSChimeCapability) {
    AWSChimeCapabilityUnknown,
    AWSChimeCapabilityVoice,
    AWSChimeCapabilitySms,
};

typedef NS_ENUM(NSInteger, AWSChimeEmailStatus) {
    AWSChimeEmailStatusUnknown,
    AWSChimeEmailStatusNotSent,
    AWSChimeEmailStatusSent,
    AWSChimeEmailStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSChimeErrorCode) {
    AWSChimeErrorCodeUnknown,
    AWSChimeErrorCodeBadRequest,
    AWSChimeErrorCodeConflict,
    AWSChimeErrorCodeForbidden,
    AWSChimeErrorCodeNotFound,
    AWSChimeErrorCodePreconditionFailed,
    AWSChimeErrorCodeResourceLimitExceeded,
    AWSChimeErrorCodeServiceFailure,
    AWSChimeErrorCodeAccessDenied,
    AWSChimeErrorCodeServiceUnavailable,
    AWSChimeErrorCodeThrottled,
    AWSChimeErrorCodeUnauthorized,
    AWSChimeErrorCodeUnprocessable,
    AWSChimeErrorCodeVoiceConnectorGroupAssociationsExist,
    AWSChimeErrorCodePhoneNumberAssociationsExist,
};

typedef NS_ENUM(NSInteger, AWSChimeGeoMatchLevel) {
    AWSChimeGeoMatchLevelUnknown,
    AWSChimeGeoMatchLevelCountry,
    AWSChimeGeoMatchLevelAreaCode,
};

typedef NS_ENUM(NSInteger, AWSChimeInviteStatus) {
    AWSChimeInviteStatusUnknown,
    AWSChimeInviteStatusPending,
    AWSChimeInviteStatusAccepted,
    AWSChimeInviteStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSChimeLicense) {
    AWSChimeLicenseUnknown,
    AWSChimeLicenseBasic,
    AWSChimeLicensePlus,
    AWSChimeLicensePro,
    AWSChimeLicenseProTrial,
};

typedef NS_ENUM(NSInteger, AWSChimeMemberType) {
    AWSChimeMemberTypeUnknown,
    AWSChimeMemberTypeUser,
    AWSChimeMemberTypeBot,
    AWSChimeMemberTypeWebhook,
};

typedef NS_ENUM(NSInteger, AWSChimeNotificationTarget) {
    AWSChimeNotificationTargetUnknown,
    AWSChimeNotificationTargetEventBridge,
    AWSChimeNotificationTargetSns,
    AWSChimeNotificationTargetSqs,
};

typedef NS_ENUM(NSInteger, AWSChimeNumberSelectionBehavior) {
    AWSChimeNumberSelectionBehaviorUnknown,
    AWSChimeNumberSelectionBehaviorPreferSticky,
    AWSChimeNumberSelectionBehaviorAvoidSticky,
};

typedef NS_ENUM(NSInteger, AWSChimeOrderedPhoneNumberStatus) {
    AWSChimeOrderedPhoneNumberStatusUnknown,
    AWSChimeOrderedPhoneNumberStatusProcessing,
    AWSChimeOrderedPhoneNumberStatusAcquired,
    AWSChimeOrderedPhoneNumberStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSChimeOriginationRouteProtocol) {
    AWSChimeOriginationRouteProtocolUnknown,
    AWSChimeOriginationRouteProtocolTcp,
    AWSChimeOriginationRouteProtocolUdp,
};

typedef NS_ENUM(NSInteger, AWSChimePhoneNumberAssociationName) {
    AWSChimePhoneNumberAssociationNameUnknown,
    AWSChimePhoneNumberAssociationNameAccountId,
    AWSChimePhoneNumberAssociationNameUserId,
    AWSChimePhoneNumberAssociationNameVoiceConnectorId,
    AWSChimePhoneNumberAssociationNameVoiceConnectorGroupId,
};

typedef NS_ENUM(NSInteger, AWSChimePhoneNumberOrderStatus) {
    AWSChimePhoneNumberOrderStatusUnknown,
    AWSChimePhoneNumberOrderStatusProcessing,
    AWSChimePhoneNumberOrderStatusSuccessful,
    AWSChimePhoneNumberOrderStatusFailed,
    AWSChimePhoneNumberOrderStatusPartial,
};

typedef NS_ENUM(NSInteger, AWSChimePhoneNumberProductType) {
    AWSChimePhoneNumberProductTypeUnknown,
    AWSChimePhoneNumberProductTypeBusinessCalling,
    AWSChimePhoneNumberProductTypeVoiceConnector,
};

typedef NS_ENUM(NSInteger, AWSChimePhoneNumberStatus) {
    AWSChimePhoneNumberStatusUnknown,
    AWSChimePhoneNumberStatusAcquireInProgress,
    AWSChimePhoneNumberStatusAcquireFailed,
    AWSChimePhoneNumberStatusUnassigned,
    AWSChimePhoneNumberStatusAssigned,
    AWSChimePhoneNumberStatusReleaseInProgress,
    AWSChimePhoneNumberStatusDeleteInProgress,
    AWSChimePhoneNumberStatusReleaseFailed,
    AWSChimePhoneNumberStatusDeleteFailed,
};

typedef NS_ENUM(NSInteger, AWSChimePhoneNumberType) {
    AWSChimePhoneNumberTypeUnknown,
    AWSChimePhoneNumberTypeLocal,
    AWSChimePhoneNumberTypeTollFree,
};

typedef NS_ENUM(NSInteger, AWSChimeProxySessionStatus) {
    AWSChimeProxySessionStatusUnknown,
    AWSChimeProxySessionStatusOpen,
    AWSChimeProxySessionStatusInProgress,
    AWSChimeProxySessionStatusClosed,
};

typedef NS_ENUM(NSInteger, AWSChimeRegistrationStatus) {
    AWSChimeRegistrationStatusUnknown,
    AWSChimeRegistrationStatusUnregistered,
    AWSChimeRegistrationStatusRegistered,
    AWSChimeRegistrationStatusSuspended,
};

typedef NS_ENUM(NSInteger, AWSChimeRoomMembershipRole) {
    AWSChimeRoomMembershipRoleUnknown,
    AWSChimeRoomMembershipRoleAdministrator,
    AWSChimeRoomMembershipRoleMember,
};

typedef NS_ENUM(NSInteger, AWSChimeUserType) {
    AWSChimeUserTypeUnknown,
    AWSChimeUserTypePrivateUser,
    AWSChimeUserTypeSharedDevice,
};

typedef NS_ENUM(NSInteger, AWSChimeVoiceConnectorAwsRegion) {
    AWSChimeVoiceConnectorAwsRegionUnknown,
    AWSChimeVoiceConnectorAwsRegionUsEast1,
    AWSChimeVoiceConnectorAwsRegionUsWest2,
};

@class AWSChimeAccount;
@class AWSChimeAccountSettings;
@class AWSChimeAlexaForBusinessMetadata;
@class AWSChimeAssociatePhoneNumberWithUserRequest;
@class AWSChimeAssociatePhoneNumberWithUserResponse;
@class AWSChimeAssociatePhoneNumbersWithVoiceConnectorGroupRequest;
@class AWSChimeAssociatePhoneNumbersWithVoiceConnectorGroupResponse;
@class AWSChimeAssociatePhoneNumbersWithVoiceConnectorRequest;
@class AWSChimeAssociatePhoneNumbersWithVoiceConnectorResponse;
@class AWSChimeAssociateSigninDelegateGroupsWithAccountRequest;
@class AWSChimeAssociateSigninDelegateGroupsWithAccountResponse;
@class AWSChimeAttendee;
@class AWSChimeBatchCreateAttendeeRequest;
@class AWSChimeBatchCreateAttendeeResponse;
@class AWSChimeBatchCreateRoomMembershipRequest;
@class AWSChimeBatchCreateRoomMembershipResponse;
@class AWSChimeBatchDeletePhoneNumberRequest;
@class AWSChimeBatchDeletePhoneNumberResponse;
@class AWSChimeBatchSuspendUserRequest;
@class AWSChimeBatchSuspendUserResponse;
@class AWSChimeBatchUnsuspendUserRequest;
@class AWSChimeBatchUnsuspendUserResponse;
@class AWSChimeBatchUpdatePhoneNumberRequest;
@class AWSChimeBatchUpdatePhoneNumberResponse;
@class AWSChimeBatchUpdateUserRequest;
@class AWSChimeBatchUpdateUserResponse;
@class AWSChimeBot;
@class AWSChimeBusinessCallingSettings;
@class AWSChimeCreateAccountRequest;
@class AWSChimeCreateAccountResponse;
@class AWSChimeCreateAttendeeError;
@class AWSChimeCreateAttendeeRequest;
@class AWSChimeCreateAttendeeRequestItem;
@class AWSChimeCreateAttendeeResponse;
@class AWSChimeCreateBotRequest;
@class AWSChimeCreateBotResponse;
@class AWSChimeCreateMeetingRequest;
@class AWSChimeCreateMeetingResponse;
@class AWSChimeCreatePhoneNumberOrderRequest;
@class AWSChimeCreatePhoneNumberOrderResponse;
@class AWSChimeCreateProxySessionRequest;
@class AWSChimeCreateProxySessionResponse;
@class AWSChimeCreateRoomMembershipRequest;
@class AWSChimeCreateRoomMembershipResponse;
@class AWSChimeCreateRoomRequest;
@class AWSChimeCreateRoomResponse;
@class AWSChimeCreateUserRequest;
@class AWSChimeCreateUserResponse;
@class AWSChimeCreateVoiceConnectorGroupRequest;
@class AWSChimeCreateVoiceConnectorGroupResponse;
@class AWSChimeCreateVoiceConnectorRequest;
@class AWSChimeCreateVoiceConnectorResponse;
@class AWSChimeCredential;
@class AWSChimeDeleteAccountRequest;
@class AWSChimeDeleteAccountResponse;
@class AWSChimeDeleteAttendeeRequest;
@class AWSChimeDeleteEventsConfigurationRequest;
@class AWSChimeDeleteMeetingRequest;
@class AWSChimeDeletePhoneNumberRequest;
@class AWSChimeDeleteProxySessionRequest;
@class AWSChimeDeleteRoomMembershipRequest;
@class AWSChimeDeleteRoomRequest;
@class AWSChimeDeleteVoiceConnectorGroupRequest;
@class AWSChimeDeleteVoiceConnectorOriginationRequest;
@class AWSChimeDeleteVoiceConnectorProxyRequest;
@class AWSChimeDeleteVoiceConnectorRequest;
@class AWSChimeDeleteVoiceConnectorStreamingConfigurationRequest;
@class AWSChimeDeleteVoiceConnectorTerminationCredentialsRequest;
@class AWSChimeDeleteVoiceConnectorTerminationRequest;
@class AWSChimeDisassociatePhoneNumberFromUserRequest;
@class AWSChimeDisassociatePhoneNumberFromUserResponse;
@class AWSChimeDisassociatePhoneNumbersFromVoiceConnectorGroupRequest;
@class AWSChimeDisassociatePhoneNumbersFromVoiceConnectorGroupResponse;
@class AWSChimeDisassociatePhoneNumbersFromVoiceConnectorRequest;
@class AWSChimeDisassociatePhoneNumbersFromVoiceConnectorResponse;
@class AWSChimeDisassociateSigninDelegateGroupsFromAccountRequest;
@class AWSChimeDisassociateSigninDelegateGroupsFromAccountResponse;
@class AWSChimeEventsConfiguration;
@class AWSChimeGeoMatchParams;
@class AWSChimeGetAccountRequest;
@class AWSChimeGetAccountResponse;
@class AWSChimeGetAccountSettingsRequest;
@class AWSChimeGetAccountSettingsResponse;
@class AWSChimeGetAttendeeRequest;
@class AWSChimeGetAttendeeResponse;
@class AWSChimeGetBotRequest;
@class AWSChimeGetBotResponse;
@class AWSChimeGetEventsConfigurationRequest;
@class AWSChimeGetEventsConfigurationResponse;
@class AWSChimeGetGlobalSettingsResponse;
@class AWSChimeGetMeetingRequest;
@class AWSChimeGetMeetingResponse;
@class AWSChimeGetPhoneNumberOrderRequest;
@class AWSChimeGetPhoneNumberOrderResponse;
@class AWSChimeGetPhoneNumberRequest;
@class AWSChimeGetPhoneNumberResponse;
@class AWSChimeGetPhoneNumberSettingsResponse;
@class AWSChimeGetProxySessionRequest;
@class AWSChimeGetProxySessionResponse;
@class AWSChimeGetRoomRequest;
@class AWSChimeGetRoomResponse;
@class AWSChimeGetUserRequest;
@class AWSChimeGetUserResponse;
@class AWSChimeGetUserSettingsRequest;
@class AWSChimeGetUserSettingsResponse;
@class AWSChimeGetVoiceConnectorGroupRequest;
@class AWSChimeGetVoiceConnectorGroupResponse;
@class AWSChimeGetVoiceConnectorLoggingConfigurationRequest;
@class AWSChimeGetVoiceConnectorLoggingConfigurationResponse;
@class AWSChimeGetVoiceConnectorOriginationRequest;
@class AWSChimeGetVoiceConnectorOriginationResponse;
@class AWSChimeGetVoiceConnectorProxyRequest;
@class AWSChimeGetVoiceConnectorProxyResponse;
@class AWSChimeGetVoiceConnectorRequest;
@class AWSChimeGetVoiceConnectorResponse;
@class AWSChimeGetVoiceConnectorStreamingConfigurationRequest;
@class AWSChimeGetVoiceConnectorStreamingConfigurationResponse;
@class AWSChimeGetVoiceConnectorTerminationHealthRequest;
@class AWSChimeGetVoiceConnectorTerminationHealthResponse;
@class AWSChimeGetVoiceConnectorTerminationRequest;
@class AWSChimeGetVoiceConnectorTerminationResponse;
@class AWSChimeInvite;
@class AWSChimeInviteUsersRequest;
@class AWSChimeInviteUsersResponse;
@class AWSChimeListAccountsRequest;
@class AWSChimeListAccountsResponse;
@class AWSChimeListAttendeeTagsRequest;
@class AWSChimeListAttendeeTagsResponse;
@class AWSChimeListAttendeesRequest;
@class AWSChimeListAttendeesResponse;
@class AWSChimeListBotsRequest;
@class AWSChimeListBotsResponse;
@class AWSChimeListMeetingTagsRequest;
@class AWSChimeListMeetingTagsResponse;
@class AWSChimeListMeetingsRequest;
@class AWSChimeListMeetingsResponse;
@class AWSChimeListPhoneNumberOrdersRequest;
@class AWSChimeListPhoneNumberOrdersResponse;
@class AWSChimeListPhoneNumbersRequest;
@class AWSChimeListPhoneNumbersResponse;
@class AWSChimeListProxySessionsRequest;
@class AWSChimeListProxySessionsResponse;
@class AWSChimeListRoomMembershipsRequest;
@class AWSChimeListRoomMembershipsResponse;
@class AWSChimeListRoomsRequest;
@class AWSChimeListRoomsResponse;
@class AWSChimeListTagsForResourceRequest;
@class AWSChimeListTagsForResourceResponse;
@class AWSChimeListUsersRequest;
@class AWSChimeListUsersResponse;
@class AWSChimeListVoiceConnectorGroupsRequest;
@class AWSChimeListVoiceConnectorGroupsResponse;
@class AWSChimeListVoiceConnectorTerminationCredentialsRequest;
@class AWSChimeListVoiceConnectorTerminationCredentialsResponse;
@class AWSChimeListVoiceConnectorsRequest;
@class AWSChimeListVoiceConnectorsResponse;
@class AWSChimeLoggingConfiguration;
@class AWSChimeLogoutUserRequest;
@class AWSChimeLogoutUserResponse;
@class AWSChimeMediaPlacement;
@class AWSChimeMeeting;
@class AWSChimeMeetingNotificationConfiguration;
@class AWSChimeMember;
@class AWSChimeMemberError;
@class AWSChimeMembershipItem;
@class AWSChimeOrderedPhoneNumber;
@class AWSChimeOrigination;
@class AWSChimeOriginationRoute;
@class AWSChimeParticipant;
@class AWSChimePhoneNumber;
@class AWSChimePhoneNumberAssociation;
@class AWSChimePhoneNumberCapabilities;
@class AWSChimePhoneNumberError;
@class AWSChimePhoneNumberOrder;
@class AWSChimeProxy;
@class AWSChimeProxySession;
@class AWSChimePutEventsConfigurationRequest;
@class AWSChimePutEventsConfigurationResponse;
@class AWSChimePutVoiceConnectorLoggingConfigurationRequest;
@class AWSChimePutVoiceConnectorLoggingConfigurationResponse;
@class AWSChimePutVoiceConnectorOriginationRequest;
@class AWSChimePutVoiceConnectorOriginationResponse;
@class AWSChimePutVoiceConnectorProxyRequest;
@class AWSChimePutVoiceConnectorProxyResponse;
@class AWSChimePutVoiceConnectorStreamingConfigurationRequest;
@class AWSChimePutVoiceConnectorStreamingConfigurationResponse;
@class AWSChimePutVoiceConnectorTerminationCredentialsRequest;
@class AWSChimePutVoiceConnectorTerminationRequest;
@class AWSChimePutVoiceConnectorTerminationResponse;
@class AWSChimeRedactConversationMessageRequest;
@class AWSChimeRedactConversationMessageResponse;
@class AWSChimeRedactRoomMessageRequest;
@class AWSChimeRedactRoomMessageResponse;
@class AWSChimeRegenerateSecurityTokenRequest;
@class AWSChimeRegenerateSecurityTokenResponse;
@class AWSChimeResetPersonalPINRequest;
@class AWSChimeResetPersonalPINResponse;
@class AWSChimeRestorePhoneNumberRequest;
@class AWSChimeRestorePhoneNumberResponse;
@class AWSChimeRoom;
@class AWSChimeRoomMembership;
@class AWSChimeSearchAvailablePhoneNumbersRequest;
@class AWSChimeSearchAvailablePhoneNumbersResponse;
@class AWSChimeSigninDelegateGroup;
@class AWSChimeStreamingConfiguration;
@class AWSChimeStreamingNotificationTarget;
@class AWSChimeTag;
@class AWSChimeTagAttendeeRequest;
@class AWSChimeTagMeetingRequest;
@class AWSChimeTagResourceRequest;
@class AWSChimeTelephonySettings;
@class AWSChimeTermination;
@class AWSChimeTerminationHealth;
@class AWSChimeUntagAttendeeRequest;
@class AWSChimeUntagMeetingRequest;
@class AWSChimeUntagResourceRequest;
@class AWSChimeUpdateAccountRequest;
@class AWSChimeUpdateAccountResponse;
@class AWSChimeUpdateAccountSettingsRequest;
@class AWSChimeUpdateAccountSettingsResponse;
@class AWSChimeUpdateBotRequest;
@class AWSChimeUpdateBotResponse;
@class AWSChimeUpdateGlobalSettingsRequest;
@class AWSChimeUpdatePhoneNumberRequest;
@class AWSChimeUpdatePhoneNumberRequestItem;
@class AWSChimeUpdatePhoneNumberResponse;
@class AWSChimeUpdatePhoneNumberSettingsRequest;
@class AWSChimeUpdateProxySessionRequest;
@class AWSChimeUpdateProxySessionResponse;
@class AWSChimeUpdateRoomMembershipRequest;
@class AWSChimeUpdateRoomMembershipResponse;
@class AWSChimeUpdateRoomRequest;
@class AWSChimeUpdateRoomResponse;
@class AWSChimeUpdateUserRequest;
@class AWSChimeUpdateUserRequestItem;
@class AWSChimeUpdateUserResponse;
@class AWSChimeUpdateUserSettingsRequest;
@class AWSChimeUpdateVoiceConnectorGroupRequest;
@class AWSChimeUpdateVoiceConnectorGroupResponse;
@class AWSChimeUpdateVoiceConnectorRequest;
@class AWSChimeUpdateVoiceConnectorResponse;
@class AWSChimeUser;
@class AWSChimeUserError;
@class AWSChimeUserSettings;
@class AWSChimeVoiceConnector;
@class AWSChimeVoiceConnectorGroup;
@class AWSChimeVoiceConnectorItem;
@class AWSChimeVoiceConnectorSettings;

/**
 <p>The Amazon Chime account details. An AWS account can have multiple Amazon Chime accounts.</p>
 Required parameters: [AwsAccountId, AccountId, Name]
 */
@interface AWSChimeAccount : AWSModel


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The Amazon Chime account type. For more information about different account types, see <a href="https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html">Managing Your Amazon Chime Accounts</a> in the <i>Amazon Chime Administration Guide</i>.</p>
 */
@property (nonatomic, assign) AWSChimeAccountType accountType;

/**
 <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The Amazon Chime account creation timestamp, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimestamp;

/**
 <p>The default license for the Amazon Chime account.</p>
 */
@property (nonatomic, assign) AWSChimeLicense defaultLicense;

/**
 <p>The Amazon Chime account name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The sign-in delegate groups associated with the account.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSigninDelegateGroup *> * _Nullable signinDelegateGroups;

/**
 <p>Supported licenses for the Amazon Chime account.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedLicenses;

@end

/**
 <p>Settings related to the Amazon Chime account. This includes settings that start or stop remote control of shared screens, or start or stop the dial-out option in the Amazon Chime web application. For more information about these settings, see <a href="https://docs.aws.amazon.com/chime/latest/ag/policies.html">Use the Policies Page</a> in the <i>Amazon Chime Administration Guide</i>.</p>
 */
@interface AWSChimeAccountSettings : AWSModel


/**
 <p>Setting that stops or starts remote control of shared screens during meetings.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableRemoteControl;

/**
 <p>Setting that allows meeting participants to choose the <b>Call me at a phone number</b> option. For more information, see <a href="https://docs.aws.amazon.com/chime/latest/ug/chime-join-meeting.html">Join a Meeting without the Amazon Chime App</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableDialOut;

@end

/**
 <p>The Alexa for Business metadata associated with an Amazon Chime user, used to integrate Alexa for Business with a device.</p>
 */
@interface AWSChimeAlexaForBusinessMetadata : AWSModel


/**
 <p>The ARN of the room resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alexaForBusinessRoomArn;

/**
 <p>Starts or stops Alexa for Business.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isAlexaForBusinessEnabled;

@end

/**
 
 */
@interface AWSChimeAssociatePhoneNumberWithUserRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The phone number, in E.164 format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable e164PhoneNumber;

/**
 <p>The user ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSChimeAssociatePhoneNumberWithUserResponse : AWSModel


@end

/**
 
 */
@interface AWSChimeAssociatePhoneNumbersWithVoiceConnectorGroupRequest : AWSRequest


/**
 <p>List of phone numbers, in E.164 format.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable e164PhoneNumbers;

/**
 <p>If true, associates the provided phone numbers with the provided Amazon Chime Voice Connector Group and removes any previously existing associations. If false, does not associate any phone numbers that have previously existing associations.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceAssociate;

/**
 <p>The Amazon Chime Voice Connector group ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorGroupId;

@end

/**
 
 */
@interface AWSChimeAssociatePhoneNumbersWithVoiceConnectorGroupResponse : AWSModel


/**
 <p>If the action fails for one or more of the phone numbers in the request, a list of the phone numbers is returned, along with error codes and error messages.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimePhoneNumberError *> * _Nullable phoneNumberErrors;

@end

/**
 
 */
@interface AWSChimeAssociatePhoneNumbersWithVoiceConnectorRequest : AWSRequest


/**
 <p>List of phone numbers, in E.164 format.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable e164PhoneNumbers;

/**
 <p>If true, associates the provided phone numbers with the provided Amazon Chime Voice Connector and removes any previously existing associations. If false, does not associate any phone numbers that have previously existing associations.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceAssociate;

/**
 <p>The Amazon Chime Voice Connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimeAssociatePhoneNumbersWithVoiceConnectorResponse : AWSModel


/**
 <p>If the action fails for one or more of the phone numbers in the request, a list of the phone numbers is returned, along with error codes and error messages.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimePhoneNumberError *> * _Nullable phoneNumberErrors;

@end

/**
 
 */
@interface AWSChimeAssociateSigninDelegateGroupsWithAccountRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The sign-in delegate groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSigninDelegateGroup *> * _Nullable signinDelegateGroups;

@end

/**
 
 */
@interface AWSChimeAssociateSigninDelegateGroupsWithAccountResponse : AWSModel


@end

/**
 <p>An Amazon Chime SDK meeting attendee. Includes a unique <code>AttendeeId</code> and <code>JoinToken</code>. The <code>JoinToken</code> allows a client to authenticate and join as the specified attendee. The <code>JoinToken</code> expires when the meeting ends or when <a>DeleteAttendee</a> is called. After that, the attendee is unable to join the meeting.</p><p>We recommend securely transferring each <code>JoinToken</code> from your server application to the client so that no other client has access to the token except for the one authorized to represent the attendee.</p>
 */
@interface AWSChimeAttendee : AWSModel


/**
 <p>The Amazon Chime SDK attendee ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attendeeId;

/**
 <p>The Amazon Chime SDK external user ID. Links the attendee to an identity managed by a builder application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable externalUserId;

/**
 <p>The join token used by the Amazon Chime SDK attendee.</p>
 */
@property (nonatomic, strong) NSString * _Nullable joinToken;

@end

/**
 
 */
@interface AWSChimeBatchCreateAttendeeRequest : AWSRequest


/**
 <p>The request containing the attendees to create.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeCreateAttendeeRequestItem *> * _Nullable attendees;

/**
 <p>The Amazon Chime SDK meeting ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meetingId;

@end

/**
 
 */
@interface AWSChimeBatchCreateAttendeeResponse : AWSModel


/**
 <p>The attendee information, including attendees IDs and join tokens.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeAttendee *> * _Nullable attendees;

/**
 <p>If the action fails for one or more of the attendees in the request, a list of the attendees is returned, along with error codes and error messages.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeCreateAttendeeError *> * _Nullable errors;

@end

/**
 
 */
@interface AWSChimeBatchCreateRoomMembershipRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The list of membership items.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeMembershipItem *> * _Nullable membershipItemList;

/**
 <p>The room ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomId;

@end

/**
 
 */
@interface AWSChimeBatchCreateRoomMembershipResponse : AWSModel


/**
 <p>If the action fails for one or more of the member IDs in the request, a list of the member IDs is returned, along with error codes and error messages.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeMemberError *> * _Nullable errors;

@end

/**
 
 */
@interface AWSChimeBatchDeletePhoneNumberRequest : AWSRequest


/**
 <p>List of phone number IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable phoneNumberIds;

@end

/**
 
 */
@interface AWSChimeBatchDeletePhoneNumberResponse : AWSModel


/**
 <p>If the action fails for one or more of the phone numbers in the request, a list of the phone numbers is returned, along with error codes and error messages.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimePhoneNumberError *> * _Nullable phoneNumberErrors;

@end

/**
 
 */
@interface AWSChimeBatchSuspendUserRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The request containing the user IDs to suspend.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable userIdList;

@end

/**
 
 */
@interface AWSChimeBatchSuspendUserResponse : AWSModel


/**
 <p>If the <a>BatchSuspendUser</a> action fails for one or more of the user IDs in the request, a list of the user IDs is returned, along with error codes and error messages.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeUserError *> * _Nullable userErrors;

@end

/**
 
 */
@interface AWSChimeBatchUnsuspendUserRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The request containing the user IDs to unsuspend.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable userIdList;

@end

/**
 
 */
@interface AWSChimeBatchUnsuspendUserResponse : AWSModel


/**
 <p>If the <a>BatchUnsuspendUser</a> action fails for one or more of the user IDs in the request, a list of the user IDs is returned, along with error codes and error messages.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeUserError *> * _Nullable userErrors;

@end

/**
 
 */
@interface AWSChimeBatchUpdatePhoneNumberRequest : AWSRequest


/**
 <p>The request containing the phone number IDs and product types or calling names to update.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeUpdatePhoneNumberRequestItem *> * _Nullable updatePhoneNumberRequestItems;

@end

/**
 
 */
@interface AWSChimeBatchUpdatePhoneNumberResponse : AWSModel


/**
 <p>If the action fails for one or more of the phone numbers in the request, a list of the phone numbers is returned, along with error codes and error messages.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimePhoneNumberError *> * _Nullable phoneNumberErrors;

@end

/**
 
 */
@interface AWSChimeBatchUpdateUserRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The request containing the user IDs and details to update.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeUpdateUserRequestItem *> * _Nullable updateUserRequestItems;

@end

/**
 
 */
@interface AWSChimeBatchUpdateUserResponse : AWSModel


/**
 <p>If the <a>BatchUpdateUser</a> action fails for one or more of the user IDs in the request, a list of the user IDs is returned, along with error codes and error messages.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeUserError *> * _Nullable userErrors;

@end

/**
 <p>A resource that allows Enterprise account administrators to configure an interface to receive events from Amazon Chime.</p>
 */
@interface AWSChimeBot : AWSModel


/**
 <p>The bot email address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botEmail;

/**
 <p>The bot ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botId;

/**
 <p>The bot type.</p>
 */
@property (nonatomic, assign) AWSChimeBotType botType;

/**
 <p>The bot creation timestamp, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimestamp;

/**
 <p>When true, the bot is stopped from running in your account.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disabled;

/**
 <p>The bot display name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The security token used to authenticate Amazon Chime with the outgoing event endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityToken;

/**
 <p>The updated bot timestamp, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedTimestamp;

/**
 <p>The unique ID for the bot user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 <p>The Amazon Chime Business Calling settings for the administrator's AWS account. Includes any Amazon S3 buckets designated for storing call detail records.</p>
 */
@interface AWSChimeBusinessCallingSettings : AWSModel


/**
 <p>The Amazon S3 bucket designated for call detail record storage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cdrBucket;

@end

/**
 
 */
@interface AWSChimeCreateAccountRequest : AWSRequest


/**
 <p>The name of the Amazon Chime account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSChimeCreateAccountResponse : AWSModel


/**
 <p>The Amazon Chime account details.</p>
 */
@property (nonatomic, strong) AWSChimeAccount * _Nullable account;

@end

/**
 <p>The list of errors returned when errors are encountered during the BatchCreateAttendee and CreateAttendee actions. This includes external user IDs, error codes, and error messages.</p>
 */
@interface AWSChimeCreateAttendeeError : AWSModel


/**
 <p>The error code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>The error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The Amazon Chime SDK external user ID. Links the attendee to an identity managed by a builder application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable externalUserId;

@end

/**
 
 */
@interface AWSChimeCreateAttendeeRequest : AWSRequest


/**
 <p>The Amazon Chime SDK external user ID. Links the attendee to an identity managed by a builder application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable externalUserId;

/**
 <p>The Amazon Chime SDK meeting ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meetingId;

/**
 <p>The tag key-value pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeTag *> * _Nullable tags;

@end

/**
 <p>The Amazon Chime SDK attendee fields to create, used with the BatchCreateAttendee action.</p>
 Required parameters: [ExternalUserId]
 */
@interface AWSChimeCreateAttendeeRequestItem : AWSModel


/**
 <p>The Amazon Chime SDK external user ID. Links the attendee to an identity managed by a builder application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable externalUserId;

/**
 <p>The tag key-value pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSChimeCreateAttendeeResponse : AWSModel


/**
 <p>The attendee information, including attendee ID and join token.</p>
 */
@property (nonatomic, strong) AWSChimeAttendee * _Nullable attendee;

@end

/**
 
 */
@interface AWSChimeCreateBotRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The bot display name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The domain of the Amazon Chime Enterprise account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

@end

/**
 
 */
@interface AWSChimeCreateBotResponse : AWSModel


/**
 <p>The bot details.</p>
 */
@property (nonatomic, strong) AWSChimeBot * _Nullable bot;

@end

/**
 
 */
@interface AWSChimeCreateMeetingRequest : AWSRequest


/**
 <p>The unique identifier for the client request. Use a different token for different meetings.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The external meeting ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable externalMeetingId;

/**
 <p>The Region in which to create the meeting. Available values: <code>ap-northeast-1</code>, <code>ap-southeast-1</code>, <code>ap-southeast-2</code>, <code>ca-central-1</code>, <code>eu-central-1</code>, <code>eu-north-1</code>, <code>eu-west-1</code>, <code>eu-west-2</code>, <code>eu-west-3</code>, <code>sa-east-1</code>, <code>us-east-1</code>, <code>us-east-2</code>, <code>us-west-1</code>, <code>us-west-2</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mediaRegion;

/**
 <p>Reserved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meetingHostId;

/**
 <p>The configuration for resource targets to receive notifications when meeting and attendee events occur.</p>
 */
@property (nonatomic, strong) AWSChimeMeetingNotificationConfiguration * _Nullable notificationsConfiguration;

/**
 <p>The tag key-value pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSChimeCreateMeetingResponse : AWSModel


/**
 <p>The meeting information, including the meeting ID and <code>MediaPlacement</code>.</p>
 */
@property (nonatomic, strong) AWSChimeMeeting * _Nullable meeting;

@end

/**
 
 */
@interface AWSChimeCreatePhoneNumberOrderRequest : AWSRequest


/**
 <p>List of phone numbers, in E.164 format.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable e164PhoneNumbers;

/**
 <p>The phone number product type.</p>
 */
@property (nonatomic, assign) AWSChimePhoneNumberProductType productType;

@end

/**
 
 */
@interface AWSChimeCreatePhoneNumberOrderResponse : AWSModel


/**
 <p>The phone number order details.</p>
 */
@property (nonatomic, strong) AWSChimePhoneNumberOrder * _Nullable phoneNumberOrder;

@end

/**
 
 */
@interface AWSChimeCreateProxySessionRequest : AWSRequest


/**
 <p>The proxy session capabilities.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable capabilities;

/**
 <p>The number of minutes allowed for the proxy session.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expiryMinutes;

/**
 <p>The preference for matching the country or area code of the proxy phone number with that of the first participant.</p>
 */
@property (nonatomic, assign) AWSChimeGeoMatchLevel geoMatchLevel;

/**
 <p>The country and area code for the proxy phone number.</p>
 */
@property (nonatomic, strong) AWSChimeGeoMatchParams * _Nullable geoMatchParams;

/**
 <p>The name of the proxy session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The preference for proxy phone number reuse, or stickiness, between the same participants across sessions.</p>
 */
@property (nonatomic, assign) AWSChimeNumberSelectionBehavior numberSelectionBehavior;

/**
 <p>The participant phone numbers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable participantPhoneNumbers;

/**
 <p>The Amazon Chime voice connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimeCreateProxySessionResponse : AWSModel


/**
 <p>The proxy session details.</p>
 */
@property (nonatomic, strong) AWSChimeProxySession * _Nullable proxySession;

@end

/**
 
 */
@interface AWSChimeCreateRoomMembershipRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The Amazon Chime member ID (user ID or bot ID).</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberId;

/**
 <p>The role of the member.</p>
 */
@property (nonatomic, assign) AWSChimeRoomMembershipRole role;

/**
 <p>The room ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomId;

@end

/**
 
 */
@interface AWSChimeCreateRoomMembershipResponse : AWSModel


/**
 <p>The room membership details.</p>
 */
@property (nonatomic, strong) AWSChimeRoomMembership * _Nullable roomMembership;

@end

/**
 
 */
@interface AWSChimeCreateRoomRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The idempotency token for the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The room name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSChimeCreateRoomResponse : AWSModel


/**
 <p>The room details.</p>
 */
@property (nonatomic, strong) AWSChimeRoom * _Nullable room;

@end

/**
 
 */
@interface AWSChimeCreateUserRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The user's email address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>The user type.</p>
 */
@property (nonatomic, assign) AWSChimeUserType userType;

/**
 <p>The user name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSChimeCreateUserResponse : AWSModel


/**
 <p>The user on the Amazon Chime account.</p>
 */
@property (nonatomic, strong) AWSChimeUser * _Nullable user;

@end

/**
 
 */
@interface AWSChimeCreateVoiceConnectorGroupRequest : AWSRequest


/**
 <p>The name of the Amazon Chime Voice Connector group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Amazon Chime Voice Connectors to route inbound calls to.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeVoiceConnectorItem *> * _Nullable voiceConnectorItems;

@end

/**
 
 */
@interface AWSChimeCreateVoiceConnectorGroupResponse : AWSModel


/**
 <p>The Amazon Chime Voice Connector group details.</p>
 */
@property (nonatomic, strong) AWSChimeVoiceConnectorGroup * _Nullable voiceConnectorGroup;

@end

/**
 
 */
@interface AWSChimeCreateVoiceConnectorRequest : AWSRequest


/**
 <p>The AWS Region in which the Amazon Chime Voice Connector is created. Default value: <code>us-east-1</code>.</p>
 */
@property (nonatomic, assign) AWSChimeVoiceConnectorAwsRegion awsRegion;

/**
 <p>The name of the Amazon Chime Voice Connector.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>When enabled, requires encryption for the Amazon Chime Voice Connector.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requireEncryption;

@end

/**
 
 */
@interface AWSChimeCreateVoiceConnectorResponse : AWSModel


/**
 <p>The Amazon Chime Voice Connector details.</p>
 */
@property (nonatomic, strong) AWSChimeVoiceConnector * _Nullable voiceConnector;

@end

/**
 <p>The SIP credentials used to authenticate requests to your Amazon Chime Voice Connector.</p>
 */
@interface AWSChimeCredential : AWSModel


/**
 <p>The RFC2617 compliant password associated with the SIP credentials, in US-ASCII format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 <p>The RFC2617 compliant user name associated with the SIP credentials, in US-ASCII format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSChimeDeleteAccountRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

@end

/**
 
 */
@interface AWSChimeDeleteAccountResponse : AWSModel


@end

/**
 
 */
@interface AWSChimeDeleteAttendeeRequest : AWSRequest


/**
 <p>The Amazon Chime SDK attendee ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attendeeId;

/**
 <p>The Amazon Chime SDK meeting ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meetingId;

@end

/**
 
 */
@interface AWSChimeDeleteEventsConfigurationRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The bot ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botId;

@end

/**
 
 */
@interface AWSChimeDeleteMeetingRequest : AWSRequest


/**
 <p>The Amazon Chime SDK meeting ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meetingId;

@end

/**
 
 */
@interface AWSChimeDeletePhoneNumberRequest : AWSRequest


/**
 <p>The phone number ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberId;

@end

/**
 
 */
@interface AWSChimeDeleteProxySessionRequest : AWSRequest


/**
 <p>The proxy session ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable proxySessionId;

/**
 <p>The Amazon Chime voice connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimeDeleteRoomMembershipRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The member ID (user ID or bot ID).</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberId;

/**
 <p>The room ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomId;

@end

/**
 
 */
@interface AWSChimeDeleteRoomRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The chat room ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomId;

@end

/**
 
 */
@interface AWSChimeDeleteVoiceConnectorGroupRequest : AWSRequest


/**
 <p>The Amazon Chime Voice Connector group ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorGroupId;

@end

/**
 
 */
@interface AWSChimeDeleteVoiceConnectorOriginationRequest : AWSRequest


/**
 <p>The Amazon Chime Voice Connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimeDeleteVoiceConnectorProxyRequest : AWSRequest


/**
 <p>The Amazon Chime Voice Connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimeDeleteVoiceConnectorRequest : AWSRequest


/**
 <p>The Amazon Chime Voice Connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimeDeleteVoiceConnectorStreamingConfigurationRequest : AWSRequest


/**
 <p>The Amazon Chime Voice Connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimeDeleteVoiceConnectorTerminationCredentialsRequest : AWSRequest


/**
 <p>The RFC2617 compliant username associated with the SIP credentials, in US-ASCII format.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable usernames;

/**
 <p>The Amazon Chime Voice Connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimeDeleteVoiceConnectorTerminationRequest : AWSRequest


/**
 <p>The Amazon Chime Voice Connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimeDisassociatePhoneNumberFromUserRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The user ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSChimeDisassociatePhoneNumberFromUserResponse : AWSModel


@end

/**
 
 */
@interface AWSChimeDisassociatePhoneNumbersFromVoiceConnectorGroupRequest : AWSRequest


/**
 <p>List of phone numbers, in E.164 format.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable e164PhoneNumbers;

/**
 <p>The Amazon Chime Voice Connector group ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorGroupId;

@end

/**
 
 */
@interface AWSChimeDisassociatePhoneNumbersFromVoiceConnectorGroupResponse : AWSModel


/**
 <p>If the action fails for one or more of the phone numbers in the request, a list of the phone numbers is returned, along with error codes and error messages.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimePhoneNumberError *> * _Nullable phoneNumberErrors;

@end

/**
 
 */
@interface AWSChimeDisassociatePhoneNumbersFromVoiceConnectorRequest : AWSRequest


/**
 <p>List of phone numbers, in E.164 format.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable e164PhoneNumbers;

/**
 <p>The Amazon Chime Voice Connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimeDisassociatePhoneNumbersFromVoiceConnectorResponse : AWSModel


/**
 <p>If the action fails for one or more of the phone numbers in the request, a list of the phone numbers is returned, along with error codes and error messages.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimePhoneNumberError *> * _Nullable phoneNumberErrors;

@end

/**
 
 */
@interface AWSChimeDisassociateSigninDelegateGroupsFromAccountRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The sign-in delegate group names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable groupNames;

@end

/**
 
 */
@interface AWSChimeDisassociateSigninDelegateGroupsFromAccountResponse : AWSModel


@end

/**
 <p>The configuration that allows a bot to receive outgoing events. Can be either an HTTPS endpoint or a Lambda function ARN.</p>
 */
@interface AWSChimeEventsConfiguration : AWSModel


/**
 <p>The bot ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botId;

/**
 <p>Lambda function ARN that allows a bot to receive outgoing events.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lambdaFunctionArn;

/**
 <p>HTTPS endpoint that allows a bot to receive outgoing events.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outboundEventsHTTPSEndpoint;

@end

/**
 <p>The country and area code for a proxy phone number in a proxy phone session.</p>
 Required parameters: [Country, AreaCode]
 */
@interface AWSChimeGeoMatchParams : AWSModel


/**
 <p>The area code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable areaCode;

/**
 <p>The country.</p>
 */
@property (nonatomic, strong) NSString * _Nullable country;

@end

/**
 
 */
@interface AWSChimeGetAccountRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

@end

/**
 
 */
@interface AWSChimeGetAccountResponse : AWSModel


/**
 <p>The Amazon Chime account details.</p>
 */
@property (nonatomic, strong) AWSChimeAccount * _Nullable account;

@end

/**
 
 */
@interface AWSChimeGetAccountSettingsRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

@end

/**
 
 */
@interface AWSChimeGetAccountSettingsResponse : AWSModel


/**
 <p>The Amazon Chime account settings.</p>
 */
@property (nonatomic, strong) AWSChimeAccountSettings * _Nullable accountSettings;

@end

/**
 
 */
@interface AWSChimeGetAttendeeRequest : AWSRequest


/**
 <p>The Amazon Chime SDK attendee ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attendeeId;

/**
 <p>The Amazon Chime SDK meeting ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meetingId;

@end

/**
 
 */
@interface AWSChimeGetAttendeeResponse : AWSModel


/**
 <p>The Amazon Chime SDK attendee information.</p>
 */
@property (nonatomic, strong) AWSChimeAttendee * _Nullable attendee;

@end

/**
 
 */
@interface AWSChimeGetBotRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The bot ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botId;

@end

/**
 
 */
@interface AWSChimeGetBotResponse : AWSModel


/**
 <p>The chat bot details.</p>
 */
@property (nonatomic, strong) AWSChimeBot * _Nullable bot;

@end

/**
 
 */
@interface AWSChimeGetEventsConfigurationRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The bot ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botId;

@end

/**
 
 */
@interface AWSChimeGetEventsConfigurationResponse : AWSModel


/**
 <p>The events configuration details.</p>
 */
@property (nonatomic, strong) AWSChimeEventsConfiguration * _Nullable eventsConfiguration;

@end

/**
 
 */
@interface AWSChimeGetGlobalSettingsResponse : AWSModel


/**
 <p>The Amazon Chime Business Calling settings.</p>
 */
@property (nonatomic, strong) AWSChimeBusinessCallingSettings * _Nullable businessCalling;

/**
 <p>The Amazon Chime Voice Connector settings.</p>
 */
@property (nonatomic, strong) AWSChimeVoiceConnectorSettings * _Nullable voiceConnector;

@end

/**
 
 */
@interface AWSChimeGetMeetingRequest : AWSRequest


/**
 <p>The Amazon Chime SDK meeting ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meetingId;

@end

/**
 
 */
@interface AWSChimeGetMeetingResponse : AWSModel


/**
 <p>The Amazon Chime SDK meeting information.</p>
 */
@property (nonatomic, strong) AWSChimeMeeting * _Nullable meeting;

@end

/**
 
 */
@interface AWSChimeGetPhoneNumberOrderRequest : AWSRequest


/**
 <p>The ID for the phone number order.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberOrderId;

@end

/**
 
 */
@interface AWSChimeGetPhoneNumberOrderResponse : AWSModel


/**
 <p>The phone number order details.</p>
 */
@property (nonatomic, strong) AWSChimePhoneNumberOrder * _Nullable phoneNumberOrder;

@end

/**
 
 */
@interface AWSChimeGetPhoneNumberRequest : AWSRequest


/**
 <p>The phone number ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberId;

@end

/**
 
 */
@interface AWSChimeGetPhoneNumberResponse : AWSModel


/**
 <p>The phone number details.</p>
 */
@property (nonatomic, strong) AWSChimePhoneNumber * _Nullable phoneNumber;

@end

/**
 
 */
@interface AWSChimeGetPhoneNumberSettingsResponse : AWSModel


/**
 <p>The default outbound calling name for the account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callingName;

/**
 <p>The updated outbound calling name timestamp, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable callingNameUpdatedTimestamp;

@end

/**
 
 */
@interface AWSChimeGetProxySessionRequest : AWSRequest


/**
 <p>The proxy session ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable proxySessionId;

/**
 <p>The Amazon Chime voice connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimeGetProxySessionResponse : AWSModel


/**
 <p>The proxy session details.</p>
 */
@property (nonatomic, strong) AWSChimeProxySession * _Nullable proxySession;

@end

/**
 
 */
@interface AWSChimeGetRoomRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The room ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomId;

@end

/**
 
 */
@interface AWSChimeGetRoomResponse : AWSModel


/**
 <p>The room details.</p>
 */
@property (nonatomic, strong) AWSChimeRoom * _Nullable room;

@end

/**
 
 */
@interface AWSChimeGetUserRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The user ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSChimeGetUserResponse : AWSModel


/**
 <p>The user details.</p>
 */
@property (nonatomic, strong) AWSChimeUser * _Nullable user;

@end

/**
 
 */
@interface AWSChimeGetUserSettingsRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The user ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSChimeGetUserSettingsResponse : AWSModel


/**
 <p>The user settings.</p>
 */
@property (nonatomic, strong) AWSChimeUserSettings * _Nullable userSettings;

@end

/**
 
 */
@interface AWSChimeGetVoiceConnectorGroupRequest : AWSRequest


/**
 <p>The Amazon Chime Voice Connector group ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorGroupId;

@end

/**
 
 */
@interface AWSChimeGetVoiceConnectorGroupResponse : AWSModel


/**
 <p>The Amazon Chime Voice Connector group details.</p>
 */
@property (nonatomic, strong) AWSChimeVoiceConnectorGroup * _Nullable voiceConnectorGroup;

@end

/**
 
 */
@interface AWSChimeGetVoiceConnectorLoggingConfigurationRequest : AWSRequest


/**
 <p>The Amazon Chime Voice Connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimeGetVoiceConnectorLoggingConfigurationResponse : AWSModel


/**
 <p>The logging configuration details.</p>
 */
@property (nonatomic, strong) AWSChimeLoggingConfiguration * _Nullable loggingConfiguration;

@end

/**
 
 */
@interface AWSChimeGetVoiceConnectorOriginationRequest : AWSRequest


/**
 <p>The Amazon Chime Voice Connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimeGetVoiceConnectorOriginationResponse : AWSModel


/**
 <p>The origination setting details.</p>
 */
@property (nonatomic, strong) AWSChimeOrigination * _Nullable origination;

@end

/**
 
 */
@interface AWSChimeGetVoiceConnectorProxyRequest : AWSRequest


/**
 <p>The Amazon Chime voice connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimeGetVoiceConnectorProxyResponse : AWSModel


/**
 <p>The proxy configuration details.</p>
 */
@property (nonatomic, strong) AWSChimeProxy * _Nullable proxy;

@end

/**
 
 */
@interface AWSChimeGetVoiceConnectorRequest : AWSRequest


/**
 <p>The Amazon Chime Voice Connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimeGetVoiceConnectorResponse : AWSModel


/**
 <p>The Amazon Chime Voice Connector details.</p>
 */
@property (nonatomic, strong) AWSChimeVoiceConnector * _Nullable voiceConnector;

@end

/**
 
 */
@interface AWSChimeGetVoiceConnectorStreamingConfigurationRequest : AWSRequest


/**
 <p>The Amazon Chime Voice Connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimeGetVoiceConnectorStreamingConfigurationResponse : AWSModel


/**
 <p>The streaming configuration details.</p>
 */
@property (nonatomic, strong) AWSChimeStreamingConfiguration * _Nullable streamingConfiguration;

@end

/**
 
 */
@interface AWSChimeGetVoiceConnectorTerminationHealthRequest : AWSRequest


/**
 <p>The Amazon Chime Voice Connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimeGetVoiceConnectorTerminationHealthResponse : AWSModel


/**
 <p>The termination health details.</p>
 */
@property (nonatomic, strong) AWSChimeTerminationHealth * _Nullable terminationHealth;

@end

/**
 
 */
@interface AWSChimeGetVoiceConnectorTerminationRequest : AWSRequest


/**
 <p>The Amazon Chime Voice Connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimeGetVoiceConnectorTerminationResponse : AWSModel


/**
 <p>The termination setting details.</p>
 */
@property (nonatomic, strong) AWSChimeTermination * _Nullable termination;

@end

/**
 <p>Invitation object returned after emailing users to invite them to join the Amazon Chime <code>Team</code> account.</p>
 */
@interface AWSChimeInvite : AWSModel


/**
 <p>The email address to which the invite is sent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailAddress;

/**
 <p>The status of the invite email.</p>
 */
@property (nonatomic, assign) AWSChimeEmailStatus emailStatus;

/**
 <p>The invite ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inviteId;

/**
 <p>The status of the invite.</p>
 */
@property (nonatomic, assign) AWSChimeInviteStatus status;

@end

/**
 
 */
@interface AWSChimeInviteUsersRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The user email addresses to which to send the email invitation.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable userEmailList;

/**
 <p>The user type.</p>
 */
@property (nonatomic, assign) AWSChimeUserType userType;

@end

/**
 
 */
@interface AWSChimeInviteUsersResponse : AWSModel


/**
 <p>The email invitation details.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeInvite *> * _Nullable invites;

@end

/**
 
 */
@interface AWSChimeListAccountsRequest : AWSRequest


/**
 <p>The maximum number of results to return in a single call. Defaults to 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Amazon Chime account name prefix with which to filter results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>User email address with which to filter results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userEmail;

@end

/**
 
 */
@interface AWSChimeListAccountsResponse : AWSModel


/**
 <p>List of Amazon Chime accounts and account details.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeAccount *> * _Nullable accounts;

/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeListAttendeeTagsRequest : AWSRequest


/**
 <p>The Amazon Chime SDK attendee ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attendeeId;

/**
 <p>The Amazon Chime SDK meeting ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meetingId;

@end

/**
 
 */
@interface AWSChimeListAttendeeTagsResponse : AWSModel


/**
 <p>A list of tag key-value pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSChimeListAttendeesRequest : AWSRequest


/**
 <p>The maximum number of results to return in a single call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The Amazon Chime SDK meeting ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meetingId;

/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeListAttendeesResponse : AWSModel


/**
 <p>The Amazon Chime SDK attendee information.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeAttendee *> * _Nullable attendees;

/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeListBotsRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The maximum number of results to return in a single call. The default is 10.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeListBotsResponse : AWSModel


/**
 <p>List of bots and bot details.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeBot *> * _Nullable bots;

/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeListMeetingTagsRequest : AWSRequest


/**
 <p>The Amazon Chime SDK meeting ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meetingId;

@end

/**
 
 */
@interface AWSChimeListMeetingTagsResponse : AWSModel


/**
 <p>A list of tag key-value pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSChimeListMeetingsRequest : AWSRequest


/**
 <p>The maximum number of results to return in a single call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeListMeetingsResponse : AWSModel


/**
 <p>The Amazon Chime SDK meeting information.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeMeeting *> * _Nullable meetings;

/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeListPhoneNumberOrdersRequest : AWSRequest


/**
 <p>The maximum number of results to return in a single call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeListPhoneNumberOrdersResponse : AWSModel


/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The phone number order details.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimePhoneNumberOrder *> * _Nullable phoneNumberOrders;

@end

/**
 
 */
@interface AWSChimeListPhoneNumbersRequest : AWSRequest


/**
 <p>The filter to use to limit the number of results.</p>
 */
@property (nonatomic, assign) AWSChimePhoneNumberAssociationName filterName;

/**
 <p>The value to use for the filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterValue;

/**
 <p>The maximum number of results to return in a single call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The phone number product type.</p>
 */
@property (nonatomic, assign) AWSChimePhoneNumberProductType productType;

/**
 <p>The phone number status.</p>
 */
@property (nonatomic, assign) AWSChimePhoneNumberStatus status;

@end

/**
 
 */
@interface AWSChimeListPhoneNumbersResponse : AWSModel


/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The phone number details.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimePhoneNumber *> * _Nullable phoneNumbers;

@end

/**
 
 */
@interface AWSChimeListProxySessionsRequest : AWSRequest


/**
 <p>The maximum number of results to return in a single call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The proxy session status.</p>
 */
@property (nonatomic, assign) AWSChimeProxySessionStatus status;

/**
 <p>The Amazon Chime voice connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimeListProxySessionsResponse : AWSModel


/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The proxy session details.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeProxySession *> * _Nullable proxySessions;

@end

/**
 
 */
@interface AWSChimeListRoomMembershipsRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The maximum number of results to return in a single call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The room ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomId;

@end

/**
 
 */
@interface AWSChimeListRoomMembershipsResponse : AWSModel


/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The room membership details.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeRoomMembership *> * _Nullable roomMemberships;

@end

/**
 
 */
@interface AWSChimeListRoomsRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The maximum number of results to return in a single call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The member ID (user ID or bot ID).</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberId;

/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeListRoomsResponse : AWSModel


/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The room details.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeRoom *> * _Nullable rooms;

@end

/**
 
 */
@interface AWSChimeListTagsForResourceRequest : AWSRequest


/**
 <p>The resource ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

@end

/**
 
 */
@interface AWSChimeListTagsForResourceResponse : AWSModel


/**
 <p>A list of tag-key value pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSChimeListUsersRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The maximum number of results to return in a single call. Defaults to 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Optional. The user email address used to filter results. Maximum 1.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userEmail;

/**
 <p>The user type.</p>
 */
@property (nonatomic, assign) AWSChimeUserType userType;

@end

/**
 
 */
@interface AWSChimeListUsersResponse : AWSModel


/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>List of users and user details.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeUser *> * _Nullable users;

@end

/**
 
 */
@interface AWSChimeListVoiceConnectorGroupsRequest : AWSRequest


/**
 <p>The maximum number of results to return in a single call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeListVoiceConnectorGroupsResponse : AWSModel


/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The details of the Amazon Chime Voice Connector groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeVoiceConnectorGroup *> * _Nullable voiceConnectorGroups;

@end

/**
 
 */
@interface AWSChimeListVoiceConnectorTerminationCredentialsRequest : AWSRequest


/**
 <p>The Amazon Chime Voice Connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimeListVoiceConnectorTerminationCredentialsResponse : AWSModel


/**
 <p>A list of user names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable usernames;

@end

/**
 
 */
@interface AWSChimeListVoiceConnectorsRequest : AWSRequest


/**
 <p>The maximum number of results to return in a single call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeListVoiceConnectorsResponse : AWSModel


/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The details of the Amazon Chime Voice Connectors.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeVoiceConnector *> * _Nullable voiceConnectors;

@end

/**
 <p>The logging configuration associated with an Amazon Chime Voice Connector. Specifies whether SIP message logs are enabled for sending to Amazon CloudWatch Logs.</p>
 */
@interface AWSChimeLoggingConfiguration : AWSModel


/**
 <p>When true, enables SIP message logs for sending to Amazon CloudWatch Logs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableSIPLogs;

@end

/**
 
 */
@interface AWSChimeLogoutUserRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The user ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSChimeLogoutUserResponse : AWSModel


@end

/**
 <p>A set of endpoints used by clients to connect to the media service group for a Amazon Chime SDK meeting.</p>
 */
@interface AWSChimeMediaPlacement : AWSModel


/**
 <p>The audio fallback URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable audioFallbackUrl;

/**
 <p>The audio host URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable audioHostUrl;

/**
 <p>The screen data URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable screenDataUrl;

/**
 <p>The screen sharing URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable screenSharingUrl;

/**
 <p>The screen viewing URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable screenViewingUrl;

/**
 <p>The signaling URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable signalingUrl;

/**
 <p>The turn control URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable turnControlUrl;

@end

/**
 <p>A meeting created using the Amazon Chime SDK.</p>
 */
@interface AWSChimeMeeting : AWSModel


/**
 <p>The external meeting ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable externalMeetingId;

/**
 <p>The media placement for the meeting.</p>
 */
@property (nonatomic, strong) AWSChimeMediaPlacement * _Nullable mediaPlacement;

/**
 <p>The Region in which to create the meeting. Available values: <code>ap-northeast-1</code>, <code>ap-southeast-1</code>, <code>ap-southeast-2</code>, <code>ca-central-1</code>, <code>eu-central-1</code>, <code>eu-north-1</code>, <code>eu-west-1</code>, <code>eu-west-2</code>, <code>eu-west-3</code>, <code>sa-east-1</code>, <code>us-east-1</code>, <code>us-east-2</code>, <code>us-west-1</code>, <code>us-west-2</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mediaRegion;

/**
 <p>The Amazon Chime SDK meeting ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meetingId;

@end

/**
 <p>The configuration for resource targets to receive notifications when Amazon Chime SDK meeting and attendee events occur.</p>
 */
@interface AWSChimeMeetingNotificationConfiguration : AWSModel


/**
 <p>The SNS topic ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snsTopicArn;

/**
 <p>The SQS queue ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sqsQueueArn;

@end

/**
 <p>The member details, such as email address, name, member ID, and member type.</p>
 */
@interface AWSChimeMember : AWSModel


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The member email address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>The member name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fullName;

/**
 <p>The member ID (user ID or bot ID).</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberId;

/**
 <p>The member type.</p>
 */
@property (nonatomic, assign) AWSChimeMemberType memberType;

@end

/**
 <p>The list of errors returned when a member action results in an error.</p>
 */
@interface AWSChimeMemberError : AWSModel


/**
 <p>The error code.</p>
 */
@property (nonatomic, assign) AWSChimeErrorCode errorCode;

/**
 <p>The error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The member ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberId;

@end

/**
 <p>Membership details, such as member ID and member role.</p>
 */
@interface AWSChimeMembershipItem : AWSModel


/**
 <p>The member ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberId;

/**
 <p>The member role.</p>
 */
@property (nonatomic, assign) AWSChimeRoomMembershipRole role;

@end

/**
 <p>A phone number for which an order has been placed.</p>
 */
@interface AWSChimeOrderedPhoneNumber : AWSModel


/**
 <p>The phone number, in E.164 format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable e164PhoneNumber;

/**
 <p>The phone number status.</p>
 */
@property (nonatomic, assign) AWSChimeOrderedPhoneNumberStatus status;

@end

/**
 <p>Origination settings enable your SIP hosts to receive inbound calls using your Amazon Chime Voice Connector.</p>
 */
@interface AWSChimeOrigination : AWSModel


/**
 <p>When origination settings are disabled, inbound calls are not enabled for your Amazon Chime Voice Connector.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disabled;

/**
 <p>The call distribution properties defined for your SIP hosts. Valid range: Minimum value of 1. Maximum value of 20.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeOriginationRoute *> * _Nullable routes;

@end

/**
 <p>Origination routes define call distribution properties for your SIP hosts to receive inbound calls using your Amazon Chime Voice Connector. Limit: Ten origination routes for each Amazon Chime Voice Connector.</p>
 */
@interface AWSChimeOriginationRoute : AWSModel


/**
 <p>The FQDN or IP address to contact for origination traffic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable host;

/**
 <p>The designated origination route port. Defaults to 5060.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The priority associated with the host, with 1 being the highest priority. Higher priority hosts are attempted first.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p>The protocol to use for the origination route. Encryption-enabled Amazon Chime Voice Connectors use TCP protocol by default.</p>
 */
@property (nonatomic, assign) AWSChimeOriginationRouteProtocol protocols;

/**
 <p>The weight associated with the host. If hosts are equal in priority, calls are distributed among them based on their relative weight.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable weight;

@end

/**
 <p>The phone number and proxy phone number for a participant in an Amazon Chime Voice Connector proxy session.</p>
 */
@interface AWSChimeParticipant : AWSModel


/**
 <p>The participant's phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumber;

/**
 <p>The participant's proxy phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable proxyPhoneNumber;

@end

/**
 <p>A phone number used for Amazon Chime Business Calling or an Amazon Chime Voice Connector.</p>
 */
@interface AWSChimePhoneNumber : AWSModel


/**
 <p>The phone number associations.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimePhoneNumberAssociation *> * _Nullable associations;

/**
 <p>The outbound calling name associated with the phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callingName;

/**
 <p>The outbound calling name status.</p>
 */
@property (nonatomic, assign) AWSChimeCallingNameStatus callingNameStatus;

/**
 <p>The phone number capabilities.</p>
 */
@property (nonatomic, strong) AWSChimePhoneNumberCapabilities * _Nullable capabilities;

/**
 <p>The phone number creation timestamp, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimestamp;

/**
 <p>The deleted phone number timestamp, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deletionTimestamp;

/**
 <p>The phone number, in E.164 format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable e164PhoneNumber;

/**
 <p>The phone number ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberId;

/**
 <p>The phone number product type.</p>
 */
@property (nonatomic, assign) AWSChimePhoneNumberProductType productType;

/**
 <p>The phone number status.</p>
 */
@property (nonatomic, assign) AWSChimePhoneNumberStatus status;

/**
 <p>The phone number type.</p>
 */
@property (nonatomic, assign) AWSChimePhoneNumberType types;

/**
 <p>The updated phone number timestamp, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedTimestamp;

@end

/**
 <p>The phone number associations, such as Amazon Chime account ID, Amazon Chime user ID, Amazon Chime Voice Connector ID, or Amazon Chime Voice Connector group ID.</p>
 */
@interface AWSChimePhoneNumberAssociation : AWSModel


/**
 <p>The timestamp of the phone number association, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable associatedTimestamp;

/**
 <p>Defines the association with an Amazon Chime account ID, user ID, Amazon Chime Voice Connector ID, or Amazon Chime Voice Connector group ID.</p>
 */
@property (nonatomic, assign) AWSChimePhoneNumberAssociationName name;

/**
 <p>Contains the ID for the entity specified in Name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>The phone number capabilities for Amazon Chime Business Calling phone numbers, such as enabled inbound and outbound calling and text messaging.</p>
 */
@interface AWSChimePhoneNumberCapabilities : AWSModel


/**
 <p>Allows or denies inbound calling for the specified phone number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inboundCall;

/**
 <p>Allows or denies inbound MMS messaging for the specified phone number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inboundMMS;

/**
 <p>Allows or denies inbound SMS messaging for the specified phone number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inboundSMS;

/**
 <p>Allows or denies outbound calling for the specified phone number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable outboundCall;

/**
 <p>Allows or denies outbound MMS messaging for the specified phone number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable outboundMMS;

/**
 <p>Allows or denies outbound SMS messaging for the specified phone number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable outboundSMS;

@end

/**
 <p>If the phone number action fails for one or more of the phone numbers in the request, a list of the phone numbers is returned, along with error codes and error messages.</p>
 */
@interface AWSChimePhoneNumberError : AWSModel


/**
 <p>The error code.</p>
 */
@property (nonatomic, assign) AWSChimeErrorCode errorCode;

/**
 <p>The error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The phone number ID for which the action failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberId;

@end

/**
 <p>The details of a phone number order created for Amazon Chime.</p>
 */
@interface AWSChimePhoneNumberOrder : AWSModel


/**
 <p>The phone number order creation timestamp, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimestamp;

/**
 <p>The ordered phone number details, such as the phone number in E.164 format and the phone number status.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeOrderedPhoneNumber *> * _Nullable orderedPhoneNumbers;

/**
 <p>The phone number order ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberOrderId;

/**
 <p>The phone number order product type.</p>
 */
@property (nonatomic, assign) AWSChimePhoneNumberProductType productType;

/**
 <p>The status of the phone number order.</p>
 */
@property (nonatomic, assign) AWSChimePhoneNumberOrderStatus status;

/**
 <p>The updated phone number order timestamp, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedTimestamp;

@end

/**
 <p>The proxy configuration for an Amazon Chime Voice Connector.</p>
 */
@interface AWSChimeProxy : AWSModel


/**
 <p>The default number of minutes allowed for proxy sessions.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultSessionExpiryMinutes;

/**
 <p>When true, stops proxy sessions from being created on the specified Amazon Chime Voice Connector.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disabled;

/**
 <p>The phone number to route calls to after a proxy session expires.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fallBackPhoneNumber;

/**
 <p>The countries for proxy phone numbers to be selected from.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable phoneNumberCountries;

@end

/**
 <p>The proxy session for an Amazon Chime Voice Connector.</p>
 */
@interface AWSChimeProxySession : AWSModel


/**
 <p>The proxy session capabilities.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable capabilities;

/**
 <p>The created timestamp, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimestamp;

/**
 <p>The ended timestamp, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endedTimestamp;

/**
 <p>The number of minutes allowed for the proxy session.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expiryMinutes;

/**
 <p>The preference for matching the country or area code of the proxy phone number with that of the first participant.</p>
 */
@property (nonatomic, assign) AWSChimeGeoMatchLevel geoMatchLevel;

/**
 <p>The country and area code for the proxy phone number.</p>
 */
@property (nonatomic, strong) AWSChimeGeoMatchParams * _Nullable geoMatchParams;

/**
 <p>The name of the proxy session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The preference for proxy phone number reuse, or stickiness, between the same participants across sessions.</p>
 */
@property (nonatomic, assign) AWSChimeNumberSelectionBehavior numberSelectionBehavior;

/**
 <p>The proxy session participants.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeParticipant *> * _Nullable participants;

/**
 <p>The proxy session ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable proxySessionId;

/**
 <p>The status of the proxy session.</p>
 */
@property (nonatomic, assign) AWSChimeProxySessionStatus status;

/**
 <p>The updated timestamp, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedTimestamp;

/**
 <p>The Amazon Chime voice connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimePutEventsConfigurationRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The bot ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botId;

/**
 <p>Lambda function ARN that allows the bot to receive outgoing events.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lambdaFunctionArn;

/**
 <p>HTTPS endpoint that allows the bot to receive outgoing events.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outboundEventsHTTPSEndpoint;

@end

/**
 
 */
@interface AWSChimePutEventsConfigurationResponse : AWSModel


/**
 <p>The configuration that allows a bot to receive outgoing events. Can be either an HTTPS endpoint or a Lambda function ARN.</p>
 */
@property (nonatomic, strong) AWSChimeEventsConfiguration * _Nullable eventsConfiguration;

@end

/**
 
 */
@interface AWSChimePutVoiceConnectorLoggingConfigurationRequest : AWSRequest


/**
 <p>The logging configuration details to add.</p>
 */
@property (nonatomic, strong) AWSChimeLoggingConfiguration * _Nullable loggingConfiguration;

/**
 <p>The Amazon Chime Voice Connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimePutVoiceConnectorLoggingConfigurationResponse : AWSModel


/**
 <p>The updated logging configuration details.</p>
 */
@property (nonatomic, strong) AWSChimeLoggingConfiguration * _Nullable loggingConfiguration;

@end

/**
 
 */
@interface AWSChimePutVoiceConnectorOriginationRequest : AWSRequest


/**
 <p>The origination setting details to add.</p>
 */
@property (nonatomic, strong) AWSChimeOrigination * _Nullable origination;

/**
 <p>The Amazon Chime Voice Connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimePutVoiceConnectorOriginationResponse : AWSModel


/**
 <p>The updated origination setting details.</p>
 */
@property (nonatomic, strong) AWSChimeOrigination * _Nullable origination;

@end

/**
 
 */
@interface AWSChimePutVoiceConnectorProxyRequest : AWSRequest


/**
 <p>The default number of minutes allowed for proxy sessions.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultSessionExpiryMinutes;

/**
 <p>When true, stops proxy sessions from being created on the specified Amazon Chime Voice Connector.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disabled;

/**
 <p>The phone number to route calls to after a proxy session expires.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fallBackPhoneNumber;

/**
 <p>The countries for proxy phone numbers to be selected from.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable phoneNumberPoolCountries;

/**
 <p>The Amazon Chime voice connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimePutVoiceConnectorProxyResponse : AWSModel


/**
 <p>The proxy configuration details.</p>
 */
@property (nonatomic, strong) AWSChimeProxy * _Nullable proxy;

@end

/**
 
 */
@interface AWSChimePutVoiceConnectorStreamingConfigurationRequest : AWSRequest


/**
 <p>The streaming configuration details to add.</p>
 */
@property (nonatomic, strong) AWSChimeStreamingConfiguration * _Nullable streamingConfiguration;

/**
 <p>The Amazon Chime Voice Connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimePutVoiceConnectorStreamingConfigurationResponse : AWSModel


/**
 <p>The updated streaming configuration details.</p>
 */
@property (nonatomic, strong) AWSChimeStreamingConfiguration * _Nullable streamingConfiguration;

@end

/**
 
 */
@interface AWSChimePutVoiceConnectorTerminationCredentialsRequest : AWSRequest


/**
 <p>The termination SIP credentials.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeCredential *> * _Nullable credentials;

/**
 <p>The Amazon Chime Voice Connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimePutVoiceConnectorTerminationRequest : AWSRequest


/**
 <p>The termination setting details to add.</p>
 */
@property (nonatomic, strong) AWSChimeTermination * _Nullable termination;

/**
 <p>The Amazon Chime Voice Connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimePutVoiceConnectorTerminationResponse : AWSModel


/**
 <p>The updated termination setting details.</p>
 */
@property (nonatomic, strong) AWSChimeTermination * _Nullable termination;

@end

/**
 
 */
@interface AWSChimeRedactConversationMessageRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The conversation ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable conversationId;

/**
 <p>The message ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

@end

/**
 
 */
@interface AWSChimeRedactConversationMessageResponse : AWSModel


@end

/**
 
 */
@interface AWSChimeRedactRoomMessageRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The message ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

/**
 <p>The room ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomId;

@end

/**
 
 */
@interface AWSChimeRedactRoomMessageResponse : AWSModel


@end

/**
 
 */
@interface AWSChimeRegenerateSecurityTokenRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The bot ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botId;

@end

/**
 
 */
@interface AWSChimeRegenerateSecurityTokenResponse : AWSModel


/**
 <p>A resource that allows Enterprise account administrators to configure an interface to receive events from Amazon Chime.</p>
 */
@property (nonatomic, strong) AWSChimeBot * _Nullable bot;

@end

/**
 
 */
@interface AWSChimeResetPersonalPINRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The user ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSChimeResetPersonalPINResponse : AWSModel


/**
 <p>The user details and new personal meeting PIN.</p>
 */
@property (nonatomic, strong) AWSChimeUser * _Nullable user;

@end

/**
 
 */
@interface AWSChimeRestorePhoneNumberRequest : AWSRequest


/**
 <p>The phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberId;

@end

/**
 
 */
@interface AWSChimeRestorePhoneNumberResponse : AWSModel


/**
 <p>The phone number details.</p>
 */
@property (nonatomic, strong) AWSChimePhoneNumber * _Nullable phoneNumber;

@end

/**
 <p>The Amazon Chime chat room details.</p>
 */
@interface AWSChimeRoom : AWSModel


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The identifier of the room creator.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdBy;

/**
 <p>The room creation timestamp, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimestamp;

/**
 <p>The room name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The room ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomId;

/**
 <p>The room update timestamp, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedTimestamp;

@end

/**
 <p>The room membership details.</p>
 */
@interface AWSChimeRoomMembership : AWSModel


/**
 <p>The identifier of the user that invited the room member.</p>
 */
@property (nonatomic, strong) NSString * _Nullable invitedBy;

/**
 <p>The member details, such as email address, name, member ID, and member type.</p>
 */
@property (nonatomic, strong) AWSChimeMember * _Nullable member;

/**
 <p>The membership role.</p>
 */
@property (nonatomic, assign) AWSChimeRoomMembershipRole role;

/**
 <p>The room ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomId;

/**
 <p>The room membership update timestamp, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedTimestamp;

@end

/**
 
 */
@interface AWSChimeSearchAvailablePhoneNumbersRequest : AWSRequest


/**
 <p>The area code used to filter results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable areaCode;

/**
 <p>The city used to filter results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable city;

/**
 <p>The country used to filter results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable country;

/**
 <p>The maximum number of results to return in a single call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The state used to filter results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable state;

/**
 <p>The toll-free prefix that you use to filter results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tollFreePrefix;

@end

/**
 
 */
@interface AWSChimeSearchAvailablePhoneNumbersResponse : AWSModel


/**
 <p>List of phone numbers, in E.164 format.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable e164PhoneNumbers;

@end

/**
 <p>An Active Directory (AD) group whose members are granted permission to act as delegates.</p>
 */
@interface AWSChimeSigninDelegateGroup : AWSModel


/**
 <p>The group name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

@end

/**
 <p>The streaming configuration associated with an Amazon Chime Voice Connector. Specifies whether media streaming is enabled for sending to Amazon Kinesis, and shows the retention period for the Amazon Kinesis data, in hours.</p>
 Required parameters: [DataRetentionInHours]
 */
@interface AWSChimeStreamingConfiguration : AWSModel


/**
 <p>The retention period, in hours, for the Amazon Kinesis data.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dataRetentionInHours;

/**
 <p>When true, media streaming to Amazon Kinesis is turned off.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disabled;

/**
 <p>The streaming notification targets.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeStreamingNotificationTarget *> * _Nullable streamingNotificationTargets;

@end

/**
 <p>The targeted recipient for a streaming configuration notification.</p>
 Required parameters: [NotificationTarget]
 */
@interface AWSChimeStreamingNotificationTarget : AWSModel


/**
 <p>The streaming notification target.</p>
 */
@property (nonatomic, assign) AWSChimeNotificationTarget notificationTarget;

@end

/**
 <p>Describes a tag applied to a resource.</p>
 Required parameters: [Key, Value]
 */
@interface AWSChimeTag : AWSModel


/**
 <p>The key of the tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value of the tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSChimeTagAttendeeRequest : AWSRequest


/**
 <p>The Amazon Chime SDK attendee ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attendeeId;

/**
 <p>The Amazon Chime SDK meeting ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meetingId;

/**
 <p>The tag key-value pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSChimeTagMeetingRequest : AWSRequest


/**
 <p>The Amazon Chime SDK meeting ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meetingId;

/**
 <p>The tag key-value pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSChimeTagResourceRequest : AWSRequest


/**
 <p>The resource ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

/**
 <p>The tag key-value pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeTag *> * _Nullable tags;

@end

/**
 <p>Settings that allow management of telephony permissions for an Amazon Chime user, such as inbound and outbound calling and text messaging.</p>
 Required parameters: [InboundCalling, OutboundCalling, SMS]
 */
@interface AWSChimeTelephonySettings : AWSModel


/**
 <p>Allows or denies inbound calling.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inboundCalling;

/**
 <p>Allows or denies outbound calling.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable outboundCalling;

/**
 <p>Allows or denies SMS messaging.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable SMS;

@end

/**
 <p>Termination settings enable your SIP hosts to make outbound calls using your Amazon Chime Voice Connector.</p>
 */
@interface AWSChimeTermination : AWSModel


/**
 <p>The countries to which calls are allowed, in ISO 3166-1 alpha-2 format. Required.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable callingRegions;

/**
 <p>The IP addresses allowed to make calls, in CIDR format. Required.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable cidrAllowedList;

/**
 <p>The limit on calls per second. Max value based on account service quota. Default value of 1.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cpsLimit;

/**
 <p>The default caller ID phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultPhoneNumber;

/**
 <p>When termination settings are disabled, outbound calls can not be made.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disabled;

@end

/**
 <p>The termination health details, including the source IP address and timestamp of the last successful SIP <code>OPTIONS</code> message from your SIP infrastructure.</p>
 */
@interface AWSChimeTerminationHealth : AWSModel


/**
 <p>The source IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable source;

/**
 <p>The timestamp, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

@end

/**
 
 */
@interface AWSChimeUntagAttendeeRequest : AWSRequest


/**
 <p>The Amazon Chime SDK attendee ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attendeeId;

/**
 <p>The Amazon Chime SDK meeting ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meetingId;

/**
 <p>The tag keys.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSChimeUntagMeetingRequest : AWSRequest


/**
 <p>The Amazon Chime SDK meeting ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meetingId;

/**
 <p>The tag keys.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSChimeUntagResourceRequest : AWSRequest


/**
 <p>The resource ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

/**
 <p>The tag keys.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSChimeUpdateAccountRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The new name for the specified Amazon Chime account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSChimeUpdateAccountResponse : AWSModel


/**
 <p>The updated Amazon Chime account details.</p>
 */
@property (nonatomic, strong) AWSChimeAccount * _Nullable account;

@end

/**
 
 */
@interface AWSChimeUpdateAccountSettingsRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The Amazon Chime account settings to update.</p>
 */
@property (nonatomic, strong) AWSChimeAccountSettings * _Nullable accountSettings;

@end

/**
 
 */
@interface AWSChimeUpdateAccountSettingsResponse : AWSModel


@end

/**
 
 */
@interface AWSChimeUpdateBotRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The bot ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botId;

/**
 <p>When true, stops the specified bot from running in your account.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disabled;

@end

/**
 
 */
@interface AWSChimeUpdateBotResponse : AWSModel


/**
 <p>The updated bot details.</p>
 */
@property (nonatomic, strong) AWSChimeBot * _Nullable bot;

@end

/**
 
 */
@interface AWSChimeUpdateGlobalSettingsRequest : AWSRequest


/**
 <p>The Amazon Chime Business Calling settings.</p>
 */
@property (nonatomic, strong) AWSChimeBusinessCallingSettings * _Nullable businessCalling;

/**
 <p>The Amazon Chime Voice Connector settings.</p>
 */
@property (nonatomic, strong) AWSChimeVoiceConnectorSettings * _Nullable voiceConnector;

@end

/**
 
 */
@interface AWSChimeUpdatePhoneNumberRequest : AWSRequest


/**
 <p>The outbound calling name associated with the phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callingName;

/**
 <p>The phone number ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberId;

/**
 <p>The product type.</p>
 */
@property (nonatomic, assign) AWSChimePhoneNumberProductType productType;

@end

/**
 <p>The phone number ID, product type, or calling name fields to update, used with the <a>BatchUpdatePhoneNumber</a> and <a>UpdatePhoneNumber</a> actions.</p>
 Required parameters: [PhoneNumberId]
 */
@interface AWSChimeUpdatePhoneNumberRequestItem : AWSModel


/**
 <p>The outbound calling name to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callingName;

/**
 <p>The phone number ID to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberId;

/**
 <p>The product type to update.</p>
 */
@property (nonatomic, assign) AWSChimePhoneNumberProductType productType;

@end

/**
 
 */
@interface AWSChimeUpdatePhoneNumberResponse : AWSModel


/**
 <p>The updated phone number details.</p>
 */
@property (nonatomic, strong) AWSChimePhoneNumber * _Nullable phoneNumber;

@end

/**
 
 */
@interface AWSChimeUpdatePhoneNumberSettingsRequest : AWSRequest


/**
 <p>The default outbound calling name for the account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callingName;

@end

/**
 
 */
@interface AWSChimeUpdateProxySessionRequest : AWSRequest


/**
 <p>The proxy session capabilities.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable capabilities;

/**
 <p>The number of minutes allowed for the proxy session.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expiryMinutes;

/**
 <p>The proxy session ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable proxySessionId;

/**
 <p>The Amazon Chime voice connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimeUpdateProxySessionResponse : AWSModel


/**
 <p>The proxy session details.</p>
 */
@property (nonatomic, strong) AWSChimeProxySession * _Nullable proxySession;

@end

/**
 
 */
@interface AWSChimeUpdateRoomMembershipRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The member ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberId;

/**
 <p>The role of the member.</p>
 */
@property (nonatomic, assign) AWSChimeRoomMembershipRole role;

/**
 <p>The room ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomId;

@end

/**
 
 */
@interface AWSChimeUpdateRoomMembershipResponse : AWSModel


/**
 <p>The room membership details.</p>
 */
@property (nonatomic, strong) AWSChimeRoomMembership * _Nullable roomMembership;

@end

/**
 
 */
@interface AWSChimeUpdateRoomRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The room name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The room ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roomId;

@end

/**
 
 */
@interface AWSChimeUpdateRoomResponse : AWSModel


/**
 <p>The room details.</p>
 */
@property (nonatomic, strong) AWSChimeRoom * _Nullable room;

@end

/**
 
 */
@interface AWSChimeUpdateUserRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The Alexa for Business metadata.</p>
 */
@property (nonatomic, strong) AWSChimeAlexaForBusinessMetadata * _Nullable alexaForBusinessMetadata;

/**
 <p>The user license type to update. This must be a supported license type for the Amazon Chime account that the user belongs to.</p>
 */
@property (nonatomic, assign) AWSChimeLicense licenseType;

/**
 <p>The user ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

/**
 <p>The user type.</p>
 */
@property (nonatomic, assign) AWSChimeUserType userType;

@end

/**
 <p>The user ID and user fields to update, used with the <a>BatchUpdateUser</a> action.</p>
 Required parameters: [UserId]
 */
@interface AWSChimeUpdateUserRequestItem : AWSModel


/**
 <p>The Alexa for Business metadata.</p>
 */
@property (nonatomic, strong) AWSChimeAlexaForBusinessMetadata * _Nullable alexaForBusinessMetadata;

/**
 <p>The user license type.</p>
 */
@property (nonatomic, assign) AWSChimeLicense licenseType;

/**
 <p>The user ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

/**
 <p>The user type.</p>
 */
@property (nonatomic, assign) AWSChimeUserType userType;

@end

/**
 
 */
@interface AWSChimeUpdateUserResponse : AWSModel


/**
 <p>The updated user details.</p>
 */
@property (nonatomic, strong) AWSChimeUser * _Nullable user;

@end

/**
 
 */
@interface AWSChimeUpdateUserSettingsRequest : AWSRequest


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The user ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

/**
 <p>The user settings to update.</p>
 */
@property (nonatomic, strong) AWSChimeUserSettings * _Nullable userSettings;

@end

/**
 
 */
@interface AWSChimeUpdateVoiceConnectorGroupRequest : AWSRequest


/**
 <p>The name of the Amazon Chime Voice Connector group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Amazon Chime Voice Connector group ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorGroupId;

/**
 <p>The <code>VoiceConnectorItems</code> to associate with the group.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeVoiceConnectorItem *> * _Nullable voiceConnectorItems;

@end

/**
 
 */
@interface AWSChimeUpdateVoiceConnectorGroupResponse : AWSModel


/**
 <p>The updated Amazon Chime Voice Connector group details.</p>
 */
@property (nonatomic, strong) AWSChimeVoiceConnectorGroup * _Nullable voiceConnectorGroup;

@end

/**
 
 */
@interface AWSChimeUpdateVoiceConnectorRequest : AWSRequest


/**
 <p>The name of the Amazon Chime Voice Connector.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>When enabled, requires encryption for the Amazon Chime Voice Connector.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requireEncryption;

/**
 <p>The Amazon Chime Voice Connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 
 */
@interface AWSChimeUpdateVoiceConnectorResponse : AWSModel


/**
 <p>The updated Amazon Chime Voice Connector details.</p>
 */
@property (nonatomic, strong) AWSChimeVoiceConnector * _Nullable voiceConnector;

@end

/**
 <p>The user on the Amazon Chime account.</p>
 Required parameters: [UserId]
 */
@interface AWSChimeUser : AWSModel


/**
 <p>The Amazon Chime account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The Alexa for Business metadata.</p>
 */
@property (nonatomic, strong) AWSChimeAlexaForBusinessMetadata * _Nullable alexaForBusinessMetadata;

/**
 <p>The display name of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>Date and time when the user is invited to the Amazon Chime account, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable invitedOn;

/**
 <p>The license type for the user.</p>
 */
@property (nonatomic, assign) AWSChimeLicense licenseType;

/**
 <p>The user's personal meeting PIN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable personalPIN;

/**
 <p>The primary email address of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable primaryEmail;

/**
 <p>The primary phone number associated with the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable primaryProvisionedNumber;

/**
 <p>Date and time when the user is registered, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable registeredOn;

/**
 <p>The user ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

/**
 <p>The user invite status.</p>
 */
@property (nonatomic, assign) AWSChimeInviteStatus userInvitationStatus;

/**
 <p>The user registration status.</p>
 */
@property (nonatomic, assign) AWSChimeRegistrationStatus userRegistrationStatus;

/**
 <p>The user type.</p>
 */
@property (nonatomic, assign) AWSChimeUserType userType;

@end

/**
 <p>The list of errors returned when errors are encountered during the <a>BatchSuspendUser</a>, <a>BatchUnsuspendUser</a>, or <a>BatchUpdateUser</a> actions. This includes user IDs, error codes, and error messages.</p>
 */
@interface AWSChimeUserError : AWSModel


/**
 <p>The error code.</p>
 */
@property (nonatomic, assign) AWSChimeErrorCode errorCode;

/**
 <p>The error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The user ID for which the action failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 <p>Settings associated with an Amazon Chime user, including inbound and outbound calling and text messaging.</p>
 Required parameters: [Telephony]
 */
@interface AWSChimeUserSettings : AWSModel


/**
 <p>The telephony settings associated with the user.</p>
 */
@property (nonatomic, strong) AWSChimeTelephonySettings * _Nullable telephony;

@end

/**
 <p>The Amazon Chime Voice Connector configuration, including outbound host name and encryption settings.</p>
 */
@interface AWSChimeVoiceConnector : AWSModel


/**
 <p>The AWS Region in which the Amazon Chime Voice Connector is created. Default: <code>us-east-1</code>.</p>
 */
@property (nonatomic, assign) AWSChimeVoiceConnectorAwsRegion awsRegion;

/**
 <p>The Amazon Chime Voice Connector creation timestamp, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimestamp;

/**
 <p>The name of the Amazon Chime Voice Connector.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The outbound host name for the Amazon Chime Voice Connector.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outboundHostName;

/**
 <p>Designates whether encryption is required for the Amazon Chime Voice Connector.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requireEncryption;

/**
 <p>The updated Amazon Chime Voice Connector timestamp, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedTimestamp;

/**
 <p>The Amazon Chime Voice Connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 <p>The Amazon Chime Voice Connector group configuration, including associated Amazon Chime Voice Connectors. You can include Amazon Chime Voice Connectors from different AWS Regions in your group. This creates a fault tolerant mechanism for fallback in case of availability events.</p>
 */
@interface AWSChimeVoiceConnectorGroup : AWSModel


/**
 <p>The Amazon Chime Voice Connector group creation timestamp, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimestamp;

/**
 <p>The name of the Amazon Chime Voice Connector group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The updated Amazon Chime Voice Connector group timestamp, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedTimestamp;

/**
 <p>The Amazon Chime Voice Connector group ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorGroupId;

/**
 <p>The Amazon Chime Voice Connectors to which to route inbound calls.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeVoiceConnectorItem *> * _Nullable voiceConnectorItems;

@end

/**
 <p>For Amazon Chime Voice Connector groups, the Amazon Chime Voice Connectors to which to route inbound calls. Includes priority configuration settings. Limit: 3 <code>VoiceConnectorItems</code> per Amazon Chime Voice Connector group.</p>
 Required parameters: [VoiceConnectorId, Priority]
 */
@interface AWSChimeVoiceConnectorItem : AWSModel


/**
 <p>The priority associated with the Amazon Chime Voice Connector, with 1 being the highest priority. Higher priority Amazon Chime Voice Connectors are attempted first. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p>The Amazon Chime Voice Connector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceConnectorId;

@end

/**
 <p>The Amazon Chime Voice Connector settings. Includes any Amazon S3 buckets designated for storing call detail records.</p>
 */
@interface AWSChimeVoiceConnectorSettings : AWSModel


/**
 <p>The Amazon S3 bucket designated for call detail record storage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cdrBucket;

@end

NS_ASSUME_NONNULL_END
