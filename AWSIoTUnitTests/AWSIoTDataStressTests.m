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
#import <stdatomic.h>

@interface AWSIoTDataStressTests : XCTestCase

@property (nonatomic, strong) AWSCognitoCredentialsProvider *credentialsProvider;
@property (nonatomic, assign) NSTimeInterval defaultTimeout;
@property (nonatomic, strong) NSMutableArray<NSString *> *activeTestKeys;

@end

@implementation AWSIoTDataStressTests

- (void)setUp {
    [super setUp];
    [AWSDDLog sharedInstance].logLevel = AWSDDLogLevelVerbose;
    [AWSDDLog addLogger:[AWSDDTTYLogger sharedInstance]];
    
    self.defaultTimeout = 60.0; // Use a longer timeout for stress tests
    
    // Create a thread-safe array for storing test keys
    self.activeTestKeys = [NSMutableArray new];
    
    // Create a credentials provider for testing
    self.credentialsProvider = [[AWSCognitoCredentialsProvider alloc] 
                               initWithRegionType:AWSRegionUSEast1
                               identityPoolId:@"TestIdentityPoolId"];
}

- (void)tearDown {
    // Clean up any remaining IoT managers with proper synchronization
    NSArray *keysToRemove = nil;
    
    @synchronized(self.activeTestKeys) {
        keysToRemove = [self.activeTestKeys copy];
        [self.activeTestKeys removeAllObjects];
    }
    
    // Remove managers outside the synchronized block to avoid deadlocks
    for (NSString *key in keysToRemove) {
        [AWSIoTDataManager removeIoTDataManagerForKey:key];
    }
    
    [super tearDown];
}

#pragma mark - Helper Methods

- (NSString *)generateUniqueTestKey:(NSString *)prefix {
    NSString *key = [NSString stringWithFormat:@"%@-%@", prefix, [[NSUUID UUID] UUIDString]];
    
    // Use a synchronization mechanism to safely add to the shared array
    @synchronized(self.activeTestKeys) {
        [self.activeTestKeys addObject:key];
    }
    
    return key;
}

- (AWSServiceConfiguration *)createTestServiceConfiguration {
    return [[AWSServiceConfiguration alloc]
            initWithRegion:AWSRegionUSEast1
            endpoint:[[AWSEndpoint alloc] initWithURLString:@"https://test-endpoint.iot.amazonaws.com"]
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

- (AWSIoTDataManager *)createIoTDataManager:(NSString *)key {
    AWSServiceConfiguration *configuration = [self createTestServiceConfiguration];
    AWSIoTMQTTConfiguration *mqttConfig = [self createTestMQTTConfiguration];
    
    [AWSIoTDataManager registerIoTDataManagerWithConfiguration:configuration
                                         withMQTTConfiguration:mqttConfig
                                                        forKey:key];
    
    AWSIoTDataManager *iotDataManager = [AWSIoTDataManager IoTDataManagerForKey:key];
    return iotDataManager;
}

#pragma mark - Stress Test Cases

/**
 * This test simulates multiple IoT data managers lifecycle operations happening concurrently
 * to stress test the thread safety of the SDK
 */
- (void)testMultipleIoTManagersStress {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Multiple IoT managers stress test completed"];
    
    // Number of IoT managers to create
    NSUInteger managerCount = 10;
    NSMutableArray *managers = [NSMutableArray arrayWithCapacity:managerCount];
    
    // Create multiple managers
    for (NSUInteger i = 0; i < managerCount; i++) {
        NSString *key = [self generateUniqueTestKey:@"multiManager"];
        AWSIoTDataManager *manager = [self createIoTDataManager:key];
        [managers addObject:manager];
    }
    
    // Set up dispatch group to track completion
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.amazonaws.iot.stressTestQueue", DISPATCH_QUEUE_CONCURRENT);
    
    // Perform a mix of operations concurrently
    for (NSUInteger i = 0; i < managers.count; i++) {
        AWSIoTDataManager *manager = managers[i];
        
        // Randomly select an operation based on index
        dispatch_group_enter(group);
        dispatch_async(concurrentQueue, ^{
            NSUInteger operationType = i % 3;
            
            switch (operationType) {
                case 0: {
                    // Disconnect
                    AWSDDLogInfo(@"Manager %lu: Disconnecting", (unsigned long)i);
                    [manager disconnect];
                    break;
                }
                case 1: {
                    // Subscribe and disconnect
                    AWSDDLogInfo(@"Manager %lu: Subscribe then disconnect", (unsigned long)i);
                    NSString *topic = [NSString stringWithFormat:@"test/topic/%lu", (unsigned long)i];
                    [manager subscribeToTopic:topic
                                          QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce
                              messageCallback:^(NSData *data) {
                        // Do nothing with the message
                    }];
                    [manager disconnect];
                    break;
                }
                case 2: {
                    // Publish and disconnect
                    AWSDDLogInfo(@"Manager %lu: Publish then disconnect", (unsigned long)i);
                    NSString *topic = [NSString stringWithFormat:@"test/topic/%lu", (unsigned long)i];
                    NSString *message = [NSString stringWithFormat:@"Test message %lu", (unsigned long)i];
                    [manager publishString:message
                                  onTopic:topic
                                      QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce];
                    [manager disconnect];
                    break;
                }
            }
            
            dispatch_group_leave(group);
        });
    }
    
    // Wait for all operations to complete
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        // Clean up all managers
        for (NSUInteger i = 0; i < managers.count; i++) {
            NSString *key = self.activeTestKeys[i];
            [AWSIoTDataManager removeIoTDataManagerForKey:key];
        }
        
        // If we reach here without crashing, the test passes
        [expectation fulfill];
    });
    
    // Wait for the test to complete
    [self waitForExpectationsWithTimeout:self.defaultTimeout handler:^(NSError *error) {
        if (error) {
            XCTFail(@"Test timed out: %@", error);
        }
    }];
}

/**
 * This test creates an IoT manager, performs operations, and then terminates the process
 * abruptly (as might happen in a real app) to verify cleanup happens properly
 */
- (void)testAbruptAppTermination {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Abrupt termination test completed"];
    
    // Create a unique key for this test
    NSString *testKey = [self generateUniqueTestKey:@"abruptTermination"];
    
    // Create IoT manager
    AWSIoTDataManager *iotDataManager = [self createIoTDataManager:testKey];
    
    // Subscribe to some topics
    NSString *topic1 = @"test/abrupt/topic1";
    NSString *topic2 = @"test/abrupt/topic2";
    
    [iotDataManager subscribeToTopic:topic1
                                 QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce
                     messageCallback:^(NSData *data) {
        // Do nothing
    }];
    
    [iotDataManager subscribeToTopic:topic2
                                 QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce
                     messageCallback:^(NSData *data) {
        // Do nothing
    }];
    
    // Simulate app termination - not disconnecting cleanly
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // Send app termination notification
        [[NSNotificationCenter defaultCenter] postNotificationName:UIApplicationWillTerminateNotification
                                                            object:nil];
        
        // Clear credentials while things are still processing
        [self.credentialsProvider clearCredentials];
        
        // Remove the manager forcefully
        [AWSIoTDataManager removeIoTDataManagerForKey:testKey];
        
        // Test passes if we get here without crashing
        [expectation fulfill];
    });
    
    // Wait for the test to complete
    [self waitForExpectationsWithTimeout:self.defaultTimeout handler:^(NSError *error) {
        if (error) {
            XCTFail(@"Test timed out: %@", error);
        }
    }];
}

/**
 * This test creates multiple managers, issues connect/disconnect on each,
 * then forcefully removes the managers while operations may still be pending
 */
- (void)testForcefulCleanup {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Forceful cleanup test completed"];
    
    // Number of managers to create
    NSUInteger managerCount = 5;
    NSMutableArray *managers = [NSMutableArray arrayWithCapacity:managerCount];
    
    // Create multiple managers
    for (NSUInteger i = 0; i < managerCount; i++) {
        NSString *key = [self generateUniqueTestKey:[NSString stringWithFormat:@"forcefulCleanup%lu", (unsigned long)i]];
        AWSServiceConfiguration *configuration = [self createTestServiceConfiguration];
        AWSIoTMQTTConfiguration *mqttConfig = [self createTestMQTTConfiguration];
        
        [AWSIoTDataManager registerIoTDataManagerWithConfiguration:configuration
                                             withMQTTConfiguration:mqttConfig
                                                            forKey:key];
        
        AWSIoTDataManager *manager = [AWSIoTDataManager IoTDataManagerForKey:key];
        [managers addObject:manager];
    }
    
    // Set up dispatch group to track completion
    dispatch_group_t group = dispatch_group_create();
    
    // Perform disconnects 
    for (NSUInteger i = 0; i < managers.count; i++) {
        dispatch_group_enter(group);
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            AWSIoTDataManager *manager = managers[i];
            
            // Wait briefly
            usleep(10000); // 10ms
            
            // Disconnect
            [manager disconnect];
            
            dispatch_group_leave(group);
        });
    }
    
    // Force cleanup in the middle of everything
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        // Force cleanup of all managers
        for (NSString *key in self.activeTestKeys) {
            [AWSIoTDataManager removeIoTDataManagerForKey:key];
        }
        
        // Clear credentials
        [self.credentialsProvider clearCredentials];
    });
    
    // Wait for all operations to complete or fail
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        // If we reach here without crashing, the test passes
        [expectation fulfill];
    });
    
    // Wait for the test to complete
    [self waitForExpectationsWithTimeout:self.defaultTimeout handler:^(NSError *error) {
        if (error) {
            XCTFail(@"Test timed out: %@", error);
        }
    }];
}

/**
 * This test simulates rapid app background/foreground transitions
 * during IoT operations to test resilience to iOS lifecycle events
 * This test specifically stresses the memory management of blocks
 */
- (void)testAppLifecycleTransitions {
    XCTestExpectation *expectation = [self expectationWithDescription:@"App lifecycle transitions test completed"];
    
    // Create a unique key for this test
    NSString *testKey = [self generateUniqueTestKey:@"appLifecycle"];
    
    // Create IoT manager
    AWSIoTDataManager *iotDataManager = [self createIoTDataManager:testKey];
    
    // Increase number of transitions to increase likelihood of triggering the issue
    NSUInteger transitionCount = 20;
    __block NSUInteger completedTransitions = 0;
    
    // Run a series of background/foreground transitions
    dispatch_queue_t serialQueue = dispatch_queue_create("com.amazonaws.iot.lifecycleQueue", DISPATCH_QUEUE_SERIAL);
    
    // Create a strong reference to the block
    __block void (^cycleBlock)(void);
    __weak typeof(self) weakSelf = self;
    
    AWSDDLogInfo(@"Starting app lifecycle test with %lu transitions", (unsigned long)transitionCount);
    
    cycleBlock = ^{
        __strong typeof(self) strongSelf = weakSelf;
        if (!strongSelf) {
            AWSDDLogError(@"Self reference lost during cycle - this shouldn't happen");
            return;
        }
        
        if (completedTransitions >= transitionCount) {
            // All transitions complete
            AWSDDLogInfo(@"Completed all %lu transitions", (unsigned long)transitionCount);
            [AWSIoTDataManager removeIoTDataManagerForKey:testKey];
            [expectation fulfill];
            // Clear the block to break potential retain cycles
            cycleBlock = nil;
            return;
        }
        
        BOOL isEvenCycle = (completedTransitions % 2 == 0);
        NSNotificationName notificationName = isEvenCycle ? 
            UIApplicationDidEnterBackgroundNotification : 
            UIApplicationDidBecomeActiveNotification;
        
        // Create additional autorelease pool to stress memory management
        @autoreleasepool {
            dispatch_async(serialQueue, ^{
                AWSDDLogInfo(@"Lifecycle transition %lu: %@", 
                            (unsigned long)completedTransitions, 
                            isEvenCycle ? @"Background" : @"Foreground");
                
                // Post notification
                [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:nil];
                
                // Perform an IoT operation
                if (isEvenCycle) {
                    // In background, disconnect
                    [iotDataManager disconnect];
                    
                    // Additional memory pressure on even cycles
                    if (completedTransitions % 4 == 0) {
                        // Create temporary large objects to increase memory pressure
                        NSMutableArray *tempObjects = [NSMutableArray array];
                        for (int i = 0; i < 5; i++) {
                            [tempObjects addObject:[NSMutableData dataWithLength:1024*1024]]; // 1MB each
                        }
                        [tempObjects removeAllObjects];
                        
                        // Force a memory warning notification to stress memory handling
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [[NSNotificationCenter defaultCenter] postNotificationName:
                             UIApplicationDidReceiveMemoryWarningNotification object:nil];
                        });
                    }
                }
                
                // Increment counter
                completedTransitions++;
                
                // Schedule next cycle using the strong reference to the block
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), 
                              dispatch_get_main_queue(), ^{
                    // Capture in a local variable to test reference handling
                    void (^localCycleBlock)(void) = cycleBlock;
                    if (localCycleBlock) {
                        localCycleBlock();
                    } else {
                        AWSDDLogError(@"Cycle block deallocated prematurely");
                        XCTFail(@"Cycle block deallocated prematurely");
                    }
                });
            });
        }
    };
    
    // Start the cycles
    cycleBlock();
    
    // Wait for the test to complete
    [self waitForExpectationsWithTimeout:self.defaultTimeout handler:^(NSError *error) {
        AWSDDLogInfo(@"App lifecycle test completed with status: %@", error ? @"FAILED" : @"SUCCESS");
        
        // Break cycles
        cycleBlock = nil;
        
        if (error) {
            XCTFail(@"Test timed out: %@", error);
        }
    }];
}

/**
 * This test simulates memory pressure conditions during IoT operations
 */
- (void)testMemoryPressureConditions {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Memory pressure test completed"];
    
    // Create multiple IoT managers to increase memory usage
    NSUInteger managerCount = 10;
    for (NSUInteger i = 0; i < managerCount; i++) {
        NSString *key = [self generateUniqueTestKey:[NSString stringWithFormat:@"memoryTest%lu", (unsigned long)i]];
        [self createIoTDataManager:key];
    }
    
    // Create large data blocks to simulate memory pressure
    NSMutableArray *memoryBlocks = [NSMutableArray array];
    for (NSUInteger i = 0; i < 10; i++) {
        // Create a 1MB block
        NSMutableData *largeBlock = [NSMutableData dataWithLength:1024*1024];
        [memoryBlocks addObject:largeBlock];
    }
    
    // Simulate memory warning
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), 
                  dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:UIApplicationDidReceiveMemoryWarningNotification
                                                            object:nil];
                      
        // Disconnect all managers during memory pressure
        for (NSString *key in self.activeTestKeys) {
            AWSIoTDataManager *manager = [AWSIoTDataManager IoTDataManagerForKey:key];
            [manager disconnect];
        }
        
        // Clear credentials
        [self.credentialsProvider clearCredentials];
        
        // Clean up memory blocks
        [memoryBlocks removeAllObjects];
        
        // Clean up managers
        for (NSString *key in self.activeTestKeys) {
            [AWSIoTDataManager removeIoTDataManagerForKey:key];
        }
        
        // If we get here without crashing, test passes
        [expectation fulfill];
    });
    
    // Wait for the test to complete
    [self waitForExpectationsWithTimeout:self.defaultTimeout handler:^(NSError *error) {
        if (error) {
            XCTFail(@"Test timed out: %@", error);
        }
    }];
}

/**
 * This test is specifically designed to reproduce the block retain cycle issue 
 * that can cause memory corruption and crashes in the IoT data manager
 */
- (void)testBlockMemoryManagement {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Block memory management test completed"];
    
    // Create a unique key for this test
    NSString *testKey = [self generateUniqueTestKey:@"blockMemoryTest"];
    
    // Create IoT manager
    AWSIoTDataManager *iotDataManager = [self createIoTDataManager:testKey];
    
    // Simulate a high number of recursive cycles to stress memory management
    __block NSUInteger recurseCount = 0;
    NSUInteger maxRecursions = 50;
    __block BOOL testPassed = NO;
    
    AWSDDLogInfo(@"Starting block memory management test with %lu recursions", (unsigned long)maxRecursions);
    
    // Create an autorelease pool to better control memory
    @autoreleasepool {
        // This is the block with the potential memory issue 
        __block void (^recursiveBlock)(void);
        __weak typeof(self) weakSelf = self;
        
        recursiveBlock = ^{
            typeof(self) strongSelf = weakSelf;
            if (!strongSelf) {
                AWSDDLogError(@"Self reference lost during recursive block test");
                return;
            }
            
            recurseCount++;
            AWSDDLogVerbose(@"Recursive block call %lu of %lu", (unsigned long)recurseCount, (unsigned long)maxRecursions);
            
            if (recurseCount >= maxRecursions) {
                AWSDDLogInfo(@"Completed all recursions, cleaning up");
                [iotDataManager disconnect];
                [AWSIoTDataManager removeIoTDataManagerForKey:testKey];
                testPassed = YES;
                [expectation fulfill];
                // Critical: clear the block variable to break potential cycles
                recursiveBlock = nil;
                return;
            }
            
            // Disconnect on even iterations to stress MQTT cleanup
            if (recurseCount % 2 == 0) {
                [iotDataManager disconnect];
            }
            
            // Memory pressure on every fourth iteration
            if (recurseCount % 4 == 0) {
                // Create and immediately release memory to trigger potential memory issues
                @autoreleasepool {
                    NSMutableArray *tempBlocks = [NSMutableArray array];
                    for (int i = 0; i < 3; i++) {
                        NSMutableData *data = [NSMutableData dataWithLength:512*1024]; // 512KB
                        [tempBlocks addObject:data];
                    }
                    [tempBlocks removeAllObjects];
                }
                
                // Force a garbage collection situation
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[NSNotificationCenter defaultCenter] postNotificationName:UIApplicationDidReceiveMemoryWarningNotification 
                                                                        object:nil];
                });
            }
            
            // Schedule next call (THIS IS THE PROBLEMATIC PATTERN WE'RE TESTING)
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), 
                          dispatch_get_main_queue(), ^{
                // The critical pattern that causes issues without proper handling
                // This pattern is what can lead to memory corruption
                void (^localBlock)(void) = recursiveBlock;
                if (localBlock) {
                    localBlock();
                } else {
                    AWSDDLogError(@"Recursive block was deallocated prematurely");
                    XCTFail(@"Block deallocated prematurely - memory corruption likely");
                }
            });
        };
        
        // Start the recursion
        recursiveBlock();
    }
    
    // Wait for the test to complete
    [self waitForExpectationsWithTimeout:self.defaultTimeout handler:^(NSError *error) {
        AWSDDLogInfo(@"Block memory test completed with status: %@", 
                    (error ? @"FAILED" : (testPassed ? @"SUCCESS" : @"INCOMPLETE")));
        
        if (error) {
            XCTFail(@"Test timed out: %@", error);
        } else if (!testPassed) {
            XCTFail(@"Test did not complete all recursions");
        }
    }];
}

/**
 * This test specifically targets the block cycle/memory issue by forcing a situation
 * that will crash without our fix but succeed with it.
 * NOTE: This test is EXPECTED TO CRASH if the fix for recursive block handling is not in place.
 */
- (void)testBlockCaptureIssue {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Block capture test completed"];
    
    // Create a unique key for this test
    NSString *testKey = [self generateUniqueTestKey:@"blockCaptureTest"];
    
    // Create IoT manager
    AWSIoTDataManager *iotDataManager = [self createIoTDataManager:testKey];
    
    // Flag to track completion
    __block BOOL testPassed = NO;
    
    AWSDDLogInfo(@"Starting forced block capture test - this should crash without proper fix");
    
    // Run the test in a dedicated queue to isolate it
    dispatch_queue_t testQueue = dispatch_queue_create("com.amazonaws.iot.blockCaptureTestQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(testQueue, ^{
        // Create multiple layers of blocks to force the issue
        @autoreleasepool {
            // This block variable will be captured and used in a way that causes issues
            __block void (^nestedBlock)(void);
            
            // To really force the issue, we'll create multiple blocks that reference each other
            __block void (^outerBlock)(void);
            __block void (^middleBlock)(void);
            __block NSUInteger counter = 0;
            NSUInteger maxIterations = 100; // High enough to trigger the issue
            
            // Set up the blocks with cyclic references
            outerBlock = ^{
                counter++;
                AWSDDLogVerbose(@"Outer block call %lu", (unsigned long)counter);
                
                // Every few iterations, force an explicit nil of the blocks to test cleanup
                if (counter % 7 == 0) {
                    // Force IoT operations during the test
                    [iotDataManager disconnect];
                }
                
                // Schedule the middle block
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.001 * NSEC_PER_SEC)), 
                              dispatch_get_main_queue(), ^{
                    // This is the pattern that would crash:
                    // Creating a local copy of the block variable
                    void (^localBlockRef)(void) = middleBlock;
                    if (localBlockRef) {
                        localBlockRef();
                    }
                });
            };
            
            middleBlock = ^{
                AWSDDLogVerbose(@"Middle block call %lu", (unsigned long)counter);
                
                // Every several iterations, create memory pressure
                if (counter % 5 == 0) {
                    @autoreleasepool {
                        // Create and release temporary large objects
                        NSMutableArray *temp = [NSMutableArray array];
                        for (int i = 0; i < 5; i++) {
                            [temp addObject:[NSMutableData dataWithLength:1024*1024]];
                        }
                        [temp removeAllObjects];
                    }
                    
                    // Force memory warnings
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [[NSNotificationCenter defaultCenter] postNotificationName:UIApplicationDidReceiveMemoryWarningNotification
                                                                            object:nil];
                    });
                }
                
                // Schedule nested block - the problematic pattern
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.001 * NSEC_PER_SEC)), 
                              dispatch_get_main_queue(), ^{
                    // This is the critical pattern that would crash without our fix:
                    void (^localNestedRef)(void) = nestedBlock;
                    if (localNestedRef) {
                        localNestedRef();
                    }
                });
            };
            
            nestedBlock = ^{
                AWSDDLogVerbose(@"Nested block call %lu", (unsigned long)counter);
                
                // Check if we've completed our test
                if (counter >= maxIterations) {
                    AWSDDLogInfo(@"Completed all %lu iterations without crashing", (unsigned long)counter);
                    // Clean up
                    [iotDataManager disconnect];
                    [AWSIoTDataManager removeIoTDataManagerForKey:testKey];
                    
                    // Break all cycles
                    outerBlock = nil;
                    middleBlock = nil;
                    nestedBlock = nil;
                    
                    // Mark test as passed
                    testPassed = YES;
                    
                    // Complete the test
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [expectation fulfill];
                    });
                    return;
                }
                
                // Schedule the outer block again - completing the cycle
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.001 * NSEC_PER_SEC)), 
                              dispatch_get_main_queue(), ^{
                    // Force creating a local copy - this pattern triggers the issue
                    void (^localOuterRef)(void) = outerBlock;
                    if (localOuterRef) {
                        localOuterRef();
                    }
                });
            };
            
            // Start the chain
            outerBlock();
        }
    });
    
    // Wait for the test to complete - will time out and fail if it crashes
    [self waitForExpectationsWithTimeout:self.defaultTimeout handler:^(NSError *error) {
        // Should only reach here if the test doesn't crash
        AWSDDLogInfo(@"Block capture test %@", testPassed ? @"PASSED" : @"FAILED");
        
        if (error) {
            XCTFail(@"Test timed out: %@", error);
        } else if (!testPassed) {
            XCTFail(@"Test completed but did not execute all iterations");
        }
    }];
}

/**
 * This test specifically targets the stream thread cleanup race condition
 * by rapidly creating, disconnecting, and removing IoT managers
 * NOTE: This test will fail or crash without our fix in AWSIoTStreamThread's cleanup method
 */
- (void)testStreamThreadCleanupIssue {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Stream thread cleanup test completed"];
    
    // Number of managers to rapidly create and destroy - using a higher count for stress testing
    NSUInteger managerCount = 30;
    
    // Use an atomic counter to track completion
    __block atomic_int completedCount = 0;
    __block atomic_int cleanupAttemptCount = 0;
    __block atomic_int observedCrashIssues = 0;
    
    // Create a dispatch group for synchronization
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.amazonaws.iot.streamThreadTestQueue", DISPATCH_QUEUE_CONCURRENT);
    
    // Local storage for keys
    NSMutableArray<NSString *> *localKeys = [NSMutableArray arrayWithCapacity:managerCount];
    
    // Add synchronization for the activeTestKeys array
    @synchronized(self.activeTestKeys) {
        [self.activeTestKeys removeAllObjects];
    }
    
    AWSDDLogInfo(@"Starting stream thread cleanup test with %lu managers", (unsigned long)managerCount);
    
    // Create a series of managers with different timing patterns to maximize contention
    for (NSUInteger i = 0; i < managerCount; i++) {
        dispatch_group_enter(group);
        
        // Vary the dispatch queue priorities to increase contention
        dispatch_queue_global_t priorityQueue = (i % 3 == 0) ? 
            dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0) :
            ((i % 3 == 1) ? dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) :
             dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0));
        
        dispatch_async(concurrentQueue, ^{
            // Create unique key with synchronized access
            NSString *key = [NSString stringWithFormat:@"streamThread%lu-%@", (unsigned long)i, [[NSUUID UUID] UUIDString]];
            
            @synchronized(self.activeTestKeys) {
                [self.activeTestKeys addObject:key];
            }
            
            @synchronized(localKeys) {
                [localKeys addObject:key];
            }
            
            // Create service and MQTT configurations
            AWSServiceConfiguration *configuration = [self createTestServiceConfiguration];
            AWSIoTMQTTConfiguration *mqttConfig = [self createTestMQTTConfiguration];
            
            // Register the IoT manager
            [AWSIoTDataManager registerIoTDataManagerWithConfiguration:configuration
                                                 withMQTTConfiguration:mqttConfig
                                                                forKey:key];
            
            // Get the manager instance
            AWSIoTDataManager *manager = [AWSIoTDataManager IoTDataManagerForKey:key];
            
            // Different cleanup patterns based on index to maximize contention
            if (i % 4 == 0) {
                // Pattern 1: Instant disconnect and immediate removal
                [manager disconnect];
                dispatch_async(priorityQueue, ^{
                    atomic_fetch_add(&cleanupAttemptCount, 1);
                    @try {
                        [AWSIoTDataManager removeIoTDataManagerForKey:key];
                    } @catch (NSException *exception) {
                        AWSDDLogError(@"Exception during cleanup pattern 1: %@", exception);
                        atomic_fetch_add(&observedCrashIssues, 1);
                    }
                    atomic_fetch_add(&completedCount, 1);
                    dispatch_group_leave(group);
                });
            } else if (i % 4 == 1) {
                // Pattern 2: Disconnect with slight delay then removal
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.001 * NSEC_PER_SEC)), 
                              priorityQueue, ^{
                    [manager disconnect];
                    
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0005 * NSEC_PER_SEC)), 
                                  priorityQueue, ^{
                        atomic_fetch_add(&cleanupAttemptCount, 1);
                        @try {
                            [AWSIoTDataManager removeIoTDataManagerForKey:key];
                        } @catch (NSException *exception) {
                            AWSDDLogError(@"Exception during cleanup pattern 2: %@", exception);
                            atomic_fetch_add(&observedCrashIssues, 1);
                        }
                        atomic_fetch_add(&completedCount, 1);
                        dispatch_group_leave(group);
                    });
                });
            } else if (i % 4 == 2) {
                // Pattern 3: Remove without explicit disconnect
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0008 * NSEC_PER_SEC)), 
                              priorityQueue, ^{
                    atomic_fetch_add(&cleanupAttemptCount, 1);
                    @try {
                        [AWSIoTDataManager removeIoTDataManagerForKey:key];
                    } @catch (NSException *exception) {
                        AWSDDLogError(@"Exception during cleanup pattern 3: %@", exception);
                        atomic_fetch_add(&observedCrashIssues, 1);
                    }
                    atomic_fetch_add(&completedCount, 1);
                    dispatch_group_leave(group);
                });
            } else {
                // Pattern 4: Multiple disconnect calls followed by removal
                dispatch_async(priorityQueue, ^{
                    [manager disconnect];
                    
                    dispatch_async(priorityQueue, ^{
                        [manager disconnect]; // Second disconnect - this would cause issues with the unfixed code
                        
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.002 * NSEC_PER_SEC)), 
                                      priorityQueue, ^{
                            atomic_fetch_add(&cleanupAttemptCount, 1);
                            @try {
                                [AWSIoTDataManager removeIoTDataManagerForKey:key];
                            } @catch (NSException *exception) {
                                AWSDDLogError(@"Exception during cleanup pattern 4: %@", exception);
                                atomic_fetch_add(&observedCrashIssues, 1);
                            }
                            atomic_fetch_add(&completedCount, 1);
                            dispatch_group_leave(group);
                        });
                    });
                });
            }
        });
    }
    
    // Wait for all operations to complete with a timeout
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        AWSDDLogInfo(@"All stream thread cleanup operations completed: %d/%lu, cleanup attempts: %d, observed issues: %d", 
                    atomic_load(&completedCount), 
                    (unsigned long)managerCount,
                    atomic_load(&cleanupAttemptCount),
                    atomic_load(&observedCrashIssues));
        
        // Verify that all operations completed
        XCTAssertEqual(atomic_load(&completedCount), managerCount, @"Not all managers were properly cleaned up");
        
        // Verify that we didn't observe any crash issues
        XCTAssertEqual(atomic_load(&observedCrashIssues), 0, @"Observed crash issues during cleanup");
        
        [expectation fulfill];
    });
    
    // Wait for the test to complete
    [self waitForExpectationsWithTimeout:self.defaultTimeout handler:^(NSError *error) {
        if (error) {
            XCTFail(@"Test timed out: %@", error);
        }
        
        // Final cleanup - remove any remaining managers
        @synchronized(self.activeTestKeys) {
            for (NSString *key in self.activeTestKeys) {
                @try {
                    [AWSIoTDataManager removeIoTDataManagerForKey:key];
                } @catch (NSException *exception) {
                    AWSDDLogError(@"Exception during final cleanup: %@", exception);
                }
            }
            [self.activeTestKeys removeAllObjects];
        }
    }];
}

@end 