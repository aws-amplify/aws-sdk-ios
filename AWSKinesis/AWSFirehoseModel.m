//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

@implementation AWSFirehoseAmazonOpenSearchServerlessBufferingHints

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"intervalInSeconds" : @"IntervalInSeconds",
             @"sizeInMBs" : @"SizeInMBs",
             };
}

@end

@implementation AWSFirehoseAmazonOpenSearchServerlessDestinationConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"collectionEndpoint" : @"CollectionEndpoint",
             @"indexName" : @"IndexName",
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"retryOptions" : @"RetryOptions",
             @"roleARN" : @"RoleARN",
             @"s3BackupMode" : @"S3BackupMode",
             @"s3Configuration" : @"S3Configuration",
             @"vpcConfiguration" : @"VpcConfiguration",
             };
}

+ (NSValueTransformer *)bufferingHintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseAmazonOpenSearchServerlessBufferingHints class]];
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)processingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseProcessingConfiguration class]];
}

+ (NSValueTransformer *)retryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseAmazonOpenSearchServerlessRetryOptions class]];
}

+ (NSValueTransformer *)s3BackupModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FailedDocumentsOnly"] == NSOrderedSame) {
            return @(AWSFirehoseAmazonOpenSearchServerlessS3BackupModeFailedDocumentsOnly);
        }
        if ([value caseInsensitiveCompare:@"AllDocuments"] == NSOrderedSame) {
            return @(AWSFirehoseAmazonOpenSearchServerlessS3BackupModeAllDocuments);
        }
        return @(AWSFirehoseAmazonOpenSearchServerlessS3BackupModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseAmazonOpenSearchServerlessS3BackupModeFailedDocumentsOnly:
                return @"FailedDocumentsOnly";
            case AWSFirehoseAmazonOpenSearchServerlessS3BackupModeAllDocuments:
                return @"AllDocuments";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3ConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationConfiguration class]];
}

+ (NSValueTransformer *)vpcConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseVpcConfiguration class]];
}

@end

@implementation AWSFirehoseAmazonOpenSearchServerlessDestinationDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"collectionEndpoint" : @"CollectionEndpoint",
             @"indexName" : @"IndexName",
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"retryOptions" : @"RetryOptions",
             @"roleARN" : @"RoleARN",
             @"s3BackupMode" : @"S3BackupMode",
             @"s3DestinationDescription" : @"S3DestinationDescription",
             @"vpcConfigurationDescription" : @"VpcConfigurationDescription",
             };
}

+ (NSValueTransformer *)bufferingHintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseAmazonOpenSearchServerlessBufferingHints class]];
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)processingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseProcessingConfiguration class]];
}

+ (NSValueTransformer *)retryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseAmazonOpenSearchServerlessRetryOptions class]];
}

+ (NSValueTransformer *)s3BackupModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FailedDocumentsOnly"] == NSOrderedSame) {
            return @(AWSFirehoseAmazonOpenSearchServerlessS3BackupModeFailedDocumentsOnly);
        }
        if ([value caseInsensitiveCompare:@"AllDocuments"] == NSOrderedSame) {
            return @(AWSFirehoseAmazonOpenSearchServerlessS3BackupModeAllDocuments);
        }
        return @(AWSFirehoseAmazonOpenSearchServerlessS3BackupModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseAmazonOpenSearchServerlessS3BackupModeFailedDocumentsOnly:
                return @"FailedDocumentsOnly";
            case AWSFirehoseAmazonOpenSearchServerlessS3BackupModeAllDocuments:
                return @"AllDocuments";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3DestinationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationDescription class]];
}

+ (NSValueTransformer *)vpcConfigurationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseVpcConfigurationDescription class]];
}

@end

@implementation AWSFirehoseAmazonOpenSearchServerlessDestinationUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"collectionEndpoint" : @"CollectionEndpoint",
             @"indexName" : @"IndexName",
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"retryOptions" : @"RetryOptions",
             @"roleARN" : @"RoleARN",
             @"s3Update" : @"S3Update",
             };
}

+ (NSValueTransformer *)bufferingHintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseAmazonOpenSearchServerlessBufferingHints class]];
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)processingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseProcessingConfiguration class]];
}

+ (NSValueTransformer *)retryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseAmazonOpenSearchServerlessRetryOptions class]];
}

+ (NSValueTransformer *)s3UpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationUpdate class]];
}

@end

@implementation AWSFirehoseAmazonOpenSearchServerlessRetryOptions

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInSeconds" : @"DurationInSeconds",
             };
}

@end

@implementation AWSFirehoseAmazonopensearchserviceBufferingHints

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"intervalInSeconds" : @"IntervalInSeconds",
             @"sizeInMBs" : @"SizeInMBs",
             };
}

@end

@implementation AWSFirehoseAmazonopensearchserviceDestinationConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"clusterEndpoint" : @"ClusterEndpoint",
             @"documentIdOptions" : @"DocumentIdOptions",
             @"domainARN" : @"DomainARN",
             @"indexName" : @"IndexName",
             @"indexRotationPeriod" : @"IndexRotationPeriod",
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"retryOptions" : @"RetryOptions",
             @"roleARN" : @"RoleARN",
             @"s3BackupMode" : @"S3BackupMode",
             @"s3Configuration" : @"S3Configuration",
             @"typeName" : @"TypeName",
             @"vpcConfiguration" : @"VpcConfiguration",
             };
}

+ (NSValueTransformer *)bufferingHintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseAmazonopensearchserviceBufferingHints class]];
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)documentIdOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseDocumentIdOptions class]];
}

+ (NSValueTransformer *)indexRotationPeriodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NoRotation"] == NSOrderedSame) {
            return @(AWSFirehoseAmazonopensearchserviceIndexRotationPeriodNoRotation);
        }
        if ([value caseInsensitiveCompare:@"OneHour"] == NSOrderedSame) {
            return @(AWSFirehoseAmazonopensearchserviceIndexRotationPeriodOneHour);
        }
        if ([value caseInsensitiveCompare:@"OneDay"] == NSOrderedSame) {
            return @(AWSFirehoseAmazonopensearchserviceIndexRotationPeriodOneDay);
        }
        if ([value caseInsensitiveCompare:@"OneWeek"] == NSOrderedSame) {
            return @(AWSFirehoseAmazonopensearchserviceIndexRotationPeriodOneWeek);
        }
        if ([value caseInsensitiveCompare:@"OneMonth"] == NSOrderedSame) {
            return @(AWSFirehoseAmazonopensearchserviceIndexRotationPeriodOneMonth);
        }
        return @(AWSFirehoseAmazonopensearchserviceIndexRotationPeriodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseAmazonopensearchserviceIndexRotationPeriodNoRotation:
                return @"NoRotation";
            case AWSFirehoseAmazonopensearchserviceIndexRotationPeriodOneHour:
                return @"OneHour";
            case AWSFirehoseAmazonopensearchserviceIndexRotationPeriodOneDay:
                return @"OneDay";
            case AWSFirehoseAmazonopensearchserviceIndexRotationPeriodOneWeek:
                return @"OneWeek";
            case AWSFirehoseAmazonopensearchserviceIndexRotationPeriodOneMonth:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseAmazonopensearchserviceRetryOptions class]];
}

+ (NSValueTransformer *)s3BackupModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FailedDocumentsOnly"] == NSOrderedSame) {
            return @(AWSFirehoseAmazonopensearchserviceS3BackupModeFailedDocumentsOnly);
        }
        if ([value caseInsensitiveCompare:@"AllDocuments"] == NSOrderedSame) {
            return @(AWSFirehoseAmazonopensearchserviceS3BackupModeAllDocuments);
        }
        return @(AWSFirehoseAmazonopensearchserviceS3BackupModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseAmazonopensearchserviceS3BackupModeFailedDocumentsOnly:
                return @"FailedDocumentsOnly";
            case AWSFirehoseAmazonopensearchserviceS3BackupModeAllDocuments:
                return @"AllDocuments";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3ConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationConfiguration class]];
}

+ (NSValueTransformer *)vpcConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseVpcConfiguration class]];
}

@end

@implementation AWSFirehoseAmazonopensearchserviceDestinationDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"clusterEndpoint" : @"ClusterEndpoint",
             @"documentIdOptions" : @"DocumentIdOptions",
             @"domainARN" : @"DomainARN",
             @"indexName" : @"IndexName",
             @"indexRotationPeriod" : @"IndexRotationPeriod",
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"retryOptions" : @"RetryOptions",
             @"roleARN" : @"RoleARN",
             @"s3BackupMode" : @"S3BackupMode",
             @"s3DestinationDescription" : @"S3DestinationDescription",
             @"typeName" : @"TypeName",
             @"vpcConfigurationDescription" : @"VpcConfigurationDescription",
             };
}

+ (NSValueTransformer *)bufferingHintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseAmazonopensearchserviceBufferingHints class]];
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)documentIdOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseDocumentIdOptions class]];
}

+ (NSValueTransformer *)indexRotationPeriodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NoRotation"] == NSOrderedSame) {
            return @(AWSFirehoseAmazonopensearchserviceIndexRotationPeriodNoRotation);
        }
        if ([value caseInsensitiveCompare:@"OneHour"] == NSOrderedSame) {
            return @(AWSFirehoseAmazonopensearchserviceIndexRotationPeriodOneHour);
        }
        if ([value caseInsensitiveCompare:@"OneDay"] == NSOrderedSame) {
            return @(AWSFirehoseAmazonopensearchserviceIndexRotationPeriodOneDay);
        }
        if ([value caseInsensitiveCompare:@"OneWeek"] == NSOrderedSame) {
            return @(AWSFirehoseAmazonopensearchserviceIndexRotationPeriodOneWeek);
        }
        if ([value caseInsensitiveCompare:@"OneMonth"] == NSOrderedSame) {
            return @(AWSFirehoseAmazonopensearchserviceIndexRotationPeriodOneMonth);
        }
        return @(AWSFirehoseAmazonopensearchserviceIndexRotationPeriodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseAmazonopensearchserviceIndexRotationPeriodNoRotation:
                return @"NoRotation";
            case AWSFirehoseAmazonopensearchserviceIndexRotationPeriodOneHour:
                return @"OneHour";
            case AWSFirehoseAmazonopensearchserviceIndexRotationPeriodOneDay:
                return @"OneDay";
            case AWSFirehoseAmazonopensearchserviceIndexRotationPeriodOneWeek:
                return @"OneWeek";
            case AWSFirehoseAmazonopensearchserviceIndexRotationPeriodOneMonth:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseAmazonopensearchserviceRetryOptions class]];
}

+ (NSValueTransformer *)s3BackupModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FailedDocumentsOnly"] == NSOrderedSame) {
            return @(AWSFirehoseAmazonopensearchserviceS3BackupModeFailedDocumentsOnly);
        }
        if ([value caseInsensitiveCompare:@"AllDocuments"] == NSOrderedSame) {
            return @(AWSFirehoseAmazonopensearchserviceS3BackupModeAllDocuments);
        }
        return @(AWSFirehoseAmazonopensearchserviceS3BackupModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseAmazonopensearchserviceS3BackupModeFailedDocumentsOnly:
                return @"FailedDocumentsOnly";
            case AWSFirehoseAmazonopensearchserviceS3BackupModeAllDocuments:
                return @"AllDocuments";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3DestinationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationDescription class]];
}

+ (NSValueTransformer *)vpcConfigurationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseVpcConfigurationDescription class]];
}

@end

@implementation AWSFirehoseAmazonopensearchserviceDestinationUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"clusterEndpoint" : @"ClusterEndpoint",
             @"documentIdOptions" : @"DocumentIdOptions",
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseAmazonopensearchserviceBufferingHints class]];
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)documentIdOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseDocumentIdOptions class]];
}

+ (NSValueTransformer *)indexRotationPeriodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NoRotation"] == NSOrderedSame) {
            return @(AWSFirehoseAmazonopensearchserviceIndexRotationPeriodNoRotation);
        }
        if ([value caseInsensitiveCompare:@"OneHour"] == NSOrderedSame) {
            return @(AWSFirehoseAmazonopensearchserviceIndexRotationPeriodOneHour);
        }
        if ([value caseInsensitiveCompare:@"OneDay"] == NSOrderedSame) {
            return @(AWSFirehoseAmazonopensearchserviceIndexRotationPeriodOneDay);
        }
        if ([value caseInsensitiveCompare:@"OneWeek"] == NSOrderedSame) {
            return @(AWSFirehoseAmazonopensearchserviceIndexRotationPeriodOneWeek);
        }
        if ([value caseInsensitiveCompare:@"OneMonth"] == NSOrderedSame) {
            return @(AWSFirehoseAmazonopensearchserviceIndexRotationPeriodOneMonth);
        }
        return @(AWSFirehoseAmazonopensearchserviceIndexRotationPeriodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseAmazonopensearchserviceIndexRotationPeriodNoRotation:
                return @"NoRotation";
            case AWSFirehoseAmazonopensearchserviceIndexRotationPeriodOneHour:
                return @"OneHour";
            case AWSFirehoseAmazonopensearchserviceIndexRotationPeriodOneDay:
                return @"OneDay";
            case AWSFirehoseAmazonopensearchserviceIndexRotationPeriodOneWeek:
                return @"OneWeek";
            case AWSFirehoseAmazonopensearchserviceIndexRotationPeriodOneMonth:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseAmazonopensearchserviceRetryOptions class]];
}

+ (NSValueTransformer *)s3UpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationUpdate class]];
}

@end

@implementation AWSFirehoseAmazonopensearchserviceRetryOptions

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInSeconds" : @"DurationInSeconds",
             };
}

@end

@implementation AWSFirehoseAuthenticationConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectivity" : @"Connectivity",
             @"roleARN" : @"RoleARN",
             };
}

+ (NSValueTransformer *)connectivityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUBLIC"] == NSOrderedSame) {
            return @(AWSFirehoseConnectivityPublic);
        }
        if ([value caseInsensitiveCompare:@"PRIVATE"] == NSOrderedSame) {
            return @(AWSFirehoseConnectivityPrivate);
        }
        return @(AWSFirehoseConnectivityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseConnectivityPublic:
                return @"PUBLIC";
            case AWSFirehoseConnectivityPrivate:
                return @"PRIVATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFirehoseBufferingHints

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"intervalInSeconds" : @"IntervalInSeconds",
             @"sizeInMBs" : @"SizeInMBs",
             };
}

@end

@implementation AWSFirehoseCloudWatchLoggingOptions

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"logGroupName" : @"LogGroupName",
             @"logStreamName" : @"LogStreamName",
             };
}

@end

@implementation AWSFirehoseReplicateCommand

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicateOptions" : @"CopyOptions",
             @"dataTableColumns" : @"DataTableColumns",
             @"dataTableName" : @"DataTableName",
             };
}

@end

@implementation AWSFirehoseCreateDeliveryStreamInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amazonOpenSearchServerlessDestinationConfiguration" : @"AmazonOpenSearchServerlessDestinationConfiguration",
             @"amazonopensearchserviceDestinationConfiguration" : @"AmazonopensearchserviceDestinationConfiguration",
             @"deliveryStreamEncryptionConfigurationInput" : @"DeliveryStreamEncryptionConfigurationInput",
             @"deliveryStreamName" : @"DeliveryStreamName",
             @"deliveryStreamType" : @"DeliveryStreamType",
             @"elasticsearchDestinationConfiguration" : @"ElasticsearchDestinationConfiguration",
             @"extendedS3DestinationConfiguration" : @"ExtendedS3DestinationConfiguration",
             @"httpEndpointDestinationConfiguration" : @"HttpEndpointDestinationConfiguration",
             @"kinesisStreamSourceConfiguration" : @"KinesisStreamSourceConfiguration",
             @"MSKSourceConfiguration" : @"MSKSourceConfiguration",
             @"redshiftDestinationConfiguration" : @"RedshiftDestinationConfiguration",
             @"s3DestinationConfiguration" : @"S3DestinationConfiguration",
             @"snowflakeDestinationConfiguration" : @"SnowflakeDestinationConfiguration",
             @"splunkDestinationConfiguration" : @"SplunkDestinationConfiguration",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)amazonOpenSearchServerlessDestinationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseAmazonOpenSearchServerlessDestinationConfiguration class]];
}

+ (NSValueTransformer *)amazonopensearchserviceDestinationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseAmazonopensearchserviceDestinationConfiguration class]];
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
        if ([value caseInsensitiveCompare:@"MSKAsSource"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamTypeMSKAsSource);
        }
        return @(AWSFirehoseDeliveryStreamTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseDeliveryStreamTypeDirectPut:
                return @"DirectPut";
            case AWSFirehoseDeliveryStreamTypeKinesisStreamAsSource:
                return @"KinesisStreamAsSource";
            case AWSFirehoseDeliveryStreamTypeMSKAsSource:
                return @"MSKAsSource";
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

+ (NSValueTransformer *)httpEndpointDestinationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseHttpEndpointDestinationConfiguration class]];
}

+ (NSValueTransformer *)kinesisStreamSourceConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseKinesisStreamSourceConfiguration class]];
}

+ (NSValueTransformer *)MSKSourceConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseMSKSourceConfiguration class]];
}

+ (NSValueTransformer *)redshiftDestinationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseRedshiftDestinationConfiguration class]];
}

+ (NSValueTransformer *)s3DestinationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationConfiguration class]];
}

+ (NSValueTransformer *)snowflakeDestinationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSnowflakeDestinationConfiguration class]];
}

+ (NSValueTransformer *)splunkDestinationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSplunkDestinationConfiguration class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFirehoseTag class]];
}

@end

@implementation AWSFirehoseCreateDeliveryStreamOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamARN" : @"DeliveryStreamARN",
             };
}

@end

@implementation AWSFirehoseDataFormatConversionConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowForceDelete" : @"AllowForceDelete",
             @"deliveryStreamName" : @"DeliveryStreamName",
             };
}

@end

@implementation AWSFirehoseDeleteDeliveryStreamOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSFirehoseDeliveryStreamDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"MSKAsSource"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamTypeMSKAsSource);
        }
        return @(AWSFirehoseDeliveryStreamTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseDeliveryStreamTypeDirectPut:
                return @"DirectPut";
            case AWSFirehoseDeliveryStreamTypeKinesisStreamAsSource:
                return @"KinesisStreamAsSource";
            case AWSFirehoseDeliveryStreamTypeMSKAsSource:
                return @"MSKAsSource";
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamName" : @"DeliveryStreamName",
             @"exclusiveStartDestinationId" : @"ExclusiveStartDestinationId",
             @"limit" : @"Limit",
             };
}

@end

@implementation AWSFirehoseDescribeDeliveryStreamOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amazonOpenSearchServerlessDestinationDescription" : @"AmazonOpenSearchServerlessDestinationDescription",
             @"amazonopensearchserviceDestinationDescription" : @"AmazonopensearchserviceDestinationDescription",
             @"destinationId" : @"DestinationId",
             @"elasticsearchDestinationDescription" : @"ElasticsearchDestinationDescription",
             @"extendedS3DestinationDescription" : @"ExtendedS3DestinationDescription",
             @"httpEndpointDestinationDescription" : @"HttpEndpointDestinationDescription",
             @"redshiftDestinationDescription" : @"RedshiftDestinationDescription",
             @"s3DestinationDescription" : @"S3DestinationDescription",
             @"snowflakeDestinationDescription" : @"SnowflakeDestinationDescription",
             @"splunkDestinationDescription" : @"SplunkDestinationDescription",
             };
}

+ (NSValueTransformer *)amazonOpenSearchServerlessDestinationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseAmazonOpenSearchServerlessDestinationDescription class]];
}

+ (NSValueTransformer *)amazonopensearchserviceDestinationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseAmazonopensearchserviceDestinationDescription class]];
}

+ (NSValueTransformer *)elasticsearchDestinationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseElasticsearchDestinationDescription class]];
}

+ (NSValueTransformer *)extendedS3DestinationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseExtendedS3DestinationDescription class]];
}

+ (NSValueTransformer *)httpEndpointDestinationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseHttpEndpointDestinationDescription class]];
}

+ (NSValueTransformer *)redshiftDestinationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseRedshiftDestinationDescription class]];
}

+ (NSValueTransformer *)s3DestinationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationDescription class]];
}

+ (NSValueTransformer *)snowflakeDestinationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSnowflakeDestinationDescription class]];
}

+ (NSValueTransformer *)splunkDestinationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSplunkDestinationDescription class]];
}

@end

@implementation AWSFirehoseDocumentIdOptions

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultDocumentIdFormat" : @"DefaultDocumentIdFormat",
             };
}

+ (NSValueTransformer *)defaultDocumentIdFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FIREHOSE_DEFAULT"] == NSOrderedSame) {
            return @(AWSFirehoseDefaultDocumentIdFormatFirehoseDefault);
        }
        if ([value caseInsensitiveCompare:@"NO_DOCUMENT_ID"] == NSOrderedSame) {
            return @(AWSFirehoseDefaultDocumentIdFormatNoDocumentId);
        }
        return @(AWSFirehoseDefaultDocumentIdFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseDefaultDocumentIdFormatFirehoseDefault:
                return @"FIREHOSE_DEFAULT";
            case AWSFirehoseDefaultDocumentIdFormatNoDocumentId:
                return @"NO_DOCUMENT_ID";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFirehoseDynamicPartitioningConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"retryOptions" : @"RetryOptions",
             };
}

+ (NSValueTransformer *)retryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseRetryOptions class]];
}

@end

@implementation AWSFirehoseElasticsearchBufferingHints

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"intervalInSeconds" : @"IntervalInSeconds",
             @"sizeInMBs" : @"SizeInMBs",
             };
}

@end

@implementation AWSFirehoseElasticsearchDestinationConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"clusterEndpoint" : @"ClusterEndpoint",
             @"documentIdOptions" : @"DocumentIdOptions",
             @"domainARN" : @"DomainARN",
             @"indexName" : @"IndexName",
             @"indexRotationPeriod" : @"IndexRotationPeriod",
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"retryOptions" : @"RetryOptions",
             @"roleARN" : @"RoleARN",
             @"s3BackupMode" : @"S3BackupMode",
             @"s3Configuration" : @"S3Configuration",
             @"typeName" : @"TypeName",
             @"vpcConfiguration" : @"VpcConfiguration",
             };
}

+ (NSValueTransformer *)bufferingHintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseElasticsearchBufferingHints class]];
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)documentIdOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseDocumentIdOptions class]];
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

+ (NSValueTransformer *)vpcConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseVpcConfiguration class]];
}

@end

@implementation AWSFirehoseElasticsearchDestinationDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"clusterEndpoint" : @"ClusterEndpoint",
             @"documentIdOptions" : @"DocumentIdOptions",
             @"domainARN" : @"DomainARN",
             @"indexName" : @"IndexName",
             @"indexRotationPeriod" : @"IndexRotationPeriod",
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"retryOptions" : @"RetryOptions",
             @"roleARN" : @"RoleARN",
             @"s3BackupMode" : @"S3BackupMode",
             @"s3DestinationDescription" : @"S3DestinationDescription",
             @"typeName" : @"TypeName",
             @"vpcConfigurationDescription" : @"VpcConfigurationDescription",
             };
}

+ (NSValueTransformer *)bufferingHintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseElasticsearchBufferingHints class]];
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)documentIdOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseDocumentIdOptions class]];
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

+ (NSValueTransformer *)vpcConfigurationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseVpcConfigurationDescription class]];
}

@end

@implementation AWSFirehoseElasticsearchDestinationUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"clusterEndpoint" : @"ClusterEndpoint",
             @"documentIdOptions" : @"DocumentIdOptions",
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

+ (NSValueTransformer *)documentIdOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseDocumentIdOptions class]];
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInSeconds" : @"DurationInSeconds",
             };
}

@end

@implementation AWSFirehoseEncryptionConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketARN" : @"BucketARN",
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"compressionFormat" : @"CompressionFormat",
             @"customTimeZone" : @"CustomTimeZone",
             @"dataFormatConversionConfiguration" : @"DataFormatConversionConfiguration",
             @"dynamicPartitioningConfiguration" : @"DynamicPartitioningConfiguration",
             @"encryptionConfiguration" : @"EncryptionConfiguration",
             @"errorOutputPrefix" : @"ErrorOutputPrefix",
             @"fileExtension" : @"FileExtension",
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
        if ([value caseInsensitiveCompare:@"HADOOP_SNAPPY"] == NSOrderedSame) {
            return @(AWSFirehoseCompressionFormatHadoopSnappy);
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
            case AWSFirehoseCompressionFormatHadoopSnappy:
                return @"HADOOP_SNAPPY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dataFormatConversionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseDataFormatConversionConfiguration class]];
}

+ (NSValueTransformer *)dynamicPartitioningConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseDynamicPartitioningConfiguration class]];
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketARN" : @"BucketARN",
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"compressionFormat" : @"CompressionFormat",
             @"customTimeZone" : @"CustomTimeZone",
             @"dataFormatConversionConfiguration" : @"DataFormatConversionConfiguration",
             @"dynamicPartitioningConfiguration" : @"DynamicPartitioningConfiguration",
             @"encryptionConfiguration" : @"EncryptionConfiguration",
             @"errorOutputPrefix" : @"ErrorOutputPrefix",
             @"fileExtension" : @"FileExtension",
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
        if ([value caseInsensitiveCompare:@"HADOOP_SNAPPY"] == NSOrderedSame) {
            return @(AWSFirehoseCompressionFormatHadoopSnappy);
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
            case AWSFirehoseCompressionFormatHadoopSnappy:
                return @"HADOOP_SNAPPY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dataFormatConversionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseDataFormatConversionConfiguration class]];
}

+ (NSValueTransformer *)dynamicPartitioningConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseDynamicPartitioningConfiguration class]];
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketARN" : @"BucketARN",
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"compressionFormat" : @"CompressionFormat",
             @"customTimeZone" : @"CustomTimeZone",
             @"dataFormatConversionConfiguration" : @"DataFormatConversionConfiguration",
             @"dynamicPartitioningConfiguration" : @"DynamicPartitioningConfiguration",
             @"encryptionConfiguration" : @"EncryptionConfiguration",
             @"errorOutputPrefix" : @"ErrorOutputPrefix",
             @"fileExtension" : @"FileExtension",
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
        if ([value caseInsensitiveCompare:@"HADOOP_SNAPPY"] == NSOrderedSame) {
            return @(AWSFirehoseCompressionFormatHadoopSnappy);
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
            case AWSFirehoseCompressionFormatHadoopSnappy:
                return @"HADOOP_SNAPPY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dataFormatConversionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseDataFormatConversionConfiguration class]];
}

+ (NSValueTransformer *)dynamicPartitioningConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseDynamicPartitioningConfiguration class]];
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"CREATE_ENI_FAILED"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamFailureTypeCreateEniFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETE_ENI_FAILED"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamFailureTypeDeleteEniFailed);
        }
        if ([value caseInsensitiveCompare:@"SUBNET_NOT_FOUND"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamFailureTypeSubnetNotFound);
        }
        if ([value caseInsensitiveCompare:@"SECURITY_GROUP_NOT_FOUND"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamFailureTypeSecurityGroupNotFound);
        }
        if ([value caseInsensitiveCompare:@"ENI_ACCESS_DENIED"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamFailureTypeEniAccessDenied);
        }
        if ([value caseInsensitiveCompare:@"SUBNET_ACCESS_DENIED"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamFailureTypeSubnetAccessDenied);
        }
        if ([value caseInsensitiveCompare:@"SECURITY_GROUP_ACCESS_DENIED"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamFailureTypeSecurityGroupAccessDenied);
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
            case AWSFirehoseDeliveryStreamFailureTypeCreateEniFailed:
                return @"CREATE_ENI_FAILED";
            case AWSFirehoseDeliveryStreamFailureTypeDeleteEniFailed:
                return @"DELETE_ENI_FAILED";
            case AWSFirehoseDeliveryStreamFailureTypeSubnetNotFound:
                return @"SUBNET_NOT_FOUND";
            case AWSFirehoseDeliveryStreamFailureTypeSecurityGroupNotFound:
                return @"SECURITY_GROUP_NOT_FOUND";
            case AWSFirehoseDeliveryStreamFailureTypeEniAccessDenied:
                return @"ENI_ACCESS_DENIED";
            case AWSFirehoseDeliveryStreamFailureTypeSubnetAccessDenied:
                return @"SUBNET_ACCESS_DENIED";
            case AWSFirehoseDeliveryStreamFailureTypeSecurityGroupAccessDenied:
                return @"SECURITY_GROUP_ACCESS_DENIED";
            case AWSFirehoseDeliveryStreamFailureTypeUnknownError:
                return @"UNKNOWN_ERROR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFirehoseHiveJsonSerDe

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"timestampFormats" : @"TimestampFormats",
             };
}

@end

@implementation AWSFirehoseHttpEndpointBufferingHints

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"intervalInSeconds" : @"IntervalInSeconds",
             @"sizeInMBs" : @"SizeInMBs",
             };
}

@end

@implementation AWSFirehoseHttpEndpointCommonAttribute

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"attributeValue" : @"AttributeValue",
             };
}

@end

@implementation AWSFirehoseHttpEndpointConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessKey" : @"AccessKey",
             @"name" : @"Name",
             @"url" : @"Url",
             };
}

@end

@implementation AWSFirehoseHttpEndpointDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"url" : @"Url",
             };
}

@end

@implementation AWSFirehoseHttpEndpointDestinationConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"endpointConfiguration" : @"EndpointConfiguration",
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"requestConfiguration" : @"RequestConfiguration",
             @"retryOptions" : @"RetryOptions",
             @"roleARN" : @"RoleARN",
             @"s3BackupMode" : @"S3BackupMode",
             @"s3Configuration" : @"S3Configuration",
             @"secretsManagerConfiguration" : @"SecretsManagerConfiguration",
             };
}

+ (NSValueTransformer *)bufferingHintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseHttpEndpointBufferingHints class]];
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)endpointConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseHttpEndpointConfiguration class]];
}

+ (NSValueTransformer *)processingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseProcessingConfiguration class]];
}

+ (NSValueTransformer *)requestConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseHttpEndpointRequestConfiguration class]];
}

+ (NSValueTransformer *)retryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseHttpEndpointRetryOptions class]];
}

+ (NSValueTransformer *)s3BackupModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FailedDataOnly"] == NSOrderedSame) {
            return @(AWSFirehoseHttpEndpointS3BackupModeFailedDataOnly);
        }
        if ([value caseInsensitiveCompare:@"AllData"] == NSOrderedSame) {
            return @(AWSFirehoseHttpEndpointS3BackupModeAllData);
        }
        return @(AWSFirehoseHttpEndpointS3BackupModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseHttpEndpointS3BackupModeFailedDataOnly:
                return @"FailedDataOnly";
            case AWSFirehoseHttpEndpointS3BackupModeAllData:
                return @"AllData";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3ConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationConfiguration class]];
}

+ (NSValueTransformer *)secretsManagerConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSecretsManagerConfiguration class]];
}

@end

@implementation AWSFirehoseHttpEndpointDestinationDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"endpointConfiguration" : @"EndpointConfiguration",
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"requestConfiguration" : @"RequestConfiguration",
             @"retryOptions" : @"RetryOptions",
             @"roleARN" : @"RoleARN",
             @"s3BackupMode" : @"S3BackupMode",
             @"s3DestinationDescription" : @"S3DestinationDescription",
             @"secretsManagerConfiguration" : @"SecretsManagerConfiguration",
             };
}

+ (NSValueTransformer *)bufferingHintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseHttpEndpointBufferingHints class]];
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)endpointConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseHttpEndpointDescription class]];
}

+ (NSValueTransformer *)processingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseProcessingConfiguration class]];
}

+ (NSValueTransformer *)requestConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseHttpEndpointRequestConfiguration class]];
}

+ (NSValueTransformer *)retryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseHttpEndpointRetryOptions class]];
}

+ (NSValueTransformer *)s3BackupModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FailedDataOnly"] == NSOrderedSame) {
            return @(AWSFirehoseHttpEndpointS3BackupModeFailedDataOnly);
        }
        if ([value caseInsensitiveCompare:@"AllData"] == NSOrderedSame) {
            return @(AWSFirehoseHttpEndpointS3BackupModeAllData);
        }
        return @(AWSFirehoseHttpEndpointS3BackupModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseHttpEndpointS3BackupModeFailedDataOnly:
                return @"FailedDataOnly";
            case AWSFirehoseHttpEndpointS3BackupModeAllData:
                return @"AllData";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3DestinationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationDescription class]];
}

+ (NSValueTransformer *)secretsManagerConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSecretsManagerConfiguration class]];
}

@end

@implementation AWSFirehoseHttpEndpointDestinationUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"endpointConfiguration" : @"EndpointConfiguration",
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"requestConfiguration" : @"RequestConfiguration",
             @"retryOptions" : @"RetryOptions",
             @"roleARN" : @"RoleARN",
             @"s3BackupMode" : @"S3BackupMode",
             @"s3Update" : @"S3Update",
             @"secretsManagerConfiguration" : @"SecretsManagerConfiguration",
             };
}

+ (NSValueTransformer *)bufferingHintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseHttpEndpointBufferingHints class]];
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)endpointConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseHttpEndpointConfiguration class]];
}

+ (NSValueTransformer *)processingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseProcessingConfiguration class]];
}

+ (NSValueTransformer *)requestConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseHttpEndpointRequestConfiguration class]];
}

+ (NSValueTransformer *)retryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseHttpEndpointRetryOptions class]];
}

+ (NSValueTransformer *)s3BackupModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FailedDataOnly"] == NSOrderedSame) {
            return @(AWSFirehoseHttpEndpointS3BackupModeFailedDataOnly);
        }
        if ([value caseInsensitiveCompare:@"AllData"] == NSOrderedSame) {
            return @(AWSFirehoseHttpEndpointS3BackupModeAllData);
        }
        return @(AWSFirehoseHttpEndpointS3BackupModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseHttpEndpointS3BackupModeFailedDataOnly:
                return @"FailedDataOnly";
            case AWSFirehoseHttpEndpointS3BackupModeAllData:
                return @"AllData";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3UpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationUpdate class]];
}

+ (NSValueTransformer *)secretsManagerConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSecretsManagerConfiguration class]];
}

@end

@implementation AWSFirehoseHttpEndpointRequestConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commonAttributes" : @"CommonAttributes",
             @"contentEncoding" : @"ContentEncoding",
             };
}

+ (NSValueTransformer *)commonAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFirehoseHttpEndpointCommonAttribute class]];
}

+ (NSValueTransformer *)contentEncodingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSFirehoseContentEncodingNone);
        }
        if ([value caseInsensitiveCompare:@"GZIP"] == NSOrderedSame) {
            return @(AWSFirehoseContentEncodingGzip);
        }
        return @(AWSFirehoseContentEncodingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseContentEncodingNone:
                return @"NONE";
            case AWSFirehoseContentEncodingGzip:
                return @"GZIP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFirehoseHttpEndpointRetryOptions

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInSeconds" : @"DurationInSeconds",
             };
}

@end

@implementation AWSFirehoseInputFormatConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"AWSKMSKeyARN" : @"AWSKMSKeyARN",
             };
}

@end

@implementation AWSFirehoseKinesisStreamSourceConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kinesisStreamARN" : @"KinesisStreamARN",
             @"roleARN" : @"RoleARN",
             };
}

@end

@implementation AWSFirehoseKinesisStreamSourceDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"MSKAsSource"] == NSOrderedSame) {
            return @(AWSFirehoseDeliveryStreamTypeMSKAsSource);
        }
        return @(AWSFirehoseDeliveryStreamTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseDeliveryStreamTypeDirectPut:
                return @"DirectPut";
            case AWSFirehoseDeliveryStreamTypeKinesisStreamAsSource:
                return @"KinesisStreamAsSource";
            case AWSFirehoseDeliveryStreamTypeMSKAsSource:
                return @"MSKAsSource";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFirehoseListDeliveryStreamsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamNames" : @"DeliveryStreamNames",
             @"hasMoreDeliveryStreams" : @"HasMoreDeliveryStreams",
             };
}

@end

@implementation AWSFirehoseListTagsForDeliveryStreamInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamName" : @"DeliveryStreamName",
             @"exclusiveStartTagKey" : @"ExclusiveStartTagKey",
             @"limit" : @"Limit",
             };
}

@end

@implementation AWSFirehoseListTagsForDeliveryStreamOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSFirehoseMSKSourceConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authenticationConfiguration" : @"AuthenticationConfiguration",
             @"MSKClusterARN" : @"MSKClusterARN",
             @"topicName" : @"TopicName",
             };
}

+ (NSValueTransformer *)authenticationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseAuthenticationConfiguration class]];
}

@end

@implementation AWSFirehoseMSKSourceDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authenticationConfiguration" : @"AuthenticationConfiguration",
             @"deliveryStartTimestamp" : @"DeliveryStartTimestamp",
             @"MSKClusterARN" : @"MSKClusterARN",
             @"topicName" : @"TopicName",
             };
}

+ (NSValueTransformer *)authenticationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseAuthenticationConfiguration class]];
}

+ (NSValueTransformer *)deliveryStartTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSFirehoseOpenXJsonSerDe

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"caseInsensitive" : @"CaseInsensitive",
             @"columnToJsonKeyMappings" : @"ColumnToJsonKeyMappings",
             @"convertDotsInJsonKeysToUnderscores" : @"ConvertDotsInJsonKeysToUnderscores",
             };
}

@end

@implementation AWSFirehoseOrcSerDe

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"RecordDeAggregation"] == NSOrderedSame) {
            return @(AWSFirehoseProcessorTypeRecordDeAggregation);
        }
        if ([value caseInsensitiveCompare:@"Decompression"] == NSOrderedSame) {
            return @(AWSFirehoseProcessorTypeDecompression);
        }
        if ([value caseInsensitiveCompare:@"CloudWatchLogProcessing"] == NSOrderedSame) {
            return @(AWSFirehoseProcessorTypeCloudWatchLogProcessing);
        }
        if ([value caseInsensitiveCompare:@"Lambda"] == NSOrderedSame) {
            return @(AWSFirehoseProcessorTypeLambda);
        }
        if ([value caseInsensitiveCompare:@"MetadataExtraction"] == NSOrderedSame) {
            return @(AWSFirehoseProcessorTypeMetadataExtraction);
        }
        if ([value caseInsensitiveCompare:@"AppendDelimiterToRecord"] == NSOrderedSame) {
            return @(AWSFirehoseProcessorTypeAppendDelimiterToRecord);
        }
        return @(AWSFirehoseProcessorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseProcessorTypeRecordDeAggregation:
                return @"RecordDeAggregation";
            case AWSFirehoseProcessorTypeDecompression:
                return @"Decompression";
            case AWSFirehoseProcessorTypeCloudWatchLogProcessing:
                return @"CloudWatchLogProcessing";
            case AWSFirehoseProcessorTypeLambda:
                return @"Lambda";
            case AWSFirehoseProcessorTypeMetadataExtraction:
                return @"MetadataExtraction";
            case AWSFirehoseProcessorTypeAppendDelimiterToRecord:
                return @"AppendDelimiterToRecord";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFirehoseProcessorParameter

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"MetadataExtractionQuery"] == NSOrderedSame) {
            return @(AWSFirehoseProcessorParameterNameMetadataExtractionQuery);
        }
        if ([value caseInsensitiveCompare:@"JsonParsingEngine"] == NSOrderedSame) {
            return @(AWSFirehoseProcessorParameterNameJsonParsingEngine);
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
        if ([value caseInsensitiveCompare:@"SubRecordType"] == NSOrderedSame) {
            return @(AWSFirehoseProcessorParameterNameSubRecordType);
        }
        if ([value caseInsensitiveCompare:@"Delimiter"] == NSOrderedSame) {
            return @(AWSFirehoseProcessorParameterNameDelimiter);
        }
        if ([value caseInsensitiveCompare:@"CompressionFormat"] == NSOrderedSame) {
            return @(AWSFirehoseProcessorParameterNameCompressionFormat);
        }
        if ([value caseInsensitiveCompare:@"DataMessageExtraction"] == NSOrderedSame) {
            return @(AWSFirehoseProcessorParameterNameDataMessageExtraction);
        }
        return @(AWSFirehoseProcessorParameterNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseProcessorParameterNameLambdaArn:
                return @"LambdaArn";
            case AWSFirehoseProcessorParameterNameNumberOfRetries:
                return @"NumberOfRetries";
            case AWSFirehoseProcessorParameterNameMetadataExtractionQuery:
                return @"MetadataExtractionQuery";
            case AWSFirehoseProcessorParameterNameJsonParsingEngine:
                return @"JsonParsingEngine";
            case AWSFirehoseProcessorParameterNameRoleArn:
                return @"RoleArn";
            case AWSFirehoseProcessorParameterNameBufferSizeInMBs:
                return @"BufferSizeInMBs";
            case AWSFirehoseProcessorParameterNameBufferIntervalInSeconds:
                return @"BufferIntervalInSeconds";
            case AWSFirehoseProcessorParameterNameSubRecordType:
                return @"SubRecordType";
            case AWSFirehoseProcessorParameterNameDelimiter:
                return @"Delimiter";
            case AWSFirehoseProcessorParameterNameCompressionFormat:
                return @"CompressionFormat";
            case AWSFirehoseProcessorParameterNameDataMessageExtraction:
                return @"DataMessageExtraction";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFirehosePutRecordBatchInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"recordId" : @"RecordId",
             };
}

@end

@implementation AWSFirehosePutRecordInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encrypted" : @"Encrypted",
             @"recordId" : @"RecordId",
             };
}

@end

@implementation AWSFirehoseRecord

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"Data",
             };
}

@end

@implementation AWSFirehoseRedshiftDestinationConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
             @"secretsManagerConfiguration" : @"SecretsManagerConfiguration",
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

+ (NSValueTransformer *)secretsManagerConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSecretsManagerConfiguration class]];
}

@end

@implementation AWSFirehoseRedshiftDestinationDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
             @"secretsManagerConfiguration" : @"SecretsManagerConfiguration",
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

+ (NSValueTransformer *)secretsManagerConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSecretsManagerConfiguration class]];
}

@end

@implementation AWSFirehoseRedshiftDestinationUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
             @"secretsManagerConfiguration" : @"SecretsManagerConfiguration",
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

+ (NSValueTransformer *)secretsManagerConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSecretsManagerConfiguration class]];
}

@end

@implementation AWSFirehoseRedshiftRetryOptions

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInSeconds" : @"DurationInSeconds",
             };
}

@end

@implementation AWSFirehoseRetryOptions

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInSeconds" : @"DurationInSeconds",
             };
}

@end

@implementation AWSFirehoseS3DestinationConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"HADOOP_SNAPPY"] == NSOrderedSame) {
            return @(AWSFirehoseCompressionFormatHadoopSnappy);
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
            case AWSFirehoseCompressionFormatHadoopSnappy:
                return @"HADOOP_SNAPPY";
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"HADOOP_SNAPPY"] == NSOrderedSame) {
            return @(AWSFirehoseCompressionFormatHadoopSnappy);
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
            case AWSFirehoseCompressionFormatHadoopSnappy:
                return @"HADOOP_SNAPPY";
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"HADOOP_SNAPPY"] == NSOrderedSame) {
            return @(AWSFirehoseCompressionFormatHadoopSnappy);
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
            case AWSFirehoseCompressionFormatHadoopSnappy:
                return @"HADOOP_SNAPPY";
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSFirehoseSecretsManagerConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"roleARN" : @"RoleARN",
             @"secretARN" : @"SecretARN",
             };
}

@end

@implementation AWSFirehoseSerializer

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSFirehoseSnowflakeDestinationConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountUrl" : @"AccountUrl",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"contentColumnName" : @"ContentColumnName",
             @"dataLoadingOption" : @"DataLoadingOption",
             @"database" : @"Database",
             @"keyPassphrase" : @"KeyPassphrase",
             @"metaDataColumnName" : @"MetaDataColumnName",
             @"privateKey" : @"PrivateKey",
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"retryOptions" : @"RetryOptions",
             @"roleARN" : @"RoleARN",
             @"s3BackupMode" : @"S3BackupMode",
             @"s3Configuration" : @"S3Configuration",
             @"schema" : @"Schema",
             @"secretsManagerConfiguration" : @"SecretsManagerConfiguration",
             @"snowflakeRoleConfiguration" : @"SnowflakeRoleConfiguration",
             @"snowflakeVpcConfiguration" : @"SnowflakeVpcConfiguration",
             @"table" : @"Table",
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)dataLoadingOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"JSON_MAPPING"] == NSOrderedSame) {
            return @(AWSFirehoseSnowflakeDataLoadingOptionJsonMapping);
        }
        if ([value caseInsensitiveCompare:@"VARIANT_CONTENT_MAPPING"] == NSOrderedSame) {
            return @(AWSFirehoseSnowflakeDataLoadingOptionVariantContentMapping);
        }
        if ([value caseInsensitiveCompare:@"VARIANT_CONTENT_AND_METADATA_MAPPING"] == NSOrderedSame) {
            return @(AWSFirehoseSnowflakeDataLoadingOptionVariantContentAndMetadataMapping);
        }
        return @(AWSFirehoseSnowflakeDataLoadingOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseSnowflakeDataLoadingOptionJsonMapping:
                return @"JSON_MAPPING";
            case AWSFirehoseSnowflakeDataLoadingOptionVariantContentMapping:
                return @"VARIANT_CONTENT_MAPPING";
            case AWSFirehoseSnowflakeDataLoadingOptionVariantContentAndMetadataMapping:
                return @"VARIANT_CONTENT_AND_METADATA_MAPPING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)processingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseProcessingConfiguration class]];
}

+ (NSValueTransformer *)retryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSnowflakeRetryOptions class]];
}

+ (NSValueTransformer *)s3BackupModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FailedDataOnly"] == NSOrderedSame) {
            return @(AWSFirehoseSnowflakeS3BackupModeFailedDataOnly);
        }
        if ([value caseInsensitiveCompare:@"AllData"] == NSOrderedSame) {
            return @(AWSFirehoseSnowflakeS3BackupModeAllData);
        }
        return @(AWSFirehoseSnowflakeS3BackupModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseSnowflakeS3BackupModeFailedDataOnly:
                return @"FailedDataOnly";
            case AWSFirehoseSnowflakeS3BackupModeAllData:
                return @"AllData";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3ConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationConfiguration class]];
}

+ (NSValueTransformer *)secretsManagerConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSecretsManagerConfiguration class]];
}

+ (NSValueTransformer *)snowflakeRoleConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSnowflakeRoleConfiguration class]];
}

+ (NSValueTransformer *)snowflakeVpcConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSnowflakeVpcConfiguration class]];
}

@end

@implementation AWSFirehoseSnowflakeDestinationDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountUrl" : @"AccountUrl",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"contentColumnName" : @"ContentColumnName",
             @"dataLoadingOption" : @"DataLoadingOption",
             @"database" : @"Database",
             @"metaDataColumnName" : @"MetaDataColumnName",
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"retryOptions" : @"RetryOptions",
             @"roleARN" : @"RoleARN",
             @"s3BackupMode" : @"S3BackupMode",
             @"s3DestinationDescription" : @"S3DestinationDescription",
             @"schema" : @"Schema",
             @"secretsManagerConfiguration" : @"SecretsManagerConfiguration",
             @"snowflakeRoleConfiguration" : @"SnowflakeRoleConfiguration",
             @"snowflakeVpcConfiguration" : @"SnowflakeVpcConfiguration",
             @"table" : @"Table",
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)dataLoadingOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"JSON_MAPPING"] == NSOrderedSame) {
            return @(AWSFirehoseSnowflakeDataLoadingOptionJsonMapping);
        }
        if ([value caseInsensitiveCompare:@"VARIANT_CONTENT_MAPPING"] == NSOrderedSame) {
            return @(AWSFirehoseSnowflakeDataLoadingOptionVariantContentMapping);
        }
        if ([value caseInsensitiveCompare:@"VARIANT_CONTENT_AND_METADATA_MAPPING"] == NSOrderedSame) {
            return @(AWSFirehoseSnowflakeDataLoadingOptionVariantContentAndMetadataMapping);
        }
        return @(AWSFirehoseSnowflakeDataLoadingOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseSnowflakeDataLoadingOptionJsonMapping:
                return @"JSON_MAPPING";
            case AWSFirehoseSnowflakeDataLoadingOptionVariantContentMapping:
                return @"VARIANT_CONTENT_MAPPING";
            case AWSFirehoseSnowflakeDataLoadingOptionVariantContentAndMetadataMapping:
                return @"VARIANT_CONTENT_AND_METADATA_MAPPING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)processingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseProcessingConfiguration class]];
}

+ (NSValueTransformer *)retryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSnowflakeRetryOptions class]];
}

+ (NSValueTransformer *)s3BackupModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FailedDataOnly"] == NSOrderedSame) {
            return @(AWSFirehoseSnowflakeS3BackupModeFailedDataOnly);
        }
        if ([value caseInsensitiveCompare:@"AllData"] == NSOrderedSame) {
            return @(AWSFirehoseSnowflakeS3BackupModeAllData);
        }
        return @(AWSFirehoseSnowflakeS3BackupModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseSnowflakeS3BackupModeFailedDataOnly:
                return @"FailedDataOnly";
            case AWSFirehoseSnowflakeS3BackupModeAllData:
                return @"AllData";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3DestinationDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationDescription class]];
}

+ (NSValueTransformer *)secretsManagerConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSecretsManagerConfiguration class]];
}

+ (NSValueTransformer *)snowflakeRoleConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSnowflakeRoleConfiguration class]];
}

+ (NSValueTransformer *)snowflakeVpcConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSnowflakeVpcConfiguration class]];
}

@end

@implementation AWSFirehoseSnowflakeDestinationUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountUrl" : @"AccountUrl",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"contentColumnName" : @"ContentColumnName",
             @"dataLoadingOption" : @"DataLoadingOption",
             @"database" : @"Database",
             @"keyPassphrase" : @"KeyPassphrase",
             @"metaDataColumnName" : @"MetaDataColumnName",
             @"privateKey" : @"PrivateKey",
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"retryOptions" : @"RetryOptions",
             @"roleARN" : @"RoleARN",
             @"s3BackupMode" : @"S3BackupMode",
             @"s3Update" : @"S3Update",
             @"schema" : @"Schema",
             @"secretsManagerConfiguration" : @"SecretsManagerConfiguration",
             @"snowflakeRoleConfiguration" : @"SnowflakeRoleConfiguration",
             @"table" : @"Table",
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)cloudWatchLoggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

+ (NSValueTransformer *)dataLoadingOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"JSON_MAPPING"] == NSOrderedSame) {
            return @(AWSFirehoseSnowflakeDataLoadingOptionJsonMapping);
        }
        if ([value caseInsensitiveCompare:@"VARIANT_CONTENT_MAPPING"] == NSOrderedSame) {
            return @(AWSFirehoseSnowflakeDataLoadingOptionVariantContentMapping);
        }
        if ([value caseInsensitiveCompare:@"VARIANT_CONTENT_AND_METADATA_MAPPING"] == NSOrderedSame) {
            return @(AWSFirehoseSnowflakeDataLoadingOptionVariantContentAndMetadataMapping);
        }
        return @(AWSFirehoseSnowflakeDataLoadingOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseSnowflakeDataLoadingOptionJsonMapping:
                return @"JSON_MAPPING";
            case AWSFirehoseSnowflakeDataLoadingOptionVariantContentMapping:
                return @"VARIANT_CONTENT_MAPPING";
            case AWSFirehoseSnowflakeDataLoadingOptionVariantContentAndMetadataMapping:
                return @"VARIANT_CONTENT_AND_METADATA_MAPPING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)processingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseProcessingConfiguration class]];
}

+ (NSValueTransformer *)retryOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSnowflakeRetryOptions class]];
}

+ (NSValueTransformer *)s3BackupModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FailedDataOnly"] == NSOrderedSame) {
            return @(AWSFirehoseSnowflakeS3BackupModeFailedDataOnly);
        }
        if ([value caseInsensitiveCompare:@"AllData"] == NSOrderedSame) {
            return @(AWSFirehoseSnowflakeS3BackupModeAllData);
        }
        return @(AWSFirehoseSnowflakeS3BackupModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFirehoseSnowflakeS3BackupModeFailedDataOnly:
                return @"FailedDataOnly";
            case AWSFirehoseSnowflakeS3BackupModeAllData:
                return @"AllData";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3UpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationUpdate class]];
}

+ (NSValueTransformer *)secretsManagerConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSecretsManagerConfiguration class]];
}

+ (NSValueTransformer *)snowflakeRoleConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSnowflakeRoleConfiguration class]];
}

@end

@implementation AWSFirehoseSnowflakeRetryOptions

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInSeconds" : @"DurationInSeconds",
             };
}

@end

@implementation AWSFirehoseSnowflakeRoleConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"snowflakeRole" : @"SnowflakeRole",
             };
}

@end

@implementation AWSFirehoseSnowflakeVpcConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"privateLinkVpceId" : @"PrivateLinkVpceId",
             };
}

@end

@implementation AWSFirehoseSourceDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kinesisStreamSourceDescription" : @"KinesisStreamSourceDescription",
             @"MSKSourceDescription" : @"MSKSourceDescription",
             };
}

+ (NSValueTransformer *)kinesisStreamSourceDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseKinesisStreamSourceDescription class]];
}

+ (NSValueTransformer *)MSKSourceDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseMSKSourceDescription class]];
}

@end

@implementation AWSFirehoseSplunkBufferingHints

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"intervalInSeconds" : @"IntervalInSeconds",
             @"sizeInMBs" : @"SizeInMBs",
             };
}

@end

@implementation AWSFirehoseSplunkDestinationConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"HECAcknowledgmentTimeoutInSeconds" : @"HECAcknowledgmentTimeoutInSeconds",
             @"HECEndpoint" : @"HECEndpoint",
             @"HECEndpointType" : @"HECEndpointType",
             @"HECToken" : @"HECToken",
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"retryOptions" : @"RetryOptions",
             @"s3BackupMode" : @"S3BackupMode",
             @"s3Configuration" : @"S3Configuration",
             @"secretsManagerConfiguration" : @"SecretsManagerConfiguration",
             };
}

+ (NSValueTransformer *)bufferingHintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSplunkBufferingHints class]];
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

+ (NSValueTransformer *)secretsManagerConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSecretsManagerConfiguration class]];
}

@end

@implementation AWSFirehoseSplunkDestinationDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"HECAcknowledgmentTimeoutInSeconds" : @"HECAcknowledgmentTimeoutInSeconds",
             @"HECEndpoint" : @"HECEndpoint",
             @"HECEndpointType" : @"HECEndpointType",
             @"HECToken" : @"HECToken",
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"retryOptions" : @"RetryOptions",
             @"s3BackupMode" : @"S3BackupMode",
             @"s3DestinationDescription" : @"S3DestinationDescription",
             @"secretsManagerConfiguration" : @"SecretsManagerConfiguration",
             };
}

+ (NSValueTransformer *)bufferingHintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSplunkBufferingHints class]];
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

+ (NSValueTransformer *)secretsManagerConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSecretsManagerConfiguration class]];
}

@end

@implementation AWSFirehoseSplunkDestinationUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bufferingHints" : @"BufferingHints",
             @"cloudWatchLoggingOptions" : @"CloudWatchLoggingOptions",
             @"HECAcknowledgmentTimeoutInSeconds" : @"HECAcknowledgmentTimeoutInSeconds",
             @"HECEndpoint" : @"HECEndpoint",
             @"HECEndpointType" : @"HECEndpointType",
             @"HECToken" : @"HECToken",
             @"processingConfiguration" : @"ProcessingConfiguration",
             @"retryOptions" : @"RetryOptions",
             @"s3BackupMode" : @"S3BackupMode",
             @"s3Update" : @"S3Update",
             @"secretsManagerConfiguration" : @"SecretsManagerConfiguration",
             };
}

+ (NSValueTransformer *)bufferingHintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSplunkBufferingHints class]];
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

+ (NSValueTransformer *)secretsManagerConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSecretsManagerConfiguration class]];
}

@end

@implementation AWSFirehoseSplunkRetryOptions

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInSeconds" : @"DurationInSeconds",
             };
}

@end

@implementation AWSFirehoseStartDeliveryStreamEncryptionInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSFirehoseStopDeliveryStreamEncryptionInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamName" : @"DeliveryStreamName",
             };
}

@end

@implementation AWSFirehoseStopDeliveryStreamEncryptionOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSFirehoseTag

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

@implementation AWSFirehoseTagDeliveryStreamInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSFirehoseUntagDeliveryStreamInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamName" : @"DeliveryStreamName",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSFirehoseUntagDeliveryStreamOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSFirehoseUpdateDestinationInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amazonOpenSearchServerlessDestinationUpdate" : @"AmazonOpenSearchServerlessDestinationUpdate",
             @"amazonopensearchserviceDestinationUpdate" : @"AmazonopensearchserviceDestinationUpdate",
             @"currentDeliveryStreamVersionId" : @"CurrentDeliveryStreamVersionId",
             @"deliveryStreamName" : @"DeliveryStreamName",
             @"destinationId" : @"DestinationId",
             @"elasticsearchDestinationUpdate" : @"ElasticsearchDestinationUpdate",
             @"extendedS3DestinationUpdate" : @"ExtendedS3DestinationUpdate",
             @"httpEndpointDestinationUpdate" : @"HttpEndpointDestinationUpdate",
             @"redshiftDestinationUpdate" : @"RedshiftDestinationUpdate",
             @"s3DestinationUpdate" : @"S3DestinationUpdate",
             @"snowflakeDestinationUpdate" : @"SnowflakeDestinationUpdate",
             @"splunkDestinationUpdate" : @"SplunkDestinationUpdate",
             };
}

+ (NSValueTransformer *)amazonOpenSearchServerlessDestinationUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseAmazonOpenSearchServerlessDestinationUpdate class]];
}

+ (NSValueTransformer *)amazonopensearchserviceDestinationUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseAmazonopensearchserviceDestinationUpdate class]];
}

+ (NSValueTransformer *)elasticsearchDestinationUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseElasticsearchDestinationUpdate class]];
}

+ (NSValueTransformer *)extendedS3DestinationUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseExtendedS3DestinationUpdate class]];
}

+ (NSValueTransformer *)httpEndpointDestinationUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseHttpEndpointDestinationUpdate class]];
}

+ (NSValueTransformer *)redshiftDestinationUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseRedshiftDestinationUpdate class]];
}

+ (NSValueTransformer *)s3DestinationUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseS3DestinationUpdate class]];
}

+ (NSValueTransformer *)snowflakeDestinationUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSnowflakeDestinationUpdate class]];
}

+ (NSValueTransformer *)splunkDestinationUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFirehoseSplunkDestinationUpdate class]];
}

@end

@implementation AWSFirehoseUpdateDestinationOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSFirehoseVpcConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleARN" : @"RoleARN",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             };
}

@end

@implementation AWSFirehoseVpcConfigurationDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleARN" : @"RoleARN",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             @"vpcId" : @"VpcId",
             };
}

@end
