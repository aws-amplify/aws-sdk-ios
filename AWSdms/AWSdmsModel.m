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

#import "AWSdmsModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSdmsErrorDomain = @"com.amazonaws.AWSdmsErrorDomain";

@implementation AWSdmsAccountQuota

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountQuotaName" : @"AccountQuotaName",
             @"max" : @"Max",
             @"used" : @"Used",
             };
}

@end

@implementation AWSdmsAddTagsToResourceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsTag class]];
}

@end

@implementation AWSdmsAddTagsToResourceResponse

@end

@implementation AWSdmsApplyPendingMaintenanceActionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyAction" : @"ApplyAction",
             @"optInType" : @"OptInType",
             @"replicationInstanceArn" : @"ReplicationInstanceArn",
             };
}

@end

@implementation AWSdmsApplyPendingMaintenanceActionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourcePendingMaintenanceActions" : @"ResourcePendingMaintenanceActions",
             };
}

+ (NSValueTransformer *)resourcePendingMaintenanceActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsResourcePendingMaintenanceActions class]];
}

@end

@implementation AWSdmsAvailabilityZone

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSdmsCertificate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"CertificateArn",
             @"certificateCreationDate" : @"CertificateCreationDate",
             @"certificateIdentifier" : @"CertificateIdentifier",
             @"certificateOwner" : @"CertificateOwner",
             @"certificatePem" : @"CertificatePem",
             @"certificateWallet" : @"CertificateWallet",
             @"keyLength" : @"KeyLength",
             @"signingAlgorithm" : @"SigningAlgorithm",
             @"validFromDate" : @"ValidFromDate",
             @"validToDate" : @"ValidToDate",
             };
}

+ (NSValueTransformer *)certificateCreationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)validFromDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)validToDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSdmsConnection

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             @"endpointIdentifier" : @"EndpointIdentifier",
             @"lastFailureMessage" : @"LastFailureMessage",
             @"replicationInstanceArn" : @"ReplicationInstanceArn",
             @"replicationInstanceIdentifier" : @"ReplicationInstanceIdentifier",
             @"status" : @"Status",
             };
}

@end

@implementation AWSdmsCreateEndpointMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"CertificateArn",
             @"databaseName" : @"DatabaseName",
             @"dmsTransferSettings" : @"DmsTransferSettings",
             @"dynamoDbSettings" : @"DynamoDbSettings",
             @"elasticsearchSettings" : @"ElasticsearchSettings",
             @"endpointIdentifier" : @"EndpointIdentifier",
             @"endpointType" : @"EndpointType",
             @"engineName" : @"EngineName",
             @"externalTableDefinition" : @"ExternalTableDefinition",
             @"extraConnectionAttributes" : @"ExtraConnectionAttributes",
             @"kafkaSettings" : @"KafkaSettings",
             @"kinesisSettings" : @"KinesisSettings",
             @"kmsKeyId" : @"KmsKeyId",
             @"mongoDbSettings" : @"MongoDbSettings",
             @"neptuneSettings" : @"NeptuneSettings",
             @"password" : @"Password",
             @"port" : @"Port",
             @"redshiftSettings" : @"RedshiftSettings",
             @"s3Settings" : @"S3Settings",
             @"serverName" : @"ServerName",
             @"serviceAccessRoleArn" : @"ServiceAccessRoleArn",
             @"sslMode" : @"SslMode",
             @"tags" : @"Tags",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)dmsTransferSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsDmsTransferSettings class]];
}

+ (NSValueTransformer *)dynamoDbSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsDynamoDbSettings class]];
}

+ (NSValueTransformer *)elasticsearchSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsElasticsearchSettings class]];
}

+ (NSValueTransformer *)endpointTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"source"] == NSOrderedSame) {
            return @(AWSdmsReplicationEndpointTypeValueSource);
        }
        if ([value caseInsensitiveCompare:@"target"] == NSOrderedSame) {
            return @(AWSdmsReplicationEndpointTypeValueTarget);
        }
        return @(AWSdmsReplicationEndpointTypeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsReplicationEndpointTypeValueSource:
                return @"source";
            case AWSdmsReplicationEndpointTypeValueTarget:
                return @"target";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)kafkaSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsKafkaSettings class]];
}

+ (NSValueTransformer *)kinesisSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsKinesisSettings class]];
}

+ (NSValueTransformer *)mongoDbSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsMongoDbSettings class]];
}

+ (NSValueTransformer *)neptuneSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsNeptuneSettings class]];
}

+ (NSValueTransformer *)redshiftSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsRedshiftSettings class]];
}

+ (NSValueTransformer *)s3SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsS3Settings class]];
}

+ (NSValueTransformer *)sslModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"none"] == NSOrderedSame) {
            return @(AWSdmsDmsSslModeValueNone);
        }
        if ([value caseInsensitiveCompare:@"require"] == NSOrderedSame) {
            return @(AWSdmsDmsSslModeValueRequire);
        }
        if ([value caseInsensitiveCompare:@"verify-ca"] == NSOrderedSame) {
            return @(AWSdmsDmsSslModeValueVerifyCa);
        }
        if ([value caseInsensitiveCompare:@"verify-full"] == NSOrderedSame) {
            return @(AWSdmsDmsSslModeValueVerifyFull);
        }
        return @(AWSdmsDmsSslModeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsDmsSslModeValueNone:
                return @"none";
            case AWSdmsDmsSslModeValueRequire:
                return @"require";
            case AWSdmsDmsSslModeValueVerifyCa:
                return @"verify-ca";
            case AWSdmsDmsSslModeValueVerifyFull:
                return @"verify-full";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsTag class]];
}

@end

@implementation AWSdmsCreateEndpointResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoint" : @"Endpoint",
             };
}

+ (NSValueTransformer *)endpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsEndpoint class]];
}

@end

@implementation AWSdmsCreateEventSubscriptionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"eventCategories" : @"EventCategories",
             @"snsTopicArn" : @"SnsTopicArn",
             @"sourceIds" : @"SourceIds",
             @"sourceType" : @"SourceType",
             @"subscriptionName" : @"SubscriptionName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsTag class]];
}

@end

@implementation AWSdmsCreateEventSubscriptionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSubscription" : @"EventSubscription",
             };
}

+ (NSValueTransformer *)eventSubscriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsEventSubscription class]];
}

@end

@implementation AWSdmsCreateReplicationInstanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocatedStorage" : @"AllocatedStorage",
             @"autoMinorVersionUpgrade" : @"AutoMinorVersionUpgrade",
             @"availabilityZone" : @"AvailabilityZone",
             @"dnsNameServers" : @"DnsNameServers",
             @"engineVersion" : @"EngineVersion",
             @"kmsKeyId" : @"KmsKeyId",
             @"multiAZ" : @"MultiAZ",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"publiclyAccessible" : @"PubliclyAccessible",
             @"replicationInstanceClass" : @"ReplicationInstanceClass",
             @"replicationInstanceIdentifier" : @"ReplicationInstanceIdentifier",
             @"replicationSubnetGroupIdentifier" : @"ReplicationSubnetGroupIdentifier",
             @"tags" : @"Tags",
             @"vpcSecurityGroupIds" : @"VpcSecurityGroupIds",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsTag class]];
}

@end

@implementation AWSdmsCreateReplicationInstanceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationInstance" : @"ReplicationInstance",
             };
}

+ (NSValueTransformer *)replicationInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsReplicationInstance class]];
}

@end

@implementation AWSdmsCreateReplicationSubnetGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationSubnetGroupDescription" : @"ReplicationSubnetGroupDescription",
             @"replicationSubnetGroupIdentifier" : @"ReplicationSubnetGroupIdentifier",
             @"subnetIds" : @"SubnetIds",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsTag class]];
}

@end

@implementation AWSdmsCreateReplicationSubnetGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationSubnetGroup" : @"ReplicationSubnetGroup",
             };
}

+ (NSValueTransformer *)replicationSubnetGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsReplicationSubnetGroup class]];
}

@end

@implementation AWSdmsCreateReplicationTaskMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cdcStartPosition" : @"CdcStartPosition",
             @"cdcStartTime" : @"CdcStartTime",
             @"cdcStopPosition" : @"CdcStopPosition",
             @"migrationType" : @"MigrationType",
             @"replicationInstanceArn" : @"ReplicationInstanceArn",
             @"replicationTaskIdentifier" : @"ReplicationTaskIdentifier",
             @"replicationTaskSettings" : @"ReplicationTaskSettings",
             @"sourceEndpointArn" : @"SourceEndpointArn",
             @"tableMappings" : @"TableMappings",
             @"tags" : @"Tags",
             @"targetEndpointArn" : @"TargetEndpointArn",
             @"taskData" : @"TaskData",
             };
}

+ (NSValueTransformer *)cdcStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)migrationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"full-load"] == NSOrderedSame) {
            return @(AWSdmsMigrationTypeValueFullLoad);
        }
        if ([value caseInsensitiveCompare:@"cdc"] == NSOrderedSame) {
            return @(AWSdmsMigrationTypeValueCdc);
        }
        if ([value caseInsensitiveCompare:@"full-load-and-cdc"] == NSOrderedSame) {
            return @(AWSdmsMigrationTypeValueFullLoadAndCdc);
        }
        return @(AWSdmsMigrationTypeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsMigrationTypeValueFullLoad:
                return @"full-load";
            case AWSdmsMigrationTypeValueCdc:
                return @"cdc";
            case AWSdmsMigrationTypeValueFullLoadAndCdc:
                return @"full-load-and-cdc";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsTag class]];
}

@end

@implementation AWSdmsCreateReplicationTaskResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationTask" : @"ReplicationTask",
             };
}

+ (NSValueTransformer *)replicationTaskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsReplicationTask class]];
}

@end

@implementation AWSdmsDeleteCertificateMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"CertificateArn",
             };
}

@end

@implementation AWSdmsDeleteCertificateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificate" : @"Certificate",
             };
}

+ (NSValueTransformer *)certificateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsCertificate class]];
}

@end

@implementation AWSdmsDeleteConnectionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             @"replicationInstanceArn" : @"ReplicationInstanceArn",
             };
}

@end

@implementation AWSdmsDeleteConnectionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connection" : @"Connection",
             };
}

+ (NSValueTransformer *)connectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsConnection class]];
}

@end

@implementation AWSdmsDeleteEndpointMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSdmsDeleteEndpointResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoint" : @"Endpoint",
             };
}

+ (NSValueTransformer *)endpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsEndpoint class]];
}

@end

@implementation AWSdmsDeleteEventSubscriptionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subscriptionName" : @"SubscriptionName",
             };
}

@end

@implementation AWSdmsDeleteEventSubscriptionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSubscription" : @"EventSubscription",
             };
}

+ (NSValueTransformer *)eventSubscriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsEventSubscription class]];
}

@end

@implementation AWSdmsDeleteReplicationInstanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationInstanceArn" : @"ReplicationInstanceArn",
             };
}

@end

@implementation AWSdmsDeleteReplicationInstanceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationInstance" : @"ReplicationInstance",
             };
}

+ (NSValueTransformer *)replicationInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsReplicationInstance class]];
}

@end

@implementation AWSdmsDeleteReplicationSubnetGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationSubnetGroupIdentifier" : @"ReplicationSubnetGroupIdentifier",
             };
}

@end

@implementation AWSdmsDeleteReplicationSubnetGroupResponse

@end

@implementation AWSdmsDeleteReplicationTaskMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationTaskArn" : @"ReplicationTaskArn",
             };
}

@end

@implementation AWSdmsDeleteReplicationTaskResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationTask" : @"ReplicationTask",
             };
}

+ (NSValueTransformer *)replicationTaskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsReplicationTask class]];
}

@end

@implementation AWSdmsDescribeAccountAttributesMessage

@end

@implementation AWSdmsDescribeAccountAttributesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountQuotas" : @"AccountQuotas",
             @"uniqueAccountIdentifier" : @"UniqueAccountIdentifier",
             };
}

+ (NSValueTransformer *)accountQuotasJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsAccountQuota class]];
}

@end

@implementation AWSdmsDescribeCertificatesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsFilter class]];
}

@end

@implementation AWSdmsDescribeCertificatesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificates" : @"Certificates",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)certificatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsCertificate class]];
}

@end

@implementation AWSdmsDescribeConnectionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsFilter class]];
}

@end

@implementation AWSdmsDescribeConnectionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connections" : @"Connections",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)connectionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsConnection class]];
}

@end

@implementation AWSdmsDescribeEndpointTypesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsFilter class]];
}

@end

@implementation AWSdmsDescribeEndpointTypesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"supportedEndpointTypes" : @"SupportedEndpointTypes",
             };
}

+ (NSValueTransformer *)supportedEndpointTypesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsSupportedEndpointType class]];
}

@end

@implementation AWSdmsDescribeEndpointsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsFilter class]];
}

@end

@implementation AWSdmsDescribeEndpointsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoints" : @"Endpoints",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)endpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsEndpoint class]];
}

@end

@implementation AWSdmsDescribeEventCategoriesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"sourceType" : @"SourceType",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsFilter class]];
}

@end

@implementation AWSdmsDescribeEventCategoriesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventCategoryGroupList" : @"EventCategoryGroupList",
             };
}

+ (NSValueTransformer *)eventCategoryGroupListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsEventCategoryGroup class]];
}

@end

@implementation AWSdmsDescribeEventSubscriptionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"subscriptionName" : @"SubscriptionName",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsFilter class]];
}

@end

@implementation AWSdmsDescribeEventSubscriptionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSubscriptionsList" : @"EventSubscriptionsList",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)eventSubscriptionsListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsEventSubscription class]];
}

@end

@implementation AWSdmsDescribeEventsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"duration" : @"Duration",
             @"endTime" : @"EndTime",
             @"eventCategories" : @"EventCategories",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"sourceIdentifier" : @"SourceIdentifier",
             @"sourceType" : @"SourceType",
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

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsFilter class]];
}

+ (NSValueTransformer *)sourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"replication-instance"] == NSOrderedSame) {
            return @(AWSdmsSourceTypeReplicationInstance);
        }
        return @(AWSdmsSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsSourceTypeReplicationInstance:
                return @"replication-instance";
            default:
                return nil;
        }
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

@implementation AWSdmsDescribeEventsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"events" : @"Events",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)eventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsEvent class]];
}

@end

@implementation AWSdmsDescribeOrderableReplicationInstancesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

@end

@implementation AWSdmsDescribeOrderableReplicationInstancesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"orderableReplicationInstances" : @"OrderableReplicationInstances",
             };
}

+ (NSValueTransformer *)orderableReplicationInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsOrderableReplicationInstance class]];
}

@end

@implementation AWSdmsDescribePendingMaintenanceActionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"replicationInstanceArn" : @"ReplicationInstanceArn",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsFilter class]];
}

@end

@implementation AWSdmsDescribePendingMaintenanceActionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"pendingMaintenanceActions" : @"PendingMaintenanceActions",
             };
}

+ (NSValueTransformer *)pendingMaintenanceActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsResourcePendingMaintenanceActions class]];
}

@end

@implementation AWSdmsDescribeRefreshSchemasStatusMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSdmsDescribeRefreshSchemasStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"refreshSchemasStatus" : @"RefreshSchemasStatus",
             };
}

+ (NSValueTransformer *)refreshSchemasStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsRefreshSchemasStatus class]];
}

@end

@implementation AWSdmsDescribeReplicationInstanceTaskLogsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"replicationInstanceArn" : @"ReplicationInstanceArn",
             };
}

@end

@implementation AWSdmsDescribeReplicationInstanceTaskLogsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"replicationInstanceArn" : @"ReplicationInstanceArn",
             @"replicationInstanceTaskLogs" : @"ReplicationInstanceTaskLogs",
             };
}

+ (NSValueTransformer *)replicationInstanceTaskLogsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsReplicationInstanceTaskLog class]];
}

@end

@implementation AWSdmsDescribeReplicationInstancesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsFilter class]];
}

@end

@implementation AWSdmsDescribeReplicationInstancesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"replicationInstances" : @"ReplicationInstances",
             };
}

+ (NSValueTransformer *)replicationInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsReplicationInstance class]];
}

@end

@implementation AWSdmsDescribeReplicationSubnetGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsFilter class]];
}

@end

@implementation AWSdmsDescribeReplicationSubnetGroupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"replicationSubnetGroups" : @"ReplicationSubnetGroups",
             };
}

+ (NSValueTransformer *)replicationSubnetGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsReplicationSubnetGroup class]];
}

@end

@implementation AWSdmsDescribeReplicationTaskAssessmentResultsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"replicationTaskArn" : @"ReplicationTaskArn",
             };
}

@end

@implementation AWSdmsDescribeReplicationTaskAssessmentResultsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketName" : @"BucketName",
             @"marker" : @"Marker",
             @"replicationTaskAssessmentResults" : @"ReplicationTaskAssessmentResults",
             };
}

+ (NSValueTransformer *)replicationTaskAssessmentResultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsReplicationTaskAssessmentResult class]];
}

@end

@implementation AWSdmsDescribeReplicationTasksMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"withoutSettings" : @"WithoutSettings",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsFilter class]];
}

@end

@implementation AWSdmsDescribeReplicationTasksResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"replicationTasks" : @"ReplicationTasks",
             };
}

+ (NSValueTransformer *)replicationTasksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsReplicationTask class]];
}

@end

@implementation AWSdmsDescribeSchemasMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

@end

@implementation AWSdmsDescribeSchemasResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"schemas" : @"Schemas",
             };
}

@end

@implementation AWSdmsDescribeTableStatisticsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"replicationTaskArn" : @"ReplicationTaskArn",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsFilter class]];
}

@end

@implementation AWSdmsDescribeTableStatisticsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"replicationTaskArn" : @"ReplicationTaskArn",
             @"tableStatistics" : @"TableStatistics",
             };
}

+ (NSValueTransformer *)tableStatisticsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsTableStatistics class]];
}

@end

@implementation AWSdmsDmsTransferSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketName" : @"BucketName",
             @"serviceAccessRoleArn" : @"ServiceAccessRoleArn",
             };
}

@end

@implementation AWSdmsDynamoDbSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceAccessRoleArn" : @"ServiceAccessRoleArn",
             };
}

@end

@implementation AWSdmsElasticsearchSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointUri" : @"EndpointUri",
             @"errorRetryDuration" : @"ErrorRetryDuration",
             @"fullLoadErrorPercentage" : @"FullLoadErrorPercentage",
             @"serviceAccessRoleArn" : @"ServiceAccessRoleArn",
             };
}

@end

@implementation AWSdmsEndpoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"CertificateArn",
             @"databaseName" : @"DatabaseName",
             @"dmsTransferSettings" : @"DmsTransferSettings",
             @"dynamoDbSettings" : @"DynamoDbSettings",
             @"elasticsearchSettings" : @"ElasticsearchSettings",
             @"endpointArn" : @"EndpointArn",
             @"endpointIdentifier" : @"EndpointIdentifier",
             @"endpointType" : @"EndpointType",
             @"engineDisplayName" : @"EngineDisplayName",
             @"engineName" : @"EngineName",
             @"externalId" : @"ExternalId",
             @"externalTableDefinition" : @"ExternalTableDefinition",
             @"extraConnectionAttributes" : @"ExtraConnectionAttributes",
             @"kafkaSettings" : @"KafkaSettings",
             @"kinesisSettings" : @"KinesisSettings",
             @"kmsKeyId" : @"KmsKeyId",
             @"mongoDbSettings" : @"MongoDbSettings",
             @"neptuneSettings" : @"NeptuneSettings",
             @"port" : @"Port",
             @"redshiftSettings" : @"RedshiftSettings",
             @"s3Settings" : @"S3Settings",
             @"serverName" : @"ServerName",
             @"serviceAccessRoleArn" : @"ServiceAccessRoleArn",
             @"sslMode" : @"SslMode",
             @"status" : @"Status",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)dmsTransferSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsDmsTransferSettings class]];
}

+ (NSValueTransformer *)dynamoDbSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsDynamoDbSettings class]];
}

+ (NSValueTransformer *)elasticsearchSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsElasticsearchSettings class]];
}

+ (NSValueTransformer *)endpointTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"source"] == NSOrderedSame) {
            return @(AWSdmsReplicationEndpointTypeValueSource);
        }
        if ([value caseInsensitiveCompare:@"target"] == NSOrderedSame) {
            return @(AWSdmsReplicationEndpointTypeValueTarget);
        }
        return @(AWSdmsReplicationEndpointTypeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsReplicationEndpointTypeValueSource:
                return @"source";
            case AWSdmsReplicationEndpointTypeValueTarget:
                return @"target";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)kafkaSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsKafkaSettings class]];
}

+ (NSValueTransformer *)kinesisSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsKinesisSettings class]];
}

+ (NSValueTransformer *)mongoDbSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsMongoDbSettings class]];
}

+ (NSValueTransformer *)neptuneSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsNeptuneSettings class]];
}

+ (NSValueTransformer *)redshiftSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsRedshiftSettings class]];
}

+ (NSValueTransformer *)s3SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsS3Settings class]];
}

+ (NSValueTransformer *)sslModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"none"] == NSOrderedSame) {
            return @(AWSdmsDmsSslModeValueNone);
        }
        if ([value caseInsensitiveCompare:@"require"] == NSOrderedSame) {
            return @(AWSdmsDmsSslModeValueRequire);
        }
        if ([value caseInsensitiveCompare:@"verify-ca"] == NSOrderedSame) {
            return @(AWSdmsDmsSslModeValueVerifyCa);
        }
        if ([value caseInsensitiveCompare:@"verify-full"] == NSOrderedSame) {
            return @(AWSdmsDmsSslModeValueVerifyFull);
        }
        return @(AWSdmsDmsSslModeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsDmsSslModeValueNone:
                return @"none";
            case AWSdmsDmsSslModeValueRequire:
                return @"require";
            case AWSdmsDmsSslModeValueVerifyCa:
                return @"verify-ca";
            case AWSdmsDmsSslModeValueVerifyFull:
                return @"verify-full";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdmsEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"date" : @"Date",
             @"eventCategories" : @"EventCategories",
             @"message" : @"Message",
             @"sourceIdentifier" : @"SourceIdentifier",
             @"sourceType" : @"SourceType",
             };
}

+ (NSValueTransformer *)dateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"replication-instance"] == NSOrderedSame) {
            return @(AWSdmsSourceTypeReplicationInstance);
        }
        return @(AWSdmsSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsSourceTypeReplicationInstance:
                return @"replication-instance";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdmsEventCategoryGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventCategories" : @"EventCategories",
             @"sourceType" : @"SourceType",
             };
}

@end

@implementation AWSdmsEventSubscription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"custSubscriptionId" : @"CustSubscriptionId",
             @"customerAwsId" : @"CustomerAwsId",
             @"enabled" : @"Enabled",
             @"eventCategoriesList" : @"EventCategoriesList",
             @"snsTopicArn" : @"SnsTopicArn",
             @"sourceIdsList" : @"SourceIdsList",
             @"sourceType" : @"SourceType",
             @"status" : @"Status",
             @"subscriptionCreationTime" : @"SubscriptionCreationTime",
             };
}

@end

@implementation AWSdmsFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"values" : @"Values",
             };
}

@end

@implementation AWSdmsImportCertificateMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateIdentifier" : @"CertificateIdentifier",
             @"certificatePem" : @"CertificatePem",
             @"certificateWallet" : @"CertificateWallet",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsTag class]];
}

@end

@implementation AWSdmsImportCertificateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificate" : @"Certificate",
             };
}

+ (NSValueTransformer *)certificateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsCertificate class]];
}

@end

@implementation AWSdmsKafkaSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"broker" : @"Broker",
             @"topic" : @"Topic",
             };
}

@end

@implementation AWSdmsKinesisSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"includeControlDetails" : @"IncludeControlDetails",
             @"includePartitionValue" : @"IncludePartitionValue",
             @"includeTableAlterOperations" : @"IncludeTableAlterOperations",
             @"includeTransactionDetails" : @"IncludeTransactionDetails",
             @"messageFormat" : @"MessageFormat",
             @"partitionIncludeSchemaTable" : @"PartitionIncludeSchemaTable",
             @"serviceAccessRoleArn" : @"ServiceAccessRoleArn",
             @"streamArn" : @"StreamArn",
             };
}

+ (NSValueTransformer *)messageFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"json"] == NSOrderedSame) {
            return @(AWSdmsMessageFormatValueJson);
        }
        if ([value caseInsensitiveCompare:@"json-unformatted"] == NSOrderedSame) {
            return @(AWSdmsMessageFormatValueJsonUnformatted);
        }
        return @(AWSdmsMessageFormatValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsMessageFormatValueJson:
                return @"json";
            case AWSdmsMessageFormatValueJsonUnformatted:
                return @"json-unformatted";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdmsListTagsForResourceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSdmsListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagList" : @"TagList",
             };
}

+ (NSValueTransformer *)tagListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsTag class]];
}

@end

@implementation AWSdmsModifyEndpointMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"CertificateArn",
             @"databaseName" : @"DatabaseName",
             @"dmsTransferSettings" : @"DmsTransferSettings",
             @"dynamoDbSettings" : @"DynamoDbSettings",
             @"elasticsearchSettings" : @"ElasticsearchSettings",
             @"endpointArn" : @"EndpointArn",
             @"endpointIdentifier" : @"EndpointIdentifier",
             @"endpointType" : @"EndpointType",
             @"engineName" : @"EngineName",
             @"externalTableDefinition" : @"ExternalTableDefinition",
             @"extraConnectionAttributes" : @"ExtraConnectionAttributes",
             @"kafkaSettings" : @"KafkaSettings",
             @"kinesisSettings" : @"KinesisSettings",
             @"mongoDbSettings" : @"MongoDbSettings",
             @"neptuneSettings" : @"NeptuneSettings",
             @"password" : @"Password",
             @"port" : @"Port",
             @"redshiftSettings" : @"RedshiftSettings",
             @"s3Settings" : @"S3Settings",
             @"serverName" : @"ServerName",
             @"serviceAccessRoleArn" : @"ServiceAccessRoleArn",
             @"sslMode" : @"SslMode",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)dmsTransferSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsDmsTransferSettings class]];
}

+ (NSValueTransformer *)dynamoDbSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsDynamoDbSettings class]];
}

+ (NSValueTransformer *)elasticsearchSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsElasticsearchSettings class]];
}

+ (NSValueTransformer *)endpointTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"source"] == NSOrderedSame) {
            return @(AWSdmsReplicationEndpointTypeValueSource);
        }
        if ([value caseInsensitiveCompare:@"target"] == NSOrderedSame) {
            return @(AWSdmsReplicationEndpointTypeValueTarget);
        }
        return @(AWSdmsReplicationEndpointTypeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsReplicationEndpointTypeValueSource:
                return @"source";
            case AWSdmsReplicationEndpointTypeValueTarget:
                return @"target";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)kafkaSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsKafkaSettings class]];
}

+ (NSValueTransformer *)kinesisSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsKinesisSettings class]];
}

+ (NSValueTransformer *)mongoDbSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsMongoDbSettings class]];
}

+ (NSValueTransformer *)neptuneSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsNeptuneSettings class]];
}

+ (NSValueTransformer *)redshiftSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsRedshiftSettings class]];
}

+ (NSValueTransformer *)s3SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsS3Settings class]];
}

+ (NSValueTransformer *)sslModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"none"] == NSOrderedSame) {
            return @(AWSdmsDmsSslModeValueNone);
        }
        if ([value caseInsensitiveCompare:@"require"] == NSOrderedSame) {
            return @(AWSdmsDmsSslModeValueRequire);
        }
        if ([value caseInsensitiveCompare:@"verify-ca"] == NSOrderedSame) {
            return @(AWSdmsDmsSslModeValueVerifyCa);
        }
        if ([value caseInsensitiveCompare:@"verify-full"] == NSOrderedSame) {
            return @(AWSdmsDmsSslModeValueVerifyFull);
        }
        return @(AWSdmsDmsSslModeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsDmsSslModeValueNone:
                return @"none";
            case AWSdmsDmsSslModeValueRequire:
                return @"require";
            case AWSdmsDmsSslModeValueVerifyCa:
                return @"verify-ca";
            case AWSdmsDmsSslModeValueVerifyFull:
                return @"verify-full";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdmsModifyEndpointResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoint" : @"Endpoint",
             };
}

+ (NSValueTransformer *)endpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsEndpoint class]];
}

@end

@implementation AWSdmsModifyEventSubscriptionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"eventCategories" : @"EventCategories",
             @"snsTopicArn" : @"SnsTopicArn",
             @"sourceType" : @"SourceType",
             @"subscriptionName" : @"SubscriptionName",
             };
}

@end

@implementation AWSdmsModifyEventSubscriptionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSubscription" : @"EventSubscription",
             };
}

+ (NSValueTransformer *)eventSubscriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsEventSubscription class]];
}

@end

@implementation AWSdmsModifyReplicationInstanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocatedStorage" : @"AllocatedStorage",
             @"allowMajorVersionUpgrade" : @"AllowMajorVersionUpgrade",
             @"applyImmediately" : @"ApplyImmediately",
             @"autoMinorVersionUpgrade" : @"AutoMinorVersionUpgrade",
             @"engineVersion" : @"EngineVersion",
             @"multiAZ" : @"MultiAZ",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"replicationInstanceArn" : @"ReplicationInstanceArn",
             @"replicationInstanceClass" : @"ReplicationInstanceClass",
             @"replicationInstanceIdentifier" : @"ReplicationInstanceIdentifier",
             @"vpcSecurityGroupIds" : @"VpcSecurityGroupIds",
             };
}

@end

@implementation AWSdmsModifyReplicationInstanceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationInstance" : @"ReplicationInstance",
             };
}

+ (NSValueTransformer *)replicationInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsReplicationInstance class]];
}

@end

@implementation AWSdmsModifyReplicationSubnetGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationSubnetGroupDescription" : @"ReplicationSubnetGroupDescription",
             @"replicationSubnetGroupIdentifier" : @"ReplicationSubnetGroupIdentifier",
             @"subnetIds" : @"SubnetIds",
             };
}

@end

@implementation AWSdmsModifyReplicationSubnetGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationSubnetGroup" : @"ReplicationSubnetGroup",
             };
}

+ (NSValueTransformer *)replicationSubnetGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsReplicationSubnetGroup class]];
}

@end

@implementation AWSdmsModifyReplicationTaskMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cdcStartPosition" : @"CdcStartPosition",
             @"cdcStartTime" : @"CdcStartTime",
             @"cdcStopPosition" : @"CdcStopPosition",
             @"migrationType" : @"MigrationType",
             @"replicationTaskArn" : @"ReplicationTaskArn",
             @"replicationTaskIdentifier" : @"ReplicationTaskIdentifier",
             @"replicationTaskSettings" : @"ReplicationTaskSettings",
             @"tableMappings" : @"TableMappings",
             @"taskData" : @"TaskData",
             };
}

+ (NSValueTransformer *)cdcStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)migrationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"full-load"] == NSOrderedSame) {
            return @(AWSdmsMigrationTypeValueFullLoad);
        }
        if ([value caseInsensitiveCompare:@"cdc"] == NSOrderedSame) {
            return @(AWSdmsMigrationTypeValueCdc);
        }
        if ([value caseInsensitiveCompare:@"full-load-and-cdc"] == NSOrderedSame) {
            return @(AWSdmsMigrationTypeValueFullLoadAndCdc);
        }
        return @(AWSdmsMigrationTypeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsMigrationTypeValueFullLoad:
                return @"full-load";
            case AWSdmsMigrationTypeValueCdc:
                return @"cdc";
            case AWSdmsMigrationTypeValueFullLoadAndCdc:
                return @"full-load-and-cdc";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdmsModifyReplicationTaskResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationTask" : @"ReplicationTask",
             };
}

+ (NSValueTransformer *)replicationTaskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsReplicationTask class]];
}

@end

@implementation AWSdmsMongoDbSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authMechanism" : @"AuthMechanism",
             @"authSource" : @"AuthSource",
             @"authType" : @"AuthType",
             @"databaseName" : @"DatabaseName",
             @"docsToInvestigate" : @"DocsToInvestigate",
             @"extractDocId" : @"ExtractDocId",
             @"kmsKeyId" : @"KmsKeyId",
             @"nestingLevel" : @"NestingLevel",
             @"password" : @"Password",
             @"port" : @"Port",
             @"serverName" : @"ServerName",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)authMechanismJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"default"] == NSOrderedSame) {
            return @(AWSdmsAuthMechanismValueDefault);
        }
        if ([value caseInsensitiveCompare:@"mongodb_cr"] == NSOrderedSame) {
            return @(AWSdmsAuthMechanismValueMongodbCr);
        }
        if ([value caseInsensitiveCompare:@"scram_sha_1"] == NSOrderedSame) {
            return @(AWSdmsAuthMechanismValueScramSha1);
        }
        return @(AWSdmsAuthMechanismValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsAuthMechanismValueDefault:
                return @"default";
            case AWSdmsAuthMechanismValueMongodbCr:
                return @"mongodb_cr";
            case AWSdmsAuthMechanismValueScramSha1:
                return @"scram_sha_1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)authTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"no"] == NSOrderedSame) {
            return @(AWSdmsAuthTypeValueNo);
        }
        if ([value caseInsensitiveCompare:@"password"] == NSOrderedSame) {
            return @(AWSdmsAuthTypeValuePassword);
        }
        return @(AWSdmsAuthTypeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsAuthTypeValueNo:
                return @"no";
            case AWSdmsAuthTypeValuePassword:
                return @"password";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)nestingLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"none"] == NSOrderedSame) {
            return @(AWSdmsNestingLevelValueNone);
        }
        if ([value caseInsensitiveCompare:@"one"] == NSOrderedSame) {
            return @(AWSdmsNestingLevelValueOne);
        }
        return @(AWSdmsNestingLevelValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsNestingLevelValueNone:
                return @"none";
            case AWSdmsNestingLevelValueOne:
                return @"one";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdmsNeptuneSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorRetryDuration" : @"ErrorRetryDuration",
             @"iamAuthEnabled" : @"IamAuthEnabled",
             @"maxFileSize" : @"MaxFileSize",
             @"maxRetryCount" : @"MaxRetryCount",
             @"s3BucketFolder" : @"S3BucketFolder",
             @"s3BucketName" : @"S3BucketName",
             @"serviceAccessRoleArn" : @"ServiceAccessRoleArn",
             };
}

@end

@implementation AWSdmsOrderableReplicationInstance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             @"defaultAllocatedStorage" : @"DefaultAllocatedStorage",
             @"engineVersion" : @"EngineVersion",
             @"includedAllocatedStorage" : @"IncludedAllocatedStorage",
             @"maxAllocatedStorage" : @"MaxAllocatedStorage",
             @"minAllocatedStorage" : @"MinAllocatedStorage",
             @"releaseStatus" : @"ReleaseStatus",
             @"replicationInstanceClass" : @"ReplicationInstanceClass",
             @"storageType" : @"StorageType",
             };
}

+ (NSValueTransformer *)releaseStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"beta"] == NSOrderedSame) {
            return @(AWSdmsReleaseStatusValuesBeta);
        }
        return @(AWSdmsReleaseStatusValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsReleaseStatusValuesBeta:
                return @"beta";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdmsPendingMaintenanceAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"autoAppliedAfterDate" : @"AutoAppliedAfterDate",
             @"currentApplyDate" : @"CurrentApplyDate",
             @"detail" : @"Description",
             @"forcedApplyDate" : @"ForcedApplyDate",
             @"optInStatus" : @"OptInStatus",
             };
}

+ (NSValueTransformer *)autoAppliedAfterDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)currentApplyDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)forcedApplyDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSdmsRebootReplicationInstanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"forceFailover" : @"ForceFailover",
             @"replicationInstanceArn" : @"ReplicationInstanceArn",
             };
}

@end

@implementation AWSdmsRebootReplicationInstanceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationInstance" : @"ReplicationInstance",
             };
}

+ (NSValueTransformer *)replicationInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsReplicationInstance class]];
}

@end

@implementation AWSdmsRedshiftSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptAnyDate" : @"AcceptAnyDate",
             @"afterConnectScript" : @"AfterConnectScript",
             @"bucketFolder" : @"BucketFolder",
             @"bucketName" : @"BucketName",
             @"connectionTimeout" : @"ConnectionTimeout",
             @"databaseName" : @"DatabaseName",
             @"dateFormat" : @"DateFormat",
             @"emptyAsNull" : @"EmptyAsNull",
             @"encryptionMode" : @"EncryptionMode",
             @"fileTransferUploadStreams" : @"FileTransferUploadStreams",
             @"loadTimeout" : @"LoadTimeout",
             @"maxFileSize" : @"MaxFileSize",
             @"password" : @"Password",
             @"port" : @"Port",
             @"removeQuotes" : @"RemoveQuotes",
             @"replaceChars" : @"ReplaceChars",
             @"replaceInvalidChars" : @"ReplaceInvalidChars",
             @"serverName" : @"ServerName",
             @"serverSideEncryptionKmsKeyId" : @"ServerSideEncryptionKmsKeyId",
             @"serviceAccessRoleArn" : @"ServiceAccessRoleArn",
             @"timeFormat" : @"TimeFormat",
             @"trimBlanks" : @"TrimBlanks",
             @"truncateColumns" : @"TruncateColumns",
             @"username" : @"Username",
             @"writeBufferSize" : @"WriteBufferSize",
             };
}

+ (NSValueTransformer *)encryptionModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"sse-s3"] == NSOrderedSame) {
            return @(AWSdmsEncryptionModeValueSseS3);
        }
        if ([value caseInsensitiveCompare:@"sse-kms"] == NSOrderedSame) {
            return @(AWSdmsEncryptionModeValueSseKms);
        }
        return @(AWSdmsEncryptionModeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsEncryptionModeValueSseS3:
                return @"sse-s3";
            case AWSdmsEncryptionModeValueSseKms:
                return @"sse-kms";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdmsRefreshSchemasMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             @"replicationInstanceArn" : @"ReplicationInstanceArn",
             };
}

@end

@implementation AWSdmsRefreshSchemasResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"refreshSchemasStatus" : @"RefreshSchemasStatus",
             };
}

+ (NSValueTransformer *)refreshSchemasStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsRefreshSchemasStatus class]];
}

@end

@implementation AWSdmsRefreshSchemasStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             @"lastFailureMessage" : @"LastFailureMessage",
             @"lastRefreshDate" : @"LastRefreshDate",
             @"replicationInstanceArn" : @"ReplicationInstanceArn",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)lastRefreshDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"successful"] == NSOrderedSame) {
            return @(AWSdmsRefreshSchemasStatusTypeValueSuccessful);
        }
        if ([value caseInsensitiveCompare:@"failed"] == NSOrderedSame) {
            return @(AWSdmsRefreshSchemasStatusTypeValueFailed);
        }
        if ([value caseInsensitiveCompare:@"refreshing"] == NSOrderedSame) {
            return @(AWSdmsRefreshSchemasStatusTypeValueRefreshing);
        }
        return @(AWSdmsRefreshSchemasStatusTypeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsRefreshSchemasStatusTypeValueSuccessful:
                return @"successful";
            case AWSdmsRefreshSchemasStatusTypeValueFailed:
                return @"failed";
            case AWSdmsRefreshSchemasStatusTypeValueRefreshing:
                return @"refreshing";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdmsReloadTablesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reloadOption" : @"ReloadOption",
             @"replicationTaskArn" : @"ReplicationTaskArn",
             @"tablesToReload" : @"TablesToReload",
             };
}

+ (NSValueTransformer *)reloadOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"data-reload"] == NSOrderedSame) {
            return @(AWSdmsReloadOptionValueDataReload);
        }
        if ([value caseInsensitiveCompare:@"validate-only"] == NSOrderedSame) {
            return @(AWSdmsReloadOptionValueValidateOnly);
        }
        return @(AWSdmsReloadOptionValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsReloadOptionValueDataReload:
                return @"data-reload";
            case AWSdmsReloadOptionValueValidateOnly:
                return @"validate-only";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tablesToReloadJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsTableToReload class]];
}

@end

@implementation AWSdmsReloadTablesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationTaskArn" : @"ReplicationTaskArn",
             };
}

@end

@implementation AWSdmsRemoveTagsFromResourceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSdmsRemoveTagsFromResourceResponse

@end

@implementation AWSdmsReplicationInstance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocatedStorage" : @"AllocatedStorage",
             @"autoMinorVersionUpgrade" : @"AutoMinorVersionUpgrade",
             @"availabilityZone" : @"AvailabilityZone",
             @"dnsNameServers" : @"DnsNameServers",
             @"engineVersion" : @"EngineVersion",
             @"freeUntil" : @"FreeUntil",
             @"instanceCreateTime" : @"InstanceCreateTime",
             @"kmsKeyId" : @"KmsKeyId",
             @"multiAZ" : @"MultiAZ",
             @"pendingModifiedValues" : @"PendingModifiedValues",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"publiclyAccessible" : @"PubliclyAccessible",
             @"replicationInstanceArn" : @"ReplicationInstanceArn",
             @"replicationInstanceClass" : @"ReplicationInstanceClass",
             @"replicationInstanceIdentifier" : @"ReplicationInstanceIdentifier",
             @"replicationInstancePrivateIpAddress" : @"ReplicationInstancePrivateIpAddress",
             @"replicationInstancePrivateIpAddresses" : @"ReplicationInstancePrivateIpAddresses",
             @"replicationInstancePublicIpAddress" : @"ReplicationInstancePublicIpAddress",
             @"replicationInstancePublicIpAddresses" : @"ReplicationInstancePublicIpAddresses",
             @"replicationInstanceStatus" : @"ReplicationInstanceStatus",
             @"replicationSubnetGroup" : @"ReplicationSubnetGroup",
             @"secondaryAvailabilityZone" : @"SecondaryAvailabilityZone",
             @"vpcSecurityGroups" : @"VpcSecurityGroups",
             };
}

+ (NSValueTransformer *)freeUntilJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)instanceCreateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)pendingModifiedValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsReplicationPendingModifiedValues class]];
}

+ (NSValueTransformer *)replicationSubnetGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsReplicationSubnetGroup class]];
}

+ (NSValueTransformer *)vpcSecurityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsVpcSecurityGroupMembership class]];
}

@end

@implementation AWSdmsReplicationInstanceTaskLog

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationInstanceTaskLogSize" : @"ReplicationInstanceTaskLogSize",
             @"replicationTaskArn" : @"ReplicationTaskArn",
             @"replicationTaskName" : @"ReplicationTaskName",
             };
}

@end

@implementation AWSdmsReplicationPendingModifiedValues

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocatedStorage" : @"AllocatedStorage",
             @"engineVersion" : @"EngineVersion",
             @"multiAZ" : @"MultiAZ",
             @"replicationInstanceClass" : @"ReplicationInstanceClass",
             };
}

@end

@implementation AWSdmsReplicationSubnetGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationSubnetGroupDescription" : @"ReplicationSubnetGroupDescription",
             @"replicationSubnetGroupIdentifier" : @"ReplicationSubnetGroupIdentifier",
             @"subnetGroupStatus" : @"SubnetGroupStatus",
             @"subnets" : @"Subnets",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)subnetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsSubnet class]];
}

@end

@implementation AWSdmsReplicationTask

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cdcStartPosition" : @"CdcStartPosition",
             @"cdcStopPosition" : @"CdcStopPosition",
             @"lastFailureMessage" : @"LastFailureMessage",
             @"migrationType" : @"MigrationType",
             @"recoveryCheckpoint" : @"RecoveryCheckpoint",
             @"replicationInstanceArn" : @"ReplicationInstanceArn",
             @"replicationTaskArn" : @"ReplicationTaskArn",
             @"replicationTaskCreationDate" : @"ReplicationTaskCreationDate",
             @"replicationTaskIdentifier" : @"ReplicationTaskIdentifier",
             @"replicationTaskSettings" : @"ReplicationTaskSettings",
             @"replicationTaskStartDate" : @"ReplicationTaskStartDate",
             @"replicationTaskStats" : @"ReplicationTaskStats",
             @"sourceEndpointArn" : @"SourceEndpointArn",
             @"status" : @"Status",
             @"stopReason" : @"StopReason",
             @"tableMappings" : @"TableMappings",
             @"targetEndpointArn" : @"TargetEndpointArn",
             @"taskData" : @"TaskData",
             };
}

+ (NSValueTransformer *)migrationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"full-load"] == NSOrderedSame) {
            return @(AWSdmsMigrationTypeValueFullLoad);
        }
        if ([value caseInsensitiveCompare:@"cdc"] == NSOrderedSame) {
            return @(AWSdmsMigrationTypeValueCdc);
        }
        if ([value caseInsensitiveCompare:@"full-load-and-cdc"] == NSOrderedSame) {
            return @(AWSdmsMigrationTypeValueFullLoadAndCdc);
        }
        return @(AWSdmsMigrationTypeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsMigrationTypeValueFullLoad:
                return @"full-load";
            case AWSdmsMigrationTypeValueCdc:
                return @"cdc";
            case AWSdmsMigrationTypeValueFullLoadAndCdc:
                return @"full-load-and-cdc";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)replicationTaskCreationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)replicationTaskStartDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)replicationTaskStatsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsReplicationTaskStats class]];
}

@end

@implementation AWSdmsReplicationTaskAssessmentResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assessmentResults" : @"AssessmentResults",
             @"assessmentResultsFile" : @"AssessmentResultsFile",
             @"assessmentStatus" : @"AssessmentStatus",
             @"replicationTaskArn" : @"ReplicationTaskArn",
             @"replicationTaskIdentifier" : @"ReplicationTaskIdentifier",
             @"replicationTaskLastAssessmentDate" : @"ReplicationTaskLastAssessmentDate",
             @"s3ObjectUrl" : @"S3ObjectUrl",
             };
}

+ (NSValueTransformer *)replicationTaskLastAssessmentDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSdmsReplicationTaskStats

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"elapsedTimeMillis" : @"ElapsedTimeMillis",
             @"freshStartDate" : @"FreshStartDate",
             @"fullLoadFinishDate" : @"FullLoadFinishDate",
             @"fullLoadProgressPercent" : @"FullLoadProgressPercent",
             @"fullLoadStartDate" : @"FullLoadStartDate",
             @"startDate" : @"StartDate",
             @"stopDate" : @"StopDate",
             @"tablesErrored" : @"TablesErrored",
             @"tablesLoaded" : @"TablesLoaded",
             @"tablesLoading" : @"TablesLoading",
             @"tablesQueued" : @"TablesQueued",
             };
}

+ (NSValueTransformer *)freshStartDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)fullLoadFinishDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)fullLoadStartDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stopDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSdmsResourcePendingMaintenanceActions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pendingMaintenanceActionDetails" : @"PendingMaintenanceActionDetails",
             @"resourceIdentifier" : @"ResourceIdentifier",
             };
}

+ (NSValueTransformer *)pendingMaintenanceActionDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSdmsPendingMaintenanceAction class]];
}

@end

@implementation AWSdmsS3Settings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketFolder" : @"BucketFolder",
             @"bucketName" : @"BucketName",
             @"cdcInsertsAndUpdates" : @"CdcInsertsAndUpdates",
             @"cdcInsertsOnly" : @"CdcInsertsOnly",
             @"compressionType" : @"CompressionType",
             @"csvDelimiter" : @"CsvDelimiter",
             @"csvRowDelimiter" : @"CsvRowDelimiter",
             @"dataFormat" : @"DataFormat",
             @"dataPageSize" : @"DataPageSize",
             @"dictPageSizeLimit" : @"DictPageSizeLimit",
             @"enableStatistics" : @"EnableStatistics",
             @"encodingType" : @"EncodingType",
             @"encryptionMode" : @"EncryptionMode",
             @"externalTableDefinition" : @"ExternalTableDefinition",
             @"includeOpForFullLoad" : @"IncludeOpForFullLoad",
             @"parquetTimestampInMillisecond" : @"ParquetTimestampInMillisecond",
             @"parquetVersion" : @"ParquetVersion",
             @"rowGroupLength" : @"RowGroupLength",
             @"serverSideEncryptionKmsKeyId" : @"ServerSideEncryptionKmsKeyId",
             @"serviceAccessRoleArn" : @"ServiceAccessRoleArn",
             @"timestampColumnName" : @"TimestampColumnName",
             };
}

+ (NSValueTransformer *)compressionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"none"] == NSOrderedSame) {
            return @(AWSdmsCompressionTypeValueNone);
        }
        if ([value caseInsensitiveCompare:@"gzip"] == NSOrderedSame) {
            return @(AWSdmsCompressionTypeValueGzip);
        }
        return @(AWSdmsCompressionTypeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsCompressionTypeValueNone:
                return @"none";
            case AWSdmsCompressionTypeValueGzip:
                return @"gzip";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dataFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"csv"] == NSOrderedSame) {
            return @(AWSdmsDataFormatValueCsv);
        }
        if ([value caseInsensitiveCompare:@"parquet"] == NSOrderedSame) {
            return @(AWSdmsDataFormatValueParquet);
        }
        return @(AWSdmsDataFormatValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsDataFormatValueCsv:
                return @"csv";
            case AWSdmsDataFormatValueParquet:
                return @"parquet";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)encodingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"plain"] == NSOrderedSame) {
            return @(AWSdmsEncodingTypeValuePlain);
        }
        if ([value caseInsensitiveCompare:@"plain-dictionary"] == NSOrderedSame) {
            return @(AWSdmsEncodingTypeValuePlainDictionary);
        }
        if ([value caseInsensitiveCompare:@"rle-dictionary"] == NSOrderedSame) {
            return @(AWSdmsEncodingTypeValueRleDictionary);
        }
        return @(AWSdmsEncodingTypeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsEncodingTypeValuePlain:
                return @"plain";
            case AWSdmsEncodingTypeValuePlainDictionary:
                return @"plain-dictionary";
            case AWSdmsEncodingTypeValueRleDictionary:
                return @"rle-dictionary";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)encryptionModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"sse-s3"] == NSOrderedSame) {
            return @(AWSdmsEncryptionModeValueSseS3);
        }
        if ([value caseInsensitiveCompare:@"sse-kms"] == NSOrderedSame) {
            return @(AWSdmsEncryptionModeValueSseKms);
        }
        return @(AWSdmsEncryptionModeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsEncryptionModeValueSseS3:
                return @"sse-s3";
            case AWSdmsEncryptionModeValueSseKms:
                return @"sse-kms";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)parquetVersionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"parquet-1-0"] == NSOrderedSame) {
            return @(AWSdmsParquetVersionValueParquet10);
        }
        if ([value caseInsensitiveCompare:@"parquet-2-0"] == NSOrderedSame) {
            return @(AWSdmsParquetVersionValueParquet20);
        }
        return @(AWSdmsParquetVersionValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsParquetVersionValueParquet10:
                return @"parquet-1-0";
            case AWSdmsParquetVersionValueParquet20:
                return @"parquet-2-0";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdmsStartReplicationTaskAssessmentMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationTaskArn" : @"ReplicationTaskArn",
             };
}

@end

@implementation AWSdmsStartReplicationTaskAssessmentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationTask" : @"ReplicationTask",
             };
}

+ (NSValueTransformer *)replicationTaskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsReplicationTask class]];
}

@end

@implementation AWSdmsStartReplicationTaskMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cdcStartPosition" : @"CdcStartPosition",
             @"cdcStartTime" : @"CdcStartTime",
             @"cdcStopPosition" : @"CdcStopPosition",
             @"replicationTaskArn" : @"ReplicationTaskArn",
             @"startReplicationTaskType" : @"StartReplicationTaskType",
             };
}

+ (NSValueTransformer *)cdcStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startReplicationTaskTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"start-replication"] == NSOrderedSame) {
            return @(AWSdmsStartReplicationTaskTypeValueStartReplication);
        }
        if ([value caseInsensitiveCompare:@"resume-processing"] == NSOrderedSame) {
            return @(AWSdmsStartReplicationTaskTypeValueResumeProcessing);
        }
        if ([value caseInsensitiveCompare:@"reload-target"] == NSOrderedSame) {
            return @(AWSdmsStartReplicationTaskTypeValueReloadTarget);
        }
        return @(AWSdmsStartReplicationTaskTypeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsStartReplicationTaskTypeValueStartReplication:
                return @"start-replication";
            case AWSdmsStartReplicationTaskTypeValueResumeProcessing:
                return @"resume-processing";
            case AWSdmsStartReplicationTaskTypeValueReloadTarget:
                return @"reload-target";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdmsStartReplicationTaskResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationTask" : @"ReplicationTask",
             };
}

+ (NSValueTransformer *)replicationTaskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsReplicationTask class]];
}

@end

@implementation AWSdmsStopReplicationTaskMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationTaskArn" : @"ReplicationTaskArn",
             };
}

@end

@implementation AWSdmsStopReplicationTaskResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationTask" : @"ReplicationTask",
             };
}

+ (NSValueTransformer *)replicationTaskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsReplicationTask class]];
}

@end

@implementation AWSdmsSubnet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subnetAvailabilityZone" : @"SubnetAvailabilityZone",
             @"subnetIdentifier" : @"SubnetIdentifier",
             @"subnetStatus" : @"SubnetStatus",
             };
}

+ (NSValueTransformer *)subnetAvailabilityZoneJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsAvailabilityZone class]];
}

@end

@implementation AWSdmsSupportedEndpointType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointType" : @"EndpointType",
             @"engineDisplayName" : @"EngineDisplayName",
             @"engineName" : @"EngineName",
             @"replicationInstanceEngineMinimumVersion" : @"ReplicationInstanceEngineMinimumVersion",
             @"supportsCDC" : @"SupportsCDC",
             };
}

+ (NSValueTransformer *)endpointTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"source"] == NSOrderedSame) {
            return @(AWSdmsReplicationEndpointTypeValueSource);
        }
        if ([value caseInsensitiveCompare:@"target"] == NSOrderedSame) {
            return @(AWSdmsReplicationEndpointTypeValueTarget);
        }
        return @(AWSdmsReplicationEndpointTypeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSdmsReplicationEndpointTypeValueSource:
                return @"source";
            case AWSdmsReplicationEndpointTypeValueTarget:
                return @"target";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSdmsTableStatistics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ddls" : @"Ddls",
             @"deletes" : @"Deletes",
             @"fullLoadCondtnlChkFailedRows" : @"FullLoadCondtnlChkFailedRows",
             @"fullLoadEndTime" : @"FullLoadEndTime",
             @"fullLoadErrorRows" : @"FullLoadErrorRows",
             @"fullLoadReloaded" : @"FullLoadReloaded",
             @"fullLoadRows" : @"FullLoadRows",
             @"fullLoadStartTime" : @"FullLoadStartTime",
             @"inserts" : @"Inserts",
             @"lastUpdateTime" : @"LastUpdateTime",
             @"schemaName" : @"SchemaName",
             @"tableName" : @"TableName",
             @"tableState" : @"TableState",
             @"updates" : @"Updates",
             @"validationFailedRecords" : @"ValidationFailedRecords",
             @"validationPendingRecords" : @"ValidationPendingRecords",
             @"validationState" : @"ValidationState",
             @"validationStateDetails" : @"ValidationStateDetails",
             @"validationSuspendedRecords" : @"ValidationSuspendedRecords",
             };
}

+ (NSValueTransformer *)fullLoadEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)fullLoadStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSdmsTableToReload

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"schemaName" : @"SchemaName",
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSdmsTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSdmsTestConnectionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             @"replicationInstanceArn" : @"ReplicationInstanceArn",
             };
}

@end

@implementation AWSdmsTestConnectionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connection" : @"Connection",
             };
}

+ (NSValueTransformer *)connectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSdmsConnection class]];
}

@end

@implementation AWSdmsVpcSecurityGroupMembership

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             @"vpcSecurityGroupId" : @"VpcSecurityGroupId",
             };
}

@end
