/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#if AWS_TEST_AMAZON_CORE

#import <XCTest/XCTest.h>
#import "AmazonCore.h"

@interface AmazonCoreTests : XCTestCase

@end

@implementation AmazonCoreTests

- (void)setUp {
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown {
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testDateToString {
    //660096000 is 12/02/1990 hour 0 min 0 sec 0 GMT
    NSDate *testDateAZDateDateStampFormat = [NSDate dateWithTimeIntervalSince1970:660096000];
    NSString *dateString = [testDateAZDateDateStampFormat az_stringValue:AZDateShortDateFormat1];
    NSString *correctString = @"19901202";

    XCTAssertTrue([correctString isEqualToString:dateString],@"dateToString failed.  Expecting: %@ , Actual: %@",correctString,dateString);

    NSDate *testDateAZDateAmzDateFormat = [NSDate dateWithTimeIntervalSince1970:660096000];
    NSString *dateStringAZDateAmzDateFormat = [testDateAZDateAmzDateFormat az_stringValue:AZDateISO8601DateFormat2];
    NSString *correctStringAZDateAmzDateFormat = @"19901202T000000Z";

    XCTAssertTrue([correctStringAZDateAmzDateFormat isEqualToString:dateStringAZDateAmzDateFormat], @"DateToString failed. Expecting: %@ , Actual: %@",correctStringAZDateAmzDateFormat,dateStringAZDateAmzDateFormat);
}

- (void)testStringToDate {
    NSString *testStringAZDateDateStampFormat = @"19901202";
    NSDate *testDate = [NSDate az_dateFromString:testStringAZDateDateStampFormat format:AZDateShortDateFormat1];
    double testTime = [testDate timeIntervalSince1970];
    double expectedTime = 660096000;

    XCTAssertEqual(testTime, expectedTime, "Failed to create a proper date from string usingAZDateDateStampFormat");

    NSString *testStringAZDateAmzDateFormat = @"19901202T000000Z";
    NSDate *testDateAmz = [NSDate az_dateFromString:testStringAZDateAmzDateFormat format:AZDateISO8601DateFormat2];
    double testTimeAmz = [testDateAmz timeIntervalSince1970];

    XCTAssertEqual(testTimeAmz, expectedTime, "Failed to create a proper date from string usingAZDateAmzDateFormat");
}

@end

#endif
