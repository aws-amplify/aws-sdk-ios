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

FOUNDATION_EXPORT NSString *const AWSramErrorDomain;

typedef NS_ENUM(NSInteger, AWSramErrorType) {
    AWSramErrorUnknown,
    AWSramErrorIdempotentParameterMismatch,
    AWSramErrorInvalidClientToken,
    AWSramErrorInvalidMaxResults,
    AWSramErrorInvalidNextToken,
    AWSramErrorInvalidParameter,
    AWSramErrorInvalidResourceType,
    AWSramErrorInvalidStateTransition,
    AWSramErrorMalformedArn,
    AWSramErrorMissingRequiredParameter,
    AWSramErrorOperationNotPermitted,
    AWSramErrorResourceArnNotFound,
    AWSramErrorResourceShareInvitationAlreadyAccepted,
    AWSramErrorResourceShareInvitationAlreadyRejected,
    AWSramErrorResourceShareInvitationArnNotFound,
    AWSramErrorResourceShareInvitationExpired,
    AWSramErrorResourceShareLimitExceeded,
    AWSramErrorServerInternal,
    AWSramErrorServiceUnavailable,
    AWSramErrorTagLimitExceeded,
    AWSramErrorTagPolicyViolation,
    AWSramErrorUnknownResource,
};

typedef NS_ENUM(NSInteger, AWSramResourceOwner) {
    AWSramResourceOwnerUnknown,
    AWSramResourceOwnerSelf,
    AWSramResourceOwnerOtherAccounts,
};

typedef NS_ENUM(NSInteger, AWSramResourceShareAssociationStatus) {
    AWSramResourceShareAssociationStatusUnknown,
    AWSramResourceShareAssociationStatusAssociating,
    AWSramResourceShareAssociationStatusAssociated,
    AWSramResourceShareAssociationStatusFailed,
    AWSramResourceShareAssociationStatusDisassociating,
    AWSramResourceShareAssociationStatusDisassociated,
};

typedef NS_ENUM(NSInteger, AWSramResourceShareAssociationType) {
    AWSramResourceShareAssociationTypeUnknown,
    AWSramResourceShareAssociationTypePrincipal,
    AWSramResourceShareAssociationTypeResource,
};

typedef NS_ENUM(NSInteger, AWSramResourceShareFeatureSet) {
    AWSramResourceShareFeatureSetUnknown,
    AWSramResourceShareFeatureSetCreatedFromPolicy,
    AWSramResourceShareFeatureSetPromotingToStandard,
    AWSramResourceShareFeatureSetStandard,
};

typedef NS_ENUM(NSInteger, AWSramResourceShareInvitationStatus) {
    AWSramResourceShareInvitationStatusUnknown,
    AWSramResourceShareInvitationStatusPending,
    AWSramResourceShareInvitationStatusAccepted,
    AWSramResourceShareInvitationStatusRejected,
    AWSramResourceShareInvitationStatusExpired,
};

typedef NS_ENUM(NSInteger, AWSramResourceShareStatus) {
    AWSramResourceShareStatusUnknown,
    AWSramResourceShareStatusPending,
    AWSramResourceShareStatusActive,
    AWSramResourceShareStatusFailed,
    AWSramResourceShareStatusDeleting,
    AWSramResourceShareStatusDeleted,
};

typedef NS_ENUM(NSInteger, AWSramResourceStatus) {
    AWSramResourceStatusUnknown,
    AWSramResourceStatusAvailable,
    AWSramResourceStatusZonalResourceInaccessible,
    AWSramResourceStatusLimitExceeded,
    AWSramResourceStatusUnavailable,
    AWSramResourceStatusPending,
};

@class AWSramAcceptResourceShareInvitationRequest;
@class AWSramAcceptResourceShareInvitationResponse;
@class AWSramAssociateResourceSharePermissionRequest;
@class AWSramAssociateResourceSharePermissionResponse;
@class AWSramAssociateResourceShareRequest;
@class AWSramAssociateResourceShareResponse;
@class AWSramCreateResourceShareRequest;
@class AWSramCreateResourceShareResponse;
@class AWSramDeleteResourceShareRequest;
@class AWSramDeleteResourceShareResponse;
@class AWSramDisassociateResourceSharePermissionRequest;
@class AWSramDisassociateResourceSharePermissionResponse;
@class AWSramDisassociateResourceShareRequest;
@class AWSramDisassociateResourceShareResponse;
@class AWSramEnableSharingWithAwsOrganizationRequest;
@class AWSramEnableSharingWithAwsOrganizationResponse;
@class AWSramGetPermissionRequest;
@class AWSramGetPermissionResponse;
@class AWSramGetResourcePoliciesRequest;
@class AWSramGetResourcePoliciesResponse;
@class AWSramGetResourceShareAssociationsRequest;
@class AWSramGetResourceShareAssociationsResponse;
@class AWSramGetResourceShareInvitationsRequest;
@class AWSramGetResourceShareInvitationsResponse;
@class AWSramGetResourceSharesRequest;
@class AWSramGetResourceSharesResponse;
@class AWSramListPendingInvitationResourcesRequest;
@class AWSramListPendingInvitationResourcesResponse;
@class AWSramListPermissionsRequest;
@class AWSramListPermissionsResponse;
@class AWSramListPrincipalsRequest;
@class AWSramListPrincipalsResponse;
@class AWSramListResourceSharePermissionsRequest;
@class AWSramListResourceSharePermissionsResponse;
@class AWSramListResourceTypesRequest;
@class AWSramListResourceTypesResponse;
@class AWSramListResourcesRequest;
@class AWSramListResourcesResponse;
@class AWSramPrincipal;
@class AWSramPromoteResourceShareCreatedFromPolicyRequest;
@class AWSramPromoteResourceShareCreatedFromPolicyResponse;
@class AWSramRejectResourceShareInvitationRequest;
@class AWSramRejectResourceShareInvitationResponse;
@class AWSramResource;
@class AWSramResourceShare;
@class AWSramResourceShareAssociation;
@class AWSramResourceShareInvitation;
@class AWSramResourceSharePermissionDetail;
@class AWSramResourceSharePermissionSummary;
@class AWSramServiceNameAndResourceType;
@class AWSramTag;
@class AWSramTagFilter;
@class AWSramTagResourceRequest;
@class AWSramTagResourceResponse;
@class AWSramUntagResourceRequest;
@class AWSramUntagResourceResponse;
@class AWSramUpdateResourceShareRequest;
@class AWSramUpdateResourceShareResponse;

/**
 
 */
@interface AWSramAcceptResourceShareInvitationRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The Amazon Resource Name (ARN) of the invitation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceShareInvitationArn;

@end

/**
 
 */
@interface AWSramAcceptResourceShareInvitationResponse : AWSModel


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>Information about the invitation.</p>
 */
@property (nonatomic, strong) AWSramResourceShareInvitation * _Nullable resourceShareInvitation;

@end

/**
 
 */
@interface AWSramAssociateResourceSharePermissionRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The ARN of the AWS RAM permission to associate with the resource share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable permissionArn;

/**
 <p>Indicates whether the permission should replace the permissions that are currently associated with the resource share. Use <code>true</code> to replace the current permissions. Use <code>false</code> to add the permission to the current permission.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replace;

/**
 <p>The Amazon Resource Name (ARN) of the resource share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceShareArn;

@end

/**
 
 */
@interface AWSramAssociateResourceSharePermissionResponse : AWSModel


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>Indicates whether the request succeeded.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable returnValue;

@end

/**
 
 */
@interface AWSramAssociateResourceShareRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The principals.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable principals;

/**
 <p>The Amazon Resource Names (ARN) of the resources.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceArns;

/**
 <p>The Amazon Resource Name (ARN) of the resource share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceShareArn;

@end

/**
 
 */
@interface AWSramAssociateResourceShareResponse : AWSModel


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>Information about the associations.</p>
 */
@property (nonatomic, strong) NSArray<AWSramResourceShareAssociation *> * _Nullable resourceShareAssociations;

@end

/**
 
 */
@interface AWSramCreateResourceShareRequest : AWSRequest


/**
 <p>Indicates whether principals outside your AWS organization can be associated with a resource share.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowExternalPrincipals;

/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The name of the resource share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ARNs of the permissions to associate with the resource share. If you do not specify an ARN for the permission, AWS RAM automatically attaches the default version of the permission for each resource type.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable permissionArns;

/**
 <p>The principals to associate with the resource share. The possible values are IDs of AWS accounts, the ARN of an OU or organization from AWS Organizations.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable principals;

/**
 <p>The Amazon Resource Names (ARN) of the resources to associate with the resource share.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceArns;

/**
 <p>One or more tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSramTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSramCreateResourceShareResponse : AWSModel


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>Information about the resource share.</p>
 */
@property (nonatomic, strong) AWSramResourceShare * _Nullable resourceShare;

@end

/**
 
 */
@interface AWSramDeleteResourceShareRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The Amazon Resource Name (ARN) of the resource share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceShareArn;

@end

/**
 
 */
@interface AWSramDeleteResourceShareResponse : AWSModel


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>Indicates whether the request succeeded.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable returnValue;

@end

/**
 
 */
@interface AWSramDisassociateResourceSharePermissionRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The ARN of the permission to disassociate from the resource share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable permissionArn;

/**
 <p>The Amazon Resource Name (ARN) of the resource share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceShareArn;

@end

/**
 
 */
@interface AWSramDisassociateResourceSharePermissionResponse : AWSModel


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>Indicates whether the request succeeded.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable returnValue;

@end

/**
 
 */
@interface AWSramDisassociateResourceShareRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The principals.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable principals;

/**
 <p>The Amazon Resource Names (ARNs) of the resources.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceArns;

/**
 <p>The Amazon Resource Name (ARN) of the resource share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceShareArn;

@end

/**
 
 */
@interface AWSramDisassociateResourceShareResponse : AWSModel


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>Information about the associations.</p>
 */
@property (nonatomic, strong) NSArray<AWSramResourceShareAssociation *> * _Nullable resourceShareAssociations;

@end

/**
 
 */
@interface AWSramEnableSharingWithAwsOrganizationRequest : AWSRequest


@end

/**
 
 */
@interface AWSramEnableSharingWithAwsOrganizationResponse : AWSModel


/**
 <p>Indicates whether the request succeeded.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable returnValue;

@end

/**
 
 */
@interface AWSramGetPermissionRequest : AWSRequest


/**
 <p>The ARN of the permission.</p>
 */
@property (nonatomic, strong) NSString * _Nullable permissionArn;

/**
 <p>The identifier for the version of the permission.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable permissionVersion;

@end

/**
 
 */
@interface AWSramGetPermissionResponse : AWSModel


/**
 <p>Information about the permission.</p>
 */
@property (nonatomic, strong) AWSramResourceSharePermissionDetail * _Nullable permission;

@end

/**
 
 */
@interface AWSramGetResourcePoliciesRequest : AWSRequest


/**
 <p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The principal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

/**
 <p>The Amazon Resource Names (ARN) of the resources.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceArns;

@end

/**
 
 */
@interface AWSramGetResourcePoliciesResponse : AWSModel


/**
 <p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A key policy document, in JSON format.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policies;

@end

/**
 
 */
@interface AWSramGetResourceShareAssociationsRequest : AWSRequest


/**
 <p>The association status.</p>
 */
@property (nonatomic, assign) AWSramResourceShareAssociationStatus associationStatus;

/**
 <p>The association type. Specify <code>PRINCIPAL</code> to list the principals that are associated with the specified resource share. Specify <code>RESOURCE</code> to list the resources that are associated with the specified resource share.</p>
 */
@property (nonatomic, assign) AWSramResourceShareAssociationType associationType;

/**
 <p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The principal. You cannot specify this parameter if the association type is <code>RESOURCE</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

/**
 <p>The Amazon Resource Name (ARN) of the resource. You cannot specify this parameter if the association type is <code>PRINCIPAL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The Amazon Resource Names (ARN) of the resource shares.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceShareArns;

@end

/**
 
 */
@interface AWSramGetResourceShareAssociationsResponse : AWSModel


/**
 <p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the associations.</p>
 */
@property (nonatomic, strong) NSArray<AWSramResourceShareAssociation *> * _Nullable resourceShareAssociations;

@end

/**
 
 */
@interface AWSramGetResourceShareInvitationsRequest : AWSRequest


/**
 <p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The Amazon Resource Names (ARN) of the resource shares.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceShareArns;

/**
 <p>The Amazon Resource Names (ARN) of the invitations.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceShareInvitationArns;

@end

/**
 
 */
@interface AWSramGetResourceShareInvitationsResponse : AWSModel


/**
 <p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the invitations.</p>
 */
@property (nonatomic, strong) NSArray<AWSramResourceShareInvitation *> * _Nullable resourceShareInvitations;

@end

/**
 
 */
@interface AWSramGetResourceSharesRequest : AWSRequest


/**
 <p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The name of the resource share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The token for the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The type of owner.</p>
 */
@property (nonatomic, assign) AWSramResourceOwner resourceOwner;

/**
 <p>The Amazon Resource Names (ARN) of the resource shares.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceShareArns;

/**
 <p>The status of the resource share.</p>
 */
@property (nonatomic, assign) AWSramResourceShareStatus resourceShareStatus;

/**
 <p>One or more tag filters.</p>
 */
@property (nonatomic, strong) NSArray<AWSramTagFilter *> * _Nullable tagFilters;

@end

/**
 
 */
@interface AWSramGetResourceSharesResponse : AWSModel


/**
 <p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the resource shares.</p>
 */
@property (nonatomic, strong) NSArray<AWSramResourceShare *> * _Nullable resourceShares;

@end

/**
 
 */
@interface AWSramListPendingInvitationResourcesRequest : AWSRequest


/**
 <p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The Amazon Resource Name (ARN) of the invitation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceShareInvitationArn;

@end

/**
 
 */
@interface AWSramListPendingInvitationResourcesResponse : AWSModel


/**
 <p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the resources included the resource share.</p>
 */
@property (nonatomic, strong) NSArray<AWSramResource *> * _Nullable resources;

@end

/**
 
 */
@interface AWSramListPermissionsRequest : AWSRequest


/**
 <p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Specifies the resource type for which to list permissions. For example, to list only permissions that apply to EC2 subnets, specify <code>ec2:Subnet</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

@end

/**
 
 */
@interface AWSramListPermissionsResponse : AWSModel


/**
 <p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the permissions.</p>
 */
@property (nonatomic, strong) NSArray<AWSramResourceSharePermissionSummary *> * _Nullable permissions;

@end

/**
 
 */
@interface AWSramListPrincipalsRequest : AWSRequest


/**
 <p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The principals.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable principals;

/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The type of owner.</p>
 */
@property (nonatomic, assign) AWSramResourceOwner resourceOwner;

/**
 <p>The Amazon Resource Names (ARN) of the resource shares.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceShareArns;

/**
 <p>The resource type.</p><p>Valid values: <code>codebuild:Project</code> | <code>codebuild:ReportGroup</code> | <code>ec2:CapacityReservation</code> | <code>ec2:DedicatedHost</code> | <code>ec2:Subnet</code> | <code>ec2:TrafficMirrorTarget</code> | <code>ec2:TransitGateway</code> | <code>imagebuilder:Component</code> | <code>imagebuilder:Image</code> | <code>imagebuilder:ImageRecipe</code> | <code>license-manager:LicenseConfiguration</code> I <code>resource-groups:Group</code> | <code>rds:Cluster</code> | <code>route53resolver:ResolverRule</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

@end

/**
 
 */
@interface AWSramListPrincipalsResponse : AWSModel


/**
 <p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The principals.</p>
 */
@property (nonatomic, strong) NSArray<AWSramPrincipal *> * _Nullable principals;

@end

/**
 
 */
@interface AWSramListResourceSharePermissionsRequest : AWSRequest


/**
 <p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The Amazon Resource Name (ARN) of the resource share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceShareArn;

@end

/**
 
 */
@interface AWSramListResourceSharePermissionsResponse : AWSModel


/**
 <p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The permissions associated with the resource share.</p>
 */
@property (nonatomic, strong) NSArray<AWSramResourceSharePermissionSummary *> * _Nullable permissions;

@end

/**
 
 */
@interface AWSramListResourceTypesRequest : AWSRequest


/**
 <p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSramListResourceTypesResponse : AWSModel


/**
 <p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The shareable resource types supported by AWS RAM.</p>
 */
@property (nonatomic, strong) NSArray<AWSramServiceNameAndResourceType *> * _Nullable resourceTypes;

@end

/**
 
 */
@interface AWSramListResourcesRequest : AWSRequest


/**
 <p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The principal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

/**
 <p>The Amazon Resource Names (ARN) of the resources.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceArns;

/**
 <p>The type of owner.</p>
 */
@property (nonatomic, assign) AWSramResourceOwner resourceOwner;

/**
 <p>The Amazon Resource Names (ARN) of the resource shares.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceShareArns;

/**
 <p>The resource type.</p><p>Valid values: <code>codebuild:Project</code> | <code>codebuild:ReportGroup</code> | <code>ec2:CapacityReservation</code> | <code>ec2:DedicatedHost</code> | <code>ec2:Subnet</code> | <code>ec2:TrafficMirrorTarget</code> | <code>ec2:TransitGateway</code> | <code>imagebuilder:Component</code> | <code>imagebuilder:Image</code> | <code>imagebuilder:ImageRecipe</code> | <code>license-manager:LicenseConfiguration</code> I <code>resource-groups:Group</code> | <code>rds:Cluster</code> | <code>route53resolver:ResolverRule</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

@end

/**
 
 */
@interface AWSramListResourcesResponse : AWSModel


/**
 <p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the resources.</p>
 */
@property (nonatomic, strong) NSArray<AWSramResource *> * _Nullable resources;

@end

/**
 <p>Describes a principal for use with AWS Resource Access Manager.</p>
 */
@interface AWSramPrincipal : AWSModel


/**
 <p>The time when the principal was associated with the resource share.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>Indicates whether the principal belongs to the same AWS organization as the AWS account that owns the resource share.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable external;

/**
 <p>The ID of the principal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The time when the association was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>The Amazon Resource Name (ARN) of the resource share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceShareArn;

@end

/**
 
 */
@interface AWSramPromoteResourceShareCreatedFromPolicyRequest : AWSRequest


/**
 <p>The ARN of the resource share to promote.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceShareArn;

@end

/**
 
 */
@interface AWSramPromoteResourceShareCreatedFromPolicyResponse : AWSModel


/**
 <p>Indicates whether the request succeeded.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable returnValue;

@end

/**
 
 */
@interface AWSramRejectResourceShareInvitationRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The Amazon Resource Name (ARN) of the invitation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceShareInvitationArn;

@end

/**
 
 */
@interface AWSramRejectResourceShareInvitationResponse : AWSModel


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>Information about the invitation.</p>
 */
@property (nonatomic, strong) AWSramResourceShareInvitation * _Nullable resourceShareInvitation;

@end

/**
 <p>Describes a resource associated with a resource share.</p>
 */
@interface AWSramResource : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The time when the resource was associated with the resource share.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The time when the association was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>The ARN of the resource group. This value is returned only if the resource is a resource group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceGroupArn;

/**
 <p>The Amazon Resource Name (ARN) of the resource share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceShareArn;

/**
 <p>The status of the resource.</p>
 */
@property (nonatomic, assign) AWSramResourceStatus status;

/**
 <p>A message about the status of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>The resource type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>Describes a resource share.</p>
 */
@interface AWSramResourceShare : AWSModel


/**
 <p>Indicates whether principals outside your AWS organization can be associated with a resource share.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowExternalPrincipals;

/**
 <p>The time when the resource share was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>Indicates how the resource share was created. Possible values include:</p><ul><li><p><code>CREATED_FROM_POLICY</code> - Indicates that the resource share was created from an AWS Identity and Access Management (AWS IAM) policy attached to a resource. These resource shares are visible only to the AWS account that created it. They cannot be modified in AWS RAM.</p></li><li><p><code>PROMOTING_TO_STANDARD</code> - The resource share is in the process of being promoted. For more information, see <a>PromoteResourceShareCreatedFromPolicy</a>.</p></li><li><p><code>STANDARD</code> - Indicates that the resource share was created in AWS RAM using the console or APIs. These resource shares are visible to all principals. They can be modified in AWS RAM.</p></li></ul>
 */
@property (nonatomic, assign) AWSramResourceShareFeatureSet featureSet;

/**
 <p>The time when the resource share was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>The name of the resource share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ID of the AWS account that owns the resource share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owningAccountId;

/**
 <p>The Amazon Resource Name (ARN) of the resource share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceShareArn;

/**
 <p>The status of the resource share.</p>
 */
@property (nonatomic, assign) AWSramResourceShareStatus status;

/**
 <p>A message about the status of the resource share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>The tags for the resource share.</p>
 */
@property (nonatomic, strong) NSArray<AWSramTag *> * _Nullable tags;

@end

/**
 <p>Describes an association with a resource share.</p>
 */
@interface AWSramResourceShareAssociation : AWSModel


/**
 <p>The associated entity. For resource associations, this is the ARN of the resource. For principal associations, this is the ID of an AWS account or the ARN of an OU or organization from AWS Organizations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associatedEntity;

/**
 <p>The association type.</p>
 */
@property (nonatomic, assign) AWSramResourceShareAssociationType associationType;

/**
 <p>The time when the association was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>Indicates whether the principal belongs to the same AWS organization as the AWS account that owns the resource share.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable external;

/**
 <p>The time when the association was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>The Amazon Resource Name (ARN) of the resource share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceShareArn;

/**
 <p>The name of the resource share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceShareName;

/**
 <p>The status of the association.</p>
 */
@property (nonatomic, assign) AWSramResourceShareAssociationStatus status;

/**
 <p>A message about the status of the association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

@end

/**
 <p>Describes an invitation to join a resource share.</p>
 */
@interface AWSramResourceShareInvitation : AWSModel


/**
 <p>The date and time when the invitation was sent.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable invitationTimestamp;

/**
 <p>The ID of the AWS account that received the invitation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable receiverAccountId;

/**
 <p>The Amazon Resource Name (ARN) of the resource share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceShareArn;

/**
 <p>To view the resources associated with a pending resource share invitation, use <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_ListPendingInvitationResources.html"> ListPendingInvitationResources</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSramResourceShareAssociation *> * _Nullable resourceShareAssociations;

/**
 <p>The Amazon Resource Name (ARN) of the invitation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceShareInvitationArn;

/**
 <p>The name of the resource share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceShareName;

/**
 <p>The ID of the AWS account that sent the invitation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable senderAccountId;

/**
 <p>The status of the invitation.</p>
 */
@property (nonatomic, assign) AWSramResourceShareInvitationStatus status;

@end

/**
 <p>Information about an AWS RAM permission.</p>
 */
@interface AWSramResourceSharePermissionDetail : AWSModel


/**
 <p>The ARN of the permission.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date and time when the permission was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The identifier for the version of the permission that is set as the default version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultVersion;

/**
 <p>The date and time when the permission was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>The name of the permission.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The permission's effect and actions in JSON format. The <code>effect</code> indicates whether the actions are allowed or denied. The <code>actions</code> list the API actions to which the principal is granted or denied access.</p>
 */
@property (nonatomic, strong) NSString * _Nullable permission;

/**
 <p>The resource type to which the permission applies.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>The identifier for the version of the permission.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>Information about a permission that is associated with a resource share.</p>
 */
@interface AWSramResourceSharePermissionSummary : AWSModel


/**
 <p>The ARN of the permission.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date and time when the permission was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The identifier for the version of the permission that is set as the default version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultVersion;

/**
 <p>The date and time when the permission was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>The name of the permission.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of resource to which the permission applies.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>The current status of the permission.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The identifier for the version of the permission.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>Information about the shareable resource types and the AWS services to which they belong.</p>
 */
@interface AWSramServiceNameAndResourceType : AWSModel


/**
 <p>The shareable resource types.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>The name of the AWS services to which the resources belong.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceName;

@end

/**
 <p>Information about a tag.</p>
 */
@interface AWSramTag : AWSModel


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
 <p>Used to filter information based on tags.</p>
 */
@interface AWSramTagFilter : AWSModel


/**
 <p>The tag key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tagKey;

/**
 <p>The tag values.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagValues;

@end

/**
 
 */
@interface AWSramTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceShareArn;

/**
 <p>One or more tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSramTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSramTagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSramUntagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceShareArn;

/**
 <p>The tag keys of the tags to remove.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSramUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSramUpdateResourceShareRequest : AWSRequest


/**
 <p>Indicates whether principals outside your AWS organization can be associated with a resource share.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowExternalPrincipals;

/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The name of the resource share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Amazon Resource Name (ARN) of the resource share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceShareArn;

@end

/**
 
 */
@interface AWSramUpdateResourceShareResponse : AWSModel


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>Information about the resource share.</p>
 */
@property (nonatomic, strong) AWSramResourceShare * _Nullable resourceShare;

@end

NS_ASSUME_NONNULL_END
