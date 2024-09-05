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
    isRegisteredForRemoteNotifications:(BOOL)isRegisteredForRemoteNotifications
                                 debug:(BOOL)debug
                          userDefaults:(NSUserDefaults *)userDefaults
                              keychain:(AWSUICKeyChainStore *)keychain;

@end

@interface AWSPinpointSession()

- (instancetype)initWithSessionId:(NSString *)sessionId
                    withStartTime:(NSDate *)startTime
                     withStopTime:(NSDate *)stopTime;

@end

@interface AWSPinpointNSSecureCodingTests : XCTestCase

@property (nonatomic, strong) NSURL *archiveURL;

@end

@implementation AWSPinpointNSSecureCodingTests

- (void)testProfileArchivesAndUnarchivesUsingSecureCoding {
    AWSPinpointEndpointProfile *profile = [[AWSPinpointEndpointProfile alloc] initWithApplicationId:@"app-id-123"
                                                                                         endpointId:@"endpoint-id-123"
                                                                             applicationLevelOptOut:YES
                                                                 isRegisteredForRemoteNotifications:YES
                                                                                              debug:YES
                                                                                       userDefaults:[NSUserDefaults standardUserDefaults] keychain:[AWSUICKeyChainStore keyChainStoreWithService: @"com.amazonaws.AWSPinpointContext"]];

    [profile addAttribute:@[@"Attribute1", @"Attribute2"]
                   forKey:@"profileAttributeKey"];
    [profile addMetric:[NSNumber numberWithInt:10] forKey:@"profileMetricKey"];

    AWSPinpointEndpointProfileUser *user = [AWSPinpointEndpointProfileUser new];
    user.userId = @"UserId";
    [user addUserAttribute:@[@"Attribute1", @"Attribute2"] 
                    forKey:@"userAttributeKey"];
    profile.user = user;

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

@end
