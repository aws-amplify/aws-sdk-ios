//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSCognitoIdentityModel.h"

@interface AWSCognitoIdentityNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSCognitoIdentityCognitoIdentityProvider API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityCreateIdentityPoolInput API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityCredentials API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityDeleteIdentitiesInput API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityDeleteIdentitiesResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityDeleteIdentityPoolInput API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityDescribeIdentityInput API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityDescribeIdentityPoolInput API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityGetCredentialsForIdentityInput API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityGetCredentialsForIdentityResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityGetIdInput API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityGetIdResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityGetIdentityPoolRolesInput API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityGetIdentityPoolRolesResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityInput API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityGetOpenIdTokenInput API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityGetOpenIdTokenResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityGetPrincipalTagAttributeMapInput API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityGetPrincipalTagAttributeMapResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityIdentityDescription API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityIdentityPool API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityIdentityPoolShortDescription API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityListIdentitiesInput API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityListIdentitiesResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityListIdentityPoolsInput API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityListIdentityPoolsResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityListTagsForResourceInput API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityListTagsForResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityLookupDeveloperIdentityInput API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityLookupDeveloperIdentityResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityMappingRule API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityMergeDeveloperIdentitiesInput API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityMergeDeveloperIdentitiesResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityRoleMapping API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityRulesConfigurationType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentitySetIdentityPoolRolesInput API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentitySetPrincipalTagAttributeMapInput API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentitySetPrincipalTagAttributeMapResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityTagResourceInput API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityTagResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityUnlinkDeveloperIdentityInput API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityUnlinkIdentityInput API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityUnprocessedIdentityId API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityUntagResourceInput API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityUntagResourceResponse API_AVAILABLE(ios(11));

@end

@implementation AWSCognitoIdentityNSSecureCodingTests

- (void) test_AWSCognitoIdentityCognitoIdentityProvider {
    [self validateSecureCodingForClass:[AWSCognitoIdentityCognitoIdentityProvider class]];
}

- (void) test_AWSCognitoIdentityCreateIdentityPoolInput {
    [self validateSecureCodingForClass:[AWSCognitoIdentityCreateIdentityPoolInput class]];
}

- (void) test_AWSCognitoIdentityCredentials {
    [self validateSecureCodingForClass:[AWSCognitoIdentityCredentials class]];
}

- (void) test_AWSCognitoIdentityDeleteIdentitiesInput {
    [self validateSecureCodingForClass:[AWSCognitoIdentityDeleteIdentitiesInput class]];
}

- (void) test_AWSCognitoIdentityDeleteIdentitiesResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityDeleteIdentitiesResponse class]];
}

- (void) test_AWSCognitoIdentityDeleteIdentityPoolInput {
    [self validateSecureCodingForClass:[AWSCognitoIdentityDeleteIdentityPoolInput class]];
}

- (void) test_AWSCognitoIdentityDescribeIdentityInput {
    [self validateSecureCodingForClass:[AWSCognitoIdentityDescribeIdentityInput class]];
}

- (void) test_AWSCognitoIdentityDescribeIdentityPoolInput {
    [self validateSecureCodingForClass:[AWSCognitoIdentityDescribeIdentityPoolInput class]];
}

- (void) test_AWSCognitoIdentityGetCredentialsForIdentityInput {
    [self validateSecureCodingForClass:[AWSCognitoIdentityGetCredentialsForIdentityInput class]];
}

- (void) test_AWSCognitoIdentityGetCredentialsForIdentityResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityGetCredentialsForIdentityResponse class]];
}

- (void) test_AWSCognitoIdentityGetIdInput {
    [self validateSecureCodingForClass:[AWSCognitoIdentityGetIdInput class]];
}

- (void) test_AWSCognitoIdentityGetIdResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityGetIdResponse class]];
}

- (void) test_AWSCognitoIdentityGetIdentityPoolRolesInput {
    [self validateSecureCodingForClass:[AWSCognitoIdentityGetIdentityPoolRolesInput class]];
}

- (void) test_AWSCognitoIdentityGetIdentityPoolRolesResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityGetIdentityPoolRolesResponse class]];
}

- (void) test_AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityInput {
    [self validateSecureCodingForClass:[AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityInput class]];
}

- (void) test_AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityResponse class]];
}

- (void) test_AWSCognitoIdentityGetOpenIdTokenInput {
    [self validateSecureCodingForClass:[AWSCognitoIdentityGetOpenIdTokenInput class]];
}

- (void) test_AWSCognitoIdentityGetOpenIdTokenResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityGetOpenIdTokenResponse class]];
}

- (void) test_AWSCognitoIdentityGetPrincipalTagAttributeMapInput {
    [self validateSecureCodingForClass:[AWSCognitoIdentityGetPrincipalTagAttributeMapInput class]];
}

- (void) test_AWSCognitoIdentityGetPrincipalTagAttributeMapResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityGetPrincipalTagAttributeMapResponse class]];
}

- (void) test_AWSCognitoIdentityIdentityDescription {
    [self validateSecureCodingForClass:[AWSCognitoIdentityIdentityDescription class]];
}

- (void) test_AWSCognitoIdentityIdentityPool {
    [self validateSecureCodingForClass:[AWSCognitoIdentityIdentityPool class]];
}

- (void) test_AWSCognitoIdentityIdentityPoolShortDescription {
    [self validateSecureCodingForClass:[AWSCognitoIdentityIdentityPoolShortDescription class]];
}

- (void) test_AWSCognitoIdentityListIdentitiesInput {
    [self validateSecureCodingForClass:[AWSCognitoIdentityListIdentitiesInput class]];
}

- (void) test_AWSCognitoIdentityListIdentitiesResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityListIdentitiesResponse class]];
}

- (void) test_AWSCognitoIdentityListIdentityPoolsInput {
    [self validateSecureCodingForClass:[AWSCognitoIdentityListIdentityPoolsInput class]];
}

- (void) test_AWSCognitoIdentityListIdentityPoolsResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityListIdentityPoolsResponse class]];
}

- (void) test_AWSCognitoIdentityListTagsForResourceInput {
    [self validateSecureCodingForClass:[AWSCognitoIdentityListTagsForResourceInput class]];
}

- (void) test_AWSCognitoIdentityListTagsForResourceResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityListTagsForResourceResponse class]];
}

- (void) test_AWSCognitoIdentityLookupDeveloperIdentityInput {
    [self validateSecureCodingForClass:[AWSCognitoIdentityLookupDeveloperIdentityInput class]];
}

- (void) test_AWSCognitoIdentityLookupDeveloperIdentityResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityLookupDeveloperIdentityResponse class]];
}

- (void) test_AWSCognitoIdentityMappingRule {
    [self validateSecureCodingForClass:[AWSCognitoIdentityMappingRule class]];
}

- (void) test_AWSCognitoIdentityMergeDeveloperIdentitiesInput {
    [self validateSecureCodingForClass:[AWSCognitoIdentityMergeDeveloperIdentitiesInput class]];
}

- (void) test_AWSCognitoIdentityMergeDeveloperIdentitiesResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityMergeDeveloperIdentitiesResponse class]];
}

- (void) test_AWSCognitoIdentityRoleMapping {
    [self validateSecureCodingForClass:[AWSCognitoIdentityRoleMapping class]];
}

- (void) test_AWSCognitoIdentityRulesConfigurationType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityRulesConfigurationType class]];
}

- (void) test_AWSCognitoIdentitySetIdentityPoolRolesInput {
    [self validateSecureCodingForClass:[AWSCognitoIdentitySetIdentityPoolRolesInput class]];
}

- (void) test_AWSCognitoIdentitySetPrincipalTagAttributeMapInput {
    [self validateSecureCodingForClass:[AWSCognitoIdentitySetPrincipalTagAttributeMapInput class]];
}

- (void) test_AWSCognitoIdentitySetPrincipalTagAttributeMapResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentitySetPrincipalTagAttributeMapResponse class]];
}

- (void) test_AWSCognitoIdentityTagResourceInput {
    [self validateSecureCodingForClass:[AWSCognitoIdentityTagResourceInput class]];
}

- (void) test_AWSCognitoIdentityTagResourceResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityTagResourceResponse class]];
}

- (void) test_AWSCognitoIdentityUnlinkDeveloperIdentityInput {
    [self validateSecureCodingForClass:[AWSCognitoIdentityUnlinkDeveloperIdentityInput class]];
}

- (void) test_AWSCognitoIdentityUnlinkIdentityInput {
    [self validateSecureCodingForClass:[AWSCognitoIdentityUnlinkIdentityInput class]];
}

- (void) test_AWSCognitoIdentityUnprocessedIdentityId {
    [self validateSecureCodingForClass:[AWSCognitoIdentityUnprocessedIdentityId class]];
}

- (void) test_AWSCognitoIdentityUntagResourceInput {
    [self validateSecureCodingForClass:[AWSCognitoIdentityUntagResourceInput class]];
}

- (void) test_AWSCognitoIdentityUntagResourceResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityUntagResourceResponse class]];
}

@end

