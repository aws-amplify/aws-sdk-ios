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
@import AVKit;
@import AVFoundation;

static NSString *testPollyURLBuilderKey = @"testPollyURLBuilder";

static NSString *w2cLexiconName = @"W2C";
static NSString *w2cLexicon = @"<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
"<lexicon version=\"1.0\" "
"      xmlns=\"http://www.w3.org/2005/01/pronunciation-lexicon\""
"      xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" "
"      xsi:schemaLocation=\"http://www.w3.org/2005/01/pronunciation-lexicon "
"        http://www.w3.org/TR/2007/CR-pronunciation-lexicon-20071212/pls.xsd\""
"      alphabet=\"ipa\" "
"      xml:lang=\"en-US\">"
"  <lexeme>"
"    <grapheme>W2C</grapheme>"
"    <alias>Some Random Consortium</alias>"
"  </lexeme>"
"</lexicon>";

static NSString *w3cLexiconName = @"W3C";
static NSString *w3cLexicon = @"<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
"<lexicon version=\"1.0\" "
"      xmlns=\"http://www.w3.org/2005/01/pronunciation-lexicon\""
"      xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" "
"      xsi:schemaLocation=\"http://www.w3.org/2005/01/pronunciation-lexicon "
"        http://www.w3.org/TR/2007/CR-pronunciation-lexicon-20071212/pls.xsd\""
"      alphabet=\"ipa\" "
"      xml:lang=\"en-US\">"
"  <lexeme>"
"    <grapheme>W3C</grapheme>"
"    <alias>World Wide Web Consortium</alias>"
"  </lexeme>"
"</lexicon>";

static NSDictionary<NSString *,NSString *> *lexicons;

@interface AWSPollyTests : XCTestCase

@end

@implementation AWSPollyTests

+ (void)setUp {
    lexicons = @{
                  w3cLexiconName: w3cLexicon,
                  w2cLexiconName: w2cLexicon
                  };
}

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
    [self setUpLexicon];
}

- (void)tearDown {
    [super tearDown];
    [self deleteLexicon];
}

- (void)setUpLexicon {
    AWSPolly *polly = [AWSPolly defaultPolly];

    for (NSString *lexiconName in lexicons) {
        AWSPollyPutLexiconInput *input = [AWSPollyPutLexiconInput new];
        input.content = lexicons[lexiconName];
        input.name = lexiconName;
        [[[polly putLexicon:input] continueWithBlock:^id _Nullable(AWSTask<AWSPollyPutLexiconOutput *> * _Nonnull t) {
            if (t.error) {
                XCTFail(@"Failed to create Lexicon");
            }
            return nil;
        }] waitUntilFinished];
    }
}

- (void)deleteLexicon {
    AWSPolly *polly = [AWSPolly defaultPolly];
    for (NSString *lexiconName in lexicons) {
        AWSPollyDeleteLexiconInput *input = [AWSPollyDeleteLexiconInput new];
        input.name = lexiconName;
        [polly deleteLexicon:input];
    }
    
}

- (void)testPresignedGetUrl{
    
    AWSPollySynthesizeSpeechURLBuilderRequest *request = [[AWSPollySynthesizeSpeechURLBuilderRequest alloc]init];
    [request setText:@"I agree with W3C and W2C."];
    [request setOutputFormat:AWSPollyOutputFormatMp3];
    [request setVoiceId:AWSPollyVoiceIdSalli];
    [request setLexiconNames:@[w3cLexiconName, w2cLexiconName]]; // W3C will be spoken as World Wide Web Consortium.
    [request setExpires:[NSDate dateWithTimeIntervalSinceNow:10*60]];
    
    AWSPollySynthesizeSpeechURLBuilder *builder = [AWSPollySynthesizeSpeechURLBuilder defaultPollySynthesizeSpeechURLBuilder];
    __block NSString *filePath;
    
    [[[[builder getPreSignedURL:request] continueWithBlock:^id _Nullable(AWSTask<NSURL *> * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        NSLog(@"Presigned URL: \n%@\n", task.result);
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
            filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"myfile-presigned.mp3"];
            NSLog(@"filepath = %@", filePath);
            [data writeToFile:filePath atomically:YES];
            
            dispatch_semaphore_signal(semaphore);
        }] resume];
    
        XCTAssertEqual(dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 100 * NSEC_PER_SEC)), 0);

        return nil;
    }] waitUntilFinished];
    
    // Plays the audio retrieved from Polly.
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL: [[NSURL alloc] initFileURLWithPath:filePath] error:nil];
    [player setVolume:1.0];
    [player play];
    // Add sleep to finish playback.
    sleep(5);
}

- (void)testPresignedURLGetWithSpeechMarks {
    AWSPollySynthesizeSpeechURLBuilderRequest *request = [[AWSPollySynthesizeSpeechURLBuilderRequest alloc]init];
    [request setText:@"Hello World!"];
    [request setVoiceId:AWSPollyVoiceIdAmy];
    [request setOutputFormat:AWSPollyOutputFormatJson];
    
    [request setSpeechMarkTypes:@[stringForSpeechMark(AWSPollySpeechMarkTypeSentence), stringForSpeechMark(AWSPollySpeechMarkTypeWord)]];
    [request setExpires:[NSDate dateWithTimeIntervalSinceNow:10*60]];
    
    AWSPollySynthesizeSpeechURLBuilder *builder = [AWSPollySynthesizeSpeechURLBuilder defaultPollySynthesizeSpeechURLBuilder];
    
    [[[[builder getPreSignedURL:request] continueWithBlock:^id _Nullable(AWSTask<NSURL *> * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        NSLog(@"Presigned URL: \n%@\n", task.result);
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
            
            NSString *expectedSpeechMarksResponse = @"{\"time\":0,\"type\":\"sentence\",\"start\":0,\"end\":12,\"value\":\"Hello World!\"}\
            \"{\"time\":6,\"type\":\"word\",\"start\":0,\"end\":5,\"value\":\"Hello\"}\
            \"{\"time\":354,\"type\":\"word\",\"start\":6,\"end\":11,\"value\":\"World\"}";
            
            
            NSString *speechMarksResponse = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
            NSLog(@"SpeechMarksResponse: \n%@", speechMarksResponse);
            
            XCTAssertEqual(expectedSpeechMarksResponse, expectedSpeechMarksResponse);
            
            dispatch_semaphore_signal(semaphore);
        }] resume];
        
        XCTAssertEqual(dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 100 * NSEC_PER_SEC)), 0);
        
        return nil;
    }] waitUntilFinished];
}

- (void)testSynthesize{
    AWSPollySynthesizeSpeechInput *request = [AWSPollySynthesizeSpeechInput new];
    [request setText:@"I agree with W3C and W2C."];
    [request setVoiceId:AWSPollyVoiceIdJoey];
    [request setTextType:AWSPollyTextTypeText];
    [request setOutputFormat:AWSPollyOutputFormatMp3];
    [request setLexiconNames:@[w2cLexiconName, w3cLexiconName]]; // W3C will be spoken as World Wide Web Consortium.
    
    AWSPolly *Polly = [AWSPolly defaultPolly];
    // wait for lexicons to be ready for usage
    sleep(10);
    [[[Polly synthesizeSpeech:request] continueWithBlock:^id _Nullable(AWSTask<AWSPollySynthesizeSpeechOutput *> * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        
        NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"myfile.mp3"];
        
        NSLog(@"filepath = %@", filePath);
        
        [task.result.audioStream writeToFile:filePath atomically:YES];

        // Plays the audio retrieved from Polly.
        AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithData:task.result.audioStream error:nil];
        [player setVolume:1.0];
        [player play];
        // Add sleep to finish playback.
        sleep(5);
        return nil;
    }] waitUntilFinished];
    
}

@end
