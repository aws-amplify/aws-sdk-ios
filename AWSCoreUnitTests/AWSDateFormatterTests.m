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
#import <AWSCore/AWSCore.h>

@interface AWSDateFormatterTests : XCTestCase

@end

@implementation AWSDateFormatterTests

#pragma mark - aws_dateFromString

- (void)test_aws_dateFromString_handlesAWSDateRFC822DateFormat1 {
    NSString *string = @"Wed, 2 Jan 2019 03:45:06 CST";

    NSDate *date = [NSDate aws_dateFromString:string format:AWSDateRFC822DateFormat1];
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *testTimeZone = [[NSTimeZone alloc] initWithName:@"America/Los_Angeles"];
    NSDateComponents *components = [calendar componentsInTimeZone:testTimeZone fromDate:date];

    XCTAssertEqual([components year], 2019);
    XCTAssertEqual([components month], 1);
    XCTAssertEqual([components day], 2);
    XCTAssertEqual([components hour], 1);
    XCTAssertEqual([components minute], 45);
    XCTAssertEqual([components second], 06);
}

- (void)test_aws_dateFromString_handlesAWSDateISO8601DateFormat1 {
    NSString *string = @"2019-01-02T03:45:06Z";

    NSDate *date = [NSDate aws_dateFromString:string format:AWSDateISO8601DateFormat1];
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *testTimeZone = [[NSTimeZone alloc] initWithName:@"America/Los_Angeles"];
    NSDateComponents *components = [calendar componentsInTimeZone:testTimeZone fromDate:date];

    XCTAssertEqual([components year], 2019);
    XCTAssertEqual([components month], 1);
    XCTAssertEqual([components day], 1);
    XCTAssertEqual([components hour], 19);
    XCTAssertEqual([components minute], 45);
    XCTAssertEqual([components second], 06);
}

- (void)test_aws_dateFromString_handlesAWSDateISO8601DateFormat2 {
    NSString *string = @"20190102T034506Z";

    NSDate *date = [NSDate aws_dateFromString:string format:AWSDateISO8601DateFormat2];
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *testTimeZone = [[NSTimeZone alloc] initWithName:@"America/Los_Angeles"];
    NSDateComponents *components = [calendar componentsInTimeZone:testTimeZone fromDate:date];

    XCTAssertEqual([components year], 2019);
    XCTAssertEqual([components month], 1);
    XCTAssertEqual([components day], 1);
    XCTAssertEqual([components hour], 19);
    XCTAssertEqual([components minute], 45);
    XCTAssertEqual([components second], 06);
}

- (void)test_aws_dateFromString_handlesAWSDateISO8601DateFormat3 {
    NSString *string = @"2019-01-02T03:45:06.789Z";

    NSDate *date = [NSDate aws_dateFromString:string format:AWSDateISO8601DateFormat3];
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *testTimeZone = [[NSTimeZone alloc] initWithName:@"America/Los_Angeles"];
    NSDateComponents *components = [calendar componentsInTimeZone:testTimeZone fromDate:date];

    XCTAssertEqual([components year], 2019);
    XCTAssertEqual([components month], 1);
    XCTAssertEqual([components day], 1);
    XCTAssertEqual([components hour], 19);
    XCTAssertEqual([components minute], 45);
    XCTAssertEqual([components second], 06);
}

- (void)test_aws_dateFromString_handlesAWSDateShortDateFormat1 {
    NSString *string = @"20190102";

    NSDate *date = [NSDate aws_dateFromString:string format:AWSDateShortDateFormat1];
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *testTimeZone = [[NSTimeZone alloc] initWithName:@"America/Los_Angeles"];
    NSDateComponents *components = [calendar componentsInTimeZone:testTimeZone fromDate:date];

    XCTAssertEqual([components year], 2019);
    XCTAssertEqual([components month], 1);
    XCTAssertEqual([components day], 1);

    // Assert hours to ensure that the formatter's default timezone is set to GMT
    XCTAssertEqual([components hour], 16);
    XCTAssertEqual([components minute], 0);
    XCTAssertEqual([components second], 0);
}

- (void)test_aws_dateFromString_handlesAWSDateShortDateFormat2 {
    NSString *string = @"2019-01-02";

    NSDate *date = [NSDate aws_dateFromString:string format:AWSDateShortDateFormat2];
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *testTimeZone = [[NSTimeZone alloc] initWithName:@"America/Los_Angeles"];
    NSDateComponents *components = [calendar componentsInTimeZone:testTimeZone fromDate:date];

    XCTAssertEqual([components year], 2019);
    XCTAssertEqual([components month], 1);
    XCTAssertEqual([components day], 1);

    // Assert hours to ensure that the formatter's default timezone is set to GMT
    XCTAssertEqual([components hour], 16);
    XCTAssertEqual([components minute], 0);
    XCTAssertEqual([components second], 0);
}

- (void)test_aws_dateFromString_handlesCustomDateFormat {
    NSString *string = @"2019,01,02|03,45,06CST";

    NSString *customFormat = @"yyyy,MM,dd'|'HH,mm,ssz";

    NSDate *date = [NSDate aws_dateFromString:string format:customFormat];
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *testTimeZone = [[NSTimeZone alloc] initWithName:@"America/Los_Angeles"];
    NSDateComponents *components = [calendar componentsInTimeZone:testTimeZone fromDate:date];

    XCTAssertEqual([components year], 2019);
    XCTAssertEqual([components month], 1);
    XCTAssertEqual([components day], 2);
    XCTAssertEqual([components hour], 1);
    XCTAssertEqual([components minute], 45);
    XCTAssertEqual([components second], 6);
}

- (void)test_pinpointTestCrashes {
    NSString *string = @"2019-01-24T18:21:01.605Z";

    NSDate *date = [NSDate aws_dateFromString:string format:AWSDateISO8601DateFormat3];
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *testTimeZone = [[NSTimeZone alloc] initWithName:@"America/Los_Angeles"];
    NSDateComponents *components = [calendar componentsInTimeZone:testTimeZone fromDate:date];

    XCTAssertEqual([components year], 2019);
    XCTAssertEqual([components month], 1);
    XCTAssertEqual([components day], 24);
    XCTAssertEqual([components hour], 10);
    XCTAssertEqual([components minute], 21);
    XCTAssertEqual([components second], 01);
}

@end
