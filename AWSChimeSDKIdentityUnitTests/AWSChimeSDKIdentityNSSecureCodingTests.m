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

#import <XCTest/XCTest.h>
#import <AWSNSSecureCodingTestBase/AWSNSSecureCodingTestBase.h>
#import "AWSChimeSDKIdentityModel.h"

@interface AWSChimeSDKIdentityNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSChimeSDKIdentityAppInstance API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityAppInstanceAdmin API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityAppInstanceAdminSummary API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityAppInstanceBot API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityAppInstanceBotSummary API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityAppInstanceRetentionSettings API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityAppInstanceSummary API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityAppInstanceUser API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityAppInstanceUserEndpoint API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityAppInstanceUserEndpointSummary API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityAppInstanceUserSummary API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityChannelRetentionSettings API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityCreateAppInstanceAdminRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityCreateAppInstanceAdminResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityCreateAppInstanceBotRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityCreateAppInstanceBotResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityCreateAppInstanceRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityCreateAppInstanceResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityCreateAppInstanceUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityCreateAppInstanceUserResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityDeleteAppInstanceAdminRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityDeleteAppInstanceBotRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityDeleteAppInstanceRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityDeleteAppInstanceUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityDeregisterAppInstanceUserEndpointRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityDescribeAppInstanceAdminRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityDescribeAppInstanceAdminResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityDescribeAppInstanceBotRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityDescribeAppInstanceBotResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityDescribeAppInstanceRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityDescribeAppInstanceResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityDescribeAppInstanceUserEndpointRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityDescribeAppInstanceUserEndpointResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityDescribeAppInstanceUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityDescribeAppInstanceUserResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityEndpointAttributes API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityEndpointState API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityExpirationSettings API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityGetAppInstanceRetentionSettingsRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityGetAppInstanceRetentionSettingsResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityIdentity API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityInvokedBy API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityLexConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityListAppInstanceAdminsRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityListAppInstanceAdminsResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityListAppInstanceBotsRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityListAppInstanceBotsResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityListAppInstanceUserEndpointsRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityListAppInstanceUserEndpointsResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityListAppInstanceUsersRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityListAppInstanceUsersResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityListAppInstancesRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityListAppInstancesResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityListTagsForResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityListTagsForResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityPutAppInstanceRetentionSettingsRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityPutAppInstanceRetentionSettingsResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityRegisterAppInstanceUserEndpointRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityRegisterAppInstanceUserEndpointResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityTag API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityTagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityUntagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityUpdateAppInstanceBotRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityUpdateAppInstanceBotResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityUpdateAppInstanceRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityUpdateAppInstanceResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityUpdateAppInstanceUserEndpointRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityUpdateAppInstanceUserEndpointResponse API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityUpdateAppInstanceUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSChimeSDKIdentityUpdateAppInstanceUserResponse API_AVAILABLE(ios(11));

@end

@implementation AWSChimeSDKIdentityNSSecureCodingTests

- (void) test_AWSChimeSDKIdentityAppInstance {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityAppInstance class]];
}

- (void) test_AWSChimeSDKIdentityAppInstanceAdmin {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityAppInstanceAdmin class]];
}

- (void) test_AWSChimeSDKIdentityAppInstanceAdminSummary {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityAppInstanceAdminSummary class]];
}

- (void) test_AWSChimeSDKIdentityAppInstanceBot {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityAppInstanceBot class]];
}

- (void) test_AWSChimeSDKIdentityAppInstanceBotSummary {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityAppInstanceBotSummary class]];
}

- (void) test_AWSChimeSDKIdentityAppInstanceRetentionSettings {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityAppInstanceRetentionSettings class]];
}

- (void) test_AWSChimeSDKIdentityAppInstanceSummary {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityAppInstanceSummary class]];
}

- (void) test_AWSChimeSDKIdentityAppInstanceUser {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityAppInstanceUser class]];
}

- (void) test_AWSChimeSDKIdentityAppInstanceUserEndpoint {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityAppInstanceUserEndpoint class]];
}

- (void) test_AWSChimeSDKIdentityAppInstanceUserEndpointSummary {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityAppInstanceUserEndpointSummary class]];
}

- (void) test_AWSChimeSDKIdentityAppInstanceUserSummary {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityAppInstanceUserSummary class]];
}

- (void) test_AWSChimeSDKIdentityChannelRetentionSettings {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityChannelRetentionSettings class]];
}

- (void) test_AWSChimeSDKIdentityConfiguration {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityConfiguration class]];
}

- (void) test_AWSChimeSDKIdentityCreateAppInstanceAdminRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityCreateAppInstanceAdminRequest class]];
}

- (void) test_AWSChimeSDKIdentityCreateAppInstanceAdminResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityCreateAppInstanceAdminResponse class]];
}

- (void) test_AWSChimeSDKIdentityCreateAppInstanceBotRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityCreateAppInstanceBotRequest class]];
}

- (void) test_AWSChimeSDKIdentityCreateAppInstanceBotResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityCreateAppInstanceBotResponse class]];
}

- (void) test_AWSChimeSDKIdentityCreateAppInstanceRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityCreateAppInstanceRequest class]];
}

- (void) test_AWSChimeSDKIdentityCreateAppInstanceResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityCreateAppInstanceResponse class]];
}

- (void) test_AWSChimeSDKIdentityCreateAppInstanceUserRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityCreateAppInstanceUserRequest class]];
}

- (void) test_AWSChimeSDKIdentityCreateAppInstanceUserResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityCreateAppInstanceUserResponse class]];
}

- (void) test_AWSChimeSDKIdentityDeleteAppInstanceAdminRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityDeleteAppInstanceAdminRequest class]];
}

- (void) test_AWSChimeSDKIdentityDeleteAppInstanceBotRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityDeleteAppInstanceBotRequest class]];
}

- (void) test_AWSChimeSDKIdentityDeleteAppInstanceRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityDeleteAppInstanceRequest class]];
}

- (void) test_AWSChimeSDKIdentityDeleteAppInstanceUserRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityDeleteAppInstanceUserRequest class]];
}

- (void) test_AWSChimeSDKIdentityDeregisterAppInstanceUserEndpointRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityDeregisterAppInstanceUserEndpointRequest class]];
}

- (void) test_AWSChimeSDKIdentityDescribeAppInstanceAdminRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityDescribeAppInstanceAdminRequest class]];
}

- (void) test_AWSChimeSDKIdentityDescribeAppInstanceAdminResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityDescribeAppInstanceAdminResponse class]];
}

- (void) test_AWSChimeSDKIdentityDescribeAppInstanceBotRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityDescribeAppInstanceBotRequest class]];
}

- (void) test_AWSChimeSDKIdentityDescribeAppInstanceBotResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityDescribeAppInstanceBotResponse class]];
}

- (void) test_AWSChimeSDKIdentityDescribeAppInstanceRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityDescribeAppInstanceRequest class]];
}

- (void) test_AWSChimeSDKIdentityDescribeAppInstanceResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityDescribeAppInstanceResponse class]];
}

- (void) test_AWSChimeSDKIdentityDescribeAppInstanceUserEndpointRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityDescribeAppInstanceUserEndpointRequest class]];
}

- (void) test_AWSChimeSDKIdentityDescribeAppInstanceUserEndpointResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityDescribeAppInstanceUserEndpointResponse class]];
}

- (void) test_AWSChimeSDKIdentityDescribeAppInstanceUserRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityDescribeAppInstanceUserRequest class]];
}

- (void) test_AWSChimeSDKIdentityDescribeAppInstanceUserResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityDescribeAppInstanceUserResponse class]];
}

- (void) test_AWSChimeSDKIdentityEndpointAttributes {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityEndpointAttributes class]];
}

- (void) test_AWSChimeSDKIdentityEndpointState {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityEndpointState class]];
}

- (void) test_AWSChimeSDKIdentityExpirationSettings {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityExpirationSettings class]];
}

- (void) test_AWSChimeSDKIdentityGetAppInstanceRetentionSettingsRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityGetAppInstanceRetentionSettingsRequest class]];
}

- (void) test_AWSChimeSDKIdentityGetAppInstanceRetentionSettingsResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityGetAppInstanceRetentionSettingsResponse class]];
}

- (void) test_AWSChimeSDKIdentityIdentity {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityIdentity class]];
}

- (void) test_AWSChimeSDKIdentityInvokedBy {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityInvokedBy class]];
}

- (void) test_AWSChimeSDKIdentityLexConfiguration {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityLexConfiguration class]];
}

- (void) test_AWSChimeSDKIdentityListAppInstanceAdminsRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityListAppInstanceAdminsRequest class]];
}

- (void) test_AWSChimeSDKIdentityListAppInstanceAdminsResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityListAppInstanceAdminsResponse class]];
}

- (void) test_AWSChimeSDKIdentityListAppInstanceBotsRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityListAppInstanceBotsRequest class]];
}

- (void) test_AWSChimeSDKIdentityListAppInstanceBotsResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityListAppInstanceBotsResponse class]];
}

- (void) test_AWSChimeSDKIdentityListAppInstanceUserEndpointsRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityListAppInstanceUserEndpointsRequest class]];
}

- (void) test_AWSChimeSDKIdentityListAppInstanceUserEndpointsResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityListAppInstanceUserEndpointsResponse class]];
}

- (void) test_AWSChimeSDKIdentityListAppInstanceUsersRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityListAppInstanceUsersRequest class]];
}

- (void) test_AWSChimeSDKIdentityListAppInstanceUsersResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityListAppInstanceUsersResponse class]];
}

- (void) test_AWSChimeSDKIdentityListAppInstancesRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityListAppInstancesRequest class]];
}

- (void) test_AWSChimeSDKIdentityListAppInstancesResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityListAppInstancesResponse class]];
}

- (void) test_AWSChimeSDKIdentityListTagsForResourceRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityListTagsForResourceRequest class]];
}

- (void) test_AWSChimeSDKIdentityListTagsForResourceResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityListTagsForResourceResponse class]];
}

- (void) test_AWSChimeSDKIdentityPutAppInstanceRetentionSettingsRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityPutAppInstanceRetentionSettingsRequest class]];
}

- (void) test_AWSChimeSDKIdentityPutAppInstanceRetentionSettingsResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityPutAppInstanceRetentionSettingsResponse class]];
}

- (void) test_AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsRequest class]];
}

- (void) test_AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsResponse class]];
}

- (void) test_AWSChimeSDKIdentityRegisterAppInstanceUserEndpointRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityRegisterAppInstanceUserEndpointRequest class]];
}

- (void) test_AWSChimeSDKIdentityRegisterAppInstanceUserEndpointResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityRegisterAppInstanceUserEndpointResponse class]];
}

- (void) test_AWSChimeSDKIdentityTag {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityTag class]];
}

- (void) test_AWSChimeSDKIdentityTagResourceRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityTagResourceRequest class]];
}

- (void) test_AWSChimeSDKIdentityUntagResourceRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityUntagResourceRequest class]];
}

- (void) test_AWSChimeSDKIdentityUpdateAppInstanceBotRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityUpdateAppInstanceBotRequest class]];
}

- (void) test_AWSChimeSDKIdentityUpdateAppInstanceBotResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityUpdateAppInstanceBotResponse class]];
}

- (void) test_AWSChimeSDKIdentityUpdateAppInstanceRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityUpdateAppInstanceRequest class]];
}

- (void) test_AWSChimeSDKIdentityUpdateAppInstanceResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityUpdateAppInstanceResponse class]];
}

- (void) test_AWSChimeSDKIdentityUpdateAppInstanceUserEndpointRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityUpdateAppInstanceUserEndpointRequest class]];
}

- (void) test_AWSChimeSDKIdentityUpdateAppInstanceUserEndpointResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityUpdateAppInstanceUserEndpointResponse class]];
}

- (void) test_AWSChimeSDKIdentityUpdateAppInstanceUserRequest {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityUpdateAppInstanceUserRequest class]];
}

- (void) test_AWSChimeSDKIdentityUpdateAppInstanceUserResponse {
    [self validateSecureCodingForClass:[AWSChimeSDKIdentityUpdateAppInstanceUserResponse class]];
}

@end

