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

- (void)testArchivingAndUnarchivingPinpointEndpointProfileWithLocation {
    if (@available(iOS 11, *)) {
        NSNumber * latitude = @(47.615818);
        NSNumber * longitude = @(-122.339870);
        NSString * postalCode = @"98121";
        NSString * city = @"Seattle";
        NSString * region = @"North America";
        NSString * country = @"USA";

        AWSPinpointEndpointProfileLocation * location1 = [[AWSPinpointEndpointProfileLocation alloc] init];
        location1.latitude = latitude;
        location1.longitude = longitude;
        location1.postalCode = postalCode;
        location1.city = city;
        location1.region = region;
        location1.country = country;
        AWSPinpointEndpointProfile * profile1 = [[AWSPinpointEndpointProfile alloc] initWithApplicationId:@"MyApp" endpointId:@"abc123"];
        profile1.location = location1;

        NSError * error = nil;
        NSData * data = [NSKeyedArchiver archivedDataWithRootObject:profile1 requiringSecureCoding:YES error:&error];

        XCTAssertNil(error);

        AWSPinpointEndpointProfile * profile2 = [NSKeyedUnarchiver unarchivedObjectOfClass:[AWSPinpointEndpointProfile class]
                                                                                  fromData:data
                                                                                     error:&error];

        XCTAssertNil(error);

        XCTAssert([profile1.applicationId isEqualToString:profile2.applicationId]);
        XCTAssert([profile1.endpointId isEqualToString:profile2.endpointId]);

        AWSPinpointEndpointProfileLocation * location2 = profile2.location;
        XCTAssertNotNil(location2);

        XCTAssertTrue([location2.latitude isEqualToNumber:latitude]);
        XCTAssertTrue([location2.longitude isEqualToNumber:longitude]);
        XCTAssertTrue([location2.postalCode isEqualToString:postalCode]);
        XCTAssertTrue([location2.city isEqualToString:city]);
        XCTAssertTrue([location2.country isEqualToString:country]);

        XCTAssertTrue([location2.latitude isEqualToNumber:location1.latitude]);
        XCTAssertTrue([location2.longitude isEqualToNumber:location1.longitude]);
        XCTAssertTrue([location2.postalCode isEqualToString:location1.postalCode]);
        XCTAssertTrue([location2.city isEqualToString:location1.city]);
        XCTAssertTrue([location2.country isEqualToString:location1.country]);
    }
}

- (void)testUsingAWSNSCodingUtilitiesForPinpointEndpointProfileWithLocation {
        NSNumber * latitude = @(47.615818);
        NSNumber * longitude = @(-122.339870);
        NSString * postalCode = @"98121";
        NSString * city = @"Seattle";
        NSString * region = @"North America";
        NSString * country = @"USA";

        AWSPinpointEndpointProfileLocation * location1 = [[AWSPinpointEndpointProfileLocation alloc] init];
        location1.latitude = latitude;
        location1.longitude = longitude;
        location1.postalCode = postalCode;
        location1.city = city;
        location1.region = region;
        location1.country = country;
        AWSPinpointEndpointProfile * profile1 = [[AWSPinpointEndpointProfile alloc] initWithApplicationId:@"MyApp" endpointId:@"abc123"];
        profile1.location = location1;

    NSError * error = nil;
    NSData * data = [AWSNSCodingUtilities versionSafeArchivedDataWithRootObject:profile1 requiringSecureCoding:YES error:&error];

    XCTAssertNil(error);

    AWSPinpointEndpointProfile * profile2 = [AWSNSCodingUtilities versionSafeUnarchivedObjectOfClass:[AWSPinpointEndpointProfile class] fromData:data error:&error];

    XCTAssertNil(error);

    XCTAssert([profile1.applicationId isEqualToString:profile2.applicationId]);
    XCTAssert([profile1.endpointId isEqualToString:profile2.endpointId]);

    AWSPinpointEndpointProfileLocation * location2 = profile2.location;

    XCTAssertNotNil(location2);

    XCTAssertTrue([location2.latitude isEqualToNumber:latitude]);
    XCTAssertTrue([location2.longitude isEqualToNumber:longitude]);
    XCTAssertTrue([location2.postalCode isEqualToString:postalCode]);
    XCTAssertTrue([location2.city isEqualToString:city]);
    XCTAssertTrue([location2.country isEqualToString:country]);

    XCTAssertTrue([location2.latitude isEqualToNumber:location1.latitude]);
    XCTAssertTrue([location2.longitude isEqualToNumber:location1.longitude]);
    XCTAssertTrue([location2.postalCode isEqualToString:location1.postalCode]);
    XCTAssertTrue([location2.city isEqualToString:location1.city]);
    XCTAssertTrue([location2.country isEqualToString:location1.country]);
}

- (void)testArchivingAndUnarchivingPinpointEndpointProfileWithDemographic {
    if (@available(iOS 11, *)) {
        NSString * model = @"MODEL";
        NSString * timezone = @"TIMEZONE";
        NSString * locale = @"LOCALE";
        NSString * appVersion = @"APPVERSION";
        NSString * platform = @"PLATFORM";
        NSString * platformVersion = @"PLATFORMVERSION";

        AWSPinpointEndpointProfileDemographic * demographic1 = [[AWSPinpointEndpointProfileDemographic alloc] init];
        demographic1.model = model;
        demographic1.timezone = timezone;
        demographic1.locale = locale;
        demographic1.appVersion = appVersion;
        demographic1.platform = platform;
        demographic1.platformVersion = platformVersion;
        AWSPinpointEndpointProfile * profile1 = [[AWSPinpointEndpointProfile alloc] initWithApplicationId:@"MyApp" endpointId:@"abc123"];
        profile1.demographic = demographic1;

        NSError * error = nil;
        NSData * data = [NSKeyedArchiver archivedDataWithRootObject:profile1 requiringSecureCoding:YES error:&error];

        XCTAssertNil(error);

        AWSPinpointEndpointProfile * profile2 = [NSKeyedUnarchiver unarchivedObjectOfClass:[AWSPinpointEndpointProfile class]
                                                                                  fromData:data
                                                                                     error:&error];

        XCTAssertNil(error);

        XCTAssert([profile1.applicationId isEqualToString:profile2.applicationId]);
        XCTAssert([profile1.endpointId isEqualToString:profile2.endpointId]);

        AWSPinpointEndpointProfileDemographic * demographic2 = profile2.demographic;

        XCTAssertTrue([demographic2.model isEqualToString:model]);
        XCTAssertTrue([demographic2.timezone isEqualToString:timezone]);
        XCTAssertTrue([demographic2.locale isEqualToString:locale]);
        XCTAssertTrue([demographic2.appVersion isEqualToString:appVersion]);
        XCTAssertTrue([demographic2.platform isEqualToString:platform]);
        XCTAssertTrue([demographic2.platformVersion isEqualToString:platformVersion]);

        XCTAssertTrue([demographic2.model isEqualToString:demographic1.model]);
        XCTAssertTrue([demographic2.timezone isEqualToString:demographic1.timezone]);
        XCTAssertTrue([demographic2.locale isEqualToString:demographic1.locale]);
        XCTAssertTrue([demographic2.appVersion isEqualToString:demographic1.appVersion]);
        XCTAssertTrue([demographic2.platform isEqualToString:demographic1.platform]);
        XCTAssertTrue([demographic2.platformVersion isEqualToString:demographic1.platformVersion]);
    }
}

- (void)testUsingAWSNSCodingUtilitiesForPinpointEndpointProfileWithDemographic {
        NSString * model = @"MODEL";
        NSString * timezone = @"TIMEZONE";
        NSString * locale = @"LOCALE";
        NSString * appVersion = @"APPVERSION";
        NSString * platform = @"PLATFORM";
        NSString * platformVersion = @"PLATFORMVERSION";

        AWSPinpointEndpointProfileDemographic * demographic1 = [[AWSPinpointEndpointProfileDemographic alloc] init];
        demographic1.model = model;
        demographic1.timezone = timezone;
        demographic1.locale = locale;
        demographic1.appVersion = appVersion;
        demographic1.platform = platform;
        demographic1.platformVersion = platformVersion;
        AWSPinpointEndpointProfile * profile1 = [[AWSPinpointEndpointProfile alloc] initWithApplicationId:@"MyApp" endpointId:@"abc123"];
        profile1.demographic = demographic1;

    NSError * error = nil;
    NSData * data = [AWSNSCodingUtilities versionSafeArchivedDataWithRootObject:profile1 requiringSecureCoding:YES error:&error];

    XCTAssertNil(error);

    AWSPinpointEndpointProfile * profile2 = [AWSNSCodingUtilities versionSafeUnarchivedObjectOfClass:[AWSPinpointEndpointProfile class] fromData:data error:&error];

    XCTAssertNil(error);

    XCTAssert([profile1.applicationId isEqualToString:profile2.applicationId]);
    XCTAssert([profile1.endpointId isEqualToString:profile2.endpointId]);

    AWSPinpointEndpointProfileDemographic * demographic2 = profile2.demographic;

    XCTAssertTrue([demographic2.model isEqualToString:model]);
    XCTAssertTrue([demographic2.timezone isEqualToString:timezone]);
    XCTAssertTrue([demographic2.locale isEqualToString:locale]);
    XCTAssertTrue([demographic2.appVersion isEqualToString:appVersion]);
    XCTAssertTrue([demographic2.platform isEqualToString:platform]);
    XCTAssertTrue([demographic2.platformVersion isEqualToString:platformVersion]);

    XCTAssertTrue([demographic2.model isEqualToString:demographic1.model]);
    XCTAssertTrue([demographic2.timezone isEqualToString:demographic1.timezone]);
    XCTAssertTrue([demographic2.locale isEqualToString:demographic1.locale]);
    XCTAssertTrue([demographic2.appVersion isEqualToString:demographic1.appVersion]);
    XCTAssertTrue([demographic2.platform isEqualToString:demographic1.platform]);
    XCTAssertTrue([demographic2.platformVersion isEqualToString:demographic1.platformVersion]);
}

@end
