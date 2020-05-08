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

FOUNDATION_EXPORT NSString *const AWSResourceGroupsTaggingAPIErrorDomain;

typedef NS_ENUM(NSInteger, AWSResourceGroupsTaggingAPIErrorType) {
    AWSResourceGroupsTaggingAPIErrorUnknown,
    AWSResourceGroupsTaggingAPIErrorConcurrentModification,
    AWSResourceGroupsTaggingAPIErrorConstraintViolation,
    AWSResourceGroupsTaggingAPIErrorInternalService,
    AWSResourceGroupsTaggingAPIErrorInvalidParameter,
    AWSResourceGroupsTaggingAPIErrorPaginationTokenExpired,
    AWSResourceGroupsTaggingAPIErrorThrottled,
};

typedef NS_ENUM(NSInteger, AWSResourceGroupsTaggingAPIErrorCode) {
    AWSResourceGroupsTaggingAPIErrorCodeUnknown,
    AWSResourceGroupsTaggingAPIErrorCodeInternalServiceException,
    AWSResourceGroupsTaggingAPIErrorCodeInvalidParameterException,
};

typedef NS_ENUM(NSInteger, AWSResourceGroupsTaggingAPIGroupByAttribute) {
    AWSResourceGroupsTaggingAPIGroupByAttributeUnknown,
    AWSResourceGroupsTaggingAPIGroupByAttributeTargetId,
    AWSResourceGroupsTaggingAPIGroupByAttributeRegion,
    AWSResourceGroupsTaggingAPIGroupByAttributeResourceType,
};

typedef NS_ENUM(NSInteger, AWSResourceGroupsTaggingAPITargetIdType) {
    AWSResourceGroupsTaggingAPITargetIdTypeUnknown,
    AWSResourceGroupsTaggingAPITargetIdTypeAccount,
    AWSResourceGroupsTaggingAPITargetIdTypeOu,
    AWSResourceGroupsTaggingAPITargetIdTypeRoot,
};

@class AWSResourceGroupsTaggingAPIComplianceDetails;
@class AWSResourceGroupsTaggingAPIDescribeReportCreationInput;
@class AWSResourceGroupsTaggingAPIDescribeReportCreationOutput;
@class AWSResourceGroupsTaggingAPIFailureInfo;
@class AWSResourceGroupsTaggingAPIGetComplianceSummaryInput;
@class AWSResourceGroupsTaggingAPIGetComplianceSummaryOutput;
@class AWSResourceGroupsTaggingAPIGetResourcesInput;
@class AWSResourceGroupsTaggingAPIGetResourcesOutput;
@class AWSResourceGroupsTaggingAPIGetTagKeysInput;
@class AWSResourceGroupsTaggingAPIGetTagKeysOutput;
@class AWSResourceGroupsTaggingAPIGetTagValuesInput;
@class AWSResourceGroupsTaggingAPIGetTagValuesOutput;
@class AWSResourceGroupsTaggingAPIResourceTagMapping;
@class AWSResourceGroupsTaggingAPIStartReportCreationInput;
@class AWSResourceGroupsTaggingAPIStartReportCreationOutput;
@class AWSResourceGroupsTaggingAPISummary;
@class AWSResourceGroupsTaggingAPITag;
@class AWSResourceGroupsTaggingAPITagFilter;
@class AWSResourceGroupsTaggingAPITagResourcesInput;
@class AWSResourceGroupsTaggingAPITagResourcesOutput;
@class AWSResourceGroupsTaggingAPIUntagResourcesInput;
@class AWSResourceGroupsTaggingAPIUntagResourcesOutput;

/**
 <p>Information that shows whether a resource is compliant with the effective tag policy, including details on any noncompliant tag keys.</p>
 */
@interface AWSResourceGroupsTaggingAPIComplianceDetails : AWSModel


/**
 <p>Whether a resource is compliant with the effective tag policy.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable complianceStatus;

/**
 <p>These are keys defined in the effective policy that are on the resource with either incorrect case treatment or noncompliant values. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable keysWithNoncompliantValues;

/**
 <p>These tag keys on the resource are noncompliant with the effective tag policy.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable noncompliantKeys;

@end

/**
 
 */
@interface AWSResourceGroupsTaggingAPIDescribeReportCreationInput : AWSRequest


@end

/**
 
 */
@interface AWSResourceGroupsTaggingAPIDescribeReportCreationOutput : AWSModel


/**
 <p>Details of the common errors that all operations return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The path to the Amazon S3 bucket where the report was stored on creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Location;

/**
 <p>Reports the status of the operation.</p><p>The operation status can be one of the following:</p><ul><li><p><code>RUNNING</code> - Report creation is in progress.</p></li><li><p><code>SUCCEEDED</code> - Report creation is complete. You can open the report from the Amazon S3 bucket that you specified when you ran <code>StartReportCreation</code>.</p></li><li><p><code>FAILED</code> - Report creation timed out or the Amazon S3 bucket is not accessible. </p></li><li><p><code>NO REPORT</code> - No report was generated in the last 90 days.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Information about the errors that are returned for each failed resource. This information can include <code>InternalServiceException</code> and <code>InvalidParameterException</code> errors. It can also include any valid error code returned by the AWS service that hosts the resource that the ARN key represents.</p><p>The following are common error codes that you might receive from other AWS services:</p><ul><li><p><b>InternalServiceException</b> – This can mean that the Resource Groups Tagging API didn't receive a response from another AWS service. It can also mean the the resource type in the request is not supported by the Resource Groups Tagging API. In these cases, it's safe to retry the request and then call <a href="http://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/API_GetResources.html">GetResources</a> to verify the changes.</p></li><li><p><b>AccessDeniedException</b> – This can mean that you need permission to calling tagging operations in the AWS service that contains the resource. For example, to use the Resource Groups Tagging API to tag a CloudWatch alarm resource, you need permission to call <a href="http://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/API_TagResources.html"><code>TagResources</code></a><i>and</i><a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_TagResource.html"><code>TagResource</code></a> in the CloudWatch API. </p></li></ul><p>For more information on errors that are generated from other AWS services, see the documentation for that service. </p>
 */
@interface AWSResourceGroupsTaggingAPIFailureInfo : AWSModel


/**
 <p>The code of the common error. Valid values include <code>InternalServiceException</code>, <code>InvalidParameterException</code>, and any valid error code returned by the AWS service that hosts the resource that you want to tag.</p>
 */
@property (nonatomic, assign) AWSResourceGroupsTaggingAPIErrorCode errorCode;

/**
 <p>The message of the common error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The HTTP status code of the common error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable statusCode;

@end

/**
 
 */
@interface AWSResourceGroupsTaggingAPIGetComplianceSummaryInput : AWSRequest


/**
 <p>A list of attributes to group the counts of noncompliant resources by. If supplied, the counts are sorted by those attributes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable groupBy;

/**
 <p>A limit that restricts the number of results that are returned per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A string that indicates that additional data is available. Leave this value empty for your initial request. If the response includes a <code>PaginationToken</code>, use that string for this value to request an additional page of data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

/**
 <p>A list of Regions to limit the output by. If you use this parameter, the count of returned noncompliant resources includes only resources in the specified Regions.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable regionFilters;

/**
 <p>The constraints on the resources that you want returned. The format of each resource type is <code>service[:resourceType]</code>. For example, specifying a resource type of <code>ec2</code> returns all Amazon EC2 resources (which includes EC2 instances). Specifying a resource type of <code>ec2:instance</code> returns only EC2 instances. </p><p>The string for each service name and resource type is the same as that embedded in a resource's Amazon Resource Name (ARN). Consult the <i>AWS General Reference</i> for the following:</p><ul><li><p>For a list of service name strings, see <a href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS Service Namespaces</a>.</p></li><li><p>For resource type strings, see <a href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arns-syntax">Example ARNs</a>.</p></li><li><p>For more information about ARNs, see <a href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a>.</p></li></ul><p>You can specify multiple resource types by using an array. The array can include up to 100 items. Note that the length constraint requirement applies to each resource type filter. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceTypeFilters;

/**
 <p>A list of tag keys to limit the output by. If you use this parameter, the count of returned noncompliant resources includes only resources that have the specified tag keys.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeyFilters;

/**
 <p>The target identifiers (usually, specific account IDs) to limit the output by. If you use this parameter, the count of returned noncompliant resources includes only resources with the specified target IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetIdFilters;

@end

/**
 
 */
@interface AWSResourceGroupsTaggingAPIGetComplianceSummaryOutput : AWSModel


/**
 <p>A string that indicates that the response contains more data than can be returned in a single response. To receive additional data, specify this string for the <code>PaginationToken</code> value in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

/**
 <p>A table that shows counts of noncompliant resources.</p>
 */
@property (nonatomic, strong) NSArray<AWSResourceGroupsTaggingAPISummary *> * _Nullable summaryList;

@end

/**
 
 */
@interface AWSResourceGroupsTaggingAPIGetResourcesInput : AWSRequest


/**
 <p>Specifies whether to exclude resources that are compliant with the tag policy. Set this to <code>true</code> if you are interested in retrieving information on noncompliant resources only.</p><p>You can use this parameter only if the <code>IncludeComplianceDetails</code> parameter is also set to <code>true</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable excludeCompliantResources;

/**
 <p>Specifies whether to include details regarding the compliance with the effective tag policy. Set this to <code>true</code> to determine whether resources are compliant with the tag policy and to get details.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeComplianceDetails;

/**
 <p>A string that indicates that additional data is available. Leave this value empty for your initial request. If the response includes a <code>PaginationToken</code>, use that string for this value to request an additional page of data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

/**
 <p>The constraints on the resources that you want returned. The format of each resource type is <code>service[:resourceType]</code>. For example, specifying a resource type of <code>ec2</code> returns all Amazon EC2 resources (which includes EC2 instances). Specifying a resource type of <code>ec2:instance</code> returns only EC2 instances. </p><p>The string for each service name and resource type is the same as that embedded in a resource's Amazon Resource Name (ARN). Consult the <i>AWS General Reference</i> for the following:</p><ul><li><p>For a list of service name strings, see <a href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS Service Namespaces</a>.</p></li><li><p>For resource type strings, see <a href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arns-syntax">Example ARNs</a>.</p></li><li><p>For more information about ARNs, see <a href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a>.</p></li></ul><p>You can specify multiple resource types by using an array. The array can include up to 100 items. Note that the length constraint requirement applies to each resource type filter. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceTypeFilters;

/**
 <p>A limit that restricts the number of resources returned by GetResources in paginated output. You can set ResourcesPerPage to a minimum of 1 item and the maximum of 100 items. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable resourcesPerPage;

/**
 <p>A list of TagFilters (keys and values). Each TagFilter specified must contain a key with values as optional. A request can include up to 50 keys, and each key can include up to 20 values. </p><p>Note the following when deciding how to use TagFilters:</p><ul><li><p>If you <i>do</i> specify a TagFilter, the response returns only those resources that are currently associated with the specified tag. </p></li><li><p>If you <i>don't</i> specify a TagFilter, the response includes all resources that were ever associated with tags. Resources that currently don't have associated tags are shown with an empty tag set, like this: <code>"Tags": []</code>.</p></li><li><p>If you specify more than one filter in a single request, the response returns only those resources that satisfy all specified filters.</p></li><li><p>If you specify a filter that contains more than one value for a key, the response returns resources that match any of the specified values for that key.</p></li><li><p>If you don't specify any values for a key, the response returns resources that are tagged with that key irrespective of the value.</p><p>For example, for filters: filter1 = {key1, {value1}}, filter2 = {key2, {value2,value3,value4}} , filter3 = {key3}:</p><ul><li><p>GetResources( {filter1} ) returns resources tagged with key1=value1</p></li><li><p>GetResources( {filter2} ) returns resources tagged with key2=value2 or key2=value3 or key2=value4</p></li><li><p>GetResources( {filter3} ) returns resources tagged with any tag containing key3 as its tag key, irrespective of its value</p></li><li><p>GetResources( {filter1,filter2,filter3} ) returns resources tagged with ( key1=value1) and ( key2=value2 or key2=value3 or key2=value4) and (key3, irrespective of the value)</p></li></ul></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSResourceGroupsTaggingAPITagFilter *> * _Nullable tagFilters;

/**
 <p>AWS recommends using <code>ResourcesPerPage</code> instead of this parameter.</p><p>A limit that restricts the number of tags (key and value pairs) returned by GetResources in paginated output. A resource with no tags is counted as having one tag (one key and value pair).</p><p><code>GetResources</code> does not split a resource and its associated tags across pages. If the specified <code>TagsPerPage</code> would cause such a break, a <code>PaginationToken</code> is returned in place of the affected resource and its tags. Use that token in another request to get the remaining data. For example, if you specify a <code>TagsPerPage</code> of <code>100</code> and the account has 22 resources with 10 tags each (meaning that each resource has 10 key and value pairs), the output will consist of three pages. The first page displays the first 10 resources, each with its 10 tags. The second page displays the next 10 resources, each with its 10 tags. The third page displays the remaining 2 resources, each with its 10 tags.</p><p>You can set <code>TagsPerPage</code> to a minimum of 100 items and the maximum of 500 items.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tagsPerPage;

@end

/**
 
 */
@interface AWSResourceGroupsTaggingAPIGetResourcesOutput : AWSModel


/**
 <p>A string that indicates that the response contains more data than can be returned in a single response. To receive additional data, specify this string for the <code>PaginationToken</code> value in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

/**
 <p>A list of resource ARNs and the tags (keys and values) associated with each.</p>
 */
@property (nonatomic, strong) NSArray<AWSResourceGroupsTaggingAPIResourceTagMapping *> * _Nullable resourceTagMappingList;

@end

/**
 
 */
@interface AWSResourceGroupsTaggingAPIGetTagKeysInput : AWSRequest


/**
 <p>A string that indicates that additional data is available. Leave this value empty for your initial request. If the response includes a <code>PaginationToken</code>, use that string for this value to request an additional page of data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

@end

/**
 
 */
@interface AWSResourceGroupsTaggingAPIGetTagKeysOutput : AWSModel


/**
 <p>A string that indicates that the response contains more data than can be returned in a single response. To receive additional data, specify this string for the <code>PaginationToken</code> value in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

/**
 <p>A list of all tag keys in the AWS account.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSResourceGroupsTaggingAPIGetTagValuesInput : AWSRequest


/**
 <p>The key for which you want to list all existing values in the specified Region for the AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>A string that indicates that additional data is available. Leave this value empty for your initial request. If the response includes a <code>PaginationToken</code>, use that string for this value to request an additional page of data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

@end

/**
 
 */
@interface AWSResourceGroupsTaggingAPIGetTagValuesOutput : AWSModel


/**
 <p>A string that indicates that the response contains more data than can be returned in a single response. To receive additional data, specify this string for the <code>PaginationToken</code> value in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

/**
 <p>A list of all tag values for the specified key in the AWS account.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagValues;

@end

/**
 <p>A list of resource ARNs and the tags (keys and values) that are associated with each.</p>
 */
@interface AWSResourceGroupsTaggingAPIResourceTagMapping : AWSModel


/**
 <p>Information that shows whether a resource is compliant with the effective tag policy, including details on any noncompliant tag keys.</p>
 */
@property (nonatomic, strong) AWSResourceGroupsTaggingAPIComplianceDetails * _Nullable complianceDetails;

/**
 <p>The ARN of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

/**
 <p>The tags that have been applied to one or more AWS resources.</p>
 */
@property (nonatomic, strong) NSArray<AWSResourceGroupsTaggingAPITag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSResourceGroupsTaggingAPIStartReportCreationInput : AWSRequest


/**
 <p>The name of the Amazon S3 bucket where the report will be stored; for example:</p><p><code>awsexamplebucket</code></p><p>For more information on S3 bucket requirements, including an example bucket policy, see the example S3 bucket policy on this page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Bucket;

@end

/**
 
 */
@interface AWSResourceGroupsTaggingAPIStartReportCreationOutput : AWSModel


@end

/**
 <p>A count of noncompliant resources.</p>
 */
@interface AWSResourceGroupsTaggingAPISummary : AWSModel


/**
 <p>The timestamp that shows when this summary was generated in this Region. </p>
 */
@property (nonatomic, strong) NSString * _Nullable lastUpdated;

/**
 <p>The count of noncompliant resources.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable nonCompliantResources;

/**
 <p>The AWS Region that the summary applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>The AWS resource type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>The account identifier or the root identifier of the organization. If you don't know the root ID, you can call the AWS Organizations <a href="http://docs.aws.amazon.com/organizations/latest/APIReference/API_ListRoots.html">ListRoots</a> API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetId;

/**
 <p>Whether the target is an account, an OU, or the organization root.</p>
 */
@property (nonatomic, assign) AWSResourceGroupsTaggingAPITargetIdType targetIdType;

@end

/**
 <p>The metadata that you apply to AWS resources to help you categorize and organize them. Each tag consists of a key and a value, both of which you define. For more information, see <a href="http://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging AWS Resources</a> in the <i>AWS General Reference</i>.</p>
 Required parameters: [Key, Value]
 */
@interface AWSResourceGroupsTaggingAPITag : AWSModel


/**
 <p>One part of a key-value pair that makes up a tag. A key is a general label that acts like a category for more specific tag values.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>One part of a key-value pair that make up a tag. A value acts as a descriptor within a tag category (key). The value can be empty or null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>A list of tags (keys and values) that are used to specify the associated resources.</p>
 */
@interface AWSResourceGroupsTaggingAPITagFilter : AWSModel


/**
 <p>One part of a key-value pair that makes up a tag. A key is a general label that acts like a category for more specific tag values.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>One part of a key-value pair that make up a tag. A value acts as a descriptor within a tag category (key). The value can be empty or null.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 
 */
@interface AWSResourceGroupsTaggingAPITagResourcesInput : AWSRequest


/**
 <p>A list of ARNs. An ARN (Amazon Resource Name) uniquely identifies a resource. For more information, see <a href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceARNList;

/**
 <p>The tags that you want to add to the specified resources. A tag consists of a key and a value that you define.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSResourceGroupsTaggingAPITagResourcesOutput : AWSModel


/**
 <p>A map containing a key-value pair for each failed item that couldn't be tagged. The key is the ARN of the failed resource. The value is a <code>FailureInfo</code> object that contains an error code, a status code, and an error message. If there are no errors, the <code>FailedResourcesMap</code> is empty.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSResourceGroupsTaggingAPIFailureInfo *> * _Nullable failedResourcesMap;

@end

/**
 
 */
@interface AWSResourceGroupsTaggingAPIUntagResourcesInput : AWSRequest


/**
 <p>A list of ARNs. An ARN (Amazon Resource Name) uniquely identifies a resource. For more information, see <a href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceARNList;

/**
 <p>A list of the tag keys that you want to remove from the specified resources.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSResourceGroupsTaggingAPIUntagResourcesOutput : AWSModel


/**
 <p>Details of resources that could not be untagged. An error code, status code, and error message are returned for each failed item. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSResourceGroupsTaggingAPIFailureInfo *> * _Nullable failedResourcesMap;

@end

NS_ASSUME_NONNULL_END
