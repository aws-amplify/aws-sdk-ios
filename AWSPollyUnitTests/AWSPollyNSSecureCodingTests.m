//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import <AWSNSSecureCodingTestBase/AWSNSSecureCodingTestBase.h>
#import "AWSPollyModel.h"

@interface AWSPollyNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSPollyDeleteLexiconInput API_AVAILABLE(ios(11));
- (void) test_AWSPollyDeleteLexiconOutput API_AVAILABLE(ios(11));
- (void) test_AWSPollyDescribeVoicesInput API_AVAILABLE(ios(11));
- (void) test_AWSPollyDescribeVoicesOutput API_AVAILABLE(ios(11));
- (void) test_AWSPollyGetLexiconInput API_AVAILABLE(ios(11));
- (void) test_AWSPollyGetLexiconOutput API_AVAILABLE(ios(11));
- (void) test_AWSPollyGetSpeechSynthesisTaskInput API_AVAILABLE(ios(11));
- (void) test_AWSPollyGetSpeechSynthesisTaskOutput API_AVAILABLE(ios(11));
- (void) test_AWSPollyLexicon API_AVAILABLE(ios(11));
- (void) test_AWSPollyLexiconAttributes API_AVAILABLE(ios(11));
- (void) test_AWSPollyLexiconDescription API_AVAILABLE(ios(11));
- (void) test_AWSPollyListLexiconsInput API_AVAILABLE(ios(11));
- (void) test_AWSPollyListLexiconsOutput API_AVAILABLE(ios(11));
- (void) test_AWSPollyListSpeechSynthesisTasksInput API_AVAILABLE(ios(11));
- (void) test_AWSPollyListSpeechSynthesisTasksOutput API_AVAILABLE(ios(11));
- (void) test_AWSPollyPutLexiconInput API_AVAILABLE(ios(11));
- (void) test_AWSPollyPutLexiconOutput API_AVAILABLE(ios(11));
- (void) test_AWSPollyStartSpeechSynthesisTaskInput API_AVAILABLE(ios(11));
- (void) test_AWSPollyStartSpeechSynthesisTaskOutput API_AVAILABLE(ios(11));
- (void) test_AWSPollySynthesisTask API_AVAILABLE(ios(11));
- (void) test_AWSPollySynthesizeSpeechInput API_AVAILABLE(ios(11));
- (void) test_AWSPollySynthesizeSpeechOutput API_AVAILABLE(ios(11));
- (void) test_AWSPollyVoice API_AVAILABLE(ios(11));

@end

@implementation AWSPollyNSSecureCodingTests

- (void) test_AWSPollyDeleteLexiconInput {
    [self validateSecureCodingForClass:[AWSPollyDeleteLexiconInput class]];
}

- (void) test_AWSPollyDeleteLexiconOutput {
    [self validateSecureCodingForClass:[AWSPollyDeleteLexiconOutput class]];
}

- (void) test_AWSPollyDescribeVoicesInput {
    [self validateSecureCodingForClass:[AWSPollyDescribeVoicesInput class]];
}

- (void) test_AWSPollyDescribeVoicesOutput {
    [self validateSecureCodingForClass:[AWSPollyDescribeVoicesOutput class]];
}

- (void) test_AWSPollyGetLexiconInput {
    [self validateSecureCodingForClass:[AWSPollyGetLexiconInput class]];
}

- (void) test_AWSPollyGetLexiconOutput {
    [self validateSecureCodingForClass:[AWSPollyGetLexiconOutput class]];
}

- (void) test_AWSPollyGetSpeechSynthesisTaskInput {
    [self validateSecureCodingForClass:[AWSPollyGetSpeechSynthesisTaskInput class]];
}

- (void) test_AWSPollyGetSpeechSynthesisTaskOutput {
    [self validateSecureCodingForClass:[AWSPollyGetSpeechSynthesisTaskOutput class]];
}

- (void) test_AWSPollyLexicon {
    [self validateSecureCodingForClass:[AWSPollyLexicon class]];
}

- (void) test_AWSPollyLexiconAttributes {
    [self validateSecureCodingForClass:[AWSPollyLexiconAttributes class]];
}

- (void) test_AWSPollyLexiconDescription {
    [self validateSecureCodingForClass:[AWSPollyLexiconDescription class]];
}

- (void) test_AWSPollyListLexiconsInput {
    [self validateSecureCodingForClass:[AWSPollyListLexiconsInput class]];
}

- (void) test_AWSPollyListLexiconsOutput {
    [self validateSecureCodingForClass:[AWSPollyListLexiconsOutput class]];
}

- (void) test_AWSPollyListSpeechSynthesisTasksInput {
    [self validateSecureCodingForClass:[AWSPollyListSpeechSynthesisTasksInput class]];
}

- (void) test_AWSPollyListSpeechSynthesisTasksOutput {
    [self validateSecureCodingForClass:[AWSPollyListSpeechSynthesisTasksOutput class]];
}

- (void) test_AWSPollyPutLexiconInput {
    [self validateSecureCodingForClass:[AWSPollyPutLexiconInput class]];
}

- (void) test_AWSPollyPutLexiconOutput {
    [self validateSecureCodingForClass:[AWSPollyPutLexiconOutput class]];
}

- (void) test_AWSPollyStartSpeechSynthesisTaskInput {
    [self validateSecureCodingForClass:[AWSPollyStartSpeechSynthesisTaskInput class]];
}

- (void) test_AWSPollyStartSpeechSynthesisTaskOutput {
    [self validateSecureCodingForClass:[AWSPollyStartSpeechSynthesisTaskOutput class]];
}

- (void) test_AWSPollySynthesisTask {
    [self validateSecureCodingForClass:[AWSPollySynthesisTask class]];
}

- (void) test_AWSPollySynthesizeSpeechInput {
    [self validateSecureCodingForClass:[AWSPollySynthesizeSpeechInput class]];
}

- (void) test_AWSPollySynthesizeSpeechOutput {
    [self validateSecureCodingForClass:[AWSPollySynthesizeSpeechOutput class]];
}

- (void) test_AWSPollyVoice {
    [self validateSecureCodingForClass:[AWSPollyVoice class]];
}

@end

