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

#import "AIDefaultRequestTests.h"
#import "AWSMockFileManager.h"

@implementation AIDefaultRequestTests

- (void)setUp
{
     
}

- (void)test_requestToString
{
    AWSMobileAnalyticsDefaultRequest *theRequest = [[AWSMobileAnalyticsDefaultRequest alloc] init];
    theRequest.url = [NSURL URLWithString:@"https://test.com/1.0/allocate"];
    theRequest.method = POST;
    theRequest.postBodyString = @"this is the body";
    
    NSString *desc = [theRequest description];

    assertThat(desc, is(notNilValue()));
    assertThatBool([desc length] > 0, is(equalToBool(YES)));
}

- (void)test_addAndRemoveHeader
{
    AWSMobileAnalyticsDefaultRequest *theRequest = [[AWSMobileAnalyticsDefaultRequest alloc] init];
    theRequest.method = GET;
    [theRequest addHeader:@"header1" forName:@"cool-HEADER_1"];
    [theRequest addHeader:@"header2" forName:@"cool-HEADER_2"];
    
    NSDictionary *headers = [[theRequest toDictionary] objectForKey:@"headers"];
    assertThat([headers objectForKey:@"cool-HEADER_1"], is(notNilValue()));
    assertThatBool([[headers objectForKey:@"cool-HEADER_1"] isEqualToString:@"header1"], is(equalToBool(YES)));
    assertThat([headers objectForKey:@"cool-HEADER_2"], is(notNilValue()));
    assertThatBool([[headers objectForKey:@"cool-HEADER_2"] isEqualToString:@"header2"], is(equalToBool(YES)));
    
    [theRequest removeHeader:@"cool-HEADER_2"];
    headers = [[theRequest toDictionary] objectForKey:@"headers"];
    assertThat([headers objectForKey:@"cool-HEADER_1"], is(notNilValue()));
    assertThatBool([[headers objectForKey:@"cool-HEADER_1"] isEqualToString:@"header1"], is(equalToBool(YES)));
    assertThat([headers objectForKey:@"cool-HEADER_2"], is(nilValue()));
}

- (void)test_addAndRetrieveParams
{
    AWSMobileAnalyticsDefaultRequest *theRequest = [[AWSMobileAnalyticsDefaultRequest alloc] init];
    theRequest.method = POST;
    [theRequest addParam:@"param1" forName:@"cool-PARAM_1"];
    [theRequest addParam:@"param2" forName:@"cool-PARAM_2"];
    
    NSDictionary *params = [[theRequest toDictionary] objectForKey:@"params"];
    assertThat([params objectForKey:@"cool-PARAM_1"], is(notNilValue()));
    assertThatBool([[params objectForKey:@"cool-PARAM_1"] isEqualToString:@"param1"], is(equalToBool(YES)));
    assertThat([params objectForKey:@"cool-PARAM_2"], is(notNilValue()));
    assertThatBool([[params objectForKey:@"cool-PARAM_2"] isEqualToString:@"param2"], is(equalToBool(YES)));
    
    assertThatBool([params isEqualToDictionary:[theRequest params]], is(equalToBool(YES)));
}

@end
