/**
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AWSTestUtility.h"
#import "AWSSTS.h"

@interface AWSGeneralSTSTests : XCTestCase

@end

@implementation AWSGeneralSTSTests

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testConstructors {
    NSString *key = @"testSTSConstructors";
    XCTAssertNotNil([AWSSTS defaultSTS]);
    XCTAssertEqual([[AWSSTS defaultSTS] class], [AWSSTS class]);
    XCTAssertNil([AWSSTS STSForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSSTS registerSTSWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSSTS STSForKey:key]);
    XCTAssertEqual([[AWSSTS STSForKey:key] class], [AWSSTS class]);
    XCTAssertEqual([AWSSTS STSForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSSTS removeSTSForKey:key];
    XCTAssertNil([AWSSTS STSForKey:key]);

}

- (void)testAssumeRole {
    NSString *key = @"testAssumeRole";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSTS registerSTSWithConfiguration:configuration forKey:key];

    [[[[AWSSTS STSForKey:key] assumeRole:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSTS removeSTSForKey:key];
}

- (void)testAssumeRoleWithSAML {
    NSString *key = @"testAssumeRoleWithSAML";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSTS registerSTSWithConfiguration:configuration forKey:key];

    [[[[AWSSTS STSForKey:key] assumeRoleWithSAML:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSTS removeSTSForKey:key];
}

- (void)testAssumeRoleWithWebIdentity {
    NSString *key = @"testAssumeRoleWithWebIdentity";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSTS registerSTSWithConfiguration:configuration forKey:key];

    [[[[AWSSTS STSForKey:key] assumeRoleWithWebIdentity:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSTS removeSTSForKey:key];
}

- (void)testDecodeAuthorizationMessage {
    NSString *key = @"testDecodeAuthorizationMessage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSTS registerSTSWithConfiguration:configuration forKey:key];

    [[[[AWSSTS STSForKey:key] decodeAuthorizationMessage:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSTS removeSTSForKey:key];
}

- (void)testGetFederationToken {
    NSString *key = @"testGetFederationToken";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSTS registerSTSWithConfiguration:configuration forKey:key];

    [[[[AWSSTS STSForKey:key] getFederationToken:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSTS removeSTSForKey:key];
}

- (void)testGetSessionToken {
    NSString *key = @"testGetSessionToken";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSTS registerSTSWithConfiguration:configuration forKey:key];

    [[[[AWSSTS STSForKey:key] getSessionToken:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSTS removeSTSForKey:key];
}

@end
