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

#import "AIBufferedReaderTests.h"
#import "AWSMobileAnalyticsBufferedReader.h"
#import "AWSMobileAnalyticsErrorUtils.h"
#import "AWSMockFileManager.h"

@implementation AIBufferedReaderTests

- (void)setUp
{
     
}

-(void)readFromReader:(AWSMobileAnalyticsBufferedReader*)reader
 andVerifySuccessWith:(BOOL)expectedSuccess
    andVerifyLineWith:(NSString*)expectedLineRead
   andVerifyErrorCode:(NSNumber*)expectedErrorCode
{
    NSString* lineRead = nil;
    NSError* error = nil;
    
    BOOL success = [reader readLine:&lineRead withError:&error];
    
    assertThatBool(success, equalToBool(expectedSuccess));
    
    if(expectedLineRead)
    {
        assertThat(lineRead, is(expectedLineRead));
    }
    else
    {
        assertThat(lineRead, is(nilValue()));
    }
    
    if(expectedErrorCode != nil)
    {
        assertThatInteger([error code], equalToInteger([expectedErrorCode integerValue]));
    }
    else
    {
        assertThat(error, is(nilValue()));
    }

}

-(void)test_readLine_newLineAtEnd_returnFinalStringThenNil
{
    NSData* mockInput = [@"Hello\nmy\nname\nis\nbob\n" dataUsingEncoding:NSUTF8StringEncoding];
    NSInputStream* inputStream = [NSInputStream inputStreamWithData:mockInput];
    [inputStream open];
     
    
    AWSMobileAnalyticsBufferedReader* reader = [AWSMobileAnalyticsBufferedReader readerWithInputStream:inputStream];
    
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:@"Hello" andVerifyErrorCode:nil];
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:@"my" andVerifyErrorCode:nil];
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:@"name" andVerifyErrorCode:nil];
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:@"is" andVerifyErrorCode:nil];
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:@"bob" andVerifyErrorCode:nil];
    
    // no more data, so we should get a successful call with a nil string to signal end of stream
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:nil andVerifyErrorCode:nil];
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:nil andVerifyErrorCode:nil];
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:nil andVerifyErrorCode:nil];
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:nil andVerifyErrorCode:nil];
    
    // now that the buffer is at end, we need to close the object
    [reader close];
    
    // any calls after this are errors
    [self readFromReader:reader andVerifySuccessWith:NO andVerifyLineWith:nil andVerifyErrorCode:[NSNumber numberWithInt:AWSBufferedReaderErrorCode_IOStreamClosed]];
    [self readFromReader:reader andVerifySuccessWith:NO andVerifyLineWith:nil andVerifyErrorCode:[NSNumber numberWithInt:AWSBufferedReaderErrorCode_IOStreamClosed]];
    [self readFromReader:reader andVerifySuccessWith:NO andVerifyLineWith:nil andVerifyErrorCode:[NSNumber numberWithInt:AWSBufferedReaderErrorCode_IOStreamClosed]];
}

-(void)test_readLine_noNewLineAtEnd_returnFinalStringThenNil
{
    NSData* mockInput = [@"Hello\nmy\nname\nis\nbob" dataUsingEncoding:NSUTF8StringEncoding];
    NSInputStream* inputStream = [NSInputStream inputStreamWithData:mockInput];
    [inputStream open];
    
    
    AWSMobileAnalyticsBufferedReader* reader = [AWSMobileAnalyticsBufferedReader readerWithInputStream:inputStream];
    
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:@"Hello" andVerifyErrorCode:nil];
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:@"my" andVerifyErrorCode:nil];
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:@"name" andVerifyErrorCode:nil];
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:@"is" andVerifyErrorCode:nil];
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:@"bob" andVerifyErrorCode:nil];
    
    // no more data, so we should get a successful call with a nil string to signal end of stream
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:nil andVerifyErrorCode:nil];
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:nil andVerifyErrorCode:nil];
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:nil andVerifyErrorCode:nil];
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:nil andVerifyErrorCode:nil];
    
    // now that the buffer is at end, we need to close the object
    [reader close];
    
    // any calls after this are errors
    [self readFromReader:reader andVerifySuccessWith:NO andVerifyLineWith:nil andVerifyErrorCode:[NSNumber numberWithInt:AWSBufferedReaderErrorCode_IOStreamClosed]];
    [self readFromReader:reader andVerifySuccessWith:NO andVerifyLineWith:nil andVerifyErrorCode:[NSNumber numberWithInt:AWSBufferedReaderErrorCode_IOStreamClosed]];
    [self readFromReader:reader andVerifySuccessWith:NO andVerifyLineWith:nil andVerifyErrorCode:[NSNumber numberWithInt:AWSBufferedReaderErrorCode_IOStreamClosed]];
}

-(void)test_readingFromInputStream_multipleReadsRequired
{
    NSData* mockInput = [@"This string requires more stream reads\nbecause there is no newline\nchar" dataUsingEncoding:NSUTF8StringEncoding];
    NSInputStream* inputStream = [NSInputStream inputStreamWithData:mockInput];
    [inputStream open];
    
    // create a small buffer to ensure the reader has to pull from the stream many times
    AWSMobileAnalyticsBufferedReader* reader = [AWSMobileAnalyticsBufferedReader readerWithInputStream:inputStream
                                                      withBufferLength:5];
    
    
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:@"This string requires more stream reads" andVerifyErrorCode:nil];
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:@"because there is no newline" andVerifyErrorCode:nil];
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:@"char" andVerifyErrorCode:nil];
    
    // no more data, so we should get a successful call with a nil string to signal end of stream
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:nil andVerifyErrorCode:nil];
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:nil andVerifyErrorCode:nil];
    
    // now that the buffer is at end, we need to close the object
    [reader close];
    
    // any calls after this are errors
    [self readFromReader:reader andVerifySuccessWith:NO andVerifyLineWith:nil andVerifyErrorCode:[NSNumber numberWithInt:AWSBufferedReaderErrorCode_IOStreamClosed]];
}

-(void)testReadingFromInputStream_largeMultibytesCharacters {
    
    //create a string with multi bytes characters in it (e.g. Chinese Characters)
    NSString *chineseString = @"𐍈今天是个好天气€";
    
    NSMutableString* longChineseString = [NSMutableString stringWithCapacity:100000];
    for(int i = 0; i < 100000; i++)
    {
        [longChineseString appendString:chineseString];
        [longChineseString appendString:@"\n"];
        
    }
    
    NSData* mockInput = [longChineseString dataUsingEncoding:NSUTF8StringEncoding];
    NSInputStream* inputStream = [NSInputStream inputStreamWithData:mockInput];
    [inputStream open];
    
    
    AWSMobileAnalyticsBufferedReader* reader = [AWSMobileAnalyticsBufferedReader readerWithInputStream:inputStream];
    
    for(int i = 0; i < 100000; i++)
    {
        [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:chineseString andVerifyErrorCode:nil];
    }
    
    // no more data, so we should get a successful call with a nil string to signal end of stream
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:nil andVerifyErrorCode:nil];
    
    // now that the buffer is at end, we need to close the object
    [reader close];
    
    // any calls after this are errors
    [self readFromReader:reader andVerifySuccessWith:NO andVerifyLineWith:nil andVerifyErrorCode:[NSNumber numberWithInt:AWSBufferedReaderErrorCode_IOStreamClosed]];
    
}

-(void)testReadingFromInputStream_largeStream
{
    // create a string with all the ascii codes in it
    NSMutableString* asciiString = [NSMutableString stringWithCapacity:94];
    for(int i = 32; i < 126; i++)
    {
        [asciiString appendFormat:@"%c", i];
    }
    
    NSMutableString* longString = [NSMutableString stringWithCapacity:100000];
    for(int i = 0; i < 100000; i++)
    {
        [longString appendString:asciiString];
        [longString appendString:@"\n"];
        
    }
    
    NSData* mockInput = [longString dataUsingEncoding:NSUTF8StringEncoding];
    NSInputStream* inputStream = [NSInputStream inputStreamWithData:mockInput];
    [inputStream open];
    
    
    AWSMobileAnalyticsBufferedReader* reader = [AWSMobileAnalyticsBufferedReader readerWithInputStream:inputStream];
    
    for(int i = 0; i < 100000; i++)
    {
        [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:asciiString andVerifyErrorCode:nil];
    }
    
    // no more data, so we should get a successful call with a nil string to signal end of stream
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:nil andVerifyErrorCode:nil];
    
    // now that the buffer is at end, we need to close the object
    [reader close];
    
    // any calls after this are errors
    [self readFromReader:reader andVerifySuccessWith:NO andVerifyLineWith:nil andVerifyErrorCode:[NSNumber numberWithInt:AWSBufferedReaderErrorCode_IOStreamClosed]];
}

-(void)test_close_afterClosing_allReadsAreErrors
{
    NSData* mockInput = [@"Hello\nmy\nname\nis\nbob\n" dataUsingEncoding:NSUTF8StringEncoding];
    NSInputStream* inputStream = [NSInputStream inputStreamWithData:mockInput];
    [inputStream open];
    
    
    AWSMobileAnalyticsBufferedReader* reader = [AWSMobileAnalyticsBufferedReader readerWithInputStream:inputStream];
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:@"Hello" andVerifyErrorCode:nil];
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:@"my" andVerifyErrorCode:nil];
    [self readFromReader:reader andVerifySuccessWith:YES andVerifyLineWith:@"name" andVerifyErrorCode:nil];
    
    [reader close];
    
    // any calls after this are errors
    [self readFromReader:reader andVerifySuccessWith:NO andVerifyLineWith:nil andVerifyErrorCode:[NSNumber numberWithInt:AWSBufferedReaderErrorCode_IOStreamClosed]];
    [self readFromReader:reader andVerifySuccessWith:NO andVerifyLineWith:nil andVerifyErrorCode:[NSNumber numberWithInt:AWSBufferedReaderErrorCode_IOStreamClosed]];
    [self readFromReader:reader andVerifySuccessWith:NO andVerifyLineWith:nil andVerifyErrorCode:[NSNumber numberWithInt:AWSBufferedReaderErrorCode_IOStreamClosed]];
    
}

@end
