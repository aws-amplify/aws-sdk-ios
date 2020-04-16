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

FOUNDATION_EXPORT NSString *const AWSa2i-runtime.sagemakerErrorDomain;

typedef NS_ENUM(NSInteger, AWSa2i-runtime.sagemakerErrorType) {
    AWSa2i-runtime.sagemakerErrorUnknown,
    AWSa2i-runtime.sagemakerErrorConflict,
    AWSa2i-runtime.sagemakerErrorInternalServer,
    AWSa2i-runtime.sagemakerErrorResourceNotFound,
    AWSa2i-runtime.sagemakerErrorServiceQuotaExceeded,
    AWSa2i-runtime.sagemakerErrorThrottling,
    AWSa2i-runtime.sagemakerErrorValidation,
};

typedef NS_ENUM(NSInteger, AWSa2i-runtime.sagemakerContentClassifier) {
    AWSa2i-runtime.sagemakerContentClassifierUnknown,
    AWSa2i-runtime.sagemakerContentClassifierFreeOfPersonallyIdentifiableInformation,
    AWSa2i-runtime.sagemakerContentClassifierFreeOfAdultContent,
};

typedef NS_ENUM(NSInteger, AWSa2i-runtime.sagemakerHumanLoopStatus) {
    AWSa2i-runtime.sagemakerHumanLoopStatusUnknown,
    AWSa2i-runtime.sagemakerHumanLoopStatusInProgress,
    AWSa2i-runtime.sagemakerHumanLoopStatusFailed,
    AWSa2i-runtime.sagemakerHumanLoopStatusCompleted,
    AWSa2i-runtime.sagemakerHumanLoopStatusStopped,
    AWSa2i-runtime.sagemakerHumanLoopStatusStopping,
};

typedef NS_ENUM(NSInteger, AWSa2i-runtime.sagemakerSortOrder) {
    AWSa2i-runtime.sagemakerSortOrderUnknown,
    AWSa2i-runtime.sagemakerSortOrderAscending,
    AWSa2i-runtime.sagemakerSortOrderDescending,
};

@class AWSa2i-runtime.sagemakerDeleteHumanLoopRequest;
@class AWSa2i-runtime.sagemakerDeleteHumanLoopResponse;
@class AWSa2i-runtime.sagemakerDescribeHumanLoopRequest;
@class AWSa2i-runtime.sagemakerDescribeHumanLoopResponse;
@class AWSa2i-runtime.sagemakerHumanLoopDataAttributes;
@class AWSa2i-runtime.sagemakerHumanLoopInput;
@class AWSa2i-runtime.sagemakerHumanLoopOutput;
@class AWSa2i-runtime.sagemakerHumanLoopSummary;
@class AWSa2i-runtime.sagemakerListHumanLoopsRequest;
@class AWSa2i-runtime.sagemakerListHumanLoopsResponse;
@class AWSa2i-runtime.sagemakerStartHumanLoopRequest;
@class AWSa2i-runtime.sagemakerStartHumanLoopResponse;
@class AWSa2i-runtime.sagemakerStopHumanLoopRequest;
@class AWSa2i-runtime.sagemakerStopHumanLoopResponse;

/**
 
 */
@interface AWSa2i-runtime.sagemakerDeleteHumanLoopRequest : AWSRequest


/**
 <p>The name of the human loop that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable humanLoopName;

@end

/**
 
 */
@interface AWSa2i-runtime.sagemakerDeleteHumanLoopResponse : AWSModel


@end

/**
 
 */
@interface AWSa2i-runtime.sagemakerDescribeHumanLoopRequest : AWSRequest


/**
 <p>The name of the human loop that you want information about.</p>
 */
@property (nonatomic, strong) NSString * _Nullable humanLoopName;

@end

/**
 
 */
@interface AWSa2i-runtime.sagemakerDescribeHumanLoopResponse : AWSModel


/**
 <p>The creation time when Amazon Augmented AI created the human loop.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>A failure code that identifies the type of failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureCode;

/**
 <p>The reason why a human loop failed. The failure reason is returned when the status of the human loop is <code>Failed</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The Amazon Resource Name (ARN) of the flow definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable flowDefinitionArn;

/**
 <p>The Amazon Resource Name (ARN) of the human loop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable humanLoopArn;

/**
 <p>The name of the human loop. The name must be lowercase, unique within the Region in your account, and can have up to 63 characters. Valid characters: a-z, 0-9, and - (hyphen).</p>
 */
@property (nonatomic, strong) NSString * _Nullable humanLoopName;

/**
 <p>An object that contains information about the output of the human loop.</p>
 */
@property (nonatomic, strong) AWSa2i-runtime.sagemakerHumanLoopOutput * _Nullable humanLoopOutput;

/**
 <p>The status of the human loop. </p>
 */
@property (nonatomic, assign) AWSa2i-runtime.sagemakerHumanLoopStatus humanLoopStatus;

@end

/**
 <p>Attributes of the data specified by the customer. Use these to describe the data to be labeled.</p>
 Required parameters: [ContentClassifiers]
 */
@interface AWSa2i-runtime.sagemakerHumanLoopDataAttributes : AWSModel


/**
 <p>Declares that your content is free of personally identifiable information or adult content.</p><p>Amazon SageMaker can restrict the Amazon Mechanical Turk workers who can view your task based on this information.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable contentClassifiers;

@end

/**
 <p>An object containing the human loop input in JSON format.</p>
 Required parameters: [InputContent]
 */
@interface AWSa2i-runtime.sagemakerHumanLoopInput : AWSModel


/**
 <p>Serialized input from the human loop. The input must be a string representation of a file in JSON format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputContent;

@end

/**
 <p>Information about where the human output will be stored.</p>
 Required parameters: [OutputS3Uri]
 */
@interface AWSa2i-runtime.sagemakerHumanLoopOutput : AWSModel


/**
 <p>The location of the Amazon S3 object where Amazon Augmented AI stores your human loop output.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputS3Uri;

@end

/**
 <p>Summary information about the human loop.</p>
 */
@interface AWSa2i-runtime.sagemakerHumanLoopSummary : AWSModel


/**
 <p>When Amazon Augmented AI created the human loop.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The reason why the human loop failed. A failure reason is returned when the status of the human loop is <code>Failed</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The Amazon Resource Name (ARN) of the flow definition used to configure the human loop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable flowDefinitionArn;

/**
 <p>The name of the human loop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable humanLoopName;

/**
 <p>The status of the human loop. </p>
 */
@property (nonatomic, assign) AWSa2i-runtime.sagemakerHumanLoopStatus humanLoopStatus;

@end

/**
 
 */
@interface AWSa2i-runtime.sagemakerListHumanLoopsRequest : AWSRequest


/**
 <p>(Optional) The timestamp of the date when you want the human loops to begin in ISO 8601 format. For example, <code>2020-02-24</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeAfter;

/**
 <p>(Optional) The timestamp of the date before which you want the human loops to begin in ISO 8601 format. For example, <code>2020-02-24</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeBefore;

/**
 <p>The Amazon Resource Name (ARN) of a flow definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable flowDefinitionArn;

/**
 <p>The total number of items to return. If the total number of available items is more than the value specified in <code>MaxResults</code>, then a <code>NextToken</code> is returned in the output. You can use this token to display the next page of results. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to display the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Optional. The order for displaying results. Valid values: <code>Ascending</code> and <code>Descending</code>.</p>
 */
@property (nonatomic, assign) AWSa2i-runtime.sagemakerSortOrder sortOrder;

@end

/**
 
 */
@interface AWSa2i-runtime.sagemakerListHumanLoopsResponse : AWSModel


/**
 <p>An array of objects that contain information about the human loops.</p>
 */
@property (nonatomic, strong) NSArray<AWSa2i-runtime.sagemakerHumanLoopSummary *> * _Nullable humanLoopSummaries;

/**
 <p>A token to display the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSa2i-runtime.sagemakerStartHumanLoopRequest : AWSRequest


/**
 <p>Attributes of the specified data. Use <code>DataAttributes</code> to specify if your data is free of personally identifiable information and/or free of adult content.</p>
 */
@property (nonatomic, strong) AWSa2i-runtime.sagemakerHumanLoopDataAttributes * _Nullable dataAttributes;

/**
 <p>The Amazon Resource Name (ARN) of the flow definition associated with this human loop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable flowDefinitionArn;

/**
 <p>An object that contains information about the human loop.</p>
 */
@property (nonatomic, strong) AWSa2i-runtime.sagemakerHumanLoopInput * _Nullable humanLoopInput;

/**
 <p>The name of the human loop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable humanLoopName;

@end

/**
 
 */
@interface AWSa2i-runtime.sagemakerStartHumanLoopResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the human loop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable humanLoopArn;

@end

/**
 
 */
@interface AWSa2i-runtime.sagemakerStopHumanLoopRequest : AWSRequest


/**
 <p>The name of the human loop that you want to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable humanLoopName;

@end

/**
 
 */
@interface AWSa2i-runtime.sagemakerStopHumanLoopResponse : AWSModel


@end

NS_ASSUME_NONNULL_END
