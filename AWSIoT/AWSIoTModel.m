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
             @"cloudwatchAlarm" : @"cloudwatchAlarm",
             @"cloudwatchMetric" : @"cloudwatchMetric",
             @"dynamoDB" : @"dynamoDB",
             @"elasticsearch" : @"elasticsearch",
             @"firehose" : @"firehose",
             @"kinesis" : @"kinesis",
             @"lambda" : @"lambda",
             @"republish" : @"republish",
             @"s3" : @"s3",
             @"sns" : @"sns",
             @"sqs" : @"sqs",
             };
}

+ (NSValueTransformer *)cloudwatchAlarmJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTCloudwatchAlarmAction class]];
}

+ (NSValueTransformer *)cloudwatchMetricJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTCloudwatchMetricAction class]];
}

+ (NSValueTransformer *)dynamoDBJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTDynamoDBAction class]];
}

+ (NSValueTransformer *)elasticsearchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTElasticsearchAction class]];
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

@implementation AWSIoTCACertificate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"certificateArn",
             @"certificateId" : @"certificateId",
             @"creationDate" : @"creationDate",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSIoTCACertificateStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSIoTCACertificateStatusInactive);
        }
        return @(AWSIoTCACertificateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTCACertificateStatusActive:
                return @"ACTIVE";
            case AWSIoTCACertificateStatusInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTCACertificateDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"certificateArn",
             @"certificateId" : @"certificateId",
             @"certificatePem" : @"certificatePem",
             @"creationDate" : @"creationDate",
             @"ownedBy" : @"ownedBy",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSIoTCACertificateStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSIoTCACertificateStatusInactive);
        }
        return @(AWSIoTCACertificateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTCACertificateStatusActive:
                return @"ACTIVE";
            case AWSIoTCACertificateStatusInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSIoTCertificateStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSIoTCertificateStatusInactive);
        }
        if ([value caseInsensitiveCompare:@"REVOKED"] == NSOrderedSame) {
            return @(AWSIoTCertificateStatusRevoked);
        }
        if ([value caseInsensitiveCompare:@"PENDING_TRANSFER"] == NSOrderedSame) {
            return @(AWSIoTCertificateStatusPendingTransfer);
        }
        if ([value caseInsensitiveCompare:@"REGISTER_INACTIVE"] == NSOrderedSame) {
            return @(AWSIoTCertificateStatusRegisterInactive);
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
            case AWSIoTCertificateStatusRegisterInactive:
                return @"REGISTER_INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTCertificateDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"caCertificateId" : @"caCertificateId",
             @"certificateArn" : @"certificateArn",
             @"certificateId" : @"certificateId",
             @"certificatePem" : @"certificatePem",
             @"creationDate" : @"creationDate",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"ownedBy" : @"ownedBy",
             @"previousOwnedBy" : @"previousOwnedBy",
             @"status" : @"status",
             @"transferData" : @"transferData",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSIoTCertificateStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSIoTCertificateStatusInactive);
        }
        if ([value caseInsensitiveCompare:@"REVOKED"] == NSOrderedSame) {
            return @(AWSIoTCertificateStatusRevoked);
        }
        if ([value caseInsensitiveCompare:@"PENDING_TRANSFER"] == NSOrderedSame) {
            return @(AWSIoTCertificateStatusPendingTransfer);
        }
        if ([value caseInsensitiveCompare:@"REGISTER_INACTIVE"] == NSOrderedSame) {
            return @(AWSIoTCertificateStatusRegisterInactive);
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
            case AWSIoTCertificateStatusRegisterInactive:
                return @"REGISTER_INACTIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)transferDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTTransferData class]];
}

@end

@implementation AWSIoTCloudwatchAlarmAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarmName" : @"alarmName",
             @"roleArn" : @"roleArn",
             @"stateReason" : @"stateReason",
             @"stateValue" : @"stateValue",
             };
}

@end

@implementation AWSIoTCloudwatchMetricAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricName" : @"metricName",
             @"metricNamespace" : @"metricNamespace",
             @"metricTimestamp" : @"metricTimestamp",
             @"metricUnit" : @"metricUnit",
             @"metricValue" : @"metricValue",
             @"roleArn" : @"roleArn",
             };
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

@implementation AWSIoTDeleteCACertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateId" : @"certificateId",
             };
}

@end

@implementation AWSIoTDeleteCACertificateResponse

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

@implementation AWSIoTDeleteRegistrationCodeRequest

@end

@implementation AWSIoTDeleteRegistrationCodeResponse

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

@implementation AWSIoTDescribeCACertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateId" : @"certificateId",
             };
}

@end

@implementation AWSIoTDescribeCACertificateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateDescription" : @"certificateDescription",
             };
}

+ (NSValueTransformer *)certificateDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTCACertificateDescription class]];
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

@implementation AWSIoTDisableTopicRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleName" : @"ruleName",
             };
}

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

@implementation AWSIoTElasticsearchAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoint" : @"endpoint",
             @"identifier" : @"id",
             @"index" : @"index",
             @"roleArn" : @"roleArn",
             @"types" : @"type",
             };
}

@end

@implementation AWSIoTEnableTopicRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleName" : @"ruleName",
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
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSIoTLogLevelDebug);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSIoTLogLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSIoTLogLevelError);
        }
        if ([value caseInsensitiveCompare:@"WARN"] == NSOrderedSame) {
            return @(AWSIoTLogLevelWarn);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
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

@implementation AWSIoTGetRegistrationCodeRequest

@end

@implementation AWSIoTGetRegistrationCodeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registrationCode" : @"registrationCode",
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
             @"ruleArn" : @"ruleArn",
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

@implementation AWSIoTListCACertificatesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ascendingOrder" : @"ascendingOrder",
             @"marker" : @"marker",
             @"pageSize" : @"pageSize",
             };
}

@end

@implementation AWSIoTListCACertificatesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificates" : @"certificates",
             @"nextMarker" : @"nextMarker",
             };
}

+ (NSValueTransformer *)certificatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTCACertificate class]];
}

@end

@implementation AWSIoTListCertificatesByCARequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ascendingOrder" : @"ascendingOrder",
             @"caCertificateId" : @"caCertificateId",
             @"marker" : @"marker",
             @"pageSize" : @"pageSize",
             };
}

@end

@implementation AWSIoTListCertificatesByCAResponse

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
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSIoTLogLevelDebug);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSIoTLogLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSIoTLogLevelError);
        }
        if ([value caseInsensitiveCompare:@"WARN"] == NSOrderedSame) {
            return @(AWSIoTLogLevelWarn);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSIoTRegisterCACertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"caCertificate" : @"caCertificate",
             @"setAsActive" : @"setAsActive",
             @"verificationCertificate" : @"verificationCertificate",
             };
}

@end

@implementation AWSIoTRegisterCACertificateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"certificateArn",
             @"certificateId" : @"certificateId",
             };
}

@end

@implementation AWSIoTRegisterCertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"caCertificatePem" : @"caCertificatePem",
             @"certificatePem" : @"certificatePem",
             @"setAsActive" : @"setAsActive",
             };
}

@end

@implementation AWSIoTRegisterCertificateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"certificateArn",
             @"certificateId" : @"certificateId",
             };
}

@end

@implementation AWSIoTRejectCertificateTransferRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateId" : @"certificateId",
             @"rejectReason" : @"rejectReason",
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
             @"messageFormat" : @"messageFormat",
             @"roleArn" : @"roleArn",
             @"targetArn" : @"targetArn",
             };
}

+ (NSValueTransformer *)messageFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RAW"] == NSOrderedSame) {
            return @(AWSIoTMessageFormatRAW);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSIoTMessageFormatJson);
        }
        return @(AWSIoTMessageFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTMessageFormatRAW:
                return @"RAW";
            case AWSIoTMessageFormatJson:
                return @"JSON";
            default:
                return nil;
        }
    }];
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
             @"awsIotSqlVersion" : @"awsIotSqlVersion",
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSIoTTopicRuleListItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAt" : @"createdAt",
             @"ruleArn" : @"ruleArn",
             @"ruleDisabled" : @"ruleDisabled",
             @"ruleName" : @"ruleName",
             @"topicPattern" : @"topicPattern",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSIoTTopicRulePayload

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actions" : @"actions",
             @"awsIotSqlVersion" : @"awsIotSqlVersion",
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
             @"transferMessage" : @"transferMessage",
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

@implementation AWSIoTTransferData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptDate" : @"acceptDate",
             @"rejectDate" : @"rejectDate",
             @"rejectReason" : @"rejectReason",
             @"transferDate" : @"transferDate",
             @"transferMessage" : @"transferMessage",
             };
}

+ (NSValueTransformer *)acceptDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)rejectDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)transferDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSIoTUpdateCACertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateId" : @"certificateId",
             @"latestStatus" : @"newStatus",
             };
}

+ (NSValueTransformer *)latestStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSIoTCACertificateStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSIoTCACertificateStatusInactive);
        }
        return @(AWSIoTCACertificateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTCACertificateStatusActive:
                return @"ACTIVE";
            case AWSIoTCACertificateStatusInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
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
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSIoTCertificateStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSIoTCertificateStatusInactive);
        }
        if ([value caseInsensitiveCompare:@"REVOKED"] == NSOrderedSame) {
            return @(AWSIoTCertificateStatusRevoked);
        }
        if ([value caseInsensitiveCompare:@"PENDING_TRANSFER"] == NSOrderedSame) {
            return @(AWSIoTCertificateStatusPendingTransfer);
        }
        if ([value caseInsensitiveCompare:@"REGISTER_INACTIVE"] == NSOrderedSame) {
            return @(AWSIoTCertificateStatusRegisterInactive);
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
            case AWSIoTCertificateStatusRegisterInactive:
                return @"REGISTER_INACTIVE";
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
