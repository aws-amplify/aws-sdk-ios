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
#import "AWSKinesisVideoArchivedMediaModel.h"

@interface AWSKinesisVideoArchivedMediaNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSKinesisVideoArchivedMediaClipFragmentSelector API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoArchivedMediaClipTimestampRange API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoArchivedMediaDASHFragmentSelector API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoArchivedMediaDASHTimestampRange API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoArchivedMediaFragment API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoArchivedMediaFragmentSelector API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoArchivedMediaGetClipInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoArchivedMediaGetClipOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoArchivedMediaGetDASHStreamingSessionURLInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoArchivedMediaGetDASHStreamingSessionURLOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoArchivedMediaGetMediaForFragmentListInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoArchivedMediaGetMediaForFragmentListOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoArchivedMediaHLSFragmentSelector API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoArchivedMediaHLSTimestampRange API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoArchivedMediaListFragmentsInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoArchivedMediaListFragmentsOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoArchivedMediaTimestampRange API_AVAILABLE(ios(11));

@end

@implementation AWSKinesisVideoArchivedMediaNSSecureCodingTests

- (void) test_AWSKinesisVideoArchivedMediaClipFragmentSelector {
    [self validateSecureCodingForClass:[AWSKinesisVideoArchivedMediaClipFragmentSelector class]];
}

- (void) test_AWSKinesisVideoArchivedMediaClipTimestampRange {
    [self validateSecureCodingForClass:[AWSKinesisVideoArchivedMediaClipTimestampRange class]];
}

- (void) test_AWSKinesisVideoArchivedMediaDASHFragmentSelector {
    [self validateSecureCodingForClass:[AWSKinesisVideoArchivedMediaDASHFragmentSelector class]];
}

- (void) test_AWSKinesisVideoArchivedMediaDASHTimestampRange {
    [self validateSecureCodingForClass:[AWSKinesisVideoArchivedMediaDASHTimestampRange class]];
}

- (void) test_AWSKinesisVideoArchivedMediaFragment {
    [self validateSecureCodingForClass:[AWSKinesisVideoArchivedMediaFragment class]];
}

- (void) test_AWSKinesisVideoArchivedMediaFragmentSelector {
    [self validateSecureCodingForClass:[AWSKinesisVideoArchivedMediaFragmentSelector class]];
}

- (void) test_AWSKinesisVideoArchivedMediaGetClipInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoArchivedMediaGetClipInput class]];
}

- (void) test_AWSKinesisVideoArchivedMediaGetClipOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoArchivedMediaGetClipOutput class]];
}

- (void) test_AWSKinesisVideoArchivedMediaGetDASHStreamingSessionURLInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoArchivedMediaGetDASHStreamingSessionURLInput class]];
}

- (void) test_AWSKinesisVideoArchivedMediaGetDASHStreamingSessionURLOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoArchivedMediaGetDASHStreamingSessionURLOutput class]];
}

- (void) test_AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLInput class]];
}

- (void) test_AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLOutput class]];
}

- (void) test_AWSKinesisVideoArchivedMediaGetMediaForFragmentListInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoArchivedMediaGetMediaForFragmentListInput class]];
}

- (void) test_AWSKinesisVideoArchivedMediaGetMediaForFragmentListOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoArchivedMediaGetMediaForFragmentListOutput class]];
}

- (void) test_AWSKinesisVideoArchivedMediaHLSFragmentSelector {
    [self validateSecureCodingForClass:[AWSKinesisVideoArchivedMediaHLSFragmentSelector class]];
}

- (void) test_AWSKinesisVideoArchivedMediaHLSTimestampRange {
    [self validateSecureCodingForClass:[AWSKinesisVideoArchivedMediaHLSTimestampRange class]];
}

- (void) test_AWSKinesisVideoArchivedMediaListFragmentsInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoArchivedMediaListFragmentsInput class]];
}

- (void) test_AWSKinesisVideoArchivedMediaListFragmentsOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoArchivedMediaListFragmentsOutput class]];
}

- (void) test_AWSKinesisVideoArchivedMediaTimestampRange {
    [self validateSecureCodingForClass:[AWSKinesisVideoArchivedMediaTimestampRange class]];
}

@end

