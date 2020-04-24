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

FOUNDATION_EXPORT NSString *const AWSapi.elastic-inferenceErrorDomain;

typedef NS_ENUM(NSInteger, AWSapi.elastic-inferenceErrorType) {
    AWSapi.elastic-inferenceErrorUnknown,
    AWSapi.elastic-inferenceErrorBadRequest,
    AWSapi.elastic-inferenceErrorInternalServer,
    AWSapi.elastic-inferenceErrorResourceNotFound,
};

typedef NS_ENUM(NSInteger, AWSapi.elastic-inferenceLocationType) {
    AWSapi.elastic-inferenceLocationTypeUnknown,
    AWSapi.elastic-inferenceLocationTypeRegion,
    AWSapi.elastic-inferenceLocationTypeAvailabilityZone,
    AWSapi.elastic-inferenceLocationTypeAvailabilityZoneId,
};

@class AWSapi.elastic-inferenceAcceleratorType;
@class AWSapi.elastic-inferenceAcceleratorTypeOffering;
@class AWSapi.elastic-inferenceDescribeAcceleratorOfferingsRequest;
@class AWSapi.elastic-inferenceDescribeAcceleratorOfferingsResponse;
@class AWSapi.elastic-inferenceDescribeAcceleratorTypesRequest;
@class AWSapi.elastic-inferenceDescribeAcceleratorTypesResponse;
@class AWSapi.elastic-inferenceDescribeAcceleratorsRequest;
@class AWSapi.elastic-inferenceDescribeAcceleratorsResponse;
@class AWSapi.elastic-inferenceElasticInferenceAccelerator;
@class AWSapi.elastic-inferenceElasticInferenceAcceleratorHealth;
@class AWSapi.elastic-inferenceFilter;
@class AWSapi.elastic-inferenceKeyValuePair;
@class AWSapi.elastic-inferenceListTagsForResourceRequest;
@class AWSapi.elastic-inferenceListTagsForResourceResult;
@class AWSapi.elastic-inferenceMemoryInfo;
@class AWSapi.elastic-inferenceTagResourceRequest;
@class AWSapi.elastic-inferenceTagResourceResult;
@class AWSapi.elastic-inferenceUntagResourceRequest;
@class AWSapi.elastic-inferenceUntagResourceResult;

/**
 <p> The details of an Elastic Inference Accelerator type. </p>
 */
@interface AWSapi.elastic-inferenceAcceleratorType : AWSModel


/**
 <p> The name of the Elastic Inference Accelerator type. </p>
 */
@property (nonatomic, strong) NSString * _Nullable acceleratorTypeName;

/**
 <p> The memory information of the Elastic Inference Accelerator type. </p>
 */
@property (nonatomic, strong) AWSapi.elastic-inferenceMemoryInfo * _Nullable memoryInfo;

/**
 <p> The throughput information of the Elastic Inference Accelerator type. </p>
 */
@property (nonatomic, strong) NSArray<AWSapi.elastic-inferenceKeyValuePair *> * _Nullable throughputInfo;

@end

/**
 <p> The offering for an Elastic Inference Accelerator type. </p>
 */
@interface AWSapi.elastic-inferenceAcceleratorTypeOffering : AWSModel


/**
 <p> The name of the Elastic Inference Accelerator type. </p>
 */
@property (nonatomic, strong) NSString * _Nullable acceleratorType;

/**
 <p> The location for the offering. It will return either the region, availability zone or availability zone id for the offering depending on the locationType value. </p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p> The location type for the offering. It can assume the following values: region: defines that the offering is at the regional level. availability-zone: defines that the offering is at the availability zone level. availability-zone-id: defines that the offering is at the availability zone level, defined by the availability zone id. </p>
 */
@property (nonatomic, assign) AWSapi.elastic-inferenceLocationType locationType;

@end

/**
 
 */
@interface AWSapi.elastic-inferenceDescribeAcceleratorOfferingsRequest : AWSRequest


/**
 <p> The list of accelerator types to describe. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable acceleratorTypes;

/**
 <p> The location type that you want to describe accelerator type offerings for. It can assume the following values: region: will return the accelerator type offering at the regional level. availability-zone: will return the accelerator type offering at the availability zone level. availability-zone-id: will return the accelerator type offering at the availability zone level returning the availability zone id. </p>
 */
@property (nonatomic, assign) AWSapi.elastic-inferenceLocationType locationType;

@end

/**
 
 */
@interface AWSapi.elastic-inferenceDescribeAcceleratorOfferingsResponse : AWSModel


/**
 <p> The list of accelerator type offerings for a specific location. </p>
 */
@property (nonatomic, strong) NSArray<AWSapi.elastic-inferenceAcceleratorTypeOffering *> * _Nullable acceleratorTypeOfferings;

@end

/**
 
 */
@interface AWSapi.elastic-inferenceDescribeAcceleratorTypesRequest : AWSRequest


@end

/**
 
 */
@interface AWSapi.elastic-inferenceDescribeAcceleratorTypesResponse : AWSModel


/**
 <p> The available accelerator types. </p>
 */
@property (nonatomic, strong) NSArray<AWSapi.elastic-inferenceAcceleratorType *> * _Nullable acceleratorTypes;

@end

/**
 
 */
@interface AWSapi.elastic-inferenceDescribeAcceleratorsRequest : AWSRequest


/**
 <p> The IDs of the accelerators to describe. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable acceleratorIds;

/**
 <p> One or more filters. Filter names and values are case-sensitive. Valid filter names are: accelerator-types: can provide a list of accelerator type names to filter for. instance-id: can provide a list of EC2 instance ids to filter for. </p>
 */
@property (nonatomic, strong) NSArray<AWSapi.elastic-inferenceFilter *> * _Nullable filters;

/**
 <p> The total number of items to return in the command's output. If the total number of items available is more than the value specified, a NextToken is provided in the command's output. To resume pagination, provide the NextToken value in the starting-token argument of a subsequent command. Do not use the NextToken response element directly outside of the AWS CLI. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> A token to specify where to start paginating. This is the NextToken from a previously truncated response. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapi.elastic-inferenceDescribeAcceleratorsResponse : AWSModel


/**
 <p> The details of the Elastic Inference Accelerators. </p>
 */
@property (nonatomic, strong) NSArray<AWSapi.elastic-inferenceElasticInferenceAccelerator *> * _Nullable acceleratorSet;

/**
 <p> A token to specify where to start paginating. This is the NextToken from a previously truncated response. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> The details of an Elastic Inference Accelerator. </p>
 */
@interface AWSapi.elastic-inferenceElasticInferenceAccelerator : AWSModel


/**
 <p> The health of the Elastic Inference Accelerator. </p>
 */
@property (nonatomic, strong) AWSapi.elastic-inferenceElasticInferenceAcceleratorHealth * _Nullable acceleratorHealth;

/**
 <p> The ID of the Elastic Inference Accelerator. </p>
 */
@property (nonatomic, strong) NSString * _Nullable acceleratorId;

/**
 <p> The type of the Elastic Inference Accelerator. </p>
 */
@property (nonatomic, strong) NSString * _Nullable acceleratorType;

/**
 <p> The ARN of the resource that the Elastic Inference Accelerator is attached to. </p>
 */
@property (nonatomic, strong) NSString * _Nullable attachedResource;

/**
 <p> The availability zone where the Elastic Inference Accelerator is present. </p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

@end

/**
 <p> The health details of an Elastic Inference Accelerator. </p>
 */
@interface AWSapi.elastic-inferenceElasticInferenceAcceleratorHealth : AWSModel


/**
 <p> The health status of the Elastic Inference Accelerator. </p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p> A filter expression for the Elastic Inference Accelerator list. </p>
 */
@interface AWSapi.elastic-inferenceFilter : AWSModel


/**
 <p> The filter name for the Elastic Inference Accelerator list. It can assume the following values: accelerator-type: the type of Elastic Inference Accelerator to filter for. instance-id: an EC2 instance id to filter for. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> The values for the filter of the Elastic Inference Accelerator list. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p> A throughput entry for an Elastic Inference Accelerator type. </p>
 */
@interface AWSapi.elastic-inferenceKeyValuePair : AWSModel


/**
 <p> The throughput value of the Elastic Inference Accelerator type. It can assume the following values: TFLOPS16bit: the throughput expressed in 16bit TeraFLOPS. TFLOPS32bit: the throughput expressed in 32bit TeraFLOPS. </p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p> The throughput value of the Elastic Inference Accelerator type. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 
 */
@interface AWSapi.elastic-inferenceListTagsForResourceRequest : AWSRequest


/**
 <p> The ARN of the Elastic Inference Accelerator to list the tags for. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSapi.elastic-inferenceListTagsForResourceResult : AWSModel


/**
 <p> The tags of the Elastic Inference Accelerator. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p> The memory information of an Elastic Inference Accelerator type. </p>
 */
@interface AWSapi.elastic-inferenceMemoryInfo : AWSModel


/**
 <p> The size in mebibytes of the Elastic Inference Accelerator type. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizeInMiB;

@end

/**
 
 */
@interface AWSapi.elastic-inferenceTagResourceRequest : AWSRequest


/**
 <p> The ARN of the Elastic Inference Accelerator to tag. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p> The tags to add to the Elastic Inference Accelerator. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSapi.elastic-inferenceTagResourceResult : AWSModel


@end

/**
 
 */
@interface AWSapi.elastic-inferenceUntagResourceRequest : AWSRequest


/**
 <p> The ARN of the Elastic Inference Accelerator to untag. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p> The list of tags to remove from the Elastic Inference Accelerator. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSapi.elastic-inferenceUntagResourceResult : AWSModel


@end

NS_ASSUME_NONNULL_END
