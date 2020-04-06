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
#import "AWSPinpointContext.h"
#import "AWSPinpoint.h"
#import "AWSUICKeyChainStore.h"

static NSString *const AWSPinpointContextKeychainService = @"com.amazonaws.AWSPinpointContext";
static NSString *const AWSPinpointContextKeychainUniqueIdKey = @"com.amazonaws.AWSPinpointContextKeychainUniqueIdKey";
static NSString *const AWSMobileAnalyticsRoot = @"com.amazonaws.MobileAnalytics";

@interface AWSPinpointContext()
@property (nonatomic, strong) AWSUICKeyChainStore *keychain;
@property (nonatomic, strong) NSString* uniqueId;
- (NSString *) retrieveUniqueId;
@end

@interface AWSPinpointContextTests : XCTestCase
@property (nonatomic, strong) AWSPinpointConfiguration *configuration;
@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end

@interface AWSPinpointConfiguration()
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@end

@implementation AWSPinpointContextTests

- (void)setUp {
    [super setUp];
    [[NSUserDefaults standardUserDefaults] removeSuiteNamed:@"AWSPinpointContextTests"];
    self.userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"AWSPinpointContextTests"];

    self.configuration = [[AWSPinpointConfiguration alloc] initWithAppId:@"AWSPinpointContextTests" launchOptions:nil];
    self.configuration.userDefaults = self.userDefaults;
    AWSUICKeyChainStore *keychain = [AWSUICKeyChainStore keyChainStoreWithService:AWSPinpointContextKeychainService];
    [keychain removeAllItems];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testConstructor {
    AWSPinpointContext *context = [AWSPinpointContext contextWithConfiguration:self.configuration];
    
    XCTAssertNotNil(context);
    XCTAssertNotNil(context.clientContext);
    XCTAssertNotNil(context.configuration.userDefaults);
    XCTAssertNotNil(context.uniqueId);
    XCTAssertNotNil(context.configuration);
    XCTAssertEqual(context.configuration, self.configuration);
    XCTAssertNil(context.analyticsService);
    XCTAssertNil(context.targetingService);
    XCTAssertTrue([context.configuration.userDefaults isEqual:self.userDefaults]);
    XCTAssertTrue([[context retrieveUniqueId] isEqualToString:context.uniqueId]);
}

- (void)testUniqueIdGeneration {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];

    AWSPinpointContext *context = [AWSPinpointContext contextWithConfiguration:self.configuration];
    XCTAssertNotNil(context);
    XCTAssertNotNil(context.clientContext);
    XCTAssertNotNil(context.uniqueId);
    XCTAssertNotNil(context.configuration);
    XCTAssertEqual(context.configuration, self.configuration);
    XCTAssertNil(context.analyticsService);
    XCTAssertNil(context.targetingService);

    //UniqueId should Match
    XCTAssertTrue([[context retrieveUniqueId] isEqualToString:context.uniqueId]);
    
    AWSPinpointContext *secondContext = [AWSPinpointContext contextWithConfiguration:self.configuration];
    XCTAssertNotNil(secondContext);
    XCTAssertNotNil(secondContext.clientContext);
    XCTAssertNotNil(secondContext.uniqueId);
    XCTAssertNotNil(secondContext.configuration);
    XCTAssertEqual(secondContext.configuration, self.configuration);
    XCTAssertNil(secondContext.analyticsService);
    XCTAssertNil(secondContext.targetingService);
    //UniqueId should Match
    XCTAssertTrue([secondContext.uniqueId isEqualToString:context.uniqueId]);
    
    //New context should have new Id with new default suite
    self.configuration.userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"testUniqueIdGeneration"];
    AWSPinpointContext *thirdContext = [AWSPinpointContext contextWithConfiguration:self.configuration];
    XCTAssertNotNil(thirdContext);
    XCTAssertNotNil(thirdContext.clientContext);
    XCTAssertNotNil(thirdContext.uniqueId);
    XCTAssertNotNil(thirdContext.configuration);
    XCTAssertEqual(thirdContext.configuration, self.configuration);
    XCTAssertNil(thirdContext.analyticsService);
    XCTAssertNil(thirdContext.targetingService);
    XCTAssertFalse([thirdContext.uniqueId isEqualToString:context.uniqueId]);
        [expectation fulfill];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void)testUniqueIdLegacyMerge {
    //Clear Keychain
    AWSUICKeyChainStore *keychain = [AWSUICKeyChainStore keyChainStoreWithService:AWSPinpointContextKeychainService];
    [keychain removeAllItems];
    
    //Create file with uniqueId
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    NSString *applicationSupportDirectory = [paths firstObject];
    NSString *appDirPath = [AWSMobileAnalyticsRoot stringByAppendingPathComponent:self.configuration.appId];
    NSString *preferencesPath = [[applicationSupportDirectory stringByAppendingPathComponent:appDirPath] stringByAppendingPathComponent:@"preferences"];
    
    XCTAssertTrue([[NSFileManager defaultManager] createDirectoryAtPath:[applicationSupportDirectory stringByAppendingPathComponent:appDirPath]
                              withIntermediateDirectories:YES attributes:nil error:nil]);
    XCTAssertTrue([[NSFileManager defaultManager] createFileAtPath:preferencesPath contents:nil attributes:nil]);

    
    NSString *uniqueId = [[NSUUID UUID] UUIDString];
    NSDictionary *uniqueIdContents = @{@"UniqueId": uniqueId};
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:uniqueIdContents
                                                      options:0
                                                        error:nil];
    
    XCTAssertTrue([[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding] writeToFile:preferencesPath atomically:YES encoding:NSUTF8StringEncoding error:nil]);
    
    //Check file is there
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:preferencesPath]);
    
    AWSPinpointContext *context = [AWSPinpointContext contextWithConfiguration:self.configuration];
    XCTAssertNotNil(context);
    XCTAssertNotNil(context.clientContext);
    XCTAssertNotNil(context.uniqueId);
    XCTAssertTrue([context.uniqueId isEqualToString:uniqueId]);
    XCTAssertNotNil(context.configuration);
    XCTAssertEqual(context.configuration, self.configuration);
    XCTAssertNil(context.analyticsService);
    XCTAssertNil(context.targetingService);
    
    //UniqueId should Match
    XCTAssertTrue([[context retrieveUniqueId] isEqualToString:context.uniqueId]);
    
    //Check if saved to keychain successfully
    if ([keychain stringForKey:AWSPinpointContextKeychainUniqueIdKey]) {
        XCTAssertTrue([[keychain stringForKey:AWSPinpointContextKeychainUniqueIdKey] isEqualToString:context.uniqueId]);
    } else { //Check user defaults
        XCTAssertTrue([[self.userDefaults stringForKey:AWSPinpointContextKeychainUniqueIdKey] isEqualToString:context.uniqueId]);
    }
    
    //Check if file got deleted
    XCTAssertFalse([[NSFileManager defaultManager] fileExistsAtPath:preferencesPath]);
}

- (void)testUniqueIdFallbackKeychainFail {
    //Clear Keychain
    AWSUICKeyChainStore *keychain = [AWSUICKeyChainStore keyChainStoreWithService:AWSPinpointContextKeychainService];
    [keychain removeAllItems];
    
    AWSPinpointContext *context = [AWSPinpointContext contextWithConfiguration:self.configuration];
    [keychain removeAllItems]; //Remove key created

    context.keychain = nil; //Set to ni so saving to keychain fails
    context.uniqueId = [context retrieveUniqueId]; //Will now try to use NSUserDefaults
    
    XCTAssertNotNil(context);
    XCTAssertNotNil(context.clientContext);
    XCTAssertNotNil(context.uniqueId);
    XCTAssertNotNil(context.configuration);
    XCTAssertEqual(context.configuration, self.configuration);
    XCTAssertNil(context.analyticsService);
    XCTAssertNil(context.targetingService);
    XCTAssertTrue([context.uniqueId isEqualToString:[self.userDefaults stringForKey:AWSPinpointContextKeychainUniqueIdKey]]);
}

@end
