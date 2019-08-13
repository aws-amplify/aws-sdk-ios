//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
             @"iotEvents" : @"iotEvents",
             @"kinesis" : @"kinesis",
             @"lambda" : @"lambda",
             @"republish" : @"republish",
             @"s3" : @"s3",
             @"salesforce" : @"salesforce",
             @"sns" : @"sns",
             @"sqs" : @"sqs",
             @"stepFunctions" : @"stepFunctions",
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

+ (NSValueTransformer *)iotEventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTIotEventsAction class]];
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

@end

@implementation AWSIoTActiveViolation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"behavior" : @"behavior",
             @"lastViolationTime" : @"lastViolationTime",
             @"lastViolationValue" : @"lastViolationValue",
             @"securityProfileName" : @"securityProfileName",
             @"thingName" : @"thingName",
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

+ (NSValueTransformer *)violationStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSIoTAddThingToBillingGroupRequest

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

@end

@implementation AWSIoTAddThingToThingGroupRequest

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

@end

@implementation AWSIoTAddThingsToThingGroupParams

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"overrideDynamicGroups" : @"overrideDynamicGroups",
             @"thingGroupNames" : @"thingGroupNames",
             };
}

@end

@implementation AWSIoTAlertTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alertTargetArn" : @"alertTargetArn",
             @"roleArn" : @"roleArn",
             };
}

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

@implementation AWSIoTAttachSecurityProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityProfileName" : @"securityProfileName",
             @"securityProfileTargetArn" : @"securityProfileTargetArn",
             };
}

@end

@implementation AWSIoTAttachSecurityProfileResponse

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

@implementation AWSIoTAuditCheckConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"enabled",
             };
}

@end

@implementation AWSIoTAuditCheckDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkCompliant" : @"checkCompliant",
             @"checkRunStatus" : @"checkRunStatus",
             @"errorCode" : @"errorCode",
             @"message" : @"message",
             @"nonCompliantResourcesCount" : @"nonCompliantResourcesCount",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkName" : @"checkName",
             @"findingId" : @"findingId",
             @"findingTime" : @"findingTime",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"auditCheckToReasonCodeFilter" : @"auditCheckToReasonCodeFilter",
             @"auditTaskId" : @"auditTaskId",
             @"findingIds" : @"findingIds",
             };
}

@end

@implementation AWSIoTAuditNotificationTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"enabled",
             @"roleArn" : @"roleArn",
             @"targetArn" : @"targetArn",
             };
}

@end

@implementation AWSIoTAuditTaskMetadata

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

@implementation AWSIoTAwsJobExecutionsRolloutConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maximumPerMinute" : @"maximumPerMinute",
             };
}

@end

@implementation AWSIoTBehavior

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"criteria" : @"criteria",
             @"metric" : @"metric",
             @"name" : @"name",
             };
}

+ (NSValueTransformer *)criteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTBehaviorCriteria class]];
}

@end

@implementation AWSIoTBehaviorCriteria

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comparisonOperator" : @"comparisonOperator",
             @"consecutiveDatapointsToAlarm" : @"consecutiveDatapointsToAlarm",
             @"consecutiveDatapointsToClear" : @"consecutiveDatapointsToClear",
             @"durationSeconds" : @"durationSeconds",
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statisticalThresholdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTStatisticalThreshold class]];
}

+ (NSValueTransformer *)valueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTMetricValue class]];
}

@end

@implementation AWSIoTBillingGroupMetadata

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"billingGroupDescription" : @"billingGroupDescription",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSIoTCancelAuditMitigationActionsTaskResponse

@end

@implementation AWSIoTCancelAuditTaskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSIoTCancelAuditTaskResponse

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
             @"reasonCode" : @"reasonCode",
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
             @"validity" : @"validity",
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

+ (NSValueTransformer *)validityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTCertificateValidity class]];
}

@end

@implementation AWSIoTCertificateValidity

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateName" : @"certificateName",
             @"inlineDocument" : @"inlineDocument",
             };
}

@end

@implementation AWSIoTCodeSigningSignature

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inlineDocument" : @"inlineDocument",
             };
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

@implementation AWSIoTCreateBillingGroupRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"billingGroupArn" : @"billingGroupArn",
             @"billingGroupId" : @"billingGroupId",
             @"billingGroupName" : @"billingGroupName",
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

@implementation AWSIoTCreateDynamicThingGroupRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"abortConfig" : @"abortConfig",
             @"detail" : @"description",
             @"document" : @"document",
             @"documentSource" : @"documentSource",
             @"jobExecutionsRolloutConfig" : @"jobExecutionsRolloutConfig",
             @"jobId" : @"jobId",
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

@implementation AWSIoTCreateMitigationActionRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionArn" : @"actionArn",
             @"actionId" : @"actionId",
             };
}

@end

@implementation AWSIoTCreateOTAUpdateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalParameters" : @"additionalParameters",
             @"awsJobExecutionsRolloutConfig" : @"awsJobExecutionsRolloutConfig",
             @"detail" : @"description",
             @"files" : @"files",
             @"otaUpdateId" : @"otaUpdateId",
             @"roleArn" : @"roleArn",
             @"tags" : @"tags",
             @"targetSelection" : @"targetSelection",
             @"targets" : @"targets",
             };
}

+ (NSValueTransformer *)awsJobExecutionsRolloutConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAwsJobExecutionsRolloutConfig class]];
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

@implementation AWSIoTCreateScheduledAuditRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduledAuditArn" : @"scheduledAuditArn",
             };
}

@end

@implementation AWSIoTCreateSecurityProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalMetricsToRetain" : @"additionalMetricsToRetain",
             @"alertTargets" : @"alertTargets",
             @"behaviors" : @"behaviors",
             @"securityProfileDescription" : @"securityProfileDescription",
             @"securityProfileName" : @"securityProfileName",
             @"tags" : @"tags",
             };
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityProfileArn" : @"securityProfileArn",
             @"securityProfileName" : @"securityProfileName",
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
             @"tags" : @"tags",
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

@implementation AWSIoTDeleteAccountAuditConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleteScheduledAudits" : @"deleteScheduledAudits",
             };
}

@end

@implementation AWSIoTDeleteAccountAuditConfigurationResponse

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

@implementation AWSIoTDeleteBillingGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"billingGroupName" : @"billingGroupName",
             @"expectedVersion" : @"expectedVersion",
             };
}

@end

@implementation AWSIoTDeleteBillingGroupResponse

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

@implementation AWSIoTDeleteDynamicThingGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expectedVersion" : @"expectedVersion",
             @"thingGroupName" : @"thingGroupName",
             };
}

@end

@implementation AWSIoTDeleteDynamicThingGroupResponse

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

@implementation AWSIoTDeleteMitigationActionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionName" : @"actionName",
             };
}

@end

@implementation AWSIoTDeleteMitigationActionResponse

@end

@implementation AWSIoTDeleteOTAUpdateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleteStream" : @"deleteStream",
             @"forceDeleteAWSJob" : @"forceDeleteAWSJob",
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

@implementation AWSIoTDeleteScheduledAuditRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduledAuditName" : @"scheduledAuditName",
             };
}

@end

@implementation AWSIoTDeleteScheduledAuditResponse

@end

@implementation AWSIoTDeleteSecurityProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expectedVersion" : @"expectedVersion",
             @"securityProfileName" : @"securityProfileName",
             };
}

@end

@implementation AWSIoTDeleteSecurityProfileResponse

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

@implementation AWSIoTDescribeAccountAuditConfigurationRequest

@end

@implementation AWSIoTDescribeAccountAuditConfigurationResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findingId" : @"findingId",
             };
}

@end

@implementation AWSIoTDescribeAuditFindingResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSIoTDescribeAuditMitigationActionsTaskResponse

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

@implementation AWSIoTDescribeAuditTaskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSIoTDescribeAuditTaskResponse

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

@implementation AWSIoTDescribeBillingGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"billingGroupName" : @"billingGroupName",
             };
}

@end

@implementation AWSIoTDescribeBillingGroupResponse

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

@implementation AWSIoTDescribeMitigationActionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionName" : @"actionName",
             };
}

@end

@implementation AWSIoTDescribeMitigationActionResponse

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

@implementation AWSIoTDescribeScheduledAuditRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduledAuditName" : @"scheduledAuditName",
             };
}

@end

@implementation AWSIoTDescribeScheduledAuditResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityProfileName" : @"securityProfileName",
             };
}

@end

@implementation AWSIoTDescribeSecurityProfileResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalMetricsToRetain" : @"additionalMetricsToRetain",
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

@implementation AWSIoTDestination

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

@implementation AWSIoTDetachSecurityProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityProfileName" : @"securityProfileName",
             @"securityProfileTargetArn" : @"securityProfileTargetArn",
             };
}

@end

@implementation AWSIoTDetachSecurityProfileResponse

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

@implementation AWSIoTEnableIoTLoggingParams

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

@implementation AWSIoTExponentialRolloutRate

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

@implementation AWSIoTFileLocation

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

@implementation AWSIoTGetStatisticsRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"statistics" : @"statistics",
             };
}

+ (NSValueTransformer *)statisticsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTStatistics class]];
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

@implementation AWSIoTIotEventsAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputName" : @"inputName",
             @"messageId" : @"messageId",
             @"roleArn" : @"roleArn",
             };
}

@end

@implementation AWSIoTJob

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
             @"exponentialRate" : @"exponentialRate",
             @"maximumPerMinute" : @"maximumPerMinute",
             };
}

+ (NSValueTransformer *)exponentialRateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTExponentialRolloutRate class]];
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
             @"numberOfTimedOutThings" : @"numberOfTimedOutThings",
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

@implementation AWSIoTListActiveViolationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"securityProfileName" : @"securityProfileName",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTListActiveViolationsResponse

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

@implementation AWSIoTListAuditFindingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkName" : @"checkName",
             @"endTime" : @"endTime",
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

@implementation AWSIoTListAuditTasksRequest

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

@implementation AWSIoTListBillingGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"namePrefixFilter" : @"namePrefixFilter",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIoTListBillingGroupsResponse

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

@implementation AWSIoTListMitigationActionsRequest

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

@implementation AWSIoTListScheduledAuditsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIoTListScheduledAuditsResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIoTListSecurityProfilesResponse

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

@implementation AWSIoTListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSIoTListTagsForResourceResponse

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

@implementation AWSIoTListTargetsForSecurityProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"securityProfileName" : @"securityProfileName",
             };
}

@end

@implementation AWSIoTListTargetsForSecurityProfileResponse

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

@implementation AWSIoTListThingsInBillingGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"billingGroupName" : @"billingGroupName",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIoTListThingsInBillingGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"things" : @"things",
             };
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

@implementation AWSIoTListViolationEventsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"endTime",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"securityProfileName" : @"securityProfileName",
             @"startTime" : @"startTime",
             @"thingName" : @"thingName",
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

@implementation AWSIoTListViolationEventsResponse

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

@implementation AWSIoTMetricValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidrs" : @"cidrs",
             @"count" : @"count",
             @"ports" : @"ports",
             };
}

@end

@implementation AWSIoTMitigationAction

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

@implementation AWSIoTNonCompliantResource

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
             @"fileLocation" : @"fileLocation",
             @"fileName" : @"fileName",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalParameters" : @"additionalParameters",
             @"awsIotJobArn" : @"awsIotJobArn",
             @"awsIotJobId" : @"awsIotJobId",
             @"awsJobExecutionsRolloutConfig" : @"awsJobExecutionsRolloutConfig",
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

+ (NSValueTransformer *)awsJobExecutionsRolloutConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTAwsJobExecutionsRolloutConfig class]];
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

@implementation AWSIoTPolicyVersionIdentifier

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             @"policyVersionId" : @"policyVersionId",
             };
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

@implementation AWSIoTPublishFindingToSnsParams

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"topicArn" : @"topicArn",
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

@implementation AWSIoTRateIncreaseCriteria

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"numberOfNotifiedThings" : @"numberOfNotifiedThings",
             @"numberOfSucceededThings" : @"numberOfSucceededThings",
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

@implementation AWSIoTRelatedResource

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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIoTRemoveThingFromBillingGroupRequest

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

@implementation AWSIoTReplaceDefaultPolicyVersionParams

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
             @"qos" : @"qos",
             @"roleArn" : @"roleArn",
             @"topic" : @"topic",
             };
}

@end

@implementation AWSIoTResourceIdentifier

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"account" : @"account",
             @"caCertificateId" : @"caCertificateId",
             @"clientId" : @"clientId",
             @"cognitoIdentityPoolId" : @"cognitoIdentityPoolId",
             @"deviceCertificateId" : @"deviceCertificateId",
             @"policyVersionIdentifier" : @"policyVersionIdentifier",
             };
}

+ (NSValueTransformer *)policyVersionIdentifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIoTPolicyVersionIdentifier class]];
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

@implementation AWSIoTS3Destination

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"bucket",
             @"prefix" : @"prefix",
             };
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

@implementation AWSIoTScheduledAuditMetadata

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"name" : @"name",
             };
}

@end

@implementation AWSIoTSecurityProfileTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             };
}

@end

@implementation AWSIoTSecurityProfileTargetMapping

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

@implementation AWSIoTSigningProfileParameter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"certificateArn",
             @"certificatePathOnDevice" : @"certificatePathOnDevice",
             @"platform" : @"platform",
             };
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

@implementation AWSIoTStartAuditMitigationActionsTaskRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSIoTStartOnDemandAuditTaskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetCheckNames" : @"targetCheckNames",
             };
}

@end

@implementation AWSIoTStartOnDemandAuditTaskResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSIoTStartSigningJobParameter

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

@implementation AWSIoTStatisticalThreshold

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"statistic" : @"statistic",
             };
}

@end

@implementation AWSIoTStatistics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"count" : @"count",
             };
}

@end

@implementation AWSIoTStepFunctionsAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"executionNamePrefix" : @"executionNamePrefix",
             @"roleArn" : @"roleArn",
             @"stateMachineName" : @"stateMachineName",
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

@implementation AWSIoTTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSIoTTagResourceRequest

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

@end

@implementation AWSIoTTaskStatistics

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

@implementation AWSIoTThingConnectivity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connected" : @"connected",
             @"timestamp" : @"timestamp",
             };
}

@end

@implementation AWSIoTThingDocument

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingGroupIndexingMode" : @"thingGroupIndexingMode",
             };
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
             @"thingConnectivityIndexingMode" : @"thingConnectivityIndexingMode",
             @"thingIndexingMode" : @"thingIndexingMode",
             };
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

@implementation AWSIoTTimeoutConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inProgressTimeoutInMinutes" : @"inProgressTimeoutInMinutes",
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

@implementation AWSIoTUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tagKeys" : @"tagKeys",
             };
}

@end

@implementation AWSIoTUntagResourceResponse

@end

@implementation AWSIoTUpdateAccountAuditConfigurationRequest

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

@implementation AWSIoTUpdateBillingGroupRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"version" : @"version",
             };
}

@end

@implementation AWSIoTUpdateCACertificateParams

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

@implementation AWSIoTUpdateDeviceCertificateParams

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

@implementation AWSIoTUpdateDynamicThingGroupRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"version" : @"version",
             };
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

@end

@implementation AWSIoTUpdateJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"abortConfig" : @"abortConfig",
             @"detail" : @"description",
             @"jobExecutionsRolloutConfig" : @"jobExecutionsRolloutConfig",
             @"jobId" : @"jobId",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionArn" : @"actionArn",
             @"actionId" : @"actionId",
             };
}

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

@implementation AWSIoTUpdateScheduledAuditRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduledAuditArn" : @"scheduledAuditArn",
             };
}

@end

@implementation AWSIoTUpdateSecurityProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalMetricsToRetain" : @"additionalMetricsToRetain",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalMetricsToRetain" : @"additionalMetricsToRetain",
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
             @"overrideDynamicGroups" : @"overrideDynamicGroups",
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

@implementation AWSIoTValidateSecurityProfileBehaviorsRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorMessage" : @"errorMessage",
             };
}

@end

@implementation AWSIoTViolationEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"behavior" : @"behavior",
             @"metricValue" : @"metricValue",
             @"securityProfileName" : @"securityProfileName",
             @"thingName" : @"thingName",
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
