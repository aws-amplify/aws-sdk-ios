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

FOUNDATION_EXPORT NSString *const AWSMarketplacecatalogErrorDomain;

typedef NS_ENUM(NSInteger, AWSMarketplacecatalogErrorType) {
    AWSMarketplacecatalogErrorUnknown,
    AWSMarketplacecatalogErrorAccessDenied,
    AWSMarketplacecatalogErrorInternalService,
    AWSMarketplacecatalogErrorResourceInUse,
    AWSMarketplacecatalogErrorResourceNotFound,
    AWSMarketplacecatalogErrorResourceNotSupported,
    AWSMarketplacecatalogErrorServiceQuotaExceeded,
    AWSMarketplacecatalogErrorThrottling,
    AWSMarketplacecatalogErrorValidation,
};

typedef NS_ENUM(NSInteger, AWSMarketplacecatalogChangeStatus) {
    AWSMarketplacecatalogChangeStatusUnknown,
    AWSMarketplacecatalogChangeStatusPreparing,
    AWSMarketplacecatalogChangeStatusApplying,
    AWSMarketplacecatalogChangeStatusSucceeded,
    AWSMarketplacecatalogChangeStatusCancelled,
    AWSMarketplacecatalogChangeStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSMarketplacecatalogSortOrder) {
    AWSMarketplacecatalogSortOrderUnknown,
    AWSMarketplacecatalogSortOrderAscending,
    AWSMarketplacecatalogSortOrderDescending,
};

@class AWSMarketplacecatalogCancelChangeSetRequest;
@class AWSMarketplacecatalogCancelChangeSetResponse;
@class AWSMarketplacecatalogChange;
@class AWSMarketplacecatalogChangeSetSummaryListItem;
@class AWSMarketplacecatalogChangeSummary;
@class AWSMarketplacecatalogDescribeChangeSetRequest;
@class AWSMarketplacecatalogDescribeChangeSetResponse;
@class AWSMarketplacecatalogDescribeEntityRequest;
@class AWSMarketplacecatalogDescribeEntityResponse;
@class AWSMarketplacecatalogEntity;
@class AWSMarketplacecatalogEntitySummary;
@class AWSMarketplacecatalogErrorDetail;
@class AWSMarketplacecatalogFilter;
@class AWSMarketplacecatalogListChangeSetsRequest;
@class AWSMarketplacecatalogListChangeSetsResponse;
@class AWSMarketplacecatalogListEntitiesRequest;
@class AWSMarketplacecatalogListEntitiesResponse;
@class AWSMarketplacecatalogSort;
@class AWSMarketplacecatalogStartChangeSetRequest;
@class AWSMarketplacecatalogStartChangeSetResponse;

/**
 
 */
@interface AWSMarketplacecatalogCancelChangeSetRequest : AWSRequest


/**
 <p>Required. The catalog related to the request. Fixed value: <code>AWSMarketplace</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalog;

/**
 <p>Required. The unique identifier of the <code>StartChangeSet</code> request that you want to cancel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeSetId;

@end

/**
 
 */
@interface AWSMarketplacecatalogCancelChangeSetResponse : AWSModel


/**
 <p>The ARN associated with the change set referenced in this request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeSetArn;

/**
 <p>The unique identifier for the change set referenced in this request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeSetId;

@end

/**
 <p>An object that contains the <code>ChangeType</code>, <code>Details</code>, and <code>Entity</code>.</p>
 Required parameters: [ChangeType, Entity, Details]
 */
@interface AWSMarketplacecatalogChange : AWSModel


/**
 <p>Change types are single string values that describe your intention for the change. Each change type is unique for each <code>EntityType</code> provided in the change's scope.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeType;

/**
 <p>This object contains details specific to the change type of the requested change.</p>
 */
@property (nonatomic, strong) NSString * _Nullable details;

/**
 <p>The entity to be changed.</p>
 */
@property (nonatomic, strong) AWSMarketplacecatalogEntity * _Nullable entity;

@end

/**
 <p>A summary of a change set returned in a list of change sets when the <code>ListChangeSets</code> action is called.</p>
 */
@interface AWSMarketplacecatalogChangeSetSummaryListItem : AWSModel


/**
 <p>The ARN associated with the unique identifier for the change set referenced in this request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeSetArn;

/**
 <p>The unique identifier for a change set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeSetId;

/**
 <p>The non-unique name for the change set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeSetName;

/**
 <p>The time, in ISO 8601 format (2018-02-27T13:45:22Z), when the change set was finished.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endTime;

/**
 <p>This object is a list of entity IDs (string) that are a part of a change set. The entity ID list is a maximum of 20 entities. It must contain at least one entity.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable entityIdList;

/**
 <p>The time, in ISO 8601 format (2018-02-27T13:45:22Z), when the change set was started.</p>
 */
@property (nonatomic, strong) NSString * _Nullable startTime;

/**
 <p>The current status of the change set.</p>
 */
@property (nonatomic, assign) AWSMarketplacecatalogChangeStatus status;

@end

/**
 <p>This object is a container for common summary information about the change. The summary doesn't contain the whole change structure.</p>
 */
@interface AWSMarketplacecatalogChangeSummary : AWSModel


/**
 <p>The type of the change.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeType;

/**
 <p>This object contains details specific to the change type of the requested change.</p>
 */
@property (nonatomic, strong) NSString * _Nullable details;

/**
 <p>The entity to be changed.</p>
 */
@property (nonatomic, strong) AWSMarketplacecatalogEntity * _Nullable entity;

/**
 <p>An array of <code>ErrorDetail</code> objects associated with the change.</p>
 */
@property (nonatomic, strong) NSArray<AWSMarketplacecatalogErrorDetail *> * _Nullable errorDetailList;

@end

/**
 
 */
@interface AWSMarketplacecatalogDescribeChangeSetRequest : AWSRequest


/**
 <p>Required. The catalog related to the request. Fixed value: <code>AWSMarketplace</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable catalog;

/**
 <p>Required. The unique identifier for the <code>StartChangeSet</code> request that you want to describe the details for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeSetId;

@end

/**
 
 */
@interface AWSMarketplacecatalogDescribeChangeSetResponse : AWSModel


/**
 <p>An array of <code>ChangeSummary</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSMarketplacecatalogChangeSummary *> * _Nullable changeSet;

/**
 <p>The ARN associated with the unique identifier for the change set referenced in this request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeSetArn;

/**
 <p>Required. The unique identifier for the change set referenced in this request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeSetId;

/**
 <p>The optional name provided in the <code>StartChangeSet</code> request. If you do not provide a name, one is set by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeSetName;

/**
 <p>The date and time, in ISO 8601 format (2018-02-27T13:45:22Z), the request transitioned to a terminal state. The change cannot transition to a different state. Null if the request is not in a terminal state. </p>
 */
@property (nonatomic, strong) NSString * _Nullable endTime;

/**
 <p>Returned if there is a failure on the change set, but that failure is not related to any of the changes in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureDescription;

/**
 <p>The date and time, in ISO 8601 format (2018-02-27T13:45:22Z), the request started. </p>
 */
@property (nonatomic, strong) NSString * _Nullable startTime;

/**
 <p>The status of the change request.</p>
 */
@property (nonatomic, assign) AWSMarketplacecatalogChangeStatus status;

@end

/**
 
 */
@interface AWSMarketplacecatalogDescribeEntityRequest : AWSRequest


/**
 <p>Required. The catalog related to the request. Fixed value: <code>AWSMarketplace</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable catalog;

/**
 <p>Required. The unique ID of the entity to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityId;

@end

/**
 
 */
@interface AWSMarketplacecatalogDescribeEntityResponse : AWSModel


/**
 <p>This stringified JSON object includes the details of the entity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable details;

/**
 <p>The ARN associated to the unique identifier for the change set referenced in this request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityArn;

/**
 <p>The identifier of the entity, in the format of <code>EntityId@RevisionId</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityIdentifier;

/**
 <p>The named type of the entity, in the format of <code>EntityType@Version</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityType;

/**
 <p>The last modified date of the entity, in ISO 8601 format (2018-02-27T13:45:22Z).</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

@end

/**
 <p>A product entity contains data that describes your product, its supported features, and how it can be used or launched by your customer. </p>
 Required parameters: [Type]
 */
@interface AWSMarketplacecatalogEntity : AWSModel


/**
 <p>The identifier for the entity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The type of entity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>This object is a container for common summary information about the entity. The summary doesn't contain the whole entity structure, but it does contain information common across all entities.</p>
 */
@interface AWSMarketplacecatalogEntitySummary : AWSModel


/**
 <p>The ARN associated with the unique identifier for the entity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityArn;

/**
 <p>The unique identifier for the entity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityId;

/**
 <p>The type of the entity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityType;

/**
 <p>The last time the entity was published, using ISO 8601 format (2018-02-27T13:45:22Z).</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 <p>The name for the entity. This value is not unique. It is defined by the seller.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The visibility status of the entity to buyers. This value can be <code>Public</code> (everyone can view the entity), <code>Limited</code> (the entity is visible to limited accounts only), or <code>Restricted</code> (the entity was published and then unpublished and only existing buyers can view it). </p>
 */
@property (nonatomic, strong) NSString * _Nullable visibility;

@end

/**
 <p>Details about the error.</p>
 */
@interface AWSMarketplacecatalogErrorDetail : AWSModel


/**
 <p>The error code that identifies the type of error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>The message for the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

@end

/**
 <p>A filter object, used to optionally filter results from calls to the <code>ListEntities</code> and <code>ListChangeSets</code> actions.</p>
 */
@interface AWSMarketplacecatalogFilter : AWSModel


/**
 <p>For <code>ListEntities</code>, the supported value for this is an <code>EntityId</code>.</p><p>For <code>ListChangeSets</code>, the supported values are as follows:</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p><code>ListEntities</code> - This is a list of unique <code>EntityId</code>s.</p><p><code>ListChangeSets</code> - The supported filter names and associated <code>ValueList</code>s is as follows:</p><ul><li><p><code>ChangeSetName</code> - The supported <code>ValueList</code> is a list of non-unique <code>ChangeSetName</code>s. These are defined when you call the <code>StartChangeSet</code> action.</p></li><li><p><code>Status</code> - The supported <code>ValueList</code> is a list of statuses for all change set requests.</p></li><li><p><code>EntityId</code> - The supported <code>ValueList</code> is a list of unique <code>EntityId</code>s.</p></li><li><p><code>BeforeStartTime</code> - The supported <code>ValueList</code> is a list of all change sets that started before the filter value.</p></li><li><p><code>AfterStartTime</code> - The supported <code>ValueList</code> is a list of all change sets that started after the filter value.</p></li><li><p><code>BeforeEndTime</code> - The supported <code>ValueList</code> is a list of all change sets that ended before the filter value.</p></li><li><p><code>AfterEndTime</code> - The supported <code>ValueList</code> is a list of all change sets that ended after the filter value.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable valueList;

@end

/**
 
 */
@interface AWSMarketplacecatalogListChangeSetsRequest : AWSRequest


/**
 <p>The catalog related to the request. Fixed value: <code>AWSMarketplace</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable catalog;

/**
 <p>An array of filter objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSMarketplacecatalogFilter *> * _Nullable filterList;

/**
 <p>The maximum number of results returned by a single call. This value must be provided in the next call to retrieve the next set of results. By default, this value is 20.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token value retrieved from a previous call to access the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An object that contains two attributes, <code>SortBy</code> and <code>SortOrder</code>.</p>
 */
@property (nonatomic, strong) AWSMarketplacecatalogSort * _Nullable sort;

@end

/**
 
 */
@interface AWSMarketplacecatalogListChangeSetsResponse : AWSModel


/**
 <p> Array of <code>ChangeSetSummaryListItem</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSMarketplacecatalogChangeSetSummaryListItem *> * _Nullable changeSetSummaryList;

/**
 <p>The value of the next token, if it exists. Null if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSMarketplacecatalogListEntitiesRequest : AWSRequest


/**
 <p>The catalog related to the request. Fixed value: <code>AWSMarketplace</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable catalog;

/**
 <p>The type of entities to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityType;

/**
 <p>An array of filter objects. Each filter object contains two attributes, <code>filterName</code> and <code>filterValues</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSMarketplacecatalogFilter *> * _Nullable filterList;

/**
 <p>Specifies the upper limit of the elements on a single page. If a value isn't provided, the default value is 20.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The value of the next token, if it exists. Null if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An object that contains two attributes, <code>SortBy</code> and <code>SortOrder</code>.</p>
 */
@property (nonatomic, strong) AWSMarketplacecatalogSort * _Nullable sort;

@end

/**
 
 */
@interface AWSMarketplacecatalogListEntitiesResponse : AWSModel


/**
 <p> Array of <code>EntitySummary</code> object.</p>
 */
@property (nonatomic, strong) NSArray<AWSMarketplacecatalogEntitySummary *> * _Nullable entitySummaryList;

/**
 <p>The value of the next token if it exists. Null if there is no more result.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>An object that contains two attributes, <code>SortBy</code> and <code>SortOrder</code>.</p>
 */
@interface AWSMarketplacecatalogSort : AWSModel


/**
 <p>For <code>ListEntities</code>, supported attributes include <code>LastModifiedDate</code> (default), <code>Visibility</code>, <code>EntityId</code>, and <code>Name</code>.</p><p>For <code>ListChangeSets</code>, supported attributes include <code>StartTime</code> and <code>EndTime</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sortBy;

/**
 <p>The sorting order. Can be <code>ASCENDING</code> or <code>DESCENDING</code>. The default value is <code>DESCENDING</code>.</p>
 */
@property (nonatomic, assign) AWSMarketplacecatalogSortOrder sortOrder;

@end

/**
 
 */
@interface AWSMarketplacecatalogStartChangeSetRequest : AWSRequest


/**
 <p>The catalog related to the request. Fixed value: <code>AWSMarketplace</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable catalog;

/**
 <p>Array of <code>change</code> object.</p>
 */
@property (nonatomic, strong) NSArray<AWSMarketplacecatalogChange *> * _Nullable changeSet;

/**
 <p>Optional case sensitive string of up to 100 ASCII characters. The change set name can be used to filter the list of change sets. </p>
 */
@property (nonatomic, strong) NSString * _Nullable changeSetName;

/**
 <p>A unique token to identify the request to ensure idempotency.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

@end

/**
 
 */
@interface AWSMarketplacecatalogStartChangeSetResponse : AWSModel


/**
 <p>The ARN associated to the unique identifier generated for the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeSetArn;

/**
 <p>Unique identifier generated for the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeSetId;

@end

NS_ASSUME_NONNULL_END
