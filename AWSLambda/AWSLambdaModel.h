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

FOUNDATION_EXPORT NSString *const AWSLambdaErrorDomain;

typedef NS_ENUM(NSInteger, AWSLambdaErrorType) {
    AWSLambdaErrorUnknown,
    AWSLambdaErrorCodeSigningConfigNotFound,
    AWSLambdaErrorCodeStorageExceeded,
    AWSLambdaErrorCodeVerificationFailed,
    AWSLambdaErrorEC2AccessDenied,
    AWSLambdaErrorEC2Throttled,
    AWSLambdaErrorEC2Unexpected,
    AWSLambdaErrorEFSIO,
    AWSLambdaErrorEFSMountConnectivity,
    AWSLambdaErrorEFSMountFailure,
    AWSLambdaErrorEFSMountTimeout,
    AWSLambdaErrorENILimitReached,
    AWSLambdaErrorInvalidCodeSignature,
    AWSLambdaErrorInvalidParameterValue,
    AWSLambdaErrorInvalidRequestContent,
    AWSLambdaErrorInvalidRuntime,
    AWSLambdaErrorInvalidSecurityGroupID,
    AWSLambdaErrorInvalidSubnetID,
    AWSLambdaErrorInvalidZipFile,
    AWSLambdaErrorKMSAccessDenied,
    AWSLambdaErrorKMSDisabled,
    AWSLambdaErrorKMSInvalidState,
    AWSLambdaErrorKMSNotFound,
    AWSLambdaErrorPolicyLengthExceeded,
    AWSLambdaErrorPreconditionFailed,
    AWSLambdaErrorProvisionedConcurrencyConfigNotFound,
    AWSLambdaErrorRequestTooLarge,
    AWSLambdaErrorResourceConflict,
    AWSLambdaErrorResourceInUse,
    AWSLambdaErrorResourceNotFound,
    AWSLambdaErrorResourceNotReady,
    AWSLambdaErrorService,
    AWSLambdaErrorSnapStart,
    AWSLambdaErrorSnapStartNotReady,
    AWSLambdaErrorSnapStartTimeout,
    AWSLambdaErrorSubnetIPAddressLimitReached,
    AWSLambdaErrorTooManyRequests,
    AWSLambdaErrorUnsupportedMediaType,
};

typedef NS_ENUM(NSInteger, AWSLambdaArchitecture) {
    AWSLambdaArchitectureUnknown,
    AWSLambdaArchitectureX86_64,
    AWSLambdaArchitectureArm64,
};

typedef NS_ENUM(NSInteger, AWSLambdaCodeSigningPolicy) {
    AWSLambdaCodeSigningPolicyUnknown,
    AWSLambdaCodeSigningPolicyWarn,
    AWSLambdaCodeSigningPolicyEnforce,
};

typedef NS_ENUM(NSInteger, AWSLambdaEndPointType) {
    AWSLambdaEndPointTypeUnknown,
    AWSLambdaEndPointTypeKafkaBootstrapServers,
};

typedef NS_ENUM(NSInteger, AWSLambdaEventSourcePosition) {
    AWSLambdaEventSourcePositionUnknown,
    AWSLambdaEventSourcePositionTrimHorizon,
    AWSLambdaEventSourcePositionLatest,
    AWSLambdaEventSourcePositionAtTimestamp,
};

typedef NS_ENUM(NSInteger, AWSLambdaFullDocument) {
    AWSLambdaFullDocumentUnknown,
    AWSLambdaFullDocumentUpdateLookup,
    AWSLambdaFullDocumentDefault,
};

typedef NS_ENUM(NSInteger, AWSLambdaFunctionResponseType) {
    AWSLambdaFunctionResponseTypeUnknown,
    AWSLambdaFunctionResponseTypeReportBatchItemFailures,
};

typedef NS_ENUM(NSInteger, AWSLambdaFunctionUrlAuthType) {
    AWSLambdaFunctionUrlAuthTypeUnknown,
    AWSLambdaFunctionUrlAuthTypeNone,
    AWSLambdaFunctionUrlAuthTypeAwsIam,
};

typedef NS_ENUM(NSInteger, AWSLambdaFunctionVersion) {
    AWSLambdaFunctionVersionUnknown,
    AWSLambdaFunctionVersionAll,
};

typedef NS_ENUM(NSInteger, AWSLambdaInvocationType) {
    AWSLambdaInvocationTypeUnknown,
    AWSLambdaInvocationTypeEvent,
    AWSLambdaInvocationTypeRequestResponse,
    AWSLambdaInvocationTypeDryRun,
};

typedef NS_ENUM(NSInteger, AWSLambdaInvokeMode) {
    AWSLambdaInvokeModeUnknown,
    AWSLambdaInvokeModeBuffered,
    AWSLambdaInvokeModeResponseStream,
};

typedef NS_ENUM(NSInteger, AWSLambdaLastUpdateStatus) {
    AWSLambdaLastUpdateStatusUnknown,
    AWSLambdaLastUpdateStatusSuccessful,
    AWSLambdaLastUpdateStatusFailed,
    AWSLambdaLastUpdateStatusInProgress,
};

typedef NS_ENUM(NSInteger, AWSLambdaLastUpdateStatusReasonCode) {
    AWSLambdaLastUpdateStatusReasonCodeUnknown,
    AWSLambdaLastUpdateStatusReasonCodeEniLimitExceeded,
    AWSLambdaLastUpdateStatusReasonCodeInsufficientRolePermissions,
    AWSLambdaLastUpdateStatusReasonCodeInvalidConfiguration,
    AWSLambdaLastUpdateStatusReasonCodeInternalError,
    AWSLambdaLastUpdateStatusReasonCodeSubnetOutOfIPAddresses,
    AWSLambdaLastUpdateStatusReasonCodeInvalidSubnet,
    AWSLambdaLastUpdateStatusReasonCodeInvalidSecurityGroup,
    AWSLambdaLastUpdateStatusReasonCodeImageDeleted,
    AWSLambdaLastUpdateStatusReasonCodeImageAccessDenied,
    AWSLambdaLastUpdateStatusReasonCodeInvalidImage,
    AWSLambdaLastUpdateStatusReasonCodeKMSKeyAccessDenied,
    AWSLambdaLastUpdateStatusReasonCodeKMSKeyNotFound,
    AWSLambdaLastUpdateStatusReasonCodeInvalidStateKMSKey,
    AWSLambdaLastUpdateStatusReasonCodeDisabledKMSKey,
    AWSLambdaLastUpdateStatusReasonCodeEFSIOError,
    AWSLambdaLastUpdateStatusReasonCodeEFSMountConnectivityError,
    AWSLambdaLastUpdateStatusReasonCodeEFSMountFailure,
    AWSLambdaLastUpdateStatusReasonCodeEFSMountTimeout,
    AWSLambdaLastUpdateStatusReasonCodeInvalidRuntime,
    AWSLambdaLastUpdateStatusReasonCodeInvalidZipFileException,
    AWSLambdaLastUpdateStatusReasonCodeFunctionError,
};

typedef NS_ENUM(NSInteger, AWSLambdaLogType) {
    AWSLambdaLogTypeUnknown,
    AWSLambdaLogTypeNone,
    AWSLambdaLogTypeTail,
};

typedef NS_ENUM(NSInteger, AWSLambdaPackageType) {
    AWSLambdaPackageTypeUnknown,
    AWSLambdaPackageTypeZip,
    AWSLambdaPackageTypeImage,
};

typedef NS_ENUM(NSInteger, AWSLambdaProvisionedConcurrencyStatusEnum) {
    AWSLambdaProvisionedConcurrencyStatusEnumUnknown,
    AWSLambdaProvisionedConcurrencyStatusEnumInProgress,
    AWSLambdaProvisionedConcurrencyStatusEnumReady,
    AWSLambdaProvisionedConcurrencyStatusEnumFailed,
};

typedef NS_ENUM(NSInteger, AWSLambdaResponseStreamingInvocationType) {
    AWSLambdaResponseStreamingInvocationTypeUnknown,
    AWSLambdaResponseStreamingInvocationTypeRequestResponse,
    AWSLambdaResponseStreamingInvocationTypeDryRun,
};

typedef NS_ENUM(NSInteger, AWSLambdaRuntime) {
    AWSLambdaRuntimeUnknown,
    AWSLambdaRuntimeNodejs,
    AWSLambdaRuntimeNodejs43,
    AWSLambdaRuntimeNodejs610,
    AWSLambdaRuntimeNodejs810,
    AWSLambdaRuntimeNodejs10X,
    AWSLambdaRuntimeNodejs12X,
    AWSLambdaRuntimeNodejs14X,
    AWSLambdaRuntimeNodejs16X,
    AWSLambdaRuntimeJava8,
    AWSLambdaRuntimeJava8Al2,
    AWSLambdaRuntimeJava11,
    AWSLambdaRuntimePython27,
    AWSLambdaRuntimePython36,
    AWSLambdaRuntimePython37,
    AWSLambdaRuntimePython38,
    AWSLambdaRuntimePython39,
    AWSLambdaRuntimeDotnetcore10,
    AWSLambdaRuntimeDotnetcore20,
    AWSLambdaRuntimeDotnetcore21,
    AWSLambdaRuntimeDotnetcore31,
    AWSLambdaRuntimeDotnet6,
    AWSLambdaRuntimeNodejs43Edge,
    AWSLambdaRuntimeGo1X,
    AWSLambdaRuntimeRuby25,
    AWSLambdaRuntimeRuby27,
    AWSLambdaRuntimeProvided,
    AWSLambdaRuntimeProvidedAl2,
    AWSLambdaRuntimeNodejs18X,
    AWSLambdaRuntimePython310,
};

typedef NS_ENUM(NSInteger, AWSLambdaSnapStartApplyOn) {
    AWSLambdaSnapStartApplyOnUnknown,
    AWSLambdaSnapStartApplyOnPublishedVersions,
    AWSLambdaSnapStartApplyOnNone,
};

typedef NS_ENUM(NSInteger, AWSLambdaSnapStartOptimizationStatus) {
    AWSLambdaSnapStartOptimizationStatusUnknown,
    AWSLambdaSnapStartOptimizationStatusOn,
    AWSLambdaSnapStartOptimizationStatusOff,
};

typedef NS_ENUM(NSInteger, AWSLambdaSourceAccessType) {
    AWSLambdaSourceAccessTypeUnknown,
    AWSLambdaSourceAccessTypeBasicAuth,
    AWSLambdaSourceAccessTypeVpcSubnet,
    AWSLambdaSourceAccessTypeVpcSecurityGroup,
    AWSLambdaSourceAccessTypeSaslScram512Auth,
    AWSLambdaSourceAccessTypeSaslScram256Auth,
    AWSLambdaSourceAccessTypeVirtualHost,
    AWSLambdaSourceAccessTypeClientCertificateTlsAuth,
    AWSLambdaSourceAccessTypeServerRootCaCertificate,
};

typedef NS_ENUM(NSInteger, AWSLambdaState) {
    AWSLambdaStateUnknown,
    AWSLambdaStatePending,
    AWSLambdaStateActive,
    AWSLambdaStateInactive,
    AWSLambdaStateFailed,
};

typedef NS_ENUM(NSInteger, AWSLambdaStateReasonCode) {
    AWSLambdaStateReasonCodeUnknown,
    AWSLambdaStateReasonCodeIdle,
    AWSLambdaStateReasonCodeCreating,
    AWSLambdaStateReasonCodeRestoring,
    AWSLambdaStateReasonCodeEniLimitExceeded,
    AWSLambdaStateReasonCodeInsufficientRolePermissions,
    AWSLambdaStateReasonCodeInvalidConfiguration,
    AWSLambdaStateReasonCodeInternalError,
    AWSLambdaStateReasonCodeSubnetOutOfIPAddresses,
    AWSLambdaStateReasonCodeInvalidSubnet,
    AWSLambdaStateReasonCodeInvalidSecurityGroup,
    AWSLambdaStateReasonCodeImageDeleted,
    AWSLambdaStateReasonCodeImageAccessDenied,
    AWSLambdaStateReasonCodeInvalidImage,
    AWSLambdaStateReasonCodeKMSKeyAccessDenied,
    AWSLambdaStateReasonCodeKMSKeyNotFound,
    AWSLambdaStateReasonCodeInvalidStateKMSKey,
    AWSLambdaStateReasonCodeDisabledKMSKey,
    AWSLambdaStateReasonCodeEFSIOError,
    AWSLambdaStateReasonCodeEFSMountConnectivityError,
    AWSLambdaStateReasonCodeEFSMountFailure,
    AWSLambdaStateReasonCodeEFSMountTimeout,
    AWSLambdaStateReasonCodeInvalidRuntime,
    AWSLambdaStateReasonCodeInvalidZipFileException,
    AWSLambdaStateReasonCodeFunctionError,
};

typedef NS_ENUM(NSInteger, AWSLambdaThrottleReason) {
    AWSLambdaThrottleReasonUnknown,
    AWSLambdaThrottleReasonConcurrentInvocationLimitExceeded,
    AWSLambdaThrottleReasonFunctionInvocationRateLimitExceeded,
    AWSLambdaThrottleReasonReservedFunctionConcurrentInvocationLimitExceeded,
    AWSLambdaThrottleReasonReservedFunctionInvocationRateLimitExceeded,
    AWSLambdaThrottleReasonCallerRateLimitExceeded,
    AWSLambdaThrottleReasonConcurrentSnapshotCreateLimitExceeded,
};

typedef NS_ENUM(NSInteger, AWSLambdaTracingMode) {
    AWSLambdaTracingModeUnknown,
    AWSLambdaTracingModeActive,
    AWSLambdaTracingModePassThrough,
};

typedef NS_ENUM(NSInteger, AWSLambdaUpdateRuntimeOn) {
    AWSLambdaUpdateRuntimeOnUnknown,
    AWSLambdaUpdateRuntimeOnAuto,
    AWSLambdaUpdateRuntimeOnManual,
    AWSLambdaUpdateRuntimeOnFunctionUpdate,
};

@class AWSLambdaAccountLimit;
@class AWSLambdaAccountUsage;
@class AWSLambdaAddLayerVersionPermissionRequest;
@class AWSLambdaAddLayerVersionPermissionResponse;
@class AWSLambdaAddPermissionRequest;
@class AWSLambdaAddPermissionResponse;
@class AWSLambdaAliasConfiguration;
@class AWSLambdaAliasRoutingConfiguration;
@class AWSLambdaAllowedPublishers;
@class AWSLambdaAmazonManagedKafkaEventSourceConfig;
@class AWSLambdaCodeSigningConfig;
@class AWSLambdaCodeSigningPolicies;
@class AWSLambdaConcurrency;
@class AWSLambdaCors;
@class AWSLambdaCreateAliasRequest;
@class AWSLambdaCreateCodeSigningConfigRequest;
@class AWSLambdaCreateCodeSigningConfigResponse;
@class AWSLambdaCreateEventSourceMappingRequest;
@class AWSLambdaCreateFunctionRequest;
@class AWSLambdaCreateFunctionUrlConfigRequest;
@class AWSLambdaCreateFunctionUrlConfigResponse;
@class AWSLambdaDeadLetterConfig;
@class AWSLambdaDeleteAliasRequest;
@class AWSLambdaDeleteCodeSigningConfigRequest;
@class AWSLambdaDeleteCodeSigningConfigResponse;
@class AWSLambdaDeleteEventSourceMappingRequest;
@class AWSLambdaDeleteFunctionCodeSigningConfigRequest;
@class AWSLambdaDeleteFunctionConcurrencyRequest;
@class AWSLambdaDeleteFunctionEventInvokeConfigRequest;
@class AWSLambdaDeleteFunctionRequest;
@class AWSLambdaDeleteFunctionUrlConfigRequest;
@class AWSLambdaDeleteLayerVersionRequest;
@class AWSLambdaDeleteProvisionedConcurrencyConfigRequest;
@class AWSLambdaDestinationConfig;
@class AWSLambdaDocumentDBEventSourceConfig;
@class AWSLambdaEnvironment;
@class AWSLambdaEnvironmentError;
@class AWSLambdaEnvironmentResponse;
@class AWSLambdaEphemeralStorage;
@class AWSLambdaEventSourceMappingConfiguration;
@class AWSLambdaFileSystemConfig;
@class AWSLambdaFilter;
@class AWSLambdaFilterCriteria;
@class AWSLambdaFunctionCode;
@class AWSLambdaFunctionCodeLocation;
@class AWSLambdaFunctionConfiguration;
@class AWSLambdaFunctionEventInvokeConfig;
@class AWSLambdaFunctionUrlConfig;
@class AWSLambdaGetAccountSettingsRequest;
@class AWSLambdaGetAccountSettingsResponse;
@class AWSLambdaGetAliasRequest;
@class AWSLambdaGetCodeSigningConfigRequest;
@class AWSLambdaGetCodeSigningConfigResponse;
@class AWSLambdaGetEventSourceMappingRequest;
@class AWSLambdaGetFunctionCodeSigningConfigRequest;
@class AWSLambdaGetFunctionCodeSigningConfigResponse;
@class AWSLambdaGetFunctionConcurrencyRequest;
@class AWSLambdaGetFunctionConcurrencyResponse;
@class AWSLambdaGetFunctionConfigurationRequest;
@class AWSLambdaGetFunctionEventInvokeConfigRequest;
@class AWSLambdaGetFunctionRequest;
@class AWSLambdaGetFunctionResponse;
@class AWSLambdaGetFunctionUrlConfigRequest;
@class AWSLambdaGetFunctionUrlConfigResponse;
@class AWSLambdaGetLayerVersionByArnRequest;
@class AWSLambdaGetLayerVersionPolicyRequest;
@class AWSLambdaGetLayerVersionPolicyResponse;
@class AWSLambdaGetLayerVersionRequest;
@class AWSLambdaGetLayerVersionResponse;
@class AWSLambdaGetPolicyRequest;
@class AWSLambdaGetPolicyResponse;
@class AWSLambdaGetProvisionedConcurrencyConfigRequest;
@class AWSLambdaGetProvisionedConcurrencyConfigResponse;
@class AWSLambdaGetRuntimeManagementConfigRequest;
@class AWSLambdaGetRuntimeManagementConfigResponse;
@class AWSLambdaImageConfig;
@class AWSLambdaImageConfigError;
@class AWSLambdaImageConfigResponse;
@class AWSLambdaInvocationRequest;
@class AWSLambdaInvocationResponse;
@class AWSLambdaInvokeAsyncRequest;
@class AWSLambdaInvokeAsyncResponse;
@class AWSLambdaInvokeResponseStreamUpdate;
@class AWSLambdaInvokeWithResponseStreamCompleteEvent;
@class AWSLambdaInvokeWithResponseStreamRequest;
@class AWSLambdaInvokeWithResponseStreamResponse;
@class AWSLambdaInvokeWithResponseStreamResponseEvent;
@class AWSLambdaLayer;
@class AWSLambdaLayerVersionContentInput;
@class AWSLambdaLayerVersionContentOutput;
@class AWSLambdaLayerVersionsListItem;
@class AWSLambdaLayersListItem;
@class AWSLambdaListAliasesRequest;
@class AWSLambdaListAliasesResponse;
@class AWSLambdaListCodeSigningConfigsRequest;
@class AWSLambdaListCodeSigningConfigsResponse;
@class AWSLambdaListEventSourceMappingsRequest;
@class AWSLambdaListEventSourceMappingsResponse;
@class AWSLambdaListFunctionEventInvokeConfigsRequest;
@class AWSLambdaListFunctionEventInvokeConfigsResponse;
@class AWSLambdaListFunctionUrlConfigsRequest;
@class AWSLambdaListFunctionUrlConfigsResponse;
@class AWSLambdaListFunctionsByCodeSigningConfigRequest;
@class AWSLambdaListFunctionsByCodeSigningConfigResponse;
@class AWSLambdaListFunctionsRequest;
@class AWSLambdaListFunctionsResponse;
@class AWSLambdaListLayerVersionsRequest;
@class AWSLambdaListLayerVersionsResponse;
@class AWSLambdaListLayersRequest;
@class AWSLambdaListLayersResponse;
@class AWSLambdaListProvisionedConcurrencyConfigsRequest;
@class AWSLambdaListProvisionedConcurrencyConfigsResponse;
@class AWSLambdaListTagsRequest;
@class AWSLambdaListTagsResponse;
@class AWSLambdaListVersionsByFunctionRequest;
@class AWSLambdaListVersionsByFunctionResponse;
@class AWSLambdaOnFailure;
@class AWSLambdaOnSuccess;
@class AWSLambdaProvisionedConcurrencyConfigListItem;
@class AWSLambdaPublishLayerVersionRequest;
@class AWSLambdaPublishLayerVersionResponse;
@class AWSLambdaPublishVersionRequest;
@class AWSLambdaPutFunctionCodeSigningConfigRequest;
@class AWSLambdaPutFunctionCodeSigningConfigResponse;
@class AWSLambdaPutFunctionConcurrencyRequest;
@class AWSLambdaPutFunctionEventInvokeConfigRequest;
@class AWSLambdaPutProvisionedConcurrencyConfigRequest;
@class AWSLambdaPutProvisionedConcurrencyConfigResponse;
@class AWSLambdaPutRuntimeManagementConfigRequest;
@class AWSLambdaPutRuntimeManagementConfigResponse;
@class AWSLambdaRemoveLayerVersionPermissionRequest;
@class AWSLambdaRemovePermissionRequest;
@class AWSLambdaRuntimeVersionConfig;
@class AWSLambdaRuntimeVersionError;
@class AWSLambdaScalingConfig;
@class AWSLambdaSelfManagedEventSource;
@class AWSLambdaSelfManagedKafkaEventSourceConfig;
@class AWSLambdaSnapStart;
@class AWSLambdaSnapStartResponse;
@class AWSLambdaSourceAccessConfiguration;
@class AWSLambdaTagResourceRequest;
@class AWSLambdaTracingConfig;
@class AWSLambdaTracingConfigResponse;
@class AWSLambdaUntagResourceRequest;
@class AWSLambdaUpdateAliasRequest;
@class AWSLambdaUpdateCodeSigningConfigRequest;
@class AWSLambdaUpdateCodeSigningConfigResponse;
@class AWSLambdaUpdateEventSourceMappingRequest;
@class AWSLambdaUpdateFunctionCodeRequest;
@class AWSLambdaUpdateFunctionConfigurationRequest;
@class AWSLambdaUpdateFunctionEventInvokeConfigRequest;
@class AWSLambdaUpdateFunctionUrlConfigRequest;
@class AWSLambdaUpdateFunctionUrlConfigResponse;
@class AWSLambdaVpcConfig;
@class AWSLambdaVpcConfigResponse;

/**
 <p>Limits that are related to concurrency and storage. All file and storage sizes are in bytes.</p>
 */
@interface AWSLambdaAccountLimit : AWSModel


/**
 <p>The maximum size of a function's deployment package and layers when they're extracted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable codeSizeUnzipped;

/**
 <p>The maximum size of a deployment package when it's uploaded directly to Lambda. Use Amazon S3 for larger files.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable codeSizeZipped;

/**
 <p>The maximum number of simultaneous function executions.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable concurrentExecutions;

/**
 <p>The amount of storage space that you can use for all deployment packages and layer archives.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalCodeSize;

/**
 <p>The maximum number of simultaneous function executions, minus the capacity that's reserved for individual functions with <a>PutFunctionConcurrency</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable unreservedConcurrentExecutions;

@end

/**
 <p>The number of functions and amount of storage in use.</p>
 */
@interface AWSLambdaAccountUsage : AWSModel


/**
 <p>The number of Lambda functions.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable functionCount;

/**
 <p>The amount of storage space, in bytes, that's being used by deployment packages and layer archives.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalCodeSize;

@end

/**
 
 */
@interface AWSLambdaAddLayerVersionPermissionRequest : AWSRequest


/**
 <p>The API action that grants access to the layer. For example, <code>lambda:GetLayerVersion</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable action;

/**
 <p>The name or Amazon Resource Name (ARN) of the layer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable layerName;

/**
 <p>With the principal set to <code>*</code>, grant permission to all accounts in the specified organization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationId;

/**
 <p>An account ID, or <code>*</code> to grant layer usage permission to all accounts in an organization, or all Amazon Web Services accounts (if <code>organizationId</code> is not specified). For the last case, make sure that you really do want all Amazon Web Services accounts to have usage permission to this layer. </p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

/**
 <p>Only update the policy if the revision ID matches the ID specified. Use this option to avoid modifying a policy that has changed since you last read it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

/**
 <p>An identifier that distinguishes the policy from others on the same layer version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statementId;

/**
 <p>The version number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable versionNumber;

@end

/**
 
 */
@interface AWSLambdaAddLayerVersionPermissionResponse : AWSModel


/**
 <p>A unique identifier for the current revision of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

/**
 <p>The permission statement.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statement;

@end

/**
 
 */
@interface AWSLambdaAddPermissionRequest : AWSRequest


/**
 <p>The action that the principal can use on the function. For example, <code>lambda:InvokeFunction</code> or <code>lambda:GetFunction</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable action;

/**
 <p>For Alexa Smart Home functions, a token that the invoker must supply.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventSourceToken;

/**
 <p>The name of the Lambda function, version, or alias.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code> (name-only), <code>my-function:v1</code> (with alias).</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The type of authentication that your function URL uses. Set to <code>AWS_IAM</code> if you want to restrict access to authenticated users only. Set to <code>NONE</code> if you want to bypass IAM authentication to create a public endpoint. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/urls-auth.html">Security and auth model for Lambda function URLs</a>.</p>
 */
@property (nonatomic, assign) AWSLambdaFunctionUrlAuthType functionUrlAuthType;

/**
 <p>The Amazon Web Service or Amazon Web Services account that invokes the function. If you specify a service, use <code>SourceArn</code> or <code>SourceAccount</code> to limit who can invoke the function through that service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

/**
 <p>The identifier for your organization in Organizations. Use this to grant permissions to all the Amazon Web Services accounts under this organization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principalOrgID;

/**
 <p>Specify a version or alias to add permissions to a published version of the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

/**
 <p>Update the policy only if the revision ID matches the ID that's specified. Use this option to avoid modifying a policy that has changed since you last read it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

/**
 <p>For Amazon Web Service, the ID of the Amazon Web Services account that owns the resource. Use this together with <code>SourceArn</code> to ensure that the specified account owns the resource. It is possible for an Amazon S3 bucket to be deleted by its owner and recreated by another account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceAccount;

/**
 <p>For Amazon Web Services, the ARN of the Amazon Web Services resource that invokes the function. For example, an Amazon S3 bucket or Amazon SNS topic.</p><p>Note that Lambda configures the comparison using the <code>StringLike</code> operator.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

/**
 <p>A statement identifier that differentiates the statement from others in the same policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statementId;

@end

/**
 
 */
@interface AWSLambdaAddPermissionResponse : AWSModel


/**
 <p>The permission statement that's added to the function policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statement;

@end

/**
 <p>Provides configuration information about a Lambda function <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html">alias</a>.</p>
 */
@interface AWSLambdaAliasConfiguration : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aliasArn;

/**
 <p>A description of the alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The function version that the alias invokes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionVersion;

/**
 <p>The name of the alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A unique identifier that changes when you update the alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

/**
 <p>The <a href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html">routing configuration</a> of the alias.</p>
 */
@property (nonatomic, strong) AWSLambdaAliasRoutingConfiguration * _Nullable routingConfig;

@end

/**
 <p>The <a href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html">traffic-shifting</a> configuration of a Lambda function alias.</p>
 */
@interface AWSLambdaAliasRoutingConfiguration : AWSModel


/**
 <p>The second version, and the percentage of traffic that's routed to it.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable additionalVersionWeights;

@end

/**
 <p>List of signing profiles that can sign a code package. </p>
 Required parameters: [SigningProfileVersionArns]
 */
@interface AWSLambdaAllowedPublishers : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for each of the signing profiles. A signing profile defines a trusted user who can sign a code package. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable signingProfileVersionArns;

@end

/**
 <p>Specific configuration settings for an Amazon Managed Streaming for Apache Kafka (Amazon MSK) event source.</p>
 */
@interface AWSLambdaAmazonManagedKafkaEventSourceConfig : AWSModel


/**
 <p>The identifier for the Kafka consumer group to join. The consumer group ID must be unique among all your Kafka event sources. After creating a Kafka event source mapping with the consumer group ID specified, you cannot update this value. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/with-msk.html#services-msk-consumer-group-id">Customizable consumer group ID</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable consumerGroupId;

@end

/**
 <p>Details about a <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-codesigning.html">Code signing configuration</a>. </p>
 Required parameters: [CodeSigningConfigId, CodeSigningConfigArn, AllowedPublishers, CodeSigningPolicies, LastModified]
 */
@interface AWSLambdaCodeSigningConfig : AWSModel


/**
 <p>List of allowed publishers.</p>
 */
@property (nonatomic, strong) AWSLambdaAllowedPublishers * _Nullable allowedPublishers;

/**
 <p>The Amazon Resource Name (ARN) of the Code signing configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeSigningConfigArn;

/**
 <p>Unique identifer for the Code signing configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeSigningConfigId;

/**
 <p>The code signing policy controls the validation failure action for signature mismatch or expiry.</p>
 */
@property (nonatomic, strong) AWSLambdaCodeSigningPolicies * _Nullable codeSigningPolicies;

/**
 <p>Code signing configuration description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The date and time that the Code signing configuration was last modified, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD). </p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModified;

@end

/**
 <p>Code signing configuration <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-codesigning.html#config-codesigning-policies">policies</a> specify the validation failure action for signature mismatch or expiry.</p>
 */
@interface AWSLambdaCodeSigningPolicies : AWSModel


/**
 <p>Code signing configuration policy for deployment validation failure. If you set the policy to <code>Enforce</code>, Lambda blocks the deployment request if signature validation checks fail. If you set the policy to <code>Warn</code>, Lambda allows the deployment and creates a CloudWatch log. </p><p>Default value: <code>Warn</code></p>
 */
@property (nonatomic, assign) AWSLambdaCodeSigningPolicy untrustedArtifactOnDeployment;

@end

/**
 
 */
@interface AWSLambdaConcurrency : AWSModel


/**
 <p>The number of concurrent executions that are reserved for this function. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-concurrency.html">Managing Lambda reserved concurrency</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable reservedConcurrentExecutions;

@end

/**
 <p>The <a href="https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS">cross-origin resource sharing (CORS)</a> settings for your Lambda function URL. Use CORS to grant access to your function URL from any origin. You can also use CORS to control access for specific HTTP headers and methods in requests to your function URL.</p>
 */
@interface AWSLambdaCors : AWSModel


/**
 <p>Whether to allow cookies or other credentials in requests to your function URL. The default is <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowCredentials;

/**
 <p>The HTTP headers that origins can include in requests to your function URL. For example: <code>Date</code>, <code>Keep-Alive</code>, <code>X-Custom-Header</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowHeaders;

/**
 <p>The HTTP methods that are allowed when calling your function URL. For example: <code>GET</code>, <code>POST</code>, <code>DELETE</code>, or the wildcard character (<code>*</code>).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowMethods;

/**
 <p>The origins that can access your function URL. You can list any number of specific origins, separated by a comma. For example: <code>https://www.example.com</code>, <code>http://localhost:60905</code>.</p><p>Alternatively, you can grant access to all origins using the wildcard character (<code>*</code>).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowOrigins;

/**
 <p>The HTTP headers in your function response that you want to expose to origins that call your function URL. For example: <code>Date</code>, <code>Keep-Alive</code>, <code>X-Custom-Header</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable exposeHeaders;

/**
 <p>The maximum amount of time, in seconds, that web browsers can cache results of a preflight request. By default, this is set to <code>0</code>, which means that the browser doesn't cache results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxAge;

@end

/**
 
 */
@interface AWSLambdaCreateAliasRequest : AWSRequest


/**
 <p>A description of the alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The function version that the alias invokes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionVersion;

/**
 <p>The name of the alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html#configuring-alias-routing">routing configuration</a> of the alias.</p>
 */
@property (nonatomic, strong) AWSLambdaAliasRoutingConfiguration * _Nullable routingConfig;

@end

/**
 
 */
@interface AWSLambdaCreateCodeSigningConfigRequest : AWSRequest


/**
 <p>Signing profiles for this code signing configuration.</p>
 */
@property (nonatomic, strong) AWSLambdaAllowedPublishers * _Nullable allowedPublishers;

/**
 <p>The code signing policies define the actions to take if the validation checks fail. </p>
 */
@property (nonatomic, strong) AWSLambdaCodeSigningPolicies * _Nullable codeSigningPolicies;

/**
 <p>Descriptive name for this code signing configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 
 */
@interface AWSLambdaCreateCodeSigningConfigResponse : AWSModel


/**
 <p>The code signing configuration.</p>
 */
@property (nonatomic, strong) AWSLambdaCodeSigningConfig * _Nullable codeSigningConfig;

@end

/**
 
 */
@interface AWSLambdaCreateEventSourceMappingRequest : AWSRequest


/**
 <p>Specific configuration settings for an Amazon Managed Streaming for Apache Kafka (Amazon MSK) event source.</p>
 */
@property (nonatomic, strong) AWSLambdaAmazonManagedKafkaEventSourceConfig * _Nullable amazonManagedKafkaEventSourceConfig;

/**
 <p>The maximum number of records in each batch that Lambda pulls from your stream or queue and sends to your function. Lambda passes all of the records in the batch to the function in a single call, up to the payload limit for synchronous invocation (6 MB).</p><ul><li><p><b>Amazon Kinesis</b> – Default 100. Max 10,000.</p></li><li><p><b>Amazon DynamoDB Streams</b> – Default 100. Max 10,000.</p></li><li><p><b>Amazon Simple Queue Service</b> – Default 10. For standard queues the max is 10,000. For FIFO queues the max is 10.</p></li><li><p><b>Amazon Managed Streaming for Apache Kafka</b> – Default 100. Max 10,000.</p></li><li><p><b>Self-managed Apache Kafka</b> – Default 100. Max 10,000.</p></li><li><p><b>Amazon MQ (ActiveMQ and RabbitMQ)</b> – Default 100. Max 10,000.</p></li><li><p><b>DocumentDB</b> – Default 100. Max 10,000.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable batchSize;

/**
 <p>(Kinesis and DynamoDB Streams only) If the function returns an error, split the batch in two and retry.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bisectBatchOnFunctionError;

/**
 <p>(Kinesis and DynamoDB Streams only) A standard Amazon SQS queue or standard Amazon SNS topic destination for discarded records.</p>
 */
@property (nonatomic, strong) AWSLambdaDestinationConfig * _Nullable destinationConfig;

/**
 <p>Specific configuration settings for a DocumentDB event source.</p>
 */
@property (nonatomic, strong) AWSLambdaDocumentDBEventSourceConfig * _Nullable documentDBEventSourceConfig;

/**
 <p>When true, the event source mapping is active. When false, Lambda pauses polling and invocation.</p><p>Default: True</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The Amazon Resource Name (ARN) of the event source.</p><ul><li><p><b>Amazon Kinesis</b> – The ARN of the data stream or a stream consumer.</p></li><li><p><b>Amazon DynamoDB Streams</b> – The ARN of the stream.</p></li><li><p><b>Amazon Simple Queue Service</b> – The ARN of the queue.</p></li><li><p><b>Amazon Managed Streaming for Apache Kafka</b> – The ARN of the cluster.</p></li><li><p><b>Amazon MQ</b> – The ARN of the broker.</p></li><li><p><b>Amazon DocumentDB</b> – The ARN of the DocumentDB change stream.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable eventSourceArn;

/**
 <p>An object that defines the filter criteria that determine whether Lambda should process an event. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventfiltering.html">Lambda event filtering</a>.</p>
 */
@property (nonatomic, strong) AWSLambdaFilterCriteria * _Nullable filterCriteria;

/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Version or Alias ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it's limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>(Kinesis, DynamoDB Streams, and Amazon SQS) A list of current response type enums applied to the event source mapping.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable functionResponseTypes;

/**
 <p>The maximum amount of time, in seconds, that Lambda spends gathering records before invoking the function. You can configure <code>MaximumBatchingWindowInSeconds</code> to any value from 0 seconds to 300 seconds in increments of seconds.</p><p>For streams and Amazon SQS event sources, the default batching window is 0 seconds. For Amazon MSK, Self-managed Apache Kafka, Amazon MQ, and DocumentDB event sources, the default batching window is 500 ms. Note that because you can only change <code>MaximumBatchingWindowInSeconds</code> in increments of seconds, you cannot revert back to the 500 ms default batching window after you have changed it. To restore the default batching window, you must create a new event source mapping.</p><p>Related setting: For streams and Amazon SQS event sources, when you set <code>BatchSize</code> to a value greater than 10, you must set <code>MaximumBatchingWindowInSeconds</code> to at least 1.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumBatchingWindowInSeconds;

/**
 <p>(Kinesis and DynamoDB Streams only) Discard records older than the specified age. The default value is infinite (-1).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumRecordAgeInSeconds;

/**
 <p>(Kinesis and DynamoDB Streams only) Discard records after the specified number of retries. The default value is infinite (-1). When set to infinite (-1), failed records are retried until the record expires.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumRetryAttempts;

/**
 <p>(Kinesis and DynamoDB Streams only) The number of batches to process from each shard concurrently.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable parallelizationFactor;

/**
 <p> (MQ) The name of the Amazon MQ broker destination queue to consume. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable queues;

/**
 <p>(Amazon SQS only) The scaling configuration for the event source. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html#events-sqs-max-concurrency">Configuring maximum concurrency for Amazon SQS event sources</a>.</p>
 */
@property (nonatomic, strong) AWSLambdaScalingConfig * _Nullable scalingConfig;

/**
 <p>The self-managed Apache Kafka cluster to receive records from.</p>
 */
@property (nonatomic, strong) AWSLambdaSelfManagedEventSource * _Nullable selfManagedEventSource;

/**
 <p>Specific configuration settings for a self-managed Apache Kafka event source.</p>
 */
@property (nonatomic, strong) AWSLambdaSelfManagedKafkaEventSourceConfig * _Nullable selfManagedKafkaEventSourceConfig;

/**
 <p>An array of authentication protocols or VPC components required to secure your event source.</p>
 */
@property (nonatomic, strong) NSArray<AWSLambdaSourceAccessConfiguration *> * _Nullable sourceAccessConfigurations;

/**
 <p>The position in a stream from which to start reading. Required for Amazon Kinesis, Amazon DynamoDB, and Amazon MSK Streams sources. <code>AT_TIMESTAMP</code> is supported only for Amazon Kinesis streams and Amazon DocumentDB.</p>
 */
@property (nonatomic, assign) AWSLambdaEventSourcePosition startingPosition;

/**
 <p>With <code>StartingPosition</code> set to <code>AT_TIMESTAMP</code>, the time from which to start reading.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startingPositionTimestamp;

/**
 <p>The name of the Kafka topic.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable topics;

/**
 <p>(Kinesis and DynamoDB Streams only) The duration in seconds of a processing window for DynamoDB and Kinesis Streams event sources. A value of 0 seconds indicates no tumbling window.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tumblingWindowInSeconds;

@end

/**
 
 */
@interface AWSLambdaCreateFunctionRequest : AWSRequest


/**
 <p>The instruction set architecture that the function supports. Enter a string array with one of the valid values (arm64 or x86_64). The default value is <code>x86_64</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable architectures;

/**
 <p>The code for the function.</p>
 */
@property (nonatomic, strong) AWSLambdaFunctionCode * _Nullable code;

/**
 <p>To enable code signing for this function, specify the ARN of a code-signing configuration. A code-signing configuration includes a set of signing profiles, which define the trusted publishers for this function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeSigningConfigArn;

/**
 <p>A dead-letter queue configuration that specifies the queue or topic where Lambda sends asynchronous events when they fail processing. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#invocation-dlq">Dead-letter queues</a>.</p>
 */
@property (nonatomic, strong) AWSLambdaDeadLetterConfig * _Nullable deadLetterConfig;

/**
 <p>A description of the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Environment variables that are accessible from function code during execution.</p>
 */
@property (nonatomic, strong) AWSLambdaEnvironment * _Nullable environment;

/**
 <p>The size of the function's <code>/tmp</code> directory in MB. The default value is 512, but can be any whole number between 512 and 10,240 MB.</p>
 */
@property (nonatomic, strong) AWSLambdaEphemeralStorage * _Nullable ephemeralStorage;

/**
 <p>Connection settings for an Amazon EFS file system.</p>
 */
@property (nonatomic, strong) NSArray<AWSLambdaFileSystemConfig *> * _Nullable fileSystemConfigs;

/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code>.</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The name of the method within your code that Lambda calls to run your function. Handler is required if the deployment package is a .zip file archive. The format includes the file name. It can also include namespaces and other qualifiers, depending on the runtime. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/foundation-progmodel.html">Lambda programming model</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable handler;

/**
 <p>Container image <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-images.html#configuration-images-settings">configuration values</a> that override the values in the container image Dockerfile.</p>
 */
@property (nonatomic, strong) AWSLambdaImageConfig * _Nullable imageConfig;

/**
 <p>The ARN of the Key Management Service (KMS) customer managed key that's used to encrypt your function's <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-envvars.html#configuration-envvars-encryption">environment variables</a>. When <a href="https://docs.aws.amazon.com/lambda/latest/dg/snapstart-security.html">Lambda SnapStart</a> is activated, this key is also used to encrypt your function's snapshot. If you don't provide a customer managed key, Lambda uses a default service key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKeyArn;

/**
 <p>A list of <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">function layers</a> to add to the function's execution environment. Specify each layer by its ARN, including the version.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable layers;

/**
 <p>The amount of <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-function-common.html#configuration-memory-console">memory available to the function</a> at runtime. Increasing the function memory also increases its CPU allocation. The default value is 128 MB. The value can be any multiple of 1 MB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable memorySize;

/**
 <p>The type of deployment package. Set to <code>Image</code> for container image and set to <code>Zip</code> for .zip file archive.</p>
 */
@property (nonatomic, assign) AWSLambdaPackageType packageType;

/**
 <p>Set to true to publish the first version of the function during creation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publish;

/**
 <p>The Amazon Resource Name (ARN) of the function's execution role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>The identifier of the function's <a href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html">runtime</a>. Runtime is required if the deployment package is a .zip file archive.</p><p>The following list includes deprecated runtimes. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtime-support-policy">Runtime deprecation policy</a>.</p>
 */
@property (nonatomic, assign) AWSLambdaRuntime runtime;

/**
 <p>The function's <a href="https://docs.aws.amazon.com/lambda/latest/dg/snapstart.html">SnapStart</a> setting.</p>
 */
@property (nonatomic, strong) AWSLambdaSnapStart * _Nullable snapStart;

/**
 <p>A list of <a href="https://docs.aws.amazon.com/lambda/latest/dg/tagging.html">tags</a> to apply to the function.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The amount of time (in seconds) that Lambda allows a function to run before stopping it. The default is 3 seconds. The maximum allowed value is 900 seconds. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/runtimes-context.html">Lambda execution environment</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeout;

/**
 <p>Set <code>Mode</code> to <code>Active</code> to sample and trace a subset of incoming requests with <a href="https://docs.aws.amazon.com/lambda/latest/dg/services-xray.html">X-Ray</a>.</p>
 */
@property (nonatomic, strong) AWSLambdaTracingConfig * _Nullable tracingConfig;

/**
 <p>For network connectivity to Amazon Web Services resources in a VPC, specify a list of security groups and subnets in the VPC. When you connect a function to a VPC, it can access resources and the internet only through that VPC. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html">Configuring a Lambda function to access resources in a VPC</a>.</p>
 */
@property (nonatomic, strong) AWSLambdaVpcConfig * _Nullable vpcConfig;

@end

/**
 
 */
@interface AWSLambdaCreateFunctionUrlConfigRequest : AWSRequest


/**
 <p>The type of authentication that your function URL uses. Set to <code>AWS_IAM</code> if you want to restrict access to authenticated users only. Set to <code>NONE</code> if you want to bypass IAM authentication to create a public endpoint. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/urls-auth.html">Security and auth model for Lambda function URLs</a>.</p>
 */
@property (nonatomic, assign) AWSLambdaFunctionUrlAuthType authType;

/**
 <p>The <a href="https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS">cross-origin resource sharing (CORS)</a> settings for your function URL.</p>
 */
@property (nonatomic, strong) AWSLambdaCors * _Nullable cors;

/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code>.</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Use one of the following options:</p><ul><li><p><code>BUFFERED</code> – This is the default option. Lambda invokes your function using the <code>Invoke</code> API operation. Invocation results are available when the payload is complete. The maximum payload size is 6 MB.</p></li><li><p><code>RESPONSE_STREAM</code> – Your function streams payload results as they become available. Lambda invokes your function using the <code>InvokeWithResponseStream</code> API operation. The maximum response payload size is 20 MB, however, you can <a href="https://docs.aws.amazon.com/servicequotas/latest/userguide/request-quota-increase.html">request a quota increase</a>.</p></li></ul>
 */
@property (nonatomic, assign) AWSLambdaInvokeMode invokeMode;

/**
 <p>The alias name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

@end

/**
 
 */
@interface AWSLambdaCreateFunctionUrlConfigResponse : AWSModel


/**
 <p>The type of authentication that your function URL uses. Set to <code>AWS_IAM</code> if you want to restrict access to authenticated users only. Set to <code>NONE</code> if you want to bypass IAM authentication to create a public endpoint. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/urls-auth.html">Security and auth model for Lambda function URLs</a>.</p>
 */
@property (nonatomic, assign) AWSLambdaFunctionUrlAuthType authType;

/**
 <p>The <a href="https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS">cross-origin resource sharing (CORS)</a> settings for your function URL.</p>
 */
@property (nonatomic, strong) AWSLambdaCors * _Nullable cors;

/**
 <p>When the function URL was created, in <a href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a> (YYYY-MM-DDThh:mm:ss.sTZD).</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationTime;

/**
 <p>The Amazon Resource Name (ARN) of your function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionArn;

/**
 <p>The HTTP URL endpoint for your function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionUrl;

/**
 <p>Use one of the following options:</p><ul><li><p><code>BUFFERED</code> – This is the default option. Lambda invokes your function using the <code>Invoke</code> API operation. Invocation results are available when the payload is complete. The maximum payload size is 6 MB.</p></li><li><p><code>RESPONSE_STREAM</code> – Your function streams payload results as they become available. Lambda invokes your function using the <code>InvokeWithResponseStream</code> API operation. The maximum response payload size is 20 MB, however, you can <a href="https://docs.aws.amazon.com/servicequotas/latest/userguide/request-quota-increase.html">request a quota increase</a>.</p></li></ul>
 */
@property (nonatomic, assign) AWSLambdaInvokeMode invokeMode;

@end

/**
 <p>The <a href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#dlq">dead-letter queue</a> for failed asynchronous invocations.</p>
 */
@interface AWSLambdaDeadLetterConfig : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of an Amazon SQS queue or Amazon SNS topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

@end

/**
 
 */
@interface AWSLambdaDeleteAliasRequest : AWSRequest


/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The name of the alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSLambdaDeleteCodeSigningConfigRequest : AWSRequest


/**
 <p>The The Amazon Resource Name (ARN) of the code signing configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeSigningConfigArn;

@end

/**
 
 */
@interface AWSLambdaDeleteCodeSigningConfigResponse : AWSModel


@end

/**
 
 */
@interface AWSLambdaDeleteEventSourceMappingRequest : AWSRequest


/**
 <p>The identifier of the event source mapping.</p>
 */
@property (nonatomic, strong) NSString * _Nullable UUID;

@end

/**
 
 */
@interface AWSLambdaDeleteFunctionCodeSigningConfigRequest : AWSRequest


/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

@end

/**
 
 */
@interface AWSLambdaDeleteFunctionConcurrencyRequest : AWSRequest


/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code>.</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

@end

/**
 
 */
@interface AWSLambdaDeleteFunctionEventInvokeConfigRequest : AWSRequest


/**
 <p>The name of the Lambda function, version, or alias.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>my-function</code> (name-only), <code>my-function:v1</code> (with alias).</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p></li></ul><p>You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>A version number or alias name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

@end

/**
 
 */
@interface AWSLambdaDeleteFunctionRequest : AWSRequest


/**
 <p>The name of the Lambda function or version.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code> (name-only), <code>my-function:1</code> (with version).</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Specify a version to delete. You can't delete a version that an alias references.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

@end

/**
 
 */
@interface AWSLambdaDeleteFunctionUrlConfigRequest : AWSRequest


/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code>.</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The alias name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

@end

/**
 
 */
@interface AWSLambdaDeleteLayerVersionRequest : AWSRequest


/**
 <p>The name or Amazon Resource Name (ARN) of the layer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable layerName;

/**
 <p>The version number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable versionNumber;

@end

/**
 
 */
@interface AWSLambdaDeleteProvisionedConcurrencyConfigRequest : AWSRequest


/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code>.</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The version number or alias name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

@end

/**
 <p>A configuration object that specifies the destination of an event after Lambda processes it.</p>
 */
@interface AWSLambdaDestinationConfig : AWSModel


/**
 <p>The destination configuration for failed invocations.</p>
 */
@property (nonatomic, strong) AWSLambdaOnFailure * _Nullable onFailure;

/**
 <p>The destination configuration for successful invocations.</p>
 */
@property (nonatomic, strong) AWSLambdaOnSuccess * _Nullable onSuccess;

@end

/**
 <p> Specific configuration settings for a DocumentDB event source. </p>
 */
@interface AWSLambdaDocumentDBEventSourceConfig : AWSModel


/**
 <p> The name of the collection to consume within the database. If you do not specify a collection, Lambda consumes all collections. </p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

/**
 <p> The name of the database to consume within the DocumentDB cluster. </p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p> Determines what DocumentDB sends to your event stream during document update operations. If set to UpdateLookup, DocumentDB sends a delta describing the changes, along with a copy of the entire document. Otherwise, DocumentDB sends only a partial document that contains the changes. </p>
 */
@property (nonatomic, assign) AWSLambdaFullDocument fullDocument;

@end

/**
 <p>A function's environment variable settings. You can use environment variables to adjust your function's behavior without updating code. An environment variable is a pair of strings that are stored in a function's version-specific configuration.</p>
 */
@interface AWSLambdaEnvironment : AWSModel


/**
 <p>Environment variable key-value pairs. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-envvars.html">Using Lambda environment variables</a>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable variables;

@end

/**
 <p>Error messages for environment variables that couldn't be applied.</p>
 */
@interface AWSLambdaEnvironmentError : AWSModel


/**
 <p>The error code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>The error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>The results of an operation to update or read environment variables. If the operation succeeds, the response contains the environment variables. If it fails, the response contains details about the error.</p>
 */
@interface AWSLambdaEnvironmentResponse : AWSModel


/**
 <p>Error messages for environment variables that couldn't be applied.</p>
 */
@property (nonatomic, strong) AWSLambdaEnvironmentError * _Nullable error;

/**
 <p>Environment variable key-value pairs. Omitted from CloudTrail logs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable variables;

@end

/**
 <p>The size of the function's <code>/tmp</code> directory in MB. The default value is 512, but it can be any whole number between 512 and 10,240 MB.</p>
 Required parameters: [Size]
 */
@interface AWSLambdaEphemeralStorage : AWSModel


/**
 <p>The size of the function's <code>/tmp</code> directory.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable size;

@end

/**
 <p>A mapping between an Amazon Web Services resource and a Lambda function. For details, see <a>CreateEventSourceMapping</a>.</p>
 */
@interface AWSLambdaEventSourceMappingConfiguration : AWSModel


/**
 <p>Specific configuration settings for an Amazon Managed Streaming for Apache Kafka (Amazon MSK) event source.</p>
 */
@property (nonatomic, strong) AWSLambdaAmazonManagedKafkaEventSourceConfig * _Nullable amazonManagedKafkaEventSourceConfig;

/**
 <p>The maximum number of records in each batch that Lambda pulls from your stream or queue and sends to your function. Lambda passes all of the records in the batch to the function in a single call, up to the payload limit for synchronous invocation (6 MB).</p><p>Default value: Varies by service. For Amazon SQS, the default is 10. For all other services, the default is 100.</p><p>Related setting: When you set <code>BatchSize</code> to a value greater than 10, you must set <code>MaximumBatchingWindowInSeconds</code> to at least 1.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable batchSize;

/**
 <p>(Kinesis and DynamoDB Streams only) If the function returns an error, split the batch in two and retry. The default value is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bisectBatchOnFunctionError;

/**
 <p>(Kinesis and DynamoDB Streams only) An Amazon SQS queue or Amazon SNS topic destination for discarded records.</p>
 */
@property (nonatomic, strong) AWSLambdaDestinationConfig * _Nullable destinationConfig;

/**
 <p>Specific configuration settings for a DocumentDB event source.</p>
 */
@property (nonatomic, strong) AWSLambdaDocumentDBEventSourceConfig * _Nullable documentDBEventSourceConfig;

/**
 <p>The Amazon Resource Name (ARN) of the event source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventSourceArn;

/**
 <p>An object that defines the filter criteria that determine whether Lambda should process an event. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventfiltering.html">Lambda event filtering</a>.</p>
 */
@property (nonatomic, strong) AWSLambdaFilterCriteria * _Nullable filterCriteria;

/**
 <p>The ARN of the Lambda function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionArn;

/**
 <p>(Kinesis, DynamoDB Streams, and Amazon SQS) A list of current response type enums applied to the event source mapping.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable functionResponseTypes;

/**
 <p>The date that the event source mapping was last updated or that its state changed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 <p>The result of the last Lambda invocation of your function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastProcessingResult;

/**
 <p>The maximum amount of time, in seconds, that Lambda spends gathering records before invoking the function. You can configure <code>MaximumBatchingWindowInSeconds</code> to any value from 0 seconds to 300 seconds in increments of seconds.</p><p>For streams and Amazon SQS event sources, the default batching window is 0 seconds. For Amazon MSK, Self-managed Apache Kafka, Amazon MQ, and DocumentDB event sources, the default batching window is 500 ms. Note that because you can only change <code>MaximumBatchingWindowInSeconds</code> in increments of seconds, you cannot revert back to the 500 ms default batching window after you have changed it. To restore the default batching window, you must create a new event source mapping.</p><p>Related setting: For streams and Amazon SQS event sources, when you set <code>BatchSize</code> to a value greater than 10, you must set <code>MaximumBatchingWindowInSeconds</code> to at least 1.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumBatchingWindowInSeconds;

/**
 <p>(Kinesis and DynamoDB Streams only) Discard records older than the specified age. The default value is -1, which sets the maximum age to infinite. When the value is set to infinite, Lambda never discards old records.</p><note><p>The minimum value that can be set is 60 seconds.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumRecordAgeInSeconds;

/**
 <p>(Kinesis and DynamoDB Streams only) Discard records after the specified number of retries. The default value is -1, which sets the maximum number of retries to infinite. When MaximumRetryAttempts is infinite, Lambda retries failed records until the record expires in the event source.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumRetryAttempts;

/**
 <p>(Kinesis and DynamoDB Streams only) The number of batches to process concurrently from each shard. The default value is 1.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable parallelizationFactor;

/**
 <p> (Amazon MQ) The name of the Amazon MQ broker destination queue to consume.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable queues;

/**
 <p>(Amazon SQS only) The scaling configuration for the event source. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html#events-sqs-max-concurrency">Configuring maximum concurrency for Amazon SQS event sources</a>.</p>
 */
@property (nonatomic, strong) AWSLambdaScalingConfig * _Nullable scalingConfig;

/**
 <p>The self-managed Apache Kafka cluster for your event source.</p>
 */
@property (nonatomic, strong) AWSLambdaSelfManagedEventSource * _Nullable selfManagedEventSource;

/**
 <p>Specific configuration settings for a self-managed Apache Kafka event source.</p>
 */
@property (nonatomic, strong) AWSLambdaSelfManagedKafkaEventSourceConfig * _Nullable selfManagedKafkaEventSourceConfig;

/**
 <p>An array of the authentication protocol, VPC components, or virtual host to secure and define your event source.</p>
 */
@property (nonatomic, strong) NSArray<AWSLambdaSourceAccessConfiguration *> * _Nullable sourceAccessConfigurations;

/**
 <p>The position in a stream from which to start reading. Required for Amazon Kinesis, Amazon DynamoDB, and Amazon MSK stream sources. <code>AT_TIMESTAMP</code> is supported only for Amazon Kinesis streams and Amazon DocumentDB.</p>
 */
@property (nonatomic, assign) AWSLambdaEventSourcePosition startingPosition;

/**
 <p>With <code>StartingPosition</code> set to <code>AT_TIMESTAMP</code>, the time from which to start reading.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startingPositionTimestamp;

/**
 <p>The state of the event source mapping. It can be one of the following: <code>Creating</code>, <code>Enabling</code>, <code>Enabled</code>, <code>Disabling</code>, <code>Disabled</code>, <code>Updating</code>, or <code>Deleting</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable state;

/**
 <p>Indicates whether a user or Lambda made the last change to the event source mapping.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateTransitionReason;

/**
 <p>The name of the Kafka topic.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable topics;

/**
 <p>(Kinesis and DynamoDB Streams only) The duration in seconds of a processing window for DynamoDB and Kinesis Streams event sources. A value of 0 seconds indicates no tumbling window.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tumblingWindowInSeconds;

/**
 <p>The identifier of the event source mapping.</p>
 */
@property (nonatomic, strong) NSString * _Nullable UUID;

@end

/**
 <p>Details about the connection between a Lambda function and an <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-filesystem.html">Amazon EFS file system</a>.</p>
 Required parameters: [Arn, LocalMountPath]
 */
@interface AWSLambdaFileSystemConfig : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the Amazon EFS access point that provides access to the file system.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The path where the function can access the file system, starting with <code>/mnt/</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable localMountPath;

@end

/**
 <p> A structure within a <code>FilterCriteria</code> object that defines an event filtering pattern. </p>
 */
@interface AWSLambdaFilter : AWSModel


/**
 <p> A filter pattern. For more information on the syntax of a filter pattern, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventfiltering.html#filtering-syntax"> Filter rule syntax</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable pattern;

@end

/**
 <p> An object that contains the filters for an event source. </p>
 */
@interface AWSLambdaFilterCriteria : AWSModel


/**
 <p> A list of filters. </p>
 */
@property (nonatomic, strong) NSArray<AWSLambdaFilter *> * _Nullable filters;

@end

/**
 <p>The code for the Lambda function. You can either specify an object in Amazon S3, upload a .zip file archive deployment package directly, or specify the URI of a container image.</p>
 */
@interface AWSLambdaFunctionCode : AWSModel


/**
 <p>URI of a <a href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-images.html">container image</a> in the Amazon ECR registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageUri;

/**
 <p>An Amazon S3 bucket in the same Amazon Web Services Region as your function. The bucket can be in a different Amazon Web Services account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Bucket;

/**
 <p>The Amazon S3 key of the deployment package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Key;

/**
 <p>For versioned objects, the version of the deployment package object to use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3ObjectVersion;

/**
 <p>The base64-encoded contents of the deployment package. Amazon Web Services SDK and CLI clients handle the encoding for you.</p>
 */
@property (nonatomic, strong) NSData * _Nullable zipFile;

@end

/**
 <p>Details about a function's deployment package.</p>
 */
@interface AWSLambdaFunctionCodeLocation : AWSModel


/**
 <p>URI of a container image in the Amazon ECR registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageUri;

/**
 <p>A presigned URL that you can use to download the deployment package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>The service that's hosting the file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryType;

/**
 <p>The resolved URI for the image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resolvedImageUri;

@end

/**
 <p>Details about a function's configuration.</p>
 */
@interface AWSLambdaFunctionConfiguration : AWSModel


/**
 <p>The instruction set architecture that the function supports. Architecture is a string array with one of the valid values. The default architecture value is <code>x86_64</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable architectures;

/**
 <p>The SHA256 hash of the function's deployment package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeSha256;

/**
 <p>The size of the function's deployment package, in bytes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable codeSize;

/**
 <p>The function's dead letter queue.</p>
 */
@property (nonatomic, strong) AWSLambdaDeadLetterConfig * _Nullable deadLetterConfig;

/**
 <p>The function's description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The function's <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-envvars.html">environment variables</a>. Omitted from CloudTrail logs.</p>
 */
@property (nonatomic, strong) AWSLambdaEnvironmentResponse * _Nullable environment;

/**
 <p>The size of the function’s <code>/tmp</code> directory in MB. The default value is 512, but it can be any whole number between 512 and 10,240 MB.</p>
 */
@property (nonatomic, strong) AWSLambdaEphemeralStorage * _Nullable ephemeralStorage;

/**
 <p>Connection settings for an <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-filesystem.html">Amazon EFS file system</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSLambdaFileSystemConfig *> * _Nullable fileSystemConfigs;

/**
 <p>The function's Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionArn;

/**
 <p>The name of the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The function that Lambda calls to begin running your function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable handler;

/**
 <p>The function's image configuration values.</p>
 */
@property (nonatomic, strong) AWSLambdaImageConfigResponse * _Nullable imageConfigResponse;

/**
 <p>The KMS key that's used to encrypt the function's <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-envvars.html#configuration-envvars-encryption">environment variables</a>. When <a href="https://docs.aws.amazon.com/lambda/latest/dg/snapstart-security.html">Lambda SnapStart</a> is activated, this key is also used to encrypt the function's snapshot. This key is returned only if you've configured a customer managed key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKeyArn;

/**
 <p>The date and time that the function was last updated, in <a href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a> (YYYY-MM-DDThh:mm:ss.sTZD).</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModified;

/**
 <p>The status of the last update that was performed on the function. This is first set to <code>Successful</code> after function creation completes.</p>
 */
@property (nonatomic, assign) AWSLambdaLastUpdateStatus lastUpdateStatus;

/**
 <p>The reason for the last update that was performed on the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastUpdateStatusReason;

/**
 <p>The reason code for the last update that was performed on the function.</p>
 */
@property (nonatomic, assign) AWSLambdaLastUpdateStatusReasonCode lastUpdateStatusReasonCode;

/**
 <p>The function's <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">layers</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSLambdaLayer *> * _Nullable layers;

/**
 <p>For Lambda@Edge functions, the ARN of the main function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterArn;

/**
 <p>The amount of memory available to the function at runtime.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable memorySize;

/**
 <p>The type of deployment package. Set to <code>Image</code> for container image and set <code>Zip</code> for .zip file archive.</p>
 */
@property (nonatomic, assign) AWSLambdaPackageType packageType;

/**
 <p>The latest updated revision of the function or alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

/**
 <p>The function's execution role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>The identifier of the function's <a href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html">runtime</a>. Runtime is required if the deployment package is a .zip file archive.</p><p>The following list includes deprecated runtimes. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtime-support-policy">Runtime deprecation policy</a>.</p>
 */
@property (nonatomic, assign) AWSLambdaRuntime runtime;

/**
 <p>The ARN of the runtime and any errors that occured.</p>
 */
@property (nonatomic, strong) AWSLambdaRuntimeVersionConfig * _Nullable runtimeVersionConfig;

/**
 <p>The ARN of the signing job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable signingJobArn;

/**
 <p>The ARN of the signing profile version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable signingProfileVersionArn;

/**
 <p>Set <code>ApplyOn</code> to <code>PublishedVersions</code> to create a snapshot of the initialized execution environment when you publish a function version. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/snapstart.html">Improving startup performance with Lambda SnapStart</a>.</p>
 */
@property (nonatomic, strong) AWSLambdaSnapStartResponse * _Nullable snapStart;

/**
 <p>The current state of the function. When the state is <code>Inactive</code>, you can reactivate the function by invoking it.</p>
 */
@property (nonatomic, assign) AWSLambdaState state;

/**
 <p>The reason for the function's current state.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateReason;

/**
 <p>The reason code for the function's current state. When the code is <code>Creating</code>, you can't invoke or modify the function.</p>
 */
@property (nonatomic, assign) AWSLambdaStateReasonCode stateReasonCode;

/**
 <p>The amount of time in seconds that Lambda allows a function to run before stopping it.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeout;

/**
 <p>The function's X-Ray tracing configuration.</p>
 */
@property (nonatomic, strong) AWSLambdaTracingConfigResponse * _Nullable tracingConfig;

/**
 <p>The version of the Lambda function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

/**
 <p>The function's networking configuration.</p>
 */
@property (nonatomic, strong) AWSLambdaVpcConfigResponse * _Nullable vpcConfig;

@end

/**
 
 */
@interface AWSLambdaFunctionEventInvokeConfig : AWSModel


/**
 <p>A destination for events after they have been sent to a function for processing.</p><p class="title"><b>Destinations</b></p><ul><li><p><b>Function</b> - The Amazon Resource Name (ARN) of a Lambda function.</p></li><li><p><b>Queue</b> - The ARN of a standard SQS queue.</p></li><li><p><b>Topic</b> - The ARN of a standard SNS topic.</p></li><li><p><b>Event Bus</b> - The ARN of an Amazon EventBridge event bus.</p></li></ul>
 */
@property (nonatomic, strong) AWSLambdaDestinationConfig * _Nullable destinationConfig;

/**
 <p>The Amazon Resource Name (ARN) of the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionArn;

/**
 <p>The date and time that the configuration was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 <p>The maximum age of a request that Lambda sends to a function for processing.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumEventAgeInSeconds;

/**
 <p>The maximum number of times to retry when the function returns an error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumRetryAttempts;

@end

/**
 <p>Details about a Lambda function URL.</p>
 Required parameters: [FunctionUrl, FunctionArn, CreationTime, LastModifiedTime, AuthType]
 */
@interface AWSLambdaFunctionUrlConfig : AWSModel


/**
 <p>The type of authentication that your function URL uses. Set to <code>AWS_IAM</code> if you want to restrict access to authenticated users only. Set to <code>NONE</code> if you want to bypass IAM authentication to create a public endpoint. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/urls-auth.html">Security and auth model for Lambda function URLs</a>.</p>
 */
@property (nonatomic, assign) AWSLambdaFunctionUrlAuthType authType;

/**
 <p>The <a href="https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS">cross-origin resource sharing (CORS)</a> settings for your function URL.</p>
 */
@property (nonatomic, strong) AWSLambdaCors * _Nullable cors;

/**
 <p>When the function URL was created, in <a href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a> (YYYY-MM-DDThh:mm:ss.sTZD).</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationTime;

/**
 <p>The Amazon Resource Name (ARN) of your function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionArn;

/**
 <p>The HTTP URL endpoint for your function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionUrl;

/**
 <p>Use one of the following options:</p><ul><li><p><code>BUFFERED</code> – This is the default option. Lambda invokes your function using the <code>Invoke</code> API operation. Invocation results are available when the payload is complete. The maximum payload size is 6 MB.</p></li><li><p><code>RESPONSE_STREAM</code> – Your function streams payload results as they become available. Lambda invokes your function using the <code>InvokeWithResponseStream</code> API operation. The maximum response payload size is 20 MB, however, you can <a href="https://docs.aws.amazon.com/servicequotas/latest/userguide/request-quota-increase.html">request a quota increase</a>.</p></li></ul>
 */
@property (nonatomic, assign) AWSLambdaInvokeMode invokeMode;

/**
 <p>When the function URL configuration was last updated, in <a href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a> (YYYY-MM-DDThh:mm:ss.sTZD).</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedTime;

@end

/**
 
 */
@interface AWSLambdaGetAccountSettingsRequest : AWSRequest


@end

/**
 
 */
@interface AWSLambdaGetAccountSettingsResponse : AWSModel


/**
 <p>Limits that are related to concurrency and code storage.</p>
 */
@property (nonatomic, strong) AWSLambdaAccountLimit * _Nullable accountLimit;

/**
 <p>The number of functions and amount of storage in use.</p>
 */
@property (nonatomic, strong) AWSLambdaAccountUsage * _Nullable accountUsage;

@end

/**
 
 */
@interface AWSLambdaGetAliasRequest : AWSRequest


/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The name of the alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSLambdaGetCodeSigningConfigRequest : AWSRequest


/**
 <p>The The Amazon Resource Name (ARN) of the code signing configuration. </p>
 */
@property (nonatomic, strong) NSString * _Nullable codeSigningConfigArn;

@end

/**
 
 */
@interface AWSLambdaGetCodeSigningConfigResponse : AWSModel


/**
 <p>The code signing configuration</p>
 */
@property (nonatomic, strong) AWSLambdaCodeSigningConfig * _Nullable codeSigningConfig;

@end

/**
 
 */
@interface AWSLambdaGetEventSourceMappingRequest : AWSRequest


/**
 <p>The identifier of the event source mapping.</p>
 */
@property (nonatomic, strong) NSString * _Nullable UUID;

@end

/**
 
 */
@interface AWSLambdaGetFunctionCodeSigningConfigRequest : AWSRequest


/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

@end

/**
 
 */
@interface AWSLambdaGetFunctionCodeSigningConfigResponse : AWSModel


/**
 <p>The The Amazon Resource Name (ARN) of the code signing configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeSigningConfigArn;

/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

@end

/**
 
 */
@interface AWSLambdaGetFunctionConcurrencyRequest : AWSRequest


/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code>.</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

@end

/**
 
 */
@interface AWSLambdaGetFunctionConcurrencyResponse : AWSModel


/**
 <p>The number of simultaneous executions that are reserved for the function.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable reservedConcurrentExecutions;

@end

/**
 
 */
@interface AWSLambdaGetFunctionConfigurationRequest : AWSRequest


/**
 <p>The name of the Lambda function, version, or alias.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code> (name-only), <code>my-function:v1</code> (with alias).</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Specify a version or alias to get details about a published version of the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

@end

/**
 
 */
@interface AWSLambdaGetFunctionEventInvokeConfigRequest : AWSRequest


/**
 <p>The name of the Lambda function, version, or alias.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>my-function</code> (name-only), <code>my-function:v1</code> (with alias).</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p></li></ul><p>You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>A version number or alias name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

@end

/**
 
 */
@interface AWSLambdaGetFunctionRequest : AWSRequest


/**
 <p>The name of the Lambda function, version, or alias.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code> (name-only), <code>my-function:v1</code> (with alias).</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Specify a version or alias to get details about a published version of the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

@end

/**
 
 */
@interface AWSLambdaGetFunctionResponse : AWSModel


/**
 <p>The deployment package of the function or version.</p>
 */
@property (nonatomic, strong) AWSLambdaFunctionCodeLocation * _Nullable code;

/**
 <p>The function's <a href="https://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html">reserved concurrency</a>.</p>
 */
@property (nonatomic, strong) AWSLambdaConcurrency * _Nullable concurrency;

/**
 <p>The configuration of the function or version.</p>
 */
@property (nonatomic, strong) AWSLambdaFunctionConfiguration * _Nullable configuration;

/**
 <p>The function's <a href="https://docs.aws.amazon.com/lambda/latest/dg/tagging.html">tags</a>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLambdaGetFunctionUrlConfigRequest : AWSRequest


/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code>.</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The alias name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

@end

/**
 
 */
@interface AWSLambdaGetFunctionUrlConfigResponse : AWSModel


/**
 <p>The type of authentication that your function URL uses. Set to <code>AWS_IAM</code> if you want to restrict access to authenticated users only. Set to <code>NONE</code> if you want to bypass IAM authentication to create a public endpoint. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/urls-auth.html">Security and auth model for Lambda function URLs</a>.</p>
 */
@property (nonatomic, assign) AWSLambdaFunctionUrlAuthType authType;

/**
 <p>The <a href="https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS">cross-origin resource sharing (CORS)</a> settings for your function URL.</p>
 */
@property (nonatomic, strong) AWSLambdaCors * _Nullable cors;

/**
 <p>When the function URL was created, in <a href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a> (YYYY-MM-DDThh:mm:ss.sTZD).</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationTime;

/**
 <p>The Amazon Resource Name (ARN) of your function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionArn;

/**
 <p>The HTTP URL endpoint for your function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionUrl;

/**
 <p>Use one of the following options:</p><ul><li><p><code>BUFFERED</code> – This is the default option. Lambda invokes your function using the <code>Invoke</code> API operation. Invocation results are available when the payload is complete. The maximum payload size is 6 MB.</p></li><li><p><code>RESPONSE_STREAM</code> – Your function streams payload results as they become available. Lambda invokes your function using the <code>InvokeWithResponseStream</code> API operation. The maximum response payload size is 20 MB, however, you can <a href="https://docs.aws.amazon.com/servicequotas/latest/userguide/request-quota-increase.html">request a quota increase</a>.</p></li></ul>
 */
@property (nonatomic, assign) AWSLambdaInvokeMode invokeMode;

/**
 <p>When the function URL configuration was last updated, in <a href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a> (YYYY-MM-DDThh:mm:ss.sTZD).</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedTime;

@end

/**
 
 */
@interface AWSLambdaGetLayerVersionByArnRequest : AWSRequest


/**
 <p>The ARN of the layer version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

/**
 
 */
@interface AWSLambdaGetLayerVersionPolicyRequest : AWSRequest


/**
 <p>The name or Amazon Resource Name (ARN) of the layer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable layerName;

/**
 <p>The version number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable versionNumber;

@end

/**
 
 */
@interface AWSLambdaGetLayerVersionPolicyResponse : AWSModel


/**
 <p>The policy document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>A unique identifier for the current revision of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 
 */
@interface AWSLambdaGetLayerVersionRequest : AWSRequest


/**
 <p>The name or Amazon Resource Name (ARN) of the layer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable layerName;

/**
 <p>The version number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable versionNumber;

@end

/**
 
 */
@interface AWSLambdaGetLayerVersionResponse : AWSModel


/**
 <p>A list of compatible <a href="https://docs.aws.amazon.com/lambda/latest/dg/foundation-arch.html">instruction set architectures</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable compatibleArchitectures;

/**
 <p>The layer's compatible runtimes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable compatibleRuntimes;

/**
 <p>Details about the layer version.</p>
 */
@property (nonatomic, strong) AWSLambdaLayerVersionContentOutput * _Nullable content;

/**
 <p>The date that the layer version was created, in <a href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a> (YYYY-MM-DDThh:mm:ss.sTZD).</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdDate;

/**
 <p>The description of the version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN of the layer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable layerArn;

/**
 <p>The ARN of the layer version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable layerVersionArn;

/**
 <p>The layer's software license.</p>
 */
@property (nonatomic, strong) NSString * _Nullable licenseInfo;

/**
 <p>The version number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 
 */
@interface AWSLambdaGetPolicyRequest : AWSRequest


/**
 <p>The name of the Lambda function, version, or alias.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code> (name-only), <code>my-function:v1</code> (with alias).</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Specify a version or alias to get the policy for that resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

@end

/**
 
 */
@interface AWSLambdaGetPolicyResponse : AWSModel


/**
 <p>The resource-based policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>A unique identifier for the current revision of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 
 */
@interface AWSLambdaGetProvisionedConcurrencyConfigRequest : AWSRequest


/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code>.</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The version number or alias name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

@end

/**
 
 */
@interface AWSLambdaGetProvisionedConcurrencyConfigResponse : AWSModel


/**
 <p>The amount of provisioned concurrency allocated. When a weighted alias is used during linear and canary deployments, this value fluctuates depending on the amount of concurrency that is provisioned for the function versions.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allocatedProvisionedConcurrentExecutions;

/**
 <p>The amount of provisioned concurrency available.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable availableProvisionedConcurrentExecutions;

/**
 <p>The date and time that a user last updated the configuration, in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601 format</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModified;

/**
 <p>The amount of provisioned concurrency requested.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requestedProvisionedConcurrentExecutions;

/**
 <p>The status of the allocation process.</p>
 */
@property (nonatomic, assign) AWSLambdaProvisionedConcurrencyStatusEnum status;

/**
 <p>For failed allocations, the reason that provisioned concurrency could not be allocated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusReason;

@end

/**
 
 */
@interface AWSLambdaGetRuntimeManagementConfigRequest : AWSRequest


/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code>.</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Specify a version of the function. This can be <code>$LATEST</code> or a published version number. If no value is specified, the configuration for the <code>$LATEST</code> version is returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

@end

/**
 
 */
@interface AWSLambdaGetRuntimeManagementConfigResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of your function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionArn;

/**
 <p>The ARN of the runtime the function is configured to use. If the runtime update mode is <b>Manual</b>, the ARN is returned, otherwise <code>null</code> is returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable runtimeVersionArn;

/**
 <p>The current runtime update mode of the function.</p>
 */
@property (nonatomic, assign) AWSLambdaUpdateRuntimeOn updateRuntimeOn;

@end

/**
 <p>Configuration values that override the container image Dockerfile settings. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/images-create.html#images-parms">Container image settings</a>.</p>
 */
@interface AWSLambdaImageConfig : AWSModel


/**
 <p>Specifies parameters that you want to pass in with ENTRYPOINT.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable command;

/**
 <p>Specifies the entry point to their application, which is typically the location of the runtime executable.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable entryPoint;

/**
 <p>Specifies the working directory.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workingDirectory;

@end

/**
 <p>Error response to <code>GetFunctionConfiguration</code>.</p>
 */
@interface AWSLambdaImageConfigError : AWSModel


/**
 <p>Error code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>Error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Response to a <code>GetFunctionConfiguration</code> request.</p>
 */
@interface AWSLambdaImageConfigResponse : AWSModel


/**
 <p>Error response to <code>GetFunctionConfiguration</code>.</p>
 */
@property (nonatomic, strong) AWSLambdaImageConfigError * _Nullable error;

/**
 <p>Configuration values that override the container image Dockerfile.</p>
 */
@property (nonatomic, strong) AWSLambdaImageConfig * _Nullable imageConfig;

@end

/**
 
 */
@interface AWSLambdaInvocationRequest : AWSRequest


/**
 <p>Up to 3,583 bytes of base64-encoded data about the invoking client to pass to the function in the context object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientContext;

/**
 <p>The name of the Lambda function, version, or alias.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code> (name-only), <code>my-function:v1</code> (with alias).</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Choose from the following options.</p><ul><li><p><code>RequestResponse</code> (default) – Invoke the function synchronously. Keep the connection open until the function returns a response or times out. The API response includes the function response and additional data.</p></li><li><p><code>Event</code> – Invoke the function asynchronously. Send events that fail multiple times to the function's dead-letter queue (if one is configured). The API response only includes a status code.</p></li><li><p><code>DryRun</code> – Validate parameter values and verify that the user or role has permission to invoke the function.</p></li></ul>
 */
@property (nonatomic, assign) AWSLambdaInvocationType invocationType;

/**
 <p>Set to <code>Tail</code> to include the execution log in the response. Applies to synchronously invoked functions only.</p>
 */
@property (nonatomic, assign) AWSLambdaLogType logType;

/**
 <p>The JSON that you want to provide to your Lambda function as input.</p><p>You can enter the JSON directly. For example, <code>--payload '{ "key": "value" }'</code>. You can also specify a file path. For example, <code>--payload file://payload.json</code>.</p>
 */
@property (nonatomic, strong) id _Nullable payload;

/**
 <p>Specify a version or alias to invoke a published version of the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

@end

/**
 
 */
@interface AWSLambdaInvocationResponse : AWSModel


/**
 <p>The version of the function that executed. When you invoke a function with an alias, this indicates which version the alias resolved to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executedVersion;

/**
 <p>If present, indicates that an error occurred during function execution. Details about the error are included in the response payload.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionError;

/**
 <p>The last 4 KB of the execution log, which is base64-encoded.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logResult;

/**
 <p>The response from the function, or an error object.</p>
 */
@property (nonatomic, strong) id _Nullable payload;

/**
 <p>The HTTP status code is in the 200 range for a successful request. For the <code>RequestResponse</code> invocation type, this status code is 200. For the <code>Event</code> invocation type, this status code is 202. For the <code>DryRun</code> invocation type, the status code is 204.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable statusCode;

@end

/**
 
 */
@interface AWSLambdaInvokeAsyncRequest : AWSRequest


/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code>.</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The JSON that you want to provide to your Lambda function as input.</p>
 */
@property (nonatomic, strong) NSData * _Nullable invokeArgs;

@end

/**
 <p>A success response (<code>202 Accepted</code>) indicates that the request is queued for invocation.</p>
 */
@interface AWSLambdaInvokeAsyncResponse : AWSModel


/**
 <p>The status code.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 <p>A chunk of the streamed response payload.</p>
 */
@interface AWSLambdaInvokeResponseStreamUpdate : AWSModel


/**
 <p>Data returned by your Lambda function.</p>
 */
@property (nonatomic, strong) id _Nullable payload;

@end

/**
 <p>A response confirming that the event stream is complete.</p>
 */
@interface AWSLambdaInvokeWithResponseStreamCompleteEvent : AWSModel


/**
 <p>An error code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>The details of any returned error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorDetails;

/**
 <p>The last 4 KB of the execution log, which is base64-encoded.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logResult;

@end

/**
 
 */
@interface AWSLambdaInvokeWithResponseStreamRequest : AWSRequest


/**
 <p>Up to 3,583 bytes of base64-encoded data about the invoking client to pass to the function in the context object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientContext;

/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code>.</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Use one of the following options:</p><ul><li><p><code>RequestResponse</code> (default) – Invoke the function synchronously. Keep the connection open until the function returns a response or times out. The API operation response includes the function response and additional data.</p></li><li><p><code>DryRun</code> – Validate parameter values and verify that the IAM user or role has permission to invoke the function.</p></li></ul>
 */
@property (nonatomic, assign) AWSLambdaResponseStreamingInvocationType invocationType;

/**
 <p>Set to <code>Tail</code> to include the execution log in the response. Applies to synchronously invoked functions only.</p>
 */
@property (nonatomic, assign) AWSLambdaLogType logType;

/**
 <p>The JSON that you want to provide to your Lambda function as input.</p><p>You can enter the JSON directly. For example, <code>--payload '{ "key": "value" }'</code>. You can also specify a file path. For example, <code>--payload file://payload.json</code>.</p>
 */
@property (nonatomic, strong) id _Nullable payload;

/**
 <p>The alias name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

@end

/**
 
 */
@interface AWSLambdaInvokeWithResponseStreamResponse : AWSModel


/**
 <p>The stream of response payloads.</p>
 */
@property (nonatomic, strong) AWSLambdaInvokeWithResponseStreamResponseEvent * _Nullable eventStream;

/**
 <p>The version of the function that executed. When you invoke a function with an alias, this indicates which version the alias resolved to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executedVersion;

/**
 <p>The type of data the stream is returning.</p>
 */
@property (nonatomic, strong) NSString * _Nullable responseStreamContentType;

/**
 <p>For a successful request, the HTTP status code is in the 200 range. For the <code>RequestResponse</code> invocation type, this status code is 200. For the <code>DryRun</code> invocation type, this status code is 204.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable statusCode;

@end

/**
 <p>An object that includes a chunk of the response payload. When the stream has ended, Lambda includes a <code>InvokeComplete</code> object.</p>
 */
@interface AWSLambdaInvokeWithResponseStreamResponseEvent : AWSModel


/**
 <p>An object that's returned when the stream has ended and all the payload chunks have been returned.</p>
 */
@property (nonatomic, strong) AWSLambdaInvokeWithResponseStreamCompleteEvent * _Nullable invokeComplete;

/**
 <p>A chunk of the streamed response payload.</p>
 */
@property (nonatomic, strong) AWSLambdaInvokeResponseStreamUpdate * _Nullable payloadChunk;

@end

/**
 <p>An <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda layer</a>.</p>
 */
@interface AWSLambdaLayer : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the function layer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The size of the layer archive in bytes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable codeSize;

/**
 <p>The Amazon Resource Name (ARN) of a signing job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable signingJobArn;

/**
 <p>The Amazon Resource Name (ARN) for a signing profile version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable signingProfileVersionArn;

@end

/**
 <p>A ZIP archive that contains the contents of an <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda layer</a>. You can specify either an Amazon S3 location, or upload a layer archive directly.</p>
 */
@interface AWSLambdaLayerVersionContentInput : AWSModel


/**
 <p>The Amazon S3 bucket of the layer archive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Bucket;

/**
 <p>The Amazon S3 key of the layer archive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Key;

/**
 <p>For versioned objects, the version of the layer archive object to use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3ObjectVersion;

/**
 <p>The base64-encoded contents of the layer archive. Amazon Web Services SDK and Amazon Web Services CLI clients handle the encoding for you.</p>
 */
@property (nonatomic, strong) NSData * _Nullable zipFile;

@end

/**
 <p>Details about a version of an <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda layer</a>.</p>
 */
@interface AWSLambdaLayerVersionContentOutput : AWSModel


/**
 <p>The SHA-256 hash of the layer archive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeSha256;

/**
 <p>The size of the layer archive in bytes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable codeSize;

/**
 <p>A link to the layer archive in Amazon S3 that is valid for 10 minutes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>The Amazon Resource Name (ARN) of a signing job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable signingJobArn;

/**
 <p>The Amazon Resource Name (ARN) for a signing profile version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable signingProfileVersionArn;

@end

/**
 <p>Details about a version of an <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda layer</a>.</p>
 */
@interface AWSLambdaLayerVersionsListItem : AWSModel


/**
 <p>A list of compatible <a href="https://docs.aws.amazon.com/lambda/latest/dg/foundation-arch.html">instruction set architectures</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable compatibleArchitectures;

/**
 <p>The layer's compatible runtimes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable compatibleRuntimes;

/**
 <p>The date that the version was created, in ISO 8601 format. For example, <code>2018-11-27T15:10:45.123+0000</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdDate;

/**
 <p>The description of the version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN of the layer version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable layerVersionArn;

/**
 <p>The layer's open-source license.</p>
 */
@property (nonatomic, strong) NSString * _Nullable licenseInfo;

/**
 <p>The version number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>Details about an <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda layer</a>.</p>
 */
@interface AWSLambdaLayersListItem : AWSModel


/**
 <p>The newest version of the layer.</p>
 */
@property (nonatomic, strong) AWSLambdaLayerVersionsListItem * _Nullable latestMatchingVersion;

/**
 <p>The Amazon Resource Name (ARN) of the function layer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable layerArn;

/**
 <p>The name of the layer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable layerName;

@end

/**
 
 */
@interface AWSLambdaListAliasesRequest : AWSRequest


/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Specify a function version to only list aliases that invoke that version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionVersion;

/**
 <p>Specify the pagination token that's returned by a previous request to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Limit the number of aliases returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

@end

/**
 
 */
@interface AWSLambdaListAliasesResponse : AWSModel


/**
 <p>A list of aliases.</p>
 */
@property (nonatomic, strong) NSArray<AWSLambdaAliasConfiguration *> * _Nullable aliases;

/**
 <p>The pagination token that's included if more results are available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSLambdaListCodeSigningConfigsRequest : AWSRequest


/**
 <p>Specify the pagination token that's returned by a previous request to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Maximum number of items to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

@end

/**
 
 */
@interface AWSLambdaListCodeSigningConfigsResponse : AWSModel


/**
 <p>The code signing configurations</p>
 */
@property (nonatomic, strong) NSArray<AWSLambdaCodeSigningConfig *> * _Nullable codeSigningConfigs;

/**
 <p>The pagination token that's included if more results are available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSLambdaListEventSourceMappingsRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the event source.</p><ul><li><p><b>Amazon Kinesis</b> – The ARN of the data stream or a stream consumer.</p></li><li><p><b>Amazon DynamoDB Streams</b> – The ARN of the stream.</p></li><li><p><b>Amazon Simple Queue Service</b> – The ARN of the queue.</p></li><li><p><b>Amazon Managed Streaming for Apache Kafka</b> – The ARN of the cluster.</p></li><li><p><b>Amazon MQ</b> – The ARN of the broker.</p></li><li><p><b>Amazon DocumentDB</b> – The ARN of the DocumentDB change stream.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable eventSourceArn;

/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Version or Alias ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it's limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>A pagination token returned by a previous call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of event source mappings to return. Note that ListEventSourceMappings returns a maximum of 100 items in each response, even if you set the number higher.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

@end

/**
 
 */
@interface AWSLambdaListEventSourceMappingsResponse : AWSModel


/**
 <p>A list of event source mappings.</p>
 */
@property (nonatomic, strong) NSArray<AWSLambdaEventSourceMappingConfiguration *> * _Nullable eventSourceMappings;

/**
 <p>A pagination token that's returned when the response doesn't contain all event source mappings.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSLambdaListFunctionEventInvokeConfigsRequest : AWSRequest


/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>my-function</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Specify the pagination token that's returned by a previous request to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of configurations to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

@end

/**
 
 */
@interface AWSLambdaListFunctionEventInvokeConfigsResponse : AWSModel


/**
 <p>A list of configurations.</p>
 */
@property (nonatomic, strong) NSArray<AWSLambdaFunctionEventInvokeConfig *> * _Nullable functionEventInvokeConfigs;

/**
 <p>The pagination token that's included if more results are available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSLambdaListFunctionUrlConfigsRequest : AWSRequest


/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code>.</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Specify the pagination token that's returned by a previous request to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of function URLs to return in the response. Note that <code>ListFunctionUrlConfigs</code> returns a maximum of 50 items in each response, even if you set the number higher.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

@end

/**
 
 */
@interface AWSLambdaListFunctionUrlConfigsResponse : AWSModel


/**
 <p>A list of function URL configurations.</p>
 */
@property (nonatomic, strong) NSArray<AWSLambdaFunctionUrlConfig *> * _Nullable functionUrlConfigs;

/**
 <p>The pagination token that's included if more results are available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSLambdaListFunctionsByCodeSigningConfigRequest : AWSRequest


/**
 <p>The The Amazon Resource Name (ARN) of the code signing configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeSigningConfigArn;

/**
 <p>Specify the pagination token that's returned by a previous request to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Maximum number of items to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

@end

/**
 
 */
@interface AWSLambdaListFunctionsByCodeSigningConfigResponse : AWSModel


/**
 <p>The function ARNs. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable functionArns;

/**
 <p>The pagination token that's included if more results are available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSLambdaListFunctionsRequest : AWSRequest


/**
 <p>Set to <code>ALL</code> to include entries for all published versions of each function.</p>
 */
@property (nonatomic, assign) AWSLambdaFunctionVersion functionVersion;

/**
 <p>Specify the pagination token that's returned by a previous request to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>For Lambda@Edge functions, the Amazon Web Services Region of the master function. For example, <code>us-east-1</code> filters the list of functions to include only Lambda@Edge functions replicated from a master function in US East (N. Virginia). If specified, you must set <code>FunctionVersion</code> to <code>ALL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterRegion;

/**
 <p>The maximum number of functions to return in the response. Note that <code>ListFunctions</code> returns a maximum of 50 items in each response, even if you set the number higher.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

@end

/**
 <p>A list of Lambda functions.</p>
 */
@interface AWSLambdaListFunctionsResponse : AWSModel


/**
 <p>A list of Lambda functions.</p>
 */
@property (nonatomic, strong) NSArray<AWSLambdaFunctionConfiguration *> * _Nullable functions;

/**
 <p>The pagination token that's included if more results are available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSLambdaListLayerVersionsRequest : AWSRequest


/**
 <p>The compatible <a href="https://docs.aws.amazon.com/lambda/latest/dg/foundation-arch.html">instruction set architecture</a>.</p>
 */
@property (nonatomic, assign) AWSLambdaArchitecture compatibleArchitecture;

/**
 <p>A runtime identifier. For example, <code>go1.x</code>.</p>
 */
@property (nonatomic, assign) AWSLambdaRuntime compatibleRuntime;

/**
 <p>The name or Amazon Resource Name (ARN) of the layer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable layerName;

/**
 <p>A pagination token returned by a previous call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of versions to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

@end

/**
 
 */
@interface AWSLambdaListLayerVersionsResponse : AWSModel


/**
 <p>A list of versions.</p>
 */
@property (nonatomic, strong) NSArray<AWSLambdaLayerVersionsListItem *> * _Nullable layerVersions;

/**
 <p>A pagination token returned when the response doesn't contain all versions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSLambdaListLayersRequest : AWSRequest


/**
 <p>The compatible <a href="https://docs.aws.amazon.com/lambda/latest/dg/foundation-arch.html">instruction set architecture</a>.</p>
 */
@property (nonatomic, assign) AWSLambdaArchitecture compatibleArchitecture;

/**
 <p>A runtime identifier. For example, <code>go1.x</code>.</p>
 */
@property (nonatomic, assign) AWSLambdaRuntime compatibleRuntime;

/**
 <p>A pagination token returned by a previous call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of layers to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

@end

/**
 
 */
@interface AWSLambdaListLayersResponse : AWSModel


/**
 <p>A list of function layers.</p>
 */
@property (nonatomic, strong) NSArray<AWSLambdaLayersListItem *> * _Nullable layers;

/**
 <p>A pagination token returned when the response doesn't contain all layers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSLambdaListProvisionedConcurrencyConfigsRequest : AWSRequest


/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code>.</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Specify the pagination token that's returned by a previous request to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Specify a number to limit the number of configurations returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

@end

/**
 
 */
@interface AWSLambdaListProvisionedConcurrencyConfigsResponse : AWSModel


/**
 <p>The pagination token that's included if more results are available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>A list of provisioned concurrency configurations.</p>
 */
@property (nonatomic, strong) NSArray<AWSLambdaProvisionedConcurrencyConfigListItem *> * _Nullable provisionedConcurrencyConfigs;

@end

/**
 
 */
@interface AWSLambdaListTagsRequest : AWSRequest


/**
 <p>The function's Amazon Resource Name (ARN). Note: Lambda does not support adding tags to aliases or versions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resource;

@end

/**
 
 */
@interface AWSLambdaListTagsResponse : AWSModel


/**
 <p>The function's tags.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLambdaListVersionsByFunctionRequest : AWSRequest


/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Specify the pagination token that's returned by a previous request to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of versions to return. Note that <code>ListVersionsByFunction</code> returns a maximum of 50 items in each response, even if you set the number higher.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

@end

/**
 
 */
@interface AWSLambdaListVersionsByFunctionResponse : AWSModel


/**
 <p>The pagination token that's included if more results are available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>A list of Lambda function versions.</p>
 */
@property (nonatomic, strong) NSArray<AWSLambdaFunctionConfiguration *> * _Nullable versions;

@end

/**
 <p>A destination for events that failed processing.</p>
 */
@interface AWSLambdaOnFailure : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the destination resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destination;

@end

/**
 <p>A destination for events that were processed successfully.</p>
 */
@interface AWSLambdaOnSuccess : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the destination resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destination;

@end

/**
 <p>Details about the provisioned concurrency configuration for a function alias or version.</p>
 */
@interface AWSLambdaProvisionedConcurrencyConfigListItem : AWSModel


/**
 <p>The amount of provisioned concurrency allocated. When a weighted alias is used during linear and canary deployments, this value fluctuates depending on the amount of concurrency that is provisioned for the function versions.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allocatedProvisionedConcurrentExecutions;

/**
 <p>The amount of provisioned concurrency available.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable availableProvisionedConcurrentExecutions;

/**
 <p>The Amazon Resource Name (ARN) of the alias or version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionArn;

/**
 <p>The date and time that a user last updated the configuration, in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601 format</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModified;

/**
 <p>The amount of provisioned concurrency requested.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requestedProvisionedConcurrentExecutions;

/**
 <p>The status of the allocation process.</p>
 */
@property (nonatomic, assign) AWSLambdaProvisionedConcurrencyStatusEnum status;

/**
 <p>For failed allocations, the reason that provisioned concurrency could not be allocated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusReason;

@end

/**
 
 */
@interface AWSLambdaPublishLayerVersionRequest : AWSRequest


/**
 <p>A list of compatible <a href="https://docs.aws.amazon.com/lambda/latest/dg/foundation-arch.html">instruction set architectures</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable compatibleArchitectures;

/**
 <p>A list of compatible <a href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html">function runtimes</a>. Used for filtering with <a>ListLayers</a> and <a>ListLayerVersions</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable compatibleRuntimes;

/**
 <p>The function layer archive.</p>
 */
@property (nonatomic, strong) AWSLambdaLayerVersionContentInput * _Nullable content;

/**
 <p>The description of the version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name or Amazon Resource Name (ARN) of the layer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable layerName;

/**
 <p>The layer's software license. It can be any of the following:</p><ul><li><p>An <a href="https://spdx.org/licenses/">SPDX license identifier</a>. For example, <code>MIT</code>.</p></li><li><p>The URL of a license hosted on the internet. For example, <code>https://opensource.org/licenses/MIT</code>.</p></li><li><p>The full text of the license.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable licenseInfo;

@end

/**
 
 */
@interface AWSLambdaPublishLayerVersionResponse : AWSModel


/**
 <p>A list of compatible <a href="https://docs.aws.amazon.com/lambda/latest/dg/foundation-arch.html">instruction set architectures</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable compatibleArchitectures;

/**
 <p>The layer's compatible runtimes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable compatibleRuntimes;

/**
 <p>Details about the layer version.</p>
 */
@property (nonatomic, strong) AWSLambdaLayerVersionContentOutput * _Nullable content;

/**
 <p>The date that the layer version was created, in <a href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a> (YYYY-MM-DDThh:mm:ss.sTZD).</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdDate;

/**
 <p>The description of the version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN of the layer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable layerArn;

/**
 <p>The ARN of the layer version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable layerVersionArn;

/**
 <p>The layer's software license.</p>
 */
@property (nonatomic, strong) NSString * _Nullable licenseInfo;

/**
 <p>The version number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 
 */
@interface AWSLambdaPublishVersionRequest : AWSRequest


/**
 <p>Only publish a version if the hash value matches the value that's specified. Use this option to avoid publishing a version if the function code has changed since you last updated it. You can get the hash for the version that you uploaded from the output of <a>UpdateFunctionCode</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeSha256;

/**
 <p>A description for the version to override the description in the function configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Only update the function if the revision ID matches the ID that's specified. Use this option to avoid publishing a version if the function configuration has changed since you last updated it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 
 */
@interface AWSLambdaPutFunctionCodeSigningConfigRequest : AWSRequest


/**
 <p>The The Amazon Resource Name (ARN) of the code signing configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeSigningConfigArn;

/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

@end

/**
 
 */
@interface AWSLambdaPutFunctionCodeSigningConfigResponse : AWSModel


/**
 <p>The The Amazon Resource Name (ARN) of the code signing configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeSigningConfigArn;

/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

@end

/**
 
 */
@interface AWSLambdaPutFunctionConcurrencyRequest : AWSRequest


/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code>.</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The number of simultaneous executions to reserve for the function.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable reservedConcurrentExecutions;

@end

/**
 
 */
@interface AWSLambdaPutFunctionEventInvokeConfigRequest : AWSRequest


/**
 <p>A destination for events after they have been sent to a function for processing.</p><p class="title"><b>Destinations</b></p><ul><li><p><b>Function</b> - The Amazon Resource Name (ARN) of a Lambda function.</p></li><li><p><b>Queue</b> - The ARN of a standard SQS queue.</p></li><li><p><b>Topic</b> - The ARN of a standard SNS topic.</p></li><li><p><b>Event Bus</b> - The ARN of an Amazon EventBridge event bus.</p></li></ul>
 */
@property (nonatomic, strong) AWSLambdaDestinationConfig * _Nullable destinationConfig;

/**
 <p>The name of the Lambda function, version, or alias.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>my-function</code> (name-only), <code>my-function:v1</code> (with alias).</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p></li></ul><p>You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The maximum age of a request that Lambda sends to a function for processing.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumEventAgeInSeconds;

/**
 <p>The maximum number of times to retry when the function returns an error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumRetryAttempts;

/**
 <p>A version number or alias name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

@end

/**
 
 */
@interface AWSLambdaPutProvisionedConcurrencyConfigRequest : AWSRequest


/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code>.</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The amount of provisioned concurrency to allocate for the version or alias.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable provisionedConcurrentExecutions;

/**
 <p>The version number or alias name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

@end

/**
 
 */
@interface AWSLambdaPutProvisionedConcurrencyConfigResponse : AWSModel


/**
 <p>The amount of provisioned concurrency allocated. When a weighted alias is used during linear and canary deployments, this value fluctuates depending on the amount of concurrency that is provisioned for the function versions.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allocatedProvisionedConcurrentExecutions;

/**
 <p>The amount of provisioned concurrency available.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable availableProvisionedConcurrentExecutions;

/**
 <p>The date and time that a user last updated the configuration, in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601 format</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModified;

/**
 <p>The amount of provisioned concurrency requested.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requestedProvisionedConcurrentExecutions;

/**
 <p>The status of the allocation process.</p>
 */
@property (nonatomic, assign) AWSLambdaProvisionedConcurrencyStatusEnum status;

/**
 <p>For failed allocations, the reason that provisioned concurrency could not be allocated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusReason;

@end

/**
 
 */
@interface AWSLambdaPutRuntimeManagementConfigRequest : AWSRequest


/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code>.</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Specify a version of the function. This can be <code>$LATEST</code> or a published version number. If no value is specified, the configuration for the <code>$LATEST</code> version is returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

/**
 <p>The ARN of the runtime version you want the function to use.</p><note><p>This is only required if you're using the <b>Manual</b> runtime update mode.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable runtimeVersionArn;

/**
 <p>Specify the runtime update mode.</p><ul><li><p><b>Auto (default)</b> - Automatically update to the most recent and secure runtime version using a <a href="https://docs.aws.amazon.com/lambda/latest/dg/runtimes-update.html#runtime-management-two-phase">Two-phase runtime version rollout</a>. This is the best choice for most customers to ensure they always benefit from runtime updates.</p></li><li><p><b>Function update</b> - Lambda updates the runtime of your function to the most recent and secure runtime version when you update your function. This approach synchronizes runtime updates with function deployments, giving you control over when runtime updates are applied and allowing you to detect and mitigate rare runtime update incompatibilities early. When using this setting, you need to regularly update your functions to keep their runtime up-to-date.</p></li><li><p><b>Manual</b> - You specify a runtime version in your function configuration. The function will use this runtime version indefinitely. In the rare case where a new runtime version is incompatible with an existing function, this allows you to roll back your function to an earlier runtime version. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/runtimes-update.html#runtime-management-rollback">Roll back a runtime version</a>.</p></li></ul>
 */
@property (nonatomic, assign) AWSLambdaUpdateRuntimeOn updateRuntimeOn;

@end

/**
 
 */
@interface AWSLambdaPutRuntimeManagementConfigResponse : AWSModel


/**
 <p>The ARN of the function</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionArn;

/**
 <p>The ARN of the runtime the function is configured to use. If the runtime update mode is <b>manual</b>, the ARN is returned, otherwise <code>null</code> is returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable runtimeVersionArn;

/**
 <p>The runtime update mode.</p>
 */
@property (nonatomic, assign) AWSLambdaUpdateRuntimeOn updateRuntimeOn;

@end

/**
 
 */
@interface AWSLambdaRemoveLayerVersionPermissionRequest : AWSRequest


/**
 <p>The name or Amazon Resource Name (ARN) of the layer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable layerName;

/**
 <p>Only update the policy if the revision ID matches the ID specified. Use this option to avoid modifying a policy that has changed since you last read it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

/**
 <p>The identifier that was specified when the statement was added.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statementId;

/**
 <p>The version number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable versionNumber;

@end

/**
 
 */
@interface AWSLambdaRemovePermissionRequest : AWSRequest


/**
 <p>The name of the Lambda function, version, or alias.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code> (name-only), <code>my-function:v1</code> (with alias).</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Specify a version or alias to remove permissions from a published version of the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

/**
 <p>Update the policy only if the revision ID matches the ID that's specified. Use this option to avoid modifying a policy that has changed since you last read it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

/**
 <p>Statement ID of the permission to remove.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statementId;

@end

/**
 <p>The ARN of the runtime and any errors that occured.</p>
 */
@interface AWSLambdaRuntimeVersionConfig : AWSModel


/**
 <p>Error response when Lambda is unable to retrieve the runtime version for a function.</p>
 */
@property (nonatomic, strong) AWSLambdaRuntimeVersionError * _Nullable error;

/**
 <p>The ARN of the runtime version you want the function to use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable runtimeVersionArn;

@end

/**
 <p>Any error returned when the runtime version information for the function could not be retrieved.</p>
 */
@interface AWSLambdaRuntimeVersionError : AWSModel


/**
 <p>The error code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>The error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>(Amazon SQS only) The scaling configuration for the event source. To remove the configuration, pass an empty value.</p>
 */
@interface AWSLambdaScalingConfig : AWSModel


/**
 <p>Limits the number of concurrent instances that the Amazon SQS event source can invoke.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumConcurrency;

@end

/**
 <p>The self-managed Apache Kafka cluster for your event source.</p>
 */
@interface AWSLambdaSelfManagedEventSource : AWSModel


/**
 <p>The list of bootstrap servers for your Kafka brokers in the following format: <code>"KAFKA_BOOTSTRAP_SERVERS": ["abc.xyz.com:xxxx","abc2.xyz.com:xxxx"]</code>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable endpoints;

@end

/**
 <p>Specific configuration settings for a self-managed Apache Kafka event source.</p>
 */
@interface AWSLambdaSelfManagedKafkaEventSourceConfig : AWSModel


/**
 <p>The identifier for the Kafka consumer group to join. The consumer group ID must be unique among all your Kafka event sources. After creating a Kafka event source mapping with the consumer group ID specified, you cannot update this value. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/with-msk.html#services-msk-consumer-group-id">Customizable consumer group ID</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable consumerGroupId;

@end

/**
 <p>The function's Lambda SnapStart setting. Set <code>ApplyOn</code> to <code>PublishedVersions</code> to create a snapshot of the initialized execution environment when you publish a function version.</p><p>SnapStart is supported with the <code>java11</code> runtime. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/snapstart.html">Improving startup performance with Lambda SnapStart</a>.</p>
 */
@interface AWSLambdaSnapStart : AWSModel


/**
 <p>Set to <code>PublishedVersions</code> to create a snapshot of the initialized execution environment when you publish a function version.</p>
 */
@property (nonatomic, assign) AWSLambdaSnapStartApplyOn applyOn;

@end

/**
 <p>The function's <a href="https://docs.aws.amazon.com/lambda/latest/dg/snapstart.html">SnapStart</a> setting.</p>
 */
@interface AWSLambdaSnapStartResponse : AWSModel


/**
 <p>When set to <code>PublishedVersions</code>, Lambda creates a snapshot of the execution environment when you publish a function version.</p>
 */
@property (nonatomic, assign) AWSLambdaSnapStartApplyOn applyOn;

/**
 <p>When you provide a <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-versions.html#versioning-versions-using">qualified Amazon Resource Name (ARN)</a>, this response element indicates whether SnapStart is activated for the specified function version.</p>
 */
@property (nonatomic, assign) AWSLambdaSnapStartOptimizationStatus optimizationStatus;

@end

/**
 <p>To secure and define access to your event source, you can specify the authentication protocol, VPC components, or virtual host.</p>
 */
@interface AWSLambdaSourceAccessConfiguration : AWSModel


/**
 <p>The type of authentication protocol, VPC components, or virtual host for your event source. For example: <code>"Type":"SASL_SCRAM_512_AUTH"</code>.</p><ul><li><p><code>BASIC_AUTH</code> – (Amazon MQ) The Secrets Manager secret that stores your broker credentials.</p></li><li><p><code>BASIC_AUTH</code> – (Self-managed Apache Kafka) The Secrets Manager ARN of your secret key used for SASL/PLAIN authentication of your Apache Kafka brokers.</p></li><li><p><code>VPC_SUBNET</code> – (Self-managed Apache Kafka) The subnets associated with your VPC. Lambda connects to these subnets to fetch data from your self-managed Apache Kafka cluster.</p></li><li><p><code>VPC_SECURITY_GROUP</code> – (Self-managed Apache Kafka) The VPC security group used to manage access to your self-managed Apache Kafka brokers.</p></li><li><p><code>SASL_SCRAM_256_AUTH</code> – (Self-managed Apache Kafka) The Secrets Manager ARN of your secret key used for SASL SCRAM-256 authentication of your self-managed Apache Kafka brokers.</p></li><li><p><code>SASL_SCRAM_512_AUTH</code> – (Amazon MSK, Self-managed Apache Kafka) The Secrets Manager ARN of your secret key used for SASL SCRAM-512 authentication of your self-managed Apache Kafka brokers.</p></li><li><p><code>VIRTUAL_HOST</code> –- (RabbitMQ) The name of the virtual host in your RabbitMQ broker. Lambda uses this RabbitMQ host as the event source. This property cannot be specified in an UpdateEventSourceMapping API call.</p></li><li><p><code>CLIENT_CERTIFICATE_TLS_AUTH</code> – (Amazon MSK, self-managed Apache Kafka) The Secrets Manager ARN of your secret key containing the certificate chain (X.509 PEM), private key (PKCS#8 PEM), and private key password (optional) used for mutual TLS authentication of your MSK/Apache Kafka brokers.</p></li><li><p><code>SERVER_ROOT_CA_CERTIFICATE</code> – (Self-managed Apache Kafka) The Secrets Manager ARN of your secret key containing the root CA certificate (X.509 PEM) used for TLS encryption of your Apache Kafka brokers. </p></li></ul>
 */
@property (nonatomic, assign) AWSLambdaSourceAccessType types;

/**
 <p>The value for your chosen configuration in <code>Type</code>. For example: <code>"URI": "arn:aws:secretsmanager:us-east-1:01234567890:secret:MyBrokerSecretName"</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable URI;

@end

/**
 
 */
@interface AWSLambdaTagResourceRequest : AWSRequest


/**
 <p>The function's Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable resource;

/**
 <p>A list of tags to apply to the function.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>The function's <a href="https://docs.aws.amazon.com/lambda/latest/dg/services-xray.html">X-Ray</a> tracing configuration. To sample and record incoming requests, set <code>Mode</code> to <code>Active</code>.</p>
 */
@interface AWSLambdaTracingConfig : AWSModel


/**
 <p>The tracing mode.</p>
 */
@property (nonatomic, assign) AWSLambdaTracingMode mode;

@end

/**
 <p>The function's X-Ray tracing configuration.</p>
 */
@interface AWSLambdaTracingConfigResponse : AWSModel


/**
 <p>The tracing mode.</p>
 */
@property (nonatomic, assign) AWSLambdaTracingMode mode;

@end

/**
 
 */
@interface AWSLambdaUntagResourceRequest : AWSRequest


/**
 <p>The function's Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable resource;

/**
 <p>A list of tag keys to remove from the function.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSLambdaUpdateAliasRequest : AWSRequest


/**
 <p>A description of the alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The function version that the alias invokes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionVersion;

/**
 <p>The name of the alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Only update the alias if the revision ID matches the ID that's specified. Use this option to avoid modifying an alias that has changed since you last read it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

/**
 <p>The <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html#configuring-alias-routing">routing configuration</a> of the alias.</p>
 */
@property (nonatomic, strong) AWSLambdaAliasRoutingConfiguration * _Nullable routingConfig;

@end

/**
 
 */
@interface AWSLambdaUpdateCodeSigningConfigRequest : AWSRequest


/**
 <p>Signing profiles for this code signing configuration.</p>
 */
@property (nonatomic, strong) AWSLambdaAllowedPublishers * _Nullable allowedPublishers;

/**
 <p>The The Amazon Resource Name (ARN) of the code signing configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeSigningConfigArn;

/**
 <p>The code signing policy.</p>
 */
@property (nonatomic, strong) AWSLambdaCodeSigningPolicies * _Nullable codeSigningPolicies;

/**
 <p>Descriptive name for this code signing configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 
 */
@interface AWSLambdaUpdateCodeSigningConfigResponse : AWSModel


/**
 <p>The code signing configuration</p>
 */
@property (nonatomic, strong) AWSLambdaCodeSigningConfig * _Nullable codeSigningConfig;

@end

/**
 
 */
@interface AWSLambdaUpdateEventSourceMappingRequest : AWSRequest


/**
 <p>The maximum number of records in each batch that Lambda pulls from your stream or queue and sends to your function. Lambda passes all of the records in the batch to the function in a single call, up to the payload limit for synchronous invocation (6 MB).</p><ul><li><p><b>Amazon Kinesis</b> – Default 100. Max 10,000.</p></li><li><p><b>Amazon DynamoDB Streams</b> – Default 100. Max 10,000.</p></li><li><p><b>Amazon Simple Queue Service</b> – Default 10. For standard queues the max is 10,000. For FIFO queues the max is 10.</p></li><li><p><b>Amazon Managed Streaming for Apache Kafka</b> – Default 100. Max 10,000.</p></li><li><p><b>Self-managed Apache Kafka</b> – Default 100. Max 10,000.</p></li><li><p><b>Amazon MQ (ActiveMQ and RabbitMQ)</b> – Default 100. Max 10,000.</p></li><li><p><b>DocumentDB</b> – Default 100. Max 10,000.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable batchSize;

/**
 <p>(Kinesis and DynamoDB Streams only) If the function returns an error, split the batch in two and retry.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bisectBatchOnFunctionError;

/**
 <p>(Kinesis and DynamoDB Streams only) A standard Amazon SQS queue or standard Amazon SNS topic destination for discarded records.</p>
 */
@property (nonatomic, strong) AWSLambdaDestinationConfig * _Nullable destinationConfig;

/**
 <p>Specific configuration settings for a DocumentDB event source.</p>
 */
@property (nonatomic, strong) AWSLambdaDocumentDBEventSourceConfig * _Nullable documentDBEventSourceConfig;

/**
 <p>When true, the event source mapping is active. When false, Lambda pauses polling and invocation.</p><p>Default: True</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>An object that defines the filter criteria that determine whether Lambda should process an event. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventfiltering.html">Lambda event filtering</a>.</p>
 */
@property (nonatomic, strong) AWSLambdaFilterCriteria * _Nullable filterCriteria;

/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Version or Alias ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it's limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>(Kinesis, DynamoDB Streams, and Amazon SQS) A list of current response type enums applied to the event source mapping.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable functionResponseTypes;

/**
 <p>The maximum amount of time, in seconds, that Lambda spends gathering records before invoking the function. You can configure <code>MaximumBatchingWindowInSeconds</code> to any value from 0 seconds to 300 seconds in increments of seconds.</p><p>For streams and Amazon SQS event sources, the default batching window is 0 seconds. For Amazon MSK, Self-managed Apache Kafka, Amazon MQ, and DocumentDB event sources, the default batching window is 500 ms. Note that because you can only change <code>MaximumBatchingWindowInSeconds</code> in increments of seconds, you cannot revert back to the 500 ms default batching window after you have changed it. To restore the default batching window, you must create a new event source mapping.</p><p>Related setting: For streams and Amazon SQS event sources, when you set <code>BatchSize</code> to a value greater than 10, you must set <code>MaximumBatchingWindowInSeconds</code> to at least 1.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumBatchingWindowInSeconds;

/**
 <p>(Kinesis and DynamoDB Streams only) Discard records older than the specified age. The default value is infinite (-1).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumRecordAgeInSeconds;

/**
 <p>(Kinesis and DynamoDB Streams only) Discard records after the specified number of retries. The default value is infinite (-1). When set to infinite (-1), failed records are retried until the record expires.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumRetryAttempts;

/**
 <p>(Kinesis and DynamoDB Streams only) The number of batches to process from each shard concurrently.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable parallelizationFactor;

/**
 <p>(Amazon SQS only) The scaling configuration for the event source. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html#events-sqs-max-concurrency">Configuring maximum concurrency for Amazon SQS event sources</a>.</p>
 */
@property (nonatomic, strong) AWSLambdaScalingConfig * _Nullable scalingConfig;

/**
 <p>An array of authentication protocols or VPC components required to secure your event source.</p>
 */
@property (nonatomic, strong) NSArray<AWSLambdaSourceAccessConfiguration *> * _Nullable sourceAccessConfigurations;

/**
 <p>(Kinesis and DynamoDB Streams only) The duration in seconds of a processing window for DynamoDB and Kinesis Streams event sources. A value of 0 seconds indicates no tumbling window.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tumblingWindowInSeconds;

/**
 <p>The identifier of the event source mapping.</p>
 */
@property (nonatomic, strong) NSString * _Nullable UUID;

@end

/**
 
 */
@interface AWSLambdaUpdateFunctionCodeRequest : AWSRequest


/**
 <p>The instruction set architecture that the function supports. Enter a string array with one of the valid values (arm64 or x86_64). The default value is <code>x86_64</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable architectures;

/**
 <p>Set to true to validate the request parameters and access permissions without modifying the function code.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code>.</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>URI of a container image in the Amazon ECR registry. Do not use for a function defined with a .zip file archive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageUri;

/**
 <p>Set to true to publish a new version of the function after updating the code. This has the same effect as calling <a>PublishVersion</a> separately.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publish;

/**
 <p>Update the function only if the revision ID matches the ID that's specified. Use this option to avoid modifying a function that has changed since you last read it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

/**
 <p>An Amazon S3 bucket in the same Amazon Web Services Region as your function. The bucket can be in a different Amazon Web Services account. Use only with a function defined with a .zip file archive deployment package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Bucket;

/**
 <p>The Amazon S3 key of the deployment package. Use only with a function defined with a .zip file archive deployment package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Key;

/**
 <p>For versioned objects, the version of the deployment package object to use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3ObjectVersion;

/**
 <p>The base64-encoded contents of the deployment package. Amazon Web Services SDK and CLI clients handle the encoding for you. Use only with a function defined with a .zip file archive deployment package.</p>
 */
@property (nonatomic, strong) NSData * _Nullable zipFile;

@end

/**
 
 */
@interface AWSLambdaUpdateFunctionConfigurationRequest : AWSRequest


/**
 <p>A dead-letter queue configuration that specifies the queue or topic where Lambda sends asynchronous events when they fail processing. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#invocation-dlq">Dead-letter queues</a>.</p>
 */
@property (nonatomic, strong) AWSLambdaDeadLetterConfig * _Nullable deadLetterConfig;

/**
 <p>A description of the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Environment variables that are accessible from function code during execution.</p>
 */
@property (nonatomic, strong) AWSLambdaEnvironment * _Nullable environment;

/**
 <p>The size of the function's <code>/tmp</code> directory in MB. The default value is 512, but can be any whole number between 512 and 10,240 MB.</p>
 */
@property (nonatomic, strong) AWSLambdaEphemeralStorage * _Nullable ephemeralStorage;

/**
 <p>Connection settings for an Amazon EFS file system.</p>
 */
@property (nonatomic, strong) NSArray<AWSLambdaFileSystemConfig *> * _Nullable fileSystemConfigs;

/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code>.</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The name of the method within your code that Lambda calls to run your function. Handler is required if the deployment package is a .zip file archive. The format includes the file name. It can also include namespaces and other qualifiers, depending on the runtime. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/foundation-progmodel.html">Lambda programming model</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable handler;

/**
 <p><a href="https://docs.aws.amazon.com/lambda/latest/dg/images-parms.html">Container image configuration values</a> that override the values in the container image Docker file.</p>
 */
@property (nonatomic, strong) AWSLambdaImageConfig * _Nullable imageConfig;

/**
 <p>The ARN of the Key Management Service (KMS) customer managed key that's used to encrypt your function's <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-envvars.html#configuration-envvars-encryption">environment variables</a>. When <a href="https://docs.aws.amazon.com/lambda/latest/dg/snapstart-security.html">Lambda SnapStart</a> is activated, this key is also used to encrypt your function's snapshot. If you don't provide a customer managed key, Lambda uses a default service key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKeyArn;

/**
 <p>A list of <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">function layers</a> to add to the function's execution environment. Specify each layer by its ARN, including the version.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable layers;

/**
 <p>The amount of <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-function-common.html#configuration-memory-console">memory available to the function</a> at runtime. Increasing the function memory also increases its CPU allocation. The default value is 128 MB. The value can be any multiple of 1 MB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable memorySize;

/**
 <p>Update the function only if the revision ID matches the ID that's specified. Use this option to avoid modifying a function that has changed since you last read it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

/**
 <p>The Amazon Resource Name (ARN) of the function's execution role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>The identifier of the function's <a href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html">runtime</a>. Runtime is required if the deployment package is a .zip file archive.</p><p>The following list includes deprecated runtimes. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtime-support-policy">Runtime deprecation policy</a>.</p>
 */
@property (nonatomic, assign) AWSLambdaRuntime runtime;

/**
 <p>The function's <a href="https://docs.aws.amazon.com/lambda/latest/dg/snapstart.html">SnapStart</a> setting.</p>
 */
@property (nonatomic, strong) AWSLambdaSnapStart * _Nullable snapStart;

/**
 <p>The amount of time (in seconds) that Lambda allows a function to run before stopping it. The default is 3 seconds. The maximum allowed value is 900 seconds. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/runtimes-context.html">Lambda execution environment</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeout;

/**
 <p>Set <code>Mode</code> to <code>Active</code> to sample and trace a subset of incoming requests with <a href="https://docs.aws.amazon.com/lambda/latest/dg/services-xray.html">X-Ray</a>.</p>
 */
@property (nonatomic, strong) AWSLambdaTracingConfig * _Nullable tracingConfig;

/**
 <p>For network connectivity to Amazon Web Services resources in a VPC, specify a list of security groups and subnets in the VPC. When you connect a function to a VPC, it can access resources and the internet only through that VPC. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html">Configuring a Lambda function to access resources in a VPC</a>.</p>
 */
@property (nonatomic, strong) AWSLambdaVpcConfig * _Nullable vpcConfig;

@end

/**
 
 */
@interface AWSLambdaUpdateFunctionEventInvokeConfigRequest : AWSRequest


/**
 <p>A destination for events after they have been sent to a function for processing.</p><p class="title"><b>Destinations</b></p><ul><li><p><b>Function</b> - The Amazon Resource Name (ARN) of a Lambda function.</p></li><li><p><b>Queue</b> - The ARN of a standard SQS queue.</p></li><li><p><b>Topic</b> - The ARN of a standard SNS topic.</p></li><li><p><b>Event Bus</b> - The ARN of an Amazon EventBridge event bus.</p></li></ul>
 */
@property (nonatomic, strong) AWSLambdaDestinationConfig * _Nullable destinationConfig;

/**
 <p>The name of the Lambda function, version, or alias.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>my-function</code> (name-only), <code>my-function:v1</code> (with alias).</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p></li></ul><p>You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The maximum age of a request that Lambda sends to a function for processing.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumEventAgeInSeconds;

/**
 <p>The maximum number of times to retry when the function returns an error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumRetryAttempts;

/**
 <p>A version number or alias name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

@end

/**
 
 */
@interface AWSLambdaUpdateFunctionUrlConfigRequest : AWSRequest


/**
 <p>The type of authentication that your function URL uses. Set to <code>AWS_IAM</code> if you want to restrict access to authenticated users only. Set to <code>NONE</code> if you want to bypass IAM authentication to create a public endpoint. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/urls-auth.html">Security and auth model for Lambda function URLs</a>.</p>
 */
@property (nonatomic, assign) AWSLambdaFunctionUrlAuthType authType;

/**
 <p>The <a href="https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS">cross-origin resource sharing (CORS)</a> settings for your function URL.</p>
 */
@property (nonatomic, strong) AWSLambdaCors * _Nullable cors;

/**
 <p>The name of the Lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> – <code>my-function</code>.</p></li><li><p><b>Function ARN</b> – <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p></li><li><p><b>Partial ARN</b> – <code>123456789012:function:my-function</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Use one of the following options:</p><ul><li><p><code>BUFFERED</code> – This is the default option. Lambda invokes your function using the <code>Invoke</code> API operation. Invocation results are available when the payload is complete. The maximum payload size is 6 MB.</p></li><li><p><code>RESPONSE_STREAM</code> – Your function streams payload results as they become available. Lambda invokes your function using the <code>InvokeWithResponseStream</code> API operation. The maximum response payload size is 20 MB, however, you can <a href="https://docs.aws.amazon.com/servicequotas/latest/userguide/request-quota-increase.html">request a quota increase</a>.</p></li></ul>
 */
@property (nonatomic, assign) AWSLambdaInvokeMode invokeMode;

/**
 <p>The alias name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

@end

/**
 
 */
@interface AWSLambdaUpdateFunctionUrlConfigResponse : AWSModel


/**
 <p>The type of authentication that your function URL uses. Set to <code>AWS_IAM</code> if you want to restrict access to authenticated users only. Set to <code>NONE</code> if you want to bypass IAM authentication to create a public endpoint. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/urls-auth.html">Security and auth model for Lambda function URLs</a>.</p>
 */
@property (nonatomic, assign) AWSLambdaFunctionUrlAuthType authType;

/**
 <p>The <a href="https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS">cross-origin resource sharing (CORS)</a> settings for your function URL.</p>
 */
@property (nonatomic, strong) AWSLambdaCors * _Nullable cors;

/**
 <p>When the function URL was created, in <a href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a> (YYYY-MM-DDThh:mm:ss.sTZD).</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationTime;

/**
 <p>The Amazon Resource Name (ARN) of your function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionArn;

/**
 <p>The HTTP URL endpoint for your function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionUrl;

/**
 <p>Use one of the following options:</p><ul><li><p><code>BUFFERED</code> – This is the default option. Lambda invokes your function using the <code>Invoke</code> API operation. Invocation results are available when the payload is complete. The maximum payload size is 6 MB.</p></li><li><p><code>RESPONSE_STREAM</code> – Your function streams payload results as they become available. Lambda invokes your function using the <code>InvokeWithResponseStream</code> API operation. The maximum response payload size is 20 MB, however, you can <a href="https://docs.aws.amazon.com/servicequotas/latest/userguide/request-quota-increase.html">request a quota increase</a>.</p></li></ul>
 */
@property (nonatomic, assign) AWSLambdaInvokeMode invokeMode;

/**
 <p>When the function URL configuration was last updated, in <a href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a> (YYYY-MM-DDThh:mm:ss.sTZD).</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedTime;

@end

/**
 <p>The VPC security groups and subnets that are attached to a Lambda function. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html">Configuring a Lambda function to access resources in a VPC</a>.</p>
 */
@interface AWSLambdaVpcConfig : AWSModel


/**
 <p>A list of VPC security group IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>A list of VPC subnet IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

@end

/**
 <p>The VPC security groups and subnets that are attached to a Lambda function.</p>
 */
@interface AWSLambdaVpcConfigResponse : AWSModel


/**
 <p>A list of VPC security group IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>A list of VPC subnet IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

NS_ASSUME_NONNULL_END
