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
#import "AWSChimeSDKMessagingModel.h"

@interface AWSChimeSDKMessagingNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSChimeSDKMessagingAppInstanceUserMembershipSummary API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingAssociateChannelFlowRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingBatchChannelMemberships API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingBatchCreateChannelMembershipError API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingBatchCreateChannelMembershipRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingBatchCreateChannelMembershipResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingChannel API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingChannelAssociatedWithFlowSummary API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingChannelBan API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingChannelBanSummary API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingChannelFlow API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingChannelFlowCallbackRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingChannelFlowCallbackResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingChannelFlowSummary API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingChannelMembership API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingChannelMembershipForAppInstanceUserSummary API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingChannelMembershipPreferences API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingChannelMembershipSummary API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingChannelMessage API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingChannelMessageCallback API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingChannelMessageStatusStructure API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingChannelMessageSummary API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingChannelModeratedByAppInstanceUserSummary API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingChannelModerator API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingChannelModeratorSummary API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingChannelSummary API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingCreateChannelBanRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingCreateChannelBanResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingCreateChannelFlowRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingCreateChannelFlowResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingCreateChannelMembershipRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingCreateChannelMembershipResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingCreateChannelModeratorRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingCreateChannelModeratorResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingCreateChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingCreateChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingDeleteChannelBanRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingDeleteChannelFlowRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingDeleteChannelMembershipRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingDeleteChannelMessageRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingDeleteChannelModeratorRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingDeleteChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingDescribeChannelBanRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingDescribeChannelBanResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingDescribeChannelFlowRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingDescribeChannelFlowResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingDescribeChannelMembershipRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingDescribeChannelMembershipResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingDescribeChannelModeratorRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingDescribeChannelModeratorResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingDescribeChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingDescribeChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingDisassociateChannelFlowRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingElasticChannelConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingGetChannelMembershipPreferencesRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingGetChannelMembershipPreferencesResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingGetChannelMessageRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingGetChannelMessageResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingGetChannelMessageStatusRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingGetChannelMessageStatusResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingGetMessagingSessionEndpointRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingGetMessagingSessionEndpointResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingIdentity API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingLambdaConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingListChannelBansRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingListChannelBansResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingListChannelFlowsRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingListChannelFlowsResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingListChannelMembershipsRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingListChannelMembershipsResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingListChannelMessagesRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingListChannelMessagesResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingListChannelModeratorsRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingListChannelModeratorsResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingListChannelsAssociatedWithChannelFlowRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingListChannelsAssociatedWithChannelFlowResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingListChannelsRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingListChannelsResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingListSubChannelsRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingListSubChannelsResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingListTagsForResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingListTagsForResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingMessageAttributeValue API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingMessagingSessionEndpoint API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingProcessor API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingProcessorConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingPushNotificationConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingPushNotificationPreferences API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingPutChannelMembershipPreferencesRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingPutChannelMembershipPreferencesResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingRedactChannelMessageRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingRedactChannelMessageResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingSearchChannelsRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingSearchChannelsResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingSearchField API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingSendChannelMessageRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingSendChannelMessageResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingSubChannelSummary API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingTag API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingTagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingUntagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingUpdateChannelFlowRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingUpdateChannelFlowResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingUpdateChannelMessageRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingUpdateChannelMessageResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingUpdateChannelReadMarkerRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingUpdateChannelReadMarkerResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingUpdateChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKMessagingUpdateChannelResponse API_AVAILABLE(ios(11));

@end

@implementation AWSChimeSDKMessagingNSSecureCodingTests

- (void) test_AWSChimeSDKMessagingAppInstanceUserMembershipSummary {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingAppInstanceUserMembershipSummary class]];
}

- (void) test_AWSChimeSDKMessagingAssociateChannelFlowRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingAssociateChannelFlowRequest class]];
}

- (void) test_AWSChimeSDKMessagingBatchChannelMemberships {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingBatchChannelMemberships class]];
}

- (void) test_AWSChimeSDKMessagingBatchCreateChannelMembershipError {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingBatchCreateChannelMembershipError class]];
}

- (void) test_AWSChimeSDKMessagingBatchCreateChannelMembershipRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingBatchCreateChannelMembershipRequest class]];
}

- (void) test_AWSChimeSDKMessagingBatchCreateChannelMembershipResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingBatchCreateChannelMembershipResponse class]];
}

- (void) test_AWSChimeSDKMessagingChannel {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingChannel class]];
}

- (void) test_AWSChimeSDKMessagingChannelAssociatedWithFlowSummary {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingChannelAssociatedWithFlowSummary class]];
}

- (void) test_AWSChimeSDKMessagingChannelBan {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingChannelBan class]];
}

- (void) test_AWSChimeSDKMessagingChannelBanSummary {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingChannelBanSummary class]];
}

- (void) test_AWSChimeSDKMessagingChannelFlow {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingChannelFlow class]];
}

- (void) test_AWSChimeSDKMessagingChannelFlowCallbackRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingChannelFlowCallbackRequest class]];
}

- (void) test_AWSChimeSDKMessagingChannelFlowCallbackResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingChannelFlowCallbackResponse class]];
}

- (void) test_AWSChimeSDKMessagingChannelFlowSummary {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingChannelFlowSummary class]];
}

- (void) test_AWSChimeSDKMessagingChannelMembership {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingChannelMembership class]];
}

- (void) test_AWSChimeSDKMessagingChannelMembershipForAppInstanceUserSummary {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingChannelMembershipForAppInstanceUserSummary class]];
}

- (void) test_AWSChimeSDKMessagingChannelMembershipPreferences {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingChannelMembershipPreferences class]];
}

- (void) test_AWSChimeSDKMessagingChannelMembershipSummary {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingChannelMembershipSummary class]];
}

- (void) test_AWSChimeSDKMessagingChannelMessage {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingChannelMessage class]];
}

- (void) test_AWSChimeSDKMessagingChannelMessageCallback {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingChannelMessageCallback class]];
}

- (void) test_AWSChimeSDKMessagingChannelMessageStatusStructure {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingChannelMessageStatusStructure class]];
}

- (void) test_AWSChimeSDKMessagingChannelMessageSummary {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingChannelMessageSummary class]];
}

- (void) test_AWSChimeSDKMessagingChannelModeratedByAppInstanceUserSummary {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingChannelModeratedByAppInstanceUserSummary class]];
}

- (void) test_AWSChimeSDKMessagingChannelModerator {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingChannelModerator class]];
}

- (void) test_AWSChimeSDKMessagingChannelModeratorSummary {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingChannelModeratorSummary class]];
}

- (void) test_AWSChimeSDKMessagingChannelSummary {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingChannelSummary class]];
}

- (void) test_AWSChimeSDKMessagingCreateChannelBanRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingCreateChannelBanRequest class]];
}

- (void) test_AWSChimeSDKMessagingCreateChannelBanResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingCreateChannelBanResponse class]];
}

- (void) test_AWSChimeSDKMessagingCreateChannelFlowRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingCreateChannelFlowRequest class]];
}

- (void) test_AWSChimeSDKMessagingCreateChannelFlowResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingCreateChannelFlowResponse class]];
}

- (void) test_AWSChimeSDKMessagingCreateChannelMembershipRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingCreateChannelMembershipRequest class]];
}

- (void) test_AWSChimeSDKMessagingCreateChannelMembershipResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingCreateChannelMembershipResponse class]];
}

- (void) test_AWSChimeSDKMessagingCreateChannelModeratorRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingCreateChannelModeratorRequest class]];
}

- (void) test_AWSChimeSDKMessagingCreateChannelModeratorResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingCreateChannelModeratorResponse class]];
}

- (void) test_AWSChimeSDKMessagingCreateChannelRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingCreateChannelRequest class]];
}

- (void) test_AWSChimeSDKMessagingCreateChannelResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingCreateChannelResponse class]];
}

- (void) test_AWSChimeSDKMessagingDeleteChannelBanRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingDeleteChannelBanRequest class]];
}

- (void) test_AWSChimeSDKMessagingDeleteChannelFlowRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingDeleteChannelFlowRequest class]];
}

- (void) test_AWSChimeSDKMessagingDeleteChannelMembershipRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingDeleteChannelMembershipRequest class]];
}

- (void) test_AWSChimeSDKMessagingDeleteChannelMessageRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingDeleteChannelMessageRequest class]];
}

- (void) test_AWSChimeSDKMessagingDeleteChannelModeratorRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingDeleteChannelModeratorRequest class]];
}

- (void) test_AWSChimeSDKMessagingDeleteChannelRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingDeleteChannelRequest class]];
}

- (void) test_AWSChimeSDKMessagingDescribeChannelBanRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingDescribeChannelBanRequest class]];
}

- (void) test_AWSChimeSDKMessagingDescribeChannelBanResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingDescribeChannelBanResponse class]];
}

- (void) test_AWSChimeSDKMessagingDescribeChannelFlowRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingDescribeChannelFlowRequest class]];
}

- (void) test_AWSChimeSDKMessagingDescribeChannelFlowResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingDescribeChannelFlowResponse class]];
}

- (void) test_AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserRequest class]];
}

- (void) test_AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserResponse class]];
}

- (void) test_AWSChimeSDKMessagingDescribeChannelMembershipRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingDescribeChannelMembershipRequest class]];
}

- (void) test_AWSChimeSDKMessagingDescribeChannelMembershipResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingDescribeChannelMembershipResponse class]];
}

- (void) test_AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserRequest class]];
}

- (void) test_AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserResponse class]];
}

- (void) test_AWSChimeSDKMessagingDescribeChannelModeratorRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingDescribeChannelModeratorRequest class]];
}

- (void) test_AWSChimeSDKMessagingDescribeChannelModeratorResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingDescribeChannelModeratorResponse class]];
}

- (void) test_AWSChimeSDKMessagingDescribeChannelRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingDescribeChannelRequest class]];
}

- (void) test_AWSChimeSDKMessagingDescribeChannelResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingDescribeChannelResponse class]];
}

- (void) test_AWSChimeSDKMessagingDisassociateChannelFlowRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingDisassociateChannelFlowRequest class]];
}

- (void) test_AWSChimeSDKMessagingElasticChannelConfiguration {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingElasticChannelConfiguration class]];
}

- (void) test_AWSChimeSDKMessagingGetChannelMembershipPreferencesRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingGetChannelMembershipPreferencesRequest class]];
}

- (void) test_AWSChimeSDKMessagingGetChannelMembershipPreferencesResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingGetChannelMembershipPreferencesResponse class]];
}

- (void) test_AWSChimeSDKMessagingGetChannelMessageRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingGetChannelMessageRequest class]];
}

- (void) test_AWSChimeSDKMessagingGetChannelMessageResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingGetChannelMessageResponse class]];
}

- (void) test_AWSChimeSDKMessagingGetChannelMessageStatusRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingGetChannelMessageStatusRequest class]];
}

- (void) test_AWSChimeSDKMessagingGetChannelMessageStatusResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingGetChannelMessageStatusResponse class]];
}

- (void) test_AWSChimeSDKMessagingGetMessagingSessionEndpointRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingGetMessagingSessionEndpointRequest class]];
}

- (void) test_AWSChimeSDKMessagingGetMessagingSessionEndpointResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingGetMessagingSessionEndpointResponse class]];
}

- (void) test_AWSChimeSDKMessagingIdentity {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingIdentity class]];
}

- (void) test_AWSChimeSDKMessagingLambdaConfiguration {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingLambdaConfiguration class]];
}

- (void) test_AWSChimeSDKMessagingListChannelBansRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingListChannelBansRequest class]];
}

- (void) test_AWSChimeSDKMessagingListChannelBansResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingListChannelBansResponse class]];
}

- (void) test_AWSChimeSDKMessagingListChannelFlowsRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingListChannelFlowsRequest class]];
}

- (void) test_AWSChimeSDKMessagingListChannelFlowsResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingListChannelFlowsResponse class]];
}

- (void) test_AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserRequest class]];
}

- (void) test_AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserResponse class]];
}

- (void) test_AWSChimeSDKMessagingListChannelMembershipsRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingListChannelMembershipsRequest class]];
}

- (void) test_AWSChimeSDKMessagingListChannelMembershipsResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingListChannelMembershipsResponse class]];
}

- (void) test_AWSChimeSDKMessagingListChannelMessagesRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingListChannelMessagesRequest class]];
}

- (void) test_AWSChimeSDKMessagingListChannelMessagesResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingListChannelMessagesResponse class]];
}

- (void) test_AWSChimeSDKMessagingListChannelModeratorsRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingListChannelModeratorsRequest class]];
}

- (void) test_AWSChimeSDKMessagingListChannelModeratorsResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingListChannelModeratorsResponse class]];
}

- (void) test_AWSChimeSDKMessagingListChannelsAssociatedWithChannelFlowRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingListChannelsAssociatedWithChannelFlowRequest class]];
}

- (void) test_AWSChimeSDKMessagingListChannelsAssociatedWithChannelFlowResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingListChannelsAssociatedWithChannelFlowResponse class]];
}

- (void) test_AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserRequest class]];
}

- (void) test_AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserResponse class]];
}

- (void) test_AWSChimeSDKMessagingListChannelsRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingListChannelsRequest class]];
}

- (void) test_AWSChimeSDKMessagingListChannelsResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingListChannelsResponse class]];
}

- (void) test_AWSChimeSDKMessagingListSubChannelsRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingListSubChannelsRequest class]];
}

- (void) test_AWSChimeSDKMessagingListSubChannelsResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingListSubChannelsResponse class]];
}

- (void) test_AWSChimeSDKMessagingListTagsForResourceRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingListTagsForResourceRequest class]];
}

- (void) test_AWSChimeSDKMessagingListTagsForResourceResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingListTagsForResourceResponse class]];
}

- (void) test_AWSChimeSDKMessagingMessageAttributeValue {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingMessageAttributeValue class]];
}

- (void) test_AWSChimeSDKMessagingMessagingSessionEndpoint {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingMessagingSessionEndpoint class]];
}

- (void) test_AWSChimeSDKMessagingProcessor {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingProcessor class]];
}

- (void) test_AWSChimeSDKMessagingProcessorConfiguration {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingProcessorConfiguration class]];
}

- (void) test_AWSChimeSDKMessagingPushNotificationConfiguration {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingPushNotificationConfiguration class]];
}

- (void) test_AWSChimeSDKMessagingPushNotificationPreferences {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingPushNotificationPreferences class]];
}

- (void) test_AWSChimeSDKMessagingPutChannelMembershipPreferencesRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingPutChannelMembershipPreferencesRequest class]];
}

- (void) test_AWSChimeSDKMessagingPutChannelMembershipPreferencesResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingPutChannelMembershipPreferencesResponse class]];
}

- (void) test_AWSChimeSDKMessagingRedactChannelMessageRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingRedactChannelMessageRequest class]];
}

- (void) test_AWSChimeSDKMessagingRedactChannelMessageResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingRedactChannelMessageResponse class]];
}

- (void) test_AWSChimeSDKMessagingSearchChannelsRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingSearchChannelsRequest class]];
}

- (void) test_AWSChimeSDKMessagingSearchChannelsResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingSearchChannelsResponse class]];
}

- (void) test_AWSChimeSDKMessagingSearchField {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingSearchField class]];
}

- (void) test_AWSChimeSDKMessagingSendChannelMessageRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingSendChannelMessageRequest class]];
}

- (void) test_AWSChimeSDKMessagingSendChannelMessageResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingSendChannelMessageResponse class]];
}

- (void) test_AWSChimeSDKMessagingSubChannelSummary {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingSubChannelSummary class]];
}

- (void) test_AWSChimeSDKMessagingTag {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingTag class]];
}

- (void) test_AWSChimeSDKMessagingTagResourceRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingTagResourceRequest class]];
}

- (void) test_AWSChimeSDKMessagingUntagResourceRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingUntagResourceRequest class]];
}

- (void) test_AWSChimeSDKMessagingUpdateChannelFlowRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingUpdateChannelFlowRequest class]];
}

- (void) test_AWSChimeSDKMessagingUpdateChannelFlowResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingUpdateChannelFlowResponse class]];
}

- (void) test_AWSChimeSDKMessagingUpdateChannelMessageRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingUpdateChannelMessageRequest class]];
}

- (void) test_AWSChimeSDKMessagingUpdateChannelMessageResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingUpdateChannelMessageResponse class]];
}

- (void) test_AWSChimeSDKMessagingUpdateChannelReadMarkerRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingUpdateChannelReadMarkerRequest class]];
}

- (void) test_AWSChimeSDKMessagingUpdateChannelReadMarkerResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingUpdateChannelReadMarkerResponse class]];
}

- (void) test_AWSChimeSDKMessagingUpdateChannelRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingUpdateChannelRequest class]];
}

- (void) test_AWSChimeSDKMessagingUpdateChannelResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKMessagingUpdateChannelResponse class]];
}

@end

