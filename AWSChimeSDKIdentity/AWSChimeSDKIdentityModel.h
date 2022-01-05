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

FOUNDATION_EXPORT NSString *const AWSChimeSDKIdentityErrorDomain;

typedef NS_ENUM(NSInteger, AWSChimeSDKIdentityErrorType) {
    AWSChimeSDKIdentityErrorUnknown,
    AWSChimeSDKIdentityErrorBadRequest,
    AWSChimeSDKIdentityErrorConflict,
    AWSChimeSDKIdentityErrorForbidden,
    AWSChimeSDKIdentityErrorResourceLimitExceeded,
    AWSChimeSDKIdentityErrorServiceFailure,
    AWSChimeSDKIdentityErrorServiceUnavailable,
    AWSChimeSDKIdentityErrorThrottledClient,
    AWSChimeSDKIdentityErrorUnauthorizedClient,
};

typedef NS_ENUM(NSInteger, AWSChimeSDKIdentityAllowMessages) {
    AWSChimeSDKIdentityAllowMessagesUnknown,
    AWSChimeSDKIdentityAllowMessagesAll,
    AWSChimeSDKIdentityAllowMessagesNone,
};

typedef NS_ENUM(NSInteger, AWSChimeSDKIdentityAppInstanceUserEndpointType) {
    AWSChimeSDKIdentityAppInstanceUserEndpointTypeUnknown,
    AWSChimeSDKIdentityAppInstanceUserEndpointTypeApns,
    AWSChimeSDKIdentityAppInstanceUserEndpointTypeApnsSandbox,
    AWSChimeSDKIdentityAppInstanceUserEndpointTypeGcm,
};

typedef NS_ENUM(NSInteger, AWSChimeSDKIdentityEndpointStatus) {
    AWSChimeSDKIdentityEndpointStatusUnknown,
    AWSChimeSDKIdentityEndpointStatusActive,
    AWSChimeSDKIdentityEndpointStatusInactive,
};

typedef NS_ENUM(NSInteger, AWSChimeSDKIdentityEndpointStatusReason) {
    AWSChimeSDKIdentityEndpointStatusReasonUnknown,
    AWSChimeSDKIdentityEndpointStatusReasonInvalidDeviceToken,
    AWSChimeSDKIdentityEndpointStatusReasonInvalidPinpointArn,
};

typedef NS_ENUM(NSInteger, AWSChimeSDKIdentityErrorCode) {
    AWSChimeSDKIdentityErrorCodeUnknown,
    AWSChimeSDKIdentityErrorCodeBadRequest,
    AWSChimeSDKIdentityErrorCodeConflict,
    AWSChimeSDKIdentityErrorCodeForbidden,
    AWSChimeSDKIdentityErrorCodeNotFound,
    AWSChimeSDKIdentityErrorCodePreconditionFailed,
    AWSChimeSDKIdentityErrorCodeResourceLimitExceeded,
    AWSChimeSDKIdentityErrorCodeServiceFailure,
    AWSChimeSDKIdentityErrorCodeAccessDenied,
    AWSChimeSDKIdentityErrorCodeServiceUnavailable,
    AWSChimeSDKIdentityErrorCodeThrottled,
    AWSChimeSDKIdentityErrorCodeThrottling,
    AWSChimeSDKIdentityErrorCodeUnauthorized,
    AWSChimeSDKIdentityErrorCodeUnprocessable,
    AWSChimeSDKIdentityErrorCodeVoiceConnectorGroupAssociationsExist,
    AWSChimeSDKIdentityErrorCodePhoneNumberAssociationsExist,
};

@class AWSChimeSDKIdentityAppInstance;
@class AWSChimeSDKIdentityAppInstanceAdmin;
@class AWSChimeSDKIdentityAppInstanceAdminSummary;
@class AWSChimeSDKIdentityAppInstanceRetentionSettings;
@class AWSChimeSDKIdentityAppInstanceSummary;
@class AWSChimeSDKIdentityAppInstanceUser;
@class AWSChimeSDKIdentityAppInstanceUserEndpoint;
@class AWSChimeSDKIdentityAppInstanceUserEndpointSummary;
@class AWSChimeSDKIdentityAppInstanceUserSummary;
@class AWSChimeSDKIdentityChannelRetentionSettings;
@class AWSChimeSDKIdentityCreateAppInstanceAdminRequest;
@class AWSChimeSDKIdentityCreateAppInstanceAdminResponse;
@class AWSChimeSDKIdentityCreateAppInstanceRequest;
@class AWSChimeSDKIdentityCreateAppInstanceResponse;
@class AWSChimeSDKIdentityCreateAppInstanceUserRequest;
@class AWSChimeSDKIdentityCreateAppInstanceUserResponse;
@class AWSChimeSDKIdentityDeleteAppInstanceAdminRequest;
@class AWSChimeSDKIdentityDeleteAppInstanceRequest;
@class AWSChimeSDKIdentityDeleteAppInstanceUserRequest;
@class AWSChimeSDKIdentityDeregisterAppInstanceUserEndpointRequest;
@class AWSChimeSDKIdentityDescribeAppInstanceAdminRequest;
@class AWSChimeSDKIdentityDescribeAppInstanceAdminResponse;
@class AWSChimeSDKIdentityDescribeAppInstanceRequest;
@class AWSChimeSDKIdentityDescribeAppInstanceResponse;
@class AWSChimeSDKIdentityDescribeAppInstanceUserEndpointRequest;
@class AWSChimeSDKIdentityDescribeAppInstanceUserEndpointResponse;
@class AWSChimeSDKIdentityDescribeAppInstanceUserRequest;
@class AWSChimeSDKIdentityDescribeAppInstanceUserResponse;
@class AWSChimeSDKIdentityEndpointAttributes;
@class AWSChimeSDKIdentityEndpointState;
@class AWSChimeSDKIdentityGetAppInstanceRetentionSettingsRequest;
@class AWSChimeSDKIdentityGetAppInstanceRetentionSettingsResponse;
@class AWSChimeSDKIdentityIdentity;
@class AWSChimeSDKIdentityListAppInstanceAdminsRequest;
@class AWSChimeSDKIdentityListAppInstanceAdminsResponse;
@class AWSChimeSDKIdentityListAppInstanceUserEndpointsRequest;
@class AWSChimeSDKIdentityListAppInstanceUserEndpointsResponse;
@class AWSChimeSDKIdentityListAppInstanceUsersRequest;
@class AWSChimeSDKIdentityListAppInstanceUsersResponse;
@class AWSChimeSDKIdentityListAppInstancesRequest;
@class AWSChimeSDKIdentityListAppInstancesResponse;
@class AWSChimeSDKIdentityListTagsForResourceRequest;
@class AWSChimeSDKIdentityListTagsForResourceResponse;
@class AWSChimeSDKIdentityPutAppInstanceRetentionSettingsRequest;
@class AWSChimeSDKIdentityPutAppInstanceRetentionSettingsResponse;
@class AWSChimeSDKIdentityRegisterAppInstanceUserEndpointRequest;
@class AWSChimeSDKIdentityRegisterAppInstanceUserEndpointResponse;
@class AWSChimeSDKIdentityTag;
@class AWSChimeSDKIdentityTagResourceRequest;
@class AWSChimeSDKIdentityUntagResourceRequest;
@class AWSChimeSDKIdentityUpdateAppInstanceRequest;
@class AWSChimeSDKIdentityUpdateAppInstanceResponse;
@class AWSChimeSDKIdentityUpdateAppInstanceUserEndpointRequest;
@class AWSChimeSDKIdentityUpdateAppInstanceUserEndpointResponse;
@class AWSChimeSDKIdentityUpdateAppInstanceUserRequest;
@class AWSChimeSDKIdentityUpdateAppInstanceUserResponse;

/**
 <p>The details of an <code>AppInstance</code>, an instance of an Amazon Chime SDK messaging application.</p>
 */
@interface AWSChimeSDKIdentityAppInstance : AWSModel


/**
 <p>The ARN of the messaging instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

/**
 <p>The time at which an <code>AppInstance</code> was created. In epoch milliseconds.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimestamp;

/**
 <p>The time an <code>AppInstance</code> was last updated. In epoch milliseconds.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTimestamp;

/**
 <p>The metadata of an <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metadata;

/**
 <p>The name of an <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>The details of an <code>AppInstanceAdmin</code>.</p>
 */
@interface AWSChimeSDKIdentityAppInstanceAdmin : AWSModel


/**
 <p>The <code>AppInstanceAdmin</code> data.</p>
 */
@property (nonatomic, strong) AWSChimeSDKIdentityIdentity * _Nullable admin;

/**
 <p>The ARN of the <code>AppInstance</code> for which the user is an administrator.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

/**
 <p>The time at which an administrator was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimestamp;

@end

/**
 <p>Summary of the details of an <code>AppInstanceAdmin</code>.</p>
 */
@interface AWSChimeSDKIdentityAppInstanceAdminSummary : AWSModel


/**
 <p>The details of the <code>AppInstanceAdmin</code>.</p>
 */
@property (nonatomic, strong) AWSChimeSDKIdentityIdentity * _Nullable admin;

@end

/**
 <p>The details of the data-retention settings for an <code>AppInstance</code>.</p>
 */
@interface AWSChimeSDKIdentityAppInstanceRetentionSettings : AWSModel


/**
 <p>The length of time in days to retain the messages in a channel.</p>
 */
@property (nonatomic, strong) AWSChimeSDKIdentityChannelRetentionSettings * _Nullable channelRetentionSettings;

@end

/**
 <p>Summary of the data for an <code>AppInstance</code>.</p>
 */
@interface AWSChimeSDKIdentityAppInstanceSummary : AWSModel


/**
 <p>The <code>AppInstance</code> ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

/**
 <p>The metadata of the <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metadata;

/**
 <p>The name of the <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>The details of an <code>AppInstanceUser</code>.</p>
 */
@interface AWSChimeSDKIdentityAppInstanceUser : AWSModel


/**
 <p>The ARN of the <code>AppInstanceUser</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserArn;

/**
 <p>The time at which the <code>AppInstanceUser</code> was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimestamp;

/**
 <p>The time at which the <code>AppInstanceUser</code> was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTimestamp;

/**
 <p>The metadata of the <code>AppInstanceUser</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metadata;

/**
 <p>The name of the <code>AppInstanceUser</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>An endpoint under an Amazon Chime <code>AppInstanceUser</code> that receives messages for a user. For push notifications, the endpoint is a mobile device used to receive mobile push notifications for a user.</p>
 */
@interface AWSChimeSDKIdentityAppInstanceUserEndpoint : AWSModel


/**
 <p>Boolean that controls whether the <code>AppInstanceUserEndpoint</code> is opted in to receive messages. <code>ALL</code> indicates the endpoint will receive all messages. <code>NONE</code> indicates the endpoint will receive no messages.</p>
 */
@property (nonatomic, assign) AWSChimeSDKIdentityAllowMessages allowMessages;

/**
 <p>The ARN of the <code>AppInstanceUser</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserArn;

/**
 <p>The time at which an <code>AppInstanceUserEndpoint</code> was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimestamp;

/**
 <p>The attributes of an <code>Endpoint</code>.</p>
 */
@property (nonatomic, strong) AWSChimeSDKIdentityEndpointAttributes * _Nullable endpointAttributes;

/**
 <p>The unique identifier of the <code>AppInstanceUserEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointId;

/**
 <p>A read-only field that represents the state of an <code>AppInstanceUserEndpoint</code>. Supported values:</p><ul><li><p><code>ACTIVE</code>: The <code>AppInstanceUserEndpoint</code> is active and able to receive messages. When <code>ACTIVE</code>, the <code>EndpointStatusReason</code> remains empty.</p></li><li><p><code>INACTIVE</code>: The <code>AppInstanceUserEndpoint</code> is inactive and can't receive message. When <code>INACTIVE</code>, the corresponding reason will be conveyed through <code>EndpointStatusReason</code>.</p></li><li><p><code>INVALID_DEVICE_TOKEN</code> indicates that an <code>AppInstanceUserEndpoint</code> is <code>INACTIVE</code> due to invalid device token</p></li><li><p><code>INVALID_PINPOINT_ARN</code> indicates that an <code>AppInstanceUserEndpoint</code> is <code>INACTIVE</code> due to an invalid pinpoint ARN that was input through the <code>ResourceArn</code> field.</p></li></ul>
 */
@property (nonatomic, strong) AWSChimeSDKIdentityEndpointState * _Nullable endpointState;

/**
 <p>The time at which an <code>AppInstanceUserEndpoint</code> was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTimestamp;

/**
 <p>The name of the <code>AppInstanceUserEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ARN of the resource to which the endpoint belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The type of the <code>AppInstanceUserEndpoint</code>.</p>
 */
@property (nonatomic, assign) AWSChimeSDKIdentityAppInstanceUserEndpointType types;

@end

/**
 <p>Summary of the details of an <code>AppInstanceUserEndpoint</code>.</p>
 */
@interface AWSChimeSDKIdentityAppInstanceUserEndpointSummary : AWSModel


/**
 <p>BBoolean that controls whether the <code>AppInstanceUserEndpoint</code> is opted in to receive messages. <code>ALL</code> indicates the endpoint will receive all messages. <code>NONE</code> indicates the endpoint will receive no messages.</p>
 */
@property (nonatomic, assign) AWSChimeSDKIdentityAllowMessages allowMessages;

/**
 <p>The ARN of the <code>AppInstanceUser</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserArn;

/**
 <p>The unique identifier of the <code>AppInstanceUserEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointId;

/**
 <p>A read-only field that represent the state of an <code>AppInstanceUserEndpoint</code>.</p>
 */
@property (nonatomic, strong) AWSChimeSDKIdentityEndpointState * _Nullable endpointState;

/**
 <p>The name of the <code>AppInstanceUserEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of the <code>AppInstanceUserEndpoint</code>.</p>
 */
@property (nonatomic, assign) AWSChimeSDKIdentityAppInstanceUserEndpointType types;

@end

/**
 <p>Summary of the details of an <code>AppInstanceUser</code>.</p>
 */
@interface AWSChimeSDKIdentityAppInstanceUserSummary : AWSModel


/**
 <p>The ARN of the <code>AppInstanceUser</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserArn;

/**
 <p>The metadata of the <code>AppInstanceUser</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metadata;

/**
 <p>The name of an <code>AppInstanceUser</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>The details of the retention settings for a channel.</p>
 */
@interface AWSChimeSDKIdentityChannelRetentionSettings : AWSModel


/**
 <p>The time in days to retain the messages in a channel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable retentionDays;

@end

/**
 
 */
@interface AWSChimeSDKIdentityCreateAppInstanceAdminRequest : AWSRequest


/**
 <p>The ARN of the administrator of the current <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceAdminArn;

/**
 <p>The ARN of the <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

@end

/**
 
 */
@interface AWSChimeSDKIdentityCreateAppInstanceAdminResponse : AWSModel


/**
 <p>The name and ARN of the admin for the <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) AWSChimeSDKIdentityIdentity * _Nullable appInstanceAdmin;

/**
 <p>The ARN of the of the admin for the <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

@end

/**
 
 */
@interface AWSChimeSDKIdentityCreateAppInstanceRequest : AWSRequest


/**
 <p>The <code>ClientRequestToken</code> of the <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The metadata of the <code>AppInstance</code>. Limited to a 1KB string in UTF-8.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metadata;

/**
 <p>The name of the <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Tags assigned to the <code>AppInstanceUser</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKIdentityTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSChimeSDKIdentityCreateAppInstanceResponse : AWSModel


/**
 <p>The Amazon Resource Number (ARN) of the <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

@end

/**
 
 */
@interface AWSChimeSDKIdentityCreateAppInstanceUserRequest : AWSRequest


/**
 <p>The ARN of the <code>AppInstance</code> request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

/**
 <p>The user ID of the <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserId;

/**
 <p>The token assigned to the user requesting an <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The request's metadata. Limited to a 1KB string in UTF-8.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metadata;

/**
 <p>The user's name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Tags assigned to the <code>AppInstanceUser</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKIdentityTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSChimeSDKIdentityCreateAppInstanceUserResponse : AWSModel


/**
 <p>The user's ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserArn;

@end

/**
 
 */
@interface AWSChimeSDKIdentityDeleteAppInstanceAdminRequest : AWSRequest


/**
 <p>The ARN of the <code>AppInstance</code>'s administrator.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceAdminArn;

/**
 <p>The ARN of the <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

@end

/**
 
 */
@interface AWSChimeSDKIdentityDeleteAppInstanceRequest : AWSRequest


/**
 <p>The ARN of the <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

@end

/**
 
 */
@interface AWSChimeSDKIdentityDeleteAppInstanceUserRequest : AWSRequest


/**
 <p>The ARN of the user request being deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserArn;

@end

/**
 
 */
@interface AWSChimeSDKIdentityDeregisterAppInstanceUserEndpointRequest : AWSRequest


/**
 <p>The ARN of the <code>AppInstanceUser</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserArn;

/**
 <p>The unique identifier of the <code>AppInstanceUserEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointId;

@end

/**
 
 */
@interface AWSChimeSDKIdentityDescribeAppInstanceAdminRequest : AWSRequest


/**
 <p>The ARN of the <code>AppInstanceAdmin</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceAdminArn;

/**
 <p>The ARN of the <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

@end

/**
 
 */
@interface AWSChimeSDKIdentityDescribeAppInstanceAdminResponse : AWSModel


/**
 <p>The ARN and name of the <code>AppInstanceUser</code>, the ARN of the <code>AppInstance</code>, and the created and last-updated timestamps. All timestamps use epoch milliseconds.</p>
 */
@property (nonatomic, strong) AWSChimeSDKIdentityAppInstanceAdmin * _Nullable appInstanceAdmin;

@end

/**
 
 */
@interface AWSChimeSDKIdentityDescribeAppInstanceRequest : AWSRequest


/**
 <p>The ARN of the <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

@end

/**
 
 */
@interface AWSChimeSDKIdentityDescribeAppInstanceResponse : AWSModel


/**
 <p>The ARN, metadata, created and last-updated timestamps, and the name of the <code>AppInstance</code>. All timestamps use epoch milliseconds.</p>
 */
@property (nonatomic, strong) AWSChimeSDKIdentityAppInstance * _Nullable appInstance;

@end

/**
 
 */
@interface AWSChimeSDKIdentityDescribeAppInstanceUserEndpointRequest : AWSRequest


/**
 <p>The ARN of the <code>AppInstanceUser</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserArn;

/**
 <p>The unique identifier of the <code>AppInstanceUserEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointId;

@end

/**
 
 */
@interface AWSChimeSDKIdentityDescribeAppInstanceUserEndpointResponse : AWSModel


/**
 <p>The full details of an <code>AppInstanceUserEndpoint</code>: the <code>AppInstanceUserArn</code>, ID, name, type, resource ARN, attributes, allow messages, state, and created and last updated timestamps. All timestamps use epoch milliseconds.</p>
 */
@property (nonatomic, strong) AWSChimeSDKIdentityAppInstanceUserEndpoint * _Nullable appInstanceUserEndpoint;

@end

/**
 
 */
@interface AWSChimeSDKIdentityDescribeAppInstanceUserRequest : AWSRequest


/**
 <p>The ARN of the <code>AppInstanceUser</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserArn;

@end

/**
 
 */
@interface AWSChimeSDKIdentityDescribeAppInstanceUserResponse : AWSModel


/**
 <p>The name of the <code>AppInstanceUser</code>.</p>
 */
@property (nonatomic, strong) AWSChimeSDKIdentityAppInstanceUser * _Nullable appInstanceUser;

@end

/**
 <p>The attributes of an <code>Endpoint</code>.</p>
 Required parameters: [DeviceToken]
 */
@interface AWSChimeSDKIdentityEndpointAttributes : AWSModel


/**
 <p>The device token for the GCM, APNS, and APNS_SANDBOX endpoint types.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceToken;

/**
 <p>The VOIP device token for the APNS and APNS_SANDBOX endpoint types.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voipDeviceToken;

@end

/**
 <p>A read-only field that represents the state of an <code>AppInstanceUserEndpoint</code>. Supported values:</p><ul><li><p><code>ACTIVE</code>: The <code>AppInstanceUserEndpoint</code> is active and able to receive messages. When <code>ACTIVE</code>, the <code>EndpointStatusReason</code> remains empty.</p></li><li><p><code>INACTIVE</code>: The <code>AppInstanceUserEndpoint</code> is inactive and can't receive message. When INACTIVE, the corresponding reason will be conveyed through EndpointStatusReason.</p></li><li><p><code>INVALID_DEVICE_TOKEN</code> indicates that an <code>AppInstanceUserEndpoint</code> is <code>INACTIVE</code> due to invalid device token</p></li><li><p><code>INVALID_PINPOINT_ARN</code> indicates that an <code>AppInstanceUserEndpoint</code> is <code>INACTIVE</code> due to an invalid pinpoint ARN that was input through the <code>ResourceArn</code> field.</p></li></ul>
 Required parameters: [Status]
 */
@interface AWSChimeSDKIdentityEndpointState : AWSModel


/**
 <p>Enum that indicates the Status of an <code>AppInstanceUserEndpoint</code>.</p>
 */
@property (nonatomic, assign) AWSChimeSDKIdentityEndpointStatus status;

/**
 <p>The reason for the <code>EndpointStatus</code>.</p>
 */
@property (nonatomic, assign) AWSChimeSDKIdentityEndpointStatusReason statusReason;

@end

/**
 
 */
@interface AWSChimeSDKIdentityGetAppInstanceRetentionSettingsRequest : AWSRequest


/**
 <p>The ARN of the <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

@end

/**
 
 */
@interface AWSChimeSDKIdentityGetAppInstanceRetentionSettingsResponse : AWSModel


/**
 <p>The retention settings for the <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) AWSChimeSDKIdentityAppInstanceRetentionSettings * _Nullable appInstanceRetentionSettings;

/**
 <p>The timestamp representing the time at which the specified items are retained, in Epoch Seconds.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable initiateDeletionTimestamp;

@end

/**
 <p>The details of a user.</p>
 */
@interface AWSChimeSDKIdentityIdentity : AWSModel


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
@interface AWSChimeSDKIdentityListAppInstanceAdminsRequest : AWSRequest


/**
 <p>The ARN of the <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

/**
 <p>The maximum number of administrators that you want to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token returned from previous API requests until the number of administrators is reached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeSDKIdentityListAppInstanceAdminsResponse : AWSModel


/**
 <p>The information for each administrator.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKIdentityAppInstanceAdminSummary *> * _Nullable appInstanceAdmins;

/**
 <p>The ARN of the <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

/**
 <p>The token returned from previous API requests until the number of administrators is reached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeSDKIdentityListAppInstanceUserEndpointsRequest : AWSRequest


/**
 <p>The ARN of the <code>AppInstanceUser</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserArn;

/**
 <p>The maximum number of endpoints that you want to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token passed by previous API calls until all requested endpoints are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeSDKIdentityListAppInstanceUserEndpointsResponse : AWSModel


/**
 <p>The information for each requested <code>AppInstanceUserEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKIdentityAppInstanceUserEndpointSummary *> * _Nullable appInstanceUserEndpoints;

/**
 <p>The token passed by previous API calls until all requested endpoints are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeSDKIdentityListAppInstanceUsersRequest : AWSRequest


/**
 <p>The ARN of the <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

/**
 <p>The maximum number of requests that you want returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token passed by previous API calls until all requested users are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeSDKIdentityListAppInstanceUsersResponse : AWSModel


/**
 <p>The ARN of the <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

/**
 <p>The information for each requested <code>AppInstanceUser</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKIdentityAppInstanceUserSummary *> * _Nullable appInstanceUsers;

/**
 <p>The token passed by previous API calls until all requested users are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeSDKIdentityListAppInstancesRequest : AWSRequest


/**
 <p>The maximum number of <code>AppInstance</code>s that you want to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token passed by previous API requests until you reach the maximum number of <code>AppInstances</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeSDKIdentityListAppInstancesResponse : AWSModel


/**
 <p>The information for each <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKIdentityAppInstanceSummary *> * _Nullable appInstances;

/**
 <p>The token passed by previous API requests until the maximum number of <code>AppInstance</code>s is reached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSChimeSDKIdentityListTagsForResourceRequest : AWSRequest


/**
 <p>The ARN of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

@end

/**
 
 */
@interface AWSChimeSDKIdentityListTagsForResourceResponse : AWSModel


/**
 <p>The tag key-value pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKIdentityTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSChimeSDKIdentityPutAppInstanceRetentionSettingsRequest : AWSRequest


/**
 <p>The ARN of the <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

/**
 <p>The time in days to retain data. Data type: number.</p>
 */
@property (nonatomic, strong) AWSChimeSDKIdentityAppInstanceRetentionSettings * _Nullable appInstanceRetentionSettings;

@end

/**
 
 */
@interface AWSChimeSDKIdentityPutAppInstanceRetentionSettingsResponse : AWSModel


/**
 <p>The time in days to retain data. Data type: number.</p>
 */
@property (nonatomic, strong) AWSChimeSDKIdentityAppInstanceRetentionSettings * _Nullable appInstanceRetentionSettings;

/**
 <p>The time at which the API deletes data.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable initiateDeletionTimestamp;

@end

/**
 
 */
@interface AWSChimeSDKIdentityRegisterAppInstanceUserEndpointRequest : AWSRequest


/**
 <p>Boolean that controls whether the AppInstanceUserEndpoint is opted in to receive messages. <code>ALL</code> indicates the endpoint receives all messages. <code>NONE</code> indicates the endpoint receives no messages.</p>
 */
@property (nonatomic, assign) AWSChimeSDKIdentityAllowMessages allowMessages;

/**
 <p>The ARN of the <code>AppInstanceUser</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserArn;

/**
 <p>The idempotency token for each client request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The attributes of an <code>Endpoint</code>.</p>
 */
@property (nonatomic, strong) AWSChimeSDKIdentityEndpointAttributes * _Nullable endpointAttributes;

/**
 <p>The name of the <code>AppInstanceUserEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ARN of the resource to which the endpoint belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The type of the <code>AppInstanceUserEndpoint</code>. Supported types:</p><ul><li><p><code>APNS</code>: The mobile notification service for an Apple device.</p></li><li><p><code>APNS_SANDBOX</code>: The sandbox environment of the mobile notification service for an Apple device.</p></li><li><p><code>GCM</code>: The mobile notification service for an Android device.</p></li></ul><p>Populate the <code>ResourceArn</code> value of each type as <code>PinpointAppArn</code>.</p>
 */
@property (nonatomic, assign) AWSChimeSDKIdentityAppInstanceUserEndpointType types;

@end

/**
 
 */
@interface AWSChimeSDKIdentityRegisterAppInstanceUserEndpointResponse : AWSModel


/**
 <p>The ARN of the <code>AppInstanceUser</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserArn;

/**
 <p>The unique identifier of the <code>AppInstanceUserEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointId;

@end

/**
 <p>A tag object containing a key-value pair.</p>
 Required parameters: [Key, Value]
 */
@interface AWSChimeSDKIdentityTag : AWSModel


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
@interface AWSChimeSDKIdentityTagResourceRequest : AWSRequest


/**
 <p>The resource ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

/**
 <p>The tag key-value pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSChimeSDKIdentityTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSChimeSDKIdentityUntagResourceRequest : AWSRequest


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
@interface AWSChimeSDKIdentityUpdateAppInstanceRequest : AWSRequest


/**
 <p>The ARN of the <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

/**
 <p>The metadata that you want to change.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metadata;

/**
 <p>The name that you want to change.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSChimeSDKIdentityUpdateAppInstanceResponse : AWSModel


/**
 <p>The ARN of the <code>AppInstance</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceArn;

@end

/**
 
 */
@interface AWSChimeSDKIdentityUpdateAppInstanceUserEndpointRequest : AWSRequest


/**
 <p>Boolean that controls whether the <code>AppInstanceUserEndpoint</code> is opted in to receive messages. <code>ALL</code> indicates the endpoint will receive all messages. <code>NONE</code> indicates the endpoint will receive no messages.</p>
 */
@property (nonatomic, assign) AWSChimeSDKIdentityAllowMessages allowMessages;

/**
 <p>The ARN of the <code>AppInstanceUser</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserArn;

/**
 <p>The unique identifier of the <code>AppInstanceUserEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointId;

/**
 <p>The name of the <code>AppInstanceUserEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSChimeSDKIdentityUpdateAppInstanceUserEndpointResponse : AWSModel


/**
 <p>The ARN of the <code>AppInstanceUser</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserArn;

/**
 <p>The unique identifier of the <code>AppInstanceUserEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointId;

@end

/**
 
 */
@interface AWSChimeSDKIdentityUpdateAppInstanceUserRequest : AWSRequest


/**
 <p>The ARN of the <code>AppInstanceUser</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserArn;

/**
 <p>The metadata of the <code>AppInstanceUser</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metadata;

/**
 <p>The name of the <code>AppInstanceUser</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSChimeSDKIdentityUpdateAppInstanceUserResponse : AWSModel


/**
 <p>The ARN of the <code>AppInstanceUser</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appInstanceUserArn;

@end

NS_ASSUME_NONNULL_END
