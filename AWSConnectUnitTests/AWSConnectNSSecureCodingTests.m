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

#import <XCTest/XCTest.h>
#import <AWSNSSecureCodingTestBase/AWSNSSecureCodingTestBase.h>
#import "AWSConnectModel.h"

@interface AWSConnectNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSConnectAssociateApprovedOriginRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateInstanceStorageConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateInstanceStorageConfigResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateLambdaFunctionRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateLexBotRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateRoutingProfileQueuesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateSecurityKeyRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectAssociateSecurityKeyResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectAttribute API_AVAILABLE(ios(11));
- (void) test_AWSConnectChatMessage API_AVAILABLE(ios(11));
- (void) test_AWSConnectContactFlow API_AVAILABLE(ios(11));
- (void) test_AWSConnectContactFlowSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateContactFlowRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateContactFlowResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateInstanceRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateInstanceResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateIntegrationAssociationRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateIntegrationAssociationResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateQuickConnectRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateQuickConnectResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateRoutingProfileRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateRoutingProfileResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateUseCaseRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateUseCaseResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateUserHierarchyGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateUserHierarchyGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectCreateUserResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectCredentials API_AVAILABLE(ios(11));
- (void) test_AWSConnectCurrentMetric API_AVAILABLE(ios(11));
- (void) test_AWSConnectCurrentMetricData API_AVAILABLE(ios(11));
- (void) test_AWSConnectCurrentMetricResult API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteInstanceRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteIntegrationAssociationRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteQuickConnectRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteUseCaseRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteUserHierarchyGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDeleteUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeContactFlowRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeContactFlowResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeInstanceAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeInstanceAttributeResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeInstanceRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeInstanceResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeInstanceStorageConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeInstanceStorageConfigResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeQuickConnectRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeQuickConnectResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeRoutingProfileRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeRoutingProfileResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeUserHierarchyGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeUserHierarchyGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeUserHierarchyStructureRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeUserHierarchyStructureResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDescribeUserResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectDimensions API_AVAILABLE(ios(11));
- (void) test_AWSConnectDisassociateApprovedOriginRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDisassociateInstanceStorageConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDisassociateLambdaFunctionRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDisassociateLexBotRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDisassociateRoutingProfileQueuesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectDisassociateSecurityKeyRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectEncryptionConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectFilters API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetContactAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetContactAttributesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetCurrentMetricDataRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetCurrentMetricDataResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetFederationTokenRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetFederationTokenResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetMetricDataRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectGetMetricDataResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectHierarchyGroup API_AVAILABLE(ios(11));
- (void) test_AWSConnectHierarchyGroupSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectHierarchyLevel API_AVAILABLE(ios(11));
- (void) test_AWSConnectHierarchyLevelUpdate API_AVAILABLE(ios(11));
- (void) test_AWSConnectHierarchyPath API_AVAILABLE(ios(11));
- (void) test_AWSConnectHierarchyStructure API_AVAILABLE(ios(11));
- (void) test_AWSConnectHierarchyStructureUpdate API_AVAILABLE(ios(11));
- (void) test_AWSConnectHistoricalMetric API_AVAILABLE(ios(11));
- (void) test_AWSConnectHistoricalMetricData API_AVAILABLE(ios(11));
- (void) test_AWSConnectHistoricalMetricResult API_AVAILABLE(ios(11));
- (void) test_AWSConnectHoursOfOperationSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectInstance API_AVAILABLE(ios(11));
- (void) test_AWSConnectInstanceStatusReason API_AVAILABLE(ios(11));
- (void) test_AWSConnectInstanceStorageConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectInstanceSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectIntegrationAssociationSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectKinesisFirehoseConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectKinesisStreamConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectKinesisVideoStreamConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectLexBot API_AVAILABLE(ios(11));
- (void) test_AWSConnectListApprovedOriginsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListApprovedOriginsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListContactFlowsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListContactFlowsResponse API_AVAILABLE(ios(11));
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
- (void) test_AWSConnectListPromptsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListPromptsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListQueuesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListQueuesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListQuickConnectsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListQuickConnectsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListRoutingProfileQueuesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListRoutingProfileQueuesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListRoutingProfilesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListRoutingProfilesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListSecurityKeysRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListSecurityKeysResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListSecurityProfilesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListSecurityProfilesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListTagsForResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListTagsForResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListUseCasesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListUseCasesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListUserHierarchyGroupsRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListUserHierarchyGroupsResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectListUsersRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectListUsersResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectMediaConcurrency API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantDetails API_AVAILABLE(ios(11));
- (void) test_AWSConnectPhoneNumberQuickConnectConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectPhoneNumberSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectProblemDetail API_AVAILABLE(ios(11));
- (void) test_AWSConnectPromptSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectQueueQuickConnectConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectQueueReference API_AVAILABLE(ios(11));
- (void) test_AWSConnectQueueSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectQuickConnect API_AVAILABLE(ios(11));
- (void) test_AWSConnectQuickConnectConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectQuickConnectSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectReference API_AVAILABLE(ios(11));
- (void) test_AWSConnectResumeContactRecordingRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectResumeContactRecordingResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectRoutingProfile API_AVAILABLE(ios(11));
- (void) test_AWSConnectRoutingProfileQueueConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectRoutingProfileQueueConfigSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectRoutingProfileQueueReference API_AVAILABLE(ios(11));
- (void) test_AWSConnectRoutingProfileSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectS3Config API_AVAILABLE(ios(11));
- (void) test_AWSConnectSecurityKey API_AVAILABLE(ios(11));
- (void) test_AWSConnectSecurityProfileSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectStartChatContactRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectStartChatContactResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectStartContactRecordingRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectStartContactRecordingResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectStartOutboundVoiceContactRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectStartOutboundVoiceContactResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectStartTaskContactRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectStartTaskContactResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectStopContactRecordingRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectStopContactRecordingResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectStopContactRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectStopContactResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectSuspendContactRecordingRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectSuspendContactRecordingResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectTagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectThreshold API_AVAILABLE(ios(11));
- (void) test_AWSConnectUntagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateContactAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateContactAttributesResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateContactFlowContentRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateContactFlowNameRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateInstanceAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateInstanceStorageConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateQuickConnectConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateQuickConnectNameRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateRoutingProfileConcurrencyRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateRoutingProfileDefaultOutboundQueueRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateRoutingProfileNameRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateRoutingProfileQueuesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateUserHierarchyGroupNameRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateUserHierarchyRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateUserHierarchyStructureRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateUserIdentityInfoRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateUserPhoneConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateUserRoutingProfileRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUpdateUserSecurityProfilesRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectUseCase API_AVAILABLE(ios(11));
- (void) test_AWSConnectUser API_AVAILABLE(ios(11));
- (void) test_AWSConnectUserIdentityInfo API_AVAILABLE(ios(11));
- (void) test_AWSConnectUserPhoneConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectUserQuickConnectConfig API_AVAILABLE(ios(11));
- (void) test_AWSConnectUserSummary API_AVAILABLE(ios(11));
- (void) test_AWSConnectVoiceRecordingConfiguration API_AVAILABLE(ios(11));

@end

@implementation AWSConnectNSSecureCodingTests

- (void) test_AWSConnectAssociateApprovedOriginRequest {
    [self validateSecureCodingForClass:[AWSConnectAssociateApprovedOriginRequest class]];
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

- (void) test_AWSConnectAssociateRoutingProfileQueuesRequest {
    [self validateSecureCodingForClass:[AWSConnectAssociateRoutingProfileQueuesRequest class]];
}

- (void) test_AWSConnectAssociateSecurityKeyRequest {
    [self validateSecureCodingForClass:[AWSConnectAssociateSecurityKeyRequest class]];
}

- (void) test_AWSConnectAssociateSecurityKeyResponse {
    [self validateSecureCodingForClass:[AWSConnectAssociateSecurityKeyResponse class]];
}

- (void) test_AWSConnectAttribute {
    [self validateSecureCodingForClass:[AWSConnectAttribute class]];
}

- (void) test_AWSConnectChatMessage {
    [self validateSecureCodingForClass:[AWSConnectChatMessage class]];
}

- (void) test_AWSConnectContactFlow {
    [self validateSecureCodingForClass:[AWSConnectContactFlow class]];
}

- (void) test_AWSConnectContactFlowSummary {
    [self validateSecureCodingForClass:[AWSConnectContactFlowSummary class]];
}

- (void) test_AWSConnectCreateContactFlowRequest {
    [self validateSecureCodingForClass:[AWSConnectCreateContactFlowRequest class]];
}

- (void) test_AWSConnectCreateContactFlowResponse {
    [self validateSecureCodingForClass:[AWSConnectCreateContactFlowResponse class]];
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

- (void) test_AWSConnectCredentials {
    [self validateSecureCodingForClass:[AWSConnectCredentials class]];
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

- (void) test_AWSConnectDeleteInstanceRequest {
    [self validateSecureCodingForClass:[AWSConnectDeleteInstanceRequest class]];
}

- (void) test_AWSConnectDeleteIntegrationAssociationRequest {
    [self validateSecureCodingForClass:[AWSConnectDeleteIntegrationAssociationRequest class]];
}

- (void) test_AWSConnectDeleteQuickConnectRequest {
    [self validateSecureCodingForClass:[AWSConnectDeleteQuickConnectRequest class]];
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

- (void) test_AWSConnectDescribeContactFlowRequest {
    [self validateSecureCodingForClass:[AWSConnectDescribeContactFlowRequest class]];
}

- (void) test_AWSConnectDescribeContactFlowResponse {
    [self validateSecureCodingForClass:[AWSConnectDescribeContactFlowResponse class]];
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

- (void) test_AWSConnectDimensions {
    [self validateSecureCodingForClass:[AWSConnectDimensions class]];
}

- (void) test_AWSConnectDisassociateApprovedOriginRequest {
    [self validateSecureCodingForClass:[AWSConnectDisassociateApprovedOriginRequest class]];
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

- (void) test_AWSConnectDisassociateRoutingProfileQueuesRequest {
    [self validateSecureCodingForClass:[AWSConnectDisassociateRoutingProfileQueuesRequest class]];
}

- (void) test_AWSConnectDisassociateSecurityKeyRequest {
    [self validateSecureCodingForClass:[AWSConnectDisassociateSecurityKeyRequest class]];
}

- (void) test_AWSConnectEncryptionConfig {
    [self validateSecureCodingForClass:[AWSConnectEncryptionConfig class]];
}

- (void) test_AWSConnectFilters {
    [self validateSecureCodingForClass:[AWSConnectFilters class]];
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

- (void) test_AWSConnectGetFederationTokenRequest {
    [self validateSecureCodingForClass:[AWSConnectGetFederationTokenRequest class]];
}

- (void) test_AWSConnectGetFederationTokenResponse {
    [self validateSecureCodingForClass:[AWSConnectGetFederationTokenResponse class]];
}

- (void) test_AWSConnectGetMetricDataRequest {
    [self validateSecureCodingForClass:[AWSConnectGetMetricDataRequest class]];
}

- (void) test_AWSConnectGetMetricDataResponse {
    [self validateSecureCodingForClass:[AWSConnectGetMetricDataResponse class]];
}

- (void) test_AWSConnectHierarchyGroup {
    [self validateSecureCodingForClass:[AWSConnectHierarchyGroup class]];
}

- (void) test_AWSConnectHierarchyGroupSummary {
    [self validateSecureCodingForClass:[AWSConnectHierarchyGroupSummary class]];
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

- (void) test_AWSConnectHoursOfOperationSummary {
    [self validateSecureCodingForClass:[AWSConnectHoursOfOperationSummary class]];
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

- (void) test_AWSConnectListApprovedOriginsRequest {
    [self validateSecureCodingForClass:[AWSConnectListApprovedOriginsRequest class]];
}

- (void) test_AWSConnectListApprovedOriginsResponse {
    [self validateSecureCodingForClass:[AWSConnectListApprovedOriginsResponse class]];
}

- (void) test_AWSConnectListContactFlowsRequest {
    [self validateSecureCodingForClass:[AWSConnectListContactFlowsRequest class]];
}

- (void) test_AWSConnectListContactFlowsResponse {
    [self validateSecureCodingForClass:[AWSConnectListContactFlowsResponse class]];
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

- (void) test_AWSConnectListPromptsRequest {
    [self validateSecureCodingForClass:[AWSConnectListPromptsRequest class]];
}

- (void) test_AWSConnectListPromptsResponse {
    [self validateSecureCodingForClass:[AWSConnectListPromptsResponse class]];
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

- (void) test_AWSConnectListSecurityKeysRequest {
    [self validateSecureCodingForClass:[AWSConnectListSecurityKeysRequest class]];
}

- (void) test_AWSConnectListSecurityKeysResponse {
    [self validateSecureCodingForClass:[AWSConnectListSecurityKeysResponse class]];
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

- (void) test_AWSConnectListUsersRequest {
    [self validateSecureCodingForClass:[AWSConnectListUsersRequest class]];
}

- (void) test_AWSConnectListUsersResponse {
    [self validateSecureCodingForClass:[AWSConnectListUsersResponse class]];
}

- (void) test_AWSConnectMediaConcurrency {
    [self validateSecureCodingForClass:[AWSConnectMediaConcurrency class]];
}

- (void) test_AWSConnectParticipantDetails {
    [self validateSecureCodingForClass:[AWSConnectParticipantDetails class]];
}

- (void) test_AWSConnectPhoneNumberQuickConnectConfig {
    [self validateSecureCodingForClass:[AWSConnectPhoneNumberQuickConnectConfig class]];
}

- (void) test_AWSConnectPhoneNumberSummary {
    [self validateSecureCodingForClass:[AWSConnectPhoneNumberSummary class]];
}

- (void) test_AWSConnectProblemDetail {
    [self validateSecureCodingForClass:[AWSConnectProblemDetail class]];
}

- (void) test_AWSConnectPromptSummary {
    [self validateSecureCodingForClass:[AWSConnectPromptSummary class]];
}

- (void) test_AWSConnectQueueQuickConnectConfig {
    [self validateSecureCodingForClass:[AWSConnectQueueQuickConnectConfig class]];
}

- (void) test_AWSConnectQueueReference {
    [self validateSecureCodingForClass:[AWSConnectQueueReference class]];
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

- (void) test_AWSConnectQuickConnectSummary {
    [self validateSecureCodingForClass:[AWSConnectQuickConnectSummary class]];
}

- (void) test_AWSConnectReference {
    [self validateSecureCodingForClass:[AWSConnectReference class]];
}

- (void) test_AWSConnectResumeContactRecordingRequest {
    [self validateSecureCodingForClass:[AWSConnectResumeContactRecordingRequest class]];
}

- (void) test_AWSConnectResumeContactRecordingResponse {
    [self validateSecureCodingForClass:[AWSConnectResumeContactRecordingResponse class]];
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

- (void) test_AWSConnectRoutingProfileSummary {
    [self validateSecureCodingForClass:[AWSConnectRoutingProfileSummary class]];
}

- (void) test_AWSConnectS3Config {
    [self validateSecureCodingForClass:[AWSConnectS3Config class]];
}

- (void) test_AWSConnectSecurityKey {
    [self validateSecureCodingForClass:[AWSConnectSecurityKey class]];
}

- (void) test_AWSConnectSecurityProfileSummary {
    [self validateSecureCodingForClass:[AWSConnectSecurityProfileSummary class]];
}

- (void) test_AWSConnectStartChatContactRequest {
    [self validateSecureCodingForClass:[AWSConnectStartChatContactRequest class]];
}

- (void) test_AWSConnectStartChatContactResponse {
    [self validateSecureCodingForClass:[AWSConnectStartChatContactResponse class]];
}

- (void) test_AWSConnectStartContactRecordingRequest {
    [self validateSecureCodingForClass:[AWSConnectStartContactRecordingRequest class]];
}

- (void) test_AWSConnectStartContactRecordingResponse {
    [self validateSecureCodingForClass:[AWSConnectStartContactRecordingResponse class]];
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

- (void) test_AWSConnectSuspendContactRecordingRequest {
    [self validateSecureCodingForClass:[AWSConnectSuspendContactRecordingRequest class]];
}

- (void) test_AWSConnectSuspendContactRecordingResponse {
    [self validateSecureCodingForClass:[AWSConnectSuspendContactRecordingResponse class]];
}

- (void) test_AWSConnectTagResourceRequest {
    [self validateSecureCodingForClass:[AWSConnectTagResourceRequest class]];
}

- (void) test_AWSConnectThreshold {
    [self validateSecureCodingForClass:[AWSConnectThreshold class]];
}

- (void) test_AWSConnectUntagResourceRequest {
    [self validateSecureCodingForClass:[AWSConnectUntagResourceRequest class]];
}

- (void) test_AWSConnectUpdateContactAttributesRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateContactAttributesRequest class]];
}

- (void) test_AWSConnectUpdateContactAttributesResponse {
    [self validateSecureCodingForClass:[AWSConnectUpdateContactAttributesResponse class]];
}

- (void) test_AWSConnectUpdateContactFlowContentRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateContactFlowContentRequest class]];
}

- (void) test_AWSConnectUpdateContactFlowNameRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateContactFlowNameRequest class]];
}

- (void) test_AWSConnectUpdateInstanceAttributeRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateInstanceAttributeRequest class]];
}

- (void) test_AWSConnectUpdateInstanceStorageConfigRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateInstanceStorageConfigRequest class]];
}

- (void) test_AWSConnectUpdateQuickConnectConfigRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateQuickConnectConfigRequest class]];
}

- (void) test_AWSConnectUpdateQuickConnectNameRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateQuickConnectNameRequest class]];
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

- (void) test_AWSConnectUpdateUserRoutingProfileRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateUserRoutingProfileRequest class]];
}

- (void) test_AWSConnectUpdateUserSecurityProfilesRequest {
    [self validateSecureCodingForClass:[AWSConnectUpdateUserSecurityProfilesRequest class]];
}

- (void) test_AWSConnectUseCase {
    [self validateSecureCodingForClass:[AWSConnectUseCase class]];
}

- (void) test_AWSConnectUser {
    [self validateSecureCodingForClass:[AWSConnectUser class]];
}

- (void) test_AWSConnectUserIdentityInfo {
    [self validateSecureCodingForClass:[AWSConnectUserIdentityInfo class]];
}

- (void) test_AWSConnectUserPhoneConfig {
    [self validateSecureCodingForClass:[AWSConnectUserPhoneConfig class]];
}

- (void) test_AWSConnectUserQuickConnectConfig {
    [self validateSecureCodingForClass:[AWSConnectUserQuickConnectConfig class]];
}

- (void) test_AWSConnectUserSummary {
    [self validateSecureCodingForClass:[AWSConnectUserSummary class]];
}

- (void) test_AWSConnectVoiceRecordingConfiguration {
    [self validateSecureCodingForClass:[AWSConnectVoiceRecordingConfiguration class]];
}

@end

