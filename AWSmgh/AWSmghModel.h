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

FOUNDATION_EXPORT NSString *const AWSmghErrorDomain;

typedef NS_ENUM(NSInteger, AWSmghErrorType) {
    AWSmghErrorUnknown,
    AWSmghErrorAccessDenied,
    AWSmghErrorDryRunOperation,
    AWSmghErrorHomeRegionNotSet,
    AWSmghErrorInternalServer,
    AWSmghErrorInvalidInput,
    AWSmghErrorPolicyError,
    AWSmghErrorResourceNotFound,
    AWSmghErrorServiceUnavailable,
    AWSmghErrorThrottling,
    AWSmghErrorUnauthorizedOperation,
};

typedef NS_ENUM(NSInteger, AWSmghApplicationStatus) {
    AWSmghApplicationStatusUnknown,
    AWSmghApplicationStatusNotStarted,
    AWSmghApplicationStatusInProgress,
    AWSmghApplicationStatusCompleted,
};

typedef NS_ENUM(NSInteger, AWSmghResourceAttributeType) {
    AWSmghResourceAttributeTypeUnknown,
    AWSmghResourceAttributeTypeIpv4Address,
    AWSmghResourceAttributeTypeIpv6Address,
    AWSmghResourceAttributeTypeMacAddress,
    AWSmghResourceAttributeTypeFqdn,
    AWSmghResourceAttributeTypeVmManagerId,
    AWSmghResourceAttributeTypeVmManagedObjectReference,
    AWSmghResourceAttributeTypeVmName,
    AWSmghResourceAttributeTypeVmPath,
    AWSmghResourceAttributeTypeBiosId,
    AWSmghResourceAttributeTypeMotherboardSerialNumber,
};

typedef NS_ENUM(NSInteger, AWSmghStatus) {
    AWSmghStatusUnknown,
    AWSmghStatusNotStarted,
    AWSmghStatusInProgress,
    AWSmghStatusFailed,
    AWSmghStatusCompleted,
};

@class AWSmghApplicationState;
@class AWSmghAssociateCreatedArtifactRequest;
@class AWSmghAssociateCreatedArtifactResult;
@class AWSmghAssociateDiscoveredResourceRequest;
@class AWSmghAssociateDiscoveredResourceResult;
@class AWSmghCreateProgressUpdateStreamRequest;
@class AWSmghCreateProgressUpdateStreamResult;
@class AWSmghCreatedArtifact;
@class AWSmghDeleteProgressUpdateStreamRequest;
@class AWSmghDeleteProgressUpdateStreamResult;
@class AWSmghDescribeApplicationStateRequest;
@class AWSmghDescribeApplicationStateResult;
@class AWSmghDescribeMigrationTaskRequest;
@class AWSmghDescribeMigrationTaskResult;
@class AWSmghDisassociateCreatedArtifactRequest;
@class AWSmghDisassociateCreatedArtifactResult;
@class AWSmghDisassociateDiscoveredResourceRequest;
@class AWSmghDisassociateDiscoveredResourceResult;
@class AWSmghDiscoveredResource;
@class AWSmghImportMigrationTaskRequest;
@class AWSmghImportMigrationTaskResult;
@class AWSmghListApplicationStatesRequest;
@class AWSmghListApplicationStatesResult;
@class AWSmghListCreatedArtifactsRequest;
@class AWSmghListCreatedArtifactsResult;
@class AWSmghListDiscoveredResourcesRequest;
@class AWSmghListDiscoveredResourcesResult;
@class AWSmghListMigrationTasksRequest;
@class AWSmghListMigrationTasksResult;
@class AWSmghListProgressUpdateStreamsRequest;
@class AWSmghListProgressUpdateStreamsResult;
@class AWSmghMigrationTask;
@class AWSmghMigrationTaskSummary;
@class AWSmghNotifyApplicationStateRequest;
@class AWSmghNotifyApplicationStateResult;
@class AWSmghNotifyMigrationTaskStateRequest;
@class AWSmghNotifyMigrationTaskStateResult;
@class AWSmghProgressUpdateStreamSummary;
@class AWSmghPutResourceAttributesRequest;
@class AWSmghPutResourceAttributesResult;
@class AWSmghResourceAttribute;
@class AWSmghTask;

/**
 <p>The state of an application discovered through Migration Hub import, the AWS Agentless Discovery Connector, or the AWS Application Discovery Agent.</p>
 */
@interface AWSmghApplicationState : AWSModel


/**
 <p>The configurationId from the Application Discovery Service that uniquely identifies an application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The current status of an application.</p>
 */
@property (nonatomic, assign) AWSmghApplicationStatus applicationStatus;

/**
 <p>The timestamp when the application status was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

@end

/**
 
 */
@interface AWSmghAssociateCreatedArtifactRequest : AWSRequest


/**
 <p>An ARN of the AWS resource related to the migration (e.g., AMI, EC2 instance, RDS instance, etc.) </p>
 */
@property (nonatomic, strong) AWSmghCreatedArtifact * _Nullable createdArtifact;

/**
 <p>Optional boolean flag to indicate whether any effect should take place. Used to test if the caller has permission to make the call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>Unique identifier that references the migration task. <i>Do not store personal data in this field.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable migrationTaskName;

/**
 <p>The name of the ProgressUpdateStream. </p>
 */
@property (nonatomic, strong) NSString * _Nullable progressUpdateStream;

@end

/**
 
 */
@interface AWSmghAssociateCreatedArtifactResult : AWSModel


@end

/**
 
 */
@interface AWSmghAssociateDiscoveredResourceRequest : AWSRequest


/**
 <p>Object representing a Resource.</p>
 */
@property (nonatomic, strong) AWSmghDiscoveredResource * _Nullable discoveredResource;

/**
 <p>Optional boolean flag to indicate whether any effect should take place. Used to test if the caller has permission to make the call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The identifier given to the MigrationTask. <i>Do not store personal data in this field.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable migrationTaskName;

/**
 <p>The name of the ProgressUpdateStream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable progressUpdateStream;

@end

/**
 
 */
@interface AWSmghAssociateDiscoveredResourceResult : AWSModel


@end

/**
 
 */
@interface AWSmghCreateProgressUpdateStreamRequest : AWSRequest


/**
 <p>Optional boolean flag to indicate whether any effect should take place. Used to test if the caller has permission to make the call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The name of the ProgressUpdateStream. <i>Do not store personal data in this field.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable progressUpdateStreamName;

@end

/**
 
 */
@interface AWSmghCreateProgressUpdateStreamResult : AWSModel


@end

/**
 <p>An ARN of the AWS cloud resource target receiving the migration (e.g., AMI, EC2 instance, RDS instance, etc.).</p>
 Required parameters: [Name]
 */
@interface AWSmghCreatedArtifact : AWSModel


/**
 <p>A description that can be free-form text to record additional detail about the artifact for clarity or for later reference.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>An ARN that uniquely identifies the result of a migration task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSmghDeleteProgressUpdateStreamRequest : AWSRequest


/**
 <p>Optional boolean flag to indicate whether any effect should take place. Used to test if the caller has permission to make the call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The name of the ProgressUpdateStream. <i>Do not store personal data in this field.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable progressUpdateStreamName;

@end

/**
 
 */
@interface AWSmghDeleteProgressUpdateStreamResult : AWSModel


@end

/**
 
 */
@interface AWSmghDescribeApplicationStateRequest : AWSRequest


/**
 <p>The configurationId in Application Discovery Service that uniquely identifies the grouped application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSmghDescribeApplicationStateResult : AWSModel


/**
 <p>Status of the application - Not Started, In-Progress, Complete.</p>
 */
@property (nonatomic, assign) AWSmghApplicationStatus applicationStatus;

/**
 <p>The timestamp when the application status was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

@end

/**
 
 */
@interface AWSmghDescribeMigrationTaskRequest : AWSRequest


/**
 <p>The identifier given to the MigrationTask. <i>Do not store personal data in this field.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable migrationTaskName;

/**
 <p>The name of the ProgressUpdateStream. </p>
 */
@property (nonatomic, strong) NSString * _Nullable progressUpdateStream;

@end

/**
 
 */
@interface AWSmghDescribeMigrationTaskResult : AWSModel


/**
 <p>Object encapsulating information about the migration task.</p>
 */
@property (nonatomic, strong) AWSmghMigrationTask * _Nullable migrationTask;

@end

/**
 
 */
@interface AWSmghDisassociateCreatedArtifactRequest : AWSRequest


/**
 <p>An ARN of the AWS resource related to the migration (e.g., AMI, EC2 instance, RDS instance, etc.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdArtifactName;

/**
 <p>Optional boolean flag to indicate whether any effect should take place. Used to test if the caller has permission to make the call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>Unique identifier that references the migration task to be disassociated with the artifact. <i>Do not store personal data in this field.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable migrationTaskName;

/**
 <p>The name of the ProgressUpdateStream. </p>
 */
@property (nonatomic, strong) NSString * _Nullable progressUpdateStream;

@end

/**
 
 */
@interface AWSmghDisassociateCreatedArtifactResult : AWSModel


@end

/**
 
 */
@interface AWSmghDisassociateDiscoveredResourceRequest : AWSRequest


/**
 <p>ConfigurationId of the Application Discovery Service resource to be disassociated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationId;

/**
 <p>Optional boolean flag to indicate whether any effect should take place. Used to test if the caller has permission to make the call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The identifier given to the MigrationTask. <i>Do not store personal data in this field.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable migrationTaskName;

/**
 <p>The name of the ProgressUpdateStream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable progressUpdateStream;

@end

/**
 
 */
@interface AWSmghDisassociateDiscoveredResourceResult : AWSModel


@end

/**
 <p>Object representing the on-premises resource being migrated.</p>
 Required parameters: [ConfigurationId]
 */
@interface AWSmghDiscoveredResource : AWSModel


/**
 <p>The configurationId in Application Discovery Service that uniquely identifies the on-premise resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationId;

/**
 <p>A description that can be free-form text to record additional detail about the discovered resource for clarity or later reference.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 
 */
@interface AWSmghImportMigrationTaskRequest : AWSRequest


/**
 <p>Optional boolean flag to indicate whether any effect should take place. Used to test if the caller has permission to make the call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>Unique identifier that references the migration task. <i>Do not store personal data in this field.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable migrationTaskName;

/**
 <p>The name of the ProgressUpdateStream. &gt;</p>
 */
@property (nonatomic, strong) NSString * _Nullable progressUpdateStream;

@end

/**
 
 */
@interface AWSmghImportMigrationTaskResult : AWSModel


@end

/**
 
 */
@interface AWSmghListApplicationStatesRequest : AWSRequest


/**
 <p>The configurationIds from the Application Discovery Service that uniquely identifies your applications.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable applicationIds;

/**
 <p>Maximum number of results to be returned per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If a <code>NextToken</code> was returned by a previous call, there are more results available. To retrieve the next page of results, make the call again using the returned token in <code>NextToken</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSmghListApplicationStatesResult : AWSModel


/**
 <p>A list of Applications that exist in Application Discovery Service.</p>
 */
@property (nonatomic, strong) NSArray<AWSmghApplicationState *> * _Nullable applicationStateList;

/**
 <p>If a <code>NextToken</code> was returned by a previous call, there are more results available. To retrieve the next page of results, make the call again using the returned token in <code>NextToken</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSmghListCreatedArtifactsRequest : AWSRequest


/**
 <p>Maximum number of results to be returned per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Unique identifier that references the migration task. <i>Do not store personal data in this field.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable migrationTaskName;

/**
 <p>If a <code>NextToken</code> was returned by a previous call, there are more results available. To retrieve the next page of results, make the call again using the returned token in <code>NextToken</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the ProgressUpdateStream. </p>
 */
@property (nonatomic, strong) NSString * _Nullable progressUpdateStream;

@end

/**
 
 */
@interface AWSmghListCreatedArtifactsResult : AWSModel


/**
 <p>List of created artifacts up to the maximum number of results specified in the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSmghCreatedArtifact *> * _Nullable createdArtifactList;

/**
 <p>If there are more created artifacts than the max result, return the next token to be passed to the next call as a bookmark of where to start from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSmghListDiscoveredResourcesRequest : AWSRequest


/**
 <p>The maximum number of results returned per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The name of the MigrationTask. <i>Do not store personal data in this field.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable migrationTaskName;

/**
 <p>If a <code>NextToken</code> was returned by a previous call, there are more results available. To retrieve the next page of results, make the call again using the returned token in <code>NextToken</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the ProgressUpdateStream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable progressUpdateStream;

@end

/**
 
 */
@interface AWSmghListDiscoveredResourcesResult : AWSModel


/**
 <p>Returned list of discovered resources associated with the given MigrationTask.</p>
 */
@property (nonatomic, strong) NSArray<AWSmghDiscoveredResource *> * _Nullable discoveredResourceList;

/**
 <p>If there are more discovered resources than the max result, return the next token to be passed to the next call as a bookmark of where to start from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSmghListMigrationTasksRequest : AWSRequest


/**
 <p>Value to specify how many results are returned per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If a <code>NextToken</code> was returned by a previous call, there are more results available. To retrieve the next page of results, make the call again using the returned token in <code>NextToken</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Filter migration tasks by discovered resource name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceName;

@end

/**
 
 */
@interface AWSmghListMigrationTasksResult : AWSModel


/**
 <p>Lists the migration task's summary which includes: <code>MigrationTaskName</code>, <code>ProgressPercent</code>, <code>ProgressUpdateStream</code>, <code>Status</code>, and the <code>UpdateDateTime</code> for each task.</p>
 */
@property (nonatomic, strong) NSArray<AWSmghMigrationTaskSummary *> * _Nullable migrationTaskSummaryList;

/**
 <p>If there are more migration tasks than the max result, return the next token to be passed to the next call as a bookmark of where to start from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSmghListProgressUpdateStreamsRequest : AWSRequest


/**
 <p>Filter to limit the maximum number of results to list per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If a <code>NextToken</code> was returned by a previous call, there are more results available. To retrieve the next page of results, make the call again using the returned token in <code>NextToken</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSmghListProgressUpdateStreamsResult : AWSModel


/**
 <p>If there are more streams created than the max result, return the next token to be passed to the next call as a bookmark of where to start from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>List of progress update streams up to the max number of results passed in the input.</p>
 */
@property (nonatomic, strong) NSArray<AWSmghProgressUpdateStreamSummary *> * _Nullable progressUpdateStreamSummaryList;

@end

/**
 <p>Represents a migration task in a migration tool.</p>
 */
@interface AWSmghMigrationTask : AWSModel


/**
 <p>Unique identifier that references the migration task. <i>Do not store personal data in this field.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable migrationTaskName;

/**
 <p>A name that identifies the vendor of the migration tool being used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable progressUpdateStream;

/**
 <p>Information about the resource that is being migrated. This data will be used to map the task to a resource in the Application Discovery Service repository.</p>
 */
@property (nonatomic, strong) NSArray<AWSmghResourceAttribute *> * _Nullable resourceAttributeList;

/**
 <p>Task object encapsulating task information.</p>
 */
@property (nonatomic, strong) AWSmghTask * _Nullable task;

/**
 <p>The timestamp when the task was gathered.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateDateTime;

@end

/**
 <p>MigrationTaskSummary includes <code>MigrationTaskName</code>, <code>ProgressPercent</code>, <code>ProgressUpdateStream</code>, <code>Status</code>, and <code>UpdateDateTime</code> for each task.</p>
 */
@interface AWSmghMigrationTaskSummary : AWSModel


/**
 <p>Unique identifier that references the migration task. <i>Do not store personal data in this field.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable migrationTaskName;

/**
 <p>Indication of the percentage completion of the task.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable progressPercent;

/**
 <p>An AWS resource used for access control. It should uniquely identify the migration tool as it is used for all updates made by the tool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable progressUpdateStream;

/**
 <p>Status of the task.</p>
 */
@property (nonatomic, assign) AWSmghStatus status;

/**
 <p>Detail information of what is being done within the overall status state.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusDetail;

/**
 <p>The timestamp when the task was gathered.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateDateTime;

@end

/**
 
 */
@interface AWSmghNotifyApplicationStateRequest : AWSRequest


/**
 <p>The configurationId in Application Discovery Service that uniquely identifies the grouped application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>Optional boolean flag to indicate whether any effect should take place. Used to test if the caller has permission to make the call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>Status of the application - Not Started, In-Progress, Complete.</p>
 */
@property (nonatomic, assign) AWSmghApplicationStatus status;

/**
 <p>The timestamp when the application state changed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateDateTime;

@end

/**
 
 */
@interface AWSmghNotifyApplicationStateResult : AWSModel


@end

/**
 
 */
@interface AWSmghNotifyMigrationTaskStateRequest : AWSRequest


/**
 <p>Optional boolean flag to indicate whether any effect should take place. Used to test if the caller has permission to make the call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>Unique identifier that references the migration task. <i>Do not store personal data in this field.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable migrationTaskName;

/**
 <p>Number of seconds after the UpdateDateTime within which the Migration Hub can expect an update. If Migration Hub does not receive an update within the specified interval, then the migration task will be considered stale.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable nextUpdateSeconds;

/**
 <p>The name of the ProgressUpdateStream. </p>
 */
@property (nonatomic, strong) NSString * _Nullable progressUpdateStream;

/**
 <p>Information about the task's progress and status.</p>
 */
@property (nonatomic, strong) AWSmghTask * _Nullable task;

/**
 <p>The timestamp when the task was gathered.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateDateTime;

@end

/**
 
 */
@interface AWSmghNotifyMigrationTaskStateResult : AWSModel


@end

/**
 <p>Summary of the AWS resource used for access control that is implicitly linked to your AWS account.</p>
 */
@interface AWSmghProgressUpdateStreamSummary : AWSModel


/**
 <p>The name of the ProgressUpdateStream. <i>Do not store personal data in this field.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable progressUpdateStreamName;

@end

/**
 
 */
@interface AWSmghPutResourceAttributesRequest : AWSRequest


/**
 <p>Optional boolean flag to indicate whether any effect should take place. Used to test if the caller has permission to make the call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>Unique identifier that references the migration task. <i>Do not store personal data in this field.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable migrationTaskName;

/**
 <p>The name of the ProgressUpdateStream. </p>
 */
@property (nonatomic, strong) NSString * _Nullable progressUpdateStream;

/**
 <p>Information about the resource that is being migrated. This data will be used to map the task to a resource in the Application Discovery Service repository.</p><note><p>Takes the object array of <code>ResourceAttribute</code> where the <code>Type</code> field is reserved for the following values: <code>IPV4_ADDRESS | IPV6_ADDRESS | MAC_ADDRESS | FQDN | VM_MANAGER_ID | VM_MANAGED_OBJECT_REFERENCE | VM_NAME | VM_PATH | BIOS_ID | MOTHERBOARD_SERIAL_NUMBER</code> where the identifying value can be a string up to 256 characters.</p></note><important><ul><li><p>If any "VM" related value is set for a <code>ResourceAttribute</code> object, it is required that <code>VM_MANAGER_ID</code>, as a minimum, is always set. If <code>VM_MANAGER_ID</code> is not set, then all "VM" fields will be discarded and "VM" fields will not be used for matching the migration task to a server in Application Discovery Service repository. See the <a href="https://docs.aws.amazon.com/migrationhub/latest/ug/API_PutResourceAttributes.html#API_PutResourceAttributes_Examples">Example</a> section below for a use case of specifying "VM" related values.</p></li><li><p> If a server you are trying to match has multiple IP or MAC addresses, you should provide as many as you know in separate type/value pairs passed to the <code>ResourceAttributeList</code> parameter to maximize the chances of matching.</p></li></ul></important>
 */
@property (nonatomic, strong) NSArray<AWSmghResourceAttribute *> * _Nullable resourceAttributeList;

@end

/**
 
 */
@interface AWSmghPutResourceAttributesResult : AWSModel


@end

/**
 <p>Attribute associated with a resource.</p><p>Note the corresponding format required per type listed below:</p><dl><dt>IPV4</dt><dd><p><code>x.x.x.x</code></p><p><i>where x is an integer in the range [0,255]</i></p></dd><dt>IPV6</dt><dd><p><code>y : y : y : y : y : y : y : y</code></p><p><i>where y is a hexadecimal between 0 and FFFF. [0, FFFF]</i></p></dd><dt>MAC_ADDRESS</dt><dd><p><code>^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$</code></p></dd><dt>FQDN</dt><dd><p><code>^[^&lt;&gt;{}\\\\/?,=\\p{Cntrl}]{1,256}$</code></p></dd></dl>
 Required parameters: [Type, Value]
 */
@interface AWSmghResourceAttribute : AWSModel


/**
 <p>Type of resource.</p>
 */
@property (nonatomic, assign) AWSmghResourceAttributeType types;

/**
 <p>Value of the resource type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Task object encapsulating task information.</p>
 Required parameters: [Status]
 */
@interface AWSmghTask : AWSModel


/**
 <p>Indication of the percentage completion of the task.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable progressPercent;

/**
 <p>Status of the task - Not Started, In-Progress, Complete.</p>
 */
@property (nonatomic, assign) AWSmghStatus status;

/**
 <p>Details of task status as notified by a migration tool. A tool might use this field to provide clarifying information about the status that is unique to that tool or that explains an error state.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusDetail;

@end

NS_ASSUME_NONNULL_END
