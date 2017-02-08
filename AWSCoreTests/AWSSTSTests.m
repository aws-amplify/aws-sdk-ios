//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSSTS.h"
#import "AWSTestUtility.h"

@interface AWSSTSTests : XCTestCase

@end

@implementation AWSSTSTests

+ (void)setUp {
    [super setUp];
    [AWSTestUtility setupSTS];
}

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testGetSessionToken {
    AWSSTS *sts = [AWSSTS STSForKey:AWSTestUtilitySTSKey];

    AWSSTSGetSessionTokenRequest *getSessionTokenRequest = [AWSSTSGetSessionTokenRequest new];
    getSessionTokenRequest.durationSeconds = @900;

    [[[sts getSessionToken:getSessionTokenRequest] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            AWSSTSGetSessionTokenResponse *getSessionTokenResponse = task.result;
            XCTAssertTrue([getSessionTokenResponse.credentials.accessKeyId length] > 0);
            XCTAssertTrue([getSessionTokenResponse.credentials.secretAccessKey length] > 0);
            XCTAssertTrue([getSessionTokenResponse.credentials.sessionToken length] > 0);
            XCTAssertTrue([getSessionTokenResponse.credentials.expiration isKindOfClass:[NSDate class]]);
        }

        return nil;
    }] waitUntilFinished];
}


@end
