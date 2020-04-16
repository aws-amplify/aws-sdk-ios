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
#import "OCMock.h"
#import "AWSPinpointContext.h"
#import "AWSPinpointEndpointProfile.h"
#import "AWSPinpointNotificationManager.h"

NSString *const AWSPinpointTargetingClientErrorDomain = @"com.amazonaws.AWSPinpointAnalyticsClientErrorDomain";

static NSString *userId;

@interface AWSPinpointTargetingClientTests : XCTestCase
@property (nonatomic, strong) AWSPinpoint *pinpoint;
@property (nonatomic, strong) AWSPinpointConfiguration *configuration;
@property (nonatomic, strong) UIApplication *application;
@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end

@interface AWSPinpointTargetingClient()
- (AWSPinpointTargetingUpdateEndpointRequest*) updateEndpointRequestForEndpoint:(AWSPinpointEndpointProfile *) endpoint;
@end

@interface AWSPinpointConfiguration()
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@end

@implementation AWSPinpointTargetingClientTests

+ (void) setUp {
    //Create a random string prefixed with "TestUserId" for the EndpointProfile.UserId
    userId = [NSString stringWithFormat:@"%s-%@", "TestUserId", [[NSUUID UUID] UUIDString]];
}

- (void)setUp {
    [super setUp];

    [AWSTestUtility setupCognitoCredentialsProvider];
    [[NSUserDefaults standardUserDefaults] removeSuiteNamed:@"AWSPinpointTargetingClientTests"];
    self.userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"AWSPinpointTargetingClientTests"];

    [self initializeMockApplicationWithOptOut:YES];
    [self initializePinpointWithConfiguration:[self getDefaultAWSPinpointConfiguration] forceCreate:NO];
    [self.userDefaults removeObjectForKey:@"AWSPinpointEndpointAttributesKey"];
    [self.userDefaults removeObjectForKey:@"AWSPinpointEndpointMetricsKey"];
    [self.userDefaults synchronize];
}

- (void)tearDown {
    [super tearDown];
}

- (AWSPinpointConfiguration *)getDefaultAWSPinpointConfiguration {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials"
                                                                          ofType:@"json"];
    NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:nil];

    return [[AWSPinpointConfiguration alloc] initWithAppId:credentialsJson[@"pinpointAppId"] launchOptions:@{}];
}

- (AWSPinpointConfiguration *)getAWSPinpointConfigurationWithOptOut:(BOOL)optOut {
    AWSPinpointConfiguration *configuration = [self getDefaultAWSPinpointConfiguration];

    [self setApplicationLevelOptOut:configuration withOptOut:optOut];

    return configuration;
}

- (void)setApplicationLevelOptOut:(AWSPinpointConfiguration *)configuration withOptOut:(BOOL)optOut {
    configuration.isApplicationLevelOptOut = ^BOOL{
        return optOut;
    };
}

- (void)setApplicationLevelOptOut:(BOOL)optOut {
    [self initializePinpointWithConfiguration:[self getAWSPinpointConfigurationWithOptOut:optOut]];
}

- (void)initializePinpointWithConfiguration:(AWSPinpointConfiguration *)configuration forceCreate:(BOOL)forceCreate {
    self.configuration = configuration;
    // If the Pinpoint AppId exists already, pinpointWithConfiguration will not create a new instance of Pinpoint and ignore the configuration
    // forceCreate generates a random AppId which allows us to create Pinpoint from configuration, even if it exists already.
    if (forceCreate == YES) {
        self.configuration.appId = [[NSUUID UUID] UUIDString];
    }
    
    configuration.userDefaults = self.userDefaults;

    self.pinpoint = [AWSPinpoint pinpointWithConfiguration:configuration];
}

- (void)initializePinpointWithConfiguration:(AWSPinpointConfiguration *)configuration {
    [self initializePinpointWithConfiguration:configuration forceCreate:YES];
}

- (void)initializeMockApplicationWithOptOut:(BOOL)optOut {
    id mockApplication = OCMClassMock([UIApplication class]);

    OCMStub([mockApplication sharedApplication]).andReturn(mockApplication);

    [self setSystemLevelOptOut:mockApplication withOptOut:optOut];
}

- (void)setSystemLevelOptOut:(UIApplication *)application withOptOut:(BOOL)optOut {
    UIUserNotificationType notificationType = optOut ? UIUserNotificationTypeNone : UIUserNotificationTypeAlert;
    UIUserNotificationSettings *notificationSettings = [UIUserNotificationSettings settingsForTypes:notificationType categories:nil];
    OCMStub([application currentUserNotificationSettings]).andReturn(notificationSettings);
    OCMStub([application isRegisteredForRemoteNotifications]).andReturn(optOut == NO);
}

- (void)setSystemLevelOptOut:(BOOL)optOut {
    [self initializeMockApplicationWithOptOut:optOut];
}

- (void)testConstructors {
    @try {
        AWSPinpointTargetingClient *eventRecorder = [AWSPinpointTargetingClient new];
        XCTFail(@"Expected an exception to be thrown. %@", eventRecorder);
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, NSInternalInconsistencyException);
    }
}

- (void)testEndpointProfileInformationPersistence {
    NSString *dummyAppId = @"dummyAppId";
    [self.pinpoint.configuration.userDefaults removeObjectForKey:@"AWSPinpointEndpointProfileKey"];
    [self.pinpoint.configuration.userDefaults synchronize];
    AWSPinpointEndpointProfile *endpointProfile = [self.pinpoint.targetingClient currentEndpointProfile];
    endpointProfile.user.userId = userId;
    [[[self.pinpoint.targetingClient updateEndpointProfile:endpointProfile] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    XCTAssertNotNil([self.pinpoint.configuration.userDefaults objectForKey:@"AWSPinpointEndpointProfileKey"]);
    AWSPinpointEndpointProfile *profile = [self.pinpoint.targetingClient currentEndpointProfile];
    XCTAssertTrue([profile.user.userId isEqualToString:userId]);
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:self.configuration];
    profile = [pinpoint.targetingClient currentEndpointProfile];
    XCTAssertTrue([profile.user.userId isEqualToString:userId]);
    XCTAssertNotNil(profile.location);
    XCTAssertNotNil(profile.demographic);
    XCTAssertNotNil(profile.user);
    XCTAssertNotNil(profile.demographic.make);
    XCTAssertNotNil(profile.demographic.model);
    XCTAssertNotNil(profile.demographic.timezone);
    XCTAssertNotNil(profile.demographic.locale);
    XCTAssertNotNil(profile.demographic.appVersion);
    XCTAssertNotNil(profile.demographic.platform);
    XCTAssertNotNil(profile.demographic.platformVersion);
    AWSPinpointConfiguration *configuration = [[AWSPinpointConfiguration alloc] initWithAppId:dummyAppId launchOptions:nil];
    configuration.userDefaults = self.userDefaults;
    pinpoint = [AWSPinpoint pinpointWithConfiguration:configuration];
    profile = [pinpoint.targetingClient currentEndpointProfile];
    XCTAssertFalse([profile.user.userId isEqualToString:userId]);
}

- (void)testNewDeviceTokenUpdate {
    const unsigned char currentTokenBytes[] = {
        0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
        0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f
    };
    NSData *currentTokenData = [[NSData alloc] initWithBytes:currentTokenBytes length:16];
    NSString *currentTokenString = @"000102030405060708090a0b0c0d0e0f";

    const unsigned char newTokenBytes[] = {
        0xf0, 0xf1, 0xf2, 0xf3, 0xf4, 0xf5, 0xf6, 0xf7,
        0xf8, 0xf9, 0xfa, 0xfb, 0xfc, 0xfd, 0xfe, 0xff
    };
    NSData *newTokenData = [[NSData alloc] initWithBytes:newTokenBytes length:16];
    NSString *newTokenString = @"f0f1f2f3f4f5f6f7f8f9fafbfcfdfeff";

    NSString *appId = @"testNewDeviceTokenStringUpdate";
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:appId
                                                                         launchOptions:nil];
    config.enableAutoSessionRecording = NO;
    [[NSUserDefaults standardUserDefaults] removeSuiteNamed:@"testNewDeviceTokenStringUpdate"];
    config.userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"testNewDeviceTokenStringUpdate"];

    [config.userDefaults removeObjectForKey:AWSDeviceTokenKey];
    [config.userDefaults setObject:currentTokenData forKey:AWSDeviceTokenKey];
    [config.userDefaults synchronize];
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    AWSPinpointEndpointProfile *endpointProfile = [pinpoint.targetingClient currentEndpointProfile];
    XCTAssertEqualObjects(endpointProfile.address, currentTokenString);

    [pinpoint.configuration.userDefaults removeObjectForKey:AWSDeviceTokenKey];
    [pinpoint.configuration.userDefaults setObject:newTokenData forKey:AWSDeviceTokenKey];
    [pinpoint.configuration.userDefaults synchronize];
    endpointProfile = [pinpoint.targetingClient currentEndpointProfile];
    XCTAssertEqualObjects(endpointProfile.address, newTokenString);
}

- (void)testNewDeviceTokenUpdateWithStandardUserDefaults {
    const unsigned char currentTokenBytes[] = {
        0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
        0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f
    };
    NSData *currentTokenData = [[NSData alloc] initWithBytes:currentTokenBytes length:16];
    NSString *currentTokenString = @"000102030405060708090a0b0c0d0e0f";

    const unsigned char newTokenBytes[] = {
        0xf0, 0xf1, 0xf2, 0xf3, 0xf4, 0xf5, 0xf6, 0xf7,
        0xf8, 0xf9, 0xfa, 0xfb, 0xfc, 0xfd, 0xfe, 0xff
    };
    NSData *newTokenData = [[NSData alloc] initWithBytes:newTokenBytes length:16];
    NSString *newTokenString = @"f0f1f2f3f4f5f6f7f8f9fafbfcfdfeff";

    NSString *appId = @"testNewDeviceTokenStringUpdateWithDefaultUserDefaults";
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:appId
                                                                         launchOptions:nil];
    config.enableAutoSessionRecording = NO;

    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    [userDefaults removeObjectForKey:AWSDeviceTokenKey];
    [userDefaults setObject:currentTokenData forKey:AWSDeviceTokenKey];
    [userDefaults synchronize];
    AWSPinpointEndpointProfile *endpointProfile = [pinpoint.targetingClient currentEndpointProfile];
    XCTAssertEqualObjects(endpointProfile.address, currentTokenString);

    [userDefaults removeObjectForKey:AWSDeviceTokenKey];
    [userDefaults setObject:newTokenData forKey:AWSDeviceTokenKey];
    [userDefaults synchronize];
    endpointProfile = [pinpoint.targetingClient currentEndpointProfile];
    XCTAssertEqualObjects(endpointProfile.address, newTokenString);

    [userDefaults removeObjectForKey:AWSDeviceTokenKey];
    [userDefaults synchronize];
}

- (void)testCurrentProfileWithSystemOptOutAndApplicationOptOut {
    [self setSystemLevelOptOut:YES];
    [self setApplicationLevelOptOut:YES];

    AWSPinpointEndpointProfile *profile = [self.pinpoint.targetingClient currentEndpointProfile];
    XCTAssertTrue([profile.optOut isEqualToString:@"ALL"]);
}

- (void)testCurrentProfileWithSystemOptOutAndApplicationOptIn {
    [self setSystemLevelOptOut:YES];
    [self setApplicationLevelOptOut:NO];

    AWSPinpointEndpointProfile *profile = [self.pinpoint.targetingClient currentEndpointProfile];

    XCTAssertTrue([profile.optOut isEqualToString:@"ALL"]);
}

- (void)testCurrentProfileWithSystemOptOutAndApplicationOptOutUnset {
    [self setSystemLevelOptOut:YES];

    AWSPinpointEndpointProfile *profile = [self.pinpoint.targetingClient currentEndpointProfile];

    XCTAssertTrue([profile.optOut isEqualToString:@"ALL"]);
}

- (void)testCurrentProfileWithSystemOptInAndApplicationOptOut {
    [self setSystemLevelOptOut:NO];
    [self setApplicationLevelOptOut:YES];

    AWSPinpointEndpointProfile *profile = [self.pinpoint.targetingClient currentEndpointProfile];

    XCTAssertTrue([profile.optOut isEqualToString:@"ALL"]);
}

- (void) testCurrentProfileWithSystemOptInAndApplicationOptOutBackgroundThread {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) , ^{
        [self setSystemLevelOptOut:NO];
        [self setApplicationLevelOptOut:YES];

        AWSPinpointEndpointProfile *profile = [self.pinpoint.targetingClient currentEndpointProfile];
        XCTAssertTrue([profile.optOut isEqualToString:@"ALL"]);
        [expectation fulfill];
        expectation = nil;
    });
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void)testCurrentProfileWithSystemOptInAndApplicationOptIn {
    [self setSystemLevelOptOut:NO];
    [self setApplicationLevelOptOut:NO];

    AWSPinpointEndpointProfile *profile = [self.pinpoint.targetingClient currentEndpointProfile];

    XCTAssertTrue([profile.optOut isEqualToString:@"NONE"]);
}

- (void)testCurrentProfileWithSystemOptInAndApplicationOptOutUnset {
    [self setSystemLevelOptOut:NO];

    AWSPinpointEndpointProfile *profile = [self.pinpoint.targetingClient currentEndpointProfile];

    XCTAssertTrue([profile.optOut isEqualToString:@"NONE"]);
}
- (void)testCurrentProfile {
    [self validateCurrentProfile:NO forAppId:@"testCurrentProfileForAPNS"];
    [self validateCurrentProfile:YES forAppId:@"testCurrentProfileForAPNSSandbox"];
}

- (void)validateCurrentProfile:(BOOL)debug forAppId:(NSString *)appId {
    [[NSUserDefaults standardUserDefaults] removeSuiteNamed:@"AWSPinpointTargetingClientTests"];
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:appId launchOptions:nil];
    config.debug = debug;
    config.userDefaults = self.userDefaults;
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    
    AWSPinpointEndpointProfile *profile = [pinpoint.targetingClient currentEndpointProfile];
    XCTAssertNotNil(profile);
    XCTAssertNotNil(profile.endpointId);
    XCTAssertTrue([profile.applicationId isEqualToString:appId]);
    if (debug) {
        XCTAssertTrue([profile.channelType isEqualToString:@"APNS_SANDBOX"]);
    } else {
        XCTAssertTrue([profile.channelType isEqualToString:@"APNS"]);
    }
    XCTAssertTrue([profile.optOut isEqualToString:@"ALL"]);
    XCTAssertNil(profile.address);
    XCTAssertTrue(profile.effectiveDate > 0);
    XCTAssertNotNil(profile.location);
    XCTAssertNotNil(profile.demographic);
    XCTAssertNotNil(profile.user);
    XCTAssertNotNil(profile.allAttributes);
    XCTAssertEqual([profile.allAttributes count], 0);
    XCTAssertNotNil(profile.allMetrics);
    XCTAssertEqual([profile.allMetrics count], 0);
    XCTAssertNotNil(profile.demographic.make);
    XCTAssertNotNil(profile.demographic.model);
    XCTAssertNotNil(profile.demographic.timezone);
    XCTAssertNotNil(profile.demographic.locale);
    XCTAssertNotNil(profile.demographic.appVersion);
    XCTAssertNotNil(profile.demographic.platform);
    XCTAssertNotNil(profile.demographic.platformVersion);
    
    NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]? [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]:@"Unknown";
    UIDevice *currentDevice = [UIDevice currentDevice];
    NSString *autoUpdatingLocaleIdentifier = [[NSLocale autoupdatingCurrentLocale] localeIdentifier];
    XCTAssertTrue([profile.demographic.make isEqualToString:@"apple"]);
    XCTAssertTrue([profile.demographic.model isEqualToString:[currentDevice model]]);
    XCTAssertTrue([profile.demographic.timezone isEqualToString:[[NSTimeZone systemTimeZone] name]]);
    XCTAssertTrue([profile.demographic.locale isEqualToString:autoUpdatingLocaleIdentifier]);

    //This will be same as main bundle's version
    XCTAssertTrue([profile.demographic.appVersion isEqualToString:appVersion]);
    XCTAssertTrue([profile.demographic.platform isEqualToString:[currentDevice systemName]]);
    XCTAssertTrue([profile.demographic.platformVersion isEqualToString:[currentDevice systemVersion]]);
}

- (void)testUpdateEndpointProfile {
    [[[self.pinpoint.targetingClient updateEndpointProfile] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
}

- (void)testUpdateEndpointProfileWithProfile {
    AWSPinpointEndpointProfile *endpointProfile = [self.pinpoint.targetingClient currentEndpointProfile];
    endpointProfile.user.userId = userId;
    [[[self.pinpoint.targetingClient updateEndpointProfile:endpointProfile] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    AWSPinpointEndpointProfile *profile = [self.pinpoint.targetingClient currentEndpointProfile];
    XCTAssertTrue([profile.user.userId isEqualToString:userId]);
    XCTAssertNotNil(profile.location);
    XCTAssertNotNil(profile.demographic);
    XCTAssertNotNil(profile.user);
    XCTAssertNotNil(profile.demographic.make);
    XCTAssertNotNil(profile.demographic.model);
    XCTAssertNotNil(profile.demographic.timezone);
    XCTAssertNotNil(profile.demographic.locale);
    XCTAssertNotNil(profile.demographic.appVersion);
    XCTAssertNotNil(profile.demographic.platform);
    XCTAssertNotNil(profile.demographic.platformVersion);
}

- (void) testGlobalAttribute {
    [[NSUserDefaults standardUserDefaults] removeSuiteNamed:@"AWSPinpointTargetingClientTests"];
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:@"testGlobalAttribute" launchOptions:nil];
    config.userDefaults = self.userDefaults;
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    
    [pinpoint.targetingClient addAttribute:@[@"GlobalAttr1"] forKey:@"GlobalAttr1"];
    
    AWSPinpointEndpointProfile *profile = [pinpoint.targetingClient currentEndpointProfile];

    XCTAssertNotNil(profile);
    XCTAssertNotNil(profile.endpointId);
    XCTAssertTrue([profile.applicationId isEqualToString:@"testGlobalAttribute"]);
    XCTAssertTrue([profile.channelType isEqualToString:@"APNS"]);
    XCTAssertTrue([profile.optOut isEqualToString:@"ALL"]);
    XCTAssertNil(profile.address);
    XCTAssertTrue(profile.effectiveDate > 0);
    XCTAssertNotNil(profile.location);
    XCTAssertNotNil(profile.demographic);
    XCTAssertNotNil(profile.user);
    XCTAssertNotNil(profile.allAttributes);
    XCTAssertEqual([profile.allAttributes count], 1);
    XCTAssertTrue([[[profile.allAttributes objectForKey:@"GlobalAttr1"] firstObject] isEqualToString:@"GlobalAttr1"]);
    XCTAssertNotNil(profile.allMetrics);
    XCTAssertEqual([profile.allMetrics count], 0);
    XCTAssertNotNil(profile.demographic.make);
    XCTAssertNotNil(profile.demographic.model);
    XCTAssertNotNil(profile.demographic.timezone);
    XCTAssertNotNil(profile.demographic.locale);
    XCTAssertNotNil(profile.demographic.appVersion);
    XCTAssertNotNil(profile.demographic.platform);
    XCTAssertNotNil(profile.demographic.platformVersion);
    
    UIDevice* currentDevice = [UIDevice currentDevice];
    NSString *autoUpdatingLocaleIdentifier = [[NSLocale autoupdatingCurrentLocale] localeIdentifier];
    XCTAssertTrue([profile.demographic.make isEqualToString:@"apple"]);
    XCTAssertTrue([profile.demographic.model isEqualToString:[currentDevice model]]);
    XCTAssertTrue([profile.demographic.timezone isEqualToString:[[NSTimeZone systemTimeZone] name]]);
    XCTAssertTrue([profile.demographic.locale isEqualToString:autoUpdatingLocaleIdentifier]);
    XCTAssertTrue([profile.demographic.platform isEqualToString:[currentDevice systemName]]);
    XCTAssertTrue([profile.demographic.platformVersion isEqualToString:[currentDevice systemVersion]]);
    
    [pinpoint.targetingClient removeAttributeForKey:@"GlobalAttr1"];
    profile = [pinpoint.targetingClient currentEndpointProfile];
    XCTAssertEqual([profile.allAttributes count], 0);
    XCTAssertEqual([profile.allMetrics count], 0);
}

- (void) testGlobalAttributeValidation {
    @try {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
        [self.pinpoint.targetingClient addAttribute:nil forKey:@"GlobalAttr1"];
#pragma clang diagnostic pop
        
        XCTFail(@"Expected an exception to be thrown. Insert nil parameter");
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, AWSPinpointTargetingClientErrorDomain);
    }
    
    @try {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
        [self.pinpoint.targetingClient addAttribute:@[@"GlobalAttr1"] forKey:nil];
#pragma clang diagnostic pop
        
        XCTFail(@"Expected an exception to be thrown. Insert nil parameter");
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, AWSPinpointTargetingClientErrorDomain);
    }
    
    @try {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
        [self.pinpoint.targetingClient addAttribute:nil forKey:nil];
#pragma clang diagnostic pop
        
        XCTFail(@"Expected an exception to be thrown. Insert nil parameter");
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, AWSPinpointTargetingClientErrorDomain);
    }
    
    @try {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
        [self.pinpoint.targetingClient addAttribute:@[@"TestKeyLength0"] forKey:@""];
#pragma clang diagnostic pop
        
        XCTFail(@"Expected an exception to be thrown. Insert nil parameter");
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, AWSPinpointTargetingClientErrorDomain);
    }
}


- (void) testGlobalMetric {
    [[NSUserDefaults standardUserDefaults] removeSuiteNamed:@"AWSPinpointTargetingClientTests"];
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:@"testGlobalMetric" launchOptions:nil];
    config.userDefaults = self.userDefaults;
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    
    [pinpoint.targetingClient addMetric:@(123) forKey:@"GlobalMetr1"];
    
    AWSPinpointEndpointProfile *profile = [pinpoint.targetingClient currentEndpointProfile];
    
    XCTAssertNotNil(profile);
    XCTAssertNotNil(profile.endpointId);
    XCTAssertTrue([profile.applicationId isEqualToString:@"testGlobalMetric"]);
    XCTAssertTrue([profile.channelType isEqualToString:@"APNS"]);
    XCTAssertTrue([profile.optOut isEqualToString:@"ALL"]);
    XCTAssertNil(profile.address);
    XCTAssertTrue(profile.effectiveDate > 0);
    XCTAssertNotNil(profile.location);
    XCTAssertNotNil(profile.demographic);
    XCTAssertNotNil(profile.user);
    XCTAssertNotNil(profile.allAttributes);
    XCTAssertEqual([profile.allAttributes count], 0);
    XCTAssertNotNil(profile.allMetrics);
    XCTAssertEqual([profile.allMetrics count], 1);
    XCTAssertEqual([[profile.allMetrics objectForKey:@"GlobalMetr1"] intValue], 123);
    XCTAssertNotNil(profile.demographic.make);
    XCTAssertNotNil(profile.demographic.model);
    XCTAssertNotNil(profile.demographic.timezone);
    XCTAssertNotNil(profile.demographic.locale);
    XCTAssertNotNil(profile.demographic.appVersion);
    XCTAssertNotNil(profile.demographic.platform);
    XCTAssertNotNil(profile.demographic.platformVersion);
    
    UIDevice* currentDevice = [UIDevice currentDevice];
    NSString *autoUpdatingLocaleIdentifier = [[NSLocale autoupdatingCurrentLocale] localeIdentifier];
    XCTAssertTrue([profile.demographic.make isEqualToString:@"apple"]);
    XCTAssertTrue([profile.demographic.model isEqualToString:[currentDevice model]]);
    XCTAssertTrue([profile.demographic.timezone isEqualToString:[[NSTimeZone systemTimeZone] name]]);
    XCTAssertTrue([profile.demographic.locale isEqualToString:autoUpdatingLocaleIdentifier]);
   // XCTAssertTrue([profile.demographic.appVersion isEqualToString:@"1.0"]);
    XCTAssertTrue([profile.demographic.platform isEqualToString:[currentDevice systemName]]);
    XCTAssertTrue([profile.demographic.platformVersion isEqualToString:[currentDevice systemVersion]]);
    
    [pinpoint.targetingClient removeMetricForKey:@"GlobalMetr1"];
    profile = [pinpoint.targetingClient currentEndpointProfile];
    XCTAssertEqual([profile.allAttributes count], 0);
    XCTAssertEqual([profile.allMetrics count], 0);
}

- (void) testGlobalMetricValidation {
    @try {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
        [self.pinpoint.targetingClient addMetric:nil forKey:@"GlobalMetr1"];
#pragma clang diagnostic pop
        
        XCTFail(@"Expected an exception to be thrown. Insert nil parameter");
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, AWSPinpointTargetingClientErrorDomain);
    }
    
    @try {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
        [self.pinpoint.targetingClient addMetric:@(1) forKey:nil];
#pragma clang diagnostic pop
        
        XCTFail(@"Expected an exception to be thrown. Insert nil parameter");
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, AWSPinpointTargetingClientErrorDomain);
    }
    
    @try {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
        [self.pinpoint.targetingClient addMetric:nil forKey:nil];
#pragma clang diagnostic pop
        
        XCTFail(@"Expected an exception to be thrown. Insert nil parameter");
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, AWSPinpointTargetingClientErrorDomain);
    }
    
    @try {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
        [self.pinpoint.targetingClient addMetric:@(1) forKey:@""];
#pragma clang diagnostic pop
        
        XCTFail(@"Expected an exception to be thrown. Insert nil parameter");
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, AWSPinpointTargetingClientErrorDomain);
    }
}

- (void) testGlobalAttributeAndMetric {
    NSString *appId = @"testGlobalAttributeAndMetric";
    [[NSUserDefaults standardUserDefaults] removeSuiteNamed:@"AWSPinpointTargetingClientTests"];
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:appId launchOptions:nil];
    config.userDefaults = self.userDefaults;
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    
    [pinpoint.targetingClient addAttribute:@[@"GlobalAttr1"] forKey:@"GlobalAttr1"];
    [pinpoint.targetingClient addMetric:@(123) forKey:@"GlobalMetr1"];
    
    AWSPinpointEndpointProfile *profile = [pinpoint.targetingClient currentEndpointProfile];
    
    XCTAssertNotNil(profile);
    XCTAssertNotNil(profile.endpointId);
    XCTAssertTrue([profile.applicationId isEqualToString:appId]);
    XCTAssertTrue([profile.channelType isEqualToString:@"APNS"]);
    XCTAssertTrue([profile.optOut isEqualToString:@"ALL"]);
    XCTAssertNil(profile.address);
    XCTAssertTrue(profile.effectiveDate > 0);
    XCTAssertNotNil(profile.location);
    XCTAssertNotNil(profile.demographic);
    XCTAssertNotNil(profile.user);
    XCTAssertNotNil(profile.allAttributes);
    XCTAssertEqual([profile.allAttributes count], 1);
    XCTAssertTrue([[[profile.allAttributes objectForKey:@"GlobalAttr1"] firstObject] isEqualToString:@"GlobalAttr1"]);
    XCTAssertNotNil(profile.allMetrics);
    XCTAssertEqual([profile.allMetrics count], 1);
    XCTAssertEqual([[profile.allMetrics objectForKey:@"GlobalMetr1"] intValue], 123);
    XCTAssertNotNil(profile.demographic.make);
    XCTAssertNotNil(profile.demographic.model);
    XCTAssertNotNil(profile.demographic.timezone);
    XCTAssertNotNil(profile.demographic.locale);
    XCTAssertNotNil(profile.demographic.appVersion);
    XCTAssertNotNil(profile.demographic.platform);
    XCTAssertNotNil(profile.demographic.platformVersion);
    
    UIDevice* currentDevice = [UIDevice currentDevice];
    NSString *autoUpdatingLocaleIdentifier = [[NSLocale autoupdatingCurrentLocale] localeIdentifier];
    XCTAssertTrue([profile.demographic.make isEqualToString:@"apple"]);
    XCTAssertTrue([profile.demographic.model isEqualToString:[currentDevice model]]);
    XCTAssertTrue([profile.demographic.timezone isEqualToString:[[NSTimeZone systemTimeZone] name]]);
    XCTAssertTrue([profile.demographic.locale isEqualToString:autoUpdatingLocaleIdentifier]);
    //XCTAssertTrue([profile.demographic.appVersion isEqualToString:@"1.0"]);
    XCTAssertTrue([profile.demographic.platform isEqualToString:[currentDevice systemName]]);
    XCTAssertTrue([profile.demographic.platformVersion isEqualToString:[currentDevice systemVersion]]);
    
    [pinpoint.targetingClient removeAttributeForKey:@"GlobalAttr1"];
    [pinpoint.targetingClient removeMetricForKey:@"GlobalMetr1"];
    profile = [pinpoint.targetingClient currentEndpointProfile];
    XCTAssertEqual([profile.allAttributes count], 0);
    XCTAssertEqual([profile.allMetrics count], 0);
}

@end
