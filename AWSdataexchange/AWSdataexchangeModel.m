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

#import "AWSdataexchangeModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSdataexchangeErrorDomain = @"com.amazonaws.AWSdataexchangeErrorDomain";

@implementation AWSdataexchangeAssetDestinationEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"AssetId",
             @"bucket" : @"Bucket",
             @"key" : @"Key",
             };
}

@end

@implementation AWSdataexchangeAssetDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3SnapshotAsset" : @"S3SnapshotAsset",
             };
}

+ (NSValueTransformer *)s3SnapshotAssetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdataexchangeS3SnapshotAsset class]];
}

@end

@implementation AWSdataexchangeAssetEntry

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdataexchangeAssetDetails class]];
}

+ (NSValueTransformer *)assetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3_SNAPSHOT"] == NSOrderedSame) {
            return @(AWSdataexchangeAssetTypeS3Snapshot);
        }
        return @(AWSdataexchangeAssetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdataexchangeAssetTypeS3Snapshot:
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

@implementation AWSdataexchangeAssetSourceEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"key" : @"Key",
             };
}

@end

@implementation AWSdataexchangeCancelJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSdataexchangeCreateDataSetRequest

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
            return @(AWSdataexchangeAssetTypeS3Snapshot);
        }
        return @(AWSdataexchangeAssetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdataexchangeAssetTypeS3Snapshot:
                return @"S3_SNAPSHOT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdataexchangeCreateDataSetResponse

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
            return @(AWSdataexchangeAssetTypeS3Snapshot);
        }
        return @(AWSdataexchangeAssetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdataexchangeAssetTypeS3Snapshot:
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
            return @(AWSdataexchangeOriginOwned);
        }
        if ([value caseInsensitiveCompare:@"ENTITLED"] == NSOrderedSame) {
            return @(AWSdataexchangeOriginEntitled);
        }
        return @(AWSdataexchangeOriginUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdataexchangeOriginOwned:
                return @"OWNED";
            case AWSdataexchangeOriginEntitled:
                return @"ENTITLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)originDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdataexchangeOriginDetails class]];
}

+ (NSValueTransformer *)updatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSdataexchangeCreateJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"details" : @"Details",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)detailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdataexchangeRequestDetails class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IMPORT_ASSETS_FROM_S3"] == NSOrderedSame) {
            return @(AWSdataexchangeTypesImportAssetsFromS3);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ASSET_FROM_SIGNED_URL"] == NSOrderedSame) {
            return @(AWSdataexchangeTypesImportAssetFromSignedUrl);
        }
        if ([value caseInsensitiveCompare:@"EXPORT_ASSETS_TO_S3"] == NSOrderedSame) {
            return @(AWSdataexchangeTypesExportAssetsToS3);
        }
        if ([value caseInsensitiveCompare:@"EXPORT_ASSET_TO_SIGNED_URL"] == NSOrderedSame) {
            return @(AWSdataexchangeTypesExportAssetToSignedUrl);
        }
        return @(AWSdataexchangeTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdataexchangeTypesImportAssetsFromS3:
                return @"IMPORT_ASSETS_FROM_S3";
            case AWSdataexchangeTypesImportAssetFromSignedUrl:
                return @"IMPORT_ASSET_FROM_SIGNED_URL";
            case AWSdataexchangeTypesExportAssetsToS3:
                return @"EXPORT_ASSETS_TO_S3";
            case AWSdataexchangeTypesExportAssetToSignedUrl:
                return @"EXPORT_ASSET_TO_SIGNED_URL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdataexchangeCreateJobResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdataexchangeResponseDetails class]];
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdataexchangeJobError class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WAITING"] == NSOrderedSame) {
            return @(AWSdataexchangeStateWaiting);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSdataexchangeStateInProgress);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSdataexchangeStateError);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSdataexchangeStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSdataexchangeStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSdataexchangeStateTimedOut);
        }
        return @(AWSdataexchangeStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdataexchangeStateWaiting:
                return @"WAITING";
            case AWSdataexchangeStateInProgress:
                return @"IN_PROGRESS";
            case AWSdataexchangeStateError:
                return @"ERROR";
            case AWSdataexchangeStateCompleted:
                return @"COMPLETED";
            case AWSdataexchangeStateCancelled:
                return @"CANCELLED";
            case AWSdataexchangeStateTimedOut:
                return @"TIMED_OUT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IMPORT_ASSETS_FROM_S3"] == NSOrderedSame) {
            return @(AWSdataexchangeTypesImportAssetsFromS3);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ASSET_FROM_SIGNED_URL"] == NSOrderedSame) {
            return @(AWSdataexchangeTypesImportAssetFromSignedUrl);
        }
        if ([value caseInsensitiveCompare:@"EXPORT_ASSETS_TO_S3"] == NSOrderedSame) {
            return @(AWSdataexchangeTypesExportAssetsToS3);
        }
        if ([value caseInsensitiveCompare:@"EXPORT_ASSET_TO_SIGNED_URL"] == NSOrderedSame) {
            return @(AWSdataexchangeTypesExportAssetToSignedUrl);
        }
        return @(AWSdataexchangeTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdataexchangeTypesImportAssetsFromS3:
                return @"IMPORT_ASSETS_FROM_S3";
            case AWSdataexchangeTypesImportAssetFromSignedUrl:
                return @"IMPORT_ASSET_FROM_SIGNED_URL";
            case AWSdataexchangeTypesExportAssetsToS3:
                return @"EXPORT_ASSETS_TO_S3";
            case AWSdataexchangeTypesExportAssetToSignedUrl:
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

@implementation AWSdataexchangeCreateRevisionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"dataSetId" : @"DataSetId",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSdataexchangeCreateRevisionResponse

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

@implementation AWSdataexchangeDataSetEntry

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
            return @(AWSdataexchangeAssetTypeS3Snapshot);
        }
        return @(AWSdataexchangeAssetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdataexchangeAssetTypeS3Snapshot:
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
            return @(AWSdataexchangeOriginOwned);
        }
        if ([value caseInsensitiveCompare:@"ENTITLED"] == NSOrderedSame) {
            return @(AWSdataexchangeOriginEntitled);
        }
        return @(AWSdataexchangeOriginUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdataexchangeOriginOwned:
                return @"OWNED";
            case AWSdataexchangeOriginEntitled:
                return @"ENTITLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)originDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdataexchangeOriginDetails class]];
}

+ (NSValueTransformer *)updatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSdataexchangeDeleteAssetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"AssetId",
             @"dataSetId" : @"DataSetId",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSdataexchangeDeleteDataSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSetId" : @"DataSetId",
             };
}

@end

@implementation AWSdataexchangeDeleteRevisionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSetId" : @"DataSetId",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSdataexchangeDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importAssetFromSignedUrlJobErrorDetails" : @"ImportAssetFromSignedUrlJobErrorDetails",
             @"importAssetsFromS3JobErrorDetails" : @"ImportAssetsFromS3JobErrorDetails",
             };
}

+ (NSValueTransformer *)importAssetFromSignedUrlJobErrorDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdataexchangeImportAssetFromSignedUrlJobErrorDetails class]];
}

+ (NSValueTransformer *)importAssetsFromS3JobErrorDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdataexchangeAssetSourceEntry class]];
}

@end

@implementation AWSdataexchangeExportAssetToSignedUrlRequestDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"AssetId",
             @"dataSetId" : @"DataSetId",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSdataexchangeExportAssetToSignedUrlResponseDetails

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

@implementation AWSdataexchangeExportAssetsToS3RequestDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetDestinations" : @"AssetDestinations",
             @"dataSetId" : @"DataSetId",
             @"encryption" : @"Encryption",
             @"revisionId" : @"RevisionId",
             };
}

+ (NSValueTransformer *)assetDestinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdataexchangeAssetDestinationEntry class]];
}

+ (NSValueTransformer *)encryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdataexchangeExportServerSideEncryption class]];
}

@end

@implementation AWSdataexchangeExportAssetsToS3ResponseDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetDestinations" : @"AssetDestinations",
             @"dataSetId" : @"DataSetId",
             @"encryption" : @"Encryption",
             @"revisionId" : @"RevisionId",
             };
}

+ (NSValueTransformer *)assetDestinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdataexchangeAssetDestinationEntry class]];
}

+ (NSValueTransformer *)encryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdataexchangeExportServerSideEncryption class]];
}

@end

@implementation AWSdataexchangeExportServerSideEncryption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyArn" : @"KmsKeyArn",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"aws:kms"] == NSOrderedSame) {
            return @(AWSdataexchangeServerSideEncryptionTypesAwsKms);
        }
        if ([value caseInsensitiveCompare:@"AES256"] == NSOrderedSame) {
            return @(AWSdataexchangeServerSideEncryptionTypesAES256);
        }
        return @(AWSdataexchangeServerSideEncryptionTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdataexchangeServerSideEncryptionTypesAwsKms:
                return @"aws:kms";
            case AWSdataexchangeServerSideEncryptionTypesAES256:
                return @"AES256";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdataexchangeGetAssetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"AssetId",
             @"dataSetId" : @"DataSetId",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSdataexchangeGetAssetResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdataexchangeAssetDetails class]];
}

+ (NSValueTransformer *)assetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3_SNAPSHOT"] == NSOrderedSame) {
            return @(AWSdataexchangeAssetTypeS3Snapshot);
        }
        return @(AWSdataexchangeAssetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdataexchangeAssetTypeS3Snapshot:
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

@implementation AWSdataexchangeGetDataSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSetId" : @"DataSetId",
             };
}

@end

@implementation AWSdataexchangeGetDataSetResponse

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
            return @(AWSdataexchangeAssetTypeS3Snapshot);
        }
        return @(AWSdataexchangeAssetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdataexchangeAssetTypeS3Snapshot:
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
            return @(AWSdataexchangeOriginOwned);
        }
        if ([value caseInsensitiveCompare:@"ENTITLED"] == NSOrderedSame) {
            return @(AWSdataexchangeOriginEntitled);
        }
        return @(AWSdataexchangeOriginUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdataexchangeOriginOwned:
                return @"OWNED";
            case AWSdataexchangeOriginEntitled:
                return @"ENTITLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)originDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdataexchangeOriginDetails class]];
}

+ (NSValueTransformer *)updatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSdataexchangeGetJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSdataexchangeGetJobResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdataexchangeResponseDetails class]];
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdataexchangeJobError class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WAITING"] == NSOrderedSame) {
            return @(AWSdataexchangeStateWaiting);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSdataexchangeStateInProgress);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSdataexchangeStateError);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSdataexchangeStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSdataexchangeStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSdataexchangeStateTimedOut);
        }
        return @(AWSdataexchangeStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdataexchangeStateWaiting:
                return @"WAITING";
            case AWSdataexchangeStateInProgress:
                return @"IN_PROGRESS";
            case AWSdataexchangeStateError:
                return @"ERROR";
            case AWSdataexchangeStateCompleted:
                return @"COMPLETED";
            case AWSdataexchangeStateCancelled:
                return @"CANCELLED";
            case AWSdataexchangeStateTimedOut:
                return @"TIMED_OUT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IMPORT_ASSETS_FROM_S3"] == NSOrderedSame) {
            return @(AWSdataexchangeTypesImportAssetsFromS3);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ASSET_FROM_SIGNED_URL"] == NSOrderedSame) {
            return @(AWSdataexchangeTypesImportAssetFromSignedUrl);
        }
        if ([value caseInsensitiveCompare:@"EXPORT_ASSETS_TO_S3"] == NSOrderedSame) {
            return @(AWSdataexchangeTypesExportAssetsToS3);
        }
        if ([value caseInsensitiveCompare:@"EXPORT_ASSET_TO_SIGNED_URL"] == NSOrderedSame) {
            return @(AWSdataexchangeTypesExportAssetToSignedUrl);
        }
        return @(AWSdataexchangeTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdataexchangeTypesImportAssetsFromS3:
                return @"IMPORT_ASSETS_FROM_S3";
            case AWSdataexchangeTypesImportAssetFromSignedUrl:
                return @"IMPORT_ASSET_FROM_SIGNED_URL";
            case AWSdataexchangeTypesExportAssetsToS3:
                return @"EXPORT_ASSETS_TO_S3";
            case AWSdataexchangeTypesExportAssetToSignedUrl:
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

@implementation AWSdataexchangeGetRevisionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSetId" : @"DataSetId",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSdataexchangeGetRevisionResponse

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

@implementation AWSdataexchangeImportAssetFromSignedUrlJobErrorDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetName" : @"AssetName",
             };
}

@end

@implementation AWSdataexchangeImportAssetFromSignedUrlRequestDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetName" : @"AssetName",
             @"dataSetId" : @"DataSetId",
             @"md5Hash" : @"Md5Hash",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSdataexchangeImportAssetFromSignedUrlResponseDetails

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

@implementation AWSdataexchangeImportAssetsFromS3RequestDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetSources" : @"AssetSources",
             @"dataSetId" : @"DataSetId",
             @"revisionId" : @"RevisionId",
             };
}

+ (NSValueTransformer *)assetSourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdataexchangeAssetSourceEntry class]];
}

@end

@implementation AWSdataexchangeImportAssetsFromS3ResponseDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetSources" : @"AssetSources",
             @"dataSetId" : @"DataSetId",
             @"revisionId" : @"RevisionId",
             };
}

+ (NSValueTransformer *)assetSourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdataexchangeAssetSourceEntry class]];
}

@end

@implementation AWSdataexchangeJobEntry

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdataexchangeResponseDetails class]];
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdataexchangeJobError class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WAITING"] == NSOrderedSame) {
            return @(AWSdataexchangeStateWaiting);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSdataexchangeStateInProgress);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSdataexchangeStateError);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSdataexchangeStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSdataexchangeStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSdataexchangeStateTimedOut);
        }
        return @(AWSdataexchangeStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdataexchangeStateWaiting:
                return @"WAITING";
            case AWSdataexchangeStateInProgress:
                return @"IN_PROGRESS";
            case AWSdataexchangeStateError:
                return @"ERROR";
            case AWSdataexchangeStateCompleted:
                return @"COMPLETED";
            case AWSdataexchangeStateCancelled:
                return @"CANCELLED";
            case AWSdataexchangeStateTimedOut:
                return @"TIMED_OUT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IMPORT_ASSETS_FROM_S3"] == NSOrderedSame) {
            return @(AWSdataexchangeTypesImportAssetsFromS3);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_ASSET_FROM_SIGNED_URL"] == NSOrderedSame) {
            return @(AWSdataexchangeTypesImportAssetFromSignedUrl);
        }
        if ([value caseInsensitiveCompare:@"EXPORT_ASSETS_TO_S3"] == NSOrderedSame) {
            return @(AWSdataexchangeTypesExportAssetsToS3);
        }
        if ([value caseInsensitiveCompare:@"EXPORT_ASSET_TO_SIGNED_URL"] == NSOrderedSame) {
            return @(AWSdataexchangeTypesExportAssetToSignedUrl);
        }
        return @(AWSdataexchangeTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdataexchangeTypesImportAssetsFromS3:
                return @"IMPORT_ASSETS_FROM_S3";
            case AWSdataexchangeTypesImportAssetFromSignedUrl:
                return @"IMPORT_ASSET_FROM_SIGNED_URL";
            case AWSdataexchangeTypesExportAssetsToS3:
                return @"EXPORT_ASSETS_TO_S3";
            case AWSdataexchangeTypesExportAssetToSignedUrl:
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

@implementation AWSdataexchangeJobError

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
            return @(AWSdataexchangeCodeAccessDeniedException);
        }
        if ([value caseInsensitiveCompare:@"INTERNAL_SERVER_EXCEPTION"] == NSOrderedSame) {
            return @(AWSdataexchangeCodeInternalServerException);
        }
        if ([value caseInsensitiveCompare:@"MALWARE_DETECTED"] == NSOrderedSame) {
            return @(AWSdataexchangeCodeMalwareDetected);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_NOT_FOUND_EXCEPTION"] == NSOrderedSame) {
            return @(AWSdataexchangeCodeResourceNotFoundException);
        }
        if ([value caseInsensitiveCompare:@"SERVICE_QUOTA_EXCEEDED_EXCEPTION"] == NSOrderedSame) {
            return @(AWSdataexchangeCodeServiceQuotaExceededException);
        }
        if ([value caseInsensitiveCompare:@"VALIDATION_EXCEPTION"] == NSOrderedSame) {
            return @(AWSdataexchangeCodeValidationException);
        }
        if ([value caseInsensitiveCompare:@"MALWARE_SCAN_ENCRYPTED_FILE"] == NSOrderedSame) {
            return @(AWSdataexchangeCodeMalwareScanEncryptedFile);
        }
        return @(AWSdataexchangeCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdataexchangeCodeAccessDeniedException:
                return @"ACCESS_DENIED_EXCEPTION";
            case AWSdataexchangeCodeInternalServerException:
                return @"INTERNAL_SERVER_EXCEPTION";
            case AWSdataexchangeCodeMalwareDetected:
                return @"MALWARE_DETECTED";
            case AWSdataexchangeCodeResourceNotFoundException:
                return @"RESOURCE_NOT_FOUND_EXCEPTION";
            case AWSdataexchangeCodeServiceQuotaExceededException:
                return @"SERVICE_QUOTA_EXCEEDED_EXCEPTION";
            case AWSdataexchangeCodeValidationException:
                return @"VALIDATION_EXCEPTION";
            case AWSdataexchangeCodeMalwareScanEncryptedFile:
                return @"MALWARE_SCAN_ENCRYPTED_FILE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)detailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdataexchangeDetails class]];
}

+ (NSValueTransformer *)limitNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Assets per revision"] == NSOrderedSame) {
            return @(AWSdataexchangeJobErrorLimitNameAssetsPerRevision);
        }
        if ([value caseInsensitiveCompare:@"Asset size in GB"] == NSOrderedSame) {
            return @(AWSdataexchangeJobErrorLimitNameAssetSizeInGB);
        }
        return @(AWSdataexchangeJobErrorLimitNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdataexchangeJobErrorLimitNameAssetsPerRevision:
                return @"Assets per revision";
            case AWSdataexchangeJobErrorLimitNameAssetSizeInGB:
                return @"Asset size in GB";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REVISION"] == NSOrderedSame) {
            return @(AWSdataexchangeJobErrorResourceTypesRevision);
        }
        if ([value caseInsensitiveCompare:@"ASSET"] == NSOrderedSame) {
            return @(AWSdataexchangeJobErrorResourceTypesAsset);
        }
        return @(AWSdataexchangeJobErrorResourceTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdataexchangeJobErrorResourceTypesRevision:
                return @"REVISION";
            case AWSdataexchangeJobErrorResourceTypesAsset:
                return @"ASSET";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdataexchangeListDataSetRevisionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSetId" : @"DataSetId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSdataexchangeListDataSetRevisionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"revisions" : @"Revisions",
             };
}

+ (NSValueTransformer *)revisionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdataexchangeRevisionEntry class]];
}

@end

@implementation AWSdataexchangeListDataSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"origin" : @"Origin",
             };
}

@end

@implementation AWSdataexchangeListDataSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSets" : @"DataSets",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)dataSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdataexchangeDataSetEntry class]];
}

@end

@implementation AWSdataexchangeListJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSetId" : @"DataSetId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSdataexchangeListJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobs" : @"Jobs",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)jobsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdataexchangeJobEntry class]];
}

@end

@implementation AWSdataexchangeListRevisionAssetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSetId" : @"DataSetId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSdataexchangeListRevisionAssetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assets" : @"Assets",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)assetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdataexchangeAssetEntry class]];
}

@end

@implementation AWSdataexchangeListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSdataexchangeListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSdataexchangeOriginDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"productId" : @"ProductId",
             };
}

@end

@implementation AWSdataexchangeRequestDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportAssetToSignedUrl" : @"ExportAssetToSignedUrl",
             @"exportAssetsToS3" : @"ExportAssetsToS3",
             @"importAssetFromSignedUrl" : @"ImportAssetFromSignedUrl",
             @"importAssetsFromS3" : @"ImportAssetsFromS3",
             };
}

+ (NSValueTransformer *)exportAssetToSignedUrlJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdataexchangeExportAssetToSignedUrlRequestDetails class]];
}

+ (NSValueTransformer *)exportAssetsToS3JSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdataexchangeExportAssetsToS3RequestDetails class]];
}

+ (NSValueTransformer *)importAssetFromSignedUrlJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdataexchangeImportAssetFromSignedUrlRequestDetails class]];
}

+ (NSValueTransformer *)importAssetsFromS3JSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdataexchangeImportAssetsFromS3RequestDetails class]];
}

@end

@implementation AWSdataexchangeResponseDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportAssetToSignedUrl" : @"ExportAssetToSignedUrl",
             @"exportAssetsToS3" : @"ExportAssetsToS3",
             @"importAssetFromSignedUrl" : @"ImportAssetFromSignedUrl",
             @"importAssetsFromS3" : @"ImportAssetsFromS3",
             };
}

+ (NSValueTransformer *)exportAssetToSignedUrlJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdataexchangeExportAssetToSignedUrlResponseDetails class]];
}

+ (NSValueTransformer *)exportAssetsToS3JSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdataexchangeExportAssetsToS3ResponseDetails class]];
}

+ (NSValueTransformer *)importAssetFromSignedUrlJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdataexchangeImportAssetFromSignedUrlResponseDetails class]];
}

+ (NSValueTransformer *)importAssetsFromS3JSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdataexchangeImportAssetsFromS3ResponseDetails class]];
}

@end

@implementation AWSdataexchangeRevisionEntry

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

@implementation AWSdataexchangeS3SnapshotAsset

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"size" : @"Size",
             };
}

@end

@implementation AWSdataexchangeStartJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSdataexchangeStartJobResponse

@end

@implementation AWSdataexchangeTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSdataexchangeUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSdataexchangeUpdateAssetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"AssetId",
             @"dataSetId" : @"DataSetId",
             @"name" : @"Name",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSdataexchangeUpdateAssetResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdataexchangeAssetDetails class]];
}

+ (NSValueTransformer *)assetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3_SNAPSHOT"] == NSOrderedSame) {
            return @(AWSdataexchangeAssetTypeS3Snapshot);
        }
        return @(AWSdataexchangeAssetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdataexchangeAssetTypeS3Snapshot:
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

@implementation AWSdataexchangeUpdateDataSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSetId" : @"DataSetId",
             @"detail" : @"Description",
             @"name" : @"Name",
             };
}

@end

@implementation AWSdataexchangeUpdateDataSetResponse

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
            return @(AWSdataexchangeAssetTypeS3Snapshot);
        }
        return @(AWSdataexchangeAssetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdataexchangeAssetTypeS3Snapshot:
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
            return @(AWSdataexchangeOriginOwned);
        }
        if ([value caseInsensitiveCompare:@"ENTITLED"] == NSOrderedSame) {
            return @(AWSdataexchangeOriginEntitled);
        }
        return @(AWSdataexchangeOriginUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdataexchangeOriginOwned:
                return @"OWNED";
            case AWSdataexchangeOriginEntitled:
                return @"ENTITLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)originDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdataexchangeOriginDetails class]];
}

+ (NSValueTransformer *)updatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSdataexchangeUpdateRevisionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"dataSetId" : @"DataSetId",
             @"finalized" : @"Finalized",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSdataexchangeUpdateRevisionResponse

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
