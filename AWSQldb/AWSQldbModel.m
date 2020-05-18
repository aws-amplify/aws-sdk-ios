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

#import "AWSQldbModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSQldbErrorDomain = @"com.amazonaws.AWSQldbErrorDomain";

@implementation AWSQldbCancelJournalKinesisStreamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ledgerName" : @"LedgerName",
             @"streamId" : @"StreamId",
             };
}

@end

@implementation AWSQldbCancelJournalKinesisStreamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamId" : @"StreamId",
             };
}

@end

@implementation AWSQldbCreateLedgerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deletionProtection" : @"DeletionProtection",
             @"name" : @"Name",
             @"permissionsMode" : @"PermissionsMode",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)permissionsModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALLOW_ALL"] == NSOrderedSame) {
            return @(AWSQldbPermissionsModeAllowAll);
        }
        return @(AWSQldbPermissionsModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQldbPermissionsModeAllowAll:
                return @"ALLOW_ALL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQldbCreateLedgerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"creationDateTime" : @"CreationDateTime",
             @"deletionProtection" : @"DeletionProtection",
             @"name" : @"Name",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSQldbLedgerStateCreating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSQldbLedgerStateActive);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSQldbLedgerStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSQldbLedgerStateDeleted);
        }
        return @(AWSQldbLedgerStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQldbLedgerStateCreating:
                return @"CREATING";
            case AWSQldbLedgerStateActive:
                return @"ACTIVE";
            case AWSQldbLedgerStateDeleting:
                return @"DELETING";
            case AWSQldbLedgerStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQldbDeleteLedgerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSQldbDescribeJournalKinesisStreamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ledgerName" : @"LedgerName",
             @"streamId" : @"StreamId",
             };
}

@end

@implementation AWSQldbDescribeJournalKinesisStreamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stream" : @"Stream",
             };
}

+ (NSValueTransformer *)streamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbJournalKinesisStreamDescription class]];
}

@end

@implementation AWSQldbDescribeJournalS3ExportRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportId" : @"ExportId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSQldbDescribeJournalS3ExportResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportDescription" : @"ExportDescription",
             };
}

+ (NSValueTransformer *)exportDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbJournalS3ExportDescription class]];
}

@end

@implementation AWSQldbDescribeLedgerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSQldbDescribeLedgerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"creationDateTime" : @"CreationDateTime",
             @"deletionProtection" : @"DeletionProtection",
             @"name" : @"Name",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSQldbLedgerStateCreating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSQldbLedgerStateActive);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSQldbLedgerStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSQldbLedgerStateDeleted);
        }
        return @(AWSQldbLedgerStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQldbLedgerStateCreating:
                return @"CREATING";
            case AWSQldbLedgerStateActive:
                return @"ACTIVE";
            case AWSQldbLedgerStateDeleting:
                return @"DELETING";
            case AWSQldbLedgerStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQldbExportJournalToS3Request

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exclusiveEndTime" : @"ExclusiveEndTime",
             @"inclusiveStartTime" : @"InclusiveStartTime",
             @"name" : @"Name",
             @"roleArn" : @"RoleArn",
             @"s3ExportConfiguration" : @"S3ExportConfiguration",
             };
}

+ (NSValueTransformer *)exclusiveEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inclusiveStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)s3ExportConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbS3ExportConfiguration class]];
}

@end

@implementation AWSQldbExportJournalToS3Response

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportId" : @"ExportId",
             };
}

@end

@implementation AWSQldbGetBlockRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blockAddress" : @"BlockAddress",
             @"digestTipAddress" : @"DigestTipAddress",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)blockAddressJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbValueHolder class]];
}

+ (NSValueTransformer *)digestTipAddressJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbValueHolder class]];
}

@end

@implementation AWSQldbGetBlockResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"block" : @"Block",
             @"proof" : @"Proof",
             };
}

+ (NSValueTransformer *)blockJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbValueHolder class]];
}

+ (NSValueTransformer *)proofJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbValueHolder class]];
}

@end

@implementation AWSQldbGetDigestRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSQldbGetDigestResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"digest" : @"Digest",
             @"digestTipAddress" : @"DigestTipAddress",
             };
}

+ (NSValueTransformer *)digestTipAddressJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbValueHolder class]];
}

@end

@implementation AWSQldbGetRevisionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blockAddress" : @"BlockAddress",
             @"digestTipAddress" : @"DigestTipAddress",
             @"documentId" : @"DocumentId",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)blockAddressJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbValueHolder class]];
}

+ (NSValueTransformer *)digestTipAddressJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbValueHolder class]];
}

@end

@implementation AWSQldbGetRevisionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"proof" : @"Proof",
             @"revision" : @"Revision",
             };
}

+ (NSValueTransformer *)proofJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbValueHolder class]];
}

+ (NSValueTransformer *)revisionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbValueHolder class]];
}

@end

@implementation AWSQldbJournalKinesisStreamDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"creationTime" : @"CreationTime",
             @"errorCause" : @"ErrorCause",
             @"exclusiveEndTime" : @"ExclusiveEndTime",
             @"inclusiveStartTime" : @"InclusiveStartTime",
             @"kinesisConfiguration" : @"KinesisConfiguration",
             @"ledgerName" : @"LedgerName",
             @"roleArn" : @"RoleArn",
             @"status" : @"Status",
             @"streamId" : @"StreamId",
             @"streamName" : @"StreamName",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)errorCauseJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"KINESIS_STREAM_NOT_FOUND"] == NSOrderedSame) {
            return @(AWSQldbErrorCauseKinesisStreamNotFound);
        }
        if ([value caseInsensitiveCompare:@"IAM_PERMISSION_REVOKED"] == NSOrderedSame) {
            return @(AWSQldbErrorCauseIamPermissionRevoked);
        }
        return @(AWSQldbErrorCauseUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQldbErrorCauseKinesisStreamNotFound:
                return @"KINESIS_STREAM_NOT_FOUND";
            case AWSQldbErrorCauseIamPermissionRevoked:
                return @"IAM_PERMISSION_REVOKED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)exclusiveEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inclusiveStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)kinesisConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbKinesisConfiguration class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSQldbStreamStatusActive);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSQldbStreamStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSQldbStreamStatusCanceled);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSQldbStreamStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"IMPAIRED"] == NSOrderedSame) {
            return @(AWSQldbStreamStatusImpaired);
        }
        return @(AWSQldbStreamStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQldbStreamStatusActive:
                return @"ACTIVE";
            case AWSQldbStreamStatusCompleted:
                return @"COMPLETED";
            case AWSQldbStreamStatusCanceled:
                return @"CANCELED";
            case AWSQldbStreamStatusFailed:
                return @"FAILED";
            case AWSQldbStreamStatusImpaired:
                return @"IMPAIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQldbJournalS3ExportDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exclusiveEndTime" : @"ExclusiveEndTime",
             @"exportCreationTime" : @"ExportCreationTime",
             @"exportId" : @"ExportId",
             @"inclusiveStartTime" : @"InclusiveStartTime",
             @"ledgerName" : @"LedgerName",
             @"roleArn" : @"RoleArn",
             @"s3ExportConfiguration" : @"S3ExportConfiguration",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)exclusiveEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)exportCreationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inclusiveStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)s3ExportConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbS3ExportConfiguration class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSQldbExportStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSQldbExportStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSQldbExportStatusCancelled);
        }
        return @(AWSQldbExportStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQldbExportStatusInProgress:
                return @"IN_PROGRESS";
            case AWSQldbExportStatusCompleted:
                return @"COMPLETED";
            case AWSQldbExportStatusCancelled:
                return @"CANCELLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQldbKinesisConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aggregationEnabled" : @"AggregationEnabled",
             @"streamArn" : @"StreamArn",
             };
}

@end

@implementation AWSQldbLedgerSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"CreationDateTime",
             @"name" : @"Name",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSQldbLedgerStateCreating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSQldbLedgerStateActive);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSQldbLedgerStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSQldbLedgerStateDeleted);
        }
        return @(AWSQldbLedgerStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQldbLedgerStateCreating:
                return @"CREATING";
            case AWSQldbLedgerStateActive:
                return @"ACTIVE";
            case AWSQldbLedgerStateDeleting:
                return @"DELETING";
            case AWSQldbLedgerStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQldbListJournalKinesisStreamsForLedgerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ledgerName" : @"LedgerName",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSQldbListJournalKinesisStreamsForLedgerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"streams" : @"Streams",
             };
}

+ (NSValueTransformer *)streamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQldbJournalKinesisStreamDescription class]];
}

@end

@implementation AWSQldbListJournalS3ExportsForLedgerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"name" : @"Name",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSQldbListJournalS3ExportsForLedgerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"journalS3Exports" : @"JournalS3Exports",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)journalS3ExportsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQldbJournalS3ExportDescription class]];
}

@end

@implementation AWSQldbListJournalS3ExportsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSQldbListJournalS3ExportsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"journalS3Exports" : @"JournalS3Exports",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)journalS3ExportsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQldbJournalS3ExportDescription class]];
}

@end

@implementation AWSQldbListLedgersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSQldbListLedgersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ledgers" : @"Ledgers",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)ledgersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQldbLedgerSummary class]];
}

@end

@implementation AWSQldbListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSQldbListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSQldbS3EncryptionConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyArn" : @"KmsKeyArn",
             @"objectEncryptionType" : @"ObjectEncryptionType",
             };
}

+ (NSValueTransformer *)objectEncryptionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SSE_KMS"] == NSOrderedSame) {
            return @(AWSQldbS3ObjectEncryptionTypeSseKms);
        }
        if ([value caseInsensitiveCompare:@"SSE_S3"] == NSOrderedSame) {
            return @(AWSQldbS3ObjectEncryptionTypeSseS3);
        }
        if ([value caseInsensitiveCompare:@"NO_ENCRYPTION"] == NSOrderedSame) {
            return @(AWSQldbS3ObjectEncryptionTypeNoEncryption);
        }
        return @(AWSQldbS3ObjectEncryptionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQldbS3ObjectEncryptionTypeSseKms:
                return @"SSE_KMS";
            case AWSQldbS3ObjectEncryptionTypeSseS3:
                return @"SSE_S3";
            case AWSQldbS3ObjectEncryptionTypeNoEncryption:
                return @"NO_ENCRYPTION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQldbS3ExportConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"encryptionConfiguration" : @"EncryptionConfiguration",
             @"prefix" : @"Prefix",
             };
}

+ (NSValueTransformer *)encryptionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbS3EncryptionConfiguration class]];
}

@end

@implementation AWSQldbStreamJournalToKinesisRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exclusiveEndTime" : @"ExclusiveEndTime",
             @"inclusiveStartTime" : @"InclusiveStartTime",
             @"kinesisConfiguration" : @"KinesisConfiguration",
             @"ledgerName" : @"LedgerName",
             @"roleArn" : @"RoleArn",
             @"streamName" : @"StreamName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)exclusiveEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inclusiveStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)kinesisConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbKinesisConfiguration class]];
}

@end

@implementation AWSQldbStreamJournalToKinesisResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamId" : @"StreamId",
             };
}

@end

@implementation AWSQldbTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSQldbTagResourceResponse

@end

@implementation AWSQldbUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSQldbUntagResourceResponse

@end

@implementation AWSQldbUpdateLedgerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deletionProtection" : @"DeletionProtection",
             @"name" : @"Name",
             };
}

@end

@implementation AWSQldbUpdateLedgerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"creationDateTime" : @"CreationDateTime",
             @"deletionProtection" : @"DeletionProtection",
             @"name" : @"Name",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSQldbLedgerStateCreating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSQldbLedgerStateActive);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSQldbLedgerStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSQldbLedgerStateDeleted);
        }
        return @(AWSQldbLedgerStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQldbLedgerStateCreating:
                return @"CREATING";
            case AWSQldbLedgerStateActive:
                return @"ACTIVE";
            case AWSQldbLedgerStateDeleting:
                return @"DELETING";
            case AWSQldbLedgerStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQldbValueHolder

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ionText" : @"IonText",
             };
}

@end
