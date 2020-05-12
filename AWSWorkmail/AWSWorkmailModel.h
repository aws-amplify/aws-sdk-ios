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

FOUNDATION_EXPORT NSString *const AWSWorkmailErrorDomain;

typedef NS_ENUM(NSInteger, AWSWorkmailErrorType) {
    AWSWorkmailErrorUnknown,
    AWSWorkmailErrorDirectoryServiceAuthenticationFailed,
    AWSWorkmailErrorDirectoryUnavailable,
    AWSWorkmailErrorEmailAddressInUse,
    AWSWorkmailErrorEntityAlreadyRegistered,
    AWSWorkmailErrorEntityNotFound,
    AWSWorkmailErrorEntityState,
    AWSWorkmailErrorInvalidConfiguration,
    AWSWorkmailErrorInvalidParameter,
    AWSWorkmailErrorInvalidPassword,
    AWSWorkmailErrorLimitExceeded,
    AWSWorkmailErrorMailDomainNotFound,
    AWSWorkmailErrorMailDomainState,
    AWSWorkmailErrorNameAvailability,
    AWSWorkmailErrorOrganizationNotFound,
    AWSWorkmailErrorOrganizationState,
    AWSWorkmailErrorReservedName,
    AWSWorkmailErrorResourceNotFound,
    AWSWorkmailErrorTooManyTags,
    AWSWorkmailErrorUnsupportedOperation,
};

typedef NS_ENUM(NSInteger, AWSWorkmailAccessControlRuleEffect) {
    AWSWorkmailAccessControlRuleEffectUnknown,
    AWSWorkmailAccessControlRuleEffectAllow,
    AWSWorkmailAccessControlRuleEffectDeny,
};

typedef NS_ENUM(NSInteger, AWSWorkmailEntityState) {
    AWSWorkmailEntityStateUnknown,
    AWSWorkmailEntityStateEnabled,
    AWSWorkmailEntityStateDisabled,
    AWSWorkmailEntityStateDeleted,
};

typedef NS_ENUM(NSInteger, AWSWorkmailMemberType) {
    AWSWorkmailMemberTypeUnknown,
    AWSWorkmailMemberTypeGroup,
    AWSWorkmailMemberTypeUser,
};

typedef NS_ENUM(NSInteger, AWSWorkmailPermissionType) {
    AWSWorkmailPermissionTypeUnknown,
    AWSWorkmailPermissionTypeFullAccess,
    AWSWorkmailPermissionTypeSendAs,
    AWSWorkmailPermissionTypeSendOnBehalf,
};

typedef NS_ENUM(NSInteger, AWSWorkmailResourceType) {
    AWSWorkmailResourceTypeUnknown,
    AWSWorkmailResourceTypeRoom,
    AWSWorkmailResourceTypeEquipment,
};

typedef NS_ENUM(NSInteger, AWSWorkmailUserRole) {
    AWSWorkmailUserRoleUnknown,
    AWSWorkmailUserRoleUser,
    AWSWorkmailUserRoleResource,
    AWSWorkmailUserRoleSystemUser,
};

@class AWSWorkmailAccessControlRule;
@class AWSWorkmailAssociateDelegateToResourceRequest;
@class AWSWorkmailAssociateDelegateToResourceResponse;
@class AWSWorkmailAssociateMemberToGroupRequest;
@class AWSWorkmailAssociateMemberToGroupResponse;
@class AWSWorkmailBookingOptions;
@class AWSWorkmailCreateAliasRequest;
@class AWSWorkmailCreateAliasResponse;
@class AWSWorkmailCreateGroupRequest;
@class AWSWorkmailCreateGroupResponse;
@class AWSWorkmailCreateResourceRequest;
@class AWSWorkmailCreateResourceResponse;
@class AWSWorkmailCreateUserRequest;
@class AWSWorkmailCreateUserResponse;
@class AWSWorkmailDelegate;
@class AWSWorkmailDeleteAccessControlRuleRequest;
@class AWSWorkmailDeleteAccessControlRuleResponse;
@class AWSWorkmailDeleteAliasRequest;
@class AWSWorkmailDeleteAliasResponse;
@class AWSWorkmailDeleteGroupRequest;
@class AWSWorkmailDeleteGroupResponse;
@class AWSWorkmailDeleteMailboxPermissionsRequest;
@class AWSWorkmailDeleteMailboxPermissionsResponse;
@class AWSWorkmailDeleteResourceRequest;
@class AWSWorkmailDeleteResourceResponse;
@class AWSWorkmailDeleteUserRequest;
@class AWSWorkmailDeleteUserResponse;
@class AWSWorkmailDeregisterFromWorkMailRequest;
@class AWSWorkmailDeregisterFromWorkMailResponse;
@class AWSWorkmailDescribeGroupRequest;
@class AWSWorkmailDescribeGroupResponse;
@class AWSWorkmailDescribeOrganizationRequest;
@class AWSWorkmailDescribeOrganizationResponse;
@class AWSWorkmailDescribeResourceRequest;
@class AWSWorkmailDescribeResourceResponse;
@class AWSWorkmailDescribeUserRequest;
@class AWSWorkmailDescribeUserResponse;
@class AWSWorkmailDisassociateDelegateFromResourceRequest;
@class AWSWorkmailDisassociateDelegateFromResourceResponse;
@class AWSWorkmailDisassociateMemberFromGroupRequest;
@class AWSWorkmailDisassociateMemberFromGroupResponse;
@class AWSWorkmailGetAccessControlEffectRequest;
@class AWSWorkmailGetAccessControlEffectResponse;
@class AWSWorkmailGetMailboxDetailsRequest;
@class AWSWorkmailGetMailboxDetailsResponse;
@class AWSWorkmailGroup;
@class AWSWorkmailListAccessControlRulesRequest;
@class AWSWorkmailListAccessControlRulesResponse;
@class AWSWorkmailListAliasesRequest;
@class AWSWorkmailListAliasesResponse;
@class AWSWorkmailListGroupMembersRequest;
@class AWSWorkmailListGroupMembersResponse;
@class AWSWorkmailListGroupsRequest;
@class AWSWorkmailListGroupsResponse;
@class AWSWorkmailListMailboxPermissionsRequest;
@class AWSWorkmailListMailboxPermissionsResponse;
@class AWSWorkmailListOrganizationsRequest;
@class AWSWorkmailListOrganizationsResponse;
@class AWSWorkmailListResourceDelegatesRequest;
@class AWSWorkmailListResourceDelegatesResponse;
@class AWSWorkmailListResourcesRequest;
@class AWSWorkmailListResourcesResponse;
@class AWSWorkmailListTagsForResourceRequest;
@class AWSWorkmailListTagsForResourceResponse;
@class AWSWorkmailListUsersRequest;
@class AWSWorkmailListUsersResponse;
@class AWSWorkmailMember;
@class AWSWorkmailOrganizationSummary;
@class AWSWorkmailPermission;
@class AWSWorkmailPutAccessControlRuleRequest;
@class AWSWorkmailPutAccessControlRuleResponse;
@class AWSWorkmailPutMailboxPermissionsRequest;
@class AWSWorkmailPutMailboxPermissionsResponse;
@class AWSWorkmailRegisterToWorkMailRequest;
@class AWSWorkmailRegisterToWorkMailResponse;
@class AWSWorkmailResetPasswordRequest;
@class AWSWorkmailResetPasswordResponse;
@class AWSWorkmailResource;
@class AWSWorkmailTag;
@class AWSWorkmailTagResourceRequest;
@class AWSWorkmailTagResourceResponse;
@class AWSWorkmailUntagResourceRequest;
@class AWSWorkmailUntagResourceResponse;
@class AWSWorkmailUpdateMailboxQuotaRequest;
@class AWSWorkmailUpdateMailboxQuotaResponse;
@class AWSWorkmailUpdatePrimaryEmailAddressRequest;
@class AWSWorkmailUpdatePrimaryEmailAddressResponse;
@class AWSWorkmailUpdateResourceRequest;
@class AWSWorkmailUpdateResourceResponse;
@class AWSWorkmailUser;

/**
 <p>A rule that controls access to an Amazon WorkMail organization.</p>
 */
@interface AWSWorkmailAccessControlRule : AWSModel


/**
 <p>Access protocol actions to include in the rule. Valid values include <code>ActiveSync</code>, <code>AutoDiscover</code>, <code>EWS</code>, <code>IMAP</code>, <code>SMTP</code>, <code>WindowsOutlook</code>, and <code>WebMail</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable actions;

/**
 <p>The date that the rule was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable dateCreated;

/**
 <p>The date that the rule was modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable dateModified;

/**
 <p>The rule description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The rule effect.</p>
 */
@property (nonatomic, assign) AWSWorkmailAccessControlRuleEffect effect;

/**
 <p>IPv4 CIDR ranges to include in the rule.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable ipRanges;

/**
 <p>The rule name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Access protocol actions to exclude from the rule. Valid values include <code>ActiveSync</code>, <code>AutoDiscover</code>, <code>EWS</code>, <code>IMAP</code>, <code>SMTP</code>, <code>WindowsOutlook</code>, and <code>WebMail</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable notActions;

/**
 <p>IPv4 CIDR ranges to exclude from the rule.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable notIpRanges;

/**
 <p>User IDs to exclude from the rule.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable notUserIds;

/**
 <p>User IDs to include in the rule.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable userIds;

@end

/**
 
 */
@interface AWSWorkmailAssociateDelegateToResourceRequest : AWSRequest


/**
 <p>The member (user or group) to associate to the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityId;

/**
 <p>The organization under which the resource exists.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

/**
 <p>The resource for which members (users or groups) are associated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

@end

/**
 
 */
@interface AWSWorkmailAssociateDelegateToResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSWorkmailAssociateMemberToGroupRequest : AWSRequest


/**
 <p>The group to which the member (user or group) is associated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

/**
 <p>The member (user or group) to associate to the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberId;

/**
 <p>The organization under which the group exists.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

@end

/**
 
 */
@interface AWSWorkmailAssociateMemberToGroupResponse : AWSModel


@end

/**
 <p>At least one delegate must be associated to the resource to disable automatic replies from the resource.</p>
 */
@interface AWSWorkmailBookingOptions : AWSModel


/**
 <p>The resource's ability to automatically reply to requests. If disabled, delegates must be associated to the resource.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoAcceptRequests;

/**
 <p>The resource's ability to automatically decline any conflicting requests.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoDeclineConflictingRequests;

/**
 <p>The resource's ability to automatically decline any recurring requests.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoDeclineRecurringRequests;

@end

/**
 
 */
@interface AWSWorkmailCreateAliasRequest : AWSRequest


/**
 <p>The alias to add to the member set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alias;

/**
 <p>The member (user or group) to which this alias is added.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityId;

/**
 <p>The organization under which the member (user or group) exists.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

@end

/**
 
 */
@interface AWSWorkmailCreateAliasResponse : AWSModel


@end

/**
 
 */
@interface AWSWorkmailCreateGroupRequest : AWSRequest


/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The organization under which the group is to be created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

@end

/**
 
 */
@interface AWSWorkmailCreateGroupResponse : AWSModel


/**
 <p>The identifier of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

@end

/**
 
 */
@interface AWSWorkmailCreateResourceRequest : AWSRequest


/**
 <p>The name of the new resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The identifier associated with the organization for which the resource is created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

/**
 <p>The type of the new resource. The available types are <code>equipment</code> and <code>room</code>.</p>
 */
@property (nonatomic, assign) AWSWorkmailResourceType types;

@end

/**
 
 */
@interface AWSWorkmailCreateResourceResponse : AWSModel


/**
 <p>The identifier of the new resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

@end

/**
 
 */
@interface AWSWorkmailCreateUserRequest : AWSRequest


/**
 <p>The display name for the new user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The name for the new user. Simple AD or AD Connector user names have a maximum length of 20. All others have a maximum length of 64.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The identifier of the organization for which the user is created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

/**
 <p>The password for the new user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

@end

/**
 
 */
@interface AWSWorkmailCreateUserResponse : AWSModel


/**
 <p>The identifier for the new user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 <p>The name of the attribute, which is one of the values defined in the UserAttribute enumeration.</p>
 Required parameters: [Id, Type]
 */
@interface AWSWorkmailDelegate : AWSModel


/**
 <p>The identifier for the user or group associated as the resource's delegate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The type of the delegate: user or group.</p>
 */
@property (nonatomic, assign) AWSWorkmailMemberType types;

@end

/**
 
 */
@interface AWSWorkmailDeleteAccessControlRuleRequest : AWSRequest


/**
 <p>The name of the access control rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The identifier for the organization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

@end

/**
 
 */
@interface AWSWorkmailDeleteAccessControlRuleResponse : AWSModel


@end

/**
 
 */
@interface AWSWorkmailDeleteAliasRequest : AWSRequest


/**
 <p>The aliases to be removed from the user's set of aliases. Duplicate entries in the list are collapsed into single entries (the list is transformed into a set).</p>
 */
@property (nonatomic, strong) NSString * _Nullable alias;

/**
 <p>The identifier for the member (user or group) from which to have the aliases removed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityId;

/**
 <p>The identifier for the organization under which the user exists.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

@end

/**
 
 */
@interface AWSWorkmailDeleteAliasResponse : AWSModel


@end

/**
 
 */
@interface AWSWorkmailDeleteGroupRequest : AWSRequest


/**
 <p>The identifier of the group to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

/**
 <p>The organization that contains the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

@end

/**
 
 */
@interface AWSWorkmailDeleteGroupResponse : AWSModel


@end

/**
 
 */
@interface AWSWorkmailDeleteMailboxPermissionsRequest : AWSRequest


/**
 <p>The identifier of the member (user or group)that owns the mailbox.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityId;

/**
 <p>The identifier of the member (user or group) for which to delete granted permissions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable granteeId;

/**
 <p>The identifier of the organization under which the member (user or group) exists.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

@end

/**
 
 */
@interface AWSWorkmailDeleteMailboxPermissionsResponse : AWSModel


@end

/**
 
 */
@interface AWSWorkmailDeleteResourceRequest : AWSRequest


/**
 <p>The identifier associated with the organization from which the resource is deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

/**
 <p>The identifier of the resource to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

@end

/**
 
 */
@interface AWSWorkmailDeleteResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSWorkmailDeleteUserRequest : AWSRequest


/**
 <p>The organization that contains the user to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

/**
 <p>The identifier of the user to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSWorkmailDeleteUserResponse : AWSModel


@end

/**
 
 */
@interface AWSWorkmailDeregisterFromWorkMailRequest : AWSRequest


/**
 <p>The identifier for the member (user or group) to be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityId;

/**
 <p>The identifier for the organization under which the Amazon WorkMail entity exists.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

@end

/**
 
 */
@interface AWSWorkmailDeregisterFromWorkMailResponse : AWSModel


@end

/**
 
 */
@interface AWSWorkmailDescribeGroupRequest : AWSRequest


/**
 <p>The identifier for the group to be described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

/**
 <p>The identifier for the organization under which the group exists.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

@end

/**
 
 */
@interface AWSWorkmailDescribeGroupResponse : AWSModel


/**
 <p>The date and time when a user was deregistered from WorkMail, in UNIX epoch time format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable disabledDate;

/**
 <p>The email of the described group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>The date and time when a user was registered to WorkMail, in UNIX epoch time format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable enabledDate;

/**
 <p>The identifier of the described group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

/**
 <p>The name of the described group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The state of the user: enabled (registered to Amazon WorkMail) or disabled (deregistered or never registered to WorkMail).</p>
 */
@property (nonatomic, assign) AWSWorkmailEntityState state;

@end

/**
 
 */
@interface AWSWorkmailDescribeOrganizationRequest : AWSRequest


/**
 <p>The identifier for the organization to be described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

@end

/**
 
 */
@interface AWSWorkmailDescribeOrganizationResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the organization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>The alias for an organization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alias;

/**
 <p>The date at which the organization became usable in the WorkMail context, in UNIX epoch time format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completedDate;

/**
 <p>The default mail domain associated with the organization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultMailDomain;

/**
 <p>The identifier for the directory associated with an Amazon WorkMail organization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directoryId;

/**
 <p>The type of directory associated with the WorkMail organization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directoryType;

/**
 <p>(Optional) The error message indicating if unexpected behavior was encountered with regards to the organization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The identifier of an organization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

/**
 <p>The state of an organization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable state;

@end

/**
 
 */
@interface AWSWorkmailDescribeResourceRequest : AWSRequest


/**
 <p>The identifier associated with the organization for which the resource is described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

/**
 <p>The identifier of the resource to be described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

@end

/**
 
 */
@interface AWSWorkmailDescribeResourceResponse : AWSModel


/**
 <p>The booking options for the described resource.</p>
 */
@property (nonatomic, strong) AWSWorkmailBookingOptions * _Nullable bookingOptions;

/**
 <p>The date and time when a resource was disabled from WorkMail, in UNIX epoch time format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable disabledDate;

/**
 <p>The email of the described resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>The date and time when a resource was enabled for WorkMail, in UNIX epoch time format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable enabledDate;

/**
 <p>The name of the described resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The identifier of the described resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The state of the resource: enabled (registered to Amazon WorkMail), disabled (deregistered or never registered to WorkMail), or deleted.</p>
 */
@property (nonatomic, assign) AWSWorkmailEntityState state;

/**
 <p>The type of the described resource.</p>
 */
@property (nonatomic, assign) AWSWorkmailResourceType types;

@end

/**
 
 */
@interface AWSWorkmailDescribeUserRequest : AWSRequest


/**
 <p>The identifier for the organization under which the user exists.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

/**
 <p>The identifier for the user to be described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSWorkmailDescribeUserResponse : AWSModel


/**
 <p>The date and time at which the user was disabled for Amazon WorkMail usage, in UNIX epoch time format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable disabledDate;

/**
 <p>The display name of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The email of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>The date and time at which the user was enabled for Amazon WorkMail usage, in UNIX epoch time format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable enabledDate;

/**
 <p>The name for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The state of a user: enabled (registered to Amazon WorkMail) or disabled (deregistered or never registered to WorkMail).</p>
 */
@property (nonatomic, assign) AWSWorkmailEntityState state;

/**
 <p>The identifier for the described user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

/**
 <p>In certain cases, other entities are modeled as users. If interoperability is enabled, resources are imported into Amazon WorkMail as users. Because different WorkMail organizations rely on different directory types, administrators can distinguish between an unregistered user (account is disabled and has a user role) and the directory administrators. The values are USER, RESOURCE, and SYSTEM_USER.</p>
 */
@property (nonatomic, assign) AWSWorkmailUserRole userRole;

@end

/**
 
 */
@interface AWSWorkmailDisassociateDelegateFromResourceRequest : AWSRequest


/**
 <p>The identifier for the member (user, group) to be removed from the resource's delegates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityId;

/**
 <p>The identifier for the organization under which the resource exists.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

/**
 <p>The identifier of the resource from which delegates' set members are removed. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

@end

/**
 
 */
@interface AWSWorkmailDisassociateDelegateFromResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSWorkmailDisassociateMemberFromGroupRequest : AWSRequest


/**
 <p>The identifier for the group from which members are removed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

/**
 <p>The identifier for the member to be removed to the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberId;

/**
 <p>The identifier for the organization under which the group exists.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

@end

/**
 
 */
@interface AWSWorkmailDisassociateMemberFromGroupResponse : AWSModel


@end

/**
 
 */
@interface AWSWorkmailGetAccessControlEffectRequest : AWSRequest


/**
 <p>The access protocol action. Valid values include <code>ActiveSync</code>, <code>AutoDiscover</code>, <code>EWS</code>, <code>IMAP</code>, <code>SMTP</code>, <code>WindowsOutlook</code>, and <code>WebMail</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable action;

/**
 <p>The IPv4 address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipAddress;

/**
 <p>The identifier for the organization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

/**
 <p>The user ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSWorkmailGetAccessControlEffectResponse : AWSModel


/**
 <p>The rule effect.</p>
 */
@property (nonatomic, assign) AWSWorkmailAccessControlRuleEffect effect;

/**
 <p>The rules that match the given parameters, resulting in an effect.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable matchedRules;

@end

/**
 
 */
@interface AWSWorkmailGetMailboxDetailsRequest : AWSRequest


/**
 <p>The identifier for the organization that contains the user whose mailbox details are being requested.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

/**
 <p>The identifier for the user whose mailbox details are being requested.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSWorkmailGetMailboxDetailsResponse : AWSModel


/**
 <p>The maximum allowed mailbox size, in MB, for the specified user.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mailboxQuota;

/**
 <p>The current mailbox size, in MB, for the specified user.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mailboxSize;

@end

/**
 <p>The representation of an Amazon WorkMail group.</p>
 */
@interface AWSWorkmailGroup : AWSModel


/**
 <p>The date indicating when the group was disabled from Amazon WorkMail use.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable disabledDate;

/**
 <p>The email of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>The date indicating when the group was enabled for Amazon WorkMail use.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable enabledDate;

/**
 <p>The identifier of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The state of the group, which can be ENABLED, DISABLED, or DELETED.</p>
 */
@property (nonatomic, assign) AWSWorkmailEntityState state;

@end

/**
 
 */
@interface AWSWorkmailListAccessControlRulesRequest : AWSRequest


/**
 <p>The identifier for the organization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

@end

/**
 
 */
@interface AWSWorkmailListAccessControlRulesResponse : AWSModel


/**
 <p>The access control rules.</p>
 */
@property (nonatomic, strong) NSArray<AWSWorkmailAccessControlRule *> * _Nullable rules;

@end

/**
 
 */
@interface AWSWorkmailListAliasesRequest : AWSRequest


/**
 <p>The identifier for the entity for which to list the aliases.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityId;

/**
 <p>The maximum number of results to return in a single call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to use to retrieve the next page of results. The first call does not contain any tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The identifier for the organization under which the entity exists.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

@end

/**
 
 */
@interface AWSWorkmailListAliasesResponse : AWSModel


/**
 <p>The entity's paginated aliases.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable aliases;

/**
 <p>The token to use to retrieve the next page of results. The value is "null" when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSWorkmailListGroupMembersRequest : AWSRequest


/**
 <p>The identifier for the group to which the members (users or groups) are associated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

/**
 <p>The maximum number of results to return in a single call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> The token to use to retrieve the next page of results. The first call does not contain any tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The identifier for the organization under which the group exists.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

@end

/**
 
 */
@interface AWSWorkmailListGroupMembersResponse : AWSModel


/**
 <p>The members associated to the group.</p>
 */
@property (nonatomic, strong) NSArray<AWSWorkmailMember *> * _Nullable members;

/**
 <p>The token to use to retrieve the next page of results. The first call does not contain any tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSWorkmailListGroupsRequest : AWSRequest


/**
 <p>The maximum number of results to return in a single call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to use to retrieve the next page of results. The first call does not contain any tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The identifier for the organization under which the groups exist.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

@end

/**
 
 */
@interface AWSWorkmailListGroupsResponse : AWSModel


/**
 <p>The overview of groups for an organization.</p>
 */
@property (nonatomic, strong) NSArray<AWSWorkmailGroup *> * _Nullable groups;

/**
 <p>The token to use to retrieve the next page of results. The value is "null" when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSWorkmailListMailboxPermissionsRequest : AWSRequest


/**
 <p>The identifier of the user, group, or resource for which to list mailbox permissions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityId;

/**
 <p>The maximum number of results to return in a single call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to use to retrieve the next page of results. The first call does not contain any tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The identifier of the organization under which the user, group, or resource exists.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

@end

/**
 
 */
@interface AWSWorkmailListMailboxPermissionsResponse : AWSModel


/**
 <p>The token to use to retrieve the next page of results. The value is "null" when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>One page of the user, group, or resource mailbox permissions.</p>
 */
@property (nonatomic, strong) NSArray<AWSWorkmailPermission *> * _Nullable permissions;

@end

/**
 
 */
@interface AWSWorkmailListOrganizationsRequest : AWSRequest


/**
 <p>The maximum number of results to return in a single call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to use to retrieve the next page of results. The first call does not contain any tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSWorkmailListOrganizationsResponse : AWSModel


/**
 <p>The token to use to retrieve the next page of results. The value is "null" when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The overview of owned organizations presented as a list of organization summaries.</p>
 */
@property (nonatomic, strong) NSArray<AWSWorkmailOrganizationSummary *> * _Nullable organizationSummaries;

@end

/**
 
 */
@interface AWSWorkmailListResourceDelegatesRequest : AWSRequest


/**
 <p>The number of maximum results in a page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token used to paginate through the delegates associated with a resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The identifier for the organization that contains the resource for which delegates are listed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

/**
 <p>The identifier for the resource whose delegates are listed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

@end

/**
 
 */
@interface AWSWorkmailListResourceDelegatesResponse : AWSModel


/**
 <p>One page of the resource's delegates.</p>
 */
@property (nonatomic, strong) NSArray<AWSWorkmailDelegate *> * _Nullable delegates;

/**
 <p>The token used to paginate through the delegates associated with a resource. While results are still available, it has an associated value. When the last page is reached, the token is empty. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSWorkmailListResourcesRequest : AWSRequest


/**
 <p>The maximum number of results to return in a single call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to use to retrieve the next page of results. The first call does not contain any tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The identifier for the organization under which the resources exist.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

@end

/**
 
 */
@interface AWSWorkmailListResourcesResponse : AWSModel


/**
 <p> The token used to paginate through all the organization's resources. While results are still available, it has an associated value. When the last page is reached, the token is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>One page of the organization's resource representation.</p>
 */
@property (nonatomic, strong) NSArray<AWSWorkmailResource *> * _Nullable resources;

@end

/**
 
 */
@interface AWSWorkmailListTagsForResourceRequest : AWSRequest


/**
 <p>The resource ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

@end

/**
 
 */
@interface AWSWorkmailListTagsForResourceResponse : AWSModel


/**
 <p>A list of tag key-value pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSWorkmailTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSWorkmailListUsersRequest : AWSRequest


/**
 <p>The maximum number of results to return in a single call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to use to retrieve the next page of results. The first call does not contain any tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The identifier for the organization under which the users exist.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

@end

/**
 
 */
@interface AWSWorkmailListUsersResponse : AWSModel


/**
 <p> The token to use to retrieve the next page of results. This value is `null` when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The overview of users for an organization.</p>
 */
@property (nonatomic, strong) NSArray<AWSWorkmailUser *> * _Nullable users;

@end

/**
 <p>The representation of a user or group.</p>
 */
@interface AWSWorkmailMember : AWSModel


/**
 <p>The date indicating when the member was disabled from Amazon WorkMail use.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable disabledDate;

/**
 <p>The date indicating when the member was enabled for Amazon WorkMail use.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable enabledDate;

/**
 <p>The identifier of the member.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the member.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The state of the member, which can be ENABLED, DISABLED, or DELETED.</p>
 */
@property (nonatomic, assign) AWSWorkmailEntityState state;

/**
 <p>A member can be a user or group.</p>
 */
@property (nonatomic, assign) AWSWorkmailMemberType types;

@end

/**
 <p>The representation of an organization.</p>
 */
@interface AWSWorkmailOrganizationSummary : AWSModel


/**
 <p>The alias associated with the organization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alias;

/**
 <p>The error message associated with the organization. It is only present if unexpected behavior has occurred with regards to the organization. It provides insight or solutions regarding unexpected behavior.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The identifier associated with the organization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

/**
 <p>The state associated with the organization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable state;

@end

/**
 <p>Permission granted to a user, group, or resource to access a certain aspect of another user, group, or resource mailbox.</p>
 Required parameters: [GranteeId, GranteeType, PermissionValues]
 */
@interface AWSWorkmailPermission : AWSModel


/**
 <p>The identifier of the user, group, or resource to which the permissions are granted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable granteeId;

/**
 <p>The type of user, group, or resource referred to in GranteeId.</p>
 */
@property (nonatomic, assign) AWSWorkmailMemberType granteeType;

/**
 <p>The permissions granted to the grantee. SEND_AS allows the grantee to send email as the owner of the mailbox (the grantee is not mentioned on these emails). SEND_ON_BEHALF allows the grantee to send email on behalf of the owner of the mailbox (the grantee is not mentioned as the physical sender of these emails). FULL_ACCESS allows the grantee full access to the mailbox, irrespective of other folder-level permissions set on the mailbox.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable permissionValues;

@end

/**
 
 */
@interface AWSWorkmailPutAccessControlRuleRequest : AWSRequest


/**
 <p>Access protocol actions to include in the rule. Valid values include <code>ActiveSync</code>, <code>AutoDiscover</code>, <code>EWS</code>, <code>IMAP</code>, <code>SMTP</code>, <code>WindowsOutlook</code>, and <code>WebMail</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable actions;

/**
 <p>The rule description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The rule effect.</p>
 */
@property (nonatomic, assign) AWSWorkmailAccessControlRuleEffect effect;

/**
 <p>IPv4 CIDR ranges to include in the rule.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable ipRanges;

/**
 <p>The rule name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Access protocol actions to exclude from the rule. Valid values include <code>ActiveSync</code>, <code>AutoDiscover</code>, <code>EWS</code>, <code>IMAP</code>, <code>SMTP</code>, <code>WindowsOutlook</code>, and <code>WebMail</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable notActions;

/**
 <p>IPv4 CIDR ranges to exclude from the rule.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable notIpRanges;

/**
 <p>User IDs to exclude from the rule.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable notUserIds;

/**
 <p>The identifier of the organization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

/**
 <p>User IDs to include in the rule.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable userIds;

@end

/**
 
 */
@interface AWSWorkmailPutAccessControlRuleResponse : AWSModel


@end

/**
 
 */
@interface AWSWorkmailPutMailboxPermissionsRequest : AWSRequest


/**
 <p>The identifier of the user, group, or resource for which to update mailbox permissions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityId;

/**
 <p>The identifier of the user, group, or resource to which to grant the permissions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable granteeId;

/**
 <p>The identifier of the organization under which the user, group, or resource exists.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

/**
 <p>The permissions granted to the grantee. SEND_AS allows the grantee to send email as the owner of the mailbox (the grantee is not mentioned on these emails). SEND_ON_BEHALF allows the grantee to send email on behalf of the owner of the mailbox (the grantee is not mentioned as the physical sender of these emails). FULL_ACCESS allows the grantee full access to the mailbox, irrespective of other folder-level permissions set on the mailbox.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable permissionValues;

@end

/**
 
 */
@interface AWSWorkmailPutMailboxPermissionsResponse : AWSModel


@end

/**
 
 */
@interface AWSWorkmailRegisterToWorkMailRequest : AWSRequest


/**
 <p>The email for the user, group, or resource to be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>The identifier for the user, group, or resource to be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityId;

/**
 <p>The identifier for the organization under which the user, group, or resource exists.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

@end

/**
 
 */
@interface AWSWorkmailRegisterToWorkMailResponse : AWSModel


@end

/**
 
 */
@interface AWSWorkmailResetPasswordRequest : AWSRequest


/**
 <p>The identifier of the organization that contains the user for which the password is reset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

/**
 <p>The new password for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 <p>The identifier of the user for whom the password is reset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSWorkmailResetPasswordResponse : AWSModel


@end

/**
 <p>The representation of a resource.</p>
 */
@interface AWSWorkmailResource : AWSModel


/**
 <p>The date indicating when the resource was disabled from Amazon WorkMail use.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable disabledDate;

/**
 <p>The email of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>The date indicating when the resource was enabled for Amazon WorkMail use.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable enabledDate;

/**
 <p>The identifier of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The state of the resource, which can be ENABLED, DISABLED, or DELETED.</p>
 */
@property (nonatomic, assign) AWSWorkmailEntityState state;

/**
 <p>The type of the resource: equipment or room.</p>
 */
@property (nonatomic, assign) AWSWorkmailResourceType types;

@end

/**
 <p>Describes a tag applied to a resource.</p>
 Required parameters: [Key, Value]
 */
@interface AWSWorkmailTag : AWSModel


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
@interface AWSWorkmailTagResourceRequest : AWSRequest


/**
 <p>The resource ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

/**
 <p>The tag key-value pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSWorkmailTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSWorkmailTagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSWorkmailUntagResourceRequest : AWSRequest


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
@interface AWSWorkmailUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSWorkmailUpdateMailboxQuotaRequest : AWSRequest


/**
 <p>The updated mailbox quota, in MB, for the specified user.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mailboxQuota;

/**
 <p>The identifier for the organization that contains the user for whom to update the mailbox quota.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

/**
 <p>The identifer for the user for whom to update the mailbox quota.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSWorkmailUpdateMailboxQuotaResponse : AWSModel


@end

/**
 
 */
@interface AWSWorkmailUpdatePrimaryEmailAddressRequest : AWSRequest


/**
 <p>The value of the email to be updated as primary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>The user, group, or resource to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityId;

/**
 <p>The organization that contains the user, group, or resource to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

@end

/**
 
 */
@interface AWSWorkmailUpdatePrimaryEmailAddressResponse : AWSModel


@end

/**
 
 */
@interface AWSWorkmailUpdateResourceRequest : AWSRequest


/**
 <p>The resource's booking options to be updated.</p>
 */
@property (nonatomic, strong) AWSWorkmailBookingOptions * _Nullable bookingOptions;

/**
 <p>The name of the resource to be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The identifier associated with the organization for which the resource is updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

/**
 <p>The identifier of the resource to be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

@end

/**
 
 */
@interface AWSWorkmailUpdateResourceResponse : AWSModel


@end

/**
 <p>The representation of an Amazon WorkMail user.</p>
 */
@interface AWSWorkmailUser : AWSModel


/**
 <p>The date indicating when the user was disabled from Amazon WorkMail use.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable disabledDate;

/**
 <p>The display name of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The email of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>The date indicating when the user was enabled for Amazon WorkMail use.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable enabledDate;

/**
 <p>The identifier of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The state of the user, which can be ENABLED, DISABLED, or DELETED.</p>
 */
@property (nonatomic, assign) AWSWorkmailEntityState state;

/**
 <p>The role of the user.</p>
 */
@property (nonatomic, assign) AWSWorkmailUserRole userRole;

@end

NS_ASSUME_NONNULL_END
