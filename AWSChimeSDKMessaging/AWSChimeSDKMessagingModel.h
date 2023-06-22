//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

FOUNDATION_EXPORT NSString *const AWSChimeSDKMessagingErrorDomain;

typedef NS_ENUM(NSInteger, AWSChimeSDKMessagingErrorType) {
    AWSChimeSDKMessagingErrorUnknown,
    AWSChimeSDKMessagingErrorBadRequest,
    AWSChimeSDKMessagingErrorConflict,
    AWSChimeSDKMessagingErrorForbidden,
    AWSChimeSDKMessagingErrorNotFound,
    AWSChimeSDKMessagingErrorResourceLimitExceeded,
    AWSChimeSDKMessagingErrorServiceFailure,
    AWSChimeSDKMessagingErrorServiceUnavailable,
    AWSChimeSDKMessagingErrorThrottledClient,
    AWSChimeSDKMessagingErrorUnauthorizedClient,
};

typedef NS_ENUM(NSInteger, AWSChimeSDKMessagingAllowNotifications) {
    AWSChimeSDKMessagingAllowNotificationsUnknown,
    AWSChimeSDKMessagingAllowNotificationsAll,
    AWSChimeSDKMessagingAllowNotificationsNone,
    AWSChimeSDKMessagingAllowNotificationsFiltered,
};

typedef NS_ENUM(NSInteger, AWSChimeSDKMessagingChannelMembershipType) {
    AWSChimeSDKMessagingChannelMembershipTypeUnknown,
    AWSChimeSDKMessagingChannelMembershipTypeDefault,
    AWSChimeSDKMessagingChannelMembershipTypeHidden,
};

typedef NS_ENUM(NSInteger, AWSChimeSDKMessagingChannelMessagePersistenceType) {
    AWSChimeSDKMessagingChannelMessagePersistenceTypeUnknown,
    AWSChimeSDKMessagingChannelMessagePersistenceTypePersistent,
    AWSChimeSDKMessagingChannelMessagePersistenceTypeNonPersistent,
};

typedef NS_ENUM(NSInteger, AWSChimeSDKMessagingChannelMessageStatus) {
    AWSChimeSDKMessagingChannelMessageStatusUnknown,
    AWSChimeSDKMessagingChannelMessageStatusSent,
    AWSChimeSDKMessagingChannelMessageStatusPending,
    AWSChimeSDKMessagingChannelMessageStatusFailed,
    AWSChimeSDKMessagingChannelMessageStatusDenied,
};

typedef NS_ENUM(NSInteger, AWSChimeSDKMessagingChannelMessageType) {
    AWSChimeSDKMessagingChannelMessageTypeUnknown,
    AWSChimeSDKMessagingChannelMessageTypeStandard,
    AWSChimeSDKMessagingChannelMessageTypeControl,
};

typedef NS_ENUM(NSInteger, AWSChimeSDKMessagingChannelMode) {
    AWSChimeSDKMessagingChannelModeUnknown,
    AWSChimeSDKMessagingChannelModeUnrestricted,
    AWSChimeSDKMessagingChannelModeRestricted,
};

typedef NS_ENUM(NSInteger, AWSChimeSDKMessagingChannelPrivacy) {
    AWSChimeSDKMessagingChannelPrivacyUnknown,
    AWSChimeSDKMessagingChannelPrivacyPublic,
    AWSChimeSDKMessagingChannelPrivacyPrivate,
};

typedef NS_ENUM(NSInteger, AWSChimeSDKMessagingErrorCode) {
    AWSChimeSDKMessagingErrorCodeUnknown,
    AWSChimeSDKMessagingErrorCodeBadRequest,
    AWSChimeSDKMessagingErrorCodeConflict,
    AWSChimeSDKMessagingErrorCodeForbidden,
    AWSChimeSDKMessagingErrorCodeNotFound,
    AWSChimeSDKMessagingErrorCodePreconditionFailed,
    AWSChimeSDKMessagingErrorCodeResourceLimitExceeded,
    AWSChimeSDKMessagingErrorCodeServiceFailure,
    AWSChimeSDKMessagingErrorCodeAccessDenied,
    AWSChimeSDKMessagingErrorCodeServiceUnavailable,
    AWSChimeSDKMessagingErrorCodeThrottled,
    AWSChimeSDKMessagingErrorCodeThrottling,
    AWSChimeSDKMessagingErrorCodeUnauthorized,
    AWSChimeSDKMessagingErrorCodeUnprocessable,
    AWSChimeSDKMessagingErrorCodeVoiceConnectorGroupAssociationsExist,
    AWSChimeSDKMessagingErrorCodePhoneNumberAssociationsExist,
};

typedef NS_ENUM(NSInteger, AWSChimeSDKMessagingExpirationCriterion) {
    AWSChimeSDKMessagingExpirationCriterionUnknown,
    AWSChimeSDKMessagingExpirationCriterionCreatedTimestamp,
    AWSChimeSDKMessagingExpirationCriterionLastMessageTimestamp,
};

typedef NS_ENUM(NSInteger, AWSChimeSDKMessagingFallbackAction) {
    AWSChimeSDKMessagingFallbackActionUnknown,
    AWSChimeSDKMessagingFallbackActionContinue,
    AWSChimeSDKMessagingFallbackActionAbort,
};

typedef NS_ENUM(NSInteger, AWSChimeSDKMessagingInvocationType) {
    AWSChimeSDKMessagingInvocationTypeUnknown,
    AWSChimeSDKMessagingInvocationTypeAsync,
};

typedef NS_ENUM(NSInteger, AWSChimeSDKMessagingMessagingDataType) {
    AWSChimeSDKMessagingMessagingDataTypeUnknown,
    AWSChimeSDKMessagingMessagingDataTypeChannel,
    AWSChimeSDKMessagingMessagingDataTypeChannelMessage,
};

typedef NS_ENUM(NSInteger, AWSChimeSDKMessagingPushNotificationType) {
    AWSChimeSDKMessagingPushNotificationTypeUnknown,
    AWSChimeSDKMessagingPushNotificationTypeDefault,
    AWSChimeSDKMessagingPushNotificationTypeVoip,
};

typedef NS_ENUM(NSInteger, AWSChimeSDKMessagingSearchFieldKey) {
    AWSChimeSDKMessagingSearchFieldKeyUnknown,
    AWSChimeSDKMessagingSearchFieldKeyMembers,
};

typedef NS_ENUM(NSInteger, AWSChimeSDKMessagingSearchFieldOperator) {
    AWSChimeSDKMessagingSearchFieldOperatorUnknown,
    AWSChimeSDKMessagingSearchFieldOperatorEquals,
    AWSChimeSDKMessagingSearchFieldOperatorIncludes,
};

typedef NS_ENUM(NSInteger, AWSChimeSDKMessagingSortOrder) {
    AWSChimeSDKMessagingSortOrderUnknown,
    AWSChimeSDKMessagingSortOrderAscending,
    AWSChimeSDKMessagingSortOrderDescending,
};

@class AWSChimeSDKMessagingAppInstanceUserMembershipSummary;
@class AWSChimeSDKMessagingAssociateChannelFlowRequest;
@class AWSChimeSDKMessagingBatchChannelMemberships;
@class AWSChimeSDKMessagingBatchCreateChannelMembershipError;
@class AWSChimeSDKMessagingBatchCreateChannelMembershipRequest;
@class AWSChimeSDKMessagingBatchCreateChannelMembershipResponse;
@class AWSChimeSDKMessagingChannel;
@class AWSChimeSDKMessagingChannelAssociatedWithFlowSummary;
@class AWSChimeSDKMessagingChannelBan;
@class AWSChimeSDKMessagingChannelBanSummary;
@class AWSChimeSDKMessagingChannelFlow;
@class AWSChimeSDKMessagingChannelFlowCallbackRequest;
@class AWSChimeSDKMessagingChannelFlowCallbackResponse;
@class AWSChimeSDKMessagingChannelFlowSummary;
@class AWSChimeSDKMessagingChannelMembership;
@class AWSChimeSDKMessagingChannelMembershipForAppInstanceUserSummary;
@class AWSChimeSDKMessagingChannelMembershipPreferences;
@class AWSChimeSDKMessagingChannelMembershipSummary;
@class AWSChimeSDKMessagingChannelMessage;
@class AWSChimeSDKMessagingChannelMessageCallback;
@class AWSChimeSDKMessagingChannelMessageStatusStructure;
@class AWSChimeSDKMessagingChannelMessageSummary;
@class AWSChimeSDKMessagingChannelModeratedByAppInstanceUserSummary;
@class AWSChimeSDKMessagingChannelModerator;
@class AWSChimeSDKMessagingChannelModeratorSummary;
@class AWSChimeSDKMessagingChannelSummary;
@class AWSChimeSDKMessagingCreateChannelBanRequest;
@class AWSChimeSDKMessagingCreateChannelBanResponse;
@class AWSChimeSDKMessagingCreateChannelFlowRequest;
@class AWSChimeSDKMessagingCreateChannelFlowResponse;
@class AWSChimeSDKMessagingCreateChannelMembershipRequest;
@class AWSChimeSDKMessagingCreateChannelMembershipResponse;
@class AWSChimeSDKMessagingCreateChannelModeratorRequest;
@class AWSChimeSDKMessagingCreateChannelModeratorResponse;
@class AWSChimeSDKMessagingCreateChannelRequest;
@class AWSChimeSDKMessagingCreateChannelResponse;
@class AWSChimeSDKMessagingDeleteChannelBanRequest;
@class AWSChimeSDKMessagingDeleteChannelFlowRequest;
@class AWSChimeSDKMessagingDeleteChannelMembershipRequest;
@class AWSChimeSDKMessagingDeleteChannelMessageRequest;
@class AWSChimeSDKMessagingDeleteChannelModeratorRequest;
@class AWSChimeSDKMessagingDeleteChannelRequest;
@class AWSChimeSDKMessagingDeleteMessagingStreamingConfigurationsRequest;
@class AWSChimeSDKMessagingDescribeChannelBanRequest;
@class AWSChimeSDKMessagingDescribeChannelBanResponse;
@class AWSChimeSDKMessagingDescribeChannelFlowRequest;
@class AWSChimeSDKMessagingDescribeChannelFlowResponse;
@class AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserRequest;
@class AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserResponse;
@class AWSChimeSDKMessagingDescribeChannelMembershipRequest;
@class AWSChimeSDKMessagingDescribeChannelMembershipResponse;
@class AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserRequest;
@class AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserResponse;
@class AWSChimeSDKMessagingDescribeChannelModeratorRequest;
@class AWSChimeSDKMessagingDescribeChannelModeratorResponse;
@class AWSChimeSDKMessagingDescribeChannelRequest;
@class AWSChimeSDKMessagingDescribeChannelResponse;
@class AWSChimeSDKMessagingDisassociateChannelFlowRequest;
@class AWSChimeSDKMessagingElasticChannelConfiguration;
@class AWSChimeSDKMessagingExpirationSettings;
@class AWSChimeSDKMessagingGetChannelMembershipPreferencesRequest;
@class AWSChimeSDKMessagingGetChannelMembershipPreferencesResponse;
@class AWSChimeSDKMessagingGetChannelMessageRequest;
@class AWSChimeSDKMessagingGetChannelMessageResponse;
@class AWSChimeSDKMessagingGetChannelMessageStatusRequest;
@class AWSChimeSDKMessagingGetChannelMessageStatusResponse;
@class AWSChimeSDKMessagingGetMessagingSessionEndpointRequest;
@class AWSChimeSDKMessagingGetMessagingSessionEndpointResponse;
@class AWSChimeSDKMessagingGetMessagingStreamingConfigurationsRequest;
@class AWSChimeSDKMessagingGetMessagingStreamingConfigurationsResponse;
@class AWSChimeSDKMessagingIdentity;
@class AWSChimeSDKMessagingLambdaConfiguration;
@class AWSChimeSDKMessagingListChannelBansRequest;
@class AWSChimeSDKMessagingListChannelBansResponse;
@class AWSChimeSDKMessagingListChannelFlowsRequest;
@class AWSChimeSDKMessagingListChannelFlowsResponse;
@class AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserRequest;
@class AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserResponse;
@class AWSChimeSDKMessagingListChannelMembershipsRequest;
@class AWSChimeSDKMessagingListChannelMembershipsResponse;
@class AWSChimeSDKMessagingListChannelMessagesRequest;
@class AWSChimeSDKMessagingListChannelMessagesResponse;
@class AWSChimeSDKMessagingListChannelModeratorsRequest;
@class AWSChimeSDKMessagingListChannelModeratorsResponse;
@class AWSChimeSDKMessagingListChannelsAssociatedWithChannelFlowRequest;
@class AWSChimeSDKMessagingListChannelsAssociatedWithChannelFlowResponse;
@class AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserRequest;
@class AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserResponse;
@class AWSChimeSDKMessagingListChannelsRequest;
@class AWSChimeSDKMessagingListChannelsResponse;
@class AWSChimeSDKMessagingListSubChannelsRequest;
@class AWSChimeSDKMessagingListSubChannelsResponse;
@class AWSChimeSDKMessagingListTagsForResourceRequest;
@class AWSChimeSDKMessagingListTagsForResourceResponse;
@class AWSChimeSDKMessagingMessageAttributeValue;
@class AWSChimeSDKMessagingMessagingSessionEndpoint;
@class AWSChimeSDKMessagingProcessor;
@class AWSChimeSDKMessagingProcessorConfiguration;
@class AWSChimeSDKMessagingPushNotificationConfiguration;
@class AWSChimeSDKMessagingPushNotificationPreferences;
@class AWSChimeSDKMessagingPutChannelExpirationSettingsRequest;
@class AWSChimeSDKMessagingPutChannelExpirationSettingsResponse;
@class AWSChimeSDKMessagingPutChannelMembershipPreferencesRequest;
@class AWSChimeSDKMessagingPutChannelMembershipPreferencesResponse;
@class AWSChimeSDKMessagingPutMessagingStreamingConfigurationsRequest;
@class AWSChimeSDKMessagingPutMessagingStreamingConfigurationsResponse;
@class AWSChimeSDKMessagingRedactChannelMessageRequest;
@class AWSChimeSDKMessagingRedactChannelMessageResponse;
@class AWSChimeSDKMessagingSearchChannelsRequest;
@class AWSChimeSDKMessagingSearchChannelsResponse;
@class AWSChimeSDKMessagingSearchField;
@class AWSChimeSDKMessagingSendChannelMessageRequest;
@class AWSChimeSDKMessagingSendChannelMessageResponse;
@class AWSChimeSDKMessagingStreamingConfiguration;
@class AWSChimeSDKMessagingSubChannelSummary;
@class AWSChimeSDKMessagingTag;
@class AWSChimeSDKMessagingTagResourceRequest;
@class AWSChimeSDKMessagingTarget;
@class AWSChimeSDKMessagingUntagResourceRequest;
@class AWSChimeSDKMessagingUpdateChannelFlowRequest;
@class AWSChimeSDKMessagingUpdateChannelFlowResponse;
@class AWSChimeSDKMessagingUpdateChannelMessageRequest;
@class AWSChimeSDKMessagingUpdateChannelMessageResponse;
@class AWSChimeSDKMessagingUpdateChannelReadMarkerRequest;
@class AWSChimeSDKMessagingUpdateChannelReadMarkerResponse;
@class AWSChimeSDKMessagingUpdateChannelRequest;
@class AWSChimeSDKMessagingUpdateChannelResponse;

/**
 <p>Summary of the membership details of an <code>AppInstanceUser</code>.</p>
 */
@interface AWSChimeSDKMessagingAppInstanceUserMembershipSummary : AWSModel


/**
 <p>The time at which an <code>AppInstanceUser</code> last marked a channel as read.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable readMarkerTimestamp;

/**
 <p>The ID of the SubChannel that the <code>AppInstanceUser</code> is a member of.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subChannelId;

/**
 <p>The type of <code>ChannelMembership</code>.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelMembershipType types;

@end

/**
 
 */
@interface AWSChimeSDKMessagingAssociateChannelFlowRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the channel flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelFlowArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the user making the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

@end

/**
 <p>The membership information, including member ARNs, the channel ARN, and membership types.</p>
 */
@interface AWSChimeSDKMessagingBatchChannelMemberships : AWSModel


/**
 <p>The ARN of the channel to which you're adding members.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The identifier of the member who invited another member.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingIdentity * _Nullable invitedBy;

/**
 <p>The users successfully added to the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingIdentity *> * _Nullable members;

/**
 <p>The ID of the SubChannel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subChannelId;

/**
 <p>The membership types set for the channel members.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelMembershipType types;

@end

/**
 <p>A list of failed member ARNs, error codes, and error messages.</p>
 */
@interface AWSChimeSDKMessagingBatchCreateChannelMembershipError : AWSModel


/**
 <p>The error code.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingErrorCode errorCode;

/**
 <p>The error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The <code>AppInstanceUserArn</code> of the member that the service couldn't add.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberArn;

@end

/**
 
 */
@interface AWSChimeSDKMessagingBatchCreateChannelMembershipRequest : AWSRequest


/**
 <p>The ARN of the channel to which you're adding users or bots.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The ARNs of the members you want to add to the channel. Only <code>AppInstanceUsers</code> and <code>AppInstanceBots</code> can be added as a channel member.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable memberArns;

/**
 <p>The ID of the SubChannel in the request. </p><note><p>Only required when creating membership in a SubChannel for a moderator in an elastic channel.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable subChannelId;

/**
 <p>The membership type of a user, <code>DEFAULT</code> or <code>HIDDEN</code>. Default members are always returned as part of <code>ListChannelMemberships</code>. Hidden members are only returned if the type filter in <code>ListChannelMemberships</code> equals <code>HIDDEN</code>. Otherwise hidden members are not returned. This is only supported by moderators.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelMembershipType types;

@end

/**
 
 */
@interface AWSChimeSDKMessagingBatchCreateChannelMembershipResponse : AWSModel


/**
 <p>The list of channel memberships in the response.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingBatchChannelMemberships * _Nullable batchChannelMemberships;

/**
 <p>If the action fails for one or more of the memberships in the request, a list of the memberships is returned, along with error codes and error messages.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingBatchCreateChannelMembershipError *> * _Nullable errors;

@end

/**
 <p>The details of a channel.</p>
 */
@interface AWSChimeSDKMessagingChannel : AWSModel


/**
 <p>The ARN of a channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the channel flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelFlowArn;

/**
 <p>The <code>AppInstanceUser</code> who created the channel.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingIdentity * _Nullable createdBy;

/**
 <p>The time at which the <code>AppInstanceUser</code> created the channel.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimestamp;

/**
 <p>The attributes required to configure and create an elastic channel. An elastic channel can support a maximum of 1-million members.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingElasticChannelConfiguration * _Nullable elasticChannelConfiguration;

/**
 <p>Settings that control when a channel expires.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingExpirationSettings * _Nullable expirationSettings;

/**
 <p>The time at which a member sent the last message in the channel.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastMessageTimestamp;

/**
 <p>The time at which a channel was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTimestamp;

/**
 <p>The channel's metadata.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metadata;

/**
 <p>The mode of the channel.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelMode mode;

/**
 <p>The name of a channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The channel's privacy setting.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelPrivacy privacy;

@end

/**
 <p>Summary of details of a channel associated with channel flow.</p>
 */
@interface AWSChimeSDKMessagingChannelAssociatedWithFlowSummary : AWSModel


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The channel's metadata.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metadata;

/**
 <p>The mode of the channel.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelMode mode;

/**
 <p>The name of the channel flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The channel's privacy setting.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelPrivacy privacy;

@end

/**
 <p>The details of a channel ban.</p>
 */
@interface AWSChimeSDKMessagingChannelBan : AWSModel


/**
 <p>The ARN of the channel from which a member is being banned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The <code>AppInstanceUser</code> who created the ban.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingIdentity * _Nullable createdBy;

/**
 <p>The time at which the ban was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimestamp;

/**
 <p>The member being banned from the channel.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingIdentity * _Nullable member;

@end

/**
 <p>Summary of the details of a <code>ChannelBan</code>.</p>
 */
@interface AWSChimeSDKMessagingChannelBanSummary : AWSModel


/**
 <p>The member being banned from a channel.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingIdentity * _Nullable member;

@end

/**
 <p>The details of a channel flow.</p>
 */
@interface AWSChimeSDKMessagingChannelFlow : AWSModel


/**
 <p>The ARN of the channel flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelFlowArn;

/**
 <p>The time at which the channel flow was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimestamp;

/**
 <p>The time at which a channel flow was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTimestamp;

/**
 <p>The name of the channel flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Information about the processor Lambda functions.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingProcessor *> * _Nullable processors;

@end

/**
 
 */
@interface AWSChimeSDKMessagingChannelFlowCallbackRequest : AWSRequest


/**
 <p>The identifier passed to the processor by the service when invoked. Use the identifier to call back the service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callbackId;

/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>Stores information about the processed message.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingChannelMessageCallback * _Nullable channelMessage;

/**
 <p>When a processor determines that a message needs to be <code>DENIED</code>, pass this parameter with a value of true.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteResource;

@end

/**
 
 */
@interface AWSChimeSDKMessagingChannelFlowCallbackResponse : AWSModel


/**
 <p>The call back ID passed in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callbackId;

/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

@end

/**
 <p>Summary of details of a channel flow.</p>
 */
@interface AWSChimeSDKMessagingChannelFlowSummary : AWSModel


/**
 <p>The ARN of the channel flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelFlowArn;

/**
 <p>The name of the channel flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Information about the processor Lambda functions.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingProcessor *> * _Nullable processors;

@end

/**
 <p>The details of a channel member.</p>
 */
@interface AWSChimeSDKMessagingChannelMembership : AWSModel


/**
 <p>The ARN of the member's channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The time at which the channel membership was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimestamp;

/**
 <p>The identifier of the member who invited another member.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingIdentity * _Nullable invitedBy;

/**
 <p>The time at which a channel membership was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTimestamp;

/**
 <p>The data of the channel member.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingIdentity * _Nullable member;

/**
 <p>The ID of the SubChannel that a user belongs to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subChannelId;

/**
 <p>The membership type set for the channel member.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelMembershipType types;

@end

/**
 <p>Summary of the channel membership details of an <code>AppInstanceUser</code>.</p>
 */
@interface AWSChimeSDKMessagingChannelMembershipForAppInstanceUserSummary : AWSModel


/**
 <p>Returns the channel membership data for an <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingAppInstanceUserMembershipSummary * _Nullable appInstanceUserMembershipSummary;

/**
 <p>Returns the channel data for an <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingChannelSummary * _Nullable channelSummary;

@end

/**
 <p>The channel membership preferences for an <code>AppInstanceUser</code>.</p>
 */
@interface AWSChimeSDKMessagingChannelMembershipPreferences : AWSModel


/**
 <p>The push notification configuration of a message.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingPushNotificationPreferences * _Nullable pushNotifications;

@end

/**
 <p>Summary of the details of a <code>ChannelMembership</code>.</p>
 */
@interface AWSChimeSDKMessagingChannelMembershipSummary : AWSModel


/**
 <p>A member's summary data.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingIdentity * _Nullable member;

@end

/**
 <p>The details of a message in a channel.</p>
 */
@interface AWSChimeSDKMessagingChannelMessage : AWSModel


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The content of the channel message. For Amazon Lex V2 bot responses, this field holds a list of messages originating from the bot. For more information, refer to <a href="https://docs.aws.amazon.com/chime-sdk/latest/dg/appinstance-bots#process-response.html">Processing responses from an AppInstanceBot</a> in the <i>Amazon Chime SDK Messaging Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The content type of the channel message. For Amazon Lex V2 bot responses, the content type is <code>application/amz-chime-lex-msgs</code> for success responses and <code>application/amz-chime-lex-error</code> for failure responses. For more information, refer to <a href="https://docs.aws.amazon.com/chime-sdk/latest/dg/appinstance-bots#process-response.html">Processing responses from an AppInstanceBot</a> in the <i>Amazon Chime SDK Messaging Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The time at which the message was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimestamp;

/**
 <p>The time at which a message was edited.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastEditedTimestamp;

/**
 <p>The time at which a message was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTimestamp;

/**
 <p>The attributes for the channel message. For Amazon Lex V2 bot responses, the attributes are mapped to specific fields from the bot. For more information, refer to <a href="https://docs.aws.amazon.com/chime-sdk/latest/dg/appinstance-bots#process-response.html">Processing responses from an AppInstanceBot</a> in the <i>Amazon Chime SDK Messaging Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSChimeSDKMessagingMessageAttributeValue *> * _Nullable messageAttributes;

/**
 <p>The ID of a message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

/**
 <p>The message metadata.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metadata;

/**
 <p>The persistence setting for a channel message.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelMessagePersistenceType persistence;

/**
 <p>Hides the content of a message.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable redacted;

/**
 <p>The message sender.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingIdentity * _Nullable sender;

/**
 <p>The status of the channel message.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingChannelMessageStatusStructure * _Nullable status;

/**
 <p>The ID of the SubChannel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subChannelId;

/**
 <p>The target of a message, a sender, a user, or a bot. Only the target and the sender can view targeted messages. Only users who can see targeted messages can take actions on them. However, administrators can delete targeted messages that they can’t see.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingTarget *> * _Nullable target;

/**
 <p>The message type.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelMessageType types;

@end

/**
 <p>Stores information about a callback.</p>
 Required parameters: [MessageId]
 */
@interface AWSChimeSDKMessagingChannelMessageCallback : AWSModel


/**
 <p>The message content. For Amazon Lex V2 bot responses, this field holds a list of messages originating from the bot. For more information, refer to <a href="https://docs.aws.amazon.com/chime-sdk/latest/dg/appinstance-bots#process-response.html">Processing responses from an AppInstanceBot</a> in the <i>Amazon Chime SDK Messaging Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The content type of the call-back message. For Amazon Lex V2 bot responses, the content type is <code>application/amz-chime-lex-msgs</code> for success responses and <code>application/amz-chime-lex-error</code> for failure responses. For more information, refer to <a href="https://docs.aws.amazon.com/chime-sdk/latest/dg/appinstance-bots#process-response.html">Processing responses from an AppInstanceBot</a> in the <i>Amazon Chime SDK Messaging Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The attributes for the channel message. For Amazon Lex V2 bot responses, the attributes are mapped to specific fields from the bot. For more information, refer to <a href="https://docs.aws.amazon.com/chime-sdk/latest/dg/appinstance-bots#process-response.html">Processing responses from an AppInstanceBot</a> in the <i>Amazon Chime SDK Messaging Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSChimeSDKMessagingMessageAttributeValue *> * _Nullable messageAttributes;

/**
 <p>The message ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

/**
 <p>The message metadata.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metadata;

/**
 <p>The push notification configuration of the message.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingPushNotificationConfiguration * _Nullable pushNotification;

/**
 <p>The ID of the SubChannel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subChannelId;

@end

/**
 <p>Stores information about a message status.</p>
 */
@interface AWSChimeSDKMessagingChannelMessageStatusStructure : AWSModel


/**
 <p>Contains more details about the message status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The message status value.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelMessageStatus value;

@end

/**
 <p>Summary of the messages in a <code>Channel</code>.</p>
 */
@interface AWSChimeSDKMessagingChannelMessageSummary : AWSModel


/**
 <p>The content of the channel message. For Amazon Lex V2 bot responses, this field holds a list of messages originating from the bot. For more information, refer to <a href="https://docs.aws.amazon.com/chime-sdk/latest/dg/appinstance-bots#process-response.html">Processing responses from an AppInstanceBot</a> in the <i>Amazon Chime SDK Messaging Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The content type of the channel message listed in the summary. For Amazon Lex V2 bot responses, the content type is <code>application/amz-chime-lex-msgs</code> for success responses and <code>application/amz-chime-lex-error</code> for failure responses. For more information, refer to <a href="https://docs.aws.amazon.com/chime-sdk/latest/dg/appinstance-bots#process-response.html">Processing responses from an AppInstanceBot</a> in the <i>Amazon Chime SDK Messaging Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The time at which the message summary was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimestamp;

/**
 <p>The time at which a message was last edited.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastEditedTimestamp;

/**
 <p>The time at which a message was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTimestamp;

/**
 <p>The attributes for the channel message. For Amazon Lex V2 bot responses, the attributes are mapped to specific fields from the bot. For more information, refer to <a href="https://docs.aws.amazon.com/chime-sdk/latest/dg/appinstance-bots#process-response.html">Processing responses from an AppInstanceBot</a> in the <i>Amazon Chime SDK Messaging Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSChimeSDKMessagingMessageAttributeValue *> * _Nullable messageAttributes;

/**
 <p>The ID of the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

/**
 <p>The metadata of the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metadata;

/**
 <p>Indicates whether a message was redacted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable redacted;

/**
 <p>The message sender.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingIdentity * _Nullable sender;

/**
 <p>The message status. The status value is <code>SENT</code> for messages sent to a channel without a channel flow. For channels associated with channel flow, the value determines the processing stage.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingChannelMessageStatusStructure * _Nullable status;

/**
 <p>The target of a message, a sender, a user, or a bot. Only the target and the sender can view targeted messages. Only users who can see targeted messages can take actions on them. However, administrators can delete targeted messages that they can’t see.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingTarget *> * _Nullable target;

/**
 <p>The type of message.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelMessageType types;

@end

/**
 <p>Summary of the details of a moderated channel.</p>
 */
@interface AWSChimeSDKMessagingChannelModeratedByAppInstanceUserSummary : AWSModel


/**
 <p>Summary of the details of a <code>Channel</code>.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingChannelSummary * _Nullable channelSummary;

@end

/**
 <p>The details of a channel moderator.</p>
 */
@interface AWSChimeSDKMessagingChannelModerator : AWSModel


/**
 <p>The ARN of the moderator's channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The <code>AppInstanceUser</code> who created the moderator.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingIdentity * _Nullable createdBy;

/**
 <p>The time at which the moderator was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimestamp;

/**
 <p>The moderator's data.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingIdentity * _Nullable moderator;

@end

/**
 <p>Summary of the details of a <code>ChannelModerator</code>.</p>
 */
@interface AWSChimeSDKMessagingChannelModeratorSummary : AWSModel


/**
 <p>The data for a moderator.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingIdentity * _Nullable moderator;

@end

/**
 <p>Summary of the details of a <code>Channel</code>.</p>
 */
@interface AWSChimeSDKMessagingChannelSummary : AWSModel


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The time at which the last persistent message visible to the caller in a channel was sent.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastMessageTimestamp;

/**
 <p>The metadata of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metadata;

/**
 <p>The mode of the channel.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelMode mode;

/**
 <p>The name of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The privacy setting of the channel.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelPrivacy privacy;

@end

/**
 
 */
@interface AWSChimeSDKMessagingCreateChannelBanRequest : AWSRequest


/**
 <p>The ARN of the ban request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The <code>AppInstanceUserArn</code> of the member being banned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberArn;

@end

/**
 
 */
@interface AWSChimeSDKMessagingCreateChannelBanResponse : AWSModel


/**
 <p>The ARN of the response to the ban request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The <code>ChannelArn</code> and <code>BannedIdentity</code> of the member in the ban response.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingIdentity * _Nullable member;

@end

/**
 
 */
@interface AWSChimeSDKMessagingCreateChannelFlowRequest : AWSRequest


/**
 <p>The ARN of the channel flow request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

/**
 <p>The client token for the request. An Idempotency token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The name of the channel flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Information about the processor Lambda functions.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingProcessor *> * _Nullable processors;

/**
 <p>The tags for the creation request.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSChimeSDKMessagingCreateChannelFlowResponse : AWSModel


/**
 <p>The ARN of the channel flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelFlowArn;

@end

/**
 
 */
@interface AWSChimeSDKMessagingCreateChannelMembershipRequest : AWSRequest


/**
 <p>The ARN of the channel to which you're adding users.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The <code>AppInstanceUserArn</code> of the member you want to add to the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberArn;

/**
 <p>The ID of the SubChannel in the request.</p><note><p>Only required when creating membership in a SubChannel for a moderator in an elastic channel.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable subChannelId;

/**
 <p>The membership type of a user, <code>DEFAULT</code> or <code>HIDDEN</code>. Default members are always returned as part of <code>ListChannelMemberships</code>. Hidden members are only returned if the type filter in <code>ListChannelMemberships</code> equals <code>HIDDEN</code>. Otherwise hidden members are not returned. This is only supported by moderators.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelMembershipType types;

@end

/**
 
 */
@interface AWSChimeSDKMessagingCreateChannelMembershipResponse : AWSModel


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN and metadata of the member being added.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingIdentity * _Nullable member;

/**
 <p>The ID of the SubChannel in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subChannelId;

@end

/**
 
 */
@interface AWSChimeSDKMessagingCreateChannelModeratorRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the moderator.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelModeratorArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

@end

/**
 
 */
@interface AWSChimeSDKMessagingCreateChannelModeratorResponse : AWSModel


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARNs of the channel and the moderator.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingIdentity * _Nullable channelModerator;

@end

/**
 
 */
@interface AWSChimeSDKMessagingCreateChannelRequest : AWSRequest


/**
 <p>The ARN of the channel request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

/**
 <p>The ID of the channel in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The client token for the request. An <code>Idempotency</code> token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The attributes required to configure and create an elastic channel. An elastic channel can support a maximum of 1-million users, excluding moderators.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingElasticChannelConfiguration * _Nullable elasticChannelConfiguration;

/**
 <p>Settings that control the interval after which the channel is automatically deleted.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingExpirationSettings * _Nullable expirationSettings;

/**
 <p>The ARNs of the channel members in the request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable memberArns;

/**
 <p>The metadata of the creation request. Limited to 1KB and UTF-8.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metadata;

/**
 <p>The channel mode: <code>UNRESTRICTED</code> or <code>RESTRICTED</code>. Administrators, moderators, and channel members can add themselves and other members to unrestricted channels. Only administrators and moderators can add members to restricted channels.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelMode mode;

/**
 <p>The ARNs of the channel moderators in the request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable moderatorArns;

/**
 <p>The name of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The channel's privacy level: <code>PUBLIC</code> or <code>PRIVATE</code>. Private channels aren't discoverable by users outside the channel. Public channels are discoverable by anyone in the <code>AppInstance</code>.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelPrivacy privacy;

/**
 <p>The tags for the creation request.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSChimeSDKMessagingCreateChannelResponse : AWSModel


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDeleteChannelBanRequest : AWSRequest


/**
 <p>The ARN of the channel from which the <code>AppInstanceUser</code> was banned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The ARN of the <code>AppInstanceUser</code> that you want to reinstate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberArn;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDeleteChannelFlowRequest : AWSRequest


/**
 <p>The ARN of the channel flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelFlowArn;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDeleteChannelMembershipRequest : AWSRequest


/**
 <p>The ARN of the channel from which you want to remove the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The <code>AppInstanceUserArn</code> of the member that you're removing from the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberArn;

/**
 <p>The ID of the SubChannel in the request.</p><note><p>Only for use by moderators.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable subChannelId;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDeleteChannelMessageRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The ID of the message being deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

/**
 <p>The ID of the SubChannel in the request.</p><note><p>Only required when deleting messages in a SubChannel that the user belongs to.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable subChannelId;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDeleteChannelModeratorRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the moderator being deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelModeratorArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDeleteChannelRequest : AWSRequest


/**
 <p>The ARN of the channel being deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDeleteMessagingStreamingConfigurationsRequest : AWSRequest


/**
 <p>The ARN of the streaming configurations being deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDescribeChannelBanRequest : AWSRequest


/**
 <p>The ARN of the channel from which the user is banned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The <code>AppInstanceUserArn</code> of the member being banned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberArn;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDescribeChannelBanResponse : AWSModel


/**
 <p>The details of the ban.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingChannelBan * _Nullable channelBan;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDescribeChannelFlowRequest : AWSRequest


/**
 <p>The ARN of the channel flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelFlowArn;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDescribeChannelFlowResponse : AWSModel


/**
 <p>The channel flow details.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingChannelFlow * _Nullable channelFlow;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserRequest : AWSRequest


/**
 <p>The ARN of the user or bot in a channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserArn;

/**
 <p>The ARN of the channel to which the user belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserResponse : AWSModel


/**
 <p>The channel to which a user belongs.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingChannelMembershipForAppInstanceUserSummary * _Nullable channelMembership;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDescribeChannelMembershipRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The <code>AppInstanceUserArn</code> of the member.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberArn;

/**
 <p>The ID of the SubChannel in the request. The response contains an <code>ElasticChannelConfiguration</code> object.</p><note><p>Only required to get a user’s SubChannel membership details.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable subChannelId;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDescribeChannelMembershipResponse : AWSModel


/**
 <p>The details of the membership.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingChannelMembership * _Nullable channelMembership;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserRequest : AWSRequest


/**
 <p>The ARN of the user or bot in the moderated channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserArn;

/**
 <p>The ARN of the moderated channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserResponse : AWSModel


/**
 <p>The moderated channel.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingChannelModeratedByAppInstanceUserSummary * _Nullable channel;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDescribeChannelModeratorRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the channel moderator.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelModeratorArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDescribeChannelModeratorResponse : AWSModel


/**
 <p>The details of the channel moderator.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingChannelModerator * _Nullable channelModerator;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDescribeChannelRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDescribeChannelResponse : AWSModel


/**
 <p>The channel details.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingChannel * _Nullable channel;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDisassociateChannelFlowRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the channel flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelFlowArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the user making the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

@end

/**
 <p>The attributes required to configure and create an elastic channel. An elastic channel can support a maximum of 1-million members.</p>
 Required parameters: [MaximumSubChannels, TargetMembershipsPerSubChannel, MinimumMembershipPercentage]
 */
@interface AWSChimeSDKMessagingElasticChannelConfiguration : AWSModel


/**
 <p>The maximum number of SubChannels that you want to allow in the elastic channel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumSubChannels;

/**
 <p>The minimum allowed percentage of TargetMembershipsPerSubChannel users. Ceil of the calculated value is used in balancing members among SubChannels of the elastic channel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minimumMembershipPercentage;

/**
 <p>The maximum number of members allowed in a SubChannel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable targetMembershipsPerSubChannel;

@end

/**
 <p>Settings that control the interval after which a channel is deleted.</p>
 Required parameters: [ExpirationDays, ExpirationCriterion]
 */
@interface AWSChimeSDKMessagingExpirationSettings : AWSModel


/**
 <p>The conditions that must be met for a channel to expire.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingExpirationCriterion expirationCriterion;

/**
 <p>The period in days after which the system automatically deletes a channel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expirationDays;

@end

/**
 
 */
@interface AWSChimeSDKMessagingGetChannelMembershipPreferencesRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The <code>AppInstanceUserArn</code> of the member retrieving the preferences.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberArn;

@end

/**
 
 */
@interface AWSChimeSDKMessagingGetChannelMembershipPreferencesResponse : AWSModel


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The details of a user.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingIdentity * _Nullable member;

/**
 <p>The channel membership preferences for an <code>AppInstanceUser</code> .</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingChannelMembershipPreferences * _Nullable preferences;

@end

/**
 
 */
@interface AWSChimeSDKMessagingGetChannelMessageRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The ID of the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

/**
 <p>The ID of the SubChannel in the request.</p><note><p>Only required when getting messages in a SubChannel that the user belongs to.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable subChannelId;

@end

/**
 
 */
@interface AWSChimeSDKMessagingGetChannelMessageResponse : AWSModel


/**
 <p>The details of and content in the message.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingChannelMessage * _Nullable channelMessage;

@end

/**
 
 */
@interface AWSChimeSDKMessagingGetChannelMessageStatusRequest : AWSRequest


/**
 <p>The ARN of the channel</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the user making the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The ID of the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

/**
 <p>The ID of the SubChannel in the request.</p><note><p>Only required when getting message status in a SubChannel that the user belongs to.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable subChannelId;

@end

/**
 
 */
@interface AWSChimeSDKMessagingGetChannelMessageStatusResponse : AWSModel


/**
 <p>The message status and details.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingChannelMessageStatusStructure * _Nullable status;

@end

/**
 
 */
@interface AWSChimeSDKMessagingGetMessagingSessionEndpointRequest : AWSRequest


@end

/**
 
 */
@interface AWSChimeSDKMessagingGetMessagingSessionEndpointResponse : AWSModel


/**
 <p>The endpoint returned in the response.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingMessagingSessionEndpoint * _Nullable endpoint;

@end

/**
 
 */
@interface AWSChimeSDKMessagingGetMessagingStreamingConfigurationsRequest : AWSRequest


/**
 <p>The ARN of the streaming configurations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

@end

/**
 
 */
@interface AWSChimeSDKMessagingGetMessagingStreamingConfigurationsResponse : AWSModel


/**
 <p>The streaming settings.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingStreamingConfiguration *> * _Nullable streamingConfigurations;

@end

/**
 <p>The details of a user or bot.</p>
 */
@interface AWSChimeSDKMessagingIdentity : AWSModel


/**
 <p>The ARN in an Identity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The name in an Identity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Stores metadata about a Lambda processor.</p>
 Required parameters: [ResourceArn, InvocationType]
 */
@interface AWSChimeSDKMessagingLambdaConfiguration : AWSModel


/**
 <p>Controls how the Lambda function is invoked.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingInvocationType invocationType;

/**
 <p>The ARN of the Lambda message processing function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSChimeSDKMessagingListChannelBansRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The maximum number of bans that you want returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token passed by previous API calls until all requested bans are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeSDKMessagingListChannelBansResponse : AWSModel


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The information for each requested ban.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingChannelBanSummary *> * _Nullable channelBans;

/**
 <p>The token passed by previous API calls until all requested bans are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeSDKMessagingListChannelFlowsRequest : AWSRequest


/**
 <p>The ARN of the app instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

/**
 <p>The maximum number of channel flows that you want to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token passed by previous API calls until all requested channel flows are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeSDKMessagingListChannelFlowsResponse : AWSModel


/**
 <p>The information about each channel flow.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingChannelFlowSummary *> * _Nullable channelFlows;

/**
 <p>The token passed by previous API calls until all requested channels are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserRequest : AWSRequest


/**
 <p>The ARN of the user or bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The maximum number of users that you want returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token returned from previous API requests until the number of channel memberships is reached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserResponse : AWSModel


/**
 <p>The information for the requested channel memberships.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingChannelMembershipForAppInstanceUserSummary *> * _Nullable channelMemberships;

/**
 <p>The token passed by previous API calls until all requested users are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeSDKMessagingListChannelMembershipsRequest : AWSRequest


/**
 <p>The maximum number of channel memberships that you want returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The maximum number of channel memberships that you want returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token passed by previous API calls until all requested channel memberships are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the SubChannel in the request.</p><note><p>Only required when listing a user's memberships in a particular sub-channel of an elastic channel.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable subChannelId;

/**
 <p>The membership type of a user, <code>DEFAULT</code> or <code>HIDDEN</code>. Default members are returned as part of <code>ListChannelMemberships</code> if no type is specified. Hidden members are only returned if the type filter in <code>ListChannelMemberships</code> equals <code>HIDDEN</code>.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelMembershipType types;

@end

/**
 
 */
@interface AWSChimeSDKMessagingListChannelMembershipsResponse : AWSModel


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The information for the requested channel memberships.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingChannelMembershipSummary *> * _Nullable channelMemberships;

/**
 <p>The token passed by previous API calls until all requested channel memberships are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeSDKMessagingListChannelMessagesRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The maximum number of messages that you want returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token passed by previous API calls until all requested messages are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The final or ending time stamp for your requested messages.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable notAfter;

/**
 <p>The initial or starting time stamp for your requested messages.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable notBefore;

/**
 <p>The order in which you want messages sorted. Default is Descending, based on time created.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingSortOrder sortOrder;

/**
 <p>The ID of the SubChannel in the request.</p><note><p>Only required when listing the messages in a SubChannel that the user belongs to.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable subChannelId;

@end

/**
 
 */
@interface AWSChimeSDKMessagingListChannelMessagesResponse : AWSModel


/**
 <p>The ARN of the channel containing the requested messages.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The information about, and content of, each requested message.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingChannelMessageSummary *> * _Nullable channelMessages;

/**
 <p>The token passed by previous API calls until all requested messages are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the SubChannel in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subChannelId;

@end

/**
 
 */
@interface AWSChimeSDKMessagingListChannelModeratorsRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The maximum number of moderators that you want returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token passed by previous API calls until all requested moderators are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeSDKMessagingListChannelModeratorsResponse : AWSModel


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The information about and names of each moderator.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingChannelModeratorSummary *> * _Nullable channelModerators;

/**
 <p>The token passed by previous API calls until all requested moderators are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeSDKMessagingListChannelsAssociatedWithChannelFlowRequest : AWSRequest


/**
 <p>The ARN of the channel flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelFlowArn;

/**
 <p>The maximum number of channels that you want to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token passed by previous API calls until all requested channels are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeSDKMessagingListChannelsAssociatedWithChannelFlowResponse : AWSModel


/**
 <p>The information about each channel.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingChannelAssociatedWithFlowSummary *> * _Nullable channels;

/**
 <p>The token passed by previous API calls until all requested channels are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserRequest : AWSRequest


/**
 <p>The ARN of the user or bot in the moderated channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The maximum number of channels in the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token returned from previous API requests until the number of channels moderated by the user is reached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserResponse : AWSModel


/**
 <p>The moderated channels in the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingChannelModeratedByAppInstanceUserSummary *> * _Nullable channels;

/**
 <p>The token returned from previous API requests until the number of channels moderated by the user is reached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeSDKMessagingListChannelsRequest : AWSRequest


/**
 <p>The ARN of the <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The maximum number of channels that you want to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token passed by previous API calls until all requested channels are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The privacy setting. <code>PUBLIC</code> retrieves all the public channels. <code>PRIVATE</code> retrieves private channels. Only an <code>AppInstanceAdmin</code> can retrieve private channels. </p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelPrivacy privacy;

@end

/**
 
 */
@interface AWSChimeSDKMessagingListChannelsResponse : AWSModel


/**
 <p>The information about each channel.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingChannelSummary *> * _Nullable channels;

/**
 <p>The token returned from previous API requests until the number of channels is reached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeSDKMessagingListSubChannelsRequest : AWSRequest


/**
 <p>The ARN of elastic channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the user making the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The maximum number of sub-channels that you want to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token passed by previous API calls until all requested sub-channels are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeSDKMessagingListSubChannelsResponse : AWSModel


/**
 <p>The ARN of elastic channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The token passed by previous API calls until all requested sub-channels are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The information about each sub-channel.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingSubChannelSummary *> * _Nullable subChannels;

@end

/**
 
 */
@interface AWSChimeSDKMessagingListTagsForResourceRequest : AWSRequest


/**
 <p>The ARN of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

@end

/**
 
 */
@interface AWSChimeSDKMessagingListTagsForResourceResponse : AWSModel


/**
 <p>The tag key-value pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingTag *> * _Nullable tags;

@end

/**
 <p>A list of message attribute values.</p>
 */
@interface AWSChimeSDKMessagingMessageAttributeValue : AWSModel


/**
 <p>The strings in a message attribute value.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable stringValues;

@end

/**
 <p>The websocket endpoint used to connect to Amazon Chime SDK messaging.</p>
 */
@interface AWSChimeSDKMessagingMessagingSessionEndpoint : AWSModel


/**
 <p>The endpoint to which you establish a websocket connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 <p>The information about a processor in a channel flow.</p>
 Required parameters: [Name, Configuration, ExecutionOrder, FallbackAction]
 */
@interface AWSChimeSDKMessagingProcessor : AWSModel


/**
 <p>The information about the type of processor and its identifier.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingProcessorConfiguration * _Nullable configuration;

/**
 <p>The sequence in which processors run. If you have multiple processors in a channel flow, message processing goes through each processor in the sequence. The value determines the sequence. At this point, we support only 1 processor within a flow.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable executionOrder;

/**
 <p>Determines whether to continue with message processing or stop it in cases where communication with a processor fails. If a processor has a fallback action of <code>ABORT</code> and communication with it fails, the processor sets the message status to <code>FAILED</code> and does not send the message to any recipients. Note that if the last processor in the channel flow sequence has a fallback action of <code>CONTINUE</code> and communication with the processor fails, then the message is considered processed and sent to recipients of the channel.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingFallbackAction fallbackAction;

/**
 <p>The name of the channel flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>A processor's metadata.</p>
 Required parameters: [Lambda]
 */
@interface AWSChimeSDKMessagingProcessorConfiguration : AWSModel


/**
 <p>Indicates that the processor is of type Lambda.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingLambdaConfiguration * _Nullable lambda;

@end

/**
 <p>The push notification configuration of the message.</p>
 */
@interface AWSChimeSDKMessagingPushNotificationConfiguration : AWSModel


/**
 <p>The body of the push notification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 <p>The title of the push notification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

/**
 <p>Enum value that indicates the type of the push notification for a message. <code>DEFAULT</code>: Normal mobile push notification. <code>VOIP</code>: VOIP mobile push notification.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingPushNotificationType types;

@end

/**
 <p>The channel membership preferences for push notification.</p>
 Required parameters: [AllowNotifications]
 */
@interface AWSChimeSDKMessagingPushNotificationPreferences : AWSModel


/**
 <p>Enum value that indicates which push notifications to send to the requested member of a channel. <code>ALL</code> sends all push notifications, <code>NONE</code> sends no push notifications, <code>FILTERED</code> sends only filtered push notifications. </p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingAllowNotifications allowNotifications;

/**
 <p>The simple JSON object used to send a subset of a push notification to the requested member.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterRule;

@end

/**
 
 */
@interface AWSChimeSDKMessagingPutChannelExpirationSettingsRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>Settings that control the interval after which a channel is deleted.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingExpirationSettings * _Nullable expirationSettings;

@end

/**
 
 */
@interface AWSChimeSDKMessagingPutChannelExpirationSettingsResponse : AWSModel


/**
 <p>The channel ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>Settings that control the interval after which a channel is deleted.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingExpirationSettings * _Nullable expirationSettings;

@end

/**
 
 */
@interface AWSChimeSDKMessagingPutChannelMembershipPreferencesRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The ARN of the member setting the preferences.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberArn;

/**
 <p>The channel membership preferences of an <code>AppInstanceUser</code> .</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingChannelMembershipPreferences * _Nullable preferences;

@end

/**
 
 */
@interface AWSChimeSDKMessagingPutChannelMembershipPreferencesResponse : AWSModel


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The details of a user.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingIdentity * _Nullable member;

/**
 <p>The ARN and metadata of the member being added.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingChannelMembershipPreferences * _Nullable preferences;

@end

/**
 
 */
@interface AWSChimeSDKMessagingPutMessagingStreamingConfigurationsRequest : AWSRequest


/**
 <p>The ARN of the streaming configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

/**
 <p>The streaming configurations.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingStreamingConfiguration *> * _Nullable streamingConfigurations;

@end

/**
 
 */
@interface AWSChimeSDKMessagingPutMessagingStreamingConfigurationsResponse : AWSModel


/**
 <p>The requested streaming configurations.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingStreamingConfiguration *> * _Nullable streamingConfigurations;

@end

/**
 
 */
@interface AWSChimeSDKMessagingRedactChannelMessageRequest : AWSRequest


/**
 <p>The ARN of the channel containing the messages that you want to redact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The ID of the message being redacted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

/**
 <p>The ID of the SubChannel in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subChannelId;

@end

/**
 
 */
@interface AWSChimeSDKMessagingRedactChannelMessageResponse : AWSModel


/**
 <p>The ARN of the channel containing the messages that you want to redact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ID of the message being redacted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

/**
 <p>The ID of the SubChannel in the response.</p><note><p>Only required when redacting messages in a SubChannel that the user belongs to.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable subChannelId;

@end

/**
 
 */
@interface AWSChimeSDKMessagingSearchChannelsRequest : AWSRequest


/**
 <p>The <code>AppInstanceUserArn</code> of the user making the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>A list of the <code>Field</code> objects in the channel being searched.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingSearchField *> * _Nullable fields;

/**
 <p>The maximum number of channels that you want returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token returned from previous API requests until the number of channels is reached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeSDKMessagingSearchChannelsResponse : AWSModel


/**
 <p>A list of the channels in the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingChannelSummary *> * _Nullable channels;

/**
 <p>The token returned from previous API responses until the number of channels is reached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>A <code>Field</code> of the channel that you want to search.</p>
 Required parameters: [Key, Values, Operator]
 */
@interface AWSChimeSDKMessagingSearchField : AWSModel


/**
 <p>An <code>enum</code> value that indicates the key to search the channel on. <code>MEMBERS</code> allows you to search channels based on memberships. You can use it with the <code>EQUALS</code> operator to get channels whose memberships are equal to the specified values, and with the <code>INCLUDES</code> operator to get channels whose memberships include the specified values.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingSearchFieldKey key;

/**
 <p>The operator used to compare field values, currently <code>EQUALS</code> or <code>INCLUDES</code>. Use the <code>EQUALS</code> operator to find channels whose memberships equal the specified values. Use the <code>INCLUDES</code> operator to find channels whose memberships include the specified values.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingSearchFieldOperator operator;

/**
 <p>The values that you want to search for, a list of strings. The values must be <code>AppInstanceUserArns</code> specified as a list of strings.</p><note><p>This operation isn't supported for <code>AppInstanceUsers</code> with large number of memberships.</p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 
 */
@interface AWSChimeSDKMessagingSendChannelMessageRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The <code>Idempotency</code> token for each client request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The content of the channel message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The content type of the channel message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The attributes for the message, used for message filtering along with a <code>FilterRule</code> defined in the <code>PushNotificationPreferences</code>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSChimeSDKMessagingMessageAttributeValue *> * _Nullable messageAttributes;

/**
 <p>The optional metadata for each message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metadata;

/**
 <p>Boolean that controls whether the message is persisted on the back end. Required.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelMessagePersistenceType persistence;

/**
 <p>The push notification configuration of the message.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingPushNotificationConfiguration * _Nullable pushNotification;

/**
 <p>The ID of the SubChannel in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subChannelId;

/**
 <p>The target of a message. Must be a member of the channel, such as another user, a bot, or the sender. Only the target and the sender can view targeted messages. Only users who can see targeted messages can take actions on them. However, administrators can delete targeted messages that they can’t see. </p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingTarget *> * _Nullable target;

/**
 <p>The type of message, <code>STANDARD</code> or <code>CONTROL</code>.</p><p><code>STANDARD</code> messages can be up to 4KB in size and contain metadata. Metadata is arbitrary, and you can use it in a variety of ways, such as containing a link to an attachment.</p><p><code>CONTROL</code> messages are limited to 30 bytes and do not contain metadata.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelMessageType types;

@end

/**
 
 */
@interface AWSChimeSDKMessagingSendChannelMessageResponse : AWSModel


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ID string assigned to each message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

/**
 <p>The status of the channel message.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingChannelMessageStatusStructure * _Nullable status;

/**
 <p>The ID of the SubChannel in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subChannelId;

@end

/**
 <p>The configuration for connecting a messaging stream to Amazon Kinesis.</p>
 Required parameters: [DataType, ResourceArn]
 */
@interface AWSChimeSDKMessagingStreamingConfiguration : AWSModel


/**
 <p>The data type of the configuration.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingMessagingDataType dataType;

/**
 <p>The ARN of the resource in the configuration. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 <p>Summary of the sub-channels associated with the elastic channel.</p>
 */
@interface AWSChimeSDKMessagingSubChannelSummary : AWSModel


/**
 <p>The number of members in a SubChannel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable membershipCount;

/**
 <p>The unique ID of a SubChannel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subChannelId;

@end

/**
 <p>A tag object containing a key-value pair.</p>
 Required parameters: [Key, Value]
 */
@interface AWSChimeSDKMessagingTag : AWSModel


/**
 <p>The key in a tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value in a tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSChimeSDKMessagingTagResourceRequest : AWSRequest


/**
 <p>The resource ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

/**
 <p>The tag key-value pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingTag *> * _Nullable tags;

@end

/**
 <p>The target of a message, a sender, a user, or a bot. Only the target and the sender can view targeted messages. Only users who can see targeted messages can take actions on them. However, administrators can delete targeted messages that they can’t see.</p>
 */
@interface AWSChimeSDKMessagingTarget : AWSModel


/**
 <p>The ARN of the target channel member.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberArn;

@end

/**
 
 */
@interface AWSChimeSDKMessagingUntagResourceRequest : AWSRequest


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
@interface AWSChimeSDKMessagingUpdateChannelFlowRequest : AWSRequest


/**
 <p>The ARN of the channel flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelFlowArn;

/**
 <p>The name of the channel flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Information about the processor Lambda functions </p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKMessagingProcessor *> * _Nullable processors;

@end

/**
 
 */
@interface AWSChimeSDKMessagingUpdateChannelFlowResponse : AWSModel


/**
 <p>The ARN of the channel flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelFlowArn;

@end

/**
 
 */
@interface AWSChimeSDKMessagingUpdateChannelMessageRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The content of the channel message. </p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The content type of the channel message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The ID string of the message being updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

/**
 <p>The metadata of the message being updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metadata;

/**
 <p>The ID of the SubChannel in the request.</p><note><p>Only required when updating messages in a SubChannel that the user belongs to.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable subChannelId;

@end

/**
 
 */
@interface AWSChimeSDKMessagingUpdateChannelMessageResponse : AWSModel


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ID string of the message being updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

/**
 <p>The status of the message update.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingChannelMessageStatusStructure * _Nullable status;

/**
 <p>The ID of the SubChannel in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subChannelId;

@end

/**
 
 */
@interface AWSChimeSDKMessagingUpdateChannelReadMarkerRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

@end

/**
 
 */
@interface AWSChimeSDKMessagingUpdateChannelReadMarkerResponse : AWSModel


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

@end

/**
 
 */
@interface AWSChimeSDKMessagingUpdateChannelRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The metadata for the update request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metadata;

/**
 <p>The mode of the update request.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelMode mode;

/**
 <p>The name of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSChimeSDKMessagingUpdateChannelResponse : AWSModel


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

@end

NS_ASSUME_NONNULL_END
