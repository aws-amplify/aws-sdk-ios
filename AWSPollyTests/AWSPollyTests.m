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

- (void)testCustomPollySetupWithAudioStream {
    AWSPollySynthesizeSpeechInput *request = [AWSPollySynthesizeSpeechInput new];
    [request setText:@"Hello world!"];
    // Use voice Matthew
    [request setVoiceId:AWSPollyVoiceIdMatthew];
    [request setTextType:AWSPollyTextTypeText];
    [request setOutputFormat:AWSPollyOutputFormatMp3];
    
    // Use NRT region
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionAPNortheast1
                                                                         credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    NSString *configKey = @"configuration";
    [AWSPolly registerPollyWithConfiguration:configuration
                                      forKey:configKey];
    AWSPolly *customPollyClient = [AWSPolly PollyForKey:configKey];
    
    
    
    [[[customPollyClient synthesizeSpeech:request] continueWithBlock:^id _Nullable(AWSTask<AWSPollySynthesizeSpeechOutput *> * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        
        NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"myfile_custom_matthew.mp3"];
        
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
    
    [request setText:@"こんにちは世界"];
    // Use voice Takumi
    [request setVoiceId:AWSPollyVoiceIdTakumi];
    [[[customPollyClient synthesizeSpeech:request] continueWithBlock:^id _Nullable(AWSTask<AWSPollySynthesizeSpeechOutput *> * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        
        NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"myfile_custom_takumi.mp3"];
        
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

- (void)testPresignedGetUrl{
    AWSPollySynthesizeSpeechURLBuilderRequest *request = [[AWSPollySynthesizeSpeechURLBuilderRequest alloc]init];
    [request setText:@"I agree with W3C and W2C."];
    [request setOutputFormat:AWSPollyOutputFormatMp3];
    [request setVoiceId:AWSPollyVoiceIdSalli];
    [request setLexiconNames:@[w3cLexiconName, w2cLexiconName]]; // W3C will be spoken as World Wide Web Consortium.
    [request setExpires:[NSDate dateWithTimeIntervalSinceNow:10*60]];

    // Note: Specifying an engine for an unsupported language will cause an error.
    // https://docs.aws.amazon.com/polly/latest/dg/API_SynthesizeSpeech.html#polly-SynthesizeSpeech-request-Engine
    [request setEngine:AWSPollyEngineNeural];
    
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

- (void)testSynthesisOperations{
    
    AWSPolly *Polly = [AWSPolly defaultPolly];
    
    AWSPollyStartSpeechSynthesisTaskInput *input = [AWSPollyStartSpeechSynthesisTaskInput new];
    [input setText:@"I agree with W3C and W2C."];
    [input setVoiceId:AWSPollyVoiceIdJoey];
    [input setTextType:AWSPollyTextTypeText];
    [input setOutputFormat:AWSPollyOutputFormatMp3];
    [input setLexiconNames:@[w2cLexiconName, w3cLexiconName]]; // W3C will be spoken as World Wide Web Consortium.
    [input setOutputS3BucketName:@"ios-v2-s3-tm-testdata"];
    [input setOutputS3KeyPrefix:@"polly-test.mp3"];
    
    __block NSString *taskId;
    [[[Polly startSpeechSynthesisTask:input] continueWithBlock:^id _Nullable(AWSTask<AWSPollyStartSpeechSynthesisTaskOutput *> * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        
        XCTAssertTrue(task.result.synthesisTask.lexiconNames.count == 2, "Expected 2 Lexicons, but got %lu", task.result.synthesisTask.lexiconNames.count);
        taskId = task.result.synthesisTask.taskId;
        
        return nil;
    }] waitUntilFinished];
    
    AWSPollyGetSpeechSynthesisTaskInput *ip = [AWSPollyGetSpeechSynthesisTaskInput new];
    ip.taskId = taskId;
    [[[Polly getSpeechSynthesisTask:ip] continueWithBlock:^id _Nullable(AWSTask<AWSPollyGetSpeechSynthesisTaskOutput *> * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        
        return nil;
    }] waitUntilFinished];
}

- (void)testSynthesisForAllVoices {
    for (id testCase in [self getSupportedLanguageAndVoiceTestCases]) {
        [self executeAndAssertSynthesisOperationForTestCase:testCase];
    }
}

- (void) testURLBuilderForAllVoices {
    for (id testCase in [self getSupportedLanguageAndVoiceTestCases]) {
        [self executeAndAssertURLBuilderForTestCase:testCase];
    }
}

// MARK: - Utilities

// Returns an array of language, voice, and text combinations, along with a the line in the source code at which the case is defined.
- (NSArray *)getSupportedLanguageAndVoiceTestCases {
    NSArray *testCases = @[
                           @{ @"languageCode": @(AWSPollyLanguageCodeArb), @"voiceId": @(AWSPollyVoiceIdZeina), @"text": @"مرحباً أيها العالم", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeCmnCN), @"voiceId": @(AWSPollyVoiceIdZhiyu), @"text": @"你好，世界。", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodeCyGB), @"voiceId": @(AWSPollyVoiceIdGwyneth), @"text": @"Helo Byd.", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodeDaDK), @"voiceId": @(AWSPollyVoiceIdNaja), @"text": @"Hej, verden.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeDaDK), @"voiceId": @(AWSPollyVoiceIdMads), @"text": @"Hej, verden.", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodeDeDE), @"voiceId": @(AWSPollyVoiceIdMarlene), @"text": @"Hallo, Welt.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeDeDE), @"voiceId": @(AWSPollyVoiceIdVicki), @"text": @"Hallo, Welt.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeDeDE), @"voiceId": @(AWSPollyVoiceIdHans), @"text": @"Hallo, Welt.", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodeEnAU), @"voiceId": @(AWSPollyVoiceIdNicole), @"text": @"Hello, world.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeEnAU), @"voiceId": @(AWSPollyVoiceIdRussell), @"text": @"Hello, world.", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodeEnGBWLS), @"voiceId": @(AWSPollyVoiceIdGeraint), @"text": @"Hello, world.", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodeEnGB), @"voiceId": @(AWSPollyVoiceIdAmy), @"text": @"Hello, world.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeEnGB), @"voiceId": @(AWSPollyVoiceIdEmma), @"text": @"Hello, world.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeEnGB), @"voiceId": @(AWSPollyVoiceIdBrian), @"text": @"Hello, world.", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodeEnIN), @"voiceId": @(AWSPollyVoiceIdAditi), @"text": @"Hello, world.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeEnIN), @"voiceId": @(AWSPollyVoiceIdRaveena), @"text": @"Hello, world.", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodeEnUS), @"voiceId": @(AWSPollyVoiceIdIvy), @"text": @"Hello, world.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeEnUS), @"voiceId": @(AWSPollyVoiceIdJoanna), @"text": @"Hello, world.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeEnUS), @"voiceId": @(AWSPollyVoiceIdKendra), @"text": @"Hello, world.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeEnUS), @"voiceId": @(AWSPollyVoiceIdKimberly), @"text": @"Hello, world.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeEnUS), @"voiceId": @(AWSPollyVoiceIdSalli), @"text": @"Hello, world.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeEnUS), @"voiceId": @(AWSPollyVoiceIdJoey), @"text": @"Hello, world.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeEnUS), @"voiceId": @(AWSPollyVoiceIdJustin), @"text": @"Hello, world.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeEnUS), @"voiceId": @(AWSPollyVoiceIdMatthew), @"text": @"Hello, world.", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodeEsES), @"voiceId": @(AWSPollyVoiceIdConchita), @"text": @"Hola, mundo.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeEsES), @"voiceId": @(AWSPollyVoiceIdLucia), @"text": @"Hola, mundo.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeEsES), @"voiceId": @(AWSPollyVoiceIdEnrique), @"text": @"Hola, mundo.", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodeEsMX), @"voiceId": @(AWSPollyVoiceIdMia), @"text": @"Hola, mundo.", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodeEsUS), @"voiceId": @(AWSPollyVoiceIdPenelope), @"text": @"Hola, mundo.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeEsUS), @"voiceId": @(AWSPollyVoiceIdMiguel), @"text": @"Hola, mundo.", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodeFrCA), @"voiceId": @(AWSPollyVoiceIdChantal), @"text": @"Bonjour, le monde.", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodeFrFR), @"voiceId": @(AWSPollyVoiceIdCeline), @"text": @"Bonjour, le monde.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeFrFR), @"voiceId": @(AWSPollyVoiceIdLea), @"text": @"Bonjour, le monde.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeFrFR), @"voiceId": @(AWSPollyVoiceIdMathieu), @"text": @"Bonjour, le monde.", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodeHiIN), @"voiceId": @(AWSPollyVoiceIdAditi), @"text": @"हैलो, दुनिया.", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodeIsIS), @"voiceId": @(AWSPollyVoiceIdDora), @"text": @"Halló heimur.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeIsIS), @"voiceId": @(AWSPollyVoiceIdKarl), @"text": @"Halló heimur.", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodeItIT), @"voiceId": @(AWSPollyVoiceIdCarla), @"text": @"Ciao, mondo.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeItIT), @"voiceId": @(AWSPollyVoiceIdBianca), @"text": @"Ciao, mondo.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeItIT), @"voiceId": @(AWSPollyVoiceIdGiorgio), @"text": @"Ciao, mondo.", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodeJaJP), @"voiceId": @(AWSPollyVoiceIdMizuki), @"text": @"こんにちは、世界。", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeJaJP), @"voiceId": @(AWSPollyVoiceIdTakumi), @"text": @"こんにちは、世界。", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodeKoKR), @"voiceId": @(AWSPollyVoiceIdSeoyeon), @"text": @"안녕하세요, 세상", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodeNbNO), @"voiceId": @(AWSPollyVoiceIdLiv), @"text": @"Hallo, verden.", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodeNlNL), @"voiceId": @(AWSPollyVoiceIdLotte), @"text": @"Hallo, wereld.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeNlNL), @"voiceId": @(AWSPollyVoiceIdRuben), @"text": @"Hallo, wereld.", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodePlPL), @"voiceId": @(AWSPollyVoiceIdEwa), @"text": @"Witaj, świecie.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodePlPL), @"voiceId": @(AWSPollyVoiceIdMaja), @"text": @"Witaj, świecie.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodePlPL), @"voiceId": @(AWSPollyVoiceIdJacek), @"text": @"Witaj, świecie.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodePlPL), @"voiceId": @(AWSPollyVoiceIdJan), @"text": @"Witaj, świecie.", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodePtBR), @"voiceId": @(AWSPollyVoiceIdVitoria), @"text": @"Olá, mundo.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodePtBR), @"voiceId": @(AWSPollyVoiceIdRicardo), @"text": @"Olá, mundo.", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodePtPT), @"voiceId": @(AWSPollyVoiceIdInes), @"text": @"Olá, mundo.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodePtPT), @"voiceId": @(AWSPollyVoiceIdCristiano), @"text": @"Olá, mundo.", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodeRoRO), @"voiceId": @(AWSPollyVoiceIdCarmen), @"text": @"Salut Lume.", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodeRuRU), @"voiceId": @(AWSPollyVoiceIdTatyana), @"text": @"Привет, мир.", @"testCaseLine": @(__LINE__) },
                           @{ @"languageCode": @(AWSPollyLanguageCodeRuRU), @"voiceId": @(AWSPollyVoiceIdMaxim), @"text": @"Привет, мир.", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodeSvSE), @"voiceId": @(AWSPollyVoiceIdAstrid), @"text": @"Hej, världen.", @"testCaseLine": @(__LINE__) },

                           @{ @"languageCode": @(AWSPollyLanguageCodeTrTR), @"voiceId": @(AWSPollyVoiceIdFiliz), @"text": @"Merhaba, dünya.", @"testCaseLine": @(__LINE__) },

                           ];

    return testCases;
}

- (void)executeAndAssertSynthesisOperationForTestCase:(NSDictionary *)testCase {
    AWSPollyVoiceId voiceId = [testCase[@"voiceId"] integerValue];
    AWSPollyLanguageCode languageCode = [testCase[@"languageCode"] integerValue];
    NSString *text = testCase[@"text"];
    unsigned long testCaseLine = [testCase[@"testCaseLine"] integerValue];

    AWSPolly *polly = [AWSPolly defaultPolly];

    // Common configs
    AWSPollyStartSpeechSynthesisTaskInput *input = [AWSPollyStartSpeechSynthesisTaskInput new];
    [input setOutputS3BucketName:@"ios-v2-s3-tm-testdata"];
    [input setTextType:AWSPollyTextTypeText];
    [input setOutputFormat:AWSPollyOutputFormatMp3];

    // Configs that vary by test case
    [input setLanguageCode:languageCode];
    [input setVoiceId:voiceId];
    [input setText:text];
    [input setOutputS3KeyPrefix:[NSString stringWithFormat:@"polly-testAllVoices-%lu", voiceId]];

    __block NSString *taskId;
    [[[polly startSpeechSynthesisTask:input] continueWithBlock:^id _Nullable(AWSTask<AWSPollyStartSpeechSynthesisTaskOutput *> * _Nonnull task) {
        XCTAssertNil(task.error, @"Unexpected error in startSpeechSynthesisTask (testCaseLine %lu)", testCaseLine);
        XCTAssertNotNil(task.result, @"Result unexpectedly nil in startSpeechSynthesisTask (testCaseLine %lu)", testCaseLine);
        taskId = task.result.synthesisTask.taskId;
        return nil;
    }] waitUntilFinished];

    AWSPollyGetSpeechSynthesisTaskInput *ip = [AWSPollyGetSpeechSynthesisTaskInput new];
    ip.taskId = taskId;
    [[[polly getSpeechSynthesisTask:ip] continueWithBlock:^id _Nullable(AWSTask<AWSPollyGetSpeechSynthesisTaskOutput *> * _Nonnull task) {
        XCTAssertNil(task.error, @"Unexpected error in getSpeechSynthesisTask (testCaseLine %lu)", testCaseLine);
        XCTAssertNotNil(task.result, @"Result unexpectedly nil in getSpeechSynthesisTask (testCaseLine %lu)", testCaseLine);
        return nil;
    }] waitUntilFinished];

}

// Creates a presigned URL request and downloads the file to local storage. NOTE: This does not play the
// actual audio file, but does provide a code snippet that you can uncomment to download to local storage
// for manual playback after the test.
- (void)executeAndAssertURLBuilderForTestCase:(NSDictionary *)testCase {
    AWSPollyVoiceId voiceId = [testCase[@"voiceId"] integerValue];
    AWSPollyLanguageCode languageCode = [testCase[@"languageCode"] integerValue];
    NSString *text = testCase[@"text"];
    unsigned long testCaseLine = [testCase[@"testCaseLine"] integerValue];

    AWSPollySynthesizeSpeechURLBuilderRequest *request = [[AWSPollySynthesizeSpeechURLBuilderRequest alloc] init];
    [request setText:text];
    [request setOutputFormat:AWSPollyOutputFormatMp3];
    [request setVoiceId:voiceId];
    [request setLanguageCode:languageCode];
    [request setExpires:[NSDate dateWithTimeIntervalSinceNow:10*60]];

    AWSPollySynthesizeSpeechURLBuilder *builder = [AWSPollySynthesizeSpeechURLBuilder defaultPollySynthesizeSpeechURLBuilder];

    [[[[builder getPreSignedURL:request] continueWithBlock:^id _Nullable(AWSTask<NSURL *> * _Nonnull task) {
        XCTAssertNil(task.error, @"Unexpected error in getPreSignedURL (testCaseLine %lu)", testCaseLine);
        XCTAssertNotNil(task.result, @"Result unexpectedly nil in getPreSignedURL (testCaseLine %lu)", testCaseLine);
        return task;
    }] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:task.result];
        request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;

        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            XCTAssertNil(error, @"Unexpected error in URL download (testCaseLine %lu), presigned URL is: %@", testCaseLine, ((NSURL *)task.result).absoluteString);

            if (((NSHTTPURLResponse *)response).statusCode < 200 || ((NSHTTPURLResponse *)response).statusCode >= 300) {
                XCTFail(@"Response status code is %ld (testCaseLine %lu)", (long)((NSHTTPURLResponse *)response).statusCode, testCaseLine);
            }

            XCTAssertGreaterThan([data length], 0, @"Downloaded data is unexpectedly empty (testCaseLine %lu)", testCaseLine);

            // For interactively testing the voice output, you can uncomment the section below to write the data to a file
            // NSString *fileName = [NSString stringWithFormat:@"polly-testURLBuilder-%lu.mp3", voiceId];
            // NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:fileName];
            // [data writeToFile:filePath atomically:YES];
            // NSLog(@"Downloaded to %@", filePath);

            dispatch_semaphore_signal(semaphore);
        }] resume];

        XCTAssertEqual(dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 100 * NSEC_PER_SEC)), 0);

        return nil;
    }] waitUntilFinished];

}


@end
