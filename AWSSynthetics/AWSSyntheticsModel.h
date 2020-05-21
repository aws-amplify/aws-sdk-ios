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

FOUNDATION_EXPORT NSString *const AWSSyntheticsErrorDomain;

typedef NS_ENUM(NSInteger, AWSSyntheticsErrorType) {
    AWSSyntheticsErrorUnknown,
    AWSSyntheticsErrorConflict,
    AWSSyntheticsErrorInternalServer,
    AWSSyntheticsErrorResourceNotFound,
    AWSSyntheticsErrorValidation,
};

typedef NS_ENUM(NSInteger, AWSSyntheticsCanaryRunState) {
    AWSSyntheticsCanaryRunStateUnknown,
    AWSSyntheticsCanaryRunStateRunning,
    AWSSyntheticsCanaryRunStatePassed,
    AWSSyntheticsCanaryRunStateFailed,
};

typedef NS_ENUM(NSInteger, AWSSyntheticsCanaryRunStateReasonCode) {
    AWSSyntheticsCanaryRunStateReasonCodeUnknown,
    AWSSyntheticsCanaryRunStateReasonCodeCanaryFailure,
    AWSSyntheticsCanaryRunStateReasonCodeExecutionFailure,
};

typedef NS_ENUM(NSInteger, AWSSyntheticsCanaryState) {
    AWSSyntheticsCanaryStateUnknown,
    AWSSyntheticsCanaryStateCreating,
    AWSSyntheticsCanaryStateReady,
    AWSSyntheticsCanaryStateStarting,
    AWSSyntheticsCanaryStateRunning,
    AWSSyntheticsCanaryStateUpdating,
    AWSSyntheticsCanaryStateStopping,
    AWSSyntheticsCanaryStateStopped,
    AWSSyntheticsCanaryStateError,
    AWSSyntheticsCanaryStateDeleting,
};

typedef NS_ENUM(NSInteger, AWSSyntheticsCanaryStateReasonCode) {
    AWSSyntheticsCanaryStateReasonCodeUnknown,
    AWSSyntheticsCanaryStateReasonCodeInvalidPermissions,
};

@class AWSSyntheticsCanary;
@class AWSSyntheticsCanaryCodeInput;
@class AWSSyntheticsCanaryCodeOutput;
@class AWSSyntheticsCanaryLastRun;
@class AWSSyntheticsCanaryRun;
@class AWSSyntheticsCanaryRunConfigInput;
@class AWSSyntheticsCanaryRunConfigOutput;
@class AWSSyntheticsCanaryRunStatus;
@class AWSSyntheticsCanaryRunTimeline;
@class AWSSyntheticsCanaryScheduleInput;
@class AWSSyntheticsCanaryScheduleOutput;
@class AWSSyntheticsCanaryStatus;
@class AWSSyntheticsCanaryTimeline;
@class AWSSyntheticsCreateCanaryRequest;
@class AWSSyntheticsCreateCanaryResponse;
@class AWSSyntheticsDeleteCanaryRequest;
@class AWSSyntheticsDeleteCanaryResponse;
@class AWSSyntheticsDescribeCanariesLastRunRequest;
@class AWSSyntheticsDescribeCanariesLastRunResponse;
@class AWSSyntheticsDescribeCanariesRequest;
@class AWSSyntheticsDescribeCanariesResponse;
@class AWSSyntheticsDescribeRuntimeVersionsRequest;
@class AWSSyntheticsDescribeRuntimeVersionsResponse;
@class AWSSyntheticsGetCanaryRequest;
@class AWSSyntheticsGetCanaryResponse;
@class AWSSyntheticsGetCanaryRunsRequest;
@class AWSSyntheticsGetCanaryRunsResponse;
@class AWSSyntheticsListTagsForResourceRequest;
@class AWSSyntheticsListTagsForResourceResponse;
@class AWSSyntheticsRuntimeVersion;
@class AWSSyntheticsStartCanaryRequest;
@class AWSSyntheticsStartCanaryResponse;
@class AWSSyntheticsStopCanaryRequest;
@class AWSSyntheticsStopCanaryResponse;
@class AWSSyntheticsTagResourceRequest;
@class AWSSyntheticsTagResourceResponse;
@class AWSSyntheticsUntagResourceRequest;
@class AWSSyntheticsUntagResourceResponse;
@class AWSSyntheticsUpdateCanaryRequest;
@class AWSSyntheticsUpdateCanaryResponse;
@class AWSSyntheticsVpcConfigInput;
@class AWSSyntheticsVpcConfigOutput;

/**
 <p>This structure contains all information about one canary in your account.</p>
 */
@interface AWSSyntheticsCanary : AWSModel


/**
 <p>The location in Amazon S3 where Synthetics stores artifacts from the runs of this canary. Artifacts include the log file, screenshots, and HAR files.</p>
 */
@property (nonatomic, strong) NSString * _Nullable artifactS3Location;

/**
 <p>This structure contains information about the canary's Lambda handler and where its code is stored by CloudWatch Synthetics.</p>
 */
@property (nonatomic, strong) AWSSyntheticsCanaryCodeOutput * _Nullable code;

/**
 <p>The ARN of the Lambda function that is used as your canary's engine. For more information about Lambda ARN format, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-api-permissions-ref.html">Resources and Conditions for Lambda Actions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineArn;

/**
 <p>The ARN of the IAM role used to run the canary. This role must include <code>lambda.amazonaws.com</code> as a principal in the trust policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionRoleArn;

/**
 <p>The number of days to retain data about failed runs of this canary.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failureRetentionPeriodInDays;

/**
 <p>The unique ID of this canary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the canary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A structure that contains information for a canary run.</p>
 */
@property (nonatomic, strong) AWSSyntheticsCanaryRunConfigOutput * _Nullable runConfig;

/**
 <p>Specifies the runtime version to use for the canary. Currently, the only valid value is <code>syn-1.0</code>. For more information about runtime versions, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Library.html"> Canary Runtime Versions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable runtimeVersion;

/**
 <p>A structure that contains information about how often the canary is to run, and when these runs are to stop.</p>
 */
@property (nonatomic, strong) AWSSyntheticsCanaryScheduleOutput * _Nullable schedule;

/**
 <p>A structure that contains information about the canary's status.</p>
 */
@property (nonatomic, strong) AWSSyntheticsCanaryStatus * _Nullable status;

/**
 <p>The number of days to retain data about successful runs of this canary.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable successRetentionPeriodInDays;

/**
 <p>The list of key-value pairs that are associated with the canary.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>A structure that contains information about when the canary was created, modified, and most recently run.</p>
 */
@property (nonatomic, strong) AWSSyntheticsCanaryTimeline * _Nullable timeline;

/**
 <p>If this canary is to test an endpoint in a VPC, this structure contains information about the subnets and security groups of the VPC endpoint. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_VPC.html"> Running a Canary in a VPC</a>.</p>
 */
@property (nonatomic, strong) AWSSyntheticsVpcConfigOutput * _Nullable vpcConfig;

@end

/**
 <p>Use this structure to input your script code for the canary. This structure contains the Lambda handler with the location where the canary should start running the script. If the script is stored in an S3 bucket, the bucket name, key, and version are also included. If the script was passed into the canary directly, the script code is contained in the value of <code>Zipfile</code>. </p>
 Required parameters: [Handler]
 */
@interface AWSSyntheticsCanaryCodeInput : AWSModel


/**
 <p>The entry point to use for the source code when running the canary. This value must end with the string <code>.handler</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable handler;

/**
 <p>If your canary script is located in S3, specify the full bucket name here. The bucket must already exist. Specify the full bucket name, including <code>s3://</code> as the start of the bucket name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Bucket;

/**
 <p>The S3 key of your script. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingObjects.html">Working with Amazon S3 Objects</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Key;

/**
 <p>The S3 version ID of your script.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Version;

/**
 <p>If you input your canary script directly into the canary instead of referring to an S3 location, the value of this parameter is the .zip file that contains the script. It can be up to 5 MB.</p>
 */
@property (nonatomic, strong) NSData * _Nullable zipFile;

@end

/**
 <p>This structure contains information about the canary's Lambda handler and where its code is stored by CloudWatch Synthetics.</p>
 */
@interface AWSSyntheticsCanaryCodeOutput : AWSModel


/**
 <p>The entry point to use for the source code when running the canary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable handler;

/**
 <p>The ARN of the Lambda layer where Synthetics stores the canary script code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceLocationArn;

@end

/**
 <p>This structure contains information about the most recent run of a single canary.</p>
 */
@interface AWSSyntheticsCanaryLastRun : AWSModel


/**
 <p>The name of the canary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable canaryName;

/**
 <p>The results from this canary's most recent run.</p>
 */
@property (nonatomic, strong) AWSSyntheticsCanaryRun * _Nullable lastRun;

@end

/**
 <p>This structure contains the details about one run of one canary.</p>
 */
@interface AWSSyntheticsCanaryRun : AWSModel


/**
 <p>The location where the canary stored artifacts from the run. Artifacts include the log file, screenshots, and HAR files.</p>
 */
@property (nonatomic, strong) NSString * _Nullable artifactS3Location;

/**
 <p>The name of the canary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of this run.</p>
 */
@property (nonatomic, strong) AWSSyntheticsCanaryRunStatus * _Nullable status;

/**
 <p>A structure that contains the start and end times of this run.</p>
 */
@property (nonatomic, strong) AWSSyntheticsCanaryRunTimeline * _Nullable timeline;

@end

/**
 <p>A structure that contains input information for a canary run.</p>
 Required parameters: [TimeoutInSeconds]
 */
@interface AWSSyntheticsCanaryRunConfigInput : AWSModel


/**
 <p>The maximum amount of memory available to the canary while it is running, in MB. The value you specify must be a multiple of 64.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable memoryInMB;

/**
 <p>How long the canary is allowed to run before it must stop. If you omit this field, the frequency of the canary is used as this value, up to a maximum of 14 minutes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutInSeconds;

@end

/**
 <p>A structure that contains information for a canary run.</p>
 */
@interface AWSSyntheticsCanaryRunConfigOutput : AWSModel


/**
 <p>The maximum amount of memory available to the canary while it is running, in MB. The value you must be a multiple of 64.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable memoryInMB;

/**
 <p>How long the canary is allowed to run before it must stop.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutInSeconds;

@end

/**
 <p>This structure contains the status information about a canary run.</p>
 */
@interface AWSSyntheticsCanaryRunStatus : AWSModel


/**
 <p>The current state of the run.</p>
 */
@property (nonatomic, assign) AWSSyntheticsCanaryRunState state;

/**
 <p>If run of the canary failed, this field contains the reason for the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateReason;

/**
 <p>If this value is <code>CANARY_FAILURE</code>, an exception occurred in the canary code. If this value is <code>EXECUTION_FAILURE</code>, an exception occurred in CloudWatch Synthetics.</p>
 */
@property (nonatomic, assign) AWSSyntheticsCanaryRunStateReasonCode stateReasonCode;

@end

/**
 <p>This structure contains the start and end times of a single canary run.</p>
 */
@interface AWSSyntheticsCanaryRunTimeline : AWSModel


/**
 <p>The end time of the run.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completed;

/**
 <p>The start time of the run.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable started;

@end

/**
 <p>This structure specifies how often a canary is to make runs and the date and time when it should stop making runs.</p>
 Required parameters: [Expression]
 */
@interface AWSSyntheticsCanaryScheduleInput : AWSModel


/**
 <p>How long, in seconds, for the canary to continue making regular runs according to the schedule in the <code>Expression</code> value. If you specify 0, the canary continues making runs until you stop it. If you omit this field, the default of 0 is used.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationInSeconds;

/**
 <p>A rate expression that defines how often the canary is to run. The syntax is <code>rate(<i>number unit</i>)</code>. <i>unit</i> can be <code>minute</code>, <code>minutes</code>, or <code>hour</code>. </p><p>For example, <code>rate(1 minute)</code> runs the canary once a minute, <code>rate(10 minutes)</code> runs it once every 10 minutes, and <code>rate(1 hour)</code> runs it once every hour. You can specify a frequency between <code>rate(1 minute)</code> and <code>rate(1 hour)</code>.</p><p>Specifying <code>rate(0 minute)</code> or <code>rate(0 hour)</code> is a special value that causes the canary to run only once when it is started.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expression;

@end

/**
 <p>How long, in seconds, for the canary to continue making regular runs according to the schedule in the <code>Expression</code> value.</p>
 */
@interface AWSSyntheticsCanaryScheduleOutput : AWSModel


/**
 <p>How long, in seconds, for the canary to continue making regular runs after it was created. The runs are performed according to the schedule in the <code>Expression</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationInSeconds;

/**
 <p>A rate expression that defines how often the canary is to run. The syntax is <code>rate(<i>number unit</i>)</code>. <i>unit</i> can be <code>minute</code>, <code>minutes</code>, or <code>hour</code>. </p><p>For example, <code>rate(1 minute)</code> runs the canary once a minute, <code>rate(10 minutes)</code> runs it once every 10 minutes, and <code>rate(1 hour)</code> runs it once every hour.</p><p>Specifying <code>rate(0 minute)</code> or <code>rate(0 hour)</code> is a special value that causes the canary to run only once when it is started.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expression;

@end

/**
 <p>A structure that contains the current state of the canary.</p>
 */
@interface AWSSyntheticsCanaryStatus : AWSModel


/**
 <p>The current state of the canary.</p>
 */
@property (nonatomic, assign) AWSSyntheticsCanaryState state;

/**
 <p>If the canary has insufficient permissions to run, this field provides more details.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateReason;

/**
 <p>If the canary cannot run or has failed, this field displays the reason.</p>
 */
@property (nonatomic, assign) AWSSyntheticsCanaryStateReasonCode stateReasonCode;

@end

/**
 <p>This structure contains information about when the canary was created and modified.</p>
 */
@interface AWSSyntheticsCanaryTimeline : AWSModel


/**
 <p>The date and time the canary was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable created;

/**
 <p>The date and time the canary was most recently modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 <p>The date and time that the canary's most recent run started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastStarted;

/**
 <p>The date and time that the canary's most recent run ended.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastStopped;

@end

/**
 
 */
@interface AWSSyntheticsCreateCanaryRequest : AWSRequest


/**
 <p>The location in Amazon S3 where Synthetics stores artifacts from the test runs of this canary. Artifacts include the log file, screenshots, and HAR files.</p>
 */
@property (nonatomic, strong) NSString * _Nullable artifactS3Location;

/**
 <p>A structure that includes the entry point from which the canary should start running your script. If the script is stored in an S3 bucket, the bucket name, key, and version are also included. </p>
 */
@property (nonatomic, strong) AWSSyntheticsCanaryCodeInput * _Nullable code;

/**
 <p>The ARN of the IAM role to be used to run the canary. This role must already exist, and must include <code>lambda.amazonaws.com</code> as a principal in the trust policy. The role must also have the following permissions:</p><ul><li><p><code>s3:PutObject</code></p></li><li><p><code>s3:GetBucketLocation</code></p></li><li><p><code>s3:ListAllMyBuckets</code></p></li><li><p><code>cloudwatch:PutMetricData</code></p></li><li><p><code>logs:CreateLogGroup</code></p></li><li><p><code>logs:CreateLogStream</code></p></li><li><p><code>logs:CreateLogStream</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable executionRoleArn;

/**
 <p>The number of days to retain data about failed runs of this canary. If you omit this field, the default of 31 days is used. The valid range is 1 to 455 days.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failureRetentionPeriodInDays;

/**
 <p>The name for this canary. Be sure to give it a descriptive name that distinguishes it from other canaries in your account.</p><p>Do not include secrets or proprietary information in your canary names. The canary name makes up part of the canary ARN, and the ARN is included in outbound calls over the internet. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/servicelens_canaries_security.html">Security Considerations for Synthetics Canaries</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A structure that contains the configuration for individual canary runs, such as timeout value.</p>
 */
@property (nonatomic, strong) AWSSyntheticsCanaryRunConfigInput * _Nullable runConfig;

/**
 <p>Specifies the runtime version to use for the canary. Currently, the only valid value is <code>syn-1.0</code>. For more information about runtime versions, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Library.html"> Canary Runtime Versions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable runtimeVersion;

/**
 <p>A structure that contains information about how often the canary is to run and when these test runs are to stop.</p>
 */
@property (nonatomic, strong) AWSSyntheticsCanaryScheduleInput * _Nullable schedule;

/**
 <p>The number of days to retain data about successful runs of this canary. If you omit this field, the default of 31 days is used. The valid range is 1 to 455 days.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable successRetentionPeriodInDays;

/**
 <p>A list of key-value pairs to associate with the canary. You can associate as many as 50 tags with a canary.</p><p>Tags can help you organize and categorize your resources. You can also use them to scope user permissions, by granting a user permission to access or change only the resources that have certain tag values.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>If this canary is to test an endpoint in a VPC, this structure contains information about the subnet and security groups of the VPC endpoint. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_VPC.html"> Running a Canary in a VPC</a>.</p>
 */
@property (nonatomic, strong) AWSSyntheticsVpcConfigInput * _Nullable vpcConfig;

@end

/**
 
 */
@interface AWSSyntheticsCreateCanaryResponse : AWSModel


/**
 <p>The full details about the canary you have created.</p>
 */
@property (nonatomic, strong) AWSSyntheticsCanary * _Nullable canary;

@end

/**
 
 */
@interface AWSSyntheticsDeleteCanaryRequest : AWSRequest


/**
 <p>The name of the canary that you want to delete. To find the names of your canaries, use <a href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_DescribeCanaries.html">DescribeCanaries</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSSyntheticsDeleteCanaryResponse : AWSModel


@end

/**
 
 */
@interface AWSSyntheticsDescribeCanariesLastRunRequest : AWSRequest


/**
 <p>Specify this parameter to limit how many runs are returned each time you use the <code>DescribeLastRun</code> operation. If you omit this parameter, the default of 100 is used.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token that indicates that there is more data available. You can use this token in a subsequent <code>DescribeCanaries</code> operation to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSyntheticsDescribeCanariesLastRunResponse : AWSModel


/**
 <p>An array that contains the information from the most recent run of each canary.</p>
 */
@property (nonatomic, strong) NSArray<AWSSyntheticsCanaryLastRun *> * _Nullable canariesLastRun;

/**
 <p>A token that indicates that there is more data available. You can use this token in a subsequent <code>DescribeCanariesLastRun</code> operation to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSyntheticsDescribeCanariesRequest : AWSRequest


/**
 <p>Specify this parameter to limit how many canaries are returned each time you use the <code>DescribeCanaries</code> operation. If you omit this parameter, the default of 100 is used.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token that indicates that there is more data available. You can use this token in a subsequent operation to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSyntheticsDescribeCanariesResponse : AWSModel


/**
 <p>Returns an array. Each item in the array contains the full information about one canary.</p>
 */
@property (nonatomic, strong) NSArray<AWSSyntheticsCanary *> * _Nullable canaries;

/**
 <p>A token that indicates that there is more data available. You can use this token in a subsequent <code>DescribeCanaries</code> operation to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSyntheticsDescribeRuntimeVersionsRequest : AWSRequest


/**
 <p>Specify this parameter to limit how many runs are returned each time you use the <code>DescribeRuntimeVersions</code> operation. If you omit this parameter, the default of 100 is used.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token that indicates that there is more data available. You can use this token in a subsequent <code>DescribeRuntimeVersions</code> operation to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSyntheticsDescribeRuntimeVersionsResponse : AWSModel


/**
 <p>A token that indicates that there is more data available. You can use this token in a subsequent <code>DescribeRuntimeVersions</code> operation to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of objects that display the details about each Synthetics canary runtime version.</p>
 */
@property (nonatomic, strong) NSArray<AWSSyntheticsRuntimeVersion *> * _Nullable runtimeVersions;

@end

/**
 
 */
@interface AWSSyntheticsGetCanaryRequest : AWSRequest


/**
 <p>The name of the canary that you want details for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSSyntheticsGetCanaryResponse : AWSModel


/**
 <p>A strucure that contains the full information about the canary.</p>
 */
@property (nonatomic, strong) AWSSyntheticsCanary * _Nullable canary;

@end

/**
 
 */
@interface AWSSyntheticsGetCanaryRunsRequest : AWSRequest


/**
 <p>Specify this parameter to limit how many runs are returned each time you use the <code>GetCanaryRuns</code> operation. If you omit this parameter, the default of 100 is used.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The name of the canary that you want to see runs for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A token that indicates that there is more data available. You can use this token in a subsequent <code>GetCanaryRuns</code> operation to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSyntheticsGetCanaryRunsResponse : AWSModel


/**
 <p>An array of structures. Each structure contains the details of one of the retrieved canary runs.</p>
 */
@property (nonatomic, strong) NSArray<AWSSyntheticsCanaryRun *> * _Nullable canaryRuns;

/**
 <p>A token that indicates that there is more data available. You can use this token in a subsequent <code>GetCanaryRuns</code> operation to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSyntheticsListTagsForResourceRequest : AWSRequest


/**
 <p>The ARN of the canary that you want to view tags for.</p><p>The ARN format of a canary is <code>arn:aws:synthetics:<i>Region</i>:<i>account-id</i>:canary:<i>canary-name</i></code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSSyntheticsListTagsForResourceResponse : AWSModel


/**
 <p>The list of tag keys and values associated with the canary that you specified.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>This structure contains information about one canary runtime version. For more information about runtime versions, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Library.html"> Canary Runtime Versions</a>.</p>
 */
@interface AWSSyntheticsRuntimeVersion : AWSModel


/**
 <p>If this runtime version is deprecated, this value is the date of deprecation.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deprecationDate;

/**
 <p>A description of the runtime version, created by Amazon.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The date that the runtime version was released.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable releaseDate;

/**
 <p>The name of the runtime version. Currently, the only valid value is <code>syn-1.0</code>. </p><p>Specifies the runtime version to use for the canary. Currently, the only valid value is <code>syn-1.0</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionName;

@end

/**
 
 */
@interface AWSSyntheticsStartCanaryRequest : AWSRequest


/**
 <p>The name of the canary that you want to run. To find canary names, use <a href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_DescribeCanaries.html">DescribeCanaries</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSSyntheticsStartCanaryResponse : AWSModel


@end

/**
 
 */
@interface AWSSyntheticsStopCanaryRequest : AWSRequest


/**
 <p>The name of the canary that you want to stop. To find the names of your canaries, use <a href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_DescribeCanaries.html">DescribeCanaries</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSSyntheticsStopCanaryResponse : AWSModel


@end

/**
 
 */
@interface AWSSyntheticsTagResourceRequest : AWSRequest


/**
 <p>The ARN of the canary that you're adding tags to.</p><p>The ARN format of a canary is <code>arn:aws:synthetics:<i>Region</i>:<i>account-id</i>:canary:<i>canary-name</i></code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The list of key-value pairs to associate with the canary.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSSyntheticsTagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSSyntheticsUntagResourceRequest : AWSRequest


/**
 <p>The ARN of the canary that you're removing tags from.</p><p>The ARN format of a canary is <code>arn:aws:synthetics:<i>Region</i>:<i>account-id</i>:canary:<i>canary-name</i></code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The list of tag keys to remove from the resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSSyntheticsUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSSyntheticsUpdateCanaryRequest : AWSRequest


/**
 <p>A structure that includes the entry point from which the canary should start running your script. If the script is stored in an S3 bucket, the bucket name, key, and version are also included. </p>
 */
@property (nonatomic, strong) AWSSyntheticsCanaryCodeInput * _Nullable code;

/**
 <p>The ARN of the IAM role to be used to run the canary. This role must already exist, and must include <code>lambda.amazonaws.com</code> as a principal in the trust policy. The role must also have the following permissions:</p><ul><li><p><code>s3:PutObject</code></p></li><li><p><code>s3:GetBucketLocation</code></p></li><li><p><code>s3:ListAllMyBuckets</code></p></li><li><p><code>cloudwatch:PutMetricData</code></p></li><li><p><code>logs:CreateLogGroup</code></p></li><li><p><code>logs:CreateLogStream</code></p></li><li><p><code>logs:CreateLogStream</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable executionRoleArn;

/**
 <p>The number of days to retain data about failed runs of this canary.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failureRetentionPeriodInDays;

/**
 <p>The name of the canary that you want to update. To find the names of your canaries, use <a href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_DescribeCanaries.html">DescribeCanaries</a>.</p><p>You cannot change the name of a canary that has already been created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A structure that contains the timeout value that is used for each individual run of the canary.</p>
 */
@property (nonatomic, strong) AWSSyntheticsCanaryRunConfigInput * _Nullable runConfig;

/**
 <p>Specifies the runtime version to use for the canary. Currently, the only valid value is <code>syn-1.0</code>. For more information about runtime versions, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Library.html"> Canary Runtime Versions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable runtimeVersion;

/**
 <p>A structure that contains information about how often the canary is to run, and when these runs are to stop.</p>
 */
@property (nonatomic, strong) AWSSyntheticsCanaryScheduleInput * _Nullable schedule;

/**
 <p>The number of days to retain data about successful runs of this canary.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable successRetentionPeriodInDays;

/**
 <p>If this canary is to test an endpoint in a VPC, this structure contains information about the subnet and security groups of the VPC endpoint. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_VPC.html"> Running a Canary in a VPC</a>.</p>
 */
@property (nonatomic, strong) AWSSyntheticsVpcConfigInput * _Nullable vpcConfig;

@end

/**
 
 */
@interface AWSSyntheticsUpdateCanaryResponse : AWSModel


@end

/**
 <p>If this canary is to test an endpoint in a VPC, this structure contains information about the subnets and security groups of the VPC endpoint. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_VPC.html"> Running a Canary in a VPC</a>.</p>
 */
@interface AWSSyntheticsVpcConfigInput : AWSModel


/**
 <p>The IDs of the security groups for this canary.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>The IDs of the subnets where this canary is to run.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

@end

/**
 <p>If this canary is to test an endpoint in a VPC, this structure contains information about the subnets and security groups of the VPC endpoint. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_VPC.html"> Running a Canary in a VPC</a>.</p>
 */
@interface AWSSyntheticsVpcConfigOutput : AWSModel


/**
 <p>The IDs of the security groups for this canary.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>The IDs of the subnets where this canary is to run.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>The IDs of the VPC where this canary is to run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

NS_ASSUME_NONNULL_END
