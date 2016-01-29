//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSIoTData.h"

@interface AWSIoTDataTests : XCTestCase

@end

@implementation AWSIoTDataTests

+ (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}
- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testUpdateThing {
    AWSIoTData *iotData = [AWSIoTData defaultIoTData];
    
    AWSIoTDataUpdateThingShadowRequest *updateThingRequest = [AWSIoTDataUpdateThingShadowRequest new];
    updateThingRequest.thingName = @"testThing1";
    updateThingRequest.payload = @"{\"payloadData\":\"12345\"}";
    
    [[[iotData updateThingShadow:updateThingRequest] continueWithBlock:^id(AWSTask *task) {
        
        XCTAssertNotNil(task.error, @"expected Validation Error, but got nil");
        return nil;
    }] waitUntilFinished];
}

- (void)testGetThing {
    AWSIoTData *iotData = [AWSIoTData defaultIoTData];
    
    AWSIoTDataGetThingShadowRequest *getThingShadowRequest = [AWSIoTDataGetThingShadowRequest new];
    getThingShadowRequest.thingName = @"testThing2";
    
    [[[iotData getThingShadow:getThingShadowRequest] continueWithBlock:^id(AWSTask *task) {
        
        XCTAssertNotNil(task.error, @"expected Validation Error, but got nil");
        return nil;
    }] waitUntilFinished];
}

- (void)testDeleteThing {
    AWSIoTData *iotData = [AWSIoTData defaultIoTData];
    
    AWSIoTDataDeleteThingShadowRequest *deleteThingShadowRequest = [AWSIoTDataDeleteThingShadowRequest new];
    deleteThingShadowRequest.thingName = @"testThing3";
    
    [[[iotData deleteThingShadow:deleteThingShadowRequest] continueWithBlock:^id(AWSTask *task) {
        
        XCTAssertNotNil(task.error, @"expected Validation Error, but got nil");
        return nil;
    }] waitUntilFinished];
}

- (void)testPublish {
    AWSIoTData *iotData = [AWSIoTData defaultIoTData];
    
    AWSIoTDataPublishRequest *publishRequest = [AWSIoTDataPublishRequest new];
    publishRequest.topic = @"aTestTopic";
    publishRequest.payload = @"{\"payloadData\":\"6789\"}";
    
    [[[iotData publish:publishRequest] continueWithBlock:^id(AWSTask *task) {
        
        XCTAssertNotNil(task.error, @"expected Validation Error, but got nil");
        return nil;
    }] waitUntilFinished];
    
}


@end
