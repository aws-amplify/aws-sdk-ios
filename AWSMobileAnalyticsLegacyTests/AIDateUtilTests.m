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

#import "AIDateUtilTests.h"
#import "AWSMobileAnalyticsDateUtils.h"
#import "AWSMockFileManager.h"

static UTCTimeMillis TIME_STAMP = 1370111901909l; // Sat, 01 Jun 2013 18:38:21 GMT
static NSString* ISO_DATE_TIME_STAMP = @"2013-06-01T18:38:21.909Z";
static NSString* ISO_8061_DATE_STAMP = @"20130601";
static NSString* ISO_8061_DATE_TIME = @"20130601T183821Z";

@implementation AIDateUtilTests

- (void)setUp
{
     
}

-(void)test_isoDateTimeWithTimestamp
{
    assertThat([AWSMobileAnalyticsDateUtils isoDateTimeWithTimestamp:TIME_STAMP], is(equalTo(ISO_DATE_TIME_STAMP)));
}

-(void)test_isoDateTime
{
    NSTimeInterval timeStampSeconds = ((NSTimeInterval)TIME_STAMP)/1000;
    NSDate* pastDate = [NSDate dateWithTimeIntervalSince1970:timeStampSeconds];
    
    assertThat([AWSMobileAnalyticsDateUtils isoDateTime:pastDate], is(equalTo(ISO_DATE_TIME_STAMP)));
}

-(void) test_utcTimeMillisFromDate
{
    NSTimeInterval timeStampSeconds = ((NSTimeInterval)TIME_STAMP)/1000;
    NSDate* pastDate = [NSDate dateWithTimeIntervalSince1970:timeStampSeconds];
    
    assertThatLongLong([AWSMobileAnalyticsDateUtils utcTimeMillisFromDate:pastDate], is(equalToLongLong(TIME_STAMP)));
}

-(void)test_iso8061FormatDateStamp
{
    NSTimeInterval timeStampSeconds = ((NSTimeInterval)TIME_STAMP)/1000;
    NSDate* pastDate = [NSDate dateWithTimeIntervalSince1970:timeStampSeconds];
    
    assertThat([AWSMobileAnalyticsDateUtils iso8061FormatDateStamp:pastDate], is(equalTo(ISO_8061_DATE_STAMP)));
}

-(void)test_iso8061FormatDateTime
{
    NSTimeInterval timeStampSeconds = ((NSTimeInterval)TIME_STAMP)/1000;
    NSDate* pastDate = [NSDate dateWithTimeIntervalSince1970:timeStampSeconds];
    
    assertThat([AWSMobileAnalyticsDateUtils iso8061FormatDateTime:pastDate], is(equalTo(ISO_8061_DATE_TIME)));
}

-(void)test_dateFromUtcMillis
{
    NSTimeInterval timeStampSeconds = ((NSTimeInterval)TIME_STAMP)/1000;
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:timeStampSeconds];
    
    assertThat([AWSMobileAnalyticsDateUtils dateFromutcTimeMillis:TIME_STAMP], is(equalTo(date)));
}
@end
