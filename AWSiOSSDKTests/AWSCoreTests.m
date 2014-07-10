/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#if AWS_TEST_AWS_CORE

#import <XCTest/XCTest.h>
#import "AWSCore.h"

@interface AWSCoreTests : XCTestCase

@end

@implementation AWSCoreTests

- (void)setUp {
    [super setUp];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAWSJSONRequestSerializer {
    NSString *testURLString = @"http://aws.amazon.com";
    NSURL *testURL = [NSURL URLWithString:testURLString];
    NSMutableURLRequest *testRequest = [NSMutableURLRequest requestWithURL:testURL];
    testRequest.HTTPMethod = @"POST";

    NSMutableDictionary *testParams = [NSMutableDictionary new];
    NSString *paramKey1 = @"Key1 oparameters";
    NSString *paramKey2 = @"Key2 of parameters";
    NSString *paramValue1 = @"Value of Key1";
    NSString *paramValue2 = @"Value of Key2";

    [testParams setObject:paramValue1 forKey:paramKey1];
    [testParams setObject:paramValue2 forKey:paramKey2];

    NSMutableDictionary *testHeaders = [NSMutableDictionary new];
    NSString *contentLengthKey = @"Content-Length";
    NSString *contentTypeKey = @"Content-Type";
    NSString *contentLengthValue = @"283947";
    NSString *contentTypeValue = @"text/plain";
    [testHeaders setObject:contentLengthValue forKey:contentLengthKey];
    [testHeaders setObject:contentTypeValue forKey:contentTypeKey];

    AWSJSONRequestSerializer *jsonSerializer = [AWSJSONRequestSerializer new];

    [[[[jsonSerializer serializeRequest:testRequest
                                headers:testHeaders
                             parameters:testParams] continueWithSuccessBlock:^id(BFTask *task) {
        //Assert headers are properly set
        NSDictionary *serialziedHeaders = [testRequest allHTTPHeaderFields];
        XCTAssertEqualObjects(testHeaders, serialziedHeaders, "JSONSerializer failed to properly attach headers");

        //Assert body is properly in JSON
        NSData *jsonData = [testRequest HTTPBody];

        NSError *error = nil;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                       options:NSJSONReadingMutableContainers
                                                                         error:&error];

        if (error){
            XCTFail("Error while parsing JSON created with AWSJSONRequestSerializer %@", error);
        }
        XCTAssertEqualObjects(testParams, jsonDictionary, "Parameters could not be correctly parsed into JSON and re-interpreted");

        return nil;
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail("Error encountered while serializing request to JSON %@", task.error);
        }
        return nil;
    }] waitUntilFinished];
}

@end

#endif
