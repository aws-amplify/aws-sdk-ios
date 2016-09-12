//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"identifier" : @"Id",
             @"message" : @"Message",
             @"senderFault" : @"SenderFault",
             };
}

@end

@implementation AWSSQSChangeMessageVisibilityBatchRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"receiptHandle" : @"ReceiptHandle",
             @"visibilityTimeout" : @"VisibilityTimeout",
             };
}

@end

@implementation AWSSQSChangeMessageVisibilityBatchResult

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSSQSChangeMessageVisibilityRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queueUrl" : @"QueueUrl",
             @"receiptHandle" : @"ReceiptHandle",
             @"visibilityTimeout" : @"VisibilityTimeout",
             };
}

@end

@implementation AWSSQSCreateQueueRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"queueName" : @"QueueName",
             };
}

@end

@implementation AWSSQSCreateQueueResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queueUrl" : @"QueueUrl",
             };
}

@end

@implementation AWSSQSDeleteMessageBatchRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"receiptHandle" : @"ReceiptHandle",
             };
}

@end

@implementation AWSSQSDeleteMessageBatchResult

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSSQSDeleteMessageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queueUrl" : @"QueueUrl",
             @"receiptHandle" : @"ReceiptHandle",
             };
}

@end

@implementation AWSSQSDeleteQueueRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queueUrl" : @"QueueUrl",
             };
}

@end

@implementation AWSSQSGetQueueAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeNames" : @"AttributeNames",
             @"queueUrl" : @"QueueUrl",
             };
}

@end

@implementation AWSSQSGetQueueAttributesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             };
}

@end

@implementation AWSSQSGetQueueUrlRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queueName" : @"QueueName",
             @"queueOwnerAWSAccountId" : @"QueueOwnerAWSAccountId",
             };
}

@end

@implementation AWSSQSGetQueueUrlResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queueUrl" : @"QueueUrl",
             };
}

@end

@implementation AWSSQSListDeadLetterSourceQueuesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queueUrl" : @"QueueUrl",
             };
}

@end

@implementation AWSSQSListDeadLetterSourceQueuesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queueUrls" : @"queueUrls",
             };
}

@end

@implementation AWSSQSListQueuesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queueNamePrefix" : @"QueueNamePrefix",
             };
}

@end

@implementation AWSSQSListQueuesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queueUrls" : @"QueueUrls",
             };
}

@end

@implementation AWSSQSMessage

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queueUrl" : @"QueueUrl",
             };
}

@end

@implementation AWSSQSReceiveMessageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeNames" : @"AttributeNames",
             @"maxNumberOfMessages" : @"MaxNumberOfMessages",
             @"messageAttributeNames" : @"MessageAttributeNames",
             @"queueUrl" : @"QueueUrl",
             @"visibilityTimeout" : @"VisibilityTimeout",
             @"waitTimeSeconds" : @"WaitTimeSeconds",
             };
}

@end

@implementation AWSSQSReceiveMessageResult

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"label" : @"Label",
             @"queueUrl" : @"QueueUrl",
             };
}

@end

@implementation AWSSQSSendMessageBatchRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"delaySeconds" : @"DelaySeconds",
             @"identifier" : @"Id",
             @"messageAttributes" : @"MessageAttributes",
             @"messageBody" : @"MessageBody",
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

@implementation AWSSQSSendMessageBatchResult

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"MD5OfMessageAttributes" : @"MD5OfMessageAttributes",
             @"MD5OfMessageBody" : @"MD5OfMessageBody",
             @"messageId" : @"MessageId",
             };
}

@end

@implementation AWSSQSSendMessageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"delaySeconds" : @"DelaySeconds",
             @"messageAttributes" : @"MessageAttributes",
             @"messageBody" : @"MessageBody",
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

@end

@implementation AWSSQSSendMessageResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"MD5OfMessageAttributes" : @"MD5OfMessageAttributes",
             @"MD5OfMessageBody" : @"MD5OfMessageBody",
             @"messageId" : @"MessageId",
             };
}

@end

@implementation AWSSQSSetQueueAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"queueUrl" : @"QueueUrl",
             };
}

@end
