//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
             @"dynamoDBv2" : @"dynamoDBv2",
             @"elasticsearch" : @"elasticsearch",
             @"firehose" : @"firehose",
             @"iotAnalytics" : @"iotAnalytics",
             @"kinesis" : @"kinesis",
             @"lambda" : @"lambda",
             @"republish" : @"republish",
             @"s3" : @"s3",
             @"salesforce" : @"salesforce",
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

+ (NSValueTransformer *)dynamoDBv2JSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTDynamoDBv2Action class]];
}

+ (NSValueTransformer *)elasticsearchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTElasticsearchAction class]];
}

+ (NSValueTransformer *)firehoseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTFirehoseAction class]];
}

+ (NSValueTransformer *)iotAnalyticsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTIotAnalyticsAction class]];
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

+ (NSValueTransformer *)salesforceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTSalesforceAction class]];
}

+ (NSValueTransformer *)snsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTSnsAction class]];
}

+ (NSValueTransformer *)sqsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTSqsAction class]];
}

@end

@implementation AWSIoTAddThingToThingGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingArn" : @"thingArn",
             @"thingGroupArn" : @"thingGroupArn",
             @"thingGroupName" : @"thingGroupName",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTAddThingToThingGroupResponse

@end

@implementation AWSIoTAllowed

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policies" : @"policies",
             };
}

+ (NSValueTransformer *)policiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTPolicy class]];
}

@end

@implementation AWSIoTAssociateTargetsWithJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"comment",
             @"jobId" : @"jobId",
             @"targets" : @"targets",
             };
}

@end

@implementation AWSIoTAssociateTargetsWithJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"jobArn" : @"jobArn",
             @"jobId" : @"jobId",
             };
}

@end

@implementation AWSIoTAttachPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             @"target" : @"target",
             };
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
             @"merge" : @"merge",
             };
}

@end

@implementation AWSIoTAuthInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionType" : @"actionType",
             @"resources" : @"resources",
             };
}

+ (NSValueTransformer *)actionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUBLISH"] == NSOrderedSame) {
            return @(AWSIoTActionTypePublish);
        }
        if ([value caseInsensitiveCompare:@"SUBSCRIBE"] == NSOrderedSame) {
            return @(AWSIoTActionTypeSubscribe);
        }
        if ([value caseInsensitiveCompare:@"RECEIVE"] == NSOrderedSame) {
            return @(AWSIoTActionTypeReceive);
        }
        if ([value caseInsensitiveCompare:@"CONNECT"] == NSOrderedSame) {
            return @(AWSIoTActionTypeConnect);
        }
        return @(AWSIoTActionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTActionTypePublish:
                return @"PUBLISH";
            case AWSIoTActionTypeSubscribe:
                return @"SUBSCRIBE";
            case AWSIoTActionTypeReceive:
                return @"RECEIVE";
            case AWSIoTActionTypeConnect:
                return @"CONNECT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTAuthResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowed" : @"allowed",
             @"authDecision" : @"authDecision",
             @"authInfo" : @"authInfo",
             @"denied" : @"denied",
             @"missingContextValues" : @"missingContextValues",
             };
}

+ (NSValueTransformer *)allowedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAllowed class]];
}

+ (NSValueTransformer *)authDecisionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALLOWED"] == NSOrderedSame) {
            return @(AWSIoTAuthDecisionAllowed);
        }
        if ([value caseInsensitiveCompare:@"EXPLICIT_DENY"] == NSOrderedSame) {
            return @(AWSIoTAuthDecisionExplicitDeny);
        }
        if ([value caseInsensitiveCompare:@"IMPLICIT_DENY"] == NSOrderedSame) {
            return @(AWSIoTAuthDecisionImplicitDeny);
        }
        return @(AWSIoTAuthDecisionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAuthDecisionAllowed:
                return @"ALLOWED";
            case AWSIoTAuthDecisionExplicitDeny:
                return @"EXPLICIT_DENY";
            case AWSIoTAuthDecisionImplicitDeny:
                return @"IMPLICIT_DENY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)authInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAuthInfo class]];
}

+ (NSValueTransformer *)deniedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTDenied class]];
}

@end

@implementation AWSIoTAuthorizerDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerArn" : @"authorizerArn",
             @"authorizerFunctionArn" : @"authorizerFunctionArn",
             @"authorizerName" : @"authorizerName",
             @"creationDate" : @"creationDate",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"status" : @"status",
             @"tokenKeyName" : @"tokenKeyName",
             @"tokenSigningPublicKeys" : @"tokenSigningPublicKeys",
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
            return @(AWSIoTAuthorizerStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSIoTAuthorizerStatusInactive);
        }
        return @(AWSIoTAuthorizerStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAuthorizerStatusActive:
                return @"ACTIVE";
            case AWSIoTAuthorizerStatusInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTAuthorizerSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerArn" : @"authorizerArn",
             @"authorizerName" : @"authorizerName",
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
             @"autoRegistrationStatus" : @"autoRegistrationStatus",
             @"certificateArn" : @"certificateArn",
             @"certificateId" : @"certificateId",
             @"certificatePem" : @"certificatePem",
             @"creationDate" : @"creationDate",
             @"customerVersion" : @"customerVersion",
             @"generationId" : @"generationId",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"ownedBy" : @"ownedBy",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)autoRegistrationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLE"] == NSOrderedSame) {
            return @(AWSIoTAutoRegistrationStatusEnable);
        }
        if ([value caseInsensitiveCompare:@"DISABLE"] == NSOrderedSame) {
            return @(AWSIoTAutoRegistrationStatusDisable);
        }
        return @(AWSIoTAutoRegistrationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAutoRegistrationStatusEnable:
                return @"ENABLE";
            case AWSIoTAutoRegistrationStatusDisable:
                return @"DISABLE";
            default:
                return nil;
        }
    }];
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

@implementation AWSIoTCancelJobExecutionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expectedVersion" : @"expectedVersion",
             @"force" : @"force",
             @"jobId" : @"jobId",
             @"statusDetails" : @"statusDetails",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTCancelJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"comment",
             @"force" : @"force",
             @"jobId" : @"jobId",
             };
}

@end

@implementation AWSIoTCancelJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"jobArn" : @"jobArn",
             @"jobId" : @"jobId",
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
        if ([value caseInsensitiveCompare:@"PENDING_ACTIVATION"] == NSOrderedSame) {
            return @(AWSIoTCertificateStatusPendingActivation);
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
            case AWSIoTCertificateStatusPendingActivation:
                return @"PENDING_ACTIVATION";
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
             @"customerVersion" : @"customerVersion",
             @"generationId" : @"generationId",
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
        if ([value caseInsensitiveCompare:@"PENDING_ACTIVATION"] == NSOrderedSame) {
            return @(AWSIoTCertificateStatusPendingActivation);
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
            case AWSIoTCertificateStatusPendingActivation:
                return @"PENDING_ACTIVATION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)transferDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTTransferData class]];
}

@end

@implementation AWSIoTClearDefaultAuthorizerRequest

@end

@implementation AWSIoTClearDefaultAuthorizerResponse

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

@implementation AWSIoTCodeSigning

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsSignerJobId" : @"awsSignerJobId",
             @"customCodeSigning" : @"customCodeSigning",
             };
}

+ (NSValueTransformer *)customCodeSigningJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTCustomCodeSigning class]];
}

@end

@implementation AWSIoTCodeSigningCertificateChain

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateName" : @"certificateName",
             @"inlineDocument" : @"inlineDocument",
             @"stream" : @"stream",
             };
}

+ (NSValueTransformer *)streamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTStream class]];
}

@end

@implementation AWSIoTCodeSigningSignature

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inlineDocument" : @"inlineDocument",
             @"stream" : @"stream",
             };
}

+ (NSValueTransformer *)streamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTStream class]];
}

@end

@implementation AWSIoTConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSIoTCreateAuthorizerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerFunctionArn" : @"authorizerFunctionArn",
             @"authorizerName" : @"authorizerName",
             @"status" : @"status",
             @"tokenKeyName" : @"tokenKeyName",
             @"tokenSigningPublicKeys" : @"tokenSigningPublicKeys",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSIoTAuthorizerStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSIoTAuthorizerStatusInactive);
        }
        return @(AWSIoTAuthorizerStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAuthorizerStatusActive:
                return @"ACTIVE";
            case AWSIoTAuthorizerStatusInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTCreateAuthorizerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerArn" : @"authorizerArn",
             @"authorizerName" : @"authorizerName",
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

@implementation AWSIoTCreateJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"document" : @"document",
             @"documentParameters" : @"documentParameters",
             @"documentSource" : @"documentSource",
             @"jobExecutionsRolloutConfig" : @"jobExecutionsRolloutConfig",
             @"jobId" : @"jobId",
             @"presignedUrlConfig" : @"presignedUrlConfig",
             @"targetSelection" : @"targetSelection",
             @"targets" : @"targets",
             };
}

+ (NSValueTransformer *)jobExecutionsRolloutConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTJobExecutionsRolloutConfig class]];
}

+ (NSValueTransformer *)presignedUrlConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTPresignedUrlConfig class]];
}

+ (NSValueTransformer *)targetSelectionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONTINUOUS"] == NSOrderedSame) {
            return @(AWSIoTTargetSelectionContinuous);
        }
        if ([value caseInsensitiveCompare:@"SNAPSHOT"] == NSOrderedSame) {
            return @(AWSIoTTargetSelectionSnapshot);
        }
        return @(AWSIoTTargetSelectionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTTargetSelectionContinuous:
                return @"CONTINUOUS";
            case AWSIoTTargetSelectionSnapshot:
                return @"SNAPSHOT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTCreateJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"jobArn" : @"jobArn",
             @"jobId" : @"jobId",
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

@implementation AWSIoTCreateOTAUpdateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalParameters" : @"additionalParameters",
             @"detail" : @"description",
             @"files" : @"files",
             @"otaUpdateId" : @"otaUpdateId",
             @"roleArn" : @"roleArn",
             @"targetSelection" : @"targetSelection",
             @"targets" : @"targets",
             };
}

+ (NSValueTransformer *)filesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTOTAUpdateFile class]];
}

+ (NSValueTransformer *)targetSelectionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONTINUOUS"] == NSOrderedSame) {
            return @(AWSIoTTargetSelectionContinuous);
        }
        if ([value caseInsensitiveCompare:@"SNAPSHOT"] == NSOrderedSame) {
            return @(AWSIoTTargetSelectionSnapshot);
        }
        return @(AWSIoTTargetSelectionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTTargetSelectionContinuous:
                return @"CONTINUOUS";
            case AWSIoTTargetSelectionSnapshot:
                return @"SNAPSHOT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTCreateOTAUpdateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsIotJobArn" : @"awsIotJobArn",
             @"awsIotJobId" : @"awsIotJobId",
             @"otaUpdateArn" : @"otaUpdateArn",
             @"otaUpdateId" : @"otaUpdateId",
             @"otaUpdateStatus" : @"otaUpdateStatus",
             };
}

+ (NSValueTransformer *)otaUpdateStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE_PENDING"] == NSOrderedSame) {
            return @(AWSIoTOTAUpdateStatusCreatePending);
        }
        if ([value caseInsensitiveCompare:@"CREATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTOTAUpdateStatusCreateInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATE_COMPLETE"] == NSOrderedSame) {
            return @(AWSIoTOTAUpdateStatusCreateComplete);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSIoTOTAUpdateStatusCreateFailed);
        }
        return @(AWSIoTOTAUpdateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTOTAUpdateStatusCreatePending:
                return @"CREATE_PENDING";
            case AWSIoTOTAUpdateStatusCreateInProgress:
                return @"CREATE_IN_PROGRESS";
            case AWSIoTOTAUpdateStatusCreateComplete:
                return @"CREATE_COMPLETE";
            case AWSIoTOTAUpdateStatusCreateFailed:
                return @"CREATE_FAILED";
            default:
                return nil;
        }
    }];
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

@implementation AWSIoTCreateRoleAliasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"credentialDurationSeconds" : @"credentialDurationSeconds",
             @"roleAlias" : @"roleAlias",
             @"roleArn" : @"roleArn",
             };
}

@end

@implementation AWSIoTCreateRoleAliasResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleAlias" : @"roleAlias",
             @"roleAliasArn" : @"roleAliasArn",
             };
}

@end

@implementation AWSIoTCreateStreamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"files" : @"files",
             @"roleArn" : @"roleArn",
             @"streamId" : @"streamId",
             };
}

+ (NSValueTransformer *)filesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTStreamFile class]];
}

@end

@implementation AWSIoTCreateStreamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"streamArn" : @"streamArn",
             @"streamId" : @"streamId",
             @"streamVersion" : @"streamVersion",
             };
}

@end

@implementation AWSIoTCreateThingGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parentGroupName" : @"parentGroupName",
             @"thingGroupName" : @"thingGroupName",
             @"thingGroupProperties" : @"thingGroupProperties",
             };
}

+ (NSValueTransformer *)thingGroupPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTThingGroupProperties class]];
}

@end

@implementation AWSIoTCreateThingGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingGroupArn" : @"thingGroupArn",
             @"thingGroupId" : @"thingGroupId",
             @"thingGroupName" : @"thingGroupName",
             };
}

@end

@implementation AWSIoTCreateThingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributePayload" : @"attributePayload",
             @"thingName" : @"thingName",
             @"thingTypeName" : @"thingTypeName",
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
             @"thingId" : @"thingId",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTCreateThingTypeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingTypeName" : @"thingTypeName",
             @"thingTypeProperties" : @"thingTypeProperties",
             };
}

+ (NSValueTransformer *)thingTypePropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTThingTypeProperties class]];
}

@end

@implementation AWSIoTCreateThingTypeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingTypeArn" : @"thingTypeArn",
             @"thingTypeId" : @"thingTypeId",
             @"thingTypeName" : @"thingTypeName",
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

@implementation AWSIoTCustomCodeSigning

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateChain" : @"certificateChain",
             @"hashAlgorithm" : @"hashAlgorithm",
             @"signature" : @"signature",
             @"signatureAlgorithm" : @"signatureAlgorithm",
             };
}

+ (NSValueTransformer *)certificateChainJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTCodeSigningCertificateChain class]];
}

+ (NSValueTransformer *)signatureJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTCodeSigningSignature class]];
}

@end

@implementation AWSIoTDeleteAuthorizerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerName" : @"authorizerName",
             };
}

@end

@implementation AWSIoTDeleteAuthorizerResponse

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
             @"forceDelete" : @"forceDelete",
             };
}

@end

@implementation AWSIoTDeleteJobExecutionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"executionNumber" : @"executionNumber",
             @"force" : @"force",
             @"jobId" : @"jobId",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTDeleteJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"force" : @"force",
             @"jobId" : @"jobId",
             };
}

@end

@implementation AWSIoTDeleteOTAUpdateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"otaUpdateId" : @"otaUpdateId",
             };
}

@end

@implementation AWSIoTDeleteOTAUpdateResponse

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

@implementation AWSIoTDeleteRoleAliasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleAlias" : @"roleAlias",
             };
}

@end

@implementation AWSIoTDeleteRoleAliasResponse

@end

@implementation AWSIoTDeleteStreamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamId" : @"streamId",
             };
}

@end

@implementation AWSIoTDeleteStreamResponse

@end

@implementation AWSIoTDeleteThingGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expectedVersion" : @"expectedVersion",
             @"thingGroupName" : @"thingGroupName",
             };
}

@end

@implementation AWSIoTDeleteThingGroupResponse

@end

@implementation AWSIoTDeleteThingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expectedVersion" : @"expectedVersion",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTDeleteThingResponse

@end

@implementation AWSIoTDeleteThingTypeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingTypeName" : @"thingTypeName",
             };
}

@end

@implementation AWSIoTDeleteThingTypeResponse

@end

@implementation AWSIoTDeleteTopicRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleName" : @"ruleName",
             };
}

@end

@implementation AWSIoTDeleteV2LoggingLevelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetName" : @"targetName",
             @"targetType" : @"targetType",
             };
}

+ (NSValueTransformer *)targetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSIoTLogTargetTypeDefault);
        }
        if ([value caseInsensitiveCompare:@"THING_GROUP"] == NSOrderedSame) {
            return @(AWSIoTLogTargetTypeThingGroup);
        }
        return @(AWSIoTLogTargetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTLogTargetTypeDefault:
                return @"DEFAULT";
            case AWSIoTLogTargetTypeThingGroup:
                return @"THING_GROUP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTDenied

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"explicitDeny" : @"explicitDeny",
             @"implicitDeny" : @"implicitDeny",
             };
}

+ (NSValueTransformer *)explicitDenyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTExplicitDeny class]];
}

+ (NSValueTransformer *)implicitDenyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTImplicitDeny class]];
}

@end

@implementation AWSIoTDeprecateThingTypeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingTypeName" : @"thingTypeName",
             @"undoDeprecate" : @"undoDeprecate",
             };
}

@end

@implementation AWSIoTDeprecateThingTypeResponse

@end

@implementation AWSIoTDescribeAuthorizerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerName" : @"authorizerName",
             };
}

@end

@implementation AWSIoTDescribeAuthorizerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerDescription" : @"authorizerDescription",
             };
}

+ (NSValueTransformer *)authorizerDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAuthorizerDescription class]];
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
             @"registrationConfig" : @"registrationConfig",
             };
}

+ (NSValueTransformer *)certificateDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTCACertificateDescription class]];
}

+ (NSValueTransformer *)registrationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTRegistrationConfig class]];
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

@implementation AWSIoTDescribeDefaultAuthorizerRequest

@end

@implementation AWSIoTDescribeDefaultAuthorizerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerDescription" : @"authorizerDescription",
             };
}

+ (NSValueTransformer *)authorizerDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAuthorizerDescription class]];
}

@end

@implementation AWSIoTDescribeEndpointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointType" : @"endpointType",
             };
}

@end

@implementation AWSIoTDescribeEndpointResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointAddress" : @"endpointAddress",
             };
}

@end

@implementation AWSIoTDescribeEventConfigurationsRequest

@end

@implementation AWSIoTDescribeEventConfigurationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"creationDate",
             @"eventConfigurations" : @"eventConfigurations",
             @"lastModifiedDate" : @"lastModifiedDate",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)eventConfigurationsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSIoTConfiguration class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)lastModifiedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSIoTDescribeIndexRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"indexName",
             };
}

@end

@implementation AWSIoTDescribeIndexResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"indexName",
             @"indexStatus" : @"indexStatus",
             @"schema" : @"schema",
             };
}

+ (NSValueTransformer *)indexStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSIoTIndexStatusActive);
        }
        if ([value caseInsensitiveCompare:@"BUILDING"] == NSOrderedSame) {
            return @(AWSIoTIndexStatusBuilding);
        }
        if ([value caseInsensitiveCompare:@"REBUILDING"] == NSOrderedSame) {
            return @(AWSIoTIndexStatusRebuilding);
        }
        return @(AWSIoTIndexStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTIndexStatusActive:
                return @"ACTIVE";
            case AWSIoTIndexStatusBuilding:
                return @"BUILDING";
            case AWSIoTIndexStatusRebuilding:
                return @"REBUILDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTDescribeJobExecutionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"executionNumber" : @"executionNumber",
             @"jobId" : @"jobId",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTDescribeJobExecutionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"execution" : @"execution",
             };
}

+ (NSValueTransformer *)executionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTJobExecution class]];
}

@end

@implementation AWSIoTDescribeJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"jobId",
             };
}

@end

@implementation AWSIoTDescribeJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentSource" : @"documentSource",
             @"job" : @"job",
             };
}

+ (NSValueTransformer *)jobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTJob class]];
}

@end

@implementation AWSIoTDescribeRoleAliasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleAlias" : @"roleAlias",
             };
}

@end

@implementation AWSIoTDescribeRoleAliasResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleAliasDescription" : @"roleAliasDescription",
             };
}

+ (NSValueTransformer *)roleAliasDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTRoleAliasDescription class]];
}

@end

@implementation AWSIoTDescribeStreamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamId" : @"streamId",
             };
}

@end

@implementation AWSIoTDescribeStreamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamInfo" : @"streamInfo",
             };
}

+ (NSValueTransformer *)streamInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTStreamInfo class]];
}

@end

@implementation AWSIoTDescribeThingGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingGroupName" : @"thingGroupName",
             };
}

@end

@implementation AWSIoTDescribeThingGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingGroupArn" : @"thingGroupArn",
             @"thingGroupId" : @"thingGroupId",
             @"thingGroupMetadata" : @"thingGroupMetadata",
             @"thingGroupName" : @"thingGroupName",
             @"thingGroupProperties" : @"thingGroupProperties",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)thingGroupMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTThingGroupMetadata class]];
}

+ (NSValueTransformer *)thingGroupPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTThingGroupProperties class]];
}

@end

@implementation AWSIoTDescribeThingRegistrationTaskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSIoTDescribeThingRegistrationTaskResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"creationDate",
             @"failureCount" : @"failureCount",
             @"inputFileBucket" : @"inputFileBucket",
             @"inputFileKey" : @"inputFileKey",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"message" : @"message",
             @"percentageProgress" : @"percentageProgress",
             @"roleArn" : @"roleArn",
             @"status" : @"status",
             @"successCount" : @"successCount",
             @"taskId" : @"taskId",
             @"templateBody" : @"templateBody",
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
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSIoTStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSIoTStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSIoTStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSIoTStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Cancelling"] == NSOrderedSame) {
            return @(AWSIoTStatusCancelling);
        }
        return @(AWSIoTStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTStatusInProgress:
                return @"InProgress";
            case AWSIoTStatusCompleted:
                return @"Completed";
            case AWSIoTStatusFailed:
                return @"Failed";
            case AWSIoTStatusCancelled:
                return @"Cancelled";
            case AWSIoTStatusCancelling:
                return @"Cancelling";
            default:
                return nil;
        }
    }];
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
             @"thingArn" : @"thingArn",
             @"thingId" : @"thingId",
             @"thingName" : @"thingName",
             @"thingTypeName" : @"thingTypeName",
             @"version" : @"version",
             };
}

@end

@implementation AWSIoTDescribeThingTypeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingTypeName" : @"thingTypeName",
             };
}

@end

@implementation AWSIoTDescribeThingTypeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingTypeArn" : @"thingTypeArn",
             @"thingTypeId" : @"thingTypeId",
             @"thingTypeMetadata" : @"thingTypeMetadata",
             @"thingTypeName" : @"thingTypeName",
             @"thingTypeProperties" : @"thingTypeProperties",
             };
}

+ (NSValueTransformer *)thingTypeMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTThingTypeMetadata class]];
}

+ (NSValueTransformer *)thingTypePropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTThingTypeProperties class]];
}

@end

@implementation AWSIoTDetachPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             @"target" : @"target",
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
             @"hashKeyType" : @"hashKeyType",
             @"hashKeyValue" : @"hashKeyValue",
             @"operation" : @"operation",
             @"payloadField" : @"payloadField",
             @"rangeKeyField" : @"rangeKeyField",
             @"rangeKeyType" : @"rangeKeyType",
             @"rangeKeyValue" : @"rangeKeyValue",
             @"roleArn" : @"roleArn",
             @"tableName" : @"tableName",
             };
}

+ (NSValueTransformer *)hashKeyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STRING"] == NSOrderedSame) {
            return @(AWSIoTDynamoKeyTypeString);
        }
        if ([value caseInsensitiveCompare:@"NUMBER"] == NSOrderedSame) {
            return @(AWSIoTDynamoKeyTypeNumber);
        }
        return @(AWSIoTDynamoKeyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTDynamoKeyTypeString:
                return @"STRING";
            case AWSIoTDynamoKeyTypeNumber:
                return @"NUMBER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rangeKeyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STRING"] == NSOrderedSame) {
            return @(AWSIoTDynamoKeyTypeString);
        }
        if ([value caseInsensitiveCompare:@"NUMBER"] == NSOrderedSame) {
            return @(AWSIoTDynamoKeyTypeNumber);
        }
        return @(AWSIoTDynamoKeyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTDynamoKeyTypeString:
                return @"STRING";
            case AWSIoTDynamoKeyTypeNumber:
                return @"NUMBER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTDynamoDBv2Action

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"putItem" : @"putItem",
             @"roleArn" : @"roleArn",
             };
}

+ (NSValueTransformer *)putItemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTPutItemInput class]];
}

@end

@implementation AWSIoTEffectivePolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyArn" : @"policyArn",
             @"policyDocument" : @"policyDocument",
             @"policyName" : @"policyName",
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

@implementation AWSIoTErrorInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"code",
             @"message" : @"message",
             };
}

@end

@implementation AWSIoTExplicitDeny

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policies" : @"policies",
             };
}

+ (NSValueTransformer *)policiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTPolicy class]];
}

@end

@implementation AWSIoTFirehoseAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamName" : @"deliveryStreamName",
             @"roleArn" : @"roleArn",
             @"separator" : @"separator",
             };
}

@end

@implementation AWSIoTGetEffectivePoliciesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cognitoIdentityPoolId" : @"cognitoIdentityPoolId",
             @"principal" : @"principal",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTGetEffectivePoliciesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"effectivePolicies" : @"effectivePolicies",
             };
}

+ (NSValueTransformer *)effectivePoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTEffectivePolicy class]];
}

@end

@implementation AWSIoTGetIndexingConfigurationRequest

@end

@implementation AWSIoTGetIndexingConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingIndexingConfiguration" : @"thingIndexingConfiguration",
             };
}

+ (NSValueTransformer *)thingIndexingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTThingIndexingConfiguration class]];
}

@end

@implementation AWSIoTGetJobDocumentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"jobId",
             };
}

@end

@implementation AWSIoTGetJobDocumentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"document" : @"document",
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

@implementation AWSIoTGetOTAUpdateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"otaUpdateId" : @"otaUpdateId",
             };
}

@end

@implementation AWSIoTGetOTAUpdateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"otaUpdateInfo" : @"otaUpdateInfo",
             };
}

+ (NSValueTransformer *)otaUpdateInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTOTAUpdateInfo class]];
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
             @"creationDate" : @"creationDate",
             @"defaultVersionId" : @"defaultVersionId",
             @"generationId" : @"generationId",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"policyArn" : @"policyArn",
             @"policyDocument" : @"policyDocument",
             @"policyName" : @"policyName",
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
             @"creationDate" : @"creationDate",
             @"generationId" : @"generationId",
             @"isDefaultVersion" : @"isDefaultVersion",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"policyArn" : @"policyArn",
             @"policyDocument" : @"policyDocument",
             @"policyName" : @"policyName",
             @"policyVersionId" : @"policyVersionId",
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

@implementation AWSIoTGetV2LoggingOptionsRequest

@end

@implementation AWSIoTGetV2LoggingOptionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultLogLevel" : @"defaultLogLevel",
             @"disableAllLogs" : @"disableAllLogs",
             @"roleArn" : @"roleArn",
             };
}

+ (NSValueTransformer *)defaultLogLevelJSONTransformer {
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

@implementation AWSIoTGroupNameAndArn

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupArn" : @"groupArn",
             @"groupName" : @"groupName",
             };
}

@end

@implementation AWSIoTImplicitDeny

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policies" : @"policies",
             };
}

+ (NSValueTransformer *)policiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTPolicy class]];
}

@end

@implementation AWSIoTIotAnalyticsAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"channelArn",
             @"channelName" : @"channelName",
             @"roleArn" : @"roleArn",
             };
}

@end

@implementation AWSIoTJob

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"comment",
             @"completedAt" : @"completedAt",
             @"createdAt" : @"createdAt",
             @"detail" : @"description",
             @"documentParameters" : @"documentParameters",
             @"forceCanceled" : @"forceCanceled",
             @"jobArn" : @"jobArn",
             @"jobExecutionsRolloutConfig" : @"jobExecutionsRolloutConfig",
             @"jobId" : @"jobId",
             @"jobProcessDetails" : @"jobProcessDetails",
             @"lastUpdatedAt" : @"lastUpdatedAt",
             @"presignedUrlConfig" : @"presignedUrlConfig",
             @"status" : @"status",
             @"targetSelection" : @"targetSelection",
             @"targets" : @"targets",
             };
}

+ (NSValueTransformer *)completedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)jobExecutionsRolloutConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTJobExecutionsRolloutConfig class]];
}

+ (NSValueTransformer *)jobProcessDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTJobProcessDetails class]];
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)presignedUrlConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTPresignedUrlConfig class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSIoTJobStatusCanceled);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSIoTJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"DELETION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTJobStatusDeletionInProgress);
        }
        return @(AWSIoTJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSIoTJobStatusCanceled:
                return @"CANCELED";
            case AWSIoTJobStatusCompleted:
                return @"COMPLETED";
            case AWSIoTJobStatusDeletionInProgress:
                return @"DELETION_IN_PROGRESS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetSelectionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONTINUOUS"] == NSOrderedSame) {
            return @(AWSIoTTargetSelectionContinuous);
        }
        if ([value caseInsensitiveCompare:@"SNAPSHOT"] == NSOrderedSame) {
            return @(AWSIoTTargetSelectionSnapshot);
        }
        return @(AWSIoTTargetSelectionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTTargetSelectionContinuous:
                return @"CONTINUOUS";
            case AWSIoTTargetSelectionSnapshot:
                return @"SNAPSHOT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTJobExecution

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"executionNumber" : @"executionNumber",
             @"forceCanceled" : @"forceCanceled",
             @"jobId" : @"jobId",
             @"lastUpdatedAt" : @"lastUpdatedAt",
             @"queuedAt" : @"queuedAt",
             @"startedAt" : @"startedAt",
             @"status" : @"status",
             @"statusDetails" : @"statusDetails",
             @"thingArn" : @"thingArn",
             @"versionNumber" : @"versionNumber",
             };
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)queuedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"QUEUED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusQueued);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"REJECTED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusRejected);
        }
        if ([value caseInsensitiveCompare:@"REMOVED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusRemoved);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusCanceled);
        }
        return @(AWSIoTJobExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTJobExecutionStatusQueued:
                return @"QUEUED";
            case AWSIoTJobExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSIoTJobExecutionStatusSucceeded:
                return @"SUCCEEDED";
            case AWSIoTJobExecutionStatusFailed:
                return @"FAILED";
            case AWSIoTJobExecutionStatusRejected:
                return @"REJECTED";
            case AWSIoTJobExecutionStatusRemoved:
                return @"REMOVED";
            case AWSIoTJobExecutionStatusCanceled:
                return @"CANCELED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTJobExecutionStatusDetails class]];
}

@end

@implementation AWSIoTJobExecutionStatusDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detailsMap" : @"detailsMap",
             };
}

@end

@implementation AWSIoTJobExecutionSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"executionNumber" : @"executionNumber",
             @"lastUpdatedAt" : @"lastUpdatedAt",
             @"queuedAt" : @"queuedAt",
             @"startedAt" : @"startedAt",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)queuedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"QUEUED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusQueued);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"REJECTED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusRejected);
        }
        if ([value caseInsensitiveCompare:@"REMOVED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusRemoved);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusCanceled);
        }
        return @(AWSIoTJobExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTJobExecutionStatusQueued:
                return @"QUEUED";
            case AWSIoTJobExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSIoTJobExecutionStatusSucceeded:
                return @"SUCCEEDED";
            case AWSIoTJobExecutionStatusFailed:
                return @"FAILED";
            case AWSIoTJobExecutionStatusRejected:
                return @"REJECTED";
            case AWSIoTJobExecutionStatusRemoved:
                return @"REMOVED";
            case AWSIoTJobExecutionStatusCanceled:
                return @"CANCELED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTJobExecutionSummaryForJob

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobExecutionSummary" : @"jobExecutionSummary",
             @"thingArn" : @"thingArn",
             };
}

+ (NSValueTransformer *)jobExecutionSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTJobExecutionSummary class]];
}

@end

@implementation AWSIoTJobExecutionSummaryForThing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobExecutionSummary" : @"jobExecutionSummary",
             @"jobId" : @"jobId",
             };
}

+ (NSValueTransformer *)jobExecutionSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTJobExecutionSummary class]];
}

@end

@implementation AWSIoTJobExecutionsRolloutConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maximumPerMinute" : @"maximumPerMinute",
             };
}

@end

@implementation AWSIoTJobProcessDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"numberOfCanceledThings" : @"numberOfCanceledThings",
             @"numberOfFailedThings" : @"numberOfFailedThings",
             @"numberOfInProgressThings" : @"numberOfInProgressThings",
             @"numberOfQueuedThings" : @"numberOfQueuedThings",
             @"numberOfRejectedThings" : @"numberOfRejectedThings",
             @"numberOfRemovedThings" : @"numberOfRemovedThings",
             @"numberOfSucceededThings" : @"numberOfSucceededThings",
             @"processingTargets" : @"processingTargets",
             };
}

@end

@implementation AWSIoTJobSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completedAt" : @"completedAt",
             @"createdAt" : @"createdAt",
             @"jobArn" : @"jobArn",
             @"jobId" : @"jobId",
             @"lastUpdatedAt" : @"lastUpdatedAt",
             @"status" : @"status",
             @"targetSelection" : @"targetSelection",
             @"thingGroupId" : @"thingGroupId",
             };
}

+ (NSValueTransformer *)completedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSIoTJobStatusCanceled);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSIoTJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"DELETION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTJobStatusDeletionInProgress);
        }
        return @(AWSIoTJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSIoTJobStatusCanceled:
                return @"CANCELED";
            case AWSIoTJobStatusCompleted:
                return @"COMPLETED";
            case AWSIoTJobStatusDeletionInProgress:
                return @"DELETION_IN_PROGRESS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetSelectionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONTINUOUS"] == NSOrderedSame) {
            return @(AWSIoTTargetSelectionContinuous);
        }
        if ([value caseInsensitiveCompare:@"SNAPSHOT"] == NSOrderedSame) {
            return @(AWSIoTTargetSelectionSnapshot);
        }
        return @(AWSIoTTargetSelectionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTTargetSelectionContinuous:
                return @"CONTINUOUS";
            case AWSIoTTargetSelectionSnapshot:
                return @"SNAPSHOT";
            default:
                return nil;
        }
    }];
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

@implementation AWSIoTListAttachedPoliciesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"marker",
             @"pageSize" : @"pageSize",
             @"recursive" : @"recursive",
             @"target" : @"target",
             };
}

@end

@implementation AWSIoTListAttachedPoliciesResponse

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

@implementation AWSIoTListAuthorizersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ascendingOrder" : @"ascendingOrder",
             @"marker" : @"marker",
             @"pageSize" : @"pageSize",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSIoTAuthorizerStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSIoTAuthorizerStatusInactive);
        }
        return @(AWSIoTAuthorizerStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAuthorizerStatusActive:
                return @"ACTIVE";
            case AWSIoTAuthorizerStatusInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTListAuthorizersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizers" : @"authorizers",
             @"nextMarker" : @"nextMarker",
             };
}

+ (NSValueTransformer *)authorizersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTAuthorizerSummary class]];
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

@implementation AWSIoTListIndicesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIoTListIndicesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexNames" : @"indexNames",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIoTListJobExecutionsForJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"jobId",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"QUEUED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusQueued);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"REJECTED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusRejected);
        }
        if ([value caseInsensitiveCompare:@"REMOVED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusRemoved);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusCanceled);
        }
        return @(AWSIoTJobExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTJobExecutionStatusQueued:
                return @"QUEUED";
            case AWSIoTJobExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSIoTJobExecutionStatusSucceeded:
                return @"SUCCEEDED";
            case AWSIoTJobExecutionStatusFailed:
                return @"FAILED";
            case AWSIoTJobExecutionStatusRejected:
                return @"REJECTED";
            case AWSIoTJobExecutionStatusRemoved:
                return @"REMOVED";
            case AWSIoTJobExecutionStatusCanceled:
                return @"CANCELED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTListJobExecutionsForJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"executionSummaries" : @"executionSummaries",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)executionSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTJobExecutionSummaryForJob class]];
}

@end

@implementation AWSIoTListJobExecutionsForThingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"status" : @"status",
             @"thingName" : @"thingName",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"QUEUED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusQueued);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"REJECTED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusRejected);
        }
        if ([value caseInsensitiveCompare:@"REMOVED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusRemoved);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusCanceled);
        }
        return @(AWSIoTJobExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTJobExecutionStatusQueued:
                return @"QUEUED";
            case AWSIoTJobExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSIoTJobExecutionStatusSucceeded:
                return @"SUCCEEDED";
            case AWSIoTJobExecutionStatusFailed:
                return @"FAILED";
            case AWSIoTJobExecutionStatusRejected:
                return @"REJECTED";
            case AWSIoTJobExecutionStatusRemoved:
                return @"REMOVED";
            case AWSIoTJobExecutionStatusCanceled:
                return @"CANCELED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTListJobExecutionsForThingResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"executionSummaries" : @"executionSummaries",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)executionSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTJobExecutionSummaryForThing class]];
}

@end

@implementation AWSIoTListJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"status" : @"status",
             @"targetSelection" : @"targetSelection",
             @"thingGroupId" : @"thingGroupId",
             @"thingGroupName" : @"thingGroupName",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSIoTJobStatusCanceled);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSIoTJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"DELETION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTJobStatusDeletionInProgress);
        }
        return @(AWSIoTJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSIoTJobStatusCanceled:
                return @"CANCELED";
            case AWSIoTJobStatusCompleted:
                return @"COMPLETED";
            case AWSIoTJobStatusDeletionInProgress:
                return @"DELETION_IN_PROGRESS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetSelectionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONTINUOUS"] == NSOrderedSame) {
            return @(AWSIoTTargetSelectionContinuous);
        }
        if ([value caseInsensitiveCompare:@"SNAPSHOT"] == NSOrderedSame) {
            return @(AWSIoTTargetSelectionSnapshot);
        }
        return @(AWSIoTTargetSelectionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTTargetSelectionContinuous:
                return @"CONTINUOUS";
            case AWSIoTTargetSelectionSnapshot:
                return @"SNAPSHOT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTListJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobs" : @"jobs",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)jobsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTJobSummary class]];
}

@end

@implementation AWSIoTListOTAUpdatesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"otaUpdateStatus" : @"otaUpdateStatus",
             };
}

+ (NSValueTransformer *)otaUpdateStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE_PENDING"] == NSOrderedSame) {
            return @(AWSIoTOTAUpdateStatusCreatePending);
        }
        if ([value caseInsensitiveCompare:@"CREATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTOTAUpdateStatusCreateInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATE_COMPLETE"] == NSOrderedSame) {
            return @(AWSIoTOTAUpdateStatusCreateComplete);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSIoTOTAUpdateStatusCreateFailed);
        }
        return @(AWSIoTOTAUpdateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTOTAUpdateStatusCreatePending:
                return @"CREATE_PENDING";
            case AWSIoTOTAUpdateStatusCreateInProgress:
                return @"CREATE_IN_PROGRESS";
            case AWSIoTOTAUpdateStatusCreateComplete:
                return @"CREATE_COMPLETE";
            case AWSIoTOTAUpdateStatusCreateFailed:
                return @"CREATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTListOTAUpdatesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"otaUpdates" : @"otaUpdates",
             };
}

+ (NSValueTransformer *)otaUpdatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTOTAUpdateSummary class]];
}

@end

@implementation AWSIoTListOutgoingCertificatesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ascendingOrder" : @"ascendingOrder",
             @"marker" : @"marker",
             @"pageSize" : @"pageSize",
             };
}

@end

@implementation AWSIoTListOutgoingCertificatesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"nextMarker",
             @"outgoingCertificates" : @"outgoingCertificates",
             };
}

+ (NSValueTransformer *)outgoingCertificatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTOutgoingCertificate class]];
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

@implementation AWSIoTListPolicyPrincipalsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ascendingOrder" : @"ascendingOrder",
             @"marker" : @"marker",
             @"pageSize" : @"pageSize",
             @"policyName" : @"policyName",
             };
}

@end

@implementation AWSIoTListPolicyPrincipalsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"nextMarker",
             @"principals" : @"principals",
             };
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

@implementation AWSIoTListRoleAliasesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ascendingOrder" : @"ascendingOrder",
             @"marker" : @"marker",
             @"pageSize" : @"pageSize",
             };
}

@end

@implementation AWSIoTListRoleAliasesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"nextMarker",
             @"roleAliases" : @"roleAliases",
             };
}

@end

@implementation AWSIoTListStreamsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ascendingOrder" : @"ascendingOrder",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIoTListStreamsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"streams" : @"streams",
             };
}

+ (NSValueTransformer *)streamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTStreamSummary class]];
}

@end

@implementation AWSIoTListTargetsForPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"marker",
             @"pageSize" : @"pageSize",
             @"policyName" : @"policyName",
             };
}

@end

@implementation AWSIoTListTargetsForPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"nextMarker",
             @"targets" : @"targets",
             };
}

@end

@implementation AWSIoTListThingGroupsForThingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTListThingGroupsForThingResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"thingGroups" : @"thingGroups",
             };
}

+ (NSValueTransformer *)thingGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTGroupNameAndArn class]];
}

@end

@implementation AWSIoTListThingGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"namePrefixFilter" : @"namePrefixFilter",
             @"nextToken" : @"nextToken",
             @"parentGroup" : @"parentGroup",
             @"recursive" : @"recursive",
             };
}

@end

@implementation AWSIoTListThingGroupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"thingGroups" : @"thingGroups",
             };
}

+ (NSValueTransformer *)thingGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTGroupNameAndArn class]];
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

@implementation AWSIoTListThingRegistrationTaskReportsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"reportType" : @"reportType",
             @"taskId" : @"taskId",
             };
}

+ (NSValueTransformer *)reportTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERRORS"] == NSOrderedSame) {
            return @(AWSIoTReportTypeErrors);
        }
        if ([value caseInsensitiveCompare:@"RESULTS"] == NSOrderedSame) {
            return @(AWSIoTReportTypeResults);
        }
        return @(AWSIoTReportTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTReportTypeErrors:
                return @"ERRORS";
            case AWSIoTReportTypeResults:
                return @"RESULTS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTListThingRegistrationTaskReportsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"reportType" : @"reportType",
             @"resourceLinks" : @"resourceLinks",
             };
}

+ (NSValueTransformer *)reportTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERRORS"] == NSOrderedSame) {
            return @(AWSIoTReportTypeErrors);
        }
        if ([value caseInsensitiveCompare:@"RESULTS"] == NSOrderedSame) {
            return @(AWSIoTReportTypeResults);
        }
        return @(AWSIoTReportTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTReportTypeErrors:
                return @"ERRORS";
            case AWSIoTReportTypeResults:
                return @"RESULTS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTListThingRegistrationTasksRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSIoTStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSIoTStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSIoTStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSIoTStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Cancelling"] == NSOrderedSame) {
            return @(AWSIoTStatusCancelling);
        }
        return @(AWSIoTStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTStatusInProgress:
                return @"InProgress";
            case AWSIoTStatusCompleted:
                return @"Completed";
            case AWSIoTStatusFailed:
                return @"Failed";
            case AWSIoTStatusCancelled:
                return @"Cancelled";
            case AWSIoTStatusCancelling:
                return @"Cancelling";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTListThingRegistrationTasksResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"taskIds" : @"taskIds",
             };
}

@end

@implementation AWSIoTListThingTypesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"thingTypeName" : @"thingTypeName",
             };
}

@end

@implementation AWSIoTListThingTypesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"thingTypes" : @"thingTypes",
             };
}

+ (NSValueTransformer *)thingTypesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTThingTypeDefinition class]];
}

@end

@implementation AWSIoTListThingsInThingGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"recursive" : @"recursive",
             @"thingGroupName" : @"thingGroupName",
             };
}

@end

@implementation AWSIoTListThingsInThingGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"things" : @"things",
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
             @"thingTypeName" : @"thingTypeName",
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

@implementation AWSIoTListV2LoggingLevelsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"targetType" : @"targetType",
             };
}

+ (NSValueTransformer *)targetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSIoTLogTargetTypeDefault);
        }
        if ([value caseInsensitiveCompare:@"THING_GROUP"] == NSOrderedSame) {
            return @(AWSIoTLogTargetTypeThingGroup);
        }
        return @(AWSIoTLogTargetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTLogTargetTypeDefault:
                return @"DEFAULT";
            case AWSIoTLogTargetTypeThingGroup:
                return @"THING_GROUP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTListV2LoggingLevelsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logTargetConfigurations" : @"logTargetConfigurations",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)logTargetConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTLogTargetConfiguration class]];
}

@end

@implementation AWSIoTLogTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetName" : @"targetName",
             @"targetType" : @"targetType",
             };
}

+ (NSValueTransformer *)targetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSIoTLogTargetTypeDefault);
        }
        if ([value caseInsensitiveCompare:@"THING_GROUP"] == NSOrderedSame) {
            return @(AWSIoTLogTargetTypeThingGroup);
        }
        return @(AWSIoTLogTargetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTLogTargetTypeDefault:
                return @"DEFAULT";
            case AWSIoTLogTargetTypeThingGroup:
                return @"THING_GROUP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTLogTargetConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logLevel" : @"logLevel",
             @"logTarget" : @"logTarget",
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

+ (NSValueTransformer *)logTargetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTLogTarget class]];
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

@implementation AWSIoTOTAUpdateFile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"attributes",
             @"codeSigning" : @"codeSigning",
             @"fileName" : @"fileName",
             @"fileSource" : @"fileSource",
             @"fileVersion" : @"fileVersion",
             };
}

+ (NSValueTransformer *)codeSigningJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTCodeSigning class]];
}

+ (NSValueTransformer *)fileSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTStream class]];
}

@end

@implementation AWSIoTOTAUpdateInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalParameters" : @"additionalParameters",
             @"awsIotJobArn" : @"awsIotJobArn",
             @"awsIotJobId" : @"awsIotJobId",
             @"creationDate" : @"creationDate",
             @"detail" : @"description",
             @"errorInfo" : @"errorInfo",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"otaUpdateArn" : @"otaUpdateArn",
             @"otaUpdateFiles" : @"otaUpdateFiles",
             @"otaUpdateId" : @"otaUpdateId",
             @"otaUpdateStatus" : @"otaUpdateStatus",
             @"targetSelection" : @"targetSelection",
             @"targets" : @"targets",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)errorInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTErrorInfo class]];
}

+ (NSValueTransformer *)lastModifiedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)otaUpdateFilesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTOTAUpdateFile class]];
}

+ (NSValueTransformer *)otaUpdateStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE_PENDING"] == NSOrderedSame) {
            return @(AWSIoTOTAUpdateStatusCreatePending);
        }
        if ([value caseInsensitiveCompare:@"CREATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTOTAUpdateStatusCreateInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATE_COMPLETE"] == NSOrderedSame) {
            return @(AWSIoTOTAUpdateStatusCreateComplete);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSIoTOTAUpdateStatusCreateFailed);
        }
        return @(AWSIoTOTAUpdateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTOTAUpdateStatusCreatePending:
                return @"CREATE_PENDING";
            case AWSIoTOTAUpdateStatusCreateInProgress:
                return @"CREATE_IN_PROGRESS";
            case AWSIoTOTAUpdateStatusCreateComplete:
                return @"CREATE_COMPLETE";
            case AWSIoTOTAUpdateStatusCreateFailed:
                return @"CREATE_FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetSelectionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONTINUOUS"] == NSOrderedSame) {
            return @(AWSIoTTargetSelectionContinuous);
        }
        if ([value caseInsensitiveCompare:@"SNAPSHOT"] == NSOrderedSame) {
            return @(AWSIoTTargetSelectionSnapshot);
        }
        return @(AWSIoTTargetSelectionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTTargetSelectionContinuous:
                return @"CONTINUOUS";
            case AWSIoTTargetSelectionSnapshot:
                return @"SNAPSHOT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTOTAUpdateSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"creationDate",
             @"otaUpdateArn" : @"otaUpdateArn",
             @"otaUpdateId" : @"otaUpdateId",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSIoTOutgoingCertificate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"certificateArn",
             @"certificateId" : @"certificateId",
             @"creationDate" : @"creationDate",
             @"transferDate" : @"transferDate",
             @"transferMessage" : @"transferMessage",
             @"transferredTo" : @"transferredTo",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
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

@implementation AWSIoTPresignedUrlConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expiresInSec" : @"expiresInSec",
             @"roleArn" : @"roleArn",
             };
}

@end

@implementation AWSIoTPutItemInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableName" : @"tableName",
             };
}

@end

@implementation AWSIoTRegisterCACertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowAutoRegistration" : @"allowAutoRegistration",
             @"caCertificate" : @"caCertificate",
             @"registrationConfig" : @"registrationConfig",
             @"setAsActive" : @"setAsActive",
             @"verificationCertificate" : @"verificationCertificate",
             };
}

+ (NSValueTransformer *)registrationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTRegistrationConfig class]];
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
             @"status" : @"status",
             };
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
        if ([value caseInsensitiveCompare:@"PENDING_ACTIVATION"] == NSOrderedSame) {
            return @(AWSIoTCertificateStatusPendingActivation);
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
            case AWSIoTCertificateStatusPendingActivation:
                return @"PENDING_ACTIVATION";
            default:
                return nil;
        }
    }];
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

@implementation AWSIoTRegisterThingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameters" : @"parameters",
             @"templateBody" : @"templateBody",
             };
}

@end

@implementation AWSIoTRegisterThingResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificatePem" : @"certificatePem",
             @"resourceArns" : @"resourceArns",
             };
}

@end

@implementation AWSIoTRegistrationConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"roleArn",
             @"templateBody" : @"templateBody",
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

@implementation AWSIoTRemoveThingFromThingGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingArn" : @"thingArn",
             @"thingGroupArn" : @"thingGroupArn",
             @"thingGroupName" : @"thingGroupName",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTRemoveThingFromThingGroupResponse

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

@implementation AWSIoTRoleAliasDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"creationDate",
             @"credentialDurationSeconds" : @"credentialDurationSeconds",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"owner" : @"owner",
             @"roleAlias" : @"roleAlias",
             @"roleAliasArn" : @"roleAliasArn",
             @"roleArn" : @"roleArn",
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

@end

@implementation AWSIoTS3Action

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketName" : @"bucketName",
             @"cannedAcl" : @"cannedAcl",
             @"key" : @"key",
             @"roleArn" : @"roleArn",
             };
}

+ (NSValueTransformer *)cannedAclJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"private"] == NSOrderedSame) {
            return @(AWSIoTCannedAccessControlListPrivate);
        }
        if ([value caseInsensitiveCompare:@"public-read"] == NSOrderedSame) {
            return @(AWSIoTCannedAccessControlListPublicRead);
        }
        if ([value caseInsensitiveCompare:@"public-read-write"] == NSOrderedSame) {
            return @(AWSIoTCannedAccessControlListPublicReadWrite);
        }
        if ([value caseInsensitiveCompare:@"aws-exec-read"] == NSOrderedSame) {
            return @(AWSIoTCannedAccessControlListAwsExecRead);
        }
        if ([value caseInsensitiveCompare:@"authenticated-read"] == NSOrderedSame) {
            return @(AWSIoTCannedAccessControlListAuthenticatedRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-read"] == NSOrderedSame) {
            return @(AWSIoTCannedAccessControlListBucketOwnerRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-full-control"] == NSOrderedSame) {
            return @(AWSIoTCannedAccessControlListBucketOwnerFullControl);
        }
        if ([value caseInsensitiveCompare:@"log-delivery-write"] == NSOrderedSame) {
            return @(AWSIoTCannedAccessControlListLogDeliveryWrite);
        }
        return @(AWSIoTCannedAccessControlListUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTCannedAccessControlListPrivate:
                return @"private";
            case AWSIoTCannedAccessControlListPublicRead:
                return @"public-read";
            case AWSIoTCannedAccessControlListPublicReadWrite:
                return @"public-read-write";
            case AWSIoTCannedAccessControlListAwsExecRead:
                return @"aws-exec-read";
            case AWSIoTCannedAccessControlListAuthenticatedRead:
                return @"authenticated-read";
            case AWSIoTCannedAccessControlListBucketOwnerRead:
                return @"bucket-owner-read";
            case AWSIoTCannedAccessControlListBucketOwnerFullControl:
                return @"bucket-owner-full-control";
            case AWSIoTCannedAccessControlListLogDeliveryWrite:
                return @"log-delivery-write";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTS3Location

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"bucket",
             @"key" : @"key",
             @"version" : @"version",
             };
}

@end

@implementation AWSIoTSalesforceAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"token" : @"token",
             @"url" : @"url",
             };
}

@end

@implementation AWSIoTSearchIndexRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"indexName",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"queryString" : @"queryString",
             @"queryVersion" : @"queryVersion",
             };
}

@end

@implementation AWSIoTSearchIndexResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"things" : @"things",
             };
}

+ (NSValueTransformer *)thingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTThingDocument class]];
}

@end

@implementation AWSIoTSetDefaultAuthorizerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerName" : @"authorizerName",
             };
}

@end

@implementation AWSIoTSetDefaultAuthorizerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerArn" : @"authorizerArn",
             @"authorizerName" : @"authorizerName",
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

@implementation AWSIoTSetV2LoggingLevelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logLevel" : @"logLevel",
             @"logTarget" : @"logTarget",
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

+ (NSValueTransformer *)logTargetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTLogTarget class]];
}

@end

@implementation AWSIoTSetV2LoggingOptionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultLogLevel" : @"defaultLogLevel",
             @"disableAllLogs" : @"disableAllLogs",
             @"roleArn" : @"roleArn",
             };
}

+ (NSValueTransformer *)defaultLogLevelJSONTransformer {
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

@implementation AWSIoTStartThingRegistrationTaskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputFileBucket" : @"inputFileBucket",
             @"inputFileKey" : @"inputFileKey",
             @"roleArn" : @"roleArn",
             @"templateBody" : @"templateBody",
             };
}

@end

@implementation AWSIoTStartThingRegistrationTaskResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSIoTStopThingRegistrationTaskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSIoTStopThingRegistrationTaskResponse

@end

@implementation AWSIoTStream

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileId" : @"fileId",
             @"streamId" : @"streamId",
             };
}

@end

@implementation AWSIoTStreamFile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileId" : @"fileId",
             @"s3Location" : @"s3Location",
             };
}

+ (NSValueTransformer *)s3LocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTS3Location class]];
}

@end

@implementation AWSIoTStreamInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAt" : @"createdAt",
             @"detail" : @"description",
             @"files" : @"files",
             @"lastUpdatedAt" : @"lastUpdatedAt",
             @"roleArn" : @"roleArn",
             @"streamArn" : @"streamArn",
             @"streamId" : @"streamId",
             @"streamVersion" : @"streamVersion",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)filesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTStreamFile class]];
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSIoTStreamSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"streamArn" : @"streamArn",
             @"streamId" : @"streamId",
             @"streamVersion" : @"streamVersion",
             };
}

@end

@implementation AWSIoTTestAuthorizationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authInfos" : @"authInfos",
             @"clientId" : @"clientId",
             @"cognitoIdentityPoolId" : @"cognitoIdentityPoolId",
             @"policyNamesToAdd" : @"policyNamesToAdd",
             @"policyNamesToSkip" : @"policyNamesToSkip",
             @"principal" : @"principal",
             };
}

+ (NSValueTransformer *)authInfosJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTAuthInfo class]];
}

@end

@implementation AWSIoTTestAuthorizationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authResults" : @"authResults",
             };
}

+ (NSValueTransformer *)authResultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTAuthResult class]];
}

@end

@implementation AWSIoTTestInvokeAuthorizerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerName" : @"authorizerName",
             @"token" : @"token",
             @"tokenSignature" : @"tokenSignature",
             };
}

@end

@implementation AWSIoTTestInvokeAuthorizerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"disconnectAfterInSeconds" : @"disconnectAfterInSeconds",
             @"isAuthenticated" : @"isAuthenticated",
             @"policyDocuments" : @"policyDocuments",
             @"principalId" : @"principalId",
             @"refreshAfterInSeconds" : @"refreshAfterInSeconds",
             };
}

@end

@implementation AWSIoTThingAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"attributes",
             @"thingArn" : @"thingArn",
             @"thingName" : @"thingName",
             @"thingTypeName" : @"thingTypeName",
             @"version" : @"version",
             };
}

@end

@implementation AWSIoTThingDocument

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"attributes",
             @"shadow" : @"shadow",
             @"thingGroupNames" : @"thingGroupNames",
             @"thingId" : @"thingId",
             @"thingName" : @"thingName",
             @"thingTypeName" : @"thingTypeName",
             };
}

@end

@implementation AWSIoTThingGroupMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"creationDate",
             @"parentGroupName" : @"parentGroupName",
             @"rootToParentThingGroups" : @"rootToParentThingGroups",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)rootToParentThingGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTGroupNameAndArn class]];
}

@end

@implementation AWSIoTThingGroupProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributePayload" : @"attributePayload",
             @"thingGroupDescription" : @"thingGroupDescription",
             };
}

+ (NSValueTransformer *)attributePayloadJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAttributePayload class]];
}

@end

@implementation AWSIoTThingIndexingConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingIndexingMode" : @"thingIndexingMode",
             };
}

+ (NSValueTransformer *)thingIndexingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSIoTThingIndexingModeOff);
        }
        if ([value caseInsensitiveCompare:@"REGISTRY"] == NSOrderedSame) {
            return @(AWSIoTThingIndexingModeRegistry);
        }
        if ([value caseInsensitiveCompare:@"REGISTRY_AND_SHADOW"] == NSOrderedSame) {
            return @(AWSIoTThingIndexingModeRegistryAndShadow);
        }
        return @(AWSIoTThingIndexingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTThingIndexingModeOff:
                return @"OFF";
            case AWSIoTThingIndexingModeRegistry:
                return @"REGISTRY";
            case AWSIoTThingIndexingModeRegistryAndShadow:
                return @"REGISTRY_AND_SHADOW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTThingTypeDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingTypeArn" : @"thingTypeArn",
             @"thingTypeMetadata" : @"thingTypeMetadata",
             @"thingTypeName" : @"thingTypeName",
             @"thingTypeProperties" : @"thingTypeProperties",
             };
}

+ (NSValueTransformer *)thingTypeMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTThingTypeMetadata class]];
}

+ (NSValueTransformer *)thingTypePropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTThingTypeProperties class]];
}

@end

@implementation AWSIoTThingTypeMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"creationDate",
             @"deprecated" : @"deprecated",
             @"deprecationDate" : @"deprecationDate",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)deprecationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSIoTThingTypeProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"searchableAttributes" : @"searchableAttributes",
             @"thingTypeDescription" : @"thingTypeDescription",
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
             @"errorAction" : @"errorAction",
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

+ (NSValueTransformer *)errorActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAction class]];
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
             @"errorAction" : @"errorAction",
             @"ruleDisabled" : @"ruleDisabled",
             @"sql" : @"sql",
             };
}

+ (NSValueTransformer *)actionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTAction class]];
}

+ (NSValueTransformer *)errorActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAction class]];
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

@implementation AWSIoTUpdateAuthorizerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerFunctionArn" : @"authorizerFunctionArn",
             @"authorizerName" : @"authorizerName",
             @"status" : @"status",
             @"tokenKeyName" : @"tokenKeyName",
             @"tokenSigningPublicKeys" : @"tokenSigningPublicKeys",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSIoTAuthorizerStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSIoTAuthorizerStatusInactive);
        }
        return @(AWSIoTAuthorizerStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAuthorizerStatusActive:
                return @"ACTIVE";
            case AWSIoTAuthorizerStatusInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTUpdateAuthorizerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerArn" : @"authorizerArn",
             @"authorizerName" : @"authorizerName",
             };
}

@end

@implementation AWSIoTUpdateCACertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateId" : @"certificateId",
             @"latestAutoRegistrationStatus" : @"newAutoRegistrationStatus",
             @"latestStatus" : @"newStatus",
             @"registrationConfig" : @"registrationConfig",
             @"removeAutoRegistration" : @"removeAutoRegistration",
             };
}

+ (NSValueTransformer *)latestAutoRegistrationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLE"] == NSOrderedSame) {
            return @(AWSIoTAutoRegistrationStatusEnable);
        }
        if ([value caseInsensitiveCompare:@"DISABLE"] == NSOrderedSame) {
            return @(AWSIoTAutoRegistrationStatusDisable);
        }
        return @(AWSIoTAutoRegistrationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAutoRegistrationStatusEnable:
                return @"ENABLE";
            case AWSIoTAutoRegistrationStatusDisable:
                return @"DISABLE";
            default:
                return nil;
        }
    }];
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

+ (NSValueTransformer *)registrationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTRegistrationConfig class]];
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
        if ([value caseInsensitiveCompare:@"PENDING_ACTIVATION"] == NSOrderedSame) {
            return @(AWSIoTCertificateStatusPendingActivation);
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
            case AWSIoTCertificateStatusPendingActivation:
                return @"PENDING_ACTIVATION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTUpdateEventConfigurationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventConfigurations" : @"eventConfigurations",
             };
}

+ (NSValueTransformer *)eventConfigurationsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSIoTConfiguration class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSIoTUpdateEventConfigurationsResponse

@end

@implementation AWSIoTUpdateIndexingConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingIndexingConfiguration" : @"thingIndexingConfiguration",
             };
}

+ (NSValueTransformer *)thingIndexingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTThingIndexingConfiguration class]];
}

@end

@implementation AWSIoTUpdateIndexingConfigurationResponse

@end

@implementation AWSIoTUpdateRoleAliasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"credentialDurationSeconds" : @"credentialDurationSeconds",
             @"roleAlias" : @"roleAlias",
             @"roleArn" : @"roleArn",
             };
}

@end

@implementation AWSIoTUpdateRoleAliasResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleAlias" : @"roleAlias",
             @"roleAliasArn" : @"roleAliasArn",
             };
}

@end

@implementation AWSIoTUpdateStreamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"files" : @"files",
             @"roleArn" : @"roleArn",
             @"streamId" : @"streamId",
             };
}

+ (NSValueTransformer *)filesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTStreamFile class]];
}

@end

@implementation AWSIoTUpdateStreamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"streamArn" : @"streamArn",
             @"streamId" : @"streamId",
             @"streamVersion" : @"streamVersion",
             };
}

@end

@implementation AWSIoTUpdateThingGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expectedVersion" : @"expectedVersion",
             @"thingGroupName" : @"thingGroupName",
             @"thingGroupProperties" : @"thingGroupProperties",
             };
}

+ (NSValueTransformer *)thingGroupPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTThingGroupProperties class]];
}

@end

@implementation AWSIoTUpdateThingGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"version" : @"version",
             };
}

@end

@implementation AWSIoTUpdateThingGroupsForThingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingGroupsToAdd" : @"thingGroupsToAdd",
             @"thingGroupsToRemove" : @"thingGroupsToRemove",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTUpdateThingGroupsForThingResponse

@end

@implementation AWSIoTUpdateThingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributePayload" : @"attributePayload",
             @"expectedVersion" : @"expectedVersion",
             @"removeThingType" : @"removeThingType",
             @"thingName" : @"thingName",
             @"thingTypeName" : @"thingTypeName",
             };
}

+ (NSValueTransformer *)attributePayloadJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAttributePayload class]];
}

@end

@implementation AWSIoTUpdateThingResponse

@end
