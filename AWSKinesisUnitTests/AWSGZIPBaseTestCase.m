//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSGZIPBaseTestCase.h"

#import "AWSTestUtility.h"
#import "AWSGZIPTestHelper.h"
#import "AWSGZIP.h"

@implementation AWSGZIPBaseTestCase

+ (NSString *)keyForOperationName:(NSString *)operationName {
    NSString *key = [NSString stringWithFormat:@"AWSGzipEncodingTests_%@", operationName];
    return key;
}

- (void)assertRequestWasGzippedForOperationName:(NSString *)operationName
                                usingTestHelper:(AWSGZIPTestHelper *)testHelper {
    NSString *requestContentEncoding = testHelper.requestContentEncoding;
    XCTAssertNotNil(requestContentEncoding);
    XCTAssertEqualObjects(@"gzip", requestContentEncoding, @"Content-Encoding should be 'gzip' for operation name '%@'", operationName);

    NSData *requestHTTPBody = testHelper.requestHTTPBody;
    XCTAssertNotNil(requestHTTPBody);

    NSData *jsonData = [requestHTTPBody awsgzip_gunzippedData];
    XCTAssertNotNil(jsonData, @"jsonData should not be nil for operation name '%@'", operationName);
    NSError *error = nil;

    // Ignore return value; we're just ensuring there are no errors
    // deserializing the JSON data
    [NSJSONSerialization JSONObjectWithData:jsonData
                                    options:NSJSONReadingMutableContainers
                                      error:&error];

    XCTAssertNil(error, @"Error serializing unzipped data into JSON for operation name '%@': %@", operationName, error);
}

- (void)assertRequestWasNotGzippedForOperationName:(NSString *)operationName
                                   usingTestHelper:(AWSGZIPTestHelper *)testHelper {
    NSString *requestContentEncoding = testHelper.requestContentEncoding;
    XCTAssertNotEqualObjects(@"gzip", requestContentEncoding, @"Content-Encoding should not be 'gzip' for operation name '%@'", operationName);

    NSData *requestHTTPBody = testHelper.requestHTTPBody;
    XCTAssertNotNil(requestHTTPBody);

    NSError *error = nil;

    // Ignore return value; we're just ensuring there are no errors
    // deserializing the HTTP body directly into JSON
    [NSJSONSerialization JSONObjectWithData:requestHTTPBody
                                    options:NSJSONReadingMutableContainers
                                      error:&error];

    XCTAssertNil(error, @"Error serializing HTTP Body into JSON for operation name '%@': %@", operationName, error);
}

@end
