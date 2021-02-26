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

#import "AWSIoTModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSIoTErrorDomain = @"com.amazonaws.AWSIoTErrorDomain";

@implementation AWSIoTAbortConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"criteriaList" : @"criteriaList",
             };
}

+ (NSValueTransformer *)criteriaListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTAbortCriteria class]];
}

@end

@implementation AWSIoTAbortCriteria

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"action",
             @"failureType" : @"failureType",
             @"minNumberOfExecutedThings" : @"minNumberOfExecutedThings",
             @"thresholdPercentage" : @"thresholdPercentage",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CANCEL"] == NSOrderedSame) {
            return @(AWSIoTAbortActionCancel);
        }
        return @(AWSIoTAbortActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAbortActionCancel:
                return @"CANCEL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)failureTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionFailureTypeFailed);
        }
        if ([value caseInsensitiveCompare:@"REJECTED"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionFailureTypeRejected);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionFailureTypeTimedOut);
        }
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionFailureTypeAll);
        }
        return @(AWSIoTJobExecutionFailureTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTJobExecutionFailureTypeFailed:
                return @"FAILED";
            case AWSIoTJobExecutionFailureTypeRejected:
                return @"REJECTED";
            case AWSIoTJobExecutionFailureTypeTimedOut:
                return @"TIMED_OUT";
            case AWSIoTJobExecutionFailureTypeAll:
                return @"ALL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTAcceptCertificateTransferRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateId" : @"certificateId",
             @"setAsActive" : @"setAsActive",
             };
}

@end

@implementation AWSIoTAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudwatchAlarm" : @"cloudwatchAlarm",
             @"cloudwatchLogs" : @"cloudwatchLogs",
             @"cloudwatchMetric" : @"cloudwatchMetric",
             @"dynamoDB" : @"dynamoDB",
             @"dynamoDBv2" : @"dynamoDBv2",
             @"elasticsearch" : @"elasticsearch",
             @"firehose" : @"firehose",
             @"http" : @"http",
             @"iotAnalytics" : @"iotAnalytics",
             @"iotEvents" : @"iotEvents",
             @"iotSiteWise" : @"iotSiteWise",
             @"kafka" : @"kafka",
             @"kinesis" : @"kinesis",
             @"lambda" : @"lambda",
             @"republish" : @"republish",
             @"s3" : @"s3",
             @"salesforce" : @"salesforce",
             @"sns" : @"sns",
             @"sqs" : @"sqs",
             @"stepFunctions" : @"stepFunctions",
             @"timestream" : @"timestream",
             };
}

+ (NSValueTransformer *)cloudwatchAlarmJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTCloudwatchAlarmAction class]];
}

+ (NSValueTransformer *)cloudwatchLogsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTCloudwatchLogsAction class]];
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

+ (NSValueTransformer *)httpJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTHttpAction class]];
}

+ (NSValueTransformer *)iotAnalyticsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTIotAnalyticsAction class]];
}

+ (NSValueTransformer *)iotEventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTIotEventsAction class]];
}

+ (NSValueTransformer *)iotSiteWiseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTIotSiteWiseAction class]];
}

+ (NSValueTransformer *)kafkaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTKafkaAction class]];
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

+ (NSValueTransformer *)stepFunctionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTStepFunctionsAction class]];
}

+ (NSValueTransformer *)timestreamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTTimestreamAction class]];
}

@end

@implementation AWSIoTActiveViolation

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"behavior" : @"behavior",
             @"lastViolationTime" : @"lastViolationTime",
             @"lastViolationValue" : @"lastViolationValue",
             @"securityProfileName" : @"securityProfileName",
             @"thingName" : @"thingName",
             @"violationEventAdditionalInfo" : @"violationEventAdditionalInfo",
             @"violationId" : @"violationId",
             @"violationStartTime" : @"violationStartTime",
             };
}

+ (NSValueTransformer *)behaviorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTBehavior class]];
}

+ (NSValueTransformer *)lastViolationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastViolationValueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTMetricValue class]];
}

+ (NSValueTransformer *)violationEventAdditionalInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTViolationEventAdditionalInfo class]];
}

+ (NSValueTransformer *)violationStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSIoTAddThingToBillingGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"billingGroupArn" : @"billingGroupArn",
             @"billingGroupName" : @"billingGroupName",
             @"thingArn" : @"thingArn",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTAddThingToBillingGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTAddThingToThingGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"overrideDynamicGroups" : @"overrideDynamicGroups",
             @"thingArn" : @"thingArn",
             @"thingGroupArn" : @"thingGroupArn",
             @"thingGroupName" : @"thingGroupName",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTAddThingToThingGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTAddThingsToThingGroupParams

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"overrideDynamicGroups" : @"overrideDynamicGroups",
             @"thingGroupNames" : @"thingGroupNames",
             };
}

@end

@implementation AWSIoTAlertTarget

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alertTargetArn" : @"alertTargetArn",
             @"roleArn" : @"roleArn",
             };
}

@end

@implementation AWSIoTAllowed

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policies" : @"policies",
             };
}

+ (NSValueTransformer *)policiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTPolicy class]];
}

@end

@implementation AWSIoTAssetPropertyTimestamp

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"offsetInNanos" : @"offsetInNanos",
             @"timeInSeconds" : @"timeInSeconds",
             };
}

@end

@implementation AWSIoTAssetPropertyValue

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"quality" : @"quality",
             @"timestamp" : @"timestamp",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)timestampJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAssetPropertyTimestamp class]];
}

+ (NSValueTransformer *)valueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAssetPropertyVariant class]];
}

@end

@implementation AWSIoTAssetPropertyVariant

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"booleanValueProperty" : @"booleanValue",
             @"doubleValueProperty" : @"doubleValue",
             @"integerValueProperty" : @"integerValue",
             @"stringValueProperty" : @"stringValue",
             };
}

@end

@implementation AWSIoTAssociateTargetsWithJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"comment",
             @"jobId" : @"jobId",
             @"namespaceId" : @"namespaceId",
             @"targets" : @"targets",
             };
}

@end

@implementation AWSIoTAssociateTargetsWithJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"jobArn" : @"jobArn",
             @"jobId" : @"jobId",
             };
}

@end

@implementation AWSIoTAttachPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             @"target" : @"target",
             };
}

@end

@implementation AWSIoTAttachPrincipalPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             @"principal" : @"principal",
             };
}

@end

@implementation AWSIoTAttachSecurityProfileRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityProfileName" : @"securityProfileName",
             @"securityProfileTargetArn" : @"securityProfileTargetArn",
             };
}

@end

@implementation AWSIoTAttachSecurityProfileResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTAttachThingPrincipalRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"principal" : @"principal",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTAttachThingPrincipalResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTAttributePayload

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"attributes",
             @"merge" : @"merge",
             };
}

@end

@implementation AWSIoTAuditCheckConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"enabled",
             };
}

@end

@implementation AWSIoTAuditCheckDetails

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkCompliant" : @"checkCompliant",
             @"checkRunStatus" : @"checkRunStatus",
             @"errorCode" : @"errorCode",
             @"message" : @"message",
             @"nonCompliantResourcesCount" : @"nonCompliantResourcesCount",
             @"suppressedNonCompliantResourcesCount" : @"suppressedNonCompliantResourcesCount",
             @"totalResourcesCount" : @"totalResourcesCount",
             };
}

+ (NSValueTransformer *)checkRunStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTAuditCheckRunStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"WAITING_FOR_DATA_COLLECTION"] == NSOrderedSame) {
            return @(AWSIoTAuditCheckRunStatusWaitingForDataCollection);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSIoTAuditCheckRunStatusCanceled);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED_COMPLIANT"] == NSOrderedSame) {
            return @(AWSIoTAuditCheckRunStatusCompletedCompliant);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED_NON_COMPLIANT"] == NSOrderedSame) {
            return @(AWSIoTAuditCheckRunStatusCompletedNonCompliant);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSIoTAuditCheckRunStatusFailed);
        }
        return @(AWSIoTAuditCheckRunStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAuditCheckRunStatusInProgress:
                return @"IN_PROGRESS";
            case AWSIoTAuditCheckRunStatusWaitingForDataCollection:
                return @"WAITING_FOR_DATA_COLLECTION";
            case AWSIoTAuditCheckRunStatusCanceled:
                return @"CANCELED";
            case AWSIoTAuditCheckRunStatusCompletedCompliant:
                return @"COMPLETED_COMPLIANT";
            case AWSIoTAuditCheckRunStatusCompletedNonCompliant:
                return @"COMPLETED_NON_COMPLIANT";
            case AWSIoTAuditCheckRunStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTAuditFinding

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkName" : @"checkName",
             @"findingId" : @"findingId",
             @"findingTime" : @"findingTime",
             @"isSuppressed" : @"isSuppressed",
             @"nonCompliantResource" : @"nonCompliantResource",
             @"reasonForNonCompliance" : @"reasonForNonCompliance",
             @"reasonForNonComplianceCode" : @"reasonForNonComplianceCode",
             @"relatedResources" : @"relatedResources",
             @"severity" : @"severity",
             @"taskId" : @"taskId",
             @"taskStartTime" : @"taskStartTime",
             };
}

+ (NSValueTransformer *)findingTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)nonCompliantResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTNonCompliantResource class]];
}

+ (NSValueTransformer *)relatedResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTRelatedResource class]];
}

+ (NSValueTransformer *)severityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSIoTAuditFindingSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSIoTAuditFindingSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSIoTAuditFindingSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSIoTAuditFindingSeverityLow);
        }
        return @(AWSIoTAuditFindingSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAuditFindingSeverityCritical:
                return @"CRITICAL";
            case AWSIoTAuditFindingSeverityHigh:
                return @"HIGH";
            case AWSIoTAuditFindingSeverityMedium:
                return @"MEDIUM";
            case AWSIoTAuditFindingSeverityLow:
                return @"LOW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taskStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSIoTAuditMitigationActionExecutionMetadata

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionId" : @"actionId",
             @"actionName" : @"actionName",
             @"endTime" : @"endTime",
             @"errorCode" : @"errorCode",
             @"findingId" : @"findingId",
             @"message" : @"message",
             @"startTime" : @"startTime",
             @"status" : @"status",
             @"taskId" : @"taskId",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTAuditMitigationActionsExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSIoTAuditMitigationActionsExecutionStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSIoTAuditMitigationActionsExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSIoTAuditMitigationActionsExecutionStatusCanceled);
        }
        if ([value caseInsensitiveCompare:@"SKIPPED"] == NSOrderedSame) {
            return @(AWSIoTAuditMitigationActionsExecutionStatusSkipped);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSIoTAuditMitigationActionsExecutionStatusPending);
        }
        return @(AWSIoTAuditMitigationActionsExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAuditMitigationActionsExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSIoTAuditMitigationActionsExecutionStatusCompleted:
                return @"COMPLETED";
            case AWSIoTAuditMitigationActionsExecutionStatusFailed:
                return @"FAILED";
            case AWSIoTAuditMitigationActionsExecutionStatusCanceled:
                return @"CANCELED";
            case AWSIoTAuditMitigationActionsExecutionStatusSkipped:
                return @"SKIPPED";
            case AWSIoTAuditMitigationActionsExecutionStatusPending:
                return @"PENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTAuditMitigationActionsTaskMetadata

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"startTime" : @"startTime",
             @"taskId" : @"taskId",
             @"taskStatus" : @"taskStatus",
             };
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)taskStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTAuditMitigationActionsTaskStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSIoTAuditMitigationActionsTaskStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSIoTAuditMitigationActionsTaskStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSIoTAuditMitigationActionsTaskStatusCanceled);
        }
        return @(AWSIoTAuditMitigationActionsTaskStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAuditMitigationActionsTaskStatusInProgress:
                return @"IN_PROGRESS";
            case AWSIoTAuditMitigationActionsTaskStatusCompleted:
                return @"COMPLETED";
            case AWSIoTAuditMitigationActionsTaskStatusFailed:
                return @"FAILED";
            case AWSIoTAuditMitigationActionsTaskStatusCanceled:
                return @"CANCELED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTAuditMitigationActionsTaskTarget

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"auditCheckToReasonCodeFilter" : @"auditCheckToReasonCodeFilter",
             @"auditTaskId" : @"auditTaskId",
             @"findingIds" : @"findingIds",
             };
}

@end

@implementation AWSIoTAuditNotificationTarget

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"enabled",
             @"roleArn" : @"roleArn",
             @"targetArn" : @"targetArn",
             };
}

@end

@implementation AWSIoTAuditSuppression

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkName" : @"checkName",
             @"detail" : @"description",
             @"expirationDate" : @"expirationDate",
             @"resourceIdentifier" : @"resourceIdentifier",
             @"suppressIndefinitely" : @"suppressIndefinitely",
             };
}

+ (NSValueTransformer *)expirationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)resourceIdentifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTResourceIdentifier class]];
}

@end

@implementation AWSIoTAuditTaskMetadata

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             @"taskStatus" : @"taskStatus",
             @"taskType" : @"taskType",
             };
}

+ (NSValueTransformer *)taskStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTAuditTaskStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSIoTAuditTaskStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSIoTAuditTaskStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSIoTAuditTaskStatusCanceled);
        }
        return @(AWSIoTAuditTaskStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAuditTaskStatusInProgress:
                return @"IN_PROGRESS";
            case AWSIoTAuditTaskStatusCompleted:
                return @"COMPLETED";
            case AWSIoTAuditTaskStatusFailed:
                return @"FAILED";
            case AWSIoTAuditTaskStatusCanceled:
                return @"CANCELED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taskTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ON_DEMAND_AUDIT_TASK"] == NSOrderedSame) {
            return @(AWSIoTAuditTaskTypeOnDemandAuditTask);
        }
        if ([value caseInsensitiveCompare:@"SCHEDULED_AUDIT_TASK"] == NSOrderedSame) {
            return @(AWSIoTAuditTaskTypeScheduledAuditTask);
        }
        return @(AWSIoTAuditTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAuditTaskTypeOnDemandAuditTask:
                return @"ON_DEMAND_AUDIT_TASK";
            case AWSIoTAuditTaskTypeScheduledAuditTask:
                return @"SCHEDULED_AUDIT_TASK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTAuthInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSIoTAuthorizerConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowAuthorizerOverride" : @"allowAuthorizerOverride",
             @"defaultAuthorizerName" : @"defaultAuthorizerName",
             };
}

@end

@implementation AWSIoTAuthorizerDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerArn" : @"authorizerArn",
             @"authorizerFunctionArn" : @"authorizerFunctionArn",
             @"authorizerName" : @"authorizerName",
             @"creationDate" : @"creationDate",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"signingDisabled" : @"signingDisabled",
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerArn" : @"authorizerArn",
             @"authorizerName" : @"authorizerName",
             };
}

@end

@implementation AWSIoTAwsJobAbortConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"abortCriteriaList" : @"abortCriteriaList",
             };
}

+ (NSValueTransformer *)abortCriteriaListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTAwsJobAbortCriteria class]];
}

@end

@implementation AWSIoTAwsJobAbortCriteria

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"action",
             @"failureType" : @"failureType",
             @"minNumberOfExecutedThings" : @"minNumberOfExecutedThings",
             @"thresholdPercentage" : @"thresholdPercentage",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CANCEL"] == NSOrderedSame) {
            return @(AWSIoTAwsJobAbortCriteriaAbortActionCancel);
        }
        return @(AWSIoTAwsJobAbortCriteriaAbortActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAwsJobAbortCriteriaAbortActionCancel:
                return @"CANCEL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)failureTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSIoTAwsJobAbortCriteriaFailureTypeFailed);
        }
        if ([value caseInsensitiveCompare:@"REJECTED"] == NSOrderedSame) {
            return @(AWSIoTAwsJobAbortCriteriaFailureTypeRejected);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSIoTAwsJobAbortCriteriaFailureTypeTimedOut);
        }
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSIoTAwsJobAbortCriteriaFailureTypeAll);
        }
        return @(AWSIoTAwsJobAbortCriteriaFailureTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAwsJobAbortCriteriaFailureTypeFailed:
                return @"FAILED";
            case AWSIoTAwsJobAbortCriteriaFailureTypeRejected:
                return @"REJECTED";
            case AWSIoTAwsJobAbortCriteriaFailureTypeTimedOut:
                return @"TIMED_OUT";
            case AWSIoTAwsJobAbortCriteriaFailureTypeAll:
                return @"ALL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTAwsJobExecutionsRolloutConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exponentialRate" : @"exponentialRate",
             @"maximumPerMinute" : @"maximumPerMinute",
             };
}

+ (NSValueTransformer *)exponentialRateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAwsJobExponentialRolloutRate class]];
}

@end

@implementation AWSIoTAwsJobExponentialRolloutRate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baseRatePerMinute" : @"baseRatePerMinute",
             @"incrementFactor" : @"incrementFactor",
             @"rateIncreaseCriteria" : @"rateIncreaseCriteria",
             };
}

+ (NSValueTransformer *)rateIncreaseCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAwsJobRateIncreaseCriteria class]];
}

@end

@implementation AWSIoTAwsJobPresignedUrlConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expiresInSec" : @"expiresInSec",
             };
}

@end

@implementation AWSIoTAwsJobRateIncreaseCriteria

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"numberOfNotifiedThings" : @"numberOfNotifiedThings",
             @"numberOfSucceededThings" : @"numberOfSucceededThings",
             };
}

@end

@implementation AWSIoTAwsJobTimeoutConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inProgressTimeoutInMinutes" : @"inProgressTimeoutInMinutes",
             };
}

@end

@implementation AWSIoTBehavior

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"criteria" : @"criteria",
             @"metric" : @"metric",
             @"metricDimension" : @"metricDimension",
             @"name" : @"name",
             @"suppressAlerts" : @"suppressAlerts",
             };
}

+ (NSValueTransformer *)criteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTBehaviorCriteria class]];
}

+ (NSValueTransformer *)metricDimensionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTMetricDimension class]];
}

@end

@implementation AWSIoTBehaviorCriteria

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comparisonOperator" : @"comparisonOperator",
             @"consecutiveDatapointsToAlarm" : @"consecutiveDatapointsToAlarm",
             @"consecutiveDatapointsToClear" : @"consecutiveDatapointsToClear",
             @"durationSeconds" : @"durationSeconds",
             @"mlDetectionConfig" : @"mlDetectionConfig",
             @"statisticalThreshold" : @"statisticalThreshold",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)comparisonOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"less-than"] == NSOrderedSame) {
            return @(AWSIoTComparisonOperatorLessThan);
        }
        if ([value caseInsensitiveCompare:@"less-than-equals"] == NSOrderedSame) {
            return @(AWSIoTComparisonOperatorLessThanEquals);
        }
        if ([value caseInsensitiveCompare:@"greater-than"] == NSOrderedSame) {
            return @(AWSIoTComparisonOperatorGreaterThan);
        }
        if ([value caseInsensitiveCompare:@"greater-than-equals"] == NSOrderedSame) {
            return @(AWSIoTComparisonOperatorGreaterThanEquals);
        }
        if ([value caseInsensitiveCompare:@"in-cidr-set"] == NSOrderedSame) {
            return @(AWSIoTComparisonOperatorInCidrSet);
        }
        if ([value caseInsensitiveCompare:@"not-in-cidr-set"] == NSOrderedSame) {
            return @(AWSIoTComparisonOperatorNotInCidrSet);
        }
        if ([value caseInsensitiveCompare:@"in-port-set"] == NSOrderedSame) {
            return @(AWSIoTComparisonOperatorInPortSet);
        }
        if ([value caseInsensitiveCompare:@"not-in-port-set"] == NSOrderedSame) {
            return @(AWSIoTComparisonOperatorNotInPortSet);
        }
        if ([value caseInsensitiveCompare:@"in-set"] == NSOrderedSame) {
            return @(AWSIoTComparisonOperatorInSet);
        }
        if ([value caseInsensitiveCompare:@"not-in-set"] == NSOrderedSame) {
            return @(AWSIoTComparisonOperatorNotInSet);
        }
        return @(AWSIoTComparisonOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTComparisonOperatorLessThan:
                return @"less-than";
            case AWSIoTComparisonOperatorLessThanEquals:
                return @"less-than-equals";
            case AWSIoTComparisonOperatorGreaterThan:
                return @"greater-than";
            case AWSIoTComparisonOperatorGreaterThanEquals:
                return @"greater-than-equals";
            case AWSIoTComparisonOperatorInCidrSet:
                return @"in-cidr-set";
            case AWSIoTComparisonOperatorNotInCidrSet:
                return @"not-in-cidr-set";
            case AWSIoTComparisonOperatorInPortSet:
                return @"in-port-set";
            case AWSIoTComparisonOperatorNotInPortSet:
                return @"not-in-port-set";
            case AWSIoTComparisonOperatorInSet:
                return @"in-set";
            case AWSIoTComparisonOperatorNotInSet:
                return @"not-in-set";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mlDetectionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTMachineLearningDetectionConfig class]];
}

+ (NSValueTransformer *)statisticalThresholdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTStatisticalThreshold class]];
}

+ (NSValueTransformer *)valueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTMetricValue class]];
}

@end

@implementation AWSIoTBehaviorModelTrainingSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"behaviorName" : @"behaviorName",
             @"datapointsCollectionPercentage" : @"datapointsCollectionPercentage",
             @"lastModelRefreshDate" : @"lastModelRefreshDate",
             @"modelStatus" : @"modelStatus",
             @"securityProfileName" : @"securityProfileName",
             @"trainingDataCollectionStartDate" : @"trainingDataCollectionStartDate",
             };
}

+ (NSValueTransformer *)lastModelRefreshDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)modelStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING_BUILD"] == NSOrderedSame) {
            return @(AWSIoTModelStatusPendingBuild);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSIoTModelStatusActive);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSIoTModelStatusExpired);
        }
        return @(AWSIoTModelStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTModelStatusPendingBuild:
                return @"PENDING_BUILD";
            case AWSIoTModelStatusActive:
                return @"ACTIVE";
            case AWSIoTModelStatusExpired:
                return @"EXPIRED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)trainingDataCollectionStartDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSIoTBillingGroupMetadata

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"creationDate",
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

@implementation AWSIoTBillingGroupProperties

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"billingGroupDescription" : @"billingGroupDescription",
             };
}

@end

@implementation AWSIoTCACertificate

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
             @"validity" : @"validity",
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

+ (NSValueTransformer *)validityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTCertificateValidity class]];
}

@end

@implementation AWSIoTCancelAuditMitigationActionsTaskRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSIoTCancelAuditMitigationActionsTaskResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTCancelAuditTaskRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSIoTCancelAuditTaskResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTCancelCertificateTransferRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateId" : @"certificateId",
             };
}

@end

@implementation AWSIoTCancelDetectMitigationActionsTaskRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSIoTCancelDetectMitigationActionsTaskResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTCancelJobExecutionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"comment",
             @"force" : @"force",
             @"jobId" : @"jobId",
             @"reasonCode" : @"reasonCode",
             };
}

@end

@implementation AWSIoTCancelJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"jobArn" : @"jobArn",
             @"jobId" : @"jobId",
             };
}

@end

@implementation AWSIoTCertificate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"certificateArn",
             @"certificateId" : @"certificateId",
             @"certificateMode" : @"certificateMode",
             @"creationDate" : @"creationDate",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)certificateModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSIoTCertificateModeDefault);
        }
        if ([value caseInsensitiveCompare:@"SNI_ONLY"] == NSOrderedSame) {
            return @(AWSIoTCertificateModeSniOnly);
        }
        return @(AWSIoTCertificateModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTCertificateModeDefault:
                return @"DEFAULT";
            case AWSIoTCertificateModeSniOnly:
                return @"SNI_ONLY";
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"caCertificateId" : @"caCertificateId",
             @"certificateArn" : @"certificateArn",
             @"certificateId" : @"certificateId",
             @"certificateMode" : @"certificateMode",
             @"certificatePem" : @"certificatePem",
             @"creationDate" : @"creationDate",
             @"customerVersion" : @"customerVersion",
             @"generationId" : @"generationId",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"ownedBy" : @"ownedBy",
             @"previousOwnedBy" : @"previousOwnedBy",
             @"status" : @"status",
             @"transferData" : @"transferData",
             @"validity" : @"validity",
             };
}

+ (NSValueTransformer *)certificateModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSIoTCertificateModeDefault);
        }
        if ([value caseInsensitiveCompare:@"SNI_ONLY"] == NSOrderedSame) {
            return @(AWSIoTCertificateModeSniOnly);
        }
        return @(AWSIoTCertificateModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTCertificateModeDefault:
                return @"DEFAULT";
            case AWSIoTCertificateModeSniOnly:
                return @"SNI_ONLY";
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

+ (NSValueTransformer *)validityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTCertificateValidity class]];
}

@end

@implementation AWSIoTCertificateValidity

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notAfter" : @"notAfter",
             @"notBefore" : @"notBefore",
             };
}

+ (NSValueTransformer *)notAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)notBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSIoTClearDefaultAuthorizerRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTClearDefaultAuthorizerResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTCloudwatchAlarmAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarmName" : @"alarmName",
             @"roleArn" : @"roleArn",
             @"stateReason" : @"stateReason",
             @"stateValue" : @"stateValue",
             };
}

@end

@implementation AWSIoTCloudwatchLogsAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             @"roleArn" : @"roleArn",
             };
}

@end

@implementation AWSIoTCloudwatchMetricAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsSignerJobId" : @"awsSignerJobId",
             @"customCodeSigning" : @"customCodeSigning",
             @"startSigningJobParameter" : @"startSigningJobParameter",
             };
}

+ (NSValueTransformer *)customCodeSigningJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTCustomCodeSigning class]];
}

+ (NSValueTransformer *)startSigningJobParameterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTStartSigningJobParameter class]];
}

@end

@implementation AWSIoTCodeSigningCertificateChain

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateName" : @"certificateName",
             @"inlineDocument" : @"inlineDocument",
             };
}

@end

@implementation AWSIoTCodeSigningSignature

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inlineDocument" : @"inlineDocument",
             };
}

@end

@implementation AWSIoTConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSIoTConfirmTopicRuleDestinationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confirmationToken" : @"confirmationToken",
             };
}

@end

@implementation AWSIoTConfirmTopicRuleDestinationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTCreateAuditSuppressionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkName" : @"checkName",
             @"clientRequestToken" : @"clientRequestToken",
             @"detail" : @"description",
             @"expirationDate" : @"expirationDate",
             @"resourceIdentifier" : @"resourceIdentifier",
             @"suppressIndefinitely" : @"suppressIndefinitely",
             };
}

+ (NSValueTransformer *)expirationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)resourceIdentifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTResourceIdentifier class]];
}

@end

@implementation AWSIoTCreateAuditSuppressionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTCreateAuthorizerRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerFunctionArn" : @"authorizerFunctionArn",
             @"authorizerName" : @"authorizerName",
             @"signingDisabled" : @"signingDisabled",
             @"status" : @"status",
             @"tags" : @"tags",
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

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTTag class]];
}

@end

@implementation AWSIoTCreateAuthorizerResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerArn" : @"authorizerArn",
             @"authorizerName" : @"authorizerName",
             };
}

@end

@implementation AWSIoTCreateBillingGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"billingGroupName" : @"billingGroupName",
             @"billingGroupProperties" : @"billingGroupProperties",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)billingGroupPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTBillingGroupProperties class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTTag class]];
}

@end

@implementation AWSIoTCreateBillingGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"billingGroupArn" : @"billingGroupArn",
             @"billingGroupId" : @"billingGroupId",
             @"billingGroupName" : @"billingGroupName",
             };
}

@end

@implementation AWSIoTCreateCertificateFromCsrRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateSigningRequest" : @"certificateSigningRequest",
             @"setAsActive" : @"setAsActive",
             };
}

@end

@implementation AWSIoTCreateCertificateFromCsrResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"certificateArn",
             @"certificateId" : @"certificateId",
             @"certificatePem" : @"certificatePem",
             };
}

@end

@implementation AWSIoTCreateCustomMetricRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"clientRequestToken",
             @"displayName" : @"displayName",
             @"metricName" : @"metricName",
             @"metricType" : @"metricType",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)metricTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"string-list"] == NSOrderedSame) {
            return @(AWSIoTCustomMetricTypeStringList);
        }
        if ([value caseInsensitiveCompare:@"ip-address-list"] == NSOrderedSame) {
            return @(AWSIoTCustomMetricTypeIpAddressList);
        }
        if ([value caseInsensitiveCompare:@"number-list"] == NSOrderedSame) {
            return @(AWSIoTCustomMetricTypeNumberList);
        }
        if ([value caseInsensitiveCompare:@"number"] == NSOrderedSame) {
            return @(AWSIoTCustomMetricTypeNumber);
        }
        return @(AWSIoTCustomMetricTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTCustomMetricTypeStringList:
                return @"string-list";
            case AWSIoTCustomMetricTypeIpAddressList:
                return @"ip-address-list";
            case AWSIoTCustomMetricTypeNumberList:
                return @"number-list";
            case AWSIoTCustomMetricTypeNumber:
                return @"number";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTTag class]];
}

@end

@implementation AWSIoTCreateCustomMetricResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricArn" : @"metricArn",
             @"metricName" : @"metricName",
             };
}

@end

@implementation AWSIoTCreateDimensionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"clientRequestToken",
             @"name" : @"name",
             @"stringValues" : @"stringValues",
             @"tags" : @"tags",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTTag class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TOPIC_FILTER"] == NSOrderedSame) {
            return @(AWSIoTDimensionTypeTopicFilter);
        }
        return @(AWSIoTDimensionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTDimensionTypeTopicFilter:
                return @"TOPIC_FILTER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTCreateDimensionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"name" : @"name",
             };
}

@end

@implementation AWSIoTCreateDomainConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerConfig" : @"authorizerConfig",
             @"domainConfigurationName" : @"domainConfigurationName",
             @"domainName" : @"domainName",
             @"serverCertificateArns" : @"serverCertificateArns",
             @"serviceType" : @"serviceType",
             @"tags" : @"tags",
             @"validationCertificateArn" : @"validationCertificateArn",
             };
}

+ (NSValueTransformer *)authorizerConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAuthorizerConfig class]];
}

+ (NSValueTransformer *)serviceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DATA"] == NSOrderedSame) {
            return @(AWSIoTServiceTypeData);
        }
        if ([value caseInsensitiveCompare:@"CREDENTIAL_PROVIDER"] == NSOrderedSame) {
            return @(AWSIoTServiceTypeCredentialProvider);
        }
        if ([value caseInsensitiveCompare:@"JOBS"] == NSOrderedSame) {
            return @(AWSIoTServiceTypeJobs);
        }
        return @(AWSIoTServiceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTServiceTypeData:
                return @"DATA";
            case AWSIoTServiceTypeCredentialProvider:
                return @"CREDENTIAL_PROVIDER";
            case AWSIoTServiceTypeJobs:
                return @"JOBS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTTag class]];
}

@end

@implementation AWSIoTCreateDomainConfigurationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainConfigurationArn" : @"domainConfigurationArn",
             @"domainConfigurationName" : @"domainConfigurationName",
             };
}

@end

@implementation AWSIoTCreateDynamicThingGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"indexName",
             @"queryString" : @"queryString",
             @"queryVersion" : @"queryVersion",
             @"tags" : @"tags",
             @"thingGroupName" : @"thingGroupName",
             @"thingGroupProperties" : @"thingGroupProperties",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTTag class]];
}

+ (NSValueTransformer *)thingGroupPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTThingGroupProperties class]];
}

@end

@implementation AWSIoTCreateDynamicThingGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"indexName",
             @"queryString" : @"queryString",
             @"queryVersion" : @"queryVersion",
             @"thingGroupArn" : @"thingGroupArn",
             @"thingGroupId" : @"thingGroupId",
             @"thingGroupName" : @"thingGroupName",
             };
}

@end

@implementation AWSIoTCreateJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"abortConfig" : @"abortConfig",
             @"detail" : @"description",
             @"document" : @"document",
             @"documentSource" : @"documentSource",
             @"jobExecutionsRolloutConfig" : @"jobExecutionsRolloutConfig",
             @"jobId" : @"jobId",
             @"namespaceId" : @"namespaceId",
             @"presignedUrlConfig" : @"presignedUrlConfig",
             @"tags" : @"tags",
             @"targetSelection" : @"targetSelection",
             @"targets" : @"targets",
             @"timeoutConfig" : @"timeoutConfig",
             };
}

+ (NSValueTransformer *)abortConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAbortConfig class]];
}

+ (NSValueTransformer *)jobExecutionsRolloutConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTJobExecutionsRolloutConfig class]];
}

+ (NSValueTransformer *)presignedUrlConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTPresignedUrlConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTTag class]];
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

+ (NSValueTransformer *)timeoutConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTTimeoutConfig class]];
}

@end

@implementation AWSIoTCreateJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"jobArn" : @"jobArn",
             @"jobId" : @"jobId",
             };
}

@end

@implementation AWSIoTCreateKeysAndCertificateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"setAsActive" : @"setAsActive",
             };
}

@end

@implementation AWSIoTCreateKeysAndCertificateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSIoTCreateMitigationActionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionName" : @"actionName",
             @"actionParams" : @"actionParams",
             @"roleArn" : @"roleArn",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)actionParamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTMitigationActionParams class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTTag class]];
}

@end

@implementation AWSIoTCreateMitigationActionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionArn" : @"actionArn",
             @"actionId" : @"actionId",
             };
}

@end

@implementation AWSIoTCreateOTAUpdateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalParameters" : @"additionalParameters",
             @"awsJobAbortConfig" : @"awsJobAbortConfig",
             @"awsJobExecutionsRolloutConfig" : @"awsJobExecutionsRolloutConfig",
             @"awsJobPresignedUrlConfig" : @"awsJobPresignedUrlConfig",
             @"awsJobTimeoutConfig" : @"awsJobTimeoutConfig",
             @"detail" : @"description",
             @"files" : @"files",
             @"otaUpdateId" : @"otaUpdateId",
             @"protocols" : @"protocols",
             @"roleArn" : @"roleArn",
             @"tags" : @"tags",
             @"targetSelection" : @"targetSelection",
             @"targets" : @"targets",
             };
}

+ (NSValueTransformer *)awsJobAbortConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAwsJobAbortConfig class]];
}

+ (NSValueTransformer *)awsJobExecutionsRolloutConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAwsJobExecutionsRolloutConfig class]];
}

+ (NSValueTransformer *)awsJobPresignedUrlConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAwsJobPresignedUrlConfig class]];
}

+ (NSValueTransformer *)awsJobTimeoutConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAwsJobTimeoutConfig class]];
}

+ (NSValueTransformer *)filesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTOTAUpdateFile class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTTag class]];
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyDocument" : @"policyDocument",
             @"policyName" : @"policyName",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTTag class]];
}

@end

@implementation AWSIoTCreatePolicyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyDocument" : @"policyDocument",
             @"policyName" : @"policyName",
             @"setAsDefault" : @"setAsDefault",
             };
}

@end

@implementation AWSIoTCreatePolicyVersionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isDefaultVersion" : @"isDefaultVersion",
             @"policyArn" : @"policyArn",
             @"policyDocument" : @"policyDocument",
             @"policyVersionId" : @"policyVersionId",
             };
}

@end

@implementation AWSIoTCreateProvisioningClaimRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateName" : @"templateName",
             };
}

@end

@implementation AWSIoTCreateProvisioningClaimResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateId" : @"certificateId",
             @"certificatePem" : @"certificatePem",
             @"expiration" : @"expiration",
             @"keyPair" : @"keyPair",
             };
}

+ (NSValueTransformer *)expirationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)keyPairJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTKeyPair class]];
}

@end

@implementation AWSIoTCreateProvisioningTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"enabled" : @"enabled",
             @"preProvisioningHook" : @"preProvisioningHook",
             @"provisioningRoleArn" : @"provisioningRoleArn",
             @"tags" : @"tags",
             @"templateBody" : @"templateBody",
             @"templateName" : @"templateName",
             };
}

+ (NSValueTransformer *)preProvisioningHookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTProvisioningHook class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTTag class]];
}

@end

@implementation AWSIoTCreateProvisioningTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultVersionId" : @"defaultVersionId",
             @"templateArn" : @"templateArn",
             @"templateName" : @"templateName",
             };
}

@end

@implementation AWSIoTCreateProvisioningTemplateVersionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"setAsDefault" : @"setAsDefault",
             @"templateBody" : @"templateBody",
             @"templateName" : @"templateName",
             };
}

@end

@implementation AWSIoTCreateProvisioningTemplateVersionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isDefaultVersion" : @"isDefaultVersion",
             @"templateArn" : @"templateArn",
             @"templateName" : @"templateName",
             @"versionId" : @"versionId",
             };
}

@end

@implementation AWSIoTCreateRoleAliasRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"credentialDurationSeconds" : @"credentialDurationSeconds",
             @"roleAlias" : @"roleAlias",
             @"roleArn" : @"roleArn",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTTag class]];
}

@end

@implementation AWSIoTCreateRoleAliasResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleAlias" : @"roleAlias",
             @"roleAliasArn" : @"roleAliasArn",
             };
}

@end

@implementation AWSIoTCreateScheduledAuditRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dayOfMonth" : @"dayOfMonth",
             @"dayOfWeek" : @"dayOfWeek",
             @"frequency" : @"frequency",
             @"scheduledAuditName" : @"scheduledAuditName",
             @"tags" : @"tags",
             @"targetCheckNames" : @"targetCheckNames",
             };
}

+ (NSValueTransformer *)dayOfWeekJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUN"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekSun);
        }
        if ([value caseInsensitiveCompare:@"MON"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekMon);
        }
        if ([value caseInsensitiveCompare:@"TUE"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekTue);
        }
        if ([value caseInsensitiveCompare:@"WED"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekWed);
        }
        if ([value caseInsensitiveCompare:@"THU"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekThu);
        }
        if ([value caseInsensitiveCompare:@"FRI"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekFri);
        }
        if ([value caseInsensitiveCompare:@"SAT"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekSat);
        }
        return @(AWSIoTDayOfWeekUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTDayOfWeekSun:
                return @"SUN";
            case AWSIoTDayOfWeekMon:
                return @"MON";
            case AWSIoTDayOfWeekTue:
                return @"TUE";
            case AWSIoTDayOfWeekWed:
                return @"WED";
            case AWSIoTDayOfWeekThu:
                return @"THU";
            case AWSIoTDayOfWeekFri:
                return @"FRI";
            case AWSIoTDayOfWeekSat:
                return @"SAT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)frequencyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DAILY"] == NSOrderedSame) {
            return @(AWSIoTAuditFrequencyDaily);
        }
        if ([value caseInsensitiveCompare:@"WEEKLY"] == NSOrderedSame) {
            return @(AWSIoTAuditFrequencyWeekly);
        }
        if ([value caseInsensitiveCompare:@"BIWEEKLY"] == NSOrderedSame) {
            return @(AWSIoTAuditFrequencyBiweekly);
        }
        if ([value caseInsensitiveCompare:@"MONTHLY"] == NSOrderedSame) {
            return @(AWSIoTAuditFrequencyMonthly);
        }
        return @(AWSIoTAuditFrequencyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAuditFrequencyDaily:
                return @"DAILY";
            case AWSIoTAuditFrequencyWeekly:
                return @"WEEKLY";
            case AWSIoTAuditFrequencyBiweekly:
                return @"BIWEEKLY";
            case AWSIoTAuditFrequencyMonthly:
                return @"MONTHLY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTTag class]];
}

@end

@implementation AWSIoTCreateScheduledAuditResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduledAuditArn" : @"scheduledAuditArn",
             };
}

@end

@implementation AWSIoTCreateSecurityProfileRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalMetricsToRetain" : @"additionalMetricsToRetain",
             @"additionalMetricsToRetainV2" : @"additionalMetricsToRetainV2",
             @"alertTargets" : @"alertTargets",
             @"behaviors" : @"behaviors",
             @"securityProfileDescription" : @"securityProfileDescription",
             @"securityProfileName" : @"securityProfileName",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)additionalMetricsToRetainV2JSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTMetricToRetain class]];
}

+ (NSValueTransformer *)alertTargetsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSIoTAlertTarget class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)behaviorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTBehavior class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTTag class]];
}

@end

@implementation AWSIoTCreateSecurityProfileResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityProfileArn" : @"securityProfileArn",
             @"securityProfileName" : @"securityProfileName",
             };
}

@end

@implementation AWSIoTCreateStreamRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"files" : @"files",
             @"roleArn" : @"roleArn",
             @"streamId" : @"streamId",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)filesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTStreamFile class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTTag class]];
}

@end

@implementation AWSIoTCreateStreamResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parentGroupName" : @"parentGroupName",
             @"tags" : @"tags",
             @"thingGroupName" : @"thingGroupName",
             @"thingGroupProperties" : @"thingGroupProperties",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTTag class]];
}

+ (NSValueTransformer *)thingGroupPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTThingGroupProperties class]];
}

@end

@implementation AWSIoTCreateThingGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingGroupArn" : @"thingGroupArn",
             @"thingGroupId" : @"thingGroupId",
             @"thingGroupName" : @"thingGroupName",
             };
}

@end

@implementation AWSIoTCreateThingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributePayload" : @"attributePayload",
             @"billingGroupName" : @"billingGroupName",
             @"thingName" : @"thingName",
             @"thingTypeName" : @"thingTypeName",
             };
}

+ (NSValueTransformer *)attributePayloadJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAttributePayload class]];
}

@end

@implementation AWSIoTCreateThingResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingArn" : @"thingArn",
             @"thingId" : @"thingId",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTCreateThingTypeRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"tags",
             @"thingTypeName" : @"thingTypeName",
             @"thingTypeProperties" : @"thingTypeProperties",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTTag class]];
}

+ (NSValueTransformer *)thingTypePropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTThingTypeProperties class]];
}

@end

@implementation AWSIoTCreateThingTypeResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingTypeArn" : @"thingTypeArn",
             @"thingTypeId" : @"thingTypeId",
             @"thingTypeName" : @"thingTypeName",
             };
}

@end

@implementation AWSIoTCreateTopicRuleDestinationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationConfiguration" : @"destinationConfiguration",
             };
}

+ (NSValueTransformer *)destinationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTTopicRuleDestinationConfiguration class]];
}

@end

@implementation AWSIoTCreateTopicRuleDestinationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"topicRuleDestination" : @"topicRuleDestination",
             };
}

+ (NSValueTransformer *)topicRuleDestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTTopicRuleDestination class]];
}

@end

@implementation AWSIoTCreateTopicRuleRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleName" : @"ruleName",
             @"tags" : @"tags",
             @"topicRulePayload" : @"topicRulePayload",
             };
}

+ (NSValueTransformer *)topicRulePayloadJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTTopicRulePayload class]];
}

@end

@implementation AWSIoTCustomCodeSigning

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSIoTDeleteAccountAuditConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleteScheduledAudits" : @"deleteScheduledAudits",
             };
}

@end

@implementation AWSIoTDeleteAccountAuditConfigurationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDeleteAuditSuppressionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkName" : @"checkName",
             @"resourceIdentifier" : @"resourceIdentifier",
             };
}

+ (NSValueTransformer *)resourceIdentifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTResourceIdentifier class]];
}

@end

@implementation AWSIoTDeleteAuditSuppressionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDeleteAuthorizerRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerName" : @"authorizerName",
             };
}

@end

@implementation AWSIoTDeleteAuthorizerResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDeleteBillingGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"billingGroupName" : @"billingGroupName",
             @"expectedVersion" : @"expectedVersion",
             };
}

@end

@implementation AWSIoTDeleteBillingGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDeleteCACertificateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateId" : @"certificateId",
             };
}

@end

@implementation AWSIoTDeleteCACertificateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDeleteCertificateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateId" : @"certificateId",
             @"forceDelete" : @"forceDelete",
             };
}

@end

@implementation AWSIoTDeleteCustomMetricRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricName" : @"metricName",
             };
}

@end

@implementation AWSIoTDeleteCustomMetricResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDeleteDimensionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             };
}

@end

@implementation AWSIoTDeleteDimensionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDeleteDomainConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainConfigurationName" : @"domainConfigurationName",
             };
}

@end

@implementation AWSIoTDeleteDomainConfigurationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDeleteDynamicThingGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expectedVersion" : @"expectedVersion",
             @"thingGroupName" : @"thingGroupName",
             };
}

@end

@implementation AWSIoTDeleteDynamicThingGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDeleteJobExecutionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"executionNumber" : @"executionNumber",
             @"force" : @"force",
             @"jobId" : @"jobId",
             @"namespaceId" : @"namespaceId",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTDeleteJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"force" : @"force",
             @"jobId" : @"jobId",
             @"namespaceId" : @"namespaceId",
             };
}

@end

@implementation AWSIoTDeleteMitigationActionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionName" : @"actionName",
             };
}

@end

@implementation AWSIoTDeleteMitigationActionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDeleteOTAUpdateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleteStream" : @"deleteStream",
             @"forceDeleteAWSJob" : @"forceDeleteAWSJob",
             @"otaUpdateId" : @"otaUpdateId",
             };
}

@end

@implementation AWSIoTDeleteOTAUpdateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDeletePolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             };
}

@end

@implementation AWSIoTDeletePolicyVersionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             @"policyVersionId" : @"policyVersionId",
             };
}

@end

@implementation AWSIoTDeleteProvisioningTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateName" : @"templateName",
             };
}

@end

@implementation AWSIoTDeleteProvisioningTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDeleteProvisioningTemplateVersionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateName" : @"templateName",
             @"versionId" : @"versionId",
             };
}

@end

@implementation AWSIoTDeleteProvisioningTemplateVersionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDeleteRegistrationCodeRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDeleteRegistrationCodeResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDeleteRoleAliasRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleAlias" : @"roleAlias",
             };
}

@end

@implementation AWSIoTDeleteRoleAliasResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDeleteScheduledAuditRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduledAuditName" : @"scheduledAuditName",
             };
}

@end

@implementation AWSIoTDeleteScheduledAuditResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDeleteSecurityProfileRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expectedVersion" : @"expectedVersion",
             @"securityProfileName" : @"securityProfileName",
             };
}

@end

@implementation AWSIoTDeleteSecurityProfileResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDeleteStreamRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamId" : @"streamId",
             };
}

@end

@implementation AWSIoTDeleteStreamResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDeleteThingGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expectedVersion" : @"expectedVersion",
             @"thingGroupName" : @"thingGroupName",
             };
}

@end

@implementation AWSIoTDeleteThingGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDeleteThingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expectedVersion" : @"expectedVersion",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTDeleteThingResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDeleteThingTypeRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingTypeName" : @"thingTypeName",
             };
}

@end

@implementation AWSIoTDeleteThingTypeResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDeleteTopicRuleDestinationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             };
}

@end

@implementation AWSIoTDeleteTopicRuleDestinationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDeleteTopicRuleRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleName" : @"ruleName",
             };
}

@end

@implementation AWSIoTDeleteV2LoggingLevelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingTypeName" : @"thingTypeName",
             @"undoDeprecate" : @"undoDeprecate",
             };
}

@end

@implementation AWSIoTDeprecateThingTypeResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDescribeAccountAuditConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDescribeAccountAuditConfigurationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"auditCheckConfigurations" : @"auditCheckConfigurations",
             @"auditNotificationTargetConfigurations" : @"auditNotificationTargetConfigurations",
             @"roleArn" : @"roleArn",
             };
}

+ (NSValueTransformer *)auditCheckConfigurationsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSIoTAuditCheckConfiguration class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)auditNotificationTargetConfigurationsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSIoTAuditNotificationTarget class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSIoTDescribeAuditFindingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findingId" : @"findingId",
             };
}

@end

@implementation AWSIoTDescribeAuditFindingResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"finding" : @"finding",
             };
}

+ (NSValueTransformer *)findingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAuditFinding class]];
}

@end

@implementation AWSIoTDescribeAuditMitigationActionsTaskRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSIoTDescribeAuditMitigationActionsTaskResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionsDefinition" : @"actionsDefinition",
             @"auditCheckToActionsMapping" : @"auditCheckToActionsMapping",
             @"endTime" : @"endTime",
             @"startTime" : @"startTime",
             @"target" : @"target",
             @"taskStatistics" : @"taskStatistics",
             @"taskStatus" : @"taskStatus",
             };
}

+ (NSValueTransformer *)actionsDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTMitigationAction class]];
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)targetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAuditMitigationActionsTaskTarget class]];
}

+ (NSValueTransformer *)taskStatisticsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSIoTTaskStatisticsForAuditCheck class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)taskStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTAuditMitigationActionsTaskStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSIoTAuditMitigationActionsTaskStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSIoTAuditMitigationActionsTaskStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSIoTAuditMitigationActionsTaskStatusCanceled);
        }
        return @(AWSIoTAuditMitigationActionsTaskStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAuditMitigationActionsTaskStatusInProgress:
                return @"IN_PROGRESS";
            case AWSIoTAuditMitigationActionsTaskStatusCompleted:
                return @"COMPLETED";
            case AWSIoTAuditMitigationActionsTaskStatusFailed:
                return @"FAILED";
            case AWSIoTAuditMitigationActionsTaskStatusCanceled:
                return @"CANCELED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTDescribeAuditSuppressionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkName" : @"checkName",
             @"resourceIdentifier" : @"resourceIdentifier",
             };
}

+ (NSValueTransformer *)resourceIdentifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTResourceIdentifier class]];
}

@end

@implementation AWSIoTDescribeAuditSuppressionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkName" : @"checkName",
             @"detail" : @"description",
             @"expirationDate" : @"expirationDate",
             @"resourceIdentifier" : @"resourceIdentifier",
             @"suppressIndefinitely" : @"suppressIndefinitely",
             };
}

+ (NSValueTransformer *)expirationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)resourceIdentifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTResourceIdentifier class]];
}

@end

@implementation AWSIoTDescribeAuditTaskRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSIoTDescribeAuditTaskResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"auditDetails" : @"auditDetails",
             @"scheduledAuditName" : @"scheduledAuditName",
             @"taskStartTime" : @"taskStartTime",
             @"taskStatistics" : @"taskStatistics",
             @"taskStatus" : @"taskStatus",
             @"taskType" : @"taskType",
             };
}

+ (NSValueTransformer *)auditDetailsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSIoTAuditCheckDetails class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)taskStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)taskStatisticsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTTaskStatistics class]];
}

+ (NSValueTransformer *)taskStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTAuditTaskStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSIoTAuditTaskStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSIoTAuditTaskStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSIoTAuditTaskStatusCanceled);
        }
        return @(AWSIoTAuditTaskStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAuditTaskStatusInProgress:
                return @"IN_PROGRESS";
            case AWSIoTAuditTaskStatusCompleted:
                return @"COMPLETED";
            case AWSIoTAuditTaskStatusFailed:
                return @"FAILED";
            case AWSIoTAuditTaskStatusCanceled:
                return @"CANCELED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taskTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ON_DEMAND_AUDIT_TASK"] == NSOrderedSame) {
            return @(AWSIoTAuditTaskTypeOnDemandAuditTask);
        }
        if ([value caseInsensitiveCompare:@"SCHEDULED_AUDIT_TASK"] == NSOrderedSame) {
            return @(AWSIoTAuditTaskTypeScheduledAuditTask);
        }
        return @(AWSIoTAuditTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAuditTaskTypeOnDemandAuditTask:
                return @"ON_DEMAND_AUDIT_TASK";
            case AWSIoTAuditTaskTypeScheduledAuditTask:
                return @"SCHEDULED_AUDIT_TASK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTDescribeAuthorizerRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerName" : @"authorizerName",
             };
}

@end

@implementation AWSIoTDescribeAuthorizerResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerDescription" : @"authorizerDescription",
             };
}

+ (NSValueTransformer *)authorizerDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAuthorizerDescription class]];
}

@end

@implementation AWSIoTDescribeBillingGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"billingGroupName" : @"billingGroupName",
             };
}

@end

@implementation AWSIoTDescribeBillingGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"billingGroupArn" : @"billingGroupArn",
             @"billingGroupId" : @"billingGroupId",
             @"billingGroupMetadata" : @"billingGroupMetadata",
             @"billingGroupName" : @"billingGroupName",
             @"billingGroupProperties" : @"billingGroupProperties",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)billingGroupMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTBillingGroupMetadata class]];
}

+ (NSValueTransformer *)billingGroupPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTBillingGroupProperties class]];
}

@end

@implementation AWSIoTDescribeCACertificateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateId" : @"certificateId",
             };
}

@end

@implementation AWSIoTDescribeCACertificateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateId" : @"certificateId",
             };
}

@end

@implementation AWSIoTDescribeCertificateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateDescription" : @"certificateDescription",
             };
}

+ (NSValueTransformer *)certificateDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTCertificateDescription class]];
}

@end

@implementation AWSIoTDescribeCustomMetricRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricName" : @"metricName",
             };
}

@end

@implementation AWSIoTDescribeCustomMetricResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"creationDate",
             @"displayName" : @"displayName",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"metricArn" : @"metricArn",
             @"metricName" : @"metricName",
             @"metricType" : @"metricType",
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

+ (NSValueTransformer *)metricTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"string-list"] == NSOrderedSame) {
            return @(AWSIoTCustomMetricTypeStringList);
        }
        if ([value caseInsensitiveCompare:@"ip-address-list"] == NSOrderedSame) {
            return @(AWSIoTCustomMetricTypeIpAddressList);
        }
        if ([value caseInsensitiveCompare:@"number-list"] == NSOrderedSame) {
            return @(AWSIoTCustomMetricTypeNumberList);
        }
        if ([value caseInsensitiveCompare:@"number"] == NSOrderedSame) {
            return @(AWSIoTCustomMetricTypeNumber);
        }
        return @(AWSIoTCustomMetricTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTCustomMetricTypeStringList:
                return @"string-list";
            case AWSIoTCustomMetricTypeIpAddressList:
                return @"ip-address-list";
            case AWSIoTCustomMetricTypeNumberList:
                return @"number-list";
            case AWSIoTCustomMetricTypeNumber:
                return @"number";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTDescribeDefaultAuthorizerRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDescribeDefaultAuthorizerResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerDescription" : @"authorizerDescription",
             };
}

+ (NSValueTransformer *)authorizerDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAuthorizerDescription class]];
}

@end

@implementation AWSIoTDescribeDetectMitigationActionsTaskRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSIoTDescribeDetectMitigationActionsTaskResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskSummary" : @"taskSummary",
             };
}

+ (NSValueTransformer *)taskSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTDetectMitigationActionsTaskSummary class]];
}

@end

@implementation AWSIoTDescribeDimensionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             };
}

@end

@implementation AWSIoTDescribeDimensionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"creationDate" : @"creationDate",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"name" : @"name",
             @"stringValues" : @"stringValues",
             @"types" : @"type",
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

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TOPIC_FILTER"] == NSOrderedSame) {
            return @(AWSIoTDimensionTypeTopicFilter);
        }
        return @(AWSIoTDimensionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTDimensionTypeTopicFilter:
                return @"TOPIC_FILTER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTDescribeDomainConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainConfigurationName" : @"domainConfigurationName",
             };
}

@end

@implementation AWSIoTDescribeDomainConfigurationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerConfig" : @"authorizerConfig",
             @"domainConfigurationArn" : @"domainConfigurationArn",
             @"domainConfigurationName" : @"domainConfigurationName",
             @"domainConfigurationStatus" : @"domainConfigurationStatus",
             @"domainName" : @"domainName",
             @"domainType" : @"domainType",
             @"lastStatusChangeDate" : @"lastStatusChangeDate",
             @"serverCertificates" : @"serverCertificates",
             @"serviceType" : @"serviceType",
             };
}

+ (NSValueTransformer *)authorizerConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAuthorizerConfig class]];
}

+ (NSValueTransformer *)domainConfigurationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSIoTDomainConfigurationStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSIoTDomainConfigurationStatusDisabled);
        }
        return @(AWSIoTDomainConfigurationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTDomainConfigurationStatusEnabled:
                return @"ENABLED";
            case AWSIoTDomainConfigurationStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)domainTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENDPOINT"] == NSOrderedSame) {
            return @(AWSIoTDomainTypeEndpoint);
        }
        if ([value caseInsensitiveCompare:@"AWS_MANAGED"] == NSOrderedSame) {
            return @(AWSIoTDomainTypeAwsManaged);
        }
        if ([value caseInsensitiveCompare:@"CUSTOMER_MANAGED"] == NSOrderedSame) {
            return @(AWSIoTDomainTypeCustomerManaged);
        }
        return @(AWSIoTDomainTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTDomainTypeEndpoint:
                return @"ENDPOINT";
            case AWSIoTDomainTypeAwsManaged:
                return @"AWS_MANAGED";
            case AWSIoTDomainTypeCustomerManaged:
                return @"CUSTOMER_MANAGED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastStatusChangeDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)serverCertificatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTServerCertificateSummary class]];
}

+ (NSValueTransformer *)serviceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DATA"] == NSOrderedSame) {
            return @(AWSIoTServiceTypeData);
        }
        if ([value caseInsensitiveCompare:@"CREDENTIAL_PROVIDER"] == NSOrderedSame) {
            return @(AWSIoTServiceTypeCredentialProvider);
        }
        if ([value caseInsensitiveCompare:@"JOBS"] == NSOrderedSame) {
            return @(AWSIoTServiceTypeJobs);
        }
        return @(AWSIoTServiceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTServiceTypeData:
                return @"DATA";
            case AWSIoTServiceTypeCredentialProvider:
                return @"CREDENTIAL_PROVIDER";
            case AWSIoTServiceTypeJobs:
                return @"JOBS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTDescribeEndpointRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointType" : @"endpointType",
             };
}

@end

@implementation AWSIoTDescribeEndpointResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointAddress" : @"endpointAddress",
             };
}

@end

@implementation AWSIoTDescribeEventConfigurationsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDescribeEventConfigurationsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"indexName",
             };
}

@end

@implementation AWSIoTDescribeIndexResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"executionNumber" : @"executionNumber",
             @"jobId" : @"jobId",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTDescribeJobExecutionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"jobId",
             };
}

@end

@implementation AWSIoTDescribeJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSIoTDescribeMitigationActionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionName" : @"actionName",
             };
}

@end

@implementation AWSIoTDescribeMitigationActionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionArn" : @"actionArn",
             @"actionId" : @"actionId",
             @"actionName" : @"actionName",
             @"actionParams" : @"actionParams",
             @"actionType" : @"actionType",
             @"creationDate" : @"creationDate",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"roleArn" : @"roleArn",
             };
}

+ (NSValueTransformer *)actionParamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTMitigationActionParams class]];
}

+ (NSValueTransformer *)actionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UPDATE_DEVICE_CERTIFICATE"] == NSOrderedSame) {
            return @(AWSIoTMitigationActionTypeUpdateDeviceCertificate);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_CA_CERTIFICATE"] == NSOrderedSame) {
            return @(AWSIoTMitigationActionTypeUpdateCaCertificate);
        }
        if ([value caseInsensitiveCompare:@"ADD_THINGS_TO_THING_GROUP"] == NSOrderedSame) {
            return @(AWSIoTMitigationActionTypeAddThingsToThingGroup);
        }
        if ([value caseInsensitiveCompare:@"REPLACE_DEFAULT_POLICY_VERSION"] == NSOrderedSame) {
            return @(AWSIoTMitigationActionTypeReplaceDefaultPolicyVersion);
        }
        if ([value caseInsensitiveCompare:@"ENABLE_IOT_LOGGING"] == NSOrderedSame) {
            return @(AWSIoTMitigationActionTypeEnableIotLogging);
        }
        if ([value caseInsensitiveCompare:@"PUBLISH_FINDING_TO_SNS"] == NSOrderedSame) {
            return @(AWSIoTMitigationActionTypePublishFindingToSns);
        }
        return @(AWSIoTMitigationActionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTMitigationActionTypeUpdateDeviceCertificate:
                return @"UPDATE_DEVICE_CERTIFICATE";
            case AWSIoTMitigationActionTypeUpdateCaCertificate:
                return @"UPDATE_CA_CERTIFICATE";
            case AWSIoTMitigationActionTypeAddThingsToThingGroup:
                return @"ADD_THINGS_TO_THING_GROUP";
            case AWSIoTMitigationActionTypeReplaceDefaultPolicyVersion:
                return @"REPLACE_DEFAULT_POLICY_VERSION";
            case AWSIoTMitigationActionTypeEnableIotLogging:
                return @"ENABLE_IOT_LOGGING";
            case AWSIoTMitigationActionTypePublishFindingToSns:
                return @"PUBLISH_FINDING_TO_SNS";
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

@end

@implementation AWSIoTDescribeProvisioningTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateName" : @"templateName",
             };
}

@end

@implementation AWSIoTDescribeProvisioningTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"creationDate",
             @"defaultVersionId" : @"defaultVersionId",
             @"detail" : @"description",
             @"enabled" : @"enabled",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"preProvisioningHook" : @"preProvisioningHook",
             @"provisioningRoleArn" : @"provisioningRoleArn",
             @"templateArn" : @"templateArn",
             @"templateBody" : @"templateBody",
             @"templateName" : @"templateName",
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

+ (NSValueTransformer *)preProvisioningHookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTProvisioningHook class]];
}

@end

@implementation AWSIoTDescribeProvisioningTemplateVersionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateName" : @"templateName",
             @"versionId" : @"versionId",
             };
}

@end

@implementation AWSIoTDescribeProvisioningTemplateVersionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"creationDate",
             @"isDefaultVersion" : @"isDefaultVersion",
             @"templateBody" : @"templateBody",
             @"versionId" : @"versionId",
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

@implementation AWSIoTDescribeRoleAliasRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleAlias" : @"roleAlias",
             };
}

@end

@implementation AWSIoTDescribeRoleAliasResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleAliasDescription" : @"roleAliasDescription",
             };
}

+ (NSValueTransformer *)roleAliasDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTRoleAliasDescription class]];
}

@end

@implementation AWSIoTDescribeScheduledAuditRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduledAuditName" : @"scheduledAuditName",
             };
}

@end

@implementation AWSIoTDescribeScheduledAuditResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dayOfMonth" : @"dayOfMonth",
             @"dayOfWeek" : @"dayOfWeek",
             @"frequency" : @"frequency",
             @"scheduledAuditArn" : @"scheduledAuditArn",
             @"scheduledAuditName" : @"scheduledAuditName",
             @"targetCheckNames" : @"targetCheckNames",
             };
}

+ (NSValueTransformer *)dayOfWeekJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUN"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekSun);
        }
        if ([value caseInsensitiveCompare:@"MON"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekMon);
        }
        if ([value caseInsensitiveCompare:@"TUE"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekTue);
        }
        if ([value caseInsensitiveCompare:@"WED"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekWed);
        }
        if ([value caseInsensitiveCompare:@"THU"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekThu);
        }
        if ([value caseInsensitiveCompare:@"FRI"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekFri);
        }
        if ([value caseInsensitiveCompare:@"SAT"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekSat);
        }
        return @(AWSIoTDayOfWeekUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTDayOfWeekSun:
                return @"SUN";
            case AWSIoTDayOfWeekMon:
                return @"MON";
            case AWSIoTDayOfWeekTue:
                return @"TUE";
            case AWSIoTDayOfWeekWed:
                return @"WED";
            case AWSIoTDayOfWeekThu:
                return @"THU";
            case AWSIoTDayOfWeekFri:
                return @"FRI";
            case AWSIoTDayOfWeekSat:
                return @"SAT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)frequencyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DAILY"] == NSOrderedSame) {
            return @(AWSIoTAuditFrequencyDaily);
        }
        if ([value caseInsensitiveCompare:@"WEEKLY"] == NSOrderedSame) {
            return @(AWSIoTAuditFrequencyWeekly);
        }
        if ([value caseInsensitiveCompare:@"BIWEEKLY"] == NSOrderedSame) {
            return @(AWSIoTAuditFrequencyBiweekly);
        }
        if ([value caseInsensitiveCompare:@"MONTHLY"] == NSOrderedSame) {
            return @(AWSIoTAuditFrequencyMonthly);
        }
        return @(AWSIoTAuditFrequencyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAuditFrequencyDaily:
                return @"DAILY";
            case AWSIoTAuditFrequencyWeekly:
                return @"WEEKLY";
            case AWSIoTAuditFrequencyBiweekly:
                return @"BIWEEKLY";
            case AWSIoTAuditFrequencyMonthly:
                return @"MONTHLY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTDescribeSecurityProfileRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityProfileName" : @"securityProfileName",
             };
}

@end

@implementation AWSIoTDescribeSecurityProfileResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalMetricsToRetain" : @"additionalMetricsToRetain",
             @"additionalMetricsToRetainV2" : @"additionalMetricsToRetainV2",
             @"alertTargets" : @"alertTargets",
             @"behaviors" : @"behaviors",
             @"creationDate" : @"creationDate",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"securityProfileArn" : @"securityProfileArn",
             @"securityProfileDescription" : @"securityProfileDescription",
             @"securityProfileName" : @"securityProfileName",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)additionalMetricsToRetainV2JSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTMetricToRetain class]];
}

+ (NSValueTransformer *)alertTargetsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSIoTAlertTarget class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)behaviorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTBehavior class]];
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

@implementation AWSIoTDescribeStreamRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamId" : @"streamId",
             };
}

@end

@implementation AWSIoTDescribeStreamResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingGroupName" : @"thingGroupName",
             };
}

@end

@implementation AWSIoTDescribeThingGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"indexName",
             @"queryString" : @"queryString",
             @"queryVersion" : @"queryVersion",
             @"status" : @"status",
             @"thingGroupArn" : @"thingGroupArn",
             @"thingGroupId" : @"thingGroupId",
             @"thingGroupMetadata" : @"thingGroupMetadata",
             @"thingGroupName" : @"thingGroupName",
             @"thingGroupProperties" : @"thingGroupProperties",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSIoTDynamicGroupStatusActive);
        }
        if ([value caseInsensitiveCompare:@"BUILDING"] == NSOrderedSame) {
            return @(AWSIoTDynamicGroupStatusBuilding);
        }
        if ([value caseInsensitiveCompare:@"REBUILDING"] == NSOrderedSame) {
            return @(AWSIoTDynamicGroupStatusRebuilding);
        }
        return @(AWSIoTDynamicGroupStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTDynamicGroupStatusActive:
                return @"ACTIVE";
            case AWSIoTDynamicGroupStatusBuilding:
                return @"BUILDING";
            case AWSIoTDynamicGroupStatusRebuilding:
                return @"REBUILDING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)thingGroupMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTThingGroupMetadata class]];
}

+ (NSValueTransformer *)thingGroupPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTThingGroupProperties class]];
}

@end

@implementation AWSIoTDescribeThingRegistrationTaskRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSIoTDescribeThingRegistrationTaskResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTDescribeThingResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"attributes",
             @"billingGroupName" : @"billingGroupName",
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingTypeName" : @"thingTypeName",
             };
}

@end

@implementation AWSIoTDescribeThingTypeResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSIoTDestination

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Destination" : @"s3Destination",
             };
}

+ (NSValueTransformer *)s3DestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTS3Destination class]];
}

@end

@implementation AWSIoTDetachPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             @"target" : @"target",
             };
}

@end

@implementation AWSIoTDetachPrincipalPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             @"principal" : @"principal",
             };
}

@end

@implementation AWSIoTDetachSecurityProfileRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityProfileName" : @"securityProfileName",
             @"securityProfileTargetArn" : @"securityProfileTargetArn",
             };
}

@end

@implementation AWSIoTDetachSecurityProfileResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDetachThingPrincipalRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"principal" : @"principal",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTDetachThingPrincipalResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTDetectMitigationActionExecution

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionName" : @"actionName",
             @"errorCode" : @"errorCode",
             @"executionEndDate" : @"executionEndDate",
             @"executionStartDate" : @"executionStartDate",
             @"message" : @"message",
             @"status" : @"status",
             @"taskId" : @"taskId",
             @"thingName" : @"thingName",
             @"violationId" : @"violationId",
             };
}

+ (NSValueTransformer *)executionEndDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)executionStartDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTDetectMitigationActionExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSIoTDetectMitigationActionExecutionStatusSuccessful);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSIoTDetectMitigationActionExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"SKIPPED"] == NSOrderedSame) {
            return @(AWSIoTDetectMitigationActionExecutionStatusSkipped);
        }
        return @(AWSIoTDetectMitigationActionExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTDetectMitigationActionExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSIoTDetectMitigationActionExecutionStatusSuccessful:
                return @"SUCCESSFUL";
            case AWSIoTDetectMitigationActionExecutionStatusFailed:
                return @"FAILED";
            case AWSIoTDetectMitigationActionExecutionStatusSkipped:
                return @"SKIPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTDetectMitigationActionsTaskStatistics

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionsExecuted" : @"actionsExecuted",
             @"actionsFailed" : @"actionsFailed",
             @"actionsSkipped" : @"actionsSkipped",
             };
}

@end

@implementation AWSIoTDetectMitigationActionsTaskSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionsDefinition" : @"actionsDefinition",
             @"onlyActiveViolationsIncluded" : @"onlyActiveViolationsIncluded",
             @"suppressedAlertsIncluded" : @"suppressedAlertsIncluded",
             @"target" : @"target",
             @"taskEndTime" : @"taskEndTime",
             @"taskId" : @"taskId",
             @"taskStartTime" : @"taskStartTime",
             @"taskStatistics" : @"taskStatistics",
             @"taskStatus" : @"taskStatus",
             @"violationEventOccurrenceRange" : @"violationEventOccurrenceRange",
             };
}

+ (NSValueTransformer *)actionsDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTMitigationAction class]];
}

+ (NSValueTransformer *)targetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTDetectMitigationActionsTaskTarget class]];
}

+ (NSValueTransformer *)taskEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)taskStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)taskStatisticsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTDetectMitigationActionsTaskStatistics class]];
}

+ (NSValueTransformer *)taskStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTDetectMitigationActionsTaskStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSIoTDetectMitigationActionsTaskStatusSuccessful);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSIoTDetectMitigationActionsTaskStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSIoTDetectMitigationActionsTaskStatusCanceled);
        }
        return @(AWSIoTDetectMitigationActionsTaskStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTDetectMitigationActionsTaskStatusInProgress:
                return @"IN_PROGRESS";
            case AWSIoTDetectMitigationActionsTaskStatusSuccessful:
                return @"SUCCESSFUL";
            case AWSIoTDetectMitigationActionsTaskStatusFailed:
                return @"FAILED";
            case AWSIoTDetectMitigationActionsTaskStatusCanceled:
                return @"CANCELED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)violationEventOccurrenceRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTViolationEventOccurrenceRange class]];
}

@end

@implementation AWSIoTDetectMitigationActionsTaskTarget

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"behaviorName" : @"behaviorName",
             @"securityProfileName" : @"securityProfileName",
             @"violationIds" : @"violationIds",
             };
}

@end

@implementation AWSIoTDisableTopicRuleRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleName" : @"ruleName",
             };
}

@end

@implementation AWSIoTDomainConfigurationSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainConfigurationArn" : @"domainConfigurationArn",
             @"domainConfigurationName" : @"domainConfigurationName",
             @"serviceType" : @"serviceType",
             };
}

+ (NSValueTransformer *)serviceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DATA"] == NSOrderedSame) {
            return @(AWSIoTServiceTypeData);
        }
        if ([value caseInsensitiveCompare:@"CREDENTIAL_PROVIDER"] == NSOrderedSame) {
            return @(AWSIoTServiceTypeCredentialProvider);
        }
        if ([value caseInsensitiveCompare:@"JOBS"] == NSOrderedSame) {
            return @(AWSIoTServiceTypeJobs);
        }
        return @(AWSIoTServiceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTServiceTypeData:
                return @"DATA";
            case AWSIoTServiceTypeCredentialProvider:
                return @"CREDENTIAL_PROVIDER";
            case AWSIoTServiceTypeJobs:
                return @"JOBS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTDynamoDBAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyArn" : @"policyArn",
             @"policyDocument" : @"policyDocument",
             @"policyName" : @"policyName",
             };
}

@end

@implementation AWSIoTElasticsearchAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSIoTEnableIoTLoggingParams

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logLevel" : @"logLevel",
             @"roleArnForLogging" : @"roleArnForLogging",
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

@implementation AWSIoTEnableTopicRuleRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleName" : @"ruleName",
             };
}

@end

@implementation AWSIoTErrorInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"code",
             @"message" : @"message",
             };
}

@end

@implementation AWSIoTExplicitDeny

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policies" : @"policies",
             };
}

+ (NSValueTransformer *)policiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTPolicy class]];
}

@end

@implementation AWSIoTExponentialRolloutRate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baseRatePerMinute" : @"baseRatePerMinute",
             @"incrementFactor" : @"incrementFactor",
             @"rateIncreaseCriteria" : @"rateIncreaseCriteria",
             };
}

+ (NSValueTransformer *)rateIncreaseCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTRateIncreaseCriteria class]];
}

@end

@implementation AWSIoTField

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Number"] == NSOrderedSame) {
            return @(AWSIoTFieldTypeNumber);
        }
        if ([value caseInsensitiveCompare:@"String"] == NSOrderedSame) {
            return @(AWSIoTFieldTypeString);
        }
        if ([value caseInsensitiveCompare:@"Boolean"] == NSOrderedSame) {
            return @(AWSIoTFieldTypeBoolean);
        }
        return @(AWSIoTFieldTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTFieldTypeNumber:
                return @"Number";
            case AWSIoTFieldTypeString:
                return @"String";
            case AWSIoTFieldTypeBoolean:
                return @"Boolean";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTFileLocation

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Location" : @"s3Location",
             @"stream" : @"stream",
             };
}

+ (NSValueTransformer *)s3LocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTS3Location class]];
}

+ (NSValueTransformer *)streamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTStream class]];
}

@end

@implementation AWSIoTFirehoseAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchMode" : @"batchMode",
             @"deliveryStreamName" : @"deliveryStreamName",
             @"roleArn" : @"roleArn",
             @"separator" : @"separator",
             };
}

@end

@implementation AWSIoTGetBehaviorModelTrainingSummariesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"securityProfileName" : @"securityProfileName",
             };
}

@end

@implementation AWSIoTGetBehaviorModelTrainingSummariesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"summaries" : @"summaries",
             };
}

+ (NSValueTransformer *)summariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTBehaviorModelTrainingSummary class]];
}

@end

@implementation AWSIoTGetCardinalityRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aggregationField" : @"aggregationField",
             @"indexName" : @"indexName",
             @"queryString" : @"queryString",
             @"queryVersion" : @"queryVersion",
             };
}

@end

@implementation AWSIoTGetCardinalityResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cardinality" : @"cardinality",
             };
}

@end

@implementation AWSIoTGetEffectivePoliciesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cognitoIdentityPoolId" : @"cognitoIdentityPoolId",
             @"principal" : @"principal",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTGetEffectivePoliciesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTGetIndexingConfigurationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingGroupIndexingConfiguration" : @"thingGroupIndexingConfiguration",
             @"thingIndexingConfiguration" : @"thingIndexingConfiguration",
             };
}

+ (NSValueTransformer *)thingGroupIndexingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTThingGroupIndexingConfiguration class]];
}

+ (NSValueTransformer *)thingIndexingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTThingIndexingConfiguration class]];
}

@end

@implementation AWSIoTGetJobDocumentRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"jobId",
             };
}

@end

@implementation AWSIoTGetJobDocumentResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"document" : @"document",
             };
}

@end

@implementation AWSIoTGetLoggingOptionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTGetLoggingOptionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"otaUpdateId" : @"otaUpdateId",
             };
}

@end

@implementation AWSIoTGetOTAUpdateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"otaUpdateInfo" : @"otaUpdateInfo",
             };
}

+ (NSValueTransformer *)otaUpdateInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTOTAUpdateInfo class]];
}

@end

@implementation AWSIoTGetPercentilesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aggregationField" : @"aggregationField",
             @"indexName" : @"indexName",
             @"percents" : @"percents",
             @"queryString" : @"queryString",
             @"queryVersion" : @"queryVersion",
             };
}

@end

@implementation AWSIoTGetPercentilesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"percentiles" : @"percentiles",
             };
}

+ (NSValueTransformer *)percentilesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTPercentPair class]];
}

@end

@implementation AWSIoTGetPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             };
}

@end

@implementation AWSIoTGetPolicyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             @"policyVersionId" : @"policyVersionId",
             };
}

@end

@implementation AWSIoTGetPolicyVersionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTGetRegistrationCodeResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registrationCode" : @"registrationCode",
             };
}

@end

@implementation AWSIoTGetStatisticsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aggregationField" : @"aggregationField",
             @"indexName" : @"indexName",
             @"queryString" : @"queryString",
             @"queryVersion" : @"queryVersion",
             };
}

@end

@implementation AWSIoTGetStatisticsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"statistics" : @"statistics",
             };
}

+ (NSValueTransformer *)statisticsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTStatistics class]];
}

@end

@implementation AWSIoTGetTopicRuleDestinationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             };
}

@end

@implementation AWSIoTGetTopicRuleDestinationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"topicRuleDestination" : @"topicRuleDestination",
             };
}

+ (NSValueTransformer *)topicRuleDestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTTopicRuleDestination class]];
}

@end

@implementation AWSIoTGetTopicRuleRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ruleName" : @"ruleName",
             };
}

@end

@implementation AWSIoTGetTopicRuleResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTGetV2LoggingOptionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupArn" : @"groupArn",
             @"groupName" : @"groupName",
             };
}

@end

@implementation AWSIoTHttpAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"auth" : @"auth",
             @"confirmationUrl" : @"confirmationUrl",
             @"headers" : @"headers",
             @"url" : @"url",
             };
}

+ (NSValueTransformer *)authJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTHttpAuthorization class]];
}

+ (NSValueTransformer *)headersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTHttpActionHeader class]];
}

@end

@implementation AWSIoTHttpActionHeader

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

@end

@implementation AWSIoTHttpAuthorization

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sigv4" : @"sigv4",
             };
}

+ (NSValueTransformer *)sigv4JSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTSigV4Authorization class]];
}

@end

@implementation AWSIoTHttpContext

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"headers" : @"headers",
             @"queryString" : @"queryString",
             };
}

@end

@implementation AWSIoTHttpUrlDestinationConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confirmationUrl" : @"confirmationUrl",
             };
}

@end

@implementation AWSIoTHttpUrlDestinationProperties

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confirmationUrl" : @"confirmationUrl",
             };
}

@end

@implementation AWSIoTHttpUrlDestinationSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confirmationUrl" : @"confirmationUrl",
             };
}

@end

@implementation AWSIoTImplicitDeny

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchMode" : @"batchMode",
             @"channelArn" : @"channelArn",
             @"channelName" : @"channelName",
             @"roleArn" : @"roleArn",
             };
}

@end

@implementation AWSIoTIotEventsAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchMode" : @"batchMode",
             @"inputName" : @"inputName",
             @"messageId" : @"messageId",
             @"roleArn" : @"roleArn",
             };
}

@end

@implementation AWSIoTIotSiteWiseAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"putAssetPropertyValueEntries" : @"putAssetPropertyValueEntries",
             @"roleArn" : @"roleArn",
             };
}

+ (NSValueTransformer *)putAssetPropertyValueEntriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTPutAssetPropertyValueEntry class]];
}

@end

@implementation AWSIoTJob

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"abortConfig" : @"abortConfig",
             @"comment" : @"comment",
             @"completedAt" : @"completedAt",
             @"createdAt" : @"createdAt",
             @"detail" : @"description",
             @"forceCanceled" : @"forceCanceled",
             @"jobArn" : @"jobArn",
             @"jobExecutionsRolloutConfig" : @"jobExecutionsRolloutConfig",
             @"jobId" : @"jobId",
             @"jobProcessDetails" : @"jobProcessDetails",
             @"lastUpdatedAt" : @"lastUpdatedAt",
             @"namespaceId" : @"namespaceId",
             @"presignedUrlConfig" : @"presignedUrlConfig",
             @"reasonCode" : @"reasonCode",
             @"status" : @"status",
             @"targetSelection" : @"targetSelection",
             @"targets" : @"targets",
             @"timeoutConfig" : @"timeoutConfig",
             };
}

+ (NSValueTransformer *)abortConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAbortConfig class]];
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

+ (NSValueTransformer *)timeoutConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTTimeoutConfig class]];
}

@end

@implementation AWSIoTJobExecution

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approximateSecondsBeforeTimedOut" : @"approximateSecondsBeforeTimedOut",
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
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusTimedOut);
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
            case AWSIoTJobExecutionStatusTimedOut:
                return @"TIMED_OUT";
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detailsMap" : @"detailsMap",
             };
}

@end

@implementation AWSIoTJobExecutionSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusTimedOut);
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
            case AWSIoTJobExecutionStatusTimedOut:
                return @"TIMED_OUT";
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exponentialRate" : @"exponentialRate",
             @"maximumPerMinute" : @"maximumPerMinute",
             };
}

+ (NSValueTransformer *)exponentialRateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTExponentialRolloutRate class]];
}

@end

@implementation AWSIoTJobProcessDetails

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"numberOfCanceledThings" : @"numberOfCanceledThings",
             @"numberOfFailedThings" : @"numberOfFailedThings",
             @"numberOfInProgressThings" : @"numberOfInProgressThings",
             @"numberOfQueuedThings" : @"numberOfQueuedThings",
             @"numberOfRejectedThings" : @"numberOfRejectedThings",
             @"numberOfRemovedThings" : @"numberOfRemovedThings",
             @"numberOfSucceededThings" : @"numberOfSucceededThings",
             @"numberOfTimedOutThings" : @"numberOfTimedOutThings",
             @"processingTargets" : @"processingTargets",
             };
}

@end

@implementation AWSIoTJobSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSIoTKafkaAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientProperties" : @"clientProperties",
             @"destinationArn" : @"destinationArn",
             @"key" : @"key",
             @"partition" : @"partition",
             @"topic" : @"topic",
             };
}

@end

@implementation AWSIoTKeyPair

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"privateKey" : @"PrivateKey",
             @"publicKey" : @"PublicKey",
             };
}

@end

@implementation AWSIoTKinesisAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"partitionKey" : @"partitionKey",
             @"roleArn" : @"roleArn",
             @"streamName" : @"streamName",
             };
}

@end

@implementation AWSIoTLambdaAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionArn" : @"functionArn",
             };
}

@end

@implementation AWSIoTListActiveViolationsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"behaviorCriteriaType" : @"behaviorCriteriaType",
             @"listSuppressedAlerts" : @"listSuppressedAlerts",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"securityProfileName" : @"securityProfileName",
             @"thingName" : @"thingName",
             };
}

+ (NSValueTransformer *)behaviorCriteriaTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STATIC"] == NSOrderedSame) {
            return @(AWSIoTBehaviorCriteriaTypeStatic);
        }
        if ([value caseInsensitiveCompare:@"STATISTICAL"] == NSOrderedSame) {
            return @(AWSIoTBehaviorCriteriaTypeStatistical);
        }
        if ([value caseInsensitiveCompare:@"MACHINE_LEARNING"] == NSOrderedSame) {
            return @(AWSIoTBehaviorCriteriaTypeMachineLearning);
        }
        return @(AWSIoTBehaviorCriteriaTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTBehaviorCriteriaTypeStatic:
                return @"STATIC";
            case AWSIoTBehaviorCriteriaTypeStatistical:
                return @"STATISTICAL";
            case AWSIoTBehaviorCriteriaTypeMachineLearning:
                return @"MACHINE_LEARNING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTListActiveViolationsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activeViolations" : @"activeViolations",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)activeViolationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTActiveViolation class]];
}

@end

@implementation AWSIoTListAttachedPoliciesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSIoTListAuditFindingsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkName" : @"checkName",
             @"endTime" : @"endTime",
             @"listSuppressedFindings" : @"listSuppressedFindings",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"resourceIdentifier" : @"resourceIdentifier",
             @"startTime" : @"startTime",
             @"taskId" : @"taskId",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)resourceIdentifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTResourceIdentifier class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSIoTListAuditFindingsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findings" : @"findings",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)findingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTAuditFinding class]];
}

@end

@implementation AWSIoTListAuditMitigationActionsExecutionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionStatus" : @"actionStatus",
             @"findingId" : @"findingId",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"taskId" : @"taskId",
             };
}

+ (NSValueTransformer *)actionStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTAuditMitigationActionsExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSIoTAuditMitigationActionsExecutionStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSIoTAuditMitigationActionsExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSIoTAuditMitigationActionsExecutionStatusCanceled);
        }
        if ([value caseInsensitiveCompare:@"SKIPPED"] == NSOrderedSame) {
            return @(AWSIoTAuditMitigationActionsExecutionStatusSkipped);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSIoTAuditMitigationActionsExecutionStatusPending);
        }
        return @(AWSIoTAuditMitigationActionsExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAuditMitigationActionsExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSIoTAuditMitigationActionsExecutionStatusCompleted:
                return @"COMPLETED";
            case AWSIoTAuditMitigationActionsExecutionStatusFailed:
                return @"FAILED";
            case AWSIoTAuditMitigationActionsExecutionStatusCanceled:
                return @"CANCELED";
            case AWSIoTAuditMitigationActionsExecutionStatusSkipped:
                return @"SKIPPED";
            case AWSIoTAuditMitigationActionsExecutionStatusPending:
                return @"PENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTListAuditMitigationActionsExecutionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionsExecutions" : @"actionsExecutions",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)actionsExecutionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTAuditMitigationActionExecutionMetadata class]];
}

@end

@implementation AWSIoTListAuditMitigationActionsTasksRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"auditTaskId" : @"auditTaskId",
             @"endTime" : @"endTime",
             @"findingId" : @"findingId",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"startTime" : @"startTime",
             @"taskStatus" : @"taskStatus",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)taskStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTAuditMitigationActionsTaskStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSIoTAuditMitigationActionsTaskStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSIoTAuditMitigationActionsTaskStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSIoTAuditMitigationActionsTaskStatusCanceled);
        }
        return @(AWSIoTAuditMitigationActionsTaskStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAuditMitigationActionsTaskStatusInProgress:
                return @"IN_PROGRESS";
            case AWSIoTAuditMitigationActionsTaskStatusCompleted:
                return @"COMPLETED";
            case AWSIoTAuditMitigationActionsTaskStatusFailed:
                return @"FAILED";
            case AWSIoTAuditMitigationActionsTaskStatusCanceled:
                return @"CANCELED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTListAuditMitigationActionsTasksResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"tasks" : @"tasks",
             };
}

+ (NSValueTransformer *)tasksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTAuditMitigationActionsTaskMetadata class]];
}

@end

@implementation AWSIoTListAuditSuppressionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ascendingOrder" : @"ascendingOrder",
             @"checkName" : @"checkName",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"resourceIdentifier" : @"resourceIdentifier",
             };
}

+ (NSValueTransformer *)resourceIdentifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTResourceIdentifier class]];
}

@end

@implementation AWSIoTListAuditSuppressionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"suppressions" : @"suppressions",
             };
}

+ (NSValueTransformer *)suppressionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTAuditSuppression class]];
}

@end

@implementation AWSIoTListAuditTasksRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"endTime",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"startTime" : @"startTime",
             @"taskStatus" : @"taskStatus",
             @"taskType" : @"taskType",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)taskStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTAuditTaskStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSIoTAuditTaskStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSIoTAuditTaskStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSIoTAuditTaskStatusCanceled);
        }
        return @(AWSIoTAuditTaskStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAuditTaskStatusInProgress:
                return @"IN_PROGRESS";
            case AWSIoTAuditTaskStatusCompleted:
                return @"COMPLETED";
            case AWSIoTAuditTaskStatusFailed:
                return @"FAILED";
            case AWSIoTAuditTaskStatusCanceled:
                return @"CANCELED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taskTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ON_DEMAND_AUDIT_TASK"] == NSOrderedSame) {
            return @(AWSIoTAuditTaskTypeOnDemandAuditTask);
        }
        if ([value caseInsensitiveCompare:@"SCHEDULED_AUDIT_TASK"] == NSOrderedSame) {
            return @(AWSIoTAuditTaskTypeScheduledAuditTask);
        }
        return @(AWSIoTAuditTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAuditTaskTypeOnDemandAuditTask:
                return @"ON_DEMAND_AUDIT_TASK";
            case AWSIoTAuditTaskTypeScheduledAuditTask:
                return @"SCHEDULED_AUDIT_TASK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTListAuditTasksResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"tasks" : @"tasks",
             };
}

+ (NSValueTransformer *)tasksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTAuditTaskMetadata class]];
}

@end

@implementation AWSIoTListAuthorizersRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSIoTListBillingGroupsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"namePrefixFilter" : @"namePrefixFilter",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIoTListBillingGroupsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"billingGroups" : @"billingGroups",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)billingGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTGroupNameAndArn class]];
}

@end

@implementation AWSIoTListCACertificatesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ascendingOrder" : @"ascendingOrder",
             @"marker" : @"marker",
             @"pageSize" : @"pageSize",
             };
}

@end

@implementation AWSIoTListCACertificatesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ascendingOrder" : @"ascendingOrder",
             @"marker" : @"marker",
             @"pageSize" : @"pageSize",
             };
}

@end

@implementation AWSIoTListCertificatesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSIoTListCustomMetricsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIoTListCustomMetricsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricNames" : @"metricNames",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIoTListDetectMitigationActionsExecutionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"endTime",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"startTime" : @"startTime",
             @"taskId" : @"taskId",
             @"thingName" : @"thingName",
             @"violationId" : @"violationId",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSIoTListDetectMitigationActionsExecutionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionsExecutions" : @"actionsExecutions",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)actionsExecutionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTDetectMitigationActionExecution class]];
}

@end

@implementation AWSIoTListDetectMitigationActionsTasksRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"endTime",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"startTime" : @"startTime",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSIoTListDetectMitigationActionsTasksResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"tasks" : @"tasks",
             };
}

+ (NSValueTransformer *)tasksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTDetectMitigationActionsTaskSummary class]];
}

@end

@implementation AWSIoTListDimensionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIoTListDimensionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensionNames" : @"dimensionNames",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIoTListDomainConfigurationsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"marker",
             @"pageSize" : @"pageSize",
             @"serviceType" : @"serviceType",
             };
}

+ (NSValueTransformer *)serviceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DATA"] == NSOrderedSame) {
            return @(AWSIoTServiceTypeData);
        }
        if ([value caseInsensitiveCompare:@"CREDENTIAL_PROVIDER"] == NSOrderedSame) {
            return @(AWSIoTServiceTypeCredentialProvider);
        }
        if ([value caseInsensitiveCompare:@"JOBS"] == NSOrderedSame) {
            return @(AWSIoTServiceTypeJobs);
        }
        return @(AWSIoTServiceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTServiceTypeData:
                return @"DATA";
            case AWSIoTServiceTypeCredentialProvider:
                return @"CREDENTIAL_PROVIDER";
            case AWSIoTServiceTypeJobs:
                return @"JOBS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTListDomainConfigurationsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainConfigurations" : @"domainConfigurations",
             @"nextMarker" : @"nextMarker",
             };
}

+ (NSValueTransformer *)domainConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTDomainConfigurationSummary class]];
}

@end

@implementation AWSIoTListIndicesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIoTListIndicesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexNames" : @"indexNames",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIoTListJobExecutionsForJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusTimedOut);
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
            case AWSIoTJobExecutionStatusTimedOut:
                return @"TIMED_OUT";
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"namespaceId" : @"namespaceId",
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
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSIoTJobExecutionStatusTimedOut);
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
            case AWSIoTJobExecutionStatusTimedOut:
                return @"TIMED_OUT";
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"namespaceId" : @"namespaceId",
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSIoTListMitigationActionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionType" : @"actionType",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)actionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UPDATE_DEVICE_CERTIFICATE"] == NSOrderedSame) {
            return @(AWSIoTMitigationActionTypeUpdateDeviceCertificate);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_CA_CERTIFICATE"] == NSOrderedSame) {
            return @(AWSIoTMitigationActionTypeUpdateCaCertificate);
        }
        if ([value caseInsensitiveCompare:@"ADD_THINGS_TO_THING_GROUP"] == NSOrderedSame) {
            return @(AWSIoTMitigationActionTypeAddThingsToThingGroup);
        }
        if ([value caseInsensitiveCompare:@"REPLACE_DEFAULT_POLICY_VERSION"] == NSOrderedSame) {
            return @(AWSIoTMitigationActionTypeReplaceDefaultPolicyVersion);
        }
        if ([value caseInsensitiveCompare:@"ENABLE_IOT_LOGGING"] == NSOrderedSame) {
            return @(AWSIoTMitigationActionTypeEnableIotLogging);
        }
        if ([value caseInsensitiveCompare:@"PUBLISH_FINDING_TO_SNS"] == NSOrderedSame) {
            return @(AWSIoTMitigationActionTypePublishFindingToSns);
        }
        return @(AWSIoTMitigationActionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTMitigationActionTypeUpdateDeviceCertificate:
                return @"UPDATE_DEVICE_CERTIFICATE";
            case AWSIoTMitigationActionTypeUpdateCaCertificate:
                return @"UPDATE_CA_CERTIFICATE";
            case AWSIoTMitigationActionTypeAddThingsToThingGroup:
                return @"ADD_THINGS_TO_THING_GROUP";
            case AWSIoTMitigationActionTypeReplaceDefaultPolicyVersion:
                return @"REPLACE_DEFAULT_POLICY_VERSION";
            case AWSIoTMitigationActionTypeEnableIotLogging:
                return @"ENABLE_IOT_LOGGING";
            case AWSIoTMitigationActionTypePublishFindingToSns:
                return @"PUBLISH_FINDING_TO_SNS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTListMitigationActionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionIdentifiers" : @"actionIdentifiers",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)actionIdentifiersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTMitigationActionIdentifier class]];
}

@end

@implementation AWSIoTListOTAUpdatesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ascendingOrder" : @"ascendingOrder",
             @"marker" : @"marker",
             @"pageSize" : @"pageSize",
             };
}

@end

@implementation AWSIoTListOutgoingCertificatesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ascendingOrder" : @"ascendingOrder",
             @"marker" : @"marker",
             @"pageSize" : @"pageSize",
             };
}

@end

@implementation AWSIoTListPoliciesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"nextMarker",
             @"principals" : @"principals",
             };
}

@end

@implementation AWSIoTListPolicyVersionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             };
}

@end

@implementation AWSIoTListPolicyVersionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"principal" : @"principal",
             };
}

@end

@implementation AWSIoTListPrincipalThingsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"things" : @"things",
             };
}

@end

@implementation AWSIoTListProvisioningTemplateVersionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"templateName" : @"templateName",
             };
}

@end

@implementation AWSIoTListProvisioningTemplateVersionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"versions" : @"versions",
             };
}

+ (NSValueTransformer *)versionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTProvisioningTemplateVersionSummary class]];
}

@end

@implementation AWSIoTListProvisioningTemplatesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIoTListProvisioningTemplatesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"templates" : @"templates",
             };
}

+ (NSValueTransformer *)templatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTProvisioningTemplateSummary class]];
}

@end

@implementation AWSIoTListRoleAliasesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ascendingOrder" : @"ascendingOrder",
             @"marker" : @"marker",
             @"pageSize" : @"pageSize",
             };
}

@end

@implementation AWSIoTListRoleAliasesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"nextMarker",
             @"roleAliases" : @"roleAliases",
             };
}

@end

@implementation AWSIoTListScheduledAuditsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIoTListScheduledAuditsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"scheduledAudits" : @"scheduledAudits",
             };
}

+ (NSValueTransformer *)scheduledAuditsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTScheduledAuditMetadata class]];
}

@end

@implementation AWSIoTListSecurityProfilesForTargetRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"recursive" : @"recursive",
             @"securityProfileTargetArn" : @"securityProfileTargetArn",
             };
}

@end

@implementation AWSIoTListSecurityProfilesForTargetResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"securityProfileTargetMappings" : @"securityProfileTargetMappings",
             };
}

+ (NSValueTransformer *)securityProfileTargetMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTSecurityProfileTargetMapping class]];
}

@end

@implementation AWSIoTListSecurityProfilesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensionName" : @"dimensionName",
             @"maxResults" : @"maxResults",
             @"metricName" : @"metricName",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIoTListSecurityProfilesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"securityProfileIdentifiers" : @"securityProfileIdentifiers",
             };
}

+ (NSValueTransformer *)securityProfileIdentifiersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTSecurityProfileIdentifier class]];
}

@end

@implementation AWSIoTListStreamsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ascendingOrder" : @"ascendingOrder",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIoTListStreamsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSIoTListTagsForResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSIoTListTagsForResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTTag class]];
}

@end

@implementation AWSIoTListTargetsForPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"marker",
             @"pageSize" : @"pageSize",
             @"policyName" : @"policyName",
             };
}

@end

@implementation AWSIoTListTargetsForPolicyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"nextMarker",
             @"targets" : @"targets",
             };
}

@end

@implementation AWSIoTListTargetsForSecurityProfileRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"securityProfileName" : @"securityProfileName",
             };
}

@end

@implementation AWSIoTListTargetsForSecurityProfileResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"securityProfileTargets" : @"securityProfileTargets",
             };
}

+ (NSValueTransformer *)securityProfileTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTSecurityProfileTarget class]];
}

@end

@implementation AWSIoTListThingGroupsForThingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTListThingGroupsForThingResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTListThingPrincipalsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"principals" : @"principals",
             };
}

@end

@implementation AWSIoTListThingRegistrationTaskReportsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"taskIds" : @"taskIds",
             };
}

@end

@implementation AWSIoTListThingTypesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"thingTypeName" : @"thingTypeName",
             };
}

@end

@implementation AWSIoTListThingTypesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSIoTListThingsInBillingGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"billingGroupName" : @"billingGroupName",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIoTListThingsInBillingGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"things" : @"things",
             };
}

@end

@implementation AWSIoTListThingsInThingGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"things" : @"things",
             };
}

@end

@implementation AWSIoTListThingsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSIoTListTopicRuleDestinationsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIoTListTopicRuleDestinationsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationSummaries" : @"destinationSummaries",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)destinationSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTTopicRuleDestinationSummary class]];
}

@end

@implementation AWSIoTListTopicRulesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSIoTListViolationEventsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"behaviorCriteriaType" : @"behaviorCriteriaType",
             @"endTime" : @"endTime",
             @"listSuppressedAlerts" : @"listSuppressedAlerts",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"securityProfileName" : @"securityProfileName",
             @"startTime" : @"startTime",
             @"thingName" : @"thingName",
             };
}

+ (NSValueTransformer *)behaviorCriteriaTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STATIC"] == NSOrderedSame) {
            return @(AWSIoTBehaviorCriteriaTypeStatic);
        }
        if ([value caseInsensitiveCompare:@"STATISTICAL"] == NSOrderedSame) {
            return @(AWSIoTBehaviorCriteriaTypeStatistical);
        }
        if ([value caseInsensitiveCompare:@"MACHINE_LEARNING"] == NSOrderedSame) {
            return @(AWSIoTBehaviorCriteriaTypeMachineLearning);
        }
        return @(AWSIoTBehaviorCriteriaTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTBehaviorCriteriaTypeStatic:
                return @"STATIC";
            case AWSIoTBehaviorCriteriaTypeStatistical:
                return @"STATISTICAL";
            case AWSIoTBehaviorCriteriaTypeMachineLearning:
                return @"MACHINE_LEARNING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSIoTListViolationEventsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"violationEvents" : @"violationEvents",
             };
}

+ (NSValueTransformer *)violationEventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTViolationEvent class]];
}

@end

@implementation AWSIoTLogTarget

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSIoTMachineLearningDetectionConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidenceLevel" : @"confidenceLevel",
             };
}

+ (NSValueTransformer *)confidenceLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSIoTConfidenceLevelLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSIoTConfidenceLevelMedium);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSIoTConfidenceLevelHigh);
        }
        return @(AWSIoTConfidenceLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTConfidenceLevelLow:
                return @"LOW";
            case AWSIoTConfidenceLevelMedium:
                return @"MEDIUM";
            case AWSIoTConfidenceLevelHigh:
                return @"HIGH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTMetricDimension

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensionName" : @"dimensionName",
             @"operatorValue" : @"operator",
             };
}

+ (NSValueTransformer *)operatorValueJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN"] == NSOrderedSame) {
            return @(AWSIoTDimensionValueOperatorIN);
        }
        if ([value caseInsensitiveCompare:@"NOT_IN"] == NSOrderedSame) {
            return @(AWSIoTDimensionValueOperatorNotIn);
        }
        return @(AWSIoTDimensionValueOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTDimensionValueOperatorIN:
                return @"IN";
            case AWSIoTDimensionValueOperatorNotIn:
                return @"NOT_IN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTMetricToRetain

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metric" : @"metric",
             @"metricDimension" : @"metricDimension",
             };
}

+ (NSValueTransformer *)metricDimensionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTMetricDimension class]];
}

@end

@implementation AWSIoTMetricValue

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidrs" : @"cidrs",
             @"count" : @"count",
             @"number" : @"number",
             @"numbers" : @"numbers",
             @"ports" : @"ports",
             @"strings" : @"strings",
             };
}

@end

@implementation AWSIoTMitigationAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionParams" : @"actionParams",
             @"identifier" : @"id",
             @"name" : @"name",
             @"roleArn" : @"roleArn",
             };
}

+ (NSValueTransformer *)actionParamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTMitigationActionParams class]];
}

@end

@implementation AWSIoTMitigationActionIdentifier

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionArn" : @"actionArn",
             @"actionName" : @"actionName",
             @"creationDate" : @"creationDate",
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

@implementation AWSIoTMitigationActionParams

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addThingsToThingGroupParams" : @"addThingsToThingGroupParams",
             @"enableIoTLoggingParams" : @"enableIoTLoggingParams",
             @"publishFindingToSnsParams" : @"publishFindingToSnsParams",
             @"replaceDefaultPolicyVersionParams" : @"replaceDefaultPolicyVersionParams",
             @"updateCACertificateParams" : @"updateCACertificateParams",
             @"updateDeviceCertificateParams" : @"updateDeviceCertificateParams",
             };
}

+ (NSValueTransformer *)addThingsToThingGroupParamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAddThingsToThingGroupParams class]];
}

+ (NSValueTransformer *)enableIoTLoggingParamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTEnableIoTLoggingParams class]];
}

+ (NSValueTransformer *)publishFindingToSnsParamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTPublishFindingToSnsParams class]];
}

+ (NSValueTransformer *)replaceDefaultPolicyVersionParamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTReplaceDefaultPolicyVersionParams class]];
}

+ (NSValueTransformer *)updateCACertificateParamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTUpdateCACertificateParams class]];
}

+ (NSValueTransformer *)updateDeviceCertificateParamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTUpdateDeviceCertificateParams class]];
}

@end

@implementation AWSIoTMqttContext

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"clientId",
             @"password" : @"password",
             @"username" : @"username",
             };
}

@end

@implementation AWSIoTNonCompliantResource

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalInfo" : @"additionalInfo",
             @"resourceIdentifier" : @"resourceIdentifier",
             @"resourceType" : @"resourceType",
             };
}

+ (NSValueTransformer *)resourceIdentifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTResourceIdentifier class]];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEVICE_CERTIFICATE"] == NSOrderedSame) {
            return @(AWSIoTResourceTypeDeviceCertificate);
        }
        if ([value caseInsensitiveCompare:@"CA_CERTIFICATE"] == NSOrderedSame) {
            return @(AWSIoTResourceTypeCaCertificate);
        }
        if ([value caseInsensitiveCompare:@"IOT_POLICY"] == NSOrderedSame) {
            return @(AWSIoTResourceTypeIotPolicy);
        }
        if ([value caseInsensitiveCompare:@"COGNITO_IDENTITY_POOL"] == NSOrderedSame) {
            return @(AWSIoTResourceTypeCognitoIdentityPool);
        }
        if ([value caseInsensitiveCompare:@"CLIENT_ID"] == NSOrderedSame) {
            return @(AWSIoTResourceTypeClientId);
        }
        if ([value caseInsensitiveCompare:@"ACCOUNT_SETTINGS"] == NSOrderedSame) {
            return @(AWSIoTResourceTypeAccountSettings);
        }
        if ([value caseInsensitiveCompare:@"ROLE_ALIAS"] == NSOrderedSame) {
            return @(AWSIoTResourceTypeRoleAlias);
        }
        if ([value caseInsensitiveCompare:@"IAM_ROLE"] == NSOrderedSame) {
            return @(AWSIoTResourceTypeIamRole);
        }
        return @(AWSIoTResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTResourceTypeDeviceCertificate:
                return @"DEVICE_CERTIFICATE";
            case AWSIoTResourceTypeCaCertificate:
                return @"CA_CERTIFICATE";
            case AWSIoTResourceTypeIotPolicy:
                return @"IOT_POLICY";
            case AWSIoTResourceTypeCognitoIdentityPool:
                return @"COGNITO_IDENTITY_POOL";
            case AWSIoTResourceTypeClientId:
                return @"CLIENT_ID";
            case AWSIoTResourceTypeAccountSettings:
                return @"ACCOUNT_SETTINGS";
            case AWSIoTResourceTypeRoleAlias:
                return @"ROLE_ALIAS";
            case AWSIoTResourceTypeIamRole:
                return @"IAM_ROLE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTOTAUpdateFile

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"attributes",
             @"codeSigning" : @"codeSigning",
             @"fileLocation" : @"fileLocation",
             @"fileName" : @"fileName",
             @"fileType" : @"fileType",
             @"fileVersion" : @"fileVersion",
             };
}

+ (NSValueTransformer *)codeSigningJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTCodeSigning class]];
}

+ (NSValueTransformer *)fileLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTFileLocation class]];
}

@end

@implementation AWSIoTOTAUpdateInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalParameters" : @"additionalParameters",
             @"awsIotJobArn" : @"awsIotJobArn",
             @"awsIotJobId" : @"awsIotJobId",
             @"awsJobExecutionsRolloutConfig" : @"awsJobExecutionsRolloutConfig",
             @"awsJobPresignedUrlConfig" : @"awsJobPresignedUrlConfig",
             @"creationDate" : @"creationDate",
             @"detail" : @"description",
             @"errorInfo" : @"errorInfo",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"otaUpdateArn" : @"otaUpdateArn",
             @"otaUpdateFiles" : @"otaUpdateFiles",
             @"otaUpdateId" : @"otaUpdateId",
             @"otaUpdateStatus" : @"otaUpdateStatus",
             @"protocols" : @"protocols",
             @"targetSelection" : @"targetSelection",
             @"targets" : @"targets",
             };
}

+ (NSValueTransformer *)awsJobExecutionsRolloutConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAwsJobExecutionsRolloutConfig class]];
}

+ (NSValueTransformer *)awsJobPresignedUrlConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAwsJobPresignedUrlConfig class]];
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSIoTPercentPair

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"percent" : @"percent",
             @"value" : @"value",
             };
}

@end

@implementation AWSIoTPolicy

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyArn" : @"policyArn",
             @"policyName" : @"policyName",
             };
}

@end

@implementation AWSIoTPolicyVersion

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSIoTPolicyVersionIdentifier

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             @"policyVersionId" : @"policyVersionId",
             };
}

@end

@implementation AWSIoTPresignedUrlConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expiresInSec" : @"expiresInSec",
             @"roleArn" : @"roleArn",
             };
}

@end

@implementation AWSIoTProvisioningHook

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"payloadVersion" : @"payloadVersion",
             @"targetArn" : @"targetArn",
             };
}

@end

@implementation AWSIoTProvisioningTemplateSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"creationDate",
             @"detail" : @"description",
             @"enabled" : @"enabled",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"templateArn" : @"templateArn",
             @"templateName" : @"templateName",
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

@implementation AWSIoTProvisioningTemplateVersionSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"creationDate",
             @"isDefaultVersion" : @"isDefaultVersion",
             @"versionId" : @"versionId",
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

@implementation AWSIoTPublishFindingToSnsParams

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"topicArn" : @"topicArn",
             };
}

@end

@implementation AWSIoTPutAssetPropertyValueEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"assetId",
             @"entryId" : @"entryId",
             @"propertyAlias" : @"propertyAlias",
             @"propertyId" : @"propertyId",
             @"propertyValues" : @"propertyValues",
             };
}

+ (NSValueTransformer *)propertyValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTAssetPropertyValue class]];
}

@end

@implementation AWSIoTPutItemInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableName" : @"tableName",
             };
}

@end

@implementation AWSIoTRateIncreaseCriteria

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"numberOfNotifiedThings" : @"numberOfNotifiedThings",
             @"numberOfSucceededThings" : @"numberOfSucceededThings",
             };
}

@end

@implementation AWSIoTRegisterCACertificateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowAutoRegistration" : @"allowAutoRegistration",
             @"caCertificate" : @"caCertificate",
             @"registrationConfig" : @"registrationConfig",
             @"setAsActive" : @"setAsActive",
             @"tags" : @"tags",
             @"verificationCertificate" : @"verificationCertificate",
             };
}

+ (NSValueTransformer *)registrationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTRegistrationConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTTag class]];
}

@end

@implementation AWSIoTRegisterCACertificateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"certificateArn",
             @"certificateId" : @"certificateId",
             };
}

@end

@implementation AWSIoTRegisterCertificateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"certificateArn",
             @"certificateId" : @"certificateId",
             };
}

@end

@implementation AWSIoTRegisterCertificateWithoutCARequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificatePem" : @"certificatePem",
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

@implementation AWSIoTRegisterCertificateWithoutCAResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"certificateArn",
             @"certificateId" : @"certificateId",
             };
}

@end

@implementation AWSIoTRegisterThingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameters" : @"parameters",
             @"templateBody" : @"templateBody",
             };
}

@end

@implementation AWSIoTRegisterThingResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificatePem" : @"certificatePem",
             @"resourceArns" : @"resourceArns",
             };
}

@end

@implementation AWSIoTRegistrationConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"roleArn",
             @"templateBody" : @"templateBody",
             };
}

@end

@implementation AWSIoTRejectCertificateTransferRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateId" : @"certificateId",
             @"rejectReason" : @"rejectReason",
             };
}

@end

@implementation AWSIoTRelatedResource

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalInfo" : @"additionalInfo",
             @"resourceIdentifier" : @"resourceIdentifier",
             @"resourceType" : @"resourceType",
             };
}

+ (NSValueTransformer *)resourceIdentifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTResourceIdentifier class]];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEVICE_CERTIFICATE"] == NSOrderedSame) {
            return @(AWSIoTResourceTypeDeviceCertificate);
        }
        if ([value caseInsensitiveCompare:@"CA_CERTIFICATE"] == NSOrderedSame) {
            return @(AWSIoTResourceTypeCaCertificate);
        }
        if ([value caseInsensitiveCompare:@"IOT_POLICY"] == NSOrderedSame) {
            return @(AWSIoTResourceTypeIotPolicy);
        }
        if ([value caseInsensitiveCompare:@"COGNITO_IDENTITY_POOL"] == NSOrderedSame) {
            return @(AWSIoTResourceTypeCognitoIdentityPool);
        }
        if ([value caseInsensitiveCompare:@"CLIENT_ID"] == NSOrderedSame) {
            return @(AWSIoTResourceTypeClientId);
        }
        if ([value caseInsensitiveCompare:@"ACCOUNT_SETTINGS"] == NSOrderedSame) {
            return @(AWSIoTResourceTypeAccountSettings);
        }
        if ([value caseInsensitiveCompare:@"ROLE_ALIAS"] == NSOrderedSame) {
            return @(AWSIoTResourceTypeRoleAlias);
        }
        if ([value caseInsensitiveCompare:@"IAM_ROLE"] == NSOrderedSame) {
            return @(AWSIoTResourceTypeIamRole);
        }
        return @(AWSIoTResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTResourceTypeDeviceCertificate:
                return @"DEVICE_CERTIFICATE";
            case AWSIoTResourceTypeCaCertificate:
                return @"CA_CERTIFICATE";
            case AWSIoTResourceTypeIotPolicy:
                return @"IOT_POLICY";
            case AWSIoTResourceTypeCognitoIdentityPool:
                return @"COGNITO_IDENTITY_POOL";
            case AWSIoTResourceTypeClientId:
                return @"CLIENT_ID";
            case AWSIoTResourceTypeAccountSettings:
                return @"ACCOUNT_SETTINGS";
            case AWSIoTResourceTypeRoleAlias:
                return @"ROLE_ALIAS";
            case AWSIoTResourceTypeIamRole:
                return @"IAM_ROLE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTRemoveThingFromBillingGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"billingGroupArn" : @"billingGroupArn",
             @"billingGroupName" : @"billingGroupName",
             @"thingArn" : @"thingArn",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTRemoveThingFromBillingGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTRemoveThingFromThingGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTReplaceDefaultPolicyVersionParams

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateName" : @"templateName",
             };
}

+ (NSValueTransformer *)templateNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLANK_POLICY"] == NSOrderedSame) {
            return @(AWSIoTPolicyTemplateNameBlankPolicy);
        }
        return @(AWSIoTPolicyTemplateNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTPolicyTemplateNameBlankPolicy:
                return @"BLANK_POLICY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTReplaceTopicRuleRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"qos" : @"qos",
             @"roleArn" : @"roleArn",
             @"topic" : @"topic",
             };
}

@end

@implementation AWSIoTResourceIdentifier

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"account" : @"account",
             @"caCertificateId" : @"caCertificateId",
             @"clientId" : @"clientId",
             @"cognitoIdentityPoolId" : @"cognitoIdentityPoolId",
             @"deviceCertificateId" : @"deviceCertificateId",
             @"iamRoleArn" : @"iamRoleArn",
             @"policyVersionIdentifier" : @"policyVersionIdentifier",
             @"roleAliasArn" : @"roleAliasArn",
             };
}

+ (NSValueTransformer *)policyVersionIdentifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTPolicyVersionIdentifier class]];
}

@end

@implementation AWSIoTRoleAliasDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSIoTS3Destination

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"bucket",
             @"prefix" : @"prefix",
             };
}

@end

@implementation AWSIoTS3Location

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"bucket",
             @"key" : @"key",
             @"version" : @"version",
             };
}

@end

@implementation AWSIoTSalesforceAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"token" : @"token",
             @"url" : @"url",
             };
}

@end

@implementation AWSIoTScheduledAuditMetadata

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dayOfMonth" : @"dayOfMonth",
             @"dayOfWeek" : @"dayOfWeek",
             @"frequency" : @"frequency",
             @"scheduledAuditArn" : @"scheduledAuditArn",
             @"scheduledAuditName" : @"scheduledAuditName",
             };
}

+ (NSValueTransformer *)dayOfWeekJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUN"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekSun);
        }
        if ([value caseInsensitiveCompare:@"MON"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekMon);
        }
        if ([value caseInsensitiveCompare:@"TUE"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekTue);
        }
        if ([value caseInsensitiveCompare:@"WED"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekWed);
        }
        if ([value caseInsensitiveCompare:@"THU"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekThu);
        }
        if ([value caseInsensitiveCompare:@"FRI"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekFri);
        }
        if ([value caseInsensitiveCompare:@"SAT"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekSat);
        }
        return @(AWSIoTDayOfWeekUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTDayOfWeekSun:
                return @"SUN";
            case AWSIoTDayOfWeekMon:
                return @"MON";
            case AWSIoTDayOfWeekTue:
                return @"TUE";
            case AWSIoTDayOfWeekWed:
                return @"WED";
            case AWSIoTDayOfWeekThu:
                return @"THU";
            case AWSIoTDayOfWeekFri:
                return @"FRI";
            case AWSIoTDayOfWeekSat:
                return @"SAT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)frequencyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DAILY"] == NSOrderedSame) {
            return @(AWSIoTAuditFrequencyDaily);
        }
        if ([value caseInsensitiveCompare:@"WEEKLY"] == NSOrderedSame) {
            return @(AWSIoTAuditFrequencyWeekly);
        }
        if ([value caseInsensitiveCompare:@"BIWEEKLY"] == NSOrderedSame) {
            return @(AWSIoTAuditFrequencyBiweekly);
        }
        if ([value caseInsensitiveCompare:@"MONTHLY"] == NSOrderedSame) {
            return @(AWSIoTAuditFrequencyMonthly);
        }
        return @(AWSIoTAuditFrequencyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAuditFrequencyDaily:
                return @"DAILY";
            case AWSIoTAuditFrequencyWeekly:
                return @"WEEKLY";
            case AWSIoTAuditFrequencyBiweekly:
                return @"BIWEEKLY";
            case AWSIoTAuditFrequencyMonthly:
                return @"MONTHLY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTSearchIndexRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"thingGroups" : @"thingGroups",
             @"things" : @"things",
             };
}

+ (NSValueTransformer *)thingGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTThingGroupDocument class]];
}

+ (NSValueTransformer *)thingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTThingDocument class]];
}

@end

@implementation AWSIoTSecurityProfileIdentifier

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"name" : @"name",
             };
}

@end

@implementation AWSIoTSecurityProfileTarget

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             };
}

@end

@implementation AWSIoTSecurityProfileTargetMapping

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityProfileIdentifier" : @"securityProfileIdentifier",
             @"target" : @"target",
             };
}

+ (NSValueTransformer *)securityProfileIdentifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTSecurityProfileIdentifier class]];
}

+ (NSValueTransformer *)targetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTSecurityProfileTarget class]];
}

@end

@implementation AWSIoTServerCertificateSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverCertificateArn" : @"serverCertificateArn",
             @"serverCertificateStatus" : @"serverCertificateStatus",
             @"serverCertificateStatusDetail" : @"serverCertificateStatusDetail",
             };
}

+ (NSValueTransformer *)serverCertificateStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INVALID"] == NSOrderedSame) {
            return @(AWSIoTServerCertificateStatusInvalid);
        }
        if ([value caseInsensitiveCompare:@"VALID"] == NSOrderedSame) {
            return @(AWSIoTServerCertificateStatusValid);
        }
        return @(AWSIoTServerCertificateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTServerCertificateStatusInvalid:
                return @"INVALID";
            case AWSIoTServerCertificateStatusValid:
                return @"VALID";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTSetDefaultAuthorizerRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerName" : @"authorizerName",
             };
}

@end

@implementation AWSIoTSetDefaultAuthorizerResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerArn" : @"authorizerArn",
             @"authorizerName" : @"authorizerName",
             };
}

@end

@implementation AWSIoTSetDefaultPolicyVersionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             @"policyVersionId" : @"policyVersionId",
             };
}

@end

@implementation AWSIoTSetLoggingOptionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSIoTSigV4Authorization

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"roleArn",
             @"serviceName" : @"serviceName",
             @"signingRegion" : @"signingRegion",
             };
}

@end

@implementation AWSIoTSigningProfileParameter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"certificateArn",
             @"certificatePathOnDevice" : @"certificatePathOnDevice",
             @"platform" : @"platform",
             };
}

@end

@implementation AWSIoTSnsAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queueUrl" : @"queueUrl",
             @"roleArn" : @"roleArn",
             @"useBase64" : @"useBase64",
             };
}

@end

@implementation AWSIoTStartAuditMitigationActionsTaskRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"auditCheckToActionsMapping" : @"auditCheckToActionsMapping",
             @"clientRequestToken" : @"clientRequestToken",
             @"target" : @"target",
             @"taskId" : @"taskId",
             };
}

+ (NSValueTransformer *)targetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAuditMitigationActionsTaskTarget class]];
}

@end

@implementation AWSIoTStartAuditMitigationActionsTaskResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSIoTStartDetectMitigationActionsTaskRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actions" : @"actions",
             @"clientRequestToken" : @"clientRequestToken",
             @"includeOnlyActiveViolations" : @"includeOnlyActiveViolations",
             @"includeSuppressedAlerts" : @"includeSuppressedAlerts",
             @"target" : @"target",
             @"taskId" : @"taskId",
             @"violationEventOccurrenceRange" : @"violationEventOccurrenceRange",
             };
}

+ (NSValueTransformer *)targetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTDetectMitigationActionsTaskTarget class]];
}

+ (NSValueTransformer *)violationEventOccurrenceRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTViolationEventOccurrenceRange class]];
}

@end

@implementation AWSIoTStartDetectMitigationActionsTaskResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSIoTStartOnDemandAuditTaskRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetCheckNames" : @"targetCheckNames",
             };
}

@end

@implementation AWSIoTStartOnDemandAuditTaskResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSIoTStartSigningJobParameter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"destination",
             @"signingProfileName" : @"signingProfileName",
             @"signingProfileParameter" : @"signingProfileParameter",
             };
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTDestination class]];
}

+ (NSValueTransformer *)signingProfileParameterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTSigningProfileParameter class]];
}

@end

@implementation AWSIoTStartThingRegistrationTaskRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSIoTStatisticalThreshold

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"statistic" : @"statistic",
             };
}

@end

@implementation AWSIoTStatistics

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"average" : @"average",
             @"count" : @"count",
             @"maximum" : @"maximum",
             @"minimum" : @"minimum",
             @"stdDeviation" : @"stdDeviation",
             @"sum" : @"sum",
             @"sumOfSquares" : @"sumOfSquares",
             @"variance" : @"variance",
             };
}

@end

@implementation AWSIoTStepFunctionsAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"executionNamePrefix" : @"executionNamePrefix",
             @"roleArn" : @"roleArn",
             @"stateMachineName" : @"stateMachineName",
             };
}

@end

@implementation AWSIoTStopThingRegistrationTaskRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSIoTStopThingRegistrationTaskResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTStream

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileId" : @"fileId",
             @"streamId" : @"streamId",
             };
}

@end

@implementation AWSIoTStreamFile

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"streamArn" : @"streamArn",
             @"streamId" : @"streamId",
             @"streamVersion" : @"streamVersion",
             };
}

@end

@implementation AWSIoTTag

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSIoTTagResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTTag class]];
}

@end

@implementation AWSIoTTagResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTTaskStatistics

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"canceledChecks" : @"canceledChecks",
             @"compliantChecks" : @"compliantChecks",
             @"failedChecks" : @"failedChecks",
             @"inProgressChecks" : @"inProgressChecks",
             @"nonCompliantChecks" : @"nonCompliantChecks",
             @"totalChecks" : @"totalChecks",
             @"waitingForDataCollectionChecks" : @"waitingForDataCollectionChecks",
             };
}

@end

@implementation AWSIoTTaskStatisticsForAuditCheck

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"canceledFindingsCount" : @"canceledFindingsCount",
             @"failedFindingsCount" : @"failedFindingsCount",
             @"skippedFindingsCount" : @"skippedFindingsCount",
             @"succeededFindingsCount" : @"succeededFindingsCount",
             @"totalFindingsCount" : @"totalFindingsCount",
             };
}

@end

@implementation AWSIoTTestAuthorizationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerName" : @"authorizerName",
             @"httpContext" : @"httpContext",
             @"mqttContext" : @"mqttContext",
             @"tlsContext" : @"tlsContext",
             @"token" : @"token",
             @"tokenSignature" : @"tokenSignature",
             };
}

+ (NSValueTransformer *)httpContextJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTHttpContext class]];
}

+ (NSValueTransformer *)mqttContextJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTMqttContext class]];
}

+ (NSValueTransformer *)tlsContextJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTTlsContext class]];
}

@end

@implementation AWSIoTTestInvokeAuthorizerResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSIoTThingConnectivity

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connected" : @"connected",
             @"timestamp" : @"timestamp",
             };
}

@end

@implementation AWSIoTThingDocument

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"attributes",
             @"connectivity" : @"connectivity",
             @"shadow" : @"shadow",
             @"thingGroupNames" : @"thingGroupNames",
             @"thingId" : @"thingId",
             @"thingName" : @"thingName",
             @"thingTypeName" : @"thingTypeName",
             };
}

+ (NSValueTransformer *)connectivityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTThingConnectivity class]];
}

@end

@implementation AWSIoTThingGroupDocument

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"attributes",
             @"parentGroupNames" : @"parentGroupNames",
             @"thingGroupDescription" : @"thingGroupDescription",
             @"thingGroupId" : @"thingGroupId",
             @"thingGroupName" : @"thingGroupName",
             };
}

@end

@implementation AWSIoTThingGroupIndexingConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customFields" : @"customFields",
             @"managedFields" : @"managedFields",
             @"thingGroupIndexingMode" : @"thingGroupIndexingMode",
             };
}

+ (NSValueTransformer *)customFieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTField class]];
}

+ (NSValueTransformer *)managedFieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTField class]];
}

+ (NSValueTransformer *)thingGroupIndexingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSIoTThingGroupIndexingModeOff);
        }
        if ([value caseInsensitiveCompare:@"ON"] == NSOrderedSame) {
            return @(AWSIoTThingGroupIndexingModeOn);
        }
        return @(AWSIoTThingGroupIndexingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTThingGroupIndexingModeOff:
                return @"OFF";
            case AWSIoTThingGroupIndexingModeOn:
                return @"ON";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTThingGroupMetadata

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customFields" : @"customFields",
             @"managedFields" : @"managedFields",
             @"thingConnectivityIndexingMode" : @"thingConnectivityIndexingMode",
             @"thingIndexingMode" : @"thingIndexingMode",
             };
}

+ (NSValueTransformer *)customFieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTField class]];
}

+ (NSValueTransformer *)managedFieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTField class]];
}

+ (NSValueTransformer *)thingConnectivityIndexingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSIoTThingConnectivityIndexingModeOff);
        }
        if ([value caseInsensitiveCompare:@"STATUS"] == NSOrderedSame) {
            return @(AWSIoTThingConnectivityIndexingModeStatus);
        }
        return @(AWSIoTThingConnectivityIndexingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTThingConnectivityIndexingModeOff:
                return @"OFF";
            case AWSIoTThingConnectivityIndexingModeStatus:
                return @"STATUS";
            default:
                return nil;
        }
    }];
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"searchableAttributes" : @"searchableAttributes",
             @"thingTypeDescription" : @"thingTypeDescription",
             };
}

@end

@implementation AWSIoTTimeoutConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inProgressTimeoutInMinutes" : @"inProgressTimeoutInMinutes",
             };
}

@end

@implementation AWSIoTTimestreamAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"databaseName" : @"databaseName",
             @"dimensions" : @"dimensions",
             @"roleArn" : @"roleArn",
             @"tableName" : @"tableName",
             @"timestamp" : @"timestamp",
             };
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTTimestreamDimension class]];
}

+ (NSValueTransformer *)timestampJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTTimestreamTimestamp class]];
}

@end

@implementation AWSIoTTimestreamDimension

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"value" : @"value",
             };
}

@end

@implementation AWSIoTTimestreamTimestamp

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unit" : @"unit",
             @"value" : @"value",
             };
}

@end

@implementation AWSIoTTlsContext

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverName" : @"serverName",
             };
}

@end

@implementation AWSIoTTopicRule

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSIoTTopicRuleDestination

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"createdAt" : @"createdAt",
             @"httpUrlProperties" : @"httpUrlProperties",
             @"lastUpdatedAt" : @"lastUpdatedAt",
             @"status" : @"status",
             @"statusReason" : @"statusReason",
             @"vpcProperties" : @"vpcProperties",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)httpUrlPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTHttpUrlDestinationProperties class]];
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
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSIoTTopicRuleDestinationStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTTopicRuleDestinationStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSIoTTopicRuleDestinationStatusDisabled);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSIoTTopicRuleDestinationStatusError);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSIoTTopicRuleDestinationStatusDeleting);
        }
        return @(AWSIoTTopicRuleDestinationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTTopicRuleDestinationStatusEnabled:
                return @"ENABLED";
            case AWSIoTTopicRuleDestinationStatusInProgress:
                return @"IN_PROGRESS";
            case AWSIoTTopicRuleDestinationStatusDisabled:
                return @"DISABLED";
            case AWSIoTTopicRuleDestinationStatusError:
                return @"ERROR";
            case AWSIoTTopicRuleDestinationStatusDeleting:
                return @"DELETING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vpcPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTVpcDestinationProperties class]];
}

@end

@implementation AWSIoTTopicRuleDestinationConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"httpUrlConfiguration" : @"httpUrlConfiguration",
             @"vpcConfiguration" : @"vpcConfiguration",
             };
}

+ (NSValueTransformer *)httpUrlConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTHttpUrlDestinationConfiguration class]];
}

+ (NSValueTransformer *)vpcConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTVpcDestinationConfiguration class]];
}

@end

@implementation AWSIoTTopicRuleDestinationSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"createdAt" : @"createdAt",
             @"httpUrlSummary" : @"httpUrlSummary",
             @"lastUpdatedAt" : @"lastUpdatedAt",
             @"status" : @"status",
             @"statusReason" : @"statusReason",
             @"vpcDestinationSummary" : @"vpcDestinationSummary",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)httpUrlSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTHttpUrlDestinationSummary class]];
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
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSIoTTopicRuleDestinationStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTTopicRuleDestinationStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSIoTTopicRuleDestinationStatusDisabled);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSIoTTopicRuleDestinationStatusError);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSIoTTopicRuleDestinationStatusDeleting);
        }
        return @(AWSIoTTopicRuleDestinationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTTopicRuleDestinationStatusEnabled:
                return @"ENABLED";
            case AWSIoTTopicRuleDestinationStatusInProgress:
                return @"IN_PROGRESS";
            case AWSIoTTopicRuleDestinationStatusDisabled:
                return @"DISABLED";
            case AWSIoTTopicRuleDestinationStatusError:
                return @"ERROR";
            case AWSIoTTopicRuleDestinationStatusDeleting:
                return @"DELETING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vpcDestinationSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTVpcDestinationSummary class]];
}

@end

@implementation AWSIoTTopicRuleListItem

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateId" : @"certificateId",
             @"targetAwsAccount" : @"targetAwsAccount",
             @"transferMessage" : @"transferMessage",
             };
}

@end

@implementation AWSIoTTransferCertificateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transferredCertificateArn" : @"transferredCertificateArn",
             };
}

@end

@implementation AWSIoTTransferData

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSIoTUntagResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tagKeys" : @"tagKeys",
             };
}

@end

@implementation AWSIoTUntagResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTUpdateAccountAuditConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"auditCheckConfigurations" : @"auditCheckConfigurations",
             @"auditNotificationTargetConfigurations" : @"auditNotificationTargetConfigurations",
             @"roleArn" : @"roleArn",
             };
}

+ (NSValueTransformer *)auditCheckConfigurationsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSIoTAuditCheckConfiguration class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)auditNotificationTargetConfigurationsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSIoTAuditNotificationTarget class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSIoTUpdateAccountAuditConfigurationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTUpdateAuditSuppressionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkName" : @"checkName",
             @"detail" : @"description",
             @"expirationDate" : @"expirationDate",
             @"resourceIdentifier" : @"resourceIdentifier",
             @"suppressIndefinitely" : @"suppressIndefinitely",
             };
}

+ (NSValueTransformer *)expirationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)resourceIdentifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTResourceIdentifier class]];
}

@end

@implementation AWSIoTUpdateAuditSuppressionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTUpdateAuthorizerRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerArn" : @"authorizerArn",
             @"authorizerName" : @"authorizerName",
             };
}

@end

@implementation AWSIoTUpdateBillingGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"billingGroupName" : @"billingGroupName",
             @"billingGroupProperties" : @"billingGroupProperties",
             @"expectedVersion" : @"expectedVersion",
             };
}

+ (NSValueTransformer *)billingGroupPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTBillingGroupProperties class]];
}

@end

@implementation AWSIoTUpdateBillingGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"version" : @"version",
             };
}

@end

@implementation AWSIoTUpdateCACertificateParams

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"action",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEACTIVATE"] == NSOrderedSame) {
            return @(AWSIoTCACertificateUpdateActionDeactivate);
        }
        return @(AWSIoTCACertificateUpdateActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTCACertificateUpdateActionDeactivate:
                return @"DEACTIVATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTUpdateCACertificateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSIoTUpdateCustomMetricRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"displayName" : @"displayName",
             @"metricName" : @"metricName",
             };
}

@end

@implementation AWSIoTUpdateCustomMetricResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"creationDate",
             @"displayName" : @"displayName",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"metricArn" : @"metricArn",
             @"metricName" : @"metricName",
             @"metricType" : @"metricType",
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

+ (NSValueTransformer *)metricTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"string-list"] == NSOrderedSame) {
            return @(AWSIoTCustomMetricTypeStringList);
        }
        if ([value caseInsensitiveCompare:@"ip-address-list"] == NSOrderedSame) {
            return @(AWSIoTCustomMetricTypeIpAddressList);
        }
        if ([value caseInsensitiveCompare:@"number-list"] == NSOrderedSame) {
            return @(AWSIoTCustomMetricTypeNumberList);
        }
        if ([value caseInsensitiveCompare:@"number"] == NSOrderedSame) {
            return @(AWSIoTCustomMetricTypeNumber);
        }
        return @(AWSIoTCustomMetricTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTCustomMetricTypeStringList:
                return @"string-list";
            case AWSIoTCustomMetricTypeIpAddressList:
                return @"ip-address-list";
            case AWSIoTCustomMetricTypeNumberList:
                return @"number-list";
            case AWSIoTCustomMetricTypeNumber:
                return @"number";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTUpdateDeviceCertificateParams

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"action",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEACTIVATE"] == NSOrderedSame) {
            return @(AWSIoTDeviceCertificateUpdateActionDeactivate);
        }
        return @(AWSIoTDeviceCertificateUpdateActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTDeviceCertificateUpdateActionDeactivate:
                return @"DEACTIVATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTUpdateDimensionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"stringValues" : @"stringValues",
             };
}

@end

@implementation AWSIoTUpdateDimensionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"creationDate" : @"creationDate",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"name" : @"name",
             @"stringValues" : @"stringValues",
             @"types" : @"type",
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

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TOPIC_FILTER"] == NSOrderedSame) {
            return @(AWSIoTDimensionTypeTopicFilter);
        }
        return @(AWSIoTDimensionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTDimensionTypeTopicFilter:
                return @"TOPIC_FILTER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTUpdateDomainConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizerConfig" : @"authorizerConfig",
             @"domainConfigurationName" : @"domainConfigurationName",
             @"domainConfigurationStatus" : @"domainConfigurationStatus",
             @"removeAuthorizerConfig" : @"removeAuthorizerConfig",
             };
}

+ (NSValueTransformer *)authorizerConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAuthorizerConfig class]];
}

+ (NSValueTransformer *)domainConfigurationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSIoTDomainConfigurationStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSIoTDomainConfigurationStatusDisabled);
        }
        return @(AWSIoTDomainConfigurationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTDomainConfigurationStatusEnabled:
                return @"ENABLED";
            case AWSIoTDomainConfigurationStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTUpdateDomainConfigurationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainConfigurationArn" : @"domainConfigurationArn",
             @"domainConfigurationName" : @"domainConfigurationName",
             };
}

@end

@implementation AWSIoTUpdateDynamicThingGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expectedVersion" : @"expectedVersion",
             @"indexName" : @"indexName",
             @"queryString" : @"queryString",
             @"queryVersion" : @"queryVersion",
             @"thingGroupName" : @"thingGroupName",
             @"thingGroupProperties" : @"thingGroupProperties",
             };
}

+ (NSValueTransformer *)thingGroupPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTThingGroupProperties class]];
}

@end

@implementation AWSIoTUpdateDynamicThingGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"version" : @"version",
             };
}

@end

@implementation AWSIoTUpdateEventConfigurationsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTUpdateIndexingConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingGroupIndexingConfiguration" : @"thingGroupIndexingConfiguration",
             @"thingIndexingConfiguration" : @"thingIndexingConfiguration",
             };
}

+ (NSValueTransformer *)thingGroupIndexingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTThingGroupIndexingConfiguration class]];
}

+ (NSValueTransformer *)thingIndexingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTThingIndexingConfiguration class]];
}

@end

@implementation AWSIoTUpdateIndexingConfigurationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTUpdateJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"abortConfig" : @"abortConfig",
             @"detail" : @"description",
             @"jobExecutionsRolloutConfig" : @"jobExecutionsRolloutConfig",
             @"jobId" : @"jobId",
             @"namespaceId" : @"namespaceId",
             @"presignedUrlConfig" : @"presignedUrlConfig",
             @"timeoutConfig" : @"timeoutConfig",
             };
}

+ (NSValueTransformer *)abortConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAbortConfig class]];
}

+ (NSValueTransformer *)jobExecutionsRolloutConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTJobExecutionsRolloutConfig class]];
}

+ (NSValueTransformer *)presignedUrlConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTPresignedUrlConfig class]];
}

+ (NSValueTransformer *)timeoutConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTTimeoutConfig class]];
}

@end

@implementation AWSIoTUpdateMitigationActionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionName" : @"actionName",
             @"actionParams" : @"actionParams",
             @"roleArn" : @"roleArn",
             };
}

+ (NSValueTransformer *)actionParamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTMitigationActionParams class]];
}

@end

@implementation AWSIoTUpdateMitigationActionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionArn" : @"actionArn",
             @"actionId" : @"actionId",
             };
}

@end

@implementation AWSIoTUpdateProvisioningTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultVersionId" : @"defaultVersionId",
             @"detail" : @"description",
             @"enabled" : @"enabled",
             @"preProvisioningHook" : @"preProvisioningHook",
             @"provisioningRoleArn" : @"provisioningRoleArn",
             @"removePreProvisioningHook" : @"removePreProvisioningHook",
             @"templateName" : @"templateName",
             };
}

+ (NSValueTransformer *)preProvisioningHookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTProvisioningHook class]];
}

@end

@implementation AWSIoTUpdateProvisioningTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTUpdateRoleAliasRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"credentialDurationSeconds" : @"credentialDurationSeconds",
             @"roleAlias" : @"roleAlias",
             @"roleArn" : @"roleArn",
             };
}

@end

@implementation AWSIoTUpdateRoleAliasResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleAlias" : @"roleAlias",
             @"roleAliasArn" : @"roleAliasArn",
             };
}

@end

@implementation AWSIoTUpdateScheduledAuditRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dayOfMonth" : @"dayOfMonth",
             @"dayOfWeek" : @"dayOfWeek",
             @"frequency" : @"frequency",
             @"scheduledAuditName" : @"scheduledAuditName",
             @"targetCheckNames" : @"targetCheckNames",
             };
}

+ (NSValueTransformer *)dayOfWeekJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUN"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekSun);
        }
        if ([value caseInsensitiveCompare:@"MON"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekMon);
        }
        if ([value caseInsensitiveCompare:@"TUE"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekTue);
        }
        if ([value caseInsensitiveCompare:@"WED"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekWed);
        }
        if ([value caseInsensitiveCompare:@"THU"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekThu);
        }
        if ([value caseInsensitiveCompare:@"FRI"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekFri);
        }
        if ([value caseInsensitiveCompare:@"SAT"] == NSOrderedSame) {
            return @(AWSIoTDayOfWeekSat);
        }
        return @(AWSIoTDayOfWeekUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTDayOfWeekSun:
                return @"SUN";
            case AWSIoTDayOfWeekMon:
                return @"MON";
            case AWSIoTDayOfWeekTue:
                return @"TUE";
            case AWSIoTDayOfWeekWed:
                return @"WED";
            case AWSIoTDayOfWeekThu:
                return @"THU";
            case AWSIoTDayOfWeekFri:
                return @"FRI";
            case AWSIoTDayOfWeekSat:
                return @"SAT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)frequencyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DAILY"] == NSOrderedSame) {
            return @(AWSIoTAuditFrequencyDaily);
        }
        if ([value caseInsensitiveCompare:@"WEEKLY"] == NSOrderedSame) {
            return @(AWSIoTAuditFrequencyWeekly);
        }
        if ([value caseInsensitiveCompare:@"BIWEEKLY"] == NSOrderedSame) {
            return @(AWSIoTAuditFrequencyBiweekly);
        }
        if ([value caseInsensitiveCompare:@"MONTHLY"] == NSOrderedSame) {
            return @(AWSIoTAuditFrequencyMonthly);
        }
        return @(AWSIoTAuditFrequencyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTAuditFrequencyDaily:
                return @"DAILY";
            case AWSIoTAuditFrequencyWeekly:
                return @"WEEKLY";
            case AWSIoTAuditFrequencyBiweekly:
                return @"BIWEEKLY";
            case AWSIoTAuditFrequencyMonthly:
                return @"MONTHLY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTUpdateScheduledAuditResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduledAuditArn" : @"scheduledAuditArn",
             };
}

@end

@implementation AWSIoTUpdateSecurityProfileRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalMetricsToRetain" : @"additionalMetricsToRetain",
             @"additionalMetricsToRetainV2" : @"additionalMetricsToRetainV2",
             @"alertTargets" : @"alertTargets",
             @"behaviors" : @"behaviors",
             @"deleteAdditionalMetricsToRetain" : @"deleteAdditionalMetricsToRetain",
             @"deleteAlertTargets" : @"deleteAlertTargets",
             @"deleteBehaviors" : @"deleteBehaviors",
             @"expectedVersion" : @"expectedVersion",
             @"securityProfileDescription" : @"securityProfileDescription",
             @"securityProfileName" : @"securityProfileName",
             };
}

+ (NSValueTransformer *)additionalMetricsToRetainV2JSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTMetricToRetain class]];
}

+ (NSValueTransformer *)alertTargetsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSIoTAlertTarget class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)behaviorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTBehavior class]];
}

@end

@implementation AWSIoTUpdateSecurityProfileResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalMetricsToRetain" : @"additionalMetricsToRetain",
             @"additionalMetricsToRetainV2" : @"additionalMetricsToRetainV2",
             @"alertTargets" : @"alertTargets",
             @"behaviors" : @"behaviors",
             @"creationDate" : @"creationDate",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"securityProfileArn" : @"securityProfileArn",
             @"securityProfileDescription" : @"securityProfileDescription",
             @"securityProfileName" : @"securityProfileName",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)additionalMetricsToRetainV2JSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTMetricToRetain class]];
}

+ (NSValueTransformer *)alertTargetsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSIoTAlertTarget class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)behaviorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTBehavior class]];
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

@implementation AWSIoTUpdateStreamRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"version" : @"version",
             };
}

@end

@implementation AWSIoTUpdateThingGroupsForThingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"overrideDynamicGroups" : @"overrideDynamicGroups",
             @"thingGroupsToAdd" : @"thingGroupsToAdd",
             @"thingGroupsToRemove" : @"thingGroupsToRemove",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTUpdateThingGroupsForThingResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTUpdateThingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTUpdateTopicRuleDestinationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSIoTTopicRuleDestinationStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSIoTTopicRuleDestinationStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSIoTTopicRuleDestinationStatusDisabled);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSIoTTopicRuleDestinationStatusError);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSIoTTopicRuleDestinationStatusDeleting);
        }
        return @(AWSIoTTopicRuleDestinationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTTopicRuleDestinationStatusEnabled:
                return @"ENABLED";
            case AWSIoTTopicRuleDestinationStatusInProgress:
                return @"IN_PROGRESS";
            case AWSIoTTopicRuleDestinationStatusDisabled:
                return @"DISABLED";
            case AWSIoTTopicRuleDestinationStatusError:
                return @"ERROR";
            case AWSIoTTopicRuleDestinationStatusDeleting:
                return @"DELETING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTUpdateTopicRuleDestinationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSIoTValidateSecurityProfileBehaviorsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"behaviors" : @"behaviors",
             };
}

+ (NSValueTransformer *)behaviorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTBehavior class]];
}

@end

@implementation AWSIoTValidateSecurityProfileBehaviorsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"valid" : @"valid",
             @"validationErrors" : @"validationErrors",
             };
}

+ (NSValueTransformer *)validationErrorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIoTValidationError class]];
}

@end

@implementation AWSIoTValidationError

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorMessage" : @"errorMessage",
             };
}

@end

@implementation AWSIoTViolationEvent

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"behavior" : @"behavior",
             @"metricValue" : @"metricValue",
             @"securityProfileName" : @"securityProfileName",
             @"thingName" : @"thingName",
             @"violationEventAdditionalInfo" : @"violationEventAdditionalInfo",
             @"violationEventTime" : @"violationEventTime",
             @"violationEventType" : @"violationEventType",
             @"violationId" : @"violationId",
             };
}

+ (NSValueTransformer *)behaviorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTBehavior class]];
}

+ (NSValueTransformer *)metricValueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTMetricValue class]];
}

+ (NSValueTransformer *)violationEventAdditionalInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTViolationEventAdditionalInfo class]];
}

+ (NSValueTransformer *)violationEventTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)violationEventTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"in-alarm"] == NSOrderedSame) {
            return @(AWSIoTViolationEventTypeInAlarm);
        }
        if ([value caseInsensitiveCompare:@"alarm-cleared"] == NSOrderedSame) {
            return @(AWSIoTViolationEventTypeAlarmCleared);
        }
        if ([value caseInsensitiveCompare:@"alarm-invalidated"] == NSOrderedSame) {
            return @(AWSIoTViolationEventTypeAlarmInvalidated);
        }
        return @(AWSIoTViolationEventTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTViolationEventTypeInAlarm:
                return @"in-alarm";
            case AWSIoTViolationEventTypeAlarmCleared:
                return @"alarm-cleared";
            case AWSIoTViolationEventTypeAlarmInvalidated:
                return @"alarm-invalidated";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTViolationEventAdditionalInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidenceLevel" : @"confidenceLevel",
             };
}

+ (NSValueTransformer *)confidenceLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSIoTConfidenceLevelLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSIoTConfidenceLevelMedium);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSIoTConfidenceLevelHigh);
        }
        return @(AWSIoTConfidenceLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIoTConfidenceLevelLow:
                return @"LOW";
            case AWSIoTConfidenceLevelMedium:
                return @"MEDIUM";
            case AWSIoTConfidenceLevelHigh:
                return @"HIGH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTViolationEventOccurrenceRange

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"endTime",
             @"startTime" : @"startTime",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSIoTVpcDestinationConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"roleArn",
             @"securityGroups" : @"securityGroups",
             @"subnetIds" : @"subnetIds",
             @"vpcId" : @"vpcId",
             };
}

@end

@implementation AWSIoTVpcDestinationProperties

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"roleArn",
             @"securityGroups" : @"securityGroups",
             @"subnetIds" : @"subnetIds",
             @"vpcId" : @"vpcId",
             };
}

@end

@implementation AWSIoTVpcDestinationSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"roleArn",
             @"securityGroups" : @"securityGroups",
             @"subnetIds" : @"subnetIds",
             @"vpcId" : @"vpcId",
             };
}

@end
