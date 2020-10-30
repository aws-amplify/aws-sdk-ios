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
#import "AWSURLRequestSerialization.h"

@interface AWSURLRequestSerializationTests : XCTestCase

@end

@implementation AWSURLRequestSerializationTests

- (void)testListTypeInURLParameters {
    NSURL *url = [NSURL URLWithString:@"https://service.us-east-1.amazonaws.com"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    NSDictionary *membersDictionary = @{
        @"MyName": @{
                @"shape": @"ResourceName",
                @"locationName": @"MyName",
                @"location" : @"uri",
                @"type" : @"string"
        },
        @"NicknameIds" : @{
                @"shape" : @"NicknameList",
                @"location" : @"querystring",
                @"locationName" : @"nickname-ids",
                @"type" : @"list"
        }
    };
    AWSJSONDictionary *rules = [[AWSJSONDictionary alloc] initWithDictionary:@{ @"members": membersDictionary }
                                                          JSONDefinitionRule:@{ @"NameRequest": @{
                                                                                        @"type": @"structure",
                                                                                        @"members": membersDictionary,
                                                                                        @"required" : @[@"NicknameIds", @"MyName"]
                                                          }}];
    NSDictionary *params = @{@"MyName": @"foobar",
                             @"NicknameIds" : @[@"a12345", @"b12345"]};
    NSError *error;
    BOOL result = [AWSXMLRequestSerializer constructURIandHeadersAndBody:request
                                                                   rules:rules
                                                              parameters:params
                                                               uriSchema:@"/api/{MyName}/latest"
                                                              hostPrefix:@"prefix."
                                                                   error:&error];
    XCTAssertTrue(result);
    XCTAssertNil(error);
    NSString *expected = @"https://prefix.service.us-east-1.amazonaws.com/api/foobar/latest?nickname-ids=a12345&nickname-ids=b12345";
    XCTAssert([request.URL.absoluteString isEqualToString:expected]);
}

- (void)testListTypeInURLParametersEmptyString {
    NSURL *url = [NSURL URLWithString:@"https://service.us-east-1.amazonaws.com"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    NSDictionary *membersDictionary = @{
        @"MyName": @{
                @"shape": @"ResourceName",
                @"locationName": @"MyName",
                @"location" : @"uri",
                @"type" : @"string"
        },
        @"NicknameIds" : @{
                @"shape" : @"NicknameList",
                @"location" : @"querystring",
                @"locationName" : @"nickname-ids",
                @"type" : @"list"
        }
    };
    AWSJSONDictionary *rules = [[AWSJSONDictionary alloc] initWithDictionary:@{ @"members": membersDictionary }
                                                          JSONDefinitionRule:@{ @"NameRequest": @{
                                                                                        @"type": @"structure",
                                                                                        @"members": membersDictionary,
                                                                                        @"required" : @[@"NicknameIds", @"MyName"]
                                                          }}];
    NSDictionary *params = @{@"MyName": @"foobar",
                             @"NicknameIds" : @[@"a12345", @"", @""]};
    NSError *error;
    BOOL result = [AWSXMLRequestSerializer constructURIandHeadersAndBody:request
                                                                   rules:rules
                                                              parameters:params
                                                               uriSchema:@"/api/{MyName}/latest"
                                                              hostPrefix:@"prefix."
                                                                   error:&error];
    XCTAssertTrue(result);
    XCTAssertNil(error);
    NSString *expected = @"https://prefix.service.us-east-1.amazonaws.com/api/foobar/latest?nickname-ids=a12345&nickname-ids=&nickname-ids=";
    XCTAssert([request.URL.absoluteString isEqualToString:expected]);
}

- (void)testListTypeInURLParametersSingleItem {
    NSURL *url = [NSURL URLWithString:@"https://service.us-east-1.amazonaws.com"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    NSDictionary *membersDictionary = @{
        @"MyName": @{
                @"shape": @"ResourceName",
                @"locationName": @"MyName",
                @"location" : @"uri",
                @"type" : @"string"
        },
        @"NicknameIds" : @{
                @"shape" : @"NicknameList",
                @"location" : @"querystring",
                @"locationName" : @"nickname-ids",
                @"type" : @"list"
        }
    };
    AWSJSONDictionary *rules = [[AWSJSONDictionary alloc] initWithDictionary:@{ @"members": membersDictionary }
                                                          JSONDefinitionRule:@{ @"NameRequest": @{
                                                                                        @"type": @"structure",
                                                                                        @"members": membersDictionary,
                                                                                        @"required" : @[@"NicknameIds", @"MyName"]
                                                          }}];
    NSDictionary *params = @{@"MyName": @"foobar",
                             @"NicknameIds" : @[@"a12345"]};
    NSError *error;
    BOOL result = [AWSXMLRequestSerializer constructURIandHeadersAndBody:request
                                                                   rules:rules
                                                              parameters:params
                                                               uriSchema:@"/api/{MyName}/latest"
                                                              hostPrefix:@"prefix."
                                                                   error:&error];
    XCTAssertTrue(result);
    XCTAssertNil(error);
    NSString *expected = @"https://prefix.service.us-east-1.amazonaws.com/api/foobar/latest?nickname-ids=a12345";
    XCTAssert([request.URL.absoluteString isEqualToString:expected]);
}

- (void)testListTypeInURLParametersNoItems {
    NSURL *url = [NSURL URLWithString:@"https://service.us-east-1.amazonaws.com"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    NSDictionary *membersDictionary = @{
        @"MyName": @{
                @"shape": @"ResourceName",
                @"locationName": @"MyName",
                @"location" : @"uri",
                @"type" : @"string"
        },
        @"NicknameIds" : @{
                @"shape" : @"NicknameList",
                @"location" : @"querystring",
                @"locationName" : @"nickname-ids",
                @"type" : @"list"
        }
    };
    AWSJSONDictionary *rules = [[AWSJSONDictionary alloc] initWithDictionary:@{ @"members": membersDictionary }
                                                          JSONDefinitionRule:@{ @"NameRequest": @{
                                                                                        @"type": @"structure",
                                                                                        @"members": membersDictionary,
                                                                                        @"required" : @[@"NicknameIds", @"MyName"]
                                                          }}];
    NSDictionary *params = @{@"MyName": @"foobar",
                             @"NicknameIds" : @[]};
    NSError *error;
    BOOL result = [AWSXMLRequestSerializer constructURIandHeadersAndBody:request
                                                                   rules:rules
                                                              parameters:params
                                                               uriSchema:@"/api/{MyName}/latest"
                                                              hostPrefix:@"prefix."
                                                                   error:&error];
    XCTAssertTrue(result);
    XCTAssertNil(error);
    NSString *expected = @"https://prefix.service.us-east-1.amazonaws.com/api/foobar/latest";
    XCTAssert([request.URL.absoluteString isEqualToString:expected]);
}
@end
