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

#import "AWSCloudformationModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSCloudformationErrorDomain = @"com.amazonaws.AWSCloudformationErrorDomain";

@implementation AWSCloudformationAccountGateResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             @"statusReason" : @"StatusReason",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSCloudformationAccountGateStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationAccountGateStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"SKIPPED"] == NSOrderedSame) {
            return @(AWSCloudformationAccountGateStatusSkipped);
        }
        return @(AWSCloudformationAccountGateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationAccountGateStatusSucceeded:
                return @"SUCCEEDED";
            case AWSCloudformationAccountGateStatusFailed:
                return @"FAILED";
            case AWSCloudformationAccountGateStatusSkipped:
                return @"SKIPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationAccountLimit

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSCloudformationAutoDeployment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"retainStacksOnAccountRemoval" : @"RetainStacksOnAccountRemoval",
             };
}

@end

@implementation AWSCloudformationCancelUpdateStackInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"stackName" : @"StackName",
             };
}

@end

@implementation AWSCloudformationChange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceChange" : @"ResourceChange",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)resourceChangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationResourceChange class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Resource"] == NSOrderedSame) {
            return @(AWSCloudformationChangeTypeResource);
        }
        return @(AWSCloudformationChangeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationChangeTypeResource:
                return @"Resource";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationChangeSetSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeSetId" : @"ChangeSetId",
             @"changeSetName" : @"ChangeSetName",
             @"creationTime" : @"CreationTime",
             @"detail" : @"Description",
             @"executionStatus" : @"ExecutionStatus",
             @"stackId" : @"StackId",
             @"stackName" : @"StackName",
             @"status" : @"Status",
             @"statusReason" : @"StatusReason",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)executionStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UNAVAILABLE"] == NSOrderedSame) {
            return @(AWSCloudformationExecutionStatusUnavailable);
        }
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSCloudformationExecutionStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"EXECUTE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationExecutionStatusExecuteInProgress);
        }
        if ([value caseInsensitiveCompare:@"EXECUTE_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationExecutionStatusExecuteComplete);
        }
        if ([value caseInsensitiveCompare:@"EXECUTE_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationExecutionStatusExecuteFailed);
        }
        if ([value caseInsensitiveCompare:@"OBSOLETE"] == NSOrderedSame) {
            return @(AWSCloudformationExecutionStatusObsolete);
        }
        return @(AWSCloudformationExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationExecutionStatusUnavailable:
                return @"UNAVAILABLE";
            case AWSCloudformationExecutionStatusAvailable:
                return @"AVAILABLE";
            case AWSCloudformationExecutionStatusExecuteInProgress:
                return @"EXECUTE_IN_PROGRESS";
            case AWSCloudformationExecutionStatusExecuteComplete:
                return @"EXECUTE_COMPLETE";
            case AWSCloudformationExecutionStatusExecuteFailed:
                return @"EXECUTE_FAILED";
            case AWSCloudformationExecutionStatusObsolete:
                return @"OBSOLETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE_PENDING"] == NSOrderedSame) {
            return @(AWSCloudformationChangeSetStatusCreatePending);
        }
        if ([value caseInsensitiveCompare:@"CREATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationChangeSetStatusCreateInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATE_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationChangeSetStatusCreateComplete);
        }
        if ([value caseInsensitiveCompare:@"DELETE_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationChangeSetStatusDeleteComplete);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationChangeSetStatusFailed);
        }
        return @(AWSCloudformationChangeSetStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationChangeSetStatusCreatePending:
                return @"CREATE_PENDING";
            case AWSCloudformationChangeSetStatusCreateInProgress:
                return @"CREATE_IN_PROGRESS";
            case AWSCloudformationChangeSetStatusCreateComplete:
                return @"CREATE_COMPLETE";
            case AWSCloudformationChangeSetStatusDeleteComplete:
                return @"DELETE_COMPLETE";
            case AWSCloudformationChangeSetStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationContinueUpdateRollbackInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"resourcesToSkip" : @"ResourcesToSkip",
             @"roleARN" : @"RoleARN",
             @"stackName" : @"StackName",
             };
}

@end

@implementation AWSCloudformationContinueUpdateRollbackOutput

@end

@implementation AWSCloudformationCreateChangeSetInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capabilities" : @"Capabilities",
             @"changeSetName" : @"ChangeSetName",
             @"changeSetType" : @"ChangeSetType",
             @"clientToken" : @"ClientToken",
             @"detail" : @"Description",
             @"notificationARNs" : @"NotificationARNs",
             @"parameters" : @"Parameters",
             @"resourceTypes" : @"ResourceTypes",
             @"resourcesToImport" : @"ResourcesToImport",
             @"roleARN" : @"RoleARN",
             @"rollbackConfiguration" : @"RollbackConfiguration",
             @"stackName" : @"StackName",
             @"tags" : @"Tags",
             @"templateBody" : @"TemplateBody",
             @"templateURL" : @"TemplateURL",
             @"usePreviousTemplate" : @"UsePreviousTemplate",
             };
}

+ (NSValueTransformer *)changeSetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE"] == NSOrderedSame) {
            return @(AWSCloudformationChangeSetTypeCreate);
        }
        if ([value caseInsensitiveCompare:@"UPDATE"] == NSOrderedSame) {
            return @(AWSCloudformationChangeSetTypeUpdate);
        }
        if ([value caseInsensitiveCompare:@"IMPORT"] == NSOrderedSame) {
            return @(AWSCloudformationChangeSetTypeImport);
        }
        return @(AWSCloudformationChangeSetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationChangeSetTypeCreate:
                return @"CREATE";
            case AWSCloudformationChangeSetTypeUpdate:
                return @"UPDATE";
            case AWSCloudformationChangeSetTypeImport:
                return @"IMPORT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationParameter class]];
}

+ (NSValueTransformer *)resourcesToImportJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationResourceToImport class]];
}

+ (NSValueTransformer *)rollbackConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationRollbackConfiguration class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationTag class]];
}

@end

@implementation AWSCloudformationCreateChangeSetOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"stackId" : @"StackId",
             };
}

@end

@implementation AWSCloudformationCreateStackInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capabilities" : @"Capabilities",
             @"clientRequestToken" : @"ClientRequestToken",
             @"disableRollback" : @"DisableRollback",
             @"enableTerminationProtection" : @"EnableTerminationProtection",
             @"notificationARNs" : @"NotificationARNs",
             @"onFailure" : @"OnFailure",
             @"parameters" : @"Parameters",
             @"resourceTypes" : @"ResourceTypes",
             @"roleARN" : @"RoleARN",
             @"rollbackConfiguration" : @"RollbackConfiguration",
             @"stackName" : @"StackName",
             @"stackPolicyBody" : @"StackPolicyBody",
             @"stackPolicyURL" : @"StackPolicyURL",
             @"tags" : @"Tags",
             @"templateBody" : @"TemplateBody",
             @"templateURL" : @"TemplateURL",
             @"timeoutInMinutes" : @"TimeoutInMinutes",
             };
}

+ (NSValueTransformer *)onFailureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DO_NOTHING"] == NSOrderedSame) {
            return @(AWSCloudformationOnFailureDoNothing);
        }
        if ([value caseInsensitiveCompare:@"ROLLBACK"] == NSOrderedSame) {
            return @(AWSCloudformationOnFailureRollback);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSCloudformationOnFailureDelete);
        }
        return @(AWSCloudformationOnFailureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationOnFailureDoNothing:
                return @"DO_NOTHING";
            case AWSCloudformationOnFailureRollback:
                return @"ROLLBACK";
            case AWSCloudformationOnFailureDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationParameter class]];
}

+ (NSValueTransformer *)rollbackConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationRollbackConfiguration class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationTag class]];
}

@end

@implementation AWSCloudformationCreateStackInstancesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accounts" : @"Accounts",
             @"deploymentTargets" : @"DeploymentTargets",
             @"operationId" : @"OperationId",
             @"operationPreferences" : @"OperationPreferences",
             @"parameterOverrides" : @"ParameterOverrides",
             @"regions" : @"Regions",
             @"stackSetName" : @"StackSetName",
             };
}

+ (NSValueTransformer *)deploymentTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationDeploymentTargets class]];
}

+ (NSValueTransformer *)operationPreferencesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationStackSetOperationPreferences class]];
}

+ (NSValueTransformer *)parameterOverridesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationParameter class]];
}

@end

@implementation AWSCloudformationCreateStackInstancesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSCloudformationCreateStackOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stackId" : @"StackId",
             };
}

@end

@implementation AWSCloudformationCreateStackSetInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"administrationRoleARN" : @"AdministrationRoleARN",
             @"autoDeployment" : @"AutoDeployment",
             @"capabilities" : @"Capabilities",
             @"clientRequestToken" : @"ClientRequestToken",
             @"detail" : @"Description",
             @"executionRoleName" : @"ExecutionRoleName",
             @"parameters" : @"Parameters",
             @"permissionModel" : @"PermissionModel",
             @"stackSetName" : @"StackSetName",
             @"tags" : @"Tags",
             @"templateBody" : @"TemplateBody",
             @"templateURL" : @"TemplateURL",
             };
}

+ (NSValueTransformer *)autoDeploymentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationAutoDeployment class]];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationParameter class]];
}

+ (NSValueTransformer *)permissionModelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVICE_MANAGED"] == NSOrderedSame) {
            return @(AWSCloudformationPermissionModelsServiceManaged);
        }
        if ([value caseInsensitiveCompare:@"SELF_MANAGED"] == NSOrderedSame) {
            return @(AWSCloudformationPermissionModelsSelfManaged);
        }
        return @(AWSCloudformationPermissionModelsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationPermissionModelsServiceManaged:
                return @"SERVICE_MANAGED";
            case AWSCloudformationPermissionModelsSelfManaged:
                return @"SELF_MANAGED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationTag class]];
}

@end

@implementation AWSCloudformationCreateStackSetOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stackSetId" : @"StackSetId",
             };
}

@end

@implementation AWSCloudformationDeleteChangeSetInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeSetName" : @"ChangeSetName",
             @"stackName" : @"StackName",
             };
}

@end

@implementation AWSCloudformationDeleteChangeSetOutput

@end

@implementation AWSCloudformationDeleteStackInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"retainResources" : @"RetainResources",
             @"roleARN" : @"RoleARN",
             @"stackName" : @"StackName",
             };
}

@end

@implementation AWSCloudformationDeleteStackInstancesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accounts" : @"Accounts",
             @"deploymentTargets" : @"DeploymentTargets",
             @"operationId" : @"OperationId",
             @"operationPreferences" : @"OperationPreferences",
             @"regions" : @"Regions",
             @"retainStacks" : @"RetainStacks",
             @"stackSetName" : @"StackSetName",
             };
}

+ (NSValueTransformer *)deploymentTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationDeploymentTargets class]];
}

+ (NSValueTransformer *)operationPreferencesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationStackSetOperationPreferences class]];
}

@end

@implementation AWSCloudformationDeleteStackInstancesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSCloudformationDeleteStackSetInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stackSetName" : @"StackSetName",
             };
}

@end

@implementation AWSCloudformationDeleteStackSetOutput

@end

@implementation AWSCloudformationDeploymentTargets

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accounts" : @"Accounts",
             @"organizationalUnitIds" : @"OrganizationalUnitIds",
             };
}

@end

@implementation AWSCloudformationDeregisterTypeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"types" : @"Type",
             @"typeName" : @"TypeName",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RESOURCE"] == NSOrderedSame) {
            return @(AWSCloudformationRegistryTypeResource);
        }
        return @(AWSCloudformationRegistryTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationRegistryTypeResource:
                return @"RESOURCE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationDeregisterTypeOutput

@end

@implementation AWSCloudformationDescribeAccountLimitsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSCloudformationDescribeAccountLimitsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountLimits" : @"AccountLimits",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)accountLimitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationAccountLimit class]];
}

@end

@implementation AWSCloudformationDescribeChangeSetInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeSetName" : @"ChangeSetName",
             @"nextToken" : @"NextToken",
             @"stackName" : @"StackName",
             };
}

@end

@implementation AWSCloudformationDescribeChangeSetOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capabilities" : @"Capabilities",
             @"changeSetId" : @"ChangeSetId",
             @"changeSetName" : @"ChangeSetName",
             @"changes" : @"Changes",
             @"creationTime" : @"CreationTime",
             @"detail" : @"Description",
             @"executionStatus" : @"ExecutionStatus",
             @"nextToken" : @"NextToken",
             @"notificationARNs" : @"NotificationARNs",
             @"parameters" : @"Parameters",
             @"rollbackConfiguration" : @"RollbackConfiguration",
             @"stackId" : @"StackId",
             @"stackName" : @"StackName",
             @"status" : @"Status",
             @"statusReason" : @"StatusReason",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)changesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationChange class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)executionStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UNAVAILABLE"] == NSOrderedSame) {
            return @(AWSCloudformationExecutionStatusUnavailable);
        }
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSCloudformationExecutionStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"EXECUTE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationExecutionStatusExecuteInProgress);
        }
        if ([value caseInsensitiveCompare:@"EXECUTE_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationExecutionStatusExecuteComplete);
        }
        if ([value caseInsensitiveCompare:@"EXECUTE_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationExecutionStatusExecuteFailed);
        }
        if ([value caseInsensitiveCompare:@"OBSOLETE"] == NSOrderedSame) {
            return @(AWSCloudformationExecutionStatusObsolete);
        }
        return @(AWSCloudformationExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationExecutionStatusUnavailable:
                return @"UNAVAILABLE";
            case AWSCloudformationExecutionStatusAvailable:
                return @"AVAILABLE";
            case AWSCloudformationExecutionStatusExecuteInProgress:
                return @"EXECUTE_IN_PROGRESS";
            case AWSCloudformationExecutionStatusExecuteComplete:
                return @"EXECUTE_COMPLETE";
            case AWSCloudformationExecutionStatusExecuteFailed:
                return @"EXECUTE_FAILED";
            case AWSCloudformationExecutionStatusObsolete:
                return @"OBSOLETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationParameter class]];
}

+ (NSValueTransformer *)rollbackConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationRollbackConfiguration class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE_PENDING"] == NSOrderedSame) {
            return @(AWSCloudformationChangeSetStatusCreatePending);
        }
        if ([value caseInsensitiveCompare:@"CREATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationChangeSetStatusCreateInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATE_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationChangeSetStatusCreateComplete);
        }
        if ([value caseInsensitiveCompare:@"DELETE_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationChangeSetStatusDeleteComplete);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationChangeSetStatusFailed);
        }
        return @(AWSCloudformationChangeSetStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationChangeSetStatusCreatePending:
                return @"CREATE_PENDING";
            case AWSCloudformationChangeSetStatusCreateInProgress:
                return @"CREATE_IN_PROGRESS";
            case AWSCloudformationChangeSetStatusCreateComplete:
                return @"CREATE_COMPLETE";
            case AWSCloudformationChangeSetStatusDeleteComplete:
                return @"DELETE_COMPLETE";
            case AWSCloudformationChangeSetStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationTag class]];
}

@end

@implementation AWSCloudformationDescribeStackDriftDetectionStatusInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stackDriftDetectionId" : @"StackDriftDetectionId",
             };
}

@end

@implementation AWSCloudformationDescribeStackDriftDetectionStatusOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectionStatus" : @"DetectionStatus",
             @"detectionStatusReason" : @"DetectionStatusReason",
             @"driftedStackResourceCount" : @"DriftedStackResourceCount",
             @"stackDriftDetectionId" : @"StackDriftDetectionId",
             @"stackDriftStatus" : @"StackDriftStatus",
             @"stackId" : @"StackId",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)detectionStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DETECTION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftDetectionStatusDetectionInProgress);
        }
        if ([value caseInsensitiveCompare:@"DETECTION_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftDetectionStatusDetectionFailed);
        }
        if ([value caseInsensitiveCompare:@"DETECTION_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftDetectionStatusDetectionComplete);
        }
        return @(AWSCloudformationStackDriftDetectionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationStackDriftDetectionStatusDetectionInProgress:
                return @"DETECTION_IN_PROGRESS";
            case AWSCloudformationStackDriftDetectionStatusDetectionFailed:
                return @"DETECTION_FAILED";
            case AWSCloudformationStackDriftDetectionStatusDetectionComplete:
                return @"DETECTION_COMPLETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stackDriftStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DRIFTED"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftStatusDrifted);
        }
        if ([value caseInsensitiveCompare:@"IN_SYNC"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftStatusInSync);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftStatusUnknown);
        }
        if ([value caseInsensitiveCompare:@"NOT_CHECKED"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftStatusNotChecked);
        }
        return @(AWSCloudformationStackDriftStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationStackDriftStatusDrifted:
                return @"DRIFTED";
            case AWSCloudformationStackDriftStatusInSync:
                return @"IN_SYNC";
            case AWSCloudformationStackDriftStatusUnknown:
                return @"UNKNOWN";
            case AWSCloudformationStackDriftStatusNotChecked:
                return @"NOT_CHECKED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSCloudformationDescribeStackEventsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"stackName" : @"StackName",
             };
}

@end

@implementation AWSCloudformationDescribeStackEventsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"stackEvents" : @"StackEvents",
             };
}

+ (NSValueTransformer *)stackEventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationStackEvent class]];
}

@end

@implementation AWSCloudformationDescribeStackInstanceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stackInstanceAccount" : @"StackInstanceAccount",
             @"stackInstanceRegion" : @"StackInstanceRegion",
             @"stackSetName" : @"StackSetName",
             };
}

@end

@implementation AWSCloudformationDescribeStackInstanceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stackInstance" : @"StackInstance",
             };
}

+ (NSValueTransformer *)stackInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationStackInstance class]];
}

@end

@implementation AWSCloudformationDescribeStackResourceDriftsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"stackName" : @"StackName",
             @"stackResourceDriftStatusFilters" : @"StackResourceDriftStatusFilters",
             };
}

@end

@implementation AWSCloudformationDescribeStackResourceDriftsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"stackResourceDrifts" : @"StackResourceDrifts",
             };
}

+ (NSValueTransformer *)stackResourceDriftsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationStackResourceDrift class]];
}

@end

@implementation AWSCloudformationDescribeStackResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logicalResourceId" : @"LogicalResourceId",
             @"stackName" : @"StackName",
             };
}

@end

@implementation AWSCloudformationDescribeStackResourceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stackResourceDetail" : @"StackResourceDetail",
             };
}

+ (NSValueTransformer *)stackResourceDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationStackResourceDetail class]];
}

@end

@implementation AWSCloudformationDescribeStackResourcesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logicalResourceId" : @"LogicalResourceId",
             @"physicalResourceId" : @"PhysicalResourceId",
             @"stackName" : @"StackName",
             };
}

@end

@implementation AWSCloudformationDescribeStackResourcesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stackResources" : @"StackResources",
             };
}

+ (NSValueTransformer *)stackResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationStackResource class]];
}

@end

@implementation AWSCloudformationDescribeStackSetInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stackSetName" : @"StackSetName",
             };
}

@end

@implementation AWSCloudformationDescribeStackSetOperationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             @"stackSetName" : @"StackSetName",
             };
}

@end

@implementation AWSCloudformationDescribeStackSetOperationOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stackSetOperation" : @"StackSetOperation",
             };
}

+ (NSValueTransformer *)stackSetOperationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationStackSetOperation class]];
}

@end

@implementation AWSCloudformationDescribeStackSetOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stackSet" : @"StackSet",
             };
}

+ (NSValueTransformer *)stackSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationStackSet class]];
}

@end

@implementation AWSCloudformationDescribeStacksInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"stackName" : @"StackName",
             };
}

@end

@implementation AWSCloudformationDescribeStacksOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"stacks" : @"Stacks",
             };
}

+ (NSValueTransformer *)stacksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationStack class]];
}

@end

@implementation AWSCloudformationDescribeTypeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"types" : @"Type",
             @"typeName" : @"TypeName",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RESOURCE"] == NSOrderedSame) {
            return @(AWSCloudformationRegistryTypeResource);
        }
        return @(AWSCloudformationRegistryTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationRegistryTypeResource:
                return @"RESOURCE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationDescribeTypeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"defaultVersionId" : @"DefaultVersionId",
             @"deprecatedStatus" : @"DeprecatedStatus",
             @"detail" : @"Description",
             @"documentationUrl" : @"DocumentationUrl",
             @"executionRoleArn" : @"ExecutionRoleArn",
             @"isDefaultVersion" : @"IsDefaultVersion",
             @"lastUpdated" : @"LastUpdated",
             @"loggingConfig" : @"LoggingConfig",
             @"provisioningType" : @"ProvisioningType",
             @"schema" : @"Schema",
             @"sourceUrl" : @"SourceUrl",
             @"timeCreated" : @"TimeCreated",
             @"types" : @"Type",
             @"typeName" : @"TypeName",
             @"visibility" : @"Visibility",
             };
}

+ (NSValueTransformer *)deprecatedStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LIVE"] == NSOrderedSame) {
            return @(AWSCloudformationDeprecatedStatusLive);
        }
        if ([value caseInsensitiveCompare:@"DEPRECATED"] == NSOrderedSame) {
            return @(AWSCloudformationDeprecatedStatusDeprecated);
        }
        return @(AWSCloudformationDeprecatedStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationDeprecatedStatusLive:
                return @"LIVE";
            case AWSCloudformationDeprecatedStatusDeprecated:
                return @"DEPRECATED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastUpdatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)loggingConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationLoggingConfig class]];
}

+ (NSValueTransformer *)provisioningTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NON_PROVISIONABLE"] == NSOrderedSame) {
            return @(AWSCloudformationProvisioningTypeNonProvisionable);
        }
        if ([value caseInsensitiveCompare:@"IMMUTABLE"] == NSOrderedSame) {
            return @(AWSCloudformationProvisioningTypeImmutable);
        }
        if ([value caseInsensitiveCompare:@"FULLY_MUTABLE"] == NSOrderedSame) {
            return @(AWSCloudformationProvisioningTypeFullyMutable);
        }
        return @(AWSCloudformationProvisioningTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationProvisioningTypeNonProvisionable:
                return @"NON_PROVISIONABLE";
            case AWSCloudformationProvisioningTypeImmutable:
                return @"IMMUTABLE";
            case AWSCloudformationProvisioningTypeFullyMutable:
                return @"FULLY_MUTABLE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timeCreatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RESOURCE"] == NSOrderedSame) {
            return @(AWSCloudformationRegistryTypeResource);
        }
        return @(AWSCloudformationRegistryTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationRegistryTypeResource:
                return @"RESOURCE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)visibilityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUBLIC"] == NSOrderedSame) {
            return @(AWSCloudformationVisibilityPublic);
        }
        if ([value caseInsensitiveCompare:@"PRIVATE"] == NSOrderedSame) {
            return @(AWSCloudformationVisibilityPrivate);
        }
        return @(AWSCloudformationVisibilityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationVisibilityPublic:
                return @"PUBLIC";
            case AWSCloudformationVisibilityPrivate:
                return @"PRIVATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationDescribeTypeRegistrationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registrationToken" : @"RegistrationToken",
             };
}

@end

@implementation AWSCloudformationDescribeTypeRegistrationOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"progressStatus" : @"ProgressStatus",
             @"typeArn" : @"TypeArn",
             @"typeVersionArn" : @"TypeVersionArn",
             };
}

+ (NSValueTransformer *)progressStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationRegistrationStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationRegistrationStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationRegistrationStatusFailed);
        }
        return @(AWSCloudformationRegistrationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationRegistrationStatusComplete:
                return @"COMPLETE";
            case AWSCloudformationRegistrationStatusInProgress:
                return @"IN_PROGRESS";
            case AWSCloudformationRegistrationStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationDetectStackDriftInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logicalResourceIds" : @"LogicalResourceIds",
             @"stackName" : @"StackName",
             };
}

@end

@implementation AWSCloudformationDetectStackDriftOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stackDriftDetectionId" : @"StackDriftDetectionId",
             };
}

@end

@implementation AWSCloudformationDetectStackResourceDriftInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logicalResourceId" : @"LogicalResourceId",
             @"stackName" : @"StackName",
             };
}

@end

@implementation AWSCloudformationDetectStackResourceDriftOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stackResourceDrift" : @"StackResourceDrift",
             };
}

+ (NSValueTransformer *)stackResourceDriftJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationStackResourceDrift class]];
}

@end

@implementation AWSCloudformationDetectStackSetDriftInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             @"operationPreferences" : @"OperationPreferences",
             @"stackSetName" : @"StackSetName",
             };
}

+ (NSValueTransformer *)operationPreferencesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationStackSetOperationPreferences class]];
}

@end

@implementation AWSCloudformationDetectStackSetDriftOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSCloudformationEstimateTemplateCostInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameters" : @"Parameters",
             @"templateBody" : @"TemplateBody",
             @"templateURL" : @"TemplateURL",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationParameter class]];
}

@end

@implementation AWSCloudformationEstimateTemplateCostOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"url" : @"Url",
             };
}

@end

@implementation AWSCloudformationExecuteChangeSetInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeSetName" : @"ChangeSetName",
             @"clientRequestToken" : @"ClientRequestToken",
             @"stackName" : @"StackName",
             };
}

@end

@implementation AWSCloudformationExecuteChangeSetOutput

@end

@implementation AWSCloudformationExport

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportingStackId" : @"ExportingStackId",
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSCloudformationGetStackPolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stackName" : @"StackName",
             };
}

@end

@implementation AWSCloudformationGetStackPolicyOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stackPolicyBody" : @"StackPolicyBody",
             };
}

@end

@implementation AWSCloudformationGetTemplateInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeSetName" : @"ChangeSetName",
             @"stackName" : @"StackName",
             @"templateStage" : @"TemplateStage",
             };
}

+ (NSValueTransformer *)templateStageJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Original"] == NSOrderedSame) {
            return @(AWSCloudformationTemplateStageOriginal);
        }
        if ([value caseInsensitiveCompare:@"Processed"] == NSOrderedSame) {
            return @(AWSCloudformationTemplateStageProcessed);
        }
        return @(AWSCloudformationTemplateStageUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationTemplateStageOriginal:
                return @"Original";
            case AWSCloudformationTemplateStageProcessed:
                return @"Processed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationGetTemplateOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stagesAvailable" : @"StagesAvailable",
             @"templateBody" : @"TemplateBody",
             };
}

@end

@implementation AWSCloudformationGetTemplateSummaryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stackName" : @"StackName",
             @"stackSetName" : @"StackSetName",
             @"templateBody" : @"TemplateBody",
             @"templateURL" : @"TemplateURL",
             };
}

@end

@implementation AWSCloudformationGetTemplateSummaryOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capabilities" : @"Capabilities",
             @"capabilitiesReason" : @"CapabilitiesReason",
             @"declaredTransforms" : @"DeclaredTransforms",
             @"detail" : @"Description",
             @"metadata" : @"Metadata",
             @"parameters" : @"Parameters",
             @"resourceIdentifierSummaries" : @"ResourceIdentifierSummaries",
             @"resourceTypes" : @"ResourceTypes",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationParameterDeclaration class]];
}

+ (NSValueTransformer *)resourceIdentifierSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationResourceIdentifierSummary class]];
}

@end

@implementation AWSCloudformationListChangeSetsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"stackName" : @"StackName",
             };
}

@end

@implementation AWSCloudformationListChangeSetsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"summaries" : @"Summaries",
             };
}

+ (NSValueTransformer *)summariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationChangeSetSummary class]];
}

@end

@implementation AWSCloudformationListExportsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSCloudformationListExportsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exports" : @"Exports",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)exportsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationExport class]];
}

@end

@implementation AWSCloudformationListImportsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportName" : @"ExportName",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSCloudformationListImportsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imports" : @"Imports",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSCloudformationListStackInstancesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"stackInstanceAccount" : @"StackInstanceAccount",
             @"stackInstanceRegion" : @"StackInstanceRegion",
             @"stackSetName" : @"StackSetName",
             };
}

@end

@implementation AWSCloudformationListStackInstancesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"summaries" : @"Summaries",
             };
}

+ (NSValueTransformer *)summariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationStackInstanceSummary class]];
}

@end

@implementation AWSCloudformationListStackResourcesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"stackName" : @"StackName",
             };
}

@end

@implementation AWSCloudformationListStackResourcesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"stackResourceSummaries" : @"StackResourceSummaries",
             };
}

+ (NSValueTransformer *)stackResourceSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationStackResourceSummary class]];
}

@end

@implementation AWSCloudformationListStackSetOperationResultsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"operationId" : @"OperationId",
             @"stackSetName" : @"StackSetName",
             };
}

@end

@implementation AWSCloudformationListStackSetOperationResultsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"summaries" : @"Summaries",
             };
}

+ (NSValueTransformer *)summariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationStackSetOperationResultSummary class]];
}

@end

@implementation AWSCloudformationListStackSetOperationsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"stackSetName" : @"StackSetName",
             };
}

@end

@implementation AWSCloudformationListStackSetOperationsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"summaries" : @"Summaries",
             };
}

+ (NSValueTransformer *)summariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationStackSetOperationSummary class]];
}

@end

@implementation AWSCloudformationListStackSetsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetStatusDeleted);
        }
        return @(AWSCloudformationStackSetStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationStackSetStatusActive:
                return @"ACTIVE";
            case AWSCloudformationStackSetStatusDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationListStackSetsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"summaries" : @"Summaries",
             };
}

+ (NSValueTransformer *)summariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationStackSetSummary class]];
}

@end

@implementation AWSCloudformationListStacksInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"stackStatusFilter" : @"StackStatusFilter",
             };
}

@end

@implementation AWSCloudformationListStacksOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"stackSummaries" : @"StackSummaries",
             };
}

+ (NSValueTransformer *)stackSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationStackSummary class]];
}

@end

@implementation AWSCloudformationListTypeRegistrationsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"registrationStatusFilter" : @"RegistrationStatusFilter",
             @"types" : @"Type",
             @"typeArn" : @"TypeArn",
             @"typeName" : @"TypeName",
             };
}

+ (NSValueTransformer *)registrationStatusFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationRegistrationStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationRegistrationStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationRegistrationStatusFailed);
        }
        return @(AWSCloudformationRegistrationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationRegistrationStatusComplete:
                return @"COMPLETE";
            case AWSCloudformationRegistrationStatusInProgress:
                return @"IN_PROGRESS";
            case AWSCloudformationRegistrationStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RESOURCE"] == NSOrderedSame) {
            return @(AWSCloudformationRegistryTypeResource);
        }
        return @(AWSCloudformationRegistryTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationRegistryTypeResource:
                return @"RESOURCE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationListTypeRegistrationsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"registrationTokenList" : @"RegistrationTokenList",
             };
}

@end

@implementation AWSCloudformationListTypeVersionsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"deprecatedStatus" : @"DeprecatedStatus",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"types" : @"Type",
             @"typeName" : @"TypeName",
             };
}

+ (NSValueTransformer *)deprecatedStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LIVE"] == NSOrderedSame) {
            return @(AWSCloudformationDeprecatedStatusLive);
        }
        if ([value caseInsensitiveCompare:@"DEPRECATED"] == NSOrderedSame) {
            return @(AWSCloudformationDeprecatedStatusDeprecated);
        }
        return @(AWSCloudformationDeprecatedStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationDeprecatedStatusLive:
                return @"LIVE";
            case AWSCloudformationDeprecatedStatusDeprecated:
                return @"DEPRECATED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RESOURCE"] == NSOrderedSame) {
            return @(AWSCloudformationRegistryTypeResource);
        }
        return @(AWSCloudformationRegistryTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationRegistryTypeResource:
                return @"RESOURCE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationListTypeVersionsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"typeVersionSummaries" : @"TypeVersionSummaries",
             };
}

+ (NSValueTransformer *)typeVersionSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationTypeVersionSummary class]];
}

@end

@implementation AWSCloudformationListTypesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deprecatedStatus" : @"DeprecatedStatus",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"provisioningType" : @"ProvisioningType",
             @"visibility" : @"Visibility",
             };
}

+ (NSValueTransformer *)deprecatedStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LIVE"] == NSOrderedSame) {
            return @(AWSCloudformationDeprecatedStatusLive);
        }
        if ([value caseInsensitiveCompare:@"DEPRECATED"] == NSOrderedSame) {
            return @(AWSCloudformationDeprecatedStatusDeprecated);
        }
        return @(AWSCloudformationDeprecatedStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationDeprecatedStatusLive:
                return @"LIVE";
            case AWSCloudformationDeprecatedStatusDeprecated:
                return @"DEPRECATED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)provisioningTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NON_PROVISIONABLE"] == NSOrderedSame) {
            return @(AWSCloudformationProvisioningTypeNonProvisionable);
        }
        if ([value caseInsensitiveCompare:@"IMMUTABLE"] == NSOrderedSame) {
            return @(AWSCloudformationProvisioningTypeImmutable);
        }
        if ([value caseInsensitiveCompare:@"FULLY_MUTABLE"] == NSOrderedSame) {
            return @(AWSCloudformationProvisioningTypeFullyMutable);
        }
        return @(AWSCloudformationProvisioningTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationProvisioningTypeNonProvisionable:
                return @"NON_PROVISIONABLE";
            case AWSCloudformationProvisioningTypeImmutable:
                return @"IMMUTABLE";
            case AWSCloudformationProvisioningTypeFullyMutable:
                return @"FULLY_MUTABLE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)visibilityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUBLIC"] == NSOrderedSame) {
            return @(AWSCloudformationVisibilityPublic);
        }
        if ([value caseInsensitiveCompare:@"PRIVATE"] == NSOrderedSame) {
            return @(AWSCloudformationVisibilityPrivate);
        }
        return @(AWSCloudformationVisibilityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationVisibilityPublic:
                return @"PUBLIC";
            case AWSCloudformationVisibilityPrivate:
                return @"PRIVATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationListTypesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"typeSummaries" : @"TypeSummaries",
             };
}

+ (NSValueTransformer *)typeSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationTypeSummary class]];
}

@end

@implementation AWSCloudformationLoggingConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"LogGroupName",
             @"logRoleArn" : @"LogRoleArn",
             };
}

@end

@implementation AWSCloudformationOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"exportName" : @"ExportName",
             @"outputKey" : @"OutputKey",
             @"outputValue" : @"OutputValue",
             };
}

@end

@implementation AWSCloudformationParameter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameterKey" : @"ParameterKey",
             @"parameterValue" : @"ParameterValue",
             @"resolvedValue" : @"ResolvedValue",
             @"usePreviousValue" : @"UsePreviousValue",
             };
}

@end

@implementation AWSCloudformationParameterConstraints

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedValues" : @"AllowedValues",
             };
}

@end

@implementation AWSCloudformationParameterDeclaration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultValue" : @"DefaultValue",
             @"detail" : @"Description",
             @"noEcho" : @"NoEcho",
             @"parameterConstraints" : @"ParameterConstraints",
             @"parameterKey" : @"ParameterKey",
             @"parameterType" : @"ParameterType",
             };
}

+ (NSValueTransformer *)parameterConstraintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationParameterConstraints class]];
}

@end

@implementation AWSCloudformationPhysicalResourceIdContextKeyValuePair

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSCloudformationPropertyDifference

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actualValue" : @"ActualValue",
             @"differenceType" : @"DifferenceType",
             @"expectedValue" : @"ExpectedValue",
             @"propertyPath" : @"PropertyPath",
             };
}

+ (NSValueTransformer *)differenceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADD"] == NSOrderedSame) {
            return @(AWSCloudformationDifferenceTypeAdd);
        }
        if ([value caseInsensitiveCompare:@"REMOVE"] == NSOrderedSame) {
            return @(AWSCloudformationDifferenceTypeRemove);
        }
        if ([value caseInsensitiveCompare:@"NOT_EQUAL"] == NSOrderedSame) {
            return @(AWSCloudformationDifferenceTypeNotEqual);
        }
        return @(AWSCloudformationDifferenceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationDifferenceTypeAdd:
                return @"ADD";
            case AWSCloudformationDifferenceTypeRemove:
                return @"REMOVE";
            case AWSCloudformationDifferenceTypeNotEqual:
                return @"NOT_EQUAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationRecordHandlerProgressInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bearerToken" : @"BearerToken",
             @"clientRequestToken" : @"ClientRequestToken",
             @"currentOperationStatus" : @"CurrentOperationStatus",
             @"errorCode" : @"ErrorCode",
             @"operationStatus" : @"OperationStatus",
             @"resourceModel" : @"ResourceModel",
             @"statusMessage" : @"StatusMessage",
             };
}

+ (NSValueTransformer *)currentOperationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSCloudformationOperationStatusPending);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationOperationStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSCloudformationOperationStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationOperationStatusFailed);
        }
        return @(AWSCloudformationOperationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationOperationStatusPending:
                return @"PENDING";
            case AWSCloudformationOperationStatusInProgress:
                return @"IN_PROGRESS";
            case AWSCloudformationOperationStatusSuccess:
                return @"SUCCESS";
            case AWSCloudformationOperationStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)errorCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NotUpdatable"] == NSOrderedSame) {
            return @(AWSCloudformationHandlerErrorCodeNotUpdatable);
        }
        if ([value caseInsensitiveCompare:@"InvalidRequest"] == NSOrderedSame) {
            return @(AWSCloudformationHandlerErrorCodeInvalidRequest);
        }
        if ([value caseInsensitiveCompare:@"AccessDenied"] == NSOrderedSame) {
            return @(AWSCloudformationHandlerErrorCodeAccessDenied);
        }
        if ([value caseInsensitiveCompare:@"InvalidCredentials"] == NSOrderedSame) {
            return @(AWSCloudformationHandlerErrorCodeInvalidCredentials);
        }
        if ([value caseInsensitiveCompare:@"AlreadyExists"] == NSOrderedSame) {
            return @(AWSCloudformationHandlerErrorCodeAlreadyExists);
        }
        if ([value caseInsensitiveCompare:@"NotFound"] == NSOrderedSame) {
            return @(AWSCloudformationHandlerErrorCodeNotFound);
        }
        if ([value caseInsensitiveCompare:@"ResourceConflict"] == NSOrderedSame) {
            return @(AWSCloudformationHandlerErrorCodeResourceConflict);
        }
        if ([value caseInsensitiveCompare:@"Throttling"] == NSOrderedSame) {
            return @(AWSCloudformationHandlerErrorCodeThrottling);
        }
        if ([value caseInsensitiveCompare:@"ServiceLimitExceeded"] == NSOrderedSame) {
            return @(AWSCloudformationHandlerErrorCodeServiceLimitExceeded);
        }
        if ([value caseInsensitiveCompare:@"NotStabilized"] == NSOrderedSame) {
            return @(AWSCloudformationHandlerErrorCodeNotStabilized);
        }
        if ([value caseInsensitiveCompare:@"GeneralServiceException"] == NSOrderedSame) {
            return @(AWSCloudformationHandlerErrorCodeGeneralServiceException);
        }
        if ([value caseInsensitiveCompare:@"ServiceInternalError"] == NSOrderedSame) {
            return @(AWSCloudformationHandlerErrorCodeServiceInternalError);
        }
        if ([value caseInsensitiveCompare:@"NetworkFailure"] == NSOrderedSame) {
            return @(AWSCloudformationHandlerErrorCodeNetworkFailure);
        }
        if ([value caseInsensitiveCompare:@"InternalFailure"] == NSOrderedSame) {
            return @(AWSCloudformationHandlerErrorCodeInternalFailure);
        }
        return @(AWSCloudformationHandlerErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationHandlerErrorCodeNotUpdatable:
                return @"NotUpdatable";
            case AWSCloudformationHandlerErrorCodeInvalidRequest:
                return @"InvalidRequest";
            case AWSCloudformationHandlerErrorCodeAccessDenied:
                return @"AccessDenied";
            case AWSCloudformationHandlerErrorCodeInvalidCredentials:
                return @"InvalidCredentials";
            case AWSCloudformationHandlerErrorCodeAlreadyExists:
                return @"AlreadyExists";
            case AWSCloudformationHandlerErrorCodeNotFound:
                return @"NotFound";
            case AWSCloudformationHandlerErrorCodeResourceConflict:
                return @"ResourceConflict";
            case AWSCloudformationHandlerErrorCodeThrottling:
                return @"Throttling";
            case AWSCloudformationHandlerErrorCodeServiceLimitExceeded:
                return @"ServiceLimitExceeded";
            case AWSCloudformationHandlerErrorCodeNotStabilized:
                return @"NotStabilized";
            case AWSCloudformationHandlerErrorCodeGeneralServiceException:
                return @"GeneralServiceException";
            case AWSCloudformationHandlerErrorCodeServiceInternalError:
                return @"ServiceInternalError";
            case AWSCloudformationHandlerErrorCodeNetworkFailure:
                return @"NetworkFailure";
            case AWSCloudformationHandlerErrorCodeInternalFailure:
                return @"InternalFailure";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)operationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSCloudformationOperationStatusPending);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationOperationStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSCloudformationOperationStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationOperationStatusFailed);
        }
        return @(AWSCloudformationOperationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationOperationStatusPending:
                return @"PENDING";
            case AWSCloudformationOperationStatusInProgress:
                return @"IN_PROGRESS";
            case AWSCloudformationOperationStatusSuccess:
                return @"SUCCESS";
            case AWSCloudformationOperationStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationRecordHandlerProgressOutput

@end

@implementation AWSCloudformationRegisterTypeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"executionRoleArn" : @"ExecutionRoleArn",
             @"loggingConfig" : @"LoggingConfig",
             @"schemaHandlerPackage" : @"SchemaHandlerPackage",
             @"types" : @"Type",
             @"typeName" : @"TypeName",
             };
}

+ (NSValueTransformer *)loggingConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationLoggingConfig class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RESOURCE"] == NSOrderedSame) {
            return @(AWSCloudformationRegistryTypeResource);
        }
        return @(AWSCloudformationRegistryTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationRegistryTypeResource:
                return @"RESOURCE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationRegisterTypeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registrationToken" : @"RegistrationToken",
             };
}

@end

@implementation AWSCloudformationResourceChange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"details" : @"Details",
             @"logicalResourceId" : @"LogicalResourceId",
             @"physicalResourceId" : @"PhysicalResourceId",
             @"replacement" : @"Replacement",
             @"resourceType" : @"ResourceType",
             @"scope" : @"Scope",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Add"] == NSOrderedSame) {
            return @(AWSCloudformationChangeActionAdd);
        }
        if ([value caseInsensitiveCompare:@"Modify"] == NSOrderedSame) {
            return @(AWSCloudformationChangeActionModify);
        }
        if ([value caseInsensitiveCompare:@"Remove"] == NSOrderedSame) {
            return @(AWSCloudformationChangeActionRemove);
        }
        if ([value caseInsensitiveCompare:@"Import"] == NSOrderedSame) {
            return @(AWSCloudformationChangeActionImport);
        }
        return @(AWSCloudformationChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationChangeActionAdd:
                return @"Add";
            case AWSCloudformationChangeActionModify:
                return @"Modify";
            case AWSCloudformationChangeActionRemove:
                return @"Remove";
            case AWSCloudformationChangeActionImport:
                return @"Import";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)detailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationResourceChangeDetail class]];
}

+ (NSValueTransformer *)replacementJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"True"] == NSOrderedSame) {
            return @(AWSCloudformationReplacementTrue);
        }
        if ([value caseInsensitiveCompare:@"False"] == NSOrderedSame) {
            return @(AWSCloudformationReplacementFalse);
        }
        if ([value caseInsensitiveCompare:@"Conditional"] == NSOrderedSame) {
            return @(AWSCloudformationReplacementConditional);
        }
        return @(AWSCloudformationReplacementUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationReplacementTrue:
                return @"True";
            case AWSCloudformationReplacementFalse:
                return @"False";
            case AWSCloudformationReplacementConditional:
                return @"Conditional";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationResourceChangeDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"causingEntity" : @"CausingEntity",
             @"changeSource" : @"ChangeSource",
             @"evaluation" : @"Evaluation",
             @"target" : @"Target",
             };
}

+ (NSValueTransformer *)changeSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ResourceReference"] == NSOrderedSame) {
            return @(AWSCloudformationChangeSourceResourceReference);
        }
        if ([value caseInsensitiveCompare:@"ParameterReference"] == NSOrderedSame) {
            return @(AWSCloudformationChangeSourceParameterReference);
        }
        if ([value caseInsensitiveCompare:@"ResourceAttribute"] == NSOrderedSame) {
            return @(AWSCloudformationChangeSourceResourceAttribute);
        }
        if ([value caseInsensitiveCompare:@"DirectModification"] == NSOrderedSame) {
            return @(AWSCloudformationChangeSourceDirectModification);
        }
        if ([value caseInsensitiveCompare:@"Automatic"] == NSOrderedSame) {
            return @(AWSCloudformationChangeSourceAutomatic);
        }
        return @(AWSCloudformationChangeSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationChangeSourceResourceReference:
                return @"ResourceReference";
            case AWSCloudformationChangeSourceParameterReference:
                return @"ParameterReference";
            case AWSCloudformationChangeSourceResourceAttribute:
                return @"ResourceAttribute";
            case AWSCloudformationChangeSourceDirectModification:
                return @"DirectModification";
            case AWSCloudformationChangeSourceAutomatic:
                return @"Automatic";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)evaluationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Static"] == NSOrderedSame) {
            return @(AWSCloudformationEvaluationTypeStatic);
        }
        if ([value caseInsensitiveCompare:@"Dynamic"] == NSOrderedSame) {
            return @(AWSCloudformationEvaluationTypeDynamic);
        }
        return @(AWSCloudformationEvaluationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationEvaluationTypeStatic:
                return @"Static";
            case AWSCloudformationEvaluationTypeDynamic:
                return @"Dynamic";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationResourceTargetDefinition class]];
}

@end

@implementation AWSCloudformationResourceIdentifierSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logicalResourceIds" : @"LogicalResourceIds",
             @"resourceIdentifiers" : @"ResourceIdentifiers",
             @"resourceType" : @"ResourceType",
             };
}

@end

@implementation AWSCloudformationResourceTargetDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attribute" : @"Attribute",
             @"name" : @"Name",
             @"requiresRecreation" : @"RequiresRecreation",
             };
}

+ (NSValueTransformer *)attributeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Properties"] == NSOrderedSame) {
            return @(AWSCloudformationResourceAttributeProperties);
        }
        if ([value caseInsensitiveCompare:@"Metadata"] == NSOrderedSame) {
            return @(AWSCloudformationResourceAttributeMetadata);
        }
        if ([value caseInsensitiveCompare:@"CreationPolicy"] == NSOrderedSame) {
            return @(AWSCloudformationResourceAttributeCreationPolicy);
        }
        if ([value caseInsensitiveCompare:@"UpdatePolicy"] == NSOrderedSame) {
            return @(AWSCloudformationResourceAttributeUpdatePolicy);
        }
        if ([value caseInsensitiveCompare:@"DeletionPolicy"] == NSOrderedSame) {
            return @(AWSCloudformationResourceAttributeDeletionPolicy);
        }
        if ([value caseInsensitiveCompare:@"Tags"] == NSOrderedSame) {
            return @(AWSCloudformationResourceAttributeTags);
        }
        return @(AWSCloudformationResourceAttributeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationResourceAttributeProperties:
                return @"Properties";
            case AWSCloudformationResourceAttributeMetadata:
                return @"Metadata";
            case AWSCloudformationResourceAttributeCreationPolicy:
                return @"CreationPolicy";
            case AWSCloudformationResourceAttributeUpdatePolicy:
                return @"UpdatePolicy";
            case AWSCloudformationResourceAttributeDeletionPolicy:
                return @"DeletionPolicy";
            case AWSCloudformationResourceAttributeTags:
                return @"Tags";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requiresRecreationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Never"] == NSOrderedSame) {
            return @(AWSCloudformationRequiresRecreationNever);
        }
        if ([value caseInsensitiveCompare:@"Conditionally"] == NSOrderedSame) {
            return @(AWSCloudformationRequiresRecreationConditionally);
        }
        if ([value caseInsensitiveCompare:@"Always"] == NSOrderedSame) {
            return @(AWSCloudformationRequiresRecreationAlways);
        }
        return @(AWSCloudformationRequiresRecreationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationRequiresRecreationNever:
                return @"Never";
            case AWSCloudformationRequiresRecreationConditionally:
                return @"Conditionally";
            case AWSCloudformationRequiresRecreationAlways:
                return @"Always";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationResourceToImport

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logicalResourceId" : @"LogicalResourceId",
             @"resourceIdentifier" : @"ResourceIdentifier",
             @"resourceType" : @"ResourceType",
             };
}

@end

@implementation AWSCloudformationRollbackConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringTimeInMinutes" : @"MonitoringTimeInMinutes",
             @"rollbackTriggers" : @"RollbackTriggers",
             };
}

+ (NSValueTransformer *)rollbackTriggersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationRollbackTrigger class]];
}

@end

@implementation AWSCloudformationRollbackTrigger

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"types" : @"Type",
             };
}

@end

@implementation AWSCloudformationSetStackPolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stackName" : @"StackName",
             @"stackPolicyBody" : @"StackPolicyBody",
             @"stackPolicyURL" : @"StackPolicyURL",
             };
}

@end

@implementation AWSCloudformationSetTypeDefaultVersionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"types" : @"Type",
             @"typeName" : @"TypeName",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RESOURCE"] == NSOrderedSame) {
            return @(AWSCloudformationRegistryTypeResource);
        }
        return @(AWSCloudformationRegistryTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationRegistryTypeResource:
                return @"RESOURCE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationSetTypeDefaultVersionOutput

@end

@implementation AWSCloudformationSignalResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logicalResourceId" : @"LogicalResourceId",
             @"stackName" : @"StackName",
             @"status" : @"Status",
             @"uniqueId" : @"UniqueId",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSCloudformationResourceSignalStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILURE"] == NSOrderedSame) {
            return @(AWSCloudformationResourceSignalStatusFailure);
        }
        return @(AWSCloudformationResourceSignalStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationResourceSignalStatusSuccess:
                return @"SUCCESS";
            case AWSCloudformationResourceSignalStatusFailure:
                return @"FAILURE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationStack

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capabilities" : @"Capabilities",
             @"changeSetId" : @"ChangeSetId",
             @"creationTime" : @"CreationTime",
             @"deletionTime" : @"DeletionTime",
             @"detail" : @"Description",
             @"disableRollback" : @"DisableRollback",
             @"driftInformation" : @"DriftInformation",
             @"enableTerminationProtection" : @"EnableTerminationProtection",
             @"lastUpdatedTime" : @"LastUpdatedTime",
             @"notificationARNs" : @"NotificationARNs",
             @"outputs" : @"Outputs",
             @"parameters" : @"Parameters",
             @"parentId" : @"ParentId",
             @"roleARN" : @"RoleARN",
             @"rollbackConfiguration" : @"RollbackConfiguration",
             @"rootId" : @"RootId",
             @"stackId" : @"StackId",
             @"stackName" : @"StackName",
             @"stackStatus" : @"StackStatus",
             @"stackStatusReason" : @"StackStatusReason",
             @"tags" : @"Tags",
             @"timeoutInMinutes" : @"TimeoutInMinutes",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)deletionTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)driftInformationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationStackDriftInformation class]];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)outputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationOutput class]];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationParameter class]];
}

+ (NSValueTransformer *)rollbackConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationRollbackConfiguration class]];
}

+ (NSValueTransformer *)stackStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusCreateInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"CREATE_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusCreateComplete);
        }
        if ([value caseInsensitiveCompare:@"ROLLBACK_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusRollbackInProgress);
        }
        if ([value caseInsensitiveCompare:@"ROLLBACK_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusRollbackFailed);
        }
        if ([value caseInsensitiveCompare:@"ROLLBACK_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusRollbackComplete);
        }
        if ([value caseInsensitiveCompare:@"DELETE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusDeleteInProgress);
        }
        if ([value caseInsensitiveCompare:@"DELETE_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusDeleteFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETE_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusDeleteComplete);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusUpdateInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_COMPLETE_CLEANUP_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusUpdateCompleteCleanupInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusUpdateComplete);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_ROLLBACK_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusUpdateRollbackInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_ROLLBACK_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusUpdateRollbackFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusUpdateRollbackCompleteCleanupInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_ROLLBACK_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusUpdateRollbackComplete);
        }
        if ([value caseInsensitiveCompare:@"REVIEW_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusReviewInProgress);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusImportInProgress);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusImportComplete);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ROLLBACK_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusImportRollbackInProgress);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ROLLBACK_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusImportRollbackFailed);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ROLLBACK_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusImportRollbackComplete);
        }
        return @(AWSCloudformationStackStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationStackStatusCreateInProgress:
                return @"CREATE_IN_PROGRESS";
            case AWSCloudformationStackStatusCreateFailed:
                return @"CREATE_FAILED";
            case AWSCloudformationStackStatusCreateComplete:
                return @"CREATE_COMPLETE";
            case AWSCloudformationStackStatusRollbackInProgress:
                return @"ROLLBACK_IN_PROGRESS";
            case AWSCloudformationStackStatusRollbackFailed:
                return @"ROLLBACK_FAILED";
            case AWSCloudformationStackStatusRollbackComplete:
                return @"ROLLBACK_COMPLETE";
            case AWSCloudformationStackStatusDeleteInProgress:
                return @"DELETE_IN_PROGRESS";
            case AWSCloudformationStackStatusDeleteFailed:
                return @"DELETE_FAILED";
            case AWSCloudformationStackStatusDeleteComplete:
                return @"DELETE_COMPLETE";
            case AWSCloudformationStackStatusUpdateInProgress:
                return @"UPDATE_IN_PROGRESS";
            case AWSCloudformationStackStatusUpdateCompleteCleanupInProgress:
                return @"UPDATE_COMPLETE_CLEANUP_IN_PROGRESS";
            case AWSCloudformationStackStatusUpdateComplete:
                return @"UPDATE_COMPLETE";
            case AWSCloudformationStackStatusUpdateRollbackInProgress:
                return @"UPDATE_ROLLBACK_IN_PROGRESS";
            case AWSCloudformationStackStatusUpdateRollbackFailed:
                return @"UPDATE_ROLLBACK_FAILED";
            case AWSCloudformationStackStatusUpdateRollbackCompleteCleanupInProgress:
                return @"UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS";
            case AWSCloudformationStackStatusUpdateRollbackComplete:
                return @"UPDATE_ROLLBACK_COMPLETE";
            case AWSCloudformationStackStatusReviewInProgress:
                return @"REVIEW_IN_PROGRESS";
            case AWSCloudformationStackStatusImportInProgress:
                return @"IMPORT_IN_PROGRESS";
            case AWSCloudformationStackStatusImportComplete:
                return @"IMPORT_COMPLETE";
            case AWSCloudformationStackStatusImportRollbackInProgress:
                return @"IMPORT_ROLLBACK_IN_PROGRESS";
            case AWSCloudformationStackStatusImportRollbackFailed:
                return @"IMPORT_ROLLBACK_FAILED";
            case AWSCloudformationStackStatusImportRollbackComplete:
                return @"IMPORT_ROLLBACK_COMPLETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationTag class]];
}

@end

@implementation AWSCloudformationStackDriftInformation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastCheckTimestamp" : @"LastCheckTimestamp",
             @"stackDriftStatus" : @"StackDriftStatus",
             };
}

+ (NSValueTransformer *)lastCheckTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)stackDriftStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DRIFTED"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftStatusDrifted);
        }
        if ([value caseInsensitiveCompare:@"IN_SYNC"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftStatusInSync);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftStatusUnknown);
        }
        if ([value caseInsensitiveCompare:@"NOT_CHECKED"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftStatusNotChecked);
        }
        return @(AWSCloudformationStackDriftStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationStackDriftStatusDrifted:
                return @"DRIFTED";
            case AWSCloudformationStackDriftStatusInSync:
                return @"IN_SYNC";
            case AWSCloudformationStackDriftStatusUnknown:
                return @"UNKNOWN";
            case AWSCloudformationStackDriftStatusNotChecked:
                return @"NOT_CHECKED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationStackDriftInformationSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastCheckTimestamp" : @"LastCheckTimestamp",
             @"stackDriftStatus" : @"StackDriftStatus",
             };
}

+ (NSValueTransformer *)lastCheckTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)stackDriftStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DRIFTED"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftStatusDrifted);
        }
        if ([value caseInsensitiveCompare:@"IN_SYNC"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftStatusInSync);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftStatusUnknown);
        }
        if ([value caseInsensitiveCompare:@"NOT_CHECKED"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftStatusNotChecked);
        }
        return @(AWSCloudformationStackDriftStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationStackDriftStatusDrifted:
                return @"DRIFTED";
            case AWSCloudformationStackDriftStatusInSync:
                return @"IN_SYNC";
            case AWSCloudformationStackDriftStatusUnknown:
                return @"UNKNOWN";
            case AWSCloudformationStackDriftStatusNotChecked:
                return @"NOT_CHECKED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationStackEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"eventId" : @"EventId",
             @"logicalResourceId" : @"LogicalResourceId",
             @"physicalResourceId" : @"PhysicalResourceId",
             @"resourceProperties" : @"ResourceProperties",
             @"resourceStatus" : @"ResourceStatus",
             @"resourceStatusReason" : @"ResourceStatusReason",
             @"resourceType" : @"ResourceType",
             @"stackId" : @"StackId",
             @"stackName" : @"StackName",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)resourceStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusCreateInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"CREATE_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusCreateComplete);
        }
        if ([value caseInsensitiveCompare:@"DELETE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusDeleteInProgress);
        }
        if ([value caseInsensitiveCompare:@"DELETE_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusDeleteFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETE_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusDeleteComplete);
        }
        if ([value caseInsensitiveCompare:@"DELETE_SKIPPED"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusDeleteSkipped);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusUpdateInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusUpdateFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusUpdateComplete);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusImportFailed);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusImportComplete);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusImportInProgress);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ROLLBACK_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusImportRollbackInProgress);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ROLLBACK_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusImportRollbackFailed);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ROLLBACK_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusImportRollbackComplete);
        }
        return @(AWSCloudformationResourceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationResourceStatusCreateInProgress:
                return @"CREATE_IN_PROGRESS";
            case AWSCloudformationResourceStatusCreateFailed:
                return @"CREATE_FAILED";
            case AWSCloudformationResourceStatusCreateComplete:
                return @"CREATE_COMPLETE";
            case AWSCloudformationResourceStatusDeleteInProgress:
                return @"DELETE_IN_PROGRESS";
            case AWSCloudformationResourceStatusDeleteFailed:
                return @"DELETE_FAILED";
            case AWSCloudformationResourceStatusDeleteComplete:
                return @"DELETE_COMPLETE";
            case AWSCloudformationResourceStatusDeleteSkipped:
                return @"DELETE_SKIPPED";
            case AWSCloudformationResourceStatusUpdateInProgress:
                return @"UPDATE_IN_PROGRESS";
            case AWSCloudformationResourceStatusUpdateFailed:
                return @"UPDATE_FAILED";
            case AWSCloudformationResourceStatusUpdateComplete:
                return @"UPDATE_COMPLETE";
            case AWSCloudformationResourceStatusImportFailed:
                return @"IMPORT_FAILED";
            case AWSCloudformationResourceStatusImportComplete:
                return @"IMPORT_COMPLETE";
            case AWSCloudformationResourceStatusImportInProgress:
                return @"IMPORT_IN_PROGRESS";
            case AWSCloudformationResourceStatusImportRollbackInProgress:
                return @"IMPORT_ROLLBACK_IN_PROGRESS";
            case AWSCloudformationResourceStatusImportRollbackFailed:
                return @"IMPORT_ROLLBACK_FAILED";
            case AWSCloudformationResourceStatusImportRollbackComplete:
                return @"IMPORT_ROLLBACK_COMPLETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSCloudformationStackInstance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"account" : @"Account",
             @"driftStatus" : @"DriftStatus",
             @"lastDriftCheckTimestamp" : @"LastDriftCheckTimestamp",
             @"organizationalUnitId" : @"OrganizationalUnitId",
             @"parameterOverrides" : @"ParameterOverrides",
             @"region" : @"Region",
             @"stackId" : @"StackId",
             @"stackSetId" : @"StackSetId",
             @"status" : @"Status",
             @"statusReason" : @"StatusReason",
             };
}

+ (NSValueTransformer *)driftStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DRIFTED"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftStatusDrifted);
        }
        if ([value caseInsensitiveCompare:@"IN_SYNC"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftStatusInSync);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftStatusUnknown);
        }
        if ([value caseInsensitiveCompare:@"NOT_CHECKED"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftStatusNotChecked);
        }
        return @(AWSCloudformationStackDriftStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationStackDriftStatusDrifted:
                return @"DRIFTED";
            case AWSCloudformationStackDriftStatusInSync:
                return @"IN_SYNC";
            case AWSCloudformationStackDriftStatusUnknown:
                return @"UNKNOWN";
            case AWSCloudformationStackDriftStatusNotChecked:
                return @"NOT_CHECKED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastDriftCheckTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)parameterOverridesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationParameter class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CURRENT"] == NSOrderedSame) {
            return @(AWSCloudformationStackInstanceStatusCurrent);
        }
        if ([value caseInsensitiveCompare:@"OUTDATED"] == NSOrderedSame) {
            return @(AWSCloudformationStackInstanceStatusOutdated);
        }
        if ([value caseInsensitiveCompare:@"INOPERABLE"] == NSOrderedSame) {
            return @(AWSCloudformationStackInstanceStatusInoperable);
        }
        return @(AWSCloudformationStackInstanceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationStackInstanceStatusCurrent:
                return @"CURRENT";
            case AWSCloudformationStackInstanceStatusOutdated:
                return @"OUTDATED";
            case AWSCloudformationStackInstanceStatusInoperable:
                return @"INOPERABLE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationStackInstanceSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"account" : @"Account",
             @"driftStatus" : @"DriftStatus",
             @"lastDriftCheckTimestamp" : @"LastDriftCheckTimestamp",
             @"organizationalUnitId" : @"OrganizationalUnitId",
             @"region" : @"Region",
             @"stackId" : @"StackId",
             @"stackSetId" : @"StackSetId",
             @"status" : @"Status",
             @"statusReason" : @"StatusReason",
             };
}

+ (NSValueTransformer *)driftStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DRIFTED"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftStatusDrifted);
        }
        if ([value caseInsensitiveCompare:@"IN_SYNC"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftStatusInSync);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftStatusUnknown);
        }
        if ([value caseInsensitiveCompare:@"NOT_CHECKED"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftStatusNotChecked);
        }
        return @(AWSCloudformationStackDriftStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationStackDriftStatusDrifted:
                return @"DRIFTED";
            case AWSCloudformationStackDriftStatusInSync:
                return @"IN_SYNC";
            case AWSCloudformationStackDriftStatusUnknown:
                return @"UNKNOWN";
            case AWSCloudformationStackDriftStatusNotChecked:
                return @"NOT_CHECKED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastDriftCheckTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CURRENT"] == NSOrderedSame) {
            return @(AWSCloudformationStackInstanceStatusCurrent);
        }
        if ([value caseInsensitiveCompare:@"OUTDATED"] == NSOrderedSame) {
            return @(AWSCloudformationStackInstanceStatusOutdated);
        }
        if ([value caseInsensitiveCompare:@"INOPERABLE"] == NSOrderedSame) {
            return @(AWSCloudformationStackInstanceStatusInoperable);
        }
        return @(AWSCloudformationStackInstanceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationStackInstanceStatusCurrent:
                return @"CURRENT";
            case AWSCloudformationStackInstanceStatusOutdated:
                return @"OUTDATED";
            case AWSCloudformationStackInstanceStatusInoperable:
                return @"INOPERABLE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationStackResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"driftInformation" : @"DriftInformation",
             @"logicalResourceId" : @"LogicalResourceId",
             @"physicalResourceId" : @"PhysicalResourceId",
             @"resourceStatus" : @"ResourceStatus",
             @"resourceStatusReason" : @"ResourceStatusReason",
             @"resourceType" : @"ResourceType",
             @"stackId" : @"StackId",
             @"stackName" : @"StackName",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)driftInformationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationStackResourceDriftInformation class]];
}

+ (NSValueTransformer *)resourceStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusCreateInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"CREATE_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusCreateComplete);
        }
        if ([value caseInsensitiveCompare:@"DELETE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusDeleteInProgress);
        }
        if ([value caseInsensitiveCompare:@"DELETE_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusDeleteFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETE_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusDeleteComplete);
        }
        if ([value caseInsensitiveCompare:@"DELETE_SKIPPED"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusDeleteSkipped);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusUpdateInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusUpdateFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusUpdateComplete);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusImportFailed);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusImportComplete);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusImportInProgress);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ROLLBACK_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusImportRollbackInProgress);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ROLLBACK_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusImportRollbackFailed);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ROLLBACK_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusImportRollbackComplete);
        }
        return @(AWSCloudformationResourceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationResourceStatusCreateInProgress:
                return @"CREATE_IN_PROGRESS";
            case AWSCloudformationResourceStatusCreateFailed:
                return @"CREATE_FAILED";
            case AWSCloudformationResourceStatusCreateComplete:
                return @"CREATE_COMPLETE";
            case AWSCloudformationResourceStatusDeleteInProgress:
                return @"DELETE_IN_PROGRESS";
            case AWSCloudformationResourceStatusDeleteFailed:
                return @"DELETE_FAILED";
            case AWSCloudformationResourceStatusDeleteComplete:
                return @"DELETE_COMPLETE";
            case AWSCloudformationResourceStatusDeleteSkipped:
                return @"DELETE_SKIPPED";
            case AWSCloudformationResourceStatusUpdateInProgress:
                return @"UPDATE_IN_PROGRESS";
            case AWSCloudformationResourceStatusUpdateFailed:
                return @"UPDATE_FAILED";
            case AWSCloudformationResourceStatusUpdateComplete:
                return @"UPDATE_COMPLETE";
            case AWSCloudformationResourceStatusImportFailed:
                return @"IMPORT_FAILED";
            case AWSCloudformationResourceStatusImportComplete:
                return @"IMPORT_COMPLETE";
            case AWSCloudformationResourceStatusImportInProgress:
                return @"IMPORT_IN_PROGRESS";
            case AWSCloudformationResourceStatusImportRollbackInProgress:
                return @"IMPORT_ROLLBACK_IN_PROGRESS";
            case AWSCloudformationResourceStatusImportRollbackFailed:
                return @"IMPORT_ROLLBACK_FAILED";
            case AWSCloudformationResourceStatusImportRollbackComplete:
                return @"IMPORT_ROLLBACK_COMPLETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSCloudformationStackResourceDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"driftInformation" : @"DriftInformation",
             @"lastUpdatedTimestamp" : @"LastUpdatedTimestamp",
             @"logicalResourceId" : @"LogicalResourceId",
             @"metadata" : @"Metadata",
             @"physicalResourceId" : @"PhysicalResourceId",
             @"resourceStatus" : @"ResourceStatus",
             @"resourceStatusReason" : @"ResourceStatusReason",
             @"resourceType" : @"ResourceType",
             @"stackId" : @"StackId",
             @"stackName" : @"StackName",
             };
}

+ (NSValueTransformer *)driftInformationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationStackResourceDriftInformation class]];
}

+ (NSValueTransformer *)lastUpdatedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)resourceStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusCreateInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"CREATE_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusCreateComplete);
        }
        if ([value caseInsensitiveCompare:@"DELETE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusDeleteInProgress);
        }
        if ([value caseInsensitiveCompare:@"DELETE_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusDeleteFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETE_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusDeleteComplete);
        }
        if ([value caseInsensitiveCompare:@"DELETE_SKIPPED"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusDeleteSkipped);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusUpdateInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusUpdateFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusUpdateComplete);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusImportFailed);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusImportComplete);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusImportInProgress);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ROLLBACK_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusImportRollbackInProgress);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ROLLBACK_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusImportRollbackFailed);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ROLLBACK_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusImportRollbackComplete);
        }
        return @(AWSCloudformationResourceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationResourceStatusCreateInProgress:
                return @"CREATE_IN_PROGRESS";
            case AWSCloudformationResourceStatusCreateFailed:
                return @"CREATE_FAILED";
            case AWSCloudformationResourceStatusCreateComplete:
                return @"CREATE_COMPLETE";
            case AWSCloudformationResourceStatusDeleteInProgress:
                return @"DELETE_IN_PROGRESS";
            case AWSCloudformationResourceStatusDeleteFailed:
                return @"DELETE_FAILED";
            case AWSCloudformationResourceStatusDeleteComplete:
                return @"DELETE_COMPLETE";
            case AWSCloudformationResourceStatusDeleteSkipped:
                return @"DELETE_SKIPPED";
            case AWSCloudformationResourceStatusUpdateInProgress:
                return @"UPDATE_IN_PROGRESS";
            case AWSCloudformationResourceStatusUpdateFailed:
                return @"UPDATE_FAILED";
            case AWSCloudformationResourceStatusUpdateComplete:
                return @"UPDATE_COMPLETE";
            case AWSCloudformationResourceStatusImportFailed:
                return @"IMPORT_FAILED";
            case AWSCloudformationResourceStatusImportComplete:
                return @"IMPORT_COMPLETE";
            case AWSCloudformationResourceStatusImportInProgress:
                return @"IMPORT_IN_PROGRESS";
            case AWSCloudformationResourceStatusImportRollbackInProgress:
                return @"IMPORT_ROLLBACK_IN_PROGRESS";
            case AWSCloudformationResourceStatusImportRollbackFailed:
                return @"IMPORT_ROLLBACK_FAILED";
            case AWSCloudformationResourceStatusImportRollbackComplete:
                return @"IMPORT_ROLLBACK_COMPLETE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationStackResourceDrift

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actualProperties" : @"ActualProperties",
             @"expectedProperties" : @"ExpectedProperties",
             @"logicalResourceId" : @"LogicalResourceId",
             @"physicalResourceId" : @"PhysicalResourceId",
             @"physicalResourceIdContext" : @"PhysicalResourceIdContext",
             @"propertyDifferences" : @"PropertyDifferences",
             @"resourceType" : @"ResourceType",
             @"stackId" : @"StackId",
             @"stackResourceDriftStatus" : @"StackResourceDriftStatus",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)physicalResourceIdContextJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationPhysicalResourceIdContextKeyValuePair class]];
}

+ (NSValueTransformer *)propertyDifferencesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationPropertyDifference class]];
}

+ (NSValueTransformer *)stackResourceDriftStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_SYNC"] == NSOrderedSame) {
            return @(AWSCloudformationStackResourceDriftStatusInSync);
        }
        if ([value caseInsensitiveCompare:@"MODIFIED"] == NSOrderedSame) {
            return @(AWSCloudformationStackResourceDriftStatusModified);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSCloudformationStackResourceDriftStatusDeleted);
        }
        if ([value caseInsensitiveCompare:@"NOT_CHECKED"] == NSOrderedSame) {
            return @(AWSCloudformationStackResourceDriftStatusNotChecked);
        }
        return @(AWSCloudformationStackResourceDriftStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationStackResourceDriftStatusInSync:
                return @"IN_SYNC";
            case AWSCloudformationStackResourceDriftStatusModified:
                return @"MODIFIED";
            case AWSCloudformationStackResourceDriftStatusDeleted:
                return @"DELETED";
            case AWSCloudformationStackResourceDriftStatusNotChecked:
                return @"NOT_CHECKED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSCloudformationStackResourceDriftInformation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastCheckTimestamp" : @"LastCheckTimestamp",
             @"stackResourceDriftStatus" : @"StackResourceDriftStatus",
             };
}

+ (NSValueTransformer *)lastCheckTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)stackResourceDriftStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_SYNC"] == NSOrderedSame) {
            return @(AWSCloudformationStackResourceDriftStatusInSync);
        }
        if ([value caseInsensitiveCompare:@"MODIFIED"] == NSOrderedSame) {
            return @(AWSCloudformationStackResourceDriftStatusModified);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSCloudformationStackResourceDriftStatusDeleted);
        }
        if ([value caseInsensitiveCompare:@"NOT_CHECKED"] == NSOrderedSame) {
            return @(AWSCloudformationStackResourceDriftStatusNotChecked);
        }
        return @(AWSCloudformationStackResourceDriftStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationStackResourceDriftStatusInSync:
                return @"IN_SYNC";
            case AWSCloudformationStackResourceDriftStatusModified:
                return @"MODIFIED";
            case AWSCloudformationStackResourceDriftStatusDeleted:
                return @"DELETED";
            case AWSCloudformationStackResourceDriftStatusNotChecked:
                return @"NOT_CHECKED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationStackResourceDriftInformationSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastCheckTimestamp" : @"LastCheckTimestamp",
             @"stackResourceDriftStatus" : @"StackResourceDriftStatus",
             };
}

+ (NSValueTransformer *)lastCheckTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)stackResourceDriftStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_SYNC"] == NSOrderedSame) {
            return @(AWSCloudformationStackResourceDriftStatusInSync);
        }
        if ([value caseInsensitiveCompare:@"MODIFIED"] == NSOrderedSame) {
            return @(AWSCloudformationStackResourceDriftStatusModified);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSCloudformationStackResourceDriftStatusDeleted);
        }
        if ([value caseInsensitiveCompare:@"NOT_CHECKED"] == NSOrderedSame) {
            return @(AWSCloudformationStackResourceDriftStatusNotChecked);
        }
        return @(AWSCloudformationStackResourceDriftStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationStackResourceDriftStatusInSync:
                return @"IN_SYNC";
            case AWSCloudformationStackResourceDriftStatusModified:
                return @"MODIFIED";
            case AWSCloudformationStackResourceDriftStatusDeleted:
                return @"DELETED";
            case AWSCloudformationStackResourceDriftStatusNotChecked:
                return @"NOT_CHECKED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationStackResourceSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"driftInformation" : @"DriftInformation",
             @"lastUpdatedTimestamp" : @"LastUpdatedTimestamp",
             @"logicalResourceId" : @"LogicalResourceId",
             @"physicalResourceId" : @"PhysicalResourceId",
             @"resourceStatus" : @"ResourceStatus",
             @"resourceStatusReason" : @"ResourceStatusReason",
             @"resourceType" : @"ResourceType",
             };
}

+ (NSValueTransformer *)driftInformationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationStackResourceDriftInformationSummary class]];
}

+ (NSValueTransformer *)lastUpdatedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)resourceStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusCreateInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"CREATE_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusCreateComplete);
        }
        if ([value caseInsensitiveCompare:@"DELETE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusDeleteInProgress);
        }
        if ([value caseInsensitiveCompare:@"DELETE_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusDeleteFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETE_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusDeleteComplete);
        }
        if ([value caseInsensitiveCompare:@"DELETE_SKIPPED"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusDeleteSkipped);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusUpdateInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusUpdateFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusUpdateComplete);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusImportFailed);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusImportComplete);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusImportInProgress);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ROLLBACK_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusImportRollbackInProgress);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ROLLBACK_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusImportRollbackFailed);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ROLLBACK_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationResourceStatusImportRollbackComplete);
        }
        return @(AWSCloudformationResourceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationResourceStatusCreateInProgress:
                return @"CREATE_IN_PROGRESS";
            case AWSCloudformationResourceStatusCreateFailed:
                return @"CREATE_FAILED";
            case AWSCloudformationResourceStatusCreateComplete:
                return @"CREATE_COMPLETE";
            case AWSCloudformationResourceStatusDeleteInProgress:
                return @"DELETE_IN_PROGRESS";
            case AWSCloudformationResourceStatusDeleteFailed:
                return @"DELETE_FAILED";
            case AWSCloudformationResourceStatusDeleteComplete:
                return @"DELETE_COMPLETE";
            case AWSCloudformationResourceStatusDeleteSkipped:
                return @"DELETE_SKIPPED";
            case AWSCloudformationResourceStatusUpdateInProgress:
                return @"UPDATE_IN_PROGRESS";
            case AWSCloudformationResourceStatusUpdateFailed:
                return @"UPDATE_FAILED";
            case AWSCloudformationResourceStatusUpdateComplete:
                return @"UPDATE_COMPLETE";
            case AWSCloudformationResourceStatusImportFailed:
                return @"IMPORT_FAILED";
            case AWSCloudformationResourceStatusImportComplete:
                return @"IMPORT_COMPLETE";
            case AWSCloudformationResourceStatusImportInProgress:
                return @"IMPORT_IN_PROGRESS";
            case AWSCloudformationResourceStatusImportRollbackInProgress:
                return @"IMPORT_ROLLBACK_IN_PROGRESS";
            case AWSCloudformationResourceStatusImportRollbackFailed:
                return @"IMPORT_ROLLBACK_FAILED";
            case AWSCloudformationResourceStatusImportRollbackComplete:
                return @"IMPORT_ROLLBACK_COMPLETE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationStackSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"administrationRoleARN" : @"AdministrationRoleARN",
             @"autoDeployment" : @"AutoDeployment",
             @"capabilities" : @"Capabilities",
             @"detail" : @"Description",
             @"executionRoleName" : @"ExecutionRoleName",
             @"organizationalUnitIds" : @"OrganizationalUnitIds",
             @"parameters" : @"Parameters",
             @"permissionModel" : @"PermissionModel",
             @"stackSetARN" : @"StackSetARN",
             @"stackSetDriftDetectionDetails" : @"StackSetDriftDetectionDetails",
             @"stackSetId" : @"StackSetId",
             @"stackSetName" : @"StackSetName",
             @"status" : @"Status",
             @"tags" : @"Tags",
             @"templateBody" : @"TemplateBody",
             };
}

+ (NSValueTransformer *)autoDeploymentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationAutoDeployment class]];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationParameter class]];
}

+ (NSValueTransformer *)permissionModelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVICE_MANAGED"] == NSOrderedSame) {
            return @(AWSCloudformationPermissionModelsServiceManaged);
        }
        if ([value caseInsensitiveCompare:@"SELF_MANAGED"] == NSOrderedSame) {
            return @(AWSCloudformationPermissionModelsSelfManaged);
        }
        return @(AWSCloudformationPermissionModelsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationPermissionModelsServiceManaged:
                return @"SERVICE_MANAGED";
            case AWSCloudformationPermissionModelsSelfManaged:
                return @"SELF_MANAGED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stackSetDriftDetectionDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationStackSetDriftDetectionDetails class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetStatusDeleted);
        }
        return @(AWSCloudformationStackSetStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationStackSetStatusActive:
                return @"ACTIVE";
            case AWSCloudformationStackSetStatusDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationTag class]];
}

@end

@implementation AWSCloudformationStackSetDriftDetectionDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"driftDetectionStatus" : @"DriftDetectionStatus",
             @"driftStatus" : @"DriftStatus",
             @"driftedStackInstancesCount" : @"DriftedStackInstancesCount",
             @"failedStackInstancesCount" : @"FailedStackInstancesCount",
             @"inProgressStackInstancesCount" : @"InProgressStackInstancesCount",
             @"inSyncStackInstancesCount" : @"InSyncStackInstancesCount",
             @"lastDriftCheckTimestamp" : @"LastDriftCheckTimestamp",
             @"totalStackInstancesCount" : @"TotalStackInstancesCount",
             };
}

+ (NSValueTransformer *)driftDetectionStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetDriftDetectionStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetDriftDetectionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"PARTIAL_SUCCESS"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetDriftDetectionStatusPartialSuccess);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetDriftDetectionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetDriftDetectionStatusStopped);
        }
        return @(AWSCloudformationStackSetDriftDetectionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationStackSetDriftDetectionStatusCompleted:
                return @"COMPLETED";
            case AWSCloudformationStackSetDriftDetectionStatusFailed:
                return @"FAILED";
            case AWSCloudformationStackSetDriftDetectionStatusPartialSuccess:
                return @"PARTIAL_SUCCESS";
            case AWSCloudformationStackSetDriftDetectionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSCloudformationStackSetDriftDetectionStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)driftStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DRIFTED"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetDriftStatusDrifted);
        }
        if ([value caseInsensitiveCompare:@"IN_SYNC"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetDriftStatusInSync);
        }
        if ([value caseInsensitiveCompare:@"NOT_CHECKED"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetDriftStatusNotChecked);
        }
        return @(AWSCloudformationStackSetDriftStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationStackSetDriftStatusDrifted:
                return @"DRIFTED";
            case AWSCloudformationStackSetDriftStatusInSync:
                return @"IN_SYNC";
            case AWSCloudformationStackSetDriftStatusNotChecked:
                return @"NOT_CHECKED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastDriftCheckTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSCloudformationStackSetOperation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"administrationRoleARN" : @"AdministrationRoleARN",
             @"creationTimestamp" : @"CreationTimestamp",
             @"deploymentTargets" : @"DeploymentTargets",
             @"endTimestamp" : @"EndTimestamp",
             @"executionRoleName" : @"ExecutionRoleName",
             @"operationId" : @"OperationId",
             @"operationPreferences" : @"OperationPreferences",
             @"retainStacks" : @"RetainStacks",
             @"stackSetDriftDetectionDetails" : @"StackSetDriftDetectionDetails",
             @"stackSetId" : @"StackSetId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationActionCreate);
        }
        if ([value caseInsensitiveCompare:@"UPDATE"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationActionUpdate);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationActionDelete);
        }
        if ([value caseInsensitiveCompare:@"DETECT_DRIFT"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationActionDetectDrift);
        }
        return @(AWSCloudformationStackSetOperationActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationStackSetOperationActionCreate:
                return @"CREATE";
            case AWSCloudformationStackSetOperationActionUpdate:
                return @"UPDATE";
            case AWSCloudformationStackSetOperationActionDelete:
                return @"DELETE";
            case AWSCloudformationStackSetOperationActionDetectDrift:
                return @"DETECT_DRIFT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)creationTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)deploymentTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationDeploymentTargets class]];
}

+ (NSValueTransformer *)endTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)operationPreferencesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationStackSetOperationPreferences class]];
}

+ (NSValueTransformer *)stackSetDriftDetectionDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationStackSetDriftDetectionDetails class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"QUEUED"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationStatusQueued);
        }
        return @(AWSCloudformationStackSetOperationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationStackSetOperationStatusRunning:
                return @"RUNNING";
            case AWSCloudformationStackSetOperationStatusSucceeded:
                return @"SUCCEEDED";
            case AWSCloudformationStackSetOperationStatusFailed:
                return @"FAILED";
            case AWSCloudformationStackSetOperationStatusStopping:
                return @"STOPPING";
            case AWSCloudformationStackSetOperationStatusStopped:
                return @"STOPPED";
            case AWSCloudformationStackSetOperationStatusQueued:
                return @"QUEUED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationStackSetOperationPreferences

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failureToleranceCount" : @"FailureToleranceCount",
             @"failureTolerancePercentage" : @"FailureTolerancePercentage",
             @"maxConcurrentCount" : @"MaxConcurrentCount",
             @"maxConcurrentPercentage" : @"MaxConcurrentPercentage",
             @"regionOrder" : @"RegionOrder",
             };
}

@end

@implementation AWSCloudformationStackSetOperationResultSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"account" : @"Account",
             @"accountGateResult" : @"AccountGateResult",
             @"organizationalUnitId" : @"OrganizationalUnitId",
             @"region" : @"Region",
             @"status" : @"Status",
             @"statusReason" : @"StatusReason",
             };
}

+ (NSValueTransformer *)accountGateResultJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationAccountGateResult class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationResultStatusPending);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationResultStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationResultStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationResultStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationResultStatusCancelled);
        }
        return @(AWSCloudformationStackSetOperationResultStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationStackSetOperationResultStatusPending:
                return @"PENDING";
            case AWSCloudformationStackSetOperationResultStatusRunning:
                return @"RUNNING";
            case AWSCloudformationStackSetOperationResultStatusSucceeded:
                return @"SUCCEEDED";
            case AWSCloudformationStackSetOperationResultStatusFailed:
                return @"FAILED";
            case AWSCloudformationStackSetOperationResultStatusCancelled:
                return @"CANCELLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationStackSetOperationSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"creationTimestamp" : @"CreationTimestamp",
             @"endTimestamp" : @"EndTimestamp",
             @"operationId" : @"OperationId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationActionCreate);
        }
        if ([value caseInsensitiveCompare:@"UPDATE"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationActionUpdate);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationActionDelete);
        }
        if ([value caseInsensitiveCompare:@"DETECT_DRIFT"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationActionDetectDrift);
        }
        return @(AWSCloudformationStackSetOperationActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationStackSetOperationActionCreate:
                return @"CREATE";
            case AWSCloudformationStackSetOperationActionUpdate:
                return @"UPDATE";
            case AWSCloudformationStackSetOperationActionDelete:
                return @"DELETE";
            case AWSCloudformationStackSetOperationActionDetectDrift:
                return @"DETECT_DRIFT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)creationTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)endTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"QUEUED"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetOperationStatusQueued);
        }
        return @(AWSCloudformationStackSetOperationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationStackSetOperationStatusRunning:
                return @"RUNNING";
            case AWSCloudformationStackSetOperationStatusSucceeded:
                return @"SUCCEEDED";
            case AWSCloudformationStackSetOperationStatusFailed:
                return @"FAILED";
            case AWSCloudformationStackSetOperationStatusStopping:
                return @"STOPPING";
            case AWSCloudformationStackSetOperationStatusStopped:
                return @"STOPPED";
            case AWSCloudformationStackSetOperationStatusQueued:
                return @"QUEUED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationStackSetSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoDeployment" : @"AutoDeployment",
             @"detail" : @"Description",
             @"driftStatus" : @"DriftStatus",
             @"lastDriftCheckTimestamp" : @"LastDriftCheckTimestamp",
             @"permissionModel" : @"PermissionModel",
             @"stackSetId" : @"StackSetId",
             @"stackSetName" : @"StackSetName",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)autoDeploymentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationAutoDeployment class]];
}

+ (NSValueTransformer *)driftStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DRIFTED"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftStatusDrifted);
        }
        if ([value caseInsensitiveCompare:@"IN_SYNC"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftStatusInSync);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftStatusUnknown);
        }
        if ([value caseInsensitiveCompare:@"NOT_CHECKED"] == NSOrderedSame) {
            return @(AWSCloudformationStackDriftStatusNotChecked);
        }
        return @(AWSCloudformationStackDriftStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationStackDriftStatusDrifted:
                return @"DRIFTED";
            case AWSCloudformationStackDriftStatusInSync:
                return @"IN_SYNC";
            case AWSCloudformationStackDriftStatusUnknown:
                return @"UNKNOWN";
            case AWSCloudformationStackDriftStatusNotChecked:
                return @"NOT_CHECKED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastDriftCheckTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)permissionModelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVICE_MANAGED"] == NSOrderedSame) {
            return @(AWSCloudformationPermissionModelsServiceManaged);
        }
        if ([value caseInsensitiveCompare:@"SELF_MANAGED"] == NSOrderedSame) {
            return @(AWSCloudformationPermissionModelsSelfManaged);
        }
        return @(AWSCloudformationPermissionModelsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationPermissionModelsServiceManaged:
                return @"SERVICE_MANAGED";
            case AWSCloudformationPermissionModelsSelfManaged:
                return @"SELF_MANAGED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSCloudformationStackSetStatusDeleted);
        }
        return @(AWSCloudformationStackSetStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationStackSetStatusActive:
                return @"ACTIVE";
            case AWSCloudformationStackSetStatusDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationStackSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"deletionTime" : @"DeletionTime",
             @"driftInformation" : @"DriftInformation",
             @"lastUpdatedTime" : @"LastUpdatedTime",
             @"parentId" : @"ParentId",
             @"rootId" : @"RootId",
             @"stackId" : @"StackId",
             @"stackName" : @"StackName",
             @"stackStatus" : @"StackStatus",
             @"stackStatusReason" : @"StackStatusReason",
             @"templateDescription" : @"TemplateDescription",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)deletionTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)driftInformationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationStackDriftInformationSummary class]];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)stackStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusCreateInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"CREATE_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusCreateComplete);
        }
        if ([value caseInsensitiveCompare:@"ROLLBACK_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusRollbackInProgress);
        }
        if ([value caseInsensitiveCompare:@"ROLLBACK_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusRollbackFailed);
        }
        if ([value caseInsensitiveCompare:@"ROLLBACK_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusRollbackComplete);
        }
        if ([value caseInsensitiveCompare:@"DELETE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusDeleteInProgress);
        }
        if ([value caseInsensitiveCompare:@"DELETE_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusDeleteFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETE_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusDeleteComplete);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusUpdateInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_COMPLETE_CLEANUP_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusUpdateCompleteCleanupInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusUpdateComplete);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_ROLLBACK_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusUpdateRollbackInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_ROLLBACK_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusUpdateRollbackFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusUpdateRollbackCompleteCleanupInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_ROLLBACK_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusUpdateRollbackComplete);
        }
        if ([value caseInsensitiveCompare:@"REVIEW_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusReviewInProgress);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusImportInProgress);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusImportComplete);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ROLLBACK_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusImportRollbackInProgress);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ROLLBACK_FAILED"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusImportRollbackFailed);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ROLLBACK_COMPLETE"] == NSOrderedSame) {
            return @(AWSCloudformationStackStatusImportRollbackComplete);
        }
        return @(AWSCloudformationStackStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationStackStatusCreateInProgress:
                return @"CREATE_IN_PROGRESS";
            case AWSCloudformationStackStatusCreateFailed:
                return @"CREATE_FAILED";
            case AWSCloudformationStackStatusCreateComplete:
                return @"CREATE_COMPLETE";
            case AWSCloudformationStackStatusRollbackInProgress:
                return @"ROLLBACK_IN_PROGRESS";
            case AWSCloudformationStackStatusRollbackFailed:
                return @"ROLLBACK_FAILED";
            case AWSCloudformationStackStatusRollbackComplete:
                return @"ROLLBACK_COMPLETE";
            case AWSCloudformationStackStatusDeleteInProgress:
                return @"DELETE_IN_PROGRESS";
            case AWSCloudformationStackStatusDeleteFailed:
                return @"DELETE_FAILED";
            case AWSCloudformationStackStatusDeleteComplete:
                return @"DELETE_COMPLETE";
            case AWSCloudformationStackStatusUpdateInProgress:
                return @"UPDATE_IN_PROGRESS";
            case AWSCloudformationStackStatusUpdateCompleteCleanupInProgress:
                return @"UPDATE_COMPLETE_CLEANUP_IN_PROGRESS";
            case AWSCloudformationStackStatusUpdateComplete:
                return @"UPDATE_COMPLETE";
            case AWSCloudformationStackStatusUpdateRollbackInProgress:
                return @"UPDATE_ROLLBACK_IN_PROGRESS";
            case AWSCloudformationStackStatusUpdateRollbackFailed:
                return @"UPDATE_ROLLBACK_FAILED";
            case AWSCloudformationStackStatusUpdateRollbackCompleteCleanupInProgress:
                return @"UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS";
            case AWSCloudformationStackStatusUpdateRollbackComplete:
                return @"UPDATE_ROLLBACK_COMPLETE";
            case AWSCloudformationStackStatusReviewInProgress:
                return @"REVIEW_IN_PROGRESS";
            case AWSCloudformationStackStatusImportInProgress:
                return @"IMPORT_IN_PROGRESS";
            case AWSCloudformationStackStatusImportComplete:
                return @"IMPORT_COMPLETE";
            case AWSCloudformationStackStatusImportRollbackInProgress:
                return @"IMPORT_ROLLBACK_IN_PROGRESS";
            case AWSCloudformationStackStatusImportRollbackFailed:
                return @"IMPORT_ROLLBACK_FAILED";
            case AWSCloudformationStackStatusImportRollbackComplete:
                return @"IMPORT_ROLLBACK_COMPLETE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationStopStackSetOperationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             @"stackSetName" : @"StackSetName",
             };
}

@end

@implementation AWSCloudformationStopStackSetOperationOutput

@end

@implementation AWSCloudformationTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSCloudformationTemplateParameter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultValue" : @"DefaultValue",
             @"detail" : @"Description",
             @"noEcho" : @"NoEcho",
             @"parameterKey" : @"ParameterKey",
             };
}

@end

@implementation AWSCloudformationTypeSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultVersionId" : @"DefaultVersionId",
             @"detail" : @"Description",
             @"lastUpdated" : @"LastUpdated",
             @"types" : @"Type",
             @"typeArn" : @"TypeArn",
             @"typeName" : @"TypeName",
             };
}

+ (NSValueTransformer *)lastUpdatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RESOURCE"] == NSOrderedSame) {
            return @(AWSCloudformationRegistryTypeResource);
        }
        return @(AWSCloudformationRegistryTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationRegistryTypeResource:
                return @"RESOURCE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationTypeVersionSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"detail" : @"Description",
             @"isDefaultVersion" : @"IsDefaultVersion",
             @"timeCreated" : @"TimeCreated",
             @"types" : @"Type",
             @"typeName" : @"TypeName",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)timeCreatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RESOURCE"] == NSOrderedSame) {
            return @(AWSCloudformationRegistryTypeResource);
        }
        return @(AWSCloudformationRegistryTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationRegistryTypeResource:
                return @"RESOURCE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudformationUpdateStackInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capabilities" : @"Capabilities",
             @"clientRequestToken" : @"ClientRequestToken",
             @"notificationARNs" : @"NotificationARNs",
             @"parameters" : @"Parameters",
             @"resourceTypes" : @"ResourceTypes",
             @"roleARN" : @"RoleARN",
             @"rollbackConfiguration" : @"RollbackConfiguration",
             @"stackName" : @"StackName",
             @"stackPolicyBody" : @"StackPolicyBody",
             @"stackPolicyDuringUpdateBody" : @"StackPolicyDuringUpdateBody",
             @"stackPolicyDuringUpdateURL" : @"StackPolicyDuringUpdateURL",
             @"stackPolicyURL" : @"StackPolicyURL",
             @"tags" : @"Tags",
             @"templateBody" : @"TemplateBody",
             @"templateURL" : @"TemplateURL",
             @"usePreviousTemplate" : @"UsePreviousTemplate",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationParameter class]];
}

+ (NSValueTransformer *)rollbackConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationRollbackConfiguration class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationTag class]];
}

@end

@implementation AWSCloudformationUpdateStackInstancesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accounts" : @"Accounts",
             @"deploymentTargets" : @"DeploymentTargets",
             @"operationId" : @"OperationId",
             @"operationPreferences" : @"OperationPreferences",
             @"parameterOverrides" : @"ParameterOverrides",
             @"regions" : @"Regions",
             @"stackSetName" : @"StackSetName",
             };
}

+ (NSValueTransformer *)deploymentTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationDeploymentTargets class]];
}

+ (NSValueTransformer *)operationPreferencesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationStackSetOperationPreferences class]];
}

+ (NSValueTransformer *)parameterOverridesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationParameter class]];
}

@end

@implementation AWSCloudformationUpdateStackInstancesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSCloudformationUpdateStackOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stackId" : @"StackId",
             };
}

@end

@implementation AWSCloudformationUpdateStackSetInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accounts" : @"Accounts",
             @"administrationRoleARN" : @"AdministrationRoleARN",
             @"autoDeployment" : @"AutoDeployment",
             @"capabilities" : @"Capabilities",
             @"deploymentTargets" : @"DeploymentTargets",
             @"detail" : @"Description",
             @"executionRoleName" : @"ExecutionRoleName",
             @"operationId" : @"OperationId",
             @"operationPreferences" : @"OperationPreferences",
             @"parameters" : @"Parameters",
             @"permissionModel" : @"PermissionModel",
             @"regions" : @"Regions",
             @"stackSetName" : @"StackSetName",
             @"tags" : @"Tags",
             @"templateBody" : @"TemplateBody",
             @"templateURL" : @"TemplateURL",
             @"usePreviousTemplate" : @"UsePreviousTemplate",
             };
}

+ (NSValueTransformer *)autoDeploymentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationAutoDeployment class]];
}

+ (NSValueTransformer *)deploymentTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationDeploymentTargets class]];
}

+ (NSValueTransformer *)operationPreferencesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudformationStackSetOperationPreferences class]];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationParameter class]];
}

+ (NSValueTransformer *)permissionModelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVICE_MANAGED"] == NSOrderedSame) {
            return @(AWSCloudformationPermissionModelsServiceManaged);
        }
        if ([value caseInsensitiveCompare:@"SELF_MANAGED"] == NSOrderedSame) {
            return @(AWSCloudformationPermissionModelsSelfManaged);
        }
        return @(AWSCloudformationPermissionModelsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudformationPermissionModelsServiceManaged:
                return @"SERVICE_MANAGED";
            case AWSCloudformationPermissionModelsSelfManaged:
                return @"SELF_MANAGED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationTag class]];
}

@end

@implementation AWSCloudformationUpdateStackSetOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSCloudformationUpdateTerminationProtectionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enableTerminationProtection" : @"EnableTerminationProtection",
             @"stackName" : @"StackName",
             };
}

@end

@implementation AWSCloudformationUpdateTerminationProtectionOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stackId" : @"StackId",
             };
}

@end

@implementation AWSCloudformationValidateTemplateInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateBody" : @"TemplateBody",
             @"templateURL" : @"TemplateURL",
             };
}

@end

@implementation AWSCloudformationValidateTemplateOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capabilities" : @"Capabilities",
             @"capabilitiesReason" : @"CapabilitiesReason",
             @"declaredTransforms" : @"DeclaredTransforms",
             @"detail" : @"Description",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudformationTemplateParameter class]];
}

@end
