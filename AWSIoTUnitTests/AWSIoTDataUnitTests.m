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

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "OCMock.h"
#import "AWSIoT.h"

static id mockNetworking = nil;

@interface AWSIoTDataUnitTests : XCTestCase

@end

@implementation AWSIoTDataUnitTests

- (void)setupCredentialsProvider {
    
    AWSStaticCredentialsProvider *credentialsProvider = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:@"testAccessKey" secretKey:@"testSecretKey"];
    
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                         credentialsProvider:credentialsProvider];
    [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
    
}

- (void)setUp {
    [super setUp];
    [AWSDDLog sharedInstance].logLevel = AWSDDLogLevelInfo;
    [AWSDDLog addLogger:[AWSDDTTYLogger sharedInstance]];

    [self setupCredentialsProvider];
    
    mockNetworking = OCMClassMock([AWSNetworking class]);
    AWSTask *errorTask = [AWSTask taskWithError:[NSError errorWithDomain:@"OCMockExpectedNetworkingError" code:8848 userInfo:nil]];
    OCMStub([mockNetworking sendRequest:[OCMArg isKindOfClass:[AWSNetworkingRequest class]]]).andReturn(errorTask);
}

- (void)tearDown {
    [super tearDown];
}

- (void)testConstructors {
    NSString *key = @"testIOTDataConstructors";
    XCTAssertNotNil([AWSIoTData defaultIoTData]);
    XCTAssertEqual([[AWSIoTData defaultIoTData] class], [AWSIoTData class]);
    XCTAssertNil([AWSIoTData IoTDataForKey:key]);
    
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSIoTData registerIoTDataWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSIoTData IoTDataForKey:key]);
    XCTAssertEqual([[AWSIoTData IoTDataForKey:key] class], [AWSIoTData class]);
    XCTAssertEqual([AWSIoTData IoTDataForKey:key].configuration.regionType, AWSRegionUSEast1);
    
    [AWSIoTData removeIoTDataForKey:key];
    XCTAssertNil([AWSIoTData IoTDataForKey:key]);
    
}

- (void)testDeleteThingShadow {
    NSString *key = @"testDeleteThingShadow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoTData registerIoTDataWithConfiguration:configuration forKey:key];
    
    AWSIoTData *awsClient = [AWSIoTData IoTDataForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTDataDeleteThingShadowRequest *request = [[AWSIoTDataDeleteThingShadowRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoTData IoTDataForKey:key] deleteThingShadow:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoTData removeIoTDataForKey:key];
}

- (void)testGetThingShadow {
    NSString *key = @"testGetThingShadow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoTData registerIoTDataWithConfiguration:configuration forKey:key];
    
    AWSIoTData *awsClient = [AWSIoTData IoTDataForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTDataGetThingShadowRequest *request = [[AWSIoTDataGetThingShadowRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoTData IoTDataForKey:key] getThingShadow:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoTData removeIoTDataForKey:key];
}

- (void)testPublish {
    NSString *key = @"testPublish";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoTData registerIoTDataWithConfiguration:configuration forKey:key];
    
    AWSIoTData *awsClient = [AWSIoTData IoTDataForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTDataPublishRequest *request = [[AWSIoTDataPublishRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoTData IoTDataForKey:key] publish:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoTData removeIoTDataForKey:key];
}

- (void)testUpdateThingShadow {
    NSString *key = @"testUpdateThingShadow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoTData registerIoTDataWithConfiguration:configuration forKey:key];
    
    AWSIoTData *awsClient = [AWSIoTData IoTDataForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTDataUpdateThingShadowRequest *request = [[AWSIoTDataUpdateThingShadowRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoTData IoTDataForKey:key] updateThingShadow:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoTData removeIoTDataForKey:key];
}

- (void)testIOTConnection {
    NSString *key = @"testIOTConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                         credentialsProvider:nil];
    [AWSIoTDataManager registerIoTDataManagerWithConfiguration:configuration
                                                 forKey:key];

    AWSIoTDataManager *awsClient = [AWSIoTDataManager IoTDataManagerForKey:key];
    XCTAssertNotNil(awsClient);
    
    NSString *clientId = @"testClientId";
    NSString *certificateId = [[NSUUID UUID] UUIDString];
    
    BOOL connectionResult = [awsClient connectWithClientId:clientId
                                              cleanSession:YES
                                             certificateId:certificateId
                                            statusCallback:^(AWSIoTMQTTStatus status) {
        
    }];
    
    XCTAssertTrue(!connectionResult);

    NSString *message = @"test message";
    NSString *topic = @"test/iot/topic";
    BOOL returnValue = NO;
    returnValue = [awsClient publishString:message onTopic:topic QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce];
    
    XCTAssertTrue(returnValue);
    
    returnValue = [awsClient publishData:[message dataUsingEncoding:NSUTF8StringEncoding]
                                 onTopic:topic
                                    QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce];
    
    XCTAssertTrue(returnValue);
    
    returnValue = [awsClient subscribeToTopic:topic
                                          QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce
                              messageCallback:^(NSData *data) {
        
    }];
    
    XCTAssertTrue(returnValue);
    
    [awsClient unsubscribeTopic:topic];
    
    XCTAssertTrue(true);
    
    [awsClient disconnect];
    
    XCTAssertTrue(true);
    
    [AWSIoTData removeIoTDataForKey:key];
}

- (void)testIOTWebSocketConnection {
    NSString *key = @"testIOTWebSocketConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                         credentialsProvider:nil];
    [AWSIoTDataManager registerIoTDataManagerWithConfiguration:configuration
                                                        forKey:key];
    
    AWSIoTDataManager *awsClient = [AWSIoTDataManager IoTDataManagerForKey:key];
    XCTAssertNotNil(awsClient);
    
    NSString *clientId = @"testClientId";
    
    BOOL connectionResult = [awsClient connectUsingWebSocketWithClientId:clientId
                                             cleanSession:YES
                                            statusCallback:^(AWSIoTMQTTStatus status) {
                                                
                                            }];
    
    XCTAssertTrue(connectionResult);
    
    NSString *message = @"test message";
    NSString *topic = @"test/iot/topic";
    BOOL returnValue = NO;
    
    returnValue = [awsClient publishString:message onTopic:topic QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce];
    
    XCTAssertTrue(returnValue);
    
    returnValue = [awsClient publishData:[message dataUsingEncoding:NSUTF8StringEncoding]
                                 onTopic:topic
                                     QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce];

    
    XCTAssertTrue(returnValue);
    
    returnValue = [awsClient subscribeToTopic:topic
                                          QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce
                              messageCallback:^(NSData *data) {
                    
                }];
    
    XCTAssertTrue(returnValue);
    
    [awsClient unsubscribeTopic:topic];
    
    XCTAssertTrue(true);
    
    [awsClient disconnect];
    
    XCTAssertTrue(true);
    
    [AWSIoTData removeIoTDataForKey:key];
}

@end
