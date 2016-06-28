//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"Enabled"]) {
            return @(AWSS3BucketAccelerateStatusEnabled);
        }
        if ([value isEqualToString:@"Suspended"]) {
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
        if ([value isEqualToString:@"s3:ObjectCreated:*"]) {
            return @(AWSS3EventS3ObjectCreated);
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
        if ([value isEqualToString:@"s3:ObjectRemoved:*"]) {
            return @(AWSS3EventS3ObjectRemoved);
        }
        if ([value isEqualToString:@"s3:ObjectRemoved:Delete"]) {
            return @(AWSS3EventS3ObjectRemovedDelete);
        }
        if ([value isEqualToString:@"s3:ObjectRemoved:DeleteMarkerCreated"]) {
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
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"AES256"]) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value isEqualToString:@"aws:kms"]) {
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
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"ap-south-1"]) {
            return @(AWSS3BucketLocationConstraintAPSouth1);
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
        if ([value isEqualToString:@"ap-northeast-2"]) {
            return @(AWSS3BucketLocationConstraintAPNortheast2);
        }
        if ([value isEqualToString:@"sa-east-1"]) {
            return @(AWSS3BucketLocationConstraintSAEast1);
        }
        if ([value isEqualToString:@"eu-central-1"]) {
            return @(AWSS3BucketLocationConstraintEUCentral1);
        }
        if ([value isEqualToString:@""]) {
            return @(AWSS3BucketLocationConstraintBlank);
        }
        if ([value isEqualToString:@"cn-north-1"]) {
            return @(AWSS3BucketLocationConstraintCNNorth1);
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
            case AWSS3BucketLocationConstraintEUCentral1:
                return @"eu-central-1";
            case AWSS3BucketLocationConstraintBlank:
                return @"";
            case AWSS3BucketLocationConstraintCNNorth1:
                return @"cn-north-1";
            case AWSS3BucketLocationConstraintUSGovWest1:
                return @"us-gov-west-1";
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
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"AES256"]) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value isEqualToString:@"aws:kms"]) {
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
        if ([value isEqualToString:@"aws-exec-read"]) {
            return @(AWSS3ObjectCannedACLAwsExecRead);
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
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"AES256"]) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value isEqualToString:@"aws:kms"]) {
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
        if ([value isEqualToString:@"STANDARD"]) {
            return @(AWSS3StorageClassStandard);
        }
        if ([value isEqualToString:@"REDUCED_REDUNDANCY"]) {
            return @(AWSS3StorageClassReducedRedundancy);
        }
        if ([value isEqualToString:@"STANDARD_IA"]) {
            return @(AWSS3StorageClassStandardIa);
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
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"requester"]) {
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
             @"MFA" : @"MFA",
             @"remove" : @"Delete",
             @"requestPayer" : @"RequestPayer",
             };
}

+ (NSValueTransformer *)removeJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Remove class]];
}

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"requester"]) {
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
             @"bucket" : @"Bucket",
             @"storageClass" : @"StorageClass",
             };
}

+ (NSValueTransformer *)storageClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"STANDARD"]) {
            return @(AWSS3StorageClassStandard);
        }
        if ([value isEqualToString:@"REDUCED_REDUNDANCY"]) {
            return @(AWSS3StorageClassReducedRedundancy);
        }
        if ([value isEqualToString:@"STANDARD_IA"]) {
            return @(AWSS3StorageClassStandardIa);
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
            default:
                return nil;
        }
    }];
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

@implementation AWSS3FilterRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"prefix"]) {
            return @(AWSS3FilterRuleNamePrefix);
        }
        if ([value isEqualToString:@"suffix"]) {
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
        if ([value isEqualToString:@"Enabled"]) {
            return @(AWSS3BucketAccelerateStatusEnabled);
        }
        if ([value isEqualToString:@"Suspended"]) {
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
        if ([value isEqualToString:@"ap-south-1"]) {
            return @(AWSS3BucketLocationConstraintAPSouth1);
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
        if ([value isEqualToString:@"ap-northeast-2"]) {
            return @(AWSS3BucketLocationConstraintAPNortheast2);
        }
        if ([value isEqualToString:@"sa-east-1"]) {
            return @(AWSS3BucketLocationConstraintSAEast1);
        }
        if ([value isEqualToString:@"eu-central-1"]) {
            return @(AWSS3BucketLocationConstraintEUCentral1);
        }
        if ([value isEqualToString:@""]) {
            return @(AWSS3BucketLocationConstraintBlank);
        }
        if ([value isEqualToString:@"cn-north-1"]) {
            return @(AWSS3BucketLocationConstraintCNNorth1);
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
            case AWSS3BucketLocationConstraintEUCentral1:
                return @"eu-central-1";
            case AWSS3BucketLocationConstraintBlank:
                return @"";
            case AWSS3BucketLocationConstraintCNNorth1:
                return @"cn-north-1";
            case AWSS3BucketLocationConstraintUSGovWest1:
                return @"us-gov-west-1";
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
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"COMPLETE"]) {
            return @(AWSS3ReplicationStatusComplete);
        }
        if ([value isEqualToString:@"PENDING"]) {
            return @(AWSS3ReplicationStatusPending);
        }
        if ([value isEqualToString:@"FAILED"]) {
            return @(AWSS3ReplicationStatusFailed);
        }
        if ([value isEqualToString:@"REPLICA"]) {
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
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"AES256"]) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value isEqualToString:@"aws:kms"]) {
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
        if ([value isEqualToString:@"STANDARD"]) {
            return @(AWSS3StorageClassStandard);
        }
        if ([value isEqualToString:@"REDUCED_REDUNDANCY"]) {
            return @(AWSS3StorageClassReducedRedundancy);
        }
        if ([value isEqualToString:@"STANDARD_IA"]) {
            return @(AWSS3StorageClassStandardIa);
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
        if ([value isEqualToString:@"requester"]) {
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

@implementation AWSS3GetObjectTorrentOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"requestCharged" : @"RequestCharged",
             };
}

+ (NSValueTransformer *)requestChargedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"COMPLETE"]) {
            return @(AWSS3ReplicationStatusComplete);
        }
        if ([value isEqualToString:@"PENDING"]) {
            return @(AWSS3ReplicationStatusPending);
        }
        if ([value isEqualToString:@"FAILED"]) {
            return @(AWSS3ReplicationStatusFailed);
        }
        if ([value isEqualToString:@"REPLICA"]) {
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
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"AES256"]) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value isEqualToString:@"aws:kms"]) {
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
        if ([value isEqualToString:@"STANDARD"]) {
            return @(AWSS3StorageClassStandard);
        }
        if ([value isEqualToString:@"REDUCED_REDUNDANCY"]) {
            return @(AWSS3StorageClassReducedRedundancy);
        }
        if ([value isEqualToString:@"STANDARD_IA"]) {
            return @(AWSS3StorageClassStandardIa);
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
        if ([value isEqualToString:@"requester"]) {
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

+ (NSValueTransformer *)noncurrentVersionExpirationJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3NoncurrentVersionExpiration class]];
}

+ (NSValueTransformer *)noncurrentVersionTransitionsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3NoncurrentVersionTransition class]];
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)transitionsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSS3Transition class]];
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
        if ([value isEqualToString:@"url"]) {
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
             @"startAfter" : @"StartAfter",
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
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"STANDARD"]) {
            return @(AWSS3StorageClassStandard);
        }
        if ([value isEqualToString:@"REDUCED_REDUNDANCY"]) {
            return @(AWSS3StorageClassReducedRedundancy);
        }
        if ([value isEqualToString:@"STANDARD_IA"]) {
            return @(AWSS3StorageClassStandardIa);
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
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"STANDARD_IA"]) {
            return @(AWSS3StorageClassStandardIa);
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
        if ([value isEqualToString:@"STANDARD_IA"]) {
            return @(AWSS3TransitionStorageClassStandardIa);
        }
        return @(AWSS3TransitionStorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3TransitionStorageClassGlacier:
                return @"GLACIER";
            case AWSS3TransitionStorageClassStandardIa:
                return @"STANDARD_IA";
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
             @"contentMD5" : @"ContentMD5",
             @"policy" : @"Policy",
             };
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
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"aws-exec-read"]) {
            return @(AWSS3ObjectCannedACLAwsExecRead);
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
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"AES256"]) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value isEqualToString:@"aws:kms"]) {
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
        if ([value isEqualToString:@"aws-exec-read"]) {
            return @(AWSS3ObjectCannedACLAwsExecRead);
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
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"AES256"]) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value isEqualToString:@"aws:kms"]) {
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
        if ([value isEqualToString:@"STANDARD"]) {
            return @(AWSS3StorageClassStandard);
        }
        if ([value isEqualToString:@"REDUCED_REDUNDANCY"]) {
            return @(AWSS3StorageClassReducedRedundancy);
        }
        if ([value isEqualToString:@"STANDARD_IA"]) {
            return @(AWSS3StorageClassStandardIa);
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
            default:
                return nil;
        }
    }];
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
        if ([value isEqualToString:@"s3:ReducedRedundancyLostObject"]) {
            return @(AWSS3EventS3ReducedRedundancyLostObject);
        }
        if ([value isEqualToString:@"s3:ObjectCreated:*"]) {
            return @(AWSS3EventS3ObjectCreated);
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
        if ([value isEqualToString:@"s3:ObjectRemoved:*"]) {
            return @(AWSS3EventS3ObjectRemoved);
        }
        if ([value isEqualToString:@"s3:ObjectRemoved:Delete"]) {
            return @(AWSS3EventS3ObjectRemovedDelete);
        }
        if ([value isEqualToString:@"s3:ObjectRemoved:DeleteMarkerCreated"]) {
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
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"AES256"]) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value isEqualToString:@"aws:kms"]) {
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
             @"requestPayer" : @"RequestPayer",
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
        if ([value isEqualToString:@"aws-exec-read"]) {
            return @(AWSS3ObjectCannedACLAwsExecRead);
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

+ (NSValueTransformer *)requestPayerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"AES256"]) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value isEqualToString:@"aws:kms"]) {
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
        if ([value isEqualToString:@"STANDARD"]) {
            return @(AWSS3StorageClassStandard);
        }
        if ([value isEqualToString:@"REDUCED_REDUNDANCY"]) {
            return @(AWSS3StorageClassReducedRedundancy);
        }
        if ([value isEqualToString:@"STANDARD_IA"]) {
            return @(AWSS3StorageClassStandardIa);
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
             @"destination" : @"Destination",
             @"identifier" : @"ID",
             @"prefix" : @"Prefix",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)destinationJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSS3Destination class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Enabled"]) {
            return @(AWSS3ReplicationRuleStatusEnabled);
        }
        if ([value isEqualToString:@"Disabled"]) {
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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSS3RestoreObjectOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requestCharged" : @"RequestCharged",
             };
}

+ (NSValueTransformer *)requestChargedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"s3:ReducedRedundancyLostObject"]) {
            return @(AWSS3EventS3ReducedRedundancyLostObject);
        }
        if ([value isEqualToString:@"s3:ObjectCreated:*"]) {
            return @(AWSS3EventS3ObjectCreated);
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
        if ([value isEqualToString:@"s3:ObjectRemoved:*"]) {
            return @(AWSS3EventS3ObjectRemoved);
        }
        if ([value isEqualToString:@"s3:ObjectRemoved:Delete"]) {
            return @(AWSS3EventS3ObjectRemovedDelete);
        }
        if ([value isEqualToString:@"s3:ObjectRemoved:DeleteMarkerCreated"]) {
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
        if ([value isEqualToString:@"GLACIER"]) {
            return @(AWSS3TransitionStorageClassGlacier);
        }
        if ([value isEqualToString:@"STANDARD_IA"]) {
            return @(AWSS3TransitionStorageClassStandardIa);
        }
        return @(AWSS3TransitionStorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSS3TransitionStorageClassGlacier:
                return @"GLACIER";
            case AWSS3TransitionStorageClassStandardIa:
                return @"STANDARD_IA";
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
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"AES256"]) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value isEqualToString:@"aws:kms"]) {
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
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"requester"]) {
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
        if ([value isEqualToString:@"AES256"]) {
            return @(AWSS3ServerSideEncryptionAES256);
        }
        if ([value isEqualToString:@"aws:kms"]) {
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
        if ([value isEqualToString:@"requester"]) {
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
