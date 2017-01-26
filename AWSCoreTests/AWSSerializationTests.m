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
#import "AWSCore.h"
#import "AWSSerialization.h"
#import "AWSCognitoIdentityResources.h"

@interface AWSSerializationTests : XCTestCase

@end

@implementation AWSSerializationTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (NSDictionary *)loadDefinitionFile:(NSString *)fileName {
    
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:fileName ofType:@"json"];
    NSError *error = nil;
    return [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                           options:NSJSONReadingMutableContainers
                                             error:&error];
}

- (void)testJSONBuilderFailed {
    NSError *error = nil;
    NSDictionary *params = @{@"testKey":@"testValue"};
    NSData *jsonData = [AWSJSONBuilder jsonDataForDictionary:params
                                                  actionName:@""
                                       serviceDefinitionRule:[[AWSCognitoIdentityResources sharedInstance] JSONObject]
                                                       error:&error];
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
    XCTAssertEqualObjects(@{},jsonDic);
    
    XCTAssertNotNil(error);
    XCTAssertEqualObjects(AWSJSONBuilderErrorDomain, error.domain);
    XCTAssertEqual(AWSJSONBuilderUndefinedActionRule, error.code);
    XCTAssertEqualObjects(@"Invalid argument: actionRule is Empty", error.localizedDescription);
}

- (void)testJSONParserFailed {
    NSError *error = nil;
    NSArray *params = @[@"1",@"B"];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:0 error:nil];
    
    //create mockResponse
    NSInteger statusCode = 200;
    NSHTTPURLResponse *mockResponse = [[NSHTTPURLResponse alloc] initWithURL:[NSURL URLWithString:@"/"] statusCode:statusCode HTTPVersion:@"HTTP/1.1" headerFields:nil];
    
    NSDictionary *jsonDic = [AWSJSONParser dictionaryForJsonData:jsonData
                                                        response:mockResponse
                                                      actionName:@"GetIdentityPoolRoles"
                                           serviceDefinitionRule:[[AWSCognitoIdentityResources sharedInstance] JSONObject]
                                                           error:&error];
    
    XCTAssertEqualObjects(@{},jsonDic);
    
    XCTAssertNotNil(error);
    XCTAssertEqualObjects(AWSJSONParserErrorDomain, error.domain);
    XCTAssertEqual(AWSJSONParserInvalidParameter, error.code);
}

//- (void)testXMLBuilderFailed {
//    NSError *error = nil;
//    NSDictionary *params = @{@"testKey":@"testValue"};
//    NSString *xmlString = [AWSXMLBuilder xmlStringForDictionary:params
//                                                     actionName:@""
//                                          serviceDefinitionRule:[self loadDefinitionFile:@"s3-2006-03-01"]
//                                                          error:&error];
//    XCTAssertEqualObjects(nil,xmlString);
//    
//    XCTAssertNotNil(error);
//    XCTAssertEqualObjects(AWSXMLBuilderErrorDomain, error.domain);
//    XCTAssertEqual(AWSXMLBuilderUndefinedActionRule, error.code);
//    
//    NSError *error1 = nil;
//    [AWSXMLBuilder xmlStringForDictionary:params
//                               actionName:@""
//                    serviceDefinitionRule:nil
//                                    error:&error1];
//    XCTAssertNotNil(error1);
//    XCTAssertEqual(AWSXMLBuilderDefinitionFileIsEmpty, error1.code);
//}
//
//- (void)testXMLParserFailed {
//    NSError *error = nil;
//    NSString *xmlString = @"<Grants>test</Grants>";
//    [[AWSXMLParser sharedInstance] dictionaryForXMLData:[xmlString dataUsingEncoding:NSUTF8StringEncoding]
//                                             actionName:@"GetBucketAcl"
//                                  serviceDefinitionRule:[self loadDefinitionFile:@"s3-2006-03-01"]
//                                                  error:&error];
//    
//    XCTAssertNotNil(error);
//    XCTAssertEqualObjects(AWSXMLParserErrorDomain, error.domain);
//    XCTAssertEqual(AWSXMLParserUnExpectedType, error.code);
//}
//
//- (void)testQueryParamBuilderFailed {
//    NSError *error = nil;
//    NSDictionary *params = @{@"AutoScalingGroupNames":@"testValue"};
//    NSDictionary *resultDic = [AWSQueryParamBuilder buildFormattedParams:params
//                                                              actionName:nil
//                                                   serviceDefinitionRule:[self loadDefinitionFile:@"autoscaling-2011-01-01"]
//                                                                   error:&error];
//    
//    XCTAssertEqualObjects(nil, resultDic);
//    XCTAssertNotNil(error);
//    XCTAssertEqualObjects(AWSQueryParamBuilderErrorDomain, error.domain);
//    XCTAssertEqual(AWSQueryParamBuilderUndefinedActionRule, error.code);
//    
//}
//
//- (void)testEC2ParamBuilderFailed {
//    NSError *error = nil;
//    NSDictionary *params = @{@"AutoScalingGroupNames":@"testValue"};
//    NSDictionary *resultDic = [AWSEC2ParamBuilder buildFormattedParams:params
//                                                            actionName:nil
//                                                 serviceDefinitionRule:[self loadDefinitionFile:@"ec2-2014-09-01"]
//                                                                 error:&error];
//    XCTAssertEqualObjects(nil, resultDic);
//    XCTAssertNotNil(error);
//    XCTAssertEqualObjects(AWSEC2ParamBuilderErrorDomain, error.domain);
//    XCTAssertEqual(AWSEC2ParamBuilderUndefinedActionRule, error.code);
//}
//
//- (void)testJSONSerializerInitialization {
//    
//    AWSJSONRequestSerializer *jsonRS1 = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:nil
//                                                                                      actionName:@"actionName"];
//    XCTAssertNil(jsonRS1);
//    
//    AWSJSONRequestSerializer *jsonRS2 = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:nil
//                                                                                      actionName:@"actionName"];
//    XCTAssertNil(jsonRS2);
//    
//    AWSJSONRequestSerializer *jsonRS3 = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSCognitoIdentityResources sharedInstance] JSONObject]
//                                                                                      actionName:@"actionName"];
//    XCTAssertNotNil(jsonRS3);
//    
//    
//    AWSJSONResponseSerializer *jsonResSerializer1 = [[AWSJSONResponseSerializer alloc] initWithJSONDefinition:nil
//                                                                                                   actionName:@"actionName"
//                                                                                                  outputClass:nil];
//    XCTAssertNil(jsonResSerializer1);
//    
//    AWSJSONResponseSerializer *jsonResSerializer2 = [[AWSJSONResponseSerializer alloc] initWithJSONDefinition:nil
//                                                                                                   actionName:@"actionName"
//                                                                                                  outputClass:nil];
//    XCTAssertNil(jsonResSerializer2);
//    
//    AWSJSONResponseSerializer *jsonResSerializer3 = [[AWSJSONResponseSerializer alloc] initWithJSONDefinition:[[AWSCognitoIdentityResources sharedInstance] JSONObject]
//                                                                                                   actionName:@"actionName"
//                                                                                                  outputClass:nil];
//    XCTAssertNotNil(jsonResSerializer3);
//    
//}
//
//- (void)testXMLSerializerInitialization {
//    
//    AWSXMLRequestSerializer *xmlRequestSerializer1 = [[AWSXMLRequestSerializer alloc] initWithJSONDefinition:nil
//                                                                                                  actionName:@"actionName"];
//    XCTAssertNil(xmlRequestSerializer1);
//    
//    AWSXMLRequestSerializer *xmlRequestSerializer2 = [[AWSXMLRequestSerializer alloc] initWithJSONDefinition:nil
//                                                                                                  actionName:@"actionName"];
//    XCTAssertNil(xmlRequestSerializer2);
//    
//    AWSXMLRequestSerializer *xmlRequestSerializer3 = [[AWSXMLRequestSerializer alloc] initWithJSONDefinition:[self loadDefinitionFile:@"s3-2006-03-01"]
//                                                                                                  actionName:@"actionName"];
//    XCTAssertNotNil(xmlRequestSerializer3);
//    
//    AWSXMLResponseSerializer *xmlResponseSerializer1 = [[AWSXMLResponseSerializer alloc] initWithJSONDefinition:nil
//                                                                                                     actionName:@"actionName3"
//                                                                                                    outputClass:nil];
//    XCTAssertNil(xmlResponseSerializer1);
//    
//    AWSXMLResponseSerializer *xmlResponseSerializer2 = [[AWSXMLResponseSerializer alloc] initWithJSONDefinition:nil
//                                                                                                     actionName:@"actionName3"
//                                                                                                    outputClass:nil];
//    XCTAssertNil(xmlResponseSerializer2);
//    
//    AWSXMLResponseSerializer *xmlResponseSerializer3 = [[AWSXMLResponseSerializer alloc] initWithJSONDefinition:[self loadDefinitionFile:@"s3-2006-03-01"]
//                                                                                                     actionName:@"actionName3"
//                                                                                                    outputClass:nil];
//    XCTAssertNotNil(xmlResponseSerializer3);
//}
//
//- (void)testQueryStringSerializerInitialization {
//    
//    AWSQueryStringRequestSerializer *queryReqSerializer1 = [[AWSQueryStringRequestSerializer alloc] initWithJSONDefinition:nil
//                                                                                                                actionName:@"actionName"];
//    XCTAssertNil(queryReqSerializer1);
//    
//    AWSQueryStringRequestSerializer *queryReqSerializer2 = [[AWSQueryStringRequestSerializer alloc] initWithJSONDefinition:nil
//                                                                                                                actionName:@"actionName"];
//    XCTAssertNil(queryReqSerializer2);
//    
//    AWSQueryStringRequestSerializer *queryReqSerializer3 = [[AWSQueryStringRequestSerializer alloc] initWithJSONDefinition:[self loadDefinitionFile:@"autoscaling-2011-01-01"]
//                                                                                                                actionName:@"actionName"];
//    XCTAssertNotNil(queryReqSerializer3);
//}
//
//- (void)testEC2RequestSerializerInitialization {
//    
//    AWSEC2RequestSerializer *ec2ReqSerializer1 = [[AWSEC2RequestSerializer alloc] initWithJSONDefinition:nil
//                                                                                              actionName:@"actionName"];
//    XCTAssertNil(ec2ReqSerializer1);
//    
//    AWSEC2RequestSerializer *ec2ReqSerializer2 = [[AWSEC2RequestSerializer alloc] initWithJSONDefinition:nil
//                                                                                              actionName:@"actionName"];
//    XCTAssertNil(ec2ReqSerializer2);
//    
//    AWSEC2RequestSerializer *ec2ReqSerializer3 = [[AWSEC2RequestSerializer alloc] initWithJSONDefinition:[self loadDefinitionFile:@"ec2-2014-09-01"]
//                                                                                              actionName:@"actionName"];
//    XCTAssertNotNil(ec2ReqSerializer3);
//    
//}

@end
