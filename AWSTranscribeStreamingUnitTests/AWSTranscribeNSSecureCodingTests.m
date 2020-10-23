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
#import <AWSNSSecureCodingTestBase/AWSNSSecureCodingTestBase.h>
#import "AWSTranscribeStreamingModel.h"

@interface AWSTranscribeStreamingNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSTranscribeStreamingAlternative API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeStreamingAudioEvent API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeStreamingAudioStream API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeStreamingItem API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeStreamingResult API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeStreamingStartStreamTranscriptionRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeStreamingStartStreamTranscriptionResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeStreamingTranscript API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeStreamingTranscriptEvent API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeStreamingTranscriptResultStream API_AVAILABLE(ios(11));

@end

@implementation AWSTranscribeStreamingNSSecureCodingTests

- (void) test_AWSTranscribeStreamingAlternative {
    [self validateSecureCodingForClass:[AWSTranscribeStreamingAlternative class]];
}

- (void) test_AWSTranscribeStreamingAudioEvent {
    [self validateSecureCodingForClass:[AWSTranscribeStreamingAudioEvent class]];
}

- (void) test_AWSTranscribeStreamingAudioStream {
    [self validateSecureCodingForClass:[AWSTranscribeStreamingAudioStream class]];
}

- (void) test_AWSTranscribeStreamingItem {
    [self validateSecureCodingForClass:[AWSTranscribeStreamingItem class]];
}

- (void) test_AWSTranscribeStreamingResult {
    [self validateSecureCodingForClass:[AWSTranscribeStreamingResult class]];
}

- (void) test_AWSTranscribeStreamingStartStreamTranscriptionRequest {
    [self validateSecureCodingForClass:[AWSTranscribeStreamingStartStreamTranscriptionRequest class]];
}

- (void) test_AWSTranscribeStreamingStartStreamTranscriptionResponse {
    [self validateSecureCodingForClass:[AWSTranscribeStreamingStartStreamTranscriptionResponse class]];
}

- (void) test_AWSTranscribeStreamingTranscript {
    [self validateSecureCodingForClass:[AWSTranscribeStreamingTranscript class]];
}

- (void) test_AWSTranscribeStreamingTranscriptEvent {
    [self validateSecureCodingForClass:[AWSTranscribeStreamingTranscriptEvent class]];
}

- (void) test_AWSTranscribeStreamingTranscriptResultStream {
    [self validateSecureCodingForClass:[AWSTranscribeStreamingTranscriptResultStream class]];
}


@end
