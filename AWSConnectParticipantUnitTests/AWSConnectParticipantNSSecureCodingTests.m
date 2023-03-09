//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSConnectParticipantModel.h"

@interface AWSConnectParticipantNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSConnectParticipantAttachmentItem API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantCompleteAttachmentUploadRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantCompleteAttachmentUploadResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantConnectionCredentials API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantCreateParticipantConnectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantCreateParticipantConnectionResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantDisconnectParticipantRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantDisconnectParticipantResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantGetAttachmentRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantGetAttachmentResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantGetTranscriptRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantGetTranscriptResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantItem API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantMessageMetadata API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantReceipt API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantSendEventRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantSendEventResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantSendMessageRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantSendMessageResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantStartAttachmentUploadRequest API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantStartAttachmentUploadResponse API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantStartPosition API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantUploadMetadata API_AVAILABLE(ios(11));
- (void) test_AWSConnectParticipantWebsocket API_AVAILABLE(ios(11));

@end

@implementation AWSConnectParticipantNSSecureCodingTests

- (void) test_AWSConnectParticipantAttachmentItem {
    [self validateSecureCodingForClass:[AWSConnectParticipantAttachmentItem class]];
}

- (void) test_AWSConnectParticipantCompleteAttachmentUploadRequest {
    [self validateSecureCodingForClass:[AWSConnectParticipantCompleteAttachmentUploadRequest class]];
}

- (void) test_AWSConnectParticipantCompleteAttachmentUploadResponse {
    [self validateSecureCodingForClass:[AWSConnectParticipantCompleteAttachmentUploadResponse class]];
}

- (void) test_AWSConnectParticipantConnectionCredentials {
    [self validateSecureCodingForClass:[AWSConnectParticipantConnectionCredentials class]];
}

- (void) test_AWSConnectParticipantCreateParticipantConnectionRequest {
    [self validateSecureCodingForClass:[AWSConnectParticipantCreateParticipantConnectionRequest class]];
}

- (void) test_AWSConnectParticipantCreateParticipantConnectionResponse {
    [self validateSecureCodingForClass:[AWSConnectParticipantCreateParticipantConnectionResponse class]];
}

- (void) test_AWSConnectParticipantDisconnectParticipantRequest {
    [self validateSecureCodingForClass:[AWSConnectParticipantDisconnectParticipantRequest class]];
}

- (void) test_AWSConnectParticipantDisconnectParticipantResponse {
    [self validateSecureCodingForClass:[AWSConnectParticipantDisconnectParticipantResponse class]];
}

- (void) test_AWSConnectParticipantGetAttachmentRequest {
    [self validateSecureCodingForClass:[AWSConnectParticipantGetAttachmentRequest class]];
}

- (void) test_AWSConnectParticipantGetAttachmentResponse {
    [self validateSecureCodingForClass:[AWSConnectParticipantGetAttachmentResponse class]];
}

- (void) test_AWSConnectParticipantGetTranscriptRequest {
    [self validateSecureCodingForClass:[AWSConnectParticipantGetTranscriptRequest class]];
}

- (void) test_AWSConnectParticipantGetTranscriptResponse {
    [self validateSecureCodingForClass:[AWSConnectParticipantGetTranscriptResponse class]];
}

- (void) test_AWSConnectParticipantItem {
    [self validateSecureCodingForClass:[AWSConnectParticipantItem class]];
}

- (void) test_AWSConnectParticipantMessageMetadata {
    [self validateSecureCodingForClass:[AWSConnectParticipantMessageMetadata class]];
}

- (void) test_AWSConnectParticipantReceipt {
    [self validateSecureCodingForClass:[AWSConnectParticipantReceipt class]];
}

- (void) test_AWSConnectParticipantSendEventRequest {
    [self validateSecureCodingForClass:[AWSConnectParticipantSendEventRequest class]];
}

- (void) test_AWSConnectParticipantSendEventResponse {
    [self validateSecureCodingForClass:[AWSConnectParticipantSendEventResponse class]];
}

- (void) test_AWSConnectParticipantSendMessageRequest {
    [self validateSecureCodingForClass:[AWSConnectParticipantSendMessageRequest class]];
}

- (void) test_AWSConnectParticipantSendMessageResponse {
    [self validateSecureCodingForClass:[AWSConnectParticipantSendMessageResponse class]];
}

- (void) test_AWSConnectParticipantStartAttachmentUploadRequest {
    [self validateSecureCodingForClass:[AWSConnectParticipantStartAttachmentUploadRequest class]];
}

- (void) test_AWSConnectParticipantStartAttachmentUploadResponse {
    [self validateSecureCodingForClass:[AWSConnectParticipantStartAttachmentUploadResponse class]];
}

- (void) test_AWSConnectParticipantStartPosition {
    [self validateSecureCodingForClass:[AWSConnectParticipantStartPosition class]];
}

- (void) test_AWSConnectParticipantUploadMetadata {
    [self validateSecureCodingForClass:[AWSConnectParticipantUploadMetadata class]];
}

- (void) test_AWSConnectParticipantWebsocket {
    [self validateSecureCodingForClass:[AWSConnectParticipantWebsocket class]];
}

@end

