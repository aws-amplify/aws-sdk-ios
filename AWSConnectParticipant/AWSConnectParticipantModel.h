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
    AWSConnectParticipantErrorResourceNotFound,
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
    AWSConnectParticipantChatItemTypeMessageDelivered,
    AWSConnectParticipantChatItemTypeMessageRead,
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
    AWSConnectParticipantParticipantRoleCustomBot,
    AWSConnectParticipantParticipantRoleSupervisor,
};

typedef NS_ENUM(NSInteger, AWSConnectParticipantResourceType) {
    AWSConnectParticipantResourceTypeUnknown,
    AWSConnectParticipantResourceTypeContact,
    AWSConnectParticipantResourceTypeContactFlow,
    AWSConnectParticipantResourceTypeInstance,
    AWSConnectParticipantResourceTypeParticipant,
    AWSConnectParticipantResourceTypeHierarchyLevel,
    AWSConnectParticipantResourceTypeHierarchyGroup,
    AWSConnectParticipantResourceTypeUser,
    AWSConnectParticipantResourceTypePhoneNumber,
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
@class AWSConnectParticipantDescribeViewRequest;
@class AWSConnectParticipantDescribeViewResponse;
@class AWSConnectParticipantDisconnectParticipantRequest;
@class AWSConnectParticipantDisconnectParticipantResponse;
@class AWSConnectParticipantGetAttachmentRequest;
@class AWSConnectParticipantGetAttachmentResponse;
@class AWSConnectParticipantGetTranscriptRequest;
@class AWSConnectParticipantGetTranscriptResponse;
@class AWSConnectParticipantItem;
@class AWSConnectParticipantMessageMetadata;
@class AWSConnectParticipantReceipt;
@class AWSConnectParticipantSendEventRequest;
@class AWSConnectParticipantSendEventResponse;
@class AWSConnectParticipantSendMessageRequest;
@class AWSConnectParticipantSendMessageResponse;
@class AWSConnectParticipantStartAttachmentUploadRequest;
@class AWSConnectParticipantStartAttachmentUploadResponse;
@class AWSConnectParticipantStartPosition;
@class AWSConnectParticipantUploadMetadata;
@class AWSConnectParticipantView;
@class AWSConnectParticipantViewContent;
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
 <p>Describes the MIME file type of the attachment. For a list of supported file types, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/feature-limits.html">Feature specifications</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
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
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making retries safe with idempotent APIs</a>.</p>
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
 <p>Amazon Connect Participant is used to mark the participant as connected for customer participant in message streaming, as well as for agent or manager participant in non-streaming chats.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable connectParticipant;

/**
 <p>This is a header parameter.</p><p>The ParticipantToken as obtained from <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_StartChatContact.html">StartChatContact</a> API response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable participantToken;

/**
 <p>Type of connection information required. If you need <code>CONNECTION_CREDENTIALS</code> along with marking participant as connected, pass <code>CONNECTION_CREDENTIALS</code> in <code>Type</code>.</p>
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
@interface AWSConnectParticipantDescribeViewRequest : AWSRequest


/**
 <p>The connection token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionToken;

/**
 <p>An encrypted token originating from the interactive message of a ShowView block operation. Represents the desired view.</p>
 */
@property (nonatomic, strong) NSString * _Nullable viewToken;

@end

/**
 
 */
@interface AWSConnectParticipantDescribeViewResponse : AWSModel


/**
 <p>A view resource object. Contains metadata and content necessary to render the view.</p>
 */
@property (nonatomic, strong) AWSConnectParticipantView * _Nullable view;

@end

/**
 
 */
@interface AWSConnectParticipantDisconnectParticipantRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making retries safe with idempotent APIs</a>.</p>
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
 <p>The contactId on which the transcript item was originally sent. This field is populated only when the transcript item is from the current chat session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

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
 <p>The metadata related to the message. Currently this supports only information related to message receipts.</p>
 */
@property (nonatomic, strong) AWSConnectParticipantMessageMetadata * _Nullable messageMetadata;

/**
 <p>The ID of the sender in the session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable participantId;

/**
 <p>The role of the sender. For example, is it a customer, agent, or system.</p>
 */
@property (nonatomic, assign) AWSConnectParticipantParticipantRole participantRole;

/**
 <p>The contactId on which the transcript item was originally sent. This field is only populated for persistent chats when the transcript item is from the past chat session. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/chat-persistence.html">Enable persistent chat</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relatedContactId;

/**
 <p>Type of the item: message or event. </p>
 */
@property (nonatomic, assign) AWSConnectParticipantChatItemType types;

@end

/**
 <p>Contains metadata related to a message.</p>
 */
@interface AWSConnectParticipantMessageMetadata : AWSModel


/**
 <p>The identifier of the message that contains the metadata information. </p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

/**
 <p>The list of receipt information for a message for different recipients.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectParticipantReceipt *> * _Nullable receipts;

@end

/**
 <p>The receipt for the message delivered to the recipient.</p>
 */
@interface AWSConnectParticipantReceipt : AWSModel


/**
 <p>The time when the message was delivered to the recipient.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deliveredTimestamp;

/**
 <p>The time when the message was read by the recipient.</p>
 */
@property (nonatomic, strong) NSString * _Nullable readTimestamp;

/**
 <p>The identifier of the recipient of the message. </p>
 */
@property (nonatomic, strong) NSString * _Nullable recipientParticipantId;

@end

/**
 
 */
@interface AWSConnectParticipantSendEventRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making retries safe with idempotent APIs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The authentication token associated with the participant's connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionToken;

/**
 <p>The content of the event to be sent (for example, message text). For content related to message receipts, this is supported in the form of a JSON string.</p><p>Sample Content: "{\"messageId\":\"11111111-aaaa-bbbb-cccc-EXAMPLE01234\"}"</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The content type of the request. Supported types are:</p><ul><li><p>application/vnd.amazonaws.connect.event.typing</p></li><li><p>application/vnd.amazonaws.connect.event.connection.acknowledged (will be deprecated on December 31, 2024) </p></li><li><p>application/vnd.amazonaws.connect.event.message.delivered</p></li><li><p>application/vnd.amazonaws.connect.event.message.read</p></li></ul>
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
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making retries safe with idempotent APIs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The authentication token associated with the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionToken;

/**
 <p>The content of the message. </p><ul><li><p>For <code>text/plain</code> and <code>text/markdown</code>, the Length Constraints are Minimum of 1, Maximum of 1024. </p></li><li><p>For <code>application/json</code>, the Length Constraints are Minimum of 1, Maximum of 12000. </p></li><li><p>For <code>application/vnd.amazonaws.connect.message.interactive.response</code>, the Length Constraints are Minimum of 1, Maximum of 12288.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The type of the content. Supported types are <code>text/plain</code>, <code>text/markdown</code>, <code>application/json</code>, and <code>application/vnd.amazonaws.connect.message.interactive.response</code>.</p>
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
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making retries safe with idempotent APIs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The authentication token associated with the participant's connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionToken;

/**
 <p>Describes the MIME file type of the attachment. For a list of supported file types, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/feature-limits.html">Feature specifications</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
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
 <p>A view resource object. Contains metadata and content necessary to render the view.</p>
 */
@interface AWSConnectParticipantView : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the view.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>View content containing all content necessary to render a view except for runtime input data.</p>
 */
@property (nonatomic, strong) AWSConnectParticipantViewContent * _Nullable content;

/**
 <p>The identifier of the view.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the view.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The current version of the view.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>View content containing all content necessary to render a view except for runtime input data.</p>
 */
@interface AWSConnectParticipantViewContent : AWSModel


/**
 <p>A list of actions possible from the view</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable actions;

/**
 <p>The schema representing the input data that the view template must be supplied to render.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputSchema;

/**
 <p>The view template representing the structure of the view.</p>
 */
@property (nonatomic, strong) NSString * _Nullable template;

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
