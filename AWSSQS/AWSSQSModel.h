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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSSQSErrorDomain;

typedef NS_ENUM(NSInteger, AWSSQSErrorType) {
    AWSSQSErrorUnknown,
    AWSSQSErrorBatchEntryIdsNotDistinct,
    AWSSQSErrorBatchRequestTooLong,
    AWSSQSErrorEmptyBatchRequest,
    AWSSQSErrorInvalidAttributeName,
    AWSSQSErrorInvalidBatchEntryId,
    AWSSQSErrorInvalidIdFormat,
    AWSSQSErrorInvalidMessageContents,
    AWSSQSErrorMessageNotInflight,
    AWSSQSErrorOverLimit,
    AWSSQSErrorPurgeQueueInProgress,
    AWSSQSErrorQueueDeletedRecently,
    AWSSQSErrorQueueDoesNotExist,
    AWSSQSErrorQueueNameExists,
    AWSSQSErrorReceiptHandleIsInvalid,
    AWSSQSErrorTooManyEntriesInBatchRequest,
    AWSSQSErrorUnsupportedOperation,
};

typedef NS_ENUM(NSInteger, AWSSQSMessageSystemAttributeName) {
    AWSSQSMessageSystemAttributeNameUnknown,
    AWSSQSMessageSystemAttributeNameSenderId,
    AWSSQSMessageSystemAttributeNameSentTimestamp,
    AWSSQSMessageSystemAttributeNameApproximateReceiveCount,
    AWSSQSMessageSystemAttributeNameApproximateFirstReceiveTimestamp,
    AWSSQSMessageSystemAttributeNameSequenceNumber,
    AWSSQSMessageSystemAttributeNameMessageDeduplicationId,
    AWSSQSMessageSystemAttributeNameMessageGroupId,
};

typedef NS_ENUM(NSInteger, AWSSQSQueueAttributeName) {
    AWSSQSQueueAttributeNameUnknown,
    AWSSQSQueueAttributeNameAll,
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
    AWSSQSQueueAttributeNameFifoQueue,
    AWSSQSQueueAttributeNameContentBasedDeduplication,
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
@class AWSSQSPurgeQueueRequest;
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

/**
 <p/>
 Required parameters: [QueueUrl, Label, AWSAccountIds, Actions]
 */
@interface AWSSQSAddPermissionRequest : AWSRequest


/**
 <p>The AWS account number of the <a href="http://docs.aws.amazon.com/general/latest/gr/glos-chap.html#P">principal</a> who will be given permission. The principal must have an AWS account, but does not need to be signed up for Amazon SQS. For information about locating the AWS account identification, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/AWSCredentials.html">Your AWS Identifiers</a> in the <i>Amazon SQS Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable AWSAccountIds;

/**
 <p>The action the client wants to allow for the specified principal. The following are valid values: <code>* | SendMessage | ReceiveMessage | DeleteMessage | ChangeMessageVisibility | GetQueueAttributes | GetQueueUrl</code>. For more information about these actions, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/acp-overview.html#PermissionTypes">Understanding Permissions</a> in the <i>Amazon SQS Developer Guide</i>.</p><p>Specifying <code>SendMessage</code>, <code>DeleteMessage</code>, or <code>ChangeMessageVisibility</code> for the <code>ActionName.n</code> also grants permissions for the corresponding batch versions of those actions: <code>SendMessageBatch</code>, <code>DeleteMessageBatch</code>, and <code>ChangeMessageVisibilityBatch</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable actions;

/**
 <p>The unique identification of the permission you're setting (e.g., <code>AliceSendMessage</code>). Constraints: Maximum 80 characters; alphanumeric characters, hyphens (-), and underscores (_) are allowed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable label;

/**
 <p>The URL of the Amazon SQS queue to take action on.</p><p>Queue URLs are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueUrl;

@end

/**
 <p>This is used in the responses of batch API to give a detailed description of the result of an action on each entry in the request.</p>
 Required parameters: [Id, SenderFault, Code]
 */
@interface AWSSQSBatchResultErrorEntry : AWSModel


/**
 <p>An error code representing why the action failed on this entry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>The id of an entry in a batch request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>A message explaining why the action failed on this entry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>Whether the error happened due to the sender's fault.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable senderFault;

@end

/**
 <p/>
 Required parameters: [QueueUrl, Entries]
 */
@interface AWSSQSChangeMessageVisibilityBatchRequest : AWSRequest


/**
 <p>A list of receipt handles of the messages for which the visibility timeout must be changed.</p>
 */
@property (nonatomic, strong) NSArray<AWSSQSChangeMessageVisibilityBatchRequestEntry *> * _Nullable entries;

/**
 <p>The URL of the Amazon SQS queue to take action on.</p><p>Queue URLs are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueUrl;

@end

/**
 <p>Encloses a receipt handle and an entry id for each message in <a>ChangeMessageVisibilityBatch</a>. </p><important><p>All of the following parameters are list parameters that must be prefixed with <code>ChangeMessageVisibilityBatchRequestEntry.n</code>, where <code>n</code> is an integer value starting with 1. For example, a parameter list for this action might look like this:</p></important><p><code>&amp;amp;ChangeMessageVisibilityBatchRequestEntry.1.Id=change_visibility_msg_2</code></p><p><code>&amp;amp;ChangeMessageVisibilityBatchRequestEntry.1.ReceiptHandle=&lt;replaceable&gt;Your_Receipt_Handle&lt;/replaceable&gt;</code></p><p><code>&amp;amp;ChangeMessageVisibilityBatchRequestEntry.1.VisibilityTimeout=45</code></p>
 Required parameters: [Id, ReceiptHandle]
 */
@interface AWSSQSChangeMessageVisibilityBatchRequestEntry : AWSModel


/**
 <p>An identifier for this particular receipt handle. This is used to communicate the result. Note that the <code>Id</code>s of a batch request need to be unique within the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>A receipt handle.</p>
 */
@property (nonatomic, strong) NSString * _Nullable receiptHandle;

/**
 <p>The new value (in seconds) for the message's visibility timeout.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable visibilityTimeout;

@end

/**
 <p> For each message in the batch, the response contains a <a>ChangeMessageVisibilityBatchResultEntry</a> tag if the message succeeds or a <a>BatchResultErrorEntry</a> tag if the message fails. </p>
 Required parameters: [Successful, Failed]
 */
@interface AWSSQSChangeMessageVisibilityBatchResult : AWSModel


/**
 <p>A list of <a>BatchResultErrorEntry</a> items.</p>
 */
@property (nonatomic, strong) NSArray<AWSSQSBatchResultErrorEntry *> * _Nullable failed;

/**
 <p>A list of <a>ChangeMessageVisibilityBatchResultEntry</a> items.</p>
 */
@property (nonatomic, strong) NSArray<AWSSQSChangeMessageVisibilityBatchResultEntry *> * _Nullable successful;

@end

/**
 <p>Encloses the id of an entry in <a>ChangeMessageVisibilityBatch</a>.</p>
 Required parameters: [Id]
 */
@interface AWSSQSChangeMessageVisibilityBatchResultEntry : AWSModel


/**
 <p>Represents a message whose visibility timeout has been changed successfully.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSSQSChangeMessageVisibilityRequest : AWSRequest


/**
 <p>The URL of the Amazon SQS queue to take action on.</p><p>Queue URLs are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueUrl;

/**
 <p>The receipt handle associated with the message whose visibility timeout should be changed. This parameter is returned by the <a>ReceiveMessage</a> action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable receiptHandle;

/**
 <p>The new value (in seconds - from 0 to 43200 - maximum 12 hours) for the message's visibility timeout.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable visibilityTimeout;

@end

/**
 <p/>
 Required parameters: [QueueName]
 */
@interface AWSSQSCreateQueueRequest : AWSRequest


/**
 <p>A map of attributes with their corresponding values.</p><p>The following lists the names, descriptions, and values of the special request parameters that the <code>CreateQueue</code> action uses:</p><ul><li><p><code>DelaySeconds</code> - The number of seconds for which the delivery of all messages in the queue is delayed. An integer from 0 to 900 (15 minutes). The default is 0 (zero). </p></li><li><p><code>MaximumMessageSize</code> - The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1,024 bytes (1 KiB) up to 262,144 bytes (256 KiB). The default is 262,144 (256 KiB). </p></li><li><p><code>MessageRetentionPeriod</code> - The number of seconds for which Amazon SQS retains a message. An integer representing seconds, from 60 (1 minute) to 120,9600 (14 days). The default is 345,600 (4 days). </p></li><li><p><code>Policy</code> - The queue's policy. A valid AWS policy. For more information about policy structure, see <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/PoliciesOverview.html">Overview of AWS IAM Policies</a> in the <i>Amazon IAM User Guide</i>. </p></li><li><p><code>ReceiveMessageWaitTimeSeconds</code> - The number of seconds for which a <a>ReceiveMessage</a> action will wait for a message to arrive. An integer from 0 to 20 (seconds). The default is 0. </p></li><li><p><code>RedrivePolicy</code> - The parameters for the dead letter queue functionality of the source queue. For more information about the redrive policy and dead letter queues, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/SQSDeadLetterQueue.html">Using Amazon SQS Dead Letter Queues</a> in the <i>Amazon SQS Developer Guide</i>. </p><note><p>The dead letter queue of a FIFO queue must also be a FIFO queue. Similarly, the dead letter queue of a standard queue must also be a standard queue.</p></note></li><li><p><code>VisibilityTimeout</code> - The visibility timeout for the queue. An integer from 0 to 43200 (12 hours). The default is 30. For more information about the visibility timeout, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/AboutVT.html">Visibility Timeout</a> in the <i>Amazon SQS Developer Guide</i>.</p></li></ul><p>The following attributes apply only to <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html">FIFO (first-in-first-out) queues</a>:</p><ul><li><p><code>FifoQueue</code> - Designates a queue as FIFO. You can provide this attribute only during queue creation; you can't change it for an existing queue. When you set this attribute, you must provide a <code>MessageGroupId</code> explicitly.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html#FIFO-queues-understanding-logic">FIFO Queue Logic</a> in the <i>Amazon SQS Developer Guide</i>.</p></li><li><p><code>ContentBasedDeduplication</code> - Enables content-based deduplication. For more information, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html#FIFO-queues-exactly-once-processing">Exactly-Once Processing</a> in the <i>Amazon SQS Developer Guide</i>. </p><ul><li><p>Every message must have a unique <code>MessageDeduplicationId</code>,</p><ul><li><p>You may provide a <code>MessageDeduplicationId</code> explicitly.</p></li><li><p>If you aren't able to provide a <code>MessageDeduplicationId</code> and you enable <code>ContentBasedDeduplication</code> for your queue, Amazon SQS uses a SHA-256 hash to generate the <code>MessageDeduplicationId</code> using the body of the message (but not the attributes of the message). </p></li><li><p>If you don't provide a <code>MessageDeduplicationId</code> and the queue doesn't have <code>ContentBasedDeduplication</code> set, the action fails with an error.</p></li><li><p>If the queue has <code>ContentBasedDeduplication</code> set, your <code>MessageDeduplicationId</code> overrides the generated one.</p></li></ul></li><li><p>When <code>ContentBasedDeduplication</code> is in effect, messages with identical content sent within the deduplication interval are treated as duplicates and only one copy of the message is delivered.</p></li><li><p>You can also use <code>ContentBasedDeduplication</code> for messages with identical content to be treated as duplicates.</p></li><li><p>If you send one message with <code>ContentBasedDeduplication</code> enabled and then another message with a <code>MessageDeduplicationId</code> that is the same as the one generated for the first <code>MessageDeduplicationId</code>, the two messages are treated as duplicates and only one copy of the message is delivered. </p></li></ul></li></ul><p>Any other valid special request parameters that are specified (such as <code>ApproximateNumberOfMessages</code>, <code>ApproximateNumberOfMessagesDelayed</code>, <code>ApproximateNumberOfMessagesNotVisible</code>, <code>CreatedTimestamp</code>, <code>LastModifiedTimestamp</code>, and <code>QueueArn</code>) will be ignored.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The name of the new queue. The following limits apply to this name:</p><ul><li><p>A queue name can have up to 80 characters.</p></li><li><p>The following are accepted: alphanumeric chatacters, hyphens (<code>-</code>), and underscores (<code>_</code>).</p></li><li><p>A FIFO queue name must end with the <code>.fifo</code> suffix.</p></li></ul><p>Queue names are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueName;

@end

/**
 <p>Returns the QueueUrl element of the created queue.</p>
 */
@interface AWSSQSCreateQueueResult : AWSModel


/**
 <p>The URL for the created Amazon SQS queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueUrl;

@end

/**
 <p/>
 Required parameters: [QueueUrl, Entries]
 */
@interface AWSSQSDeleteMessageBatchRequest : AWSRequest


/**
 <p>A list of receipt handles for the messages to be deleted.</p>
 */
@property (nonatomic, strong) NSArray<AWSSQSDeleteMessageBatchRequestEntry *> * _Nullable entries;

/**
 <p>The URL of the Amazon SQS queue to take action on.</p><p>Queue URLs are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueUrl;

@end

/**
 <p>Encloses a receipt handle and an identifier for it.</p>
 Required parameters: [Id, ReceiptHandle]
 */
@interface AWSSQSDeleteMessageBatchRequestEntry : AWSModel


/**
 <p>An identifier for this particular receipt handle. This is used to communicate the result. Note that the <code>Id</code>s of a batch request need to be unique within the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>A receipt handle.</p>
 */
@property (nonatomic, strong) NSString * _Nullable receiptHandle;

@end

/**
 <p> For each message in the batch, the response contains a <a>DeleteMessageBatchResultEntry</a> tag if the message is deleted or a <a>BatchResultErrorEntry</a> tag if the message can't be deleted. </p>
 Required parameters: [Successful, Failed]
 */
@interface AWSSQSDeleteMessageBatchResult : AWSModel


/**
 <p>A list of <a>BatchResultErrorEntry</a> items.</p>
 */
@property (nonatomic, strong) NSArray<AWSSQSBatchResultErrorEntry *> * _Nullable failed;

/**
 <p>A list of <a>DeleteMessageBatchResultEntry</a> items.</p>
 */
@property (nonatomic, strong) NSArray<AWSSQSDeleteMessageBatchResultEntry *> * _Nullable successful;

@end

/**
 <p>Encloses the id an entry in <a>DeleteMessageBatch</a>.</p>
 Required parameters: [Id]
 */
@interface AWSSQSDeleteMessageBatchResultEntry : AWSModel


/**
 <p>Represents a successfully deleted message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p/>
 Required parameters: [QueueUrl, ReceiptHandle]
 */
@interface AWSSQSDeleteMessageRequest : AWSRequest


/**
 <p>The URL of the Amazon SQS queue to take action on.</p><p>Queue URLs are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueUrl;

/**
 <p>The receipt handle associated with the message to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable receiptHandle;

@end

/**
 <p/>
 Required parameters: [QueueUrl]
 */
@interface AWSSQSDeleteQueueRequest : AWSRequest


/**
 <p>The URL of the Amazon SQS queue to take action on.</p><p>Queue URLs are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueUrl;

@end

/**
 <p/>
 Required parameters: [QueueUrl]
 */
@interface AWSSQSGetQueueAttributesRequest : AWSRequest


/**
 <p>A list of attributes for which to retrieve information.</p><note><p>Going forward, new attributes might be added. If you are writing code that calls this action, we recommend that you structure your code so that it can handle new attributes gracefully.</p></note><p>The following attributes are supported:</p><ul><li><p><code>All</code> - Returns all values. </p></li><li><p><code>ApproximateNumberOfMessages</code> - Returns the approximate number of visible messages in a queue. For more information, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/ApproximateNumber.html">Resources Required to Process Messages</a> in the <i>Amazon SQS Developer Guide</i>. </p></li><li><p><code>ApproximateNumberOfMessagesDelayed</code> - Returns the approximate number of messages that are waiting to be added to the queue. </p></li><li><p><code>ApproximateNumberOfMessagesNotVisible</code> - Returns the approximate number of messages that have not timed-out and are not deleted. For more information, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/ApproximateNumber.html">Resources Required to Process Messages</a> in the <i>Amazon SQS Developer Guide</i>. </p></li><li><p><code>CreatedTimestamp</code> - Returns the time when the queue was created in seconds (epoch time).</p></li><li><p><code>DelaySeconds</code> - Returns the default delay on the queue in seconds.</p></li><li><p><code>LastModifiedTimestamp</code> - Returns the time when the queue was last changed in seconds (epoch time).</p></li><li><p><code>MaximumMessageSize</code> - Returns the limit of how many bytes a message can contain before Amazon SQS rejects it.</p></li><li><p><code>MessageRetentionPeriod</code> - Returns the number of seconds for which Amazon SQS retains a message.</p></li><li><p><code>Policy</code> - Returns the policy of the queue.</p></li><li><p><code>QueueArn</code> - Returns the Amazon resource name (ARN) of the queue.</p></li><li><p><code>ReceiveMessageWaitTimeSeconds</code> - Returns the number of seconds for which ReceiveMessage call will wait for a message to arrive. </p></li><li><p><code>RedrivePolicy</code> - Returns the parameters for dead letter queue functionality of the source queue. For more information about the redrive policy and dead letter queues, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/SQSDeadLetterQueue.html">Using Amazon SQS Dead Letter Queues</a> in the <i>Amazon SQS Developer Guide</i>. </p></li><li><p><code>VisibilityTimeout</code> - Returns the visibility timeout for the queue. For more information about the visibility timeout, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/AboutVT.html">Visibility Timeout</a> in the <i>Amazon SQS Developer Guide</i>. </p></li></ul><p>The following attributes apply only to <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html">FIFO (first-in-first-out) queues</a>:</p><ul><li><p><code>FifoQueue</code> - Returns whether the queue is FIFO. For more information, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html#FIFO-queues-understanding-logic">FIFO Queue Logic</a> in the <i>Amazon SQS Developer Guide</i>.</p></li><li><p><code>ContentBasedDeduplication</code> - Returns whether content-based deduplication is enabled for the queue. For more information, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html#FIFO-queues-exactly-once-processing">Exactly-Once Processing</a> in the <i>Amazon SQS Developer Guide</i>. </p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributeNames;

/**
 <p>The URL of the Amazon SQS queue to take action on.</p><p>Queue URLs are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueUrl;

@end

/**
 <p>A list of returned queue attributes.</p>
 */
@interface AWSSQSGetQueueAttributesResult : AWSModel


/**
 <p>A map of attributes to the respective values.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

@end

/**
 <p/>
 Required parameters: [QueueName]
 */
@interface AWSSQSGetQueueUrlRequest : AWSRequest


/**
 <p>The name of the queue whose URL must be fetched. Maximum 80 characters; alphanumeric characters, hyphens (-), and underscores (_) are allowed.</p><p>Queue names are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueName;

/**
 <p>The AWS account ID of the account that created the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueOwnerAWSAccountId;

@end

/**
 <p>For more information, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/UnderstandingResponses.html">Responses</a> in the <i>Amazon SQS Developer Guide</i>.</p>
 */
@interface AWSSQSGetQueueUrlResult : AWSModel


/**
 <p>The URL for the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueUrl;

@end

/**
 <p/>
 Required parameters: [QueueUrl]
 */
@interface AWSSQSListDeadLetterSourceQueuesRequest : AWSRequest


/**
 <p>The queue URL of a dead letter queue.</p><p>Queue URLs are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueUrl;

@end

/**
 <p>A list of your dead letter source queues.</p>
 Required parameters: [queueUrls]
 */
@interface AWSSQSListDeadLetterSourceQueuesResult : AWSModel


/**
 <p>A list of source queue URLs that have the RedrivePolicy queue attribute configured with a dead letter queue.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable queueUrls;

@end

/**
 <p/>
 */
@interface AWSSQSListQueuesRequest : AWSRequest


/**
 <p>A string to use for filtering the list results. Only those queues whose name begins with the specified string are returned.</p><p>Queue names are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueNamePrefix;

@end

/**
 <p>A list of your queues.</p>
 */
@interface AWSSQSListQueuesResult : AWSModel


/**
 <p>A list of queue URLs, up to 1000 entries.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable queueUrls;

@end

/**
 <p>An Amazon SQS message.</p>
 */
@interface AWSSQSMessage : AWSModel


/**
 <p><code>SenderId</code>, <code>SentTimestamp</code>, <code>ApproximateReceiveCount</code>, and/or <code>ApproximateFirstReceiveTimestamp</code>. <code>SentTimestamp</code> and <code>ApproximateFirstReceiveTimestamp</code> are each returned as an integer representing the <a href="http://en.wikipedia.org/wiki/Unix_time">epoch time</a> in milliseconds.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The message's contents (not URL-encoded).</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 <p>An MD5 digest of the non-URL-encoded message body string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MD5OfBody;

/**
 <p>An MD5 digest of the non-URL-encoded message attribute string. This can be used to verify that Amazon SQS received the message correctly. Amazon SQS first URL decodes the message before creating the MD5 digest. For information about MD5, see <a href="https://www.ietf.org/rfc/rfc1321.txt">RFC1321</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MD5OfMessageAttributes;

/**
 <p>Each message attribute consists of a Name, Type, and Value. For more information, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/SQSMessageAttributes.html#SQSMessageAttributesNTV">Message Attribute Items</a> in the <i>Amazon SQS Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSQSMessageAttributeValue *> * _Nullable messageAttributes;

/**
 <p>A unique identifier for the message. Message IDs are considered unique across all AWS accounts for an extended period of time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

/**
 <p>An identifier associated with the act of receiving the message. A new receipt handle is returned every time you receive a message. When deleting a message, you provide the last received receipt handle to delete the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable receiptHandle;

@end

/**
 <p>The user-specified message attribute value. For string data types, the value attribute has the same restrictions on the content as the message body. For more information, see <a>SendMessage</a>.</p><p>Name, type, and value must not be empty or null. In addition, the message body should not be empty or null. All parts of the message attribute, including name, type, and value, are included in the message size restriction, which is currently 256 KB (262,144 bytes).</p>
 Required parameters: [DataType]
 */
@interface AWSSQSMessageAttributeValue : AWSModel


/**
 <p>Not implemented. Reserved for future use.</p>
 */
@property (nonatomic, strong) NSArray<NSData *> * _Nullable binaryListValues;

/**
 <p>Binary type attributes can store any binary data, for example, compressed data, encrypted data, or images.</p>
 */
@property (nonatomic, strong) NSData * _Nullable binaryValue;

/**
 <p>Amazon SQS supports the following logical data types: String, Number, and Binary. For the Number data type, you must use StringValue.</p><p>You can also append custom labels. For more information, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/SQSMessageAttributes.html#SQSMessageAttributes.DataTypes">Message Attribute Data Types</a> in the <i>Amazon SQS Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataType;

/**
 <p>Not implemented. Reserved for future use.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable stringListValues;

/**
 <p>Strings are Unicode with UTF8 binary encoding. For a list of code values, see <a href="http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters">ASCII Printable Characters</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stringValue;

@end

/**
 <p/>
 Required parameters: [QueueUrl]
 */
@interface AWSSQSPurgeQueueRequest : AWSRequest


/**
 <p>The queue URL of the queue to delete the messages from when using the <code>PurgeQueue</code> API.</p><p>Queue URLs are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueUrl;

@end

/**
 <p/>
 Required parameters: [QueueUrl]
 */
@interface AWSSQSReceiveMessageRequest : AWSRequest


/**
 <p>A list of attributes that need to be returned along with each message. These attributes include:</p><ul><li><p><code>All</code> - Returns all values.</p></li><li><p><code>ApproximateFirstReceiveTimestamp</code> - Returns the time the message was first received from the queue (epoch time in milliseconds).</p></li><li><p><code>ApproximateReceiveCount</code> - Returns the number of times a message has been received from the queue but not deleted.</p></li><li><p><code>SenderId</code></p><ul><li><p>For an IAM user, returns the IAM user ID, for example <code>ABCDEFGHI1JKLMNOPQ23R</code>.</p></li><li><p>For an IAM role, returns the IAM role ID, for example <code>ABCDE1F2GH3I4JK5LMNOP:i-a123b456</code>.</p></li></ul></li><li><p><code>SentTimestamp</code> - Returns the time the message was sent to the queue (epoch time in milliseconds).</p></li><li><p><code>MessageDeduplicationId</code> - Returns the value provided by the sender that calls the <code><a>SendMessage</a></code> action.</p></li><li><p><code>MessageGroupId</code> - Returns the value provided by the sender that calls the <code><a>SendMessage</a></code> action. Messages with the same <code>MessageGroupId</code> are returned in sequence.</p></li><li><p><code>SequenceNumber</code> - Returns the value provided by Amazon SQS.</p></li></ul><p>Any other valid special request parameters (such as the following) that are specified are ignored:</p><ul><li><p><code>ApproximateNumberOfMessages</code></p></li><li><p><code>ApproximateNumberOfMessagesDelayed</code></p></li><li><p><code>ApproximateNumberOfMessagesNotVisible</code></p></li><li><p><code>CreatedTimestamp</code></p></li><li><p><code>ContentBasedDeduplication</code></p></li><li><p><code>DelaySeconds</code></p></li><li><p><code>LastModifiedTimestamp</code></p></li><li><p><code>MaximumMessageSize</code></p></li><li><p><code>MessageRetentionPeriod</code></p></li><li><p><code>Policy</code></p></li><li><p><code>QueueArn</code>, </p></li><li><p><code>ReceiveMessageWaitTimeSeconds</code></p></li><li><p><code>RedrivePolicy</code></p></li><li><p><code>FifoQueue</code></p></li><li><p><code>VisibilityTimeout</code></p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributeNames;

/**
 <p>The maximum number of messages to return. Amazon SQS never returns more messages than this value but might return fewer. Values can be from 1 to 10. Default is 1.</p><p>All of the messages are not necessarily returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxNumberOfMessages;

/**
 <p>The name of the message attribute, where <i>N</i> is the index. The message attribute name can contain the following characters: A-Z, a-z, 0-9, underscore (_), hyphen (-), and period (.). The name must not start or end with a period, and it should not have successive periods. The name is case sensitive and must be unique among all attribute names for the message. The name can be up to 256 characters long. The name can't start with "AWS." or "Amazon." (or any variations in casing), because these prefixes are reserved for use by Amazon Web Services.</p><p>When using <code>ReceiveMessage</code>, you can send a list of attribute names to receive, or you can return all of the attributes by specifying "All" or ".*" in your request. You can also use "bar.*" to return all message attributes starting with the "bar" prefix.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable messageAttributeNames;

/**
 <p>The URL of the Amazon SQS queue to take action on.</p><p>Queue URLs are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueUrl;

/**
 <p>This parameter applies only to FIFO (first-in-first-out) queues.</p><p>The token used for deduplication of <code>ReceiveMessage</code> calls. If a networking issue occurs after a <code>ReceiveMessage</code> action, and instead of a response you receive a generic error, you can retry the same action with an identical <code>ReceiveRequestAttemptId</code> to retrieve the same set of messages, even if their visibility timeout has not yet expired.</p><ul><li><p>You can use <code>ReceiveRequestAttemptId</code> only for 5 minutes after a <code>ReceiveMessage</code> action.</p></li><li><p>When you set <code>FifoQueue</code>, a caller of the <code>ReceiveMessage</code> action can provide a <code>ReceiveRequestAttemptId</code> explicitly.</p></li><li><p>If a caller of the <code>ReceiveMessage</code> action doesn't provide a <code>ReceiveRequestAttemptId</code>, Amazon SQS generates a <code>ReceiveRequestAttemptId</code>.</p></li><li><p>You can retry the <code>ReceiveMessage</code> action with the same <code>ReceiveRequestAttemptId</code> if none of the messages have been modified (deleted or had their visibility changes).</p></li><li><p>During a visibility timeout, subsequent calls with the same <code>ReceiveRequestAttemptId</code> return the same messages and receipt handles. If a retry occurs within the deduplication interval, it resets the visibility timeout. For more information, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/AboutVT.html">Visibility Timeout</a> in the <i>Amazon Simple Queue Service Developer Guide</i>.</p><important><p>If a caller of the <code>ReceiveMessage</code> action is still processing messages when the visibility timeout expires and messages become visible, another worker reading from the same queue can receive the same messages and therefore process duplicates. Also, if a reader whose message processing time is longer than the visibility timeout tries to delete the processed messages, the action fails with an error.</p><p>To mitigate this effect, ensure that your application observes a safe threshold before the visibility timeout expires and extend the visibility timeout as necessary.</p></important></li><li><p>While messages with a particular <code>MessageGroupId</code> are invisible, no more messages belonging to the same <code>MessageGroupId</code> are returned until the visibility timeout expires. You can still receive messages with another <code>MessageGroupId</code> as long as it is also visible.</p></li><li><p>If a caller of <code>ReceiveMessage</code> can't track the <code>ReceiveRequestAttemptId</code>, no retries will work until the original visibility timeout expires. As a result, delays might occur but the messages in the queue will remain in a strict order.</p></li></ul><p>The length of <code>ReceiveRequestAttemptId</code> is 128 characters. <code>ReceiveRequestAttemptId</code> can contain alphanumeric characters (<code>a-z</code>, <code>A-Z</code>, <code>0-9</code>) and punctuation (<code>!"#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~</code>).</p><p>For best practices of using <code>ReceiveRequestAttemptId</code>, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queue-recommendations.html#using-receiverequestattemptid-request-parameter">Using the ReceiveRequestAttemptId Request Parameter</a> in the <i>Amazon Simple Queue Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable receiveRequestAttemptId;

/**
 <p>The duration (in seconds) that the received messages are hidden from subsequent retrieve requests after being retrieved by a <code>ReceiveMessage</code> request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable visibilityTimeout;

/**
 <p>The duration (in seconds) for which the call will wait for a message to arrive in the queue before returning. If a message is available, the call will return sooner than WaitTimeSeconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable waitTimeSeconds;

@end

/**
 <p>A list of received messages.</p>
 */
@interface AWSSQSReceiveMessageResult : AWSModel


/**
 <p>A list of messages.</p>
 */
@property (nonatomic, strong) NSArray<AWSSQSMessage *> * _Nullable messages;

@end

/**
 <p/>
 Required parameters: [QueueUrl, Label]
 */
@interface AWSSQSRemovePermissionRequest : AWSRequest


/**
 <p>The identification of the permission to remove. This is the label added with the <a>AddPermission</a> action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable label;

/**
 <p>The URL of the Amazon SQS queue to take action on.</p><p>Queue URLs are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueUrl;

@end

/**
 <p/>
 Required parameters: [QueueUrl, Entries]
 */
@interface AWSSQSSendMessageBatchRequest : AWSRequest


/**
 <p>A list of <a>SendMessageBatchRequestEntry</a> items.</p>
 */
@property (nonatomic, strong) NSArray<AWSSQSSendMessageBatchRequestEntry *> * _Nullable entries;

/**
 <p>The URL of the Amazon SQS queue to take action on.</p><p>Queue URLs are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueUrl;

@end

/**
 <p>Contains the details of a single Amazon SQS message along with a <code>Id</code>. </p>
 Required parameters: [Id, MessageBody]
 */
@interface AWSSQSSendMessageBatchRequestEntry : AWSModel


/**
 <p>The number of seconds (0 to 900 - 15 minutes) to delay a specific message. Messages with a positive <code>DelaySeconds</code> value become available for processing after the delay time is finished. If you don't specify a value, the default value for the queue applies. </p><note><p>When you set <code>FifoQueue</code>, you can't set <code>DelaySeconds</code> per message. You can set this parameter only on a queue level.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable delaySeconds;

/**
 <p>An identifier for the message in this batch. This is used to communicate the result. Note that the <code>Id</code>s of a batch request need to be unique within the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Each message attribute consists of a Name, Type, and Value. For more information, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/SQSMessageAttributes.html#SQSMessageAttributesNTV">Message Attribute Items</a> in the <i>Amazon SQS Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSQSMessageAttributeValue *> * _Nullable messageAttributes;

/**
 <p>Body of the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageBody;

/**
 <p>This parameter applies only to FIFO (first-in-first-out) queues.</p><p>The token used for deduplication of messages within a 5-minute minimum deduplication interval. If a message with a particular <code>MessageDeduplicationId</code> is sent successfully, subsequent messages with the same <code>MessageDeduplicationId</code> are accepted successfully but aren't delivered. For more information, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html#FIFO-queues-exactly-once-processing"> Exactly-Once Processing</a> in the <i>Amazon SQS Developer Guide</i>.</p><ul><li><p>Every message must have a unique <code>MessageDeduplicationId</code>,</p><ul><li><p>You may provide a <code>MessageDeduplicationId</code> explicitly.</p></li><li><p>If you aren't able to provide a <code>MessageDeduplicationId</code> and you enable <code>ContentBasedDeduplication</code> for your queue, Amazon SQS uses a SHA-256 hash to generate the <code>MessageDeduplicationId</code> using the body of the message (but not the attributes of the message). </p></li><li><p>If you don't provide a <code>MessageDeduplicationId</code> and the queue doesn't have <code>ContentBasedDeduplication</code> set, the action fails with an error.</p></li><li><p>If the queue has <code>ContentBasedDeduplication</code> set, your <code>MessageDeduplicationId</code> overrides the generated one.</p></li></ul></li><li><p>When <code>ContentBasedDeduplication</code> is in effect, messages with identical content sent within the deduplication interval are treated as duplicates and only one copy of the message is delivered.</p></li><li><p>You can also use <code>ContentBasedDeduplication</code> for messages with identical content to be treated as duplicates.</p></li><li><p>If you send one message with <code>ContentBasedDeduplication</code> enabled and then another message with a <code>MessageDeduplicationId</code> that is the same as the one generated for the first <code>MessageDeduplicationId</code>, the two messages are treated as duplicates and only one copy of the message is delivered. </p></li></ul><note><p>The <code>MessageDeduplicationId</code> is available to the recipient of the message (this can be useful for troubleshooting delivery issues).</p><p>If a message is sent successfully but the acknowledgement is lost and the message is resent with the same <code>MessageDeduplicationId</code> after the deduplication interval, Amazon SQS can't detect duplicate messages.</p></note><p>The length of <code>MessageDeduplicationId</code> is 128 characters. <code>MessageDeduplicationId</code> can contain alphanumeric characters (<code>a-z</code>, <code>A-Z</code>, <code>0-9</code>) and punctuation (<code>!"#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~</code>).</p><p>For best practices of using <code>MessageDeduplicationId</code>, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queue-recommendations.html#using-messagededuplicationid-property">Using the MessageDeduplicationId Property</a> in the <i>Amazon Simple Queue Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageDeduplicationId;

/**
 <p>This parameter applies only to FIFO (first-in-first-out) queues.</p><p>The tag that specifies that a message belongs to a specific message group. Messages that belong to the same message group are processed in a FIFO manner (however, messages in different message groups might be processed out of order). To interleave multiple ordered streams within a single queue, use <code>MessageGroupId</code> values (for example, session data for multiple users). In this scenario, multiple readers can process the queue, but the session data of each user is processed in a FIFO fashion.</p><ul><li><p>You must associate a non-empty <code>MessageGroupId</code> with a message. If you don't provide a <code>MessageGroupId</code>, the action fails.</p></li><li><p><code>ReceiveMessage</code> might return messages with multiple <code>MessageGroupId</code> values. For each <code>MessageGroupId</code>, the messages are sorted by time sent. The caller can't specify a <code>MessageGroupId</code>.</p></li></ul><p>The length of <code>MessageGroupId</code> is 128 characters. Valid values are alphanumeric characters and punctuation <code>(!"#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~)</code>.</p><p>For best practices of using <code>MessageGroupId</code>, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queue-recommendations.html#using-messagegroupid-property">Using the MessageGroupId Property</a> in the <i>Amazon Simple Queue Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageGroupId;

@end

/**
 <p>For each message in the batch, the response contains a <a>SendMessageBatchResultEntry</a> tag if the message succeeds or a <a>BatchResultErrorEntry</a> tag if the message fails.</p>
 Required parameters: [Successful, Failed]
 */
@interface AWSSQSSendMessageBatchResult : AWSModel


/**
 <p>A list of <a>BatchResultErrorEntry</a> items with the error detail about each message that could not be enqueued.</p>
 */
@property (nonatomic, strong) NSArray<AWSSQSBatchResultErrorEntry *> * _Nullable failed;

/**
 <p>A list of <a>SendMessageBatchResultEntry</a> items.</p>
 */
@property (nonatomic, strong) NSArray<AWSSQSSendMessageBatchResultEntry *> * _Nullable successful;

@end

/**
 <p>Encloses a message ID for successfully enqueued message of a <a>SendMessageBatch</a>.</p>
 Required parameters: [Id, MessageId, MD5OfMessageBody]
 */
@interface AWSSQSSendMessageBatchResultEntry : AWSModel


/**
 <p>An identifier for the message in this batch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>An MD5 digest of the non-URL-encoded message attribute string. This can be used to verify that Amazon SQS received the message batch correctly. Amazon SQS first URL decodes the message before creating the MD5 digest. For information about MD5, see <a href="https://www.ietf.org/rfc/rfc1321.txt">RFC1321</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MD5OfMessageAttributes;

/**
 <p>An MD5 digest of the non-URL-encoded message body string. This can be used to verify that Amazon SQS received the message correctly. Amazon SQS first URL decodes the message before creating the MD5 digest. For information about MD5, see <a href="https://www.ietf.org/rfc/rfc1321.txt">RFC1321</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MD5OfMessageBody;

/**
 <p>An identifier for the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

/**
 <p><i>This element applies only to FIFO (first-in-first-out) queues.</i></p><p>A large, non-consecutive number that Amazon SQS assigns to each message.</p><p>The length of <code>SequenceNumber</code> is 128 bits. As <code>SequenceNumber</code> continues to increase for a particular <code>MessageGroupId</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sequenceNumber;

@end

/**
 <p/>
 Required parameters: [QueueUrl, MessageBody]
 */
@interface AWSSQSSendMessageRequest : AWSRequest


/**
 <p> The number of seconds (0 to 900 - 15 minutes) to delay a specific message. Messages with a positive <code>DelaySeconds</code> value become available for processing after the delay time is finished. If you don't specify a value, the default value for the queue applies. </p><note><p>When you set <code>FifoQueue</code>, you can't set <code>DelaySeconds</code> per message. You can set this parameter only on a queue level.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable delaySeconds;

/**
 <p>Each message attribute consists of a Name, Type, and Value. For more information, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/SQSMessageAttributes.html#SQSMessageAttributesNTV">Message Attribute Items</a> in the <i>Amazon SQS Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSQSMessageAttributeValue *> * _Nullable messageAttributes;

/**
 <p>The message to send. String maximum 256 KB in size. For a list of allowed characters, see the preceding note.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageBody;

/**
 <p>This parameter applies only to FIFO (first-in-first-out) queues.</p><p>The token used for deduplication of sent messages. If a message with a particular <code>MessageDeduplicationId</code> is sent successfully, any messages sent with the same <code>MessageDeduplicationId</code> are accepted successfully but aren't delivered during the 5-minute deduplication interval. For more information, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html#FIFO-queues-exactly-once-processing"> Exactly-Once Processing</a> in the <i>Amazon SQS Developer Guide</i>.</p><ul><li><p>Every message must have a unique <code>MessageDeduplicationId</code>,</p><ul><li><p>You may provide a <code>MessageDeduplicationId</code> explicitly.</p></li><li><p>If you aren't able to provide a <code>MessageDeduplicationId</code> and you enable <code>ContentBasedDeduplication</code> for your queue, Amazon SQS uses a SHA-256 hash to generate the <code>MessageDeduplicationId</code> using the body of the message (but not the attributes of the message). </p></li><li><p>If you don't provide a <code>MessageDeduplicationId</code> and the queue doesn't have <code>ContentBasedDeduplication</code> set, the action fails with an error.</p></li><li><p>If the queue has <code>ContentBasedDeduplication</code> set, your <code>MessageDeduplicationId</code> overrides the generated one.</p></li></ul></li><li><p>When <code>ContentBasedDeduplication</code> is in effect, messages with identical content sent within the deduplication interval are treated as duplicates and only one copy of the message is delivered.</p></li><li><p>You can also use <code>ContentBasedDeduplication</code> for messages with identical content to be treated as duplicates.</p></li><li><p>If you send one message with <code>ContentBasedDeduplication</code> enabled and then another message with a <code>MessageDeduplicationId</code> that is the same as the one generated for the first <code>MessageDeduplicationId</code>, the two messages are treated as duplicates and only one copy of the message is delivered. </p></li></ul><note><p>The <code>MessageDeduplicationId</code> is available to the recipient of the message (this can be useful for troubleshooting delivery issues).</p><p>If a message is sent successfully but the acknowledgdment is lost and the message is resent with the same <code>MessageDeduplicationId</code> after the deduplication interval, Amazon SQS can't detect duplicate messages.</p></note><p>The length of <code>MessageDeduplicationId</code> is 128 characters. <code>MessageDeduplicationId</code> can contain alphanumeric characters (<code>a-z</code>, <code>A-Z</code>, <code>0-9</code>) and punctuation (<code>!"#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~</code>).</p><p>For best practices of using <code>MessageDeduplicationId</code>, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queue-recommendations.html#using-messagededuplicationid-property">Using the MessageDeduplicationId Property</a> in the <i>Amazon Simple Queue Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageDeduplicationId;

/**
 <p>This parameter applies only to FIFO (first-in-first-out) queues.</p><p>The tag that specifies that a message belongs to a specific message group. Messages that belong to the same message group are processed in a FIFO manner (however, messages in different message groups might be processed out of order). To interleave multiple ordered streams within a single queue, use <code>MessageGroupId</code> values (for example, session data for multiple users). In this scenario, multiple readers can process the queue, but the session data of each user is processed in a FIFO fashion.</p><ul><li><p>You must associate a non-empty <code>MessageGroupId</code> with a message. If you don't provide a <code>MessageGroupId</code>, the action fails.</p></li><li><p><code>ReceiveMessage</code> might return messages with multiple <code>MessageGroupId</code> values. For each <code>MessageGroupId</code>, the messages are sorted by time sent. The caller can't specify a <code>MessageGroupId</code>.</p></li></ul><p>The length of <code>MessageGroupId</code> is 128 characters. Valid values are alphanumeric characters and punctuation <code>(!"#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~)</code>.</p><p>For best practices of using <code>MessageGroupId</code>, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queue-recommendations.html#using-messagegroupid-property">Using the MessageGroupId Property</a> in the <i>Amazon Simple Queue Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageGroupId;

/**
 <p>The URL of the Amazon SQS queue to take action on.</p><p>Queue URLs are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueUrl;

@end

/**
 <p>The MD5OfMessageBody and MessageId elements.</p>
 */
@interface AWSSQSSendMessageResult : AWSModel


/**
 <p>An MD5 digest of the non-URL-encoded message attribute string. This can be used to verify that Amazon SQS received the message correctly. Amazon SQS first URL decodes the message before creating the MD5 digest. For information about MD5, see <a href="https://www.ietf.org/rfc/rfc1321.txt">RFC1321</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MD5OfMessageAttributes;

/**
 <p>An MD5 digest of the non-URL-encoded message body string. This can be used to verify that Amazon SQS received the message correctly. Amazon SQS first URL decodes the message before creating the MD5 digest. For information about MD5, see <a href="https://www.ietf.org/rfc/rfc1321.txt">RFC1321</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MD5OfMessageBody;

/**
 <p>An element containing the message ID of the message sent to the queue. For more information, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/ImportantIdentifiers.html">Queue and Message Identifiers</a> in the <i>Amazon SQS Developer Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

/**
 <p><i>This element applies only to FIFO (first-in-first-out) queues.</i></p><p>A large, non-consecutive number that Amazon SQS assigns to each message.</p><p>The length of <code>SequenceNumber</code> is 128 bits. <code>SequenceNumber</code> continues to increase for a particular <code>MessageGroupId</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sequenceNumber;

@end

/**
 <p/>
 Required parameters: [QueueUrl, Attributes]
 */
@interface AWSSQSSetQueueAttributesRequest : AWSRequest


/**
 <p>A map of attributes to set.</p><p>The following lists the names, descriptions, and values of the special request parameters that the <code>SetQueueAttributes</code> action uses:</p><ul><li><p><code>DelaySeconds</code> - The number of seconds for which the delivery of all messages in the queue is delayed. An integer from 0 to 900 (15 minutes). The default is 0 (zero). </p></li><li><p><code>MaximumMessageSize</code> - The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1,024 bytes (1 KiB) up to 262,144 bytes (256 KiB). The default is 262,144 (256 KiB). </p></li><li><p><code>MessageRetentionPeriod</code> - The number of seconds for which Amazon SQS retains a message. An integer representing seconds, from 60 (1 minute) to 120,9600 (14 days). The default is 345,600 (4 days). </p></li><li><p><code>Policy</code> - The queue's policy. A valid AWS policy. For more information about policy structure, see <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/PoliciesOverview.html">Overview of AWS IAM Policies</a> in the <i>Amazon IAM User Guide</i>. </p></li><li><p><code>ReceiveMessageWaitTimeSeconds</code> - The number of seconds for which a <a>ReceiveMessage</a> action will wait for a message to arrive. An integer from 0 to 20 (seconds). The default is 0. </p></li><li><p><code>RedrivePolicy</code> - The parameters for the dead letter queue functionality of the source queue. For more information about the redrive policy and dead letter queues, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/SQSDeadLetterQueue.html">Using Amazon SQS Dead Letter Queues</a> in the <i>Amazon SQS Developer Guide</i>. </p><note><p>The dead letter queue of a FIFO queue must also be a FIFO queue. Similarly, the dead letter queue of a standard queue must also be a standard queue.</p></note></li><li><p><code>VisibilityTimeout</code> - The visibility timeout for the queue. An integer from 0 to 43200 (12 hours). The default is 30. For more information about the visibility timeout, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/AboutVT.html">Visibility Timeout</a> in the <i>Amazon SQS Developer Guide</i>.</p></li></ul><p>The following attribute applies only to <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html">FIFO (first-in-first-out) queues</a>:</p><ul><li><p><code>ContentBasedDeduplication</code> - Enables content-based deduplication. For more information, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html#FIFO-queues-exactly-once-processing">Exactly-Once Processing</a> in the <i>Amazon SQS Developer Guide</i>. </p><ul><li><p>Every message must have a unique <code>MessageDeduplicationId</code>,</p><ul><li><p>You may provide a <code>MessageDeduplicationId</code> explicitly.</p></li><li><p>If you aren't able to provide a <code>MessageDeduplicationId</code> and you enable <code>ContentBasedDeduplication</code> for your queue, Amazon SQS uses a SHA-256 hash to generate the <code>MessageDeduplicationId</code> using the body of the message (but not the attributes of the message). </p></li><li><p>If you don't provide a <code>MessageDeduplicationId</code> and the queue doesn't have <code>ContentBasedDeduplication</code> set, the action fails with an error.</p></li><li><p>If the queue has <code>ContentBasedDeduplication</code> set, your <code>MessageDeduplicationId</code> overrides the generated one.</p></li></ul></li><li><p>When <code>ContentBasedDeduplication</code> is in effect, messages with identical content sent within the deduplication interval are treated as duplicates and only one copy of the message is delivered.</p></li><li><p>You can also use <code>ContentBasedDeduplication</code> for messages with identical content to be treated as duplicates.</p></li><li><p>If you send one message with <code>ContentBasedDeduplication</code> enabled and then another message with a <code>MessageDeduplicationId</code> that is the same as the one generated for the first <code>MessageDeduplicationId</code>, the two messages are treated as duplicates and only one copy of the message is delivered. </p></li></ul></li></ul><p>Any other valid special request parameters that are specified (such as <code>ApproximateNumberOfMessages</code>, <code>ApproximateNumberOfMessagesDelayed</code>, <code>ApproximateNumberOfMessagesNotVisible</code>, <code>CreatedTimestamp</code>, <code>LastModifiedTimestamp</code>, and <code>QueueArn</code>) will be ignored.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The URL of the Amazon SQS queue to take action on.</p><p>Queue URLs are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueUrl;

@end

NS_ASSUME_NONNULL_END
