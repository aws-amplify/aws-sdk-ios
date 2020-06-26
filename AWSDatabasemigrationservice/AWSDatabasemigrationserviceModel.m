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

#import "AWSDatabasemigrationserviceModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSDatabasemigrationserviceErrorDomain = @"com.amazonaws.AWSDatabasemigrationserviceErrorDomain";

@implementation AWSDatabasemigrationserviceAccountQuota

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountQuotaName" : @"AccountQuotaName",
             @"max" : @"Max",
             @"used" : @"Used",
             };
}

@end

@implementation AWSDatabasemigrationserviceAddTagsToResourceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceTag class]];
}

@end

@implementation AWSDatabasemigrationserviceAddTagsToResourceResponse

@end

@implementation AWSDatabasemigrationserviceApplyPendingMaintenanceActionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyAction" : @"ApplyAction",
             @"optInType" : @"OptInType",
             @"replicationInstanceArn" : @"ReplicationInstanceArn",
             };
}

@end

@implementation AWSDatabasemigrationserviceApplyPendingMaintenanceActionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourcePendingMaintenanceActions" : @"ResourcePendingMaintenanceActions",
             };
}

+ (NSValueTransformer *)resourcePendingMaintenanceActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceResourcePendingMaintenanceActions class]];
}

@end

@implementation AWSDatabasemigrationserviceAvailabilityZone

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSDatabasemigrationserviceCertificate

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

@implementation AWSDatabasemigrationserviceConnection

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

@implementation AWSDatabasemigrationserviceCreateEndpointMessage

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceDmsTransferSettings class]];
}

+ (NSValueTransformer *)dynamoDbSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceDynamoDbSettings class]];
}

+ (NSValueTransformer *)elasticsearchSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceElasticsearchSettings class]];
}

+ (NSValueTransformer *)endpointTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"source"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceReplicationEndpointTypeValueSource);
        }
        if ([value caseInsensitiveCompare:@"target"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceReplicationEndpointTypeValueTarget);
        }
        return @(AWSDatabasemigrationserviceReplicationEndpointTypeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceReplicationEndpointTypeValueSource:
                return @"source";
            case AWSDatabasemigrationserviceReplicationEndpointTypeValueTarget:
                return @"target";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)kafkaSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceKafkaSettings class]];
}

+ (NSValueTransformer *)kinesisSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceKinesisSettings class]];
}

+ (NSValueTransformer *)mongoDbSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceMongoDbSettings class]];
}

+ (NSValueTransformer *)neptuneSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceNeptuneSettings class]];
}

+ (NSValueTransformer *)redshiftSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceRedshiftSettings class]];
}

+ (NSValueTransformer *)s3SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceS3Settings class]];
}

+ (NSValueTransformer *)sslModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"none"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceDmsSslModeValueNone);
        }
        if ([value caseInsensitiveCompare:@"require"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceDmsSslModeValueRequire);
        }
        if ([value caseInsensitiveCompare:@"verify-ca"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceDmsSslModeValueVerifyCa);
        }
        if ([value caseInsensitiveCompare:@"verify-full"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceDmsSslModeValueVerifyFull);
        }
        return @(AWSDatabasemigrationserviceDmsSslModeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceDmsSslModeValueNone:
                return @"none";
            case AWSDatabasemigrationserviceDmsSslModeValueRequire:
                return @"require";
            case AWSDatabasemigrationserviceDmsSslModeValueVerifyCa:
                return @"verify-ca";
            case AWSDatabasemigrationserviceDmsSslModeValueVerifyFull:
                return @"verify-full";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceTag class]];
}

@end

@implementation AWSDatabasemigrationserviceCreateEndpointResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoint" : @"Endpoint",
             };
}

+ (NSValueTransformer *)endpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceEndpoint class]];
}

@end

@implementation AWSDatabasemigrationserviceCreateEventSubscriptionMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceTag class]];
}

@end

@implementation AWSDatabasemigrationserviceCreateEventSubscriptionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSubscription" : @"EventSubscription",
             };
}

+ (NSValueTransformer *)eventSubscriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceEventSubscription class]];
}

@end

@implementation AWSDatabasemigrationserviceCreateReplicationInstanceMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceTag class]];
}

@end

@implementation AWSDatabasemigrationserviceCreateReplicationInstanceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationInstance" : @"ReplicationInstance",
             };
}

+ (NSValueTransformer *)replicationInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceReplicationInstance class]];
}

@end

@implementation AWSDatabasemigrationserviceCreateReplicationSubnetGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationSubnetGroupDescription" : @"ReplicationSubnetGroupDescription",
             @"replicationSubnetGroupIdentifier" : @"ReplicationSubnetGroupIdentifier",
             @"subnetIds" : @"SubnetIds",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceTag class]];
}

@end

@implementation AWSDatabasemigrationserviceCreateReplicationSubnetGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationSubnetGroup" : @"ReplicationSubnetGroup",
             };
}

+ (NSValueTransformer *)replicationSubnetGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceReplicationSubnetGroup class]];
}

@end

@implementation AWSDatabasemigrationserviceCreateReplicationTaskMessage

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
            return @(AWSDatabasemigrationserviceMigrationTypeValueFullLoad);
        }
        if ([value caseInsensitiveCompare:@"cdc"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceMigrationTypeValueCdc);
        }
        if ([value caseInsensitiveCompare:@"full-load-and-cdc"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceMigrationTypeValueFullLoadAndCdc);
        }
        return @(AWSDatabasemigrationserviceMigrationTypeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceMigrationTypeValueFullLoad:
                return @"full-load";
            case AWSDatabasemigrationserviceMigrationTypeValueCdc:
                return @"cdc";
            case AWSDatabasemigrationserviceMigrationTypeValueFullLoadAndCdc:
                return @"full-load-and-cdc";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceTag class]];
}

@end

@implementation AWSDatabasemigrationserviceCreateReplicationTaskResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationTask" : @"ReplicationTask",
             };
}

+ (NSValueTransformer *)replicationTaskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceReplicationTask class]];
}

@end

@implementation AWSDatabasemigrationserviceDeleteCertificateMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"CertificateArn",
             };
}

@end

@implementation AWSDatabasemigrationserviceDeleteCertificateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificate" : @"Certificate",
             };
}

+ (NSValueTransformer *)certificateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceCertificate class]];
}

@end

@implementation AWSDatabasemigrationserviceDeleteConnectionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             @"replicationInstanceArn" : @"ReplicationInstanceArn",
             };
}

@end

@implementation AWSDatabasemigrationserviceDeleteConnectionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connection" : @"Connection",
             };
}

+ (NSValueTransformer *)connectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceConnection class]];
}

@end

@implementation AWSDatabasemigrationserviceDeleteEndpointMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSDatabasemigrationserviceDeleteEndpointResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoint" : @"Endpoint",
             };
}

+ (NSValueTransformer *)endpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceEndpoint class]];
}

@end

@implementation AWSDatabasemigrationserviceDeleteEventSubscriptionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subscriptionName" : @"SubscriptionName",
             };
}

@end

@implementation AWSDatabasemigrationserviceDeleteEventSubscriptionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSubscription" : @"EventSubscription",
             };
}

+ (NSValueTransformer *)eventSubscriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceEventSubscription class]];
}

@end

@implementation AWSDatabasemigrationserviceDeleteReplicationInstanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationInstanceArn" : @"ReplicationInstanceArn",
             };
}

@end

@implementation AWSDatabasemigrationserviceDeleteReplicationInstanceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationInstance" : @"ReplicationInstance",
             };
}

+ (NSValueTransformer *)replicationInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceReplicationInstance class]];
}

@end

@implementation AWSDatabasemigrationserviceDeleteReplicationSubnetGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationSubnetGroupIdentifier" : @"ReplicationSubnetGroupIdentifier",
             };
}

@end

@implementation AWSDatabasemigrationserviceDeleteReplicationSubnetGroupResponse

@end

@implementation AWSDatabasemigrationserviceDeleteReplicationTaskMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationTaskArn" : @"ReplicationTaskArn",
             };
}

@end

@implementation AWSDatabasemigrationserviceDeleteReplicationTaskResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationTask" : @"ReplicationTask",
             };
}

+ (NSValueTransformer *)replicationTaskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceReplicationTask class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeAccountAttributesMessage

@end

@implementation AWSDatabasemigrationserviceDescribeAccountAttributesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountQuotas" : @"AccountQuotas",
             @"uniqueAccountIdentifier" : @"UniqueAccountIdentifier",
             };
}

+ (NSValueTransformer *)accountQuotasJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceAccountQuota class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeCertificatesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceFilter class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeCertificatesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificates" : @"Certificates",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)certificatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceCertificate class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeConnectionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceFilter class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeConnectionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connections" : @"Connections",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)connectionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceConnection class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeEndpointTypesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceFilter class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeEndpointTypesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"supportedEndpointTypes" : @"SupportedEndpointTypes",
             };
}

+ (NSValueTransformer *)supportedEndpointTypesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceSupportedEndpointType class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeEndpointsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceFilter class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeEndpointsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoints" : @"Endpoints",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)endpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceEndpoint class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeEventCategoriesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"sourceType" : @"SourceType",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceFilter class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeEventCategoriesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventCategoryGroupList" : @"EventCategoryGroupList",
             };
}

+ (NSValueTransformer *)eventCategoryGroupListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceEventCategoryGroup class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeEventSubscriptionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"subscriptionName" : @"SubscriptionName",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceFilter class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeEventSubscriptionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSubscriptionsList" : @"EventSubscriptionsList",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)eventSubscriptionsListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceEventSubscription class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeEventsMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceFilter class]];
}

+ (NSValueTransformer *)sourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"replication-instance"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceSourceTypeReplicationInstance);
        }
        return @(AWSDatabasemigrationserviceSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceSourceTypeReplicationInstance:
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

@implementation AWSDatabasemigrationserviceDescribeEventsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"events" : @"Events",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)eventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceEvent class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

@end

@implementation AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"orderableReplicationInstances" : @"OrderableReplicationInstances",
             };
}

+ (NSValueTransformer *)orderableReplicationInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceOrderableReplicationInstance class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribePendingMaintenanceActionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"replicationInstanceArn" : @"ReplicationInstanceArn",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceFilter class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribePendingMaintenanceActionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"pendingMaintenanceActions" : @"PendingMaintenanceActions",
             };
}

+ (NSValueTransformer *)pendingMaintenanceActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceResourcePendingMaintenanceActions class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeRefreshSchemasStatusMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSDatabasemigrationserviceDescribeRefreshSchemasStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"refreshSchemasStatus" : @"RefreshSchemasStatus",
             };
}

+ (NSValueTransformer *)refreshSchemasStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceRefreshSchemasStatus class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"replicationInstanceArn" : @"ReplicationInstanceArn",
             };
}

@end

@implementation AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"replicationInstanceArn" : @"ReplicationInstanceArn",
             @"replicationInstanceTaskLogs" : @"ReplicationInstanceTaskLogs",
             };
}

+ (NSValueTransformer *)replicationInstanceTaskLogsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceReplicationInstanceTaskLog class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeReplicationInstancesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceFilter class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeReplicationInstancesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"replicationInstances" : @"ReplicationInstances",
             };
}

+ (NSValueTransformer *)replicationInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceReplicationInstance class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceFilter class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"replicationSubnetGroups" : @"ReplicationSubnetGroups",
             };
}

+ (NSValueTransformer *)replicationSubnetGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceReplicationSubnetGroup class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"replicationTaskArn" : @"ReplicationTaskArn",
             };
}

@end

@implementation AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketName" : @"BucketName",
             @"marker" : @"Marker",
             @"replicationTaskAssessmentResults" : @"ReplicationTaskAssessmentResults",
             };
}

+ (NSValueTransformer *)replicationTaskAssessmentResultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceReplicationTaskAssessmentResult class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeReplicationTasksMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"withoutSettings" : @"WithoutSettings",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceFilter class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeReplicationTasksResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"replicationTasks" : @"ReplicationTasks",
             };
}

+ (NSValueTransformer *)replicationTasksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceReplicationTask class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeSchemasMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

@end

@implementation AWSDatabasemigrationserviceDescribeSchemasResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"schemas" : @"Schemas",
             };
}

@end

@implementation AWSDatabasemigrationserviceDescribeTableStatisticsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"replicationTaskArn" : @"ReplicationTaskArn",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceFilter class]];
}

@end

@implementation AWSDatabasemigrationserviceDescribeTableStatisticsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"replicationTaskArn" : @"ReplicationTaskArn",
             @"tableStatistics" : @"TableStatistics",
             };
}

+ (NSValueTransformer *)tableStatisticsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceTableStatistics class]];
}

@end

@implementation AWSDatabasemigrationserviceDmsTransferSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketName" : @"BucketName",
             @"serviceAccessRoleArn" : @"ServiceAccessRoleArn",
             };
}

@end

@implementation AWSDatabasemigrationserviceDynamoDbSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceAccessRoleArn" : @"ServiceAccessRoleArn",
             };
}

@end

@implementation AWSDatabasemigrationserviceElasticsearchSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointUri" : @"EndpointUri",
             @"errorRetryDuration" : @"ErrorRetryDuration",
             @"fullLoadErrorPercentage" : @"FullLoadErrorPercentage",
             @"serviceAccessRoleArn" : @"ServiceAccessRoleArn",
             };
}

@end

@implementation AWSDatabasemigrationserviceEndpoint

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceDmsTransferSettings class]];
}

+ (NSValueTransformer *)dynamoDbSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceDynamoDbSettings class]];
}

+ (NSValueTransformer *)elasticsearchSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceElasticsearchSettings class]];
}

+ (NSValueTransformer *)endpointTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"source"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceReplicationEndpointTypeValueSource);
        }
        if ([value caseInsensitiveCompare:@"target"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceReplicationEndpointTypeValueTarget);
        }
        return @(AWSDatabasemigrationserviceReplicationEndpointTypeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceReplicationEndpointTypeValueSource:
                return @"source";
            case AWSDatabasemigrationserviceReplicationEndpointTypeValueTarget:
                return @"target";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)kafkaSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceKafkaSettings class]];
}

+ (NSValueTransformer *)kinesisSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceKinesisSettings class]];
}

+ (NSValueTransformer *)mongoDbSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceMongoDbSettings class]];
}

+ (NSValueTransformer *)neptuneSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceNeptuneSettings class]];
}

+ (NSValueTransformer *)redshiftSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceRedshiftSettings class]];
}

+ (NSValueTransformer *)s3SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceS3Settings class]];
}

+ (NSValueTransformer *)sslModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"none"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceDmsSslModeValueNone);
        }
        if ([value caseInsensitiveCompare:@"require"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceDmsSslModeValueRequire);
        }
        if ([value caseInsensitiveCompare:@"verify-ca"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceDmsSslModeValueVerifyCa);
        }
        if ([value caseInsensitiveCompare:@"verify-full"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceDmsSslModeValueVerifyFull);
        }
        return @(AWSDatabasemigrationserviceDmsSslModeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceDmsSslModeValueNone:
                return @"none";
            case AWSDatabasemigrationserviceDmsSslModeValueRequire:
                return @"require";
            case AWSDatabasemigrationserviceDmsSslModeValueVerifyCa:
                return @"verify-ca";
            case AWSDatabasemigrationserviceDmsSslModeValueVerifyFull:
                return @"verify-full";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDatabasemigrationserviceEvent

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
            return @(AWSDatabasemigrationserviceSourceTypeReplicationInstance);
        }
        return @(AWSDatabasemigrationserviceSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceSourceTypeReplicationInstance:
                return @"replication-instance";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDatabasemigrationserviceEventCategoryGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventCategories" : @"EventCategories",
             @"sourceType" : @"SourceType",
             };
}

@end

@implementation AWSDatabasemigrationserviceEventSubscription

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

@implementation AWSDatabasemigrationserviceFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"values" : @"Values",
             };
}

@end

@implementation AWSDatabasemigrationserviceImportCertificateMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateIdentifier" : @"CertificateIdentifier",
             @"certificatePem" : @"CertificatePem",
             @"certificateWallet" : @"CertificateWallet",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceTag class]];
}

@end

@implementation AWSDatabasemigrationserviceImportCertificateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificate" : @"Certificate",
             };
}

+ (NSValueTransformer *)certificateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceCertificate class]];
}

@end

@implementation AWSDatabasemigrationserviceKafkaSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"broker" : @"Broker",
             @"topic" : @"Topic",
             };
}

@end

@implementation AWSDatabasemigrationserviceKinesisSettings

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
            return @(AWSDatabasemigrationserviceMessageFormatValueJson);
        }
        if ([value caseInsensitiveCompare:@"json-unformatted"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceMessageFormatValueJsonUnformatted);
        }
        return @(AWSDatabasemigrationserviceMessageFormatValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceMessageFormatValueJson:
                return @"json";
            case AWSDatabasemigrationserviceMessageFormatValueJsonUnformatted:
                return @"json-unformatted";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDatabasemigrationserviceListTagsForResourceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSDatabasemigrationserviceListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagList" : @"TagList",
             };
}

+ (NSValueTransformer *)tagListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceTag class]];
}

@end

@implementation AWSDatabasemigrationserviceModifyEndpointMessage

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceDmsTransferSettings class]];
}

+ (NSValueTransformer *)dynamoDbSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceDynamoDbSettings class]];
}

+ (NSValueTransformer *)elasticsearchSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceElasticsearchSettings class]];
}

+ (NSValueTransformer *)endpointTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"source"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceReplicationEndpointTypeValueSource);
        }
        if ([value caseInsensitiveCompare:@"target"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceReplicationEndpointTypeValueTarget);
        }
        return @(AWSDatabasemigrationserviceReplicationEndpointTypeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceReplicationEndpointTypeValueSource:
                return @"source";
            case AWSDatabasemigrationserviceReplicationEndpointTypeValueTarget:
                return @"target";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)kafkaSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceKafkaSettings class]];
}

+ (NSValueTransformer *)kinesisSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceKinesisSettings class]];
}

+ (NSValueTransformer *)mongoDbSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceMongoDbSettings class]];
}

+ (NSValueTransformer *)neptuneSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceNeptuneSettings class]];
}

+ (NSValueTransformer *)redshiftSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceRedshiftSettings class]];
}

+ (NSValueTransformer *)s3SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceS3Settings class]];
}

+ (NSValueTransformer *)sslModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"none"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceDmsSslModeValueNone);
        }
        if ([value caseInsensitiveCompare:@"require"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceDmsSslModeValueRequire);
        }
        if ([value caseInsensitiveCompare:@"verify-ca"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceDmsSslModeValueVerifyCa);
        }
        if ([value caseInsensitiveCompare:@"verify-full"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceDmsSslModeValueVerifyFull);
        }
        return @(AWSDatabasemigrationserviceDmsSslModeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceDmsSslModeValueNone:
                return @"none";
            case AWSDatabasemigrationserviceDmsSslModeValueRequire:
                return @"require";
            case AWSDatabasemigrationserviceDmsSslModeValueVerifyCa:
                return @"verify-ca";
            case AWSDatabasemigrationserviceDmsSslModeValueVerifyFull:
                return @"verify-full";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDatabasemigrationserviceModifyEndpointResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoint" : @"Endpoint",
             };
}

+ (NSValueTransformer *)endpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceEndpoint class]];
}

@end

@implementation AWSDatabasemigrationserviceModifyEventSubscriptionMessage

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

@implementation AWSDatabasemigrationserviceModifyEventSubscriptionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSubscription" : @"EventSubscription",
             };
}

+ (NSValueTransformer *)eventSubscriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceEventSubscription class]];
}

@end

@implementation AWSDatabasemigrationserviceModifyReplicationInstanceMessage

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

@implementation AWSDatabasemigrationserviceModifyReplicationInstanceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationInstance" : @"ReplicationInstance",
             };
}

+ (NSValueTransformer *)replicationInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceReplicationInstance class]];
}

@end

@implementation AWSDatabasemigrationserviceModifyReplicationSubnetGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationSubnetGroupDescription" : @"ReplicationSubnetGroupDescription",
             @"replicationSubnetGroupIdentifier" : @"ReplicationSubnetGroupIdentifier",
             @"subnetIds" : @"SubnetIds",
             };
}

@end

@implementation AWSDatabasemigrationserviceModifyReplicationSubnetGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationSubnetGroup" : @"ReplicationSubnetGroup",
             };
}

+ (NSValueTransformer *)replicationSubnetGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceReplicationSubnetGroup class]];
}

@end

@implementation AWSDatabasemigrationserviceModifyReplicationTaskMessage

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
            return @(AWSDatabasemigrationserviceMigrationTypeValueFullLoad);
        }
        if ([value caseInsensitiveCompare:@"cdc"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceMigrationTypeValueCdc);
        }
        if ([value caseInsensitiveCompare:@"full-load-and-cdc"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceMigrationTypeValueFullLoadAndCdc);
        }
        return @(AWSDatabasemigrationserviceMigrationTypeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceMigrationTypeValueFullLoad:
                return @"full-load";
            case AWSDatabasemigrationserviceMigrationTypeValueCdc:
                return @"cdc";
            case AWSDatabasemigrationserviceMigrationTypeValueFullLoadAndCdc:
                return @"full-load-and-cdc";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDatabasemigrationserviceModifyReplicationTaskResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationTask" : @"ReplicationTask",
             };
}

+ (NSValueTransformer *)replicationTaskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceReplicationTask class]];
}

@end

@implementation AWSDatabasemigrationserviceMongoDbSettings

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
            return @(AWSDatabasemigrationserviceAuthMechanismValueDefault);
        }
        if ([value caseInsensitiveCompare:@"mongodb_cr"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceAuthMechanismValueMongodbCr);
        }
        if ([value caseInsensitiveCompare:@"scram_sha_1"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceAuthMechanismValueScramSha1);
        }
        return @(AWSDatabasemigrationserviceAuthMechanismValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceAuthMechanismValueDefault:
                return @"default";
            case AWSDatabasemigrationserviceAuthMechanismValueMongodbCr:
                return @"mongodb_cr";
            case AWSDatabasemigrationserviceAuthMechanismValueScramSha1:
                return @"scram_sha_1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)authTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"no"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceAuthTypeValueNo);
        }
        if ([value caseInsensitiveCompare:@"password"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceAuthTypeValuePassword);
        }
        return @(AWSDatabasemigrationserviceAuthTypeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceAuthTypeValueNo:
                return @"no";
            case AWSDatabasemigrationserviceAuthTypeValuePassword:
                return @"password";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)nestingLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"none"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceNestingLevelValueNone);
        }
        if ([value caseInsensitiveCompare:@"one"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceNestingLevelValueOne);
        }
        return @(AWSDatabasemigrationserviceNestingLevelValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceNestingLevelValueNone:
                return @"none";
            case AWSDatabasemigrationserviceNestingLevelValueOne:
                return @"one";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDatabasemigrationserviceNeptuneSettings

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

@implementation AWSDatabasemigrationserviceOrderableReplicationInstance

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
            return @(AWSDatabasemigrationserviceReleaseStatusValuesBeta);
        }
        return @(AWSDatabasemigrationserviceReleaseStatusValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceReleaseStatusValuesBeta:
                return @"beta";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDatabasemigrationservicePendingMaintenanceAction

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

@implementation AWSDatabasemigrationserviceRebootReplicationInstanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"forceFailover" : @"ForceFailover",
             @"replicationInstanceArn" : @"ReplicationInstanceArn",
             };
}

@end

@implementation AWSDatabasemigrationserviceRebootReplicationInstanceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationInstance" : @"ReplicationInstance",
             };
}

+ (NSValueTransformer *)replicationInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceReplicationInstance class]];
}

@end

@implementation AWSDatabasemigrationserviceRedshiftSettings

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
            return @(AWSDatabasemigrationserviceEncryptionModeValueSseS3);
        }
        if ([value caseInsensitiveCompare:@"sse-kms"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceEncryptionModeValueSseKms);
        }
        return @(AWSDatabasemigrationserviceEncryptionModeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceEncryptionModeValueSseS3:
                return @"sse-s3";
            case AWSDatabasemigrationserviceEncryptionModeValueSseKms:
                return @"sse-kms";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDatabasemigrationserviceRefreshSchemasMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             @"replicationInstanceArn" : @"ReplicationInstanceArn",
             };
}

@end

@implementation AWSDatabasemigrationserviceRefreshSchemasResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"refreshSchemasStatus" : @"RefreshSchemasStatus",
             };
}

+ (NSValueTransformer *)refreshSchemasStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceRefreshSchemasStatus class]];
}

@end

@implementation AWSDatabasemigrationserviceRefreshSchemasStatus

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
            return @(AWSDatabasemigrationserviceRefreshSchemasStatusTypeValueSuccessful);
        }
        if ([value caseInsensitiveCompare:@"failed"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceRefreshSchemasStatusTypeValueFailed);
        }
        if ([value caseInsensitiveCompare:@"refreshing"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceRefreshSchemasStatusTypeValueRefreshing);
        }
        return @(AWSDatabasemigrationserviceRefreshSchemasStatusTypeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceRefreshSchemasStatusTypeValueSuccessful:
                return @"successful";
            case AWSDatabasemigrationserviceRefreshSchemasStatusTypeValueFailed:
                return @"failed";
            case AWSDatabasemigrationserviceRefreshSchemasStatusTypeValueRefreshing:
                return @"refreshing";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDatabasemigrationserviceReloadTablesMessage

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
            return @(AWSDatabasemigrationserviceReloadOptionValueDataReload);
        }
        if ([value caseInsensitiveCompare:@"validate-only"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceReloadOptionValueValidateOnly);
        }
        return @(AWSDatabasemigrationserviceReloadOptionValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceReloadOptionValueDataReload:
                return @"data-reload";
            case AWSDatabasemigrationserviceReloadOptionValueValidateOnly:
                return @"validate-only";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tablesToReloadJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceTableToReload class]];
}

@end

@implementation AWSDatabasemigrationserviceReloadTablesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationTaskArn" : @"ReplicationTaskArn",
             };
}

@end

@implementation AWSDatabasemigrationserviceRemoveTagsFromResourceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSDatabasemigrationserviceRemoveTagsFromResourceResponse

@end

@implementation AWSDatabasemigrationserviceReplicationInstance

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceReplicationPendingModifiedValues class]];
}

+ (NSValueTransformer *)replicationSubnetGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceReplicationSubnetGroup class]];
}

+ (NSValueTransformer *)vpcSecurityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceVpcSecurityGroupMembership class]];
}

@end

@implementation AWSDatabasemigrationserviceReplicationInstanceTaskLog

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationInstanceTaskLogSize" : @"ReplicationInstanceTaskLogSize",
             @"replicationTaskArn" : @"ReplicationTaskArn",
             @"replicationTaskName" : @"ReplicationTaskName",
             };
}

@end

@implementation AWSDatabasemigrationserviceReplicationPendingModifiedValues

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocatedStorage" : @"AllocatedStorage",
             @"engineVersion" : @"EngineVersion",
             @"multiAZ" : @"MultiAZ",
             @"replicationInstanceClass" : @"ReplicationInstanceClass",
             };
}

@end

@implementation AWSDatabasemigrationserviceReplicationSubnetGroup

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationserviceSubnet class]];
}

@end

@implementation AWSDatabasemigrationserviceReplicationTask

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
            return @(AWSDatabasemigrationserviceMigrationTypeValueFullLoad);
        }
        if ([value caseInsensitiveCompare:@"cdc"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceMigrationTypeValueCdc);
        }
        if ([value caseInsensitiveCompare:@"full-load-and-cdc"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceMigrationTypeValueFullLoadAndCdc);
        }
        return @(AWSDatabasemigrationserviceMigrationTypeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceMigrationTypeValueFullLoad:
                return @"full-load";
            case AWSDatabasemigrationserviceMigrationTypeValueCdc:
                return @"cdc";
            case AWSDatabasemigrationserviceMigrationTypeValueFullLoadAndCdc:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceReplicationTaskStats class]];
}

@end

@implementation AWSDatabasemigrationserviceReplicationTaskAssessmentResult

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

@implementation AWSDatabasemigrationserviceReplicationTaskStats

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

@implementation AWSDatabasemigrationserviceResourcePendingMaintenanceActions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pendingMaintenanceActionDetails" : @"PendingMaintenanceActionDetails",
             @"resourceIdentifier" : @"ResourceIdentifier",
             };
}

+ (NSValueTransformer *)pendingMaintenanceActionDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDatabasemigrationservicePendingMaintenanceAction class]];
}

@end

@implementation AWSDatabasemigrationserviceS3Settings

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
            return @(AWSDatabasemigrationserviceCompressionTypeValueNone);
        }
        if ([value caseInsensitiveCompare:@"gzip"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceCompressionTypeValueGzip);
        }
        return @(AWSDatabasemigrationserviceCompressionTypeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceCompressionTypeValueNone:
                return @"none";
            case AWSDatabasemigrationserviceCompressionTypeValueGzip:
                return @"gzip";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dataFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"csv"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceDataFormatValueCsv);
        }
        if ([value caseInsensitiveCompare:@"parquet"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceDataFormatValueParquet);
        }
        return @(AWSDatabasemigrationserviceDataFormatValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceDataFormatValueCsv:
                return @"csv";
            case AWSDatabasemigrationserviceDataFormatValueParquet:
                return @"parquet";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)encodingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"plain"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceEncodingTypeValuePlain);
        }
        if ([value caseInsensitiveCompare:@"plain-dictionary"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceEncodingTypeValuePlainDictionary);
        }
        if ([value caseInsensitiveCompare:@"rle-dictionary"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceEncodingTypeValueRleDictionary);
        }
        return @(AWSDatabasemigrationserviceEncodingTypeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceEncodingTypeValuePlain:
                return @"plain";
            case AWSDatabasemigrationserviceEncodingTypeValuePlainDictionary:
                return @"plain-dictionary";
            case AWSDatabasemigrationserviceEncodingTypeValueRleDictionary:
                return @"rle-dictionary";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)encryptionModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"sse-s3"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceEncryptionModeValueSseS3);
        }
        if ([value caseInsensitiveCompare:@"sse-kms"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceEncryptionModeValueSseKms);
        }
        return @(AWSDatabasemigrationserviceEncryptionModeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceEncryptionModeValueSseS3:
                return @"sse-s3";
            case AWSDatabasemigrationserviceEncryptionModeValueSseKms:
                return @"sse-kms";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)parquetVersionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"parquet-1-0"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceParquetVersionValueParquet10);
        }
        if ([value caseInsensitiveCompare:@"parquet-2-0"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceParquetVersionValueParquet20);
        }
        return @(AWSDatabasemigrationserviceParquetVersionValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceParquetVersionValueParquet10:
                return @"parquet-1-0";
            case AWSDatabasemigrationserviceParquetVersionValueParquet20:
                return @"parquet-2-0";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDatabasemigrationserviceStartReplicationTaskAssessmentMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationTaskArn" : @"ReplicationTaskArn",
             };
}

@end

@implementation AWSDatabasemigrationserviceStartReplicationTaskAssessmentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationTask" : @"ReplicationTask",
             };
}

+ (NSValueTransformer *)replicationTaskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceReplicationTask class]];
}

@end

@implementation AWSDatabasemigrationserviceStartReplicationTaskMessage

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
            return @(AWSDatabasemigrationserviceStartReplicationTaskTypeValueStartReplication);
        }
        if ([value caseInsensitiveCompare:@"resume-processing"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceStartReplicationTaskTypeValueResumeProcessing);
        }
        if ([value caseInsensitiveCompare:@"reload-target"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceStartReplicationTaskTypeValueReloadTarget);
        }
        return @(AWSDatabasemigrationserviceStartReplicationTaskTypeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceStartReplicationTaskTypeValueStartReplication:
                return @"start-replication";
            case AWSDatabasemigrationserviceStartReplicationTaskTypeValueResumeProcessing:
                return @"resume-processing";
            case AWSDatabasemigrationserviceStartReplicationTaskTypeValueReloadTarget:
                return @"reload-target";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDatabasemigrationserviceStartReplicationTaskResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationTask" : @"ReplicationTask",
             };
}

+ (NSValueTransformer *)replicationTaskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceReplicationTask class]];
}

@end

@implementation AWSDatabasemigrationserviceStopReplicationTaskMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationTaskArn" : @"ReplicationTaskArn",
             };
}

@end

@implementation AWSDatabasemigrationserviceStopReplicationTaskResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationTask" : @"ReplicationTask",
             };
}

+ (NSValueTransformer *)replicationTaskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceReplicationTask class]];
}

@end

@implementation AWSDatabasemigrationserviceSubnet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subnetAvailabilityZone" : @"SubnetAvailabilityZone",
             @"subnetIdentifier" : @"SubnetIdentifier",
             @"subnetStatus" : @"SubnetStatus",
             };
}

+ (NSValueTransformer *)subnetAvailabilityZoneJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceAvailabilityZone class]];
}

@end

@implementation AWSDatabasemigrationserviceSupportedEndpointType

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
            return @(AWSDatabasemigrationserviceReplicationEndpointTypeValueSource);
        }
        if ([value caseInsensitiveCompare:@"target"] == NSOrderedSame) {
            return @(AWSDatabasemigrationserviceReplicationEndpointTypeValueTarget);
        }
        return @(AWSDatabasemigrationserviceReplicationEndpointTypeValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDatabasemigrationserviceReplicationEndpointTypeValueSource:
                return @"source";
            case AWSDatabasemigrationserviceReplicationEndpointTypeValueTarget:
                return @"target";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDatabasemigrationserviceTableStatistics

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

@implementation AWSDatabasemigrationserviceTableToReload

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"schemaName" : @"SchemaName",
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSDatabasemigrationserviceTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSDatabasemigrationserviceTestConnectionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             @"replicationInstanceArn" : @"ReplicationInstanceArn",
             };
}

@end

@implementation AWSDatabasemigrationserviceTestConnectionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connection" : @"Connection",
             };
}

+ (NSValueTransformer *)connectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDatabasemigrationserviceConnection class]];
}

@end

@implementation AWSDatabasemigrationserviceVpcSecurityGroupMembership

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             @"vpcSecurityGroupId" : @"VpcSecurityGroupId",
             };
}

@end
