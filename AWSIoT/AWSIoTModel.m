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

#import "AWSIoTModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSIoTErrorDomain = @"com.amazonaws.AWSIoTErrorDomain";

@implementation AWSIoTAcceptCertificateTransferRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateId" : @"certificateId",
             @"setAsActive" : @"setAsActive",
             };
}

@end

@implementation AWSIoTAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dynamoDB" : @"dynamoDB",
             @"firehose" : @"firehose",
             @"kinesis" : @"kinesis",
             @"lambda" : @"lambda",
             @"republish" : @"republish",
             @"s3" : @"s3",
             @"sns" : @"sns",
             @"sqs" : @"sqs",
             };
}

+ (NSValueTransformer *)dynamoDBJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTDynamoDBAction class]];
}

+ (NSValueTransformer *)firehoseJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTFirehoseAction class]];
}

+ (NSValueTransformer *)kinesisJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTKinesisAction class]];
}

+ (NSValueTransformer *)lambdaJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTLambdaAction class]];
}

+ (NSValueTransformer *)republishJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTRepublishAction class]];
}

+ (NSValueTransformer *)s3JSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTS3Action class]];
}

+ (NSValueTransformer *)snsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTSnsAction class]];
}

+ (NSValueTransformer *)sqsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTSqsAction class]];
}

@end

@implementation AWSIoTAttachPrincipalPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             @"principal" : @"principal",
             };
}

@end

@implementation AWSIoTAttachThingPrincipalRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"principal" : @"principal",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTAttachThingPrincipalResponse

@end

@implementation AWSIoTAttributePayload

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"attributes",
             };
}

@end

@implementation AWSIoTCancelCertificateTransferRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateId" : @"certificateId",
             };
}

@end

@implementation AWSIoTCertificate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"certificateArn",
             @"certificateId" : @"certificateId",
             @"creationDate" : @"creationDate",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"ACTIVE"]) {
            return @(AWSIoTCertificateStatusActive);
        }
        if ([value isEqualToString:@"INACTIVE"]) {
            return @(AWSIoTCertificateStatusInactive);
        }
        if ([value isEqualToString:@"REVOKED"]) {
            return @(AWSIoTCertificateStatusRevoked);
        }
        if ([value isEqualToString:@"PENDING_TRANSFER"]) {
            return @(AWSIoTCertificateStatusPendingTransfer);
        }
        return @(AWSIoTCertificateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTCertificateStatusActive:
                return @"ACTIVE";
            case AWSIoTCertificateStatusInactive:
                return @"INACTIVE";
            case AWSIoTCertificateStatusRevoked:
                return @"REVOKED";
            case AWSIoTCertificateStatusPendingTransfer:
                return @"PENDING_TRANSFER";
            case AWSIoTCertificateStatusUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTCertificateDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"certificateArn",
             @"certificateId" : @"certificateId",
             @"certificatePem" : @"certificatePem",
             @"creationDate" : @"creationDate",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"ownedBy" : @"ownedBy",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)lastModifiedDateJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"ACTIVE"]) {
            return @(AWSIoTCertificateStatusActive);
        }
        if ([value isEqualToString:@"INACTIVE"]) {
            return @(AWSIoTCertificateStatusInactive);
        }
        if ([value isEqualToString:@"REVOKED"]) {
            return @(AWSIoTCertificateStatusRevoked);
        }
        if ([value isEqualToString:@"PENDING_TRANSFER"]) {
            return @(AWSIoTCertificateStatusPendingTransfer);
        }
        return @(AWSIoTCertificateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTCertificateStatusActive:
                return @"ACTIVE";
            case AWSIoTCertificateStatusInactive:
                return @"INACTIVE";
            case AWSIoTCertificateStatusRevoked:
                return @"REVOKED";
            case AWSIoTCertificateStatusPendingTransfer:
                return @"PENDING_TRANSFER";
            case AWSIoTCertificateStatusUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTCreateCertificateFromCsrRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateSigningRequest" : @"certificateSigningRequest",
             @"setAsActive" : @"setAsActive",
             };
}

@end

@implementation AWSIoTCreateCertificateFromCsrResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"certificateArn",
             @"certificateId" : @"certificateId",
             @"certificatePem" : @"certificatePem",
             };
}

@end

@implementation AWSIoTCreateKeysAndCertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"setAsActive" : @"setAsActive",
             };
}

@end

@implementation AWSIoTCreateKeysAndCertificateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"certificateArn",
             @"certificateId" : @"certificateId",
             @"certificatePem" : @"certificatePem",
             @"keyPair" : @"keyPair",
             };
}

+ (NSValueTransformer *)keyPairJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTKeyPair class]];
}

@end

@implementation AWSIoTCreatePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyDocument" : @"policyDocument",
             @"policyName" : @"policyName",
             };
}

@end

@implementation AWSIoTCreatePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyArn" : @"policyArn",
             @"policyDocument" : @"policyDocument",
             @"policyName" : @"policyName",
             @"policyVersionId" : @"policyVersionId",
             };
}

@end

@implementation AWSIoTCreatePolicyVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyDocument" : @"policyDocument",
             @"policyName" : @"policyName",
             @"setAsDefault" : @"setAsDefault",
             };
}

@end

@implementation AWSIoTCreatePolicyVersionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isDefaultVersion" : @"isDefaultVersion",
             @"policyArn" : @"policyArn",
             @"policyDocument" : @"policyDocument",
             @"policyVersionId" : @"policyVersionId",
             };
}

@end

@implementation AWSIoTCreateThingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributePayload" : @"attributePayload",
             @"thingName" : @"thingName",
             };
}

+ (NSValueTransformer *)attributePayloadJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAttributePayload class]];
}

@end

@implementation AWSIoTCreateThingResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingArn" : @"thingArn",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTCreateTopicRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleName" : @"ruleName",
             @"topicRulePayload" : @"topicRulePayload",
             };
}

+ (NSValueTransformer *)topicRulePayloadJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTTopicRulePayload class]];
}

@end

@implementation AWSIoTDeleteCertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateId" : @"certificateId",
             };
}

@end

@implementation AWSIoTDeletePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             };
}

@end

@implementation AWSIoTDeletePolicyVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             @"policyVersionId" : @"policyVersionId",
             };
}

@end

@implementation AWSIoTDeleteThingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTDeleteThingResponse

@end

@implementation AWSIoTDeleteTopicRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleName" : @"ruleName",
             };
}

@end

@implementation AWSIoTDescribeCertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateId" : @"certificateId",
             };
}

@end

@implementation AWSIoTDescribeCertificateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateDescription" : @"certificateDescription",
             };
}

+ (NSValueTransformer *)certificateDescriptionJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTCertificateDescription class]];
}

@end

@implementation AWSIoTDescribeEndpointRequest

@end

@implementation AWSIoTDescribeEndpointResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointAddress" : @"endpointAddress",
             };
}

@end

@implementation AWSIoTDescribeThingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTDescribeThingResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"attributes",
             @"defaultClientId" : @"defaultClientId",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTDetachPrincipalPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             @"principal" : @"principal",
             };
}

@end

@implementation AWSIoTDetachThingPrincipalRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"principal" : @"principal",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTDetachThingPrincipalResponse

@end

@implementation AWSIoTDynamoDBAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hashKeyField" : @"hashKeyField",
             @"hashKeyValue" : @"hashKeyValue",
             @"payloadField" : @"payloadField",
             @"rangeKeyField" : @"rangeKeyField",
             @"rangeKeyValue" : @"rangeKeyValue",
             @"roleArn" : @"roleArn",
             @"tableName" : @"tableName",
             };
}

@end

@implementation AWSIoTFirehoseAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamName" : @"deliveryStreamName",
             @"roleArn" : @"roleArn",
             };
}

@end

@implementation AWSIoTGetLoggingOptionsRequest

@end

@implementation AWSIoTGetLoggingOptionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logLevel" : @"logLevel",
             @"roleArn" : @"roleArn",
             };
}

+ (NSValueTransformer *)logLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"DEBUG"]) {
            return @(AWSIoTLogLevelDebug);
        }
        if ([value isEqualToString:@"INFO"]) {
            return @(AWSIoTLogLevelInfo);
        }
        if ([value isEqualToString:@"ERROR"]) {
            return @(AWSIoTLogLevelError);
        }
        if ([value isEqualToString:@"WARN"]) {
            return @(AWSIoTLogLevelWarn);
        }
        if ([value isEqualToString:@"DISABLED"]) {
            return @(AWSIoTLogLevelDisabled);
        }
        return @(AWSIoTLogLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTLogLevelDebug:
                return @"DEBUG";
            case AWSIoTLogLevelInfo:
                return @"INFO";
            case AWSIoTLogLevelError:
                return @"ERROR";
            case AWSIoTLogLevelWarn:
                return @"WARN";
            case AWSIoTLogLevelDisabled:
                return @"DISABLED";
            case AWSIoTLogLevelUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTGetPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             };
}

@end

@implementation AWSIoTGetPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultVersionId" : @"defaultVersionId",
             @"policyArn" : @"policyArn",
             @"policyDocument" : @"policyDocument",
             @"policyName" : @"policyName",
             };
}

@end

@implementation AWSIoTGetPolicyVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             @"policyVersionId" : @"policyVersionId",
             };
}

@end

@implementation AWSIoTGetPolicyVersionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isDefaultVersion" : @"isDefaultVersion",
             @"policyArn" : @"policyArn",
             @"policyDocument" : @"policyDocument",
             @"policyName" : @"policyName",
             @"policyVersionId" : @"policyVersionId",
             };
}

@end

@implementation AWSIoTGetTopicRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleName" : @"ruleName",
             };
}

@end

@implementation AWSIoTGetTopicRuleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rule" : @"rule",
             };
}

+ (NSValueTransformer *)ruleJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTTopicRule class]];
}

@end

@implementation AWSIoTKeyPair

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"privateKey" : @"PrivateKey",
             @"publicKey" : @"PublicKey",
             };
}

@end

@implementation AWSIoTKinesisAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"partitionKey" : @"partitionKey",
             @"roleArn" : @"roleArn",
             @"streamName" : @"streamName",
             };
}

@end

@implementation AWSIoTLambdaAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionArn" : @"functionArn",
             };
}

@end

@implementation AWSIoTListCertificatesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ascendingOrder" : @"ascendingOrder",
             @"marker" : @"marker",
             @"pageSize" : @"pageSize",
             };
}

@end

@implementation AWSIoTListCertificatesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificates" : @"certificates",
             @"nextMarker" : @"nextMarker",
             };
}

+ (NSValueTransformer *)certificatesJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTCertificate class]];
}

@end

@implementation AWSIoTListPoliciesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ascendingOrder" : @"ascendingOrder",
             @"marker" : @"marker",
             @"pageSize" : @"pageSize",
             };
}

@end

@implementation AWSIoTListPoliciesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"nextMarker",
             @"policies" : @"policies",
             };
}

+ (NSValueTransformer *)policiesJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTPolicy class]];
}

@end

@implementation AWSIoTListPolicyVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             };
}

@end

@implementation AWSIoTListPolicyVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyVersions" : @"policyVersions",
             };
}

+ (NSValueTransformer *)policyVersionsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTPolicyVersion class]];
}

@end

@implementation AWSIoTListPrincipalPoliciesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ascendingOrder" : @"ascendingOrder",
             @"marker" : @"marker",
             @"pageSize" : @"pageSize",
             @"principal" : @"principal",
             };
}

@end

@implementation AWSIoTListPrincipalPoliciesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"nextMarker",
             @"policies" : @"policies",
             };
}

+ (NSValueTransformer *)policiesJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTPolicy class]];
}

@end

@implementation AWSIoTListPrincipalThingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"principal" : @"principal",
             };
}

@end

@implementation AWSIoTListPrincipalThingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"things" : @"things",
             };
}

@end

@implementation AWSIoTListThingPrincipalsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTListThingPrincipalsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"principals" : @"principals",
             };
}

@end

@implementation AWSIoTListThingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"attributeName",
             @"attributeValue" : @"attributeValue",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIoTListThingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"things" : @"things",
             };
}

+ (NSValueTransformer *)thingsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTThingAttribute class]];
}

@end

@implementation AWSIoTListTopicRulesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"ruleDisabled" : @"ruleDisabled",
             @"topic" : @"topic",
             };
}

@end

@implementation AWSIoTListTopicRulesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"rules" : @"rules",
             };
}

+ (NSValueTransformer *)rulesJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTTopicRuleListItem class]];
}

@end

@implementation AWSIoTLoggingOptionsPayload

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logLevel" : @"logLevel",
             @"roleArn" : @"roleArn",
             };
}

+ (NSValueTransformer *)logLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"DEBUG"]) {
            return @(AWSIoTLogLevelDebug);
        }
        if ([value isEqualToString:@"INFO"]) {
            return @(AWSIoTLogLevelInfo);
        }
        if ([value isEqualToString:@"ERROR"]) {
            return @(AWSIoTLogLevelError);
        }
        if ([value isEqualToString:@"WARN"]) {
            return @(AWSIoTLogLevelWarn);
        }
        if ([value isEqualToString:@"DISABLED"]) {
            return @(AWSIoTLogLevelDisabled);
        }
        return @(AWSIoTLogLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTLogLevelDebug:
                return @"DEBUG";
            case AWSIoTLogLevelInfo:
                return @"INFO";
            case AWSIoTLogLevelError:
                return @"ERROR";
            case AWSIoTLogLevelWarn:
                return @"WARN";
            case AWSIoTLogLevelDisabled:
                return @"DISABLED";
            case AWSIoTLogLevelUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyArn" : @"policyArn",
             @"policyName" : @"policyName",
             };
}

@end

@implementation AWSIoTPolicyVersion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createDate" : @"createDate",
             @"isDefaultVersion" : @"isDefaultVersion",
             @"versionId" : @"versionId",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSIoTRejectCertificateTransferRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateId" : @"certificateId",
             };
}

@end

@implementation AWSIoTReplaceTopicRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleName" : @"ruleName",
             @"topicRulePayload" : @"topicRulePayload",
             };
}

+ (NSValueTransformer *)topicRulePayloadJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTTopicRulePayload class]];
}

@end

@implementation AWSIoTRepublishAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"roleArn",
             @"topic" : @"topic",
             };
}

@end

@implementation AWSIoTS3Action

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketName" : @"bucketName",
             @"key" : @"key",
             @"roleArn" : @"roleArn",
             };
}

@end

@implementation AWSIoTSetDefaultPolicyVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             @"policyVersionId" : @"policyVersionId",
             };
}

@end

@implementation AWSIoTSetLoggingOptionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loggingOptionsPayload" : @"loggingOptionsPayload",
             };
}

+ (NSValueTransformer *)loggingOptionsPayloadJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTLoggingOptionsPayload class]];
}

@end

@implementation AWSIoTSnsAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"roleArn",
             @"targetArn" : @"targetArn",
             };
}

@end

@implementation AWSIoTSqsAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queueUrl" : @"queueUrl",
             @"roleArn" : @"roleArn",
             @"useBase64" : @"useBase64",
             };
}

@end

@implementation AWSIoTThingAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"attributes",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTTopicRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actions" : @"actions",
             @"createdAt" : @"createdAt",
             @"detail" : @"description",
             @"ruleDisabled" : @"ruleDisabled",
             @"ruleName" : @"ruleName",
             @"sql" : @"sql",
             };
}

+ (NSValueTransformer *)actionsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTAction class]];
}

+ (NSValueTransformer *)createdAtJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSIoTTopicRuleListItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAt" : @"createdAt",
             @"ruleDisabled" : @"ruleDisabled",
             @"ruleName" : @"ruleName",
             @"topicPattern" : @"topicPattern",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSIoTTopicRulePayload

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actions" : @"actions",
             @"detail" : @"description",
             @"ruleDisabled" : @"ruleDisabled",
             @"sql" : @"sql",
             };
}

+ (NSValueTransformer *)actionsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTAction class]];
}

@end

@implementation AWSIoTTransferCertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateId" : @"certificateId",
             @"targetAwsAccount" : @"targetAwsAccount",
             };
}

@end

@implementation AWSIoTTransferCertificateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transferredCertificateArn" : @"transferredCertificateArn",
             };
}

@end

@implementation AWSIoTUpdateCertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateId" : @"certificateId",
             @"latestStatus" : @"newStatus",
             };
}

+ (NSValueTransformer *)latestStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"ACTIVE"]) {
            return @(AWSIoTCertificateStatusActive);
        }
        if ([value isEqualToString:@"INACTIVE"]) {
            return @(AWSIoTCertificateStatusInactive);
        }
        if ([value isEqualToString:@"REVOKED"]) {
            return @(AWSIoTCertificateStatusRevoked);
        }
        if ([value isEqualToString:@"PENDING_TRANSFER"]) {
            return @(AWSIoTCertificateStatusPendingTransfer);
        }
        return @(AWSIoTCertificateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTCertificateStatusActive:
                return @"ACTIVE";
            case AWSIoTCertificateStatusInactive:
                return @"INACTIVE";
            case AWSIoTCertificateStatusRevoked:
                return @"REVOKED";
            case AWSIoTCertificateStatusPendingTransfer:
                return @"PENDING_TRANSFER";
            case AWSIoTCertificateStatusUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTUpdateThingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributePayload" : @"attributePayload",
             @"thingName" : @"thingName",
             };
}

+ (NSValueTransformer *)attributePayloadJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAttributePayload class]];
}

@end

@implementation AWSIoTUpdateThingResponse

@end
