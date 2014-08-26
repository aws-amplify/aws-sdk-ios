/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import "AWSNetworking.h"
#import "AWSModel.h"

FOUNDATION_EXPORT NSString *const AWSSQSErrorDomain;

typedef NS_ENUM(NSInteger, AWSSQSErrorType) {
    AWSSQSErrorUnknown,
    AWSSQSErrorIncompleteSignature,
    AWSSQSErrorInvalidClientTokenId,
    AWSSQSErrorMissingAuthenticationToken,
    AWSSQSErrorBatchEntryIdsNotDistinct,
    AWSSQSErrorBatchRequestTooLong,
    AWSSQSErrorEmptyBatchRequest,
    AWSSQSErrorInvalidAttributeName,
    AWSSQSErrorInvalidBatchEntryId,
    AWSSQSErrorInvalidIdFormat,
    AWSSQSErrorInvalidMessageContents,
    AWSSQSErrorMessageNotInflight,
    AWSSQSErrorOverLimit,
    AWSSQSErrorQueueDeletedRecently,
    AWSSQSErrorQueueDoesNotExist,
    AWSSQSErrorQueueNameExists,
    AWSSQSErrorReceiptHandleIsInvalid,
    AWSSQSErrorTooManyEntriesInBatchRequest,
    AWSSQSErrorUnsupportedOperation,
};

typedef NS_ENUM(NSInteger, AWSSQSQueueAttributeName) {
    AWSSQSQueueAttributeNameUnknown,
    AWSSQSQueueAttributeNamePolicy,
    AWSSQSQueueAttributeNameVisibilityTimeout,
    AWSSQSQueueAttributeNameMaximumMessageSize,
    AWSSQSQueueAttributeNameMessageRetentionPeriod,
    AWSSQSQueueAttributeNameApproximateNumberOfMessages,
    AWSSQSQueueAttributeNameApproximateNumberOfMessagesNotVisible,
    AWSSQSQueueAttributeNameCreatedTimestamp,
    AWSSQSQueueAttributeNameLastModifiedTimestamp,
    AWSSQSQueueAttributeNameQueueArn,
    AWSSQSQueueAttributeNameApproximateNumberOfMessagesDelayed,
    AWSSQSQueueAttributeNameDelaySeconds,
    AWSSQSQueueAttributeNameReceiveMessageWaitTimeSeconds,
    AWSSQSQueueAttributeNameRedrivePolicy,
};

@class AWSSQSAddPermissionRequest;
@class AWSSQSBatchResultErrorEntry;
@class AWSSQSChangeMessageVisibilityBatchRequest;
@class AWSSQSChangeMessageVisibilityBatchRequestEntry;
@class AWSSQSChangeMessageVisibilityBatchResult;
@class AWSSQSChangeMessageVisibilityBatchResultEntry;
@class AWSSQSChangeMessageVisibilityRequest;
@class AWSSQSCreateQueueRequest;
@class AWSSQSCreateQueueResult;
@class AWSSQSDeleteMessageBatchRequest;
@class AWSSQSDeleteMessageBatchRequestEntry;
@class AWSSQSDeleteMessageBatchResult;
@class AWSSQSDeleteMessageBatchResultEntry;
@class AWSSQSDeleteMessageRequest;
@class AWSSQSDeleteQueueRequest;
@class AWSSQSGetQueueAttributesRequest;
@class AWSSQSGetQueueAttributesResult;
@class AWSSQSGetQueueUrlRequest;
@class AWSSQSGetQueueUrlResult;
@class AWSSQSListDeadLetterSourceQueuesRequest;
@class AWSSQSListDeadLetterSourceQueuesResult;
@class AWSSQSListQueuesRequest;
@class AWSSQSListQueuesResult;
@class AWSSQSMessage;
@class AWSSQSMessageAttributeValue;
@class AWSSQSReceiveMessageRequest;
@class AWSSQSReceiveMessageResult;
@class AWSSQSRemovePermissionRequest;
@class AWSSQSSendMessageBatchRequest;
@class AWSSQSSendMessageBatchRequestEntry;
@class AWSSQSSendMessageBatchResult;
@class AWSSQSSendMessageBatchResultEntry;
@class AWSSQSSendMessageRequest;
@class AWSSQSSendMessageResult;
@class AWSSQSSetQueueAttributesRequest;

@interface AWSSQSAddPermissionRequest : AWSRequest


/**
 * <p>The AWS account number of the <a href="http://docs.aws.amazon.com/general/latest/gr/glos-chap.html#P">principal</a> who will be given permission. The principal must have an AWS account, but does not need to be signed up for Amazon SQS. For information about locating the AWS account identification, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/AWSCredentials.html">Your AWS Identifiers</a> in the <i>Amazon SQS Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray *AWSAccountIds;

/**
 * <p>The action the client wants to allow for the specified principal. The following are valid values: <code>* | SendMessage | ReceiveMessage | DeleteMessage | ChangeMessageVisibility | GetQueueAttributes | GetQueueUrl</code>. For more information about these actions, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/acp-overview.html#PermissionTypes">Understanding Permissions</a> in the <i>Amazon SQS Developer Guide</i>.</p><p>Specifying <code>SendMessage</code>, <code>DeleteMessage</code>, or <code>ChangeMessageVisibility</code> for the <code>ActionName.n</code> also grants permissions for the corresponding batch versions of those actions: <code>SendMessageBatch</code>, <code>DeleteMessageBatch</code>, and <code>ChangeMessageVisibilityBatch</code>.</p>
 */
@property (nonatomic, strong) NSArray *actions;

/**
 * <p>The unique identification of the permission you're setting (e.g., <code>AliceSendMessage</code>). Constraints: Maximum 80 characters; alphanumeric characters, hyphens (-), and underscores (_) are allowed.</p>
 */
@property (nonatomic, strong) NSString *label;

/**
 * <p>The URL of the Amazon SQS queue to take action on.</p>
 */
@property (nonatomic, strong) NSString *queueUrl;

@end

/**
 * <p>This is used in the responses of batch API to give a detailed description of the result of an action on each entry in the request.</p>
 * Required parameters: [Id, SenderFault, Code]
 */
@interface AWSSQSBatchResultErrorEntry : AWSModel


/**
 * <p>An error code representing why the action failed on this entry.</p>
 */
@property (nonatomic, strong) NSString *code;

/**
 * <p>The id of an entry in a batch request.</p>
 */
@property (nonatomic, strong) NSString *id;

/**
 * <p>A message explaining why the action failed on this entry.</p>
 */
@property (nonatomic, strong) NSString *message;

/**
 * <p>Whether the error happened due to the sender's fault.</p>
 */
@property (nonatomic, strong) NSNumber *senderFault;

@end

@interface AWSSQSChangeMessageVisibilityBatchRequest : AWSRequest


/**
 * <p>A list of receipt handles of the messages for which the visibility timeout must be changed.</p>
 */
@property (nonatomic, strong) NSArray *entries;

/**
 * <p>The URL of the Amazon SQS queue to take action on.</p>
 */
@property (nonatomic, strong) NSString *queueUrl;

@end

/**
 * <p>Encloses a receipt handle and an entry id for each message in <a>ChangeMessageVisibilityBatch</a>. </p><important><p>All of the following parameters are list parameters that must be prefixed with <code>ChangeMessageVisibilityBatchRequestEntry.n</code>, where <code>n</code> is an integer value starting with 1. For example, a parameter list for this action might look like this:</p></important><p><code>&amp;ChangeMessageVisibilityBatchRequestEntry.1.Id=change_visibility_msg_2</code></p><p><code>&amp;ChangeMessageVisibilityBatchRequestEntry.1.ReceiptHandle=<replaceable>Your_Receipt_Handle</replaceable></code></p><p><code>&amp;ChangeMessageVisibilityBatchRequestEntry.1.VisibilityTimeout=45</code></p>
 * Required parameters: [Id, ReceiptHandle]
 */
@interface AWSSQSChangeMessageVisibilityBatchRequestEntry : AWSModel


/**
 * <p>An identifier for this particular receipt handle. This is used to communicate the result. Note that the <code>Id</code>s of a batch request need to be unique within the request.</p>
 */
@property (nonatomic, strong) NSString *id;

/**
 * <p>A receipt handle.</p>
 */
@property (nonatomic, strong) NSString *receiptHandle;

/**
 * <p>The new value (in seconds) for the message's visibility timeout.</p>
 */
@property (nonatomic, strong) NSNumber *visibilityTimeout;

@end

/**
 * <p> For each message in the batch, the response contains a <a>ChangeMessageVisibilityBatchResultEntry</a> tag if the message succeeds or a <a>BatchResultErrorEntry</a> tag if the message fails. </p>
 * Required parameters: [Successful, Failed]
 */
@interface AWSSQSChangeMessageVisibilityBatchResult : AWSModel


/**
 * <p>A list of <a>BatchResultErrorEntry</a> items.</p>
 */
@property (nonatomic, strong) NSArray *failed;

/**
 * <p>A list of <a>ChangeMessageVisibilityBatchResultEntry</a> items.</p>
 */
@property (nonatomic, strong) NSArray *successful;

@end

/**
 * <p>Encloses the id of an entry in <a>ChangeMessageVisibilityBatch</a>.</p>
 * Required parameters: [Id]
 */
@interface AWSSQSChangeMessageVisibilityBatchResultEntry : AWSModel


/**
 * <p>Represents a message whose visibility timeout has been changed successfully.</p>
 */
@property (nonatomic, strong) NSString *id;

@end

@interface AWSSQSChangeMessageVisibilityRequest : AWSRequest


/**
 * <p>The URL of the Amazon SQS queue to take action on.</p>
 */
@property (nonatomic, strong) NSString *queueUrl;

/**
 * <p>The receipt handle associated with the message whose visibility timeout should be changed. This parameter is returned by the <a>ReceiveMessage</a> action.</p>
 */
@property (nonatomic, strong) NSString *receiptHandle;

/**
 * <p>The new value (in seconds - from 0 to 43200 - maximum 12 hours) for the message's visibility timeout.</p>
 */
@property (nonatomic, strong) NSNumber *visibilityTimeout;

@end

@interface AWSSQSCreateQueueRequest : AWSRequest


/**
 * <p>A map of attributes with their corresponding values.</p><p>The following lists the names, descriptions, and values of the special request parameters the <code>CreateQueue</code> action uses:</p><p><ul><li><code>DelaySeconds</code> - The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes). The default for this attribute is 0 (zero).</li><li><code>MaximumMessageSize</code> - The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB). The default for this attribute is 262144 (256 KiB).</li><li><code>MessageRetentionPeriod</code> - The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days). The default for this attribute is 345600 (4 days).</li><li><code>Policy</code> - The queue's policy. A valid form-url-encoded policy. For more information about policy structure, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/BasicStructure.html">Basic Policy Structure</a> in the <i>Amazon SQS Developer Guide</i>. For more information about form-url-encoding, see <a href="http://www.w3.org/MarkUp/html-spec/html-spec_8.html#SEC8.2.1">http://www.w3.org/MarkUp/html-spec/html-spec_8.html#SEC8.2.1</a>.</li><li><code>ReceiveMessageWaitTimeSeconds</code> - The time for which a <a>ReceiveMessage</a> call will wait for a message to arrive. An integer from 0 to 20 (seconds). The default for this attribute is 0. </li><li><code>VisibilityTimeout</code> - The visibility timeout for the queue. An integer from 0 to 43200 (12 hours). The default for this attribute is 30. For more information about visibility timeout, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/AboutVT.html">Visibility Timeout</a> in the <i>Amazon SQS Developer Guide</i>.</li></ul></p>
 */
@property (nonatomic, strong) NSDictionary *attributes;

/**
 * <p>The name for the queue to be created.</p>
 */
@property (nonatomic, strong) NSString *queueName;

@end

/**
 * <p>Returns the QueueUrl element of the created queue.</p>
 */
@interface AWSSQSCreateQueueResult : AWSModel


/**
 * <p>The URL for the created Amazon SQS queue.</p>
 */
@property (nonatomic, strong) NSString *queueUrl;

@end

@interface AWSSQSDeleteMessageBatchRequest : AWSRequest


/**
 * <p>A list of receipt handles for the messages to be deleted.</p>
 */
@property (nonatomic, strong) NSArray *entries;

/**
 * <p>The URL of the Amazon SQS queue to take action on.</p>
 */
@property (nonatomic, strong) NSString *queueUrl;

@end

/**
 * <p>Encloses a receipt handle and an identifier for it.</p>
 * Required parameters: [Id, ReceiptHandle]
 */
@interface AWSSQSDeleteMessageBatchRequestEntry : AWSModel


/**
 * <p>An identifier for this particular receipt handle. This is used to communicate the result. Note that the <code>Id</code>s of a batch request need to be unique within the request.</p>
 */
@property (nonatomic, strong) NSString *id;

/**
 * <p>A receipt handle.</p>
 */
@property (nonatomic, strong) NSString *receiptHandle;

@end

/**
 * <p> For each message in the batch, the response contains a <a>DeleteMessageBatchResultEntry</a> tag if the message is deleted or a <a>BatchResultErrorEntry</a> tag if the message cannot be deleted. </p>
 * Required parameters: [Successful, Failed]
 */
@interface AWSSQSDeleteMessageBatchResult : AWSModel


/**
 * <p>A list of <a>BatchResultErrorEntry</a> items.</p>
 */
@property (nonatomic, strong) NSArray *failed;

/**
 * <p>A list of <a>DeleteMessageBatchResultEntry</a> items.</p>
 */
@property (nonatomic, strong) NSArray *successful;

@end

/**
 * <p>Encloses the id an entry in <a>DeleteMessageBatch</a>.</p>
 * Required parameters: [Id]
 */
@interface AWSSQSDeleteMessageBatchResultEntry : AWSModel


/**
 * <p>Represents a successfully deleted message.</p>
 */
@property (nonatomic, strong) NSString *id;

@end

@interface AWSSQSDeleteMessageRequest : AWSRequest


/**
 * <p>The URL of the Amazon SQS queue to take action on.</p>
 */
@property (nonatomic, strong) NSString *queueUrl;

/**
 * <p>The receipt handle associated with the message to delete.</p>
 */
@property (nonatomic, strong) NSString *receiptHandle;

@end

@interface AWSSQSDeleteQueueRequest : AWSRequest


/**
 * <p>The URL of the Amazon SQS queue to take action on.</p>
 */
@property (nonatomic, strong) NSString *queueUrl;

@end

@interface AWSSQSGetQueueAttributesRequest : AWSRequest


/**
 * <p>A list of attributes to retrieve information for. </p>
 */
@property (nonatomic, strong) NSArray *attributeNames;

/**
 * <p>The URL of the Amazon SQS queue to take action on.</p>
 */
@property (nonatomic, strong) NSString *queueUrl;

@end

/**
 * A list of returned queue attributes.
 */
@interface AWSSQSGetQueueAttributesResult : AWSModel


/**
 * <p>A map of attributes to the respective values.</p>
 */
@property (nonatomic, strong) NSDictionary *attributes;

@end

@interface AWSSQSGetQueueUrlRequest : AWSRequest


/**
 * <p>The name of the queue whose URL must be fetched. Maximum 80 characters; alphanumeric characters, hyphens (-), and underscores (_) are allowed.</p>
 */
@property (nonatomic, strong) NSString *queueName;

/**
 * <p>The AWS account ID of the account that created the queue.</p>
 */
@property (nonatomic, strong) NSString *queueOwnerAWSAccountId;

@end

/**
 * <p>For more information, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/UnderstandingResponses.html">Responses</a> in the <i>Amazon SQS Developer Guide</i>.</p>
 */
@interface AWSSQSGetQueueUrlResult : AWSModel


/**
 * <p>The URL for the queue.</p>
 */
@property (nonatomic, strong) NSString *queueUrl;

@end

@interface AWSSQSListDeadLetterSourceQueuesRequest : AWSRequest


/**
 * The queue URL of a dead letter queue.
 */
@property (nonatomic, strong) NSString *queueUrl;

@end

/**
 * A list of your dead letter source queues.
 * Required parameters: [queueUrls]
 */
@interface AWSSQSListDeadLetterSourceQueuesResult : AWSModel


/**
 * A list of source queue URLs that have the RedrivePolicy queue attribute configured with a dead letter queue.
 */
@property (nonatomic, strong) NSArray *queueUrls;

@end

@interface AWSSQSListQueuesRequest : AWSRequest


/**
 * <p>A string to use for filtering the list results. Only those queues whose name begins with the specified string are returned.</p>
 */
@property (nonatomic, strong) NSString *queueNamePrefix;

@end

/**
 * A list of your queues.
 */
@interface AWSSQSListQueuesResult : AWSModel


/**
 * <p>A list of queue URLs, up to 1000 entries.</p>
 */
@property (nonatomic, strong) NSArray *queueUrls;

@end

/**
 * <p>An Amazon SQS message.</p>
 */
@interface AWSSQSMessage : AWSModel


/**
 * <p><code>SenderId</code>, <code>SentTimestamp</code>, <code>ApproximateReceiveCount</code>, and/or <code>ApproximateFirstReceiveTimestamp</code>. <code>SentTimestamp</code> and <code>ApproximateFirstReceiveTimestamp</code> are each returned as an integer representing the <a href="http://en.wikipedia.org/wiki/Unix_time">epoch time</a> in milliseconds.</p>
 */
@property (nonatomic, strong) NSDictionary *attributes;

/**
 * <p>The message's contents (not URL-encoded).</p>
 */
@property (nonatomic, strong) NSString *body;

/**
 * <p>An MD5 digest of the non-URL-encoded message body string.</p>
 */
@property (nonatomic, strong) NSString *MD5OfBody;

/**
 * <p>An MD5 digest of the non-URL-encoded message attribute string. This can be used to verify that Amazon SQS received the message correctly. Amazon SQS first URL decodes the message before creating the MD5 digest. For information about MD5, go to <a href="http://www.faqs.org/rfcs/rfc1321.html">http://www.faqs.org/rfcs/rfc1321.html</a>.</p>
 */
@property (nonatomic, strong) NSString *MD5OfMessageAttributes;

/**
 * <p>Each message attribute consists of a Name, Type, and Value. For more information, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/SQSMessageAttributes.html#SQSMessageAttributesNTV">Message Attribute Items</a>.</p>
 */
@property (nonatomic, strong) NSDictionary *messageAttributes;

/**
 * <p>A unique identifier for the message. Message IDs are considered unique across all AWS accounts for an extended period of time.</p>
 */
@property (nonatomic, strong) NSString *messageId;

/**
 * <p>An identifier associated with the act of receiving the message. A new receipt handle is returned every time you receive a message. When deleting a message, you provide the last received receipt handle to delete the message.</p>
 */
@property (nonatomic, strong) NSString *receiptHandle;

@end

/**
 * <p>The user-specified message attribute value. For string data types, the value attribute has the same restrictions on the content as the message body. For more information, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_SendMessage.html">SendMessage</a>.</p><p>Name, type, and value must not be empty or null. In addition, the message body should not be empty or null. All parts of the message attribute, including name, type, and value, are included in the message size restriction, which is currently 256 KB (262,144 bytes).</p>
 * Required parameters: [DataType]
 */
@interface AWSSQSMessageAttributeValue : AWSModel


/**
 * <p>Not implemented. Reserved for future use.</p>
 */
@property (nonatomic, strong) NSArray *binaryListValues;

/**
 * <p>Binary type attributes can store any binary data, for example, compressed data, encrypted data, or images.</p>
 */
@property (nonatomic, strong) NSData *binaryValue;

/**
 * <p>Amazon SQS supports the following logical data types: String, Number, and Binary. In addition, you can append your own custom labels. For more information, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/SQSMessageAttributes.html#SQSMessageAttributes.DataTypes">Message Attribute Data Types</a>.</p>
 */
@property (nonatomic, strong) NSString *dataType;

/**
 * <p>Not implemented. Reserved for future use.</p>
 */
@property (nonatomic, strong) NSArray *stringListValues;

/**
 * <p>Strings are Unicode with UTF8 binary encoding. For a list of code values, see <a href="http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters">http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters</a>.</p>
 */
@property (nonatomic, strong) NSString *stringValue;

@end

@interface AWSSQSReceiveMessageRequest : AWSRequest


/**
 * <p>A list of attributes that need to be returned along with each message. </p><p> The following lists the names and descriptions of the attributes that can be returned: </p><ul><li><code>All</code> - returns all values.</li><li><code>ApproximateFirstReceiveTimestamp</code> - returns the time when the message was first received (epoch time in milliseconds).</li><li><code>ApproximateReceiveCount</code> - returns the number of times a message has been received but not deleted.</li><li><code>SenderId</code> - returns the AWS account number (or the IP address, if anonymous access is allowed) of the sender.</li><li><code>SentTimestamp</code> - returns the time when the message was sent (epoch time in milliseconds).</li></ul>
 */
@property (nonatomic, strong) NSArray *attributeNames;

/**
 * <p>The maximum number of messages to return. Amazon SQS never returns more messages than this value but may return fewer. Values can be from 1 to 10. Default is 1.</p><p>All of the messages are not necessarily returned.</p>
 */
@property (nonatomic, strong) NSNumber *maxNumberOfMessages;

/**
 * <p>The message attribute Name can contain the following characters: A-Z, a-z, 0-9, underscore(_), hyphen(-), and period (.). The message attribute name must not start or end with a period, and it should not have successive periods. The message attribute name is case sensitive and must be unique among all attribute names for the message. The message attribute name can be up to 256 characters long. Attribute names cannot start with "AWS." or "Amazon." because these prefixes are reserved for use by Amazon Web Services.</p>
 */
@property (nonatomic, strong) NSArray *messageAttributeNames;

/**
 * <p>The URL of the Amazon SQS queue to take action on.</p>
 */
@property (nonatomic, strong) NSString *queueUrl;

/**
 * <p>The duration (in seconds) that the received messages are hidden from subsequent retrieve requests after being retrieved by a <code>ReceiveMessage</code> request.</p>
 */
@property (nonatomic, strong) NSNumber *visibilityTimeout;

/**
 * <p>The duration (in seconds) for which the call will wait for a message to arrive in the queue before returning. If a message is available, the call will return sooner than WaitTimeSeconds.</p>
 */
@property (nonatomic, strong) NSNumber *waitTimeSeconds;

@end

/**
 * A list of received messages.
 */
@interface AWSSQSReceiveMessageResult : AWSModel


/**
 * <p>A list of messages.</p>
 */
@property (nonatomic, strong) NSArray *messages;

@end

@interface AWSSQSRemovePermissionRequest : AWSRequest


/**
 * <p>The identification of the permission to remove. This is the label added with the <a>AddPermission</a> action.</p>
 */
@property (nonatomic, strong) NSString *label;

/**
 * <p>The URL of the Amazon SQS queue to take action on.</p>
 */
@property (nonatomic, strong) NSString *queueUrl;

@end

@interface AWSSQSSendMessageBatchRequest : AWSRequest


/**
 * <p>A list of <a>SendMessageBatchRequestEntry</a> items.</p>
 */
@property (nonatomic, strong) NSArray *entries;

/**
 * <p>The URL of the Amazon SQS queue to take action on.</p>
 */
@property (nonatomic, strong) NSString *queueUrl;

@end

/**
 * <p>Contains the details of a single Amazon SQS message along with a <code>Id</code>. </p>
 * Required parameters: [Id, MessageBody]
 */
@interface AWSSQSSendMessageBatchRequestEntry : AWSModel


/**
 * <p>The number of seconds for which the message has to be delayed.</p>
 */
@property (nonatomic, strong) NSNumber *delaySeconds;

/**
 * <p>An identifier for the message in this batch. This is used to communicate the result. Note that the <code>Id</code>s of a batch request need to be unique within the request.</p>
 */
@property (nonatomic, strong) NSString *id;

/**
 * <p>Each message attribute consists of a Name, Type, and Value. For more information, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/SQSMessageAttributes.html#SQSMessageAttributesNTV">Message Attribute Items</a>.</p>
 */
@property (nonatomic, strong) NSDictionary *messageAttributes;

/**
 * <p>Body of the message.</p>
 */
@property (nonatomic, strong) NSString *messageBody;

@end

/**
 * <p>For each message in the batch, the response contains a <a>SendMessageBatchResultEntry</a> tag if the message succeeds or a <a>BatchResultErrorEntry</a> tag if the message fails.</p>
 * Required parameters: [Successful, Failed]
 */
@interface AWSSQSSendMessageBatchResult : AWSModel


/**
 * <p>A list of <a>BatchResultErrorEntry</a> items with the error detail about each message that could not be enqueued.</p>
 */
@property (nonatomic, strong) NSArray *failed;

/**
 * <p>A list of <a>SendMessageBatchResultEntry</a> items.</p>
 */
@property (nonatomic, strong) NSArray *successful;

@end

/**
 * <p>Encloses a message ID for successfully enqueued message of a <a>SendMessageBatch</a>.</p>
 * Required parameters: [Id, MessageId, MD5OfMessageBody]
 */
@interface AWSSQSSendMessageBatchResultEntry : AWSModel


/**
 * <p>An identifier for the message in this batch.</p>
 */
@property (nonatomic, strong) NSString *id;

/**
 * <p>An MD5 digest of the non-URL-encoded message attribute string. This can be used to verify that Amazon SQS received the message batch correctly. Amazon SQS first URL decodes the message before creating the MD5 digest. For information about MD5, go to <a href="http://www.faqs.org/rfcs/rfc1321.html">http://www.faqs.org/rfcs/rfc1321.html</a>.</p>
 */
@property (nonatomic, strong) NSString *MD5OfMessageAttributes;

/**
 * <p>An MD5 digest of the non-URL-encoded message body string. This can be used to verify that Amazon SQS received the message correctly. Amazon SQS first URL decodes the message before creating the MD5 digest. For information about MD5, go to <a href="http://www.faqs.org/rfcs/rfc1321.html">http://www.faqs.org/rfcs/rfc1321.html</a>.</p>
 */
@property (nonatomic, strong) NSString *MD5OfMessageBody;

/**
 * <p>An identifier for the message.</p>
 */
@property (nonatomic, strong) NSString *messageId;

@end

@interface AWSSQSSendMessageRequest : AWSRequest


/**
 * <p> The number of seconds (0 to 900 - 15 minutes) to delay a specific message. Messages with a positive <code>DelaySeconds</code> value become available for processing after the delay time is finished. If you don't specify a value, the default value for the queue applies. </p>
 */
@property (nonatomic, strong) NSNumber *delaySeconds;

/**
 * <p>Each message attribute consists of a Name, Type, and Value. For more information, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/SQSMessageAttributes.html#SQSMessageAttributesNTV">Message Attribute Items</a>.</p>
 */
@property (nonatomic, strong) NSDictionary *messageAttributes;

/**
 * <p>The message to send. String maximum 256 KB in size. For a list of allowed characters, see the preceding important note.</p>
 */
@property (nonatomic, strong) NSString *messageBody;

/**
 * <p>The URL of the Amazon SQS queue to take action on.</p>
 */
@property (nonatomic, strong) NSString *queueUrl;

@end

/**
 * <p>The MD5OfMessageBody and MessageId elements.</p>
 */
@interface AWSSQSSendMessageResult : AWSModel


/**
 * <p>An MD5 digest of the non-URL-encoded message attribute string. This can be used to verify that Amazon SQS received the message correctly. Amazon SQS first URL decodes the message before creating the MD5 digest. For information about MD5, go to <a href="http://www.faqs.org/rfcs/rfc1321.html">http://www.faqs.org/rfcs/rfc1321.html</a>.</p>
 */
@property (nonatomic, strong) NSString *MD5OfMessageAttributes;

/**
 * <p>An MD5 digest of the non-URL-encoded message body string. This can be used to verify that Amazon SQS received the message correctly. Amazon SQS first URL decodes the message before creating the MD5 digest. For information about MD5, go to <a href="http://www.faqs.org/rfcs/rfc1321.html">http://www.faqs.org/rfcs/rfc1321.html</a>.</p>
 */
@property (nonatomic, strong) NSString *MD5OfMessageBody;

/**
 * <p> An element containing the message ID of the message sent to the queue. For more information, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/ImportantIdentifiers.html">Queue and Message Identifiers</a> in the <i>Amazon SQS Developer Guide</i>. </p>
 */
@property (nonatomic, strong) NSString *messageId;

@end

@interface AWSSQSSetQueueAttributesRequest : AWSRequest


/**
 * <p>A map of attributes to set.</p><p>The following lists the names, descriptions, and values of the special request parameters the <code>SetQueueAttributes</code> action uses:</p><p><ul><li><code>DelaySeconds</code> - The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes). The default for this attribute is 0 (zero).</li><li><code>MaximumMessageSize</code> - The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB). The default for this attribute is 262144 (256 KiB).</li><li><code>MessageRetentionPeriod</code> - The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days). The default for this attribute is 345600 (4 days).</li><li><code>Policy</code> - The queue's policy. A valid form-url-encoded policy. For more information about policy structure, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/BasicStructure.html">Basic Policy Structure</a> in the <i>Amazon SQS Developer Guide</i>. For more information about form-url-encoding, see <a href="http://www.w3.org/MarkUp/html-spec/html-spec_8.html#SEC8.2.1">http://www.w3.org/MarkUp/html-spec/html-spec_8.html#SEC8.2.1</a>.</li><li><code>ReceiveMessageWaitTimeSeconds</code> - The time for which a ReceiveMessage call will wait for a message to arrive. An integer from 0 to 20 (seconds). The default for this attribute is 0. </li><li><code>VisibilityTimeout</code> - The visibility timeout for the queue. An integer from 0 to 43200 (12 hours). The default for this attribute is 30. For more information about visibility timeout, see Visibility Timeout in the <i>Amazon SQS Developer Guide</i>.</li><li><code>RedrivePolicy</code> - The parameters for dead letter queue functionality of the source queue. For more information about RedrivePolicy and dead letter queues, see Using Amazon SQS Dead Letter Queues in the <i>Amazon SQS Developer Guide</i>.</li></ul></p>
 */
@property (nonatomic, strong) NSDictionary *attributes;

/**
 * <p>The URL of the Amazon SQS queue to take action on.</p>
 */
@property (nonatomic, strong) NSString *queueUrl;

@end
