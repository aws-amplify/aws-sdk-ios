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

#import "AWSKendraFrontendServiceModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSKendraFrontendServiceErrorDomain = @"com.amazonaws.AWSKendraFrontendServiceErrorDomain";

@implementation AWSKendraFrontendServiceAccessControlListConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyPath" : @"KeyPath",
             };
}

@end

@implementation AWSKendraFrontendServiceAclConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedGroupsColumnName" : @"AllowedGroupsColumnName",
             };
}

@end

@implementation AWSKendraFrontendServiceAdditionalResultAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             @"valueType" : @"ValueType",
             };
}

+ (NSValueTransformer *)valueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceAdditionalResultAttributeValue class]];
}

+ (NSValueTransformer *)valueTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TEXT_WITH_HIGHLIGHTS_VALUE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceAdditionalResultAttributeValueTypeTextWithHighlightsValue);
        }
        return @(AWSKendraFrontendServiceAdditionalResultAttributeValueTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceAdditionalResultAttributeValueTypeTextWithHighlightsValue:
                return @"TEXT_WITH_HIGHLIGHTS_VALUE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKendraFrontendServiceAdditionalResultAttributeValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"textWithHighlightsValue" : @"TextWithHighlightsValue",
             };
}

+ (NSValueTransformer *)textWithHighlightsValueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceTextWithHighlights class]];
}

@end

@implementation AWSKendraFrontendServiceAttributeFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"andAllFilters" : @"AndAllFilters",
             @"containsAll" : @"ContainsAll",
             @"containsAny" : @"ContainsAny",
             @"equalsTo" : @"EqualsTo",
             @"greaterThan" : @"GreaterThan",
             @"greaterThanOrEquals" : @"GreaterThanOrEquals",
             @"lessThan" : @"LessThan",
             @"lessThanOrEquals" : @"LessThanOrEquals",
             @"notFilter" : @"NotFilter",
             @"orAllFilters" : @"OrAllFilters",
             };
}

+ (NSValueTransformer *)andAllFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceAttributeFilter class]];
}

+ (NSValueTransformer *)containsAllJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceDocumentAttribute class]];
}

+ (NSValueTransformer *)containsAnyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceDocumentAttribute class]];
}

+ (NSValueTransformer *)equalsToJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceDocumentAttribute class]];
}

+ (NSValueTransformer *)greaterThanJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceDocumentAttribute class]];
}

+ (NSValueTransformer *)greaterThanOrEqualsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceDocumentAttribute class]];
}

+ (NSValueTransformer *)lessThanJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceDocumentAttribute class]];
}

+ (NSValueTransformer *)lessThanOrEqualsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceDocumentAttribute class]];
}

+ (NSValueTransformer *)notFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceAttributeFilter class]];
}

+ (NSValueTransformer *)orAllFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceAttributeFilter class]];
}

@end

@implementation AWSKendraFrontendServiceBatchDeleteDocumentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSourceSyncJobMetricTarget" : @"DataSourceSyncJobMetricTarget",
             @"documentIdList" : @"DocumentIdList",
             @"indexId" : @"IndexId",
             };
}

+ (NSValueTransformer *)dataSourceSyncJobMetricTargetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceDataSourceSyncJobMetricTarget class]];
}

@end

@implementation AWSKendraFrontendServiceBatchDeleteDocumentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failedDocuments" : @"FailedDocuments",
             };
}

+ (NSValueTransformer *)failedDocumentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceBatchDeleteDocumentResponseFailedDocument class]];
}

@end

@implementation AWSKendraFrontendServiceBatchDeleteDocumentResponseFailedDocument

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"identifier" : @"Id",
             };
}

+ (NSValueTransformer *)errorCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InternalError"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceErrorCodeInternalError);
        }
        if ([value caseInsensitiveCompare:@"InvalidRequest"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceErrorCodeInvalidRequest);
        }
        return @(AWSKendraFrontendServiceErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceErrorCodeInternalError:
                return @"InternalError";
            case AWSKendraFrontendServiceErrorCodeInvalidRequest:
                return @"InvalidRequest";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKendraFrontendServiceBatchPutDocumentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documents" : @"Documents",
             @"indexId" : @"IndexId",
             @"roleArn" : @"RoleArn",
             };
}

+ (NSValueTransformer *)documentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceDocument class]];
}

@end

@implementation AWSKendraFrontendServiceBatchPutDocumentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failedDocuments" : @"FailedDocuments",
             };
}

+ (NSValueTransformer *)failedDocumentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceBatchPutDocumentResponseFailedDocument class]];
}

@end

@implementation AWSKendraFrontendServiceBatchPutDocumentResponseFailedDocument

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"identifier" : @"Id",
             };
}

+ (NSValueTransformer *)errorCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InternalError"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceErrorCodeInternalError);
        }
        if ([value caseInsensitiveCompare:@"InvalidRequest"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceErrorCodeInvalidRequest);
        }
        return @(AWSKendraFrontendServiceErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceErrorCodeInternalError:
                return @"InternalError";
            case AWSKendraFrontendServiceErrorCodeInvalidRequest:
                return @"InvalidRequest";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKendraFrontendServiceCapacityUnitsConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queryCapacityUnits" : @"QueryCapacityUnits",
             @"storageCapacityUnits" : @"StorageCapacityUnits",
             };
}

@end

@implementation AWSKendraFrontendServiceClickFeedback

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clickTime" : @"ClickTime",
             @"resultId" : @"ResultId",
             };
}

+ (NSValueTransformer *)clickTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSKendraFrontendServiceColumnConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeDetectingColumns" : @"ChangeDetectingColumns",
             @"documentDataColumnName" : @"DocumentDataColumnName",
             @"documentIdColumnName" : @"DocumentIdColumnName",
             @"documentTitleColumnName" : @"DocumentTitleColumnName",
             @"fieldMappings" : @"FieldMappings",
             };
}

+ (NSValueTransformer *)fieldMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceDataSourceToIndexFieldMapping class]];
}

@end

@implementation AWSKendraFrontendServiceConnectionConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"databaseHost" : @"DatabaseHost",
             @"databaseName" : @"DatabaseName",
             @"databasePort" : @"DatabasePort",
             @"secretArn" : @"SecretArn",
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSKendraFrontendServiceCreateDataSourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configuration" : @"Configuration",
             @"detail" : @"Description",
             @"indexId" : @"IndexId",
             @"name" : @"Name",
             @"roleArn" : @"RoleArn",
             @"schedule" : @"Schedule",
             @"tags" : @"Tags",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)configurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceDataSourceConfiguration class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceTag class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceTypeS3);
        }
        if ([value caseInsensitiveCompare:@"SHAREPOINT"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceTypeSharepoint);
        }
        if ([value caseInsensitiveCompare:@"DATABASE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceTypeDatabase);
        }
        if ([value caseInsensitiveCompare:@"SALESFORCE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceTypeSalesforce);
        }
        if ([value caseInsensitiveCompare:@"ONEDRIVE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceTypeOnedrive);
        }
        if ([value caseInsensitiveCompare:@"SERVICENOW"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceTypeServicenow);
        }
        return @(AWSKendraFrontendServiceDataSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceDataSourceTypeS3:
                return @"S3";
            case AWSKendraFrontendServiceDataSourceTypeSharepoint:
                return @"SHAREPOINT";
            case AWSKendraFrontendServiceDataSourceTypeDatabase:
                return @"DATABASE";
            case AWSKendraFrontendServiceDataSourceTypeSalesforce:
                return @"SALESFORCE";
            case AWSKendraFrontendServiceDataSourceTypeOnedrive:
                return @"ONEDRIVE";
            case AWSKendraFrontendServiceDataSourceTypeServicenow:
                return @"SERVICENOW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKendraFrontendServiceCreateDataSourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSKendraFrontendServiceCreateFaqRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"indexId" : @"IndexId",
             @"name" : @"Name",
             @"roleArn" : @"RoleArn",
             @"s3Path" : @"S3Path",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)s3PathJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceS3Path class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceTag class]];
}

@end

@implementation AWSKendraFrontendServiceCreateFaqResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSKendraFrontendServiceCreateIndexRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"detail" : @"Description",
             @"edition" : @"Edition",
             @"name" : @"Name",
             @"roleArn" : @"RoleArn",
             @"serverSideEncryptionConfiguration" : @"ServerSideEncryptionConfiguration",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)editionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEVELOPER_EDITION"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceIndexEditionDeveloperEdition);
        }
        if ([value caseInsensitiveCompare:@"ENTERPRISE_EDITION"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceIndexEditionEnterpriseEdition);
        }
        return @(AWSKendraFrontendServiceIndexEditionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceIndexEditionDeveloperEdition:
                return @"DEVELOPER_EDITION";
            case AWSKendraFrontendServiceIndexEditionEnterpriseEdition:
                return @"ENTERPRISE_EDITION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serverSideEncryptionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceServerSideEncryptionConfiguration class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceTag class]];
}

@end

@implementation AWSKendraFrontendServiceCreateIndexResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSKendraFrontendServiceDataSourceConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"databaseConfiguration" : @"DatabaseConfiguration",
             @"oneDriveConfiguration" : @"OneDriveConfiguration",
             @"s3Configuration" : @"S3Configuration",
             @"salesforceConfiguration" : @"SalesforceConfiguration",
             @"serviceNowConfiguration" : @"ServiceNowConfiguration",
             @"sharePointConfiguration" : @"SharePointConfiguration",
             };
}

+ (NSValueTransformer *)databaseConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceDatabaseConfiguration class]];
}

+ (NSValueTransformer *)oneDriveConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceOneDriveConfiguration class]];
}

+ (NSValueTransformer *)s3ConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceS3DataSourceConfiguration class]];
}

+ (NSValueTransformer *)salesforceConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceSalesforceConfiguration class]];
}

+ (NSValueTransformer *)serviceNowConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceServiceNowConfiguration class]];
}

+ (NSValueTransformer *)sharePointConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceSharePointConfiguration class]];
}

@end

@implementation AWSKendraFrontendServiceDataSourceSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAt" : @"CreatedAt",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"status" : @"Status",
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

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceStatusActive);
        }
        return @(AWSKendraFrontendServiceDataSourceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceDataSourceStatusCreating:
                return @"CREATING";
            case AWSKendraFrontendServiceDataSourceStatusDeleting:
                return @"DELETING";
            case AWSKendraFrontendServiceDataSourceStatusFailed:
                return @"FAILED";
            case AWSKendraFrontendServiceDataSourceStatusUpdating:
                return @"UPDATING";
            case AWSKendraFrontendServiceDataSourceStatusActive:
                return @"ACTIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceTypeS3);
        }
        if ([value caseInsensitiveCompare:@"SHAREPOINT"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceTypeSharepoint);
        }
        if ([value caseInsensitiveCompare:@"DATABASE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceTypeDatabase);
        }
        if ([value caseInsensitiveCompare:@"SALESFORCE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceTypeSalesforce);
        }
        if ([value caseInsensitiveCompare:@"ONEDRIVE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceTypeOnedrive);
        }
        if ([value caseInsensitiveCompare:@"SERVICENOW"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceTypeServicenow);
        }
        return @(AWSKendraFrontendServiceDataSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceDataSourceTypeS3:
                return @"S3";
            case AWSKendraFrontendServiceDataSourceTypeSharepoint:
                return @"SHAREPOINT";
            case AWSKendraFrontendServiceDataSourceTypeDatabase:
                return @"DATABASE";
            case AWSKendraFrontendServiceDataSourceTypeSalesforce:
                return @"SALESFORCE";
            case AWSKendraFrontendServiceDataSourceTypeOnedrive:
                return @"ONEDRIVE";
            case AWSKendraFrontendServiceDataSourceTypeServicenow:
                return @"SERVICENOW";
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

@implementation AWSKendraFrontendServiceDataSourceSyncJob

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSourceErrorCode" : @"DataSourceErrorCode",
             @"endTime" : @"EndTime",
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"executionId" : @"ExecutionId",
             @"metrics" : @"Metrics",
             @"startTime" : @"StartTime",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)errorCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InternalError"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceErrorCodeInternalError);
        }
        if ([value caseInsensitiveCompare:@"InvalidRequest"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceErrorCodeInvalidRequest);
        }
        return @(AWSKendraFrontendServiceErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceErrorCodeInternalError:
                return @"InternalError";
            case AWSKendraFrontendServiceErrorCodeInvalidRequest:
                return @"InvalidRequest";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)metricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceDataSourceSyncJobMetrics class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceSyncJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceSyncJobStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"SYNCING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceSyncJobStatusSyncing);
        }
        if ([value caseInsensitiveCompare:@"INCOMPLETE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceSyncJobStatusIncomplete);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceSyncJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"ABORTED"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceSyncJobStatusAborted);
        }
        if ([value caseInsensitiveCompare:@"SYNCING_INDEXING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceSyncJobStatusSyncingIndexing);
        }
        return @(AWSKendraFrontendServiceDataSourceSyncJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceDataSourceSyncJobStatusFailed:
                return @"FAILED";
            case AWSKendraFrontendServiceDataSourceSyncJobStatusSucceeded:
                return @"SUCCEEDED";
            case AWSKendraFrontendServiceDataSourceSyncJobStatusSyncing:
                return @"SYNCING";
            case AWSKendraFrontendServiceDataSourceSyncJobStatusIncomplete:
                return @"INCOMPLETE";
            case AWSKendraFrontendServiceDataSourceSyncJobStatusStopping:
                return @"STOPPING";
            case AWSKendraFrontendServiceDataSourceSyncJobStatusAborted:
                return @"ABORTED";
            case AWSKendraFrontendServiceDataSourceSyncJobStatusSyncingIndexing:
                return @"SYNCING_INDEXING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKendraFrontendServiceDataSourceSyncJobMetricTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSourceId" : @"DataSourceId",
             @"dataSourceSyncJobId" : @"DataSourceSyncJobId",
             };
}

@end

@implementation AWSKendraFrontendServiceDataSourceSyncJobMetrics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentsAdded" : @"DocumentsAdded",
             @"documentsDeleted" : @"DocumentsDeleted",
             @"documentsFailed" : @"DocumentsFailed",
             @"documentsModified" : @"DocumentsModified",
             @"documentsScanned" : @"DocumentsScanned",
             };
}

@end

@implementation AWSKendraFrontendServiceDataSourceToIndexFieldMapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSourceFieldName" : @"DataSourceFieldName",
             @"dateFieldFormat" : @"DateFieldFormat",
             @"indexFieldName" : @"IndexFieldName",
             };
}

@end

@implementation AWSKendraFrontendServiceDataSourceVpcConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             };
}

@end

@implementation AWSKendraFrontendServiceDatabaseConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aclConfiguration" : @"AclConfiguration",
             @"columnConfiguration" : @"ColumnConfiguration",
             @"connectionConfiguration" : @"ConnectionConfiguration",
             @"databaseEngineType" : @"DatabaseEngineType",
             @"vpcConfiguration" : @"VpcConfiguration",
             };
}

+ (NSValueTransformer *)aclConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceAclConfiguration class]];
}

+ (NSValueTransformer *)columnConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceColumnConfiguration class]];
}

+ (NSValueTransformer *)connectionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceConnectionConfiguration class]];
}

+ (NSValueTransformer *)databaseEngineTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RDS_AURORA_MYSQL"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDatabaseEngineTypeRdsAuroraMysql);
        }
        if ([value caseInsensitiveCompare:@"RDS_AURORA_POSTGRESQL"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDatabaseEngineTypeRdsAuroraPostgresql);
        }
        if ([value caseInsensitiveCompare:@"RDS_MYSQL"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDatabaseEngineTypeRdsMysql);
        }
        if ([value caseInsensitiveCompare:@"RDS_POSTGRESQL"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDatabaseEngineTypeRdsPostgresql);
        }
        return @(AWSKendraFrontendServiceDatabaseEngineTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceDatabaseEngineTypeRdsAuroraMysql:
                return @"RDS_AURORA_MYSQL";
            case AWSKendraFrontendServiceDatabaseEngineTypeRdsAuroraPostgresql:
                return @"RDS_AURORA_POSTGRESQL";
            case AWSKendraFrontendServiceDatabaseEngineTypeRdsMysql:
                return @"RDS_MYSQL";
            case AWSKendraFrontendServiceDatabaseEngineTypeRdsPostgresql:
                return @"RDS_POSTGRESQL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vpcConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceDataSourceVpcConfiguration class]];
}

@end

@implementation AWSKendraFrontendServiceDeleteDataSourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"indexId" : @"IndexId",
             };
}

@end

@implementation AWSKendraFrontendServiceDeleteFaqRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"indexId" : @"IndexId",
             };
}

@end

@implementation AWSKendraFrontendServiceDeleteIndexRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSKendraFrontendServiceDescribeDataSourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"indexId" : @"IndexId",
             };
}

@end

@implementation AWSKendraFrontendServiceDescribeDataSourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configuration" : @"Configuration",
             @"createdAt" : @"CreatedAt",
             @"detail" : @"Description",
             @"errorMessage" : @"ErrorMessage",
             @"identifier" : @"Id",
             @"indexId" : @"IndexId",
             @"name" : @"Name",
             @"roleArn" : @"RoleArn",
             @"schedule" : @"Schedule",
             @"status" : @"Status",
             @"types" : @"Type",
             @"updatedAt" : @"UpdatedAt",
             };
}

+ (NSValueTransformer *)configurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceDataSourceConfiguration class]];
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceStatusActive);
        }
        return @(AWSKendraFrontendServiceDataSourceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceDataSourceStatusCreating:
                return @"CREATING";
            case AWSKendraFrontendServiceDataSourceStatusDeleting:
                return @"DELETING";
            case AWSKendraFrontendServiceDataSourceStatusFailed:
                return @"FAILED";
            case AWSKendraFrontendServiceDataSourceStatusUpdating:
                return @"UPDATING";
            case AWSKendraFrontendServiceDataSourceStatusActive:
                return @"ACTIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceTypeS3);
        }
        if ([value caseInsensitiveCompare:@"SHAREPOINT"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceTypeSharepoint);
        }
        if ([value caseInsensitiveCompare:@"DATABASE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceTypeDatabase);
        }
        if ([value caseInsensitiveCompare:@"SALESFORCE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceTypeSalesforce);
        }
        if ([value caseInsensitiveCompare:@"ONEDRIVE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceTypeOnedrive);
        }
        if ([value caseInsensitiveCompare:@"SERVICENOW"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceTypeServicenow);
        }
        return @(AWSKendraFrontendServiceDataSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceDataSourceTypeS3:
                return @"S3";
            case AWSKendraFrontendServiceDataSourceTypeSharepoint:
                return @"SHAREPOINT";
            case AWSKendraFrontendServiceDataSourceTypeDatabase:
                return @"DATABASE";
            case AWSKendraFrontendServiceDataSourceTypeSalesforce:
                return @"SALESFORCE";
            case AWSKendraFrontendServiceDataSourceTypeOnedrive:
                return @"ONEDRIVE";
            case AWSKendraFrontendServiceDataSourceTypeServicenow:
                return @"SERVICENOW";
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

@implementation AWSKendraFrontendServiceDescribeFaqRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"indexId" : @"IndexId",
             };
}

@end

@implementation AWSKendraFrontendServiceDescribeFaqResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAt" : @"CreatedAt",
             @"detail" : @"Description",
             @"errorMessage" : @"ErrorMessage",
             @"identifier" : @"Id",
             @"indexId" : @"IndexId",
             @"name" : @"Name",
             @"roleArn" : @"RoleArn",
             @"s3Path" : @"S3Path",
             @"status" : @"Status",
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

+ (NSValueTransformer *)s3PathJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceS3Path class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceFaqStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceFaqStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceFaqStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceFaqStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceFaqStatusFailed);
        }
        return @(AWSKendraFrontendServiceFaqStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceFaqStatusCreating:
                return @"CREATING";
            case AWSKendraFrontendServiceFaqStatusUpdating:
                return @"UPDATING";
            case AWSKendraFrontendServiceFaqStatusActive:
                return @"ACTIVE";
            case AWSKendraFrontendServiceFaqStatusDeleting:
                return @"DELETING";
            case AWSKendraFrontendServiceFaqStatusFailed:
                return @"FAILED";
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

@implementation AWSKendraFrontendServiceDescribeIndexRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSKendraFrontendServiceDescribeIndexResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capacityUnits" : @"CapacityUnits",
             @"createdAt" : @"CreatedAt",
             @"detail" : @"Description",
             @"documentMetadataConfigurations" : @"DocumentMetadataConfigurations",
             @"edition" : @"Edition",
             @"errorMessage" : @"ErrorMessage",
             @"identifier" : @"Id",
             @"indexStatistics" : @"IndexStatistics",
             @"name" : @"Name",
             @"roleArn" : @"RoleArn",
             @"serverSideEncryptionConfiguration" : @"ServerSideEncryptionConfiguration",
             @"status" : @"Status",
             @"updatedAt" : @"UpdatedAt",
             };
}

+ (NSValueTransformer *)capacityUnitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceCapacityUnitsConfiguration class]];
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)documentMetadataConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceDocumentMetadataConfiguration class]];
}

+ (NSValueTransformer *)editionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEVELOPER_EDITION"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceIndexEditionDeveloperEdition);
        }
        if ([value caseInsensitiveCompare:@"ENTERPRISE_EDITION"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceIndexEditionEnterpriseEdition);
        }
        return @(AWSKendraFrontendServiceIndexEditionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceIndexEditionDeveloperEdition:
                return @"DEVELOPER_EDITION";
            case AWSKendraFrontendServiceIndexEditionEnterpriseEdition:
                return @"ENTERPRISE_EDITION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)indexStatisticsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceIndexStatistics class]];
}

+ (NSValueTransformer *)serverSideEncryptionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceServerSideEncryptionConfiguration class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceIndexStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceIndexStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceIndexStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceIndexStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceIndexStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"SYSTEM_UPDATING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceIndexStatusSystemUpdating);
        }
        return @(AWSKendraFrontendServiceIndexStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceIndexStatusCreating:
                return @"CREATING";
            case AWSKendraFrontendServiceIndexStatusActive:
                return @"ACTIVE";
            case AWSKendraFrontendServiceIndexStatusDeleting:
                return @"DELETING";
            case AWSKendraFrontendServiceIndexStatusFailed:
                return @"FAILED";
            case AWSKendraFrontendServiceIndexStatusUpdating:
                return @"UPDATING";
            case AWSKendraFrontendServiceIndexStatusSystemUpdating:
                return @"SYSTEM_UPDATING";
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

@implementation AWSKendraFrontendServiceDocument

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessControlList" : @"AccessControlList",
             @"attributes" : @"Attributes",
             @"blob" : @"Blob",
             @"contentType" : @"ContentType",
             @"identifier" : @"Id",
             @"s3Path" : @"S3Path",
             @"title" : @"Title",
             };
}

+ (NSValueTransformer *)accessControlListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServicePrincipal class]];
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceDocumentAttribute class]];
}

+ (NSValueTransformer *)contentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PDF"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceContentTypePdf);
        }
        if ([value caseInsensitiveCompare:@"HTML"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceContentTypeHtml);
        }
        if ([value caseInsensitiveCompare:@"MS_WORD"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceContentTypeMsWord);
        }
        if ([value caseInsensitiveCompare:@"PLAIN_TEXT"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceContentTypePlainText);
        }
        if ([value caseInsensitiveCompare:@"PPT"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceContentTypePpt);
        }
        return @(AWSKendraFrontendServiceContentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceContentTypePdf:
                return @"PDF";
            case AWSKendraFrontendServiceContentTypeHtml:
                return @"HTML";
            case AWSKendraFrontendServiceContentTypeMsWord:
                return @"MS_WORD";
            case AWSKendraFrontendServiceContentTypePlainText:
                return @"PLAIN_TEXT";
            case AWSKendraFrontendServiceContentTypePpt:
                return @"PPT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3PathJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceS3Path class]];
}

@end

@implementation AWSKendraFrontendServiceDocumentAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)valueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceDocumentAttributeValue class]];
}

@end

@implementation AWSKendraFrontendServiceDocumentAttributeValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dateValue" : @"DateValue",
             @"longValue" : @"LongValue",
             @"stringListValue" : @"StringListValue",
             @"stringValue" : @"StringValue",
             };
}

+ (NSValueTransformer *)dateValueJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSKendraFrontendServiceDocumentAttributeValueCountPair

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"count" : @"Count",
             @"documentAttributeValue" : @"DocumentAttributeValue",
             };
}

+ (NSValueTransformer *)documentAttributeValueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceDocumentAttributeValue class]];
}

@end

@implementation AWSKendraFrontendServiceDocumentMetadataConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"relevance" : @"Relevance",
             @"search" : @"Search",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)relevanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceRelevance class]];
}

+ (NSValueTransformer *)searchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceSearch class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STRING_VALUE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDocumentAttributeValueTypeStringValue);
        }
        if ([value caseInsensitiveCompare:@"STRING_LIST_VALUE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDocumentAttributeValueTypeStringListValue);
        }
        if ([value caseInsensitiveCompare:@"LONG_VALUE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDocumentAttributeValueTypeLongValue);
        }
        if ([value caseInsensitiveCompare:@"DATE_VALUE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDocumentAttributeValueTypeDateValue);
        }
        return @(AWSKendraFrontendServiceDocumentAttributeValueTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceDocumentAttributeValueTypeStringValue:
                return @"STRING_VALUE";
            case AWSKendraFrontendServiceDocumentAttributeValueTypeStringListValue:
                return @"STRING_LIST_VALUE";
            case AWSKendraFrontendServiceDocumentAttributeValueTypeLongValue:
                return @"LONG_VALUE";
            case AWSKendraFrontendServiceDocumentAttributeValueTypeDateValue:
                return @"DATE_VALUE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKendraFrontendServiceDocumentsMetadataConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Prefix" : @"S3Prefix",
             };
}

@end

@implementation AWSKendraFrontendServiceFacet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentAttributeKey" : @"DocumentAttributeKey",
             };
}

@end

@implementation AWSKendraFrontendServiceFacetResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentAttributeKey" : @"DocumentAttributeKey",
             @"documentAttributeValueCountPairs" : @"DocumentAttributeValueCountPairs",
             };
}

+ (NSValueTransformer *)documentAttributeValueCountPairsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceDocumentAttributeValueCountPair class]];
}

@end

@implementation AWSKendraFrontendServiceFaqStatistics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexedQuestionAnswersCount" : @"IndexedQuestionAnswersCount",
             };
}

@end

@implementation AWSKendraFrontendServiceFaqSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAt" : @"CreatedAt",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"status" : @"Status",
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

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceFaqStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceFaqStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceFaqStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceFaqStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceFaqStatusFailed);
        }
        return @(AWSKendraFrontendServiceFaqStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceFaqStatusCreating:
                return @"CREATING";
            case AWSKendraFrontendServiceFaqStatusUpdating:
                return @"UPDATING";
            case AWSKendraFrontendServiceFaqStatusActive:
                return @"ACTIVE";
            case AWSKendraFrontendServiceFaqStatusDeleting:
                return @"DELETING";
            case AWSKendraFrontendServiceFaqStatusFailed:
                return @"FAILED";
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

@implementation AWSKendraFrontendServiceHighlight

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"beginOffset" : @"BeginOffset",
             @"endOffset" : @"EndOffset",
             @"topAnswer" : @"TopAnswer",
             };
}

@end

@implementation AWSKendraFrontendServiceIndexConfigurationSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAt" : @"CreatedAt",
             @"edition" : @"Edition",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"status" : @"Status",
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

+ (NSValueTransformer *)editionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEVELOPER_EDITION"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceIndexEditionDeveloperEdition);
        }
        if ([value caseInsensitiveCompare:@"ENTERPRISE_EDITION"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceIndexEditionEnterpriseEdition);
        }
        return @(AWSKendraFrontendServiceIndexEditionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceIndexEditionDeveloperEdition:
                return @"DEVELOPER_EDITION";
            case AWSKendraFrontendServiceIndexEditionEnterpriseEdition:
                return @"ENTERPRISE_EDITION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceIndexStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceIndexStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceIndexStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceIndexStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceIndexStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"SYSTEM_UPDATING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceIndexStatusSystemUpdating);
        }
        return @(AWSKendraFrontendServiceIndexStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceIndexStatusCreating:
                return @"CREATING";
            case AWSKendraFrontendServiceIndexStatusActive:
                return @"ACTIVE";
            case AWSKendraFrontendServiceIndexStatusDeleting:
                return @"DELETING";
            case AWSKendraFrontendServiceIndexStatusFailed:
                return @"FAILED";
            case AWSKendraFrontendServiceIndexStatusUpdating:
                return @"UPDATING";
            case AWSKendraFrontendServiceIndexStatusSystemUpdating:
                return @"SYSTEM_UPDATING";
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

@implementation AWSKendraFrontendServiceIndexStatistics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faqStatistics" : @"FaqStatistics",
             @"textDocumentStatistics" : @"TextDocumentStatistics",
             };
}

+ (NSValueTransformer *)faqStatisticsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceFaqStatistics class]];
}

+ (NSValueTransformer *)textDocumentStatisticsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceTextDocumentStatistics class]];
}

@end

@implementation AWSKendraFrontendServiceListDataSourceSyncJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"indexId" : @"IndexId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"startTimeFilter" : @"StartTimeFilter",
             @"statusFilter" : @"StatusFilter",
             };
}

+ (NSValueTransformer *)startTimeFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceTimeRange class]];
}

+ (NSValueTransformer *)statusFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceSyncJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceSyncJobStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"SYNCING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceSyncJobStatusSyncing);
        }
        if ([value caseInsensitiveCompare:@"INCOMPLETE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceSyncJobStatusIncomplete);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceSyncJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"ABORTED"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceSyncJobStatusAborted);
        }
        if ([value caseInsensitiveCompare:@"SYNCING_INDEXING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceDataSourceSyncJobStatusSyncingIndexing);
        }
        return @(AWSKendraFrontendServiceDataSourceSyncJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceDataSourceSyncJobStatusFailed:
                return @"FAILED";
            case AWSKendraFrontendServiceDataSourceSyncJobStatusSucceeded:
                return @"SUCCEEDED";
            case AWSKendraFrontendServiceDataSourceSyncJobStatusSyncing:
                return @"SYNCING";
            case AWSKendraFrontendServiceDataSourceSyncJobStatusIncomplete:
                return @"INCOMPLETE";
            case AWSKendraFrontendServiceDataSourceSyncJobStatusStopping:
                return @"STOPPING";
            case AWSKendraFrontendServiceDataSourceSyncJobStatusAborted:
                return @"ABORTED";
            case AWSKendraFrontendServiceDataSourceSyncJobStatusSyncingIndexing:
                return @"SYNCING_INDEXING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKendraFrontendServiceListDataSourceSyncJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"history" : @"History",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)historyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceDataSourceSyncJob class]];
}

@end

@implementation AWSKendraFrontendServiceListDataSourcesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexId" : @"IndexId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSKendraFrontendServiceListDataSourcesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"summaryItems" : @"SummaryItems",
             };
}

+ (NSValueTransformer *)summaryItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceDataSourceSummary class]];
}

@end

@implementation AWSKendraFrontendServiceListFaqsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexId" : @"IndexId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSKendraFrontendServiceListFaqsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faqSummaryItems" : @"FaqSummaryItems",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)faqSummaryItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceFaqSummary class]];
}

@end

@implementation AWSKendraFrontendServiceListIndicesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSKendraFrontendServiceListIndicesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexConfigurationSummaryItems" : @"IndexConfigurationSummaryItems",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)indexConfigurationSummaryItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceIndexConfigurationSummary class]];
}

@end

@implementation AWSKendraFrontendServiceListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             };
}

@end

@implementation AWSKendraFrontendServiceListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceTag class]];
}

@end

@implementation AWSKendraFrontendServiceOneDriveConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exclusionPatterns" : @"ExclusionPatterns",
             @"fieldMappings" : @"FieldMappings",
             @"inclusionPatterns" : @"InclusionPatterns",
             @"oneDriveUsers" : @"OneDriveUsers",
             @"secretArn" : @"SecretArn",
             @"tenantDomain" : @"TenantDomain",
             };
}

+ (NSValueTransformer *)fieldMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceDataSourceToIndexFieldMapping class]];
}

+ (NSValueTransformer *)oneDriveUsersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceOneDriveUsers class]];
}

@end

@implementation AWSKendraFrontendServiceOneDriveUsers

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"oneDriveUserList" : @"OneDriveUserList",
             @"oneDriveUserS3Path" : @"OneDriveUserS3Path",
             };
}

+ (NSValueTransformer *)oneDriveUserS3PathJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceS3Path class]];
}

@end

@implementation AWSKendraFrontendServicePrincipal

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"access" : @"Access",
             @"name" : @"Name",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)accessJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALLOW"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceReadAccessTypeAllow);
        }
        if ([value caseInsensitiveCompare:@"DENY"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceReadAccessTypeDeny);
        }
        return @(AWSKendraFrontendServiceReadAccessTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceReadAccessTypeAllow:
                return @"ALLOW";
            case AWSKendraFrontendServiceReadAccessTypeDeny:
                return @"DENY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USER"] == NSOrderedSame) {
            return @(AWSKendraFrontendServicePrincipalTypeUser);
        }
        if ([value caseInsensitiveCompare:@"GROUP"] == NSOrderedSame) {
            return @(AWSKendraFrontendServicePrincipalTypeGroup);
        }
        return @(AWSKendraFrontendServicePrincipalTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServicePrincipalTypeUser:
                return @"USER";
            case AWSKendraFrontendServicePrincipalTypeGroup:
                return @"GROUP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKendraFrontendServiceQueryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeFilter" : @"AttributeFilter",
             @"facets" : @"Facets",
             @"indexId" : @"IndexId",
             @"pageNumber" : @"PageNumber",
             @"pageSize" : @"PageSize",
             @"queryResultTypeFilter" : @"QueryResultTypeFilter",
             @"queryText" : @"QueryText",
             @"requestedDocumentAttributes" : @"RequestedDocumentAttributes",
             };
}

+ (NSValueTransformer *)attributeFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceAttributeFilter class]];
}

+ (NSValueTransformer *)facetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceFacet class]];
}

+ (NSValueTransformer *)queryResultTypeFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DOCUMENT"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceQueryResultTypeDocument);
        }
        if ([value caseInsensitiveCompare:@"QUESTION_ANSWER"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceQueryResultTypeQuestionAnswer);
        }
        if ([value caseInsensitiveCompare:@"ANSWER"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceQueryResultTypeAnswer);
        }
        return @(AWSKendraFrontendServiceQueryResultTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceQueryResultTypeDocument:
                return @"DOCUMENT";
            case AWSKendraFrontendServiceQueryResultTypeQuestionAnswer:
                return @"QUESTION_ANSWER";
            case AWSKendraFrontendServiceQueryResultTypeAnswer:
                return @"ANSWER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKendraFrontendServiceQueryResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"facetResults" : @"FacetResults",
             @"queryId" : @"QueryId",
             @"resultItems" : @"ResultItems",
             @"totalNumberOfResults" : @"TotalNumberOfResults",
             };
}

+ (NSValueTransformer *)facetResultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceFacetResult class]];
}

+ (NSValueTransformer *)resultItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceQueryResultItem class]];
}

@end

@implementation AWSKendraFrontendServiceQueryResultItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalAttributes" : @"AdditionalAttributes",
             @"documentAttributes" : @"DocumentAttributes",
             @"documentExcerpt" : @"DocumentExcerpt",
             @"documentId" : @"DocumentId",
             @"documentTitle" : @"DocumentTitle",
             @"documentURI" : @"DocumentURI",
             @"identifier" : @"Id",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)additionalAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceAdditionalResultAttribute class]];
}

+ (NSValueTransformer *)documentAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceDocumentAttribute class]];
}

+ (NSValueTransformer *)documentExcerptJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceTextWithHighlights class]];
}

+ (NSValueTransformer *)documentTitleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceTextWithHighlights class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DOCUMENT"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceQueryResultTypeDocument);
        }
        if ([value caseInsensitiveCompare:@"QUESTION_ANSWER"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceQueryResultTypeQuestionAnswer);
        }
        if ([value caseInsensitiveCompare:@"ANSWER"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceQueryResultTypeAnswer);
        }
        return @(AWSKendraFrontendServiceQueryResultTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceQueryResultTypeDocument:
                return @"DOCUMENT";
            case AWSKendraFrontendServiceQueryResultTypeQuestionAnswer:
                return @"QUESTION_ANSWER";
            case AWSKendraFrontendServiceQueryResultTypeAnswer:
                return @"ANSWER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKendraFrontendServiceRelevance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"duration" : @"Duration",
             @"freshness" : @"Freshness",
             @"importance" : @"Importance",
             @"rankOrder" : @"RankOrder",
             @"valueImportanceMap" : @"ValueImportanceMap",
             };
}

+ (NSValueTransformer *)rankOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceOrderDescending);
        }
        return @(AWSKendraFrontendServiceOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceOrderAscending:
                return @"ASCENDING";
            case AWSKendraFrontendServiceOrderDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKendraFrontendServiceRelevanceFeedback

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"relevanceValue" : @"RelevanceValue",
             @"resultId" : @"ResultId",
             };
}

+ (NSValueTransformer *)relevanceValueJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RELEVANT"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceRelevanceTypeRelevant);
        }
        if ([value caseInsensitiveCompare:@"NOT_RELEVANT"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceRelevanceTypeNotRelevant);
        }
        return @(AWSKendraFrontendServiceRelevanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceRelevanceTypeRelevant:
                return @"RELEVANT";
            case AWSKendraFrontendServiceRelevanceTypeNotRelevant:
                return @"NOT_RELEVANT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKendraFrontendServiceS3DataSourceConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessControlListConfiguration" : @"AccessControlListConfiguration",
             @"bucketName" : @"BucketName",
             @"documentsMetadataConfiguration" : @"DocumentsMetadataConfiguration",
             @"exclusionPatterns" : @"ExclusionPatterns",
             @"inclusionPrefixes" : @"InclusionPrefixes",
             };
}

+ (NSValueTransformer *)accessControlListConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceAccessControlListConfiguration class]];
}

+ (NSValueTransformer *)documentsMetadataConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceDocumentsMetadataConfiguration class]];
}

@end

@implementation AWSKendraFrontendServiceS3Path

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"key" : @"Key",
             };
}

@end

@implementation AWSKendraFrontendServiceSalesforceChatterFeedConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentDataFieldName" : @"DocumentDataFieldName",
             @"documentTitleFieldName" : @"DocumentTitleFieldName",
             @"fieldMappings" : @"FieldMappings",
             @"includeFilterTypes" : @"IncludeFilterTypes",
             };
}

+ (NSValueTransformer *)fieldMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceDataSourceToIndexFieldMapping class]];
}

@end

@implementation AWSKendraFrontendServiceSalesforceConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"chatterFeedConfiguration" : @"ChatterFeedConfiguration",
             @"crawlAttachments" : @"CrawlAttachments",
             @"excludeAttachmentFilePatterns" : @"ExcludeAttachmentFilePatterns",
             @"includeAttachmentFilePatterns" : @"IncludeAttachmentFilePatterns",
             @"knowledgeArticleConfiguration" : @"KnowledgeArticleConfiguration",
             @"secretArn" : @"SecretArn",
             @"serverUrl" : @"ServerUrl",
             @"standardObjectAttachmentConfiguration" : @"StandardObjectAttachmentConfiguration",
             @"standardObjectConfigurations" : @"StandardObjectConfigurations",
             };
}

+ (NSValueTransformer *)chatterFeedConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceSalesforceChatterFeedConfiguration class]];
}

+ (NSValueTransformer *)knowledgeArticleConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceSalesforceKnowledgeArticleConfiguration class]];
}

+ (NSValueTransformer *)standardObjectAttachmentConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceSalesforceStandardObjectAttachmentConfiguration class]];
}

+ (NSValueTransformer *)standardObjectConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceSalesforceStandardObjectConfiguration class]];
}

@end

@implementation AWSKendraFrontendServiceSalesforceCustomKnowledgeArticleTypeConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentDataFieldName" : @"DocumentDataFieldName",
             @"documentTitleFieldName" : @"DocumentTitleFieldName",
             @"fieldMappings" : @"FieldMappings",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)fieldMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceDataSourceToIndexFieldMapping class]];
}

@end

@implementation AWSKendraFrontendServiceSalesforceKnowledgeArticleConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customKnowledgeArticleTypeConfigurations" : @"CustomKnowledgeArticleTypeConfigurations",
             @"includedStates" : @"IncludedStates",
             @"standardKnowledgeArticleTypeConfiguration" : @"StandardKnowledgeArticleTypeConfiguration",
             };
}

+ (NSValueTransformer *)customKnowledgeArticleTypeConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceSalesforceCustomKnowledgeArticleTypeConfiguration class]];
}

+ (NSValueTransformer *)standardKnowledgeArticleTypeConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceSalesforceStandardKnowledgeArticleTypeConfiguration class]];
}

@end

@implementation AWSKendraFrontendServiceSalesforceStandardKnowledgeArticleTypeConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentDataFieldName" : @"DocumentDataFieldName",
             @"documentTitleFieldName" : @"DocumentTitleFieldName",
             @"fieldMappings" : @"FieldMappings",
             };
}

+ (NSValueTransformer *)fieldMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceDataSourceToIndexFieldMapping class]];
}

@end

@implementation AWSKendraFrontendServiceSalesforceStandardObjectAttachmentConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentTitleFieldName" : @"DocumentTitleFieldName",
             @"fieldMappings" : @"FieldMappings",
             };
}

+ (NSValueTransformer *)fieldMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceDataSourceToIndexFieldMapping class]];
}

@end

@implementation AWSKendraFrontendServiceSalesforceStandardObjectConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentDataFieldName" : @"DocumentDataFieldName",
             @"documentTitleFieldName" : @"DocumentTitleFieldName",
             @"fieldMappings" : @"FieldMappings",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)fieldMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceDataSourceToIndexFieldMapping class]];
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACCOUNT"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceSalesforceStandardObjectNameAccount);
        }
        if ([value caseInsensitiveCompare:@"CAMPAIGN"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceSalesforceStandardObjectNameCampaign);
        }
        if ([value caseInsensitiveCompare:@"CASE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceSalesforceStandardObjectNameCase);
        }
        if ([value caseInsensitiveCompare:@"CONTACT"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceSalesforceStandardObjectNameContact);
        }
        if ([value caseInsensitiveCompare:@"CONTRACT"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceSalesforceStandardObjectNameContract);
        }
        if ([value caseInsensitiveCompare:@"DOCUMENT"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceSalesforceStandardObjectNameDocument);
        }
        if ([value caseInsensitiveCompare:@"GROUP"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceSalesforceStandardObjectNameGroup);
        }
        if ([value caseInsensitiveCompare:@"IDEA"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceSalesforceStandardObjectNameIdea);
        }
        if ([value caseInsensitiveCompare:@"LEAD"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceSalesforceStandardObjectNameLead);
        }
        if ([value caseInsensitiveCompare:@"OPPORTUNITY"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceSalesforceStandardObjectNameOpportunity);
        }
        if ([value caseInsensitiveCompare:@"PARTNER"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceSalesforceStandardObjectNamePartner);
        }
        if ([value caseInsensitiveCompare:@"PRICEBOOK"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceSalesforceStandardObjectNamePricebook);
        }
        if ([value caseInsensitiveCompare:@"PRODUCT"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceSalesforceStandardObjectNameProduct);
        }
        if ([value caseInsensitiveCompare:@"PROFILE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceSalesforceStandardObjectNameProfile);
        }
        if ([value caseInsensitiveCompare:@"SOLUTION"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceSalesforceStandardObjectNameSolution);
        }
        if ([value caseInsensitiveCompare:@"TASK"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceSalesforceStandardObjectNameTask);
        }
        if ([value caseInsensitiveCompare:@"USER"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceSalesforceStandardObjectNameUser);
        }
        return @(AWSKendraFrontendServiceSalesforceStandardObjectNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceSalesforceStandardObjectNameAccount:
                return @"ACCOUNT";
            case AWSKendraFrontendServiceSalesforceStandardObjectNameCampaign:
                return @"CAMPAIGN";
            case AWSKendraFrontendServiceSalesforceStandardObjectNameCase:
                return @"CASE";
            case AWSKendraFrontendServiceSalesforceStandardObjectNameContact:
                return @"CONTACT";
            case AWSKendraFrontendServiceSalesforceStandardObjectNameContract:
                return @"CONTRACT";
            case AWSKendraFrontendServiceSalesforceStandardObjectNameDocument:
                return @"DOCUMENT";
            case AWSKendraFrontendServiceSalesforceStandardObjectNameGroup:
                return @"GROUP";
            case AWSKendraFrontendServiceSalesforceStandardObjectNameIdea:
                return @"IDEA";
            case AWSKendraFrontendServiceSalesforceStandardObjectNameLead:
                return @"LEAD";
            case AWSKendraFrontendServiceSalesforceStandardObjectNameOpportunity:
                return @"OPPORTUNITY";
            case AWSKendraFrontendServiceSalesforceStandardObjectNamePartner:
                return @"PARTNER";
            case AWSKendraFrontendServiceSalesforceStandardObjectNamePricebook:
                return @"PRICEBOOK";
            case AWSKendraFrontendServiceSalesforceStandardObjectNameProduct:
                return @"PRODUCT";
            case AWSKendraFrontendServiceSalesforceStandardObjectNameProfile:
                return @"PROFILE";
            case AWSKendraFrontendServiceSalesforceStandardObjectNameSolution:
                return @"SOLUTION";
            case AWSKendraFrontendServiceSalesforceStandardObjectNameTask:
                return @"TASK";
            case AWSKendraFrontendServiceSalesforceStandardObjectNameUser:
                return @"USER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKendraFrontendServiceSearch

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"displayable" : @"Displayable",
             @"facetable" : @"Facetable",
             @"searchable" : @"Searchable",
             };
}

@end

@implementation AWSKendraFrontendServiceServerSideEncryptionConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             };
}

@end

@implementation AWSKendraFrontendServiceServiceNowConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostUrl" : @"HostUrl",
             @"knowledgeArticleConfiguration" : @"KnowledgeArticleConfiguration",
             @"secretArn" : @"SecretArn",
             @"serviceCatalogConfiguration" : @"ServiceCatalogConfiguration",
             @"serviceNowBuildVersion" : @"ServiceNowBuildVersion",
             };
}

+ (NSValueTransformer *)knowledgeArticleConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceServiceNowKnowledgeArticleConfiguration class]];
}

+ (NSValueTransformer *)serviceCatalogConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceServiceNowServiceCatalogConfiguration class]];
}

+ (NSValueTransformer *)serviceNowBuildVersionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LONDON"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceServiceNowBuildVersionTypeLondon);
        }
        if ([value caseInsensitiveCompare:@"OTHERS"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceServiceNowBuildVersionTypeOthers);
        }
        return @(AWSKendraFrontendServiceServiceNowBuildVersionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceServiceNowBuildVersionTypeLondon:
                return @"LONDON";
            case AWSKendraFrontendServiceServiceNowBuildVersionTypeOthers:
                return @"OTHERS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKendraFrontendServiceServiceNowKnowledgeArticleConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawlAttachments" : @"CrawlAttachments",
             @"documentDataFieldName" : @"DocumentDataFieldName",
             @"documentTitleFieldName" : @"DocumentTitleFieldName",
             @"excludeAttachmentFilePatterns" : @"ExcludeAttachmentFilePatterns",
             @"fieldMappings" : @"FieldMappings",
             @"includeAttachmentFilePatterns" : @"IncludeAttachmentFilePatterns",
             };
}

+ (NSValueTransformer *)fieldMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceDataSourceToIndexFieldMapping class]];
}

@end

@implementation AWSKendraFrontendServiceServiceNowServiceCatalogConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawlAttachments" : @"CrawlAttachments",
             @"documentDataFieldName" : @"DocumentDataFieldName",
             @"documentTitleFieldName" : @"DocumentTitleFieldName",
             @"excludeAttachmentFilePatterns" : @"ExcludeAttachmentFilePatterns",
             @"fieldMappings" : @"FieldMappings",
             @"includeAttachmentFilePatterns" : @"IncludeAttachmentFilePatterns",
             };
}

+ (NSValueTransformer *)fieldMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceDataSourceToIndexFieldMapping class]];
}

@end

@implementation AWSKendraFrontendServiceSharePointConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawlAttachments" : @"CrawlAttachments",
             @"documentTitleFieldName" : @"DocumentTitleFieldName",
             @"exclusionPatterns" : @"ExclusionPatterns",
             @"fieldMappings" : @"FieldMappings",
             @"inclusionPatterns" : @"InclusionPatterns",
             @"secretArn" : @"SecretArn",
             @"sharePointVersion" : @"SharePointVersion",
             @"urls" : @"Urls",
             @"useChangeLog" : @"UseChangeLog",
             @"vpcConfiguration" : @"VpcConfiguration",
             };
}

+ (NSValueTransformer *)fieldMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceDataSourceToIndexFieldMapping class]];
}

+ (NSValueTransformer *)sharePointVersionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SHAREPOINT_ONLINE"] == NSOrderedSame) {
            return @(AWSKendraFrontendServiceSharePointVersionSharepointOnline);
        }
        return @(AWSKendraFrontendServiceSharePointVersionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKendraFrontendServiceSharePointVersionSharepointOnline:
                return @"SHAREPOINT_ONLINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vpcConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceDataSourceVpcConfiguration class]];
}

@end

@implementation AWSKendraFrontendServiceStartDataSourceSyncJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"indexId" : @"IndexId",
             };
}

@end

@implementation AWSKendraFrontendServiceStartDataSourceSyncJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"executionId" : @"ExecutionId",
             };
}

@end

@implementation AWSKendraFrontendServiceStopDataSourceSyncJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"indexId" : @"IndexId",
             };
}

@end

@implementation AWSKendraFrontendServiceSubmitFeedbackRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clickFeedbackItems" : @"ClickFeedbackItems",
             @"indexId" : @"IndexId",
             @"queryId" : @"QueryId",
             @"relevanceFeedbackItems" : @"RelevanceFeedbackItems",
             };
}

+ (NSValueTransformer *)clickFeedbackItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceClickFeedback class]];
}

+ (NSValueTransformer *)relevanceFeedbackItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceRelevanceFeedback class]];
}

@end

@implementation AWSKendraFrontendServiceTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSKendraFrontendServiceTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceTag class]];
}

@end

@implementation AWSKendraFrontendServiceTagResourceResponse

@end

@implementation AWSKendraFrontendServiceTextDocumentStatistics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexedTextBytes" : @"IndexedTextBytes",
             @"indexedTextDocumentsCount" : @"IndexedTextDocumentsCount",
             };
}

@end

@implementation AWSKendraFrontendServiceTextWithHighlights

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"highlights" : @"Highlights",
             @"text" : @"Text",
             };
}

+ (NSValueTransformer *)highlightsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceHighlight class]];
}

@end

@implementation AWSKendraFrontendServiceTimeRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"EndTime",
             @"startTime" : @"StartTime",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSKendraFrontendServiceUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSKendraFrontendServiceUntagResourceResponse

@end

@implementation AWSKendraFrontendServiceUpdateDataSourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configuration" : @"Configuration",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"indexId" : @"IndexId",
             @"name" : @"Name",
             @"roleArn" : @"RoleArn",
             @"schedule" : @"Schedule",
             };
}

+ (NSValueTransformer *)configurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceDataSourceConfiguration class]];
}

@end

@implementation AWSKendraFrontendServiceUpdateIndexRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capacityUnits" : @"CapacityUnits",
             @"detail" : @"Description",
             @"documentMetadataConfigurationUpdates" : @"DocumentMetadataConfigurationUpdates",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"roleArn" : @"RoleArn",
             };
}

+ (NSValueTransformer *)capacityUnitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKendraFrontendServiceCapacityUnitsConfiguration class]];
}

+ (NSValueTransformer *)documentMetadataConfigurationUpdatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKendraFrontendServiceDocumentMetadataConfiguration class]];
}

@end
