//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

typedef NS_ENUM(NSInteger, AWSChimeSDKMessagingSortOrder) {
    AWSChimeSDKMessagingSortOrderUnknown,
    AWSChimeSDKMessagingSortOrderAscending,
    AWSChimeSDKMessagingSortOrderDescending,
};

@class AWSChimeSDKMessagingAppInstanceUserMembershipSummary;
@class AWSChimeSDKMessagingBatchChannelMemberships;
@class AWSChimeSDKMessagingBatchCreateChannelMembershipError;
@class AWSChimeSDKMessagingBatchCreateChannelMembershipRequest;
@class AWSChimeSDKMessagingBatchCreateChannelMembershipResponse;
@class AWSChimeSDKMessagingChannel;
@class AWSChimeSDKMessagingChannelBan;
@class AWSChimeSDKMessagingChannelBanSummary;
@class AWSChimeSDKMessagingChannelMembership;
@class AWSChimeSDKMessagingChannelMembershipForAppInstanceUserSummary;
@class AWSChimeSDKMessagingChannelMembershipSummary;
@class AWSChimeSDKMessagingChannelMessage;
@class AWSChimeSDKMessagingChannelMessageSummary;
@class AWSChimeSDKMessagingChannelModeratedByAppInstanceUserSummary;
@class AWSChimeSDKMessagingChannelModerator;
@class AWSChimeSDKMessagingChannelModeratorSummary;
@class AWSChimeSDKMessagingChannelSummary;
@class AWSChimeSDKMessagingCreateChannelBanRequest;
@class AWSChimeSDKMessagingCreateChannelBanResponse;
@class AWSChimeSDKMessagingCreateChannelMembershipRequest;
@class AWSChimeSDKMessagingCreateChannelMembershipResponse;
@class AWSChimeSDKMessagingCreateChannelModeratorRequest;
@class AWSChimeSDKMessagingCreateChannelModeratorResponse;
@class AWSChimeSDKMessagingCreateChannelRequest;
@class AWSChimeSDKMessagingCreateChannelResponse;
@class AWSChimeSDKMessagingDeleteChannelBanRequest;
@class AWSChimeSDKMessagingDeleteChannelMembershipRequest;
@class AWSChimeSDKMessagingDeleteChannelMessageRequest;
@class AWSChimeSDKMessagingDeleteChannelModeratorRequest;
@class AWSChimeSDKMessagingDeleteChannelRequest;
@class AWSChimeSDKMessagingDescribeChannelBanRequest;
@class AWSChimeSDKMessagingDescribeChannelBanResponse;
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
@class AWSChimeSDKMessagingGetChannelMessageRequest;
@class AWSChimeSDKMessagingGetChannelMessageResponse;
@class AWSChimeSDKMessagingGetMessagingSessionEndpointRequest;
@class AWSChimeSDKMessagingGetMessagingSessionEndpointResponse;
@class AWSChimeSDKMessagingIdentity;
@class AWSChimeSDKMessagingListChannelBansRequest;
@class AWSChimeSDKMessagingListChannelBansResponse;
@class AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserRequest;
@class AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserResponse;
@class AWSChimeSDKMessagingListChannelMembershipsRequest;
@class AWSChimeSDKMessagingListChannelMembershipsResponse;
@class AWSChimeSDKMessagingListChannelMessagesRequest;
@class AWSChimeSDKMessagingListChannelMessagesResponse;
@class AWSChimeSDKMessagingListChannelModeratorsRequest;
@class AWSChimeSDKMessagingListChannelModeratorsResponse;
@class AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserRequest;
@class AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserResponse;
@class AWSChimeSDKMessagingListChannelsRequest;
@class AWSChimeSDKMessagingListChannelsResponse;
@class AWSChimeSDKMessagingMessagingSessionEndpoint;
@class AWSChimeSDKMessagingRedactChannelMessageRequest;
@class AWSChimeSDKMessagingRedactChannelMessageResponse;
@class AWSChimeSDKMessagingSendChannelMessageRequest;
@class AWSChimeSDKMessagingSendChannelMessageResponse;
@class AWSChimeSDKMessagingTag;
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
 <p>The time at which a message was last read.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable readMarkerTimestamp;

/**
 <p>The type of <code>ChannelMembership</code>.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelMembershipType types;

@end

/**
 <p>The membership information, including member ARNs, the channel ARN, and membership types.</p>
 */
@interface AWSChimeSDKMessagingBatchChannelMemberships : AWSModel


/**
 <p>The ARN of the channel to which you're adding users.</p>
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
 <p>The membership types set for the channel users.</p>
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
 <p>The ARN of the member that the service couldn't add.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberArn;

@end

/**
 
 */
@interface AWSChimeSDKMessagingBatchCreateChannelMembershipRequest : AWSRequest


/**
 <p>The ARN of the channel to which you're adding users.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The ARNs of the members you want to add to the channel.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable memberArns;

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
 <p>The <code>AppInstanceUser</code> who created the channel.</p>
 */
@property (nonatomic, strong) AWSChimeSDKMessagingIdentity * _Nullable createdBy;

/**
 <p>The time at which the <code>AppInstanceUser</code> created the channel.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimestamp;

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
 <p>The message content.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

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
 <p>The message type.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelMessageType types;

@end

/**
 <p>Summary of the messages in a <code>Channel</code>.</p>
 */
@interface AWSChimeSDKMessagingChannelMessageSummary : AWSModel


/**
 <p>The content of the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

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
 <p>The time at which the last message in a channel was sent.</p>
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
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The ARN of the member being banned.</p>
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
@interface AWSChimeSDKMessagingCreateChannelMembershipRequest : AWSRequest


/**
 <p>The ARN of the channel to which you're adding users.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The ARN of the member you want to add to the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberArn;

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

@end

/**
 
 */
@interface AWSChimeSDKMessagingCreateChannelModeratorRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the moderator.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelModeratorArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
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
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The client token for the request. An <code>Idempotency</code> token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The metadata of the creation request. Limited to 1KB and UTF-8.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metadata;

/**
 <p>The channel mode: <code>UNRESTRICTED</code> or <code>RESTRICTED</code>. Administrators, moderators, and channel members can add themselves and other members to unrestricted channels. Only administrators and moderators can add members to restricted channels.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelMode mode;

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
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The ARN of the <code>AppInstanceUser</code> that you want to reinstate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberArn;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDeleteChannelMembershipRequest : AWSRequest


/**
 <p>The ARN of the channel from which you want to remove the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The ARN of the member that you're removing from the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberArn;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDeleteChannelMessageRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The ID of the message being deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDeleteChannelModeratorRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The ARN of the moderator being deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelModeratorArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
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
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

@end

/**
 
 */
@interface AWSChimeSDKMessagingDescribeChannelBanRequest : AWSRequest


/**
 <p>The ARN of the channel from which the user is banned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The ARN of the member being banned.</p>
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
@interface AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserRequest : AWSRequest


/**
 <p>The ARN of the user in a channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserArn;

/**
 <p>The ARN of the channel to which the user belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
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
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The ARN of the member.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberArn;

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
 <p>The ARN of the <code>AppInstanceUser</code> in the moderated channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserArn;

/**
 <p>The ARN of the moderated channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
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
 <p>The ARN of the channel moderator.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelModeratorArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
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
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
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
@interface AWSChimeSDKMessagingGetChannelMessageRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The ID of the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

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
 <p>The details of a user.</p>
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
 
 */
@interface AWSChimeSDKMessagingListChannelBansRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
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
@interface AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserRequest : AWSRequest


/**
 <p>The ARN of the <code>AppInstanceUser</code>s</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
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
 <p>The token passed by previous API calls until all requested users are returned.</p>
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
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
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
 <p>The membership type of a user, <code>DEFAULT</code> or <code>HIDDEN</code>. Default members are always returned as part of <code>ListChannelMemberships</code>. Hidden members are only returned if the type filter in <code>ListChannelMemberships</code> equals <code>HIDDEN</code>. Otherwise hidden members are not returned.</p>
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
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
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

@end

/**
 
 */
@interface AWSChimeSDKMessagingListChannelModeratorsRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
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
@interface AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserRequest : AWSRequest


/**
 <p>The ARN of the user in the moderated channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
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
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
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
 <p>The websocket endpoint used to connect to Amazon Chime SDK messaging.</p>
 */
@interface AWSChimeSDKMessagingMessagingSessionEndpoint : AWSModel


/**
 <p>The endpoint to which you establish a websocket connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 
 */
@interface AWSChimeSDKMessagingRedactChannelMessageRequest : AWSRequest


/**
 <p>The ARN of the channel containing the messages that you want to redact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The ID of the message being redacted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

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

@end

/**
 
 */
@interface AWSChimeSDKMessagingSendChannelMessageRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The <code>Idempotency</code> token for each client request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The content of the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The optional metadata for each message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metadata;

/**
 <p>Boolean that controls whether the message is persisted on the back end. Required.</p>
 */
@property (nonatomic, assign) AWSChimeSDKMessagingChannelMessagePersistenceType persistence;

/**
 <p>The type of message, <code>STANDARD</code> or <code>CONTROL</code>.</p>
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

@end

/**
 <p>Describes a tag applied to a resource.</p>
 Required parameters: [Key, Value]
 */
@interface AWSChimeSDKMessagingTag : AWSModel


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
@interface AWSChimeSDKMessagingUpdateChannelMessageRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable chimeBearer;

/**
 <p>The content of the message being updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The ID string of the message being updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

/**
 <p>The metadata of the message being updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metadata;

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

@end

/**
 
 */
@interface AWSChimeSDKMessagingUpdateChannelReadMarkerRequest : AWSRequest


/**
 <p>The ARN of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
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
 <p>The <code>AppInstanceUserArn</code> of the user that makes the API call.</p>
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
