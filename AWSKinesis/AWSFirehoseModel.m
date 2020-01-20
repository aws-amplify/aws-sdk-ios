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
             @"deliveryStreamEncryptionConfigurationInput" : @"DeliveryStreamEncryptionConfigurationInput",
             @"deliveryStreamName" : @"DeliveryStreamName",
             @"deliveryStreamType" : @"DeliveryStreamType",
             @"elasticsearchDestinationConfiguration" : @"ElasticsearchDestinationConfiguration",
             @"extendedS3DestinationConfiguration" : @"ExtendedS3DestinationConfiguration",
             @"kinesisStreamSourceConfiguration" : @"KinesisStreamSourceConfiguration",
             @"redshiftDestinationConfiguration" : @"RedshiftDestinationConfiguration",
             @"s3DestinationConfiguration" : @"S3DestinationConfiguration",
             @"splunkDestinationConfiguration" : @"SplunkDestinationConfiguration",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)deliveryStreamEncryptionConfigurationInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseDeliveryStreamEncryptionConfigurationInput class]];
}

+ (NSValueTransformer *)deliveryStreamTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DirectPut"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamTypeDirectPut);
        }
        if ([value caseInsensitiveCompare:@"KinesisStreamAsSource"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamTypeKinesisStreamAsSource);
        }
        return @(AWSFirehoseDeliveryStreamTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseDeliveryStreamTypeDirectPut:
                return @"DirectPut";
            case AWSFirehoseDeliveryStreamTypeKinesisStreamAsSource:
                return @"KinesisStreamAsSource";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)elasticsearchDestinationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseElasticsearchDestinationConfiguration class]];
}

+ (NSValueTransformer *)extendedS3DestinationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseExtendedS3DestinationConfiguration class]];
}

+ (NSValueTransformer *)kinesisStreamSourceConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseKinesisStreamSourceConfiguration class]];
}

+ (NSValueTransformer *)redshiftDestinationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseRedshiftDestinationConfiguration class]];
}

+ (NSValueTransformer *)s3DestinationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationConfiguration class]];
}

+ (NSValueTransformer *)splunkDestinationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSplunkDestinationConfiguration class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFirehoseTag class]];
}

@end

@implementation AWSFirehoseCreateDeliveryStreamOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamARN" : @"DeliveryStreamARN",
             };
}

@end

@implementation AWSFirehoseDataFormatConversionConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"inputFormatConfiguration" : @"InputFormatConfiguration",
             @"outputFormatConfiguration" : @"OutputFormatConfiguration",
             @"schemaConfiguration" : @"SchemaConfiguration",
             };
}

+ (NSValueTransformer *)inputFormatConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseInputFormatConfiguration class]];
}

+ (NSValueTransformer *)outputFormatConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseOutputFormatConfiguration class]];
}

+ (NSValueTransformer *)schemaConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSchemaConfiguration class]];
}

@end

@implementation AWSFirehoseDeleteDeliveryStreamInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowForceDelete" : @"AllowForceDelete",
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
             @"deliveryStreamEncryptionConfiguration" : @"DeliveryStreamEncryptionConfiguration",
             @"deliveryStreamName" : @"DeliveryStreamName",
             @"deliveryStreamStatus" : @"DeliveryStreamStatus",
             @"deliveryStreamType" : @"DeliveryStreamType",
             @"destinations" : @"Destinations",
             @"failureDescription" : @"FailureDescription",
             @"hasMoreDestinations" : @"HasMoreDestinations",
             @"lastUpdateTimestamp" : @"LastUpdateTimestamp",
             @"source" : @"Source",
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

+ (NSValueTransformer *)deliveryStreamEncryptionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseDeliveryStreamEncryptionConfiguration class]];
}

+ (NSValueTransformer *)deliveryStreamStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATING_FAILED"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamStatusCreatingFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETING_FAILED"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamStatusDeletingFailed);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamStatusActive);
        }
        return @(AWSFirehoseDeliveryStreamStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseDeliveryStreamStatusCreating:
                return @"CREATING";
            case AWSFirehoseDeliveryStreamStatusCreatingFailed:
                return @"CREATING_FAILED";
            case AWSFirehoseDeliveryStreamStatusDeleting:
                return @"DELETING";
            case AWSFirehoseDeliveryStreamStatusDeletingFailed:
                return @"DELETING_FAILED";
            case AWSFirehoseDeliveryStreamStatusActive:
                return @"ACTIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)deliveryStreamTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DirectPut"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamTypeDirectPut);
        }
        if ([value caseInsensitiveCompare:@"KinesisStreamAsSource"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamTypeKinesisStreamAsSource);
        }
        return @(AWSFirehoseDeliveryStreamTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseDeliveryStreamTypeDirectPut:
                return @"DirectPut";
            case AWSFirehoseDeliveryStreamTypeKinesisStreamAsSource:
                return @"KinesisStreamAsSource";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFirehoseDestinationDescription class]];
}

+ (NSValueTransformer *)failureDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseFailureDescription class]];
}

+ (NSValueTransformer *)lastUpdateTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSourceDescription class]];
}

@end

@implementation AWSFirehoseDeliveryStreamEncryptionConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failureDescription" : @"FailureDescription",
             @"keyARN" : @"KeyARN",
             @"keyType" : @"KeyType",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)failureDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseFailureDescription class]];
}

+ (NSValueTransformer *)keyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS_OWNED_CMK"] == NSOrderedSame) {
            return @(AWSFirehoseKeyTypeAwsOwnedCmk);
        }
        if ([value caseInsensitiveCompare:@"CUSTOMER_MANAGED_CMK"] == NSOrderedSame) {
            return @(AWSFirehoseKeyTypeCustomerManagedCmk);
        }
        return @(AWSFirehoseKeyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseKeyTypeAwsOwnedCmk:
                return @"AWS_OWNED_CMK";
            case AWSFirehoseKeyTypeCustomerManagedCmk:
                return @"CUSTOMER_MANAGED_CMK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamEncryptionStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLING"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamEncryptionStatusEnabling);
        }
        if ([value caseInsensitiveCompare:@"ENABLING_FAILED"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamEncryptionStatusEnablingFailed);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamEncryptionStatusDisabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLING"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamEncryptionStatusDisabling);
        }
        if ([value caseInsensitiveCompare:@"DISABLING_FAILED"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamEncryptionStatusDisablingFailed);
        }
        return @(AWSFirehoseDeliveryStreamEncryptionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseDeliveryStreamEncryptionStatusEnabled:
                return @"ENABLED";
            case AWSFirehoseDeliveryStreamEncryptionStatusEnabling:
                return @"ENABLING";
            case AWSFirehoseDeliveryStreamEncryptionStatusEnablingFailed:
                return @"ENABLING_FAILED";
            case AWSFirehoseDeliveryStreamEncryptionStatusDisabled:
                return @"DISABLED";
            case AWSFirehoseDeliveryStreamEncryptionStatusDisabling:
                return @"DISABLING";
            case AWSFirehoseDeliveryStreamEncryptionStatusDisablingFailed:
                return @"DISABLING_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFirehoseDeliveryStreamEncryptionConfigurationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyARN" : @"KeyARN",
             @"keyType" : @"KeyType",
             };
}

+ (NSValueTransformer *)keyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS_OWNED_CMK"] == NSOrderedSame) {
            return @(AWSFirehoseKeyTypeAwsOwnedCmk);
        }
        if ([value caseInsensitiveCompare:@"CUSTOMER_MANAGED_CMK"] == NSOrderedSame) {
            return @(AWSFirehoseKeyTypeCustomerManagedCmk);
        }
        return @(AWSFirehoseKeyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseKeyTypeAwsOwnedCmk:
                return @"AWS_OWNED_CMK";
            case AWSFirehoseKeyTypeCustomerManagedCmk:
                return @"CUSTOMER_MANAGED_CMK";
            default:
                return nil;
        }
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

@implementation AWSFirehoseDeserializer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hiveJsonSerDe" : @"HiveJsonSerDe",
             @"openXJsonSerDe" : @"OpenXJsonSerDe",
             };
}

+ (NSValueTransformer *)hiveJsonSerDeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseHiveJsonSerDe class]];
}

+ (NSValueTransformer *)openXJsonSerDeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseOpenXJsonSerDe class]];
}

@end

@implementation AWSFirehoseDestinationDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationId" : @"DestinationId",
             @"elasticsearchDestinationDescription" : @"ElasticsearchDestinationDescription",
             @"extendedS3DestinationDescription" : @"ExtendedS3DestinationDescription",
             @"redshiftDestinationDescription" : @"RedshiftDestinationDescription",
             @"s3DestinationDescription" : @"S3DestinationDescription",
             @"splunkDestinationDescription" : @"SplunkDestinationDescription",
             };
}

+ (NSValueTransformer *)elasticsearchDestinationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseElasticsearchDestinationDescription class]];
}

+ (NSValueTransformer *)extendedS3DestinationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseExtendedS3DestinationDescription class]];
}

+ (NSValueTransformer *)redshiftDestinationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseRedshiftDestinationDescription class]];
}

+ (NSValueTransformer *)s3DestinationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationDescription class]];
}

+ (NSValueTransformer *)splunkDestinationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSplunkDestinationDescription class]];
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
             @"clusterEndpoint" : @"ClusterEndpoint",
             @"domainARN" : @"DomainARN",
             @"indexName" : @"IndexName",
             @"indexRotationPeriod" : @"IndexRotationPeriod",
             @"processingConfiguration" : @"ProcessingConfiguration",
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

+ (NSValueTransformer *)processingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseProcessingConfiguration class]];
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
             @"clusterEndpoint" : @"ClusterEndpoint",
             @"domainARN" : @"DomainARN",
             @"indexName" : @"IndexName",
             @"indexRotationPeriod" : @"IndexRotationPeriod",
             @"processingConfiguration" : @"ProcessingConfiguration",
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

+ (NSValueTransformer *)processingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseProcessingConfiguration class]];
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
             @"clusterEndpoint" : @"ClusterEndpoint",
             @"domainARN" : @"DomainARN",
             @"indexName" : @"IndexName",
             @"indexRotationPeriod" : @"IndexRotationPeriod",
             @"processingConfiguration" : @"ProcessingConfiguration",
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

+ (NSValueTransformer *)processingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseProcessingConfiguration class]];
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

@implementation AWSFirehoseExtendedS3DestinationConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketARN" : @"BucketARN",
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"compressionFormat" : @"CompressionFormat",
             @"dataFormatConversionConfiguration" : @"DataFormatConversionConfiguration",
             @"encryptionConfiguration" : @"EncryptionConfiguration",
             @"errorOutputPrefix" : @"ErrorOutputPrefix",
             @"prefix" : @"Prefix",
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"roleARN" : @"RoleARN",
             @"s3BackupConfiguration" : @"S3BackupConfiguration",
             @"s3BackupMode" : @"S3BackupMode",
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

+ (NSValueTransformer *)dataFormatConversionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseDataFormatConversionConfiguration class]];
}

+ (NSValueTransformer *)encryptionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseEncryptionConfiguration class]];
}

+ (NSValueTransformer *)processingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseProcessingConfiguration class]];
}

+ (NSValueTransformer *)s3BackupConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationConfiguration class]];
}

+ (NSValueTransformer *)s3BackupModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSFirehoseS3BackupModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSFirehoseS3BackupModeEnabled);
        }
        return @(AWSFirehoseS3BackupModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseS3BackupModeDisabled:
                return @"Disabled";
            case AWSFirehoseS3BackupModeEnabled:
                return @"Enabled";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFirehoseExtendedS3DestinationDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketARN" : @"BucketARN",
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"compressionFormat" : @"CompressionFormat",
             @"dataFormatConversionConfiguration" : @"DataFormatConversionConfiguration",
             @"encryptionConfiguration" : @"EncryptionConfiguration",
             @"errorOutputPrefix" : @"ErrorOutputPrefix",
             @"prefix" : @"Prefix",
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"roleARN" : @"RoleARN",
             @"s3BackupDescription" : @"S3BackupDescription",
             @"s3BackupMode" : @"S3BackupMode",
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

+ (NSValueTransformer *)dataFormatConversionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseDataFormatConversionConfiguration class]];
}

+ (NSValueTransformer *)encryptionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseEncryptionConfiguration class]];
}

+ (NSValueTransformer *)processingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseProcessingConfiguration class]];
}

+ (NSValueTransformer *)s3BackupDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationDescription class]];
}

+ (NSValueTransformer *)s3BackupModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSFirehoseS3BackupModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSFirehoseS3BackupModeEnabled);
        }
        return @(AWSFirehoseS3BackupModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseS3BackupModeDisabled:
                return @"Disabled";
            case AWSFirehoseS3BackupModeEnabled:
                return @"Enabled";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFirehoseExtendedS3DestinationUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketARN" : @"BucketARN",
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"compressionFormat" : @"CompressionFormat",
             @"dataFormatConversionConfiguration" : @"DataFormatConversionConfiguration",
             @"encryptionConfiguration" : @"EncryptionConfiguration",
             @"errorOutputPrefix" : @"ErrorOutputPrefix",
             @"prefix" : @"Prefix",
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"roleARN" : @"RoleARN",
             @"s3BackupMode" : @"S3BackupMode",
             @"s3BackupUpdate" : @"S3BackupUpdate",
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

+ (NSValueTransformer *)dataFormatConversionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseDataFormatConversionConfiguration class]];
}

+ (NSValueTransformer *)encryptionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseEncryptionConfiguration class]];
}

+ (NSValueTransformer *)processingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseProcessingConfiguration class]];
}

+ (NSValueTransformer *)s3BackupModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSFirehoseS3BackupModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSFirehoseS3BackupModeEnabled);
        }
        return @(AWSFirehoseS3BackupModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseS3BackupModeDisabled:
                return @"Disabled";
            case AWSFirehoseS3BackupModeEnabled:
                return @"Enabled";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3BackupUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationUpdate class]];
}

@end

@implementation AWSFirehoseFailureDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"details" : @"Details",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RETIRE_KMS_GRANT_FAILED"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamFailureTypeRetireKmsGrantFailed);
        }
        if ([value caseInsensitiveCompare:@"CREATE_KMS_GRANT_FAILED"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamFailureTypeCreateKmsGrantFailed);
        }
        if ([value caseInsensitiveCompare:@"KMS_ACCESS_DENIED"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamFailureTypeKmsAccessDenied);
        }
        if ([value caseInsensitiveCompare:@"DISABLED_KMS_KEY"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamFailureTypeDisabledKmsKey);
        }
        if ([value caseInsensitiveCompare:@"INVALID_KMS_KEY"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamFailureTypeInvalidKmsKey);
        }
        if ([value caseInsensitiveCompare:@"KMS_KEY_NOT_FOUND"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamFailureTypeKmsKeyNotFound);
        }
        if ([value caseInsensitiveCompare:@"KMS_OPT_IN_REQUIRED"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamFailureTypeKmsOptInRequired);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN_ERROR"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamFailureTypeUnknownError);
        }
        return @(AWSFirehoseDeliveryStreamFailureTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseDeliveryStreamFailureTypeRetireKmsGrantFailed:
                return @"RETIRE_KMS_GRANT_FAILED";
            case AWSFirehoseDeliveryStreamFailureTypeCreateKmsGrantFailed:
                return @"CREATE_KMS_GRANT_FAILED";
            case AWSFirehoseDeliveryStreamFailureTypeKmsAccessDenied:
                return @"KMS_ACCESS_DENIED";
            case AWSFirehoseDeliveryStreamFailureTypeDisabledKmsKey:
                return @"DISABLED_KMS_KEY";
            case AWSFirehoseDeliveryStreamFailureTypeInvalidKmsKey:
                return @"INVALID_KMS_KEY";
            case AWSFirehoseDeliveryStreamFailureTypeKmsKeyNotFound:
                return @"KMS_KEY_NOT_FOUND";
            case AWSFirehoseDeliveryStreamFailureTypeKmsOptInRequired:
                return @"KMS_OPT_IN_REQUIRED";
            case AWSFirehoseDeliveryStreamFailureTypeUnknownError:
                return @"UNKNOWN_ERROR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFirehoseHiveJsonSerDe

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"timestampFormats" : @"TimestampFormats",
             };
}

@end

@implementation AWSFirehoseInputFormatConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deserializer" : @"Deserializer",
             };
}

+ (NSValueTransformer *)deserializerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseDeserializer class]];
}

@end

@implementation AWSFirehoseKMSEncryptionConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"AWSKMSKeyARN" : @"AWSKMSKeyARN",
             };
}

@end

@implementation AWSFirehoseKinesisStreamSourceConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kinesisStreamARN" : @"KinesisStreamARN",
             @"roleARN" : @"RoleARN",
             };
}

@end

@implementation AWSFirehoseKinesisStreamSourceDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStartTimestamp" : @"DeliveryStartTimestamp",
             @"kinesisStreamARN" : @"KinesisStreamARN",
             @"roleARN" : @"RoleARN",
             };
}

+ (NSValueTransformer *)deliveryStartTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSFirehoseListDeliveryStreamsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamType" : @"DeliveryStreamType",
             @"exclusiveStartDeliveryStreamName" : @"ExclusiveStartDeliveryStreamName",
             @"limit" : @"Limit",
             };
}

+ (NSValueTransformer *)deliveryStreamTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DirectPut"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamTypeDirectPut);
        }
        if ([value caseInsensitiveCompare:@"KinesisStreamAsSource"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamTypeKinesisStreamAsSource);
        }
        return @(AWSFirehoseDeliveryStreamTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseDeliveryStreamTypeDirectPut:
                return @"DirectPut";
            case AWSFirehoseDeliveryStreamTypeKinesisStreamAsSource:
                return @"KinesisStreamAsSource";
            default:
                return nil;
        }
    }];
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

@implementation AWSFirehoseListTagsForDeliveryStreamInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamName" : @"DeliveryStreamName",
             @"exclusiveStartTagKey" : @"ExclusiveStartTagKey",
             @"limit" : @"Limit",
             };
}

@end

@implementation AWSFirehoseListTagsForDeliveryStreamOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hasMoreTags" : @"HasMoreTags",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFirehoseTag class]];
}

@end

@implementation AWSFirehoseOpenXJsonSerDe

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"caseInsensitive" : @"CaseInsensitive",
             @"columnToJsonKeyMappings" : @"ColumnToJsonKeyMappings",
             @"convertDotsInJsonKeysToUnderscores" : @"ConvertDotsInJsonKeysToUnderscores",
             };
}

@end

@implementation AWSFirehoseOrcSerDe

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blockSizeBytes" : @"BlockSizeBytes",
             @"bloomFilterColumns" : @"BloomFilterColumns",
             @"bloomFilterFalsePositiveProbability" : @"BloomFilterFalsePositiveProbability",
             @"compression" : @"Compression",
             @"dictionaryKeyThreshold" : @"DictionaryKeyThreshold",
             @"enablePadding" : @"EnablePadding",
             @"formatVersion" : @"FormatVersion",
             @"paddingTolerance" : @"PaddingTolerance",
             @"rowIndexStride" : @"RowIndexStride",
             @"stripeSizeBytes" : @"StripeSizeBytes",
             };
}

+ (NSValueTransformer *)compressionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSFirehoseOrcCompressionNone);
        }
        if ([value caseInsensitiveCompare:@"ZLIB"] == NSOrderedSame) {
            return @(AWSFirehoseOrcCompressionZlib);
        }
        if ([value caseInsensitiveCompare:@"SNAPPY"] == NSOrderedSame) {
            return @(AWSFirehoseOrcCompressionSnappy);
        }
        return @(AWSFirehoseOrcCompressionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseOrcCompressionNone:
                return @"NONE";
            case AWSFirehoseOrcCompressionZlib:
                return @"ZLIB";
            case AWSFirehoseOrcCompressionSnappy:
                return @"SNAPPY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)formatVersionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"V0_11"] == NSOrderedSame) {
            return @(AWSFirehoseOrcFormatVersionV011);
        }
        if ([value caseInsensitiveCompare:@"V0_12"] == NSOrderedSame) {
            return @(AWSFirehoseOrcFormatVersionV012);
        }
        return @(AWSFirehoseOrcFormatVersionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseOrcFormatVersionV011:
                return @"V0_11";
            case AWSFirehoseOrcFormatVersionV012:
                return @"V0_12";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFirehoseOutputFormatConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serializer" : @"Serializer",
             };
}

+ (NSValueTransformer *)serializerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSerializer class]];
}

@end

@implementation AWSFirehoseParquetSerDe

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blockSizeBytes" : @"BlockSizeBytes",
             @"compression" : @"Compression",
             @"enableDictionaryCompression" : @"EnableDictionaryCompression",
             @"maxPaddingBytes" : @"MaxPaddingBytes",
             @"pageSizeBytes" : @"PageSizeBytes",
             @"writerVersion" : @"WriterVersion",
             };
}

+ (NSValueTransformer *)compressionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UNCOMPRESSED"] == NSOrderedSame) {
            return @(AWSFirehoseParquetCompressionUncompressed);
        }
        if ([value caseInsensitiveCompare:@"GZIP"] == NSOrderedSame) {
            return @(AWSFirehoseParquetCompressionGzip);
        }
        if ([value caseInsensitiveCompare:@"SNAPPY"] == NSOrderedSame) {
            return @(AWSFirehoseParquetCompressionSnappy);
        }
        return @(AWSFirehoseParquetCompressionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseParquetCompressionUncompressed:
                return @"UNCOMPRESSED";
            case AWSFirehoseParquetCompressionGzip:
                return @"GZIP";
            case AWSFirehoseParquetCompressionSnappy:
                return @"SNAPPY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)writerVersionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"V1"] == NSOrderedSame) {
            return @(AWSFirehoseParquetWriterVersionV1);
        }
        if ([value caseInsensitiveCompare:@"V2"] == NSOrderedSame) {
            return @(AWSFirehoseParquetWriterVersionV2);
        }
        return @(AWSFirehoseParquetWriterVersionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseParquetWriterVersionV1:
                return @"V1";
            case AWSFirehoseParquetWriterVersionV2:
                return @"V2";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFirehoseProcessingConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"processors" : @"Processors",
             };
}

+ (NSValueTransformer *)processorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFirehoseProcessor class]];
}

@end

@implementation AWSFirehoseProcessor

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameters" : @"Parameters",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFirehoseProcessorParameter class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Lambda"] == NSOrderedSame) {
            return @(AWSFirehoseProcessorTypeLambda);
        }
        return @(AWSFirehoseProcessorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseProcessorTypeLambda:
                return @"Lambda";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFirehoseProcessorParameter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameterName" : @"ParameterName",
             @"parameterValue" : @"ParameterValue",
             };
}

+ (NSValueTransformer *)parameterNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LambdaArn"] == NSOrderedSame) {
            return @(AWSFirehoseProcessorParameterNameLambdaArn);
        }
        if ([value caseInsensitiveCompare:@"NumberOfRetries"] == NSOrderedSame) {
            return @(AWSFirehoseProcessorParameterNameNumberOfRetries);
        }
        if ([value caseInsensitiveCompare:@"RoleArn"] == NSOrderedSame) {
            return @(AWSFirehoseProcessorParameterNameRoleArn);
        }
        if ([value caseInsensitiveCompare:@"BufferSizeInMBs"] == NSOrderedSame) {
            return @(AWSFirehoseProcessorParameterNameBufferSizeInMBs);
        }
        if ([value caseInsensitiveCompare:@"BufferIntervalInSeconds"] == NSOrderedSame) {
            return @(AWSFirehoseProcessorParameterNameBufferIntervalInSeconds);
        }
        return @(AWSFirehoseProcessorParameterNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseProcessorParameterNameLambdaArn:
                return @"LambdaArn";
            case AWSFirehoseProcessorParameterNameNumberOfRetries:
                return @"NumberOfRetries";
            case AWSFirehoseProcessorParameterNameRoleArn:
                return @"RoleArn";
            case AWSFirehoseProcessorParameterNameBufferSizeInMBs:
                return @"BufferSizeInMBs";
            case AWSFirehoseProcessorParameterNameBufferIntervalInSeconds:
                return @"BufferIntervalInSeconds";
            default:
                return nil;
        }
    }];
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
             @"encrypted" : @"Encrypted",
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
             @"encrypted" : @"Encrypted",
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
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"retryOptions" : @"RetryOptions",
             @"roleARN" : @"RoleARN",
             @"s3BackupConfiguration" : @"S3BackupConfiguration",
             @"s3BackupMode" : @"S3BackupMode",
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

+ (NSValueTransformer *)processingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseProcessingConfiguration class]];
}

+ (NSValueTransformer *)retryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseRedshiftRetryOptions class]];
}

+ (NSValueTransformer *)s3BackupConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationConfiguration class]];
}

+ (NSValueTransformer *)s3BackupModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSFirehoseRedshiftS3BackupModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSFirehoseRedshiftS3BackupModeEnabled);
        }
        return @(AWSFirehoseRedshiftS3BackupModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseRedshiftS3BackupModeDisabled:
                return @"Disabled";
            case AWSFirehoseRedshiftS3BackupModeEnabled:
                return @"Enabled";
            default:
                return nil;
        }
    }];
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
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"retryOptions" : @"RetryOptions",
             @"roleARN" : @"RoleARN",
             @"s3BackupDescription" : @"S3BackupDescription",
             @"s3BackupMode" : @"S3BackupMode",
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

+ (NSValueTransformer *)processingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseProcessingConfiguration class]];
}

+ (NSValueTransformer *)retryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseRedshiftRetryOptions class]];
}

+ (NSValueTransformer *)s3BackupDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationDescription class]];
}

+ (NSValueTransformer *)s3BackupModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSFirehoseRedshiftS3BackupModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSFirehoseRedshiftS3BackupModeEnabled);
        }
        return @(AWSFirehoseRedshiftS3BackupModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseRedshiftS3BackupModeDisabled:
                return @"Disabled";
            case AWSFirehoseRedshiftS3BackupModeEnabled:
                return @"Enabled";
            default:
                return nil;
        }
    }];
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
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"retryOptions" : @"RetryOptions",
             @"roleARN" : @"RoleARN",
             @"s3BackupMode" : @"S3BackupMode",
             @"s3BackupUpdate" : @"S3BackupUpdate",
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

+ (NSValueTransformer *)processingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseProcessingConfiguration class]];
}

+ (NSValueTransformer *)retryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseRedshiftRetryOptions class]];
}

+ (NSValueTransformer *)s3BackupModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSFirehoseRedshiftS3BackupModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSFirehoseRedshiftS3BackupModeEnabled);
        }
        return @(AWSFirehoseRedshiftS3BackupModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseRedshiftS3BackupModeDisabled:
                return @"Disabled";
            case AWSFirehoseRedshiftS3BackupModeEnabled:
                return @"Enabled";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3BackupUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationUpdate class]];
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
             @"errorOutputPrefix" : @"ErrorOutputPrefix",
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
             @"errorOutputPrefix" : @"ErrorOutputPrefix",
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
             @"errorOutputPrefix" : @"ErrorOutputPrefix",
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

@implementation AWSFirehoseSchemaConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"region" : @"Region",
             @"roleARN" : @"RoleARN",
             @"tableName" : @"TableName",
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSFirehoseSerializer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"orcSerDe" : @"OrcSerDe",
             @"parquetSerDe" : @"ParquetSerDe",
             };
}

+ (NSValueTransformer *)orcSerDeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseOrcSerDe class]];
}

+ (NSValueTransformer *)parquetSerDeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseParquetSerDe class]];
}

@end

@implementation AWSFirehoseSourceDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kinesisStreamSourceDescription" : @"KinesisStreamSourceDescription",
             };
}

+ (NSValueTransformer *)kinesisStreamSourceDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseKinesisStreamSourceDescription class]];
}

@end

@implementation AWSFirehoseSplunkDestinationConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"HECAcknowledgmentTimeoutInSeconds" : @"HECAcknowledgmentTimeoutInSeconds",
             @"HECEndpoint" : @"HECEndpoint",
             @"HECEndpointType" : @"HECEndpointType",
             @"HECToken" : @"HECToken",
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"retryOptions" : @"RetryOptions",
             @"s3BackupMode" : @"S3BackupMode",
             @"s3Configuration" : @"S3Configuration",
             };
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)HECEndpointTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Raw"] == NSOrderedSame) {
            return @(AWSFirehoseHECEndpointTypeRaw);
        }
        if ([value caseInsensitiveCompare:@"Event"] == NSOrderedSame) {
            return @(AWSFirehoseHECEndpointTypeEvent);
        }
        return @(AWSFirehoseHECEndpointTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseHECEndpointTypeRaw:
                return @"Raw";
            case AWSFirehoseHECEndpointTypeEvent:
                return @"Event";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)processingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseProcessingConfiguration class]];
}

+ (NSValueTransformer *)retryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSplunkRetryOptions class]];
}

+ (NSValueTransformer *)s3BackupModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FailedEventsOnly"] == NSOrderedSame) {
            return @(AWSFirehoseSplunkS3BackupModeFailedEventsOnly);
        }
        if ([value caseInsensitiveCompare:@"AllEvents"] == NSOrderedSame) {
            return @(AWSFirehoseSplunkS3BackupModeAllEvents);
        }
        return @(AWSFirehoseSplunkS3BackupModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseSplunkS3BackupModeFailedEventsOnly:
                return @"FailedEventsOnly";
            case AWSFirehoseSplunkS3BackupModeAllEvents:
                return @"AllEvents";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3ConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationConfiguration class]];
}

@end

@implementation AWSFirehoseSplunkDestinationDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"HECAcknowledgmentTimeoutInSeconds" : @"HECAcknowledgmentTimeoutInSeconds",
             @"HECEndpoint" : @"HECEndpoint",
             @"HECEndpointType" : @"HECEndpointType",
             @"HECToken" : @"HECToken",
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"retryOptions" : @"RetryOptions",
             @"s3BackupMode" : @"S3BackupMode",
             @"s3DestinationDescription" : @"S3DestinationDescription",
             };
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)HECEndpointTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Raw"] == NSOrderedSame) {
            return @(AWSFirehoseHECEndpointTypeRaw);
        }
        if ([value caseInsensitiveCompare:@"Event"] == NSOrderedSame) {
            return @(AWSFirehoseHECEndpointTypeEvent);
        }
        return @(AWSFirehoseHECEndpointTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseHECEndpointTypeRaw:
                return @"Raw";
            case AWSFirehoseHECEndpointTypeEvent:
                return @"Event";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)processingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseProcessingConfiguration class]];
}

+ (NSValueTransformer *)retryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSplunkRetryOptions class]];
}

+ (NSValueTransformer *)s3BackupModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FailedEventsOnly"] == NSOrderedSame) {
            return @(AWSFirehoseSplunkS3BackupModeFailedEventsOnly);
        }
        if ([value caseInsensitiveCompare:@"AllEvents"] == NSOrderedSame) {
            return @(AWSFirehoseSplunkS3BackupModeAllEvents);
        }
        return @(AWSFirehoseSplunkS3BackupModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseSplunkS3BackupModeFailedEventsOnly:
                return @"FailedEventsOnly";
            case AWSFirehoseSplunkS3BackupModeAllEvents:
                return @"AllEvents";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3DestinationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationDescription class]];
}

@end

@implementation AWSFirehoseSplunkDestinationUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"HECAcknowledgmentTimeoutInSeconds" : @"HECAcknowledgmentTimeoutInSeconds",
             @"HECEndpoint" : @"HECEndpoint",
             @"HECEndpointType" : @"HECEndpointType",
             @"HECToken" : @"HECToken",
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"retryOptions" : @"RetryOptions",
             @"s3BackupMode" : @"S3BackupMode",
             @"s3Update" : @"S3Update",
             };
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)HECEndpointTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Raw"] == NSOrderedSame) {
            return @(AWSFirehoseHECEndpointTypeRaw);
        }
        if ([value caseInsensitiveCompare:@"Event"] == NSOrderedSame) {
            return @(AWSFirehoseHECEndpointTypeEvent);
        }
        return @(AWSFirehoseHECEndpointTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseHECEndpointTypeRaw:
                return @"Raw";
            case AWSFirehoseHECEndpointTypeEvent:
                return @"Event";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)processingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseProcessingConfiguration class]];
}

+ (NSValueTransformer *)retryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSplunkRetryOptions class]];
}

+ (NSValueTransformer *)s3BackupModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FailedEventsOnly"] == NSOrderedSame) {
            return @(AWSFirehoseSplunkS3BackupModeFailedEventsOnly);
        }
        if ([value caseInsensitiveCompare:@"AllEvents"] == NSOrderedSame) {
            return @(AWSFirehoseSplunkS3BackupModeAllEvents);
        }
        return @(AWSFirehoseSplunkS3BackupModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseSplunkS3BackupModeFailedEventsOnly:
                return @"FailedEventsOnly";
            case AWSFirehoseSplunkS3BackupModeAllEvents:
                return @"AllEvents";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3UpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationUpdate class]];
}

@end

@implementation AWSFirehoseSplunkRetryOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInSeconds" : @"DurationInSeconds",
             };
}

@end

@implementation AWSFirehoseStartDeliveryStreamEncryptionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamEncryptionConfigurationInput" : @"DeliveryStreamEncryptionConfigurationInput",
             @"deliveryStreamName" : @"DeliveryStreamName",
             };
}

+ (NSValueTransformer *)deliveryStreamEncryptionConfigurationInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseDeliveryStreamEncryptionConfigurationInput class]];
}

@end

@implementation AWSFirehoseStartDeliveryStreamEncryptionOutput

@end

@implementation AWSFirehoseStopDeliveryStreamEncryptionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamName" : @"DeliveryStreamName",
             };
}

@end

@implementation AWSFirehoseStopDeliveryStreamEncryptionOutput

@end

@implementation AWSFirehoseTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSFirehoseTagDeliveryStreamInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamName" : @"DeliveryStreamName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFirehoseTag class]];
}

@end

@implementation AWSFirehoseTagDeliveryStreamOutput

@end

@implementation AWSFirehoseUntagDeliveryStreamInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamName" : @"DeliveryStreamName",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSFirehoseUntagDeliveryStreamOutput

@end

@implementation AWSFirehoseUpdateDestinationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currentDeliveryStreamVersionId" : @"CurrentDeliveryStreamVersionId",
             @"deliveryStreamName" : @"DeliveryStreamName",
             @"destinationId" : @"DestinationId",
             @"elasticsearchDestinationUpdate" : @"ElasticsearchDestinationUpdate",
             @"extendedS3DestinationUpdate" : @"ExtendedS3DestinationUpdate",
             @"redshiftDestinationUpdate" : @"RedshiftDestinationUpdate",
             @"s3DestinationUpdate" : @"S3DestinationUpdate",
             @"splunkDestinationUpdate" : @"SplunkDestinationUpdate",
             };
}

+ (NSValueTransformer *)elasticsearchDestinationUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseElasticsearchDestinationUpdate class]];
}

+ (NSValueTransformer *)extendedS3DestinationUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseExtendedS3DestinationUpdate class]];
}

+ (NSValueTransformer *)redshiftDestinationUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseRedshiftDestinationUpdate class]];
}

+ (NSValueTransformer *)s3DestinationUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationUpdate class]];
}

+ (NSValueTransformer *)splunkDestinationUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSplunkDestinationUpdate class]];
}

@end

@implementation AWSFirehoseUpdateDestinationOutput

@end
