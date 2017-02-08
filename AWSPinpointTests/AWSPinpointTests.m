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

#import <XCTest/XCTest.h>
#import "AWSTestUtility.h"
#import "AWSPinpoint.h"
#import "AWSPinpointContext.h"

@interface AWSPinpointTests : XCTestCase

@end

@interface AWSPinpoint ()
@property (nonatomic, strong) AWSPinpointContext *pinpointContext;
@end

@implementation AWSPinpointTests

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)tearDown {
    [super tearDown];
}


- (void)testDefaultPinpointConstructors {
    @try {
        AWSPinpoint *pinpoint = [AWSPinpoint new];
        XCTFail(@"Expected an exception to be thrown. %@", pinpoint);
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, NSInternalInconsistencyException);
    }
}

- (void)testStaticConstructorsNilConfig {
    @try {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
        AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:nil];
#pragma clang diagnostic pop
        XCTFail(@"Expected an exception to be thrown. %@", pinpoint);
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, NSInternalInconsistencyException);
    }
}

- (void)testDefaultConfigConstructors {
    @try {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
        AWSPinpointConfiguration *pinpoint = [AWSPinpointConfiguration new];
#pragma clang diagnostic pop
        XCTFail(@"Expected an exception to be thrown. %@", pinpoint);
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, NSInternalInconsistencyException);
    }
}

- (void)testDefaultConfigConstructorValues {
    AWSPinpointConfiguration *pinpointConfiguration = [[AWSPinpointConfiguration alloc] initWithAppId:@"testDefaultConfigConstructorValues"
                                                                                        launchOptions:@{@"testKey":@"testValue"}];
    XCTAssertNotNil(pinpointConfiguration);
    XCTAssertTrue(pinpointConfiguration.enableEvents);
    XCTAssertTrue(pinpointConfiguration.enableTargeting);
    XCTAssertTrue(pinpointConfiguration.enableAutoSessionRecording);
    XCTAssertEqual(pinpointConfiguration.maxStorageSize, 1024 * 1024 * 5);
    XCTAssertEqual(pinpointConfiguration.sessionTimeout, 5000);
    XCTAssertNotNil(pinpointConfiguration.attributes);
    XCTAssertNotNil(pinpointConfiguration.environment);
    XCTAssertNotNil(pinpointConfiguration.environment.appVersion);
    XCTAssertNotNil(pinpointConfiguration.environment.appBuild);
    XCTAssertNotNil(pinpointConfiguration.environment.appPackageName);
    XCTAssertNotNil(pinpointConfiguration.environment.appName);
    XCTAssertNotNil(pinpointConfiguration.serviceConfiguration);
    XCTAssertTrue([pinpointConfiguration.serviceConfiguration isKindOfClass:[AWSServiceConfiguration class]]);
    XCTAssertNotNil(pinpointConfiguration.targetingServiceConfiguration);
    XCTAssertTrue([pinpointConfiguration.targetingServiceConfiguration isKindOfClass:[AWSServiceConfiguration class]]);
    XCTAssertNotNil(pinpointConfiguration.appId);
    XCTAssertTrue([pinpointConfiguration.appId isEqualToString:@"testDefaultConfigConstructorValues"]);
    XCTAssertNotNil(pinpointConfiguration.launchOptions);
    XCTAssertTrue([[pinpointConfiguration.launchOptions objectForKey:@"testKey"] isEqualToString:@"testValue"]);
    XCTAssertNil(pinpointConfiguration.completionBlock);
}

- (void)testDefaultConfigConstructorCustomValues {
    AWSPinpointConfiguration *pinpointConfiguration = [[AWSPinpointConfiguration alloc] initWithAppId:@"testDefaultConfigConstructorCustomValues"
                                                                                        launchOptions:@{@"testKey":@"testValue"}
                                                                                       maxStorageSize:123
                                                                                       sessionTimeout:321];
    XCTAssertNotNil(pinpointConfiguration);
    XCTAssertTrue(pinpointConfiguration.enableEvents);
    XCTAssertTrue(pinpointConfiguration.enableTargeting);
    XCTAssertTrue(pinpointConfiguration.enableAutoSessionRecording);
    XCTAssertEqual(pinpointConfiguration.maxStorageSize, 123);
    XCTAssertEqual(pinpointConfiguration.sessionTimeout, 321);
    XCTAssertNotNil(pinpointConfiguration.attributes);
    XCTAssertNotNil(pinpointConfiguration.environment);
    XCTAssertNotNil(pinpointConfiguration.environment.appVersion);
    XCTAssertNotNil(pinpointConfiguration.environment.appBuild);
    XCTAssertNotNil(pinpointConfiguration.environment.appPackageName);
    XCTAssertNotNil(pinpointConfiguration.environment.appName);
    XCTAssertNotNil(pinpointConfiguration.serviceConfiguration);
    XCTAssertTrue([pinpointConfiguration.serviceConfiguration isKindOfClass:[AWSServiceConfiguration class]]);
    XCTAssertNotNil(pinpointConfiguration.targetingServiceConfiguration);
    XCTAssertTrue([pinpointConfiguration.targetingServiceConfiguration isKindOfClass:[AWSServiceConfiguration class]]);
    XCTAssertNotNil(pinpointConfiguration.appId);
    XCTAssertTrue([pinpointConfiguration.appId isEqualToString:@"testDefaultConfigConstructorCustomValues"]);
    XCTAssertNotNil(pinpointConfiguration.launchOptions);
    XCTAssertTrue([[pinpointConfiguration.launchOptions objectForKey:@"testKey"] isEqualToString:@"testValue"]);
    XCTAssertNil(pinpointConfiguration.completionBlock);
}


- (void)testDefaultStaticPinpointConstructor {
    AWSPinpointConfiguration *pinpointConfiguration = [[AWSPinpointConfiguration alloc] initWithAppId:@"testDefaultStaticPinpointConstructor"
                                                                                        launchOptions:@{@"testKey":@"testValue"}
                                                                                       maxStorageSize:123
                                                                                       sessionTimeout:321];
    XCTAssertNotNil(pinpointConfiguration);
    XCTAssertTrue(pinpointConfiguration.enableEvents);
    XCTAssertTrue(pinpointConfiguration.enableTargeting);
    XCTAssertTrue(pinpointConfiguration.enableAutoSessionRecording);
    XCTAssertEqual(pinpointConfiguration.maxStorageSize, 123);
    XCTAssertEqual(pinpointConfiguration.sessionTimeout, 321);
    XCTAssertNotNil(pinpointConfiguration.attributes);
    XCTAssertNotNil(pinpointConfiguration.environment);
    XCTAssertNotNil(pinpointConfiguration.environment.appVersion);
    XCTAssertNotNil(pinpointConfiguration.environment.appBuild);
    XCTAssertNotNil(pinpointConfiguration.environment.appPackageName);
    XCTAssertNotNil(pinpointConfiguration.environment.appName);
    XCTAssertNotNil(pinpointConfiguration.serviceConfiguration);
    XCTAssertTrue([pinpointConfiguration.serviceConfiguration isKindOfClass:[AWSServiceConfiguration class]]);
    XCTAssertNotNil(pinpointConfiguration.targetingServiceConfiguration);
    XCTAssertTrue([pinpointConfiguration.targetingServiceConfiguration isKindOfClass:[AWSServiceConfiguration class]]);
    XCTAssertNotNil(pinpointConfiguration.appId);
    XCTAssertTrue([pinpointConfiguration.appId isEqualToString:@"testDefaultStaticPinpointConstructor"]);
    XCTAssertNotNil(pinpointConfiguration.launchOptions);
    XCTAssertTrue([[pinpointConfiguration.launchOptions objectForKey:@"testKey"] isEqualToString:@"testValue"]);
    XCTAssertNil(pinpointConfiguration.completionBlock);
    
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:pinpointConfiguration];
    XCTAssertNotNil(pinpoint);
    XCTAssertNotNil(pinpoint.notificationManager);
    XCTAssertTrue([pinpoint.notificationManager isKindOfClass:[AWSPinpointNotificationManager class]]);
    XCTAssertNotNil(pinpoint.sessionClient);
    XCTAssertTrue([pinpoint.sessionClient isKindOfClass:[AWSPinpointSessionClient class]]);
    XCTAssertNotNil(pinpoint.targetingClient);
    XCTAssertTrue([pinpoint.targetingClient isKindOfClass:[AWSPinpointTargetingClient class]]);
    XCTAssertNotNil(pinpoint.analyticsClient);
    XCTAssertTrue([pinpoint.analyticsClient isKindOfClass:[AWSPinpointAnalyticsClient class]]);
    XCTAssertNotNil(pinpoint.configuration);
    XCTAssertTrue([pinpointConfiguration.appId isEqualToString:pinpoint.configuration.appId]);
    XCTAssertNotNil(pinpoint.pinpointContext);
    XCTAssertNotNil(pinpoint.pinpointContext.clientContext);
    XCTAssertNotNil(pinpoint.pinpointContext.uniqueId);
    XCTAssertNotNil(pinpoint.pinpointContext.analyticsService);
    XCTAssertNotNil(pinpoint.pinpointContext.targetingService);
    XCTAssertNotNil(pinpoint.pinpointContext.configuration);
    XCTAssertTrue([pinpointConfiguration.appId isEqualToString:pinpoint.pinpointContext.configuration.appId]);
}

- (void) testNormalStaticPinpointConstructor {
    AWSPinpointConfiguration *pinpointConfiguration = [[AWSPinpointConfiguration alloc] initWithAppId:@"testNormalStaticPinpointConstructor"
                                                                                        launchOptions:@{@"testKey":@"testValue"}
                                                                                       maxStorageSize:123
                                                                                       sessionTimeout:321];
    XCTAssertNotNil(pinpointConfiguration);
    XCTAssertTrue(pinpointConfiguration.enableEvents);
    XCTAssertTrue(pinpointConfiguration.enableTargeting);
    XCTAssertTrue(pinpointConfiguration.enableAutoSessionRecording);
    XCTAssertEqual(pinpointConfiguration.maxStorageSize, 123);
    XCTAssertEqual(pinpointConfiguration.sessionTimeout, 321);
    XCTAssertNotNil(pinpointConfiguration.attributes);
    XCTAssertNotNil(pinpointConfiguration.environment);
    XCTAssertNotNil(pinpointConfiguration.environment.appVersion);
    XCTAssertNotNil(pinpointConfiguration.environment.appBuild);
    XCTAssertNotNil(pinpointConfiguration.environment.appPackageName);
    XCTAssertNotNil(pinpointConfiguration.environment.appName);
    XCTAssertNotNil(pinpointConfiguration.serviceConfiguration);
    XCTAssertTrue([pinpointConfiguration.serviceConfiguration isKindOfClass:[AWSServiceConfiguration class]]);
    XCTAssertNotNil(pinpointConfiguration.targetingServiceConfiguration);
    XCTAssertTrue([pinpointConfiguration.targetingServiceConfiguration isKindOfClass:[AWSServiceConfiguration class]]);
    XCTAssertNotNil(pinpointConfiguration.appId);
    XCTAssertTrue([pinpointConfiguration.appId isEqualToString:@"testNormalStaticPinpointConstructor"]);
    XCTAssertNotNil(pinpointConfiguration.launchOptions);
    XCTAssertTrue([[pinpointConfiguration.launchOptions objectForKey:@"testKey"] isEqualToString:@"testValue"]);
    XCTAssertNil(pinpointConfiguration.completionBlock);
    
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:pinpointConfiguration];
    XCTAssertNotNil(pinpoint);
    XCTAssertNotNil(pinpoint.notificationManager);
    XCTAssertTrue([pinpoint.notificationManager isKindOfClass:[AWSPinpointNotificationManager class]]);
    XCTAssertNotNil(pinpoint.sessionClient);
    XCTAssertTrue([pinpoint.sessionClient isKindOfClass:[AWSPinpointSessionClient class]]);
    XCTAssertNotNil(pinpoint.targetingClient);
    XCTAssertTrue([pinpoint.targetingClient isKindOfClass:[AWSPinpointTargetingClient class]]);
    XCTAssertNotNil(pinpoint.analyticsClient);
    XCTAssertTrue([pinpoint.analyticsClient isKindOfClass:[AWSPinpointAnalyticsClient class]]);
    XCTAssertNotNil(pinpoint.configuration);
    XCTAssertEqual(pinpointConfiguration, pinpoint.configuration);
    XCTAssertNotNil(pinpoint.pinpointContext);
    XCTAssertNotNil(pinpoint.pinpointContext.clientContext);
    XCTAssertNotNil(pinpoint.pinpointContext.uniqueId);
    XCTAssertNotNil(pinpoint.pinpointContext.analyticsService);
    XCTAssertNotNil(pinpoint.pinpointContext.targetingService);
    XCTAssertNotNil(pinpoint.pinpointContext.configuration);
    XCTAssertEqual(pinpointConfiguration, pinpoint.pinpointContext.configuration);
}

- (void) testDisableTargeting {
    AWSPinpointConfiguration *pinpointConfiguration = [[AWSPinpointConfiguration alloc] initWithAppId:@"testDisableTargeting"
                                                                                        launchOptions:@{@"testKey":@"testValue"}
                                                                                       maxStorageSize:123
                                                                                       sessionTimeout:321];
    pinpointConfiguration.enableTargeting = NO;
    
    XCTAssertNotNil(pinpointConfiguration);
    XCTAssertTrue(pinpointConfiguration.enableEvents);
    XCTAssertFalse(pinpointConfiguration.enableTargeting);
    XCTAssertTrue(pinpointConfiguration.enableAutoSessionRecording);
    XCTAssertEqual(pinpointConfiguration.maxStorageSize, 123);
    XCTAssertEqual(pinpointConfiguration.sessionTimeout, 321);
    XCTAssertNotNil(pinpointConfiguration.attributes);
    XCTAssertNotNil(pinpointConfiguration.environment);
    XCTAssertNotNil(pinpointConfiguration.environment.appVersion);
    XCTAssertNotNil(pinpointConfiguration.environment.appBuild);
    XCTAssertNotNil(pinpointConfiguration.environment.appPackageName);
    XCTAssertNotNil(pinpointConfiguration.environment.appName);
    XCTAssertNotNil(pinpointConfiguration.serviceConfiguration);
    XCTAssertTrue([pinpointConfiguration.serviceConfiguration isKindOfClass:[AWSServiceConfiguration class]]);
    XCTAssertNotNil(pinpointConfiguration.targetingServiceConfiguration);
    XCTAssertTrue([pinpointConfiguration.targetingServiceConfiguration isKindOfClass:[AWSServiceConfiguration class]]);
    XCTAssertNotNil(pinpointConfiguration.appId);
    XCTAssertTrue([pinpointConfiguration.appId isEqualToString:@"testDisableTargeting"]);
    XCTAssertNotNil(pinpointConfiguration.launchOptions);
    XCTAssertTrue([[pinpointConfiguration.launchOptions objectForKey:@"testKey"] isEqualToString:@"testValue"]);
    XCTAssertNil(pinpointConfiguration.completionBlock);
    
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:pinpointConfiguration];
    XCTAssertNotNil(pinpoint);
    XCTAssertNotNil(pinpoint.notificationManager);
    XCTAssertTrue([pinpoint.notificationManager isKindOfClass:[AWSPinpointNotificationManager class]]);
    XCTAssertNotNil(pinpoint.sessionClient);
    XCTAssertTrue([pinpoint.sessionClient isKindOfClass:[AWSPinpointSessionClient class]]);
    XCTAssertNil(pinpoint.targetingClient);
    XCTAssertNotNil(pinpoint.analyticsClient);
    XCTAssertTrue([pinpoint.analyticsClient isKindOfClass:[AWSPinpointAnalyticsClient class]]);
    XCTAssertNotNil(pinpoint.configuration);
    XCTAssertEqual(pinpointConfiguration, pinpoint.configuration);
    XCTAssertNotNil(pinpoint.pinpointContext);
    XCTAssertNotNil(pinpoint.pinpointContext.clientContext);
    XCTAssertNotNil(pinpoint.pinpointContext.uniqueId);
    XCTAssertNotNil(pinpoint.pinpointContext.analyticsService);
    XCTAssertNil(pinpoint.pinpointContext.targetingService);
    XCTAssertNotNil(pinpoint.pinpointContext.configuration);
    XCTAssertEqual(pinpointConfiguration, pinpoint.pinpointContext.configuration);
}


- (void) testDisableAnalytics {
    AWSPinpointConfiguration *pinpointConfiguration = [[AWSPinpointConfiguration alloc] initWithAppId:@"testDisableAnalytics"
                                                                                        launchOptions:@{@"testKey":@"testValue"}
                                                                                       maxStorageSize:123
                                                                                       sessionTimeout:321];
    pinpointConfiguration.enableEvents = NO;
    
    XCTAssertNotNil(pinpointConfiguration);
    XCTAssertFalse(pinpointConfiguration.enableEvents);
    XCTAssertTrue(pinpointConfiguration.enableTargeting);
    XCTAssertTrue(pinpointConfiguration.enableAutoSessionRecording);
    XCTAssertEqual(pinpointConfiguration.maxStorageSize, 123);
    XCTAssertEqual(pinpointConfiguration.sessionTimeout, 321);
    XCTAssertNotNil(pinpointConfiguration.attributes);
    XCTAssertNotNil(pinpointConfiguration.environment);
    XCTAssertNotNil(pinpointConfiguration.environment.appVersion);
    XCTAssertNotNil(pinpointConfiguration.environment.appBuild);
    XCTAssertNotNil(pinpointConfiguration.environment.appPackageName);
    XCTAssertNotNil(pinpointConfiguration.environment.appName);
    XCTAssertNotNil(pinpointConfiguration.serviceConfiguration);
    XCTAssertTrue([pinpointConfiguration.serviceConfiguration isKindOfClass:[AWSServiceConfiguration class]]);
    XCTAssertNotNil(pinpointConfiguration.targetingServiceConfiguration);
    XCTAssertTrue([pinpointConfiguration.targetingServiceConfiguration isKindOfClass:[AWSServiceConfiguration class]]);
    XCTAssertNotNil(pinpointConfiguration.appId);
    XCTAssertTrue([pinpointConfiguration.appId isEqualToString:@"testDisableAnalytics"]);
    XCTAssertNotNil(pinpointConfiguration.launchOptions);
    XCTAssertTrue([[pinpointConfiguration.launchOptions objectForKey:@"testKey"] isEqualToString:@"testValue"]);
    XCTAssertNil(pinpointConfiguration.completionBlock);
    
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:pinpointConfiguration];
    XCTAssertNotNil(pinpoint);
    XCTAssertNotNil(pinpoint.notificationManager);
    XCTAssertTrue([pinpoint.notificationManager isKindOfClass:[AWSPinpointNotificationManager class]]);
    XCTAssertNil(pinpoint.sessionClient);
    XCTAssertNotNil(pinpoint.targetingClient);
    XCTAssertTrue([pinpoint.targetingClient isKindOfClass:[AWSPinpointTargetingClient class]]);
    XCTAssertNil(pinpoint.analyticsClient);
    XCTAssertNotNil(pinpoint.configuration);
    XCTAssertEqual(pinpointConfiguration, pinpoint.configuration);
    XCTAssertNotNil(pinpoint.pinpointContext);
    XCTAssertNotNil(pinpoint.pinpointContext.clientContext);
    XCTAssertNotNil(pinpoint.pinpointContext.uniqueId);
    XCTAssertNil(pinpoint.pinpointContext.analyticsService);
    XCTAssertNotNil(pinpoint.pinpointContext.targetingService);
    XCTAssertNotNil(pinpoint.pinpointContext.configuration);
    XCTAssertEqual(pinpointConfiguration, pinpoint.pinpointContext.configuration);
}

- (void) testEmptyAppId {
    @try {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
        AWSPinpointConfiguration *pinpointConfiguration = [[AWSPinpointConfiguration alloc] initWithAppId:nil
                                                                                            launchOptions:@{@"testKey":@"testValue"}
                                                                                           maxStorageSize:123
                                                                                           sessionTimeout:321];
#pragma clang diagnostic pop
        
        AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:pinpointConfiguration];
        XCTFail(@"Expected an exception to be thrown. %@", pinpoint);
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, NSInternalInconsistencyException);
    }
}

@end
