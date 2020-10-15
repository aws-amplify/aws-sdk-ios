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
#import "AWSKinesisVideoSignalingModel.h"

@interface AWSKinesisVideoSignalingNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSKinesisVideoSignalingGetIceServerConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoSignalingGetIceServerConfigResponse API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoSignalingIceServer API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoSignalingSendAlexaOfferToMasterRequest API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoSignalingSendAlexaOfferToMasterResponse API_AVAILABLE(ios(11));

@end

@implementation AWSKinesisVideoSignalingNSSecureCodingTests

- (void) test_AWSKinesisVideoSignalingGetIceServerConfigRequest {
    [self validateSecureCodingForClass:[AWSKinesisVideoSignalingGetIceServerConfigRequest class]];
}

- (void) test_AWSKinesisVideoSignalingGetIceServerConfigResponse {
    [self validateSecureCodingForClass:[AWSKinesisVideoSignalingGetIceServerConfigResponse class]];
}

- (void) test_AWSKinesisVideoSignalingIceServer {
    [self validateSecureCodingForClass:[AWSKinesisVideoSignalingIceServer class]];
}

- (void) test_AWSKinesisVideoSignalingSendAlexaOfferToMasterRequest {
    [self validateSecureCodingForClass:[AWSKinesisVideoSignalingSendAlexaOfferToMasterRequest class]];
}

- (void) test_AWSKinesisVideoSignalingSendAlexaOfferToMasterResponse {
    [self validateSecureCodingForClass:[AWSKinesisVideoSignalingSendAlexaOfferToMasterResponse class]];
}

@end

