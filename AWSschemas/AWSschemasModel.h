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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSschemasErrorDomain;

typedef NS_ENUM(NSInteger, AWSschemasErrorType) {
    AWSschemasErrorUnknown,
    AWSschemasErrorBadRequest,
    AWSschemasErrorConflict,
    AWSschemasErrorForbidden,
    AWSschemasErrorGone,
    AWSschemasErrorInternalServerError,
    AWSschemasErrorNotFound,
    AWSschemasErrorPreconditionFailed,
    AWSschemasErrorServiceUnavailable,
    AWSschemasErrorTooManyRequests,
    AWSschemasErrorUnauthorized,
};

typedef NS_ENUM(NSInteger, AWSschemasCodeGenerationStatus) {
    AWSschemasCodeGenerationStatusUnknown,
    AWSschemasCodeGenerationStatusCreateInProgress,
    AWSschemasCodeGenerationStatusCreateComplete,
    AWSschemasCodeGenerationStatusCreateFailed,
};

typedef NS_ENUM(NSInteger, AWSschemasDiscovererState) {
    AWSschemasDiscovererStateUnknown,
    AWSschemasDiscovererStateStarted,
    AWSschemasDiscovererStateStopped,
};

typedef NS_ENUM(NSInteger, AWSschemasTypes) {
    AWSschemasTypesUnknown,
    AWSschemasTypesOpenApi3,
};

@class AWSschemasCodeBindingOutput;
@class AWSschemasCreateDiscovererInput;
@class AWSschemasCreateDiscovererRequest;
@class AWSschemasCreateDiscovererResponse;
@class AWSschemasCreateRegistryInput;
@class AWSschemasCreateRegistryRequest;
@class AWSschemasCreateRegistryResponse;
@class AWSschemasCreateSchemaInput;
@class AWSschemasCreateSchemaRequest;
@class AWSschemasCreateSchemaResponse;
@class AWSschemasDeleteDiscovererRequest;
@class AWSschemasDeleteRegistryRequest;
@class AWSschemasDeleteResourcePolicyRequest;
@class AWSschemasDeleteSchemaRequest;
@class AWSschemasDeleteSchemaVersionRequest;
@class AWSschemasDescribeCodeBindingRequest;
@class AWSschemasDescribeCodeBindingResponse;
@class AWSschemasDescribeDiscovererRequest;
@class AWSschemasDescribeDiscovererResponse;
@class AWSschemasDescribeRegistryRequest;
@class AWSschemasDescribeRegistryResponse;
@class AWSschemasDescribeSchemaOutput;
@class AWSschemasDescribeSchemaRequest;
@class AWSschemasDescribeSchemaResponse;
@class AWSschemasDiscovererOutput;
@class AWSschemasDiscovererStateOutput;
@class AWSschemasDiscovererSummary;
@class AWSschemasErrorOutput;
@class AWSschemasGetCodeBindingSourceRequest;
@class AWSschemasGetCodeBindingSourceResponse;
@class AWSschemasGetDiscoveredSchemaInput;
@class AWSschemasGetDiscoveredSchemaOutput;
@class AWSschemasGetDiscoveredSchemaRequest;
@class AWSschemasGetDiscoveredSchemaResponse;
@class AWSschemasGetResourcePolicyOutput;
@class AWSschemasGetResourcePolicyRequest;
@class AWSschemasGetResourcePolicyResponse;
@class AWSschemasListDiscoverersOutput;
@class AWSschemasListDiscoverersRequest;
@class AWSschemasListDiscoverersResponse;
@class AWSschemasListRegistriesOutput;
@class AWSschemasListRegistriesRequest;
@class AWSschemasListRegistriesResponse;
@class AWSschemasListSchemaVersionsOutput;
@class AWSschemasListSchemaVersionsRequest;
@class AWSschemasListSchemaVersionsResponse;
@class AWSschemasListSchemasOutput;
@class AWSschemasListSchemasRequest;
@class AWSschemasListSchemasResponse;
@class AWSschemasListTagsForResourceOutput;
@class AWSschemasListTagsForResourceRequest;
@class AWSschemasListTagsForResourceResponse;
@class AWSschemasLockServiceLinkedRoleInput;
@class AWSschemasLockServiceLinkedRoleOutput;
@class AWSschemasLockServiceLinkedRoleRequest;
@class AWSschemasLockServiceLinkedRoleResponse;
@class AWSschemasPutCodeBindingRequest;
@class AWSschemasPutCodeBindingResponse;
@class AWSschemasPutResourcePolicyInput;
@class AWSschemasPutResourcePolicyOutput;
@class AWSschemasPutResourcePolicyRequest;
@class AWSschemasPutResourcePolicyResponse;
@class AWSschemasRegistryOutput;
@class AWSschemasRegistrySummary;
@class AWSschemasSchemaOutput;
@class AWSschemasSchemaSummary;
@class AWSschemasSchemaVersionSummary;
@class AWSschemasSearchSchemaSummary;
@class AWSschemasSearchSchemaVersionSummary;
@class AWSschemasSearchSchemasOutput;
@class AWSschemasSearchSchemasRequest;
@class AWSschemasSearchSchemasResponse;
@class AWSschemasStartDiscovererRequest;
@class AWSschemasStartDiscovererResponse;
@class AWSschemasStopDiscovererRequest;
@class AWSschemasStopDiscovererResponse;
@class AWSschemasTagResourceInput;
@class AWSschemasTagResourceRequest;
@class AWSschemasUnlockServiceLinkedRoleInput;
@class AWSschemasUnlockServiceLinkedRoleRequest;
@class AWSschemasUnlockServiceLinkedRoleResponse;
@class AWSschemasUntagResourceRequest;
@class AWSschemasUpdateDiscovererInput;
@class AWSschemasUpdateDiscovererRequest;
@class AWSschemasUpdateDiscovererResponse;
@class AWSschemasUpdateRegistryInput;
@class AWSschemasUpdateRegistryRequest;
@class AWSschemasUpdateRegistryResponse;
@class AWSschemasUpdateSchemaInput;
@class AWSschemasUpdateSchemaRequest;
@class AWSschemasUpdateSchemaResponse;

/**
 
 */
@interface AWSschemasCodeBindingOutput : AWSModel


/**
 <p>The time and date that the code binding was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The date and time that code bindings were modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 <p>The version number of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaVersion;

/**
 <p>The current status of code binding generation.</p>
 */
@property (nonatomic, assign) AWSschemasCodeGenerationStatus status;

@end

/**
 
 */
@interface AWSschemasCreateDiscovererInput : AWSModel


/**
 <p>A description for the discoverer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN of the event bus.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

/**
 <p>Tags associated with the resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 Required parameters: [SourceArn]
 */
@interface AWSschemasCreateDiscovererRequest : AWSRequest


/**
 <p>A description for the discoverer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN of the event bus.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

/**
 <p>Tags associated with the resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSschemasCreateDiscovererResponse : AWSModel


/**
 <p>The description of the discoverer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN of the discoverer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable discovererArn;

/**
 <p>The ID of the discoverer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable discovererId;

/**
 <p>The ARN of the event bus.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

/**
 <p>The state of the discoverer.</p>
 */
@property (nonatomic, assign) AWSschemasDiscovererState state;

/**
 <p>Tags associated with the resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSschemasCreateRegistryInput : AWSModel


/**
 <p>A description of the registry to be created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Tags to associate with the registry.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSschemasCreateRegistryRequest : AWSRequest


/**
 <p>A description of the registry to be created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryName;

/**
 <p>Tags to associate with the registry.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSschemasCreateRegistryResponse : AWSModel


/**
 <p>The description of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryArn;

/**
 <p>The name of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryName;

/**
 <p>Tags associated with the registry.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSschemasCreateSchemaInput : AWSModel


/**
 <p>The source of the schema definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>A description of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Tags associated with the schema.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The type of schema.</p>
 */
@property (nonatomic, assign) AWSschemasTypes types;

@end

/**
 
 */
@interface AWSschemasCreateSchemaRequest : AWSRequest


/**
 <p>The source of the schema definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>A description of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryName;

/**
 <p>The name of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaName;

/**
 <p>Tags associated with the schema.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The type of schema.</p>
 */
@property (nonatomic, assign) AWSschemasTypes types;

@end

/**
 
 */
@interface AWSschemasCreateSchemaResponse : AWSModel


/**
 <p>The description of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The date and time that schema was modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 <p>The ARN of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaArn;

/**
 <p>The name of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaName;

/**
 <p>The version number of the schema</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaVersion;

/**
 <p>Key-value pairs associated with a resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The type of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

/**
 <p>The date the schema version was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable versionCreatedDate;

@end

/**
 
 */
@interface AWSschemasDeleteDiscovererRequest : AWSRequest


/**
 <p>The ID of the discoverer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable discovererId;

@end

/**
 
 */
@interface AWSschemasDeleteRegistryRequest : AWSRequest


/**
 <p>The name of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryName;

@end

/**
 
 */
@interface AWSschemasDeleteResourcePolicyRequest : AWSRequest


/**
 <p>The name of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryName;

@end

/**
 
 */
@interface AWSschemasDeleteSchemaRequest : AWSRequest


/**
 <p>The name of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryName;

/**
 <p>The name of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaName;

@end

/**
 
 */
@interface AWSschemasDeleteSchemaVersionRequest : AWSRequest


/**
 <p>The name of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryName;

/**
 <p>The name of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaName;

/**
 The version number of the schema
 */
@property (nonatomic, strong) NSString * _Nullable schemaVersion;

@end

/**
 
 */
@interface AWSschemasDescribeCodeBindingRequest : AWSRequest


/**
 <p>The language of the code binding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable language;

/**
 <p>The name of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryName;

/**
 <p>The name of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaName;

/**
 <p>Specifying this limits the results to only this schema version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaVersion;

@end

/**
 
 */
@interface AWSschemasDescribeCodeBindingResponse : AWSModel


/**
 <p>The time and date that the code binding was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The date and time that code bindings were modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 <p>The version number of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaVersion;

/**
 <p>The current status of code binding generation.</p>
 */
@property (nonatomic, assign) AWSschemasCodeGenerationStatus status;

@end

/**
 
 */
@interface AWSschemasDescribeDiscovererRequest : AWSRequest


/**
 <p>The ID of the discoverer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable discovererId;

@end

/**
 
 */
@interface AWSschemasDescribeDiscovererResponse : AWSModel


/**
 <p>The description of the discoverer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN of the discoverer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable discovererArn;

/**
 <p>The ID of the discoverer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable discovererId;

/**
 <p>The ARN of the event bus.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

/**
 <p>The state of the discoverer.</p>
 */
@property (nonatomic, assign) AWSschemasDiscovererState state;

/**
 <p>Tags associated with the resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSschemasDescribeRegistryRequest : AWSRequest


/**
 <p>The name of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryName;

@end

/**
 
 */
@interface AWSschemasDescribeRegistryResponse : AWSModel


/**
 <p>The description of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryArn;

/**
 <p>The name of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryName;

/**
 <p>Tags associated with the registry.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSschemasDescribeSchemaOutput : AWSModel


/**
 <p>The source of the schema definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The description of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The date and time that schema was modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 <p>The ARN of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaArn;

/**
 <p>The name of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaName;

/**
 <p>The version number of the schema</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaVersion;

/**
 <p>Tags associated with the resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The type of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

/**
 <p>The date the schema version was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable versionCreatedDate;

@end

/**
 
 */
@interface AWSschemasDescribeSchemaRequest : AWSRequest


/**
 <p>The name of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryName;

/**
 <p>The name of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaName;

/**
 <p>Specifying this limits the results to only this schema version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaVersion;

@end

/**
 
 */
@interface AWSschemasDescribeSchemaResponse : AWSModel


/**
 <p>The source of the schema definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The description of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The date and time that schema was modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 <p>The ARN of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaArn;

/**
 <p>The name of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaName;

/**
 <p>The version number of the schema</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaVersion;

/**
 <p>Tags associated with the resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The type of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

/**
 <p>The date the schema version was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable versionCreatedDate;

@end

/**
 
 */
@interface AWSschemasDiscovererOutput : AWSModel


/**
 <p>The description of the discoverer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN of the discoverer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable discovererArn;

/**
 <p>The ID of the discoverer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable discovererId;

/**
 <p>The ARN of the event bus.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

/**
 <p>The state of the discoverer.</p>
 */
@property (nonatomic, assign) AWSschemasDiscovererState state;

/**
 <p>Tags associated with the resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSschemasDiscovererStateOutput : AWSModel


/**
 <p>The ID of the discoverer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable discovererId;

/**
 <p>The state of the discoverer.</p>
 */
@property (nonatomic, assign) AWSschemasDiscovererState state;

@end

/**
 
 */
@interface AWSschemasDiscovererSummary : AWSModel


/**
 <p>The ARN of the discoverer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable discovererArn;

/**
 <p>The ID of the discoverer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable discovererId;

/**
 <p>The ARN of the event bus.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

/**
 <p>The state of the discoverer.</p>
 */
@property (nonatomic, assign) AWSschemasDiscovererState state;

/**
 <p>Tags associated with the resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSschemasErrorOutput : AWSModel


/**
 <p>The error code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>The message string of the error output.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 
 */
@interface AWSschemasGetCodeBindingSourceRequest : AWSRequest


/**
 <p>The language of the code binding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable language;

/**
 <p>The name of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryName;

/**
 <p>The name of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaName;

/**
 <p>Specifying this limits the results to only this schema version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaVersion;

@end

/**
 
 */
@interface AWSschemasGetCodeBindingSourceResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) NSData * _Nullable body;

@end

/**
 
 */
@interface AWSschemasGetDiscoveredSchemaInput : AWSModel


/**
 <p>An array of strings where each string is a JSON event. These are the events that were used to generate the schema. The array includes a single type of event and has a maximum size of 10 events.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable events;

/**
 <p>The type of event.</p>
 */
@property (nonatomic, assign) AWSschemasTypes types;

@end

/**
 <p></p>
 */
@interface AWSschemasGetDiscoveredSchemaOutput : AWSModel


/**
 <p>The source of the schema definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

@end

/**
 
 */
@interface AWSschemasGetDiscoveredSchemaRequest : AWSRequest


/**
 <p>An array of strings where each string is a JSON event. These are the events that were used to generate the schema. The array includes a single type of event and has a maximum size of 10 events.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable events;

/**
 <p>The type of event.</p>
 */
@property (nonatomic, assign) AWSschemasTypes types;

@end

/**
 
 */
@interface AWSschemasGetDiscoveredSchemaResponse : AWSModel


/**
 <p>The source of the schema definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

@end

/**
 <p>Information about the policy.</p>
 */
@interface AWSschemasGetResourcePolicyOutput : AWSModel


/**
 <p>The resource-based policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>The revision ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 
 */
@interface AWSschemasGetResourcePolicyRequest : AWSRequest


/**
 <p>The name of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryName;

@end

/**
 
 */
@interface AWSschemasGetResourcePolicyResponse : AWSModel


/**
 <p>The resource-based policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>The revision ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 
 */
@interface AWSschemasListDiscoverersOutput : AWSModel


/**
 <p>An array of DiscovererSummary information.</p>
 */
@property (nonatomic, strong) NSArray<AWSschemasDiscovererSummary *> * _Nullable discoverers;

/**
 <p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSschemasListDiscoverersRequest : AWSRequest


/**
 <p>Specifying this limits the results to only those discoverer IDs that start with the specified prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable discovererIdPrefix;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Specifying this limits the results to only those ARNs that start with the specified prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceArnPrefix;

@end

/**
 
 */
@interface AWSschemasListDiscoverersResponse : AWSModel


/**
 <p>An array of DiscovererSummary information.</p>
 */
@property (nonatomic, strong) NSArray<AWSschemasDiscovererSummary *> * _Nullable discoverers;

/**
 <p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>List the registries.</p>
 */
@interface AWSschemasListRegistriesOutput : AWSModel


/**
 <p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of registry summaries.</p>
 */
@property (nonatomic, strong) NSArray<AWSschemasRegistrySummary *> * _Nullable registries;

@end

/**
 
 */
@interface AWSschemasListRegistriesRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Specifying this limits the results to only those registry names that start with the specified prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryNamePrefix;

/**
 <p>Can be set to Local or AWS to limit responses to your custom registries, or the ones provided by AWS.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scope;

@end

/**
 
 */
@interface AWSschemasListRegistriesResponse : AWSModel


/**
 <p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of registry summaries.</p>
 */
@property (nonatomic, strong) NSArray<AWSschemasRegistrySummary *> * _Nullable registries;

@end

/**
 
 */
@interface AWSschemasListSchemaVersionsOutput : AWSModel


/**
 <p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of schema version summaries.</p>
 */
@property (nonatomic, strong) NSArray<AWSschemasSchemaVersionSummary *> * _Nullable schemaVersions;

@end

/**
 
 */
@interface AWSschemasListSchemaVersionsRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryName;

/**
 <p>The name of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaName;

@end

/**
 
 */
@interface AWSschemasListSchemaVersionsResponse : AWSModel


/**
 <p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of schema version summaries.</p>
 */
@property (nonatomic, strong) NSArray<AWSschemasSchemaVersionSummary *> * _Nullable schemaVersions;

@end

/**
 
 */
@interface AWSschemasListSchemasOutput : AWSModel


/**
 <p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of schema summaries.</p>
 */
@property (nonatomic, strong) NSArray<AWSschemasSchemaSummary *> * _Nullable schemas;

@end

/**
 
 */
@interface AWSschemasListSchemasRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryName;

/**
 <p>Specifying this limits the results to only those schema names that start with the specified prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaNamePrefix;

@end

/**
 
 */
@interface AWSschemasListSchemasResponse : AWSModel


/**
 <p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of schema summaries.</p>
 */
@property (nonatomic, strong) NSArray<AWSschemasSchemaSummary *> * _Nullable schemas;

@end

/**
 
 */
@interface AWSschemasListTagsForResourceOutput : AWSModel


/**
 <p>Key-value pairs associated with a resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSschemasListTagsForResourceRequest : AWSRequest


/**
 <p>The ARN of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSschemasListTagsForResourceResponse : AWSModel


/**
 <p>Key-value pairs associated with a resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSschemasLockServiceLinkedRoleInput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable timeout;

@end

/**
 
 */
@interface AWSschemasLockServiceLinkedRoleOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable canBeDeleted;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable reasonOfFailure;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSschemasDiscovererSummary *> * _Nullable relatedResources;

@end

/**
 
 Required parameters: [Timeout, RoleArn]
 */
@interface AWSschemasLockServiceLinkedRoleRequest : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable timeout;

@end

/**
 
 */
@interface AWSschemasLockServiceLinkedRoleResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable canBeDeleted;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable reasonOfFailure;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSschemasDiscovererSummary *> * _Nullable relatedResources;

@end

/**
 
 */
@interface AWSschemasPutCodeBindingRequest : AWSRequest


/**
 <p>The language of the code binding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable language;

/**
 <p>The name of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryName;

/**
 <p>The name of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaName;

/**
 <p>Specifying this limits the results to only this schema version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaVersion;

@end

/**
 
 */
@interface AWSschemasPutCodeBindingResponse : AWSModel


/**
 <p>The time and date that the code binding was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The date and time that code bindings were modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 <p>The version number of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaVersion;

/**
 <p>The current status of code binding generation.</p>
 */
@property (nonatomic, assign) AWSschemasCodeGenerationStatus status;

@end

/**
 <p>Only update the policy if the revision ID matches the ID that's specified. Use this option to avoid modifying a policy that has changed since you last read it.</p>
 Required parameters: [Policy]
 */
@interface AWSschemasPutResourcePolicyInput : AWSModel


/**
 <p>The resource-based policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>The revision ID of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 <p>The resource-based policy.</p>
 */
@interface AWSschemasPutResourcePolicyOutput : AWSModel


/**
 <p>The resource-based policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>The revision ID of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 <p>The name of the policy.</p>
 Required parameters: [Policy]
 */
@interface AWSschemasPutResourcePolicyRequest : AWSRequest


/**
 <p>The resource-based policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>The name of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryName;

/**
 <p>The revision ID of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 
 */
@interface AWSschemasPutResourcePolicyResponse : AWSModel


/**
 <p>The resource-based policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>The revision ID of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 
 */
@interface AWSschemasRegistryOutput : AWSModel


/**
 <p>The description of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryArn;

/**
 <p>The name of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryName;

/**
 <p>Tags associated with the registry.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSschemasRegistrySummary : AWSModel


/**
 <p>The ARN of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryArn;

/**
 <p>The name of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryName;

/**
 <p>Tags associated with the registry.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSschemasSchemaOutput : AWSModel


/**
 <p>The description of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The date and time that schema was modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 <p>The ARN of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaArn;

/**
 <p>The name of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaName;

/**
 <p>The version number of the schema</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaVersion;

/**
 <p>Key-value pairs associated with a resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The type of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

/**
 <p>The date the schema version was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable versionCreatedDate;

@end

/**
 <p>A summary of schema details.</p>
 */
@interface AWSschemasSchemaSummary : AWSModel


/**
 <p>The date and time that schema was modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 <p>The ARN of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaArn;

/**
 <p>The name of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaName;

/**
 <p>Tags associated with the schema.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The number of versions available for the schema.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable versionCount;

@end

/**
 
 */
@interface AWSschemasSchemaVersionSummary : AWSModel


/**
 <p>The ARN of the schema version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaArn;

/**
 <p>The name of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaName;

/**
 <p>The version number of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaVersion;

@end

/**
 
 */
@interface AWSschemasSearchSchemaSummary : AWSModel


/**
 <p>The name of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryName;

/**
 <p>The ARN of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaArn;

/**
 <p>The name of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaName;

/**
 <p>An array of schema version summaries.</p>
 */
@property (nonatomic, strong) NSArray<AWSschemasSearchSchemaVersionSummary *> * _Nullable schemaVersions;

@end

/**
 
 */
@interface AWSschemasSearchSchemaVersionSummary : AWSModel


/**
 <p>The date the schema version was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The version number of the schema</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaVersion;

@end

/**
 
 */
@interface AWSschemasSearchSchemasOutput : AWSModel


/**
 <p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of SearchSchemaSummary information.</p>
 */
@property (nonatomic, strong) NSArray<AWSschemasSearchSchemaSummary *> * _Nullable schemas;

@end

/**
 
 */
@interface AWSschemasSearchSchemasRequest : AWSRequest


/**
 <p>Specifying this limits the results to only schemas that include the provided keywords.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keywords;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryName;

@end

/**
 
 */
@interface AWSschemasSearchSchemasResponse : AWSModel


/**
 <p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of SearchSchemaSummary information.</p>
 */
@property (nonatomic, strong) NSArray<AWSschemasSearchSchemaSummary *> * _Nullable schemas;

@end

/**
 
 */
@interface AWSschemasStartDiscovererRequest : AWSRequest


/**
 <p>The ID of the discoverer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable discovererId;

@end

/**
 
 */
@interface AWSschemasStartDiscovererResponse : AWSModel


/**
 <p>The ID of the discoverer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable discovererId;

/**
 <p>The state of the discoverer.</p>
 */
@property (nonatomic, assign) AWSschemasDiscovererState state;

@end

/**
 
 */
@interface AWSschemasStopDiscovererRequest : AWSRequest


/**
 <p>The ID of the discoverer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable discovererId;

@end

/**
 
 */
@interface AWSschemasStopDiscovererResponse : AWSModel


/**
 <p>The ID of the discoverer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable discovererId;

/**
 <p>The state of the discoverer.</p>
 */
@property (nonatomic, assign) AWSschemasDiscovererState state;

@end

/**
 
 */
@interface AWSschemasTagResourceInput : AWSModel


/**
 <p>Tags associated with the resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p></p>
 Required parameters: [ResourceArn, Tags]
 */
@interface AWSschemasTagResourceRequest : AWSRequest


/**
 <p>The ARN of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>Tags associated with the resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSschemasUnlockServiceLinkedRoleInput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSschemasUnlockServiceLinkedRoleRequest : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSschemasUnlockServiceLinkedRoleResponse : AWSModel


@end

/**
 
 */
@interface AWSschemasUntagResourceRequest : AWSRequest


/**
 <p>The ARN of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>Keys of key-value pairs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSschemasUpdateDiscovererInput : AWSModel


/**
 <p>The description of the discoverer to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 
 */
@interface AWSschemasUpdateDiscovererRequest : AWSRequest


/**
 <p>The description of the discoverer to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID of the discoverer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable discovererId;

@end

/**
 
 */
@interface AWSschemasUpdateDiscovererResponse : AWSModel


/**
 <p>The description of the discoverer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN of the discoverer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable discovererArn;

/**
 <p>The ID of the discoverer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable discovererId;

/**
 <p>The ARN of the event bus.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

/**
 <p>The state of the discoverer.</p>
 */
@property (nonatomic, assign) AWSschemasDiscovererState state;

/**
 <p>Tags associated with the resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSschemasUpdateRegistryInput : AWSModel


/**
 <p>The description of the registry to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 <p>Updates the registry.</p>
 Required parameters: [RegistryName]
 */
@interface AWSschemasUpdateRegistryRequest : AWSRequest


/**
 <p>The description of the registry to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryName;

@end

/**
 
 */
@interface AWSschemasUpdateRegistryResponse : AWSModel


/**
 <p>The description of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryArn;

/**
 <p>The name of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryName;

/**
 <p>Tags associated with the registry.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSschemasUpdateSchemaInput : AWSModel


/**
 <p>The ID of the client token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientTokenId;

/**
 <p>The source of the schema definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The description of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The schema type for the events schema.</p>
 */
@property (nonatomic, assign) AWSschemasTypes types;

@end

/**
 
 */
@interface AWSschemasUpdateSchemaRequest : AWSRequest


/**
 <p>The ID of the client token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientTokenId;

/**
 <p>The source of the schema definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The description of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the registry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryName;

/**
 <p>The name of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaName;

/**
 <p>The schema type for the events schema.</p>
 */
@property (nonatomic, assign) AWSschemasTypes types;

@end

/**
 
 */
@interface AWSschemasUpdateSchemaResponse : AWSModel


/**
 <p>The description of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The date and time that schema was modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 <p>The ARN of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaArn;

/**
 <p>The name of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaName;

/**
 <p>The version number of the schema</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaVersion;

/**
 <p>Key-value pairs associated with a resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The type of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

/**
 <p>The date the schema version was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable versionCreatedDate;

@end

NS_ASSUME_NONNULL_END
