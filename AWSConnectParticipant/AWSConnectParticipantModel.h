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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSConnectParticipantErrorDomain;

typedef NS_ENUM(NSInteger, AWSConnectParticipantErrorType) {
    AWSConnectParticipantErrorUnknown,
    AWSConnectParticipantErrorAccessDenied,
    AWSConnectParticipantErrorConflict,
    AWSConnectParticipantErrorInternalServer,
    AWSConnectParticipantErrorServiceQuotaExceeded,
    AWSConnectParticipantErrorThrottling,
    AWSConnectParticipantErrorValidation,
};

typedef NS_ENUM(NSInteger, AWSConnectParticipantArtifactStatus) {
    AWSConnectParticipantArtifactStatusUnknown,
    AWSConnectParticipantArtifactStatusApproved,
    AWSConnectParticipantArtifactStatusRejected,
    AWSConnectParticipantArtifactStatusInProgress,
};

typedef NS_ENUM(NSInteger, AWSConnectParticipantChatItemType) {
    AWSConnectParticipantChatItemTypeUnknown,
    AWSConnectParticipantChatItemTypeTyping,
    AWSConnectParticipantChatItemTypeParticipantJoined,
    AWSConnectParticipantChatItemTypeParticipantLeft,
    AWSConnectParticipantChatItemTypeChatEnded,
    AWSConnectParticipantChatItemTypeTransferSucceeded,
    AWSConnectParticipantChatItemTypeTransferFailed,
    AWSConnectParticipantChatItemTypeMessage,
    AWSConnectParticipantChatItemTypeEvent,
    AWSConnectParticipantChatItemTypeAttachment,
    AWSConnectParticipantChatItemTypeConnectionAck,
    AWSConnectParticipantChatItemTypeParticipantActive,
    AWSConnectParticipantChatItemTypeParticipantInactive,
    AWSConnectParticipantChatItemTypeParticipantEngaged,
    AWSConnectParticipantChatItemTypeParticipantDisengaged,
};

typedef NS_ENUM(NSInteger, AWSConnectParticipantConnectionType) {
    AWSConnectParticipantConnectionTypeUnknown,
    AWSConnectParticipantConnectionTypeWebsocket,
    AWSConnectParticipantConnectionTypeConnectionCredentials,
};

typedef NS_ENUM(NSInteger, AWSConnectParticipantParticipantRole) {
    AWSConnectParticipantParticipantRoleUnknown,
    AWSConnectParticipantParticipantRoleAgent,
    AWSConnectParticipantParticipantRoleCustomer,
    AWSConnectParticipantParticipantRoleSystem,
};

typedef NS_ENUM(NSInteger, AWSConnectParticipantScanDirection) {
    AWSConnectParticipantScanDirectionUnknown,
    AWSConnectParticipantScanDirectionForward,
    AWSConnectParticipantScanDirectionBackward,
};

typedef NS_ENUM(NSInteger, AWSConnectParticipantSortKey) {
    AWSConnectParticipantSortKeyUnknown,
    AWSConnectParticipantSortKeyDescending,
    AWSConnectParticipantSortKeyAscending,
};

@class AWSConnectParticipantAttachmentItem;
@class AWSConnectParticipantCompleteAttachmentUploadRequest;
@class AWSConnectParticipantCompleteAttachmentUploadResponse;
@class AWSConnectParticipantConnectionCredentials;
@class AWSConnectParticipantCreateParticipantConnectionRequest;
@class AWSConnectParticipantCreateParticipantConnectionResponse;
@class AWSConnectParticipantDisconnectParticipantRequest;
@class AWSConnectParticipantDisconnectParticipantResponse;
@class AWSConnectParticipantGetAttachmentRequest;
@class AWSConnectParticipantGetAttachmentResponse;
@class AWSConnectParticipantGetTranscriptRequest;
@class AWSConnectParticipantGetTranscriptResponse;
@class AWSConnectParticipantItem;
@class AWSConnectParticipantSendEventRequest;
@class AWSConnectParticipantSendEventResponse;
@class AWSConnectParticipantSendMessageRequest;
@class AWSConnectParticipantSendMessageResponse;
@class AWSConnectParticipantStartAttachmentUploadRequest;
@class AWSConnectParticipantStartAttachmentUploadResponse;
@class AWSConnectParticipantStartPosition;
@class AWSConnectParticipantUploadMetadata;
@class AWSConnectParticipantWebsocket;

/**
 <p>The case-insensitive input to indicate standard MIME type that describes the format of the file that will be uploaded.</p>
 */
@interface AWSConnectParticipantAttachmentItem : AWSModel


/**
 <p>A unique identifier for the attachment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attachmentId;

/**
 <p>A case-sensitive name of the attachment being uploaded.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attachmentName;

/**
 <p>Describes the MIME file type of the attachment. For a list of supported file types, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#feature-limits">Feature specifications</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>Status of the attachment.</p>
 */
@property (nonatomic, assign) AWSConnectParticipantArtifactStatus status;

@end

/**
 
 */
@interface AWSConnectParticipantCompleteAttachmentUploadRequest : AWSRequest


/**
 <p>A list of unique identifiers for the attachments.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attachmentIds;

/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The authentication token associated with the participant's connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionToken;

@end

/**
 
 */
@interface AWSConnectParticipantCompleteAttachmentUploadResponse : AWSModel


@end

/**
 <p>Connection credentials. </p>
 */
@interface AWSConnectParticipantConnectionCredentials : AWSModel


/**
 <p>The connection token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionToken;

/**
 <p>The expiration of the token.</p><p>It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expiry;

@end

/**
 
 */
@interface AWSConnectParticipantCreateParticipantConnectionRequest : AWSRequest


/**
 <p>Amazon Connect Participant is used to mark the participant as connected for message streaming.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable connectParticipant;

/**
 <p>This is a header parameter.</p><p>The ParticipantToken as obtained from <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_StartChatContact.html">StartChatContact</a> API response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable participantToken;

/**
 <p>Type of connection information required.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable types;

@end

/**
 
 */
@interface AWSConnectParticipantCreateParticipantConnectionResponse : AWSModel


/**
 <p>Creates the participant's connection credentials. The authentication token associated with the participant's connection.</p>
 */
@property (nonatomic, strong) AWSConnectParticipantConnectionCredentials * _Nullable connectionCredentials;

/**
 <p>Creates the participant's websocket connection.</p>
 */
@property (nonatomic, strong) AWSConnectParticipantWebsocket * _Nullable websocket;

@end

/**
 
 */
@interface AWSConnectParticipantDisconnectParticipantRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The authentication token associated with the participant's connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionToken;

@end

/**
 
 */
@interface AWSConnectParticipantDisconnectParticipantResponse : AWSModel


@end

/**
 
 */
@interface AWSConnectParticipantGetAttachmentRequest : AWSRequest


/**
 <p>A unique identifier for the attachment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attachmentId;

/**
 <p>The authentication token associated with the participant's connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionToken;

@end

/**
 
 */
@interface AWSConnectParticipantGetAttachmentResponse : AWSModel


/**
 <p>This is the pre-signed URL that can be used for uploading the file to Amazon S3 when used in response to <a href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_StartAttachmentUpload.html">StartAttachmentUpload</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

/**
 <p>The expiration time of the URL in ISO timestamp. It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.</p>
 */
@property (nonatomic, strong) NSString * _Nullable urlExpiry;

@end

/**
 
 */
@interface AWSConnectParticipantGetTranscriptRequest : AWSRequest


/**
 <p>The authentication token associated with the participant's connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionToken;

/**
 <p>The contactId from the current contact chain for which transcript is needed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

/**
 <p>The maximum number of results to return in the page. Default: 10. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The pagination token. Use the value returned previously in the next subsequent request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The direction from StartPosition from which to retrieve message. Default: BACKWARD when no StartPosition is provided, FORWARD with StartPosition. </p>
 */
@property (nonatomic, assign) AWSConnectParticipantScanDirection scanDirection;

/**
 <p>The sort order for the records. Default: DESCENDING.</p>
 */
@property (nonatomic, assign) AWSConnectParticipantSortKey sortOrder;

/**
 <p>A filtering option for where to start.</p>
 */
@property (nonatomic, strong) AWSConnectParticipantStartPosition * _Nullable startPosition;

@end

/**
 
 */
@interface AWSConnectParticipantGetTranscriptResponse : AWSModel


/**
 <p>The initial contact ID for the contact. </p>
 */
@property (nonatomic, strong) NSString * _Nullable initialContactId;

/**
 <p>The pagination token. Use the value returned previously in the next subsequent request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of messages in the session.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectParticipantItem *> * _Nullable transcript;

@end

/**
 <p>An item - message or event - that has been sent. </p>
 */
@interface AWSConnectParticipantItem : AWSModel


/**
 <p>The time when the message or event was sent.</p><p>It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.</p>
 */
@property (nonatomic, strong) NSString * _Nullable absoluteTime;

/**
 <p>Provides information about the attachments.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectParticipantAttachmentItem *> * _Nullable attachments;

/**
 <p>The content of the message or event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The type of content of the item.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The chat display name of the sender.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The ID of the item.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The ID of the sender in the session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable participantId;

/**
 <p>The role of the sender. For example, is it a customer, agent, or system.</p>
 */
@property (nonatomic, assign) AWSConnectParticipantParticipantRole participantRole;

/**
 <p>Type of the item: message or event. </p>
 */
@property (nonatomic, assign) AWSConnectParticipantChatItemType types;

@end

/**
 
 */
@interface AWSConnectParticipantSendEventRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The authentication token associated with the participant's connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionToken;

/**
 <p>The content of the event to be sent (for example, message text). This is not yet supported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The content type of the request. Supported types are:</p><ul><li><p>application/vnd.amazonaws.connect.event.typing</p></li><li><p>application/vnd.amazonaws.connect.event.connection.acknowledged</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

@end

/**
 
 */
@interface AWSConnectParticipantSendEventResponse : AWSModel


/**
 <p>The time when the event was sent.</p><p>It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.</p>
 */
@property (nonatomic, strong) NSString * _Nullable absoluteTime;

/**
 <p>The ID of the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSConnectParticipantSendMessageRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The authentication token associated with the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionToken;

/**
 <p>The content of the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The type of the content. Supported types are text/plain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

@end

/**
 
 */
@interface AWSConnectParticipantSendMessageResponse : AWSModel


/**
 <p>The time when the message was sent.</p><p>It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.</p>
 */
@property (nonatomic, strong) NSString * _Nullable absoluteTime;

/**
 <p>The ID of the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSConnectParticipantStartAttachmentUploadRequest : AWSRequest


/**
 <p>A case-sensitive name of the attachment being uploaded.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attachmentName;

/**
 <p>The size of the attachment in bytes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable attachmentSizeInBytes;

/**
 <p>A unique case sensitive identifier to support idempotency of request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The authentication token associated with the participant's connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionToken;

/**
 <p>Describes the MIME file type of the attachment. For a list of supported file types, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#feature-limits">Feature specifications</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

@end

/**
 
 */
@interface AWSConnectParticipantStartAttachmentUploadResponse : AWSModel


/**
 <p>A unique identifier for the attachment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attachmentId;

/**
 <p>Fields to be used while uploading the attachment.</p>
 */
@property (nonatomic, strong) AWSConnectParticipantUploadMetadata * _Nullable uploadMetadata;

@end

/**
 <p>A filtering option for where to start. For example, if you sent 100 messages, start with message 50. </p>
 */
@interface AWSConnectParticipantStartPosition : AWSModel


/**
 <p>The time in ISO format where to start.</p><p>It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.</p>
 */
@property (nonatomic, strong) NSString * _Nullable absoluteTime;

/**
 <p>The ID of the message or event where to start. </p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The start position of the most recent message where you want to start. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mostRecent;

@end

/**
 <p>Fields to be used while uploading the attachment.</p>
 */
@interface AWSConnectParticipantUploadMetadata : AWSModel


/**
 <p>The headers to be provided while uploading the file to the URL.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable headersToInclude;

/**
 <p>This is the pre-signed URL that can be used for uploading the file to Amazon S3 when used in response to <a href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_StartAttachmentUpload.html">StartAttachmentUpload</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

/**
 <p>The expiration time of the URL in ISO timestamp. It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.</p>
 */
@property (nonatomic, strong) NSString * _Nullable urlExpiry;

@end

/**
 <p>The websocket for the participant's connection.</p>
 */
@interface AWSConnectParticipantWebsocket : AWSModel


/**
 <p>The URL expiration timestamp in ISO date format.</p><p>It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionExpiry;

/**
 <p>The URL of the websocket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

NS_ASSUME_NONNULL_END
