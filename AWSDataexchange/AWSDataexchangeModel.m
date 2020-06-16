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

#import "AWSDataexchangeModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSDataexchangeErrorDomain = @"com.amazonaws.AWSDataexchangeErrorDomain";

@implementation AWSDataexchangeAssetDestinationEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"AssetId",
             @"bucket" : @"Bucket",
             @"key" : @"Key",
             };
}

@end

@implementation AWSDataexchangeAssetDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3SnapshotAsset" : @"S3SnapshotAsset",
             };
}

+ (NSValueTransformer *)s3SnapshotAssetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDataexchangeS3SnapshotAsset class]];
}

@end

@implementation AWSDataexchangeAssetEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"assetDetails" : @"AssetDetails",
             @"assetType" : @"AssetType",
             @"createdAt" : @"CreatedAt",
             @"dataSetId" : @"DataSetId",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"revisionId" : @"RevisionId",
             @"sourceId" : @"SourceId",
             @"updatedAt" : @"UpdatedAt",
             };
}

+ (NSValueTransformer *)assetDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDataexchangeAssetDetails class]];
}

+ (NSValueTransformer *)assetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3_SNAPSHOT"] == NSOrderedSame) {
            return @(AWSDataexchangeAssetTypeS3Snapshot);
        }
        return @(AWSDataexchangeAssetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDataexchangeAssetTypeS3Snapshot:
                return @"S3_SNAPSHOT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
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

@implementation AWSDataexchangeAssetSourceEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"key" : @"Key",
             };
}

@end

@implementation AWSDataexchangeCancelJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSDataexchangeCreateDataSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetType" : @"AssetType",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)assetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3_SNAPSHOT"] == NSOrderedSame) {
            return @(AWSDataexchangeAssetTypeS3Snapshot);
        }
        return @(AWSDataexchangeAssetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDataexchangeAssetTypeS3Snapshot:
                return @"S3_SNAPSHOT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDataexchangeCreateDataSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"assetType" : @"AssetType",
             @"createdAt" : @"CreatedAt",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"origin" : @"Origin",
             @"originDetails" : @"OriginDetails",
             @"sourceId" : @"SourceId",
             @"tags" : @"Tags",
             @"updatedAt" : @"UpdatedAt",
             };
}

+ (NSValueTransformer *)assetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3_SNAPSHOT"] == NSOrderedSame) {
            return @(AWSDataexchangeAssetTypeS3Snapshot);
        }
        return @(AWSDataexchangeAssetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDataexchangeAssetTypeS3Snapshot:
                return @"S3_SNAPSHOT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)originJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OWNED"] == NSOrderedSame) {
            return @(AWSDataexchangeOriginOwned);
        }
        if ([value caseInsensitiveCompare:@"ENTITLED"] == NSOrderedSame) {
            return @(AWSDataexchangeOriginEntitled);
        }
        return @(AWSDataexchangeOriginUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDataexchangeOriginOwned:
                return @"OWNED";
            case AWSDataexchangeOriginEntitled:
                return @"ENTITLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)originDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDataexchangeOriginDetails class]];
}

+ (NSValueTransformer *)updatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSDataexchangeCreateJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"details" : @"Details",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)detailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDataexchangeRequestDetails class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IMPORT_ASSETS_FROM_S3"] == NSOrderedSame) {
            return @(AWSDataexchangeTypesImportAssetsFromS3);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ASSET_FROM_SIGNED_URL"] == NSOrderedSame) {
            return @(AWSDataexchangeTypesImportAssetFromSignedUrl);
        }
        if ([value caseInsensitiveCompare:@"EXPORT_ASSETS_TO_S3"] == NSOrderedSame) {
            return @(AWSDataexchangeTypesExportAssetsToS3);
        }
        if ([value caseInsensitiveCompare:@"EXPORT_ASSET_TO_SIGNED_URL"] == NSOrderedSame) {
            return @(AWSDataexchangeTypesExportAssetToSignedUrl);
        }
        return @(AWSDataexchangeTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDataexchangeTypesImportAssetsFromS3:
                return @"IMPORT_ASSETS_FROM_S3";
            case AWSDataexchangeTypesImportAssetFromSignedUrl:
                return @"IMPORT_ASSET_FROM_SIGNED_URL";
            case AWSDataexchangeTypesExportAssetsToS3:
                return @"EXPORT_ASSETS_TO_S3";
            case AWSDataexchangeTypesExportAssetToSignedUrl:
                return @"EXPORT_ASSET_TO_SIGNED_URL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDataexchangeCreateJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdAt" : @"CreatedAt",
             @"details" : @"Details",
             @"errors" : @"Errors",
             @"identifier" : @"Id",
             @"state" : @"State",
             @"types" : @"Type",
             @"updatedAt" : @"UpdatedAt",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)detailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDataexchangeResponseDetails class]];
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDataexchangeJobError class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WAITING"] == NSOrderedSame) {
            return @(AWSDataexchangeStateWaiting);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSDataexchangeStateInProgress);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSDataexchangeStateError);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSDataexchangeStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSDataexchangeStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSDataexchangeStateTimedOut);
        }
        return @(AWSDataexchangeStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDataexchangeStateWaiting:
                return @"WAITING";
            case AWSDataexchangeStateInProgress:
                return @"IN_PROGRESS";
            case AWSDataexchangeStateError:
                return @"ERROR";
            case AWSDataexchangeStateCompleted:
                return @"COMPLETED";
            case AWSDataexchangeStateCancelled:
                return @"CANCELLED";
            case AWSDataexchangeStateTimedOut:
                return @"TIMED_OUT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IMPORT_ASSETS_FROM_S3"] == NSOrderedSame) {
            return @(AWSDataexchangeTypesImportAssetsFromS3);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ASSET_FROM_SIGNED_URL"] == NSOrderedSame) {
            return @(AWSDataexchangeTypesImportAssetFromSignedUrl);
        }
        if ([value caseInsensitiveCompare:@"EXPORT_ASSETS_TO_S3"] == NSOrderedSame) {
            return @(AWSDataexchangeTypesExportAssetsToS3);
        }
        if ([value caseInsensitiveCompare:@"EXPORT_ASSET_TO_SIGNED_URL"] == NSOrderedSame) {
            return @(AWSDataexchangeTypesExportAssetToSignedUrl);
        }
        return @(AWSDataexchangeTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDataexchangeTypesImportAssetsFromS3:
                return @"IMPORT_ASSETS_FROM_S3";
            case AWSDataexchangeTypesImportAssetFromSignedUrl:
                return @"IMPORT_ASSET_FROM_SIGNED_URL";
            case AWSDataexchangeTypesExportAssetsToS3:
                return @"EXPORT_ASSETS_TO_S3";
            case AWSDataexchangeTypesExportAssetToSignedUrl:
                return @"EXPORT_ASSET_TO_SIGNED_URL";
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

@implementation AWSDataexchangeCreateRevisionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"dataSetId" : @"DataSetId",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSDataexchangeCreateRevisionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"comment" : @"Comment",
             @"createdAt" : @"CreatedAt",
             @"dataSetId" : @"DataSetId",
             @"finalized" : @"Finalized",
             @"identifier" : @"Id",
             @"sourceId" : @"SourceId",
             @"tags" : @"Tags",
             @"updatedAt" : @"UpdatedAt",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
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

@implementation AWSDataexchangeDataSetEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"assetType" : @"AssetType",
             @"createdAt" : @"CreatedAt",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"origin" : @"Origin",
             @"originDetails" : @"OriginDetails",
             @"sourceId" : @"SourceId",
             @"updatedAt" : @"UpdatedAt",
             };
}

+ (NSValueTransformer *)assetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3_SNAPSHOT"] == NSOrderedSame) {
            return @(AWSDataexchangeAssetTypeS3Snapshot);
        }
        return @(AWSDataexchangeAssetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDataexchangeAssetTypeS3Snapshot:
                return @"S3_SNAPSHOT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)originJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OWNED"] == NSOrderedSame) {
            return @(AWSDataexchangeOriginOwned);
        }
        if ([value caseInsensitiveCompare:@"ENTITLED"] == NSOrderedSame) {
            return @(AWSDataexchangeOriginEntitled);
        }
        return @(AWSDataexchangeOriginUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDataexchangeOriginOwned:
                return @"OWNED";
            case AWSDataexchangeOriginEntitled:
                return @"ENTITLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)originDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDataexchangeOriginDetails class]];
}

+ (NSValueTransformer *)updatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSDataexchangeDeleteAssetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"AssetId",
             @"dataSetId" : @"DataSetId",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSDataexchangeDeleteDataSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSetId" : @"DataSetId",
             };
}

@end

@implementation AWSDataexchangeDeleteRevisionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSetId" : @"DataSetId",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSDataexchangeDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importAssetFromSignedUrlJobErrorDetails" : @"ImportAssetFromSignedUrlJobErrorDetails",
             @"importAssetsFromS3JobErrorDetails" : @"ImportAssetsFromS3JobErrorDetails",
             };
}

+ (NSValueTransformer *)importAssetFromSignedUrlJobErrorDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDataexchangeImportAssetFromSignedUrlJobErrorDetails class]];
}

+ (NSValueTransformer *)importAssetsFromS3JobErrorDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDataexchangeAssetSourceEntry class]];
}

@end

@implementation AWSDataexchangeExportAssetToSignedUrlRequestDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"AssetId",
             @"dataSetId" : @"DataSetId",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSDataexchangeExportAssetToSignedUrlResponseDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"AssetId",
             @"dataSetId" : @"DataSetId",
             @"revisionId" : @"RevisionId",
             @"signedUrl" : @"SignedUrl",
             @"signedUrlExpiresAt" : @"SignedUrlExpiresAt",
             };
}

+ (NSValueTransformer *)signedUrlExpiresAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSDataexchangeExportAssetsToS3RequestDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetDestinations" : @"AssetDestinations",
             @"dataSetId" : @"DataSetId",
             @"encryption" : @"Encryption",
             @"revisionId" : @"RevisionId",
             };
}

+ (NSValueTransformer *)assetDestinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDataexchangeAssetDestinationEntry class]];
}

+ (NSValueTransformer *)encryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDataexchangeExportServerSideEncryption class]];
}

@end

@implementation AWSDataexchangeExportAssetsToS3ResponseDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetDestinations" : @"AssetDestinations",
             @"dataSetId" : @"DataSetId",
             @"encryption" : @"Encryption",
             @"revisionId" : @"RevisionId",
             };
}

+ (NSValueTransformer *)assetDestinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDataexchangeAssetDestinationEntry class]];
}

+ (NSValueTransformer *)encryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDataexchangeExportServerSideEncryption class]];
}

@end

@implementation AWSDataexchangeExportServerSideEncryption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyArn" : @"KmsKeyArn",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"aws:kms"] == NSOrderedSame) {
            return @(AWSDataexchangeServerSideEncryptionTypesAwsKms);
        }
        if ([value caseInsensitiveCompare:@"AES256"] == NSOrderedSame) {
            return @(AWSDataexchangeServerSideEncryptionTypesAES256);
        }
        return @(AWSDataexchangeServerSideEncryptionTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDataexchangeServerSideEncryptionTypesAwsKms:
                return @"aws:kms";
            case AWSDataexchangeServerSideEncryptionTypesAES256:
                return @"AES256";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDataexchangeGetAssetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"AssetId",
             @"dataSetId" : @"DataSetId",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSDataexchangeGetAssetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"assetDetails" : @"AssetDetails",
             @"assetType" : @"AssetType",
             @"createdAt" : @"CreatedAt",
             @"dataSetId" : @"DataSetId",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"revisionId" : @"RevisionId",
             @"sourceId" : @"SourceId",
             @"updatedAt" : @"UpdatedAt",
             };
}

+ (NSValueTransformer *)assetDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDataexchangeAssetDetails class]];
}

+ (NSValueTransformer *)assetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3_SNAPSHOT"] == NSOrderedSame) {
            return @(AWSDataexchangeAssetTypeS3Snapshot);
        }
        return @(AWSDataexchangeAssetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDataexchangeAssetTypeS3Snapshot:
                return @"S3_SNAPSHOT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
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

@implementation AWSDataexchangeGetDataSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSetId" : @"DataSetId",
             };
}

@end

@implementation AWSDataexchangeGetDataSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"assetType" : @"AssetType",
             @"createdAt" : @"CreatedAt",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"origin" : @"Origin",
             @"originDetails" : @"OriginDetails",
             @"sourceId" : @"SourceId",
             @"tags" : @"Tags",
             @"updatedAt" : @"UpdatedAt",
             };
}

+ (NSValueTransformer *)assetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3_SNAPSHOT"] == NSOrderedSame) {
            return @(AWSDataexchangeAssetTypeS3Snapshot);
        }
        return @(AWSDataexchangeAssetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDataexchangeAssetTypeS3Snapshot:
                return @"S3_SNAPSHOT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)originJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OWNED"] == NSOrderedSame) {
            return @(AWSDataexchangeOriginOwned);
        }
        if ([value caseInsensitiveCompare:@"ENTITLED"] == NSOrderedSame) {
            return @(AWSDataexchangeOriginEntitled);
        }
        return @(AWSDataexchangeOriginUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDataexchangeOriginOwned:
                return @"OWNED";
            case AWSDataexchangeOriginEntitled:
                return @"ENTITLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)originDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDataexchangeOriginDetails class]];
}

+ (NSValueTransformer *)updatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSDataexchangeGetJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSDataexchangeGetJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdAt" : @"CreatedAt",
             @"details" : @"Details",
             @"errors" : @"Errors",
             @"identifier" : @"Id",
             @"state" : @"State",
             @"types" : @"Type",
             @"updatedAt" : @"UpdatedAt",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)detailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDataexchangeResponseDetails class]];
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDataexchangeJobError class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WAITING"] == NSOrderedSame) {
            return @(AWSDataexchangeStateWaiting);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSDataexchangeStateInProgress);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSDataexchangeStateError);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSDataexchangeStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSDataexchangeStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSDataexchangeStateTimedOut);
        }
        return @(AWSDataexchangeStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDataexchangeStateWaiting:
                return @"WAITING";
            case AWSDataexchangeStateInProgress:
                return @"IN_PROGRESS";
            case AWSDataexchangeStateError:
                return @"ERROR";
            case AWSDataexchangeStateCompleted:
                return @"COMPLETED";
            case AWSDataexchangeStateCancelled:
                return @"CANCELLED";
            case AWSDataexchangeStateTimedOut:
                return @"TIMED_OUT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IMPORT_ASSETS_FROM_S3"] == NSOrderedSame) {
            return @(AWSDataexchangeTypesImportAssetsFromS3);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ASSET_FROM_SIGNED_URL"] == NSOrderedSame) {
            return @(AWSDataexchangeTypesImportAssetFromSignedUrl);
        }
        if ([value caseInsensitiveCompare:@"EXPORT_ASSETS_TO_S3"] == NSOrderedSame) {
            return @(AWSDataexchangeTypesExportAssetsToS3);
        }
        if ([value caseInsensitiveCompare:@"EXPORT_ASSET_TO_SIGNED_URL"] == NSOrderedSame) {
            return @(AWSDataexchangeTypesExportAssetToSignedUrl);
        }
        return @(AWSDataexchangeTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDataexchangeTypesImportAssetsFromS3:
                return @"IMPORT_ASSETS_FROM_S3";
            case AWSDataexchangeTypesImportAssetFromSignedUrl:
                return @"IMPORT_ASSET_FROM_SIGNED_URL";
            case AWSDataexchangeTypesExportAssetsToS3:
                return @"EXPORT_ASSETS_TO_S3";
            case AWSDataexchangeTypesExportAssetToSignedUrl:
                return @"EXPORT_ASSET_TO_SIGNED_URL";
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

@implementation AWSDataexchangeGetRevisionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSetId" : @"DataSetId",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSDataexchangeGetRevisionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"comment" : @"Comment",
             @"createdAt" : @"CreatedAt",
             @"dataSetId" : @"DataSetId",
             @"finalized" : @"Finalized",
             @"identifier" : @"Id",
             @"sourceId" : @"SourceId",
             @"tags" : @"Tags",
             @"updatedAt" : @"UpdatedAt",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
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

@implementation AWSDataexchangeImportAssetFromSignedUrlJobErrorDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetName" : @"AssetName",
             };
}

@end

@implementation AWSDataexchangeImportAssetFromSignedUrlRequestDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetName" : @"AssetName",
             @"dataSetId" : @"DataSetId",
             @"md5Hash" : @"Md5Hash",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSDataexchangeImportAssetFromSignedUrlResponseDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetName" : @"AssetName",
             @"dataSetId" : @"DataSetId",
             @"md5Hash" : @"Md5Hash",
             @"revisionId" : @"RevisionId",
             @"signedUrl" : @"SignedUrl",
             @"signedUrlExpiresAt" : @"SignedUrlExpiresAt",
             };
}

+ (NSValueTransformer *)signedUrlExpiresAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSDataexchangeImportAssetsFromS3RequestDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetSources" : @"AssetSources",
             @"dataSetId" : @"DataSetId",
             @"revisionId" : @"RevisionId",
             };
}

+ (NSValueTransformer *)assetSourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDataexchangeAssetSourceEntry class]];
}

@end

@implementation AWSDataexchangeImportAssetsFromS3ResponseDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetSources" : @"AssetSources",
             @"dataSetId" : @"DataSetId",
             @"revisionId" : @"RevisionId",
             };
}

+ (NSValueTransformer *)assetSourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDataexchangeAssetSourceEntry class]];
}

@end

@implementation AWSDataexchangeJobEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdAt" : @"CreatedAt",
             @"details" : @"Details",
             @"errors" : @"Errors",
             @"identifier" : @"Id",
             @"state" : @"State",
             @"types" : @"Type",
             @"updatedAt" : @"UpdatedAt",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)detailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDataexchangeResponseDetails class]];
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDataexchangeJobError class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WAITING"] == NSOrderedSame) {
            return @(AWSDataexchangeStateWaiting);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSDataexchangeStateInProgress);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSDataexchangeStateError);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSDataexchangeStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSDataexchangeStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSDataexchangeStateTimedOut);
        }
        return @(AWSDataexchangeStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDataexchangeStateWaiting:
                return @"WAITING";
            case AWSDataexchangeStateInProgress:
                return @"IN_PROGRESS";
            case AWSDataexchangeStateError:
                return @"ERROR";
            case AWSDataexchangeStateCompleted:
                return @"COMPLETED";
            case AWSDataexchangeStateCancelled:
                return @"CANCELLED";
            case AWSDataexchangeStateTimedOut:
                return @"TIMED_OUT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IMPORT_ASSETS_FROM_S3"] == NSOrderedSame) {
            return @(AWSDataexchangeTypesImportAssetsFromS3);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ASSET_FROM_SIGNED_URL"] == NSOrderedSame) {
            return @(AWSDataexchangeTypesImportAssetFromSignedUrl);
        }
        if ([value caseInsensitiveCompare:@"EXPORT_ASSETS_TO_S3"] == NSOrderedSame) {
            return @(AWSDataexchangeTypesExportAssetsToS3);
        }
        if ([value caseInsensitiveCompare:@"EXPORT_ASSET_TO_SIGNED_URL"] == NSOrderedSame) {
            return @(AWSDataexchangeTypesExportAssetToSignedUrl);
        }
        return @(AWSDataexchangeTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDataexchangeTypesImportAssetsFromS3:
                return @"IMPORT_ASSETS_FROM_S3";
            case AWSDataexchangeTypesImportAssetFromSignedUrl:
                return @"IMPORT_ASSET_FROM_SIGNED_URL";
            case AWSDataexchangeTypesExportAssetsToS3:
                return @"EXPORT_ASSETS_TO_S3";
            case AWSDataexchangeTypesExportAssetToSignedUrl:
                return @"EXPORT_ASSET_TO_SIGNED_URL";
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

@implementation AWSDataexchangeJobError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"details" : @"Details",
             @"limitName" : @"LimitName",
             @"limitValue" : @"LimitValue",
             @"message" : @"Message",
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACCESS_DENIED_EXCEPTION"] == NSOrderedSame) {
            return @(AWSDataexchangeCodeAccessDeniedException);
        }
        if ([value caseInsensitiveCompare:@"INTERNAL_SERVER_EXCEPTION"] == NSOrderedSame) {
            return @(AWSDataexchangeCodeInternalServerException);
        }
        if ([value caseInsensitiveCompare:@"MALWARE_DETECTED"] == NSOrderedSame) {
            return @(AWSDataexchangeCodeMalwareDetected);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_NOT_FOUND_EXCEPTION"] == NSOrderedSame) {
            return @(AWSDataexchangeCodeResourceNotFoundException);
        }
        if ([value caseInsensitiveCompare:@"SERVICE_QUOTA_EXCEEDED_EXCEPTION"] == NSOrderedSame) {
            return @(AWSDataexchangeCodeServiceQuotaExceededException);
        }
        if ([value caseInsensitiveCompare:@"VALIDATION_EXCEPTION"] == NSOrderedSame) {
            return @(AWSDataexchangeCodeValidationException);
        }
        if ([value caseInsensitiveCompare:@"MALWARE_SCAN_ENCRYPTED_FILE"] == NSOrderedSame) {
            return @(AWSDataexchangeCodeMalwareScanEncryptedFile);
        }
        return @(AWSDataexchangeCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDataexchangeCodeAccessDeniedException:
                return @"ACCESS_DENIED_EXCEPTION";
            case AWSDataexchangeCodeInternalServerException:
                return @"INTERNAL_SERVER_EXCEPTION";
            case AWSDataexchangeCodeMalwareDetected:
                return @"MALWARE_DETECTED";
            case AWSDataexchangeCodeResourceNotFoundException:
                return @"RESOURCE_NOT_FOUND_EXCEPTION";
            case AWSDataexchangeCodeServiceQuotaExceededException:
                return @"SERVICE_QUOTA_EXCEEDED_EXCEPTION";
            case AWSDataexchangeCodeValidationException:
                return @"VALIDATION_EXCEPTION";
            case AWSDataexchangeCodeMalwareScanEncryptedFile:
                return @"MALWARE_SCAN_ENCRYPTED_FILE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)detailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDataexchangeDetails class]];
}

+ (NSValueTransformer *)limitNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Assets per revision"] == NSOrderedSame) {
            return @(AWSDataexchangeJobErrorLimitNameAssetsPerRevision);
        }
        if ([value caseInsensitiveCompare:@"Asset size in GB"] == NSOrderedSame) {
            return @(AWSDataexchangeJobErrorLimitNameAssetSizeInGB);
        }
        return @(AWSDataexchangeJobErrorLimitNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDataexchangeJobErrorLimitNameAssetsPerRevision:
                return @"Assets per revision";
            case AWSDataexchangeJobErrorLimitNameAssetSizeInGB:
                return @"Asset size in GB";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REVISION"] == NSOrderedSame) {
            return @(AWSDataexchangeJobErrorResourceTypesRevision);
        }
        if ([value caseInsensitiveCompare:@"ASSET"] == NSOrderedSame) {
            return @(AWSDataexchangeJobErrorResourceTypesAsset);
        }
        return @(AWSDataexchangeJobErrorResourceTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDataexchangeJobErrorResourceTypesRevision:
                return @"REVISION";
            case AWSDataexchangeJobErrorResourceTypesAsset:
                return @"ASSET";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDataexchangeListDataSetRevisionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSetId" : @"DataSetId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSDataexchangeListDataSetRevisionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"revisions" : @"Revisions",
             };
}

+ (NSValueTransformer *)revisionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDataexchangeRevisionEntry class]];
}

@end

@implementation AWSDataexchangeListDataSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"origin" : @"Origin",
             };
}

@end

@implementation AWSDataexchangeListDataSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSets" : @"DataSets",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)dataSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDataexchangeDataSetEntry class]];
}

@end

@implementation AWSDataexchangeListJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSetId" : @"DataSetId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSDataexchangeListJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobs" : @"Jobs",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)jobsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDataexchangeJobEntry class]];
}

@end

@implementation AWSDataexchangeListRevisionAssetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSetId" : @"DataSetId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSDataexchangeListRevisionAssetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assets" : @"Assets",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)assetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDataexchangeAssetEntry class]];
}

@end

@implementation AWSDataexchangeListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSDataexchangeListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSDataexchangeOriginDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"productId" : @"ProductId",
             };
}

@end

@implementation AWSDataexchangeRequestDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportAssetToSignedUrl" : @"ExportAssetToSignedUrl",
             @"exportAssetsToS3" : @"ExportAssetsToS3",
             @"importAssetFromSignedUrl" : @"ImportAssetFromSignedUrl",
             @"importAssetsFromS3" : @"ImportAssetsFromS3",
             };
}

+ (NSValueTransformer *)exportAssetToSignedUrlJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDataexchangeExportAssetToSignedUrlRequestDetails class]];
}

+ (NSValueTransformer *)exportAssetsToS3JSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDataexchangeExportAssetsToS3RequestDetails class]];
}

+ (NSValueTransformer *)importAssetFromSignedUrlJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDataexchangeImportAssetFromSignedUrlRequestDetails class]];
}

+ (NSValueTransformer *)importAssetsFromS3JSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDataexchangeImportAssetsFromS3RequestDetails class]];
}

@end

@implementation AWSDataexchangeResponseDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportAssetToSignedUrl" : @"ExportAssetToSignedUrl",
             @"exportAssetsToS3" : @"ExportAssetsToS3",
             @"importAssetFromSignedUrl" : @"ImportAssetFromSignedUrl",
             @"importAssetsFromS3" : @"ImportAssetsFromS3",
             };
}

+ (NSValueTransformer *)exportAssetToSignedUrlJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDataexchangeExportAssetToSignedUrlResponseDetails class]];
}

+ (NSValueTransformer *)exportAssetsToS3JSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDataexchangeExportAssetsToS3ResponseDetails class]];
}

+ (NSValueTransformer *)importAssetFromSignedUrlJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDataexchangeImportAssetFromSignedUrlResponseDetails class]];
}

+ (NSValueTransformer *)importAssetsFromS3JSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDataexchangeImportAssetsFromS3ResponseDetails class]];
}

@end

@implementation AWSDataexchangeRevisionEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"comment" : @"Comment",
             @"createdAt" : @"CreatedAt",
             @"dataSetId" : @"DataSetId",
             @"finalized" : @"Finalized",
             @"identifier" : @"Id",
             @"sourceId" : @"SourceId",
             @"updatedAt" : @"UpdatedAt",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
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

@implementation AWSDataexchangeS3SnapshotAsset

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"size" : @"Size",
             };
}

@end

@implementation AWSDataexchangeStartJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSDataexchangeStartJobResponse

@end

@implementation AWSDataexchangeTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSDataexchangeUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSDataexchangeUpdateAssetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"AssetId",
             @"dataSetId" : @"DataSetId",
             @"name" : @"Name",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSDataexchangeUpdateAssetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"assetDetails" : @"AssetDetails",
             @"assetType" : @"AssetType",
             @"createdAt" : @"CreatedAt",
             @"dataSetId" : @"DataSetId",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"revisionId" : @"RevisionId",
             @"sourceId" : @"SourceId",
             @"updatedAt" : @"UpdatedAt",
             };
}

+ (NSValueTransformer *)assetDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDataexchangeAssetDetails class]];
}

+ (NSValueTransformer *)assetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3_SNAPSHOT"] == NSOrderedSame) {
            return @(AWSDataexchangeAssetTypeS3Snapshot);
        }
        return @(AWSDataexchangeAssetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDataexchangeAssetTypeS3Snapshot:
                return @"S3_SNAPSHOT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
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

@implementation AWSDataexchangeUpdateDataSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSetId" : @"DataSetId",
             @"detail" : @"Description",
             @"name" : @"Name",
             };
}

@end

@implementation AWSDataexchangeUpdateDataSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"assetType" : @"AssetType",
             @"createdAt" : @"CreatedAt",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"origin" : @"Origin",
             @"originDetails" : @"OriginDetails",
             @"sourceId" : @"SourceId",
             @"updatedAt" : @"UpdatedAt",
             };
}

+ (NSValueTransformer *)assetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3_SNAPSHOT"] == NSOrderedSame) {
            return @(AWSDataexchangeAssetTypeS3Snapshot);
        }
        return @(AWSDataexchangeAssetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDataexchangeAssetTypeS3Snapshot:
                return @"S3_SNAPSHOT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)originJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OWNED"] == NSOrderedSame) {
            return @(AWSDataexchangeOriginOwned);
        }
        if ([value caseInsensitiveCompare:@"ENTITLED"] == NSOrderedSame) {
            return @(AWSDataexchangeOriginEntitled);
        }
        return @(AWSDataexchangeOriginUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDataexchangeOriginOwned:
                return @"OWNED";
            case AWSDataexchangeOriginEntitled:
                return @"ENTITLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)originDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDataexchangeOriginDetails class]];
}

+ (NSValueTransformer *)updatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSDataexchangeUpdateRevisionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"dataSetId" : @"DataSetId",
             @"finalized" : @"Finalized",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSDataexchangeUpdateRevisionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"comment" : @"Comment",
             @"createdAt" : @"CreatedAt",
             @"dataSetId" : @"DataSetId",
             @"finalized" : @"Finalized",
             @"identifier" : @"Id",
             @"sourceId" : @"SourceId",
             @"updatedAt" : @"UpdatedAt",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
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
