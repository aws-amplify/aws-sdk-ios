/*
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
#import "AWSSES.h"

@interface AWSGeneralSESTests : XCTestCase

@end

@implementation AWSGeneralSESTests

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testConstructors {
    NSString *key = @"testSESConstructors";
    XCTAssertNotNil([AWSSES defaultSES]);
    XCTAssertEqual([[AWSSES defaultSES] class], [AWSSES class]);
    XCTAssertNil([AWSSES SESForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSSES registerSESWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSSES SESForKey:key]);
    XCTAssertEqual([[AWSSES SESForKey:key] class], [AWSSES class]);
    XCTAssertEqual([AWSSES SESForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSSES removeSESForKey:key];
    XCTAssertNil([AWSSES SESForKey:key]);

}

- (void)testDeleteIdentity {
    NSString *key = @"testDeleteIdentity";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSES registerSESWithConfiguration:configuration forKey:key];

    [[[[AWSSES SESForKey:key] deleteIdentity:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSES removeSESForKey:key];
}

- (void)testDeleteVerifiedEmailAddress {
    NSString *key = @"testDeleteVerifiedEmailAddress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSES registerSESWithConfiguration:configuration forKey:key];

    [[[[AWSSES SESForKey:key] deleteVerifiedEmailAddress:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSES removeSESForKey:key];
}

- (void)testGetIdentityDkimAttributes {
    NSString *key = @"testGetIdentityDkimAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSES registerSESWithConfiguration:configuration forKey:key];

    [[[[AWSSES SESForKey:key] getIdentityDkimAttributes:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSES removeSESForKey:key];
}

- (void)testGetIdentityNotificationAttributes {
    NSString *key = @"testGetIdentityNotificationAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSES registerSESWithConfiguration:configuration forKey:key];

    [[[[AWSSES SESForKey:key] getIdentityNotificationAttributes:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSES removeSESForKey:key];
}

- (void)testGetIdentityVerificationAttributes {
    NSString *key = @"testGetIdentityVerificationAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSES registerSESWithConfiguration:configuration forKey:key];

    [[[[AWSSES SESForKey:key] getIdentityVerificationAttributes:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSES removeSESForKey:key];
}

- (void)testGetSendQuota {
    NSString *key = @"testGetSendQuota";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSES registerSESWithConfiguration:configuration forKey:key];

    [[[[AWSSES SESForKey:key] getSendQuota:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSES removeSESForKey:key];
}

- (void)testGetSendStatistics {
    NSString *key = @"testGetSendStatistics";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSES registerSESWithConfiguration:configuration forKey:key];

    [[[[AWSSES SESForKey:key] getSendStatistics:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSES removeSESForKey:key];
}

- (void)testListIdentities {
    NSString *key = @"testListIdentities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSES registerSESWithConfiguration:configuration forKey:key];

    [[[[AWSSES SESForKey:key] listIdentities:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSES removeSESForKey:key];
}

- (void)testListVerifiedEmailAddresses {
    NSString *key = @"testListVerifiedEmailAddresses";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSES registerSESWithConfiguration:configuration forKey:key];

    [[[[AWSSES SESForKey:key] listVerifiedEmailAddresses:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSES removeSESForKey:key];
}

- (void)testSendEmail {
    NSString *key = @"testSendEmail";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSES registerSESWithConfiguration:configuration forKey:key];

    [[[[AWSSES SESForKey:key] sendEmail:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSES removeSESForKey:key];
}

- (void)testSendRawEmail {
    NSString *key = @"testSendRawEmail";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSES registerSESWithConfiguration:configuration forKey:key];

    [[[[AWSSES SESForKey:key] sendRawEmail:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSES removeSESForKey:key];
}

- (void)testSetIdentityDkimEnabled {
    NSString *key = @"testSetIdentityDkimEnabled";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSES registerSESWithConfiguration:configuration forKey:key];

    [[[[AWSSES SESForKey:key] setIdentityDkimEnabled:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSES removeSESForKey:key];
}

- (void)testSetIdentityFeedbackForwardingEnabled {
    NSString *key = @"testSetIdentityFeedbackForwardingEnabled";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSES registerSESWithConfiguration:configuration forKey:key];

    [[[[AWSSES SESForKey:key] setIdentityFeedbackForwardingEnabled:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSES removeSESForKey:key];
}

- (void)testSetIdentityNotificationTopic {
    NSString *key = @"testSetIdentityNotificationTopic";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSES registerSESWithConfiguration:configuration forKey:key];

    [[[[AWSSES SESForKey:key] setIdentityNotificationTopic:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSES removeSESForKey:key];
}

- (void)testVerifyDomainDkim {
    NSString *key = @"testVerifyDomainDkim";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSES registerSESWithConfiguration:configuration forKey:key];

    [[[[AWSSES SESForKey:key] verifyDomainDkim:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSES removeSESForKey:key];
}

- (void)testVerifyDomainIdentity {
    NSString *key = @"testVerifyDomainIdentity";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSES registerSESWithConfiguration:configuration forKey:key];

    [[[[AWSSES SESForKey:key] verifyDomainIdentity:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSES removeSESForKey:key];
}

- (void)testVerifyEmailAddress {
    NSString *key = @"testVerifyEmailAddress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSES registerSESWithConfiguration:configuration forKey:key];

    [[[[AWSSES SESForKey:key] verifyEmailAddress:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSES removeSESForKey:key];
}

- (void)testVerifyEmailIdentity {
    NSString *key = @"testVerifyEmailIdentity";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSES registerSESWithConfiguration:configuration forKey:key];

    [[[[AWSSES SESForKey:key] verifyEmailIdentity:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSES removeSESForKey:key];
}

@end
