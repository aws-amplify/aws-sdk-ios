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

#if !AWS_TEST_BJS_INSTEAD

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AWSSES.h"
#import "AWSTestUtility.h"

@interface AWSSESTests : XCTestCase

@end

@implementation AWSSESTests

static NSString *_verifiedEmailAddress = nil;

+ (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];

    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials"
                                                                          ofType:@"json"];
    NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:nil];
    _verifiedEmailAddress = credentialsJson[@"verifiedEmailAddress"];
}

- (void)setUp {
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown {
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

#if !AWS_TEST_BJS_INSTEAD
- (void)testClockSkewSES {
    [AWSTestUtility setupSwizzling];

    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [AWSTestUtility setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];

    AWSSES *ses = [AWSSES defaultSES];
    XCTAssertNotNil(ses);

    [[[ses getSendQuota:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSSESGetSendQuotaResponse class]]);
            AWSSESGetSendQuotaResponse *getSendQuotaResponse = task.result;
            XCTAssertTrue(getSendQuotaResponse.max24HourSend > 0);
            XCTAssertTrue(getSendQuotaResponse.maxSendRate > 0);
        }

        return nil;
    }] waitUntilFinished];

    [AWSTestUtility revertSwizzling];
}
#endif

- (void)testGetSendQuota {
    AWSSES *ses = [AWSSES defaultSES];

    [[[ses getSendQuota:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSSESGetSendQuotaResponse class]]);
            AWSSESGetSendQuotaResponse *getSendQuotaResponse = task.result;
            XCTAssertTrue(getSendQuotaResponse.max24HourSend > 0);
            XCTAssertTrue(getSendQuotaResponse.maxSendRate > 0);
        }

        return nil;
    }] waitUntilFinished];
}

/*
 This is a manual test, and you need to verify that
 you received the test email to your verified email address.
 */
- (void)testSendEmail {
    AWSSES *ses = [AWSSES defaultSES];

    AWSSESSendEmailRequest *sendEmailRequest = [AWSSESSendEmailRequest new];
    sendEmailRequest.source = _verifiedEmailAddress;

    AWSSESDestination *destination = [AWSSESDestination new];
    destination.toAddresses = @[_verifiedEmailAddress];
    sendEmailRequest.destination = destination;

    AWSSESMessage *message = [AWSSESMessage new];
    AWSSESContent *subject = [AWSSESContent new];
    subject.data = @"Test Subject";
    subject.charset = @"UTF-8";
    message.subject = subject;

    AWSSESContent *content = [AWSSESContent new];
    content.data = @"Test Body";
    content.charset = @"UTF-8";

    AWSSESBody *body = [AWSSESBody new];
    body.text = content;
    message.body = body;
    sendEmailRequest.message = message;

    [[[ses sendEmail:sendEmailRequest] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        return nil;
    }] waitUntilFinished];
}

- (void)testVerifyEmailIdentityFailed {
    AWSSES *ses = [AWSSES defaultSES];

    AWSSESVerifyEmailIdentityRequest *identityRequest = [AWSSESVerifyEmailIdentityRequest new];
    identityRequest.emailAddress = @""; //email address is empty

    [[[ses verifyEmailIdentity:identityRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error, @"expected InvalidParameterValue Error but got nil");
        XCTAssertEqual(task.error.code, 0);
        XCTAssertTrue([@"InvalidParameterValue" isEqualToString:task.error.userInfo[@"Code"]]);
        XCTAssertTrue([@"Email address not specified." isEqualToString:task.error.userInfo[@"Message"]]);
        return nil;
    }] waitUntilFinished];
}

@end

#endif
