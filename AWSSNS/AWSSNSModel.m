/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import "AWSSNSModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSSNSErrorDomain = @"com.amazonaws.AWSSNSErrorDomain";

@implementation AWSSNSAddPermissionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"AWSAccountId" : @"AWSAccountId",
             @"actionName" : @"ActionName",
             @"label" : @"Label",
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSNSConfirmSubscriptionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authenticateOnUnsubscribe" : @"AuthenticateOnUnsubscribe",
             @"token" : @"Token",
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSNSConfirmSubscriptionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subscriptionArn" : @"SubscriptionArn",
             };
}

@end

@implementation AWSSNSCreateEndpointResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSSNSCreatePlatformApplicationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"name" : @"Name",
             @"platform" : @"Platform",
             };
}

@end

@implementation AWSSNSCreatePlatformApplicationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"platformApplicationArn" : @"PlatformApplicationArn",
             };
}

@end

@implementation AWSSNSCreatePlatformEndpointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"customUserData" : @"CustomUserData",
             @"platformApplicationArn" : @"PlatformApplicationArn",
             @"token" : @"Token",
             };
}

@end

@implementation AWSSNSCreateTopicInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSSNSCreateTopicResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSNSDeleteEndpointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSSNSDeletePlatformApplicationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"platformApplicationArn" : @"PlatformApplicationArn",
             };
}

@end

@implementation AWSSNSDeleteTopicInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSNSEndpoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSSNSGetEndpointAttributesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSSNSGetEndpointAttributesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             };
}

@end

@implementation AWSSNSGetPlatformApplicationAttributesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"platformApplicationArn" : @"PlatformApplicationArn",
             };
}

@end

@implementation AWSSNSGetPlatformApplicationAttributesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             };
}

@end

@implementation AWSSNSGetSubscriptionAttributesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subscriptionArn" : @"SubscriptionArn",
             };
}

@end

@implementation AWSSNSGetSubscriptionAttributesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             };
}

@end

@implementation AWSSNSGetTopicAttributesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSNSGetTopicAttributesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             };
}

@end

@implementation AWSSNSListEndpointsByPlatformApplicationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"platformApplicationArn" : @"PlatformApplicationArn",
             };
}

@end

@implementation AWSSNSListEndpointsByPlatformApplicationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoints" : @"Endpoints",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)endpointsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSNSEndpoint class]];
}

@end

@implementation AWSSNSListPlatformApplicationsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSNSListPlatformApplicationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"platformApplications" : @"PlatformApplications",
             };
}

+ (NSValueTransformer *)platformApplicationsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSNSPlatformApplication class]];
}

@end

@implementation AWSSNSListSubscriptionsByTopicInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSNSListSubscriptionsByTopicResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"subscriptions" : @"Subscriptions",
             };
}

+ (NSValueTransformer *)subscriptionsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSNSSubscription class]];
}

@end

@implementation AWSSNSListSubscriptionsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSNSListSubscriptionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"subscriptions" : @"Subscriptions",
             };
}

+ (NSValueTransformer *)subscriptionsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSNSSubscription class]];
}

@end

@implementation AWSSNSListTopicsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSNSListTopicsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"topics" : @"Topics",
             };
}

+ (NSValueTransformer *)topicsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSNSTopic class]];
}

@end

@implementation AWSSNSMessageAttributeValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"binaryValue" : @"BinaryValue",
             @"dataType" : @"DataType",
             @"stringValue" : @"StringValue",
             };
}

@end

@implementation AWSSNSPlatformApplication

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"platformApplicationArn" : @"PlatformApplicationArn",
             };
}

@end

@implementation AWSSNSPublishInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"messageAttributes" : @"MessageAttributes",
             @"messageStructure" : @"MessageStructure",
             @"subject" : @"Subject",
             @"targetArn" : @"TargetArn",
             @"topicArn" : @"TopicArn",
             };
}

+ (NSValueTransformer *)messageAttributesJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
		return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSNSMessageAttributeValue class]];
	} reverseBlock:^id(id mapMTLDictionary) {
		return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
	}];
}

@end

@implementation AWSSNSPublishResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageId" : @"MessageId",
             };
}

@end

@implementation AWSSNSRemovePermissionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"label" : @"Label",
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSNSSetEndpointAttributesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSSNSSetPlatformApplicationAttributesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"platformApplicationArn" : @"PlatformApplicationArn",
             };
}

@end

@implementation AWSSNSSetSubscriptionAttributesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"attributeValue" : @"AttributeValue",
             @"subscriptionArn" : @"SubscriptionArn",
             };
}

@end

@implementation AWSSNSSetTopicAttributesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"attributeValue" : @"AttributeValue",
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSNSSubscribeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoint" : @"Endpoint",
             @"protocols" : @"Protocol",
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSNSSubscribeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subscriptionArn" : @"SubscriptionArn",
             };
}

@end

@implementation AWSSNSSubscription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoint" : @"Endpoint",
             @"owner" : @"Owner",
             @"protocols" : @"Protocol",
             @"subscriptionArn" : @"SubscriptionArn",
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSNSTopic

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"topicArn" : @"TopicArn",
             };
}

@end

@implementation AWSSNSUnsubscribeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subscriptionArn" : @"SubscriptionArn",
             };
}

@end
