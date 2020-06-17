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

FOUNDATION_EXPORT NSString *const AWSSnowballErrorDomain;

typedef NS_ENUM(NSInteger, AWSSnowballErrorType) {
    AWSSnowballErrorUnknown,
    AWSSnowballErrorClusterLimitExceeded,
    AWSSnowballErrorEc2RequestFailed,
    AWSSnowballErrorInvalidAddress,
    AWSSnowballErrorInvalidInputCombination,
    AWSSnowballErrorInvalidJobState,
    AWSSnowballErrorInvalidNextToken,
    AWSSnowballErrorInvalidResource,
    AWSSnowballErrorKMSRequestFailed,
    AWSSnowballErrorUnsupportedAddress,
};

typedef NS_ENUM(NSInteger, AWSSnowballClusterState) {
    AWSSnowballClusterStateUnknown,
    AWSSnowballClusterStateAwaitingQuorum,
    AWSSnowballClusterStatePending,
    AWSSnowballClusterStateInUse,
    AWSSnowballClusterStateComplete,
    AWSSnowballClusterStateCancelled,
};

typedef NS_ENUM(NSInteger, AWSSnowballJobState) {
    AWSSnowballJobStateUnknown,
    AWSSnowballJobStateNew,
    AWSSnowballJobStatePreparingAppliance,
    AWSSnowballJobStatePreparingShipment,
    AWSSnowballJobStateInTransitToCustomer,
    AWSSnowballJobStateWithCustomer,
    AWSSnowballJobStateInTransitToAWS,
    AWSSnowballJobStateWithAWSSortingFacility,
    AWSSnowballJobStateWithAWS,
    AWSSnowballJobStateInProgress,
    AWSSnowballJobStateComplete,
    AWSSnowballJobStateCancelled,
    AWSSnowballJobStateListing,
    AWSSnowballJobStatePending,
};

typedef NS_ENUM(NSInteger, AWSSnowballJobType) {
    AWSSnowballJobTypeUnknown,
    AWSSnowballJobTypeImport,
    AWSSnowballJobTypeExport,
    AWSSnowballJobTypeLocalUse,
};

typedef NS_ENUM(NSInteger, AWSSnowballShippingOption) {
    AWSSnowballShippingOptionUnknown,
    AWSSnowballShippingOptionSecondDay,
    AWSSnowballShippingOptionNextDay,
    AWSSnowballShippingOptionExpress,
    AWSSnowballShippingOptionStandard,
};

typedef NS_ENUM(NSInteger, AWSSnowballSnowballCapacity) {
    AWSSnowballSnowballCapacityUnknown,
    AWSSnowballSnowballCapacityT50,
    AWSSnowballSnowballCapacityT80,
    AWSSnowballSnowballCapacityT100,
    AWSSnowballSnowballCapacityT42,
    AWSSnowballSnowballCapacityT98,
    AWSSnowballSnowballCapacityT8,
    AWSSnowballSnowballCapacityNoPreference,
};

typedef NS_ENUM(NSInteger, AWSSnowballSnowballType) {
    AWSSnowballSnowballTypeUnknown,
    AWSSnowballSnowballTypeStandard,
    AWSSnowballSnowballTypeEdge,
    AWSSnowballSnowballTypeEdgeC,
    AWSSnowballSnowballTypeEdgeCg,
    AWSSnowballSnowballTypeEdgeS,
    AWSSnowballSnowballTypeSnc1Hdd,
};

@class AWSSnowballAddress;
@class AWSSnowballCancelClusterRequest;
@class AWSSnowballCancelClusterResult;
@class AWSSnowballCancelJobRequest;
@class AWSSnowballCancelJobResult;
@class AWSSnowballClusterListEntry;
@class AWSSnowballClusterMetadata;
@class AWSSnowballCompatibleImage;
@class AWSSnowballCreateAddressRequest;
@class AWSSnowballCreateAddressResult;
@class AWSSnowballCreateClusterRequest;
@class AWSSnowballCreateClusterResult;
@class AWSSnowballCreateJobRequest;
@class AWSSnowballCreateJobResult;
@class AWSSnowballDataTransfer;
@class AWSSnowballDescribeAddressRequest;
@class AWSSnowballDescribeAddressResult;
@class AWSSnowballDescribeAddressesRequest;
@class AWSSnowballDescribeAddressesResult;
@class AWSSnowballDescribeClusterRequest;
@class AWSSnowballDescribeClusterResult;
@class AWSSnowballDescribeJobRequest;
@class AWSSnowballDescribeJobResult;
@class AWSSnowballDeviceConfiguration;
@class AWSSnowballEc2AmiResource;
@class AWSSnowballEventTriggerDefinition;
@class AWSSnowballGetJobManifestRequest;
@class AWSSnowballGetJobManifestResult;
@class AWSSnowballGetJobUnlockCodeRequest;
@class AWSSnowballGetJobUnlockCodeResult;
@class AWSSnowballGetSnowballUsageRequest;
@class AWSSnowballGetSnowballUsageResult;
@class AWSSnowballGetSoftwareUpdatesRequest;
@class AWSSnowballGetSoftwareUpdatesResult;
@class AWSSnowballINDTaxDocuments;
@class AWSSnowballJobListEntry;
@class AWSSnowballJobLogs;
@class AWSSnowballJobMetadata;
@class AWSSnowballJobResource;
@class AWSSnowballKeyRange;
@class AWSSnowballLambdaResource;
@class AWSSnowballListClusterJobsRequest;
@class AWSSnowballListClusterJobsResult;
@class AWSSnowballListClustersRequest;
@class AWSSnowballListClustersResult;
@class AWSSnowballListCompatibleImagesRequest;
@class AWSSnowballListCompatibleImagesResult;
@class AWSSnowballListJobsRequest;
@class AWSSnowballListJobsResult;
@class AWSSnowballNotification;
@class AWSSnowballS3Resource;
@class AWSSnowballShipment;
@class AWSSnowballShippingDetails;
@class AWSSnowballSnowconeDeviceConfiguration;
@class AWSSnowballTaxDocuments;
@class AWSSnowballUpdateClusterRequest;
@class AWSSnowballUpdateClusterResult;
@class AWSSnowballUpdateJobRequest;
@class AWSSnowballUpdateJobResult;
@class AWSSnowballWirelessConnection;

/**
 <p>The address that you want the Snowball or Snowballs associated with a specific job to be shipped to. Addresses are validated at the time of creation. The address you provide must be located within the serviceable area of your region. Although no individual elements of the <code>Address</code> are required, if the address is invalid or unsupported, then an exception is thrown.</p>
 */
@interface AWSSnowballAddress : AWSModel


/**
 <p>The unique ID for an address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable addressId;

/**
 <p>The city in an address that a Snowball is to be delivered to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable city;

/**
 <p>The name of the company to receive a Snowball at an address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable company;

/**
 <p>The country in an address that a Snowball is to be delivered to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable country;

/**
 <p>If the address you are creating is a primary address, then set this option to true. This field is not supported in most regions.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isRestricted;

/**
 <p>This field is no longer used and the value is ignored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable landmark;

/**
 <p>The name of a person to receive a Snowball at an address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The phone number associated with an address that a Snowball is to be delivered to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumber;

/**
 <p>The postal code in an address that a Snowball is to be delivered to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable postalCode;

/**
 <p>This field is no longer used and the value is ignored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefectureOrDistrict;

/**
 <p>The state or province in an address that a Snowball is to be delivered to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateOrProvince;

/**
 <p>The first line in a street address that a Snowball is to be delivered to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable street1;

/**
 <p>The second line in a street address that a Snowball is to be delivered to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable street2;

/**
 <p>The third line in a street address that a Snowball is to be delivered to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable street3;

@end

/**
 
 */
@interface AWSSnowballCancelClusterRequest : AWSRequest


/**
 <p>The 39-character ID for the cluster that you want to cancel, for example <code>CID123e4567-e89b-12d3-a456-426655440000</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

@end

/**
 
 */
@interface AWSSnowballCancelClusterResult : AWSModel


@end

/**
 
 */
@interface AWSSnowballCancelJobRequest : AWSRequest


/**
 <p>The 39-character job ID for the job that you want to cancel, for example <code>JID123e4567-e89b-12d3-a456-426655440000</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSSnowballCancelJobResult : AWSModel


@end

/**
 <p>Contains a cluster's state, a cluster's ID, and other important information.</p>
 */
@interface AWSSnowballClusterListEntry : AWSModel


/**
 <p>The 39-character ID for the cluster that you want to list, for example <code>CID123e4567-e89b-12d3-a456-426655440000</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

/**
 <p>The current state of this cluster. For information about the state of a specific node, see <a>JobListEntry$JobState</a>.</p>
 */
@property (nonatomic, assign) AWSSnowballClusterState clusterState;

/**
 <p>The creation date for this cluster.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>Defines an optional description of the cluster, for example <code>Environmental Data Cluster-01</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 <p>Contains metadata about a specific cluster.</p>
 */
@interface AWSSnowballClusterMetadata : AWSModel


/**
 <p>The automatically generated ID for a specific address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable addressId;

/**
 <p>The automatically generated ID for a cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

/**
 <p>The current status of the cluster.</p>
 */
@property (nonatomic, assign) AWSSnowballClusterState clusterState;

/**
 <p>The creation date for this cluster.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The optional description of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID of the address that you want a cluster shipped to, after it will be shipped to its primary address. This field is not supported in most regions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable forwardingAddressId;

/**
 <p>The type of job for this cluster. Currently, the only job type supported for clusters is <code>LOCAL_USE</code>.</p>
 */
@property (nonatomic, assign) AWSSnowballJobType jobType;

/**
 <p>The <code>KmsKeyARN</code> Amazon Resource Name (ARN) associated with this cluster. This ARN was created using the <a href="https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html">CreateKey</a> API action in AWS Key Management Service (AWS KMS).</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyARN;

/**
 <p>The Amazon Simple Notification Service (Amazon SNS) notification settings for this cluster.</p>
 */
@property (nonatomic, strong) AWSSnowballNotification * _Nullable notification;

/**
 <p>The arrays of <a>JobResource</a> objects that can include updated <a>S3Resource</a> objects or <a>LambdaResource</a> objects.</p>
 */
@property (nonatomic, strong) AWSSnowballJobResource * _Nullable resources;

/**
 <p>The role ARN associated with this cluster. This ARN was created using the <a href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html">CreateRole</a> API action in AWS Identity and Access Management (IAM).</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

/**
 <p>The shipping speed for each node in this cluster. This speed doesn't dictate how soon you'll get each Snowball Edge device, rather it represents how quickly each device moves to its destination while in transit. Regional shipping speeds are as follows:</p><ul><li><p>In Australia, you have access to express shipping. Typically, devices shipped express are delivered in about a day.</p></li><li><p>In the European Union (EU), you have access to express shipping. Typically, Snowball Edges shipped express are delivered in about a day. In addition, most countries in the EU have access to standard shipping, which typically takes less than a week, one way.</p></li><li><p>In India, Snowball Edges are delivered in one to seven days.</p></li><li><p>In the US, you have access to one-day shipping and two-day shipping.</p></li></ul>
 */
@property (nonatomic, assign) AWSSnowballShippingOption shippingOption;

/**
 <p>The type of AWS Snowball device to use for this cluster. </p><note><p>For cluster jobs, AWS Snowball currently supports only the <code>EDGE</code> device type.</p></note>
 */
@property (nonatomic, assign) AWSSnowballSnowballType snowballType;

/**
 <p>The tax documents required in your AWS Region.</p>
 */
@property (nonatomic, strong) AWSSnowballTaxDocuments * _Nullable taxDocuments;

@end

/**
 <p>A JSON-formatted object that describes a compatible Amazon Machine Image (AMI), including the ID and name for a Snowball Edge AMI. This AMI is compatible with the device's physical hardware requirements, and it should be able to be run in an SBE1 instance on the device.</p>
 */
@interface AWSSnowballCompatibleImage : AWSModel


/**
 <p>The unique identifier for an individual Snowball Edge AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable amiId;

/**
 <p>The optional name of a compatible image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSSnowballCreateAddressRequest : AWSRequest


/**
 <p>The address that you want the Snowball shipped to.</p>
 */
@property (nonatomic, strong) AWSSnowballAddress * _Nullable address;

@end

/**
 
 */
@interface AWSSnowballCreateAddressResult : AWSModel


/**
 <p>The automatically generated ID for a specific address. You'll use this ID when you create a job to specify which address you want the Snowball for that job shipped to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable addressId;

@end

/**
 
 */
@interface AWSSnowballCreateClusterRequest : AWSRequest


/**
 <p>The ID for the address that you want the cluster shipped to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable addressId;

/**
 <p>An optional description of this specific cluster, for example <code>Environmental Data Cluster-01</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The forwarding address ID for a cluster. This field is not supported in most regions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable forwardingAddressId;

/**
 <p>The type of job for this cluster. Currently, the only job type supported for clusters is <code>LOCAL_USE</code>.</p>
 */
@property (nonatomic, assign) AWSSnowballJobType jobType;

/**
 <p>The <code>KmsKeyARN</code> value that you want to associate with this cluster. <code>KmsKeyARN</code> values are created by using the <a href="https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html">CreateKey</a> API action in AWS Key Management Service (AWS KMS). </p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyARN;

/**
 <p>The Amazon Simple Notification Service (Amazon SNS) notification settings for this cluster.</p>
 */
@property (nonatomic, strong) AWSSnowballNotification * _Nullable notification;

/**
 <p>The resources associated with the cluster job. These resources include Amazon S3 buckets and optional AWS Lambda functions written in the Python language. </p>
 */
@property (nonatomic, strong) AWSSnowballJobResource * _Nullable resources;

/**
 <p>The <code>RoleARN</code> that you want to associate with this cluster. <code>RoleArn</code> values are created by using the <a href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html">CreateRole</a> API action in AWS Identity and Access Management (IAM).</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

/**
 <p>The shipping speed for each node in this cluster. This speed doesn't dictate how soon you'll get each Snowball Edge device, rather it represents how quickly each device moves to its destination while in transit. Regional shipping speeds are as follows: </p><ul><li><p>In Australia, you have access to express shipping. Typically, Snowballs shipped express are delivered in about a day.</p></li><li><p>In the European Union (EU), you have access to express shipping. Typically, Snowballs shipped express are delivered in about a day. In addition, most countries in the EU have access to standard shipping, which typically takes less than a week, one way.</p></li><li><p>In India, Snowballs are delivered in one to seven days.</p></li><li><p>In the United States of America (US), you have access to one-day shipping and two-day shipping.</p></li></ul><ul><li><p>In Australia, you have access to express shipping. Typically, devices shipped express are delivered in about a day.</p></li><li><p>In the European Union (EU), you have access to express shipping. Typically, Snowball Edges shipped express are delivered in about a day. In addition, most countries in the EU have access to standard shipping, which typically takes less than a week, one way.</p></li><li><p>In India, Snowball Edges are delivered in one to seven days.</p></li><li><p>In the US, you have access to one-day shipping and two-day shipping.</p></li></ul>
 */
@property (nonatomic, assign) AWSSnowballShippingOption shippingOption;

/**
 <p>The type of AWS Snowball device to use for this cluster. </p><note><p>For cluster jobs, AWS Snowball currently supports only the <code>EDGE</code> device type.</p></note>
 */
@property (nonatomic, assign) AWSSnowballSnowballType snowballType;

/**
 <p>The tax documents required in your AWS Region.</p>
 */
@property (nonatomic, strong) AWSSnowballTaxDocuments * _Nullable taxDocuments;

@end

/**
 
 */
@interface AWSSnowballCreateClusterResult : AWSModel


/**
 <p>The automatically generated ID for a cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

@end

/**
 
 */
@interface AWSSnowballCreateJobRequest : AWSRequest


/**
 <p>The ID for the address that you want the Snowball shipped to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable addressId;

/**
 <p>The ID of a cluster. If you're creating a job for a node in a cluster, you need to provide only this <code>clusterId</code> value. The other job attributes are inherited from the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

/**
 <p>Defines an optional description of this specific job, for example <code>Important Photos 2016-08-11</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Defines the device configuration for an AWS Snowcone job.</p>
 */
@property (nonatomic, strong) AWSSnowballDeviceConfiguration * _Nullable deviceConfiguration;

/**
 <p>The forwarding address ID for a job. This field is not supported in most regions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable forwardingAddressId;

/**
 <p>Defines the type of job that you're creating. </p>
 */
@property (nonatomic, assign) AWSSnowballJobType jobType;

/**
 <p>The <code>KmsKeyARN</code> that you want to associate with this job. <code>KmsKeyARN</code>s are created using the <a href="https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html">CreateKey</a> AWS Key Management Service (KMS) API action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyARN;

/**
 <p>Defines the Amazon Simple Notification Service (Amazon SNS) notification settings for this job.</p>
 */
@property (nonatomic, strong) AWSSnowballNotification * _Nullable notification;

/**
 <p>Defines the Amazon S3 buckets associated with this job.</p><p>With <code>IMPORT</code> jobs, you specify the bucket or buckets that your transferred data will be imported into.</p><p>With <code>EXPORT</code> jobs, you specify the bucket or buckets that your transferred data will be exported from. Optionally, you can also specify a <code>KeyRange</code> value. If you choose to export a range, you define the length of the range by providing either an inclusive <code>BeginMarker</code> value, an inclusive <code>EndMarker</code> value, or both. Ranges are UTF-8 binary sorted.</p>
 */
@property (nonatomic, strong) AWSSnowballJobResource * _Nullable resources;

/**
 <p>The <code>RoleARN</code> that you want to associate with this job. <code>RoleArn</code>s are created using the <a href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html">CreateRole</a> AWS Identity and Access Management (IAM) API action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

/**
 <p>The shipping speed for this job. This speed doesn't dictate how soon you'll get the Snowball, rather it represents how quickly the Snowball moves to its destination while in transit. Regional shipping speeds are as follows:</p><ul><li><p>In Australia, you have access to express shipping. Typically, Snowballs shipped express are delivered in about a day.</p></li><li><p>In the European Union (EU), you have access to express shipping. Typically, Snowballs shipped express are delivered in about a day. In addition, most countries in the EU have access to standard shipping, which typically takes less than a week, one way.</p></li><li><p>In India, Snowballs are delivered in one to seven days.</p></li><li><p>In the US, you have access to one-day shipping and two-day shipping.</p></li></ul>
 */
@property (nonatomic, assign) AWSSnowballShippingOption shippingOption;

/**
 <p>If your job is being created in one of the US regions, you have the option of specifying what size Snowball you'd like for this job. In all other regions, Snowballs come with 80 TB in storage capacity.</p>
 */
@property (nonatomic, assign) AWSSnowballSnowballCapacity snowballCapacityPreference;

/**
 <p>The type of AWS Snowball device to use for this job. </p><note><p>For cluster jobs, AWS Snowball currently supports only the <code>EDGE</code> device type.</p></note><p>The type of AWS Snowball device to use for this job. Currently, the only supported device type for cluster jobs is <code>EDGE</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/snowball/latest/developer-guide/device-differences.html">Snowball Edge Device Options</a> in the Snowball Edge Developer Guide.</p>
 */
@property (nonatomic, assign) AWSSnowballSnowballType snowballType;

/**
 <p>The tax documents required in your AWS Region.</p>
 */
@property (nonatomic, strong) AWSSnowballTaxDocuments * _Nullable taxDocuments;

@end

/**
 
 */
@interface AWSSnowballCreateJobResult : AWSModel


/**
 <p>The automatically generated ID for a job, for example <code>JID123e4567-e89b-12d3-a456-426655440000</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 <p>Defines the real-time status of a Snowball's data transfer while the device is at AWS. This data is only available while a job has a <code>JobState</code> value of <code>InProgress</code>, for both import and export jobs.</p>
 */
@interface AWSSnowballDataTransfer : AWSModel


/**
 <p>The number of bytes transferred between a Snowball and Amazon S3.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bytesTransferred;

/**
 <p>The number of objects transferred between a Snowball and Amazon S3.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable objectsTransferred;

/**
 <p>The total bytes of data for a transfer between a Snowball and Amazon S3. This value is set to 0 (zero) until all the keys that will be transferred have been listed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalBytes;

/**
 <p>The total number of objects for a transfer between a Snowball and Amazon S3. This value is set to 0 (zero) until all the keys that will be transferred have been listed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalObjects;

@end

/**
 
 */
@interface AWSSnowballDescribeAddressRequest : AWSRequest


/**
 <p>The automatically generated ID for a specific address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable addressId;

@end

/**
 
 */
@interface AWSSnowballDescribeAddressResult : AWSModel


/**
 <p>The address that you want the Snowball or Snowballs associated with a specific job to be shipped to.</p>
 */
@property (nonatomic, strong) AWSSnowballAddress * _Nullable address;

@end

/**
 
 */
@interface AWSSnowballDescribeAddressesRequest : AWSRequest


/**
 <p>The number of <code>ADDRESS</code> objects to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>HTTP requests are stateless. To identify what object comes "next" in the list of <code>ADDRESS</code> objects, you have the option of specifying a value for <code>NextToken</code> as the starting point for your list of returned addresses.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSnowballDescribeAddressesResult : AWSModel


/**
 <p>The Snowball shipping addresses that were created for this account.</p>
 */
@property (nonatomic, strong) NSArray<AWSSnowballAddress *> * _Nullable addresses;

/**
 <p>HTTP requests are stateless. If you use the automatically generated <code>NextToken</code> value in your next <code>DescribeAddresses</code> call, your list of returned addresses will start from this point in the array.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSnowballDescribeClusterRequest : AWSRequest


/**
 <p>The automatically generated ID for a cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

@end

/**
 
 */
@interface AWSSnowballDescribeClusterResult : AWSModel


/**
 <p>Information about a specific cluster, including shipping information, cluster status, and other important metadata.</p>
 */
@property (nonatomic, strong) AWSSnowballClusterMetadata * _Nullable clusterMetadata;

@end

/**
 
 */
@interface AWSSnowballDescribeJobRequest : AWSRequest


/**
 <p>The automatically generated ID for a job, for example <code>JID123e4567-e89b-12d3-a456-426655440000</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSSnowballDescribeJobResult : AWSModel


/**
 <p>Information about a specific job, including shipping information, job status, and other important metadata.</p>
 */
@property (nonatomic, strong) AWSSnowballJobMetadata * _Nullable jobMetadata;

/**
 <p>Information about a specific job part (in the case of an export job), including shipping information, job status, and other important metadata.</p>
 */
@property (nonatomic, strong) NSArray<AWSSnowballJobMetadata *> * _Nullable subJobMetadata;

@end

/**
 <p>The container for <code>SnowconeDeviceConfiguration</code>. </p>
 */
@interface AWSSnowballDeviceConfiguration : AWSModel


/**
 <p>Returns information about the device configuration for an AWS Snowcone job.</p>
 */
@property (nonatomic, strong) AWSSnowballSnowconeDeviceConfiguration * _Nullable snowconeDeviceConfiguration;

@end

/**
 <p>A JSON-formatted object that contains the IDs for an Amazon Machine Image (AMI), including the Amazon EC2 AMI ID and the Snowball Edge AMI ID. Each AMI has these two IDs to simplify identifying the AMI in both the AWS Cloud and on the device.</p>
 Required parameters: [AmiId]
 */
@interface AWSSnowballEc2AmiResource : AWSModel


/**
 <p>The ID of the AMI in Amazon EC2.</p>
 */
@property (nonatomic, strong) NSString * _Nullable amiId;

/**
 <p>The ID of the AMI on the Snowball Edge device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snowballAmiId;

@end

/**
 <p>The container for the <a>EventTriggerDefinition$EventResourceARN</a>.</p>
 */
@interface AWSSnowballEventTriggerDefinition : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for any local Amazon S3 resource that is an AWS Lambda function's event trigger associated with this job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventResourceARN;

@end

/**
 
 */
@interface AWSSnowballGetJobManifestRequest : AWSRequest


/**
 <p>The ID for a job that you want to get the manifest file for, for example <code>JID123e4567-e89b-12d3-a456-426655440000</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSSnowballGetJobManifestResult : AWSModel


/**
 <p>The Amazon S3 presigned URL for the manifest file associated with the specified <code>JobId</code> value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable manifestURI;

@end

/**
 
 */
@interface AWSSnowballGetJobUnlockCodeRequest : AWSRequest


/**
 <p>The ID for the job that you want to get the <code>UnlockCode</code> value for, for example <code>JID123e4567-e89b-12d3-a456-426655440000</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSSnowballGetJobUnlockCodeResult : AWSModel


/**
 <p>The <code>UnlockCode</code> value for the specified job. The <code>UnlockCode</code> value can be accessed for up to 90 days after the job has been created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable unlockCode;

@end

/**
 
 */
@interface AWSSnowballGetSnowballUsageRequest : AWSRequest


@end

/**
 
 */
@interface AWSSnowballGetSnowballUsageResult : AWSModel


/**
 <p>The service limit for number of Snowballs this account can have at once. The default service limit is 1 (one).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable snowballLimit;

/**
 <p>The number of Snowballs that this account is currently using.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable snowballsInUse;

@end

/**
 
 */
@interface AWSSnowballGetSoftwareUpdatesRequest : AWSRequest


/**
 <p>The ID for a job that you want to get the software update file for, for example <code>JID123e4567-e89b-12d3-a456-426655440000</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSSnowballGetSoftwareUpdatesResult : AWSModel


/**
 <p>The Amazon S3 presigned URL for the update file associated with the specified <code>JobId</code> value. The software update will be available for 2 days after this request is made. To access an update after the 2 days have passed, you'll have to make another call to <code>GetSoftwareUpdates</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable updatesURI;

@end

/**
 <p>The tax documents required in AWS Regions in India.</p>
 */
@interface AWSSnowballINDTaxDocuments : AWSModel


/**
 <p>The Goods and Services Tax (GST) documents required in AWS Regions in India.</p>
 */
@property (nonatomic, strong) NSString * _Nullable GSTIN;

@end

/**
 <p>Each <code>JobListEntry</code> object contains a job's state, a job's ID, and a value that indicates whether the job is a job part, in the case of an export job.</p>
 */
@interface AWSSnowballJobListEntry : AWSModel


/**
 <p>The creation date for this job.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The optional description of this specific job, for example <code>Important Photos 2016-08-11</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A value that indicates that this job is a master job. A master job represents a successful request to create an export job. Master jobs aren't associated with any Snowballs. Instead, each master job will have at least one job part, and each job part is associated with a Snowball. It might take some time before the job parts associated with a particular master job are listed, because they are created after the master job is created.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isMaster;

/**
 <p>The automatically generated ID for a job, for example <code>JID123e4567-e89b-12d3-a456-426655440000</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The current state of this job.</p>
 */
@property (nonatomic, assign) AWSSnowballJobState jobState;

/**
 <p>The type of job.</p>
 */
@property (nonatomic, assign) AWSSnowballJobType jobType;

/**
 <p>The type of device used with this job.</p>
 */
@property (nonatomic, assign) AWSSnowballSnowballType snowballType;

@end

/**
 <p>Contains job logs. Whenever Snowball is used to import data into or export data out of Amazon S3, you'll have the option of downloading a PDF job report. Job logs are returned as a part of the response syntax of the <code>DescribeJob</code> action in the <code>JobMetadata</code> data type. The job logs can be accessed for up to 60 minutes after this request has been made. To access any of the job logs after 60 minutes have passed, you'll have to make another call to the <code>DescribeJob</code> action.</p><p>For import jobs, the PDF job report becomes available at the end of the import process. For export jobs, your job report typically becomes available while the Snowball for your job part is being delivered to you.</p><p>The job report provides you insight into the state of your Amazon S3 data transfer. The report includes details about your job or job part for your records.</p><p>For deeper visibility into the status of your transferred objects, you can look at the two associated logs: a success log and a failure log. The logs are saved in comma-separated value (CSV) format, and the name of each log includes the ID of the job or job part that the log describes.</p>
 */
@interface AWSSnowballJobLogs : AWSModel


/**
 <p>A link to an Amazon S3 presigned URL where the job completion report is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobCompletionReportURI;

/**
 <p>A link to an Amazon S3 presigned URL where the job failure log is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobFailureLogURI;

/**
 <p>A link to an Amazon S3 presigned URL where the job success log is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobSuccessLogURI;

@end

/**
 <p>Contains information about a specific job including shipping information, job status, and other important metadata. This information is returned as a part of the response syntax of the <code>DescribeJob</code> action.</p>
 */
@interface AWSSnowballJobMetadata : AWSModel


/**
 <p>The ID for the address that you want the Snowball shipped to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable addressId;

/**
 <p>The 39-character ID for the cluster, for example <code>CID123e4567-e89b-12d3-a456-426655440000</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

/**
 <p>The creation date for this job.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>A value that defines the real-time status of a Snowball's data transfer while the device is at AWS. This data is only available while a job has a <code>JobState</code> value of <code>InProgress</code>, for both import and export jobs.</p>
 */
@property (nonatomic, strong) AWSSnowballDataTransfer * _Nullable dataTransferProgress;

/**
 <p>The description of the job, provided at job creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The container for <code>SnowconeDeviceConfiguration</code>. </p>
 */
@property (nonatomic, strong) AWSSnowballDeviceConfiguration * _Nullable deviceConfiguration;

/**
 <p>The ID of the address that you want a job shipped to, after it will be shipped to its primary address. This field is not supported in most regions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable forwardingAddressId;

/**
 <p>The automatically generated ID for a job, for example <code>JID123e4567-e89b-12d3-a456-426655440000</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>Links to Amazon S3 presigned URLs for the job report and logs. For import jobs, the PDF job report becomes available at the end of the import process. For export jobs, your job report typically becomes available while the Snowball for your job part is being delivered to you.</p>
 */
@property (nonatomic, strong) AWSSnowballJobLogs * _Nullable jobLogInfo;

/**
 <p>The current status of the jobs.</p>
 */
@property (nonatomic, assign) AWSSnowballJobState jobState;

/**
 <p>The type of job.</p>
 */
@property (nonatomic, assign) AWSSnowballJobType jobType;

/**
 <p>The Amazon Resource Name (ARN) for the AWS Key Management Service (AWS KMS) key associated with this job. This ARN was created using the <a href="https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html">CreateKey</a> API action in AWS KMS.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyARN;

/**
 <p>The Amazon Simple Notification Service (Amazon SNS) notification settings associated with a specific job. The <code>Notification</code> object is returned as a part of the response syntax of the <code>DescribeJob</code> action in the <code>JobMetadata</code> data type.</p>
 */
@property (nonatomic, strong) AWSSnowballNotification * _Nullable notification;

/**
 <p>An array of <code>S3Resource</code> objects. Each <code>S3Resource</code> object represents an Amazon S3 bucket that your transferred data will be exported from or imported into.</p>
 */
@property (nonatomic, strong) AWSSnowballJobResource * _Nullable resources;

/**
 <p>The role ARN associated with this job. This ARN was created using the <a href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html">CreateRole</a> API action in AWS Identity and Access Management (IAM).</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

/**
 <p>A job's shipping information, including inbound and outbound tracking numbers and shipping speed options.</p>
 */
@property (nonatomic, strong) AWSSnowballShippingDetails * _Nullable shippingDetails;

/**
 <p>The Snowball capacity preference for this job, specified at job creation. In US regions, you can choose between 50 TB and 80 TB Snowballs. All other regions use 80 TB capacity Snowballs.</p>
 */
@property (nonatomic, assign) AWSSnowballSnowballCapacity snowballCapacityPreference;

/**
 <p>The type of device used with this job.</p>
 */
@property (nonatomic, assign) AWSSnowballSnowballType snowballType;

/**
 <p>The metadata associated with the tax documents required in your AWS Region.</p>
 */
@property (nonatomic, strong) AWSSnowballTaxDocuments * _Nullable taxDocuments;

@end

/**
 <p>Contains an array of AWS resource objects. Each object represents an Amazon S3 bucket, an AWS Lambda function, or an Amazon Machine Image (AMI) based on Amazon EC2 that is associated with a particular job.</p>
 */
@interface AWSSnowballJobResource : AWSModel


/**
 <p>The Amazon Machine Images (AMIs) associated with this job.</p>
 */
@property (nonatomic, strong) NSArray<AWSSnowballEc2AmiResource *> * _Nullable ec2AmiResources;

/**
 <p>The Python-language Lambda functions for this job.</p>
 */
@property (nonatomic, strong) NSArray<AWSSnowballLambdaResource *> * _Nullable lambdaResources;

/**
 <p>An array of <code>S3Resource</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSSnowballS3Resource *> * _Nullable s3Resources;

@end

/**
 <p>Contains a key range. For export jobs, a <code>S3Resource</code> object can have an optional <code>KeyRange</code> value. The length of the range is defined at job creation, and has either an inclusive <code>BeginMarker</code>, an inclusive <code>EndMarker</code>, or both. Ranges are UTF-8 binary sorted.</p>
 */
@interface AWSSnowballKeyRange : AWSModel


/**
 <p>The key that starts an optional key range for an export job. Ranges are inclusive and UTF-8 binary sorted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable beginMarker;

/**
 <p>The key that ends an optional key range for an export job. Ranges are inclusive and UTF-8 binary sorted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endMarker;

@end

/**
 <p>Identifies </p>
 */
@interface AWSSnowballLambdaResource : AWSModel


/**
 <p>The array of ARNs for <a>S3Resource</a> objects to trigger the <a>LambdaResource</a> objects associated with this job.</p>
 */
@property (nonatomic, strong) NSArray<AWSSnowballEventTriggerDefinition *> * _Nullable eventTriggers;

/**
 <p>An Amazon Resource Name (ARN) that represents an AWS Lambda function to be triggered by PUT object actions on the associated local Amazon S3 resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lambdaArn;

@end

/**
 
 */
@interface AWSSnowballListClusterJobsRequest : AWSRequest


/**
 <p>The 39-character ID for the cluster that you want to list, for example <code>CID123e4567-e89b-12d3-a456-426655440000</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

/**
 <p>The number of <code>JobListEntry</code> objects to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>HTTP requests are stateless. To identify what object comes "next" in the list of <code>JobListEntry</code> objects, you have the option of specifying <code>NextToken</code> as the starting point for your returned list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSnowballListClusterJobsResult : AWSModel


/**
 <p>Each <code>JobListEntry</code> object contains a job's state, a job's ID, and a value that indicates whether the job is a job part, in the case of export jobs. </p>
 */
@property (nonatomic, strong) NSArray<AWSSnowballJobListEntry *> * _Nullable jobListEntries;

/**
 <p>HTTP requests are stateless. If you use the automatically generated <code>NextToken</code> value in your next <code>ListClusterJobsResult</code> call, your list of returned jobs will start from this point in the array.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSnowballListClustersRequest : AWSRequest


/**
 <p>The number of <code>ClusterListEntry</code> objects to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>HTTP requests are stateless. To identify what object comes "next" in the list of <code>ClusterListEntry</code> objects, you have the option of specifying <code>NextToken</code> as the starting point for your returned list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSnowballListClustersResult : AWSModel


/**
 <p>Each <code>ClusterListEntry</code> object contains a cluster's state, a cluster's ID, and other important status information.</p>
 */
@property (nonatomic, strong) NSArray<AWSSnowballClusterListEntry *> * _Nullable clusterListEntries;

/**
 <p>HTTP requests are stateless. If you use the automatically generated <code>NextToken</code> value in your next <code>ClusterListEntry</code> call, your list of returned clusters will start from this point in the array.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSnowballListCompatibleImagesRequest : AWSRequest


/**
 <p>The maximum number of results for the list of compatible images. Currently, a Snowball Edge device can store 10 AMIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>HTTP requests are stateless. To identify what object comes "next" in the list of compatible images, you can specify a value for <code>NextToken</code> as the starting point for your list of returned images.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSnowballListCompatibleImagesResult : AWSModel


/**
 <p>A JSON-formatted object that describes a compatible AMI, including the ID and name for a Snowball Edge AMI.</p>
 */
@property (nonatomic, strong) NSArray<AWSSnowballCompatibleImage *> * _Nullable compatibleImages;

/**
 <p>Because HTTP requests are stateless, this is the starting point for your next list of returned images.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSnowballListJobsRequest : AWSRequest


/**
 <p>The number of <code>JobListEntry</code> objects to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>HTTP requests are stateless. To identify what object comes "next" in the list of <code>JobListEntry</code> objects, you have the option of specifying <code>NextToken</code> as the starting point for your returned list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSnowballListJobsResult : AWSModel


/**
 <p>Each <code>JobListEntry</code> object contains a job's state, a job's ID, and a value that indicates whether the job is a job part, in the case of export jobs. </p>
 */
@property (nonatomic, strong) NSArray<AWSSnowballJobListEntry *> * _Nullable jobListEntries;

/**
 <p>HTTP requests are stateless. If you use this automatically generated <code>NextToken</code> value in your next <code>ListJobs</code> call, your returned <code>JobListEntry</code> objects will start from this point in the array.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>The Amazon Simple Notification Service (Amazon SNS) notification settings associated with a specific job. The <code>Notification</code> object is returned as a part of the response syntax of the <code>DescribeJob</code> action in the <code>JobMetadata</code> data type.</p><p>When the notification settings are defined during job creation, you can choose to notify based on a specific set of job states using the <code>JobStatesToNotify</code> array of strings, or you can specify that you want to have Amazon SNS notifications sent out for all job states with <code>NotifyAll</code> set to true.</p>
 */
@interface AWSSnowballNotification : AWSModel


/**
 <p>The list of job states that will trigger a notification for this job.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable jobStatesToNotify;

/**
 <p>Any change in job state will trigger a notification for this job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable notifyAll;

/**
 <p>The new SNS <code>TopicArn</code> that you want to associate with this job. You can create Amazon Resource Names (ARNs) for topics by using the <a href="https://docs.aws.amazon.com/sns/latest/api/API_CreateTopic.html">CreateTopic</a> Amazon SNS API action.</p><p>You can subscribe email addresses to an Amazon SNS topic through the AWS Management Console, or by using the <a href="https://docs.aws.amazon.com/sns/latest/api/API_Subscribe.html">Subscribe</a> AWS Simple Notification Service (SNS) API action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snsTopicARN;

@end

/**
 <p>Each <code>S3Resource</code> object represents an Amazon S3 bucket that your transferred data will be exported from or imported into. For export jobs, this object can have an optional <code>KeyRange</code> value. The length of the range is defined at job creation, and has either an inclusive <code>BeginMarker</code>, an inclusive <code>EndMarker</code>, or both. Ranges are UTF-8 binary sorted.</p>
 */
@interface AWSSnowballS3Resource : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of an Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketArn;

/**
 <p>For export jobs, you can provide an optional <code>KeyRange</code> within a specific Amazon S3 bucket. The length of the range is defined at job creation, and has either an inclusive <code>BeginMarker</code>, an inclusive <code>EndMarker</code>, or both. Ranges are UTF-8 binary sorted.</p>
 */
@property (nonatomic, strong) AWSSnowballKeyRange * _Nullable keyRange;

@end

/**
 <p>The <code>Status</code> and <code>TrackingNumber</code> information for an inbound or outbound shipment.</p>
 */
@interface AWSSnowballShipment : AWSModel


/**
 <p>Status information for a shipment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The tracking number for this job. Using this tracking number with your region's carrier's website, you can track a Snowball as the carrier transports it.</p><p>For India, the carrier is Amazon Logistics. For all other regions, UPS is the carrier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackingNumber;

@end

/**
 <p>A job's shipping information, including inbound and outbound tracking numbers and shipping speed options.</p>
 */
@interface AWSSnowballShippingDetails : AWSModel


/**
 <p>The <code>Status</code> and <code>TrackingNumber</code> values for a Snowball being returned to AWS for a particular job.</p>
 */
@property (nonatomic, strong) AWSSnowballShipment * _Nullable inboundShipment;

/**
 <p>The <code>Status</code> and <code>TrackingNumber</code> values for a Snowball being delivered to the address that you specified for a particular job.</p>
 */
@property (nonatomic, strong) AWSSnowballShipment * _Nullable outboundShipment;

/**
 <p>The shipping speed for a particular job. This speed doesn't dictate how soon you'll get the Snowball from the job's creation date. This speed represents how quickly it moves to its destination while in transit. Regional shipping speeds are as follows:</p><ul><li><p>In Australia, you have access to express shipping. Typically, Snowballs shipped express are delivered in about a day.</p></li><li><p>In the European Union (EU), you have access to express shipping. Typically, Snowballs shipped express are delivered in about a day. In addition, most countries in the EU have access to standard shipping, which typically takes less than a week, one way.</p></li><li><p>In India, Snowballs are delivered in one to seven days.</p></li><li><p>In the United States of America (US), you have access to one-day shipping and two-day shipping.</p></li></ul>
 */
@property (nonatomic, assign) AWSSnowballShippingOption shippingOption;

@end

/**
 <p>Specifies the device configuration for an AWS Snowcone job. </p>
 */
@interface AWSSnowballSnowconeDeviceConfiguration : AWSModel


/**
 <p>Configures the wireless connection for the AWS Snowcone device.</p>
 */
@property (nonatomic, strong) AWSSnowballWirelessConnection * _Nullable wirelessConnection;

@end

/**
 <p>The tax documents required in your AWS Region.</p>
 */
@interface AWSSnowballTaxDocuments : AWSModel


/**
 <p>The tax documents required in AWS Regions in India.</p>
 */
@property (nonatomic, strong) AWSSnowballINDTaxDocuments * _Nullable IND;

@end

/**
 
 */
@interface AWSSnowballUpdateClusterRequest : AWSRequest


/**
 <p>The ID of the updated <a>Address</a> object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable addressId;

/**
 <p>The cluster ID of the cluster that you want to update, for example <code>CID123e4567-e89b-12d3-a456-426655440000</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

/**
 <p>The updated description of this cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The updated ID for the forwarding address for a cluster. This field is not supported in most regions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable forwardingAddressId;

/**
 <p>The new or updated <a>Notification</a> object.</p>
 */
@property (nonatomic, strong) AWSSnowballNotification * _Nullable notification;

/**
 <p>The updated arrays of <a>JobResource</a> objects that can include updated <a>S3Resource</a> objects or <a>LambdaResource</a> objects.</p>
 */
@property (nonatomic, strong) AWSSnowballJobResource * _Nullable resources;

/**
 <p>The new role Amazon Resource Name (ARN) that you want to associate with this cluster. To create a role ARN, use the <a href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html">CreateRole</a> API action in AWS Identity and Access Management (IAM).</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

/**
 <p>The updated shipping option value of this cluster's <a>ShippingDetails</a> object.</p>
 */
@property (nonatomic, assign) AWSSnowballShippingOption shippingOption;

@end

/**
 
 */
@interface AWSSnowballUpdateClusterResult : AWSModel


@end

/**
 
 */
@interface AWSSnowballUpdateJobRequest : AWSRequest


/**
 <p>The ID of the updated <a>Address</a> object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable addressId;

/**
 <p>The updated description of this job's <a>JobMetadata</a> object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The updated ID for the forwarding address for a job. This field is not supported in most regions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable forwardingAddressId;

/**
 <p>The job ID of the job that you want to update, for example <code>JID123e4567-e89b-12d3-a456-426655440000</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The new or updated <a>Notification</a> object.</p>
 */
@property (nonatomic, strong) AWSSnowballNotification * _Nullable notification;

/**
 <p>The updated <code>JobResource</code> object, or the updated <a>JobResource</a> object. </p>
 */
@property (nonatomic, strong) AWSSnowballJobResource * _Nullable resources;

/**
 <p>The new role Amazon Resource Name (ARN) that you want to associate with this job. To create a role ARN, use the <a href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html">CreateRole</a>AWS Identity and Access Management (IAM) API action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

/**
 <p>The updated shipping option value of this job's <a>ShippingDetails</a> object.</p>
 */
@property (nonatomic, assign) AWSSnowballShippingOption shippingOption;

/**
 <p>The updated <code>SnowballCapacityPreference</code> of this job's <a>JobMetadata</a> object. The 50 TB Snowballs are only available in the US regions.</p>
 */
@property (nonatomic, assign) AWSSnowballSnowballCapacity snowballCapacityPreference;

@end

/**
 
 */
@interface AWSSnowballUpdateJobResult : AWSModel


@end

/**
 <p>Configures the wireless connection on an AWS Snowcone device.</p>
 */
@interface AWSSnowballWirelessConnection : AWSModel


/**
 <p>Enables the Wi-Fi adapter on an AWS Snowcone device.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isWifiEnabled;

@end

NS_ASSUME_NONNULL_END
