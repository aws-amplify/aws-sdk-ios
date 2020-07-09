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

#import "AWSSecretsManagerModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSSecretsManagerErrorDomain = @"com.amazonaws.AWSSecretsManagerErrorDomain";

@implementation AWSSecretsManagerCancelRotateSecretRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"secretId" : @"SecretId",
             };
}

@end

@implementation AWSSecretsManagerCancelRotateSecretResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"name" : @"Name",
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSSecretsManagerCreateSecretRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"detail" : @"Description",
             @"kmsKeyId" : @"KmsKeyId",
             @"name" : @"Name",
             @"secretBinary" : @"SecretBinary",
             @"secretString" : @"SecretString",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecretsManagerTag class]];
}

@end

@implementation AWSSecretsManagerCreateSecretResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"name" : @"Name",
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSSecretsManagerDeleteResourcePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"secretId" : @"SecretId",
             };
}

@end

@implementation AWSSecretsManagerDeleteResourcePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"name" : @"Name",
             };
}

@end

@implementation AWSSecretsManagerDeleteSecretRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"forceDeleteWithoutRecovery" : @"ForceDeleteWithoutRecovery",
             @"recoveryWindowInDays" : @"RecoveryWindowInDays",
             @"secretId" : @"SecretId",
             };
}

@end

@implementation AWSSecretsManagerDeleteSecretResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"deletionDate" : @"DeletionDate",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)deletionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSecretsManagerDescribeSecretRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"secretId" : @"SecretId",
             };
}

@end

@implementation AWSSecretsManagerDescribeSecretResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"createdDate" : @"CreatedDate",
             @"deletedDate" : @"DeletedDate",
             @"detail" : @"Description",
             @"kmsKeyId" : @"KmsKeyId",
             @"lastAccessedDate" : @"LastAccessedDate",
             @"lastChangedDate" : @"LastChangedDate",
             @"lastRotatedDate" : @"LastRotatedDate",
             @"name" : @"Name",
             @"owningService" : @"OwningService",
             @"rotationEnabled" : @"RotationEnabled",
             @"rotationLambdaARN" : @"RotationLambdaARN",
             @"rotationRules" : @"RotationRules",
             @"tags" : @"Tags",
             @"versionIdsToStages" : @"VersionIdsToStages",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)deletedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastAccessedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastChangedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastRotatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)rotationRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecretsManagerRotationRulesType class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecretsManagerTag class]];
}

@end

@implementation AWSSecretsManagerFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"description"] == NSOrderedSame) {
            return @(AWSSecretsManagerFilterNameStringTypeDescription);
        }
        if ([value caseInsensitiveCompare:@"name"] == NSOrderedSame) {
            return @(AWSSecretsManagerFilterNameStringTypeName);
        }
        if ([value caseInsensitiveCompare:@"tag-key"] == NSOrderedSame) {
            return @(AWSSecretsManagerFilterNameStringTypeTagKey);
        }
        if ([value caseInsensitiveCompare:@"tag-value"] == NSOrderedSame) {
            return @(AWSSecretsManagerFilterNameStringTypeTagValue);
        }
        if ([value caseInsensitiveCompare:@"all"] == NSOrderedSame) {
            return @(AWSSecretsManagerFilterNameStringTypeAll);
        }
        return @(AWSSecretsManagerFilterNameStringTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecretsManagerFilterNameStringTypeDescription:
                return @"description";
            case AWSSecretsManagerFilterNameStringTypeName:
                return @"name";
            case AWSSecretsManagerFilterNameStringTypeTagKey:
                return @"tag-key";
            case AWSSecretsManagerFilterNameStringTypeTagValue:
                return @"tag-value";
            case AWSSecretsManagerFilterNameStringTypeAll:
                return @"all";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSecretsManagerGetRandomPasswordRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"excludeCharacters" : @"ExcludeCharacters",
             @"excludeLowercase" : @"ExcludeLowercase",
             @"excludeNumbers" : @"ExcludeNumbers",
             @"excludePunctuation" : @"ExcludePunctuation",
             @"excludeUppercase" : @"ExcludeUppercase",
             @"includeSpace" : @"IncludeSpace",
             @"passwordLength" : @"PasswordLength",
             @"requireEachIncludedType" : @"RequireEachIncludedType",
             };
}

@end

@implementation AWSSecretsManagerGetRandomPasswordResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"randomPassword" : @"RandomPassword",
             };
}

@end

@implementation AWSSecretsManagerGetResourcePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"secretId" : @"SecretId",
             };
}

@end

@implementation AWSSecretsManagerGetResourcePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"name" : @"Name",
             @"resourcePolicy" : @"ResourcePolicy",
             };
}

@end

@implementation AWSSecretsManagerGetSecretValueRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"secretId" : @"SecretId",
             @"versionId" : @"VersionId",
             @"versionStage" : @"VersionStage",
             };
}

@end

@implementation AWSSecretsManagerGetSecretValueResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"createdDate" : @"CreatedDate",
             @"name" : @"Name",
             @"secretBinary" : @"SecretBinary",
             @"secretString" : @"SecretString",
             @"versionId" : @"VersionId",
             @"versionStages" : @"VersionStages",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSecretsManagerListSecretVersionIdsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"includeDeprecated" : @"IncludeDeprecated",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"secretId" : @"SecretId",
             };
}

@end

@implementation AWSSecretsManagerListSecretVersionIdsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"name" : @"Name",
             @"nextToken" : @"NextToken",
             @"versions" : @"Versions",
             };
}

+ (NSValueTransformer *)versionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecretsManagerSecretVersionsListEntry class]];
}

@end

@implementation AWSSecretsManagerListSecretsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortOrder" : @"SortOrder",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecretsManagerFilter class]];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"asc"] == NSOrderedSame) {
            return @(AWSSecretsManagerSortOrderTypeAsc);
        }
        if ([value caseInsensitiveCompare:@"desc"] == NSOrderedSame) {
            return @(AWSSecretsManagerSortOrderTypeDesc);
        }
        return @(AWSSecretsManagerSortOrderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSecretsManagerSortOrderTypeAsc:
                return @"asc";
            case AWSSecretsManagerSortOrderTypeDesc:
                return @"desc";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSecretsManagerListSecretsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"secretList" : @"SecretList",
             };
}

+ (NSValueTransformer *)secretListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecretsManagerSecretListEntry class]];
}

@end

@implementation AWSSecretsManagerPutResourcePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blockPublicPolicy" : @"BlockPublicPolicy",
             @"resourcePolicy" : @"ResourcePolicy",
             @"secretId" : @"SecretId",
             };
}

@end

@implementation AWSSecretsManagerPutResourcePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"name" : @"Name",
             };
}

@end

@implementation AWSSecretsManagerPutSecretValueRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"secretBinary" : @"SecretBinary",
             @"secretId" : @"SecretId",
             @"secretString" : @"SecretString",
             @"versionStages" : @"VersionStages",
             };
}

@end

@implementation AWSSecretsManagerPutSecretValueResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"name" : @"Name",
             @"versionId" : @"VersionId",
             @"versionStages" : @"VersionStages",
             };
}

@end

@implementation AWSSecretsManagerRestoreSecretRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"secretId" : @"SecretId",
             };
}

@end

@implementation AWSSecretsManagerRestoreSecretResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"name" : @"Name",
             };
}

@end

@implementation AWSSecretsManagerRotateSecretRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"rotationLambdaARN" : @"RotationLambdaARN",
             @"rotationRules" : @"RotationRules",
             @"secretId" : @"SecretId",
             };
}

+ (NSValueTransformer *)rotationRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecretsManagerRotationRulesType class]];
}

@end

@implementation AWSSecretsManagerRotateSecretResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"name" : @"Name",
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSSecretsManagerRotationRulesType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automaticallyAfterDays" : @"AutomaticallyAfterDays",
             };
}

@end

@implementation AWSSecretsManagerSecretListEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"createdDate" : @"CreatedDate",
             @"deletedDate" : @"DeletedDate",
             @"detail" : @"Description",
             @"kmsKeyId" : @"KmsKeyId",
             @"lastAccessedDate" : @"LastAccessedDate",
             @"lastChangedDate" : @"LastChangedDate",
             @"lastRotatedDate" : @"LastRotatedDate",
             @"name" : @"Name",
             @"owningService" : @"OwningService",
             @"rotationEnabled" : @"RotationEnabled",
             @"rotationLambdaARN" : @"RotationLambdaARN",
             @"rotationRules" : @"RotationRules",
             @"secretVersionsToStages" : @"SecretVersionsToStages",
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

+ (NSValueTransformer *)deletedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastAccessedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastChangedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastRotatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)rotationRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSecretsManagerRotationRulesType class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecretsManagerTag class]];
}

@end

@implementation AWSSecretsManagerSecretVersionsListEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdDate" : @"CreatedDate",
             @"lastAccessedDate" : @"LastAccessedDate",
             @"versionId" : @"VersionId",
             @"versionStages" : @"VersionStages",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastAccessedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSecretsManagerTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSSecretsManagerTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"secretId" : @"SecretId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecretsManagerTag class]];
}

@end

@implementation AWSSecretsManagerUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"secretId" : @"SecretId",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSSecretsManagerUpdateSecretRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"detail" : @"Description",
             @"kmsKeyId" : @"KmsKeyId",
             @"secretBinary" : @"SecretBinary",
             @"secretId" : @"SecretId",
             @"secretString" : @"SecretString",
             };
}

@end

@implementation AWSSecretsManagerUpdateSecretResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"name" : @"Name",
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSSecretsManagerUpdateSecretVersionStageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"moveToVersionId" : @"MoveToVersionId",
             @"removeFromVersionId" : @"RemoveFromVersionId",
             @"secretId" : @"SecretId",
             @"versionStage" : @"VersionStage",
             };
}

@end

@implementation AWSSecretsManagerUpdateSecretVersionStageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"name" : @"Name",
             };
}

@end

@implementation AWSSecretsManagerValidateResourcePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourcePolicy" : @"ResourcePolicy",
             @"secretId" : @"SecretId",
             };
}

@end

@implementation AWSSecretsManagerValidateResourcePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyValidationPassed" : @"PolicyValidationPassed",
             @"validationErrors" : @"ValidationErrors",
             };
}

+ (NSValueTransformer *)validationErrorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSecretsManagerValidationErrorsEntry class]];
}

@end

@implementation AWSSecretsManagerValidationErrorsEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkName" : @"CheckName",
             @"errorMessage" : @"ErrorMessage",
             };
}

@end
