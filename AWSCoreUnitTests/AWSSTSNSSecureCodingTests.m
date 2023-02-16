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
#import "AWSSTSModel.h"

@interface AWSSTSNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSSTSAssumeRoleRequest API_AVAILABLE(ios(11));
- (void) test_AWSSTSAssumeRoleResponse API_AVAILABLE(ios(11));
- (void) test_AWSSTSAssumeRoleWithSAMLRequest API_AVAILABLE(ios(11));
- (void) test_AWSSTSAssumeRoleWithSAMLResponse API_AVAILABLE(ios(11));
- (void) test_AWSSTSAssumeRoleWithWebIdentityRequest API_AVAILABLE(ios(11));
- (void) test_AWSSTSAssumeRoleWithWebIdentityResponse API_AVAILABLE(ios(11));
- (void) test_AWSSTSAssumedRoleUser API_AVAILABLE(ios(11));
- (void) test_AWSSTSCredentials API_AVAILABLE(ios(11));
- (void) test_AWSSTSDecodeAuthorizationMessageRequest API_AVAILABLE(ios(11));
- (void) test_AWSSTSDecodeAuthorizationMessageResponse API_AVAILABLE(ios(11));
- (void) test_AWSSTSFederatedUser API_AVAILABLE(ios(11));
- (void) test_AWSSTSGetAccessKeyInfoRequest API_AVAILABLE(ios(11));
- (void) test_AWSSTSGetAccessKeyInfoResponse API_AVAILABLE(ios(11));
- (void) test_AWSSTSGetCallerIdentityRequest API_AVAILABLE(ios(11));
- (void) test_AWSSTSGetCallerIdentityResponse API_AVAILABLE(ios(11));
- (void) test_AWSSTSGetFederationTokenRequest API_AVAILABLE(ios(11));
- (void) test_AWSSTSGetFederationTokenResponse API_AVAILABLE(ios(11));
- (void) test_AWSSTSGetSessionTokenRequest API_AVAILABLE(ios(11));
- (void) test_AWSSTSGetSessionTokenResponse API_AVAILABLE(ios(11));
- (void) test_AWSSTSPolicyDescriptorType API_AVAILABLE(ios(11));
- (void) test_AWSSTSTag API_AVAILABLE(ios(11));

@end

@implementation AWSSTSNSSecureCodingTests

- (void) test_AWSSTSAssumeRoleRequest {
    [self validateSecureCodingForClass:[AWSSTSAssumeRoleRequest class]];
}

- (void) test_AWSSTSAssumeRoleResponse {
    [self validateSecureCodingForClass:[AWSSTSAssumeRoleResponse class]];
}

- (void) test_AWSSTSAssumeRoleWithSAMLRequest {
    [self validateSecureCodingForClass:[AWSSTSAssumeRoleWithSAMLRequest class]];
}

- (void) test_AWSSTSAssumeRoleWithSAMLResponse {
    [self validateSecureCodingForClass:[AWSSTSAssumeRoleWithSAMLResponse class]];
}

- (void) test_AWSSTSAssumeRoleWithWebIdentityRequest {
    [self validateSecureCodingForClass:[AWSSTSAssumeRoleWithWebIdentityRequest class]];
}

- (void) test_AWSSTSAssumeRoleWithWebIdentityResponse {
    [self validateSecureCodingForClass:[AWSSTSAssumeRoleWithWebIdentityResponse class]];
}

- (void) test_AWSSTSAssumedRoleUser {
    [self validateSecureCodingForClass:[AWSSTSAssumedRoleUser class]];
}

- (void) test_AWSSTSCredentials {
    [self validateSecureCodingForClass:[AWSSTSCredentials class]];
}

- (void) test_AWSSTSDecodeAuthorizationMessageRequest {
    [self validateSecureCodingForClass:[AWSSTSDecodeAuthorizationMessageRequest class]];
}

- (void) test_AWSSTSDecodeAuthorizationMessageResponse {
    [self validateSecureCodingForClass:[AWSSTSDecodeAuthorizationMessageResponse class]];
}

- (void) test_AWSSTSFederatedUser {
    [self validateSecureCodingForClass:[AWSSTSFederatedUser class]];
}

- (void) test_AWSSTSGetAccessKeyInfoRequest {
    [self validateSecureCodingForClass:[AWSSTSGetAccessKeyInfoRequest class]];
}

- (void) test_AWSSTSGetAccessKeyInfoResponse {
    [self validateSecureCodingForClass:[AWSSTSGetAccessKeyInfoResponse class]];
}

- (void) test_AWSSTSGetCallerIdentityRequest {
    [self validateSecureCodingForClass:[AWSSTSGetCallerIdentityRequest class]];
}

- (void) test_AWSSTSGetCallerIdentityResponse {
    [self validateSecureCodingForClass:[AWSSTSGetCallerIdentityResponse class]];
}

- (void) test_AWSSTSGetFederationTokenRequest {
    [self validateSecureCodingForClass:[AWSSTSGetFederationTokenRequest class]];
}

- (void) test_AWSSTSGetFederationTokenResponse {
    [self validateSecureCodingForClass:[AWSSTSGetFederationTokenResponse class]];
}

- (void) test_AWSSTSGetSessionTokenRequest {
    [self validateSecureCodingForClass:[AWSSTSGetSessionTokenRequest class]];
}

- (void) test_AWSSTSGetSessionTokenResponse {
    [self validateSecureCodingForClass:[AWSSTSGetSessionTokenResponse class]];
}

- (void) test_AWSSTSPolicyDescriptorType {
    [self validateSecureCodingForClass:[AWSSTSPolicyDescriptorType class]];
}

- (void) test_AWSSTSTag {
    [self validateSecureCodingForClass:[AWSSTSTag class]];
}

@end

