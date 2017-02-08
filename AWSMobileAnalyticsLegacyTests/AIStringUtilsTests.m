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

#import "AIStringUtilsTests.h"
#import "AWSMobileAnalyticsStringUtils.h"
#import "AWSMockFileManager.h"

@implementation AIStringUtilsTests

- (void)setUp
{
     
}

- (void) testTrimString
{
    assertThat([AWSMobileAnalyticsStringUtils trimString:@"ABCDEFGH" toLength:8 orPadWith:'_'], is(equalTo(@"ABCDEFGH")));
    assertThat([AWSMobileAnalyticsStringUtils trimString:@"ABCDEFGH" toLength:7 orPadWith:'_'], is(equalTo(@"BCDEFGH")));
    assertThat([AWSMobileAnalyticsStringUtils trimString:@"ABCDEFGH" toLength:6 orPadWith:'_'], is(equalTo(@"CDEFGH")));
    assertThat([AWSMobileAnalyticsStringUtils trimString:@"ABCDEFGH" toLength:5 orPadWith:'_'], is(equalTo(@"DEFGH")));
    assertThat([AWSMobileAnalyticsStringUtils trimString:@"ABCDEFGH" toLength:4 orPadWith:'_'], is(equalTo(@"EFGH")));
    assertThat([AWSMobileAnalyticsStringUtils trimString:@"ABCDEFGH" toLength:3 orPadWith:'_'], is(equalTo(@"FGH")));
    assertThat([AWSMobileAnalyticsStringUtils trimString:@"ABCDEFGH" toLength:2 orPadWith:'_'], is(equalTo(@"GH")));
    assertThat([AWSMobileAnalyticsStringUtils trimString:@"ABCDEFGH" toLength:1 orPadWith:'_'], is(equalTo(@"H")));
    assertThat([AWSMobileAnalyticsStringUtils trimString:@"ABCDEFGH" toLength:0 orPadWith:'_'], is(equalTo(@"")));
}

- (void) testTrimStringWithPadding
{
    assertThat([AWSMobileAnalyticsStringUtils trimString:@"ABC" toLength:8 orPadWith:'_'], is(equalTo(@"_____ABC")));
    assertThat([AWSMobileAnalyticsStringUtils trimString:@"ABC" toLength:7 orPadWith:'-'], is(equalTo(@"----ABC")));
    assertThat([AWSMobileAnalyticsStringUtils trimString:@"ABC" toLength:6 orPadWith:'"'], is(equalTo(@"\"\"\"ABC")));
    assertThat([AWSMobileAnalyticsStringUtils trimString:@"ABC" toLength:5 orPadWith:'\\'], is(equalTo(@"\\\\ABC")));
    assertThat([AWSMobileAnalyticsStringUtils trimString:@"ABC" toLength:4 orPadWith:'\''], is(equalTo(@"'ABC")));
    assertThat([AWSMobileAnalyticsStringUtils trimString:@"ABC" toLength:3 orPadWith:'_'], is(equalTo(@"ABC")));
    
    assertThat([AWSMobileAnalyticsStringUtils trimString:@"" toLength:5 orPadWith:'\\'], is(equalTo(@"\\\\\\\\\\")));
    assertThat([AWSMobileAnalyticsStringUtils trimString:@"" toLength:10 orPadWith:'#'], is(equalTo(@"##########")));
    assertThat([AWSMobileAnalyticsStringUtils trimString:@"\b\b" toLength:5 orPadWith:'_'], is(equalTo(@"___\b\b")));
    
    //- Asserts that for a (originally empty) padded string of length l, all char's are the padding char
    int l = 100;
    NSString *s = [AWSMobileAnalyticsStringUtils trimString:@"" toLength:l orPadWith:'@'];
    for (int i = 0; i < l; i++)
    {
        assertThat([s substringWithRange:NSMakeRange(i, 1)], is(equalTo(@"@")));
    }
}

- (void) testTrimStringWithInvalidArgs
{
    assertThat([AWSMobileAnalyticsStringUtils trimString:nil toLength:8 orPadWith:'_'], is(equalTo(@"________")));
    assertThat([AWSMobileAnalyticsStringUtils trimString:nil toLength:-1 orPadWith:'_'], is(equalTo(@"")));
    assertThat([AWSMobileAnalyticsStringUtils trimString:@"ABCDEFGH" toLength:0 orPadWith:'_'], is(equalTo(@"")));
    assertThat([AWSMobileAnalyticsStringUtils trimString:@"ABCDEFGH" toLength:5 orPadWith:'_'], is(equalTo(@"DEFGH")));
}

- (void) test_appendString
{
    assertThat([AWSMobileAnalyticsStringUtils appendTo:@"first" theString:nil], is(equalTo(@"first")));
    assertThat([AWSMobileAnalyticsStringUtils appendTo:@"first" theString:@""], is(equalTo(@"first")));
    assertThat([AWSMobileAnalyticsStringUtils appendTo:@"first" theString:[NSString string]], is(equalTo(@"first")));
    assertThat([AWSMobileAnalyticsStringUtils appendTo:nil theString:@"second"], is(equalTo(@"second")));
    assertThat([AWSMobileAnalyticsStringUtils appendTo:@"" theString:@"second"], is(equalTo(@"second")));
    assertThat([AWSMobileAnalyticsStringUtils appendTo:[NSString string] theString:@"second"], is(equalTo(@"second")));
    assertThat([AWSMobileAnalyticsStringUtils appendTo:@"first" theString:@"second"], is(equalTo(@"firstsecond")));
    
    assertThat([AWSMobileAnalyticsStringUtils appendTo:@"first" theString:@"second" withFormat:@"-%@"], is(equalTo(@"first-second")));
}

@end
