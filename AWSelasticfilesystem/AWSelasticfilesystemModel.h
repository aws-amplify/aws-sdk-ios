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

FOUNDATION_EXPORT NSString *const AWSelasticfilesystemErrorDomain;

typedef NS_ENUM(NSInteger, AWSelasticfilesystemErrorType) {
    AWSelasticfilesystemErrorUnknown,
    AWSelasticfilesystemErrorAccessPointAlreadyExists,
    AWSelasticfilesystemErrorAccessPointLimitExceeded,
    AWSelasticfilesystemErrorAccessPointNotFound,
    AWSelasticfilesystemErrorBadRequest,
    AWSelasticfilesystemErrorDependencyTimeout,
    AWSelasticfilesystemErrorFileSystemAlreadyExists,
    AWSelasticfilesystemErrorFileSystemInUse,
    AWSelasticfilesystemErrorFileSystemLimitExceeded,
    AWSelasticfilesystemErrorFileSystemNotFound,
    AWSelasticfilesystemErrorIncorrectFileSystemLifeCycleState,
    AWSelasticfilesystemErrorIncorrectMountTargetState,
    AWSelasticfilesystemErrorInsufficientThroughputCapacity,
    AWSelasticfilesystemErrorInternalServer,
    AWSelasticfilesystemErrorInvalidPolicy,
    AWSelasticfilesystemErrorIpAddressInUse,
    AWSelasticfilesystemErrorMountTargetConflict,
    AWSelasticfilesystemErrorMountTargetNotFound,
    AWSelasticfilesystemErrorNetworkInterfaceLimitExceeded,
    AWSelasticfilesystemErrorNoFreeAddressesInSubnet,
    AWSelasticfilesystemErrorPolicyNotFound,
    AWSelasticfilesystemErrorSecurityGroupLimitExceeded,
    AWSelasticfilesystemErrorSecurityGroupNotFound,
    AWSelasticfilesystemErrorSubnetNotFound,
    AWSelasticfilesystemErrorThroughputLimitExceeded,
    AWSelasticfilesystemErrorTooManyRequests,
    AWSelasticfilesystemErrorUnsupportedAvailabilityZone,
};

typedef NS_ENUM(NSInteger, AWSelasticfilesystemLifeCycleState) {
    AWSelasticfilesystemLifeCycleStateUnknown,
    AWSelasticfilesystemLifeCycleStateCreating,
    AWSelasticfilesystemLifeCycleStateAvailable,
    AWSelasticfilesystemLifeCycleStateUpdating,
    AWSelasticfilesystemLifeCycleStateDeleting,
    AWSelasticfilesystemLifeCycleStateDeleted,
};

typedef NS_ENUM(NSInteger, AWSelasticfilesystemPerformanceMode) {
    AWSelasticfilesystemPerformanceModeUnknown,
    AWSelasticfilesystemPerformanceModeGeneralPurpose,
    AWSelasticfilesystemPerformanceModeMaxIO,
};

typedef NS_ENUM(NSInteger, AWSelasticfilesystemThroughputMode) {
    AWSelasticfilesystemThroughputModeUnknown,
    AWSelasticfilesystemThroughputModeBursting,
    AWSelasticfilesystemThroughputModeProvisioned,
};

typedef NS_ENUM(NSInteger, AWSelasticfilesystemTransitionToIARules) {
    AWSelasticfilesystemTransitionToIARulesUnknown,
    AWSelasticfilesystemTransitionToIARulesAfter7Days,
    AWSelasticfilesystemTransitionToIARulesAfter14Days,
    AWSelasticfilesystemTransitionToIARulesAfter30Days,
    AWSelasticfilesystemTransitionToIARulesAfter60Days,
    AWSelasticfilesystemTransitionToIARulesAfter90Days,
};

@class AWSelasticfilesystemAccessPointDescription;
@class AWSelasticfilesystemCreateAccessPointRequest;
@class AWSelasticfilesystemCreateFileSystemRequest;
@class AWSelasticfilesystemCreateMountTargetRequest;
@class AWSelasticfilesystemCreateTagsRequest;
@class AWSelasticfilesystemCreationInfo;
@class AWSelasticfilesystemDeleteAccessPointRequest;
@class AWSelasticfilesystemDeleteFileSystemPolicyRequest;
@class AWSelasticfilesystemDeleteFileSystemRequest;
@class AWSelasticfilesystemDeleteMountTargetRequest;
@class AWSelasticfilesystemDeleteTagsRequest;
@class AWSelasticfilesystemDescribeAccessPointsRequest;
@class AWSelasticfilesystemDescribeAccessPointsResponse;
@class AWSelasticfilesystemDescribeFileSystemPolicyRequest;
@class AWSelasticfilesystemDescribeFileSystemsRequest;
@class AWSelasticfilesystemDescribeFileSystemsResponse;
@class AWSelasticfilesystemDescribeLifecycleConfigurationRequest;
@class AWSelasticfilesystemDescribeMountTargetSecurityGroupsRequest;
@class AWSelasticfilesystemDescribeMountTargetSecurityGroupsResponse;
@class AWSelasticfilesystemDescribeMountTargetsRequest;
@class AWSelasticfilesystemDescribeMountTargetsResponse;
@class AWSelasticfilesystemDescribeTagsRequest;
@class AWSelasticfilesystemDescribeTagsResponse;
@class AWSelasticfilesystemFileSystemDescription;
@class AWSelasticfilesystemFileSystemPolicyDescription;
@class AWSelasticfilesystemFileSystemSize;
@class AWSelasticfilesystemLifecycleConfigurationDescription;
@class AWSelasticfilesystemLifecyclePolicy;
@class AWSelasticfilesystemListTagsForResourceRequest;
@class AWSelasticfilesystemListTagsForResourceResponse;
@class AWSelasticfilesystemModifyMountTargetSecurityGroupsRequest;
@class AWSelasticfilesystemMountTargetDescription;
@class AWSelasticfilesystemPosixUser;
@class AWSelasticfilesystemPutFileSystemPolicyRequest;
@class AWSelasticfilesystemPutLifecycleConfigurationRequest;
@class AWSelasticfilesystemRootDirectory;
@class AWSelasticfilesystemTag;
@class AWSelasticfilesystemTagResourceRequest;
@class AWSelasticfilesystemUntagResourceRequest;
@class AWSelasticfilesystemUpdateFileSystemRequest;

/**
 <p>Provides a description of an EFS file system access point.</p>
 */
@interface AWSelasticfilesystemAccessPointDescription : AWSModel


/**
 <p>The unique Amazon Resource Name (ARN) associated with the access point.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessPointArn;

/**
 <p>The ID of the access point, assigned by Amazon EFS.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessPointId;

/**
 <p>The opaque string specified in the request to ensure idempotent creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The ID of the EFS file system that the access point applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

/**
 <p>Identifies the lifecycle phase of the access point.</p>
 */
@property (nonatomic, assign) AWSelasticfilesystemLifeCycleState lifeCycleState;

/**
 <p>The name of the access point. This is the value of the <code>Name</code> tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Identified the AWS account that owns the access point resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerId;

/**
 <p>The full POSIX identity, including the user ID, group ID, and secondary group IDs on the access point that is used for all file operations by NFS clients using the access point.</p>
 */
@property (nonatomic, strong) AWSelasticfilesystemPosixUser * _Nullable posixUser;

/**
 <p>The directory on the Amazon EFS file system that the access point exposes as the root directory to NFS clients using the access point.</p>
 */
@property (nonatomic, strong) AWSelasticfilesystemRootDirectory * _Nullable rootDirectory;

/**
 <p>The tags associated with the access point, presented as an array of Tag objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSelasticfilesystemTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSelasticfilesystemCreateAccessPointRequest : AWSRequest


/**
 <p>A string of up to 64 ASCII characters that Amazon EFS uses to ensure idempotent creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The ID of the EFS file system that the access point provides access to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

/**
 <p>The operating system user and group applied to all file system requests made using the access point.</p>
 */
@property (nonatomic, strong) AWSelasticfilesystemPosixUser * _Nullable posixUser;

/**
 <p>Specifies the directory on the Amazon EFS file system that the access point exposes as the root directory of your file system to NFS clients using the access point. The clients using the access point can only access the root directory and below. If the <code>RootDirectory</code> &gt; <code>Path</code> specified does not exist, EFS creates it and applies the <code>CreationInfo</code> settings when a client connects to an access point. When specifying a <code>RootDirectory</code>, you need to provide the <code>Path</code>, and the <code>CreationInfo</code> is optional.</p>
 */
@property (nonatomic, strong) AWSelasticfilesystemRootDirectory * _Nullable rootDirectory;

/**
 <p>Creates tags associated with the access point. Each tag is a key-value pair.</p>
 */
@property (nonatomic, strong) NSArray<AWSelasticfilesystemTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSelasticfilesystemCreateFileSystemRequest : AWSRequest


/**
 <p>A string of up to 64 ASCII characters. Amazon EFS uses this to ensure idempotent creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationToken;

/**
 <p>A Boolean value that, if true, creates an encrypted file system. When creating an encrypted file system, you have the option of specifying <a>CreateFileSystemRequest$KmsKeyId</a> for an existing AWS Key Management Service (AWS KMS) customer master key (CMK). If you don't specify a CMK, then the default CMK for Amazon EFS, <code>/aws/elasticfilesystem</code>, is used to protect the encrypted file system. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable encrypted;

/**
 <p>The ID of the AWS KMS CMK to be used to protect the encrypted file system. This parameter is only required if you want to use a nondefault CMK. If this parameter is not specified, the default CMK for Amazon EFS is used. This ID can be in one of the following formats:</p><ul><li><p>Key ID - A unique identifier of the key, for example <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>.</p></li><li><p>ARN - An Amazon Resource Name (ARN) for the key, for example <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.</p></li><li><p>Key alias - A previously created display name for a key, for example <code>alias/projectKey1</code>.</p></li><li><p>Key alias ARN - An ARN for a key alias, for example <code>arn:aws:kms:us-west-2:444455556666:alias/projectKey1</code>.</p></li></ul><p>If <code>KmsKeyId</code> is specified, the <a>CreateFileSystemRequest$Encrypted</a> parameter must be set to true.</p><important><p>EFS accepts only symmetric CMKs. You cannot use asymmetric CMKs with EFS file systems.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The performance mode of the file system. We recommend <code>generalPurpose</code> performance mode for most file systems. File systems using the <code>maxIO</code> performance mode can scale to higher levels of aggregate throughput and operations per second with a tradeoff of slightly higher latencies for most file operations. The performance mode can't be changed after the file system has been created.</p>
 */
@property (nonatomic, assign) AWSelasticfilesystemPerformanceMode performanceMode;

/**
 <p>The throughput, measured in MiB/s, that you want to provision for a file system that you're creating. Valid values are 1-1024. Required if <code>ThroughputMode</code> is set to <code>provisioned</code>. The upper limit for throughput is 1024 MiB/s. You can get this limit increased by contacting AWS Support. For more information, see <a href="https://docs.aws.amazon.com/efs/latest/ug/limits.html#soft-limits">Amazon EFS Limits That You Can Increase</a> in the <i>Amazon EFS User Guide.</i></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable provisionedThroughputInMibps;

/**
 <p>A value that specifies to create one or more tags associated with the file system. Each tag is a user-defined key-value pair. Name your file system on creation by including a <code>"Key":"Name","Value":"{value}"</code> key-value pair.</p>
 */
@property (nonatomic, strong) NSArray<AWSelasticfilesystemTag *> * _Nullable tags;

/**
 <p>The throughput mode for the file system to be created. There are two throughput modes to choose from for your file system: <code>bursting</code> and <code>provisioned</code>. If you set <code>ThroughputMode</code> to <code>provisioned</code>, you must also set a value for <code>ProvisionedThroughPutInMibps</code>. You can decrease your file system's throughput in Provisioned Throughput mode or change between the throughput modes as long as it’s been more than 24 hours since the last decrease or throughput mode change. For more, see <a href="https://docs.aws.amazon.com/efs/latest/ug/performance.html#provisioned-throughput">Specifying Throughput with Provisioned Mode</a> in the <i>Amazon EFS User Guide.</i></p>
 */
@property (nonatomic, assign) AWSelasticfilesystemThroughputMode throughputMode;

@end

/**
 <p/>
 Required parameters: [FileSystemId, SubnetId]
 */
@interface AWSelasticfilesystemCreateMountTargetRequest : AWSRequest


/**
 <p>The ID of the file system for which to create the mount target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

/**
 <p>Valid IPv4 address within the address range of the specified subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipAddress;

/**
 <p>Up to five VPC security group IDs, of the form <code>sg-xxxxxxxx</code>. These must be for the same VPC as subnet specified.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

/**
 <p>The ID of the subnet to add the mount target in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

@end

/**
 <p/>
 Required parameters: [FileSystemId, Tags]
 */
@interface AWSelasticfilesystemCreateTagsRequest : AWSRequest


/**
 <p>The ID of the file system whose tags you want to modify (String). This operation modifies the tags only, not the file system.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

/**
 <p>An array of <code>Tag</code> objects to add. Each <code>Tag</code> object is a key-value pair. </p>
 */
@property (nonatomic, strong) NSArray<AWSelasticfilesystemTag *> * _Nullable tags;

@end

/**
 <p>Required if the <code>RootDirectory</code> &gt; <code>Path</code> specified does not exist. Specifies the POSIX IDs and permissions to apply to the access point's <code>RootDirectory</code> &gt; <code>Path</code>. If the access point root directory does not exist, EFS creates it with these settings when a client connects to the access point. When specifying <code>CreationInfo</code>, you must include values for all properties. </p><important><p>If you do not provide <code>CreationInfo</code> and the specified <code>RootDirectory</code> does not exist, attempts to mount the file system using the access point will fail.</p></important>
 Required parameters: [OwnerUid, OwnerGid, Permissions]
 */
@interface AWSelasticfilesystemCreationInfo : AWSModel


/**
 <p>Specifies the POSIX group ID to apply to the <code>RootDirectory</code>. Accepts values from 0 to 2^32 (4294967295).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ownerGid;

/**
 <p>Specifies the POSIX user ID to apply to the <code>RootDirectory</code>. Accepts values from 0 to 2^32 (4294967295).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ownerUid;

/**
 <p>Specifies the POSIX permissions to apply to the <code>RootDirectory</code>, in the format of an octal number representing the file's mode bits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable permissions;

@end

/**
 
 */
@interface AWSelasticfilesystemDeleteAccessPointRequest : AWSRequest


/**
 <p>The ID of the access point that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessPointId;

@end

/**
 
 */
@interface AWSelasticfilesystemDeleteFileSystemPolicyRequest : AWSRequest


/**
 <p>Specifies the EFS file system for which to delete the <code>FileSystemPolicy</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

@end

/**
 <p/>
 Required parameters: [FileSystemId]
 */
@interface AWSelasticfilesystemDeleteFileSystemRequest : AWSRequest


/**
 <p>The ID of the file system you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

@end

/**
 <p/>
 Required parameters: [MountTargetId]
 */
@interface AWSelasticfilesystemDeleteMountTargetRequest : AWSRequest


/**
 <p>The ID of the mount target to delete (String).</p>
 */
@property (nonatomic, strong) NSString * _Nullable mountTargetId;

@end

/**
 <p/>
 Required parameters: [FileSystemId, TagKeys]
 */
@interface AWSelasticfilesystemDeleteTagsRequest : AWSRequest


/**
 <p>The ID of the file system whose tags you want to delete (String).</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

/**
 <p>A list of tag keys to delete.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSelasticfilesystemDescribeAccessPointsRequest : AWSRequest


/**
 <p>(Optional) Specifies an EFS access point to describe in the response; mutually exclusive with <code>FileSystemId</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessPointId;

/**
 <p>(Optional) If you provide a <code>FileSystemId</code>, EFS returns all access points for that file system; mutually exclusive with <code>AccessPointId</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

/**
 <p>(Optional) When retrieving all access points for a file system, you can optionally specify the <code>MaxItems</code> parameter to limit the number of objects returned in a response. The default value is 100. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p><code>NextToken</code> is present if the response is paginated. You can use <code>NextMarker</code> in the subsequent request to fetch the next page of access point descriptions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSelasticfilesystemDescribeAccessPointsResponse : AWSModel


/**
 <p>An array of access point descriptions.</p>
 */
@property (nonatomic, strong) NSArray<AWSelasticfilesystemAccessPointDescription *> * _Nullable accessPoints;

/**
 <p>Present if there are more access points than returned in the response. You can use the NextMarker in the subsequent request to fetch the additional descriptions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSelasticfilesystemDescribeFileSystemPolicyRequest : AWSRequest


/**
 <p>Specifies which EFS file system to retrieve the <code>FileSystemPolicy</code> for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

@end

/**
 <p/>
 */
@interface AWSelasticfilesystemDescribeFileSystemsRequest : AWSRequest


/**
 <p>(Optional) Restricts the list to the file system with this creation token (String). You specify a creation token when you create an Amazon EFS file system.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationToken;

/**
 <p>(Optional) ID of the file system whose description you want to retrieve (String).</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

/**
 <p>(Optional) Opaque pagination token returned from a previous <code>DescribeFileSystems</code> operation (String). If present, specifies to continue the list from where the returning call had left off. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>(Optional) Specifies the maximum number of file systems to return in the response (integer). This number is automatically set to 100. The response is paginated at 100 per page if you have more than 100 file systems. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

@end

/**
 
 */
@interface AWSelasticfilesystemDescribeFileSystemsResponse : AWSModel


/**
 <p>An array of file system descriptions.</p>
 */
@property (nonatomic, strong) NSArray<AWSelasticfilesystemFileSystemDescription *> * _Nullable fileSystems;

/**
 <p>Present if provided by caller in the request (String).</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Present if there are more file systems than returned in the response (String). You can use the <code>NextMarker</code> in the subsequent request to fetch the descriptions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSelasticfilesystemDescribeLifecycleConfigurationRequest : AWSRequest


/**
 <p>The ID of the file system whose <code>LifecycleConfiguration</code> object you want to retrieve (String).</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

@end

/**
 <p/>
 Required parameters: [MountTargetId]
 */
@interface AWSelasticfilesystemDescribeMountTargetSecurityGroupsRequest : AWSRequest


/**
 <p>The ID of the mount target whose security groups you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mountTargetId;

@end

/**
 
 */
@interface AWSelasticfilesystemDescribeMountTargetSecurityGroupsResponse : AWSModel


/**
 <p>An array of security groups.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

@end

/**
 <p/>
 */
@interface AWSelasticfilesystemDescribeMountTargetsRequest : AWSRequest


/**
 <p>(Optional) The ID of the access point whose mount targets that you want to list. It must be included in your request if a <code>FileSystemId</code> or <code>MountTargetId</code> is not included in your request. Accepts either an access point ID or ARN as input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessPointId;

/**
 <p>(Optional) ID of the file system whose mount targets you want to list (String). It must be included in your request if an <code>AccessPointId</code> or <code>MountTargetId</code> is not included. Accepts either a file system ID or ARN as input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

/**
 <p>(Optional) Opaque pagination token returned from a previous <code>DescribeMountTargets</code> operation (String). If present, it specifies to continue the list from where the previous returning call left off.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>(Optional) Maximum number of mount targets to return in the response. Currently, this number is automatically set to 10, and other values are ignored. The response is paginated at 100 per page if you have more than 100 mount targets.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>(Optional) ID of the mount target that you want to have described (String). It must be included in your request if <code>FileSystemId</code> is not included. Accepts either a mount target ID or ARN as input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mountTargetId;

@end

/**
 <p/>
 */
@interface AWSelasticfilesystemDescribeMountTargetsResponse : AWSModel


/**
 <p>If the request included the <code>Marker</code>, the response returns that value in this field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Returns the file system's mount targets as an array of <code>MountTargetDescription</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSelasticfilesystemMountTargetDescription *> * _Nullable mountTargets;

/**
 <p>If a value is present, there are more mount targets to return. In a subsequent request, you can provide <code>Marker</code> in your request with this value to retrieve the next set of mount targets.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 <p/>
 Required parameters: [FileSystemId]
 */
@interface AWSelasticfilesystemDescribeTagsRequest : AWSRequest


/**
 <p>The ID of the file system whose tag set you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

/**
 <p>(Optional) An opaque pagination token returned from a previous <code>DescribeTags</code> operation (String). If present, it specifies to continue the list from where the previous call left off.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>(Optional) The maximum number of file system tags to return in the response. Currently, this number is automatically set to 100, and other values are ignored. The response is paginated at 100 per page if you have more than 100 tags.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

@end

/**
 <p/>
 Required parameters: [Tags]
 */
@interface AWSelasticfilesystemDescribeTagsResponse : AWSModel


/**
 <p>If the request included a <code>Marker</code>, the response returns that value in this field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>If a value is present, there are more tags to return. In a subsequent request, you can provide the value of <code>NextMarker</code> as the value of the <code>Marker</code> parameter in your next request to retrieve the next set of tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>Returns tags associated with the file system as an array of <code>Tag</code> objects. </p>
 */
@property (nonatomic, strong) NSArray<AWSelasticfilesystemTag *> * _Nullable tags;

@end

/**
 <p>A description of the file system.</p>
 Required parameters: [OwnerId, CreationToken, FileSystemId, CreationTime, LifeCycleState, NumberOfMountTargets, SizeInBytes, PerformanceMode, Tags]
 */
@interface AWSelasticfilesystemFileSystemDescription : AWSModel


/**
 <p>The time that the file system was created, in seconds (since 1970-01-01T00:00:00Z).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The opaque string specified in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationToken;

/**
 <p>A Boolean value that, if true, indicates that the file system is encrypted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable encrypted;

/**
 <p>The ID of the file system, assigned by Amazon EFS.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

/**
 <p>The ID of an AWS Key Management Service (AWS KMS) customer master key (CMK) that was used to protect the encrypted file system.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The lifecycle phase of the file system.</p>
 */
@property (nonatomic, assign) AWSelasticfilesystemLifeCycleState lifeCycleState;

/**
 <p>You can add tags to a file system, including a <code>Name</code> tag. For more information, see <a>CreateFileSystem</a>. If the file system has a <code>Name</code> tag, Amazon EFS returns the value in this field. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The current number of mount targets that the file system has. For more information, see <a>CreateMountTarget</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfMountTargets;

/**
 <p>The AWS account that created the file system. If the file system was created by an IAM user, the parent account to which the user belongs is the owner.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerId;

/**
 <p>The performance mode of the file system.</p>
 */
@property (nonatomic, assign) AWSelasticfilesystemPerformanceMode performanceMode;

/**
 <p>The throughput, measured in MiB/s, that you want to provision for a file system. Valid values are 1-1024. Required if <code>ThroughputMode</code> is set to <code>provisioned</code>. The limit on throughput is 1024 MiB/s. You can get these limits increased by contacting AWS Support. For more information, see <a href="https://docs.aws.amazon.com/efs/latest/ug/limits.html#soft-limits">Amazon EFS Limits That You Can Increase</a> in the <i>Amazon EFS User Guide.</i></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable provisionedThroughputInMibps;

/**
 <p>The latest known metered size (in bytes) of data stored in the file system, in its <code>Value</code> field, and the time at which that size was determined in its <code>Timestamp</code> field. The <code>Timestamp</code> value is the integer number of seconds since 1970-01-01T00:00:00Z. The <code>SizeInBytes</code> value doesn't represent the size of a consistent snapshot of the file system, but it is eventually consistent when there are no writes to the file system. That is, <code>SizeInBytes</code> represents actual size only if the file system is not modified for a period longer than a couple of hours. Otherwise, the value is not the exact size that the file system was at any point in time. </p>
 */
@property (nonatomic, strong) AWSelasticfilesystemFileSystemSize * _Nullable sizeInBytes;

/**
 <p>The tags associated with the file system, presented as an array of <code>Tag</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSelasticfilesystemTag *> * _Nullable tags;

/**
 <p>The throughput mode for a file system. There are two throughput modes to choose from for your file system: <code>bursting</code> and <code>provisioned</code>. If you set <code>ThroughputMode</code> to <code>provisioned</code>, you must also set a value for <code>ProvisionedThroughPutInMibps</code>. You can decrease your file system's throughput in Provisioned Throughput mode or change between the throughput modes as long as it’s been more than 24 hours since the last decrease or throughput mode change. </p>
 */
@property (nonatomic, assign) AWSelasticfilesystemThroughputMode throughputMode;

@end

/**
 
 */
@interface AWSelasticfilesystemFileSystemPolicyDescription : AWSModel


/**
 <p>Specifies the EFS file system to which the <code>FileSystemPolicy</code> applies.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

/**
 <p>The JSON formatted <code>FileSystemPolicy</code> for the EFS file system.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

@end

/**
 <p>The latest known metered size (in bytes) of data stored in the file system, in its <code>Value</code> field, and the time at which that size was determined in its <code>Timestamp</code> field. The value doesn't represent the size of a consistent snapshot of the file system, but it is eventually consistent when there are no writes to the file system. That is, the value represents the actual size only if the file system is not modified for a period longer than a couple of hours. Otherwise, the value is not necessarily the exact size the file system was at any instant in time.</p>
 Required parameters: [Value]
 */
@interface AWSelasticfilesystemFileSystemSize : AWSModel


/**
 <p>The time at which the size of data, returned in the <code>Value</code> field, was determined. The value is the integer number of seconds since 1970-01-01T00:00:00Z.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

/**
 <p>The latest known metered size (in bytes) of data stored in the file system.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

/**
 <p>The latest known metered size (in bytes) of data stored in the Infrequent Access storage class.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable valueInIA;

/**
 <p>The latest known metered size (in bytes) of data stored in the Standard storage class.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable valueInStandard;

@end

/**
 
 */
@interface AWSelasticfilesystemLifecycleConfigurationDescription : AWSModel


/**
 <p>An array of lifecycle management policies. Currently, EFS supports a maximum of one policy per file system.</p>
 */
@property (nonatomic, strong) NSArray<AWSelasticfilesystemLifecyclePolicy *> * _Nullable lifecyclePolicies;

@end

/**
 <p>Describes a policy used by EFS lifecycle management to transition files to the Infrequent Access (IA) storage class.</p>
 */
@interface AWSelasticfilesystemLifecyclePolicy : AWSModel


/**
 <p> A value that describes the period of time that a file is not accessed, after which it transitions to the IA storage class. Metadata operations such as listing the contents of a directory don't count as file access events.</p>
 */
@property (nonatomic, assign) AWSelasticfilesystemTransitionToIARules transitionToIA;

@end

/**
 
 */
@interface AWSelasticfilesystemListTagsForResourceRequest : AWSRequest


/**
 <p>(Optional) Specifies the maximum number of tag objects to return in the response. The default value is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>You can use <code>NextToken</code> in a subsequent request to fetch the next page of access point descriptions if the response payload was paginated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Specifies the EFS resource you want to retrieve tags for. You can retrieve tags for EFS file systems and access points using this API endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

@end

/**
 
 */
@interface AWSelasticfilesystemListTagsForResourceResponse : AWSModel


/**
 <p><code>NextToken</code> is present if the response payload is paginated. You can use <code>NextToken</code> in a subsequent request to fetch the next page of access point descriptions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of the tags for the specified EFS resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSelasticfilesystemTag *> * _Nullable tags;

@end

/**
 <p/>
 Required parameters: [MountTargetId]
 */
@interface AWSelasticfilesystemModifyMountTargetSecurityGroupsRequest : AWSRequest


/**
 <p>The ID of the mount target whose security groups you want to modify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mountTargetId;

/**
 <p>An array of up to five VPC security group IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

@end

/**
 <p>Provides a description of a mount target.</p>
 Required parameters: [MountTargetId, FileSystemId, SubnetId, LifeCycleState]
 */
@interface AWSelasticfilesystemMountTargetDescription : AWSModel


/**
 <p>The unique and consistent identifier of the Availability Zone (AZ) that the mount target resides in. For example, <code>use1-az1</code> is an AZ ID for the us-east-1 Region and it has the same location in every AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZoneId;

/**
 <p>The name of the Availability Zone (AZ) that the mount target resides in. AZs are independently mapped to names for each AWS account. For example, the Availability Zone <code>us-east-1a</code> for your AWS account might not be the same location as <code>us-east-1a</code> for another AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZoneName;

/**
 <p>The ID of the file system for which the mount target is intended.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

/**
 <p>Address at which the file system can be mounted by using the mount target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipAddress;

/**
 <p>Lifecycle state of the mount target.</p>
 */
@property (nonatomic, assign) AWSelasticfilesystemLifeCycleState lifeCycleState;

/**
 <p>System-assigned mount target ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mountTargetId;

/**
 <p>The ID of the network interface that Amazon EFS created when it created the mount target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>AWS account ID that owns the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerId;

/**
 <p>The ID of the mount target's subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

@end

/**
 <p>The full POSIX identity, including the user ID, group ID, and any secondary group IDs, on the access point that is used for all file system operations performed by NFS clients using the access point.</p>
 Required parameters: [Uid, Gid]
 */
@interface AWSelasticfilesystemPosixUser : AWSModel


/**
 <p>The POSIX group ID used for all file system operations using this access point.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable gid;

/**
 <p>Secondary POSIX group IDs used for all file system operations using this access point.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable secondaryGids;

/**
 <p>The POSIX user ID used for all file system operations using this access point.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable uid;

@end

/**
 
 */
@interface AWSelasticfilesystemPutFileSystemPolicyRequest : AWSRequest


/**
 <p>(Optional) A flag to indicate whether to bypass the <code>FileSystemPolicy</code> lockout safety check. The policy lockout safety check determines whether the policy in the request will prevent the principal making the request will be locked out from making future <code>PutFileSystemPolicy</code> requests on the file system. Set <code>BypassPolicyLockoutSafetyCheck</code> to <code>True</code> only when you intend to prevent the principal that is making the request from making a subsequent <code>PutFileSystemPolicy</code> request on the file system. The default value is False. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bypassPolicyLockoutSafetyCheck;

/**
 <p>The ID of the EFS file system that you want to create or update the <code>FileSystemPolicy</code> for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

/**
 <p>The <code>FileSystemPolicy</code> that you're creating. Accepts a JSON formatted policy definition. To find out more about the elements that make up a file system policy, see <a href="https://docs.aws.amazon.com/efs/latest/ug/access-control-overview.html#access-control-manage-access-intro-resource-policies">EFS Resource-based Policies</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

@end

/**
 
 */
@interface AWSelasticfilesystemPutLifecycleConfigurationRequest : AWSRequest


/**
 <p>The ID of the file system for which you are creating the <code>LifecycleConfiguration</code> object (String).</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

/**
 <p>An array of <code>LifecyclePolicy</code> objects that define the file system's <code>LifecycleConfiguration</code> object. A <code>LifecycleConfiguration</code> object tells lifecycle management when to transition files from the Standard storage class to the Infrequent Access storage class.</p>
 */
@property (nonatomic, strong) NSArray<AWSelasticfilesystemLifecyclePolicy *> * _Nullable lifecyclePolicies;

@end

/**
 <p>Specifies the directory on the Amazon EFS file system that the access point provides access to. The access point exposes the specified file system path as the root directory of your file system to applications using the access point. NFS clients using the access point can only access data in the access point's <code>RootDirectory</code> and it's subdirectories.</p>
 */
@interface AWSelasticfilesystemRootDirectory : AWSModel


/**
 <p>(Optional) Specifies the POSIX IDs and permissions to apply to the access point's <code>RootDirectory</code>. If the <code>RootDirectory</code> &gt; <code>Path</code> specified does not exist, EFS creates the root directory using the <code>CreationInfo</code> settings when a client connects to an access point. When specifying the <code>CreationInfo</code>, you must provide values for all properties. </p><important><p>If you do not provide <code>CreationInfo</code> and the specified <code>RootDirectory</code> &gt; <code>Path</code> does not exist, attempts to mount the file system using the access point will fail.</p></important>
 */
@property (nonatomic, strong) AWSelasticfilesystemCreationInfo * _Nullable creationInfo;

/**
 <p>Specifies the path on the EFS file system to expose as the root directory to NFS clients using the access point to access the EFS file system. A path can have up to four subdirectories. If the specified path does not exist, you are required to provide the <code>CreationInfo</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

@end

/**
 <p>A tag is a key-value pair. Allowed characters are letters, white space, and numbers that can be represented in UTF-8, and the following characters:<code> + - = . _ : /</code></p>
 Required parameters: [Key, Value]
 */
@interface AWSelasticfilesystemTag : AWSModel


/**
 <p>The tag key (String). The key can't start with <code>aws:</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value of the tag key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSelasticfilesystemTagResourceRequest : AWSRequest


/**
 <p>The ID specifying the EFS resource that you want to create a tag for. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p/>
 */
@property (nonatomic, strong) NSArray<AWSelasticfilesystemTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSelasticfilesystemUntagResourceRequest : AWSRequest


/**
 <p>Specifies the EFS resource that you want to remove tags from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The keys of the key:value tag pairs that you want to remove from the specified EFS resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSelasticfilesystemUpdateFileSystemRequest : AWSRequest


/**
 <p>The ID of the file system that you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

/**
 <p>(Optional) The amount of throughput, in MiB/s, that you want to provision for your file system. Valid values are 1-1024. Required if <code>ThroughputMode</code> is changed to <code>provisioned</code> on update. If you're not updating the amount of provisioned throughput for your file system, you don't need to provide this value in your request. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable provisionedThroughputInMibps;

/**
 <p>(Optional) The throughput mode that you want your file system to use. If you're not updating your throughput mode, you don't need to provide this value in your request. If you are changing the <code>ThroughputMode</code> to <code>provisioned</code>, you must also set a value for <code>ProvisionedThroughputInMibps</code>.</p>
 */
@property (nonatomic, assign) AWSelasticfilesystemThroughputMode throughputMode;

@end

NS_ASSUME_NONNULL_END
