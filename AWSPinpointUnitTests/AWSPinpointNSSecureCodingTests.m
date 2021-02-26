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
#import "AWSPinpoint.h"

@interface AWSPinpointEndpointProfile()

- (instancetype) initWithApplicationId:(NSString *)applicationId
                            endpointId:(NSString *)endpointId
                applicationLevelOptOut:(BOOL)applicationLevelOptOut
                                 debug:(BOOL)debug
                          userDefaults:(NSUserDefaults *)userDefaults;

@end

@interface AWSPinpointSession()

- (instancetype)initWithSessionId:(NSString *)sessionId
                    withStartTime:(NSDate *)startTime
                     withStopTime:(NSDate *)stopTime;

@end

@interface AWSPinpointNSSecureCodingTests : XCTestCase

@property (nonatomic, strong) NSURL *archiveURL;

// Specifically declare these methods in the interface so we can set availability
// to iOS 11. Tests that don't use newer APIs don't need to be declared here.
- (void)testProfileArchivesAndUnarchivesUsingSecureCoding API_AVAILABLE(ios(11));
- (void)testProfileArchivesAndUnarchivesWithLegacyAPI API_AVAILABLE(ios(11));

- (void)testSessionArchivesAndUnarchivesSecurely API_AVAILABLE(ios(11));
- (void)testSessionArchivesAndUnarchivesWithLegacyAPI API_AVAILABLE(ios(11));

@end

@implementation AWSPinpointNSSecureCodingTests

- (void)testProfileArchivesAndUnarchivesUsingSecureCoding {
    AWSPinpointEndpointProfile *profile = [[AWSPinpointEndpointProfile alloc] initWithApplicationId:@"app-id-123"
                                                                                         endpointId:@"endpoint-id-123"
                                                                             applicationLevelOptOut:YES
                                                                                              debug:YES
                                                                                       userDefaults:nil];

    NSError *error;
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:profile
                                         requiringSecureCoding:YES
                                                         error:&error];
    XCTAssertNil(error);

    error = nil;
    AWSPinpointEndpointProfile *unarchivedProfile = [NSKeyedUnarchiver unarchivedObjectOfClass:[AWSPinpointEndpointProfile class]
                                                                                      fromData:data
                                                                                         error:&error];
    XCTAssertNil(error);

    // The class doesn't support `isEqual` so we'll compare string descriptions
    XCTAssertEqualObjects([unarchivedProfile description], [profile description]);
}

- (void)testProfileSupportsSecureCoding {
    XCTAssert([AWSPinpointEndpointProfile supportsSecureCoding]);
}

- (void)testProfileArchivesAndUnarchivesWithLegacyAPI {
    AWSPinpointEndpointProfile *profile = [[AWSPinpointEndpointProfile alloc] initWithApplicationId:@"app-id-123"
                                                                                         endpointId:@"endpoint-id-123"
                                                                             applicationLevelOptOut:YES
                                                                                              debug:YES
                                                                                       userDefaults:nil];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:profile];

    AWSPinpointEndpointProfile *unarchivedProfile = (AWSPinpointEndpointProfile *)[NSKeyedUnarchiver unarchiveObjectWithData:data];

    // The class doesn't support `isEqual` so we'll compare string descriptions
    XCTAssertEqualObjects([unarchivedProfile description], [profile description]);
}

- (void)testSessionArchivesAndUnarchivesSecurely {
    AWSPinpointSession *session = [[AWSPinpointSession alloc] initWithSessionId:@"session-123"
                                                                  withStartTime:[NSDate new]
                                                                   withStopTime:nil];
    NSError *error;
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:session
                                         requiringSecureCoding:YES
                                                         error:&error];
    XCTAssertNil(error);

    error = nil;
    AWSPinpointSession *unarchivedSession = [NSKeyedUnarchiver unarchivedObjectOfClass:[AWSPinpointSession class]
                                                                              fromData:data
                                                                                 error:&error];
    XCTAssertNil(error);

    // The class doesn't support `isEqual` or `description` so we'll compare property-by-property
    XCTAssertEqualObjects(unarchivedSession.sessionId, session.sessionId);
    XCTAssertEqualObjects(unarchivedSession.startTime, session.startTime);
    XCTAssertEqualObjects(unarchivedSession.stopTime, session.stopTime);
}

- (void)testSessionSupportsSecureCoding {
    XCTAssert([AWSPinpointSession supportsSecureCoding]);
}

- (void)testSessionArchivesAndUnarchivesWithLegacyAPI {
    AWSPinpointSession *session = [[AWSPinpointSession alloc] initWithSessionId:@"session-123"
                                                                  withStartTime:[NSDate new]
                                                                   withStopTime:nil];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:session];

    AWSPinpointSession *unarchivedSession = (AWSPinpointSession *)[NSKeyedUnarchiver unarchiveObjectWithData:data];

    // The class doesn't support `isEqual` or `description` so we'll compare property-by-property
    XCTAssertEqualObjects(unarchivedSession.sessionId, session.sessionId);
    XCTAssertEqualObjects(unarchivedSession.startTime, session.startTime);
    XCTAssertEqualObjects(unarchivedSession.stopTime, session.stopTime);
}

@end
