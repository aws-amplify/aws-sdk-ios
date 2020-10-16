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

#import "AWSNSSecureCodingTest.h"

@implementation AWSNSSecureCodingTest

- (void)validateSecureCodingForClass:(Class)cls {
    XCTAssert([cls conformsToProtocol:@protocol(NSSecureCoding)]);

    id originalInstance = [cls new];
    NSError *codingError;
    NSData *originalInstanceData = [NSKeyedArchiver archivedDataWithRootObject:originalInstance
                                                         requiringSecureCoding:YES
                                                                         error:&codingError];
    XCTAssertNil(codingError);
    XCTAssertNotNil(originalInstanceData);

    codingError = nil;
    id decodedInstance = [NSKeyedUnarchiver unarchivedObjectOfClass:cls
                                                           fromData:originalInstanceData
                                                              error:&codingError];
    XCTAssertNil(codingError);
    XCTAssertNotNil(decodedInstance);

    codingError = nil;
    NSData *decodedInstanceData = [NSKeyedArchiver archivedDataWithRootObject:decodedInstance
                                                        requiringSecureCoding:YES
                                                                        error:&codingError];
    XCTAssertNil(codingError);
    XCTAssertNotNil(decodedInstanceData);
    XCTAssertEqualObjects(originalInstanceData, decodedInstanceData);
}

- (void)validateClassDoesNotSupportSecureCoding:(Class)cls {
    XCTAssertFalse([cls supportsSecureCoding]);
}

@end
