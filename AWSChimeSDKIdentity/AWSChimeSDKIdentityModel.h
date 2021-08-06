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
@class AWSChimeSDKIdentityDescribeAppInstanceAdminRequest;
@class AWSChimeSDKIdentityDescribeAppInstanceAdminResponse;
@class AWSChimeSDKIdentityDescribeAppInstanceRequest;
@class AWSChimeSDKIdentityDescribeAppInstanceResponse;
@class AWSChimeSDKIdentityDescribeAppInstanceUserRequest;
@class AWSChimeSDKIdentityDescribeAppInstanceUserResponse;
@class AWSChimeSDKIdentityGetAppInstanceRetentionSettingsRequest;
@class AWSChimeSDKIdentityGetAppInstanceRetentionSettingsResponse;
@class AWSChimeSDKIdentityIdentity;
@class AWSChimeSDKIdentityListAppInstanceAdminsRequest;
@class AWSChimeSDKIdentityListAppInstanceAdminsResponse;
@class AWSChimeSDKIdentityListAppInstanceUsersRequest;
@class AWSChimeSDKIdentityListAppInstanceUsersResponse;
@class AWSChimeSDKIdentityListAppInstancesRequest;
@class AWSChimeSDKIdentityListAppInstancesResponse;
@class AWSChimeSDKIdentityPutAppInstanceRetentionSettingsRequest;
@class AWSChimeSDKIdentityPutAppInstanceRetentionSettingsResponse;
@class AWSChimeSDKIdentityTag;
@class AWSChimeSDKIdentityUpdateAppInstanceRequest;
@class AWSChimeSDKIdentityUpdateAppInstanceResponse;
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
 <p>Describes a tag applied to a resource.</p>
 Required parameters: [Key, Value]
 */
@interface AWSChimeSDKIdentityTag : AWSModel


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
