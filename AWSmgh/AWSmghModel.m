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

#import "AWSmghModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSmghErrorDomain = @"com.amazonaws.AWSmghErrorDomain";

@implementation AWSmghApplicationState

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"applicationStatus" : @"ApplicationStatus",
             @"lastUpdatedTime" : @"LastUpdatedTime",
             };
}

+ (NSValueTransformer *)applicationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_STARTED"] == NSOrderedSame) {
            return @(AWSmghApplicationStatusNotStarted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSmghApplicationStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSmghApplicationStatusCompleted);
        }
        return @(AWSmghApplicationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmghApplicationStatusNotStarted:
                return @"NOT_STARTED";
            case AWSmghApplicationStatusInProgress:
                return @"IN_PROGRESS";
            case AWSmghApplicationStatusCompleted:
                return @"COMPLETED";
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

@end

@implementation AWSmghAssociateCreatedArtifactRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdArtifact" : @"CreatedArtifact",
             @"dryRun" : @"DryRun",
             @"migrationTaskName" : @"MigrationTaskName",
             @"progressUpdateStream" : @"ProgressUpdateStream",
             };
}

+ (NSValueTransformer *)createdArtifactJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmghCreatedArtifact class]];
}

@end

@implementation AWSmghAssociateCreatedArtifactResult

@end

@implementation AWSmghAssociateDiscoveredResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"discoveredResource" : @"DiscoveredResource",
             @"dryRun" : @"DryRun",
             @"migrationTaskName" : @"MigrationTaskName",
             @"progressUpdateStream" : @"ProgressUpdateStream",
             };
}

+ (NSValueTransformer *)discoveredResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmghDiscoveredResource class]];
}

@end

@implementation AWSmghAssociateDiscoveredResourceResult

@end

@implementation AWSmghCreateProgressUpdateStreamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"progressUpdateStreamName" : @"ProgressUpdateStreamName",
             };
}

@end

@implementation AWSmghCreateProgressUpdateStreamResult

@end

@implementation AWSmghCreatedArtifact

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"name" : @"Name",
             };
}

@end

@implementation AWSmghDeleteProgressUpdateStreamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"progressUpdateStreamName" : @"ProgressUpdateStreamName",
             };
}

@end

@implementation AWSmghDeleteProgressUpdateStreamResult

@end

@implementation AWSmghDescribeApplicationStateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSmghDescribeApplicationStateResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationStatus" : @"ApplicationStatus",
             @"lastUpdatedTime" : @"LastUpdatedTime",
             };
}

+ (NSValueTransformer *)applicationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_STARTED"] == NSOrderedSame) {
            return @(AWSmghApplicationStatusNotStarted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSmghApplicationStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSmghApplicationStatusCompleted);
        }
        return @(AWSmghApplicationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmghApplicationStatusNotStarted:
                return @"NOT_STARTED";
            case AWSmghApplicationStatusInProgress:
                return @"IN_PROGRESS";
            case AWSmghApplicationStatusCompleted:
                return @"COMPLETED";
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

@end

@implementation AWSmghDescribeMigrationTaskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"migrationTaskName" : @"MigrationTaskName",
             @"progressUpdateStream" : @"ProgressUpdateStream",
             };
}

@end

@implementation AWSmghDescribeMigrationTaskResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"migrationTask" : @"MigrationTask",
             };
}

+ (NSValueTransformer *)migrationTaskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmghMigrationTask class]];
}

@end

@implementation AWSmghDisassociateCreatedArtifactRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdArtifactName" : @"CreatedArtifactName",
             @"dryRun" : @"DryRun",
             @"migrationTaskName" : @"MigrationTaskName",
             @"progressUpdateStream" : @"ProgressUpdateStream",
             };
}

@end

@implementation AWSmghDisassociateCreatedArtifactResult

@end

@implementation AWSmghDisassociateDiscoveredResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationId" : @"ConfigurationId",
             @"dryRun" : @"DryRun",
             @"migrationTaskName" : @"MigrationTaskName",
             @"progressUpdateStream" : @"ProgressUpdateStream",
             };
}

@end

@implementation AWSmghDisassociateDiscoveredResourceResult

@end

@implementation AWSmghDiscoveredResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationId" : @"ConfigurationId",
             @"detail" : @"Description",
             };
}

@end

@implementation AWSmghImportMigrationTaskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"migrationTaskName" : @"MigrationTaskName",
             @"progressUpdateStream" : @"ProgressUpdateStream",
             };
}

@end

@implementation AWSmghImportMigrationTaskResult

@end

@implementation AWSmghListApplicationStatesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationIds" : @"ApplicationIds",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSmghListApplicationStatesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationStateList" : @"ApplicationStateList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)applicationStateListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmghApplicationState class]];
}

@end

@implementation AWSmghListCreatedArtifactsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"migrationTaskName" : @"MigrationTaskName",
             @"nextToken" : @"NextToken",
             @"progressUpdateStream" : @"ProgressUpdateStream",
             };
}

@end

@implementation AWSmghListCreatedArtifactsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdArtifactList" : @"CreatedArtifactList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)createdArtifactListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmghCreatedArtifact class]];
}

@end

@implementation AWSmghListDiscoveredResourcesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"migrationTaskName" : @"MigrationTaskName",
             @"nextToken" : @"NextToken",
             @"progressUpdateStream" : @"ProgressUpdateStream",
             };
}

@end

@implementation AWSmghListDiscoveredResourcesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"discoveredResourceList" : @"DiscoveredResourceList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)discoveredResourceListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmghDiscoveredResource class]];
}

@end

@implementation AWSmghListMigrationTasksRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"resourceName" : @"ResourceName",
             };
}

@end

@implementation AWSmghListMigrationTasksResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"migrationTaskSummaryList" : @"MigrationTaskSummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)migrationTaskSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmghMigrationTaskSummary class]];
}

@end

@implementation AWSmghListProgressUpdateStreamsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSmghListProgressUpdateStreamsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"progressUpdateStreamSummaryList" : @"ProgressUpdateStreamSummaryList",
             };
}

+ (NSValueTransformer *)progressUpdateStreamSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmghProgressUpdateStreamSummary class]];
}

@end

@implementation AWSmghMigrationTask

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"migrationTaskName" : @"MigrationTaskName",
             @"progressUpdateStream" : @"ProgressUpdateStream",
             @"resourceAttributeList" : @"ResourceAttributeList",
             @"task" : @"Task",
             @"updateDateTime" : @"UpdateDateTime",
             };
}

+ (NSValueTransformer *)resourceAttributeListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmghResourceAttribute class]];
}

+ (NSValueTransformer *)taskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmghTask class]];
}

+ (NSValueTransformer *)updateDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSmghMigrationTaskSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"migrationTaskName" : @"MigrationTaskName",
             @"progressPercent" : @"ProgressPercent",
             @"progressUpdateStream" : @"ProgressUpdateStream",
             @"status" : @"Status",
             @"statusDetail" : @"StatusDetail",
             @"updateDateTime" : @"UpdateDateTime",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_STARTED"] == NSOrderedSame) {
            return @(AWSmghStatusNotStarted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSmghStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSmghStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSmghStatusCompleted);
        }
        return @(AWSmghStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmghStatusNotStarted:
                return @"NOT_STARTED";
            case AWSmghStatusInProgress:
                return @"IN_PROGRESS";
            case AWSmghStatusFailed:
                return @"FAILED";
            case AWSmghStatusCompleted:
                return @"COMPLETED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)updateDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSmghNotifyApplicationStateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"dryRun" : @"DryRun",
             @"status" : @"Status",
             @"updateDateTime" : @"UpdateDateTime",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_STARTED"] == NSOrderedSame) {
            return @(AWSmghApplicationStatusNotStarted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSmghApplicationStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSmghApplicationStatusCompleted);
        }
        return @(AWSmghApplicationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmghApplicationStatusNotStarted:
                return @"NOT_STARTED";
            case AWSmghApplicationStatusInProgress:
                return @"IN_PROGRESS";
            case AWSmghApplicationStatusCompleted:
                return @"COMPLETED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)updateDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSmghNotifyApplicationStateResult

@end

@implementation AWSmghNotifyMigrationTaskStateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"migrationTaskName" : @"MigrationTaskName",
             @"nextUpdateSeconds" : @"NextUpdateSeconds",
             @"progressUpdateStream" : @"ProgressUpdateStream",
             @"task" : @"Task",
             @"updateDateTime" : @"UpdateDateTime",
             };
}

+ (NSValueTransformer *)taskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmghTask class]];
}

+ (NSValueTransformer *)updateDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSmghNotifyMigrationTaskStateResult

@end

@implementation AWSmghProgressUpdateStreamSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"progressUpdateStreamName" : @"ProgressUpdateStreamName",
             };
}

@end

@implementation AWSmghPutResourceAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"migrationTaskName" : @"MigrationTaskName",
             @"progressUpdateStream" : @"ProgressUpdateStream",
             @"resourceAttributeList" : @"ResourceAttributeList",
             };
}

+ (NSValueTransformer *)resourceAttributeListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmghResourceAttribute class]];
}

@end

@implementation AWSmghPutResourceAttributesResult

@end

@implementation AWSmghResourceAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IPV4_ADDRESS"] == NSOrderedSame) {
            return @(AWSmghResourceAttributeTypeIpv4Address);
        }
        if ([value caseInsensitiveCompare:@"IPV6_ADDRESS"] == NSOrderedSame) {
            return @(AWSmghResourceAttributeTypeIpv6Address);
        }
        if ([value caseInsensitiveCompare:@"MAC_ADDRESS"] == NSOrderedSame) {
            return @(AWSmghResourceAttributeTypeMacAddress);
        }
        if ([value caseInsensitiveCompare:@"FQDN"] == NSOrderedSame) {
            return @(AWSmghResourceAttributeTypeFqdn);
        }
        if ([value caseInsensitiveCompare:@"VM_MANAGER_ID"] == NSOrderedSame) {
            return @(AWSmghResourceAttributeTypeVmManagerId);
        }
        if ([value caseInsensitiveCompare:@"VM_MANAGED_OBJECT_REFERENCE"] == NSOrderedSame) {
            return @(AWSmghResourceAttributeTypeVmManagedObjectReference);
        }
        if ([value caseInsensitiveCompare:@"VM_NAME"] == NSOrderedSame) {
            return @(AWSmghResourceAttributeTypeVmName);
        }
        if ([value caseInsensitiveCompare:@"VM_PATH"] == NSOrderedSame) {
            return @(AWSmghResourceAttributeTypeVmPath);
        }
        if ([value caseInsensitiveCompare:@"BIOS_ID"] == NSOrderedSame) {
            return @(AWSmghResourceAttributeTypeBiosId);
        }
        if ([value caseInsensitiveCompare:@"MOTHERBOARD_SERIAL_NUMBER"] == NSOrderedSame) {
            return @(AWSmghResourceAttributeTypeMotherboardSerialNumber);
        }
        return @(AWSmghResourceAttributeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmghResourceAttributeTypeIpv4Address:
                return @"IPV4_ADDRESS";
            case AWSmghResourceAttributeTypeIpv6Address:
                return @"IPV6_ADDRESS";
            case AWSmghResourceAttributeTypeMacAddress:
                return @"MAC_ADDRESS";
            case AWSmghResourceAttributeTypeFqdn:
                return @"FQDN";
            case AWSmghResourceAttributeTypeVmManagerId:
                return @"VM_MANAGER_ID";
            case AWSmghResourceAttributeTypeVmManagedObjectReference:
                return @"VM_MANAGED_OBJECT_REFERENCE";
            case AWSmghResourceAttributeTypeVmName:
                return @"VM_NAME";
            case AWSmghResourceAttributeTypeVmPath:
                return @"VM_PATH";
            case AWSmghResourceAttributeTypeBiosId:
                return @"BIOS_ID";
            case AWSmghResourceAttributeTypeMotherboardSerialNumber:
                return @"MOTHERBOARD_SERIAL_NUMBER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmghTask

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"progressPercent" : @"ProgressPercent",
             @"status" : @"Status",
             @"statusDetail" : @"StatusDetail",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_STARTED"] == NSOrderedSame) {
            return @(AWSmghStatusNotStarted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSmghStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSmghStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSmghStatusCompleted);
        }
        return @(AWSmghStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmghStatusNotStarted:
                return @"NOT_STARTED";
            case AWSmghStatusInProgress:
                return @"IN_PROGRESS";
            case AWSmghStatusFailed:
                return @"FAILED";
            case AWSmghStatusCompleted:
                return @"COMPLETED";
            default:
                return nil;
        }
    }];
}

@end
