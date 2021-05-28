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
        XCTAssert([profile1.channelType isEqualToString:profile2.channelType]);
    }
}

- (void)testArchivingAndUnarchivingPinpointEndpointProfileWithAttributes {
    if (@available(iOS 11, *)) {
        NSString * numbersKey = @"Numbers";
        NSArray<NSString *> * numbers1 = @[@"1", @"2", @"3"];
        AWSPinpointEndpointProfile * profile1 = [[AWSPinpointEndpointProfile alloc] initWithApplicationId:@"MyApp" endpointId:@"abc123"];
        [profile1 addAttribute:numbers1 forKey:numbersKey];

        NSLog(@"Attribute Keys: %@", profile1.allAttributes.allKeys);

        NSError * error = nil;
        NSData * data = [NSKeyedArchiver archivedDataWithRootObject:profile1 requiringSecureCoding:YES error:&error];

        XCTAssertNil(error);

        AWSPinpointEndpointProfile * profile2 = [NSKeyedUnarchiver unarchivedObjectOfClass:[AWSPinpointEndpointProfile class]
                                                                                   fromData:data
                                                                                      error:&error];

        XCTAssertNil(error);

        XCTAssert([profile1.applicationId isEqualToString:profile2.applicationId]);
        XCTAssert([profile1.endpointId isEqualToString:profile2.endpointId]);
        XCTAssert([profile1.channelType isEqualToString:profile2.channelType]);

        NSArray<NSNumber *> * numbers2 = [profile2 attributeForKey:numbersKey];
        XCTAssertNotNil(numbers2);
    }
}

- (void)testUsingAWSNSCodingUtilitiesForPinpointEndpointProfile {
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
    XCTAssert([profile1.channelType isEqualToString:profile2.channelType]);

    NSArray<NSNumber *> * numbers2 = [profile2 attributeForKey:numbersKey];
    XCTAssertNotNil(numbers2);
}

@end
