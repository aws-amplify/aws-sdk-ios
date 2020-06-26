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

#import "AWSQuicksightModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSQuicksightErrorDomain = @"com.amazonaws.AWSQuicksightErrorDomain";

@implementation AWSQuicksightActiveIAMPolicyAssignment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assignmentName" : @"AssignmentName",
             @"policyArn" : @"PolicyArn",
             };
}

@end

@implementation AWSQuicksightAdHocFilteringOption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityStatus" : @"AvailabilityStatus",
             };
}

+ (NSValueTransformer *)availabilityStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSQuicksightDashboardBehaviorEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSQuicksightDashboardBehaviorDisabled);
        }
        return @(AWSQuicksightDashboardBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightDashboardBehaviorEnabled:
                return @"ENABLED";
            case AWSQuicksightDashboardBehaviorDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightAmazonElasticsearchParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domain" : @"Domain",
             };
}

@end

@implementation AWSQuicksightAthenaParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workGroup" : @"WorkGroup",
             };
}

@end

@implementation AWSQuicksightAuroraParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"database" : @"Database",
             @"host" : @"Host",
             @"port" : @"Port",
             };
}

@end

@implementation AWSQuicksightAuroraPostgreSqlParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"database" : @"Database",
             @"host" : @"Host",
             @"port" : @"Port",
             };
}

@end

@implementation AWSQuicksightAwsIotAnalyticsParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSetName" : @"DataSetName",
             };
}

@end

@implementation AWSQuicksightCalculatedColumn

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"columnId" : @"ColumnId",
             @"columnName" : @"ColumnName",
             @"expression" : @"Expression",
             };
}

@end

@implementation AWSQuicksightCancelIngestionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"dataSetId" : @"DataSetId",
             @"ingestionId" : @"IngestionId",
             };
}

@end

@implementation AWSQuicksightCancelIngestionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"ingestionId" : @"IngestionId",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

@end

@implementation AWSQuicksightCastColumnTypeOperation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"columnName" : @"ColumnName",
             @"format" : @"Format",
             @"latestColumnType" : @"NewColumnType",
             };
}

+ (NSValueTransformer *)latestColumnTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STRING"] == NSOrderedSame) {
            return @(AWSQuicksightColumnDataTypeString);
        }
        if ([value caseInsensitiveCompare:@"INTEGER"] == NSOrderedSame) {
            return @(AWSQuicksightColumnDataTypeInteger);
        }
        if ([value caseInsensitiveCompare:@"DECIMAL"] == NSOrderedSame) {
            return @(AWSQuicksightColumnDataTypeDecimal);
        }
        if ([value caseInsensitiveCompare:@"DATETIME"] == NSOrderedSame) {
            return @(AWSQuicksightColumnDataTypeDatetime);
        }
        return @(AWSQuicksightColumnDataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightColumnDataTypeString:
                return @"STRING";
            case AWSQuicksightColumnDataTypeInteger:
                return @"INTEGER";
            case AWSQuicksightColumnDataTypeDecimal:
                return @"DECIMAL";
            case AWSQuicksightColumnDataTypeDatetime:
                return @"DATETIME";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightColumnGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"geoSpatialColumnGroup" : @"GeoSpatialColumnGroup",
             };
}

+ (NSValueTransformer *)geoSpatialColumnGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightGeoSpatialColumnGroup class]];
}

@end

@implementation AWSQuicksightColumnGroupColumnSchema

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSQuicksightColumnGroupSchema

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"columnGroupColumnSchemaList" : @"ColumnGroupColumnSchemaList",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)columnGroupColumnSchemaListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightColumnGroupColumnSchema class]];
}

@end

@implementation AWSQuicksightColumnSchema

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataType" : @"DataType",
             @"geographicRole" : @"GeographicRole",
             @"name" : @"Name",
             };
}

@end

@implementation AWSQuicksightColumnTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"columnGeographicRole" : @"ColumnGeographicRole",
             };
}

+ (NSValueTransformer *)columnGeographicRoleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COUNTRY"] == NSOrderedSame) {
            return @(AWSQuicksightGeoSpatialDataRoleCountry);
        }
        if ([value caseInsensitiveCompare:@"STATE"] == NSOrderedSame) {
            return @(AWSQuicksightGeoSpatialDataRoleState);
        }
        if ([value caseInsensitiveCompare:@"COUNTY"] == NSOrderedSame) {
            return @(AWSQuicksightGeoSpatialDataRoleCounty);
        }
        if ([value caseInsensitiveCompare:@"CITY"] == NSOrderedSame) {
            return @(AWSQuicksightGeoSpatialDataRoleCity);
        }
        if ([value caseInsensitiveCompare:@"POSTCODE"] == NSOrderedSame) {
            return @(AWSQuicksightGeoSpatialDataRolePostcode);
        }
        if ([value caseInsensitiveCompare:@"LONGITUDE"] == NSOrderedSame) {
            return @(AWSQuicksightGeoSpatialDataRoleLongitude);
        }
        if ([value caseInsensitiveCompare:@"LATITUDE"] == NSOrderedSame) {
            return @(AWSQuicksightGeoSpatialDataRoleLatitude);
        }
        return @(AWSQuicksightGeoSpatialDataRoleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightGeoSpatialDataRoleCountry:
                return @"COUNTRY";
            case AWSQuicksightGeoSpatialDataRoleState:
                return @"STATE";
            case AWSQuicksightGeoSpatialDataRoleCounty:
                return @"COUNTY";
            case AWSQuicksightGeoSpatialDataRoleCity:
                return @"CITY";
            case AWSQuicksightGeoSpatialDataRolePostcode:
                return @"POSTCODE";
            case AWSQuicksightGeoSpatialDataRoleLongitude:
                return @"LONGITUDE";
            case AWSQuicksightGeoSpatialDataRoleLatitude:
                return @"LATITUDE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightCreateColumnsOperation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"columns" : @"Columns",
             };
}

+ (NSValueTransformer *)columnsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightCalculatedColumn class]];
}

@end

@implementation AWSQuicksightCreateDashboardRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"dashboardId" : @"DashboardId",
             @"dashboardPublishOptions" : @"DashboardPublishOptions",
             @"name" : @"Name",
             @"parameters" : @"Parameters",
             @"permissions" : @"Permissions",
             @"sourceEntity" : @"SourceEntity",
             @"tags" : @"Tags",
             @"versionDescription" : @"VersionDescription",
             };
}

+ (NSValueTransformer *)dashboardPublishOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightDashboardPublishOptions class]];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightParameters class]];
}

+ (NSValueTransformer *)permissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightResourcePermission class]];
}

+ (NSValueTransformer *)sourceEntityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightDashboardSourceEntity class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightTag class]];
}

@end

@implementation AWSQuicksightCreateDashboardResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"creationStatus" : @"CreationStatus",
             @"dashboardId" : @"DashboardId",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             @"versionArn" : @"VersionArn",
             };
}

+ (NSValueTransformer *)creationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATION_SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationSuccessful);
        }
        if ([value caseInsensitiveCompare:@"CREATION_FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateSuccessful);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateFailed);
        }
        return @(AWSQuicksightResourceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightResourceStatusCreationInProgress:
                return @"CREATION_IN_PROGRESS";
            case AWSQuicksightResourceStatusCreationSuccessful:
                return @"CREATION_SUCCESSFUL";
            case AWSQuicksightResourceStatusCreationFailed:
                return @"CREATION_FAILED";
            case AWSQuicksightResourceStatusUpdateInProgress:
                return @"UPDATE_IN_PROGRESS";
            case AWSQuicksightResourceStatusUpdateSuccessful:
                return @"UPDATE_SUCCESSFUL";
            case AWSQuicksightResourceStatusUpdateFailed:
                return @"UPDATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightCreateDataSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"columnGroups" : @"ColumnGroups",
             @"dataSetId" : @"DataSetId",
             @"importMode" : @"ImportMode",
             @"logicalTableMap" : @"LogicalTableMap",
             @"name" : @"Name",
             @"permissions" : @"Permissions",
             @"physicalTableMap" : @"PhysicalTableMap",
             @"rowLevelPermissionDataSet" : @"RowLevelPermissionDataSet",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)columnGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightColumnGroup class]];
}

+ (NSValueTransformer *)importModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SPICE"] == NSOrderedSame) {
            return @(AWSQuicksightDataSetImportModeSpice);
        }
        if ([value caseInsensitiveCompare:@"DIRECT_QUERY"] == NSOrderedSame) {
            return @(AWSQuicksightDataSetImportModeDirectQuery);
        }
        return @(AWSQuicksightDataSetImportModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightDataSetImportModeSpice:
                return @"SPICE";
            case AWSQuicksightDataSetImportModeDirectQuery:
                return @"DIRECT_QUERY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)logicalTableMapJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSQuicksightLogicalTable class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)permissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightResourcePermission class]];
}

+ (NSValueTransformer *)physicalTableMapJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSQuicksightPhysicalTable class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)rowLevelPermissionDataSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightRowLevelPermissionDataSet class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightTag class]];
}

@end

@implementation AWSQuicksightCreateDataSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"dataSetId" : @"DataSetId",
             @"ingestionArn" : @"IngestionArn",
             @"ingestionId" : @"IngestionId",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

@end

@implementation AWSQuicksightCreateDataSourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"credentials" : @"Credentials",
             @"dataSourceId" : @"DataSourceId",
             @"dataSourceParameters" : @"DataSourceParameters",
             @"name" : @"Name",
             @"permissions" : @"Permissions",
             @"sslProperties" : @"SslProperties",
             @"tags" : @"Tags",
             @"types" : @"Type",
             @"vpcConnectionProperties" : @"VpcConnectionProperties",
             };
}

+ (NSValueTransformer *)credentialsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightDataSourceCredentials class]];
}

+ (NSValueTransformer *)dataSourceParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightDataSourceParameters class]];
}

+ (NSValueTransformer *)permissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightResourcePermission class]];
}

+ (NSValueTransformer *)sslPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightSslProperties class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightTag class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADOBE_ANALYTICS"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeAdobeAnalytics);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_ELASTICSEARCH"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeAmazonElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"ATHENA"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeAthena);
        }
        if ([value caseInsensitiveCompare:@"AURORA"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeAurora);
        }
        if ([value caseInsensitiveCompare:@"AURORA_POSTGRESQL"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeAuroraPostgresql);
        }
        if ([value caseInsensitiveCompare:@"AWS_IOT_ANALYTICS"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeAwsIotAnalytics);
        }
        if ([value caseInsensitiveCompare:@"GITHUB"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeGithub);
        }
        if ([value caseInsensitiveCompare:@"JIRA"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeJira);
        }
        if ([value caseInsensitiveCompare:@"MARIADB"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeMariadb);
        }
        if ([value caseInsensitiveCompare:@"MYSQL"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeMysql);
        }
        if ([value caseInsensitiveCompare:@"POSTGRESQL"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypePostgresql);
        }
        if ([value caseInsensitiveCompare:@"PRESTO"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypePresto);
        }
        if ([value caseInsensitiveCompare:@"REDSHIFT"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeRedshift);
        }
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeS3);
        }
        if ([value caseInsensitiveCompare:@"SALESFORCE"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeSalesforce);
        }
        if ([value caseInsensitiveCompare:@"SERVICENOW"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeServicenow);
        }
        if ([value caseInsensitiveCompare:@"SNOWFLAKE"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeSnowflake);
        }
        if ([value caseInsensitiveCompare:@"SPARK"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeSpark);
        }
        if ([value caseInsensitiveCompare:@"SQLSERVER"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeSqlserver);
        }
        if ([value caseInsensitiveCompare:@"TERADATA"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeTeradata);
        }
        if ([value caseInsensitiveCompare:@"TWITTER"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeTwitter);
        }
        return @(AWSQuicksightDataSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightDataSourceTypeAdobeAnalytics:
                return @"ADOBE_ANALYTICS";
            case AWSQuicksightDataSourceTypeAmazonElasticsearch:
                return @"AMAZON_ELASTICSEARCH";
            case AWSQuicksightDataSourceTypeAthena:
                return @"ATHENA";
            case AWSQuicksightDataSourceTypeAurora:
                return @"AURORA";
            case AWSQuicksightDataSourceTypeAuroraPostgresql:
                return @"AURORA_POSTGRESQL";
            case AWSQuicksightDataSourceTypeAwsIotAnalytics:
                return @"AWS_IOT_ANALYTICS";
            case AWSQuicksightDataSourceTypeGithub:
                return @"GITHUB";
            case AWSQuicksightDataSourceTypeJira:
                return @"JIRA";
            case AWSQuicksightDataSourceTypeMariadb:
                return @"MARIADB";
            case AWSQuicksightDataSourceTypeMysql:
                return @"MYSQL";
            case AWSQuicksightDataSourceTypePostgresql:
                return @"POSTGRESQL";
            case AWSQuicksightDataSourceTypePresto:
                return @"PRESTO";
            case AWSQuicksightDataSourceTypeRedshift:
                return @"REDSHIFT";
            case AWSQuicksightDataSourceTypeS3:
                return @"S3";
            case AWSQuicksightDataSourceTypeSalesforce:
                return @"SALESFORCE";
            case AWSQuicksightDataSourceTypeServicenow:
                return @"SERVICENOW";
            case AWSQuicksightDataSourceTypeSnowflake:
                return @"SNOWFLAKE";
            case AWSQuicksightDataSourceTypeSpark:
                return @"SPARK";
            case AWSQuicksightDataSourceTypeSqlserver:
                return @"SQLSERVER";
            case AWSQuicksightDataSourceTypeTeradata:
                return @"TERADATA";
            case AWSQuicksightDataSourceTypeTwitter:
                return @"TWITTER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vpcConnectionPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightVpcConnectionProperties class]];
}

@end

@implementation AWSQuicksightCreateDataSourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"creationStatus" : @"CreationStatus",
             @"dataSourceId" : @"DataSourceId",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)creationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATION_SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationSuccessful);
        }
        if ([value caseInsensitiveCompare:@"CREATION_FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateSuccessful);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateFailed);
        }
        return @(AWSQuicksightResourceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightResourceStatusCreationInProgress:
                return @"CREATION_IN_PROGRESS";
            case AWSQuicksightResourceStatusCreationSuccessful:
                return @"CREATION_SUCCESSFUL";
            case AWSQuicksightResourceStatusCreationFailed:
                return @"CREATION_FAILED";
            case AWSQuicksightResourceStatusUpdateInProgress:
                return @"UPDATE_IN_PROGRESS";
            case AWSQuicksightResourceStatusUpdateSuccessful:
                return @"UPDATE_SUCCESSFUL";
            case AWSQuicksightResourceStatusUpdateFailed:
                return @"UPDATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightCreateGroupMembershipRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"groupName" : @"GroupName",
             @"memberName" : @"MemberName",
             @"namespace" : @"Namespace",
             };
}

@end

@implementation AWSQuicksightCreateGroupMembershipResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupMember" : @"GroupMember",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)groupMemberJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightGroupMember class]];
}

@end

@implementation AWSQuicksightCreateGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"detail" : @"Description",
             @"groupName" : @"GroupName",
             @"namespace" : @"Namespace",
             };
}

@end

@implementation AWSQuicksightCreateGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"group" : @"Group",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)groupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightGroup class]];
}

@end

@implementation AWSQuicksightCreateIAMPolicyAssignmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assignmentName" : @"AssignmentName",
             @"assignmentStatus" : @"AssignmentStatus",
             @"awsAccountId" : @"AwsAccountId",
             @"identities" : @"Identities",
             @"namespace" : @"Namespace",
             @"policyArn" : @"PolicyArn",
             };
}

+ (NSValueTransformer *)assignmentStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSQuicksightAssignmentStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DRAFT"] == NSOrderedSame) {
            return @(AWSQuicksightAssignmentStatusDraft);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSQuicksightAssignmentStatusDisabled);
        }
        return @(AWSQuicksightAssignmentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightAssignmentStatusEnabled:
                return @"ENABLED";
            case AWSQuicksightAssignmentStatusDraft:
                return @"DRAFT";
            case AWSQuicksightAssignmentStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightCreateIAMPolicyAssignmentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assignmentId" : @"AssignmentId",
             @"assignmentName" : @"AssignmentName",
             @"assignmentStatus" : @"AssignmentStatus",
             @"identities" : @"Identities",
             @"policyArn" : @"PolicyArn",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)assignmentStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSQuicksightAssignmentStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DRAFT"] == NSOrderedSame) {
            return @(AWSQuicksightAssignmentStatusDraft);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSQuicksightAssignmentStatusDisabled);
        }
        return @(AWSQuicksightAssignmentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightAssignmentStatusEnabled:
                return @"ENABLED";
            case AWSQuicksightAssignmentStatusDraft:
                return @"DRAFT";
            case AWSQuicksightAssignmentStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightCreateIngestionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"dataSetId" : @"DataSetId",
             @"ingestionId" : @"IngestionId",
             };
}

@end

@implementation AWSQuicksightCreateIngestionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"ingestionId" : @"IngestionId",
             @"ingestionStatus" : @"IngestionStatus",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)ingestionStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZED"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionStatusInitialized);
        }
        if ([value caseInsensitiveCompare:@"QUEUED"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionStatusQueued);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionStatusCancelled);
        }
        return @(AWSQuicksightIngestionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightIngestionStatusInitialized:
                return @"INITIALIZED";
            case AWSQuicksightIngestionStatusQueued:
                return @"QUEUED";
            case AWSQuicksightIngestionStatusRunning:
                return @"RUNNING";
            case AWSQuicksightIngestionStatusFailed:
                return @"FAILED";
            case AWSQuicksightIngestionStatusCompleted:
                return @"COMPLETED";
            case AWSQuicksightIngestionStatusCancelled:
                return @"CANCELLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightCreateTemplateAliasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliasName" : @"AliasName",
             @"awsAccountId" : @"AwsAccountId",
             @"templateId" : @"TemplateId",
             @"templateVersionNumber" : @"TemplateVersionNumber",
             };
}

@end

@implementation AWSQuicksightCreateTemplateAliasResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             @"templateAlias" : @"TemplateAlias",
             };
}

+ (NSValueTransformer *)templateAliasJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightTemplateAlias class]];
}

@end

@implementation AWSQuicksightCreateTemplateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"name" : @"Name",
             @"permissions" : @"Permissions",
             @"sourceEntity" : @"SourceEntity",
             @"tags" : @"Tags",
             @"templateId" : @"TemplateId",
             @"versionDescription" : @"VersionDescription",
             };
}

+ (NSValueTransformer *)permissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightResourcePermission class]];
}

+ (NSValueTransformer *)sourceEntityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightTemplateSourceEntity class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightTag class]];
}

@end

@implementation AWSQuicksightCreateTemplateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"creationStatus" : @"CreationStatus",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             @"templateId" : @"TemplateId",
             @"versionArn" : @"VersionArn",
             };
}

+ (NSValueTransformer *)creationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATION_SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationSuccessful);
        }
        if ([value caseInsensitiveCompare:@"CREATION_FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateSuccessful);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateFailed);
        }
        return @(AWSQuicksightResourceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightResourceStatusCreationInProgress:
                return @"CREATION_IN_PROGRESS";
            case AWSQuicksightResourceStatusCreationSuccessful:
                return @"CREATION_SUCCESSFUL";
            case AWSQuicksightResourceStatusCreationFailed:
                return @"CREATION_FAILED";
            case AWSQuicksightResourceStatusUpdateInProgress:
                return @"UPDATE_IN_PROGRESS";
            case AWSQuicksightResourceStatusUpdateSuccessful:
                return @"UPDATE_SUCCESSFUL";
            case AWSQuicksightResourceStatusUpdateFailed:
                return @"UPDATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightCredentialPair

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alternateDataSourceParameters" : @"AlternateDataSourceParameters",
             @"password" : @"Password",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)alternateDataSourceParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightDataSourceParameters class]];
}

@end

@implementation AWSQuicksightCustomSql

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"columns" : @"Columns",
             @"dataSourceArn" : @"DataSourceArn",
             @"name" : @"Name",
             @"sqlQuery" : @"SqlQuery",
             };
}

+ (NSValueTransformer *)columnsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightInputColumn class]];
}

@end

@implementation AWSQuicksightDashboard

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdTime" : @"CreatedTime",
             @"dashboardId" : @"DashboardId",
             @"lastPublishedTime" : @"LastPublishedTime",
             @"lastUpdatedTime" : @"LastUpdatedTime",
             @"name" : @"Name",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastPublishedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)versionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightDashboardVersion class]];
}

@end

@implementation AWSQuicksightDashboardError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACCESS_DENIED"] == NSOrderedSame) {
            return @(AWSQuicksightDashboardErrorTypeAccessDenied);
        }
        if ([value caseInsensitiveCompare:@"SOURCE_NOT_FOUND"] == NSOrderedSame) {
            return @(AWSQuicksightDashboardErrorTypeSourceNotFound);
        }
        if ([value caseInsensitiveCompare:@"DATA_SET_NOT_FOUND"] == NSOrderedSame) {
            return @(AWSQuicksightDashboardErrorTypeDataSetNotFound);
        }
        if ([value caseInsensitiveCompare:@"INTERNAL_FAILURE"] == NSOrderedSame) {
            return @(AWSQuicksightDashboardErrorTypeInternalFailure);
        }
        if ([value caseInsensitiveCompare:@"PARAMETER_VALUE_INCOMPATIBLE"] == NSOrderedSame) {
            return @(AWSQuicksightDashboardErrorTypeParameterValueIncompatible);
        }
        if ([value caseInsensitiveCompare:@"PARAMETER_TYPE_INVALID"] == NSOrderedSame) {
            return @(AWSQuicksightDashboardErrorTypeParameterTypeInvalid);
        }
        if ([value caseInsensitiveCompare:@"PARAMETER_NOT_FOUND"] == NSOrderedSame) {
            return @(AWSQuicksightDashboardErrorTypeParameterNotFound);
        }
        if ([value caseInsensitiveCompare:@"COLUMN_TYPE_MISMATCH"] == NSOrderedSame) {
            return @(AWSQuicksightDashboardErrorTypeColumnTypeMismatch);
        }
        if ([value caseInsensitiveCompare:@"COLUMN_GEOGRAPHIC_ROLE_MISMATCH"] == NSOrderedSame) {
            return @(AWSQuicksightDashboardErrorTypeColumnGeographicRoleMismatch);
        }
        if ([value caseInsensitiveCompare:@"COLUMN_REPLACEMENT_MISSING"] == NSOrderedSame) {
            return @(AWSQuicksightDashboardErrorTypeColumnReplacementMissing);
        }
        return @(AWSQuicksightDashboardErrorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightDashboardErrorTypeAccessDenied:
                return @"ACCESS_DENIED";
            case AWSQuicksightDashboardErrorTypeSourceNotFound:
                return @"SOURCE_NOT_FOUND";
            case AWSQuicksightDashboardErrorTypeDataSetNotFound:
                return @"DATA_SET_NOT_FOUND";
            case AWSQuicksightDashboardErrorTypeInternalFailure:
                return @"INTERNAL_FAILURE";
            case AWSQuicksightDashboardErrorTypeParameterValueIncompatible:
                return @"PARAMETER_VALUE_INCOMPATIBLE";
            case AWSQuicksightDashboardErrorTypeParameterTypeInvalid:
                return @"PARAMETER_TYPE_INVALID";
            case AWSQuicksightDashboardErrorTypeParameterNotFound:
                return @"PARAMETER_NOT_FOUND";
            case AWSQuicksightDashboardErrorTypeColumnTypeMismatch:
                return @"COLUMN_TYPE_MISMATCH";
            case AWSQuicksightDashboardErrorTypeColumnGeographicRoleMismatch:
                return @"COLUMN_GEOGRAPHIC_ROLE_MISMATCH";
            case AWSQuicksightDashboardErrorTypeColumnReplacementMissing:
                return @"COLUMN_REPLACEMENT_MISSING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightDashboardPublishOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adHocFilteringOption" : @"AdHocFilteringOption",
             @"exportToCSVOption" : @"ExportToCSVOption",
             @"sheetControlsOption" : @"SheetControlsOption",
             };
}

+ (NSValueTransformer *)adHocFilteringOptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightAdHocFilteringOption class]];
}

+ (NSValueTransformer *)exportToCSVOptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightExportToCSVOption class]];
}

+ (NSValueTransformer *)sheetControlsOptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightSheetControlsOption class]];
}

@end

@implementation AWSQuicksightDashboardSearchFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"operator" : @"Operator",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"QUICKSIGHT_USER"] == NSOrderedSame) {
            return @(AWSQuicksightDashboardFilterAttributeQuicksightUser);
        }
        return @(AWSQuicksightDashboardFilterAttributeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightDashboardFilterAttributeQuicksightUser:
                return @"QUICKSIGHT_USER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)operatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"StringEquals"] == NSOrderedSame) {
            return @(AWSQuicksightFilterOperatorStringEquals);
        }
        return @(AWSQuicksightFilterOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightFilterOperatorStringEquals:
                return @"StringEquals";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightDashboardSourceEntity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceTemplate" : @"SourceTemplate",
             };
}

+ (NSValueTransformer *)sourceTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightDashboardSourceTemplate class]];
}

@end

@implementation AWSQuicksightDashboardSourceTemplate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"dataSetReferences" : @"DataSetReferences",
             };
}

+ (NSValueTransformer *)dataSetReferencesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightDataSetReference class]];
}

@end

@implementation AWSQuicksightDashboardSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdTime" : @"CreatedTime",
             @"dashboardId" : @"DashboardId",
             @"lastPublishedTime" : @"LastPublishedTime",
             @"lastUpdatedTime" : @"LastUpdatedTime",
             @"name" : @"Name",
             @"publishedVersionNumber" : @"PublishedVersionNumber",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastPublishedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSQuicksightDashboardVersion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdTime" : @"CreatedTime",
             @"dataSetArns" : @"DataSetArns",
             @"detail" : @"Description",
             @"errors" : @"Errors",
             @"sourceEntityArn" : @"SourceEntityArn",
             @"status" : @"Status",
             @"versionNumber" : @"VersionNumber",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightDashboardError class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATION_SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationSuccessful);
        }
        if ([value caseInsensitiveCompare:@"CREATION_FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateSuccessful);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateFailed);
        }
        return @(AWSQuicksightResourceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightResourceStatusCreationInProgress:
                return @"CREATION_IN_PROGRESS";
            case AWSQuicksightResourceStatusCreationSuccessful:
                return @"CREATION_SUCCESSFUL";
            case AWSQuicksightResourceStatusCreationFailed:
                return @"CREATION_FAILED";
            case AWSQuicksightResourceStatusUpdateInProgress:
                return @"UPDATE_IN_PROGRESS";
            case AWSQuicksightResourceStatusUpdateSuccessful:
                return @"UPDATE_SUCCESSFUL";
            case AWSQuicksightResourceStatusUpdateFailed:
                return @"UPDATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightDashboardVersionSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdTime" : @"CreatedTime",
             @"detail" : @"Description",
             @"sourceEntityArn" : @"SourceEntityArn",
             @"status" : @"Status",
             @"versionNumber" : @"VersionNumber",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATION_SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationSuccessful);
        }
        if ([value caseInsensitiveCompare:@"CREATION_FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateSuccessful);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateFailed);
        }
        return @(AWSQuicksightResourceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightResourceStatusCreationInProgress:
                return @"CREATION_IN_PROGRESS";
            case AWSQuicksightResourceStatusCreationSuccessful:
                return @"CREATION_SUCCESSFUL";
            case AWSQuicksightResourceStatusCreationFailed:
                return @"CREATION_FAILED";
            case AWSQuicksightResourceStatusUpdateInProgress:
                return @"UPDATE_IN_PROGRESS";
            case AWSQuicksightResourceStatusUpdateSuccessful:
                return @"UPDATE_SUCCESSFUL";
            case AWSQuicksightResourceStatusUpdateFailed:
                return @"UPDATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightDataSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"columnGroups" : @"ColumnGroups",
             @"consumedSpiceCapacityInBytes" : @"ConsumedSpiceCapacityInBytes",
             @"createdTime" : @"CreatedTime",
             @"dataSetId" : @"DataSetId",
             @"importMode" : @"ImportMode",
             @"lastUpdatedTime" : @"LastUpdatedTime",
             @"logicalTableMap" : @"LogicalTableMap",
             @"name" : @"Name",
             @"outputColumns" : @"OutputColumns",
             @"physicalTableMap" : @"PhysicalTableMap",
             @"rowLevelPermissionDataSet" : @"RowLevelPermissionDataSet",
             };
}

+ (NSValueTransformer *)columnGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightColumnGroup class]];
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)importModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SPICE"] == NSOrderedSame) {
            return @(AWSQuicksightDataSetImportModeSpice);
        }
        if ([value caseInsensitiveCompare:@"DIRECT_QUERY"] == NSOrderedSame) {
            return @(AWSQuicksightDataSetImportModeDirectQuery);
        }
        return @(AWSQuicksightDataSetImportModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightDataSetImportModeSpice:
                return @"SPICE";
            case AWSQuicksightDataSetImportModeDirectQuery:
                return @"DIRECT_QUERY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)logicalTableMapJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSQuicksightLogicalTable class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)outputColumnsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightOutputColumn class]];
}

+ (NSValueTransformer *)physicalTableMapJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSQuicksightPhysicalTable class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)rowLevelPermissionDataSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightRowLevelPermissionDataSet class]];
}

@end

@implementation AWSQuicksightDataSetConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"columnGroupSchemaList" : @"ColumnGroupSchemaList",
             @"dataSetSchema" : @"DataSetSchema",
             @"placeholder" : @"Placeholder",
             };
}

+ (NSValueTransformer *)columnGroupSchemaListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightColumnGroupSchema class]];
}

+ (NSValueTransformer *)dataSetSchemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightDataSetSchema class]];
}

@end

@implementation AWSQuicksightDataSetReference

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSetArn" : @"DataSetArn",
             @"dataSetPlaceholder" : @"DataSetPlaceholder",
             };
}

@end

@implementation AWSQuicksightDataSetSchema

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"columnSchemaList" : @"ColumnSchemaList",
             };
}

+ (NSValueTransformer *)columnSchemaListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightColumnSchema class]];
}

@end

@implementation AWSQuicksightDataSetSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdTime" : @"CreatedTime",
             @"dataSetId" : @"DataSetId",
             @"importMode" : @"ImportMode",
             @"lastUpdatedTime" : @"LastUpdatedTime",
             @"name" : @"Name",
             @"rowLevelPermissionDataSet" : @"RowLevelPermissionDataSet",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)importModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SPICE"] == NSOrderedSame) {
            return @(AWSQuicksightDataSetImportModeSpice);
        }
        if ([value caseInsensitiveCompare:@"DIRECT_QUERY"] == NSOrderedSame) {
            return @(AWSQuicksightDataSetImportModeDirectQuery);
        }
        return @(AWSQuicksightDataSetImportModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightDataSetImportModeSpice:
                return @"SPICE";
            case AWSQuicksightDataSetImportModeDirectQuery:
                return @"DIRECT_QUERY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)rowLevelPermissionDataSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightRowLevelPermissionDataSet class]];
}

@end

@implementation AWSQuicksightDataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alternateDataSourceParameters" : @"AlternateDataSourceParameters",
             @"arn" : @"Arn",
             @"createdTime" : @"CreatedTime",
             @"dataSourceId" : @"DataSourceId",
             @"dataSourceParameters" : @"DataSourceParameters",
             @"errorInfo" : @"ErrorInfo",
             @"lastUpdatedTime" : @"LastUpdatedTime",
             @"name" : @"Name",
             @"sslProperties" : @"SslProperties",
             @"status" : @"Status",
             @"types" : @"Type",
             @"vpcConnectionProperties" : @"VpcConnectionProperties",
             };
}

+ (NSValueTransformer *)alternateDataSourceParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightDataSourceParameters class]];
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)dataSourceParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightDataSourceParameters class]];
}

+ (NSValueTransformer *)errorInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightDataSourceErrorInfo class]];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sslPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightSslProperties class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATION_SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationSuccessful);
        }
        if ([value caseInsensitiveCompare:@"CREATION_FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateSuccessful);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateFailed);
        }
        return @(AWSQuicksightResourceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightResourceStatusCreationInProgress:
                return @"CREATION_IN_PROGRESS";
            case AWSQuicksightResourceStatusCreationSuccessful:
                return @"CREATION_SUCCESSFUL";
            case AWSQuicksightResourceStatusCreationFailed:
                return @"CREATION_FAILED";
            case AWSQuicksightResourceStatusUpdateInProgress:
                return @"UPDATE_IN_PROGRESS";
            case AWSQuicksightResourceStatusUpdateSuccessful:
                return @"UPDATE_SUCCESSFUL";
            case AWSQuicksightResourceStatusUpdateFailed:
                return @"UPDATE_FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADOBE_ANALYTICS"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeAdobeAnalytics);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_ELASTICSEARCH"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeAmazonElasticsearch);
        }
        if ([value caseInsensitiveCompare:@"ATHENA"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeAthena);
        }
        if ([value caseInsensitiveCompare:@"AURORA"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeAurora);
        }
        if ([value caseInsensitiveCompare:@"AURORA_POSTGRESQL"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeAuroraPostgresql);
        }
        if ([value caseInsensitiveCompare:@"AWS_IOT_ANALYTICS"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeAwsIotAnalytics);
        }
        if ([value caseInsensitiveCompare:@"GITHUB"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeGithub);
        }
        if ([value caseInsensitiveCompare:@"JIRA"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeJira);
        }
        if ([value caseInsensitiveCompare:@"MARIADB"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeMariadb);
        }
        if ([value caseInsensitiveCompare:@"MYSQL"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeMysql);
        }
        if ([value caseInsensitiveCompare:@"POSTGRESQL"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypePostgresql);
        }
        if ([value caseInsensitiveCompare:@"PRESTO"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypePresto);
        }
        if ([value caseInsensitiveCompare:@"REDSHIFT"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeRedshift);
        }
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeS3);
        }
        if ([value caseInsensitiveCompare:@"SALESFORCE"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeSalesforce);
        }
        if ([value caseInsensitiveCompare:@"SERVICENOW"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeServicenow);
        }
        if ([value caseInsensitiveCompare:@"SNOWFLAKE"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeSnowflake);
        }
        if ([value caseInsensitiveCompare:@"SPARK"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeSpark);
        }
        if ([value caseInsensitiveCompare:@"SQLSERVER"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeSqlserver);
        }
        if ([value caseInsensitiveCompare:@"TERADATA"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeTeradata);
        }
        if ([value caseInsensitiveCompare:@"TWITTER"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceTypeTwitter);
        }
        return @(AWSQuicksightDataSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightDataSourceTypeAdobeAnalytics:
                return @"ADOBE_ANALYTICS";
            case AWSQuicksightDataSourceTypeAmazonElasticsearch:
                return @"AMAZON_ELASTICSEARCH";
            case AWSQuicksightDataSourceTypeAthena:
                return @"ATHENA";
            case AWSQuicksightDataSourceTypeAurora:
                return @"AURORA";
            case AWSQuicksightDataSourceTypeAuroraPostgresql:
                return @"AURORA_POSTGRESQL";
            case AWSQuicksightDataSourceTypeAwsIotAnalytics:
                return @"AWS_IOT_ANALYTICS";
            case AWSQuicksightDataSourceTypeGithub:
                return @"GITHUB";
            case AWSQuicksightDataSourceTypeJira:
                return @"JIRA";
            case AWSQuicksightDataSourceTypeMariadb:
                return @"MARIADB";
            case AWSQuicksightDataSourceTypeMysql:
                return @"MYSQL";
            case AWSQuicksightDataSourceTypePostgresql:
                return @"POSTGRESQL";
            case AWSQuicksightDataSourceTypePresto:
                return @"PRESTO";
            case AWSQuicksightDataSourceTypeRedshift:
                return @"REDSHIFT";
            case AWSQuicksightDataSourceTypeS3:
                return @"S3";
            case AWSQuicksightDataSourceTypeSalesforce:
                return @"SALESFORCE";
            case AWSQuicksightDataSourceTypeServicenow:
                return @"SERVICENOW";
            case AWSQuicksightDataSourceTypeSnowflake:
                return @"SNOWFLAKE";
            case AWSQuicksightDataSourceTypeSpark:
                return @"SPARK";
            case AWSQuicksightDataSourceTypeSqlserver:
                return @"SQLSERVER";
            case AWSQuicksightDataSourceTypeTeradata:
                return @"TERADATA";
            case AWSQuicksightDataSourceTypeTwitter:
                return @"TWITTER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vpcConnectionPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightVpcConnectionProperties class]];
}

@end

@implementation AWSQuicksightDataSourceCredentials

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicateSourceArn" : @"CopySourceArn",
             @"credentialPair" : @"CredentialPair",
             };
}

+ (NSValueTransformer *)credentialPairJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightCredentialPair class]];
}

@end

@implementation AWSQuicksightDataSourceErrorInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACCESS_DENIED"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceErrorInfoTypeAccessDenied);
        }
        if ([value caseInsensitiveCompare:@"COPY_SOURCE_NOT_FOUND"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceErrorInfoTypeCopySourceNotFound);
        }
        if ([value caseInsensitiveCompare:@"TIMEOUT"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceErrorInfoTypeTimeout);
        }
        if ([value caseInsensitiveCompare:@"ENGINE_VERSION_NOT_SUPPORTED"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceErrorInfoTypeEngineVersionNotSupported);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN_HOST"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceErrorInfoTypeUnknownHost);
        }
        if ([value caseInsensitiveCompare:@"GENERIC_SQL_FAILURE"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceErrorInfoTypeGenericSqlFailure);
        }
        if ([value caseInsensitiveCompare:@"CONFLICT"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceErrorInfoTypeConflict);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN"] == NSOrderedSame) {
            return @(AWSQuicksightDataSourceErrorInfoTypeUnknown);
        }
        return @(AWSQuicksightDataSourceErrorInfoTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightDataSourceErrorInfoTypeAccessDenied:
                return @"ACCESS_DENIED";
            case AWSQuicksightDataSourceErrorInfoTypeCopySourceNotFound:
                return @"COPY_SOURCE_NOT_FOUND";
            case AWSQuicksightDataSourceErrorInfoTypeTimeout:
                return @"TIMEOUT";
            case AWSQuicksightDataSourceErrorInfoTypeEngineVersionNotSupported:
                return @"ENGINE_VERSION_NOT_SUPPORTED";
            case AWSQuicksightDataSourceErrorInfoTypeUnknownHost:
                return @"UNKNOWN_HOST";
            case AWSQuicksightDataSourceErrorInfoTypeGenericSqlFailure:
                return @"GENERIC_SQL_FAILURE";
            case AWSQuicksightDataSourceErrorInfoTypeConflict:
                return @"CONFLICT";
            case AWSQuicksightDataSourceErrorInfoTypeUnknown:
                return @"UNKNOWN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightDataSourceParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amazonElasticsearchParameters" : @"AmazonElasticsearchParameters",
             @"athenaParameters" : @"AthenaParameters",
             @"auroraParameters" : @"AuroraParameters",
             @"auroraPostgreSqlParameters" : @"AuroraPostgreSqlParameters",
             @"awsIotAnalyticsParameters" : @"AwsIotAnalyticsParameters",
             @"jiraParameters" : @"JiraParameters",
             @"mariaDbParameters" : @"MariaDbParameters",
             @"mySqlParameters" : @"MySqlParameters",
             @"postgreSqlParameters" : @"PostgreSqlParameters",
             @"prestoParameters" : @"PrestoParameters",
             @"rdsParameters" : @"RdsParameters",
             @"redshiftParameters" : @"RedshiftParameters",
             @"s3Parameters" : @"S3Parameters",
             @"serviceNowParameters" : @"ServiceNowParameters",
             @"snowflakeParameters" : @"SnowflakeParameters",
             @"sparkParameters" : @"SparkParameters",
             @"sqlServerParameters" : @"SqlServerParameters",
             @"teradataParameters" : @"TeradataParameters",
             @"twitterParameters" : @"TwitterParameters",
             };
}

+ (NSValueTransformer *)amazonElasticsearchParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightAmazonElasticsearchParameters class]];
}

+ (NSValueTransformer *)athenaParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightAthenaParameters class]];
}

+ (NSValueTransformer *)auroraParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightAuroraParameters class]];
}

+ (NSValueTransformer *)auroraPostgreSqlParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightAuroraPostgreSqlParameters class]];
}

+ (NSValueTransformer *)awsIotAnalyticsParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightAwsIotAnalyticsParameters class]];
}

+ (NSValueTransformer *)jiraParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightJiraParameters class]];
}

+ (NSValueTransformer *)mariaDbParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightMariaDbParameters class]];
}

+ (NSValueTransformer *)mySqlParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightMySqlParameters class]];
}

+ (NSValueTransformer *)postgreSqlParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightPostgreSqlParameters class]];
}

+ (NSValueTransformer *)prestoParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightPrestoParameters class]];
}

+ (NSValueTransformer *)rdsParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightRdsParameters class]];
}

+ (NSValueTransformer *)redshiftParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightRedshiftParameters class]];
}

+ (NSValueTransformer *)s3ParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightS3Parameters class]];
}

+ (NSValueTransformer *)serviceNowParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightServiceNowParameters class]];
}

+ (NSValueTransformer *)snowflakeParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightSnowflakeParameters class]];
}

+ (NSValueTransformer *)sparkParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightSparkParameters class]];
}

+ (NSValueTransformer *)sqlServerParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightSqlServerParameters class]];
}

+ (NSValueTransformer *)teradataParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightTeradataParameters class]];
}

+ (NSValueTransformer *)twitterParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightTwitterParameters class]];
}

@end

@implementation AWSQuicksightDateTimeParameter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"values" : @"Values",
             };
}

@end

@implementation AWSQuicksightDecimalParameter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"values" : @"Values",
             };
}

@end

@implementation AWSQuicksightDeleteDashboardRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"dashboardId" : @"DashboardId",
             @"versionNumber" : @"VersionNumber",
             };
}

@end

@implementation AWSQuicksightDeleteDashboardResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"dashboardId" : @"DashboardId",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

@end

@implementation AWSQuicksightDeleteDataSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"dataSetId" : @"DataSetId",
             };
}

@end

@implementation AWSQuicksightDeleteDataSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"dataSetId" : @"DataSetId",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

@end

@implementation AWSQuicksightDeleteDataSourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"dataSourceId" : @"DataSourceId",
             };
}

@end

@implementation AWSQuicksightDeleteDataSourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"dataSourceId" : @"DataSourceId",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

@end

@implementation AWSQuicksightDeleteGroupMembershipRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"groupName" : @"GroupName",
             @"memberName" : @"MemberName",
             @"namespace" : @"Namespace",
             };
}

@end

@implementation AWSQuicksightDeleteGroupMembershipResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

@end

@implementation AWSQuicksightDeleteGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"groupName" : @"GroupName",
             @"namespace" : @"Namespace",
             };
}

@end

@implementation AWSQuicksightDeleteGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

@end

@implementation AWSQuicksightDeleteIAMPolicyAssignmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assignmentName" : @"AssignmentName",
             @"awsAccountId" : @"AwsAccountId",
             @"namespace" : @"Namespace",
             };
}

@end

@implementation AWSQuicksightDeleteIAMPolicyAssignmentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assignmentName" : @"AssignmentName",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

@end

@implementation AWSQuicksightDeleteTemplateAliasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliasName" : @"AliasName",
             @"awsAccountId" : @"AwsAccountId",
             @"templateId" : @"TemplateId",
             };
}

@end

@implementation AWSQuicksightDeleteTemplateAliasResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliasName" : @"AliasName",
             @"arn" : @"Arn",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             @"templateId" : @"TemplateId",
             };
}

@end

@implementation AWSQuicksightDeleteTemplateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"templateId" : @"TemplateId",
             @"versionNumber" : @"VersionNumber",
             };
}

@end

@implementation AWSQuicksightDeleteTemplateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             @"templateId" : @"TemplateId",
             };
}

@end

@implementation AWSQuicksightDeleteUserByPrincipalIdRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"namespace" : @"Namespace",
             @"principalId" : @"PrincipalId",
             };
}

@end

@implementation AWSQuicksightDeleteUserByPrincipalIdResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

@end

@implementation AWSQuicksightDeleteUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"namespace" : @"Namespace",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSQuicksightDeleteUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

@end

@implementation AWSQuicksightDescribeDashboardPermissionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"dashboardId" : @"DashboardId",
             };
}

@end

@implementation AWSQuicksightDescribeDashboardPermissionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dashboardArn" : @"DashboardArn",
             @"dashboardId" : @"DashboardId",
             @"permissions" : @"Permissions",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)permissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightResourcePermission class]];
}

@end

@implementation AWSQuicksightDescribeDashboardRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliasName" : @"AliasName",
             @"awsAccountId" : @"AwsAccountId",
             @"dashboardId" : @"DashboardId",
             @"versionNumber" : @"VersionNumber",
             };
}

@end

@implementation AWSQuicksightDescribeDashboardResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dashboard" : @"Dashboard",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)dashboardJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightDashboard class]];
}

@end

@implementation AWSQuicksightDescribeDataSetPermissionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"dataSetId" : @"DataSetId",
             };
}

@end

@implementation AWSQuicksightDescribeDataSetPermissionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSetArn" : @"DataSetArn",
             @"dataSetId" : @"DataSetId",
             @"permissions" : @"Permissions",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)permissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightResourcePermission class]];
}

@end

@implementation AWSQuicksightDescribeDataSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"dataSetId" : @"DataSetId",
             };
}

@end

@implementation AWSQuicksightDescribeDataSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSet" : @"DataSet",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)dataSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightDataSet class]];
}

@end

@implementation AWSQuicksightDescribeDataSourcePermissionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"dataSourceId" : @"DataSourceId",
             };
}

@end

@implementation AWSQuicksightDescribeDataSourcePermissionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSourceArn" : @"DataSourceArn",
             @"dataSourceId" : @"DataSourceId",
             @"permissions" : @"Permissions",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)permissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightResourcePermission class]];
}

@end

@implementation AWSQuicksightDescribeDataSourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"dataSourceId" : @"DataSourceId",
             };
}

@end

@implementation AWSQuicksightDescribeDataSourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSource" : @"DataSource",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)dataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightDataSource class]];
}

@end

@implementation AWSQuicksightDescribeGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"groupName" : @"GroupName",
             @"namespace" : @"Namespace",
             };
}

@end

@implementation AWSQuicksightDescribeGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"group" : @"Group",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)groupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightGroup class]];
}

@end

@implementation AWSQuicksightDescribeIAMPolicyAssignmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assignmentName" : @"AssignmentName",
             @"awsAccountId" : @"AwsAccountId",
             @"namespace" : @"Namespace",
             };
}

@end

@implementation AWSQuicksightDescribeIAMPolicyAssignmentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"IAMPolicyAssignment" : @"IAMPolicyAssignment",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)IAMPolicyAssignmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightIAMPolicyAssignment class]];
}

@end

@implementation AWSQuicksightDescribeIngestionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"dataSetId" : @"DataSetId",
             @"ingestionId" : @"IngestionId",
             };
}

@end

@implementation AWSQuicksightDescribeIngestionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ingestion" : @"Ingestion",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)ingestionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightIngestion class]];
}

@end

@implementation AWSQuicksightDescribeTemplateAliasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliasName" : @"AliasName",
             @"awsAccountId" : @"AwsAccountId",
             @"templateId" : @"TemplateId",
             };
}

@end

@implementation AWSQuicksightDescribeTemplateAliasResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             @"templateAlias" : @"TemplateAlias",
             };
}

+ (NSValueTransformer *)templateAliasJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightTemplateAlias class]];
}

@end

@implementation AWSQuicksightDescribeTemplatePermissionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"templateId" : @"TemplateId",
             };
}

@end

@implementation AWSQuicksightDescribeTemplatePermissionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"permissions" : @"Permissions",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             @"templateArn" : @"TemplateArn",
             @"templateId" : @"TemplateId",
             };
}

+ (NSValueTransformer *)permissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightResourcePermission class]];
}

@end

@implementation AWSQuicksightDescribeTemplateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliasName" : @"AliasName",
             @"awsAccountId" : @"AwsAccountId",
             @"templateId" : @"TemplateId",
             @"versionNumber" : @"VersionNumber",
             };
}

@end

@implementation AWSQuicksightDescribeTemplateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             @"template" : @"Template",
             };
}

+ (NSValueTransformer *)templateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightTemplate class]];
}

@end

@implementation AWSQuicksightDescribeUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"namespace" : @"Namespace",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSQuicksightDescribeUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightUser class]];
}

@end

@implementation AWSQuicksightErrorInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FAILURE_TO_ASSUME_ROLE"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeFailureToAssumeRole);
        }
        if ([value caseInsensitiveCompare:@"INGESTION_SUPERSEDED"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeIngestionSuperseded);
        }
        if ([value caseInsensitiveCompare:@"INGESTION_CANCELED"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeIngestionCanceled);
        }
        if ([value caseInsensitiveCompare:@"DATA_SET_DELETED"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeDataSetDeleted);
        }
        if ([value caseInsensitiveCompare:@"DATA_SET_NOT_SPICE"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeDataSetNotSpice);
        }
        if ([value caseInsensitiveCompare:@"S3_UPLOADED_FILE_DELETED"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeS3UploadedFileDeleted);
        }
        if ([value caseInsensitiveCompare:@"S3_MANIFEST_ERROR"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeS3ManifestError);
        }
        if ([value caseInsensitiveCompare:@"DATA_TOLERANCE_EXCEPTION"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeDataToleranceException);
        }
        if ([value caseInsensitiveCompare:@"SPICE_TABLE_NOT_FOUND"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeSpiceTableNotFound);
        }
        if ([value caseInsensitiveCompare:@"DATA_SET_SIZE_LIMIT_EXCEEDED"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeDataSetSizeLimitExceeded);
        }
        if ([value caseInsensitiveCompare:@"ROW_SIZE_LIMIT_EXCEEDED"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeRowSizeLimitExceeded);
        }
        if ([value caseInsensitiveCompare:@"ACCOUNT_CAPACITY_LIMIT_EXCEEDED"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeAccountCapacityLimitExceeded);
        }
        if ([value caseInsensitiveCompare:@"CUSTOMER_ERROR"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeCustomerError);
        }
        if ([value caseInsensitiveCompare:@"DATA_SOURCE_NOT_FOUND"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeDataSourceNotFound);
        }
        if ([value caseInsensitiveCompare:@"IAM_ROLE_NOT_AVAILABLE"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeIamRoleNotAvailable);
        }
        if ([value caseInsensitiveCompare:@"CONNECTION_FAILURE"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeConnectionFailure);
        }
        if ([value caseInsensitiveCompare:@"SQL_TABLE_NOT_FOUND"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeSqlTableNotFound);
        }
        if ([value caseInsensitiveCompare:@"PERMISSION_DENIED"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypePermissionDenied);
        }
        if ([value caseInsensitiveCompare:@"SSL_CERTIFICATE_VALIDATION_FAILURE"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeSslCertificateValidationFailure);
        }
        if ([value caseInsensitiveCompare:@"OAUTH_TOKEN_FAILURE"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeOauthTokenFailure);
        }
        if ([value caseInsensitiveCompare:@"SOURCE_API_LIMIT_EXCEEDED_FAILURE"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeSourceApiLimitExceededFailure);
        }
        if ([value caseInsensitiveCompare:@"PASSWORD_AUTHENTICATION_FAILURE"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypePasswordAuthenticationFailure);
        }
        if ([value caseInsensitiveCompare:@"SQL_SCHEMA_MISMATCH_ERROR"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeSqlSchemaMismatchError);
        }
        if ([value caseInsensitiveCompare:@"INVALID_DATE_FORMAT"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeInvalidDateFormat);
        }
        if ([value caseInsensitiveCompare:@"INVALID_DATAPREP_SYNTAX"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeInvalidDataprepSyntax);
        }
        if ([value caseInsensitiveCompare:@"SOURCE_RESOURCE_LIMIT_EXCEEDED"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeSourceResourceLimitExceeded);
        }
        if ([value caseInsensitiveCompare:@"SQL_INVALID_PARAMETER_VALUE"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeSqlInvalidParameterValue);
        }
        if ([value caseInsensitiveCompare:@"QUERY_TIMEOUT"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeQueryTimeout);
        }
        if ([value caseInsensitiveCompare:@"SQL_NUMERIC_OVERFLOW"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeSqlNumericOverflow);
        }
        if ([value caseInsensitiveCompare:@"UNRESOLVABLE_HOST"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeUnresolvableHost);
        }
        if ([value caseInsensitiveCompare:@"UNROUTABLE_HOST"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeUnroutableHost);
        }
        if ([value caseInsensitiveCompare:@"SQL_EXCEPTION"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeSqlException);
        }
        if ([value caseInsensitiveCompare:@"S3_FILE_INACCESSIBLE"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeS3FileInaccessible);
        }
        if ([value caseInsensitiveCompare:@"IOT_FILE_NOT_FOUND"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeIotFileNotFound);
        }
        if ([value caseInsensitiveCompare:@"IOT_DATA_SET_FILE_EMPTY"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeIotDataSetFileEmpty);
        }
        if ([value caseInsensitiveCompare:@"INVALID_DATA_SOURCE_CONFIG"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeInvalidDataSourceConfig);
        }
        if ([value caseInsensitiveCompare:@"DATA_SOURCE_AUTH_FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeDataSourceAuthFailed);
        }
        if ([value caseInsensitiveCompare:@"DATA_SOURCE_CONNECTION_FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeDataSourceConnectionFailed);
        }
        if ([value caseInsensitiveCompare:@"FAILURE_TO_PROCESS_JSON_FILE"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeFailureToProcessJsonFile);
        }
        if ([value caseInsensitiveCompare:@"INTERNAL_SERVICE_ERROR"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionErrorTypeInternalServiceError);
        }
        return @(AWSQuicksightIngestionErrorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightIngestionErrorTypeFailureToAssumeRole:
                return @"FAILURE_TO_ASSUME_ROLE";
            case AWSQuicksightIngestionErrorTypeIngestionSuperseded:
                return @"INGESTION_SUPERSEDED";
            case AWSQuicksightIngestionErrorTypeIngestionCanceled:
                return @"INGESTION_CANCELED";
            case AWSQuicksightIngestionErrorTypeDataSetDeleted:
                return @"DATA_SET_DELETED";
            case AWSQuicksightIngestionErrorTypeDataSetNotSpice:
                return @"DATA_SET_NOT_SPICE";
            case AWSQuicksightIngestionErrorTypeS3UploadedFileDeleted:
                return @"S3_UPLOADED_FILE_DELETED";
            case AWSQuicksightIngestionErrorTypeS3ManifestError:
                return @"S3_MANIFEST_ERROR";
            case AWSQuicksightIngestionErrorTypeDataToleranceException:
                return @"DATA_TOLERANCE_EXCEPTION";
            case AWSQuicksightIngestionErrorTypeSpiceTableNotFound:
                return @"SPICE_TABLE_NOT_FOUND";
            case AWSQuicksightIngestionErrorTypeDataSetSizeLimitExceeded:
                return @"DATA_SET_SIZE_LIMIT_EXCEEDED";
            case AWSQuicksightIngestionErrorTypeRowSizeLimitExceeded:
                return @"ROW_SIZE_LIMIT_EXCEEDED";
            case AWSQuicksightIngestionErrorTypeAccountCapacityLimitExceeded:
                return @"ACCOUNT_CAPACITY_LIMIT_EXCEEDED";
            case AWSQuicksightIngestionErrorTypeCustomerError:
                return @"CUSTOMER_ERROR";
            case AWSQuicksightIngestionErrorTypeDataSourceNotFound:
                return @"DATA_SOURCE_NOT_FOUND";
            case AWSQuicksightIngestionErrorTypeIamRoleNotAvailable:
                return @"IAM_ROLE_NOT_AVAILABLE";
            case AWSQuicksightIngestionErrorTypeConnectionFailure:
                return @"CONNECTION_FAILURE";
            case AWSQuicksightIngestionErrorTypeSqlTableNotFound:
                return @"SQL_TABLE_NOT_FOUND";
            case AWSQuicksightIngestionErrorTypePermissionDenied:
                return @"PERMISSION_DENIED";
            case AWSQuicksightIngestionErrorTypeSslCertificateValidationFailure:
                return @"SSL_CERTIFICATE_VALIDATION_FAILURE";
            case AWSQuicksightIngestionErrorTypeOauthTokenFailure:
                return @"OAUTH_TOKEN_FAILURE";
            case AWSQuicksightIngestionErrorTypeSourceApiLimitExceededFailure:
                return @"SOURCE_API_LIMIT_EXCEEDED_FAILURE";
            case AWSQuicksightIngestionErrorTypePasswordAuthenticationFailure:
                return @"PASSWORD_AUTHENTICATION_FAILURE";
            case AWSQuicksightIngestionErrorTypeSqlSchemaMismatchError:
                return @"SQL_SCHEMA_MISMATCH_ERROR";
            case AWSQuicksightIngestionErrorTypeInvalidDateFormat:
                return @"INVALID_DATE_FORMAT";
            case AWSQuicksightIngestionErrorTypeInvalidDataprepSyntax:
                return @"INVALID_DATAPREP_SYNTAX";
            case AWSQuicksightIngestionErrorTypeSourceResourceLimitExceeded:
                return @"SOURCE_RESOURCE_LIMIT_EXCEEDED";
            case AWSQuicksightIngestionErrorTypeSqlInvalidParameterValue:
                return @"SQL_INVALID_PARAMETER_VALUE";
            case AWSQuicksightIngestionErrorTypeQueryTimeout:
                return @"QUERY_TIMEOUT";
            case AWSQuicksightIngestionErrorTypeSqlNumericOverflow:
                return @"SQL_NUMERIC_OVERFLOW";
            case AWSQuicksightIngestionErrorTypeUnresolvableHost:
                return @"UNRESOLVABLE_HOST";
            case AWSQuicksightIngestionErrorTypeUnroutableHost:
                return @"UNROUTABLE_HOST";
            case AWSQuicksightIngestionErrorTypeSqlException:
                return @"SQL_EXCEPTION";
            case AWSQuicksightIngestionErrorTypeS3FileInaccessible:
                return @"S3_FILE_INACCESSIBLE";
            case AWSQuicksightIngestionErrorTypeIotFileNotFound:
                return @"IOT_FILE_NOT_FOUND";
            case AWSQuicksightIngestionErrorTypeIotDataSetFileEmpty:
                return @"IOT_DATA_SET_FILE_EMPTY";
            case AWSQuicksightIngestionErrorTypeInvalidDataSourceConfig:
                return @"INVALID_DATA_SOURCE_CONFIG";
            case AWSQuicksightIngestionErrorTypeDataSourceAuthFailed:
                return @"DATA_SOURCE_AUTH_FAILED";
            case AWSQuicksightIngestionErrorTypeDataSourceConnectionFailed:
                return @"DATA_SOURCE_CONNECTION_FAILED";
            case AWSQuicksightIngestionErrorTypeFailureToProcessJsonFile:
                return @"FAILURE_TO_PROCESS_JSON_FILE";
            case AWSQuicksightIngestionErrorTypeInternalServiceError:
                return @"INTERNAL_SERVICE_ERROR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightExportToCSVOption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityStatus" : @"AvailabilityStatus",
             };
}

+ (NSValueTransformer *)availabilityStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSQuicksightDashboardBehaviorEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSQuicksightDashboardBehaviorDisabled);
        }
        return @(AWSQuicksightDashboardBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightDashboardBehaviorEnabled:
                return @"ENABLED";
            case AWSQuicksightDashboardBehaviorDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightFilterOperation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conditionExpression" : @"ConditionExpression",
             };
}

@end

@implementation AWSQuicksightGeoSpatialColumnGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"columns" : @"Columns",
             @"countryCode" : @"CountryCode",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)countryCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"US"] == NSOrderedSame) {
            return @(AWSQuicksightGeoSpatialCountryCodeUs);
        }
        return @(AWSQuicksightGeoSpatialCountryCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightGeoSpatialCountryCodeUs:
                return @"US";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightGetDashboardEmbedUrlRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"dashboardId" : @"DashboardId",
             @"identityType" : @"IdentityType",
             @"resetDisabled" : @"ResetDisabled",
             @"sessionLifetimeInMinutes" : @"SessionLifetimeInMinutes",
             @"undoRedoDisabled" : @"UndoRedoDisabled",
             @"userArn" : @"UserArn",
             };
}

+ (NSValueTransformer *)identityTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IAM"] == NSOrderedSame) {
            return @(AWSQuicksightIdentityTypeIam);
        }
        if ([value caseInsensitiveCompare:@"QUICKSIGHT"] == NSOrderedSame) {
            return @(AWSQuicksightIdentityTypeQuicksight);
        }
        return @(AWSQuicksightIdentityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightIdentityTypeIam:
                return @"IAM";
            case AWSQuicksightIdentityTypeQuicksight:
                return @"QUICKSIGHT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightGetDashboardEmbedUrlResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"embedUrl" : @"EmbedUrl",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

@end

@implementation AWSQuicksightGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"detail" : @"Description",
             @"groupName" : @"GroupName",
             @"principalId" : @"PrincipalId",
             };
}

@end

@implementation AWSQuicksightGroupMember

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"memberName" : @"MemberName",
             };
}

@end

@implementation AWSQuicksightIAMPolicyAssignment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assignmentId" : @"AssignmentId",
             @"assignmentName" : @"AssignmentName",
             @"assignmentStatus" : @"AssignmentStatus",
             @"awsAccountId" : @"AwsAccountId",
             @"identities" : @"Identities",
             @"policyArn" : @"PolicyArn",
             };
}

+ (NSValueTransformer *)assignmentStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSQuicksightAssignmentStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DRAFT"] == NSOrderedSame) {
            return @(AWSQuicksightAssignmentStatusDraft);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSQuicksightAssignmentStatusDisabled);
        }
        return @(AWSQuicksightAssignmentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightAssignmentStatusEnabled:
                return @"ENABLED";
            case AWSQuicksightAssignmentStatusDraft:
                return @"DRAFT";
            case AWSQuicksightAssignmentStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightIAMPolicyAssignmentSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assignmentName" : @"AssignmentName",
             @"assignmentStatus" : @"AssignmentStatus",
             };
}

+ (NSValueTransformer *)assignmentStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSQuicksightAssignmentStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DRAFT"] == NSOrderedSame) {
            return @(AWSQuicksightAssignmentStatusDraft);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSQuicksightAssignmentStatusDisabled);
        }
        return @(AWSQuicksightAssignmentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightAssignmentStatusEnabled:
                return @"ENABLED";
            case AWSQuicksightAssignmentStatusDraft:
                return @"DRAFT";
            case AWSQuicksightAssignmentStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightIngestion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdTime" : @"CreatedTime",
             @"errorInfo" : @"ErrorInfo",
             @"ingestionId" : @"IngestionId",
             @"ingestionSizeInBytes" : @"IngestionSizeInBytes",
             @"ingestionStatus" : @"IngestionStatus",
             @"ingestionTimeInSeconds" : @"IngestionTimeInSeconds",
             @"queueInfo" : @"QueueInfo",
             @"requestSource" : @"RequestSource",
             @"requestType" : @"RequestType",
             @"rowInfo" : @"RowInfo",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)errorInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightErrorInfo class]];
}

+ (NSValueTransformer *)ingestionStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZED"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionStatusInitialized);
        }
        if ([value caseInsensitiveCompare:@"QUEUED"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionStatusQueued);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionStatusCancelled);
        }
        return @(AWSQuicksightIngestionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightIngestionStatusInitialized:
                return @"INITIALIZED";
            case AWSQuicksightIngestionStatusQueued:
                return @"QUEUED";
            case AWSQuicksightIngestionStatusRunning:
                return @"RUNNING";
            case AWSQuicksightIngestionStatusFailed:
                return @"FAILED";
            case AWSQuicksightIngestionStatusCompleted:
                return @"COMPLETED";
            case AWSQuicksightIngestionStatusCancelled:
                return @"CANCELLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)queueInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightQueueInfo class]];
}

+ (NSValueTransformer *)requestSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MANUAL"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionRequestSourceManual);
        }
        if ([value caseInsensitiveCompare:@"SCHEDULED"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionRequestSourceScheduled);
        }
        return @(AWSQuicksightIngestionRequestSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightIngestionRequestSourceManual:
                return @"MANUAL";
            case AWSQuicksightIngestionRequestSourceScheduled:
                return @"SCHEDULED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requestTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIAL_INGESTION"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionRequestTypeInitialIngestion);
        }
        if ([value caseInsensitiveCompare:@"EDIT"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionRequestTypeEdit);
        }
        if ([value caseInsensitiveCompare:@"INCREMENTAL_REFRESH"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionRequestTypeIncrementalRefresh);
        }
        if ([value caseInsensitiveCompare:@"FULL_REFRESH"] == NSOrderedSame) {
            return @(AWSQuicksightIngestionRequestTypeFullRefresh);
        }
        return @(AWSQuicksightIngestionRequestTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightIngestionRequestTypeInitialIngestion:
                return @"INITIAL_INGESTION";
            case AWSQuicksightIngestionRequestTypeEdit:
                return @"EDIT";
            case AWSQuicksightIngestionRequestTypeIncrementalRefresh:
                return @"INCREMENTAL_REFRESH";
            case AWSQuicksightIngestionRequestTypeFullRefresh:
                return @"FULL_REFRESH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rowInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightRowInfo class]];
}

@end

@implementation AWSQuicksightInputColumn

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STRING"] == NSOrderedSame) {
            return @(AWSQuicksightInputColumnDataTypeString);
        }
        if ([value caseInsensitiveCompare:@"INTEGER"] == NSOrderedSame) {
            return @(AWSQuicksightInputColumnDataTypeInteger);
        }
        if ([value caseInsensitiveCompare:@"DECIMAL"] == NSOrderedSame) {
            return @(AWSQuicksightInputColumnDataTypeDecimal);
        }
        if ([value caseInsensitiveCompare:@"DATETIME"] == NSOrderedSame) {
            return @(AWSQuicksightInputColumnDataTypeDatetime);
        }
        if ([value caseInsensitiveCompare:@"BIT"] == NSOrderedSame) {
            return @(AWSQuicksightInputColumnDataTypeBit);
        }
        if ([value caseInsensitiveCompare:@"BOOLEAN"] == NSOrderedSame) {
            return @(AWSQuicksightInputColumnDataTypeBoolean);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSQuicksightInputColumnDataTypeJson);
        }
        return @(AWSQuicksightInputColumnDataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightInputColumnDataTypeString:
                return @"STRING";
            case AWSQuicksightInputColumnDataTypeInteger:
                return @"INTEGER";
            case AWSQuicksightInputColumnDataTypeDecimal:
                return @"DECIMAL";
            case AWSQuicksightInputColumnDataTypeDatetime:
                return @"DATETIME";
            case AWSQuicksightInputColumnDataTypeBit:
                return @"BIT";
            case AWSQuicksightInputColumnDataTypeBoolean:
                return @"BOOLEAN";
            case AWSQuicksightInputColumnDataTypeJson:
                return @"JSON";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightIntegerParameter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"values" : @"Values",
             };
}

@end

@implementation AWSQuicksightJiraParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"siteBaseUrl" : @"SiteBaseUrl",
             };
}

@end

@implementation AWSQuicksightJoinInstruction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"leftOperand" : @"LeftOperand",
             @"onClause" : @"OnClause",
             @"rightOperand" : @"RightOperand",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INNER"] == NSOrderedSame) {
            return @(AWSQuicksightJoinTypeInner);
        }
        if ([value caseInsensitiveCompare:@"OUTER"] == NSOrderedSame) {
            return @(AWSQuicksightJoinTypeOuter);
        }
        if ([value caseInsensitiveCompare:@"LEFT"] == NSOrderedSame) {
            return @(AWSQuicksightJoinTypeLeft);
        }
        if ([value caseInsensitiveCompare:@"RIGHT"] == NSOrderedSame) {
            return @(AWSQuicksightJoinTypeRight);
        }
        return @(AWSQuicksightJoinTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightJoinTypeInner:
                return @"INNER";
            case AWSQuicksightJoinTypeOuter:
                return @"OUTER";
            case AWSQuicksightJoinTypeLeft:
                return @"LEFT";
            case AWSQuicksightJoinTypeRight:
                return @"RIGHT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightListDashboardVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"dashboardId" : @"DashboardId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSQuicksightListDashboardVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dashboardVersionSummaryList" : @"DashboardVersionSummaryList",
             @"nextToken" : @"NextToken",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)dashboardVersionSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightDashboardVersionSummary class]];
}

@end

@implementation AWSQuicksightListDashboardsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSQuicksightListDashboardsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dashboardSummaryList" : @"DashboardSummaryList",
             @"nextToken" : @"NextToken",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)dashboardSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightDashboardSummary class]];
}

@end

@implementation AWSQuicksightListDataSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSQuicksightListDataSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSetSummaries" : @"DataSetSummaries",
             @"nextToken" : @"NextToken",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)dataSetSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightDataSetSummary class]];
}

@end

@implementation AWSQuicksightListDataSourcesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSQuicksightListDataSourcesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSources" : @"DataSources",
             @"nextToken" : @"NextToken",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)dataSourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightDataSource class]];
}

@end

@implementation AWSQuicksightListGroupMembershipsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"groupName" : @"GroupName",
             @"maxResults" : @"MaxResults",
             @"namespace" : @"Namespace",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSQuicksightListGroupMembershipsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupMemberList" : @"GroupMemberList",
             @"nextToken" : @"NextToken",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)groupMemberListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightGroupMember class]];
}

@end

@implementation AWSQuicksightListGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"maxResults" : @"MaxResults",
             @"namespace" : @"Namespace",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSQuicksightListGroupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupList" : @"GroupList",
             @"nextToken" : @"NextToken",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)groupListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightGroup class]];
}

@end

@implementation AWSQuicksightListIAMPolicyAssignmentsForUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"maxResults" : @"MaxResults",
             @"namespace" : @"Namespace",
             @"nextToken" : @"NextToken",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSQuicksightListIAMPolicyAssignmentsForUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activeAssignments" : @"ActiveAssignments",
             @"nextToken" : @"NextToken",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)activeAssignmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightActiveIAMPolicyAssignment class]];
}

@end

@implementation AWSQuicksightListIAMPolicyAssignmentsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assignmentStatus" : @"AssignmentStatus",
             @"awsAccountId" : @"AwsAccountId",
             @"maxResults" : @"MaxResults",
             @"namespace" : @"Namespace",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)assignmentStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSQuicksightAssignmentStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DRAFT"] == NSOrderedSame) {
            return @(AWSQuicksightAssignmentStatusDraft);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSQuicksightAssignmentStatusDisabled);
        }
        return @(AWSQuicksightAssignmentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightAssignmentStatusEnabled:
                return @"ENABLED";
            case AWSQuicksightAssignmentStatusDraft:
                return @"DRAFT";
            case AWSQuicksightAssignmentStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightListIAMPolicyAssignmentsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"IAMPolicyAssignments" : @"IAMPolicyAssignments",
             @"nextToken" : @"NextToken",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)IAMPolicyAssignmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightIAMPolicyAssignmentSummary class]];
}

@end

@implementation AWSQuicksightListIngestionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"dataSetId" : @"DataSetId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSQuicksightListIngestionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ingestions" : @"Ingestions",
             @"nextToken" : @"NextToken",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)ingestionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightIngestion class]];
}

@end

@implementation AWSQuicksightListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSQuicksightListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightTag class]];
}

@end

@implementation AWSQuicksightListTemplateAliasesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"templateId" : @"TemplateId",
             };
}

@end

@implementation AWSQuicksightListTemplateAliasesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             @"templateAliasList" : @"TemplateAliasList",
             };
}

+ (NSValueTransformer *)templateAliasListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightTemplateAlias class]];
}

@end

@implementation AWSQuicksightListTemplateVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"templateId" : @"TemplateId",
             };
}

@end

@implementation AWSQuicksightListTemplateVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             @"templateVersionSummaryList" : @"TemplateVersionSummaryList",
             };
}

+ (NSValueTransformer *)templateVersionSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightTemplateVersionSummary class]];
}

@end

@implementation AWSQuicksightListTemplatesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSQuicksightListTemplatesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             @"templateSummaryList" : @"TemplateSummaryList",
             };
}

+ (NSValueTransformer *)templateSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightTemplateSummary class]];
}

@end

@implementation AWSQuicksightListUserGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"maxResults" : @"MaxResults",
             @"namespace" : @"Namespace",
             @"nextToken" : @"NextToken",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSQuicksightListUserGroupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupList" : @"GroupList",
             @"nextToken" : @"NextToken",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)groupListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightGroup class]];
}

@end

@implementation AWSQuicksightListUsersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"maxResults" : @"MaxResults",
             @"namespace" : @"Namespace",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSQuicksightListUsersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             @"userList" : @"UserList",
             };
}

+ (NSValueTransformer *)userListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightUser class]];
}

@end

@implementation AWSQuicksightLogicalTable

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alias" : @"Alias",
             @"dataTransforms" : @"DataTransforms",
             @"source" : @"Source",
             };
}

+ (NSValueTransformer *)dataTransformsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightTransformOperation class]];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightLogicalTableSource class]];
}

@end

@implementation AWSQuicksightLogicalTableSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"joinInstruction" : @"JoinInstruction",
             @"physicalTableId" : @"PhysicalTableId",
             };
}

+ (NSValueTransformer *)joinInstructionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightJoinInstruction class]];
}

@end

@implementation AWSQuicksightManifestFileLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"key" : @"Key",
             };
}

@end

@implementation AWSQuicksightMariaDbParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"database" : @"Database",
             @"host" : @"Host",
             @"port" : @"Port",
             };
}

@end

@implementation AWSQuicksightMySqlParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"database" : @"Database",
             @"host" : @"Host",
             @"port" : @"Port",
             };
}

@end

@implementation AWSQuicksightOutputColumn

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STRING"] == NSOrderedSame) {
            return @(AWSQuicksightColumnDataTypeString);
        }
        if ([value caseInsensitiveCompare:@"INTEGER"] == NSOrderedSame) {
            return @(AWSQuicksightColumnDataTypeInteger);
        }
        if ([value caseInsensitiveCompare:@"DECIMAL"] == NSOrderedSame) {
            return @(AWSQuicksightColumnDataTypeDecimal);
        }
        if ([value caseInsensitiveCompare:@"DATETIME"] == NSOrderedSame) {
            return @(AWSQuicksightColumnDataTypeDatetime);
        }
        return @(AWSQuicksightColumnDataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightColumnDataTypeString:
                return @"STRING";
            case AWSQuicksightColumnDataTypeInteger:
                return @"INTEGER";
            case AWSQuicksightColumnDataTypeDecimal:
                return @"DECIMAL";
            case AWSQuicksightColumnDataTypeDatetime:
                return @"DATETIME";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dateTimeParameters" : @"DateTimeParameters",
             @"decimalParameters" : @"DecimalParameters",
             @"integerParameters" : @"IntegerParameters",
             @"stringParameters" : @"StringParameters",
             };
}

+ (NSValueTransformer *)dateTimeParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightDateTimeParameter class]];
}

+ (NSValueTransformer *)decimalParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightDecimalParameter class]];
}

+ (NSValueTransformer *)integerParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightIntegerParameter class]];
}

+ (NSValueTransformer *)stringParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightStringParameter class]];
}

@end

@implementation AWSQuicksightPhysicalTable

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customSql" : @"CustomSql",
             @"relationalTable" : @"RelationalTable",
             @"s3Source" : @"S3Source",
             };
}

+ (NSValueTransformer *)customSqlJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightCustomSql class]];
}

+ (NSValueTransformer *)relationalTableJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightRelationalTable class]];
}

+ (NSValueTransformer *)s3SourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightS3Source class]];
}

@end

@implementation AWSQuicksightPostgreSqlParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"database" : @"Database",
             @"host" : @"Host",
             @"port" : @"Port",
             };
}

@end

@implementation AWSQuicksightPrestoParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalog" : @"Catalog",
             @"host" : @"Host",
             @"port" : @"Port",
             };
}

@end

@implementation AWSQuicksightProjectOperation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projectedColumns" : @"ProjectedColumns",
             };
}

@end

@implementation AWSQuicksightQueueInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queuedIngestion" : @"QueuedIngestion",
             @"waitingOnIngestion" : @"WaitingOnIngestion",
             };
}

@end

@implementation AWSQuicksightRdsParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"database" : @"Database",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSQuicksightRedshiftParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"database" : @"Database",
             @"host" : @"Host",
             @"port" : @"Port",
             };
}

@end

@implementation AWSQuicksightRegisterUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"email" : @"Email",
             @"iamArn" : @"IamArn",
             @"identityType" : @"IdentityType",
             @"namespace" : @"Namespace",
             @"sessionName" : @"SessionName",
             @"userName" : @"UserName",
             @"userRole" : @"UserRole",
             };
}

+ (NSValueTransformer *)identityTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IAM"] == NSOrderedSame) {
            return @(AWSQuicksightIdentityTypeIam);
        }
        if ([value caseInsensitiveCompare:@"QUICKSIGHT"] == NSOrderedSame) {
            return @(AWSQuicksightIdentityTypeQuicksight);
        }
        return @(AWSQuicksightIdentityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightIdentityTypeIam:
                return @"IAM";
            case AWSQuicksightIdentityTypeQuicksight:
                return @"QUICKSIGHT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)userRoleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADMIN"] == NSOrderedSame) {
            return @(AWSQuicksightUserRoleAdmin);
        }
        if ([value caseInsensitiveCompare:@"AUTHOR"] == NSOrderedSame) {
            return @(AWSQuicksightUserRoleAuthor);
        }
        if ([value caseInsensitiveCompare:@"READER"] == NSOrderedSame) {
            return @(AWSQuicksightUserRoleReader);
        }
        if ([value caseInsensitiveCompare:@"RESTRICTED_AUTHOR"] == NSOrderedSame) {
            return @(AWSQuicksightUserRoleRestrictedAuthor);
        }
        if ([value caseInsensitiveCompare:@"RESTRICTED_READER"] == NSOrderedSame) {
            return @(AWSQuicksightUserRoleRestrictedReader);
        }
        return @(AWSQuicksightUserRoleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightUserRoleAdmin:
                return @"ADMIN";
            case AWSQuicksightUserRoleAuthor:
                return @"AUTHOR";
            case AWSQuicksightUserRoleReader:
                return @"READER";
            case AWSQuicksightUserRoleRestrictedAuthor:
                return @"RESTRICTED_AUTHOR";
            case AWSQuicksightUserRoleRestrictedReader:
                return @"RESTRICTED_READER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightRegisterUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             @"user" : @"User",
             @"userInvitationUrl" : @"UserInvitationUrl",
             };
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightUser class]];
}

@end

@implementation AWSQuicksightRelationalTable

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSourceArn" : @"DataSourceArn",
             @"inputColumns" : @"InputColumns",
             @"name" : @"Name",
             @"schema" : @"Schema",
             };
}

+ (NSValueTransformer *)inputColumnsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightInputColumn class]];
}

@end

@implementation AWSQuicksightRenameColumnOperation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"columnName" : @"ColumnName",
             @"latestColumnName" : @"NewColumnName",
             };
}

@end

@implementation AWSQuicksightResourcePermission

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actions" : @"Actions",
             @"principal" : @"Principal",
             };
}

@end

@implementation AWSQuicksightRowInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rowsDropped" : @"RowsDropped",
             @"rowsIngested" : @"RowsIngested",
             };
}

@end

@implementation AWSQuicksightRowLevelPermissionDataSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"permissionPolicy" : @"PermissionPolicy",
             };
}

+ (NSValueTransformer *)permissionPolicyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GRANT_ACCESS"] == NSOrderedSame) {
            return @(AWSQuicksightRowLevelPermissionPolicyGrantAccess);
        }
        if ([value caseInsensitiveCompare:@"DENY_ACCESS"] == NSOrderedSame) {
            return @(AWSQuicksightRowLevelPermissionPolicyDenyAccess);
        }
        return @(AWSQuicksightRowLevelPermissionPolicyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightRowLevelPermissionPolicyGrantAccess:
                return @"GRANT_ACCESS";
            case AWSQuicksightRowLevelPermissionPolicyDenyAccess:
                return @"DENY_ACCESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightS3Parameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"manifestFileLocation" : @"ManifestFileLocation",
             };
}

+ (NSValueTransformer *)manifestFileLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightManifestFileLocation class]];
}

@end

@implementation AWSQuicksightS3Source

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSourceArn" : @"DataSourceArn",
             @"inputColumns" : @"InputColumns",
             @"uploadSettings" : @"UploadSettings",
             };
}

+ (NSValueTransformer *)inputColumnsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightInputColumn class]];
}

+ (NSValueTransformer *)uploadSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightUploadSettings class]];
}

@end

@implementation AWSQuicksightSearchDashboardsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightDashboardSearchFilter class]];
}

@end

@implementation AWSQuicksightSearchDashboardsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dashboardSummaryList" : @"DashboardSummaryList",
             @"nextToken" : @"NextToken",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)dashboardSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightDashboardSummary class]];
}

@end

@implementation AWSQuicksightServiceNowParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"siteBaseUrl" : @"SiteBaseUrl",
             };
}

@end

@implementation AWSQuicksightSheetControlsOption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"visibilityState" : @"VisibilityState",
             };
}

+ (NSValueTransformer *)visibilityStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXPANDED"] == NSOrderedSame) {
            return @(AWSQuicksightDashboardUIStateExpanded);
        }
        if ([value caseInsensitiveCompare:@"COLLAPSED"] == NSOrderedSame) {
            return @(AWSQuicksightDashboardUIStateCollapsed);
        }
        return @(AWSQuicksightDashboardUIStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightDashboardUIStateExpanded:
                return @"EXPANDED";
            case AWSQuicksightDashboardUIStateCollapsed:
                return @"COLLAPSED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightSnowflakeParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"database" : @"Database",
             @"host" : @"Host",
             @"warehouse" : @"Warehouse",
             };
}

@end

@implementation AWSQuicksightSparkParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"host" : @"Host",
             @"port" : @"Port",
             };
}

@end

@implementation AWSQuicksightSqlServerParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"database" : @"Database",
             @"host" : @"Host",
             @"port" : @"Port",
             };
}

@end

@implementation AWSQuicksightSslProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"disableSsl" : @"DisableSsl",
             };
}

@end

@implementation AWSQuicksightStringParameter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"values" : @"Values",
             };
}

@end

@implementation AWSQuicksightTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSQuicksightTagColumnOperation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"columnName" : @"ColumnName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightColumnTag class]];
}

@end

@implementation AWSQuicksightTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightTag class]];
}

@end

@implementation AWSQuicksightTagResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

@end

@implementation AWSQuicksightTemplate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdTime" : @"CreatedTime",
             @"lastUpdatedTime" : @"LastUpdatedTime",
             @"name" : @"Name",
             @"templateId" : @"TemplateId",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)versionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightTemplateVersion class]];
}

@end

@implementation AWSQuicksightTemplateAlias

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliasName" : @"AliasName",
             @"arn" : @"Arn",
             @"templateVersionNumber" : @"TemplateVersionNumber",
             };
}

@end

@implementation AWSQuicksightTemplateError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SOURCE_NOT_FOUND"] == NSOrderedSame) {
            return @(AWSQuicksightTemplateErrorTypeSourceNotFound);
        }
        if ([value caseInsensitiveCompare:@"DATA_SET_NOT_FOUND"] == NSOrderedSame) {
            return @(AWSQuicksightTemplateErrorTypeDataSetNotFound);
        }
        if ([value caseInsensitiveCompare:@"INTERNAL_FAILURE"] == NSOrderedSame) {
            return @(AWSQuicksightTemplateErrorTypeInternalFailure);
        }
        return @(AWSQuicksightTemplateErrorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightTemplateErrorTypeSourceNotFound:
                return @"SOURCE_NOT_FOUND";
            case AWSQuicksightTemplateErrorTypeDataSetNotFound:
                return @"DATA_SET_NOT_FOUND";
            case AWSQuicksightTemplateErrorTypeInternalFailure:
                return @"INTERNAL_FAILURE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightTemplateSourceAnalysis

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"dataSetReferences" : @"DataSetReferences",
             };
}

+ (NSValueTransformer *)dataSetReferencesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightDataSetReference class]];
}

@end

@implementation AWSQuicksightTemplateSourceEntity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceAnalysis" : @"SourceAnalysis",
             @"sourceTemplate" : @"SourceTemplate",
             };
}

+ (NSValueTransformer *)sourceAnalysisJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightTemplateSourceAnalysis class]];
}

+ (NSValueTransformer *)sourceTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightTemplateSourceTemplate class]];
}

@end

@implementation AWSQuicksightTemplateSourceTemplate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             };
}

@end

@implementation AWSQuicksightTemplateSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdTime" : @"CreatedTime",
             @"lastUpdatedTime" : @"LastUpdatedTime",
             @"latestVersionNumber" : @"LatestVersionNumber",
             @"name" : @"Name",
             @"templateId" : @"TemplateId",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSQuicksightTemplateVersion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdTime" : @"CreatedTime",
             @"dataSetConfigurations" : @"DataSetConfigurations",
             @"detail" : @"Description",
             @"errors" : @"Errors",
             @"sourceEntityArn" : @"SourceEntityArn",
             @"status" : @"Status",
             @"versionNumber" : @"VersionNumber",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)dataSetConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightDataSetConfiguration class]];
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightTemplateError class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATION_SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationSuccessful);
        }
        if ([value caseInsensitiveCompare:@"CREATION_FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateSuccessful);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateFailed);
        }
        return @(AWSQuicksightResourceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightResourceStatusCreationInProgress:
                return @"CREATION_IN_PROGRESS";
            case AWSQuicksightResourceStatusCreationSuccessful:
                return @"CREATION_SUCCESSFUL";
            case AWSQuicksightResourceStatusCreationFailed:
                return @"CREATION_FAILED";
            case AWSQuicksightResourceStatusUpdateInProgress:
                return @"UPDATE_IN_PROGRESS";
            case AWSQuicksightResourceStatusUpdateSuccessful:
                return @"UPDATE_SUCCESSFUL";
            case AWSQuicksightResourceStatusUpdateFailed:
                return @"UPDATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightTemplateVersionSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdTime" : @"CreatedTime",
             @"detail" : @"Description",
             @"status" : @"Status",
             @"versionNumber" : @"VersionNumber",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATION_SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationSuccessful);
        }
        if ([value caseInsensitiveCompare:@"CREATION_FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateSuccessful);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateFailed);
        }
        return @(AWSQuicksightResourceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightResourceStatusCreationInProgress:
                return @"CREATION_IN_PROGRESS";
            case AWSQuicksightResourceStatusCreationSuccessful:
                return @"CREATION_SUCCESSFUL";
            case AWSQuicksightResourceStatusCreationFailed:
                return @"CREATION_FAILED";
            case AWSQuicksightResourceStatusUpdateInProgress:
                return @"UPDATE_IN_PROGRESS";
            case AWSQuicksightResourceStatusUpdateSuccessful:
                return @"UPDATE_SUCCESSFUL";
            case AWSQuicksightResourceStatusUpdateFailed:
                return @"UPDATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightTeradataParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"database" : @"Database",
             @"host" : @"Host",
             @"port" : @"Port",
             };
}

@end

@implementation AWSQuicksightTransformOperation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"castColumnTypeOperation" : @"CastColumnTypeOperation",
             @"createColumnsOperation" : @"CreateColumnsOperation",
             @"filterOperation" : @"FilterOperation",
             @"projectOperation" : @"ProjectOperation",
             @"renameColumnOperation" : @"RenameColumnOperation",
             @"tagColumnOperation" : @"TagColumnOperation",
             };
}

+ (NSValueTransformer *)castColumnTypeOperationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightCastColumnTypeOperation class]];
}

+ (NSValueTransformer *)createColumnsOperationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightCreateColumnsOperation class]];
}

+ (NSValueTransformer *)filterOperationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightFilterOperation class]];
}

+ (NSValueTransformer *)projectOperationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightProjectOperation class]];
}

+ (NSValueTransformer *)renameColumnOperationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightRenameColumnOperation class]];
}

+ (NSValueTransformer *)tagColumnOperationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightTagColumnOperation class]];
}

@end

@implementation AWSQuicksightTwitterParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxRows" : @"MaxRows",
             @"query" : @"Query",
             };
}

@end

@implementation AWSQuicksightUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSQuicksightUntagResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

@end

@implementation AWSQuicksightUpdateDashboardPermissionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"dashboardId" : @"DashboardId",
             @"grantPermissions" : @"GrantPermissions",
             @"revokePermissions" : @"RevokePermissions",
             };
}

+ (NSValueTransformer *)grantPermissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightResourcePermission class]];
}

+ (NSValueTransformer *)revokePermissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightResourcePermission class]];
}

@end

@implementation AWSQuicksightUpdateDashboardPermissionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dashboardArn" : @"DashboardArn",
             @"dashboardId" : @"DashboardId",
             @"permissions" : @"Permissions",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)permissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightResourcePermission class]];
}

@end

@implementation AWSQuicksightUpdateDashboardPublishedVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"dashboardId" : @"DashboardId",
             @"versionNumber" : @"VersionNumber",
             };
}

@end

@implementation AWSQuicksightUpdateDashboardPublishedVersionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dashboardArn" : @"DashboardArn",
             @"dashboardId" : @"DashboardId",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

@end

@implementation AWSQuicksightUpdateDashboardRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"dashboardId" : @"DashboardId",
             @"dashboardPublishOptions" : @"DashboardPublishOptions",
             @"name" : @"Name",
             @"parameters" : @"Parameters",
             @"sourceEntity" : @"SourceEntity",
             @"versionDescription" : @"VersionDescription",
             };
}

+ (NSValueTransformer *)dashboardPublishOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightDashboardPublishOptions class]];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightParameters class]];
}

+ (NSValueTransformer *)sourceEntityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightDashboardSourceEntity class]];
}

@end

@implementation AWSQuicksightUpdateDashboardResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"creationStatus" : @"CreationStatus",
             @"dashboardId" : @"DashboardId",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             @"versionArn" : @"VersionArn",
             };
}

+ (NSValueTransformer *)creationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATION_SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationSuccessful);
        }
        if ([value caseInsensitiveCompare:@"CREATION_FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateSuccessful);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateFailed);
        }
        return @(AWSQuicksightResourceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightResourceStatusCreationInProgress:
                return @"CREATION_IN_PROGRESS";
            case AWSQuicksightResourceStatusCreationSuccessful:
                return @"CREATION_SUCCESSFUL";
            case AWSQuicksightResourceStatusCreationFailed:
                return @"CREATION_FAILED";
            case AWSQuicksightResourceStatusUpdateInProgress:
                return @"UPDATE_IN_PROGRESS";
            case AWSQuicksightResourceStatusUpdateSuccessful:
                return @"UPDATE_SUCCESSFUL";
            case AWSQuicksightResourceStatusUpdateFailed:
                return @"UPDATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightUpdateDataSetPermissionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"dataSetId" : @"DataSetId",
             @"grantPermissions" : @"GrantPermissions",
             @"revokePermissions" : @"RevokePermissions",
             };
}

+ (NSValueTransformer *)grantPermissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightResourcePermission class]];
}

+ (NSValueTransformer *)revokePermissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightResourcePermission class]];
}

@end

@implementation AWSQuicksightUpdateDataSetPermissionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSetArn" : @"DataSetArn",
             @"dataSetId" : @"DataSetId",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

@end

@implementation AWSQuicksightUpdateDataSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"columnGroups" : @"ColumnGroups",
             @"dataSetId" : @"DataSetId",
             @"importMode" : @"ImportMode",
             @"logicalTableMap" : @"LogicalTableMap",
             @"name" : @"Name",
             @"physicalTableMap" : @"PhysicalTableMap",
             @"rowLevelPermissionDataSet" : @"RowLevelPermissionDataSet",
             };
}

+ (NSValueTransformer *)columnGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightColumnGroup class]];
}

+ (NSValueTransformer *)importModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SPICE"] == NSOrderedSame) {
            return @(AWSQuicksightDataSetImportModeSpice);
        }
        if ([value caseInsensitiveCompare:@"DIRECT_QUERY"] == NSOrderedSame) {
            return @(AWSQuicksightDataSetImportModeDirectQuery);
        }
        return @(AWSQuicksightDataSetImportModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightDataSetImportModeSpice:
                return @"SPICE";
            case AWSQuicksightDataSetImportModeDirectQuery:
                return @"DIRECT_QUERY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)logicalTableMapJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSQuicksightLogicalTable class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)physicalTableMapJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSQuicksightPhysicalTable class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)rowLevelPermissionDataSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightRowLevelPermissionDataSet class]];
}

@end

@implementation AWSQuicksightUpdateDataSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"dataSetId" : @"DataSetId",
             @"ingestionArn" : @"IngestionArn",
             @"ingestionId" : @"IngestionId",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

@end

@implementation AWSQuicksightUpdateDataSourcePermissionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"dataSourceId" : @"DataSourceId",
             @"grantPermissions" : @"GrantPermissions",
             @"revokePermissions" : @"RevokePermissions",
             };
}

+ (NSValueTransformer *)grantPermissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightResourcePermission class]];
}

+ (NSValueTransformer *)revokePermissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightResourcePermission class]];
}

@end

@implementation AWSQuicksightUpdateDataSourcePermissionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSourceArn" : @"DataSourceArn",
             @"dataSourceId" : @"DataSourceId",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

@end

@implementation AWSQuicksightUpdateDataSourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"credentials" : @"Credentials",
             @"dataSourceId" : @"DataSourceId",
             @"dataSourceParameters" : @"DataSourceParameters",
             @"name" : @"Name",
             @"sslProperties" : @"SslProperties",
             @"vpcConnectionProperties" : @"VpcConnectionProperties",
             };
}

+ (NSValueTransformer *)credentialsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightDataSourceCredentials class]];
}

+ (NSValueTransformer *)dataSourceParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightDataSourceParameters class]];
}

+ (NSValueTransformer *)sslPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightSslProperties class]];
}

+ (NSValueTransformer *)vpcConnectionPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightVpcConnectionProperties class]];
}

@end

@implementation AWSQuicksightUpdateDataSourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"dataSourceId" : @"DataSourceId",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             @"updateStatus" : @"UpdateStatus",
             };
}

+ (NSValueTransformer *)updateStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATION_SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationSuccessful);
        }
        if ([value caseInsensitiveCompare:@"CREATION_FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateSuccessful);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateFailed);
        }
        return @(AWSQuicksightResourceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightResourceStatusCreationInProgress:
                return @"CREATION_IN_PROGRESS";
            case AWSQuicksightResourceStatusCreationSuccessful:
                return @"CREATION_SUCCESSFUL";
            case AWSQuicksightResourceStatusCreationFailed:
                return @"CREATION_FAILED";
            case AWSQuicksightResourceStatusUpdateInProgress:
                return @"UPDATE_IN_PROGRESS";
            case AWSQuicksightResourceStatusUpdateSuccessful:
                return @"UPDATE_SUCCESSFUL";
            case AWSQuicksightResourceStatusUpdateFailed:
                return @"UPDATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightUpdateGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"detail" : @"Description",
             @"groupName" : @"GroupName",
             @"namespace" : @"Namespace",
             };
}

@end

@implementation AWSQuicksightUpdateGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"group" : @"Group",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)groupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightGroup class]];
}

@end

@implementation AWSQuicksightUpdateIAMPolicyAssignmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assignmentName" : @"AssignmentName",
             @"assignmentStatus" : @"AssignmentStatus",
             @"awsAccountId" : @"AwsAccountId",
             @"identities" : @"Identities",
             @"namespace" : @"Namespace",
             @"policyArn" : @"PolicyArn",
             };
}

+ (NSValueTransformer *)assignmentStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSQuicksightAssignmentStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DRAFT"] == NSOrderedSame) {
            return @(AWSQuicksightAssignmentStatusDraft);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSQuicksightAssignmentStatusDisabled);
        }
        return @(AWSQuicksightAssignmentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightAssignmentStatusEnabled:
                return @"ENABLED";
            case AWSQuicksightAssignmentStatusDraft:
                return @"DRAFT";
            case AWSQuicksightAssignmentStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightUpdateIAMPolicyAssignmentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assignmentId" : @"AssignmentId",
             @"assignmentName" : @"AssignmentName",
             @"assignmentStatus" : @"AssignmentStatus",
             @"identities" : @"Identities",
             @"policyArn" : @"PolicyArn",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)assignmentStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSQuicksightAssignmentStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DRAFT"] == NSOrderedSame) {
            return @(AWSQuicksightAssignmentStatusDraft);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSQuicksightAssignmentStatusDisabled);
        }
        return @(AWSQuicksightAssignmentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightAssignmentStatusEnabled:
                return @"ENABLED";
            case AWSQuicksightAssignmentStatusDraft:
                return @"DRAFT";
            case AWSQuicksightAssignmentStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightUpdateTemplateAliasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliasName" : @"AliasName",
             @"awsAccountId" : @"AwsAccountId",
             @"templateId" : @"TemplateId",
             @"templateVersionNumber" : @"TemplateVersionNumber",
             };
}

@end

@implementation AWSQuicksightUpdateTemplateAliasResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             @"templateAlias" : @"TemplateAlias",
             };
}

+ (NSValueTransformer *)templateAliasJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightTemplateAlias class]];
}

@end

@implementation AWSQuicksightUpdateTemplatePermissionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"grantPermissions" : @"GrantPermissions",
             @"revokePermissions" : @"RevokePermissions",
             @"templateId" : @"TemplateId",
             };
}

+ (NSValueTransformer *)grantPermissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightResourcePermission class]];
}

+ (NSValueTransformer *)revokePermissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightResourcePermission class]];
}

@end

@implementation AWSQuicksightUpdateTemplatePermissionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"permissions" : @"Permissions",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             @"templateArn" : @"TemplateArn",
             @"templateId" : @"TemplateId",
             };
}

+ (NSValueTransformer *)permissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQuicksightResourcePermission class]];
}

@end

@implementation AWSQuicksightUpdateTemplateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"name" : @"Name",
             @"sourceEntity" : @"SourceEntity",
             @"templateId" : @"TemplateId",
             @"versionDescription" : @"VersionDescription",
             };
}

+ (NSValueTransformer *)sourceEntityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightTemplateSourceEntity class]];
}

@end

@implementation AWSQuicksightUpdateTemplateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"creationStatus" : @"CreationStatus",
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             @"templateId" : @"TemplateId",
             @"versionArn" : @"VersionArn",
             };
}

+ (NSValueTransformer *)creationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATION_SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationSuccessful);
        }
        if ([value caseInsensitiveCompare:@"CREATION_FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusCreationFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateSuccessful);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSQuicksightResourceStatusUpdateFailed);
        }
        return @(AWSQuicksightResourceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightResourceStatusCreationInProgress:
                return @"CREATION_IN_PROGRESS";
            case AWSQuicksightResourceStatusCreationSuccessful:
                return @"CREATION_SUCCESSFUL";
            case AWSQuicksightResourceStatusCreationFailed:
                return @"CREATION_FAILED";
            case AWSQuicksightResourceStatusUpdateInProgress:
                return @"UPDATE_IN_PROGRESS";
            case AWSQuicksightResourceStatusUpdateSuccessful:
                return @"UPDATE_SUCCESSFUL";
            case AWSQuicksightResourceStatusUpdateFailed:
                return @"UPDATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightUpdateUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountId" : @"AwsAccountId",
             @"email" : @"Email",
             @"namespace" : @"Namespace",
             @"role" : @"Role",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)roleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADMIN"] == NSOrderedSame) {
            return @(AWSQuicksightUserRoleAdmin);
        }
        if ([value caseInsensitiveCompare:@"AUTHOR"] == NSOrderedSame) {
            return @(AWSQuicksightUserRoleAuthor);
        }
        if ([value caseInsensitiveCompare:@"READER"] == NSOrderedSame) {
            return @(AWSQuicksightUserRoleReader);
        }
        if ([value caseInsensitiveCompare:@"RESTRICTED_AUTHOR"] == NSOrderedSame) {
            return @(AWSQuicksightUserRoleRestrictedAuthor);
        }
        if ([value caseInsensitiveCompare:@"RESTRICTED_READER"] == NSOrderedSame) {
            return @(AWSQuicksightUserRoleRestrictedReader);
        }
        return @(AWSQuicksightUserRoleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightUserRoleAdmin:
                return @"ADMIN";
            case AWSQuicksightUserRoleAuthor:
                return @"AUTHOR";
            case AWSQuicksightUserRoleReader:
                return @"READER";
            case AWSQuicksightUserRoleRestrictedAuthor:
                return @"RESTRICTED_AUTHOR";
            case AWSQuicksightUserRoleRestrictedReader:
                return @"RESTRICTED_READER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightUpdateUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requestId" : @"RequestId",
             @"status" : @"Status",
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQuicksightUser class]];
}

@end

@implementation AWSQuicksightUploadSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"containsHeader" : @"ContainsHeader",
             @"delimiter" : @"Delimiter",
             @"format" : @"Format",
             @"startFromRow" : @"StartFromRow",
             @"textQualifier" : @"TextQualifier",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CSV"] == NSOrderedSame) {
            return @(AWSQuicksightFileFormatCsv);
        }
        if ([value caseInsensitiveCompare:@"TSV"] == NSOrderedSame) {
            return @(AWSQuicksightFileFormatTsv);
        }
        if ([value caseInsensitiveCompare:@"CLF"] == NSOrderedSame) {
            return @(AWSQuicksightFileFormatClf);
        }
        if ([value caseInsensitiveCompare:@"ELF"] == NSOrderedSame) {
            return @(AWSQuicksightFileFormatElf);
        }
        if ([value caseInsensitiveCompare:@"XLSX"] == NSOrderedSame) {
            return @(AWSQuicksightFileFormatXlsx);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSQuicksightFileFormatJson);
        }
        return @(AWSQuicksightFileFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightFileFormatCsv:
                return @"CSV";
            case AWSQuicksightFileFormatTsv:
                return @"TSV";
            case AWSQuicksightFileFormatClf:
                return @"CLF";
            case AWSQuicksightFileFormatElf:
                return @"ELF";
            case AWSQuicksightFileFormatXlsx:
                return @"XLSX";
            case AWSQuicksightFileFormatJson:
                return @"JSON";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)textQualifierJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DOUBLE_QUOTE"] == NSOrderedSame) {
            return @(AWSQuicksightTextQualifierDoubleQuote);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_QUOTE"] == NSOrderedSame) {
            return @(AWSQuicksightTextQualifierSingleQuote);
        }
        return @(AWSQuicksightTextQualifierUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightTextQualifierDoubleQuote:
                return @"DOUBLE_QUOTE";
            case AWSQuicksightTextQualifierSingleQuote:
                return @"SINGLE_QUOTE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"active" : @"Active",
             @"arn" : @"Arn",
             @"email" : @"Email",
             @"identityType" : @"IdentityType",
             @"principalId" : @"PrincipalId",
             @"role" : @"Role",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)identityTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IAM"] == NSOrderedSame) {
            return @(AWSQuicksightIdentityTypeIam);
        }
        if ([value caseInsensitiveCompare:@"QUICKSIGHT"] == NSOrderedSame) {
            return @(AWSQuicksightIdentityTypeQuicksight);
        }
        return @(AWSQuicksightIdentityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightIdentityTypeIam:
                return @"IAM";
            case AWSQuicksightIdentityTypeQuicksight:
                return @"QUICKSIGHT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)roleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADMIN"] == NSOrderedSame) {
            return @(AWSQuicksightUserRoleAdmin);
        }
        if ([value caseInsensitiveCompare:@"AUTHOR"] == NSOrderedSame) {
            return @(AWSQuicksightUserRoleAuthor);
        }
        if ([value caseInsensitiveCompare:@"READER"] == NSOrderedSame) {
            return @(AWSQuicksightUserRoleReader);
        }
        if ([value caseInsensitiveCompare:@"RESTRICTED_AUTHOR"] == NSOrderedSame) {
            return @(AWSQuicksightUserRoleRestrictedAuthor);
        }
        if ([value caseInsensitiveCompare:@"RESTRICTED_READER"] == NSOrderedSame) {
            return @(AWSQuicksightUserRoleRestrictedReader);
        }
        return @(AWSQuicksightUserRoleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSQuicksightUserRoleAdmin:
                return @"ADMIN";
            case AWSQuicksightUserRoleAuthor:
                return @"AUTHOR";
            case AWSQuicksightUserRoleReader:
                return @"READER";
            case AWSQuicksightUserRoleRestrictedAuthor:
                return @"RESTRICTED_AUTHOR";
            case AWSQuicksightUserRoleRestrictedReader:
                return @"RESTRICTED_READER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSQuicksightVpcConnectionProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vpcConnectionArn" : @"VpcConnectionArn",
             };
}

@end
