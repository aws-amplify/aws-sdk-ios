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

FOUNDATION_EXPORT NSString *const AWSIotsitewiseErrorDomain;

typedef NS_ENUM(NSInteger, AWSIotsitewiseErrorType) {
    AWSIotsitewiseErrorUnknown,
    AWSIotsitewiseErrorConflictingOperation,
    AWSIotsitewiseErrorInternalFailure,
    AWSIotsitewiseErrorInvalidRequest,
    AWSIotsitewiseErrorLimitExceeded,
    AWSIotsitewiseErrorResourceAlreadyExists,
    AWSIotsitewiseErrorResourceNotFound,
    AWSIotsitewiseErrorServiceUnavailable,
    AWSIotsitewiseErrorThrottling,
    AWSIotsitewiseErrorTooManyTags,
};

typedef NS_ENUM(NSInteger, AWSIotsitewiseAggregateType) {
    AWSIotsitewiseAggregateTypeUnknown,
    AWSIotsitewiseAggregateTypeAverage,
    AWSIotsitewiseAggregateTypeCount,
    AWSIotsitewiseAggregateTypeMaximum,
    AWSIotsitewiseAggregateTypeMinimum,
    AWSIotsitewiseAggregateTypeSum,
    AWSIotsitewiseAggregateTypeStandardDeviation,
};

typedef NS_ENUM(NSInteger, AWSIotsitewiseAssetErrorCode) {
    AWSIotsitewiseAssetErrorCodeUnknown,
    AWSIotsitewiseAssetErrorCodeInternalFailure,
};

typedef NS_ENUM(NSInteger, AWSIotsitewiseAssetModelState) {
    AWSIotsitewiseAssetModelStateUnknown,
    AWSIotsitewiseAssetModelStateCreating,
    AWSIotsitewiseAssetModelStateActive,
    AWSIotsitewiseAssetModelStateUpdating,
    AWSIotsitewiseAssetModelStatePropagating,
    AWSIotsitewiseAssetModelStateDeleting,
    AWSIotsitewiseAssetModelStateFailed,
};

typedef NS_ENUM(NSInteger, AWSIotsitewiseAssetState) {
    AWSIotsitewiseAssetStateUnknown,
    AWSIotsitewiseAssetStateCreating,
    AWSIotsitewiseAssetStateActive,
    AWSIotsitewiseAssetStateUpdating,
    AWSIotsitewiseAssetStateDeleting,
    AWSIotsitewiseAssetStateFailed,
};

typedef NS_ENUM(NSInteger, AWSIotsitewiseBatchPutAssetPropertyValueErrorCode) {
    AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeUnknown,
    AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeResourceNotFoundException,
    AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeInvalidRequestException,
    AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeInternalFailureException,
    AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeServiceUnavailableException,
    AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeThrottlingException,
    AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeLimitExceededException,
    AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeConflictingOperationException,
    AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeTimestampOutOfRangeException,
    AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeAccessDeniedException,
};

typedef NS_ENUM(NSInteger, AWSIotsitewiseCapabilitySyncStatus) {
    AWSIotsitewiseCapabilitySyncStatusUnknown,
    AWSIotsitewiseCapabilitySyncStatusInSync,
    AWSIotsitewiseCapabilitySyncStatusOutOfSync,
    AWSIotsitewiseCapabilitySyncStatusSyncFailed,
};

typedef NS_ENUM(NSInteger, AWSIotsitewiseErrorCode) {
    AWSIotsitewiseErrorCodeUnknown,
    AWSIotsitewiseErrorCodeValidationError,
    AWSIotsitewiseErrorCodeInternalFailure,
};

typedef NS_ENUM(NSInteger, AWSIotsitewiseIdentityType) {
    AWSIotsitewiseIdentityTypeUnknown,
    AWSIotsitewiseIdentityTypeUser,
    AWSIotsitewiseIdentityTypeGroup,
};

typedef NS_ENUM(NSInteger, AWSIotsitewiseImageFileType) {
    AWSIotsitewiseImageFileTypeUnknown,
    AWSIotsitewiseImageFileTypePng,
};

typedef NS_ENUM(NSInteger, AWSIotsitewiseListAssetsFilter) {
    AWSIotsitewiseListAssetsFilterUnknown,
    AWSIotsitewiseListAssetsFilterAll,
    AWSIotsitewiseListAssetsFilterTopLevel,
};

typedef NS_ENUM(NSInteger, AWSIotsitewiseLoggingLevel) {
    AWSIotsitewiseLoggingLevelUnknown,
    AWSIotsitewiseLoggingLevelError,
    AWSIotsitewiseLoggingLevelInfo,
    AWSIotsitewiseLoggingLevelOff,
};

typedef NS_ENUM(NSInteger, AWSIotsitewiseMonitorErrorCode) {
    AWSIotsitewiseMonitorErrorCodeUnknown,
    AWSIotsitewiseMonitorErrorCodeInternalFailure,
};

typedef NS_ENUM(NSInteger, AWSIotsitewisePermission) {
    AWSIotsitewisePermissionUnknown,
    AWSIotsitewisePermissionAdministrator,
    AWSIotsitewisePermissionViewer,
};

typedef NS_ENUM(NSInteger, AWSIotsitewisePortalState) {
    AWSIotsitewisePortalStateUnknown,
    AWSIotsitewisePortalStateCreating,
    AWSIotsitewisePortalStateUpdating,
    AWSIotsitewisePortalStateDeleting,
    AWSIotsitewisePortalStateActive,
    AWSIotsitewisePortalStateFailed,
};

typedef NS_ENUM(NSInteger, AWSIotsitewisePropertyDataType) {
    AWSIotsitewisePropertyDataTypeUnknown,
    AWSIotsitewisePropertyDataTypeString,
    AWSIotsitewisePropertyDataTypeInteger,
    AWSIotsitewisePropertyDataTypeDouble,
    AWSIotsitewisePropertyDataTypeBoolean,
};

typedef NS_ENUM(NSInteger, AWSIotsitewisePropertyNotificationState) {
    AWSIotsitewisePropertyNotificationStateUnknown,
    AWSIotsitewisePropertyNotificationStateEnabled,
    AWSIotsitewisePropertyNotificationStateDisabled,
};

typedef NS_ENUM(NSInteger, AWSIotsitewiseQuality) {
    AWSIotsitewiseQualityUnknown,
    AWSIotsitewiseQualityGood,
    AWSIotsitewiseQualityBad,
    AWSIotsitewiseQualityUncertain,
};

typedef NS_ENUM(NSInteger, AWSIotsitewiseResourceType) {
    AWSIotsitewiseResourceTypeUnknown,
    AWSIotsitewiseResourceTypePortal,
    AWSIotsitewiseResourceTypeProject,
};

typedef NS_ENUM(NSInteger, AWSIotsitewiseTimeOrdering) {
    AWSIotsitewiseTimeOrderingUnknown,
    AWSIotsitewiseTimeOrderingAscending,
    AWSIotsitewiseTimeOrderingDescending,
};

@class AWSIotsitewiseAccessPolicySummary;
@class AWSIotsitewiseAggregatedValue;
@class AWSIotsitewiseAggregates;
@class AWSIotsitewiseAssetErrorDetails;
@class AWSIotsitewiseAssetHierarchy;
@class AWSIotsitewiseAssetModelHierarchy;
@class AWSIotsitewiseAssetModelHierarchyDefinition;
@class AWSIotsitewiseAssetModelProperty;
@class AWSIotsitewiseAssetModelPropertyDefinition;
@class AWSIotsitewiseAssetModelStatus;
@class AWSIotsitewiseAssetModelSummary;
@class AWSIotsitewiseAssetProperty;
@class AWSIotsitewiseAssetPropertyValue;
@class AWSIotsitewiseAssetStatus;
@class AWSIotsitewiseAssetSummary;
@class AWSIotsitewiseAssociateAssetsRequest;
@class AWSIotsitewiseAssociatedAssetsSummary;
@class AWSIotsitewiseAttribute;
@class AWSIotsitewiseBatchAssociateProjectAssetsRequest;
@class AWSIotsitewiseBatchAssociateProjectAssetsResponse;
@class AWSIotsitewiseBatchDisassociateProjectAssetsRequest;
@class AWSIotsitewiseBatchDisassociateProjectAssetsResponse;
@class AWSIotsitewiseBatchPutAssetPropertyError;
@class AWSIotsitewiseBatchPutAssetPropertyErrorEntry;
@class AWSIotsitewiseBatchPutAssetPropertyValueRequest;
@class AWSIotsitewiseBatchPutAssetPropertyValueResponse;
@class AWSIotsitewiseCreateAccessPolicyRequest;
@class AWSIotsitewiseCreateAccessPolicyResponse;
@class AWSIotsitewiseCreateAssetModelRequest;
@class AWSIotsitewiseCreateAssetModelResponse;
@class AWSIotsitewiseCreateAssetRequest;
@class AWSIotsitewiseCreateAssetResponse;
@class AWSIotsitewiseCreateDashboardRequest;
@class AWSIotsitewiseCreateDashboardResponse;
@class AWSIotsitewiseCreateGatewayRequest;
@class AWSIotsitewiseCreateGatewayResponse;
@class AWSIotsitewiseCreatePortalRequest;
@class AWSIotsitewiseCreatePortalResponse;
@class AWSIotsitewiseCreateProjectRequest;
@class AWSIotsitewiseCreateProjectResponse;
@class AWSIotsitewiseDashboardSummary;
@class AWSIotsitewiseDeleteAccessPolicyRequest;
@class AWSIotsitewiseDeleteAccessPolicyResponse;
@class AWSIotsitewiseDeleteAssetModelRequest;
@class AWSIotsitewiseDeleteAssetModelResponse;
@class AWSIotsitewiseDeleteAssetRequest;
@class AWSIotsitewiseDeleteAssetResponse;
@class AWSIotsitewiseDeleteDashboardRequest;
@class AWSIotsitewiseDeleteDashboardResponse;
@class AWSIotsitewiseDeleteGatewayRequest;
@class AWSIotsitewiseDeletePortalRequest;
@class AWSIotsitewiseDeletePortalResponse;
@class AWSIotsitewiseDeleteProjectRequest;
@class AWSIotsitewiseDeleteProjectResponse;
@class AWSIotsitewiseDescribeAccessPolicyRequest;
@class AWSIotsitewiseDescribeAccessPolicyResponse;
@class AWSIotsitewiseDescribeAssetModelRequest;
@class AWSIotsitewiseDescribeAssetModelResponse;
@class AWSIotsitewiseDescribeAssetPropertyRequest;
@class AWSIotsitewiseDescribeAssetPropertyResponse;
@class AWSIotsitewiseDescribeAssetRequest;
@class AWSIotsitewiseDescribeAssetResponse;
@class AWSIotsitewiseDescribeDashboardRequest;
@class AWSIotsitewiseDescribeDashboardResponse;
@class AWSIotsitewiseDescribeGatewayCapabilityConfigurationRequest;
@class AWSIotsitewiseDescribeGatewayCapabilityConfigurationResponse;
@class AWSIotsitewiseDescribeGatewayRequest;
@class AWSIotsitewiseDescribeGatewayResponse;
@class AWSIotsitewiseDescribeLoggingOptionsRequest;
@class AWSIotsitewiseDescribeLoggingOptionsResponse;
@class AWSIotsitewiseDescribePortalRequest;
@class AWSIotsitewiseDescribePortalResponse;
@class AWSIotsitewiseDescribeProjectRequest;
@class AWSIotsitewiseDescribeProjectResponse;
@class AWSIotsitewiseDisassociateAssetsRequest;
@class AWSIotsitewiseErrorDetails;
@class AWSIotsitewiseExpressionVariable;
@class AWSIotsitewiseGatewayCapabilitySummary;
@class AWSIotsitewiseGatewayPlatform;
@class AWSIotsitewiseGatewaySummary;
@class AWSIotsitewiseGetAssetPropertyAggregatesRequest;
@class AWSIotsitewiseGetAssetPropertyAggregatesResponse;
@class AWSIotsitewiseGetAssetPropertyValueHistoryRequest;
@class AWSIotsitewiseGetAssetPropertyValueHistoryResponse;
@class AWSIotsitewiseGetAssetPropertyValueRequest;
@class AWSIotsitewiseGetAssetPropertyValueResponse;
@class AWSIotsitewiseGreengrass;
@class AWSIotsitewiseGroupIdentity;
@class AWSIotsitewiseIdentity;
@class AWSIotsitewiseImage;
@class AWSIotsitewiseImageFile;
@class AWSIotsitewiseImageLocation;
@class AWSIotsitewiseListAccessPoliciesRequest;
@class AWSIotsitewiseListAccessPoliciesResponse;
@class AWSIotsitewiseListAssetModelsRequest;
@class AWSIotsitewiseListAssetModelsResponse;
@class AWSIotsitewiseListAssetsRequest;
@class AWSIotsitewiseListAssetsResponse;
@class AWSIotsitewiseListAssociatedAssetsRequest;
@class AWSIotsitewiseListAssociatedAssetsResponse;
@class AWSIotsitewiseListDashboardsRequest;
@class AWSIotsitewiseListDashboardsResponse;
@class AWSIotsitewiseListGatewaysRequest;
@class AWSIotsitewiseListGatewaysResponse;
@class AWSIotsitewiseListPortalsRequest;
@class AWSIotsitewiseListPortalsResponse;
@class AWSIotsitewiseListProjectAssetsRequest;
@class AWSIotsitewiseListProjectAssetsResponse;
@class AWSIotsitewiseListProjectsRequest;
@class AWSIotsitewiseListProjectsResponse;
@class AWSIotsitewiseListTagsForResourceRequest;
@class AWSIotsitewiseListTagsForResourceResponse;
@class AWSIotsitewiseLoggingOptions;
@class AWSIotsitewiseMeasurement;
@class AWSIotsitewiseMetric;
@class AWSIotsitewiseMetricWindow;
@class AWSIotsitewiseMonitorErrorDetails;
@class AWSIotsitewisePortalResource;
@class AWSIotsitewisePortalStatus;
@class AWSIotsitewisePortalSummary;
@class AWSIotsitewiseProjectResource;
@class AWSIotsitewiseProjectSummary;
@class AWSIotsitewiseProperty;
@class AWSIotsitewisePropertyNotification;
@class AWSIotsitewisePropertyType;
@class AWSIotsitewisePutAssetPropertyValueEntry;
@class AWSIotsitewisePutLoggingOptionsRequest;
@class AWSIotsitewisePutLoggingOptionsResponse;
@class AWSIotsitewiseResource;
@class AWSIotsitewiseTagResourceRequest;
@class AWSIotsitewiseTagResourceResponse;
@class AWSIotsitewiseTimeInNanos;
@class AWSIotsitewiseTransform;
@class AWSIotsitewiseTumblingWindow;
@class AWSIotsitewiseUntagResourceRequest;
@class AWSIotsitewiseUntagResourceResponse;
@class AWSIotsitewiseUpdateAccessPolicyRequest;
@class AWSIotsitewiseUpdateAccessPolicyResponse;
@class AWSIotsitewiseUpdateAssetModelRequest;
@class AWSIotsitewiseUpdateAssetModelResponse;
@class AWSIotsitewiseUpdateAssetPropertyRequest;
@class AWSIotsitewiseUpdateAssetRequest;
@class AWSIotsitewiseUpdateAssetResponse;
@class AWSIotsitewiseUpdateDashboardRequest;
@class AWSIotsitewiseUpdateDashboardResponse;
@class AWSIotsitewiseUpdateGatewayCapabilityConfigurationRequest;
@class AWSIotsitewiseUpdateGatewayCapabilityConfigurationResponse;
@class AWSIotsitewiseUpdateGatewayRequest;
@class AWSIotsitewiseUpdatePortalRequest;
@class AWSIotsitewiseUpdatePortalResponse;
@class AWSIotsitewiseUpdateProjectRequest;
@class AWSIotsitewiseUpdateProjectResponse;
@class AWSIotsitewiseUserIdentity;
@class AWSIotsitewiseVariableValue;
@class AWSIotsitewiseVariant;

/**
 <p>Contains an access policy that defines an AWS SSO identity's access to an AWS IoT SiteWise Monitor resource.</p>
 Required parameters: [id, identity, resource, permission]
 */
@interface AWSIotsitewiseAccessPolicySummary : AWSModel


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
@property (nonatomic, strong) AWSIotsitewiseIdentity * _Nullable identity;

/**
 <p>The date the access policy was last updated, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateDate;

/**
 <p>The permissions for the access policy. Note that a project <code>ADMINISTRATOR</code> is also known as a project owner.</p>
 */
@property (nonatomic, assign) AWSIotsitewisePermission permission;

/**
 <p>The AWS IoT SiteWise Monitor resource (a portal or project).</p>
 */
@property (nonatomic, strong) AWSIotsitewiseResource * _Nullable resource;

@end

/**
 <p>Contains aggregated asset property values (for example, average, minimum, and maximum).</p>
 Required parameters: [timestamp, value]
 */
@interface AWSIotsitewiseAggregatedValue : AWSModel


/**
 <p>The quality of the aggregated data.</p>
 */
@property (nonatomic, assign) AWSIotsitewiseQuality quality;

/**
 <p>The date the aggregating computations occurred, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

/**
 <p>The value of the aggregates.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseAggregates * _Nullable value;

@end

/**
 <p>Contains the (pre-calculated) aggregate values for an asset property.</p>
 */
@interface AWSIotsitewiseAggregates : AWSModel


/**
 <p>The average (mean) value of the time series over a time interval window.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable average;

/**
 <p>The count of data points in the time series over a time interval window.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 <p>The maximum value of the time series over a time interval window.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximum;

/**
 <p>The minimum value of the time series over a time interval window.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minimum;

/**
 <p>The standard deviation of the time series over a time interval window.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable standardDeviation;

/**
 <p>The sum of the time series over a time interval window.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sum;

@end

/**
 <p>Contains error details for the requested associate project asset action.</p>
 Required parameters: [assetId, code, message]
 */
@interface AWSIotsitewiseAssetErrorDetails : AWSModel


/**
 <p>The ID of the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>The error code.</p>
 */
@property (nonatomic, assign) AWSIotsitewiseAssetErrorCode code;

/**
 <p>The error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Describes an asset hierarchy that contains a hierarchy's name and ID.</p>
 Required parameters: [name]
 */
@interface AWSIotsitewiseAssetHierarchy : AWSModel


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
@interface AWSIotsitewiseAssetModelHierarchy : AWSModel


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
@interface AWSIotsitewiseAssetModelHierarchyDefinition : AWSModel


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
@interface AWSIotsitewiseAssetModelProperty : AWSModel


/**
 <p>The data type of the asset model property.</p>
 */
@property (nonatomic, assign) AWSIotsitewisePropertyDataType dataType;

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
@property (nonatomic, strong) AWSIotsitewisePropertyType * _Nullable types;

/**
 <p>The unit of the asset model property, such as <code>Newtons</code> or <code>RPM</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable unit;

@end

/**
 <p>Contains an asset model property definition. This property definition is applied to all assets created from the asset model.</p>
 Required parameters: [name, dataType, type]
 */
@interface AWSIotsitewiseAssetModelPropertyDefinition : AWSModel


/**
 <p>The data type of the property definition.</p>
 */
@property (nonatomic, assign) AWSIotsitewisePropertyDataType dataType;

/**
 <p>The name of the property definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The property definition type (see <code>PropertyType</code>). You can only specify one type in a property definition.</p>
 */
@property (nonatomic, strong) AWSIotsitewisePropertyType * _Nullable types;

/**
 <p>The unit of the property definition, such as <code>Newtons</code> or <code>RPM</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable unit;

@end

/**
 <p>Contains current status information for an asset model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-and-model-states.html">Asset and Model States</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 Required parameters: [state]
 */
@interface AWSIotsitewiseAssetModelStatus : AWSModel


/**
 <p>Contains associated error information, if any.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseErrorDetails * _Nullable error;

/**
 <p>The current state of the asset model.</p>
 */
@property (nonatomic, assign) AWSIotsitewiseAssetModelState state;

@end

/**
 <p>Contains a summary of an asset model.</p>
 Required parameters: [id, arn, name, description, creationDate, lastUpdateDate, status]
 */
@interface AWSIotsitewiseAssetModelSummary : AWSModel


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
@property (nonatomic, strong) AWSIotsitewiseAssetModelStatus * _Nullable status;

@end

/**
 <p>Contains asset property information.</p>
 Required parameters: [id, name, dataType]
 */
@interface AWSIotsitewiseAssetProperty : AWSModel


/**
 <p>The property alias that identifies the property, such as an OPC-UA server data stream path (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping Industrial Data Streams to Asset Properties</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alias;

/**
 <p>The data type of the asset property.</p>
 */
@property (nonatomic, assign) AWSIotsitewisePropertyDataType dataType;

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
@property (nonatomic, strong) AWSIotsitewisePropertyNotification * _Nullable notification;

/**
 <p>The unit (such as <code>Newtons</code> or <code>RPM</code>) of the asset property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable unit;

@end

/**
 <p>Contains asset property value information.</p>
 Required parameters: [value, timestamp]
 */
@interface AWSIotsitewiseAssetPropertyValue : AWSModel


/**
 <p>The quality of the asset property value.</p>
 */
@property (nonatomic, assign) AWSIotsitewiseQuality quality;

/**
 <p>The timestamp of the asset property value.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseTimeInNanos * _Nullable timestamp;

/**
 <p>The value of the asset property (see <code>Variant</code>).</p>
 */
@property (nonatomic, strong) AWSIotsitewiseVariant * _Nullable value;

@end

/**
 <p>Contains information about the current status of an asset. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-and-model-states.html">Asset and Model States</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 Required parameters: [state]
 */
@interface AWSIotsitewiseAssetStatus : AWSModel


/**
 <p>Contains associated error information, if any.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseErrorDetails * _Nullable error;

/**
 <p>The current status of the asset.</p>
 */
@property (nonatomic, assign) AWSIotsitewiseAssetState state;

@end

/**
 <p>Contains a summary of an asset.</p>
 Required parameters: [id, arn, name, assetModelId, creationDate, lastUpdateDate, status, hierarchies]
 */
@interface AWSIotsitewiseAssetSummary : AWSModel


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
@property (nonatomic, strong) NSArray<AWSIotsitewiseAssetHierarchy *> * _Nullable hierarchies;

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
@property (nonatomic, strong) AWSIotsitewiseAssetStatus * _Nullable status;

@end

/**
 
 */
@interface AWSIotsitewiseAssociateAssetsRequest : AWSRequest


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
@interface AWSIotsitewiseAssociatedAssetsSummary : AWSModel


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
@property (nonatomic, strong) NSArray<AWSIotsitewiseAssetHierarchy *> * _Nullable hierarchies;

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
@property (nonatomic, strong) AWSIotsitewiseAssetStatus * _Nullable status;

@end

/**
 <p>Contains an asset attribute property. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html#attributes">Attributes</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@interface AWSIotsitewiseAttribute : AWSModel


/**
 <p>The default value of the asset model property attribute. All assets that you create from the asset model contain this attribute value. You can update an attribute's value after you create an asset. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/update-attribute-values.html">Updating Attribute Values</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultValue;

@end

/**
 
 */
@interface AWSIotsitewiseBatchAssociateProjectAssetsRequest : AWSRequest


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
@interface AWSIotsitewiseBatchAssociateProjectAssetsResponse : AWSModel


/**
 <p>A list of associated error information, if any.</p>
 */
@property (nonatomic, strong) NSArray<AWSIotsitewiseAssetErrorDetails *> * _Nullable errors;

@end

/**
 
 */
@interface AWSIotsitewiseBatchDisassociateProjectAssetsRequest : AWSRequest


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
@interface AWSIotsitewiseBatchDisassociateProjectAssetsResponse : AWSModel


/**
 <p>A list of associated error information, if any.</p>
 */
@property (nonatomic, strong) NSArray<AWSIotsitewiseAssetErrorDetails *> * _Nullable errors;

@end

/**
 <p>Contains error information from updating a batch of asset property values.</p>
 Required parameters: [errorCode, errorMessage, timestamps]
 */
@interface AWSIotsitewiseBatchPutAssetPropertyError : AWSModel


/**
 <p>The error code.</p>
 */
@property (nonatomic, assign) AWSIotsitewiseBatchPutAssetPropertyValueErrorCode errorCode;

/**
 <p>The associated error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>A list of timestamps for each error, if any.</p>
 */
@property (nonatomic, strong) NSArray<AWSIotsitewiseTimeInNanos *> * _Nullable timestamps;

@end

/**
 <p>Contains error information for asset property value entries that are associated with the <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchPutAssetPropertyValue.html">BatchPutAssetPropertyValue</a> API.</p>
 Required parameters: [entryId, errors]
 */
@interface AWSIotsitewiseBatchPutAssetPropertyErrorEntry : AWSModel


/**
 <p>The ID of the failed entry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entryId;

/**
 <p>The list of update property value errors.</p>
 */
@property (nonatomic, strong) NSArray<AWSIotsitewiseBatchPutAssetPropertyError *> * _Nullable errors;

@end

/**
 
 */
@interface AWSIotsitewiseBatchPutAssetPropertyValueRequest : AWSRequest


/**
 <p>The list of asset property value entries for the batch put request. You can specify up to 10 entries per request.</p>
 */
@property (nonatomic, strong) NSArray<AWSIotsitewisePutAssetPropertyValueEntry *> * _Nullable entries;

@end

/**
 
 */
@interface AWSIotsitewiseBatchPutAssetPropertyValueResponse : AWSModel


/**
 <p>A list of the errors (if any) associated with the batch put request. Each error entry contains the <code>entryId</code> of the entry that failed.</p>
 */
@property (nonatomic, strong) NSArray<AWSIotsitewiseBatchPutAssetPropertyErrorEntry *> * _Nullable errorEntries;

@end

/**
 
 */
@interface AWSIotsitewiseCreateAccessPolicyRequest : AWSRequest


/**
 <p>The identity for this access policy. Choose either a <code>user</code> or a <code>group</code> but not both.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseIdentity * _Nullable accessPolicyIdentity;

/**
 <p>The permission level for this access policy. Note that a project <code>ADMINISTRATOR</code> is also known as a project owner.</p>
 */
@property (nonatomic, assign) AWSIotsitewisePermission accessPolicyPermission;

/**
 <p>The AWS IoT SiteWise Monitor resource for this access policy. Choose either <code>portal</code> or <code>project</code> but not both.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseResource * _Nullable accessPolicyResource;

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
@interface AWSIotsitewiseCreateAccessPolicyResponse : AWSModel


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
@interface AWSIotsitewiseCreateAssetModelRequest : AWSRequest


/**
 <p>A description for the asset model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelDescription;

/**
 <p>The hierarchy definitions of the asset model. Each hierarchy specifies an asset model whose assets can be children of any other assets created from this asset model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-hierarchies.html">Asset Hierarchies</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>You can specify up to 10 hierarchies per asset model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSIotsitewiseAssetModelHierarchyDefinition *> * _Nullable assetModelHierarchies;

/**
 <p>A unique, friendly name for the asset model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelName;

/**
 <p>The property definitions of the asset model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html">Asset Properties</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>You can specify up to 200 properties per asset model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSIotsitewiseAssetModelPropertyDefinition *> * _Nullable assetModelProperties;

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
@interface AWSIotsitewiseCreateAssetModelResponse : AWSModel


/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the asset model, which has the following format.</p><p><code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset-model/${AssetModelId}</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelArn;

/**
 <p>The ID of the asset model. You can use this ID when you call other AWS IoT SiteWise APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelId;

/**
 <p>The status of the asset model, which contains a state (<code>CREATING</code> after successfully calling this operation) and any error message.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseAssetModelStatus * _Nullable assetModelStatus;

@end

/**
 
 */
@interface AWSIotsitewiseCreateAssetRequest : AWSRequest


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
@interface AWSIotsitewiseCreateAssetResponse : AWSModel


/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the asset, which has the following format.</p><p><code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset/${AssetId}</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable assetArn;

/**
 <p>The ID of the asset. This ID uniquely identifies the asset within AWS IoT SiteWise and can be used with other AWS IoT SiteWise APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>The status of the asset, which contains a state (<code>CREATING</code> after successfully calling this operation) and any error message.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseAssetStatus * _Nullable assetStatus;

@end

/**
 
 */
@interface AWSIotsitewiseCreateDashboardRequest : AWSRequest


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
@interface AWSIotsitewiseCreateDashboardResponse : AWSModel


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
@interface AWSIotsitewiseCreateGatewayRequest : AWSRequest


/**
 <p>A unique, friendly name for the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayName;

/**
 <p>The gateway's platform. You can only specify one platform in a gateway.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseGatewayPlatform * _Nullable gatewayPlatform;

/**
 <p>A list of key-value pairs that contain metadata for the gateway. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSIotsitewiseCreateGatewayResponse : AWSModel


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
@interface AWSIotsitewiseCreatePortalRequest : AWSRequest


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
@property (nonatomic, strong) AWSIotsitewiseImageFile * _Nullable portalLogoImageFile;

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
@interface AWSIotsitewiseCreatePortalResponse : AWSModel


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
 <p>The status of the portal, which contains a state (<code>CREATING</code> after successfully calling this operation) and any error message.</p>
 */
@property (nonatomic, strong) AWSIotsitewisePortalStatus * _Nullable portalStatus;

/**
 <p>The associated AWS SSO application Id.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ssoApplicationId;

@end

/**
 
 */
@interface AWSIotsitewiseCreateProjectRequest : AWSRequest


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
@interface AWSIotsitewiseCreateProjectResponse : AWSModel


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
@interface AWSIotsitewiseDashboardSummary : AWSModel


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
@interface AWSIotsitewiseDeleteAccessPolicyRequest : AWSRequest


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
@interface AWSIotsitewiseDeleteAccessPolicyResponse : AWSModel


@end

/**
 
 */
@interface AWSIotsitewiseDeleteAssetModelRequest : AWSRequest


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
@interface AWSIotsitewiseDeleteAssetModelResponse : AWSModel


/**
 <p>The status of the asset model, which contains a state (<code>DELETING</code> after successfully calling this operation) and any error message.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseAssetModelStatus * _Nullable assetModelStatus;

@end

/**
 
 */
@interface AWSIotsitewiseDeleteAssetRequest : AWSRequest


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
@interface AWSIotsitewiseDeleteAssetResponse : AWSModel


/**
 <p>The status of the asset, which contains a state (<code>DELETING</code> after successfully calling this operation) and any error message.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseAssetStatus * _Nullable assetStatus;

@end

/**
 
 */
@interface AWSIotsitewiseDeleteDashboardRequest : AWSRequest


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
@interface AWSIotsitewiseDeleteDashboardResponse : AWSModel


@end

/**
 
 */
@interface AWSIotsitewiseDeleteGatewayRequest : AWSRequest


/**
 <p>The ID of the gateway to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayId;

@end

/**
 
 */
@interface AWSIotsitewiseDeletePortalRequest : AWSRequest


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
@interface AWSIotsitewiseDeletePortalResponse : AWSModel


/**
 <p>The status of the portal, which contains a state (<code>DELETING</code> after successfully calling this operation) and any error message.</p>
 */
@property (nonatomic, strong) AWSIotsitewisePortalStatus * _Nullable portalStatus;

@end

/**
 
 */
@interface AWSIotsitewiseDeleteProjectRequest : AWSRequest


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
@interface AWSIotsitewiseDeleteProjectResponse : AWSModel


@end

/**
 
 */
@interface AWSIotsitewiseDescribeAccessPolicyRequest : AWSRequest


/**
 <p>The ID of the access policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessPolicyId;

@end

/**
 
 */
@interface AWSIotsitewiseDescribeAccessPolicyResponse : AWSModel


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
@property (nonatomic, strong) AWSIotsitewiseIdentity * _Nullable accessPolicyIdentity;

/**
 <p>The date the access policy was last updated, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable accessPolicyLastUpdateDate;

/**
 <p>The access policy permission. Note that a project <code>ADMINISTRATOR</code> is also known as a project owner.</p>
 */
@property (nonatomic, assign) AWSIotsitewisePermission accessPolicyPermission;

/**
 <p>The AWS IoT SiteWise Monitor resource (portal or project) to which this access policy provides access.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseResource * _Nullable accessPolicyResource;

@end

/**
 
 */
@interface AWSIotsitewiseDescribeAssetModelRequest : AWSRequest


/**
 <p>The ID of the asset model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelId;

@end

/**
 
 */
@interface AWSIotsitewiseDescribeAssetModelResponse : AWSModel


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
@property (nonatomic, strong) NSArray<AWSIotsitewiseAssetModelHierarchy *> * _Nullable assetModelHierarchies;

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
@property (nonatomic, strong) NSArray<AWSIotsitewiseAssetModelProperty *> * _Nullable assetModelProperties;

/**
 <p>The current status of the asset model, which contains a state and any error message.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseAssetModelStatus * _Nullable assetModelStatus;

@end

/**
 
 */
@interface AWSIotsitewiseDescribeAssetPropertyRequest : AWSRequest


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
@interface AWSIotsitewiseDescribeAssetPropertyResponse : AWSModel


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
@property (nonatomic, strong) AWSIotsitewiseProperty * _Nullable assetProperty;

@end

/**
 
 */
@interface AWSIotsitewiseDescribeAssetRequest : AWSRequest


/**
 <p>The ID of the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

@end

/**
 
 */
@interface AWSIotsitewiseDescribeAssetResponse : AWSModel


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
@property (nonatomic, strong) NSArray<AWSIotsitewiseAssetHierarchy *> * _Nullable assetHierarchies;

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
@property (nonatomic, strong) NSArray<AWSIotsitewiseAssetProperty *> * _Nullable assetProperties;

/**
 <p>The current status of the asset, which contains a state and any error message.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseAssetStatus * _Nullable assetStatus;

@end

/**
 
 */
@interface AWSIotsitewiseDescribeDashboardRequest : AWSRequest


/**
 <p>The ID of the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardId;

@end

/**
 
 */
@interface AWSIotsitewiseDescribeDashboardResponse : AWSModel


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
@interface AWSIotsitewiseDescribeGatewayCapabilityConfigurationRequest : AWSRequest


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
@interface AWSIotsitewiseDescribeGatewayCapabilityConfigurationResponse : AWSModel


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
@property (nonatomic, assign) AWSIotsitewiseCapabilitySyncStatus capabilitySyncStatus;

/**
 <p>The ID of the gateway that defines the capability configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayId;

@end

/**
 
 */
@interface AWSIotsitewiseDescribeGatewayRequest : AWSRequest


/**
 <p>The ID of the gateway device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayId;

@end

/**
 
 */
@interface AWSIotsitewiseDescribeGatewayResponse : AWSModel


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
@property (nonatomic, strong) NSArray<AWSIotsitewiseGatewayCapabilitySummary *> * _Nullable gatewayCapabilitySummaries;

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
@property (nonatomic, strong) AWSIotsitewiseGatewayPlatform * _Nullable gatewayPlatform;

/**
 <p>The date the gateway was last updated, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateDate;

@end

/**
 
 */
@interface AWSIotsitewiseDescribeLoggingOptionsRequest : AWSRequest


@end

/**
 
 */
@interface AWSIotsitewiseDescribeLoggingOptionsResponse : AWSModel


/**
 <p>The current logging options.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseLoggingOptions * _Nullable loggingOptions;

@end

/**
 
 */
@interface AWSIotsitewiseDescribePortalRequest : AWSRequest


/**
 <p>The ID of the portal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portalId;

@end

/**
 
 */
@interface AWSIotsitewiseDescribePortalResponse : AWSModel


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
 <p>The portal's logo image, which is available at a URL.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseImageLocation * _Nullable portalLogoImageLocation;

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
@property (nonatomic, strong) AWSIotsitewisePortalStatus * _Nullable portalStatus;

/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the service role that allows the portal's users to access your AWS IoT SiteWise resources on your behalf. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-service-role.html">Using service roles for AWS IoT SiteWise Monitor</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSIotsitewiseDescribeProjectRequest : AWSRequest


/**
 <p>The ID of the project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectId;

@end

/**
 
 */
@interface AWSIotsitewiseDescribeProjectResponse : AWSModel


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
@interface AWSIotsitewiseDisassociateAssetsRequest : AWSRequest


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
@interface AWSIotsitewiseErrorDetails : AWSModel


/**
 <p>The error code.</p>
 */
@property (nonatomic, assign) AWSIotsitewiseErrorCode code;

/**
 <p>The error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Contains expression variable information.</p>
 Required parameters: [name, value]
 */
@interface AWSIotsitewiseExpressionVariable : AWSModel


/**
 <p>The friendly name of the variable to be used in the expression.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The variable that identifies an asset property from which to use values.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseVariableValue * _Nullable value;

@end

/**
 <p>Contains a summary of a gateway capability configuration.</p>
 Required parameters: [capabilityNamespace, capabilitySyncStatus]
 */
@interface AWSIotsitewiseGatewayCapabilitySummary : AWSModel


/**
 <p>The namespace of the capability configuration. For example, if you configure OPC-UA sources from the AWS IoT SiteWise console, your OPC-UA capability configuration has the namespace <code>iotsitewise:opcuacollector:version</code>, where <code>version</code> is a number such as <code>1</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable capabilityNamespace;

/**
 <p>The synchronization status of the capability configuration. The sync status can be one of the following:</p><ul><li><p><code>IN_SYNC</code> – The gateway is running the capability configuration.</p></li><li><p><code>OUT_OF_SYNC</code> – The gateway hasn't received the capability configuration.</p></li><li><p><code>SYNC_FAILED</code> – The gateway rejected the capability configuration.</p></li></ul>
 */
@property (nonatomic, assign) AWSIotsitewiseCapabilitySyncStatus capabilitySyncStatus;

@end

/**
 <p>Contains a gateway's platform information.</p>
 Required parameters: [greengrass]
 */
@interface AWSIotsitewiseGatewayPlatform : AWSModel


/**
 <p>A gateway that runs on AWS IoT Greengrass.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseGreengrass * _Nullable greengrass;

@end

/**
 <p>Contains a summary of a gateway.</p>
 Required parameters: [gatewayId, gatewayName, creationDate, lastUpdateDate]
 */
@interface AWSIotsitewiseGatewaySummary : AWSModel


/**
 <p>The date the gateway was created, in Unix epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>A list of gateway capability summaries that each contain a namespace and status. Each gateway capability defines data sources for the gateway. To retrieve a capability configuration's definition, use <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeGatewayCapabilityConfiguration.html">DescribeGatewayCapabilityConfiguration</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSIotsitewiseGatewayCapabilitySummary *> * _Nullable gatewayCapabilitySummaries;

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
@interface AWSIotsitewiseGetAssetPropertyAggregatesRequest : AWSRequest


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
@property (nonatomic, assign) AWSIotsitewiseTimeOrdering timeOrdering;

@end

/**
 
 */
@interface AWSIotsitewiseGetAssetPropertyAggregatesResponse : AWSModel


/**
 <p>The requested aggregated values.</p>
 */
@property (nonatomic, strong) NSArray<AWSIotsitewiseAggregatedValue *> * _Nullable aggregatedValues;

/**
 <p>The token for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIotsitewiseGetAssetPropertyValueHistoryRequest : AWSRequest


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
@property (nonatomic, assign) AWSIotsitewiseTimeOrdering timeOrdering;

@end

/**
 
 */
@interface AWSIotsitewiseGetAssetPropertyValueHistoryResponse : AWSModel


/**
 <p>The asset property's value history.</p>
 */
@property (nonatomic, strong) NSArray<AWSIotsitewiseAssetPropertyValue *> * _Nullable assetPropertyValueHistory;

/**
 <p>The token for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIotsitewiseGetAssetPropertyValueRequest : AWSRequest


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
@interface AWSIotsitewiseGetAssetPropertyValueResponse : AWSModel


/**
 <p>The current asset property value.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseAssetPropertyValue * _Nullable propertyValue;

@end

/**
 <p>Contains details for a gateway that runs on AWS IoT Greengrass. To create a gateway that runs on AWS IoT Greengrass, you must add the IoT SiteWise connector to a Greengrass group and deploy it. Your Greengrass group must also have permissions to upload data to AWS IoT SiteWise. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/gateway-connector.html">Ingesting data using a gateway</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 Required parameters: [groupArn]
 */
@interface AWSIotsitewiseGreengrass : AWSModel


/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the Greengrass group. For more information about how to find a group's ARN, see <a href="https://docs.aws.amazon.com/greengrass/latest/apireference/listgroups-get.html">ListGroups</a> and <a href="https://docs.aws.amazon.com/greengrass/latest/apireference/getgroup-get.html">GetGroup</a> in the <i>AWS IoT Greengrass API Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupArn;

@end

/**
 <p>Contains information for a group identity in an access policy.</p>
 Required parameters: [id]
 */
@interface AWSIotsitewiseGroupIdentity : AWSModel


/**
 <p>The AWS SSO ID of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>Contains an AWS SSO identity ID for a user or group.</p><note><p>Currently, you can't use AWS APIs to retrieve AWS SSO identity IDs. You can find the AWS SSO identity IDs in the URL of user and group pages in the <a href="https://console.aws.amazon.com/singlesignon">AWS SSO console</a>.</p></note>
 */
@interface AWSIotsitewiseIdentity : AWSModel


/**
 <p>A group identity.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseGroupIdentity * _Nullable group;

/**
 <p>A user identity.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseUserIdentity * _Nullable user;

@end

/**
 <p>Contains an image that is one of the following:</p><ul><li><p>An image file. Choose this option to upload a new image.</p></li><li><p>The ID of an existing image. Choose this option to keep an existing image.</p></li></ul>
 */
@interface AWSIotsitewiseImage : AWSModel


/**
 <p>Contains an image file.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseImageFile * _Nullable file;

/**
 <p>The ID of an existing image. Specify this parameter to keep an existing image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>Contains an image file.</p>
 Required parameters: [data, type]
 */
@interface AWSIotsitewiseImageFile : AWSModel


/**
 <p>The image file contents, represented as a base64-encoded string. The file size must be less than 1 MB.</p>
 */
@property (nonatomic, strong) NSData * _Nullable data;

/**
 <p>The file type of the image.</p>
 */
@property (nonatomic, assign) AWSIotsitewiseImageFileType types;

@end

/**
 <p>Contains an image that is uploaded to AWS IoT SiteWise and available at a URL.</p>
 Required parameters: [id, url]
 */
@interface AWSIotsitewiseImageLocation : AWSModel


/**
 <p>The ID of the image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The URL where the image is available. The URL is valid for 15 minutes so that you can view and download the image</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 
 */
@interface AWSIotsitewiseListAccessPoliciesRequest : AWSRequest


/**
 <p>The ID of the identity. This parameter is required if you specify <code>identityType</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityId;

/**
 <p>The type of identity (user or group). This parameter is required if you specify <code>identityId</code>.</p>
 */
@property (nonatomic, assign) AWSIotsitewiseIdentityType identityType;

/**
 <p>The maximum number of results to be returned per paginated request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to be used for the next set of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the resource. This parameter is required if you specify <code>resourceType</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The type of resource (portal or project). This parameter is required if you specify <code>resourceId</code>.</p>
 */
@property (nonatomic, assign) AWSIotsitewiseResourceType resourceType;

@end

/**
 
 */
@interface AWSIotsitewiseListAccessPoliciesResponse : AWSModel


/**
 <p>A list that summarizes each access policy.</p>
 */
@property (nonatomic, strong) NSArray<AWSIotsitewiseAccessPolicySummary *> * _Nullable accessPolicySummaries;

/**
 <p>The token for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIotsitewiseListAssetModelsRequest : AWSRequest


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
@interface AWSIotsitewiseListAssetModelsResponse : AWSModel


/**
 <p>A list that summarizes each asset model.</p>
 */
@property (nonatomic, strong) NSArray<AWSIotsitewiseAssetModelSummary *> * _Nullable assetModelSummaries;

/**
 <p>The token for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIotsitewiseListAssetsRequest : AWSRequest


/**
 <p>The ID of the asset model by which to filter the list of assets. This parameter is required if you choose <code>ALL</code> for <code>filter</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelId;

/**
 <p>The filter for the requested list of assets. Choose one of the following options. Defaults to <code>ALL</code>.</p><ul><li><p><code>ALL</code> – The list includes all assets for a given asset model ID. The <code>assetModelId</code> parameter is required if you filter by <code>ALL</code>.</p></li><li><p><code>TOP_LEVEL</code> – The list includes only top-level assets in the asset hierarchy tree.</p></li></ul>
 */
@property (nonatomic, assign) AWSIotsitewiseListAssetsFilter filter;

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
@interface AWSIotsitewiseListAssetsResponse : AWSModel


/**
 <p>A list that summarizes each asset.</p>
 */
@property (nonatomic, strong) NSArray<AWSIotsitewiseAssetSummary *> * _Nullable assetSummaries;

/**
 <p>The token for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIotsitewiseListAssociatedAssetsRequest : AWSRequest


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
@interface AWSIotsitewiseListAssociatedAssetsResponse : AWSModel


/**
 <p>A list that summarizes the associated assets.</p>
 */
@property (nonatomic, strong) NSArray<AWSIotsitewiseAssociatedAssetsSummary *> * _Nullable assetSummaries;

/**
 <p>The token for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIotsitewiseListDashboardsRequest : AWSRequest


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
@interface AWSIotsitewiseListDashboardsResponse : AWSModel


/**
 <p>A list that summarizes each dashboard in the project.</p>
 */
@property (nonatomic, strong) NSArray<AWSIotsitewiseDashboardSummary *> * _Nullable dashboardSummaries;

/**
 <p>The token for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIotsitewiseListGatewaysRequest : AWSRequest


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
@interface AWSIotsitewiseListGatewaysResponse : AWSModel


/**
 <p>A list that summarizes each gateway.</p>
 */
@property (nonatomic, strong) NSArray<AWSIotsitewiseGatewaySummary *> * _Nullable gatewaySummaries;

/**
 <p>The token for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIotsitewiseListPortalsRequest : AWSRequest


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
@interface AWSIotsitewiseListPortalsResponse : AWSModel


/**
 <p>The token for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list that summarizes each portal.</p>
 */
@property (nonatomic, strong) NSArray<AWSIotsitewisePortalSummary *> * _Nullable portalSummaries;

@end

/**
 
 */
@interface AWSIotsitewiseListProjectAssetsRequest : AWSRequest


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
@interface AWSIotsitewiseListProjectAssetsResponse : AWSModel


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
@interface AWSIotsitewiseListProjectsRequest : AWSRequest


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
@interface AWSIotsitewiseListProjectsResponse : AWSModel


/**
 <p>The token for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list that summarizes each project in the portal.</p>
 */
@property (nonatomic, strong) NSArray<AWSIotsitewiseProjectSummary *> * _Nullable projectSummaries;

@end

/**
 
 */
@interface AWSIotsitewiseListTagsForResourceRequest : AWSRequest


/**
 <p>The <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a> of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSIotsitewiseListTagsForResourceResponse : AWSModel


/**
 <p>The list of key-value pairs that contain metadata for the resource. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Contains logging options.</p>
 Required parameters: [level]
 */
@interface AWSIotsitewiseLoggingOptions : AWSModel


/**
 <p>The AWS IoT SiteWise logging verbosity level.</p>
 */
@property (nonatomic, assign) AWSIotsitewiseLoggingLevel level;

@end

/**
 <p>Contains an asset measurement property. This structure is empty. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html#measurements">Measurements</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@interface AWSIotsitewiseMeasurement : AWSModel


@end

/**
 <p>Contains an asset metric property. With metrics, you can calculate aggregate functions, such as an average, maximum, or minimum, as specified through an expression. A metric maps several values to a single value (such as a sum).</p><p>The maximum number of dependent/cascading variables used in any one metric calculation is 10. Therefore, a <i>root</i> metric can have up to 10 cascading metrics in its computational dependency tree. Additionally, a metric can only have a data type of <code>DOUBLE</code> and consume properties with data types of <code>INTEGER</code> or <code>DOUBLE</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html#metrics">Metrics</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 Required parameters: [expression, variables, window]
 */
@interface AWSIotsitewiseMetric : AWSModel


/**
 <p>The mathematical expression that defines the metric aggregation function. You can specify up to 10 variables per expression. You can specify up to 10 functions per expression. </p><p>For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expression;

/**
 <p>The list of variables used in the expression.</p>
 */
@property (nonatomic, strong) NSArray<AWSIotsitewiseExpressionVariable *> * _Nullable variables;

/**
 <p>The window (time interval) over which AWS IoT SiteWise computes the metric's aggregation expression. AWS IoT SiteWise computes one data point per <code>window</code>.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseMetricWindow * _Nullable window;

@end

/**
 <p>Contains a time interval window used for data aggregate computations (for example, average, sum, count, and so on).</p>
 */
@interface AWSIotsitewiseMetricWindow : AWSModel


/**
 <p>The tumbling time interval window.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseTumblingWindow * _Nullable tumbling;

@end

/**
 <p>Contains AWS IoT SiteWise Monitor error details.</p>
 */
@interface AWSIotsitewiseMonitorErrorDetails : AWSModel


/**
 <p>The error code.</p>
 */
@property (nonatomic, assign) AWSIotsitewiseMonitorErrorCode code;

/**
 <p>The error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Identifies an AWS IoT SiteWise Monitor portal.</p>
 Required parameters: [id]
 */
@interface AWSIotsitewisePortalResource : AWSModel


/**
 <p>The ID of the portal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>Contains information about the current status of a portal.</p>
 Required parameters: [state]
 */
@interface AWSIotsitewisePortalStatus : AWSModel


/**
 <p>Contains associated error information, if any.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseMonitorErrorDetails * _Nullable error;

/**
 <p>The current state of the portal.</p>
 */
@property (nonatomic, assign) AWSIotsitewisePortalState state;

@end

/**
 <p>Contains a portal summary.</p>
 Required parameters: [id, name, startUrl]
 */
@interface AWSIotsitewisePortalSummary : AWSModel


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
@interface AWSIotsitewiseProjectResource : AWSModel


/**
 <p>The ID of the project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>Contains project summary information.</p>
 Required parameters: [id, name]
 */
@interface AWSIotsitewiseProjectSummary : AWSModel


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
@interface AWSIotsitewiseProperty : AWSModel


/**
 <p>The property alias that identifies the property, such as an OPC-UA server data stream path (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping Industrial Data Streams to Asset Properties</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alias;

/**
 <p>The property data type.</p>
 */
@property (nonatomic, assign) AWSIotsitewisePropertyDataType dataType;

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
@property (nonatomic, strong) AWSIotsitewisePropertyNotification * _Nullable notification;

/**
 <p>The property type (see <code>PropertyType</code>). A property contains one type.</p>
 */
@property (nonatomic, strong) AWSIotsitewisePropertyType * _Nullable types;

/**
 <p>The unit (such as <code>Newtons</code> or <code>RPM</code>) of the asset property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable unit;

@end

/**
 <p>Contains asset property value notification information. When the notification state is enabled, AWS IoT SiteWise publishes property value updates to a unique MQTT topic. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/interact-with-other-services.html">Interacting with Other Services</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 Required parameters: [topic, state]
 */
@interface AWSIotsitewisePropertyNotification : AWSModel


/**
 <p>The current notification state.</p>
 */
@property (nonatomic, assign) AWSIotsitewisePropertyNotificationState state;

/**
 <p>The MQTT topic to which AWS IoT SiteWise publishes property value update notifications.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topic;

@end

/**
 <p>Contains a property type, which can be one of <code>attribute</code>, <code>measurement</code>, <code>metric</code>, or <code>transform</code>.</p>
 */
@interface AWSIotsitewisePropertyType : AWSModel


/**
 <p>Specifies an asset attribute property. An attribute generally contains static information, such as the serial number of an <a href="https://en.wikipedia.org/wiki/Internet_of_things#Industrial_applications">IIoT</a> wind turbine.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseAttribute * _Nullable attribute;

/**
 <p>Specifies an asset measurement property. A measurement represents a device's raw sensor data stream, such as timestamped temperature values or timestamped power values.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseMeasurement * _Nullable measurement;

/**
 <p>Specifies an asset metric property. A metric contains a mathematical expression that uses aggregate functions to process all input data points over a time interval and output a single data point, such as to calculate the average hourly temperature.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseMetric * _Nullable metric;

/**
 <p>Specifies an asset transform property. A transform contains a mathematical expression that maps a property's data points from one form to another, such as a unit conversion from Celsius to Fahrenheit.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseTransform * _Nullable transform;

@end

/**
 <p>Contains a list of value updates for an asset property in the list of asset entries consumed by the <a href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchPutAssetPropertyValue.html">BatchPutAssetPropertyValue</a> API.</p>
 Required parameters: [entryId, propertyValues]
 */
@interface AWSIotsitewisePutAssetPropertyValueEntry : AWSModel


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
 <p>The list of property values to upload. You can specify up to 10 <code>propertyValues</code> array elements. </p>
 */
@property (nonatomic, strong) NSArray<AWSIotsitewiseAssetPropertyValue *> * _Nullable propertyValues;

@end

/**
 
 */
@interface AWSIotsitewisePutLoggingOptionsRequest : AWSRequest


/**
 <p>The logging options to set.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseLoggingOptions * _Nullable loggingOptions;

@end

/**
 
 */
@interface AWSIotsitewisePutLoggingOptionsResponse : AWSModel


@end

/**
 <p>Contains an AWS IoT SiteWise Monitor resource ID for a portal or project.</p>
 */
@interface AWSIotsitewiseResource : AWSModel


/**
 <p>A portal resource.</p>
 */
@property (nonatomic, strong) AWSIotsitewisePortalResource * _Nullable portal;

/**
 <p>A project resource.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseProjectResource * _Nullable project;

@end

/**
 
 */
@interface AWSIotsitewiseTagResourceRequest : AWSRequest


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
@interface AWSIotsitewiseTagResourceResponse : AWSModel


@end

/**
 <p>Contains a timestamp with optional nanosecond granularity.</p>
 Required parameters: [timeInSeconds]
 */
@interface AWSIotsitewiseTimeInNanos : AWSModel


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
@interface AWSIotsitewiseTransform : AWSModel


/**
 <p>The mathematical expression that defines the transformation function. You can specify up to 10 variables per expression. You can specify up to 10 functions per expression. </p><p>For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expression;

/**
 <p>The list of variables used in the expression.</p>
 */
@property (nonatomic, strong) NSArray<AWSIotsitewiseExpressionVariable *> * _Nullable variables;

@end

/**
 <p>Contains a tumbling window, which is a repeating fixed-sized, non-overlapping, and contiguous time interval. This window is used in metric and aggregation computations.</p>
 Required parameters: [interval]
 */
@interface AWSIotsitewiseTumblingWindow : AWSModel


/**
 <p>The time interval for the tumbling window. Note that <code>w</code> represents weeks, <code>d</code> represents days, <code>h</code> represents hours, and <code>m</code> represents minutes. AWS IoT SiteWise computes the <code>1w</code> interval the end of Sunday at midnight each week (UTC), the <code>1d</code> interval at the end of each day at midnight (UTC), the <code>1h</code> interval at the end of each hour, and so on. </p><p>When AWS IoT SiteWise aggregates data points for metric computations, the start of each interval is exclusive and the end of each interval is inclusive. AWS IoT SiteWise places the computed data point at the end of the interval.</p>
 */
@property (nonatomic, strong) NSString * _Nullable interval;

@end

/**
 
 */
@interface AWSIotsitewiseUntagResourceRequest : AWSRequest


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
@interface AWSIotsitewiseUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSIotsitewiseUpdateAccessPolicyRequest : AWSRequest


/**
 <p>The ID of the access policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessPolicyId;

/**
 <p>The identity for this access policy. Choose either a <code>user</code> or a <code>group</code> but not both.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseIdentity * _Nullable accessPolicyIdentity;

/**
 <p>The permission level for this access policy. Note that a project <code>ADMINISTRATOR</code> is also known as a project owner.</p>
 */
@property (nonatomic, assign) AWSIotsitewisePermission accessPolicyPermission;

/**
 <p>The AWS IoT SiteWise Monitor resource for this access policy. Choose either <code>portal</code> or <code>project</code> but not both.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseResource * _Nullable accessPolicyResource;

/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

@end

/**
 
 */
@interface AWSIotsitewiseUpdateAccessPolicyResponse : AWSModel


@end

/**
 
 */
@interface AWSIotsitewiseUpdateAssetModelRequest : AWSRequest


/**
 <p>A description for the asset model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetModelDescription;

/**
 <p>The updated hierarchy definitions of the asset model. Each hierarchy specifies an asset model whose assets can be children of any other assets created from this asset model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-hierarchies.html">Asset Hierarchies</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>You can specify up to 10 hierarchies per asset model. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a> in the <i>AWS IoT SiteWise User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSIotsitewiseAssetModelHierarchy *> * _Nullable assetModelHierarchies;

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
@property (nonatomic, strong) NSArray<AWSIotsitewiseAssetModelProperty *> * _Nullable assetModelProperties;

/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

@end

/**
 
 */
@interface AWSIotsitewiseUpdateAssetModelResponse : AWSModel


/**
 <p>The status of the asset model, which contains a state (<code>UPDATING</code> after successfully calling this operation) and any error message.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseAssetModelStatus * _Nullable assetModelStatus;

@end

/**
 
 */
@interface AWSIotsitewiseUpdateAssetPropertyRequest : AWSRequest


/**
 <p>The ID of the asset to be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>A unique case-sensitive identifier that you can provide to ensure the idempotency of the request. Don't reuse this client token if a new idempotent request is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The property alias that identifies the property, such as an OPC-UA server data stream path (for example, <code>/company/windfarm/3/turbine/7/temperature</code>). For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping Industrial Data Streams to Asset Properties</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>If you omit this parameter, the alias is removed from the property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable propertyAlias;

/**
 <p>The ID of the asset property to be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable propertyId;

/**
 <p>The MQTT notification state (enabled or disabled) for this asset property. When the notification state is enabled, AWS IoT SiteWise publishes property value updates to a unique MQTT topic. For more information, see <a href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/interact-with-other-services.html">Interacting with Other Services</a> in the <i>AWS IoT SiteWise User Guide</i>.</p><p>If you omit this parameter, the notification state is set to <code>DISABLED</code>.</p>
 */
@property (nonatomic, assign) AWSIotsitewisePropertyNotificationState propertyNotificationState;

@end

/**
 
 */
@interface AWSIotsitewiseUpdateAssetRequest : AWSRequest


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
@interface AWSIotsitewiseUpdateAssetResponse : AWSModel


/**
 <p>The status of the asset, which contains a state (<code>UPDATING</code> after successfully calling this operation) and any error message.</p>
 */
@property (nonatomic, strong) AWSIotsitewiseAssetStatus * _Nullable assetStatus;

@end

/**
 
 */
@interface AWSIotsitewiseUpdateDashboardRequest : AWSRequest


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
@interface AWSIotsitewiseUpdateDashboardResponse : AWSModel


@end

/**
 
 */
@interface AWSIotsitewiseUpdateGatewayCapabilityConfigurationRequest : AWSRequest


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
@interface AWSIotsitewiseUpdateGatewayCapabilityConfigurationResponse : AWSModel


/**
 <p>The namespace of the gateway capability.</p>
 */
@property (nonatomic, strong) NSString * _Nullable capabilityNamespace;

/**
 <p>The synchronization status of the capability configuration. The sync status can be one of the following:</p><ul><li><p><code>IN_SYNC</code> – The gateway is running the capability configuration.</p></li><li><p><code>OUT_OF_SYNC</code> – The gateway hasn't received the capability configuration.</p></li><li><p><code>SYNC_FAILED</code> – The gateway rejected the capability configuration.</p></li></ul><p>After you update a capability configuration, its sync status is <code>OUT_OF_SYNC</code> until the gateway receives and applies or rejects the updated configuration.</p>
 */
@property (nonatomic, assign) AWSIotsitewiseCapabilitySyncStatus capabilitySyncStatus;

@end

/**
 
 */
@interface AWSIotsitewiseUpdateGatewayRequest : AWSRequest


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
@interface AWSIotsitewiseUpdatePortalRequest : AWSRequest


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
 <p>Contains an image that is one of the following:</p><ul><li><p>An image file. Choose this option to upload a new image.</p></li><li><p>The ID of an existing image. Choose this option to keep an existing image.</p></li></ul>
 */
@property (nonatomic, strong) AWSIotsitewiseImage * _Nullable portalLogoImage;

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
@interface AWSIotsitewiseUpdatePortalResponse : AWSModel


/**
 <p>The status of the portal, which contains a state (<code>UPDATING</code> after successfully calling this operation) and any error message.</p>
 */
@property (nonatomic, strong) AWSIotsitewisePortalStatus * _Nullable portalStatus;

@end

/**
 
 */
@interface AWSIotsitewiseUpdateProjectRequest : AWSRequest


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
@interface AWSIotsitewiseUpdateProjectResponse : AWSModel


@end

/**
 <p>Contains information for a user identity in an access policy.</p>
 Required parameters: [id]
 */
@interface AWSIotsitewiseUserIdentity : AWSModel


/**
 <p>The AWS SSO ID of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>Identifies a property value used in an expression.</p>
 Required parameters: [propertyId]
 */
@interface AWSIotsitewiseVariableValue : AWSModel


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
@interface AWSIotsitewiseVariant : AWSModel


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
