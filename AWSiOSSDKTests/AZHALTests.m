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

#if AWS_TEST_HAL

#import <XCTest/XCTest.h>
#import "AppStream.h"

NSString *const AWSAppStreamTestApplicationName = @"AWSSDKForiOSv2Test1";
NSString *const AWSAppStreamTestApplicationPresignedS3Url = @"https://s3.amazonaws.com/appstream-public/XStxDirectXServerInstaller_1.3.exe";

@interface AZHALTests : XCTestCase

@end

@implementation AZHALTests

static NSString *applicationName = nil;

+ (void)setUp {
    NSTimeInterval timeIntervalSinceReferenceDate = [NSDate timeIntervalSinceReferenceDate];
    applicationName = [NSString stringWithFormat:@"%@-%f", AWSAppStreamTestApplicationName, timeIntervalSinceReferenceDate];
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

+ (void)tearDown {
    [[[AWSAppStream defaultAppStream] clearCache] waitUntilFinished];
    [super tearDown];
}

- (void)testAppStream {
    AWSAppStream *appStream = [AWSAppStream defaultAppStream];

    [[[[[[appStream root] continueWithSuccessBlock:^id(BFTask *task) {
        NSLog(@"Result: [%@]", task.result);
        AWSAppStreamRoot *root = task.result;

        return [root applications];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        NSLog(@"Result: [%@]", task.result);

        AWSAppStreamApplications *applications = task.result;
        return [applications create:@{
                                      @"name" : applicationName,
                                      @"installerUrl" : AWSAppStreamTestApplicationPresignedS3Url,
                                      @"installerParameters" : @" ",
                                      @"launchCommand" : @"C:\\app\\XStxDirectXServer\\XStxDirectXServer.exe"
                                      }]; // TODO: make this a model class
    }] continueWithSuccessBlock:^id(BFTask *task) {
        NSLog(@"Result: [%@]", task.result);
        AWSAppStreamApplication *application = task.result;

        return [application status];
    }] continueWithBlock:^id(BFTask *task) {
        NSLog(@"Error: [%@]\nResult: [%@]", task.error, task.result);
        AWSAppStreamApplicationStatus *status = task.result;

        XCTAssertTrue([status.buildStep isEqualToString:@"Installing"]
                      || [status.buildStep isEqualToString:@"Copying"],
                      @"buildStep: [%@]", status.buildStep);
        XCTAssertEqualObjects(status.state, @"Building", @"state: [%@]", status.state);

        return nil;
    }] waitUntilFinished];
}

- (void)testAppStreamArchieveAllApplications {
    AWSAppStream *appStream = [AWSAppStream defaultAppStream];

    [[[[[appStream root] continueWithSuccessBlock:^id(BFTask *task) {
        AWSAppStreamRoot *root = task.result;

        return [root applications];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        AWSAppStreamApplications *applications = task.result;
        return [applications item];
    }] continueWithBlock:^id(BFTask *task) {
        NSMutableArray *taskInSequence = [NSMutableArray new];
        for (AWSAppStreamApplication *application in task.result) {
            [taskInSequence addObject:[[application status] continueWithSuccessBlock:^id(BFTask *task) {
                AWSAppStreamApplicationStatus *status = task.result;
                if ([status.state isEqualToString:@"Active"]) {
                    return [application archive];
                } else {
                    return nil;
                }
            }]];
        }

        return [BFTask taskForCompletionOfAllTasks:taskInSequence];
    }] waitUntilFinished];
}

- (void)testExample {
    NSString *HALString = @"{\"_links\":{\"self\":{\"href\":\"/orders\"},\"curies\":[{\"name\":\"ea\",\"href\":\"http://example.com/docs/rels/{rel}\",\"templated\":true}],\"next\":{\"href\":\"/orders?page=2\"},\"ea:find\":{\"href\":\"/orders{?id}\",\"templated\":true},\"ea:admin\":[{\"href\":\"/admins/2\",\"title\":\"Fred\"},{\"href\":\"/admins/5\",\"title\":\"Kate\"}]},\"currentlyProcessing\":14,\"shippedToday\":20,\"_embedded\":{\"ea:order\":[{\"_links\":{\"self\":{\"href\":\"/orders/123\"},\"ea:basket\":{\"href\":\"/baskets/98712\"},\"ea:customer\":{\"href\":\"/customers/7809\"}},\"total\":30.00,\"currency\":\"USD\",\"status\":\"shipped\"},{\"_links\":{\"self\":{\"href\":\"/orders/124\"},\"ea:basket\":{\"href\":\"/baskets/97213\"},\"ea:customer\":{\"href\":\"/customers/12369\"}},\"total\":20.00,\"currency\":\"USD\",\"status\":\"processing\"}]}}";
    NSData *HALData = [HALString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    id JSONObject = [NSJSONSerialization JSONObjectWithData:HALData
                                                    options:kNilOptions
                                                      error:&error];
    XCTAssertNil(error, @"Error: [%@]", error);
    XCTAssertNotNil(JSONObject);

    AZHALResource *HALResource = [AZHALResource resourceWithJSONObject:JSONObject];
    NSLog(@"%@", HALResource);
}

@end

#endif
