//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSIoTStreamThread.h"
#import "AWSMQTTSession.h"

@interface AWSIoTStreamThreadRaceConditionTests : XCTestCase
@end

@implementation AWSIoTStreamThreadRaceConditionTests

- (void)testRapidDeallocationDoesNotCrash {
    // This test simulates the race condition that causes crashes during backgrounding
    
    for (int i = 0; i < 100; i++) {
        @autoreleasepool {
            // Create mock streams
            NSInputStream *inputStream = [[NSInputStream alloc] initWithData:[NSData data]];
            NSOutputStream *outputStream = [[NSOutputStream alloc] initToMemory];
            
            // Create mock session
            AWSMQTTSession *session = [[AWSMQTTSession alloc] init];
            
            // Create thread
            AWSIoTStreamThread *thread = [[AWSIoTStreamThread alloc] initWithSession:session
                                                                  decoderInputStream:inputStream
                                                                 encoderOutputStream:outputStream];
            
            // Start thread
            [thread start];
            
            // Immediately cancel and let it deallocate
            [thread cancelAndDisconnect:YES];
            
            // Force deallocation by setting to nil
            thread = nil;
            
            // Small delay to let background operations complete
            usleep(1000); // 1ms
        }
    }
    
    // If we get here without crashing, the fix works
    XCTAssertTrue(YES, @"Rapid deallocation test completed without crashes");
}

- (void)testConcurrentCancelAndDealloc {
    // Test concurrent operations that could cause race conditions
    
    dispatch_group_t group = dispatch_group_create();
    
    for (int i = 0; i < 50; i++) {
        dispatch_group_async(group, dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^{
            @autoreleasepool {
                NSInputStream *inputStream = [[NSInputStream alloc] initWithData:[NSData data]];
                NSOutputStream *outputStream = [[NSOutputStream alloc] initToMemory];
                AWSMQTTSession *session = [[AWSMQTTSession alloc] init];
                
                AWSIoTStreamThread *thread = [[AWSIoTStreamThread alloc] initWithSession:session
                                                                      decoderInputStream:inputStream
                                                                     encoderOutputStream:outputStream];
                
                [thread start];
                
                // Simulate rapid cancel/dealloc from different threads
                dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), ^{
                    [thread cancel];
                });
                
                dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
                    [thread cancelAndDisconnect:YES];
                });
                
                // Let thread deallocate
                thread = nil;
            }
        });
    }
    
    // Wait for all operations to complete
    dispatch_group_wait(group, dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC));
    
    XCTAssertTrue(YES, @"Concurrent operations test completed without crashes");
}

@end