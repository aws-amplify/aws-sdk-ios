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

#import "AWSSimpleSystemsManagerModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSSimpleSystemsManagerErrorDomain = @"com.amazonaws.AWSSimpleSystemsManagerErrorDomain";

@implementation AWSSimpleSystemsManagerAccountSharingInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"sharedDocumentVersion" : @"SharedDocumentVersion",
             };
}

@end

@implementation AWSSimpleSystemsManagerActivation

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTag class]];
}

@end

@implementation AWSSimpleSystemsManagerAddTagsToResourceRequest

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
            return @(AWSSimpleSystemsManagerResourceTypeForTaggingDocument);
        }
        if ([value caseInsensitiveCompare:@"ManagedInstance"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerResourceTypeForTaggingManagedInstance);
        }
        if ([value caseInsensitiveCompare:@"MaintenanceWindow"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerResourceTypeForTaggingMaintenanceWindow);
        }
        if ([value caseInsensitiveCompare:@"Parameter"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerResourceTypeForTaggingParameter);
        }
        if ([value caseInsensitiveCompare:@"PatchBaseline"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerResourceTypeForTaggingPatchBaseline);
        }
        if ([value caseInsensitiveCompare:@"OpsItem"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerResourceTypeForTaggingOpsItem);
        }
        return @(AWSSimpleSystemsManagerResourceTypeForTaggingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerResourceTypeForTaggingDocument:
                return @"Document";
            case AWSSimpleSystemsManagerResourceTypeForTaggingManagedInstance:
                return @"ManagedInstance";
            case AWSSimpleSystemsManagerResourceTypeForTaggingMaintenanceWindow:
                return @"MaintenanceWindow";
            case AWSSimpleSystemsManagerResourceTypeForTaggingParameter:
                return @"Parameter";
            case AWSSimpleSystemsManagerResourceTypeForTaggingPatchBaseline:
                return @"PatchBaseline";
            case AWSSimpleSystemsManagerResourceTypeForTaggingOpsItem:
                return @"OpsItem";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTag class]];
}

@end

@implementation AWSSimpleSystemsManagerAddTagsToResourceResult

@end

@implementation AWSSimpleSystemsManagerAssociation

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerAssociationOverview class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTarget class]];
}

@end

@implementation AWSSimpleSystemsManagerAssociationDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
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
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityUnspecified);
        }
        return @(AWSSimpleSystemsManagerAssociationComplianceSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerAssociationComplianceSeverityCritical:
                return @"CRITICAL";
            case AWSSimpleSystemsManagerAssociationComplianceSeverityHigh:
                return @"HIGH";
            case AWSSimpleSystemsManagerAssociationComplianceSeverityMedium:
                return @"MEDIUM";
            case AWSSimpleSystemsManagerAssociationComplianceSeverityLow:
                return @"LOW";
            case AWSSimpleSystemsManagerAssociationComplianceSeverityUnspecified:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerInstanceAssociationOutputLocation class]];
}

+ (NSValueTransformer *)overviewJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerAssociationOverview class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerAssociationStatus class]];
}

+ (NSValueTransformer *)syncComplianceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationSyncComplianceAuto);
        }
        if ([value caseInsensitiveCompare:@"MANUAL"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationSyncComplianceManual);
        }
        return @(AWSSimpleSystemsManagerAssociationSyncComplianceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerAssociationSyncComplianceAuto:
                return @"AUTO";
            case AWSSimpleSystemsManagerAssociationSyncComplianceManual:
                return @"MANUAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTarget class]];
}

@end

@implementation AWSSimpleSystemsManagerAssociationExecution

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

@implementation AWSSimpleSystemsManagerAssociationExecutionFilter

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
            return @(AWSSimpleSystemsManagerAssociationExecutionFilterKeyExecutionId);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationExecutionFilterKeyStatus);
        }
        if ([value caseInsensitiveCompare:@"CreatedTime"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationExecutionFilterKeyCreatedTime);
        }
        return @(AWSSimpleSystemsManagerAssociationExecutionFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerAssociationExecutionFilterKeyExecutionId:
                return @"ExecutionId";
            case AWSSimpleSystemsManagerAssociationExecutionFilterKeyStatus:
                return @"Status";
            case AWSSimpleSystemsManagerAssociationExecutionFilterKeyCreatedTime:
                return @"CreatedTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EQUAL"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationFilterOperatorTypeEqual);
        }
        if ([value caseInsensitiveCompare:@"LESS_THAN"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationFilterOperatorTypeLessThan);
        }
        if ([value caseInsensitiveCompare:@"GREATER_THAN"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationFilterOperatorTypeGreaterThan);
        }
        return @(AWSSimpleSystemsManagerAssociationFilterOperatorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerAssociationFilterOperatorTypeEqual:
                return @"EQUAL";
            case AWSSimpleSystemsManagerAssociationFilterOperatorTypeLessThan:
                return @"LESS_THAN";
            case AWSSimpleSystemsManagerAssociationFilterOperatorTypeGreaterThan:
                return @"GREATER_THAN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerAssociationExecutionTarget

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerOutputSource class]];
}

@end

@implementation AWSSimpleSystemsManagerAssociationExecutionTargetsFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationExecutionTargetsFilterKeyStatus);
        }
        if ([value caseInsensitiveCompare:@"ResourceId"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationExecutionTargetsFilterKeyResourceId);
        }
        if ([value caseInsensitiveCompare:@"ResourceType"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationExecutionTargetsFilterKeyResourceType);
        }
        return @(AWSSimpleSystemsManagerAssociationExecutionTargetsFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerAssociationExecutionTargetsFilterKeyStatus:
                return @"Status";
            case AWSSimpleSystemsManagerAssociationExecutionTargetsFilterKeyResourceId:
                return @"ResourceId";
            case AWSSimpleSystemsManagerAssociationExecutionTargetsFilterKeyResourceType:
                return @"ResourceType";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerAssociationFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InstanceId"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationFilterKeyInstanceId);
        }
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationFilterKeyName);
        }
        if ([value caseInsensitiveCompare:@"AssociationId"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationFilterKeyAssociationId);
        }
        if ([value caseInsensitiveCompare:@"AssociationStatusName"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationFilterKeyAssociationStatusName);
        }
        if ([value caseInsensitiveCompare:@"LastExecutedBefore"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationFilterKeyLastExecutedBefore);
        }
        if ([value caseInsensitiveCompare:@"LastExecutedAfter"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationFilterKeyLastExecutedAfter);
        }
        if ([value caseInsensitiveCompare:@"AssociationName"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationFilterKeyAssociationName);
        }
        if ([value caseInsensitiveCompare:@"ResourceGroupName"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationFilterKeyResourceGroupName);
        }
        return @(AWSSimpleSystemsManagerAssociationFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerAssociationFilterKeyInstanceId:
                return @"InstanceId";
            case AWSSimpleSystemsManagerAssociationFilterKeyName:
                return @"Name";
            case AWSSimpleSystemsManagerAssociationFilterKeyAssociationId:
                return @"AssociationId";
            case AWSSimpleSystemsManagerAssociationFilterKeyAssociationStatusName:
                return @"AssociationStatusName";
            case AWSSimpleSystemsManagerAssociationFilterKeyLastExecutedBefore:
                return @"LastExecutedBefore";
            case AWSSimpleSystemsManagerAssociationFilterKeyLastExecutedAfter:
                return @"LastExecutedAfter";
            case AWSSimpleSystemsManagerAssociationFilterKeyAssociationName:
                return @"AssociationName";
            case AWSSimpleSystemsManagerAssociationFilterKeyResourceGroupName:
                return @"ResourceGroupName";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerAssociationOverview

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationStatusAggregatedCount" : @"AssociationStatusAggregatedCount",
             @"detailedStatus" : @"DetailedStatus",
             @"status" : @"Status",
             };
}

@end

@implementation AWSSimpleSystemsManagerAssociationStatus

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
            return @(AWSSimpleSystemsManagerAssociationStatusNamePending);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationStatusNameSuccess);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationStatusNameFailed);
        }
        return @(AWSSimpleSystemsManagerAssociationStatusNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerAssociationStatusNamePending:
                return @"Pending";
            case AWSSimpleSystemsManagerAssociationStatusNameSuccess:
                return @"Success";
            case AWSSimpleSystemsManagerAssociationStatusNameFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerAssociationVersionInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
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
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityUnspecified);
        }
        return @(AWSSimpleSystemsManagerAssociationComplianceSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerAssociationComplianceSeverityCritical:
                return @"CRITICAL";
            case AWSSimpleSystemsManagerAssociationComplianceSeverityHigh:
                return @"HIGH";
            case AWSSimpleSystemsManagerAssociationComplianceSeverityMedium:
                return @"MEDIUM";
            case AWSSimpleSystemsManagerAssociationComplianceSeverityLow:
                return @"LOW";
            case AWSSimpleSystemsManagerAssociationComplianceSeverityUnspecified:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerInstanceAssociationOutputLocation class]];
}

+ (NSValueTransformer *)syncComplianceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationSyncComplianceAuto);
        }
        if ([value caseInsensitiveCompare:@"MANUAL"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationSyncComplianceManual);
        }
        return @(AWSSimpleSystemsManagerAssociationSyncComplianceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerAssociationSyncComplianceAuto:
                return @"AUTO";
            case AWSSimpleSystemsManagerAssociationSyncComplianceManual:
                return @"MANUAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTarget class]];
}

@end

@implementation AWSSimpleSystemsManagerAttachmentContent

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
            return @(AWSSimpleSystemsManagerAttachmentHashTypeSha256);
        }
        return @(AWSSimpleSystemsManagerAttachmentHashTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerAttachmentHashTypeSha256:
                return @"Sha256";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerAttachmentInformation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSSimpleSystemsManagerAttachmentsSource

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
            return @(AWSSimpleSystemsManagerAttachmentsSourceKeySourceUrl);
        }
        if ([value caseInsensitiveCompare:@"S3FileUrl"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAttachmentsSourceKeyS3FileUrl);
        }
        if ([value caseInsensitiveCompare:@"AttachmentReference"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAttachmentsSourceKeyAttachmentReference);
        }
        return @(AWSSimpleSystemsManagerAttachmentsSourceKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerAttachmentsSourceKeySourceUrl:
                return @"SourceUrl";
            case AWSSimpleSystemsManagerAttachmentsSourceKeyS3FileUrl:
                return @"S3FileUrl";
            case AWSSimpleSystemsManagerAttachmentsSourceKeyAttachmentReference:
                return @"AttachmentReference";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerAutomationExecution

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
            return @(AWSSimpleSystemsManagerAutomationExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Waiting"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionStatusWaiting);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"TimedOut"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"Cancelling"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionStatusFailed);
        }
        return @(AWSSimpleSystemsManagerAutomationExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerAutomationExecutionStatusPending:
                return @"Pending";
            case AWSSimpleSystemsManagerAutomationExecutionStatusInProgress:
                return @"InProgress";
            case AWSSimpleSystemsManagerAutomationExecutionStatusWaiting:
                return @"Waiting";
            case AWSSimpleSystemsManagerAutomationExecutionStatusSuccess:
                return @"Success";
            case AWSSimpleSystemsManagerAutomationExecutionStatusTimedOut:
                return @"TimedOut";
            case AWSSimpleSystemsManagerAutomationExecutionStatusCancelling:
                return @"Cancelling";
            case AWSSimpleSystemsManagerAutomationExecutionStatusCancelled:
                return @"Cancelled";
            case AWSSimpleSystemsManagerAutomationExecutionStatusFailed:
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
            return @(AWSSimpleSystemsManagerExecutionModeAuto);
        }
        if ([value caseInsensitiveCompare:@"Interactive"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerExecutionModeInteractive);
        }
        return @(AWSSimpleSystemsManagerExecutionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerExecutionModeAuto:
                return @"Auto";
            case AWSSimpleSystemsManagerExecutionModeInteractive:
                return @"Interactive";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)progressCountersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerProgressCounters class]];
}

+ (NSValueTransformer *)resolvedTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerResolvedTargets class]];
}

+ (NSValueTransformer *)stepExecutionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerStepExecution class]];
}

+ (NSValueTransformer *)targetLocationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTargetLocation class]];
}

+ (NSValueTransformer *)targetMapsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[java.util.List<NSString> class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTarget class]];
}

@end

@implementation AWSSimpleSystemsManagerAutomationExecutionFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DocumentNamePrefix"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionFilterKeyDocumentNamePrefix);
        }
        if ([value caseInsensitiveCompare:@"ExecutionStatus"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionFilterKeyExecutionStatus);
        }
        if ([value caseInsensitiveCompare:@"ExecutionId"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionFilterKeyExecutionId);
        }
        if ([value caseInsensitiveCompare:@"ParentExecutionId"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionFilterKeyParentExecutionId);
        }
        if ([value caseInsensitiveCompare:@"CurrentAction"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionFilterKeyCurrentAction);
        }
        if ([value caseInsensitiveCompare:@"StartTimeBefore"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionFilterKeyStartTimeBefore);
        }
        if ([value caseInsensitiveCompare:@"StartTimeAfter"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionFilterKeyStartTimeAfter);
        }
        if ([value caseInsensitiveCompare:@"AutomationType"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionFilterKeyAutomationType);
        }
        if ([value caseInsensitiveCompare:@"TagKey"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionFilterKeyTagKey);
        }
        return @(AWSSimpleSystemsManagerAutomationExecutionFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerAutomationExecutionFilterKeyDocumentNamePrefix:
                return @"DocumentNamePrefix";
            case AWSSimpleSystemsManagerAutomationExecutionFilterKeyExecutionStatus:
                return @"ExecutionStatus";
            case AWSSimpleSystemsManagerAutomationExecutionFilterKeyExecutionId:
                return @"ExecutionId";
            case AWSSimpleSystemsManagerAutomationExecutionFilterKeyParentExecutionId:
                return @"ParentExecutionId";
            case AWSSimpleSystemsManagerAutomationExecutionFilterKeyCurrentAction:
                return @"CurrentAction";
            case AWSSimpleSystemsManagerAutomationExecutionFilterKeyStartTimeBefore:
                return @"StartTimeBefore";
            case AWSSimpleSystemsManagerAutomationExecutionFilterKeyStartTimeAfter:
                return @"StartTimeAfter";
            case AWSSimpleSystemsManagerAutomationExecutionFilterKeyAutomationType:
                return @"AutomationType";
            case AWSSimpleSystemsManagerAutomationExecutionFilterKeyTagKey:
                return @"TagKey";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerAutomationExecutionMetadata

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
            return @(AWSSimpleSystemsManagerAutomationExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Waiting"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionStatusWaiting);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"TimedOut"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"Cancelling"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionStatusFailed);
        }
        return @(AWSSimpleSystemsManagerAutomationExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerAutomationExecutionStatusPending:
                return @"Pending";
            case AWSSimpleSystemsManagerAutomationExecutionStatusInProgress:
                return @"InProgress";
            case AWSSimpleSystemsManagerAutomationExecutionStatusWaiting:
                return @"Waiting";
            case AWSSimpleSystemsManagerAutomationExecutionStatusSuccess:
                return @"Success";
            case AWSSimpleSystemsManagerAutomationExecutionStatusTimedOut:
                return @"TimedOut";
            case AWSSimpleSystemsManagerAutomationExecutionStatusCancelling:
                return @"Cancelling";
            case AWSSimpleSystemsManagerAutomationExecutionStatusCancelled:
                return @"Cancelled";
            case AWSSimpleSystemsManagerAutomationExecutionStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)automationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CrossAccount"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationTypeCrossAccount);
        }
        if ([value caseInsensitiveCompare:@"Local"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationTypeLocal);
        }
        return @(AWSSimpleSystemsManagerAutomationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerAutomationTypeCrossAccount:
                return @"CrossAccount";
            case AWSSimpleSystemsManagerAutomationTypeLocal:
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
            return @(AWSSimpleSystemsManagerExecutionModeAuto);
        }
        if ([value caseInsensitiveCompare:@"Interactive"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerExecutionModeInteractive);
        }
        return @(AWSSimpleSystemsManagerExecutionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerExecutionModeAuto:
                return @"Auto";
            case AWSSimpleSystemsManagerExecutionModeInteractive:
                return @"Interactive";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resolvedTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerResolvedTargets class]];
}

+ (NSValueTransformer *)targetMapsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[java.util.List<NSString> class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTarget class]];
}

@end

@implementation AWSSimpleSystemsManagerCancelCommandRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commandId" : @"CommandId",
             @"instanceIds" : @"InstanceIds",
             };
}

@end

@implementation AWSSimpleSystemsManagerCancelCommandResult

@end

@implementation AWSSimpleSystemsManagerCancelMaintenanceWindowExecutionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowExecutionId" : @"WindowExecutionId",
             };
}

@end

@implementation AWSSimpleSystemsManagerCancelMaintenanceWindowExecutionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowExecutionId" : @"WindowExecutionId",
             };
}

@end

@implementation AWSSimpleSystemsManagerCloudWatchOutputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLogGroupName" : @"CloudWatchLogGroupName",
             @"cloudWatchOutputEnabled" : @"CloudWatchOutputEnabled",
             };
}

@end

@implementation AWSSimpleSystemsManagerCommand

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerCloudWatchOutputConfig class]];
}

+ (NSValueTransformer *)expiresAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)notificationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerNotificationConfig class]];
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
            return @(AWSSimpleSystemsManagerCommandStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TimedOut"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"Cancelling"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandStatusCancelling);
        }
        return @(AWSSimpleSystemsManagerCommandStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerCommandStatusPending:
                return @"Pending";
            case AWSSimpleSystemsManagerCommandStatusInProgress:
                return @"InProgress";
            case AWSSimpleSystemsManagerCommandStatusSuccess:
                return @"Success";
            case AWSSimpleSystemsManagerCommandStatusCancelled:
                return @"Cancelled";
            case AWSSimpleSystemsManagerCommandStatusFailed:
                return @"Failed";
            case AWSSimpleSystemsManagerCommandStatusTimedOut:
                return @"TimedOut";
            case AWSSimpleSystemsManagerCommandStatusCancelling:
                return @"Cancelling";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTarget class]];
}

@end

@implementation AWSSimpleSystemsManagerCommandFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InvokedAfter"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandFilterKeyInvokedAfter);
        }
        if ([value caseInsensitiveCompare:@"InvokedBefore"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandFilterKeyInvokedBefore);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandFilterKeyStatus);
        }
        if ([value caseInsensitiveCompare:@"ExecutionStage"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandFilterKeyExecutionStage);
        }
        if ([value caseInsensitiveCompare:@"DocumentName"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandFilterKeyDocumentName);
        }
        return @(AWSSimpleSystemsManagerCommandFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerCommandFilterKeyInvokedAfter:
                return @"InvokedAfter";
            case AWSSimpleSystemsManagerCommandFilterKeyInvokedBefore:
                return @"InvokedBefore";
            case AWSSimpleSystemsManagerCommandFilterKeyStatus:
                return @"Status";
            case AWSSimpleSystemsManagerCommandFilterKeyExecutionStage:
                return @"ExecutionStage";
            case AWSSimpleSystemsManagerCommandFilterKeyDocumentName:
                return @"DocumentName";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerCommandInvocation

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerCloudWatchOutputConfig class]];
}

+ (NSValueTransformer *)commandPluginsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerCommandPlugin class]];
}

+ (NSValueTransformer *)notificationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerNotificationConfig class]];
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
            return @(AWSSimpleSystemsManagerCommandInvocationStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandInvocationStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Delayed"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandInvocationStatusDelayed);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandInvocationStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandInvocationStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"TimedOut"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandInvocationStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandInvocationStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Cancelling"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandInvocationStatusCancelling);
        }
        return @(AWSSimpleSystemsManagerCommandInvocationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerCommandInvocationStatusPending:
                return @"Pending";
            case AWSSimpleSystemsManagerCommandInvocationStatusInProgress:
                return @"InProgress";
            case AWSSimpleSystemsManagerCommandInvocationStatusDelayed:
                return @"Delayed";
            case AWSSimpleSystemsManagerCommandInvocationStatusSuccess:
                return @"Success";
            case AWSSimpleSystemsManagerCommandInvocationStatusCancelled:
                return @"Cancelled";
            case AWSSimpleSystemsManagerCommandInvocationStatusTimedOut:
                return @"TimedOut";
            case AWSSimpleSystemsManagerCommandInvocationStatusFailed:
                return @"Failed";
            case AWSSimpleSystemsManagerCommandInvocationStatusCancelling:
                return @"Cancelling";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerCommandPlugin

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
            return @(AWSSimpleSystemsManagerCommandPluginStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandPluginStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandPluginStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"TimedOut"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandPluginStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandPluginStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandPluginStatusFailed);
        }
        return @(AWSSimpleSystemsManagerCommandPluginStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerCommandPluginStatusPending:
                return @"Pending";
            case AWSSimpleSystemsManagerCommandPluginStatusInProgress:
                return @"InProgress";
            case AWSSimpleSystemsManagerCommandPluginStatusSuccess:
                return @"Success";
            case AWSSimpleSystemsManagerCommandPluginStatusTimedOut:
                return @"TimedOut";
            case AWSSimpleSystemsManagerCommandPluginStatusCancelled:
                return @"Cancelled";
            case AWSSimpleSystemsManagerCommandPluginStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerComplianceExecutionSummary

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

@implementation AWSSimpleSystemsManagerComplianceItem

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerComplianceExecutionSummary class]];
}

+ (NSValueTransformer *)severityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceSeverityInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceSeverityUnspecified);
        }
        return @(AWSSimpleSystemsManagerComplianceSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerComplianceSeverityCritical:
                return @"CRITICAL";
            case AWSSimpleSystemsManagerComplianceSeverityHigh:
                return @"HIGH";
            case AWSSimpleSystemsManagerComplianceSeverityMedium:
                return @"MEDIUM";
            case AWSSimpleSystemsManagerComplianceSeverityLow:
                return @"LOW";
            case AWSSimpleSystemsManagerComplianceSeverityInformational:
                return @"INFORMATIONAL";
            case AWSSimpleSystemsManagerComplianceSeverityUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLIANT"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceStatusCompliant);
        }
        if ([value caseInsensitiveCompare:@"NON_COMPLIANT"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceStatusNonCompliant);
        }
        return @(AWSSimpleSystemsManagerComplianceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerComplianceStatusCompliant:
                return @"COMPLIANT";
            case AWSSimpleSystemsManagerComplianceStatusNonCompliant:
                return @"NON_COMPLIANT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerComplianceItemEntry

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
            return @(AWSSimpleSystemsManagerComplianceSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceSeverityInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceSeverityUnspecified);
        }
        return @(AWSSimpleSystemsManagerComplianceSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerComplianceSeverityCritical:
                return @"CRITICAL";
            case AWSSimpleSystemsManagerComplianceSeverityHigh:
                return @"HIGH";
            case AWSSimpleSystemsManagerComplianceSeverityMedium:
                return @"MEDIUM";
            case AWSSimpleSystemsManagerComplianceSeverityLow:
                return @"LOW";
            case AWSSimpleSystemsManagerComplianceSeverityInformational:
                return @"INFORMATIONAL";
            case AWSSimpleSystemsManagerComplianceSeverityUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLIANT"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceStatusCompliant);
        }
        if ([value caseInsensitiveCompare:@"NON_COMPLIANT"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceStatusNonCompliant);
        }
        return @(AWSSimpleSystemsManagerComplianceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerComplianceStatusCompliant:
                return @"COMPLIANT";
            case AWSSimpleSystemsManagerComplianceStatusNonCompliant:
                return @"NON_COMPLIANT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerComplianceStringFilter

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
            return @(AWSSimpleSystemsManagerComplianceQueryOperatorTypeEqual);
        }
        if ([value caseInsensitiveCompare:@"NOT_EQUAL"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceQueryOperatorTypeNotEqual);
        }
        if ([value caseInsensitiveCompare:@"BEGIN_WITH"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceQueryOperatorTypeBeginWith);
        }
        if ([value caseInsensitiveCompare:@"LESS_THAN"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceQueryOperatorTypeLessThan);
        }
        if ([value caseInsensitiveCompare:@"GREATER_THAN"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceQueryOperatorTypeGreaterThan);
        }
        return @(AWSSimpleSystemsManagerComplianceQueryOperatorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerComplianceQueryOperatorTypeEqual:
                return @"EQUAL";
            case AWSSimpleSystemsManagerComplianceQueryOperatorTypeNotEqual:
                return @"NOT_EQUAL";
            case AWSSimpleSystemsManagerComplianceQueryOperatorTypeBeginWith:
                return @"BEGIN_WITH";
            case AWSSimpleSystemsManagerComplianceQueryOperatorTypeLessThan:
                return @"LESS_THAN";
            case AWSSimpleSystemsManagerComplianceQueryOperatorTypeGreaterThan:
                return @"GREATER_THAN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerComplianceSummaryItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"complianceType" : @"ComplianceType",
             @"compliantSummary" : @"CompliantSummary",
             @"nonCompliantSummary" : @"NonCompliantSummary",
             };
}

+ (NSValueTransformer *)compliantSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerCompliantSummary class]];
}

+ (NSValueTransformer *)nonCompliantSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerNonCompliantSummary class]];
}

@end

@implementation AWSSimpleSystemsManagerCompliantSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compliantCount" : @"CompliantCount",
             @"severitySummary" : @"SeveritySummary",
             };
}

+ (NSValueTransformer *)severitySummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerSeveritySummary class]];
}

@end

@implementation AWSSimpleSystemsManagerCreateActivationRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTag class]];
}

@end

@implementation AWSSimpleSystemsManagerCreateActivationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activationCode" : @"ActivationCode",
             @"activationId" : @"ActivationId",
             };
}

@end

@implementation AWSSimpleSystemsManagerCreateAssociationBatchRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entries" : @"Entries",
             };
}

+ (NSValueTransformer *)entriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerCreateAssociationBatchRequestEntry class]];
}

@end

@implementation AWSSimpleSystemsManagerCreateAssociationBatchRequestEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
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
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityUnspecified);
        }
        return @(AWSSimpleSystemsManagerAssociationComplianceSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerAssociationComplianceSeverityCritical:
                return @"CRITICAL";
            case AWSSimpleSystemsManagerAssociationComplianceSeverityHigh:
                return @"HIGH";
            case AWSSimpleSystemsManagerAssociationComplianceSeverityMedium:
                return @"MEDIUM";
            case AWSSimpleSystemsManagerAssociationComplianceSeverityLow:
                return @"LOW";
            case AWSSimpleSystemsManagerAssociationComplianceSeverityUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerInstanceAssociationOutputLocation class]];
}

+ (NSValueTransformer *)syncComplianceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationSyncComplianceAuto);
        }
        if ([value caseInsensitiveCompare:@"MANUAL"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationSyncComplianceManual);
        }
        return @(AWSSimpleSystemsManagerAssociationSyncComplianceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerAssociationSyncComplianceAuto:
                return @"AUTO";
            case AWSSimpleSystemsManagerAssociationSyncComplianceManual:
                return @"MANUAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTarget class]];
}

@end

@implementation AWSSimpleSystemsManagerCreateAssociationBatchResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failed" : @"Failed",
             @"successful" : @"Successful",
             };
}

+ (NSValueTransformer *)failedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerFailedCreateAssociation class]];
}

+ (NSValueTransformer *)successfulJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerAssociationDescription class]];
}

@end

@implementation AWSSimpleSystemsManagerCreateAssociationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
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
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityUnspecified);
        }
        return @(AWSSimpleSystemsManagerAssociationComplianceSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerAssociationComplianceSeverityCritical:
                return @"CRITICAL";
            case AWSSimpleSystemsManagerAssociationComplianceSeverityHigh:
                return @"HIGH";
            case AWSSimpleSystemsManagerAssociationComplianceSeverityMedium:
                return @"MEDIUM";
            case AWSSimpleSystemsManagerAssociationComplianceSeverityLow:
                return @"LOW";
            case AWSSimpleSystemsManagerAssociationComplianceSeverityUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerInstanceAssociationOutputLocation class]];
}

+ (NSValueTransformer *)syncComplianceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationSyncComplianceAuto);
        }
        if ([value caseInsensitiveCompare:@"MANUAL"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationSyncComplianceManual);
        }
        return @(AWSSimpleSystemsManagerAssociationSyncComplianceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerAssociationSyncComplianceAuto:
                return @"AUTO";
            case AWSSimpleSystemsManagerAssociationSyncComplianceManual:
                return @"MANUAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTarget class]];
}

@end

@implementation AWSSimpleSystemsManagerCreateAssociationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationDescription" : @"AssociationDescription",
             };
}

+ (NSValueTransformer *)associationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerAssociationDescription class]];
}

@end

@implementation AWSSimpleSystemsManagerCreateDocumentRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerAttachmentsSource class]];
}

+ (NSValueTransformer *)documentFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"YAML"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentFormatYaml);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentFormatJson);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentFormatText);
        }
        return @(AWSSimpleSystemsManagerDocumentFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerDocumentFormatYaml:
                return @"YAML";
            case AWSSimpleSystemsManagerDocumentFormatJson:
                return @"JSON";
            case AWSSimpleSystemsManagerDocumentFormatText:
                return @"TEXT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)documentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Command"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeCommand);
        }
        if ([value caseInsensitiveCompare:@"Policy"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypePolicy);
        }
        if ([value caseInsensitiveCompare:@"Automation"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"Session"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeSession);
        }
        if ([value caseInsensitiveCompare:@"Package"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypePackage);
        }
        if ([value caseInsensitiveCompare:@"ApplicationConfiguration"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeApplicationConfiguration);
        }
        if ([value caseInsensitiveCompare:@"ApplicationConfigurationSchema"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeApplicationConfigurationSchema);
        }
        if ([value caseInsensitiveCompare:@"DeploymentStrategy"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeDeploymentStrategy);
        }
        if ([value caseInsensitiveCompare:@"ChangeCalendar"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeChangeCalendar);
        }
        return @(AWSSimpleSystemsManagerDocumentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerDocumentTypeCommand:
                return @"Command";
            case AWSSimpleSystemsManagerDocumentTypePolicy:
                return @"Policy";
            case AWSSimpleSystemsManagerDocumentTypeAutomation:
                return @"Automation";
            case AWSSimpleSystemsManagerDocumentTypeSession:
                return @"Session";
            case AWSSimpleSystemsManagerDocumentTypePackage:
                return @"Package";
            case AWSSimpleSystemsManagerDocumentTypeApplicationConfiguration:
                return @"ApplicationConfiguration";
            case AWSSimpleSystemsManagerDocumentTypeApplicationConfigurationSchema:
                return @"ApplicationConfigurationSchema";
            case AWSSimpleSystemsManagerDocumentTypeDeploymentStrategy:
                return @"DeploymentStrategy";
            case AWSSimpleSystemsManagerDocumentTypeChangeCalendar:
                return @"ChangeCalendar";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requiresJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerDocumentRequires class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTag class]];
}

@end

@implementation AWSSimpleSystemsManagerCreateDocumentResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentDescription" : @"DocumentDescription",
             };
}

+ (NSValueTransformer *)documentDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerDocumentDescription class]];
}

@end

@implementation AWSSimpleSystemsManagerCreateMaintenanceWindowRequest

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
             @"scheduleTimezone" : @"ScheduleTimezone",
             @"startDate" : @"StartDate",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTag class]];
}

@end

@implementation AWSSimpleSystemsManagerCreateMaintenanceWindowResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowId" : @"WindowId",
             };
}

@end

@implementation AWSSimpleSystemsManagerCreateOpsItemRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerOpsItemNotification class]];
}

+ (NSValueTransformer *)operationalDataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSimpleSystemsManagerOpsItemDataValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)relatedOpsItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerRelatedOpsItem class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTag class]];
}

@end

@implementation AWSSimpleSystemsManagerCreateOpsItemResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"opsItemId" : @"OpsItemId",
             };
}

@end

@implementation AWSSimpleSystemsManagerCreatePatchBaselineRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerPatchRuleGroup class]];
}

+ (NSValueTransformer *)approvedPatchesComplianceLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelUnspecified);
        }
        return @(AWSSimpleSystemsManagerPatchComplianceLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerPatchComplianceLevelCritical:
                return @"CRITICAL";
            case AWSSimpleSystemsManagerPatchComplianceLevelHigh:
                return @"HIGH";
            case AWSSimpleSystemsManagerPatchComplianceLevelMedium:
                return @"MEDIUM";
            case AWSSimpleSystemsManagerPatchComplianceLevelLow:
                return @"LOW";
            case AWSSimpleSystemsManagerPatchComplianceLevelInformational:
                return @"INFORMATIONAL";
            case AWSSimpleSystemsManagerPatchComplianceLevelUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)globalFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerPatchFilterGroup class]];
}

+ (NSValueTransformer *)operatingSystemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WINDOWS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemCentos);
        }
        if ([value caseInsensitiveCompare:@"ORACLE_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemOracleLinux);
        }
        if ([value caseInsensitiveCompare:@"DEBIAN"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemDebian);
        }
        return @(AWSSimpleSystemsManagerOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSimpleSystemsManagerOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSimpleSystemsManagerOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSimpleSystemsManagerOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemSuse:
                return @"SUSE";
            case AWSSimpleSystemsManagerOperatingSystemCentos:
                return @"CENTOS";
            case AWSSimpleSystemsManagerOperatingSystemOracleLinux:
                return @"ORACLE_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemDebian:
                return @"DEBIAN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rejectedPatchesActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALLOW_AS_DEPENDENCY"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchActionAllowAsDependency);
        }
        if ([value caseInsensitiveCompare:@"BLOCK"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchActionBlock);
        }
        return @(AWSSimpleSystemsManagerPatchActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerPatchActionAllowAsDependency:
                return @"ALLOW_AS_DEPENDENCY";
            case AWSSimpleSystemsManagerPatchActionBlock:
                return @"BLOCK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerPatchSource class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTag class]];
}

@end

@implementation AWSSimpleSystemsManagerCreatePatchBaselineResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             };
}

@end

@implementation AWSSimpleSystemsManagerCreateResourceDataSyncRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Destination" : @"S3Destination",
             @"syncName" : @"SyncName",
             @"syncSource" : @"SyncSource",
             @"syncType" : @"SyncType",
             };
}

+ (NSValueTransformer *)s3DestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerResourceDataSyncS3Destination class]];
}

+ (NSValueTransformer *)syncSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerResourceDataSyncSource class]];
}

@end

@implementation AWSSimpleSystemsManagerCreateResourceDataSyncResult

@end

@implementation AWSSimpleSystemsManagerDeleteActivationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activationId" : @"ActivationId",
             };
}

@end

@implementation AWSSimpleSystemsManagerDeleteActivationResult

@end

@implementation AWSSimpleSystemsManagerDeleteAssociationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSSimpleSystemsManagerDeleteAssociationResult

@end

@implementation AWSSimpleSystemsManagerDeleteDocumentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentVersion" : @"DocumentVersion",
             @"force" : @"Force",
             @"name" : @"Name",
             @"versionName" : @"VersionName",
             };
}

@end

@implementation AWSSimpleSystemsManagerDeleteDocumentResult

@end

@implementation AWSSimpleSystemsManagerDeleteInventoryRequest

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
            return @(AWSSimpleSystemsManagerInventorySchemaDeleteOptionDisableSchema);
        }
        if ([value caseInsensitiveCompare:@"DeleteSchema"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerInventorySchemaDeleteOptionDeleteSchema);
        }
        return @(AWSSimpleSystemsManagerInventorySchemaDeleteOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerInventorySchemaDeleteOptionDisableSchema:
                return @"DisableSchema";
            case AWSSimpleSystemsManagerInventorySchemaDeleteOptionDeleteSchema:
                return @"DeleteSchema";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerDeleteInventoryResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deletionId" : @"DeletionId",
             @"deletionSummary" : @"DeletionSummary",
             @"typeName" : @"TypeName",
             };
}

+ (NSValueTransformer *)deletionSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerInventoryDeletionSummary class]];
}

@end

@implementation AWSSimpleSystemsManagerDeleteMaintenanceWindowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowId" : @"WindowId",
             };
}

@end

@implementation AWSSimpleSystemsManagerDeleteMaintenanceWindowResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowId" : @"WindowId",
             };
}

@end

@implementation AWSSimpleSystemsManagerDeleteParameterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSSimpleSystemsManagerDeleteParameterResult

@end

@implementation AWSSimpleSystemsManagerDeleteParametersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"names" : @"Names",
             };
}

@end

@implementation AWSSimpleSystemsManagerDeleteParametersResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deletedParameters" : @"DeletedParameters",
             @"invalidParameters" : @"InvalidParameters",
             };
}

@end

@implementation AWSSimpleSystemsManagerDeletePatchBaselineRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             };
}

@end

@implementation AWSSimpleSystemsManagerDeletePatchBaselineResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             };
}

@end

@implementation AWSSimpleSystemsManagerDeleteResourceDataSyncRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"syncName" : @"SyncName",
             @"syncType" : @"SyncType",
             };
}

@end

@implementation AWSSimpleSystemsManagerDeleteResourceDataSyncResult

@end

@implementation AWSSimpleSystemsManagerDeregisterManagedInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSSimpleSystemsManagerDeregisterManagedInstanceResult

@end

@implementation AWSSimpleSystemsManagerDeregisterPatchBaselineForPatchGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             @"patchGroup" : @"PatchGroup",
             };
}

@end

@implementation AWSSimpleSystemsManagerDeregisterPatchBaselineForPatchGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             @"patchGroup" : @"PatchGroup",
             };
}

@end

@implementation AWSSimpleSystemsManagerDeregisterTargetFromMaintenanceWindowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"safe" : @"Safe",
             @"windowId" : @"WindowId",
             @"windowTargetId" : @"WindowTargetId",
             };
}

@end

@implementation AWSSimpleSystemsManagerDeregisterTargetFromMaintenanceWindowResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowId" : @"WindowId",
             @"windowTargetId" : @"WindowTargetId",
             };
}

@end

@implementation AWSSimpleSystemsManagerDeregisterTaskFromMaintenanceWindowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowId" : @"WindowId",
             @"windowTaskId" : @"WindowTaskId",
             };
}

@end

@implementation AWSSimpleSystemsManagerDeregisterTaskFromMaintenanceWindowResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowId" : @"WindowId",
             @"windowTaskId" : @"WindowTaskId",
             };
}

@end

@implementation AWSSimpleSystemsManagerDescribeActivationsFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterKey" : @"FilterKey",
             @"filterValues" : @"FilterValues",
             };
}

+ (NSValueTransformer *)filterKeyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ActivationIds"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDescribeActivationsFilterKeysActivationIds);
        }
        if ([value caseInsensitiveCompare:@"DefaultInstanceName"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDescribeActivationsFilterKeysDefaultInstanceName);
        }
        if ([value caseInsensitiveCompare:@"IamRole"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDescribeActivationsFilterKeysIamRole);
        }
        return @(AWSSimpleSystemsManagerDescribeActivationsFilterKeysUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerDescribeActivationsFilterKeysActivationIds:
                return @"ActivationIds";
            case AWSSimpleSystemsManagerDescribeActivationsFilterKeysDefaultInstanceName:
                return @"DefaultInstanceName";
            case AWSSimpleSystemsManagerDescribeActivationsFilterKeysIamRole:
                return @"IamRole";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerDescribeActivationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerDescribeActivationsFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeActivationsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activationList" : @"ActivationList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)activationListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerActivation class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeAssociationExecutionTargetsRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerAssociationExecutionTargetsFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeAssociationExecutionTargetsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationExecutionTargets" : @"AssociationExecutionTargets",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)associationExecutionTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerAssociationExecutionTarget class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeAssociationExecutionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerAssociationExecutionFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeAssociationExecutionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationExecutions" : @"AssociationExecutions",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)associationExecutionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerAssociationExecution class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeAssociationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"associationVersion" : @"AssociationVersion",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSSimpleSystemsManagerDescribeAssociationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationDescription" : @"AssociationDescription",
             };
}

+ (NSValueTransformer *)associationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerAssociationDescription class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeAutomationExecutionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerAutomationExecutionFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeAutomationExecutionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automationExecutionMetadataList" : @"AutomationExecutionMetadataList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)automationExecutionMetadataListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerAutomationExecutionMetadata class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeAutomationStepExecutionsRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerStepExecutionFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeAutomationStepExecutionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"stepExecutions" : @"StepExecutions",
             };
}

+ (NSValueTransformer *)stepExecutionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerStepExecution class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeAvailablePatchesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerPatchOrchestratorFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeAvailablePatchesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"patches" : @"Patches",
             };
}

+ (NSValueTransformer *)patchesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerPatch class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeDocumentPermissionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"permissionType" : @"PermissionType",
             };
}

+ (NSValueTransformer *)permissionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Share"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentPermissionTypeShare);
        }
        return @(AWSSimpleSystemsManagerDocumentPermissionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerDocumentPermissionTypeShare:
                return @"Share";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerDescribeDocumentPermissionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             @"accountSharingInfoList" : @"AccountSharingInfoList",
             };
}

+ (NSValueTransformer *)accountSharingInfoListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerAccountSharingInfo class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeDocumentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentVersion" : @"DocumentVersion",
             @"name" : @"Name",
             @"versionName" : @"VersionName",
             };
}

@end

@implementation AWSSimpleSystemsManagerDescribeDocumentResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"document" : @"Document",
             };
}

+ (NSValueTransformer *)documentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerDocumentDescription class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeEffectiveInstanceAssociationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSimpleSystemsManagerDescribeEffectiveInstanceAssociationsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associations" : @"Associations",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)associationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerInstanceAssociation class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeEffectivePatchesForPatchBaselineRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSimpleSystemsManagerDescribeEffectivePatchesForPatchBaselineResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"effectivePatches" : @"EffectivePatches",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)effectivePatchesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerEffectivePatch class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeInstanceAssociationsStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSimpleSystemsManagerDescribeInstanceAssociationsStatusResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceAssociationStatusInfos" : @"InstanceAssociationStatusInfos",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)instanceAssociationStatusInfosJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerInstanceAssociationStatusInfo class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeInstanceInformationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"instanceInformationFilterList" : @"InstanceInformationFilterList",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerInstanceInformationStringFilter class]];
}

+ (NSValueTransformer *)instanceInformationFilterListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerInstanceInformationFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeInstanceInformationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceInformationList" : @"InstanceInformationList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)instanceInformationListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerInstanceInformation class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeInstancePatchStatesForPatchGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"patchGroup" : @"PatchGroup",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerInstancePatchStateFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeInstancePatchStatesForPatchGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instancePatchStates" : @"InstancePatchStates",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)instancePatchStatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerInstancePatchState class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeInstancePatchStatesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceIds" : @"InstanceIds",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSimpleSystemsManagerDescribeInstancePatchStatesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instancePatchStates" : @"InstancePatchStates",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)instancePatchStatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerInstancePatchState class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeInstancePatchesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerPatchOrchestratorFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeInstancePatchesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"patches" : @"Patches",
             };
}

+ (NSValueTransformer *)patchesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerPatchComplianceData class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeInventoryDeletionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deletionId" : @"DeletionId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSimpleSystemsManagerDescribeInventoryDeletionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inventoryDeletions" : @"InventoryDeletions",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)inventoryDeletionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerInventoryDeletionStatusItem class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTaskInvocationsRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerMaintenanceWindowFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTaskInvocationsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"windowExecutionTaskInvocationIdentities" : @"WindowExecutionTaskInvocationIdentities",
             };
}

+ (NSValueTransformer *)windowExecutionTaskInvocationIdentitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerMaintenanceWindowExecutionTaskInvocationIdentity class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTasksRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"windowExecutionId" : @"WindowExecutionId",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerMaintenanceWindowFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTasksResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"windowExecutionTaskIdentities" : @"WindowExecutionTaskIdentities",
             };
}

+ (NSValueTransformer *)windowExecutionTaskIdentitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerMaintenanceWindowExecutionTaskIdentity class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"windowId" : @"WindowId",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerMaintenanceWindowFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"windowExecutions" : @"WindowExecutions",
             };
}

+ (NSValueTransformer *)windowExecutionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerMaintenanceWindowExecution class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeMaintenanceWindowScheduleRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerPatchOrchestratorFilter class]];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSTANCE"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_GROUP"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowResourceTypeResourceGroup);
        }
        return @(AWSSimpleSystemsManagerMaintenanceWindowResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerMaintenanceWindowResourceTypeInstance:
                return @"INSTANCE";
            case AWSSimpleSystemsManagerMaintenanceWindowResourceTypeResourceGroup:
                return @"RESOURCE_GROUP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTarget class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeMaintenanceWindowScheduleResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"scheduledWindowExecutions" : @"ScheduledWindowExecutions",
             };
}

+ (NSValueTransformer *)scheduledWindowExecutionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerScheduledWindowExecution class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeMaintenanceWindowTargetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"windowId" : @"WindowId",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerMaintenanceWindowFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeMaintenanceWindowTargetsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerMaintenanceWindowTarget class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeMaintenanceWindowTasksRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"windowId" : @"WindowId",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerMaintenanceWindowFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeMaintenanceWindowTasksResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tasks" : @"Tasks",
             };
}

+ (NSValueTransformer *)tasksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerMaintenanceWindowTask class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeMaintenanceWindowsForTargetRequest

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
            return @(AWSSimpleSystemsManagerMaintenanceWindowResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_GROUP"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowResourceTypeResourceGroup);
        }
        return @(AWSSimpleSystemsManagerMaintenanceWindowResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerMaintenanceWindowResourceTypeInstance:
                return @"INSTANCE";
            case AWSSimpleSystemsManagerMaintenanceWindowResourceTypeResourceGroup:
                return @"RESOURCE_GROUP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTarget class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeMaintenanceWindowsForTargetResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"windowIdentities" : @"WindowIdentities",
             };
}

+ (NSValueTransformer *)windowIdentitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerMaintenanceWindowIdentityForTarget class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeMaintenanceWindowsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerMaintenanceWindowFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeMaintenanceWindowsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"windowIdentities" : @"WindowIdentities",
             };
}

+ (NSValueTransformer *)windowIdentitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerMaintenanceWindowIdentity class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeOpsItemsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"opsItemFilters" : @"OpsItemFilters",
             };
}

+ (NSValueTransformer *)opsItemFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerOpsItemFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeOpsItemsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"opsItemSummaries" : @"OpsItemSummaries",
             };
}

+ (NSValueTransformer *)opsItemSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerOpsItemSummary class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeParametersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"parameterFilters" : @"ParameterFilters",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerParametersFilter class]];
}

+ (NSValueTransformer *)parameterFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerParameterStringFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribeParametersResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerParameterMetadata class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribePatchBaselinesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerPatchOrchestratorFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribePatchBaselinesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineIdentities" : @"BaselineIdentities",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)baselineIdentitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerPatchBaselineIdentity class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribePatchGroupStateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"patchGroup" : @"PatchGroup",
             };
}

@end

@implementation AWSSimpleSystemsManagerDescribePatchGroupStateResult

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

@implementation AWSSimpleSystemsManagerDescribePatchGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerPatchOrchestratorFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribePatchGroupsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mappings" : @"Mappings",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)mappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerPatchGroupPatchBaselineMapping class]];
}

@end

@implementation AWSSimpleSystemsManagerDescribePatchPropertiesRequest

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
            return @(AWSSimpleSystemsManagerOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemCentos);
        }
        if ([value caseInsensitiveCompare:@"ORACLE_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemOracleLinux);
        }
        if ([value caseInsensitiveCompare:@"DEBIAN"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemDebian);
        }
        return @(AWSSimpleSystemsManagerOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSimpleSystemsManagerOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSimpleSystemsManagerOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSimpleSystemsManagerOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemSuse:
                return @"SUSE";
            case AWSSimpleSystemsManagerOperatingSystemCentos:
                return @"CENTOS";
            case AWSSimpleSystemsManagerOperatingSystemOracleLinux:
                return @"ORACLE_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemDebian:
                return @"DEBIAN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)patchSetJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchSetOs);
        }
        if ([value caseInsensitiveCompare:@"APPLICATION"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchSetApplication);
        }
        return @(AWSSimpleSystemsManagerPatchSetUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerPatchSetOs:
                return @"OS";
            case AWSSimpleSystemsManagerPatchSetApplication:
                return @"APPLICATION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)propertyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRODUCT"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchPropertyProduct);
        }
        if ([value caseInsensitiveCompare:@"PRODUCT_FAMILY"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchPropertyProductFamily);
        }
        if ([value caseInsensitiveCompare:@"CLASSIFICATION"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchPropertyClassification);
        }
        if ([value caseInsensitiveCompare:@"MSRC_SEVERITY"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchPropertyMsrcSeverity);
        }
        if ([value caseInsensitiveCompare:@"PRIORITY"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchPropertyPriority);
        }
        if ([value caseInsensitiveCompare:@"SEVERITY"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchPropertySeverity);
        }
        return @(AWSSimpleSystemsManagerPatchPropertyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerPatchPropertyProduct:
                return @"PRODUCT";
            case AWSSimpleSystemsManagerPatchPropertyProductFamily:
                return @"PRODUCT_FAMILY";
            case AWSSimpleSystemsManagerPatchPropertyClassification:
                return @"CLASSIFICATION";
            case AWSSimpleSystemsManagerPatchPropertyMsrcSeverity:
                return @"MSRC_SEVERITY";
            case AWSSimpleSystemsManagerPatchPropertyPriority:
                return @"PRIORITY";
            case AWSSimpleSystemsManagerPatchPropertySeverity:
                return @"SEVERITY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerDescribePatchPropertiesResult

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

@implementation AWSSimpleSystemsManagerDescribeSessionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerSessionFilter class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerSessionStateActive);
        }
        if ([value caseInsensitiveCompare:@"History"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerSessionStateHistory);
        }
        return @(AWSSimpleSystemsManagerSessionStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerSessionStateActive:
                return @"Active";
            case AWSSimpleSystemsManagerSessionStateHistory:
                return @"History";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerDescribeSessionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"sessions" : @"Sessions",
             };
}

+ (NSValueTransformer *)sessionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerSession class]];
}

@end

@implementation AWSSimpleSystemsManagerDocumentDefaultVersionDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultVersion" : @"DefaultVersion",
             @"defaultVersionName" : @"DefaultVersionName",
             @"name" : @"Name",
             };
}

@end

@implementation AWSSimpleSystemsManagerDocumentDescription

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerAttachmentInformation class]];
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
            return @(AWSSimpleSystemsManagerDocumentFormatYaml);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentFormatJson);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentFormatText);
        }
        return @(AWSSimpleSystemsManagerDocumentFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerDocumentFormatYaml:
                return @"YAML";
            case AWSSimpleSystemsManagerDocumentFormatJson:
                return @"JSON";
            case AWSSimpleSystemsManagerDocumentFormatText:
                return @"TEXT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)documentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Command"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeCommand);
        }
        if ([value caseInsensitiveCompare:@"Policy"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypePolicy);
        }
        if ([value caseInsensitiveCompare:@"Automation"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"Session"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeSession);
        }
        if ([value caseInsensitiveCompare:@"Package"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypePackage);
        }
        if ([value caseInsensitiveCompare:@"ApplicationConfiguration"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeApplicationConfiguration);
        }
        if ([value caseInsensitiveCompare:@"ApplicationConfigurationSchema"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeApplicationConfigurationSchema);
        }
        if ([value caseInsensitiveCompare:@"DeploymentStrategy"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeDeploymentStrategy);
        }
        if ([value caseInsensitiveCompare:@"ChangeCalendar"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeChangeCalendar);
        }
        return @(AWSSimpleSystemsManagerDocumentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerDocumentTypeCommand:
                return @"Command";
            case AWSSimpleSystemsManagerDocumentTypePolicy:
                return @"Policy";
            case AWSSimpleSystemsManagerDocumentTypeAutomation:
                return @"Automation";
            case AWSSimpleSystemsManagerDocumentTypeSession:
                return @"Session";
            case AWSSimpleSystemsManagerDocumentTypePackage:
                return @"Package";
            case AWSSimpleSystemsManagerDocumentTypeApplicationConfiguration:
                return @"ApplicationConfiguration";
            case AWSSimpleSystemsManagerDocumentTypeApplicationConfigurationSchema:
                return @"ApplicationConfigurationSchema";
            case AWSSimpleSystemsManagerDocumentTypeDeploymentStrategy:
                return @"DeploymentStrategy";
            case AWSSimpleSystemsManagerDocumentTypeChangeCalendar:
                return @"ChangeCalendar";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)hashTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Sha256"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentHashTypeSha256);
        }
        if ([value caseInsensitiveCompare:@"Sha1"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentHashTypeSha1);
        }
        return @(AWSSimpleSystemsManagerDocumentHashTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerDocumentHashTypeSha256:
                return @"Sha256";
            case AWSSimpleSystemsManagerDocumentHashTypeSha1:
                return @"Sha1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerDocumentParameter class]];
}

+ (NSValueTransformer *)requiresJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerDocumentRequires class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Creating"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentStatusActive);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentStatusFailed);
        }
        return @(AWSSimpleSystemsManagerDocumentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerDocumentStatusCreating:
                return @"Creating";
            case AWSSimpleSystemsManagerDocumentStatusActive:
                return @"Active";
            case AWSSimpleSystemsManagerDocumentStatusUpdating:
                return @"Updating";
            case AWSSimpleSystemsManagerDocumentStatusDeleting:
                return @"Deleting";
            case AWSSimpleSystemsManagerDocumentStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTag class]];
}

@end

@implementation AWSSimpleSystemsManagerDocumentFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentFilterKeyName);
        }
        if ([value caseInsensitiveCompare:@"Owner"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentFilterKeyOwner);
        }
        if ([value caseInsensitiveCompare:@"PlatformTypes"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentFilterKeyPlatformTypes);
        }
        if ([value caseInsensitiveCompare:@"DocumentType"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentFilterKeyDocumentType);
        }
        return @(AWSSimpleSystemsManagerDocumentFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerDocumentFilterKeyName:
                return @"Name";
            case AWSSimpleSystemsManagerDocumentFilterKeyOwner:
                return @"Owner";
            case AWSSimpleSystemsManagerDocumentFilterKeyPlatformTypes:
                return @"PlatformTypes";
            case AWSSimpleSystemsManagerDocumentFilterKeyDocumentType:
                return @"DocumentType";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerDocumentIdentifier

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
            return @(AWSSimpleSystemsManagerDocumentFormatYaml);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentFormatJson);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentFormatText);
        }
        return @(AWSSimpleSystemsManagerDocumentFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerDocumentFormatYaml:
                return @"YAML";
            case AWSSimpleSystemsManagerDocumentFormatJson:
                return @"JSON";
            case AWSSimpleSystemsManagerDocumentFormatText:
                return @"TEXT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)documentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Command"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeCommand);
        }
        if ([value caseInsensitiveCompare:@"Policy"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypePolicy);
        }
        if ([value caseInsensitiveCompare:@"Automation"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"Session"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeSession);
        }
        if ([value caseInsensitiveCompare:@"Package"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypePackage);
        }
        if ([value caseInsensitiveCompare:@"ApplicationConfiguration"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeApplicationConfiguration);
        }
        if ([value caseInsensitiveCompare:@"ApplicationConfigurationSchema"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeApplicationConfigurationSchema);
        }
        if ([value caseInsensitiveCompare:@"DeploymentStrategy"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeDeploymentStrategy);
        }
        if ([value caseInsensitiveCompare:@"ChangeCalendar"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeChangeCalendar);
        }
        return @(AWSSimpleSystemsManagerDocumentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerDocumentTypeCommand:
                return @"Command";
            case AWSSimpleSystemsManagerDocumentTypePolicy:
                return @"Policy";
            case AWSSimpleSystemsManagerDocumentTypeAutomation:
                return @"Automation";
            case AWSSimpleSystemsManagerDocumentTypeSession:
                return @"Session";
            case AWSSimpleSystemsManagerDocumentTypePackage:
                return @"Package";
            case AWSSimpleSystemsManagerDocumentTypeApplicationConfiguration:
                return @"ApplicationConfiguration";
            case AWSSimpleSystemsManagerDocumentTypeApplicationConfigurationSchema:
                return @"ApplicationConfigurationSchema";
            case AWSSimpleSystemsManagerDocumentTypeDeploymentStrategy:
                return @"DeploymentStrategy";
            case AWSSimpleSystemsManagerDocumentTypeChangeCalendar:
                return @"ChangeCalendar";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requiresJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerDocumentRequires class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTag class]];
}

@end

@implementation AWSSimpleSystemsManagerDocumentKeyValuesFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

@end

@implementation AWSSimpleSystemsManagerDocumentParameter

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
            return @(AWSSimpleSystemsManagerDocumentParameterTypeString);
        }
        if ([value caseInsensitiveCompare:@"StringList"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentParameterTypeStringList);
        }
        return @(AWSSimpleSystemsManagerDocumentParameterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerDocumentParameterTypeString:
                return @"String";
            case AWSSimpleSystemsManagerDocumentParameterTypeStringList:
                return @"StringList";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerDocumentRequires

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"version" : @"Version",
             };
}

@end

@implementation AWSSimpleSystemsManagerDocumentVersionInfo

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
            return @(AWSSimpleSystemsManagerDocumentFormatYaml);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentFormatJson);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentFormatText);
        }
        return @(AWSSimpleSystemsManagerDocumentFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerDocumentFormatYaml:
                return @"YAML";
            case AWSSimpleSystemsManagerDocumentFormatJson:
                return @"JSON";
            case AWSSimpleSystemsManagerDocumentFormatText:
                return @"TEXT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Creating"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentStatusActive);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentStatusFailed);
        }
        return @(AWSSimpleSystemsManagerDocumentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerDocumentStatusCreating:
                return @"Creating";
            case AWSSimpleSystemsManagerDocumentStatusActive:
                return @"Active";
            case AWSSimpleSystemsManagerDocumentStatusUpdating:
                return @"Updating";
            case AWSSimpleSystemsManagerDocumentStatusDeleting:
                return @"Deleting";
            case AWSSimpleSystemsManagerDocumentStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerEffectivePatch

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"patch" : @"Patch",
             @"patchStatus" : @"PatchStatus",
             };
}

+ (NSValueTransformer *)patchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerPatch class]];
}

+ (NSValueTransformer *)patchStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerPatchStatus class]];
}

@end

@implementation AWSSimpleSystemsManagerFailedCreateAssociation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entry" : @"Entry",
             @"fault" : @"Fault",
             @"message" : @"Message",
             };
}

+ (NSValueTransformer *)entryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerCreateAssociationBatchRequestEntry class]];
}

+ (NSValueTransformer *)faultJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Client"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerFaultClient);
        }
        if ([value caseInsensitiveCompare:@"Server"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerFaultServer);
        }
        if ([value caseInsensitiveCompare:@"Unknown"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerFaultUnknown);
        }
        return @(AWSSimpleSystemsManagerFaultUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerFaultClient:
                return @"Client";
            case AWSSimpleSystemsManagerFaultServer:
                return @"Server";
            case AWSSimpleSystemsManagerFaultUnknown:
                return @"Unknown";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerFailureDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"details" : @"Details",
             @"failureStage" : @"FailureStage",
             @"failureType" : @"FailureType",
             };
}

@end

@implementation AWSSimpleSystemsManagerGetAutomationExecutionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automationExecutionId" : @"AutomationExecutionId",
             };
}

@end

@implementation AWSSimpleSystemsManagerGetAutomationExecutionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automationExecution" : @"AutomationExecution",
             };
}

+ (NSValueTransformer *)automationExecutionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerAutomationExecution class]];
}

@end

@implementation AWSSimpleSystemsManagerGetCalendarStateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"atTime" : @"AtTime",
             @"calendarNames" : @"CalendarNames",
             };
}

@end

@implementation AWSSimpleSystemsManagerGetCalendarStateResponse

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
            return @(AWSSimpleSystemsManagerCalendarStateOpen);
        }
        if ([value caseInsensitiveCompare:@"CLOSED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCalendarStateClosed);
        }
        return @(AWSSimpleSystemsManagerCalendarStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerCalendarStateOpen:
                return @"OPEN";
            case AWSSimpleSystemsManagerCalendarStateClosed:
                return @"CLOSED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerGetCommandInvocationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commandId" : @"CommandId",
             @"instanceId" : @"InstanceId",
             @"pluginName" : @"PluginName",
             };
}

@end

@implementation AWSSimpleSystemsManagerGetCommandInvocationResult

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerCloudWatchOutputConfig class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandInvocationStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandInvocationStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Delayed"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandInvocationStatusDelayed);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandInvocationStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandInvocationStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"TimedOut"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandInvocationStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandInvocationStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Cancelling"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerCommandInvocationStatusCancelling);
        }
        return @(AWSSimpleSystemsManagerCommandInvocationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerCommandInvocationStatusPending:
                return @"Pending";
            case AWSSimpleSystemsManagerCommandInvocationStatusInProgress:
                return @"InProgress";
            case AWSSimpleSystemsManagerCommandInvocationStatusDelayed:
                return @"Delayed";
            case AWSSimpleSystemsManagerCommandInvocationStatusSuccess:
                return @"Success";
            case AWSSimpleSystemsManagerCommandInvocationStatusCancelled:
                return @"Cancelled";
            case AWSSimpleSystemsManagerCommandInvocationStatusTimedOut:
                return @"TimedOut";
            case AWSSimpleSystemsManagerCommandInvocationStatusFailed:
                return @"Failed";
            case AWSSimpleSystemsManagerCommandInvocationStatusCancelling:
                return @"Cancelling";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerGetConnectionStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"target" : @"Target",
             };
}

@end

@implementation AWSSimpleSystemsManagerGetConnectionStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             @"target" : @"Target",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Connected"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerConnectionStatusConnected);
        }
        if ([value caseInsensitiveCompare:@"NotConnected"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerConnectionStatusNotConnected);
        }
        return @(AWSSimpleSystemsManagerConnectionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerConnectionStatusConnected:
                return @"Connected";
            case AWSSimpleSystemsManagerConnectionStatusNotConnected:
                return @"NotConnected";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerGetDefaultPatchBaselineRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operatingSystem" : @"OperatingSystem",
             };
}

+ (NSValueTransformer *)operatingSystemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WINDOWS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemCentos);
        }
        if ([value caseInsensitiveCompare:@"ORACLE_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemOracleLinux);
        }
        if ([value caseInsensitiveCompare:@"DEBIAN"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemDebian);
        }
        return @(AWSSimpleSystemsManagerOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSimpleSystemsManagerOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSimpleSystemsManagerOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSimpleSystemsManagerOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemSuse:
                return @"SUSE";
            case AWSSimpleSystemsManagerOperatingSystemCentos:
                return @"CENTOS";
            case AWSSimpleSystemsManagerOperatingSystemOracleLinux:
                return @"ORACLE_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemDebian:
                return @"DEBIAN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerGetDefaultPatchBaselineResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             @"operatingSystem" : @"OperatingSystem",
             };
}

+ (NSValueTransformer *)operatingSystemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WINDOWS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemCentos);
        }
        if ([value caseInsensitiveCompare:@"ORACLE_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemOracleLinux);
        }
        if ([value caseInsensitiveCompare:@"DEBIAN"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemDebian);
        }
        return @(AWSSimpleSystemsManagerOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSimpleSystemsManagerOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSimpleSystemsManagerOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSimpleSystemsManagerOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemSuse:
                return @"SUSE";
            case AWSSimpleSystemsManagerOperatingSystemCentos:
                return @"CENTOS";
            case AWSSimpleSystemsManagerOperatingSystemOracleLinux:
                return @"ORACLE_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemDebian:
                return @"DEBIAN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerGetDeployablePatchSnapshotForInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"snapshotId" : @"SnapshotId",
             };
}

@end

@implementation AWSSimpleSystemsManagerGetDeployablePatchSnapshotForInstanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"product" : @"Product",
             @"snapshotDownloadUrl" : @"SnapshotDownloadUrl",
             @"snapshotId" : @"SnapshotId",
             };
}

@end

@implementation AWSSimpleSystemsManagerGetDocumentRequest

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
            return @(AWSSimpleSystemsManagerDocumentFormatYaml);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentFormatJson);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentFormatText);
        }
        return @(AWSSimpleSystemsManagerDocumentFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerDocumentFormatYaml:
                return @"YAML";
            case AWSSimpleSystemsManagerDocumentFormatJson:
                return @"JSON";
            case AWSSimpleSystemsManagerDocumentFormatText:
                return @"TEXT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerGetDocumentResult

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerAttachmentContent class]];
}

+ (NSValueTransformer *)documentFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"YAML"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentFormatYaml);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentFormatJson);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentFormatText);
        }
        return @(AWSSimpleSystemsManagerDocumentFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerDocumentFormatYaml:
                return @"YAML";
            case AWSSimpleSystemsManagerDocumentFormatJson:
                return @"JSON";
            case AWSSimpleSystemsManagerDocumentFormatText:
                return @"TEXT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)documentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Command"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeCommand);
        }
        if ([value caseInsensitiveCompare:@"Policy"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypePolicy);
        }
        if ([value caseInsensitiveCompare:@"Automation"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"Session"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeSession);
        }
        if ([value caseInsensitiveCompare:@"Package"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypePackage);
        }
        if ([value caseInsensitiveCompare:@"ApplicationConfiguration"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeApplicationConfiguration);
        }
        if ([value caseInsensitiveCompare:@"ApplicationConfigurationSchema"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeApplicationConfigurationSchema);
        }
        if ([value caseInsensitiveCompare:@"DeploymentStrategy"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeDeploymentStrategy);
        }
        if ([value caseInsensitiveCompare:@"ChangeCalendar"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentTypeChangeCalendar);
        }
        return @(AWSSimpleSystemsManagerDocumentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerDocumentTypeCommand:
                return @"Command";
            case AWSSimpleSystemsManagerDocumentTypePolicy:
                return @"Policy";
            case AWSSimpleSystemsManagerDocumentTypeAutomation:
                return @"Automation";
            case AWSSimpleSystemsManagerDocumentTypeSession:
                return @"Session";
            case AWSSimpleSystemsManagerDocumentTypePackage:
                return @"Package";
            case AWSSimpleSystemsManagerDocumentTypeApplicationConfiguration:
                return @"ApplicationConfiguration";
            case AWSSimpleSystemsManagerDocumentTypeApplicationConfigurationSchema:
                return @"ApplicationConfigurationSchema";
            case AWSSimpleSystemsManagerDocumentTypeDeploymentStrategy:
                return @"DeploymentStrategy";
            case AWSSimpleSystemsManagerDocumentTypeChangeCalendar:
                return @"ChangeCalendar";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requiresJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerDocumentRequires class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Creating"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentStatusActive);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentStatusFailed);
        }
        return @(AWSSimpleSystemsManagerDocumentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerDocumentStatusCreating:
                return @"Creating";
            case AWSSimpleSystemsManagerDocumentStatusActive:
                return @"Active";
            case AWSSimpleSystemsManagerDocumentStatusUpdating:
                return @"Updating";
            case AWSSimpleSystemsManagerDocumentStatusDeleting:
                return @"Deleting";
            case AWSSimpleSystemsManagerDocumentStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerGetInventoryRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerInventoryAggregator class]];
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerInventoryFilter class]];
}

+ (NSValueTransformer *)resultAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerResultAttribute class]];
}

@end

@implementation AWSSimpleSystemsManagerGetInventoryResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entities" : @"Entities",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)entitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerInventoryResultEntity class]];
}

@end

@implementation AWSSimpleSystemsManagerGetInventorySchemaRequest

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

@implementation AWSSimpleSystemsManagerGetInventorySchemaResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"schemas" : @"Schemas",
             };
}

+ (NSValueTransformer *)schemasJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerInventoryItemSchema class]];
}

@end

@implementation AWSSimpleSystemsManagerGetMaintenanceWindowExecutionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowExecutionId" : @"WindowExecutionId",
             };
}

@end

@implementation AWSSimpleSystemsManagerGetMaintenanceWindowExecutionResult

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
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"CANCELLING"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"SKIPPED_OVERLAPPING"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusSkippedOverlapping);
        }
        return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusPending:
                return @"PENDING";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusSuccess:
                return @"SUCCESS";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusFailed:
                return @"FAILED";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusTimedOut:
                return @"TIMED_OUT";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusCancelling:
                return @"CANCELLING";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusCancelled:
                return @"CANCELLED";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusSkippedOverlapping:
                return @"SKIPPED_OVERLAPPING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskInvocationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invocationId" : @"InvocationId",
             @"taskId" : @"TaskId",
             @"windowExecutionId" : @"WindowExecutionId",
             };
}

@end

@implementation AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskInvocationResult

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
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"CANCELLING"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"SKIPPED_OVERLAPPING"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusSkippedOverlapping);
        }
        return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusPending:
                return @"PENDING";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusSuccess:
                return @"SUCCESS";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusFailed:
                return @"FAILED";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusTimedOut:
                return @"TIMED_OUT";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusCancelling:
                return @"CANCELLING";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusCancelled:
                return @"CANCELLED";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusSkippedOverlapping:
                return @"SKIPPED_OVERLAPPING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taskTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUN_COMMAND"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeRunCommand);
        }
        if ([value caseInsensitiveCompare:@"AUTOMATION"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"STEP_FUNCTIONS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeStepFunctions);
        }
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeLambda);
        }
        return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeRunCommand:
                return @"RUN_COMMAND";
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeAutomation:
                return @"AUTOMATION";
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeStepFunctions:
                return @"STEP_FUNCTIONS";
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeLambda:
                return @"LAMBDA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"TaskId",
             @"windowExecutionId" : @"WindowExecutionId",
             };
}

@end

@implementation AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskResult

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
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"CANCELLING"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"SKIPPED_OVERLAPPING"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusSkippedOverlapping);
        }
        return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusPending:
                return @"PENDING";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusSuccess:
                return @"SUCCESS";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusFailed:
                return @"FAILED";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusTimedOut:
                return @"TIMED_OUT";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusCancelling:
                return @"CANCELLING";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusCancelled:
                return @"CANCELLED";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusSkippedOverlapping:
                return @"SKIPPED_OVERLAPPING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taskParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[AWSSimpleSystemsManagerMaintenanceWindowTaskParameterValueExpression class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUN_COMMAND"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeRunCommand);
        }
        if ([value caseInsensitiveCompare:@"AUTOMATION"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"STEP_FUNCTIONS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeStepFunctions);
        }
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeLambda);
        }
        return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeRunCommand:
                return @"RUN_COMMAND";
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeAutomation:
                return @"AUTOMATION";
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeStepFunctions:
                return @"STEP_FUNCTIONS";
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeLambda:
                return @"LAMBDA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerGetMaintenanceWindowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowId" : @"WindowId",
             };
}

@end

@implementation AWSSimpleSystemsManagerGetMaintenanceWindowResult

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

@implementation AWSSimpleSystemsManagerGetMaintenanceWindowTaskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowId" : @"WindowId",
             @"windowTaskId" : @"WindowTaskId",
             };
}

@end

@implementation AWSSimpleSystemsManagerGetMaintenanceWindowTaskResult

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerLoggingInfo class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTarget class]];
}

+ (NSValueTransformer *)taskInvocationParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerMaintenanceWindowTaskInvocationParameters class]];
}

+ (NSValueTransformer *)taskParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSimpleSystemsManagerMaintenanceWindowTaskParameterValueExpression class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)taskTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUN_COMMAND"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeRunCommand);
        }
        if ([value caseInsensitiveCompare:@"AUTOMATION"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"STEP_FUNCTIONS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeStepFunctions);
        }
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeLambda);
        }
        return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeRunCommand:
                return @"RUN_COMMAND";
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeAutomation:
                return @"AUTOMATION";
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeStepFunctions:
                return @"STEP_FUNCTIONS";
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeLambda:
                return @"LAMBDA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerGetOpsItemRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"opsItemId" : @"OpsItemId",
             };
}

@end

@implementation AWSSimpleSystemsManagerGetOpsItemResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"opsItem" : @"OpsItem",
             };
}

+ (NSValueTransformer *)opsItemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerOpsItem class]];
}

@end

@implementation AWSSimpleSystemsManagerGetOpsSummaryRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerOpsAggregator class]];
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerOpsFilter class]];
}

+ (NSValueTransformer *)resultAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerOpsResultAttribute class]];
}

@end

@implementation AWSSimpleSystemsManagerGetOpsSummaryResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entities" : @"Entities",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)entitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerOpsEntity class]];
}

@end

@implementation AWSSimpleSystemsManagerGetParameterHistoryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"name" : @"Name",
             @"nextToken" : @"NextToken",
             @"withDecryption" : @"WithDecryption",
             };
}

@end

@implementation AWSSimpleSystemsManagerGetParameterHistoryResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerParameterHistory class]];
}

@end

@implementation AWSSimpleSystemsManagerGetParameterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"withDecryption" : @"WithDecryption",
             };
}

@end

@implementation AWSSimpleSystemsManagerGetParameterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameter" : @"Parameter",
             };
}

+ (NSValueTransformer *)parameterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerParameter class]];
}

@end

@implementation AWSSimpleSystemsManagerGetParametersByPathRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerParameterStringFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerGetParametersByPathResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerParameter class]];
}

@end

@implementation AWSSimpleSystemsManagerGetParametersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"names" : @"Names",
             @"withDecryption" : @"WithDecryption",
             };
}

@end

@implementation AWSSimpleSystemsManagerGetParametersResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invalidParameters" : @"InvalidParameters",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerParameter class]];
}

@end

@implementation AWSSimpleSystemsManagerGetPatchBaselineForPatchGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operatingSystem" : @"OperatingSystem",
             @"patchGroup" : @"PatchGroup",
             };
}

+ (NSValueTransformer *)operatingSystemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WINDOWS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemCentos);
        }
        if ([value caseInsensitiveCompare:@"ORACLE_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemOracleLinux);
        }
        if ([value caseInsensitiveCompare:@"DEBIAN"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemDebian);
        }
        return @(AWSSimpleSystemsManagerOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSimpleSystemsManagerOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSimpleSystemsManagerOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSimpleSystemsManagerOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemSuse:
                return @"SUSE";
            case AWSSimpleSystemsManagerOperatingSystemCentos:
                return @"CENTOS";
            case AWSSimpleSystemsManagerOperatingSystemOracleLinux:
                return @"ORACLE_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemDebian:
                return @"DEBIAN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerGetPatchBaselineForPatchGroupResult

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
            return @(AWSSimpleSystemsManagerOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemCentos);
        }
        if ([value caseInsensitiveCompare:@"ORACLE_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemOracleLinux);
        }
        if ([value caseInsensitiveCompare:@"DEBIAN"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemDebian);
        }
        return @(AWSSimpleSystemsManagerOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSimpleSystemsManagerOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSimpleSystemsManagerOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSimpleSystemsManagerOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemSuse:
                return @"SUSE";
            case AWSSimpleSystemsManagerOperatingSystemCentos:
                return @"CENTOS";
            case AWSSimpleSystemsManagerOperatingSystemOracleLinux:
                return @"ORACLE_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemDebian:
                return @"DEBIAN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerGetPatchBaselineRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             };
}

@end

@implementation AWSSimpleSystemsManagerGetPatchBaselineResult

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerPatchRuleGroup class]];
}

+ (NSValueTransformer *)approvedPatchesComplianceLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelUnspecified);
        }
        return @(AWSSimpleSystemsManagerPatchComplianceLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerPatchComplianceLevelCritical:
                return @"CRITICAL";
            case AWSSimpleSystemsManagerPatchComplianceLevelHigh:
                return @"HIGH";
            case AWSSimpleSystemsManagerPatchComplianceLevelMedium:
                return @"MEDIUM";
            case AWSSimpleSystemsManagerPatchComplianceLevelLow:
                return @"LOW";
            case AWSSimpleSystemsManagerPatchComplianceLevelInformational:
                return @"INFORMATIONAL";
            case AWSSimpleSystemsManagerPatchComplianceLevelUnspecified:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerPatchFilterGroup class]];
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
            return @(AWSSimpleSystemsManagerOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemCentos);
        }
        if ([value caseInsensitiveCompare:@"ORACLE_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemOracleLinux);
        }
        if ([value caseInsensitiveCompare:@"DEBIAN"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemDebian);
        }
        return @(AWSSimpleSystemsManagerOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSimpleSystemsManagerOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSimpleSystemsManagerOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSimpleSystemsManagerOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemSuse:
                return @"SUSE";
            case AWSSimpleSystemsManagerOperatingSystemCentos:
                return @"CENTOS";
            case AWSSimpleSystemsManagerOperatingSystemOracleLinux:
                return @"ORACLE_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemDebian:
                return @"DEBIAN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rejectedPatchesActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALLOW_AS_DEPENDENCY"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchActionAllowAsDependency);
        }
        if ([value caseInsensitiveCompare:@"BLOCK"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchActionBlock);
        }
        return @(AWSSimpleSystemsManagerPatchActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerPatchActionAllowAsDependency:
                return @"ALLOW_AS_DEPENDENCY";
            case AWSSimpleSystemsManagerPatchActionBlock:
                return @"BLOCK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerPatchSource class]];
}

@end

@implementation AWSSimpleSystemsManagerGetServiceSettingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"settingId" : @"SettingId",
             };
}

@end

@implementation AWSSimpleSystemsManagerGetServiceSettingResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceSetting" : @"ServiceSetting",
             };
}

+ (NSValueTransformer *)serviceSettingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerServiceSetting class]];
}

@end

@implementation AWSSimpleSystemsManagerInstanceAggregatedAssociationOverview

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detailedStatus" : @"DetailedStatus",
             @"instanceAssociationStatusAggregatedCount" : @"InstanceAssociationStatusAggregatedCount",
             };
}

@end

@implementation AWSSimpleSystemsManagerInstanceAssociation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"associationVersion" : @"AssociationVersion",
             @"content" : @"Content",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSSimpleSystemsManagerInstanceAssociationOutputLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Location" : @"S3Location",
             };
}

+ (NSValueTransformer *)s3LocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerS3OutputLocation class]];
}

@end

@implementation AWSSimpleSystemsManagerInstanceAssociationOutputUrl

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3OutputUrl" : @"S3OutputUrl",
             };
}

+ (NSValueTransformer *)s3OutputUrlJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerS3OutputUrl class]];
}

@end

@implementation AWSSimpleSystemsManagerInstanceAssociationStatusInfo

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerInstanceAssociationOutputUrl class]];
}

@end

@implementation AWSSimpleSystemsManagerInstanceInformation

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerInstanceAggregatedAssociationOverview class]];
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
            return @(AWSSimpleSystemsManagerPingStatusOnline);
        }
        if ([value caseInsensitiveCompare:@"ConnectionLost"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPingStatusConnectionLost);
        }
        if ([value caseInsensitiveCompare:@"Inactive"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPingStatusInactive);
        }
        return @(AWSSimpleSystemsManagerPingStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerPingStatusOnline:
                return @"Online";
            case AWSSimpleSystemsManagerPingStatusConnectionLost:
                return @"ConnectionLost";
            case AWSSimpleSystemsManagerPingStatusInactive:
                return @"Inactive";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)platformTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPlatformTypeWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPlatformTypeLinux);
        }
        return @(AWSSimpleSystemsManagerPlatformTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerPlatformTypeWindows:
                return @"Windows";
            case AWSSimpleSystemsManagerPlatformTypeLinux:
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
            return @(AWSSimpleSystemsManagerResourceTypeManagedInstance);
        }
        if ([value caseInsensitiveCompare:@"Document"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerResourceTypeDocument);
        }
        if ([value caseInsensitiveCompare:@"EC2Instance"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerResourceTypeEC2Instance);
        }
        return @(AWSSimpleSystemsManagerResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerResourceTypeManagedInstance:
                return @"ManagedInstance";
            case AWSSimpleSystemsManagerResourceTypeDocument:
                return @"Document";
            case AWSSimpleSystemsManagerResourceTypeEC2Instance:
                return @"EC2Instance";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerInstanceInformationFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"valueSet" : @"valueSet",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InstanceIds"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerInstanceInformationFilterKeyInstanceIds);
        }
        if ([value caseInsensitiveCompare:@"AgentVersion"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerInstanceInformationFilterKeyAgentVersion);
        }
        if ([value caseInsensitiveCompare:@"PingStatus"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerInstanceInformationFilterKeyPingStatus);
        }
        if ([value caseInsensitiveCompare:@"PlatformTypes"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerInstanceInformationFilterKeyPlatformTypes);
        }
        if ([value caseInsensitiveCompare:@"ActivationIds"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerInstanceInformationFilterKeyActivationIds);
        }
        if ([value caseInsensitiveCompare:@"IamRole"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerInstanceInformationFilterKeyIamRole);
        }
        if ([value caseInsensitiveCompare:@"ResourceType"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerInstanceInformationFilterKeyResourceType);
        }
        if ([value caseInsensitiveCompare:@"AssociationStatus"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerInstanceInformationFilterKeyAssociationStatus);
        }
        return @(AWSSimpleSystemsManagerInstanceInformationFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerInstanceInformationFilterKeyInstanceIds:
                return @"InstanceIds";
            case AWSSimpleSystemsManagerInstanceInformationFilterKeyAgentVersion:
                return @"AgentVersion";
            case AWSSimpleSystemsManagerInstanceInformationFilterKeyPingStatus:
                return @"PingStatus";
            case AWSSimpleSystemsManagerInstanceInformationFilterKeyPlatformTypes:
                return @"PlatformTypes";
            case AWSSimpleSystemsManagerInstanceInformationFilterKeyActivationIds:
                return @"ActivationIds";
            case AWSSimpleSystemsManagerInstanceInformationFilterKeyIamRole:
                return @"IamRole";
            case AWSSimpleSystemsManagerInstanceInformationFilterKeyResourceType:
                return @"ResourceType";
            case AWSSimpleSystemsManagerInstanceInformationFilterKeyAssociationStatus:
                return @"AssociationStatus";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerInstanceInformationStringFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

@end

@implementation AWSSimpleSystemsManagerInstancePatchState

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
            return @(AWSSimpleSystemsManagerPatchOperationTypeScan);
        }
        if ([value caseInsensitiveCompare:@"Install"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchOperationTypeInstall);
        }
        return @(AWSSimpleSystemsManagerPatchOperationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerPatchOperationTypeScan:
                return @"Scan";
            case AWSSimpleSystemsManagerPatchOperationTypeInstall:
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
            return @(AWSSimpleSystemsManagerRebootOptionRebootIfNeeded);
        }
        if ([value caseInsensitiveCompare:@"NoReboot"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerRebootOptionNoReboot);
        }
        return @(AWSSimpleSystemsManagerRebootOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerRebootOptionRebootIfNeeded:
                return @"RebootIfNeeded";
            case AWSSimpleSystemsManagerRebootOptionNoReboot:
                return @"NoReboot";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerInstancePatchStateFilter

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
            return @(AWSSimpleSystemsManagerInstancePatchStateOperatorTypeEqual);
        }
        if ([value caseInsensitiveCompare:@"NotEqual"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerInstancePatchStateOperatorTypeNotEqual);
        }
        if ([value caseInsensitiveCompare:@"LessThan"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerInstancePatchStateOperatorTypeLessThan);
        }
        if ([value caseInsensitiveCompare:@"GreaterThan"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerInstancePatchStateOperatorTypeGreaterThan);
        }
        return @(AWSSimpleSystemsManagerInstancePatchStateOperatorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerInstancePatchStateOperatorTypeEqual:
                return @"Equal";
            case AWSSimpleSystemsManagerInstancePatchStateOperatorTypeNotEqual:
                return @"NotEqual";
            case AWSSimpleSystemsManagerInstancePatchStateOperatorTypeLessThan:
                return @"LessThan";
            case AWSSimpleSystemsManagerInstancePatchStateOperatorTypeGreaterThan:
                return @"GreaterThan";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerInventoryAggregator

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aggregators" : @"Aggregators",
             @"expression" : @"Expression",
             @"groups" : @"Groups",
             };
}

+ (NSValueTransformer *)aggregatorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerInventoryAggregator class]];
}

+ (NSValueTransformer *)groupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerInventoryGroup class]];
}

@end

@implementation AWSSimpleSystemsManagerInventoryDeletionStatusItem

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerInventoryDeletionSummary class]];
}

+ (NSValueTransformer *)lastStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerInventoryDeletionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerInventoryDeletionStatusComplete);
        }
        return @(AWSSimpleSystemsManagerInventoryDeletionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerInventoryDeletionStatusInProgress:
                return @"InProgress";
            case AWSSimpleSystemsManagerInventoryDeletionStatusComplete:
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

@implementation AWSSimpleSystemsManagerInventoryDeletionSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"remainingCount" : @"RemainingCount",
             @"summaryItems" : @"SummaryItems",
             @"totalCount" : @"TotalCount",
             };
}

+ (NSValueTransformer *)summaryItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerInventoryDeletionSummaryItem class]];
}

@end

@implementation AWSSimpleSystemsManagerInventoryDeletionSummaryItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"count" : @"Count",
             @"remainingCount" : @"RemainingCount",
             @"version" : @"Version",
             };
}

@end

@implementation AWSSimpleSystemsManagerInventoryFilter

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
            return @(AWSSimpleSystemsManagerInventoryQueryOperatorTypeEqual);
        }
        if ([value caseInsensitiveCompare:@"NotEqual"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerInventoryQueryOperatorTypeNotEqual);
        }
        if ([value caseInsensitiveCompare:@"BeginWith"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerInventoryQueryOperatorTypeBeginWith);
        }
        if ([value caseInsensitiveCompare:@"LessThan"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerInventoryQueryOperatorTypeLessThan);
        }
        if ([value caseInsensitiveCompare:@"GreaterThan"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerInventoryQueryOperatorTypeGreaterThan);
        }
        if ([value caseInsensitiveCompare:@"Exists"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerInventoryQueryOperatorTypeExists);
        }
        return @(AWSSimpleSystemsManagerInventoryQueryOperatorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerInventoryQueryOperatorTypeEqual:
                return @"Equal";
            case AWSSimpleSystemsManagerInventoryQueryOperatorTypeNotEqual:
                return @"NotEqual";
            case AWSSimpleSystemsManagerInventoryQueryOperatorTypeBeginWith:
                return @"BeginWith";
            case AWSSimpleSystemsManagerInventoryQueryOperatorTypeLessThan:
                return @"LessThan";
            case AWSSimpleSystemsManagerInventoryQueryOperatorTypeGreaterThan:
                return @"GreaterThan";
            case AWSSimpleSystemsManagerInventoryQueryOperatorTypeExists:
                return @"Exists";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerInventoryGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerInventoryFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerInventoryItem

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

@implementation AWSSimpleSystemsManagerInventoryItemAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataType" : @"DataType",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)dataTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"string"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerInventoryAttributeDataTypeString);
        }
        if ([value caseInsensitiveCompare:@"number"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerInventoryAttributeDataTypeNumber);
        }
        return @(AWSSimpleSystemsManagerInventoryAttributeDataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerInventoryAttributeDataTypeString:
                return @"string";
            case AWSSimpleSystemsManagerInventoryAttributeDataTypeNumber:
                return @"number";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerInventoryItemSchema

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"displayName" : @"DisplayName",
             @"typeName" : @"TypeName",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerInventoryItemAttribute class]];
}

@end

@implementation AWSSimpleSystemsManagerInventoryResultEntity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"Data",
             @"identifier" : @"Id",
             };
}

+ (NSValueTransformer *)dataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSimpleSystemsManagerInventoryResultItem class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSSimpleSystemsManagerInventoryResultItem

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

@implementation AWSSimpleSystemsManagerLabelParameterVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labels" : @"Labels",
             @"name" : @"Name",
             @"parameterVersion" : @"ParameterVersion",
             };
}

@end

@implementation AWSSimpleSystemsManagerLabelParameterVersionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invalidLabels" : @"InvalidLabels",
             @"parameterVersion" : @"ParameterVersion",
             };
}

@end

@implementation AWSSimpleSystemsManagerListAssociationVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSimpleSystemsManagerListAssociationVersionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationVersions" : @"AssociationVersions",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)associationVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerAssociationVersionInfo class]];
}

@end

@implementation AWSSimpleSystemsManagerListAssociationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationFilterList" : @"AssociationFilterList",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)associationFilterListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerAssociationFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerListAssociationsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associations" : @"Associations",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)associationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerAssociation class]];
}

@end

@implementation AWSSimpleSystemsManagerListCommandInvocationsRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerCommandFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerListCommandInvocationsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commandInvocations" : @"CommandInvocations",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)commandInvocationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerCommandInvocation class]];
}

@end

@implementation AWSSimpleSystemsManagerListCommandsRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerCommandFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerListCommandsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commands" : @"Commands",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)commandsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerCommand class]];
}

@end

@implementation AWSSimpleSystemsManagerListComplianceItemsRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerComplianceStringFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerListComplianceItemsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"complianceItems" : @"ComplianceItems",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)complianceItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerComplianceItem class]];
}

@end

@implementation AWSSimpleSystemsManagerListComplianceSummariesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerComplianceStringFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerListComplianceSummariesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"complianceSummaryItems" : @"ComplianceSummaryItems",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)complianceSummaryItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerComplianceSummaryItem class]];
}

@end

@implementation AWSSimpleSystemsManagerListDocumentVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"name" : @"Name",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSimpleSystemsManagerListDocumentVersionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentVersions" : @"DocumentVersions",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)documentVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerDocumentVersionInfo class]];
}

@end

@implementation AWSSimpleSystemsManagerListDocumentsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentFilterList" : @"DocumentFilterList",
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)documentFilterListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerDocumentFilter class]];
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerDocumentKeyValuesFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerListDocumentsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentIdentifiers" : @"DocumentIdentifiers",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)documentIdentifiersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerDocumentIdentifier class]];
}

@end

@implementation AWSSimpleSystemsManagerListInventoryEntriesRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerInventoryFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerListInventoryEntriesResult

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

@implementation AWSSimpleSystemsManagerListResourceComplianceSummariesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerComplianceStringFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerListResourceComplianceSummariesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"resourceComplianceSummaryItems" : @"ResourceComplianceSummaryItems",
             };
}

+ (NSValueTransformer *)resourceComplianceSummaryItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerResourceComplianceSummaryItem class]];
}

@end

@implementation AWSSimpleSystemsManagerListResourceDataSyncRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"syncType" : @"SyncType",
             };
}

@end

@implementation AWSSimpleSystemsManagerListResourceDataSyncResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"resourceDataSyncItems" : @"ResourceDataSyncItems",
             };
}

+ (NSValueTransformer *)resourceDataSyncItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerResourceDataSyncItem class]];
}

@end

@implementation AWSSimpleSystemsManagerListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Document"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerResourceTypeForTaggingDocument);
        }
        if ([value caseInsensitiveCompare:@"ManagedInstance"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerResourceTypeForTaggingManagedInstance);
        }
        if ([value caseInsensitiveCompare:@"MaintenanceWindow"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerResourceTypeForTaggingMaintenanceWindow);
        }
        if ([value caseInsensitiveCompare:@"Parameter"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerResourceTypeForTaggingParameter);
        }
        if ([value caseInsensitiveCompare:@"PatchBaseline"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerResourceTypeForTaggingPatchBaseline);
        }
        if ([value caseInsensitiveCompare:@"OpsItem"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerResourceTypeForTaggingOpsItem);
        }
        return @(AWSSimpleSystemsManagerResourceTypeForTaggingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerResourceTypeForTaggingDocument:
                return @"Document";
            case AWSSimpleSystemsManagerResourceTypeForTaggingManagedInstance:
                return @"ManagedInstance";
            case AWSSimpleSystemsManagerResourceTypeForTaggingMaintenanceWindow:
                return @"MaintenanceWindow";
            case AWSSimpleSystemsManagerResourceTypeForTaggingParameter:
                return @"Parameter";
            case AWSSimpleSystemsManagerResourceTypeForTaggingPatchBaseline:
                return @"PatchBaseline";
            case AWSSimpleSystemsManagerResourceTypeForTaggingOpsItem:
                return @"OpsItem";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerListTagsForResourceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagList" : @"TagList",
             };
}

+ (NSValueTransformer *)tagListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTag class]];
}

@end

@implementation AWSSimpleSystemsManagerLoggingInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3BucketName" : @"S3BucketName",
             @"s3KeyPrefix" : @"S3KeyPrefix",
             @"s3Region" : @"S3Region",
             };
}

@end

@implementation AWSSimpleSystemsManagerMaintenanceWindowAutomationParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentVersion" : @"DocumentVersion",
             @"parameters" : @"Parameters",
             };
}

@end

@implementation AWSSimpleSystemsManagerMaintenanceWindowExecution

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
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"CANCELLING"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"SKIPPED_OVERLAPPING"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusSkippedOverlapping);
        }
        return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusPending:
                return @"PENDING";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusSuccess:
                return @"SUCCESS";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusFailed:
                return @"FAILED";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusTimedOut:
                return @"TIMED_OUT";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusCancelling:
                return @"CANCELLING";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusCancelled:
                return @"CANCELLED";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusSkippedOverlapping:
                return @"SKIPPED_OVERLAPPING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerMaintenanceWindowExecutionTaskIdentity

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
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"CANCELLING"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"SKIPPED_OVERLAPPING"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusSkippedOverlapping);
        }
        return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusPending:
                return @"PENDING";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusSuccess:
                return @"SUCCESS";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusFailed:
                return @"FAILED";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusTimedOut:
                return @"TIMED_OUT";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusCancelling:
                return @"CANCELLING";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusCancelled:
                return @"CANCELLED";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusSkippedOverlapping:
                return @"SKIPPED_OVERLAPPING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taskTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUN_COMMAND"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeRunCommand);
        }
        if ([value caseInsensitiveCompare:@"AUTOMATION"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"STEP_FUNCTIONS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeStepFunctions);
        }
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeLambda);
        }
        return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeRunCommand:
                return @"RUN_COMMAND";
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeAutomation:
                return @"AUTOMATION";
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeStepFunctions:
                return @"STEP_FUNCTIONS";
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeLambda:
                return @"LAMBDA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerMaintenanceWindowExecutionTaskInvocationIdentity

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
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"CANCELLING"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"SKIPPED_OVERLAPPING"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusSkippedOverlapping);
        }
        return @(AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusPending:
                return @"PENDING";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusSuccess:
                return @"SUCCESS";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusFailed:
                return @"FAILED";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusTimedOut:
                return @"TIMED_OUT";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusCancelling:
                return @"CANCELLING";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusCancelled:
                return @"CANCELLED";
            case AWSSimpleSystemsManagerMaintenanceWindowExecutionStatusSkippedOverlapping:
                return @"SKIPPED_OVERLAPPING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taskTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUN_COMMAND"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeRunCommand);
        }
        if ([value caseInsensitiveCompare:@"AUTOMATION"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"STEP_FUNCTIONS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeStepFunctions);
        }
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeLambda);
        }
        return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeRunCommand:
                return @"RUN_COMMAND";
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeAutomation:
                return @"AUTOMATION";
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeStepFunctions:
                return @"STEP_FUNCTIONS";
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeLambda:
                return @"LAMBDA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerMaintenanceWindowFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

@end

@implementation AWSSimpleSystemsManagerMaintenanceWindowIdentity

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
             @"scheduleTimezone" : @"ScheduleTimezone",
             @"startDate" : @"StartDate",
             @"windowId" : @"WindowId",
             };
}

@end

@implementation AWSSimpleSystemsManagerMaintenanceWindowIdentityForTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"windowId" : @"WindowId",
             };
}

@end

@implementation AWSSimpleSystemsManagerMaintenanceWindowLambdaParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientContext" : @"ClientContext",
             @"payload" : @"Payload",
             @"qualifier" : @"Qualifier",
             };
}

@end

@implementation AWSSimpleSystemsManagerMaintenanceWindowRunCommandParameters

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerCloudWatchOutputConfig class]];
}

+ (NSValueTransformer *)documentHashTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Sha256"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentHashTypeSha256);
        }
        if ([value caseInsensitiveCompare:@"Sha1"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentHashTypeSha1);
        }
        return @(AWSSimpleSystemsManagerDocumentHashTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerDocumentHashTypeSha256:
                return @"Sha256";
            case AWSSimpleSystemsManagerDocumentHashTypeSha1:
                return @"Sha1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)notificationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerNotificationConfig class]];
}

@end

@implementation AWSSimpleSystemsManagerMaintenanceWindowStepFunctionsParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"input" : @"Input",
             @"name" : @"Name",
             };
}

@end

@implementation AWSSimpleSystemsManagerMaintenanceWindowTarget

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
            return @(AWSSimpleSystemsManagerMaintenanceWindowResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_GROUP"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowResourceTypeResourceGroup);
        }
        return @(AWSSimpleSystemsManagerMaintenanceWindowResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerMaintenanceWindowResourceTypeInstance:
                return @"INSTANCE";
            case AWSSimpleSystemsManagerMaintenanceWindowResourceTypeResourceGroup:
                return @"RESOURCE_GROUP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTarget class]];
}

@end

@implementation AWSSimpleSystemsManagerMaintenanceWindowTask

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerLoggingInfo class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTarget class]];
}

+ (NSValueTransformer *)taskParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSimpleSystemsManagerMaintenanceWindowTaskParameterValueExpression class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUN_COMMAND"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeRunCommand);
        }
        if ([value caseInsensitiveCompare:@"AUTOMATION"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"STEP_FUNCTIONS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeStepFunctions);
        }
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeLambda);
        }
        return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeRunCommand:
                return @"RUN_COMMAND";
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeAutomation:
                return @"AUTOMATION";
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeStepFunctions:
                return @"STEP_FUNCTIONS";
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeLambda:
                return @"LAMBDA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerMaintenanceWindowTaskInvocationParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automation" : @"Automation",
             @"lambda" : @"Lambda",
             @"runCommand" : @"RunCommand",
             @"stepFunctions" : @"StepFunctions",
             };
}

+ (NSValueTransformer *)automationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerMaintenanceWindowAutomationParameters class]];
}

+ (NSValueTransformer *)lambdaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerMaintenanceWindowLambdaParameters class]];
}

+ (NSValueTransformer *)runCommandJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerMaintenanceWindowRunCommandParameters class]];
}

+ (NSValueTransformer *)stepFunctionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerMaintenanceWindowStepFunctionsParameters class]];
}

@end

@implementation AWSSimpleSystemsManagerMaintenanceWindowTaskParameterValueExpression

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"values" : @"Values",
             };
}

@end

@implementation AWSSimpleSystemsManagerModifyDocumentPermissionRequest

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
            return @(AWSSimpleSystemsManagerDocumentPermissionTypeShare);
        }
        return @(AWSSimpleSystemsManagerDocumentPermissionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerDocumentPermissionTypeShare:
                return @"Share";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerModifyDocumentPermissionResponse

@end

@implementation AWSSimpleSystemsManagerNonCompliantSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nonCompliantCount" : @"NonCompliantCount",
             @"severitySummary" : @"SeveritySummary",
             };
}

+ (NSValueTransformer *)severitySummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerSeveritySummary class]];
}

@end

@implementation AWSSimpleSystemsManagerNotificationConfig

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
            return @(AWSSimpleSystemsManagerNotificationTypeCommand);
        }
        if ([value caseInsensitiveCompare:@"Invocation"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerNotificationTypeInvocation);
        }
        return @(AWSSimpleSystemsManagerNotificationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerNotificationTypeCommand:
                return @"Command";
            case AWSSimpleSystemsManagerNotificationTypeInvocation:
                return @"Invocation";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerOpsAggregator

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerOpsAggregator class]];
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerOpsFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerOpsEntity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"Data",
             @"identifier" : @"Id",
             };
}

+ (NSValueTransformer *)dataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSimpleSystemsManagerOpsEntityItem class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSSimpleSystemsManagerOpsEntityItem

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

@implementation AWSSimpleSystemsManagerOpsFilter

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
            return @(AWSSimpleSystemsManagerOpsFilterOperatorTypeEqual);
        }
        if ([value caseInsensitiveCompare:@"NotEqual"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsFilterOperatorTypeNotEqual);
        }
        if ([value caseInsensitiveCompare:@"BeginWith"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsFilterOperatorTypeBeginWith);
        }
        if ([value caseInsensitiveCompare:@"LessThan"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsFilterOperatorTypeLessThan);
        }
        if ([value caseInsensitiveCompare:@"GreaterThan"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsFilterOperatorTypeGreaterThan);
        }
        if ([value caseInsensitiveCompare:@"Exists"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsFilterOperatorTypeExists);
        }
        return @(AWSSimpleSystemsManagerOpsFilterOperatorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerOpsFilterOperatorTypeEqual:
                return @"Equal";
            case AWSSimpleSystemsManagerOpsFilterOperatorTypeNotEqual:
                return @"NotEqual";
            case AWSSimpleSystemsManagerOpsFilterOperatorTypeBeginWith:
                return @"BeginWith";
            case AWSSimpleSystemsManagerOpsFilterOperatorTypeLessThan:
                return @"LessThan";
            case AWSSimpleSystemsManagerOpsFilterOperatorTypeGreaterThan:
                return @"GreaterThan";
            case AWSSimpleSystemsManagerOpsFilterOperatorTypeExists:
                return @"Exists";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerOpsItem

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerOpsItemNotification class]];
}

+ (NSValueTransformer *)operationalDataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSimpleSystemsManagerOpsItemDataValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)relatedOpsItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerRelatedOpsItem class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Open"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemStatusOpen);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Resolved"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemStatusResolved);
        }
        return @(AWSSimpleSystemsManagerOpsItemStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerOpsItemStatusOpen:
                return @"Open";
            case AWSSimpleSystemsManagerOpsItemStatusInProgress:
                return @"InProgress";
            case AWSSimpleSystemsManagerOpsItemStatusResolved:
                return @"Resolved";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerOpsItemDataValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SearchableString"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemDataTypeSearchableString);
        }
        if ([value caseInsensitiveCompare:@"String"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemDataTypeString);
        }
        return @(AWSSimpleSystemsManagerOpsItemDataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerOpsItemDataTypeSearchableString:
                return @"SearchableString";
            case AWSSimpleSystemsManagerOpsItemDataTypeString:
                return @"String";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerOpsItemFilter

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
            return @(AWSSimpleSystemsManagerOpsItemFilterKeyStatus);
        }
        if ([value caseInsensitiveCompare:@"CreatedBy"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemFilterKeyCreatedBy);
        }
        if ([value caseInsensitiveCompare:@"Source"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemFilterKeySource);
        }
        if ([value caseInsensitiveCompare:@"Priority"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemFilterKeyPriority);
        }
        if ([value caseInsensitiveCompare:@"Title"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemFilterKeyTitle);
        }
        if ([value caseInsensitiveCompare:@"OpsItemId"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemFilterKeyOpsItemId);
        }
        if ([value caseInsensitiveCompare:@"CreatedTime"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemFilterKeyCreatedTime);
        }
        if ([value caseInsensitiveCompare:@"LastModifiedTime"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemFilterKeyLastModifiedTime);
        }
        if ([value caseInsensitiveCompare:@"OperationalData"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemFilterKeyOperationalData);
        }
        if ([value caseInsensitiveCompare:@"OperationalDataKey"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemFilterKeyOperationalDataKey);
        }
        if ([value caseInsensitiveCompare:@"OperationalDataValue"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemFilterKeyOperationalDataValue);
        }
        if ([value caseInsensitiveCompare:@"ResourceId"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemFilterKeyResourceId);
        }
        if ([value caseInsensitiveCompare:@"AutomationId"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemFilterKeyAutomationId);
        }
        if ([value caseInsensitiveCompare:@"Category"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemFilterKeyCategory);
        }
        if ([value caseInsensitiveCompare:@"Severity"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemFilterKeySeverity);
        }
        return @(AWSSimpleSystemsManagerOpsItemFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerOpsItemFilterKeyStatus:
                return @"Status";
            case AWSSimpleSystemsManagerOpsItemFilterKeyCreatedBy:
                return @"CreatedBy";
            case AWSSimpleSystemsManagerOpsItemFilterKeySource:
                return @"Source";
            case AWSSimpleSystemsManagerOpsItemFilterKeyPriority:
                return @"Priority";
            case AWSSimpleSystemsManagerOpsItemFilterKeyTitle:
                return @"Title";
            case AWSSimpleSystemsManagerOpsItemFilterKeyOpsItemId:
                return @"OpsItemId";
            case AWSSimpleSystemsManagerOpsItemFilterKeyCreatedTime:
                return @"CreatedTime";
            case AWSSimpleSystemsManagerOpsItemFilterKeyLastModifiedTime:
                return @"LastModifiedTime";
            case AWSSimpleSystemsManagerOpsItemFilterKeyOperationalData:
                return @"OperationalData";
            case AWSSimpleSystemsManagerOpsItemFilterKeyOperationalDataKey:
                return @"OperationalDataKey";
            case AWSSimpleSystemsManagerOpsItemFilterKeyOperationalDataValue:
                return @"OperationalDataValue";
            case AWSSimpleSystemsManagerOpsItemFilterKeyResourceId:
                return @"ResourceId";
            case AWSSimpleSystemsManagerOpsItemFilterKeyAutomationId:
                return @"AutomationId";
            case AWSSimpleSystemsManagerOpsItemFilterKeyCategory:
                return @"Category";
            case AWSSimpleSystemsManagerOpsItemFilterKeySeverity:
                return @"Severity";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)operatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Equal"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemFilterOperatorEqual);
        }
        if ([value caseInsensitiveCompare:@"Contains"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemFilterOperatorContains);
        }
        if ([value caseInsensitiveCompare:@"GreaterThan"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemFilterOperatorGreaterThan);
        }
        if ([value caseInsensitiveCompare:@"LessThan"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemFilterOperatorLessThan);
        }
        return @(AWSSimpleSystemsManagerOpsItemFilterOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerOpsItemFilterOperatorEqual:
                return @"Equal";
            case AWSSimpleSystemsManagerOpsItemFilterOperatorContains:
                return @"Contains";
            case AWSSimpleSystemsManagerOpsItemFilterOperatorGreaterThan:
                return @"GreaterThan";
            case AWSSimpleSystemsManagerOpsItemFilterOperatorLessThan:
                return @"LessThan";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerOpsItemNotification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             };
}

@end

@implementation AWSSimpleSystemsManagerOpsItemSummary

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
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSimpleSystemsManagerOpsItemDataValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Open"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemStatusOpen);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Resolved"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemStatusResolved);
        }
        return @(AWSSimpleSystemsManagerOpsItemStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerOpsItemStatusOpen:
                return @"Open";
            case AWSSimpleSystemsManagerOpsItemStatusInProgress:
                return @"InProgress";
            case AWSSimpleSystemsManagerOpsItemStatusResolved:
                return @"Resolved";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerOpsResultAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"typeName" : @"TypeName",
             };
}

@end

@implementation AWSSimpleSystemsManagerOutputSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputSourceId" : @"OutputSourceId",
             @"outputSourceType" : @"OutputSourceType",
             };
}

@end

@implementation AWSSimpleSystemsManagerParameter

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
            return @(AWSSimpleSystemsManagerParameterTypeString);
        }
        if ([value caseInsensitiveCompare:@"StringList"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParameterTypeStringList);
        }
        if ([value caseInsensitiveCompare:@"SecureString"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParameterTypeSecureString);
        }
        return @(AWSSimpleSystemsManagerParameterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerParameterTypeString:
                return @"String";
            case AWSSimpleSystemsManagerParameterTypeStringList:
                return @"StringList";
            case AWSSimpleSystemsManagerParameterTypeSecureString:
                return @"SecureString";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerParameterHistory

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerParameterInlinePolicy class]];
}

+ (NSValueTransformer *)tierJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParameterTierStandard);
        }
        if ([value caseInsensitiveCompare:@"Advanced"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParameterTierAdvanced);
        }
        if ([value caseInsensitiveCompare:@"Intelligent-Tiering"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParameterTierIntelligentTiering);
        }
        return @(AWSSimpleSystemsManagerParameterTierUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerParameterTierStandard:
                return @"Standard";
            case AWSSimpleSystemsManagerParameterTierAdvanced:
                return @"Advanced";
            case AWSSimpleSystemsManagerParameterTierIntelligentTiering:
                return @"Intelligent-Tiering";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"String"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParameterTypeString);
        }
        if ([value caseInsensitiveCompare:@"StringList"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParameterTypeStringList);
        }
        if ([value caseInsensitiveCompare:@"SecureString"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParameterTypeSecureString);
        }
        return @(AWSSimpleSystemsManagerParameterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerParameterTypeString:
                return @"String";
            case AWSSimpleSystemsManagerParameterTypeStringList:
                return @"StringList";
            case AWSSimpleSystemsManagerParameterTypeSecureString:
                return @"SecureString";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerParameterInlinePolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyStatus" : @"PolicyStatus",
             @"policyText" : @"PolicyText",
             @"policyType" : @"PolicyType",
             };
}

@end

@implementation AWSSimpleSystemsManagerParameterMetadata

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerParameterInlinePolicy class]];
}

+ (NSValueTransformer *)tierJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParameterTierStandard);
        }
        if ([value caseInsensitiveCompare:@"Advanced"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParameterTierAdvanced);
        }
        if ([value caseInsensitiveCompare:@"Intelligent-Tiering"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParameterTierIntelligentTiering);
        }
        return @(AWSSimpleSystemsManagerParameterTierUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerParameterTierStandard:
                return @"Standard";
            case AWSSimpleSystemsManagerParameterTierAdvanced:
                return @"Advanced";
            case AWSSimpleSystemsManagerParameterTierIntelligentTiering:
                return @"Intelligent-Tiering";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"String"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParameterTypeString);
        }
        if ([value caseInsensitiveCompare:@"StringList"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParameterTypeStringList);
        }
        if ([value caseInsensitiveCompare:@"SecureString"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParameterTypeSecureString);
        }
        return @(AWSSimpleSystemsManagerParameterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerParameterTypeString:
                return @"String";
            case AWSSimpleSystemsManagerParameterTypeStringList:
                return @"StringList";
            case AWSSimpleSystemsManagerParameterTypeSecureString:
                return @"SecureString";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerParameterStringFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"option" : @"Option",
             @"values" : @"Values",
             };
}

@end

@implementation AWSSimpleSystemsManagerParametersFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParametersFilterKeyName);
        }
        if ([value caseInsensitiveCompare:@"Type"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParametersFilterKeyType);
        }
        if ([value caseInsensitiveCompare:@"KeyId"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParametersFilterKeyKeyId);
        }
        return @(AWSSimpleSystemsManagerParametersFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerParametersFilterKeyName:
                return @"Name";
            case AWSSimpleSystemsManagerParametersFilterKeyType:
                return @"Type";
            case AWSSimpleSystemsManagerParametersFilterKeyKeyId:
                return @"KeyId";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerPatch

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

@implementation AWSSimpleSystemsManagerPatchBaselineIdentity

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
            return @(AWSSimpleSystemsManagerOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemCentos);
        }
        if ([value caseInsensitiveCompare:@"ORACLE_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemOracleLinux);
        }
        if ([value caseInsensitiveCompare:@"DEBIAN"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemDebian);
        }
        return @(AWSSimpleSystemsManagerOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSimpleSystemsManagerOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSimpleSystemsManagerOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSimpleSystemsManagerOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemSuse:
                return @"SUSE";
            case AWSSimpleSystemsManagerOperatingSystemCentos:
                return @"CENTOS";
            case AWSSimpleSystemsManagerOperatingSystemOracleLinux:
                return @"ORACLE_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemDebian:
                return @"DEBIAN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerPatchComplianceData

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
            return @(AWSSimpleSystemsManagerPatchComplianceDataStateInstalled);
        }
        if ([value caseInsensitiveCompare:@"INSTALLED_OTHER"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceDataStateInstalledOther);
        }
        if ([value caseInsensitiveCompare:@"INSTALLED_PENDING_REBOOT"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceDataStateInstalledPendingReboot);
        }
        if ([value caseInsensitiveCompare:@"INSTALLED_REJECTED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceDataStateInstalledRejected);
        }
        if ([value caseInsensitiveCompare:@"MISSING"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceDataStateMissing);
        }
        if ([value caseInsensitiveCompare:@"NOT_APPLICABLE"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceDataStateNotApplicable);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceDataStateFailed);
        }
        return @(AWSSimpleSystemsManagerPatchComplianceDataStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerPatchComplianceDataStateInstalled:
                return @"INSTALLED";
            case AWSSimpleSystemsManagerPatchComplianceDataStateInstalledOther:
                return @"INSTALLED_OTHER";
            case AWSSimpleSystemsManagerPatchComplianceDataStateInstalledPendingReboot:
                return @"INSTALLED_PENDING_REBOOT";
            case AWSSimpleSystemsManagerPatchComplianceDataStateInstalledRejected:
                return @"INSTALLED_REJECTED";
            case AWSSimpleSystemsManagerPatchComplianceDataStateMissing:
                return @"MISSING";
            case AWSSimpleSystemsManagerPatchComplianceDataStateNotApplicable:
                return @"NOT_APPLICABLE";
            case AWSSimpleSystemsManagerPatchComplianceDataStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerPatchFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PATCH_SET"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchFilterKeyPatchSet);
        }
        if ([value caseInsensitiveCompare:@"PRODUCT"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchFilterKeyProduct);
        }
        if ([value caseInsensitiveCompare:@"PRODUCT_FAMILY"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchFilterKeyProductFamily);
        }
        if ([value caseInsensitiveCompare:@"CLASSIFICATION"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchFilterKeyClassification);
        }
        if ([value caseInsensitiveCompare:@"MSRC_SEVERITY"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchFilterKeyMsrcSeverity);
        }
        if ([value caseInsensitiveCompare:@"PATCH_ID"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchFilterKeyPatchId);
        }
        if ([value caseInsensitiveCompare:@"SECTION"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchFilterKeySection);
        }
        if ([value caseInsensitiveCompare:@"PRIORITY"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchFilterKeyPriority);
        }
        if ([value caseInsensitiveCompare:@"SEVERITY"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchFilterKeySeverity);
        }
        return @(AWSSimpleSystemsManagerPatchFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerPatchFilterKeyPatchSet:
                return @"PATCH_SET";
            case AWSSimpleSystemsManagerPatchFilterKeyProduct:
                return @"PRODUCT";
            case AWSSimpleSystemsManagerPatchFilterKeyProductFamily:
                return @"PRODUCT_FAMILY";
            case AWSSimpleSystemsManagerPatchFilterKeyClassification:
                return @"CLASSIFICATION";
            case AWSSimpleSystemsManagerPatchFilterKeyMsrcSeverity:
                return @"MSRC_SEVERITY";
            case AWSSimpleSystemsManagerPatchFilterKeyPatchId:
                return @"PATCH_ID";
            case AWSSimpleSystemsManagerPatchFilterKeySection:
                return @"SECTION";
            case AWSSimpleSystemsManagerPatchFilterKeyPriority:
                return @"PRIORITY";
            case AWSSimpleSystemsManagerPatchFilterKeySeverity:
                return @"SEVERITY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerPatchFilterGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"patchFilters" : @"PatchFilters",
             };
}

+ (NSValueTransformer *)patchFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerPatchFilter class]];
}

@end

@implementation AWSSimpleSystemsManagerPatchGroupPatchBaselineMapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineIdentity" : @"BaselineIdentity",
             @"patchGroup" : @"PatchGroup",
             };
}

+ (NSValueTransformer *)baselineIdentityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerPatchBaselineIdentity class]];
}

@end

@implementation AWSSimpleSystemsManagerPatchOrchestratorFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

@end

@implementation AWSSimpleSystemsManagerPatchRule

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
            return @(AWSSimpleSystemsManagerPatchComplianceLevelCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelUnspecified);
        }
        return @(AWSSimpleSystemsManagerPatchComplianceLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerPatchComplianceLevelCritical:
                return @"CRITICAL";
            case AWSSimpleSystemsManagerPatchComplianceLevelHigh:
                return @"HIGH";
            case AWSSimpleSystemsManagerPatchComplianceLevelMedium:
                return @"MEDIUM";
            case AWSSimpleSystemsManagerPatchComplianceLevelLow:
                return @"LOW";
            case AWSSimpleSystemsManagerPatchComplianceLevelInformational:
                return @"INFORMATIONAL";
            case AWSSimpleSystemsManagerPatchComplianceLevelUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)patchFilterGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerPatchFilterGroup class]];
}

@end

@implementation AWSSimpleSystemsManagerPatchRuleGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"patchRules" : @"PatchRules",
             };
}

+ (NSValueTransformer *)patchRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerPatchRule class]];
}

@end

@implementation AWSSimpleSystemsManagerPatchSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configuration" : @"Configuration",
             @"name" : @"Name",
             @"products" : @"Products",
             };
}

@end

@implementation AWSSimpleSystemsManagerPatchStatus

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
            return @(AWSSimpleSystemsManagerPatchComplianceLevelCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelUnspecified);
        }
        return @(AWSSimpleSystemsManagerPatchComplianceLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerPatchComplianceLevelCritical:
                return @"CRITICAL";
            case AWSSimpleSystemsManagerPatchComplianceLevelHigh:
                return @"HIGH";
            case AWSSimpleSystemsManagerPatchComplianceLevelMedium:
                return @"MEDIUM";
            case AWSSimpleSystemsManagerPatchComplianceLevelLow:
                return @"LOW";
            case AWSSimpleSystemsManagerPatchComplianceLevelInformational:
                return @"INFORMATIONAL";
            case AWSSimpleSystemsManagerPatchComplianceLevelUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)deploymentStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"APPROVED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchDeploymentStatusApproved);
        }
        if ([value caseInsensitiveCompare:@"PENDING_APPROVAL"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchDeploymentStatusPendingApproval);
        }
        if ([value caseInsensitiveCompare:@"EXPLICIT_APPROVED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchDeploymentStatusExplicitApproved);
        }
        if ([value caseInsensitiveCompare:@"EXPLICIT_REJECTED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchDeploymentStatusExplicitRejected);
        }
        return @(AWSSimpleSystemsManagerPatchDeploymentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerPatchDeploymentStatusApproved:
                return @"APPROVED";
            case AWSSimpleSystemsManagerPatchDeploymentStatusPendingApproval:
                return @"PENDING_APPROVAL";
            case AWSSimpleSystemsManagerPatchDeploymentStatusExplicitApproved:
                return @"EXPLICIT_APPROVED";
            case AWSSimpleSystemsManagerPatchDeploymentStatusExplicitRejected:
                return @"EXPLICIT_REJECTED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerProgressCounters

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

@implementation AWSSimpleSystemsManagerPutComplianceItemsRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerComplianceExecutionSummary class]];
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerComplianceItemEntry class]];
}

+ (NSValueTransformer *)uploadTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLETE"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceUploadTypeComplete);
        }
        if ([value caseInsensitiveCompare:@"PARTIAL"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceUploadTypePartial);
        }
        return @(AWSSimpleSystemsManagerComplianceUploadTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerComplianceUploadTypeComplete:
                return @"COMPLETE";
            case AWSSimpleSystemsManagerComplianceUploadTypePartial:
                return @"PARTIAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerPutComplianceItemsResult

@end

@implementation AWSSimpleSystemsManagerPutInventoryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"items" : @"Items",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerInventoryItem class]];
}

@end

@implementation AWSSimpleSystemsManagerPutInventoryResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSSimpleSystemsManagerPutParameterRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTag class]];
}

+ (NSValueTransformer *)tierJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParameterTierStandard);
        }
        if ([value caseInsensitiveCompare:@"Advanced"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParameterTierAdvanced);
        }
        if ([value caseInsensitiveCompare:@"Intelligent-Tiering"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParameterTierIntelligentTiering);
        }
        return @(AWSSimpleSystemsManagerParameterTierUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerParameterTierStandard:
                return @"Standard";
            case AWSSimpleSystemsManagerParameterTierAdvanced:
                return @"Advanced";
            case AWSSimpleSystemsManagerParameterTierIntelligentTiering:
                return @"Intelligent-Tiering";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"String"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParameterTypeString);
        }
        if ([value caseInsensitiveCompare:@"StringList"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParameterTypeStringList);
        }
        if ([value caseInsensitiveCompare:@"SecureString"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParameterTypeSecureString);
        }
        return @(AWSSimpleSystemsManagerParameterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerParameterTypeString:
                return @"String";
            case AWSSimpleSystemsManagerParameterTypeStringList:
                return @"StringList";
            case AWSSimpleSystemsManagerParameterTypeSecureString:
                return @"SecureString";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerPutParameterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tier" : @"Tier",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)tierJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParameterTierStandard);
        }
        if ([value caseInsensitiveCompare:@"Advanced"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParameterTierAdvanced);
        }
        if ([value caseInsensitiveCompare:@"Intelligent-Tiering"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerParameterTierIntelligentTiering);
        }
        return @(AWSSimpleSystemsManagerParameterTierUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerParameterTierStandard:
                return @"Standard";
            case AWSSimpleSystemsManagerParameterTierAdvanced:
                return @"Advanced";
            case AWSSimpleSystemsManagerParameterTierIntelligentTiering:
                return @"Intelligent-Tiering";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerRegisterDefaultPatchBaselineRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             };
}

@end

@implementation AWSSimpleSystemsManagerRegisterDefaultPatchBaselineResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             };
}

@end

@implementation AWSSimpleSystemsManagerRegisterPatchBaselineForPatchGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             @"patchGroup" : @"PatchGroup",
             };
}

@end

@implementation AWSSimpleSystemsManagerRegisterPatchBaselineForPatchGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             @"patchGroup" : @"PatchGroup",
             };
}

@end

@implementation AWSSimpleSystemsManagerRegisterTargetWithMaintenanceWindowRequest

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
            return @(AWSSimpleSystemsManagerMaintenanceWindowResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_GROUP"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowResourceTypeResourceGroup);
        }
        return @(AWSSimpleSystemsManagerMaintenanceWindowResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerMaintenanceWindowResourceTypeInstance:
                return @"INSTANCE";
            case AWSSimpleSystemsManagerMaintenanceWindowResourceTypeResourceGroup:
                return @"RESOURCE_GROUP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTarget class]];
}

@end

@implementation AWSSimpleSystemsManagerRegisterTargetWithMaintenanceWindowResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowTargetId" : @"WindowTargetId",
             };
}

@end

@implementation AWSSimpleSystemsManagerRegisterTaskWithMaintenanceWindowRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerLoggingInfo class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTarget class]];
}

+ (NSValueTransformer *)taskInvocationParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerMaintenanceWindowTaskInvocationParameters class]];
}

+ (NSValueTransformer *)taskParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSimpleSystemsManagerMaintenanceWindowTaskParameterValueExpression class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)taskTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUN_COMMAND"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeRunCommand);
        }
        if ([value caseInsensitiveCompare:@"AUTOMATION"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"STEP_FUNCTIONS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeStepFunctions);
        }
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeLambda);
        }
        return @(AWSSimpleSystemsManagerMaintenanceWindowTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeRunCommand:
                return @"RUN_COMMAND";
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeAutomation:
                return @"AUTOMATION";
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeStepFunctions:
                return @"STEP_FUNCTIONS";
            case AWSSimpleSystemsManagerMaintenanceWindowTaskTypeLambda:
                return @"LAMBDA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerRegisterTaskWithMaintenanceWindowResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowTaskId" : @"WindowTaskId",
             };
}

@end

@implementation AWSSimpleSystemsManagerRelatedOpsItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"opsItemId" : @"OpsItemId",
             };
}

@end

@implementation AWSSimpleSystemsManagerRemoveTagsFromResourceRequest

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
            return @(AWSSimpleSystemsManagerResourceTypeForTaggingDocument);
        }
        if ([value caseInsensitiveCompare:@"ManagedInstance"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerResourceTypeForTaggingManagedInstance);
        }
        if ([value caseInsensitiveCompare:@"MaintenanceWindow"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerResourceTypeForTaggingMaintenanceWindow);
        }
        if ([value caseInsensitiveCompare:@"Parameter"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerResourceTypeForTaggingParameter);
        }
        if ([value caseInsensitiveCompare:@"PatchBaseline"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerResourceTypeForTaggingPatchBaseline);
        }
        if ([value caseInsensitiveCompare:@"OpsItem"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerResourceTypeForTaggingOpsItem);
        }
        return @(AWSSimpleSystemsManagerResourceTypeForTaggingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerResourceTypeForTaggingDocument:
                return @"Document";
            case AWSSimpleSystemsManagerResourceTypeForTaggingManagedInstance:
                return @"ManagedInstance";
            case AWSSimpleSystemsManagerResourceTypeForTaggingMaintenanceWindow:
                return @"MaintenanceWindow";
            case AWSSimpleSystemsManagerResourceTypeForTaggingParameter:
                return @"Parameter";
            case AWSSimpleSystemsManagerResourceTypeForTaggingPatchBaseline:
                return @"PatchBaseline";
            case AWSSimpleSystemsManagerResourceTypeForTaggingOpsItem:
                return @"OpsItem";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerRemoveTagsFromResourceResult

@end

@implementation AWSSimpleSystemsManagerResetServiceSettingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"settingId" : @"SettingId",
             };
}

@end

@implementation AWSSimpleSystemsManagerResetServiceSettingResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceSetting" : @"ServiceSetting",
             };
}

+ (NSValueTransformer *)serviceSettingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerServiceSetting class]];
}

@end

@implementation AWSSimpleSystemsManagerResolvedTargets

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameterValues" : @"ParameterValues",
             @"truncated" : @"Truncated",
             };
}

@end

@implementation AWSSimpleSystemsManagerResourceComplianceSummaryItem

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerCompliantSummary class]];
}

+ (NSValueTransformer *)executionSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerComplianceExecutionSummary class]];
}

+ (NSValueTransformer *)nonCompliantSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerNonCompliantSummary class]];
}

+ (NSValueTransformer *)overallSeverityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceSeverityInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceSeverityUnspecified);
        }
        return @(AWSSimpleSystemsManagerComplianceSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerComplianceSeverityCritical:
                return @"CRITICAL";
            case AWSSimpleSystemsManagerComplianceSeverityHigh:
                return @"HIGH";
            case AWSSimpleSystemsManagerComplianceSeverityMedium:
                return @"MEDIUM";
            case AWSSimpleSystemsManagerComplianceSeverityLow:
                return @"LOW";
            case AWSSimpleSystemsManagerComplianceSeverityInformational:
                return @"INFORMATIONAL";
            case AWSSimpleSystemsManagerComplianceSeverityUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLIANT"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceStatusCompliant);
        }
        if ([value caseInsensitiveCompare:@"NON_COMPLIANT"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerComplianceStatusNonCompliant);
        }
        return @(AWSSimpleSystemsManagerComplianceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerComplianceStatusCompliant:
                return @"COMPLIANT";
            case AWSSimpleSystemsManagerComplianceStatusNonCompliant:
                return @"NON_COMPLIANT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerResourceDataSyncAwsOrganizationsSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"organizationSourceType" : @"OrganizationSourceType",
             @"organizationalUnits" : @"OrganizationalUnits",
             };
}

+ (NSValueTransformer *)organizationalUnitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerResourceDataSyncOrganizationalUnit class]];
}

@end

@implementation AWSSimpleSystemsManagerResourceDataSyncDestinationDataSharing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationDataSharingType" : @"DestinationDataSharingType",
             };
}

@end

@implementation AWSSimpleSystemsManagerResourceDataSyncItem

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
            return @(AWSSimpleSystemsManagerLastResourceDataSyncStatusSuccessful);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerLastResourceDataSyncStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerLastResourceDataSyncStatusInProgress);
        }
        return @(AWSSimpleSystemsManagerLastResourceDataSyncStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerLastResourceDataSyncStatusSuccessful:
                return @"Successful";
            case AWSSimpleSystemsManagerLastResourceDataSyncStatusFailed:
                return @"Failed";
            case AWSSimpleSystemsManagerLastResourceDataSyncStatusInProgress:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerResourceDataSyncS3Destination class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerResourceDataSyncSourceWithState class]];
}

@end

@implementation AWSSimpleSystemsManagerResourceDataSyncOrganizationalUnit

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"organizationalUnitId" : @"OrganizationalUnitId",
             };
}

@end

@implementation AWSSimpleSystemsManagerResourceDataSyncS3Destination

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerResourceDataSyncDestinationDataSharing class]];
}

+ (NSValueTransformer *)syncFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"JsonSerDe"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerResourceDataSyncS3FormatJsonSerDe);
        }
        return @(AWSSimpleSystemsManagerResourceDataSyncS3FormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerResourceDataSyncS3FormatJsonSerDe:
                return @"JsonSerDe";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerResourceDataSyncSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsOrganizationsSource" : @"AwsOrganizationsSource",
             @"includeFutureRegions" : @"IncludeFutureRegions",
             @"sourceRegions" : @"SourceRegions",
             @"sourceType" : @"SourceType",
             };
}

+ (NSValueTransformer *)awsOrganizationsSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerResourceDataSyncAwsOrganizationsSource class]];
}

@end

@implementation AWSSimpleSystemsManagerResourceDataSyncSourceWithState

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerResourceDataSyncAwsOrganizationsSource class]];
}

@end

@implementation AWSSimpleSystemsManagerResultAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"typeName" : @"TypeName",
             };
}

@end

@implementation AWSSimpleSystemsManagerResumeSessionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sessionId" : @"SessionId",
             };
}

@end

@implementation AWSSimpleSystemsManagerResumeSessionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sessionId" : @"SessionId",
             @"streamUrl" : @"StreamUrl",
             @"tokenValue" : @"TokenValue",
             };
}

@end

@implementation AWSSimpleSystemsManagerS3OutputLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputS3BucketName" : @"OutputS3BucketName",
             @"outputS3KeyPrefix" : @"OutputS3KeyPrefix",
             @"outputS3Region" : @"OutputS3Region",
             };
}

@end

@implementation AWSSimpleSystemsManagerS3OutputUrl

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputUrl" : @"OutputUrl",
             };
}

@end

@implementation AWSSimpleSystemsManagerScheduledWindowExecution

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"executionTime" : @"ExecutionTime",
             @"name" : @"Name",
             @"windowId" : @"WindowId",
             };
}

@end

@implementation AWSSimpleSystemsManagerSendAutomationSignalRequest

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
            return @(AWSSimpleSystemsManagerSignalTypeApprove);
        }
        if ([value caseInsensitiveCompare:@"Reject"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerSignalTypeReject);
        }
        if ([value caseInsensitiveCompare:@"StartStep"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerSignalTypeStartStep);
        }
        if ([value caseInsensitiveCompare:@"StopStep"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerSignalTypeStopStep);
        }
        if ([value caseInsensitiveCompare:@"Resume"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerSignalTypeResume);
        }
        return @(AWSSimpleSystemsManagerSignalTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerSignalTypeApprove:
                return @"Approve";
            case AWSSimpleSystemsManagerSignalTypeReject:
                return @"Reject";
            case AWSSimpleSystemsManagerSignalTypeStartStep:
                return @"StartStep";
            case AWSSimpleSystemsManagerSignalTypeStopStep:
                return @"StopStep";
            case AWSSimpleSystemsManagerSignalTypeResume:
                return @"Resume";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerSendAutomationSignalResult

@end

@implementation AWSSimpleSystemsManagerSendCommandRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerCloudWatchOutputConfig class]];
}

+ (NSValueTransformer *)documentHashTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Sha256"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentHashTypeSha256);
        }
        if ([value caseInsensitiveCompare:@"Sha1"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentHashTypeSha1);
        }
        return @(AWSSimpleSystemsManagerDocumentHashTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerDocumentHashTypeSha256:
                return @"Sha256";
            case AWSSimpleSystemsManagerDocumentHashTypeSha1:
                return @"Sha1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)notificationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerNotificationConfig class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTarget class]];
}

@end

@implementation AWSSimpleSystemsManagerSendCommandResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"command" : @"Command",
             };
}

+ (NSValueTransformer *)commandJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerCommand class]];
}

@end

@implementation AWSSimpleSystemsManagerServiceSetting

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

@implementation AWSSimpleSystemsManagerSession

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerSessionManagerOutputUrl class]];
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
            return @(AWSSimpleSystemsManagerSessionStatusConnected);
        }
        if ([value caseInsensitiveCompare:@"Connecting"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerSessionStatusConnecting);
        }
        if ([value caseInsensitiveCompare:@"Disconnected"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerSessionStatusDisconnected);
        }
        if ([value caseInsensitiveCompare:@"Terminated"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerSessionStatusTerminated);
        }
        if ([value caseInsensitiveCompare:@"Terminating"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerSessionStatusTerminating);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerSessionStatusFailed);
        }
        return @(AWSSimpleSystemsManagerSessionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerSessionStatusConnected:
                return @"Connected";
            case AWSSimpleSystemsManagerSessionStatusConnecting:
                return @"Connecting";
            case AWSSimpleSystemsManagerSessionStatusDisconnected:
                return @"Disconnected";
            case AWSSimpleSystemsManagerSessionStatusTerminated:
                return @"Terminated";
            case AWSSimpleSystemsManagerSessionStatusTerminating:
                return @"Terminating";
            case AWSSimpleSystemsManagerSessionStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerSessionFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InvokedAfter"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerSessionFilterKeyInvokedAfter);
        }
        if ([value caseInsensitiveCompare:@"InvokedBefore"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerSessionFilterKeyInvokedBefore);
        }
        if ([value caseInsensitiveCompare:@"Target"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerSessionFilterKeyTarget);
        }
        if ([value caseInsensitiveCompare:@"Owner"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerSessionFilterKeyOwner);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerSessionFilterKeyStatus);
        }
        return @(AWSSimpleSystemsManagerSessionFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerSessionFilterKeyInvokedAfter:
                return @"InvokedAfter";
            case AWSSimpleSystemsManagerSessionFilterKeyInvokedBefore:
                return @"InvokedBefore";
            case AWSSimpleSystemsManagerSessionFilterKeyTarget:
                return @"Target";
            case AWSSimpleSystemsManagerSessionFilterKeyOwner:
                return @"Owner";
            case AWSSimpleSystemsManagerSessionFilterKeyStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerSessionManagerOutputUrl

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchOutputUrl" : @"CloudWatchOutputUrl",
             @"s3OutputUrl" : @"S3OutputUrl",
             };
}

@end

@implementation AWSSimpleSystemsManagerSeveritySummary

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

@implementation AWSSimpleSystemsManagerStartAssociationsOnceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationIds" : @"AssociationIds",
             };
}

@end

@implementation AWSSimpleSystemsManagerStartAssociationsOnceResult

@end

@implementation AWSSimpleSystemsManagerStartAutomationExecutionRequest

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
            return @(AWSSimpleSystemsManagerExecutionModeAuto);
        }
        if ([value caseInsensitiveCompare:@"Interactive"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerExecutionModeInteractive);
        }
        return @(AWSSimpleSystemsManagerExecutionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerExecutionModeAuto:
                return @"Auto";
            case AWSSimpleSystemsManagerExecutionModeInteractive:
                return @"Interactive";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTag class]];
}

+ (NSValueTransformer *)targetLocationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTargetLocation class]];
}

+ (NSValueTransformer *)targetMapsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[java.util.List<NSString> class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTarget class]];
}

@end

@implementation AWSSimpleSystemsManagerStartAutomationExecutionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automationExecutionId" : @"AutomationExecutionId",
             };
}

@end

@implementation AWSSimpleSystemsManagerStartSessionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentName" : @"DocumentName",
             @"parameters" : @"Parameters",
             @"target" : @"Target",
             };
}

@end

@implementation AWSSimpleSystemsManagerStartSessionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sessionId" : @"SessionId",
             @"streamUrl" : @"StreamUrl",
             @"tokenValue" : @"TokenValue",
             };
}

@end

@implementation AWSSimpleSystemsManagerStepExecution

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerFailureDetails class]];
}

+ (NSValueTransformer *)stepStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Waiting"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionStatusWaiting);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"TimedOut"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"Cancelling"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAutomationExecutionStatusFailed);
        }
        return @(AWSSimpleSystemsManagerAutomationExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerAutomationExecutionStatusPending:
                return @"Pending";
            case AWSSimpleSystemsManagerAutomationExecutionStatusInProgress:
                return @"InProgress";
            case AWSSimpleSystemsManagerAutomationExecutionStatusWaiting:
                return @"Waiting";
            case AWSSimpleSystemsManagerAutomationExecutionStatusSuccess:
                return @"Success";
            case AWSSimpleSystemsManagerAutomationExecutionStatusTimedOut:
                return @"TimedOut";
            case AWSSimpleSystemsManagerAutomationExecutionStatusCancelling:
                return @"Cancelling";
            case AWSSimpleSystemsManagerAutomationExecutionStatusCancelled:
                return @"Cancelled";
            case AWSSimpleSystemsManagerAutomationExecutionStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerTargetLocation class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTarget class]];
}

@end

@implementation AWSSimpleSystemsManagerStepExecutionFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"StartTimeBefore"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerStepExecutionFilterKeyStartTimeBefore);
        }
        if ([value caseInsensitiveCompare:@"StartTimeAfter"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerStepExecutionFilterKeyStartTimeAfter);
        }
        if ([value caseInsensitiveCompare:@"StepExecutionStatus"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerStepExecutionFilterKeyStepExecutionStatus);
        }
        if ([value caseInsensitiveCompare:@"StepExecutionId"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerStepExecutionFilterKeyStepExecutionId);
        }
        if ([value caseInsensitiveCompare:@"StepName"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerStepExecutionFilterKeyStepName);
        }
        if ([value caseInsensitiveCompare:@"Action"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerStepExecutionFilterKeyAction);
        }
        return @(AWSSimpleSystemsManagerStepExecutionFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerStepExecutionFilterKeyStartTimeBefore:
                return @"StartTimeBefore";
            case AWSSimpleSystemsManagerStepExecutionFilterKeyStartTimeAfter:
                return @"StartTimeAfter";
            case AWSSimpleSystemsManagerStepExecutionFilterKeyStepExecutionStatus:
                return @"StepExecutionStatus";
            case AWSSimpleSystemsManagerStepExecutionFilterKeyStepExecutionId:
                return @"StepExecutionId";
            case AWSSimpleSystemsManagerStepExecutionFilterKeyStepName:
                return @"StepName";
            case AWSSimpleSystemsManagerStepExecutionFilterKeyAction:
                return @"Action";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerStopAutomationExecutionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automationExecutionId" : @"AutomationExecutionId",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerStopTypeComplete);
        }
        if ([value caseInsensitiveCompare:@"Cancel"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerStopTypeCancel);
        }
        return @(AWSSimpleSystemsManagerStopTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerStopTypeComplete:
                return @"Complete";
            case AWSSimpleSystemsManagerStopTypeCancel:
                return @"Cancel";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerStopAutomationExecutionResult

@end

@implementation AWSSimpleSystemsManagerTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSSimpleSystemsManagerTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

@end

@implementation AWSSimpleSystemsManagerTargetLocation

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

@implementation AWSSimpleSystemsManagerTerminateSessionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sessionId" : @"SessionId",
             };
}

@end

@implementation AWSSimpleSystemsManagerTerminateSessionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sessionId" : @"SessionId",
             };
}

@end

@implementation AWSSimpleSystemsManagerUpdateAssociationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
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
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationComplianceSeverityUnspecified);
        }
        return @(AWSSimpleSystemsManagerAssociationComplianceSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerAssociationComplianceSeverityCritical:
                return @"CRITICAL";
            case AWSSimpleSystemsManagerAssociationComplianceSeverityHigh:
                return @"HIGH";
            case AWSSimpleSystemsManagerAssociationComplianceSeverityMedium:
                return @"MEDIUM";
            case AWSSimpleSystemsManagerAssociationComplianceSeverityLow:
                return @"LOW";
            case AWSSimpleSystemsManagerAssociationComplianceSeverityUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerInstanceAssociationOutputLocation class]];
}

+ (NSValueTransformer *)syncComplianceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationSyncComplianceAuto);
        }
        if ([value caseInsensitiveCompare:@"MANUAL"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerAssociationSyncComplianceManual);
        }
        return @(AWSSimpleSystemsManagerAssociationSyncComplianceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerAssociationSyncComplianceAuto:
                return @"AUTO";
            case AWSSimpleSystemsManagerAssociationSyncComplianceManual:
                return @"MANUAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTarget class]];
}

@end

@implementation AWSSimpleSystemsManagerUpdateAssociationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationDescription" : @"AssociationDescription",
             };
}

+ (NSValueTransformer *)associationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerAssociationDescription class]];
}

@end

@implementation AWSSimpleSystemsManagerUpdateAssociationStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationStatus" : @"AssociationStatus",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)associationStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerAssociationStatus class]];
}

@end

@implementation AWSSimpleSystemsManagerUpdateAssociationStatusResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationDescription" : @"AssociationDescription",
             };
}

+ (NSValueTransformer *)associationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerAssociationDescription class]];
}

@end

@implementation AWSSimpleSystemsManagerUpdateDocumentDefaultVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentVersion" : @"DocumentVersion",
             @"name" : @"Name",
             };
}

@end

@implementation AWSSimpleSystemsManagerUpdateDocumentDefaultVersionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             };
}

+ (NSValueTransformer *)detailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerDocumentDefaultVersionDescription class]];
}

@end

@implementation AWSSimpleSystemsManagerUpdateDocumentRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerAttachmentsSource class]];
}

+ (NSValueTransformer *)documentFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"YAML"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentFormatYaml);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentFormatJson);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerDocumentFormatText);
        }
        return @(AWSSimpleSystemsManagerDocumentFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerDocumentFormatYaml:
                return @"YAML";
            case AWSSimpleSystemsManagerDocumentFormatJson:
                return @"JSON";
            case AWSSimpleSystemsManagerDocumentFormatText:
                return @"TEXT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerUpdateDocumentResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentDescription" : @"DocumentDescription",
             };
}

+ (NSValueTransformer *)documentDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerDocumentDescription class]];
}

@end

@implementation AWSSimpleSystemsManagerUpdateMaintenanceWindowRequest

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
             @"scheduleTimezone" : @"ScheduleTimezone",
             @"startDate" : @"StartDate",
             @"windowId" : @"WindowId",
             };
}

@end

@implementation AWSSimpleSystemsManagerUpdateMaintenanceWindowResult

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
             @"scheduleTimezone" : @"ScheduleTimezone",
             @"startDate" : @"StartDate",
             @"windowId" : @"WindowId",
             };
}

@end

@implementation AWSSimpleSystemsManagerUpdateMaintenanceWindowTargetRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTarget class]];
}

@end

@implementation AWSSimpleSystemsManagerUpdateMaintenanceWindowTargetResult

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTarget class]];
}

@end

@implementation AWSSimpleSystemsManagerUpdateMaintenanceWindowTaskRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerLoggingInfo class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTarget class]];
}

+ (NSValueTransformer *)taskInvocationParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerMaintenanceWindowTaskInvocationParameters class]];
}

+ (NSValueTransformer *)taskParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSimpleSystemsManagerMaintenanceWindowTaskParameterValueExpression class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSSimpleSystemsManagerUpdateMaintenanceWindowTaskResult

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerLoggingInfo class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerTarget class]];
}

+ (NSValueTransformer *)taskInvocationParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerMaintenanceWindowTaskInvocationParameters class]];
}

+ (NSValueTransformer *)taskParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSimpleSystemsManagerMaintenanceWindowTaskParameterValueExpression class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSSimpleSystemsManagerUpdateManagedInstanceRoleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"iamRole" : @"IamRole",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSSimpleSystemsManagerUpdateManagedInstanceRoleResult

@end

@implementation AWSSimpleSystemsManagerUpdateOpsItemRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerOpsItemNotification class]];
}

+ (NSValueTransformer *)operationalDataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSimpleSystemsManagerOpsItemDataValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)relatedOpsItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerRelatedOpsItem class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Open"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemStatusOpen);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Resolved"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOpsItemStatusResolved);
        }
        return @(AWSSimpleSystemsManagerOpsItemStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerOpsItemStatusOpen:
                return @"Open";
            case AWSSimpleSystemsManagerOpsItemStatusInProgress:
                return @"InProgress";
            case AWSSimpleSystemsManagerOpsItemStatusResolved:
                return @"Resolved";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSimpleSystemsManagerUpdateOpsItemResponse

@end

@implementation AWSSimpleSystemsManagerUpdatePatchBaselineRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerPatchRuleGroup class]];
}

+ (NSValueTransformer *)approvedPatchesComplianceLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelUnspecified);
        }
        return @(AWSSimpleSystemsManagerPatchComplianceLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerPatchComplianceLevelCritical:
                return @"CRITICAL";
            case AWSSimpleSystemsManagerPatchComplianceLevelHigh:
                return @"HIGH";
            case AWSSimpleSystemsManagerPatchComplianceLevelMedium:
                return @"MEDIUM";
            case AWSSimpleSystemsManagerPatchComplianceLevelLow:
                return @"LOW";
            case AWSSimpleSystemsManagerPatchComplianceLevelInformational:
                return @"INFORMATIONAL";
            case AWSSimpleSystemsManagerPatchComplianceLevelUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)globalFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerPatchFilterGroup class]];
}

+ (NSValueTransformer *)rejectedPatchesActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALLOW_AS_DEPENDENCY"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchActionAllowAsDependency);
        }
        if ([value caseInsensitiveCompare:@"BLOCK"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchActionBlock);
        }
        return @(AWSSimpleSystemsManagerPatchActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerPatchActionAllowAsDependency:
                return @"ALLOW_AS_DEPENDENCY";
            case AWSSimpleSystemsManagerPatchActionBlock:
                return @"BLOCK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerPatchSource class]];
}

@end

@implementation AWSSimpleSystemsManagerUpdatePatchBaselineResult

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerPatchRuleGroup class]];
}

+ (NSValueTransformer *)approvedPatchesComplianceLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchComplianceLevelUnspecified);
        }
        return @(AWSSimpleSystemsManagerPatchComplianceLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerPatchComplianceLevelCritical:
                return @"CRITICAL";
            case AWSSimpleSystemsManagerPatchComplianceLevelHigh:
                return @"HIGH";
            case AWSSimpleSystemsManagerPatchComplianceLevelMedium:
                return @"MEDIUM";
            case AWSSimpleSystemsManagerPatchComplianceLevelLow:
                return @"LOW";
            case AWSSimpleSystemsManagerPatchComplianceLevelInformational:
                return @"INFORMATIONAL";
            case AWSSimpleSystemsManagerPatchComplianceLevelUnspecified:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerPatchFilterGroup class]];
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
            return @(AWSSimpleSystemsManagerOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemCentos);
        }
        if ([value caseInsensitiveCompare:@"ORACLE_LINUX"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemOracleLinux);
        }
        if ([value caseInsensitiveCompare:@"DEBIAN"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerOperatingSystemDebian);
        }
        return @(AWSSimpleSystemsManagerOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSimpleSystemsManagerOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSimpleSystemsManagerOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSimpleSystemsManagerOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemSuse:
                return @"SUSE";
            case AWSSimpleSystemsManagerOperatingSystemCentos:
                return @"CENTOS";
            case AWSSimpleSystemsManagerOperatingSystemOracleLinux:
                return @"ORACLE_LINUX";
            case AWSSimpleSystemsManagerOperatingSystemDebian:
                return @"DEBIAN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rejectedPatchesActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALLOW_AS_DEPENDENCY"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchActionAllowAsDependency);
        }
        if ([value caseInsensitiveCompare:@"BLOCK"] == NSOrderedSame) {
            return @(AWSSimpleSystemsManagerPatchActionBlock);
        }
        return @(AWSSimpleSystemsManagerPatchActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSimpleSystemsManagerPatchActionAllowAsDependency:
                return @"ALLOW_AS_DEPENDENCY";
            case AWSSimpleSystemsManagerPatchActionBlock:
                return @"BLOCK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleSystemsManagerPatchSource class]];
}

@end

@implementation AWSSimpleSystemsManagerUpdateResourceDataSyncRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"syncName" : @"SyncName",
             @"syncSource" : @"SyncSource",
             @"syncType" : @"SyncType",
             };
}

+ (NSValueTransformer *)syncSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleSystemsManagerResourceDataSyncSource class]];
}

@end

@implementation AWSSimpleSystemsManagerUpdateResourceDataSyncResult

@end

@implementation AWSSimpleSystemsManagerUpdateServiceSettingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"settingId" : @"SettingId",
             @"settingValue" : @"SettingValue",
             };
}

@end

@implementation AWSSimpleSystemsManagerUpdateServiceSettingResult

@end
