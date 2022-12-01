//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <XCTest/XCTest.h>
#import <AWSNSSecureCodingTestBase/AWSNSSecureCodingTestBase.h>
#import "AWSIoTModel.h"

@interface AWSIoTNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSIoTAbortConfig API_AVAILABLE(ios(11));
- (void) test_AWSIoTAbortCriteria API_AVAILABLE(ios(11));
- (void) test_AWSIoTAcceptCertificateTransferRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTAction API_AVAILABLE(ios(11));
- (void) test_AWSIoTActiveViolation API_AVAILABLE(ios(11));
- (void) test_AWSIoTAddThingToBillingGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTAddThingToBillingGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTAddThingToThingGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTAddThingToThingGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTAddThingsToThingGroupParams API_AVAILABLE(ios(11));
- (void) test_AWSIoTAggregationType API_AVAILABLE(ios(11));
- (void) test_AWSIoTAlertTarget API_AVAILABLE(ios(11));
- (void) test_AWSIoTAllowed API_AVAILABLE(ios(11));
- (void) test_AWSIoTAssetPropertyTimestamp API_AVAILABLE(ios(11));
- (void) test_AWSIoTAssetPropertyValue API_AVAILABLE(ios(11));
- (void) test_AWSIoTAssetPropertyVariant API_AVAILABLE(ios(11));
- (void) test_AWSIoTAssociateTargetsWithJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTAssociateTargetsWithJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTAttachPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTAttachPrincipalPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTAttachSecurityProfileRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTAttachSecurityProfileResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTAttachThingPrincipalRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTAttachThingPrincipalResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTAttributePayload API_AVAILABLE(ios(11));
- (void) test_AWSIoTAuditCheckConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSIoTAuditCheckDetails API_AVAILABLE(ios(11));
- (void) test_AWSIoTAuditFinding API_AVAILABLE(ios(11));
- (void) test_AWSIoTAuditMitigationActionExecutionMetadata API_AVAILABLE(ios(11));
- (void) test_AWSIoTAuditMitigationActionsTaskMetadata API_AVAILABLE(ios(11));
- (void) test_AWSIoTAuditMitigationActionsTaskTarget API_AVAILABLE(ios(11));
- (void) test_AWSIoTAuditNotificationTarget API_AVAILABLE(ios(11));
- (void) test_AWSIoTAuditSuppression API_AVAILABLE(ios(11));
- (void) test_AWSIoTAuditTaskMetadata API_AVAILABLE(ios(11));
- (void) test_AWSIoTAuthInfo API_AVAILABLE(ios(11));
- (void) test_AWSIoTAuthResult API_AVAILABLE(ios(11));
- (void) test_AWSIoTAuthorizerConfig API_AVAILABLE(ios(11));
- (void) test_AWSIoTAuthorizerDescription API_AVAILABLE(ios(11));
- (void) test_AWSIoTAuthorizerSummary API_AVAILABLE(ios(11));
- (void) test_AWSIoTAwsJobAbortConfig API_AVAILABLE(ios(11));
- (void) test_AWSIoTAwsJobAbortCriteria API_AVAILABLE(ios(11));
- (void) test_AWSIoTAwsJobExecutionsRolloutConfig API_AVAILABLE(ios(11));
- (void) test_AWSIoTAwsJobExponentialRolloutRate API_AVAILABLE(ios(11));
- (void) test_AWSIoTAwsJobPresignedUrlConfig API_AVAILABLE(ios(11));
- (void) test_AWSIoTAwsJobRateIncreaseCriteria API_AVAILABLE(ios(11));
- (void) test_AWSIoTAwsJobTimeoutConfig API_AVAILABLE(ios(11));
- (void) test_AWSIoTBehavior API_AVAILABLE(ios(11));
- (void) test_AWSIoTBehaviorCriteria API_AVAILABLE(ios(11));
- (void) test_AWSIoTBehaviorModelTrainingSummary API_AVAILABLE(ios(11));
- (void) test_AWSIoTBillingGroupMetadata API_AVAILABLE(ios(11));
- (void) test_AWSIoTBillingGroupProperties API_AVAILABLE(ios(11));
- (void) test_AWSIoTBucket API_AVAILABLE(ios(11));
- (void) test_AWSIoTBucketsAggregationType API_AVAILABLE(ios(11));
- (void) test_AWSIoTCACertificate API_AVAILABLE(ios(11));
- (void) test_AWSIoTCACertificateDescription API_AVAILABLE(ios(11));
- (void) test_AWSIoTCancelAuditMitigationActionsTaskRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCancelAuditMitigationActionsTaskResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCancelAuditTaskRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCancelAuditTaskResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCancelCertificateTransferRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCancelDetectMitigationActionsTaskRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCancelDetectMitigationActionsTaskResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCancelJobExecutionRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCancelJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCancelJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCertificate API_AVAILABLE(ios(11));
- (void) test_AWSIoTCertificateDescription API_AVAILABLE(ios(11));
- (void) test_AWSIoTCertificateValidity API_AVAILABLE(ios(11));
- (void) test_AWSIoTClearDefaultAuthorizerRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTClearDefaultAuthorizerResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCloudwatchAlarmAction API_AVAILABLE(ios(11));
- (void) test_AWSIoTCloudwatchLogsAction API_AVAILABLE(ios(11));
- (void) test_AWSIoTCloudwatchMetricAction API_AVAILABLE(ios(11));
- (void) test_AWSIoTCodeSigning API_AVAILABLE(ios(11));
- (void) test_AWSIoTCodeSigningCertificateChain API_AVAILABLE(ios(11));
- (void) test_AWSIoTCodeSigningSignature API_AVAILABLE(ios(11));
- (void) test_AWSIoTConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSIoTConfirmTopicRuleDestinationRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTConfirmTopicRuleDestinationResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateAuditSuppressionRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateAuditSuppressionResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateAuthorizerRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateAuthorizerResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateBillingGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateBillingGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateCertificateFromCsrRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateCertificateFromCsrResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateCustomMetricRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateCustomMetricResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateDimensionRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateDimensionResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateDomainConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateDomainConfigurationResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateDynamicThingGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateDynamicThingGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateFleetMetricRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateFleetMetricResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateJobTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateJobTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateKeysAndCertificateRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateKeysAndCertificateResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateMitigationActionRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateMitigationActionResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateOTAUpdateRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateOTAUpdateResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreatePolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreatePolicyResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreatePolicyVersionRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreatePolicyVersionResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateProvisioningClaimRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateProvisioningClaimResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateProvisioningTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateProvisioningTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateProvisioningTemplateVersionRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateProvisioningTemplateVersionResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateRoleAliasRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateRoleAliasResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateScheduledAuditRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateScheduledAuditResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateSecurityProfileRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateSecurityProfileResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateStreamRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateStreamResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateThingGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateThingGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateThingRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateThingResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateThingTypeRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateThingTypeResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateTopicRuleDestinationRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateTopicRuleDestinationResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTCreateTopicRuleRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTCustomCodeSigning API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteAccountAuditConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteAccountAuditConfigurationResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteAuditSuppressionRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteAuditSuppressionResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteAuthorizerRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteAuthorizerResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteBillingGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteBillingGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteCACertificateRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteCACertificateResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteCertificateRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteCustomMetricRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteCustomMetricResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteDimensionRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteDimensionResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteDomainConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteDomainConfigurationResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteDynamicThingGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteDynamicThingGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteFleetMetricRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteJobExecutionRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteJobTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteMitigationActionRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteMitigationActionResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteOTAUpdateRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteOTAUpdateResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeletePolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeletePolicyVersionRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteProvisioningTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteProvisioningTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteProvisioningTemplateVersionRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteProvisioningTemplateVersionResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteRegistrationCodeRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteRegistrationCodeResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteRoleAliasRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteRoleAliasResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteScheduledAuditRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteScheduledAuditResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteSecurityProfileRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteSecurityProfileResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteStreamRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteStreamResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteThingGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteThingGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteThingRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteThingResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteThingTypeRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteThingTypeResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteTopicRuleDestinationRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteTopicRuleDestinationResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteTopicRuleRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeleteV2LoggingLevelRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDenied API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeprecateThingTypeRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDeprecateThingTypeResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeAccountAuditConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeAccountAuditConfigurationResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeAuditFindingRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeAuditFindingResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeAuditMitigationActionsTaskRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeAuditMitigationActionsTaskResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeAuditSuppressionRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeAuditSuppressionResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeAuditTaskRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeAuditTaskResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeAuthorizerRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeAuthorizerResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeBillingGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeBillingGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeCACertificateRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeCACertificateResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeCertificateRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeCertificateResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeCustomMetricRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeCustomMetricResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeDefaultAuthorizerRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeDefaultAuthorizerResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeDetectMitigationActionsTaskRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeDetectMitigationActionsTaskResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeDimensionRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeDimensionResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeDomainConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeDomainConfigurationResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeEndpointRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeEndpointResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeEventConfigurationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeEventConfigurationsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeFleetMetricRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeFleetMetricResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeIndexRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeIndexResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeJobExecutionRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeJobExecutionResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeJobTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeJobTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeManagedJobTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeManagedJobTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeMitigationActionRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeMitigationActionResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeProvisioningTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeProvisioningTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeProvisioningTemplateVersionRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeProvisioningTemplateVersionResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeRoleAliasRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeRoleAliasResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeScheduledAuditRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeScheduledAuditResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeSecurityProfileRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeSecurityProfileResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeStreamRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeStreamResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeThingGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeThingGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeThingRegistrationTaskRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeThingRegistrationTaskResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeThingRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeThingResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeThingTypeRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDescribeThingTypeResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDestination API_AVAILABLE(ios(11));
- (void) test_AWSIoTDetachPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDetachPrincipalPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDetachSecurityProfileRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDetachSecurityProfileResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDetachThingPrincipalRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDetachThingPrincipalResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDetectMitigationActionExecution API_AVAILABLE(ios(11));
- (void) test_AWSIoTDetectMitigationActionsTaskStatistics API_AVAILABLE(ios(11));
- (void) test_AWSIoTDetectMitigationActionsTaskSummary API_AVAILABLE(ios(11));
- (void) test_AWSIoTDetectMitigationActionsTaskTarget API_AVAILABLE(ios(11));
- (void) test_AWSIoTDisableTopicRuleRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDocumentParameter API_AVAILABLE(ios(11));
- (void) test_AWSIoTDomainConfigurationSummary API_AVAILABLE(ios(11));
- (void) test_AWSIoTDynamoDBAction API_AVAILABLE(ios(11));
- (void) test_AWSIoTDynamoDBv2Action API_AVAILABLE(ios(11));
- (void) test_AWSIoTEffectivePolicy API_AVAILABLE(ios(11));
- (void) test_AWSIoTElasticsearchAction API_AVAILABLE(ios(11));
- (void) test_AWSIoTEnableIoTLoggingParams API_AVAILABLE(ios(11));
- (void) test_AWSIoTEnableTopicRuleRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTErrorInfo API_AVAILABLE(ios(11));
- (void) test_AWSIoTExplicitDeny API_AVAILABLE(ios(11));
- (void) test_AWSIoTExponentialRolloutRate API_AVAILABLE(ios(11));
- (void) test_AWSIoTField API_AVAILABLE(ios(11));
- (void) test_AWSIoTFileLocation API_AVAILABLE(ios(11));
- (void) test_AWSIoTFirehoseAction API_AVAILABLE(ios(11));
- (void) test_AWSIoTFleetMetricNameAndArn API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetBehaviorModelTrainingSummariesRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetBehaviorModelTrainingSummariesResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetBucketsAggregationRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetBucketsAggregationResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetCardinalityRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetCardinalityResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetEffectivePoliciesRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetEffectivePoliciesResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetIndexingConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetIndexingConfigurationResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetJobDocumentRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetJobDocumentResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetLoggingOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetLoggingOptionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetOTAUpdateRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetOTAUpdateResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetPercentilesRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetPercentilesResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetPolicyResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetPolicyVersionRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetPolicyVersionResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetRegistrationCodeRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetRegistrationCodeResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetStatisticsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetStatisticsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetTopicRuleDestinationRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetTopicRuleDestinationResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetTopicRuleRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetTopicRuleResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetV2LoggingOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTGetV2LoggingOptionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTGroupNameAndArn API_AVAILABLE(ios(11));
- (void) test_AWSIoTHttpAction API_AVAILABLE(ios(11));
- (void) test_AWSIoTHttpActionHeader API_AVAILABLE(ios(11));
- (void) test_AWSIoTHttpAuthorization API_AVAILABLE(ios(11));
- (void) test_AWSIoTHttpContext API_AVAILABLE(ios(11));
- (void) test_AWSIoTHttpUrlDestinationConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSIoTHttpUrlDestinationProperties API_AVAILABLE(ios(11));
- (void) test_AWSIoTHttpUrlDestinationSummary API_AVAILABLE(ios(11));
- (void) test_AWSIoTImplicitDeny API_AVAILABLE(ios(11));
- (void) test_AWSIoTIndexingFilter API_AVAILABLE(ios(11));
- (void) test_AWSIoTIotAnalyticsAction API_AVAILABLE(ios(11));
- (void) test_AWSIoTIotEventsAction API_AVAILABLE(ios(11));
- (void) test_AWSIoTIotSiteWiseAction API_AVAILABLE(ios(11));
- (void) test_AWSIoTIssuerCertificateIdentifier API_AVAILABLE(ios(11));
- (void) test_AWSIoTJob API_AVAILABLE(ios(11));
- (void) test_AWSIoTJobExecution API_AVAILABLE(ios(11));
- (void) test_AWSIoTJobExecutionStatusDetails API_AVAILABLE(ios(11));
- (void) test_AWSIoTJobExecutionSummary API_AVAILABLE(ios(11));
- (void) test_AWSIoTJobExecutionSummaryForJob API_AVAILABLE(ios(11));
- (void) test_AWSIoTJobExecutionSummaryForThing API_AVAILABLE(ios(11));
- (void) test_AWSIoTJobExecutionsRetryConfig API_AVAILABLE(ios(11));
- (void) test_AWSIoTJobExecutionsRolloutConfig API_AVAILABLE(ios(11));
- (void) test_AWSIoTJobProcessDetails API_AVAILABLE(ios(11));
- (void) test_AWSIoTJobSummary API_AVAILABLE(ios(11));
- (void) test_AWSIoTJobTemplateSummary API_AVAILABLE(ios(11));
- (void) test_AWSIoTKafkaAction API_AVAILABLE(ios(11));
- (void) test_AWSIoTKeyPair API_AVAILABLE(ios(11));
- (void) test_AWSIoTKinesisAction API_AVAILABLE(ios(11));
- (void) test_AWSIoTLambdaAction API_AVAILABLE(ios(11));
- (void) test_AWSIoTListActiveViolationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListActiveViolationsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListAttachedPoliciesRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListAttachedPoliciesResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListAuditFindingsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListAuditFindingsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListAuditMitigationActionsExecutionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListAuditMitigationActionsExecutionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListAuditMitigationActionsTasksRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListAuditMitigationActionsTasksResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListAuditSuppressionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListAuditSuppressionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListAuditTasksRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListAuditTasksResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListAuthorizersRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListAuthorizersResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListBillingGroupsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListBillingGroupsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListCACertificatesRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListCACertificatesResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListCertificatesByCARequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListCertificatesByCAResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListCertificatesRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListCertificatesResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListCustomMetricsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListCustomMetricsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListDetectMitigationActionsExecutionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListDetectMitigationActionsExecutionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListDetectMitigationActionsTasksRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListDetectMitigationActionsTasksResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListDimensionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListDimensionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListDomainConfigurationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListDomainConfigurationsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListFleetMetricsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListFleetMetricsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListIndicesRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListIndicesResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListJobExecutionsForJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListJobExecutionsForJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListJobExecutionsForThingRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListJobExecutionsForThingResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListJobTemplatesRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListJobTemplatesResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListJobsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListJobsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListManagedJobTemplatesRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListManagedJobTemplatesResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListMetricValuesRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListMetricValuesResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListMitigationActionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListMitigationActionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListOTAUpdatesRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListOTAUpdatesResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListOutgoingCertificatesRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListOutgoingCertificatesResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListPoliciesRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListPoliciesResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListPolicyPrincipalsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListPolicyPrincipalsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListPolicyVersionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListPolicyVersionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListPrincipalPoliciesRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListPrincipalPoliciesResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListPrincipalThingsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListPrincipalThingsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListProvisioningTemplateVersionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListProvisioningTemplateVersionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListProvisioningTemplatesRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListProvisioningTemplatesResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListRelatedResourcesForAuditFindingRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListRelatedResourcesForAuditFindingResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListRoleAliasesRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListRoleAliasesResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListScheduledAuditsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListScheduledAuditsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListSecurityProfilesForTargetRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListSecurityProfilesForTargetResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListSecurityProfilesRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListSecurityProfilesResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListStreamsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListStreamsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListTagsForResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListTagsForResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListTargetsForPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListTargetsForPolicyResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListTargetsForSecurityProfileRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListTargetsForSecurityProfileResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListThingGroupsForThingRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListThingGroupsForThingResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListThingGroupsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListThingGroupsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListThingPrincipalsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListThingPrincipalsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListThingRegistrationTaskReportsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListThingRegistrationTaskReportsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListThingRegistrationTasksRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListThingRegistrationTasksResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListThingTypesRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListThingTypesResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListThingsInBillingGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListThingsInBillingGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListThingsInThingGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListThingsInThingGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListThingsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListThingsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListTopicRuleDestinationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListTopicRuleDestinationsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListTopicRulesRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListTopicRulesResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListV2LoggingLevelsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListV2LoggingLevelsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTListViolationEventsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTListViolationEventsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTLocationAction API_AVAILABLE(ios(11));
- (void) test_AWSIoTLocationTimestamp API_AVAILABLE(ios(11));
- (void) test_AWSIoTLogTarget API_AVAILABLE(ios(11));
- (void) test_AWSIoTLogTargetConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSIoTLoggingOptionsPayload API_AVAILABLE(ios(11));
- (void) test_AWSIoTMachineLearningDetectionConfig API_AVAILABLE(ios(11));
- (void) test_AWSIoTManagedJobTemplateSummary API_AVAILABLE(ios(11));
- (void) test_AWSIoTMetricDatum API_AVAILABLE(ios(11));
- (void) test_AWSIoTMetricDimension API_AVAILABLE(ios(11));
- (void) test_AWSIoTMetricToRetain API_AVAILABLE(ios(11));
- (void) test_AWSIoTMetricValue API_AVAILABLE(ios(11));
- (void) test_AWSIoTMitigationAction API_AVAILABLE(ios(11));
- (void) test_AWSIoTMitigationActionIdentifier API_AVAILABLE(ios(11));
- (void) test_AWSIoTMitigationActionParams API_AVAILABLE(ios(11));
- (void) test_AWSIoTMqttContext API_AVAILABLE(ios(11));
- (void) test_AWSIoTMqttHeaders API_AVAILABLE(ios(11));
- (void) test_AWSIoTNonCompliantResource API_AVAILABLE(ios(11));
- (void) test_AWSIoTOTAUpdateFile API_AVAILABLE(ios(11));
- (void) test_AWSIoTOTAUpdateInfo API_AVAILABLE(ios(11));
- (void) test_AWSIoTOTAUpdateSummary API_AVAILABLE(ios(11));
- (void) test_AWSIoTOpenSearchAction API_AVAILABLE(ios(11));
- (void) test_AWSIoTOutgoingCertificate API_AVAILABLE(ios(11));
- (void) test_AWSIoTPercentPair API_AVAILABLE(ios(11));
- (void) test_AWSIoTPolicy API_AVAILABLE(ios(11));
- (void) test_AWSIoTPolicyVersion API_AVAILABLE(ios(11));
- (void) test_AWSIoTPolicyVersionIdentifier API_AVAILABLE(ios(11));
- (void) test_AWSIoTPresignedUrlConfig API_AVAILABLE(ios(11));
- (void) test_AWSIoTProvisioningHook API_AVAILABLE(ios(11));
- (void) test_AWSIoTProvisioningTemplateSummary API_AVAILABLE(ios(11));
- (void) test_AWSIoTProvisioningTemplateVersionSummary API_AVAILABLE(ios(11));
- (void) test_AWSIoTPublishFindingToSnsParams API_AVAILABLE(ios(11));
- (void) test_AWSIoTPutAssetPropertyValueEntry API_AVAILABLE(ios(11));
- (void) test_AWSIoTPutItemInput API_AVAILABLE(ios(11));
- (void) test_AWSIoTPutVerificationStateOnViolationRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTPutVerificationStateOnViolationResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTRateIncreaseCriteria API_AVAILABLE(ios(11));
- (void) test_AWSIoTRegisterCACertificateRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTRegisterCACertificateResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTRegisterCertificateRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTRegisterCertificateResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTRegisterCertificateWithoutCARequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTRegisterCertificateWithoutCAResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTRegisterThingRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTRegisterThingResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTRegistrationConfig API_AVAILABLE(ios(11));
- (void) test_AWSIoTRejectCertificateTransferRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTRelatedResource API_AVAILABLE(ios(11));
- (void) test_AWSIoTRemoveThingFromBillingGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTRemoveThingFromBillingGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTRemoveThingFromThingGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTRemoveThingFromThingGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTReplaceDefaultPolicyVersionParams API_AVAILABLE(ios(11));
- (void) test_AWSIoTReplaceTopicRuleRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTRepublishAction API_AVAILABLE(ios(11));
- (void) test_AWSIoTResourceIdentifier API_AVAILABLE(ios(11));
- (void) test_AWSIoTRetryCriteria API_AVAILABLE(ios(11));
- (void) test_AWSIoTRoleAliasDescription API_AVAILABLE(ios(11));
- (void) test_AWSIoTS3Action API_AVAILABLE(ios(11));
- (void) test_AWSIoTS3Destination API_AVAILABLE(ios(11));
- (void) test_AWSIoTS3Location API_AVAILABLE(ios(11));
- (void) test_AWSIoTSalesforceAction API_AVAILABLE(ios(11));
- (void) test_AWSIoTScheduledAuditMetadata API_AVAILABLE(ios(11));
- (void) test_AWSIoTSchedulingConfig API_AVAILABLE(ios(11));
- (void) test_AWSIoTSearchIndexRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTSearchIndexResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTSecurityProfileIdentifier API_AVAILABLE(ios(11));
- (void) test_AWSIoTSecurityProfileTarget API_AVAILABLE(ios(11));
- (void) test_AWSIoTSecurityProfileTargetMapping API_AVAILABLE(ios(11));
- (void) test_AWSIoTServerCertificateSummary API_AVAILABLE(ios(11));
- (void) test_AWSIoTSetDefaultAuthorizerRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTSetDefaultAuthorizerResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTSetDefaultPolicyVersionRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTSetLoggingOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTSetV2LoggingLevelRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTSetV2LoggingOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTSigV4Authorization API_AVAILABLE(ios(11));
- (void) test_AWSIoTSigningProfileParameter API_AVAILABLE(ios(11));
- (void) test_AWSIoTSnsAction API_AVAILABLE(ios(11));
- (void) test_AWSIoTSqsAction API_AVAILABLE(ios(11));
- (void) test_AWSIoTStartAuditMitigationActionsTaskRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTStartAuditMitigationActionsTaskResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTStartDetectMitigationActionsTaskRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTStartDetectMitigationActionsTaskResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTStartOnDemandAuditTaskRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTStartOnDemandAuditTaskResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTStartSigningJobParameter API_AVAILABLE(ios(11));
- (void) test_AWSIoTStartThingRegistrationTaskRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTStartThingRegistrationTaskResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTStatisticalThreshold API_AVAILABLE(ios(11));
- (void) test_AWSIoTStatistics API_AVAILABLE(ios(11));
- (void) test_AWSIoTStepFunctionsAction API_AVAILABLE(ios(11));
- (void) test_AWSIoTStopThingRegistrationTaskRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTStopThingRegistrationTaskResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTStream API_AVAILABLE(ios(11));
- (void) test_AWSIoTStreamFile API_AVAILABLE(ios(11));
- (void) test_AWSIoTStreamInfo API_AVAILABLE(ios(11));
- (void) test_AWSIoTStreamSummary API_AVAILABLE(ios(11));
- (void) test_AWSIoTTag API_AVAILABLE(ios(11));
- (void) test_AWSIoTTagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTTagResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTTaskStatistics API_AVAILABLE(ios(11));
- (void) test_AWSIoTTaskStatisticsForAuditCheck API_AVAILABLE(ios(11));
- (void) test_AWSIoTTermsAggregation API_AVAILABLE(ios(11));
- (void) test_AWSIoTTestAuthorizationRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTTestAuthorizationResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTTestInvokeAuthorizerRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTTestInvokeAuthorizerResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTThingAttribute API_AVAILABLE(ios(11));
- (void) test_AWSIoTThingConnectivity API_AVAILABLE(ios(11));
- (void) test_AWSIoTThingDocument API_AVAILABLE(ios(11));
- (void) test_AWSIoTThingGroupDocument API_AVAILABLE(ios(11));
- (void) test_AWSIoTThingGroupIndexingConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSIoTThingGroupMetadata API_AVAILABLE(ios(11));
- (void) test_AWSIoTThingGroupProperties API_AVAILABLE(ios(11));
- (void) test_AWSIoTThingIndexingConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSIoTThingTypeDefinition API_AVAILABLE(ios(11));
- (void) test_AWSIoTThingTypeMetadata API_AVAILABLE(ios(11));
- (void) test_AWSIoTThingTypeProperties API_AVAILABLE(ios(11));
- (void) test_AWSIoTTimeoutConfig API_AVAILABLE(ios(11));
- (void) test_AWSIoTTimestreamAction API_AVAILABLE(ios(11));
- (void) test_AWSIoTTimestreamDimension API_AVAILABLE(ios(11));
- (void) test_AWSIoTTimestreamTimestamp API_AVAILABLE(ios(11));
- (void) test_AWSIoTTlsContext API_AVAILABLE(ios(11));
- (void) test_AWSIoTTopicRule API_AVAILABLE(ios(11));
- (void) test_AWSIoTTopicRuleDestination API_AVAILABLE(ios(11));
- (void) test_AWSIoTTopicRuleDestinationConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSIoTTopicRuleDestinationSummary API_AVAILABLE(ios(11));
- (void) test_AWSIoTTopicRuleListItem API_AVAILABLE(ios(11));
- (void) test_AWSIoTTopicRulePayload API_AVAILABLE(ios(11));
- (void) test_AWSIoTTransferCertificateRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTTransferCertificateResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTTransferData API_AVAILABLE(ios(11));
- (void) test_AWSIoTUntagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUntagResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateAccountAuditConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateAccountAuditConfigurationResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateAuditSuppressionRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateAuditSuppressionResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateAuthorizerRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateAuthorizerResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateBillingGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateBillingGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateCACertificateParams API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateCACertificateRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateCertificateRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateCustomMetricRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateCustomMetricResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateDeviceCertificateParams API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateDimensionRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateDimensionResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateDomainConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateDomainConfigurationResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateDynamicThingGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateDynamicThingGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateEventConfigurationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateEventConfigurationsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateFleetMetricRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateIndexingConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateIndexingConfigurationResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateMitigationActionRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateMitigationActionResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateProvisioningTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateProvisioningTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateRoleAliasRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateRoleAliasResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateScheduledAuditRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateScheduledAuditResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateSecurityProfileRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateSecurityProfileResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateStreamRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateStreamResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateThingGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateThingGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateThingGroupsForThingRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateThingGroupsForThingResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateThingRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateThingResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateTopicRuleDestinationRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTUpdateTopicRuleDestinationResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTUserProperty API_AVAILABLE(ios(11));
- (void) test_AWSIoTValidateSecurityProfileBehaviorsRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTValidateSecurityProfileBehaviorsResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTValidationError API_AVAILABLE(ios(11));
- (void) test_AWSIoTViolationEvent API_AVAILABLE(ios(11));
- (void) test_AWSIoTViolationEventAdditionalInfo API_AVAILABLE(ios(11));
- (void) test_AWSIoTViolationEventOccurrenceRange API_AVAILABLE(ios(11));
- (void) test_AWSIoTVpcDestinationConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSIoTVpcDestinationProperties API_AVAILABLE(ios(11));
- (void) test_AWSIoTVpcDestinationSummary API_AVAILABLE(ios(11));

@end

@implementation AWSIoTNSSecureCodingTests

- (void) test_AWSIoTAbortConfig {
    [self validateSecureCodingForClass:[AWSIoTAbortConfig class]];
}

- (void) test_AWSIoTAbortCriteria {
    [self validateSecureCodingForClass:[AWSIoTAbortCriteria class]];
}

- (void) test_AWSIoTAcceptCertificateTransferRequest {
    [self validateSecureCodingForClass:[AWSIoTAcceptCertificateTransferRequest class]];
}

- (void) test_AWSIoTAction {
    [self validateSecureCodingForClass:[AWSIoTAction class]];
}

- (void) test_AWSIoTActiveViolation {
    [self validateSecureCodingForClass:[AWSIoTActiveViolation class]];
}

- (void) test_AWSIoTAddThingToBillingGroupRequest {
    [self validateSecureCodingForClass:[AWSIoTAddThingToBillingGroupRequest class]];
}

- (void) test_AWSIoTAddThingToBillingGroupResponse {
    [self validateSecureCodingForClass:[AWSIoTAddThingToBillingGroupResponse class]];
}

- (void) test_AWSIoTAddThingToThingGroupRequest {
    [self validateSecureCodingForClass:[AWSIoTAddThingToThingGroupRequest class]];
}

- (void) test_AWSIoTAddThingToThingGroupResponse {
    [self validateSecureCodingForClass:[AWSIoTAddThingToThingGroupResponse class]];
}

- (void) test_AWSIoTAddThingsToThingGroupParams {
    [self validateSecureCodingForClass:[AWSIoTAddThingsToThingGroupParams class]];
}

- (void) test_AWSIoTAggregationType {
    [self validateSecureCodingForClass:[AWSIoTAggregationType class]];
}

- (void) test_AWSIoTAlertTarget {
    [self validateSecureCodingForClass:[AWSIoTAlertTarget class]];
}

- (void) test_AWSIoTAllowed {
    [self validateSecureCodingForClass:[AWSIoTAllowed class]];
}

- (void) test_AWSIoTAssetPropertyTimestamp {
    [self validateSecureCodingForClass:[AWSIoTAssetPropertyTimestamp class]];
}

- (void) test_AWSIoTAssetPropertyValue {
    [self validateSecureCodingForClass:[AWSIoTAssetPropertyValue class]];
}

- (void) test_AWSIoTAssetPropertyVariant {
    [self validateSecureCodingForClass:[AWSIoTAssetPropertyVariant class]];
}

- (void) test_AWSIoTAssociateTargetsWithJobRequest {
    [self validateSecureCodingForClass:[AWSIoTAssociateTargetsWithJobRequest class]];
}

- (void) test_AWSIoTAssociateTargetsWithJobResponse {
    [self validateSecureCodingForClass:[AWSIoTAssociateTargetsWithJobResponse class]];
}

- (void) test_AWSIoTAttachPolicyRequest {
    [self validateSecureCodingForClass:[AWSIoTAttachPolicyRequest class]];
}

- (void) test_AWSIoTAttachPrincipalPolicyRequest {
    [self validateSecureCodingForClass:[AWSIoTAttachPrincipalPolicyRequest class]];
}

- (void) test_AWSIoTAttachSecurityProfileRequest {
    [self validateSecureCodingForClass:[AWSIoTAttachSecurityProfileRequest class]];
}

- (void) test_AWSIoTAttachSecurityProfileResponse {
    [self validateSecureCodingForClass:[AWSIoTAttachSecurityProfileResponse class]];
}

- (void) test_AWSIoTAttachThingPrincipalRequest {
    [self validateSecureCodingForClass:[AWSIoTAttachThingPrincipalRequest class]];
}

- (void) test_AWSIoTAttachThingPrincipalResponse {
    [self validateSecureCodingForClass:[AWSIoTAttachThingPrincipalResponse class]];
}

- (void) test_AWSIoTAttributePayload {
    [self validateSecureCodingForClass:[AWSIoTAttributePayload class]];
}

- (void) test_AWSIoTAuditCheckConfiguration {
    [self validateSecureCodingForClass:[AWSIoTAuditCheckConfiguration class]];
}

- (void) test_AWSIoTAuditCheckDetails {
    [self validateSecureCodingForClass:[AWSIoTAuditCheckDetails class]];
}

- (void) test_AWSIoTAuditFinding {
    [self validateSecureCodingForClass:[AWSIoTAuditFinding class]];
}

- (void) test_AWSIoTAuditMitigationActionExecutionMetadata {
    [self validateSecureCodingForClass:[AWSIoTAuditMitigationActionExecutionMetadata class]];
}

- (void) test_AWSIoTAuditMitigationActionsTaskMetadata {
    [self validateSecureCodingForClass:[AWSIoTAuditMitigationActionsTaskMetadata class]];
}

- (void) test_AWSIoTAuditMitigationActionsTaskTarget {
    [self validateSecureCodingForClass:[AWSIoTAuditMitigationActionsTaskTarget class]];
}

- (void) test_AWSIoTAuditNotificationTarget {
    [self validateSecureCodingForClass:[AWSIoTAuditNotificationTarget class]];
}

- (void) test_AWSIoTAuditSuppression {
    [self validateSecureCodingForClass:[AWSIoTAuditSuppression class]];
}

- (void) test_AWSIoTAuditTaskMetadata {
    [self validateSecureCodingForClass:[AWSIoTAuditTaskMetadata class]];
}

- (void) test_AWSIoTAuthInfo {
    [self validateSecureCodingForClass:[AWSIoTAuthInfo class]];
}

- (void) test_AWSIoTAuthResult {
    [self validateSecureCodingForClass:[AWSIoTAuthResult class]];
}

- (void) test_AWSIoTAuthorizerConfig {
    [self validateSecureCodingForClass:[AWSIoTAuthorizerConfig class]];
}

- (void) test_AWSIoTAuthorizerDescription {
    [self validateSecureCodingForClass:[AWSIoTAuthorizerDescription class]];
}

- (void) test_AWSIoTAuthorizerSummary {
    [self validateSecureCodingForClass:[AWSIoTAuthorizerSummary class]];
}

- (void) test_AWSIoTAwsJobAbortConfig {
    [self validateSecureCodingForClass:[AWSIoTAwsJobAbortConfig class]];
}

- (void) test_AWSIoTAwsJobAbortCriteria {
    [self validateSecureCodingForClass:[AWSIoTAwsJobAbortCriteria class]];
}

- (void) test_AWSIoTAwsJobExecutionsRolloutConfig {
    [self validateSecureCodingForClass:[AWSIoTAwsJobExecutionsRolloutConfig class]];
}

- (void) test_AWSIoTAwsJobExponentialRolloutRate {
    [self validateSecureCodingForClass:[AWSIoTAwsJobExponentialRolloutRate class]];
}

- (void) test_AWSIoTAwsJobPresignedUrlConfig {
    [self validateSecureCodingForClass:[AWSIoTAwsJobPresignedUrlConfig class]];
}

- (void) test_AWSIoTAwsJobRateIncreaseCriteria {
    [self validateSecureCodingForClass:[AWSIoTAwsJobRateIncreaseCriteria class]];
}

- (void) test_AWSIoTAwsJobTimeoutConfig {
    [self validateSecureCodingForClass:[AWSIoTAwsJobTimeoutConfig class]];
}

- (void) test_AWSIoTBehavior {
    [self validateSecureCodingForClass:[AWSIoTBehavior class]];
}

- (void) test_AWSIoTBehaviorCriteria {
    [self validateSecureCodingForClass:[AWSIoTBehaviorCriteria class]];
}

- (void) test_AWSIoTBehaviorModelTrainingSummary {
    [self validateSecureCodingForClass:[AWSIoTBehaviorModelTrainingSummary class]];
}

- (void) test_AWSIoTBillingGroupMetadata {
    [self validateSecureCodingForClass:[AWSIoTBillingGroupMetadata class]];
}

- (void) test_AWSIoTBillingGroupProperties {
    [self validateSecureCodingForClass:[AWSIoTBillingGroupProperties class]];
}

- (void) test_AWSIoTBucket {
    [self validateSecureCodingForClass:[AWSIoTBucket class]];
}

- (void) test_AWSIoTBucketsAggregationType {
    [self validateSecureCodingForClass:[AWSIoTBucketsAggregationType class]];
}

- (void) test_AWSIoTCACertificate {
    [self validateSecureCodingForClass:[AWSIoTCACertificate class]];
}

- (void) test_AWSIoTCACertificateDescription {
    [self validateSecureCodingForClass:[AWSIoTCACertificateDescription class]];
}

- (void) test_AWSIoTCancelAuditMitigationActionsTaskRequest {
    [self validateSecureCodingForClass:[AWSIoTCancelAuditMitigationActionsTaskRequest class]];
}

- (void) test_AWSIoTCancelAuditMitigationActionsTaskResponse {
    [self validateSecureCodingForClass:[AWSIoTCancelAuditMitigationActionsTaskResponse class]];
}

- (void) test_AWSIoTCancelAuditTaskRequest {
    [self validateSecureCodingForClass:[AWSIoTCancelAuditTaskRequest class]];
}

- (void) test_AWSIoTCancelAuditTaskResponse {
    [self validateSecureCodingForClass:[AWSIoTCancelAuditTaskResponse class]];
}

- (void) test_AWSIoTCancelCertificateTransferRequest {
    [self validateSecureCodingForClass:[AWSIoTCancelCertificateTransferRequest class]];
}

- (void) test_AWSIoTCancelDetectMitigationActionsTaskRequest {
    [self validateSecureCodingForClass:[AWSIoTCancelDetectMitigationActionsTaskRequest class]];
}

- (void) test_AWSIoTCancelDetectMitigationActionsTaskResponse {
    [self validateSecureCodingForClass:[AWSIoTCancelDetectMitigationActionsTaskResponse class]];
}

- (void) test_AWSIoTCancelJobExecutionRequest {
    [self validateSecureCodingForClass:[AWSIoTCancelJobExecutionRequest class]];
}

- (void) test_AWSIoTCancelJobRequest {
    [self validateSecureCodingForClass:[AWSIoTCancelJobRequest class]];
}

- (void) test_AWSIoTCancelJobResponse {
    [self validateSecureCodingForClass:[AWSIoTCancelJobResponse class]];
}

- (void) test_AWSIoTCertificate {
    [self validateSecureCodingForClass:[AWSIoTCertificate class]];
}

- (void) test_AWSIoTCertificateDescription {
    [self validateSecureCodingForClass:[AWSIoTCertificateDescription class]];
}

- (void) test_AWSIoTCertificateValidity {
    [self validateSecureCodingForClass:[AWSIoTCertificateValidity class]];
}

- (void) test_AWSIoTClearDefaultAuthorizerRequest {
    [self validateSecureCodingForClass:[AWSIoTClearDefaultAuthorizerRequest class]];
}

- (void) test_AWSIoTClearDefaultAuthorizerResponse {
    [self validateSecureCodingForClass:[AWSIoTClearDefaultAuthorizerResponse class]];
}

- (void) test_AWSIoTCloudwatchAlarmAction {
    [self validateSecureCodingForClass:[AWSIoTCloudwatchAlarmAction class]];
}

- (void) test_AWSIoTCloudwatchLogsAction {
    [self validateSecureCodingForClass:[AWSIoTCloudwatchLogsAction class]];
}

- (void) test_AWSIoTCloudwatchMetricAction {
    [self validateSecureCodingForClass:[AWSIoTCloudwatchMetricAction class]];
}

- (void) test_AWSIoTCodeSigning {
    [self validateSecureCodingForClass:[AWSIoTCodeSigning class]];
}

- (void) test_AWSIoTCodeSigningCertificateChain {
    [self validateSecureCodingForClass:[AWSIoTCodeSigningCertificateChain class]];
}

- (void) test_AWSIoTCodeSigningSignature {
    [self validateSecureCodingForClass:[AWSIoTCodeSigningSignature class]];
}

- (void) test_AWSIoTConfiguration {
    [self validateSecureCodingForClass:[AWSIoTConfiguration class]];
}

- (void) test_AWSIoTConfirmTopicRuleDestinationRequest {
    [self validateSecureCodingForClass:[AWSIoTConfirmTopicRuleDestinationRequest class]];
}

- (void) test_AWSIoTConfirmTopicRuleDestinationResponse {
    [self validateSecureCodingForClass:[AWSIoTConfirmTopicRuleDestinationResponse class]];
}

- (void) test_AWSIoTCreateAuditSuppressionRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateAuditSuppressionRequest class]];
}

- (void) test_AWSIoTCreateAuditSuppressionResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateAuditSuppressionResponse class]];
}

- (void) test_AWSIoTCreateAuthorizerRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateAuthorizerRequest class]];
}

- (void) test_AWSIoTCreateAuthorizerResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateAuthorizerResponse class]];
}

- (void) test_AWSIoTCreateBillingGroupRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateBillingGroupRequest class]];
}

- (void) test_AWSIoTCreateBillingGroupResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateBillingGroupResponse class]];
}

- (void) test_AWSIoTCreateCertificateFromCsrRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateCertificateFromCsrRequest class]];
}

- (void) test_AWSIoTCreateCertificateFromCsrResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateCertificateFromCsrResponse class]];
}

- (void) test_AWSIoTCreateCustomMetricRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateCustomMetricRequest class]];
}

- (void) test_AWSIoTCreateCustomMetricResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateCustomMetricResponse class]];
}

- (void) test_AWSIoTCreateDimensionRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateDimensionRequest class]];
}

- (void) test_AWSIoTCreateDimensionResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateDimensionResponse class]];
}

- (void) test_AWSIoTCreateDomainConfigurationRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateDomainConfigurationRequest class]];
}

- (void) test_AWSIoTCreateDomainConfigurationResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateDomainConfigurationResponse class]];
}

- (void) test_AWSIoTCreateDynamicThingGroupRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateDynamicThingGroupRequest class]];
}

- (void) test_AWSIoTCreateDynamicThingGroupResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateDynamicThingGroupResponse class]];
}

- (void) test_AWSIoTCreateFleetMetricRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateFleetMetricRequest class]];
}

- (void) test_AWSIoTCreateFleetMetricResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateFleetMetricResponse class]];
}

- (void) test_AWSIoTCreateJobRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateJobRequest class]];
}

- (void) test_AWSIoTCreateJobResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateJobResponse class]];
}

- (void) test_AWSIoTCreateJobTemplateRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateJobTemplateRequest class]];
}

- (void) test_AWSIoTCreateJobTemplateResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateJobTemplateResponse class]];
}

- (void) test_AWSIoTCreateKeysAndCertificateRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateKeysAndCertificateRequest class]];
}

- (void) test_AWSIoTCreateKeysAndCertificateResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateKeysAndCertificateResponse class]];
}

- (void) test_AWSIoTCreateMitigationActionRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateMitigationActionRequest class]];
}

- (void) test_AWSIoTCreateMitigationActionResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateMitigationActionResponse class]];
}

- (void) test_AWSIoTCreateOTAUpdateRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateOTAUpdateRequest class]];
}

- (void) test_AWSIoTCreateOTAUpdateResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateOTAUpdateResponse class]];
}

- (void) test_AWSIoTCreatePolicyRequest {
    [self validateSecureCodingForClass:[AWSIoTCreatePolicyRequest class]];
}

- (void) test_AWSIoTCreatePolicyResponse {
    [self validateSecureCodingForClass:[AWSIoTCreatePolicyResponse class]];
}

- (void) test_AWSIoTCreatePolicyVersionRequest {
    [self validateSecureCodingForClass:[AWSIoTCreatePolicyVersionRequest class]];
}

- (void) test_AWSIoTCreatePolicyVersionResponse {
    [self validateSecureCodingForClass:[AWSIoTCreatePolicyVersionResponse class]];
}

- (void) test_AWSIoTCreateProvisioningClaimRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateProvisioningClaimRequest class]];
}

- (void) test_AWSIoTCreateProvisioningClaimResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateProvisioningClaimResponse class]];
}

- (void) test_AWSIoTCreateProvisioningTemplateRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateProvisioningTemplateRequest class]];
}

- (void) test_AWSIoTCreateProvisioningTemplateResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateProvisioningTemplateResponse class]];
}

- (void) test_AWSIoTCreateProvisioningTemplateVersionRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateProvisioningTemplateVersionRequest class]];
}

- (void) test_AWSIoTCreateProvisioningTemplateVersionResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateProvisioningTemplateVersionResponse class]];
}

- (void) test_AWSIoTCreateRoleAliasRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateRoleAliasRequest class]];
}

- (void) test_AWSIoTCreateRoleAliasResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateRoleAliasResponse class]];
}

- (void) test_AWSIoTCreateScheduledAuditRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateScheduledAuditRequest class]];
}

- (void) test_AWSIoTCreateScheduledAuditResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateScheduledAuditResponse class]];
}

- (void) test_AWSIoTCreateSecurityProfileRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateSecurityProfileRequest class]];
}

- (void) test_AWSIoTCreateSecurityProfileResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateSecurityProfileResponse class]];
}

- (void) test_AWSIoTCreateStreamRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateStreamRequest class]];
}

- (void) test_AWSIoTCreateStreamResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateStreamResponse class]];
}

- (void) test_AWSIoTCreateThingGroupRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateThingGroupRequest class]];
}

- (void) test_AWSIoTCreateThingGroupResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateThingGroupResponse class]];
}

- (void) test_AWSIoTCreateThingRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateThingRequest class]];
}

- (void) test_AWSIoTCreateThingResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateThingResponse class]];
}

- (void) test_AWSIoTCreateThingTypeRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateThingTypeRequest class]];
}

- (void) test_AWSIoTCreateThingTypeResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateThingTypeResponse class]];
}

- (void) test_AWSIoTCreateTopicRuleDestinationRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateTopicRuleDestinationRequest class]];
}

- (void) test_AWSIoTCreateTopicRuleDestinationResponse {
    [self validateSecureCodingForClass:[AWSIoTCreateTopicRuleDestinationResponse class]];
}

- (void) test_AWSIoTCreateTopicRuleRequest {
    [self validateSecureCodingForClass:[AWSIoTCreateTopicRuleRequest class]];
}

- (void) test_AWSIoTCustomCodeSigning {
    [self validateSecureCodingForClass:[AWSIoTCustomCodeSigning class]];
}

- (void) test_AWSIoTDeleteAccountAuditConfigurationRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteAccountAuditConfigurationRequest class]];
}

- (void) test_AWSIoTDeleteAccountAuditConfigurationResponse {
    [self validateSecureCodingForClass:[AWSIoTDeleteAccountAuditConfigurationResponse class]];
}

- (void) test_AWSIoTDeleteAuditSuppressionRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteAuditSuppressionRequest class]];
}

- (void) test_AWSIoTDeleteAuditSuppressionResponse {
    [self validateSecureCodingForClass:[AWSIoTDeleteAuditSuppressionResponse class]];
}

- (void) test_AWSIoTDeleteAuthorizerRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteAuthorizerRequest class]];
}

- (void) test_AWSIoTDeleteAuthorizerResponse {
    [self validateSecureCodingForClass:[AWSIoTDeleteAuthorizerResponse class]];
}

- (void) test_AWSIoTDeleteBillingGroupRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteBillingGroupRequest class]];
}

- (void) test_AWSIoTDeleteBillingGroupResponse {
    [self validateSecureCodingForClass:[AWSIoTDeleteBillingGroupResponse class]];
}

- (void) test_AWSIoTDeleteCACertificateRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteCACertificateRequest class]];
}

- (void) test_AWSIoTDeleteCACertificateResponse {
    [self validateSecureCodingForClass:[AWSIoTDeleteCACertificateResponse class]];
}

- (void) test_AWSIoTDeleteCertificateRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteCertificateRequest class]];
}

- (void) test_AWSIoTDeleteCustomMetricRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteCustomMetricRequest class]];
}

- (void) test_AWSIoTDeleteCustomMetricResponse {
    [self validateSecureCodingForClass:[AWSIoTDeleteCustomMetricResponse class]];
}

- (void) test_AWSIoTDeleteDimensionRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteDimensionRequest class]];
}

- (void) test_AWSIoTDeleteDimensionResponse {
    [self validateSecureCodingForClass:[AWSIoTDeleteDimensionResponse class]];
}

- (void) test_AWSIoTDeleteDomainConfigurationRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteDomainConfigurationRequest class]];
}

- (void) test_AWSIoTDeleteDomainConfigurationResponse {
    [self validateSecureCodingForClass:[AWSIoTDeleteDomainConfigurationResponse class]];
}

- (void) test_AWSIoTDeleteDynamicThingGroupRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteDynamicThingGroupRequest class]];
}

- (void) test_AWSIoTDeleteDynamicThingGroupResponse {
    [self validateSecureCodingForClass:[AWSIoTDeleteDynamicThingGroupResponse class]];
}

- (void) test_AWSIoTDeleteFleetMetricRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteFleetMetricRequest class]];
}

- (void) test_AWSIoTDeleteJobExecutionRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteJobExecutionRequest class]];
}

- (void) test_AWSIoTDeleteJobRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteJobRequest class]];
}

- (void) test_AWSIoTDeleteJobTemplateRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteJobTemplateRequest class]];
}

- (void) test_AWSIoTDeleteMitigationActionRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteMitigationActionRequest class]];
}

- (void) test_AWSIoTDeleteMitigationActionResponse {
    [self validateSecureCodingForClass:[AWSIoTDeleteMitigationActionResponse class]];
}

- (void) test_AWSIoTDeleteOTAUpdateRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteOTAUpdateRequest class]];
}

- (void) test_AWSIoTDeleteOTAUpdateResponse {
    [self validateSecureCodingForClass:[AWSIoTDeleteOTAUpdateResponse class]];
}

- (void) test_AWSIoTDeletePolicyRequest {
    [self validateSecureCodingForClass:[AWSIoTDeletePolicyRequest class]];
}

- (void) test_AWSIoTDeletePolicyVersionRequest {
    [self validateSecureCodingForClass:[AWSIoTDeletePolicyVersionRequest class]];
}

- (void) test_AWSIoTDeleteProvisioningTemplateRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteProvisioningTemplateRequest class]];
}

- (void) test_AWSIoTDeleteProvisioningTemplateResponse {
    [self validateSecureCodingForClass:[AWSIoTDeleteProvisioningTemplateResponse class]];
}

- (void) test_AWSIoTDeleteProvisioningTemplateVersionRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteProvisioningTemplateVersionRequest class]];
}

- (void) test_AWSIoTDeleteProvisioningTemplateVersionResponse {
    [self validateSecureCodingForClass:[AWSIoTDeleteProvisioningTemplateVersionResponse class]];
}

- (void) test_AWSIoTDeleteRegistrationCodeRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteRegistrationCodeRequest class]];
}

- (void) test_AWSIoTDeleteRegistrationCodeResponse {
    [self validateSecureCodingForClass:[AWSIoTDeleteRegistrationCodeResponse class]];
}

- (void) test_AWSIoTDeleteRoleAliasRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteRoleAliasRequest class]];
}

- (void) test_AWSIoTDeleteRoleAliasResponse {
    [self validateSecureCodingForClass:[AWSIoTDeleteRoleAliasResponse class]];
}

- (void) test_AWSIoTDeleteScheduledAuditRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteScheduledAuditRequest class]];
}

- (void) test_AWSIoTDeleteScheduledAuditResponse {
    [self validateSecureCodingForClass:[AWSIoTDeleteScheduledAuditResponse class]];
}

- (void) test_AWSIoTDeleteSecurityProfileRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteSecurityProfileRequest class]];
}

- (void) test_AWSIoTDeleteSecurityProfileResponse {
    [self validateSecureCodingForClass:[AWSIoTDeleteSecurityProfileResponse class]];
}

- (void) test_AWSIoTDeleteStreamRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteStreamRequest class]];
}

- (void) test_AWSIoTDeleteStreamResponse {
    [self validateSecureCodingForClass:[AWSIoTDeleteStreamResponse class]];
}

- (void) test_AWSIoTDeleteThingGroupRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteThingGroupRequest class]];
}

- (void) test_AWSIoTDeleteThingGroupResponse {
    [self validateSecureCodingForClass:[AWSIoTDeleteThingGroupResponse class]];
}

- (void) test_AWSIoTDeleteThingRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteThingRequest class]];
}

- (void) test_AWSIoTDeleteThingResponse {
    [self validateSecureCodingForClass:[AWSIoTDeleteThingResponse class]];
}

- (void) test_AWSIoTDeleteThingTypeRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteThingTypeRequest class]];
}

- (void) test_AWSIoTDeleteThingTypeResponse {
    [self validateSecureCodingForClass:[AWSIoTDeleteThingTypeResponse class]];
}

- (void) test_AWSIoTDeleteTopicRuleDestinationRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteTopicRuleDestinationRequest class]];
}

- (void) test_AWSIoTDeleteTopicRuleDestinationResponse {
    [self validateSecureCodingForClass:[AWSIoTDeleteTopicRuleDestinationResponse class]];
}

- (void) test_AWSIoTDeleteTopicRuleRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteTopicRuleRequest class]];
}

- (void) test_AWSIoTDeleteV2LoggingLevelRequest {
    [self validateSecureCodingForClass:[AWSIoTDeleteV2LoggingLevelRequest class]];
}

- (void) test_AWSIoTDenied {
    [self validateSecureCodingForClass:[AWSIoTDenied class]];
}

- (void) test_AWSIoTDeprecateThingTypeRequest {
    [self validateSecureCodingForClass:[AWSIoTDeprecateThingTypeRequest class]];
}

- (void) test_AWSIoTDeprecateThingTypeResponse {
    [self validateSecureCodingForClass:[AWSIoTDeprecateThingTypeResponse class]];
}

- (void) test_AWSIoTDescribeAccountAuditConfigurationRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeAccountAuditConfigurationRequest class]];
}

- (void) test_AWSIoTDescribeAccountAuditConfigurationResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeAccountAuditConfigurationResponse class]];
}

- (void) test_AWSIoTDescribeAuditFindingRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeAuditFindingRequest class]];
}

- (void) test_AWSIoTDescribeAuditFindingResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeAuditFindingResponse class]];
}

- (void) test_AWSIoTDescribeAuditMitigationActionsTaskRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeAuditMitigationActionsTaskRequest class]];
}

- (void) test_AWSIoTDescribeAuditMitigationActionsTaskResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeAuditMitigationActionsTaskResponse class]];
}

- (void) test_AWSIoTDescribeAuditSuppressionRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeAuditSuppressionRequest class]];
}

- (void) test_AWSIoTDescribeAuditSuppressionResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeAuditSuppressionResponse class]];
}

- (void) test_AWSIoTDescribeAuditTaskRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeAuditTaskRequest class]];
}

- (void) test_AWSIoTDescribeAuditTaskResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeAuditTaskResponse class]];
}

- (void) test_AWSIoTDescribeAuthorizerRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeAuthorizerRequest class]];
}

- (void) test_AWSIoTDescribeAuthorizerResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeAuthorizerResponse class]];
}

- (void) test_AWSIoTDescribeBillingGroupRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeBillingGroupRequest class]];
}

- (void) test_AWSIoTDescribeBillingGroupResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeBillingGroupResponse class]];
}

- (void) test_AWSIoTDescribeCACertificateRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeCACertificateRequest class]];
}

- (void) test_AWSIoTDescribeCACertificateResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeCACertificateResponse class]];
}

- (void) test_AWSIoTDescribeCertificateRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeCertificateRequest class]];
}

- (void) test_AWSIoTDescribeCertificateResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeCertificateResponse class]];
}

- (void) test_AWSIoTDescribeCustomMetricRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeCustomMetricRequest class]];
}

- (void) test_AWSIoTDescribeCustomMetricResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeCustomMetricResponse class]];
}

- (void) test_AWSIoTDescribeDefaultAuthorizerRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeDefaultAuthorizerRequest class]];
}

- (void) test_AWSIoTDescribeDefaultAuthorizerResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeDefaultAuthorizerResponse class]];
}

- (void) test_AWSIoTDescribeDetectMitigationActionsTaskRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeDetectMitigationActionsTaskRequest class]];
}

- (void) test_AWSIoTDescribeDetectMitigationActionsTaskResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeDetectMitigationActionsTaskResponse class]];
}

- (void) test_AWSIoTDescribeDimensionRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeDimensionRequest class]];
}

- (void) test_AWSIoTDescribeDimensionResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeDimensionResponse class]];
}

- (void) test_AWSIoTDescribeDomainConfigurationRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeDomainConfigurationRequest class]];
}

- (void) test_AWSIoTDescribeDomainConfigurationResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeDomainConfigurationResponse class]];
}

- (void) test_AWSIoTDescribeEndpointRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeEndpointRequest class]];
}

- (void) test_AWSIoTDescribeEndpointResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeEndpointResponse class]];
}

- (void) test_AWSIoTDescribeEventConfigurationsRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeEventConfigurationsRequest class]];
}

- (void) test_AWSIoTDescribeEventConfigurationsResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeEventConfigurationsResponse class]];
}

- (void) test_AWSIoTDescribeFleetMetricRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeFleetMetricRequest class]];
}

- (void) test_AWSIoTDescribeFleetMetricResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeFleetMetricResponse class]];
}

- (void) test_AWSIoTDescribeIndexRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeIndexRequest class]];
}

- (void) test_AWSIoTDescribeIndexResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeIndexResponse class]];
}

- (void) test_AWSIoTDescribeJobExecutionRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeJobExecutionRequest class]];
}

- (void) test_AWSIoTDescribeJobExecutionResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeJobExecutionResponse class]];
}

- (void) test_AWSIoTDescribeJobRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeJobRequest class]];
}

- (void) test_AWSIoTDescribeJobResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeJobResponse class]];
}

- (void) test_AWSIoTDescribeJobTemplateRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeJobTemplateRequest class]];
}

- (void) test_AWSIoTDescribeJobTemplateResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeJobTemplateResponse class]];
}

- (void) test_AWSIoTDescribeManagedJobTemplateRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeManagedJobTemplateRequest class]];
}

- (void) test_AWSIoTDescribeManagedJobTemplateResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeManagedJobTemplateResponse class]];
}

- (void) test_AWSIoTDescribeMitigationActionRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeMitigationActionRequest class]];
}

- (void) test_AWSIoTDescribeMitigationActionResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeMitigationActionResponse class]];
}

- (void) test_AWSIoTDescribeProvisioningTemplateRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeProvisioningTemplateRequest class]];
}

- (void) test_AWSIoTDescribeProvisioningTemplateResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeProvisioningTemplateResponse class]];
}

- (void) test_AWSIoTDescribeProvisioningTemplateVersionRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeProvisioningTemplateVersionRequest class]];
}

- (void) test_AWSIoTDescribeProvisioningTemplateVersionResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeProvisioningTemplateVersionResponse class]];
}

- (void) test_AWSIoTDescribeRoleAliasRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeRoleAliasRequest class]];
}

- (void) test_AWSIoTDescribeRoleAliasResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeRoleAliasResponse class]];
}

- (void) test_AWSIoTDescribeScheduledAuditRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeScheduledAuditRequest class]];
}

- (void) test_AWSIoTDescribeScheduledAuditResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeScheduledAuditResponse class]];
}

- (void) test_AWSIoTDescribeSecurityProfileRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeSecurityProfileRequest class]];
}

- (void) test_AWSIoTDescribeSecurityProfileResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeSecurityProfileResponse class]];
}

- (void) test_AWSIoTDescribeStreamRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeStreamRequest class]];
}

- (void) test_AWSIoTDescribeStreamResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeStreamResponse class]];
}

- (void) test_AWSIoTDescribeThingGroupRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeThingGroupRequest class]];
}

- (void) test_AWSIoTDescribeThingGroupResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeThingGroupResponse class]];
}

- (void) test_AWSIoTDescribeThingRegistrationTaskRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeThingRegistrationTaskRequest class]];
}

- (void) test_AWSIoTDescribeThingRegistrationTaskResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeThingRegistrationTaskResponse class]];
}

- (void) test_AWSIoTDescribeThingRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeThingRequest class]];
}

- (void) test_AWSIoTDescribeThingResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeThingResponse class]];
}

- (void) test_AWSIoTDescribeThingTypeRequest {
    [self validateSecureCodingForClass:[AWSIoTDescribeThingTypeRequest class]];
}

- (void) test_AWSIoTDescribeThingTypeResponse {
    [self validateSecureCodingForClass:[AWSIoTDescribeThingTypeResponse class]];
}

- (void) test_AWSIoTDestination {
    [self validateSecureCodingForClass:[AWSIoTDestination class]];
}

- (void) test_AWSIoTDetachPolicyRequest {
    [self validateSecureCodingForClass:[AWSIoTDetachPolicyRequest class]];
}

- (void) test_AWSIoTDetachPrincipalPolicyRequest {
    [self validateSecureCodingForClass:[AWSIoTDetachPrincipalPolicyRequest class]];
}

- (void) test_AWSIoTDetachSecurityProfileRequest {
    [self validateSecureCodingForClass:[AWSIoTDetachSecurityProfileRequest class]];
}

- (void) test_AWSIoTDetachSecurityProfileResponse {
    [self validateSecureCodingForClass:[AWSIoTDetachSecurityProfileResponse class]];
}

- (void) test_AWSIoTDetachThingPrincipalRequest {
    [self validateSecureCodingForClass:[AWSIoTDetachThingPrincipalRequest class]];
}

- (void) test_AWSIoTDetachThingPrincipalResponse {
    [self validateSecureCodingForClass:[AWSIoTDetachThingPrincipalResponse class]];
}

- (void) test_AWSIoTDetectMitigationActionExecution {
    [self validateSecureCodingForClass:[AWSIoTDetectMitigationActionExecution class]];
}

- (void) test_AWSIoTDetectMitigationActionsTaskStatistics {
    [self validateSecureCodingForClass:[AWSIoTDetectMitigationActionsTaskStatistics class]];
}

- (void) test_AWSIoTDetectMitigationActionsTaskSummary {
    [self validateSecureCodingForClass:[AWSIoTDetectMitigationActionsTaskSummary class]];
}

- (void) test_AWSIoTDetectMitigationActionsTaskTarget {
    [self validateSecureCodingForClass:[AWSIoTDetectMitigationActionsTaskTarget class]];
}

- (void) test_AWSIoTDisableTopicRuleRequest {
    [self validateSecureCodingForClass:[AWSIoTDisableTopicRuleRequest class]];
}

- (void) test_AWSIoTDocumentParameter {
    [self validateSecureCodingForClass:[AWSIoTDocumentParameter class]];
}

- (void) test_AWSIoTDomainConfigurationSummary {
    [self validateSecureCodingForClass:[AWSIoTDomainConfigurationSummary class]];
}

- (void) test_AWSIoTDynamoDBAction {
    [self validateSecureCodingForClass:[AWSIoTDynamoDBAction class]];
}

- (void) test_AWSIoTDynamoDBv2Action {
    [self validateSecureCodingForClass:[AWSIoTDynamoDBv2Action class]];
}

- (void) test_AWSIoTEffectivePolicy {
    [self validateSecureCodingForClass:[AWSIoTEffectivePolicy class]];
}

- (void) test_AWSIoTElasticsearchAction {
    [self validateSecureCodingForClass:[AWSIoTElasticsearchAction class]];
}

- (void) test_AWSIoTEnableIoTLoggingParams {
    [self validateSecureCodingForClass:[AWSIoTEnableIoTLoggingParams class]];
}

- (void) test_AWSIoTEnableTopicRuleRequest {
    [self validateSecureCodingForClass:[AWSIoTEnableTopicRuleRequest class]];
}

- (void) test_AWSIoTErrorInfo {
    [self validateSecureCodingForClass:[AWSIoTErrorInfo class]];
}

- (void) test_AWSIoTExplicitDeny {
    [self validateSecureCodingForClass:[AWSIoTExplicitDeny class]];
}

- (void) test_AWSIoTExponentialRolloutRate {
    [self validateSecureCodingForClass:[AWSIoTExponentialRolloutRate class]];
}

- (void) test_AWSIoTField {
    [self validateSecureCodingForClass:[AWSIoTField class]];
}

- (void) test_AWSIoTFileLocation {
    [self validateSecureCodingForClass:[AWSIoTFileLocation class]];
}

- (void) test_AWSIoTFirehoseAction {
    [self validateSecureCodingForClass:[AWSIoTFirehoseAction class]];
}

- (void) test_AWSIoTFleetMetricNameAndArn {
    [self validateSecureCodingForClass:[AWSIoTFleetMetricNameAndArn class]];
}

- (void) test_AWSIoTGetBehaviorModelTrainingSummariesRequest {
    [self validateSecureCodingForClass:[AWSIoTGetBehaviorModelTrainingSummariesRequest class]];
}

- (void) test_AWSIoTGetBehaviorModelTrainingSummariesResponse {
    [self validateSecureCodingForClass:[AWSIoTGetBehaviorModelTrainingSummariesResponse class]];
}

- (void) test_AWSIoTGetBucketsAggregationRequest {
    [self validateSecureCodingForClass:[AWSIoTGetBucketsAggregationRequest class]];
}

- (void) test_AWSIoTGetBucketsAggregationResponse {
    [self validateSecureCodingForClass:[AWSIoTGetBucketsAggregationResponse class]];
}

- (void) test_AWSIoTGetCardinalityRequest {
    [self validateSecureCodingForClass:[AWSIoTGetCardinalityRequest class]];
}

- (void) test_AWSIoTGetCardinalityResponse {
    [self validateSecureCodingForClass:[AWSIoTGetCardinalityResponse class]];
}

- (void) test_AWSIoTGetEffectivePoliciesRequest {
    [self validateSecureCodingForClass:[AWSIoTGetEffectivePoliciesRequest class]];
}

- (void) test_AWSIoTGetEffectivePoliciesResponse {
    [self validateSecureCodingForClass:[AWSIoTGetEffectivePoliciesResponse class]];
}

- (void) test_AWSIoTGetIndexingConfigurationRequest {
    [self validateSecureCodingForClass:[AWSIoTGetIndexingConfigurationRequest class]];
}

- (void) test_AWSIoTGetIndexingConfigurationResponse {
    [self validateSecureCodingForClass:[AWSIoTGetIndexingConfigurationResponse class]];
}

- (void) test_AWSIoTGetJobDocumentRequest {
    [self validateSecureCodingForClass:[AWSIoTGetJobDocumentRequest class]];
}

- (void) test_AWSIoTGetJobDocumentResponse {
    [self validateSecureCodingForClass:[AWSIoTGetJobDocumentResponse class]];
}

- (void) test_AWSIoTGetLoggingOptionsRequest {
    [self validateSecureCodingForClass:[AWSIoTGetLoggingOptionsRequest class]];
}

- (void) test_AWSIoTGetLoggingOptionsResponse {
    [self validateSecureCodingForClass:[AWSIoTGetLoggingOptionsResponse class]];
}

- (void) test_AWSIoTGetOTAUpdateRequest {
    [self validateSecureCodingForClass:[AWSIoTGetOTAUpdateRequest class]];
}

- (void) test_AWSIoTGetOTAUpdateResponse {
    [self validateSecureCodingForClass:[AWSIoTGetOTAUpdateResponse class]];
}

- (void) test_AWSIoTGetPercentilesRequest {
    [self validateSecureCodingForClass:[AWSIoTGetPercentilesRequest class]];
}

- (void) test_AWSIoTGetPercentilesResponse {
    [self validateSecureCodingForClass:[AWSIoTGetPercentilesResponse class]];
}

- (void) test_AWSIoTGetPolicyRequest {
    [self validateSecureCodingForClass:[AWSIoTGetPolicyRequest class]];
}

- (void) test_AWSIoTGetPolicyResponse {
    [self validateSecureCodingForClass:[AWSIoTGetPolicyResponse class]];
}

- (void) test_AWSIoTGetPolicyVersionRequest {
    [self validateSecureCodingForClass:[AWSIoTGetPolicyVersionRequest class]];
}

- (void) test_AWSIoTGetPolicyVersionResponse {
    [self validateSecureCodingForClass:[AWSIoTGetPolicyVersionResponse class]];
}

- (void) test_AWSIoTGetRegistrationCodeRequest {
    [self validateSecureCodingForClass:[AWSIoTGetRegistrationCodeRequest class]];
}

- (void) test_AWSIoTGetRegistrationCodeResponse {
    [self validateSecureCodingForClass:[AWSIoTGetRegistrationCodeResponse class]];
}

- (void) test_AWSIoTGetStatisticsRequest {
    [self validateSecureCodingForClass:[AWSIoTGetStatisticsRequest class]];
}

- (void) test_AWSIoTGetStatisticsResponse {
    [self validateSecureCodingForClass:[AWSIoTGetStatisticsResponse class]];
}

- (void) test_AWSIoTGetTopicRuleDestinationRequest {
    [self validateSecureCodingForClass:[AWSIoTGetTopicRuleDestinationRequest class]];
}

- (void) test_AWSIoTGetTopicRuleDestinationResponse {
    [self validateSecureCodingForClass:[AWSIoTGetTopicRuleDestinationResponse class]];
}

- (void) test_AWSIoTGetTopicRuleRequest {
    [self validateSecureCodingForClass:[AWSIoTGetTopicRuleRequest class]];
}

- (void) test_AWSIoTGetTopicRuleResponse {
    [self validateSecureCodingForClass:[AWSIoTGetTopicRuleResponse class]];
}

- (void) test_AWSIoTGetV2LoggingOptionsRequest {
    [self validateSecureCodingForClass:[AWSIoTGetV2LoggingOptionsRequest class]];
}

- (void) test_AWSIoTGetV2LoggingOptionsResponse {
    [self validateSecureCodingForClass:[AWSIoTGetV2LoggingOptionsResponse class]];
}

- (void) test_AWSIoTGroupNameAndArn {
    [self validateSecureCodingForClass:[AWSIoTGroupNameAndArn class]];
}

- (void) test_AWSIoTHttpAction {
    [self validateSecureCodingForClass:[AWSIoTHttpAction class]];
}

- (void) test_AWSIoTHttpActionHeader {
    [self validateSecureCodingForClass:[AWSIoTHttpActionHeader class]];
}

- (void) test_AWSIoTHttpAuthorization {
    [self validateSecureCodingForClass:[AWSIoTHttpAuthorization class]];
}

- (void) test_AWSIoTHttpContext {
    [self validateSecureCodingForClass:[AWSIoTHttpContext class]];
}

- (void) test_AWSIoTHttpUrlDestinationConfiguration {
    [self validateSecureCodingForClass:[AWSIoTHttpUrlDestinationConfiguration class]];
}

- (void) test_AWSIoTHttpUrlDestinationProperties {
    [self validateSecureCodingForClass:[AWSIoTHttpUrlDestinationProperties class]];
}

- (void) test_AWSIoTHttpUrlDestinationSummary {
    [self validateSecureCodingForClass:[AWSIoTHttpUrlDestinationSummary class]];
}

- (void) test_AWSIoTImplicitDeny {
    [self validateSecureCodingForClass:[AWSIoTImplicitDeny class]];
}

- (void) test_AWSIoTIndexingFilter {
    [self validateSecureCodingForClass:[AWSIoTIndexingFilter class]];
}

- (void) test_AWSIoTIotAnalyticsAction {
    [self validateSecureCodingForClass:[AWSIoTIotAnalyticsAction class]];
}

- (void) test_AWSIoTIotEventsAction {
    [self validateSecureCodingForClass:[AWSIoTIotEventsAction class]];
}

- (void) test_AWSIoTIotSiteWiseAction {
    [self validateSecureCodingForClass:[AWSIoTIotSiteWiseAction class]];
}

- (void) test_AWSIoTIssuerCertificateIdentifier {
    [self validateSecureCodingForClass:[AWSIoTIssuerCertificateIdentifier class]];
}

- (void) test_AWSIoTJob {
    [self validateSecureCodingForClass:[AWSIoTJob class]];
}

- (void) test_AWSIoTJobExecution {
    [self validateSecureCodingForClass:[AWSIoTJobExecution class]];
}

- (void) test_AWSIoTJobExecutionStatusDetails {
    [self validateSecureCodingForClass:[AWSIoTJobExecutionStatusDetails class]];
}

- (void) test_AWSIoTJobExecutionSummary {
    [self validateSecureCodingForClass:[AWSIoTJobExecutionSummary class]];
}

- (void) test_AWSIoTJobExecutionSummaryForJob {
    [self validateSecureCodingForClass:[AWSIoTJobExecutionSummaryForJob class]];
}

- (void) test_AWSIoTJobExecutionSummaryForThing {
    [self validateSecureCodingForClass:[AWSIoTJobExecutionSummaryForThing class]];
}

- (void) test_AWSIoTJobExecutionsRetryConfig {
    [self validateSecureCodingForClass:[AWSIoTJobExecutionsRetryConfig class]];
}

- (void) test_AWSIoTJobExecutionsRolloutConfig {
    [self validateSecureCodingForClass:[AWSIoTJobExecutionsRolloutConfig class]];
}

- (void) test_AWSIoTJobProcessDetails {
    [self validateSecureCodingForClass:[AWSIoTJobProcessDetails class]];
}

- (void) test_AWSIoTJobSummary {
    [self validateSecureCodingForClass:[AWSIoTJobSummary class]];
}

- (void) test_AWSIoTJobTemplateSummary {
    [self validateSecureCodingForClass:[AWSIoTJobTemplateSummary class]];
}

- (void) test_AWSIoTKafkaAction {
    [self validateSecureCodingForClass:[AWSIoTKafkaAction class]];
}

- (void) test_AWSIoTKeyPair {
    [self validateSecureCodingForClass:[AWSIoTKeyPair class]];
}

- (void) test_AWSIoTKinesisAction {
    [self validateSecureCodingForClass:[AWSIoTKinesisAction class]];
}

- (void) test_AWSIoTLambdaAction {
    [self validateSecureCodingForClass:[AWSIoTLambdaAction class]];
}

- (void) test_AWSIoTListActiveViolationsRequest {
    [self validateSecureCodingForClass:[AWSIoTListActiveViolationsRequest class]];
}

- (void) test_AWSIoTListActiveViolationsResponse {
    [self validateSecureCodingForClass:[AWSIoTListActiveViolationsResponse class]];
}

- (void) test_AWSIoTListAttachedPoliciesRequest {
    [self validateSecureCodingForClass:[AWSIoTListAttachedPoliciesRequest class]];
}

- (void) test_AWSIoTListAttachedPoliciesResponse {
    [self validateSecureCodingForClass:[AWSIoTListAttachedPoliciesResponse class]];
}

- (void) test_AWSIoTListAuditFindingsRequest {
    [self validateSecureCodingForClass:[AWSIoTListAuditFindingsRequest class]];
}

- (void) test_AWSIoTListAuditFindingsResponse {
    [self validateSecureCodingForClass:[AWSIoTListAuditFindingsResponse class]];
}

- (void) test_AWSIoTListAuditMitigationActionsExecutionsRequest {
    [self validateSecureCodingForClass:[AWSIoTListAuditMitigationActionsExecutionsRequest class]];
}

- (void) test_AWSIoTListAuditMitigationActionsExecutionsResponse {
    [self validateSecureCodingForClass:[AWSIoTListAuditMitigationActionsExecutionsResponse class]];
}

- (void) test_AWSIoTListAuditMitigationActionsTasksRequest {
    [self validateSecureCodingForClass:[AWSIoTListAuditMitigationActionsTasksRequest class]];
}

- (void) test_AWSIoTListAuditMitigationActionsTasksResponse {
    [self validateSecureCodingForClass:[AWSIoTListAuditMitigationActionsTasksResponse class]];
}

- (void) test_AWSIoTListAuditSuppressionsRequest {
    [self validateSecureCodingForClass:[AWSIoTListAuditSuppressionsRequest class]];
}

- (void) test_AWSIoTListAuditSuppressionsResponse {
    [self validateSecureCodingForClass:[AWSIoTListAuditSuppressionsResponse class]];
}

- (void) test_AWSIoTListAuditTasksRequest {
    [self validateSecureCodingForClass:[AWSIoTListAuditTasksRequest class]];
}

- (void) test_AWSIoTListAuditTasksResponse {
    [self validateSecureCodingForClass:[AWSIoTListAuditTasksResponse class]];
}

- (void) test_AWSIoTListAuthorizersRequest {
    [self validateSecureCodingForClass:[AWSIoTListAuthorizersRequest class]];
}

- (void) test_AWSIoTListAuthorizersResponse {
    [self validateSecureCodingForClass:[AWSIoTListAuthorizersResponse class]];
}

- (void) test_AWSIoTListBillingGroupsRequest {
    [self validateSecureCodingForClass:[AWSIoTListBillingGroupsRequest class]];
}

- (void) test_AWSIoTListBillingGroupsResponse {
    [self validateSecureCodingForClass:[AWSIoTListBillingGroupsResponse class]];
}

- (void) test_AWSIoTListCACertificatesRequest {
    [self validateSecureCodingForClass:[AWSIoTListCACertificatesRequest class]];
}

- (void) test_AWSIoTListCACertificatesResponse {
    [self validateSecureCodingForClass:[AWSIoTListCACertificatesResponse class]];
}

- (void) test_AWSIoTListCertificatesByCARequest {
    [self validateSecureCodingForClass:[AWSIoTListCertificatesByCARequest class]];
}

- (void) test_AWSIoTListCertificatesByCAResponse {
    [self validateSecureCodingForClass:[AWSIoTListCertificatesByCAResponse class]];
}

- (void) test_AWSIoTListCertificatesRequest {
    [self validateSecureCodingForClass:[AWSIoTListCertificatesRequest class]];
}

- (void) test_AWSIoTListCertificatesResponse {
    [self validateSecureCodingForClass:[AWSIoTListCertificatesResponse class]];
}

- (void) test_AWSIoTListCustomMetricsRequest {
    [self validateSecureCodingForClass:[AWSIoTListCustomMetricsRequest class]];
}

- (void) test_AWSIoTListCustomMetricsResponse {
    [self validateSecureCodingForClass:[AWSIoTListCustomMetricsResponse class]];
}

- (void) test_AWSIoTListDetectMitigationActionsExecutionsRequest {
    [self validateSecureCodingForClass:[AWSIoTListDetectMitigationActionsExecutionsRequest class]];
}

- (void) test_AWSIoTListDetectMitigationActionsExecutionsResponse {
    [self validateSecureCodingForClass:[AWSIoTListDetectMitigationActionsExecutionsResponse class]];
}

- (void) test_AWSIoTListDetectMitigationActionsTasksRequest {
    [self validateSecureCodingForClass:[AWSIoTListDetectMitigationActionsTasksRequest class]];
}

- (void) test_AWSIoTListDetectMitigationActionsTasksResponse {
    [self validateSecureCodingForClass:[AWSIoTListDetectMitigationActionsTasksResponse class]];
}

- (void) test_AWSIoTListDimensionsRequest {
    [self validateSecureCodingForClass:[AWSIoTListDimensionsRequest class]];
}

- (void) test_AWSIoTListDimensionsResponse {
    [self validateSecureCodingForClass:[AWSIoTListDimensionsResponse class]];
}

- (void) test_AWSIoTListDomainConfigurationsRequest {
    [self validateSecureCodingForClass:[AWSIoTListDomainConfigurationsRequest class]];
}

- (void) test_AWSIoTListDomainConfigurationsResponse {
    [self validateSecureCodingForClass:[AWSIoTListDomainConfigurationsResponse class]];
}

- (void) test_AWSIoTListFleetMetricsRequest {
    [self validateSecureCodingForClass:[AWSIoTListFleetMetricsRequest class]];
}

- (void) test_AWSIoTListFleetMetricsResponse {
    [self validateSecureCodingForClass:[AWSIoTListFleetMetricsResponse class]];
}

- (void) test_AWSIoTListIndicesRequest {
    [self validateSecureCodingForClass:[AWSIoTListIndicesRequest class]];
}

- (void) test_AWSIoTListIndicesResponse {
    [self validateSecureCodingForClass:[AWSIoTListIndicesResponse class]];
}

- (void) test_AWSIoTListJobExecutionsForJobRequest {
    [self validateSecureCodingForClass:[AWSIoTListJobExecutionsForJobRequest class]];
}

- (void) test_AWSIoTListJobExecutionsForJobResponse {
    [self validateSecureCodingForClass:[AWSIoTListJobExecutionsForJobResponse class]];
}

- (void) test_AWSIoTListJobExecutionsForThingRequest {
    [self validateSecureCodingForClass:[AWSIoTListJobExecutionsForThingRequest class]];
}

- (void) test_AWSIoTListJobExecutionsForThingResponse {
    [self validateSecureCodingForClass:[AWSIoTListJobExecutionsForThingResponse class]];
}

- (void) test_AWSIoTListJobTemplatesRequest {
    [self validateSecureCodingForClass:[AWSIoTListJobTemplatesRequest class]];
}

- (void) test_AWSIoTListJobTemplatesResponse {
    [self validateSecureCodingForClass:[AWSIoTListJobTemplatesResponse class]];
}

- (void) test_AWSIoTListJobsRequest {
    [self validateSecureCodingForClass:[AWSIoTListJobsRequest class]];
}

- (void) test_AWSIoTListJobsResponse {
    [self validateSecureCodingForClass:[AWSIoTListJobsResponse class]];
}

- (void) test_AWSIoTListManagedJobTemplatesRequest {
    [self validateSecureCodingForClass:[AWSIoTListManagedJobTemplatesRequest class]];
}

- (void) test_AWSIoTListManagedJobTemplatesResponse {
    [self validateSecureCodingForClass:[AWSIoTListManagedJobTemplatesResponse class]];
}

- (void) test_AWSIoTListMetricValuesRequest {
    [self validateSecureCodingForClass:[AWSIoTListMetricValuesRequest class]];
}

- (void) test_AWSIoTListMetricValuesResponse {
    [self validateSecureCodingForClass:[AWSIoTListMetricValuesResponse class]];
}

- (void) test_AWSIoTListMitigationActionsRequest {
    [self validateSecureCodingForClass:[AWSIoTListMitigationActionsRequest class]];
}

- (void) test_AWSIoTListMitigationActionsResponse {
    [self validateSecureCodingForClass:[AWSIoTListMitigationActionsResponse class]];
}

- (void) test_AWSIoTListOTAUpdatesRequest {
    [self validateSecureCodingForClass:[AWSIoTListOTAUpdatesRequest class]];
}

- (void) test_AWSIoTListOTAUpdatesResponse {
    [self validateSecureCodingForClass:[AWSIoTListOTAUpdatesResponse class]];
}

- (void) test_AWSIoTListOutgoingCertificatesRequest {
    [self validateSecureCodingForClass:[AWSIoTListOutgoingCertificatesRequest class]];
}

- (void) test_AWSIoTListOutgoingCertificatesResponse {
    [self validateSecureCodingForClass:[AWSIoTListOutgoingCertificatesResponse class]];
}

- (void) test_AWSIoTListPoliciesRequest {
    [self validateSecureCodingForClass:[AWSIoTListPoliciesRequest class]];
}

- (void) test_AWSIoTListPoliciesResponse {
    [self validateSecureCodingForClass:[AWSIoTListPoliciesResponse class]];
}

- (void) test_AWSIoTListPolicyPrincipalsRequest {
    [self validateSecureCodingForClass:[AWSIoTListPolicyPrincipalsRequest class]];
}

- (void) test_AWSIoTListPolicyPrincipalsResponse {
    [self validateSecureCodingForClass:[AWSIoTListPolicyPrincipalsResponse class]];
}

- (void) test_AWSIoTListPolicyVersionsRequest {
    [self validateSecureCodingForClass:[AWSIoTListPolicyVersionsRequest class]];
}

- (void) test_AWSIoTListPolicyVersionsResponse {
    [self validateSecureCodingForClass:[AWSIoTListPolicyVersionsResponse class]];
}

- (void) test_AWSIoTListPrincipalPoliciesRequest {
    [self validateSecureCodingForClass:[AWSIoTListPrincipalPoliciesRequest class]];
}

- (void) test_AWSIoTListPrincipalPoliciesResponse {
    [self validateSecureCodingForClass:[AWSIoTListPrincipalPoliciesResponse class]];
}

- (void) test_AWSIoTListPrincipalThingsRequest {
    [self validateSecureCodingForClass:[AWSIoTListPrincipalThingsRequest class]];
}

- (void) test_AWSIoTListPrincipalThingsResponse {
    [self validateSecureCodingForClass:[AWSIoTListPrincipalThingsResponse class]];
}

- (void) test_AWSIoTListProvisioningTemplateVersionsRequest {
    [self validateSecureCodingForClass:[AWSIoTListProvisioningTemplateVersionsRequest class]];
}

- (void) test_AWSIoTListProvisioningTemplateVersionsResponse {
    [self validateSecureCodingForClass:[AWSIoTListProvisioningTemplateVersionsResponse class]];
}

- (void) test_AWSIoTListProvisioningTemplatesRequest {
    [self validateSecureCodingForClass:[AWSIoTListProvisioningTemplatesRequest class]];
}

- (void) test_AWSIoTListProvisioningTemplatesResponse {
    [self validateSecureCodingForClass:[AWSIoTListProvisioningTemplatesResponse class]];
}

- (void) test_AWSIoTListRelatedResourcesForAuditFindingRequest {
    [self validateSecureCodingForClass:[AWSIoTListRelatedResourcesForAuditFindingRequest class]];
}

- (void) test_AWSIoTListRelatedResourcesForAuditFindingResponse {
    [self validateSecureCodingForClass:[AWSIoTListRelatedResourcesForAuditFindingResponse class]];
}

- (void) test_AWSIoTListRoleAliasesRequest {
    [self validateSecureCodingForClass:[AWSIoTListRoleAliasesRequest class]];
}

- (void) test_AWSIoTListRoleAliasesResponse {
    [self validateSecureCodingForClass:[AWSIoTListRoleAliasesResponse class]];
}

- (void) test_AWSIoTListScheduledAuditsRequest {
    [self validateSecureCodingForClass:[AWSIoTListScheduledAuditsRequest class]];
}

- (void) test_AWSIoTListScheduledAuditsResponse {
    [self validateSecureCodingForClass:[AWSIoTListScheduledAuditsResponse class]];
}

- (void) test_AWSIoTListSecurityProfilesForTargetRequest {
    [self validateSecureCodingForClass:[AWSIoTListSecurityProfilesForTargetRequest class]];
}

- (void) test_AWSIoTListSecurityProfilesForTargetResponse {
    [self validateSecureCodingForClass:[AWSIoTListSecurityProfilesForTargetResponse class]];
}

- (void) test_AWSIoTListSecurityProfilesRequest {
    [self validateSecureCodingForClass:[AWSIoTListSecurityProfilesRequest class]];
}

- (void) test_AWSIoTListSecurityProfilesResponse {
    [self validateSecureCodingForClass:[AWSIoTListSecurityProfilesResponse class]];
}

- (void) test_AWSIoTListStreamsRequest {
    [self validateSecureCodingForClass:[AWSIoTListStreamsRequest class]];
}

- (void) test_AWSIoTListStreamsResponse {
    [self validateSecureCodingForClass:[AWSIoTListStreamsResponse class]];
}

- (void) test_AWSIoTListTagsForResourceRequest {
    [self validateSecureCodingForClass:[AWSIoTListTagsForResourceRequest class]];
}

- (void) test_AWSIoTListTagsForResourceResponse {
    [self validateSecureCodingForClass:[AWSIoTListTagsForResourceResponse class]];
}

- (void) test_AWSIoTListTargetsForPolicyRequest {
    [self validateSecureCodingForClass:[AWSIoTListTargetsForPolicyRequest class]];
}

- (void) test_AWSIoTListTargetsForPolicyResponse {
    [self validateSecureCodingForClass:[AWSIoTListTargetsForPolicyResponse class]];
}

- (void) test_AWSIoTListTargetsForSecurityProfileRequest {
    [self validateSecureCodingForClass:[AWSIoTListTargetsForSecurityProfileRequest class]];
}

- (void) test_AWSIoTListTargetsForSecurityProfileResponse {
    [self validateSecureCodingForClass:[AWSIoTListTargetsForSecurityProfileResponse class]];
}

- (void) test_AWSIoTListThingGroupsForThingRequest {
    [self validateSecureCodingForClass:[AWSIoTListThingGroupsForThingRequest class]];
}

- (void) test_AWSIoTListThingGroupsForThingResponse {
    [self validateSecureCodingForClass:[AWSIoTListThingGroupsForThingResponse class]];
}

- (void) test_AWSIoTListThingGroupsRequest {
    [self validateSecureCodingForClass:[AWSIoTListThingGroupsRequest class]];
}

- (void) test_AWSIoTListThingGroupsResponse {
    [self validateSecureCodingForClass:[AWSIoTListThingGroupsResponse class]];
}

- (void) test_AWSIoTListThingPrincipalsRequest {
    [self validateSecureCodingForClass:[AWSIoTListThingPrincipalsRequest class]];
}

- (void) test_AWSIoTListThingPrincipalsResponse {
    [self validateSecureCodingForClass:[AWSIoTListThingPrincipalsResponse class]];
}

- (void) test_AWSIoTListThingRegistrationTaskReportsRequest {
    [self validateSecureCodingForClass:[AWSIoTListThingRegistrationTaskReportsRequest class]];
}

- (void) test_AWSIoTListThingRegistrationTaskReportsResponse {
    [self validateSecureCodingForClass:[AWSIoTListThingRegistrationTaskReportsResponse class]];
}

- (void) test_AWSIoTListThingRegistrationTasksRequest {
    [self validateSecureCodingForClass:[AWSIoTListThingRegistrationTasksRequest class]];
}

- (void) test_AWSIoTListThingRegistrationTasksResponse {
    [self validateSecureCodingForClass:[AWSIoTListThingRegistrationTasksResponse class]];
}

- (void) test_AWSIoTListThingTypesRequest {
    [self validateSecureCodingForClass:[AWSIoTListThingTypesRequest class]];
}

- (void) test_AWSIoTListThingTypesResponse {
    [self validateSecureCodingForClass:[AWSIoTListThingTypesResponse class]];
}

- (void) test_AWSIoTListThingsInBillingGroupRequest {
    [self validateSecureCodingForClass:[AWSIoTListThingsInBillingGroupRequest class]];
}

- (void) test_AWSIoTListThingsInBillingGroupResponse {
    [self validateSecureCodingForClass:[AWSIoTListThingsInBillingGroupResponse class]];
}

- (void) test_AWSIoTListThingsInThingGroupRequest {
    [self validateSecureCodingForClass:[AWSIoTListThingsInThingGroupRequest class]];
}

- (void) test_AWSIoTListThingsInThingGroupResponse {
    [self validateSecureCodingForClass:[AWSIoTListThingsInThingGroupResponse class]];
}

- (void) test_AWSIoTListThingsRequest {
    [self validateSecureCodingForClass:[AWSIoTListThingsRequest class]];
}

- (void) test_AWSIoTListThingsResponse {
    [self validateSecureCodingForClass:[AWSIoTListThingsResponse class]];
}

- (void) test_AWSIoTListTopicRuleDestinationsRequest {
    [self validateSecureCodingForClass:[AWSIoTListTopicRuleDestinationsRequest class]];
}

- (void) test_AWSIoTListTopicRuleDestinationsResponse {
    [self validateSecureCodingForClass:[AWSIoTListTopicRuleDestinationsResponse class]];
}

- (void) test_AWSIoTListTopicRulesRequest {
    [self validateSecureCodingForClass:[AWSIoTListTopicRulesRequest class]];
}

- (void) test_AWSIoTListTopicRulesResponse {
    [self validateSecureCodingForClass:[AWSIoTListTopicRulesResponse class]];
}

- (void) test_AWSIoTListV2LoggingLevelsRequest {
    [self validateSecureCodingForClass:[AWSIoTListV2LoggingLevelsRequest class]];
}

- (void) test_AWSIoTListV2LoggingLevelsResponse {
    [self validateSecureCodingForClass:[AWSIoTListV2LoggingLevelsResponse class]];
}

- (void) test_AWSIoTListViolationEventsRequest {
    [self validateSecureCodingForClass:[AWSIoTListViolationEventsRequest class]];
}

- (void) test_AWSIoTListViolationEventsResponse {
    [self validateSecureCodingForClass:[AWSIoTListViolationEventsResponse class]];
}

- (void) test_AWSIoTLocationAction {
    [self validateSecureCodingForClass:[AWSIoTLocationAction class]];
}

- (void) test_AWSIoTLocationTimestamp {
    [self validateSecureCodingForClass:[AWSIoTLocationTimestamp class]];
}

- (void) test_AWSIoTLogTarget {
    [self validateSecureCodingForClass:[AWSIoTLogTarget class]];
}

- (void) test_AWSIoTLogTargetConfiguration {
    [self validateSecureCodingForClass:[AWSIoTLogTargetConfiguration class]];
}

- (void) test_AWSIoTLoggingOptionsPayload {
    [self validateSecureCodingForClass:[AWSIoTLoggingOptionsPayload class]];
}

- (void) test_AWSIoTMachineLearningDetectionConfig {
    [self validateSecureCodingForClass:[AWSIoTMachineLearningDetectionConfig class]];
}

- (void) test_AWSIoTManagedJobTemplateSummary {
    [self validateSecureCodingForClass:[AWSIoTManagedJobTemplateSummary class]];
}

- (void) test_AWSIoTMetricDatum {
    [self validateSecureCodingForClass:[AWSIoTMetricDatum class]];
}

- (void) test_AWSIoTMetricDimension {
    [self validateSecureCodingForClass:[AWSIoTMetricDimension class]];
}

- (void) test_AWSIoTMetricToRetain {
    [self validateSecureCodingForClass:[AWSIoTMetricToRetain class]];
}

- (void) test_AWSIoTMetricValue {
    [self validateSecureCodingForClass:[AWSIoTMetricValue class]];
}

- (void) test_AWSIoTMitigationAction {
    [self validateSecureCodingForClass:[AWSIoTMitigationAction class]];
}

- (void) test_AWSIoTMitigationActionIdentifier {
    [self validateSecureCodingForClass:[AWSIoTMitigationActionIdentifier class]];
}

- (void) test_AWSIoTMitigationActionParams {
    [self validateSecureCodingForClass:[AWSIoTMitigationActionParams class]];
}

- (void) test_AWSIoTMqttContext {
    [self validateSecureCodingForClass:[AWSIoTMqttContext class]];
}

- (void) test_AWSIoTMqttHeaders {
    [self validateSecureCodingForClass:[AWSIoTMqttHeaders class]];
}

- (void) test_AWSIoTNonCompliantResource {
    [self validateSecureCodingForClass:[AWSIoTNonCompliantResource class]];
}

- (void) test_AWSIoTOTAUpdateFile {
    [self validateSecureCodingForClass:[AWSIoTOTAUpdateFile class]];
}

- (void) test_AWSIoTOTAUpdateInfo {
    [self validateSecureCodingForClass:[AWSIoTOTAUpdateInfo class]];
}

- (void) test_AWSIoTOTAUpdateSummary {
    [self validateSecureCodingForClass:[AWSIoTOTAUpdateSummary class]];
}

- (void) test_AWSIoTOpenSearchAction {
    [self validateSecureCodingForClass:[AWSIoTOpenSearchAction class]];
}

- (void) test_AWSIoTOutgoingCertificate {
    [self validateSecureCodingForClass:[AWSIoTOutgoingCertificate class]];
}

- (void) test_AWSIoTPercentPair {
    [self validateSecureCodingForClass:[AWSIoTPercentPair class]];
}

- (void) test_AWSIoTPolicy {
    [self validateSecureCodingForClass:[AWSIoTPolicy class]];
}

- (void) test_AWSIoTPolicyVersion {
    [self validateSecureCodingForClass:[AWSIoTPolicyVersion class]];
}

- (void) test_AWSIoTPolicyVersionIdentifier {
    [self validateSecureCodingForClass:[AWSIoTPolicyVersionIdentifier class]];
}

- (void) test_AWSIoTPresignedUrlConfig {
    [self validateSecureCodingForClass:[AWSIoTPresignedUrlConfig class]];
}

- (void) test_AWSIoTProvisioningHook {
    [self validateSecureCodingForClass:[AWSIoTProvisioningHook class]];
}

- (void) test_AWSIoTProvisioningTemplateSummary {
    [self validateSecureCodingForClass:[AWSIoTProvisioningTemplateSummary class]];
}

- (void) test_AWSIoTProvisioningTemplateVersionSummary {
    [self validateSecureCodingForClass:[AWSIoTProvisioningTemplateVersionSummary class]];
}

- (void) test_AWSIoTPublishFindingToSnsParams {
    [self validateSecureCodingForClass:[AWSIoTPublishFindingToSnsParams class]];
}

- (void) test_AWSIoTPutAssetPropertyValueEntry {
    [self validateSecureCodingForClass:[AWSIoTPutAssetPropertyValueEntry class]];
}

- (void) test_AWSIoTPutItemInput {
    [self validateSecureCodingForClass:[AWSIoTPutItemInput class]];
}

- (void) test_AWSIoTPutVerificationStateOnViolationRequest {
    [self validateSecureCodingForClass:[AWSIoTPutVerificationStateOnViolationRequest class]];
}

- (void) test_AWSIoTPutVerificationStateOnViolationResponse {
    [self validateSecureCodingForClass:[AWSIoTPutVerificationStateOnViolationResponse class]];
}

- (void) test_AWSIoTRateIncreaseCriteria {
    [self validateSecureCodingForClass:[AWSIoTRateIncreaseCriteria class]];
}

- (void) test_AWSIoTRegisterCACertificateRequest {
    [self validateSecureCodingForClass:[AWSIoTRegisterCACertificateRequest class]];
}

- (void) test_AWSIoTRegisterCACertificateResponse {
    [self validateSecureCodingForClass:[AWSIoTRegisterCACertificateResponse class]];
}

- (void) test_AWSIoTRegisterCertificateRequest {
    [self validateSecureCodingForClass:[AWSIoTRegisterCertificateRequest class]];
}

- (void) test_AWSIoTRegisterCertificateResponse {
    [self validateSecureCodingForClass:[AWSIoTRegisterCertificateResponse class]];
}

- (void) test_AWSIoTRegisterCertificateWithoutCARequest {
    [self validateSecureCodingForClass:[AWSIoTRegisterCertificateWithoutCARequest class]];
}

- (void) test_AWSIoTRegisterCertificateWithoutCAResponse {
    [self validateSecureCodingForClass:[AWSIoTRegisterCertificateWithoutCAResponse class]];
}

- (void) test_AWSIoTRegisterThingRequest {
    [self validateSecureCodingForClass:[AWSIoTRegisterThingRequest class]];
}

- (void) test_AWSIoTRegisterThingResponse {
    [self validateSecureCodingForClass:[AWSIoTRegisterThingResponse class]];
}

- (void) test_AWSIoTRegistrationConfig {
    [self validateSecureCodingForClass:[AWSIoTRegistrationConfig class]];
}

- (void) test_AWSIoTRejectCertificateTransferRequest {
    [self validateSecureCodingForClass:[AWSIoTRejectCertificateTransferRequest class]];
}

- (void) test_AWSIoTRelatedResource {
    [self validateSecureCodingForClass:[AWSIoTRelatedResource class]];
}

- (void) test_AWSIoTRemoveThingFromBillingGroupRequest {
    [self validateSecureCodingForClass:[AWSIoTRemoveThingFromBillingGroupRequest class]];
}

- (void) test_AWSIoTRemoveThingFromBillingGroupResponse {
    [self validateSecureCodingForClass:[AWSIoTRemoveThingFromBillingGroupResponse class]];
}

- (void) test_AWSIoTRemoveThingFromThingGroupRequest {
    [self validateSecureCodingForClass:[AWSIoTRemoveThingFromThingGroupRequest class]];
}

- (void) test_AWSIoTRemoveThingFromThingGroupResponse {
    [self validateSecureCodingForClass:[AWSIoTRemoveThingFromThingGroupResponse class]];
}

- (void) test_AWSIoTReplaceDefaultPolicyVersionParams {
    [self validateSecureCodingForClass:[AWSIoTReplaceDefaultPolicyVersionParams class]];
}

- (void) test_AWSIoTReplaceTopicRuleRequest {
    [self validateSecureCodingForClass:[AWSIoTReplaceTopicRuleRequest class]];
}

- (void) test_AWSIoTRepublishAction {
    [self validateSecureCodingForClass:[AWSIoTRepublishAction class]];
}

- (void) test_AWSIoTResourceIdentifier {
    [self validateSecureCodingForClass:[AWSIoTResourceIdentifier class]];
}

- (void) test_AWSIoTRetryCriteria {
    [self validateSecureCodingForClass:[AWSIoTRetryCriteria class]];
}

- (void) test_AWSIoTRoleAliasDescription {
    [self validateSecureCodingForClass:[AWSIoTRoleAliasDescription class]];
}

- (void) test_AWSIoTS3Action {
    [self validateSecureCodingForClass:[AWSIoTS3Action class]];
}

- (void) test_AWSIoTS3Destination {
    [self validateSecureCodingForClass:[AWSIoTS3Destination class]];
}

- (void) test_AWSIoTS3Location {
    [self validateSecureCodingForClass:[AWSIoTS3Location class]];
}

- (void) test_AWSIoTSalesforceAction {
    [self validateSecureCodingForClass:[AWSIoTSalesforceAction class]];
}

- (void) test_AWSIoTScheduledAuditMetadata {
    [self validateSecureCodingForClass:[AWSIoTScheduledAuditMetadata class]];
}

- (void) test_AWSIoTSchedulingConfig {
    [self validateSecureCodingForClass:[AWSIoTSchedulingConfig class]];
}

- (void) test_AWSIoTSearchIndexRequest {
    [self validateSecureCodingForClass:[AWSIoTSearchIndexRequest class]];
}

- (void) test_AWSIoTSearchIndexResponse {
    [self validateSecureCodingForClass:[AWSIoTSearchIndexResponse class]];
}

- (void) test_AWSIoTSecurityProfileIdentifier {
    [self validateSecureCodingForClass:[AWSIoTSecurityProfileIdentifier class]];
}

- (void) test_AWSIoTSecurityProfileTarget {
    [self validateSecureCodingForClass:[AWSIoTSecurityProfileTarget class]];
}

- (void) test_AWSIoTSecurityProfileTargetMapping {
    [self validateSecureCodingForClass:[AWSIoTSecurityProfileTargetMapping class]];
}

- (void) test_AWSIoTServerCertificateSummary {
    [self validateSecureCodingForClass:[AWSIoTServerCertificateSummary class]];
}

- (void) test_AWSIoTSetDefaultAuthorizerRequest {
    [self validateSecureCodingForClass:[AWSIoTSetDefaultAuthorizerRequest class]];
}

- (void) test_AWSIoTSetDefaultAuthorizerResponse {
    [self validateSecureCodingForClass:[AWSIoTSetDefaultAuthorizerResponse class]];
}

- (void) test_AWSIoTSetDefaultPolicyVersionRequest {
    [self validateSecureCodingForClass:[AWSIoTSetDefaultPolicyVersionRequest class]];
}

- (void) test_AWSIoTSetLoggingOptionsRequest {
    [self validateSecureCodingForClass:[AWSIoTSetLoggingOptionsRequest class]];
}

- (void) test_AWSIoTSetV2LoggingLevelRequest {
    [self validateSecureCodingForClass:[AWSIoTSetV2LoggingLevelRequest class]];
}

- (void) test_AWSIoTSetV2LoggingOptionsRequest {
    [self validateSecureCodingForClass:[AWSIoTSetV2LoggingOptionsRequest class]];
}

- (void) test_AWSIoTSigV4Authorization {
    [self validateSecureCodingForClass:[AWSIoTSigV4Authorization class]];
}

- (void) test_AWSIoTSigningProfileParameter {
    [self validateSecureCodingForClass:[AWSIoTSigningProfileParameter class]];
}

- (void) test_AWSIoTSnsAction {
    [self validateSecureCodingForClass:[AWSIoTSnsAction class]];
}

- (void) test_AWSIoTSqsAction {
    [self validateSecureCodingForClass:[AWSIoTSqsAction class]];
}

- (void) test_AWSIoTStartAuditMitigationActionsTaskRequest {
    [self validateSecureCodingForClass:[AWSIoTStartAuditMitigationActionsTaskRequest class]];
}

- (void) test_AWSIoTStartAuditMitigationActionsTaskResponse {
    [self validateSecureCodingForClass:[AWSIoTStartAuditMitigationActionsTaskResponse class]];
}

- (void) test_AWSIoTStartDetectMitigationActionsTaskRequest {
    [self validateSecureCodingForClass:[AWSIoTStartDetectMitigationActionsTaskRequest class]];
}

- (void) test_AWSIoTStartDetectMitigationActionsTaskResponse {
    [self validateSecureCodingForClass:[AWSIoTStartDetectMitigationActionsTaskResponse class]];
}

- (void) test_AWSIoTStartOnDemandAuditTaskRequest {
    [self validateSecureCodingForClass:[AWSIoTStartOnDemandAuditTaskRequest class]];
}

- (void) test_AWSIoTStartOnDemandAuditTaskResponse {
    [self validateSecureCodingForClass:[AWSIoTStartOnDemandAuditTaskResponse class]];
}

- (void) test_AWSIoTStartSigningJobParameter {
    [self validateSecureCodingForClass:[AWSIoTStartSigningJobParameter class]];
}

- (void) test_AWSIoTStartThingRegistrationTaskRequest {
    [self validateSecureCodingForClass:[AWSIoTStartThingRegistrationTaskRequest class]];
}

- (void) test_AWSIoTStartThingRegistrationTaskResponse {
    [self validateSecureCodingForClass:[AWSIoTStartThingRegistrationTaskResponse class]];
}

- (void) test_AWSIoTStatisticalThreshold {
    [self validateSecureCodingForClass:[AWSIoTStatisticalThreshold class]];
}

- (void) test_AWSIoTStatistics {
    [self validateSecureCodingForClass:[AWSIoTStatistics class]];
}

- (void) test_AWSIoTStepFunctionsAction {
    [self validateSecureCodingForClass:[AWSIoTStepFunctionsAction class]];
}

- (void) test_AWSIoTStopThingRegistrationTaskRequest {
    [self validateSecureCodingForClass:[AWSIoTStopThingRegistrationTaskRequest class]];
}

- (void) test_AWSIoTStopThingRegistrationTaskResponse {
    [self validateSecureCodingForClass:[AWSIoTStopThingRegistrationTaskResponse class]];
}

- (void) test_AWSIoTStream {
    [self validateSecureCodingForClass:[AWSIoTStream class]];
}

- (void) test_AWSIoTStreamFile {
    [self validateSecureCodingForClass:[AWSIoTStreamFile class]];
}

- (void) test_AWSIoTStreamInfo {
    [self validateSecureCodingForClass:[AWSIoTStreamInfo class]];
}

- (void) test_AWSIoTStreamSummary {
    [self validateSecureCodingForClass:[AWSIoTStreamSummary class]];
}

- (void) test_AWSIoTTag {
    [self validateSecureCodingForClass:[AWSIoTTag class]];
}

- (void) test_AWSIoTTagResourceRequest {
    [self validateSecureCodingForClass:[AWSIoTTagResourceRequest class]];
}

- (void) test_AWSIoTTagResourceResponse {
    [self validateSecureCodingForClass:[AWSIoTTagResourceResponse class]];
}

- (void) test_AWSIoTTaskStatistics {
    [self validateSecureCodingForClass:[AWSIoTTaskStatistics class]];
}

- (void) test_AWSIoTTaskStatisticsForAuditCheck {
    [self validateSecureCodingForClass:[AWSIoTTaskStatisticsForAuditCheck class]];
}

- (void) test_AWSIoTTermsAggregation {
    [self validateSecureCodingForClass:[AWSIoTTermsAggregation class]];
}

- (void) test_AWSIoTTestAuthorizationRequest {
    [self validateSecureCodingForClass:[AWSIoTTestAuthorizationRequest class]];
}

- (void) test_AWSIoTTestAuthorizationResponse {
    [self validateSecureCodingForClass:[AWSIoTTestAuthorizationResponse class]];
}

- (void) test_AWSIoTTestInvokeAuthorizerRequest {
    [self validateSecureCodingForClass:[AWSIoTTestInvokeAuthorizerRequest class]];
}

- (void) test_AWSIoTTestInvokeAuthorizerResponse {
    [self validateSecureCodingForClass:[AWSIoTTestInvokeAuthorizerResponse class]];
}

- (void) test_AWSIoTThingAttribute {
    [self validateSecureCodingForClass:[AWSIoTThingAttribute class]];
}

- (void) test_AWSIoTThingConnectivity {
    [self validateSecureCodingForClass:[AWSIoTThingConnectivity class]];
}

- (void) test_AWSIoTThingDocument {
    [self validateSecureCodingForClass:[AWSIoTThingDocument class]];
}

- (void) test_AWSIoTThingGroupDocument {
    [self validateSecureCodingForClass:[AWSIoTThingGroupDocument class]];
}

- (void) test_AWSIoTThingGroupIndexingConfiguration {
    [self validateSecureCodingForClass:[AWSIoTThingGroupIndexingConfiguration class]];
}

- (void) test_AWSIoTThingGroupMetadata {
    [self validateSecureCodingForClass:[AWSIoTThingGroupMetadata class]];
}

- (void) test_AWSIoTThingGroupProperties {
    [self validateSecureCodingForClass:[AWSIoTThingGroupProperties class]];
}

- (void) test_AWSIoTThingIndexingConfiguration {
    [self validateSecureCodingForClass:[AWSIoTThingIndexingConfiguration class]];
}

- (void) test_AWSIoTThingTypeDefinition {
    [self validateSecureCodingForClass:[AWSIoTThingTypeDefinition class]];
}

- (void) test_AWSIoTThingTypeMetadata {
    [self validateSecureCodingForClass:[AWSIoTThingTypeMetadata class]];
}

- (void) test_AWSIoTThingTypeProperties {
    [self validateSecureCodingForClass:[AWSIoTThingTypeProperties class]];
}

- (void) test_AWSIoTTimeoutConfig {
    [self validateSecureCodingForClass:[AWSIoTTimeoutConfig class]];
}

- (void) test_AWSIoTTimestreamAction {
    [self validateSecureCodingForClass:[AWSIoTTimestreamAction class]];
}

- (void) test_AWSIoTTimestreamDimension {
    [self validateSecureCodingForClass:[AWSIoTTimestreamDimension class]];
}

- (void) test_AWSIoTTimestreamTimestamp {
    [self validateSecureCodingForClass:[AWSIoTTimestreamTimestamp class]];
}

- (void) test_AWSIoTTlsContext {
    [self validateSecureCodingForClass:[AWSIoTTlsContext class]];
}

- (void) test_AWSIoTTopicRule {
    [self validateSecureCodingForClass:[AWSIoTTopicRule class]];
}

- (void) test_AWSIoTTopicRuleDestination {
    [self validateSecureCodingForClass:[AWSIoTTopicRuleDestination class]];
}

- (void) test_AWSIoTTopicRuleDestinationConfiguration {
    [self validateSecureCodingForClass:[AWSIoTTopicRuleDestinationConfiguration class]];
}

- (void) test_AWSIoTTopicRuleDestinationSummary {
    [self validateSecureCodingForClass:[AWSIoTTopicRuleDestinationSummary class]];
}

- (void) test_AWSIoTTopicRuleListItem {
    [self validateSecureCodingForClass:[AWSIoTTopicRuleListItem class]];
}

- (void) test_AWSIoTTopicRulePayload {
    [self validateSecureCodingForClass:[AWSIoTTopicRulePayload class]];
}

- (void) test_AWSIoTTransferCertificateRequest {
    [self validateSecureCodingForClass:[AWSIoTTransferCertificateRequest class]];
}

- (void) test_AWSIoTTransferCertificateResponse {
    [self validateSecureCodingForClass:[AWSIoTTransferCertificateResponse class]];
}

- (void) test_AWSIoTTransferData {
    [self validateSecureCodingForClass:[AWSIoTTransferData class]];
}

- (void) test_AWSIoTUntagResourceRequest {
    [self validateSecureCodingForClass:[AWSIoTUntagResourceRequest class]];
}

- (void) test_AWSIoTUntagResourceResponse {
    [self validateSecureCodingForClass:[AWSIoTUntagResourceResponse class]];
}

- (void) test_AWSIoTUpdateAccountAuditConfigurationRequest {
    [self validateSecureCodingForClass:[AWSIoTUpdateAccountAuditConfigurationRequest class]];
}

- (void) test_AWSIoTUpdateAccountAuditConfigurationResponse {
    [self validateSecureCodingForClass:[AWSIoTUpdateAccountAuditConfigurationResponse class]];
}

- (void) test_AWSIoTUpdateAuditSuppressionRequest {
    [self validateSecureCodingForClass:[AWSIoTUpdateAuditSuppressionRequest class]];
}

- (void) test_AWSIoTUpdateAuditSuppressionResponse {
    [self validateSecureCodingForClass:[AWSIoTUpdateAuditSuppressionResponse class]];
}

- (void) test_AWSIoTUpdateAuthorizerRequest {
    [self validateSecureCodingForClass:[AWSIoTUpdateAuthorizerRequest class]];
}

- (void) test_AWSIoTUpdateAuthorizerResponse {
    [self validateSecureCodingForClass:[AWSIoTUpdateAuthorizerResponse class]];
}

- (void) test_AWSIoTUpdateBillingGroupRequest {
    [self validateSecureCodingForClass:[AWSIoTUpdateBillingGroupRequest class]];
}

- (void) test_AWSIoTUpdateBillingGroupResponse {
    [self validateSecureCodingForClass:[AWSIoTUpdateBillingGroupResponse class]];
}

- (void) test_AWSIoTUpdateCACertificateParams {
    [self validateSecureCodingForClass:[AWSIoTUpdateCACertificateParams class]];
}

- (void) test_AWSIoTUpdateCACertificateRequest {
    [self validateSecureCodingForClass:[AWSIoTUpdateCACertificateRequest class]];
}

- (void) test_AWSIoTUpdateCertificateRequest {
    [self validateSecureCodingForClass:[AWSIoTUpdateCertificateRequest class]];
}

- (void) test_AWSIoTUpdateCustomMetricRequest {
    [self validateSecureCodingForClass:[AWSIoTUpdateCustomMetricRequest class]];
}

- (void) test_AWSIoTUpdateCustomMetricResponse {
    [self validateSecureCodingForClass:[AWSIoTUpdateCustomMetricResponse class]];
}

- (void) test_AWSIoTUpdateDeviceCertificateParams {
    [self validateSecureCodingForClass:[AWSIoTUpdateDeviceCertificateParams class]];
}

- (void) test_AWSIoTUpdateDimensionRequest {
    [self validateSecureCodingForClass:[AWSIoTUpdateDimensionRequest class]];
}

- (void) test_AWSIoTUpdateDimensionResponse {
    [self validateSecureCodingForClass:[AWSIoTUpdateDimensionResponse class]];
}

- (void) test_AWSIoTUpdateDomainConfigurationRequest {
    [self validateSecureCodingForClass:[AWSIoTUpdateDomainConfigurationRequest class]];
}

- (void) test_AWSIoTUpdateDomainConfigurationResponse {
    [self validateSecureCodingForClass:[AWSIoTUpdateDomainConfigurationResponse class]];
}

- (void) test_AWSIoTUpdateDynamicThingGroupRequest {
    [self validateSecureCodingForClass:[AWSIoTUpdateDynamicThingGroupRequest class]];
}

- (void) test_AWSIoTUpdateDynamicThingGroupResponse {
    [self validateSecureCodingForClass:[AWSIoTUpdateDynamicThingGroupResponse class]];
}

- (void) test_AWSIoTUpdateEventConfigurationsRequest {
    [self validateSecureCodingForClass:[AWSIoTUpdateEventConfigurationsRequest class]];
}

- (void) test_AWSIoTUpdateEventConfigurationsResponse {
    [self validateSecureCodingForClass:[AWSIoTUpdateEventConfigurationsResponse class]];
}

- (void) test_AWSIoTUpdateFleetMetricRequest {
    [self validateSecureCodingForClass:[AWSIoTUpdateFleetMetricRequest class]];
}

- (void) test_AWSIoTUpdateIndexingConfigurationRequest {
    [self validateSecureCodingForClass:[AWSIoTUpdateIndexingConfigurationRequest class]];
}

- (void) test_AWSIoTUpdateIndexingConfigurationResponse {
    [self validateSecureCodingForClass:[AWSIoTUpdateIndexingConfigurationResponse class]];
}

- (void) test_AWSIoTUpdateJobRequest {
    [self validateSecureCodingForClass:[AWSIoTUpdateJobRequest class]];
}

- (void) test_AWSIoTUpdateMitigationActionRequest {
    [self validateSecureCodingForClass:[AWSIoTUpdateMitigationActionRequest class]];
}

- (void) test_AWSIoTUpdateMitigationActionResponse {
    [self validateSecureCodingForClass:[AWSIoTUpdateMitigationActionResponse class]];
}

- (void) test_AWSIoTUpdateProvisioningTemplateRequest {
    [self validateSecureCodingForClass:[AWSIoTUpdateProvisioningTemplateRequest class]];
}

- (void) test_AWSIoTUpdateProvisioningTemplateResponse {
    [self validateSecureCodingForClass:[AWSIoTUpdateProvisioningTemplateResponse class]];
}

- (void) test_AWSIoTUpdateRoleAliasRequest {
    [self validateSecureCodingForClass:[AWSIoTUpdateRoleAliasRequest class]];
}

- (void) test_AWSIoTUpdateRoleAliasResponse {
    [self validateSecureCodingForClass:[AWSIoTUpdateRoleAliasResponse class]];
}

- (void) test_AWSIoTUpdateScheduledAuditRequest {
    [self validateSecureCodingForClass:[AWSIoTUpdateScheduledAuditRequest class]];
}

- (void) test_AWSIoTUpdateScheduledAuditResponse {
    [self validateSecureCodingForClass:[AWSIoTUpdateScheduledAuditResponse class]];
}

- (void) test_AWSIoTUpdateSecurityProfileRequest {
    [self validateSecureCodingForClass:[AWSIoTUpdateSecurityProfileRequest class]];
}

- (void) test_AWSIoTUpdateSecurityProfileResponse {
    [self validateSecureCodingForClass:[AWSIoTUpdateSecurityProfileResponse class]];
}

- (void) test_AWSIoTUpdateStreamRequest {
    [self validateSecureCodingForClass:[AWSIoTUpdateStreamRequest class]];
}

- (void) test_AWSIoTUpdateStreamResponse {
    [self validateSecureCodingForClass:[AWSIoTUpdateStreamResponse class]];
}

- (void) test_AWSIoTUpdateThingGroupRequest {
    [self validateSecureCodingForClass:[AWSIoTUpdateThingGroupRequest class]];
}

- (void) test_AWSIoTUpdateThingGroupResponse {
    [self validateSecureCodingForClass:[AWSIoTUpdateThingGroupResponse class]];
}

- (void) test_AWSIoTUpdateThingGroupsForThingRequest {
    [self validateSecureCodingForClass:[AWSIoTUpdateThingGroupsForThingRequest class]];
}

- (void) test_AWSIoTUpdateThingGroupsForThingResponse {
    [self validateSecureCodingForClass:[AWSIoTUpdateThingGroupsForThingResponse class]];
}

- (void) test_AWSIoTUpdateThingRequest {
    [self validateSecureCodingForClass:[AWSIoTUpdateThingRequest class]];
}

- (void) test_AWSIoTUpdateThingResponse {
    [self validateSecureCodingForClass:[AWSIoTUpdateThingResponse class]];
}

- (void) test_AWSIoTUpdateTopicRuleDestinationRequest {
    [self validateSecureCodingForClass:[AWSIoTUpdateTopicRuleDestinationRequest class]];
}

- (void) test_AWSIoTUpdateTopicRuleDestinationResponse {
    [self validateSecureCodingForClass:[AWSIoTUpdateTopicRuleDestinationResponse class]];
}

- (void) test_AWSIoTUserProperty {
    [self validateSecureCodingForClass:[AWSIoTUserProperty class]];
}

- (void) test_AWSIoTValidateSecurityProfileBehaviorsRequest {
    [self validateSecureCodingForClass:[AWSIoTValidateSecurityProfileBehaviorsRequest class]];
}

- (void) test_AWSIoTValidateSecurityProfileBehaviorsResponse {
    [self validateSecureCodingForClass:[AWSIoTValidateSecurityProfileBehaviorsResponse class]];
}

- (void) test_AWSIoTValidationError {
    [self validateSecureCodingForClass:[AWSIoTValidationError class]];
}

- (void) test_AWSIoTViolationEvent {
    [self validateSecureCodingForClass:[AWSIoTViolationEvent class]];
}

- (void) test_AWSIoTViolationEventAdditionalInfo {
    [self validateSecureCodingForClass:[AWSIoTViolationEventAdditionalInfo class]];
}

- (void) test_AWSIoTViolationEventOccurrenceRange {
    [self validateSecureCodingForClass:[AWSIoTViolationEventOccurrenceRange class]];
}

- (void) test_AWSIoTVpcDestinationConfiguration {
    [self validateSecureCodingForClass:[AWSIoTVpcDestinationConfiguration class]];
}

- (void) test_AWSIoTVpcDestinationProperties {
    [self validateSecureCodingForClass:[AWSIoTVpcDestinationProperties class]];
}

- (void) test_AWSIoTVpcDestinationSummary {
    [self validateSecureCodingForClass:[AWSIoTVpcDestinationSummary class]];
}

@end

