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
#import "AWSSQSModel.h"

@interface AWSSQSNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSSQSAddPermissionRequest API_AVAILABLE(ios(11));
- (void) test_AWSSQSBatchResultErrorEntry API_AVAILABLE(ios(11));
- (void) test_AWSSQSChangeMessageVisibilityBatchRequest API_AVAILABLE(ios(11));
- (void) test_AWSSQSChangeMessageVisibilityBatchRequestEntry API_AVAILABLE(ios(11));
- (void) test_AWSSQSChangeMessageVisibilityBatchResult API_AVAILABLE(ios(11));
- (void) test_AWSSQSChangeMessageVisibilityBatchResultEntry API_AVAILABLE(ios(11));
- (void) test_AWSSQSChangeMessageVisibilityRequest API_AVAILABLE(ios(11));
- (void) test_AWSSQSCreateQueueRequest API_AVAILABLE(ios(11));
- (void) test_AWSSQSCreateQueueResult API_AVAILABLE(ios(11));
- (void) test_AWSSQSDeleteMessageBatchRequest API_AVAILABLE(ios(11));
- (void) test_AWSSQSDeleteMessageBatchRequestEntry API_AVAILABLE(ios(11));
- (void) test_AWSSQSDeleteMessageBatchResult API_AVAILABLE(ios(11));
- (void) test_AWSSQSDeleteMessageBatchResultEntry API_AVAILABLE(ios(11));
- (void) test_AWSSQSDeleteMessageRequest API_AVAILABLE(ios(11));
- (void) test_AWSSQSDeleteQueueRequest API_AVAILABLE(ios(11));
- (void) test_AWSSQSGetQueueAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSSQSGetQueueAttributesResult API_AVAILABLE(ios(11));
- (void) test_AWSSQSGetQueueUrlRequest API_AVAILABLE(ios(11));
- (void) test_AWSSQSGetQueueUrlResult API_AVAILABLE(ios(11));
- (void) test_AWSSQSListDeadLetterSourceQueuesRequest API_AVAILABLE(ios(11));
- (void) test_AWSSQSListDeadLetterSourceQueuesResult API_AVAILABLE(ios(11));
- (void) test_AWSSQSListQueueTagsRequest API_AVAILABLE(ios(11));
- (void) test_AWSSQSListQueueTagsResult API_AVAILABLE(ios(11));
- (void) test_AWSSQSListQueuesRequest API_AVAILABLE(ios(11));
- (void) test_AWSSQSListQueuesResult API_AVAILABLE(ios(11));
- (void) test_AWSSQSMessage API_AVAILABLE(ios(11));
- (void) test_AWSSQSMessageAttributeValue API_AVAILABLE(ios(11));
- (void) test_AWSSQSMessageSystemAttributeValue API_AVAILABLE(ios(11));
- (void) test_AWSSQSPurgeQueueRequest API_AVAILABLE(ios(11));
- (void) test_AWSSQSReceiveMessageRequest API_AVAILABLE(ios(11));
- (void) test_AWSSQSReceiveMessageResult API_AVAILABLE(ios(11));
- (void) test_AWSSQSRemovePermissionRequest API_AVAILABLE(ios(11));
- (void) test_AWSSQSSendMessageBatchRequest API_AVAILABLE(ios(11));
- (void) test_AWSSQSSendMessageBatchRequestEntry API_AVAILABLE(ios(11));
- (void) test_AWSSQSSendMessageBatchResult API_AVAILABLE(ios(11));
- (void) test_AWSSQSSendMessageBatchResultEntry API_AVAILABLE(ios(11));
- (void) test_AWSSQSSendMessageRequest API_AVAILABLE(ios(11));
- (void) test_AWSSQSSendMessageResult API_AVAILABLE(ios(11));
- (void) test_AWSSQSSetQueueAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSSQSTagQueueRequest API_AVAILABLE(ios(11));
- (void) test_AWSSQSUntagQueueRequest API_AVAILABLE(ios(11));

@end

@implementation AWSSQSNSSecureCodingTests

- (void) test_AWSSQSAddPermissionRequest {
    [self validateSecureCodingForClass:[AWSSQSAddPermissionRequest class]];
}

- (void) test_AWSSQSBatchResultErrorEntry {
    [self validateSecureCodingForClass:[AWSSQSBatchResultErrorEntry class]];
}

- (void) test_AWSSQSChangeMessageVisibilityBatchRequest {
    [self validateSecureCodingForClass:[AWSSQSChangeMessageVisibilityBatchRequest class]];
}

- (void) test_AWSSQSChangeMessageVisibilityBatchRequestEntry {
    [self validateSecureCodingForClass:[AWSSQSChangeMessageVisibilityBatchRequestEntry class]];
}

- (void) test_AWSSQSChangeMessageVisibilityBatchResult {
    [self validateSecureCodingForClass:[AWSSQSChangeMessageVisibilityBatchResult class]];
}

- (void) test_AWSSQSChangeMessageVisibilityBatchResultEntry {
    [self validateSecureCodingForClass:[AWSSQSChangeMessageVisibilityBatchResultEntry class]];
}

- (void) test_AWSSQSChangeMessageVisibilityRequest {
    [self validateSecureCodingForClass:[AWSSQSChangeMessageVisibilityRequest class]];
}

- (void) test_AWSSQSCreateQueueRequest {
    [self validateSecureCodingForClass:[AWSSQSCreateQueueRequest class]];
}

- (void) test_AWSSQSCreateQueueResult {
    [self validateSecureCodingForClass:[AWSSQSCreateQueueResult class]];
}

- (void) test_AWSSQSDeleteMessageBatchRequest {
    [self validateSecureCodingForClass:[AWSSQSDeleteMessageBatchRequest class]];
}

- (void) test_AWSSQSDeleteMessageBatchRequestEntry {
    [self validateSecureCodingForClass:[AWSSQSDeleteMessageBatchRequestEntry class]];
}

- (void) test_AWSSQSDeleteMessageBatchResult {
    [self validateSecureCodingForClass:[AWSSQSDeleteMessageBatchResult class]];
}

- (void) test_AWSSQSDeleteMessageBatchResultEntry {
    [self validateSecureCodingForClass:[AWSSQSDeleteMessageBatchResultEntry class]];
}

- (void) test_AWSSQSDeleteMessageRequest {
    [self validateSecureCodingForClass:[AWSSQSDeleteMessageRequest class]];
}

- (void) test_AWSSQSDeleteQueueRequest {
    [self validateSecureCodingForClass:[AWSSQSDeleteQueueRequest class]];
}

- (void) test_AWSSQSGetQueueAttributesRequest {
    [self validateSecureCodingForClass:[AWSSQSGetQueueAttributesRequest class]];
}

- (void) test_AWSSQSGetQueueAttributesResult {
    [self validateSecureCodingForClass:[AWSSQSGetQueueAttributesResult class]];
}

- (void) test_AWSSQSGetQueueUrlRequest {
    [self validateSecureCodingForClass:[AWSSQSGetQueueUrlRequest class]];
}

- (void) test_AWSSQSGetQueueUrlResult {
    [self validateSecureCodingForClass:[AWSSQSGetQueueUrlResult class]];
}

- (void) test_AWSSQSListDeadLetterSourceQueuesRequest {
    [self validateSecureCodingForClass:[AWSSQSListDeadLetterSourceQueuesRequest class]];
}

- (void) test_AWSSQSListDeadLetterSourceQueuesResult {
    [self validateSecureCodingForClass:[AWSSQSListDeadLetterSourceQueuesResult class]];
}

- (void) test_AWSSQSListQueueTagsRequest {
    [self validateSecureCodingForClass:[AWSSQSListQueueTagsRequest class]];
}

- (void) test_AWSSQSListQueueTagsResult {
    [self validateSecureCodingForClass:[AWSSQSListQueueTagsResult class]];
}

- (void) test_AWSSQSListQueuesRequest {
    [self validateSecureCodingForClass:[AWSSQSListQueuesRequest class]];
}

- (void) test_AWSSQSListQueuesResult {
    [self validateSecureCodingForClass:[AWSSQSListQueuesResult class]];
}

- (void) test_AWSSQSMessage {
    [self validateSecureCodingForClass:[AWSSQSMessage class]];
}

- (void) test_AWSSQSMessageAttributeValue {
    [self validateSecureCodingForClass:[AWSSQSMessageAttributeValue class]];
}

- (void) test_AWSSQSMessageSystemAttributeValue {
    [self validateSecureCodingForClass:[AWSSQSMessageSystemAttributeValue class]];
}

- (void) test_AWSSQSPurgeQueueRequest {
    [self validateSecureCodingForClass:[AWSSQSPurgeQueueRequest class]];
}

- (void) test_AWSSQSReceiveMessageRequest {
    [self validateSecureCodingForClass:[AWSSQSReceiveMessageRequest class]];
}

- (void) test_AWSSQSReceiveMessageResult {
    [self validateSecureCodingForClass:[AWSSQSReceiveMessageResult class]];
}

- (void) test_AWSSQSRemovePermissionRequest {
    [self validateSecureCodingForClass:[AWSSQSRemovePermissionRequest class]];
}

- (void) test_AWSSQSSendMessageBatchRequest {
    [self validateSecureCodingForClass:[AWSSQSSendMessageBatchRequest class]];
}

- (void) test_AWSSQSSendMessageBatchRequestEntry {
    [self validateSecureCodingForClass:[AWSSQSSendMessageBatchRequestEntry class]];
}

- (void) test_AWSSQSSendMessageBatchResult {
    [self validateSecureCodingForClass:[AWSSQSSendMessageBatchResult class]];
}

- (void) test_AWSSQSSendMessageBatchResultEntry {
    [self validateSecureCodingForClass:[AWSSQSSendMessageBatchResultEntry class]];
}

- (void) test_AWSSQSSendMessageRequest {
    [self validateSecureCodingForClass:[AWSSQSSendMessageRequest class]];
}

- (void) test_AWSSQSSendMessageResult {
    [self validateSecureCodingForClass:[AWSSQSSendMessageResult class]];
}

- (void) test_AWSSQSSetQueueAttributesRequest {
    [self validateSecureCodingForClass:[AWSSQSSetQueueAttributesRequest class]];
}

- (void) test_AWSSQSTagQueueRequest {
    [self validateSecureCodingForClass:[AWSSQSTagQueueRequest class]];
}

- (void) test_AWSSQSUntagQueueRequest {
    [self validateSecureCodingForClass:[AWSSQSUntagQueueRequest class]];
}

@end

