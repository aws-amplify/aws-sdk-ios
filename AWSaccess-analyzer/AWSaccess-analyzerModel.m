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

#import "AWSaccess-analyzerModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSaccess-analyzerErrorDomain = @"com.amazonaws.AWSaccess-analyzerErrorDomain";

@implementation AWSaccess-analyzerAnalyzedResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actions" : @"actions",
             @"analyzedAt" : @"analyzedAt",
             @"createdAt" : @"createdAt",
             @"error" : @"error",
             @"isPublic" : @"isPublic",
             @"resourceArn" : @"resourceArn",
             @"resourceOwnerAccount" : @"resourceOwnerAccount",
             @"resourceType" : @"resourceType",
             @"sharedVia" : @"sharedVia",
             @"status" : @"status",
             @"updatedAt" : @"updatedAt",
             };
}

+ (NSValueTransformer *)analyzedAtJSONTransformer {
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

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS::IAM::Role"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSIAMRole);
        }
        if ([value caseInsensitiveCompare:@"AWS::KMS::Key"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSKMSKey);
        }
        if ([value caseInsensitiveCompare:@"AWS::Lambda::Function"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSLambdaFunction);
        }
        if ([value caseInsensitiveCompare:@"AWS::Lambda::LayerVersion"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSLambdaLayerVersion);
        }
        if ([value caseInsensitiveCompare:@"AWS::S3::Bucket"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSS3Bucket);
        }
        if ([value caseInsensitiveCompare:@"AWS::SQS::Queue"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSSQSQueue);
        }
        return @(AWSaccess-analyzerResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSaccess-analyzerResourceTypeAWSIAMRole:
                return @"AWS::IAM::Role";
            case AWSaccess-analyzerResourceTypeAWSKMSKey:
                return @"AWS::KMS::Key";
            case AWSaccess-analyzerResourceTypeAWSLambdaFunction:
                return @"AWS::Lambda::Function";
            case AWSaccess-analyzerResourceTypeAWSLambdaLayerVersion:
                return @"AWS::Lambda::LayerVersion";
            case AWSaccess-analyzerResourceTypeAWSS3Bucket:
                return @"AWS::S3::Bucket";
            case AWSaccess-analyzerResourceTypeAWSSQSQueue:
                return @"AWS::SQS::Queue";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSaccess-analyzerFindingStatusActive);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVED"] == NSOrderedSame) {
            return @(AWSaccess-analyzerFindingStatusArchived);
        }
        if ([value caseInsensitiveCompare:@"RESOLVED"] == NSOrderedSame) {
            return @(AWSaccess-analyzerFindingStatusResolved);
        }
        return @(AWSaccess-analyzerFindingStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSaccess-analyzerFindingStatusActive:
                return @"ACTIVE";
            case AWSaccess-analyzerFindingStatusArchived:
                return @"ARCHIVED";
            case AWSaccess-analyzerFindingStatusResolved:
                return @"RESOLVED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)updatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSaccess-analyzerAnalyzedResourceSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"resourceOwnerAccount" : @"resourceOwnerAccount",
             @"resourceType" : @"resourceType",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS::IAM::Role"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSIAMRole);
        }
        if ([value caseInsensitiveCompare:@"AWS::KMS::Key"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSKMSKey);
        }
        if ([value caseInsensitiveCompare:@"AWS::Lambda::Function"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSLambdaFunction);
        }
        if ([value caseInsensitiveCompare:@"AWS::Lambda::LayerVersion"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSLambdaLayerVersion);
        }
        if ([value caseInsensitiveCompare:@"AWS::S3::Bucket"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSS3Bucket);
        }
        if ([value caseInsensitiveCompare:@"AWS::SQS::Queue"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSSQSQueue);
        }
        return @(AWSaccess-analyzerResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSaccess-analyzerResourceTypeAWSIAMRole:
                return @"AWS::IAM::Role";
            case AWSaccess-analyzerResourceTypeAWSKMSKey:
                return @"AWS::KMS::Key";
            case AWSaccess-analyzerResourceTypeAWSLambdaFunction:
                return @"AWS::Lambda::Function";
            case AWSaccess-analyzerResourceTypeAWSLambdaLayerVersion:
                return @"AWS::Lambda::LayerVersion";
            case AWSaccess-analyzerResourceTypeAWSS3Bucket:
                return @"AWS::S3::Bucket";
            case AWSaccess-analyzerResourceTypeAWSSQSQueue:
                return @"AWS::SQS::Queue";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSaccess-analyzerAnalyzerSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"createdAt" : @"createdAt",
             @"lastResourceAnalyzed" : @"lastResourceAnalyzed",
             @"lastResourceAnalyzedAt" : @"lastResourceAnalyzedAt",
             @"name" : @"name",
             @"status" : @"status",
             @"statusReason" : @"statusReason",
             @"tags" : @"tags",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastResourceAnalyzedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSaccess-analyzerAnalyzerStatusActive);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSaccess-analyzerAnalyzerStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSaccess-analyzerAnalyzerStatusDisabled);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSaccess-analyzerAnalyzerStatusFailed);
        }
        return @(AWSaccess-analyzerAnalyzerStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSaccess-analyzerAnalyzerStatusActive:
                return @"ACTIVE";
            case AWSaccess-analyzerAnalyzerStatusCreating:
                return @"CREATING";
            case AWSaccess-analyzerAnalyzerStatusDisabled:
                return @"DISABLED";
            case AWSaccess-analyzerAnalyzerStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusReasonJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSaccess-analyzerStatusReason class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACCOUNT"] == NSOrderedSame) {
            return @(AWSaccess-analyzerTypesAccount);
        }
        if ([value caseInsensitiveCompare:@"ORGANIZATION"] == NSOrderedSame) {
            return @(AWSaccess-analyzerTypesOrganization);
        }
        return @(AWSaccess-analyzerTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSaccess-analyzerTypesAccount:
                return @"ACCOUNT";
            case AWSaccess-analyzerTypesOrganization:
                return @"ORGANIZATION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSaccess-analyzerArchiveRuleSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAt" : @"createdAt",
             @"filter" : @"filter",
             @"ruleName" : @"ruleName",
             @"updatedAt" : @"updatedAt",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSaccess-analyzerCriterion class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)updatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSaccess-analyzerCreateAnalyzerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyzerName" : @"analyzerName",
             @"archiveRules" : @"archiveRules",
             @"clientToken" : @"clientToken",
             @"tags" : @"tags",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)archiveRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSaccess-analyzerInlineArchiveRule class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACCOUNT"] == NSOrderedSame) {
            return @(AWSaccess-analyzerTypesAccount);
        }
        if ([value caseInsensitiveCompare:@"ORGANIZATION"] == NSOrderedSame) {
            return @(AWSaccess-analyzerTypesOrganization);
        }
        return @(AWSaccess-analyzerTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSaccess-analyzerTypesAccount:
                return @"ACCOUNT";
            case AWSaccess-analyzerTypesOrganization:
                return @"ORGANIZATION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSaccess-analyzerCreateAnalyzerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             };
}

@end

@implementation AWSaccess-analyzerCreateArchiveRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyzerName" : @"analyzerName",
             @"clientToken" : @"clientToken",
             @"filter" : @"filter",
             @"ruleName" : @"ruleName",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSaccess-analyzerCriterion class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSaccess-analyzerCriterion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contains" : @"contains",
             @"eq" : @"eq",
             @"exists" : @"exists",
             @"neq" : @"neq",
             };
}

@end

@implementation AWSaccess-analyzerDeleteAnalyzerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyzerName" : @"analyzerName",
             @"clientToken" : @"clientToken",
             };
}

@end

@implementation AWSaccess-analyzerDeleteArchiveRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyzerName" : @"analyzerName",
             @"clientToken" : @"clientToken",
             @"ruleName" : @"ruleName",
             };
}

@end

@implementation AWSaccess-analyzerFinding

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"action",
             @"analyzedAt" : @"analyzedAt",
             @"condition" : @"condition",
             @"createdAt" : @"createdAt",
             @"error" : @"error",
             @"identifier" : @"id",
             @"isPublic" : @"isPublic",
             @"principal" : @"principal",
             @"resource" : @"resource",
             @"resourceOwnerAccount" : @"resourceOwnerAccount",
             @"resourceType" : @"resourceType",
             @"sources" : @"sources",
             @"status" : @"status",
             @"updatedAt" : @"updatedAt",
             };
}

+ (NSValueTransformer *)analyzedAtJSONTransformer {
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

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS::IAM::Role"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSIAMRole);
        }
        if ([value caseInsensitiveCompare:@"AWS::KMS::Key"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSKMSKey);
        }
        if ([value caseInsensitiveCompare:@"AWS::Lambda::Function"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSLambdaFunction);
        }
        if ([value caseInsensitiveCompare:@"AWS::Lambda::LayerVersion"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSLambdaLayerVersion);
        }
        if ([value caseInsensitiveCompare:@"AWS::S3::Bucket"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSS3Bucket);
        }
        if ([value caseInsensitiveCompare:@"AWS::SQS::Queue"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSSQSQueue);
        }
        return @(AWSaccess-analyzerResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSaccess-analyzerResourceTypeAWSIAMRole:
                return @"AWS::IAM::Role";
            case AWSaccess-analyzerResourceTypeAWSKMSKey:
                return @"AWS::KMS::Key";
            case AWSaccess-analyzerResourceTypeAWSLambdaFunction:
                return @"AWS::Lambda::Function";
            case AWSaccess-analyzerResourceTypeAWSLambdaLayerVersion:
                return @"AWS::Lambda::LayerVersion";
            case AWSaccess-analyzerResourceTypeAWSS3Bucket:
                return @"AWS::S3::Bucket";
            case AWSaccess-analyzerResourceTypeAWSSQSQueue:
                return @"AWS::SQS::Queue";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSaccess-analyzerFindingSource class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSaccess-analyzerFindingStatusActive);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVED"] == NSOrderedSame) {
            return @(AWSaccess-analyzerFindingStatusArchived);
        }
        if ([value caseInsensitiveCompare:@"RESOLVED"] == NSOrderedSame) {
            return @(AWSaccess-analyzerFindingStatusResolved);
        }
        return @(AWSaccess-analyzerFindingStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSaccess-analyzerFindingStatusActive:
                return @"ACTIVE";
            case AWSaccess-analyzerFindingStatusArchived:
                return @"ARCHIVED";
            case AWSaccess-analyzerFindingStatusResolved:
                return @"RESOLVED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)updatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSaccess-analyzerFindingSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"detail",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)detailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSaccess-analyzerFindingSourceDetail class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BUCKET_ACL"] == NSOrderedSame) {
            return @(AWSaccess-analyzerFindingSourceTypeBucketAcl);
        }
        if ([value caseInsensitiveCompare:@"POLICY"] == NSOrderedSame) {
            return @(AWSaccess-analyzerFindingSourceTypePolicy);
        }
        if ([value caseInsensitiveCompare:@"S3_ACCESS_POINT"] == NSOrderedSame) {
            return @(AWSaccess-analyzerFindingSourceTypeS3AccessPoint);
        }
        return @(AWSaccess-analyzerFindingSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSaccess-analyzerFindingSourceTypeBucketAcl:
                return @"BUCKET_ACL";
            case AWSaccess-analyzerFindingSourceTypePolicy:
                return @"POLICY";
            case AWSaccess-analyzerFindingSourceTypeS3AccessPoint:
                return @"S3_ACCESS_POINT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSaccess-analyzerFindingSourceDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPointArn" : @"accessPointArn",
             };
}

@end

@implementation AWSaccess-analyzerFindingSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"action",
             @"analyzedAt" : @"analyzedAt",
             @"condition" : @"condition",
             @"createdAt" : @"createdAt",
             @"error" : @"error",
             @"identifier" : @"id",
             @"isPublic" : @"isPublic",
             @"principal" : @"principal",
             @"resource" : @"resource",
             @"resourceOwnerAccount" : @"resourceOwnerAccount",
             @"resourceType" : @"resourceType",
             @"sources" : @"sources",
             @"status" : @"status",
             @"updatedAt" : @"updatedAt",
             };
}

+ (NSValueTransformer *)analyzedAtJSONTransformer {
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

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS::IAM::Role"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSIAMRole);
        }
        if ([value caseInsensitiveCompare:@"AWS::KMS::Key"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSKMSKey);
        }
        if ([value caseInsensitiveCompare:@"AWS::Lambda::Function"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSLambdaFunction);
        }
        if ([value caseInsensitiveCompare:@"AWS::Lambda::LayerVersion"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSLambdaLayerVersion);
        }
        if ([value caseInsensitiveCompare:@"AWS::S3::Bucket"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSS3Bucket);
        }
        if ([value caseInsensitiveCompare:@"AWS::SQS::Queue"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSSQSQueue);
        }
        return @(AWSaccess-analyzerResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSaccess-analyzerResourceTypeAWSIAMRole:
                return @"AWS::IAM::Role";
            case AWSaccess-analyzerResourceTypeAWSKMSKey:
                return @"AWS::KMS::Key";
            case AWSaccess-analyzerResourceTypeAWSLambdaFunction:
                return @"AWS::Lambda::Function";
            case AWSaccess-analyzerResourceTypeAWSLambdaLayerVersion:
                return @"AWS::Lambda::LayerVersion";
            case AWSaccess-analyzerResourceTypeAWSS3Bucket:
                return @"AWS::S3::Bucket";
            case AWSaccess-analyzerResourceTypeAWSSQSQueue:
                return @"AWS::SQS::Queue";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSaccess-analyzerFindingSource class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSaccess-analyzerFindingStatusActive);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVED"] == NSOrderedSame) {
            return @(AWSaccess-analyzerFindingStatusArchived);
        }
        if ([value caseInsensitiveCompare:@"RESOLVED"] == NSOrderedSame) {
            return @(AWSaccess-analyzerFindingStatusResolved);
        }
        return @(AWSaccess-analyzerFindingStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSaccess-analyzerFindingStatusActive:
                return @"ACTIVE";
            case AWSaccess-analyzerFindingStatusArchived:
                return @"ARCHIVED";
            case AWSaccess-analyzerFindingStatusResolved:
                return @"RESOLVED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)updatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSaccess-analyzerGetAnalyzedResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyzerArn" : @"analyzerArn",
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSaccess-analyzerGetAnalyzedResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resource" : @"resource",
             };
}

+ (NSValueTransformer *)resourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSaccess-analyzerAnalyzedResource class]];
}

@end

@implementation AWSaccess-analyzerGetAnalyzerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyzerName" : @"analyzerName",
             };
}

@end

@implementation AWSaccess-analyzerGetAnalyzerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyzer" : @"analyzer",
             };
}

+ (NSValueTransformer *)analyzerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSaccess-analyzerAnalyzerSummary class]];
}

@end

@implementation AWSaccess-analyzerGetArchiveRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyzerName" : @"analyzerName",
             @"ruleName" : @"ruleName",
             };
}

@end

@implementation AWSaccess-analyzerGetArchiveRuleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"archiveRule" : @"archiveRule",
             };
}

+ (NSValueTransformer *)archiveRuleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSaccess-analyzerArchiveRuleSummary class]];
}

@end

@implementation AWSaccess-analyzerGetFindingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyzerArn" : @"analyzerArn",
             @"identifier" : @"id",
             };
}

@end

@implementation AWSaccess-analyzerGetFindingResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"finding" : @"finding",
             };
}

+ (NSValueTransformer *)findingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSaccess-analyzerFinding class]];
}

@end

@implementation AWSaccess-analyzerInlineArchiveRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"filter",
             @"ruleName" : @"ruleName",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSaccess-analyzerCriterion class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSaccess-analyzerListAnalyzedResourcesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyzerArn" : @"analyzerArn",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"resourceType" : @"resourceType",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS::IAM::Role"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSIAMRole);
        }
        if ([value caseInsensitiveCompare:@"AWS::KMS::Key"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSKMSKey);
        }
        if ([value caseInsensitiveCompare:@"AWS::Lambda::Function"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSLambdaFunction);
        }
        if ([value caseInsensitiveCompare:@"AWS::Lambda::LayerVersion"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSLambdaLayerVersion);
        }
        if ([value caseInsensitiveCompare:@"AWS::S3::Bucket"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSS3Bucket);
        }
        if ([value caseInsensitiveCompare:@"AWS::SQS::Queue"] == NSOrderedSame) {
            return @(AWSaccess-analyzerResourceTypeAWSSQSQueue);
        }
        return @(AWSaccess-analyzerResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSaccess-analyzerResourceTypeAWSIAMRole:
                return @"AWS::IAM::Role";
            case AWSaccess-analyzerResourceTypeAWSKMSKey:
                return @"AWS::KMS::Key";
            case AWSaccess-analyzerResourceTypeAWSLambdaFunction:
                return @"AWS::Lambda::Function";
            case AWSaccess-analyzerResourceTypeAWSLambdaLayerVersion:
                return @"AWS::Lambda::LayerVersion";
            case AWSaccess-analyzerResourceTypeAWSS3Bucket:
                return @"AWS::S3::Bucket";
            case AWSaccess-analyzerResourceTypeAWSSQSQueue:
                return @"AWS::SQS::Queue";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSaccess-analyzerListAnalyzedResourcesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyzedResources" : @"analyzedResources",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)analyzedResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSaccess-analyzerAnalyzedResourceSummary class]];
}

@end

@implementation AWSaccess-analyzerListAnalyzersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACCOUNT"] == NSOrderedSame) {
            return @(AWSaccess-analyzerTypesAccount);
        }
        if ([value caseInsensitiveCompare:@"ORGANIZATION"] == NSOrderedSame) {
            return @(AWSaccess-analyzerTypesOrganization);
        }
        return @(AWSaccess-analyzerTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSaccess-analyzerTypesAccount:
                return @"ACCOUNT";
            case AWSaccess-analyzerTypesOrganization:
                return @"ORGANIZATION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSaccess-analyzerListAnalyzersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyzers" : @"analyzers",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)analyzersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSaccess-analyzerAnalyzerSummary class]];
}

@end

@implementation AWSaccess-analyzerListArchiveRulesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyzerName" : @"analyzerName",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSaccess-analyzerListArchiveRulesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"archiveRules" : @"archiveRules",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)archiveRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSaccess-analyzerArchiveRuleSummary class]];
}

@end

@implementation AWSaccess-analyzerListFindingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyzerArn" : @"analyzerArn",
             @"filter" : @"filter",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"sort" : @"sort",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSaccess-analyzerCriterion class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)sortJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSaccess-analyzerSortCriteria class]];
}

@end

@implementation AWSaccess-analyzerListFindingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findings" : @"findings",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)findingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSaccess-analyzerFindingSummary class]];
}

@end

@implementation AWSaccess-analyzerListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSaccess-analyzerListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"tags",
             };
}

@end

@implementation AWSaccess-analyzerSortCriteria

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"attributeName",
             @"orderBy" : @"orderBy",
             };
}

+ (NSValueTransformer *)orderByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASC"] == NSOrderedSame) {
            return @(AWSaccess-analyzerOrderByAsc);
        }
        if ([value caseInsensitiveCompare:@"DESC"] == NSOrderedSame) {
            return @(AWSaccess-analyzerOrderByDesc);
        }
        return @(AWSaccess-analyzerOrderByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSaccess-analyzerOrderByAsc:
                return @"ASC";
            case AWSaccess-analyzerOrderByDesc:
                return @"DESC";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSaccess-analyzerStartResourceScanRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyzerArn" : @"analyzerArn",
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSaccess-analyzerStatusReason

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"code",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS_SERVICE_ACCESS_DISABLED"] == NSOrderedSame) {
            return @(AWSaccess-analyzerReasonCodeAwsServiceAccessDisabled);
        }
        if ([value caseInsensitiveCompare:@"DELEGATED_ADMINISTRATOR_DEREGISTERED"] == NSOrderedSame) {
            return @(AWSaccess-analyzerReasonCodeDelegatedAdministratorDeregistered);
        }
        if ([value caseInsensitiveCompare:@"ORGANIZATION_DELETED"] == NSOrderedSame) {
            return @(AWSaccess-analyzerReasonCodeOrganizationDeleted);
        }
        if ([value caseInsensitiveCompare:@"SERVICE_LINKED_ROLE_CREATION_FAILED"] == NSOrderedSame) {
            return @(AWSaccess-analyzerReasonCodeServiceLinkedRoleCreationFailed);
        }
        return @(AWSaccess-analyzerReasonCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSaccess-analyzerReasonCodeAwsServiceAccessDisabled:
                return @"AWS_SERVICE_ACCESS_DISABLED";
            case AWSaccess-analyzerReasonCodeDelegatedAdministratorDeregistered:
                return @"DELEGATED_ADMINISTRATOR_DEREGISTERED";
            case AWSaccess-analyzerReasonCodeOrganizationDeleted:
                return @"ORGANIZATION_DELETED";
            case AWSaccess-analyzerReasonCodeServiceLinkedRoleCreationFailed:
                return @"SERVICE_LINKED_ROLE_CREATION_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSaccess-analyzerTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSaccess-analyzerTagResourceResponse

@end

@implementation AWSaccess-analyzerUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tagKeys" : @"tagKeys",
             };
}

@end

@implementation AWSaccess-analyzerUntagResourceResponse

@end

@implementation AWSaccess-analyzerUpdateArchiveRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyzerName" : @"analyzerName",
             @"clientToken" : @"clientToken",
             @"filter" : @"filter",
             @"ruleName" : @"ruleName",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSaccess-analyzerCriterion class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSaccess-analyzerUpdateFindingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyzerArn" : @"analyzerArn",
             @"clientToken" : @"clientToken",
             @"ids" : @"ids",
             @"resourceArn" : @"resourceArn",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSaccess-analyzerFindingStatusUpdateActive);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVED"] == NSOrderedSame) {
            return @(AWSaccess-analyzerFindingStatusUpdateArchived);
        }
        return @(AWSaccess-analyzerFindingStatusUpdateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSaccess-analyzerFindingStatusUpdateActive:
                return @"ACTIVE";
            case AWSaccess-analyzerFindingStatusUpdateArchived:
                return @"ARCHIVED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSaccess-analyzerValidationExceptionField

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"message",
             @"name" : @"name",
             };
}

@end
