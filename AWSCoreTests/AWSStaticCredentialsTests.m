//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSCore.h"
#import "AWSTestUtility.h"

@interface AWSStaticCredentialsTests : XCTestCase

@end

// Tests that require static credentials to pass. We run these tests separately from the regular integration tests,
// which use role based temporary credentials.
@implementation AWSStaticCredentialsTests

- (void)testCreateStaticCredentialsProvider {
    NSDictionary *credentialsJson = [AWSStaticCredentialsTests getStaticCredentialsFromFile];

    AWSStaticCredentialsProvider *staticProvider = [[AWSStaticCredentialsProvider alloc]
                                                    initWithAccessKey:credentialsJson[@"accessKey"]
                                                    secretKey:credentialsJson[@"secretKey"]];
    
    [[[staticProvider credentials] continueWithBlock:^id _Nullable(AWSTask<AWSCredentials *> * _Nonnull task) {
        AWSCredentials *credentials = task.result;
        XCTAssertEqualObjects(credentialsJson[@"accessKey"], credentials.accessKey);
        XCTAssertEqualObjects(credentialsJson[@"secretKey"], credentials.secretKey);
        return nil;
    }] waitUntilFinished];
}

+ (NSDictionary *)getStaticCredentialsFromFile {
    NSDictionary *emptyDictionary = @{
        @"accessKey": @"EXAMPLE_KEY_ID",
        @"secretKey": @"EXAMPLE_SECRET_KEY"
    };

    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"static-credentials" ofType:@"json"];
    if (! filePath) {
        return emptyDictionary;
    }

    NSData * _Nullable jsonData = [NSData dataWithContentsOfFile:filePath];
    if (! jsonData) {
        return emptyDictionary;
    }

    NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:nil];
    return credentialsJson;
}

@end
