//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"daysAfterInitiation" : @"DaysAfterInitiation",
             };
}

@end

@implementation AWSS3AbortMultipartUploadOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3CommonPrefix

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"prefix" : @"Prefix",
             };
}

@end

@implementation AWSS3CompleteMultipartUploadOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"partNumber" : @"PartNumber",
             };
}

@end

@implementation AWSS3Condition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"httpErrorCodeReturnedEquals" : @"HttpErrorCodeReturnedEquals",
             @"keyPrefixEquals" : @"KeyPrefixEquals",
             };
}

@end

@implementation AWSS3ContinuationEvent

@end

@implementation AWSS3ReplicateObjectOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicateObjectResult" : @"CopyObjectResult",
             @"replicateSourceVersionId" : @"CopySourceVersionId",
             @"expiration" : @"Expiration",
             @"requestCharged" : @"RequestCharged",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
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
             @"expires" : @"Expires",
             @"grantFullControl" : @"GrantFullControl",
             @"grantRead" : @"GrantRead",
             @"grantReadACP" : @"GrantReadACP",
             @"grantWriteACP" : @"GrantWriteACP",
             @"key" : @"Key",
             @"metadata" : @"Metadata",
             @"metadataDirective" : @"MetadataDirective",
             @"requestPayer" : @"RequestPayer",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKey" : @"SSECustomerKey",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
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
        if ([value caseInsensitiveCompare:@"EU"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEU);
        }
        if ([value caseInsensitiveCompare:@"eu-west-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEUWest1);
        }
        if ([value caseInsensitiveCompare:@"us-west-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintUSWest1);
        }
        if ([value caseInsensitiveCompare:@"us-west-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintUSWest2);
        }
        if ([value caseInsensitiveCompare:@"eu-west-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEUWest2);
        }
        if ([value caseInsensitiveCompare:@"eu-west-3"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEUWest3);
        }
        if ([value caseInsensitiveCompare:@"us-east-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintUSEast2);
        }
        if ([value caseInsensitiveCompare:@"ap-south-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPSouth1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPSoutheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPSoutheast2);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPNortheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPNortheast2);
        }
        if ([value caseInsensitiveCompare:@"sa-east-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintSAEast1);
        }
        if ([value caseInsensitiveCompare:@"cn-north-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintCNNorth1);
        }
        if ([value caseInsensitiveCompare:@"cn-northwest-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintCNNorthwest1);
        }
        if ([value caseInsensitiveCompare:@"us-gov-west-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintUSGovWest1);
        }
        if ([value caseInsensitiveCompare:@"eu-central-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEUCentral1);
        }
        if ([value caseInsensitiveCompare:@"ca-central-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintCACentral1);
        }
        return @(AWSS3BucketLocationConstraintUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3BucketLocationConstraintBlank:
                return @"";
            case AWSS3BucketLocationConstraintEU:
                return @"EU";
            case AWSS3BucketLocationConstraintEUWest1:
                return @"eu-west-1";
            case AWSS3BucketLocationConstraintUSWest1:
                return @"us-west-1";
            case AWSS3BucketLocationConstraintUSWest2:
                return @"us-west-2";
            case AWSS3BucketLocationConstraintEUWest2:
                return @"eu-west-2";
            case AWSS3BucketLocationConstraintEUWest3:
                return @"eu-west-3";
            case AWSS3BucketLocationConstraintUSEast2:
                return @"us-east-2";
            case AWSS3BucketLocationConstraintAPSouth1:
                return @"ap-south-1";
            case AWSS3BucketLocationConstraintAPSoutheast1:
                return @"ap-southeast-1";
            case AWSS3BucketLocationConstraintAPSoutheast2:
                return @"ap-southeast-2";
            case AWSS3BucketLocationConstraintAPNortheast1:
                return @"ap-northeast-1";
            case AWSS3BucketLocationConstraintAPNortheast2:
                return @"ap-northeast-2";
            case AWSS3BucketLocationConstraintSAEast1:
                return @"sa-east-1";
            case AWSS3BucketLocationConstraintCNNorth1:
                return @"cn-north-1";
            case AWSS3BucketLocationConstraintCNNorthwest1:
                return @"cn-northwest-1";
            case AWSS3BucketLocationConstraintUSGovWest1:
                return @"us-gov-west-1";
            case AWSS3BucketLocationConstraintEUCentral1:
                return @"eu-central-1";
            case AWSS3BucketLocationConstraintCACentral1:
                return @"ca-central-1";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3CreateBucketOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"location" : @"Location",
             };
}

@end

@implementation AWSS3CreateBucketRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"abortDate" : @"AbortDate",
             @"abortRuleId" : @"AbortRuleId",
             @"bucket" : @"Bucket",
             @"key" : @"Key",
             @"requestCharged" : @"RequestCharged",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ACL" : @"ACL",
             @"bucket" : @"Bucket",
             @"cacheControl" : @"CacheControl",
             @"contentDisposition" : @"ContentDisposition",
             @"contentEncoding" : @"ContentEncoding",
             @"contentLanguage" : @"ContentLanguage",
             @"contentType" : @"ContentType",
             @"expires" : @"Expires",
             @"grantFullControl" : @"GrantFullControl",
             @"grantRead" : @"GrantRead",
             @"grantReadACP" : @"GrantReadACP",
             @"grantWriteACP" : @"GrantWriteACP",
             @"key" : @"Key",
             @"metadata" : @"Metadata",
             @"requestPayer" : @"RequestPayer",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKey" : @"SSECustomerKey",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3Remove

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSS3DeleteBucketCorsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             };
}

@end

@implementation AWSS3DeleteBucketEncryptionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             };
}

@end

@implementation AWSS3DeleteBucketInventoryConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSS3DeleteBucketLifecycleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             };
}

@end

@implementation AWSS3DeleteBucketMetricsConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSS3DeleteBucketPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             };
}

@end

@implementation AWSS3DeleteBucketReplicationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             };
}

@end

@implementation AWSS3DeleteBucketRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             };
}

@end

@implementation AWSS3DeleteBucketTaggingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             };
}

@end

@implementation AWSS3DeleteBucketWebsiteRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             };
}

@end

@implementation AWSS3DeleteMarkerEntry

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSS3DeleteObjectTaggingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"key" : @"Key",
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSS3DeleteObjectsOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"remove" : @"Delete",
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

@implementation AWSS3DeletedObject

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessControlTranslation" : @"AccessControlTranslation",
             @"account" : @"Account",
             @"bucket" : @"Bucket",
             @"encryptionConfiguration" : @"EncryptionConfiguration",
             @"storageClass" : @"StorageClass",
             };
}

+ (NSValueTransformer *)accessControlTranslationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3AccessControlTranslation class]];
}

+ (NSValueTransformer *)encryptionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3EncryptionConfiguration class]];
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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3Encryption

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicaKmsKeyID" : @"ReplicaKmsKeyID",
             };
}

@end

@implementation AWSS3EndEvent

@end

@implementation AWSS3Error

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             };
}

@end

@implementation AWSS3FilterRule

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             };
}

@end

@implementation AWSS3GetBucketAclOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             };
}

@end

@implementation AWSS3GetBucketAnalyticsConfigurationOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSS3GetBucketCorsOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             };
}

@end

@implementation AWSS3GetBucketEncryptionOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             };
}

@end

@implementation AWSS3GetBucketInventoryConfigurationOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSS3GetBucketLifecycleConfigurationOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             };
}

@end

@implementation AWSS3GetBucketLifecycleOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             };
}

@end

@implementation AWSS3GetBucketLocationOutput

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
        if ([value caseInsensitiveCompare:@"EU"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEU);
        }
        if ([value caseInsensitiveCompare:@"eu-west-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEUWest1);
        }
        if ([value caseInsensitiveCompare:@"us-west-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintUSWest1);
        }
        if ([value caseInsensitiveCompare:@"us-west-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintUSWest2);
        }
        if ([value caseInsensitiveCompare:@"eu-west-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEUWest2);
        }
        if ([value caseInsensitiveCompare:@"eu-west-3"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEUWest3);
        }
        if ([value caseInsensitiveCompare:@"us-east-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintUSEast2);
        }
        if ([value caseInsensitiveCompare:@"ap-south-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPSouth1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPSoutheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-southeast-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPSoutheast2);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPNortheast1);
        }
        if ([value caseInsensitiveCompare:@"ap-northeast-2"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintAPNortheast2);
        }
        if ([value caseInsensitiveCompare:@"sa-east-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintSAEast1);
        }
        if ([value caseInsensitiveCompare:@"cn-north-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintCNNorth1);
        }
        if ([value caseInsensitiveCompare:@"cn-northwest-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintCNNorthwest1);
        }
        if ([value caseInsensitiveCompare:@"us-gov-west-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintUSGovWest1);
        }
        if ([value caseInsensitiveCompare:@"eu-central-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintEUCentral1);
        }
        if ([value caseInsensitiveCompare:@"ca-central-1"] == NSOrderedSame) {
            return @(AWSS3BucketLocationConstraintCACentral1);
        }
        return @(AWSS3BucketLocationConstraintUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3BucketLocationConstraintBlank:
                return @"";
            case AWSS3BucketLocationConstraintEU:
                return @"EU";
            case AWSS3BucketLocationConstraintEUWest1:
                return @"eu-west-1";
            case AWSS3BucketLocationConstraintUSWest1:
                return @"us-west-1";
            case AWSS3BucketLocationConstraintUSWest2:
                return @"us-west-2";
            case AWSS3BucketLocationConstraintEUWest2:
                return @"eu-west-2";
            case AWSS3BucketLocationConstraintEUWest3:
                return @"eu-west-3";
            case AWSS3BucketLocationConstraintUSEast2:
                return @"us-east-2";
            case AWSS3BucketLocationConstraintAPSouth1:
                return @"ap-south-1";
            case AWSS3BucketLocationConstraintAPSoutheast1:
                return @"ap-southeast-1";
            case AWSS3BucketLocationConstraintAPSoutheast2:
                return @"ap-southeast-2";
            case AWSS3BucketLocationConstraintAPNortheast1:
                return @"ap-northeast-1";
            case AWSS3BucketLocationConstraintAPNortheast2:
                return @"ap-northeast-2";
            case AWSS3BucketLocationConstraintSAEast1:
                return @"sa-east-1";
            case AWSS3BucketLocationConstraintCNNorth1:
                return @"cn-north-1";
            case AWSS3BucketLocationConstraintCNNorthwest1:
                return @"cn-northwest-1";
            case AWSS3BucketLocationConstraintUSGovWest1:
                return @"us-gov-west-1";
            case AWSS3BucketLocationConstraintEUCentral1:
                return @"eu-central-1";
            case AWSS3BucketLocationConstraintCACentral1:
                return @"ca-central-1";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3GetBucketLocationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             };
}

@end

@implementation AWSS3GetBucketLoggingOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             };
}

@end

@implementation AWSS3GetBucketMetricsConfigurationOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSS3GetBucketNotificationConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             };
}

@end

@implementation AWSS3GetBucketPolicyOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             };
}

@end

@implementation AWSS3GetBucketReplicationOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             };
}

@end

@implementation AWSS3GetBucketRequestPaymentOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             };
}

@end

@implementation AWSS3GetBucketTaggingOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             };
}

@end

@implementation AWSS3GetBucketVersioningOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             };
}

@end

@implementation AWSS3GetBucketWebsiteOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             };
}

@end

@implementation AWSS3GetObjectAclOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
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

@implementation AWSS3GetObjectOutput

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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3GetObjectRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
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

@implementation AWSS3GetObjectTaggingOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"key" : @"Key",
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSS3GetObjectTorrentOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
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

@implementation AWSS3GlacierJobParameters

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             };
}

@end

@implementation AWSS3HeadObjectOutput

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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3HeadObjectRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"suffix" : @"Suffix",
             };
}

@end

@implementation AWSS3Initiator

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"displayName" : @"DisplayName",
             @"identifier" : @"ID",
             };
}

@end

@implementation AWSS3InputSerialization

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"prefix" : @"Prefix",
             };
}

@end

@implementation AWSS3InventoryS3BucketDestination

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
        return @(AWSS3InventoryFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3InventoryFormatCsv:
                return @"CSV";
            case AWSS3InventoryFormatOrc:
                return @"ORC";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3InventorySchedule

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recordDelimiter" : @"RecordDelimiter",
             };
}

@end

@implementation AWSS3LambdaFunctionConfiguration

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"continuationToken" : @"ContinuationToken",
             };
}

@end

@implementation AWSS3ListBucketInventoryConfigurationsOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"continuationToken" : @"ContinuationToken",
             };
}

@end

@implementation AWSS3ListBucketMetricsConfigurationsOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"continuationToken" : @"ContinuationToken",
             };
}

@end

@implementation AWSS3ListBucketsOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"delimiter" : @"Delimiter",
             @"encodingType" : @"EncodingType",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"delimiter" : @"Delimiter",
             @"encodingType" : @"EncodingType",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"delimiter" : @"Delimiter",
             @"encodingType" : @"EncodingType",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"continuationToken" : @"ContinuationToken",
             @"delimiter" : @"Delimiter",
             @"encodingType" : @"EncodingType",
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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3ListPartsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSS3MetricsAndOperator

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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3NoncurrentVersionExpiration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"noncurrentDays" : @"NoncurrentDays",
             };
}

@end

@implementation AWSS3NoncurrentVersionTransition

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
        return @(AWSS3TransitionStorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3TransitionStorageClassGlacier:
                return @"GLACIER";
            case AWSS3TransitionStorageClassStandardIa:
                return @"STANDARD_IA";
            case AWSS3TransitionStorageClassOnezoneIa:
                return @"ONEZONE_IA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3NotificationConfiguration

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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3ObjectIdentifier

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSS3ObjectVersion

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"displayName" : @"DisplayName",
             @"identifier" : @"ID",
             };
}

@end

@implementation AWSS3ParquetInput

@end

@implementation AWSS3Part

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

@implementation AWSS3Progress

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bytesProcessed" : @"BytesProcessed",
             @"bytesReturned" : @"BytesReturned",
             @"bytesScanned" : @"BytesScanned",
             };
}

@end

@implementation AWSS3ProgressEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"details" : @"Details",
             };
}

+ (NSValueTransformer *)detailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Progress class]];
}

@end

@implementation AWSS3PutBucketAccelerateConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accelerateConfiguration" : @"AccelerateConfiguration",
             @"bucket" : @"Bucket",
             };
}

+ (NSValueTransformer *)accelerateConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3AccelerateConfiguration class]];
}

@end

@implementation AWSS3PutBucketAclRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ACL" : @"ACL",
             @"accessControlPolicy" : @"AccessControlPolicy",
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyticsConfiguration" : @"AnalyticsConfiguration",
             @"bucket" : @"Bucket",
             @"identifier" : @"Id",
             };
}

+ (NSValueTransformer *)analyticsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3AnalyticsConfiguration class]];
}

@end

@implementation AWSS3PutBucketCorsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"CORSConfiguration" : @"CORSConfiguration",
             @"contentMD5" : @"ContentMD5",
             };
}

+ (NSValueTransformer *)CORSConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3CORSConfiguration class]];
}

@end

@implementation AWSS3PutBucketEncryptionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"serverSideEncryptionConfiguration" : @"ServerSideEncryptionConfiguration",
             };
}

+ (NSValueTransformer *)serverSideEncryptionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ServerSideEncryptionConfiguration class]];
}

@end

@implementation AWSS3PutBucketInventoryConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"identifier" : @"Id",
             @"inventoryConfiguration" : @"InventoryConfiguration",
             };
}

+ (NSValueTransformer *)inventoryConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3InventoryConfiguration class]];
}

@end

@implementation AWSS3PutBucketLifecycleConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"lifecycleConfiguration" : @"LifecycleConfiguration",
             };
}

+ (NSValueTransformer *)lifecycleConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3BucketLifecycleConfiguration class]];
}

@end

@implementation AWSS3PutBucketLifecycleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"lifecycleConfiguration" : @"LifecycleConfiguration",
             };
}

+ (NSValueTransformer *)lifecycleConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3LifecycleConfiguration class]];
}

@end

@implementation AWSS3PutBucketLoggingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"bucketLoggingStatus" : @"BucketLoggingStatus",
             @"contentMD5" : @"ContentMD5",
             };
}

+ (NSValueTransformer *)bucketLoggingStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3BucketLoggingStatus class]];
}

@end

@implementation AWSS3PutBucketMetricsConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"identifier" : @"Id",
             @"metricsConfiguration" : @"MetricsConfiguration",
             };
}

+ (NSValueTransformer *)metricsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3MetricsConfiguration class]];
}

@end

@implementation AWSS3PutBucketNotificationConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"notificationConfiguration" : @"NotificationConfiguration",
             };
}

+ (NSValueTransformer *)notificationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3NotificationConfiguration class]];
}

@end

@implementation AWSS3PutBucketNotificationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"notificationConfiguration" : @"NotificationConfiguration",
             };
}

+ (NSValueTransformer *)notificationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3NotificationConfigurationDeprecated class]];
}

@end

@implementation AWSS3PutBucketPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"confirmRemoveSelfBucketAccess" : @"ConfirmRemoveSelfBucketAccess",
             @"contentMD5" : @"ContentMD5",
             @"policy" : @"Policy",
             };
}

+ (NSValueTransformer *)policyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[NSString class]];
}

@end

@implementation AWSS3PutBucketReplicationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"replicationConfiguration" : @"ReplicationConfiguration",
             };
}

+ (NSValueTransformer *)replicationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ReplicationConfiguration class]];
}

@end

@implementation AWSS3PutBucketRequestPaymentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"requestPaymentConfiguration" : @"RequestPaymentConfiguration",
             };
}

+ (NSValueTransformer *)requestPaymentConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3RequestPaymentConfiguration class]];
}

@end

@implementation AWSS3PutBucketTaggingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"tagging" : @"Tagging",
             };
}

+ (NSValueTransformer *)taggingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Tagging class]];
}

@end

@implementation AWSS3PutBucketVersioningRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"MFA" : @"MFA",
             @"versioningConfiguration" : @"VersioningConfiguration",
             };
}

+ (NSValueTransformer *)versioningConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3VersioningConfiguration class]];
}

@end

@implementation AWSS3PutBucketWebsiteRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"websiteConfiguration" : @"WebsiteConfiguration",
             };
}

+ (NSValueTransformer *)websiteConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3WebsiteConfiguration class]];
}

@end

@implementation AWSS3PutObjectAclOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ACL" : @"ACL",
             @"accessControlPolicy" : @"AccessControlPolicy",
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
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

@implementation AWSS3PutObjectOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"expiration" : @"Expiration",
             @"requestCharged" : @"RequestCharged",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
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
             @"expires" : @"Expires",
             @"grantFullControl" : @"GrantFullControl",
             @"grantRead" : @"GrantRead",
             @"grantReadACP" : @"GrantReadACP",
             @"grantWriteACP" : @"GrantWriteACP",
             @"key" : @"Key",
             @"metadata" : @"Metadata",
             @"requestPayer" : @"RequestPayer",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKey" : @"SSECustomerKey",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3PutObjectTaggingOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSS3PutObjectTaggingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"key" : @"Key",
             @"tagging" : @"Tagging",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)taggingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Tagging class]];
}

@end

@implementation AWSS3QueueConfiguration

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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3RecordsEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"payload" : @"Payload",
             };
}

@end

@implementation AWSS3Redirect

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleteMarkerReplication" : @"DeleteMarkerReplication",
             @"destination" : @"Destination",
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

@implementation AWSS3RequestPaymentConfiguration

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSS3RestoreObjectOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSS3SSES3

@end

@implementation AWSS3SelectObjectContentEventStream

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"expression" : @"Expression",
             @"expressionType" : @"ExpressionType",
             @"inputSerialization" : @"InputSerialization",
             @"key" : @"Key",
             @"outputSerialization" : @"OutputSerialization",
             @"requestProgress" : @"RequestProgress",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKey" : @"SSECustomerKey",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
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

@end

@implementation AWSS3SelectParameters

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bytesProcessed" : @"BytesProcessed",
             @"bytesReturned" : @"BytesReturned",
             @"bytesScanned" : @"BytesScanned",
             };
}

@end

@implementation AWSS3StatsEvent

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSS3Tagging

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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3Transition

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
        return @(AWSS3TransitionStorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3TransitionStorageClassGlacier:
                return @"GLACIER";
            case AWSS3TransitionStorageClassStandardIa:
                return @"STANDARD_IA";
            case AWSS3TransitionStorageClassOnezoneIa:
                return @"ONEZONE_IA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3UploadPartCopyOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"bucket" : @"Bucket",
             @"contentLength" : @"ContentLength",
             @"contentMD5" : @"ContentMD5",
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
