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

#import <XCTest/XCTest.h>
#import "AWSTestUtility.h"
#import "AWSPolly.h"

static NSString *testPollyURLBuilderKey = @"testPollyURLBuilder";

@interface AWSPollyTests : XCTestCase

@end

@implementation AWSPollyTests

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testPresignedGetUrl{
    
    AWSPollySynthesizeSpeechURLBuilderRequest *request = [[AWSPollySynthesizeSpeechURLBuilderRequest alloc]init];
    [request setText:@"Hello World!"];
    [request setOutputFormat:AWSPollyOutputFormatMp3];
    [request setVoiceId:AWSPollyVoiceIdGwyneth];
    [request setExpires:[NSDate dateWithTimeIntervalSinceNow:10*60]];
    
    AWSPollySynthesizeSpeechURLBuilder *builder = [AWSPollySynthesizeSpeechURLBuilder defaultPollySynthesizeSpeechURLBuilder];
    
    [[[[builder getPreSignedURL:request] continueWithBlock:^id _Nullable(AWSTask<NSURL *> * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        return task;
    }] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:task.result];
        request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            XCTAssertNil(error, @"response contains error:%@,\n presigned URL is:%@",error,((NSURL *)task.result).absoluteString);
            
            if (((NSHTTPURLResponse *)response).statusCode < 200 || ((NSHTTPURLResponse *)response).statusCode >=300) {
                XCTFail(@"response status Code is :%ld",(long)((NSHTTPURLResponse *)response).statusCode);
                NSLog(@"response data is:\n%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
            }
            
            NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"myfile-presigned.mp3"];
            
            NSLog(@"filepath = %@", filePath);
            
            [data writeToFile:filePath atomically:YES];
            
            dispatch_semaphore_signal(semaphore);
        }] resume];
    
        XCTAssertEqual(dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 100 * NSEC_PER_SEC)), 0);
        
        return nil;
    }] waitUntilFinished];
}

- (void)testSynthesize{
    AWSPollySynthesizeSpeechInput *request = [AWSPollySynthesizeSpeechInput new];
    [request setText:@"Hello World"];
    [request setVoiceId:AWSPollyVoiceIdSalli];
    [request setTextType:AWSPollyTextTypeText];
    [request setOutputFormat:AWSPollyOutputFormatMp3];
    
    AWSPolly *Polly = [AWSPolly defaultPolly];
    [[[Polly synthesizeSpeech:request] continueWithBlock:^id _Nullable(AWSTask<AWSPollySynthesizeSpeechOutput *> * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        
        NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"myfile.mp3"];
        
        NSLog(@"filepath = %@", filePath);
        
        [task.result.audioStream writeToFile:filePath atomically:YES];
        
        return nil;
    }] waitUntilFinished];
    
}

@end
