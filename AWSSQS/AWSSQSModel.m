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

#import "AWSSQSModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSSQSErrorDomain = @"com.amazonaws.AWSSQSErrorDomain";

@implementation AWSSQSAddPermissionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"AWSAccountIds" : @"AWSAccountIds",
             @"actions" : @"Actions",
             @"label" : @"Label",
             @"queueUrl" : @"QueueUrl",
             };
}

@end

@implementation AWSSQSBatchResultErrorEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"identifier" : @"Id",
             @"message" : @"Message",
             @"senderFault" : @"SenderFault",
             };
}

@end

@implementation AWSSQSCancelMessageMoveTaskRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskHandle" : @"TaskHandle",
             };
}

@end

@implementation AWSSQSCancelMessageMoveTaskResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approximateNumberOfMessagesMoved" : @"ApproximateNumberOfMessagesMoved",
             };
}

@end

@implementation AWSSQSChangeMessageVisibilityBatchRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entries" : @"Entries",
             @"queueUrl" : @"QueueUrl",
             };
}

+ (NSValueTransformer *)entriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSQSChangeMessageVisibilityBatchRequestEntry class]];
}

@end

@implementation AWSSQSChangeMessageVisibilityBatchRequestEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"receiptHandle" : @"ReceiptHandle",
             @"visibilityTimeout" : @"VisibilityTimeout",
             };
}

@end

@implementation AWSSQSChangeMessageVisibilityBatchResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failed" : @"Failed",
             @"successful" : @"Successful",
             };
}

+ (NSValueTransformer *)failedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSQSBatchResultErrorEntry class]];
}

+ (NSValueTransformer *)successfulJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSQSChangeMessageVisibilityBatchResultEntry class]];
}

@end

@implementation AWSSQSChangeMessageVisibilityBatchResultEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSSQSChangeMessageVisibilityRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queueUrl" : @"QueueUrl",
             @"receiptHandle" : @"ReceiptHandle",
             @"visibilityTimeout" : @"VisibilityTimeout",
             };
}

@end

@implementation AWSSQSCreateQueueRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"queueName" : @"QueueName",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSSQSCreateQueueResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queueUrl" : @"QueueUrl",
             };
}

@end

@implementation AWSSQSDeleteMessageBatchRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entries" : @"Entries",
             @"queueUrl" : @"QueueUrl",
             };
}

+ (NSValueTransformer *)entriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSQSDeleteMessageBatchRequestEntry class]];
}

@end

@implementation AWSSQSDeleteMessageBatchRequestEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"receiptHandle" : @"ReceiptHandle",
             };
}

@end

@implementation AWSSQSDeleteMessageBatchResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failed" : @"Failed",
             @"successful" : @"Successful",
             };
}

+ (NSValueTransformer *)failedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSQSBatchResultErrorEntry class]];
}

+ (NSValueTransformer *)successfulJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSQSDeleteMessageBatchResultEntry class]];
}

@end

@implementation AWSSQSDeleteMessageBatchResultEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSSQSDeleteMessageRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queueUrl" : @"QueueUrl",
             @"receiptHandle" : @"ReceiptHandle",
             };
}

@end

@implementation AWSSQSDeleteQueueRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queueUrl" : @"QueueUrl",
             };
}

@end

@implementation AWSSQSGetQueueAttributesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeNames" : @"AttributeNames",
             @"queueUrl" : @"QueueUrl",
             };
}

@end

@implementation AWSSQSGetQueueAttributesResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             };
}

@end

@implementation AWSSQSGetQueueUrlRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queueName" : @"QueueName",
             @"queueOwnerAWSAccountId" : @"QueueOwnerAWSAccountId",
             };
}

@end

@implementation AWSSQSGetQueueUrlResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queueUrl" : @"QueueUrl",
             };
}

@end

@implementation AWSSQSListDeadLetterSourceQueuesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"queueUrl" : @"QueueUrl",
             };
}

@end

@implementation AWSSQSListDeadLetterSourceQueuesResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"queueUrls" : @"queueUrls",
             };
}

@end

@implementation AWSSQSListMessageMoveTasksRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"sourceArn" : @"SourceArn",
             };
}

@end

@implementation AWSSQSListMessageMoveTasksResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"results" : @"Results",
             };
}

+ (NSValueTransformer *)resultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSQSListMessageMoveTasksResultEntry class]];
}

@end

@implementation AWSSQSListMessageMoveTasksResultEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approximateNumberOfMessagesMoved" : @"ApproximateNumberOfMessagesMoved",
             @"approximateNumberOfMessagesToMove" : @"ApproximateNumberOfMessagesToMove",
             @"destinationArn" : @"DestinationArn",
             @"failureReason" : @"FailureReason",
             @"maxNumberOfMessagesPerSecond" : @"MaxNumberOfMessagesPerSecond",
             @"sourceArn" : @"SourceArn",
             @"startedTimestamp" : @"StartedTimestamp",
             @"status" : @"Status",
             @"taskHandle" : @"TaskHandle",
             };
}

@end

@implementation AWSSQSListQueueTagsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queueUrl" : @"QueueUrl",
             };
}

@end

@implementation AWSSQSListQueueTagsResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSSQSListQueuesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"queueNamePrefix" : @"QueueNamePrefix",
             };
}

@end

@implementation AWSSQSListQueuesResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"queueUrls" : @"QueueUrls",
             };
}

@end

@implementation AWSSQSMessage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"body" : @"Body",
             @"MD5OfBody" : @"MD5OfBody",
             @"MD5OfMessageAttributes" : @"MD5OfMessageAttributes",
             @"messageAttributes" : @"MessageAttributes",
             @"messageId" : @"MessageId",
             @"receiptHandle" : @"ReceiptHandle",
             };
}

+ (NSValueTransformer *)messageAttributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSQSMessageAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSSQSMessageAttributeValue

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"binaryListValues" : @"BinaryListValues",
             @"binaryValue" : @"BinaryValue",
             @"dataType" : @"DataType",
             @"stringListValues" : @"StringListValues",
             @"stringValue" : @"StringValue",
             };
}

@end

@implementation AWSSQSMessageSystemAttributeValue

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"binaryListValues" : @"BinaryListValues",
             @"binaryValue" : @"BinaryValue",
             @"dataType" : @"DataType",
             @"stringListValues" : @"StringListValues",
             @"stringValue" : @"StringValue",
             };
}

@end

@implementation AWSSQSPurgeQueueRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queueUrl" : @"QueueUrl",
             };
}

@end

@implementation AWSSQSReceiveMessageRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeNames" : @"AttributeNames",
             @"maxNumberOfMessages" : @"MaxNumberOfMessages",
             @"messageAttributeNames" : @"MessageAttributeNames",
             @"queueUrl" : @"QueueUrl",
             @"receiveRequestAttemptId" : @"ReceiveRequestAttemptId",
             @"visibilityTimeout" : @"VisibilityTimeout",
             @"waitTimeSeconds" : @"WaitTimeSeconds",
             };
}

@end

@implementation AWSSQSReceiveMessageResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messages" : @"Messages",
             };
}

+ (NSValueTransformer *)messagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSQSMessage class]];
}

@end

@implementation AWSSQSRemovePermissionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"label" : @"Label",
             @"queueUrl" : @"QueueUrl",
             };
}

@end

@implementation AWSSQSSendMessageBatchRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entries" : @"Entries",
             @"queueUrl" : @"QueueUrl",
             };
}

+ (NSValueTransformer *)entriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSQSSendMessageBatchRequestEntry class]];
}

@end

@implementation AWSSQSSendMessageBatchRequestEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"delaySeconds" : @"DelaySeconds",
             @"identifier" : @"Id",
             @"messageAttributes" : @"MessageAttributes",
             @"messageBody" : @"MessageBody",
             @"messageDeduplicationId" : @"MessageDeduplicationId",
             @"messageGroupId" : @"MessageGroupId",
             @"messageSystemAttributes" : @"MessageSystemAttributes",
             };
}

+ (NSValueTransformer *)messageAttributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSQSMessageAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)messageSystemAttributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSQSMessageSystemAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSSQSSendMessageBatchResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failed" : @"Failed",
             @"successful" : @"Successful",
             };
}

+ (NSValueTransformer *)failedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSQSBatchResultErrorEntry class]];
}

+ (NSValueTransformer *)successfulJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSQSSendMessageBatchResultEntry class]];
}

@end

@implementation AWSSQSSendMessageBatchResultEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"MD5OfMessageAttributes" : @"MD5OfMessageAttributes",
             @"MD5OfMessageBody" : @"MD5OfMessageBody",
             @"MD5OfMessageSystemAttributes" : @"MD5OfMessageSystemAttributes",
             @"messageId" : @"MessageId",
             @"sequenceNumber" : @"SequenceNumber",
             };
}

@end

@implementation AWSSQSSendMessageRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"delaySeconds" : @"DelaySeconds",
             @"messageAttributes" : @"MessageAttributes",
             @"messageBody" : @"MessageBody",
             @"messageDeduplicationId" : @"MessageDeduplicationId",
             @"messageGroupId" : @"MessageGroupId",
             @"messageSystemAttributes" : @"MessageSystemAttributes",
             @"queueUrl" : @"QueueUrl",
             };
}

+ (NSValueTransformer *)messageAttributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSQSMessageAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)messageSystemAttributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSQSMessageSystemAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSSQSSendMessageResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"MD5OfMessageAttributes" : @"MD5OfMessageAttributes",
             @"MD5OfMessageBody" : @"MD5OfMessageBody",
             @"MD5OfMessageSystemAttributes" : @"MD5OfMessageSystemAttributes",
             @"messageId" : @"MessageId",
             @"sequenceNumber" : @"SequenceNumber",
             };
}

@end

@implementation AWSSQSSetQueueAttributesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"queueUrl" : @"QueueUrl",
             };
}

@end

@implementation AWSSQSStartMessageMoveTaskRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationArn" : @"DestinationArn",
             @"maxNumberOfMessagesPerSecond" : @"MaxNumberOfMessagesPerSecond",
             @"sourceArn" : @"SourceArn",
             };
}

@end

@implementation AWSSQSStartMessageMoveTaskResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskHandle" : @"TaskHandle",
             };
}

@end

@implementation AWSSQSTagQueueRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queueUrl" : @"QueueUrl",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSSQSUntagQueueRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queueUrl" : @"QueueUrl",
             @"tagKeys" : @"TagKeys",
             };
}

@end
