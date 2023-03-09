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
NSString *const AWSPinpointTargetingClientTestsName = @"AWSPinpointTargetingClientTests";
NSString *const AWSPinpointEndpointAttributesKey = @"AWSPinpointEndpointAttributesKey";
NSString *const AWSPinpointEndpointMetricsKey = @"AWSPinpointEndpointMetricsKey";
NSString *const AWSPinpointEndpointProfileKey = @"AWSPinpointEndpointProfileKey";
NSString *const AWSDeviceToken = @"com.amazonaws.AWSDeviceTokenKey";
NSString *const AWSPinpointOverrideDefaultOptOutKey = @"com.amazonaws.AWSPinpointOverrideDefaultOptOutKey";
static NSString *userId;

@interface AWSPinpointTargetingClientTests : XCTestCase
@property (nonatomic, strong) AWSPinpoint *pinpoint;
@property (nonatomic, strong) AWSPinpointConfiguration *configuration;
@property (nonatomic, strong) UIApplication *application;
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@property (nonatomic, strong) AWSUICKeyChainStore *keychain;

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

    [AWSTestUtility setupSessionCredentialsProvider];
    [[NSUserDefaults standardUserDefaults] removeSuiteNamed:AWSPinpointTargetingClientTestsName];
    self.userDefaults = [[NSUserDefaults alloc] initWithSuiteName:AWSPinpointTargetingClientTestsName];
    [self.userDefaults removeObjectForKey:AWSPinpointEndpointAttributesKey];
    [self.userDefaults removeObjectForKey:AWSPinpointEndpointMetricsKey];
    [self.userDefaults removeObjectForKey:AWSDeviceTokenKey];
    [self.userDefaults removeObjectForKey:AWSPinpointOverrideDefaultOptOutKey];
    [self.userDefaults synchronize];
    
    self.keychain = [AWSUICKeyChainStore keyChainStoreWithService:AWSPinpointContextKeychainService];
    [self.keychain removeAllItems];
    
}

- (void)tearDown {
    [super tearDown];
}

- (AWSPinpointConfiguration *)getDefaultAWSPinpointConfiguration {
    NSString *pinpointAppId = [AWSTestUtility getIntegrationTestConfigurationValueForPackageId:@"pinpoint"
                                                                                     configKey:@"app_id"];
    return [[AWSPinpointConfiguration alloc] initWithAppId:pinpointAppId launchOptions:@{}];
}

- (AWSPinpointConfiguration *)getAWSPinpointConfigurationWithOptOut:(BOOL)optOut {
    AWSPinpointConfiguration *configuration = [self getDefaultAWSPinpointConfiguration];

    configuration.isApplicationLevelOptOut = ^BOOL{
        return optOut;
    };

    return configuration;
}

- (void)setDeviceTokenInKeychain {
    const unsigned char currentTokenBytes[] = {
        0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
        0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f
    };
    NSData *currentTokenData = [[NSData alloc] initWithBytes:currentTokenBytes length:16];
    [self.keychain setData:currentTokenData forKey:AWSDeviceTokenKey];
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

- (void)initializeMockApplicationWithRemoteNotifications:(BOOL)withRemoteNotifications {
    id mockApplication = OCMClassMock([UIApplication class]);

    OCMStub([mockApplication sharedApplication]).andReturn(mockApplication);

    UIUserNotificationType notificationType = withRemoteNotifications ? UIUserNotificationTypeAlert : UIUserNotificationTypeNone;
    UIUserNotificationSettings *notificationSettings = [UIUserNotificationSettings settingsForTypes:notificationType categories:nil];
    OCMStub([mockApplication currentUserNotificationSettings]).andReturn(notificationSettings);
    OCMStub([mockApplication isRegisteredForRemoteNotifications]).andReturn(withRemoteNotifications);
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
    [self initializePinpointWithConfiguration:[self getDefaultAWSPinpointConfiguration] forceCreate:NO];
    NSString *dummyAppId = @"dummyAppId";
    AWSPinpointEndpointProfile *endpointProfile = [self.pinpoint.targetingClient currentEndpointProfile];
    endpointProfile.user.userId = userId;
    [[[self.pinpoint.targetingClient updateEndpointProfile:endpointProfile] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        //XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    XCTAssertNil([self.pinpoint.configuration.userDefaults objectForKey:AWSPinpointEndpointProfileKey]);
    XCTAssertNotNil([self.keychain dataForKey:AWSPinpointEndpointProfileKey]);
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
    [self.keychain setData:currentTokenData forKey:AWSDeviceTokenKey];
    
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
    
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    AWSPinpointEndpointProfile *endpointProfile = [pinpoint.targetingClient currentEndpointProfile];
    XCTAssertEqualObjects(endpointProfile.address, currentTokenString);

    [self.keychain setData:newTokenData forKey:AWSDeviceTokenKey];
    endpointProfile = [pinpoint.targetingClient currentEndpointProfile];
    XCTAssertEqualObjects(endpointProfile.address, newTokenString);
}

- (void)testCurrentProfileWithCompletion {
    [self initializePinpointWithConfiguration:[self getAWSPinpointConfigurationWithOptOut:NO] forceCreate:YES];
    [self.pinpoint.targetingClient currentEndpointProfileWithCompletion:^(AWSPinpointEndpointProfile * _Nonnull profile) {
        XCTAssertTrue([profile.optOut isEqualToString:@"ALL"]);
    }];
}

- (void)testCurrentProfileWithCompletionOnMultipleThreads {
    [self initializePinpointWithConfiguration:[self getAWSPinpointConfigurationWithOptOut:NO] forceCreate:YES];
    void (^validationBlock)(void) = ^(void) {
        [self.pinpoint.targetingClient currentEndpointProfileWithCompletion:^(AWSPinpointEndpointProfile * _Nonnull profile) {
            XCTAssertTrue([profile.optOut isEqualToString:@"ALL"]);
        }];
    };

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        validationBlock();
    });

    dispatch_async(dispatch_get_main_queue(), ^{
        validationBlock();
    });

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        validationBlock();
    });

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        validationBlock();
    });
}

- (void)testCurrentProfileReturnsOptOutAll {
    [self initializePinpointWithConfiguration:[self getAWSPinpointConfigurationWithOptOut:NO] forceCreate:YES];
    AWSPinpointEndpointProfile *profile = [self.pinpoint.targetingClient currentEndpointProfile];
    XCTAssertTrue([profile.optOut isEqualToString:@"ALL"]);
}

- (void)testCurrentProfileReturnsOptOutAllWhenNotificationsEnabledAndDeviceTokenNotSet {
    [self initializePinpointWithConfiguration:[self getAWSPinpointConfigurationWithOptOut:NO] forceCreate:YES];
    [self initializeMockApplicationWithRemoteNotifications:YES];

    AWSPinpointEndpointProfile *profile = [self.pinpoint.targetingClient currentEndpointProfile];
    XCTAssertTrue([profile.optOut isEqualToString:@"ALL"]);
}

- (void)testCurrentProfileReturnsOptOutAllWhenNotificationsEnabledAndDeviceTokenNotSetAndOverrideIsSetToNone {
    [self initializePinpointWithConfiguration:[self getAWSPinpointConfigurationWithOptOut:NO] forceCreate:YES];
    [self initializeMockApplicationWithRemoteNotifications:YES];
    self.pinpoint.targetingClient.currentEndpointProfile.optOut = @"NONE";

    AWSPinpointEndpointProfile *profile = [self.pinpoint.targetingClient currentEndpointProfile];
    XCTAssertTrue([profile.optOut isEqualToString:@"ALL"]);
}

- (void)testCurrentProfileReturnsOptOutAllWhenNotificationsDisabledAndDeviceTokenSet {
    [self initializePinpointWithConfiguration:[self getAWSPinpointConfigurationWithOptOut:NO] forceCreate:YES];
    [self initializeMockApplicationWithRemoteNotifications:NO];
    [self setDeviceTokenInKeychain];
    
    AWSPinpointEndpointProfile *profile = [self.pinpoint.targetingClient currentEndpointProfile];
    XCTAssertTrue([profile.optOut isEqualToString:@"ALL"]);
}

- (void)testCurrentProfileReturnsOptOutAllWhenNotificationsDisabledAndDeviceTokenSetAndOverrideIsSetToNone {
    [self initializePinpointWithConfiguration:[self getAWSPinpointConfigurationWithOptOut:NO] forceCreate:YES];
    [self initializeMockApplicationWithRemoteNotifications:NO];
    [self setDeviceTokenInKeychain];
    self.pinpoint.targetingClient.currentEndpointProfile.optOut = @"NONE";

    AWSPinpointEndpointProfile *profile = [self.pinpoint.targetingClient currentEndpointProfile];
    XCTAssertTrue([profile.optOut isEqualToString:@"ALL"]);
}

- (void)testCurrentProfileReturnsOptOutNoneWhenNotificationsEnabledAndDeviceTokenSet {
    [self initializePinpointWithConfiguration:[self getAWSPinpointConfigurationWithOptOut:NO] forceCreate:YES];
    [self initializeMockApplicationWithRemoteNotifications:YES];
    [self setDeviceTokenInKeychain];

    AWSPinpointEndpointProfile *profile = [self.pinpoint.targetingClient currentEndpointProfile];
    XCTAssertTrue([profile.optOut isEqualToString:@"NONE"]);
}

- (void)testCurrentProfileReturnsOverrideDefaultOptOutWhenOptOutSetWithNotificationsAndDeviceTokenSet {
    [self initializePinpointWithConfiguration:[self getAWSPinpointConfigurationWithOptOut:NO] forceCreate:YES];
    [self initializeMockApplicationWithRemoteNotifications:YES];
    [self setDeviceTokenInKeychain];

    AWSPinpointEndpointProfile *profile = [self.pinpoint.targetingClient currentEndpointProfile];
    XCTAssertTrue([profile.optOut isEqualToString:@"NONE"]);

    self.pinpoint.targetingClient.currentEndpointProfile.optOut = @"ALL";
    AWSPinpointEndpointProfile *profileWithOptOutAll = [self.pinpoint.targetingClient currentEndpointProfile];
    XCTAssertTrue([profileWithOptOutAll.optOut isEqualToString:@"ALL"]);

    self.pinpoint.targetingClient.currentEndpointProfile.optOut = @"NONE";
    AWSPinpointEndpointProfile *profileWithOptOutNone = [self.pinpoint.targetingClient currentEndpointProfile];
    XCTAssertTrue([profileWithOptOutNone.optOut isEqualToString:@"NONE"]);
}

- (void)testCurrentProfileReturnsOptOutAllForApplicationLevelOptOut {
    [self initializePinpointWithConfiguration:[self getAWSPinpointConfigurationWithOptOut:YES] forceCreate:YES];
    [self initializeMockApplicationWithRemoteNotifications:YES];
    [self setDeviceTokenInKeychain];

    AWSPinpointEndpointProfile *profile = [self.pinpoint.targetingClient currentEndpointProfile];
    XCTAssertTrue([profile.optOut isEqualToString:@"ALL"]);
}

- (void) testCurrentProfileReturnsOptOutNoneWithNotificationsEnabledAndDeviceTokenSetOnBackgroundThread {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) , ^{
        [self initializePinpointWithConfiguration:[self getAWSPinpointConfigurationWithOptOut:NO] forceCreate:YES];
        [self initializeMockApplicationWithRemoteNotifications:YES];
        [self setDeviceTokenInKeychain];

        AWSPinpointEndpointProfile *profile = [self.pinpoint.targetingClient currentEndpointProfile];
        XCTAssertTrue([profile.optOut isEqualToString:@"NONE"]);
        [expectation fulfill];
        expectation = nil;
    });
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void) testCurrentProfileReturnsOptOutAllWithNotificationsEnabledAndDeviceTokenNotSetOnBackgroundThread {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) , ^{
        [self initializePinpointWithConfiguration:[self getAWSPinpointConfigurationWithOptOut:NO] forceCreate:YES];
        [self initializeMockApplicationWithRemoteNotifications:YES];

        AWSPinpointEndpointProfile *profile = [self.pinpoint.targetingClient currentEndpointProfile];
        XCTAssertTrue([profile.optOut isEqualToString:@"ALL"]);
        [expectation fulfill];
        expectation = nil;
    });

    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
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
    [self initializePinpointWithConfiguration:[self getDefaultAWSPinpointConfiguration] forceCreate:NO];
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
    [self initializePinpointWithConfiguration:[self getDefaultAWSPinpointConfiguration] forceCreate:NO];
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
    [self initializePinpointWithConfiguration:[self getDefaultAWSPinpointConfiguration] forceCreate:NO];
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

- (void)testMigrateDeviceTokenUpdate {
    const unsigned char currentTokenBytes[] = {
        0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
        0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f
    };
    NSData *currentTokenData = [[NSData alloc] initWithBytes:currentTokenBytes length:16];
    NSString *currentTokenString = @"000102030405060708090a0b0c0d0e0f";
    [self.userDefaults setObject:currentTokenData forKey:AWSDeviceTokenKey];
    [self.userDefaults synchronize];
    
    NSString *appId = @"testMigrateDeviceTokenStringUpdate";
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:appId
                                                                         launchOptions:nil];
    config.enableAutoSessionRecording = NO;
    config.userDefaults = self.userDefaults;
    
    XCTAssertNil([self.keychain dataForKey:AWSDeviceTokenKey]);
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    AWSPinpointEndpointProfile *endpointProfile = [pinpoint.targetingClient currentEndpointProfile];
    XCTAssertEqualObjects(endpointProfile.address, currentTokenString);
    XCTAssertNil([self.userDefaults objectForKey:AWSDeviceTokenKey]);
    XCTAssertNotNil([self.keychain dataForKey:AWSDeviceTokenKey]);
}

- (void)testMigrateGlobalAttributes {
    NSMutableDictionary *globalAttributes = [NSMutableDictionary new];
    [globalAttributes setValue:@[@"GlobalAttr1"] forKey:@"GlobalAttr1"];
    [self.userDefaults setObject:globalAttributes forKey:AWSPinpointEndpointAttributesKey];
    
    NSString *appId = @"testMigrateGlobalAttributes";
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:appId
                                                                         launchOptions:nil];
    config.enableAutoSessionRecording = NO;
    config.userDefaults = self.userDefaults;
    
    XCTAssertNotNil([self.userDefaults objectForKey:AWSPinpointEndpointAttributesKey]);
    XCTAssertNil([self.keychain dataForKey:AWSPinpointEndpointAttributesKey]);
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    AWSPinpointEndpointProfile *endpointProfile = [pinpoint.targetingClient currentEndpointProfile];
    XCTAssertEqual([endpointProfile.allAttributes  count], 1);
    XCTAssertTrue([[[endpointProfile.allAttributes objectForKey:@"GlobalAttr1"] firstObject] isEqualToString:@"GlobalAttr1"]);
    XCTAssertNil([self.userDefaults objectForKey:AWSPinpointEndpointAttributesKey]);
    XCTAssertNotNil([self.keychain dataForKey:AWSPinpointEndpointAttributesKey]);
}

- (void)testMigrateGlobalMetrics {
    NSMutableDictionary *globalMetrics= [NSMutableDictionary new];
    [globalMetrics setValue:@(123) forKey:@"GlobalMtr1"];

    [self.userDefaults setObject:globalMetrics forKey:AWSPinpointEndpointMetricsKey];
    
    NSString *appId = @"testMigrateGlobalMetrics";
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:appId
                                                                         launchOptions:nil];
    config.enableAutoSessionRecording = NO;
    config.userDefaults = self.userDefaults;
    
    XCTAssertNotNil([self.userDefaults objectForKey:AWSPinpointEndpointMetricsKey]);
    XCTAssertNil([self.keychain dataForKey:AWSPinpointEndpointMetricsKey]);
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    AWSPinpointEndpointProfile *endpointProfile = [pinpoint.targetingClient currentEndpointProfile];
    XCTAssertEqual([endpointProfile.allMetrics count], 1);
    XCTAssertEqual([[endpointProfile.allMetrics objectForKey:@"GlobalMtr1"] intValue], 123);
    XCTAssertNil([self.userDefaults objectForKey:AWSPinpointEndpointMetricsKey]);
    XCTAssertNotNil([self.keychain dataForKey:AWSPinpointEndpointMetricsKey]);
}

- (void)testMigrateEndpointProfile {
    NSString *appId = @"testMigrateEndpointProfile";
    AWSPinpointEndpointProfile *profile = [[AWSPinpointEndpointProfile alloc] initWithApplicationId:appId endpointId:@"abc123"];
    NSError *error = nil;
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:profile requiringSecureCoding:YES error:&error];
    [self.userDefaults setObject:data forKey:AWSPinpointEndpointProfileKey];
    XCTAssertNil(error);
    XCTAssertNil([self.keychain dataForKey:AWSPinpointEndpointProfileKey]);
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:appId
                                                                         launchOptions:nil];
    config.enableAutoSessionRecording = NO;
    config.userDefaults = self.userDefaults;
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    AWSPinpointEndpointProfile *endpointProfile = [pinpoint.targetingClient currentEndpointProfile];
    XCTAssertEqualObjects(endpointProfile.applicationId, appId);
    XCTAssertNil([self.userDefaults objectForKey:AWSPinpointEndpointProfileKey]);
    XCTAssertNotNil([self.keychain dataForKey:AWSPinpointEndpointProfileKey]);
}

@end
