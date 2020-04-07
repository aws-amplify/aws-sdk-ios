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
#import "OCMock.h"

#import "AWSPinpointEventRecorderTestBase.h"

static id _mockNSBundle;

NSString *const AWSPinpointSessionKey = @"com.amazonaws.AWSPinpointSessionKey";
int const DEFAULT_BATCH_LIMIT = 512 * 1024;
int const AWSPinpointClientByteLimitDefault = 5 * 1024 * 1024; // 5MB
int const AWSPinpointClientBatchRecordByteLimitDefault = 512 * 1024;

@interface AWSPinpoint()
- (void) destroy;
@end

@interface AWSPinpointConfiguration()
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@end

@implementation AWSPinpointEventRecorderTestBase

+ (void)setUp {
    //Mocking the NSBundle so the App specific information can be retrieved
    //from Info.plist
    _mockNSBundle = [OCMockObject niceMockForClass:[NSBundle class]];
    NSBundle *correctMainBundle = [NSBundle bundleForClass:self.class];
    [[[[_mockNSBundle stub] classMethod] andReturn:correctMainBundle] mainBundle];
}

+ (void)tearDown {
    [_mockNSBundle stopMocking];
}

- (void)tearDown {
    [self.pinpointIAD destroy];
    self.pinpointIAD = nil;
    [super tearDown];
}

- (void)setUp {
    [super setUp];

    [AWSTestUtility setupCognitoCredentialsProvider];
    [[NSUserDefaults standardUserDefaults] removeSuiteNamed:@"AWSPinpointEventRecorderTests"];
    self.userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"AWSPinpointEventRecorderTests"];

    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials"
                                                                          ofType:@"json"];
    NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:nil];
    [self initializePinpointIAD:credentialsJson];
    [[AWSDDLog sharedInstance] setLogLevel:AWSDDLogLevelVerbose];
}

- (void) initializePinpointIAD:(NSDictionary *) credentialsJson {
    self.appIdIAD = credentialsJson[@"pinpointAppId"];
    self.configIAD = [[AWSPinpointConfiguration alloc] initWithAppId:self.appIdIAD
                                                       launchOptions:nil
                                                      maxStorageSize:AWSPinpointClientByteLimitDefault
                                                      sessionTimeout:0];
    self.configIAD.userDefaults = self.userDefaults;
    self.pinpointIAD = [AWSPinpoint pinpointWithConfiguration:self.configIAD];
    [[self.pinpointIAD.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
}

+(AWSPinpoint *) initializePinpointWithConfig:(AWSPinpointConfiguration *)config {
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    [config.userDefaults setObject:nil forKey:AWSPinpointSessionKey];
    [config.userDefaults removeObjectForKey:AWSPinpointSessionKey];
    [config.userDefaults synchronize];
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    return pinpoint;
}

- (void) removeAllEventsAndVerify:(AWSPinpoint *)pinpoint {
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
}

@end
