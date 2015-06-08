/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AWSCore.h"

@interface AWSLogger()

- (NSString *)logLevelLabel:(AWSLogLevel)logLevel;

@end

@interface AWSUtilityTests : XCTestCase

@end

@implementation AWSUtilityTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testAtomicCopy {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSURL* possibleCachesURL = [[fileManager URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask] objectAtIndex:0];
    XCTAssertNotNil(possibleCachesURL);
    NSString *testCachesPath = [[possibleCachesURL path] stringByAppendingPathComponent:@"com.amazonaws.test"];
    NSError *error = nil;
    
    
    NSURL* possibleApplicationSupportURL = [[fileManager URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] objectAtIndex:0];
    XCTAssertNotNil(possibleApplicationSupportURL);
    NSString *testAppSupportPath = [[possibleApplicationSupportURL path] stringByAppendingPathComponent:@"com.amazonaws.test"];
    error = nil;
    
    //clean up
    [fileManager removeItemAtPath:testCachesPath error:nil];
    [fileManager removeItemAtPath:testAppSupportPath error:nil];
    
    XCTAssertTrue([fileManager createDirectoryAtPath:testCachesPath withIntermediateDirectories:YES attributes:nil error:&error]);
    XCTAssertTrue([fileManager createDirectoryAtPath:testAppSupportPath withIntermediateDirectories:YES attributes:nil error:&error]);
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSDictionary *testDic = @{@"testID":uuid};
    error = nil;
    NSData *testData = [NSJSONSerialization dataWithJSONObject:testDic options:kNilOptions error:&error];
    XCTAssertNotNil(testData);
    XCTAssertNil(error);
    
    XCTAssertTrue([testData writeToFile:[testCachesPath stringByAppendingPathComponent:@"testFile"]  atomically:YES]);
    
    error = nil;
    BOOL result = [fileManager aws_atomicallyCopyItemAtURL:[NSURL fileURLWithPath:testCachesPath]
                                                     toURL:[NSURL fileURLWithPath:testAppSupportPath]
                                            backupItemName:@"com.amazonaws.MobileAnalytics.backupItem"
                                                     error:&error];
    if ( NO == result) {
        XCTFail(@"aws_atomicCopyItemAtURL failed. %@",error);
    }
    
    XCTAssertTrue([fileManager fileExistsAtPath:[testCachesPath stringByAppendingPathComponent:@"testFile"]]);
    XCTAssertTrue([fileManager fileExistsAtPath:[testAppSupportPath stringByAppendingPathComponent:@"testFile"]]);
    
    NSData *resultTestData = [NSData dataWithContentsOfFile:[testAppSupportPath stringByAppendingPathComponent:@"testFile"]];
    XCTAssertNotNil(resultTestData);
    XCTAssertEqualObjects(testData, resultTestData);
    error = nil;
    NSDictionary *resultTestDic = [NSJSONSerialization JSONObjectWithData:resultTestData options:kNilOptions error:&error];
    XCTAssertNotNil(resultTestDic);
    XCTAssertNil(error);
    
    NSString *resultUUID = resultTestDic[@"testID"];
    XCTAssertEqualObjects(uuid, resultUUID);
    
    
    //clean up
    [fileManager removeItemAtPath:testCachesPath error:nil];
    [fileManager removeItemAtPath:testAppSupportPath error:nil];
    
}
- (void)testCategoryNSString {
    NSString *inputString = @"U29tZSBpbnB1dCBzdHJpbmc="; // Base64 encoded "Some input string"
    XCTAssertTrue([inputString aws_isBase64Data]);

    inputString = @"Some input string";
    XCTAssertFalse([inputString aws_isBase64Data]);

    inputString = nil;
    XCTAssertFalse([inputString aws_isVirtualHostedStyleCompliant]);

    inputString = @"ab";
    XCTAssertFalse([inputString aws_isVirtualHostedStyleCompliant]);

    inputString = @"0123456789012345678901234567890123456789012345678901234567890123456789";
    XCTAssertFalse([inputString aws_isVirtualHostedStyleCompliant]);

    inputString = @"0123456789-";
    XCTAssertFalse([inputString aws_isVirtualHostedStyleCompliant]);

    inputString = @"0123_456789";
    XCTAssertFalse([inputString aws_isVirtualHostedStyleCompliant]);

    inputString = @"0123-.456789";
    XCTAssertFalse([inputString aws_isVirtualHostedStyleCompliant]);

    inputString = @"0123.-456789";
    XCTAssertFalse([inputString aws_isVirtualHostedStyleCompliant]);

    inputString = @"abcDefg";
    XCTAssertFalse([inputString aws_isVirtualHostedStyleCompliant]);

    inputString = @"Some random input";
    XCTAssertEqualObjects([inputString aws_md5String], @"07d2d230c1227ff3d0004abb395e8bf2");

    inputString = @"Some random input";
    XCTAssertEqualObjects([inputString aws_md5StringLittleEndian], @"cba39458a339ee8fe133ae72974471a1");
}

- (void)testCategoryNSJSONSerialization {
    NSError *error = nil;
    NSData *data = [NSJSONSerialization aws_dataWithJSONObject:@"test"
                                                       options:kNilOptions
                                                         error:&error];
    NSString *outputString = [[NSString alloc] initWithData:data
                                                   encoding:NSUTF8StringEncoding];
    XCTAssertEqualObjects(outputString, @"\"test\"");

    data = [NSJSONSerialization aws_dataWithJSONObject:nil
                                               options:kNilOptions
                                                 error:&error];
    XCTAssertNil(data);
}

- (void)testLogger {
    XCTAssertEqualObjects([[AWSLogger defaultLogger] logLevelLabel:AWSLogLevelUnknown], @"?");
    XCTAssertEqualObjects([[AWSLogger defaultLogger] logLevelLabel:AWSLogLevelNone], @"?");
    XCTAssertEqualObjects([[AWSLogger defaultLogger] logLevelLabel:AWSLogLevelError], @"Error");
    XCTAssertEqualObjects([[AWSLogger defaultLogger] logLevelLabel:AWSLogLevelWarn], @"Warn");
    XCTAssertEqualObjects([[AWSLogger defaultLogger] logLevelLabel:AWSLogLevelInfo], @"Info");
    XCTAssertEqualObjects([[AWSLogger defaultLogger] logLevelLabel:AWSLogLevelDebug], @"Debug");
    XCTAssertEqualObjects([[AWSLogger defaultLogger] logLevelLabel:AWSLogLevelVerbose], @"Verbose");
}

@end
