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

#import "AWSschemasModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSschemasErrorDomain = @"com.amazonaws.AWSschemasErrorDomain";

@implementation AWSschemasCodeBindingOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"CreationDate",
             @"lastModified" : @"LastModified",
             @"schemaVersion" : @"SchemaVersion",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSschemasCodeGenerationStatusCreateInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATE_COMPLETE"] == NSOrderedSame) {
            return @(AWSschemasCodeGenerationStatusCreateComplete);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSschemasCodeGenerationStatusCreateFailed);
        }
        return @(AWSschemasCodeGenerationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSschemasCodeGenerationStatusCreateInProgress:
                return @"CREATE_IN_PROGRESS";
            case AWSschemasCodeGenerationStatusCreateComplete:
                return @"CREATE_COMPLETE";
            case AWSschemasCodeGenerationStatusCreateFailed:
                return @"CREATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSschemasCreateDiscovererInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"sourceArn" : @"SourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSschemasCreateDiscovererRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"sourceArn" : @"SourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSschemasCreateDiscovererResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"discovererArn" : @"DiscovererArn",
             @"discovererId" : @"DiscovererId",
             @"sourceArn" : @"SourceArn",
             @"state" : @"State",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STARTED"] == NSOrderedSame) {
            return @(AWSschemasDiscovererStateStarted);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSschemasDiscovererStateStopped);
        }
        return @(AWSschemasDiscovererStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSschemasDiscovererStateStarted:
                return @"STARTED";
            case AWSschemasDiscovererStateStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSschemasCreateRegistryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSschemasCreateRegistryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"registryName" : @"RegistryName",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSschemasCreateRegistryResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"registryArn" : @"RegistryArn",
             @"registryName" : @"RegistryName",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSschemasCreateSchemaInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             @"detail" : @"Description",
             @"tags" : @"Tags",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OpenApi3"] == NSOrderedSame) {
            return @(AWSschemasTypesOpenApi3);
        }
        return @(AWSschemasTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSschemasTypesOpenApi3:
                return @"OpenApi3";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSschemasCreateSchemaRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             @"detail" : @"Description",
             @"registryName" : @"RegistryName",
             @"schemaName" : @"SchemaName",
             @"tags" : @"Tags",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OpenApi3"] == NSOrderedSame) {
            return @(AWSschemasTypesOpenApi3);
        }
        return @(AWSschemasTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSschemasTypesOpenApi3:
                return @"OpenApi3";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSschemasCreateSchemaResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"lastModified" : @"LastModified",
             @"schemaArn" : @"SchemaArn",
             @"schemaName" : @"SchemaName",
             @"schemaVersion" : @"SchemaVersion",
             @"tags" : @"Tags",
             @"types" : @"Type",
             @"versionCreatedDate" : @"VersionCreatedDate",
             };
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)versionCreatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSschemasDeleteDiscovererRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"discovererId" : @"DiscovererId",
             };
}

@end

@implementation AWSschemasDeleteRegistryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registryName" : @"RegistryName",
             };
}

@end

@implementation AWSschemasDeleteResourcePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registryName" : @"RegistryName",
             };
}

@end

@implementation AWSschemasDeleteSchemaRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registryName" : @"RegistryName",
             @"schemaName" : @"SchemaName",
             };
}

@end

@implementation AWSschemasDeleteSchemaVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registryName" : @"RegistryName",
             @"schemaName" : @"SchemaName",
             @"schemaVersion" : @"SchemaVersion",
             };
}

@end

@implementation AWSschemasDescribeCodeBindingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"language" : @"Language",
             @"registryName" : @"RegistryName",
             @"schemaName" : @"SchemaName",
             @"schemaVersion" : @"SchemaVersion",
             };
}

@end

@implementation AWSschemasDescribeCodeBindingResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"CreationDate",
             @"lastModified" : @"LastModified",
             @"schemaVersion" : @"SchemaVersion",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSschemasCodeGenerationStatusCreateInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATE_COMPLETE"] == NSOrderedSame) {
            return @(AWSschemasCodeGenerationStatusCreateComplete);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSschemasCodeGenerationStatusCreateFailed);
        }
        return @(AWSschemasCodeGenerationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSschemasCodeGenerationStatusCreateInProgress:
                return @"CREATE_IN_PROGRESS";
            case AWSschemasCodeGenerationStatusCreateComplete:
                return @"CREATE_COMPLETE";
            case AWSschemasCodeGenerationStatusCreateFailed:
                return @"CREATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSschemasDescribeDiscovererRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"discovererId" : @"DiscovererId",
             };
}

@end

@implementation AWSschemasDescribeDiscovererResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"discovererArn" : @"DiscovererArn",
             @"discovererId" : @"DiscovererId",
             @"sourceArn" : @"SourceArn",
             @"state" : @"State",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STARTED"] == NSOrderedSame) {
            return @(AWSschemasDiscovererStateStarted);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSschemasDiscovererStateStopped);
        }
        return @(AWSschemasDiscovererStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSschemasDiscovererStateStarted:
                return @"STARTED";
            case AWSschemasDiscovererStateStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSschemasDescribeRegistryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registryName" : @"RegistryName",
             };
}

@end

@implementation AWSschemasDescribeRegistryResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"registryArn" : @"RegistryArn",
             @"registryName" : @"RegistryName",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSschemasDescribeSchemaOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             @"detail" : @"Description",
             @"lastModified" : @"LastModified",
             @"schemaArn" : @"SchemaArn",
             @"schemaName" : @"SchemaName",
             @"schemaVersion" : @"SchemaVersion",
             @"tags" : @"Tags",
             @"types" : @"Type",
             @"versionCreatedDate" : @"VersionCreatedDate",
             };
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)versionCreatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSschemasDescribeSchemaRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registryName" : @"RegistryName",
             @"schemaName" : @"SchemaName",
             @"schemaVersion" : @"SchemaVersion",
             };
}

@end

@implementation AWSschemasDescribeSchemaResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             @"detail" : @"Description",
             @"lastModified" : @"LastModified",
             @"schemaArn" : @"SchemaArn",
             @"schemaName" : @"SchemaName",
             @"schemaVersion" : @"SchemaVersion",
             @"tags" : @"Tags",
             @"types" : @"Type",
             @"versionCreatedDate" : @"VersionCreatedDate",
             };
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)versionCreatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSschemasDiscovererOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"discovererArn" : @"DiscovererArn",
             @"discovererId" : @"DiscovererId",
             @"sourceArn" : @"SourceArn",
             @"state" : @"State",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STARTED"] == NSOrderedSame) {
            return @(AWSschemasDiscovererStateStarted);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSschemasDiscovererStateStopped);
        }
        return @(AWSschemasDiscovererStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSschemasDiscovererStateStarted:
                return @"STARTED";
            case AWSschemasDiscovererStateStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSschemasDiscovererStateOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"discovererId" : @"DiscovererId",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STARTED"] == NSOrderedSame) {
            return @(AWSschemasDiscovererStateStarted);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSschemasDiscovererStateStopped);
        }
        return @(AWSschemasDiscovererStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSschemasDiscovererStateStarted:
                return @"STARTED";
            case AWSschemasDiscovererStateStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSschemasDiscovererSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"discovererArn" : @"DiscovererArn",
             @"discovererId" : @"DiscovererId",
             @"sourceArn" : @"SourceArn",
             @"state" : @"State",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STARTED"] == NSOrderedSame) {
            return @(AWSschemasDiscovererStateStarted);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSschemasDiscovererStateStopped);
        }
        return @(AWSschemasDiscovererStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSschemasDiscovererStateStarted:
                return @"STARTED";
            case AWSschemasDiscovererStateStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSschemasErrorOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

@end

@implementation AWSschemasGetCodeBindingSourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"language" : @"Language",
             @"registryName" : @"RegistryName",
             @"schemaName" : @"SchemaName",
             @"schemaVersion" : @"SchemaVersion",
             };
}

@end

@implementation AWSschemasGetCodeBindingSourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             };
}

@end

@implementation AWSschemasGetDiscoveredSchemaInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"events" : @"Events",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OpenApi3"] == NSOrderedSame) {
            return @(AWSschemasTypesOpenApi3);
        }
        return @(AWSschemasTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSschemasTypesOpenApi3:
                return @"OpenApi3";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSschemasGetDiscoveredSchemaOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             };
}

@end

@implementation AWSschemasGetDiscoveredSchemaRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"events" : @"Events",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OpenApi3"] == NSOrderedSame) {
            return @(AWSschemasTypesOpenApi3);
        }
        return @(AWSschemasTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSschemasTypesOpenApi3:
                return @"OpenApi3";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSschemasGetDiscoveredSchemaResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             };
}

@end

@implementation AWSschemasGetResourcePolicyOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSschemasGetResourcePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registryName" : @"RegistryName",
             };
}

@end

@implementation AWSschemasGetResourcePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSschemasListDiscoverersOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"discoverers" : @"Discoverers",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)discoverersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSschemasDiscovererSummary class]];
}

@end

@implementation AWSschemasListDiscoverersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"discovererIdPrefix" : @"DiscovererIdPrefix",
             @"limit" : @"Limit",
             @"nextToken" : @"NextToken",
             @"sourceArnPrefix" : @"SourceArnPrefix",
             };
}

@end

@implementation AWSschemasListDiscoverersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"discoverers" : @"Discoverers",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)discoverersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSschemasDiscovererSummary class]];
}

@end

@implementation AWSschemasListRegistriesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"registries" : @"Registries",
             };
}

+ (NSValueTransformer *)registriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSschemasRegistrySummary class]];
}

@end

@implementation AWSschemasListRegistriesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextToken" : @"NextToken",
             @"registryNamePrefix" : @"RegistryNamePrefix",
             @"scope" : @"Scope",
             };
}

@end

@implementation AWSschemasListRegistriesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"registries" : @"Registries",
             };
}

+ (NSValueTransformer *)registriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSschemasRegistrySummary class]];
}

@end

@implementation AWSschemasListSchemaVersionsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"schemaVersions" : @"SchemaVersions",
             };
}

+ (NSValueTransformer *)schemaVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSschemasSchemaVersionSummary class]];
}

@end

@implementation AWSschemasListSchemaVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextToken" : @"NextToken",
             @"registryName" : @"RegistryName",
             @"schemaName" : @"SchemaName",
             };
}

@end

@implementation AWSschemasListSchemaVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"schemaVersions" : @"SchemaVersions",
             };
}

+ (NSValueTransformer *)schemaVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSschemasSchemaVersionSummary class]];
}

@end

@implementation AWSschemasListSchemasOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"schemas" : @"Schemas",
             };
}

+ (NSValueTransformer *)schemasJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSschemasSchemaSummary class]];
}

@end

@implementation AWSschemasListSchemasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextToken" : @"NextToken",
             @"registryName" : @"RegistryName",
             @"schemaNamePrefix" : @"SchemaNamePrefix",
             };
}

@end

@implementation AWSschemasListSchemasResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"schemas" : @"Schemas",
             };
}

+ (NSValueTransformer *)schemasJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSschemasSchemaSummary class]];
}

@end

@implementation AWSschemasListTagsForResourceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSschemasListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSschemasListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSschemasLockServiceLinkedRoleInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"RoleArn",
             @"timeout" : @"Timeout",
             };
}

@end

@implementation AWSschemasLockServiceLinkedRoleOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"canBeDeleted" : @"CanBeDeleted",
             @"reasonOfFailure" : @"ReasonOfFailure",
             @"relatedResources" : @"RelatedResources",
             };
}

+ (NSValueTransformer *)relatedResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSschemasDiscovererSummary class]];
}

@end

@implementation AWSschemasLockServiceLinkedRoleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"RoleArn",
             @"timeout" : @"Timeout",
             };
}

@end

@implementation AWSschemasLockServiceLinkedRoleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"canBeDeleted" : @"CanBeDeleted",
             @"reasonOfFailure" : @"ReasonOfFailure",
             @"relatedResources" : @"RelatedResources",
             };
}

+ (NSValueTransformer *)relatedResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSschemasDiscovererSummary class]];
}

@end

@implementation AWSschemasPutCodeBindingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"language" : @"Language",
             @"registryName" : @"RegistryName",
             @"schemaName" : @"SchemaName",
             @"schemaVersion" : @"SchemaVersion",
             };
}

@end

@implementation AWSschemasPutCodeBindingResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"CreationDate",
             @"lastModified" : @"LastModified",
             @"schemaVersion" : @"SchemaVersion",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSschemasCodeGenerationStatusCreateInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATE_COMPLETE"] == NSOrderedSame) {
            return @(AWSschemasCodeGenerationStatusCreateComplete);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSschemasCodeGenerationStatusCreateFailed);
        }
        return @(AWSschemasCodeGenerationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSschemasCodeGenerationStatusCreateInProgress:
                return @"CREATE_IN_PROGRESS";
            case AWSschemasCodeGenerationStatusCreateComplete:
                return @"CREATE_COMPLETE";
            case AWSschemasCodeGenerationStatusCreateFailed:
                return @"CREATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSschemasPutResourcePolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSschemasPutResourcePolicyOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSschemasPutResourcePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             @"registryName" : @"RegistryName",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSschemasPutResourcePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSschemasRegistryOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"registryArn" : @"RegistryArn",
             @"registryName" : @"RegistryName",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSschemasRegistrySummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registryArn" : @"RegistryArn",
             @"registryName" : @"RegistryName",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSschemasSchemaOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"lastModified" : @"LastModified",
             @"schemaArn" : @"SchemaArn",
             @"schemaName" : @"SchemaName",
             @"schemaVersion" : @"SchemaVersion",
             @"tags" : @"Tags",
             @"types" : @"Type",
             @"versionCreatedDate" : @"VersionCreatedDate",
             };
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)versionCreatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSschemasSchemaSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastModified" : @"LastModified",
             @"schemaArn" : @"SchemaArn",
             @"schemaName" : @"SchemaName",
             @"tags" : @"Tags",
             @"versionCount" : @"VersionCount",
             };
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSschemasSchemaVersionSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"schemaArn" : @"SchemaArn",
             @"schemaName" : @"SchemaName",
             @"schemaVersion" : @"SchemaVersion",
             };
}

@end

@implementation AWSschemasSearchSchemaSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registryName" : @"RegistryName",
             @"schemaArn" : @"SchemaArn",
             @"schemaName" : @"SchemaName",
             @"schemaVersions" : @"SchemaVersions",
             };
}

+ (NSValueTransformer *)schemaVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSschemasSearchSchemaVersionSummary class]];
}

@end

@implementation AWSschemasSearchSchemaVersionSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdDate" : @"CreatedDate",
             @"schemaVersion" : @"SchemaVersion",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSschemasSearchSchemasOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"schemas" : @"Schemas",
             };
}

+ (NSValueTransformer *)schemasJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSschemasSearchSchemaSummary class]];
}

@end

@implementation AWSschemasSearchSchemasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keywords" : @"Keywords",
             @"limit" : @"Limit",
             @"nextToken" : @"NextToken",
             @"registryName" : @"RegistryName",
             };
}

@end

@implementation AWSschemasSearchSchemasResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"schemas" : @"Schemas",
             };
}

+ (NSValueTransformer *)schemasJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSschemasSearchSchemaSummary class]];
}

@end

@implementation AWSschemasStartDiscovererRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"discovererId" : @"DiscovererId",
             };
}

@end

@implementation AWSschemasStartDiscovererResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"discovererId" : @"DiscovererId",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STARTED"] == NSOrderedSame) {
            return @(AWSschemasDiscovererStateStarted);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSschemasDiscovererStateStopped);
        }
        return @(AWSschemasDiscovererStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSschemasDiscovererStateStarted:
                return @"STARTED";
            case AWSschemasDiscovererStateStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSschemasStopDiscovererRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"discovererId" : @"DiscovererId",
             };
}

@end

@implementation AWSschemasStopDiscovererResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"discovererId" : @"DiscovererId",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STARTED"] == NSOrderedSame) {
            return @(AWSschemasDiscovererStateStarted);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSschemasDiscovererStateStopped);
        }
        return @(AWSschemasDiscovererStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSschemasDiscovererStateStarted:
                return @"STARTED";
            case AWSschemasDiscovererStateStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSschemasTagResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSschemasTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSschemasUnlockServiceLinkedRoleInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"RoleArn",
             };
}

@end

@implementation AWSschemasUnlockServiceLinkedRoleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"RoleArn",
             };
}

@end

@implementation AWSschemasUnlockServiceLinkedRoleResponse

@end

@implementation AWSschemasUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSschemasUpdateDiscovererInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             };
}

@end

@implementation AWSschemasUpdateDiscovererRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"discovererId" : @"DiscovererId",
             };
}

@end

@implementation AWSschemasUpdateDiscovererResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"discovererArn" : @"DiscovererArn",
             @"discovererId" : @"DiscovererId",
             @"sourceArn" : @"SourceArn",
             @"state" : @"State",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STARTED"] == NSOrderedSame) {
            return @(AWSschemasDiscovererStateStarted);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSschemasDiscovererStateStopped);
        }
        return @(AWSschemasDiscovererStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSschemasDiscovererStateStarted:
                return @"STARTED";
            case AWSschemasDiscovererStateStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSschemasUpdateRegistryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             };
}

@end

@implementation AWSschemasUpdateRegistryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"registryName" : @"RegistryName",
             };
}

@end

@implementation AWSschemasUpdateRegistryResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"registryArn" : @"RegistryArn",
             @"registryName" : @"RegistryName",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSschemasUpdateSchemaInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientTokenId" : @"ClientTokenId",
             @"content" : @"Content",
             @"detail" : @"Description",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OpenApi3"] == NSOrderedSame) {
            return @(AWSschemasTypesOpenApi3);
        }
        return @(AWSschemasTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSschemasTypesOpenApi3:
                return @"OpenApi3";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSschemasUpdateSchemaRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientTokenId" : @"ClientTokenId",
             @"content" : @"Content",
             @"detail" : @"Description",
             @"registryName" : @"RegistryName",
             @"schemaName" : @"SchemaName",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OpenApi3"] == NSOrderedSame) {
            return @(AWSschemasTypesOpenApi3);
        }
        return @(AWSschemasTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSschemasTypesOpenApi3:
                return @"OpenApi3";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSschemasUpdateSchemaResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"lastModified" : @"LastModified",
             @"schemaArn" : @"SchemaArn",
             @"schemaName" : @"SchemaName",
             @"schemaVersion" : @"SchemaVersion",
             @"tags" : @"Tags",
             @"types" : @"Type",
             @"versionCreatedDate" : @"VersionCreatedDate",
             };
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)versionCreatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end
