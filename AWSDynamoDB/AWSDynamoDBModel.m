//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSDynamoDBModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSDynamoDBErrorDomain = @"com.amazonaws.AWSDynamoDBErrorDomain";

@implementation AWSDynamoDBArchivalSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"archivalBackupArn" : @"ArchivalBackupArn",
             @"archivalDateTime" : @"ArchivalDateTime",
             @"archivalReason" : @"ArchivalReason",
             };
}

+ (NSValueTransformer *)archivalDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSDynamoDBAttributeDefinition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"attributeType" : @"AttributeType",
             };
}

+ (NSValueTransformer *)attributeTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S"] == NSOrderedSame) {
            return @(AWSDynamoDBScalarAttributeTypeS);
        }
        if ([value caseInsensitiveCompare:@"N"] == NSOrderedSame) {
            return @(AWSDynamoDBScalarAttributeTypeN);
        }
        if ([value caseInsensitiveCompare:@"B"] == NSOrderedSame) {
            return @(AWSDynamoDBScalarAttributeTypeB);
        }
        return @(AWSDynamoDBScalarAttributeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBScalarAttributeTypeS:
                return @"S";
            case AWSDynamoDBScalarAttributeTypeN:
                return @"N";
            case AWSDynamoDBScalarAttributeTypeB:
                return @"B";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBAttributeValue

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"B" : @"B",
             @"BOOLEAN" : @"BOOL",
             @"BS" : @"BS",
             @"L" : @"L",
             @"M" : @"M",
             @"N" : @"N",
             @"NS" : @"NS",
             @"NIL" : @"NULL",
             @"S" : @"S",
             @"SS" : @"SS",
             };
}

+ (NSValueTransformer *)LJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBAttributeValue class]];
}

+ (NSValueTransformer *)MJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSDynamoDBAttributeValueUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADD"] == NSOrderedSame) {
            return @(AWSDynamoDBAttributeActionAdd);
        }
        if ([value caseInsensitiveCompare:@"PUT"] == NSOrderedSame) {
            return @(AWSDynamoDBAttributeActionPut);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSDynamoDBAttributeActionDelete);
        }
        return @(AWSDynamoDBAttributeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBAttributeActionAdd:
                return @"ADD";
            case AWSDynamoDBAttributeActionPut:
                return @"PUT";
            case AWSDynamoDBAttributeActionDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)valueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBAttributeValue class]];
}

@end

@implementation AWSDynamoDBAutoScalingPolicyDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"PolicyName",
             @"targetTrackingScalingPolicyConfiguration" : @"TargetTrackingScalingPolicyConfiguration",
             };
}

+ (NSValueTransformer *)targetTrackingScalingPolicyConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBAutoScalingTargetTrackingScalingPolicyConfigurationDescription class]];
}

@end

@implementation AWSDynamoDBAutoScalingPolicyUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"PolicyName",
             @"targetTrackingScalingPolicyConfiguration" : @"TargetTrackingScalingPolicyConfiguration",
             };
}

+ (NSValueTransformer *)targetTrackingScalingPolicyConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBAutoScalingTargetTrackingScalingPolicyConfigurationUpdate class]];
}

@end

@implementation AWSDynamoDBAutoScalingSettingsDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingDisabled" : @"AutoScalingDisabled",
             @"autoScalingRoleArn" : @"AutoScalingRoleArn",
             @"maximumUnits" : @"MaximumUnits",
             @"minimumUnits" : @"MinimumUnits",
             @"scalingPolicies" : @"ScalingPolicies",
             };
}

+ (NSValueTransformer *)scalingPoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBAutoScalingPolicyDescription class]];
}

@end

@implementation AWSDynamoDBAutoScalingSettingsUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingDisabled" : @"AutoScalingDisabled",
             @"autoScalingRoleArn" : @"AutoScalingRoleArn",
             @"maximumUnits" : @"MaximumUnits",
             @"minimumUnits" : @"MinimumUnits",
             @"scalingPolicyUpdate" : @"ScalingPolicyUpdate",
             };
}

+ (NSValueTransformer *)scalingPolicyUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBAutoScalingPolicyUpdate class]];
}

@end

@implementation AWSDynamoDBAutoScalingTargetTrackingScalingPolicyConfigurationDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"disableScaleIn" : @"DisableScaleIn",
             @"scaleInCooldown" : @"ScaleInCooldown",
             @"scaleOutCooldown" : @"ScaleOutCooldown",
             @"targetValue" : @"TargetValue",
             };
}

@end

@implementation AWSDynamoDBAutoScalingTargetTrackingScalingPolicyConfigurationUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"disableScaleIn" : @"DisableScaleIn",
             @"scaleInCooldown" : @"ScaleInCooldown",
             @"scaleOutCooldown" : @"ScaleOutCooldown",
             @"targetValue" : @"TargetValue",
             };
}

@end

@implementation AWSDynamoDBBackupDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupDetails" : @"BackupDetails",
             @"sourceTableDetails" : @"SourceTableDetails",
             @"sourceTableFeatureDetails" : @"SourceTableFeatureDetails",
             };
}

+ (NSValueTransformer *)backupDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBBackupDetails class]];
}

+ (NSValueTransformer *)sourceTableDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBSourceTableDetails class]];
}

+ (NSValueTransformer *)sourceTableFeatureDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBSourceTableFeatureDetails class]];
}

@end

@implementation AWSDynamoDBBackupDetails

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupArn" : @"BackupArn",
             @"backupCreationDateTime" : @"BackupCreationDateTime",
             @"backupExpiryDateTime" : @"BackupExpiryDateTime",
             @"backupName" : @"BackupName",
             @"backupSizeBytes" : @"BackupSizeBytes",
             @"backupStatus" : @"BackupStatus",
             @"backupType" : @"BackupType",
             };
}

+ (NSValueTransformer *)backupCreationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)backupExpiryDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)backupStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSDynamoDBBackupStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSDynamoDBBackupStatusDeleted);
        }
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSDynamoDBBackupStatusAvailable);
        }
        return @(AWSDynamoDBBackupStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBBackupStatusCreating:
                return @"CREATING";
            case AWSDynamoDBBackupStatusDeleted:
                return @"DELETED";
            case AWSDynamoDBBackupStatusAvailable:
                return @"AVAILABLE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)backupTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USER"] == NSOrderedSame) {
            return @(AWSDynamoDBBackupTypeUser);
        }
        if ([value caseInsensitiveCompare:@"SYSTEM"] == NSOrderedSame) {
            return @(AWSDynamoDBBackupTypeSystem);
        }
        if ([value caseInsensitiveCompare:@"AWS_BACKUP"] == NSOrderedSame) {
            return @(AWSDynamoDBBackupTypeAwsBackup);
        }
        return @(AWSDynamoDBBackupTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBBackupTypeUser:
                return @"USER";
            case AWSDynamoDBBackupTypeSystem:
                return @"SYSTEM";
            case AWSDynamoDBBackupTypeAwsBackup:
                return @"AWS_BACKUP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBBackupSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupArn" : @"BackupArn",
             @"backupCreationDateTime" : @"BackupCreationDateTime",
             @"backupExpiryDateTime" : @"BackupExpiryDateTime",
             @"backupName" : @"BackupName",
             @"backupSizeBytes" : @"BackupSizeBytes",
             @"backupStatus" : @"BackupStatus",
             @"backupType" : @"BackupType",
             @"tableArn" : @"TableArn",
             @"tableId" : @"TableId",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)backupCreationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)backupExpiryDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)backupStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSDynamoDBBackupStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSDynamoDBBackupStatusDeleted);
        }
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSDynamoDBBackupStatusAvailable);
        }
        return @(AWSDynamoDBBackupStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBBackupStatusCreating:
                return @"CREATING";
            case AWSDynamoDBBackupStatusDeleted:
                return @"DELETED";
            case AWSDynamoDBBackupStatusAvailable:
                return @"AVAILABLE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)backupTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USER"] == NSOrderedSame) {
            return @(AWSDynamoDBBackupTypeUser);
        }
        if ([value caseInsensitiveCompare:@"SYSTEM"] == NSOrderedSame) {
            return @(AWSDynamoDBBackupTypeSystem);
        }
        if ([value caseInsensitiveCompare:@"AWS_BACKUP"] == NSOrderedSame) {
            return @(AWSDynamoDBBackupTypeAwsBackup);
        }
        return @(AWSDynamoDBBackupTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBBackupTypeUser:
                return @"USER";
            case AWSDynamoDBBackupTypeSystem:
                return @"SYSTEM";
            case AWSDynamoDBBackupTypeAwsBackup:
                return @"AWS_BACKUP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBBatchExecuteStatementInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"returnConsumedCapacity" : @"ReturnConsumedCapacity",
             @"statements" : @"Statements",
             };
}

+ (NSValueTransformer *)returnConsumedCapacityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INDEXES"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityIndexes);
        }
        if ([value caseInsensitiveCompare:@"TOTAL"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityTotal);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityNone);
        }
        return @(AWSDynamoDBReturnConsumedCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnConsumedCapacityIndexes:
                return @"INDEXES";
            case AWSDynamoDBReturnConsumedCapacityTotal:
                return @"TOTAL";
            case AWSDynamoDBReturnConsumedCapacityNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statementsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBBatchStatementRequest class]];
}

@end

@implementation AWSDynamoDBBatchExecuteStatementOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"consumedCapacity" : @"ConsumedCapacity",
             @"responses" : @"Responses",
             };
}

+ (NSValueTransformer *)consumedCapacityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBConsumedCapacity class]];
}

+ (NSValueTransformer *)responsesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBBatchStatementResponse class]];
}

@end

@implementation AWSDynamoDBBatchGetItemInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requestItems" : @"RequestItems",
             @"returnConsumedCapacity" : @"ReturnConsumedCapacity",
             };
}

+ (NSValueTransformer *)requestItemsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBKeysAndAttributes class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)returnConsumedCapacityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INDEXES"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityIndexes);
        }
        if ([value caseInsensitiveCompare:@"TOTAL"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityTotal);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityNone);
        }
        return @(AWSDynamoDBReturnConsumedCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnConsumedCapacityIndexes:
                return @"INDEXES";
            case AWSDynamoDBReturnConsumedCapacityTotal:
                return @"TOTAL";
            case AWSDynamoDBReturnConsumedCapacityNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBBatchGetItemOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"consumedCapacity" : @"ConsumedCapacity",
             @"responses" : @"Responses",
             @"unprocessedKeys" : @"UnprocessedKeys",
             };
}

+ (NSValueTransformer *)consumedCapacityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBConsumedCapacity class]];
}

+ (NSValueTransformer *)responsesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONArrayDictionary:JSONDictionary arrayElementType:@"map" withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONArrayDictionaryFromMapMTLDictionary:mapMTLDictionary arrayElementType:@"map"];
    }];
}

+ (NSValueTransformer *)unprocessedKeysJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBKeysAndAttributes class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSDynamoDBBatchStatementError

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"item" : @"Item",
             @"message" : @"Message",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ConditionalCheckFailed"] == NSOrderedSame) {
            return @(AWSDynamoDBBatchStatementErrorCodeEnumConditionalCheckFailed);
        }
        if ([value caseInsensitiveCompare:@"ItemCollectionSizeLimitExceeded"] == NSOrderedSame) {
            return @(AWSDynamoDBBatchStatementErrorCodeEnumItemCollectionSizeLimitExceeded);
        }
        if ([value caseInsensitiveCompare:@"RequestLimitExceeded"] == NSOrderedSame) {
            return @(AWSDynamoDBBatchStatementErrorCodeEnumRequestLimitExceeded);
        }
        if ([value caseInsensitiveCompare:@"ValidationError"] == NSOrderedSame) {
            return @(AWSDynamoDBBatchStatementErrorCodeEnumValidationError);
        }
        if ([value caseInsensitiveCompare:@"ProvisionedThroughputExceeded"] == NSOrderedSame) {
            return @(AWSDynamoDBBatchStatementErrorCodeEnumProvisionedThroughputExceeded);
        }
        if ([value caseInsensitiveCompare:@"TransactionConflict"] == NSOrderedSame) {
            return @(AWSDynamoDBBatchStatementErrorCodeEnumTransactionConflict);
        }
        if ([value caseInsensitiveCompare:@"ThrottlingError"] == NSOrderedSame) {
            return @(AWSDynamoDBBatchStatementErrorCodeEnumThrottlingError);
        }
        if ([value caseInsensitiveCompare:@"InternalServerError"] == NSOrderedSame) {
            return @(AWSDynamoDBBatchStatementErrorCodeEnumInternalServerError);
        }
        if ([value caseInsensitiveCompare:@"ResourceNotFound"] == NSOrderedSame) {
            return @(AWSDynamoDBBatchStatementErrorCodeEnumResourceNotFound);
        }
        if ([value caseInsensitiveCompare:@"AccessDenied"] == NSOrderedSame) {
            return @(AWSDynamoDBBatchStatementErrorCodeEnumAccessDenied);
        }
        if ([value caseInsensitiveCompare:@"DuplicateItem"] == NSOrderedSame) {
            return @(AWSDynamoDBBatchStatementErrorCodeEnumDuplicateItem);
        }
        return @(AWSDynamoDBBatchStatementErrorCodeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBBatchStatementErrorCodeEnumConditionalCheckFailed:
                return @"ConditionalCheckFailed";
            case AWSDynamoDBBatchStatementErrorCodeEnumItemCollectionSizeLimitExceeded:
                return @"ItemCollectionSizeLimitExceeded";
            case AWSDynamoDBBatchStatementErrorCodeEnumRequestLimitExceeded:
                return @"RequestLimitExceeded";
            case AWSDynamoDBBatchStatementErrorCodeEnumValidationError:
                return @"ValidationError";
            case AWSDynamoDBBatchStatementErrorCodeEnumProvisionedThroughputExceeded:
                return @"ProvisionedThroughputExceeded";
            case AWSDynamoDBBatchStatementErrorCodeEnumTransactionConflict:
                return @"TransactionConflict";
            case AWSDynamoDBBatchStatementErrorCodeEnumThrottlingError:
                return @"ThrottlingError";
            case AWSDynamoDBBatchStatementErrorCodeEnumInternalServerError:
                return @"InternalServerError";
            case AWSDynamoDBBatchStatementErrorCodeEnumResourceNotFound:
                return @"ResourceNotFound";
            case AWSDynamoDBBatchStatementErrorCodeEnumAccessDenied:
                return @"AccessDenied";
            case AWSDynamoDBBatchStatementErrorCodeEnumDuplicateItem:
                return @"DuplicateItem";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSDynamoDBBatchStatementRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"consistentRead" : @"ConsistentRead",
             @"parameters" : @"Parameters",
             @"returnValuesOnConditionCheckFailure" : @"ReturnValuesOnConditionCheckFailure",
             @"statement" : @"Statement",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBAttributeValue class]];
}

+ (NSValueTransformer *)returnValuesOnConditionCheckFailureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL_OLD"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValuesOnConditionCheckFailureAllOld);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValuesOnConditionCheckFailureNone);
        }
        return @(AWSDynamoDBReturnValuesOnConditionCheckFailureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnValuesOnConditionCheckFailureAllOld:
                return @"ALL_OLD";
            case AWSDynamoDBReturnValuesOnConditionCheckFailureNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBBatchStatementResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"error" : @"Error",
             @"item" : @"Item",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)errorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBBatchStatementError class]];
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSDynamoDBBatchWriteItemInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requestItems" : @"RequestItems",
             @"returnConsumedCapacity" : @"ReturnConsumedCapacity",
             @"returnItemCollectionMetrics" : @"ReturnItemCollectionMetrics",
             };
}

+ (NSValueTransformer *)requestItemsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONArrayDictionary:JSONDictionary arrayElementType:@"structure" withModelClass:[AWSDynamoDBWriteRequest class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONArrayDictionaryFromMapMTLDictionary:mapMTLDictionary arrayElementType:@"structure"];
    }];
}

+ (NSValueTransformer *)returnConsumedCapacityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INDEXES"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityIndexes);
        }
        if ([value caseInsensitiveCompare:@"TOTAL"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityTotal);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityNone);
        }
        return @(AWSDynamoDBReturnConsumedCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnConsumedCapacityIndexes:
                return @"INDEXES";
            case AWSDynamoDBReturnConsumedCapacityTotal:
                return @"TOTAL";
            case AWSDynamoDBReturnConsumedCapacityNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)returnItemCollectionMetricsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SIZE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnItemCollectionMetricsSize);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnItemCollectionMetricsNone);
        }
        return @(AWSDynamoDBReturnItemCollectionMetricsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnItemCollectionMetricsSize:
                return @"SIZE";
            case AWSDynamoDBReturnItemCollectionMetricsNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBBatchWriteItemOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"consumedCapacity" : @"ConsumedCapacity",
             @"itemCollectionMetrics" : @"ItemCollectionMetrics",
             @"unprocessedItems" : @"UnprocessedItems",
             };
}

+ (NSValueTransformer *)consumedCapacityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBConsumedCapacity class]];
}

+ (NSValueTransformer *)itemCollectionMetricsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONArrayDictionary:JSONDictionary arrayElementType:@"structure" withModelClass:[AWSDynamoDBItemCollectionMetrics class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONArrayDictionaryFromMapMTLDictionary:mapMTLDictionary arrayElementType:@"structure"];
    }];
}

+ (NSValueTransformer *)unprocessedItemsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONArrayDictionary:JSONDictionary arrayElementType:@"structure" withModelClass:[AWSDynamoDBWriteRequest class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONArrayDictionaryFromMapMTLDictionary:mapMTLDictionary arrayElementType:@"structure"];
    }];
}

@end

@implementation AWSDynamoDBBillingModeSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"billingMode" : @"BillingMode",
             @"lastUpdateToPayPerRequestDateTime" : @"LastUpdateToPayPerRequestDateTime",
             };
}

+ (NSValueTransformer *)billingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROVISIONED"] == NSOrderedSame) {
            return @(AWSDynamoDBBillingModeProvisioned);
        }
        if ([value caseInsensitiveCompare:@"PAY_PER_REQUEST"] == NSOrderedSame) {
            return @(AWSDynamoDBBillingModePayPerRequest);
        }
        return @(AWSDynamoDBBillingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBBillingModeProvisioned:
                return @"PROVISIONED";
            case AWSDynamoDBBillingModePayPerRequest:
                return @"PAY_PER_REQUEST";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastUpdateToPayPerRequestDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSDynamoDBCancellationReason

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"item" : @"Item",
             @"message" : @"Message",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSDynamoDBCapacity

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capacityUnits" : @"CapacityUnits",
             @"readCapacityUnits" : @"ReadCapacityUnits",
             @"writeCapacityUnits" : @"WriteCapacityUnits",
             };
}

@end

@implementation AWSDynamoDBCondition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeValueList" : @"AttributeValueList",
             @"comparisonOperator" : @"ComparisonOperator",
             };
}

+ (NSValueTransformer *)attributeValueListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBAttributeValue class]];
}

+ (NSValueTransformer *)comparisonOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EQ"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorEQ);
        }
        if ([value caseInsensitiveCompare:@"NE"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorNE);
        }
        if ([value caseInsensitiveCompare:@"IN"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorIN);
        }
        if ([value caseInsensitiveCompare:@"LE"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorLE);
        }
        if ([value caseInsensitiveCompare:@"LT"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorLT);
        }
        if ([value caseInsensitiveCompare:@"GE"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorGE);
        }
        if ([value caseInsensitiveCompare:@"GT"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorGT);
        }
        if ([value caseInsensitiveCompare:@"BETWEEN"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorBetween);
        }
        if ([value caseInsensitiveCompare:@"NOT_NULL"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorNotNull);
        }
        if ([value caseInsensitiveCompare:@"NULL"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorNull);
        }
        if ([value caseInsensitiveCompare:@"CONTAINS"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorContains);
        }
        if ([value caseInsensitiveCompare:@"NOT_CONTAINS"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorNotContains);
        }
        if ([value caseInsensitiveCompare:@"BEGINS_WITH"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorBeginsWith);
        }
        return @(AWSDynamoDBComparisonOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBComparisonOperatorEQ:
                return @"EQ";
            case AWSDynamoDBComparisonOperatorNE:
                return @"NE";
            case AWSDynamoDBComparisonOperatorIN:
                return @"IN";
            case AWSDynamoDBComparisonOperatorLE:
                return @"LE";
            case AWSDynamoDBComparisonOperatorLT:
                return @"LT";
            case AWSDynamoDBComparisonOperatorGE:
                return @"GE";
            case AWSDynamoDBComparisonOperatorGT:
                return @"GT";
            case AWSDynamoDBComparisonOperatorBetween:
                return @"BETWEEN";
            case AWSDynamoDBComparisonOperatorNotNull:
                return @"NOT_NULL";
            case AWSDynamoDBComparisonOperatorNull:
                return @"NULL";
            case AWSDynamoDBComparisonOperatorContains:
                return @"CONTAINS";
            case AWSDynamoDBComparisonOperatorNotContains:
                return @"NOT_CONTAINS";
            case AWSDynamoDBComparisonOperatorBeginsWith:
                return @"BEGINS_WITH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBConditionCheck

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conditionExpression" : @"ConditionExpression",
             @"expressionAttributeNames" : @"ExpressionAttributeNames",
             @"expressionAttributeValues" : @"ExpressionAttributeValues",
             @"key" : @"Key",
             @"returnValuesOnConditionCheckFailure" : @"ReturnValuesOnConditionCheckFailure",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)expressionAttributeValuesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)returnValuesOnConditionCheckFailureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL_OLD"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValuesOnConditionCheckFailureAllOld);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValuesOnConditionCheckFailureNone);
        }
        return @(AWSDynamoDBReturnValuesOnConditionCheckFailureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnValuesOnConditionCheckFailureAllOld:
                return @"ALL_OLD";
            case AWSDynamoDBReturnValuesOnConditionCheckFailureNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBConsumedCapacity

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capacityUnits" : @"CapacityUnits",
             @"globalSecondaryIndexes" : @"GlobalSecondaryIndexes",
             @"localSecondaryIndexes" : @"LocalSecondaryIndexes",
             @"readCapacityUnits" : @"ReadCapacityUnits",
             @"table" : @"Table",
             @"tableName" : @"TableName",
             @"writeCapacityUnits" : @"WriteCapacityUnits",
             };
}

+ (NSValueTransformer *)globalSecondaryIndexesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBCapacity class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)localSecondaryIndexesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBCapacity class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)tableJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBCapacity class]];
}

@end

@implementation AWSDynamoDBContinuousBackupsDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"continuousBackupsStatus" : @"ContinuousBackupsStatus",
             @"pointInTimeRecoveryDescription" : @"PointInTimeRecoveryDescription",
             };
}

+ (NSValueTransformer *)continuousBackupsStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBContinuousBackupsStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBContinuousBackupsStatusDisabled);
        }
        return @(AWSDynamoDBContinuousBackupsStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBContinuousBackupsStatusEnabled:
                return @"ENABLED";
            case AWSDynamoDBContinuousBackupsStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pointInTimeRecoveryDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBPointInTimeRecoveryDescription class]];
}

@end

@implementation AWSDynamoDBContributorInsightsSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contributorInsightsStatus" : @"ContributorInsightsStatus",
             @"indexName" : @"IndexName",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)contributorInsightsStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLING"] == NSOrderedSame) {
            return @(AWSDynamoDBContributorInsightsStatusEnabling);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBContributorInsightsStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLING"] == NSOrderedSame) {
            return @(AWSDynamoDBContributorInsightsStatusDisabling);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBContributorInsightsStatusDisabled);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSDynamoDBContributorInsightsStatusFailed);
        }
        return @(AWSDynamoDBContributorInsightsStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBContributorInsightsStatusEnabling:
                return @"ENABLING";
            case AWSDynamoDBContributorInsightsStatusEnabled:
                return @"ENABLED";
            case AWSDynamoDBContributorInsightsStatusDisabling:
                return @"DISABLING";
            case AWSDynamoDBContributorInsightsStatusDisabled:
                return @"DISABLED";
            case AWSDynamoDBContributorInsightsStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBCreateBackupInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupName" : @"BackupName",
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSDynamoDBCreateBackupOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupDetails" : @"BackupDetails",
             };
}

+ (NSValueTransformer *)backupDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBBackupDetails class]];
}

@end

@implementation AWSDynamoDBCreateGlobalSecondaryIndexAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             @"keySchema" : @"KeySchema",
             @"onDemandThroughput" : @"OnDemandThroughput",
             @"projection" : @"Projection",
             @"provisionedThroughput" : @"ProvisionedThroughput",
             };
}

+ (NSValueTransformer *)keySchemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBKeySchemaElement class]];
}

+ (NSValueTransformer *)onDemandThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBOnDemandThroughput class]];
}

+ (NSValueTransformer *)projectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProjection class]];
}

+ (NSValueTransformer *)provisionedThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughput class]];
}

@end

@implementation AWSDynamoDBCreateGlobalTableInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalTableName" : @"GlobalTableName",
             @"replicationGroup" : @"ReplicationGroup",
             };
}

+ (NSValueTransformer *)replicationGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplica class]];
}

@end

@implementation AWSDynamoDBCreateGlobalTableOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalTableDescription" : @"GlobalTableDescription",
             };
}

+ (NSValueTransformer *)globalTableDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBGlobalTableDescription class]];
}

@end

@implementation AWSDynamoDBCreateReplicaAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regionName" : @"RegionName",
             };
}

@end

@implementation AWSDynamoDBCreateReplicationGroupMemberAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalSecondaryIndexes" : @"GlobalSecondaryIndexes",
             @"KMSMasterKeyId" : @"KMSMasterKeyId",
             @"onDemandThroughputOverride" : @"OnDemandThroughputOverride",
             @"provisionedThroughputOverride" : @"ProvisionedThroughputOverride",
             @"regionName" : @"RegionName",
             @"tableClassOverride" : @"TableClassOverride",
             };
}

+ (NSValueTransformer *)globalSecondaryIndexesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplicaGlobalSecondaryIndex class]];
}

+ (NSValueTransformer *)onDemandThroughputOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBOnDemandThroughputOverride class]];
}

+ (NSValueTransformer *)provisionedThroughputOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughputOverride class]];
}

+ (NSValueTransformer *)tableClassOverrideJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSDynamoDBTableClassStandard);
        }
        if ([value caseInsensitiveCompare:@"STANDARD_INFREQUENT_ACCESS"] == NSOrderedSame) {
            return @(AWSDynamoDBTableClassStandardInfrequentAccess);
        }
        return @(AWSDynamoDBTableClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBTableClassStandard:
                return @"STANDARD";
            case AWSDynamoDBTableClassStandardInfrequentAccess:
                return @"STANDARD_INFREQUENT_ACCESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBCreateTableInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeDefinitions" : @"AttributeDefinitions",
             @"billingMode" : @"BillingMode",
             @"deletionProtectionEnabled" : @"DeletionProtectionEnabled",
             @"globalSecondaryIndexes" : @"GlobalSecondaryIndexes",
             @"keySchema" : @"KeySchema",
             @"localSecondaryIndexes" : @"LocalSecondaryIndexes",
             @"onDemandThroughput" : @"OnDemandThroughput",
             @"provisionedThroughput" : @"ProvisionedThroughput",
             @"resourcePolicy" : @"ResourcePolicy",
             @"SSESpecification" : @"SSESpecification",
             @"streamSpecification" : @"StreamSpecification",
             @"tableClass" : @"TableClass",
             @"tableName" : @"TableName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)attributeDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBAttributeDefinition class]];
}

+ (NSValueTransformer *)billingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROVISIONED"] == NSOrderedSame) {
            return @(AWSDynamoDBBillingModeProvisioned);
        }
        if ([value caseInsensitiveCompare:@"PAY_PER_REQUEST"] == NSOrderedSame) {
            return @(AWSDynamoDBBillingModePayPerRequest);
        }
        return @(AWSDynamoDBBillingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBBillingModeProvisioned:
                return @"PROVISIONED";
            case AWSDynamoDBBillingModePayPerRequest:
                return @"PAY_PER_REQUEST";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)globalSecondaryIndexesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBGlobalSecondaryIndex class]];
}

+ (NSValueTransformer *)keySchemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBKeySchemaElement class]];
}

+ (NSValueTransformer *)localSecondaryIndexesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBLocalSecondaryIndex class]];
}

+ (NSValueTransformer *)onDemandThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBOnDemandThroughput class]];
}

+ (NSValueTransformer *)provisionedThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughput class]];
}

+ (NSValueTransformer *)SSESpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBSSESpecification class]];
}

+ (NSValueTransformer *)streamSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBStreamSpecification class]];
}

+ (NSValueTransformer *)tableClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSDynamoDBTableClassStandard);
        }
        if ([value caseInsensitiveCompare:@"STANDARD_INFREQUENT_ACCESS"] == NSOrderedSame) {
            return @(AWSDynamoDBTableClassStandardInfrequentAccess);
        }
        return @(AWSDynamoDBTableClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBTableClassStandard:
                return @"STANDARD";
            case AWSDynamoDBTableClassStandardInfrequentAccess:
                return @"STANDARD_INFREQUENT_ACCESS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBTag class]];
}

@end

@implementation AWSDynamoDBCreateTableOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableDescription" : @"TableDescription",
             };
}

+ (NSValueTransformer *)tableDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTableDescription class]];
}

@end

@implementation AWSDynamoDBCsvOptions

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"delimiter" : @"Delimiter",
             @"headerList" : @"HeaderList",
             };
}

@end

@implementation AWSDynamoDBRemove

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conditionExpression" : @"ConditionExpression",
             @"expressionAttributeNames" : @"ExpressionAttributeNames",
             @"expressionAttributeValues" : @"ExpressionAttributeValues",
             @"key" : @"Key",
             @"returnValuesOnConditionCheckFailure" : @"ReturnValuesOnConditionCheckFailure",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)expressionAttributeValuesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)returnValuesOnConditionCheckFailureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL_OLD"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValuesOnConditionCheckFailureAllOld);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValuesOnConditionCheckFailureNone);
        }
        return @(AWSDynamoDBReturnValuesOnConditionCheckFailureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnValuesOnConditionCheckFailureAllOld:
                return @"ALL_OLD";
            case AWSDynamoDBReturnValuesOnConditionCheckFailureNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBDeleteBackupInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupArn" : @"BackupArn",
             };
}

@end

@implementation AWSDynamoDBDeleteBackupOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupDescription" : @"BackupDescription",
             };
}

+ (NSValueTransformer *)backupDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBBackupDescription class]];
}

@end

@implementation AWSDynamoDBDeleteGlobalSecondaryIndexAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             };
}

@end

@implementation AWSDynamoDBDeleteItemInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conditionExpression" : @"ConditionExpression",
             @"conditionalOperator" : @"ConditionalOperator",
             @"expected" : @"Expected",
             @"expressionAttributeNames" : @"ExpressionAttributeNames",
             @"expressionAttributeValues" : @"ExpressionAttributeValues",
             @"key" : @"Key",
             @"returnConsumedCapacity" : @"ReturnConsumedCapacity",
             @"returnItemCollectionMetrics" : @"ReturnItemCollectionMetrics",
             @"returnValues" : @"ReturnValues",
             @"returnValuesOnConditionCheckFailure" : @"ReturnValuesOnConditionCheckFailure",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)conditionalOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AND"] == NSOrderedSame) {
            return @(AWSDynamoDBConditionalOperatorAnd);
        }
        if ([value caseInsensitiveCompare:@"OR"] == NSOrderedSame) {
            return @(AWSDynamoDBConditionalOperatorOr);
        }
        return @(AWSDynamoDBConditionalOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBConditionalOperatorAnd:
                return @"AND";
            case AWSDynamoDBConditionalOperatorOr:
                return @"OR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)expectedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBExpectedAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)expressionAttributeValuesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)returnConsumedCapacityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INDEXES"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityIndexes);
        }
        if ([value caseInsensitiveCompare:@"TOTAL"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityTotal);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityNone);
        }
        return @(AWSDynamoDBReturnConsumedCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnConsumedCapacityIndexes:
                return @"INDEXES";
            case AWSDynamoDBReturnConsumedCapacityTotal:
                return @"TOTAL";
            case AWSDynamoDBReturnConsumedCapacityNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)returnItemCollectionMetricsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SIZE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnItemCollectionMetricsSize);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnItemCollectionMetricsNone);
        }
        return @(AWSDynamoDBReturnItemCollectionMetricsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnItemCollectionMetricsSize:
                return @"SIZE";
            case AWSDynamoDBReturnItemCollectionMetricsNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)returnValuesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueNone);
        }
        if ([value caseInsensitiveCompare:@"ALL_OLD"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueAllOld);
        }
        if ([value caseInsensitiveCompare:@"UPDATED_OLD"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueUpdatedOld);
        }
        if ([value caseInsensitiveCompare:@"ALL_NEW"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueAllNew);
        }
        if ([value caseInsensitiveCompare:@"UPDATED_NEW"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueUpdatedNew);
        }
        return @(AWSDynamoDBReturnValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnValueNone:
                return @"NONE";
            case AWSDynamoDBReturnValueAllOld:
                return @"ALL_OLD";
            case AWSDynamoDBReturnValueUpdatedOld:
                return @"UPDATED_OLD";
            case AWSDynamoDBReturnValueAllNew:
                return @"ALL_NEW";
            case AWSDynamoDBReturnValueUpdatedNew:
                return @"UPDATED_NEW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)returnValuesOnConditionCheckFailureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL_OLD"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValuesOnConditionCheckFailureAllOld);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValuesOnConditionCheckFailureNone);
        }
        return @(AWSDynamoDBReturnValuesOnConditionCheckFailureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnValuesOnConditionCheckFailureAllOld:
                return @"ALL_OLD";
            case AWSDynamoDBReturnValuesOnConditionCheckFailureNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBDeleteItemOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"consumedCapacity" : @"ConsumedCapacity",
             @"itemCollectionMetrics" : @"ItemCollectionMetrics",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)consumedCapacityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBConsumedCapacity class]];
}

+ (NSValueTransformer *)itemCollectionMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBItemCollectionMetrics class]];
}

@end

@implementation AWSDynamoDBDeleteReplicaAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regionName" : @"RegionName",
             };
}

@end

@implementation AWSDynamoDBDeleteReplicationGroupMemberAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regionName" : @"RegionName",
             };
}

@end

@implementation AWSDynamoDBDeleteRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSDynamoDBDeleteResourcePolicyInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expectedRevisionId" : @"ExpectedRevisionId",
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSDynamoDBDeleteResourcePolicyOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSDynamoDBDeleteTableInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSDynamoDBDeleteTableOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableDescription" : @"TableDescription",
             };
}

+ (NSValueTransformer *)tableDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTableDescription class]];
}

@end

@implementation AWSDynamoDBDescribeBackupInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupArn" : @"BackupArn",
             };
}

@end

@implementation AWSDynamoDBDescribeBackupOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupDescription" : @"BackupDescription",
             };
}

+ (NSValueTransformer *)backupDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBBackupDescription class]];
}

@end

@implementation AWSDynamoDBDescribeContinuousBackupsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSDynamoDBDescribeContinuousBackupsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"continuousBackupsDescription" : @"ContinuousBackupsDescription",
             };
}

+ (NSValueTransformer *)continuousBackupsDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBContinuousBackupsDescription class]];
}

@end

@implementation AWSDynamoDBDescribeContributorInsightsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSDynamoDBDescribeContributorInsightsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contributorInsightsRuleList" : @"ContributorInsightsRuleList",
             @"contributorInsightsStatus" : @"ContributorInsightsStatus",
             @"failureException" : @"FailureException",
             @"indexName" : @"IndexName",
             @"lastUpdateDateTime" : @"LastUpdateDateTime",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)contributorInsightsStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLING"] == NSOrderedSame) {
            return @(AWSDynamoDBContributorInsightsStatusEnabling);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBContributorInsightsStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLING"] == NSOrderedSame) {
            return @(AWSDynamoDBContributorInsightsStatusDisabling);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBContributorInsightsStatusDisabled);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSDynamoDBContributorInsightsStatusFailed);
        }
        return @(AWSDynamoDBContributorInsightsStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBContributorInsightsStatusEnabling:
                return @"ENABLING";
            case AWSDynamoDBContributorInsightsStatusEnabled:
                return @"ENABLED";
            case AWSDynamoDBContributorInsightsStatusDisabling:
                return @"DISABLING";
            case AWSDynamoDBContributorInsightsStatusDisabled:
                return @"DISABLED";
            case AWSDynamoDBContributorInsightsStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)failureExceptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBFailureException class]];
}

+ (NSValueTransformer *)lastUpdateDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSDynamoDBDescribeEndpointsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSDynamoDBDescribeEndpointsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoints" : @"Endpoints",
             };
}

+ (NSValueTransformer *)endpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBEndpoint class]];
}

@end

@implementation AWSDynamoDBDescribeExportInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportArn" : @"ExportArn",
             };
}

@end

@implementation AWSDynamoDBDescribeExportOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportDescription" : @"ExportDescription",
             };
}

+ (NSValueTransformer *)exportDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBExportDescription class]];
}

@end

@implementation AWSDynamoDBDescribeGlobalTableInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalTableName" : @"GlobalTableName",
             };
}

@end

@implementation AWSDynamoDBDescribeGlobalTableOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalTableDescription" : @"GlobalTableDescription",
             };
}

+ (NSValueTransformer *)globalTableDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBGlobalTableDescription class]];
}

@end

@implementation AWSDynamoDBDescribeGlobalTableSettingsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalTableName" : @"GlobalTableName",
             };
}

@end

@implementation AWSDynamoDBDescribeGlobalTableSettingsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalTableName" : @"GlobalTableName",
             @"replicaSettings" : @"ReplicaSettings",
             };
}

+ (NSValueTransformer *)replicaSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplicaSettingsDescription class]];
}

@end

@implementation AWSDynamoDBDescribeImportInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importArn" : @"ImportArn",
             };
}

@end

@implementation AWSDynamoDBDescribeImportOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importTableDescription" : @"ImportTableDescription",
             };
}

+ (NSValueTransformer *)importTableDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBImportTableDescription class]];
}

@end

@implementation AWSDynamoDBDescribeKinesisStreamingDestinationInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSDynamoDBDescribeKinesisStreamingDestinationOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kinesisDataStreamDestinations" : @"KinesisDataStreamDestinations",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)kinesisDataStreamDestinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBKinesisDataStreamDestination class]];
}

@end

@implementation AWSDynamoDBDescribeLimitsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSDynamoDBDescribeLimitsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountMaxReadCapacityUnits" : @"AccountMaxReadCapacityUnits",
             @"accountMaxWriteCapacityUnits" : @"AccountMaxWriteCapacityUnits",
             @"tableMaxReadCapacityUnits" : @"TableMaxReadCapacityUnits",
             @"tableMaxWriteCapacityUnits" : @"TableMaxWriteCapacityUnits",
             };
}

@end

@implementation AWSDynamoDBDescribeTableInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSDynamoDBDescribeTableOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"table" : @"Table",
             };
}

+ (NSValueTransformer *)tableJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTableDescription class]];
}

@end

@implementation AWSDynamoDBDescribeTableReplicaAutoScalingInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSDynamoDBDescribeTableReplicaAutoScalingOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableAutoScalingDescription" : @"TableAutoScalingDescription",
             };
}

+ (NSValueTransformer *)tableAutoScalingDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTableAutoScalingDescription class]];
}

@end

@implementation AWSDynamoDBDescribeTimeToLiveInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSDynamoDBDescribeTimeToLiveOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"timeToLiveDescription" : @"TimeToLiveDescription",
             };
}

+ (NSValueTransformer *)timeToLiveDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTimeToLiveDescription class]];
}

@end

@implementation AWSDynamoDBEnableKinesisStreamingConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approximateCreationDateTimePrecision" : @"ApproximateCreationDateTimePrecision",
             };
}

+ (NSValueTransformer *)approximateCreationDateTimePrecisionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MILLISECOND"] == NSOrderedSame) {
            return @(AWSDynamoDBApproximateCreationDateTimePrecisionMillisecond);
        }
        if ([value caseInsensitiveCompare:@"MICROSECOND"] == NSOrderedSame) {
            return @(AWSDynamoDBApproximateCreationDateTimePrecisionMicrosecond);
        }
        return @(AWSDynamoDBApproximateCreationDateTimePrecisionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBApproximateCreationDateTimePrecisionMillisecond:
                return @"MILLISECOND";
            case AWSDynamoDBApproximateCreationDateTimePrecisionMicrosecond:
                return @"MICROSECOND";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBEndpoint

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"cachePeriodInMinutes" : @"CachePeriodInMinutes",
             };
}

@end

@implementation AWSDynamoDBExecuteStatementInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"consistentRead" : @"ConsistentRead",
             @"limit" : @"Limit",
             @"nextToken" : @"NextToken",
             @"parameters" : @"Parameters",
             @"returnConsumedCapacity" : @"ReturnConsumedCapacity",
             @"returnValuesOnConditionCheckFailure" : @"ReturnValuesOnConditionCheckFailure",
             @"statement" : @"Statement",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBAttributeValue class]];
}

+ (NSValueTransformer *)returnConsumedCapacityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INDEXES"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityIndexes);
        }
        if ([value caseInsensitiveCompare:@"TOTAL"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityTotal);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityNone);
        }
        return @(AWSDynamoDBReturnConsumedCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnConsumedCapacityIndexes:
                return @"INDEXES";
            case AWSDynamoDBReturnConsumedCapacityTotal:
                return @"TOTAL";
            case AWSDynamoDBReturnConsumedCapacityNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)returnValuesOnConditionCheckFailureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL_OLD"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValuesOnConditionCheckFailureAllOld);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValuesOnConditionCheckFailureNone);
        }
        return @(AWSDynamoDBReturnValuesOnConditionCheckFailureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnValuesOnConditionCheckFailureAllOld:
                return @"ALL_OLD";
            case AWSDynamoDBReturnValuesOnConditionCheckFailureNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBExecuteStatementOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"consumedCapacity" : @"ConsumedCapacity",
             @"items" : @"Items",
             @"lastEvaluatedKey" : @"LastEvaluatedKey",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)consumedCapacityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBConsumedCapacity class]];
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

+ (NSValueTransformer *)lastEvaluatedKeyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSDynamoDBExecuteTransactionInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"returnConsumedCapacity" : @"ReturnConsumedCapacity",
             @"transactStatements" : @"TransactStatements",
             };
}

+ (NSValueTransformer *)returnConsumedCapacityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INDEXES"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityIndexes);
        }
        if ([value caseInsensitiveCompare:@"TOTAL"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityTotal);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityNone);
        }
        return @(AWSDynamoDBReturnConsumedCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnConsumedCapacityIndexes:
                return @"INDEXES";
            case AWSDynamoDBReturnConsumedCapacityTotal:
                return @"TOTAL";
            case AWSDynamoDBReturnConsumedCapacityNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)transactStatementsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBParameterizedStatement class]];
}

@end

@implementation AWSDynamoDBExecuteTransactionOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"consumedCapacity" : @"ConsumedCapacity",
             @"responses" : @"Responses",
             };
}

+ (NSValueTransformer *)consumedCapacityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBConsumedCapacity class]];
}

+ (NSValueTransformer *)responsesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBItemResponse class]];
}

@end

@implementation AWSDynamoDBExpectedAttributeValue

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeValueList" : @"AttributeValueList",
             @"comparisonOperator" : @"ComparisonOperator",
             @"exists" : @"Exists",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)attributeValueListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBAttributeValue class]];
}

+ (NSValueTransformer *)comparisonOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EQ"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorEQ);
        }
        if ([value caseInsensitiveCompare:@"NE"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorNE);
        }
        if ([value caseInsensitiveCompare:@"IN"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorIN);
        }
        if ([value caseInsensitiveCompare:@"LE"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorLE);
        }
        if ([value caseInsensitiveCompare:@"LT"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorLT);
        }
        if ([value caseInsensitiveCompare:@"GE"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorGE);
        }
        if ([value caseInsensitiveCompare:@"GT"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorGT);
        }
        if ([value caseInsensitiveCompare:@"BETWEEN"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorBetween);
        }
        if ([value caseInsensitiveCompare:@"NOT_NULL"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorNotNull);
        }
        if ([value caseInsensitiveCompare:@"NULL"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorNull);
        }
        if ([value caseInsensitiveCompare:@"CONTAINS"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorContains);
        }
        if ([value caseInsensitiveCompare:@"NOT_CONTAINS"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorNotContains);
        }
        if ([value caseInsensitiveCompare:@"BEGINS_WITH"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorBeginsWith);
        }
        return @(AWSDynamoDBComparisonOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBComparisonOperatorEQ:
                return @"EQ";
            case AWSDynamoDBComparisonOperatorNE:
                return @"NE";
            case AWSDynamoDBComparisonOperatorIN:
                return @"IN";
            case AWSDynamoDBComparisonOperatorLE:
                return @"LE";
            case AWSDynamoDBComparisonOperatorLT:
                return @"LT";
            case AWSDynamoDBComparisonOperatorGE:
                return @"GE";
            case AWSDynamoDBComparisonOperatorGT:
                return @"GT";
            case AWSDynamoDBComparisonOperatorBetween:
                return @"BETWEEN";
            case AWSDynamoDBComparisonOperatorNotNull:
                return @"NOT_NULL";
            case AWSDynamoDBComparisonOperatorNull:
                return @"NULL";
            case AWSDynamoDBComparisonOperatorContains:
                return @"CONTAINS";
            case AWSDynamoDBComparisonOperatorNotContains:
                return @"NOT_CONTAINS";
            case AWSDynamoDBComparisonOperatorBeginsWith:
                return @"BEGINS_WITH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)valueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBAttributeValue class]];
}

@end

@implementation AWSDynamoDBExportDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"billedSizeBytes" : @"BilledSizeBytes",
             @"clientToken" : @"ClientToken",
             @"endTime" : @"EndTime",
             @"exportArn" : @"ExportArn",
             @"exportFormat" : @"ExportFormat",
             @"exportManifest" : @"ExportManifest",
             @"exportStatus" : @"ExportStatus",
             @"exportTime" : @"ExportTime",
             @"exportType" : @"ExportType",
             @"failureCode" : @"FailureCode",
             @"failureMessage" : @"FailureMessage",
             @"incrementalExportSpecification" : @"IncrementalExportSpecification",
             @"itemCount" : @"ItemCount",
             @"s3Bucket" : @"S3Bucket",
             @"s3BucketOwner" : @"S3BucketOwner",
             @"s3Prefix" : @"S3Prefix",
             @"s3SseAlgorithm" : @"S3SseAlgorithm",
             @"s3SseKmsKeyId" : @"S3SseKmsKeyId",
             @"startTime" : @"StartTime",
             @"tableArn" : @"TableArn",
             @"tableId" : @"TableId",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)exportFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DYNAMODB_JSON"] == NSOrderedSame) {
            return @(AWSDynamoDBExportFormatDynamodbJson);
        }
        if ([value caseInsensitiveCompare:@"ION"] == NSOrderedSame) {
            return @(AWSDynamoDBExportFormatIon);
        }
        return @(AWSDynamoDBExportFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBExportFormatDynamodbJson:
                return @"DYNAMODB_JSON";
            case AWSDynamoDBExportFormatIon:
                return @"ION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)exportStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSDynamoDBExportStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSDynamoDBExportStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSDynamoDBExportStatusFailed);
        }
        return @(AWSDynamoDBExportStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBExportStatusInProgress:
                return @"IN_PROGRESS";
            case AWSDynamoDBExportStatusCompleted:
                return @"COMPLETED";
            case AWSDynamoDBExportStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)exportTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)exportTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FULL_EXPORT"] == NSOrderedSame) {
            return @(AWSDynamoDBExportTypeFullExport);
        }
        if ([value caseInsensitiveCompare:@"INCREMENTAL_EXPORT"] == NSOrderedSame) {
            return @(AWSDynamoDBExportTypeIncrementalExport);
        }
        return @(AWSDynamoDBExportTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBExportTypeFullExport:
                return @"FULL_EXPORT";
            case AWSDynamoDBExportTypeIncrementalExport:
                return @"INCREMENTAL_EXPORT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)incrementalExportSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBIncrementalExportSpecification class]];
}

+ (NSValueTransformer *)s3SseAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES256"] == NSOrderedSame) {
            return @(AWSDynamoDBS3SseAlgorithmAES256);
        }
        if ([value caseInsensitiveCompare:@"KMS"] == NSOrderedSame) {
            return @(AWSDynamoDBS3SseAlgorithmKms);
        }
        return @(AWSDynamoDBS3SseAlgorithmUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBS3SseAlgorithmAES256:
                return @"AES256";
            case AWSDynamoDBS3SseAlgorithmKms:
                return @"KMS";
            default:
                return nil;
        }
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

@implementation AWSDynamoDBExportSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportArn" : @"ExportArn",
             @"exportStatus" : @"ExportStatus",
             @"exportType" : @"ExportType",
             };
}

+ (NSValueTransformer *)exportStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSDynamoDBExportStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSDynamoDBExportStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSDynamoDBExportStatusFailed);
        }
        return @(AWSDynamoDBExportStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBExportStatusInProgress:
                return @"IN_PROGRESS";
            case AWSDynamoDBExportStatusCompleted:
                return @"COMPLETED";
            case AWSDynamoDBExportStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)exportTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FULL_EXPORT"] == NSOrderedSame) {
            return @(AWSDynamoDBExportTypeFullExport);
        }
        if ([value caseInsensitiveCompare:@"INCREMENTAL_EXPORT"] == NSOrderedSame) {
            return @(AWSDynamoDBExportTypeIncrementalExport);
        }
        return @(AWSDynamoDBExportTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBExportTypeFullExport:
                return @"FULL_EXPORT";
            case AWSDynamoDBExportTypeIncrementalExport:
                return @"INCREMENTAL_EXPORT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBExportTableToPointInTimeInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"exportFormat" : @"ExportFormat",
             @"exportTime" : @"ExportTime",
             @"exportType" : @"ExportType",
             @"incrementalExportSpecification" : @"IncrementalExportSpecification",
             @"s3Bucket" : @"S3Bucket",
             @"s3BucketOwner" : @"S3BucketOwner",
             @"s3Prefix" : @"S3Prefix",
             @"s3SseAlgorithm" : @"S3SseAlgorithm",
             @"s3SseKmsKeyId" : @"S3SseKmsKeyId",
             @"tableArn" : @"TableArn",
             };
}

+ (NSValueTransformer *)exportFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DYNAMODB_JSON"] == NSOrderedSame) {
            return @(AWSDynamoDBExportFormatDynamodbJson);
        }
        if ([value caseInsensitiveCompare:@"ION"] == NSOrderedSame) {
            return @(AWSDynamoDBExportFormatIon);
        }
        return @(AWSDynamoDBExportFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBExportFormatDynamodbJson:
                return @"DYNAMODB_JSON";
            case AWSDynamoDBExportFormatIon:
                return @"ION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)exportTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)exportTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FULL_EXPORT"] == NSOrderedSame) {
            return @(AWSDynamoDBExportTypeFullExport);
        }
        if ([value caseInsensitiveCompare:@"INCREMENTAL_EXPORT"] == NSOrderedSame) {
            return @(AWSDynamoDBExportTypeIncrementalExport);
        }
        return @(AWSDynamoDBExportTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBExportTypeFullExport:
                return @"FULL_EXPORT";
            case AWSDynamoDBExportTypeIncrementalExport:
                return @"INCREMENTAL_EXPORT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)incrementalExportSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBIncrementalExportSpecification class]];
}

+ (NSValueTransformer *)s3SseAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES256"] == NSOrderedSame) {
            return @(AWSDynamoDBS3SseAlgorithmAES256);
        }
        if ([value caseInsensitiveCompare:@"KMS"] == NSOrderedSame) {
            return @(AWSDynamoDBS3SseAlgorithmKms);
        }
        return @(AWSDynamoDBS3SseAlgorithmUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBS3SseAlgorithmAES256:
                return @"AES256";
            case AWSDynamoDBS3SseAlgorithmKms:
                return @"KMS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBExportTableToPointInTimeOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportDescription" : @"ExportDescription",
             };
}

+ (NSValueTransformer *)exportDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBExportDescription class]];
}

@end

@implementation AWSDynamoDBFailureException

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exceptionDescription" : @"ExceptionDescription",
             @"exceptionName" : @"ExceptionName",
             };
}

@end

@implementation AWSDynamoDBGet

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expressionAttributeNames" : @"ExpressionAttributeNames",
             @"key" : @"Key",
             @"projectionExpression" : @"ProjectionExpression",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSDynamoDBGetItemInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributesToGet" : @"AttributesToGet",
             @"consistentRead" : @"ConsistentRead",
             @"expressionAttributeNames" : @"ExpressionAttributeNames",
             @"key" : @"Key",
             @"projectionExpression" : @"ProjectionExpression",
             @"returnConsumedCapacity" : @"ReturnConsumedCapacity",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)returnConsumedCapacityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INDEXES"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityIndexes);
        }
        if ([value caseInsensitiveCompare:@"TOTAL"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityTotal);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityNone);
        }
        return @(AWSDynamoDBReturnConsumedCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnConsumedCapacityIndexes:
                return @"INDEXES";
            case AWSDynamoDBReturnConsumedCapacityTotal:
                return @"TOTAL";
            case AWSDynamoDBReturnConsumedCapacityNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBGetItemOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"consumedCapacity" : @"ConsumedCapacity",
             @"item" : @"Item",
             };
}

+ (NSValueTransformer *)consumedCapacityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBConsumedCapacity class]];
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSDynamoDBGetResourcePolicyInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSDynamoDBGetResourcePolicyOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSDynamoDBGlobalSecondaryIndex

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             @"keySchema" : @"KeySchema",
             @"onDemandThroughput" : @"OnDemandThroughput",
             @"projection" : @"Projection",
             @"provisionedThroughput" : @"ProvisionedThroughput",
             };
}

+ (NSValueTransformer *)keySchemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBKeySchemaElement class]];
}

+ (NSValueTransformer *)onDemandThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBOnDemandThroughput class]];
}

+ (NSValueTransformer *)projectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProjection class]];
}

+ (NSValueTransformer *)provisionedThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughput class]];
}

@end

@implementation AWSDynamoDBGlobalSecondaryIndexAutoScalingUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             @"provisionedWriteCapacityAutoScalingUpdate" : @"ProvisionedWriteCapacityAutoScalingUpdate",
             };
}

+ (NSValueTransformer *)provisionedWriteCapacityAutoScalingUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBAutoScalingSettingsUpdate class]];
}

@end

@implementation AWSDynamoDBGlobalSecondaryIndexDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backfilling" : @"Backfilling",
             @"indexArn" : @"IndexArn",
             @"indexName" : @"IndexName",
             @"indexSizeBytes" : @"IndexSizeBytes",
             @"indexStatus" : @"IndexStatus",
             @"itemCount" : @"ItemCount",
             @"keySchema" : @"KeySchema",
             @"onDemandThroughput" : @"OnDemandThroughput",
             @"projection" : @"Projection",
             @"provisionedThroughput" : @"ProvisionedThroughput",
             };
}

+ (NSValueTransformer *)indexStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSDynamoDBIndexStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSDynamoDBIndexStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSDynamoDBIndexStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSDynamoDBIndexStatusActive);
        }
        return @(AWSDynamoDBIndexStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBIndexStatusCreating:
                return @"CREATING";
            case AWSDynamoDBIndexStatusUpdating:
                return @"UPDATING";
            case AWSDynamoDBIndexStatusDeleting:
                return @"DELETING";
            case AWSDynamoDBIndexStatusActive:
                return @"ACTIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)keySchemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBKeySchemaElement class]];
}

+ (NSValueTransformer *)onDemandThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBOnDemandThroughput class]];
}

+ (NSValueTransformer *)projectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProjection class]];
}

+ (NSValueTransformer *)provisionedThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughputDescription class]];
}

@end

@implementation AWSDynamoDBGlobalSecondaryIndexInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             @"keySchema" : @"KeySchema",
             @"onDemandThroughput" : @"OnDemandThroughput",
             @"projection" : @"Projection",
             @"provisionedThroughput" : @"ProvisionedThroughput",
             };
}

+ (NSValueTransformer *)keySchemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBKeySchemaElement class]];
}

+ (NSValueTransformer *)onDemandThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBOnDemandThroughput class]];
}

+ (NSValueTransformer *)projectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProjection class]];
}

+ (NSValueTransformer *)provisionedThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughput class]];
}

@end

@implementation AWSDynamoDBGlobalSecondaryIndexUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"create" : @"Create",
             @"remove" : @"Delete",
             @"update" : @"Update",
             };
}

+ (NSValueTransformer *)createJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBCreateGlobalSecondaryIndexAction class]];
}

+ (NSValueTransformer *)removeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBDeleteGlobalSecondaryIndexAction class]];
}

+ (NSValueTransformer *)updateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBUpdateGlobalSecondaryIndexAction class]];
}

@end

@implementation AWSDynamoDBGlobalTable

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalTableName" : @"GlobalTableName",
             @"replicationGroup" : @"ReplicationGroup",
             };
}

+ (NSValueTransformer *)replicationGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplica class]];
}

@end

@implementation AWSDynamoDBGlobalTableDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"CreationDateTime",
             @"globalTableArn" : @"GlobalTableArn",
             @"globalTableName" : @"GlobalTableName",
             @"globalTableStatus" : @"GlobalTableStatus",
             @"replicationGroup" : @"ReplicationGroup",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)globalTableStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSDynamoDBGlobalTableStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSDynamoDBGlobalTableStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSDynamoDBGlobalTableStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSDynamoDBGlobalTableStatusUpdating);
        }
        return @(AWSDynamoDBGlobalTableStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBGlobalTableStatusCreating:
                return @"CREATING";
            case AWSDynamoDBGlobalTableStatusActive:
                return @"ACTIVE";
            case AWSDynamoDBGlobalTableStatusDeleting:
                return @"DELETING";
            case AWSDynamoDBGlobalTableStatusUpdating:
                return @"UPDATING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)replicationGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplicaDescription class]];
}

@end

@implementation AWSDynamoDBGlobalTableGlobalSecondaryIndexSettingsUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             @"provisionedWriteCapacityAutoScalingSettingsUpdate" : @"ProvisionedWriteCapacityAutoScalingSettingsUpdate",
             @"provisionedWriteCapacityUnits" : @"ProvisionedWriteCapacityUnits",
             };
}

+ (NSValueTransformer *)provisionedWriteCapacityAutoScalingSettingsUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBAutoScalingSettingsUpdate class]];
}

@end

@implementation AWSDynamoDBImportSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLogGroupArn" : @"CloudWatchLogGroupArn",
             @"endTime" : @"EndTime",
             @"importArn" : @"ImportArn",
             @"importStatus" : @"ImportStatus",
             @"inputFormat" : @"InputFormat",
             @"s3BucketSource" : @"S3BucketSource",
             @"startTime" : @"StartTime",
             @"tableArn" : @"TableArn",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)importStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSDynamoDBImportStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSDynamoDBImportStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"CANCELLING"] == NSOrderedSame) {
            return @(AWSDynamoDBImportStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSDynamoDBImportStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSDynamoDBImportStatusFailed);
        }
        return @(AWSDynamoDBImportStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBImportStatusInProgress:
                return @"IN_PROGRESS";
            case AWSDynamoDBImportStatusCompleted:
                return @"COMPLETED";
            case AWSDynamoDBImportStatusCancelling:
                return @"CANCELLING";
            case AWSDynamoDBImportStatusCancelled:
                return @"CANCELLED";
            case AWSDynamoDBImportStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DYNAMODB_JSON"] == NSOrderedSame) {
            return @(AWSDynamoDBInputFormatDynamodbJson);
        }
        if ([value caseInsensitiveCompare:@"ION"] == NSOrderedSame) {
            return @(AWSDynamoDBInputFormatIon);
        }
        if ([value caseInsensitiveCompare:@"CSV"] == NSOrderedSame) {
            return @(AWSDynamoDBInputFormatCsv);
        }
        return @(AWSDynamoDBInputFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBInputFormatDynamodbJson:
                return @"DYNAMODB_JSON";
            case AWSDynamoDBInputFormatIon:
                return @"ION";
            case AWSDynamoDBInputFormatCsv:
                return @"CSV";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3BucketSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBS3BucketSource class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSDynamoDBImportTableDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"cloudWatchLogGroupArn" : @"CloudWatchLogGroupArn",
             @"endTime" : @"EndTime",
             @"errorCount" : @"ErrorCount",
             @"failureCode" : @"FailureCode",
             @"failureMessage" : @"FailureMessage",
             @"importArn" : @"ImportArn",
             @"importStatus" : @"ImportStatus",
             @"importedItemCount" : @"ImportedItemCount",
             @"inputCompressionType" : @"InputCompressionType",
             @"inputFormat" : @"InputFormat",
             @"inputFormatOptions" : @"InputFormatOptions",
             @"processedItemCount" : @"ProcessedItemCount",
             @"processedSizeBytes" : @"ProcessedSizeBytes",
             @"s3BucketSource" : @"S3BucketSource",
             @"startTime" : @"StartTime",
             @"tableArn" : @"TableArn",
             @"tableCreationParameters" : @"TableCreationParameters",
             @"tableId" : @"TableId",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)importStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSDynamoDBImportStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSDynamoDBImportStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"CANCELLING"] == NSOrderedSame) {
            return @(AWSDynamoDBImportStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSDynamoDBImportStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSDynamoDBImportStatusFailed);
        }
        return @(AWSDynamoDBImportStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBImportStatusInProgress:
                return @"IN_PROGRESS";
            case AWSDynamoDBImportStatusCompleted:
                return @"COMPLETED";
            case AWSDynamoDBImportStatusCancelling:
                return @"CANCELLING";
            case AWSDynamoDBImportStatusCancelled:
                return @"CANCELLED";
            case AWSDynamoDBImportStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputCompressionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GZIP"] == NSOrderedSame) {
            return @(AWSDynamoDBInputCompressionTypeGzip);
        }
        if ([value caseInsensitiveCompare:@"ZSTD"] == NSOrderedSame) {
            return @(AWSDynamoDBInputCompressionTypeZstd);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBInputCompressionTypeNone);
        }
        return @(AWSDynamoDBInputCompressionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBInputCompressionTypeGzip:
                return @"GZIP";
            case AWSDynamoDBInputCompressionTypeZstd:
                return @"ZSTD";
            case AWSDynamoDBInputCompressionTypeNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DYNAMODB_JSON"] == NSOrderedSame) {
            return @(AWSDynamoDBInputFormatDynamodbJson);
        }
        if ([value caseInsensitiveCompare:@"ION"] == NSOrderedSame) {
            return @(AWSDynamoDBInputFormatIon);
        }
        if ([value caseInsensitiveCompare:@"CSV"] == NSOrderedSame) {
            return @(AWSDynamoDBInputFormatCsv);
        }
        return @(AWSDynamoDBInputFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBInputFormatDynamodbJson:
                return @"DYNAMODB_JSON";
            case AWSDynamoDBInputFormatIon:
                return @"ION";
            case AWSDynamoDBInputFormatCsv:
                return @"CSV";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputFormatOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBInputFormatOptions class]];
}

+ (NSValueTransformer *)s3BucketSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBS3BucketSource class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)tableCreationParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTableCreationParameters class]];
}

@end

@implementation AWSDynamoDBImportTableInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"inputCompressionType" : @"InputCompressionType",
             @"inputFormat" : @"InputFormat",
             @"inputFormatOptions" : @"InputFormatOptions",
             @"s3BucketSource" : @"S3BucketSource",
             @"tableCreationParameters" : @"TableCreationParameters",
             };
}

+ (NSValueTransformer *)inputCompressionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GZIP"] == NSOrderedSame) {
            return @(AWSDynamoDBInputCompressionTypeGzip);
        }
        if ([value caseInsensitiveCompare:@"ZSTD"] == NSOrderedSame) {
            return @(AWSDynamoDBInputCompressionTypeZstd);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBInputCompressionTypeNone);
        }
        return @(AWSDynamoDBInputCompressionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBInputCompressionTypeGzip:
                return @"GZIP";
            case AWSDynamoDBInputCompressionTypeZstd:
                return @"ZSTD";
            case AWSDynamoDBInputCompressionTypeNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DYNAMODB_JSON"] == NSOrderedSame) {
            return @(AWSDynamoDBInputFormatDynamodbJson);
        }
        if ([value caseInsensitiveCompare:@"ION"] == NSOrderedSame) {
            return @(AWSDynamoDBInputFormatIon);
        }
        if ([value caseInsensitiveCompare:@"CSV"] == NSOrderedSame) {
            return @(AWSDynamoDBInputFormatCsv);
        }
        return @(AWSDynamoDBInputFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBInputFormatDynamodbJson:
                return @"DYNAMODB_JSON";
            case AWSDynamoDBInputFormatIon:
                return @"ION";
            case AWSDynamoDBInputFormatCsv:
                return @"CSV";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputFormatOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBInputFormatOptions class]];
}

+ (NSValueTransformer *)s3BucketSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBS3BucketSource class]];
}

+ (NSValueTransformer *)tableCreationParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTableCreationParameters class]];
}

@end

@implementation AWSDynamoDBImportTableOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importTableDescription" : @"ImportTableDescription",
             };
}

+ (NSValueTransformer *)importTableDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBImportTableDescription class]];
}

@end

@implementation AWSDynamoDBIncrementalExportSpecification

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportFromTime" : @"ExportFromTime",
             @"exportToTime" : @"ExportToTime",
             @"exportViewType" : @"ExportViewType",
             };
}

+ (NSValueTransformer *)exportFromTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)exportToTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)exportViewTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NEW_IMAGE"] == NSOrderedSame) {
            return @(AWSDynamoDBExportViewTypeNewImage);
        }
        if ([value caseInsensitiveCompare:@"NEW_AND_OLD_IMAGES"] == NSOrderedSame) {
            return @(AWSDynamoDBExportViewTypeNewAndOldImages);
        }
        return @(AWSDynamoDBExportViewTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBExportViewTypeNewImage:
                return @"NEW_IMAGE";
            case AWSDynamoDBExportViewTypeNewAndOldImages:
                return @"NEW_AND_OLD_IMAGES";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBInputFormatOptions

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"csv" : @"Csv",
             };
}

+ (NSValueTransformer *)csvJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBCsvOptions class]];
}

@end

@implementation AWSDynamoDBItemCollectionMetrics

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"itemCollectionKey" : @"ItemCollectionKey",
             @"sizeEstimateRangeGB" : @"SizeEstimateRangeGB",
             };
}

+ (NSValueTransformer *)itemCollectionKeyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSDynamoDBItemResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSDynamoDBKeySchemaElement

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"keyType" : @"KeyType",
             };
}

+ (NSValueTransformer *)keyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HASH"] == NSOrderedSame) {
            return @(AWSDynamoDBKeyTypeHash);
        }
        if ([value caseInsensitiveCompare:@"RANGE"] == NSOrderedSame) {
            return @(AWSDynamoDBKeyTypeRange);
        }
        return @(AWSDynamoDBKeyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBKeyTypeHash:
                return @"HASH";
            case AWSDynamoDBKeyTypeRange:
                return @"RANGE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBKeysAndAttributes

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributesToGet" : @"AttributesToGet",
             @"consistentRead" : @"ConsistentRead",
             @"expressionAttributeNames" : @"ExpressionAttributeNames",
             @"keys" : @"Keys",
             @"projectionExpression" : @"ProjectionExpression",
             };
}

+ (NSValueTransformer *)keysJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

@end

@implementation AWSDynamoDBKinesisDataStreamDestination

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approximateCreationDateTimePrecision" : @"ApproximateCreationDateTimePrecision",
             @"destinationStatus" : @"DestinationStatus",
             @"destinationStatusDescription" : @"DestinationStatusDescription",
             @"streamArn" : @"StreamArn",
             };
}

+ (NSValueTransformer *)approximateCreationDateTimePrecisionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MILLISECOND"] == NSOrderedSame) {
            return @(AWSDynamoDBApproximateCreationDateTimePrecisionMillisecond);
        }
        if ([value caseInsensitiveCompare:@"MICROSECOND"] == NSOrderedSame) {
            return @(AWSDynamoDBApproximateCreationDateTimePrecisionMicrosecond);
        }
        return @(AWSDynamoDBApproximateCreationDateTimePrecisionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBApproximateCreationDateTimePrecisionMillisecond:
                return @"MILLISECOND";
            case AWSDynamoDBApproximateCreationDateTimePrecisionMicrosecond:
                return @"MICROSECOND";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLING"] == NSOrderedSame) {
            return @(AWSDynamoDBDestinationStatusEnabling);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSDynamoDBDestinationStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DISABLING"] == NSOrderedSame) {
            return @(AWSDynamoDBDestinationStatusDisabling);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBDestinationStatusDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLE_FAILED"] == NSOrderedSame) {
            return @(AWSDynamoDBDestinationStatusEnableFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSDynamoDBDestinationStatusUpdating);
        }
        return @(AWSDynamoDBDestinationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBDestinationStatusEnabling:
                return @"ENABLING";
            case AWSDynamoDBDestinationStatusActive:
                return @"ACTIVE";
            case AWSDynamoDBDestinationStatusDisabling:
                return @"DISABLING";
            case AWSDynamoDBDestinationStatusDisabled:
                return @"DISABLED";
            case AWSDynamoDBDestinationStatusEnableFailed:
                return @"ENABLE_FAILED";
            case AWSDynamoDBDestinationStatusUpdating:
                return @"UPDATING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBKinesisStreamingDestinationInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enableKinesisStreamingConfiguration" : @"EnableKinesisStreamingConfiguration",
             @"streamArn" : @"StreamArn",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)enableKinesisStreamingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBEnableKinesisStreamingConfiguration class]];
}

@end

@implementation AWSDynamoDBKinesisStreamingDestinationOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationStatus" : @"DestinationStatus",
             @"enableKinesisStreamingConfiguration" : @"EnableKinesisStreamingConfiguration",
             @"streamArn" : @"StreamArn",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)destinationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLING"] == NSOrderedSame) {
            return @(AWSDynamoDBDestinationStatusEnabling);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSDynamoDBDestinationStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DISABLING"] == NSOrderedSame) {
            return @(AWSDynamoDBDestinationStatusDisabling);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBDestinationStatusDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLE_FAILED"] == NSOrderedSame) {
            return @(AWSDynamoDBDestinationStatusEnableFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSDynamoDBDestinationStatusUpdating);
        }
        return @(AWSDynamoDBDestinationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBDestinationStatusEnabling:
                return @"ENABLING";
            case AWSDynamoDBDestinationStatusActive:
                return @"ACTIVE";
            case AWSDynamoDBDestinationStatusDisabling:
                return @"DISABLING";
            case AWSDynamoDBDestinationStatusDisabled:
                return @"DISABLED";
            case AWSDynamoDBDestinationStatusEnableFailed:
                return @"ENABLE_FAILED";
            case AWSDynamoDBDestinationStatusUpdating:
                return @"UPDATING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)enableKinesisStreamingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBEnableKinesisStreamingConfiguration class]];
}

@end

@implementation AWSDynamoDBListBackupsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupType" : @"BackupType",
             @"exclusiveStartBackupArn" : @"ExclusiveStartBackupArn",
             @"limit" : @"Limit",
             @"tableName" : @"TableName",
             @"timeRangeLowerBound" : @"TimeRangeLowerBound",
             @"timeRangeUpperBound" : @"TimeRangeUpperBound",
             };
}

+ (NSValueTransformer *)backupTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USER"] == NSOrderedSame) {
            return @(AWSDynamoDBBackupTypeFilterUser);
        }
        if ([value caseInsensitiveCompare:@"SYSTEM"] == NSOrderedSame) {
            return @(AWSDynamoDBBackupTypeFilterSystem);
        }
        if ([value caseInsensitiveCompare:@"AWS_BACKUP"] == NSOrderedSame) {
            return @(AWSDynamoDBBackupTypeFilterAwsBackup);
        }
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSDynamoDBBackupTypeFilterAll);
        }
        return @(AWSDynamoDBBackupTypeFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBBackupTypeFilterUser:
                return @"USER";
            case AWSDynamoDBBackupTypeFilterSystem:
                return @"SYSTEM";
            case AWSDynamoDBBackupTypeFilterAwsBackup:
                return @"AWS_BACKUP";
            case AWSDynamoDBBackupTypeFilterAll:
                return @"ALL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timeRangeLowerBoundJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)timeRangeUpperBoundJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSDynamoDBListBackupsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupSummaries" : @"BackupSummaries",
             @"lastEvaluatedBackupArn" : @"LastEvaluatedBackupArn",
             };
}

+ (NSValueTransformer *)backupSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBBackupSummary class]];
}

@end

@implementation AWSDynamoDBListContributorInsightsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSDynamoDBListContributorInsightsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contributorInsightsSummaries" : @"ContributorInsightsSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)contributorInsightsSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBContributorInsightsSummary class]];
}

@end

@implementation AWSDynamoDBListExportsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"tableArn" : @"TableArn",
             };
}

@end

@implementation AWSDynamoDBListExportsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportSummaries" : @"ExportSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)exportSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBExportSummary class]];
}

@end

@implementation AWSDynamoDBListGlobalTablesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exclusiveStartGlobalTableName" : @"ExclusiveStartGlobalTableName",
             @"limit" : @"Limit",
             @"regionName" : @"RegionName",
             };
}

@end

@implementation AWSDynamoDBListGlobalTablesOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalTables" : @"GlobalTables",
             @"lastEvaluatedGlobalTableName" : @"LastEvaluatedGlobalTableName",
             };
}

+ (NSValueTransformer *)globalTablesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBGlobalTable class]];
}

@end

@implementation AWSDynamoDBListImportsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"pageSize" : @"PageSize",
             @"tableArn" : @"TableArn",
             };
}

@end

@implementation AWSDynamoDBListImportsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importSummaryList" : @"ImportSummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)importSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBImportSummary class]];
}

@end

@implementation AWSDynamoDBListTablesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exclusiveStartTableName" : @"ExclusiveStartTableName",
             @"limit" : @"Limit",
             };
}

@end

@implementation AWSDynamoDBListTablesOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastEvaluatedTableName" : @"LastEvaluatedTableName",
             @"tableNames" : @"TableNames",
             };
}

@end

@implementation AWSDynamoDBListTagsOfResourceInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSDynamoDBListTagsOfResourceOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBTag class]];
}

@end

@implementation AWSDynamoDBLocalSecondaryIndex

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             @"keySchema" : @"KeySchema",
             @"projection" : @"Projection",
             };
}

+ (NSValueTransformer *)keySchemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBKeySchemaElement class]];
}

+ (NSValueTransformer *)projectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProjection class]];
}

@end

@implementation AWSDynamoDBLocalSecondaryIndexDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexArn" : @"IndexArn",
             @"indexName" : @"IndexName",
             @"indexSizeBytes" : @"IndexSizeBytes",
             @"itemCount" : @"ItemCount",
             @"keySchema" : @"KeySchema",
             @"projection" : @"Projection",
             };
}

+ (NSValueTransformer *)keySchemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBKeySchemaElement class]];
}

+ (NSValueTransformer *)projectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProjection class]];
}

@end

@implementation AWSDynamoDBLocalSecondaryIndexInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             @"keySchema" : @"KeySchema",
             @"projection" : @"Projection",
             };
}

+ (NSValueTransformer *)keySchemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBKeySchemaElement class]];
}

+ (NSValueTransformer *)projectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProjection class]];
}

@end

@implementation AWSDynamoDBOnDemandThroughput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxReadRequestUnits" : @"MaxReadRequestUnits",
             @"maxWriteRequestUnits" : @"MaxWriteRequestUnits",
             };
}

@end

@implementation AWSDynamoDBOnDemandThroughputOverride

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxReadRequestUnits" : @"MaxReadRequestUnits",
             };
}

@end

@implementation AWSDynamoDBParameterizedStatement

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameters" : @"Parameters",
             @"returnValuesOnConditionCheckFailure" : @"ReturnValuesOnConditionCheckFailure",
             @"statement" : @"Statement",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBAttributeValue class]];
}

+ (NSValueTransformer *)returnValuesOnConditionCheckFailureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL_OLD"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValuesOnConditionCheckFailureAllOld);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValuesOnConditionCheckFailureNone);
        }
        return @(AWSDynamoDBReturnValuesOnConditionCheckFailureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnValuesOnConditionCheckFailureAllOld:
                return @"ALL_OLD";
            case AWSDynamoDBReturnValuesOnConditionCheckFailureNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBPointInTimeRecoveryDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"earliestRestorableDateTime" : @"EarliestRestorableDateTime",
             @"latestRestorableDateTime" : @"LatestRestorableDateTime",
             @"pointInTimeRecoveryStatus" : @"PointInTimeRecoveryStatus",
             };
}

+ (NSValueTransformer *)earliestRestorableDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)latestRestorableDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)pointInTimeRecoveryStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBPointInTimeRecoveryStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBPointInTimeRecoveryStatusDisabled);
        }
        return @(AWSDynamoDBPointInTimeRecoveryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBPointInTimeRecoveryStatusEnabled:
                return @"ENABLED";
            case AWSDynamoDBPointInTimeRecoveryStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBPointInTimeRecoverySpecification

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pointInTimeRecoveryEnabled" : @"PointInTimeRecoveryEnabled",
             };
}

@end

@implementation AWSDynamoDBProjection

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nonKeyAttributes" : @"NonKeyAttributes",
             @"projectionType" : @"ProjectionType",
             };
}

+ (NSValueTransformer *)projectionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSDynamoDBProjectionTypeAll);
        }
        if ([value caseInsensitiveCompare:@"KEYS_ONLY"] == NSOrderedSame) {
            return @(AWSDynamoDBProjectionTypeKeysOnly);
        }
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSDynamoDBProjectionTypeInclude);
        }
        return @(AWSDynamoDBProjectionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBProjectionTypeAll:
                return @"ALL";
            case AWSDynamoDBProjectionTypeKeysOnly:
                return @"KEYS_ONLY";
            case AWSDynamoDBProjectionTypeInclude:
                return @"INCLUDE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBProvisionedThroughput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"readCapacityUnits" : @"ReadCapacityUnits",
             @"writeCapacityUnits" : @"WriteCapacityUnits",
             };
}

@end

@implementation AWSDynamoDBProvisionedThroughputDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastDecreaseDateTime" : @"LastDecreaseDateTime",
             @"lastIncreaseDateTime" : @"LastIncreaseDateTime",
             @"numberOfDecreasesToday" : @"NumberOfDecreasesToday",
             @"readCapacityUnits" : @"ReadCapacityUnits",
             @"writeCapacityUnits" : @"WriteCapacityUnits",
             };
}

+ (NSValueTransformer *)lastDecreaseDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastIncreaseDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSDynamoDBProvisionedThroughputOverride

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"readCapacityUnits" : @"ReadCapacityUnits",
             };
}

@end

@implementation AWSDynamoDBPut

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conditionExpression" : @"ConditionExpression",
             @"expressionAttributeNames" : @"ExpressionAttributeNames",
             @"expressionAttributeValues" : @"ExpressionAttributeValues",
             @"item" : @"Item",
             @"returnValuesOnConditionCheckFailure" : @"ReturnValuesOnConditionCheckFailure",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)expressionAttributeValuesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)returnValuesOnConditionCheckFailureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL_OLD"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValuesOnConditionCheckFailureAllOld);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValuesOnConditionCheckFailureNone);
        }
        return @(AWSDynamoDBReturnValuesOnConditionCheckFailureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnValuesOnConditionCheckFailureAllOld:
                return @"ALL_OLD";
            case AWSDynamoDBReturnValuesOnConditionCheckFailureNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBPutItemInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conditionExpression" : @"ConditionExpression",
             @"conditionalOperator" : @"ConditionalOperator",
             @"expected" : @"Expected",
             @"expressionAttributeNames" : @"ExpressionAttributeNames",
             @"expressionAttributeValues" : @"ExpressionAttributeValues",
             @"item" : @"Item",
             @"returnConsumedCapacity" : @"ReturnConsumedCapacity",
             @"returnItemCollectionMetrics" : @"ReturnItemCollectionMetrics",
             @"returnValues" : @"ReturnValues",
             @"returnValuesOnConditionCheckFailure" : @"ReturnValuesOnConditionCheckFailure",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)conditionalOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AND"] == NSOrderedSame) {
            return @(AWSDynamoDBConditionalOperatorAnd);
        }
        if ([value caseInsensitiveCompare:@"OR"] == NSOrderedSame) {
            return @(AWSDynamoDBConditionalOperatorOr);
        }
        return @(AWSDynamoDBConditionalOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBConditionalOperatorAnd:
                return @"AND";
            case AWSDynamoDBConditionalOperatorOr:
                return @"OR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)expectedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBExpectedAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)expressionAttributeValuesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)returnConsumedCapacityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INDEXES"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityIndexes);
        }
        if ([value caseInsensitiveCompare:@"TOTAL"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityTotal);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityNone);
        }
        return @(AWSDynamoDBReturnConsumedCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnConsumedCapacityIndexes:
                return @"INDEXES";
            case AWSDynamoDBReturnConsumedCapacityTotal:
                return @"TOTAL";
            case AWSDynamoDBReturnConsumedCapacityNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)returnItemCollectionMetricsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SIZE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnItemCollectionMetricsSize);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnItemCollectionMetricsNone);
        }
        return @(AWSDynamoDBReturnItemCollectionMetricsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnItemCollectionMetricsSize:
                return @"SIZE";
            case AWSDynamoDBReturnItemCollectionMetricsNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)returnValuesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueNone);
        }
        if ([value caseInsensitiveCompare:@"ALL_OLD"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueAllOld);
        }
        if ([value caseInsensitiveCompare:@"UPDATED_OLD"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueUpdatedOld);
        }
        if ([value caseInsensitiveCompare:@"ALL_NEW"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueAllNew);
        }
        if ([value caseInsensitiveCompare:@"UPDATED_NEW"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueUpdatedNew);
        }
        return @(AWSDynamoDBReturnValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnValueNone:
                return @"NONE";
            case AWSDynamoDBReturnValueAllOld:
                return @"ALL_OLD";
            case AWSDynamoDBReturnValueUpdatedOld:
                return @"UPDATED_OLD";
            case AWSDynamoDBReturnValueAllNew:
                return @"ALL_NEW";
            case AWSDynamoDBReturnValueUpdatedNew:
                return @"UPDATED_NEW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)returnValuesOnConditionCheckFailureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL_OLD"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValuesOnConditionCheckFailureAllOld);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValuesOnConditionCheckFailureNone);
        }
        return @(AWSDynamoDBReturnValuesOnConditionCheckFailureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnValuesOnConditionCheckFailureAllOld:
                return @"ALL_OLD";
            case AWSDynamoDBReturnValuesOnConditionCheckFailureNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBPutItemOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"consumedCapacity" : @"ConsumedCapacity",
             @"itemCollectionMetrics" : @"ItemCollectionMetrics",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)consumedCapacityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBConsumedCapacity class]];
}

+ (NSValueTransformer *)itemCollectionMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBItemCollectionMetrics class]];
}

@end

@implementation AWSDynamoDBPutRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSDynamoDBPutResourcePolicyInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confirmRemoveSelfResourceAccess" : @"ConfirmRemoveSelfResourceAccess",
             @"expectedRevisionId" : @"ExpectedRevisionId",
             @"policy" : @"Policy",
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSDynamoDBPutResourcePolicyOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSDynamoDBQueryInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributesToGet" : @"AttributesToGet",
             @"conditionalOperator" : @"ConditionalOperator",
             @"consistentRead" : @"ConsistentRead",
             @"exclusiveStartKey" : @"ExclusiveStartKey",
             @"expressionAttributeNames" : @"ExpressionAttributeNames",
             @"expressionAttributeValues" : @"ExpressionAttributeValues",
             @"filterExpression" : @"FilterExpression",
             @"indexName" : @"IndexName",
             @"keyConditionExpression" : @"KeyConditionExpression",
             @"keyConditions" : @"KeyConditions",
             @"limit" : @"Limit",
             @"projectionExpression" : @"ProjectionExpression",
             @"queryFilter" : @"QueryFilter",
             @"returnConsumedCapacity" : @"ReturnConsumedCapacity",
             @"scanIndexForward" : @"ScanIndexForward",
             @"select" : @"Select",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)conditionalOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AND"] == NSOrderedSame) {
            return @(AWSDynamoDBConditionalOperatorAnd);
        }
        if ([value caseInsensitiveCompare:@"OR"] == NSOrderedSame) {
            return @(AWSDynamoDBConditionalOperatorOr);
        }
        return @(AWSDynamoDBConditionalOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBConditionalOperatorAnd:
                return @"AND";
            case AWSDynamoDBConditionalOperatorOr:
                return @"OR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)exclusiveStartKeyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)expressionAttributeValuesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)keyConditionsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBCondition class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)queryFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBCondition class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)returnConsumedCapacityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INDEXES"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityIndexes);
        }
        if ([value caseInsensitiveCompare:@"TOTAL"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityTotal);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityNone);
        }
        return @(AWSDynamoDBReturnConsumedCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnConsumedCapacityIndexes:
                return @"INDEXES";
            case AWSDynamoDBReturnConsumedCapacityTotal:
                return @"TOTAL";
            case AWSDynamoDBReturnConsumedCapacityNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)selectJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL_ATTRIBUTES"] == NSOrderedSame) {
            return @(AWSDynamoDBSelectAllAttributes);
        }
        if ([value caseInsensitiveCompare:@"ALL_PROJECTED_ATTRIBUTES"] == NSOrderedSame) {
            return @(AWSDynamoDBSelectAllProjectedAttributes);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIC_ATTRIBUTES"] == NSOrderedSame) {
            return @(AWSDynamoDBSelectSpecificAttributes);
        }
        if ([value caseInsensitiveCompare:@"COUNT"] == NSOrderedSame) {
            return @(AWSDynamoDBSelectCount);
        }
        return @(AWSDynamoDBSelectUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBSelectAllAttributes:
                return @"ALL_ATTRIBUTES";
            case AWSDynamoDBSelectAllProjectedAttributes:
                return @"ALL_PROJECTED_ATTRIBUTES";
            case AWSDynamoDBSelectSpecificAttributes:
                return @"SPECIFIC_ATTRIBUTES";
            case AWSDynamoDBSelectCount:
                return @"COUNT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBQueryOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"consumedCapacity" : @"ConsumedCapacity",
             @"count" : @"Count",
             @"items" : @"Items",
             @"lastEvaluatedKey" : @"LastEvaluatedKey",
             @"scannedCount" : @"ScannedCount",
             };
}

+ (NSValueTransformer *)consumedCapacityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBConsumedCapacity class]];
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

+ (NSValueTransformer *)lastEvaluatedKeyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSDynamoDBReplica

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regionName" : @"RegionName",
             };
}

@end

@implementation AWSDynamoDBReplicaAutoScalingDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalSecondaryIndexes" : @"GlobalSecondaryIndexes",
             @"regionName" : @"RegionName",
             @"replicaProvisionedReadCapacityAutoScalingSettings" : @"ReplicaProvisionedReadCapacityAutoScalingSettings",
             @"replicaProvisionedWriteCapacityAutoScalingSettings" : @"ReplicaProvisionedWriteCapacityAutoScalingSettings",
             @"replicaStatus" : @"ReplicaStatus",
             };
}

+ (NSValueTransformer *)globalSecondaryIndexesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplicaGlobalSecondaryIndexAutoScalingDescription class]];
}

+ (NSValueTransformer *)replicaProvisionedReadCapacityAutoScalingSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBAutoScalingSettingsDescription class]];
}

+ (NSValueTransformer *)replicaProvisionedWriteCapacityAutoScalingSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBAutoScalingSettingsDescription class]];
}

+ (NSValueTransformer *)replicaStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATION_FAILED"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusCreationFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusActive);
        }
        if ([value caseInsensitiveCompare:@"REGION_DISABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusRegionDisabled);
        }
        if ([value caseInsensitiveCompare:@"INACCESSIBLE_ENCRYPTION_CREDENTIALS"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusInaccessibleEncryptionCredentials);
        }
        return @(AWSDynamoDBReplicaStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReplicaStatusCreating:
                return @"CREATING";
            case AWSDynamoDBReplicaStatusCreationFailed:
                return @"CREATION_FAILED";
            case AWSDynamoDBReplicaStatusUpdating:
                return @"UPDATING";
            case AWSDynamoDBReplicaStatusDeleting:
                return @"DELETING";
            case AWSDynamoDBReplicaStatusActive:
                return @"ACTIVE";
            case AWSDynamoDBReplicaStatusRegionDisabled:
                return @"REGION_DISABLED";
            case AWSDynamoDBReplicaStatusInaccessibleEncryptionCredentials:
                return @"INACCESSIBLE_ENCRYPTION_CREDENTIALS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBReplicaAutoScalingUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regionName" : @"RegionName",
             @"replicaGlobalSecondaryIndexUpdates" : @"ReplicaGlobalSecondaryIndexUpdates",
             @"replicaProvisionedReadCapacityAutoScalingUpdate" : @"ReplicaProvisionedReadCapacityAutoScalingUpdate",
             };
}

+ (NSValueTransformer *)replicaGlobalSecondaryIndexUpdatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplicaGlobalSecondaryIndexAutoScalingUpdate class]];
}

+ (NSValueTransformer *)replicaProvisionedReadCapacityAutoScalingUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBAutoScalingSettingsUpdate class]];
}

@end

@implementation AWSDynamoDBReplicaDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalSecondaryIndexes" : @"GlobalSecondaryIndexes",
             @"KMSMasterKeyId" : @"KMSMasterKeyId",
             @"onDemandThroughputOverride" : @"OnDemandThroughputOverride",
             @"provisionedThroughputOverride" : @"ProvisionedThroughputOverride",
             @"regionName" : @"RegionName",
             @"replicaInaccessibleDateTime" : @"ReplicaInaccessibleDateTime",
             @"replicaStatus" : @"ReplicaStatus",
             @"replicaStatusDescription" : @"ReplicaStatusDescription",
             @"replicaStatusPercentProgress" : @"ReplicaStatusPercentProgress",
             @"replicaTableClassSummary" : @"ReplicaTableClassSummary",
             };
}

+ (NSValueTransformer *)globalSecondaryIndexesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplicaGlobalSecondaryIndexDescription class]];
}

+ (NSValueTransformer *)onDemandThroughputOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBOnDemandThroughputOverride class]];
}

+ (NSValueTransformer *)provisionedThroughputOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughputOverride class]];
}

+ (NSValueTransformer *)replicaInaccessibleDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)replicaStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATION_FAILED"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusCreationFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusActive);
        }
        if ([value caseInsensitiveCompare:@"REGION_DISABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusRegionDisabled);
        }
        if ([value caseInsensitiveCompare:@"INACCESSIBLE_ENCRYPTION_CREDENTIALS"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusInaccessibleEncryptionCredentials);
        }
        return @(AWSDynamoDBReplicaStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReplicaStatusCreating:
                return @"CREATING";
            case AWSDynamoDBReplicaStatusCreationFailed:
                return @"CREATION_FAILED";
            case AWSDynamoDBReplicaStatusUpdating:
                return @"UPDATING";
            case AWSDynamoDBReplicaStatusDeleting:
                return @"DELETING";
            case AWSDynamoDBReplicaStatusActive:
                return @"ACTIVE";
            case AWSDynamoDBReplicaStatusRegionDisabled:
                return @"REGION_DISABLED";
            case AWSDynamoDBReplicaStatusInaccessibleEncryptionCredentials:
                return @"INACCESSIBLE_ENCRYPTION_CREDENTIALS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)replicaTableClassSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTableClassSummary class]];
}

@end

@implementation AWSDynamoDBReplicaGlobalSecondaryIndex

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             @"onDemandThroughputOverride" : @"OnDemandThroughputOverride",
             @"provisionedThroughputOverride" : @"ProvisionedThroughputOverride",
             };
}

+ (NSValueTransformer *)onDemandThroughputOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBOnDemandThroughputOverride class]];
}

+ (NSValueTransformer *)provisionedThroughputOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughputOverride class]];
}

@end

@implementation AWSDynamoDBReplicaGlobalSecondaryIndexAutoScalingDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             @"indexStatus" : @"IndexStatus",
             @"provisionedReadCapacityAutoScalingSettings" : @"ProvisionedReadCapacityAutoScalingSettings",
             @"provisionedWriteCapacityAutoScalingSettings" : @"ProvisionedWriteCapacityAutoScalingSettings",
             };
}

+ (NSValueTransformer *)indexStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSDynamoDBIndexStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSDynamoDBIndexStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSDynamoDBIndexStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSDynamoDBIndexStatusActive);
        }
        return @(AWSDynamoDBIndexStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBIndexStatusCreating:
                return @"CREATING";
            case AWSDynamoDBIndexStatusUpdating:
                return @"UPDATING";
            case AWSDynamoDBIndexStatusDeleting:
                return @"DELETING";
            case AWSDynamoDBIndexStatusActive:
                return @"ACTIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)provisionedReadCapacityAutoScalingSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBAutoScalingSettingsDescription class]];
}

+ (NSValueTransformer *)provisionedWriteCapacityAutoScalingSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBAutoScalingSettingsDescription class]];
}

@end

@implementation AWSDynamoDBReplicaGlobalSecondaryIndexAutoScalingUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             @"provisionedReadCapacityAutoScalingUpdate" : @"ProvisionedReadCapacityAutoScalingUpdate",
             };
}

+ (NSValueTransformer *)provisionedReadCapacityAutoScalingUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBAutoScalingSettingsUpdate class]];
}

@end

@implementation AWSDynamoDBReplicaGlobalSecondaryIndexDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             @"onDemandThroughputOverride" : @"OnDemandThroughputOverride",
             @"provisionedThroughputOverride" : @"ProvisionedThroughputOverride",
             };
}

+ (NSValueTransformer *)onDemandThroughputOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBOnDemandThroughputOverride class]];
}

+ (NSValueTransformer *)provisionedThroughputOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughputOverride class]];
}

@end

@implementation AWSDynamoDBReplicaGlobalSecondaryIndexSettingsDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             @"indexStatus" : @"IndexStatus",
             @"provisionedReadCapacityAutoScalingSettings" : @"ProvisionedReadCapacityAutoScalingSettings",
             @"provisionedReadCapacityUnits" : @"ProvisionedReadCapacityUnits",
             @"provisionedWriteCapacityAutoScalingSettings" : @"ProvisionedWriteCapacityAutoScalingSettings",
             @"provisionedWriteCapacityUnits" : @"ProvisionedWriteCapacityUnits",
             };
}

+ (NSValueTransformer *)indexStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSDynamoDBIndexStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSDynamoDBIndexStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSDynamoDBIndexStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSDynamoDBIndexStatusActive);
        }
        return @(AWSDynamoDBIndexStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBIndexStatusCreating:
                return @"CREATING";
            case AWSDynamoDBIndexStatusUpdating:
                return @"UPDATING";
            case AWSDynamoDBIndexStatusDeleting:
                return @"DELETING";
            case AWSDynamoDBIndexStatusActive:
                return @"ACTIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)provisionedReadCapacityAutoScalingSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBAutoScalingSettingsDescription class]];
}

+ (NSValueTransformer *)provisionedWriteCapacityAutoScalingSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBAutoScalingSettingsDescription class]];
}

@end

@implementation AWSDynamoDBReplicaGlobalSecondaryIndexSettingsUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             @"provisionedReadCapacityAutoScalingSettingsUpdate" : @"ProvisionedReadCapacityAutoScalingSettingsUpdate",
             @"provisionedReadCapacityUnits" : @"ProvisionedReadCapacityUnits",
             };
}

+ (NSValueTransformer *)provisionedReadCapacityAutoScalingSettingsUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBAutoScalingSettingsUpdate class]];
}

@end

@implementation AWSDynamoDBReplicaSettingsDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regionName" : @"RegionName",
             @"replicaBillingModeSummary" : @"ReplicaBillingModeSummary",
             @"replicaGlobalSecondaryIndexSettings" : @"ReplicaGlobalSecondaryIndexSettings",
             @"replicaProvisionedReadCapacityAutoScalingSettings" : @"ReplicaProvisionedReadCapacityAutoScalingSettings",
             @"replicaProvisionedReadCapacityUnits" : @"ReplicaProvisionedReadCapacityUnits",
             @"replicaProvisionedWriteCapacityAutoScalingSettings" : @"ReplicaProvisionedWriteCapacityAutoScalingSettings",
             @"replicaProvisionedWriteCapacityUnits" : @"ReplicaProvisionedWriteCapacityUnits",
             @"replicaStatus" : @"ReplicaStatus",
             @"replicaTableClassSummary" : @"ReplicaTableClassSummary",
             };
}

+ (NSValueTransformer *)replicaBillingModeSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBBillingModeSummary class]];
}

+ (NSValueTransformer *)replicaGlobalSecondaryIndexSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplicaGlobalSecondaryIndexSettingsDescription class]];
}

+ (NSValueTransformer *)replicaProvisionedReadCapacityAutoScalingSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBAutoScalingSettingsDescription class]];
}

+ (NSValueTransformer *)replicaProvisionedWriteCapacityAutoScalingSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBAutoScalingSettingsDescription class]];
}

+ (NSValueTransformer *)replicaStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATION_FAILED"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusCreationFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusActive);
        }
        if ([value caseInsensitiveCompare:@"REGION_DISABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusRegionDisabled);
        }
        if ([value caseInsensitiveCompare:@"INACCESSIBLE_ENCRYPTION_CREDENTIALS"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusInaccessibleEncryptionCredentials);
        }
        return @(AWSDynamoDBReplicaStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReplicaStatusCreating:
                return @"CREATING";
            case AWSDynamoDBReplicaStatusCreationFailed:
                return @"CREATION_FAILED";
            case AWSDynamoDBReplicaStatusUpdating:
                return @"UPDATING";
            case AWSDynamoDBReplicaStatusDeleting:
                return @"DELETING";
            case AWSDynamoDBReplicaStatusActive:
                return @"ACTIVE";
            case AWSDynamoDBReplicaStatusRegionDisabled:
                return @"REGION_DISABLED";
            case AWSDynamoDBReplicaStatusInaccessibleEncryptionCredentials:
                return @"INACCESSIBLE_ENCRYPTION_CREDENTIALS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)replicaTableClassSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTableClassSummary class]];
}

@end

@implementation AWSDynamoDBReplicaSettingsUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regionName" : @"RegionName",
             @"replicaGlobalSecondaryIndexSettingsUpdate" : @"ReplicaGlobalSecondaryIndexSettingsUpdate",
             @"replicaProvisionedReadCapacityAutoScalingSettingsUpdate" : @"ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate",
             @"replicaProvisionedReadCapacityUnits" : @"ReplicaProvisionedReadCapacityUnits",
             @"replicaTableClass" : @"ReplicaTableClass",
             };
}

+ (NSValueTransformer *)replicaGlobalSecondaryIndexSettingsUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplicaGlobalSecondaryIndexSettingsUpdate class]];
}

+ (NSValueTransformer *)replicaProvisionedReadCapacityAutoScalingSettingsUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBAutoScalingSettingsUpdate class]];
}

+ (NSValueTransformer *)replicaTableClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSDynamoDBTableClassStandard);
        }
        if ([value caseInsensitiveCompare:@"STANDARD_INFREQUENT_ACCESS"] == NSOrderedSame) {
            return @(AWSDynamoDBTableClassStandardInfrequentAccess);
        }
        return @(AWSDynamoDBTableClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBTableClassStandard:
                return @"STANDARD";
            case AWSDynamoDBTableClassStandardInfrequentAccess:
                return @"STANDARD_INFREQUENT_ACCESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBReplicaUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"create" : @"Create",
             @"remove" : @"Delete",
             };
}

+ (NSValueTransformer *)createJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBCreateReplicaAction class]];
}

+ (NSValueTransformer *)removeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBDeleteReplicaAction class]];
}

@end

@implementation AWSDynamoDBReplicationGroupUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"create" : @"Create",
             @"remove" : @"Delete",
             @"update" : @"Update",
             };
}

+ (NSValueTransformer *)createJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBCreateReplicationGroupMemberAction class]];
}

+ (NSValueTransformer *)removeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBDeleteReplicationGroupMemberAction class]];
}

+ (NSValueTransformer *)updateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBUpdateReplicationGroupMemberAction class]];
}

@end

@implementation AWSDynamoDBRestoreSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"restoreDateTime" : @"RestoreDateTime",
             @"restoreInProgress" : @"RestoreInProgress",
             @"sourceBackupArn" : @"SourceBackupArn",
             @"sourceTableArn" : @"SourceTableArn",
             };
}

+ (NSValueTransformer *)restoreDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSDynamoDBRestoreTableFromBackupInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupArn" : @"BackupArn",
             @"billingModeOverride" : @"BillingModeOverride",
             @"globalSecondaryIndexOverride" : @"GlobalSecondaryIndexOverride",
             @"localSecondaryIndexOverride" : @"LocalSecondaryIndexOverride",
             @"onDemandThroughputOverride" : @"OnDemandThroughputOverride",
             @"provisionedThroughputOverride" : @"ProvisionedThroughputOverride",
             @"SSESpecificationOverride" : @"SSESpecificationOverride",
             @"targetTableName" : @"TargetTableName",
             };
}

+ (NSValueTransformer *)billingModeOverrideJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROVISIONED"] == NSOrderedSame) {
            return @(AWSDynamoDBBillingModeProvisioned);
        }
        if ([value caseInsensitiveCompare:@"PAY_PER_REQUEST"] == NSOrderedSame) {
            return @(AWSDynamoDBBillingModePayPerRequest);
        }
        return @(AWSDynamoDBBillingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBBillingModeProvisioned:
                return @"PROVISIONED";
            case AWSDynamoDBBillingModePayPerRequest:
                return @"PAY_PER_REQUEST";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)globalSecondaryIndexOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBGlobalSecondaryIndex class]];
}

+ (NSValueTransformer *)localSecondaryIndexOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBLocalSecondaryIndex class]];
}

+ (NSValueTransformer *)onDemandThroughputOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBOnDemandThroughput class]];
}

+ (NSValueTransformer *)provisionedThroughputOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughput class]];
}

+ (NSValueTransformer *)SSESpecificationOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBSSESpecification class]];
}

@end

@implementation AWSDynamoDBRestoreTableFromBackupOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableDescription" : @"TableDescription",
             };
}

+ (NSValueTransformer *)tableDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTableDescription class]];
}

@end

@implementation AWSDynamoDBRestoreTableToPointInTimeInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"billingModeOverride" : @"BillingModeOverride",
             @"globalSecondaryIndexOverride" : @"GlobalSecondaryIndexOverride",
             @"localSecondaryIndexOverride" : @"LocalSecondaryIndexOverride",
             @"onDemandThroughputOverride" : @"OnDemandThroughputOverride",
             @"provisionedThroughputOverride" : @"ProvisionedThroughputOverride",
             @"restoreDateTime" : @"RestoreDateTime",
             @"SSESpecificationOverride" : @"SSESpecificationOverride",
             @"sourceTableArn" : @"SourceTableArn",
             @"sourceTableName" : @"SourceTableName",
             @"targetTableName" : @"TargetTableName",
             @"useLatestRestorableTime" : @"UseLatestRestorableTime",
             };
}

+ (NSValueTransformer *)billingModeOverrideJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROVISIONED"] == NSOrderedSame) {
            return @(AWSDynamoDBBillingModeProvisioned);
        }
        if ([value caseInsensitiveCompare:@"PAY_PER_REQUEST"] == NSOrderedSame) {
            return @(AWSDynamoDBBillingModePayPerRequest);
        }
        return @(AWSDynamoDBBillingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBBillingModeProvisioned:
                return @"PROVISIONED";
            case AWSDynamoDBBillingModePayPerRequest:
                return @"PAY_PER_REQUEST";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)globalSecondaryIndexOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBGlobalSecondaryIndex class]];
}

+ (NSValueTransformer *)localSecondaryIndexOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBLocalSecondaryIndex class]];
}

+ (NSValueTransformer *)onDemandThroughputOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBOnDemandThroughput class]];
}

+ (NSValueTransformer *)provisionedThroughputOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughput class]];
}

+ (NSValueTransformer *)restoreDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)SSESpecificationOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBSSESpecification class]];
}

@end

@implementation AWSDynamoDBRestoreTableToPointInTimeOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableDescription" : @"TableDescription",
             };
}

+ (NSValueTransformer *)tableDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTableDescription class]];
}

@end

@implementation AWSDynamoDBS3BucketSource

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Bucket" : @"S3Bucket",
             @"s3BucketOwner" : @"S3BucketOwner",
             @"s3KeyPrefix" : @"S3KeyPrefix",
             };
}

@end

@implementation AWSDynamoDBSSEDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inaccessibleEncryptionDateTime" : @"InaccessibleEncryptionDateTime",
             @"KMSMasterKeyArn" : @"KMSMasterKeyArn",
             @"SSEType" : @"SSEType",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)inaccessibleEncryptionDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)SSETypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES256"] == NSOrderedSame) {
            return @(AWSDynamoDBSSETypeAES256);
        }
        if ([value caseInsensitiveCompare:@"KMS"] == NSOrderedSame) {
            return @(AWSDynamoDBSSETypeKms);
        }
        return @(AWSDynamoDBSSETypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBSSETypeAES256:
                return @"AES256";
            case AWSDynamoDBSSETypeKms:
                return @"KMS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLING"] == NSOrderedSame) {
            return @(AWSDynamoDBSSEStatusEnabling);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBSSEStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLING"] == NSOrderedSame) {
            return @(AWSDynamoDBSSEStatusDisabling);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBSSEStatusDisabled);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSDynamoDBSSEStatusUpdating);
        }
        return @(AWSDynamoDBSSEStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBSSEStatusEnabling:
                return @"ENABLING";
            case AWSDynamoDBSSEStatusEnabled:
                return @"ENABLED";
            case AWSDynamoDBSSEStatusDisabling:
                return @"DISABLING";
            case AWSDynamoDBSSEStatusDisabled:
                return @"DISABLED";
            case AWSDynamoDBSSEStatusUpdating:
                return @"UPDATING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBSSESpecification

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"KMSMasterKeyId" : @"KMSMasterKeyId",
             @"SSEType" : @"SSEType",
             };
}

+ (NSValueTransformer *)SSETypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES256"] == NSOrderedSame) {
            return @(AWSDynamoDBSSETypeAES256);
        }
        if ([value caseInsensitiveCompare:@"KMS"] == NSOrderedSame) {
            return @(AWSDynamoDBSSETypeKms);
        }
        return @(AWSDynamoDBSSETypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBSSETypeAES256:
                return @"AES256";
            case AWSDynamoDBSSETypeKms:
                return @"KMS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBScanInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributesToGet" : @"AttributesToGet",
             @"conditionalOperator" : @"ConditionalOperator",
             @"consistentRead" : @"ConsistentRead",
             @"exclusiveStartKey" : @"ExclusiveStartKey",
             @"expressionAttributeNames" : @"ExpressionAttributeNames",
             @"expressionAttributeValues" : @"ExpressionAttributeValues",
             @"filterExpression" : @"FilterExpression",
             @"indexName" : @"IndexName",
             @"limit" : @"Limit",
             @"projectionExpression" : @"ProjectionExpression",
             @"returnConsumedCapacity" : @"ReturnConsumedCapacity",
             @"scanFilter" : @"ScanFilter",
             @"segment" : @"Segment",
             @"select" : @"Select",
             @"tableName" : @"TableName",
             @"totalSegments" : @"TotalSegments",
             };
}

+ (NSValueTransformer *)conditionalOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AND"] == NSOrderedSame) {
            return @(AWSDynamoDBConditionalOperatorAnd);
        }
        if ([value caseInsensitiveCompare:@"OR"] == NSOrderedSame) {
            return @(AWSDynamoDBConditionalOperatorOr);
        }
        return @(AWSDynamoDBConditionalOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBConditionalOperatorAnd:
                return @"AND";
            case AWSDynamoDBConditionalOperatorOr:
                return @"OR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)exclusiveStartKeyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)expressionAttributeValuesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)returnConsumedCapacityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INDEXES"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityIndexes);
        }
        if ([value caseInsensitiveCompare:@"TOTAL"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityTotal);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityNone);
        }
        return @(AWSDynamoDBReturnConsumedCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnConsumedCapacityIndexes:
                return @"INDEXES";
            case AWSDynamoDBReturnConsumedCapacityTotal:
                return @"TOTAL";
            case AWSDynamoDBReturnConsumedCapacityNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scanFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBCondition class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)selectJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL_ATTRIBUTES"] == NSOrderedSame) {
            return @(AWSDynamoDBSelectAllAttributes);
        }
        if ([value caseInsensitiveCompare:@"ALL_PROJECTED_ATTRIBUTES"] == NSOrderedSame) {
            return @(AWSDynamoDBSelectAllProjectedAttributes);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIC_ATTRIBUTES"] == NSOrderedSame) {
            return @(AWSDynamoDBSelectSpecificAttributes);
        }
        if ([value caseInsensitiveCompare:@"COUNT"] == NSOrderedSame) {
            return @(AWSDynamoDBSelectCount);
        }
        return @(AWSDynamoDBSelectUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBSelectAllAttributes:
                return @"ALL_ATTRIBUTES";
            case AWSDynamoDBSelectAllProjectedAttributes:
                return @"ALL_PROJECTED_ATTRIBUTES";
            case AWSDynamoDBSelectSpecificAttributes:
                return @"SPECIFIC_ATTRIBUTES";
            case AWSDynamoDBSelectCount:
                return @"COUNT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBScanOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"consumedCapacity" : @"ConsumedCapacity",
             @"count" : @"Count",
             @"items" : @"Items",
             @"lastEvaluatedKey" : @"LastEvaluatedKey",
             @"scannedCount" : @"ScannedCount",
             };
}

+ (NSValueTransformer *)consumedCapacityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBConsumedCapacity class]];
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

+ (NSValueTransformer *)lastEvaluatedKeyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSDynamoDBSourceTableDetails

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"billingMode" : @"BillingMode",
             @"itemCount" : @"ItemCount",
             @"keySchema" : @"KeySchema",
             @"onDemandThroughput" : @"OnDemandThroughput",
             @"provisionedThroughput" : @"ProvisionedThroughput",
             @"tableArn" : @"TableArn",
             @"tableCreationDateTime" : @"TableCreationDateTime",
             @"tableId" : @"TableId",
             @"tableName" : @"TableName",
             @"tableSizeBytes" : @"TableSizeBytes",
             };
}

+ (NSValueTransformer *)billingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROVISIONED"] == NSOrderedSame) {
            return @(AWSDynamoDBBillingModeProvisioned);
        }
        if ([value caseInsensitiveCompare:@"PAY_PER_REQUEST"] == NSOrderedSame) {
            return @(AWSDynamoDBBillingModePayPerRequest);
        }
        return @(AWSDynamoDBBillingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBBillingModeProvisioned:
                return @"PROVISIONED";
            case AWSDynamoDBBillingModePayPerRequest:
                return @"PAY_PER_REQUEST";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)keySchemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBKeySchemaElement class]];
}

+ (NSValueTransformer *)onDemandThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBOnDemandThroughput class]];
}

+ (NSValueTransformer *)provisionedThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughput class]];
}

+ (NSValueTransformer *)tableCreationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSDynamoDBSourceTableFeatureDetails

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalSecondaryIndexes" : @"GlobalSecondaryIndexes",
             @"localSecondaryIndexes" : @"LocalSecondaryIndexes",
             @"SSEDescription" : @"SSEDescription",
             @"streamDescription" : @"StreamDescription",
             @"timeToLiveDescription" : @"TimeToLiveDescription",
             };
}

+ (NSValueTransformer *)globalSecondaryIndexesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBGlobalSecondaryIndexInfo class]];
}

+ (NSValueTransformer *)localSecondaryIndexesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBLocalSecondaryIndexInfo class]];
}

+ (NSValueTransformer *)SSEDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBSSEDescription class]];
}

+ (NSValueTransformer *)streamDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBStreamSpecification class]];
}

+ (NSValueTransformer *)timeToLiveDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTimeToLiveDescription class]];
}

@end

@implementation AWSDynamoDBStreamSpecification

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamEnabled" : @"StreamEnabled",
             @"streamViewType" : @"StreamViewType",
             };
}

+ (NSValueTransformer *)streamViewTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NEW_IMAGE"] == NSOrderedSame) {
            return @(AWSDynamoDBStreamViewTypeNewImage);
        }
        if ([value caseInsensitiveCompare:@"OLD_IMAGE"] == NSOrderedSame) {
            return @(AWSDynamoDBStreamViewTypeOldImage);
        }
        if ([value caseInsensitiveCompare:@"NEW_AND_OLD_IMAGES"] == NSOrderedSame) {
            return @(AWSDynamoDBStreamViewTypeNewAndOldImages);
        }
        if ([value caseInsensitiveCompare:@"KEYS_ONLY"] == NSOrderedSame) {
            return @(AWSDynamoDBStreamViewTypeKeysOnly);
        }
        return @(AWSDynamoDBStreamViewTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBStreamViewTypeNewImage:
                return @"NEW_IMAGE";
            case AWSDynamoDBStreamViewTypeOldImage:
                return @"OLD_IMAGE";
            case AWSDynamoDBStreamViewTypeNewAndOldImages:
                return @"NEW_AND_OLD_IMAGES";
            case AWSDynamoDBStreamViewTypeKeysOnly:
                return @"KEYS_ONLY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBTableAutoScalingDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicas" : @"Replicas",
             @"tableName" : @"TableName",
             @"tableStatus" : @"TableStatus",
             };
}

+ (NSValueTransformer *)replicasJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplicaAutoScalingDescription class]];
}

+ (NSValueTransformer *)tableStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSDynamoDBTableStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSDynamoDBTableStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSDynamoDBTableStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSDynamoDBTableStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACCESSIBLE_ENCRYPTION_CREDENTIALS"] == NSOrderedSame) {
            return @(AWSDynamoDBTableStatusInaccessibleEncryptionCredentials);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVING"] == NSOrderedSame) {
            return @(AWSDynamoDBTableStatusArchiving);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVED"] == NSOrderedSame) {
            return @(AWSDynamoDBTableStatusArchived);
        }
        return @(AWSDynamoDBTableStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBTableStatusCreating:
                return @"CREATING";
            case AWSDynamoDBTableStatusUpdating:
                return @"UPDATING";
            case AWSDynamoDBTableStatusDeleting:
                return @"DELETING";
            case AWSDynamoDBTableStatusActive:
                return @"ACTIVE";
            case AWSDynamoDBTableStatusInaccessibleEncryptionCredentials:
                return @"INACCESSIBLE_ENCRYPTION_CREDENTIALS";
            case AWSDynamoDBTableStatusArchiving:
                return @"ARCHIVING";
            case AWSDynamoDBTableStatusArchived:
                return @"ARCHIVED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBTableClassSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastUpdateDateTime" : @"LastUpdateDateTime",
             @"tableClass" : @"TableClass",
             };
}

+ (NSValueTransformer *)lastUpdateDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)tableClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSDynamoDBTableClassStandard);
        }
        if ([value caseInsensitiveCompare:@"STANDARD_INFREQUENT_ACCESS"] == NSOrderedSame) {
            return @(AWSDynamoDBTableClassStandardInfrequentAccess);
        }
        return @(AWSDynamoDBTableClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBTableClassStandard:
                return @"STANDARD";
            case AWSDynamoDBTableClassStandardInfrequentAccess:
                return @"STANDARD_INFREQUENT_ACCESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBTableCreationParameters

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeDefinitions" : @"AttributeDefinitions",
             @"billingMode" : @"BillingMode",
             @"globalSecondaryIndexes" : @"GlobalSecondaryIndexes",
             @"keySchema" : @"KeySchema",
             @"onDemandThroughput" : @"OnDemandThroughput",
             @"provisionedThroughput" : @"ProvisionedThroughput",
             @"SSESpecification" : @"SSESpecification",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)attributeDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBAttributeDefinition class]];
}

+ (NSValueTransformer *)billingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROVISIONED"] == NSOrderedSame) {
            return @(AWSDynamoDBBillingModeProvisioned);
        }
        if ([value caseInsensitiveCompare:@"PAY_PER_REQUEST"] == NSOrderedSame) {
            return @(AWSDynamoDBBillingModePayPerRequest);
        }
        return @(AWSDynamoDBBillingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBBillingModeProvisioned:
                return @"PROVISIONED";
            case AWSDynamoDBBillingModePayPerRequest:
                return @"PAY_PER_REQUEST";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)globalSecondaryIndexesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBGlobalSecondaryIndex class]];
}

+ (NSValueTransformer *)keySchemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBKeySchemaElement class]];
}

+ (NSValueTransformer *)onDemandThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBOnDemandThroughput class]];
}

+ (NSValueTransformer *)provisionedThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughput class]];
}

+ (NSValueTransformer *)SSESpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBSSESpecification class]];
}

@end

@implementation AWSDynamoDBTableDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"archivalSummary" : @"ArchivalSummary",
             @"attributeDefinitions" : @"AttributeDefinitions",
             @"billingModeSummary" : @"BillingModeSummary",
             @"creationDateTime" : @"CreationDateTime",
             @"deletionProtectionEnabled" : @"DeletionProtectionEnabled",
             @"globalSecondaryIndexes" : @"GlobalSecondaryIndexes",
             @"globalTableVersion" : @"GlobalTableVersion",
             @"itemCount" : @"ItemCount",
             @"keySchema" : @"KeySchema",
             @"latestStreamArn" : @"LatestStreamArn",
             @"latestStreamLabel" : @"LatestStreamLabel",
             @"localSecondaryIndexes" : @"LocalSecondaryIndexes",
             @"onDemandThroughput" : @"OnDemandThroughput",
             @"provisionedThroughput" : @"ProvisionedThroughput",
             @"replicas" : @"Replicas",
             @"restoreSummary" : @"RestoreSummary",
             @"SSEDescription" : @"SSEDescription",
             @"streamSpecification" : @"StreamSpecification",
             @"tableArn" : @"TableArn",
             @"tableClassSummary" : @"TableClassSummary",
             @"tableId" : @"TableId",
             @"tableName" : @"TableName",
             @"tableSizeBytes" : @"TableSizeBytes",
             @"tableStatus" : @"TableStatus",
             };
}

+ (NSValueTransformer *)archivalSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBArchivalSummary class]];
}

+ (NSValueTransformer *)attributeDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBAttributeDefinition class]];
}

+ (NSValueTransformer *)billingModeSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBBillingModeSummary class]];
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)globalSecondaryIndexesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBGlobalSecondaryIndexDescription class]];
}

+ (NSValueTransformer *)keySchemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBKeySchemaElement class]];
}

+ (NSValueTransformer *)localSecondaryIndexesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBLocalSecondaryIndexDescription class]];
}

+ (NSValueTransformer *)onDemandThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBOnDemandThroughput class]];
}

+ (NSValueTransformer *)provisionedThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughputDescription class]];
}

+ (NSValueTransformer *)replicasJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplicaDescription class]];
}

+ (NSValueTransformer *)restoreSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBRestoreSummary class]];
}

+ (NSValueTransformer *)SSEDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBSSEDescription class]];
}

+ (NSValueTransformer *)streamSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBStreamSpecification class]];
}

+ (NSValueTransformer *)tableClassSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTableClassSummary class]];
}

+ (NSValueTransformer *)tableStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSDynamoDBTableStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSDynamoDBTableStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSDynamoDBTableStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSDynamoDBTableStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACCESSIBLE_ENCRYPTION_CREDENTIALS"] == NSOrderedSame) {
            return @(AWSDynamoDBTableStatusInaccessibleEncryptionCredentials);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVING"] == NSOrderedSame) {
            return @(AWSDynamoDBTableStatusArchiving);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVED"] == NSOrderedSame) {
            return @(AWSDynamoDBTableStatusArchived);
        }
        return @(AWSDynamoDBTableStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBTableStatusCreating:
                return @"CREATING";
            case AWSDynamoDBTableStatusUpdating:
                return @"UPDATING";
            case AWSDynamoDBTableStatusDeleting:
                return @"DELETING";
            case AWSDynamoDBTableStatusActive:
                return @"ACTIVE";
            case AWSDynamoDBTableStatusInaccessibleEncryptionCredentials:
                return @"INACCESSIBLE_ENCRYPTION_CREDENTIALS";
            case AWSDynamoDBTableStatusArchiving:
                return @"ARCHIVING";
            case AWSDynamoDBTableStatusArchived:
                return @"ARCHIVED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBTag

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

@implementation AWSDynamoDBTagResourceInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBTag class]];
}

@end

@implementation AWSDynamoDBTimeToLiveDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"timeToLiveStatus" : @"TimeToLiveStatus",
             };
}

+ (NSValueTransformer *)timeToLiveStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLING"] == NSOrderedSame) {
            return @(AWSDynamoDBTimeToLiveStatusEnabling);
        }
        if ([value caseInsensitiveCompare:@"DISABLING"] == NSOrderedSame) {
            return @(AWSDynamoDBTimeToLiveStatusDisabling);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBTimeToLiveStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBTimeToLiveStatusDisabled);
        }
        return @(AWSDynamoDBTimeToLiveStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBTimeToLiveStatusEnabling:
                return @"ENABLING";
            case AWSDynamoDBTimeToLiveStatusDisabling:
                return @"DISABLING";
            case AWSDynamoDBTimeToLiveStatusEnabled:
                return @"ENABLED";
            case AWSDynamoDBTimeToLiveStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBTimeToLiveSpecification

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSDynamoDBTransactGetItem

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"get" : @"Get",
             };
}

+ (NSValueTransformer *)getJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBGet class]];
}

@end

@implementation AWSDynamoDBTransactGetItemsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"returnConsumedCapacity" : @"ReturnConsumedCapacity",
             @"transactItems" : @"TransactItems",
             };
}

+ (NSValueTransformer *)returnConsumedCapacityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INDEXES"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityIndexes);
        }
        if ([value caseInsensitiveCompare:@"TOTAL"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityTotal);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityNone);
        }
        return @(AWSDynamoDBReturnConsumedCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnConsumedCapacityIndexes:
                return @"INDEXES";
            case AWSDynamoDBReturnConsumedCapacityTotal:
                return @"TOTAL";
            case AWSDynamoDBReturnConsumedCapacityNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)transactItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBTransactGetItem class]];
}

@end

@implementation AWSDynamoDBTransactGetItemsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"consumedCapacity" : @"ConsumedCapacity",
             @"responses" : @"Responses",
             };
}

+ (NSValueTransformer *)consumedCapacityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBConsumedCapacity class]];
}

+ (NSValueTransformer *)responsesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBItemResponse class]];
}

@end

@implementation AWSDynamoDBTransactWriteItem

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conditionCheck" : @"ConditionCheck",
             @"remove" : @"Delete",
             @"put" : @"Put",
             @"update" : @"Update",
             };
}

+ (NSValueTransformer *)conditionCheckJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBConditionCheck class]];
}

+ (NSValueTransformer *)removeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBRemove class]];
}

+ (NSValueTransformer *)putJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBPut class]];
}

+ (NSValueTransformer *)updateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBUpdate class]];
}

@end

@implementation AWSDynamoDBTransactWriteItemsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"returnConsumedCapacity" : @"ReturnConsumedCapacity",
             @"returnItemCollectionMetrics" : @"ReturnItemCollectionMetrics",
             @"transactItems" : @"TransactItems",
             };
}

+ (NSValueTransformer *)returnConsumedCapacityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INDEXES"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityIndexes);
        }
        if ([value caseInsensitiveCompare:@"TOTAL"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityTotal);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityNone);
        }
        return @(AWSDynamoDBReturnConsumedCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnConsumedCapacityIndexes:
                return @"INDEXES";
            case AWSDynamoDBReturnConsumedCapacityTotal:
                return @"TOTAL";
            case AWSDynamoDBReturnConsumedCapacityNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)returnItemCollectionMetricsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SIZE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnItemCollectionMetricsSize);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnItemCollectionMetricsNone);
        }
        return @(AWSDynamoDBReturnItemCollectionMetricsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnItemCollectionMetricsSize:
                return @"SIZE";
            case AWSDynamoDBReturnItemCollectionMetricsNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)transactItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBTransactWriteItem class]];
}

@end

@implementation AWSDynamoDBTransactWriteItemsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"consumedCapacity" : @"ConsumedCapacity",
             @"itemCollectionMetrics" : @"ItemCollectionMetrics",
             };
}

+ (NSValueTransformer *)consumedCapacityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBConsumedCapacity class]];
}

+ (NSValueTransformer *)itemCollectionMetricsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONArrayDictionary:JSONDictionary arrayElementType:@"structure" withModelClass:[AWSDynamoDBItemCollectionMetrics class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONArrayDictionaryFromMapMTLDictionary:mapMTLDictionary arrayElementType:@"structure"];
    }];
}

@end

@implementation AWSDynamoDBUntagResourceInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSDynamoDBUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conditionExpression" : @"ConditionExpression",
             @"expressionAttributeNames" : @"ExpressionAttributeNames",
             @"expressionAttributeValues" : @"ExpressionAttributeValues",
             @"key" : @"Key",
             @"returnValuesOnConditionCheckFailure" : @"ReturnValuesOnConditionCheckFailure",
             @"tableName" : @"TableName",
             @"updateExpression" : @"UpdateExpression",
             };
}

+ (NSValueTransformer *)expressionAttributeValuesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)returnValuesOnConditionCheckFailureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL_OLD"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValuesOnConditionCheckFailureAllOld);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValuesOnConditionCheckFailureNone);
        }
        return @(AWSDynamoDBReturnValuesOnConditionCheckFailureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnValuesOnConditionCheckFailureAllOld:
                return @"ALL_OLD";
            case AWSDynamoDBReturnValuesOnConditionCheckFailureNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBUpdateContinuousBackupsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pointInTimeRecoverySpecification" : @"PointInTimeRecoverySpecification",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)pointInTimeRecoverySpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBPointInTimeRecoverySpecification class]];
}

@end

@implementation AWSDynamoDBUpdateContinuousBackupsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"continuousBackupsDescription" : @"ContinuousBackupsDescription",
             };
}

+ (NSValueTransformer *)continuousBackupsDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBContinuousBackupsDescription class]];
}

@end

@implementation AWSDynamoDBUpdateContributorInsightsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contributorInsightsAction" : @"ContributorInsightsAction",
             @"indexName" : @"IndexName",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)contributorInsightsActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLE"] == NSOrderedSame) {
            return @(AWSDynamoDBContributorInsightsActionEnable);
        }
        if ([value caseInsensitiveCompare:@"DISABLE"] == NSOrderedSame) {
            return @(AWSDynamoDBContributorInsightsActionDisable);
        }
        return @(AWSDynamoDBContributorInsightsActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBContributorInsightsActionEnable:
                return @"ENABLE";
            case AWSDynamoDBContributorInsightsActionDisable:
                return @"DISABLE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBUpdateContributorInsightsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contributorInsightsStatus" : @"ContributorInsightsStatus",
             @"indexName" : @"IndexName",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)contributorInsightsStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLING"] == NSOrderedSame) {
            return @(AWSDynamoDBContributorInsightsStatusEnabling);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBContributorInsightsStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLING"] == NSOrderedSame) {
            return @(AWSDynamoDBContributorInsightsStatusDisabling);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBContributorInsightsStatusDisabled);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSDynamoDBContributorInsightsStatusFailed);
        }
        return @(AWSDynamoDBContributorInsightsStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBContributorInsightsStatusEnabling:
                return @"ENABLING";
            case AWSDynamoDBContributorInsightsStatusEnabled:
                return @"ENABLED";
            case AWSDynamoDBContributorInsightsStatusDisabling:
                return @"DISABLING";
            case AWSDynamoDBContributorInsightsStatusDisabled:
                return @"DISABLED";
            case AWSDynamoDBContributorInsightsStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBUpdateGlobalSecondaryIndexAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             @"onDemandThroughput" : @"OnDemandThroughput",
             @"provisionedThroughput" : @"ProvisionedThroughput",
             };
}

+ (NSValueTransformer *)onDemandThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBOnDemandThroughput class]];
}

+ (NSValueTransformer *)provisionedThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughput class]];
}

@end

@implementation AWSDynamoDBUpdateGlobalTableInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalTableName" : @"GlobalTableName",
             @"replicaUpdates" : @"ReplicaUpdates",
             };
}

+ (NSValueTransformer *)replicaUpdatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplicaUpdate class]];
}

@end

@implementation AWSDynamoDBUpdateGlobalTableOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalTableDescription" : @"GlobalTableDescription",
             };
}

+ (NSValueTransformer *)globalTableDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBGlobalTableDescription class]];
}

@end

@implementation AWSDynamoDBUpdateGlobalTableSettingsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalTableBillingMode" : @"GlobalTableBillingMode",
             @"globalTableGlobalSecondaryIndexSettingsUpdate" : @"GlobalTableGlobalSecondaryIndexSettingsUpdate",
             @"globalTableName" : @"GlobalTableName",
             @"globalTableProvisionedWriteCapacityAutoScalingSettingsUpdate" : @"GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate",
             @"globalTableProvisionedWriteCapacityUnits" : @"GlobalTableProvisionedWriteCapacityUnits",
             @"replicaSettingsUpdate" : @"ReplicaSettingsUpdate",
             };
}

+ (NSValueTransformer *)globalTableBillingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROVISIONED"] == NSOrderedSame) {
            return @(AWSDynamoDBBillingModeProvisioned);
        }
        if ([value caseInsensitiveCompare:@"PAY_PER_REQUEST"] == NSOrderedSame) {
            return @(AWSDynamoDBBillingModePayPerRequest);
        }
        return @(AWSDynamoDBBillingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBBillingModeProvisioned:
                return @"PROVISIONED";
            case AWSDynamoDBBillingModePayPerRequest:
                return @"PAY_PER_REQUEST";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)globalTableGlobalSecondaryIndexSettingsUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBGlobalTableGlobalSecondaryIndexSettingsUpdate class]];
}

+ (NSValueTransformer *)globalTableProvisionedWriteCapacityAutoScalingSettingsUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBAutoScalingSettingsUpdate class]];
}

+ (NSValueTransformer *)replicaSettingsUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplicaSettingsUpdate class]];
}

@end

@implementation AWSDynamoDBUpdateGlobalTableSettingsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalTableName" : @"GlobalTableName",
             @"replicaSettings" : @"ReplicaSettings",
             };
}

+ (NSValueTransformer *)replicaSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplicaSettingsDescription class]];
}

@end

@implementation AWSDynamoDBUpdateItemInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeUpdates" : @"AttributeUpdates",
             @"conditionExpression" : @"ConditionExpression",
             @"conditionalOperator" : @"ConditionalOperator",
             @"expected" : @"Expected",
             @"expressionAttributeNames" : @"ExpressionAttributeNames",
             @"expressionAttributeValues" : @"ExpressionAttributeValues",
             @"key" : @"Key",
             @"returnConsumedCapacity" : @"ReturnConsumedCapacity",
             @"returnItemCollectionMetrics" : @"ReturnItemCollectionMetrics",
             @"returnValues" : @"ReturnValues",
             @"returnValuesOnConditionCheckFailure" : @"ReturnValuesOnConditionCheckFailure",
             @"tableName" : @"TableName",
             @"updateExpression" : @"UpdateExpression",
             };
}

+ (NSValueTransformer *)attributeUpdatesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValueUpdate class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)conditionalOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AND"] == NSOrderedSame) {
            return @(AWSDynamoDBConditionalOperatorAnd);
        }
        if ([value caseInsensitiveCompare:@"OR"] == NSOrderedSame) {
            return @(AWSDynamoDBConditionalOperatorOr);
        }
        return @(AWSDynamoDBConditionalOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBConditionalOperatorAnd:
                return @"AND";
            case AWSDynamoDBConditionalOperatorOr:
                return @"OR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)expectedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBExpectedAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)expressionAttributeValuesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)returnConsumedCapacityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INDEXES"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityIndexes);
        }
        if ([value caseInsensitiveCompare:@"TOTAL"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityTotal);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityNone);
        }
        return @(AWSDynamoDBReturnConsumedCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnConsumedCapacityIndexes:
                return @"INDEXES";
            case AWSDynamoDBReturnConsumedCapacityTotal:
                return @"TOTAL";
            case AWSDynamoDBReturnConsumedCapacityNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)returnItemCollectionMetricsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SIZE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnItemCollectionMetricsSize);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnItemCollectionMetricsNone);
        }
        return @(AWSDynamoDBReturnItemCollectionMetricsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnItemCollectionMetricsSize:
                return @"SIZE";
            case AWSDynamoDBReturnItemCollectionMetricsNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)returnValuesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueNone);
        }
        if ([value caseInsensitiveCompare:@"ALL_OLD"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueAllOld);
        }
        if ([value caseInsensitiveCompare:@"UPDATED_OLD"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueUpdatedOld);
        }
        if ([value caseInsensitiveCompare:@"ALL_NEW"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueAllNew);
        }
        if ([value caseInsensitiveCompare:@"UPDATED_NEW"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueUpdatedNew);
        }
        return @(AWSDynamoDBReturnValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnValueNone:
                return @"NONE";
            case AWSDynamoDBReturnValueAllOld:
                return @"ALL_OLD";
            case AWSDynamoDBReturnValueUpdatedOld:
                return @"UPDATED_OLD";
            case AWSDynamoDBReturnValueAllNew:
                return @"ALL_NEW";
            case AWSDynamoDBReturnValueUpdatedNew:
                return @"UPDATED_NEW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)returnValuesOnConditionCheckFailureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL_OLD"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValuesOnConditionCheckFailureAllOld);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValuesOnConditionCheckFailureNone);
        }
        return @(AWSDynamoDBReturnValuesOnConditionCheckFailureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnValuesOnConditionCheckFailureAllOld:
                return @"ALL_OLD";
            case AWSDynamoDBReturnValuesOnConditionCheckFailureNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBUpdateItemOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"consumedCapacity" : @"ConsumedCapacity",
             @"itemCollectionMetrics" : @"ItemCollectionMetrics",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)consumedCapacityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBConsumedCapacity class]];
}

+ (NSValueTransformer *)itemCollectionMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBItemCollectionMetrics class]];
}

@end

@implementation AWSDynamoDBUpdateKinesisStreamingConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approximateCreationDateTimePrecision" : @"ApproximateCreationDateTimePrecision",
             };
}

+ (NSValueTransformer *)approximateCreationDateTimePrecisionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MILLISECOND"] == NSOrderedSame) {
            return @(AWSDynamoDBApproximateCreationDateTimePrecisionMillisecond);
        }
        if ([value caseInsensitiveCompare:@"MICROSECOND"] == NSOrderedSame) {
            return @(AWSDynamoDBApproximateCreationDateTimePrecisionMicrosecond);
        }
        return @(AWSDynamoDBApproximateCreationDateTimePrecisionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBApproximateCreationDateTimePrecisionMillisecond:
                return @"MILLISECOND";
            case AWSDynamoDBApproximateCreationDateTimePrecisionMicrosecond:
                return @"MICROSECOND";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBUpdateKinesisStreamingDestinationInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamArn" : @"StreamArn",
             @"tableName" : @"TableName",
             @"updateKinesisStreamingConfiguration" : @"UpdateKinesisStreamingConfiguration",
             };
}

+ (NSValueTransformer *)updateKinesisStreamingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBUpdateKinesisStreamingConfiguration class]];
}

@end

@implementation AWSDynamoDBUpdateKinesisStreamingDestinationOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationStatus" : @"DestinationStatus",
             @"streamArn" : @"StreamArn",
             @"tableName" : @"TableName",
             @"updateKinesisStreamingConfiguration" : @"UpdateKinesisStreamingConfiguration",
             };
}

+ (NSValueTransformer *)destinationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLING"] == NSOrderedSame) {
            return @(AWSDynamoDBDestinationStatusEnabling);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSDynamoDBDestinationStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DISABLING"] == NSOrderedSame) {
            return @(AWSDynamoDBDestinationStatusDisabling);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBDestinationStatusDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLE_FAILED"] == NSOrderedSame) {
            return @(AWSDynamoDBDestinationStatusEnableFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSDynamoDBDestinationStatusUpdating);
        }
        return @(AWSDynamoDBDestinationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBDestinationStatusEnabling:
                return @"ENABLING";
            case AWSDynamoDBDestinationStatusActive:
                return @"ACTIVE";
            case AWSDynamoDBDestinationStatusDisabling:
                return @"DISABLING";
            case AWSDynamoDBDestinationStatusDisabled:
                return @"DISABLED";
            case AWSDynamoDBDestinationStatusEnableFailed:
                return @"ENABLE_FAILED";
            case AWSDynamoDBDestinationStatusUpdating:
                return @"UPDATING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)updateKinesisStreamingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBUpdateKinesisStreamingConfiguration class]];
}

@end

@implementation AWSDynamoDBUpdateReplicationGroupMemberAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalSecondaryIndexes" : @"GlobalSecondaryIndexes",
             @"KMSMasterKeyId" : @"KMSMasterKeyId",
             @"onDemandThroughputOverride" : @"OnDemandThroughputOverride",
             @"provisionedThroughputOverride" : @"ProvisionedThroughputOverride",
             @"regionName" : @"RegionName",
             @"tableClassOverride" : @"TableClassOverride",
             };
}

+ (NSValueTransformer *)globalSecondaryIndexesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplicaGlobalSecondaryIndex class]];
}

+ (NSValueTransformer *)onDemandThroughputOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBOnDemandThroughputOverride class]];
}

+ (NSValueTransformer *)provisionedThroughputOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughputOverride class]];
}

+ (NSValueTransformer *)tableClassOverrideJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSDynamoDBTableClassStandard);
        }
        if ([value caseInsensitiveCompare:@"STANDARD_INFREQUENT_ACCESS"] == NSOrderedSame) {
            return @(AWSDynamoDBTableClassStandardInfrequentAccess);
        }
        return @(AWSDynamoDBTableClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBTableClassStandard:
                return @"STANDARD";
            case AWSDynamoDBTableClassStandardInfrequentAccess:
                return @"STANDARD_INFREQUENT_ACCESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBUpdateTableInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeDefinitions" : @"AttributeDefinitions",
             @"billingMode" : @"BillingMode",
             @"deletionProtectionEnabled" : @"DeletionProtectionEnabled",
             @"globalSecondaryIndexUpdates" : @"GlobalSecondaryIndexUpdates",
             @"onDemandThroughput" : @"OnDemandThroughput",
             @"provisionedThroughput" : @"ProvisionedThroughput",
             @"replicaUpdates" : @"ReplicaUpdates",
             @"SSESpecification" : @"SSESpecification",
             @"streamSpecification" : @"StreamSpecification",
             @"tableClass" : @"TableClass",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)attributeDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBAttributeDefinition class]];
}

+ (NSValueTransformer *)billingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROVISIONED"] == NSOrderedSame) {
            return @(AWSDynamoDBBillingModeProvisioned);
        }
        if ([value caseInsensitiveCompare:@"PAY_PER_REQUEST"] == NSOrderedSame) {
            return @(AWSDynamoDBBillingModePayPerRequest);
        }
        return @(AWSDynamoDBBillingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBBillingModeProvisioned:
                return @"PROVISIONED";
            case AWSDynamoDBBillingModePayPerRequest:
                return @"PAY_PER_REQUEST";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)globalSecondaryIndexUpdatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBGlobalSecondaryIndexUpdate class]];
}

+ (NSValueTransformer *)onDemandThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBOnDemandThroughput class]];
}

+ (NSValueTransformer *)provisionedThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughput class]];
}

+ (NSValueTransformer *)replicaUpdatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplicationGroupUpdate class]];
}

+ (NSValueTransformer *)SSESpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBSSESpecification class]];
}

+ (NSValueTransformer *)streamSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBStreamSpecification class]];
}

+ (NSValueTransformer *)tableClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSDynamoDBTableClassStandard);
        }
        if ([value caseInsensitiveCompare:@"STANDARD_INFREQUENT_ACCESS"] == NSOrderedSame) {
            return @(AWSDynamoDBTableClassStandardInfrequentAccess);
        }
        return @(AWSDynamoDBTableClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBTableClassStandard:
                return @"STANDARD";
            case AWSDynamoDBTableClassStandardInfrequentAccess:
                return @"STANDARD_INFREQUENT_ACCESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBUpdateTableOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableDescription" : @"TableDescription",
             };
}

+ (NSValueTransformer *)tableDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTableDescription class]];
}

@end

@implementation AWSDynamoDBUpdateTableReplicaAutoScalingInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalSecondaryIndexUpdates" : @"GlobalSecondaryIndexUpdates",
             @"provisionedWriteCapacityAutoScalingUpdate" : @"ProvisionedWriteCapacityAutoScalingUpdate",
             @"replicaUpdates" : @"ReplicaUpdates",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)globalSecondaryIndexUpdatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBGlobalSecondaryIndexAutoScalingUpdate class]];
}

+ (NSValueTransformer *)provisionedWriteCapacityAutoScalingUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBAutoScalingSettingsUpdate class]];
}

+ (NSValueTransformer *)replicaUpdatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplicaAutoScalingUpdate class]];
}

@end

@implementation AWSDynamoDBUpdateTableReplicaAutoScalingOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableAutoScalingDescription" : @"TableAutoScalingDescription",
             };
}

+ (NSValueTransformer *)tableAutoScalingDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTableAutoScalingDescription class]];
}

@end

@implementation AWSDynamoDBUpdateTimeToLiveInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableName" : @"TableName",
             @"timeToLiveSpecification" : @"TimeToLiveSpecification",
             };
}

+ (NSValueTransformer *)timeToLiveSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTimeToLiveSpecification class]];
}

@end

@implementation AWSDynamoDBUpdateTimeToLiveOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"timeToLiveSpecification" : @"TimeToLiveSpecification",
             };
}

+ (NSValueTransformer *)timeToLiveSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTimeToLiveSpecification class]];
}

@end

@implementation AWSDynamoDBWriteRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleteRequest" : @"DeleteRequest",
             @"putRequest" : @"PutRequest",
             };
}

+ (NSValueTransformer *)deleteRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBDeleteRequest class]];
}

+ (NSValueTransformer *)putRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBPutRequest class]];
}

@end
