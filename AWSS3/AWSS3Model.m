/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import "AWSS3Model.h"
#import "AWSCategory.h"

NSString *const AWSS3ErrorDomain = @"com.amazonaws.AWSS3ErrorDomain";

@implementation AWSS3AbortMultipartUploadRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"key" : @"Key",
             @"uploadId" : @"UploadId",
             };
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
        if ([value isEqualToString:@"s3:ReducedRedundancyLostObject"]) {
            return @(AWSS3EventS3ReducedRedundancyLostObject);
        }
        if ([value isEqualToString:@"s3:ObjectCreated:Put"]) {
            return @(AWSS3EventS3ObjectCreatedPut);
        }
        if ([value isEqualToString:@"s3:ObjectCreated:Post"]) {
            return @(AWSS3EventS3ObjectCreatedPost);
        }
        if ([value isEqualToString:@"s3:ObjectCreated:Copy"]) {
            return @(AWSS3EventS3ObjectCreatedCopy);
        }
        if ([value isEqualToString:@"s3:ObjectCreated:CompleteMultipartUpload"]) {
            return @(AWSS3EventS3ObjectCreatedCompleteMultipartUpload);
        }
        return @(AWSS3EventUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3EventS3ReducedRedundancyLostObject:
                return @"s3:ReducedRedundancyLostObject";
            case AWSS3EventS3ObjectCreatedPut:
                return @"s3:ObjectCreated:Put";
            case AWSS3EventS3ObjectCreatedPost:
                return @"s3:ObjectCreated:Post";
            case AWSS3EventS3ObjectCreatedCopy:
                return @"s3:ObjectCreated:Copy";
            case AWSS3EventS3ObjectCreatedCompleteMultipartUpload:
                return @"s3:ObjectCreated:CompleteMultipartUpload";
            case AWSS3EventUnknown:
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
             @"SSEKMSKeyId" : @"SSEKMSKeyId",
             @"serverSideEncryption" : @"ServerSideEncryption",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)serverSideEncryptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"AES256"]) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value isEqualToString:@"aws:kms"]) {
            return @(AWSS3ServerSideEncryptionKMS);
        }
        return @(AWSS3ServerSideEncryptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ServerSideEncryptionAES256:
                return @"AES256";
            case AWSS3ServerSideEncryptionKMS:
                return @"aws:kms";
            case AWSS3ServerSideEncryptionUnknown:
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
             @"uploadId" : @"UploadId",
             };
}

+ (NSValueTransformer *)multipartUploadJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3CompletedMultipartUpload class]];
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

@implementation AWSS3CreateBucketConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"locationConstraint" : @"LocationConstraint",
             };
}

+ (NSValueTransformer *)locationConstraintJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"EU"]) {
            return @(AWSS3BucketLocationConstraintEU);
        }
        if ([value isEqualToString:@"eu-west-1"]) {
            return @(AWSS3BucketLocationConstraintEUWest1);
        }
        if ([value isEqualToString:@"us-west-1"]) {
            return @(AWSS3BucketLocationConstraintUSWest1);
        }
        if ([value isEqualToString:@"us-west-2"]) {
            return @(AWSS3BucketLocationConstraintUSWest2);
        }
        if ([value isEqualToString:@"ap-southeast-1"]) {
            return @(AWSS3BucketLocationConstraintAPSoutheast1);
        }
        if ([value isEqualToString:@"ap-southeast-2"]) {
            return @(AWSS3BucketLocationConstraintAPSoutheast2);
        }
        if ([value isEqualToString:@"ap-northeast-1"]) {
            return @(AWSS3BucketLocationConstraintAPNortheast1);
        }
        if ([value isEqualToString:@"sa-east-1"]) {
            return @(AWSS3BucketLocationConstraintSAEast1);
        }
        if ([value isEqualToString:@""]) {
            return @(AWSS3BucketLocationConstraintBlank);
        }
        if ([value isEqualToString:@"cn-north-1"]) {
            return @(AWSS3BucketLocationConstraintCNNorth1);
        }
        if ([value isEqualToString:@"eu-central-1"]) {
            return @(AWSS3BucketLocationConstraintEUCentral1);
        }
        if ([value isEqualToString:@"us-gov-west-1"]) {
            return @(AWSS3BucketLocationConstraintUSGovWest1);
        }
        return @(AWSS3BucketLocationConstraintUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3BucketLocationConstraintEU:
                return @"EU";
            case AWSS3BucketLocationConstraintEUWest1:
                return @"eu-west-1";
            case AWSS3BucketLocationConstraintUSWest1:
                return @"us-west-1";
            case AWSS3BucketLocationConstraintUSWest2:
                return @"us-west-2";
            case AWSS3BucketLocationConstraintAPSoutheast1:
                return @"ap-southeast-1";
            case AWSS3BucketLocationConstraintAPSoutheast2:
                return @"ap-southeast-2";
            case AWSS3BucketLocationConstraintAPNortheast1:
                return @"ap-northeast-1";
            case AWSS3BucketLocationConstraintSAEast1:
                return @"sa-east-1";
            case AWSS3BucketLocationConstraintBlank:
                return @"";
            case AWSS3BucketLocationConstraintCNNorth1:
                return @"cn-north-1";
            case AWSS3BucketLocationConstraintEUCentral1:
                return @"eu-central-1";
            case AWSS3BucketLocationConstraintUSGovWest1:
                return @"us-gov-west-1";
            case AWSS3BucketLocationConstraintUnknown:
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
        if ([value isEqualToString:@"private"]) {
            return @(AWSS3BucketCannedACLPrivate);
        }
        if ([value isEqualToString:@"public-read"]) {
            return @(AWSS3BucketCannedACLPublicRead);
        }
        if ([value isEqualToString:@"public-read-write"]) {
            return @(AWSS3BucketCannedACLPublicReadWrite);
        }
        if ([value isEqualToString:@"authenticated-read"]) {
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
            case AWSS3BucketCannedACLUnknown:
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
             @"bucket" : @"Bucket",
             @"key" : @"Key",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"SSEKMSKeyId" : @"SSEKMSKeyId",
             @"serverSideEncryption" : @"ServerSideEncryption",
             @"uploadId" : @"UploadId",
             };
}

+ (NSValueTransformer *)serverSideEncryptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"AES256"]) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value isEqualToString:@"aws:kms"]) {
            return @(AWSS3ServerSideEncryptionKMS);
        }
        return @(AWSS3ServerSideEncryptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ServerSideEncryptionAES256:
                return @"AES256";
            case AWSS3ServerSideEncryptionKMS:
                return @"aws:kms";
            case AWSS3ServerSideEncryptionUnknown:
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
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKey" : @"SSECustomerKey",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"SSEKMSKeyId" : @"SSEKMSKeyId",
             @"serverSideEncryption" : @"ServerSideEncryption",
             @"storageClass" : @"StorageClass",
             @"websiteRedirectLocation" : @"WebsiteRedirectLocation",
             };
}

+ (NSValueTransformer *)ACLJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"private"]) {
            return @(AWSS3ObjectCannedACLPrivate);
        }
        if ([value isEqualToString:@"public-read"]) {
            return @(AWSS3ObjectCannedACLPublicRead);
        }
        if ([value isEqualToString:@"public-read-write"]) {
            return @(AWSS3ObjectCannedACLPublicReadWrite);
        }
        if ([value isEqualToString:@"authenticated-read"]) {
            return @(AWSS3ObjectCannedACLAuthenticatedRead);
        }
        if ([value isEqualToString:@"bucket-owner-read"]) {
            return @(AWSS3ObjectCannedACLBucketOwnerRead);
        }
        if ([value isEqualToString:@"bucket-owner-full-control"]) {
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
            case AWSS3ObjectCannedACLBucketOwnerRead:
                return @"bucket-owner-read";
            case AWSS3ObjectCannedACLBucketOwnerFullControl:
                return @"bucket-owner-full-control";
            case AWSS3ObjectCannedACLUnknown:
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

+ (NSValueTransformer *)serverSideEncryptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"AES256"]) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value isEqualToString:@"aws:kms"]) {
            return @(AWSS3ServerSideEncryptionKMS);
        }
        return @(AWSS3ServerSideEncryptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ServerSideEncryptionAES256:
                return @"AES256";
            case AWSS3ServerSideEncryptionKMS:
                return @"aws:kms";
            case AWSS3ServerSideEncryptionUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)storageClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"STANDARD"]) {
            return @(AWSS3StorageClassStandard);
        }
        if ([value isEqualToString:@"REDUCED_REDUNDANCY"]) {
            return @(AWSS3StorageClassReducedRedundancy);
        }
        return @(AWSS3StorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3StorageClassStandard:
                return @"STANDARD";
            case AWSS3StorageClassReducedRedundancy:
                return @"REDUCED_REDUNDANCY";
            case AWSS3StorageClassUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3DeleteBucketCorsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
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

@implementation AWSS3DeleteBucketPolicyRequest

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

@implementation AWSS3DeleteObjectOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleteMarker" : @"DeleteMarker",
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSS3DeleteObjectRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"key" : @"Key",
             @"MFA" : @"MFA",
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSS3DeleteObjectsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleted" : @"Deleted",
             @"errors" : @"Errors",
             };
}

+ (NSValueTransformer *)deletedJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3DeletedObject class]];
}

+ (NSValueTransformer *)errorsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3Error class]];
}

@end

@implementation AWSS3DeleteObjectsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"MFA" : @"MFA",
             @"remove" : @"Delete",
             };
}

+ (NSValueTransformer *)removeJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Remove class]];
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
        if ([value isEqualToString:@"EU"]) {
            return @(AWSS3BucketLocationConstraintEU);
        }
        if ([value isEqualToString:@"eu-west-1"]) {
            return @(AWSS3BucketLocationConstraintEUWest1);
        }
        if ([value isEqualToString:@"us-west-1"]) {
            return @(AWSS3BucketLocationConstraintUSWest1);
        }
        if ([value isEqualToString:@"us-west-2"]) {
            return @(AWSS3BucketLocationConstraintUSWest2);
        }
        if ([value isEqualToString:@"ap-southeast-1"]) {
            return @(AWSS3BucketLocationConstraintAPSoutheast1);
        }
        if ([value isEqualToString:@"ap-southeast-2"]) {
            return @(AWSS3BucketLocationConstraintAPSoutheast2);
        }
        if ([value isEqualToString:@"ap-northeast-1"]) {
            return @(AWSS3BucketLocationConstraintAPNortheast1);
        }
        if ([value isEqualToString:@"sa-east-1"]) {
            return @(AWSS3BucketLocationConstraintSAEast1);
        }
        if ([value isEqualToString:@""]) {
            return @(AWSS3BucketLocationConstraintBlank);
        }
        if ([value isEqualToString:@"cn-north-1"]) {
            return @(AWSS3BucketLocationConstraintCNNorth1);
        }
        if ([value isEqualToString:@"eu-central-1"]) {
            return @(AWSS3BucketLocationConstraintEUCentral1);
        }
        if ([value isEqualToString:@"us-gov-west-1"]) {
            return @(AWSS3BucketLocationConstraintUSGovWest1);
        }
        return @(AWSS3BucketLocationConstraintUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3BucketLocationConstraintEU:
                return @"EU";
            case AWSS3BucketLocationConstraintEUWest1:
                return @"eu-west-1";
            case AWSS3BucketLocationConstraintUSWest1:
                return @"us-west-1";
            case AWSS3BucketLocationConstraintUSWest2:
                return @"us-west-2";
            case AWSS3BucketLocationConstraintAPSoutheast1:
                return @"ap-southeast-1";
            case AWSS3BucketLocationConstraintAPSoutheast2:
                return @"ap-southeast-2";
            case AWSS3BucketLocationConstraintAPNortheast1:
                return @"ap-northeast-1";
            case AWSS3BucketLocationConstraintSAEast1:
                return @"sa-east-1";
            case AWSS3BucketLocationConstraintBlank:
                return @"";
            case AWSS3BucketLocationConstraintCNNorth1:
                return @"cn-north-1";
            case AWSS3BucketLocationConstraintEUCentral1:
                return @"eu-central-1";
            case AWSS3BucketLocationConstraintUSGovWest1:
                return @"us-gov-west-1";
            case AWSS3BucketLocationConstraintUnknown:
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

@implementation AWSS3GetBucketNotificationOutput

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
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3QueueConfiguration class]];
}

+ (NSValueTransformer *)topicConfigurationJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3TopicConfiguration class]];
}

@end

@implementation AWSS3GetBucketNotificationRequest

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

@end

@implementation AWSS3GetBucketPolicyRequest

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
        if ([value isEqualToString:@"Requester"]) {
            return @(AWSS3PayerRequester);
        }
        if ([value isEqualToString:@"BucketOwner"]) {
            return @(AWSS3PayerBucketOwner);
        }
        return @(AWSS3PayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3PayerRequester:
                return @"Requester";
            case AWSS3PayerBucketOwner:
                return @"BucketOwner";
            case AWSS3PayerUnknown:
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
        if ([value isEqualToString:@"Enabled"]) {
            return @(AWSS3MFADeleteStatusEnabled);
        }
        if ([value isEqualToString:@"Disabled"]) {
            return @(AWSS3MFADeleteStatusDisabled);
        }
        return @(AWSS3MFADeleteStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3MFADeleteStatusEnabled:
                return @"Enabled";
            case AWSS3MFADeleteStatusDisabled:
                return @"Disabled";
            case AWSS3MFADeleteStatusUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Enabled"]) {
            return @(AWSS3BucketVersioningStatusEnabled);
        }
        if ([value isEqualToString:@"Suspended"]) {
            return @(AWSS3BucketVersioningStatusSuspended);
        }
        return @(AWSS3BucketVersioningStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3BucketVersioningStatusEnabled:
                return @"Enabled";
            case AWSS3BucketVersioningStatusSuspended:
                return @"Suspended";
            case AWSS3BucketVersioningStatusUnknown:
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
             };
}

+ (NSValueTransformer *)grantsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3Grant class]];
}

+ (NSValueTransformer *)ownerJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Owner class]];
}

@end

@implementation AWSS3GetObjectAclRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"key" : @"Key",
             @"versionId" : @"VersionId",
             };
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
             @"contentType" : @"ContentType",
             @"deleteMarker" : @"DeleteMarker",
             @"ETag" : @"ETag",
             @"expiration" : @"Expiration",
             @"expires" : @"Expires",
             @"lastModified" : @"LastModified",
             @"metadata" : @"Metadata",
             @"missingMeta" : @"MissingMeta",
             @"restore" : @"Restore",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"SSEKMSKeyId" : @"SSEKMSKeyId",
             @"serverSideEncryption" : @"ServerSideEncryption",
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

+ (NSValueTransformer *)serverSideEncryptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"AES256"]) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value isEqualToString:@"aws:kms"]) {
            return @(AWSS3ServerSideEncryptionKMS);
        }
        return @(AWSS3ServerSideEncryptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ServerSideEncryptionAES256:
                return @"AES256";
            case AWSS3ServerSideEncryptionKMS:
                return @"aws:kms";
            case AWSS3ServerSideEncryptionUnknown:
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
             @"range" : @"Range",
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

+ (NSValueTransformer *)responseExpiresJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSS3GetObjectTorrentOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             };
}

@end

@implementation AWSS3GetObjectTorrentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"key" : @"Key",
             };
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
        if ([value isEqualToString:@"FULL_CONTROL"]) {
            return @(AWSS3PermissionFullControl);
        }
        if ([value isEqualToString:@"WRITE"]) {
            return @(AWSS3PermissionWrite);
        }
        if ([value isEqualToString:@"WRITE_ACP"]) {
            return @(AWSS3PermissionWriteAcp);
        }
        if ([value isEqualToString:@"READ"]) {
            return @(AWSS3PermissionRead);
        }
        if ([value isEqualToString:@"READ_ACP"]) {
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
            case AWSS3PermissionUnknown:
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
        if ([value isEqualToString:@"CanonicalUser"]) {
            return @(AWSS3TypesCanonicalUser);
        }
        if ([value isEqualToString:@"AmazonCustomerByEmail"]) {
            return @(AWSS3TypesAmazonCustomerByEmail);
        }
        if ([value isEqualToString:@"Group"]) {
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
            case AWSS3TypesUnknown:
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
             @"restore" : @"Restore",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"SSEKMSKeyId" : @"SSEKMSKeyId",
             @"serverSideEncryption" : @"ServerSideEncryption",
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

+ (NSValueTransformer *)serverSideEncryptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"AES256"]) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value isEqualToString:@"aws:kms"]) {
            return @(AWSS3ServerSideEncryptionKMS);
        }
        return @(AWSS3ServerSideEncryptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ServerSideEncryptionAES256:
                return @"AES256";
            case AWSS3ServerSideEncryptionKMS:
                return @"aws:kms";
            case AWSS3ServerSideEncryptionUnknown:
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
             @"range" : @"Range",
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
        if ([value isEqualToString:@"url"]) {
            return @(AWSS3EncodingTypeURL);
        }
        return @(AWSS3EncodingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3EncodingTypeURL:
                return @"url";
            case AWSS3EncodingTypeUnknown:
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
        if ([value isEqualToString:@"url"]) {
            return @(AWSS3EncodingTypeURL);
        }
        return @(AWSS3EncodingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3EncodingTypeURL:
                return @"url";
            case AWSS3EncodingTypeUnknown:
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
        if ([value isEqualToString:@"url"]) {
            return @(AWSS3EncodingTypeURL);
        }
        return @(AWSS3EncodingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3EncodingTypeURL:
                return @"url";
            case AWSS3EncodingTypeUnknown:
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
        if ([value isEqualToString:@"url"]) {
            return @(AWSS3EncodingTypeURL);
        }
        return @(AWSS3EncodingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3EncodingTypeURL:
                return @"url";
            case AWSS3EncodingTypeUnknown:
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
        if ([value isEqualToString:@"url"]) {
            return @(AWSS3EncodingTypeURL);
        }
        return @(AWSS3EncodingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3EncodingTypeURL:
                return @"url";
            case AWSS3EncodingTypeUnknown:
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
             };
}

+ (NSValueTransformer *)encodingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"url"]) {
            return @(AWSS3EncodingTypeURL);
        }
        return @(AWSS3EncodingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3EncodingTypeURL:
                return @"url";
            case AWSS3EncodingTypeUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3ListPartsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"initiator" : @"Initiator",
             @"isTruncated" : @"IsTruncated",
             @"key" : @"Key",
             @"maxParts" : @"MaxParts",
             @"nextPartNumberMarker" : @"NextPartNumberMarker",
             @"owner" : @"Owner",
             @"partNumberMarker" : @"PartNumberMarker",
             @"parts" : @"Parts",
             @"storageClass" : @"StorageClass",
             @"uploadId" : @"UploadId",
             };
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

+ (NSValueTransformer *)storageClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"STANDARD"]) {
            return @(AWSS3StorageClassStandard);
        }
        if ([value isEqualToString:@"REDUCED_REDUNDANCY"]) {
            return @(AWSS3StorageClassReducedRedundancy);
        }
        return @(AWSS3StorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3StorageClassStandard:
                return @"STANDARD";
            case AWSS3StorageClassReducedRedundancy:
                return @"REDUCED_REDUNDANCY";
            case AWSS3StorageClassUnknown:
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
             @"uploadId" : @"UploadId",
             };
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
        if ([value isEqualToString:@"STANDARD"]) {
            return @(AWSS3StorageClassStandard);
        }
        if ([value isEqualToString:@"REDUCED_REDUNDANCY"]) {
            return @(AWSS3StorageClassReducedRedundancy);
        }
        return @(AWSS3StorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3StorageClassStandard:
                return @"STANDARD";
            case AWSS3StorageClassReducedRedundancy:
                return @"REDUCED_REDUNDANCY";
            case AWSS3StorageClassUnknown:
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
        if ([value isEqualToString:@"GLACIER"]) {
            return @(AWSS3TransitionStorageClassGlacier);
        }
        return @(AWSS3TransitionStorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3TransitionStorageClassGlacier:
                return @"GLACIER";
            case AWSS3TransitionStorageClassUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3NotificationConfiguration

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
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3QueueConfiguration class]];
}

+ (NSValueTransformer *)topicConfigurationJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3TopicConfiguration class]];
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
        if ([value isEqualToString:@"STANDARD"]) {
            return @(AWSS3ObjectStorageClassStandard);
        }
        if ([value isEqualToString:@"REDUCED_REDUNDANCY"]) {
            return @(AWSS3ObjectStorageClassReducedRedundancy);
        }
        if ([value isEqualToString:@"GLACIER"]) {
            return @(AWSS3ObjectStorageClassGlacier);
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
            case AWSS3ObjectStorageClassUnknown:
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
        if ([value isEqualToString:@"STANDARD"]) {
            return @(AWSS3ObjectVersionStorageClassStandard);
        }
        return @(AWSS3ObjectVersionStorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ObjectVersionStorageClassStandard:
                return @"STANDARD";
            case AWSS3ObjectVersionStorageClassUnknown:
            default:
                return nil;
        }
    }];
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
        if ([value isEqualToString:@"private"]) {
            return @(AWSS3BucketCannedACLPrivate);
        }
        if ([value isEqualToString:@"public-read"]) {
            return @(AWSS3BucketCannedACLPublicRead);
        }
        if ([value isEqualToString:@"public-read-write"]) {
            return @(AWSS3BucketCannedACLPublicReadWrite);
        }
        if ([value isEqualToString:@"authenticated-read"]) {
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
            case AWSS3BucketCannedACLUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)accessControlPolicyJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3AccessControlPolicy class]];
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

@implementation AWSS3PutBucketNotificationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"notificationConfiguration" : @"NotificationConfiguration",
             };
}

+ (NSValueTransformer *)notificationConfigurationJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3NotificationConfiguration class]];
}

@end

@implementation AWSS3PutBucketPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"contentMD5" : @"ContentMD5",
             @"policy" : @"Policy",
             };
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
             };
}

+ (NSValueTransformer *)ACLJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"private"]) {
            return @(AWSS3ObjectCannedACLPrivate);
        }
        if ([value isEqualToString:@"public-read"]) {
            return @(AWSS3ObjectCannedACLPublicRead);
        }
        if ([value isEqualToString:@"public-read-write"]) {
            return @(AWSS3ObjectCannedACLPublicReadWrite);
        }
        if ([value isEqualToString:@"authenticated-read"]) {
            return @(AWSS3ObjectCannedACLAuthenticatedRead);
        }
        if ([value isEqualToString:@"bucket-owner-read"]) {
            return @(AWSS3ObjectCannedACLBucketOwnerRead);
        }
        if ([value isEqualToString:@"bucket-owner-full-control"]) {
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
            case AWSS3ObjectCannedACLBucketOwnerRead:
                return @"bucket-owner-read";
            case AWSS3ObjectCannedACLBucketOwnerFullControl:
                return @"bucket-owner-full-control";
            case AWSS3ObjectCannedACLUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)accessControlPolicyJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3AccessControlPolicy class]];
}

@end

@implementation AWSS3PutObjectOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"expiration" : @"Expiration",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"SSEKMSKeyId" : @"SSEKMSKeyId",
             @"serverSideEncryption" : @"ServerSideEncryption",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)serverSideEncryptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"AES256"]) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value isEqualToString:@"aws:kms"]) {
            return @(AWSS3ServerSideEncryptionKMS);
        }
        return @(AWSS3ServerSideEncryptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ServerSideEncryptionAES256:
                return @"AES256";
            case AWSS3ServerSideEncryptionKMS:
                return @"aws:kms";
            case AWSS3ServerSideEncryptionUnknown:
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
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKey" : @"SSECustomerKey",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"SSEKMSKeyId" : @"SSEKMSKeyId",
             @"serverSideEncryption" : @"ServerSideEncryption",
             @"storageClass" : @"StorageClass",
             @"websiteRedirectLocation" : @"WebsiteRedirectLocation",
             };
}

+ (NSValueTransformer *)ACLJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"private"]) {
            return @(AWSS3ObjectCannedACLPrivate);
        }
        if ([value isEqualToString:@"public-read"]) {
            return @(AWSS3ObjectCannedACLPublicRead);
        }
        if ([value isEqualToString:@"public-read-write"]) {
            return @(AWSS3ObjectCannedACLPublicReadWrite);
        }
        if ([value isEqualToString:@"authenticated-read"]) {
            return @(AWSS3ObjectCannedACLAuthenticatedRead);
        }
        if ([value isEqualToString:@"bucket-owner-read"]) {
            return @(AWSS3ObjectCannedACLBucketOwnerRead);
        }
        if ([value isEqualToString:@"bucket-owner-full-control"]) {
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
            case AWSS3ObjectCannedACLBucketOwnerRead:
                return @"bucket-owner-read";
            case AWSS3ObjectCannedACLBucketOwnerFullControl:
                return @"bucket-owner-full-control";
            case AWSS3ObjectCannedACLUnknown:
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

+ (NSValueTransformer *)serverSideEncryptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"AES256"]) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value isEqualToString:@"aws:kms"]) {
            return @(AWSS3ServerSideEncryptionKMS);
        }
        return @(AWSS3ServerSideEncryptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ServerSideEncryptionAES256:
                return @"AES256";
            case AWSS3ServerSideEncryptionKMS:
                return @"aws:kms";
            case AWSS3ServerSideEncryptionUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)storageClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"STANDARD"]) {
            return @(AWSS3StorageClassStandard);
        }
        if ([value isEqualToString:@"REDUCED_REDUNDANCY"]) {
            return @(AWSS3StorageClassReducedRedundancy);
        }
        return @(AWSS3StorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3StorageClassStandard:
                return @"STANDARD";
            case AWSS3StorageClassReducedRedundancy:
                return @"REDUCED_REDUNDANCY";
            case AWSS3StorageClassUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3QueueConfiguration

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
        if ([value isEqualToString:@"s3:ReducedRedundancyLostObject"]) {
            return @(AWSS3EventS3ReducedRedundancyLostObject);
        }
        if ([value isEqualToString:@"s3:ObjectCreated:Put"]) {
            return @(AWSS3EventS3ObjectCreatedPut);
        }
        if ([value isEqualToString:@"s3:ObjectCreated:Post"]) {
            return @(AWSS3EventS3ObjectCreatedPost);
        }
        if ([value isEqualToString:@"s3:ObjectCreated:Copy"]) {
            return @(AWSS3EventS3ObjectCreatedCopy);
        }
        if ([value isEqualToString:@"s3:ObjectCreated:CompleteMultipartUpload"]) {
            return @(AWSS3EventS3ObjectCreatedCompleteMultipartUpload);
        }
        return @(AWSS3EventUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3EventS3ReducedRedundancyLostObject:
                return @"s3:ReducedRedundancyLostObject";
            case AWSS3EventS3ObjectCreatedPut:
                return @"s3:ObjectCreated:Put";
            case AWSS3EventS3ObjectCreatedPost:
                return @"s3:ObjectCreated:Post";
            case AWSS3EventS3ObjectCreatedCopy:
                return @"s3:ObjectCreated:Copy";
            case AWSS3EventS3ObjectCreatedCompleteMultipartUpload:
                return @"s3:ObjectCreated:CompleteMultipartUpload";
            case AWSS3EventUnknown:
            default:
                return nil;
        }
    }];
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
        if ([value isEqualToString:@"http"]) {
            return @(AWSS3ProtocolsHTTP);
        }
        if ([value isEqualToString:@"https"]) {
            return @(AWSS3ProtocolsHTTPS);
        }
        return @(AWSS3ProtocolsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ProtocolsHTTP:
                return @"http";
            case AWSS3ProtocolsHTTPS:
                return @"https";
            case AWSS3ProtocolsUnknown:
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
        if ([value isEqualToString:@"http"]) {
            return @(AWSS3ProtocolsHTTP);
        }
        if ([value isEqualToString:@"https"]) {
            return @(AWSS3ProtocolsHTTPS);
        }
        return @(AWSS3ProtocolsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ProtocolsHTTP:
                return @"http";
            case AWSS3ProtocolsHTTPS:
                return @"https";
            case AWSS3ProtocolsUnknown:
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

@implementation AWSS3ReplicateObjectOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expiration" : @"Expiration",
             @"replicateObjectResult" : @"CopyObjectResult",
             @"replicateSourceVersionId" : @"CopySourceVersionId",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"SSEKMSKeyId" : @"SSEKMSKeyId",
             @"serverSideEncryption" : @"ServerSideEncryption",
             };
}

+ (NSValueTransformer *)replicateObjectResultJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ReplicateObjectResult class]];
}

+ (NSValueTransformer *)serverSideEncryptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"AES256"]) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value isEqualToString:@"aws:kms"]) {
            return @(AWSS3ServerSideEncryptionKMS);
        }
        return @(AWSS3ServerSideEncryptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ServerSideEncryptionAES256:
                return @"AES256";
            case AWSS3ServerSideEncryptionKMS:
                return @"aws:kms";
            case AWSS3ServerSideEncryptionUnknown:
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
             @"expires" : @"Expires",
             @"grantFullControl" : @"GrantFullControl",
             @"grantRead" : @"GrantRead",
             @"grantReadACP" : @"GrantReadACP",
             @"grantWriteACP" : @"GrantWriteACP",
             @"key" : @"Key",
             @"metadata" : @"Metadata",
             @"metadataDirective" : @"MetadataDirective",
             @"replicateSource" : @"CopySource",
             @"replicateSourceIfMatch" : @"CopySourceIfMatch",
             @"replicateSourceIfModifiedSince" : @"CopySourceIfModifiedSince",
             @"replicateSourceIfNoneMatch" : @"CopySourceIfNoneMatch",
             @"replicateSourceIfUnmodifiedSince" : @"CopySourceIfUnmodifiedSince",
             @"replicateSourceSSECustomerAlgorithm" : @"CopySourceSSECustomerAlgorithm",
             @"replicateSourceSSECustomerKey" : @"CopySourceSSECustomerKey",
             @"replicateSourceSSECustomerKeyMD5" : @"CopySourceSSECustomerKeyMD5",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKey" : @"SSECustomerKey",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"SSEKMSKeyId" : @"SSEKMSKeyId",
             @"serverSideEncryption" : @"ServerSideEncryption",
             @"storageClass" : @"StorageClass",
             @"websiteRedirectLocation" : @"WebsiteRedirectLocation",
             };
}

+ (NSValueTransformer *)ACLJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"private"]) {
            return @(AWSS3ObjectCannedACLPrivate);
        }
        if ([value isEqualToString:@"public-read"]) {
            return @(AWSS3ObjectCannedACLPublicRead);
        }
        if ([value isEqualToString:@"public-read-write"]) {
            return @(AWSS3ObjectCannedACLPublicReadWrite);
        }
        if ([value isEqualToString:@"authenticated-read"]) {
            return @(AWSS3ObjectCannedACLAuthenticatedRead);
        }
        if ([value isEqualToString:@"bucket-owner-read"]) {
            return @(AWSS3ObjectCannedACLBucketOwnerRead);
        }
        if ([value isEqualToString:@"bucket-owner-full-control"]) {
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
            case AWSS3ObjectCannedACLBucketOwnerRead:
                return @"bucket-owner-read";
            case AWSS3ObjectCannedACLBucketOwnerFullControl:
                return @"bucket-owner-full-control";
            case AWSS3ObjectCannedACLUnknown:
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

+ (NSValueTransformer *)metadataDirectiveJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"COPY"]) {
            return @(AWSS3MetadataDirectiveCopy);
        }
        if ([value isEqualToString:@"REPLACE"]) {
            return @(AWSS3MetadataDirectiveReplace);
        }
        return @(AWSS3MetadataDirectiveUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3MetadataDirectiveCopy:
                return @"COPY";
            case AWSS3MetadataDirectiveReplace:
                return @"REPLACE";
            case AWSS3MetadataDirectiveUnknown:
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

+ (NSValueTransformer *)serverSideEncryptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"AES256"]) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value isEqualToString:@"aws:kms"]) {
            return @(AWSS3ServerSideEncryptionKMS);
        }
        return @(AWSS3ServerSideEncryptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ServerSideEncryptionAES256:
                return @"AES256";
            case AWSS3ServerSideEncryptionKMS:
                return @"aws:kms";
            case AWSS3ServerSideEncryptionUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)storageClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"STANDARD"]) {
            return @(AWSS3StorageClassStandard);
        }
        if ([value isEqualToString:@"REDUCED_REDUNDANCY"]) {
            return @(AWSS3StorageClassReducedRedundancy);
        }
        return @(AWSS3StorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3StorageClassStandard:
                return @"STANDARD";
            case AWSS3StorageClassReducedRedundancy:
                return @"REDUCED_REDUNDANCY";
            case AWSS3StorageClassUnknown:
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

@implementation AWSS3RequestPaymentConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"payer" : @"Payer",
             };
}

+ (NSValueTransformer *)payerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Requester"]) {
            return @(AWSS3PayerRequester);
        }
        if ([value isEqualToString:@"BucketOwner"]) {
            return @(AWSS3PayerBucketOwner);
        }
        return @(AWSS3PayerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3PayerRequester:
                return @"Requester";
            case AWSS3PayerBucketOwner:
                return @"BucketOwner";
            case AWSS3PayerUnknown:
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
             @"restoreRequest" : @"RestoreRequest",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)restoreRequestJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3RestoreRequest class]];
}

@end

@implementation AWSS3RestoreRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"days" : @"Days",
             };
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
             @"expiration" : @"Expiration",
             @"identifier" : @"ID",
             @"noncurrentVersionExpiration" : @"NoncurrentVersionExpiration",
             @"noncurrentVersionTransition" : @"NoncurrentVersionTransition",
             @"prefix" : @"Prefix",
             @"status" : @"Status",
             @"transition" : @"Transition",
             };
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
        if ([value isEqualToString:@"Enabled"]) {
            return @(AWSS3ExpirationStatusEnabled);
        }
        if ([value isEqualToString:@"Disabled"]) {
            return @(AWSS3ExpirationStatusDisabled);
        }
        return @(AWSS3ExpirationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ExpirationStatusEnabled:
                return @"Enabled";
            case AWSS3ExpirationStatusDisabled:
                return @"Disabled";
            case AWSS3ExpirationStatusUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)transitionJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Transition class]];
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
        if ([value isEqualToString:@"FULL_CONTROL"]) {
            return @(AWSS3BucketLogsPermissionFullControl);
        }
        if ([value isEqualToString:@"READ"]) {
            return @(AWSS3BucketLogsPermissionRead);
        }
        if ([value isEqualToString:@"WRITE"]) {
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
            case AWSS3BucketLogsPermissionUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3TopicConfiguration

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
        if ([value isEqualToString:@"s3:ReducedRedundancyLostObject"]) {
            return @(AWSS3EventS3ReducedRedundancyLostObject);
        }
        if ([value isEqualToString:@"s3:ObjectCreated:Put"]) {
            return @(AWSS3EventS3ObjectCreatedPut);
        }
        if ([value isEqualToString:@"s3:ObjectCreated:Post"]) {
            return @(AWSS3EventS3ObjectCreatedPost);
        }
        if ([value isEqualToString:@"s3:ObjectCreated:Copy"]) {
            return @(AWSS3EventS3ObjectCreatedCopy);
        }
        if ([value isEqualToString:@"s3:ObjectCreated:CompleteMultipartUpload"]) {
            return @(AWSS3EventS3ObjectCreatedCompleteMultipartUpload);
        }
        return @(AWSS3EventUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3EventS3ReducedRedundancyLostObject:
                return @"s3:ReducedRedundancyLostObject";
            case AWSS3EventS3ObjectCreatedPut:
                return @"s3:ObjectCreated:Put";
            case AWSS3EventS3ObjectCreatedPost:
                return @"s3:ObjectCreated:Post";
            case AWSS3EventS3ObjectCreatedCopy:
                return @"s3:ObjectCreated:Copy";
            case AWSS3EventS3ObjectCreatedCompleteMultipartUpload:
                return @"s3:ObjectCreated:CompleteMultipartUpload";
            case AWSS3EventUnknown:
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
        if ([value isEqualToString:@"GLACIER"]) {
            return @(AWSS3TransitionStorageClassGlacier);
        }
        return @(AWSS3TransitionStorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3TransitionStorageClassGlacier:
                return @"GLACIER";
            case AWSS3TransitionStorageClassUnknown:
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
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"SSEKMSKeyId" : @"SSEKMSKeyId",
             @"serverSideEncryption" : @"ServerSideEncryption",
             };
}

+ (NSValueTransformer *)replicatePartResultJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3ReplicatePartResult class]];
}

+ (NSValueTransformer *)serverSideEncryptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"AES256"]) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value isEqualToString:@"aws:kms"]) {
            return @(AWSS3ServerSideEncryptionKMS);
        }
        return @(AWSS3ServerSideEncryptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ServerSideEncryptionAES256:
                return @"AES256";
            case AWSS3ServerSideEncryptionKMS:
                return @"aws:kms";
            case AWSS3ServerSideEncryptionUnknown:
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
             @"key" : @"Key",
             @"partNumber" : @"PartNumber",
             @"replicateSource" : @"CopySource",
             @"replicateSourceIfMatch" : @"CopySourceIfMatch",
             @"replicateSourceIfModifiedSince" : @"CopySourceIfModifiedSince",
             @"replicateSourceIfNoneMatch" : @"CopySourceIfNoneMatch",
             @"replicateSourceIfUnmodifiedSince" : @"CopySourceIfUnmodifiedSince",
             @"replicateSourceRange" : @"CopySourceRange",
             @"replicateSourceSSECustomerAlgorithm" : @"CopySourceSSECustomerAlgorithm",
             @"replicateSourceSSECustomerKey" : @"CopySourceSSECustomerKey",
             @"replicateSourceSSECustomerKeyMD5" : @"CopySourceSSECustomerKeyMD5",
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

@end

@implementation AWSS3UploadPartOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"SSEKMSKeyId" : @"SSEKMSKeyId",
             @"serverSideEncryption" : @"ServerSideEncryption",
             };
}

+ (NSValueTransformer *)serverSideEncryptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"AES256"]) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value isEqualToString:@"aws:kms"]) {
            return @(AWSS3ServerSideEncryptionKMS);
        }
        return @(AWSS3ServerSideEncryptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3ServerSideEncryptionAES256:
                return @"AES256";
            case AWSS3ServerSideEncryptionKMS:
                return @"aws:kms";
            case AWSS3ServerSideEncryptionUnknown:
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
             @"SSECustomerAlgorithm" : @"SSECustomerAlgorithm",
             @"SSECustomerKey" : @"SSECustomerKey",
             @"SSECustomerKeyMD5" : @"SSECustomerKeyMD5",
             @"uploadId" : @"UploadId",
             };
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
        if ([value isEqualToString:@"Enabled"]) {
            return @(AWSS3MFADeleteEnabled);
        }
        if ([value isEqualToString:@"Disabled"]) {
            return @(AWSS3MFADeleteDisabled);
        }
        return @(AWSS3MFADeleteUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3MFADeleteEnabled:
                return @"Enabled";
            case AWSS3MFADeleteDisabled:
                return @"Disabled";
            case AWSS3MFADeleteUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Enabled"]) {
            return @(AWSS3BucketVersioningStatusEnabled);
        }
        if ([value isEqualToString:@"Suspended"]) {
            return @(AWSS3BucketVersioningStatusSuspended);
        }
        return @(AWSS3BucketVersioningStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3BucketVersioningStatusEnabled:
                return @"Enabled";
            case AWSS3BucketVersioningStatusSuspended:
                return @"Suspended";
            case AWSS3BucketVersioningStatusUnknown:
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
