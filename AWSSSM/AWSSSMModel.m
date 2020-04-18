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

#import "AWSSSMModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSSSMErrorDomain = @"com.amazonaws.AWSSSMErrorDomain";

@implementation AWSSSMAccountSharingInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"sharedDocumentVersion" : @"SharedDocumentVersion",
             };
}

@end

@implementation AWSSSMActivation

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTag class]];
}

@end

@implementation AWSSSMAddTagsToResourceRequest

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
            return @(AWSSSMResourceTypeForTaggingDocument);
        }
        if ([value caseInsensitiveCompare:@"ManagedInstance"] == NSOrderedSame) {
            return @(AWSSSMResourceTypeForTaggingManagedInstance);
        }
        if ([value caseInsensitiveCompare:@"MaintenanceWindow"] == NSOrderedSame) {
            return @(AWSSSMResourceTypeForTaggingMaintenanceWindow);
        }
        if ([value caseInsensitiveCompare:@"Parameter"] == NSOrderedSame) {
            return @(AWSSSMResourceTypeForTaggingParameter);
        }
        if ([value caseInsensitiveCompare:@"PatchBaseline"] == NSOrderedSame) {
            return @(AWSSSMResourceTypeForTaggingPatchBaseline);
        }
        if ([value caseInsensitiveCompare:@"OpsItem"] == NSOrderedSame) {
            return @(AWSSSMResourceTypeForTaggingOpsItem);
        }
        return @(AWSSSMResourceTypeForTaggingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMResourceTypeForTaggingDocument:
                return @"Document";
            case AWSSSMResourceTypeForTaggingManagedInstance:
                return @"ManagedInstance";
            case AWSSSMResourceTypeForTaggingMaintenanceWindow:
                return @"MaintenanceWindow";
            case AWSSSMResourceTypeForTaggingParameter:
                return @"Parameter";
            case AWSSSMResourceTypeForTaggingPatchBaseline:
                return @"PatchBaseline";
            case AWSSSMResourceTypeForTaggingOpsItem:
                return @"OpsItem";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTag class]];
}

@end

@implementation AWSSSMAddTagsToResourceResult

@end

@implementation AWSSSMAssociation

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMAssociationOverview class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTarget class]];
}

@end

@implementation AWSSSMAssociationDescription

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
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)complianceSeverityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityUnspecified);
        }
        return @(AWSSSMAssociationComplianceSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMAssociationComplianceSeverityCritical:
                return @"CRITICAL";
            case AWSSSMAssociationComplianceSeverityHigh:
                return @"HIGH";
            case AWSSSMAssociationComplianceSeverityMedium:
                return @"MEDIUM";
            case AWSSSMAssociationComplianceSeverityLow:
                return @"LOW";
            case AWSSSMAssociationComplianceSeverityUnspecified:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMInstanceAssociationOutputLocation class]];
}

+ (NSValueTransformer *)overviewJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMAssociationOverview class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMAssociationStatus class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTarget class]];
}

@end

@implementation AWSSSMAssociationExecution

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

@implementation AWSSSMAssociationExecutionFilter

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
            return @(AWSSSMAssociationExecutionFilterKeyExecutionId);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSSMAssociationExecutionFilterKeyStatus);
        }
        if ([value caseInsensitiveCompare:@"CreatedTime"] == NSOrderedSame) {
            return @(AWSSSMAssociationExecutionFilterKeyCreatedTime);
        }
        return @(AWSSSMAssociationExecutionFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMAssociationExecutionFilterKeyExecutionId:
                return @"ExecutionId";
            case AWSSSMAssociationExecutionFilterKeyStatus:
                return @"Status";
            case AWSSSMAssociationExecutionFilterKeyCreatedTime:
                return @"CreatedTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EQUAL"] == NSOrderedSame) {
            return @(AWSSSMAssociationFilterOperatorTypeEqual);
        }
        if ([value caseInsensitiveCompare:@"LESS_THAN"] == NSOrderedSame) {
            return @(AWSSSMAssociationFilterOperatorTypeLessThan);
        }
        if ([value caseInsensitiveCompare:@"GREATER_THAN"] == NSOrderedSame) {
            return @(AWSSSMAssociationFilterOperatorTypeGreaterThan);
        }
        return @(AWSSSMAssociationFilterOperatorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMAssociationFilterOperatorTypeEqual:
                return @"EQUAL";
            case AWSSSMAssociationFilterOperatorTypeLessThan:
                return @"LESS_THAN";
            case AWSSSMAssociationFilterOperatorTypeGreaterThan:
                return @"GREATER_THAN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMAssociationExecutionTarget

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMOutputSource class]];
}

@end

@implementation AWSSSMAssociationExecutionTargetsFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSSMAssociationExecutionTargetsFilterKeyStatus);
        }
        if ([value caseInsensitiveCompare:@"ResourceId"] == NSOrderedSame) {
            return @(AWSSSMAssociationExecutionTargetsFilterKeyResourceId);
        }
        if ([value caseInsensitiveCompare:@"ResourceType"] == NSOrderedSame) {
            return @(AWSSSMAssociationExecutionTargetsFilterKeyResourceType);
        }
        return @(AWSSSMAssociationExecutionTargetsFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMAssociationExecutionTargetsFilterKeyStatus:
                return @"Status";
            case AWSSSMAssociationExecutionTargetsFilterKeyResourceId:
                return @"ResourceId";
            case AWSSSMAssociationExecutionTargetsFilterKeyResourceType:
                return @"ResourceType";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMAssociationFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InstanceId"] == NSOrderedSame) {
            return @(AWSSSMAssociationFilterKeyInstanceId);
        }
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSSSMAssociationFilterKeyName);
        }
        if ([value caseInsensitiveCompare:@"AssociationId"] == NSOrderedSame) {
            return @(AWSSSMAssociationFilterKeyAssociationId);
        }
        if ([value caseInsensitiveCompare:@"AssociationStatusName"] == NSOrderedSame) {
            return @(AWSSSMAssociationFilterKeyAssociationStatusName);
        }
        if ([value caseInsensitiveCompare:@"LastExecutedBefore"] == NSOrderedSame) {
            return @(AWSSSMAssociationFilterKeyLastExecutedBefore);
        }
        if ([value caseInsensitiveCompare:@"LastExecutedAfter"] == NSOrderedSame) {
            return @(AWSSSMAssociationFilterKeyLastExecutedAfter);
        }
        if ([value caseInsensitiveCompare:@"AssociationName"] == NSOrderedSame) {
            return @(AWSSSMAssociationFilterKeyAssociationName);
        }
        return @(AWSSSMAssociationFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMAssociationFilterKeyInstanceId:
                return @"InstanceId";
            case AWSSSMAssociationFilterKeyName:
                return @"Name";
            case AWSSSMAssociationFilterKeyAssociationId:
                return @"AssociationId";
            case AWSSSMAssociationFilterKeyAssociationStatusName:
                return @"AssociationStatusName";
            case AWSSSMAssociationFilterKeyLastExecutedBefore:
                return @"LastExecutedBefore";
            case AWSSSMAssociationFilterKeyLastExecutedAfter:
                return @"LastExecutedAfter";
            case AWSSSMAssociationFilterKeyAssociationName:
                return @"AssociationName";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMAssociationOverview

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationStatusAggregatedCount" : @"AssociationStatusAggregatedCount",
             @"detailedStatus" : @"DetailedStatus",
             @"status" : @"Status",
             };
}

@end

@implementation AWSSSMAssociationStatus

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
            return @(AWSSSMAssociationStatusNamePending);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSSMAssociationStatusNameSuccess);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSSMAssociationStatusNameFailed);
        }
        return @(AWSSSMAssociationStatusNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMAssociationStatusNamePending:
                return @"Pending";
            case AWSSSMAssociationStatusNameSuccess:
                return @"Success";
            case AWSSSMAssociationStatusNameFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMAssociationVersionInfo

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
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)complianceSeverityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityUnspecified);
        }
        return @(AWSSSMAssociationComplianceSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMAssociationComplianceSeverityCritical:
                return @"CRITICAL";
            case AWSSSMAssociationComplianceSeverityHigh:
                return @"HIGH";
            case AWSSSMAssociationComplianceSeverityMedium:
                return @"MEDIUM";
            case AWSSSMAssociationComplianceSeverityLow:
                return @"LOW";
            case AWSSSMAssociationComplianceSeverityUnspecified:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMInstanceAssociationOutputLocation class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTarget class]];
}

@end

@implementation AWSSSMAttachmentContent

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
            return @(AWSSSMAttachmentHashTypeSha256);
        }
        return @(AWSSSMAttachmentHashTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMAttachmentHashTypeSha256:
                return @"Sha256";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMAttachmentInformation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSSSMAttachmentsSource

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
            return @(AWSSSMAttachmentsSourceKeySourceUrl);
        }
        if ([value caseInsensitiveCompare:@"S3FileUrl"] == NSOrderedSame) {
            return @(AWSSSMAttachmentsSourceKeyS3FileUrl);
        }
        if ([value caseInsensitiveCompare:@"AttachmentReference"] == NSOrderedSame) {
            return @(AWSSSMAttachmentsSourceKeyAttachmentReference);
        }
        return @(AWSSSMAttachmentsSourceKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMAttachmentsSourceKeySourceUrl:
                return @"SourceUrl";
            case AWSSSMAttachmentsSourceKeyS3FileUrl:
                return @"S3FileUrl";
            case AWSSSMAttachmentsSourceKeyAttachmentReference:
                return @"AttachmentReference";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMAutomationExecution

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
            return @(AWSSSMAutomationExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Waiting"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionStatusWaiting);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"TimedOut"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"Cancelling"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionStatusFailed);
        }
        return @(AWSSSMAutomationExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMAutomationExecutionStatusPending:
                return @"Pending";
            case AWSSSMAutomationExecutionStatusInProgress:
                return @"InProgress";
            case AWSSSMAutomationExecutionStatusWaiting:
                return @"Waiting";
            case AWSSSMAutomationExecutionStatusSuccess:
                return @"Success";
            case AWSSSMAutomationExecutionStatusTimedOut:
                return @"TimedOut";
            case AWSSSMAutomationExecutionStatusCancelling:
                return @"Cancelling";
            case AWSSSMAutomationExecutionStatusCancelled:
                return @"Cancelled";
            case AWSSSMAutomationExecutionStatusFailed:
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
            return @(AWSSSMExecutionModeAuto);
        }
        if ([value caseInsensitiveCompare:@"Interactive"] == NSOrderedSame) {
            return @(AWSSSMExecutionModeInteractive);
        }
        return @(AWSSSMExecutionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMExecutionModeAuto:
                return @"Auto";
            case AWSSSMExecutionModeInteractive:
                return @"Interactive";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)progressCountersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMProgressCounters class]];
}

+ (NSValueTransformer *)resolvedTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMResolvedTargets class]];
}

+ (NSValueTransformer *)stepExecutionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMStepExecution class]];
}

+ (NSValueTransformer *)targetLocationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTargetLocation class]];
}

+ (NSValueTransformer *)targetMapsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[NSMutableArray<NSString *> class]]; //mapMTLArrayFromJSONArray:JSONArray withModelClass:[java.util.List<NSString> class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTarget class]];
}

@end

@implementation AWSSSMAutomationExecutionFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DocumentNamePrefix"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionFilterKeyDocumentNamePrefix);
        }
        if ([value caseInsensitiveCompare:@"ExecutionStatus"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionFilterKeyExecutionStatus);
        }
        if ([value caseInsensitiveCompare:@"ExecutionId"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionFilterKeyExecutionId);
        }
        if ([value caseInsensitiveCompare:@"ParentExecutionId"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionFilterKeyParentExecutionId);
        }
        if ([value caseInsensitiveCompare:@"CurrentAction"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionFilterKeyCurrentAction);
        }
        if ([value caseInsensitiveCompare:@"StartTimeBefore"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionFilterKeyStartTimeBefore);
        }
        if ([value caseInsensitiveCompare:@"StartTimeAfter"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionFilterKeyStartTimeAfter);
        }
        if ([value caseInsensitiveCompare:@"AutomationType"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionFilterKeyAutomationType);
        }
        if ([value caseInsensitiveCompare:@"TagKey"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionFilterKeyTagKey);
        }
        return @(AWSSSMAutomationExecutionFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMAutomationExecutionFilterKeyDocumentNamePrefix:
                return @"DocumentNamePrefix";
            case AWSSSMAutomationExecutionFilterKeyExecutionStatus:
                return @"ExecutionStatus";
            case AWSSSMAutomationExecutionFilterKeyExecutionId:
                return @"ExecutionId";
            case AWSSSMAutomationExecutionFilterKeyParentExecutionId:
                return @"ParentExecutionId";
            case AWSSSMAutomationExecutionFilterKeyCurrentAction:
                return @"CurrentAction";
            case AWSSSMAutomationExecutionFilterKeyStartTimeBefore:
                return @"StartTimeBefore";
            case AWSSSMAutomationExecutionFilterKeyStartTimeAfter:
                return @"StartTimeAfter";
            case AWSSSMAutomationExecutionFilterKeyAutomationType:
                return @"AutomationType";
            case AWSSSMAutomationExecutionFilterKeyTagKey:
                return @"TagKey";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMAutomationExecutionMetadata

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
            return @(AWSSSMAutomationExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Waiting"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionStatusWaiting);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"TimedOut"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"Cancelling"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionStatusFailed);
        }
        return @(AWSSSMAutomationExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMAutomationExecutionStatusPending:
                return @"Pending";
            case AWSSSMAutomationExecutionStatusInProgress:
                return @"InProgress";
            case AWSSSMAutomationExecutionStatusWaiting:
                return @"Waiting";
            case AWSSSMAutomationExecutionStatusSuccess:
                return @"Success";
            case AWSSSMAutomationExecutionStatusTimedOut:
                return @"TimedOut";
            case AWSSSMAutomationExecutionStatusCancelling:
                return @"Cancelling";
            case AWSSSMAutomationExecutionStatusCancelled:
                return @"Cancelled";
            case AWSSSMAutomationExecutionStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)automationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CrossAccount"] == NSOrderedSame) {
            return @(AWSSSMAutomationTypeCrossAccount);
        }
        if ([value caseInsensitiveCompare:@"Local"] == NSOrderedSame) {
            return @(AWSSSMAutomationTypeLocal);
        }
        return @(AWSSSMAutomationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMAutomationTypeCrossAccount:
                return @"CrossAccount";
            case AWSSSMAutomationTypeLocal:
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
            return @(AWSSSMExecutionModeAuto);
        }
        if ([value caseInsensitiveCompare:@"Interactive"] == NSOrderedSame) {
            return @(AWSSSMExecutionModeInteractive);
        }
        return @(AWSSSMExecutionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMExecutionModeAuto:
                return @"Auto";
            case AWSSSMExecutionModeInteractive:
                return @"Interactive";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resolvedTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMResolvedTargets class]];
}

+ (NSValueTransformer *)targetMapsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[NSMutableArray<NSString *> class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTarget class]];
}

@end

@implementation AWSSSMCancelCommandRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commandId" : @"CommandId",
             @"instanceIds" : @"InstanceIds",
             };
}

@end

@implementation AWSSSMCancelCommandResult

@end

@implementation AWSSSMCancelMaintenanceWindowExecutionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowExecutionId" : @"WindowExecutionId",
             };
}

@end

@implementation AWSSSMCancelMaintenanceWindowExecutionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowExecutionId" : @"WindowExecutionId",
             };
}

@end

@implementation AWSSSMCloudWatchOutputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLogGroupName" : @"CloudWatchLogGroupName",
             @"cloudWatchOutputEnabled" : @"CloudWatchOutputEnabled",
             };
}

@end

@implementation AWSSSMCommand

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
             };
}

+ (NSValueTransformer *)cloudWatchOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMCloudWatchOutputConfig class]];
}

+ (NSValueTransformer *)expiresAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)notificationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMNotificationConfig class]];
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
            return @(AWSSSMCommandStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSSMCommandStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSSMCommandStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSSMCommandStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSSMCommandStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TimedOut"] == NSOrderedSame) {
            return @(AWSSSMCommandStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"Cancelling"] == NSOrderedSame) {
            return @(AWSSSMCommandStatusCancelling);
        }
        return @(AWSSSMCommandStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMCommandStatusPending:
                return @"Pending";
            case AWSSSMCommandStatusInProgress:
                return @"InProgress";
            case AWSSSMCommandStatusSuccess:
                return @"Success";
            case AWSSSMCommandStatusCancelled:
                return @"Cancelled";
            case AWSSSMCommandStatusFailed:
                return @"Failed";
            case AWSSSMCommandStatusTimedOut:
                return @"TimedOut";
            case AWSSSMCommandStatusCancelling:
                return @"Cancelling";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTarget class]];
}

@end

@implementation AWSSSMCommandFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InvokedAfter"] == NSOrderedSame) {
            return @(AWSSSMCommandFilterKeyInvokedAfter);
        }
        if ([value caseInsensitiveCompare:@"InvokedBefore"] == NSOrderedSame) {
            return @(AWSSSMCommandFilterKeyInvokedBefore);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSSMCommandFilterKeyStatus);
        }
        if ([value caseInsensitiveCompare:@"ExecutionStage"] == NSOrderedSame) {
            return @(AWSSSMCommandFilterKeyExecutionStage);
        }
        if ([value caseInsensitiveCompare:@"DocumentName"] == NSOrderedSame) {
            return @(AWSSSMCommandFilterKeyDocumentName);
        }
        return @(AWSSSMCommandFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMCommandFilterKeyInvokedAfter:
                return @"InvokedAfter";
            case AWSSSMCommandFilterKeyInvokedBefore:
                return @"InvokedBefore";
            case AWSSSMCommandFilterKeyStatus:
                return @"Status";
            case AWSSSMCommandFilterKeyExecutionStage:
                return @"ExecutionStage";
            case AWSSSMCommandFilterKeyDocumentName:
                return @"DocumentName";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMCommandInvocation

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMCloudWatchOutputConfig class]];
}

+ (NSValueTransformer *)commandPluginsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMCommandPlugin class]];
}

+ (NSValueTransformer *)notificationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMNotificationConfig class]];
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
            return @(AWSSSMCommandInvocationStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSSMCommandInvocationStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Delayed"] == NSOrderedSame) {
            return @(AWSSSMCommandInvocationStatusDelayed);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSSMCommandInvocationStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSSMCommandInvocationStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"TimedOut"] == NSOrderedSame) {
            return @(AWSSSMCommandInvocationStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSSMCommandInvocationStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Cancelling"] == NSOrderedSame) {
            return @(AWSSSMCommandInvocationStatusCancelling);
        }
        return @(AWSSSMCommandInvocationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMCommandInvocationStatusPending:
                return @"Pending";
            case AWSSSMCommandInvocationStatusInProgress:
                return @"InProgress";
            case AWSSSMCommandInvocationStatusDelayed:
                return @"Delayed";
            case AWSSSMCommandInvocationStatusSuccess:
                return @"Success";
            case AWSSSMCommandInvocationStatusCancelled:
                return @"Cancelled";
            case AWSSSMCommandInvocationStatusTimedOut:
                return @"TimedOut";
            case AWSSSMCommandInvocationStatusFailed:
                return @"Failed";
            case AWSSSMCommandInvocationStatusCancelling:
                return @"Cancelling";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMCommandPlugin

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
            return @(AWSSSMCommandPluginStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSSMCommandPluginStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSSMCommandPluginStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"TimedOut"] == NSOrderedSame) {
            return @(AWSSSMCommandPluginStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSSMCommandPluginStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSSMCommandPluginStatusFailed);
        }
        return @(AWSSSMCommandPluginStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMCommandPluginStatusPending:
                return @"Pending";
            case AWSSSMCommandPluginStatusInProgress:
                return @"InProgress";
            case AWSSSMCommandPluginStatusSuccess:
                return @"Success";
            case AWSSSMCommandPluginStatusTimedOut:
                return @"TimedOut";
            case AWSSSMCommandPluginStatusCancelled:
                return @"Cancelled";
            case AWSSSMCommandPluginStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMComplianceExecutionSummary

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

@implementation AWSSSMComplianceItem

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMComplianceExecutionSummary class]];
}

+ (NSValueTransformer *)severityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSSMComplianceSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSSMComplianceSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSSMComplianceSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSSMComplianceSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSSMComplianceSeverityInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSSMComplianceSeverityUnspecified);
        }
        return @(AWSSSMComplianceSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMComplianceSeverityCritical:
                return @"CRITICAL";
            case AWSSSMComplianceSeverityHigh:
                return @"HIGH";
            case AWSSSMComplianceSeverityMedium:
                return @"MEDIUM";
            case AWSSSMComplianceSeverityLow:
                return @"LOW";
            case AWSSSMComplianceSeverityInformational:
                return @"INFORMATIONAL";
            case AWSSSMComplianceSeverityUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLIANT"] == NSOrderedSame) {
            return @(AWSSSMComplianceStatusCompliant);
        }
        if ([value caseInsensitiveCompare:@"NON_COMPLIANT"] == NSOrderedSame) {
            return @(AWSSSMComplianceStatusNonCompliant);
        }
        return @(AWSSSMComplianceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMComplianceStatusCompliant:
                return @"COMPLIANT";
            case AWSSSMComplianceStatusNonCompliant:
                return @"NON_COMPLIANT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMComplianceItemEntry

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
            return @(AWSSSMComplianceSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSSMComplianceSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSSMComplianceSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSSMComplianceSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSSMComplianceSeverityInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSSMComplianceSeverityUnspecified);
        }
        return @(AWSSSMComplianceSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMComplianceSeverityCritical:
                return @"CRITICAL";
            case AWSSSMComplianceSeverityHigh:
                return @"HIGH";
            case AWSSSMComplianceSeverityMedium:
                return @"MEDIUM";
            case AWSSSMComplianceSeverityLow:
                return @"LOW";
            case AWSSSMComplianceSeverityInformational:
                return @"INFORMATIONAL";
            case AWSSSMComplianceSeverityUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLIANT"] == NSOrderedSame) {
            return @(AWSSSMComplianceStatusCompliant);
        }
        if ([value caseInsensitiveCompare:@"NON_COMPLIANT"] == NSOrderedSame) {
            return @(AWSSSMComplianceStatusNonCompliant);
        }
        return @(AWSSSMComplianceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMComplianceStatusCompliant:
                return @"COMPLIANT";
            case AWSSSMComplianceStatusNonCompliant:
                return @"NON_COMPLIANT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMComplianceStringFilter

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
            return @(AWSSSMComplianceQueryOperatorTypeEqual);
        }
        if ([value caseInsensitiveCompare:@"NOT_EQUAL"] == NSOrderedSame) {
            return @(AWSSSMComplianceQueryOperatorTypeNotEqual);
        }
        if ([value caseInsensitiveCompare:@"BEGIN_WITH"] == NSOrderedSame) {
            return @(AWSSSMComplianceQueryOperatorTypeBeginWith);
        }
        if ([value caseInsensitiveCompare:@"LESS_THAN"] == NSOrderedSame) {
            return @(AWSSSMComplianceQueryOperatorTypeLessThan);
        }
        if ([value caseInsensitiveCompare:@"GREATER_THAN"] == NSOrderedSame) {
            return @(AWSSSMComplianceQueryOperatorTypeGreaterThan);
        }
        return @(AWSSSMComplianceQueryOperatorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMComplianceQueryOperatorTypeEqual:
                return @"EQUAL";
            case AWSSSMComplianceQueryOperatorTypeNotEqual:
                return @"NOT_EQUAL";
            case AWSSSMComplianceQueryOperatorTypeBeginWith:
                return @"BEGIN_WITH";
            case AWSSSMComplianceQueryOperatorTypeLessThan:
                return @"LESS_THAN";
            case AWSSSMComplianceQueryOperatorTypeGreaterThan:
                return @"GREATER_THAN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMComplianceSummaryItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"complianceType" : @"ComplianceType",
             @"compliantSummary" : @"CompliantSummary",
             @"nonCompliantSummary" : @"NonCompliantSummary",
             };
}

+ (NSValueTransformer *)compliantSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMCompliantSummary class]];
}

+ (NSValueTransformer *)nonCompliantSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMNonCompliantSummary class]];
}

@end

@implementation AWSSSMCompliantSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compliantCount" : @"CompliantCount",
             @"severitySummary" : @"SeveritySummary",
             };
}

+ (NSValueTransformer *)severitySummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMSeveritySummary class]];
}

@end

@implementation AWSSSMCreateActivationRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTag class]];
}

@end

@implementation AWSSSMCreateActivationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activationCode" : @"ActivationCode",
             @"activationId" : @"ActivationId",
             };
}

@end

@implementation AWSSSMCreateAssociationBatchRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entries" : @"Entries",
             };
}

+ (NSValueTransformer *)entriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMCreateAssociationBatchRequestEntry class]];
}

@end

@implementation AWSSSMCreateAssociationBatchRequestEntry

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
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)complianceSeverityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityUnspecified);
        }
        return @(AWSSSMAssociationComplianceSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMAssociationComplianceSeverityCritical:
                return @"CRITICAL";
            case AWSSSMAssociationComplianceSeverityHigh:
                return @"HIGH";
            case AWSSSMAssociationComplianceSeverityMedium:
                return @"MEDIUM";
            case AWSSSMAssociationComplianceSeverityLow:
                return @"LOW";
            case AWSSSMAssociationComplianceSeverityUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMInstanceAssociationOutputLocation class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTarget class]];
}

@end

@implementation AWSSSMCreateAssociationBatchResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failed" : @"Failed",
             @"successful" : @"Successful",
             };
}

+ (NSValueTransformer *)failedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMFailedCreateAssociation class]];
}

+ (NSValueTransformer *)successfulJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMAssociationDescription class]];
}

@end

@implementation AWSSSMCreateAssociationRequest

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
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)complianceSeverityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityUnspecified);
        }
        return @(AWSSSMAssociationComplianceSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMAssociationComplianceSeverityCritical:
                return @"CRITICAL";
            case AWSSSMAssociationComplianceSeverityHigh:
                return @"HIGH";
            case AWSSSMAssociationComplianceSeverityMedium:
                return @"MEDIUM";
            case AWSSSMAssociationComplianceSeverityLow:
                return @"LOW";
            case AWSSSMAssociationComplianceSeverityUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMInstanceAssociationOutputLocation class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTarget class]];
}

@end

@implementation AWSSSMCreateAssociationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationDescription" : @"AssociationDescription",
             };
}

+ (NSValueTransformer *)associationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMAssociationDescription class]];
}

@end

@implementation AWSSSMCreateDocumentRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMAttachmentsSource class]];
}

+ (NSValueTransformer *)documentFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"YAML"] == NSOrderedSame) {
            return @(AWSSSMDocumentFormatYaml);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSSSMDocumentFormatJson);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSSSMDocumentFormatText);
        }
        return @(AWSSSMDocumentFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMDocumentFormatYaml:
                return @"YAML";
            case AWSSSMDocumentFormatJson:
                return @"JSON";
            case AWSSSMDocumentFormatText:
                return @"TEXT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)documentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Command"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeCommand);
        }
        if ([value caseInsensitiveCompare:@"Policy"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypePolicy);
        }
        if ([value caseInsensitiveCompare:@"Automation"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"Session"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeSession);
        }
        if ([value caseInsensitiveCompare:@"Package"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypePackage);
        }
        if ([value caseInsensitiveCompare:@"ApplicationConfiguration"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeApplicationConfiguration);
        }
        if ([value caseInsensitiveCompare:@"ApplicationConfigurationSchema"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeApplicationConfigurationSchema);
        }
        if ([value caseInsensitiveCompare:@"DeploymentStrategy"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeDeploymentStrategy);
        }
        if ([value caseInsensitiveCompare:@"ChangeCalendar"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeChangeCalendar);
        }
        return @(AWSSSMDocumentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMDocumentTypeCommand:
                return @"Command";
            case AWSSSMDocumentTypePolicy:
                return @"Policy";
            case AWSSSMDocumentTypeAutomation:
                return @"Automation";
            case AWSSSMDocumentTypeSession:
                return @"Session";
            case AWSSSMDocumentTypePackage:
                return @"Package";
            case AWSSSMDocumentTypeApplicationConfiguration:
                return @"ApplicationConfiguration";
            case AWSSSMDocumentTypeApplicationConfigurationSchema:
                return @"ApplicationConfigurationSchema";
            case AWSSSMDocumentTypeDeploymentStrategy:
                return @"DeploymentStrategy";
            case AWSSSMDocumentTypeChangeCalendar:
                return @"ChangeCalendar";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requiresJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMDocumentRequires class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTag class]];
}

@end

@implementation AWSSSMCreateDocumentResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentDescription" : @"DocumentDescription",
             };
}

+ (NSValueTransformer *)documentDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMDocumentDescription class]];
}

@end

@implementation AWSSSMCreateMaintenanceWindowRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTag class]];
}

@end

@implementation AWSSSMCreateMaintenanceWindowResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowId" : @"WindowId",
             };
}

@end

@implementation AWSSSMCreateOpsItemRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMOpsItemNotification class]];
}

+ (NSValueTransformer *)operationalDataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSSMOpsItemDataValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)relatedOpsItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMRelatedOpsItem class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTag class]];
}

@end

@implementation AWSSSMCreateOpsItemResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"opsItemId" : @"OpsItemId",
             };
}

@end

@implementation AWSSSMCreatePatchBaselineRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMPatchRuleGroup class]];
}

+ (NSValueTransformer *)approvedPatchesComplianceLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelUnspecified);
        }
        return @(AWSSSMPatchComplianceLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMPatchComplianceLevelCritical:
                return @"CRITICAL";
            case AWSSSMPatchComplianceLevelHigh:
                return @"HIGH";
            case AWSSSMPatchComplianceLevelMedium:
                return @"MEDIUM";
            case AWSSSMPatchComplianceLevelLow:
                return @"LOW";
            case AWSSSMPatchComplianceLevelInformational:
                return @"INFORMATIONAL";
            case AWSSSMPatchComplianceLevelUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)globalFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMPatchFilterGroup class]];
}

+ (NSValueTransformer *)operatingSystemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WINDOWS"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemCentos);
        }
        return @(AWSSSMOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSSMOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSSMOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSSMOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSSMOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSSMOperatingSystemSuse:
                return @"SUSE";
            case AWSSSMOperatingSystemCentos:
                return @"CENTOS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rejectedPatchesActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALLOW_AS_DEPENDENCY"] == NSOrderedSame) {
            return @(AWSSSMPatchActionAllowAsDependency);
        }
        if ([value caseInsensitiveCompare:@"BLOCK"] == NSOrderedSame) {
            return @(AWSSSMPatchActionBlock);
        }
        return @(AWSSSMPatchActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMPatchActionAllowAsDependency:
                return @"ALLOW_AS_DEPENDENCY";
            case AWSSSMPatchActionBlock:
                return @"BLOCK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMPatchSource class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTag class]];
}

@end

@implementation AWSSSMCreatePatchBaselineResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             };
}

@end

@implementation AWSSSMCreateResourceDataSyncRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Destination" : @"S3Destination",
             @"syncName" : @"SyncName",
             @"syncSource" : @"SyncSource",
             @"syncType" : @"SyncType",
             };
}

+ (NSValueTransformer *)s3DestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMResourceDataSyncS3Destination class]];
}

+ (NSValueTransformer *)syncSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMResourceDataSyncSource class]];
}

@end

@implementation AWSSSMCreateResourceDataSyncResult

@end

@implementation AWSSSMDeleteActivationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activationId" : @"ActivationId",
             };
}

@end

@implementation AWSSSMDeleteActivationResult

@end

@implementation AWSSSMDeleteAssociationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSSSMDeleteAssociationResult

@end

@implementation AWSSSMDeleteDocumentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentVersion" : @"DocumentVersion",
             @"force" : @"Force",
             @"name" : @"Name",
             @"versionName" : @"VersionName",
             };
}

@end

@implementation AWSSSMDeleteDocumentResult

@end

@implementation AWSSSMDeleteInventoryRequest

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
            return @(AWSSSMInventorySchemaDeleteOptionDisableSchema);
        }
        if ([value caseInsensitiveCompare:@"DeleteSchema"] == NSOrderedSame) {
            return @(AWSSSMInventorySchemaDeleteOptionDeleteSchema);
        }
        return @(AWSSSMInventorySchemaDeleteOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMInventorySchemaDeleteOptionDisableSchema:
                return @"DisableSchema";
            case AWSSSMInventorySchemaDeleteOptionDeleteSchema:
                return @"DeleteSchema";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMDeleteInventoryResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deletionId" : @"DeletionId",
             @"deletionSummary" : @"DeletionSummary",
             @"typeName" : @"TypeName",
             };
}

+ (NSValueTransformer *)deletionSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMInventoryDeletionSummary class]];
}

@end

@implementation AWSSSMDeleteMaintenanceWindowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowId" : @"WindowId",
             };
}

@end

@implementation AWSSSMDeleteMaintenanceWindowResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowId" : @"WindowId",
             };
}

@end

@implementation AWSSSMDeleteParameterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSSSMDeleteParameterResult

@end

@implementation AWSSSMDeleteParametersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"names" : @"Names",
             };
}

@end

@implementation AWSSSMDeleteParametersResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deletedParameters" : @"DeletedParameters",
             @"invalidParameters" : @"InvalidParameters",
             };
}

@end

@implementation AWSSSMDeletePatchBaselineRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             };
}

@end

@implementation AWSSSMDeletePatchBaselineResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             };
}

@end

@implementation AWSSSMDeleteResourceDataSyncRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"syncName" : @"SyncName",
             @"syncType" : @"SyncType",
             };
}

@end

@implementation AWSSSMDeleteResourceDataSyncResult

@end

@implementation AWSSSMDeregisterManagedInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSSSMDeregisterManagedInstanceResult

@end

@implementation AWSSSMDeregisterPatchBaselineForPatchGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             @"patchGroup" : @"PatchGroup",
             };
}

@end

@implementation AWSSSMDeregisterPatchBaselineForPatchGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             @"patchGroup" : @"PatchGroup",
             };
}

@end

@implementation AWSSSMDeregisterTargetFromMaintenanceWindowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"safe" : @"Safe",
             @"windowId" : @"WindowId",
             @"windowTargetId" : @"WindowTargetId",
             };
}

@end

@implementation AWSSSMDeregisterTargetFromMaintenanceWindowResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowId" : @"WindowId",
             @"windowTargetId" : @"WindowTargetId",
             };
}

@end

@implementation AWSSSMDeregisterTaskFromMaintenanceWindowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowId" : @"WindowId",
             @"windowTaskId" : @"WindowTaskId",
             };
}

@end

@implementation AWSSSMDeregisterTaskFromMaintenanceWindowResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowId" : @"WindowId",
             @"windowTaskId" : @"WindowTaskId",
             };
}

@end

@implementation AWSSSMDescribeActivationsFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterKey" : @"FilterKey",
             @"filterValues" : @"FilterValues",
             };
}

+ (NSValueTransformer *)filterKeyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ActivationIds"] == NSOrderedSame) {
            return @(AWSSSMDescribeActivationsFilterKeysActivationIds);
        }
        if ([value caseInsensitiveCompare:@"DefaultInstanceName"] == NSOrderedSame) {
            return @(AWSSSMDescribeActivationsFilterKeysDefaultInstanceName);
        }
        if ([value caseInsensitiveCompare:@"IamRole"] == NSOrderedSame) {
            return @(AWSSSMDescribeActivationsFilterKeysIamRole);
        }
        return @(AWSSSMDescribeActivationsFilterKeysUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMDescribeActivationsFilterKeysActivationIds:
                return @"ActivationIds";
            case AWSSSMDescribeActivationsFilterKeysDefaultInstanceName:
                return @"DefaultInstanceName";
            case AWSSSMDescribeActivationsFilterKeysIamRole:
                return @"IamRole";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMDescribeActivationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMDescribeActivationsFilter class]];
}

@end

@implementation AWSSSMDescribeActivationsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activationList" : @"ActivationList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)activationListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMActivation class]];
}

@end

@implementation AWSSSMDescribeAssociationExecutionTargetsRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMAssociationExecutionTargetsFilter class]];
}

@end

@implementation AWSSSMDescribeAssociationExecutionTargetsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationExecutionTargets" : @"AssociationExecutionTargets",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)associationExecutionTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMAssociationExecutionTarget class]];
}

@end

@implementation AWSSSMDescribeAssociationExecutionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMAssociationExecutionFilter class]];
}

@end

@implementation AWSSSMDescribeAssociationExecutionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationExecutions" : @"AssociationExecutions",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)associationExecutionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMAssociationExecution class]];
}

@end

@implementation AWSSSMDescribeAssociationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"associationVersion" : @"AssociationVersion",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSSSMDescribeAssociationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationDescription" : @"AssociationDescription",
             };
}

+ (NSValueTransformer *)associationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMAssociationDescription class]];
}

@end

@implementation AWSSSMDescribeAutomationExecutionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMAutomationExecutionFilter class]];
}

@end

@implementation AWSSSMDescribeAutomationExecutionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automationExecutionMetadataList" : @"AutomationExecutionMetadataList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)automationExecutionMetadataListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMAutomationExecutionMetadata class]];
}

@end

@implementation AWSSSMDescribeAutomationStepExecutionsRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMStepExecutionFilter class]];
}

@end

@implementation AWSSSMDescribeAutomationStepExecutionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"stepExecutions" : @"StepExecutions",
             };
}

+ (NSValueTransformer *)stepExecutionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMStepExecution class]];
}

@end

@implementation AWSSSMDescribeAvailablePatchesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMPatchOrchestratorFilter class]];
}

@end

@implementation AWSSSMDescribeAvailablePatchesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"patches" : @"Patches",
             };
}

+ (NSValueTransformer *)patchesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMPatch class]];
}

@end

@implementation AWSSSMDescribeDocumentPermissionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"permissionType" : @"PermissionType",
             };
}

+ (NSValueTransformer *)permissionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Share"] == NSOrderedSame) {
            return @(AWSSSMDocumentPermissionTypeShare);
        }
        return @(AWSSSMDocumentPermissionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMDocumentPermissionTypeShare:
                return @"Share";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMDescribeDocumentPermissionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             @"accountSharingInfoList" : @"AccountSharingInfoList",
             };
}

+ (NSValueTransformer *)accountSharingInfoListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMAccountSharingInfo class]];
}

@end

@implementation AWSSSMDescribeDocumentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentVersion" : @"DocumentVersion",
             @"name" : @"Name",
             @"versionName" : @"VersionName",
             };
}

@end

@implementation AWSSSMDescribeDocumentResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"document" : @"Document",
             };
}

+ (NSValueTransformer *)documentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMDocumentDescription class]];
}

@end

@implementation AWSSSMDescribeEffectiveInstanceAssociationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSSMDescribeEffectiveInstanceAssociationsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associations" : @"Associations",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)associationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMInstanceAssociation class]];
}

@end

@implementation AWSSSMDescribeEffectivePatchesForPatchBaselineRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSSMDescribeEffectivePatchesForPatchBaselineResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"effectivePatches" : @"EffectivePatches",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)effectivePatchesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMEffectivePatch class]];
}

@end

@implementation AWSSSMDescribeInstanceAssociationsStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSSMDescribeInstanceAssociationsStatusResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceAssociationStatusInfos" : @"InstanceAssociationStatusInfos",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)instanceAssociationStatusInfosJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMInstanceAssociationStatusInfo class]];
}

@end

@implementation AWSSSMDescribeInstanceInformationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"instanceInformationFilterList" : @"InstanceInformationFilterList",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMInstanceInformationStringFilter class]];
}

+ (NSValueTransformer *)instanceInformationFilterListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMInstanceInformationFilter class]];
}

@end

@implementation AWSSSMDescribeInstanceInformationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceInformationList" : @"InstanceInformationList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)instanceInformationListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMInstanceInformation class]];
}

@end

@implementation AWSSSMDescribeInstancePatchStatesForPatchGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"patchGroup" : @"PatchGroup",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMInstancePatchStateFilter class]];
}

@end

@implementation AWSSSMDescribeInstancePatchStatesForPatchGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instancePatchStates" : @"InstancePatchStates",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)instancePatchStatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMInstancePatchState class]];
}

@end

@implementation AWSSSMDescribeInstancePatchStatesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceIds" : @"InstanceIds",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSSMDescribeInstancePatchStatesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instancePatchStates" : @"InstancePatchStates",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)instancePatchStatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMInstancePatchState class]];
}

@end

@implementation AWSSSMDescribeInstancePatchesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"instanceId" : @"InstanceId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMPatchOrchestratorFilter class]];
}

@end

@implementation AWSSSMDescribeInstancePatchesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"patches" : @"Patches",
             };
}

+ (NSValueTransformer *)patchesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMPatchComplianceData class]];
}

@end

@implementation AWSSSMDescribeInventoryDeletionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deletionId" : @"DeletionId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSSMDescribeInventoryDeletionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inventoryDeletions" : @"InventoryDeletions",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)inventoryDeletionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMInventoryDeletionStatusItem class]];
}

@end

@implementation AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMMaintenanceWindowFilter class]];
}

@end

@implementation AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"windowExecutionTaskInvocationIdentities" : @"WindowExecutionTaskInvocationIdentities",
             };
}

+ (NSValueTransformer *)windowExecutionTaskInvocationIdentitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMMaintenanceWindowExecutionTaskInvocationIdentity class]];
}

@end

@implementation AWSSSMDescribeMaintenanceWindowExecutionTasksRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"windowExecutionId" : @"WindowExecutionId",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMMaintenanceWindowFilter class]];
}

@end

@implementation AWSSSMDescribeMaintenanceWindowExecutionTasksResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"windowExecutionTaskIdentities" : @"WindowExecutionTaskIdentities",
             };
}

+ (NSValueTransformer *)windowExecutionTaskIdentitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMMaintenanceWindowExecutionTaskIdentity class]];
}

@end

@implementation AWSSSMDescribeMaintenanceWindowExecutionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"windowId" : @"WindowId",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMMaintenanceWindowFilter class]];
}

@end

@implementation AWSSSMDescribeMaintenanceWindowExecutionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"windowExecutions" : @"WindowExecutions",
             };
}

+ (NSValueTransformer *)windowExecutionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMMaintenanceWindowExecution class]];
}

@end

@implementation AWSSSMDescribeMaintenanceWindowScheduleRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMPatchOrchestratorFilter class]];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSTANCE"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_GROUP"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowResourceTypeResourceGroup);
        }
        return @(AWSSSMMaintenanceWindowResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMMaintenanceWindowResourceTypeInstance:
                return @"INSTANCE";
            case AWSSSMMaintenanceWindowResourceTypeResourceGroup:
                return @"RESOURCE_GROUP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTarget class]];
}

@end

@implementation AWSSSMDescribeMaintenanceWindowScheduleResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"scheduledWindowExecutions" : @"ScheduledWindowExecutions",
             };
}

+ (NSValueTransformer *)scheduledWindowExecutionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMScheduledWindowExecution class]];
}

@end

@implementation AWSSSMDescribeMaintenanceWindowTargetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"windowId" : @"WindowId",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMMaintenanceWindowFilter class]];
}

@end

@implementation AWSSSMDescribeMaintenanceWindowTargetsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMMaintenanceWindowTarget class]];
}

@end

@implementation AWSSSMDescribeMaintenanceWindowTasksRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"windowId" : @"WindowId",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMMaintenanceWindowFilter class]];
}

@end

@implementation AWSSSMDescribeMaintenanceWindowTasksResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tasks" : @"Tasks",
             };
}

+ (NSValueTransformer *)tasksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMMaintenanceWindowTask class]];
}

@end

@implementation AWSSSMDescribeMaintenanceWindowsForTargetRequest

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
            return @(AWSSSMMaintenanceWindowResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_GROUP"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowResourceTypeResourceGroup);
        }
        return @(AWSSSMMaintenanceWindowResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMMaintenanceWindowResourceTypeInstance:
                return @"INSTANCE";
            case AWSSSMMaintenanceWindowResourceTypeResourceGroup:
                return @"RESOURCE_GROUP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTarget class]];
}

@end

@implementation AWSSSMDescribeMaintenanceWindowsForTargetResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"windowIdentities" : @"WindowIdentities",
             };
}

+ (NSValueTransformer *)windowIdentitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMMaintenanceWindowIdentityForTarget class]];
}

@end

@implementation AWSSSMDescribeMaintenanceWindowsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMMaintenanceWindowFilter class]];
}

@end

@implementation AWSSSMDescribeMaintenanceWindowsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"windowIdentities" : @"WindowIdentities",
             };
}

+ (NSValueTransformer *)windowIdentitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMMaintenanceWindowIdentity class]];
}

@end

@implementation AWSSSMDescribeOpsItemsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"opsItemFilters" : @"OpsItemFilters",
             };
}

+ (NSValueTransformer *)opsItemFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMOpsItemFilter class]];
}

@end

@implementation AWSSSMDescribeOpsItemsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"opsItemSummaries" : @"OpsItemSummaries",
             };
}

+ (NSValueTransformer *)opsItemSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMOpsItemSummary class]];
}

@end

@implementation AWSSSMDescribeParametersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"parameterFilters" : @"ParameterFilters",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMParametersFilter class]];
}

+ (NSValueTransformer *)parameterFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMParameterStringFilter class]];
}

@end

@implementation AWSSSMDescribeParametersResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMParameterMetadata class]];
}

@end

@implementation AWSSSMDescribePatchBaselinesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMPatchOrchestratorFilter class]];
}

@end

@implementation AWSSSMDescribePatchBaselinesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineIdentities" : @"BaselineIdentities",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)baselineIdentitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMPatchBaselineIdentity class]];
}

@end

@implementation AWSSSMDescribePatchGroupStateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"patchGroup" : @"PatchGroup",
             };
}

@end

@implementation AWSSSMDescribePatchGroupStateResult

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

@implementation AWSSSMDescribePatchGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMPatchOrchestratorFilter class]];
}

@end

@implementation AWSSSMDescribePatchGroupsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mappings" : @"Mappings",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)mappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMPatchGroupPatchBaselineMapping class]];
}

@end

@implementation AWSSSMDescribePatchPropertiesRequest

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
            return @(AWSSSMOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemCentos);
        }
        return @(AWSSSMOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSSMOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSSMOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSSMOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSSMOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSSMOperatingSystemSuse:
                return @"SUSE";
            case AWSSSMOperatingSystemCentos:
                return @"CENTOS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)patchSetJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OS"] == NSOrderedSame) {
            return @(AWSSSMPatchSetOs);
        }
        if ([value caseInsensitiveCompare:@"APPLICATION"] == NSOrderedSame) {
            return @(AWSSSMPatchSetApplication);
        }
        return @(AWSSSMPatchSetUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMPatchSetOs:
                return @"OS";
            case AWSSSMPatchSetApplication:
                return @"APPLICATION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)propertyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRODUCT"] == NSOrderedSame) {
            return @(AWSSSMPatchPropertyProduct);
        }
        if ([value caseInsensitiveCompare:@"PRODUCT_FAMILY"] == NSOrderedSame) {
            return @(AWSSSMPatchPropertyProductFamily);
        }
        if ([value caseInsensitiveCompare:@"CLASSIFICATION"] == NSOrderedSame) {
            return @(AWSSSMPatchPropertyClassification);
        }
        if ([value caseInsensitiveCompare:@"MSRC_SEVERITY"] == NSOrderedSame) {
            return @(AWSSSMPatchPropertyMsrcSeverity);
        }
        if ([value caseInsensitiveCompare:@"PRIORITY"] == NSOrderedSame) {
            return @(AWSSSMPatchPropertyPriority);
        }
        if ([value caseInsensitiveCompare:@"SEVERITY"] == NSOrderedSame) {
            return @(AWSSSMPatchPropertySeverity);
        }
        return @(AWSSSMPatchPropertyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMPatchPropertyProduct:
                return @"PRODUCT";
            case AWSSSMPatchPropertyProductFamily:
                return @"PRODUCT_FAMILY";
            case AWSSSMPatchPropertyClassification:
                return @"CLASSIFICATION";
            case AWSSSMPatchPropertyMsrcSeverity:
                return @"MSRC_SEVERITY";
            case AWSSSMPatchPropertyPriority:
                return @"PRIORITY";
            case AWSSSMPatchPropertySeverity:
                return @"SEVERITY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMDescribePatchPropertiesResult

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

@implementation AWSSSMDescribeSessionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMSessionFilter class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSSSMSessionStateActive);
        }
        if ([value caseInsensitiveCompare:@"History"] == NSOrderedSame) {
            return @(AWSSSMSessionStateHistory);
        }
        return @(AWSSSMSessionStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMSessionStateActive:
                return @"Active";
            case AWSSSMSessionStateHistory:
                return @"History";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMDescribeSessionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"sessions" : @"Sessions",
             };
}

+ (NSValueTransformer *)sessionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMSession class]];
}

@end

@implementation AWSSSMDocumentDefaultVersionDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultVersion" : @"DefaultVersion",
             @"defaultVersionName" : @"DefaultVersionName",
             @"name" : @"Name",
             };
}

@end

@implementation AWSSSMDocumentDescription

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMAttachmentInformation class]];
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
            return @(AWSSSMDocumentFormatYaml);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSSSMDocumentFormatJson);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSSSMDocumentFormatText);
        }
        return @(AWSSSMDocumentFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMDocumentFormatYaml:
                return @"YAML";
            case AWSSSMDocumentFormatJson:
                return @"JSON";
            case AWSSSMDocumentFormatText:
                return @"TEXT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)documentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Command"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeCommand);
        }
        if ([value caseInsensitiveCompare:@"Policy"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypePolicy);
        }
        if ([value caseInsensitiveCompare:@"Automation"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"Session"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeSession);
        }
        if ([value caseInsensitiveCompare:@"Package"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypePackage);
        }
        if ([value caseInsensitiveCompare:@"ApplicationConfiguration"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeApplicationConfiguration);
        }
        if ([value caseInsensitiveCompare:@"ApplicationConfigurationSchema"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeApplicationConfigurationSchema);
        }
        if ([value caseInsensitiveCompare:@"DeploymentStrategy"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeDeploymentStrategy);
        }
        if ([value caseInsensitiveCompare:@"ChangeCalendar"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeChangeCalendar);
        }
        return @(AWSSSMDocumentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMDocumentTypeCommand:
                return @"Command";
            case AWSSSMDocumentTypePolicy:
                return @"Policy";
            case AWSSSMDocumentTypeAutomation:
                return @"Automation";
            case AWSSSMDocumentTypeSession:
                return @"Session";
            case AWSSSMDocumentTypePackage:
                return @"Package";
            case AWSSSMDocumentTypeApplicationConfiguration:
                return @"ApplicationConfiguration";
            case AWSSSMDocumentTypeApplicationConfigurationSchema:
                return @"ApplicationConfigurationSchema";
            case AWSSSMDocumentTypeDeploymentStrategy:
                return @"DeploymentStrategy";
            case AWSSSMDocumentTypeChangeCalendar:
                return @"ChangeCalendar";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)hashTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Sha256"] == NSOrderedSame) {
            return @(AWSSSMDocumentHashTypeSha256);
        }
        if ([value caseInsensitiveCompare:@"Sha1"] == NSOrderedSame) {
            return @(AWSSSMDocumentHashTypeSha1);
        }
        return @(AWSSSMDocumentHashTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMDocumentHashTypeSha256:
                return @"Sha256";
            case AWSSSMDocumentHashTypeSha1:
                return @"Sha1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMDocumentParameter class]];
}

+ (NSValueTransformer *)requiresJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMDocumentRequires class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Creating"] == NSOrderedSame) {
            return @(AWSSSMDocumentStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSSSMDocumentStatusActive);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSSSMDocumentStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSSMDocumentStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSSMDocumentStatusFailed);
        }
        return @(AWSSSMDocumentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMDocumentStatusCreating:
                return @"Creating";
            case AWSSSMDocumentStatusActive:
                return @"Active";
            case AWSSSMDocumentStatusUpdating:
                return @"Updating";
            case AWSSSMDocumentStatusDeleting:
                return @"Deleting";
            case AWSSSMDocumentStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTag class]];
}

@end

@implementation AWSSSMDocumentFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSSSMDocumentFilterKeyName);
        }
        if ([value caseInsensitiveCompare:@"Owner"] == NSOrderedSame) {
            return @(AWSSSMDocumentFilterKeyOwner);
        }
        if ([value caseInsensitiveCompare:@"PlatformTypes"] == NSOrderedSame) {
            return @(AWSSSMDocumentFilterKeyPlatformTypes);
        }
        if ([value caseInsensitiveCompare:@"DocumentType"] == NSOrderedSame) {
            return @(AWSSSMDocumentFilterKeyDocumentType);
        }
        return @(AWSSSMDocumentFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMDocumentFilterKeyName:
                return @"Name";
            case AWSSSMDocumentFilterKeyOwner:
                return @"Owner";
            case AWSSSMDocumentFilterKeyPlatformTypes:
                return @"PlatformTypes";
            case AWSSSMDocumentFilterKeyDocumentType:
                return @"DocumentType";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMDocumentIdentifier

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
            return @(AWSSSMDocumentFormatYaml);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSSSMDocumentFormatJson);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSSSMDocumentFormatText);
        }
        return @(AWSSSMDocumentFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMDocumentFormatYaml:
                return @"YAML";
            case AWSSSMDocumentFormatJson:
                return @"JSON";
            case AWSSSMDocumentFormatText:
                return @"TEXT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)documentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Command"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeCommand);
        }
        if ([value caseInsensitiveCompare:@"Policy"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypePolicy);
        }
        if ([value caseInsensitiveCompare:@"Automation"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"Session"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeSession);
        }
        if ([value caseInsensitiveCompare:@"Package"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypePackage);
        }
        if ([value caseInsensitiveCompare:@"ApplicationConfiguration"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeApplicationConfiguration);
        }
        if ([value caseInsensitiveCompare:@"ApplicationConfigurationSchema"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeApplicationConfigurationSchema);
        }
        if ([value caseInsensitiveCompare:@"DeploymentStrategy"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeDeploymentStrategy);
        }
        if ([value caseInsensitiveCompare:@"ChangeCalendar"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeChangeCalendar);
        }
        return @(AWSSSMDocumentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMDocumentTypeCommand:
                return @"Command";
            case AWSSSMDocumentTypePolicy:
                return @"Policy";
            case AWSSSMDocumentTypeAutomation:
                return @"Automation";
            case AWSSSMDocumentTypeSession:
                return @"Session";
            case AWSSSMDocumentTypePackage:
                return @"Package";
            case AWSSSMDocumentTypeApplicationConfiguration:
                return @"ApplicationConfiguration";
            case AWSSSMDocumentTypeApplicationConfigurationSchema:
                return @"ApplicationConfigurationSchema";
            case AWSSSMDocumentTypeDeploymentStrategy:
                return @"DeploymentStrategy";
            case AWSSSMDocumentTypeChangeCalendar:
                return @"ChangeCalendar";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requiresJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMDocumentRequires class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTag class]];
}

@end

@implementation AWSSSMDocumentKeyValuesFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

@end

@implementation AWSSSMDocumentParameter

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
            return @(AWSSSMDocumentParameterTypeString);
        }
        if ([value caseInsensitiveCompare:@"StringList"] == NSOrderedSame) {
            return @(AWSSSMDocumentParameterTypeStringList);
        }
        return @(AWSSSMDocumentParameterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMDocumentParameterTypeString:
                return @"String";
            case AWSSSMDocumentParameterTypeStringList:
                return @"StringList";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMDocumentRequires

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"version" : @"Version",
             };
}

@end

@implementation AWSSSMDocumentVersionInfo

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
            return @(AWSSSMDocumentFormatYaml);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSSSMDocumentFormatJson);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSSSMDocumentFormatText);
        }
        return @(AWSSSMDocumentFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMDocumentFormatYaml:
                return @"YAML";
            case AWSSSMDocumentFormatJson:
                return @"JSON";
            case AWSSSMDocumentFormatText:
                return @"TEXT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Creating"] == NSOrderedSame) {
            return @(AWSSSMDocumentStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSSSMDocumentStatusActive);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSSSMDocumentStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSSMDocumentStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSSMDocumentStatusFailed);
        }
        return @(AWSSSMDocumentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMDocumentStatusCreating:
                return @"Creating";
            case AWSSSMDocumentStatusActive:
                return @"Active";
            case AWSSSMDocumentStatusUpdating:
                return @"Updating";
            case AWSSSMDocumentStatusDeleting:
                return @"Deleting";
            case AWSSSMDocumentStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMEffectivePatch

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"patch" : @"Patch",
             @"patchStatus" : @"PatchStatus",
             };
}

+ (NSValueTransformer *)patchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMPatch class]];
}

+ (NSValueTransformer *)patchStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMPatchStatus class]];
}

@end

@implementation AWSSSMFailedCreateAssociation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entry" : @"Entry",
             @"fault" : @"Fault",
             @"message" : @"Message",
             };
}

+ (NSValueTransformer *)entryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMCreateAssociationBatchRequestEntry class]];
}

+ (NSValueTransformer *)faultJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Client"] == NSOrderedSame) {
            return @(AWSSSMFaultClient);
        }
        if ([value caseInsensitiveCompare:@"Server"] == NSOrderedSame) {
            return @(AWSSSMFaultServer);
        }
        if ([value caseInsensitiveCompare:@"Unknown"] == NSOrderedSame) {
            return @(AWSSSMFaultUnknown);
        }
        return @(AWSSSMFaultUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMFaultClient:
                return @"Client";
            case AWSSSMFaultServer:
                return @"Server";
            case AWSSSMFaultUnknown:
                return @"Unknown";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMFailureDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"details" : @"Details",
             @"failureStage" : @"FailureStage",
             @"failureType" : @"FailureType",
             };
}

@end

@implementation AWSSSMGetAutomationExecutionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automationExecutionId" : @"AutomationExecutionId",
             };
}

@end

@implementation AWSSSMGetAutomationExecutionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automationExecution" : @"AutomationExecution",
             };
}

+ (NSValueTransformer *)automationExecutionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMAutomationExecution class]];
}

@end

@implementation AWSSSMGetCalendarStateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"atTime" : @"AtTime",
             @"calendarNames" : @"CalendarNames",
             };
}

@end

@implementation AWSSSMGetCalendarStateResponse

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
            return @(AWSSSMCalendarStateOpen);
        }
        if ([value caseInsensitiveCompare:@"CLOSED"] == NSOrderedSame) {
            return @(AWSSSMCalendarStateClosed);
        }
        return @(AWSSSMCalendarStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMCalendarStateOpen:
                return @"OPEN";
            case AWSSSMCalendarStateClosed:
                return @"CLOSED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMGetCommandInvocationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commandId" : @"CommandId",
             @"instanceId" : @"InstanceId",
             @"pluginName" : @"PluginName",
             };
}

@end

@implementation AWSSSMGetCommandInvocationResult

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMCloudWatchOutputConfig class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSSMCommandInvocationStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSSMCommandInvocationStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Delayed"] == NSOrderedSame) {
            return @(AWSSSMCommandInvocationStatusDelayed);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSSMCommandInvocationStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSSMCommandInvocationStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"TimedOut"] == NSOrderedSame) {
            return @(AWSSSMCommandInvocationStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSSMCommandInvocationStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Cancelling"] == NSOrderedSame) {
            return @(AWSSSMCommandInvocationStatusCancelling);
        }
        return @(AWSSSMCommandInvocationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMCommandInvocationStatusPending:
                return @"Pending";
            case AWSSSMCommandInvocationStatusInProgress:
                return @"InProgress";
            case AWSSSMCommandInvocationStatusDelayed:
                return @"Delayed";
            case AWSSSMCommandInvocationStatusSuccess:
                return @"Success";
            case AWSSSMCommandInvocationStatusCancelled:
                return @"Cancelled";
            case AWSSSMCommandInvocationStatusTimedOut:
                return @"TimedOut";
            case AWSSSMCommandInvocationStatusFailed:
                return @"Failed";
            case AWSSSMCommandInvocationStatusCancelling:
                return @"Cancelling";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMGetConnectionStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"target" : @"Target",
             };
}

@end

@implementation AWSSSMGetConnectionStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             @"target" : @"Target",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Connected"] == NSOrderedSame) {
            return @(AWSSSMConnectionStatusConnected);
        }
        if ([value caseInsensitiveCompare:@"NotConnected"] == NSOrderedSame) {
            return @(AWSSSMConnectionStatusNotConnected);
        }
        return @(AWSSSMConnectionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMConnectionStatusConnected:
                return @"Connected";
            case AWSSSMConnectionStatusNotConnected:
                return @"NotConnected";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMGetDefaultPatchBaselineRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operatingSystem" : @"OperatingSystem",
             };
}

+ (NSValueTransformer *)operatingSystemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WINDOWS"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemCentos);
        }
        return @(AWSSSMOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSSMOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSSMOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSSMOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSSMOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSSMOperatingSystemSuse:
                return @"SUSE";
            case AWSSSMOperatingSystemCentos:
                return @"CENTOS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMGetDefaultPatchBaselineResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             @"operatingSystem" : @"OperatingSystem",
             };
}

+ (NSValueTransformer *)operatingSystemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WINDOWS"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemCentos);
        }
        return @(AWSSSMOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSSMOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSSMOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSSMOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSSMOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSSMOperatingSystemSuse:
                return @"SUSE";
            case AWSSSMOperatingSystemCentos:
                return @"CENTOS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMGetDeployablePatchSnapshotForInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"snapshotId" : @"SnapshotId",
             };
}

@end

@implementation AWSSSMGetDeployablePatchSnapshotForInstanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"product" : @"Product",
             @"snapshotDownloadUrl" : @"SnapshotDownloadUrl",
             @"snapshotId" : @"SnapshotId",
             };
}

@end

@implementation AWSSSMGetDocumentRequest

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
            return @(AWSSSMDocumentFormatYaml);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSSSMDocumentFormatJson);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSSSMDocumentFormatText);
        }
        return @(AWSSSMDocumentFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMDocumentFormatYaml:
                return @"YAML";
            case AWSSSMDocumentFormatJson:
                return @"JSON";
            case AWSSSMDocumentFormatText:
                return @"TEXT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMGetDocumentResult

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMAttachmentContent class]];
}

+ (NSValueTransformer *)documentFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"YAML"] == NSOrderedSame) {
            return @(AWSSSMDocumentFormatYaml);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSSSMDocumentFormatJson);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSSSMDocumentFormatText);
        }
        return @(AWSSSMDocumentFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMDocumentFormatYaml:
                return @"YAML";
            case AWSSSMDocumentFormatJson:
                return @"JSON";
            case AWSSSMDocumentFormatText:
                return @"TEXT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)documentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Command"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeCommand);
        }
        if ([value caseInsensitiveCompare:@"Policy"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypePolicy);
        }
        if ([value caseInsensitiveCompare:@"Automation"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"Session"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeSession);
        }
        if ([value caseInsensitiveCompare:@"Package"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypePackage);
        }
        if ([value caseInsensitiveCompare:@"ApplicationConfiguration"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeApplicationConfiguration);
        }
        if ([value caseInsensitiveCompare:@"ApplicationConfigurationSchema"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeApplicationConfigurationSchema);
        }
        if ([value caseInsensitiveCompare:@"DeploymentStrategy"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeDeploymentStrategy);
        }
        if ([value caseInsensitiveCompare:@"ChangeCalendar"] == NSOrderedSame) {
            return @(AWSSSMDocumentTypeChangeCalendar);
        }
        return @(AWSSSMDocumentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMDocumentTypeCommand:
                return @"Command";
            case AWSSSMDocumentTypePolicy:
                return @"Policy";
            case AWSSSMDocumentTypeAutomation:
                return @"Automation";
            case AWSSSMDocumentTypeSession:
                return @"Session";
            case AWSSSMDocumentTypePackage:
                return @"Package";
            case AWSSSMDocumentTypeApplicationConfiguration:
                return @"ApplicationConfiguration";
            case AWSSSMDocumentTypeApplicationConfigurationSchema:
                return @"ApplicationConfigurationSchema";
            case AWSSSMDocumentTypeDeploymentStrategy:
                return @"DeploymentStrategy";
            case AWSSSMDocumentTypeChangeCalendar:
                return @"ChangeCalendar";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requiresJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMDocumentRequires class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Creating"] == NSOrderedSame) {
            return @(AWSSSMDocumentStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSSSMDocumentStatusActive);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSSSMDocumentStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSSMDocumentStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSSMDocumentStatusFailed);
        }
        return @(AWSSSMDocumentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMDocumentStatusCreating:
                return @"Creating";
            case AWSSSMDocumentStatusActive:
                return @"Active";
            case AWSSSMDocumentStatusUpdating:
                return @"Updating";
            case AWSSSMDocumentStatusDeleting:
                return @"Deleting";
            case AWSSSMDocumentStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMGetInventoryRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMInventoryAggregator class]];
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMInventoryFilter class]];
}

+ (NSValueTransformer *)resultAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMResultAttribute class]];
}

@end

@implementation AWSSSMGetInventoryResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entities" : @"Entities",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)entitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMInventoryResultEntity class]];
}

@end

@implementation AWSSSMGetInventorySchemaRequest

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

@implementation AWSSSMGetInventorySchemaResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"schemas" : @"Schemas",
             };
}

+ (NSValueTransformer *)schemasJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMInventoryItemSchema class]];
}

@end

@implementation AWSSSMGetMaintenanceWindowExecutionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowExecutionId" : @"WindowExecutionId",
             };
}

@end

@implementation AWSSSMGetMaintenanceWindowExecutionResult

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
            return @(AWSSSMMaintenanceWindowExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"CANCELLING"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"SKIPPED_OVERLAPPING"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusSkippedOverlapping);
        }
        return @(AWSSSMMaintenanceWindowExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMMaintenanceWindowExecutionStatusPending:
                return @"PENDING";
            case AWSSSMMaintenanceWindowExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSSSMMaintenanceWindowExecutionStatusSuccess:
                return @"SUCCESS";
            case AWSSSMMaintenanceWindowExecutionStatusFailed:
                return @"FAILED";
            case AWSSSMMaintenanceWindowExecutionStatusTimedOut:
                return @"TIMED_OUT";
            case AWSSSMMaintenanceWindowExecutionStatusCancelling:
                return @"CANCELLING";
            case AWSSSMMaintenanceWindowExecutionStatusCancelled:
                return @"CANCELLED";
            case AWSSSMMaintenanceWindowExecutionStatusSkippedOverlapping:
                return @"SKIPPED_OVERLAPPING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMGetMaintenanceWindowExecutionTaskInvocationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invocationId" : @"InvocationId",
             @"taskId" : @"TaskId",
             @"windowExecutionId" : @"WindowExecutionId",
             };
}

@end

@implementation AWSSSMGetMaintenanceWindowExecutionTaskInvocationResult

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
            return @(AWSSSMMaintenanceWindowExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"CANCELLING"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"SKIPPED_OVERLAPPING"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusSkippedOverlapping);
        }
        return @(AWSSSMMaintenanceWindowExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMMaintenanceWindowExecutionStatusPending:
                return @"PENDING";
            case AWSSSMMaintenanceWindowExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSSSMMaintenanceWindowExecutionStatusSuccess:
                return @"SUCCESS";
            case AWSSSMMaintenanceWindowExecutionStatusFailed:
                return @"FAILED";
            case AWSSSMMaintenanceWindowExecutionStatusTimedOut:
                return @"TIMED_OUT";
            case AWSSSMMaintenanceWindowExecutionStatusCancelling:
                return @"CANCELLING";
            case AWSSSMMaintenanceWindowExecutionStatusCancelled:
                return @"CANCELLED";
            case AWSSSMMaintenanceWindowExecutionStatusSkippedOverlapping:
                return @"SKIPPED_OVERLAPPING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taskTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUN_COMMAND"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeRunCommand);
        }
        if ([value caseInsensitiveCompare:@"AUTOMATION"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"STEP_FUNCTIONS"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeStepFunctions);
        }
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeLambda);
        }
        return @(AWSSSMMaintenanceWindowTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMMaintenanceWindowTaskTypeRunCommand:
                return @"RUN_COMMAND";
            case AWSSSMMaintenanceWindowTaskTypeAutomation:
                return @"AUTOMATION";
            case AWSSSMMaintenanceWindowTaskTypeStepFunctions:
                return @"STEP_FUNCTIONS";
            case AWSSSMMaintenanceWindowTaskTypeLambda:
                return @"LAMBDA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMGetMaintenanceWindowExecutionTaskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"TaskId",
             @"windowExecutionId" : @"WindowExecutionId",
             };
}

@end

@implementation AWSSSMGetMaintenanceWindowExecutionTaskResult

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
            return @(AWSSSMMaintenanceWindowExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"CANCELLING"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"SKIPPED_OVERLAPPING"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusSkippedOverlapping);
        }
        return @(AWSSSMMaintenanceWindowExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMMaintenanceWindowExecutionStatusPending:
                return @"PENDING";
            case AWSSSMMaintenanceWindowExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSSSMMaintenanceWindowExecutionStatusSuccess:
                return @"SUCCESS";
            case AWSSSMMaintenanceWindowExecutionStatusFailed:
                return @"FAILED";
            case AWSSSMMaintenanceWindowExecutionStatusTimedOut:
                return @"TIMED_OUT";
            case AWSSSMMaintenanceWindowExecutionStatusCancelling:
                return @"CANCELLING";
            case AWSSSMMaintenanceWindowExecutionStatusCancelled:
                return @"CANCELLED";
            case AWSSSMMaintenanceWindowExecutionStatusSkippedOverlapping:
                return @"SKIPPED_OVERLAPPING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taskParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[AWSSSMMaintenanceWindowTaskParameterValueExpression class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUN_COMMAND"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeRunCommand);
        }
        if ([value caseInsensitiveCompare:@"AUTOMATION"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"STEP_FUNCTIONS"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeStepFunctions);
        }
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeLambda);
        }
        return @(AWSSSMMaintenanceWindowTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMMaintenanceWindowTaskTypeRunCommand:
                return @"RUN_COMMAND";
            case AWSSSMMaintenanceWindowTaskTypeAutomation:
                return @"AUTOMATION";
            case AWSSSMMaintenanceWindowTaskTypeStepFunctions:
                return @"STEP_FUNCTIONS";
            case AWSSSMMaintenanceWindowTaskTypeLambda:
                return @"LAMBDA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMGetMaintenanceWindowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowId" : @"WindowId",
             };
}

@end

@implementation AWSSSMGetMaintenanceWindowResult

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

@implementation AWSSSMGetMaintenanceWindowTaskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowId" : @"WindowId",
             @"windowTaskId" : @"WindowTaskId",
             };
}

@end

@implementation AWSSSMGetMaintenanceWindowTaskResult

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMLoggingInfo class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTarget class]];
}

+ (NSValueTransformer *)taskInvocationParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMMaintenanceWindowTaskInvocationParameters class]];
}

+ (NSValueTransformer *)taskParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSSMMaintenanceWindowTaskParameterValueExpression class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)taskTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUN_COMMAND"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeRunCommand);
        }
        if ([value caseInsensitiveCompare:@"AUTOMATION"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"STEP_FUNCTIONS"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeStepFunctions);
        }
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeLambda);
        }
        return @(AWSSSMMaintenanceWindowTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMMaintenanceWindowTaskTypeRunCommand:
                return @"RUN_COMMAND";
            case AWSSSMMaintenanceWindowTaskTypeAutomation:
                return @"AUTOMATION";
            case AWSSSMMaintenanceWindowTaskTypeStepFunctions:
                return @"STEP_FUNCTIONS";
            case AWSSSMMaintenanceWindowTaskTypeLambda:
                return @"LAMBDA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMGetOpsItemRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"opsItemId" : @"OpsItemId",
             };
}

@end

@implementation AWSSSMGetOpsItemResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"opsItem" : @"OpsItem",
             };
}

+ (NSValueTransformer *)opsItemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMOpsItem class]];
}

@end

@implementation AWSSSMGetOpsSummaryRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMOpsAggregator class]];
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMOpsFilter class]];
}

+ (NSValueTransformer *)resultAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMOpsResultAttribute class]];
}

@end

@implementation AWSSSMGetOpsSummaryResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entities" : @"Entities",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)entitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMOpsEntity class]];
}

@end

@implementation AWSSSMGetParameterHistoryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"name" : @"Name",
             @"nextToken" : @"NextToken",
             @"withDecryption" : @"WithDecryption",
             };
}

@end

@implementation AWSSSMGetParameterHistoryResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMParameterHistory class]];
}

@end

@implementation AWSSSMGetParameterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"withDecryption" : @"WithDecryption",
             };
}

@end

@implementation AWSSSMGetParameterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameter" : @"Parameter",
             };
}

+ (NSValueTransformer *)parameterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMParameter class]];
}

@end

@implementation AWSSSMGetParametersByPathRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMParameterStringFilter class]];
}

@end

@implementation AWSSSMGetParametersByPathResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMParameter class]];
}

@end

@implementation AWSSSMGetParametersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"names" : @"Names",
             @"withDecryption" : @"WithDecryption",
             };
}

@end

@implementation AWSSSMGetParametersResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invalidParameters" : @"InvalidParameters",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMParameter class]];
}

@end

@implementation AWSSSMGetPatchBaselineForPatchGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operatingSystem" : @"OperatingSystem",
             @"patchGroup" : @"PatchGroup",
             };
}

+ (NSValueTransformer *)operatingSystemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WINDOWS"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemCentos);
        }
        return @(AWSSSMOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSSMOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSSMOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSSMOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSSMOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSSMOperatingSystemSuse:
                return @"SUSE";
            case AWSSSMOperatingSystemCentos:
                return @"CENTOS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMGetPatchBaselineForPatchGroupResult

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
            return @(AWSSSMOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemCentos);
        }
        return @(AWSSSMOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSSMOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSSMOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSSMOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSSMOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSSMOperatingSystemSuse:
                return @"SUSE";
            case AWSSSMOperatingSystemCentos:
                return @"CENTOS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMGetPatchBaselineRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             };
}

@end

@implementation AWSSSMGetPatchBaselineResult

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMPatchRuleGroup class]];
}

+ (NSValueTransformer *)approvedPatchesComplianceLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelUnspecified);
        }
        return @(AWSSSMPatchComplianceLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMPatchComplianceLevelCritical:
                return @"CRITICAL";
            case AWSSSMPatchComplianceLevelHigh:
                return @"HIGH";
            case AWSSSMPatchComplianceLevelMedium:
                return @"MEDIUM";
            case AWSSSMPatchComplianceLevelLow:
                return @"LOW";
            case AWSSSMPatchComplianceLevelInformational:
                return @"INFORMATIONAL";
            case AWSSSMPatchComplianceLevelUnspecified:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMPatchFilterGroup class]];
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
            return @(AWSSSMOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemCentos);
        }
        return @(AWSSSMOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSSMOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSSMOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSSMOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSSMOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSSMOperatingSystemSuse:
                return @"SUSE";
            case AWSSSMOperatingSystemCentos:
                return @"CENTOS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rejectedPatchesActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALLOW_AS_DEPENDENCY"] == NSOrderedSame) {
            return @(AWSSSMPatchActionAllowAsDependency);
        }
        if ([value caseInsensitiveCompare:@"BLOCK"] == NSOrderedSame) {
            return @(AWSSSMPatchActionBlock);
        }
        return @(AWSSSMPatchActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMPatchActionAllowAsDependency:
                return @"ALLOW_AS_DEPENDENCY";
            case AWSSSMPatchActionBlock:
                return @"BLOCK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMPatchSource class]];
}

@end

@implementation AWSSSMGetServiceSettingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"settingId" : @"SettingId",
             };
}

@end

@implementation AWSSSMGetServiceSettingResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceSetting" : @"ServiceSetting",
             };
}

+ (NSValueTransformer *)serviceSettingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMServiceSetting class]];
}

@end

@implementation AWSSSMInstanceAggregatedAssociationOverview

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detailedStatus" : @"DetailedStatus",
             @"instanceAssociationStatusAggregatedCount" : @"InstanceAssociationStatusAggregatedCount",
             };
}

@end

@implementation AWSSSMInstanceAssociation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"associationVersion" : @"AssociationVersion",
             @"content" : @"Content",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSSSMInstanceAssociationOutputLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Location" : @"S3Location",
             };
}

+ (NSValueTransformer *)s3LocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMS3OutputLocation class]];
}

@end

@implementation AWSSSMInstanceAssociationOutputUrl

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3OutputUrl" : @"S3OutputUrl",
             };
}

+ (NSValueTransformer *)s3OutputUrlJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMS3OutputUrl class]];
}

@end

@implementation AWSSSMInstanceAssociationStatusInfo

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMInstanceAssociationOutputUrl class]];
}

@end

@implementation AWSSSMInstanceInformation

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMInstanceAggregatedAssociationOverview class]];
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
            return @(AWSSSMPingStatusOnline);
        }
        if ([value caseInsensitiveCompare:@"ConnectionLost"] == NSOrderedSame) {
            return @(AWSSSMPingStatusConnectionLost);
        }
        if ([value caseInsensitiveCompare:@"Inactive"] == NSOrderedSame) {
            return @(AWSSSMPingStatusInactive);
        }
        return @(AWSSSMPingStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMPingStatusOnline:
                return @"Online";
            case AWSSSMPingStatusConnectionLost:
                return @"ConnectionLost";
            case AWSSSMPingStatusInactive:
                return @"Inactive";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)platformTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSSSMPlatformTypeWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSSSMPlatformTypeLinux);
        }
        return @(AWSSSMPlatformTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMPlatformTypeWindows:
                return @"Windows";
            case AWSSSMPlatformTypeLinux:
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
            return @(AWSSSMResourceTypeManagedInstance);
        }
        if ([value caseInsensitiveCompare:@"Document"] == NSOrderedSame) {
            return @(AWSSSMResourceTypeDocument);
        }
        if ([value caseInsensitiveCompare:@"EC2Instance"] == NSOrderedSame) {
            return @(AWSSSMResourceTypeEC2Instance);
        }
        return @(AWSSSMResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMResourceTypeManagedInstance:
                return @"ManagedInstance";
            case AWSSSMResourceTypeDocument:
                return @"Document";
            case AWSSSMResourceTypeEC2Instance:
                return @"EC2Instance";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMInstanceInformationFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"valueSet" : @"valueSet",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InstanceIds"] == NSOrderedSame) {
            return @(AWSSSMInstanceInformationFilterKeyInstanceIds);
        }
        if ([value caseInsensitiveCompare:@"AgentVersion"] == NSOrderedSame) {
            return @(AWSSSMInstanceInformationFilterKeyAgentVersion);
        }
        if ([value caseInsensitiveCompare:@"PingStatus"] == NSOrderedSame) {
            return @(AWSSSMInstanceInformationFilterKeyPingStatus);
        }
        if ([value caseInsensitiveCompare:@"PlatformTypes"] == NSOrderedSame) {
            return @(AWSSSMInstanceInformationFilterKeyPlatformTypes);
        }
        if ([value caseInsensitiveCompare:@"ActivationIds"] == NSOrderedSame) {
            return @(AWSSSMInstanceInformationFilterKeyActivationIds);
        }
        if ([value caseInsensitiveCompare:@"IamRole"] == NSOrderedSame) {
            return @(AWSSSMInstanceInformationFilterKeyIamRole);
        }
        if ([value caseInsensitiveCompare:@"ResourceType"] == NSOrderedSame) {
            return @(AWSSSMInstanceInformationFilterKeyResourceType);
        }
        if ([value caseInsensitiveCompare:@"AssociationStatus"] == NSOrderedSame) {
            return @(AWSSSMInstanceInformationFilterKeyAssociationStatus);
        }
        return @(AWSSSMInstanceInformationFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMInstanceInformationFilterKeyInstanceIds:
                return @"InstanceIds";
            case AWSSSMInstanceInformationFilterKeyAgentVersion:
                return @"AgentVersion";
            case AWSSSMInstanceInformationFilterKeyPingStatus:
                return @"PingStatus";
            case AWSSSMInstanceInformationFilterKeyPlatformTypes:
                return @"PlatformTypes";
            case AWSSSMInstanceInformationFilterKeyActivationIds:
                return @"ActivationIds";
            case AWSSSMInstanceInformationFilterKeyIamRole:
                return @"IamRole";
            case AWSSSMInstanceInformationFilterKeyResourceType:
                return @"ResourceType";
            case AWSSSMInstanceInformationFilterKeyAssociationStatus:
                return @"AssociationStatus";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMInstanceInformationStringFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

@end

@implementation AWSSSMInstancePatchState

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
            return @(AWSSSMPatchOperationTypeScan);
        }
        if ([value caseInsensitiveCompare:@"Install"] == NSOrderedSame) {
            return @(AWSSSMPatchOperationTypeInstall);
        }
        return @(AWSSSMPatchOperationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMPatchOperationTypeScan:
                return @"Scan";
            case AWSSSMPatchOperationTypeInstall:
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
            return @(AWSSSMRebootOptionRebootIfNeeded);
        }
        if ([value caseInsensitiveCompare:@"NoReboot"] == NSOrderedSame) {
            return @(AWSSSMRebootOptionNoReboot);
        }
        return @(AWSSSMRebootOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMRebootOptionRebootIfNeeded:
                return @"RebootIfNeeded";
            case AWSSSMRebootOptionNoReboot:
                return @"NoReboot";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMInstancePatchStateFilter

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
            return @(AWSSSMInstancePatchStateOperatorTypeEqual);
        }
        if ([value caseInsensitiveCompare:@"NotEqual"] == NSOrderedSame) {
            return @(AWSSSMInstancePatchStateOperatorTypeNotEqual);
        }
        if ([value caseInsensitiveCompare:@"LessThan"] == NSOrderedSame) {
            return @(AWSSSMInstancePatchStateOperatorTypeLessThan);
        }
        if ([value caseInsensitiveCompare:@"GreaterThan"] == NSOrderedSame) {
            return @(AWSSSMInstancePatchStateOperatorTypeGreaterThan);
        }
        return @(AWSSSMInstancePatchStateOperatorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMInstancePatchStateOperatorTypeEqual:
                return @"Equal";
            case AWSSSMInstancePatchStateOperatorTypeNotEqual:
                return @"NotEqual";
            case AWSSSMInstancePatchStateOperatorTypeLessThan:
                return @"LessThan";
            case AWSSSMInstancePatchStateOperatorTypeGreaterThan:
                return @"GreaterThan";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMInventoryAggregator

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aggregators" : @"Aggregators",
             @"expression" : @"Expression",
             @"groups" : @"Groups",
             };
}

+ (NSValueTransformer *)aggregatorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMInventoryAggregator class]];
}

+ (NSValueTransformer *)groupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMInventoryGroup class]];
}

@end

@implementation AWSSSMInventoryDeletionStatusItem

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMInventoryDeletionSummary class]];
}

+ (NSValueTransformer *)lastStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSSMInventoryDeletionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSSSMInventoryDeletionStatusComplete);
        }
        return @(AWSSSMInventoryDeletionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMInventoryDeletionStatusInProgress:
                return @"InProgress";
            case AWSSSMInventoryDeletionStatusComplete:
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

@implementation AWSSSMInventoryDeletionSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"remainingCount" : @"RemainingCount",
             @"summaryItems" : @"SummaryItems",
             @"totalCount" : @"TotalCount",
             };
}

+ (NSValueTransformer *)summaryItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMInventoryDeletionSummaryItem class]];
}

@end

@implementation AWSSSMInventoryDeletionSummaryItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"count" : @"Count",
             @"remainingCount" : @"RemainingCount",
             @"version" : @"Version",
             };
}

@end

@implementation AWSSSMInventoryFilter

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
            return @(AWSSSMInventoryQueryOperatorTypeEqual);
        }
        if ([value caseInsensitiveCompare:@"NotEqual"] == NSOrderedSame) {
            return @(AWSSSMInventoryQueryOperatorTypeNotEqual);
        }
        if ([value caseInsensitiveCompare:@"BeginWith"] == NSOrderedSame) {
            return @(AWSSSMInventoryQueryOperatorTypeBeginWith);
        }
        if ([value caseInsensitiveCompare:@"LessThan"] == NSOrderedSame) {
            return @(AWSSSMInventoryQueryOperatorTypeLessThan);
        }
        if ([value caseInsensitiveCompare:@"GreaterThan"] == NSOrderedSame) {
            return @(AWSSSMInventoryQueryOperatorTypeGreaterThan);
        }
        if ([value caseInsensitiveCompare:@"Exists"] == NSOrderedSame) {
            return @(AWSSSMInventoryQueryOperatorTypeExists);
        }
        return @(AWSSSMInventoryQueryOperatorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMInventoryQueryOperatorTypeEqual:
                return @"Equal";
            case AWSSSMInventoryQueryOperatorTypeNotEqual:
                return @"NotEqual";
            case AWSSSMInventoryQueryOperatorTypeBeginWith:
                return @"BeginWith";
            case AWSSSMInventoryQueryOperatorTypeLessThan:
                return @"LessThan";
            case AWSSSMInventoryQueryOperatorTypeGreaterThan:
                return @"GreaterThan";
            case AWSSSMInventoryQueryOperatorTypeExists:
                return @"Exists";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMInventoryGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMInventoryFilter class]];
}

@end

@implementation AWSSSMInventoryItem

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

@implementation AWSSSMInventoryItemAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataType" : @"DataType",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)dataTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"string"] == NSOrderedSame) {
            return @(AWSSSMInventoryAttributeDataTypeString);
        }
        if ([value caseInsensitiveCompare:@"number"] == NSOrderedSame) {
            return @(AWSSSMInventoryAttributeDataTypeNumber);
        }
        return @(AWSSSMInventoryAttributeDataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMInventoryAttributeDataTypeString:
                return @"string";
            case AWSSSMInventoryAttributeDataTypeNumber:
                return @"number";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMInventoryItemSchema

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"displayName" : @"DisplayName",
             @"typeName" : @"TypeName",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMInventoryItemAttribute class]];
}

@end

@implementation AWSSSMInventoryResultEntity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"Data",
             @"identifier" : @"Id",
             };
}

+ (NSValueTransformer *)dataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSSMInventoryResultItem class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSSSMInventoryResultItem

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

@implementation AWSSSMLabelParameterVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labels" : @"Labels",
             @"name" : @"Name",
             @"parameterVersion" : @"ParameterVersion",
             };
}

@end

@implementation AWSSSMLabelParameterVersionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invalidLabels" : @"InvalidLabels",
             @"parameterVersion" : @"ParameterVersion",
             };
}

@end

@implementation AWSSSMListAssociationVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSSMListAssociationVersionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationVersions" : @"AssociationVersions",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)associationVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMAssociationVersionInfo class]];
}

@end

@implementation AWSSSMListAssociationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationFilterList" : @"AssociationFilterList",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)associationFilterListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMAssociationFilter class]];
}

@end

@implementation AWSSSMListAssociationsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associations" : @"Associations",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)associationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMAssociation class]];
}

@end

@implementation AWSSSMListCommandInvocationsRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMCommandFilter class]];
}

@end

@implementation AWSSSMListCommandInvocationsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commandInvocations" : @"CommandInvocations",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)commandInvocationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMCommandInvocation class]];
}

@end

@implementation AWSSSMListCommandsRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMCommandFilter class]];
}

@end

@implementation AWSSSMListCommandsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commands" : @"Commands",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)commandsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMCommand class]];
}

@end

@implementation AWSSSMListComplianceItemsRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMComplianceStringFilter class]];
}

@end

@implementation AWSSSMListComplianceItemsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"complianceItems" : @"ComplianceItems",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)complianceItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMComplianceItem class]];
}

@end

@implementation AWSSSMListComplianceSummariesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMComplianceStringFilter class]];
}

@end

@implementation AWSSSMListComplianceSummariesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"complianceSummaryItems" : @"ComplianceSummaryItems",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)complianceSummaryItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMComplianceSummaryItem class]];
}

@end

@implementation AWSSSMListDocumentVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"name" : @"Name",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSSMListDocumentVersionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentVersions" : @"DocumentVersions",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)documentVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMDocumentVersionInfo class]];
}

@end

@implementation AWSSSMListDocumentsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentFilterList" : @"DocumentFilterList",
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)documentFilterListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMDocumentFilter class]];
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMDocumentKeyValuesFilter class]];
}

@end

@implementation AWSSSMListDocumentsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentIdentifiers" : @"DocumentIdentifiers",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)documentIdentifiersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMDocumentIdentifier class]];
}

@end

@implementation AWSSSMListInventoryEntriesRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMInventoryFilter class]];
}

@end

@implementation AWSSSMListInventoryEntriesResult

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

@implementation AWSSSMListResourceComplianceSummariesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMComplianceStringFilter class]];
}

@end

@implementation AWSSSMListResourceComplianceSummariesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"resourceComplianceSummaryItems" : @"ResourceComplianceSummaryItems",
             };
}

+ (NSValueTransformer *)resourceComplianceSummaryItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMResourceComplianceSummaryItem class]];
}

@end

@implementation AWSSSMListResourceDataSyncRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"syncType" : @"SyncType",
             };
}

@end

@implementation AWSSSMListResourceDataSyncResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"resourceDataSyncItems" : @"ResourceDataSyncItems",
             };
}

+ (NSValueTransformer *)resourceDataSyncItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMResourceDataSyncItem class]];
}

@end

@implementation AWSSSMListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Document"] == NSOrderedSame) {
            return @(AWSSSMResourceTypeForTaggingDocument);
        }
        if ([value caseInsensitiveCompare:@"ManagedInstance"] == NSOrderedSame) {
            return @(AWSSSMResourceTypeForTaggingManagedInstance);
        }
        if ([value caseInsensitiveCompare:@"MaintenanceWindow"] == NSOrderedSame) {
            return @(AWSSSMResourceTypeForTaggingMaintenanceWindow);
        }
        if ([value caseInsensitiveCompare:@"Parameter"] == NSOrderedSame) {
            return @(AWSSSMResourceTypeForTaggingParameter);
        }
        if ([value caseInsensitiveCompare:@"PatchBaseline"] == NSOrderedSame) {
            return @(AWSSSMResourceTypeForTaggingPatchBaseline);
        }
        if ([value caseInsensitiveCompare:@"OpsItem"] == NSOrderedSame) {
            return @(AWSSSMResourceTypeForTaggingOpsItem);
        }
        return @(AWSSSMResourceTypeForTaggingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMResourceTypeForTaggingDocument:
                return @"Document";
            case AWSSSMResourceTypeForTaggingManagedInstance:
                return @"ManagedInstance";
            case AWSSSMResourceTypeForTaggingMaintenanceWindow:
                return @"MaintenanceWindow";
            case AWSSSMResourceTypeForTaggingParameter:
                return @"Parameter";
            case AWSSSMResourceTypeForTaggingPatchBaseline:
                return @"PatchBaseline";
            case AWSSSMResourceTypeForTaggingOpsItem:
                return @"OpsItem";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMListTagsForResourceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagList" : @"TagList",
             };
}

+ (NSValueTransformer *)tagListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTag class]];
}

@end

@implementation AWSSSMLoggingInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3BucketName" : @"S3BucketName",
             @"s3KeyPrefix" : @"S3KeyPrefix",
             @"s3Region" : @"S3Region",
             };
}

@end

@implementation AWSSSMMaintenanceWindowAutomationParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentVersion" : @"DocumentVersion",
             @"parameters" : @"Parameters",
             };
}

@end

@implementation AWSSSMMaintenanceWindowExecution

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
            return @(AWSSSMMaintenanceWindowExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"CANCELLING"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"SKIPPED_OVERLAPPING"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusSkippedOverlapping);
        }
        return @(AWSSSMMaintenanceWindowExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMMaintenanceWindowExecutionStatusPending:
                return @"PENDING";
            case AWSSSMMaintenanceWindowExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSSSMMaintenanceWindowExecutionStatusSuccess:
                return @"SUCCESS";
            case AWSSSMMaintenanceWindowExecutionStatusFailed:
                return @"FAILED";
            case AWSSSMMaintenanceWindowExecutionStatusTimedOut:
                return @"TIMED_OUT";
            case AWSSSMMaintenanceWindowExecutionStatusCancelling:
                return @"CANCELLING";
            case AWSSSMMaintenanceWindowExecutionStatusCancelled:
                return @"CANCELLED";
            case AWSSSMMaintenanceWindowExecutionStatusSkippedOverlapping:
                return @"SKIPPED_OVERLAPPING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMMaintenanceWindowExecutionTaskIdentity

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
            return @(AWSSSMMaintenanceWindowExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"CANCELLING"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"SKIPPED_OVERLAPPING"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusSkippedOverlapping);
        }
        return @(AWSSSMMaintenanceWindowExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMMaintenanceWindowExecutionStatusPending:
                return @"PENDING";
            case AWSSSMMaintenanceWindowExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSSSMMaintenanceWindowExecutionStatusSuccess:
                return @"SUCCESS";
            case AWSSSMMaintenanceWindowExecutionStatusFailed:
                return @"FAILED";
            case AWSSSMMaintenanceWindowExecutionStatusTimedOut:
                return @"TIMED_OUT";
            case AWSSSMMaintenanceWindowExecutionStatusCancelling:
                return @"CANCELLING";
            case AWSSSMMaintenanceWindowExecutionStatusCancelled:
                return @"CANCELLED";
            case AWSSSMMaintenanceWindowExecutionStatusSkippedOverlapping:
                return @"SKIPPED_OVERLAPPING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taskTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUN_COMMAND"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeRunCommand);
        }
        if ([value caseInsensitiveCompare:@"AUTOMATION"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"STEP_FUNCTIONS"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeStepFunctions);
        }
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeLambda);
        }
        return @(AWSSSMMaintenanceWindowTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMMaintenanceWindowTaskTypeRunCommand:
                return @"RUN_COMMAND";
            case AWSSSMMaintenanceWindowTaskTypeAutomation:
                return @"AUTOMATION";
            case AWSSSMMaintenanceWindowTaskTypeStepFunctions:
                return @"STEP_FUNCTIONS";
            case AWSSSMMaintenanceWindowTaskTypeLambda:
                return @"LAMBDA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMMaintenanceWindowExecutionTaskInvocationIdentity

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
            return @(AWSSSMMaintenanceWindowExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"CANCELLING"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"SKIPPED_OVERLAPPING"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowExecutionStatusSkippedOverlapping);
        }
        return @(AWSSSMMaintenanceWindowExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMMaintenanceWindowExecutionStatusPending:
                return @"PENDING";
            case AWSSSMMaintenanceWindowExecutionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSSSMMaintenanceWindowExecutionStatusSuccess:
                return @"SUCCESS";
            case AWSSSMMaintenanceWindowExecutionStatusFailed:
                return @"FAILED";
            case AWSSSMMaintenanceWindowExecutionStatusTimedOut:
                return @"TIMED_OUT";
            case AWSSSMMaintenanceWindowExecutionStatusCancelling:
                return @"CANCELLING";
            case AWSSSMMaintenanceWindowExecutionStatusCancelled:
                return @"CANCELLED";
            case AWSSSMMaintenanceWindowExecutionStatusSkippedOverlapping:
                return @"SKIPPED_OVERLAPPING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taskTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUN_COMMAND"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeRunCommand);
        }
        if ([value caseInsensitiveCompare:@"AUTOMATION"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"STEP_FUNCTIONS"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeStepFunctions);
        }
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeLambda);
        }
        return @(AWSSSMMaintenanceWindowTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMMaintenanceWindowTaskTypeRunCommand:
                return @"RUN_COMMAND";
            case AWSSSMMaintenanceWindowTaskTypeAutomation:
                return @"AUTOMATION";
            case AWSSSMMaintenanceWindowTaskTypeStepFunctions:
                return @"STEP_FUNCTIONS";
            case AWSSSMMaintenanceWindowTaskTypeLambda:
                return @"LAMBDA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMMaintenanceWindowFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

@end

@implementation AWSSSMMaintenanceWindowIdentity

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

@implementation AWSSSMMaintenanceWindowIdentityForTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"windowId" : @"WindowId",
             };
}

@end

@implementation AWSSSMMaintenanceWindowLambdaParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientContext" : @"ClientContext",
             @"payload" : @"Payload",
             @"qualifier" : @"Qualifier",
             };
}

@end

@implementation AWSSSMMaintenanceWindowRunCommandParameters

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMCloudWatchOutputConfig class]];
}

+ (NSValueTransformer *)documentHashTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Sha256"] == NSOrderedSame) {
            return @(AWSSSMDocumentHashTypeSha256);
        }
        if ([value caseInsensitiveCompare:@"Sha1"] == NSOrderedSame) {
            return @(AWSSSMDocumentHashTypeSha1);
        }
        return @(AWSSSMDocumentHashTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMDocumentHashTypeSha256:
                return @"Sha256";
            case AWSSSMDocumentHashTypeSha1:
                return @"Sha1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)notificationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMNotificationConfig class]];
}

@end

@implementation AWSSSMMaintenanceWindowStepFunctionsParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"input" : @"Input",
             @"name" : @"Name",
             };
}

@end

@implementation AWSSSMMaintenanceWindowTarget

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
            return @(AWSSSMMaintenanceWindowResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_GROUP"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowResourceTypeResourceGroup);
        }
        return @(AWSSSMMaintenanceWindowResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMMaintenanceWindowResourceTypeInstance:
                return @"INSTANCE";
            case AWSSSMMaintenanceWindowResourceTypeResourceGroup:
                return @"RESOURCE_GROUP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTarget class]];
}

@end

@implementation AWSSSMMaintenanceWindowTask

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMLoggingInfo class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTarget class]];
}

+ (NSValueTransformer *)taskParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSSMMaintenanceWindowTaskParameterValueExpression class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUN_COMMAND"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeRunCommand);
        }
        if ([value caseInsensitiveCompare:@"AUTOMATION"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"STEP_FUNCTIONS"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeStepFunctions);
        }
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeLambda);
        }
        return @(AWSSSMMaintenanceWindowTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMMaintenanceWindowTaskTypeRunCommand:
                return @"RUN_COMMAND";
            case AWSSSMMaintenanceWindowTaskTypeAutomation:
                return @"AUTOMATION";
            case AWSSSMMaintenanceWindowTaskTypeStepFunctions:
                return @"STEP_FUNCTIONS";
            case AWSSSMMaintenanceWindowTaskTypeLambda:
                return @"LAMBDA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMMaintenanceWindowTaskInvocationParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automation" : @"Automation",
             @"lambda" : @"Lambda",
             @"runCommand" : @"RunCommand",
             @"stepFunctions" : @"StepFunctions",
             };
}

+ (NSValueTransformer *)automationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMMaintenanceWindowAutomationParameters class]];
}

+ (NSValueTransformer *)lambdaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMMaintenanceWindowLambdaParameters class]];
}

+ (NSValueTransformer *)runCommandJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMMaintenanceWindowRunCommandParameters class]];
}

+ (NSValueTransformer *)stepFunctionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMMaintenanceWindowStepFunctionsParameters class]];
}

@end

@implementation AWSSSMMaintenanceWindowTaskParameterValueExpression

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"values" : @"Values",
             };
}

@end

@implementation AWSSSMModifyDocumentPermissionRequest

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
            return @(AWSSSMDocumentPermissionTypeShare);
        }
        return @(AWSSSMDocumentPermissionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMDocumentPermissionTypeShare:
                return @"Share";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMModifyDocumentPermissionResponse

@end

@implementation AWSSSMNonCompliantSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nonCompliantCount" : @"NonCompliantCount",
             @"severitySummary" : @"SeveritySummary",
             };
}

+ (NSValueTransformer *)severitySummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMSeveritySummary class]];
}

@end

@implementation AWSSSMNotificationConfig

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
            return @(AWSSSMNotificationTypeCommand);
        }
        if ([value caseInsensitiveCompare:@"Invocation"] == NSOrderedSame) {
            return @(AWSSSMNotificationTypeInvocation);
        }
        return @(AWSSSMNotificationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMNotificationTypeCommand:
                return @"Command";
            case AWSSSMNotificationTypeInvocation:
                return @"Invocation";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMOpsAggregator

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMOpsAggregator class]];
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMOpsFilter class]];
}

@end

@implementation AWSSSMOpsEntity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"Data",
             @"identifier" : @"Id",
             };
}

+ (NSValueTransformer *)dataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSSMOpsEntityItem class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSSSMOpsEntityItem

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

@implementation AWSSSMOpsFilter

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
            return @(AWSSSMOpsFilterOperatorTypeEqual);
        }
        if ([value caseInsensitiveCompare:@"NotEqual"] == NSOrderedSame) {
            return @(AWSSSMOpsFilterOperatorTypeNotEqual);
        }
        if ([value caseInsensitiveCompare:@"BeginWith"] == NSOrderedSame) {
            return @(AWSSSMOpsFilterOperatorTypeBeginWith);
        }
        if ([value caseInsensitiveCompare:@"LessThan"] == NSOrderedSame) {
            return @(AWSSSMOpsFilterOperatorTypeLessThan);
        }
        if ([value caseInsensitiveCompare:@"GreaterThan"] == NSOrderedSame) {
            return @(AWSSSMOpsFilterOperatorTypeGreaterThan);
        }
        if ([value caseInsensitiveCompare:@"Exists"] == NSOrderedSame) {
            return @(AWSSSMOpsFilterOperatorTypeExists);
        }
        return @(AWSSSMOpsFilterOperatorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMOpsFilterOperatorTypeEqual:
                return @"Equal";
            case AWSSSMOpsFilterOperatorTypeNotEqual:
                return @"NotEqual";
            case AWSSSMOpsFilterOperatorTypeBeginWith:
                return @"BeginWith";
            case AWSSSMOpsFilterOperatorTypeLessThan:
                return @"LessThan";
            case AWSSSMOpsFilterOperatorTypeGreaterThan:
                return @"GreaterThan";
            case AWSSSMOpsFilterOperatorTypeExists:
                return @"Exists";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMOpsItem

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMOpsItemNotification class]];
}

+ (NSValueTransformer *)operationalDataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSSMOpsItemDataValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)relatedOpsItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMRelatedOpsItem class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Open"] == NSOrderedSame) {
            return @(AWSSSMOpsItemStatusOpen);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSSMOpsItemStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Resolved"] == NSOrderedSame) {
            return @(AWSSSMOpsItemStatusResolved);
        }
        return @(AWSSSMOpsItemStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMOpsItemStatusOpen:
                return @"Open";
            case AWSSSMOpsItemStatusInProgress:
                return @"InProgress";
            case AWSSSMOpsItemStatusResolved:
                return @"Resolved";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMOpsItemDataValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SearchableString"] == NSOrderedSame) {
            return @(AWSSSMOpsItemDataTypeSearchableString);
        }
        if ([value caseInsensitiveCompare:@"String"] == NSOrderedSame) {
            return @(AWSSSMOpsItemDataTypeString);
        }
        return @(AWSSSMOpsItemDataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMOpsItemDataTypeSearchableString:
                return @"SearchableString";
            case AWSSSMOpsItemDataTypeString:
                return @"String";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMOpsItemFilter

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
            return @(AWSSSMOpsItemFilterKeyStatus);
        }
        if ([value caseInsensitiveCompare:@"CreatedBy"] == NSOrderedSame) {
            return @(AWSSSMOpsItemFilterKeyCreatedBy);
        }
        if ([value caseInsensitiveCompare:@"Source"] == NSOrderedSame) {
            return @(AWSSSMOpsItemFilterKeySource);
        }
        if ([value caseInsensitiveCompare:@"Priority"] == NSOrderedSame) {
            return @(AWSSSMOpsItemFilterKeyPriority);
        }
        if ([value caseInsensitiveCompare:@"Title"] == NSOrderedSame) {
            return @(AWSSSMOpsItemFilterKeyTitle);
        }
        if ([value caseInsensitiveCompare:@"OpsItemId"] == NSOrderedSame) {
            return @(AWSSSMOpsItemFilterKeyOpsItemId);
        }
        if ([value caseInsensitiveCompare:@"CreatedTime"] == NSOrderedSame) {
            return @(AWSSSMOpsItemFilterKeyCreatedTime);
        }
        if ([value caseInsensitiveCompare:@"LastModifiedTime"] == NSOrderedSame) {
            return @(AWSSSMOpsItemFilterKeyLastModifiedTime);
        }
        if ([value caseInsensitiveCompare:@"OperationalData"] == NSOrderedSame) {
            return @(AWSSSMOpsItemFilterKeyOperationalData);
        }
        if ([value caseInsensitiveCompare:@"OperationalDataKey"] == NSOrderedSame) {
            return @(AWSSSMOpsItemFilterKeyOperationalDataKey);
        }
        if ([value caseInsensitiveCompare:@"OperationalDataValue"] == NSOrderedSame) {
            return @(AWSSSMOpsItemFilterKeyOperationalDataValue);
        }
        if ([value caseInsensitiveCompare:@"ResourceId"] == NSOrderedSame) {
            return @(AWSSSMOpsItemFilterKeyResourceId);
        }
        if ([value caseInsensitiveCompare:@"AutomationId"] == NSOrderedSame) {
            return @(AWSSSMOpsItemFilterKeyAutomationId);
        }
        if ([value caseInsensitiveCompare:@"Category"] == NSOrderedSame) {
            return @(AWSSSMOpsItemFilterKeyCategory);
        }
        if ([value caseInsensitiveCompare:@"Severity"] == NSOrderedSame) {
            return @(AWSSSMOpsItemFilterKeySeverity);
        }
        return @(AWSSSMOpsItemFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMOpsItemFilterKeyStatus:
                return @"Status";
            case AWSSSMOpsItemFilterKeyCreatedBy:
                return @"CreatedBy";
            case AWSSSMOpsItemFilterKeySource:
                return @"Source";
            case AWSSSMOpsItemFilterKeyPriority:
                return @"Priority";
            case AWSSSMOpsItemFilterKeyTitle:
                return @"Title";
            case AWSSSMOpsItemFilterKeyOpsItemId:
                return @"OpsItemId";
            case AWSSSMOpsItemFilterKeyCreatedTime:
                return @"CreatedTime";
            case AWSSSMOpsItemFilterKeyLastModifiedTime:
                return @"LastModifiedTime";
            case AWSSSMOpsItemFilterKeyOperationalData:
                return @"OperationalData";
            case AWSSSMOpsItemFilterKeyOperationalDataKey:
                return @"OperationalDataKey";
            case AWSSSMOpsItemFilterKeyOperationalDataValue:
                return @"OperationalDataValue";
            case AWSSSMOpsItemFilterKeyResourceId:
                return @"ResourceId";
            case AWSSSMOpsItemFilterKeyAutomationId:
                return @"AutomationId";
            case AWSSSMOpsItemFilterKeyCategory:
                return @"Category";
            case AWSSSMOpsItemFilterKeySeverity:
                return @"Severity";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)operatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Equal"] == NSOrderedSame) {
            return @(AWSSSMOpsItemFilterOperatorEqual);
        }
        if ([value caseInsensitiveCompare:@"Contains"] == NSOrderedSame) {
            return @(AWSSSMOpsItemFilterOperatorContains);
        }
        if ([value caseInsensitiveCompare:@"GreaterThan"] == NSOrderedSame) {
            return @(AWSSSMOpsItemFilterOperatorGreaterThan);
        }
        if ([value caseInsensitiveCompare:@"LessThan"] == NSOrderedSame) {
            return @(AWSSSMOpsItemFilterOperatorLessThan);
        }
        return @(AWSSSMOpsItemFilterOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMOpsItemFilterOperatorEqual:
                return @"Equal";
            case AWSSSMOpsItemFilterOperatorContains:
                return @"Contains";
            case AWSSSMOpsItemFilterOperatorGreaterThan:
                return @"GreaterThan";
            case AWSSSMOpsItemFilterOperatorLessThan:
                return @"LessThan";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMOpsItemNotification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             };
}

@end

@implementation AWSSSMOpsItemSummary

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
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSSMOpsItemDataValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Open"] == NSOrderedSame) {
            return @(AWSSSMOpsItemStatusOpen);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSSMOpsItemStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Resolved"] == NSOrderedSame) {
            return @(AWSSSMOpsItemStatusResolved);
        }
        return @(AWSSSMOpsItemStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMOpsItemStatusOpen:
                return @"Open";
            case AWSSSMOpsItemStatusInProgress:
                return @"InProgress";
            case AWSSSMOpsItemStatusResolved:
                return @"Resolved";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMOpsResultAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"typeName" : @"TypeName",
             };
}

@end

@implementation AWSSSMOutputSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputSourceId" : @"OutputSourceId",
             @"outputSourceType" : @"OutputSourceType",
             };
}

@end

@implementation AWSSSMParameter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
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
            return @(AWSSSMParameterTypeString);
        }
        if ([value caseInsensitiveCompare:@"StringList"] == NSOrderedSame) {
            return @(AWSSSMParameterTypeStringList);
        }
        if ([value caseInsensitiveCompare:@"SecureString"] == NSOrderedSame) {
            return @(AWSSSMParameterTypeSecureString);
        }
        return @(AWSSSMParameterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMParameterTypeString:
                return @"String";
            case AWSSSMParameterTypeStringList:
                return @"StringList";
            case AWSSSMParameterTypeSecureString:
                return @"SecureString";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMParameterHistory

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedPattern" : @"AllowedPattern",
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMParameterInlinePolicy class]];
}

+ (NSValueTransformer *)tierJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSSSMParameterTierStandard);
        }
        if ([value caseInsensitiveCompare:@"Advanced"] == NSOrderedSame) {
            return @(AWSSSMParameterTierAdvanced);
        }
        if ([value caseInsensitiveCompare:@"Intelligent-Tiering"] == NSOrderedSame) {
            return @(AWSSSMParameterTierIntelligentTiering);
        }
        return @(AWSSSMParameterTierUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMParameterTierStandard:
                return @"Standard";
            case AWSSSMParameterTierAdvanced:
                return @"Advanced";
            case AWSSSMParameterTierIntelligentTiering:
                return @"Intelligent-Tiering";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"String"] == NSOrderedSame) {
            return @(AWSSSMParameterTypeString);
        }
        if ([value caseInsensitiveCompare:@"StringList"] == NSOrderedSame) {
            return @(AWSSSMParameterTypeStringList);
        }
        if ([value caseInsensitiveCompare:@"SecureString"] == NSOrderedSame) {
            return @(AWSSSMParameterTypeSecureString);
        }
        return @(AWSSSMParameterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMParameterTypeString:
                return @"String";
            case AWSSSMParameterTypeStringList:
                return @"StringList";
            case AWSSSMParameterTypeSecureString:
                return @"SecureString";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMParameterInlinePolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyStatus" : @"PolicyStatus",
             @"policyText" : @"PolicyText",
             @"policyType" : @"PolicyType",
             };
}

@end

@implementation AWSSSMParameterMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedPattern" : @"AllowedPattern",
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMParameterInlinePolicy class]];
}

+ (NSValueTransformer *)tierJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSSSMParameterTierStandard);
        }
        if ([value caseInsensitiveCompare:@"Advanced"] == NSOrderedSame) {
            return @(AWSSSMParameterTierAdvanced);
        }
        if ([value caseInsensitiveCompare:@"Intelligent-Tiering"] == NSOrderedSame) {
            return @(AWSSSMParameterTierIntelligentTiering);
        }
        return @(AWSSSMParameterTierUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMParameterTierStandard:
                return @"Standard";
            case AWSSSMParameterTierAdvanced:
                return @"Advanced";
            case AWSSSMParameterTierIntelligentTiering:
                return @"Intelligent-Tiering";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"String"] == NSOrderedSame) {
            return @(AWSSSMParameterTypeString);
        }
        if ([value caseInsensitiveCompare:@"StringList"] == NSOrderedSame) {
            return @(AWSSSMParameterTypeStringList);
        }
        if ([value caseInsensitiveCompare:@"SecureString"] == NSOrderedSame) {
            return @(AWSSSMParameterTypeSecureString);
        }
        return @(AWSSSMParameterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMParameterTypeString:
                return @"String";
            case AWSSSMParameterTypeStringList:
                return @"StringList";
            case AWSSSMParameterTypeSecureString:
                return @"SecureString";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMParameterStringFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"option" : @"Option",
             @"values" : @"Values",
             };
}

@end

@implementation AWSSSMParametersFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSSSMParametersFilterKeyName);
        }
        if ([value caseInsensitiveCompare:@"Type"] == NSOrderedSame) {
            return @(AWSSSMParametersFilterKeyType);
        }
        if ([value caseInsensitiveCompare:@"KeyId"] == NSOrderedSame) {
            return @(AWSSSMParametersFilterKeyKeyId);
        }
        return @(AWSSSMParametersFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMParametersFilterKeyName:
                return @"Name";
            case AWSSSMParametersFilterKeyType:
                return @"Type";
            case AWSSSMParametersFilterKeyKeyId:
                return @"KeyId";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMPatch

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

@implementation AWSSSMPatchBaselineIdentity

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
            return @(AWSSSMOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemCentos);
        }
        return @(AWSSSMOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSSMOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSSMOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSSMOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSSMOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSSMOperatingSystemSuse:
                return @"SUSE";
            case AWSSSMOperatingSystemCentos:
                return @"CENTOS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMPatchComplianceData

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
            return @(AWSSSMPatchComplianceDataStateInstalled);
        }
        if ([value caseInsensitiveCompare:@"INSTALLED_OTHER"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceDataStateInstalledOther);
        }
        if ([value caseInsensitiveCompare:@"INSTALLED_PENDING_REBOOT"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceDataStateInstalledPendingReboot);
        }
        if ([value caseInsensitiveCompare:@"INSTALLED_REJECTED"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceDataStateInstalledRejected);
        }
        if ([value caseInsensitiveCompare:@"MISSING"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceDataStateMissing);
        }
        if ([value caseInsensitiveCompare:@"NOT_APPLICABLE"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceDataStateNotApplicable);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceDataStateFailed);
        }
        return @(AWSSSMPatchComplianceDataStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMPatchComplianceDataStateInstalled:
                return @"INSTALLED";
            case AWSSSMPatchComplianceDataStateInstalledOther:
                return @"INSTALLED_OTHER";
            case AWSSSMPatchComplianceDataStateInstalledPendingReboot:
                return @"INSTALLED_PENDING_REBOOT";
            case AWSSSMPatchComplianceDataStateInstalledRejected:
                return @"INSTALLED_REJECTED";
            case AWSSSMPatchComplianceDataStateMissing:
                return @"MISSING";
            case AWSSSMPatchComplianceDataStateNotApplicable:
                return @"NOT_APPLICABLE";
            case AWSSSMPatchComplianceDataStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMPatchFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PATCH_SET"] == NSOrderedSame) {
            return @(AWSSSMPatchFilterKeyPatchSet);
        }
        if ([value caseInsensitiveCompare:@"PRODUCT"] == NSOrderedSame) {
            return @(AWSSSMPatchFilterKeyProduct);
        }
        if ([value caseInsensitiveCompare:@"PRODUCT_FAMILY"] == NSOrderedSame) {
            return @(AWSSSMPatchFilterKeyProductFamily);
        }
        if ([value caseInsensitiveCompare:@"CLASSIFICATION"] == NSOrderedSame) {
            return @(AWSSSMPatchFilterKeyClassification);
        }
        if ([value caseInsensitiveCompare:@"MSRC_SEVERITY"] == NSOrderedSame) {
            return @(AWSSSMPatchFilterKeyMsrcSeverity);
        }
        if ([value caseInsensitiveCompare:@"PATCH_ID"] == NSOrderedSame) {
            return @(AWSSSMPatchFilterKeyPatchId);
        }
        if ([value caseInsensitiveCompare:@"SECTION"] == NSOrderedSame) {
            return @(AWSSSMPatchFilterKeySection);
        }
        if ([value caseInsensitiveCompare:@"PRIORITY"] == NSOrderedSame) {
            return @(AWSSSMPatchFilterKeyPriority);
        }
        if ([value caseInsensitiveCompare:@"SEVERITY"] == NSOrderedSame) {
            return @(AWSSSMPatchFilterKeySeverity);
        }
        return @(AWSSSMPatchFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMPatchFilterKeyPatchSet:
                return @"PATCH_SET";
            case AWSSSMPatchFilterKeyProduct:
                return @"PRODUCT";
            case AWSSSMPatchFilterKeyProductFamily:
                return @"PRODUCT_FAMILY";
            case AWSSSMPatchFilterKeyClassification:
                return @"CLASSIFICATION";
            case AWSSSMPatchFilterKeyMsrcSeverity:
                return @"MSRC_SEVERITY";
            case AWSSSMPatchFilterKeyPatchId:
                return @"PATCH_ID";
            case AWSSSMPatchFilterKeySection:
                return @"SECTION";
            case AWSSSMPatchFilterKeyPriority:
                return @"PRIORITY";
            case AWSSSMPatchFilterKeySeverity:
                return @"SEVERITY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMPatchFilterGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"patchFilters" : @"PatchFilters",
             };
}

+ (NSValueTransformer *)patchFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMPatchFilter class]];
}

@end

@implementation AWSSSMPatchGroupPatchBaselineMapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineIdentity" : @"BaselineIdentity",
             @"patchGroup" : @"PatchGroup",
             };
}

+ (NSValueTransformer *)baselineIdentityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMPatchBaselineIdentity class]];
}

@end

@implementation AWSSSMPatchOrchestratorFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

@end

@implementation AWSSSMPatchRule

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
            return @(AWSSSMPatchComplianceLevelCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelUnspecified);
        }
        return @(AWSSSMPatchComplianceLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMPatchComplianceLevelCritical:
                return @"CRITICAL";
            case AWSSSMPatchComplianceLevelHigh:
                return @"HIGH";
            case AWSSSMPatchComplianceLevelMedium:
                return @"MEDIUM";
            case AWSSSMPatchComplianceLevelLow:
                return @"LOW";
            case AWSSSMPatchComplianceLevelInformational:
                return @"INFORMATIONAL";
            case AWSSSMPatchComplianceLevelUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)patchFilterGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMPatchFilterGroup class]];
}

@end

@implementation AWSSSMPatchRuleGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"patchRules" : @"PatchRules",
             };
}

+ (NSValueTransformer *)patchRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMPatchRule class]];
}

@end

@implementation AWSSSMPatchSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configuration" : @"Configuration",
             @"name" : @"Name",
             @"products" : @"Products",
             };
}

@end

@implementation AWSSSMPatchStatus

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
            return @(AWSSSMPatchComplianceLevelCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelUnspecified);
        }
        return @(AWSSSMPatchComplianceLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMPatchComplianceLevelCritical:
                return @"CRITICAL";
            case AWSSSMPatchComplianceLevelHigh:
                return @"HIGH";
            case AWSSSMPatchComplianceLevelMedium:
                return @"MEDIUM";
            case AWSSSMPatchComplianceLevelLow:
                return @"LOW";
            case AWSSSMPatchComplianceLevelInformational:
                return @"INFORMATIONAL";
            case AWSSSMPatchComplianceLevelUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)deploymentStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"APPROVED"] == NSOrderedSame) {
            return @(AWSSSMPatchDeploymentStatusApproved);
        }
        if ([value caseInsensitiveCompare:@"PENDING_APPROVAL"] == NSOrderedSame) {
            return @(AWSSSMPatchDeploymentStatusPendingApproval);
        }
        if ([value caseInsensitiveCompare:@"EXPLICIT_APPROVED"] == NSOrderedSame) {
            return @(AWSSSMPatchDeploymentStatusExplicitApproved);
        }
        if ([value caseInsensitiveCompare:@"EXPLICIT_REJECTED"] == NSOrderedSame) {
            return @(AWSSSMPatchDeploymentStatusExplicitRejected);
        }
        return @(AWSSSMPatchDeploymentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMPatchDeploymentStatusApproved:
                return @"APPROVED";
            case AWSSSMPatchDeploymentStatusPendingApproval:
                return @"PENDING_APPROVAL";
            case AWSSSMPatchDeploymentStatusExplicitApproved:
                return @"EXPLICIT_APPROVED";
            case AWSSSMPatchDeploymentStatusExplicitRejected:
                return @"EXPLICIT_REJECTED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMProgressCounters

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

@implementation AWSSSMPutComplianceItemsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"complianceType" : @"ComplianceType",
             @"executionSummary" : @"ExecutionSummary",
             @"itemContentHash" : @"ItemContentHash",
             @"items" : @"Items",
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             };
}

+ (NSValueTransformer *)executionSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMComplianceExecutionSummary class]];
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMComplianceItemEntry class]];
}

@end

@implementation AWSSSMPutComplianceItemsResult

@end

@implementation AWSSSMPutInventoryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"items" : @"Items",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMInventoryItem class]];
}

@end

@implementation AWSSSMPutInventoryResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSSSMPutParameterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedPattern" : @"AllowedPattern",
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTag class]];
}

+ (NSValueTransformer *)tierJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSSSMParameterTierStandard);
        }
        if ([value caseInsensitiveCompare:@"Advanced"] == NSOrderedSame) {
            return @(AWSSSMParameterTierAdvanced);
        }
        if ([value caseInsensitiveCompare:@"Intelligent-Tiering"] == NSOrderedSame) {
            return @(AWSSSMParameterTierIntelligentTiering);
        }
        return @(AWSSSMParameterTierUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMParameterTierStandard:
                return @"Standard";
            case AWSSSMParameterTierAdvanced:
                return @"Advanced";
            case AWSSSMParameterTierIntelligentTiering:
                return @"Intelligent-Tiering";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"String"] == NSOrderedSame) {
            return @(AWSSSMParameterTypeString);
        }
        if ([value caseInsensitiveCompare:@"StringList"] == NSOrderedSame) {
            return @(AWSSSMParameterTypeStringList);
        }
        if ([value caseInsensitiveCompare:@"SecureString"] == NSOrderedSame) {
            return @(AWSSSMParameterTypeSecureString);
        }
        return @(AWSSSMParameterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMParameterTypeString:
                return @"String";
            case AWSSSMParameterTypeStringList:
                return @"StringList";
            case AWSSSMParameterTypeSecureString:
                return @"SecureString";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMPutParameterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tier" : @"Tier",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)tierJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSSSMParameterTierStandard);
        }
        if ([value caseInsensitiveCompare:@"Advanced"] == NSOrderedSame) {
            return @(AWSSSMParameterTierAdvanced);
        }
        if ([value caseInsensitiveCompare:@"Intelligent-Tiering"] == NSOrderedSame) {
            return @(AWSSSMParameterTierIntelligentTiering);
        }
        return @(AWSSSMParameterTierUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMParameterTierStandard:
                return @"Standard";
            case AWSSSMParameterTierAdvanced:
                return @"Advanced";
            case AWSSSMParameterTierIntelligentTiering:
                return @"Intelligent-Tiering";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMRegisterDefaultPatchBaselineRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             };
}

@end

@implementation AWSSSMRegisterDefaultPatchBaselineResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             };
}

@end

@implementation AWSSSMRegisterPatchBaselineForPatchGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             @"patchGroup" : @"PatchGroup",
             };
}

@end

@implementation AWSSSMRegisterPatchBaselineForPatchGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineId" : @"BaselineId",
             @"patchGroup" : @"PatchGroup",
             };
}

@end

@implementation AWSSSMRegisterTargetWithMaintenanceWindowRequest

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
            return @(AWSSSMMaintenanceWindowResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_GROUP"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowResourceTypeResourceGroup);
        }
        return @(AWSSSMMaintenanceWindowResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMMaintenanceWindowResourceTypeInstance:
                return @"INSTANCE";
            case AWSSSMMaintenanceWindowResourceTypeResourceGroup:
                return @"RESOURCE_GROUP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTarget class]];
}

@end

@implementation AWSSSMRegisterTargetWithMaintenanceWindowResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowTargetId" : @"WindowTargetId",
             };
}

@end

@implementation AWSSSMRegisterTaskWithMaintenanceWindowRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMLoggingInfo class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTarget class]];
}

+ (NSValueTransformer *)taskInvocationParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMMaintenanceWindowTaskInvocationParameters class]];
}

+ (NSValueTransformer *)taskParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSSMMaintenanceWindowTaskParameterValueExpression class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)taskTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUN_COMMAND"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeRunCommand);
        }
        if ([value caseInsensitiveCompare:@"AUTOMATION"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeAutomation);
        }
        if ([value caseInsensitiveCompare:@"STEP_FUNCTIONS"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeStepFunctions);
        }
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSSSMMaintenanceWindowTaskTypeLambda);
        }
        return @(AWSSSMMaintenanceWindowTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMMaintenanceWindowTaskTypeRunCommand:
                return @"RUN_COMMAND";
            case AWSSSMMaintenanceWindowTaskTypeAutomation:
                return @"AUTOMATION";
            case AWSSSMMaintenanceWindowTaskTypeStepFunctions:
                return @"STEP_FUNCTIONS";
            case AWSSSMMaintenanceWindowTaskTypeLambda:
                return @"LAMBDA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMRegisterTaskWithMaintenanceWindowResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"windowTaskId" : @"WindowTaskId",
             };
}

@end

@implementation AWSSSMRelatedOpsItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"opsItemId" : @"OpsItemId",
             };
}

@end

@implementation AWSSSMRemoveTagsFromResourceRequest

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
            return @(AWSSSMResourceTypeForTaggingDocument);
        }
        if ([value caseInsensitiveCompare:@"ManagedInstance"] == NSOrderedSame) {
            return @(AWSSSMResourceTypeForTaggingManagedInstance);
        }
        if ([value caseInsensitiveCompare:@"MaintenanceWindow"] == NSOrderedSame) {
            return @(AWSSSMResourceTypeForTaggingMaintenanceWindow);
        }
        if ([value caseInsensitiveCompare:@"Parameter"] == NSOrderedSame) {
            return @(AWSSSMResourceTypeForTaggingParameter);
        }
        if ([value caseInsensitiveCompare:@"PatchBaseline"] == NSOrderedSame) {
            return @(AWSSSMResourceTypeForTaggingPatchBaseline);
        }
        if ([value caseInsensitiveCompare:@"OpsItem"] == NSOrderedSame) {
            return @(AWSSSMResourceTypeForTaggingOpsItem);
        }
        return @(AWSSSMResourceTypeForTaggingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMResourceTypeForTaggingDocument:
                return @"Document";
            case AWSSSMResourceTypeForTaggingManagedInstance:
                return @"ManagedInstance";
            case AWSSSMResourceTypeForTaggingMaintenanceWindow:
                return @"MaintenanceWindow";
            case AWSSSMResourceTypeForTaggingParameter:
                return @"Parameter";
            case AWSSSMResourceTypeForTaggingPatchBaseline:
                return @"PatchBaseline";
            case AWSSSMResourceTypeForTaggingOpsItem:
                return @"OpsItem";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMRemoveTagsFromResourceResult

@end

@implementation AWSSSMResetServiceSettingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"settingId" : @"SettingId",
             };
}

@end

@implementation AWSSSMResetServiceSettingResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceSetting" : @"ServiceSetting",
             };
}

+ (NSValueTransformer *)serviceSettingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMServiceSetting class]];
}

@end

@implementation AWSSSMResolvedTargets

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameterValues" : @"ParameterValues",
             @"truncated" : @"Truncated",
             };
}

@end

@implementation AWSSSMResourceComplianceSummaryItem

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMCompliantSummary class]];
}

+ (NSValueTransformer *)executionSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMComplianceExecutionSummary class]];
}

+ (NSValueTransformer *)nonCompliantSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMNonCompliantSummary class]];
}

+ (NSValueTransformer *)overallSeverityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSSMComplianceSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSSMComplianceSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSSMComplianceSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSSMComplianceSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSSMComplianceSeverityInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSSMComplianceSeverityUnspecified);
        }
        return @(AWSSSMComplianceSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMComplianceSeverityCritical:
                return @"CRITICAL";
            case AWSSSMComplianceSeverityHigh:
                return @"HIGH";
            case AWSSSMComplianceSeverityMedium:
                return @"MEDIUM";
            case AWSSSMComplianceSeverityLow:
                return @"LOW";
            case AWSSSMComplianceSeverityInformational:
                return @"INFORMATIONAL";
            case AWSSSMComplianceSeverityUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLIANT"] == NSOrderedSame) {
            return @(AWSSSMComplianceStatusCompliant);
        }
        if ([value caseInsensitiveCompare:@"NON_COMPLIANT"] == NSOrderedSame) {
            return @(AWSSSMComplianceStatusNonCompliant);
        }
        return @(AWSSSMComplianceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMComplianceStatusCompliant:
                return @"COMPLIANT";
            case AWSSSMComplianceStatusNonCompliant:
                return @"NON_COMPLIANT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMResourceDataSyncAwsOrganizationsSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"organizationSourceType" : @"OrganizationSourceType",
             @"organizationalUnits" : @"OrganizationalUnits",
             };
}

+ (NSValueTransformer *)organizationalUnitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMResourceDataSyncOrganizationalUnit class]];
}

@end

@implementation AWSSSMResourceDataSyncDestinationDataSharing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationDataSharingType" : @"DestinationDataSharingType",
             };
}

@end

@implementation AWSSSMResourceDataSyncItem

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
            return @(AWSSSMLastResourceDataSyncStatusSuccessful);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSSMLastResourceDataSyncStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSSMLastResourceDataSyncStatusInProgress);
        }
        return @(AWSSSMLastResourceDataSyncStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMLastResourceDataSyncStatusSuccessful:
                return @"Successful";
            case AWSSSMLastResourceDataSyncStatusFailed:
                return @"Failed";
            case AWSSSMLastResourceDataSyncStatusInProgress:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMResourceDataSyncS3Destination class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMResourceDataSyncSourceWithState class]];
}

@end

@implementation AWSSSMResourceDataSyncOrganizationalUnit

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"organizationalUnitId" : @"OrganizationalUnitId",
             };
}

@end

@implementation AWSSSMResourceDataSyncS3Destination

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMResourceDataSyncDestinationDataSharing class]];
}

+ (NSValueTransformer *)syncFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"JsonSerDe"] == NSOrderedSame) {
            return @(AWSSSMResourceDataSyncS3FormatJsonSerDe);
        }
        return @(AWSSSMResourceDataSyncS3FormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMResourceDataSyncS3FormatJsonSerDe:
                return @"JsonSerDe";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMResourceDataSyncSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsOrganizationsSource" : @"AwsOrganizationsSource",
             @"includeFutureRegions" : @"IncludeFutureRegions",
             @"sourceRegions" : @"SourceRegions",
             @"sourceType" : @"SourceType",
             };
}

+ (NSValueTransformer *)awsOrganizationsSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMResourceDataSyncAwsOrganizationsSource class]];
}

@end

@implementation AWSSSMResourceDataSyncSourceWithState

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMResourceDataSyncAwsOrganizationsSource class]];
}

@end

@implementation AWSSSMResultAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"typeName" : @"TypeName",
             };
}

@end

@implementation AWSSSMResumeSessionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sessionId" : @"SessionId",
             };
}

@end

@implementation AWSSSMResumeSessionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sessionId" : @"SessionId",
             @"streamUrl" : @"StreamUrl",
             @"tokenValue" : @"TokenValue",
             };
}

@end

@implementation AWSSSMS3OutputLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputS3BucketName" : @"OutputS3BucketName",
             @"outputS3KeyPrefix" : @"OutputS3KeyPrefix",
             @"outputS3Region" : @"OutputS3Region",
             };
}

@end

@implementation AWSSSMS3OutputUrl

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputUrl" : @"OutputUrl",
             };
}

@end

@implementation AWSSSMScheduledWindowExecution

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"executionTime" : @"ExecutionTime",
             @"name" : @"Name",
             @"windowId" : @"WindowId",
             };
}

@end

@implementation AWSSSMSendAutomationSignalRequest

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
            return @(AWSSSMSignalTypeApprove);
        }
        if ([value caseInsensitiveCompare:@"Reject"] == NSOrderedSame) {
            return @(AWSSSMSignalTypeReject);
        }
        if ([value caseInsensitiveCompare:@"StartStep"] == NSOrderedSame) {
            return @(AWSSSMSignalTypeStartStep);
        }
        if ([value caseInsensitiveCompare:@"StopStep"] == NSOrderedSame) {
            return @(AWSSSMSignalTypeStopStep);
        }
        if ([value caseInsensitiveCompare:@"Resume"] == NSOrderedSame) {
            return @(AWSSSMSignalTypeResume);
        }
        return @(AWSSSMSignalTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMSignalTypeApprove:
                return @"Approve";
            case AWSSSMSignalTypeReject:
                return @"Reject";
            case AWSSSMSignalTypeStartStep:
                return @"StartStep";
            case AWSSSMSignalTypeStopStep:
                return @"StopStep";
            case AWSSSMSignalTypeResume:
                return @"Resume";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMSendAutomationSignalResult

@end

@implementation AWSSSMSendCommandRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMCloudWatchOutputConfig class]];
}

+ (NSValueTransformer *)documentHashTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Sha256"] == NSOrderedSame) {
            return @(AWSSSMDocumentHashTypeSha256);
        }
        if ([value caseInsensitiveCompare:@"Sha1"] == NSOrderedSame) {
            return @(AWSSSMDocumentHashTypeSha1);
        }
        return @(AWSSSMDocumentHashTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMDocumentHashTypeSha256:
                return @"Sha256";
            case AWSSSMDocumentHashTypeSha1:
                return @"Sha1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)notificationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMNotificationConfig class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTarget class]];
}

@end

@implementation AWSSSMSendCommandResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"command" : @"Command",
             };
}

+ (NSValueTransformer *)commandJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMCommand class]];
}

@end

@implementation AWSSSMServiceSetting

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

@implementation AWSSSMSession

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMSessionManagerOutputUrl class]];
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
            return @(AWSSSMSessionStatusConnected);
        }
        if ([value caseInsensitiveCompare:@"Connecting"] == NSOrderedSame) {
            return @(AWSSSMSessionStatusConnecting);
        }
        if ([value caseInsensitiveCompare:@"Disconnected"] == NSOrderedSame) {
            return @(AWSSSMSessionStatusDisconnected);
        }
        if ([value caseInsensitiveCompare:@"Terminated"] == NSOrderedSame) {
            return @(AWSSSMSessionStatusTerminated);
        }
        if ([value caseInsensitiveCompare:@"Terminating"] == NSOrderedSame) {
            return @(AWSSSMSessionStatusTerminating);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSSMSessionStatusFailed);
        }
        return @(AWSSSMSessionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMSessionStatusConnected:
                return @"Connected";
            case AWSSSMSessionStatusConnecting:
                return @"Connecting";
            case AWSSSMSessionStatusDisconnected:
                return @"Disconnected";
            case AWSSSMSessionStatusTerminated:
                return @"Terminated";
            case AWSSSMSessionStatusTerminating:
                return @"Terminating";
            case AWSSSMSessionStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMSessionFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InvokedAfter"] == NSOrderedSame) {
            return @(AWSSSMSessionFilterKeyInvokedAfter);
        }
        if ([value caseInsensitiveCompare:@"InvokedBefore"] == NSOrderedSame) {
            return @(AWSSSMSessionFilterKeyInvokedBefore);
        }
        if ([value caseInsensitiveCompare:@"Target"] == NSOrderedSame) {
            return @(AWSSSMSessionFilterKeyTarget);
        }
        if ([value caseInsensitiveCompare:@"Owner"] == NSOrderedSame) {
            return @(AWSSSMSessionFilterKeyOwner);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSSMSessionFilterKeyStatus);
        }
        return @(AWSSSMSessionFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMSessionFilterKeyInvokedAfter:
                return @"InvokedAfter";
            case AWSSSMSessionFilterKeyInvokedBefore:
                return @"InvokedBefore";
            case AWSSSMSessionFilterKeyTarget:
                return @"Target";
            case AWSSSMSessionFilterKeyOwner:
                return @"Owner";
            case AWSSSMSessionFilterKeyStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMSessionManagerOutputUrl

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchOutputUrl" : @"CloudWatchOutputUrl",
             @"s3OutputUrl" : @"S3OutputUrl",
             };
}

@end

@implementation AWSSSMSeveritySummary

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

@implementation AWSSSMStartAssociationsOnceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationIds" : @"AssociationIds",
             };
}

@end

@implementation AWSSSMStartAssociationsOnceResult

@end

@implementation AWSSSMStartAutomationExecutionRequest

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
            return @(AWSSSMExecutionModeAuto);
        }
        if ([value caseInsensitiveCompare:@"Interactive"] == NSOrderedSame) {
            return @(AWSSSMExecutionModeInteractive);
        }
        return @(AWSSSMExecutionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMExecutionModeAuto:
                return @"Auto";
            case AWSSSMExecutionModeInteractive:
                return @"Interactive";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTag class]];
}

+ (NSValueTransformer *)targetLocationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTargetLocation class]];
}

+ (NSValueTransformer *)targetMapsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[NSMutableArray<NSString *> class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTarget class]];
}

@end

@implementation AWSSSMStartAutomationExecutionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automationExecutionId" : @"AutomationExecutionId",
             };
}

@end

@implementation AWSSSMStartSessionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentName" : @"DocumentName",
             @"parameters" : @"Parameters",
             @"target" : @"Target",
             };
}

@end

@implementation AWSSSMStartSessionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sessionId" : @"SessionId",
             @"streamUrl" : @"StreamUrl",
             @"tokenValue" : @"TokenValue",
             };
}

@end

@implementation AWSSSMStepExecution

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMFailureDetails class]];
}

+ (NSValueTransformer *)stepStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Waiting"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionStatusWaiting);
        }
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"TimedOut"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionStatusTimedOut);
        }
        if ([value caseInsensitiveCompare:@"Cancelling"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSSMAutomationExecutionStatusFailed);
        }
        return @(AWSSSMAutomationExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMAutomationExecutionStatusPending:
                return @"Pending";
            case AWSSSMAutomationExecutionStatusInProgress:
                return @"InProgress";
            case AWSSSMAutomationExecutionStatusWaiting:
                return @"Waiting";
            case AWSSSMAutomationExecutionStatusSuccess:
                return @"Success";
            case AWSSSMAutomationExecutionStatusTimedOut:
                return @"TimedOut";
            case AWSSSMAutomationExecutionStatusCancelling:
                return @"Cancelling";
            case AWSSSMAutomationExecutionStatusCancelled:
                return @"Cancelled";
            case AWSSSMAutomationExecutionStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMTargetLocation class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTarget class]];
}

@end

@implementation AWSSSMStepExecutionFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"StartTimeBefore"] == NSOrderedSame) {
            return @(AWSSSMStepExecutionFilterKeyStartTimeBefore);
        }
        if ([value caseInsensitiveCompare:@"StartTimeAfter"] == NSOrderedSame) {
            return @(AWSSSMStepExecutionFilterKeyStartTimeAfter);
        }
        if ([value caseInsensitiveCompare:@"StepExecutionStatus"] == NSOrderedSame) {
            return @(AWSSSMStepExecutionFilterKeyStepExecutionStatus);
        }
        if ([value caseInsensitiveCompare:@"StepExecutionId"] == NSOrderedSame) {
            return @(AWSSSMStepExecutionFilterKeyStepExecutionId);
        }
        if ([value caseInsensitiveCompare:@"StepName"] == NSOrderedSame) {
            return @(AWSSSMStepExecutionFilterKeyStepName);
        }
        if ([value caseInsensitiveCompare:@"Action"] == NSOrderedSame) {
            return @(AWSSSMStepExecutionFilterKeyAction);
        }
        return @(AWSSSMStepExecutionFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMStepExecutionFilterKeyStartTimeBefore:
                return @"StartTimeBefore";
            case AWSSSMStepExecutionFilterKeyStartTimeAfter:
                return @"StartTimeAfter";
            case AWSSSMStepExecutionFilterKeyStepExecutionStatus:
                return @"StepExecutionStatus";
            case AWSSSMStepExecutionFilterKeyStepExecutionId:
                return @"StepExecutionId";
            case AWSSSMStepExecutionFilterKeyStepName:
                return @"StepName";
            case AWSSSMStepExecutionFilterKeyAction:
                return @"Action";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMStopAutomationExecutionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automationExecutionId" : @"AutomationExecutionId",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSSSMStopTypeComplete);
        }
        if ([value caseInsensitiveCompare:@"Cancel"] == NSOrderedSame) {
            return @(AWSSSMStopTypeCancel);
        }
        return @(AWSSSMStopTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMStopTypeComplete:
                return @"Complete";
            case AWSSSMStopTypeCancel:
                return @"Cancel";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMStopAutomationExecutionResult

@end

@implementation AWSSSMTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSSSMTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

@end

@implementation AWSSSMTargetLocation

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

@implementation AWSSSMTerminateSessionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sessionId" : @"SessionId",
             };
}

@end

@implementation AWSSSMTerminateSessionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sessionId" : @"SessionId",
             };
}

@end

@implementation AWSSSMUpdateAssociationRequest

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
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)complianceSeverityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSSMAssociationComplianceSeverityUnspecified);
        }
        return @(AWSSSMAssociationComplianceSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMAssociationComplianceSeverityCritical:
                return @"CRITICAL";
            case AWSSSMAssociationComplianceSeverityHigh:
                return @"HIGH";
            case AWSSSMAssociationComplianceSeverityMedium:
                return @"MEDIUM";
            case AWSSSMAssociationComplianceSeverityLow:
                return @"LOW";
            case AWSSSMAssociationComplianceSeverityUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMInstanceAssociationOutputLocation class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTarget class]];
}

@end

@implementation AWSSSMUpdateAssociationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationDescription" : @"AssociationDescription",
             };
}

+ (NSValueTransformer *)associationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMAssociationDescription class]];
}

@end

@implementation AWSSSMUpdateAssociationStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationStatus" : @"AssociationStatus",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)associationStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMAssociationStatus class]];
}

@end

@implementation AWSSSMUpdateAssociationStatusResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationDescription" : @"AssociationDescription",
             };
}

+ (NSValueTransformer *)associationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMAssociationDescription class]];
}

@end

@implementation AWSSSMUpdateDocumentDefaultVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentVersion" : @"DocumentVersion",
             @"name" : @"Name",
             };
}

@end

@implementation AWSSSMUpdateDocumentDefaultVersionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             };
}

+ (NSValueTransformer *)detailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMDocumentDefaultVersionDescription class]];
}

@end

@implementation AWSSSMUpdateDocumentRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMAttachmentsSource class]];
}

+ (NSValueTransformer *)documentFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"YAML"] == NSOrderedSame) {
            return @(AWSSSMDocumentFormatYaml);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSSSMDocumentFormatJson);
        }
        if ([value caseInsensitiveCompare:@"TEXT"] == NSOrderedSame) {
            return @(AWSSSMDocumentFormatText);
        }
        return @(AWSSSMDocumentFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMDocumentFormatYaml:
                return @"YAML";
            case AWSSSMDocumentFormatJson:
                return @"JSON";
            case AWSSSMDocumentFormatText:
                return @"TEXT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMUpdateDocumentResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentDescription" : @"DocumentDescription",
             };
}

+ (NSValueTransformer *)documentDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMDocumentDescription class]];
}

@end

@implementation AWSSSMUpdateMaintenanceWindowRequest

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

@implementation AWSSSMUpdateMaintenanceWindowResult

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

@implementation AWSSSMUpdateMaintenanceWindowTargetRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTarget class]];
}

@end

@implementation AWSSSMUpdateMaintenanceWindowTargetResult

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTarget class]];
}

@end

@implementation AWSSSMUpdateMaintenanceWindowTaskRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMLoggingInfo class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTarget class]];
}

+ (NSValueTransformer *)taskInvocationParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMMaintenanceWindowTaskInvocationParameters class]];
}

+ (NSValueTransformer *)taskParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSSMMaintenanceWindowTaskParameterValueExpression class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSSSMUpdateMaintenanceWindowTaskResult

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMLoggingInfo class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMTarget class]];
}

+ (NSValueTransformer *)taskInvocationParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMMaintenanceWindowTaskInvocationParameters class]];
}

+ (NSValueTransformer *)taskParametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSSMMaintenanceWindowTaskParameterValueExpression class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSSSMUpdateManagedInstanceRoleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"iamRole" : @"IamRole",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSSSMUpdateManagedInstanceRoleResult

@end

@implementation AWSSSMUpdateOpsItemRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMOpsItemNotification class]];
}

+ (NSValueTransformer *)operationalDataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSSMOpsItemDataValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)relatedOpsItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMRelatedOpsItem class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Open"] == NSOrderedSame) {
            return @(AWSSSMOpsItemStatusOpen);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSSMOpsItemStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Resolved"] == NSOrderedSame) {
            return @(AWSSSMOpsItemStatusResolved);
        }
        return @(AWSSSMOpsItemStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMOpsItemStatusOpen:
                return @"Open";
            case AWSSSMOpsItemStatusInProgress:
                return @"InProgress";
            case AWSSSMOpsItemStatusResolved:
                return @"Resolved";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSSMUpdateOpsItemResponse

@end

@implementation AWSSSMUpdatePatchBaselineRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMPatchRuleGroup class]];
}

+ (NSValueTransformer *)approvedPatchesComplianceLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelUnspecified);
        }
        return @(AWSSSMPatchComplianceLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMPatchComplianceLevelCritical:
                return @"CRITICAL";
            case AWSSSMPatchComplianceLevelHigh:
                return @"HIGH";
            case AWSSSMPatchComplianceLevelMedium:
                return @"MEDIUM";
            case AWSSSMPatchComplianceLevelLow:
                return @"LOW";
            case AWSSSMPatchComplianceLevelInformational:
                return @"INFORMATIONAL";
            case AWSSSMPatchComplianceLevelUnspecified:
                return @"UNSPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)globalFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMPatchFilterGroup class]];
}

+ (NSValueTransformer *)rejectedPatchesActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALLOW_AS_DEPENDENCY"] == NSOrderedSame) {
            return @(AWSSSMPatchActionAllowAsDependency);
        }
        if ([value caseInsensitiveCompare:@"BLOCK"] == NSOrderedSame) {
            return @(AWSSSMPatchActionBlock);
        }
        return @(AWSSSMPatchActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMPatchActionAllowAsDependency:
                return @"ALLOW_AS_DEPENDENCY";
            case AWSSSMPatchActionBlock:
                return @"BLOCK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMPatchSource class]];
}

@end

@implementation AWSSSMUpdatePatchBaselineResult

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMPatchRuleGroup class]];
}

+ (NSValueTransformer *)approvedPatchesComplianceLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelCritical);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelMedium);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelLow);
        }
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelInformational);
        }
        if ([value caseInsensitiveCompare:@"UNSPECIFIED"] == NSOrderedSame) {
            return @(AWSSSMPatchComplianceLevelUnspecified);
        }
        return @(AWSSSMPatchComplianceLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMPatchComplianceLevelCritical:
                return @"CRITICAL";
            case AWSSSMPatchComplianceLevelHigh:
                return @"HIGH";
            case AWSSSMPatchComplianceLevelMedium:
                return @"MEDIUM";
            case AWSSSMPatchComplianceLevelLow:
                return @"LOW";
            case AWSSSMPatchComplianceLevelInformational:
                return @"INFORMATIONAL";
            case AWSSSMPatchComplianceLevelUnspecified:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMPatchFilterGroup class]];
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
            return @(AWSSSMOperatingSystemWindows);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX_2"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemAmazonLinux2);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemUbuntu);
        }
        if ([value caseInsensitiveCompare:@"REDHAT_ENTERPRISE_LINUX"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemRedhatEnterpriseLinux);
        }
        if ([value caseInsensitiveCompare:@"SUSE"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemSuse);
        }
        if ([value caseInsensitiveCompare:@"CENTOS"] == NSOrderedSame) {
            return @(AWSSSMOperatingSystemCentos);
        }
        return @(AWSSSMOperatingSystemUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMOperatingSystemWindows:
                return @"WINDOWS";
            case AWSSSMOperatingSystemAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSSSMOperatingSystemAmazonLinux2:
                return @"AMAZON_LINUX_2";
            case AWSSSMOperatingSystemUbuntu:
                return @"UBUNTU";
            case AWSSSMOperatingSystemRedhatEnterpriseLinux:
                return @"REDHAT_ENTERPRISE_LINUX";
            case AWSSSMOperatingSystemSuse:
                return @"SUSE";
            case AWSSSMOperatingSystemCentos:
                return @"CENTOS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rejectedPatchesActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALLOW_AS_DEPENDENCY"] == NSOrderedSame) {
            return @(AWSSSMPatchActionAllowAsDependency);
        }
        if ([value caseInsensitiveCompare:@"BLOCK"] == NSOrderedSame) {
            return @(AWSSSMPatchActionBlock);
        }
        return @(AWSSSMPatchActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSSMPatchActionAllowAsDependency:
                return @"ALLOW_AS_DEPENDENCY";
            case AWSSSMPatchActionBlock:
                return @"BLOCK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSSMPatchSource class]];
}

@end

@implementation AWSSSMUpdateResourceDataSyncRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"syncName" : @"SyncName",
             @"syncSource" : @"SyncSource",
             @"syncType" : @"SyncType",
             };
}

+ (NSValueTransformer *)syncSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSSMResourceDataSyncSource class]];
}

@end

@implementation AWSSSMUpdateResourceDataSyncResult

@end

@implementation AWSSSMUpdateServiceSettingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"settingId" : @"SettingId",
             @"settingValue" : @"SettingValue",
             };
}

@end

@implementation AWSSSMUpdateServiceSettingResult

@end
