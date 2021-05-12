//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSLexModel.h"

@interface AWSLexNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSLexActiveContext API_AVAILABLE(ios(11));
- (void) test_AWSLexActiveContextTimeToLive API_AVAILABLE(ios(11));
- (void) test_AWSLexButton API_AVAILABLE(ios(11));
- (void) test_AWSLexDeleteSessionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLexDeleteSessionResponse API_AVAILABLE(ios(11));
- (void) test_AWSLexDialogAction API_AVAILABLE(ios(11));
- (void) test_AWSLexGenericAttachment API_AVAILABLE(ios(11));
- (void) test_AWSLexGetSessionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLexGetSessionResponse API_AVAILABLE(ios(11));
- (void) test_AWSLexIntentConfidence API_AVAILABLE(ios(11));
- (void) test_AWSLexIntentSummary API_AVAILABLE(ios(11));
- (void) test_AWSLexPostContentRequest API_AVAILABLE(ios(11));
- (void) test_AWSLexPostContentResponse API_AVAILABLE(ios(11));
- (void) test_AWSLexPostTextRequest API_AVAILABLE(ios(11));
- (void) test_AWSLexPostTextResponse API_AVAILABLE(ios(11));
- (void) test_AWSLexPredictedIntent API_AVAILABLE(ios(11));
- (void) test_AWSLexPutSessionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLexPutSessionResponse API_AVAILABLE(ios(11));
- (void) test_AWSLexResponseCard API_AVAILABLE(ios(11));
- (void) test_AWSLexSentimentResponse API_AVAILABLE(ios(11));

@end

@implementation AWSLexNSSecureCodingTests

- (void) test_AWSLexActiveContext {
    [self validateSecureCodingForClass:[AWSLexActiveContext class]];
}

- (void) test_AWSLexActiveContextTimeToLive {
    [self validateSecureCodingForClass:[AWSLexActiveContextTimeToLive class]];
}

- (void) test_AWSLexButton {
    [self validateSecureCodingForClass:[AWSLexButton class]];
}

- (void) test_AWSLexDeleteSessionRequest {
    [self validateSecureCodingForClass:[AWSLexDeleteSessionRequest class]];
}

- (void) test_AWSLexDeleteSessionResponse {
    [self validateSecureCodingForClass:[AWSLexDeleteSessionResponse class]];
}

- (void) test_AWSLexDialogAction {
    [self validateSecureCodingForClass:[AWSLexDialogAction class]];
}

- (void) test_AWSLexGenericAttachment {
    [self validateSecureCodingForClass:[AWSLexGenericAttachment class]];
}

- (void) test_AWSLexGetSessionRequest {
    [self validateSecureCodingForClass:[AWSLexGetSessionRequest class]];
}

- (void) test_AWSLexGetSessionResponse {
    [self validateSecureCodingForClass:[AWSLexGetSessionResponse class]];
}

- (void) test_AWSLexIntentConfidence {
    [self validateSecureCodingForClass:[AWSLexIntentConfidence class]];
}

- (void) test_AWSLexIntentSummary {
    [self validateSecureCodingForClass:[AWSLexIntentSummary class]];
}

- (void) test_AWSLexPostContentRequest {
    [self validateSecureCodingForClass:[AWSLexPostContentRequest class]];
}

- (void) test_AWSLexPostContentResponse {
    [self validateSecureCodingForClass:[AWSLexPostContentResponse class]];
}

- (void) test_AWSLexPostTextRequest {
    [self validateSecureCodingForClass:[AWSLexPostTextRequest class]];
}

- (void) test_AWSLexPostTextResponse {
    [self validateSecureCodingForClass:[AWSLexPostTextResponse class]];
}

- (void) test_AWSLexPredictedIntent {
    [self validateSecureCodingForClass:[AWSLexPredictedIntent class]];
}

- (void) test_AWSLexPutSessionRequest {
    [self validateSecureCodingForClass:[AWSLexPutSessionRequest class]];
}

- (void) test_AWSLexPutSessionResponse {
    [self validateSecureCodingForClass:[AWSLexPutSessionResponse class]];
}

- (void) test_AWSLexResponseCard {
    [self validateSecureCodingForClass:[AWSLexResponseCard class]];
}

- (void) test_AWSLexSentimentResponse {
    [self validateSecureCodingForClass:[AWSLexSentimentResponse class]];
}

@end

