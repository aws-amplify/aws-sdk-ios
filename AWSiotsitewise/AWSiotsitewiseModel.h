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

FOUNDATION_EXPORT NSString *const AWSiotsitewiseErrorDomain;

typedef NS_ENUM(NSInteger, AWSiotsitewiseErrorType) {
    AWSiotsitewiseErrorUnknown,
    AWSiotsitewiseErrorConflictingOperation,
    AWSiotsitewiseErrorInternalFailure,
    AWSiotsitewiseErrorInvalidRequest,
    AWSiotsitewiseErrorLimitExceeded,
    AWSiotsitewiseErrorResourceAlreadyExists,
    AWSiotsitewiseErrorResourceNotFound,
    AWSiotsitewiseErrorServiceUnavailable,
    AWSiotsitewiseErrorThrottling,
    AWSiotsitewiseErrorTooManyTags,
};

typedef NS_ENUM(NSInteger, AWSiotsitewiseAggregateType) {
    AWSiotsitewiseAggregateTypeUnknown,
    AWSiotsitewiseAggregateTypeAverage,
    AWSiotsitewiseAggregateTypeCount,
    AWSiotsitewiseAggregateTypeMaximum,
    AWSiotsitewiseAggregateTypeMinimum,
    AWSiotsitewiseAggregateTypeSum,
};

typedef NS_ENUM(NSInteger, AWSiotsitewiseAssetErrorCode) {
    AWSiotsitewiseAssetErrorCodeUnknown,
    AWSiotsitewiseAssetErrorCodeInternalFailure,
};

typedef NS_ENUM(NSInteger, AWSiotsitewiseAssetModelState) {
    AWSiotsitewiseAssetModelStateUnknown,
    AWSiotsitewiseAssetModelStateCreating,
    AWSiotsitewiseAssetModelStateActive,
    AWSiotsitewiseAssetModelStateUpdating,
    AWSiotsitewiseAssetModelStatePropagating,
    AWSiotsitewiseAssetModelStateDeleting,
    AWSiotsitewiseAssetModelStateFailed,
};

typedef NS_ENUM(NSInteger, AWSiotsitewiseAssetState) {
    AWSiotsitewiseAssetStateUnknown,
    AWSiotsitewiseAssetStateCreating,
    AWSiotsitewiseAssetStateActive,
    AWSiotsitewiseAssetStateUpdating,
    AWSiotsitewiseAssetStateDeleting,
    AWSiotsitewiseAssetStateFailed,
};

typedef NS_ENUM(NSInteger, AWSiotsitewiseBatchPutAssetPropertyValueErrorCode) {
    AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeUnknown,
    AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeResourceNotFoundException,
    AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeInvalidRequestException,
    AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeInternalFailureException,
    AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeServiceUnavailableException,
    AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeThrottlingException,
    AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeLimitExceededException,
    AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeConflictingOperationException,
    AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeTimestampOutOfRangeException,
    AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeAccessDeniedException,
};

typedef NS_ENUM(NSInteger, AWSiotsitewiseCapabilitySyncStatus) {
    AWSiotsitewiseCapabilitySyncStatusUnknown,
    AWSiotsitewiseCapabilitySyncStatusInSync,
    AWSiotsitewiseCapabilitySyncStatusOutOfSync,
    AWSiotsitewiseCapabilitySyncStatusSyncFailed,
};

typedef NS_ENUM(NSInteger, AWSiotsitewiseErrorCode) {
    AWSiotsitewiseErrorCodeUnknown,
    AWSiotsitewiseErrorCodeValidationError,
    AWSiotsitewiseErrorCodeInternalFailure,
};

typedef NS_ENUM(NSInteger, AWSiotsitewiseIdentityType) {
    AWSiotsitewiseIdentityTypeUnknown,
    AWSiotsitewiseIdentityTypeUser,
    AWSiotsitewiseIdentityTypeGroup,
};

typedef NS_ENUM(NSInteger, AWSiotsitewiseImageFileType) {
    AWSiotsitewiseImageFileTypeUnknown,
    AWSiotsitewiseImageFileTypePng,
};

typedef NS_ENUM(NSInteger, AWSiotsitewiseListAssetsFilter) {
    AWSiotsitewiseListAssetsFilterUnknown,
    AWSiotsitewiseListAssetsFilterAll,
    AWSiotsitewiseListAssetsFilterTopLevel,
};

typedef NS_ENUM(NSInteger, AWSiotsitewiseLoggingLevel) {
    AWSiotsitewiseLoggingLevelUnknown,
    AWSiotsitewiseLoggingLevelError,
    AWSiotsitewiseLoggingLevelInfo,
    AWSiotsitewiseLoggingLevelOff,
};

typedef NS_ENUM(NSInteger, AWSiotsitewiseMonitorErrorCode) {
    AWSiotsitewiseMonitorErrorCodeUnknown,
    AWSiotsitewiseMonitorErrorCodeInternalFailure,
};

typedef NS_ENUM(NSInteger, AWSiotsitewisePermission) {
    AWSiotsitewisePermissionUnknown,
    AWSiotsitewisePermissionAdministrator,
    AWSiotsitewisePermissionViewer,
};

typedef NS_ENUM(NSInteger, AWSiotsitewisePortalState) {
    AWSiotsitewisePortalStateUnknown,
    AWSiotsitewisePortalStateCreating,
    AWSiotsitewisePortalStateUpdating,
    AWSiotsitewisePortalStateDeleting,
    AWSiotsitewisePortalStateActive,
    AWSiotsitewisePortalStateFailed,
};

typedef NS_ENUM(NSInteger, AWSiotsitewisePropertyDataType) {
    AWSiotsitewisePropertyDataTypeUnknown,
    AWSiotsitewisePropertyDataTypeString,
    AWSiotsitewisePropertyDataTypeInteger,
    AWSiotsitewisePropertyDataTypeDouble,
    AWSiotsitewisePropertyDataTypeBoolean,
};

typedef NS_ENUM(NSInteger, AWSiotsitewisePropertyNotificationState) {
    AWSiotsitewisePropertyNotificationStateUnknown,
    AWSiotsitewisePropertyNotificationStateEnabled,
    AWSiotsitewisePropertyNotificationStateDisabled,
};

typedef NS_ENUM(NSInteger, AWSiotsitewiseQuality) {
    AWSiotsitewiseQualityUnknown,
    AWSiotsitewiseQualityGood,
    AWSiotsitewiseQualityBad,
    AWSiotsitewiseQualityUncertain,
};

typedef NS_ENUM(NSInteger, AWSiotsitewiseResourceType) {
    AWSiotsitewiseResourceTypeUnknown,
    AWSiotsitewiseResourceTypePortal,
    AWSiotsitewiseResourceTypeProject,
};

typedef NS_ENUM(NSInteger, AWSiotsitewiseTimeOrdering) {
    AWSiotsitewiseTimeOrderingUnknown,
    AWSiotsitewiseTimeOrderingAscending,
    AWSiotsitewiseTimeOrderingDescending,
};

@class AWSiotsitewiseAccessPolicySummary;
@class AWSiotsitewiseAggregatedValue;
@class AWSiotsitewiseAggregates;
@class AWSiotsitewiseAssetErrorDetails;
@class AWSiotsitewiseAssetHierarchy;
@class AWSiotsitewiseAssetModelHierarchy;
@class AWSiotsitewiseAssetModelHierarchyDefinition;
@class AWSiotsitewiseAssetModelProperty;
@class AWSiotsitewiseAssetModelPropertyDefinition;
@class AWSiotsitewiseAssetModelStatus;
@class AWSiotsitewiseAssetModelSummary;
@class AWSiotsitewiseAssetProperty;
@class AWSiotsitewiseAssetPropertyValue;
@class AWSiotsitewiseAssetStatus;
@class AWSiotsitewiseAssetSummary;
@class AWSiotsitewiseAssociateAssetsRequest;
@class AWSiotsitewiseAssociatedAssetsSummary;
@class AWSiotsitewiseAttribute;
@class AWSiotsitewiseBatchAssociateProjectAssetsRequest;
@class AWSiotsitewiseBatchAssociateProjectAssetsResponse;
@class AWSiotsitewiseBatchDisassociateProjectAssetsRequest;
@class AWSiotsitewiseBatchDisassociateProjectAssetsResponse;
@class AWSiotsitewiseBatchPutAssetPropertyError;
@class AWSiotsitewiseBatchPutAssetPropertyErrorEntry;
@class AWSiotsitewiseBatchPutAssetPropertyValueRequest;
@class AWSiotsitewiseBatchPutAssetPropertyValueResponse;
@class AWSiotsitewiseCreateAccessPolicyRequest;
@class AWSiotsitewiseCreateAccessPolicyResponse;
@class AWSiotsitewiseCreateAssetModelRequest;
@class AWSiotsitewiseCreateAssetModelResponse;
@class AWSiotsitewiseCreateAssetRequest;
@class AWSiotsitewiseCreateAssetResponse;
@class AWSiotsitewiseCreateDashboardRequest;
@class AWSiotsitewiseCreateDashboardResponse;
@class AWSiotsitewiseCreateGatewayRequest;
@class AWSiotsitewiseCreateGatewayResponse;
@class AWSiotsitewiseCreatePortalRequest;
@class AWSiotsitewiseCreatePortalResponse;
@class AWSiotsitewiseCreateProjectRequest;
@class AWSiotsitewiseCreateProjectResponse;
@class AWSiotsitewiseDashboardSummary;
@class AWSiotsitewiseDeleteAccessPolicyRequest;
@class AWSiotsitewiseDeleteAccessPolicyResponse;
@class AWSiotsitewiseDeleteAssetModelRequest;
@class AWSiotsitewiseDeleteAssetModelResponse;
@class AWSiotsitewiseDeleteAssetRequest;
@class AWSiotsitewiseDeleteAssetResponse;
@class AWSiotsitewiseDeleteDashboardRequest;
@class AWSiotsitewiseDeleteDashboardResponse;
@class AWSiotsitewiseDeleteGatewayRequest;
@class AWSiotsitewiseDeletePortalRequest;
@class AWSiotsitewiseDeletePortalResponse;
@class AWSiotsitewiseDeleteProjectRequest;
@class AWSiotsitewiseDeleteProjectResponse;
@class AWSiotsitewiseDescribeAccessPolicyRequest;
@class AWSiotsitewiseDescribeAccessPolicyResponse;
@class AWSiotsitewiseDescribeAssetModelRequest;
@class AWSiotsitewiseDescribeAssetModelResponse;
@class AWSiotsitewiseDescribeAssetPropertyRequest;
@class AWSiotsitewiseDescribeAssetPropertyResponse;
@class AWSiotsitewiseDescribeAssetRequest;
@class AWSiotsitewiseDescribeAssetResponse;
@class AWSiotsitewiseDescribeDashboardRequest;
@class AWSiotsitewiseDescribeDashboardResponse;
@class AWSiotsitewiseDescribeGatewayCapabilityConfigurationRequest;
@class AWSiotsitewiseDescribeGatewayCapabilityConfigurationResponse;
@class AWSiotsitewiseDescribeGatewayRequest;
@class AWSiotsitewiseDescribeGatewayResponse;
@class AWSiotsitewiseDescribeLoggingOptionsRequest;
@class AWSiotsitewiseDescribeLoggingOptionsResponse;
@class AWSiotsitewiseDescribePortalRequest;
@class AWSiotsitewiseDescribePortalResponse;
@class AWSiotsitewiseDescribeProjectRequest;
@class AWSiotsitewiseDescribeProjectResponse;
@class AWSiotsitewiseDisassociateAssetsRequest;
@class AWSiotsitewiseErrorDetails;
@class AWSiotsitewiseExpressionVariable;
@class AWSiotsitewiseGatewayCapabilitySummary;
@class AWSiotsitewiseGatewayPlatform;
@class AWSiotsitewiseGatewaySummary;
@class AWSiotsitewiseGetAssetPropertyAggregatesRequest;
@class AWSiotsitewiseGetAssetPropertyAggregatesResponse;
@class AWSiotsitewiseGetAssetPropertyValueHistoryRequest;
@class AWSiotsitewiseGetAssetPropertyValueHistoryResponse;
@class AWSiotsitewiseGetAssetPropertyValueRequest;
@class AWSiotsitewiseGetAssetPropertyValueResponse;
@class AWSiotsitewiseGreengrass;
@class AWSiotsitewiseGroupIdentity;
@class AWSiotsitewiseIdentity;
@class AWSiotsitewiseImage;
@class AWSiotsitewiseImageFile;
@class AWSiotsitewiseListAccessPoliciesRequest;
@class AWSiotsitewiseListAccessPoliciesResponse;
@class AWSiotsitewiseListAssetModelsRequest;
@class AWSiotsitewiseListAssetModelsResponse;
@class AWSiotsitewiseListAssetsRequest;
@class AWSiotsitewiseListAssetsResponse;
@class AWSiotsitewiseListAssociatedAssetsRequest;
@class AWSiotsitewiseListAssociatedAssetsResponse;
@class AWSiotsitewiseListDashboardsRequest;
@class AWSiotsitewiseListDashboardsResponse;
@class AWSiotsitewiseListGatewaysRequest;
@class AWSiotsitewiseListGatewaysResponse;
@class AWSiotsitewiseListPortalsRequest;
@class AWSiotsitewiseListPortalsResponse;
@class AWSiotsitewiseListProjectAssetsRequest;
@class AWSiotsitewiseListProjectAssetsResponse;
@class AWSiotsitewiseListProjectsRequest;
@class AWSiotsitewiseListProjectsResponse;
@class AWSiotsitewiseListTagsForResourceRequest;
@class AWSiotsitewiseListTagsForResourceResponse;
@class AWSiotsitewiseLoggingOptions;
@class AWSiotsitewiseMeasurement;
@class AWSiotsitewiseMetric;
@class AWSiotsitewiseMetricWindow;
@class AWSiotsitewiseMonitorErrorDetails;
@class AWSiotsitewisePortalResource;
@class AWSiotsitewisePortalStatus;
@class AWSiotsitewisePortalSummary;
@class AWSiotsitewiseProjectResource;
@class AWSiotsitewiseProjectSummary;
@class AWSiotsitewiseProperty;
@class AWSiotsitewisePropertyNotification;
@class AWSiotsitewisePropertyType;
@class AWSiotsitewisePutAssetPropertyValueEntry;
@class AWSiotsitewisePutLoggingOptionsRequest;
@class AWSiotsitewisePutLoggingOptionsResponse;
@class AWSiotsitewiseResource;
@class AWSiotsitewiseTagResourceRequest;
@class AWSiotsitewiseTagResourceResponse;
@class AWSiotsitewiseTimeInNanos;
@class AWSiotsitewiseTransform;
@class AWSiotsitewiseTumblingWindow;
@class AWSiotsitewiseUntagResourceRequest;
@class AWSiotsitewiseUntagResourceResponse;
@class AWSiotsitewiseUpdateAccessPolicyRequest;
@class AWSiotsitewiseUpdateAccessPolicyResponse;
@class AWSiotsitewiseUpdateAssetModelRequest;
@class AWSiotsitewiseUpdateAssetModelResponse;
@class AWSiotsitewiseUpdateAssetPropertyRequest;
@class AWSiotsitewiseUpdateAssetRequest;
@class AWSiotsitewiseUpdateAssetResponse;
@class AWSiotsitewiseUpdateDashboardRequest;
@class AWSiotsitewiseUpdateDashboardResponse;
@class AWSiotsitewiseUpdateGatewayCapabilityConfigurationRequest;
@class AWSiotsitewiseUpdateGatewayCapabilityConfigurationResponse;
@class AWSiotsitewiseUpdateGatewayRequest;
@class AWSiotsitewiseUpdatePortalRequest;
@class AWSiotsitewiseUpdatePortalResponse;
@class AWSiotsitewiseUpdateProjectRequest;
@class AWSiotsitewiseUpdateProjectResponse;
@class AWSiotsitewiseUserIdentity;
@class AWSiotsitewiseVariableValue;
@class AWSiotsitewiseVariant;

/**
 <p>Contains an access policy that defines an AWS SSO identity's access to an AWS IoT SiteWise Monitor resource.</p>
 Required parameters: [id, identity, resource, permission]
 */
@interface AWSiotsitewiseAccessPolicySummary : AWSModel


/**
 <p>The date the access policy was created, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The ID of the access policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The AWS SSO identity (a user or group).</p>
 */
@property (nonatomic, strong) AWSiotsitewiseIdentity * _Nullable identity;

/**
 <p>The date the access policy was last updated, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateDate;

/**
 <p>The permissions for the access policy. Note that a project <code>ADMINISTRATOR</code> is also known as a project owner.</p>
 */
@property (nonatomic, assign) AWSiotsitewisePermission permission;

/**
 <p>The AWS IoT SiteWise Monitor resource (a portal or project).</p>
 */
@property (nonatomic, strong) AWSiotsitewiseResource * _Nullable resource;

@end

/**
 <p>Contains aggregated asset property values (for example, average, minimum, and maximum).</p>
 Required parameters: [timestamp, value]
 */
@interface AWSiotsitewiseAggregatedValue : AWSModel


/**
 <p>The quality of the aggregated data.</p>
 */
@property (nonatomic, assign) AWSiotsitewiseQuality quality;

/**
 <p>The date the aggregating computations occurred, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

/**
 <p>The value of the aggregates.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseAggregates * _Nullable value;

@end

/**
 <p>Contains the (pre-calculated) aggregate values for an asset property.</p>
 */
@interface AWSiotsitewiseAggregates : AWSModel


/**
 <p>The average (mean) value of the time series for the last time interval window.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable average;

/**
 <p>The count of data points in the time series for the last time interval window.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 <p>The maximum value of the time series for the last time interval window.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximum;

/**
 <p>The minimum value of the time series for the last time interval window.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minimum;

/**
 <p>The sum of the time series for the last time interval window.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sum;

@end

/**
 <p>Contains error details for the requested associate project asset action.</p>
 Required parameters: [assetId, code, message]
 */
@interface AWSiotsitewiseAssetErrorDetails : AWSModel


/**
 <p>The ID of the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>The error code.</p>
 */
@property (nonatomic, assign) AWSiotsitewiseAssetErrorCode code;

/**
 <p>The error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Describes an asset hierarchy that contains a hierarchy's name and ID.</p>
 Required parameters: [name]
 */
@interface AWSiotsitewiseAssetHierarchy : AWSModel


/**
 <p>The ID of the hierarchy. This ID is a <code>hierarchyId</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The hierarchy name provided in the <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_CreateAssetModel.html">CreateAssetModel</a> or <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetModel.html">UpdateAssetModel</a> API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Describes an asset hierarchy that contains a hierarchy's name, ID, and child asset model ID that specifies the type of asset that can be in this hierarchy.</p>
 Required parameters: [name, childAssetModelId]
 */
@interface AWSiotsitewiseAssetModelHierarchy : AWSModel


/**
 <p>The ID of the asset model. All assets in this hierarchy must be instances of the <code>childAssetModelId</code> asset model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable childAssetModelId;

/**
 <p>The ID of the asset model hierarchy. This ID is a <code>hierarchyId</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the asset model hierarchy that you specify by using the <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_CreateAssetModel.html">CreateAssetModel</a> or <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetModel.html">UpdateAssetModel</a> API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Contains an asset model hierarchy used in asset model creation. An asset model hierarchy determines the kind (or type) of asset that can belong to a hierarchy.</p>
 Required parameters: [name, childAssetModelId]
 */
@interface AWSiotsitewiseAssetModelHierarchyDefinition : AWSModel


/**
 <p>The ID of an asset model for this hierarchy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable childAssetModelId;

/**
 <p>The name of the asset model hierarchy definition (as specified in <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_CreateAssetModel.html">CreateAssetModel</a> or <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetModel.html">UpdateAssetModel</a>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Contains information about an asset model property.</p>
 Required parameters: [name, dataType, type]
 */
@interface AWSiotsitewiseAssetModelProperty : AWSModel


/**
 <p>The data type of the asset model property.</p>
 */
@property (nonatomic, assign) AWSiotsitewisePropertyDataType dataType;

/**
 <p>The ID of the asset model property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the asset model property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The property type (see <code>PropertyType</code>).</p>
 */
@property (nonatomic, strong) AWSiotsitewisePropertyType * _Nullable types;

/**
 <p>The unit of the asset model property, such as <code>Newtons</code> or <code>RPM</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable unit;

@end

/**
 <p>Contains an asset model property definition. This property definition is applied to all assets created from the asset model.</p>
 Required parameters: [name, dataType, type]
 */
@interface AWSiotsitewiseAssetModelPropertyDefinition : AWSModel


/**
 <p>The data type of the property definition.</p>
 */
@property (nonatomic, assign) AWSiotsitewisePropertyDataType dataType;

/**
 <p>The name of the property definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The property definition type (see <code>PropertyType</code>). You can only specify one type in a property definition.</p>
 */
@property (nonatomic, strong) AWSiotsitewisePropertyType * _Nullable types;

/**
 <p>The unit of the property definition, such as <code>Newtons</code> or <code>RPM</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable unit;

@end

/**
 <p>Contains current status information for an asset model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-and-model-states.html">Asset and Model States</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 Required parameters: [state]
 */
@interface AWSiotsitewiseAssetModelStatus : AWSModel


/**
 <p>Contains associated error information, if any.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseErrorDetails * _Nullable error;

/**
 <p>The current state of the asset model.</p>
 */
@property (nonatomic, assign) AWSiotsitewiseAssetModelState state;

@end

/**
 <p>Contains a summary of an asset model.</p>
 Required parameters: [id, arn, name, description, creationDate, lastUpdateDate, status]
 */
@interface AWSiotsitewiseAssetModelSummary : AWSModel


/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the asset model, which has the following format.</p><p><code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset-model/${AssetModelId}</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date the asset model was created, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The asset model description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID of the asset model (used with AWS IoT SiteWise APIs).</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The date the asset model was last updated, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateDate;

/**
 <p>The name of the asset model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The current status of the asset model.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseAssetModelStatus * _Nullable status;

@end

/**
 <p>Contains asset property information.</p>
 Required parameters: [id, name, dataType]
 */
@interface AWSiotsitewiseAssetProperty : AWSModel


/**
 <p>The property alias that identifies the property, such as an OPC-UA server data stream path (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping Industrial Data Streams to Asset Properties</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alias;

/**
 <p>The data type of the asset property.</p>
 */
@property (nonatomic, assign) AWSiotsitewisePropertyDataType dataType;

/**
 <p>The ID of the asset property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The asset property's notification topic and state. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a></p>
 */
@property (nonatomic, strong) AWSiotsitewisePropertyNotification * _Nullable notification;

/**
 <p>The unit (such as <code>Newtons</code> or <code>RPM</code>) of the asset property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable unit;

@end

/**
 <p>Contains asset property value information.</p>
 Required parameters: [value, timestamp]
 */
@interface AWSiotsitewiseAssetPropertyValue : AWSModel


/**
 <p>The quality of the asset property value.</p>
 */
@property (nonatomic, assign) AWSiotsitewiseQuality quality;

/**
 <p>The timestamp of the asset property value.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseTimeInNanos * _Nullable timestamp;

/**
 <p>The value of the asset property (see <code>Variant</code>).</p>
 */
@property (nonatomic, strong) AWSiotsitewiseVariant * _Nullable value;

@end

/**
 <p>Contains information about the current status of an asset. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-and-model-states.html">Asset and Model States</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 Required parameters: [state]
 */
@interface AWSiotsitewiseAssetStatus : AWSModel


/**
 <p>Contains associated error information, if any.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseErrorDetails * _Nullable error;

/**
 <p>The current status of the asset.</p>
 */
@property (nonatomic, assign) AWSiotsitewiseAssetState state;

@end

/**
 <p>Contains a summary of an asset.</p>
 Required parameters: [id, arn, name, assetModelId, creationDate, lastUpdateDate, status, hierarchies]
 */
@interface AWSiotsitewiseAssetSummary : AWSModel


/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the asset, which has the following format.</p><p><code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset/${AssetId}</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The ID of the asset model used to create this asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelId;

/**
 <p>The date the asset was created, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>A list of asset hierarchies that each contain a <code>hierarchyId</code>. A hierarchy specifies allowed parent/child asset relationships.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseAssetHierarchy *> * _Nullable hierarchies;

/**
 <p>The ID of the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The date the asset was last updated, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateDate;

/**
 <p>The name of the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The current status of the asset.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseAssetStatus * _Nullable status;

@end

/**
 
 */
@interface AWSiotsitewiseAssociateAssetsRequest : AWSRequest


/**
 <p>The ID of the parent asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>The ID of the child asset to be associated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable childAssetId;

/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The ID of a hierarchy in the parent asset's model. Hierarchies allow different groupings of assets to be formed that all come from the same asset model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-hierarchies.html">Asset Hierarchies</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hierarchyId;

@end

/**
 <p>Contains a summary of an associated asset.</p>
 Required parameters: [id, arn, name, assetModelId, creationDate, lastUpdateDate, status, hierarchies]
 */
@interface AWSiotsitewiseAssociatedAssetsSummary : AWSModel


/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the asset, which has the following format.</p><p><code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset/${AssetId}</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The ID of the asset model used to create the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelId;

/**
 <p>The date the asset was created, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>A list of asset hierarchies that each contain a <code>hierarchyId</code>. A hierarchy specifies allowed parent/child asset relationships.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseAssetHierarchy *> * _Nullable hierarchies;

/**
 <p>The ID of the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The date the asset was last updated, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateDate;

/**
 <p>The name of the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The current status of the asset.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseAssetStatus * _Nullable status;

@end

/**
 <p>Contains an asset attribute property. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html#attributes">Attributes</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@interface AWSiotsitewiseAttribute : AWSModel


/**
 <p>The default value of the asset model property attribute. All assets that you create from the asset model contain this attribute value. You can update an attribute's value after you create an asset. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/update-attribute-values.html">Updating Attribute Values</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultValue;

@end

/**
 
 */
@interface AWSiotsitewiseBatchAssociateProjectAssetsRequest : AWSRequest


/**
 <p>The IDs of the assets to be associated to the project.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable assetIds;

/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The ID of the project to which to associate the assets.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectId;

@end

/**
 
 */
@interface AWSiotsitewiseBatchAssociateProjectAssetsResponse : AWSModel


/**
 <p>A list of associated error information, if any.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseAssetErrorDetails *> * _Nullable errors;

@end

/**
 
 */
@interface AWSiotsitewiseBatchDisassociateProjectAssetsRequest : AWSRequest


/**
 <p>The IDs of the assets to be disassociated from the project.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable assetIds;

/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The ID of the project from which to disassociate the assets.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectId;

@end

/**
 
 */
@interface AWSiotsitewiseBatchDisassociateProjectAssetsResponse : AWSModel


/**
 <p>A list of associated error information, if any.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseAssetErrorDetails *> * _Nullable errors;

@end

/**
 <p>Contains error information from updating a batch of asset property values.</p>
 Required parameters: [errorCode, errorMessage, timestamps]
 */
@interface AWSiotsitewiseBatchPutAssetPropertyError : AWSModel


/**
 <p>The error code.</p>
 */
@property (nonatomic, assign) AWSiotsitewiseBatchPutAssetPropertyValueErrorCode errorCode;

/**
 <p>The associated error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>A list of timestamps for each error, if any.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseTimeInNanos *> * _Nullable timestamps;

@end

/**
 <p>Contains error information for asset property value entries that are associated with the <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchPutAssetPropertyValue.html">BatchPutAssetPropertyValue</a> API.</p>
 Required parameters: [entryId, errors]
 */
@interface AWSiotsitewiseBatchPutAssetPropertyErrorEntry : AWSModel


/**
 <p>The ID of the failed entry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entryId;

/**
 <p>The list of update property value errors.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseBatchPutAssetPropertyError *> * _Nullable errors;

@end

/**
 
 */
@interface AWSiotsitewiseBatchPutAssetPropertyValueRequest : AWSRequest


/**
 <p>The list of asset property value entries for the batch put request. You can specify up to 10 entries per request. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewisePutAssetPropertyValueEntry *> * _Nullable entries;

@end

/**
 
 */
@interface AWSiotsitewiseBatchPutAssetPropertyValueResponse : AWSModel


/**
 <p>A list of the errors (if any) associated with the batch put request. Each error entry contains the <code>entryId</code> of the entry that failed.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseBatchPutAssetPropertyErrorEntry *> * _Nullable errorEntries;

@end

/**
 
 */
@interface AWSiotsitewiseCreateAccessPolicyRequest : AWSRequest


/**
 <p>The identity for this access policy. Choose either a <code>user</code> or a <code>group</code> but not both.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseIdentity * _Nullable accessPolicyIdentity;

/**
 <p>The permission level for this access policy. Note that a project <code>ADMINISTRATOR</code> is also known as a project owner.</p>
 */
@property (nonatomic, assign) AWSiotsitewisePermission accessPolicyPermission;

/**
 <p>The AWS IoT SiteWise Monitor resource for this access policy. Choose either <code>portal</code> or <code>project</code> but not both.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseResource * _Nullable accessPolicyResource;

/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>A list of key-value pairs that contain metadata for the access policy. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSiotsitewiseCreateAccessPolicyResponse : AWSModel


/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the access policy, which has the following format.</p><p><code>arn:${Partition}:iotsitewise:${Region}:${Account}:access-policy/${AccessPolicyId}</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable accessPolicyArn;

/**
 <p>The ID of the access policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessPolicyId;

@end

/**
 
 */
@interface AWSiotsitewiseCreateAssetModelRequest : AWSRequest


/**
 <p>A description for the asset model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelDescription;

/**
 <p>The hierarchy definitions of the asset model. Each hierarchy specifies an asset model whose assets can be children of any other assets created from this asset model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-hierarchies.html">Asset Hierarchies</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>You can specify up to 10 hierarchies per asset model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseAssetModelHierarchyDefinition *> * _Nullable assetModelHierarchies;

/**
 <p>A unique, friendly name for the asset model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelName;

/**
 <p>The property definitions of the asset model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html">Asset Properties</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>You can specify up to 200 properties per asset model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseAssetModelPropertyDefinition *> * _Nullable assetModelProperties;

/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>A list of key-value pairs that contain metadata for the asset model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSiotsitewiseCreateAssetModelResponse : AWSModel


/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the asset model, which has the following format.</p><p><code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset-model/${AssetModelId}</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelArn;

/**
 <p>The ID of the asset model. You can use this ID when you call other AWS IoT SiteWise APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelId;

/**
 <p>The status of the asset model, which contains a state (<code>CREATING</code> after successfully calling this action) and any error message.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseAssetModelStatus * _Nullable assetModelStatus;

@end

/**
 
 */
@interface AWSiotsitewiseCreateAssetRequest : AWSRequest


/**
 <p>The ID of the asset model from which to create the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelId;

/**
 <p>A unique, friendly name for the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetName;

/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>A list of key-value pairs that contain metadata for the asset. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSiotsitewiseCreateAssetResponse : AWSModel


/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the asset, which has the following format.</p><p><code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset/${AssetId}</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable assetArn;

/**
 <p>The ID of the asset. This ID uniquely identifies the asset within AWS IoT SiteWise and can be used with other AWS IoT SiteWise APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>The status of the asset, which contains a state (<code>CREATING</code> after successfully calling this action) and any error message.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseAssetStatus * _Nullable assetStatus;

@end

/**
 
 */
@interface AWSiotsitewiseCreateDashboardRequest : AWSRequest


/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The dashboard definition specified in a JSON literal. For detailed information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/create-dashboards-using-aws-cli.html">Creating Dashboards (CLI)</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardDefinition;

/**
 <p>A description for the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardDescription;

/**
 <p>A friendly name for the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardName;

/**
 <p>The ID of the project in which to create the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectId;

/**
 <p>A list of key-value pairs that contain metadata for the dashboard. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSiotsitewiseCreateDashboardResponse : AWSModel


/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the dashboard, which has the following format.</p><p><code>arn:${Partition}:iotsitewise:${Region}:${Account}:dashboard/${DashboardId}</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardArn;

/**
 <p>The ID of the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardId;

@end

/**
 
 */
@interface AWSiotsitewiseCreateGatewayRequest : AWSRequest


/**
 <p>A unique, friendly name for the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayName;

/**
 <p>The gateway's platform. You can only specify one platform in a gateway.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseGatewayPlatform * _Nullable gatewayPlatform;

/**
 <p>A list of key-value pairs that contain metadata for the gateway. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSiotsitewiseCreateGatewayResponse : AWSModel


/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the gateway, which has the following format.</p><p><code>arn:${Partition}:iotsitewise:${Region}:${Account}:gateway/${GatewayId}</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayArn;

/**
 <p>The ID of the gateway device. You can use this ID when you call other AWS IoT SiteWise APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayId;

@end

/**
 
 */
@interface AWSiotsitewiseCreatePortalRequest : AWSRequest


/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The AWS administrator's contact email address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portalContactEmail;

/**
 <p>A description for the portal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portalDescription;

/**
 <p>A logo image to display in the portal. Upload a square, high-resolution image. The image is displayed on a dark background.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseImageFile * _Nullable portalLogoImageFile;

/**
 <p>A friendly name for the portal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portalName;

/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of a service role that allows the portal's users to access your AWS IoT SiteWise resources on your behalf. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-service-role.html">Using service roles for AWS IoT SiteWise Monitor</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>A list of key-value pairs that contain metadata for the portal. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSiotsitewiseCreatePortalResponse : AWSModel


/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the portal, which has the following format.</p><p><code>arn:${Partition}:iotsitewise:${Region}:${Account}:portal/${PortalId}</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable portalArn;

/**
 <p>The ID of the created portal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portalId;

/**
 <p>The public URL for the AWS IoT SiteWise Monitor portal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portalStartUrl;

/**
 <p>The status of the portal, which contains a state (<code>CREATING</code> after successfully calling this action) and any error message.</p>
 */
@property (nonatomic, strong) AWSiotsitewisePortalStatus * _Nullable portalStatus;

/**
 <p>The associated AWS SSO application Id.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ssoApplicationId;

@end

/**
 
 */
@interface AWSiotsitewiseCreateProjectRequest : AWSRequest


/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The ID of the portal in which to create the project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portalId;

/**
 <p>A description for the project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectDescription;

/**
 <p>A friendly name for the project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectName;

/**
 <p>A list of key-value pairs that contain metadata for the project. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSiotsitewiseCreateProjectResponse : AWSModel


/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the project, which has the following format.</p><p><code>arn:${Partition}:iotsitewise:${Region}:${Account}:project/${ProjectId}</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable projectArn;

/**
 <p>The ID of the project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectId;

@end

/**
 <p>Contains a dashboard summary.</p>
 Required parameters: [id, name]
 */
@interface AWSiotsitewiseDashboardSummary : AWSModel


/**
 <p>The date the dashboard was created, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The dashboard's description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID of the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The date the dashboard was last updated, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateDate;

/**
 <p>The name of the dashboard</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSiotsitewiseDeleteAccessPolicyRequest : AWSRequest


/**
 <p>The ID of the access policy to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessPolicyId;

/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

@end

/**
 
 */
@interface AWSiotsitewiseDeleteAccessPolicyResponse : AWSModel


@end

/**
 
 */
@interface AWSiotsitewiseDeleteAssetModelRequest : AWSRequest


/**
 <p>The ID of the asset model to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelId;

/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

@end

/**
 
 */
@interface AWSiotsitewiseDeleteAssetModelResponse : AWSModel


/**
 <p>The status of the asset model, which contains a state (<code>DELETING</code> after successfully calling this action) and any error message.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseAssetModelStatus * _Nullable assetModelStatus;

@end

/**
 
 */
@interface AWSiotsitewiseDeleteAssetRequest : AWSRequest


/**
 <p>The ID of the asset to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

@end

/**
 
 */
@interface AWSiotsitewiseDeleteAssetResponse : AWSModel


/**
 <p>The status of the asset, which contains a state (<code>DELETING</code> after successfully calling this action) and any error message.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseAssetStatus * _Nullable assetStatus;

@end

/**
 
 */
@interface AWSiotsitewiseDeleteDashboardRequest : AWSRequest


/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The ID of the dashboard to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardId;

@end

/**
 
 */
@interface AWSiotsitewiseDeleteDashboardResponse : AWSModel


@end

/**
 
 */
@interface AWSiotsitewiseDeleteGatewayRequest : AWSRequest


/**
 <p>The ID of the gateway to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayId;

@end

/**
 
 */
@interface AWSiotsitewiseDeletePortalRequest : AWSRequest


/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The ID of the portal to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portalId;

@end

/**
 
 */
@interface AWSiotsitewiseDeletePortalResponse : AWSModel


/**
 <p>The status of the portal, which contains a state (<code>DELETING</code> after successfully calling this action) and any error message.</p>
 */
@property (nonatomic, strong) AWSiotsitewisePortalStatus * _Nullable portalStatus;

@end

/**
 
 */
@interface AWSiotsitewiseDeleteProjectRequest : AWSRequest


/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The ID of the project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectId;

@end

/**
 
 */
@interface AWSiotsitewiseDeleteProjectResponse : AWSModel


@end

/**
 
 */
@interface AWSiotsitewiseDescribeAccessPolicyRequest : AWSRequest


/**
 <p>The ID of the access policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessPolicyId;

@end

/**
 
 */
@interface AWSiotsitewiseDescribeAccessPolicyResponse : AWSModel


/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the access policy, which has the following format.</p><p><code>arn:${Partition}:iotsitewise:${Region}:${Account}:access-policy/${AccessPolicyId}</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable accessPolicyArn;

/**
 <p>The date the access policy was created, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable accessPolicyCreationDate;

/**
 <p>The ID of the access policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessPolicyId;

/**
 <p>The AWS SSO identity (user or group) to which this access policy applies.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseIdentity * _Nullable accessPolicyIdentity;

/**
 <p>The date the access policy was last updated, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable accessPolicyLastUpdateDate;

/**
 <p>The access policy permission. Note that a project <code>ADMINISTRATOR</code> is also known as a project owner.</p>
 */
@property (nonatomic, assign) AWSiotsitewisePermission accessPolicyPermission;

/**
 <p>The AWS IoT SiteWise Monitor resource (portal or project) to which this access policy provides access.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseResource * _Nullable accessPolicyResource;

@end

/**
 
 */
@interface AWSiotsitewiseDescribeAssetModelRequest : AWSRequest


/**
 <p>The ID of the asset model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelId;

@end

/**
 
 */
@interface AWSiotsitewiseDescribeAssetModelResponse : AWSModel


/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the asset model, which has the following format.</p><p><code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset-model/${AssetModelId}</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelArn;

/**
 <p>The date the asset model was created, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable assetModelCreationDate;

/**
 <p>The asset model's description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelDescription;

/**
 <p>A list of asset model hierarchies that each contain a <code>childAssetModelId</code> and a <code>hierarchyId</code> (named <code>id</code>). A hierarchy specifies allowed parent/child asset relationships for an asset model.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseAssetModelHierarchy *> * _Nullable assetModelHierarchies;

/**
 <p>The ID of the asset model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelId;

/**
 <p>The date the asset model was last updated, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable assetModelLastUpdateDate;

/**
 <p>The name of the asset model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelName;

/**
 <p>The list of asset properties for the asset model.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseAssetModelProperty *> * _Nullable assetModelProperties;

/**
 <p>The current status of the asset model, which contains a state and any error message.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseAssetModelStatus * _Nullable assetModelStatus;

@end

/**
 
 */
@interface AWSiotsitewiseDescribeAssetPropertyRequest : AWSRequest


/**
 <p>The ID of the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>The ID of the asset property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable propertyId;

@end

/**
 
 */
@interface AWSiotsitewiseDescribeAssetPropertyResponse : AWSModel


/**
 <p>The ID of the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>The ID of the asset model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelId;

/**
 <p>The name of the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetName;

/**
 <p>The asset property's definition, alias, and notification state.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseProperty * _Nullable assetProperty;

@end

/**
 
 */
@interface AWSiotsitewiseDescribeAssetRequest : AWSRequest


/**
 <p>The ID of the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

@end

/**
 
 */
@interface AWSiotsitewiseDescribeAssetResponse : AWSModel


/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the asset, which has the following format.</p><p><code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset/${AssetId}</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable assetArn;

/**
 <p>The date the asset was created, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable assetCreationDate;

/**
 <p>A list of asset hierarchies that each contain a <code>hierarchyId</code>. A hierarchy specifies allowed parent/child asset relationships.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseAssetHierarchy *> * _Nullable assetHierarchies;

/**
 <p>The ID of the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>The date the asset was last updated, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable assetLastUpdateDate;

/**
 <p>The ID of the asset model that was used to create the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelId;

/**
 <p>The name of the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetName;

/**
 <p>The list of asset properties for the asset.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseAssetProperty *> * _Nullable assetProperties;

/**
 <p>The current status of the asset, which contains a state and any error message.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseAssetStatus * _Nullable assetStatus;

@end

/**
 
 */
@interface AWSiotsitewiseDescribeDashboardRequest : AWSRequest


/**
 <p>The ID of the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardId;

@end

/**
 
 */
@interface AWSiotsitewiseDescribeDashboardResponse : AWSModel


/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the dashboard, which has the following format.</p><p><code>arn:${Partition}:iotsitewise:${Region}:${Account}:dashboard/${DashboardId}</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardArn;

/**
 <p>The date the dashboard was created, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable dashboardCreationDate;

/**
 <p>The dashboard's definition JSON literal. For detailed information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/create-dashboards-using-aws-cli.html">Creating Dashboards (CLI)</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardDefinition;

/**
 <p>The dashboard's description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardDescription;

/**
 <p>The ID of the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardId;

/**
 <p>The date the dashboard was last updated, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable dashboardLastUpdateDate;

/**
 <p>The name of the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardName;

/**
 <p>The ID of the project that the dashboard is in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectId;

@end

/**
 
 */
@interface AWSiotsitewiseDescribeGatewayCapabilityConfigurationRequest : AWSRequest


/**
 <p>The namespace of the capability configuration. For example, if you configure OPC-UA sources from the AWS IoT SiteWise console, your OPC-UA capability configuration has the namespace <code>iotsitewise:opcuacollector:version</code>, where <code>version</code> is a number such as <code>1</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable capabilityNamespace;

/**
 <p>The ID of the gateway that defines the capability configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayId;

@end

/**
 
 */
@interface AWSiotsitewiseDescribeGatewayCapabilityConfigurationResponse : AWSModel


/**
 <p>The JSON document that defines the gateway capability's configuration. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/configure-sources.html#configure-source-cli">Configuring data sources (CLI)</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable capabilityConfiguration;

/**
 <p>The namespace of the gateway capability.</p>
 */
@property (nonatomic, strong) NSString * _Nullable capabilityNamespace;

/**
 <p>The synchronization status of the capability configuration. The sync status can be one of the following:</p><ul><li><p><code>IN_SYNC</code> – The gateway is running the capability configuration.</p></li><li><p><code>OUT_OF_SYNC</code> – The gateway hasn't received the capability configuration.</p></li><li><p><code>SYNC_FAILED</code> – The gateway rejected the capability configuration.</p></li></ul>
 */
@property (nonatomic, assign) AWSiotsitewiseCapabilitySyncStatus capabilitySyncStatus;

/**
 <p>The ID of the gateway that defines the capability configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayId;

@end

/**
 
 */
@interface AWSiotsitewiseDescribeGatewayRequest : AWSRequest


/**
 <p>The ID of the gateway device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayId;

@end

/**
 
 */
@interface AWSiotsitewiseDescribeGatewayResponse : AWSModel


/**
 <p>The date the gateway was created, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the gateway, which has the following format.</p><p><code>arn:${Partition}:iotsitewise:${Region}:${Account}:gateway/${GatewayId}</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayArn;

/**
 <p>A list of gateway capability summaries that each contain a namespace and status. Each gateway capability defines data sources for the gateway. To retrieve a capability configuration's definition, use <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeGatewayCapabilityConfiguration.html">DescribeGatewayCapabilityConfiguration</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseGatewayCapabilitySummary *> * _Nullable gatewayCapabilitySummaries;

/**
 <p>The ID of the gateway device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayId;

/**
 <p>The name of the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayName;

/**
 <p>The gateway's platform.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseGatewayPlatform * _Nullable gatewayPlatform;

/**
 <p>The date the gateway was last updated, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateDate;

@end

/**
 
 */
@interface AWSiotsitewiseDescribeLoggingOptionsRequest : AWSRequest


@end

/**
 
 */
@interface AWSiotsitewiseDescribeLoggingOptionsResponse : AWSModel


/**
 <p>The current logging options.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseLoggingOptions * _Nullable loggingOptions;

@end

/**
 
 */
@interface AWSiotsitewiseDescribePortalRequest : AWSRequest


/**
 <p>The ID of the portal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portalId;

@end

/**
 
 */
@interface AWSiotsitewiseDescribePortalResponse : AWSModel


/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the portal, which has the following format.</p><p><code>arn:${Partition}:iotsitewise:${Region}:${Account}:portal/${PortalId}</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable portalArn;

/**
 <p>The AWS SSO application generated client ID (used with AWS SSO APIs).</p>
 */
@property (nonatomic, strong) NSString * _Nullable portalClientId;

/**
 <p>The AWS administrator's contact email address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portalContactEmail;

/**
 <p>The date the portal was created, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable portalCreationDate;

/**
 <p>The portal's description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portalDescription;

/**
 <p>The ID of the portal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portalId;

/**
 <p>The date the portal was last updated, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable portalLastUpdateDate;

/**
 <p>The portal's logo image.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseImage * _Nullable portalLogoImage;

/**
 <p>The name of the portal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portalName;

/**
 <p>The public root URL for the AWS IoT AWS IoT SiteWise Monitor application portal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portalStartUrl;

/**
 <p>The current status of the portal, which contains a state and any error message.</p>
 */
@property (nonatomic, strong) AWSiotsitewisePortalStatus * _Nullable portalStatus;

/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the service role that allows the portal's users to access your AWS IoT SiteWise resources on your behalf. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-service-role.html">Using service roles for AWS IoT SiteWise Monitor</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSiotsitewiseDescribeProjectRequest : AWSRequest


/**
 <p>The ID of the project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectId;

@end

/**
 
 */
@interface AWSiotsitewiseDescribeProjectResponse : AWSModel


/**
 <p>The ID of the portal that the project is in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portalId;

/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the project, which has the following format.</p><p><code>arn:${Partition}:iotsitewise:${Region}:${Account}:project/${ProjectId}</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable projectArn;

/**
 <p>The date the project was created, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable projectCreationDate;

/**
 <p>The project's description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectDescription;

/**
 <p>The ID of the project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectId;

/**
 <p>The date the project was last updated, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable projectLastUpdateDate;

/**
 <p>The name of the project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectName;

@end

/**
 
 */
@interface AWSiotsitewiseDisassociateAssetsRequest : AWSRequest


/**
 <p>The ID of the parent asset from which to disassociate the child asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>The ID of the child asset to disassociate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable childAssetId;

/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The ID of a hierarchy in the parent asset's model. Hierarchies allow different groupings of assets to be formed that all come from the same asset model. You can use the hierarchy ID to identify the correct asset to disassociate. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-hierarchies.html">Asset Hierarchies</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hierarchyId;

@end

/**
 <p>Contains the details of an AWS IoT SiteWise error.</p>
 Required parameters: [code, message]
 */
@interface AWSiotsitewiseErrorDetails : AWSModel


/**
 <p>The error code.</p>
 */
@property (nonatomic, assign) AWSiotsitewiseErrorCode code;

/**
 <p>The error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Contains expression variable information.</p>
 Required parameters: [name, value]
 */
@interface AWSiotsitewiseExpressionVariable : AWSModel


/**
 <p>The friendly name of the variable to be used in the expression.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The variable that identifies an asset property from which to use values.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseVariableValue * _Nullable value;

@end

/**
 <p>Contains a summary of a gateway capability configuration.</p>
 Required parameters: [capabilityNamespace, capabilitySyncStatus]
 */
@interface AWSiotsitewiseGatewayCapabilitySummary : AWSModel


/**
 <p>The namespace of the capability configuration. For example, if you configure OPC-UA sources from the AWS IoT SiteWise console, your OPC-UA capability configuration has the namespace <code>iotsitewise:opcuacollector:version</code>, where <code>version</code> is a number such as <code>1</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable capabilityNamespace;

/**
 <p>The synchronization status of the capability configuration. The sync status can be one of the following:</p><ul><li><p><code>IN_SYNC</code> – The gateway is running the capability configuration.</p></li><li><p><code>OUT_OF_SYNC</code> – The gateway hasn't received the capability configuration.</p></li><li><p><code>SYNC_FAILED</code> – The gateway rejected the capability configuration.</p></li></ul>
 */
@property (nonatomic, assign) AWSiotsitewiseCapabilitySyncStatus capabilitySyncStatus;

@end

/**
 <p>Contains a gateway's platform information.</p>
 Required parameters: [greengrass]
 */
@interface AWSiotsitewiseGatewayPlatform : AWSModel


/**
 <p>A gateway that runs on AWS IoT Greengrass.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseGreengrass * _Nullable greengrass;

@end

/**
 <p>Contains a summary of a gateway.</p>
 Required parameters: [gatewayId, gatewayName, creationDate, lastUpdateDate]
 */
@interface AWSiotsitewiseGatewaySummary : AWSModel


/**
 <p>The date the gateway was created, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>A list of gateway capability summaries that each contain a namespace and status. Each gateway capability defines data sources for the gateway. To retrieve a capability configuration's definition, use <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeGatewayCapabilityConfiguration.html">DescribeGatewayCapabilityConfiguration</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseGatewayCapabilitySummary *> * _Nullable gatewayCapabilitySummaries;

/**
 <p>The ID of the gateway device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayId;

/**
 <p>The name of the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayName;

/**
 <p>The date the gateway was last updated, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateDate;

@end

/**
 
 */
@interface AWSiotsitewiseGetAssetPropertyAggregatesRequest : AWSRequest


/**
 <p>The data aggregating function.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable aggregateTypes;

/**
 <p>The ID of the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>The inclusive end of the range from which to query historical data, expressed in seconds in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endDate;

/**
 <p>The maximum number of results to be returned per paginated request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to be used for the next set of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The property alias that identifies the property, such as an OPC-UA server data stream path (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping Industrial Data Streams to Asset Properties</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable propertyAlias;

/**
 <p>The ID of the asset property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable propertyId;

/**
 <p>The quality by which to filter asset data.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable qualities;

/**
 <p>The time interval over which to aggregate data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resolution;

/**
 <p>The exclusive start of the range from which to query historical data, expressed in seconds in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startDate;

/**
 <p>The chronological sorting order of the requested information.</p>
 */
@property (nonatomic, assign) AWSiotsitewiseTimeOrdering timeOrdering;

@end

/**
 
 */
@interface AWSiotsitewiseGetAssetPropertyAggregatesResponse : AWSModel


/**
 <p>The requested aggregated values.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseAggregatedValue *> * _Nullable aggregatedValues;

/**
 <p>The token for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSiotsitewiseGetAssetPropertyValueHistoryRequest : AWSRequest


/**
 <p>The ID of the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>The inclusive end of the range from which to query historical data, expressed in seconds in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endDate;

/**
 <p>The maximum number of results to be returned per paginated request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to be used for the next set of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The property alias that identifies the property, such as an OPC-UA server data stream path (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping Industrial Data Streams to Asset Properties</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable propertyAlias;

/**
 <p>The ID of the asset property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable propertyId;

/**
 <p>The quality by which to filter asset data.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable qualities;

/**
 <p>The exclusive start of the range from which to query historical data, expressed in seconds in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startDate;

/**
 <p>The chronological sorting order of the requested information.</p>
 */
@property (nonatomic, assign) AWSiotsitewiseTimeOrdering timeOrdering;

@end

/**
 
 */
@interface AWSiotsitewiseGetAssetPropertyValueHistoryResponse : AWSModel


/**
 <p>The asset property's value history.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseAssetPropertyValue *> * _Nullable assetPropertyValueHistory;

/**
 <p>The token for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSiotsitewiseGetAssetPropertyValueRequest : AWSRequest


/**
 <p>The ID of the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>The property alias that identifies the property, such as an OPC-UA server data stream path (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping Industrial Data Streams to Asset Properties</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable propertyAlias;

/**
 <p>The ID of the asset property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable propertyId;

@end

/**
 
 */
@interface AWSiotsitewiseGetAssetPropertyValueResponse : AWSModel


/**
 <p>The current asset property value.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseAssetPropertyValue * _Nullable propertyValue;

@end

/**
 <p>Contains details for a gateway that runs on AWS IoT Greengrass. To create a gateway that runs on AWS IoT Greengrass, you must add the IoT SiteWise connector to a Greengrass group and deploy it. Your Greengrass group must also have permissions to upload data to AWS IoT SiteWise. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/gateway-connector.html">Ingesting data using a gateway</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 Required parameters: [groupArn]
 */
@interface AWSiotsitewiseGreengrass : AWSModel


/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the Greengrass group. For more information about how to find a group's ARN, see <a href="https://docs.aws.amazon.com/greengrass/latest/apireference/listgroups-get.html">ListGroups</a> and <a href="https://docs.aws.amazon.com/greengrass/latest/apireference/getgroup-get.html">GetGroup</a> in the <i>AWS IoT Greengrass API Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupArn;

@end

/**
 <p>Contains information for a group identity in an access policy.</p>
 Required parameters: [id]
 */
@interface AWSiotsitewiseGroupIdentity : AWSModel


/**
 <p>The AWS SSO ID of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>Contains an AWS SSO identity ID for a user or group.</p><note><p>Currently, you can't use AWS APIs to retrieve AWS SSO identity IDs. You can find the AWS SSO identity IDs in the URL of user and group pages in the <a href="https://console.aws.amazon.com/singlesignon">AWS SSO console</a>.</p></note>
 */
@interface AWSiotsitewiseIdentity : AWSModel


/**
 <p>A group identity.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseGroupIdentity * _Nullable group;

/**
 <p>A user identity.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseUserIdentity * _Nullable user;

@end

/**
 <p>Contains an image that is available at a URL.</p>
 */
@interface AWSiotsitewiseImage : AWSModel


/**
 <p>The date the image was last updated, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateDate;

/**
 <p>A URL at which the image is available. The URL is valid for 15 minutes for you to view and download the image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable locationUrl;

@end

/**
 <p>Contains an image file.</p>
 Required parameters: [encodedString, fileType]
 */
@interface AWSiotsitewiseImageFile : AWSModel


/**
 <p>The image file contents, represented as a base64-encoded string. The file size must be less than 1 MB.</p>
 */
@property (nonatomic, strong) NSData * _Nullable encodedString;

/**
 <p>The file type of the image.</p>
 */
@property (nonatomic, assign) AWSiotsitewiseImageFileType fileType;

@end

/**
 
 */
@interface AWSiotsitewiseListAccessPoliciesRequest : AWSRequest


/**
 <p>The ID of the identity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityId;

/**
 <p>The type of identity (user or group).</p>
 */
@property (nonatomic, assign) AWSiotsitewiseIdentityType identityType;

/**
 <p>The maximum number of results to be returned per paginated request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to be used for the next set of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The type of resource (portal or project).</p>
 */
@property (nonatomic, assign) AWSiotsitewiseResourceType resourceType;

@end

/**
 
 */
@interface AWSiotsitewiseListAccessPoliciesResponse : AWSModel


/**
 <p>A list that summarizes each access policy.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseAccessPolicySummary *> * _Nullable accessPolicySummaries;

/**
 <p>The token for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSiotsitewiseListAssetModelsRequest : AWSRequest


/**
 <p>The maximum number of results to be returned per paginated request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to be used for the next set of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSiotsitewiseListAssetModelsResponse : AWSModel


/**
 <p>A list that summarizes each asset model.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseAssetModelSummary *> * _Nullable assetModelSummaries;

/**
 <p>The token for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSiotsitewiseListAssetsRequest : AWSRequest


/**
 <p>The ID of the asset model by which to filter the list of assets. Omit the <code>assetModelId</code> to list all assets (of all models).</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelId;

/**
 <p>The hierarchy level by which to filter the requested list of assets.</p>
 */
@property (nonatomic, assign) AWSiotsitewiseListAssetsFilter filter;

/**
 <p>The maximum number of results to be returned per paginated request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to be used for the next set of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSiotsitewiseListAssetsResponse : AWSModel


/**
 <p>A list that summarizes each asset.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseAssetSummary *> * _Nullable assetSummaries;

/**
 <p>The token for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSiotsitewiseListAssociatedAssetsRequest : AWSRequest


/**
 <p>The ID of the parent asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>The hierarchy ID (of the parent asset model) whose associated assets are returned. To find a hierarchy ID, use the <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeAsset.html">DescribeAsset</a> or <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeAssetModel.html">DescribeAssetModel</a> actions.</p><p>For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-hierarchies.html">Asset Hierarchies</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hierarchyId;

/**
 <p>The maximum number of results to be returned per paginated request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to be used for the next set of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSiotsitewiseListAssociatedAssetsResponse : AWSModel


/**
 <p>A list that summarizes the associated assets.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseAssociatedAssetsSummary *> * _Nullable assetSummaries;

/**
 <p>The token for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSiotsitewiseListDashboardsRequest : AWSRequest


/**
 <p>The maximum number of results to be returned per paginated request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to be used for the next set of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectId;

@end

/**
 
 */
@interface AWSiotsitewiseListDashboardsResponse : AWSModel


/**
 <p>A list that summarizes each dashboard in the project.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseDashboardSummary *> * _Nullable dashboardSummaries;

/**
 <p>The token for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSiotsitewiseListGatewaysRequest : AWSRequest


/**
 <p>The maximum number of results to be returned per paginated request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to be used for the next set of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSiotsitewiseListGatewaysResponse : AWSModel


/**
 <p>A list that summarizes each gateway.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseGatewaySummary *> * _Nullable gatewaySummaries;

/**
 <p>The token for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSiotsitewiseListPortalsRequest : AWSRequest


/**
 <p>The maximum number of results to be returned per paginated request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to be used for the next set of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSiotsitewiseListPortalsResponse : AWSModel


/**
 <p>The token for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list that summarizes each portal.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewisePortalSummary *> * _Nullable portalSummaries;

@end

/**
 
 */
@interface AWSiotsitewiseListProjectAssetsRequest : AWSRequest


/**
 <p>The maximum number of results to be returned per paginated request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to be used for the next set of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectId;

@end

/**
 
 */
@interface AWSiotsitewiseListProjectAssetsResponse : AWSModel


/**
 <p>A list that contains the IDs of each asset associated with the project.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable assetIds;

/**
 <p>The token for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSiotsitewiseListProjectsRequest : AWSRequest


/**
 <p>The maximum number of results to be returned per paginated request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to be used for the next set of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the portal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portalId;

@end

/**
 
 */
@interface AWSiotsitewiseListProjectsResponse : AWSModel


/**
 <p>The token for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list that summarizes each project in the portal.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseProjectSummary *> * _Nullable projectSummaries;

@end

/**
 
 */
@interface AWSiotsitewiseListTagsForResourceRequest : AWSRequest


/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSiotsitewiseListTagsForResourceResponse : AWSModel


/**
 <p>The list of key-value pairs that contain metadata for the resource. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Contains logging options.</p>
 Required parameters: [level]
 */
@interface AWSiotsitewiseLoggingOptions : AWSModel


/**
 <p>The AWS IoT SiteWise logging verbosity level.</p>
 */
@property (nonatomic, assign) AWSiotsitewiseLoggingLevel level;

@end

/**
 <p>Contains an asset measurement property. This structure is empty. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html#measurements">Measurements</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@interface AWSiotsitewiseMeasurement : AWSModel


@end

/**
 <p>Contains an asset metric property. With metrics, you can calculate aggregate functions, such as an average, maximum, or minimum, as specified through an expression. A metric maps several values to a single value (such as a sum).</p><p>The maximum number of dependent/cascading variables used in any one metric calculation is 10. Therefore, a <i>root</i> metric can have up to 10 cascading metrics in its computational dependency tree. Additionally, a metric can only have a data type of <code>DOUBLE</code> and consume properties with data types of <code>INTEGER</code> or <code>DOUBLE</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html#metrics">Metrics</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 Required parameters: [expression, variables, window]
 */
@interface AWSiotsitewiseMetric : AWSModel


/**
 <p>The mathematical expression that defines the metric aggregation function. You can specify up to 10 variables per expression. You can specify up to 10 functions per expression. </p><p>For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expression;

/**
 <p>The list of variables used in the expression.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseExpressionVariable *> * _Nullable variables;

/**
 <p>The window (time interval) over which AWS IoT SiteWise computes the metric's aggregation expression. AWS IoT SiteWise computes one data point per <code>window</code>.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseMetricWindow * _Nullable window;

@end

/**
 <p>Contains a time interval window used for data aggregate computations (for example, average, sum, count, and so on).</p>
 */
@interface AWSiotsitewiseMetricWindow : AWSModel


/**
 <p>The tumbling time interval window.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseTumblingWindow * _Nullable tumbling;

@end

/**
 <p>Contains AWS IoT SiteWise Monitor error details.</p>
 */
@interface AWSiotsitewiseMonitorErrorDetails : AWSModel


/**
 <p>The error code.</p>
 */
@property (nonatomic, assign) AWSiotsitewiseMonitorErrorCode code;

/**
 <p>The error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Identifies an AWS IoT SiteWise Monitor portal.</p>
 Required parameters: [id]
 */
@interface AWSiotsitewisePortalResource : AWSModel


/**
 <p>The ID of the portal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>Contains information about the current status of a portal.</p>
 Required parameters: [state]
 */
@interface AWSiotsitewisePortalStatus : AWSModel


/**
 <p>Contains associated error information, if any.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseMonitorErrorDetails * _Nullable error;

/**
 <p>The current state of the portal.</p>
 */
@property (nonatomic, assign) AWSiotsitewisePortalState state;

@end

/**
 <p>Contains a portal summary.</p>
 Required parameters: [id, name, startUrl]
 */
@interface AWSiotsitewisePortalSummary : AWSModel


/**
 <p>The date the portal was created, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The portal's description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID of the portal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The date the portal was last updated, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateDate;

/**
 <p>The name of the portal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the service role that allows the portal's users to access your AWS IoT SiteWise resources on your behalf. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-service-role.html">Using service roles for AWS IoT SiteWise Monitor</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The public root URL for the AWS IoT AWS IoT SiteWise Monitor application portal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable startUrl;

@end

/**
 <p>Identifies a specific AWS IoT SiteWise Monitor project.</p>
 Required parameters: [id]
 */
@interface AWSiotsitewiseProjectResource : AWSModel


/**
 <p>The ID of the project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>Contains project summary information.</p>
 Required parameters: [id, name]
 */
@interface AWSiotsitewiseProjectSummary : AWSModel


/**
 <p>The date the project was created, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The project's description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID of the project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The date the project was last updated, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateDate;

/**
 <p>The name of the project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Contains asset property information.</p>
 Required parameters: [id, name, dataType]
 */
@interface AWSiotsitewiseProperty : AWSModel


/**
 <p>The property alias that identifies the property, such as an OPC-UA server data stream path (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping Industrial Data Streams to Asset Properties</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alias;

/**
 <p>The property data type.</p>
 */
@property (nonatomic, assign) AWSiotsitewisePropertyDataType dataType;

/**
 <p>The ID of the asset property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The asset property's notification topic and state. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a></p>
 */
@property (nonatomic, strong) AWSiotsitewisePropertyNotification * _Nullable notification;

/**
 <p>The property type (see <code>PropertyType</code>). A property contains one type.</p>
 */
@property (nonatomic, strong) AWSiotsitewisePropertyType * _Nullable types;

/**
 <p>The unit (such as <code>Newtons</code> or <code>RPM</code>) of the asset property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable unit;

@end

/**
 <p>Contains asset property value notification information. When the notification state is enabled, AWS IoT SiteWise publishes property value updates to a unique MQTT topic. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/interact-with-other-services.html">Interacting with Other Services</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 Required parameters: [topic, state]
 */
@interface AWSiotsitewisePropertyNotification : AWSModel


/**
 <p>The current notification state.</p>
 */
@property (nonatomic, assign) AWSiotsitewisePropertyNotificationState state;

/**
 <p>The MQTT topic to which AWS IoT SiteWise publishes property value update notifications.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topic;

@end

/**
 <p>Contains a property type, which can be one of <code>attribute</code>, <code>measurement</code>, <code>metric</code>, or <code>transform</code>.</p>
 */
@interface AWSiotsitewisePropertyType : AWSModel


/**
 <p>Specifies an asset attribute property. An attribute generally contains static information, such as the serial number of an <a href="https://en.wikipedia.org/wiki/Internet_of_things#Industrial_applications">IIoT</a> wind turbine.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseAttribute * _Nullable attribute;

/**
 <p>Specifies an asset measurement property. A measurement represents a device's raw sensor data stream, such as timestamped temperature values or timestamped power values.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseMeasurement * _Nullable measurement;

/**
 <p>Specifies an asset metric property. A metric contains a mathematical expression that uses aggregate functions to process all input data points over a time interval and output a single data point, such as to calculate the average hourly temperature.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseMetric * _Nullable metric;

/**
 <p>Specifies an asset transform property. A transform contains a mathematical expression that maps a property's data points from one form to another, such as a unit conversion from Celsius to Fahrenheit.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseTransform * _Nullable transform;

@end

/**
 <p>Contains a list of value updates for an asset property in the list of asset entries consumed by the <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchPutAssetPropertyValue.html">BatchPutAssetPropertyValue</a> API.</p>
 Required parameters: [entryId, propertyValues]
 */
@interface AWSiotsitewisePutAssetPropertyValueEntry : AWSModel


/**
 <p>The ID of the asset to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>The user specified ID for the entry. You can use this ID to identify which entries failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entryId;

/**
 <p>The property alias that identifies the property, such as an OPC-UA server data stream path (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping Industrial Data Streams to Asset Properties</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable propertyAlias;

/**
 <p>The ID of the asset property for this entry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable propertyId;

/**
 <p>The list of property values to upload. You can specify up to 10 <code>propertyValues</code> array elements. </p><p>For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseAssetPropertyValue *> * _Nullable propertyValues;

@end

/**
 
 */
@interface AWSiotsitewisePutLoggingOptionsRequest : AWSRequest


/**
 <p>The logging options to set.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseLoggingOptions * _Nullable loggingOptions;

@end

/**
 
 */
@interface AWSiotsitewisePutLoggingOptionsResponse : AWSModel


@end

/**
 <p>Contains an AWS IoT SiteWise Monitor resource ID for a portal or project.</p>
 */
@interface AWSiotsitewiseResource : AWSModel


/**
 <p>A portal resource.</p>
 */
@property (nonatomic, strong) AWSiotsitewisePortalResource * _Nullable portal;

/**
 <p>A project resource.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseProjectResource * _Nullable project;

@end

/**
 
 */
@interface AWSiotsitewiseTagResourceRequest : AWSRequest


/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the resource to tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>A list of key-value pairs that contain metadata for the resource. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSiotsitewiseTagResourceResponse : AWSModel


@end

/**
 <p>Contains a timestamp with optional nanosecond granularity.</p>
 Required parameters: [timeInSeconds]
 */
@interface AWSiotsitewiseTimeInNanos : AWSModel


/**
 <p>The nanosecond offset from <code>timeInSeconds</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable offsetInNanos;

/**
 <p>The timestamp date, in seconds, in the Unix epoch format. Fractional nanosecond data is provided by <code>offsetInNanos</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeInSeconds;

@end

/**
 <p>Contains an asset transform property. A transform is a one-to-one mapping of a property's data points from one form to another. For example, you can use a transform to convert a Celsius data stream to Fahrenheit by applying the transformation expression to each data point of the Celsius stream. A transform can only have a data type of <code>DOUBLE</code> and consume properties with data types of <code>INTEGER</code> or <code>DOUBLE</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html#transforms">Transforms</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 Required parameters: [expression, variables]
 */
@interface AWSiotsitewiseTransform : AWSModel


/**
 <p>The mathematical expression that defines the transformation function. You can specify up to 10 variables per expression. You can specify up to 10 functions per expression. </p><p>For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expression;

/**
 <p>The list of variables used in the expression.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseExpressionVariable *> * _Nullable variables;

@end

/**
 <p>Contains a tumbling window, which is a repeating fixed-sized, non-overlapping, and contiguous time interval. This window is used in metric and aggregation computations.</p>
 Required parameters: [interval]
 */
@interface AWSiotsitewiseTumblingWindow : AWSModel


/**
 <p>The time interval for the tumbling window. Note that <code>w</code> represents weeks, <code>d</code> represents days, <code>h</code> represents hours, and <code>m</code> represents minutes. AWS IoT SiteWise computes the <code>1w</code> interval the end of Sunday at midnight each week (UTC), the <code>1d</code> interval at the end of each day at midnight (UTC), the <code>1h</code> interval at the end of each hour, and so on. </p><p>When AWS IoT SiteWise aggregates data points for metric computations, the start of each interval is exclusive and the end of each interval is inclusive. AWS IoT SiteWise places the computed data point at the end of the interval.</p>
 */
@property (nonatomic, strong) NSString * _Nullable interval;

@end

/**
 
 */
@interface AWSiotsitewiseUntagResourceRequest : AWSRequest


/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the resource to untag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>A list of keys for tags to remove from the resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSiotsitewiseUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSiotsitewiseUpdateAccessPolicyRequest : AWSRequest


/**
 <p>The ID of the access policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessPolicyId;

/**
 <p>The identity for this access policy. Choose either a <code>user</code> or a <code>group</code> but not both.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseIdentity * _Nullable accessPolicyIdentity;

/**
 <p>The permission level for this access policy. Note that a project <code>ADMINISTRATOR</code> is also known as a project owner.</p>
 */
@property (nonatomic, assign) AWSiotsitewisePermission accessPolicyPermission;

/**
 <p>The AWS IoT SiteWise Monitor resource for this access policy. Choose either <code>portal</code> or <code>project</code> but not both.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseResource * _Nullable accessPolicyResource;

/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

@end

/**
 
 */
@interface AWSiotsitewiseUpdateAccessPolicyResponse : AWSModel


@end

/**
 
 */
@interface AWSiotsitewiseUpdateAssetModelRequest : AWSRequest


/**
 <p>A description for the asset model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelDescription;

/**
 <p>The updated hierarchy definitions of the asset model. Each hierarchy specifies an asset model whose assets can be children of any other assets created from this asset model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-hierarchies.html">Asset Hierarchies</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>You can specify up to 10 hierarchies per asset model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseAssetModelHierarchy *> * _Nullable assetModelHierarchies;

/**
 <p>The ID of the asset model to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelId;

/**
 <p>A unique, friendly name for the asset model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelName;

/**
 <p>The updated property definitions of the asset model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html">Asset Properties</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>You can specify up to 200 properties per asset model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSiotsitewiseAssetModelProperty *> * _Nullable assetModelProperties;

/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

@end

/**
 
 */
@interface AWSiotsitewiseUpdateAssetModelResponse : AWSModel


/**
 <p>The status of the asset model, which contains a state (<code>UPDATING</code> after successfully calling this action) and any error message.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseAssetModelStatus * _Nullable assetModelStatus;

@end

/**
 
 */
@interface AWSiotsitewiseUpdateAssetPropertyRequest : AWSRequest


/**
 <p>The ID of the asset to be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The property alias that identifies the property, such as an OPC-UA server data stream path (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping Industrial Data Streams to Asset Properties</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable propertyAlias;

/**
 <p>The ID of the asset property to be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable propertyId;

/**
 <p>The updated MQTT notification state (enabled or disabled) for this asset property. When the notification state is enabled, AWS IoT SiteWise publishes property value updates to a unique MQTT topic. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/interact-with-other-services.html">Interacting with Other Services</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, assign) AWSiotsitewisePropertyNotificationState propertyNotificationState;

@end

/**
 
 */
@interface AWSiotsitewiseUpdateAssetRequest : AWSRequest


/**
 <p>The ID of the asset to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>A unique, friendly name for the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetName;

/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

@end

/**
 
 */
@interface AWSiotsitewiseUpdateAssetResponse : AWSModel


/**
 <p>The status of the asset, which contains a state (<code>UPDATING</code> after successfully calling this action) and any error message.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseAssetStatus * _Nullable assetStatus;

@end

/**
 
 */
@interface AWSiotsitewiseUpdateDashboardRequest : AWSRequest


/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The new dashboard definition, as specified in a JSON literal. For detailed information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/create-dashboards-using-aws-cli.html">Creating Dashboards (CLI)</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardDefinition;

/**
 <p>A new description for the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardDescription;

/**
 <p>The ID of the dashboard to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardId;

/**
 <p>A new friendly name for the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardName;

@end

/**
 
 */
@interface AWSiotsitewiseUpdateDashboardResponse : AWSModel


@end

/**
 
 */
@interface AWSiotsitewiseUpdateGatewayCapabilityConfigurationRequest : AWSRequest


/**
 <p>The JSON document that defines the configuration for the gateway capability. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/configure-sources.html#configure-source-cli">Configuring data sources (CLI)</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable capabilityConfiguration;

/**
 <p>The namespace of the gateway capability configuration to be updated. For example, if you configure OPC-UA sources from the AWS IoT SiteWise console, your OPC-UA capability configuration has the namespace <code>iotsitewise:opcuacollector:version</code>, where <code>version</code> is a number such as <code>1</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable capabilityNamespace;

/**
 <p>The ID of the gateway to be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayId;

@end

/**
 
 */
@interface AWSiotsitewiseUpdateGatewayCapabilityConfigurationResponse : AWSModel


/**
 <p>The namespace of the gateway capability.</p>
 */
@property (nonatomic, strong) NSString * _Nullable capabilityNamespace;

/**
 <p>The synchronization status of the capability configuration. The sync status can be one of the following:</p><ul><li><p><code>IN_SYNC</code> – The gateway is running the capability configuration.</p></li><li><p><code>OUT_OF_SYNC</code> – The gateway hasn't received the capability configuration.</p></li><li><p><code>SYNC_FAILED</code> – The gateway rejected the capability configuration.</p></li></ul><p>After you update a capability configuration, its sync status is <code>OUT_OF_SYNC</code> until the gateway receives and applies or rejects the updated configuration.</p>
 */
@property (nonatomic, assign) AWSiotsitewiseCapabilitySyncStatus capabilitySyncStatus;

@end

/**
 
 */
@interface AWSiotsitewiseUpdateGatewayRequest : AWSRequest


/**
 <p>The ID of the gateway to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayId;

/**
 <p>A unique, friendly name for the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayName;

@end

/**
 
 */
@interface AWSiotsitewiseUpdatePortalRequest : AWSRequest


/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The AWS administrator's contact email address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portalContactEmail;

/**
 <p>A new description for the portal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portalDescription;

/**
 <p>The ID of the portal to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portalId;

/**
 <p>A logo image to display in the portal. Upload a square, high-resolution image. The image is displayed on a dark background.</p>
 */
@property (nonatomic, strong) AWSiotsitewiseImageFile * _Nullable portalLogoImageFile;

/**
 <p>A new friendly name for the portal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portalName;

/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of a service role that allows the portal's users to access your AWS IoT SiteWise resources on your behalf. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-service-role.html">Using service roles for AWS IoT SiteWise Monitor</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSiotsitewiseUpdatePortalResponse : AWSModel


/**
 <p>The status of the portal, which contains a state (<code>UPDATING</code> after successfully calling this action) and any error message.</p>
 */
@property (nonatomic, strong) AWSiotsitewisePortalStatus * _Nullable portalStatus;

@end

/**
 
 */
@interface AWSiotsitewiseUpdateProjectRequest : AWSRequest


/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>A new description for the project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectDescription;

/**
 <p>The ID of the project to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectId;

/**
 <p>A new friendly name for the project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectName;

@end

/**
 
 */
@interface AWSiotsitewiseUpdateProjectResponse : AWSModel


@end

/**
 <p>Contains information for a user identity in an access policy.</p>
 Required parameters: [id]
 */
@interface AWSiotsitewiseUserIdentity : AWSModel


/**
 <p>The AWS SSO ID of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>Identifies a property value used in an expression.</p>
 Required parameters: [propertyId]
 */
@interface AWSiotsitewiseVariableValue : AWSModel


/**
 <p>The ID of the hierarchy to query for the property ID. You can use the hierarchy's name instead of the hierarchy's ID.</p><p>You use a hierarchy ID instead of a model ID because you can have several hierarchies using the same model and therefore the same <code>propertyId</code>. For example, you might have separately grouped assets that come from the same asset model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-hierarchies.html">Asset Hierarchies</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hierarchyId;

/**
 <p>The ID of the property to use as the variable. You can use the property <code>name</code> if it's from the same asset model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable propertyId;

@end

/**
 <p>Contains an asset property value (of a single type only).</p>
 */
@interface AWSiotsitewiseVariant : AWSModel


/**
 <p>Asset property data of type Boolean (true or false).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable booleanValueProperty;

/**
 <p>Asset property data of type double (floating point number).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable doubleValueProperty;

/**
 <p>Asset property data of type integer (whole number).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable integerValueProperty;

/**
 <p>Asset property data of type string (sequence of characters).</p>
 */
@property (nonatomic, strong) NSString * _Nullable stringValueProperty;

@end

NS_ASSUME_NONNULL_END
