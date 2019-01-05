//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

FOUNDATION_EXPORT NSString *const AWSLambdaErrorDomain;

typedef NS_ENUM(NSInteger, AWSLambdaErrorType) {
    AWSLambdaErrorUnknown,
    AWSLambdaErrorCodeStorageExceeded,
    AWSLambdaErrorEC2AccessDenied,
    AWSLambdaErrorEC2Throttled,
    AWSLambdaErrorEC2Unexpected,
    AWSLambdaErrorENILimitReached,
    AWSLambdaErrorInvalidParameterValue,
    AWSLambdaErrorInvalidRequestContent,
    AWSLambdaErrorInvalidRuntime,
    AWSLambdaErrorInvalidSecurityGroupID,
    AWSLambdaErrorInvalidSubnetID,
    AWSLambdaErrorInvalidZipFile,
    AWSLambdaErrorKMSAccessDenied,
    AWSLambdaErrorKMSDisabled,
    AWSLambdaErrorKMSInvalidState,
    AWSLambdaErrorKMSNotFound,
    AWSLambdaErrorPolicyLengthExceeded,
    AWSLambdaErrorPreconditionFailed,
    AWSLambdaErrorRequestTooLarge,
    AWSLambdaErrorResourceConflict,
    AWSLambdaErrorResourceInUse,
    AWSLambdaErrorResourceNotFound,
    AWSLambdaErrorService,
    AWSLambdaErrorSubnetIPAddressLimitReached,
    AWSLambdaErrorTooManyRequests,
    AWSLambdaErrorUnsupportedMediaType,
};

typedef NS_ENUM(NSInteger, AWSLambdaEventSourcePosition) {
    AWSLambdaEventSourcePositionUnknown,
    AWSLambdaEventSourcePositionTrimHorizon,
    AWSLambdaEventSourcePositionLatest,
    AWSLambdaEventSourcePositionAtTimestamp,
};

typedef NS_ENUM(NSInteger, AWSLambdaFunctionVersion) {
    AWSLambdaFunctionVersionUnknown,
    AWSLambdaFunctionVersionAll,
};

typedef NS_ENUM(NSInteger, AWSLambdaInvocationType) {
    AWSLambdaInvocationTypeUnknown,
    AWSLambdaInvocationTypeEvent,
    AWSLambdaInvocationTypeRequestResponse,
    AWSLambdaInvocationTypeDryRun,
};

typedef NS_ENUM(NSInteger, AWSLambdaLogType) {
    AWSLambdaLogTypeUnknown,
    AWSLambdaLogTypeNone,
    AWSLambdaLogTypeTail,
};

typedef NS_ENUM(NSInteger, AWSLambdaRuntime) {
    AWSLambdaRuntimeUnknown,
    AWSLambdaRuntimeNodejs,
    AWSLambdaRuntimeNodejs43,
    AWSLambdaRuntimeNodejs610,
    AWSLambdaRuntimeNodejs810,
    AWSLambdaRuntimeJava8,
    AWSLambdaRuntimePython27,
    AWSLambdaRuntimePython36,
    AWSLambdaRuntimeDotnetcore10,
    AWSLambdaRuntimeDotnetcore20,
    AWSLambdaRuntimeDotnetcore21,
    AWSLambdaRuntimeNodejs43Edge,
    AWSLambdaRuntimeGo1X,
};

typedef NS_ENUM(NSInteger, AWSLambdaThrottleReason) {
    AWSLambdaThrottleReasonUnknown,
    AWSLambdaThrottleReasonConcurrentInvocationLimitExceeded,
    AWSLambdaThrottleReasonFunctionInvocationRateLimitExceeded,
    AWSLambdaThrottleReasonReservedFunctionConcurrentInvocationLimitExceeded,
    AWSLambdaThrottleReasonReservedFunctionInvocationRateLimitExceeded,
    AWSLambdaThrottleReasonCallerRateLimitExceeded,
};

typedef NS_ENUM(NSInteger, AWSLambdaTracingMode) {
    AWSLambdaTracingModeUnknown,
    AWSLambdaTracingModeActive,
    AWSLambdaTracingModePassThrough,
};

@class AWSLambdaAccountLimit;
@class AWSLambdaAccountUsage;
@class AWSLambdaAddPermissionRequest;
@class AWSLambdaAddPermissionResponse;
@class AWSLambdaAliasConfiguration;
@class AWSLambdaAliasRoutingConfiguration;
@class AWSLambdaConcurrency;
@class AWSLambdaCreateAliasRequest;
@class AWSLambdaCreateEventSourceMappingRequest;
@class AWSLambdaCreateFunctionRequest;
@class AWSLambdaDeadLetterConfig;
@class AWSLambdaDeleteAliasRequest;
@class AWSLambdaDeleteEventSourceMappingRequest;
@class AWSLambdaDeleteFunctionConcurrencyRequest;
@class AWSLambdaDeleteFunctionRequest;
@class AWSLambdaEnvironment;
@class AWSLambdaEnvironmentError;
@class AWSLambdaEnvironmentResponse;
@class AWSLambdaEventSourceMappingConfiguration;
@class AWSLambdaFunctionCode;
@class AWSLambdaFunctionCodeLocation;
@class AWSLambdaFunctionConfiguration;
@class AWSLambdaGetAccountSettingsRequest;
@class AWSLambdaGetAccountSettingsResponse;
@class AWSLambdaGetAliasRequest;
@class AWSLambdaGetEventSourceMappingRequest;
@class AWSLambdaGetFunctionConfigurationRequest;
@class AWSLambdaGetFunctionRequest;
@class AWSLambdaGetFunctionResponse;
@class AWSLambdaGetPolicyRequest;
@class AWSLambdaGetPolicyResponse;
@class AWSLambdaInvocationRequest;
@class AWSLambdaInvocationResponse;
@class AWSLambdaInvokeAsyncRequest;
@class AWSLambdaInvokeAsyncResponse;
@class AWSLambdaListAliasesRequest;
@class AWSLambdaListAliasesResponse;
@class AWSLambdaListEventSourceMappingsRequest;
@class AWSLambdaListEventSourceMappingsResponse;
@class AWSLambdaListFunctionsRequest;
@class AWSLambdaListFunctionsResponse;
@class AWSLambdaListTagsRequest;
@class AWSLambdaListTagsResponse;
@class AWSLambdaListVersionsByFunctionRequest;
@class AWSLambdaListVersionsByFunctionResponse;
@class AWSLambdaPublishVersionRequest;
@class AWSLambdaPutFunctionConcurrencyRequest;
@class AWSLambdaRemovePermissionRequest;
@class AWSLambdaTagResourceRequest;
@class AWSLambdaTracingConfig;
@class AWSLambdaTracingConfigResponse;
@class AWSLambdaUntagResourceRequest;
@class AWSLambdaUpdateAliasRequest;
@class AWSLambdaUpdateEventSourceMappingRequest;
@class AWSLambdaUpdateFunctionCodeRequest;
@class AWSLambdaUpdateFunctionConfigurationRequest;
@class AWSLambdaVpcConfig;
@class AWSLambdaVpcConfigResponse;

/**
 <p>Provides limits of code size and concurrency associated with the current account and region. For more information or to request a limit increase for concurrent executions, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/limits.html">Lambda Limits</a>. </p>
 */
@interface AWSLambdaAccountLimit : AWSModel


/**
 <p>Size, in bytes, of code/dependencies that you can zip into a deployment package (uncompressed zip/jar size) for uploading. The default limit is 250 MB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable codeSizeUnzipped;

/**
 <p>Size, in bytes, of a single zipped code/dependencies package you can upload for your Lambda function(.zip/.jar file). Try using Amazon S3 for uploading larger files. Default limit is 50 MB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable codeSizeZipped;

/**
 <p>Number of simultaneous executions of your function per region. The default limit is 1000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable concurrentExecutions;

/**
 <p>Maximum size, in bytes, of a code package you can upload per region. The default size is 75 GB. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalCodeSize;

/**
 <p>The number of concurrent executions available to functions that do not have concurrency limits set. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html">Managing Concurrency</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable unreservedConcurrentExecutions;

@end

/**
 <p>Provides code size usage and function count associated with the current account and region.</p>
 */
@interface AWSLambdaAccountUsage : AWSModel


/**
 <p>The number of your account's existing functions per region.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable functionCount;

/**
 <p>Total size, in bytes, of the account's deployment packages per region.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalCodeSize;

@end

/**
 
 */
@interface AWSLambdaAddPermissionRequest : AWSRequest


/**
 <p>The AWS Lambda action you want to allow in this statement. Each Lambda action is a string starting with <code>lambda:</code> followed by the API name . For example, <code>lambda:CreateFunction</code>. You can use wildcard (<code>lambda:*</code>) to grant permission for all AWS Lambda actions. </p>
 */
@property (nonatomic, strong) NSString * _Nullable action;

/**
 <p>A unique token that must be supplied by the principal invoking the function. This is currently only used for Alexa Smart Home functions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventSourceToken;

/**
 <p>The name of the lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The principal who is getting this permission. The principal can be an AWS service (e.g. <code>s3.amazonaws.com</code> or <code>sns.amazonaws.com</code>) for service triggers, or an account ID for cross-account access. If you specify a service as a principal, use the <code>SourceArn</code> parameter to limit who can invoke the function through that service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

/**
 <p>Specify a version or alias to add permissions to a published version of the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

/**
 <p>An optional value you can use to ensure you are updating the latest update of the function version or alias. If the <code>RevisionID</code> you pass doesn't match the latest <code>RevisionId</code> of the function or alias, it will fail with an error message, advising you to retrieve the latest function version or alias <code>RevisionID</code> using either <a>GetFunction</a> or <a>GetAlias</a></p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

/**
 <p>This parameter is used for S3 and SES. The AWS account ID (without a hyphen) of the source owner. For example, if the <code>SourceArn</code> identifies a bucket, then this is the bucket owner's account ID. You can use this additional condition to ensure the bucket you specify is owned by a specific account (it is possible the bucket owner deleted the bucket and some other AWS account created the bucket). You can also use this condition to specify all sources (that is, you don't specify the <code>SourceArn</code>) owned by a specific account. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceAccount;

/**
 <p>The Amazon Resource Name of the invoker. </p><important><p>If you add a permission to a service principal without providing the source ARN, any AWS account that creates a mapping to your function ARN can invoke your Lambda function.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

/**
 <p>A unique statement identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statementId;

@end

/**
 
 */
@interface AWSLambdaAddPermissionResponse : AWSModel


/**
 <p>The permission statement you specified in the request. The response returns the same as a string using a backslash ("\") as an escape character in the JSON.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statement;

@end

/**
 <p>Provides configuration information about a Lambda function version alias.</p>
 */
@interface AWSLambdaAliasConfiguration : AWSModel


/**
 <p>Lambda function ARN that is qualified using the alias name as the suffix. For example, if you create an alias called <code>BETA</code> that points to a helloworld function version, the ARN is <code>arn:aws:lambda:aws-regions:acct-id:function:helloworld:BETA</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aliasArn;

/**
 <p>Alias description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Function version to which the alias points.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionVersion;

/**
 <p>Alias name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Represents the latest updated revision of the function or alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

/**
 <p>Specifies an additional function versions the alias points to, allowing you to dictate what percentage of traffic will invoke each version.</p>
 */
@property (nonatomic, strong) AWSLambdaAliasRoutingConfiguration * _Nullable routingConfig;

@end

/**
 <p>The alias's <a href="http://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html">traffic shifting</a> configuration.</p>
 */
@interface AWSLambdaAliasRoutingConfiguration : AWSModel


/**
 <p>The name of the second alias, and the percentage of traffic that is routed to it.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable additionalVersionWeights;

@end

/**
 
 */
@interface AWSLambdaConcurrency : AWSModel


/**
 <p>The number of concurrent executions reserved for this function. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html">Managing Concurrency</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable reservedConcurrentExecutions;

@end

/**
 
 */
@interface AWSLambdaCreateAliasRequest : AWSRequest


/**
 <p>Description of the alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Lambda function version for which you are creating the alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionVersion;

/**
 <p>Name for the alias you are creating.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Specifies an additional version your alias can point to, allowing you to dictate what percentage of traffic will invoke each version. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html">Traffic Shifting Using Aliases</a>.</p>
 */
@property (nonatomic, strong) AWSLambdaAliasRoutingConfiguration * _Nullable routingConfig;

@end

/**
 
 */
@interface AWSLambdaCreateEventSourceMappingRequest : AWSRequest


/**
 <p>The largest number of records that AWS Lambda will retrieve from your event source at the time of invoking your function. Your function receives an event with all the retrieved records. The default for Amazon Kinesis and Amazon DynamoDB is 100 records. Both the default and maximum for Amazon SQS are 10 messages.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable batchSize;

/**
 <p>Set to false to disable the event source upon creation. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The Amazon Resource Name (ARN) of the event source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventSourceArn;

/**
 <p>The name of the lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Version or Alias ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The position in the DynamoDB or Kinesis stream where AWS Lambda should start reading. For more information, see <a href="http://docs.aws.amazon.com/kinesis/latest/APIReference/API_GetShardIterator.html#Kinesis-GetShardIterator-request-ShardIteratorType">GetShardIterator</a> in the <i>Amazon Kinesis API Reference Guide</i> or <a href="http://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_streams_GetShardIterator.html">GetShardIterator</a> in the <i>Amazon DynamoDB API Reference Guide</i>. The <code>AT_TIMESTAMP</code> value is supported only for <a href="http://docs.aws.amazon.com/streams/latest/dev/amazon-kinesis-streams.html">Kinesis streams</a>. </p>
 */
@property (nonatomic, assign) AWSLambdaEventSourcePosition startingPosition;

/**
 <p>The timestamp of the data record from which to start reading. Used with <a href="http://docs.aws.amazon.com/kinesis/latest/APIReference/API_GetShardIterator.html#Kinesis-GetShardIterator-request-ShardIteratorType">shard iterator type</a> AT_TIMESTAMP. If a record with this exact timestamp does not exist, the iterator returned is for the next (later) record. If the timestamp is older than the current trim horizon, the iterator returned is for the oldest untrimmed data record (TRIM_HORIZON). Valid only for <a href="http://docs.aws.amazon.com/streams/latest/dev/amazon-kinesis-streams.html">Kinesis streams</a>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable startingPositionTimestamp;

@end

/**
 
 */
@interface AWSLambdaCreateFunctionRequest : AWSRequest


/**
 <p>The code for the function.</p>
 */
@property (nonatomic, strong) AWSLambdaFunctionCode * _Nullable code;

/**
 <p>A dead letter queue configuration that specifies the queue or topic where Lambda sends asynchronous events when they fail processing. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/dlq.html">Dead Letter Queues</a>. </p>
 */
@property (nonatomic, strong) AWSLambdaDeadLetterConfig * _Nullable deadLetterConfig;

/**
 <p>A description of the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Environment variables that are accessible from function code during execution.</p>
 */
@property (nonatomic, strong) AWSLambdaEnvironment * _Nullable environment;

/**
 <p>The name of the lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The name of the method within your code that Lambda calls to execute your function. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/programming-model-v2.html">Programming Model</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable handler;

/**
 <p>The ARN of the KMS key used to encrypt your function's environment variables. If not provided, AWS Lambda will use a default service key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKeyArn;

/**
 <p>The amount of memory that your function has access to. Increasing the function's memory also increases it's CPU allocation. The default value is 128 MB. The value must be a multiple of 64 MB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable memorySize;

/**
 <p>Set to true to publish the first version of the function during creation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publish;

/**
 <p>The Amazon Resource Name (ARN) of the function's <a href="http://docs.aws.amazon.com/lambda/latest/dg/intro-permission-model.html#lambda-intro-execution-role">execution role</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>The runtime version for the function.</p>
 */
@property (nonatomic, assign) AWSLambdaRuntime runtime;

/**
 <p>The list of tags (key-value pairs) assigned to the new function. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/tagging.html">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The amount of time that Lambda allows a function to run before terminating it. The default is 3 seconds. The maximum allowed value is 900 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeout;

/**
 <p>Set <code>Mode</code> to <code>Active</code> to sample and trace a subset of incoming requests with AWS X-Ray.</p>
 */
@property (nonatomic, strong) AWSLambdaTracingConfig * _Nullable tracingConfig;

/**
 <p>If your Lambda function accesses resources in a VPC, you provide this parameter identifying the list of security group IDs and subnet IDs. These must belong to the same VPC. You must provide at least one security group and one subnet ID.</p>
 */
@property (nonatomic, strong) AWSLambdaVpcConfig * _Nullable vpcConfig;

@end

/**
 <p>The <a href="http://docs.aws.amazon.com/lambda/latest/dg/dlq.html">dead letter queue</a> for failed asynchronous invocations.</p>
 */
@interface AWSLambdaDeadLetterConfig : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of an Amazon SQS queue or Amazon SNS topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

@end

/**
 
 */
@interface AWSLambdaDeleteAliasRequest : AWSRequest


/**
 <p>The name of the lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Name of the alias to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSLambdaDeleteEventSourceMappingRequest : AWSRequest


/**
 <p>The event source mapping ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable UUID;

@end

/**
 
 */
@interface AWSLambdaDeleteFunctionConcurrencyRequest : AWSRequest


/**
 <p>The name of the lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

@end

/**
 
 */
@interface AWSLambdaDeleteFunctionRequest : AWSRequest


/**
 <p>The name of the lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Specify a version to delete. You cannot delete a version that is referenced by an alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

@end

/**
 <p>A function's environment variable settings.</p>
 */
@interface AWSLambdaEnvironment : AWSModel


/**
 <p>Environment variable key-value pairs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable variables;

@end

/**
 <p>Error messages for environment variables that could not be applied.</p>
 */
@interface AWSLambdaEnvironmentError : AWSModel


/**
 <p>The error code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>The error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>The results of a configuration update that applied environment variables.</p>
 */
@interface AWSLambdaEnvironmentResponse : AWSModel


/**
 <p>Error messages for environment variables that could not be applied.</p>
 */
@property (nonatomic, strong) AWSLambdaEnvironmentError * _Nullable error;

/**
 <p>Environment variable key-value pairs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable variables;

@end

/**
 <p>Describes mapping between an Amazon Kinesis or DynamoDB stream and a Lambda function.</p>
 */
@interface AWSLambdaEventSourceMappingConfiguration : AWSModel


/**
 <p>The largest number of records that AWS Lambda will retrieve from your event source at the time of invoking your function. Your function receives an event with all the retrieved records.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable batchSize;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon Kinesis or DynamoDB stream that is the source of events.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventSourceArn;

/**
 <p>The Lambda function to invoke when AWS Lambda detects an event on the poll-based source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionArn;

/**
 <p>The UTC time string indicating the last time the event mapping was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 <p>The result of the last AWS Lambda invocation of your Lambda function. This value will be null if an SQS queue is the event source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastProcessingResult;

/**
 <p>The state of the event source mapping. It can be <code>Creating</code>, <code>Enabled</code>, <code>Disabled</code>, <code>Enabling</code>, <code>Disabling</code>, <code>Updating</code>, or <code>Deleting</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable state;

/**
 <p>The reason the event source mapping is in its current state. It is either user-requested or an AWS Lambda-initiated state transition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateTransitionReason;

/**
 <p>The AWS Lambda assigned opaque identifier for the mapping.</p>
 */
@property (nonatomic, strong) NSString * _Nullable UUID;

@end

/**
 <p>The code for the Lambda function. You can specify either an S3 location, or upload a deployment package directly.</p>
 */
@interface AWSLambdaFunctionCode : AWSModel


/**
 <p>An Amazon S3 bucket in the same region as your function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Bucket;

/**
 <p>The Amazon S3 key of the deployment package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Key;

/**
 <p>For versioned objects, the version of the deployment package object to use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3ObjectVersion;

/**
 <p>The base64-encoded contents of your zip file containing your deployment package. AWS SDK and AWS CLI clients handle the encoding for you.</p>
 */
@property (nonatomic, strong) NSData * _Nullable zipFile;

@end

/**
 <p>The object for the Lambda function location.</p>
 */
@interface AWSLambdaFunctionCodeLocation : AWSModel


/**
 <p>The presigned URL you can use to download the function's .zip file that you previously uploaded. The URL is valid for up to 10 minutes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>The repository from which you can download the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryType;

@end

/**
 <p>A Lambda function's configuration settings.</p>
 */
@interface AWSLambdaFunctionConfiguration : AWSModel


/**
 <p>The SHA256 hash of the function's deployment package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeSha256;

/**
 <p>The size of the function's deployment package in bytes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable codeSize;

/**
 <p>The function's dead letter queue.</p>
 */
@property (nonatomic, strong) AWSLambdaDeadLetterConfig * _Nullable deadLetterConfig;

/**
 <p>The function's description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The function's environment variables.</p>
 */
@property (nonatomic, strong) AWSLambdaEnvironmentResponse * _Nullable environment;

/**
 <p>The function's Amazon Resource Name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionArn;

/**
 <p>The name of the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The function Lambda calls to begin executing your function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable handler;

/**
 <p>The KMS key used to encrypt the function's environment variables. Only returned if you've configured a customer managed CMK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKeyArn;

/**
 <p>The date and time that the function was last updated, in <a href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a> (YYYY-MM-DDThh:mm:ssTZD).</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModified;

/**
 <p>The ARN of the master function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterArn;

/**
 <p>The memory allocated to the function</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable memorySize;

/**
 <p>Represents the latest updated revision of the function or alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

/**
 <p>The function's execution role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>The runtime environment for the Lambda function.</p>
 */
@property (nonatomic, assign) AWSLambdaRuntime runtime;

/**
 <p>The amount of time that Lambda allows a function to run before terminating it.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeout;

/**
 <p>The function's AWS X-Ray tracing configuration.</p>
 */
@property (nonatomic, strong) AWSLambdaTracingConfigResponse * _Nullable tracingConfig;

/**
 <p>The version of the Lambda function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

/**
 <p>The function's networking configuration.</p>
 */
@property (nonatomic, strong) AWSLambdaVpcConfigResponse * _Nullable vpcConfig;

@end

/**
 
 */
@interface AWSLambdaGetAccountSettingsRequest : AWSRequest


@end

/**
 
 */
@interface AWSLambdaGetAccountSettingsResponse : AWSModel


/**
 <p>Limits related to concurrency and code storage.</p>
 */
@property (nonatomic, strong) AWSLambdaAccountLimit * _Nullable accountLimit;

/**
 <p>The number of functions and amount of storage in use.</p>
 */
@property (nonatomic, strong) AWSLambdaAccountUsage * _Nullable accountUsage;

@end

/**
 
 */
@interface AWSLambdaGetAliasRequest : AWSRequest


/**
 <p>The name of the lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Name of the alias for which you want to retrieve information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSLambdaGetEventSourceMappingRequest : AWSRequest


/**
 <p>The AWS Lambda assigned ID of the event source mapping.</p>
 */
@property (nonatomic, strong) NSString * _Nullable UUID;

@end

/**
 
 */
@interface AWSLambdaGetFunctionConfigurationRequest : AWSRequest


/**
 <p>The name of the lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Specify a version or alias to get details about a published version of the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

@end

/**
 
 */
@interface AWSLambdaGetFunctionRequest : AWSRequest


/**
 <p>The name of the lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Specify a version or alias to get details about a published version of the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

@end

/**
 <p>This response contains the object for the Lambda function location (see <a>FunctionCodeLocation</a>.</p>
 */
@interface AWSLambdaGetFunctionResponse : AWSModel


/**
 <p>The function's code.</p>
 */
@property (nonatomic, strong) AWSLambdaFunctionCodeLocation * _Nullable code;

/**
 <p>The concurrent execution limit set for this function. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html">Managing Concurrency</a>.</p>
 */
@property (nonatomic, strong) AWSLambdaConcurrency * _Nullable concurrency;

/**
 <p>The function's configuration.</p>
 */
@property (nonatomic, strong) AWSLambdaFunctionConfiguration * _Nullable configuration;

/**
 <p>Returns the list of tags associated with the function. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/tagging.html">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLambdaGetPolicyRequest : AWSRequest


/**
 <p>The name of the lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>You can specify this optional query parameter to specify a function version or an alias name in which case this API will return all permissions associated with the specific qualified ARN. If you don't provide this parameter, the API will return permissions that apply to the unqualified function ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

@end

/**
 
 */
@interface AWSLambdaGetPolicyResponse : AWSModel


/**
 <p>The resource policy associated with the specified function. The response returns the same as a string using a backslash ("\") as an escape character in the JSON.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>Represents the latest updated revision of the function or alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 
 */
@interface AWSLambdaInvocationRequest : AWSRequest


/**
 <p>Using the <code>ClientContext</code> you can pass client-specific information to the Lambda function you are invoking. You can then process the client information in your Lambda function as you choose through the context variable. For an example of a <code>ClientContext</code> JSON, see <a href="http://docs.aws.amazon.com/mobileanalytics/latest/ug/PutEvents.html">PutEvents</a> in the <i>Amazon Mobile Analytics API Reference and User Guide</i>.</p><p>The ClientContext JSON must be base64-encoded and has a maximum size of 3583 bytes.</p><note><p><code>ClientContext</code> information is returned only if you use the synchronous (<code>RequestResponse</code>) invocation type.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable clientContext;

/**
 <p>The name of the lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Choose from the following options.</p><ul><li><p><code>RequestResponse</code> (default) - Invoke the function synchronously. Keep the connection open until the function returns a response or times out.</p></li><li><p><code>Event</code> - Invoke the function asynchronously. Send events that fail multiple times to the function's dead-letter queue (if configured).</p></li><li><p><code>DryRun</code> - Validate parameter values and verify that the user or role has permission to invoke the function.</p></li></ul>
 */
@property (nonatomic, assign) AWSLambdaInvocationType invocationType;

/**
 <p>You can set this optional parameter to <code>Tail</code> in the request only if you specify the <code>InvocationType</code> parameter with value <code>RequestResponse</code>. In this case, AWS Lambda returns the base64-encoded last 4 KB of log data produced by your Lambda function in the <code>x-amz-log-result</code> header. </p>
 */
@property (nonatomic, assign) AWSLambdaLogType logType;

/**
 <p>JSON that you want to provide to your Lambda function as input.</p>
 */
@property (nonatomic, strong) id _Nullable payload;

/**
 <p>Specify a version or alias to invoke a published version of the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

@end

/**
 <p>Upon success, returns an empty response. Otherwise, throws an exception.</p>
 */
@interface AWSLambdaInvocationResponse : AWSModel


/**
 <p>The function version that has been executed. This value is returned only if the invocation type is <code>RequestResponse</code>. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html">Traffic Shifting Using Aliases</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executedVersion;

/**
 <p>Indicates whether an error occurred while executing the Lambda function. If an error occurred this field will have one of two values; <code>Handled</code> or <code>Unhandled</code>. <code>Handled</code> errors are errors that are reported by the function while the <code>Unhandled</code> errors are those detected and reported by AWS Lambda. Unhandled errors include out of memory errors and function timeouts. For information about how to report an <code>Handled</code> error, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/programming-model.html">Programming Model</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable functionError;

/**
 <p> It is the base64-encoded logs for the Lambda function invocation. This is present only if the invocation type is <code>RequestResponse</code> and the logs were requested. </p>
 */
@property (nonatomic, strong) NSString * _Nullable logResult;

/**
 <p> It is the JSON representation of the object returned by the Lambda function. This is present only if the invocation type is <code>RequestResponse</code>. </p><p>In the event of a function error this field contains a message describing the error. For the <code>Handled</code> errors the Lambda function will report this message. For <code>Unhandled</code> errors AWS Lambda reports the message. </p>
 */
@property (nonatomic, strong) id _Nullable payload;

/**
 <p>The HTTP status code will be in the 200 range for successful request. For the <code>RequestResponse</code> invocation type this status code will be 200. For the <code>Event</code> invocation type this status code will be 202. For the <code>DryRun</code> invocation type the status code will be 204. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable statusCode;

@end

/**
 
 */
@interface AWSLambdaInvokeAsyncRequest : AWSRequest


/**
 <p>The name of the lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>JSON that you want to provide to your Lambda function as input.</p>
 */
@property (nonatomic, strong) NSData * _Nullable invokeArgs;

@end

/**
 <p>Upon success, it returns empty response. Otherwise, throws an exception.</p>
 */
@interface AWSLambdaInvokeAsyncResponse : AWSModel


/**
 <p>It will be 202 upon success.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable status;

@end

/**
 
 */
@interface AWSLambdaListAliasesRequest : AWSRequest


/**
 <p>The name of the lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>If you specify this optional parameter, the API returns only the aliases that are pointing to the specific Lambda function version, otherwise the API returns all of the aliases created for the Lambda function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionVersion;

/**
 <p>Optional string. An opaque pagination token returned from a previous <code>ListAliases</code> operation. If present, indicates where to continue the listing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Optional integer. Specifies the maximum number of aliases to return in response. This parameter value must be greater than 0.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

@end

/**
 
 */
@interface AWSLambdaListAliasesResponse : AWSModel


/**
 <p>A list of aliases.</p>
 */
@property (nonatomic, strong) NSArray<AWSLambdaAliasConfiguration *> * _Nullable aliases;

/**
 <p>A string, present if there are more aliases.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSLambdaListEventSourceMappingsRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the Amazon Kinesis or DynamoDB stream. (This parameter is optional.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventSourceArn;

/**
 <p>The name of the lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Version or Alias ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Optional string. An opaque pagination token returned from a previous <code>ListEventSourceMappings</code> operation. If present, specifies to continue the list from where the returning call left off. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Optional integer. Specifies the maximum number of event sources to return in response. This value must be greater than 0.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

@end

/**
 <p>Contains a list of event sources (see <a>EventSourceMappingConfiguration</a>)</p>
 */
@interface AWSLambdaListEventSourceMappingsResponse : AWSModel


/**
 <p>An array of <code>EventSourceMappingConfiguration</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSLambdaEventSourceMappingConfiguration *> * _Nullable eventSourceMappings;

/**
 <p>A string, present if there are more event source mappings.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSLambdaListFunctionsRequest : AWSRequest


/**
 <p>Set to <code>ALL</code> to list all published versions. If not specified, only the latest unpublished version ARN is returned.</p>
 */
@property (nonatomic, assign) AWSLambdaFunctionVersion functionVersion;

/**
 <p>Optional string. An opaque pagination token returned from a previous <code>ListFunctions</code> operation. If present, indicates where to continue the listing. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Specify a region (e.g. <code>us-east-2</code>) to only list functions that were created in that region, or <code>ALL</code> to include functions replicated from any region. If specified, you also must specify the <code>FunctionVersion</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterRegion;

/**
 <p>Optional integer. Specifies the maximum number of AWS Lambda functions to return in response. This parameter value must be greater than 0. The absolute maximum of AWS Lambda functions that can be returned is 50.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

@end

/**
 <p>A list of Lambda functions.</p>
 */
@interface AWSLambdaListFunctionsResponse : AWSModel


/**
 <p>A list of Lambda functions.</p>
 */
@property (nonatomic, strong) NSArray<AWSLambdaFunctionConfiguration *> * _Nullable functions;

/**
 <p>A string, present if there are more functions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSLambdaListTagsRequest : AWSRequest


/**
 <p>The ARN (Amazon Resource Name) of the function. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/tagging.html">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resource;

@end

/**
 
 */
@interface AWSLambdaListTagsResponse : AWSModel


/**
 <p>The list of tags assigned to the function. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/tagging.html">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLambdaListVersionsByFunctionRequest : AWSRequest


/**
 <p>The name of the lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p> Optional string. An opaque pagination token returned from a previous <code>ListVersionsByFunction</code> operation. If present, indicates where to continue the listing. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Optional integer. Specifies the maximum number of AWS Lambda function versions to return in response. This parameter value must be greater than 0.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

@end

/**
 
 */
@interface AWSLambdaListVersionsByFunctionResponse : AWSModel


/**
 <p>A string, present if there are more function versions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>A list of Lambda function versions.</p>
 */
@property (nonatomic, strong) NSArray<AWSLambdaFunctionConfiguration *> * _Nullable versions;

@end

/**
 
 */
@interface AWSLambdaPublishVersionRequest : AWSRequest


/**
 <p>The SHA256 hash of the deployment package you want to publish. This provides validation on the code you are publishing. If you provide this parameter, the value must match the SHA256 of the $LATEST version for the publication to succeed. You can use the <b>DryRun</b> parameter of <a>UpdateFunctionCode</a> to verify the hash value that will be returned before publishing your new version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeSha256;

/**
 <p>The description for the version you are publishing. If not provided, AWS Lambda copies the description from the $LATEST version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>An optional value you can use to ensure you are updating the latest update of the function version or alias. If the <code>RevisionID</code> you pass doesn't match the latest <code>RevisionId</code> of the function or alias, it will fail with an error message, advising you retrieve the latest function version or alias <code>RevisionID</code> using either <a>GetFunction</a> or <a>GetAlias</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 
 */
@interface AWSLambdaPutFunctionConcurrencyRequest : AWSRequest


/**
 <p>The name of the lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The concurrent execution limit reserved for this function.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable reservedConcurrentExecutions;

@end

/**
 
 */
@interface AWSLambdaRemovePermissionRequest : AWSRequest


/**
 <p>The name of the lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Specify a version or alias to remove permissions from a published version of the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

/**
 <p>An optional value you can use to ensure you are updating the latest update of the function version or alias. If the <code>RevisionID</code> you pass doesn't match the latest <code>RevisionId</code> of the function or alias, it will fail with an error message, advising you to retrieve the latest function version or alias <code>RevisionID</code> using either <a>GetFunction</a> or <a>GetAlias</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

/**
 <p>Statement ID of the permission to remove.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statementId;

@end

/**
 
 */
@interface AWSLambdaTagResourceRequest : AWSRequest


/**
 <p>The ARN (Amazon Resource Name) of the Lambda function. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/tagging.html">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resource;

/**
 <p>The list of tags (key-value pairs) you are assigning to the Lambda function. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/tagging.html">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>The function's AWS X-Ray tracing configuration.</p>
 */
@interface AWSLambdaTracingConfig : AWSModel


/**
 <p>The tracing mode.</p>
 */
@property (nonatomic, assign) AWSLambdaTracingMode mode;

@end

/**
 <p>The function's AWS X-Ray tracing configuration.</p>
 */
@interface AWSLambdaTracingConfigResponse : AWSModel


/**
 <p>The tracing mode.</p>
 */
@property (nonatomic, assign) AWSLambdaTracingMode mode;

@end

/**
 
 */
@interface AWSLambdaUntagResourceRequest : AWSRequest


/**
 <p>The ARN (Amazon Resource Name) of the function. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/tagging.html">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resource;

/**
 <p>The list of tag keys to be deleted from the function. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/tagging.html">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSLambdaUpdateAliasRequest : AWSRequest


/**
 <p>You can change the description of the alias using this parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>Using this parameter you can change the Lambda function version to which the alias points.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionVersion;

/**
 <p>The alias name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>An optional value you can use to ensure you are updating the latest update of the function version or alias. If the <code>RevisionID</code> you pass doesn't match the latest <code>RevisionId</code> of the function or alias, it will fail with an error message, advising you retrieve the latest function version or alias <code>RevisionID</code> using either <a>GetFunction</a> or <a>GetAlias</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

/**
 <p>Specifies an additional version your alias can point to, allowing you to dictate what percentage of traffic will invoke each version. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html">Traffic Shifting Using Aliases</a>.</p>
 */
@property (nonatomic, strong) AWSLambdaAliasRoutingConfiguration * _Nullable routingConfig;

@end

/**
 
 */
@interface AWSLambdaUpdateEventSourceMappingRequest : AWSRequest


/**
 <p>The largest number of records that AWS Lambda will retrieve from your event source at the time of invoking your function. Your function receives an event with all the retrieved records.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable batchSize;

/**
 <p>Specifies whether AWS Lambda should actively poll the stream or not. If disabled, AWS Lambda will not poll the stream.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The name of the lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Version or Alias ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The event source mapping identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable UUID;

@end

/**
 
 */
@interface AWSLambdaUpdateFunctionCodeRequest : AWSRequest


/**
 <p>This boolean parameter can be used to test your request to AWS Lambda to update the Lambda function and publish a version as an atomic operation. It will do all necessary computation and validation of your code but will not upload it or a publish a version. Each time this operation is invoked, the <code>CodeSha256</code> hash value of the provided code will also be computed and returned in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The name of the lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>This boolean parameter can be used to request AWS Lambda to update the Lambda function and publish a version as an atomic operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publish;

/**
 <p>An optional value you can use to ensure you are updating the latest update of the function version or alias. If the <code>RevisionID</code> you pass doesn't match the latest <code>RevisionId</code> of the function or alias, it will fail with an error message, advising you to retrieve the latest function version or alias <code>RevisionID</code> using either using using either <a>GetFunction</a> or <a>GetAlias</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

/**
 <p>Amazon S3 bucket name where the .zip file containing your deployment package is stored. This bucket must reside in the same AWS Region where you are creating the Lambda function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Bucket;

/**
 <p>The Amazon S3 object (the deployment package) key name you want to upload.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Key;

/**
 <p>The Amazon S3 object (the deployment package) version you want to upload.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3ObjectVersion;

/**
 <p>The contents of your zip file containing your deployment package. If you are using the web API directly, the contents of the zip file must be base64-encoded. If you are using the AWS SDKs or the AWS CLI, the SDKs or CLI will do the encoding for you. For more information about creating a .zip file, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/intro-permission-model.html#lambda-intro-execution-role.html">Execution Permissions</a>. </p>
 */
@property (nonatomic, strong) NSData * _Nullable zipFile;

@end

/**
 
 */
@interface AWSLambdaUpdateFunctionConfigurationRequest : AWSRequest


/**
 <p>A dead letter queue configuration that specifies the queue or topic where Lambda sends asynchronous events when they fail processing. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/dlq.html">Dead Letter Queues</a>.</p>
 */
@property (nonatomic, strong) AWSLambdaDeadLetterConfig * _Nullable deadLetterConfig;

/**
 <p>A short user-defined function description. AWS Lambda does not use this value. Assign a meaningful description as you see fit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The parent object that contains your environment's configuration settings.</p>
 */
@property (nonatomic, strong) AWSLambdaEnvironment * _Nullable environment;

/**
 <p>The name of the lambda function.</p><p class="title"><b>Name formats</b></p><ul><li><p><b>Function name</b> - <code>MyFunction</code>.</p></li><li><p><b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p></li><li><p><b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p></li></ul><p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The function that Lambda calls to begin executing your function. For Node.js, it is the <code>module-name.export</code> value in your function. </p>
 */
@property (nonatomic, strong) NSString * _Nullable handler;

/**
 <p>The Amazon Resource Name (ARN) of the KMS key used to encrypt your function's environment variables. If you elect to use the AWS Lambda default service key, pass in an empty string ("") for this parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKeyArn;

/**
 <p>The amount of memory, in MB, your Lambda function is given. AWS Lambda uses this memory size to infer the amount of CPU allocated to your function. Your function use-case determines your CPU and memory requirements. For example, a database operation might need less memory compared to an image processing function. The default value is 128 MB. The value must be a multiple of 64 MB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable memorySize;

/**
 <p>An optional value you can use to ensure you are updating the latest update of the function version or alias. If the <code>RevisionID</code> you pass doesn't match the latest <code>RevisionId</code> of the function or alias, it will fail with an error message, advising you to retrieve the latest function version or alias <code>RevisionID</code> using either <a>GetFunction</a> or <a>GetAlias</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role that Lambda will assume when it executes your function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>The runtime version for the function.</p>
 */
@property (nonatomic, assign) AWSLambdaRuntime runtime;

/**
 <p>The amount of time that Lambda allows a function to run before terminating it. The default is 3 seconds. The maximum allowed value is 900 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeout;

/**
 <p>Set <code>Mode</code> to <code>Active</code> to sample and trace a subset of incoming requests with AWS X-Ray.</p>
 */
@property (nonatomic, strong) AWSLambdaTracingConfig * _Nullable tracingConfig;

/**
 <p>Specify security groups and subnets in a VPC to which your Lambda function needs access.</p>
 */
@property (nonatomic, strong) AWSLambdaVpcConfig * _Nullable vpcConfig;

@end

/**
 <p>The VPC security groups and subnets attached to a Lambda function.</p>
 */
@interface AWSLambdaVpcConfig : AWSModel


/**
 <p>A list of VPC security groups IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>A list of VPC subnet IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

@end

/**
 <p>The VPC security groups and subnets attached to a Lambda function.</p>
 */
@interface AWSLambdaVpcConfigResponse : AWSModel


/**
 <p>A list of VPC security groups IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>A list of VPC subnet IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

NS_ASSUME_NONNULL_END
