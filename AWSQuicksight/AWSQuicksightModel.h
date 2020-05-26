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

FOUNDATION_EXPORT NSString *const AWSQuicksightErrorDomain;

typedef NS_ENUM(NSInteger, AWSQuicksightErrorType) {
    AWSQuicksightErrorUnknown,
    AWSQuicksightErrorAccessDenied,
    AWSQuicksightErrorConcurrentUpdating,
    AWSQuicksightErrorConflict,
    AWSQuicksightErrorDomainNotWhitelisted,
    AWSQuicksightErrorIdentityTypeNotSupported,
    AWSQuicksightErrorInternalFailure,
    AWSQuicksightErrorInvalidNextToken,
    AWSQuicksightErrorInvalidParameterValue,
    AWSQuicksightErrorLimitExceeded,
    AWSQuicksightErrorPreconditionNotMet,
    AWSQuicksightErrorQuickSightUserNotFound,
    AWSQuicksightErrorResourceExists,
    AWSQuicksightErrorResourceNotFound,
    AWSQuicksightErrorResourceUnavailable,
    AWSQuicksightErrorSessionLifetimeInMinutesInvalid,
    AWSQuicksightErrorThrottling,
    AWSQuicksightErrorUnsupportedUserEdition,
};

typedef NS_ENUM(NSInteger, AWSQuicksightAssignmentStatus) {
    AWSQuicksightAssignmentStatusUnknown,
    AWSQuicksightAssignmentStatusEnabled,
    AWSQuicksightAssignmentStatusDraft,
    AWSQuicksightAssignmentStatusDisabled,
};

typedef NS_ENUM(NSInteger, AWSQuicksightColumnDataType) {
    AWSQuicksightColumnDataTypeUnknown,
    AWSQuicksightColumnDataTypeString,
    AWSQuicksightColumnDataTypeInteger,
    AWSQuicksightColumnDataTypeDecimal,
    AWSQuicksightColumnDataTypeDatetime,
};

typedef NS_ENUM(NSInteger, AWSQuicksightDashboardBehavior) {
    AWSQuicksightDashboardBehaviorUnknown,
    AWSQuicksightDashboardBehaviorEnabled,
    AWSQuicksightDashboardBehaviorDisabled,
};

typedef NS_ENUM(NSInteger, AWSQuicksightDashboardErrorType) {
    AWSQuicksightDashboardErrorTypeUnknown,
    AWSQuicksightDashboardErrorTypeAccessDenied,
    AWSQuicksightDashboardErrorTypeSourceNotFound,
    AWSQuicksightDashboardErrorTypeDataSetNotFound,
    AWSQuicksightDashboardErrorTypeInternalFailure,
    AWSQuicksightDashboardErrorTypeParameterValueIncompatible,
    AWSQuicksightDashboardErrorTypeParameterTypeInvalid,
    AWSQuicksightDashboardErrorTypeParameterNotFound,
    AWSQuicksightDashboardErrorTypeColumnTypeMismatch,
    AWSQuicksightDashboardErrorTypeColumnGeographicRoleMismatch,
    AWSQuicksightDashboardErrorTypeColumnReplacementMissing,
};

typedef NS_ENUM(NSInteger, AWSQuicksightDashboardFilterAttribute) {
    AWSQuicksightDashboardFilterAttributeUnknown,
    AWSQuicksightDashboardFilterAttributeQuicksightUser,
};

typedef NS_ENUM(NSInteger, AWSQuicksightDashboardUIState) {
    AWSQuicksightDashboardUIStateUnknown,
    AWSQuicksightDashboardUIStateExpanded,
    AWSQuicksightDashboardUIStateCollapsed,
};

typedef NS_ENUM(NSInteger, AWSQuicksightDataSetImportMode) {
    AWSQuicksightDataSetImportModeUnknown,
    AWSQuicksightDataSetImportModeSpice,
    AWSQuicksightDataSetImportModeDirectQuery,
};

typedef NS_ENUM(NSInteger, AWSQuicksightDataSourceErrorInfoType) {
    AWSQuicksightDataSourceErrorInfoTypeUnknown,
    AWSQuicksightDataSourceErrorInfoTypeTimeout,
    AWSQuicksightDataSourceErrorInfoTypeEngineVersionNotSupported,
    AWSQuicksightDataSourceErrorInfoTypeUnknownHost,
    AWSQuicksightDataSourceErrorInfoTypeGenericSqlFailure,
    AWSQuicksightDataSourceErrorInfoTypeConflict,
};

typedef NS_ENUM(NSInteger, AWSQuicksightDataSourceType) {
    AWSQuicksightDataSourceTypeUnknown,
    AWSQuicksightDataSourceTypeAdobeAnalytics,
    AWSQuicksightDataSourceTypeAmazonElasticsearch,
    AWSQuicksightDataSourceTypeAthena,
    AWSQuicksightDataSourceTypeAurora,
    AWSQuicksightDataSourceTypeAuroraPostgresql,
    AWSQuicksightDataSourceTypeAwsIotAnalytics,
    AWSQuicksightDataSourceTypeGithub,
    AWSQuicksightDataSourceTypeJira,
    AWSQuicksightDataSourceTypeMariadb,
    AWSQuicksightDataSourceTypeMysql,
    AWSQuicksightDataSourceTypePostgresql,
    AWSQuicksightDataSourceTypePresto,
    AWSQuicksightDataSourceTypeRedshift,
    AWSQuicksightDataSourceTypeS3,
    AWSQuicksightDataSourceTypeSalesforce,
    AWSQuicksightDataSourceTypeServicenow,
    AWSQuicksightDataSourceTypeSnowflake,
    AWSQuicksightDataSourceTypeSpark,
    AWSQuicksightDataSourceTypeSqlserver,
    AWSQuicksightDataSourceTypeTeradata,
    AWSQuicksightDataSourceTypeTwitter,
};

typedef NS_ENUM(NSInteger, AWSQuicksightExceptionResourceType) {
    AWSQuicksightExceptionResourceTypeUnknown,
    AWSQuicksightExceptionResourceTypeUser,
    AWSQuicksightExceptionResourceTypeGroup,
    AWSQuicksightExceptionResourceTypeNamespace,
    AWSQuicksightExceptionResourceTypeAccountSettings,
    AWSQuicksightExceptionResourceTypeIampolicyAssignment,
    AWSQuicksightExceptionResourceTypeDataSource,
    AWSQuicksightExceptionResourceTypeDataSet,
    AWSQuicksightExceptionResourceTypeVpcConnection,
    AWSQuicksightExceptionResourceTypeIngestion,
};

typedef NS_ENUM(NSInteger, AWSQuicksightFileFormat) {
    AWSQuicksightFileFormatUnknown,
    AWSQuicksightFileFormatCsv,
    AWSQuicksightFileFormatTsv,
    AWSQuicksightFileFormatClf,
    AWSQuicksightFileFormatElf,
    AWSQuicksightFileFormatXlsx,
    AWSQuicksightFileFormatJson,
};

typedef NS_ENUM(NSInteger, AWSQuicksightFilterOperator) {
    AWSQuicksightFilterOperatorUnknown,
    AWSQuicksightFilterOperatorStringEquals,
};

typedef NS_ENUM(NSInteger, AWSQuicksightGeoSpatialCountryCode) {
    AWSQuicksightGeoSpatialCountryCodeUnknown,
    AWSQuicksightGeoSpatialCountryCodeUs,
};

typedef NS_ENUM(NSInteger, AWSQuicksightGeoSpatialDataRole) {
    AWSQuicksightGeoSpatialDataRoleUnknown,
    AWSQuicksightGeoSpatialDataRoleCountry,
    AWSQuicksightGeoSpatialDataRoleState,
    AWSQuicksightGeoSpatialDataRoleCounty,
    AWSQuicksightGeoSpatialDataRoleCity,
    AWSQuicksightGeoSpatialDataRolePostcode,
    AWSQuicksightGeoSpatialDataRoleLongitude,
    AWSQuicksightGeoSpatialDataRoleLatitude,
};

typedef NS_ENUM(NSInteger, AWSQuicksightIdentityType) {
    AWSQuicksightIdentityTypeUnknown,
    AWSQuicksightIdentityTypeIam,
    AWSQuicksightIdentityTypeQuicksight,
};

typedef NS_ENUM(NSInteger, AWSQuicksightIngestionErrorType) {
    AWSQuicksightIngestionErrorTypeUnknown,
    AWSQuicksightIngestionErrorTypeFailureToAssumeRole,
    AWSQuicksightIngestionErrorTypeIngestionSuperseded,
    AWSQuicksightIngestionErrorTypeIngestionCanceled,
    AWSQuicksightIngestionErrorTypeDataSetDeleted,
    AWSQuicksightIngestionErrorTypeDataSetNotSpice,
    AWSQuicksightIngestionErrorTypeS3UploadedFileDeleted,
    AWSQuicksightIngestionErrorTypeS3ManifestError,
    AWSQuicksightIngestionErrorTypeDataToleranceException,
    AWSQuicksightIngestionErrorTypeSpiceTableNotFound,
    AWSQuicksightIngestionErrorTypeDataSetSizeLimitExceeded,
    AWSQuicksightIngestionErrorTypeRowSizeLimitExceeded,
    AWSQuicksightIngestionErrorTypeAccountCapacityLimitExceeded,
    AWSQuicksightIngestionErrorTypeCustomerError,
    AWSQuicksightIngestionErrorTypeDataSourceNotFound,
    AWSQuicksightIngestionErrorTypeIamRoleNotAvailable,
    AWSQuicksightIngestionErrorTypeConnectionFailure,
    AWSQuicksightIngestionErrorTypeSqlTableNotFound,
    AWSQuicksightIngestionErrorTypePermissionDenied,
    AWSQuicksightIngestionErrorTypeSslCertificateValidationFailure,
    AWSQuicksightIngestionErrorTypeOauthTokenFailure,
    AWSQuicksightIngestionErrorTypeSourceApiLimitExceededFailure,
    AWSQuicksightIngestionErrorTypePasswordAuthenticationFailure,
    AWSQuicksightIngestionErrorTypeSqlSchemaMismatchError,
    AWSQuicksightIngestionErrorTypeInvalidDateFormat,
    AWSQuicksightIngestionErrorTypeInvalidDataprepSyntax,
    AWSQuicksightIngestionErrorTypeSourceResourceLimitExceeded,
    AWSQuicksightIngestionErrorTypeSqlInvalidParameterValue,
    AWSQuicksightIngestionErrorTypeQueryTimeout,
    AWSQuicksightIngestionErrorTypeSqlNumericOverflow,
    AWSQuicksightIngestionErrorTypeUnresolvableHost,
    AWSQuicksightIngestionErrorTypeUnroutableHost,
    AWSQuicksightIngestionErrorTypeSqlException,
    AWSQuicksightIngestionErrorTypeS3FileInaccessible,
    AWSQuicksightIngestionErrorTypeIotFileNotFound,
    AWSQuicksightIngestionErrorTypeIotDataSetFileEmpty,
    AWSQuicksightIngestionErrorTypeInvalidDataSourceConfig,
    AWSQuicksightIngestionErrorTypeDataSourceAuthFailed,
    AWSQuicksightIngestionErrorTypeDataSourceConnectionFailed,
    AWSQuicksightIngestionErrorTypeFailureToProcessJsonFile,
    AWSQuicksightIngestionErrorTypeInternalServiceError,
};

typedef NS_ENUM(NSInteger, AWSQuicksightIngestionRequestSource) {
    AWSQuicksightIngestionRequestSourceUnknown,
    AWSQuicksightIngestionRequestSourceManual,
    AWSQuicksightIngestionRequestSourceScheduled,
};

typedef NS_ENUM(NSInteger, AWSQuicksightIngestionRequestType) {
    AWSQuicksightIngestionRequestTypeUnknown,
    AWSQuicksightIngestionRequestTypeInitialIngestion,
    AWSQuicksightIngestionRequestTypeEdit,
    AWSQuicksightIngestionRequestTypeIncrementalRefresh,
    AWSQuicksightIngestionRequestTypeFullRefresh,
};

typedef NS_ENUM(NSInteger, AWSQuicksightIngestionStatus) {
    AWSQuicksightIngestionStatusUnknown,
    AWSQuicksightIngestionStatusInitialized,
    AWSQuicksightIngestionStatusQueued,
    AWSQuicksightIngestionStatusRunning,
    AWSQuicksightIngestionStatusFailed,
    AWSQuicksightIngestionStatusCompleted,
    AWSQuicksightIngestionStatusCancelled,
};

typedef NS_ENUM(NSInteger, AWSQuicksightInputColumnDataType) {
    AWSQuicksightInputColumnDataTypeUnknown,
    AWSQuicksightInputColumnDataTypeString,
    AWSQuicksightInputColumnDataTypeInteger,
    AWSQuicksightInputColumnDataTypeDecimal,
    AWSQuicksightInputColumnDataTypeDatetime,
    AWSQuicksightInputColumnDataTypeBit,
    AWSQuicksightInputColumnDataTypeBoolean,
    AWSQuicksightInputColumnDataTypeJson,
};

typedef NS_ENUM(NSInteger, AWSQuicksightJoinType) {
    AWSQuicksightJoinTypeUnknown,
    AWSQuicksightJoinTypeInner,
    AWSQuicksightJoinTypeOuter,
    AWSQuicksightJoinTypeLeft,
    AWSQuicksightJoinTypeRight,
};

typedef NS_ENUM(NSInteger, AWSQuicksightResourceStatus) {
    AWSQuicksightResourceStatusUnknown,
    AWSQuicksightResourceStatusCreationInProgress,
    AWSQuicksightResourceStatusCreationSuccessful,
    AWSQuicksightResourceStatusCreationFailed,
    AWSQuicksightResourceStatusUpdateInProgress,
    AWSQuicksightResourceStatusUpdateSuccessful,
    AWSQuicksightResourceStatusUpdateFailed,
};

typedef NS_ENUM(NSInteger, AWSQuicksightRowLevelPermissionPolicy) {
    AWSQuicksightRowLevelPermissionPolicyUnknown,
    AWSQuicksightRowLevelPermissionPolicyGrantAccess,
    AWSQuicksightRowLevelPermissionPolicyDenyAccess,
};

typedef NS_ENUM(NSInteger, AWSQuicksightTemplateErrorType) {
    AWSQuicksightTemplateErrorTypeUnknown,
    AWSQuicksightTemplateErrorTypeSourceNotFound,
    AWSQuicksightTemplateErrorTypeDataSetNotFound,
    AWSQuicksightTemplateErrorTypeInternalFailure,
};

typedef NS_ENUM(NSInteger, AWSQuicksightTextQualifier) {
    AWSQuicksightTextQualifierUnknown,
    AWSQuicksightTextQualifierDoubleQuote,
    AWSQuicksightTextQualifierSingleQuote,
};

typedef NS_ENUM(NSInteger, AWSQuicksightUserRole) {
    AWSQuicksightUserRoleUnknown,
    AWSQuicksightUserRoleAdmin,
    AWSQuicksightUserRoleAuthor,
    AWSQuicksightUserRoleReader,
    AWSQuicksightUserRoleRestrictedAuthor,
    AWSQuicksightUserRoleRestrictedReader,
};

@class AWSQuicksightActiveIAMPolicyAssignment;
@class AWSQuicksightAdHocFilteringOption;
@class AWSQuicksightAmazonElasticsearchParameters;
@class AWSQuicksightAthenaParameters;
@class AWSQuicksightAuroraParameters;
@class AWSQuicksightAuroraPostgreSqlParameters;
@class AWSQuicksightAwsIotAnalyticsParameters;
@class AWSQuicksightCalculatedColumn;
@class AWSQuicksightCancelIngestionRequest;
@class AWSQuicksightCancelIngestionResponse;
@class AWSQuicksightCastColumnTypeOperation;
@class AWSQuicksightColumnGroup;
@class AWSQuicksightColumnGroupColumnSchema;
@class AWSQuicksightColumnGroupSchema;
@class AWSQuicksightColumnSchema;
@class AWSQuicksightColumnTag;
@class AWSQuicksightCreateColumnsOperation;
@class AWSQuicksightCreateDashboardRequest;
@class AWSQuicksightCreateDashboardResponse;
@class AWSQuicksightCreateDataSetRequest;
@class AWSQuicksightCreateDataSetResponse;
@class AWSQuicksightCreateDataSourceRequest;
@class AWSQuicksightCreateDataSourceResponse;
@class AWSQuicksightCreateGroupMembershipRequest;
@class AWSQuicksightCreateGroupMembershipResponse;
@class AWSQuicksightCreateGroupRequest;
@class AWSQuicksightCreateGroupResponse;
@class AWSQuicksightCreateIAMPolicyAssignmentRequest;
@class AWSQuicksightCreateIAMPolicyAssignmentResponse;
@class AWSQuicksightCreateIngestionRequest;
@class AWSQuicksightCreateIngestionResponse;
@class AWSQuicksightCreateTemplateAliasRequest;
@class AWSQuicksightCreateTemplateAliasResponse;
@class AWSQuicksightCreateTemplateRequest;
@class AWSQuicksightCreateTemplateResponse;
@class AWSQuicksightCredentialPair;
@class AWSQuicksightCustomSql;
@class AWSQuicksightDashboard;
@class AWSQuicksightDashboardError;
@class AWSQuicksightDashboardPublishOptions;
@class AWSQuicksightDashboardSearchFilter;
@class AWSQuicksightDashboardSourceEntity;
@class AWSQuicksightDashboardSourceTemplate;
@class AWSQuicksightDashboardSummary;
@class AWSQuicksightDashboardVersion;
@class AWSQuicksightDashboardVersionSummary;
@class AWSQuicksightDataSet;
@class AWSQuicksightDataSetConfiguration;
@class AWSQuicksightDataSetReference;
@class AWSQuicksightDataSetSchema;
@class AWSQuicksightDataSetSummary;
@class AWSQuicksightDataSource;
@class AWSQuicksightDataSourceCredentials;
@class AWSQuicksightDataSourceErrorInfo;
@class AWSQuicksightDataSourceParameters;
@class AWSQuicksightDateTimeParameter;
@class AWSQuicksightDecimalParameter;
@class AWSQuicksightDeleteDashboardRequest;
@class AWSQuicksightDeleteDashboardResponse;
@class AWSQuicksightDeleteDataSetRequest;
@class AWSQuicksightDeleteDataSetResponse;
@class AWSQuicksightDeleteDataSourceRequest;
@class AWSQuicksightDeleteDataSourceResponse;
@class AWSQuicksightDeleteGroupMembershipRequest;
@class AWSQuicksightDeleteGroupMembershipResponse;
@class AWSQuicksightDeleteGroupRequest;
@class AWSQuicksightDeleteGroupResponse;
@class AWSQuicksightDeleteIAMPolicyAssignmentRequest;
@class AWSQuicksightDeleteIAMPolicyAssignmentResponse;
@class AWSQuicksightDeleteTemplateAliasRequest;
@class AWSQuicksightDeleteTemplateAliasResponse;
@class AWSQuicksightDeleteTemplateRequest;
@class AWSQuicksightDeleteTemplateResponse;
@class AWSQuicksightDeleteUserByPrincipalIdRequest;
@class AWSQuicksightDeleteUserByPrincipalIdResponse;
@class AWSQuicksightDeleteUserRequest;
@class AWSQuicksightDeleteUserResponse;
@class AWSQuicksightDescribeDashboardPermissionsRequest;
@class AWSQuicksightDescribeDashboardPermissionsResponse;
@class AWSQuicksightDescribeDashboardRequest;
@class AWSQuicksightDescribeDashboardResponse;
@class AWSQuicksightDescribeDataSetPermissionsRequest;
@class AWSQuicksightDescribeDataSetPermissionsResponse;
@class AWSQuicksightDescribeDataSetRequest;
@class AWSQuicksightDescribeDataSetResponse;
@class AWSQuicksightDescribeDataSourcePermissionsRequest;
@class AWSQuicksightDescribeDataSourcePermissionsResponse;
@class AWSQuicksightDescribeDataSourceRequest;
@class AWSQuicksightDescribeDataSourceResponse;
@class AWSQuicksightDescribeGroupRequest;
@class AWSQuicksightDescribeGroupResponse;
@class AWSQuicksightDescribeIAMPolicyAssignmentRequest;
@class AWSQuicksightDescribeIAMPolicyAssignmentResponse;
@class AWSQuicksightDescribeIngestionRequest;
@class AWSQuicksightDescribeIngestionResponse;
@class AWSQuicksightDescribeTemplateAliasRequest;
@class AWSQuicksightDescribeTemplateAliasResponse;
@class AWSQuicksightDescribeTemplatePermissionsRequest;
@class AWSQuicksightDescribeTemplatePermissionsResponse;
@class AWSQuicksightDescribeTemplateRequest;
@class AWSQuicksightDescribeTemplateResponse;
@class AWSQuicksightDescribeUserRequest;
@class AWSQuicksightDescribeUserResponse;
@class AWSQuicksightErrorInfo;
@class AWSQuicksightExportToCSVOption;
@class AWSQuicksightFilterOperation;
@class AWSQuicksightGeoSpatialColumnGroup;
@class AWSQuicksightGetDashboardEmbedUrlRequest;
@class AWSQuicksightGetDashboardEmbedUrlResponse;
@class AWSQuicksightGroup;
@class AWSQuicksightGroupMember;
@class AWSQuicksightIAMPolicyAssignment;
@class AWSQuicksightIAMPolicyAssignmentSummary;
@class AWSQuicksightIngestion;
@class AWSQuicksightInputColumn;
@class AWSQuicksightIntegerParameter;
@class AWSQuicksightJiraParameters;
@class AWSQuicksightJoinInstruction;
@class AWSQuicksightListDashboardVersionsRequest;
@class AWSQuicksightListDashboardVersionsResponse;
@class AWSQuicksightListDashboardsRequest;
@class AWSQuicksightListDashboardsResponse;
@class AWSQuicksightListDataSetsRequest;
@class AWSQuicksightListDataSetsResponse;
@class AWSQuicksightListDataSourcesRequest;
@class AWSQuicksightListDataSourcesResponse;
@class AWSQuicksightListGroupMembershipsRequest;
@class AWSQuicksightListGroupMembershipsResponse;
@class AWSQuicksightListGroupsRequest;
@class AWSQuicksightListGroupsResponse;
@class AWSQuicksightListIAMPolicyAssignmentsForUserRequest;
@class AWSQuicksightListIAMPolicyAssignmentsForUserResponse;
@class AWSQuicksightListIAMPolicyAssignmentsRequest;
@class AWSQuicksightListIAMPolicyAssignmentsResponse;
@class AWSQuicksightListIngestionsRequest;
@class AWSQuicksightListIngestionsResponse;
@class AWSQuicksightListTagsForResourceRequest;
@class AWSQuicksightListTagsForResourceResponse;
@class AWSQuicksightListTemplateAliasesRequest;
@class AWSQuicksightListTemplateAliasesResponse;
@class AWSQuicksightListTemplateVersionsRequest;
@class AWSQuicksightListTemplateVersionsResponse;
@class AWSQuicksightListTemplatesRequest;
@class AWSQuicksightListTemplatesResponse;
@class AWSQuicksightListUserGroupsRequest;
@class AWSQuicksightListUserGroupsResponse;
@class AWSQuicksightListUsersRequest;
@class AWSQuicksightListUsersResponse;
@class AWSQuicksightLogicalTable;
@class AWSQuicksightLogicalTableSource;
@class AWSQuicksightManifestFileLocation;
@class AWSQuicksightMariaDbParameters;
@class AWSQuicksightMySqlParameters;
@class AWSQuicksightOutputColumn;
@class AWSQuicksightParameters;
@class AWSQuicksightPhysicalTable;
@class AWSQuicksightPostgreSqlParameters;
@class AWSQuicksightPrestoParameters;
@class AWSQuicksightProjectOperation;
@class AWSQuicksightQueueInfo;
@class AWSQuicksightRdsParameters;
@class AWSQuicksightRedshiftParameters;
@class AWSQuicksightRegisterUserRequest;
@class AWSQuicksightRegisterUserResponse;
@class AWSQuicksightRelationalTable;
@class AWSQuicksightRenameColumnOperation;
@class AWSQuicksightResourcePermission;
@class AWSQuicksightRowInfo;
@class AWSQuicksightRowLevelPermissionDataSet;
@class AWSQuicksightS3Parameters;
@class AWSQuicksightS3Source;
@class AWSQuicksightSearchDashboardsRequest;
@class AWSQuicksightSearchDashboardsResponse;
@class AWSQuicksightServiceNowParameters;
@class AWSQuicksightSheetControlsOption;
@class AWSQuicksightSnowflakeParameters;
@class AWSQuicksightSparkParameters;
@class AWSQuicksightSqlServerParameters;
@class AWSQuicksightSslProperties;
@class AWSQuicksightStringParameter;
@class AWSQuicksightTag;
@class AWSQuicksightTagColumnOperation;
@class AWSQuicksightTagResourceRequest;
@class AWSQuicksightTagResourceResponse;
@class AWSQuicksightTemplate;
@class AWSQuicksightTemplateAlias;
@class AWSQuicksightTemplateError;
@class AWSQuicksightTemplateSourceAnalysis;
@class AWSQuicksightTemplateSourceEntity;
@class AWSQuicksightTemplateSourceTemplate;
@class AWSQuicksightTemplateSummary;
@class AWSQuicksightTemplateVersion;
@class AWSQuicksightTemplateVersionSummary;
@class AWSQuicksightTeradataParameters;
@class AWSQuicksightTransformOperation;
@class AWSQuicksightTwitterParameters;
@class AWSQuicksightUntagResourceRequest;
@class AWSQuicksightUntagResourceResponse;
@class AWSQuicksightUpdateDashboardPermissionsRequest;
@class AWSQuicksightUpdateDashboardPermissionsResponse;
@class AWSQuicksightUpdateDashboardPublishedVersionRequest;
@class AWSQuicksightUpdateDashboardPublishedVersionResponse;
@class AWSQuicksightUpdateDashboardRequest;
@class AWSQuicksightUpdateDashboardResponse;
@class AWSQuicksightUpdateDataSetPermissionsRequest;
@class AWSQuicksightUpdateDataSetPermissionsResponse;
@class AWSQuicksightUpdateDataSetRequest;
@class AWSQuicksightUpdateDataSetResponse;
@class AWSQuicksightUpdateDataSourcePermissionsRequest;
@class AWSQuicksightUpdateDataSourcePermissionsResponse;
@class AWSQuicksightUpdateDataSourceRequest;
@class AWSQuicksightUpdateDataSourceResponse;
@class AWSQuicksightUpdateGroupRequest;
@class AWSQuicksightUpdateGroupResponse;
@class AWSQuicksightUpdateIAMPolicyAssignmentRequest;
@class AWSQuicksightUpdateIAMPolicyAssignmentResponse;
@class AWSQuicksightUpdateTemplateAliasRequest;
@class AWSQuicksightUpdateTemplateAliasResponse;
@class AWSQuicksightUpdateTemplatePermissionsRequest;
@class AWSQuicksightUpdateTemplatePermissionsResponse;
@class AWSQuicksightUpdateTemplateRequest;
@class AWSQuicksightUpdateTemplateResponse;
@class AWSQuicksightUpdateUserRequest;
@class AWSQuicksightUpdateUserResponse;
@class AWSQuicksightUploadSettings;
@class AWSQuicksightUser;
@class AWSQuicksightVpcConnectionProperties;

/**
 <p>The active AWS Identity and Access Management (IAM) policy assignment.</p>
 */
@interface AWSQuicksightActiveIAMPolicyAssignment : AWSModel


/**
 <p>A name for the IAM policy assignment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assignmentName;

/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

@end

/**
 <p>Ad hoc (one-time) filtering option.</p>
 */
@interface AWSQuicksightAdHocFilteringOption : AWSModel


/**
 <p>Availability status.</p>
 */
@property (nonatomic, assign) AWSQuicksightDashboardBehavior availabilityStatus;

@end

/**
 <p>Amazon Elasticsearch Service parameters.</p>
 Required parameters: [Domain]
 */
@interface AWSQuicksightAmazonElasticsearchParameters : AWSModel


/**
 <p>The Amazon Elasticsearch Service domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

@end

/**
 <p>Amazon Athena parameters.</p>
 */
@interface AWSQuicksightAthenaParameters : AWSModel


/**
 <p>The workgroup that Amazon Athena uses.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workGroup;

@end

/**
 <p>Amazon Aurora parameters.</p>
 Required parameters: [Host, Port, Database]
 */
@interface AWSQuicksightAuroraParameters : AWSModel


/**
 <p>Database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable database;

/**
 <p>Host.</p>
 */
@property (nonatomic, strong) NSString * _Nullable host;

/**
 <p>Port.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

@end

/**
 <p>Amazon Aurora with PostgreSQL compatibility parameters.</p>
 Required parameters: [Host, Port, Database]
 */
@interface AWSQuicksightAuroraPostgreSqlParameters : AWSModel


/**
 <p>Database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable database;

/**
 <p>Host.</p>
 */
@property (nonatomic, strong) NSString * _Nullable host;

/**
 <p>Port.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

@end

/**
 <p>AWS IoT Analytics parameters.</p>
 Required parameters: [DataSetName]
 */
@interface AWSQuicksightAwsIotAnalyticsParameters : AWSModel


/**
 <p>Dataset name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetName;

@end

/**
 <p>A calculated column for a dataset.</p>
 Required parameters: [ColumnName, ColumnId, Expression]
 */
@interface AWSQuicksightCalculatedColumn : AWSModel


/**
 <p>A unique ID to identify a calculated column. During a dataset update, if the column ID of a calculated column matches that of an existing calculated column, Amazon QuickSight preserves the existing calculated column.</p>
 */
@property (nonatomic, strong) NSString * _Nullable columnId;

/**
 <p>Column name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable columnName;

/**
 <p>An expression that defines the calculated column.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expression;

@end

/**
 
 */
@interface AWSQuicksightCancelIngestionRequest : AWSRequest


/**
 <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID of the dataset used in the ingestion.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>An ID for the ingestion.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ingestionId;

@end

/**
 
 */
@interface AWSQuicksightCancelIngestionResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the data ingestion.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>An ID for the ingestion.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ingestionId;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 <p>A transform operation that casts a column to a different type.</p>
 Required parameters: [ColumnName, NewColumnType]
 */
@interface AWSQuicksightCastColumnTypeOperation : AWSModel


/**
 <p>Column name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable columnName;

/**
 <p>When casting a column from string to datetime type, you can supply a string in a format supported by Amazon QuickSight to denote the source data format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable format;

/**
 <p>New column data type.</p>
 */
@property (nonatomic, assign) AWSQuicksightColumnDataType latestColumnType;

@end

/**
 <p>Groupings of columns that work together in certain Amazon QuickSight features. This is a variant type structure. For this structure to be valid, only one of the attributes can be non-null.</p>
 */
@interface AWSQuicksightColumnGroup : AWSModel


/**
 <p>Geospatial column group that denotes a hierarchy.</p>
 */
@property (nonatomic, strong) AWSQuicksightGeoSpatialColumnGroup * _Nullable geoSpatialColumnGroup;

@end

/**
 <p>A structure describing the name, data type, and geographic role of the columns.</p>
 */
@interface AWSQuicksightColumnGroupColumnSchema : AWSModel


/**
 <p>The name of the column group's column schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>The column group schema.</p>
 */
@interface AWSQuicksightColumnGroupSchema : AWSModel


/**
 <p>A structure containing the list of schemas for column group columns.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightColumnGroupColumnSchema *> * _Nullable columnGroupColumnSchemaList;

/**
 <p>The name of the column group schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>The column schema.</p>
 */
@interface AWSQuicksightColumnSchema : AWSModel


/**
 <p>The data type of the column schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataType;

/**
 <p>The geographic role of the column schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable geographicRole;

/**
 <p>The name of the column schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>A tag for a column in a <code>TagColumnOperation</code> structure. This is a variant type structure. For this structure to be valid, only one of the attributes can be non-null.</p>
 */
@interface AWSQuicksightColumnTag : AWSModel


/**
 <p>A geospatial role for a column.</p>
 */
@property (nonatomic, assign) AWSQuicksightGeoSpatialDataRole columnGeographicRole;

@end

/**
 <p>A transform operation that creates calculated columns. Columns created in one such operation form a lexical closure.</p>
 Required parameters: [Columns]
 */
@interface AWSQuicksightCreateColumnsOperation : AWSModel


/**
 <p>Calculated columns to create.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightCalculatedColumn *> * _Nullable columns;

@end

/**
 
 */
@interface AWSQuicksightCreateDashboardRequest : AWSRequest


/**
 <p>The ID of the AWS account where you want to create the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID for the dashboard, also added to the IAM policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardId;

/**
 <p>Options for publishing the dashboard when you create it:</p><ul><li><p><code>AvailabilityStatus</code> for <code>AdHocFilteringOption</code> - This status can be either <code>ENABLED</code> or <code>DISABLED</code>. When this is set to <code>DISABLED</code>, QuickSight disables the left filter pane on the published dashboard, which can be used for ad hoc (one-time) filtering. This option is <code>ENABLED</code> by default. </p></li><li><p><code>AvailabilityStatus</code> for <code>ExportToCSVOption</code> - This status can be either <code>ENABLED</code> or <code>DISABLED</code>. The visual option to export data to .csv format isn't enabled when this is set to <code>DISABLED</code>. This option is <code>ENABLED</code> by default. </p></li><li><p><code>VisibilityState</code> for <code>SheetControlsOption</code> - This visibility state can be either <code>COLLAPSED</code> or <code>EXPANDED</code>. The sheet controls pane is collapsed by default when set to true. This option is <code>COLLAPSED</code> by default. </p></li></ul>
 */
@property (nonatomic, strong) AWSQuicksightDashboardPublishOptions * _Nullable dashboardPublishOptions;

/**
 <p>The display name of the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A structure that contains the parameters of the dashboard. These are parameter overrides for a dashboard. A dashboard can have any type of parameters, and some parameters might accept multiple values. You can use the dashboard permissions structure described following to override two string parameters that accept multiple values. </p>
 */
@property (nonatomic, strong) AWSQuicksightParameters * _Nullable parameters;

/**
 <p>A structure that contains the permissions of the dashboard. You can use this structure for granting permissions with principal and action information.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightResourcePermission *> * _Nullable permissions;

/**
 <p>The source entity from which the dashboard is created. The source entity accepts the Amazon Resource Name (ARN) of the source template or analysis and also references the replacement datasets for the placeholders set when creating the template. The replacement datasets need to follow the same schema as the datasets for which placeholders were created when creating the template. </p><p>If you are creating a dashboard from a source entity in a different AWS account, use the ARN of the source template.</p>
 */
@property (nonatomic, strong) AWSQuicksightDashboardSourceEntity * _Nullable sourceEntity;

/**
 <p>Contains a map of the key-value pairs for the resource tag or tags assigned to the dashboard.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightTag *> * _Nullable tags;

/**
 <p>A description for the first version of the dashboard being created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionDescription;

@end

/**
 
 */
@interface AWSQuicksightCreateDashboardResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The status of the dashboard creation request.</p>
 */
@property (nonatomic, assign) AWSQuicksightResourceStatus creationStatus;

/**
 <p>The ID for the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardId;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

/**
 <p>The ARN of the dashboard, including the version number of the first version that is created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionArn;

@end

/**
 
 */
@interface AWSQuicksightCreateDataSetRequest : AWSRequest


/**
 <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>Groupings of columns that work together in certain QuickSight features. Currently, only geospatial hierarchy is supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightColumnGroup *> * _Nullable columnGroups;

/**
 <p>An ID for the dataset that you want to create. This ID is unique per AWS Region for each AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>Indicates whether you want to import the data into SPICE.</p>
 */
@property (nonatomic, assign) AWSQuicksightDataSetImportMode importMode;

/**
 <p>Configures the combination and transformation of the data from the physical tables.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSQuicksightLogicalTable *> * _Nullable logicalTableMap;

/**
 <p>The display name for the dataset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of resource permissions on the dataset.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightResourcePermission *> * _Nullable permissions;

/**
 <p>Declares the physical tables that are available in the underlying data sources.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSQuicksightPhysicalTable *> * _Nullable physicalTableMap;

/**
 <p>The row-level security configuration for the data that you want to create.</p>
 */
@property (nonatomic, strong) AWSQuicksightRowLevelPermissionDataSet * _Nullable rowLevelPermissionDataSet;

/**
 <p>Contains a map of the key-value pairs for the resource tag or tags assigned to the dataset.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSQuicksightCreateDataSetResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the dataset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The ID for the dataset that you want to create. This ID is unique per AWS Region for each AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>The ARN for the ingestion, which is triggered as a result of dataset creation if the import mode is SPICE.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ingestionArn;

/**
 <p>The ID of the ingestion, which is triggered as a result of dataset creation if the import mode is SPICE.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ingestionId;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightCreateDataSourceRequest : AWSRequest


/**
 <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The credentials QuickSight that uses to connect to your underlying source. Currently, only credentials based on user name and password are supported.</p>
 */
@property (nonatomic, strong) AWSQuicksightDataSourceCredentials * _Nullable credentials;

/**
 <p>An ID for the data source. This ID is unique per AWS Region for each AWS account. </p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

/**
 <p>The parameters that QuickSight uses to connect to your underlying source.</p>
 */
@property (nonatomic, strong) AWSQuicksightDataSourceParameters * _Nullable dataSourceParameters;

/**
 <p>A display name for the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of resource permissions on the data source.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightResourcePermission *> * _Nullable permissions;

/**
 <p>Secure Socket Layer (SSL) properties that apply when QuickSight connects to your underlying source.</p>
 */
@property (nonatomic, strong) AWSQuicksightSslProperties * _Nullable sslProperties;

/**
 <p>Contains a map of the key-value pairs for the resource tag or tags assigned to the data source.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightTag *> * _Nullable tags;

/**
 <p>The type of the data source. Currently, the supported types for this operation are: <code>ATHENA, AURORA, AURORA_POSTGRESQL, MARIADB, MYSQL, POSTGRESQL, PRESTO, REDSHIFT, S3, SNOWFLAKE, SPARK, SQLSERVER, TERADATA</code>. Use <code>ListDataSources</code> to return a list of all data sources.</p>
 */
@property (nonatomic, assign) AWSQuicksightDataSourceType types;

/**
 <p>Use this parameter only when you want QuickSight to use a VPC connection when connecting to your underlying source.</p>
 */
@property (nonatomic, strong) AWSQuicksightVpcConnectionProperties * _Nullable vpcConnectionProperties;

@end

/**
 
 */
@interface AWSQuicksightCreateDataSourceResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The status of creating the data source.</p>
 */
@property (nonatomic, assign) AWSQuicksightResourceStatus creationStatus;

/**
 <p>The ID of the data source. This ID is unique per AWS Region for each AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightCreateGroupMembershipRequest : AWSRequest


/**
 <p>The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The name of the group that you want to add the user to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The name of the user that you want to add to the group membership.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberName;

/**
 <p>The namespace. Currently, you should set this to <code>default</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

@end

/**
 
 */
@interface AWSQuicksightCreateGroupMembershipResponse : AWSModel


/**
 <p>The group member.</p>
 */
@property (nonatomic, strong) AWSQuicksightGroupMember * _Nullable groupMember;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 <p>The request object for this operation. </p>
 Required parameters: [GroupName, AwsAccountId, Namespace]
 */
@interface AWSQuicksightCreateGroupRequest : AWSRequest


/**
 <p>The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>A description for the group that you want to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A name for the group that you want to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The namespace. Currently, you should set this to <code>default</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

@end

/**
 <p>The response object for this operation.</p>
 */
@interface AWSQuicksightCreateGroupResponse : AWSModel


/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) AWSQuicksightGroup * _Nullable group;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightCreateIAMPolicyAssignmentRequest : AWSRequest


/**
 <p>The name of the assignment. It must be unique within an AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assignmentName;

/**
 <p>The status of the assignment. Possible values are as follows:</p><ul><li><p><code>ENABLED</code> - Anything specified in this assignment is used when creating the data source.</p></li><li><p><code>DISABLED</code> - This assignment isn't used when creating the data source.</p></li><li><p><code>DRAFT</code> - This assignment is an unfinished draft and isn't used when creating the data source.</p></li></ul>
 */
@property (nonatomic, assign) AWSQuicksightAssignmentStatus assignmentStatus;

/**
 <p>The ID of the AWS account where you want to assign an IAM policy to QuickSight users or groups.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The QuickSight users, groups, or both that you want to assign the policy to.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable identities;

/**
 <p>The namespace that contains the assignment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>The ARN for the IAM policy to apply to the QuickSight users and groups specified in this assignment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

@end

/**
 
 */
@interface AWSQuicksightCreateIAMPolicyAssignmentResponse : AWSModel


/**
 <p>The ID for the assignment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assignmentId;

/**
 <p>The name of the assignment. This name must be unique within the AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assignmentName;

/**
 <p>The status of the assignment. Possible values are as follows:</p><ul><li><p><code>ENABLED</code> - Anything specified in this assignment is used when creating the data source.</p></li><li><p><code>DISABLED</code> - This assignment isn't used when creating the data source.</p></li><li><p><code>DRAFT</code> - This assignment is an unfinished draft and isn't used when creating the data source.</p></li></ul>
 */
@property (nonatomic, assign) AWSQuicksightAssignmentStatus assignmentStatus;

/**
 <p>The QuickSight users, groups, or both that the IAM policy is assigned to.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable identities;

/**
 <p>The ARN for the IAM policy that is applied to the QuickSight users and groups specified in this assignment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightCreateIngestionRequest : AWSRequest


/**
 <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID of the dataset used in the ingestion.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>An ID for the ingestion.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ingestionId;

@end

/**
 
 */
@interface AWSQuicksightCreateIngestionResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the data ingestion.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>An ID for the ingestion.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ingestionId;

/**
 <p>The ingestion status.</p>
 */
@property (nonatomic, assign) AWSQuicksightIngestionStatus ingestionStatus;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightCreateTemplateAliasRequest : AWSRequest


/**
 <p>The name that you want to give to the template alias that you're creating. Don't start the alias name with the <code>$</code> character. Alias names that start with <code>$</code> are reserved by QuickSight. </p>
 */
@property (nonatomic, strong) NSString * _Nullable aliasName;

/**
 <p>The ID of the AWS account that contains the template that you creating an alias for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>An ID for the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateId;

/**
 <p>The version number of the template.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable templateVersionNumber;

@end

/**
 
 */
@interface AWSQuicksightCreateTemplateAliasResponse : AWSModel


/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

/**
 <p>Information about the template alias.</p>
 */
@property (nonatomic, strong) AWSQuicksightTemplateAlias * _Nullable templateAlias;

@end

/**
 
 */
@interface AWSQuicksightCreateTemplateRequest : AWSRequest


/**
 <p>The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>A display name for the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of resource permissions to be set on the template. </p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightResourcePermission *> * _Nullable permissions;

/**
 <p>The Amazon Resource Name (ARN) of the source entity from which this template is being created. Currently, you can create a template from an analysis or another template. If the ARN is for an analysis, include its dataset references. </p>
 */
@property (nonatomic, strong) AWSQuicksightTemplateSourceEntity * _Nullable sourceEntity;

/**
 <p>Contains a map of the key-value pairs for the resource tag or tags assigned to the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightTag *> * _Nullable tags;

/**
 <p>An ID for the template that you want to create. This template is unique per AWS Region in each AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateId;

/**
 <p>A description of the current template version being created. This API operation creates the first version of the template. Every time <code>UpdateTemplate</code> is called, a new version is created. Each version of the template maintains a description of the version in the <code>VersionDescription</code> field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionDescription;

@end

/**
 
 */
@interface AWSQuicksightCreateTemplateResponse : AWSModel


/**
 <p>The ARN for the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The template creation status.</p>
 */
@property (nonatomic, assign) AWSQuicksightResourceStatus creationStatus;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

/**
 <p>The ID of the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateId;

/**
 <p>The ARN for the template, including the version information of the first version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionArn;

@end

/**
 <p>The combination of user name and password that are used as credentials.</p>
 Required parameters: [Username, Password]
 */
@interface AWSQuicksightCredentialPair : AWSModel


/**
 <p>Password.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 <p>User name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>A physical table type built from the results of the custom SQL query.</p>
 Required parameters: [DataSourceArn, Name, SqlQuery]
 */
@interface AWSQuicksightCustomSql : AWSModel


/**
 <p>The column schema from the SQL query result set.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightInputColumn *> * _Nullable columns;

/**
 <p>The Amazon Resource Name (ARN) of the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceArn;

/**
 <p>A display name for the SQL query result.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The SQL query.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sqlQuery;

@end

/**
 <p>Dashboard.</p>
 */
@interface AWSQuicksightDashboard : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The time that this dataset was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>Dashboard ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardId;

/**
 <p>The last time that this dataset was published.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastPublishedTime;

/**
 <p>The last time that this dataset was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>A display name for the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Version.</p>
 */
@property (nonatomic, strong) AWSQuicksightDashboardVersion * _Nullable version;

@end

/**
 <p>Dashboard error.</p>
 */
@interface AWSQuicksightDashboardError : AWSModel


/**
 <p>Message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>Type.</p>
 */
@property (nonatomic, assign) AWSQuicksightDashboardErrorType types;

@end

/**
 <p>Dashboard publish options.</p>
 */
@interface AWSQuicksightDashboardPublishOptions : AWSModel


/**
 <p>Ad hoc (one-time) filtering option.</p>
 */
@property (nonatomic, strong) AWSQuicksightAdHocFilteringOption * _Nullable adHocFilteringOption;

/**
 <p>Export to .csv option.</p>
 */
@property (nonatomic, strong) AWSQuicksightExportToCSVOption * _Nullable exportToCSVOption;

/**
 <p>Sheet controls option.</p>
 */
@property (nonatomic, strong) AWSQuicksightSheetControlsOption * _Nullable sheetControlsOption;

@end

/**
 <p>A filter that you apply when searching for dashboards. </p>
 Required parameters: [Operator]
 */
@interface AWSQuicksightDashboardSearchFilter : AWSModel


/**
 <p>The name of the value that you want to use as a filter. For example, <code>"Name": "QUICKSIGHT_USER"</code>. </p>
 */
@property (nonatomic, assign) AWSQuicksightDashboardFilterAttribute name;

/**
 <p>The comparison operator that you want to use as a filter. For example, <code>"Operator": "StringEquals"</code>.</p>
 */
@property (nonatomic, assign) AWSQuicksightFilterOperator operator;

/**
 <p>The value of the named item, in this case <code>QUICKSIGHT_USER</code>, that you want to use as a filter. For example, <code>"Value": "arn:aws:quicksight:us-east-1:1:user/default/UserName1"</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Dashboard source entity.</p>
 */
@interface AWSQuicksightDashboardSourceEntity : AWSModel


/**
 <p>Source template.</p>
 */
@property (nonatomic, strong) AWSQuicksightDashboardSourceTemplate * _Nullable sourceTemplate;

@end

/**
 <p>Dashboard source template.</p>
 Required parameters: [DataSetReferences, Arn]
 */
@interface AWSQuicksightDashboardSourceTemplate : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>Dataset references.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightDataSetReference *> * _Nullable dataSetReferences;

@end

/**
 <p>Dashboard summary.</p>
 */
@interface AWSQuicksightDashboardSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The time that this dashboard was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>Dashboard ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardId;

/**
 <p>The last time that this dashboard was published.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastPublishedTime;

/**
 <p>The last time that this dashboard was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>A display name for the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Published version number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publishedVersionNumber;

@end

/**
 <p>Dashboard version.</p>
 */
@interface AWSQuicksightDashboardVersion : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The time that this dashboard version was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The Amazon Resource Numbers (ARNs) for the datasets that are associated with a version of the dashboard.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable dataSetArns;

/**
 <p>Description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Errors.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightDashboardError *> * _Nullable errors;

/**
 <p>Source entity ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceEntityArn;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, assign) AWSQuicksightResourceStatus status;

/**
 <p>Version number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable versionNumber;

@end

/**
 <p>Dashboard version summary.</p>
 */
@interface AWSQuicksightDashboardVersionSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The time that this dashboard version was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>Description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Source entity ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceEntityArn;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, assign) AWSQuicksightResourceStatus status;

/**
 <p>Version number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable versionNumber;

@end

/**
 <p>Dataset.</p>
 */
@interface AWSQuicksightDataSet : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>Groupings of columns that work together in certain Amazon QuickSight features. Currently, only geospatial hierarchy is supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightColumnGroup *> * _Nullable columnGroups;

/**
 <p>The amount of SPICE capacity used by this dataset. This is 0 if the dataset isn't imported into SPICE.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable consumedSpiceCapacityInBytes;

/**
 <p>The time that this dataset was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The ID of the dataset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>Indicates whether you want to import the data into SPICE.</p>
 */
@property (nonatomic, assign) AWSQuicksightDataSetImportMode importMode;

/**
 <p>The last time that this dataset was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>Configures the combination and transformation of the data from the physical tables.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSQuicksightLogicalTable *> * _Nullable logicalTableMap;

/**
 <p>A display name for the dataset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The list of columns after all transforms. These columns are available in templates, analyses, and dashboards.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightOutputColumn *> * _Nullable outputColumns;

/**
 <p>Declares the physical tables that are available in the underlying data sources.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSQuicksightPhysicalTable *> * _Nullable physicalTableMap;

/**
 <p>The row-level security configuration for the dataset.</p>
 */
@property (nonatomic, strong) AWSQuicksightRowLevelPermissionDataSet * _Nullable rowLevelPermissionDataSet;

@end

/**
 <p>Dataset configuration.</p>
 */
@interface AWSQuicksightDataSetConfiguration : AWSModel


/**
 <p>A structure containing the list of column group schemas.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightColumnGroupSchema *> * _Nullable columnGroupSchemaList;

/**
 <p>Dataset schema.</p>
 */
@property (nonatomic, strong) AWSQuicksightDataSetSchema * _Nullable dataSetSchema;

/**
 <p>Placeholder.</p>
 */
@property (nonatomic, strong) NSString * _Nullable placeholder;

@end

/**
 <p>Dataset reference.</p>
 Required parameters: [DataSetPlaceholder, DataSetArn]
 */
@interface AWSQuicksightDataSetReference : AWSModel


/**
 <p>Dataset Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetArn;

/**
 <p>Dataset placeholder.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetPlaceholder;

@end

/**
 <p>Dataset schema.</p>
 */
@interface AWSQuicksightDataSetSchema : AWSModel


/**
 <p>A structure containing the list of column schemas.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightColumnSchema *> * _Nullable columnSchemaList;

@end

/**
 <p>Dataset summary.</p>
 */
@interface AWSQuicksightDataSetSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the dataset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The time that this dataset was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The ID of the dataset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>Indicates whether you want to import the data into SPICE.</p>
 */
@property (nonatomic, assign) AWSQuicksightDataSetImportMode importMode;

/**
 <p>The last time that this dataset was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>A display name for the dataset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The row-level security configuration for the dataset.</p>
 */
@property (nonatomic, strong) AWSQuicksightRowLevelPermissionDataSet * _Nullable rowLevelPermissionDataSet;

@end

/**
 <p>The structure of a data source.</p>
 */
@interface AWSQuicksightDataSource : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The time that this data source was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The ID of the data source. This ID is unique per AWS Region for each AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

/**
 <p>The parameters that Amazon QuickSight uses to connect to your underlying source. This is a variant type structure. For this structure to be valid, only one of the attributes can be non-null.</p>
 */
@property (nonatomic, strong) AWSQuicksightDataSourceParameters * _Nullable dataSourceParameters;

/**
 <p>Error information from the last update or the creation of the data source.</p>
 */
@property (nonatomic, strong) AWSQuicksightDataSourceErrorInfo * _Nullable errorInfo;

/**
 <p>The last time that this data source was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>A display name for the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Secure Socket Layer (SSL) properties that apply when QuickSight connects to your underlying source.</p>
 */
@property (nonatomic, strong) AWSQuicksightSslProperties * _Nullable sslProperties;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, assign) AWSQuicksightResourceStatus status;

/**
 <p>The type of the data source. This type indicates which database engine the data source connects to.</p>
 */
@property (nonatomic, assign) AWSQuicksightDataSourceType types;

/**
 <p>The VPC connection information. You need to use this parameter only when you want QuickSight to use a VPC connection when connecting to your underlying source.</p>
 */
@property (nonatomic, strong) AWSQuicksightVpcConnectionProperties * _Nullable vpcConnectionProperties;

@end

/**
 <p>Data source credentials.</p>
 */
@interface AWSQuicksightDataSourceCredentials : AWSModel


/**
 <p>Credential pair.</p>
 */
@property (nonatomic, strong) AWSQuicksightCredentialPair * _Nullable credentialPair;

@end

/**
 <p>Error information for the data source creation or update.</p>
 */
@interface AWSQuicksightDataSourceErrorInfo : AWSModel


/**
 <p>Error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>Error type.</p>
 */
@property (nonatomic, assign) AWSQuicksightDataSourceErrorInfoType types;

@end

/**
 <p>The parameters that Amazon QuickSight uses to connect to your underlying data source. This is a variant type structure. For this structure to be valid, only one of the attributes can be non-null.</p>
 */
@interface AWSQuicksightDataSourceParameters : AWSModel


/**
 <p>Amazon Elasticsearch Service parameters.</p>
 */
@property (nonatomic, strong) AWSQuicksightAmazonElasticsearchParameters * _Nullable amazonElasticsearchParameters;

/**
 <p>Amazon Athena parameters.</p>
 */
@property (nonatomic, strong) AWSQuicksightAthenaParameters * _Nullable athenaParameters;

/**
 <p>Amazon Aurora MySQL parameters.</p>
 */
@property (nonatomic, strong) AWSQuicksightAuroraParameters * _Nullable auroraParameters;

/**
 <p>Aurora PostgreSQL parameters.</p>
 */
@property (nonatomic, strong) AWSQuicksightAuroraPostgreSqlParameters * _Nullable auroraPostgreSqlParameters;

/**
 <p>AWS IoT Analytics parameters.</p>
 */
@property (nonatomic, strong) AWSQuicksightAwsIotAnalyticsParameters * _Nullable awsIotAnalyticsParameters;

/**
 <p>Jira parameters.</p>
 */
@property (nonatomic, strong) AWSQuicksightJiraParameters * _Nullable jiraParameters;

/**
 <p>MariaDB parameters.</p>
 */
@property (nonatomic, strong) AWSQuicksightMariaDbParameters * _Nullable mariaDbParameters;

/**
 <p>MySQL parameters.</p>
 */
@property (nonatomic, strong) AWSQuicksightMySqlParameters * _Nullable mySqlParameters;

/**
 <p>PostgreSQL parameters.</p>
 */
@property (nonatomic, strong) AWSQuicksightPostgreSqlParameters * _Nullable postgreSqlParameters;

/**
 <p>Presto parameters.</p>
 */
@property (nonatomic, strong) AWSQuicksightPrestoParameters * _Nullable prestoParameters;

/**
 <p>Amazon RDS parameters.</p>
 */
@property (nonatomic, strong) AWSQuicksightRdsParameters * _Nullable rdsParameters;

/**
 <p>Amazon Redshift parameters.</p>
 */
@property (nonatomic, strong) AWSQuicksightRedshiftParameters * _Nullable redshiftParameters;

/**
 <p>S3 parameters.</p>
 */
@property (nonatomic, strong) AWSQuicksightS3Parameters * _Nullable s3Parameters;

/**
 <p>ServiceNow parameters.</p>
 */
@property (nonatomic, strong) AWSQuicksightServiceNowParameters * _Nullable serviceNowParameters;

/**
 <p>Snowflake parameters.</p>
 */
@property (nonatomic, strong) AWSQuicksightSnowflakeParameters * _Nullable snowflakeParameters;

/**
 <p>Spark parameters.</p>
 */
@property (nonatomic, strong) AWSQuicksightSparkParameters * _Nullable sparkParameters;

/**
 <p>SQL Server parameters.</p>
 */
@property (nonatomic, strong) AWSQuicksightSqlServerParameters * _Nullable sqlServerParameters;

/**
 <p>Teradata parameters.</p>
 */
@property (nonatomic, strong) AWSQuicksightTeradataParameters * _Nullable teradataParameters;

/**
 <p>Twitter parameters.</p>
 */
@property (nonatomic, strong) AWSQuicksightTwitterParameters * _Nullable twitterParameters;

@end

/**
 <p>Date time parameter.</p>
 Required parameters: [Name, Values]
 */
@interface AWSQuicksightDateTimeParameter : AWSModel


/**
 <p>A display name for the dataset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Values.</p>
 */
@property (nonatomic, strong) NSArray<NSDate *> * _Nullable values;

@end

/**
 <p>Decimal parameter.</p>
 Required parameters: [Name, Values]
 */
@interface AWSQuicksightDecimalParameter : AWSModel


/**
 <p>A display name for the dataset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Values.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable values;

@end

/**
 
 */
@interface AWSQuicksightDeleteDashboardRequest : AWSRequest


/**
 <p>The ID of the AWS account that contains the dashboard that you're deleting.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID for the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardId;

/**
 <p>The version number of the dashboard. If the version number property is provided, only the specified version of the dashboard is deleted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable versionNumber;

@end

/**
 
 */
@interface AWSQuicksightDeleteDashboardResponse : AWSModel


/**
 <p>The Secure Socket Layer (SSL) properties that apply for the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The ID of the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardId;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightDeleteDataSetRequest : AWSRequest


/**
 <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID for the dataset that you want to create. This ID is unique per AWS Region for each AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

@end

/**
 
 */
@interface AWSQuicksightDeleteDataSetResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the dataset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The ID for the dataset that you want to create. This ID is unique per AWS Region for each AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightDeleteDataSourceRequest : AWSRequest


/**
 <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID of the data source. This ID is unique per AWS Region for each AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

@end

/**
 
 */
@interface AWSQuicksightDeleteDataSourceResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the data source that you deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The ID of the data source. This ID is unique per AWS Region for each AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightDeleteGroupMembershipRequest : AWSRequest


/**
 <p>The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The name of the group that you want to delete the user from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The name of the user that you want to delete from the group membership.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberName;

/**
 <p>The namespace. Currently, you should set this to <code>default</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

@end

/**
 
 */
@interface AWSQuicksightDeleteGroupMembershipResponse : AWSModel


/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightDeleteGroupRequest : AWSRequest


/**
 <p>The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The name of the group that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The namespace. Currently, you should set this to <code>default</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

@end

/**
 
 */
@interface AWSQuicksightDeleteGroupResponse : AWSModel


/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightDeleteIAMPolicyAssignmentRequest : AWSRequest


/**
 <p>The name of the assignment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable assignmentName;

/**
 <p>The AWS account ID where you want to delete the IAM policy assignment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The namespace that contains the assignment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

@end

/**
 
 */
@interface AWSQuicksightDeleteIAMPolicyAssignmentResponse : AWSModel


/**
 <p>The name of the assignment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable assignmentName;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightDeleteTemplateAliasRequest : AWSRequest


/**
 <p>The name for the template alias. If you name a specific alias, you delete the version that the alias points to. You can specify the latest version of the template by providing the keyword <code>$LATEST</code> in the <code>AliasName</code> parameter. </p>
 */
@property (nonatomic, strong) NSString * _Nullable aliasName;

/**
 <p>The ID of the AWS account that contains the item to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID for the template that the specified alias is for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateId;

@end

/**
 
 */
@interface AWSQuicksightDeleteTemplateAliasResponse : AWSModel


/**
 <p>The name for the template alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aliasName;

/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

/**
 <p>An ID for the template associated with the deletion.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateId;

@end

/**
 
 */
@interface AWSQuicksightDeleteTemplateRequest : AWSRequest


/**
 <p>The ID of the AWS account that contains the template that you're deleting.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>An ID for the template you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateId;

/**
 <p>Specifies the version of the template that you want to delete. If you don't provide a version number, <code>DeleteTemplate</code> deletes all versions of the template. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable versionNumber;

@end

/**
 
 */
@interface AWSQuicksightDeleteTemplateResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

/**
 <p>An ID for the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateId;

@end

/**
 <p/>
 Required parameters: [PrincipalId, AwsAccountId, Namespace]
 */
@interface AWSQuicksightDeleteUserByPrincipalIdRequest : AWSRequest


/**
 <p>The ID for the AWS account that the user is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The namespace. Currently, you should set this to <code>default</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>The principal ID of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principalId;

@end

/**
 
 */
@interface AWSQuicksightDeleteUserByPrincipalIdResponse : AWSModel


/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightDeleteUserRequest : AWSRequest


/**
 <p>The ID for the AWS account that the user is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The namespace. Currently, you should set this to <code>default</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>The name of the user that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSQuicksightDeleteUserResponse : AWSModel


/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightDescribeDashboardPermissionsRequest : AWSRequest


/**
 <p>The ID of the AWS account that contains the dashboard that you're describing permissions for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID for the dashboard, also added to the IAM policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardId;

@end

/**
 
 */
@interface AWSQuicksightDescribeDashboardPermissionsResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardArn;

/**
 <p>The ID for the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardId;

/**
 <p>A structure that contains the permissions for the dashboard.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightResourcePermission *> * _Nullable permissions;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightDescribeDashboardRequest : AWSRequest


/**
 <p>The alias name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aliasName;

/**
 <p>The ID of the AWS account that contains the dashboard that you're describing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID for the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardId;

/**
 <p>The version number for the dashboard. If a version number isn't passed, the latest published dashboard version is described. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable versionNumber;

@end

/**
 
 */
@interface AWSQuicksightDescribeDashboardResponse : AWSModel


/**
 <p>Information about the dashboard.</p>
 */
@property (nonatomic, strong) AWSQuicksightDashboard * _Nullable dashboard;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of this request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightDescribeDataSetPermissionsRequest : AWSRequest


/**
 <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID for the dataset that you want to create. This ID is unique per AWS Region for each AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

@end

/**
 
 */
@interface AWSQuicksightDescribeDataSetPermissionsResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the dataset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetArn;

/**
 <p>The ID for the dataset that you want to create. This ID is unique per AWS Region for each AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>A list of resource permissions on the dataset.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightResourcePermission *> * _Nullable permissions;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightDescribeDataSetRequest : AWSRequest


/**
 <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID for the dataset that you want to create. This ID is unique per AWS Region for each AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

@end

/**
 
 */
@interface AWSQuicksightDescribeDataSetResponse : AWSModel


/**
 <p>Information on the dataset.</p>
 */
@property (nonatomic, strong) AWSQuicksightDataSet * _Nullable dataSet;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightDescribeDataSourcePermissionsRequest : AWSRequest


/**
 <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID of the data source. This ID is unique per AWS Region for each AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

@end

/**
 
 */
@interface AWSQuicksightDescribeDataSourcePermissionsResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceArn;

/**
 <p>The ID of the data source. This ID is unique per AWS Region for each AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

/**
 <p>A list of resource permissions on the data source.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightResourcePermission *> * _Nullable permissions;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightDescribeDataSourceRequest : AWSRequest


/**
 <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID of the data source. This ID is unique per AWS Region for each AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

@end

/**
 
 */
@interface AWSQuicksightDescribeDataSourceResponse : AWSModel


/**
 <p>The information on the data source.</p>
 */
@property (nonatomic, strong) AWSQuicksightDataSource * _Nullable dataSource;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightDescribeGroupRequest : AWSRequest


/**
 <p>The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The name of the group that you want to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The namespace. Currently, you should set this to <code>default</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

@end

/**
 
 */
@interface AWSQuicksightDescribeGroupResponse : AWSModel


/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) AWSQuicksightGroup * _Nullable group;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightDescribeIAMPolicyAssignmentRequest : AWSRequest


/**
 <p>The name of the assignment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable assignmentName;

/**
 <p>The ID of the AWS account that contains the assignment that you want to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The namespace that contains the assignment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

@end

/**
 
 */
@interface AWSQuicksightDescribeIAMPolicyAssignmentResponse : AWSModel


/**
 <p>Information describing the IAM policy assignment.</p>
 */
@property (nonatomic, strong) AWSQuicksightIAMPolicyAssignment * _Nullable IAMPolicyAssignment;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightDescribeIngestionRequest : AWSRequest


/**
 <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID of the dataset used in the ingestion.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>An ID for the ingestion.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ingestionId;

@end

/**
 
 */
@interface AWSQuicksightDescribeIngestionResponse : AWSModel


/**
 <p>Information about the ingestion.</p>
 */
@property (nonatomic, strong) AWSQuicksightIngestion * _Nullable ingestion;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightDescribeTemplateAliasRequest : AWSRequest


/**
 <p>The name of the template alias that you want to describe. If you name a specific alias, you describe the version that the alias points to. You can specify the latest version of the template by providing the keyword <code>$LATEST</code> in the <code>AliasName</code> parameter. The keyword <code>$PUBLISHED</code> doesn't apply to templates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aliasName;

/**
 <p>The ID of the AWS account that contains the template alias that you're describing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID for the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateId;

@end

/**
 
 */
@interface AWSQuicksightDescribeTemplateAliasResponse : AWSModel


/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

/**
 <p>Information about the template alias.</p>
 */
@property (nonatomic, strong) AWSQuicksightTemplateAlias * _Nullable templateAlias;

@end

/**
 
 */
@interface AWSQuicksightDescribeTemplatePermissionsRequest : AWSRequest


/**
 <p>The ID of the AWS account that contains the template that you're describing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID for the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateId;

@end

/**
 
 */
@interface AWSQuicksightDescribeTemplatePermissionsResponse : AWSModel


/**
 <p>A list of resource permissions to be set on the template. </p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightResourcePermission *> * _Nullable permissions;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

/**
 <p>The Amazon Resource Name (ARN) of the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateArn;

/**
 <p>The ID for the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateId;

@end

/**
 
 */
@interface AWSQuicksightDescribeTemplateRequest : AWSRequest


/**
 <p>The alias of the template that you want to describe. If you name a specific alias, you describe the version that the alias points to. You can specify the latest version of the template by providing the keyword <code>$LATEST</code> in the <code>AliasName</code> parameter. The keyword <code>$PUBLISHED</code> doesn't apply to templates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aliasName;

/**
 <p>The ID of the AWS account that contains the template that you're describing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID for the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateId;

/**
 <p>(Optional) The number for the version to describe. If a <code>VersionNumber</code> parameter value isn't provided, the latest version of the template is described.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable versionNumber;

@end

/**
 
 */
@interface AWSQuicksightDescribeTemplateResponse : AWSModel


/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

/**
 <p>The template structure for the object you want to describe.</p>
 */
@property (nonatomic, strong) AWSQuicksightTemplate * _Nullable template;

@end

/**
 
 */
@interface AWSQuicksightDescribeUserRequest : AWSRequest


/**
 <p>The ID for the AWS account that the user is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The namespace. Currently, you should set this to <code>default</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>The name of the user that you want to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSQuicksightDescribeUserResponse : AWSModel


/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

/**
 <p>The user name.</p>
 */
@property (nonatomic, strong) AWSQuicksightUser * _Nullable user;

@end

/**
 <p>Error information for the SPICE ingestion of a dataset.</p>
 */
@interface AWSQuicksightErrorInfo : AWSModel


/**
 <p>Error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>Error type.</p>
 */
@property (nonatomic, assign) AWSQuicksightIngestionErrorType types;

@end

/**
 <p>Export to .csv option.</p>
 */
@interface AWSQuicksightExportToCSVOption : AWSModel


/**
 <p>Availability status.</p>
 */
@property (nonatomic, assign) AWSQuicksightDashboardBehavior availabilityStatus;

@end

/**
 <p>A transform operation that filters rows based on a condition.</p>
 Required parameters: [ConditionExpression]
 */
@interface AWSQuicksightFilterOperation : AWSModel


/**
 <p>An expression that must evaluate to a Boolean value. Rows for which the expression evaluates to true are kept in the dataset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable conditionExpression;

@end

/**
 <p>Geospatial column group that denotes a hierarchy.</p>
 Required parameters: [Name, CountryCode, Columns]
 */
@interface AWSQuicksightGeoSpatialColumnGroup : AWSModel


/**
 <p>Columns in this hierarchy.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable columns;

/**
 <p>Country code.</p>
 */
@property (nonatomic, assign) AWSQuicksightGeoSpatialCountryCode countryCode;

/**
 <p>A display name for the hierarchy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSQuicksightGetDashboardEmbedUrlRequest : AWSRequest


/**
 <p>The ID for the AWS account that contains the dashboard that you're embedding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID for the dashboard, also added to the IAM policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardId;

/**
 <p>The authentication method that the user uses to sign in.</p>
 */
@property (nonatomic, assign) AWSQuicksightIdentityType identityType;

/**
 <p>Remove the reset button on the embedded dashboard. The default is FALSE, which enables the reset button.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable resetDisabled;

/**
 <p>How many minutes the session is valid. The session lifetime must be 15-600 minutes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sessionLifetimeInMinutes;

/**
 <p>Remove the undo/redo button on the embedded dashboard. The default is FALSE, which enables the undo/redo button.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable undoRedoDisabled;

/**
 <p>The Amazon QuickSight user's Amazon Resource Name (ARN), for use with <code>QUICKSIGHT</code> identity type. You can use this for any Amazon QuickSight users in your account (readers, authors, or admins) authenticated as one of the following:</p><ul><li><p>Active Directory (AD) users or group members</p></li><li><p>Invited nonfederated users</p></li><li><p>IAM users and IAM role-based sessions authenticated through Federated Single Sign-On using SAML, OpenID Connect, or IAM federation.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable userArn;

@end

/**
 
 */
@interface AWSQuicksightGetDashboardEmbedUrlResponse : AWSModel


/**
 <p>An URL that you can put into your server-side webpage to embed your dashboard. This URL is valid for 5 minutes, and the resulting session is valid for 10 hours. The API provides the URL with an <code>auth_code</code> value that enables a single sign-on session. </p>
 */
@property (nonatomic, strong) NSString * _Nullable embedUrl;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 <p>A <i>group</i> in Amazon QuickSight consists of a set of users. You can use groups to make it easier to manage access and security. Currently, an Amazon QuickSight subscription can't contain more than 500 Amazon QuickSight groups.</p>
 */
@interface AWSQuicksightGroup : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The group description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The principal ID of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principalId;

@end

/**
 <p>A member of an Amazon QuickSight group. Currently, group members must be users. Groups can't be members of another group. .</p>
 */
@interface AWSQuicksightGroupMember : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the group member (user).</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The name of the group member (user).</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberName;

@end

/**
 <p>An IAM policy assignment.</p>
 */
@interface AWSQuicksightIAMPolicyAssignment : AWSModel


/**
 <p>Assignment ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assignmentId;

/**
 <p>Assignment name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assignmentName;

/**
 <p>Assignment status.</p>
 */
@property (nonatomic, assign) AWSQuicksightAssignmentStatus assignmentStatus;

/**
 <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>Identities.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable identities;

/**
 <p>The Amazon Resource Name (ARN) for the IAM policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

@end

/**
 <p>IAM policy assignment summary.</p>
 */
@interface AWSQuicksightIAMPolicyAssignmentSummary : AWSModel


/**
 <p>Assignment name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assignmentName;

/**
 <p>Assignment status.</p>
 */
@property (nonatomic, assign) AWSQuicksightAssignmentStatus assignmentStatus;

@end

/**
 <p>Information about the SPICE ingestion for a dataset.</p>
 Required parameters: [Arn, IngestionStatus, CreatedTime]
 */
@interface AWSQuicksightIngestion : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The time that this ingestion started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>Error information for this ingestion.</p>
 */
@property (nonatomic, strong) AWSQuicksightErrorInfo * _Nullable errorInfo;

/**
 <p>Ingestion ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ingestionId;

/**
 <p>The size of the data ingested, in bytes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ingestionSizeInBytes;

/**
 <p>Ingestion status.</p>
 */
@property (nonatomic, assign) AWSQuicksightIngestionStatus ingestionStatus;

/**
 <p>The time that this ingestion took, measured in seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ingestionTimeInSeconds;

/**
 <p>Information about a queued dataset SPICE ingestion.</p>
 */
@property (nonatomic, strong) AWSQuicksightQueueInfo * _Nullable queueInfo;

/**
 <p>Event source for this ingestion.</p>
 */
@property (nonatomic, assign) AWSQuicksightIngestionRequestSource requestSource;

/**
 <p>Type of this ingestion.</p>
 */
@property (nonatomic, assign) AWSQuicksightIngestionRequestType requestType;

/**
 <p>Information about rows for a data set SPICE ingestion.</p>
 */
@property (nonatomic, strong) AWSQuicksightRowInfo * _Nullable rowInfo;

@end

/**
 <p>Metadata for a column that is used as the input of a transform operation.</p>
 Required parameters: [Name, Type]
 */
@interface AWSQuicksightInputColumn : AWSModel


/**
 <p>The name of this column in the underlying data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The data type of the column.</p>
 */
@property (nonatomic, assign) AWSQuicksightInputColumnDataType types;

@end

/**
 <p>Integer parameter.</p>
 Required parameters: [Name, Values]
 */
@interface AWSQuicksightIntegerParameter : AWSModel


/**
 <p>A display name for the dataset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Values.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable values;

@end

/**
 <p>Jira parameters.</p>
 Required parameters: [SiteBaseUrl]
 */
@interface AWSQuicksightJiraParameters : AWSModel


/**
 <p>The base URL of the Jira site.</p>
 */
@property (nonatomic, strong) NSString * _Nullable siteBaseUrl;

@end

/**
 <p>Join instruction.</p>
 Required parameters: [LeftOperand, RightOperand, Type, OnClause]
 */
@interface AWSQuicksightJoinInstruction : AWSModel


/**
 <p>Left operand.</p>
 */
@property (nonatomic, strong) NSString * _Nullable leftOperand;

/**
 <p>On Clause.</p>
 */
@property (nonatomic, strong) NSString * _Nullable onClause;

/**
 <p>Right operand.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rightOperand;

/**
 <p>Type.</p>
 */
@property (nonatomic, assign) AWSQuicksightJoinType types;

@end

/**
 
 */
@interface AWSQuicksightListDashboardVersionsRequest : AWSRequest


/**
 <p>The ID of the AWS account that contains the dashboard that you're listing versions for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID for the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardId;

/**
 <p>The maximum number of results to be returned per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results, or null if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSQuicksightListDashboardVersionsResponse : AWSModel


/**
 <p>A structure that contains information about each version of the dashboard.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightDashboardVersionSummary *> * _Nullable dashboardVersionSummaryList;

/**
 <p>The token for the next set of results, or null if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightListDashboardsRequest : AWSRequest


/**
 <p>The ID of the AWS account that contains the dashboards that you're listing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The maximum number of results to be returned per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results, or null if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSQuicksightListDashboardsResponse : AWSModel


/**
 <p>A structure that contains all of the dashboards in your AWS account. This structure provides basic information about the dashboards.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightDashboardSummary *> * _Nullable dashboardSummaryList;

/**
 <p>The token for the next set of results, or null if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightListDataSetsRequest : AWSRequest


/**
 <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The maximum number of results to be returned per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results, or null if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSQuicksightListDataSetsResponse : AWSModel


/**
 <p>The list of dataset summaries.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightDataSetSummary *> * _Nullable dataSetSummaries;

/**
 <p>The token for the next set of results, or null if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightListDataSourcesRequest : AWSRequest


/**
 <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The maximum number of results to be returned per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results, or null if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSQuicksightListDataSourcesResponse : AWSModel


/**
 <p>A list of data sources.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightDataSource *> * _Nullable dataSources;

/**
 <p>The token for the next set of results, or null if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightListGroupMembershipsRequest : AWSRequest


/**
 <p>The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The name of the group that you want to see a membership list of.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The maximum number of results to return from this request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The namespace. Currently, you should set this to <code>default</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>A pagination token that can be used in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSQuicksightListGroupMembershipsResponse : AWSModel


/**
 <p>The list of the members of the group.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightGroupMember *> * _Nullable groupMemberList;

/**
 <p>A pagination token that can be used in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightListGroupsRequest : AWSRequest


/**
 <p>The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The maximum number of results to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The namespace. Currently, you should set this to <code>default</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>A pagination token that can be used in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSQuicksightListGroupsResponse : AWSModel


/**
 <p>The list of the groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightGroup *> * _Nullable groupList;

/**
 <p>A pagination token that can be used in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightListIAMPolicyAssignmentsForUserRequest : AWSRequest


/**
 <p>The ID of the AWS account that contains the assignments.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The maximum number of results to be returned per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The namespace of the assignment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>The token for the next set of results, or null if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSQuicksightListIAMPolicyAssignmentsForUserResponse : AWSModel


/**
 <p>The active assignments for this user.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightActiveIAMPolicyAssignment *> * _Nullable activeAssignments;

/**
 <p>The token for the next set of results, or null if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightListIAMPolicyAssignmentsRequest : AWSRequest


/**
 <p>The status of the assignments.</p>
 */
@property (nonatomic, assign) AWSQuicksightAssignmentStatus assignmentStatus;

/**
 <p>The ID of the AWS account that contains these IAM policy assignments.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The maximum number of results to be returned per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The namespace for the assignments.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>The token for the next set of results, or null if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSQuicksightListIAMPolicyAssignmentsResponse : AWSModel


/**
 <p>Information describing the IAM policy assignments.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightIAMPolicyAssignmentSummary *> * _Nullable IAMPolicyAssignments;

/**
 <p>The token for the next set of results, or null if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightListIngestionsRequest : AWSRequest


/**
 <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID of the dataset used in the ingestion.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>The maximum number of results to be returned per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results, or null if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSQuicksightListIngestionsResponse : AWSModel


/**
 <p>A list of the ingestions.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightIngestion *> * _Nullable ingestions;

/**
 <p>The token for the next set of results, or null if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightListTagsForResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource that you want a list of tags for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSQuicksightListTagsForResourceResponse : AWSModel


/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

/**
 <p>Contains a map of the key-value pairs for the resource tag or tags assigned to the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSQuicksightListTemplateAliasesRequest : AWSRequest


/**
 <p>The ID of the AWS account that contains the template aliases that you're listing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The maximum number of results to be returned per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results, or null if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID for the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateId;

@end

/**
 
 */
@interface AWSQuicksightListTemplateAliasesResponse : AWSModel


/**
 <p>The token for the next set of results, or null if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

/**
 <p>A structure containing the list of the template's aliases.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightTemplateAlias *> * _Nullable templateAliasList;

@end

/**
 
 */
@interface AWSQuicksightListTemplateVersionsRequest : AWSRequest


/**
 <p>The ID of the AWS account that contains the templates that you're listing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The maximum number of results to be returned per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results, or null if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID for the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateId;

@end

/**
 
 */
@interface AWSQuicksightListTemplateVersionsResponse : AWSModel


/**
 <p>The token for the next set of results, or null if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

/**
 <p>A structure containing a list of all the versions of the specified template.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightTemplateVersionSummary *> * _Nullable templateVersionSummaryList;

@end

/**
 
 */
@interface AWSQuicksightListTemplatesRequest : AWSRequest


/**
 <p>The ID of the AWS account that contains the templates that you're listing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The maximum number of results to be returned per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results, or null if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSQuicksightListTemplatesResponse : AWSModel


/**
 <p>The token for the next set of results, or null if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

/**
 <p>A structure containing information about the templates in the list.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightTemplateSummary *> * _Nullable templateSummaryList;

@end

/**
 
 */
@interface AWSQuicksightListUserGroupsRequest : AWSRequest


/**
 <p>The AWS account ID that the user is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The maximum number of results to return from this request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The namespace. Currently, you should set this to <code>default</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>A pagination token that can be used in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The Amazon QuickSight user name that you want to list group memberships for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSQuicksightListUserGroupsResponse : AWSModel


/**
 <p>The list of groups the user is a member of.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightGroup *> * _Nullable groupList;

/**
 <p>A pagination token that can be used in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightListUsersRequest : AWSRequest


/**
 <p>The ID for the AWS account that the user is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The maximum number of results to return from this request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The namespace. Currently, you should set this to <code>default</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>A pagination token that can be used in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSQuicksightListUsersResponse : AWSModel


/**
 <p>A pagination token that can be used in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

/**
 <p>The list of users.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightUser *> * _Nullable userList;

@end

/**
 <p>A <i>logical table</i> is a unit that joins and that data transformations operate on. A logical table has a source, which can be either a physical table or result of a join. When a logical table points to a physical table, the logical table acts as a mutable copy of that physical table through transform operations.</p>
 Required parameters: [Alias, Source]
 */
@interface AWSQuicksightLogicalTable : AWSModel


/**
 <p>A display name for the logical table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alias;

/**
 <p>Transform operations that act on this logical table.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightTransformOperation *> * _Nullable dataTransforms;

/**
 <p>Source of this logical table.</p>
 */
@property (nonatomic, strong) AWSQuicksightLogicalTableSource * _Nullable source;

@end

/**
 <p>Information about the source of a logical table. This is a variant type structure. For this structure to be valid, only one of the attributes can be non-null.</p>
 */
@interface AWSQuicksightLogicalTableSource : AWSModel


/**
 <p>Specifies the result of a join of two logical tables.</p>
 */
@property (nonatomic, strong) AWSQuicksightJoinInstruction * _Nullable joinInstruction;

/**
 <p>Physical table ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable physicalTableId;

@end

/**
 <p>Amazon S3 manifest file location.</p>
 Required parameters: [Bucket, Key]
 */
@interface AWSQuicksightManifestFileLocation : AWSModel


/**
 <p>Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Amazon S3 key that identifies an object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

@end

/**
 <p>MariaDB parameters.</p>
 Required parameters: [Host, Port, Database]
 */
@interface AWSQuicksightMariaDbParameters : AWSModel


/**
 <p>Database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable database;

/**
 <p>Host.</p>
 */
@property (nonatomic, strong) NSString * _Nullable host;

/**
 <p>Port.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

@end

/**
 <p>MySQL parameters.</p>
 Required parameters: [Host, Port, Database]
 */
@interface AWSQuicksightMySqlParameters : AWSModel


/**
 <p>Database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable database;

/**
 <p>Host.</p>
 */
@property (nonatomic, strong) NSString * _Nullable host;

/**
 <p>Port.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

@end

/**
 <p>Output column.</p>
 */
@interface AWSQuicksightOutputColumn : AWSModel


/**
 <p>A display name for the dataset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Type.</p>
 */
@property (nonatomic, assign) AWSQuicksightColumnDataType types;

@end

/**
 <p>Parameters.</p>
 */
@interface AWSQuicksightParameters : AWSModel


/**
 <p>DateTime parameters.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightDateTimeParameter *> * _Nullable dateTimeParameters;

/**
 <p>Decimal parameters.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightDecimalParameter *> * _Nullable decimalParameters;

/**
 <p>Integer parameters.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightIntegerParameter *> * _Nullable integerParameters;

/**
 <p>String parameters.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightStringParameter *> * _Nullable stringParameters;

@end

/**
 <p>A view of a data source that contains information about the shape of the data in the underlying source. This is a variant type structure. For this structure to be valid, only one of the attributes can be non-null.</p>
 */
@interface AWSQuicksightPhysicalTable : AWSModel


/**
 <p>A physical table type built from the results of the custom SQL query.</p>
 */
@property (nonatomic, strong) AWSQuicksightCustomSql * _Nullable customSql;

/**
 <p>A physical table type for relational data sources.</p>
 */
@property (nonatomic, strong) AWSQuicksightRelationalTable * _Nullable relationalTable;

/**
 <p>A physical table type for as S3 data source.</p>
 */
@property (nonatomic, strong) AWSQuicksightS3Source * _Nullable s3Source;

@end

/**
 <p>PostgreSQL parameters.</p>
 Required parameters: [Host, Port, Database]
 */
@interface AWSQuicksightPostgreSqlParameters : AWSModel


/**
 <p>Database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable database;

/**
 <p>Host.</p>
 */
@property (nonatomic, strong) NSString * _Nullable host;

/**
 <p>Port.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

@end

/**
 <p>Presto parameters.</p>
 Required parameters: [Host, Port, Catalog]
 */
@interface AWSQuicksightPrestoParameters : AWSModel


/**
 <p>Catalog.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalog;

/**
 <p>Host.</p>
 */
@property (nonatomic, strong) NSString * _Nullable host;

/**
 <p>Port.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

@end

/**
 <p>A transform operation that projects columns. Operations that come after a projection can only refer to projected columns.</p>
 Required parameters: [ProjectedColumns]
 */
@interface AWSQuicksightProjectOperation : AWSModel


/**
 <p>Projected columns.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable projectedColumns;

@end

/**
 <p>Information about a queued dataset SPICE ingestion.</p>
 Required parameters: [WaitingOnIngestion, QueuedIngestion]
 */
@interface AWSQuicksightQueueInfo : AWSModel


/**
 <p>The ID of the ongoing ingestion. The queued ingestion is waiting for the ongoing ingestion to complete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queuedIngestion;

/**
 <p>The ID of the queued ingestion.</p>
 */
@property (nonatomic, strong) NSString * _Nullable waitingOnIngestion;

@end

/**
 <p>Amazon RDS parameters.</p>
 Required parameters: [InstanceId, Database]
 */
@interface AWSQuicksightRdsParameters : AWSModel


/**
 <p>Database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable database;

/**
 <p>Instance ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 <p>Amazon Redshift parameters. The <code>ClusterId</code> field can be blank if <code>Host</code> and <code>Port</code> are both set. The <code>Host</code> and <code>Port</code> fields can be blank if the <code>ClusterId</code> field is set.</p>
 Required parameters: [Database]
 */
@interface AWSQuicksightRedshiftParameters : AWSModel


/**
 <p>Cluster ID. This field can be blank if the <code>Host</code> and <code>Port</code> are provided.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

/**
 <p>Database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable database;

/**
 <p>Host. This field can be blank if <code>ClusterId</code> is provided.</p>
 */
@property (nonatomic, strong) NSString * _Nullable host;

/**
 <p>Port. This field can be blank if the <code>ClusterId</code> is provided.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

@end

/**
 
 */
@interface AWSQuicksightRegisterUserRequest : AWSRequest


/**
 <p>The ID for the AWS account that the user is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The email address of the user that you want to register.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>The ARN of the IAM user or role that you are registering with Amazon QuickSight. </p>
 */
@property (nonatomic, strong) NSString * _Nullable iamArn;

/**
 <p>Amazon QuickSight supports several ways of managing the identity of users. This parameter accepts two values:</p><ul><li><p><code>IAM</code>: A user whose identity maps to an existing IAM user or role. </p></li><li><p><code>QUICKSIGHT</code>: A user whose identity is owned and managed internally by Amazon QuickSight. </p></li></ul>
 */
@property (nonatomic, assign) AWSQuicksightIdentityType identityType;

/**
 <p>The namespace. Currently, you should set this to <code>default</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>You need to use this parameter only when you register one or more users using an assumed IAM role. You don't need to provide the session name for other scenarios, for example when you are registering an IAM user or an Amazon QuickSight user. You can register multiple users using the same IAM role if each user has a different session name. For more information on assuming IAM roles, see <a href="https://awscli.amazonaws.com/v2/documentation/api/latest/reference/sts/assume-role.html"><code>assume-role</code></a> in the <i>AWS CLI Reference.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionName;

/**
 <p>The Amazon QuickSight user name that you want to create for the user you are registering.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

/**
 <p>The Amazon QuickSight role for the user. The user role can be one of the following:</p><ul><li><p><code>READER</code>: A user who has read-only access to dashboards.</p></li><li><p><code>AUTHOR</code>: A user who can create data sources, datasets, analyses, and dashboards.</p></li><li><p><code>ADMIN</code>: A user who is an author, who can also manage Amazon QuickSight settings.</p></li><li><p><code>RESTRICTED_READER</code>: This role isn't currently available for use.</p></li><li><p><code>RESTRICTED_AUTHOR</code>: This role isn't currently available for use.</p></li></ul>
 */
@property (nonatomic, assign) AWSQuicksightUserRole userRole;

@end

/**
 
 */
@interface AWSQuicksightRegisterUserResponse : AWSModel


/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

/**
 <p>The user name.</p>
 */
@property (nonatomic, strong) AWSQuicksightUser * _Nullable user;

/**
 <p>The URL the user visits to complete registration and provide a password. This is returned only for users with an identity type of <code>QUICKSIGHT</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userInvitationUrl;

@end

/**
 <p>A physical table type for relational data sources.</p>
 Required parameters: [DataSourceArn, Name, InputColumns]
 */
@interface AWSQuicksightRelationalTable : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceArn;

/**
 <p>The column schema of the table.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightInputColumn *> * _Nullable inputColumns;

/**
 <p>The name of the relational table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The schema name. This name applies to certain relational database engines.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schema;

@end

/**
 <p>A transform operation that renames a column.</p>
 Required parameters: [ColumnName, NewColumnName]
 */
@interface AWSQuicksightRenameColumnOperation : AWSModel


/**
 <p>The name of the column to be renamed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable columnName;

/**
 <p>The new name for the column.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestColumnName;

@end

/**
 <p>Permission for the resource.</p>
 Required parameters: [Principal, Actions]
 */
@interface AWSQuicksightResourcePermission : AWSModel


/**
 <p>The action to grant or revoke permissions on, for example <code>"quicksight:DescribeDashboard"</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable actions;

/**
 <p>The Amazon Resource Name (ARN) of an Amazon QuickSight user or group, or an IAM ARN. If you are using cross-account resource sharing, this is the IAM ARN of an account root. Otherwise, it is the ARN of a QuickSight user or group. .</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

@end

/**
 <p>Information about rows for a data set SPICE ingestion.</p>
 */
@interface AWSQuicksightRowInfo : AWSModel


/**
 <p>The number of rows that were not ingested.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable rowsDropped;

/**
 <p>The number of rows that were ingested.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable rowsIngested;

@end

/**
 <p>The row-level security configuration for the dataset.</p>
 Required parameters: [Arn, PermissionPolicy]
 */
@interface AWSQuicksightRowLevelPermissionDataSet : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the permission dataset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>Permission policy.</p>
 */
@property (nonatomic, assign) AWSQuicksightRowLevelPermissionPolicy permissionPolicy;

@end

/**
 <p>S3 parameters.</p>
 Required parameters: [ManifestFileLocation]
 */
@interface AWSQuicksightS3Parameters : AWSModel


/**
 <p>Location of the Amazon S3 manifest file. This is NULL if the manifest file was uploaded in the console.</p>
 */
@property (nonatomic, strong) AWSQuicksightManifestFileLocation * _Nullable manifestFileLocation;

@end

/**
 <p>A physical table type for as S3 data source.</p>
 Required parameters: [DataSourceArn, InputColumns]
 */
@interface AWSQuicksightS3Source : AWSModel


/**
 <p>The amazon Resource Name (ARN) for the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceArn;

/**
 <p>A physical table type for as S3 data source.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightInputColumn *> * _Nullable inputColumns;

/**
 <p>Information about the format for the S3 source file or files.</p>
 */
@property (nonatomic, strong) AWSQuicksightUploadSettings * _Nullable uploadSettings;

@end

/**
 
 */
@interface AWSQuicksightSearchDashboardsRequest : AWSRequest


/**
 <p>The ID of the AWS account that contains the user whose dashboards you're searching for. </p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The filters to apply to the search. Currently, you can search only by user name. For example, <code>"Filters": [ { "Name": "QUICKSIGHT_USER", "Operator": "StringEquals", "Value": "arn:aws:quicksight:us-east-1:1:user/default/UserName1" } ]</code></p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightDashboardSearchFilter *> * _Nullable filters;

/**
 <p>The maximum number of results to be returned per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results, or null if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSQuicksightSearchDashboardsResponse : AWSModel


/**
 <p>The list of dashboards owned by the user specified in <code>Filters</code> in your request.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightDashboardSummary *> * _Nullable dashboardSummaryList;

/**
 <p>The token for the next set of results, or null if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 <p>ServiceNow parameters.</p>
 Required parameters: [SiteBaseUrl]
 */
@interface AWSQuicksightServiceNowParameters : AWSModel


/**
 <p>URL of the base site.</p>
 */
@property (nonatomic, strong) NSString * _Nullable siteBaseUrl;

@end

/**
 <p>Sheet controls option.</p>
 */
@interface AWSQuicksightSheetControlsOption : AWSModel


/**
 <p>Visibility state.</p>
 */
@property (nonatomic, assign) AWSQuicksightDashboardUIState visibilityState;

@end

/**
 <p>Snowflake parameters.</p>
 Required parameters: [Host, Database, Warehouse]
 */
@interface AWSQuicksightSnowflakeParameters : AWSModel


/**
 <p>Database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable database;

/**
 <p>Host.</p>
 */
@property (nonatomic, strong) NSString * _Nullable host;

/**
 <p>Warehouse.</p>
 */
@property (nonatomic, strong) NSString * _Nullable warehouse;

@end

/**
 <p>Spark parameters.</p>
 Required parameters: [Host, Port]
 */
@interface AWSQuicksightSparkParameters : AWSModel


/**
 <p>Host.</p>
 */
@property (nonatomic, strong) NSString * _Nullable host;

/**
 <p>Port.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

@end

/**
 <p>SQL Server parameters.</p>
 Required parameters: [Host, Port, Database]
 */
@interface AWSQuicksightSqlServerParameters : AWSModel


/**
 <p>Database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable database;

/**
 <p>Host.</p>
 */
@property (nonatomic, strong) NSString * _Nullable host;

/**
 <p>Port.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

@end

/**
 <p>Secure Socket Layer (SSL) properties that apply when QuickSight connects to your underlying data source.</p>
 */
@interface AWSQuicksightSslProperties : AWSModel


/**
 <p>A Boolean option to control whether SSL should be disabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableSsl;

@end

/**
 <p>String parameter.</p>
 Required parameters: [Name, Values]
 */
@interface AWSQuicksightStringParameter : AWSModel


/**
 <p>A display name for the dataset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Values.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>The key or keys of the key-value pairs for the resource tag or tags assigned to the resource.</p>
 Required parameters: [Key, Value]
 */
@interface AWSQuicksightTag : AWSModel


/**
 <p>Tag key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Tag value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>A transform operation that tags a column with additional information.</p>
 Required parameters: [ColumnName, Tags]
 */
@interface AWSQuicksightTagColumnOperation : AWSModel


/**
 <p>The column that this operation acts on.</p>
 */
@property (nonatomic, strong) NSString * _Nullable columnName;

/**
 <p>The dataset column tag, currently only used for geospatial type tagging. .</p><note><p>This is not tags for the AWS tagging feature. .</p></note>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightColumnTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSQuicksightTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource that you want to tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>Contains a map of the key-value pairs for the resource tag or tags assigned to the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSQuicksightTagResourceResponse : AWSModel


/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 <p>A template object. A <i>template</i> is an entity in QuickSight that encapsulates the metadata required to create an analysis and that you can use to create a dashboard. A template adds a layer of abstraction by using placeholders to replace the dataset associated with the analysis. You can use templates to create dashboards by replacing dataset placeholders with datasets that follow the same schema that was used to create the source analysis and template.</p><p>You can share templates across AWS accounts by allowing users in other AWS accounts to create a template or a dashboard from an existing template.</p>
 */
@interface AWSQuicksightTemplate : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>Time when this was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>Time when this was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>The display name of the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ID for the template. This is unique per AWS Region for each AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateId;

/**
 <p>A structure describing the versions of the template.</p>
 */
@property (nonatomic, strong) AWSQuicksightTemplateVersion * _Nullable version;

@end

/**
 <p>The template alias.</p>
 */
@interface AWSQuicksightTemplateAlias : AWSModel


/**
 <p>The display name of the template alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aliasName;

/**
 <p>The Amazon Resource Name (ARN) of the template alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The version number of the template alias.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable templateVersionNumber;

@end

/**
 <p>List of errors that occurred when the template version creation failed.</p>
 */
@interface AWSQuicksightTemplateError : AWSModel


/**
 <p>Description of the error type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>Type of error.</p>
 */
@property (nonatomic, assign) AWSQuicksightTemplateErrorType types;

@end

/**
 <p>The source analysis of the template.</p>
 Required parameters: [Arn, DataSetReferences]
 */
@interface AWSQuicksightTemplateSourceAnalysis : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>A structure containing information about the dataset references used as placeholders in the template.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightDataSetReference *> * _Nullable dataSetReferences;

@end

/**
 <p>The source entity of the template.</p>
 */
@interface AWSQuicksightTemplateSourceEntity : AWSModel


/**
 <p>The source analysis, if it is based on an analysis.</p>
 */
@property (nonatomic, strong) AWSQuicksightTemplateSourceAnalysis * _Nullable sourceAnalysis;

/**
 <p>The source template, if it is based on an template.</p>
 */
@property (nonatomic, strong) AWSQuicksightTemplateSourceTemplate * _Nullable sourceTemplate;

@end

/**
 <p>The source template of the template.</p>
 Required parameters: [Arn]
 */
@interface AWSQuicksightTemplateSourceTemplate : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

/**
 <p>The template summary.</p>
 */
@interface AWSQuicksightTemplateSummary : AWSModel


/**
 <p>A summary of a template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The last time that this template was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The last time that this template was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>A structure containing a list of version numbers for the template summary.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable latestVersionNumber;

/**
 <p>A display name for the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ID of the template. This ID is unique per AWS Region for each AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateId;

@end

/**
 <p>A version of a template.</p>
 */
@interface AWSQuicksightTemplateVersion : AWSModel


/**
 <p>The time that this template version was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>Schema of the dataset identified by the placeholder. The idea is that any dashboard created from the template should be bound to new datasets matching the same schema described through this API. .</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightDataSetConfiguration *> * _Nullable dataSetConfigurations;

/**
 <p>The description of the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Errors associated with the template.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightTemplateError *> * _Nullable errors;

/**
 <p>The Amazon Resource Name (ARN) of the analysis or template which was used to create this template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceEntityArn;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, assign) AWSQuicksightResourceStatus status;

/**
 <p>The version number of the template.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable versionNumber;

@end

/**
 <p>The template version.</p>
 */
@interface AWSQuicksightTemplateVersionSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the template version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The time that this template version was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The description of the template version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The status of the template version.</p>
 */
@property (nonatomic, assign) AWSQuicksightResourceStatus status;

/**
 <p>The version number of the template version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable versionNumber;

@end

/**
 <p>Teradata parameters.</p>
 Required parameters: [Host, Port, Database]
 */
@interface AWSQuicksightTeradataParameters : AWSModel


/**
 <p>Database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable database;

/**
 <p>Host.</p>
 */
@property (nonatomic, strong) NSString * _Nullable host;

/**
 <p>Port.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

@end

/**
 <p>A data transformation on a logical table. This is a variant type structure. For this structure to be valid, only one of the attributes can be non-null.</p>
 */
@interface AWSQuicksightTransformOperation : AWSModel


/**
 <p>A transform operation that casts a column to a different type.</p>
 */
@property (nonatomic, strong) AWSQuicksightCastColumnTypeOperation * _Nullable castColumnTypeOperation;

/**
 <p>An operation that creates calculated columns. Columns created in one such operation form a lexical closure.</p>
 */
@property (nonatomic, strong) AWSQuicksightCreateColumnsOperation * _Nullable createColumnsOperation;

/**
 <p>An operation that filters rows based on some condition.</p>
 */
@property (nonatomic, strong) AWSQuicksightFilterOperation * _Nullable filterOperation;

/**
 <p>An operation that projects columns. Operations that come after a projection can only refer to projected columns.</p>
 */
@property (nonatomic, strong) AWSQuicksightProjectOperation * _Nullable projectOperation;

/**
 <p>An operation that renames a column.</p>
 */
@property (nonatomic, strong) AWSQuicksightRenameColumnOperation * _Nullable renameColumnOperation;

/**
 <p>An operation that tags a column with additional information.</p>
 */
@property (nonatomic, strong) AWSQuicksightTagColumnOperation * _Nullable tagColumnOperation;

@end

/**
 <p>Twitter parameters.</p>
 Required parameters: [Query, MaxRows]
 */
@interface AWSQuicksightTwitterParameters : AWSModel


/**
 <p>Maximum number of rows to query Twitter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRows;

/**
 <p>Twitter query string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable query;

@end

/**
 
 */
@interface AWSQuicksightUntagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource that you want to untag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The keys of the key-value pairs for the resource tag or tags assigned to the resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSQuicksightUntagResourceResponse : AWSModel


/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightUpdateDashboardPermissionsRequest : AWSRequest


/**
 <p>The ID of the AWS account that contains the dashboard whose permissions you're updating.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID for the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardId;

/**
 <p>The permissions that you want to grant on this resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightResourcePermission *> * _Nullable grantPermissions;

/**
 <p>The permissions that you want to revoke from this resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightResourcePermission *> * _Nullable revokePermissions;

@end

/**
 
 */
@interface AWSQuicksightUpdateDashboardPermissionsResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardArn;

/**
 <p>The ID for the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardId;

/**
 <p>Information about the permissions on the dashboard.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightResourcePermission *> * _Nullable permissions;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightUpdateDashboardPublishedVersionRequest : AWSRequest


/**
 <p>The ID of the AWS account that contains the dashboard that you're updating.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID for the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardId;

/**
 <p>The version number of the dashboard.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable versionNumber;

@end

/**
 
 */
@interface AWSQuicksightUpdateDashboardPublishedVersionResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardArn;

/**
 <p>The ID for the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardId;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightUpdateDashboardRequest : AWSRequest


/**
 <p>The ID of the AWS account that contains the dashboard that you're updating.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID for the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardId;

/**
 <p>Options for publishing the dashboard when you create it:</p><ul><li><p><code>AvailabilityStatus</code> for <code>AdHocFilteringOption</code> - This status can be either <code>ENABLED</code> or <code>DISABLED</code>. When this is set to <code>DISABLED</code>, QuickSight disables the left filter pane on the published dashboard, which can be used for ad hoc (one-time) filtering. This option is <code>ENABLED</code> by default. </p></li><li><p><code>AvailabilityStatus</code> for <code>ExportToCSVOption</code> - This status can be either <code>ENABLED</code> or <code>DISABLED</code>. The visual option to export data to .csv format isn't enabled when this is set to <code>DISABLED</code>. This option is <code>ENABLED</code> by default. </p></li><li><p><code>VisibilityState</code> for <code>SheetControlsOption</code> - This visibility state can be either <code>COLLAPSED</code> or <code>EXPANDED</code>. The sheet controls pane is collapsed by default when set to true. This option is <code>COLLAPSED</code> by default. </p></li></ul>
 */
@property (nonatomic, strong) AWSQuicksightDashboardPublishOptions * _Nullable dashboardPublishOptions;

/**
 <p>The display name of the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A structure that contains the parameters of the dashboard.</p>
 */
@property (nonatomic, strong) AWSQuicksightParameters * _Nullable parameters;

/**
 <p>The template or analysis from which the dashboard is created. The <code>SouceTemplate</code> entity accepts the Amazon Resource Name (ARN) of the template and also references to replacement datasets for the placeholders set when creating the template. The replacement datasets need to follow the same schema as the datasets for which placeholders were created when creating the template.</p>
 */
@property (nonatomic, strong) AWSQuicksightDashboardSourceEntity * _Nullable sourceEntity;

/**
 <p>A description for the first version of the dashboard being created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionDescription;

@end

/**
 
 */
@interface AWSQuicksightUpdateDashboardResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The creation status of the request.</p>
 */
@property (nonatomic, assign) AWSQuicksightResourceStatus creationStatus;

/**
 <p>The ID for the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardId;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

/**
 <p>The ARN of the dashboard, including the version number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionArn;

@end

/**
 
 */
@interface AWSQuicksightUpdateDataSetPermissionsRequest : AWSRequest


/**
 <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID for the dataset whose permissions you want to update. This ID is unique per AWS Region for each AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>The resource permissions that you want to grant to the dataset.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightResourcePermission *> * _Nullable grantPermissions;

/**
 <p>The resource permissions that you want to revoke from the dataset.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightResourcePermission *> * _Nullable revokePermissions;

@end

/**
 
 */
@interface AWSQuicksightUpdateDataSetPermissionsResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the dataset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetArn;

/**
 <p>The ID for the dataset whose permissions you want to update. This ID is unique per AWS Region for each AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightUpdateDataSetRequest : AWSRequest


/**
 <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>Groupings of columns that work together in certain QuickSight features. Currently, only geospatial hierarchy is supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightColumnGroup *> * _Nullable columnGroups;

/**
 <p>The ID for the dataset that you want to update. This ID is unique per AWS Region for each AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>Indicates whether you want to import the data into SPICE.</p>
 */
@property (nonatomic, assign) AWSQuicksightDataSetImportMode importMode;

/**
 <p>Configures the combination and transformation of the data from the physical tables.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSQuicksightLogicalTable *> * _Nullable logicalTableMap;

/**
 <p>The display name for the dataset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Declares the physical tables that are available in the underlying data sources.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSQuicksightPhysicalTable *> * _Nullable physicalTableMap;

/**
 <p>The row-level security configuration for the data you want to create.</p>
 */
@property (nonatomic, strong) AWSQuicksightRowLevelPermissionDataSet * _Nullable rowLevelPermissionDataSet;

@end

/**
 
 */
@interface AWSQuicksightUpdateDataSetResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the dataset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The ID for the dataset that you want to create. This ID is unique per AWS Region for each AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>The ARN for the ingestion, which is triggered as a result of dataset creation if the import mode is SPICE.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ingestionArn;

/**
 <p>The ID of the ingestion, which is triggered as a result of dataset creation if the import mode is SPICE.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ingestionId;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightUpdateDataSourcePermissionsRequest : AWSRequest


/**
 <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID of the data source. This ID is unique per AWS Region for each AWS account. </p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

/**
 <p>A list of resource permissions that you want to grant on the data source.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightResourcePermission *> * _Nullable grantPermissions;

/**
 <p>A list of resource permissions that you want to revoke on the data source.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightResourcePermission *> * _Nullable revokePermissions;

@end

/**
 
 */
@interface AWSQuicksightUpdateDataSourcePermissionsResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceArn;

/**
 <p>The ID of the data source. This ID is unique per AWS Region for each AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightUpdateDataSourceRequest : AWSRequest


/**
 <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The credentials that QuickSight that uses to connect to your underlying source. Currently, only credentials based on user name and password are supported.</p>
 */
@property (nonatomic, strong) AWSQuicksightDataSourceCredentials * _Nullable credentials;

/**
 <p>The ID of the data source. This ID is unique per AWS Region for each AWS account. </p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

/**
 <p>The parameters that QuickSight uses to connect to your underlying source.</p>
 */
@property (nonatomic, strong) AWSQuicksightDataSourceParameters * _Nullable dataSourceParameters;

/**
 <p>A display name for the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Secure Socket Layer (SSL) properties that apply when QuickSight connects to your underlying source.</p>
 */
@property (nonatomic, strong) AWSQuicksightSslProperties * _Nullable sslProperties;

/**
 <p>Use this parameter only when you want QuickSight to use a VPC connection when connecting to your underlying source.</p>
 */
@property (nonatomic, strong) AWSQuicksightVpcConnectionProperties * _Nullable vpcConnectionProperties;

@end

/**
 
 */
@interface AWSQuicksightUpdateDataSourceResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The ID of the data source. This ID is unique per AWS Region for each AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

/**
 <p>The update status of the data source's last update.</p>
 */
@property (nonatomic, assign) AWSQuicksightResourceStatus updateStatus;

@end

/**
 
 */
@interface AWSQuicksightUpdateGroupRequest : AWSRequest


/**
 <p>The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The description for the group that you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the group that you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The namespace. Currently, you should set this to <code>default</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

@end

/**
 
 */
@interface AWSQuicksightUpdateGroupResponse : AWSModel


/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) AWSQuicksightGroup * _Nullable group;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightUpdateIAMPolicyAssignmentRequest : AWSRequest


/**
 <p>The name of the assignment. This name must be unique within an AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assignmentName;

/**
 <p>The status of the assignment. Possible values are as follows:</p><ul><li><p><code>ENABLED</code> - Anything specified in this assignment is used when creating the data source.</p></li><li><p><code>DISABLED</code> - This assignment isn't used when creating the data source.</p></li><li><p><code>DRAFT</code> - This assignment is an unfinished draft and isn't used when creating the data source.</p></li></ul>
 */
@property (nonatomic, assign) AWSQuicksightAssignmentStatus assignmentStatus;

/**
 <p>The ID of the AWS account that contains the IAM policy assignment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The QuickSight users, groups, or both that you want to assign the policy to.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable identities;

/**
 <p>The namespace of the assignment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>The ARN for the IAM policy to apply to the QuickSight users and groups specified in this assignment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

@end

/**
 
 */
@interface AWSQuicksightUpdateIAMPolicyAssignmentResponse : AWSModel


/**
 <p>The ID of the assignment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assignmentId;

/**
 <p>The name of the assignment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable assignmentName;

/**
 <p>The status of the assignment. Possible values are as follows:</p><ul><li><p><code>ENABLED</code> - Anything specified in this assignment is used when creating the data source.</p></li><li><p><code>DISABLED</code> - This assignment isn't used when creating the data source.</p></li><li><p><code>DRAFT</code> - This assignment is an unfinished draft and isn't used when creating the data source.</p></li></ul>
 */
@property (nonatomic, assign) AWSQuicksightAssignmentStatus assignmentStatus;

/**
 <p>The QuickSight users, groups, or both that the IAM policy is assigned to.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable identities;

/**
 <p>The ARN for the IAM policy applied to the QuickSight users and groups specified in this assignment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSQuicksightUpdateTemplateAliasRequest : AWSRequest


/**
 <p>The alias of the template that you want to update. If you name a specific alias, you update the version that the alias points to. You can specify the latest version of the template by providing the keyword <code>$LATEST</code> in the <code>AliasName</code> parameter. The keyword <code>$PUBLISHED</code> doesn't apply to templates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aliasName;

/**
 <p>The ID of the AWS account that contains the template alias that you're updating.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The ID for the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateId;

/**
 <p>The version number of the template.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable templateVersionNumber;

@end

/**
 
 */
@interface AWSQuicksightUpdateTemplateAliasResponse : AWSModel


/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

/**
 <p>The template alias.</p>
 */
@property (nonatomic, strong) AWSQuicksightTemplateAlias * _Nullable templateAlias;

@end

/**
 
 */
@interface AWSQuicksightUpdateTemplatePermissionsRequest : AWSRequest


/**
 <p>The ID of the AWS account that contains the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>A list of resource permissions to be granted on the template. </p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightResourcePermission *> * _Nullable grantPermissions;

/**
 <p>A list of resource permissions to be revoked from the template. </p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightResourcePermission *> * _Nullable revokePermissions;

/**
 <p>The ID for the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateId;

@end

/**
 
 */
@interface AWSQuicksightUpdateTemplatePermissionsResponse : AWSModel


/**
 <p>A list of resource permissions to be set on the template.</p>
 */
@property (nonatomic, strong) NSArray<AWSQuicksightResourcePermission *> * _Nullable permissions;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

/**
 <p>The Amazon Resource Name (ARN) of the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateArn;

/**
 <p>The ID for the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateId;

@end

/**
 
 */
@interface AWSQuicksightUpdateTemplateRequest : AWSRequest


/**
 <p>The ID of the AWS account that contains the template that you're updating.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The name for the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The source QuickSight entity from which this template is being updated. You can currently update templates from an Analysis or another template.</p>
 */
@property (nonatomic, strong) AWSQuicksightTemplateSourceEntity * _Nullable sourceEntity;

/**
 <p>The ID for the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateId;

/**
 <p>A description of the current template version that is being updated. Every time you call <code>UpdateTemplate</code>, you create a new version of the template. Each version of the template maintains a description of the version in the <code>VersionDescription</code> field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionDescription;

@end

/**
 
 */
@interface AWSQuicksightUpdateTemplateResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The creation status of the template.</p>
 */
@property (nonatomic, assign) AWSQuicksightResourceStatus creationStatus;

/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

/**
 <p>The ID for the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateId;

/**
 <p>The ARN for the template, including the version information of the first version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionArn;

@end

/**
 
 */
@interface AWSQuicksightUpdateUserRequest : AWSRequest


/**
 <p>The ID for the AWS account that the user is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The email address of the user that you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>The namespace. Currently, you should set this to <code>default</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>The Amazon QuickSight role of the user. The user role can be one of the following:</p><ul><li><p><code>READER</code>: A user who has read-only access to dashboards.</p></li><li><p><code>AUTHOR</code>: A user who can create data sources, datasets, analyses, and dashboards.</p></li><li><p><code>ADMIN</code>: A user who is an author, who can also manage Amazon QuickSight settings.</p></li></ul>
 */
@property (nonatomic, assign) AWSQuicksightUserRole role;

/**
 <p>The Amazon QuickSight user name that you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSQuicksightUpdateUserResponse : AWSModel


/**
 <p>The AWS request ID for this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>The HTTP status of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

/**
 <p>The Amazon QuickSight user.</p>
 */
@property (nonatomic, strong) AWSQuicksightUser * _Nullable user;

@end

/**
 <p>Information about the format for a source file or files.</p>
 */
@interface AWSQuicksightUploadSettings : AWSModel


/**
 <p>Whether the file has a header row, or the files each have a header row.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable containsHeader;

/**
 <p>The delimiter between values in the file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable delimiter;

/**
 <p>File format.</p>
 */
@property (nonatomic, assign) AWSQuicksightFileFormat format;

/**
 <p>A row number to start reading data from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable startFromRow;

/**
 <p>Text qualifier.</p>
 */
@property (nonatomic, assign) AWSQuicksightTextQualifier textQualifier;

@end

/**
 <p>A registered user of Amazon QuickSight. Currently, an Amazon QuickSight subscription can't contain more than 20 million users.</p>
 */
@interface AWSQuicksightUser : AWSModel


/**
 <p>The active status of user. When you create an Amazon QuickSight user that’s not an IAM user or an Active Directory user, that user is inactive until they sign in and provide a password.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable active;

/**
 <p>The Amazon Resource Name (ARN) for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The user's email address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>The type of identity authentication used by the user.</p>
 */
@property (nonatomic, assign) AWSQuicksightIdentityType identityType;

/**
 <p>The principal ID of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principalId;

/**
 <p>The Amazon QuickSight role for the user. The user role can be one of the following:.</p><ul><li><p><code>READER</code>: A user who has read-only access to dashboards.</p></li><li><p><code>AUTHOR</code>: A user who can create data sources, datasets, analyses, and dashboards.</p></li><li><p><code>ADMIN</code>: A user who is an author, who can also manage Amazon QuickSight settings.</p></li><li><p><code>RESTRICTED_READER</code>: This role isn't currently available for use.</p></li><li><p><code>RESTRICTED_AUTHOR</code>: This role isn't currently available for use.</p></li></ul>
 */
@property (nonatomic, assign) AWSQuicksightUserRole role;

/**
 <p>The user's user name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>VPC connection properties.</p>
 Required parameters: [VpcConnectionArn]
 */
@interface AWSQuicksightVpcConnectionProperties : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the VPC connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcConnectionArn;

@end

NS_ASSUME_NONNULL_END
