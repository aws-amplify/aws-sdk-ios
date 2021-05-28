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
#import "AWSTestUtility.h"
#import "AWSPinpoint.h"
#import "AWSPinpointEndpointProfile.h"

@interface AWSPinpointEndpointProfileTests : XCTestCase

@end

@implementation AWSPinpointEndpointProfileTests

- (void)testArchivingAndUnarchivingPinpointEndpointProfileWithoutAttributes {
    if (@available(iOS 11, *)) {
        AWSPinpointEndpointProfile * profile1 = [[AWSPinpointEndpointProfile alloc] initWithApplicationId:@"MyApp" endpointId:@"abc123"];

        NSError * error = nil;
        NSData * data = [NSKeyedArchiver archivedDataWithRootObject:profile1 requiringSecureCoding:YES error:&error];

        XCTAssertNil(error);

        AWSPinpointEndpointProfile * profile2 = [NSKeyedUnarchiver unarchivedObjectOfClass:[AWSPinpointEndpointProfile class]
                                                                                  fromData:data
                                                                                     error:&error];

        XCTAssertNil(error);

        XCTAssert([profile1.applicationId isEqualToString:profile2.applicationId]);
        XCTAssert([profile1.endpointId isEqualToString:profile2.endpointId]);
    }
}

- (void)testArchivingAndUnarchivingPinpointEndpointProfileWithAttributes {
    if (@available(iOS 11, *)) {
        NSString * numbersKey = @"Numbers";
        NSArray<NSString *> * numbers1 = @[@"1", @"2", @"3"];
        AWSPinpointEndpointProfile * profile1 = [[AWSPinpointEndpointProfile alloc] initWithApplicationId:@"MyApp" endpointId:@"abc123"];
        [profile1 addAttribute:numbers1 forKey:numbersKey];

        NSError * error = nil;
        NSData * data = [NSKeyedArchiver archivedDataWithRootObject:profile1 requiringSecureCoding:YES error:&error];

        XCTAssertNil(error);

        AWSPinpointEndpointProfile * profile2 = [NSKeyedUnarchiver unarchivedObjectOfClass:[AWSPinpointEndpointProfile class]
                                                                                  fromData:data
                                                                                     error:&error];

        XCTAssertNil(error);

        XCTAssert([profile1.applicationId isEqualToString:profile2.applicationId]);
        XCTAssert([profile1.endpointId isEqualToString:profile2.endpointId]);

        NSArray<NSString *> * numbers2 = [profile2 attributeForKey:numbersKey];
        XCTAssertNotNil(numbers2);
        XCTAssertTrue([numbers1 isEqualToArray:numbers2]);
    }
}

- (void)testUsingAWSNSCodingUtilitiesForPinpointEndpointProfileWithAttributes {
    NSString * numbersKey = @"Numbers";
    NSArray<NSString *> * numbers1 = @[@"1", @"2", @"3"];
    AWSPinpointEndpointProfile * profile1 = [[AWSPinpointEndpointProfile alloc] initWithApplicationId:@"MyApp" endpointId:@"abc123"];
    [profile1 addAttribute:numbers1 forKey:numbersKey];

    NSError * error = nil;
    NSData * data = [AWSNSCodingUtilities versionSafeArchivedDataWithRootObject:profile1 requiringSecureCoding:YES error:&error];

    XCTAssertNil(error);

    AWSPinpointEndpointProfile * profile2 = [AWSNSCodingUtilities versionSafeUnarchivedObjectOfClass:[AWSPinpointEndpointProfile class] fromData:data error:&error];

    XCTAssertNil(error);

    XCTAssert([profile1.applicationId isEqualToString:profile2.applicationId]);
    XCTAssert([profile1.endpointId isEqualToString:profile2.endpointId]);

    NSArray<NSString *> * numbers2 = [profile2 attributeForKey:numbersKey];
    XCTAssertNotNil(numbers2);
    XCTAssertTrue([numbers1 isEqualToArray:numbers2]);
}

- (void)testArchivingAndUnarchivingPinpointEndpointProfileWithMetrics {
    if (@available(iOS 11, *)) {
        NSString * metricKey = @"Metric";
        NSNumber * metric1 = @42;
        AWSPinpointEndpointProfile * profile1 = [[AWSPinpointEndpointProfile alloc] initWithApplicationId:@"MyApp" endpointId:@"abc123"];
        [profile1 addMetric:metric1 forKey:metricKey];

        NSError * error = nil;
        NSData * data = [NSKeyedArchiver archivedDataWithRootObject:profile1 requiringSecureCoding:YES error:&error];

        XCTAssertNil(error);

        AWSPinpointEndpointProfile * profile2 = [NSKeyedUnarchiver unarchivedObjectOfClass:[AWSPinpointEndpointProfile class]
                                                                                  fromData:data
                                                                                     error:&error];

        XCTAssertNil(error);

        XCTAssert([profile1.applicationId isEqualToString:profile2.applicationId]);
        XCTAssert([profile1.endpointId isEqualToString:profile2.endpointId]);

        NSNumber * metric2 = [profile2 metricForKey:metricKey];
        XCTAssertNotNil(metric2);
        XCTAssertTrue([metric1 isEqualToNumber:metric2]);
    }
}

- (void)testUsingAWSNSCodingUtilitiesForPinpointEndpointProfileWithMetrics {
    NSString * metricKey = @"Metric";
    NSNumber * metric1 = @42;
    AWSPinpointEndpointProfile * profile1 = [[AWSPinpointEndpointProfile alloc] initWithApplicationId:@"MyApp" endpointId:@"abc123"];
    [profile1 addMetric:metric1 forKey:metricKey];

    NSError * error = nil;
    NSData * data = [AWSNSCodingUtilities versionSafeArchivedDataWithRootObject:profile1 requiringSecureCoding:YES error:&error];

    XCTAssertNil(error);

    AWSPinpointEndpointProfile * profile2 = [AWSNSCodingUtilities versionSafeUnarchivedObjectOfClass:[AWSPinpointEndpointProfile class] fromData:data error:&error];

    XCTAssertNil(error);

    XCTAssert([profile1.applicationId isEqualToString:profile2.applicationId]);
    XCTAssert([profile1.endpointId isEqualToString:profile2.endpointId]);

    NSNumber * metric2 = [profile2 metricForKey:metricKey];
    XCTAssertNotNil(metric2);
    XCTAssertTrue([metric1 isEqualToNumber:metric2]);
}

@end
