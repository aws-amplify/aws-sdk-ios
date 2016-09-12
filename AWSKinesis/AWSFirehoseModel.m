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

@implementation AWSFirehoseCloudWatchLoggingOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"logGroupName" : @"LogGroupName",
             @"logStreamName" : @"LogStreamName",
             };
}

@end

@implementation AWSFirehoseReplicateCommand

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicateOptions" : @"CopyOptions",
             @"dataTableColumns" : @"DataTableColumns",
             @"dataTableName" : @"DataTableName",
             };
}

@end

@implementation AWSFirehoseCreateDeliveryStreamInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamName" : @"DeliveryStreamName",
             @"elasticsearchDestinationConfiguration" : @"ElasticsearchDestinationConfiguration",
             @"redshiftDestinationConfiguration" : @"RedshiftDestinationConfiguration",
             @"s3DestinationConfiguration" : @"S3DestinationConfiguration",
             };
}

+ (NSValueTransformer *)elasticsearchDestinationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseElasticsearchDestinationConfiguration class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)deliveryStreamStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFirehoseDestinationDescription class]];
}

+ (NSValueTransformer *)lastUpdateTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
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
             @"elasticsearchDestinationDescription" : @"ElasticsearchDestinationDescription",
             @"redshiftDestinationDescription" : @"RedshiftDestinationDescription",
             @"s3DestinationDescription" : @"S3DestinationDescription",
             };
}

+ (NSValueTransformer *)elasticsearchDestinationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseElasticsearchDestinationDescription class]];
}

+ (NSValueTransformer *)redshiftDestinationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseRedshiftDestinationDescription class]];
}

+ (NSValueTransformer *)s3DestinationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationDescription class]];
}

@end

@implementation AWSFirehoseElasticsearchBufferingHints

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"intervalInSeconds" : @"IntervalInSeconds",
             @"sizeInMBs" : @"SizeInMBs",
             };
}

@end

@implementation AWSFirehoseElasticsearchDestinationConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"domainARN" : @"DomainARN",
             @"indexName" : @"IndexName",
             @"indexRotationPeriod" : @"IndexRotationPeriod",
             @"retryOptions" : @"RetryOptions",
             @"roleARN" : @"RoleARN",
             @"s3BackupMode" : @"S3BackupMode",
             @"s3Configuration" : @"S3Configuration",
             @"typeName" : @"TypeName",
             };
}

+ (NSValueTransformer *)bufferingHintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseElasticsearchBufferingHints class]];
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)indexRotationPeriodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NoRotation"] == NSOrderedSame) {
            return @(AWSFirehoseElasticsearchIndexRotationPeriodNoRotation);
        }
        if ([value caseInsensitiveCompare:@"OneHour"] == NSOrderedSame) {
            return @(AWSFirehoseElasticsearchIndexRotationPeriodOneHour);
        }
        if ([value caseInsensitiveCompare:@"OneDay"] == NSOrderedSame) {
            return @(AWSFirehoseElasticsearchIndexRotationPeriodOneDay);
        }
        if ([value caseInsensitiveCompare:@"OneWeek"] == NSOrderedSame) {
            return @(AWSFirehoseElasticsearchIndexRotationPeriodOneWeek);
        }
        if ([value caseInsensitiveCompare:@"OneMonth"] == NSOrderedSame) {
            return @(AWSFirehoseElasticsearchIndexRotationPeriodOneMonth);
        }
        return @(AWSFirehoseElasticsearchIndexRotationPeriodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseElasticsearchIndexRotationPeriodNoRotation:
                return @"NoRotation";
            case AWSFirehoseElasticsearchIndexRotationPeriodOneHour:
                return @"OneHour";
            case AWSFirehoseElasticsearchIndexRotationPeriodOneDay:
                return @"OneDay";
            case AWSFirehoseElasticsearchIndexRotationPeriodOneWeek:
                return @"OneWeek";
            case AWSFirehoseElasticsearchIndexRotationPeriodOneMonth:
                return @"OneMonth";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)retryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseElasticsearchRetryOptions class]];
}

+ (NSValueTransformer *)s3BackupModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FailedDocumentsOnly"] == NSOrderedSame) {
            return @(AWSFirehoseElasticsearchS3BackupModeFailedDocumentsOnly);
        }
        if ([value caseInsensitiveCompare:@"AllDocuments"] == NSOrderedSame) {
            return @(AWSFirehoseElasticsearchS3BackupModeAllDocuments);
        }
        return @(AWSFirehoseElasticsearchS3BackupModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseElasticsearchS3BackupModeFailedDocumentsOnly:
                return @"FailedDocumentsOnly";
            case AWSFirehoseElasticsearchS3BackupModeAllDocuments:
                return @"AllDocuments";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3ConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationConfiguration class]];
}

@end

@implementation AWSFirehoseElasticsearchDestinationDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"domainARN" : @"DomainARN",
             @"indexName" : @"IndexName",
             @"indexRotationPeriod" : @"IndexRotationPeriod",
             @"retryOptions" : @"RetryOptions",
             @"roleARN" : @"RoleARN",
             @"s3BackupMode" : @"S3BackupMode",
             @"s3DestinationDescription" : @"S3DestinationDescription",
             @"typeName" : @"TypeName",
             };
}

+ (NSValueTransformer *)bufferingHintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseElasticsearchBufferingHints class]];
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)indexRotationPeriodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NoRotation"] == NSOrderedSame) {
            return @(AWSFirehoseElasticsearchIndexRotationPeriodNoRotation);
        }
        if ([value caseInsensitiveCompare:@"OneHour"] == NSOrderedSame) {
            return @(AWSFirehoseElasticsearchIndexRotationPeriodOneHour);
        }
        if ([value caseInsensitiveCompare:@"OneDay"] == NSOrderedSame) {
            return @(AWSFirehoseElasticsearchIndexRotationPeriodOneDay);
        }
        if ([value caseInsensitiveCompare:@"OneWeek"] == NSOrderedSame) {
            return @(AWSFirehoseElasticsearchIndexRotationPeriodOneWeek);
        }
        if ([value caseInsensitiveCompare:@"OneMonth"] == NSOrderedSame) {
            return @(AWSFirehoseElasticsearchIndexRotationPeriodOneMonth);
        }
        return @(AWSFirehoseElasticsearchIndexRotationPeriodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseElasticsearchIndexRotationPeriodNoRotation:
                return @"NoRotation";
            case AWSFirehoseElasticsearchIndexRotationPeriodOneHour:
                return @"OneHour";
            case AWSFirehoseElasticsearchIndexRotationPeriodOneDay:
                return @"OneDay";
            case AWSFirehoseElasticsearchIndexRotationPeriodOneWeek:
                return @"OneWeek";
            case AWSFirehoseElasticsearchIndexRotationPeriodOneMonth:
                return @"OneMonth";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)retryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseElasticsearchRetryOptions class]];
}

+ (NSValueTransformer *)s3BackupModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FailedDocumentsOnly"] == NSOrderedSame) {
            return @(AWSFirehoseElasticsearchS3BackupModeFailedDocumentsOnly);
        }
        if ([value caseInsensitiveCompare:@"AllDocuments"] == NSOrderedSame) {
            return @(AWSFirehoseElasticsearchS3BackupModeAllDocuments);
        }
        return @(AWSFirehoseElasticsearchS3BackupModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseElasticsearchS3BackupModeFailedDocumentsOnly:
                return @"FailedDocumentsOnly";
            case AWSFirehoseElasticsearchS3BackupModeAllDocuments:
                return @"AllDocuments";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3DestinationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationDescription class]];
}

@end

@implementation AWSFirehoseElasticsearchDestinationUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"domainARN" : @"DomainARN",
             @"indexName" : @"IndexName",
             @"indexRotationPeriod" : @"IndexRotationPeriod",
             @"retryOptions" : @"RetryOptions",
             @"roleARN" : @"RoleARN",
             @"s3Update" : @"S3Update",
             @"typeName" : @"TypeName",
             };
}

+ (NSValueTransformer *)bufferingHintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseElasticsearchBufferingHints class]];
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)indexRotationPeriodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NoRotation"] == NSOrderedSame) {
            return @(AWSFirehoseElasticsearchIndexRotationPeriodNoRotation);
        }
        if ([value caseInsensitiveCompare:@"OneHour"] == NSOrderedSame) {
            return @(AWSFirehoseElasticsearchIndexRotationPeriodOneHour);
        }
        if ([value caseInsensitiveCompare:@"OneDay"] == NSOrderedSame) {
            return @(AWSFirehoseElasticsearchIndexRotationPeriodOneDay);
        }
        if ([value caseInsensitiveCompare:@"OneWeek"] == NSOrderedSame) {
            return @(AWSFirehoseElasticsearchIndexRotationPeriodOneWeek);
        }
        if ([value caseInsensitiveCompare:@"OneMonth"] == NSOrderedSame) {
            return @(AWSFirehoseElasticsearchIndexRotationPeriodOneMonth);
        }
        return @(AWSFirehoseElasticsearchIndexRotationPeriodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseElasticsearchIndexRotationPeriodNoRotation:
                return @"NoRotation";
            case AWSFirehoseElasticsearchIndexRotationPeriodOneHour:
                return @"OneHour";
            case AWSFirehoseElasticsearchIndexRotationPeriodOneDay:
                return @"OneDay";
            case AWSFirehoseElasticsearchIndexRotationPeriodOneWeek:
                return @"OneWeek";
            case AWSFirehoseElasticsearchIndexRotationPeriodOneMonth:
                return @"OneMonth";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)retryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseElasticsearchRetryOptions class]];
}

+ (NSValueTransformer *)s3UpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationUpdate class]];
}

@end

@implementation AWSFirehoseElasticsearchRetryOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInSeconds" : @"DurationInSeconds",
             };
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
        if ([value caseInsensitiveCompare:@"NoEncryption"] == NSOrderedSame) {
            return @(AWSFirehoseNoEncryptionConfigNoEncryption);
        }
        return @(AWSFirehoseNoEncryptionConfigUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseNoEncryptionConfigNoEncryption:
                return @"NoEncryption";
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
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"clusterJDBCURL" : @"ClusterJDBCURL",
             @"replicateCommand" : @"CopyCommand",
             @"password" : @"Password",
             @"retryOptions" : @"RetryOptions",
             @"roleARN" : @"RoleARN",
             @"s3Configuration" : @"S3Configuration",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)replicateCommandJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseReplicateCommand class]];
}

+ (NSValueTransformer *)retryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseRedshiftRetryOptions class]];
}

+ (NSValueTransformer *)s3ConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationConfiguration class]];
}

@end

@implementation AWSFirehoseRedshiftDestinationDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"clusterJDBCURL" : @"ClusterJDBCURL",
             @"replicateCommand" : @"CopyCommand",
             @"retryOptions" : @"RetryOptions",
             @"roleARN" : @"RoleARN",
             @"s3DestinationDescription" : @"S3DestinationDescription",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)replicateCommandJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseReplicateCommand class]];
}

+ (NSValueTransformer *)retryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseRedshiftRetryOptions class]];
}

+ (NSValueTransformer *)s3DestinationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationDescription class]];
}

@end

@implementation AWSFirehoseRedshiftDestinationUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"clusterJDBCURL" : @"ClusterJDBCURL",
             @"replicateCommand" : @"CopyCommand",
             @"password" : @"Password",
             @"retryOptions" : @"RetryOptions",
             @"roleARN" : @"RoleARN",
             @"s3Update" : @"S3Update",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)replicateCommandJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseReplicateCommand class]];
}

+ (NSValueTransformer *)retryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseRedshiftRetryOptions class]];
}

+ (NSValueTransformer *)s3UpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationUpdate class]];
}

@end

@implementation AWSFirehoseRedshiftRetryOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInSeconds" : @"DurationInSeconds",
             };
}

@end

@implementation AWSFirehoseS3DestinationConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketARN" : @"BucketARN",
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"compressionFormat" : @"CompressionFormat",
             @"encryptionConfiguration" : @"EncryptionConfiguration",
             @"prefix" : @"Prefix",
             @"roleARN" : @"RoleARN",
             };
}

+ (NSValueTransformer *)bufferingHintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseBufferingHints class]];
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)compressionFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UNCOMPRESSED"] == NSOrderedSame) {
            return @(AWSFirehoseCompressionFormatUncompressed);
        }
        if ([value caseInsensitiveCompare:@"GZIP"] == NSOrderedSame) {
            return @(AWSFirehoseCompressionFormatGzip);
        }
        if ([value caseInsensitiveCompare:@"ZIP"] == NSOrderedSame) {
            return @(AWSFirehoseCompressionFormatZip);
        }
        if ([value caseInsensitiveCompare:@"Snappy"] == NSOrderedSame) {
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
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"compressionFormat" : @"CompressionFormat",
             @"encryptionConfiguration" : @"EncryptionConfiguration",
             @"prefix" : @"Prefix",
             @"roleARN" : @"RoleARN",
             };
}

+ (NSValueTransformer *)bufferingHintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseBufferingHints class]];
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)compressionFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UNCOMPRESSED"] == NSOrderedSame) {
            return @(AWSFirehoseCompressionFormatUncompressed);
        }
        if ([value caseInsensitiveCompare:@"GZIP"] == NSOrderedSame) {
            return @(AWSFirehoseCompressionFormatGzip);
        }
        if ([value caseInsensitiveCompare:@"ZIP"] == NSOrderedSame) {
            return @(AWSFirehoseCompressionFormatZip);
        }
        if ([value caseInsensitiveCompare:@"Snappy"] == NSOrderedSame) {
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
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"compressionFormat" : @"CompressionFormat",
             @"encryptionConfiguration" : @"EncryptionConfiguration",
             @"prefix" : @"Prefix",
             @"roleARN" : @"RoleARN",
             };
}

+ (NSValueTransformer *)bufferingHintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseBufferingHints class]];
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)compressionFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UNCOMPRESSED"] == NSOrderedSame) {
            return @(AWSFirehoseCompressionFormatUncompressed);
        }
        if ([value caseInsensitiveCompare:@"GZIP"] == NSOrderedSame) {
            return @(AWSFirehoseCompressionFormatGzip);
        }
        if ([value caseInsensitiveCompare:@"ZIP"] == NSOrderedSame) {
            return @(AWSFirehoseCompressionFormatZip);
        }
        if ([value caseInsensitiveCompare:@"Snappy"] == NSOrderedSame) {
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
             @"elasticsearchDestinationUpdate" : @"ElasticsearchDestinationUpdate",
             @"redshiftDestinationUpdate" : @"RedshiftDestinationUpdate",
             @"s3DestinationUpdate" : @"S3DestinationUpdate",
             };
}

+ (NSValueTransformer *)elasticsearchDestinationUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseElasticsearchDestinationUpdate class]];
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
