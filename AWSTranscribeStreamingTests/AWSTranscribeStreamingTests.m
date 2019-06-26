//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import <AWSTranscribeStreaming/AWSTranscribeStreaming.h>

@interface AWSTranscribeStreamingTests : XCTestCase

@end

@implementation AWSTranscribeStreamingTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    AWSStaticCredentialsProvider *credsProvider = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:@"ACCESSKEY" secretKey:@"SECRET"];
    AWSServiceConfiguration *config = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:credsProvider];
    [AWSTranscribeStreaming registerTranscribeStreamingWithConfiguration:config forKey:@"USWest2TranscribeStreaming"];
    
    AWSDDLog.sharedInstance.logLevel  = AWSDDLogLevelDebug;
    [AWSDDLog addLogger:[AWSDDTTYLogger sharedInstance]]; // TTY = Xcode console
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    AWSTranscribeStreaming *TranscribeStreaming = [AWSTranscribeStreaming TranscribeStreamingForKey:@"USWest2TranscribeStreaming"];
    AWSTranscribeStreamingStartStreamTranscriptionRequest *request = [AWSTranscribeStreamingStartStreamTranscriptionRequest new];
    
    request.languageCode = AWSTranscribeStreamingLanguageCodeEnUS;
    request.mediaEncoding = AWSTranscribeStreamingMediaEncodingPcm;
    request.mediaSampleRateHertz = @(16000);
    
    AWSSRWebSocket *webSocket = [TranscribeStreaming startTranscriptionWSS:request];
    
    sleep(1);
    
    NSString *path = [[NSBundle bundleForClass:[AWSTranscribeStreaming class]] pathForResource:@"hello3" ofType:@"wav"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:path];
    AWSDDLogDebug(@"%@", soundFileURL);
    
    NSData *audioData = [NSData dataWithContentsOfURL:soundFileURL];
    
    NSDictionary<NSString *, NSString *> *headers = @{
                                                      @":content-type": @"audio/wav",
                                                      @":message-type": @"event",
                                                      @":event-type": @"AudioEvent"
                                                      };
    NSInteger startPos = 0;
    NSInteger chunkSize = 4096;
    NSInteger nextSize =  MIN(chunkSize, ([audioData length] - startPos));
    while (startPos < [audioData length]) {
        [webSocket send:[AWSTranscribeEventEncoder encodeChunk:[audioData subdataWithRange:NSMakeRange(startPos, nextSize)]
                                                            headers:headers]];
        startPos = startPos + nextSize;
        nextSize = MIN(chunkSize, ([audioData length] - startPos));
        
    }
    [webSocket send:[AWSTranscribeEventEncoder getEndFrameData]];
    
    sleep(100);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
