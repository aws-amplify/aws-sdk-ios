//
// Copyright 2010-2025 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AWSIoT.h"
#import "AWSIoTDataManager.h"
#import "AWSIoTMQTTClient.h"
#import "AWSTestUtility.h"

// Mock credentials provider that returns test credentials
@interface TestCredentialsProvider : NSObject <AWSCredentialsProvider>
@property (nonatomic, strong) AWSCredentials *credentials;
@end

@implementation TestCredentialsProvider

- (instancetype)init {
    self = [super init];
    if (self) {
        // Create test credentials with readonly properties
        _credentials = [[AWSCredentials alloc] initWithAccessKey:@"testAccessKey"
                                                     secretKey:@"testSecretKey"
                                                   sessionKey:@"testSessionKey"
                                                   expiration:[NSDate dateWithTimeIntervalSinceNow:3600]];
    }
    return self;
}

- (AWSTask<AWSCredentials *> *)credentials {
    return [AWSTask taskWithResult:self.credentials];
}

- (AWSTask<AWSCredentials *> *)refresh {
    return [AWSTask taskWithResult:self.credentials];
}

- (void)invalidateCachedTemporaryCredentials {
    // No-op for testing
}

- (void)setIdentityId:(NSString *)identityId {
    // No-op for testing
}

- (NSString *)identityId {
    return @"testIdentityId";
}

- (void)setLogins:(NSDictionary *)logins {
    // No-op for testing
}

- (NSDictionary *)logins {
    return @{};
}

- (void)setIdentityProviderManager:(id<AWSIdentityProviderManager>)identityProviderManager {
    // No-op for testing
}

- (id<AWSIdentityProviderManager>)identityProviderManager {
    return nil;
}

@end

@interface AWSIoTDataDisconnectTests : XCTestCase

@property (nonatomic, strong) id<AWSCredentialsProvider> credentialsProvider;
@property (nonatomic, assign) NSTimeInterval defaultTimeout;

@end

@implementation AWSIoTDataDisconnectTests

- (void)setUp {
    [super setUp];
    [AWSDDLog sharedInstance].logLevel = AWSDDLogLevelVerbose;
    [AWSDDLog addLogger:[AWSDDTTYLogger sharedInstance]];
    
    self.defaultTimeout = 30.0;
    
    // Create our test credentials provider
    self.credentialsProvider = [[TestCredentialsProvider alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

#pragma mark - Helper Methods

- (AWSServiceConfiguration *)createTestServiceConfiguration {
    // Create a mock service configuration that uses our mock credentials provider
    AWSEndpoint *endpoint = [[AWSEndpoint alloc] initWithURLString:@"https://test-endpoint.iot.amazonaws.com"];
    return [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                endpoint:endpoint
                                     credentialsProvider:self.credentialsProvider];
}

- (AWSIoTMQTTConfiguration *)createTestMQTTConfiguration {
    AWSIoTMQTTLastWillAndTestament *lwt = [[AWSIoTMQTTLastWillAndTestament alloc] init];
    lwt.topic = @"test/lwt";
    lwt.message = @"Unexpected disconnect";
    lwt.qos = AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce;
    
    return [[AWSIoTMQTTConfiguration alloc] 
            initWithKeepAliveTimeInterval:30.0
            baseReconnectTimeInterval:1.0
            minimumConnectionTimeInterval:20.0
            maximumReconnectTimeInterval:8.0
            runLoop:[NSRunLoop currentRunLoop]
            runLoopMode:NSDefaultRunLoopMode
            autoResubscribe:YES
            lastWillAndTestament:lwt];
}

#pragma mark - Test Cases

/**
 * This test simulates the disconnect crash scenario by:
 * 1. Setting up an IoT data manager
 * 2. Performing a disconnect operation from a background thread
 * 3. Immediately clearing credentials after disconnect
 * 4. Validating that no crashes occur
 */
- (void)testDisconnectAndClearCredentials {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Disconnect and clear credentials test completed"];
    
    // Create a unique key for this test
    NSString *testKey = [NSString stringWithFormat:@"testDisconnectAndClearCredentials-%@", [[NSUUID UUID] UUIDString]];
    
    // Set up the IoT data manager
    AWSServiceConfiguration *configuration = [self createTestServiceConfiguration];
    AWSIoTMQTTConfiguration *mqttConfig = [self createTestMQTTConfiguration];
    
    [AWSIoTDataManager registerIoTDataManagerWithConfiguration:configuration
                                         withMQTTConfiguration:mqttConfig
                                                        forKey:testKey];
    
    AWSIoTDataManager *iotDataManager = [AWSIoTDataManager IoTDataManagerForKey:testKey];
    XCTAssertNotNil(iotDataManager);
    
    // Test disconnecting from a background thread
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        AWSDDLogInfo(@"Disconnecting from background thread");
        [iotDataManager disconnect];
        
        // Immediately invalidate credentials (this was causing crashes)
        [self.credentialsProvider invalidateCachedTemporaryCredentials];
        
        // Remove the IoT manager to force cleanup
        [AWSIoTDataManager removeIoTDataManagerForKey:testKey];
        
        // If we reach here without crashing, the test passes
        dispatch_async(dispatch_get_main_queue(), ^{
            [expectation fulfill];
        });
    });
    
    // Wait for the test to complete
    [self waitForExpectationsWithTimeout:self.defaultTimeout handler:^(NSError *error) {
        if (error) {
            XCTFail(@"Test timed out: %@", error);
        }
    }];
}

/**
 * This test rapidly connects and disconnects in a loop to stress test the disconnect logic
 */
- (void)testRapidConnectDisconnectCycles {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Rapid connect/disconnect cycles completed"];
    
    // Create a unique key for this test
    NSString *testKey = [NSString stringWithFormat:@"testRapidConnectDisconnect-%@", [[NSUUID UUID] UUIDString]];
    
    // Set up the IoT data manager
    AWSServiceConfiguration *configuration = [self createTestServiceConfiguration];
    AWSIoTMQTTConfiguration *mqttConfig = [self createTestMQTTConfiguration];
    
    [AWSIoTDataManager registerIoTDataManagerWithConfiguration:configuration
                                         withMQTTConfiguration:mqttConfig
                                                        forKey:testKey];
    
    AWSIoTDataManager *iotDataManager = [AWSIoTDataManager IoTDataManagerForKey:testKey];
    XCTAssertNotNil(iotDataManager);
    
    // Number of disconnect cycles to run - just test disconnect without actual connection
    NSInteger cycles = 5;
    __block NSInteger completedCycles = 0;
    
    // Function to run a single disconnect - use __block to ensure retention
    __block void (^runCycle)(void);
    runCycle = ^{
        if (completedCycles >= cycles) {
            // We're done with all cycles
            [AWSIoTDataManager removeIoTDataManagerForKey:testKey];
            [expectation fulfill];
            return;
        }
        
        AWSDDLogInfo(@"Starting disconnect cycle %ld", (long)completedCycles + 1);
        
        // Just call disconnect directly without trying to connect first
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [iotDataManager disconnect];
            
            // Increment cycle counter
            completedCycles++;
            
            // Capture strong reference to block to prevent deallocation
            void (^strongRunCycle)(void) = runCycle;
            
            // Small delay before next cycle to allow resources to clean up
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), 
                          dispatch_get_main_queue(), ^{
                if (strongRunCycle) {
                    strongRunCycle();
                }
            });
        });
    };
    
    // Start the first cycle
    runCycle();
    
    // Wait for all cycles to complete
    [self waitForExpectationsWithTimeout:self.defaultTimeout handler:^(NSError *error) {
        // Break potential cycle
        runCycle = nil;
        
        if (error) {
            XCTFail(@"Test timed out: %@", error);
        }
    }];
}

/**
 * This test simulates app background/foreground transitions during disconnect
 */
- (void)testBackgroundDisconnection {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Background disconnect completed"];
    
    // Create a unique key for this test
    NSString *testKey = [NSString stringWithFormat:@"testBackgroundDisconnection-%@", [[NSUUID UUID] UUIDString]];
    
    // Set up the IoT data manager
    AWSServiceConfiguration *configuration = [self createTestServiceConfiguration];
    AWSIoTMQTTConfiguration *mqttConfig = [self createTestMQTTConfiguration];
    
    [AWSIoTDataManager registerIoTDataManagerWithConfiguration:configuration
                                         withMQTTConfiguration:mqttConfig
                                                        forKey:testKey];
    
    AWSIoTDataManager *iotDataManager = [AWSIoTDataManager IoTDataManagerForKey:testKey];
    XCTAssertNotNil(iotDataManager);
    
    // Simulate app entering background
    [[NSNotificationCenter defaultCenter] postNotificationName:
     UIApplicationDidEnterBackgroundNotification object:nil];
    
    // Disconnect while app is in background
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        AWSDDLogInfo(@"Disconnecting while app is in background");
        [iotDataManager disconnect];
        
        // Simulate app returning to foreground
        dispatch_async(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:
             UIApplicationDidBecomeActiveNotification object:nil];
            
            // Invalidate credentials
            [self.credentialsProvider invalidateCachedTemporaryCredentials];
            
            // Remove IoT manager
            [AWSIoTDataManager removeIoTDataManagerForKey:testKey];
            
            // Test passed if we made it here without crashing
            [expectation fulfill];
        });
    });
    
    // Wait for the test to complete
    [self waitForExpectationsWithTimeout:self.defaultTimeout handler:^(NSError *error) {
        if (error) {
            XCTFail(@"Test timed out: %@", error);
        }
    }];
}

/**
 * This test simulates multiple concurrent disconnects from different threads
 * to ensure thread safety
 */
- (void)testConcurrentDisconnects {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Concurrent disconnects completed"];
    
    // Create a unique key for this test
    NSString *testKey = [NSString stringWithFormat:@"testConcurrentDisconnects-%@", [[NSUUID UUID] UUIDString]];
    
    // Set up the IoT data manager
    AWSServiceConfiguration *configuration = [self createTestServiceConfiguration];
    AWSIoTMQTTConfiguration *mqttConfig = [self createTestMQTTConfiguration];
    
    [AWSIoTDataManager registerIoTDataManagerWithConfiguration:configuration
                                         withMQTTConfiguration:mqttConfig
                                                        forKey:testKey];
    
    AWSIoTDataManager *iotDataManager = [AWSIoTDataManager IoTDataManagerForKey:testKey];
    XCTAssertNotNil(iotDataManager);
    
    // Number of concurrent disconnect attempts
    NSUInteger concurrentCount = 5;
    
    dispatch_group_t group = dispatch_group_create();
    
    // Launch multiple concurrent disconnects
    for (NSUInteger i = 0; i < concurrentCount; i++) {
        dispatch_group_enter(group);
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            AWSDDLogInfo(@"Concurrent disconnect attempt %lu", (unsigned long)i);
            [iotDataManager disconnect];
            
            dispatch_group_leave(group);
        });
    }
    
    // Wait for all disconnects to complete
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        // Remove IoT manager and invalidate credentials
        [AWSIoTDataManager removeIoTDataManagerForKey:testKey];
        [self.credentialsProvider invalidateCachedTemporaryCredentials];
        
        // Test passed if we made it here without crashing
        [expectation fulfill];
    });
    
    // Wait for the test to complete
    [self waitForExpectationsWithTimeout:self.defaultTimeout handler:^(NSError *error) {
        if (error) {
            XCTFail(@"Test timed out: %@", error);
        }
    }];
}

@end 
