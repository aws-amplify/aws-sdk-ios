//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSConnectModel.h"

@interface AWSConnectNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSConnectActionSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectActivateEvaluationFormRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectActivateEvaluationFormResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectAgentConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectAgentContactReference API_AVAILABLE(ios(11));
- (void) test_AWSConnectAgentHierarchyGroup API_AVAILABLE(ios(11));
- (void) test_AWSConnectAgentHierarchyGroups API_AVAILABLE(ios(11));
- (void) test_AWSConnectAgentInfo API_AVAILABLE(ios(11));
- (void) test_AWSConnectAgentQualityMetrics API_AVAILABLE(ios(11));
- (void) test_AWSConnectAgentStatus API_AVAILABLE(ios(11));
- (void) test_AWSConnectAgentStatusReference API_AVAILABLE(ios(11));
- (void) test_AWSConnectAgentStatusSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectAgentsCriteria API_AVAILABLE(ios(11));
- (void) test_AWSConnectAllowedCapabilities API_AVAILABLE(ios(11));
- (void) test_AWSConnectAnalyticsDataAssociationResult API_AVAILABLE(ios(11));
- (void) test_AWSConnectAnswerMachineDetectionConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectApplication API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssignContactCategoryActionDefinition API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateAnalyticsDataSetRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateAnalyticsDataSetResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateApprovedOriginRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateBotRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateDefaultVocabularyRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateDefaultVocabularyResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateFlowRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateFlowResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateInstanceStorageConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateInstanceStorageConfigResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateLambdaFunctionRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateLexBotRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociatePhoneNumberContactFlowRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateQueueQuickConnectsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateRoutingProfileQueuesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateSecurityKeyRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateSecurityKeyResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateTrafficDistributionGroupUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateTrafficDistributionGroupUserResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateUserProficienciesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectAttachedFile API_AVAILABLE(ios(11));
- (void) test_AWSConnectAttachedFileError API_AVAILABLE(ios(11));
- (void) test_AWSConnectAttachmentReference API_AVAILABLE(ios(11));
- (void) test_AWSConnectAttendee API_AVAILABLE(ios(11));
- (void) test_AWSConnectAttribute API_AVAILABLE(ios(11));
- (void) test_AWSConnectAttributeAndCondition API_AVAILABLE(ios(11));
- (void) test_AWSConnectAttributeCondition API_AVAILABLE(ios(11));
- (void) test_AWSConnectAudioFeatures API_AVAILABLE(ios(11));
- (void) test_AWSConnectAudioQualityMetricsInfo API_AVAILABLE(ios(11));
- (void) test_AWSConnectAvailableNumberSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectBatchAssociateAnalyticsDataSetRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectBatchAssociateAnalyticsDataSetResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectBatchDisassociateAnalyticsDataSetRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectBatchDisassociateAnalyticsDataSetResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectBatchGetAttachedFileMetadataRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectBatchGetAttachedFileMetadataResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectBatchGetFlowAssociationRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectBatchGetFlowAssociationResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectBatchPutContactRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectBatchPutContactResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCampaign API_AVAILABLE(ios(11));
- (void) test_AWSConnectChatEvent API_AVAILABLE(ios(11));
- (void) test_AWSConnectChatMessage API_AVAILABLE(ios(11));
- (void) test_AWSConnectChatParticipantRoleConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectChatStreamingConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSConnectClaimPhoneNumberRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectClaimPhoneNumberResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectClaimedPhoneNumberSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectCompleteAttachedFileUploadRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCompleteAttachedFileUploadResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectConnectionData API_AVAILABLE(ios(11));
- (void) test_AWSConnectContact API_AVAILABLE(ios(11));
- (void) test_AWSConnectContactAnalysis API_AVAILABLE(ios(11));
- (void) test_AWSConnectContactDataRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectContactFilter API_AVAILABLE(ios(11));
- (void) test_AWSConnectContactFlow API_AVAILABLE(ios(11));
- (void) test_AWSConnectContactFlowModule API_AVAILABLE(ios(11));
- (void) test_AWSConnectContactFlowModuleSearchCriteria API_AVAILABLE(ios(11));
- (void) test_AWSConnectContactFlowModuleSearchFilter API_AVAILABLE(ios(11));
- (void) test_AWSConnectContactFlowModuleSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectContactFlowSearchCriteria API_AVAILABLE(ios(11));
- (void) test_AWSConnectContactFlowSearchFilter API_AVAILABLE(ios(11));
- (void) test_AWSConnectContactFlowSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectContactSearchSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectContactSearchSummaryAgentInfo API_AVAILABLE(ios(11));
- (void) test_AWSConnectContactSearchSummaryQueueInfo API_AVAILABLE(ios(11));
- (void) test_AWSConnectControlPlaneTagFilter API_AVAILABLE(ios(11));
- (void) test_AWSConnectControlPlaneUserAttributeFilter API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateAgentStatusRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateAgentStatusResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateCaseActionDefinition API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateContactFlowModuleRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateContactFlowModuleResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateContactFlowRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateContactFlowResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateEvaluationFormRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateEvaluationFormResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateHoursOfOperationRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateHoursOfOperationResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateInstanceRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateInstanceResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateIntegrationAssociationRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateIntegrationAssociationResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateParticipantRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateParticipantResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreatePersistentContactAssociationRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreatePersistentContactAssociationResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreatePredefinedAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreatePromptRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreatePromptResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateQueueRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateQueueResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateQuickConnectRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateQuickConnectResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateRoutingProfileRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateRoutingProfileResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateRuleRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateRuleResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateSecurityProfileRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateSecurityProfileResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateTaskTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateTaskTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateTrafficDistributionGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateTrafficDistributionGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateUseCaseRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateUseCaseResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateUserHierarchyGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateUserHierarchyGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateUserResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateViewRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateViewResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateViewVersionRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateViewVersionResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateVocabularyRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateVocabularyResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreatedByInfo API_AVAILABLE(ios(11));
- (void) test_AWSConnectCredentials API_AVAILABLE(ios(11));
- (void) test_AWSConnectCrossChannelBehavior API_AVAILABLE(ios(11));
- (void) test_AWSConnectCurrentMetric API_AVAILABLE(ios(11));
- (void) test_AWSConnectCurrentMetricData API_AVAILABLE(ios(11));
- (void) test_AWSConnectCurrentMetricResult API_AVAILABLE(ios(11));
- (void) test_AWSConnectCurrentMetricSortCriteria API_AVAILABLE(ios(11));
- (void) test_AWSConnectCustomer API_AVAILABLE(ios(11));
- (void) test_AWSConnectCustomerQualityMetrics API_AVAILABLE(ios(11));
- (void) test_AWSConnectCustomerVoiceActivity API_AVAILABLE(ios(11));
- (void) test_AWSConnectDateReference API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeactivateEvaluationFormRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeactivateEvaluationFormResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDefaultVocabulary API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteAttachedFileRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteAttachedFileResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteContactEvaluationRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteContactFlowModuleRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteContactFlowModuleResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteContactFlowRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteContactFlowResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteEvaluationFormRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteHoursOfOperationRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteInstanceRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteIntegrationAssociationRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeletePredefinedAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeletePromptRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteQueueRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteQuickConnectRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteRoutingProfileRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteRuleRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteSecurityProfileRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteTaskTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteTaskTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteTrafficDistributionGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteTrafficDistributionGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteUseCaseRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteUserHierarchyGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteViewRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteViewResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteViewVersionRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteViewVersionResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteVocabularyRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteVocabularyResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeAgentStatusRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeAgentStatusResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeContactEvaluationRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeContactEvaluationResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeContactFlowModuleRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeContactFlowModuleResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeContactFlowRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeContactFlowResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeContactRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeContactResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeEvaluationFormRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeEvaluationFormResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeHoursOfOperationRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeHoursOfOperationResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeInstanceAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeInstanceAttributeResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeInstanceRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeInstanceResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeInstanceStorageConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeInstanceStorageConfigResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribePhoneNumberRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribePhoneNumberResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribePredefinedAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribePredefinedAttributeResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribePromptRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribePromptResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeQueueRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeQueueResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeQuickConnectRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeQuickConnectResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeRoutingProfileRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeRoutingProfileResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeRuleRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeRuleResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeSecurityProfileRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeSecurityProfileResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeTrafficDistributionGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeTrafficDistributionGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeUserHierarchyGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeUserHierarchyGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeUserHierarchyStructureRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeUserHierarchyStructureResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeUserResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeViewRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeViewResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeVocabularyRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeVocabularyResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeviceInfo API_AVAILABLE(ios(11));
- (void) test_AWSConnectDimensions API_AVAILABLE(ios(11));
- (void) test_AWSConnectDisassociateAnalyticsDataSetRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDisassociateApprovedOriginRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDisassociateBotRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDisassociateFlowRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDisassociateFlowResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDisassociateInstanceStorageConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDisassociateLambdaFunctionRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDisassociateLexBotRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDisassociatePhoneNumberContactFlowRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDisassociateQueueQuickConnectsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDisassociateRoutingProfileQueuesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDisassociateSecurityKeyRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDisassociateTrafficDistributionGroupUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDisassociateTrafficDistributionGroupUserResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDisassociateUserProficienciesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDisconnectDetails API_AVAILABLE(ios(11));
- (void) test_AWSConnectDisconnectReason API_AVAILABLE(ios(11));
- (void) test_AWSConnectDismissUserContactRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDismissUserContactResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDistribution API_AVAILABLE(ios(11));
- (void) test_AWSConnectDownloadUrlMetadata API_AVAILABLE(ios(11));
- (void) test_AWSConnectEmailReference API_AVAILABLE(ios(11));
- (void) test_AWSConnectEmptyFieldValue API_AVAILABLE(ios(11));
- (void) test_AWSConnectEncryptionConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectEndAssociatedTasksActionDefinition API_AVAILABLE(ios(11));
- (void) test_AWSConnectEndpoint API_AVAILABLE(ios(11));
- (void) test_AWSConnectErrorResult API_AVAILABLE(ios(11));
- (void) test_AWSConnectEvaluation API_AVAILABLE(ios(11));
- (void) test_AWSConnectEvaluationAnswerData API_AVAILABLE(ios(11));
- (void) test_AWSConnectEvaluationAnswerInput API_AVAILABLE(ios(11));
- (void) test_AWSConnectEvaluationAnswerOutput API_AVAILABLE(ios(11));
- (void) test_AWSConnectEvaluationForm API_AVAILABLE(ios(11));
- (void) test_AWSConnectEvaluationFormContent API_AVAILABLE(ios(11));
- (void) test_AWSConnectEvaluationFormItem API_AVAILABLE(ios(11));
- (void) test_AWSConnectEvaluationFormNumericQuestionAutomation API_AVAILABLE(ios(11));
- (void) test_AWSConnectEvaluationFormNumericQuestionOption API_AVAILABLE(ios(11));
- (void) test_AWSConnectEvaluationFormNumericQuestionProperties API_AVAILABLE(ios(11));
- (void) test_AWSConnectEvaluationFormQuestion API_AVAILABLE(ios(11));
- (void) test_AWSConnectEvaluationFormQuestionTypeProperties API_AVAILABLE(ios(11));
- (void) test_AWSConnectEvaluationFormScoringStrategy API_AVAILABLE(ios(11));
- (void) test_AWSConnectEvaluationFormSection API_AVAILABLE(ios(11));
- (void) test_AWSConnectEvaluationFormSingleSelectQuestionAutomation API_AVAILABLE(ios(11));
- (void) test_AWSConnectEvaluationFormSingleSelectQuestionAutomationOption API_AVAILABLE(ios(11));
- (void) test_AWSConnectEvaluationFormSingleSelectQuestionOption API_AVAILABLE(ios(11));
- (void) test_AWSConnectEvaluationFormSingleSelectQuestionProperties API_AVAILABLE(ios(11));
- (void) test_AWSConnectEvaluationFormSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectEvaluationFormVersionSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectEvaluationMetadata API_AVAILABLE(ios(11));
- (void) test_AWSConnectEvaluationNote API_AVAILABLE(ios(11));
- (void) test_AWSConnectEvaluationScore API_AVAILABLE(ios(11));
- (void) test_AWSConnectEvaluationSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectEventBridgeActionDefinition API_AVAILABLE(ios(11));
- (void) test_AWSConnectExpiry API_AVAILABLE(ios(11));
- (void) test_AWSConnectExpression API_AVAILABLE(ios(11));
- (void) test_AWSConnectFailedRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectFieldValue API_AVAILABLE(ios(11));
- (void) test_AWSConnectFieldValueUnion API_AVAILABLE(ios(11));
- (void) test_AWSConnectFilterV2 API_AVAILABLE(ios(11));
- (void) test_AWSConnectFilters API_AVAILABLE(ios(11));
- (void) test_AWSConnectFlowAssociationSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetAttachedFileRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetAttachedFileResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetContactAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetContactAttributesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetCurrentMetricDataRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetCurrentMetricDataResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetCurrentUserDataRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetCurrentUserDataResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetFederationTokenRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetFederationTokenResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetFlowAssociationRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetFlowAssociationResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetMetricDataRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetMetricDataResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetMetricDataV2Request API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetMetricDataV2Response API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetPromptFileRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetPromptFileResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetTaskTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetTaskTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetTrafficDistributionRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetTrafficDistributionResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectHierarchyGroup API_AVAILABLE(ios(11));
- (void) test_AWSConnectHierarchyGroupCondition API_AVAILABLE(ios(11));
- (void) test_AWSConnectHierarchyGroupSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectHierarchyGroupSummaryReference API_AVAILABLE(ios(11));
- (void) test_AWSConnectHierarchyGroups API_AVAILABLE(ios(11));
- (void) test_AWSConnectHierarchyLevel API_AVAILABLE(ios(11));
- (void) test_AWSConnectHierarchyLevelUpdate API_AVAILABLE(ios(11));
- (void) test_AWSConnectHierarchyPath API_AVAILABLE(ios(11));
- (void) test_AWSConnectHierarchyPathReference API_AVAILABLE(ios(11));
- (void) test_AWSConnectHierarchyStructure API_AVAILABLE(ios(11));
- (void) test_AWSConnectHierarchyStructureUpdate API_AVAILABLE(ios(11));
- (void) test_AWSConnectHistoricalMetric API_AVAILABLE(ios(11));
- (void) test_AWSConnectHistoricalMetricData API_AVAILABLE(ios(11));
- (void) test_AWSConnectHistoricalMetricResult API_AVAILABLE(ios(11));
- (void) test_AWSConnectHoursOfOperation API_AVAILABLE(ios(11));
- (void) test_AWSConnectHoursOfOperationConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectHoursOfOperationSearchCriteria API_AVAILABLE(ios(11));
- (void) test_AWSConnectHoursOfOperationSearchFilter API_AVAILABLE(ios(11));
- (void) test_AWSConnectHoursOfOperationSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectHoursOfOperationTimeSlice API_AVAILABLE(ios(11));
- (void) test_AWSConnectImportPhoneNumberRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectImportPhoneNumberResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectInstance API_AVAILABLE(ios(11));
- (void) test_AWSConnectInstanceStatusReason API_AVAILABLE(ios(11));
- (void) test_AWSConnectInstanceStorageConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectInstanceSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectIntegrationAssociationSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectIntervalDetails API_AVAILABLE(ios(11));
- (void) test_AWSConnectInvalidRequestExceptionReason API_AVAILABLE(ios(11));
- (void) test_AWSConnectInvisibleFieldInfo API_AVAILABLE(ios(11));
- (void) test_AWSConnectKinesisFirehoseConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectKinesisStreamConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectKinesisVideoStreamConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectLexBot API_AVAILABLE(ios(11));
- (void) test_AWSConnectLexBotConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectLexV2Bot API_AVAILABLE(ios(11));
- (void) test_AWSConnectListAgentStatusRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListAgentStatusResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListAnalyticsDataAssociationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListAnalyticsDataAssociationsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListApprovedOriginsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListApprovedOriginsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListBotsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListBotsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListContactEvaluationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListContactEvaluationsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListContactFlowModulesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListContactFlowModulesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListContactFlowsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListContactFlowsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListContactReferencesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListContactReferencesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListDefaultVocabulariesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListDefaultVocabulariesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListEvaluationFormVersionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListEvaluationFormVersionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListEvaluationFormsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListEvaluationFormsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListFlowAssociationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListFlowAssociationsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListHoursOfOperationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListHoursOfOperationsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListInstanceAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListInstanceAttributesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListInstanceStorageConfigsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListInstanceStorageConfigsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListInstancesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListInstancesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListIntegrationAssociationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListIntegrationAssociationsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListLambdaFunctionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListLambdaFunctionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListLexBotsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListLexBotsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListPhoneNumbersRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListPhoneNumbersResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListPhoneNumbersSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectListPhoneNumbersV2Request API_AVAILABLE(ios(11));
- (void) test_AWSConnectListPhoneNumbersV2Response API_AVAILABLE(ios(11));
- (void) test_AWSConnectListPredefinedAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListPredefinedAttributesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListPromptsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListPromptsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListQueueQuickConnectsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListQueueQuickConnectsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListQueuesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListQueuesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListQuickConnectsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListQuickConnectsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListRealtimeContactAnalysisSegmentsV2Request API_AVAILABLE(ios(11));
- (void) test_AWSConnectListRealtimeContactAnalysisSegmentsV2Response API_AVAILABLE(ios(11));
- (void) test_AWSConnectListRoutingProfileQueuesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListRoutingProfileQueuesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListRoutingProfilesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListRoutingProfilesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListRulesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListRulesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListSecurityKeysRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListSecurityKeysResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListSecurityProfileApplicationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListSecurityProfileApplicationsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListSecurityProfilePermissionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListSecurityProfilePermissionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListSecurityProfilesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListSecurityProfilesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListTagsForResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListTagsForResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListTaskTemplatesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListTaskTemplatesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListTrafficDistributionGroupUsersRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListTrafficDistributionGroupUsersResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListTrafficDistributionGroupsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListTrafficDistributionGroupsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListUseCasesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListUseCasesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListUserHierarchyGroupsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListUserHierarchyGroupsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListUserProficienciesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListUserProficienciesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListUsersRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListUsersResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListViewVersionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListViewVersionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListViewsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListViewsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectMatchCriteria API_AVAILABLE(ios(11));
- (void) test_AWSConnectMediaConcurrency API_AVAILABLE(ios(11));
- (void) test_AWSConnectMediaPlacement API_AVAILABLE(ios(11));
- (void) test_AWSConnectMeeting API_AVAILABLE(ios(11));
- (void) test_AWSConnectMeetingFeaturesConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSConnectMetricDataV2 API_AVAILABLE(ios(11));
- (void) test_AWSConnectMetricFilterV2 API_AVAILABLE(ios(11));
- (void) test_AWSConnectMetricInterval API_AVAILABLE(ios(11));
- (void) test_AWSConnectMetricResultV2 API_AVAILABLE(ios(11));
- (void) test_AWSConnectMetricV2 API_AVAILABLE(ios(11));
- (void) test_AWSConnectMonitorContactRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectMonitorContactResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectLatestSessionDetails API_AVAILABLE(ios(11));
- (void) test_AWSConnectNotificationRecipientType API_AVAILABLE(ios(11));
- (void) test_AWSConnectNumberReference API_AVAILABLE(ios(11));
- (void) test_AWSConnectNumericQuestionPropertyValueAutomation API_AVAILABLE(ios(11));
- (void) test_AWSConnectOutboundCallerConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantCapabilities API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantDetails API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantDetailsToAdd API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantTimerConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantTimerValue API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantTokenCredentials API_AVAILABLE(ios(11));
- (void) test_AWSConnectPauseContactRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectPauseContactResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectPersistentChat API_AVAILABLE(ios(11));
- (void) test_AWSConnectPhoneNumberQuickConnectConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectPhoneNumberStatus API_AVAILABLE(ios(11));
- (void) test_AWSConnectPhoneNumberSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectPredefinedAttribute API_AVAILABLE(ios(11));
- (void) test_AWSConnectPredefinedAttributeSearchCriteria API_AVAILABLE(ios(11));
- (void) test_AWSConnectPredefinedAttributeSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectPredefinedAttributeValues API_AVAILABLE(ios(11));
- (void) test_AWSConnectProblemDetail API_AVAILABLE(ios(11));
- (void) test_AWSConnectPrompt API_AVAILABLE(ios(11));
- (void) test_AWSConnectPromptSearchCriteria API_AVAILABLE(ios(11));
- (void) test_AWSConnectPromptSearchFilter API_AVAILABLE(ios(11));
- (void) test_AWSConnectPromptSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectPropertyValidationExceptionProperty API_AVAILABLE(ios(11));
- (void) test_AWSConnectPutUserStatusRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectPutUserStatusResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectQualityMetrics API_AVAILABLE(ios(11));
- (void) test_AWSConnectQueue API_AVAILABLE(ios(11));
- (void) test_AWSConnectQueueInfo API_AVAILABLE(ios(11));
- (void) test_AWSConnectQueueQuickConnectConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectQueueReference API_AVAILABLE(ios(11));
- (void) test_AWSConnectQueueSearchCriteria API_AVAILABLE(ios(11));
- (void) test_AWSConnectQueueSearchFilter API_AVAILABLE(ios(11));
- (void) test_AWSConnectQueueSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectQuickConnect API_AVAILABLE(ios(11));
- (void) test_AWSConnectQuickConnectConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectQuickConnectSearchCriteria API_AVAILABLE(ios(11));
- (void) test_AWSConnectQuickConnectSearchFilter API_AVAILABLE(ios(11));
- (void) test_AWSConnectQuickConnectSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectReadOnlyFieldInfo API_AVAILABLE(ios(11));
- (void) test_AWSConnectRealTimeContactAnalysisAttachment API_AVAILABLE(ios(11));
- (void) test_AWSConnectRealTimeContactAnalysisCategoryDetails API_AVAILABLE(ios(11));
- (void) test_AWSConnectRealTimeContactAnalysisCharacterInterval API_AVAILABLE(ios(11));
- (void) test_AWSConnectRealTimeContactAnalysisIssueDetected API_AVAILABLE(ios(11));
- (void) test_AWSConnectRealTimeContactAnalysisPointOfInterest API_AVAILABLE(ios(11));
- (void) test_AWSConnectRealTimeContactAnalysisSegmentAttachments API_AVAILABLE(ios(11));
- (void) test_AWSConnectRealTimeContactAnalysisSegmentCategories API_AVAILABLE(ios(11));
- (void) test_AWSConnectRealTimeContactAnalysisSegmentEvent API_AVAILABLE(ios(11));
- (void) test_AWSConnectRealTimeContactAnalysisSegmentIssues API_AVAILABLE(ios(11));
- (void) test_AWSConnectRealTimeContactAnalysisSegmentTranscript API_AVAILABLE(ios(11));
- (void) test_AWSConnectRealTimeContactAnalysisTimeData API_AVAILABLE(ios(11));
- (void) test_AWSConnectRealTimeContactAnalysisTranscriptItemRedaction API_AVAILABLE(ios(11));
- (void) test_AWSConnectRealTimeContactAnalysisTranscriptItemWithCharacterOffsets API_AVAILABLE(ios(11));
- (void) test_AWSConnectRealTimeContactAnalysisTranscriptItemWithContent API_AVAILABLE(ios(11));
- (void) test_AWSConnectRealtimeContactAnalysisSegment API_AVAILABLE(ios(11));
- (void) test_AWSConnectReference API_AVAILABLE(ios(11));
- (void) test_AWSConnectReferenceSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectReleasePhoneNumberRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectReplicateInstanceRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectReplicateInstanceResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectRequiredFieldInfo API_AVAILABLE(ios(11));
- (void) test_AWSConnectResourceTagsSearchCriteria API_AVAILABLE(ios(11));
- (void) test_AWSConnectResumeContactRecordingRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectResumeContactRecordingResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectResumeContactRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectResumeContactResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectRoutingCriteria API_AVAILABLE(ios(11));
- (void) test_AWSConnectRoutingProfile API_AVAILABLE(ios(11));
- (void) test_AWSConnectRoutingProfileQueueConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectRoutingProfileQueueConfigSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectRoutingProfileQueueReference API_AVAILABLE(ios(11));
- (void) test_AWSConnectRoutingProfileReference API_AVAILABLE(ios(11));
- (void) test_AWSConnectRoutingProfileSearchCriteria API_AVAILABLE(ios(11));
- (void) test_AWSConnectRoutingProfileSearchFilter API_AVAILABLE(ios(11));
- (void) test_AWSConnectRoutingProfileSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectRule API_AVAILABLE(ios(11));
- (void) test_AWSConnectRuleAction API_AVAILABLE(ios(11));
- (void) test_AWSConnectRuleSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectRuleTriggerEventSource API_AVAILABLE(ios(11));
- (void) test_AWSConnectS3Config API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchAvailablePhoneNumbersRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchAvailablePhoneNumbersResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchContactFlowModulesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchContactFlowModulesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchContactFlowsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchContactFlowsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchContactsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchContactsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchContactsTimeRange API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchCriteria API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchHoursOfOperationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchHoursOfOperationsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchPredefinedAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchPredefinedAttributesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchPromptsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchPromptsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchQueuesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchQueuesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchQuickConnectsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchQuickConnectsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchResourceTagsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchResourceTagsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchRoutingProfilesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchRoutingProfilesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchSecurityProfilesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchSecurityProfilesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchUsersRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchUsersResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchVocabulariesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchVocabulariesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchableContactAttributes API_AVAILABLE(ios(11));
- (void) test_AWSConnectSearchableContactAttributesCriteria API_AVAILABLE(ios(11));
- (void) test_AWSConnectSecurityKey API_AVAILABLE(ios(11));
- (void) test_AWSConnectSecurityProfile API_AVAILABLE(ios(11));
- (void) test_AWSConnectSecurityProfileSearchCriteria API_AVAILABLE(ios(11));
- (void) test_AWSConnectSecurityProfileSearchSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectSecurityProfileSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectSecurityProfilesSearchFilter API_AVAILABLE(ios(11));
- (void) test_AWSConnectSegmentAttributeValue API_AVAILABLE(ios(11));
- (void) test_AWSConnectSendChatIntegrationEventRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectSendChatIntegrationEventResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectSendNotificationActionDefinition API_AVAILABLE(ios(11));
- (void) test_AWSConnectSignInConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectSignInDistribution API_AVAILABLE(ios(11));
- (void) test_AWSConnectSingleSelectQuestionRuleCategoryAutomation API_AVAILABLE(ios(11));
- (void) test_AWSConnectSort API_AVAILABLE(ios(11));
- (void) test_AWSConnectStartAttachedFileUploadRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectStartAttachedFileUploadResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectStartChatContactRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectStartChatContactResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectStartContactEvaluationRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectStartContactEvaluationResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectStartContactRecordingRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectStartContactRecordingResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectStartContactStreamingRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectStartContactStreamingResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectStartOutboundVoiceContactRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectStartOutboundVoiceContactResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectStartTaskContactRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectStartTaskContactResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectStartWebRTCContactRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectStartWebRTCContactResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectStep API_AVAILABLE(ios(11));
- (void) test_AWSConnectStopContactRecordingRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectStopContactRecordingResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectStopContactRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectStopContactResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectStopContactStreamingRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectStopContactStreamingResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectStringCondition API_AVAILABLE(ios(11));
- (void) test_AWSConnectStringReference API_AVAILABLE(ios(11));
- (void) test_AWSConnectSubmitAutoEvaluationActionDefinition API_AVAILABLE(ios(11));
- (void) test_AWSConnectSubmitContactEvaluationRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectSubmitContactEvaluationResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectSuccessfulRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectSuspendContactRecordingRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectSuspendContactRecordingResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectTagCondition API_AVAILABLE(ios(11));
- (void) test_AWSConnectTagContactRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectTagContactResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectTagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectTagSearchCondition API_AVAILABLE(ios(11));
- (void) test_AWSConnectTagSet API_AVAILABLE(ios(11));
- (void) test_AWSConnectTaskActionDefinition API_AVAILABLE(ios(11));
- (void) test_AWSConnectTaskTemplateConstraints API_AVAILABLE(ios(11));
- (void) test_AWSConnectTaskTemplateDefaultFieldValue API_AVAILABLE(ios(11));
- (void) test_AWSConnectTaskTemplateDefaults API_AVAILABLE(ios(11));
- (void) test_AWSConnectTaskTemplateField API_AVAILABLE(ios(11));
- (void) test_AWSConnectTaskTemplateFieldIdentifier API_AVAILABLE(ios(11));
- (void) test_AWSConnectTaskTemplateMetadata API_AVAILABLE(ios(11));
- (void) test_AWSConnectTelephonyConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectThreshold API_AVAILABLE(ios(11));
- (void) test_AWSConnectThresholdV2 API_AVAILABLE(ios(11));
- (void) test_AWSConnectTrafficDistributionGroup API_AVAILABLE(ios(11));
- (void) test_AWSConnectTrafficDistributionGroupSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectTrafficDistributionGroupUserSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectTranscript API_AVAILABLE(ios(11));
- (void) test_AWSConnectTranscriptCriteria API_AVAILABLE(ios(11));
- (void) test_AWSConnectTransferContactRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectTransferContactResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectUntagContactRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUntagContactResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectUntagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateAgentStatusRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateCaseActionDefinition API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateContactAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateContactAttributesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateContactEvaluationRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateContactEvaluationResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateContactFlowContentRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateContactFlowContentResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateContactFlowMetadataRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateContactFlowMetadataResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateContactFlowModuleContentRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateContactFlowModuleContentResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateContactFlowModuleMetadataRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateContactFlowModuleMetadataResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateContactFlowNameRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateContactFlowNameResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateContactRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateContactResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateContactRoutingDataRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateContactRoutingDataResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateContactScheduleRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateContactScheduleResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateEvaluationFormRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateEvaluationFormResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateHoursOfOperationRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateInstanceAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateInstanceStorageConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateParticipantRoleConfigChannelInfo API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateParticipantRoleConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateParticipantRoleConfigResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdatePhoneNumberMetadataRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdatePhoneNumberRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdatePhoneNumberResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdatePredefinedAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdatePromptRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdatePromptResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateQueueHoursOfOperationRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateQueueMaxContactsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateQueueNameRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateQueueOutboundCallerConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateQueueStatusRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateQuickConnectConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateQuickConnectNameRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateRoutingProfileAgentAvailabilityTimerRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateRoutingProfileConcurrencyRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateRoutingProfileDefaultOutboundQueueRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateRoutingProfileNameRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateRoutingProfileQueuesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateRuleRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateSecurityProfileRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateTaskTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateTaskTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateTrafficDistributionRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateTrafficDistributionResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateUserHierarchyGroupNameRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateUserHierarchyRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateUserHierarchyStructureRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateUserIdentityInfoRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateUserPhoneConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateUserProficienciesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateUserRoutingProfileRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateUserSecurityProfilesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateViewContentRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateViewContentResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateViewMetadataRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateViewMetadataResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectUploadUrlMetadata API_AVAILABLE(ios(11));
- (void) test_AWSConnectUrlReference API_AVAILABLE(ios(11));
- (void) test_AWSConnectUseCase API_AVAILABLE(ios(11));
- (void) test_AWSConnectUser API_AVAILABLE(ios(11));
- (void) test_AWSConnectUserData API_AVAILABLE(ios(11));
- (void) test_AWSConnectUserDataFilters API_AVAILABLE(ios(11));
- (void) test_AWSConnectUserIdentityInfo API_AVAILABLE(ios(11));
- (void) test_AWSConnectUserIdentityInfoLite API_AVAILABLE(ios(11));
- (void) test_AWSConnectUserPhoneConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectUserProficiency API_AVAILABLE(ios(11));
- (void) test_AWSConnectUserProficiencyDisassociate API_AVAILABLE(ios(11));
- (void) test_AWSConnectUserQuickConnectConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectUserReference API_AVAILABLE(ios(11));
- (void) test_AWSConnectUserSearchCriteria API_AVAILABLE(ios(11));
- (void) test_AWSConnectUserSearchFilter API_AVAILABLE(ios(11));
- (void) test_AWSConnectUserSearchSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectUserSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectView API_AVAILABLE(ios(11));
- (void) test_AWSConnectViewContent API_AVAILABLE(ios(11));
- (void) test_AWSConnectViewInputContent API_AVAILABLE(ios(11));
- (void) test_AWSConnectViewSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectViewVersionSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectVocabulary API_AVAILABLE(ios(11));
- (void) test_AWSConnectVocabularySummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectVoiceRecordingConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSConnectWisdomInfo API_AVAILABLE(ios(11));

@end

@implementation AWSConnectNSSecureCodingTests

- (void) test_AWSConnectActionSummary {
    [self validateSecureCodingForClass:[AWSConnectActionSummary class]];
}

- (void) test_AWSConnectActivateEvaluationFormRequest {
    [self validateSecureCodingForClass:[AWSConnectActivateEvaluationFormRequest class]];
}

- (void) test_AWSConnectActivateEvaluationFormResponse {
    [self validateSecureCodingForClass:[AWSConnectActivateEvaluationFormResponse class]];
}

- (void) test_AWSConnectAgentConfig {
    [self validateSecureCodingForClass:[AWSConnectAgentConfig class]];
}

- (void) test_AWSConnectAgentContactReference {
    [self validateSecureCodingForClass:[AWSConnectAgentContactReference class]];
}

- (void) test_AWSConnectAgentHierarchyGroup {
    [self validateSecureCodingForClass:[AWSConnectAgentHierarchyGroup class]];
}

- (void) test_AWSConnectAgentHierarchyGroups {
    [self validateSecureCodingForClass:[AWSConnectAgentHierarchyGroups class]];
}

- (void) test_AWSConnectAgentInfo {
    [self validateSecureCodingForClass:[AWSConnectAgentInfo class]];
}

- (void) test_AWSConnectAgentQualityMetrics {
    [self validateSecureCodingForClass:[AWSConnectAgentQualityMetrics class]];
}

- (void) test_AWSConnectAgentStatus {
    [self validateSecureCodingForClass:[AWSConnectAgentStatus class]];
}

- (void) test_AWSConnectAgentStatusReference {
    [self validateSecureCodingForClass:[AWSConnectAgentStatusReference class]];
}

- (void) test_AWSConnectAgentStatusSummary {
    [self validateSecureCodingForClass:[AWSConnectAgentStatusSummary class]];
}

- (void) test_AWSConnectAgentsCriteria {
    [self validateSecureCodingForClass:[AWSConnectAgentsCriteria class]];
}

- (void) test_AWSConnectAllowedCapabilities {
    [self validateSecureCodingForClass:[AWSConnectAllowedCapabilities class]];
}

- (void) test_AWSConnectAnalyticsDataAssociationResult {
    [self validateSecureCodingForClass:[AWSConnectAnalyticsDataAssociationResult class]];
}

- (void) test_AWSConnectAnswerMachineDetectionConfig {
    [self validateSecureCodingForClass:[AWSConnectAnswerMachineDetectionConfig class]];
}

- (void) test_AWSConnectApplication {
    [self validateSecureCodingForClass:[AWSConnectApplication class]];
}

- (void) test_AWSConnectAssignContactCategoryActionDefinition {
    [self validateSecureCodingForClass:[AWSConnectAssignContactCategoryActionDefinition class]];
}

- (void) test_AWSConnectAssociateAnalyticsDataSetRequest {
    [self validateSecureCodingForClass:[AWSConnectAssociateAnalyticsDataSetRequest class]];
}

- (void) test_AWSConnectAssociateAnalyticsDataSetResponse {
    [self validateSecureCodingForClass:[AWSConnectAssociateAnalyticsDataSetResponse class]];
}

- (void) test_AWSConnectAssociateApprovedOriginRequest {
    [self validateSecureCodingForClass:[AWSConnectAssociateApprovedOriginRequest class]];
}

- (void) test_AWSConnectAssociateBotRequest {
    [self validateSecureCodingForClass:[AWSConnectAssociateBotRequest class]];
}

- (void) test_AWSConnectAssociateDefaultVocabularyRequest {
    [self validateSecureCodingForClass:[AWSConnectAssociateDefaultVocabularyRequest class]];
}

- (void) test_AWSConnectAssociateDefaultVocabularyResponse {
    [self validateSecureCodingForClass:[AWSConnectAssociateDefaultVocabularyResponse class]];
}

- (void) test_AWSConnectAssociateFlowRequest {
    [self validateSecureCodingForClass:[AWSConnectAssociateFlowRequest class]];
}

- (void) test_AWSConnectAssociateFlowResponse {
    [self validateSecureCodingForClass:[AWSConnectAssociateFlowResponse class]];
}

- (void) test_AWSConnectAssociateInstanceStorageConfigRequest {
    [self validateSecureCodingForClass:[AWSConnectAssociateInstanceStorageConfigRequest class]];
}

- (void) test_AWSConnectAssociateInstanceStorageConfigResponse {
    [self validateSecureCodingForClass:[AWSConnectAssociateInstanceStorageConfigResponse class]];
}

- (void) test_AWSConnectAssociateLambdaFunctionRequest {
    [self validateSecureCodingForClass:[AWSConnectAssociateLambdaFunctionRequest class]];
}

- (void) test_AWSConnectAssociateLexBotRequest {
    [self validateSecureCodingForClass:[AWSConnectAssociateLexBotRequest class]];
}

- (void) test_AWSConnectAssociatePhoneNumberContactFlowRequest {
    [self validateSecureCodingForClass:[AWSConnectAssociatePhoneNumberContactFlowRequest class]];
}

- (void) test_AWSConnectAssociateQueueQuickConnectsRequest {
    [self validateSecureCodingForClass:[AWSConnectAssociateQueueQuickConnectsRequest class]];
}

- (void) test_AWSConnectAssociateRoutingProfileQueuesRequest {
    [self validateSecureCodingForClass:[AWSConnectAssociateRoutingProfileQueuesRequest class]];
}

- (void) test_AWSConnectAssociateSecurityKeyRequest {
    [self validateSecureCodingForClass:[AWSConnectAssociateSecurityKeyRequest class]];
}

- (void) test_AWSConnectAssociateSecurityKeyResponse {
    [self validateSecureCodingForClass:[AWSConnectAssociateSecurityKeyResponse class]];
}

- (void) test_AWSConnectAssociateTrafficDistributionGroupUserRequest {
    [self validateSecureCodingForClass:[AWSConnectAssociateTrafficDistributionGroupUserRequest class]];
}

- (void) test_AWSConnectAssociateTrafficDistributionGroupUserResponse {
    [self validateSecureCodingForClass:[AWSConnectAssociateTrafficDistributionGroupUserResponse class]];
}

- (void) test_AWSConnectAssociateUserProficienciesRequest {
    [self validateSecureCodingForClass:[AWSConnectAssociateUserProficienciesRequest class]];
}

- (void) test_AWSConnectAttachedFile {
    [self validateSecureCodingForClass:[AWSConnectAttachedFile class]];
}

- (void) test_AWSConnectAttachedFileError {
    [self validateSecureCodingForClass:[AWSConnectAttachedFileError class]];
}

- (void) test_AWSConnectAttachmentReference {
    [self validateSecureCodingForClass:[AWSConnectAttachmentReference class]];
}

- (void) test_AWSConnectAttendee {
    [self validateSecureCodingForClass:[AWSConnectAttendee class]];
}

- (void) test_AWSConnectAttribute {
    [self validateSecureCodingForClass:[AWSConnectAttribute class]];
}

- (void) test_AWSConnectAttributeAndCondition {
    [self validateSecureCodingForClass:[AWSConnectAttributeAndCondition class]];
}

- (void) test_AWSConnectAttributeCondition {
    [self validateSecureCodingForClass:[AWSConnectAttributeCondition class]];
}

- (void) test_AWSConnectAudioFeatures {
    [self validateSecureCodingForClass:[AWSConnectAudioFeatures class]];
}

- (void) test_AWSConnectAudioQualityMetricsInfo {
    [self validateSecureCodingForClass:[AWSConnectAudioQualityMetricsInfo class]];
}

- (void) test_AWSConnectAvailableNumberSummary {
    [self validateSecureCodingForClass:[AWSConnectAvailableNumberSummary class]];
}

- (void) test_AWSConnectBatchAssociateAnalyticsDataSetRequest {
    [self validateSecureCodingForClass:[AWSConnectBatchAssociateAnalyticsDataSetRequest class]];
}

- (void) test_AWSConnectBatchAssociateAnalyticsDataSetResponse {
    [self validateSecureCodingForClass:[AWSConnectBatchAssociateAnalyticsDataSetResponse class]];
}

- (void) test_AWSConnectBatchDisassociateAnalyticsDataSetRequest {
    [self validateSecureCodingForClass:[AWSConnectBatchDisassociateAnalyticsDataSetRequest class]];
}

- (void) test_AWSConnectBatchDisassociateAnalyticsDataSetResponse {
    [self validateSecureCodingForClass:[AWSConnectBatchDisassociateAnalyticsDataSetResponse class]];
}

- (void) test_AWSConnectBatchGetAttachedFileMetadataRequest {
    [self validateSecureCodingForClass:[AWSConnectBatchGetAttachedFileMetadataRequest class]];
}

- (void) test_AWSConnectBatchGetAttachedFileMetadataResponse {
    [self validateSecureCodingForClass:[AWSConnectBatchGetAttachedFileMetadataResponse class]];
}

- (void) test_AWSConnectBatchGetFlowAssociationRequest {
    [self validateSecureCodingForClass:[AWSConnectBatchGetFlowAssociationRequest class]];
}

- (void) test_AWSConnectBatchGetFlowAssociationResponse {
    [self validateSecureCodingForClass:[AWSConnectBatchGetFlowAssociationResponse class]];
}

- (void) test_AWSConnectBatchPutContactRequest {
    [self validateSecureCodingForClass:[AWSConnectBatchPutContactRequest class]];
}

- (void) test_AWSConnectBatchPutContactResponse {
    [self validateSecureCodingForClass:[AWSConnectBatchPutContactResponse class]];
}

- (void) test_AWSConnectCampaign {
    [self validateSecureCodingForClass:[AWSConnectCampaign class]];
}

- (void) test_AWSConnectChatEvent {
    [self validateSecureCodingForClass:[AWSConnectChatEvent class]];
}

- (void) test_AWSConnectChatMessage {
    [self validateSecureCodingForClass:[AWSConnectChatMessage class]];
}

- (void) test_AWSConnectChatParticipantRoleConfig {
    [self validateSecureCodingForClass:[AWSConnectChatParticipantRoleConfig class]];
}

- (void) test_AWSConnectChatStreamingConfiguration {
    [self validateSecureCodingForClass:[AWSConnectChatStreamingConfiguration class]];
}

- (void) test_AWSConnectClaimPhoneNumberRequest {
    [self validateSecureCodingForClass:[AWSConnectClaimPhoneNumberRequest class]];
}

- (void) test_AWSConnectClaimPhoneNumberResponse {
    [self validateSecureCodingForClass:[AWSConnectClaimPhoneNumberResponse class]];
}

- (void) test_AWSConnectClaimedPhoneNumberSummary {
    [self validateSecureCodingForClass:[AWSConnectClaimedPhoneNumberSummary class]];
}

- (void) test_AWSConnectCompleteAttachedFileUploadRequest {
    [self validateSecureCodingForClass:[AWSConnectCompleteAttachedFileUploadRequest class]];
}

- (void) test_AWSConnectCompleteAttachedFileUploadResponse {
    [self validateSecureCodingForClass:[AWSConnectCompleteAttachedFileUploadResponse class]];
}

- (void) test_AWSConnectConnectionData {
    [self validateSecureCodingForClass:[AWSConnectConnectionData class]];
}

- (void) test_AWSConnectContact {
    [self validateSecureCodingForClass:[AWSConnectContact class]];
}

- (void) test_AWSConnectContactAnalysis {
    [self validateSecureCodingForClass:[AWSConnectContactAnalysis class]];
}

- (void) test_AWSConnectContactDataRequest {
    [self validateSecureCodingForClass:[AWSConnectContactDataRequest class]];
}

- (void) test_AWSConnectContactFilter {
    [self validateSecureCodingForClass:[AWSConnectContactFilter class]];
}

- (void) test_AWSConnectContactFlow {
    [self validateSecureCodingForClass:[AWSConnectContactFlow class]];
}

- (void) test_AWSConnectContactFlowModule {
    [self validateSecureCodingForClass:[AWSConnectContactFlowModule class]];
}

- (void) test_AWSConnectContactFlowModuleSearchCriteria {
    [self validateSecureCodingForClass:[AWSConnectContactFlowModuleSearchCriteria class]];
}

- (void) test_AWSConnectContactFlowModuleSearchFilter {
    [self validateSecureCodingForClass:[AWSConnectContactFlowModuleSearchFilter class]];
}

- (void) test_AWSConnectContactFlowModuleSummary {
    [self validateSecureCodingForClass:[AWSConnectContactFlowModuleSummary class]];
}

- (void) test_AWSConnectContactFlowSearchCriteria {
    [self validateSecureCodingForClass:[AWSConnectContactFlowSearchCriteria class]];
}

- (void) test_AWSConnectContactFlowSearchFilter {
    [self validateSecureCodingForClass:[AWSConnectContactFlowSearchFilter class]];
}

- (void) test_AWSConnectContactFlowSummary {
    [self validateSecureCodingForClass:[AWSConnectContactFlowSummary class]];
}

- (void) test_AWSConnectContactSearchSummary {
    [self validateSecureCodingForClass:[AWSConnectContactSearchSummary class]];
}

- (void) test_AWSConnectContactSearchSummaryAgentInfo {
    [self validateSecureCodingForClass:[AWSConnectContactSearchSummaryAgentInfo class]];
}

- (void) test_AWSConnectContactSearchSummaryQueueInfo {
    [self validateSecureCodingForClass:[AWSConnectContactSearchSummaryQueueInfo class]];
}

- (void) test_AWSConnectControlPlaneTagFilter {
    [self validateSecureCodingForClass:[AWSConnectControlPlaneTagFilter class]];
}

- (void) test_AWSConnectControlPlaneUserAttributeFilter {
    [self validateSecureCodingForClass:[AWSConnectControlPlaneUserAttributeFilter class]];
}

- (void) test_AWSConnectCreateAgentStatusRequest {
    [self validateSecureCodingForClass:[AWSConnectCreateAgentStatusRequest class]];
}

- (void) test_AWSConnectCreateAgentStatusResponse {
    [self validateSecureCodingForClass:[AWSConnectCreateAgentStatusResponse class]];
}

- (void) test_AWSConnectCreateCaseActionDefinition {
    [self validateSecureCodingForClass:[AWSConnectCreateCaseActionDefinition class]];
}

- (void) test_AWSConnectCreateContactFlowModuleRequest {
    [self validateSecureCodingForClass:[AWSConnectCreateContactFlowModuleRequest class]];
}

- (void) test_AWSConnectCreateContactFlowModuleResponse {
    [self validateSecureCodingForClass:[AWSConnectCreateContactFlowModuleResponse class]];
}

- (void) test_AWSConnectCreateContactFlowRequest {
    [self validateSecureCodingForClass:[AWSConnectCreateContactFlowRequest class]];
}

- (void) test_AWSConnectCreateContactFlowResponse {
    [self validateSecureCodingForClass:[AWSConnectCreateContactFlowResponse class]];
}

- (void) test_AWSConnectCreateEvaluationFormRequest {
    [self validateSecureCodingForClass:[AWSConnectCreateEvaluationFormRequest class]];
}

- (void) test_AWSConnectCreateEvaluationFormResponse {
    [self validateSecureCodingForClass:[AWSConnectCreateEvaluationFormResponse class]];
}

- (void) test_AWSConnectCreateHoursOfOperationRequest {
    [self validateSecureCodingForClass:[AWSConnectCreateHoursOfOperationRequest class]];
}

- (void) test_AWSConnectCreateHoursOfOperationResponse {
    [self validateSecureCodingForClass:[AWSConnectCreateHoursOfOperationResponse class]];
}

- (void) test_AWSConnectCreateInstanceRequest {
    [self validateSecureCodingForClass:[AWSConnectCreateInstanceRequest class]];
}

- (void) test_AWSConnectCreateInstanceResponse {
    [self validateSecureCodingForClass:[AWSConnectCreateInstanceResponse class]];
}

- (void) test_AWSConnectCreateIntegrationAssociationRequest {
    [self validateSecureCodingForClass:[AWSConnectCreateIntegrationAssociationRequest class]];
}

- (void) test_AWSConnectCreateIntegrationAssociationResponse {
    [self validateSecureCodingForClass:[AWSConnectCreateIntegrationAssociationResponse class]];
}

- (void) test_AWSConnectCreateParticipantRequest {
    [self validateSecureCodingForClass:[AWSConnectCreateParticipantRequest class]];
}

- (void) test_AWSConnectCreateParticipantResponse {
    [self validateSecureCodingForClass:[AWSConnectCreateParticipantResponse class]];
}

- (void) test_AWSConnectCreatePersistentContactAssociationRequest {
    [self validateSecureCodingForClass:[AWSConnectCreatePersistentContactAssociationRequest class]];
}

- (void) test_AWSConnectCreatePersistentContactAssociationResponse {
    [self validateSecureCodingForClass:[AWSConnectCreatePersistentContactAssociationResponse class]];
}

- (void) test_AWSConnectCreatePredefinedAttributeRequest {
    [self validateSecureCodingForClass:[AWSConnectCreatePredefinedAttributeRequest class]];
}

- (void) test_AWSConnectCreatePromptRequest {
    [self validateSecureCodingForClass:[AWSConnectCreatePromptRequest class]];
}

- (void) test_AWSConnectCreatePromptResponse {
    [self validateSecureCodingForClass:[AWSConnectCreatePromptResponse class]];
}

- (void) test_AWSConnectCreateQueueRequest {
    [self validateSecureCodingForClass:[AWSConnectCreateQueueRequest class]];
}

- (void) test_AWSConnectCreateQueueResponse {
    [self validateSecureCodingForClass:[AWSConnectCreateQueueResponse class]];
}

- (void) test_AWSConnectCreateQuickConnectRequest {
    [self validateSecureCodingForClass:[AWSConnectCreateQuickConnectRequest class]];
}

- (void) test_AWSConnectCreateQuickConnectResponse {
    [self validateSecureCodingForClass:[AWSConnectCreateQuickConnectResponse class]];
}

- (void) test_AWSConnectCreateRoutingProfileRequest {
    [self validateSecureCodingForClass:[AWSConnectCreateRoutingProfileRequest class]];
}

- (void) test_AWSConnectCreateRoutingProfileResponse {
    [self validateSecureCodingForClass:[AWSConnectCreateRoutingProfileResponse class]];
}

- (void) test_AWSConnectCreateRuleRequest {
    [self validateSecureCodingForClass:[AWSConnectCreateRuleRequest class]];
}

- (void) test_AWSConnectCreateRuleResponse {
    [self validateSecureCodingForClass:[AWSConnectCreateRuleResponse class]];
}

- (void) test_AWSConnectCreateSecurityProfileRequest {
    [self validateSecureCodingForClass:[AWSConnectCreateSecurityProfileRequest class]];
}

- (void) test_AWSConnectCreateSecurityProfileResponse {
    [self validateSecureCodingForClass:[AWSConnectCreateSecurityProfileResponse class]];
}

- (void) test_AWSConnectCreateTaskTemplateRequest {
    [self validateSecureCodingForClass:[AWSConnectCreateTaskTemplateRequest class]];
}

- (void) test_AWSConnectCreateTaskTemplateResponse {
    [self validateSecureCodingForClass:[AWSConnectCreateTaskTemplateResponse class]];
}

- (void) test_AWSConnectCreateTrafficDistributionGroupRequest {
    [self validateSecureCodingForClass:[AWSConnectCreateTrafficDistributionGroupRequest class]];
}

- (void) test_AWSConnectCreateTrafficDistributionGroupResponse {
    [self validateSecureCodingForClass:[AWSConnectCreateTrafficDistributionGroupResponse class]];
}

- (void) test_AWSConnectCreateUseCaseRequest {
    [self validateSecureCodingForClass:[AWSConnectCreateUseCaseRequest class]];
}

- (void) test_AWSConnectCreateUseCaseResponse {
    [self validateSecureCodingForClass:[AWSConnectCreateUseCaseResponse class]];
}

- (void) test_AWSConnectCreateUserHierarchyGroupRequest {
    [self validateSecureCodingForClass:[AWSConnectCreateUserHierarchyGroupRequest class]];
}

- (void) test_AWSConnectCreateUserHierarchyGroupResponse {
    [self validateSecureCodingForClass:[AWSConnectCreateUserHierarchyGroupResponse class]];
}

- (void) test_AWSConnectCreateUserRequest {
    [self validateSecureCodingForClass:[AWSConnectCreateUserRequest class]];
}

- (void) test_AWSConnectCreateUserResponse {
    [self validateSecureCodingForClass:[AWSConnectCreateUserResponse class]];
}

- (void) test_AWSConnectCreateViewRequest {
    [self validateSecureCodingForClass:[AWSConnectCreateViewRequest class]];
}

- (void) test_AWSConnectCreateViewResponse {
    [self validateSecureCodingForClass:[AWSConnectCreateViewResponse class]];
}

- (void) test_AWSConnectCreateViewVersionRequest {
    [self validateSecureCodingForClass:[AWSConnectCreateViewVersionRequest class]];
}

- (void) test_AWSConnectCreateViewVersionResponse {
    [self validateSecureCodingForClass:[AWSConnectCreateViewVersionResponse class]];
}

- (void) test_AWSConnectCreateVocabularyRequest {
    [self validateSecureCodingForClass:[AWSConnectCreateVocabularyRequest class]];
}

- (void) test_AWSConnectCreateVocabularyResponse {
    [self validateSecureCodingForClass:[AWSConnectCreateVocabularyResponse class]];
}

- (void) test_AWSConnectCreatedByInfo {
    [self validateSecureCodingForClass:[AWSConnectCreatedByInfo class]];
}

- (void) test_AWSConnectCredentials {
    [self validateSecureCodingForClass:[AWSConnectCredentials class]];
}

- (void) test_AWSConnectCrossChannelBehavior {
    [self validateSecureCodingForClass:[AWSConnectCrossChannelBehavior class]];
}

- (void) test_AWSConnectCurrentMetric {
    [self validateSecureCodingForClass:[AWSConnectCurrentMetric class]];
}

- (void) test_AWSConnectCurrentMetricData {
    [self validateSecureCodingForClass:[AWSConnectCurrentMetricData class]];
}

- (void) test_AWSConnectCurrentMetricResult {
    [self validateSecureCodingForClass:[AWSConnectCurrentMetricResult class]];
}

- (void) test_AWSConnectCurrentMetricSortCriteria {
    [self validateSecureCodingForClass:[AWSConnectCurrentMetricSortCriteria class]];
}

- (void) test_AWSConnectCustomer {
    [self validateSecureCodingForClass:[AWSConnectCustomer class]];
}

- (void) test_AWSConnectCustomerQualityMetrics {
    [self validateSecureCodingForClass:[AWSConnectCustomerQualityMetrics class]];
}

- (void) test_AWSConnectCustomerVoiceActivity {
    [self validateSecureCodingForClass:[AWSConnectCustomerVoiceActivity class]];
}

- (void) test_AWSConnectDateReference {
    [self validateSecureCodingForClass:[AWSConnectDateReference class]];
}

- (void) test_AWSConnectDeactivateEvaluationFormRequest {
    [self validateSecureCodingForClass:[AWSConnectDeactivateEvaluationFormRequest class]];
}

- (void) test_AWSConnectDeactivateEvaluationFormResponse {
    [self validateSecureCodingForClass:[AWSConnectDeactivateEvaluationFormResponse class]];
}

- (void) test_AWSConnectDefaultVocabulary {
    [self validateSecureCodingForClass:[AWSConnectDefaultVocabulary class]];
}

- (void) test_AWSConnectDeleteAttachedFileRequest {
    [self validateSecureCodingForClass:[AWSConnectDeleteAttachedFileRequest class]];
}

- (void) test_AWSConnectDeleteAttachedFileResponse {
    [self validateSecureCodingForClass:[AWSConnectDeleteAttachedFileResponse class]];
}

- (void) test_AWSConnectDeleteContactEvaluationRequest {
    [self validateSecureCodingForClass:[AWSConnectDeleteContactEvaluationRequest class]];
}

- (void) test_AWSConnectDeleteContactFlowModuleRequest {
    [self validateSecureCodingForClass:[AWSConnectDeleteContactFlowModuleRequest class]];
}

- (void) test_AWSConnectDeleteContactFlowModuleResponse {
    [self validateSecureCodingForClass:[AWSConnectDeleteContactFlowModuleResponse class]];
}

- (void) test_AWSConnectDeleteContactFlowRequest {
    [self validateSecureCodingForClass:[AWSConnectDeleteContactFlowRequest class]];
}

- (void) test_AWSConnectDeleteContactFlowResponse {
    [self validateSecureCodingForClass:[AWSConnectDeleteContactFlowResponse class]];
}

- (void) test_AWSConnectDeleteEvaluationFormRequest {
    [self validateSecureCodingForClass:[AWSConnectDeleteEvaluationFormRequest class]];
}

- (void) test_AWSConnectDeleteHoursOfOperationRequest {
    [self validateSecureCodingForClass:[AWSConnectDeleteHoursOfOperationRequest class]];
}

- (void) test_AWSConnectDeleteInstanceRequest {
    [self validateSecureCodingForClass:[AWSConnectDeleteInstanceRequest class]];
}

- (void) test_AWSConnectDeleteIntegrationAssociationRequest {
    [self validateSecureCodingForClass:[AWSConnectDeleteIntegrationAssociationRequest class]];
}

- (void) test_AWSConnectDeletePredefinedAttributeRequest {
    [self validateSecureCodingForClass:[AWSConnectDeletePredefinedAttributeRequest class]];
}

- (void) test_AWSConnectDeletePromptRequest {
    [self validateSecureCodingForClass:[AWSConnectDeletePromptRequest class]];
}

- (void) test_AWSConnectDeleteQueueRequest {
    [self validateSecureCodingForClass:[AWSConnectDeleteQueueRequest class]];
}

- (void) test_AWSConnectDeleteQuickConnectRequest {
    [self validateSecureCodingForClass:[AWSConnectDeleteQuickConnectRequest class]];
}

- (void) test_AWSConnectDeleteRoutingProfileRequest {
    [self validateSecureCodingForClass:[AWSConnectDeleteRoutingProfileRequest class]];
}

- (void) test_AWSConnectDeleteRuleRequest {
    [self validateSecureCodingForClass:[AWSConnectDeleteRuleRequest class]];
}

- (void) test_AWSConnectDeleteSecurityProfileRequest {
    [self validateSecureCodingForClass:[AWSConnectDeleteSecurityProfileRequest class]];
}

- (void) test_AWSConnectDeleteTaskTemplateRequest {
    [self validateSecureCodingForClass:[AWSConnectDeleteTaskTemplateRequest class]];
}

- (void) test_AWSConnectDeleteTaskTemplateResponse {
    [self validateSecureCodingForClass:[AWSConnectDeleteTaskTemplateResponse class]];
}

- (void) test_AWSConnectDeleteTrafficDistributionGroupRequest {
    [self validateSecureCodingForClass:[AWSConnectDeleteTrafficDistributionGroupRequest class]];
}

- (void) test_AWSConnectDeleteTrafficDistributionGroupResponse {
    [self validateSecureCodingForClass:[AWSConnectDeleteTrafficDistributionGroupResponse class]];
}

- (void) test_AWSConnectDeleteUseCaseRequest {
    [self validateSecureCodingForClass:[AWSConnectDeleteUseCaseRequest class]];
}

- (void) test_AWSConnectDeleteUserHierarchyGroupRequest {
    [self validateSecureCodingForClass:[AWSConnectDeleteUserHierarchyGroupRequest class]];
}

- (void) test_AWSConnectDeleteUserRequest {
    [self validateSecureCodingForClass:[AWSConnectDeleteUserRequest class]];
}

- (void) test_AWSConnectDeleteViewRequest {
    [self validateSecureCodingForClass:[AWSConnectDeleteViewRequest class]];
}

- (void) test_AWSConnectDeleteViewResponse {
    [self validateSecureCodingForClass:[AWSConnectDeleteViewResponse class]];
}

- (void) test_AWSConnectDeleteViewVersionRequest {
    [self validateSecureCodingForClass:[AWSConnectDeleteViewVersionRequest class]];
}

- (void) test_AWSConnectDeleteViewVersionResponse {
    [self validateSecureCodingForClass:[AWSConnectDeleteViewVersionResponse class]];
}

- (void) test_AWSConnectDeleteVocabularyRequest {
    [self validateSecureCodingForClass:[AWSConnectDeleteVocabularyRequest class]];
}

- (void) test_AWSConnectDeleteVocabularyResponse {
    [self validateSecureCodingForClass:[AWSConnectDeleteVocabularyResponse class]];
}

- (void) test_AWSConnectDescribeAgentStatusRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribeAgentStatusRequest class]];
}

- (void) test_AWSConnectDescribeAgentStatusResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribeAgentStatusResponse class]];
}

- (void) test_AWSConnectDescribeContactEvaluationRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribeContactEvaluationRequest class]];
}

- (void) test_AWSConnectDescribeContactEvaluationResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribeContactEvaluationResponse class]];
}

- (void) test_AWSConnectDescribeContactFlowModuleRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribeContactFlowModuleRequest class]];
}

- (void) test_AWSConnectDescribeContactFlowModuleResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribeContactFlowModuleResponse class]];
}

- (void) test_AWSConnectDescribeContactFlowRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribeContactFlowRequest class]];
}

- (void) test_AWSConnectDescribeContactFlowResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribeContactFlowResponse class]];
}

- (void) test_AWSConnectDescribeContactRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribeContactRequest class]];
}

- (void) test_AWSConnectDescribeContactResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribeContactResponse class]];
}

- (void) test_AWSConnectDescribeEvaluationFormRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribeEvaluationFormRequest class]];
}

- (void) test_AWSConnectDescribeEvaluationFormResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribeEvaluationFormResponse class]];
}

- (void) test_AWSConnectDescribeHoursOfOperationRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribeHoursOfOperationRequest class]];
}

- (void) test_AWSConnectDescribeHoursOfOperationResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribeHoursOfOperationResponse class]];
}

- (void) test_AWSConnectDescribeInstanceAttributeRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribeInstanceAttributeRequest class]];
}

- (void) test_AWSConnectDescribeInstanceAttributeResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribeInstanceAttributeResponse class]];
}

- (void) test_AWSConnectDescribeInstanceRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribeInstanceRequest class]];
}

- (void) test_AWSConnectDescribeInstanceResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribeInstanceResponse class]];
}

- (void) test_AWSConnectDescribeInstanceStorageConfigRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribeInstanceStorageConfigRequest class]];
}

- (void) test_AWSConnectDescribeInstanceStorageConfigResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribeInstanceStorageConfigResponse class]];
}

- (void) test_AWSConnectDescribePhoneNumberRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribePhoneNumberRequest class]];
}

- (void) test_AWSConnectDescribePhoneNumberResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribePhoneNumberResponse class]];
}

- (void) test_AWSConnectDescribePredefinedAttributeRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribePredefinedAttributeRequest class]];
}

- (void) test_AWSConnectDescribePredefinedAttributeResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribePredefinedAttributeResponse class]];
}

- (void) test_AWSConnectDescribePromptRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribePromptRequest class]];
}

- (void) test_AWSConnectDescribePromptResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribePromptResponse class]];
}

- (void) test_AWSConnectDescribeQueueRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribeQueueRequest class]];
}

- (void) test_AWSConnectDescribeQueueResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribeQueueResponse class]];
}

- (void) test_AWSConnectDescribeQuickConnectRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribeQuickConnectRequest class]];
}

- (void) test_AWSConnectDescribeQuickConnectResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribeQuickConnectResponse class]];
}

- (void) test_AWSConnectDescribeRoutingProfileRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribeRoutingProfileRequest class]];
}

- (void) test_AWSConnectDescribeRoutingProfileResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribeRoutingProfileResponse class]];
}

- (void) test_AWSConnectDescribeRuleRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribeRuleRequest class]];
}

- (void) test_AWSConnectDescribeRuleResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribeRuleResponse class]];
}

- (void) test_AWSConnectDescribeSecurityProfileRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribeSecurityProfileRequest class]];
}

- (void) test_AWSConnectDescribeSecurityProfileResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribeSecurityProfileResponse class]];
}

- (void) test_AWSConnectDescribeTrafficDistributionGroupRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribeTrafficDistributionGroupRequest class]];
}

- (void) test_AWSConnectDescribeTrafficDistributionGroupResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribeTrafficDistributionGroupResponse class]];
}

- (void) test_AWSConnectDescribeUserHierarchyGroupRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribeUserHierarchyGroupRequest class]];
}

- (void) test_AWSConnectDescribeUserHierarchyGroupResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribeUserHierarchyGroupResponse class]];
}

- (void) test_AWSConnectDescribeUserHierarchyStructureRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribeUserHierarchyStructureRequest class]];
}

- (void) test_AWSConnectDescribeUserHierarchyStructureResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribeUserHierarchyStructureResponse class]];
}

- (void) test_AWSConnectDescribeUserRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribeUserRequest class]];
}

- (void) test_AWSConnectDescribeUserResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribeUserResponse class]];
}

- (void) test_AWSConnectDescribeViewRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribeViewRequest class]];
}

- (void) test_AWSConnectDescribeViewResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribeViewResponse class]];
}

- (void) test_AWSConnectDescribeVocabularyRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribeVocabularyRequest class]];
}

- (void) test_AWSConnectDescribeVocabularyResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribeVocabularyResponse class]];
}

- (void) test_AWSConnectDeviceInfo {
    [self validateSecureCodingForClass:[AWSConnectDeviceInfo class]];
}

- (void) test_AWSConnectDimensions {
    [self validateSecureCodingForClass:[AWSConnectDimensions class]];
}

- (void) test_AWSConnectDisassociateAnalyticsDataSetRequest {
    [self validateSecureCodingForClass:[AWSConnectDisassociateAnalyticsDataSetRequest class]];
}

- (void) test_AWSConnectDisassociateApprovedOriginRequest {
    [self validateSecureCodingForClass:[AWSConnectDisassociateApprovedOriginRequest class]];
}

- (void) test_AWSConnectDisassociateBotRequest {
    [self validateSecureCodingForClass:[AWSConnectDisassociateBotRequest class]];
}

- (void) test_AWSConnectDisassociateFlowRequest {
    [self validateSecureCodingForClass:[AWSConnectDisassociateFlowRequest class]];
}

- (void) test_AWSConnectDisassociateFlowResponse {
    [self validateSecureCodingForClass:[AWSConnectDisassociateFlowResponse class]];
}

- (void) test_AWSConnectDisassociateInstanceStorageConfigRequest {
    [self validateSecureCodingForClass:[AWSConnectDisassociateInstanceStorageConfigRequest class]];
}

- (void) test_AWSConnectDisassociateLambdaFunctionRequest {
    [self validateSecureCodingForClass:[AWSConnectDisassociateLambdaFunctionRequest class]];
}

- (void) test_AWSConnectDisassociateLexBotRequest {
    [self validateSecureCodingForClass:[AWSConnectDisassociateLexBotRequest class]];
}

- (void) test_AWSConnectDisassociatePhoneNumberContactFlowRequest {
    [self validateSecureCodingForClass:[AWSConnectDisassociatePhoneNumberContactFlowRequest class]];
}

- (void) test_AWSConnectDisassociateQueueQuickConnectsRequest {
    [self validateSecureCodingForClass:[AWSConnectDisassociateQueueQuickConnectsRequest class]];
}

- (void) test_AWSConnectDisassociateRoutingProfileQueuesRequest {
    [self validateSecureCodingForClass:[AWSConnectDisassociateRoutingProfileQueuesRequest class]];
}

- (void) test_AWSConnectDisassociateSecurityKeyRequest {
    [self validateSecureCodingForClass:[AWSConnectDisassociateSecurityKeyRequest class]];
}

- (void) test_AWSConnectDisassociateTrafficDistributionGroupUserRequest {
    [self validateSecureCodingForClass:[AWSConnectDisassociateTrafficDistributionGroupUserRequest class]];
}

- (void) test_AWSConnectDisassociateTrafficDistributionGroupUserResponse {
    [self validateSecureCodingForClass:[AWSConnectDisassociateTrafficDistributionGroupUserResponse class]];
}

- (void) test_AWSConnectDisassociateUserProficienciesRequest {
    [self validateSecureCodingForClass:[AWSConnectDisassociateUserProficienciesRequest class]];
}

- (void) test_AWSConnectDisconnectDetails {
    [self validateSecureCodingForClass:[AWSConnectDisconnectDetails class]];
}

- (void) test_AWSConnectDisconnectReason {
    [self validateSecureCodingForClass:[AWSConnectDisconnectReason class]];
}

- (void) test_AWSConnectDismissUserContactRequest {
    [self validateSecureCodingForClass:[AWSConnectDismissUserContactRequest class]];
}

- (void) test_AWSConnectDismissUserContactResponse {
    [self validateSecureCodingForClass:[AWSConnectDismissUserContactResponse class]];
}

- (void) test_AWSConnectDistribution {
    [self validateSecureCodingForClass:[AWSConnectDistribution class]];
}

- (void) test_AWSConnectDownloadUrlMetadata {
    [self validateSecureCodingForClass:[AWSConnectDownloadUrlMetadata class]];
}

- (void) test_AWSConnectEmailReference {
    [self validateSecureCodingForClass:[AWSConnectEmailReference class]];
}

- (void) test_AWSConnectEmptyFieldValue {
    [self validateSecureCodingForClass:[AWSConnectEmptyFieldValue class]];
}

- (void) test_AWSConnectEncryptionConfig {
    [self validateSecureCodingForClass:[AWSConnectEncryptionConfig class]];
}

- (void) test_AWSConnectEndAssociatedTasksActionDefinition {
    [self validateSecureCodingForClass:[AWSConnectEndAssociatedTasksActionDefinition class]];
}

- (void) test_AWSConnectEndpoint {
    [self validateSecureCodingForClass:[AWSConnectEndpoint class]];
}

- (void) test_AWSConnectErrorResult {
    [self validateSecureCodingForClass:[AWSConnectErrorResult class]];
}

- (void) test_AWSConnectEvaluation {
    [self validateSecureCodingForClass:[AWSConnectEvaluation class]];
}

- (void) test_AWSConnectEvaluationAnswerData {
    [self validateSecureCodingForClass:[AWSConnectEvaluationAnswerData class]];
}

- (void) test_AWSConnectEvaluationAnswerInput {
    [self validateSecureCodingForClass:[AWSConnectEvaluationAnswerInput class]];
}

- (void) test_AWSConnectEvaluationAnswerOutput {
    [self validateSecureCodingForClass:[AWSConnectEvaluationAnswerOutput class]];
}

- (void) test_AWSConnectEvaluationForm {
    [self validateSecureCodingForClass:[AWSConnectEvaluationForm class]];
}

- (void) test_AWSConnectEvaluationFormContent {
    [self validateSecureCodingForClass:[AWSConnectEvaluationFormContent class]];
}

- (void) test_AWSConnectEvaluationFormItem {
    [self validateSecureCodingForClass:[AWSConnectEvaluationFormItem class]];
}

- (void) test_AWSConnectEvaluationFormNumericQuestionAutomation {
    [self validateSecureCodingForClass:[AWSConnectEvaluationFormNumericQuestionAutomation class]];
}

- (void) test_AWSConnectEvaluationFormNumericQuestionOption {
    [self validateSecureCodingForClass:[AWSConnectEvaluationFormNumericQuestionOption class]];
}

- (void) test_AWSConnectEvaluationFormNumericQuestionProperties {
    [self validateSecureCodingForClass:[AWSConnectEvaluationFormNumericQuestionProperties class]];
}

- (void) test_AWSConnectEvaluationFormQuestion {
    [self validateSecureCodingForClass:[AWSConnectEvaluationFormQuestion class]];
}

- (void) test_AWSConnectEvaluationFormQuestionTypeProperties {
    [self validateSecureCodingForClass:[AWSConnectEvaluationFormQuestionTypeProperties class]];
}

- (void) test_AWSConnectEvaluationFormScoringStrategy {
    [self validateSecureCodingForClass:[AWSConnectEvaluationFormScoringStrategy class]];
}

- (void) test_AWSConnectEvaluationFormSection {
    [self validateSecureCodingForClass:[AWSConnectEvaluationFormSection class]];
}

- (void) test_AWSConnectEvaluationFormSingleSelectQuestionAutomation {
    [self validateSecureCodingForClass:[AWSConnectEvaluationFormSingleSelectQuestionAutomation class]];
}

- (void) test_AWSConnectEvaluationFormSingleSelectQuestionAutomationOption {
    [self validateSecureCodingForClass:[AWSConnectEvaluationFormSingleSelectQuestionAutomationOption class]];
}

- (void) test_AWSConnectEvaluationFormSingleSelectQuestionOption {
    [self validateSecureCodingForClass:[AWSConnectEvaluationFormSingleSelectQuestionOption class]];
}

- (void) test_AWSConnectEvaluationFormSingleSelectQuestionProperties {
    [self validateSecureCodingForClass:[AWSConnectEvaluationFormSingleSelectQuestionProperties class]];
}

- (void) test_AWSConnectEvaluationFormSummary {
    [self validateSecureCodingForClass:[AWSConnectEvaluationFormSummary class]];
}

- (void) test_AWSConnectEvaluationFormVersionSummary {
    [self validateSecureCodingForClass:[AWSConnectEvaluationFormVersionSummary class]];
}

- (void) test_AWSConnectEvaluationMetadata {
    [self validateSecureCodingForClass:[AWSConnectEvaluationMetadata class]];
}

- (void) test_AWSConnectEvaluationNote {
    [self validateSecureCodingForClass:[AWSConnectEvaluationNote class]];
}

- (void) test_AWSConnectEvaluationScore {
    [self validateSecureCodingForClass:[AWSConnectEvaluationScore class]];
}

- (void) test_AWSConnectEvaluationSummary {
    [self validateSecureCodingForClass:[AWSConnectEvaluationSummary class]];
}

- (void) test_AWSConnectEventBridgeActionDefinition {
    [self validateSecureCodingForClass:[AWSConnectEventBridgeActionDefinition class]];
}

- (void) test_AWSConnectExpiry {
    [self validateSecureCodingForClass:[AWSConnectExpiry class]];
}

- (void) test_AWSConnectExpression {
    [self validateSecureCodingForClass:[AWSConnectExpression class]];
}

- (void) test_AWSConnectFailedRequest {
    [self validateSecureCodingForClass:[AWSConnectFailedRequest class]];
}

- (void) test_AWSConnectFieldValue {
    [self validateSecureCodingForClass:[AWSConnectFieldValue class]];
}

- (void) test_AWSConnectFieldValueUnion {
    [self validateSecureCodingForClass:[AWSConnectFieldValueUnion class]];
}

- (void) test_AWSConnectFilterV2 {
    [self validateSecureCodingForClass:[AWSConnectFilterV2 class]];
}

- (void) test_AWSConnectFilters {
    [self validateSecureCodingForClass:[AWSConnectFilters class]];
}

- (void) test_AWSConnectFlowAssociationSummary {
    [self validateSecureCodingForClass:[AWSConnectFlowAssociationSummary class]];
}

- (void) test_AWSConnectGetAttachedFileRequest {
    [self validateSecureCodingForClass:[AWSConnectGetAttachedFileRequest class]];
}

- (void) test_AWSConnectGetAttachedFileResponse {
    [self validateSecureCodingForClass:[AWSConnectGetAttachedFileResponse class]];
}

- (void) test_AWSConnectGetContactAttributesRequest {
    [self validateSecureCodingForClass:[AWSConnectGetContactAttributesRequest class]];
}

- (void) test_AWSConnectGetContactAttributesResponse {
    [self validateSecureCodingForClass:[AWSConnectGetContactAttributesResponse class]];
}

- (void) test_AWSConnectGetCurrentMetricDataRequest {
    [self validateSecureCodingForClass:[AWSConnectGetCurrentMetricDataRequest class]];
}

- (void) test_AWSConnectGetCurrentMetricDataResponse {
    [self validateSecureCodingForClass:[AWSConnectGetCurrentMetricDataResponse class]];
}

- (void) test_AWSConnectGetCurrentUserDataRequest {
    [self validateSecureCodingForClass:[AWSConnectGetCurrentUserDataRequest class]];
}

- (void) test_AWSConnectGetCurrentUserDataResponse {
    [self validateSecureCodingForClass:[AWSConnectGetCurrentUserDataResponse class]];
}

- (void) test_AWSConnectGetFederationTokenRequest {
    [self validateSecureCodingForClass:[AWSConnectGetFederationTokenRequest class]];
}

- (void) test_AWSConnectGetFederationTokenResponse {
    [self validateSecureCodingForClass:[AWSConnectGetFederationTokenResponse class]];
}

- (void) test_AWSConnectGetFlowAssociationRequest {
    [self validateSecureCodingForClass:[AWSConnectGetFlowAssociationRequest class]];
}

- (void) test_AWSConnectGetFlowAssociationResponse {
    [self validateSecureCodingForClass:[AWSConnectGetFlowAssociationResponse class]];
}

- (void) test_AWSConnectGetMetricDataRequest {
    [self validateSecureCodingForClass:[AWSConnectGetMetricDataRequest class]];
}

- (void) test_AWSConnectGetMetricDataResponse {
    [self validateSecureCodingForClass:[AWSConnectGetMetricDataResponse class]];
}

- (void) test_AWSConnectGetMetricDataV2Request {
    [self validateSecureCodingForClass:[AWSConnectGetMetricDataV2Request class]];
}

- (void) test_AWSConnectGetMetricDataV2Response {
    [self validateSecureCodingForClass:[AWSConnectGetMetricDataV2Response class]];
}

- (void) test_AWSConnectGetPromptFileRequest {
    [self validateSecureCodingForClass:[AWSConnectGetPromptFileRequest class]];
}

- (void) test_AWSConnectGetPromptFileResponse {
    [self validateSecureCodingForClass:[AWSConnectGetPromptFileResponse class]];
}

- (void) test_AWSConnectGetTaskTemplateRequest {
    [self validateSecureCodingForClass:[AWSConnectGetTaskTemplateRequest class]];
}

- (void) test_AWSConnectGetTaskTemplateResponse {
    [self validateSecureCodingForClass:[AWSConnectGetTaskTemplateResponse class]];
}

- (void) test_AWSConnectGetTrafficDistributionRequest {
    [self validateSecureCodingForClass:[AWSConnectGetTrafficDistributionRequest class]];
}

- (void) test_AWSConnectGetTrafficDistributionResponse {
    [self validateSecureCodingForClass:[AWSConnectGetTrafficDistributionResponse class]];
}

- (void) test_AWSConnectHierarchyGroup {
    [self validateSecureCodingForClass:[AWSConnectHierarchyGroup class]];
}

- (void) test_AWSConnectHierarchyGroupCondition {
    [self validateSecureCodingForClass:[AWSConnectHierarchyGroupCondition class]];
}

- (void) test_AWSConnectHierarchyGroupSummary {
    [self validateSecureCodingForClass:[AWSConnectHierarchyGroupSummary class]];
}

- (void) test_AWSConnectHierarchyGroupSummaryReference {
    [self validateSecureCodingForClass:[AWSConnectHierarchyGroupSummaryReference class]];
}

- (void) test_AWSConnectHierarchyGroups {
    [self validateSecureCodingForClass:[AWSConnectHierarchyGroups class]];
}

- (void) test_AWSConnectHierarchyLevel {
    [self validateSecureCodingForClass:[AWSConnectHierarchyLevel class]];
}

- (void) test_AWSConnectHierarchyLevelUpdate {
    [self validateSecureCodingForClass:[AWSConnectHierarchyLevelUpdate class]];
}

- (void) test_AWSConnectHierarchyPath {
    [self validateSecureCodingForClass:[AWSConnectHierarchyPath class]];
}

- (void) test_AWSConnectHierarchyPathReference {
    [self validateSecureCodingForClass:[AWSConnectHierarchyPathReference class]];
}

- (void) test_AWSConnectHierarchyStructure {
    [self validateSecureCodingForClass:[AWSConnectHierarchyStructure class]];
}

- (void) test_AWSConnectHierarchyStructureUpdate {
    [self validateSecureCodingForClass:[AWSConnectHierarchyStructureUpdate class]];
}

- (void) test_AWSConnectHistoricalMetric {
    [self validateSecureCodingForClass:[AWSConnectHistoricalMetric class]];
}

- (void) test_AWSConnectHistoricalMetricData {
    [self validateSecureCodingForClass:[AWSConnectHistoricalMetricData class]];
}

- (void) test_AWSConnectHistoricalMetricResult {
    [self validateSecureCodingForClass:[AWSConnectHistoricalMetricResult class]];
}

- (void) test_AWSConnectHoursOfOperation {
    [self validateSecureCodingForClass:[AWSConnectHoursOfOperation class]];
}

- (void) test_AWSConnectHoursOfOperationConfig {
    [self validateSecureCodingForClass:[AWSConnectHoursOfOperationConfig class]];
}

- (void) test_AWSConnectHoursOfOperationSearchCriteria {
    [self validateSecureCodingForClass:[AWSConnectHoursOfOperationSearchCriteria class]];
}

- (void) test_AWSConnectHoursOfOperationSearchFilter {
    [self validateSecureCodingForClass:[AWSConnectHoursOfOperationSearchFilter class]];
}

- (void) test_AWSConnectHoursOfOperationSummary {
    [self validateSecureCodingForClass:[AWSConnectHoursOfOperationSummary class]];
}

- (void) test_AWSConnectHoursOfOperationTimeSlice {
    [self validateSecureCodingForClass:[AWSConnectHoursOfOperationTimeSlice class]];
}

- (void) test_AWSConnectImportPhoneNumberRequest {
    [self validateSecureCodingForClass:[AWSConnectImportPhoneNumberRequest class]];
}

- (void) test_AWSConnectImportPhoneNumberResponse {
    [self validateSecureCodingForClass:[AWSConnectImportPhoneNumberResponse class]];
}

- (void) test_AWSConnectInstance {
    [self validateSecureCodingForClass:[AWSConnectInstance class]];
}

- (void) test_AWSConnectInstanceStatusReason {
    [self validateSecureCodingForClass:[AWSConnectInstanceStatusReason class]];
}

- (void) test_AWSConnectInstanceStorageConfig {
    [self validateSecureCodingForClass:[AWSConnectInstanceStorageConfig class]];
}

- (void) test_AWSConnectInstanceSummary {
    [self validateSecureCodingForClass:[AWSConnectInstanceSummary class]];
}

- (void) test_AWSConnectIntegrationAssociationSummary {
    [self validateSecureCodingForClass:[AWSConnectIntegrationAssociationSummary class]];
}

- (void) test_AWSConnectIntervalDetails {
    [self validateSecureCodingForClass:[AWSConnectIntervalDetails class]];
}

- (void) test_AWSConnectInvalidRequestExceptionReason {
    [self validateSecureCodingForClass:[AWSConnectInvalidRequestExceptionReason class]];
}

- (void) test_AWSConnectInvisibleFieldInfo {
    [self validateSecureCodingForClass:[AWSConnectInvisibleFieldInfo class]];
}

- (void) test_AWSConnectKinesisFirehoseConfig {
    [self validateSecureCodingForClass:[AWSConnectKinesisFirehoseConfig class]];
}

- (void) test_AWSConnectKinesisStreamConfig {
    [self validateSecureCodingForClass:[AWSConnectKinesisStreamConfig class]];
}

- (void) test_AWSConnectKinesisVideoStreamConfig {
    [self validateSecureCodingForClass:[AWSConnectKinesisVideoStreamConfig class]];
}

- (void) test_AWSConnectLexBot {
    [self validateSecureCodingForClass:[AWSConnectLexBot class]];
}

- (void) test_AWSConnectLexBotConfig {
    [self validateSecureCodingForClass:[AWSConnectLexBotConfig class]];
}

- (void) test_AWSConnectLexV2Bot {
    [self validateSecureCodingForClass:[AWSConnectLexV2Bot class]];
}

- (void) test_AWSConnectListAgentStatusRequest {
    [self validateSecureCodingForClass:[AWSConnectListAgentStatusRequest class]];
}

- (void) test_AWSConnectListAgentStatusResponse {
    [self validateSecureCodingForClass:[AWSConnectListAgentStatusResponse class]];
}

- (void) test_AWSConnectListAnalyticsDataAssociationsRequest {
    [self validateSecureCodingForClass:[AWSConnectListAnalyticsDataAssociationsRequest class]];
}

- (void) test_AWSConnectListAnalyticsDataAssociationsResponse {
    [self validateSecureCodingForClass:[AWSConnectListAnalyticsDataAssociationsResponse class]];
}

- (void) test_AWSConnectListApprovedOriginsRequest {
    [self validateSecureCodingForClass:[AWSConnectListApprovedOriginsRequest class]];
}

- (void) test_AWSConnectListApprovedOriginsResponse {
    [self validateSecureCodingForClass:[AWSConnectListApprovedOriginsResponse class]];
}

- (void) test_AWSConnectListBotsRequest {
    [self validateSecureCodingForClass:[AWSConnectListBotsRequest class]];
}

- (void) test_AWSConnectListBotsResponse {
    [self validateSecureCodingForClass:[AWSConnectListBotsResponse class]];
}

- (void) test_AWSConnectListContactEvaluationsRequest {
    [self validateSecureCodingForClass:[AWSConnectListContactEvaluationsRequest class]];
}

- (void) test_AWSConnectListContactEvaluationsResponse {
    [self validateSecureCodingForClass:[AWSConnectListContactEvaluationsResponse class]];
}

- (void) test_AWSConnectListContactFlowModulesRequest {
    [self validateSecureCodingForClass:[AWSConnectListContactFlowModulesRequest class]];
}

- (void) test_AWSConnectListContactFlowModulesResponse {
    [self validateSecureCodingForClass:[AWSConnectListContactFlowModulesResponse class]];
}

- (void) test_AWSConnectListContactFlowsRequest {
    [self validateSecureCodingForClass:[AWSConnectListContactFlowsRequest class]];
}

- (void) test_AWSConnectListContactFlowsResponse {
    [self validateSecureCodingForClass:[AWSConnectListContactFlowsResponse class]];
}

- (void) test_AWSConnectListContactReferencesRequest {
    [self validateSecureCodingForClass:[AWSConnectListContactReferencesRequest class]];
}

- (void) test_AWSConnectListContactReferencesResponse {
    [self validateSecureCodingForClass:[AWSConnectListContactReferencesResponse class]];
}

- (void) test_AWSConnectListDefaultVocabulariesRequest {
    [self validateSecureCodingForClass:[AWSConnectListDefaultVocabulariesRequest class]];
}

- (void) test_AWSConnectListDefaultVocabulariesResponse {
    [self validateSecureCodingForClass:[AWSConnectListDefaultVocabulariesResponse class]];
}

- (void) test_AWSConnectListEvaluationFormVersionsRequest {
    [self validateSecureCodingForClass:[AWSConnectListEvaluationFormVersionsRequest class]];
}

- (void) test_AWSConnectListEvaluationFormVersionsResponse {
    [self validateSecureCodingForClass:[AWSConnectListEvaluationFormVersionsResponse class]];
}

- (void) test_AWSConnectListEvaluationFormsRequest {
    [self validateSecureCodingForClass:[AWSConnectListEvaluationFormsRequest class]];
}

- (void) test_AWSConnectListEvaluationFormsResponse {
    [self validateSecureCodingForClass:[AWSConnectListEvaluationFormsResponse class]];
}

- (void) test_AWSConnectListFlowAssociationsRequest {
    [self validateSecureCodingForClass:[AWSConnectListFlowAssociationsRequest class]];
}

- (void) test_AWSConnectListFlowAssociationsResponse {
    [self validateSecureCodingForClass:[AWSConnectListFlowAssociationsResponse class]];
}

- (void) test_AWSConnectListHoursOfOperationsRequest {
    [self validateSecureCodingForClass:[AWSConnectListHoursOfOperationsRequest class]];
}

- (void) test_AWSConnectListHoursOfOperationsResponse {
    [self validateSecureCodingForClass:[AWSConnectListHoursOfOperationsResponse class]];
}

- (void) test_AWSConnectListInstanceAttributesRequest {
    [self validateSecureCodingForClass:[AWSConnectListInstanceAttributesRequest class]];
}

- (void) test_AWSConnectListInstanceAttributesResponse {
    [self validateSecureCodingForClass:[AWSConnectListInstanceAttributesResponse class]];
}

- (void) test_AWSConnectListInstanceStorageConfigsRequest {
    [self validateSecureCodingForClass:[AWSConnectListInstanceStorageConfigsRequest class]];
}

- (void) test_AWSConnectListInstanceStorageConfigsResponse {
    [self validateSecureCodingForClass:[AWSConnectListInstanceStorageConfigsResponse class]];
}

- (void) test_AWSConnectListInstancesRequest {
    [self validateSecureCodingForClass:[AWSConnectListInstancesRequest class]];
}

- (void) test_AWSConnectListInstancesResponse {
    [self validateSecureCodingForClass:[AWSConnectListInstancesResponse class]];
}

- (void) test_AWSConnectListIntegrationAssociationsRequest {
    [self validateSecureCodingForClass:[AWSConnectListIntegrationAssociationsRequest class]];
}

- (void) test_AWSConnectListIntegrationAssociationsResponse {
    [self validateSecureCodingForClass:[AWSConnectListIntegrationAssociationsResponse class]];
}

- (void) test_AWSConnectListLambdaFunctionsRequest {
    [self validateSecureCodingForClass:[AWSConnectListLambdaFunctionsRequest class]];
}

- (void) test_AWSConnectListLambdaFunctionsResponse {
    [self validateSecureCodingForClass:[AWSConnectListLambdaFunctionsResponse class]];
}

- (void) test_AWSConnectListLexBotsRequest {
    [self validateSecureCodingForClass:[AWSConnectListLexBotsRequest class]];
}

- (void) test_AWSConnectListLexBotsResponse {
    [self validateSecureCodingForClass:[AWSConnectListLexBotsResponse class]];
}

- (void) test_AWSConnectListPhoneNumbersRequest {
    [self validateSecureCodingForClass:[AWSConnectListPhoneNumbersRequest class]];
}

- (void) test_AWSConnectListPhoneNumbersResponse {
    [self validateSecureCodingForClass:[AWSConnectListPhoneNumbersResponse class]];
}

- (void) test_AWSConnectListPhoneNumbersSummary {
    [self validateSecureCodingForClass:[AWSConnectListPhoneNumbersSummary class]];
}

- (void) test_AWSConnectListPhoneNumbersV2Request {
    [self validateSecureCodingForClass:[AWSConnectListPhoneNumbersV2Request class]];
}

- (void) test_AWSConnectListPhoneNumbersV2Response {
    [self validateSecureCodingForClass:[AWSConnectListPhoneNumbersV2Response class]];
}

- (void) test_AWSConnectListPredefinedAttributesRequest {
    [self validateSecureCodingForClass:[AWSConnectListPredefinedAttributesRequest class]];
}

- (void) test_AWSConnectListPredefinedAttributesResponse {
    [self validateSecureCodingForClass:[AWSConnectListPredefinedAttributesResponse class]];
}

- (void) test_AWSConnectListPromptsRequest {
    [self validateSecureCodingForClass:[AWSConnectListPromptsRequest class]];
}

- (void) test_AWSConnectListPromptsResponse {
    [self validateSecureCodingForClass:[AWSConnectListPromptsResponse class]];
}

- (void) test_AWSConnectListQueueQuickConnectsRequest {
    [self validateSecureCodingForClass:[AWSConnectListQueueQuickConnectsRequest class]];
}

- (void) test_AWSConnectListQueueQuickConnectsResponse {
    [self validateSecureCodingForClass:[AWSConnectListQueueQuickConnectsResponse class]];
}

- (void) test_AWSConnectListQueuesRequest {
    [self validateSecureCodingForClass:[AWSConnectListQueuesRequest class]];
}

- (void) test_AWSConnectListQueuesResponse {
    [self validateSecureCodingForClass:[AWSConnectListQueuesResponse class]];
}

- (void) test_AWSConnectListQuickConnectsRequest {
    [self validateSecureCodingForClass:[AWSConnectListQuickConnectsRequest class]];
}

- (void) test_AWSConnectListQuickConnectsResponse {
    [self validateSecureCodingForClass:[AWSConnectListQuickConnectsResponse class]];
}

- (void) test_AWSConnectListRealtimeContactAnalysisSegmentsV2Request {
    [self validateSecureCodingForClass:[AWSConnectListRealtimeContactAnalysisSegmentsV2Request class]];
}

- (void) test_AWSConnectListRealtimeContactAnalysisSegmentsV2Response {
    [self validateSecureCodingForClass:[AWSConnectListRealtimeContactAnalysisSegmentsV2Response class]];
}

- (void) test_AWSConnectListRoutingProfileQueuesRequest {
    [self validateSecureCodingForClass:[AWSConnectListRoutingProfileQueuesRequest class]];
}

- (void) test_AWSConnectListRoutingProfileQueuesResponse {
    [self validateSecureCodingForClass:[AWSConnectListRoutingProfileQueuesResponse class]];
}

- (void) test_AWSConnectListRoutingProfilesRequest {
    [self validateSecureCodingForClass:[AWSConnectListRoutingProfilesRequest class]];
}

- (void) test_AWSConnectListRoutingProfilesResponse {
    [self validateSecureCodingForClass:[AWSConnectListRoutingProfilesResponse class]];
}

- (void) test_AWSConnectListRulesRequest {
    [self validateSecureCodingForClass:[AWSConnectListRulesRequest class]];
}

- (void) test_AWSConnectListRulesResponse {
    [self validateSecureCodingForClass:[AWSConnectListRulesResponse class]];
}

- (void) test_AWSConnectListSecurityKeysRequest {
    [self validateSecureCodingForClass:[AWSConnectListSecurityKeysRequest class]];
}

- (void) test_AWSConnectListSecurityKeysResponse {
    [self validateSecureCodingForClass:[AWSConnectListSecurityKeysResponse class]];
}

- (void) test_AWSConnectListSecurityProfileApplicationsRequest {
    [self validateSecureCodingForClass:[AWSConnectListSecurityProfileApplicationsRequest class]];
}

- (void) test_AWSConnectListSecurityProfileApplicationsResponse {
    [self validateSecureCodingForClass:[AWSConnectListSecurityProfileApplicationsResponse class]];
}

- (void) test_AWSConnectListSecurityProfilePermissionsRequest {
    [self validateSecureCodingForClass:[AWSConnectListSecurityProfilePermissionsRequest class]];
}

- (void) test_AWSConnectListSecurityProfilePermissionsResponse {
    [self validateSecureCodingForClass:[AWSConnectListSecurityProfilePermissionsResponse class]];
}

- (void) test_AWSConnectListSecurityProfilesRequest {
    [self validateSecureCodingForClass:[AWSConnectListSecurityProfilesRequest class]];
}

- (void) test_AWSConnectListSecurityProfilesResponse {
    [self validateSecureCodingForClass:[AWSConnectListSecurityProfilesResponse class]];
}

- (void) test_AWSConnectListTagsForResourceRequest {
    [self validateSecureCodingForClass:[AWSConnectListTagsForResourceRequest class]];
}

- (void) test_AWSConnectListTagsForResourceResponse {
    [self validateSecureCodingForClass:[AWSConnectListTagsForResourceResponse class]];
}

- (void) test_AWSConnectListTaskTemplatesRequest {
    [self validateSecureCodingForClass:[AWSConnectListTaskTemplatesRequest class]];
}

- (void) test_AWSConnectListTaskTemplatesResponse {
    [self validateSecureCodingForClass:[AWSConnectListTaskTemplatesResponse class]];
}

- (void) test_AWSConnectListTrafficDistributionGroupUsersRequest {
    [self validateSecureCodingForClass:[AWSConnectListTrafficDistributionGroupUsersRequest class]];
}

- (void) test_AWSConnectListTrafficDistributionGroupUsersResponse {
    [self validateSecureCodingForClass:[AWSConnectListTrafficDistributionGroupUsersResponse class]];
}

- (void) test_AWSConnectListTrafficDistributionGroupsRequest {
    [self validateSecureCodingForClass:[AWSConnectListTrafficDistributionGroupsRequest class]];
}

- (void) test_AWSConnectListTrafficDistributionGroupsResponse {
    [self validateSecureCodingForClass:[AWSConnectListTrafficDistributionGroupsResponse class]];
}

- (void) test_AWSConnectListUseCasesRequest {
    [self validateSecureCodingForClass:[AWSConnectListUseCasesRequest class]];
}

- (void) test_AWSConnectListUseCasesResponse {
    [self validateSecureCodingForClass:[AWSConnectListUseCasesResponse class]];
}

- (void) test_AWSConnectListUserHierarchyGroupsRequest {
    [self validateSecureCodingForClass:[AWSConnectListUserHierarchyGroupsRequest class]];
}

- (void) test_AWSConnectListUserHierarchyGroupsResponse {
    [self validateSecureCodingForClass:[AWSConnectListUserHierarchyGroupsResponse class]];
}

- (void) test_AWSConnectListUserProficienciesRequest {
    [self validateSecureCodingForClass:[AWSConnectListUserProficienciesRequest class]];
}

- (void) test_AWSConnectListUserProficienciesResponse {
    [self validateSecureCodingForClass:[AWSConnectListUserProficienciesResponse class]];
}

- (void) test_AWSConnectListUsersRequest {
    [self validateSecureCodingForClass:[AWSConnectListUsersRequest class]];
}

- (void) test_AWSConnectListUsersResponse {
    [self validateSecureCodingForClass:[AWSConnectListUsersResponse class]];
}

- (void) test_AWSConnectListViewVersionsRequest {
    [self validateSecureCodingForClass:[AWSConnectListViewVersionsRequest class]];
}

- (void) test_AWSConnectListViewVersionsResponse {
    [self validateSecureCodingForClass:[AWSConnectListViewVersionsResponse class]];
}

- (void) test_AWSConnectListViewsRequest {
    [self validateSecureCodingForClass:[AWSConnectListViewsRequest class]];
}

- (void) test_AWSConnectListViewsResponse {
    [self validateSecureCodingForClass:[AWSConnectListViewsResponse class]];
}

- (void) test_AWSConnectMatchCriteria {
    [self validateSecureCodingForClass:[AWSConnectMatchCriteria class]];
}

- (void) test_AWSConnectMediaConcurrency {
    [self validateSecureCodingForClass:[AWSConnectMediaConcurrency class]];
}

- (void) test_AWSConnectMediaPlacement {
    [self validateSecureCodingForClass:[AWSConnectMediaPlacement class]];
}

- (void) test_AWSConnectMeeting {
    [self validateSecureCodingForClass:[AWSConnectMeeting class]];
}

- (void) test_AWSConnectMeetingFeaturesConfiguration {
    [self validateSecureCodingForClass:[AWSConnectMeetingFeaturesConfiguration class]];
}

- (void) test_AWSConnectMetricDataV2 {
    [self validateSecureCodingForClass:[AWSConnectMetricDataV2 class]];
}

- (void) test_AWSConnectMetricFilterV2 {
    [self validateSecureCodingForClass:[AWSConnectMetricFilterV2 class]];
}

- (void) test_AWSConnectMetricInterval {
    [self validateSecureCodingForClass:[AWSConnectMetricInterval class]];
}

- (void) test_AWSConnectMetricResultV2 {
    [self validateSecureCodingForClass:[AWSConnectMetricResultV2 class]];
}

- (void) test_AWSConnectMetricV2 {
    [self validateSecureCodingForClass:[AWSConnectMetricV2 class]];
}

- (void) test_AWSConnectMonitorContactRequest {
    [self validateSecureCodingForClass:[AWSConnectMonitorContactRequest class]];
}

- (void) test_AWSConnectMonitorContactResponse {
    [self validateSecureCodingForClass:[AWSConnectMonitorContactResponse class]];
}

- (void) test_AWSConnectLatestSessionDetails {
    [self validateSecureCodingForClass:[AWSConnectLatestSessionDetails class]];
}

- (void) test_AWSConnectNotificationRecipientType {
    [self validateSecureCodingForClass:[AWSConnectNotificationRecipientType class]];
}

- (void) test_AWSConnectNumberReference {
    [self validateSecureCodingForClass:[AWSConnectNumberReference class]];
}

- (void) test_AWSConnectNumericQuestionPropertyValueAutomation {
    [self validateSecureCodingForClass:[AWSConnectNumericQuestionPropertyValueAutomation class]];
}

- (void) test_AWSConnectOutboundCallerConfig {
    [self validateSecureCodingForClass:[AWSConnectOutboundCallerConfig class]];
}

- (void) test_AWSConnectParticipantCapabilities {
    [self validateSecureCodingForClass:[AWSConnectParticipantCapabilities class]];
}

- (void) test_AWSConnectParticipantDetails {
    [self validateSecureCodingForClass:[AWSConnectParticipantDetails class]];
}

- (void) test_AWSConnectParticipantDetailsToAdd {
    [self validateSecureCodingForClass:[AWSConnectParticipantDetailsToAdd class]];
}

- (void) test_AWSConnectParticipantTimerConfiguration {
    [self validateSecureCodingForClass:[AWSConnectParticipantTimerConfiguration class]];
}

- (void) test_AWSConnectParticipantTimerValue {
    [self validateSecureCodingForClass:[AWSConnectParticipantTimerValue class]];
}

- (void) test_AWSConnectParticipantTokenCredentials {
    [self validateSecureCodingForClass:[AWSConnectParticipantTokenCredentials class]];
}

- (void) test_AWSConnectPauseContactRequest {
    [self validateSecureCodingForClass:[AWSConnectPauseContactRequest class]];
}

- (void) test_AWSConnectPauseContactResponse {
    [self validateSecureCodingForClass:[AWSConnectPauseContactResponse class]];
}

- (void) test_AWSConnectPersistentChat {
    [self validateSecureCodingForClass:[AWSConnectPersistentChat class]];
}

- (void) test_AWSConnectPhoneNumberQuickConnectConfig {
    [self validateSecureCodingForClass:[AWSConnectPhoneNumberQuickConnectConfig class]];
}

- (void) test_AWSConnectPhoneNumberStatus {
    [self validateSecureCodingForClass:[AWSConnectPhoneNumberStatus class]];
}

- (void) test_AWSConnectPhoneNumberSummary {
    [self validateSecureCodingForClass:[AWSConnectPhoneNumberSummary class]];
}

- (void) test_AWSConnectPredefinedAttribute {
    [self validateSecureCodingForClass:[AWSConnectPredefinedAttribute class]];
}

- (void) test_AWSConnectPredefinedAttributeSearchCriteria {
    [self validateSecureCodingForClass:[AWSConnectPredefinedAttributeSearchCriteria class]];
}

- (void) test_AWSConnectPredefinedAttributeSummary {
    [self validateSecureCodingForClass:[AWSConnectPredefinedAttributeSummary class]];
}

- (void) test_AWSConnectPredefinedAttributeValues {
    [self validateSecureCodingForClass:[AWSConnectPredefinedAttributeValues class]];
}

- (void) test_AWSConnectProblemDetail {
    [self validateSecureCodingForClass:[AWSConnectProblemDetail class]];
}

- (void) test_AWSConnectPrompt {
    [self validateSecureCodingForClass:[AWSConnectPrompt class]];
}

- (void) test_AWSConnectPromptSearchCriteria {
    [self validateSecureCodingForClass:[AWSConnectPromptSearchCriteria class]];
}

- (void) test_AWSConnectPromptSearchFilter {
    [self validateSecureCodingForClass:[AWSConnectPromptSearchFilter class]];
}

- (void) test_AWSConnectPromptSummary {
    [self validateSecureCodingForClass:[AWSConnectPromptSummary class]];
}

- (void) test_AWSConnectPropertyValidationExceptionProperty {
    [self validateSecureCodingForClass:[AWSConnectPropertyValidationExceptionProperty class]];
}

- (void) test_AWSConnectPutUserStatusRequest {
    [self validateSecureCodingForClass:[AWSConnectPutUserStatusRequest class]];
}

- (void) test_AWSConnectPutUserStatusResponse {
    [self validateSecureCodingForClass:[AWSConnectPutUserStatusResponse class]];
}

- (void) test_AWSConnectQualityMetrics {
    [self validateSecureCodingForClass:[AWSConnectQualityMetrics class]];
}

- (void) test_AWSConnectQueue {
    [self validateSecureCodingForClass:[AWSConnectQueue class]];
}

- (void) test_AWSConnectQueueInfo {
    [self validateSecureCodingForClass:[AWSConnectQueueInfo class]];
}

- (void) test_AWSConnectQueueQuickConnectConfig {
    [self validateSecureCodingForClass:[AWSConnectQueueQuickConnectConfig class]];
}

- (void) test_AWSConnectQueueReference {
    [self validateSecureCodingForClass:[AWSConnectQueueReference class]];
}

- (void) test_AWSConnectQueueSearchCriteria {
    [self validateSecureCodingForClass:[AWSConnectQueueSearchCriteria class]];
}

- (void) test_AWSConnectQueueSearchFilter {
    [self validateSecureCodingForClass:[AWSConnectQueueSearchFilter class]];
}

- (void) test_AWSConnectQueueSummary {
    [self validateSecureCodingForClass:[AWSConnectQueueSummary class]];
}

- (void) test_AWSConnectQuickConnect {
    [self validateSecureCodingForClass:[AWSConnectQuickConnect class]];
}

- (void) test_AWSConnectQuickConnectConfig {
    [self validateSecureCodingForClass:[AWSConnectQuickConnectConfig class]];
}

- (void) test_AWSConnectQuickConnectSearchCriteria {
    [self validateSecureCodingForClass:[AWSConnectQuickConnectSearchCriteria class]];
}

- (void) test_AWSConnectQuickConnectSearchFilter {
    [self validateSecureCodingForClass:[AWSConnectQuickConnectSearchFilter class]];
}

- (void) test_AWSConnectQuickConnectSummary {
    [self validateSecureCodingForClass:[AWSConnectQuickConnectSummary class]];
}

- (void) test_AWSConnectReadOnlyFieldInfo {
    [self validateSecureCodingForClass:[AWSConnectReadOnlyFieldInfo class]];
}

- (void) test_AWSConnectRealTimeContactAnalysisAttachment {
    [self validateSecureCodingForClass:[AWSConnectRealTimeContactAnalysisAttachment class]];
}

- (void) test_AWSConnectRealTimeContactAnalysisCategoryDetails {
    [self validateSecureCodingForClass:[AWSConnectRealTimeContactAnalysisCategoryDetails class]];
}

- (void) test_AWSConnectRealTimeContactAnalysisCharacterInterval {
    [self validateSecureCodingForClass:[AWSConnectRealTimeContactAnalysisCharacterInterval class]];
}

- (void) test_AWSConnectRealTimeContactAnalysisIssueDetected {
    [self validateSecureCodingForClass:[AWSConnectRealTimeContactAnalysisIssueDetected class]];
}

- (void) test_AWSConnectRealTimeContactAnalysisPointOfInterest {
    [self validateSecureCodingForClass:[AWSConnectRealTimeContactAnalysisPointOfInterest class]];
}

- (void) test_AWSConnectRealTimeContactAnalysisSegmentAttachments {
    [self validateSecureCodingForClass:[AWSConnectRealTimeContactAnalysisSegmentAttachments class]];
}

- (void) test_AWSConnectRealTimeContactAnalysisSegmentCategories {
    [self validateSecureCodingForClass:[AWSConnectRealTimeContactAnalysisSegmentCategories class]];
}

- (void) test_AWSConnectRealTimeContactAnalysisSegmentEvent {
    [self validateSecureCodingForClass:[AWSConnectRealTimeContactAnalysisSegmentEvent class]];
}

- (void) test_AWSConnectRealTimeContactAnalysisSegmentIssues {
    [self validateSecureCodingForClass:[AWSConnectRealTimeContactAnalysisSegmentIssues class]];
}

- (void) test_AWSConnectRealTimeContactAnalysisSegmentTranscript {
    [self validateSecureCodingForClass:[AWSConnectRealTimeContactAnalysisSegmentTranscript class]];
}

- (void) test_AWSConnectRealTimeContactAnalysisTimeData {
    [self validateSecureCodingForClass:[AWSConnectRealTimeContactAnalysisTimeData class]];
}

- (void) test_AWSConnectRealTimeContactAnalysisTranscriptItemRedaction {
    [self validateSecureCodingForClass:[AWSConnectRealTimeContactAnalysisTranscriptItemRedaction class]];
}

- (void) test_AWSConnectRealTimeContactAnalysisTranscriptItemWithCharacterOffsets {
    [self validateSecureCodingForClass:[AWSConnectRealTimeContactAnalysisTranscriptItemWithCharacterOffsets class]];
}

- (void) test_AWSConnectRealTimeContactAnalysisTranscriptItemWithContent {
    [self validateSecureCodingForClass:[AWSConnectRealTimeContactAnalysisTranscriptItemWithContent class]];
}

- (void) test_AWSConnectRealtimeContactAnalysisSegment {
    [self validateSecureCodingForClass:[AWSConnectRealtimeContactAnalysisSegment class]];
}

- (void) test_AWSConnectReference {
    [self validateSecureCodingForClass:[AWSConnectReference class]];
}

- (void) test_AWSConnectReferenceSummary {
    [self validateSecureCodingForClass:[AWSConnectReferenceSummary class]];
}

- (void) test_AWSConnectReleasePhoneNumberRequest {
    [self validateSecureCodingForClass:[AWSConnectReleasePhoneNumberRequest class]];
}

- (void) test_AWSConnectReplicateInstanceRequest {
    [self validateSecureCodingForClass:[AWSConnectReplicateInstanceRequest class]];
}

- (void) test_AWSConnectReplicateInstanceResponse {
    [self validateSecureCodingForClass:[AWSConnectReplicateInstanceResponse class]];
}

- (void) test_AWSConnectRequiredFieldInfo {
    [self validateSecureCodingForClass:[AWSConnectRequiredFieldInfo class]];
}

- (void) test_AWSConnectResourceTagsSearchCriteria {
    [self validateSecureCodingForClass:[AWSConnectResourceTagsSearchCriteria class]];
}

- (void) test_AWSConnectResumeContactRecordingRequest {
    [self validateSecureCodingForClass:[AWSConnectResumeContactRecordingRequest class]];
}

- (void) test_AWSConnectResumeContactRecordingResponse {
    [self validateSecureCodingForClass:[AWSConnectResumeContactRecordingResponse class]];
}

- (void) test_AWSConnectResumeContactRequest {
    [self validateSecureCodingForClass:[AWSConnectResumeContactRequest class]];
}

- (void) test_AWSConnectResumeContactResponse {
    [self validateSecureCodingForClass:[AWSConnectResumeContactResponse class]];
}

- (void) test_AWSConnectRoutingCriteria {
    [self validateSecureCodingForClass:[AWSConnectRoutingCriteria class]];
}

- (void) test_AWSConnectRoutingProfile {
    [self validateSecureCodingForClass:[AWSConnectRoutingProfile class]];
}

- (void) test_AWSConnectRoutingProfileQueueConfig {
    [self validateSecureCodingForClass:[AWSConnectRoutingProfileQueueConfig class]];
}

- (void) test_AWSConnectRoutingProfileQueueConfigSummary {
    [self validateSecureCodingForClass:[AWSConnectRoutingProfileQueueConfigSummary class]];
}

- (void) test_AWSConnectRoutingProfileQueueReference {
    [self validateSecureCodingForClass:[AWSConnectRoutingProfileQueueReference class]];
}

- (void) test_AWSConnectRoutingProfileReference {
    [self validateSecureCodingForClass:[AWSConnectRoutingProfileReference class]];
}

- (void) test_AWSConnectRoutingProfileSearchCriteria {
    [self validateSecureCodingForClass:[AWSConnectRoutingProfileSearchCriteria class]];
}

- (void) test_AWSConnectRoutingProfileSearchFilter {
    [self validateSecureCodingForClass:[AWSConnectRoutingProfileSearchFilter class]];
}

- (void) test_AWSConnectRoutingProfileSummary {
    [self validateSecureCodingForClass:[AWSConnectRoutingProfileSummary class]];
}

- (void) test_AWSConnectRule {
    [self validateSecureCodingForClass:[AWSConnectRule class]];
}

- (void) test_AWSConnectRuleAction {
    [self validateSecureCodingForClass:[AWSConnectRuleAction class]];
}

- (void) test_AWSConnectRuleSummary {
    [self validateSecureCodingForClass:[AWSConnectRuleSummary class]];
}

- (void) test_AWSConnectRuleTriggerEventSource {
    [self validateSecureCodingForClass:[AWSConnectRuleTriggerEventSource class]];
}

- (void) test_AWSConnectS3Config {
    [self validateSecureCodingForClass:[AWSConnectS3Config class]];
}

- (void) test_AWSConnectSearchAvailablePhoneNumbersRequest {
    [self validateSecureCodingForClass:[AWSConnectSearchAvailablePhoneNumbersRequest class]];
}

- (void) test_AWSConnectSearchAvailablePhoneNumbersResponse {
    [self validateSecureCodingForClass:[AWSConnectSearchAvailablePhoneNumbersResponse class]];
}

- (void) test_AWSConnectSearchContactFlowModulesRequest {
    [self validateSecureCodingForClass:[AWSConnectSearchContactFlowModulesRequest class]];
}

- (void) test_AWSConnectSearchContactFlowModulesResponse {
    [self validateSecureCodingForClass:[AWSConnectSearchContactFlowModulesResponse class]];
}

- (void) test_AWSConnectSearchContactFlowsRequest {
    [self validateSecureCodingForClass:[AWSConnectSearchContactFlowsRequest class]];
}

- (void) test_AWSConnectSearchContactFlowsResponse {
    [self validateSecureCodingForClass:[AWSConnectSearchContactFlowsResponse class]];
}

- (void) test_AWSConnectSearchContactsRequest {
    [self validateSecureCodingForClass:[AWSConnectSearchContactsRequest class]];
}

- (void) test_AWSConnectSearchContactsResponse {
    [self validateSecureCodingForClass:[AWSConnectSearchContactsResponse class]];
}

- (void) test_AWSConnectSearchContactsTimeRange {
    [self validateSecureCodingForClass:[AWSConnectSearchContactsTimeRange class]];
}

- (void) test_AWSConnectSearchCriteria {
    [self validateSecureCodingForClass:[AWSConnectSearchCriteria class]];
}

- (void) test_AWSConnectSearchHoursOfOperationsRequest {
    [self validateSecureCodingForClass:[AWSConnectSearchHoursOfOperationsRequest class]];
}

- (void) test_AWSConnectSearchHoursOfOperationsResponse {
    [self validateSecureCodingForClass:[AWSConnectSearchHoursOfOperationsResponse class]];
}

- (void) test_AWSConnectSearchPredefinedAttributesRequest {
    [self validateSecureCodingForClass:[AWSConnectSearchPredefinedAttributesRequest class]];
}

- (void) test_AWSConnectSearchPredefinedAttributesResponse {
    [self validateSecureCodingForClass:[AWSConnectSearchPredefinedAttributesResponse class]];
}

- (void) test_AWSConnectSearchPromptsRequest {
    [self validateSecureCodingForClass:[AWSConnectSearchPromptsRequest class]];
}

- (void) test_AWSConnectSearchPromptsResponse {
    [self validateSecureCodingForClass:[AWSConnectSearchPromptsResponse class]];
}

- (void) test_AWSConnectSearchQueuesRequest {
    [self validateSecureCodingForClass:[AWSConnectSearchQueuesRequest class]];
}

- (void) test_AWSConnectSearchQueuesResponse {
    [self validateSecureCodingForClass:[AWSConnectSearchQueuesResponse class]];
}

- (void) test_AWSConnectSearchQuickConnectsRequest {
    [self validateSecureCodingForClass:[AWSConnectSearchQuickConnectsRequest class]];
}

- (void) test_AWSConnectSearchQuickConnectsResponse {
    [self validateSecureCodingForClass:[AWSConnectSearchQuickConnectsResponse class]];
}

- (void) test_AWSConnectSearchResourceTagsRequest {
    [self validateSecureCodingForClass:[AWSConnectSearchResourceTagsRequest class]];
}

- (void) test_AWSConnectSearchResourceTagsResponse {
    [self validateSecureCodingForClass:[AWSConnectSearchResourceTagsResponse class]];
}

- (void) test_AWSConnectSearchRoutingProfilesRequest {
    [self validateSecureCodingForClass:[AWSConnectSearchRoutingProfilesRequest class]];
}

- (void) test_AWSConnectSearchRoutingProfilesResponse {
    [self validateSecureCodingForClass:[AWSConnectSearchRoutingProfilesResponse class]];
}

- (void) test_AWSConnectSearchSecurityProfilesRequest {
    [self validateSecureCodingForClass:[AWSConnectSearchSecurityProfilesRequest class]];
}

- (void) test_AWSConnectSearchSecurityProfilesResponse {
    [self validateSecureCodingForClass:[AWSConnectSearchSecurityProfilesResponse class]];
}

- (void) test_AWSConnectSearchUsersRequest {
    [self validateSecureCodingForClass:[AWSConnectSearchUsersRequest class]];
}

- (void) test_AWSConnectSearchUsersResponse {
    [self validateSecureCodingForClass:[AWSConnectSearchUsersResponse class]];
}

- (void) test_AWSConnectSearchVocabulariesRequest {
    [self validateSecureCodingForClass:[AWSConnectSearchVocabulariesRequest class]];
}

- (void) test_AWSConnectSearchVocabulariesResponse {
    [self validateSecureCodingForClass:[AWSConnectSearchVocabulariesResponse class]];
}

- (void) test_AWSConnectSearchableContactAttributes {
    [self validateSecureCodingForClass:[AWSConnectSearchableContactAttributes class]];
}

- (void) test_AWSConnectSearchableContactAttributesCriteria {
    [self validateSecureCodingForClass:[AWSConnectSearchableContactAttributesCriteria class]];
}

- (void) test_AWSConnectSecurityKey {
    [self validateSecureCodingForClass:[AWSConnectSecurityKey class]];
}

- (void) test_AWSConnectSecurityProfile {
    [self validateSecureCodingForClass:[AWSConnectSecurityProfile class]];
}

- (void) test_AWSConnectSecurityProfileSearchCriteria {
    [self validateSecureCodingForClass:[AWSConnectSecurityProfileSearchCriteria class]];
}

- (void) test_AWSConnectSecurityProfileSearchSummary {
    [self validateSecureCodingForClass:[AWSConnectSecurityProfileSearchSummary class]];
}

- (void) test_AWSConnectSecurityProfileSummary {
    [self validateSecureCodingForClass:[AWSConnectSecurityProfileSummary class]];
}

- (void) test_AWSConnectSecurityProfilesSearchFilter {
    [self validateSecureCodingForClass:[AWSConnectSecurityProfilesSearchFilter class]];
}

- (void) test_AWSConnectSegmentAttributeValue {
    [self validateSecureCodingForClass:[AWSConnectSegmentAttributeValue class]];
}

- (void) test_AWSConnectSendChatIntegrationEventRequest {
    [self validateSecureCodingForClass:[AWSConnectSendChatIntegrationEventRequest class]];
}

- (void) test_AWSConnectSendChatIntegrationEventResponse {
    [self validateSecureCodingForClass:[AWSConnectSendChatIntegrationEventResponse class]];
}

- (void) test_AWSConnectSendNotificationActionDefinition {
    [self validateSecureCodingForClass:[AWSConnectSendNotificationActionDefinition class]];
}

- (void) test_AWSConnectSignInConfig {
    [self validateSecureCodingForClass:[AWSConnectSignInConfig class]];
}

- (void) test_AWSConnectSignInDistribution {
    [self validateSecureCodingForClass:[AWSConnectSignInDistribution class]];
}

- (void) test_AWSConnectSingleSelectQuestionRuleCategoryAutomation {
    [self validateSecureCodingForClass:[AWSConnectSingleSelectQuestionRuleCategoryAutomation class]];
}

- (void) test_AWSConnectSort {
    [self validateSecureCodingForClass:[AWSConnectSort class]];
}

- (void) test_AWSConnectStartAttachedFileUploadRequest {
    [self validateSecureCodingForClass:[AWSConnectStartAttachedFileUploadRequest class]];
}

- (void) test_AWSConnectStartAttachedFileUploadResponse {
    [self validateSecureCodingForClass:[AWSConnectStartAttachedFileUploadResponse class]];
}

- (void) test_AWSConnectStartChatContactRequest {
    [self validateSecureCodingForClass:[AWSConnectStartChatContactRequest class]];
}

- (void) test_AWSConnectStartChatContactResponse {
    [self validateSecureCodingForClass:[AWSConnectStartChatContactResponse class]];
}

- (void) test_AWSConnectStartContactEvaluationRequest {
    [self validateSecureCodingForClass:[AWSConnectStartContactEvaluationRequest class]];
}

- (void) test_AWSConnectStartContactEvaluationResponse {
    [self validateSecureCodingForClass:[AWSConnectStartContactEvaluationResponse class]];
}

- (void) test_AWSConnectStartContactRecordingRequest {
    [self validateSecureCodingForClass:[AWSConnectStartContactRecordingRequest class]];
}

- (void) test_AWSConnectStartContactRecordingResponse {
    [self validateSecureCodingForClass:[AWSConnectStartContactRecordingResponse class]];
}

- (void) test_AWSConnectStartContactStreamingRequest {
    [self validateSecureCodingForClass:[AWSConnectStartContactStreamingRequest class]];
}

- (void) test_AWSConnectStartContactStreamingResponse {
    [self validateSecureCodingForClass:[AWSConnectStartContactStreamingResponse class]];
}

- (void) test_AWSConnectStartOutboundVoiceContactRequest {
    [self validateSecureCodingForClass:[AWSConnectStartOutboundVoiceContactRequest class]];
}

- (void) test_AWSConnectStartOutboundVoiceContactResponse {
    [self validateSecureCodingForClass:[AWSConnectStartOutboundVoiceContactResponse class]];
}

- (void) test_AWSConnectStartTaskContactRequest {
    [self validateSecureCodingForClass:[AWSConnectStartTaskContactRequest class]];
}

- (void) test_AWSConnectStartTaskContactResponse {
    [self validateSecureCodingForClass:[AWSConnectStartTaskContactResponse class]];
}

- (void) test_AWSConnectStartWebRTCContactRequest {
    [self validateSecureCodingForClass:[AWSConnectStartWebRTCContactRequest class]];
}

- (void) test_AWSConnectStartWebRTCContactResponse {
    [self validateSecureCodingForClass:[AWSConnectStartWebRTCContactResponse class]];
}

- (void) test_AWSConnectStep {
    [self validateSecureCodingForClass:[AWSConnectStep class]];
}

- (void) test_AWSConnectStopContactRecordingRequest {
    [self validateSecureCodingForClass:[AWSConnectStopContactRecordingRequest class]];
}

- (void) test_AWSConnectStopContactRecordingResponse {
    [self validateSecureCodingForClass:[AWSConnectStopContactRecordingResponse class]];
}

- (void) test_AWSConnectStopContactRequest {
    [self validateSecureCodingForClass:[AWSConnectStopContactRequest class]];
}

- (void) test_AWSConnectStopContactResponse {
    [self validateSecureCodingForClass:[AWSConnectStopContactResponse class]];
}

- (void) test_AWSConnectStopContactStreamingRequest {
    [self validateSecureCodingForClass:[AWSConnectStopContactStreamingRequest class]];
}

- (void) test_AWSConnectStopContactStreamingResponse {
    [self validateSecureCodingForClass:[AWSConnectStopContactStreamingResponse class]];
}

- (void) test_AWSConnectStringCondition {
    [self validateSecureCodingForClass:[AWSConnectStringCondition class]];
}

- (void) test_AWSConnectStringReference {
    [self validateSecureCodingForClass:[AWSConnectStringReference class]];
}

- (void) test_AWSConnectSubmitAutoEvaluationActionDefinition {
    [self validateSecureCodingForClass:[AWSConnectSubmitAutoEvaluationActionDefinition class]];
}

- (void) test_AWSConnectSubmitContactEvaluationRequest {
    [self validateSecureCodingForClass:[AWSConnectSubmitContactEvaluationRequest class]];
}

- (void) test_AWSConnectSubmitContactEvaluationResponse {
    [self validateSecureCodingForClass:[AWSConnectSubmitContactEvaluationResponse class]];
}

- (void) test_AWSConnectSuccessfulRequest {
    [self validateSecureCodingForClass:[AWSConnectSuccessfulRequest class]];
}

- (void) test_AWSConnectSuspendContactRecordingRequest {
    [self validateSecureCodingForClass:[AWSConnectSuspendContactRecordingRequest class]];
}

- (void) test_AWSConnectSuspendContactRecordingResponse {
    [self validateSecureCodingForClass:[AWSConnectSuspendContactRecordingResponse class]];
}

- (void) test_AWSConnectTagCondition {
    [self validateSecureCodingForClass:[AWSConnectTagCondition class]];
}

- (void) test_AWSConnectTagContactRequest {
    [self validateSecureCodingForClass:[AWSConnectTagContactRequest class]];
}

- (void) test_AWSConnectTagContactResponse {
    [self validateSecureCodingForClass:[AWSConnectTagContactResponse class]];
}

- (void) test_AWSConnectTagResourceRequest {
    [self validateSecureCodingForClass:[AWSConnectTagResourceRequest class]];
}

- (void) test_AWSConnectTagSearchCondition {
    [self validateSecureCodingForClass:[AWSConnectTagSearchCondition class]];
}

- (void) test_AWSConnectTagSet {
    [self validateSecureCodingForClass:[AWSConnectTagSet class]];
}

- (void) test_AWSConnectTaskActionDefinition {
    [self validateSecureCodingForClass:[AWSConnectTaskActionDefinition class]];
}

- (void) test_AWSConnectTaskTemplateConstraints {
    [self validateSecureCodingForClass:[AWSConnectTaskTemplateConstraints class]];
}

- (void) test_AWSConnectTaskTemplateDefaultFieldValue {
    [self validateSecureCodingForClass:[AWSConnectTaskTemplateDefaultFieldValue class]];
}

- (void) test_AWSConnectTaskTemplateDefaults {
    [self validateSecureCodingForClass:[AWSConnectTaskTemplateDefaults class]];
}

- (void) test_AWSConnectTaskTemplateField {
    [self validateSecureCodingForClass:[AWSConnectTaskTemplateField class]];
}

- (void) test_AWSConnectTaskTemplateFieldIdentifier {
    [self validateSecureCodingForClass:[AWSConnectTaskTemplateFieldIdentifier class]];
}

- (void) test_AWSConnectTaskTemplateMetadata {
    [self validateSecureCodingForClass:[AWSConnectTaskTemplateMetadata class]];
}

- (void) test_AWSConnectTelephonyConfig {
    [self validateSecureCodingForClass:[AWSConnectTelephonyConfig class]];
}

- (void) test_AWSConnectThreshold {
    [self validateSecureCodingForClass:[AWSConnectThreshold class]];
}

- (void) test_AWSConnectThresholdV2 {
    [self validateSecureCodingForClass:[AWSConnectThresholdV2 class]];
}

- (void) test_AWSConnectTrafficDistributionGroup {
    [self validateSecureCodingForClass:[AWSConnectTrafficDistributionGroup class]];
}

- (void) test_AWSConnectTrafficDistributionGroupSummary {
    [self validateSecureCodingForClass:[AWSConnectTrafficDistributionGroupSummary class]];
}

- (void) test_AWSConnectTrafficDistributionGroupUserSummary {
    [self validateSecureCodingForClass:[AWSConnectTrafficDistributionGroupUserSummary class]];
}

- (void) test_AWSConnectTranscript {
    [self validateSecureCodingForClass:[AWSConnectTranscript class]];
}

- (void) test_AWSConnectTranscriptCriteria {
    [self validateSecureCodingForClass:[AWSConnectTranscriptCriteria class]];
}

- (void) test_AWSConnectTransferContactRequest {
    [self validateSecureCodingForClass:[AWSConnectTransferContactRequest class]];
}

- (void) test_AWSConnectTransferContactResponse {
    [self validateSecureCodingForClass:[AWSConnectTransferContactResponse class]];
}

- (void) test_AWSConnectUntagContactRequest {
    [self validateSecureCodingForClass:[AWSConnectUntagContactRequest class]];
}

- (void) test_AWSConnectUntagContactResponse {
    [self validateSecureCodingForClass:[AWSConnectUntagContactResponse class]];
}

- (void) test_AWSConnectUntagResourceRequest {
    [self validateSecureCodingForClass:[AWSConnectUntagResourceRequest class]];
}

- (void) test_AWSConnectUpdateAgentStatusRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateAgentStatusRequest class]];
}

- (void) test_AWSConnectUpdateCaseActionDefinition {
    [self validateSecureCodingForClass:[AWSConnectUpdateCaseActionDefinition class]];
}

- (void) test_AWSConnectUpdateContactAttributesRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateContactAttributesRequest class]];
}

- (void) test_AWSConnectUpdateContactAttributesResponse {
    [self validateSecureCodingForClass:[AWSConnectUpdateContactAttributesResponse class]];
}

- (void) test_AWSConnectUpdateContactEvaluationRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateContactEvaluationRequest class]];
}

- (void) test_AWSConnectUpdateContactEvaluationResponse {
    [self validateSecureCodingForClass:[AWSConnectUpdateContactEvaluationResponse class]];
}

- (void) test_AWSConnectUpdateContactFlowContentRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateContactFlowContentRequest class]];
}

- (void) test_AWSConnectUpdateContactFlowContentResponse {
    [self validateSecureCodingForClass:[AWSConnectUpdateContactFlowContentResponse class]];
}

- (void) test_AWSConnectUpdateContactFlowMetadataRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateContactFlowMetadataRequest class]];
}

- (void) test_AWSConnectUpdateContactFlowMetadataResponse {
    [self validateSecureCodingForClass:[AWSConnectUpdateContactFlowMetadataResponse class]];
}

- (void) test_AWSConnectUpdateContactFlowModuleContentRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateContactFlowModuleContentRequest class]];
}

- (void) test_AWSConnectUpdateContactFlowModuleContentResponse {
    [self validateSecureCodingForClass:[AWSConnectUpdateContactFlowModuleContentResponse class]];
}

- (void) test_AWSConnectUpdateContactFlowModuleMetadataRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateContactFlowModuleMetadataRequest class]];
}

- (void) test_AWSConnectUpdateContactFlowModuleMetadataResponse {
    [self validateSecureCodingForClass:[AWSConnectUpdateContactFlowModuleMetadataResponse class]];
}

- (void) test_AWSConnectUpdateContactFlowNameRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateContactFlowNameRequest class]];
}

- (void) test_AWSConnectUpdateContactFlowNameResponse {
    [self validateSecureCodingForClass:[AWSConnectUpdateContactFlowNameResponse class]];
}

- (void) test_AWSConnectUpdateContactRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateContactRequest class]];
}

- (void) test_AWSConnectUpdateContactResponse {
    [self validateSecureCodingForClass:[AWSConnectUpdateContactResponse class]];
}

- (void) test_AWSConnectUpdateContactRoutingDataRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateContactRoutingDataRequest class]];
}

- (void) test_AWSConnectUpdateContactRoutingDataResponse {
    [self validateSecureCodingForClass:[AWSConnectUpdateContactRoutingDataResponse class]];
}

- (void) test_AWSConnectUpdateContactScheduleRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateContactScheduleRequest class]];
}

- (void) test_AWSConnectUpdateContactScheduleResponse {
    [self validateSecureCodingForClass:[AWSConnectUpdateContactScheduleResponse class]];
}

- (void) test_AWSConnectUpdateEvaluationFormRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateEvaluationFormRequest class]];
}

- (void) test_AWSConnectUpdateEvaluationFormResponse {
    [self validateSecureCodingForClass:[AWSConnectUpdateEvaluationFormResponse class]];
}

- (void) test_AWSConnectUpdateHoursOfOperationRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateHoursOfOperationRequest class]];
}

- (void) test_AWSConnectUpdateInstanceAttributeRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateInstanceAttributeRequest class]];
}

- (void) test_AWSConnectUpdateInstanceStorageConfigRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateInstanceStorageConfigRequest class]];
}

- (void) test_AWSConnectUpdateParticipantRoleConfigChannelInfo {
    [self validateSecureCodingForClass:[AWSConnectUpdateParticipantRoleConfigChannelInfo class]];
}

- (void) test_AWSConnectUpdateParticipantRoleConfigRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateParticipantRoleConfigRequest class]];
}

- (void) test_AWSConnectUpdateParticipantRoleConfigResponse {
    [self validateSecureCodingForClass:[AWSConnectUpdateParticipantRoleConfigResponse class]];
}

- (void) test_AWSConnectUpdatePhoneNumberMetadataRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdatePhoneNumberMetadataRequest class]];
}

- (void) test_AWSConnectUpdatePhoneNumberRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdatePhoneNumberRequest class]];
}

- (void) test_AWSConnectUpdatePhoneNumberResponse {
    [self validateSecureCodingForClass:[AWSConnectUpdatePhoneNumberResponse class]];
}

- (void) test_AWSConnectUpdatePredefinedAttributeRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdatePredefinedAttributeRequest class]];
}

- (void) test_AWSConnectUpdatePromptRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdatePromptRequest class]];
}

- (void) test_AWSConnectUpdatePromptResponse {
    [self validateSecureCodingForClass:[AWSConnectUpdatePromptResponse class]];
}

- (void) test_AWSConnectUpdateQueueHoursOfOperationRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateQueueHoursOfOperationRequest class]];
}

- (void) test_AWSConnectUpdateQueueMaxContactsRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateQueueMaxContactsRequest class]];
}

- (void) test_AWSConnectUpdateQueueNameRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateQueueNameRequest class]];
}

- (void) test_AWSConnectUpdateQueueOutboundCallerConfigRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateQueueOutboundCallerConfigRequest class]];
}

- (void) test_AWSConnectUpdateQueueStatusRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateQueueStatusRequest class]];
}

- (void) test_AWSConnectUpdateQuickConnectConfigRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateQuickConnectConfigRequest class]];
}

- (void) test_AWSConnectUpdateQuickConnectNameRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateQuickConnectNameRequest class]];
}

- (void) test_AWSConnectUpdateRoutingProfileAgentAvailabilityTimerRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateRoutingProfileAgentAvailabilityTimerRequest class]];
}

- (void) test_AWSConnectUpdateRoutingProfileConcurrencyRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateRoutingProfileConcurrencyRequest class]];
}

- (void) test_AWSConnectUpdateRoutingProfileDefaultOutboundQueueRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateRoutingProfileDefaultOutboundQueueRequest class]];
}

- (void) test_AWSConnectUpdateRoutingProfileNameRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateRoutingProfileNameRequest class]];
}

- (void) test_AWSConnectUpdateRoutingProfileQueuesRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateRoutingProfileQueuesRequest class]];
}

- (void) test_AWSConnectUpdateRuleRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateRuleRequest class]];
}

- (void) test_AWSConnectUpdateSecurityProfileRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateSecurityProfileRequest class]];
}

- (void) test_AWSConnectUpdateTaskTemplateRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateTaskTemplateRequest class]];
}

- (void) test_AWSConnectUpdateTaskTemplateResponse {
    [self validateSecureCodingForClass:[AWSConnectUpdateTaskTemplateResponse class]];
}

- (void) test_AWSConnectUpdateTrafficDistributionRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateTrafficDistributionRequest class]];
}

- (void) test_AWSConnectUpdateTrafficDistributionResponse {
    [self validateSecureCodingForClass:[AWSConnectUpdateTrafficDistributionResponse class]];
}

- (void) test_AWSConnectUpdateUserHierarchyGroupNameRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateUserHierarchyGroupNameRequest class]];
}

- (void) test_AWSConnectUpdateUserHierarchyRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateUserHierarchyRequest class]];
}

- (void) test_AWSConnectUpdateUserHierarchyStructureRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateUserHierarchyStructureRequest class]];
}

- (void) test_AWSConnectUpdateUserIdentityInfoRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateUserIdentityInfoRequest class]];
}

- (void) test_AWSConnectUpdateUserPhoneConfigRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateUserPhoneConfigRequest class]];
}

- (void) test_AWSConnectUpdateUserProficienciesRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateUserProficienciesRequest class]];
}

- (void) test_AWSConnectUpdateUserRoutingProfileRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateUserRoutingProfileRequest class]];
}

- (void) test_AWSConnectUpdateUserSecurityProfilesRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateUserSecurityProfilesRequest class]];
}

- (void) test_AWSConnectUpdateViewContentRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateViewContentRequest class]];
}

- (void) test_AWSConnectUpdateViewContentResponse {
    [self validateSecureCodingForClass:[AWSConnectUpdateViewContentResponse class]];
}

- (void) test_AWSConnectUpdateViewMetadataRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateViewMetadataRequest class]];
}

- (void) test_AWSConnectUpdateViewMetadataResponse {
    [self validateSecureCodingForClass:[AWSConnectUpdateViewMetadataResponse class]];
}

- (void) test_AWSConnectUploadUrlMetadata {
    [self validateSecureCodingForClass:[AWSConnectUploadUrlMetadata class]];
}

- (void) test_AWSConnectUrlReference {
    [self validateSecureCodingForClass:[AWSConnectUrlReference class]];
}

- (void) test_AWSConnectUseCase {
    [self validateSecureCodingForClass:[AWSConnectUseCase class]];
}

- (void) test_AWSConnectUser {
    [self validateSecureCodingForClass:[AWSConnectUser class]];
}

- (void) test_AWSConnectUserData {
    [self validateSecureCodingForClass:[AWSConnectUserData class]];
}

- (void) test_AWSConnectUserDataFilters {
    [self validateSecureCodingForClass:[AWSConnectUserDataFilters class]];
}

- (void) test_AWSConnectUserIdentityInfo {
    [self validateSecureCodingForClass:[AWSConnectUserIdentityInfo class]];
}

- (void) test_AWSConnectUserIdentityInfoLite {
    [self validateSecureCodingForClass:[AWSConnectUserIdentityInfoLite class]];
}

- (void) test_AWSConnectUserPhoneConfig {
    [self validateSecureCodingForClass:[AWSConnectUserPhoneConfig class]];
}

- (void) test_AWSConnectUserProficiency {
    [self validateSecureCodingForClass:[AWSConnectUserProficiency class]];
}

- (void) test_AWSConnectUserProficiencyDisassociate {
    [self validateSecureCodingForClass:[AWSConnectUserProficiencyDisassociate class]];
}

- (void) test_AWSConnectUserQuickConnectConfig {
    [self validateSecureCodingForClass:[AWSConnectUserQuickConnectConfig class]];
}

- (void) test_AWSConnectUserReference {
    [self validateSecureCodingForClass:[AWSConnectUserReference class]];
}

- (void) test_AWSConnectUserSearchCriteria {
    [self validateSecureCodingForClass:[AWSConnectUserSearchCriteria class]];
}

- (void) test_AWSConnectUserSearchFilter {
    [self validateSecureCodingForClass:[AWSConnectUserSearchFilter class]];
}

- (void) test_AWSConnectUserSearchSummary {
    [self validateSecureCodingForClass:[AWSConnectUserSearchSummary class]];
}

- (void) test_AWSConnectUserSummary {
    [self validateSecureCodingForClass:[AWSConnectUserSummary class]];
}

- (void) test_AWSConnectView {
    [self validateSecureCodingForClass:[AWSConnectView class]];
}

- (void) test_AWSConnectViewContent {
    [self validateSecureCodingForClass:[AWSConnectViewContent class]];
}

- (void) test_AWSConnectViewInputContent {
    [self validateSecureCodingForClass:[AWSConnectViewInputContent class]];
}

- (void) test_AWSConnectViewSummary {
    [self validateSecureCodingForClass:[AWSConnectViewSummary class]];
}

- (void) test_AWSConnectViewVersionSummary {
    [self validateSecureCodingForClass:[AWSConnectViewVersionSummary class]];
}

- (void) test_AWSConnectVocabulary {
    [self validateSecureCodingForClass:[AWSConnectVocabulary class]];
}

- (void) test_AWSConnectVocabularySummary {
    [self validateSecureCodingForClass:[AWSConnectVocabularySummary class]];
}

- (void) test_AWSConnectVoiceRecordingConfiguration {
    [self validateSecureCodingForClass:[AWSConnectVoiceRecordingConfiguration class]];
}

- (void) test_AWSConnectWisdomInfo {
    [self validateSecureCodingForClass:[AWSConnectWisdomInfo class]];
}

@end

