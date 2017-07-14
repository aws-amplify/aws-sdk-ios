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
#import "AWSSNS.h"
#import "AWSTestUtility.h"

@interface AWSSNSTests : XCTestCase

@end

@implementation AWSSNSTests

+ (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)setUp {
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown {
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testClockSkewSNS {
    [AWSTestUtility setupSwizzling];

    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [AWSTestUtility setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];

    AWSSNS *sns = [AWSSNS defaultSNS];
    XCTAssertNotNil(sns);

    AWSSNSListTopicsInput *listTopicsInput = [AWSSNSListTopicsInput new];
    [[[sns listTopics:listTopicsInput] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSSNSListTopicsResponse class]]);
            AWSSNSListTopicsResponse *listTopicsResponse = task.result;
            XCTAssertTrue([listTopicsResponse.topics isKindOfClass:[NSArray class]]);
        }

        return nil;
    }] waitUntilFinished];

    [AWSTestUtility revertSwizzling];
}

- (void)testListTopics {
    AWSSNS *sns = [AWSSNS defaultSNS];

    AWSSNSListTopicsInput *listTopicsInput = [AWSSNSListTopicsInput new];
    [[[sns listTopics:listTopicsInput] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSSNSListTopicsResponse class]]);
            AWSSNSListTopicsResponse *listTopicsResponse = task.result;
            XCTAssertTrue([listTopicsResponse.topics isKindOfClass:[NSArray class]]);
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testGetEndpointAttributesFailed {
    AWSSNS *sns = [AWSSNS defaultSNS];
    
    AWSSNSGetEndpointAttributesInput *input = [AWSSNSGetEndpointAttributesInput new];
    input.endpointArn = @""; //endPointARN is empty
    
    [[[sns getEndpointAttributes:input] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error, @"expected InvalidParameters Error but got nil");
        XCTAssertEqual(task.error.code, 4);
        XCTAssertTrue([@"InvalidParameter" isEqualToString:task.error.userInfo[@"Code"]]);
        XCTAssertTrue([@"Invalid parameter: EndpointArn Reason: An ARN must have at least 6 elements, not 1" isEqualToString:task.error.userInfo[@"Message"]]);
        return nil;
    }] waitUntilFinished];
}


//- (void)testCreatePlatformEndpointWithAttributes {
//    AWSSNS *sns = [AWSSNS defaultSNS];
//    XCTAssertNotNil(sns);
//    
//    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials"
//                                                                          ofType:@"json"];
//    NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
//                                                                    options:NSJSONReadingMutableContainers
//                                                                      error:nil];
//    NSString *platformApplicationArn = credentialsJson[@"snsTestAppArn"];
//    
//    if ([platformApplicationArn length] > 0) {
//        
//        AWSSNSCreatePlatformEndpointInput *createEndpointInput = [AWSSNSCreatePlatformEndpointInput new];
//        createEndpointInput.platformApplicationArn = platformApplicationArn;
//        createEndpointInput.token = @"0123456789";
//        createEndpointInput.attributes  = @{@"Enabled":@"true"};
//        
//        [[[sns createPlatformEndpoint:createEndpointInput] continueWithBlock:^id(AWSTask *task) {
//            if (task.error) {
//                XCTFail(@"Error: [%@]", task.error);
//            }
//            
//            if (task.result) {
//                XCTAssertTrue([task.result isKindOfClass:[AWSSNSCreateEndpointResponse class]]);
//                AWSSNSCreateEndpointResponse *response = task.result;
//                XCTAssertNotNil(response.endpointArn, @"response endpointArn should not be nil!");
//            }
//            
//            return nil;
//        }] waitUntilFinished];
//    } else {
//        NSLog(@"Warning: can not get snsTestAppArn from credentials.json, you may need to update your credentials file");
//    }
//}
@end
