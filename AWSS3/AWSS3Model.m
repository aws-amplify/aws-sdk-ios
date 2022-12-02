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

#import "AWSS3Model.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSS3ErrorDomain = @"com.amazonaws.AWSS3ErrorDomain";

@implementation AWSS3AbortIncompleteMultipartUpload

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"daysAfterInitiation" : @"DaysAfterInitiation",
             };
}

@end

@implementation AWSS3AbortMultipartUploadOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requestCharged" : @"RequestCharged",
             };
}

+ (NSValueTransformer *)requestChargedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestChargedRequester);
        }
        return @(AWSS3RequestChargedUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestChargedRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3AbortMultipartUploadRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"key" : @"Key",
             @"requestPayer" : @"RequestPayer",
             @"uploadId" : @"UploadId",
             };
}

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestPayerRequester);
        }
        return @(AWSS3RequestPayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestPayerRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3AccelerateConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSS3BucketAccelerateStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"Suspended"] == NSOrderedSame) {
            return @(AWSS3BucketAccelerateStatusSuspended);
        }
        return @(AWSS3BucketAccelerateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3BucketAccelerateStatusEnabled:
                return @"Enabled";
            case AWSS3BucketAccelerateStatusSuspended:
                return @"Suspended";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3AccessControlPolicy

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grants" : @"Grants",
             @"owner" : @"Owner",
             };
}

+ (NSValueTransformer *)grantsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3Grant class]];
}

+ (NSValueTransformer *)ownerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Owner class]];
}

@end

@implementation AWSS3AccessControlTranslation

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"owner" : @"Owner",
             };
}

+ (NSValueTransformer *)ownerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Destination"] == NSOrderedSame) {
            return @(AWSS3OwnerOverrideDestination);
        }
        return @(AWSS3OwnerOverrideUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3OwnerOverrideDestination:
                return @"Destination";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3AnalyticsAndOperator

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"prefix" : @"Prefix",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3Tag class]];
}

@end

@implementation AWSS3AnalyticsConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"identifier" : @"Id",
             @"storageClassAnalysis" : @"StorageClassAnalysis",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3AnalyticsFilter class]];
}

+ (NSValueTransformer *)storageClassAnalysisJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3StorageClassAnalysis class]];
}

@end

@implementation AWSS3AnalyticsExportDestination

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3BucketDestination" : @"S3BucketDestination",
             };
}

+ (NSValueTransformer *)s3BucketDestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3AnalyticsS3BucketDestination class]];
}

@end

@implementation AWSS3AnalyticsFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"AND" : @"And",
             @"prefix" : @"Prefix",
             @"tag" : @"Tag",
             };
}

+ (NSValueTransformer *)ANDJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3AnalyticsAndOperator class]];
}

+ (NSValueTransformer *)tagJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Tag class]];
}

@end

@implementation AWSS3AnalyticsS3BucketDestination

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"bucketAccountId" : @"BucketAccountId",
             @"format" : @"Format",
             @"prefix" : @"Prefix",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CSV"] == NSOrderedSame) {
            return @(AWSS3AnalyticsS3ExportFileFormatCsv);
        }
        return @(AWSS3AnalyticsS3ExportFileFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3AnalyticsS3ExportFileFormatCsv:
                return @"CSV";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3Bucket

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"CreationDate",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSS3BucketLifecycleConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3LifecycleRule class]];
}

@end

@implementation AWSS3BucketLoggingStatus

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loggingEnabled" : @"LoggingEnabled",
             };
}

+ (NSValueTransformer *)loggingEnabledJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3LoggingEnabled class]];
}

@end

@implementation AWSS3CORSConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"CORSRules" : @"CORSRules",
             };
}

+ (NSValueTransformer *)CORSRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3CORSRule class]];
}

@end

@implementation AWSS3CORSRule

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedHeaders" : @"AllowedHeaders",
             @"allowedMethods" : @"AllowedMethods",
             @"allowedOrigins" : @"AllowedOrigins",
             @"exposeHeaders" : @"ExposeHeaders",
             @"maxAgeSeconds" : @"MaxAgeSeconds",
             };
}

@end

@implementation AWSS3CSVInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowQuotedRecordDelimiter" : @"AllowQuotedRecordDelimiter",
             @"comments" : @"Comments",
             @"fieldDelimiter" : @"FieldDelimiter",
             @"fileHeaderInfo" : @"FileHeaderInfo",
             @"quoteCharacter" : @"QuoteCharacter",
             @"quoteEscapeCharacter" : @"QuoteEscapeCharacter",
             @"recordDelimiter" : @"RecordDelimiter",
             };
}

+ (NSValueTransformer *)fileHeaderInfoJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USE"] == NSOrderedSame) {
            return @(AWSS3FileHeaderInfoUse);
        }
        if ([value caseInsensitiveCompare:@"IGNORE"] == NSOrderedSame) {
            return @(AWSS3FileHeaderInfoIgnore);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSS3FileHeaderInfoNone);
        }
        return @(AWSS3FileHeaderInfoUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3FileHeaderInfoUse:
                return @"USE";
            case AWSS3FileHeaderInfoIgnore:
                return @"IGNORE";
            case AWSS3FileHeaderInfoNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3CSVOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fieldDelimiter" : @"FieldDelimiter",
             @"quoteCharacter" : @"QuoteCharacter",
             @"quoteEscapeCharacter" : @"QuoteEscapeCharacter",
             @"quoteFields" : @"QuoteFields",
             @"recordDelimiter" : @"RecordDelimiter",
             };
}

+ (NSValueTransformer *)quoteFieldsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALWAYS"] == NSOrderedSame) {
            return @(AWSS3QuoteFieldsAlways);
        }
        if ([value caseInsensitiveCompare:@"ASNEEDED"] == NSOrderedSame) {
            return @(AWSS3QuoteFieldsAsneeded);
        }
        return @(AWSS3QuoteFieldsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3QuoteFieldsAlways:
                return @"ALWAYS";
            case AWSS3QuoteFieldsAsneeded:
                return @"ASNEEDED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3CloudFunctionConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudFunction" : @"CloudFunction",
             @"event" : @"Event",
             @"events" : @"Events",
             @"identifier" : @"Id",
             @"invocationRole" : @"InvocationRole",
             };
}

+ (NSValueTransformer *)eventJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"s3:ReducedRedundancyLostObject"] == NSOrderedSame) {
            return @(AWSS3EventS3ReducedRedundancyLostObject);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectCreated:*"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectCreated);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectCreated:Put"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectCreatedPut);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectCreated:Post"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectCreatedPost);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectCreated:Copy"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectCreatedCopy);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectCreated:CompleteMultipartUpload"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectCreatedCompleteMultipartUpload);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectRemoved:*"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectRemoved);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectRemoved:Delete"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectRemovedDelete);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectRemoved:DeleteMarkerCreated"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectRemovedDeleteMarkerCreated);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectRestore:*"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectRestore);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectRestore:Post"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectRestorePost);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectRestore:Completed"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectRestoreCompleted);
        }
        if ([value caseInsensitiveCompare:@"s3:Replication:*"] == NSOrderedSame) {
            return @(AWSS3EventS3Replication);
        }
        if ([value caseInsensitiveCompare:@"s3:Replication:OperationFailedReplication"] == NSOrderedSame) {
            return @(AWSS3EventS3ReplicationOperationFailedReplication);
        }
        if ([value caseInsensitiveCompare:@"s3:Replication:OperationNotTracked"] == NSOrderedSame) {
            return @(AWSS3EventS3ReplicationOperationNotTracked);
        }
        if ([value caseInsensitiveCompare:@"s3:Replication:OperationMissedThreshold"] == NSOrderedSame) {
            return @(AWSS3EventS3ReplicationOperationMissedThreshold);
        }
        if ([value caseInsensitiveCompare:@"s3:Replication:OperationReplicatedAfterThreshold"] == NSOrderedSame) {
            return @(AWSS3EventS3ReplicationOperationReplicatedAfterThreshold);
        }
        return @(AWSS3EventUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3EventS3ReducedRedundancyLostObject:
                return @"s3:ReducedRedundancyLostObject";
            case AWSS3EventS3ObjectCreated:
                return @"s3:ObjectCreated:*";
            case AWSS3EventS3ObjectCreatedPut:
                return @"s3:ObjectCreated:Put";
            case AWSS3EventS3ObjectCreatedPost:
                return @"s3:ObjectCreated:Post";
            case AWSS3EventS3ObjectCreatedCopy:
                return @"s3:ObjectCreated:Copy";
            case AWSS3EventS3ObjectCreatedCompleteMultipartUpload:
                return @"s3:ObjectCreated:CompleteMultipartUpload";
            case AWSS3EventS3ObjectRemoved:
                return @"s3:ObjectRemoved:*";
            case AWSS3EventS3ObjectRemovedDelete:
                return @"s3:ObjectRemoved:Delete";
            case AWSS3EventS3ObjectRemovedDeleteMarkerCreated:
                return @"s3:ObjectRemoved:DeleteMarkerCreated";
            case AWSS3EventS3ObjectRestore:
                return @"s3:ObjectRestore:*";
            case AWSS3EventS3ObjectRestorePost:
                return @"s3:ObjectRestore:Post";
            case AWSS3EventS3ObjectRestoreCompleted:
                return @"s3:ObjectRestore:Completed";
            case AWSS3EventS3Replication:
                return @"s3:Replication:*";
            case AWSS3EventS3ReplicationOperationFailedReplication:
                return @"s3:Replication:OperationFailedReplication";
            case AWSS3EventS3ReplicationOperationNotTracked:
                return @"s3:Replication:OperationNotTracked";
            case AWSS3EventS3ReplicationOperationMissedThreshold:
                return @"s3:Replication:OperationMissedThreshold";
            case AWSS3EventS3ReplicationOperationReplicatedAfterThreshold:
                return @"s3:Replication:OperationReplicatedAfterThreshold";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3CommonPrefix

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"prefix" : @"Prefix",
             };
}

@end

@implementation AWSS3CompleteMultipartUploadOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"ETag" : @"ETag",
             @"expiration" : @"Expiration",
             @"key" : @"Key",
             @"location" : @"Location",
             @"requestCharged" : @"RequestCharged",
             @"SSEKMSKeyId" : @"SSEKMSKeyId",
             @"serverSideEncryption" : @"ServerSideEncryption",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)requestChargedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestChargedRequester);
        }
        return @(AWSS3RequestChargedUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestChargedRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serverSideEncryptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES256"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value caseInsensitiveCompare:@"aws:kms"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAwsKms);
        }
        return @(AWSS3ServerSideEncryptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ServerSideEncryptionAES256:
                return @"AES256";
            case AWSS3ServerSideEncryptionAwsKms:
                return @"aws:kms";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3CompleteMultipartUploadRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"key" : @"Key",
             @"multipartUpload" : @"MultipartUpload",
             @"requestPayer" : @"RequestPayer",
             @"uploadId" : @"UploadId",
             };
}

+ (NSValueTransformer *)multipartUploadJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3CompletedMultipartUpload class]];
}

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestPayerRequester);
        }
        return @(AWSS3RequestPayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestPayerRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3CompletedMultipartUpload

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parts" : @"Parts",
             };
}

+ (NSValueTransformer *)partsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3CompletedPart class]];
}

@end

@implementation AWSS3CompletedPart

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"partNumber" : @"PartNumber",
             };
}

@end

@implementation AWSS3Condition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"httpErrorCodeReturnedEquals" : @"HttpErrorCodeReturnedEquals",
             @"keyPrefixEquals" : @"KeyPrefixEquals",
             };
}

@end

@implementation AWSS3ContinuationEvent

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSS3ReplicateObjectOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicateObjectResult" : @"CopyObjectResult",
             @"replicateSourceVersionId" : @"CopySourceVersionId",
             @"expiration" : @"Expiration",
             @"requestCharged" : @"RequestCharged",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"SSEKMSEncryptionContext" : @"SSEKMSEncryptionContext",
             @"SSEKMSKeyId" : @"SSEKMSKeyId",
             @"serverSideEncryption" : @"ServerSideEncryption",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)replicateObjectResultJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ReplicateObjectResult class]];
}

+ (NSValueTransformer *)requestChargedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestChargedRequester);
        }
        return @(AWSS3RequestChargedUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestChargedRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serverSideEncryptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES256"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value caseInsensitiveCompare:@"aws:kms"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAwsKms);
        }
        return @(AWSS3ServerSideEncryptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ServerSideEncryptionAES256:
                return @"AES256";
            case AWSS3ServerSideEncryptionAwsKms:
                return @"aws:kms";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3ReplicateObjectRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ACL" : @"ACL",
             @"bucket" : @"Bucket",
             @"cacheControl" : @"CacheControl",
             @"contentDisposition" : @"ContentDisposition",
             @"contentEncoding" : @"ContentEncoding",
             @"contentLanguage" : @"ContentLanguage",
             @"contentType" : @"ContentType",
             @"replicateSource" : @"CopySource",
             @"replicateSourceIfMatch" : @"CopySourceIfMatch",
             @"replicateSourceIfModifiedSince" : @"CopySourceIfModifiedSince",
             @"replicateSourceIfNoneMatch" : @"CopySourceIfNoneMatch",
             @"replicateSourceIfUnmodifiedSince" : @"CopySourceIfUnmodifiedSince",
             @"replicateSourceSSECustomerAlgorithm" : @"CopySourceSSECustomerAlgorithm",
             @"replicateSourceSSECustomerKey" : @"CopySourceSSECustomerKey",
             @"replicateSourceSSECustomerKeyMD5" : @"CopySourceSSECustomerKeyMD5",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"expectedSourceBucketOwner" : @"ExpectedSourceBucketOwner",
             @"expires" : @"Expires",
             @"grantFullControl" : @"GrantFullControl",
             @"grantRead" : @"GrantRead",
             @"grantReadACP" : @"GrantReadACP",
             @"grantWriteACP" : @"GrantWriteACP",
             @"key" : @"Key",
             @"metadata" : @"Metadata",
             @"metadataDirective" : @"MetadataDirective",
             @"objectLockLegalHoldStatus" : @"ObjectLockLegalHoldStatus",
             @"objectLockMode" : @"ObjectLockMode",
             @"objectLockRetainUntilDate" : @"ObjectLockRetainUntilDate",
             @"requestPayer" : @"RequestPayer",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKey" : @"SSECustomerKey",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"SSEKMSEncryptionContext" : @"SSEKMSEncryptionContext",
             @"SSEKMSKeyId" : @"SSEKMSKeyId",
             @"serverSideEncryption" : @"ServerSideEncryption",
             @"storageClass" : @"StorageClass",
             @"tagging" : @"Tagging",
             @"taggingDirective" : @"TaggingDirective",
             @"websiteRedirectLocation" : @"WebsiteRedirectLocation",
             };
}

+ (NSValueTransformer *)ACLJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"private"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLPrivate);
        }
        if ([value caseInsensitiveCompare:@"public-read"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLPublicRead);
        }
        if ([value caseInsensitiveCompare:@"public-read-write"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLPublicReadWrite);
        }
        if ([value caseInsensitiveCompare:@"authenticated-read"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLAuthenticatedRead);
        }
        if ([value caseInsensitiveCompare:@"aws-exec-read"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLAwsExecRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-read"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLBucketOwnerRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-full-control"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLBucketOwnerFullControl);
        }
        return @(AWSS3ObjectCannedACLUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ObjectCannedACLPrivate:
                return @"private";
            case AWSS3ObjectCannedACLPublicRead:
                return @"public-read";
            case AWSS3ObjectCannedACLPublicReadWrite:
                return @"public-read-write";
            case AWSS3ObjectCannedACLAuthenticatedRead:
                return @"authenticated-read";
            case AWSS3ObjectCannedACLAwsExecRead:
                return @"aws-exec-read";
            case AWSS3ObjectCannedACLBucketOwnerRead:
                return @"bucket-owner-read";
            case AWSS3ObjectCannedACLBucketOwnerFullControl:
                return @"bucket-owner-full-control";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)replicateSourceIfModifiedSinceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)replicateSourceIfUnmodifiedSinceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)expiresJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)metadataDirectiveJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COPY"] == NSOrderedSame) {
            return @(AWSS3MetadataDirectiveCopy);
        }
        if ([value caseInsensitiveCompare:@"REPLACE"] == NSOrderedSame) {
            return @(AWSS3MetadataDirectiveReplace);
        }
        return @(AWSS3MetadataDirectiveUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3MetadataDirectiveCopy:
                return @"COPY";
            case AWSS3MetadataDirectiveReplace:
                return @"REPLACE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)objectLockLegalHoldStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ON"] == NSOrderedSame) {
            return @(AWSS3ObjectLockLegalHoldStatusOn);
        }
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSS3ObjectLockLegalHoldStatusOff);
        }
        return @(AWSS3ObjectLockLegalHoldStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ObjectLockLegalHoldStatusOn:
                return @"ON";
            case AWSS3ObjectLockLegalHoldStatusOff:
                return @"OFF";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)objectLockModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GOVERNANCE"] == NSOrderedSame) {
            return @(AWSS3ObjectLockModeGovernance);
        }
        if ([value caseInsensitiveCompare:@"COMPLIANCE"] == NSOrderedSame) {
            return @(AWSS3ObjectLockModeCompliance);
        }
        return @(AWSS3ObjectLockModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ObjectLockModeGovernance:
                return @"GOVERNANCE";
            case AWSS3ObjectLockModeCompliance:
                return @"COMPLIANCE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)objectLockRetainUntilDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestPayerRequester);
        }
        return @(AWSS3RequestPayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestPayerRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serverSideEncryptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES256"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value caseInsensitiveCompare:@"aws:kms"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAwsKms);
        }
        return @(AWSS3ServerSideEncryptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ServerSideEncryptionAES256:
                return @"AES256";
            case AWSS3ServerSideEncryptionAwsKms:
                return @"aws:kms";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)storageClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSS3StorageClassStandard);
        }
        if ([value caseInsensitiveCompare:@"REDUCED_REDUNDANCY"] == NSOrderedSame) {
            return @(AWSS3StorageClassReducedRedundancy);
        }
        if ([value caseInsensitiveCompare:@"STANDARD_IA"] == NSOrderedSame) {
            return @(AWSS3StorageClassStandardIa);
        }
        if ([value caseInsensitiveCompare:@"ONEZONE_IA"] == NSOrderedSame) {
            return @(AWSS3StorageClassOnezoneIa);
        }
        if ([value caseInsensitiveCompare:@"INTELLIGENT_TIERING"] == NSOrderedSame) {
            return @(AWSS3StorageClassIntelligentTiering);
        }
        if ([value caseInsensitiveCompare:@"GLACIER"] == NSOrderedSame) {
            return @(AWSS3StorageClassGlacier);
        }
        if ([value caseInsensitiveCompare:@"DEEP_ARCHIVE"] == NSOrderedSame) {
            return @(AWSS3StorageClassDeepArchive);
        }
        if ([value caseInsensitiveCompare:@"OUTPOSTS"] == NSOrderedSame) {
            return @(AWSS3StorageClassOutposts);
        }
        return @(AWSS3StorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3StorageClassStandard:
                return @"STANDARD";
            case AWSS3StorageClassReducedRedundancy:
                return @"REDUCED_REDUNDANCY";
            case AWSS3StorageClassStandardIa:
                return @"STANDARD_IA";
            case AWSS3StorageClassOnezoneIa:
                return @"ONEZONE_IA";
            case AWSS3StorageClassIntelligentTiering:
                return @"INTELLIGENT_TIERING";
            case AWSS3StorageClassGlacier:
                return @"GLACIER";
            case AWSS3StorageClassDeepArchive:
                return @"DEEP_ARCHIVE";
            case AWSS3StorageClassOutposts:
                return @"OUTPOSTS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taggingDirectiveJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COPY"] == NSOrderedSame) {
            return @(AWSS3TaggingDirectiveCopy);
        }
        if ([value caseInsensitiveCompare:@"REPLACE"] == NSOrderedSame) {
            return @(AWSS3TaggingDirectiveReplace);
        }
        return @(AWSS3TaggingDirectiveUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3TaggingDirectiveCopy:
                return @"COPY";
            case AWSS3TaggingDirectiveReplace:
                return @"REPLACE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3ReplicateObjectResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"lastModified" : @"LastModified",
             };
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSS3ReplicatePartResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"lastModified" : @"LastModified",
             };
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSS3CreateBucketConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"locationConstraint" : @"LocationConstraint",
             };
}

+ (NSValueTransformer *)locationConstraintJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@""] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintBlank);
        }
        if ([value caseInsensitiveCompare:@"af-south-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAFSouth1);
        }
        if ([value caseInsensitiveCompare:@"ap-east-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPEast1);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPNortheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPNortheast2);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-3"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPNortheast3);
        }
        if ([value caseInsensitiveCompare:@"ap-south-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPSouth1);
        }
        if ([value caseInsensitiveCompare:@"ap-south-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPSouth2);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPSoutheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPSoutheast2);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-3"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPSoutheast3);
        }
        if ([value caseInsensitiveCompare:@"ca-central-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintCACentral1);
        }
        if ([value caseInsensitiveCompare:@"cn-north-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintCNNorth1);
        }
        if ([value caseInsensitiveCompare:@"cn-northwest-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintCNNorthwest1);
        }
        if ([value caseInsensitiveCompare:@"EU"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEU);
        }
        if ([value caseInsensitiveCompare:@"eu-central-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEUCentral1);
        }
        if ([value caseInsensitiveCompare:@"eu-central-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEUCentral2);
        }
        if ([value caseInsensitiveCompare:@"eu-north-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEUNorth1);
        }
        if ([value caseInsensitiveCompare:@"eu-south-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEUSouth1);
        }
        if ([value caseInsensitiveCompare:@"eu-south-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEUSouth2);
        }
        if ([value caseInsensitiveCompare:@"eu-west-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEUWest1);
        }
        if ([value caseInsensitiveCompare:@"eu-west-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEUWest2);
        }
        if ([value caseInsensitiveCompare:@"eu-west-3"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEUWest3);
        }
        if ([value caseInsensitiveCompare:@"me-central-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintMECentral1);
        }
        if ([value caseInsensitiveCompare:@"me-south-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintMESouth1);
        }
        if ([value caseInsensitiveCompare:@"sa-east-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintSAEast1);
        }
        if ([value caseInsensitiveCompare:@"us-east-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintUSEast2);
        }
        if ([value caseInsensitiveCompare:@"us-gov-east-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintUSGovEast1);
        }
        if ([value caseInsensitiveCompare:@"us-gov-west-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintUSGovWest1);
        }
        if ([value caseInsensitiveCompare:@"us-west-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintUSWest1);
        }
        if ([value caseInsensitiveCompare:@"us-west-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintUSWest2);
        }
        return @(AWSS3BucketLocationConstraintUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3BucketLocationConstraintBlank:
                return @"";
            case AWSS3BucketLocationConstraintAFSouth1:
                return @"af-south-1";
            case AWSS3BucketLocationConstraintAPEast1:
                return @"ap-east-1";
            case AWSS3BucketLocationConstraintAPNortheast1:
                return @"ap-northeast-1";
            case AWSS3BucketLocationConstraintAPNortheast2:
                return @"ap-northeast-2";
            case AWSS3BucketLocationConstraintAPNortheast3:
                return @"ap-northeast-3";
            case AWSS3BucketLocationConstraintAPSouth1:
                return @"ap-south-1";
            case AWSS3BucketLocationConstraintAPSouth2:
                return @"ap-south-2";
            case AWSS3BucketLocationConstraintAPSoutheast1:
                return @"ap-southeast-1";
            case AWSS3BucketLocationConstraintAPSoutheast2:
                return @"ap-southeast-2";
            case AWSS3BucketLocationConstraintAPSoutheast3:
                return @"ap-southeast-3";
            case AWSS3BucketLocationConstraintCACentral1:
                return @"ca-central-1";
            case AWSS3BucketLocationConstraintCNNorth1:
                return @"cn-north-1";
            case AWSS3BucketLocationConstraintCNNorthwest1:
                return @"cn-northwest-1";
            case AWSS3BucketLocationConstraintEU:
                return @"EU";
            case AWSS3BucketLocationConstraintEUCentral1:
                return @"eu-central-1";
            case AWSS3BucketLocationConstraintEUCentral2:
                return @"eu-central-2";
            case AWSS3BucketLocationConstraintEUNorth1:
                return @"eu-north-1";
            case AWSS3BucketLocationConstraintEUSouth1:
                return @"eu-south-1";
            case AWSS3BucketLocationConstraintEUSouth2:
                return @"eu-south-2";
            case AWSS3BucketLocationConstraintEUWest1:
                return @"eu-west-1";
            case AWSS3BucketLocationConstraintEUWest2:
                return @"eu-west-2";
            case AWSS3BucketLocationConstraintEUWest3:
                return @"eu-west-3";
            case AWSS3BucketLocationConstraintMECentral1:
                return @"me-central-1";
            case AWSS3BucketLocationConstraintMESouth1:
                return @"me-south-1";
            case AWSS3BucketLocationConstraintSAEast1:
                return @"sa-east-1";
            case AWSS3BucketLocationConstraintUSEast2:
                return @"us-east-2";
            case AWSS3BucketLocationConstraintUSGovEast1:
                return @"us-gov-east-1";
            case AWSS3BucketLocationConstraintUSGovWest1:
                return @"us-gov-west-1";
            case AWSS3BucketLocationConstraintUSWest1:
                return @"us-west-1";
            case AWSS3BucketLocationConstraintUSWest2:
                return @"us-west-2";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3CreateBucketOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"location" : @"Location",
             };
}

@end

@implementation AWSS3CreateBucketRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ACL" : @"ACL",
             @"bucket" : @"Bucket",
             @"createBucketConfiguration" : @"CreateBucketConfiguration",
             @"grantFullControl" : @"GrantFullControl",
             @"grantRead" : @"GrantRead",
             @"grantReadACP" : @"GrantReadACP",
             @"grantWrite" : @"GrantWrite",
             @"grantWriteACP" : @"GrantWriteACP",
             @"objectLockEnabledForBucket" : @"ObjectLockEnabledForBucket",
             };
}

+ (NSValueTransformer *)ACLJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"private"] == NSOrderedSame) {
            return @(AWSS3BucketCannedACLPrivate);
        }
        if ([value caseInsensitiveCompare:@"public-read"] == NSOrderedSame) {
            return @(AWSS3BucketCannedACLPublicRead);
        }
        if ([value caseInsensitiveCompare:@"public-read-write"] == NSOrderedSame) {
            return @(AWSS3BucketCannedACLPublicReadWrite);
        }
        if ([value caseInsensitiveCompare:@"authenticated-read"] == NSOrderedSame) {
            return @(AWSS3BucketCannedACLAuthenticatedRead);
        }
        return @(AWSS3BucketCannedACLUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3BucketCannedACLPrivate:
                return @"private";
            case AWSS3BucketCannedACLPublicRead:
                return @"public-read";
            case AWSS3BucketCannedACLPublicReadWrite:
                return @"public-read-write";
            case AWSS3BucketCannedACLAuthenticatedRead:
                return @"authenticated-read";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createBucketConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3CreateBucketConfiguration class]];
}

@end

@implementation AWSS3CreateMultipartUploadOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"abortDate" : @"AbortDate",
             @"abortRuleId" : @"AbortRuleId",
             @"bucket" : @"Bucket",
             @"key" : @"Key",
             @"requestCharged" : @"RequestCharged",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"SSEKMSEncryptionContext" : @"SSEKMSEncryptionContext",
             @"SSEKMSKeyId" : @"SSEKMSKeyId",
             @"serverSideEncryption" : @"ServerSideEncryption",
             @"uploadId" : @"UploadId",
             };
}

+ (NSValueTransformer *)abortDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)requestChargedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestChargedRequester);
        }
        return @(AWSS3RequestChargedUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestChargedRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serverSideEncryptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES256"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value caseInsensitiveCompare:@"aws:kms"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAwsKms);
        }
        return @(AWSS3ServerSideEncryptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ServerSideEncryptionAES256:
                return @"AES256";
            case AWSS3ServerSideEncryptionAwsKms:
                return @"aws:kms";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3CreateMultipartUploadRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ACL" : @"ACL",
             @"bucket" : @"Bucket",
             @"cacheControl" : @"CacheControl",
             @"contentDisposition" : @"ContentDisposition",
             @"contentEncoding" : @"ContentEncoding",
             @"contentLanguage" : @"ContentLanguage",
             @"contentType" : @"ContentType",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"expires" : @"Expires",
             @"grantFullControl" : @"GrantFullControl",
             @"grantRead" : @"GrantRead",
             @"grantReadACP" : @"GrantReadACP",
             @"grantWriteACP" : @"GrantWriteACP",
             @"key" : @"Key",
             @"metadata" : @"Metadata",
             @"objectLockLegalHoldStatus" : @"ObjectLockLegalHoldStatus",
             @"objectLockMode" : @"ObjectLockMode",
             @"objectLockRetainUntilDate" : @"ObjectLockRetainUntilDate",
             @"requestPayer" : @"RequestPayer",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKey" : @"SSECustomerKey",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"SSEKMSEncryptionContext" : @"SSEKMSEncryptionContext",
             @"SSEKMSKeyId" : @"SSEKMSKeyId",
             @"serverSideEncryption" : @"ServerSideEncryption",
             @"storageClass" : @"StorageClass",
             @"tagging" : @"Tagging",
             @"websiteRedirectLocation" : @"WebsiteRedirectLocation",
             };
}

+ (NSValueTransformer *)ACLJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"private"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLPrivate);
        }
        if ([value caseInsensitiveCompare:@"public-read"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLPublicRead);
        }
        if ([value caseInsensitiveCompare:@"public-read-write"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLPublicReadWrite);
        }
        if ([value caseInsensitiveCompare:@"authenticated-read"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLAuthenticatedRead);
        }
        if ([value caseInsensitiveCompare:@"aws-exec-read"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLAwsExecRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-read"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLBucketOwnerRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-full-control"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLBucketOwnerFullControl);
        }
        return @(AWSS3ObjectCannedACLUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ObjectCannedACLPrivate:
                return @"private";
            case AWSS3ObjectCannedACLPublicRead:
                return @"public-read";
            case AWSS3ObjectCannedACLPublicReadWrite:
                return @"public-read-write";
            case AWSS3ObjectCannedACLAuthenticatedRead:
                return @"authenticated-read";
            case AWSS3ObjectCannedACLAwsExecRead:
                return @"aws-exec-read";
            case AWSS3ObjectCannedACLBucketOwnerRead:
                return @"bucket-owner-read";
            case AWSS3ObjectCannedACLBucketOwnerFullControl:
                return @"bucket-owner-full-control";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)expiresJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)objectLockLegalHoldStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ON"] == NSOrderedSame) {
            return @(AWSS3ObjectLockLegalHoldStatusOn);
        }
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSS3ObjectLockLegalHoldStatusOff);
        }
        return @(AWSS3ObjectLockLegalHoldStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ObjectLockLegalHoldStatusOn:
                return @"ON";
            case AWSS3ObjectLockLegalHoldStatusOff:
                return @"OFF";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)objectLockModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GOVERNANCE"] == NSOrderedSame) {
            return @(AWSS3ObjectLockModeGovernance);
        }
        if ([value caseInsensitiveCompare:@"COMPLIANCE"] == NSOrderedSame) {
            return @(AWSS3ObjectLockModeCompliance);
        }
        return @(AWSS3ObjectLockModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ObjectLockModeGovernance:
                return @"GOVERNANCE";
            case AWSS3ObjectLockModeCompliance:
                return @"COMPLIANCE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)objectLockRetainUntilDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestPayerRequester);
        }
        return @(AWSS3RequestPayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestPayerRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serverSideEncryptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES256"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value caseInsensitiveCompare:@"aws:kms"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAwsKms);
        }
        return @(AWSS3ServerSideEncryptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ServerSideEncryptionAES256:
                return @"AES256";
            case AWSS3ServerSideEncryptionAwsKms:
                return @"aws:kms";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)storageClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSS3StorageClassStandard);
        }
        if ([value caseInsensitiveCompare:@"REDUCED_REDUNDANCY"] == NSOrderedSame) {
            return @(AWSS3StorageClassReducedRedundancy);
        }
        if ([value caseInsensitiveCompare:@"STANDARD_IA"] == NSOrderedSame) {
            return @(AWSS3StorageClassStandardIa);
        }
        if ([value caseInsensitiveCompare:@"ONEZONE_IA"] == NSOrderedSame) {
            return @(AWSS3StorageClassOnezoneIa);
        }
        if ([value caseInsensitiveCompare:@"INTELLIGENT_TIERING"] == NSOrderedSame) {
            return @(AWSS3StorageClassIntelligentTiering);
        }
        if ([value caseInsensitiveCompare:@"GLACIER"] == NSOrderedSame) {
            return @(AWSS3StorageClassGlacier);
        }
        if ([value caseInsensitiveCompare:@"DEEP_ARCHIVE"] == NSOrderedSame) {
            return @(AWSS3StorageClassDeepArchive);
        }
        if ([value caseInsensitiveCompare:@"OUTPOSTS"] == NSOrderedSame) {
            return @(AWSS3StorageClassOutposts);
        }
        return @(AWSS3StorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3StorageClassStandard:
                return @"STANDARD";
            case AWSS3StorageClassReducedRedundancy:
                return @"REDUCED_REDUNDANCY";
            case AWSS3StorageClassStandardIa:
                return @"STANDARD_IA";
            case AWSS3StorageClassOnezoneIa:
                return @"ONEZONE_IA";
            case AWSS3StorageClassIntelligentTiering:
                return @"INTELLIGENT_TIERING";
            case AWSS3StorageClassGlacier:
                return @"GLACIER";
            case AWSS3StorageClassDeepArchive:
                return @"DEEP_ARCHIVE";
            case AWSS3StorageClassOutposts:
                return @"OUTPOSTS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3DefaultRetention

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"days" : @"Days",
             @"mode" : @"Mode",
             @"years" : @"Years",
             };
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GOVERNANCE"] == NSOrderedSame) {
            return @(AWSS3ObjectLockRetentionModeGovernance);
        }
        if ([value caseInsensitiveCompare:@"COMPLIANCE"] == NSOrderedSame) {
            return @(AWSS3ObjectLockRetentionModeCompliance);
        }
        return @(AWSS3ObjectLockRetentionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ObjectLockRetentionModeGovernance:
                return @"GOVERNANCE";
            case AWSS3ObjectLockRetentionModeCompliance:
                return @"COMPLIANCE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3Remove

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"objects" : @"Objects",
             @"quiet" : @"Quiet",
             };
}

+ (NSValueTransformer *)objectsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3ObjectIdentifier class]];
}

@end

@implementation AWSS3DeleteBucketAnalyticsConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSS3DeleteBucketCorsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3DeleteBucketEncryptionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3DeleteBucketInventoryConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSS3DeleteBucketLifecycleRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3DeleteBucketMetricsConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSS3DeleteBucketOwnershipControlsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3DeleteBucketPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3DeleteBucketReplicationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3DeleteBucketRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3DeleteBucketTaggingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3DeleteBucketWebsiteRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3DeleteMarkerEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isLatest" : @"IsLatest",
             @"key" : @"Key",
             @"lastModified" : @"LastModified",
             @"owner" : @"Owner",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)ownerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Owner class]];
}

@end

@implementation AWSS3DeleteMarkerReplication

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSS3DeleteMarkerReplicationStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSS3DeleteMarkerReplicationStatusDisabled);
        }
        return @(AWSS3DeleteMarkerReplicationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3DeleteMarkerReplicationStatusEnabled:
                return @"Enabled";
            case AWSS3DeleteMarkerReplicationStatusDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3DeleteObjectOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleteMarker" : @"DeleteMarker",
             @"requestCharged" : @"RequestCharged",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)requestChargedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestChargedRequester);
        }
        return @(AWSS3RequestChargedUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestChargedRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3DeleteObjectRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"bypassGovernanceRetention" : @"BypassGovernanceRetention",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"key" : @"Key",
             @"MFA" : @"MFA",
             @"requestPayer" : @"RequestPayer",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestPayerRequester);
        }
        return @(AWSS3RequestPayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestPayerRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3DeleteObjectTaggingOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSS3DeleteObjectTaggingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"key" : @"Key",
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSS3DeleteObjectsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleted" : @"Deleted",
             @"errors" : @"Errors",
             @"requestCharged" : @"RequestCharged",
             };
}

+ (NSValueTransformer *)deletedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3DeletedObject class]];
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3Error class]];
}

+ (NSValueTransformer *)requestChargedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestChargedRequester);
        }
        return @(AWSS3RequestChargedUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestChargedRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3DeleteObjectsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"bypassGovernanceRetention" : @"BypassGovernanceRetention",
             @"remove" : @"Delete",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"MFA" : @"MFA",
             @"requestPayer" : @"RequestPayer",
             };
}

+ (NSValueTransformer *)removeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Remove class]];
}

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestPayerRequester);
        }
        return @(AWSS3RequestPayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestPayerRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3DeletePublicAccessBlockRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3DeletedObject

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleteMarker" : @"DeleteMarker",
             @"deleteMarkerVersionId" : @"DeleteMarkerVersionId",
             @"key" : @"Key",
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSS3Destination

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessControlTranslation" : @"AccessControlTranslation",
             @"account" : @"Account",
             @"bucket" : @"Bucket",
             @"encryptionConfiguration" : @"EncryptionConfiguration",
             @"metrics" : @"Metrics",
             @"replicationTime" : @"ReplicationTime",
             @"storageClass" : @"StorageClass",
             };
}

+ (NSValueTransformer *)accessControlTranslationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3AccessControlTranslation class]];
}

+ (NSValueTransformer *)encryptionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3EncryptionConfiguration class]];
}

+ (NSValueTransformer *)metricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Metrics class]];
}

+ (NSValueTransformer *)replicationTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ReplicationTime class]];
}

+ (NSValueTransformer *)storageClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSS3StorageClassStandard);
        }
        if ([value caseInsensitiveCompare:@"REDUCED_REDUNDANCY"] == NSOrderedSame) {
            return @(AWSS3StorageClassReducedRedundancy);
        }
        if ([value caseInsensitiveCompare:@"STANDARD_IA"] == NSOrderedSame) {
            return @(AWSS3StorageClassStandardIa);
        }
        if ([value caseInsensitiveCompare:@"ONEZONE_IA"] == NSOrderedSame) {
            return @(AWSS3StorageClassOnezoneIa);
        }
        if ([value caseInsensitiveCompare:@"INTELLIGENT_TIERING"] == NSOrderedSame) {
            return @(AWSS3StorageClassIntelligentTiering);
        }
        if ([value caseInsensitiveCompare:@"GLACIER"] == NSOrderedSame) {
            return @(AWSS3StorageClassGlacier);
        }
        if ([value caseInsensitiveCompare:@"DEEP_ARCHIVE"] == NSOrderedSame) {
            return @(AWSS3StorageClassDeepArchive);
        }
        if ([value caseInsensitiveCompare:@"OUTPOSTS"] == NSOrderedSame) {
            return @(AWSS3StorageClassOutposts);
        }
        return @(AWSS3StorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3StorageClassStandard:
                return @"STANDARD";
            case AWSS3StorageClassReducedRedundancy:
                return @"REDUCED_REDUNDANCY";
            case AWSS3StorageClassStandardIa:
                return @"STANDARD_IA";
            case AWSS3StorageClassOnezoneIa:
                return @"ONEZONE_IA";
            case AWSS3StorageClassIntelligentTiering:
                return @"INTELLIGENT_TIERING";
            case AWSS3StorageClassGlacier:
                return @"GLACIER";
            case AWSS3StorageClassDeepArchive:
                return @"DEEP_ARCHIVE";
            case AWSS3StorageClassOutposts:
                return @"OUTPOSTS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3Encryption

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionType" : @"EncryptionType",
             @"KMSContext" : @"KMSContext",
             @"KMSKeyId" : @"KMSKeyId",
             };
}

+ (NSValueTransformer *)encryptionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES256"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value caseInsensitiveCompare:@"aws:kms"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAwsKms);
        }
        return @(AWSS3ServerSideEncryptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ServerSideEncryptionAES256:
                return @"AES256";
            case AWSS3ServerSideEncryptionAwsKms:
                return @"aws:kms";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3EncryptionConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicaKmsKeyID" : @"ReplicaKmsKeyID",
             };
}

@end

@implementation AWSS3EndEvent

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSS3Error

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"key" : @"Key",
             @"message" : @"Message",
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSS3ErrorDocument

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             };
}

@end

@implementation AWSS3ExistingObjectReplication

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSS3ExistingObjectReplicationStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSS3ExistingObjectReplicationStatusDisabled);
        }
        return @(AWSS3ExistingObjectReplicationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ExistingObjectReplicationStatusEnabled:
                return @"Enabled";
            case AWSS3ExistingObjectReplicationStatusDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3FilterRule

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"prefix"] == NSOrderedSame) {
            return @(AWSS3FilterRuleNamePrefix);
        }
        if ([value caseInsensitiveCompare:@"suffix"] == NSOrderedSame) {
            return @(AWSS3FilterRuleNameSuffix);
        }
        return @(AWSS3FilterRuleNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3FilterRuleNamePrefix:
                return @"prefix";
            case AWSS3FilterRuleNameSuffix:
                return @"suffix";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3GetBucketAccelerateConfigurationOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSS3BucketAccelerateStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"Suspended"] == NSOrderedSame) {
            return @(AWSS3BucketAccelerateStatusSuspended);
        }
        return @(AWSS3BucketAccelerateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3BucketAccelerateStatusEnabled:
                return @"Enabled";
            case AWSS3BucketAccelerateStatusSuspended:
                return @"Suspended";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3GetBucketAccelerateConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3GetBucketAclOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grants" : @"Grants",
             @"owner" : @"Owner",
             };
}

+ (NSValueTransformer *)grantsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3Grant class]];
}

+ (NSValueTransformer *)ownerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Owner class]];
}

@end

@implementation AWSS3GetBucketAclRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3GetBucketAnalyticsConfigurationOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyticsConfiguration" : @"AnalyticsConfiguration",
             };
}

+ (NSValueTransformer *)analyticsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3AnalyticsConfiguration class]];
}

@end

@implementation AWSS3GetBucketAnalyticsConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSS3GetBucketCorsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"CORSRules" : @"CORSRules",
             };
}

+ (NSValueTransformer *)CORSRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3CORSRule class]];
}

@end

@implementation AWSS3GetBucketCorsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3GetBucketEncryptionOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverSideEncryptionConfiguration" : @"ServerSideEncryptionConfiguration",
             };
}

+ (NSValueTransformer *)serverSideEncryptionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ServerSideEncryptionConfiguration class]];
}

@end

@implementation AWSS3GetBucketEncryptionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3GetBucketInventoryConfigurationOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inventoryConfiguration" : @"InventoryConfiguration",
             };
}

+ (NSValueTransformer *)inventoryConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3InventoryConfiguration class]];
}

@end

@implementation AWSS3GetBucketInventoryConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSS3GetBucketLifecycleConfigurationOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3LifecycleRule class]];
}

@end

@implementation AWSS3GetBucketLifecycleConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3GetBucketLifecycleOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3Rule class]];
}

@end

@implementation AWSS3GetBucketLifecycleRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3GetBucketLocationOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"locationConstraint" : @"LocationConstraint",
             };
}

+ (NSValueTransformer *)locationConstraintJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@""] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintBlank);
        }
        if ([value caseInsensitiveCompare:@"af-south-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAFSouth1);
        }
        if ([value caseInsensitiveCompare:@"ap-east-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPEast1);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPNortheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPNortheast2);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-3"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPNortheast3);
        }
        if ([value caseInsensitiveCompare:@"ap-south-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPSouth1);
        }
        if ([value caseInsensitiveCompare:@"ap-south-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPSouth2);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPSoutheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPSoutheast2);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-3"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPSoutheast3);
        }
        if ([value caseInsensitiveCompare:@"ca-central-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintCACentral1);
        }
        if ([value caseInsensitiveCompare:@"cn-north-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintCNNorth1);
        }
        if ([value caseInsensitiveCompare:@"cn-northwest-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintCNNorthwest1);
        }
        if ([value caseInsensitiveCompare:@"EU"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEU);
        }
        if ([value caseInsensitiveCompare:@"eu-central-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEUCentral1);
        }
        if ([value caseInsensitiveCompare:@"eu-central-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEUCentral2);
        }
        if ([value caseInsensitiveCompare:@"eu-north-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEUNorth1);
        }
        if ([value caseInsensitiveCompare:@"eu-south-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEUSouth1);
        }
        if ([value caseInsensitiveCompare:@"eu-south-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEUSouth2);
        }
        if ([value caseInsensitiveCompare:@"eu-west-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEUWest1);
        }
        if ([value caseInsensitiveCompare:@"eu-west-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEUWest2);
        }
        if ([value caseInsensitiveCompare:@"eu-west-3"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEUWest3);
        }
        if ([value caseInsensitiveCompare:@"me-central-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintMECentral1);
        }
        if ([value caseInsensitiveCompare:@"me-south-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintMESouth1);
        }
        if ([value caseInsensitiveCompare:@"sa-east-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintSAEast1);
        }
        if ([value caseInsensitiveCompare:@"us-east-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintUSEast2);
        }
        if ([value caseInsensitiveCompare:@"us-gov-east-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintUSGovEast1);
        }
        if ([value caseInsensitiveCompare:@"us-gov-west-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintUSGovWest1);
        }
        if ([value caseInsensitiveCompare:@"us-west-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintUSWest1);
        }
        if ([value caseInsensitiveCompare:@"us-west-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintUSWest2);
        }
        return @(AWSS3BucketLocationConstraintUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3BucketLocationConstraintBlank:
                return @"";
            case AWSS3BucketLocationConstraintAFSouth1:
                return @"af-south-1";
            case AWSS3BucketLocationConstraintAPEast1:
                return @"ap-east-1";
            case AWSS3BucketLocationConstraintAPNortheast1:
                return @"ap-northeast-1";
            case AWSS3BucketLocationConstraintAPNortheast2:
                return @"ap-northeast-2";
            case AWSS3BucketLocationConstraintAPNortheast3:
                return @"ap-northeast-3";
            case AWSS3BucketLocationConstraintAPSouth1:
                return @"ap-south-1";
            case AWSS3BucketLocationConstraintAPSouth2:
                return @"ap-south-2";
            case AWSS3BucketLocationConstraintAPSoutheast1:
                return @"ap-southeast-1";
            case AWSS3BucketLocationConstraintAPSoutheast2:
                return @"ap-southeast-2";
            case AWSS3BucketLocationConstraintAPSoutheast3:
                return @"ap-southeast-3";
            case AWSS3BucketLocationConstraintCACentral1:
                return @"ca-central-1";
            case AWSS3BucketLocationConstraintCNNorth1:
                return @"cn-north-1";
            case AWSS3BucketLocationConstraintCNNorthwest1:
                return @"cn-northwest-1";
            case AWSS3BucketLocationConstraintEU:
                return @"EU";
            case AWSS3BucketLocationConstraintEUCentral1:
                return @"eu-central-1";
            case AWSS3BucketLocationConstraintEUCentral2:
                return @"eu-central-2";
            case AWSS3BucketLocationConstraintEUNorth1:
                return @"eu-north-1";
            case AWSS3BucketLocationConstraintEUSouth1:
                return @"eu-south-1";
            case AWSS3BucketLocationConstraintEUSouth2:
                return @"eu-south-2";
            case AWSS3BucketLocationConstraintEUWest1:
                return @"eu-west-1";
            case AWSS3BucketLocationConstraintEUWest2:
                return @"eu-west-2";
            case AWSS3BucketLocationConstraintEUWest3:
                return @"eu-west-3";
            case AWSS3BucketLocationConstraintMECentral1:
                return @"me-central-1";
            case AWSS3BucketLocationConstraintMESouth1:
                return @"me-south-1";
            case AWSS3BucketLocationConstraintSAEast1:
                return @"sa-east-1";
            case AWSS3BucketLocationConstraintUSEast2:
                return @"us-east-2";
            case AWSS3BucketLocationConstraintUSGovEast1:
                return @"us-gov-east-1";
            case AWSS3BucketLocationConstraintUSGovWest1:
                return @"us-gov-west-1";
            case AWSS3BucketLocationConstraintUSWest1:
                return @"us-west-1";
            case AWSS3BucketLocationConstraintUSWest2:
                return @"us-west-2";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3GetBucketLocationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3GetBucketLoggingOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loggingEnabled" : @"LoggingEnabled",
             };
}

+ (NSValueTransformer *)loggingEnabledJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3LoggingEnabled class]];
}

@end

@implementation AWSS3GetBucketLoggingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3GetBucketMetricsConfigurationOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricsConfiguration" : @"MetricsConfiguration",
             };
}

+ (NSValueTransformer *)metricsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3MetricsConfiguration class]];
}

@end

@implementation AWSS3GetBucketMetricsConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSS3GetBucketNotificationConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3GetBucketOwnershipControlsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ownershipControls" : @"OwnershipControls",
             };
}

+ (NSValueTransformer *)ownershipControlsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3OwnershipControls class]];
}

@end

@implementation AWSS3GetBucketOwnershipControlsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3GetBucketPolicyOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             };
}

+ (NSValueTransformer *)policyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[NSString class]];
}

@end

@implementation AWSS3GetBucketPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3GetBucketPolicyStatusOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyStatus" : @"PolicyStatus",
             };
}

+ (NSValueTransformer *)policyStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3PolicyStatus class]];
}

@end

@implementation AWSS3GetBucketPolicyStatusRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3GetBucketReplicationOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationConfiguration" : @"ReplicationConfiguration",
             };
}

+ (NSValueTransformer *)replicationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ReplicationConfiguration class]];
}

@end

@implementation AWSS3GetBucketReplicationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3GetBucketRequestPaymentOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"payer" : @"Payer",
             };
}

+ (NSValueTransformer *)payerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Requester"] == NSOrderedSame) {
            return @(AWSS3PayerRequester);
        }
        if ([value caseInsensitiveCompare:@"BucketOwner"] == NSOrderedSame) {
            return @(AWSS3PayerBucketOwner);
        }
        return @(AWSS3PayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3PayerRequester:
                return @"Requester";
            case AWSS3PayerBucketOwner:
                return @"BucketOwner";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3GetBucketRequestPaymentRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3GetBucketTaggingOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagSet" : @"TagSet",
             };
}

+ (NSValueTransformer *)tagSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3Tag class]];
}

@end

@implementation AWSS3GetBucketTaggingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3GetBucketVersioningOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"MFADelete" : @"MFADelete",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)MFADeleteJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSS3MFADeleteStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSS3MFADeleteStatusDisabled);
        }
        return @(AWSS3MFADeleteStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3MFADeleteStatusEnabled:
                return @"Enabled";
            case AWSS3MFADeleteStatusDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSS3BucketVersioningStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"Suspended"] == NSOrderedSame) {
            return @(AWSS3BucketVersioningStatusSuspended);
        }
        return @(AWSS3BucketVersioningStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3BucketVersioningStatusEnabled:
                return @"Enabled";
            case AWSS3BucketVersioningStatusSuspended:
                return @"Suspended";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3GetBucketVersioningRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3GetBucketWebsiteOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorDocument" : @"ErrorDocument",
             @"indexDocument" : @"IndexDocument",
             @"redirectAllRequestsTo" : @"RedirectAllRequestsTo",
             @"routingRules" : @"RoutingRules",
             };
}

+ (NSValueTransformer *)errorDocumentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ErrorDocument class]];
}

+ (NSValueTransformer *)indexDocumentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3IndexDocument class]];
}

+ (NSValueTransformer *)redirectAllRequestsToJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3RedirectAllRequestsTo class]];
}

+ (NSValueTransformer *)routingRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3RoutingRule class]];
}

@end

@implementation AWSS3GetBucketWebsiteRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3GetObjectAclOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grants" : @"Grants",
             @"owner" : @"Owner",
             @"requestCharged" : @"RequestCharged",
             };
}

+ (NSValueTransformer *)grantsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3Grant class]];
}

+ (NSValueTransformer *)ownerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Owner class]];
}

+ (NSValueTransformer *)requestChargedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestChargedRequester);
        }
        return @(AWSS3RequestChargedUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestChargedRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3GetObjectAclRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"key" : @"Key",
             @"requestPayer" : @"RequestPayer",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestPayerRequester);
        }
        return @(AWSS3RequestPayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestPayerRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3GetObjectLegalHoldOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"legalHold" : @"LegalHold",
             };
}

+ (NSValueTransformer *)legalHoldJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ObjectLockLegalHold class]];
}

@end

@implementation AWSS3GetObjectLegalHoldRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"key" : @"Key",
             @"requestPayer" : @"RequestPayer",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestPayerRequester);
        }
        return @(AWSS3RequestPayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestPayerRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3GetObjectLockConfigurationOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"objectLockConfiguration" : @"ObjectLockConfiguration",
             };
}

+ (NSValueTransformer *)objectLockConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ObjectLockConfiguration class]];
}

@end

@implementation AWSS3GetObjectLockConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3GetObjectOutput

+ (BOOL)supportsSecureCoding {
    return NO;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptRanges" : @"AcceptRanges",
             @"body" : @"Body",
             @"cacheControl" : @"CacheControl",
             @"contentDisposition" : @"ContentDisposition",
             @"contentEncoding" : @"ContentEncoding",
             @"contentLanguage" : @"ContentLanguage",
             @"contentLength" : @"ContentLength",
             @"contentRange" : @"ContentRange",
             @"contentType" : @"ContentType",
             @"deleteMarker" : @"DeleteMarker",
             @"ETag" : @"ETag",
             @"expiration" : @"Expiration",
             @"expires" : @"Expires",
             @"lastModified" : @"LastModified",
             @"metadata" : @"Metadata",
             @"missingMeta" : @"MissingMeta",
             @"objectLockLegalHoldStatus" : @"ObjectLockLegalHoldStatus",
             @"objectLockMode" : @"ObjectLockMode",
             @"objectLockRetainUntilDate" : @"ObjectLockRetainUntilDate",
             @"partsCount" : @"PartsCount",
             @"replicationStatus" : @"ReplicationStatus",
             @"requestCharged" : @"RequestCharged",
             @"restore" : @"Restore",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"SSEKMSKeyId" : @"SSEKMSKeyId",
             @"serverSideEncryption" : @"ServerSideEncryption",
             @"storageClass" : @"StorageClass",
             @"tagCount" : @"TagCount",
             @"versionId" : @"VersionId",
             @"websiteRedirectLocation" : @"WebsiteRedirectLocation",
             };
}

+ (NSValueTransformer *)expiresJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)objectLockLegalHoldStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ON"] == NSOrderedSame) {
            return @(AWSS3ObjectLockLegalHoldStatusOn);
        }
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSS3ObjectLockLegalHoldStatusOff);
        }
        return @(AWSS3ObjectLockLegalHoldStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ObjectLockLegalHoldStatusOn:
                return @"ON";
            case AWSS3ObjectLockLegalHoldStatusOff:
                return @"OFF";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)objectLockModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GOVERNANCE"] == NSOrderedSame) {
            return @(AWSS3ObjectLockModeGovernance);
        }
        if ([value caseInsensitiveCompare:@"COMPLIANCE"] == NSOrderedSame) {
            return @(AWSS3ObjectLockModeCompliance);
        }
        return @(AWSS3ObjectLockModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ObjectLockModeGovernance:
                return @"GOVERNANCE";
            case AWSS3ObjectLockModeCompliance:
                return @"COMPLIANCE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)objectLockRetainUntilDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)replicationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLETE"] == NSOrderedSame) {
            return @(AWSS3ReplicationStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSS3ReplicationStatusPending);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSS3ReplicationStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"REPLICA"] == NSOrderedSame) {
            return @(AWSS3ReplicationStatusReplica);
        }
        return @(AWSS3ReplicationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ReplicationStatusComplete:
                return @"COMPLETE";
            case AWSS3ReplicationStatusPending:
                return @"PENDING";
            case AWSS3ReplicationStatusFailed:
                return @"FAILED";
            case AWSS3ReplicationStatusReplica:
                return @"REPLICA";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requestChargedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestChargedRequester);
        }
        return @(AWSS3RequestChargedUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestChargedRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serverSideEncryptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES256"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value caseInsensitiveCompare:@"aws:kms"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAwsKms);
        }
        return @(AWSS3ServerSideEncryptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ServerSideEncryptionAES256:
                return @"AES256";
            case AWSS3ServerSideEncryptionAwsKms:
                return @"aws:kms";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)storageClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSS3StorageClassStandard);
        }
        if ([value caseInsensitiveCompare:@"REDUCED_REDUNDANCY"] == NSOrderedSame) {
            return @(AWSS3StorageClassReducedRedundancy);
        }
        if ([value caseInsensitiveCompare:@"STANDARD_IA"] == NSOrderedSame) {
            return @(AWSS3StorageClassStandardIa);
        }
        if ([value caseInsensitiveCompare:@"ONEZONE_IA"] == NSOrderedSame) {
            return @(AWSS3StorageClassOnezoneIa);
        }
        if ([value caseInsensitiveCompare:@"INTELLIGENT_TIERING"] == NSOrderedSame) {
            return @(AWSS3StorageClassIntelligentTiering);
        }
        if ([value caseInsensitiveCompare:@"GLACIER"] == NSOrderedSame) {
            return @(AWSS3StorageClassGlacier);
        }
        if ([value caseInsensitiveCompare:@"DEEP_ARCHIVE"] == NSOrderedSame) {
            return @(AWSS3StorageClassDeepArchive);
        }
        if ([value caseInsensitiveCompare:@"OUTPOSTS"] == NSOrderedSame) {
            return @(AWSS3StorageClassOutposts);
        }
        return @(AWSS3StorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3StorageClassStandard:
                return @"STANDARD";
            case AWSS3StorageClassReducedRedundancy:
                return @"REDUCED_REDUNDANCY";
            case AWSS3StorageClassStandardIa:
                return @"STANDARD_IA";
            case AWSS3StorageClassOnezoneIa:
                return @"ONEZONE_IA";
            case AWSS3StorageClassIntelligentTiering:
                return @"INTELLIGENT_TIERING";
            case AWSS3StorageClassGlacier:
                return @"GLACIER";
            case AWSS3StorageClassDeepArchive:
                return @"DEEP_ARCHIVE";
            case AWSS3StorageClassOutposts:
                return @"OUTPOSTS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3GetObjectRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"ifMatch" : @"IfMatch",
             @"ifModifiedSince" : @"IfModifiedSince",
             @"ifNoneMatch" : @"IfNoneMatch",
             @"ifUnmodifiedSince" : @"IfUnmodifiedSince",
             @"key" : @"Key",
             @"partNumber" : @"PartNumber",
             @"range" : @"Range",
             @"requestPayer" : @"RequestPayer",
             @"responseCacheControl" : @"ResponseCacheControl",
             @"responseContentDisposition" : @"ResponseContentDisposition",
             @"responseContentEncoding" : @"ResponseContentEncoding",
             @"responseContentLanguage" : @"ResponseContentLanguage",
             @"responseContentType" : @"ResponseContentType",
             @"responseExpires" : @"ResponseExpires",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKey" : @"SSECustomerKey",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)ifModifiedSinceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateRFC822DateFormat1];
    }];
}

+ (NSValueTransformer *)ifUnmodifiedSinceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateRFC822DateFormat1];
    }];
}

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestPayerRequester);
        }
        return @(AWSS3RequestPayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestPayerRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)responseExpiresJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSS3GetObjectRetentionOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"retention" : @"Retention",
             };
}

+ (NSValueTransformer *)retentionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ObjectLockRetention class]];
}

@end

@implementation AWSS3GetObjectRetentionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"key" : @"Key",
             @"requestPayer" : @"RequestPayer",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestPayerRequester);
        }
        return @(AWSS3RequestPayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestPayerRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3GetObjectTaggingOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagSet" : @"TagSet",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)tagSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3Tag class]];
}

@end

@implementation AWSS3GetObjectTaggingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"key" : @"Key",
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSS3GetObjectTorrentOutput

+ (BOOL)supportsSecureCoding {
    return NO;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"requestCharged" : @"RequestCharged",
             };
}

+ (NSValueTransformer *)requestChargedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestChargedRequester);
        }
        return @(AWSS3RequestChargedUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestChargedRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3GetObjectTorrentRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"key" : @"Key",
             @"requestPayer" : @"RequestPayer",
             };
}

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestPayerRequester);
        }
        return @(AWSS3RequestPayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestPayerRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3GetPublicAccessBlockOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"publicAccessBlockConfiguration" : @"PublicAccessBlockConfiguration",
             };
}

+ (NSValueTransformer *)publicAccessBlockConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3PublicAccessBlockConfiguration class]];
}

@end

@implementation AWSS3GetPublicAccessBlockRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3GlacierJobParameters

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tier" : @"Tier",
             };
}

+ (NSValueTransformer *)tierJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSS3TierStandard);
        }
        if ([value caseInsensitiveCompare:@"Bulk"] == NSOrderedSame) {
            return @(AWSS3TierBulk);
        }
        if ([value caseInsensitiveCompare:@"Expedited"] == NSOrderedSame) {
            return @(AWSS3TierExpedited);
        }
        return @(AWSS3TierUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3TierStandard:
                return @"Standard";
            case AWSS3TierBulk:
                return @"Bulk";
            case AWSS3TierExpedited:
                return @"Expedited";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3Grant

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grantee" : @"Grantee",
             @"permission" : @"Permission",
             };
}

+ (NSValueTransformer *)granteeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Grantee class]];
}

+ (NSValueTransformer *)permissionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FULL_CONTROL"] == NSOrderedSame) {
            return @(AWSS3PermissionFullControl);
        }
        if ([value caseInsensitiveCompare:@"WRITE"] == NSOrderedSame) {
            return @(AWSS3PermissionWrite);
        }
        if ([value caseInsensitiveCompare:@"WRITE_ACP"] == NSOrderedSame) {
            return @(AWSS3PermissionWriteAcp);
        }
        if ([value caseInsensitiveCompare:@"READ"] == NSOrderedSame) {
            return @(AWSS3PermissionRead);
        }
        if ([value caseInsensitiveCompare:@"READ_ACP"] == NSOrderedSame) {
            return @(AWSS3PermissionReadAcp);
        }
        return @(AWSS3PermissionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3PermissionFullControl:
                return @"FULL_CONTROL";
            case AWSS3PermissionWrite:
                return @"WRITE";
            case AWSS3PermissionWriteAcp:
                return @"WRITE_ACP";
            case AWSS3PermissionRead:
                return @"READ";
            case AWSS3PermissionReadAcp:
                return @"READ_ACP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3Grantee

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"displayName" : @"DisplayName",
             @"emailAddress" : @"EmailAddress",
             @"identifier" : @"ID",
             @"types" : @"Type",
             @"URI" : @"URI",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CanonicalUser"] == NSOrderedSame) {
            return @(AWSS3TypesCanonicalUser);
        }
        if ([value caseInsensitiveCompare:@"AmazonCustomerByEmail"] == NSOrderedSame) {
            return @(AWSS3TypesAmazonCustomerByEmail);
        }
        if ([value caseInsensitiveCompare:@"Group"] == NSOrderedSame) {
            return @(AWSS3TypesGroup);
        }
        return @(AWSS3TypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3TypesCanonicalUser:
                return @"CanonicalUser";
            case AWSS3TypesAmazonCustomerByEmail:
                return @"AmazonCustomerByEmail";
            case AWSS3TypesGroup:
                return @"Group";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3HeadBucketRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3HeadObjectOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptRanges" : @"AcceptRanges",
             @"cacheControl" : @"CacheControl",
             @"contentDisposition" : @"ContentDisposition",
             @"contentEncoding" : @"ContentEncoding",
             @"contentLanguage" : @"ContentLanguage",
             @"contentLength" : @"ContentLength",
             @"contentType" : @"ContentType",
             @"deleteMarker" : @"DeleteMarker",
             @"ETag" : @"ETag",
             @"expiration" : @"Expiration",
             @"expires" : @"Expires",
             @"lastModified" : @"LastModified",
             @"metadata" : @"Metadata",
             @"missingMeta" : @"MissingMeta",
             @"objectLockLegalHoldStatus" : @"ObjectLockLegalHoldStatus",
             @"objectLockMode" : @"ObjectLockMode",
             @"objectLockRetainUntilDate" : @"ObjectLockRetainUntilDate",
             @"partsCount" : @"PartsCount",
             @"replicationStatus" : @"ReplicationStatus",
             @"requestCharged" : @"RequestCharged",
             @"restore" : @"Restore",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"SSEKMSKeyId" : @"SSEKMSKeyId",
             @"serverSideEncryption" : @"ServerSideEncryption",
             @"storageClass" : @"StorageClass",
             @"versionId" : @"VersionId",
             @"websiteRedirectLocation" : @"WebsiteRedirectLocation",
             };
}

+ (NSValueTransformer *)expiresJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)objectLockLegalHoldStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ON"] == NSOrderedSame) {
            return @(AWSS3ObjectLockLegalHoldStatusOn);
        }
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSS3ObjectLockLegalHoldStatusOff);
        }
        return @(AWSS3ObjectLockLegalHoldStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ObjectLockLegalHoldStatusOn:
                return @"ON";
            case AWSS3ObjectLockLegalHoldStatusOff:
                return @"OFF";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)objectLockModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GOVERNANCE"] == NSOrderedSame) {
            return @(AWSS3ObjectLockModeGovernance);
        }
        if ([value caseInsensitiveCompare:@"COMPLIANCE"] == NSOrderedSame) {
            return @(AWSS3ObjectLockModeCompliance);
        }
        return @(AWSS3ObjectLockModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ObjectLockModeGovernance:
                return @"GOVERNANCE";
            case AWSS3ObjectLockModeCompliance:
                return @"COMPLIANCE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)objectLockRetainUntilDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)replicationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLETE"] == NSOrderedSame) {
            return @(AWSS3ReplicationStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSS3ReplicationStatusPending);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSS3ReplicationStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"REPLICA"] == NSOrderedSame) {
            return @(AWSS3ReplicationStatusReplica);
        }
        return @(AWSS3ReplicationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ReplicationStatusComplete:
                return @"COMPLETE";
            case AWSS3ReplicationStatusPending:
                return @"PENDING";
            case AWSS3ReplicationStatusFailed:
                return @"FAILED";
            case AWSS3ReplicationStatusReplica:
                return @"REPLICA";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requestChargedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestChargedRequester);
        }
        return @(AWSS3RequestChargedUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestChargedRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serverSideEncryptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES256"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value caseInsensitiveCompare:@"aws:kms"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAwsKms);
        }
        return @(AWSS3ServerSideEncryptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ServerSideEncryptionAES256:
                return @"AES256";
            case AWSS3ServerSideEncryptionAwsKms:
                return @"aws:kms";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)storageClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSS3StorageClassStandard);
        }
        if ([value caseInsensitiveCompare:@"REDUCED_REDUNDANCY"] == NSOrderedSame) {
            return @(AWSS3StorageClassReducedRedundancy);
        }
        if ([value caseInsensitiveCompare:@"STANDARD_IA"] == NSOrderedSame) {
            return @(AWSS3StorageClassStandardIa);
        }
        if ([value caseInsensitiveCompare:@"ONEZONE_IA"] == NSOrderedSame) {
            return @(AWSS3StorageClassOnezoneIa);
        }
        if ([value caseInsensitiveCompare:@"INTELLIGENT_TIERING"] == NSOrderedSame) {
            return @(AWSS3StorageClassIntelligentTiering);
        }
        if ([value caseInsensitiveCompare:@"GLACIER"] == NSOrderedSame) {
            return @(AWSS3StorageClassGlacier);
        }
        if ([value caseInsensitiveCompare:@"DEEP_ARCHIVE"] == NSOrderedSame) {
            return @(AWSS3StorageClassDeepArchive);
        }
        if ([value caseInsensitiveCompare:@"OUTPOSTS"] == NSOrderedSame) {
            return @(AWSS3StorageClassOutposts);
        }
        return @(AWSS3StorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3StorageClassStandard:
                return @"STANDARD";
            case AWSS3StorageClassReducedRedundancy:
                return @"REDUCED_REDUNDANCY";
            case AWSS3StorageClassStandardIa:
                return @"STANDARD_IA";
            case AWSS3StorageClassOnezoneIa:
                return @"ONEZONE_IA";
            case AWSS3StorageClassIntelligentTiering:
                return @"INTELLIGENT_TIERING";
            case AWSS3StorageClassGlacier:
                return @"GLACIER";
            case AWSS3StorageClassDeepArchive:
                return @"DEEP_ARCHIVE";
            case AWSS3StorageClassOutposts:
                return @"OUTPOSTS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3HeadObjectRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"ifMatch" : @"IfMatch",
             @"ifModifiedSince" : @"IfModifiedSince",
             @"ifNoneMatch" : @"IfNoneMatch",
             @"ifUnmodifiedSince" : @"IfUnmodifiedSince",
             @"key" : @"Key",
             @"partNumber" : @"PartNumber",
             @"range" : @"Range",
             @"requestPayer" : @"RequestPayer",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKey" : @"SSECustomerKey",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)ifModifiedSinceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateRFC822DateFormat1];
    }];
}

+ (NSValueTransformer *)ifUnmodifiedSinceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateRFC822DateFormat1];
    }];
}

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestPayerRequester);
        }
        return @(AWSS3RequestPayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestPayerRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3IndexDocument

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"suffix" : @"Suffix",
             };
}

@end

@implementation AWSS3Initiator

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"displayName" : @"DisplayName",
             @"identifier" : @"ID",
             };
}

@end

@implementation AWSS3InputSerialization

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"CSV" : @"CSV",
             @"compressionType" : @"CompressionType",
             @"JSON" : @"JSON",
             @"parquet" : @"Parquet",
             };
}

+ (NSValueTransformer *)CSVJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3CSVInput class]];
}

+ (NSValueTransformer *)compressionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSS3CompressionTypeNone);
        }
        if ([value caseInsensitiveCompare:@"GZIP"] == NSOrderedSame) {
            return @(AWSS3CompressionTypeGzip);
        }
        if ([value caseInsensitiveCompare:@"BZIP2"] == NSOrderedSame) {
            return @(AWSS3CompressionTypeBzip2);
        }
        return @(AWSS3CompressionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3CompressionTypeNone:
                return @"NONE";
            case AWSS3CompressionTypeGzip:
                return @"GZIP";
            case AWSS3CompressionTypeBzip2:
                return @"BZIP2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)JSONJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3JSONInput class]];
}

+ (NSValueTransformer *)parquetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ParquetInput class]];
}

@end

@implementation AWSS3InventoryConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"Destination",
             @"filter" : @"Filter",
             @"identifier" : @"Id",
             @"includedObjectVersions" : @"IncludedObjectVersions",
             @"isEnabled" : @"IsEnabled",
             @"optionalFields" : @"OptionalFields",
             @"schedule" : @"Schedule",
             };
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3InventoryDestination class]];
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3InventoryFilter class]];
}

+ (NSValueTransformer *)includedObjectVersionsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"All"] == NSOrderedSame) {
            return @(AWSS3InventoryIncludedObjectVersionsAll);
        }
        if ([value caseInsensitiveCompare:@"Current"] == NSOrderedSame) {
            return @(AWSS3InventoryIncludedObjectVersionsCurrent);
        }
        return @(AWSS3InventoryIncludedObjectVersionsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3InventoryIncludedObjectVersionsAll:
                return @"All";
            case AWSS3InventoryIncludedObjectVersionsCurrent:
                return @"Current";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3InventorySchedule class]];
}

@end

@implementation AWSS3InventoryDestination

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3BucketDestination" : @"S3BucketDestination",
             };
}

+ (NSValueTransformer *)s3BucketDestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3InventoryS3BucketDestination class]];
}

@end

@implementation AWSS3InventoryEncryption

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SSEKMS" : @"SSEKMS",
             @"SSES3" : @"SSES3",
             };
}

+ (NSValueTransformer *)SSEKMSJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3SSEKMS class]];
}

+ (NSValueTransformer *)SSES3JSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3SSES3 class]];
}

@end

@implementation AWSS3InventoryFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"prefix" : @"Prefix",
             };
}

@end

@implementation AWSS3InventoryS3BucketDestination

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"bucket" : @"Bucket",
             @"encryption" : @"Encryption",
             @"format" : @"Format",
             @"prefix" : @"Prefix",
             };
}

+ (NSValueTransformer *)encryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3InventoryEncryption class]];
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CSV"] == NSOrderedSame) {
            return @(AWSS3InventoryFormatCsv);
        }
        if ([value caseInsensitiveCompare:@"ORC"] == NSOrderedSame) {
            return @(AWSS3InventoryFormatOrc);
        }
        if ([value caseInsensitiveCompare:@"Parquet"] == NSOrderedSame) {
            return @(AWSS3InventoryFormatParquet);
        }
        return @(AWSS3InventoryFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3InventoryFormatCsv:
                return @"CSV";
            case AWSS3InventoryFormatOrc:
                return @"ORC";
            case AWSS3InventoryFormatParquet:
                return @"Parquet";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3InventorySchedule

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"frequency" : @"Frequency",
             };
}

+ (NSValueTransformer *)frequencyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Daily"] == NSOrderedSame) {
            return @(AWSS3InventoryFrequencyDaily);
        }
        if ([value caseInsensitiveCompare:@"Weekly"] == NSOrderedSame) {
            return @(AWSS3InventoryFrequencyWeekly);
        }
        return @(AWSS3InventoryFrequencyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3InventoryFrequencyDaily:
                return @"Daily";
            case AWSS3InventoryFrequencyWeekly:
                return @"Weekly";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3JSONInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DOCUMENT"] == NSOrderedSame) {
            return @(AWSS3JSONTypeDocument);
        }
        if ([value caseInsensitiveCompare:@"LINES"] == NSOrderedSame) {
            return @(AWSS3JSONTypeLines);
        }
        return @(AWSS3JSONTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3JSONTypeDocument:
                return @"DOCUMENT";
            case AWSS3JSONTypeLines:
                return @"LINES";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3JSONOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recordDelimiter" : @"RecordDelimiter",
             };
}

@end

@implementation AWSS3LambdaFunctionConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"events" : @"Events",
             @"filter" : @"Filter",
             @"identifier" : @"Id",
             @"lambdaFunctionArn" : @"LambdaFunctionArn",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3NotificationConfigurationFilter class]];
}

@end

@implementation AWSS3LifecycleConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3Rule class]];
}

@end

@implementation AWSS3LifecycleExpiration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"date" : @"Date",
             @"days" : @"Days",
             @"expiredObjectDeleteMarker" : @"ExpiredObjectDeleteMarker",
             };
}

+ (NSValueTransformer *)dateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSS3LifecycleRule

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"abortIncompleteMultipartUpload" : @"AbortIncompleteMultipartUpload",
             @"expiration" : @"Expiration",
             @"filter" : @"Filter",
             @"identifier" : @"ID",
             @"noncurrentVersionExpiration" : @"NoncurrentVersionExpiration",
             @"noncurrentVersionTransitions" : @"NoncurrentVersionTransitions",
             @"prefix" : @"Prefix",
             @"status" : @"Status",
             @"transitions" : @"Transitions",
             };
}

+ (NSValueTransformer *)abortIncompleteMultipartUploadJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3AbortIncompleteMultipartUpload class]];
}

+ (NSValueTransformer *)expirationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3LifecycleExpiration class]];
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3LifecycleRuleFilter class]];
}

+ (NSValueTransformer *)noncurrentVersionExpirationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3NoncurrentVersionExpiration class]];
}

+ (NSValueTransformer *)noncurrentVersionTransitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3NoncurrentVersionTransition class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSS3ExpirationStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSS3ExpirationStatusDisabled);
        }
        return @(AWSS3ExpirationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ExpirationStatusEnabled:
                return @"Enabled";
            case AWSS3ExpirationStatusDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)transitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3Transition class]];
}

@end

@implementation AWSS3LifecycleRuleAndOperator

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"prefix" : @"Prefix",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3Tag class]];
}

@end

@implementation AWSS3LifecycleRuleFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"AND" : @"And",
             @"prefix" : @"Prefix",
             @"tag" : @"Tag",
             };
}

+ (NSValueTransformer *)ANDJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3LifecycleRuleAndOperator class]];
}

+ (NSValueTransformer *)tagJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Tag class]];
}

@end

@implementation AWSS3ListBucketAnalyticsConfigurationsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyticsConfigurationList" : @"AnalyticsConfigurationList",
             @"continuationToken" : @"ContinuationToken",
             @"isTruncated" : @"IsTruncated",
             @"nextContinuationToken" : @"NextContinuationToken",
             };
}

+ (NSValueTransformer *)analyticsConfigurationListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3AnalyticsConfiguration class]];
}

@end

@implementation AWSS3ListBucketAnalyticsConfigurationsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"continuationToken" : @"ContinuationToken",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3ListBucketInventoryConfigurationsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"continuationToken" : @"ContinuationToken",
             @"inventoryConfigurationList" : @"InventoryConfigurationList",
             @"isTruncated" : @"IsTruncated",
             @"nextContinuationToken" : @"NextContinuationToken",
             };
}

+ (NSValueTransformer *)inventoryConfigurationListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3InventoryConfiguration class]];
}

@end

@implementation AWSS3ListBucketInventoryConfigurationsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"continuationToken" : @"ContinuationToken",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3ListBucketMetricsConfigurationsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"continuationToken" : @"ContinuationToken",
             @"isTruncated" : @"IsTruncated",
             @"metricsConfigurationList" : @"MetricsConfigurationList",
             @"nextContinuationToken" : @"NextContinuationToken",
             };
}

+ (NSValueTransformer *)metricsConfigurationListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3MetricsConfiguration class]];
}

@end

@implementation AWSS3ListBucketMetricsConfigurationsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"continuationToken" : @"ContinuationToken",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

@end

@implementation AWSS3ListBucketsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"buckets" : @"Buckets",
             @"owner" : @"Owner",
             };
}

+ (NSValueTransformer *)bucketsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3Bucket class]];
}

+ (NSValueTransformer *)ownerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Owner class]];
}

@end

@implementation AWSS3ListMultipartUploadsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"commonPrefixes" : @"CommonPrefixes",
             @"delimiter" : @"Delimiter",
             @"encodingType" : @"EncodingType",
             @"isTruncated" : @"IsTruncated",
             @"keyMarker" : @"KeyMarker",
             @"maxUploads" : @"MaxUploads",
             @"nextKeyMarker" : @"NextKeyMarker",
             @"nextUploadIdMarker" : @"NextUploadIdMarker",
             @"prefix" : @"Prefix",
             @"uploadIdMarker" : @"UploadIdMarker",
             @"uploads" : @"Uploads",
             };
}

+ (NSValueTransformer *)commonPrefixesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3CommonPrefix class]];
}

+ (NSValueTransformer *)encodingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"url"] == NSOrderedSame) {
            return @(AWSS3EncodingTypeURL);
        }
        return @(AWSS3EncodingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3EncodingTypeURL:
                return @"url";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)uploadsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3MultipartUpload class]];
}

@end

@implementation AWSS3ListMultipartUploadsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"delimiter" : @"Delimiter",
             @"encodingType" : @"EncodingType",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"keyMarker" : @"KeyMarker",
             @"maxUploads" : @"MaxUploads",
             @"prefix" : @"Prefix",
             @"uploadIdMarker" : @"UploadIdMarker",
             };
}

+ (NSValueTransformer *)encodingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"url"] == NSOrderedSame) {
            return @(AWSS3EncodingTypeURL);
        }
        return @(AWSS3EncodingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3EncodingTypeURL:
                return @"url";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3ListObjectVersionsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commonPrefixes" : @"CommonPrefixes",
             @"deleteMarkers" : @"DeleteMarkers",
             @"delimiter" : @"Delimiter",
             @"encodingType" : @"EncodingType",
             @"isTruncated" : @"IsTruncated",
             @"keyMarker" : @"KeyMarker",
             @"maxKeys" : @"MaxKeys",
             @"name" : @"Name",
             @"nextKeyMarker" : @"NextKeyMarker",
             @"nextVersionIdMarker" : @"NextVersionIdMarker",
             @"prefix" : @"Prefix",
             @"versionIdMarker" : @"VersionIdMarker",
             @"versions" : @"Versions",
             };
}

+ (NSValueTransformer *)commonPrefixesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3CommonPrefix class]];
}

+ (NSValueTransformer *)deleteMarkersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3DeleteMarkerEntry class]];
}

+ (NSValueTransformer *)encodingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"url"] == NSOrderedSame) {
            return @(AWSS3EncodingTypeURL);
        }
        return @(AWSS3EncodingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3EncodingTypeURL:
                return @"url";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)versionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3ObjectVersion class]];
}

@end

@implementation AWSS3ListObjectVersionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"delimiter" : @"Delimiter",
             @"encodingType" : @"EncodingType",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"keyMarker" : @"KeyMarker",
             @"maxKeys" : @"MaxKeys",
             @"prefix" : @"Prefix",
             @"versionIdMarker" : @"VersionIdMarker",
             };
}

+ (NSValueTransformer *)encodingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"url"] == NSOrderedSame) {
            return @(AWSS3EncodingTypeURL);
        }
        return @(AWSS3EncodingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3EncodingTypeURL:
                return @"url";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3ListObjectsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commonPrefixes" : @"CommonPrefixes",
             @"contents" : @"Contents",
             @"delimiter" : @"Delimiter",
             @"encodingType" : @"EncodingType",
             @"isTruncated" : @"IsTruncated",
             @"marker" : @"Marker",
             @"maxKeys" : @"MaxKeys",
             @"name" : @"Name",
             @"nextMarker" : @"NextMarker",
             @"prefix" : @"Prefix",
             };
}

+ (NSValueTransformer *)commonPrefixesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3CommonPrefix class]];
}

+ (NSValueTransformer *)contentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3Object class]];
}

+ (NSValueTransformer *)encodingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"url"] == NSOrderedSame) {
            return @(AWSS3EncodingTypeURL);
        }
        return @(AWSS3EncodingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3EncodingTypeURL:
                return @"url";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3ListObjectsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"delimiter" : @"Delimiter",
             @"encodingType" : @"EncodingType",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"marker" : @"Marker",
             @"maxKeys" : @"MaxKeys",
             @"prefix" : @"Prefix",
             @"requestPayer" : @"RequestPayer",
             };
}

+ (NSValueTransformer *)encodingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"url"] == NSOrderedSame) {
            return @(AWSS3EncodingTypeURL);
        }
        return @(AWSS3EncodingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3EncodingTypeURL:
                return @"url";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestPayerRequester);
        }
        return @(AWSS3RequestPayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestPayerRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3ListObjectsV2Output

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commonPrefixes" : @"CommonPrefixes",
             @"contents" : @"Contents",
             @"continuationToken" : @"ContinuationToken",
             @"delimiter" : @"Delimiter",
             @"encodingType" : @"EncodingType",
             @"isTruncated" : @"IsTruncated",
             @"keyCount" : @"KeyCount",
             @"maxKeys" : @"MaxKeys",
             @"name" : @"Name",
             @"nextContinuationToken" : @"NextContinuationToken",
             @"prefix" : @"Prefix",
             @"startAfter" : @"StartAfter",
             };
}

+ (NSValueTransformer *)commonPrefixesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3CommonPrefix class]];
}

+ (NSValueTransformer *)contentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3Object class]];
}

+ (NSValueTransformer *)encodingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"url"] == NSOrderedSame) {
            return @(AWSS3EncodingTypeURL);
        }
        return @(AWSS3EncodingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3EncodingTypeURL:
                return @"url";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3ListObjectsV2Request

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"continuationToken" : @"ContinuationToken",
             @"delimiter" : @"Delimiter",
             @"encodingType" : @"EncodingType",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"fetchOwner" : @"FetchOwner",
             @"maxKeys" : @"MaxKeys",
             @"prefix" : @"Prefix",
             @"requestPayer" : @"RequestPayer",
             @"startAfter" : @"StartAfter",
             };
}

+ (NSValueTransformer *)encodingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"url"] == NSOrderedSame) {
            return @(AWSS3EncodingTypeURL);
        }
        return @(AWSS3EncodingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3EncodingTypeURL:
                return @"url";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestPayerRequester);
        }
        return @(AWSS3RequestPayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestPayerRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3ListPartsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"abortDate" : @"AbortDate",
             @"abortRuleId" : @"AbortRuleId",
             @"bucket" : @"Bucket",
             @"initiator" : @"Initiator",
             @"isTruncated" : @"IsTruncated",
             @"key" : @"Key",
             @"maxParts" : @"MaxParts",
             @"nextPartNumberMarker" : @"NextPartNumberMarker",
             @"owner" : @"Owner",
             @"partNumberMarker" : @"PartNumberMarker",
             @"parts" : @"Parts",
             @"requestCharged" : @"RequestCharged",
             @"storageClass" : @"StorageClass",
             @"uploadId" : @"UploadId",
             };
}

+ (NSValueTransformer *)abortDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)initiatorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Initiator class]];
}

+ (NSValueTransformer *)ownerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Owner class]];
}

+ (NSValueTransformer *)partsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3Part class]];
}

+ (NSValueTransformer *)requestChargedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestChargedRequester);
        }
        return @(AWSS3RequestChargedUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestChargedRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)storageClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSS3StorageClassStandard);
        }
        if ([value caseInsensitiveCompare:@"REDUCED_REDUNDANCY"] == NSOrderedSame) {
            return @(AWSS3StorageClassReducedRedundancy);
        }
        if ([value caseInsensitiveCompare:@"STANDARD_IA"] == NSOrderedSame) {
            return @(AWSS3StorageClassStandardIa);
        }
        if ([value caseInsensitiveCompare:@"ONEZONE_IA"] == NSOrderedSame) {
            return @(AWSS3StorageClassOnezoneIa);
        }
        if ([value caseInsensitiveCompare:@"INTELLIGENT_TIERING"] == NSOrderedSame) {
            return @(AWSS3StorageClassIntelligentTiering);
        }
        if ([value caseInsensitiveCompare:@"GLACIER"] == NSOrderedSame) {
            return @(AWSS3StorageClassGlacier);
        }
        if ([value caseInsensitiveCompare:@"DEEP_ARCHIVE"] == NSOrderedSame) {
            return @(AWSS3StorageClassDeepArchive);
        }
        if ([value caseInsensitiveCompare:@"OUTPOSTS"] == NSOrderedSame) {
            return @(AWSS3StorageClassOutposts);
        }
        return @(AWSS3StorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3StorageClassStandard:
                return @"STANDARD";
            case AWSS3StorageClassReducedRedundancy:
                return @"REDUCED_REDUNDANCY";
            case AWSS3StorageClassStandardIa:
                return @"STANDARD_IA";
            case AWSS3StorageClassOnezoneIa:
                return @"ONEZONE_IA";
            case AWSS3StorageClassIntelligentTiering:
                return @"INTELLIGENT_TIERING";
            case AWSS3StorageClassGlacier:
                return @"GLACIER";
            case AWSS3StorageClassDeepArchive:
                return @"DEEP_ARCHIVE";
            case AWSS3StorageClassOutposts:
                return @"OUTPOSTS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3ListPartsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"key" : @"Key",
             @"maxParts" : @"MaxParts",
             @"partNumberMarker" : @"PartNumberMarker",
             @"requestPayer" : @"RequestPayer",
             @"uploadId" : @"UploadId",
             };
}

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestPayerRequester);
        }
        return @(AWSS3RequestPayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestPayerRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3LoggingEnabled

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetBucket" : @"TargetBucket",
             @"targetGrants" : @"TargetGrants",
             @"targetPrefix" : @"TargetPrefix",
             };
}

+ (NSValueTransformer *)targetGrantsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3TargetGrant class]];
}

@end

@implementation AWSS3MetadataEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSS3Metrics

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventThreshold" : @"EventThreshold",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)eventThresholdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ReplicationTimeValue class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSS3MetricsStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSS3MetricsStatusDisabled);
        }
        return @(AWSS3MetricsStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3MetricsStatusEnabled:
                return @"Enabled";
            case AWSS3MetricsStatusDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3MetricsAndOperator

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"prefix" : @"Prefix",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3Tag class]];
}

@end

@implementation AWSS3MetricsConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"identifier" : @"Id",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3MetricsFilter class]];
}

@end

@implementation AWSS3MetricsFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"AND" : @"And",
             @"prefix" : @"Prefix",
             @"tag" : @"Tag",
             };
}

+ (NSValueTransformer *)ANDJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3MetricsAndOperator class]];
}

+ (NSValueTransformer *)tagJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Tag class]];
}

@end

@implementation AWSS3MultipartUpload

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"initiated" : @"Initiated",
             @"initiator" : @"Initiator",
             @"key" : @"Key",
             @"owner" : @"Owner",
             @"storageClass" : @"StorageClass",
             @"uploadId" : @"UploadId",
             };
}

+ (NSValueTransformer *)initiatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)initiatorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Initiator class]];
}

+ (NSValueTransformer *)ownerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Owner class]];
}

+ (NSValueTransformer *)storageClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSS3StorageClassStandard);
        }
        if ([value caseInsensitiveCompare:@"REDUCED_REDUNDANCY"] == NSOrderedSame) {
            return @(AWSS3StorageClassReducedRedundancy);
        }
        if ([value caseInsensitiveCompare:@"STANDARD_IA"] == NSOrderedSame) {
            return @(AWSS3StorageClassStandardIa);
        }
        if ([value caseInsensitiveCompare:@"ONEZONE_IA"] == NSOrderedSame) {
            return @(AWSS3StorageClassOnezoneIa);
        }
        if ([value caseInsensitiveCompare:@"INTELLIGENT_TIERING"] == NSOrderedSame) {
            return @(AWSS3StorageClassIntelligentTiering);
        }
        if ([value caseInsensitiveCompare:@"GLACIER"] == NSOrderedSame) {
            return @(AWSS3StorageClassGlacier);
        }
        if ([value caseInsensitiveCompare:@"DEEP_ARCHIVE"] == NSOrderedSame) {
            return @(AWSS3StorageClassDeepArchive);
        }
        if ([value caseInsensitiveCompare:@"OUTPOSTS"] == NSOrderedSame) {
            return @(AWSS3StorageClassOutposts);
        }
        return @(AWSS3StorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3StorageClassStandard:
                return @"STANDARD";
            case AWSS3StorageClassReducedRedundancy:
                return @"REDUCED_REDUNDANCY";
            case AWSS3StorageClassStandardIa:
                return @"STANDARD_IA";
            case AWSS3StorageClassOnezoneIa:
                return @"ONEZONE_IA";
            case AWSS3StorageClassIntelligentTiering:
                return @"INTELLIGENT_TIERING";
            case AWSS3StorageClassGlacier:
                return @"GLACIER";
            case AWSS3StorageClassDeepArchive:
                return @"DEEP_ARCHIVE";
            case AWSS3StorageClassOutposts:
                return @"OUTPOSTS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3NoncurrentVersionExpiration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"noncurrentDays" : @"NoncurrentDays",
             };
}

@end

@implementation AWSS3NoncurrentVersionTransition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"noncurrentDays" : @"NoncurrentDays",
             @"storageClass" : @"StorageClass",
             };
}

+ (NSValueTransformer *)storageClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GLACIER"] == NSOrderedSame) {
            return @(AWSS3TransitionStorageClassGlacier);
        }
        if ([value caseInsensitiveCompare:@"STANDARD_IA"] == NSOrderedSame) {
            return @(AWSS3TransitionStorageClassStandardIa);
        }
        if ([value caseInsensitiveCompare:@"ONEZONE_IA"] == NSOrderedSame) {
            return @(AWSS3TransitionStorageClassOnezoneIa);
        }
        if ([value caseInsensitiveCompare:@"INTELLIGENT_TIERING"] == NSOrderedSame) {
            return @(AWSS3TransitionStorageClassIntelligentTiering);
        }
        if ([value caseInsensitiveCompare:@"DEEP_ARCHIVE"] == NSOrderedSame) {
            return @(AWSS3TransitionStorageClassDeepArchive);
        }
        return @(AWSS3TransitionStorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3TransitionStorageClassGlacier:
                return @"GLACIER";
            case AWSS3TransitionStorageClassStandardIa:
                return @"STANDARD_IA";
            case AWSS3TransitionStorageClassOnezoneIa:
                return @"ONEZONE_IA";
            case AWSS3TransitionStorageClassIntelligentTiering:
                return @"INTELLIGENT_TIERING";
            case AWSS3TransitionStorageClassDeepArchive:
                return @"DEEP_ARCHIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3NotificationConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lambdaFunctionConfigurations" : @"LambdaFunctionConfigurations",
             @"queueConfigurations" : @"QueueConfigurations",
             @"topicConfigurations" : @"TopicConfigurations",
             };
}

+ (NSValueTransformer *)lambdaFunctionConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3LambdaFunctionConfiguration class]];
}

+ (NSValueTransformer *)queueConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3QueueConfiguration class]];
}

+ (NSValueTransformer *)topicConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3TopicConfiguration class]];
}

@end

@implementation AWSS3NotificationConfigurationDeprecated

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudFunctionConfiguration" : @"CloudFunctionConfiguration",
             @"queueConfiguration" : @"QueueConfiguration",
             @"topicConfiguration" : @"TopicConfiguration",
             };
}

+ (NSValueTransformer *)cloudFunctionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3CloudFunctionConfiguration class]];
}

+ (NSValueTransformer *)queueConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3QueueConfigurationDeprecated class]];
}

+ (NSValueTransformer *)topicConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3TopicConfigurationDeprecated class]];
}

@end

@implementation AWSS3NotificationConfigurationFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3S3KeyFilter class]];
}

@end

@implementation AWSS3Object

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"key" : @"Key",
             @"lastModified" : @"LastModified",
             @"owner" : @"Owner",
             @"size" : @"Size",
             @"storageClass" : @"StorageClass",
             };
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)ownerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Owner class]];
}

+ (NSValueTransformer *)storageClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSS3ObjectStorageClassStandard);
        }
        if ([value caseInsensitiveCompare:@"REDUCED_REDUNDANCY"] == NSOrderedSame) {
            return @(AWSS3ObjectStorageClassReducedRedundancy);
        }
        if ([value caseInsensitiveCompare:@"GLACIER"] == NSOrderedSame) {
            return @(AWSS3ObjectStorageClassGlacier);
        }
        if ([value caseInsensitiveCompare:@"STANDARD_IA"] == NSOrderedSame) {
            return @(AWSS3ObjectStorageClassStandardIa);
        }
        if ([value caseInsensitiveCompare:@"ONEZONE_IA"] == NSOrderedSame) {
            return @(AWSS3ObjectStorageClassOnezoneIa);
        }
        if ([value caseInsensitiveCompare:@"INTELLIGENT_TIERING"] == NSOrderedSame) {
            return @(AWSS3ObjectStorageClassIntelligentTiering);
        }
        if ([value caseInsensitiveCompare:@"DEEP_ARCHIVE"] == NSOrderedSame) {
            return @(AWSS3ObjectStorageClassDeepArchive);
        }
        if ([value caseInsensitiveCompare:@"OUTPOSTS"] == NSOrderedSame) {
            return @(AWSS3ObjectStorageClassOutposts);
        }
        return @(AWSS3ObjectStorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ObjectStorageClassStandard:
                return @"STANDARD";
            case AWSS3ObjectStorageClassReducedRedundancy:
                return @"REDUCED_REDUNDANCY";
            case AWSS3ObjectStorageClassGlacier:
                return @"GLACIER";
            case AWSS3ObjectStorageClassStandardIa:
                return @"STANDARD_IA";
            case AWSS3ObjectStorageClassOnezoneIa:
                return @"ONEZONE_IA";
            case AWSS3ObjectStorageClassIntelligentTiering:
                return @"INTELLIGENT_TIERING";
            case AWSS3ObjectStorageClassDeepArchive:
                return @"DEEP_ARCHIVE";
            case AWSS3ObjectStorageClassOutposts:
                return @"OUTPOSTS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3ObjectIdentifier

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSS3ObjectLockConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"objectLockEnabled" : @"ObjectLockEnabled",
             @"rule" : @"Rule",
             };
}

+ (NSValueTransformer *)objectLockEnabledJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSS3ObjectLockEnabledEnabled);
        }
        return @(AWSS3ObjectLockEnabledUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ObjectLockEnabledEnabled:
                return @"Enabled";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)ruleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ObjectLockRule class]];
}

@end

@implementation AWSS3ObjectLockLegalHold

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ON"] == NSOrderedSame) {
            return @(AWSS3ObjectLockLegalHoldStatusOn);
        }
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSS3ObjectLockLegalHoldStatusOff);
        }
        return @(AWSS3ObjectLockLegalHoldStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ObjectLockLegalHoldStatusOn:
                return @"ON";
            case AWSS3ObjectLockLegalHoldStatusOff:
                return @"OFF";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3ObjectLockRetention

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mode" : @"Mode",
             @"retainUntilDate" : @"RetainUntilDate",
             };
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GOVERNANCE"] == NSOrderedSame) {
            return @(AWSS3ObjectLockRetentionModeGovernance);
        }
        if ([value caseInsensitiveCompare:@"COMPLIANCE"] == NSOrderedSame) {
            return @(AWSS3ObjectLockRetentionModeCompliance);
        }
        return @(AWSS3ObjectLockRetentionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ObjectLockRetentionModeGovernance:
                return @"GOVERNANCE";
            case AWSS3ObjectLockRetentionModeCompliance:
                return @"COMPLIANCE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)retainUntilDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSS3ObjectLockRule

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultRetention" : @"DefaultRetention",
             };
}

+ (NSValueTransformer *)defaultRetentionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3DefaultRetention class]];
}

@end

@implementation AWSS3ObjectVersion

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"isLatest" : @"IsLatest",
             @"key" : @"Key",
             @"lastModified" : @"LastModified",
             @"owner" : @"Owner",
             @"size" : @"Size",
             @"storageClass" : @"StorageClass",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)ownerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Owner class]];
}

+ (NSValueTransformer *)storageClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSS3ObjectVersionStorageClassStandard);
        }
        return @(AWSS3ObjectVersionStorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ObjectVersionStorageClassStandard:
                return @"STANDARD";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3OutputLocation

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3" : @"S3",
             };
}

+ (NSValueTransformer *)s3JSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3S3Location class]];
}

@end

@implementation AWSS3OutputSerialization

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"CSV" : @"CSV",
             @"JSON" : @"JSON",
             };
}

+ (NSValueTransformer *)CSVJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3CSVOutput class]];
}

+ (NSValueTransformer *)JSONJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3JSONOutput class]];
}

@end

@implementation AWSS3Owner

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"displayName" : @"DisplayName",
             @"identifier" : @"ID",
             };
}

@end

@implementation AWSS3OwnershipControls

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3OwnershipControlsRule class]];
}

@end

@implementation AWSS3OwnershipControlsRule

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"objectOwnership" : @"ObjectOwnership",
             };
}

+ (NSValueTransformer *)objectOwnershipJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BucketOwnerPreferred"] == NSOrderedSame) {
            return @(AWSS3ObjectOwnershipBucketOwnerPreferred);
        }
        if ([value caseInsensitiveCompare:@"ObjectWriter"] == NSOrderedSame) {
            return @(AWSS3ObjectOwnershipObjectWriter);
        }
        return @(AWSS3ObjectOwnershipUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ObjectOwnershipBucketOwnerPreferred:
                return @"BucketOwnerPreferred";
            case AWSS3ObjectOwnershipObjectWriter:
                return @"ObjectWriter";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3ParquetInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSS3Part

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"lastModified" : @"LastModified",
             @"partNumber" : @"PartNumber",
             @"size" : @"Size",
             };
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSS3PolicyStatus

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isPublic" : @"IsPublic",
             };
}

@end

@implementation AWSS3Progress

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bytesProcessed" : @"BytesProcessed",
             @"bytesReturned" : @"BytesReturned",
             @"bytesScanned" : @"BytesScanned",
             };
}

@end

@implementation AWSS3ProgressEvent

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"details" : @"Details",
             };
}

+ (NSValueTransformer *)detailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Progress class]];
}

@end

@implementation AWSS3PublicAccessBlockConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blockPublicAcls" : @"BlockPublicAcls",
             @"blockPublicPolicy" : @"BlockPublicPolicy",
             @"ignorePublicAcls" : @"IgnorePublicAcls",
             @"restrictPublicBuckets" : @"RestrictPublicBuckets",
             };
}

@end

@implementation AWSS3PutBucketAccelerateConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accelerateConfiguration" : @"AccelerateConfiguration",
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

+ (NSValueTransformer *)accelerateConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3AccelerateConfiguration class]];
}

@end

@implementation AWSS3PutBucketAclRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ACL" : @"ACL",
             @"accessControlPolicy" : @"AccessControlPolicy",
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"grantFullControl" : @"GrantFullControl",
             @"grantRead" : @"GrantRead",
             @"grantReadACP" : @"GrantReadACP",
             @"grantWrite" : @"GrantWrite",
             @"grantWriteACP" : @"GrantWriteACP",
             };
}

+ (NSValueTransformer *)ACLJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"private"] == NSOrderedSame) {
            return @(AWSS3BucketCannedACLPrivate);
        }
        if ([value caseInsensitiveCompare:@"public-read"] == NSOrderedSame) {
            return @(AWSS3BucketCannedACLPublicRead);
        }
        if ([value caseInsensitiveCompare:@"public-read-write"] == NSOrderedSame) {
            return @(AWSS3BucketCannedACLPublicReadWrite);
        }
        if ([value caseInsensitiveCompare:@"authenticated-read"] == NSOrderedSame) {
            return @(AWSS3BucketCannedACLAuthenticatedRead);
        }
        return @(AWSS3BucketCannedACLUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3BucketCannedACLPrivate:
                return @"private";
            case AWSS3BucketCannedACLPublicRead:
                return @"public-read";
            case AWSS3BucketCannedACLPublicReadWrite:
                return @"public-read-write";
            case AWSS3BucketCannedACLAuthenticatedRead:
                return @"authenticated-read";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)accessControlPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3AccessControlPolicy class]];
}

@end

@implementation AWSS3PutBucketAnalyticsConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyticsConfiguration" : @"AnalyticsConfiguration",
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"identifier" : @"Id",
             };
}

+ (NSValueTransformer *)analyticsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3AnalyticsConfiguration class]];
}

@end

@implementation AWSS3PutBucketCorsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"CORSConfiguration" : @"CORSConfiguration",
             @"contentMD5" : @"ContentMD5",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

+ (NSValueTransformer *)CORSConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3CORSConfiguration class]];
}

@end

@implementation AWSS3PutBucketEncryptionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"serverSideEncryptionConfiguration" : @"ServerSideEncryptionConfiguration",
             };
}

+ (NSValueTransformer *)serverSideEncryptionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ServerSideEncryptionConfiguration class]];
}

@end

@implementation AWSS3PutBucketInventoryConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"identifier" : @"Id",
             @"inventoryConfiguration" : @"InventoryConfiguration",
             };
}

+ (NSValueTransformer *)inventoryConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3InventoryConfiguration class]];
}

@end

@implementation AWSS3PutBucketLifecycleConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"lifecycleConfiguration" : @"LifecycleConfiguration",
             };
}

+ (NSValueTransformer *)lifecycleConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3BucketLifecycleConfiguration class]];
}

@end

@implementation AWSS3PutBucketLifecycleRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"lifecycleConfiguration" : @"LifecycleConfiguration",
             };
}

+ (NSValueTransformer *)lifecycleConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3LifecycleConfiguration class]];
}

@end

@implementation AWSS3PutBucketLoggingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"bucketLoggingStatus" : @"BucketLoggingStatus",
             @"contentMD5" : @"ContentMD5",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             };
}

+ (NSValueTransformer *)bucketLoggingStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3BucketLoggingStatus class]];
}

@end

@implementation AWSS3PutBucketMetricsConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"identifier" : @"Id",
             @"metricsConfiguration" : @"MetricsConfiguration",
             };
}

+ (NSValueTransformer *)metricsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3MetricsConfiguration class]];
}

@end

@implementation AWSS3PutBucketNotificationConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"notificationConfiguration" : @"NotificationConfiguration",
             };
}

+ (NSValueTransformer *)notificationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3NotificationConfiguration class]];
}

@end

@implementation AWSS3PutBucketNotificationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"notificationConfiguration" : @"NotificationConfiguration",
             };
}

+ (NSValueTransformer *)notificationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3NotificationConfigurationDeprecated class]];
}

@end

@implementation AWSS3PutBucketOwnershipControlsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"ownershipControls" : @"OwnershipControls",
             };
}

+ (NSValueTransformer *)ownershipControlsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3OwnershipControls class]];
}

@end

@implementation AWSS3PutBucketPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"confirmRemoveSelfBucketAccess" : @"ConfirmRemoveSelfBucketAccess",
             @"contentMD5" : @"ContentMD5",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"policy" : @"Policy",
             };
}

+ (NSValueTransformer *)policyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[NSString class]];
}

@end

@implementation AWSS3PutBucketReplicationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"replicationConfiguration" : @"ReplicationConfiguration",
             @"token" : @"Token",
             };
}

+ (NSValueTransformer *)replicationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ReplicationConfiguration class]];
}

@end

@implementation AWSS3PutBucketRequestPaymentRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"requestPaymentConfiguration" : @"RequestPaymentConfiguration",
             };
}

+ (NSValueTransformer *)requestPaymentConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3RequestPaymentConfiguration class]];
}

@end

@implementation AWSS3PutBucketTaggingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"tagging" : @"Tagging",
             };
}

+ (NSValueTransformer *)taggingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Tagging class]];
}

@end

@implementation AWSS3PutBucketVersioningRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"MFA" : @"MFA",
             @"versioningConfiguration" : @"VersioningConfiguration",
             };
}

+ (NSValueTransformer *)versioningConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3VersioningConfiguration class]];
}

@end

@implementation AWSS3PutBucketWebsiteRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"websiteConfiguration" : @"WebsiteConfiguration",
             };
}

+ (NSValueTransformer *)websiteConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3WebsiteConfiguration class]];
}

@end

@implementation AWSS3PutObjectAclOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requestCharged" : @"RequestCharged",
             };
}

+ (NSValueTransformer *)requestChargedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestChargedRequester);
        }
        return @(AWSS3RequestChargedUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestChargedRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3PutObjectAclRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ACL" : @"ACL",
             @"accessControlPolicy" : @"AccessControlPolicy",
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"grantFullControl" : @"GrantFullControl",
             @"grantRead" : @"GrantRead",
             @"grantReadACP" : @"GrantReadACP",
             @"grantWrite" : @"GrantWrite",
             @"grantWriteACP" : @"GrantWriteACP",
             @"key" : @"Key",
             @"requestPayer" : @"RequestPayer",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)ACLJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"private"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLPrivate);
        }
        if ([value caseInsensitiveCompare:@"public-read"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLPublicRead);
        }
        if ([value caseInsensitiveCompare:@"public-read-write"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLPublicReadWrite);
        }
        if ([value caseInsensitiveCompare:@"authenticated-read"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLAuthenticatedRead);
        }
        if ([value caseInsensitiveCompare:@"aws-exec-read"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLAwsExecRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-read"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLBucketOwnerRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-full-control"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLBucketOwnerFullControl);
        }
        return @(AWSS3ObjectCannedACLUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ObjectCannedACLPrivate:
                return @"private";
            case AWSS3ObjectCannedACLPublicRead:
                return @"public-read";
            case AWSS3ObjectCannedACLPublicReadWrite:
                return @"public-read-write";
            case AWSS3ObjectCannedACLAuthenticatedRead:
                return @"authenticated-read";
            case AWSS3ObjectCannedACLAwsExecRead:
                return @"aws-exec-read";
            case AWSS3ObjectCannedACLBucketOwnerRead:
                return @"bucket-owner-read";
            case AWSS3ObjectCannedACLBucketOwnerFullControl:
                return @"bucket-owner-full-control";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)accessControlPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3AccessControlPolicy class]];
}

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestPayerRequester);
        }
        return @(AWSS3RequestPayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestPayerRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3PutObjectLegalHoldOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requestCharged" : @"RequestCharged",
             };
}

+ (NSValueTransformer *)requestChargedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestChargedRequester);
        }
        return @(AWSS3RequestChargedUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestChargedRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3PutObjectLegalHoldRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"key" : @"Key",
             @"legalHold" : @"LegalHold",
             @"requestPayer" : @"RequestPayer",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)legalHoldJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ObjectLockLegalHold class]];
}

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestPayerRequester);
        }
        return @(AWSS3RequestPayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestPayerRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3PutObjectLockConfigurationOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requestCharged" : @"RequestCharged",
             };
}

+ (NSValueTransformer *)requestChargedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestChargedRequester);
        }
        return @(AWSS3RequestChargedUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestChargedRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3PutObjectLockConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"objectLockConfiguration" : @"ObjectLockConfiguration",
             @"requestPayer" : @"RequestPayer",
             @"token" : @"Token",
             };
}

+ (NSValueTransformer *)objectLockConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ObjectLockConfiguration class]];
}

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestPayerRequester);
        }
        return @(AWSS3RequestPayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestPayerRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3PutObjectOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"expiration" : @"Expiration",
             @"requestCharged" : @"RequestCharged",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"SSEKMSEncryptionContext" : @"SSEKMSEncryptionContext",
             @"SSEKMSKeyId" : @"SSEKMSKeyId",
             @"serverSideEncryption" : @"ServerSideEncryption",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)requestChargedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestChargedRequester);
        }
        return @(AWSS3RequestChargedUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestChargedRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serverSideEncryptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES256"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value caseInsensitiveCompare:@"aws:kms"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAwsKms);
        }
        return @(AWSS3ServerSideEncryptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ServerSideEncryptionAES256:
                return @"AES256";
            case AWSS3ServerSideEncryptionAwsKms:
                return @"aws:kms";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3PutObjectRequest

+ (BOOL)supportsSecureCoding {
    return NO;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ACL" : @"ACL",
             @"body" : @"Body",
             @"bucket" : @"Bucket",
             @"cacheControl" : @"CacheControl",
             @"contentDisposition" : @"ContentDisposition",
             @"contentEncoding" : @"ContentEncoding",
             @"contentLanguage" : @"ContentLanguage",
             @"contentLength" : @"ContentLength",
             @"contentMD5" : @"ContentMD5",
             @"contentType" : @"ContentType",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"expires" : @"Expires",
             @"grantFullControl" : @"GrantFullControl",
             @"grantRead" : @"GrantRead",
             @"grantReadACP" : @"GrantReadACP",
             @"grantWriteACP" : @"GrantWriteACP",
             @"key" : @"Key",
             @"metadata" : @"Metadata",
             @"objectLockLegalHoldStatus" : @"ObjectLockLegalHoldStatus",
             @"objectLockMode" : @"ObjectLockMode",
             @"objectLockRetainUntilDate" : @"ObjectLockRetainUntilDate",
             @"requestPayer" : @"RequestPayer",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKey" : @"SSECustomerKey",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"SSEKMSEncryptionContext" : @"SSEKMSEncryptionContext",
             @"SSEKMSKeyId" : @"SSEKMSKeyId",
             @"serverSideEncryption" : @"ServerSideEncryption",
             @"storageClass" : @"StorageClass",
             @"tagging" : @"Tagging",
             @"websiteRedirectLocation" : @"WebsiteRedirectLocation",
             };
}

+ (NSValueTransformer *)ACLJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"private"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLPrivate);
        }
        if ([value caseInsensitiveCompare:@"public-read"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLPublicRead);
        }
        if ([value caseInsensitiveCompare:@"public-read-write"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLPublicReadWrite);
        }
        if ([value caseInsensitiveCompare:@"authenticated-read"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLAuthenticatedRead);
        }
        if ([value caseInsensitiveCompare:@"aws-exec-read"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLAwsExecRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-read"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLBucketOwnerRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-full-control"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLBucketOwnerFullControl);
        }
        return @(AWSS3ObjectCannedACLUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ObjectCannedACLPrivate:
                return @"private";
            case AWSS3ObjectCannedACLPublicRead:
                return @"public-read";
            case AWSS3ObjectCannedACLPublicReadWrite:
                return @"public-read-write";
            case AWSS3ObjectCannedACLAuthenticatedRead:
                return @"authenticated-read";
            case AWSS3ObjectCannedACLAwsExecRead:
                return @"aws-exec-read";
            case AWSS3ObjectCannedACLBucketOwnerRead:
                return @"bucket-owner-read";
            case AWSS3ObjectCannedACLBucketOwnerFullControl:
                return @"bucket-owner-full-control";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)expiresJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)objectLockLegalHoldStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ON"] == NSOrderedSame) {
            return @(AWSS3ObjectLockLegalHoldStatusOn);
        }
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSS3ObjectLockLegalHoldStatusOff);
        }
        return @(AWSS3ObjectLockLegalHoldStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ObjectLockLegalHoldStatusOn:
                return @"ON";
            case AWSS3ObjectLockLegalHoldStatusOff:
                return @"OFF";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)objectLockModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GOVERNANCE"] == NSOrderedSame) {
            return @(AWSS3ObjectLockModeGovernance);
        }
        if ([value caseInsensitiveCompare:@"COMPLIANCE"] == NSOrderedSame) {
            return @(AWSS3ObjectLockModeCompliance);
        }
        return @(AWSS3ObjectLockModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ObjectLockModeGovernance:
                return @"GOVERNANCE";
            case AWSS3ObjectLockModeCompliance:
                return @"COMPLIANCE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)objectLockRetainUntilDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestPayerRequester);
        }
        return @(AWSS3RequestPayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestPayerRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serverSideEncryptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES256"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value caseInsensitiveCompare:@"aws:kms"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAwsKms);
        }
        return @(AWSS3ServerSideEncryptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ServerSideEncryptionAES256:
                return @"AES256";
            case AWSS3ServerSideEncryptionAwsKms:
                return @"aws:kms";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)storageClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSS3StorageClassStandard);
        }
        if ([value caseInsensitiveCompare:@"REDUCED_REDUNDANCY"] == NSOrderedSame) {
            return @(AWSS3StorageClassReducedRedundancy);
        }
        if ([value caseInsensitiveCompare:@"STANDARD_IA"] == NSOrderedSame) {
            return @(AWSS3StorageClassStandardIa);
        }
        if ([value caseInsensitiveCompare:@"ONEZONE_IA"] == NSOrderedSame) {
            return @(AWSS3StorageClassOnezoneIa);
        }
        if ([value caseInsensitiveCompare:@"INTELLIGENT_TIERING"] == NSOrderedSame) {
            return @(AWSS3StorageClassIntelligentTiering);
        }
        if ([value caseInsensitiveCompare:@"GLACIER"] == NSOrderedSame) {
            return @(AWSS3StorageClassGlacier);
        }
        if ([value caseInsensitiveCompare:@"DEEP_ARCHIVE"] == NSOrderedSame) {
            return @(AWSS3StorageClassDeepArchive);
        }
        if ([value caseInsensitiveCompare:@"OUTPOSTS"] == NSOrderedSame) {
            return @(AWSS3StorageClassOutposts);
        }
        return @(AWSS3StorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3StorageClassStandard:
                return @"STANDARD";
            case AWSS3StorageClassReducedRedundancy:
                return @"REDUCED_REDUNDANCY";
            case AWSS3StorageClassStandardIa:
                return @"STANDARD_IA";
            case AWSS3StorageClassOnezoneIa:
                return @"ONEZONE_IA";
            case AWSS3StorageClassIntelligentTiering:
                return @"INTELLIGENT_TIERING";
            case AWSS3StorageClassGlacier:
                return @"GLACIER";
            case AWSS3StorageClassDeepArchive:
                return @"DEEP_ARCHIVE";
            case AWSS3StorageClassOutposts:
                return @"OUTPOSTS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3PutObjectRetentionOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requestCharged" : @"RequestCharged",
             };
}

+ (NSValueTransformer *)requestChargedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestChargedRequester);
        }
        return @(AWSS3RequestChargedUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestChargedRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3PutObjectRetentionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"bypassGovernanceRetention" : @"BypassGovernanceRetention",
             @"contentMD5" : @"ContentMD5",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"key" : @"Key",
             @"requestPayer" : @"RequestPayer",
             @"retention" : @"Retention",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestPayerRequester);
        }
        return @(AWSS3RequestPayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestPayerRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)retentionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ObjectLockRetention class]];
}

@end

@implementation AWSS3PutObjectTaggingOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSS3PutObjectTaggingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"key" : @"Key",
             @"tagging" : @"Tagging",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)taggingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Tagging class]];
}

@end

@implementation AWSS3PutPublicAccessBlockRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"publicAccessBlockConfiguration" : @"PublicAccessBlockConfiguration",
             };
}

+ (NSValueTransformer *)publicAccessBlockConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3PublicAccessBlockConfiguration class]];
}

@end

@implementation AWSS3QueueConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"events" : @"Events",
             @"filter" : @"Filter",
             @"identifier" : @"Id",
             @"queueArn" : @"QueueArn",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3NotificationConfigurationFilter class]];
}

@end

@implementation AWSS3QueueConfigurationDeprecated

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"event" : @"Event",
             @"events" : @"Events",
             @"identifier" : @"Id",
             @"queue" : @"Queue",
             };
}

+ (NSValueTransformer *)eventJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"s3:ReducedRedundancyLostObject"] == NSOrderedSame) {
            return @(AWSS3EventS3ReducedRedundancyLostObject);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectCreated:*"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectCreated);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectCreated:Put"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectCreatedPut);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectCreated:Post"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectCreatedPost);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectCreated:Copy"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectCreatedCopy);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectCreated:CompleteMultipartUpload"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectCreatedCompleteMultipartUpload);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectRemoved:*"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectRemoved);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectRemoved:Delete"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectRemovedDelete);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectRemoved:DeleteMarkerCreated"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectRemovedDeleteMarkerCreated);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectRestore:*"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectRestore);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectRestore:Post"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectRestorePost);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectRestore:Completed"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectRestoreCompleted);
        }
        if ([value caseInsensitiveCompare:@"s3:Replication:*"] == NSOrderedSame) {
            return @(AWSS3EventS3Replication);
        }
        if ([value caseInsensitiveCompare:@"s3:Replication:OperationFailedReplication"] == NSOrderedSame) {
            return @(AWSS3EventS3ReplicationOperationFailedReplication);
        }
        if ([value caseInsensitiveCompare:@"s3:Replication:OperationNotTracked"] == NSOrderedSame) {
            return @(AWSS3EventS3ReplicationOperationNotTracked);
        }
        if ([value caseInsensitiveCompare:@"s3:Replication:OperationMissedThreshold"] == NSOrderedSame) {
            return @(AWSS3EventS3ReplicationOperationMissedThreshold);
        }
        if ([value caseInsensitiveCompare:@"s3:Replication:OperationReplicatedAfterThreshold"] == NSOrderedSame) {
            return @(AWSS3EventS3ReplicationOperationReplicatedAfterThreshold);
        }
        return @(AWSS3EventUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3EventS3ReducedRedundancyLostObject:
                return @"s3:ReducedRedundancyLostObject";
            case AWSS3EventS3ObjectCreated:
                return @"s3:ObjectCreated:*";
            case AWSS3EventS3ObjectCreatedPut:
                return @"s3:ObjectCreated:Put";
            case AWSS3EventS3ObjectCreatedPost:
                return @"s3:ObjectCreated:Post";
            case AWSS3EventS3ObjectCreatedCopy:
                return @"s3:ObjectCreated:Copy";
            case AWSS3EventS3ObjectCreatedCompleteMultipartUpload:
                return @"s3:ObjectCreated:CompleteMultipartUpload";
            case AWSS3EventS3ObjectRemoved:
                return @"s3:ObjectRemoved:*";
            case AWSS3EventS3ObjectRemovedDelete:
                return @"s3:ObjectRemoved:Delete";
            case AWSS3EventS3ObjectRemovedDeleteMarkerCreated:
                return @"s3:ObjectRemoved:DeleteMarkerCreated";
            case AWSS3EventS3ObjectRestore:
                return @"s3:ObjectRestore:*";
            case AWSS3EventS3ObjectRestorePost:
                return @"s3:ObjectRestore:Post";
            case AWSS3EventS3ObjectRestoreCompleted:
                return @"s3:ObjectRestore:Completed";
            case AWSS3EventS3Replication:
                return @"s3:Replication:*";
            case AWSS3EventS3ReplicationOperationFailedReplication:
                return @"s3:Replication:OperationFailedReplication";
            case AWSS3EventS3ReplicationOperationNotTracked:
                return @"s3:Replication:OperationNotTracked";
            case AWSS3EventS3ReplicationOperationMissedThreshold:
                return @"s3:Replication:OperationMissedThreshold";
            case AWSS3EventS3ReplicationOperationReplicatedAfterThreshold:
                return @"s3:Replication:OperationReplicatedAfterThreshold";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3RecordsEvent

+ (BOOL)supportsSecureCoding {
    return NO;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"payload" : @"Payload",
             };
}

@end

@implementation AWSS3Redirect

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostName" : @"HostName",
             @"httpRedirectCode" : @"HttpRedirectCode",
             @"protocols" : @"Protocol",
             @"replaceKeyPrefixWith" : @"ReplaceKeyPrefixWith",
             @"replaceKeyWith" : @"ReplaceKeyWith",
             };
}

+ (NSValueTransformer *)protocolsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"http"] == NSOrderedSame) {
            return @(AWSS3ProtocolsHTTP);
        }
        if ([value caseInsensitiveCompare:@"https"] == NSOrderedSame) {
            return @(AWSS3ProtocolsHTTPS);
        }
        return @(AWSS3ProtocolsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ProtocolsHTTP:
                return @"http";
            case AWSS3ProtocolsHTTPS:
                return @"https";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3RedirectAllRequestsTo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostName" : @"HostName",
             @"protocols" : @"Protocol",
             };
}

+ (NSValueTransformer *)protocolsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"http"] == NSOrderedSame) {
            return @(AWSS3ProtocolsHTTP);
        }
        if ([value caseInsensitiveCompare:@"https"] == NSOrderedSame) {
            return @(AWSS3ProtocolsHTTPS);
        }
        return @(AWSS3ProtocolsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ProtocolsHTTP:
                return @"http";
            case AWSS3ProtocolsHTTPS:
                return @"https";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3ReplicationConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"role" : @"Role",
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3ReplicationRule class]];
}

@end

@implementation AWSS3ReplicationRule

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleteMarkerReplication" : @"DeleteMarkerReplication",
             @"destination" : @"Destination",
             @"existingObjectReplication" : @"ExistingObjectReplication",
             @"filter" : @"Filter",
             @"identifier" : @"ID",
             @"prefix" : @"Prefix",
             @"priority" : @"Priority",
             @"sourceSelectionCriteria" : @"SourceSelectionCriteria",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)deleteMarkerReplicationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3DeleteMarkerReplication class]];
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Destination class]];
}

+ (NSValueTransformer *)existingObjectReplicationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ExistingObjectReplication class]];
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ReplicationRuleFilter class]];
}

+ (NSValueTransformer *)sourceSelectionCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3SourceSelectionCriteria class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSS3ReplicationRuleStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSS3ReplicationRuleStatusDisabled);
        }
        return @(AWSS3ReplicationRuleStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ReplicationRuleStatusEnabled:
                return @"Enabled";
            case AWSS3ReplicationRuleStatusDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3ReplicationRuleAndOperator

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"prefix" : @"Prefix",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3Tag class]];
}

@end

@implementation AWSS3ReplicationRuleFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"AND" : @"And",
             @"prefix" : @"Prefix",
             @"tag" : @"Tag",
             };
}

+ (NSValueTransformer *)ANDJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ReplicationRuleAndOperator class]];
}

+ (NSValueTransformer *)tagJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Tag class]];
}

@end

@implementation AWSS3ReplicationTime

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             @"time" : @"Time",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSS3ReplicationTimeStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSS3ReplicationTimeStatusDisabled);
        }
        return @(AWSS3ReplicationTimeStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ReplicationTimeStatusEnabled:
                return @"Enabled";
            case AWSS3ReplicationTimeStatusDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ReplicationTimeValue class]];
}

@end

@implementation AWSS3ReplicationTimeValue

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"minutes" : @"Minutes",
             };
}

@end

@implementation AWSS3RequestPaymentConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"payer" : @"Payer",
             };
}

+ (NSValueTransformer *)payerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Requester"] == NSOrderedSame) {
            return @(AWSS3PayerRequester);
        }
        if ([value caseInsensitiveCompare:@"BucketOwner"] == NSOrderedSame) {
            return @(AWSS3PayerBucketOwner);
        }
        return @(AWSS3PayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3PayerRequester:
                return @"Requester";
            case AWSS3PayerBucketOwner:
                return @"BucketOwner";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3RequestProgress

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSS3RestoreObjectOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requestCharged" : @"RequestCharged",
             @"restoreOutputPath" : @"RestoreOutputPath",
             };
}

+ (NSValueTransformer *)requestChargedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestChargedRequester);
        }
        return @(AWSS3RequestChargedUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestChargedRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3RestoreObjectRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"key" : @"Key",
             @"requestPayer" : @"RequestPayer",
             @"restoreRequest" : @"RestoreRequest",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestPayerRequester);
        }
        return @(AWSS3RequestPayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestPayerRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)restoreRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3RestoreRequest class]];
}

@end

@implementation AWSS3RestoreRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"days" : @"Days",
             @"detail" : @"Description",
             @"glacierJobParameters" : @"GlacierJobParameters",
             @"outputLocation" : @"OutputLocation",
             @"selectParameters" : @"SelectParameters",
             @"tier" : @"Tier",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)glacierJobParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3GlacierJobParameters class]];
}

+ (NSValueTransformer *)outputLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3OutputLocation class]];
}

+ (NSValueTransformer *)selectParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3SelectParameters class]];
}

+ (NSValueTransformer *)tierJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSS3TierStandard);
        }
        if ([value caseInsensitiveCompare:@"Bulk"] == NSOrderedSame) {
            return @(AWSS3TierBulk);
        }
        if ([value caseInsensitiveCompare:@"Expedited"] == NSOrderedSame) {
            return @(AWSS3TierExpedited);
        }
        return @(AWSS3TierUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3TierStandard:
                return @"Standard";
            case AWSS3TierBulk:
                return @"Bulk";
            case AWSS3TierExpedited:
                return @"Expedited";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SELECT"] == NSOrderedSame) {
            return @(AWSS3RestoreRequestTypeSelect);
        }
        return @(AWSS3RestoreRequestTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RestoreRequestTypeSelect:
                return @"SELECT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3RoutingRule

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"condition" : @"Condition",
             @"redirect" : @"Redirect",
             };
}

+ (NSValueTransformer *)conditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Condition class]];
}

+ (NSValueTransformer *)redirectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Redirect class]];
}

@end

@implementation AWSS3Rule

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"abortIncompleteMultipartUpload" : @"AbortIncompleteMultipartUpload",
             @"expiration" : @"Expiration",
             @"identifier" : @"ID",
             @"noncurrentVersionExpiration" : @"NoncurrentVersionExpiration",
             @"noncurrentVersionTransition" : @"NoncurrentVersionTransition",
             @"prefix" : @"Prefix",
             @"status" : @"Status",
             @"transition" : @"Transition",
             };
}

+ (NSValueTransformer *)abortIncompleteMultipartUploadJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3AbortIncompleteMultipartUpload class]];
}

+ (NSValueTransformer *)expirationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3LifecycleExpiration class]];
}

+ (NSValueTransformer *)noncurrentVersionExpirationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3NoncurrentVersionExpiration class]];
}

+ (NSValueTransformer *)noncurrentVersionTransitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3NoncurrentVersionTransition class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSS3ExpirationStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSS3ExpirationStatusDisabled);
        }
        return @(AWSS3ExpirationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ExpirationStatusEnabled:
                return @"Enabled";
            case AWSS3ExpirationStatusDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)transitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Transition class]];
}

@end

@implementation AWSS3S3KeyFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterRules" : @"FilterRules",
             };
}

+ (NSValueTransformer *)filterRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3FilterRule class]];
}

@end

@implementation AWSS3S3Location

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessControlList" : @"AccessControlList",
             @"bucketName" : @"BucketName",
             @"cannedACL" : @"CannedACL",
             @"encryption" : @"Encryption",
             @"prefix" : @"Prefix",
             @"storageClass" : @"StorageClass",
             @"tagging" : @"Tagging",
             @"userMetadata" : @"UserMetadata",
             };
}

+ (NSValueTransformer *)accessControlListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3Grant class]];
}

+ (NSValueTransformer *)cannedACLJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"private"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLPrivate);
        }
        if ([value caseInsensitiveCompare:@"public-read"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLPublicRead);
        }
        if ([value caseInsensitiveCompare:@"public-read-write"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLPublicReadWrite);
        }
        if ([value caseInsensitiveCompare:@"authenticated-read"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLAuthenticatedRead);
        }
        if ([value caseInsensitiveCompare:@"aws-exec-read"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLAwsExecRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-read"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLBucketOwnerRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-full-control"] == NSOrderedSame) {
            return @(AWSS3ObjectCannedACLBucketOwnerFullControl);
        }
        return @(AWSS3ObjectCannedACLUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ObjectCannedACLPrivate:
                return @"private";
            case AWSS3ObjectCannedACLPublicRead:
                return @"public-read";
            case AWSS3ObjectCannedACLPublicReadWrite:
                return @"public-read-write";
            case AWSS3ObjectCannedACLAuthenticatedRead:
                return @"authenticated-read";
            case AWSS3ObjectCannedACLAwsExecRead:
                return @"aws-exec-read";
            case AWSS3ObjectCannedACLBucketOwnerRead:
                return @"bucket-owner-read";
            case AWSS3ObjectCannedACLBucketOwnerFullControl:
                return @"bucket-owner-full-control";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)encryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Encryption class]];
}

+ (NSValueTransformer *)storageClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSS3StorageClassStandard);
        }
        if ([value caseInsensitiveCompare:@"REDUCED_REDUNDANCY"] == NSOrderedSame) {
            return @(AWSS3StorageClassReducedRedundancy);
        }
        if ([value caseInsensitiveCompare:@"STANDARD_IA"] == NSOrderedSame) {
            return @(AWSS3StorageClassStandardIa);
        }
        if ([value caseInsensitiveCompare:@"ONEZONE_IA"] == NSOrderedSame) {
            return @(AWSS3StorageClassOnezoneIa);
        }
        if ([value caseInsensitiveCompare:@"INTELLIGENT_TIERING"] == NSOrderedSame) {
            return @(AWSS3StorageClassIntelligentTiering);
        }
        if ([value caseInsensitiveCompare:@"GLACIER"] == NSOrderedSame) {
            return @(AWSS3StorageClassGlacier);
        }
        if ([value caseInsensitiveCompare:@"DEEP_ARCHIVE"] == NSOrderedSame) {
            return @(AWSS3StorageClassDeepArchive);
        }
        if ([value caseInsensitiveCompare:@"OUTPOSTS"] == NSOrderedSame) {
            return @(AWSS3StorageClassOutposts);
        }
        return @(AWSS3StorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3StorageClassStandard:
                return @"STANDARD";
            case AWSS3StorageClassReducedRedundancy:
                return @"REDUCED_REDUNDANCY";
            case AWSS3StorageClassStandardIa:
                return @"STANDARD_IA";
            case AWSS3StorageClassOnezoneIa:
                return @"ONEZONE_IA";
            case AWSS3StorageClassIntelligentTiering:
                return @"INTELLIGENT_TIERING";
            case AWSS3StorageClassGlacier:
                return @"GLACIER";
            case AWSS3StorageClassDeepArchive:
                return @"DEEP_ARCHIVE";
            case AWSS3StorageClassOutposts:
                return @"OUTPOSTS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taggingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Tagging class]];
}

+ (NSValueTransformer *)userMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3MetadataEntry class]];
}

@end

@implementation AWSS3SSEKMS

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSS3SSES3

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSS3ScanRange

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"end" : @"End",
             @"start" : @"Start",
             };
}

@end

@implementation AWSS3SelectObjectContentEventStream

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cont" : @"Cont",
             @"end" : @"End",
             @"progress" : @"Progress",
             @"records" : @"Records",
             @"stats" : @"Stats",
             };
}

+ (NSValueTransformer *)contJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ContinuationEvent class]];
}

+ (NSValueTransformer *)endJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3EndEvent class]];
}

+ (NSValueTransformer *)progressJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ProgressEvent class]];
}

+ (NSValueTransformer *)recordsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3RecordsEvent class]];
}

+ (NSValueTransformer *)statsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3StatsEvent class]];
}

@end

@implementation AWSS3SelectObjectContentOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"payload" : @"Payload",
             };
}

+ (NSValueTransformer *)payloadJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3SelectObjectContentEventStream class]];
}

@end

@implementation AWSS3SelectObjectContentRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"expression" : @"Expression",
             @"expressionType" : @"ExpressionType",
             @"inputSerialization" : @"InputSerialization",
             @"key" : @"Key",
             @"outputSerialization" : @"OutputSerialization",
             @"requestProgress" : @"RequestProgress",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKey" : @"SSECustomerKey",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"scanRange" : @"ScanRange",
             };
}

+ (NSValueTransformer *)expressionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SQL"] == NSOrderedSame) {
            return @(AWSS3ExpressionTypeSql);
        }
        return @(AWSS3ExpressionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ExpressionTypeSql:
                return @"SQL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputSerializationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3InputSerialization class]];
}

+ (NSValueTransformer *)outputSerializationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3OutputSerialization class]];
}

+ (NSValueTransformer *)requestProgressJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3RequestProgress class]];
}

+ (NSValueTransformer *)scanRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ScanRange class]];
}

@end

@implementation AWSS3SelectParameters

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expression" : @"Expression",
             @"expressionType" : @"ExpressionType",
             @"inputSerialization" : @"InputSerialization",
             @"outputSerialization" : @"OutputSerialization",
             };
}

+ (NSValueTransformer *)expressionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SQL"] == NSOrderedSame) {
            return @(AWSS3ExpressionTypeSql);
        }
        return @(AWSS3ExpressionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ExpressionTypeSql:
                return @"SQL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputSerializationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3InputSerialization class]];
}

+ (NSValueTransformer *)outputSerializationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3OutputSerialization class]];
}

@end

@implementation AWSS3ServerSideEncryptionByDefault

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"KMSMasterKeyID" : @"KMSMasterKeyID",
             @"SSEAlgorithm" : @"SSEAlgorithm",
             };
}

+ (NSValueTransformer *)SSEAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES256"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value caseInsensitiveCompare:@"aws:kms"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAwsKms);
        }
        return @(AWSS3ServerSideEncryptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ServerSideEncryptionAES256:
                return @"AES256";
            case AWSS3ServerSideEncryptionAwsKms:
                return @"aws:kms";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3ServerSideEncryptionConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3ServerSideEncryptionRule class]];
}

@end

@implementation AWSS3ServerSideEncryptionRule

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyServerSideEncryptionByDefault" : @"ApplyServerSideEncryptionByDefault",
             };
}

+ (NSValueTransformer *)applyServerSideEncryptionByDefaultJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ServerSideEncryptionByDefault class]];
}

@end

@implementation AWSS3SourceSelectionCriteria

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sseKmsEncryptedObjects" : @"SseKmsEncryptedObjects",
             };
}

+ (NSValueTransformer *)sseKmsEncryptedObjectsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3SseKmsEncryptedObjects class]];
}

@end

@implementation AWSS3SseKmsEncryptedObjects

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSS3SseKmsEncryptedObjectsStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSS3SseKmsEncryptedObjectsStatusDisabled);
        }
        return @(AWSS3SseKmsEncryptedObjectsStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3SseKmsEncryptedObjectsStatusEnabled:
                return @"Enabled";
            case AWSS3SseKmsEncryptedObjectsStatusDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3Stats

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bytesProcessed" : @"BytesProcessed",
             @"bytesReturned" : @"BytesReturned",
             @"bytesScanned" : @"BytesScanned",
             };
}

@end

@implementation AWSS3StatsEvent

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"details" : @"Details",
             };
}

+ (NSValueTransformer *)detailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Stats class]];
}

@end

@implementation AWSS3StorageClassAnalysis

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataExport" : @"DataExport",
             };
}

+ (NSValueTransformer *)dataExportJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3StorageClassAnalysisDataExport class]];
}

@end

@implementation AWSS3StorageClassAnalysisDataExport

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"Destination",
             @"outputSchemaVersion" : @"OutputSchemaVersion",
             };
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3AnalyticsExportDestination class]];
}

+ (NSValueTransformer *)outputSchemaVersionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"V_1"] == NSOrderedSame) {
            return @(AWSS3StorageClassAnalysisSchemaVersionV1);
        }
        return @(AWSS3StorageClassAnalysisSchemaVersionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3StorageClassAnalysisSchemaVersionV1:
                return @"V_1";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3Tag

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

@implementation AWSS3Tagging

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagSet" : @"TagSet",
             };
}

+ (NSValueTransformer *)tagSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3Tag class]];
}

@end

@implementation AWSS3TargetGrant

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grantee" : @"Grantee",
             @"permission" : @"Permission",
             };
}

+ (NSValueTransformer *)granteeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Grantee class]];
}

+ (NSValueTransformer *)permissionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FULL_CONTROL"] == NSOrderedSame) {
            return @(AWSS3BucketLogsPermissionFullControl);
        }
        if ([value caseInsensitiveCompare:@"READ"] == NSOrderedSame) {
            return @(AWSS3BucketLogsPermissionRead);
        }
        if ([value caseInsensitiveCompare:@"WRITE"] == NSOrderedSame) {
            return @(AWSS3BucketLogsPermissionWrite);
        }
        return @(AWSS3BucketLogsPermissionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3BucketLogsPermissionFullControl:
                return @"FULL_CONTROL";
            case AWSS3BucketLogsPermissionRead:
                return @"READ";
            case AWSS3BucketLogsPermissionWrite:
                return @"WRITE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3TopicConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"events" : @"Events",
             @"filter" : @"Filter",
             @"identifier" : @"Id",
             @"topicArn" : @"TopicArn",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3NotificationConfigurationFilter class]];
}

@end

@implementation AWSS3TopicConfigurationDeprecated

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"event" : @"Event",
             @"events" : @"Events",
             @"identifier" : @"Id",
             @"topic" : @"Topic",
             };
}

+ (NSValueTransformer *)eventJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"s3:ReducedRedundancyLostObject"] == NSOrderedSame) {
            return @(AWSS3EventS3ReducedRedundancyLostObject);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectCreated:*"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectCreated);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectCreated:Put"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectCreatedPut);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectCreated:Post"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectCreatedPost);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectCreated:Copy"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectCreatedCopy);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectCreated:CompleteMultipartUpload"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectCreatedCompleteMultipartUpload);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectRemoved:*"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectRemoved);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectRemoved:Delete"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectRemovedDelete);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectRemoved:DeleteMarkerCreated"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectRemovedDeleteMarkerCreated);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectRestore:*"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectRestore);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectRestore:Post"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectRestorePost);
        }
        if ([value caseInsensitiveCompare:@"s3:ObjectRestore:Completed"] == NSOrderedSame) {
            return @(AWSS3EventS3ObjectRestoreCompleted);
        }
        if ([value caseInsensitiveCompare:@"s3:Replication:*"] == NSOrderedSame) {
            return @(AWSS3EventS3Replication);
        }
        if ([value caseInsensitiveCompare:@"s3:Replication:OperationFailedReplication"] == NSOrderedSame) {
            return @(AWSS3EventS3ReplicationOperationFailedReplication);
        }
        if ([value caseInsensitiveCompare:@"s3:Replication:OperationNotTracked"] == NSOrderedSame) {
            return @(AWSS3EventS3ReplicationOperationNotTracked);
        }
        if ([value caseInsensitiveCompare:@"s3:Replication:OperationMissedThreshold"] == NSOrderedSame) {
            return @(AWSS3EventS3ReplicationOperationMissedThreshold);
        }
        if ([value caseInsensitiveCompare:@"s3:Replication:OperationReplicatedAfterThreshold"] == NSOrderedSame) {
            return @(AWSS3EventS3ReplicationOperationReplicatedAfterThreshold);
        }
        return @(AWSS3EventUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3EventS3ReducedRedundancyLostObject:
                return @"s3:ReducedRedundancyLostObject";
            case AWSS3EventS3ObjectCreated:
                return @"s3:ObjectCreated:*";
            case AWSS3EventS3ObjectCreatedPut:
                return @"s3:ObjectCreated:Put";
            case AWSS3EventS3ObjectCreatedPost:
                return @"s3:ObjectCreated:Post";
            case AWSS3EventS3ObjectCreatedCopy:
                return @"s3:ObjectCreated:Copy";
            case AWSS3EventS3ObjectCreatedCompleteMultipartUpload:
                return @"s3:ObjectCreated:CompleteMultipartUpload";
            case AWSS3EventS3ObjectRemoved:
                return @"s3:ObjectRemoved:*";
            case AWSS3EventS3ObjectRemovedDelete:
                return @"s3:ObjectRemoved:Delete";
            case AWSS3EventS3ObjectRemovedDeleteMarkerCreated:
                return @"s3:ObjectRemoved:DeleteMarkerCreated";
            case AWSS3EventS3ObjectRestore:
                return @"s3:ObjectRestore:*";
            case AWSS3EventS3ObjectRestorePost:
                return @"s3:ObjectRestore:Post";
            case AWSS3EventS3ObjectRestoreCompleted:
                return @"s3:ObjectRestore:Completed";
            case AWSS3EventS3Replication:
                return @"s3:Replication:*";
            case AWSS3EventS3ReplicationOperationFailedReplication:
                return @"s3:Replication:OperationFailedReplication";
            case AWSS3EventS3ReplicationOperationNotTracked:
                return @"s3:Replication:OperationNotTracked";
            case AWSS3EventS3ReplicationOperationMissedThreshold:
                return @"s3:Replication:OperationMissedThreshold";
            case AWSS3EventS3ReplicationOperationReplicatedAfterThreshold:
                return @"s3:Replication:OperationReplicatedAfterThreshold";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3Transition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"date" : @"Date",
             @"days" : @"Days",
             @"storageClass" : @"StorageClass",
             };
}

+ (NSValueTransformer *)dateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)storageClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GLACIER"] == NSOrderedSame) {
            return @(AWSS3TransitionStorageClassGlacier);
        }
        if ([value caseInsensitiveCompare:@"STANDARD_IA"] == NSOrderedSame) {
            return @(AWSS3TransitionStorageClassStandardIa);
        }
        if ([value caseInsensitiveCompare:@"ONEZONE_IA"] == NSOrderedSame) {
            return @(AWSS3TransitionStorageClassOnezoneIa);
        }
        if ([value caseInsensitiveCompare:@"INTELLIGENT_TIERING"] == NSOrderedSame) {
            return @(AWSS3TransitionStorageClassIntelligentTiering);
        }
        if ([value caseInsensitiveCompare:@"DEEP_ARCHIVE"] == NSOrderedSame) {
            return @(AWSS3TransitionStorageClassDeepArchive);
        }
        return @(AWSS3TransitionStorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3TransitionStorageClassGlacier:
                return @"GLACIER";
            case AWSS3TransitionStorageClassStandardIa:
                return @"STANDARD_IA";
            case AWSS3TransitionStorageClassOnezoneIa:
                return @"ONEZONE_IA";
            case AWSS3TransitionStorageClassIntelligentTiering:
                return @"INTELLIGENT_TIERING";
            case AWSS3TransitionStorageClassDeepArchive:
                return @"DEEP_ARCHIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3UploadPartCopyOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicatePartResult" : @"CopyPartResult",
             @"replicateSourceVersionId" : @"CopySourceVersionId",
             @"requestCharged" : @"RequestCharged",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"SSEKMSKeyId" : @"SSEKMSKeyId",
             @"serverSideEncryption" : @"ServerSideEncryption",
             };
}

+ (NSValueTransformer *)replicatePartResultJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ReplicatePartResult class]];
}

+ (NSValueTransformer *)requestChargedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestChargedRequester);
        }
        return @(AWSS3RequestChargedUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestChargedRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serverSideEncryptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES256"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value caseInsensitiveCompare:@"aws:kms"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAwsKms);
        }
        return @(AWSS3ServerSideEncryptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ServerSideEncryptionAES256:
                return @"AES256";
            case AWSS3ServerSideEncryptionAwsKms:
                return @"aws:kms";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3UploadPartCopyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"replicateSource" : @"CopySource",
             @"replicateSourceIfMatch" : @"CopySourceIfMatch",
             @"replicateSourceIfModifiedSince" : @"CopySourceIfModifiedSince",
             @"replicateSourceIfNoneMatch" : @"CopySourceIfNoneMatch",
             @"replicateSourceIfUnmodifiedSince" : @"CopySourceIfUnmodifiedSince",
             @"replicateSourceRange" : @"CopySourceRange",
             @"replicateSourceSSECustomerAlgorithm" : @"CopySourceSSECustomerAlgorithm",
             @"replicateSourceSSECustomerKey" : @"CopySourceSSECustomerKey",
             @"replicateSourceSSECustomerKeyMD5" : @"CopySourceSSECustomerKeyMD5",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"expectedSourceBucketOwner" : @"ExpectedSourceBucketOwner",
             @"key" : @"Key",
             @"partNumber" : @"PartNumber",
             @"requestPayer" : @"RequestPayer",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKey" : @"SSECustomerKey",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"uploadId" : @"UploadId",
             };
}

+ (NSValueTransformer *)replicateSourceIfModifiedSinceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)replicateSourceIfUnmodifiedSinceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestPayerRequester);
        }
        return @(AWSS3RequestPayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestPayerRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3UploadPartOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"requestCharged" : @"RequestCharged",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"SSEKMSKeyId" : @"SSEKMSKeyId",
             @"serverSideEncryption" : @"ServerSideEncryption",
             };
}

+ (NSValueTransformer *)requestChargedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestChargedRequester);
        }
        return @(AWSS3RequestChargedUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestChargedRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serverSideEncryptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES256"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value caseInsensitiveCompare:@"aws:kms"] == NSOrderedSame) {
            return @(AWSS3ServerSideEncryptionAwsKms);
        }
        return @(AWSS3ServerSideEncryptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ServerSideEncryptionAES256:
                return @"AES256";
            case AWSS3ServerSideEncryptionAwsKms:
                return @"aws:kms";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3UploadPartRequest

+ (BOOL)supportsSecureCoding {
    return NO;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"bucket" : @"Bucket",
             @"contentLength" : @"ContentLength",
             @"contentMD5" : @"ContentMD5",
             @"expectedBucketOwner" : @"ExpectedBucketOwner",
             @"key" : @"Key",
             @"partNumber" : @"PartNumber",
             @"requestPayer" : @"RequestPayer",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKey" : @"SSECustomerKey",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"uploadId" : @"UploadId",
             };
}

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requester"] == NSOrderedSame) {
            return @(AWSS3RequestPayerRequester);
        }
        return @(AWSS3RequestPayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3RequestPayerRequester:
                return @"requester";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3VersioningConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"MFADelete" : @"MFADelete",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)MFADeleteJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSS3MFADeleteEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSS3MFADeleteDisabled);
        }
        return @(AWSS3MFADeleteUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3MFADeleteEnabled:
                return @"Enabled";
            case AWSS3MFADeleteDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSS3BucketVersioningStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"Suspended"] == NSOrderedSame) {
            return @(AWSS3BucketVersioningStatusSuspended);
        }
        return @(AWSS3BucketVersioningStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3BucketVersioningStatusEnabled:
                return @"Enabled";
            case AWSS3BucketVersioningStatusSuspended:
                return @"Suspended";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3WebsiteConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorDocument" : @"ErrorDocument",
             @"indexDocument" : @"IndexDocument",
             @"redirectAllRequestsTo" : @"RedirectAllRequestsTo",
             @"routingRules" : @"RoutingRules",
             };
}

+ (NSValueTransformer *)errorDocumentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ErrorDocument class]];
}

+ (NSValueTransformer *)indexDocumentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3IndexDocument class]];
}

+ (NSValueTransformer *)redirectAllRequestsToJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3RedirectAllRequestsTo class]];
}

+ (NSValueTransformer *)routingRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3RoutingRule class]];
}

@end
