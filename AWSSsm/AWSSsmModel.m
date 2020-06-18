//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSSsmModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSSsmErrorDomain = @"com.amazonaws.AWSSsmErrorDomain";

@implementation AWSSsmAccountSharingInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"sharedDocumentVersion" : @"SharedDocumentVersion",
             };
}

@end

@implementation AWSSsmActivation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activationId" : @"ActivationId",
             @"createdDate" : @"CreatedDate",
             @"defaultInstanceName" : @"DefaultInstanceName",
             @"detail" : @"Description",
             @"expirationDate" : @"ExpirationDate",
             @"expired" : @"Expired",
             @"iamRole" : @"IamRole",
             @"registrationLimit" : @"RegistrationLimit",
             @"registrationsCount" : @"RegistrationsCount",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)expirationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTag class]];
}

@end

@implementation AWSSsmAddTagsToResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Document"] == NSOrderedSame) {
            return @(AWSSsmResourceTypeForTaggingDocument);
        }
        if ([value caseInsensitiveCompare:@"ManagedInstance"] == NSOrderedSame) {
            return @(AWSSsmResourceTypeForTaggingManagedInstance);
        }
        if ([value caseInsensitiveCompare:@"MaintenanceWindow"] == NSOrderedSame) {
            return @(AWSSsmResourceTypeForTaggingMaintenanceWindow);
        }
        if ([value caseInsensitiveCompare:@"Parameter"] == NSOrderedSame) {
            return @(AWSSsmResourceTypeForTaggingParameter);
        }
        if ([value caseInsensitiveCompare:@"PatchBaseline"] == NSOrderedSame) {
            return @(AWSSsmResourceTypeForTaggingPatchBaseline);
        }
        if ([value caseInsensitiveCompare:@"OpsItem"] == NSOrderedSame) {
            return @(AWSSsmResourceTypeForTaggingOpsItem);
        }
        return @(AWSSsmResourceTypeForTaggingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmResourceTypeForTaggingDocument:
                return @"Document";
            case AWSSsmResourceTypeForTaggingManagedInstance:
                return @"ManagedInstance";
            case AWSSsmResourceTypeForTaggingMaintenanceWindow:
                return @"MaintenanceWindow";
            case AWSSsmResourceTypeForTaggingParameter:
                return @"Parameter";
            case AWSSsmResourceTypeForTaggingPatchBaseline:
                return @"PatchBaseline";
            case AWSSsmResourceTypeForTaggingOpsItem:
                return @"OpsItem";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTag class]];
}

@end

@implementation AWSSsmAddTagsToResourceResult

@end

@implementation AWSSsmAssociation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"associationName" : @"AssociationName",
             @"associationVersion" : @"AssociationVersion",
             @"documentVersion" : @"DocumentVersion",
             @"instanceId" : @"InstanceId",
             @"lastExecutionDate" : @"LastExecutionDate",
             @"name" : @"Name",
             @"overview" : @"Overview",
             @"scheduleExpression" : @"ScheduleExpression",
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)lastExecutionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)overviewJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmAssociationOverview class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTarget class]];
}

@end

@implementation AWSSsmAssociationDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyOnlyAtCronInterval" : @"ApplyOnlyAtCronInterval",
             @"associationId" : @"AssociationId",
             @"associationName" : @"AssociationName",
             @"associationVersion" : @"AssociationVersion",
             @"automationTargetParameterName" : @"AutomationTargetParameterName",
             @"complianceSeverity" : @"ComplianceSeverity",
             @"date" : @"Date",
             @"documentVersion" : @"DocumentVersion",
             @"instanceId" : @"InstanceId",
             @"lastExecutionDate" : @"LastExecutionDate",
             @"lastSuccessfulExecutionDate" : @"LastSuccessfulExecutionDate",
             @"lastUpdateAssociationDate" : @"LastUpdateAssociationDate",
             @"maxConcurrency" : @"MaxConcurrency",
             @"maxErrors" : @"MaxErrors",
             @"name" : @"Name",
             @"outputLocation" : @"OutputLocation",
             @"overview" : @"Overview",
             @"parameters" : @"Parameters",
             @"scheduleExpression" : @"ScheduleExpression",
             @"status" : @"Status",
             @"syncCompliance" : @"SyncCompliance",
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)complianceSeverityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityUnspecified);
        }
        return @(AWSSsmAssociationComplianceSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmAssociationComplianceSeverityCritical:
                return @"CRITICAL";
            case AWSSsmAssociationComplianceSeverityHigh:
                return @"HIGH";
            case AWSSsmAssociationComplianceSeverityMedium:
                return @"MEDIUM";
            case AWSSsmAssociationComplianceSeverityLow:
                return @"LOW";
            case AWSSsmAssociationComplianceSeverityUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastExecutionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastSuccessfulExecutionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdateAssociationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)outputLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmInstanceAssociationOutputLocation class]];
}

+ (NSValueTransformer *)overviewJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmAssociationOverview class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmAssociationStatus class]];
}

+ (NSValueTransformer *)syncComplianceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSSsmAssociationSyncComplianceAuto);
        }
        if ([value caseInsensitiveCompare:@"MANUAL"] == NSOrderedSame) {
            return @(AWSSsmAssociationSyncComplianceManual);
        }
        return @(AWSSsmAssociationSyncComplianceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmAssociationSyncComplianceAuto:
                return @"AUTO";
            case AWSSsmAssociationSyncComplianceManual:
                return @"MANUAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTarget class]];
}

@end

@implementation AWSSsmAssociationExecution

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"associationVersion" : @"AssociationVersion",
             @"createdTime" : @"CreatedTime",
             @"detailedStatus" : @"DetailedStatus",
             @"executionId" : @"ExecutionId",
             @"lastExecutionDate" : @"LastExecutionDate",
             @"resourceCountByStatus" : @"ResourceCountByStatus",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastExecutionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSsmAssociationExecutionFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ExecutionId"] == NSOrderedSame) {
            return @(AWSSsmAssociationExecutionFilterKeyExecutionId);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSsmAssociationExecutionFilterKeyStatus);
        }
        if ([value caseInsensitiveCompare:@"CreatedTime"] == NSOrderedSame) {
            return @(AWSSsmAssociationExecutionFilterKeyCreatedTime);
        }
        return @(AWSSsmAssociationExecutionFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmAssociationExecutionFilterKeyExecutionId:
                return @"ExecutionId";
            case AWSSsmAssociationExecutionFilterKeyStatus:
                return @"Status";
            case AWSSsmAssociationExecutionFilterKeyCreatedTime:
                return @"CreatedTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EQUAL"] == NSOrderedSame) {
            return @(AWSSsmAssociationFilterOperatorTypeEqual);
        }
        if ([value caseInsensitiveCompare:@"LESS_THAN"] == NSOrderedSame) {
            return @(AWSSsmAssociationFilterOperatorTypeLessThan);
        }
        if ([value caseInsensitiveCompare:@"GREATER_THAN"] == NSOrderedSame) {
            return @(AWSSsmAssociationFilterOperatorTypeGreaterThan);
        }
        return @(AWSSsmAssociationFilterOperatorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmAssociationFilterOperatorTypeEqual:
                return @"EQUAL";
            case AWSSsmAssociationFilterOperatorTypeLessThan:
                return @"LESS_THAN";
            case AWSSsmAssociationFilterOperatorTypeGreaterThan:
                return @"GREATER_THAN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmAssociationExecutionTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"associationVersion" : @"AssociationVersion",
             @"detailedStatus" : @"DetailedStatus",
             @"executionId" : @"ExecutionId",
             @"lastExecutionDate" : @"LastExecutionDate",
             @"outputSource" : @"OutputSource",
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)lastExecutionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)outputSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmOutputSource class]];
}

@end

@implementation AWSSsmAssociationExecutionTargetsFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSsmAssociationExecutionTargetsFilterKeyStatus);
        }
        if ([value caseInsensitiveCompare:@"ResourceId"] == NSOrderedSame) {
            return @(AWSSsmAssociationExecutionTargetsFilterKeyResourceId);
        }
        if ([value caseInsensitiveCompare:@"ResourceType"] == NSOrderedSame) {
            return @(AWSSsmAssociationExecutionTargetsFilterKeyResourceType);
        }
        return @(AWSSsmAssociationExecutionTargetsFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmAssociationExecutionTargetsFilterKeyStatus:
                return @"Status";
            case AWSSsmAssociationExecutionTargetsFilterKeyResourceId:
                return @"ResourceId";
            case AWSSsmAssociationExecutionTargetsFilterKeyResourceType:
                return @"ResourceType";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmAssociationFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InstanceId"] == NSOrderedSame) {
            return @(AWSSsmAssociationFilterKeyInstanceId);
        }
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSSsmAssociationFilterKeyName);
        }
        if ([value caseInsensitiveCompare:@"AssociationId"] == NSOrderedSame) {
            return @(AWSSsmAssociationFilterKeyAssociationId);
        }
        if ([value caseInsensitiveCompare:@"AssociationStatusName"] == NSOrderedSame) {
            return @(AWSSsmAssociationFilterKeyAssociationStatusName);
        }
        if ([value caseInsensitiveCompare:@"LastExecutedBefore"] == NSOrderedSame) {
            return @(AWSSsmAssociationFilterKeyLastExecutedBefore);
        }
        if ([value caseInsensitiveCompare:@"LastExecutedAfter"] == NSOrderedSame) {
            return @(AWSSsmAssociationFilterKeyLastExecutedAfter);
        }
        if ([value caseInsensitiveCompare:@"AssociationName"] == NSOrderedSame) {
            return @(AWSSsmAssociationFilterKeyAssociationName);
        }
        if ([value caseInsensitiveCompare:@"ResourceGroupName"] == NSOrderedSame) {
            return @(AWSSsmAssociationFilterKeyResourceGroupName);
        }
        return @(AWSSsmAssociationFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmAssociationFilterKeyInstanceId:
                return @"InstanceId";
            case AWSSsmAssociationFilterKeyName:
                return @"Name";
            case AWSSsmAssociationFilterKeyAssociationId:
                return @"AssociationId";
            case AWSSsmAssociationFilterKeyAssociationStatusName:
                return @"AssociationStatusName";
            case AWSSsmAssociationFilterKeyLastExecutedBefore:
                return @"LastExecutedBefore";
            case AWSSsmAssociationFilterKeyLastExecutedAfter:
                return @"LastExecutedAfter";
            case AWSSsmAssociationFilterKeyAssociationName:
                return @"AssociationName";
            case AWSSsmAssociationFilterKeyResourceGroupName:
                return @"ResourceGroupName";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmAssociationOverview

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationStatusAggregatedCount" : @"AssociationStatusAggregatedCount",
             @"detailedStatus" : @"DetailedStatus",
             @"status" : @"Status",
             };
}

@end

@implementation AWSSsmAssociationStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalInfo" : @"AdditionalInfo",
             @"date" : @"Date",
             @"message" : @"Message",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)dateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSsmAssociationStatusNamePending);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSsmAssociationStatusNameSuccess);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSsmAssociationStatusNameFailed);
        }
        return @(AWSSsmAssociationStatusNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmAssociationStatusNamePending:
                return @"Pending";
            case AWSSsmAssociationStatusNameSuccess:
                return @"Success";
            case AWSSsmAssociationStatusNameFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmAssociationVersionInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyOnlyAtCronInterval" : @"ApplyOnlyAtCronInterval",
             @"associationId" : @"AssociationId",
             @"associationName" : @"AssociationName",
             @"associationVersion" : @"AssociationVersion",
             @"complianceSeverity" : @"ComplianceSeverity",
             @"createdDate" : @"CreatedDate",
             @"documentVersion" : @"DocumentVersion",
             @"maxConcurrency" : @"MaxConcurrency",
             @"maxErrors" : @"MaxErrors",
             @"name" : @"Name",
             @"outputLocation" : @"OutputLocation",
             @"parameters" : @"Parameters",
             @"scheduleExpression" : @"ScheduleExpression",
             @"syncCompliance" : @"SyncCompliance",
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)complianceSeverityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityUnspecified);
        }
        return @(AWSSsmAssociationComplianceSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmAssociationComplianceSeverityCritical:
                return @"CRITICAL";
            case AWSSsmAssociationComplianceSeverityHigh:
                return @"HIGH";
            case AWSSsmAssociationComplianceSeverityMedium:
                return @"MEDIUM";
            case AWSSsmAssociationComplianceSeverityLow:
                return @"LOW";
            case AWSSsmAssociationComplianceSeverityUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)outputLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmInstanceAssociationOutputLocation class]];
}

+ (NSValueTransformer *)syncComplianceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSSsmAssociationSyncComplianceAuto);
        }
        if ([value caseInsensitiveCompare:@"MANUAL"] == NSOrderedSame) {
            return @(AWSSsmAssociationSyncComplianceManual);
        }
        return @(AWSSsmAssociationSyncComplianceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmAssociationSyncComplianceAuto:
                return @"AUTO";
            case AWSSsmAssociationSyncComplianceManual:
                return @"MANUAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTarget class]];
}

@end

@implementation AWSSsmAttachmentContent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hash" : @"Hash",
             @"hashType" : @"HashType",
             @"name" : @"Name",
             @"size" : @"Size",
             @"url" : @"Url",
             };
}

+ (NSValueTransformer *)hashTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Sha256"] == NSOrderedSame) {
            return @(AWSSsmAttachmentHashTypeSha256);
        }
        return @(AWSSsmAttachmentHashTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmAttachmentHashTypeSha256:
                return @"Sha256";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmAttachmentInformation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSSsmAttachmentsSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"name" : @"Name",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SourceUrl"] == NSOrderedSame) {
            return @(AWSSsmAttachmentsSourceKeySourceUrl);
        }
        if ([value caseInsensitiveCompare:@"S3FileUrl"] == NSOrderedSame) {
            return @(AWSSsmAttachmentsSourceKeyS3FileUrl);
        }
        if ([value caseInsensitiveCompare:@"AttachmentReference"] == NSOrderedSame) {
            return @(AWSSsmAttachmentsSourceKeyAttachmentReference);
        }
        return @(AWSSsmAttachmentsSourceKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmAttachmentsSourceKeySourceUrl:
                return @"SourceUrl";
            case AWSSsmAttachmentsSourceKeyS3FileUrl:
                return @"S3FileUrl";
            case AWSSsmAttachmentsSourceKeyAttachmentReference:
                return @"AttachmentReference";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmAutomationExecution

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automationExecutionId" : @"AutomationExecutionId",
             @"automationExecutionStatus" : @"AutomationExecutionStatus",
             @"currentAction" : @"CurrentAction",
             @"currentStepName" : @"CurrentStepName",
             @"documentName" : @"DocumentName",
             @"documentVersion" : @"DocumentVersion",
             @"executedBy" : @"ExecutedBy",
             @"executionEndTime" : @"ExecutionEndTime",
             @"executionStartTime" : @"ExecutionStartTime",
             @"failureMessage" : @"FailureMessage",
             @"maxConcurrency" : @"MaxConcurrency",
             @"maxErrors" : @"MaxErrors",
             @"mode" : @"Mode",
             @"outputs" : @"Outputs",
             @"parameters" : @"Parameters",
             @"parentAutomationExecutionId" : @"ParentAutomationExecutionId",
             @"progressCounters" : @"ProgressCounters",
             @"resolvedTargets" : @"ResolvedTargets",
             @"stepExecutions" : @"StepExecutions",
             @"stepExecutionsTruncated" : @"StepExecutionsTruncated",
             @"target" : @"Target",
             @"targetLocations" : @"TargetLocations",
             @"targetMaps" : @"TargetMaps",
             @"targetParameterName" : @"TargetParameterName",
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)automationExecutionStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Waiting"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionStatusWaiting);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"TimedOut"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"Cancelling"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionStatusFailed);
        }
        return @(AWSSsmAutomationExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmAutomationExecutionStatusPending:
                return @"Pending";
            case AWSSsmAutomationExecutionStatusInProgress:
                return @"InProgress";
            case AWSSsmAutomationExecutionStatusWaiting:
                return @"Waiting";
            case AWSSsmAutomationExecutionStatusSuccess:
                return @"Success";
            case AWSSsmAutomationExecutionStatusTimedOut:
                return @"TimedOut";
            case AWSSsmAutomationExecutionStatusCancelling:
                return @"Cancelling";
            case AWSSsmAutomationExecutionStatusCancelled:
                return @"Cancelled";
            case AWSSsmAutomationExecutionStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)executionEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)executionStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Auto"] == NSOrderedSame) {
            return @(AWSSsmExecutionModeAuto);
        }
        if ([value caseInsensitiveCompare:@"Interactive"] == NSOrderedSame) {
            return @(AWSSsmExecutionModeInteractive);
        }
        return @(AWSSsmExecutionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmExecutionModeAuto:
                return @"Auto";
            case AWSSsmExecutionModeInteractive:
                return @"Interactive";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)progressCountersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmProgressCounters class]];
}

+ (NSValueTransformer *)resolvedTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmResolvedTargets class]];
}

+ (NSValueTransformer *)stepExecutionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmStepExecution class]];
}

+ (NSValueTransformer *)targetLocationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTargetLocation class]];
}

+ (NSValueTransformer *)targetMapsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[java.util.List<NSString> class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTarget class]];
}

@end

@implementation AWSSsmAutomationExecutionFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DocumentNamePrefix"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionFilterKeyDocumentNamePrefix);
        }
        if ([value caseInsensitiveCompare:@"ExecutionStatus"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionFilterKeyExecutionStatus);
        }
        if ([value caseInsensitiveCompare:@"ExecutionId"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionFilterKeyExecutionId);
        }
        if ([value caseInsensitiveCompare:@"ParentExecutionId"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionFilterKeyParentExecutionId);
        }
        if ([value caseInsensitiveCompare:@"CurrentAction"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionFilterKeyCurrentAction);
        }
        if ([value caseInsensitiveCompare:@"StartTimeBefore"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionFilterKeyStartTimeBefore);
        }
        if ([value caseInsensitiveCompare:@"StartTimeAfter"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionFilterKeyStartTimeAfter);
        }
        if ([value caseInsensitiveCompare:@"AutomationType"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionFilterKeyAutomationType);
        }
        if ([value caseInsensitiveCompare:@"TagKey"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionFilterKeyTagKey);
        }
        return @(AWSSsmAutomationExecutionFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmAutomationExecutionFilterKeyDocumentNamePrefix:
                return @"DocumentNamePrefix";
            case AWSSsmAutomationExecutionFilterKeyExecutionStatus:
                return @"ExecutionStatus";
            case AWSSsmAutomationExecutionFilterKeyExecutionId:
                return @"ExecutionId";
            case AWSSsmAutomationExecutionFilterKeyParentExecutionId:
                return @"ParentExecutionId";
            case AWSSsmAutomationExecutionFilterKeyCurrentAction:
                return @"CurrentAction";
            case AWSSsmAutomationExecutionFilterKeyStartTimeBefore:
                return @"StartTimeBefore";
            case AWSSsmAutomationExecutionFilterKeyStartTimeAfter:
                return @"StartTimeAfter";
            case AWSSsmAutomationExecutionFilterKeyAutomationType:
                return @"AutomationType";
            case AWSSsmAutomationExecutionFilterKeyTagKey:
                return @"TagKey";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmAutomationExecutionMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automationExecutionId" : @"AutomationExecutionId",
             @"automationExecutionStatus" : @"AutomationExecutionStatus",
             @"automationType" : @"AutomationType",
             @"currentAction" : @"CurrentAction",
             @"currentStepName" : @"CurrentStepName",
             @"documentName" : @"DocumentName",
             @"documentVersion" : @"DocumentVersion",
             @"executedBy" : @"ExecutedBy",
             @"executionEndTime" : @"ExecutionEndTime",
             @"executionStartTime" : @"ExecutionStartTime",
             @"failureMessage" : @"FailureMessage",
             @"logFile" : @"LogFile",
             @"maxConcurrency" : @"MaxConcurrency",
             @"maxErrors" : @"MaxErrors",
             @"mode" : @"Mode",
             @"outputs" : @"Outputs",
             @"parentAutomationExecutionId" : @"ParentAutomationExecutionId",
             @"resolvedTargets" : @"ResolvedTargets",
             @"target" : @"Target",
             @"targetMaps" : @"TargetMaps",
             @"targetParameterName" : @"TargetParameterName",
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)automationExecutionStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Waiting"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionStatusWaiting);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"TimedOut"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"Cancelling"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionStatusFailed);
        }
        return @(AWSSsmAutomationExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmAutomationExecutionStatusPending:
                return @"Pending";
            case AWSSsmAutomationExecutionStatusInProgress:
                return @"InProgress";
            case AWSSsmAutomationExecutionStatusWaiting:
                return @"Waiting";
            case AWSSsmAutomationExecutionStatusSuccess:
                return @"Success";
            case AWSSsmAutomationExecutionStatusTimedOut:
                return @"TimedOut";
            case AWSSsmAutomationExecutionStatusCancelling:
                return @"Cancelling";
            case AWSSsmAutomationExecutionStatusCancelled:
                return @"Cancelled";
            case AWSSsmAutomationExecutionStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)automationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CrossAccount"] == NSOrderedSame) {
            return @(AWSSsmAutomationTypeCrossAccount);
        }
        if ([value caseInsensitiveCompare:@"Local"] == NSOrderedSame) {
            return @(AWSSsmAutomationTypeLocal);
        }
        return @(AWSSsmAutomationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmAutomationTypeCrossAccount:
                return @"CrossAccount";
            case AWSSsmAutomationTypeLocal:
                return @"Local";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)executionEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)executionStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Auto"] == NSOrderedSame) {
            return @(AWSSsmExecutionModeAuto);
        }
        if ([value caseInsensitiveCompare:@"Interactive"] == NSOrderedSame) {
            return @(AWSSsmExecutionModeInteractive);
        }
        return @(AWSSsmExecutionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmExecutionModeAuto:
                return @"Auto";
            case AWSSsmExecutionModeInteractive:
                return @"Interactive";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resolvedTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmResolvedTargets class]];
}

+ (NSValueTransformer *)targetMapsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[java.util.List<NSString> class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTarget class]];
}

@end

@implementation AWSSsmCancelCommandRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commandId" : @"CommandId",
             @"instanceIds" : @"InstanceIds",
             };
}

@end

@implementation AWSSsmCancelCommandResult

@end

@implementation AWSSsmCancelMaintenanceWindowExecutionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowExecutionId" : @"WindowExecutionId",
             };
}

@end

@implementation AWSSsmCancelMaintenanceWindowExecutionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowExecutionId" : @"WindowExecutionId",
             };
}

@end

@implementation AWSSsmCloudWatchOutputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLogGroupName" : @"CloudWatchLogGroupName",
             @"cloudWatchOutputEnabled" : @"CloudWatchOutputEnabled",
             };
}

@end

@implementation AWSSsmCommand

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchOutputConfig" : @"CloudWatchOutputConfig",
             @"commandId" : @"CommandId",
             @"comment" : @"Comment",
             @"completedCount" : @"CompletedCount",
             @"deliveryTimedOutCount" : @"DeliveryTimedOutCount",
             @"documentName" : @"DocumentName",
             @"documentVersion" : @"DocumentVersion",
             @"errorCount" : @"ErrorCount",
             @"expiresAfter" : @"ExpiresAfter",
             @"instanceIds" : @"InstanceIds",
             @"maxConcurrency" : @"MaxConcurrency",
             @"maxErrors" : @"MaxErrors",
             @"notificationConfig" : @"NotificationConfig",
             @"outputS3BucketName" : @"OutputS3BucketName",
             @"outputS3KeyPrefix" : @"OutputS3KeyPrefix",
             @"outputS3Region" : @"OutputS3Region",
             @"parameters" : @"Parameters",
             @"requestedDateTime" : @"RequestedDateTime",
             @"serviceRole" : @"ServiceRole",
             @"status" : @"Status",
             @"statusDetails" : @"StatusDetails",
             @"targetCount" : @"TargetCount",
             @"targets" : @"Targets",
             @"timeoutSeconds" : @"TimeoutSeconds",
             };
}

+ (NSValueTransformer *)cloudWatchOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmCloudWatchOutputConfig class]];
}

+ (NSValueTransformer *)expiresAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)notificationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmNotificationConfig class]];
}

+ (NSValueTransformer *)requestedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSsmCommandStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSsmCommandStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSsmCommandStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSsmCommandStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSsmCommandStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TimedOut"] == NSOrderedSame) {
            return @(AWSSsmCommandStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"Cancelling"] == NSOrderedSame) {
            return @(AWSSsmCommandStatusCancelling);
        }
        return @(AWSSsmCommandStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmCommandStatusPending:
                return @"Pending";
            case AWSSsmCommandStatusInProgress:
                return @"InProgress";
            case AWSSsmCommandStatusSuccess:
                return @"Success";
            case AWSSsmCommandStatusCancelled:
                return @"Cancelled";
            case AWSSsmCommandStatusFailed:
                return @"Failed";
            case AWSSsmCommandStatusTimedOut:
                return @"TimedOut";
            case AWSSsmCommandStatusCancelling:
                return @"Cancelling";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTarget class]];
}

@end

@implementation AWSSsmCommandFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InvokedAfter"] == NSOrderedSame) {
            return @(AWSSsmCommandFilterKeyInvokedAfter);
        }
        if ([value caseInsensitiveCompare:@"InvokedBefore"] == NSOrderedSame) {
            return @(AWSSsmCommandFilterKeyInvokedBefore);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSsmCommandFilterKeyStatus);
        }
        if ([value caseInsensitiveCompare:@"ExecutionStage"] == NSOrderedSame) {
            return @(AWSSsmCommandFilterKeyExecutionStage);
        }
        if ([value caseInsensitiveCompare:@"DocumentName"] == NSOrderedSame) {
            return @(AWSSsmCommandFilterKeyDocumentName);
        }
        return @(AWSSsmCommandFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmCommandFilterKeyInvokedAfter:
                return @"InvokedAfter";
            case AWSSsmCommandFilterKeyInvokedBefore:
                return @"InvokedBefore";
            case AWSSsmCommandFilterKeyStatus:
                return @"Status";
            case AWSSsmCommandFilterKeyExecutionStage:
                return @"ExecutionStage";
            case AWSSsmCommandFilterKeyDocumentName:
                return @"DocumentName";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmCommandInvocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchOutputConfig" : @"CloudWatchOutputConfig",
             @"commandId" : @"CommandId",
             @"commandPlugins" : @"CommandPlugins",
             @"comment" : @"Comment",
             @"documentName" : @"DocumentName",
             @"documentVersion" : @"DocumentVersion",
             @"instanceId" : @"InstanceId",
             @"instanceName" : @"InstanceName",
             @"notificationConfig" : @"NotificationConfig",
             @"requestedDateTime" : @"RequestedDateTime",
             @"serviceRole" : @"ServiceRole",
             @"standardErrorUrl" : @"StandardErrorUrl",
             @"standardOutputUrl" : @"StandardOutputUrl",
             @"status" : @"Status",
             @"statusDetails" : @"StatusDetails",
             @"traceOutput" : @"TraceOutput",
             };
}

+ (NSValueTransformer *)cloudWatchOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmCloudWatchOutputConfig class]];
}

+ (NSValueTransformer *)commandPluginsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmCommandPlugin class]];
}

+ (NSValueTransformer *)notificationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmNotificationConfig class]];
}

+ (NSValueTransformer *)requestedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSsmCommandInvocationStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSsmCommandInvocationStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Delayed"] == NSOrderedSame) {
            return @(AWSSsmCommandInvocationStatusDelayed);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSsmCommandInvocationStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSsmCommandInvocationStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"TimedOut"] == NSOrderedSame) {
            return @(AWSSsmCommandInvocationStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSsmCommandInvocationStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Cancelling"] == NSOrderedSame) {
            return @(AWSSsmCommandInvocationStatusCancelling);
        }
        return @(AWSSsmCommandInvocationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmCommandInvocationStatusPending:
                return @"Pending";
            case AWSSsmCommandInvocationStatusInProgress:
                return @"InProgress";
            case AWSSsmCommandInvocationStatusDelayed:
                return @"Delayed";
            case AWSSsmCommandInvocationStatusSuccess:
                return @"Success";
            case AWSSsmCommandInvocationStatusCancelled:
                return @"Cancelled";
            case AWSSsmCommandInvocationStatusTimedOut:
                return @"TimedOut";
            case AWSSsmCommandInvocationStatusFailed:
                return @"Failed";
            case AWSSsmCommandInvocationStatusCancelling:
                return @"Cancelling";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmCommandPlugin

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"output" : @"Output",
             @"outputS3BucketName" : @"OutputS3BucketName",
             @"outputS3KeyPrefix" : @"OutputS3KeyPrefix",
             @"outputS3Region" : @"OutputS3Region",
             @"responseCode" : @"ResponseCode",
             @"responseFinishDateTime" : @"ResponseFinishDateTime",
             @"responseStartDateTime" : @"ResponseStartDateTime",
             @"standardErrorUrl" : @"StandardErrorUrl",
             @"standardOutputUrl" : @"StandardOutputUrl",
             @"status" : @"Status",
             @"statusDetails" : @"StatusDetails",
             };
}

+ (NSValueTransformer *)responseFinishDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)responseStartDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSsmCommandPluginStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSsmCommandPluginStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSsmCommandPluginStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"TimedOut"] == NSOrderedSame) {
            return @(AWSSsmCommandPluginStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSsmCommandPluginStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSsmCommandPluginStatusFailed);
        }
        return @(AWSSsmCommandPluginStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmCommandPluginStatusPending:
                return @"Pending";
            case AWSSsmCommandPluginStatusInProgress:
                return @"InProgress";
            case AWSSsmCommandPluginStatusSuccess:
                return @"Success";
            case AWSSsmCommandPluginStatusTimedOut:
                return @"TimedOut";
            case AWSSsmCommandPluginStatusCancelled:
                return @"Cancelled";
            case AWSSsmCommandPluginStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmComplianceExecutionSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"executionId" : @"ExecutionId",
             @"executionTime" : @"ExecutionTime",
             @"executionType" : @"ExecutionType",
             };
}

+ (NSValueTransformer *)executionTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSsmComplianceItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"complianceType" : @"ComplianceType",
             @"details" : @"Details",
             @"executionSummary" : @"ExecutionSummary",
             @"identifier" : @"Id",
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             @"severity" : @"Severity",
             @"status" : @"Status",
             @"title" : @"Title",
             };
}

+ (NSValueTransformer *)executionSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmComplianceExecutionSummary class]];
}

+ (NSValueTransformer *)severityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSsmComplianceSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSsmComplianceSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSsmComplianceSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSsmComplianceSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSsmComplianceSeverityInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSsmComplianceSeverityUnspecified);
        }
        return @(AWSSsmComplianceSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmComplianceSeverityCritical:
                return @"CRITICAL";
            case AWSSsmComplianceSeverityHigh:
                return @"HIGH";
            case AWSSsmComplianceSeverityMedium:
                return @"MEDIUM";
            case AWSSsmComplianceSeverityLow:
                return @"LOW";
            case AWSSsmComplianceSeverityInformational:
                return @"INFORMATIONAL";
            case AWSSsmComplianceSeverityUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLIANT"] == NSOrderedSame) {
            return @(AWSSsmComplianceStatusCompliant);
        }
        if ([value caseInsensitiveCompare:@"NON_COMPLIANT"] == NSOrderedSame) {
            return @(AWSSsmComplianceStatusNonCompliant);
        }
        return @(AWSSsmComplianceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmComplianceStatusCompliant:
                return @"COMPLIANT";
            case AWSSsmComplianceStatusNonCompliant:
                return @"NON_COMPLIANT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmComplianceItemEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"details" : @"Details",
             @"identifier" : @"Id",
             @"severity" : @"Severity",
             @"status" : @"Status",
             @"title" : @"Title",
             };
}

+ (NSValueTransformer *)severityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSsmComplianceSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSsmComplianceSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSsmComplianceSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSsmComplianceSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSsmComplianceSeverityInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSsmComplianceSeverityUnspecified);
        }
        return @(AWSSsmComplianceSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmComplianceSeverityCritical:
                return @"CRITICAL";
            case AWSSsmComplianceSeverityHigh:
                return @"HIGH";
            case AWSSsmComplianceSeverityMedium:
                return @"MEDIUM";
            case AWSSsmComplianceSeverityLow:
                return @"LOW";
            case AWSSsmComplianceSeverityInformational:
                return @"INFORMATIONAL";
            case AWSSsmComplianceSeverityUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLIANT"] == NSOrderedSame) {
            return @(AWSSsmComplianceStatusCompliant);
        }
        if ([value caseInsensitiveCompare:@"NON_COMPLIANT"] == NSOrderedSame) {
            return @(AWSSsmComplianceStatusNonCompliant);
        }
        return @(AWSSsmComplianceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmComplianceStatusCompliant:
                return @"COMPLIANT";
            case AWSSsmComplianceStatusNonCompliant:
                return @"NON_COMPLIANT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmComplianceStringFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"types" : @"Type",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EQUAL"] == NSOrderedSame) {
            return @(AWSSsmComplianceQueryOperatorTypeEqual);
        }
        if ([value caseInsensitiveCompare:@"NOT_EQUAL"] == NSOrderedSame) {
            return @(AWSSsmComplianceQueryOperatorTypeNotEqual);
        }
        if ([value caseInsensitiveCompare:@"BEGIN_WITH"] == NSOrderedSame) {
            return @(AWSSsmComplianceQueryOperatorTypeBeginWith);
        }
        if ([value caseInsensitiveCompare:@"LESS_THAN"] == NSOrderedSame) {
            return @(AWSSsmComplianceQueryOperatorTypeLessThan);
        }
        if ([value caseInsensitiveCompare:@"GREATER_THAN"] == NSOrderedSame) {
            return @(AWSSsmComplianceQueryOperatorTypeGreaterThan);
        }
        return @(AWSSsmComplianceQueryOperatorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmComplianceQueryOperatorTypeEqual:
                return @"EQUAL";
            case AWSSsmComplianceQueryOperatorTypeNotEqual:
                return @"NOT_EQUAL";
            case AWSSsmComplianceQueryOperatorTypeBeginWith:
                return @"BEGIN_WITH";
            case AWSSsmComplianceQueryOperatorTypeLessThan:
                return @"LESS_THAN";
            case AWSSsmComplianceQueryOperatorTypeGreaterThan:
                return @"GREATER_THAN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmComplianceSummaryItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"complianceType" : @"ComplianceType",
             @"compliantSummary" : @"CompliantSummary",
             @"nonCompliantSummary" : @"NonCompliantSummary",
             };
}

+ (NSValueTransformer *)compliantSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmCompliantSummary class]];
}

+ (NSValueTransformer *)nonCompliantSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmNonCompliantSummary class]];
}

@end

@implementation AWSSsmCompliantSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compliantCount" : @"CompliantCount",
             @"severitySummary" : @"SeveritySummary",
             };
}

+ (NSValueTransformer *)severitySummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmSeveritySummary class]];
}

@end

@implementation AWSSsmCreateActivationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultInstanceName" : @"DefaultInstanceName",
             @"detail" : @"Description",
             @"expirationDate" : @"ExpirationDate",
             @"iamRole" : @"IamRole",
             @"registrationLimit" : @"RegistrationLimit",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)expirationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTag class]];
}

@end

@implementation AWSSsmCreateActivationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activationCode" : @"ActivationCode",
             @"activationId" : @"ActivationId",
             };
}

@end

@implementation AWSSsmCreateAssociationBatchRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entries" : @"Entries",
             };
}

+ (NSValueTransformer *)entriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmCreateAssociationBatchRequestEntry class]];
}

@end

@implementation AWSSsmCreateAssociationBatchRequestEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyOnlyAtCronInterval" : @"ApplyOnlyAtCronInterval",
             @"associationName" : @"AssociationName",
             @"automationTargetParameterName" : @"AutomationTargetParameterName",
             @"complianceSeverity" : @"ComplianceSeverity",
             @"documentVersion" : @"DocumentVersion",
             @"instanceId" : @"InstanceId",
             @"maxConcurrency" : @"MaxConcurrency",
             @"maxErrors" : @"MaxErrors",
             @"name" : @"Name",
             @"outputLocation" : @"OutputLocation",
             @"parameters" : @"Parameters",
             @"scheduleExpression" : @"ScheduleExpression",
             @"syncCompliance" : @"SyncCompliance",
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)complianceSeverityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityUnspecified);
        }
        return @(AWSSsmAssociationComplianceSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmAssociationComplianceSeverityCritical:
                return @"CRITICAL";
            case AWSSsmAssociationComplianceSeverityHigh:
                return @"HIGH";
            case AWSSsmAssociationComplianceSeverityMedium:
                return @"MEDIUM";
            case AWSSsmAssociationComplianceSeverityLow:
                return @"LOW";
            case AWSSsmAssociationComplianceSeverityUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmInstanceAssociationOutputLocation class]];
}

+ (NSValueTransformer *)syncComplianceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSSsmAssociationSyncComplianceAuto);
        }
        if ([value caseInsensitiveCompare:@"MANUAL"] == NSOrderedSame) {
            return @(AWSSsmAssociationSyncComplianceManual);
        }
        return @(AWSSsmAssociationSyncComplianceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmAssociationSyncComplianceAuto:
                return @"AUTO";
            case AWSSsmAssociationSyncComplianceManual:
                return @"MANUAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTarget class]];
}

@end

@implementation AWSSsmCreateAssociationBatchResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failed" : @"Failed",
             @"successful" : @"Successful",
             };
}

+ (NSValueTransformer *)failedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmFailedCreateAssociation class]];
}

+ (NSValueTransformer *)successfulJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmAssociationDescription class]];
}

@end

@implementation AWSSsmCreateAssociationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyOnlyAtCronInterval" : @"ApplyOnlyAtCronInterval",
             @"associationName" : @"AssociationName",
             @"automationTargetParameterName" : @"AutomationTargetParameterName",
             @"complianceSeverity" : @"ComplianceSeverity",
             @"documentVersion" : @"DocumentVersion",
             @"instanceId" : @"InstanceId",
             @"maxConcurrency" : @"MaxConcurrency",
             @"maxErrors" : @"MaxErrors",
             @"name" : @"Name",
             @"outputLocation" : @"OutputLocation",
             @"parameters" : @"Parameters",
             @"scheduleExpression" : @"ScheduleExpression",
             @"syncCompliance" : @"SyncCompliance",
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)complianceSeverityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityUnspecified);
        }
        return @(AWSSsmAssociationComplianceSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmAssociationComplianceSeverityCritical:
                return @"CRITICAL";
            case AWSSsmAssociationComplianceSeverityHigh:
                return @"HIGH";
            case AWSSsmAssociationComplianceSeverityMedium:
                return @"MEDIUM";
            case AWSSsmAssociationComplianceSeverityLow:
                return @"LOW";
            case AWSSsmAssociationComplianceSeverityUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmInstanceAssociationOutputLocation class]];
}

+ (NSValueTransformer *)syncComplianceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSSsmAssociationSyncComplianceAuto);
        }
        if ([value caseInsensitiveCompare:@"MANUAL"] == NSOrderedSame) {
            return @(AWSSsmAssociationSyncComplianceManual);
        }
        return @(AWSSsmAssociationSyncComplianceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmAssociationSyncComplianceAuto:
                return @"AUTO";
            case AWSSsmAssociationSyncComplianceManual:
                return @"MANUAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTarget class]];
}

@end

@implementation AWSSsmCreateAssociationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationDescription" : @"AssociationDescription",
             };
}

+ (NSValueTransformer *)associationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmAssociationDescription class]];
}

@end

@implementation AWSSsmCreateDocumentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachments" : @"Attachments",
             @"content" : @"Content",
             @"documentFormat" : @"DocumentFormat",
             @"documentType" : @"DocumentType",
             @"name" : @"Name",
             @"requires" : @"Requires",
             @"tags" : @"Tags",
             @"targetType" : @"TargetType",
             @"versionName" : @"VersionName",
             };
}

+ (NSValueTransformer *)attachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmAttachmentsSource class]];
}

+ (NSValueTransformer *)documentFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"YAML"] == NSOrderedSame) {
            return @(AWSSsmDocumentFormatYaml);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSSsmDocumentFormatJson);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSSsmDocumentFormatText);
        }
        return @(AWSSsmDocumentFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmDocumentFormatYaml:
                return @"YAML";
            case AWSSsmDocumentFormatJson:
                return @"JSON";
            case AWSSsmDocumentFormatText:
                return @"TEXT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)documentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Command"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeCommand);
        }
        if ([value caseInsensitiveCompare:@"Policy"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypePolicy);
        }
        if ([value caseInsensitiveCompare:@"Automation"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"Session"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeSession);
        }
        if ([value caseInsensitiveCompare:@"Package"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypePackage);
        }
        if ([value caseInsensitiveCompare:@"ApplicationConfiguration"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeApplicationConfiguration);
        }
        if ([value caseInsensitiveCompare:@"ApplicationConfigurationSchema"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeApplicationConfigurationSchema);
        }
        if ([value caseInsensitiveCompare:@"DeploymentStrategy"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeDeploymentStrategy);
        }
        if ([value caseInsensitiveCompare:@"ChangeCalendar"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeChangeCalendar);
        }
        return @(AWSSsmDocumentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmDocumentTypeCommand:
                return @"Command";
            case AWSSsmDocumentTypePolicy:
                return @"Policy";
            case AWSSsmDocumentTypeAutomation:
                return @"Automation";
            case AWSSsmDocumentTypeSession:
                return @"Session";
            case AWSSsmDocumentTypePackage:
                return @"Package";
            case AWSSsmDocumentTypeApplicationConfiguration:
                return @"ApplicationConfiguration";
            case AWSSsmDocumentTypeApplicationConfigurationSchema:
                return @"ApplicationConfigurationSchema";
            case AWSSsmDocumentTypeDeploymentStrategy:
                return @"DeploymentStrategy";
            case AWSSsmDocumentTypeChangeCalendar:
                return @"ChangeCalendar";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requiresJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmDocumentRequires class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTag class]];
}

@end

@implementation AWSSsmCreateDocumentResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentDescription" : @"DocumentDescription",
             };
}

+ (NSValueTransformer *)documentDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmDocumentDescription class]];
}

@end

@implementation AWSSsmCreateMaintenanceWindowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowUnassociatedTargets" : @"AllowUnassociatedTargets",
             @"clientToken" : @"ClientToken",
             @"cutoff" : @"Cutoff",
             @"detail" : @"Description",
             @"duration" : @"Duration",
             @"endDate" : @"EndDate",
             @"name" : @"Name",
             @"schedule" : @"Schedule",
             @"scheduleOffset" : @"ScheduleOffset",
             @"scheduleTimezone" : @"ScheduleTimezone",
             @"startDate" : @"StartDate",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTag class]];
}

@end

@implementation AWSSsmCreateMaintenanceWindowResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowId" : @"WindowId",
             };
}

@end

@implementation AWSSsmCreateOpsItemRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"category" : @"Category",
             @"detail" : @"Description",
             @"notifications" : @"Notifications",
             @"operationalData" : @"OperationalData",
             @"priority" : @"Priority",
             @"relatedOpsItems" : @"RelatedOpsItems",
             @"severity" : @"Severity",
             @"source" : @"Source",
             @"tags" : @"Tags",
             @"title" : @"Title",
             };
}

+ (NSValueTransformer *)notificationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmOpsItemNotification class]];
}

+ (NSValueTransformer *)operationalDataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSsmOpsItemDataValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)relatedOpsItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmRelatedOpsItem class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTag class]];
}

@end

@implementation AWSSsmCreateOpsItemResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"opsItemId" : @"OpsItemId",
             };
}

@end

@implementation AWSSsmCreatePatchBaselineRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRules" : @"ApprovalRules",
             @"approvedPatches" : @"ApprovedPatches",
             @"approvedPatchesComplianceLevel" : @"ApprovedPatchesComplianceLevel",
             @"approvedPatchesEnableNonSecurity" : @"ApprovedPatchesEnableNonSecurity",
             @"clientToken" : @"ClientToken",
             @"detail" : @"Description",
             @"globalFilters" : @"GlobalFilters",
             @"name" : @"Name",
             @"operatingSystem" : @"OperatingSystem",
             @"rejectedPatches" : @"RejectedPatches",
             @"rejectedPatchesAction" : @"RejectedPatchesAction",
             @"sources" : @"Sources",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)approvalRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmPatchRuleGroup class]];
}

+ (NSValueTransformer *)approvedPatchesComplianceLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelUnspecified);
        }
        return @(AWSSsmPatchComplianceLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmPatchComplianceLevelCritical:
                return @"CRITICAL";
            case AWSSsmPatchComplianceLevelHigh:
                return @"HIGH";
            case AWSSsmPatchComplianceLevelMedium:
                return @"MEDIUM";
            case AWSSsmPatchComplianceLevelLow:
                return @"LOW";
            case AWSSsmPatchComplianceLevelInformational:
                return @"INFORMATIONAL";
            case AWSSsmPatchComplianceLevelUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)globalFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmPatchFilterGroup class]];
}

+ (NSValueTransformer *)operatingSystemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WINDOWS"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemCentos);
        }
        if ([value caseInsensitiveCompare:@"ORACLE_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemOracleLinux);
        }
        if ([value caseInsensitiveCompare:@"DEBIAN"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemDebian);
        }
        return @(AWSSsmOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSsmOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSsmOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSsmOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSsmOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSsmOperatingSystemSuse:
                return @"SUSE";
            case AWSSsmOperatingSystemCentos:
                return @"CENTOS";
            case AWSSsmOperatingSystemOracleLinux:
                return @"ORACLE_LINUX";
            case AWSSsmOperatingSystemDebian:
                return @"DEBIAN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rejectedPatchesActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALLOW_AS_DEPENDENCY"] == NSOrderedSame) {
            return @(AWSSsmPatchActionAllowAsDependency);
        }
        if ([value caseInsensitiveCompare:@"BLOCK"] == NSOrderedSame) {
            return @(AWSSsmPatchActionBlock);
        }
        return @(AWSSsmPatchActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmPatchActionAllowAsDependency:
                return @"ALLOW_AS_DEPENDENCY";
            case AWSSsmPatchActionBlock:
                return @"BLOCK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmPatchSource class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTag class]];
}

@end

@implementation AWSSsmCreatePatchBaselineResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             };
}

@end

@implementation AWSSsmCreateResourceDataSyncRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Destination" : @"S3Destination",
             @"syncName" : @"SyncName",
             @"syncSource" : @"SyncSource",
             @"syncType" : @"SyncType",
             };
}

+ (NSValueTransformer *)s3DestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmResourceDataSyncS3Destination class]];
}

+ (NSValueTransformer *)syncSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmResourceDataSyncSource class]];
}

@end

@implementation AWSSsmCreateResourceDataSyncResult

@end

@implementation AWSSsmDeleteActivationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activationId" : @"ActivationId",
             };
}

@end

@implementation AWSSsmDeleteActivationResult

@end

@implementation AWSSsmDeleteAssociationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSSsmDeleteAssociationResult

@end

@implementation AWSSsmDeleteDocumentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentVersion" : @"DocumentVersion",
             @"force" : @"Force",
             @"name" : @"Name",
             @"versionName" : @"VersionName",
             };
}

@end

@implementation AWSSsmDeleteDocumentResult

@end

@implementation AWSSsmDeleteInventoryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"dryRun" : @"DryRun",
             @"schemaDeleteOption" : @"SchemaDeleteOption",
             @"typeName" : @"TypeName",
             };
}

+ (NSValueTransformer *)schemaDeleteOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DisableSchema"] == NSOrderedSame) {
            return @(AWSSsmInventorySchemaDeleteOptionDisableSchema);
        }
        if ([value caseInsensitiveCompare:@"DeleteSchema"] == NSOrderedSame) {
            return @(AWSSsmInventorySchemaDeleteOptionDeleteSchema);
        }
        return @(AWSSsmInventorySchemaDeleteOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmInventorySchemaDeleteOptionDisableSchema:
                return @"DisableSchema";
            case AWSSsmInventorySchemaDeleteOptionDeleteSchema:
                return @"DeleteSchema";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmDeleteInventoryResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deletionId" : @"DeletionId",
             @"deletionSummary" : @"DeletionSummary",
             @"typeName" : @"TypeName",
             };
}

+ (NSValueTransformer *)deletionSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmInventoryDeletionSummary class]];
}

@end

@implementation AWSSsmDeleteMaintenanceWindowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowId" : @"WindowId",
             };
}

@end

@implementation AWSSsmDeleteMaintenanceWindowResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowId" : @"WindowId",
             };
}

@end

@implementation AWSSsmDeleteParameterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSSsmDeleteParameterResult

@end

@implementation AWSSsmDeleteParametersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"names" : @"Names",
             };
}

@end

@implementation AWSSsmDeleteParametersResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deletedParameters" : @"DeletedParameters",
             @"invalidParameters" : @"InvalidParameters",
             };
}

@end

@implementation AWSSsmDeletePatchBaselineRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             };
}

@end

@implementation AWSSsmDeletePatchBaselineResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             };
}

@end

@implementation AWSSsmDeleteResourceDataSyncRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"syncName" : @"SyncName",
             @"syncType" : @"SyncType",
             };
}

@end

@implementation AWSSsmDeleteResourceDataSyncResult

@end

@implementation AWSSsmDeregisterManagedInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSSsmDeregisterManagedInstanceResult

@end

@implementation AWSSsmDeregisterPatchBaselineForPatchGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             @"patchGroup" : @"PatchGroup",
             };
}

@end

@implementation AWSSsmDeregisterPatchBaselineForPatchGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             @"patchGroup" : @"PatchGroup",
             };
}

@end

@implementation AWSSsmDeregisterTargetFromMaintenanceWindowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"safe" : @"Safe",
             @"windowId" : @"WindowId",
             @"windowTargetId" : @"WindowTargetId",
             };
}

@end

@implementation AWSSsmDeregisterTargetFromMaintenanceWindowResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowId" : @"WindowId",
             @"windowTargetId" : @"WindowTargetId",
             };
}

@end

@implementation AWSSsmDeregisterTaskFromMaintenanceWindowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowId" : @"WindowId",
             @"windowTaskId" : @"WindowTaskId",
             };
}

@end

@implementation AWSSsmDeregisterTaskFromMaintenanceWindowResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowId" : @"WindowId",
             @"windowTaskId" : @"WindowTaskId",
             };
}

@end

@implementation AWSSsmDescribeActivationsFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterKey" : @"FilterKey",
             @"filterValues" : @"FilterValues",
             };
}

+ (NSValueTransformer *)filterKeyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ActivationIds"] == NSOrderedSame) {
            return @(AWSSsmDescribeActivationsFilterKeysActivationIds);
        }
        if ([value caseInsensitiveCompare:@"DefaultInstanceName"] == NSOrderedSame) {
            return @(AWSSsmDescribeActivationsFilterKeysDefaultInstanceName);
        }
        if ([value caseInsensitiveCompare:@"IamRole"] == NSOrderedSame) {
            return @(AWSSsmDescribeActivationsFilterKeysIamRole);
        }
        return @(AWSSsmDescribeActivationsFilterKeysUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmDescribeActivationsFilterKeysActivationIds:
                return @"ActivationIds";
            case AWSSsmDescribeActivationsFilterKeysDefaultInstanceName:
                return @"DefaultInstanceName";
            case AWSSsmDescribeActivationsFilterKeysIamRole:
                return @"IamRole";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmDescribeActivationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmDescribeActivationsFilter class]];
}

@end

@implementation AWSSsmDescribeActivationsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activationList" : @"ActivationList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)activationListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmActivation class]];
}

@end

@implementation AWSSsmDescribeAssociationExecutionTargetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"executionId" : @"ExecutionId",
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmAssociationExecutionTargetsFilter class]];
}

@end

@implementation AWSSsmDescribeAssociationExecutionTargetsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationExecutionTargets" : @"AssociationExecutionTargets",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)associationExecutionTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmAssociationExecutionTarget class]];
}

@end

@implementation AWSSsmDescribeAssociationExecutionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmAssociationExecutionFilter class]];
}

@end

@implementation AWSSsmDescribeAssociationExecutionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationExecutions" : @"AssociationExecutions",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)associationExecutionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmAssociationExecution class]];
}

@end

@implementation AWSSsmDescribeAssociationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"associationVersion" : @"AssociationVersion",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSSsmDescribeAssociationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationDescription" : @"AssociationDescription",
             };
}

+ (NSValueTransformer *)associationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmAssociationDescription class]];
}

@end

@implementation AWSSsmDescribeAutomationExecutionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmAutomationExecutionFilter class]];
}

@end

@implementation AWSSsmDescribeAutomationExecutionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automationExecutionMetadataList" : @"AutomationExecutionMetadataList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)automationExecutionMetadataListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmAutomationExecutionMetadata class]];
}

@end

@implementation AWSSsmDescribeAutomationStepExecutionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automationExecutionId" : @"AutomationExecutionId",
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"reverseOrder" : @"ReverseOrder",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmStepExecutionFilter class]];
}

@end

@implementation AWSSsmDescribeAutomationStepExecutionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"stepExecutions" : @"StepExecutions",
             };
}

+ (NSValueTransformer *)stepExecutionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmStepExecution class]];
}

@end

@implementation AWSSsmDescribeAvailablePatchesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmPatchOrchestratorFilter class]];
}

@end

@implementation AWSSsmDescribeAvailablePatchesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"patches" : @"Patches",
             };
}

+ (NSValueTransformer *)patchesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmPatch class]];
}

@end

@implementation AWSSsmDescribeDocumentPermissionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"permissionType" : @"PermissionType",
             };
}

+ (NSValueTransformer *)permissionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Share"] == NSOrderedSame) {
            return @(AWSSsmDocumentPermissionTypeShare);
        }
        return @(AWSSsmDocumentPermissionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmDocumentPermissionTypeShare:
                return @"Share";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmDescribeDocumentPermissionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             @"accountSharingInfoList" : @"AccountSharingInfoList",
             };
}

+ (NSValueTransformer *)accountSharingInfoListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmAccountSharingInfo class]];
}

@end

@implementation AWSSsmDescribeDocumentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentVersion" : @"DocumentVersion",
             @"name" : @"Name",
             @"versionName" : @"VersionName",
             };
}

@end

@implementation AWSSsmDescribeDocumentResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"document" : @"Document",
             };
}

+ (NSValueTransformer *)documentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmDocumentDescription class]];
}

@end

@implementation AWSSsmDescribeEffectiveInstanceAssociationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSsmDescribeEffectiveInstanceAssociationsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associations" : @"Associations",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)associationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmInstanceAssociation class]];
}

@end

@implementation AWSSsmDescribeEffectivePatchesForPatchBaselineRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSsmDescribeEffectivePatchesForPatchBaselineResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"effectivePatches" : @"EffectivePatches",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)effectivePatchesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmEffectivePatch class]];
}

@end

@implementation AWSSsmDescribeInstanceAssociationsStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSsmDescribeInstanceAssociationsStatusResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceAssociationStatusInfos" : @"InstanceAssociationStatusInfos",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)instanceAssociationStatusInfosJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmInstanceAssociationStatusInfo class]];
}

@end

@implementation AWSSsmDescribeInstanceInformationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"instanceInformationFilterList" : @"InstanceInformationFilterList",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmInstanceInformationStringFilter class]];
}

+ (NSValueTransformer *)instanceInformationFilterListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmInstanceInformationFilter class]];
}

@end

@implementation AWSSsmDescribeInstanceInformationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceInformationList" : @"InstanceInformationList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)instanceInformationListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmInstanceInformation class]];
}

@end

@implementation AWSSsmDescribeInstancePatchStatesForPatchGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"patchGroup" : @"PatchGroup",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmInstancePatchStateFilter class]];
}

@end

@implementation AWSSsmDescribeInstancePatchStatesForPatchGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instancePatchStates" : @"InstancePatchStates",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)instancePatchStatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmInstancePatchState class]];
}

@end

@implementation AWSSsmDescribeInstancePatchStatesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceIds" : @"InstanceIds",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSsmDescribeInstancePatchStatesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instancePatchStates" : @"InstancePatchStates",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)instancePatchStatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmInstancePatchState class]];
}

@end

@implementation AWSSsmDescribeInstancePatchesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmPatchOrchestratorFilter class]];
}

@end

@implementation AWSSsmDescribeInstancePatchesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"patches" : @"Patches",
             };
}

+ (NSValueTransformer *)patchesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmPatchComplianceData class]];
}

@end

@implementation AWSSsmDescribeInventoryDeletionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deletionId" : @"DeletionId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSsmDescribeInventoryDeletionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inventoryDeletions" : @"InventoryDeletions",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)inventoryDeletionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmInventoryDeletionStatusItem class]];
}

@end

@implementation AWSSsmDescribeMaintenanceWindowExecutionTaskInvocationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"taskId" : @"TaskId",
             @"windowExecutionId" : @"WindowExecutionId",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmMaintenanceWindowFilter class]];
}

@end

@implementation AWSSsmDescribeMaintenanceWindowExecutionTaskInvocationsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"windowExecutionTaskInvocationIdentities" : @"WindowExecutionTaskInvocationIdentities",
             };
}

+ (NSValueTransformer *)windowExecutionTaskInvocationIdentitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmMaintenanceWindowExecutionTaskInvocationIdentity class]];
}

@end

@implementation AWSSsmDescribeMaintenanceWindowExecutionTasksRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"windowExecutionId" : @"WindowExecutionId",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmMaintenanceWindowFilter class]];
}

@end

@implementation AWSSsmDescribeMaintenanceWindowExecutionTasksResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"windowExecutionTaskIdentities" : @"WindowExecutionTaskIdentities",
             };
}

+ (NSValueTransformer *)windowExecutionTaskIdentitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmMaintenanceWindowExecutionTaskIdentity class]];
}

@end

@implementation AWSSsmDescribeMaintenanceWindowExecutionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"windowId" : @"WindowId",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmMaintenanceWindowFilter class]];
}

@end

@implementation AWSSsmDescribeMaintenanceWindowExecutionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"windowExecutions" : @"WindowExecutions",
             };
}

+ (NSValueTransformer *)windowExecutionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmMaintenanceWindowExecution class]];
}

@end

@implementation AWSSsmDescribeMaintenanceWindowScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"resourceType" : @"ResourceType",
             @"targets" : @"Targets",
             @"windowId" : @"WindowId",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmPatchOrchestratorFilter class]];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSTANCE"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_GROUP"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowResourceTypeResourceGroup);
        }
        return @(AWSSsmMaintenanceWindowResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmMaintenanceWindowResourceTypeInstance:
                return @"INSTANCE";
            case AWSSsmMaintenanceWindowResourceTypeResourceGroup:
                return @"RESOURCE_GROUP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTarget class]];
}

@end

@implementation AWSSsmDescribeMaintenanceWindowScheduleResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"scheduledWindowExecutions" : @"ScheduledWindowExecutions",
             };
}

+ (NSValueTransformer *)scheduledWindowExecutionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmScheduledWindowExecution class]];
}

@end

@implementation AWSSsmDescribeMaintenanceWindowTargetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"windowId" : @"WindowId",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmMaintenanceWindowFilter class]];
}

@end

@implementation AWSSsmDescribeMaintenanceWindowTargetsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmMaintenanceWindowTarget class]];
}

@end

@implementation AWSSsmDescribeMaintenanceWindowTasksRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"windowId" : @"WindowId",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmMaintenanceWindowFilter class]];
}

@end

@implementation AWSSsmDescribeMaintenanceWindowTasksResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tasks" : @"Tasks",
             };
}

+ (NSValueTransformer *)tasksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmMaintenanceWindowTask class]];
}

@end

@implementation AWSSsmDescribeMaintenanceWindowsForTargetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"resourceType" : @"ResourceType",
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSTANCE"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_GROUP"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowResourceTypeResourceGroup);
        }
        return @(AWSSsmMaintenanceWindowResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmMaintenanceWindowResourceTypeInstance:
                return @"INSTANCE";
            case AWSSsmMaintenanceWindowResourceTypeResourceGroup:
                return @"RESOURCE_GROUP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTarget class]];
}

@end

@implementation AWSSsmDescribeMaintenanceWindowsForTargetResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"windowIdentities" : @"WindowIdentities",
             };
}

+ (NSValueTransformer *)windowIdentitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmMaintenanceWindowIdentityForTarget class]];
}

@end

@implementation AWSSsmDescribeMaintenanceWindowsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmMaintenanceWindowFilter class]];
}

@end

@implementation AWSSsmDescribeMaintenanceWindowsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"windowIdentities" : @"WindowIdentities",
             };
}

+ (NSValueTransformer *)windowIdentitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmMaintenanceWindowIdentity class]];
}

@end

@implementation AWSSsmDescribeOpsItemsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"opsItemFilters" : @"OpsItemFilters",
             };
}

+ (NSValueTransformer *)opsItemFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmOpsItemFilter class]];
}

@end

@implementation AWSSsmDescribeOpsItemsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"opsItemSummaries" : @"OpsItemSummaries",
             };
}

+ (NSValueTransformer *)opsItemSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmOpsItemSummary class]];
}

@end

@implementation AWSSsmDescribeParametersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"parameterFilters" : @"ParameterFilters",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmParametersFilter class]];
}

+ (NSValueTransformer *)parameterFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmParameterStringFilter class]];
}

@end

@implementation AWSSsmDescribeParametersResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmParameterMetadata class]];
}

@end

@implementation AWSSsmDescribePatchBaselinesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmPatchOrchestratorFilter class]];
}

@end

@implementation AWSSsmDescribePatchBaselinesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineIdentities" : @"BaselineIdentities",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)baselineIdentitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmPatchBaselineIdentity class]];
}

@end

@implementation AWSSsmDescribePatchGroupStateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"patchGroup" : @"PatchGroup",
             };
}

@end

@implementation AWSSsmDescribePatchGroupStateResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instances" : @"Instances",
             @"instancesWithFailedPatches" : @"InstancesWithFailedPatches",
             @"instancesWithInstalledOtherPatches" : @"InstancesWithInstalledOtherPatches",
             @"instancesWithInstalledPatches" : @"InstancesWithInstalledPatches",
             @"instancesWithInstalledPendingRebootPatches" : @"InstancesWithInstalledPendingRebootPatches",
             @"instancesWithInstalledRejectedPatches" : @"InstancesWithInstalledRejectedPatches",
             @"instancesWithMissingPatches" : @"InstancesWithMissingPatches",
             @"instancesWithNotApplicablePatches" : @"InstancesWithNotApplicablePatches",
             @"instancesWithUnreportedNotApplicablePatches" : @"InstancesWithUnreportedNotApplicablePatches",
             };
}

@end

@implementation AWSSsmDescribePatchGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmPatchOrchestratorFilter class]];
}

@end

@implementation AWSSsmDescribePatchGroupsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mappings" : @"Mappings",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)mappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmPatchGroupPatchBaselineMapping class]];
}

@end

@implementation AWSSsmDescribePatchPropertiesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"operatingSystem" : @"OperatingSystem",
             @"patchSet" : @"PatchSet",
             @"property" : @"Property",
             };
}

+ (NSValueTransformer *)operatingSystemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WINDOWS"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemCentos);
        }
        if ([value caseInsensitiveCompare:@"ORACLE_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemOracleLinux);
        }
        if ([value caseInsensitiveCompare:@"DEBIAN"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemDebian);
        }
        return @(AWSSsmOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSsmOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSsmOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSsmOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSsmOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSsmOperatingSystemSuse:
                return @"SUSE";
            case AWSSsmOperatingSystemCentos:
                return @"CENTOS";
            case AWSSsmOperatingSystemOracleLinux:
                return @"ORACLE_LINUX";
            case AWSSsmOperatingSystemDebian:
                return @"DEBIAN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)patchSetJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OS"] == NSOrderedSame) {
            return @(AWSSsmPatchSetOs);
        }
        if ([value caseInsensitiveCompare:@"APPLICATION"] == NSOrderedSame) {
            return @(AWSSsmPatchSetApplication);
        }
        return @(AWSSsmPatchSetUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmPatchSetOs:
                return @"OS";
            case AWSSsmPatchSetApplication:
                return @"APPLICATION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)propertyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRODUCT"] == NSOrderedSame) {
            return @(AWSSsmPatchPropertyProduct);
        }
        if ([value caseInsensitiveCompare:@"PRODUCT_FAMILY"] == NSOrderedSame) {
            return @(AWSSsmPatchPropertyProductFamily);
        }
        if ([value caseInsensitiveCompare:@"CLASSIFICATION"] == NSOrderedSame) {
            return @(AWSSsmPatchPropertyClassification);
        }
        if ([value caseInsensitiveCompare:@"MSRC_SEVERITY"] == NSOrderedSame) {
            return @(AWSSsmPatchPropertyMsrcSeverity);
        }
        if ([value caseInsensitiveCompare:@"PRIORITY"] == NSOrderedSame) {
            return @(AWSSsmPatchPropertyPriority);
        }
        if ([value caseInsensitiveCompare:@"SEVERITY"] == NSOrderedSame) {
            return @(AWSSsmPatchPropertySeverity);
        }
        return @(AWSSsmPatchPropertyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmPatchPropertyProduct:
                return @"PRODUCT";
            case AWSSsmPatchPropertyProductFamily:
                return @"PRODUCT_FAMILY";
            case AWSSsmPatchPropertyClassification:
                return @"CLASSIFICATION";
            case AWSSsmPatchPropertyMsrcSeverity:
                return @"MSRC_SEVERITY";
            case AWSSsmPatchPropertyPriority:
                return @"PRIORITY";
            case AWSSsmPatchPropertySeverity:
                return @"SEVERITY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmDescribePatchPropertiesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"properties" : @"Properties",
             };
}

+ (NSValueTransformer *)propertiesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[NSString class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

@end

@implementation AWSSsmDescribeSessionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmSessionFilter class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSSsmSessionStateActive);
        }
        if ([value caseInsensitiveCompare:@"History"] == NSOrderedSame) {
            return @(AWSSsmSessionStateHistory);
        }
        return @(AWSSsmSessionStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmSessionStateActive:
                return @"Active";
            case AWSSsmSessionStateHistory:
                return @"History";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmDescribeSessionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"sessions" : @"Sessions",
             };
}

+ (NSValueTransformer *)sessionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmSession class]];
}

@end

@implementation AWSSsmDocumentDefaultVersionDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultVersion" : @"DefaultVersion",
             @"defaultVersionName" : @"DefaultVersionName",
             @"name" : @"Name",
             };
}

@end

@implementation AWSSsmDocumentDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachmentsInformation" : @"AttachmentsInformation",
             @"createdDate" : @"CreatedDate",
             @"defaultVersion" : @"DefaultVersion",
             @"detail" : @"Description",
             @"documentFormat" : @"DocumentFormat",
             @"documentType" : @"DocumentType",
             @"documentVersion" : @"DocumentVersion",
             @"hash" : @"Hash",
             @"hashType" : @"HashType",
             @"latestVersion" : @"LatestVersion",
             @"name" : @"Name",
             @"owner" : @"Owner",
             @"parameters" : @"Parameters",
             @"platformTypes" : @"PlatformTypes",
             @"requires" : @"Requires",
             @"schemaVersion" : @"SchemaVersion",
             @"sha1" : @"Sha1",
             @"status" : @"Status",
             @"statusInformation" : @"StatusInformation",
             @"tags" : @"Tags",
             @"targetType" : @"TargetType",
             @"versionName" : @"VersionName",
             };
}

+ (NSValueTransformer *)attachmentsInformationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmAttachmentInformation class]];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)documentFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"YAML"] == NSOrderedSame) {
            return @(AWSSsmDocumentFormatYaml);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSSsmDocumentFormatJson);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSSsmDocumentFormatText);
        }
        return @(AWSSsmDocumentFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmDocumentFormatYaml:
                return @"YAML";
            case AWSSsmDocumentFormatJson:
                return @"JSON";
            case AWSSsmDocumentFormatText:
                return @"TEXT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)documentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Command"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeCommand);
        }
        if ([value caseInsensitiveCompare:@"Policy"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypePolicy);
        }
        if ([value caseInsensitiveCompare:@"Automation"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"Session"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeSession);
        }
        if ([value caseInsensitiveCompare:@"Package"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypePackage);
        }
        if ([value caseInsensitiveCompare:@"ApplicationConfiguration"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeApplicationConfiguration);
        }
        if ([value caseInsensitiveCompare:@"ApplicationConfigurationSchema"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeApplicationConfigurationSchema);
        }
        if ([value caseInsensitiveCompare:@"DeploymentStrategy"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeDeploymentStrategy);
        }
        if ([value caseInsensitiveCompare:@"ChangeCalendar"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeChangeCalendar);
        }
        return @(AWSSsmDocumentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmDocumentTypeCommand:
                return @"Command";
            case AWSSsmDocumentTypePolicy:
                return @"Policy";
            case AWSSsmDocumentTypeAutomation:
                return @"Automation";
            case AWSSsmDocumentTypeSession:
                return @"Session";
            case AWSSsmDocumentTypePackage:
                return @"Package";
            case AWSSsmDocumentTypeApplicationConfiguration:
                return @"ApplicationConfiguration";
            case AWSSsmDocumentTypeApplicationConfigurationSchema:
                return @"ApplicationConfigurationSchema";
            case AWSSsmDocumentTypeDeploymentStrategy:
                return @"DeploymentStrategy";
            case AWSSsmDocumentTypeChangeCalendar:
                return @"ChangeCalendar";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)hashTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Sha256"] == NSOrderedSame) {
            return @(AWSSsmDocumentHashTypeSha256);
        }
        if ([value caseInsensitiveCompare:@"Sha1"] == NSOrderedSame) {
            return @(AWSSsmDocumentHashTypeSha1);
        }
        return @(AWSSsmDocumentHashTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmDocumentHashTypeSha256:
                return @"Sha256";
            case AWSSsmDocumentHashTypeSha1:
                return @"Sha1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmDocumentParameter class]];
}

+ (NSValueTransformer *)requiresJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmDocumentRequires class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Creating"] == NSOrderedSame) {
            return @(AWSSsmDocumentStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSSsmDocumentStatusActive);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSSsmDocumentStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSsmDocumentStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSsmDocumentStatusFailed);
        }
        return @(AWSSsmDocumentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmDocumentStatusCreating:
                return @"Creating";
            case AWSSsmDocumentStatusActive:
                return @"Active";
            case AWSSsmDocumentStatusUpdating:
                return @"Updating";
            case AWSSsmDocumentStatusDeleting:
                return @"Deleting";
            case AWSSsmDocumentStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTag class]];
}

@end

@implementation AWSSsmDocumentFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSSsmDocumentFilterKeyName);
        }
        if ([value caseInsensitiveCompare:@"Owner"] == NSOrderedSame) {
            return @(AWSSsmDocumentFilterKeyOwner);
        }
        if ([value caseInsensitiveCompare:@"PlatformTypes"] == NSOrderedSame) {
            return @(AWSSsmDocumentFilterKeyPlatformTypes);
        }
        if ([value caseInsensitiveCompare:@"DocumentType"] == NSOrderedSame) {
            return @(AWSSsmDocumentFilterKeyDocumentType);
        }
        return @(AWSSsmDocumentFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmDocumentFilterKeyName:
                return @"Name";
            case AWSSsmDocumentFilterKeyOwner:
                return @"Owner";
            case AWSSsmDocumentFilterKeyPlatformTypes:
                return @"PlatformTypes";
            case AWSSsmDocumentFilterKeyDocumentType:
                return @"DocumentType";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmDocumentIdentifier

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentFormat" : @"DocumentFormat",
             @"documentType" : @"DocumentType",
             @"documentVersion" : @"DocumentVersion",
             @"name" : @"Name",
             @"owner" : @"Owner",
             @"platformTypes" : @"PlatformTypes",
             @"requires" : @"Requires",
             @"schemaVersion" : @"SchemaVersion",
             @"tags" : @"Tags",
             @"targetType" : @"TargetType",
             @"versionName" : @"VersionName",
             };
}

+ (NSValueTransformer *)documentFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"YAML"] == NSOrderedSame) {
            return @(AWSSsmDocumentFormatYaml);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSSsmDocumentFormatJson);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSSsmDocumentFormatText);
        }
        return @(AWSSsmDocumentFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmDocumentFormatYaml:
                return @"YAML";
            case AWSSsmDocumentFormatJson:
                return @"JSON";
            case AWSSsmDocumentFormatText:
                return @"TEXT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)documentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Command"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeCommand);
        }
        if ([value caseInsensitiveCompare:@"Policy"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypePolicy);
        }
        if ([value caseInsensitiveCompare:@"Automation"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"Session"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeSession);
        }
        if ([value caseInsensitiveCompare:@"Package"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypePackage);
        }
        if ([value caseInsensitiveCompare:@"ApplicationConfiguration"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeApplicationConfiguration);
        }
        if ([value caseInsensitiveCompare:@"ApplicationConfigurationSchema"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeApplicationConfigurationSchema);
        }
        if ([value caseInsensitiveCompare:@"DeploymentStrategy"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeDeploymentStrategy);
        }
        if ([value caseInsensitiveCompare:@"ChangeCalendar"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeChangeCalendar);
        }
        return @(AWSSsmDocumentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmDocumentTypeCommand:
                return @"Command";
            case AWSSsmDocumentTypePolicy:
                return @"Policy";
            case AWSSsmDocumentTypeAutomation:
                return @"Automation";
            case AWSSsmDocumentTypeSession:
                return @"Session";
            case AWSSsmDocumentTypePackage:
                return @"Package";
            case AWSSsmDocumentTypeApplicationConfiguration:
                return @"ApplicationConfiguration";
            case AWSSsmDocumentTypeApplicationConfigurationSchema:
                return @"ApplicationConfigurationSchema";
            case AWSSsmDocumentTypeDeploymentStrategy:
                return @"DeploymentStrategy";
            case AWSSsmDocumentTypeChangeCalendar:
                return @"ChangeCalendar";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requiresJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmDocumentRequires class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTag class]];
}

@end

@implementation AWSSsmDocumentKeyValuesFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

@end

@implementation AWSSsmDocumentParameter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultValue" : @"DefaultValue",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"String"] == NSOrderedSame) {
            return @(AWSSsmDocumentParameterTypeString);
        }
        if ([value caseInsensitiveCompare:@"StringList"] == NSOrderedSame) {
            return @(AWSSsmDocumentParameterTypeStringList);
        }
        return @(AWSSsmDocumentParameterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmDocumentParameterTypeString:
                return @"String";
            case AWSSsmDocumentParameterTypeStringList:
                return @"StringList";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmDocumentRequires

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"version" : @"Version",
             };
}

@end

@implementation AWSSsmDocumentVersionInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdDate" : @"CreatedDate",
             @"documentFormat" : @"DocumentFormat",
             @"documentVersion" : @"DocumentVersion",
             @"isDefaultVersion" : @"IsDefaultVersion",
             @"name" : @"Name",
             @"status" : @"Status",
             @"statusInformation" : @"StatusInformation",
             @"versionName" : @"VersionName",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)documentFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"YAML"] == NSOrderedSame) {
            return @(AWSSsmDocumentFormatYaml);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSSsmDocumentFormatJson);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSSsmDocumentFormatText);
        }
        return @(AWSSsmDocumentFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmDocumentFormatYaml:
                return @"YAML";
            case AWSSsmDocumentFormatJson:
                return @"JSON";
            case AWSSsmDocumentFormatText:
                return @"TEXT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Creating"] == NSOrderedSame) {
            return @(AWSSsmDocumentStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSSsmDocumentStatusActive);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSSsmDocumentStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSsmDocumentStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSsmDocumentStatusFailed);
        }
        return @(AWSSsmDocumentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmDocumentStatusCreating:
                return @"Creating";
            case AWSSsmDocumentStatusActive:
                return @"Active";
            case AWSSsmDocumentStatusUpdating:
                return @"Updating";
            case AWSSsmDocumentStatusDeleting:
                return @"Deleting";
            case AWSSsmDocumentStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmEffectivePatch

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"patch" : @"Patch",
             @"patchStatus" : @"PatchStatus",
             };
}

+ (NSValueTransformer *)patchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmPatch class]];
}

+ (NSValueTransformer *)patchStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmPatchStatus class]];
}

@end

@implementation AWSSsmFailedCreateAssociation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entry" : @"Entry",
             @"fault" : @"Fault",
             @"message" : @"Message",
             };
}

+ (NSValueTransformer *)entryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmCreateAssociationBatchRequestEntry class]];
}

+ (NSValueTransformer *)faultJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Client"] == NSOrderedSame) {
            return @(AWSSsmFaultClient);
        }
        if ([value caseInsensitiveCompare:@"Server"] == NSOrderedSame) {
            return @(AWSSsmFaultServer);
        }
        if ([value caseInsensitiveCompare:@"Unknown"] == NSOrderedSame) {
            return @(AWSSsmFaultUnknown);
        }
        return @(AWSSsmFaultUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmFaultClient:
                return @"Client";
            case AWSSsmFaultServer:
                return @"Server";
            case AWSSsmFaultUnknown:
                return @"Unknown";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmFailureDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"details" : @"Details",
             @"failureStage" : @"FailureStage",
             @"failureType" : @"FailureType",
             };
}

@end

@implementation AWSSsmGetAutomationExecutionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automationExecutionId" : @"AutomationExecutionId",
             };
}

@end

@implementation AWSSsmGetAutomationExecutionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automationExecution" : @"AutomationExecution",
             };
}

+ (NSValueTransformer *)automationExecutionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmAutomationExecution class]];
}

@end

@implementation AWSSsmGetCalendarStateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"atTime" : @"AtTime",
             @"calendarNames" : @"CalendarNames",
             };
}

@end

@implementation AWSSsmGetCalendarStateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"atTime" : @"AtTime",
             @"nextTransitionTime" : @"NextTransitionTime",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OPEN"] == NSOrderedSame) {
            return @(AWSSsmCalendarStateOpen);
        }
        if ([value caseInsensitiveCompare:@"CLOSED"] == NSOrderedSame) {
            return @(AWSSsmCalendarStateClosed);
        }
        return @(AWSSsmCalendarStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmCalendarStateOpen:
                return @"OPEN";
            case AWSSsmCalendarStateClosed:
                return @"CLOSED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmGetCommandInvocationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commandId" : @"CommandId",
             @"instanceId" : @"InstanceId",
             @"pluginName" : @"PluginName",
             };
}

@end

@implementation AWSSsmGetCommandInvocationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchOutputConfig" : @"CloudWatchOutputConfig",
             @"commandId" : @"CommandId",
             @"comment" : @"Comment",
             @"documentName" : @"DocumentName",
             @"documentVersion" : @"DocumentVersion",
             @"executionElapsedTime" : @"ExecutionElapsedTime",
             @"executionEndDateTime" : @"ExecutionEndDateTime",
             @"executionStartDateTime" : @"ExecutionStartDateTime",
             @"instanceId" : @"InstanceId",
             @"pluginName" : @"PluginName",
             @"responseCode" : @"ResponseCode",
             @"standardErrorContent" : @"StandardErrorContent",
             @"standardErrorUrl" : @"StandardErrorUrl",
             @"standardOutputContent" : @"StandardOutputContent",
             @"standardOutputUrl" : @"StandardOutputUrl",
             @"status" : @"Status",
             @"statusDetails" : @"StatusDetails",
             };
}

+ (NSValueTransformer *)cloudWatchOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmCloudWatchOutputConfig class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSsmCommandInvocationStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSsmCommandInvocationStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Delayed"] == NSOrderedSame) {
            return @(AWSSsmCommandInvocationStatusDelayed);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSsmCommandInvocationStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSsmCommandInvocationStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"TimedOut"] == NSOrderedSame) {
            return @(AWSSsmCommandInvocationStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSsmCommandInvocationStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Cancelling"] == NSOrderedSame) {
            return @(AWSSsmCommandInvocationStatusCancelling);
        }
        return @(AWSSsmCommandInvocationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmCommandInvocationStatusPending:
                return @"Pending";
            case AWSSsmCommandInvocationStatusInProgress:
                return @"InProgress";
            case AWSSsmCommandInvocationStatusDelayed:
                return @"Delayed";
            case AWSSsmCommandInvocationStatusSuccess:
                return @"Success";
            case AWSSsmCommandInvocationStatusCancelled:
                return @"Cancelled";
            case AWSSsmCommandInvocationStatusTimedOut:
                return @"TimedOut";
            case AWSSsmCommandInvocationStatusFailed:
                return @"Failed";
            case AWSSsmCommandInvocationStatusCancelling:
                return @"Cancelling";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmGetConnectionStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"target" : @"Target",
             };
}

@end

@implementation AWSSsmGetConnectionStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             @"target" : @"Target",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Connected"] == NSOrderedSame) {
            return @(AWSSsmConnectionStatusConnected);
        }
        if ([value caseInsensitiveCompare:@"NotConnected"] == NSOrderedSame) {
            return @(AWSSsmConnectionStatusNotConnected);
        }
        return @(AWSSsmConnectionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmConnectionStatusConnected:
                return @"Connected";
            case AWSSsmConnectionStatusNotConnected:
                return @"NotConnected";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmGetDefaultPatchBaselineRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operatingSystem" : @"OperatingSystem",
             };
}

+ (NSValueTransformer *)operatingSystemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WINDOWS"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemCentos);
        }
        if ([value caseInsensitiveCompare:@"ORACLE_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemOracleLinux);
        }
        if ([value caseInsensitiveCompare:@"DEBIAN"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemDebian);
        }
        return @(AWSSsmOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSsmOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSsmOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSsmOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSsmOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSsmOperatingSystemSuse:
                return @"SUSE";
            case AWSSsmOperatingSystemCentos:
                return @"CENTOS";
            case AWSSsmOperatingSystemOracleLinux:
                return @"ORACLE_LINUX";
            case AWSSsmOperatingSystemDebian:
                return @"DEBIAN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmGetDefaultPatchBaselineResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             @"operatingSystem" : @"OperatingSystem",
             };
}

+ (NSValueTransformer *)operatingSystemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WINDOWS"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemCentos);
        }
        if ([value caseInsensitiveCompare:@"ORACLE_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemOracleLinux);
        }
        if ([value caseInsensitiveCompare:@"DEBIAN"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemDebian);
        }
        return @(AWSSsmOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSsmOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSsmOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSsmOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSsmOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSsmOperatingSystemSuse:
                return @"SUSE";
            case AWSSsmOperatingSystemCentos:
                return @"CENTOS";
            case AWSSsmOperatingSystemOracleLinux:
                return @"ORACLE_LINUX";
            case AWSSsmOperatingSystemDebian:
                return @"DEBIAN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmGetDeployablePatchSnapshotForInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"snapshotId" : @"SnapshotId",
             };
}

@end

@implementation AWSSsmGetDeployablePatchSnapshotForInstanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"product" : @"Product",
             @"snapshotDownloadUrl" : @"SnapshotDownloadUrl",
             @"snapshotId" : @"SnapshotId",
             };
}

@end

@implementation AWSSsmGetDocumentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentFormat" : @"DocumentFormat",
             @"documentVersion" : @"DocumentVersion",
             @"name" : @"Name",
             @"versionName" : @"VersionName",
             };
}

+ (NSValueTransformer *)documentFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"YAML"] == NSOrderedSame) {
            return @(AWSSsmDocumentFormatYaml);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSSsmDocumentFormatJson);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSSsmDocumentFormatText);
        }
        return @(AWSSsmDocumentFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmDocumentFormatYaml:
                return @"YAML";
            case AWSSsmDocumentFormatJson:
                return @"JSON";
            case AWSSsmDocumentFormatText:
                return @"TEXT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmGetDocumentResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachmentsContent" : @"AttachmentsContent",
             @"content" : @"Content",
             @"documentFormat" : @"DocumentFormat",
             @"documentType" : @"DocumentType",
             @"documentVersion" : @"DocumentVersion",
             @"name" : @"Name",
             @"requires" : @"Requires",
             @"status" : @"Status",
             @"statusInformation" : @"StatusInformation",
             @"versionName" : @"VersionName",
             };
}

+ (NSValueTransformer *)attachmentsContentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmAttachmentContent class]];
}

+ (NSValueTransformer *)documentFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"YAML"] == NSOrderedSame) {
            return @(AWSSsmDocumentFormatYaml);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSSsmDocumentFormatJson);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSSsmDocumentFormatText);
        }
        return @(AWSSsmDocumentFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmDocumentFormatYaml:
                return @"YAML";
            case AWSSsmDocumentFormatJson:
                return @"JSON";
            case AWSSsmDocumentFormatText:
                return @"TEXT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)documentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Command"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeCommand);
        }
        if ([value caseInsensitiveCompare:@"Policy"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypePolicy);
        }
        if ([value caseInsensitiveCompare:@"Automation"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"Session"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeSession);
        }
        if ([value caseInsensitiveCompare:@"Package"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypePackage);
        }
        if ([value caseInsensitiveCompare:@"ApplicationConfiguration"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeApplicationConfiguration);
        }
        if ([value caseInsensitiveCompare:@"ApplicationConfigurationSchema"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeApplicationConfigurationSchema);
        }
        if ([value caseInsensitiveCompare:@"DeploymentStrategy"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeDeploymentStrategy);
        }
        if ([value caseInsensitiveCompare:@"ChangeCalendar"] == NSOrderedSame) {
            return @(AWSSsmDocumentTypeChangeCalendar);
        }
        return @(AWSSsmDocumentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmDocumentTypeCommand:
                return @"Command";
            case AWSSsmDocumentTypePolicy:
                return @"Policy";
            case AWSSsmDocumentTypeAutomation:
                return @"Automation";
            case AWSSsmDocumentTypeSession:
                return @"Session";
            case AWSSsmDocumentTypePackage:
                return @"Package";
            case AWSSsmDocumentTypeApplicationConfiguration:
                return @"ApplicationConfiguration";
            case AWSSsmDocumentTypeApplicationConfigurationSchema:
                return @"ApplicationConfigurationSchema";
            case AWSSsmDocumentTypeDeploymentStrategy:
                return @"DeploymentStrategy";
            case AWSSsmDocumentTypeChangeCalendar:
                return @"ChangeCalendar";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requiresJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmDocumentRequires class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Creating"] == NSOrderedSame) {
            return @(AWSSsmDocumentStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSSsmDocumentStatusActive);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSSsmDocumentStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSsmDocumentStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSsmDocumentStatusFailed);
        }
        return @(AWSSsmDocumentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmDocumentStatusCreating:
                return @"Creating";
            case AWSSsmDocumentStatusActive:
                return @"Active";
            case AWSSsmDocumentStatusUpdating:
                return @"Updating";
            case AWSSsmDocumentStatusDeleting:
                return @"Deleting";
            case AWSSsmDocumentStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmGetInventoryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aggregators" : @"Aggregators",
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"resultAttributes" : @"ResultAttributes",
             };
}

+ (NSValueTransformer *)aggregatorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmInventoryAggregator class]];
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmInventoryFilter class]];
}

+ (NSValueTransformer *)resultAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmResultAttribute class]];
}

@end

@implementation AWSSsmGetInventoryResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entities" : @"Entities",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)entitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmInventoryResultEntity class]];
}

@end

@implementation AWSSsmGetInventorySchemaRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aggregator" : @"Aggregator",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"subType" : @"SubType",
             @"typeName" : @"TypeName",
             };
}

@end

@implementation AWSSsmGetInventorySchemaResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"schemas" : @"Schemas",
             };
}

+ (NSValueTransformer *)schemasJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmInventoryItemSchema class]];
}

@end

@implementation AWSSsmGetMaintenanceWindowExecutionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowExecutionId" : @"WindowExecutionId",
             };
}

@end

@implementation AWSSsmGetMaintenanceWindowExecutionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"EndTime",
             @"startTime" : @"StartTime",
             @"status" : @"Status",
             @"statusDetails" : @"StatusDetails",
             @"taskIds" : @"TaskIds",
             @"windowExecutionId" : @"WindowExecutionId",
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
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"CANCELLING"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"SKIPPED_OVERLAPPING"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusSkippedOverlapping);
        }
        return @(AWSSsmMaintenanceWindowExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmMaintenanceWindowExecutionStatusPending:
                return @"PENDING";
            case AWSSsmMaintenanceWindowExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSSsmMaintenanceWindowExecutionStatusSuccess:
                return @"SUCCESS";
            case AWSSsmMaintenanceWindowExecutionStatusFailed:
                return @"FAILED";
            case AWSSsmMaintenanceWindowExecutionStatusTimedOut:
                return @"TIMED_OUT";
            case AWSSsmMaintenanceWindowExecutionStatusCancelling:
                return @"CANCELLING";
            case AWSSsmMaintenanceWindowExecutionStatusCancelled:
                return @"CANCELLED";
            case AWSSsmMaintenanceWindowExecutionStatusSkippedOverlapping:
                return @"SKIPPED_OVERLAPPING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmGetMaintenanceWindowExecutionTaskInvocationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invocationId" : @"InvocationId",
             @"taskId" : @"TaskId",
             @"windowExecutionId" : @"WindowExecutionId",
             };
}

@end

@implementation AWSSsmGetMaintenanceWindowExecutionTaskInvocationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"EndTime",
             @"executionId" : @"ExecutionId",
             @"invocationId" : @"InvocationId",
             @"ownerInformation" : @"OwnerInformation",
             @"parameters" : @"Parameters",
             @"startTime" : @"StartTime",
             @"status" : @"Status",
             @"statusDetails" : @"StatusDetails",
             @"taskExecutionId" : @"TaskExecutionId",
             @"taskType" : @"TaskType",
             @"windowExecutionId" : @"WindowExecutionId",
             @"windowTargetId" : @"WindowTargetId",
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
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"CANCELLING"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"SKIPPED_OVERLAPPING"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusSkippedOverlapping);
        }
        return @(AWSSsmMaintenanceWindowExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmMaintenanceWindowExecutionStatusPending:
                return @"PENDING";
            case AWSSsmMaintenanceWindowExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSSsmMaintenanceWindowExecutionStatusSuccess:
                return @"SUCCESS";
            case AWSSsmMaintenanceWindowExecutionStatusFailed:
                return @"FAILED";
            case AWSSsmMaintenanceWindowExecutionStatusTimedOut:
                return @"TIMED_OUT";
            case AWSSsmMaintenanceWindowExecutionStatusCancelling:
                return @"CANCELLING";
            case AWSSsmMaintenanceWindowExecutionStatusCancelled:
                return @"CANCELLED";
            case AWSSsmMaintenanceWindowExecutionStatusSkippedOverlapping:
                return @"SKIPPED_OVERLAPPING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taskTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUN_COMMAND"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeRunCommand);
        }
        if ([value caseInsensitiveCompare:@"AUTOMATION"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"STEP_FUNCTIONS"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeStepFunctions);
        }
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeLambda);
        }
        return @(AWSSsmMaintenanceWindowTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmMaintenanceWindowTaskTypeRunCommand:
                return @"RUN_COMMAND";
            case AWSSsmMaintenanceWindowTaskTypeAutomation:
                return @"AUTOMATION";
            case AWSSsmMaintenanceWindowTaskTypeStepFunctions:
                return @"STEP_FUNCTIONS";
            case AWSSsmMaintenanceWindowTaskTypeLambda:
                return @"LAMBDA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmGetMaintenanceWindowExecutionTaskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"TaskId",
             @"windowExecutionId" : @"WindowExecutionId",
             };
}

@end

@implementation AWSSsmGetMaintenanceWindowExecutionTaskResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"EndTime",
             @"maxConcurrency" : @"MaxConcurrency",
             @"maxErrors" : @"MaxErrors",
             @"priority" : @"Priority",
             @"serviceRole" : @"ServiceRole",
             @"startTime" : @"StartTime",
             @"status" : @"Status",
             @"statusDetails" : @"StatusDetails",
             @"taskArn" : @"TaskArn",
             @"taskExecutionId" : @"TaskExecutionId",
             @"taskParameters" : @"TaskParameters",
             @"types" : @"Type",
             @"windowExecutionId" : @"WindowExecutionId",
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
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"CANCELLING"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"SKIPPED_OVERLAPPING"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusSkippedOverlapping);
        }
        return @(AWSSsmMaintenanceWindowExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmMaintenanceWindowExecutionStatusPending:
                return @"PENDING";
            case AWSSsmMaintenanceWindowExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSSsmMaintenanceWindowExecutionStatusSuccess:
                return @"SUCCESS";
            case AWSSsmMaintenanceWindowExecutionStatusFailed:
                return @"FAILED";
            case AWSSsmMaintenanceWindowExecutionStatusTimedOut:
                return @"TIMED_OUT";
            case AWSSsmMaintenanceWindowExecutionStatusCancelling:
                return @"CANCELLING";
            case AWSSsmMaintenanceWindowExecutionStatusCancelled:
                return @"CANCELLED";
            case AWSSsmMaintenanceWindowExecutionStatusSkippedOverlapping:
                return @"SKIPPED_OVERLAPPING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taskParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[AWSSsmMaintenanceWindowTaskParameterValueExpression class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUN_COMMAND"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeRunCommand);
        }
        if ([value caseInsensitiveCompare:@"AUTOMATION"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"STEP_FUNCTIONS"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeStepFunctions);
        }
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeLambda);
        }
        return @(AWSSsmMaintenanceWindowTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmMaintenanceWindowTaskTypeRunCommand:
                return @"RUN_COMMAND";
            case AWSSsmMaintenanceWindowTaskTypeAutomation:
                return @"AUTOMATION";
            case AWSSsmMaintenanceWindowTaskTypeStepFunctions:
                return @"STEP_FUNCTIONS";
            case AWSSsmMaintenanceWindowTaskTypeLambda:
                return @"LAMBDA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmGetMaintenanceWindowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowId" : @"WindowId",
             };
}

@end

@implementation AWSSsmGetMaintenanceWindowResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowUnassociatedTargets" : @"AllowUnassociatedTargets",
             @"createdDate" : @"CreatedDate",
             @"cutoff" : @"Cutoff",
             @"detail" : @"Description",
             @"duration" : @"Duration",
             @"enabled" : @"Enabled",
             @"endDate" : @"EndDate",
             @"modifiedDate" : @"ModifiedDate",
             @"name" : @"Name",
             @"nextExecutionTime" : @"NextExecutionTime",
             @"schedule" : @"Schedule",
             @"scheduleOffset" : @"ScheduleOffset",
             @"scheduleTimezone" : @"ScheduleTimezone",
             @"startDate" : @"StartDate",
             @"windowId" : @"WindowId",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)modifiedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSsmGetMaintenanceWindowTaskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowId" : @"WindowId",
             @"windowTaskId" : @"WindowTaskId",
             };
}

@end

@implementation AWSSsmGetMaintenanceWindowTaskResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"loggingInfo" : @"LoggingInfo",
             @"maxConcurrency" : @"MaxConcurrency",
             @"maxErrors" : @"MaxErrors",
             @"name" : @"Name",
             @"priority" : @"Priority",
             @"serviceRoleArn" : @"ServiceRoleArn",
             @"targets" : @"Targets",
             @"taskArn" : @"TaskArn",
             @"taskInvocationParameters" : @"TaskInvocationParameters",
             @"taskParameters" : @"TaskParameters",
             @"taskType" : @"TaskType",
             @"windowId" : @"WindowId",
             @"windowTaskId" : @"WindowTaskId",
             };
}

+ (NSValueTransformer *)loggingInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmLoggingInfo class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTarget class]];
}

+ (NSValueTransformer *)taskInvocationParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmMaintenanceWindowTaskInvocationParameters class]];
}

+ (NSValueTransformer *)taskParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSsmMaintenanceWindowTaskParameterValueExpression class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)taskTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUN_COMMAND"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeRunCommand);
        }
        if ([value caseInsensitiveCompare:@"AUTOMATION"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"STEP_FUNCTIONS"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeStepFunctions);
        }
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeLambda);
        }
        return @(AWSSsmMaintenanceWindowTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmMaintenanceWindowTaskTypeRunCommand:
                return @"RUN_COMMAND";
            case AWSSsmMaintenanceWindowTaskTypeAutomation:
                return @"AUTOMATION";
            case AWSSsmMaintenanceWindowTaskTypeStepFunctions:
                return @"STEP_FUNCTIONS";
            case AWSSsmMaintenanceWindowTaskTypeLambda:
                return @"LAMBDA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmGetOpsItemRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"opsItemId" : @"OpsItemId",
             };
}

@end

@implementation AWSSsmGetOpsItemResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"opsItem" : @"OpsItem",
             };
}

+ (NSValueTransformer *)opsItemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmOpsItem class]];
}

@end

@implementation AWSSsmGetOpsSummaryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aggregators" : @"Aggregators",
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"resultAttributes" : @"ResultAttributes",
             @"syncName" : @"SyncName",
             };
}

+ (NSValueTransformer *)aggregatorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmOpsAggregator class]];
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmOpsFilter class]];
}

+ (NSValueTransformer *)resultAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmOpsResultAttribute class]];
}

@end

@implementation AWSSsmGetOpsSummaryResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entities" : @"Entities",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)entitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmOpsEntity class]];
}

@end

@implementation AWSSsmGetParameterHistoryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"name" : @"Name",
             @"nextToken" : @"NextToken",
             @"withDecryption" : @"WithDecryption",
             };
}

@end

@implementation AWSSsmGetParameterHistoryResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmParameterHistory class]];
}

@end

@implementation AWSSsmGetParameterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"withDecryption" : @"WithDecryption",
             };
}

@end

@implementation AWSSsmGetParameterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameter" : @"Parameter",
             };
}

+ (NSValueTransformer *)parameterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmParameter class]];
}

@end

@implementation AWSSsmGetParametersByPathRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"parameterFilters" : @"ParameterFilters",
             @"path" : @"Path",
             @"recursive" : @"Recursive",
             @"withDecryption" : @"WithDecryption",
             };
}

+ (NSValueTransformer *)parameterFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmParameterStringFilter class]];
}

@end

@implementation AWSSsmGetParametersByPathResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmParameter class]];
}

@end

@implementation AWSSsmGetParametersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"names" : @"Names",
             @"withDecryption" : @"WithDecryption",
             };
}

@end

@implementation AWSSsmGetParametersResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invalidParameters" : @"InvalidParameters",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmParameter class]];
}

@end

@implementation AWSSsmGetPatchBaselineForPatchGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operatingSystem" : @"OperatingSystem",
             @"patchGroup" : @"PatchGroup",
             };
}

+ (NSValueTransformer *)operatingSystemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WINDOWS"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemCentos);
        }
        if ([value caseInsensitiveCompare:@"ORACLE_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemOracleLinux);
        }
        if ([value caseInsensitiveCompare:@"DEBIAN"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemDebian);
        }
        return @(AWSSsmOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSsmOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSsmOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSsmOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSsmOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSsmOperatingSystemSuse:
                return @"SUSE";
            case AWSSsmOperatingSystemCentos:
                return @"CENTOS";
            case AWSSsmOperatingSystemOracleLinux:
                return @"ORACLE_LINUX";
            case AWSSsmOperatingSystemDebian:
                return @"DEBIAN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmGetPatchBaselineForPatchGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             @"operatingSystem" : @"OperatingSystem",
             @"patchGroup" : @"PatchGroup",
             };
}

+ (NSValueTransformer *)operatingSystemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WINDOWS"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemCentos);
        }
        if ([value caseInsensitiveCompare:@"ORACLE_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemOracleLinux);
        }
        if ([value caseInsensitiveCompare:@"DEBIAN"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemDebian);
        }
        return @(AWSSsmOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSsmOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSsmOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSsmOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSsmOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSsmOperatingSystemSuse:
                return @"SUSE";
            case AWSSsmOperatingSystemCentos:
                return @"CENTOS";
            case AWSSsmOperatingSystemOracleLinux:
                return @"ORACLE_LINUX";
            case AWSSsmOperatingSystemDebian:
                return @"DEBIAN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmGetPatchBaselineRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             };
}

@end

@implementation AWSSsmGetPatchBaselineResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRules" : @"ApprovalRules",
             @"approvedPatches" : @"ApprovedPatches",
             @"approvedPatchesComplianceLevel" : @"ApprovedPatchesComplianceLevel",
             @"approvedPatchesEnableNonSecurity" : @"ApprovedPatchesEnableNonSecurity",
             @"baselineId" : @"BaselineId",
             @"createdDate" : @"CreatedDate",
             @"detail" : @"Description",
             @"globalFilters" : @"GlobalFilters",
             @"modifiedDate" : @"ModifiedDate",
             @"name" : @"Name",
             @"operatingSystem" : @"OperatingSystem",
             @"patchGroups" : @"PatchGroups",
             @"rejectedPatches" : @"RejectedPatches",
             @"rejectedPatchesAction" : @"RejectedPatchesAction",
             @"sources" : @"Sources",
             };
}

+ (NSValueTransformer *)approvalRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmPatchRuleGroup class]];
}

+ (NSValueTransformer *)approvedPatchesComplianceLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelUnspecified);
        }
        return @(AWSSsmPatchComplianceLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmPatchComplianceLevelCritical:
                return @"CRITICAL";
            case AWSSsmPatchComplianceLevelHigh:
                return @"HIGH";
            case AWSSsmPatchComplianceLevelMedium:
                return @"MEDIUM";
            case AWSSsmPatchComplianceLevelLow:
                return @"LOW";
            case AWSSsmPatchComplianceLevelInformational:
                return @"INFORMATIONAL";
            case AWSSsmPatchComplianceLevelUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)globalFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmPatchFilterGroup class]];
}

+ (NSValueTransformer *)modifiedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)operatingSystemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WINDOWS"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemCentos);
        }
        if ([value caseInsensitiveCompare:@"ORACLE_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemOracleLinux);
        }
        if ([value caseInsensitiveCompare:@"DEBIAN"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemDebian);
        }
        return @(AWSSsmOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSsmOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSsmOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSsmOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSsmOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSsmOperatingSystemSuse:
                return @"SUSE";
            case AWSSsmOperatingSystemCentos:
                return @"CENTOS";
            case AWSSsmOperatingSystemOracleLinux:
                return @"ORACLE_LINUX";
            case AWSSsmOperatingSystemDebian:
                return @"DEBIAN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rejectedPatchesActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALLOW_AS_DEPENDENCY"] == NSOrderedSame) {
            return @(AWSSsmPatchActionAllowAsDependency);
        }
        if ([value caseInsensitiveCompare:@"BLOCK"] == NSOrderedSame) {
            return @(AWSSsmPatchActionBlock);
        }
        return @(AWSSsmPatchActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmPatchActionAllowAsDependency:
                return @"ALLOW_AS_DEPENDENCY";
            case AWSSsmPatchActionBlock:
                return @"BLOCK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmPatchSource class]];
}

@end

@implementation AWSSsmGetServiceSettingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"settingId" : @"SettingId",
             };
}

@end

@implementation AWSSsmGetServiceSettingResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceSetting" : @"ServiceSetting",
             };
}

+ (NSValueTransformer *)serviceSettingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmServiceSetting class]];
}

@end

@implementation AWSSsmInstanceAggregatedAssociationOverview

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detailedStatus" : @"DetailedStatus",
             @"instanceAssociationStatusAggregatedCount" : @"InstanceAssociationStatusAggregatedCount",
             };
}

@end

@implementation AWSSsmInstanceAssociation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"associationVersion" : @"AssociationVersion",
             @"content" : @"Content",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSSsmInstanceAssociationOutputLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Location" : @"S3Location",
             };
}

+ (NSValueTransformer *)s3LocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmS3OutputLocation class]];
}

@end

@implementation AWSSsmInstanceAssociationOutputUrl

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3OutputUrl" : @"S3OutputUrl",
             };
}

+ (NSValueTransformer *)s3OutputUrlJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmS3OutputUrl class]];
}

@end

@implementation AWSSsmInstanceAssociationStatusInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"associationName" : @"AssociationName",
             @"associationVersion" : @"AssociationVersion",
             @"detailedStatus" : @"DetailedStatus",
             @"documentVersion" : @"DocumentVersion",
             @"errorCode" : @"ErrorCode",
             @"executionDate" : @"ExecutionDate",
             @"executionSummary" : @"ExecutionSummary",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             @"outputUrl" : @"OutputUrl",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)executionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)outputUrlJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmInstanceAssociationOutputUrl class]];
}

@end

@implementation AWSSsmInstanceInformation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activationId" : @"ActivationId",
             @"agentVersion" : @"AgentVersion",
             @"associationOverview" : @"AssociationOverview",
             @"associationStatus" : @"AssociationStatus",
             @"computerName" : @"ComputerName",
             @"IPAddress" : @"IPAddress",
             @"iamRole" : @"IamRole",
             @"instanceId" : @"InstanceId",
             @"isLatestVersion" : @"IsLatestVersion",
             @"lastAssociationExecutionDate" : @"LastAssociationExecutionDate",
             @"lastPingDateTime" : @"LastPingDateTime",
             @"lastSuccessfulAssociationExecutionDate" : @"LastSuccessfulAssociationExecutionDate",
             @"name" : @"Name",
             @"pingStatus" : @"PingStatus",
             @"platformName" : @"PlatformName",
             @"platformType" : @"PlatformType",
             @"platformVersion" : @"PlatformVersion",
             @"registrationDate" : @"RegistrationDate",
             @"resourceType" : @"ResourceType",
             };
}

+ (NSValueTransformer *)associationOverviewJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmInstanceAggregatedAssociationOverview class]];
}

+ (NSValueTransformer *)lastAssociationExecutionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastPingDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastSuccessfulAssociationExecutionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)pingStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Online"] == NSOrderedSame) {
            return @(AWSSsmPingStatusOnline);
        }
        if ([value caseInsensitiveCompare:@"ConnectionLost"] == NSOrderedSame) {
            return @(AWSSsmPingStatusConnectionLost);
        }
        if ([value caseInsensitiveCompare:@"Inactive"] == NSOrderedSame) {
            return @(AWSSsmPingStatusInactive);
        }
        return @(AWSSsmPingStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmPingStatusOnline:
                return @"Online";
            case AWSSsmPingStatusConnectionLost:
                return @"ConnectionLost";
            case AWSSsmPingStatusInactive:
                return @"Inactive";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)platformTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSSsmPlatformTypeWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSSsmPlatformTypeLinux);
        }
        return @(AWSSsmPlatformTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmPlatformTypeWindows:
                return @"Windows";
            case AWSSsmPlatformTypeLinux:
                return @"Linux";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)registrationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ManagedInstance"] == NSOrderedSame) {
            return @(AWSSsmResourceTypeManagedInstance);
        }
        if ([value caseInsensitiveCompare:@"Document"] == NSOrderedSame) {
            return @(AWSSsmResourceTypeDocument);
        }
        if ([value caseInsensitiveCompare:@"EC2Instance"] == NSOrderedSame) {
            return @(AWSSsmResourceTypeEC2Instance);
        }
        return @(AWSSsmResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmResourceTypeManagedInstance:
                return @"ManagedInstance";
            case AWSSsmResourceTypeDocument:
                return @"Document";
            case AWSSsmResourceTypeEC2Instance:
                return @"EC2Instance";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmInstanceInformationFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"valueSet" : @"valueSet",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InstanceIds"] == NSOrderedSame) {
            return @(AWSSsmInstanceInformationFilterKeyInstanceIds);
        }
        if ([value caseInsensitiveCompare:@"AgentVersion"] == NSOrderedSame) {
            return @(AWSSsmInstanceInformationFilterKeyAgentVersion);
        }
        if ([value caseInsensitiveCompare:@"PingStatus"] == NSOrderedSame) {
            return @(AWSSsmInstanceInformationFilterKeyPingStatus);
        }
        if ([value caseInsensitiveCompare:@"PlatformTypes"] == NSOrderedSame) {
            return @(AWSSsmInstanceInformationFilterKeyPlatformTypes);
        }
        if ([value caseInsensitiveCompare:@"ActivationIds"] == NSOrderedSame) {
            return @(AWSSsmInstanceInformationFilterKeyActivationIds);
        }
        if ([value caseInsensitiveCompare:@"IamRole"] == NSOrderedSame) {
            return @(AWSSsmInstanceInformationFilterKeyIamRole);
        }
        if ([value caseInsensitiveCompare:@"ResourceType"] == NSOrderedSame) {
            return @(AWSSsmInstanceInformationFilterKeyResourceType);
        }
        if ([value caseInsensitiveCompare:@"AssociationStatus"] == NSOrderedSame) {
            return @(AWSSsmInstanceInformationFilterKeyAssociationStatus);
        }
        return @(AWSSsmInstanceInformationFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmInstanceInformationFilterKeyInstanceIds:
                return @"InstanceIds";
            case AWSSsmInstanceInformationFilterKeyAgentVersion:
                return @"AgentVersion";
            case AWSSsmInstanceInformationFilterKeyPingStatus:
                return @"PingStatus";
            case AWSSsmInstanceInformationFilterKeyPlatformTypes:
                return @"PlatformTypes";
            case AWSSsmInstanceInformationFilterKeyActivationIds:
                return @"ActivationIds";
            case AWSSsmInstanceInformationFilterKeyIamRole:
                return @"IamRole";
            case AWSSsmInstanceInformationFilterKeyResourceType:
                return @"ResourceType";
            case AWSSsmInstanceInformationFilterKeyAssociationStatus:
                return @"AssociationStatus";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmInstanceInformationStringFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

@end

@implementation AWSSsmInstancePatchState

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             @"failedCount" : @"FailedCount",
             @"installOverrideList" : @"InstallOverrideList",
             @"installedCount" : @"InstalledCount",
             @"installedOtherCount" : @"InstalledOtherCount",
             @"installedPendingRebootCount" : @"InstalledPendingRebootCount",
             @"installedRejectedCount" : @"InstalledRejectedCount",
             @"instanceId" : @"InstanceId",
             @"lastNoRebootInstallOperationTime" : @"LastNoRebootInstallOperationTime",
             @"missingCount" : @"MissingCount",
             @"notApplicableCount" : @"NotApplicableCount",
             @"operation" : @"Operation",
             @"operationEndTime" : @"OperationEndTime",
             @"operationStartTime" : @"OperationStartTime",
             @"ownerInformation" : @"OwnerInformation",
             @"patchGroup" : @"PatchGroup",
             @"rebootOption" : @"RebootOption",
             @"snapshotId" : @"SnapshotId",
             @"unreportedNotApplicableCount" : @"UnreportedNotApplicableCount",
             };
}

+ (NSValueTransformer *)lastNoRebootInstallOperationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)operationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Scan"] == NSOrderedSame) {
            return @(AWSSsmPatchOperationTypeScan);
        }
        if ([value caseInsensitiveCompare:@"Install"] == NSOrderedSame) {
            return @(AWSSsmPatchOperationTypeInstall);
        }
        return @(AWSSsmPatchOperationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmPatchOperationTypeScan:
                return @"Scan";
            case AWSSsmPatchOperationTypeInstall:
                return @"Install";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)operationEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)operationStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)rebootOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RebootIfNeeded"] == NSOrderedSame) {
            return @(AWSSsmRebootOptionRebootIfNeeded);
        }
        if ([value caseInsensitiveCompare:@"NoReboot"] == NSOrderedSame) {
            return @(AWSSsmRebootOptionNoReboot);
        }
        return @(AWSSsmRebootOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmRebootOptionRebootIfNeeded:
                return @"RebootIfNeeded";
            case AWSSsmRebootOptionNoReboot:
                return @"NoReboot";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmInstancePatchStateFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"types" : @"Type",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Equal"] == NSOrderedSame) {
            return @(AWSSsmInstancePatchStateOperatorTypeEqual);
        }
        if ([value caseInsensitiveCompare:@"NotEqual"] == NSOrderedSame) {
            return @(AWSSsmInstancePatchStateOperatorTypeNotEqual);
        }
        if ([value caseInsensitiveCompare:@"LessThan"] == NSOrderedSame) {
            return @(AWSSsmInstancePatchStateOperatorTypeLessThan);
        }
        if ([value caseInsensitiveCompare:@"GreaterThan"] == NSOrderedSame) {
            return @(AWSSsmInstancePatchStateOperatorTypeGreaterThan);
        }
        return @(AWSSsmInstancePatchStateOperatorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmInstancePatchStateOperatorTypeEqual:
                return @"Equal";
            case AWSSsmInstancePatchStateOperatorTypeNotEqual:
                return @"NotEqual";
            case AWSSsmInstancePatchStateOperatorTypeLessThan:
                return @"LessThan";
            case AWSSsmInstancePatchStateOperatorTypeGreaterThan:
                return @"GreaterThan";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmInventoryAggregator

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aggregators" : @"Aggregators",
             @"expression" : @"Expression",
             @"groups" : @"Groups",
             };
}

+ (NSValueTransformer *)aggregatorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmInventoryAggregator class]];
}

+ (NSValueTransformer *)groupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmInventoryGroup class]];
}

@end

@implementation AWSSsmInventoryDeletionStatusItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deletionId" : @"DeletionId",
             @"deletionStartTime" : @"DeletionStartTime",
             @"deletionSummary" : @"DeletionSummary",
             @"lastStatus" : @"LastStatus",
             @"lastStatusMessage" : @"LastStatusMessage",
             @"lastStatusUpdateTime" : @"LastStatusUpdateTime",
             @"typeName" : @"TypeName",
             };
}

+ (NSValueTransformer *)deletionStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)deletionSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmInventoryDeletionSummary class]];
}

+ (NSValueTransformer *)lastStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSsmInventoryDeletionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSSsmInventoryDeletionStatusComplete);
        }
        return @(AWSSsmInventoryDeletionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmInventoryDeletionStatusInProgress:
                return @"InProgress";
            case AWSSsmInventoryDeletionStatusComplete:
                return @"Complete";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastStatusUpdateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSsmInventoryDeletionSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"remainingCount" : @"RemainingCount",
             @"summaryItems" : @"SummaryItems",
             @"totalCount" : @"TotalCount",
             };
}

+ (NSValueTransformer *)summaryItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmInventoryDeletionSummaryItem class]];
}

@end

@implementation AWSSsmInventoryDeletionSummaryItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"count" : @"Count",
             @"remainingCount" : @"RemainingCount",
             @"version" : @"Version",
             };
}

@end

@implementation AWSSsmInventoryFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"types" : @"Type",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Equal"] == NSOrderedSame) {
            return @(AWSSsmInventoryQueryOperatorTypeEqual);
        }
        if ([value caseInsensitiveCompare:@"NotEqual"] == NSOrderedSame) {
            return @(AWSSsmInventoryQueryOperatorTypeNotEqual);
        }
        if ([value caseInsensitiveCompare:@"BeginWith"] == NSOrderedSame) {
            return @(AWSSsmInventoryQueryOperatorTypeBeginWith);
        }
        if ([value caseInsensitiveCompare:@"LessThan"] == NSOrderedSame) {
            return @(AWSSsmInventoryQueryOperatorTypeLessThan);
        }
        if ([value caseInsensitiveCompare:@"GreaterThan"] == NSOrderedSame) {
            return @(AWSSsmInventoryQueryOperatorTypeGreaterThan);
        }
        if ([value caseInsensitiveCompare:@"Exists"] == NSOrderedSame) {
            return @(AWSSsmInventoryQueryOperatorTypeExists);
        }
        return @(AWSSsmInventoryQueryOperatorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmInventoryQueryOperatorTypeEqual:
                return @"Equal";
            case AWSSsmInventoryQueryOperatorTypeNotEqual:
                return @"NotEqual";
            case AWSSsmInventoryQueryOperatorTypeBeginWith:
                return @"BeginWith";
            case AWSSsmInventoryQueryOperatorTypeLessThan:
                return @"LessThan";
            case AWSSsmInventoryQueryOperatorTypeGreaterThan:
                return @"GreaterThan";
            case AWSSsmInventoryQueryOperatorTypeExists:
                return @"Exists";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmInventoryGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmInventoryFilter class]];
}

@end

@implementation AWSSsmInventoryItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"captureTime" : @"CaptureTime",
             @"content" : @"Content",
             @"contentHash" : @"ContentHash",
             @"context" : @"Context",
             @"schemaVersion" : @"SchemaVersion",
             @"typeName" : @"TypeName",
             };
}

+ (NSValueTransformer *)contentJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[NSString class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

@end

@implementation AWSSsmInventoryItemAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataType" : @"DataType",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)dataTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"string"] == NSOrderedSame) {
            return @(AWSSsmInventoryAttributeDataTypeString);
        }
        if ([value caseInsensitiveCompare:@"number"] == NSOrderedSame) {
            return @(AWSSsmInventoryAttributeDataTypeNumber);
        }
        return @(AWSSsmInventoryAttributeDataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmInventoryAttributeDataTypeString:
                return @"string";
            case AWSSsmInventoryAttributeDataTypeNumber:
                return @"number";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmInventoryItemSchema

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"displayName" : @"DisplayName",
             @"typeName" : @"TypeName",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmInventoryItemAttribute class]];
}

@end

@implementation AWSSsmInventoryResultEntity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"Data",
             @"identifier" : @"Id",
             };
}

+ (NSValueTransformer *)dataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSsmInventoryResultItem class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSSsmInventoryResultItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"captureTime" : @"CaptureTime",
             @"content" : @"Content",
             @"contentHash" : @"ContentHash",
             @"schemaVersion" : @"SchemaVersion",
             @"typeName" : @"TypeName",
             };
}

+ (NSValueTransformer *)contentJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[NSString class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

@end

@implementation AWSSsmLabelParameterVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labels" : @"Labels",
             @"name" : @"Name",
             @"parameterVersion" : @"ParameterVersion",
             };
}

@end

@implementation AWSSsmLabelParameterVersionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invalidLabels" : @"InvalidLabels",
             @"parameterVersion" : @"ParameterVersion",
             };
}

@end

@implementation AWSSsmListAssociationVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSsmListAssociationVersionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationVersions" : @"AssociationVersions",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)associationVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmAssociationVersionInfo class]];
}

@end

@implementation AWSSsmListAssociationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationFilterList" : @"AssociationFilterList",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)associationFilterListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmAssociationFilter class]];
}

@end

@implementation AWSSsmListAssociationsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associations" : @"Associations",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)associationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmAssociation class]];
}

@end

@implementation AWSSsmListCommandInvocationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commandId" : @"CommandId",
             @"details" : @"Details",
             @"filters" : @"Filters",
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmCommandFilter class]];
}

@end

@implementation AWSSsmListCommandInvocationsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commandInvocations" : @"CommandInvocations",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)commandInvocationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmCommandInvocation class]];
}

@end

@implementation AWSSsmListCommandsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commandId" : @"CommandId",
             @"filters" : @"Filters",
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmCommandFilter class]];
}

@end

@implementation AWSSsmListCommandsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commands" : @"Commands",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)commandsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmCommand class]];
}

@end

@implementation AWSSsmListComplianceItemsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"resourceIds" : @"ResourceIds",
             @"resourceTypes" : @"ResourceTypes",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmComplianceStringFilter class]];
}

@end

@implementation AWSSsmListComplianceItemsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"complianceItems" : @"ComplianceItems",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)complianceItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmComplianceItem class]];
}

@end

@implementation AWSSsmListComplianceSummariesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmComplianceStringFilter class]];
}

@end

@implementation AWSSsmListComplianceSummariesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"complianceSummaryItems" : @"ComplianceSummaryItems",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)complianceSummaryItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmComplianceSummaryItem class]];
}

@end

@implementation AWSSsmListDocumentVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"name" : @"Name",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSsmListDocumentVersionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentVersions" : @"DocumentVersions",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)documentVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmDocumentVersionInfo class]];
}

@end

@implementation AWSSsmListDocumentsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentFilterList" : @"DocumentFilterList",
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)documentFilterListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmDocumentFilter class]];
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmDocumentKeyValuesFilter class]];
}

@end

@implementation AWSSsmListDocumentsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentIdentifiers" : @"DocumentIdentifiers",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)documentIdentifiersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmDocumentIdentifier class]];
}

@end

@implementation AWSSsmListInventoryEntriesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"typeName" : @"TypeName",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmInventoryFilter class]];
}

@end

@implementation AWSSsmListInventoryEntriesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"captureTime" : @"CaptureTime",
             @"entries" : @"Entries",
             @"instanceId" : @"InstanceId",
             @"nextToken" : @"NextToken",
             @"schemaVersion" : @"SchemaVersion",
             @"typeName" : @"TypeName",
             };
}

+ (NSValueTransformer *)entriesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[NSString class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

@end

@implementation AWSSsmListResourceComplianceSummariesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmComplianceStringFilter class]];
}

@end

@implementation AWSSsmListResourceComplianceSummariesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"resourceComplianceSummaryItems" : @"ResourceComplianceSummaryItems",
             };
}

+ (NSValueTransformer *)resourceComplianceSummaryItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmResourceComplianceSummaryItem class]];
}

@end

@implementation AWSSsmListResourceDataSyncRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"syncType" : @"SyncType",
             };
}

@end

@implementation AWSSsmListResourceDataSyncResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"resourceDataSyncItems" : @"ResourceDataSyncItems",
             };
}

+ (NSValueTransformer *)resourceDataSyncItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmResourceDataSyncItem class]];
}

@end

@implementation AWSSsmListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Document"] == NSOrderedSame) {
            return @(AWSSsmResourceTypeForTaggingDocument);
        }
        if ([value caseInsensitiveCompare:@"ManagedInstance"] == NSOrderedSame) {
            return @(AWSSsmResourceTypeForTaggingManagedInstance);
        }
        if ([value caseInsensitiveCompare:@"MaintenanceWindow"] == NSOrderedSame) {
            return @(AWSSsmResourceTypeForTaggingMaintenanceWindow);
        }
        if ([value caseInsensitiveCompare:@"Parameter"] == NSOrderedSame) {
            return @(AWSSsmResourceTypeForTaggingParameter);
        }
        if ([value caseInsensitiveCompare:@"PatchBaseline"] == NSOrderedSame) {
            return @(AWSSsmResourceTypeForTaggingPatchBaseline);
        }
        if ([value caseInsensitiveCompare:@"OpsItem"] == NSOrderedSame) {
            return @(AWSSsmResourceTypeForTaggingOpsItem);
        }
        return @(AWSSsmResourceTypeForTaggingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmResourceTypeForTaggingDocument:
                return @"Document";
            case AWSSsmResourceTypeForTaggingManagedInstance:
                return @"ManagedInstance";
            case AWSSsmResourceTypeForTaggingMaintenanceWindow:
                return @"MaintenanceWindow";
            case AWSSsmResourceTypeForTaggingParameter:
                return @"Parameter";
            case AWSSsmResourceTypeForTaggingPatchBaseline:
                return @"PatchBaseline";
            case AWSSsmResourceTypeForTaggingOpsItem:
                return @"OpsItem";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmListTagsForResourceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagList" : @"TagList",
             };
}

+ (NSValueTransformer *)tagListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTag class]];
}

@end

@implementation AWSSsmLoggingInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3BucketName" : @"S3BucketName",
             @"s3KeyPrefix" : @"S3KeyPrefix",
             @"s3Region" : @"S3Region",
             };
}

@end

@implementation AWSSsmMaintenanceWindowAutomationParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentVersion" : @"DocumentVersion",
             @"parameters" : @"Parameters",
             };
}

@end

@implementation AWSSsmMaintenanceWindowExecution

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"EndTime",
             @"startTime" : @"StartTime",
             @"status" : @"Status",
             @"statusDetails" : @"StatusDetails",
             @"windowExecutionId" : @"WindowExecutionId",
             @"windowId" : @"WindowId",
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
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"CANCELLING"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"SKIPPED_OVERLAPPING"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusSkippedOverlapping);
        }
        return @(AWSSsmMaintenanceWindowExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmMaintenanceWindowExecutionStatusPending:
                return @"PENDING";
            case AWSSsmMaintenanceWindowExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSSsmMaintenanceWindowExecutionStatusSuccess:
                return @"SUCCESS";
            case AWSSsmMaintenanceWindowExecutionStatusFailed:
                return @"FAILED";
            case AWSSsmMaintenanceWindowExecutionStatusTimedOut:
                return @"TIMED_OUT";
            case AWSSsmMaintenanceWindowExecutionStatusCancelling:
                return @"CANCELLING";
            case AWSSsmMaintenanceWindowExecutionStatusCancelled:
                return @"CANCELLED";
            case AWSSsmMaintenanceWindowExecutionStatusSkippedOverlapping:
                return @"SKIPPED_OVERLAPPING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmMaintenanceWindowExecutionTaskIdentity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"EndTime",
             @"startTime" : @"StartTime",
             @"status" : @"Status",
             @"statusDetails" : @"StatusDetails",
             @"taskArn" : @"TaskArn",
             @"taskExecutionId" : @"TaskExecutionId",
             @"taskType" : @"TaskType",
             @"windowExecutionId" : @"WindowExecutionId",
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
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"CANCELLING"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"SKIPPED_OVERLAPPING"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusSkippedOverlapping);
        }
        return @(AWSSsmMaintenanceWindowExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmMaintenanceWindowExecutionStatusPending:
                return @"PENDING";
            case AWSSsmMaintenanceWindowExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSSsmMaintenanceWindowExecutionStatusSuccess:
                return @"SUCCESS";
            case AWSSsmMaintenanceWindowExecutionStatusFailed:
                return @"FAILED";
            case AWSSsmMaintenanceWindowExecutionStatusTimedOut:
                return @"TIMED_OUT";
            case AWSSsmMaintenanceWindowExecutionStatusCancelling:
                return @"CANCELLING";
            case AWSSsmMaintenanceWindowExecutionStatusCancelled:
                return @"CANCELLED";
            case AWSSsmMaintenanceWindowExecutionStatusSkippedOverlapping:
                return @"SKIPPED_OVERLAPPING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taskTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUN_COMMAND"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeRunCommand);
        }
        if ([value caseInsensitiveCompare:@"AUTOMATION"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"STEP_FUNCTIONS"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeStepFunctions);
        }
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeLambda);
        }
        return @(AWSSsmMaintenanceWindowTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmMaintenanceWindowTaskTypeRunCommand:
                return @"RUN_COMMAND";
            case AWSSsmMaintenanceWindowTaskTypeAutomation:
                return @"AUTOMATION";
            case AWSSsmMaintenanceWindowTaskTypeStepFunctions:
                return @"STEP_FUNCTIONS";
            case AWSSsmMaintenanceWindowTaskTypeLambda:
                return @"LAMBDA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmMaintenanceWindowExecutionTaskInvocationIdentity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"EndTime",
             @"executionId" : @"ExecutionId",
             @"invocationId" : @"InvocationId",
             @"ownerInformation" : @"OwnerInformation",
             @"parameters" : @"Parameters",
             @"startTime" : @"StartTime",
             @"status" : @"Status",
             @"statusDetails" : @"StatusDetails",
             @"taskExecutionId" : @"TaskExecutionId",
             @"taskType" : @"TaskType",
             @"windowExecutionId" : @"WindowExecutionId",
             @"windowTargetId" : @"WindowTargetId",
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
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"CANCELLING"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"SKIPPED_OVERLAPPING"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowExecutionStatusSkippedOverlapping);
        }
        return @(AWSSsmMaintenanceWindowExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmMaintenanceWindowExecutionStatusPending:
                return @"PENDING";
            case AWSSsmMaintenanceWindowExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSSsmMaintenanceWindowExecutionStatusSuccess:
                return @"SUCCESS";
            case AWSSsmMaintenanceWindowExecutionStatusFailed:
                return @"FAILED";
            case AWSSsmMaintenanceWindowExecutionStatusTimedOut:
                return @"TIMED_OUT";
            case AWSSsmMaintenanceWindowExecutionStatusCancelling:
                return @"CANCELLING";
            case AWSSsmMaintenanceWindowExecutionStatusCancelled:
                return @"CANCELLED";
            case AWSSsmMaintenanceWindowExecutionStatusSkippedOverlapping:
                return @"SKIPPED_OVERLAPPING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taskTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUN_COMMAND"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeRunCommand);
        }
        if ([value caseInsensitiveCompare:@"AUTOMATION"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"STEP_FUNCTIONS"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeStepFunctions);
        }
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeLambda);
        }
        return @(AWSSsmMaintenanceWindowTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmMaintenanceWindowTaskTypeRunCommand:
                return @"RUN_COMMAND";
            case AWSSsmMaintenanceWindowTaskTypeAutomation:
                return @"AUTOMATION";
            case AWSSsmMaintenanceWindowTaskTypeStepFunctions:
                return @"STEP_FUNCTIONS";
            case AWSSsmMaintenanceWindowTaskTypeLambda:
                return @"LAMBDA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmMaintenanceWindowFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

@end

@implementation AWSSsmMaintenanceWindowIdentity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cutoff" : @"Cutoff",
             @"detail" : @"Description",
             @"duration" : @"Duration",
             @"enabled" : @"Enabled",
             @"endDate" : @"EndDate",
             @"name" : @"Name",
             @"nextExecutionTime" : @"NextExecutionTime",
             @"schedule" : @"Schedule",
             @"scheduleOffset" : @"ScheduleOffset",
             @"scheduleTimezone" : @"ScheduleTimezone",
             @"startDate" : @"StartDate",
             @"windowId" : @"WindowId",
             };
}

@end

@implementation AWSSsmMaintenanceWindowIdentityForTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"windowId" : @"WindowId",
             };
}

@end

@implementation AWSSsmMaintenanceWindowLambdaParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientContext" : @"ClientContext",
             @"payload" : @"Payload",
             @"qualifier" : @"Qualifier",
             };
}

@end

@implementation AWSSsmMaintenanceWindowRunCommandParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchOutputConfig" : @"CloudWatchOutputConfig",
             @"comment" : @"Comment",
             @"documentHash" : @"DocumentHash",
             @"documentHashType" : @"DocumentHashType",
             @"documentVersion" : @"DocumentVersion",
             @"notificationConfig" : @"NotificationConfig",
             @"outputS3BucketName" : @"OutputS3BucketName",
             @"outputS3KeyPrefix" : @"OutputS3KeyPrefix",
             @"parameters" : @"Parameters",
             @"serviceRoleArn" : @"ServiceRoleArn",
             @"timeoutSeconds" : @"TimeoutSeconds",
             };
}

+ (NSValueTransformer *)cloudWatchOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmCloudWatchOutputConfig class]];
}

+ (NSValueTransformer *)documentHashTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Sha256"] == NSOrderedSame) {
            return @(AWSSsmDocumentHashTypeSha256);
        }
        if ([value caseInsensitiveCompare:@"Sha1"] == NSOrderedSame) {
            return @(AWSSsmDocumentHashTypeSha1);
        }
        return @(AWSSsmDocumentHashTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmDocumentHashTypeSha256:
                return @"Sha256";
            case AWSSsmDocumentHashTypeSha1:
                return @"Sha1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)notificationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmNotificationConfig class]];
}

@end

@implementation AWSSsmMaintenanceWindowStepFunctionsParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"input" : @"Input",
             @"name" : @"Name",
             };
}

@end

@implementation AWSSsmMaintenanceWindowTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"name" : @"Name",
             @"ownerInformation" : @"OwnerInformation",
             @"resourceType" : @"ResourceType",
             @"targets" : @"Targets",
             @"windowId" : @"WindowId",
             @"windowTargetId" : @"WindowTargetId",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSTANCE"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_GROUP"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowResourceTypeResourceGroup);
        }
        return @(AWSSsmMaintenanceWindowResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmMaintenanceWindowResourceTypeInstance:
                return @"INSTANCE";
            case AWSSsmMaintenanceWindowResourceTypeResourceGroup:
                return @"RESOURCE_GROUP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTarget class]];
}

@end

@implementation AWSSsmMaintenanceWindowTask

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"loggingInfo" : @"LoggingInfo",
             @"maxConcurrency" : @"MaxConcurrency",
             @"maxErrors" : @"MaxErrors",
             @"name" : @"Name",
             @"priority" : @"Priority",
             @"serviceRoleArn" : @"ServiceRoleArn",
             @"targets" : @"Targets",
             @"taskArn" : @"TaskArn",
             @"taskParameters" : @"TaskParameters",
             @"types" : @"Type",
             @"windowId" : @"WindowId",
             @"windowTaskId" : @"WindowTaskId",
             };
}

+ (NSValueTransformer *)loggingInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmLoggingInfo class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTarget class]];
}

+ (NSValueTransformer *)taskParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSsmMaintenanceWindowTaskParameterValueExpression class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUN_COMMAND"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeRunCommand);
        }
        if ([value caseInsensitiveCompare:@"AUTOMATION"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"STEP_FUNCTIONS"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeStepFunctions);
        }
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeLambda);
        }
        return @(AWSSsmMaintenanceWindowTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmMaintenanceWindowTaskTypeRunCommand:
                return @"RUN_COMMAND";
            case AWSSsmMaintenanceWindowTaskTypeAutomation:
                return @"AUTOMATION";
            case AWSSsmMaintenanceWindowTaskTypeStepFunctions:
                return @"STEP_FUNCTIONS";
            case AWSSsmMaintenanceWindowTaskTypeLambda:
                return @"LAMBDA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmMaintenanceWindowTaskInvocationParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automation" : @"Automation",
             @"lambda" : @"Lambda",
             @"runCommand" : @"RunCommand",
             @"stepFunctions" : @"StepFunctions",
             };
}

+ (NSValueTransformer *)automationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmMaintenanceWindowAutomationParameters class]];
}

+ (NSValueTransformer *)lambdaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmMaintenanceWindowLambdaParameters class]];
}

+ (NSValueTransformer *)runCommandJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmMaintenanceWindowRunCommandParameters class]];
}

+ (NSValueTransformer *)stepFunctionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmMaintenanceWindowStepFunctionsParameters class]];
}

@end

@implementation AWSSsmMaintenanceWindowTaskParameterValueExpression

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"values" : @"Values",
             };
}

@end

@implementation AWSSsmModifyDocumentPermissionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIdsToAdd" : @"AccountIdsToAdd",
             @"accountIdsToRemove" : @"AccountIdsToRemove",
             @"name" : @"Name",
             @"permissionType" : @"PermissionType",
             @"sharedDocumentVersion" : @"SharedDocumentVersion",
             };
}

+ (NSValueTransformer *)permissionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Share"] == NSOrderedSame) {
            return @(AWSSsmDocumentPermissionTypeShare);
        }
        return @(AWSSsmDocumentPermissionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmDocumentPermissionTypeShare:
                return @"Share";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmModifyDocumentPermissionResponse

@end

@implementation AWSSsmNonCompliantSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nonCompliantCount" : @"NonCompliantCount",
             @"severitySummary" : @"SeveritySummary",
             };
}

+ (NSValueTransformer *)severitySummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmSeveritySummary class]];
}

@end

@implementation AWSSsmNotificationConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notificationArn" : @"NotificationArn",
             @"notificationEvents" : @"NotificationEvents",
             @"notificationType" : @"NotificationType",
             };
}

+ (NSValueTransformer *)notificationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Command"] == NSOrderedSame) {
            return @(AWSSsmNotificationTypeCommand);
        }
        if ([value caseInsensitiveCompare:@"Invocation"] == NSOrderedSame) {
            return @(AWSSsmNotificationTypeInvocation);
        }
        return @(AWSSsmNotificationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmNotificationTypeCommand:
                return @"Command";
            case AWSSsmNotificationTypeInvocation:
                return @"Invocation";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmOpsAggregator

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aggregatorType" : @"AggregatorType",
             @"aggregators" : @"Aggregators",
             @"attributeName" : @"AttributeName",
             @"filters" : @"Filters",
             @"typeName" : @"TypeName",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)aggregatorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmOpsAggregator class]];
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmOpsFilter class]];
}

@end

@implementation AWSSsmOpsEntity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"Data",
             @"identifier" : @"Id",
             };
}

+ (NSValueTransformer *)dataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSsmOpsEntityItem class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSSsmOpsEntityItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"captureTime" : @"CaptureTime",
             @"content" : @"Content",
             };
}

+ (NSValueTransformer *)contentJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[NSString class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

@end

@implementation AWSSsmOpsFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"types" : @"Type",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Equal"] == NSOrderedSame) {
            return @(AWSSsmOpsFilterOperatorTypeEqual);
        }
        if ([value caseInsensitiveCompare:@"NotEqual"] == NSOrderedSame) {
            return @(AWSSsmOpsFilterOperatorTypeNotEqual);
        }
        if ([value caseInsensitiveCompare:@"BeginWith"] == NSOrderedSame) {
            return @(AWSSsmOpsFilterOperatorTypeBeginWith);
        }
        if ([value caseInsensitiveCompare:@"LessThan"] == NSOrderedSame) {
            return @(AWSSsmOpsFilterOperatorTypeLessThan);
        }
        if ([value caseInsensitiveCompare:@"GreaterThan"] == NSOrderedSame) {
            return @(AWSSsmOpsFilterOperatorTypeGreaterThan);
        }
        if ([value caseInsensitiveCompare:@"Exists"] == NSOrderedSame) {
            return @(AWSSsmOpsFilterOperatorTypeExists);
        }
        return @(AWSSsmOpsFilterOperatorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmOpsFilterOperatorTypeEqual:
                return @"Equal";
            case AWSSsmOpsFilterOperatorTypeNotEqual:
                return @"NotEqual";
            case AWSSsmOpsFilterOperatorTypeBeginWith:
                return @"BeginWith";
            case AWSSsmOpsFilterOperatorTypeLessThan:
                return @"LessThan";
            case AWSSsmOpsFilterOperatorTypeGreaterThan:
                return @"GreaterThan";
            case AWSSsmOpsFilterOperatorTypeExists:
                return @"Exists";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmOpsItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"category" : @"Category",
             @"createdBy" : @"CreatedBy",
             @"createdTime" : @"CreatedTime",
             @"detail" : @"Description",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"notifications" : @"Notifications",
             @"operationalData" : @"OperationalData",
             @"opsItemId" : @"OpsItemId",
             @"priority" : @"Priority",
             @"relatedOpsItems" : @"RelatedOpsItems",
             @"severity" : @"Severity",
             @"source" : @"Source",
             @"status" : @"Status",
             @"title" : @"Title",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)notificationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmOpsItemNotification class]];
}

+ (NSValueTransformer *)operationalDataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSsmOpsItemDataValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)relatedOpsItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmRelatedOpsItem class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Open"] == NSOrderedSame) {
            return @(AWSSsmOpsItemStatusOpen);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSsmOpsItemStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Resolved"] == NSOrderedSame) {
            return @(AWSSsmOpsItemStatusResolved);
        }
        return @(AWSSsmOpsItemStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmOpsItemStatusOpen:
                return @"Open";
            case AWSSsmOpsItemStatusInProgress:
                return @"InProgress";
            case AWSSsmOpsItemStatusResolved:
                return @"Resolved";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmOpsItemDataValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SearchableString"] == NSOrderedSame) {
            return @(AWSSsmOpsItemDataTypeSearchableString);
        }
        if ([value caseInsensitiveCompare:@"String"] == NSOrderedSame) {
            return @(AWSSsmOpsItemDataTypeString);
        }
        return @(AWSSsmOpsItemDataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmOpsItemDataTypeSearchableString:
                return @"SearchableString";
            case AWSSsmOpsItemDataTypeString:
                return @"String";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmOpsItemFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"operator" : @"Operator",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSsmOpsItemFilterKeyStatus);
        }
        if ([value caseInsensitiveCompare:@"CreatedBy"] == NSOrderedSame) {
            return @(AWSSsmOpsItemFilterKeyCreatedBy);
        }
        if ([value caseInsensitiveCompare:@"Source"] == NSOrderedSame) {
            return @(AWSSsmOpsItemFilterKeySource);
        }
        if ([value caseInsensitiveCompare:@"Priority"] == NSOrderedSame) {
            return @(AWSSsmOpsItemFilterKeyPriority);
        }
        if ([value caseInsensitiveCompare:@"Title"] == NSOrderedSame) {
            return @(AWSSsmOpsItemFilterKeyTitle);
        }
        if ([value caseInsensitiveCompare:@"OpsItemId"] == NSOrderedSame) {
            return @(AWSSsmOpsItemFilterKeyOpsItemId);
        }
        if ([value caseInsensitiveCompare:@"CreatedTime"] == NSOrderedSame) {
            return @(AWSSsmOpsItemFilterKeyCreatedTime);
        }
        if ([value caseInsensitiveCompare:@"LastModifiedTime"] == NSOrderedSame) {
            return @(AWSSsmOpsItemFilterKeyLastModifiedTime);
        }
        if ([value caseInsensitiveCompare:@"OperationalData"] == NSOrderedSame) {
            return @(AWSSsmOpsItemFilterKeyOperationalData);
        }
        if ([value caseInsensitiveCompare:@"OperationalDataKey"] == NSOrderedSame) {
            return @(AWSSsmOpsItemFilterKeyOperationalDataKey);
        }
        if ([value caseInsensitiveCompare:@"OperationalDataValue"] == NSOrderedSame) {
            return @(AWSSsmOpsItemFilterKeyOperationalDataValue);
        }
        if ([value caseInsensitiveCompare:@"ResourceId"] == NSOrderedSame) {
            return @(AWSSsmOpsItemFilterKeyResourceId);
        }
        if ([value caseInsensitiveCompare:@"AutomationId"] == NSOrderedSame) {
            return @(AWSSsmOpsItemFilterKeyAutomationId);
        }
        if ([value caseInsensitiveCompare:@"Category"] == NSOrderedSame) {
            return @(AWSSsmOpsItemFilterKeyCategory);
        }
        if ([value caseInsensitiveCompare:@"Severity"] == NSOrderedSame) {
            return @(AWSSsmOpsItemFilterKeySeverity);
        }
        return @(AWSSsmOpsItemFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmOpsItemFilterKeyStatus:
                return @"Status";
            case AWSSsmOpsItemFilterKeyCreatedBy:
                return @"CreatedBy";
            case AWSSsmOpsItemFilterKeySource:
                return @"Source";
            case AWSSsmOpsItemFilterKeyPriority:
                return @"Priority";
            case AWSSsmOpsItemFilterKeyTitle:
                return @"Title";
            case AWSSsmOpsItemFilterKeyOpsItemId:
                return @"OpsItemId";
            case AWSSsmOpsItemFilterKeyCreatedTime:
                return @"CreatedTime";
            case AWSSsmOpsItemFilterKeyLastModifiedTime:
                return @"LastModifiedTime";
            case AWSSsmOpsItemFilterKeyOperationalData:
                return @"OperationalData";
            case AWSSsmOpsItemFilterKeyOperationalDataKey:
                return @"OperationalDataKey";
            case AWSSsmOpsItemFilterKeyOperationalDataValue:
                return @"OperationalDataValue";
            case AWSSsmOpsItemFilterKeyResourceId:
                return @"ResourceId";
            case AWSSsmOpsItemFilterKeyAutomationId:
                return @"AutomationId";
            case AWSSsmOpsItemFilterKeyCategory:
                return @"Category";
            case AWSSsmOpsItemFilterKeySeverity:
                return @"Severity";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)operatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Equal"] == NSOrderedSame) {
            return @(AWSSsmOpsItemFilterOperatorEqual);
        }
        if ([value caseInsensitiveCompare:@"Contains"] == NSOrderedSame) {
            return @(AWSSsmOpsItemFilterOperatorContains);
        }
        if ([value caseInsensitiveCompare:@"GreaterThan"] == NSOrderedSame) {
            return @(AWSSsmOpsItemFilterOperatorGreaterThan);
        }
        if ([value caseInsensitiveCompare:@"LessThan"] == NSOrderedSame) {
            return @(AWSSsmOpsItemFilterOperatorLessThan);
        }
        return @(AWSSsmOpsItemFilterOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmOpsItemFilterOperatorEqual:
                return @"Equal";
            case AWSSsmOpsItemFilterOperatorContains:
                return @"Contains";
            case AWSSsmOpsItemFilterOperatorGreaterThan:
                return @"GreaterThan";
            case AWSSsmOpsItemFilterOperatorLessThan:
                return @"LessThan";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmOpsItemNotification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             };
}

@end

@implementation AWSSsmOpsItemSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"category" : @"Category",
             @"createdBy" : @"CreatedBy",
             @"createdTime" : @"CreatedTime",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"operationalData" : @"OperationalData",
             @"opsItemId" : @"OpsItemId",
             @"priority" : @"Priority",
             @"severity" : @"Severity",
             @"source" : @"Source",
             @"status" : @"Status",
             @"title" : @"Title",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)operationalDataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSsmOpsItemDataValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Open"] == NSOrderedSame) {
            return @(AWSSsmOpsItemStatusOpen);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSsmOpsItemStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Resolved"] == NSOrderedSame) {
            return @(AWSSsmOpsItemStatusResolved);
        }
        return @(AWSSsmOpsItemStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmOpsItemStatusOpen:
                return @"Open";
            case AWSSsmOpsItemStatusInProgress:
                return @"InProgress";
            case AWSSsmOpsItemStatusResolved:
                return @"Resolved";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmOpsResultAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"typeName" : @"TypeName",
             };
}

@end

@implementation AWSSsmOutputSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputSourceId" : @"OutputSourceId",
             @"outputSourceType" : @"OutputSourceType",
             };
}

@end

@implementation AWSSsmParameter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"dataType" : @"DataType",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"name" : @"Name",
             @"selector" : @"Selector",
             @"sourceResult" : @"SourceResult",
             @"types" : @"Type",
             @"value" : @"Value",
             @"version" : @"Version",
             };
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
        if ([value caseInsensitiveCompare:@"String"] == NSOrderedSame) {
            return @(AWSSsmParameterTypeString);
        }
        if ([value caseInsensitiveCompare:@"StringList"] == NSOrderedSame) {
            return @(AWSSsmParameterTypeStringList);
        }
        if ([value caseInsensitiveCompare:@"SecureString"] == NSOrderedSame) {
            return @(AWSSsmParameterTypeSecureString);
        }
        return @(AWSSsmParameterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmParameterTypeString:
                return @"String";
            case AWSSsmParameterTypeStringList:
                return @"StringList";
            case AWSSsmParameterTypeSecureString:
                return @"SecureString";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmParameterHistory

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedPattern" : @"AllowedPattern",
             @"dataType" : @"DataType",
             @"detail" : @"Description",
             @"keyId" : @"KeyId",
             @"labels" : @"Labels",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"lastModifiedUser" : @"LastModifiedUser",
             @"name" : @"Name",
             @"policies" : @"Policies",
             @"tier" : @"Tier",
             @"types" : @"Type",
             @"value" : @"Value",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)lastModifiedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)policiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmParameterInlinePolicy class]];
}

+ (NSValueTransformer *)tierJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSSsmParameterTierStandard);
        }
        if ([value caseInsensitiveCompare:@"Advanced"] == NSOrderedSame) {
            return @(AWSSsmParameterTierAdvanced);
        }
        if ([value caseInsensitiveCompare:@"Intelligent-Tiering"] == NSOrderedSame) {
            return @(AWSSsmParameterTierIntelligentTiering);
        }
        return @(AWSSsmParameterTierUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmParameterTierStandard:
                return @"Standard";
            case AWSSsmParameterTierAdvanced:
                return @"Advanced";
            case AWSSsmParameterTierIntelligentTiering:
                return @"Intelligent-Tiering";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"String"] == NSOrderedSame) {
            return @(AWSSsmParameterTypeString);
        }
        if ([value caseInsensitiveCompare:@"StringList"] == NSOrderedSame) {
            return @(AWSSsmParameterTypeStringList);
        }
        if ([value caseInsensitiveCompare:@"SecureString"] == NSOrderedSame) {
            return @(AWSSsmParameterTypeSecureString);
        }
        return @(AWSSsmParameterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmParameterTypeString:
                return @"String";
            case AWSSsmParameterTypeStringList:
                return @"StringList";
            case AWSSsmParameterTypeSecureString:
                return @"SecureString";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmParameterInlinePolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyStatus" : @"PolicyStatus",
             @"policyText" : @"PolicyText",
             @"policyType" : @"PolicyType",
             };
}

@end

@implementation AWSSsmParameterMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedPattern" : @"AllowedPattern",
             @"dataType" : @"DataType",
             @"detail" : @"Description",
             @"keyId" : @"KeyId",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"lastModifiedUser" : @"LastModifiedUser",
             @"name" : @"Name",
             @"policies" : @"Policies",
             @"tier" : @"Tier",
             @"types" : @"Type",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)lastModifiedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)policiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmParameterInlinePolicy class]];
}

+ (NSValueTransformer *)tierJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSSsmParameterTierStandard);
        }
        if ([value caseInsensitiveCompare:@"Advanced"] == NSOrderedSame) {
            return @(AWSSsmParameterTierAdvanced);
        }
        if ([value caseInsensitiveCompare:@"Intelligent-Tiering"] == NSOrderedSame) {
            return @(AWSSsmParameterTierIntelligentTiering);
        }
        return @(AWSSsmParameterTierUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmParameterTierStandard:
                return @"Standard";
            case AWSSsmParameterTierAdvanced:
                return @"Advanced";
            case AWSSsmParameterTierIntelligentTiering:
                return @"Intelligent-Tiering";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"String"] == NSOrderedSame) {
            return @(AWSSsmParameterTypeString);
        }
        if ([value caseInsensitiveCompare:@"StringList"] == NSOrderedSame) {
            return @(AWSSsmParameterTypeStringList);
        }
        if ([value caseInsensitiveCompare:@"SecureString"] == NSOrderedSame) {
            return @(AWSSsmParameterTypeSecureString);
        }
        return @(AWSSsmParameterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmParameterTypeString:
                return @"String";
            case AWSSsmParameterTypeStringList:
                return @"StringList";
            case AWSSsmParameterTypeSecureString:
                return @"SecureString";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmParameterStringFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"option" : @"Option",
             @"values" : @"Values",
             };
}

@end

@implementation AWSSsmParametersFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSSsmParametersFilterKeyName);
        }
        if ([value caseInsensitiveCompare:@"Type"] == NSOrderedSame) {
            return @(AWSSsmParametersFilterKeyType);
        }
        if ([value caseInsensitiveCompare:@"KeyId"] == NSOrderedSame) {
            return @(AWSSsmParametersFilterKeyKeyId);
        }
        return @(AWSSsmParametersFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmParametersFilterKeyName:
                return @"Name";
            case AWSSsmParametersFilterKeyType:
                return @"Type";
            case AWSSsmParametersFilterKeyKeyId:
                return @"KeyId";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmPatch

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classification" : @"Classification",
             @"contentUrl" : @"ContentUrl",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"kbNumber" : @"KbNumber",
             @"language" : @"Language",
             @"msrcNumber" : @"MsrcNumber",
             @"msrcSeverity" : @"MsrcSeverity",
             @"product" : @"Product",
             @"productFamily" : @"ProductFamily",
             @"releaseDate" : @"ReleaseDate",
             @"title" : @"Title",
             @"vendor" : @"Vendor",
             };
}

+ (NSValueTransformer *)releaseDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSsmPatchBaselineIdentity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineDescription" : @"BaselineDescription",
             @"baselineId" : @"BaselineId",
             @"baselineName" : @"BaselineName",
             @"defaultBaseline" : @"DefaultBaseline",
             @"operatingSystem" : @"OperatingSystem",
             };
}

+ (NSValueTransformer *)operatingSystemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WINDOWS"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemCentos);
        }
        if ([value caseInsensitiveCompare:@"ORACLE_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemOracleLinux);
        }
        if ([value caseInsensitiveCompare:@"DEBIAN"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemDebian);
        }
        return @(AWSSsmOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSsmOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSsmOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSsmOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSsmOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSsmOperatingSystemSuse:
                return @"SUSE";
            case AWSSsmOperatingSystemCentos:
                return @"CENTOS";
            case AWSSsmOperatingSystemOracleLinux:
                return @"ORACLE_LINUX";
            case AWSSsmOperatingSystemDebian:
                return @"DEBIAN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmPatchComplianceData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classification" : @"Classification",
             @"installedTime" : @"InstalledTime",
             @"KBId" : @"KBId",
             @"severity" : @"Severity",
             @"state" : @"State",
             @"title" : @"Title",
             };
}

+ (NSValueTransformer *)installedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSTALLED"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceDataStateInstalled);
        }
        if ([value caseInsensitiveCompare:@"INSTALLED_OTHER"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceDataStateInstalledOther);
        }
        if ([value caseInsensitiveCompare:@"INSTALLED_PENDING_REBOOT"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceDataStateInstalledPendingReboot);
        }
        if ([value caseInsensitiveCompare:@"INSTALLED_REJECTED"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceDataStateInstalledRejected);
        }
        if ([value caseInsensitiveCompare:@"MISSING"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceDataStateMissing);
        }
        if ([value caseInsensitiveCompare:@"NOT_APPLICABLE"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceDataStateNotApplicable);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceDataStateFailed);
        }
        return @(AWSSsmPatchComplianceDataStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmPatchComplianceDataStateInstalled:
                return @"INSTALLED";
            case AWSSsmPatchComplianceDataStateInstalledOther:
                return @"INSTALLED_OTHER";
            case AWSSsmPatchComplianceDataStateInstalledPendingReboot:
                return @"INSTALLED_PENDING_REBOOT";
            case AWSSsmPatchComplianceDataStateInstalledRejected:
                return @"INSTALLED_REJECTED";
            case AWSSsmPatchComplianceDataStateMissing:
                return @"MISSING";
            case AWSSsmPatchComplianceDataStateNotApplicable:
                return @"NOT_APPLICABLE";
            case AWSSsmPatchComplianceDataStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmPatchFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PATCH_SET"] == NSOrderedSame) {
            return @(AWSSsmPatchFilterKeyPatchSet);
        }
        if ([value caseInsensitiveCompare:@"PRODUCT"] == NSOrderedSame) {
            return @(AWSSsmPatchFilterKeyProduct);
        }
        if ([value caseInsensitiveCompare:@"PRODUCT_FAMILY"] == NSOrderedSame) {
            return @(AWSSsmPatchFilterKeyProductFamily);
        }
        if ([value caseInsensitiveCompare:@"CLASSIFICATION"] == NSOrderedSame) {
            return @(AWSSsmPatchFilterKeyClassification);
        }
        if ([value caseInsensitiveCompare:@"MSRC_SEVERITY"] == NSOrderedSame) {
            return @(AWSSsmPatchFilterKeyMsrcSeverity);
        }
        if ([value caseInsensitiveCompare:@"PATCH_ID"] == NSOrderedSame) {
            return @(AWSSsmPatchFilterKeyPatchId);
        }
        if ([value caseInsensitiveCompare:@"SECTION"] == NSOrderedSame) {
            return @(AWSSsmPatchFilterKeySection);
        }
        if ([value caseInsensitiveCompare:@"PRIORITY"] == NSOrderedSame) {
            return @(AWSSsmPatchFilterKeyPriority);
        }
        if ([value caseInsensitiveCompare:@"SEVERITY"] == NSOrderedSame) {
            return @(AWSSsmPatchFilterKeySeverity);
        }
        return @(AWSSsmPatchFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmPatchFilterKeyPatchSet:
                return @"PATCH_SET";
            case AWSSsmPatchFilterKeyProduct:
                return @"PRODUCT";
            case AWSSsmPatchFilterKeyProductFamily:
                return @"PRODUCT_FAMILY";
            case AWSSsmPatchFilterKeyClassification:
                return @"CLASSIFICATION";
            case AWSSsmPatchFilterKeyMsrcSeverity:
                return @"MSRC_SEVERITY";
            case AWSSsmPatchFilterKeyPatchId:
                return @"PATCH_ID";
            case AWSSsmPatchFilterKeySection:
                return @"SECTION";
            case AWSSsmPatchFilterKeyPriority:
                return @"PRIORITY";
            case AWSSsmPatchFilterKeySeverity:
                return @"SEVERITY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmPatchFilterGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"patchFilters" : @"PatchFilters",
             };
}

+ (NSValueTransformer *)patchFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmPatchFilter class]];
}

@end

@implementation AWSSsmPatchGroupPatchBaselineMapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineIdentity" : @"BaselineIdentity",
             @"patchGroup" : @"PatchGroup",
             };
}

+ (NSValueTransformer *)baselineIdentityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmPatchBaselineIdentity class]];
}

@end

@implementation AWSSsmPatchOrchestratorFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

@end

@implementation AWSSsmPatchRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approveAfterDays" : @"ApproveAfterDays",
             @"approveUntilDate" : @"ApproveUntilDate",
             @"complianceLevel" : @"ComplianceLevel",
             @"enableNonSecurity" : @"EnableNonSecurity",
             @"patchFilterGroup" : @"PatchFilterGroup",
             };
}

+ (NSValueTransformer *)complianceLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelUnspecified);
        }
        return @(AWSSsmPatchComplianceLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmPatchComplianceLevelCritical:
                return @"CRITICAL";
            case AWSSsmPatchComplianceLevelHigh:
                return @"HIGH";
            case AWSSsmPatchComplianceLevelMedium:
                return @"MEDIUM";
            case AWSSsmPatchComplianceLevelLow:
                return @"LOW";
            case AWSSsmPatchComplianceLevelInformational:
                return @"INFORMATIONAL";
            case AWSSsmPatchComplianceLevelUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)patchFilterGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmPatchFilterGroup class]];
}

@end

@implementation AWSSsmPatchRuleGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"patchRules" : @"PatchRules",
             };
}

+ (NSValueTransformer *)patchRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmPatchRule class]];
}

@end

@implementation AWSSsmPatchSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configuration" : @"Configuration",
             @"name" : @"Name",
             @"products" : @"Products",
             };
}

@end

@implementation AWSSsmPatchStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalDate" : @"ApprovalDate",
             @"complianceLevel" : @"ComplianceLevel",
             @"deploymentStatus" : @"DeploymentStatus",
             };
}

+ (NSValueTransformer *)approvalDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)complianceLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelUnspecified);
        }
        return @(AWSSsmPatchComplianceLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmPatchComplianceLevelCritical:
                return @"CRITICAL";
            case AWSSsmPatchComplianceLevelHigh:
                return @"HIGH";
            case AWSSsmPatchComplianceLevelMedium:
                return @"MEDIUM";
            case AWSSsmPatchComplianceLevelLow:
                return @"LOW";
            case AWSSsmPatchComplianceLevelInformational:
                return @"INFORMATIONAL";
            case AWSSsmPatchComplianceLevelUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)deploymentStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"APPROVED"] == NSOrderedSame) {
            return @(AWSSsmPatchDeploymentStatusApproved);
        }
        if ([value caseInsensitiveCompare:@"PENDING_APPROVAL"] == NSOrderedSame) {
            return @(AWSSsmPatchDeploymentStatusPendingApproval);
        }
        if ([value caseInsensitiveCompare:@"EXPLICIT_APPROVED"] == NSOrderedSame) {
            return @(AWSSsmPatchDeploymentStatusExplicitApproved);
        }
        if ([value caseInsensitiveCompare:@"EXPLICIT_REJECTED"] == NSOrderedSame) {
            return @(AWSSsmPatchDeploymentStatusExplicitRejected);
        }
        return @(AWSSsmPatchDeploymentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmPatchDeploymentStatusApproved:
                return @"APPROVED";
            case AWSSsmPatchDeploymentStatusPendingApproval:
                return @"PENDING_APPROVAL";
            case AWSSsmPatchDeploymentStatusExplicitApproved:
                return @"EXPLICIT_APPROVED";
            case AWSSsmPatchDeploymentStatusExplicitRejected:
                return @"EXPLICIT_REJECTED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmProgressCounters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cancelledSteps" : @"CancelledSteps",
             @"failedSteps" : @"FailedSteps",
             @"successSteps" : @"SuccessSteps",
             @"timedOutSteps" : @"TimedOutSteps",
             @"totalSteps" : @"TotalSteps",
             };
}

@end

@implementation AWSSsmPutComplianceItemsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"complianceType" : @"ComplianceType",
             @"executionSummary" : @"ExecutionSummary",
             @"itemContentHash" : @"ItemContentHash",
             @"items" : @"Items",
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             @"uploadType" : @"UploadType",
             };
}

+ (NSValueTransformer *)executionSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmComplianceExecutionSummary class]];
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmComplianceItemEntry class]];
}

+ (NSValueTransformer *)uploadTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLETE"] == NSOrderedSame) {
            return @(AWSSsmComplianceUploadTypeComplete);
        }
        if ([value caseInsensitiveCompare:@"PARTIAL"] == NSOrderedSame) {
            return @(AWSSsmComplianceUploadTypePartial);
        }
        return @(AWSSsmComplianceUploadTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmComplianceUploadTypeComplete:
                return @"COMPLETE";
            case AWSSsmComplianceUploadTypePartial:
                return @"PARTIAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmPutComplianceItemsResult

@end

@implementation AWSSsmPutInventoryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"items" : @"Items",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmInventoryItem class]];
}

@end

@implementation AWSSsmPutInventoryResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSSsmPutParameterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedPattern" : @"AllowedPattern",
             @"dataType" : @"DataType",
             @"detail" : @"Description",
             @"keyId" : @"KeyId",
             @"name" : @"Name",
             @"overwrite" : @"Overwrite",
             @"policies" : @"Policies",
             @"tags" : @"Tags",
             @"tier" : @"Tier",
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTag class]];
}

+ (NSValueTransformer *)tierJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSSsmParameterTierStandard);
        }
        if ([value caseInsensitiveCompare:@"Advanced"] == NSOrderedSame) {
            return @(AWSSsmParameterTierAdvanced);
        }
        if ([value caseInsensitiveCompare:@"Intelligent-Tiering"] == NSOrderedSame) {
            return @(AWSSsmParameterTierIntelligentTiering);
        }
        return @(AWSSsmParameterTierUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmParameterTierStandard:
                return @"Standard";
            case AWSSsmParameterTierAdvanced:
                return @"Advanced";
            case AWSSsmParameterTierIntelligentTiering:
                return @"Intelligent-Tiering";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"String"] == NSOrderedSame) {
            return @(AWSSsmParameterTypeString);
        }
        if ([value caseInsensitiveCompare:@"StringList"] == NSOrderedSame) {
            return @(AWSSsmParameterTypeStringList);
        }
        if ([value caseInsensitiveCompare:@"SecureString"] == NSOrderedSame) {
            return @(AWSSsmParameterTypeSecureString);
        }
        return @(AWSSsmParameterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmParameterTypeString:
                return @"String";
            case AWSSsmParameterTypeStringList:
                return @"StringList";
            case AWSSsmParameterTypeSecureString:
                return @"SecureString";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmPutParameterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tier" : @"Tier",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)tierJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSSsmParameterTierStandard);
        }
        if ([value caseInsensitiveCompare:@"Advanced"] == NSOrderedSame) {
            return @(AWSSsmParameterTierAdvanced);
        }
        if ([value caseInsensitiveCompare:@"Intelligent-Tiering"] == NSOrderedSame) {
            return @(AWSSsmParameterTierIntelligentTiering);
        }
        return @(AWSSsmParameterTierUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmParameterTierStandard:
                return @"Standard";
            case AWSSsmParameterTierAdvanced:
                return @"Advanced";
            case AWSSsmParameterTierIntelligentTiering:
                return @"Intelligent-Tiering";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmRegisterDefaultPatchBaselineRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             };
}

@end

@implementation AWSSsmRegisterDefaultPatchBaselineResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             };
}

@end

@implementation AWSSsmRegisterPatchBaselineForPatchGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             @"patchGroup" : @"PatchGroup",
             };
}

@end

@implementation AWSSsmRegisterPatchBaselineForPatchGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             @"patchGroup" : @"PatchGroup",
             };
}

@end

@implementation AWSSsmRegisterTargetWithMaintenanceWindowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"ownerInformation" : @"OwnerInformation",
             @"resourceType" : @"ResourceType",
             @"targets" : @"Targets",
             @"windowId" : @"WindowId",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSTANCE"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_GROUP"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowResourceTypeResourceGroup);
        }
        return @(AWSSsmMaintenanceWindowResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmMaintenanceWindowResourceTypeInstance:
                return @"INSTANCE";
            case AWSSsmMaintenanceWindowResourceTypeResourceGroup:
                return @"RESOURCE_GROUP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTarget class]];
}

@end

@implementation AWSSsmRegisterTargetWithMaintenanceWindowResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowTargetId" : @"WindowTargetId",
             };
}

@end

@implementation AWSSsmRegisterTaskWithMaintenanceWindowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"detail" : @"Description",
             @"loggingInfo" : @"LoggingInfo",
             @"maxConcurrency" : @"MaxConcurrency",
             @"maxErrors" : @"MaxErrors",
             @"name" : @"Name",
             @"priority" : @"Priority",
             @"serviceRoleArn" : @"ServiceRoleArn",
             @"targets" : @"Targets",
             @"taskArn" : @"TaskArn",
             @"taskInvocationParameters" : @"TaskInvocationParameters",
             @"taskParameters" : @"TaskParameters",
             @"taskType" : @"TaskType",
             @"windowId" : @"WindowId",
             };
}

+ (NSValueTransformer *)loggingInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmLoggingInfo class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTarget class]];
}

+ (NSValueTransformer *)taskInvocationParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmMaintenanceWindowTaskInvocationParameters class]];
}

+ (NSValueTransformer *)taskParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSsmMaintenanceWindowTaskParameterValueExpression class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)taskTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUN_COMMAND"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeRunCommand);
        }
        if ([value caseInsensitiveCompare:@"AUTOMATION"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"STEP_FUNCTIONS"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeStepFunctions);
        }
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSSsmMaintenanceWindowTaskTypeLambda);
        }
        return @(AWSSsmMaintenanceWindowTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmMaintenanceWindowTaskTypeRunCommand:
                return @"RUN_COMMAND";
            case AWSSsmMaintenanceWindowTaskTypeAutomation:
                return @"AUTOMATION";
            case AWSSsmMaintenanceWindowTaskTypeStepFunctions:
                return @"STEP_FUNCTIONS";
            case AWSSsmMaintenanceWindowTaskTypeLambda:
                return @"LAMBDA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmRegisterTaskWithMaintenanceWindowResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowTaskId" : @"WindowTaskId",
             };
}

@end

@implementation AWSSsmRelatedOpsItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"opsItemId" : @"OpsItemId",
             };
}

@end

@implementation AWSSsmRemoveTagsFromResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             @"tagKeys" : @"TagKeys",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Document"] == NSOrderedSame) {
            return @(AWSSsmResourceTypeForTaggingDocument);
        }
        if ([value caseInsensitiveCompare:@"ManagedInstance"] == NSOrderedSame) {
            return @(AWSSsmResourceTypeForTaggingManagedInstance);
        }
        if ([value caseInsensitiveCompare:@"MaintenanceWindow"] == NSOrderedSame) {
            return @(AWSSsmResourceTypeForTaggingMaintenanceWindow);
        }
        if ([value caseInsensitiveCompare:@"Parameter"] == NSOrderedSame) {
            return @(AWSSsmResourceTypeForTaggingParameter);
        }
        if ([value caseInsensitiveCompare:@"PatchBaseline"] == NSOrderedSame) {
            return @(AWSSsmResourceTypeForTaggingPatchBaseline);
        }
        if ([value caseInsensitiveCompare:@"OpsItem"] == NSOrderedSame) {
            return @(AWSSsmResourceTypeForTaggingOpsItem);
        }
        return @(AWSSsmResourceTypeForTaggingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmResourceTypeForTaggingDocument:
                return @"Document";
            case AWSSsmResourceTypeForTaggingManagedInstance:
                return @"ManagedInstance";
            case AWSSsmResourceTypeForTaggingMaintenanceWindow:
                return @"MaintenanceWindow";
            case AWSSsmResourceTypeForTaggingParameter:
                return @"Parameter";
            case AWSSsmResourceTypeForTaggingPatchBaseline:
                return @"PatchBaseline";
            case AWSSsmResourceTypeForTaggingOpsItem:
                return @"OpsItem";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmRemoveTagsFromResourceResult

@end

@implementation AWSSsmResetServiceSettingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"settingId" : @"SettingId",
             };
}

@end

@implementation AWSSsmResetServiceSettingResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceSetting" : @"ServiceSetting",
             };
}

+ (NSValueTransformer *)serviceSettingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmServiceSetting class]];
}

@end

@implementation AWSSsmResolvedTargets

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameterValues" : @"ParameterValues",
             @"truncated" : @"Truncated",
             };
}

@end

@implementation AWSSsmResourceComplianceSummaryItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"complianceType" : @"ComplianceType",
             @"compliantSummary" : @"CompliantSummary",
             @"executionSummary" : @"ExecutionSummary",
             @"nonCompliantSummary" : @"NonCompliantSummary",
             @"overallSeverity" : @"OverallSeverity",
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)compliantSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmCompliantSummary class]];
}

+ (NSValueTransformer *)executionSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmComplianceExecutionSummary class]];
}

+ (NSValueTransformer *)nonCompliantSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmNonCompliantSummary class]];
}

+ (NSValueTransformer *)overallSeverityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSsmComplianceSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSsmComplianceSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSsmComplianceSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSsmComplianceSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSsmComplianceSeverityInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSsmComplianceSeverityUnspecified);
        }
        return @(AWSSsmComplianceSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmComplianceSeverityCritical:
                return @"CRITICAL";
            case AWSSsmComplianceSeverityHigh:
                return @"HIGH";
            case AWSSsmComplianceSeverityMedium:
                return @"MEDIUM";
            case AWSSsmComplianceSeverityLow:
                return @"LOW";
            case AWSSsmComplianceSeverityInformational:
                return @"INFORMATIONAL";
            case AWSSsmComplianceSeverityUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLIANT"] == NSOrderedSame) {
            return @(AWSSsmComplianceStatusCompliant);
        }
        if ([value caseInsensitiveCompare:@"NON_COMPLIANT"] == NSOrderedSame) {
            return @(AWSSsmComplianceStatusNonCompliant);
        }
        return @(AWSSsmComplianceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmComplianceStatusCompliant:
                return @"COMPLIANT";
            case AWSSsmComplianceStatusNonCompliant:
                return @"NON_COMPLIANT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmResourceDataSyncAwsOrganizationsSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"organizationSourceType" : @"OrganizationSourceType",
             @"organizationalUnits" : @"OrganizationalUnits",
             };
}

+ (NSValueTransformer *)organizationalUnitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmResourceDataSyncOrganizationalUnit class]];
}

@end

@implementation AWSSsmResourceDataSyncDestinationDataSharing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationDataSharingType" : @"DestinationDataSharingType",
             };
}

@end

@implementation AWSSsmResourceDataSyncItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastStatus" : @"LastStatus",
             @"lastSuccessfulSyncTime" : @"LastSuccessfulSyncTime",
             @"lastSyncStatusMessage" : @"LastSyncStatusMessage",
             @"lastSyncTime" : @"LastSyncTime",
             @"s3Destination" : @"S3Destination",
             @"syncCreatedTime" : @"SyncCreatedTime",
             @"syncLastModifiedTime" : @"SyncLastModifiedTime",
             @"syncName" : @"SyncName",
             @"syncSource" : @"SyncSource",
             @"syncType" : @"SyncType",
             };
}

+ (NSValueTransformer *)lastStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Successful"] == NSOrderedSame) {
            return @(AWSSsmLastResourceDataSyncStatusSuccessful);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSsmLastResourceDataSyncStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSsmLastResourceDataSyncStatusInProgress);
        }
        return @(AWSSsmLastResourceDataSyncStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmLastResourceDataSyncStatusSuccessful:
                return @"Successful";
            case AWSSsmLastResourceDataSyncStatusFailed:
                return @"Failed";
            case AWSSsmLastResourceDataSyncStatusInProgress:
                return @"InProgress";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastSuccessfulSyncTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastSyncTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)s3DestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmResourceDataSyncS3Destination class]];
}

+ (NSValueTransformer *)syncCreatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)syncLastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)syncSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmResourceDataSyncSourceWithState class]];
}

@end

@implementation AWSSsmResourceDataSyncOrganizationalUnit

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"organizationalUnitId" : @"OrganizationalUnitId",
             };
}

@end

@implementation AWSSsmResourceDataSyncS3Destination

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"AWSKMSKeyARN" : @"AWSKMSKeyARN",
             @"bucketName" : @"BucketName",
             @"destinationDataSharing" : @"DestinationDataSharing",
             @"prefix" : @"Prefix",
             @"region" : @"Region",
             @"syncFormat" : @"SyncFormat",
             };
}

+ (NSValueTransformer *)destinationDataSharingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmResourceDataSyncDestinationDataSharing class]];
}

+ (NSValueTransformer *)syncFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"JsonSerDe"] == NSOrderedSame) {
            return @(AWSSsmResourceDataSyncS3FormatJsonSerDe);
        }
        return @(AWSSsmResourceDataSyncS3FormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmResourceDataSyncS3FormatJsonSerDe:
                return @"JsonSerDe";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmResourceDataSyncSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsOrganizationsSource" : @"AwsOrganizationsSource",
             @"includeFutureRegions" : @"IncludeFutureRegions",
             @"sourceRegions" : @"SourceRegions",
             @"sourceType" : @"SourceType",
             };
}

+ (NSValueTransformer *)awsOrganizationsSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmResourceDataSyncAwsOrganizationsSource class]];
}

@end

@implementation AWSSsmResourceDataSyncSourceWithState

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsOrganizationsSource" : @"AwsOrganizationsSource",
             @"includeFutureRegions" : @"IncludeFutureRegions",
             @"sourceRegions" : @"SourceRegions",
             @"sourceType" : @"SourceType",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)awsOrganizationsSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmResourceDataSyncAwsOrganizationsSource class]];
}

@end

@implementation AWSSsmResultAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"typeName" : @"TypeName",
             };
}

@end

@implementation AWSSsmResumeSessionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sessionId" : @"SessionId",
             };
}

@end

@implementation AWSSsmResumeSessionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sessionId" : @"SessionId",
             @"streamUrl" : @"StreamUrl",
             @"tokenValue" : @"TokenValue",
             };
}

@end

@implementation AWSSsmS3OutputLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputS3BucketName" : @"OutputS3BucketName",
             @"outputS3KeyPrefix" : @"OutputS3KeyPrefix",
             @"outputS3Region" : @"OutputS3Region",
             };
}

@end

@implementation AWSSsmS3OutputUrl

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputUrl" : @"OutputUrl",
             };
}

@end

@implementation AWSSsmScheduledWindowExecution

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"executionTime" : @"ExecutionTime",
             @"name" : @"Name",
             @"windowId" : @"WindowId",
             };
}

@end

@implementation AWSSsmSendAutomationSignalRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automationExecutionId" : @"AutomationExecutionId",
             @"payload" : @"Payload",
             @"signalType" : @"SignalType",
             };
}

+ (NSValueTransformer *)signalTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Approve"] == NSOrderedSame) {
            return @(AWSSsmSignalTypeApprove);
        }
        if ([value caseInsensitiveCompare:@"Reject"] == NSOrderedSame) {
            return @(AWSSsmSignalTypeReject);
        }
        if ([value caseInsensitiveCompare:@"StartStep"] == NSOrderedSame) {
            return @(AWSSsmSignalTypeStartStep);
        }
        if ([value caseInsensitiveCompare:@"StopStep"] == NSOrderedSame) {
            return @(AWSSsmSignalTypeStopStep);
        }
        if ([value caseInsensitiveCompare:@"Resume"] == NSOrderedSame) {
            return @(AWSSsmSignalTypeResume);
        }
        return @(AWSSsmSignalTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmSignalTypeApprove:
                return @"Approve";
            case AWSSsmSignalTypeReject:
                return @"Reject";
            case AWSSsmSignalTypeStartStep:
                return @"StartStep";
            case AWSSsmSignalTypeStopStep:
                return @"StopStep";
            case AWSSsmSignalTypeResume:
                return @"Resume";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmSendAutomationSignalResult

@end

@implementation AWSSsmSendCommandRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchOutputConfig" : @"CloudWatchOutputConfig",
             @"comment" : @"Comment",
             @"documentHash" : @"DocumentHash",
             @"documentHashType" : @"DocumentHashType",
             @"documentName" : @"DocumentName",
             @"documentVersion" : @"DocumentVersion",
             @"instanceIds" : @"InstanceIds",
             @"maxConcurrency" : @"MaxConcurrency",
             @"maxErrors" : @"MaxErrors",
             @"notificationConfig" : @"NotificationConfig",
             @"outputS3BucketName" : @"OutputS3BucketName",
             @"outputS3KeyPrefix" : @"OutputS3KeyPrefix",
             @"outputS3Region" : @"OutputS3Region",
             @"parameters" : @"Parameters",
             @"serviceRoleArn" : @"ServiceRoleArn",
             @"targets" : @"Targets",
             @"timeoutSeconds" : @"TimeoutSeconds",
             };
}

+ (NSValueTransformer *)cloudWatchOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmCloudWatchOutputConfig class]];
}

+ (NSValueTransformer *)documentHashTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Sha256"] == NSOrderedSame) {
            return @(AWSSsmDocumentHashTypeSha256);
        }
        if ([value caseInsensitiveCompare:@"Sha1"] == NSOrderedSame) {
            return @(AWSSsmDocumentHashTypeSha1);
        }
        return @(AWSSsmDocumentHashTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmDocumentHashTypeSha256:
                return @"Sha256";
            case AWSSsmDocumentHashTypeSha1:
                return @"Sha1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)notificationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmNotificationConfig class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTarget class]];
}

@end

@implementation AWSSsmSendCommandResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"command" : @"Command",
             };
}

+ (NSValueTransformer *)commandJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmCommand class]];
}

@end

@implementation AWSSsmServiceSetting

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"lastModifiedUser" : @"LastModifiedUser",
             @"settingId" : @"SettingId",
             @"settingValue" : @"SettingValue",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)lastModifiedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSsmSession

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"details" : @"Details",
             @"documentName" : @"DocumentName",
             @"endDate" : @"EndDate",
             @"outputUrl" : @"OutputUrl",
             @"owner" : @"Owner",
             @"sessionId" : @"SessionId",
             @"startDate" : @"StartDate",
             @"status" : @"Status",
             @"target" : @"Target",
             };
}

+ (NSValueTransformer *)endDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)outputUrlJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmSessionManagerOutputUrl class]];
}

+ (NSValueTransformer *)startDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Connected"] == NSOrderedSame) {
            return @(AWSSsmSessionStatusConnected);
        }
        if ([value caseInsensitiveCompare:@"Connecting"] == NSOrderedSame) {
            return @(AWSSsmSessionStatusConnecting);
        }
        if ([value caseInsensitiveCompare:@"Disconnected"] == NSOrderedSame) {
            return @(AWSSsmSessionStatusDisconnected);
        }
        if ([value caseInsensitiveCompare:@"Terminated"] == NSOrderedSame) {
            return @(AWSSsmSessionStatusTerminated);
        }
        if ([value caseInsensitiveCompare:@"Terminating"] == NSOrderedSame) {
            return @(AWSSsmSessionStatusTerminating);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSsmSessionStatusFailed);
        }
        return @(AWSSsmSessionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmSessionStatusConnected:
                return @"Connected";
            case AWSSsmSessionStatusConnecting:
                return @"Connecting";
            case AWSSsmSessionStatusDisconnected:
                return @"Disconnected";
            case AWSSsmSessionStatusTerminated:
                return @"Terminated";
            case AWSSsmSessionStatusTerminating:
                return @"Terminating";
            case AWSSsmSessionStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmSessionFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InvokedAfter"] == NSOrderedSame) {
            return @(AWSSsmSessionFilterKeyInvokedAfter);
        }
        if ([value caseInsensitiveCompare:@"InvokedBefore"] == NSOrderedSame) {
            return @(AWSSsmSessionFilterKeyInvokedBefore);
        }
        if ([value caseInsensitiveCompare:@"Target"] == NSOrderedSame) {
            return @(AWSSsmSessionFilterKeyTarget);
        }
        if ([value caseInsensitiveCompare:@"Owner"] == NSOrderedSame) {
            return @(AWSSsmSessionFilterKeyOwner);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSsmSessionFilterKeyStatus);
        }
        return @(AWSSsmSessionFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmSessionFilterKeyInvokedAfter:
                return @"InvokedAfter";
            case AWSSsmSessionFilterKeyInvokedBefore:
                return @"InvokedBefore";
            case AWSSsmSessionFilterKeyTarget:
                return @"Target";
            case AWSSsmSessionFilterKeyOwner:
                return @"Owner";
            case AWSSsmSessionFilterKeyStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmSessionManagerOutputUrl

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchOutputUrl" : @"CloudWatchOutputUrl",
             @"s3OutputUrl" : @"S3OutputUrl",
             };
}

@end

@implementation AWSSsmSeveritySummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"criticalCount" : @"CriticalCount",
             @"highCount" : @"HighCount",
             @"informationalCount" : @"InformationalCount",
             @"lowCount" : @"LowCount",
             @"mediumCount" : @"MediumCount",
             @"unspecifiedCount" : @"UnspecifiedCount",
             };
}

@end

@implementation AWSSsmStartAssociationsOnceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationIds" : @"AssociationIds",
             };
}

@end

@implementation AWSSsmStartAssociationsOnceResult

@end

@implementation AWSSsmStartAutomationExecutionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"documentName" : @"DocumentName",
             @"documentVersion" : @"DocumentVersion",
             @"maxConcurrency" : @"MaxConcurrency",
             @"maxErrors" : @"MaxErrors",
             @"mode" : @"Mode",
             @"parameters" : @"Parameters",
             @"tags" : @"Tags",
             @"targetLocations" : @"TargetLocations",
             @"targetMaps" : @"TargetMaps",
             @"targetParameterName" : @"TargetParameterName",
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Auto"] == NSOrderedSame) {
            return @(AWSSsmExecutionModeAuto);
        }
        if ([value caseInsensitiveCompare:@"Interactive"] == NSOrderedSame) {
            return @(AWSSsmExecutionModeInteractive);
        }
        return @(AWSSsmExecutionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmExecutionModeAuto:
                return @"Auto";
            case AWSSsmExecutionModeInteractive:
                return @"Interactive";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTag class]];
}

+ (NSValueTransformer *)targetLocationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTargetLocation class]];
}

+ (NSValueTransformer *)targetMapsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[java.util.List<NSString> class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTarget class]];
}

@end

@implementation AWSSsmStartAutomationExecutionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automationExecutionId" : @"AutomationExecutionId",
             };
}

@end

@implementation AWSSsmStartSessionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentName" : @"DocumentName",
             @"parameters" : @"Parameters",
             @"target" : @"Target",
             };
}

@end

@implementation AWSSsmStartSessionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sessionId" : @"SessionId",
             @"streamUrl" : @"StreamUrl",
             @"tokenValue" : @"TokenValue",
             };
}

@end

@implementation AWSSsmStepExecution

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"executionEndTime" : @"ExecutionEndTime",
             @"executionStartTime" : @"ExecutionStartTime",
             @"failureDetails" : @"FailureDetails",
             @"failureMessage" : @"FailureMessage",
             @"inputs" : @"Inputs",
             @"isCritical" : @"IsCritical",
             @"isEnd" : @"IsEnd",
             @"maxAttempts" : @"MaxAttempts",
             @"nextStep" : @"NextStep",
             @"onFailure" : @"OnFailure",
             @"outputs" : @"Outputs",
             @"overriddenParameters" : @"OverriddenParameters",
             @"response" : @"Response",
             @"responseCode" : @"ResponseCode",
             @"stepExecutionId" : @"StepExecutionId",
             @"stepName" : @"StepName",
             @"stepStatus" : @"StepStatus",
             @"targetLocation" : @"TargetLocation",
             @"targets" : @"Targets",
             @"timeoutSeconds" : @"TimeoutSeconds",
             @"validNextSteps" : @"ValidNextSteps",
             };
}

+ (NSValueTransformer *)executionEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)executionStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)failureDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmFailureDetails class]];
}

+ (NSValueTransformer *)stepStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Waiting"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionStatusWaiting);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"TimedOut"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"Cancelling"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSsmAutomationExecutionStatusFailed);
        }
        return @(AWSSsmAutomationExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmAutomationExecutionStatusPending:
                return @"Pending";
            case AWSSsmAutomationExecutionStatusInProgress:
                return @"InProgress";
            case AWSSsmAutomationExecutionStatusWaiting:
                return @"Waiting";
            case AWSSsmAutomationExecutionStatusSuccess:
                return @"Success";
            case AWSSsmAutomationExecutionStatusTimedOut:
                return @"TimedOut";
            case AWSSsmAutomationExecutionStatusCancelling:
                return @"Cancelling";
            case AWSSsmAutomationExecutionStatusCancelled:
                return @"Cancelled";
            case AWSSsmAutomationExecutionStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmTargetLocation class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTarget class]];
}

@end

@implementation AWSSsmStepExecutionFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"StartTimeBefore"] == NSOrderedSame) {
            return @(AWSSsmStepExecutionFilterKeyStartTimeBefore);
        }
        if ([value caseInsensitiveCompare:@"StartTimeAfter"] == NSOrderedSame) {
            return @(AWSSsmStepExecutionFilterKeyStartTimeAfter);
        }
        if ([value caseInsensitiveCompare:@"StepExecutionStatus"] == NSOrderedSame) {
            return @(AWSSsmStepExecutionFilterKeyStepExecutionStatus);
        }
        if ([value caseInsensitiveCompare:@"StepExecutionId"] == NSOrderedSame) {
            return @(AWSSsmStepExecutionFilterKeyStepExecutionId);
        }
        if ([value caseInsensitiveCompare:@"StepName"] == NSOrderedSame) {
            return @(AWSSsmStepExecutionFilterKeyStepName);
        }
        if ([value caseInsensitiveCompare:@"Action"] == NSOrderedSame) {
            return @(AWSSsmStepExecutionFilterKeyAction);
        }
        return @(AWSSsmStepExecutionFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmStepExecutionFilterKeyStartTimeBefore:
                return @"StartTimeBefore";
            case AWSSsmStepExecutionFilterKeyStartTimeAfter:
                return @"StartTimeAfter";
            case AWSSsmStepExecutionFilterKeyStepExecutionStatus:
                return @"StepExecutionStatus";
            case AWSSsmStepExecutionFilterKeyStepExecutionId:
                return @"StepExecutionId";
            case AWSSsmStepExecutionFilterKeyStepName:
                return @"StepName";
            case AWSSsmStepExecutionFilterKeyAction:
                return @"Action";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmStopAutomationExecutionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automationExecutionId" : @"AutomationExecutionId",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSSsmStopTypeComplete);
        }
        if ([value caseInsensitiveCompare:@"Cancel"] == NSOrderedSame) {
            return @(AWSSsmStopTypeCancel);
        }
        return @(AWSSsmStopTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmStopTypeComplete:
                return @"Complete";
            case AWSSsmStopTypeCancel:
                return @"Cancel";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmStopAutomationExecutionResult

@end

@implementation AWSSsmTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSSsmTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

@end

@implementation AWSSsmTargetLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accounts" : @"Accounts",
             @"executionRoleName" : @"ExecutionRoleName",
             @"regions" : @"Regions",
             @"targetLocationMaxConcurrency" : @"TargetLocationMaxConcurrency",
             @"targetLocationMaxErrors" : @"TargetLocationMaxErrors",
             };
}

@end

@implementation AWSSsmTerminateSessionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sessionId" : @"SessionId",
             };
}

@end

@implementation AWSSsmTerminateSessionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sessionId" : @"SessionId",
             };
}

@end

@implementation AWSSsmUpdateAssociationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyOnlyAtCronInterval" : @"ApplyOnlyAtCronInterval",
             @"associationId" : @"AssociationId",
             @"associationName" : @"AssociationName",
             @"associationVersion" : @"AssociationVersion",
             @"automationTargetParameterName" : @"AutomationTargetParameterName",
             @"complianceSeverity" : @"ComplianceSeverity",
             @"documentVersion" : @"DocumentVersion",
             @"maxConcurrency" : @"MaxConcurrency",
             @"maxErrors" : @"MaxErrors",
             @"name" : @"Name",
             @"outputLocation" : @"OutputLocation",
             @"parameters" : @"Parameters",
             @"scheduleExpression" : @"ScheduleExpression",
             @"syncCompliance" : @"SyncCompliance",
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)complianceSeverityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSsmAssociationComplianceSeverityUnspecified);
        }
        return @(AWSSsmAssociationComplianceSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmAssociationComplianceSeverityCritical:
                return @"CRITICAL";
            case AWSSsmAssociationComplianceSeverityHigh:
                return @"HIGH";
            case AWSSsmAssociationComplianceSeverityMedium:
                return @"MEDIUM";
            case AWSSsmAssociationComplianceSeverityLow:
                return @"LOW";
            case AWSSsmAssociationComplianceSeverityUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmInstanceAssociationOutputLocation class]];
}

+ (NSValueTransformer *)syncComplianceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSSsmAssociationSyncComplianceAuto);
        }
        if ([value caseInsensitiveCompare:@"MANUAL"] == NSOrderedSame) {
            return @(AWSSsmAssociationSyncComplianceManual);
        }
        return @(AWSSsmAssociationSyncComplianceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmAssociationSyncComplianceAuto:
                return @"AUTO";
            case AWSSsmAssociationSyncComplianceManual:
                return @"MANUAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTarget class]];
}

@end

@implementation AWSSsmUpdateAssociationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationDescription" : @"AssociationDescription",
             };
}

+ (NSValueTransformer *)associationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmAssociationDescription class]];
}

@end

@implementation AWSSsmUpdateAssociationStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationStatus" : @"AssociationStatus",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)associationStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmAssociationStatus class]];
}

@end

@implementation AWSSsmUpdateAssociationStatusResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationDescription" : @"AssociationDescription",
             };
}

+ (NSValueTransformer *)associationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmAssociationDescription class]];
}

@end

@implementation AWSSsmUpdateDocumentDefaultVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentVersion" : @"DocumentVersion",
             @"name" : @"Name",
             };
}

@end

@implementation AWSSsmUpdateDocumentDefaultVersionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             };
}

+ (NSValueTransformer *)detailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmDocumentDefaultVersionDescription class]];
}

@end

@implementation AWSSsmUpdateDocumentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachments" : @"Attachments",
             @"content" : @"Content",
             @"documentFormat" : @"DocumentFormat",
             @"documentVersion" : @"DocumentVersion",
             @"name" : @"Name",
             @"targetType" : @"TargetType",
             @"versionName" : @"VersionName",
             };
}

+ (NSValueTransformer *)attachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmAttachmentsSource class]];
}

+ (NSValueTransformer *)documentFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"YAML"] == NSOrderedSame) {
            return @(AWSSsmDocumentFormatYaml);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSSsmDocumentFormatJson);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSSsmDocumentFormatText);
        }
        return @(AWSSsmDocumentFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmDocumentFormatYaml:
                return @"YAML";
            case AWSSsmDocumentFormatJson:
                return @"JSON";
            case AWSSsmDocumentFormatText:
                return @"TEXT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmUpdateDocumentResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentDescription" : @"DocumentDescription",
             };
}

+ (NSValueTransformer *)documentDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmDocumentDescription class]];
}

@end

@implementation AWSSsmUpdateMaintenanceWindowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowUnassociatedTargets" : @"AllowUnassociatedTargets",
             @"cutoff" : @"Cutoff",
             @"detail" : @"Description",
             @"duration" : @"Duration",
             @"enabled" : @"Enabled",
             @"endDate" : @"EndDate",
             @"name" : @"Name",
             @"replace" : @"Replace",
             @"schedule" : @"Schedule",
             @"scheduleOffset" : @"ScheduleOffset",
             @"scheduleTimezone" : @"ScheduleTimezone",
             @"startDate" : @"StartDate",
             @"windowId" : @"WindowId",
             };
}

@end

@implementation AWSSsmUpdateMaintenanceWindowResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowUnassociatedTargets" : @"AllowUnassociatedTargets",
             @"cutoff" : @"Cutoff",
             @"detail" : @"Description",
             @"duration" : @"Duration",
             @"enabled" : @"Enabled",
             @"endDate" : @"EndDate",
             @"name" : @"Name",
             @"schedule" : @"Schedule",
             @"scheduleOffset" : @"ScheduleOffset",
             @"scheduleTimezone" : @"ScheduleTimezone",
             @"startDate" : @"StartDate",
             @"windowId" : @"WindowId",
             };
}

@end

@implementation AWSSsmUpdateMaintenanceWindowTargetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"name" : @"Name",
             @"ownerInformation" : @"OwnerInformation",
             @"replace" : @"Replace",
             @"targets" : @"Targets",
             @"windowId" : @"WindowId",
             @"windowTargetId" : @"WindowTargetId",
             };
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTarget class]];
}

@end

@implementation AWSSsmUpdateMaintenanceWindowTargetResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"name" : @"Name",
             @"ownerInformation" : @"OwnerInformation",
             @"targets" : @"Targets",
             @"windowId" : @"WindowId",
             @"windowTargetId" : @"WindowTargetId",
             };
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTarget class]];
}

@end

@implementation AWSSsmUpdateMaintenanceWindowTaskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"loggingInfo" : @"LoggingInfo",
             @"maxConcurrency" : @"MaxConcurrency",
             @"maxErrors" : @"MaxErrors",
             @"name" : @"Name",
             @"priority" : @"Priority",
             @"replace" : @"Replace",
             @"serviceRoleArn" : @"ServiceRoleArn",
             @"targets" : @"Targets",
             @"taskArn" : @"TaskArn",
             @"taskInvocationParameters" : @"TaskInvocationParameters",
             @"taskParameters" : @"TaskParameters",
             @"windowId" : @"WindowId",
             @"windowTaskId" : @"WindowTaskId",
             };
}

+ (NSValueTransformer *)loggingInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmLoggingInfo class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTarget class]];
}

+ (NSValueTransformer *)taskInvocationParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmMaintenanceWindowTaskInvocationParameters class]];
}

+ (NSValueTransformer *)taskParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSsmMaintenanceWindowTaskParameterValueExpression class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSSsmUpdateMaintenanceWindowTaskResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"loggingInfo" : @"LoggingInfo",
             @"maxConcurrency" : @"MaxConcurrency",
             @"maxErrors" : @"MaxErrors",
             @"name" : @"Name",
             @"priority" : @"Priority",
             @"serviceRoleArn" : @"ServiceRoleArn",
             @"targets" : @"Targets",
             @"taskArn" : @"TaskArn",
             @"taskInvocationParameters" : @"TaskInvocationParameters",
             @"taskParameters" : @"TaskParameters",
             @"windowId" : @"WindowId",
             @"windowTaskId" : @"WindowTaskId",
             };
}

+ (NSValueTransformer *)loggingInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmLoggingInfo class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmTarget class]];
}

+ (NSValueTransformer *)taskInvocationParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmMaintenanceWindowTaskInvocationParameters class]];
}

+ (NSValueTransformer *)taskParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSsmMaintenanceWindowTaskParameterValueExpression class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSSsmUpdateManagedInstanceRoleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"iamRole" : @"IamRole",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSSsmUpdateManagedInstanceRoleResult

@end

@implementation AWSSsmUpdateOpsItemRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"category" : @"Category",
             @"detail" : @"Description",
             @"notifications" : @"Notifications",
             @"operationalData" : @"OperationalData",
             @"operationalDataToDelete" : @"OperationalDataToDelete",
             @"opsItemId" : @"OpsItemId",
             @"priority" : @"Priority",
             @"relatedOpsItems" : @"RelatedOpsItems",
             @"severity" : @"Severity",
             @"status" : @"Status",
             @"title" : @"Title",
             };
}

+ (NSValueTransformer *)notificationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmOpsItemNotification class]];
}

+ (NSValueTransformer *)operationalDataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSsmOpsItemDataValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)relatedOpsItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmRelatedOpsItem class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Open"] == NSOrderedSame) {
            return @(AWSSsmOpsItemStatusOpen);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSsmOpsItemStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Resolved"] == NSOrderedSame) {
            return @(AWSSsmOpsItemStatusResolved);
        }
        return @(AWSSsmOpsItemStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmOpsItemStatusOpen:
                return @"Open";
            case AWSSsmOpsItemStatusInProgress:
                return @"InProgress";
            case AWSSsmOpsItemStatusResolved:
                return @"Resolved";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSsmUpdateOpsItemResponse

@end

@implementation AWSSsmUpdatePatchBaselineRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRules" : @"ApprovalRules",
             @"approvedPatches" : @"ApprovedPatches",
             @"approvedPatchesComplianceLevel" : @"ApprovedPatchesComplianceLevel",
             @"approvedPatchesEnableNonSecurity" : @"ApprovedPatchesEnableNonSecurity",
             @"baselineId" : @"BaselineId",
             @"detail" : @"Description",
             @"globalFilters" : @"GlobalFilters",
             @"name" : @"Name",
             @"rejectedPatches" : @"RejectedPatches",
             @"rejectedPatchesAction" : @"RejectedPatchesAction",
             @"replace" : @"Replace",
             @"sources" : @"Sources",
             };
}

+ (NSValueTransformer *)approvalRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmPatchRuleGroup class]];
}

+ (NSValueTransformer *)approvedPatchesComplianceLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelUnspecified);
        }
        return @(AWSSsmPatchComplianceLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmPatchComplianceLevelCritical:
                return @"CRITICAL";
            case AWSSsmPatchComplianceLevelHigh:
                return @"HIGH";
            case AWSSsmPatchComplianceLevelMedium:
                return @"MEDIUM";
            case AWSSsmPatchComplianceLevelLow:
                return @"LOW";
            case AWSSsmPatchComplianceLevelInformational:
                return @"INFORMATIONAL";
            case AWSSsmPatchComplianceLevelUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)globalFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmPatchFilterGroup class]];
}

+ (NSValueTransformer *)rejectedPatchesActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALLOW_AS_DEPENDENCY"] == NSOrderedSame) {
            return @(AWSSsmPatchActionAllowAsDependency);
        }
        if ([value caseInsensitiveCompare:@"BLOCK"] == NSOrderedSame) {
            return @(AWSSsmPatchActionBlock);
        }
        return @(AWSSsmPatchActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmPatchActionAllowAsDependency:
                return @"ALLOW_AS_DEPENDENCY";
            case AWSSsmPatchActionBlock:
                return @"BLOCK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmPatchSource class]];
}

@end

@implementation AWSSsmUpdatePatchBaselineResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRules" : @"ApprovalRules",
             @"approvedPatches" : @"ApprovedPatches",
             @"approvedPatchesComplianceLevel" : @"ApprovedPatchesComplianceLevel",
             @"approvedPatchesEnableNonSecurity" : @"ApprovedPatchesEnableNonSecurity",
             @"baselineId" : @"BaselineId",
             @"createdDate" : @"CreatedDate",
             @"detail" : @"Description",
             @"globalFilters" : @"GlobalFilters",
             @"modifiedDate" : @"ModifiedDate",
             @"name" : @"Name",
             @"operatingSystem" : @"OperatingSystem",
             @"rejectedPatches" : @"RejectedPatches",
             @"rejectedPatchesAction" : @"RejectedPatchesAction",
             @"sources" : @"Sources",
             };
}

+ (NSValueTransformer *)approvalRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmPatchRuleGroup class]];
}

+ (NSValueTransformer *)approvedPatchesComplianceLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSsmPatchComplianceLevelUnspecified);
        }
        return @(AWSSsmPatchComplianceLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmPatchComplianceLevelCritical:
                return @"CRITICAL";
            case AWSSsmPatchComplianceLevelHigh:
                return @"HIGH";
            case AWSSsmPatchComplianceLevelMedium:
                return @"MEDIUM";
            case AWSSsmPatchComplianceLevelLow:
                return @"LOW";
            case AWSSsmPatchComplianceLevelInformational:
                return @"INFORMATIONAL";
            case AWSSsmPatchComplianceLevelUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)globalFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmPatchFilterGroup class]];
}

+ (NSValueTransformer *)modifiedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)operatingSystemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WINDOWS"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemCentos);
        }
        if ([value caseInsensitiveCompare:@"ORACLE_LINUX"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemOracleLinux);
        }
        if ([value caseInsensitiveCompare:@"DEBIAN"] == NSOrderedSame) {
            return @(AWSSsmOperatingSystemDebian);
        }
        return @(AWSSsmOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSsmOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSsmOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSsmOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSsmOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSsmOperatingSystemSuse:
                return @"SUSE";
            case AWSSsmOperatingSystemCentos:
                return @"CENTOS";
            case AWSSsmOperatingSystemOracleLinux:
                return @"ORACLE_LINUX";
            case AWSSsmOperatingSystemDebian:
                return @"DEBIAN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rejectedPatchesActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALLOW_AS_DEPENDENCY"] == NSOrderedSame) {
            return @(AWSSsmPatchActionAllowAsDependency);
        }
        if ([value caseInsensitiveCompare:@"BLOCK"] == NSOrderedSame) {
            return @(AWSSsmPatchActionBlock);
        }
        return @(AWSSsmPatchActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSsmPatchActionAllowAsDependency:
                return @"ALLOW_AS_DEPENDENCY";
            case AWSSsmPatchActionBlock:
                return @"BLOCK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSsmPatchSource class]];
}

@end

@implementation AWSSsmUpdateResourceDataSyncRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"syncName" : @"SyncName",
             @"syncSource" : @"SyncSource",
             @"syncType" : @"SyncType",
             };
}

+ (NSValueTransformer *)syncSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSsmResourceDataSyncSource class]];
}

@end

@implementation AWSSsmUpdateResourceDataSyncResult

@end

@implementation AWSSsmUpdateServiceSettingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"settingId" : @"SettingId",
             @"settingValue" : @"SettingValue",
             };
}

@end

@implementation AWSSsmUpdateServiceSettingResult

@end
