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

#import "AWSFirehoseModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSFirehoseErrorDomain = @"com.amazonaws.AWSFirehoseErrorDomain";

@implementation AWSFirehoseBufferingHints

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"intervalInSeconds" : @"IntervalInSeconds",
             @"sizeInMBs" : @"SizeInMBs",
             };
}

@end

@implementation AWSFirehoseCreateDeliveryStreamInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamName" : @"DeliveryStreamName",
             @"redshiftDestinationConfiguration" : @"RedshiftDestinationConfiguration",
             @"s3DestinationConfiguration" : @"S3DestinationConfiguration",
             };
}

+ (NSValueTransformer *)redshiftDestinationConfigurationJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseRedshiftDestinationConfiguration class]];
}

+ (NSValueTransformer *)s3DestinationConfigurationJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationConfiguration class]];
}

@end

@implementation AWSFirehoseCreateDeliveryStreamOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamARN" : @"DeliveryStreamARN",
             };
}

@end

@implementation AWSFirehoseDeleteDeliveryStreamInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamName" : @"DeliveryStreamName",
             };
}

@end

@implementation AWSFirehoseDeleteDeliveryStreamOutput

@end

@implementation AWSFirehoseDeliveryStreamDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTimestamp" : @"CreateTimestamp",
             @"deliveryStreamARN" : @"DeliveryStreamARN",
             @"deliveryStreamName" : @"DeliveryStreamName",
             @"deliveryStreamStatus" : @"DeliveryStreamStatus",
             @"destinations" : @"Destinations",
             @"hasMoreDestinations" : @"HasMoreDestinations",
             @"lastUpdateTimestamp" : @"LastUpdateTimestamp",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)createTimestampJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)deliveryStreamStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"CREATING"]) {
            return @(AWSFirehoseDeliveryStreamStatusCreating);
        }
        if ([value isEqualToString:@"DELETING"]) {
            return @(AWSFirehoseDeliveryStreamStatusDeleting);
        }
        if ([value isEqualToString:@"ACTIVE"]) {
            return @(AWSFirehoseDeliveryStreamStatusActive);
        }
        return @(AWSFirehoseDeliveryStreamStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseDeliveryStreamStatusCreating:
                return @"CREATING";
            case AWSFirehoseDeliveryStreamStatusDeleting:
                return @"DELETING";
            case AWSFirehoseDeliveryStreamStatusActive:
                return @"ACTIVE";
            case AWSFirehoseDeliveryStreamStatusUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFirehoseDestinationDescription class]];
}

+ (NSValueTransformer *)lastUpdateTimestampJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSFirehoseDescribeDeliveryStreamInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamName" : @"DeliveryStreamName",
             @"exclusiveStartDestinationId" : @"ExclusiveStartDestinationId",
             @"limit" : @"Limit",
             };
}

@end

@implementation AWSFirehoseDescribeDeliveryStreamOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamDescription" : @"DeliveryStreamDescription",
             };
}

+ (NSValueTransformer *)deliveryStreamDescriptionJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseDeliveryStreamDescription class]];
}

@end

@implementation AWSFirehoseDestinationDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationId" : @"DestinationId",
             @"redshiftDestinationDescription" : @"RedshiftDestinationDescription",
             @"s3DestinationDescription" : @"S3DestinationDescription",
             };
}

+ (NSValueTransformer *)redshiftDestinationDescriptionJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseRedshiftDestinationDescription class]];
}

+ (NSValueTransformer *)s3DestinationDescriptionJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationDescription class]];
}

@end

@implementation AWSFirehoseEncryptionConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"KMSEncryptionConfig" : @"KMSEncryptionConfig",
             @"noEncryptionConfig" : @"NoEncryptionConfig",
             };
}

+ (NSValueTransformer *)KMSEncryptionConfigJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseKMSEncryptionConfig class]];
}

+ (NSValueTransformer *)noEncryptionConfigJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"NoEncryption"]) {
            return @(AWSFirehoseNoEncryptionConfigNoEncryption);
        }
        return @(AWSFirehoseNoEncryptionConfigUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseNoEncryptionConfigNoEncryption:
                return @"NoEncryption";
            case AWSFirehoseNoEncryptionConfigUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFirehoseKMSEncryptionConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"AWSKMSKeyARN" : @"AWSKMSKeyARN",
             };
}

@end

@implementation AWSFirehoseListDeliveryStreamsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exclusiveStartDeliveryStreamName" : @"ExclusiveStartDeliveryStreamName",
             @"limit" : @"Limit",
             };
}

@end

@implementation AWSFirehoseListDeliveryStreamsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamNames" : @"DeliveryStreamNames",
             @"hasMoreDeliveryStreams" : @"HasMoreDeliveryStreams",
             };
}

@end

@implementation AWSFirehosePutRecordBatchInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamName" : @"DeliveryStreamName",
             @"records" : @"Records",
             };
}

+ (NSValueTransformer *)recordsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFirehoseRecord class]];
}

@end

@implementation AWSFirehosePutRecordBatchOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failedPutCount" : @"FailedPutCount",
             @"requestResponses" : @"RequestResponses",
             };
}

+ (NSValueTransformer *)requestResponsesJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFirehosePutRecordBatchResponseEntry class]];
}

@end

@implementation AWSFirehosePutRecordBatchResponseEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"recordId" : @"RecordId",
             };
}

@end

@implementation AWSFirehosePutRecordInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamName" : @"DeliveryStreamName",
             @"record" : @"Record",
             };
}

+ (NSValueTransformer *)recordJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseRecord class]];
}

@end

@implementation AWSFirehosePutRecordOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recordId" : @"RecordId",
             };
}

@end

@implementation AWSFirehoseRecord

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"Data",
             };
}

@end

@implementation AWSFirehoseRedshiftDestinationConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterJDBCURL" : @"ClusterJDBCURL",
             @"password" : @"Password",
             @"replicateCommand" : @"CopyCommand",
             @"roleARN" : @"RoleARN",
             @"s3Configuration" : @"S3Configuration",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)replicateCommandJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseReplicateCommand class]];
}

+ (NSValueTransformer *)s3ConfigurationJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationConfiguration class]];
}

@end

@implementation AWSFirehoseRedshiftDestinationDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterJDBCURL" : @"ClusterJDBCURL",
             @"replicateCommand" : @"CopyCommand",
             @"roleARN" : @"RoleARN",
             @"s3DestinationDescription" : @"S3DestinationDescription",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)replicateCommandJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseReplicateCommand class]];
}

+ (NSValueTransformer *)s3DestinationDescriptionJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationDescription class]];
}

@end

@implementation AWSFirehoseRedshiftDestinationUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterJDBCURL" : @"ClusterJDBCURL",
             @"password" : @"Password",
             @"replicateCommand" : @"CopyCommand",
             @"roleARN" : @"RoleARN",
             @"s3Update" : @"S3Update",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)replicateCommandJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseReplicateCommand class]];
}

+ (NSValueTransformer *)s3UpdateJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationUpdate class]];
}

@end

@implementation AWSFirehoseReplicateCommand

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataTableColumns" : @"DataTableColumns",
             @"dataTableName" : @"DataTableName",
             @"replicateOptions" : @"CopyOptions",
             };
}

@end

@implementation AWSFirehoseS3DestinationConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketARN" : @"BucketARN",
             @"bufferingHints" : @"BufferingHints",
             @"compressionFormat" : @"CompressionFormat",
             @"encryptionConfiguration" : @"EncryptionConfiguration",
             @"prefix" : @"Prefix",
             @"roleARN" : @"RoleARN",
             };
}

+ (NSValueTransformer *)bufferingHintsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseBufferingHints class]];
}

+ (NSValueTransformer *)compressionFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"UNCOMPRESSED"]) {
            return @(AWSFirehoseCompressionFormatUncompressed);
        }
        if ([value isEqualToString:@"GZIP"]) {
            return @(AWSFirehoseCompressionFormatGzip);
        }
        if ([value isEqualToString:@"ZIP"]) {
            return @(AWSFirehoseCompressionFormatZip);
        }
        if ([value isEqualToString:@"Snappy"]) {
            return @(AWSFirehoseCompressionFormatSnappy);
        }
        return @(AWSFirehoseCompressionFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseCompressionFormatUncompressed:
                return @"UNCOMPRESSED";
            case AWSFirehoseCompressionFormatGzip:
                return @"GZIP";
            case AWSFirehoseCompressionFormatZip:
                return @"ZIP";
            case AWSFirehoseCompressionFormatSnappy:
                return @"Snappy";
            case AWSFirehoseCompressionFormatUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)encryptionConfigurationJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseEncryptionConfiguration class]];
}

@end

@implementation AWSFirehoseS3DestinationDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketARN" : @"BucketARN",
             @"bufferingHints" : @"BufferingHints",
             @"compressionFormat" : @"CompressionFormat",
             @"encryptionConfiguration" : @"EncryptionConfiguration",
             @"prefix" : @"Prefix",
             @"roleARN" : @"RoleARN",
             };
}

+ (NSValueTransformer *)bufferingHintsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseBufferingHints class]];
}

+ (NSValueTransformer *)compressionFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"UNCOMPRESSED"]) {
            return @(AWSFirehoseCompressionFormatUncompressed);
        }
        if ([value isEqualToString:@"GZIP"]) {
            return @(AWSFirehoseCompressionFormatGzip);
        }
        if ([value isEqualToString:@"ZIP"]) {
            return @(AWSFirehoseCompressionFormatZip);
        }
        if ([value isEqualToString:@"Snappy"]) {
            return @(AWSFirehoseCompressionFormatSnappy);
        }
        return @(AWSFirehoseCompressionFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseCompressionFormatUncompressed:
                return @"UNCOMPRESSED";
            case AWSFirehoseCompressionFormatGzip:
                return @"GZIP";
            case AWSFirehoseCompressionFormatZip:
                return @"ZIP";
            case AWSFirehoseCompressionFormatSnappy:
                return @"Snappy";
            case AWSFirehoseCompressionFormatUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)encryptionConfigurationJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseEncryptionConfiguration class]];
}

@end

@implementation AWSFirehoseS3DestinationUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketARN" : @"BucketARN",
             @"bufferingHints" : @"BufferingHints",
             @"compressionFormat" : @"CompressionFormat",
             @"encryptionConfiguration" : @"EncryptionConfiguration",
             @"prefix" : @"Prefix",
             @"roleARN" : @"RoleARN",
             };
}

+ (NSValueTransformer *)bufferingHintsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseBufferingHints class]];
}

+ (NSValueTransformer *)compressionFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"UNCOMPRESSED"]) {
            return @(AWSFirehoseCompressionFormatUncompressed);
        }
        if ([value isEqualToString:@"GZIP"]) {
            return @(AWSFirehoseCompressionFormatGzip);
        }
        if ([value isEqualToString:@"ZIP"]) {
            return @(AWSFirehoseCompressionFormatZip);
        }
        if ([value isEqualToString:@"Snappy"]) {
            return @(AWSFirehoseCompressionFormatSnappy);
        }
        return @(AWSFirehoseCompressionFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseCompressionFormatUncompressed:
                return @"UNCOMPRESSED";
            case AWSFirehoseCompressionFormatGzip:
                return @"GZIP";
            case AWSFirehoseCompressionFormatZip:
                return @"ZIP";
            case AWSFirehoseCompressionFormatSnappy:
                return @"Snappy";
            case AWSFirehoseCompressionFormatUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)encryptionConfigurationJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseEncryptionConfiguration class]];
}

@end

@implementation AWSFirehoseUpdateDestinationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currentDeliveryStreamVersionId" : @"CurrentDeliveryStreamVersionId",
             @"deliveryStreamName" : @"DeliveryStreamName",
             @"destinationId" : @"DestinationId",
             @"redshiftDestinationUpdate" : @"RedshiftDestinationUpdate",
             @"s3DestinationUpdate" : @"S3DestinationUpdate",
             };
}

+ (NSValueTransformer *)redshiftDestinationUpdateJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseRedshiftDestinationUpdate class]];
}

+ (NSValueTransformer *)s3DestinationUpdateJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationUpdate class]];
}

@end

@implementation AWSFirehoseUpdateDestinationOutput

@end
