//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

FOUNDATION_EXPORT NSString *const AWSIoTErrorDomain;

typedef NS_ENUM(NSInteger, AWSIoTErrorType) {
    AWSIoTErrorUnknown,
    AWSIoTErrorCertificateConflict,
    AWSIoTErrorCertificateState,
    AWSIoTErrorCertificateValidation,
    AWSIoTErrorConflictingResourceUpdate,
    AWSIoTErrorDeleteConflict,
    AWSIoTErrorIndexNotReady,
    AWSIoTErrorInternal,
    AWSIoTErrorInternalFailure,
    AWSIoTErrorInvalidQuery,
    AWSIoTErrorInvalidRequest,
    AWSIoTErrorInvalidResponse,
    AWSIoTErrorInvalidStateTransition,
    AWSIoTErrorLimitExceeded,
    AWSIoTErrorMalformedPolicy,
    AWSIoTErrorNotConfigured,
    AWSIoTErrorRegistrationCodeValidation,
    AWSIoTErrorResourceAlreadyExists,
    AWSIoTErrorResourceNotFound,
    AWSIoTErrorResourceRegistrationFailure,
    AWSIoTErrorServiceUnavailable,
    AWSIoTErrorSqlParse,
    AWSIoTErrorThrottling,
    AWSIoTErrorTransferAlreadyCompleted,
    AWSIoTErrorTransferConflict,
    AWSIoTErrorUnauthorized,
    AWSIoTErrorVersionConflict,
    AWSIoTErrorVersionsLimitExceeded,
};

typedef NS_ENUM(NSInteger, AWSIoTActionType) {
    AWSIoTActionTypeUnknown,
    AWSIoTActionTypePublish,
    AWSIoTActionTypeSubscribe,
    AWSIoTActionTypeReceive,
    AWSIoTActionTypeConnect,
};

typedef NS_ENUM(NSInteger, AWSIoTAuthDecision) {
    AWSIoTAuthDecisionUnknown,
    AWSIoTAuthDecisionAllowed,
    AWSIoTAuthDecisionExplicitDeny,
    AWSIoTAuthDecisionImplicitDeny,
};

typedef NS_ENUM(NSInteger, AWSIoTAuthorizerStatus) {
    AWSIoTAuthorizerStatusUnknown,
    AWSIoTAuthorizerStatusActive,
    AWSIoTAuthorizerStatusInactive,
};

typedef NS_ENUM(NSInteger, AWSIoTAutoRegistrationStatus) {
    AWSIoTAutoRegistrationStatusUnknown,
    AWSIoTAutoRegistrationStatusEnable,
    AWSIoTAutoRegistrationStatusDisable,
};

typedef NS_ENUM(NSInteger, AWSIoTCACertificateStatus) {
    AWSIoTCACertificateStatusUnknown,
    AWSIoTCACertificateStatusActive,
    AWSIoTCACertificateStatusInactive,
};

typedef NS_ENUM(NSInteger, AWSIoTCannedAccessControlList) {
    AWSIoTCannedAccessControlListUnknown,
    AWSIoTCannedAccessControlListPrivate,
    AWSIoTCannedAccessControlListPublicRead,
    AWSIoTCannedAccessControlListPublicReadWrite,
    AWSIoTCannedAccessControlListAwsExecRead,
    AWSIoTCannedAccessControlListAuthenticatedRead,
    AWSIoTCannedAccessControlListBucketOwnerRead,
    AWSIoTCannedAccessControlListBucketOwnerFullControl,
    AWSIoTCannedAccessControlListLogDeliveryWrite,
};

typedef NS_ENUM(NSInteger, AWSIoTCertificateStatus) {
    AWSIoTCertificateStatusUnknown,
    AWSIoTCertificateStatusActive,
    AWSIoTCertificateStatusInactive,
    AWSIoTCertificateStatusRevoked,
    AWSIoTCertificateStatusPendingTransfer,
    AWSIoTCertificateStatusRegisterInactive,
    AWSIoTCertificateStatusPendingActivation,
};

typedef NS_ENUM(NSInteger, AWSIoTDynamoKeyType) {
    AWSIoTDynamoKeyTypeUnknown,
    AWSIoTDynamoKeyTypeString,
    AWSIoTDynamoKeyTypeNumber,
};

typedef NS_ENUM(NSInteger, AWSIoTEventType) {
    AWSIoTEventTypeUnknown,
    AWSIoTEventTypeThing,
    AWSIoTEventTypeThingGroup,
    AWSIoTEventTypeThingType,
    AWSIoTEventTypeThingGroupMembership,
    AWSIoTEventTypeThingGroupHierarchy,
    AWSIoTEventTypeThingTypeAssociation,
    AWSIoTEventTypeJob,
    AWSIoTEventTypeJobExecution,
};

typedef NS_ENUM(NSInteger, AWSIoTIndexStatus) {
    AWSIoTIndexStatusUnknown,
    AWSIoTIndexStatusActive,
    AWSIoTIndexStatusBuilding,
    AWSIoTIndexStatusRebuilding,
};

typedef NS_ENUM(NSInteger, AWSIoTJobExecutionStatus) {
    AWSIoTJobExecutionStatusUnknown,
    AWSIoTJobExecutionStatusQueued,
    AWSIoTJobExecutionStatusInProgress,
    AWSIoTJobExecutionStatusSucceeded,
    AWSIoTJobExecutionStatusFailed,
    AWSIoTJobExecutionStatusRejected,
    AWSIoTJobExecutionStatusRemoved,
    AWSIoTJobExecutionStatusCanceled,
};

typedef NS_ENUM(NSInteger, AWSIoTJobStatus) {
    AWSIoTJobStatusUnknown,
    AWSIoTJobStatusInProgress,
    AWSIoTJobStatusCanceled,
    AWSIoTJobStatusCompleted,
    AWSIoTJobStatusDeletionInProgress,
};

typedef NS_ENUM(NSInteger, AWSIoTLogLevel) {
    AWSIoTLogLevelUnknown,
    AWSIoTLogLevelDebug,
    AWSIoTLogLevelInfo,
    AWSIoTLogLevelError,
    AWSIoTLogLevelWarn,
    AWSIoTLogLevelDisabled,
};

typedef NS_ENUM(NSInteger, AWSIoTLogTargetType) {
    AWSIoTLogTargetTypeUnknown,
    AWSIoTLogTargetTypeDefault,
    AWSIoTLogTargetTypeThingGroup,
};

typedef NS_ENUM(NSInteger, AWSIoTMessageFormat) {
    AWSIoTMessageFormatUnknown,
    AWSIoTMessageFormatRAW,
    AWSIoTMessageFormatJson,
};

typedef NS_ENUM(NSInteger, AWSIoTOTAUpdateStatus) {
    AWSIoTOTAUpdateStatusUnknown,
    AWSIoTOTAUpdateStatusCreatePending,
    AWSIoTOTAUpdateStatusCreateInProgress,
    AWSIoTOTAUpdateStatusCreateComplete,
    AWSIoTOTAUpdateStatusCreateFailed,
};

typedef NS_ENUM(NSInteger, AWSIoTReportType) {
    AWSIoTReportTypeUnknown,
    AWSIoTReportTypeErrors,
    AWSIoTReportTypeResults,
};

typedef NS_ENUM(NSInteger, AWSIoTStatus) {
    AWSIoTStatusUnknown,
    AWSIoTStatusInProgress,
    AWSIoTStatusCompleted,
    AWSIoTStatusFailed,
    AWSIoTStatusCancelled,
    AWSIoTStatusCancelling,
};

typedef NS_ENUM(NSInteger, AWSIoTTargetSelection) {
    AWSIoTTargetSelectionUnknown,
    AWSIoTTargetSelectionContinuous,
    AWSIoTTargetSelectionSnapshot,
};

typedef NS_ENUM(NSInteger, AWSIoTThingIndexingMode) {
    AWSIoTThingIndexingModeUnknown,
    AWSIoTThingIndexingModeOff,
    AWSIoTThingIndexingModeRegistry,
    AWSIoTThingIndexingModeRegistryAndShadow,
};

@class AWSIoTAcceptCertificateTransferRequest;
@class AWSIoTAction;
@class AWSIoTAddThingToThingGroupRequest;
@class AWSIoTAddThingToThingGroupResponse;
@class AWSIoTAllowed;
@class AWSIoTAssociateTargetsWithJobRequest;
@class AWSIoTAssociateTargetsWithJobResponse;
@class AWSIoTAttachPolicyRequest;
@class AWSIoTAttachPrincipalPolicyRequest;
@class AWSIoTAttachThingPrincipalRequest;
@class AWSIoTAttachThingPrincipalResponse;
@class AWSIoTAttributePayload;
@class AWSIoTAuthInfo;
@class AWSIoTAuthResult;
@class AWSIoTAuthorizerDescription;
@class AWSIoTAuthorizerSummary;
@class AWSIoTCACertificate;
@class AWSIoTCACertificateDescription;
@class AWSIoTCancelCertificateTransferRequest;
@class AWSIoTCancelJobExecutionRequest;
@class AWSIoTCancelJobRequest;
@class AWSIoTCancelJobResponse;
@class AWSIoTCertificate;
@class AWSIoTCertificateDescription;
@class AWSIoTClearDefaultAuthorizerRequest;
@class AWSIoTClearDefaultAuthorizerResponse;
@class AWSIoTCloudwatchAlarmAction;
@class AWSIoTCloudwatchMetricAction;
@class AWSIoTCodeSigning;
@class AWSIoTCodeSigningCertificateChain;
@class AWSIoTCodeSigningSignature;
@class AWSIoTConfiguration;
@class AWSIoTCreateAuthorizerRequest;
@class AWSIoTCreateAuthorizerResponse;
@class AWSIoTCreateCertificateFromCsrRequest;
@class AWSIoTCreateCertificateFromCsrResponse;
@class AWSIoTCreateJobRequest;
@class AWSIoTCreateJobResponse;
@class AWSIoTCreateKeysAndCertificateRequest;
@class AWSIoTCreateKeysAndCertificateResponse;
@class AWSIoTCreateOTAUpdateRequest;
@class AWSIoTCreateOTAUpdateResponse;
@class AWSIoTCreatePolicyRequest;
@class AWSIoTCreatePolicyResponse;
@class AWSIoTCreatePolicyVersionRequest;
@class AWSIoTCreatePolicyVersionResponse;
@class AWSIoTCreateRoleAliasRequest;
@class AWSIoTCreateRoleAliasResponse;
@class AWSIoTCreateStreamRequest;
@class AWSIoTCreateStreamResponse;
@class AWSIoTCreateThingGroupRequest;
@class AWSIoTCreateThingGroupResponse;
@class AWSIoTCreateThingRequest;
@class AWSIoTCreateThingResponse;
@class AWSIoTCreateThingTypeRequest;
@class AWSIoTCreateThingTypeResponse;
@class AWSIoTCreateTopicRuleRequest;
@class AWSIoTCustomCodeSigning;
@class AWSIoTDeleteAuthorizerRequest;
@class AWSIoTDeleteAuthorizerResponse;
@class AWSIoTDeleteCACertificateRequest;
@class AWSIoTDeleteCACertificateResponse;
@class AWSIoTDeleteCertificateRequest;
@class AWSIoTDeleteJobExecutionRequest;
@class AWSIoTDeleteJobRequest;
@class AWSIoTDeleteOTAUpdateRequest;
@class AWSIoTDeleteOTAUpdateResponse;
@class AWSIoTDeletePolicyRequest;
@class AWSIoTDeletePolicyVersionRequest;
@class AWSIoTDeleteRegistrationCodeRequest;
@class AWSIoTDeleteRegistrationCodeResponse;
@class AWSIoTDeleteRoleAliasRequest;
@class AWSIoTDeleteRoleAliasResponse;
@class AWSIoTDeleteStreamRequest;
@class AWSIoTDeleteStreamResponse;
@class AWSIoTDeleteThingGroupRequest;
@class AWSIoTDeleteThingGroupResponse;
@class AWSIoTDeleteThingRequest;
@class AWSIoTDeleteThingResponse;
@class AWSIoTDeleteThingTypeRequest;
@class AWSIoTDeleteThingTypeResponse;
@class AWSIoTDeleteTopicRuleRequest;
@class AWSIoTDeleteV2LoggingLevelRequest;
@class AWSIoTDenied;
@class AWSIoTDeprecateThingTypeRequest;
@class AWSIoTDeprecateThingTypeResponse;
@class AWSIoTDescribeAuthorizerRequest;
@class AWSIoTDescribeAuthorizerResponse;
@class AWSIoTDescribeCACertificateRequest;
@class AWSIoTDescribeCACertificateResponse;
@class AWSIoTDescribeCertificateRequest;
@class AWSIoTDescribeCertificateResponse;
@class AWSIoTDescribeDefaultAuthorizerRequest;
@class AWSIoTDescribeDefaultAuthorizerResponse;
@class AWSIoTDescribeEndpointRequest;
@class AWSIoTDescribeEndpointResponse;
@class AWSIoTDescribeEventConfigurationsRequest;
@class AWSIoTDescribeEventConfigurationsResponse;
@class AWSIoTDescribeIndexRequest;
@class AWSIoTDescribeIndexResponse;
@class AWSIoTDescribeJobExecutionRequest;
@class AWSIoTDescribeJobExecutionResponse;
@class AWSIoTDescribeJobRequest;
@class AWSIoTDescribeJobResponse;
@class AWSIoTDescribeRoleAliasRequest;
@class AWSIoTDescribeRoleAliasResponse;
@class AWSIoTDescribeStreamRequest;
@class AWSIoTDescribeStreamResponse;
@class AWSIoTDescribeThingGroupRequest;
@class AWSIoTDescribeThingGroupResponse;
@class AWSIoTDescribeThingRegistrationTaskRequest;
@class AWSIoTDescribeThingRegistrationTaskResponse;
@class AWSIoTDescribeThingRequest;
@class AWSIoTDescribeThingResponse;
@class AWSIoTDescribeThingTypeRequest;
@class AWSIoTDescribeThingTypeResponse;
@class AWSIoTDetachPolicyRequest;
@class AWSIoTDetachPrincipalPolicyRequest;
@class AWSIoTDetachThingPrincipalRequest;
@class AWSIoTDetachThingPrincipalResponse;
@class AWSIoTDisableTopicRuleRequest;
@class AWSIoTDynamoDBAction;
@class AWSIoTDynamoDBv2Action;
@class AWSIoTEffectivePolicy;
@class AWSIoTElasticsearchAction;
@class AWSIoTEnableTopicRuleRequest;
@class AWSIoTErrorInfo;
@class AWSIoTExplicitDeny;
@class AWSIoTFirehoseAction;
@class AWSIoTGetEffectivePoliciesRequest;
@class AWSIoTGetEffectivePoliciesResponse;
@class AWSIoTGetIndexingConfigurationRequest;
@class AWSIoTGetIndexingConfigurationResponse;
@class AWSIoTGetJobDocumentRequest;
@class AWSIoTGetJobDocumentResponse;
@class AWSIoTGetLoggingOptionsRequest;
@class AWSIoTGetLoggingOptionsResponse;
@class AWSIoTGetOTAUpdateRequest;
@class AWSIoTGetOTAUpdateResponse;
@class AWSIoTGetPolicyRequest;
@class AWSIoTGetPolicyResponse;
@class AWSIoTGetPolicyVersionRequest;
@class AWSIoTGetPolicyVersionResponse;
@class AWSIoTGetRegistrationCodeRequest;
@class AWSIoTGetRegistrationCodeResponse;
@class AWSIoTGetTopicRuleRequest;
@class AWSIoTGetTopicRuleResponse;
@class AWSIoTGetV2LoggingOptionsRequest;
@class AWSIoTGetV2LoggingOptionsResponse;
@class AWSIoTGroupNameAndArn;
@class AWSIoTImplicitDeny;
@class AWSIoTIotAnalyticsAction;
@class AWSIoTJob;
@class AWSIoTJobExecution;
@class AWSIoTJobExecutionStatusDetails;
@class AWSIoTJobExecutionSummary;
@class AWSIoTJobExecutionSummaryForJob;
@class AWSIoTJobExecutionSummaryForThing;
@class AWSIoTJobExecutionsRolloutConfig;
@class AWSIoTJobProcessDetails;
@class AWSIoTJobSummary;
@class AWSIoTKeyPair;
@class AWSIoTKinesisAction;
@class AWSIoTLambdaAction;
@class AWSIoTListAttachedPoliciesRequest;
@class AWSIoTListAttachedPoliciesResponse;
@class AWSIoTListAuthorizersRequest;
@class AWSIoTListAuthorizersResponse;
@class AWSIoTListCACertificatesRequest;
@class AWSIoTListCACertificatesResponse;
@class AWSIoTListCertificatesByCARequest;
@class AWSIoTListCertificatesByCAResponse;
@class AWSIoTListCertificatesRequest;
@class AWSIoTListCertificatesResponse;
@class AWSIoTListIndicesRequest;
@class AWSIoTListIndicesResponse;
@class AWSIoTListJobExecutionsForJobRequest;
@class AWSIoTListJobExecutionsForJobResponse;
@class AWSIoTListJobExecutionsForThingRequest;
@class AWSIoTListJobExecutionsForThingResponse;
@class AWSIoTListJobsRequest;
@class AWSIoTListJobsResponse;
@class AWSIoTListOTAUpdatesRequest;
@class AWSIoTListOTAUpdatesResponse;
@class AWSIoTListOutgoingCertificatesRequest;
@class AWSIoTListOutgoingCertificatesResponse;
@class AWSIoTListPoliciesRequest;
@class AWSIoTListPoliciesResponse;
@class AWSIoTListPolicyPrincipalsRequest;
@class AWSIoTListPolicyPrincipalsResponse;
@class AWSIoTListPolicyVersionsRequest;
@class AWSIoTListPolicyVersionsResponse;
@class AWSIoTListPrincipalPoliciesRequest;
@class AWSIoTListPrincipalPoliciesResponse;
@class AWSIoTListPrincipalThingsRequest;
@class AWSIoTListPrincipalThingsResponse;
@class AWSIoTListRoleAliasesRequest;
@class AWSIoTListRoleAliasesResponse;
@class AWSIoTListStreamsRequest;
@class AWSIoTListStreamsResponse;
@class AWSIoTListTargetsForPolicyRequest;
@class AWSIoTListTargetsForPolicyResponse;
@class AWSIoTListThingGroupsForThingRequest;
@class AWSIoTListThingGroupsForThingResponse;
@class AWSIoTListThingGroupsRequest;
@class AWSIoTListThingGroupsResponse;
@class AWSIoTListThingPrincipalsRequest;
@class AWSIoTListThingPrincipalsResponse;
@class AWSIoTListThingRegistrationTaskReportsRequest;
@class AWSIoTListThingRegistrationTaskReportsResponse;
@class AWSIoTListThingRegistrationTasksRequest;
@class AWSIoTListThingRegistrationTasksResponse;
@class AWSIoTListThingTypesRequest;
@class AWSIoTListThingTypesResponse;
@class AWSIoTListThingsInThingGroupRequest;
@class AWSIoTListThingsInThingGroupResponse;
@class AWSIoTListThingsRequest;
@class AWSIoTListThingsResponse;
@class AWSIoTListTopicRulesRequest;
@class AWSIoTListTopicRulesResponse;
@class AWSIoTListV2LoggingLevelsRequest;
@class AWSIoTListV2LoggingLevelsResponse;
@class AWSIoTLogTarget;
@class AWSIoTLogTargetConfiguration;
@class AWSIoTLoggingOptionsPayload;
@class AWSIoTOTAUpdateFile;
@class AWSIoTOTAUpdateInfo;
@class AWSIoTOTAUpdateSummary;
@class AWSIoTOutgoingCertificate;
@class AWSIoTPolicy;
@class AWSIoTPolicyVersion;
@class AWSIoTPresignedUrlConfig;
@class AWSIoTPutItemInput;
@class AWSIoTRegisterCACertificateRequest;
@class AWSIoTRegisterCACertificateResponse;
@class AWSIoTRegisterCertificateRequest;
@class AWSIoTRegisterCertificateResponse;
@class AWSIoTRegisterThingRequest;
@class AWSIoTRegisterThingResponse;
@class AWSIoTRegistrationConfig;
@class AWSIoTRejectCertificateTransferRequest;
@class AWSIoTRemoveThingFromThingGroupRequest;
@class AWSIoTRemoveThingFromThingGroupResponse;
@class AWSIoTReplaceTopicRuleRequest;
@class AWSIoTRepublishAction;
@class AWSIoTRoleAliasDescription;
@class AWSIoTS3Action;
@class AWSIoTS3Location;
@class AWSIoTSalesforceAction;
@class AWSIoTSearchIndexRequest;
@class AWSIoTSearchIndexResponse;
@class AWSIoTSetDefaultAuthorizerRequest;
@class AWSIoTSetDefaultAuthorizerResponse;
@class AWSIoTSetDefaultPolicyVersionRequest;
@class AWSIoTSetLoggingOptionsRequest;
@class AWSIoTSetV2LoggingLevelRequest;
@class AWSIoTSetV2LoggingOptionsRequest;
@class AWSIoTSnsAction;
@class AWSIoTSqsAction;
@class AWSIoTStartThingRegistrationTaskRequest;
@class AWSIoTStartThingRegistrationTaskResponse;
@class AWSIoTStopThingRegistrationTaskRequest;
@class AWSIoTStopThingRegistrationTaskResponse;
@class AWSIoTStream;
@class AWSIoTStreamFile;
@class AWSIoTStreamInfo;
@class AWSIoTStreamSummary;
@class AWSIoTTestAuthorizationRequest;
@class AWSIoTTestAuthorizationResponse;
@class AWSIoTTestInvokeAuthorizerRequest;
@class AWSIoTTestInvokeAuthorizerResponse;
@class AWSIoTThingAttribute;
@class AWSIoTThingDocument;
@class AWSIoTThingGroupMetadata;
@class AWSIoTThingGroupProperties;
@class AWSIoTThingIndexingConfiguration;
@class AWSIoTThingTypeDefinition;
@class AWSIoTThingTypeMetadata;
@class AWSIoTThingTypeProperties;
@class AWSIoTTopicRule;
@class AWSIoTTopicRuleListItem;
@class AWSIoTTopicRulePayload;
@class AWSIoTTransferCertificateRequest;
@class AWSIoTTransferCertificateResponse;
@class AWSIoTTransferData;
@class AWSIoTUpdateAuthorizerRequest;
@class AWSIoTUpdateAuthorizerResponse;
@class AWSIoTUpdateCACertificateRequest;
@class AWSIoTUpdateCertificateRequest;
@class AWSIoTUpdateEventConfigurationsRequest;
@class AWSIoTUpdateEventConfigurationsResponse;
@class AWSIoTUpdateIndexingConfigurationRequest;
@class AWSIoTUpdateIndexingConfigurationResponse;
@class AWSIoTUpdateRoleAliasRequest;
@class AWSIoTUpdateRoleAliasResponse;
@class AWSIoTUpdateStreamRequest;
@class AWSIoTUpdateStreamResponse;
@class AWSIoTUpdateThingGroupRequest;
@class AWSIoTUpdateThingGroupResponse;
@class AWSIoTUpdateThingGroupsForThingRequest;
@class AWSIoTUpdateThingGroupsForThingResponse;
@class AWSIoTUpdateThingRequest;
@class AWSIoTUpdateThingResponse;

/**
 <p>The input for the AcceptCertificateTransfer operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTAcceptCertificateTransferRequest : AWSRequest


/**
 <p>The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>Specifies whether the certificate is active.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setAsActive;

@end

/**
 <p>Describes the actions associated with a rule.</p>
 */
@interface AWSIoTAction : AWSModel


/**
 <p>Change the state of a CloudWatch alarm.</p>
 */
@property (nonatomic, strong) AWSIoTCloudwatchAlarmAction * _Nullable cloudwatchAlarm;

/**
 <p>Capture a CloudWatch metric.</p>
 */
@property (nonatomic, strong) AWSIoTCloudwatchMetricAction * _Nullable cloudwatchMetric;

/**
 <p>Write to a DynamoDB table.</p>
 */
@property (nonatomic, strong) AWSIoTDynamoDBAction * _Nullable dynamoDB;

/**
 <p>Write to a DynamoDB table. This is a new version of the DynamoDB action. It allows you to write each attribute in an MQTT message payload into a separate DynamoDB column.</p>
 */
@property (nonatomic, strong) AWSIoTDynamoDBv2Action * _Nullable dynamoDBv2;

/**
 <p>Write data to an Amazon Elasticsearch Service domain.</p>
 */
@property (nonatomic, strong) AWSIoTElasticsearchAction * _Nullable elasticsearch;

/**
 <p>Write to an Amazon Kinesis Firehose stream.</p>
 */
@property (nonatomic, strong) AWSIoTFirehoseAction * _Nullable firehose;

/**
 <p>Sends message data to an AWS IoT Analytics channel.</p>
 */
@property (nonatomic, strong) AWSIoTIotAnalyticsAction * _Nullable iotAnalytics;

/**
 <p>Write data to an Amazon Kinesis stream.</p>
 */
@property (nonatomic, strong) AWSIoTKinesisAction * _Nullable kinesis;

/**
 <p>Invoke a Lambda function.</p>
 */
@property (nonatomic, strong) AWSIoTLambdaAction * _Nullable lambda;

/**
 <p>Publish to another MQTT topic.</p>
 */
@property (nonatomic, strong) AWSIoTRepublishAction * _Nullable republish;

/**
 <p>Write to an Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) AWSIoTS3Action * _Nullable s3;

/**
 <p>Send a message to a Salesforce IoT Cloud Input Stream.</p>
 */
@property (nonatomic, strong) AWSIoTSalesforceAction * _Nullable salesforce;

/**
 <p>Publish to an Amazon SNS topic.</p>
 */
@property (nonatomic, strong) AWSIoTSnsAction * _Nullable sns;

/**
 <p>Publish to an Amazon SQS queue.</p>
 */
@property (nonatomic, strong) AWSIoTSqsAction * _Nullable sqs;

@end

/**
 
 */
@interface AWSIoTAddThingToThingGroupRequest : AWSRequest


/**
 <p>The ARN of the thing to add to a group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingArn;

/**
 <p>The ARN of the group to which you are adding a thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupArn;

/**
 <p>The name of the group to which you are adding a thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

/**
 <p>The name of the thing to add to a group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 
 */
@interface AWSIoTAddThingToThingGroupResponse : AWSModel


@end

/**
 <p>Contains information that allowed the authorization.</p>
 */
@interface AWSIoTAllowed : AWSModel


/**
 <p>A list of policies that allowed the authentication.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTPolicy *> * _Nullable policies;

@end

/**
 
 */
@interface AWSIoTAssociateTargetsWithJobRequest : AWSRequest


/**
 <p>An optional comment string describing why the job was associated with the targets.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The unique identifier you assigned to this job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>A list of thing group ARNs that define the targets of the job.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targets;

@end

/**
 
 */
@interface AWSIoTAssociateTargetsWithJobResponse : AWSModel


/**
 <p>A short text description of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>An ARN identifying the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The unique identifier you assigned to this job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSIoTAttachPolicyRequest : AWSRequest


/**
 <p>The name of the policy to attach.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The identity to which the policy is attached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

@end

/**
 <p>The input for the AttachPrincipalPolicy operation.</p>
 Required parameters: [policyName, principal]
 */
@interface AWSIoTAttachPrincipalPolicyRequest : AWSRequest


/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The principal, which can be a certificate ARN (as returned from the CreateCertificate operation) or an Amazon Cognito ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

@end

/**
 <p>The input for the AttachThingPrincipal operation.</p>
 Required parameters: [thingName, principal]
 */
@interface AWSIoTAttachThingPrincipalRequest : AWSRequest


/**
 <p>The principal, such as a certificate or other credential.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output from the AttachThingPrincipal operation.</p>
 */
@interface AWSIoTAttachThingPrincipalResponse : AWSModel


@end

/**
 <p>The attribute payload.</p>
 */
@interface AWSIoTAttributePayload : AWSModel


/**
 <p>A JSON string containing up to three key-value pair in JSON format. For example:</p><p><code>{\"attributes\":{\"string1\":\"string2\"}}</code></p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>Specifies whether the list of attributes provided in the <code>AttributePayload</code> is merged with the attributes stored in the registry, instead of overwriting them.</p><p>To remove an attribute, call <code>UpdateThing</code> with an empty attribute value.</p><note><p>The <code>merge</code> attribute is only valid when calling <code>UpdateThing</code>.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable merge;

@end

/**
 <p>A collection of authorization information.</p>
 */
@interface AWSIoTAuthInfo : AWSModel


/**
 <p>The type of action for which the principal is being authorized.</p>
 */
@property (nonatomic, assign) AWSIoTActionType actionType;

/**
 <p>The resources for which the principal is being authorized to perform the specified action.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resources;

@end

/**
 <p>The authorizer result.</p>
 */
@interface AWSIoTAuthResult : AWSModel


/**
 <p>The policies and statements that allowed the specified action.</p>
 */
@property (nonatomic, strong) AWSIoTAllowed * _Nullable allowed;

/**
 <p>The final authorization decision of this scenario. Multiple statements are taken into account when determining the authorization decision. An explicit deny statement can override multiple allow statements.</p>
 */
@property (nonatomic, assign) AWSIoTAuthDecision authDecision;

/**
 <p>Authorization information.</p>
 */
@property (nonatomic, strong) AWSIoTAuthInfo * _Nullable authInfo;

/**
 <p>The policies and statements that denied the specified action.</p>
 */
@property (nonatomic, strong) AWSIoTDenied * _Nullable denied;

/**
 <p>Contains any missing context values found while evaluating policy.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable missingContextValues;

@end

/**
 <p>The authorizer description.</p>
 */
@interface AWSIoTAuthorizerDescription : AWSModel


/**
 <p>The authorizer ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerArn;

/**
 <p>The authorizer's Lambda function ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerFunctionArn;

/**
 <p>The authorizer name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerName;

/**
 <p>The UNIX timestamp of when the authorizer was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The UNIX timestamp of when the authorizer was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The status of the authorizer.</p>
 */
@property (nonatomic, assign) AWSIoTAuthorizerStatus status;

/**
 <p>The key used to extract the token from the HTTP headers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenKeyName;

/**
 <p>The public keys used to validate the token signature returned by your custom authentication service.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tokenSigningPublicKeys;

@end

/**
 <p>The authorizer summary.</p>
 */
@interface AWSIoTAuthorizerSummary : AWSModel


/**
 <p>The authorizer ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerArn;

/**
 <p>The authorizer name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerName;

@end

/**
 <p>A CA certificate.</p>
 */
@interface AWSIoTCACertificate : AWSModel


/**
 <p>The ARN of the CA certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The ID of the CA certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The date the CA certificate was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The status of the CA certificate.</p><p>The status value REGISTER_INACTIVE is deprecated and should not be used.</p>
 */
@property (nonatomic, assign) AWSIoTCACertificateStatus status;

@end

/**
 <p>Describes a CA certificate.</p>
 */
@interface AWSIoTCACertificateDescription : AWSModel


/**
 <p>Whether the CA certificate configured for auto registration of device certificates. Valid values are "ENABLE" and "DISABLE"</p>
 */
@property (nonatomic, assign) AWSIoTAutoRegistrationStatus autoRegistrationStatus;

/**
 <p>The CA certificate ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The CA certificate ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The CA certificate data, in PEM format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificatePem;

/**
 <p>The date the CA certificate was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The customer version of the CA certificate.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable customerVersion;

/**
 <p>The generation ID of the CA certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable generationId;

/**
 <p>The date the CA certificate was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The owner of the CA certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownedBy;

/**
 <p>The status of a CA certificate.</p>
 */
@property (nonatomic, assign) AWSIoTCACertificateStatus status;

@end

/**
 <p>The input for the CancelCertificateTransfer operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTCancelCertificateTransferRequest : AWSRequest


/**
 <p>The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

@end

/**
 
 */
@interface AWSIoTCancelJobExecutionRequest : AWSRequest


/**
 <p>(Optional) The expected current version of the job execution. Each time you update the job execution, its version is incremented. If the version of the job execution stored in Jobs does not match, the update is rejected with a VersionMismatch error, and an ErrorResponse that contains the current job execution status data is returned. (This makes it unnecessary to perform a separate DescribeJobExecution request in order to obtain the job execution status data.)</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expectedVersion;

/**
 <p>(Optional) If <code>true</code> the job execution will be canceled if it has status IN_PROGRESS or QUEUED, otherwise the job execution will be canceled only if it has status QUEUED. If you attempt to cancel a job execution that is IN_PROGRESS, and you do not set <code>force</code> to <code>true</code>, then an <code>InvalidStateTransitionException</code> will be thrown. The default is <code>false</code>.</p><p>Canceling a job execution which is "IN_PROGRESS", will cause the device to be unable to update the job execution status. Use caution and ensure that the device is able to recover to a valid state.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable force;

/**
 <p>The ID of the job to be canceled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>A collection of name/value pairs that describe the status of the job execution. If not specified, the statusDetails are unchanged. You can specify at most 10 name/value pairs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable statusDetails;

/**
 <p>The name of the thing whose execution of the job will be canceled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 
 */
@interface AWSIoTCancelJobRequest : AWSRequest


/**
 <p>An optional comment string describing why the job was canceled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>(Optional) If <code>true</code> job executions with status "IN_PROGRESS" and "QUEUED" are canceled, otherwise only job executions with status "QUEUED" are canceled. The default is <code>false</code>.</p><p>Canceling a job which is "IN_PROGRESS", will cause a device which is executing the job to be unable to update the job execution status. Use caution and ensure that each device executing a job which is canceled is able to recover to a valid state.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable force;

/**
 <p>The unique identifier you assigned to this job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSIoTCancelJobResponse : AWSModel


/**
 <p>A short text description of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The job ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The unique identifier you assigned to this job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 <p>Information about a certificate.</p>
 */
@interface AWSIoTCertificate : AWSModel


/**
 <p>The ARN of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The date and time the certificate was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The status of the certificate.</p><p>The status value REGISTER_INACTIVE is deprecated and should not be used.</p>
 */
@property (nonatomic, assign) AWSIoTCertificateStatus status;

@end

/**
 <p>Describes a certificate.</p>
 */
@interface AWSIoTCertificateDescription : AWSModel


/**
 <p>The certificate ID of the CA certificate used to sign this certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable caCertificateId;

/**
 <p>The ARN of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The ID of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The certificate data, in PEM format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificatePem;

/**
 <p>The date and time the certificate was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The customer version of the certificate.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable customerVersion;

/**
 <p>The generation ID of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable generationId;

/**
 <p>The date and time the certificate was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The ID of the AWS account that owns the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownedBy;

/**
 <p>The ID of the AWS account of the previous owner of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable previousOwnedBy;

/**
 <p>The status of the certificate.</p>
 */
@property (nonatomic, assign) AWSIoTCertificateStatus status;

/**
 <p>The transfer data.</p>
 */
@property (nonatomic, strong) AWSIoTTransferData * _Nullable transferData;

@end

/**
 
 */
@interface AWSIoTClearDefaultAuthorizerRequest : AWSRequest


@end

/**
 
 */
@interface AWSIoTClearDefaultAuthorizerResponse : AWSModel


@end

/**
 <p>Describes an action that updates a CloudWatch alarm.</p>
 Required parameters: [roleArn, alarmName, stateReason, stateValue]
 */
@interface AWSIoTCloudwatchAlarmAction : AWSModel


/**
 <p>The CloudWatch alarm name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmName;

/**
 <p>The IAM role that allows access to the CloudWatch alarm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The reason for the alarm change.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateReason;

/**
 <p>The value of the alarm state. Acceptable values are: OK, ALARM, INSUFFICIENT_DATA.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateValue;

@end

/**
 <p>Describes an action that captures a CloudWatch metric.</p>
 Required parameters: [roleArn, metricNamespace, metricName, metricValue, metricUnit]
 */
@interface AWSIoTCloudwatchMetricAction : AWSModel


/**
 <p>The CloudWatch metric name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The CloudWatch metric namespace name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricNamespace;

/**
 <p>An optional <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/cloudwatch_concepts.html#about_timestamp">Unix timestamp</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricTimestamp;

/**
 <p>The <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/cloudwatch_concepts.html#Unit">metric unit</a> supported by CloudWatch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricUnit;

/**
 <p>The CloudWatch metric value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricValue;

/**
 <p>The IAM role that allows access to the CloudWatch metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>Describes the method to use when code signing a file.</p>
 */
@interface AWSIoTCodeSigning : AWSModel


/**
 <p>The ID of the AWSSignerJob which was created to sign the file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsSignerJobId;

/**
 <p>A custom method for code signing a file.</p>
 */
@property (nonatomic, strong) AWSIoTCustomCodeSigning * _Nullable customCodeSigning;

@end

/**
 <p>Describes the certificate chain being used when code signing a file.</p>
 */
@interface AWSIoTCodeSigningCertificateChain : AWSModel


/**
 <p>The name of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateName;

/**
 <p>A base64 encoded binary representation of the code signing certificate chain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inlineDocument;

/**
 <p>A stream of the certificate chain files.</p>
 */
@property (nonatomic, strong) AWSIoTStream * _Nullable stream;

@end

/**
 <p>Describes the signature for a file.</p>
 */
@interface AWSIoTCodeSigningSignature : AWSModel


/**
 <p>A base64 encoded binary representation of the code signing signature.</p>
 */
@property (nonatomic, strong) NSData * _Nullable inlineDocument;

/**
 <p>A stream of the code signing signature.</p>
 */
@property (nonatomic, strong) AWSIoTStream * _Nullable stream;

@end

/**
 <p>Configuration.</p>
 */
@interface AWSIoTConfiguration : AWSModel


/**
 <p>True to enable the configuration.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 
 */
@interface AWSIoTCreateAuthorizerRequest : AWSRequest


/**
 <p>The ARN of the authorizer's Lambda function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerFunctionArn;

/**
 <p>The authorizer name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerName;

/**
 <p>The status of the create authorizer request.</p>
 */
@property (nonatomic, assign) AWSIoTAuthorizerStatus status;

/**
 <p>The name of the token key used to extract the token from the HTTP headers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenKeyName;

/**
 <p>The public keys used to verify the digital signature returned by your custom authentication service.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tokenSigningPublicKeys;

@end

/**
 
 */
@interface AWSIoTCreateAuthorizerResponse : AWSModel


/**
 <p>The authorizer ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerArn;

/**
 <p>The authorizer's name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerName;

@end

/**
 <p>The input for the CreateCertificateFromCsr operation.</p>
 Required parameters: [certificateSigningRequest]
 */
@interface AWSIoTCreateCertificateFromCsrRequest : AWSRequest


/**
 <p>The certificate signing request (CSR).</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateSigningRequest;

/**
 <p>Specifies whether the certificate is active.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setAsActive;

@end

/**
 <p>The output from the CreateCertificateFromCsr operation.</p>
 */
@interface AWSIoTCreateCertificateFromCsrResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the certificate. You can use the ARN as a principal for policy operations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The ID of the certificate. Certificate management operations only take a certificateId.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The certificate data, in PEM format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificatePem;

@end

/**
 
 */
@interface AWSIoTCreateJobRequest : AWSRequest


/**
 <p>A short text description of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The job document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable document;

/**
 <p>Parameters for the job document.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable documentParameters;

/**
 <p>An S3 link to the job document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentSource;

/**
 <p>Allows you to create a staged rollout of the job.</p>
 */
@property (nonatomic, strong) AWSIoTJobExecutionsRolloutConfig * _Nullable jobExecutionsRolloutConfig;

/**
 <p>A job identifier which must be unique for your AWS account. We recommend using a UUID. Alpha-numeric characters, "-" and "_" are valid for use here.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>Configuration information for pre-signed S3 URLs.</p>
 */
@property (nonatomic, strong) AWSIoTPresignedUrlConfig * _Nullable presignedUrlConfig;

/**
 <p>Specifies whether the job will continue to run (CONTINUOUS), or will be complete after all those things specified as targets have completed the job (SNAPSHOT). If continuous, the job may also be run on a thing when a change is detected in a target. For example, a job will run on a thing when the thing is added to a target group, even after the job was completed by all things originally in the group.</p>
 */
@property (nonatomic, assign) AWSIoTTargetSelection targetSelection;

/**
 <p>A list of things and thing groups to which the job should be sent.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targets;

@end

/**
 
 */
@interface AWSIoTCreateJobResponse : AWSModel


/**
 <p>The job description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The job ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The unique identifier you assigned to this job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 <p>The input for the CreateKeysAndCertificate operation.</p>
 */
@interface AWSIoTCreateKeysAndCertificateRequest : AWSRequest


/**
 <p>Specifies whether the certificate is active.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setAsActive;

@end

/**
 <p>The output of the CreateKeysAndCertificate operation.</p>
 */
@interface AWSIoTCreateKeysAndCertificateResponse : AWSModel


/**
 <p>The ARN of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The ID of the certificate. AWS IoT issues a default subject name for the certificate (for example, AWS IoT Certificate).</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The certificate data, in PEM format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificatePem;

/**
 <p>The generated key pair.</p>
 */
@property (nonatomic, strong) AWSIoTKeyPair * _Nullable keyPair;

@end

/**
 
 */
@interface AWSIoTCreateOTAUpdateRequest : AWSRequest


/**
 <p>A list of additional OTA update parameters which are name-value pairs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable additionalParameters;

/**
 <p>The description of the OTA update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The files to be streamed by the OTA update.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTOTAUpdateFile *> * _Nullable files;

/**
 <p>The ID of the OTA update to be created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable otaUpdateId;

/**
 <p>The IAM role that allows access to the AWS IoT Jobs service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Specifies whether the update will continue to run (CONTINUOUS), or will be complete after all the things specified as targets have completed the update (SNAPSHOT). If continuous, the update may also be run on a thing when a change is detected in a target. For example, an update will run on a thing when the thing is added to a target group, even after the update was completed by all things originally in the group. Valid values: CONTINUOUS | SNAPSHOT.</p>
 */
@property (nonatomic, assign) AWSIoTTargetSelection targetSelection;

/**
 <p>The targeted devices to receive OTA updates.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targets;

@end

/**
 
 */
@interface AWSIoTCreateOTAUpdateResponse : AWSModel


/**
 <p>The AWS IoT job ARN associated with the OTA update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsIotJobArn;

/**
 <p>The AWS IoT job ID associated with the OTA update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsIotJobId;

/**
 <p>The OTA update ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable otaUpdateArn;

/**
 <p>The OTA update ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable otaUpdateId;

/**
 <p>The OTA update status.</p>
 */
@property (nonatomic, assign) AWSIoTOTAUpdateStatus otaUpdateStatus;

@end

/**
 <p>The input for the CreatePolicy operation.</p>
 Required parameters: [policyName, policyDocument]
 */
@interface AWSIoTCreatePolicyRequest : AWSRequest


/**
 <p>The JSON document that describes the policy. <b>policyDocument</b> must have a minimum length of 1, with a maximum length of 2048, excluding whitespace.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>The output from the CreatePolicy operation.</p>
 */
@interface AWSIoTCreatePolicyResponse : AWSModel


/**
 <p>The policy ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The JSON document that describes the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The policy version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyVersionId;

@end

/**
 <p>The input for the CreatePolicyVersion operation.</p>
 Required parameters: [policyName, policyDocument]
 */
@interface AWSIoTCreatePolicyVersionRequest : AWSRequest


/**
 <p>The JSON document that describes the policy. Minimum length of 1. Maximum length of 2048, excluding whitespace.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>Specifies whether the policy version is set as the default. When this parameter is true, the new policy version becomes the operative version (that is, the version that is in effect for the certificates to which the policy is attached).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setAsDefault;

@end

/**
 <p>The output of the CreatePolicyVersion operation.</p>
 */
@interface AWSIoTCreatePolicyVersionResponse : AWSModel


/**
 <p>Specifies whether the policy version is the default.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefaultVersion;

/**
 <p>The policy ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The JSON document that describes the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The policy version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyVersionId;

@end

/**
 
 */
@interface AWSIoTCreateRoleAliasRequest : AWSRequest


/**
 <p>How long (in seconds) the credentials will be valid.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable credentialDurationSeconds;

/**
 <p>The role alias that points to a role ARN. This allows you to change the role without having to update the device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleAlias;

/**
 <p>The role ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSIoTCreateRoleAliasResponse : AWSModel


/**
 <p>The role alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleAlias;

/**
 <p>The role alias ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleAliasArn;

@end

/**
 
 */
@interface AWSIoTCreateStreamRequest : AWSRequest


/**
 <p>A description of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The files to stream.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTStreamFile *> * _Nullable files;

/**
 <p>An IAM role that allows the IoT service principal assumes to access your S3 files.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The stream ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamId;

@end

/**
 
 */
@interface AWSIoTCreateStreamResponse : AWSModel


/**
 <p>A description of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The stream ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamArn;

/**
 <p>The stream ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamId;

/**
 <p>The version of the stream.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable streamVersion;

@end

/**
 
 */
@interface AWSIoTCreateThingGroupRequest : AWSRequest


/**
 <p>The name of the parent thing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentGroupName;

/**
 <p>The thing group name to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

/**
 <p>The thing group properties.</p>
 */
@property (nonatomic, strong) AWSIoTThingGroupProperties * _Nullable thingGroupProperties;

@end

/**
 
 */
@interface AWSIoTCreateThingGroupResponse : AWSModel


/**
 <p>The thing group ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupArn;

/**
 <p>The thing group ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupId;

/**
 <p>The thing group name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

@end

/**
 <p>The input for the CreateThing operation.</p>
 Required parameters: [thingName]
 */
@interface AWSIoTCreateThingRequest : AWSRequest


/**
 <p>The attribute payload, which consists of up to three name/value pairs in a JSON document. For example:</p><p><code>{\"attributes\":{\"string1\":\"string2\"}}</code></p>
 */
@property (nonatomic, strong) AWSIoTAttributePayload * _Nullable attributePayload;

/**
 <p>The name of the thing to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

/**
 <p>The name of the thing type associated with the new thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

@end

/**
 <p>The output of the CreateThing operation.</p>
 */
@interface AWSIoTCreateThingResponse : AWSModel


/**
 <p>The ARN of the new thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingArn;

/**
 <p>The thing ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingId;

/**
 <p>The name of the new thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The input for the CreateThingType operation.</p>
 Required parameters: [thingTypeName]
 */
@interface AWSIoTCreateThingTypeRequest : AWSRequest


/**
 <p>The name of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

/**
 <p>The ThingTypeProperties for the thing type to create. It contains information about the new thing type including a description, and a list of searchable thing attribute names.</p>
 */
@property (nonatomic, strong) AWSIoTThingTypeProperties * _Nullable thingTypeProperties;

@end

/**
 <p>The output of the CreateThingType operation.</p>
 */
@interface AWSIoTCreateThingTypeResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeArn;

/**
 <p>The thing type ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeId;

/**
 <p>The name of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

@end

/**
 <p>The input for the CreateTopicRule operation.</p>
 Required parameters: [ruleName, topicRulePayload]
 */
@interface AWSIoTCreateTopicRuleRequest : AWSRequest


/**
 <p>The name of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

/**
 <p>The rule payload.</p>
 */
@property (nonatomic, strong) AWSIoTTopicRulePayload * _Nullable topicRulePayload;

@end

/**
 <p>Describes a custom method used to code sign a file.</p>
 */
@interface AWSIoTCustomCodeSigning : AWSModel


/**
 <p>The certificate chain.</p>
 */
@property (nonatomic, strong) AWSIoTCodeSigningCertificateChain * _Nullable certificateChain;

/**
 <p>The hash algorithm used to code sign the file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hashAlgorithm;

/**
 <p>The signature for the file.</p>
 */
@property (nonatomic, strong) AWSIoTCodeSigningSignature * _Nullable signature;

/**
 <p>The signature algorithm used to code sign the file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable signatureAlgorithm;

@end

/**
 
 */
@interface AWSIoTDeleteAuthorizerRequest : AWSRequest


/**
 <p>The name of the authorizer to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerName;

@end

/**
 
 */
@interface AWSIoTDeleteAuthorizerResponse : AWSModel


@end

/**
 <p>Input for the DeleteCACertificate operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTDeleteCACertificateRequest : AWSRequest


/**
 <p>The ID of the certificate to delete. (The last part of the certificate ARN contains the certificate ID.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

@end

/**
 <p>The output for the DeleteCACertificate operation.</p>
 */
@interface AWSIoTDeleteCACertificateResponse : AWSModel


@end

/**
 <p>The input for the DeleteCertificate operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTDeleteCertificateRequest : AWSRequest


/**
 <p>The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>Forces a certificate request to be deleted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceDelete;

@end

/**
 
 */
@interface AWSIoTDeleteJobExecutionRequest : AWSRequest


/**
 <p>The ID of the job execution to be deleted. The <code>executionNumber</code> refers to the execution of a particular job on a particular device.</p><p>Note that once a job execution is deleted, the <code>executionNumber</code> may be reused by IoT, so be sure you get and use the correct value here.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable executionNumber;

/**
 <p>(Optional) When true, you can delete a job execution which is "IN_PROGRESS". Otherwise, you can only delete a job execution which is in a terminal state ("SUCCEEDED", "FAILED", "REJECTED", "REMOVED" or "CANCELED") or an exception will occur. The default is false.</p><note><p>Deleting a job execution which is "IN_PROGRESS", will cause the device to be unable to access job information or update the job execution status. Use caution and ensure that the device is able to recover to a valid state.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable force;

/**
 <p>The ID of the job whose execution on a particular device will be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The name of the thing whose job execution will be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 
 */
@interface AWSIoTDeleteJobRequest : AWSRequest


/**
 <p>(Optional) When true, you can delete a job which is "IN_PROGRESS". Otherwise, you can only delete a job which is in a terminal state ("COMPLETED" or "CANCELED") or an exception will occur. The default is false.</p><note><p>Deleting a job which is "IN_PROGRESS", will cause a device which is executing the job to be unable to access job information or update the job execution status. Use caution and ensure that each device executing a job which is deleted is able to recover to a valid state.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable force;

/**
 <p>The ID of the job to be deleted.</p><p>After a job deletion is completed, you may reuse this jobId when you create a new job. However, this is not recommended, and you must ensure that your devices are not using the jobId to refer to the deleted job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSIoTDeleteOTAUpdateRequest : AWSRequest


/**
 <p>The OTA update ID to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable otaUpdateId;

@end

/**
 
 */
@interface AWSIoTDeleteOTAUpdateResponse : AWSModel


@end

/**
 <p>The input for the DeletePolicy operation.</p>
 Required parameters: [policyName]
 */
@interface AWSIoTDeletePolicyRequest : AWSRequest


/**
 <p>The name of the policy to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>The input for the DeletePolicyVersion operation.</p>
 Required parameters: [policyName, policyVersionId]
 */
@interface AWSIoTDeletePolicyVersionRequest : AWSRequest


/**
 <p>The name of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The policy version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyVersionId;

@end

/**
 <p>The input for the DeleteRegistrationCode operation.</p>
 */
@interface AWSIoTDeleteRegistrationCodeRequest : AWSRequest


@end

/**
 <p>The output for the DeleteRegistrationCode operation.</p>
 */
@interface AWSIoTDeleteRegistrationCodeResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTDeleteRoleAliasRequest : AWSRequest


/**
 <p>The role alias to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleAlias;

@end

/**
 
 */
@interface AWSIoTDeleteRoleAliasResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTDeleteStreamRequest : AWSRequest


/**
 <p>The stream ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamId;

@end

/**
 
 */
@interface AWSIoTDeleteStreamResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTDeleteThingGroupRequest : AWSRequest


/**
 <p>The expected version of the thing group to delete.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expectedVersion;

/**
 <p>The name of the thing group to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

@end

/**
 
 */
@interface AWSIoTDeleteThingGroupResponse : AWSModel


@end

/**
 <p>The input for the DeleteThing operation.</p>
 Required parameters: [thingName]
 */
@interface AWSIoTDeleteThingRequest : AWSRequest


/**
 <p>The expected version of the thing record in the registry. If the version of the record in the registry does not match the expected version specified in the request, the <code>DeleteThing</code> request is rejected with a <code>VersionConflictException</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expectedVersion;

/**
 <p>The name of the thing to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output of the DeleteThing operation.</p>
 */
@interface AWSIoTDeleteThingResponse : AWSModel


@end

/**
 <p>The input for the DeleteThingType operation.</p>
 Required parameters: [thingTypeName]
 */
@interface AWSIoTDeleteThingTypeRequest : AWSRequest


/**
 <p>The name of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

@end

/**
 <p>The output for the DeleteThingType operation.</p>
 */
@interface AWSIoTDeleteThingTypeResponse : AWSModel


@end

/**
 <p>The input for the DeleteTopicRule operation.</p>
 Required parameters: [ruleName]
 */
@interface AWSIoTDeleteTopicRuleRequest : AWSRequest


/**
 <p>The name of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

@end

/**
 
 */
@interface AWSIoTDeleteV2LoggingLevelRequest : AWSRequest


/**
 <p>The name of the resource for which you are configuring logging.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetName;

/**
 <p>The type of resource for which you are configuring logging. Must be <code>THING_Group</code>.</p>
 */
@property (nonatomic, assign) AWSIoTLogTargetType targetType;

@end

/**
 <p>Contains information that denied the authorization.</p>
 */
@interface AWSIoTDenied : AWSModel


/**
 <p>Information that explicitly denies the authorization. </p>
 */
@property (nonatomic, strong) AWSIoTExplicitDeny * _Nullable explicitDeny;

/**
 <p>Information that implicitly denies the authorization. When a policy doesn't explicitly deny or allow an action on a resource it is considered an implicit deny.</p>
 */
@property (nonatomic, strong) AWSIoTImplicitDeny * _Nullable implicitDeny;

@end

/**
 <p>The input for the DeprecateThingType operation.</p>
 Required parameters: [thingTypeName]
 */
@interface AWSIoTDeprecateThingTypeRequest : AWSRequest


/**
 <p>The name of the thing type to deprecate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

/**
 <p>Whether to undeprecate a deprecated thing type. If <b>true</b>, the thing type will not be deprecated anymore and you can associate it with things.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable undoDeprecate;

@end

/**
 <p>The output for the DeprecateThingType operation.</p>
 */
@interface AWSIoTDeprecateThingTypeResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTDescribeAuthorizerRequest : AWSRequest


/**
 <p>The name of the authorizer to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerName;

@end

/**
 
 */
@interface AWSIoTDescribeAuthorizerResponse : AWSModel


/**
 <p>The authorizer description.</p>
 */
@property (nonatomic, strong) AWSIoTAuthorizerDescription * _Nullable authorizerDescription;

@end

/**
 <p>The input for the DescribeCACertificate operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTDescribeCACertificateRequest : AWSRequest


/**
 <p>The CA certificate identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

@end

/**
 <p>The output from the DescribeCACertificate operation.</p>
 */
@interface AWSIoTDescribeCACertificateResponse : AWSModel


/**
 <p>The CA certificate description.</p>
 */
@property (nonatomic, strong) AWSIoTCACertificateDescription * _Nullable certificateDescription;

/**
 <p>Information about the registration configuration.</p>
 */
@property (nonatomic, strong) AWSIoTRegistrationConfig * _Nullable registrationConfig;

@end

/**
 <p>The input for the DescribeCertificate operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTDescribeCertificateRequest : AWSRequest


/**
 <p>The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

@end

/**
 <p>The output of the DescribeCertificate operation.</p>
 */
@interface AWSIoTDescribeCertificateResponse : AWSModel


/**
 <p>The description of the certificate.</p>
 */
@property (nonatomic, strong) AWSIoTCertificateDescription * _Nullable certificateDescription;

@end

/**
 
 */
@interface AWSIoTDescribeDefaultAuthorizerRequest : AWSRequest


@end

/**
 
 */
@interface AWSIoTDescribeDefaultAuthorizerResponse : AWSModel


/**
 <p>The default authorizer's description.</p>
 */
@property (nonatomic, strong) AWSIoTAuthorizerDescription * _Nullable authorizerDescription;

@end

/**
 <p>The input for the DescribeEndpoint operation.</p>
 */
@interface AWSIoTDescribeEndpointRequest : AWSRequest


/**
 <p>The endpoint type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointType;

@end

/**
 <p>The output from the DescribeEndpoint operation.</p>
 */
@interface AWSIoTDescribeEndpointResponse : AWSModel


/**
 <p>The endpoint. The format of the endpoint is as follows: <i>identifier</i>.iot.<i>region</i>.amazonaws.com.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointAddress;

@end

/**
 
 */
@interface AWSIoTDescribeEventConfigurationsRequest : AWSRequest


@end

/**
 
 */
@interface AWSIoTDescribeEventConfigurationsResponse : AWSModel


/**
 <p>The creation date of the event configuration.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The event configurations.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSIoTConfiguration *> * _Nullable eventConfigurations;

/**
 <p>The date the event configurations were last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

@end

/**
 
 */
@interface AWSIoTDescribeIndexRequest : AWSRequest


/**
 <p>The index name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

@end

/**
 
 */
@interface AWSIoTDescribeIndexResponse : AWSModel


/**
 <p>The index name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The index status.</p>
 */
@property (nonatomic, assign) AWSIoTIndexStatus indexStatus;

/**
 <p>Contains a value that specifies the type of indexing performed. Valid values are:</p><ol><li><p>REGISTRY – Your thing index will contain only registry data.</p></li><li><p>REGISTRY_AND_SHADOW - Your thing index will contain registry and shadow data.</p></li></ol>
 */
@property (nonatomic, strong) NSString * _Nullable schema;

@end

/**
 
 */
@interface AWSIoTDescribeJobExecutionRequest : AWSRequest


/**
 <p>A string (consisting of the digits "0" through "9" which is used to specify a particular job execution on a particular device.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable executionNumber;

/**
 <p>The unique identifier you assigned to this job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The name of the thing on which the job execution is running.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 
 */
@interface AWSIoTDescribeJobExecutionResponse : AWSModel


/**
 <p>Information about the job execution.</p>
 */
@property (nonatomic, strong) AWSIoTJobExecution * _Nullable execution;

@end

/**
 
 */
@interface AWSIoTDescribeJobRequest : AWSRequest


/**
 <p>The unique identifier you assigned to this job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSIoTDescribeJobResponse : AWSModel


/**
 <p>An S3 link to the job document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentSource;

/**
 <p>Information about the job.</p>
 */
@property (nonatomic, strong) AWSIoTJob * _Nullable job;

@end

/**
 
 */
@interface AWSIoTDescribeRoleAliasRequest : AWSRequest


/**
 <p>The role alias to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleAlias;

@end

/**
 
 */
@interface AWSIoTDescribeRoleAliasResponse : AWSModel


/**
 <p>The role alias description.</p>
 */
@property (nonatomic, strong) AWSIoTRoleAliasDescription * _Nullable roleAliasDescription;

@end

/**
 
 */
@interface AWSIoTDescribeStreamRequest : AWSRequest


/**
 <p>The stream ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamId;

@end

/**
 
 */
@interface AWSIoTDescribeStreamResponse : AWSModel


/**
 <p>Information about the stream.</p>
 */
@property (nonatomic, strong) AWSIoTStreamInfo * _Nullable streamInfo;

@end

/**
 
 */
@interface AWSIoTDescribeThingGroupRequest : AWSRequest


/**
 <p>The name of the thing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

@end

/**
 
 */
@interface AWSIoTDescribeThingGroupResponse : AWSModel


/**
 <p>The thing group ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupArn;

/**
 <p>The thing group ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupId;

/**
 <p>Thing group metadata.</p>
 */
@property (nonatomic, strong) AWSIoTThingGroupMetadata * _Nullable thingGroupMetadata;

/**
 <p>The name of the thing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

/**
 <p>The thing group properties.</p>
 */
@property (nonatomic, strong) AWSIoTThingGroupProperties * _Nullable thingGroupProperties;

/**
 <p>The version of the thing group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 
 */
@interface AWSIoTDescribeThingRegistrationTaskRequest : AWSRequest


/**
 <p>The task ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 
 */
@interface AWSIoTDescribeThingRegistrationTaskResponse : AWSModel


/**
 <p>The task creation date.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The number of things that failed to be provisioned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failureCount;

/**
 <p>The S3 bucket that contains the input file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputFileBucket;

/**
 <p>The input file key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputFileKey;

/**
 <p>The date when the task was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The progress of the bulk provisioning task expressed as a percentage.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable percentageProgress;

/**
 <p>The role ARN that grants access to the input file bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The status of the bulk thing provisioning task.</p>
 */
@property (nonatomic, assign) AWSIoTStatus status;

/**
 <p>The number of things successfully provisioned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable successCount;

/**
 <p>The task ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

/**
 <p>The task's template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateBody;

@end

/**
 <p>The input for the DescribeThing operation.</p>
 Required parameters: [thingName]
 */
@interface AWSIoTDescribeThingRequest : AWSRequest


/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output from the DescribeThing operation.</p>
 */
@interface AWSIoTDescribeThingResponse : AWSModel


/**
 <p>The thing attributes.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The default client ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultClientId;

/**
 <p>The ARN of the thing to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingArn;

/**
 <p>The ID of the thing to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingId;

/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

/**
 <p>The thing type name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

/**
 <p>The current version of the thing record in the registry.</p><note><p>To avoid unintentional changes to the information in the registry, you can pass the version information in the <code>expectedVersion</code> parameter of the <code>UpdateThing</code> and <code>DeleteThing</code> calls.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>The input for the DescribeThingType operation.</p>
 Required parameters: [thingTypeName]
 */
@interface AWSIoTDescribeThingTypeRequest : AWSRequest


/**
 <p>The name of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

@end

/**
 <p>The output for the DescribeThingType operation.</p>
 */
@interface AWSIoTDescribeThingTypeResponse : AWSModel


/**
 <p>The thing type ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeArn;

/**
 <p>The thing type ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeId;

/**
 <p>The ThingTypeMetadata contains additional information about the thing type including: creation date and time, a value indicating whether the thing type is deprecated, and a date and time when it was deprecated.</p>
 */
@property (nonatomic, strong) AWSIoTThingTypeMetadata * _Nullable thingTypeMetadata;

/**
 <p>The name of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

/**
 <p>The ThingTypeProperties contains information about the thing type including description, and a list of searchable thing attribute names.</p>
 */
@property (nonatomic, strong) AWSIoTThingTypeProperties * _Nullable thingTypeProperties;

@end

/**
 
 */
@interface AWSIoTDetachPolicyRequest : AWSRequest


/**
 <p>The policy to detach.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The target from which the policy will be detached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

@end

/**
 <p>The input for the DetachPrincipalPolicy operation.</p>
 Required parameters: [policyName, principal]
 */
@interface AWSIoTDetachPrincipalPolicyRequest : AWSRequest


/**
 <p>The name of the policy to detach.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The principal.</p><p>If the principal is a certificate, specify the certificate ARN. If the principal is an Amazon Cognito identity, specify the identity ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

@end

/**
 <p>The input for the DetachThingPrincipal operation.</p>
 Required parameters: [thingName, principal]
 */
@interface AWSIoTDetachThingPrincipalRequest : AWSRequest


/**
 <p>If the principal is a certificate, this value must be ARN of the certificate. If the principal is an Amazon Cognito identity, this value must be the ID of the Amazon Cognito identity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output from the DetachThingPrincipal operation.</p>
 */
@interface AWSIoTDetachThingPrincipalResponse : AWSModel


@end

/**
 <p>The input for the DisableTopicRuleRequest operation.</p>
 Required parameters: [ruleName]
 */
@interface AWSIoTDisableTopicRuleRequest : AWSRequest


/**
 <p>The name of the rule to disable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

@end

/**
 <p>Describes an action to write to a DynamoDB table.</p><p>The <code>tableName</code>, <code>hashKeyField</code>, and <code>rangeKeyField</code> values must match the values used when you created the table.</p><p>The <code>hashKeyValue</code> and <code>rangeKeyvalue</code> fields use a substitution template syntax. These templates provide data at runtime. The syntax is as follows: ${<i>sql-expression</i>}.</p><p>You can specify any valid expression in a WHERE or SELECT clause, including JSON properties, comparisons, calculations, and functions. For example, the following field uses the third level of the topic:</p><p><code>"hashKeyValue": "${topic(3)}"</code></p><p>The following field uses the timestamp:</p><p><code>"rangeKeyValue": "${timestamp()}"</code></p>
 Required parameters: [tableName, roleArn, hashKeyField, hashKeyValue]
 */
@interface AWSIoTDynamoDBAction : AWSModel


/**
 <p>The hash key name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hashKeyField;

/**
 <p>The hash key type. Valid values are "STRING" or "NUMBER"</p>
 */
@property (nonatomic, assign) AWSIoTDynamoKeyType hashKeyType;

/**
 <p>The hash key value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hashKeyValue;

/**
 <p>The type of operation to be performed. This follows the substitution template, so it can be <code>${operation}</code>, but the substitution must result in one of the following: <code>INSERT</code>, <code>UPDATE</code>, or <code>DELETE</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operation;

/**
 <p>The action payload. This name can be customized.</p>
 */
@property (nonatomic, strong) NSString * _Nullable payloadField;

/**
 <p>The range key name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rangeKeyField;

/**
 <p>The range key type. Valid values are "STRING" or "NUMBER"</p>
 */
@property (nonatomic, assign) AWSIoTDynamoKeyType rangeKeyType;

/**
 <p>The range key value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rangeKeyValue;

/**
 <p>The ARN of the IAM role that grants access to the DynamoDB table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The name of the DynamoDB table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>Describes an action to write to a DynamoDB table.</p><p>This DynamoDB action writes each attribute in the message payload into it's own column in the DynamoDB table.</p>
 */
@interface AWSIoTDynamoDBv2Action : AWSModel


/**
 <p>Specifies the DynamoDB table to which the message data will be written. For example:</p><p><code>{ "dynamoDBv2": { "roleArn": "aws:iam:12341251:my-role" "putItem": { "tableName": "my-table" } } }</code></p><p>Each attribute in the message payload will be written to a separate column in the DynamoDB database.</p>
 */
@property (nonatomic, strong) AWSIoTPutItemInput * _Nullable putItem;

/**
 <p>The ARN of the IAM role that grants access to the DynamoDB table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>The policy that has the effect on the authorization results.</p>
 */
@interface AWSIoTEffectivePolicy : AWSModel


/**
 <p>The policy ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The IAM policy document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>Describes an action that writes data to an Amazon Elasticsearch Service domain.</p>
 Required parameters: [roleArn, endpoint, index, type, id]
 */
@interface AWSIoTElasticsearchAction : AWSModel


/**
 <p>The endpoint of your Elasticsearch domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpoint;

/**
 <p>The unique identifier for the document you are storing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The Elasticsearch index where you want to store your data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable index;

/**
 <p>The IAM role ARN that has access to Elasticsearch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The type of document you are storing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>The input for the EnableTopicRuleRequest operation.</p>
 Required parameters: [ruleName]
 */
@interface AWSIoTEnableTopicRuleRequest : AWSRequest


/**
 <p>The name of the topic rule to enable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

@end

/**
 <p>Error information.</p>
 */
@interface AWSIoTErrorInfo : AWSModel


/**
 <p>The error code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>The error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Information that explicitly denies authorization.</p>
 */
@interface AWSIoTExplicitDeny : AWSModel


/**
 <p>The policies that denied the authorization.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTPolicy *> * _Nullable policies;

@end

/**
 <p>Describes an action that writes data to an Amazon Kinesis Firehose stream.</p>
 Required parameters: [roleArn, deliveryStreamName]
 */
@interface AWSIoTFirehoseAction : AWSModel


/**
 <p>The delivery stream name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deliveryStreamName;

/**
 <p>The IAM role that grants access to the Amazon Kinesis Firehose stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>A character separator that will be used to separate records written to the Firehose stream. Valid values are: '\n' (newline), '\t' (tab), '\r\n' (Windows newline), ',' (comma).</p>
 */
@property (nonatomic, strong) NSString * _Nullable separator;

@end

/**
 
 */
@interface AWSIoTGetEffectivePoliciesRequest : AWSRequest


/**
 <p>The Cognito identity pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cognitoIdentityPoolId;

/**
 <p>The principal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

/**
 <p>The thing name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 
 */
@interface AWSIoTGetEffectivePoliciesResponse : AWSModel


/**
 <p>The effective policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTEffectivePolicy *> * _Nullable effectivePolicies;

@end

/**
 
 */
@interface AWSIoTGetIndexingConfigurationRequest : AWSRequest


@end

/**
 
 */
@interface AWSIoTGetIndexingConfigurationResponse : AWSModel


/**
 <p>Thing indexing configuration.</p>
 */
@property (nonatomic, strong) AWSIoTThingIndexingConfiguration * _Nullable thingIndexingConfiguration;

@end

/**
 
 */
@interface AWSIoTGetJobDocumentRequest : AWSRequest


/**
 <p>The unique identifier you assigned to this job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSIoTGetJobDocumentResponse : AWSModel


/**
 <p>The job document content.</p>
 */
@property (nonatomic, strong) NSString * _Nullable document;

@end

/**
 <p>The input for the GetLoggingOptions operation.</p>
 */
@interface AWSIoTGetLoggingOptionsRequest : AWSRequest


@end

/**
 <p>The output from the GetLoggingOptions operation.</p>
 */
@interface AWSIoTGetLoggingOptionsResponse : AWSModel


/**
 <p>The logging level.</p>
 */
@property (nonatomic, assign) AWSIoTLogLevel logLevel;

/**
 <p>The ARN of the IAM role that grants access.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSIoTGetOTAUpdateRequest : AWSRequest


/**
 <p>The OTA update ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable otaUpdateId;

@end

/**
 
 */
@interface AWSIoTGetOTAUpdateResponse : AWSModel


/**
 <p>The OTA update info.</p>
 */
@property (nonatomic, strong) AWSIoTOTAUpdateInfo * _Nullable otaUpdateInfo;

@end

/**
 <p>The input for the GetPolicy operation.</p>
 Required parameters: [policyName]
 */
@interface AWSIoTGetPolicyRequest : AWSRequest


/**
 <p>The name of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>The output from the GetPolicy operation.</p>
 */
@interface AWSIoTGetPolicyResponse : AWSModel


/**
 <p>The date the policy was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The default policy version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultVersionId;

/**
 <p>The generation ID of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable generationId;

/**
 <p>The date the policy was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The policy ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The JSON document that describes the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>The input for the GetPolicyVersion operation.</p>
 Required parameters: [policyName, policyVersionId]
 */
@interface AWSIoTGetPolicyVersionRequest : AWSRequest


/**
 <p>The name of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The policy version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyVersionId;

@end

/**
 <p>The output from the GetPolicyVersion operation.</p>
 */
@interface AWSIoTGetPolicyVersionResponse : AWSModel


/**
 <p>The date the policy version was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The generation ID of the policy version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable generationId;

/**
 <p>Specifies whether the policy version is the default.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefaultVersion;

/**
 <p>The date the policy version was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The policy ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The JSON document that describes the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The policy version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyVersionId;

@end

/**
 <p>The input to the GetRegistrationCode operation.</p>
 */
@interface AWSIoTGetRegistrationCodeRequest : AWSRequest


@end

/**
 <p>The output from the GetRegistrationCode operation.</p>
 */
@interface AWSIoTGetRegistrationCodeResponse : AWSModel


/**
 <p>The CA certificate registration code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registrationCode;

@end

/**
 <p>The input for the GetTopicRule operation.</p>
 Required parameters: [ruleName]
 */
@interface AWSIoTGetTopicRuleRequest : AWSRequest


/**
 <p>The name of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

@end

/**
 <p>The output from the GetTopicRule operation.</p>
 */
@interface AWSIoTGetTopicRuleResponse : AWSModel


/**
 <p>The rule.</p>
 */
@property (nonatomic, strong) AWSIoTTopicRule * _Nullable rule;

/**
 <p>The rule ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleArn;

@end

/**
 
 */
@interface AWSIoTGetV2LoggingOptionsRequest : AWSRequest


@end

/**
 
 */
@interface AWSIoTGetV2LoggingOptionsResponse : AWSModel


/**
 <p>The default log level.</p>
 */
@property (nonatomic, assign) AWSIoTLogLevel defaultLogLevel;

/**
 <p>Disables all logs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableAllLogs;

/**
 <p>The IAM role ARN AWS IoT uses to write to your CloudWatch logs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>The name and ARN of a group.</p>
 */
@interface AWSIoTGroupNameAndArn : AWSModel


/**
 <p>The group ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupArn;

/**
 <p>The group name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

@end

/**
 <p>Information that implicitly denies authorization. When policy doesn't explicitly deny or allow an action on a resource it is considered an implicit deny.</p>
 */
@interface AWSIoTImplicitDeny : AWSModel


/**
 <p>Policies that don't contain a matching allow or deny statement for the specified action on the specified resource. </p>
 */
@property (nonatomic, strong) NSArray<AWSIoTPolicy *> * _Nullable policies;

@end

/**
 <p>Sends messge data to an AWS IoT Analytics channel.</p>
 */
@interface AWSIoTIotAnalyticsAction : AWSModel


/**
 <p>(deprecated) The ARN of the IoT Analytics channel to which message data will be sent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The name of the IoT Analytics channel to which message data will be sent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelName;

/**
 <p>The ARN of the role which has a policy that grants IoT Analytics permission to send message data via IoT Analytics (iotanalytics:BatchPutMessage).</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>The <code>Job</code> object contains details about a job.</p>
 */
@interface AWSIoTJob : AWSModel


/**
 <p>If the job was updated, describes the reason for the update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The time, in milliseconds since the epoch, when the job was completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completedAt;

/**
 <p>The time, in milliseconds since the epoch, when the job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>A short text description of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The parameters specified for the job document.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable documentParameters;

/**
 <p>Will be <code>true</code> if the job was canceled with the optional <code>force</code> parameter set to <code>true</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceCanceled;

/**
 <p>An ARN identifying the job with format "arn:aws:iot:region:account:job/jobId".</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>Allows you to create a staged rollout of a job.</p>
 */
@property (nonatomic, strong) AWSIoTJobExecutionsRolloutConfig * _Nullable jobExecutionsRolloutConfig;

/**
 <p>The unique identifier you assigned to this job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>Details about the job process.</p>
 */
@property (nonatomic, strong) AWSIoTJobProcessDetails * _Nullable jobProcessDetails;

/**
 <p>The time, in milliseconds since the epoch, when the job was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>Configuration for pre-signed S3 URLs.</p>
 */
@property (nonatomic, strong) AWSIoTPresignedUrlConfig * _Nullable presignedUrlConfig;

/**
 <p>The status of the job, one of <code>IN_PROGRESS</code>, <code>CANCELED</code>, or <code>COMPLETED</code>. </p>
 */
@property (nonatomic, assign) AWSIoTJobStatus status;

/**
 <p>Specifies whether the job will continue to run (CONTINUOUS), or will be complete after all those things specified as targets have completed the job (SNAPSHOT). If continuous, the job may also be run on a thing when a change is detected in a target. For example, a job will run on a device when the thing representing the device is added to a target group, even after the job was completed by all things originally in the group. </p>
 */
@property (nonatomic, assign) AWSIoTTargetSelection targetSelection;

/**
 <p>A list of IoT things and thing groups to which the job should be sent.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targets;

@end

/**
 <p>The job execution object represents the execution of a job on a particular device.</p>
 */
@interface AWSIoTJobExecution : AWSModel


/**
 <p>A string (consisting of the digits "0" through "9") which identifies this particular job execution on this particular device. It can be used in commands which return or update job execution information. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable executionNumber;

/**
 <p>Will be <code>true</code> if the job execution was canceled with the optional <code>force</code> parameter set to <code>true</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceCanceled;

/**
 <p>The unique identifier you assigned to the job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The time, in milliseconds since the epoch, when the job execution was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>The time, in milliseconds since the epoch, when the job execution was queued.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable queuedAt;

/**
 <p>The time, in milliseconds since the epoch, when the job execution started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startedAt;

/**
 <p>The status of the job execution (IN_PROGRESS, QUEUED, FAILED, SUCCESS, CANCELED, or REJECTED).</p>
 */
@property (nonatomic, assign) AWSIoTJobExecutionStatus status;

/**
 <p>A collection of name/value pairs that describe the status of the job execution.</p>
 */
@property (nonatomic, strong) AWSIoTJobExecutionStatusDetails * _Nullable statusDetails;

/**
 <p>The ARN of the thing on which the job execution is running.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingArn;

/**
 <p>The version of the job execution. Job execution versions are incremented each time they are updated by a device.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable versionNumber;

@end

/**
 <p>Details of the job execution status.</p>
 */
@interface AWSIoTJobExecutionStatusDetails : AWSModel


/**
 <p>The job execution status.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable detailsMap;

@end

/**
 <p>The job execution summary.</p>
 */
@interface AWSIoTJobExecutionSummary : AWSModel


/**
 <p>A string (consisting of the digits "0" through "9") which identifies this particular job execution on this particular device. It can be used later in commands which return or update job execution information.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable executionNumber;

/**
 <p>The time, in milliseconds since the epoch, when the job execution was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>The time, in milliseconds since the epoch, when the job execution was queued.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable queuedAt;

/**
 <p>The time, in milliseconds since the epoch, when the job execution started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startedAt;

/**
 <p>The status of the job execution.</p>
 */
@property (nonatomic, assign) AWSIoTJobExecutionStatus status;

@end

/**
 <p>Contains a summary of information about job executions for a specific job.</p>
 */
@interface AWSIoTJobExecutionSummaryForJob : AWSModel


/**
 <p>Contains a subset of information about a job execution.</p>
 */
@property (nonatomic, strong) AWSIoTJobExecutionSummary * _Nullable jobExecutionSummary;

/**
 <p>The ARN of the thing on which the job execution is running.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingArn;

@end

/**
 <p>The job execution summary for a thing.</p>
 */
@interface AWSIoTJobExecutionSummaryForThing : AWSModel


/**
 <p>Contains a subset of information about a job execution.</p>
 */
@property (nonatomic, strong) AWSIoTJobExecutionSummary * _Nullable jobExecutionSummary;

/**
 <p>The unique identifier you assigned to this job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 <p>Allows you to create a staged rollout of a job.</p>
 */
@interface AWSIoTJobExecutionsRolloutConfig : AWSModel


/**
 <p>The maximum number of things that will be notified of a pending job, per minute. This parameter allows you to create a staged rollout.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumPerMinute;

@end

/**
 <p>The job process details.</p>
 */
@interface AWSIoTJobProcessDetails : AWSModel


/**
 <p>The number of things that cancelled the job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfCanceledThings;

/**
 <p>The number of things that failed executing the job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfFailedThings;

/**
 <p>The number of things currently executing the job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfInProgressThings;

/**
 <p>The number of things that are awaiting execution of the job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfQueuedThings;

/**
 <p>The number of things that rejected the job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfRejectedThings;

/**
 <p>The number of things that are no longer scheduled to execute the job because they have been deleted or have been removed from the group that was a target of the job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfRemovedThings;

/**
 <p>The number of things which successfully completed the job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfSucceededThings;

/**
 <p>The target devices to which the job execution is being rolled out. This value will be null after the job execution has finished rolling out to all the target devices.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable processingTargets;

@end

/**
 <p>The job summary.</p>
 */
@interface AWSIoTJobSummary : AWSModel


/**
 <p>The time, in milliseconds since the epoch, when the job completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completedAt;

/**
 <p>The time, in milliseconds since the epoch, when the job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The job ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The unique identifier you assigned to this job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The time, in milliseconds since the epoch, when the job was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>The job summary status.</p>
 */
@property (nonatomic, assign) AWSIoTJobStatus status;

/**
 <p>Specifies whether the job will continue to run (CONTINUOUS), or will be complete after all those things specified as targets have completed the job (SNAPSHOT). If continuous, the job may also be run on a thing when a change is detected in a target. For example, a job will run on a thing when the thing is added to a target group, even after the job was completed by all things originally in the group.</p>
 */
@property (nonatomic, assign) AWSIoTTargetSelection targetSelection;

/**
 <p>The ID of the thing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupId;

@end

/**
 <p>Describes a key pair.</p>
 */
@interface AWSIoTKeyPair : AWSModel


/**
 <p>The private key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateKey;

/**
 <p>The public key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicKey;

@end

/**
 <p>Describes an action to write data to an Amazon Kinesis stream.</p>
 Required parameters: [roleArn, streamName]
 */
@interface AWSIoTKinesisAction : AWSModel


/**
 <p>The partition key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable partitionKey;

/**
 <p>The ARN of the IAM role that grants access to the Amazon Kinesis stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The name of the Amazon Kinesis stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 <p>Describes an action to invoke a Lambda function.</p>
 Required parameters: [functionArn]
 */
@interface AWSIoTLambdaAction : AWSModel


/**
 <p>The ARN of the Lambda function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionArn;

@end

/**
 
 */
@interface AWSIoTListAttachedPoliciesRequest : AWSRequest


/**
 <p>The token to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of results to be returned per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>When true, recursively list attached policies.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recursive;

/**
 <p>The group for which the policies will be listed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

@end

/**
 
 */
@interface AWSIoTListAttachedPoliciesResponse : AWSModel


/**
 <p>The token to retrieve the next set of results, or ``null`` if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTPolicy *> * _Nullable policies;

@end

/**
 
 */
@interface AWSIoTListAuthorizersRequest : AWSRequest


/**
 <p>Return the list of authorizers in ascending alphabetical order.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>A marker used to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The status of the list authorizers request.</p>
 */
@property (nonatomic, assign) AWSIoTAuthorizerStatus status;

@end

/**
 
 */
@interface AWSIoTListAuthorizersResponse : AWSModel


/**
 <p>The authorizers.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTAuthorizerSummary *> * _Nullable authorizers;

/**
 <p>A marker used to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 <p>Input for the ListCACertificates operation.</p>
 */
@interface AWSIoTListCACertificatesRequest : AWSRequest


/**
 <p>Determines the order of the results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The result page size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 <p>The output from the ListCACertificates operation.</p>
 */
@interface AWSIoTListCACertificatesResponse : AWSModel


/**
 <p>The CA certificates registered in your AWS account.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTCACertificate *> * _Nullable certificates;

/**
 <p>The current position within the list of CA certificates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 <p>The input to the ListCertificatesByCA operation.</p>
 Required parameters: [caCertificateId]
 */
@interface AWSIoTListCertificatesByCARequest : AWSRequest


/**
 <p>Specifies the order for results. If True, the results are returned in ascending order, based on the creation date.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>The ID of the CA certificate. This operation will list all registered device certificate that were signed by this CA certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable caCertificateId;

/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The result page size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 <p>The output of the ListCertificatesByCA operation.</p>
 */
@interface AWSIoTListCertificatesByCAResponse : AWSModel


/**
 <p>The device certificates signed by the specified CA certificate.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTCertificate *> * _Nullable certificates;

/**
 <p>The marker for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 <p>The input for the ListCertificates operation.</p>
 */
@interface AWSIoTListCertificatesRequest : AWSRequest


/**
 <p>Specifies the order for results. If True, the results are returned in ascending order, based on the creation date.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The result page size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 <p>The output of the ListCertificates operation.</p>
 */
@interface AWSIoTListCertificatesResponse : AWSModel


/**
 <p>The descriptions of the certificates.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTCertificate *> * _Nullable certificates;

/**
 <p>The marker for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSIoTListIndicesRequest : AWSRequest


/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListIndicesResponse : AWSModel


/**
 <p>The index names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable indexNames;

/**
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListJobExecutionsForJobRequest : AWSRequest


/**
 <p>The unique identifier you assigned to this job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The maximum number of results to be returned per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The status of the job.</p>
 */
@property (nonatomic, assign) AWSIoTJobExecutionStatus status;

@end

/**
 
 */
@interface AWSIoTListJobExecutionsForJobResponse : AWSModel


/**
 <p>A list of job execution summaries.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTJobExecutionSummaryForJob *> * _Nullable executionSummaries;

/**
 <p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListJobExecutionsForThingRequest : AWSRequest


/**
 <p>The maximum number of results to be returned per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An optional filter that lets you search for jobs that have the specified status.</p>
 */
@property (nonatomic, assign) AWSIoTJobExecutionStatus status;

/**
 <p>The thing name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 
 */
@interface AWSIoTListJobExecutionsForThingResponse : AWSModel


/**
 <p>A list of job execution summaries.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTJobExecutionSummaryForThing *> * _Nullable executionSummaries;

/**
 <p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListJobsRequest : AWSRequest


/**
 <p>The maximum number of results to return per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An optional filter that lets you search for jobs that have the specified status.</p>
 */
@property (nonatomic, assign) AWSIoTJobStatus status;

/**
 <p>Specifies whether the job will continue to run (CONTINUOUS), or will be complete after all those things specified as targets have completed the job (SNAPSHOT). If continuous, the job may also be run on a thing when a change is detected in a target. For example, a job will run on a thing when the thing is added to a target group, even after the job was completed by all things originally in the group. </p>
 */
@property (nonatomic, assign) AWSIoTTargetSelection targetSelection;

/**
 <p>A filter that limits the returned jobs to those for the specified group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupId;

/**
 <p>A filter that limits the returned jobs to those for the specified group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

@end

/**
 
 */
@interface AWSIoTListJobsResponse : AWSModel


/**
 <p>A list of jobs.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTJobSummary *> * _Nullable jobs;

/**
 <p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListOTAUpdatesRequest : AWSRequest


/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token used to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The OTA update job status.</p>
 */
@property (nonatomic, assign) AWSIoTOTAUpdateStatus otaUpdateStatus;

@end

/**
 
 */
@interface AWSIoTListOTAUpdatesResponse : AWSModel


/**
 <p>A token to use to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of OTA update jobs.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTOTAUpdateSummary *> * _Nullable otaUpdates;

@end

/**
 <p>The input to the ListOutgoingCertificates operation.</p>
 */
@interface AWSIoTListOutgoingCertificatesRequest : AWSRequest


/**
 <p>Specifies the order for results. If True, the results are returned in ascending order, based on the creation date.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The result page size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 <p>The output from the ListOutgoingCertificates operation.</p>
 */
@interface AWSIoTListOutgoingCertificatesResponse : AWSModel


/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The certificates that are being transferred but not yet accepted.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTOutgoingCertificate *> * _Nullable outgoingCertificates;

@end

/**
 <p>The input for the ListPolicies operation.</p>
 */
@interface AWSIoTListPoliciesRequest : AWSRequest


/**
 <p>Specifies the order for results. If true, the results are returned in ascending creation order.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The result page size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 <p>The output from the ListPolicies operation.</p>
 */
@interface AWSIoTListPoliciesResponse : AWSModel


/**
 <p>The marker for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The descriptions of the policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTPolicy *> * _Nullable policies;

@end

/**
 <p>The input for the ListPolicyPrincipals operation.</p>
 Required parameters: [policyName]
 */
@interface AWSIoTListPolicyPrincipalsRequest : AWSRequest


/**
 <p>Specifies the order for results. If true, the results are returned in ascending creation order.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The result page size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>The output from the ListPolicyPrincipals operation.</p>
 */
@interface AWSIoTListPolicyPrincipalsResponse : AWSModel


/**
 <p>The marker for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The descriptions of the principals.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable principals;

@end

/**
 <p>The input for the ListPolicyVersions operation.</p>
 Required parameters: [policyName]
 */
@interface AWSIoTListPolicyVersionsRequest : AWSRequest


/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>The output from the ListPolicyVersions operation.</p>
 */
@interface AWSIoTListPolicyVersionsResponse : AWSModel


/**
 <p>The policy versions.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTPolicyVersion *> * _Nullable policyVersions;

@end

/**
 <p>The input for the ListPrincipalPolicies operation.</p>
 Required parameters: [principal]
 */
@interface AWSIoTListPrincipalPoliciesRequest : AWSRequest


/**
 <p>Specifies the order for results. If true, results are returned in ascending creation order.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The result page size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The principal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

@end

/**
 <p>The output from the ListPrincipalPolicies operation.</p>
 */
@interface AWSIoTListPrincipalPoliciesResponse : AWSModel


/**
 <p>The marker for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTPolicy *> * _Nullable policies;

@end

/**
 <p>The input for the ListPrincipalThings operation.</p>
 Required parameters: [principal]
 */
@interface AWSIoTListPrincipalThingsRequest : AWSRequest


/**
 <p>The maximum number of results to return in this operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The principal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

@end

/**
 <p>The output from the ListPrincipalThings operation.</p>
 */
@interface AWSIoTListPrincipalThingsResponse : AWSModel


/**
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The things.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable things;

@end

/**
 
 */
@interface AWSIoTListRoleAliasesRequest : AWSRequest


/**
 <p>Return the list of role aliases in ascending alphabetical order.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>A marker used to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 
 */
@interface AWSIoTListRoleAliasesResponse : AWSModel


/**
 <p>A marker used to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The role aliases.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable roleAliases;

@end

/**
 
 */
@interface AWSIoTListStreamsRequest : AWSRequest


/**
 <p>Set to true to return the list of streams in ascending order.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>The maximum number of results to return at a time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token used to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListStreamsResponse : AWSModel


/**
 <p>A token used to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of streams.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTStreamSummary *> * _Nullable streams;

@end

/**
 
 */
@interface AWSIoTListTargetsForPolicyRequest : AWSRequest


/**
 <p>A marker used to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 
 */
@interface AWSIoTListTargetsForPolicyResponse : AWSModel


/**
 <p>A marker used to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The policy targets.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targets;

@end

/**
 
 */
@interface AWSIoTListThingGroupsForThingRequest : AWSRequest


/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The thing name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 
 */
@interface AWSIoTListThingGroupsForThingResponse : AWSModel


/**
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The thing groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTGroupNameAndArn *> * _Nullable thingGroups;

@end

/**
 
 */
@interface AWSIoTListThingGroupsRequest : AWSRequest


/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A filter that limits the results to those with the specified name prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namePrefixFilter;

/**
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A filter that limits the results to those with the specified parent group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentGroup;

/**
 <p>If true, return child groups as well.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recursive;

@end

/**
 
 */
@interface AWSIoTListThingGroupsResponse : AWSModel


/**
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The thing groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTGroupNameAndArn *> * _Nullable thingGroups;

@end

/**
 <p>The input for the ListThingPrincipal operation.</p>
 Required parameters: [thingName]
 */
@interface AWSIoTListThingPrincipalsRequest : AWSRequest


/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output from the ListThingPrincipals operation.</p>
 */
@interface AWSIoTListThingPrincipalsResponse : AWSModel


/**
 <p>The principals associated with the thing.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable principals;

@end

/**
 
 */
@interface AWSIoTListThingRegistrationTaskReportsRequest : AWSRequest


/**
 <p>The maximum number of results to return per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The type of task report.</p>
 */
@property (nonatomic, assign) AWSIoTReportType reportType;

/**
 <p>The id of the task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 
 */
@interface AWSIoTListThingRegistrationTaskReportsResponse : AWSModel


/**
 <p>The token to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The type of task report.</p>
 */
@property (nonatomic, assign) AWSIoTReportType reportType;

/**
 <p>Links to the task resources.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceLinks;

@end

/**
 
 */
@interface AWSIoTListThingRegistrationTasksRequest : AWSRequest


/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The status of the bulk thing provisioning task.</p>
 */
@property (nonatomic, assign) AWSIoTStatus status;

@end

/**
 
 */
@interface AWSIoTListThingRegistrationTasksResponse : AWSModel


/**
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of bulk thing provisioning task IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable taskIds;

@end

/**
 <p>The input for the ListThingTypes operation.</p>
 */
@interface AWSIoTListThingTypesRequest : AWSRequest


/**
 <p>The maximum number of results to return in this operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

@end

/**
 <p>The output for the ListThingTypes operation.</p>
 */
@interface AWSIoTListThingTypesResponse : AWSModel


/**
 <p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The thing types.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTThingTypeDefinition *> * _Nullable thingTypes;

@end

/**
 
 */
@interface AWSIoTListThingsInThingGroupRequest : AWSRequest


/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>When true, list things in this thing group and in all child groups as well.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recursive;

/**
 <p>The thing group name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

@end

/**
 
 */
@interface AWSIoTListThingsInThingGroupResponse : AWSModel


/**
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The things in the specified thing group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable things;

@end

/**
 <p>The input for the ListThings operation.</p>
 */
@interface AWSIoTListThingsRequest : AWSRequest


/**
 <p>The attribute name used to search for things.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The attribute value used to search for things.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeValue;

/**
 <p>The maximum number of results to return in this operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the thing type used to search for things.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

@end

/**
 <p>The output from the ListThings operation.</p>
 */
@interface AWSIoTListThingsResponse : AWSModel


/**
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The things.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTThingAttribute *> * _Nullable things;

@end

/**
 <p>The input for the ListTopicRules operation.</p>
 */
@interface AWSIoTListTopicRulesRequest : AWSRequest


/**
 <p>The maximum number of results to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token used to retrieve the next value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Specifies whether the rule is disabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ruleDisabled;

/**
 <p>The topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topic;

@end

/**
 <p>The output from the ListTopicRules operation.</p>
 */
@interface AWSIoTListTopicRulesResponse : AWSModel


/**
 <p>A token used to retrieve the next value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The rules.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTTopicRuleListItem *> * _Nullable rules;

@end

/**
 
 */
@interface AWSIoTListV2LoggingLevelsRequest : AWSRequest


/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The type of resource for which you are configuring logging. Must be <code>THING_Group</code>.</p>
 */
@property (nonatomic, assign) AWSIoTLogTargetType targetType;

@end

/**
 
 */
@interface AWSIoTListV2LoggingLevelsResponse : AWSModel


/**
 <p>The logging configuration for a target.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTLogTargetConfiguration *> * _Nullable logTargetConfigurations;

/**
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>A log target.</p>
 Required parameters: [targetType]
 */
@interface AWSIoTLogTarget : AWSModel


/**
 <p>The target name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetName;

/**
 <p>The target type.</p>
 */
@property (nonatomic, assign) AWSIoTLogTargetType targetType;

@end

/**
 <p>The target configuration.</p>
 */
@interface AWSIoTLogTargetConfiguration : AWSModel


/**
 <p>The logging level.</p>
 */
@property (nonatomic, assign) AWSIoTLogLevel logLevel;

/**
 <p>A log target</p>
 */
@property (nonatomic, strong) AWSIoTLogTarget * _Nullable logTarget;

@end

/**
 <p>Describes the logging options payload.</p>
 Required parameters: [roleArn]
 */
@interface AWSIoTLoggingOptionsPayload : AWSModel


/**
 <p>The log level.</p>
 */
@property (nonatomic, assign) AWSIoTLogLevel logLevel;

/**
 <p>The ARN of the IAM role that grants access.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>Describes a file to be associated with an OTA update.</p>
 */
@interface AWSIoTOTAUpdateFile : AWSModel


/**
 <p>A list of name/attribute pairs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The code signing method of the file.</p>
 */
@property (nonatomic, strong) AWSIoTCodeSigning * _Nullable codeSigning;

/**
 <p>The name of the file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileName;

/**
 <p>The source of the file.</p>
 */
@property (nonatomic, strong) AWSIoTStream * _Nullable fileSource;

/**
 <p>The file version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileVersion;

@end

/**
 <p>Information about an OTA update.</p>
 */
@interface AWSIoTOTAUpdateInfo : AWSModel


/**
 <p>A collection of name/value pairs</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable additionalParameters;

/**
 <p>The AWS IoT job ARN associated with the OTA update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsIotJobArn;

/**
 <p>The AWS IoT job ID associated with the OTA update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsIotJobId;

/**
 <p>The date when the OTA update was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>A description of the OTA update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Error information associated with the OTA update.</p>
 */
@property (nonatomic, strong) AWSIoTErrorInfo * _Nullable errorInfo;

/**
 <p>The date when the OTA update was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The OTA update ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable otaUpdateArn;

/**
 <p>A list of files associated with the OTA update.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTOTAUpdateFile *> * _Nullable otaUpdateFiles;

/**
 <p>The OTA update ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable otaUpdateId;

/**
 <p>The status of the OTA update.</p>
 */
@property (nonatomic, assign) AWSIoTOTAUpdateStatus otaUpdateStatus;

/**
 <p>Specifies whether the OTA update will continue to run (CONTINUOUS), or will be complete after all those things specified as targets have completed the OTA update (SNAPSHOT). If continuous, the OTA update may also be run on a thing when a change is detected in a target. For example, an OTA update will run on a thing when the thing is added to a target group, even after the OTA update was completed by all things originally in the group. </p>
 */
@property (nonatomic, assign) AWSIoTTargetSelection targetSelection;

/**
 <p>The targets of the OTA update.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targets;

@end

/**
 <p>An OTA update summary.</p>
 */
@interface AWSIoTOTAUpdateSummary : AWSModel


/**
 <p>The date when the OTA update was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The OTA update ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable otaUpdateArn;

/**
 <p>The OTA update ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable otaUpdateId;

@end

/**
 <p>A certificate that has been transferred but not yet accepted.</p>
 */
@interface AWSIoTOutgoingCertificate : AWSModel


/**
 <p>The certificate ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The certificate ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The certificate creation date.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The date the transfer was initiated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable transferDate;

/**
 <p>The transfer message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transferMessage;

/**
 <p>The AWS account to which the transfer was made.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transferredTo;

@end

/**
 <p>Describes an AWS IoT policy.</p>
 */
@interface AWSIoTPolicy : AWSModel


/**
 <p>The policy ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>Describes a policy version.</p>
 */
@interface AWSIoTPolicyVersion : AWSModel


/**
 <p>The date and time the policy was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p>Specifies whether the policy version is the default.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefaultVersion;

/**
 <p>The policy version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 <p>Configuration for pre-signed S3 URLs.</p>
 */
@interface AWSIoTPresignedUrlConfig : AWSModel


/**
 <p>How long (in seconds) pre-signed URLs are valid. Valid values are 60 - 3600, the default value is 3600 seconds. Pre-signed URLs are generated when Jobs receives an MQTT request for the job document.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expiresInSec;

/**
 <p>The ARN of an IAM role that grants grants permission to download files from the S3 bucket where the job data/updates are stored. The role must also grant permission for IoT to download the files.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>The input for the DynamoActionVS action that specifies the DynamoDB table to which the message data will be written.</p>
 Required parameters: [tableName]
 */
@interface AWSIoTPutItemInput : AWSModel


/**
 <p>The table where the message data will be written</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>The input to the RegisterCACertificate operation.</p>
 Required parameters: [caCertificate, verificationCertificate]
 */
@interface AWSIoTRegisterCACertificateRequest : AWSRequest


/**
 <p>Allows this CA certificate to be used for auto registration of device certificates.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowAutoRegistration;

/**
 <p>The CA certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable caCertificate;

/**
 <p>Information about the registration configuration.</p>
 */
@property (nonatomic, strong) AWSIoTRegistrationConfig * _Nullable registrationConfig;

/**
 <p>A boolean value that specifies if the CA certificate is set to active.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setAsActive;

/**
 <p>The private key verification certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable verificationCertificate;

@end

/**
 <p>The output from the RegisterCACertificateResponse operation.</p>
 */
@interface AWSIoTRegisterCACertificateResponse : AWSModel


/**
 <p>The CA certificate ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The CA certificate identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

@end

/**
 <p>The input to the RegisterCertificate operation.</p>
 Required parameters: [certificatePem]
 */
@interface AWSIoTRegisterCertificateRequest : AWSRequest


/**
 <p>The CA certificate used to sign the device certificate being registered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable caCertificatePem;

/**
 <p>The certificate data, in PEM format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificatePem;

/**
 <p>A boolean value that specifies if the CA certificate is set to active.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setAsActive;

/**
 <p>The status of the register certificate request.</p>
 */
@property (nonatomic, assign) AWSIoTCertificateStatus status;

@end

/**
 <p>The output from the RegisterCertificate operation.</p>
 */
@interface AWSIoTRegisterCertificateResponse : AWSModel


/**
 <p>The certificate ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The certificate identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

@end

/**
 
 */
@interface AWSIoTRegisterThingRequest : AWSRequest


/**
 <p>The parameters for provisioning a thing. See <a href="http://docs.aws.amazon.com/iot/latest/developerguide/programmatic-provisioning.html">Programmatic Provisioning</a> for more information.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable parameters;

/**
 <p>The provisioning template. See <a href="http://docs.aws.amazon.com/iot/latest/developerguide/programmatic-provisioning.html">Programmatic Provisioning</a> for more information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateBody;

@end

/**
 
 */
@interface AWSIoTRegisterThingResponse : AWSModel


/**
 <p>The PEM of a certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificatePem;

/**
 <p>ARNs for the generated resources.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable resourceArns;

@end

/**
 <p>The registration configuration.</p>
 */
@interface AWSIoTRegistrationConfig : AWSModel


/**
 <p>The ARN of the role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The template body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateBody;

@end

/**
 <p>The input for the RejectCertificateTransfer operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTRejectCertificateTransferRequest : AWSRequest


/**
 <p>The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The reason the certificate transfer was rejected.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rejectReason;

@end

/**
 
 */
@interface AWSIoTRemoveThingFromThingGroupRequest : AWSRequest


/**
 <p>The ARN of the thing to remove from the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingArn;

/**
 <p>The group ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupArn;

/**
 <p>The group name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

/**
 <p>The name of the thing to remove from the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 
 */
@interface AWSIoTRemoveThingFromThingGroupResponse : AWSModel


@end

/**
 <p>The input for the ReplaceTopicRule operation.</p>
 Required parameters: [ruleName, topicRulePayload]
 */
@interface AWSIoTReplaceTopicRuleRequest : AWSRequest


/**
 <p>The name of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

/**
 <p>The rule payload.</p>
 */
@property (nonatomic, strong) AWSIoTTopicRulePayload * _Nullable topicRulePayload;

@end

/**
 <p>Describes an action to republish to another topic.</p>
 Required parameters: [roleArn, topic]
 */
@interface AWSIoTRepublishAction : AWSModel


/**
 <p>The ARN of the IAM role that grants access.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The name of the MQTT topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topic;

@end

/**
 <p>Role alias description.</p>
 */
@interface AWSIoTRoleAliasDescription : AWSModel


/**
 <p>The UNIX timestamp of when the role alias was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The number of seconds for which the credential is valid.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable credentialDurationSeconds;

/**
 <p>The UNIX timestamp of when the role alias was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The role alias owner.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p>The role alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleAlias;

/**
 <p>The ARN of the role alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleAliasArn;

/**
 <p>The role ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>Describes an action to write data to an Amazon S3 bucket.</p>
 Required parameters: [roleArn, bucketName, key]
 */
@interface AWSIoTS3Action : AWSModel


/**
 <p>The Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketName;

/**
 <p>The Amazon S3 canned ACL that controls access to the object identified by the object key. For more information, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl">S3 canned ACLs</a>.</p>
 */
@property (nonatomic, assign) AWSIoTCannedAccessControlList cannedAcl;

/**
 <p>The object key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The ARN of the IAM role that grants access.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>The location in S3 the contains the files to stream.</p>
 Required parameters: [bucket, key]
 */
@interface AWSIoTS3Location : AWSModel


/**
 <p>The S3 bucket that contains the file to stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The name of the file within the S3 bucket to stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The file version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>Describes an action to write a message to a Salesforce IoT Cloud Input Stream.</p>
 Required parameters: [token, url]
 */
@interface AWSIoTSalesforceAction : AWSModel


/**
 <p>The token used to authenticate access to the Salesforce IoT Cloud Input Stream. The token is available from the Salesforce IoT Cloud platform after creation of the Input Stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable token;

/**
 <p>The URL exposed by the Salesforce IoT Cloud Input Stream. The URL is available from the Salesforce IoT Cloud platform after creation of the Input Stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 
 */
@interface AWSIoTSearchIndexRequest : AWSRequest


/**
 <p>The search index name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The search query string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryString;

/**
 <p>The query version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryVersion;

@end

/**
 
 */
@interface AWSIoTSearchIndexResponse : AWSModel


/**
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The things that match the search query.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTThingDocument *> * _Nullable things;

@end

/**
 
 */
@interface AWSIoTSetDefaultAuthorizerRequest : AWSRequest


/**
 <p>The authorizer name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerName;

@end

/**
 
 */
@interface AWSIoTSetDefaultAuthorizerResponse : AWSModel


/**
 <p>The authorizer ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerArn;

/**
 <p>The authorizer name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerName;

@end

/**
 <p>The input for the SetDefaultPolicyVersion operation.</p>
 Required parameters: [policyName, policyVersionId]
 */
@interface AWSIoTSetDefaultPolicyVersionRequest : AWSRequest


/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The policy version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyVersionId;

@end

/**
 <p>The input for the SetLoggingOptions operation.</p>
 Required parameters: [loggingOptionsPayload]
 */
@interface AWSIoTSetLoggingOptionsRequest : AWSRequest


/**
 <p>The logging options payload.</p>
 */
@property (nonatomic, strong) AWSIoTLoggingOptionsPayload * _Nullable loggingOptionsPayload;

@end

/**
 
 */
@interface AWSIoTSetV2LoggingLevelRequest : AWSRequest


/**
 <p>The log level.</p>
 */
@property (nonatomic, assign) AWSIoTLogLevel logLevel;

/**
 <p>The log target.</p>
 */
@property (nonatomic, strong) AWSIoTLogTarget * _Nullable logTarget;

@end

/**
 
 */
@interface AWSIoTSetV2LoggingOptionsRequest : AWSRequest


/**
 <p>The default logging level.</p>
 */
@property (nonatomic, assign) AWSIoTLogLevel defaultLogLevel;

/**
 <p>Set to true to disable all logs, otherwise set to false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableAllLogs;

/**
 <p>The role ARN that allows IoT to write to Cloudwatch logs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>Describes an action to publish to an Amazon SNS topic.</p>
 Required parameters: [targetArn, roleArn]
 */
@interface AWSIoTSnsAction : AWSModel


/**
 <p>(Optional) The message format of the message to publish. Accepted values are "JSON" and "RAW". The default value of the attribute is "RAW". SNS uses this setting to determine if the payload should be parsed and relevant platform-specific bits of the payload should be extracted. To read more about SNS message formats, see <a href="http://docs.aws.amazon.com/sns/latest/dg/json-formats.html">http://docs.aws.amazon.com/sns/latest/dg/json-formats.html</a> refer to their official documentation.</p>
 */
@property (nonatomic, assign) AWSIoTMessageFormat messageFormat;

/**
 <p>The ARN of the IAM role that grants access.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The ARN of the SNS topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

@end

/**
 <p>Describes an action to publish data to an Amazon SQS queue.</p>
 Required parameters: [roleArn, queueUrl]
 */
@interface AWSIoTSqsAction : AWSModel


/**
 <p>The URL of the Amazon SQS queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueUrl;

/**
 <p>The ARN of the IAM role that grants access.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Specifies whether to use Base64 encoding.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable useBase64;

@end

/**
 
 */
@interface AWSIoTStartThingRegistrationTaskRequest : AWSRequest


/**
 <p>The S3 bucket that contains the input file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputFileBucket;

/**
 <p>The name of input file within the S3 bucket. This file contains a newline delimited JSON file. Each line contains the parameter values to provision one device (thing).</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputFileKey;

/**
 <p>The IAM role ARN that grants permission the input file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The provisioning template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateBody;

@end

/**
 
 */
@interface AWSIoTStartThingRegistrationTaskResponse : AWSModel


/**
 <p>The bulk thing provisioning task ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 
 */
@interface AWSIoTStopThingRegistrationTaskRequest : AWSRequest


/**
 <p>The bulk thing provisioning task ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 
 */
@interface AWSIoTStopThingRegistrationTaskResponse : AWSModel


@end

/**
 <p>Describes a group of files that can be streamed.</p>
 */
@interface AWSIoTStream : AWSModel


/**
 <p>The ID of a file associated with a stream.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fileId;

/**
 <p>The stream ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamId;

@end

/**
 <p>Represents a file to stream.</p>
 */
@interface AWSIoTStreamFile : AWSModel


/**
 <p>The file ID.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fileId;

/**
 <p>The location of the file in S3.</p>
 */
@property (nonatomic, strong) AWSIoTS3Location * _Nullable s3Location;

@end

/**
 <p>Information about a stream.</p>
 */
@interface AWSIoTStreamInfo : AWSModel


/**
 <p>The date when the stream was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The description of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The files to stream.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTStreamFile *> * _Nullable files;

/**
 <p>The date when the stream was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>An IAM role AWS IoT assumes to access your S3 files.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The stream ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamArn;

/**
 <p>The stream ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamId;

/**
 <p>The stream version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable streamVersion;

@end

/**
 <p>A summary of a stream.</p>
 */
@interface AWSIoTStreamSummary : AWSModel


/**
 <p>A description of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The stream ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamArn;

/**
 <p>The stream ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamId;

/**
 <p>The stream version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable streamVersion;

@end

/**
 
 */
@interface AWSIoTTestAuthorizationRequest : AWSRequest


/**
 <p>A list of authorization info objects. Simulating authorization will create a response for each <code>authInfo</code> object in the list.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTAuthInfo *> * _Nullable authInfos;

/**
 <p>The MQTT client ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The Cognito identity pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cognitoIdentityPoolId;

/**
 <p>When testing custom authorization, the policies specified here are treated as if they are attached to the principal being authorized.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyNamesToAdd;

/**
 <p>When testing custom authorization, the policies specified here are treated as if they are not attached to the principal being authorized.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyNamesToSkip;

/**
 <p>The principal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

@end

/**
 
 */
@interface AWSIoTTestAuthorizationResponse : AWSModel


/**
 <p>The authentication results.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTAuthResult *> * _Nullable authResults;

@end

/**
 
 */
@interface AWSIoTTestInvokeAuthorizerRequest : AWSRequest


/**
 <p>The custom authorizer name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerName;

/**
 <p>The token returned by your custom authentication service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable token;

/**
 <p>The signature made with the token and your custom authentication service's private key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenSignature;

@end

/**
 
 */
@interface AWSIoTTestInvokeAuthorizerResponse : AWSModel


/**
 <p>The number of seconds after which the connection is terminated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disconnectAfterInSeconds;

/**
 <p>True if the token is authenticated, otherwise false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isAuthenticated;

/**
 <p>IAM policy documents.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyDocuments;

/**
 <p>The principal ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principalId;

/**
 <p>The number of seconds after which the temporary credentials are refreshed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable refreshAfterInSeconds;

@end

/**
 <p>The properties of the thing, including thing name, thing type name, and a list of thing attributes.</p>
 */
@interface AWSIoTThingAttribute : AWSModel


/**
 <p>A list of thing attributes which are name-value pairs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The thing ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingArn;

/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

/**
 <p>The name of the thing type, if the thing has been associated with a type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

/**
 <p>The version of the thing record in the registry.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>The thing search index document.</p>
 */
@interface AWSIoTThingDocument : AWSModel


/**
 <p>The attributes.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The shadow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable shadow;

/**
 <p>Thing group names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable thingGroupNames;

/**
 <p>The thing ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingId;

/**
 <p>The thing name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

/**
 <p>The thing type name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

@end

/**
 <p>Thing group metadata.</p>
 */
@interface AWSIoTThingGroupMetadata : AWSModel


/**
 <p>The UNIX timestamp of when the thing group was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The parent thing group name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentGroupName;

/**
 <p>The root parent thing group.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTGroupNameAndArn *> * _Nullable rootToParentThingGroups;

@end

/**
 <p>Thing group properties.</p>
 */
@interface AWSIoTThingGroupProperties : AWSModel


/**
 <p>The thing group attributes in JSON format.</p>
 */
@property (nonatomic, strong) AWSIoTAttributePayload * _Nullable attributePayload;

/**
 <p>The thing group description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupDescription;

@end

/**
 <p>Thing indexing configuration.</p>
 */
@interface AWSIoTThingIndexingConfiguration : AWSModel


/**
 <p>Thing indexing mode. Valid values are: </p><ul><li><p>REGISTRY – Your thing index will contain only registry data.</p></li><li><p>REGISTRY_AND_SHADOW - Your thing index will contain registry and shadow data.</p></li><li><p>OFF - Thing indexing is disabled.</p></li></ul>
 */
@property (nonatomic, assign) AWSIoTThingIndexingMode thingIndexingMode;

@end

/**
 <p>The definition of the thing type, including thing type name and description.</p>
 */
@interface AWSIoTThingTypeDefinition : AWSModel


/**
 <p>The thing type ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeArn;

/**
 <p>The ThingTypeMetadata contains additional information about the thing type including: creation date and time, a value indicating whether the thing type is deprecated, and a date and time when it was deprecated.</p>
 */
@property (nonatomic, strong) AWSIoTThingTypeMetadata * _Nullable thingTypeMetadata;

/**
 <p>The name of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

/**
 <p>The ThingTypeProperties for the thing type.</p>
 */
@property (nonatomic, strong) AWSIoTThingTypeProperties * _Nullable thingTypeProperties;

@end

/**
 <p>The ThingTypeMetadata contains additional information about the thing type including: creation date and time, a value indicating whether the thing type is deprecated, and a date and time when time was deprecated.</p>
 */
@interface AWSIoTThingTypeMetadata : AWSModel


/**
 <p>The date and time when the thing type was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>Whether the thing type is deprecated. If <b>true</b>, no new things could be associated with this type.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deprecated;

/**
 <p>The date and time when the thing type was deprecated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deprecationDate;

@end

/**
 <p>The ThingTypeProperties contains information about the thing type including: a thing type description, and a list of searchable thing attribute names.</p>
 */
@interface AWSIoTThingTypeProperties : AWSModel


/**
 <p>A list of searchable thing attribute names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable searchableAttributes;

/**
 <p>The description of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeDescription;

@end

/**
 <p>Describes a rule.</p>
 */
@interface AWSIoTTopicRule : AWSModel


/**
 <p>The actions associated with the rule.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTAction *> * _Nullable actions;

/**
 <p>The version of the SQL rules engine to use when evaluating the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsIotSqlVersion;

/**
 <p>The date and time the rule was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The description of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The action to perform when an error occurs.</p>
 */
@property (nonatomic, strong) AWSIoTAction * _Nullable errorAction;

/**
 <p>Specifies whether the rule is disabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ruleDisabled;

/**
 <p>The name of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

/**
 <p>The SQL statement used to query the topic. When using a SQL query with multiple lines, be sure to escape the newline characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sql;

@end

/**
 <p>Describes a rule.</p>
 */
@interface AWSIoTTopicRuleListItem : AWSModel


/**
 <p>The date and time the rule was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The rule ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleArn;

/**
 <p>Specifies whether the rule is disabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ruleDisabled;

/**
 <p>The name of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

/**
 <p>The pattern for the topic names that apply.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicPattern;

@end

/**
 <p>Describes a rule.</p>
 Required parameters: [sql, actions]
 */
@interface AWSIoTTopicRulePayload : AWSModel


/**
 <p>The actions associated with the rule.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTAction *> * _Nullable actions;

/**
 <p>The version of the SQL rules engine to use when evaluating the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsIotSqlVersion;

/**
 <p>The description of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The action to take when an error occurs.</p>
 */
@property (nonatomic, strong) AWSIoTAction * _Nullable errorAction;

/**
 <p>Specifies whether the rule is disabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ruleDisabled;

/**
 <p>The SQL statement used to query the topic. For more information, see <a href="http://docs.aws.amazon.com/iot/latest/developerguide/iot-rules.html#aws-iot-sql-reference">AWS IoT SQL Reference</a> in the <i>AWS IoT Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sql;

@end

/**
 <p>The input for the TransferCertificate operation.</p>
 Required parameters: [certificateId, targetAwsAccount]
 */
@interface AWSIoTTransferCertificateRequest : AWSRequest


/**
 <p>The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetAwsAccount;

/**
 <p>The transfer message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transferMessage;

@end

/**
 <p>The output from the TransferCertificate operation.</p>
 */
@interface AWSIoTTransferCertificateResponse : AWSModel


/**
 <p>The ARN of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transferredCertificateArn;

@end

/**
 <p>Data used to transfer a certificate to an AWS account.</p>
 */
@interface AWSIoTTransferData : AWSModel


/**
 <p>The date the transfer was accepted.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable acceptDate;

/**
 <p>The date the transfer was rejected.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable rejectDate;

/**
 <p>The reason why the transfer was rejected.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rejectReason;

/**
 <p>The date the transfer took place.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable transferDate;

/**
 <p>The transfer message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transferMessage;

@end

/**
 
 */
@interface AWSIoTUpdateAuthorizerRequest : AWSRequest


/**
 <p>The ARN of the authorizer's Lambda function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerFunctionArn;

/**
 <p>The authorizer name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerName;

/**
 <p>The status of the update authorizer request.</p>
 */
@property (nonatomic, assign) AWSIoTAuthorizerStatus status;

/**
 <p>The key used to extract the token from the HTTP headers. </p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenKeyName;

/**
 <p>The public keys used to verify the token signature.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tokenSigningPublicKeys;

@end

/**
 
 */
@interface AWSIoTUpdateAuthorizerResponse : AWSModel


/**
 <p>The authorizer ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerArn;

/**
 <p>The authorizer name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerName;

@end

/**
 <p>The input to the UpdateCACertificate operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTUpdateCACertificateRequest : AWSRequest


/**
 <p>The CA certificate identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The new value for the auto registration status. Valid values are: "ENABLE" or "DISABLE".</p>
 */
@property (nonatomic, assign) AWSIoTAutoRegistrationStatus latestAutoRegistrationStatus;

/**
 <p>The updated status of the CA certificate.</p><p><b>Note:</b> The status value REGISTER_INACTIVE is deprecated and should not be used.</p>
 */
@property (nonatomic, assign) AWSIoTCACertificateStatus latestStatus;

/**
 <p>Information about the registration configuration.</p>
 */
@property (nonatomic, strong) AWSIoTRegistrationConfig * _Nullable registrationConfig;

/**
 <p>If true, remove auto registration.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable removeAutoRegistration;

@end

/**
 <p>The input for the UpdateCertificate operation.</p>
 Required parameters: [certificateId, newStatus]
 */
@interface AWSIoTUpdateCertificateRequest : AWSRequest


/**
 <p>The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The new status.</p><p><b>Note:</b> Setting the status to PENDING_TRANSFER will result in an exception being thrown. PENDING_TRANSFER is a status used internally by AWS IoT. It is not intended for developer use.</p><p><b>Note:</b> The status value REGISTER_INACTIVE is deprecated and should not be used.</p>
 */
@property (nonatomic, assign) AWSIoTCertificateStatus latestStatus;

@end

/**
 
 */
@interface AWSIoTUpdateEventConfigurationsRequest : AWSRequest


/**
 <p>The new event configuration values.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSIoTConfiguration *> * _Nullable eventConfigurations;

@end

/**
 
 */
@interface AWSIoTUpdateEventConfigurationsResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTUpdateIndexingConfigurationRequest : AWSRequest


/**
 <p>Thing indexing configuration.</p>
 */
@property (nonatomic, strong) AWSIoTThingIndexingConfiguration * _Nullable thingIndexingConfiguration;

@end

/**
 
 */
@interface AWSIoTUpdateIndexingConfigurationResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTUpdateRoleAliasRequest : AWSRequest


/**
 <p>The number of seconds the credential will be valid.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable credentialDurationSeconds;

/**
 <p>The role alias to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleAlias;

/**
 <p>The role ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSIoTUpdateRoleAliasResponse : AWSModel


/**
 <p>The role alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleAlias;

/**
 <p>The role alias ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleAliasArn;

@end

/**
 
 */
@interface AWSIoTUpdateStreamRequest : AWSRequest


/**
 <p>The description of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The files associated with the stream.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTStreamFile *> * _Nullable files;

/**
 <p>An IAM role that allows the IoT service principal assumes to access your S3 files.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The stream ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamId;

@end

/**
 
 */
@interface AWSIoTUpdateStreamResponse : AWSModel


/**
 <p>A description of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The stream ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamArn;

/**
 <p>The stream ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamId;

/**
 <p>The stream version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable streamVersion;

@end

/**
 
 */
@interface AWSIoTUpdateThingGroupRequest : AWSRequest


/**
 <p>The expected version of the thing group. If this does not match the version of the thing group being updated, the update will fail.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expectedVersion;

/**
 <p>The thing group to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

/**
 <p>The thing group properties.</p>
 */
@property (nonatomic, strong) AWSIoTThingGroupProperties * _Nullable thingGroupProperties;

@end

/**
 
 */
@interface AWSIoTUpdateThingGroupResponse : AWSModel


/**
 <p>The version of the updated thing group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 
 */
@interface AWSIoTUpdateThingGroupsForThingRequest : AWSRequest


/**
 <p>The groups to which the thing will be added.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable thingGroupsToAdd;

/**
 <p>The groups from which the thing will be removed.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable thingGroupsToRemove;

/**
 <p>The thing whose group memberships will be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 
 */
@interface AWSIoTUpdateThingGroupsForThingResponse : AWSModel


@end

/**
 <p>The input for the UpdateThing operation.</p>
 Required parameters: [thingName]
 */
@interface AWSIoTUpdateThingRequest : AWSRequest


/**
 <p>A list of thing attributes, a JSON string containing name-value pairs. For example:</p><p><code>{\"attributes\":{\"name1\":\"value2\"}}</code></p><p>This data is used to add new attributes or update existing attributes.</p>
 */
@property (nonatomic, strong) AWSIoTAttributePayload * _Nullable attributePayload;

/**
 <p>The expected version of the thing record in the registry. If the version of the record in the registry does not match the expected version specified in the request, the <code>UpdateThing</code> request is rejected with a <code>VersionConflictException</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expectedVersion;

/**
 <p>Remove a thing type association. If <b>true</b>, the association is removed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable removeThingType;

/**
 <p>The name of the thing to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

/**
 <p>The name of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

@end

/**
 <p>The output from the UpdateThing operation.</p>
 */
@interface AWSIoTUpdateThingResponse : AWSModel


@end

NS_ASSUME_NONNULL_END
