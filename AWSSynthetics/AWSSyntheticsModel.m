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

#import "AWSSyntheticsModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSSyntheticsErrorDomain = @"com.amazonaws.AWSSyntheticsErrorDomain";

@implementation AWSSyntheticsCanary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"artifactS3Location" : @"ArtifactS3Location",
             @"code" : @"Code",
             @"engineArn" : @"EngineArn",
             @"executionRoleArn" : @"ExecutionRoleArn",
             @"failureRetentionPeriodInDays" : @"FailureRetentionPeriodInDays",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"runConfig" : @"RunConfig",
             @"runtimeVersion" : @"RuntimeVersion",
             @"schedule" : @"Schedule",
             @"status" : @"Status",
             @"successRetentionPeriodInDays" : @"SuccessRetentionPeriodInDays",
             @"tags" : @"Tags",
             @"timeline" : @"Timeline",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSyntheticsCanaryCodeOutput class]];
}

+ (NSValueTransformer *)runConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSyntheticsCanaryRunConfigOutput class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSyntheticsCanaryScheduleOutput class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSyntheticsCanaryStatus class]];
}

+ (NSValueTransformer *)timelineJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSyntheticsCanaryTimeline class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSyntheticsVpcConfigOutput class]];
}

@end

@implementation AWSSyntheticsCanaryCodeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"handler" : @"Handler",
             @"s3Bucket" : @"S3Bucket",
             @"s3Key" : @"S3Key",
             @"s3Version" : @"S3Version",
             @"zipFile" : @"ZipFile",
             };
}

@end

@implementation AWSSyntheticsCanaryCodeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"handler" : @"Handler",
             @"sourceLocationArn" : @"SourceLocationArn",
             };
}

@end

@implementation AWSSyntheticsCanaryLastRun

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"canaryName" : @"CanaryName",
             @"lastRun" : @"LastRun",
             };
}

+ (NSValueTransformer *)lastRunJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSyntheticsCanaryRun class]];
}

@end

@implementation AWSSyntheticsCanaryRun

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"artifactS3Location" : @"ArtifactS3Location",
             @"name" : @"Name",
             @"status" : @"Status",
             @"timeline" : @"Timeline",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSyntheticsCanaryRunStatus class]];
}

+ (NSValueTransformer *)timelineJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSyntheticsCanaryRunTimeline class]];
}

@end

@implementation AWSSyntheticsCanaryRunConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"memoryInMB" : @"MemoryInMB",
             @"timeoutInSeconds" : @"TimeoutInSeconds",
             };
}

@end

@implementation AWSSyntheticsCanaryRunConfigOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"memoryInMB" : @"MemoryInMB",
             @"timeoutInSeconds" : @"TimeoutInSeconds",
             };
}

@end

@implementation AWSSyntheticsCanaryRunStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"state" : @"State",
             @"stateReason" : @"StateReason",
             @"stateReasonCode" : @"StateReasonCode",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSSyntheticsCanaryRunStateRunning);
        }
        if ([value caseInsensitiveCompare:@"PASSED"] == NSOrderedSame) {
            return @(AWSSyntheticsCanaryRunStatePassed);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSyntheticsCanaryRunStateFailed);
        }
        return @(AWSSyntheticsCanaryRunStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSyntheticsCanaryRunStateRunning:
                return @"RUNNING";
            case AWSSyntheticsCanaryRunStatePassed:
                return @"PASSED";
            case AWSSyntheticsCanaryRunStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateReasonCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CANARY_FAILURE"] == NSOrderedSame) {
            return @(AWSSyntheticsCanaryRunStateReasonCodeCanaryFailure);
        }
        if ([value caseInsensitiveCompare:@"EXECUTION_FAILURE"] == NSOrderedSame) {
            return @(AWSSyntheticsCanaryRunStateReasonCodeExecutionFailure);
        }
        return @(AWSSyntheticsCanaryRunStateReasonCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSyntheticsCanaryRunStateReasonCodeCanaryFailure:
                return @"CANARY_FAILURE";
            case AWSSyntheticsCanaryRunStateReasonCodeExecutionFailure:
                return @"EXECUTION_FAILURE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSyntheticsCanaryRunTimeline

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completed" : @"Completed",
             @"started" : @"Started",
             };
}

+ (NSValueTransformer *)completedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSyntheticsCanaryScheduleInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInSeconds" : @"DurationInSeconds",
             @"expression" : @"Expression",
             };
}

@end

@implementation AWSSyntheticsCanaryScheduleOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInSeconds" : @"DurationInSeconds",
             @"expression" : @"Expression",
             };
}

@end

@implementation AWSSyntheticsCanaryStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"state" : @"State",
             @"stateReason" : @"StateReason",
             @"stateReasonCode" : @"StateReasonCode",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSSyntheticsCanaryStateCreating);
        }
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSSyntheticsCanaryStateReady);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSSyntheticsCanaryStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSSyntheticsCanaryStateRunning);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSSyntheticsCanaryStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSSyntheticsCanaryStateStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSSyntheticsCanaryStateStopped);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSSyntheticsCanaryStateError);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSSyntheticsCanaryStateDeleting);
        }
        return @(AWSSyntheticsCanaryStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSyntheticsCanaryStateCreating:
                return @"CREATING";
            case AWSSyntheticsCanaryStateReady:
                return @"READY";
            case AWSSyntheticsCanaryStateStarting:
                return @"STARTING";
            case AWSSyntheticsCanaryStateRunning:
                return @"RUNNING";
            case AWSSyntheticsCanaryStateUpdating:
                return @"UPDATING";
            case AWSSyntheticsCanaryStateStopping:
                return @"STOPPING";
            case AWSSyntheticsCanaryStateStopped:
                return @"STOPPED";
            case AWSSyntheticsCanaryStateError:
                return @"ERROR";
            case AWSSyntheticsCanaryStateDeleting:
                return @"DELETING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateReasonCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INVALID_PERMISSIONS"] == NSOrderedSame) {
            return @(AWSSyntheticsCanaryStateReasonCodeInvalidPermissions);
        }
        return @(AWSSyntheticsCanaryStateReasonCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSyntheticsCanaryStateReasonCodeInvalidPermissions:
                return @"INVALID_PERMISSIONS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSyntheticsCanaryTimeline

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"created" : @"Created",
             @"lastModified" : @"LastModified",
             @"lastStarted" : @"LastStarted",
             @"lastStopped" : @"LastStopped",
             };
}

+ (NSValueTransformer *)createdJSONTransformer {
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

+ (NSValueTransformer *)lastStartedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastStoppedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSyntheticsCreateCanaryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"artifactS3Location" : @"ArtifactS3Location",
             @"code" : @"Code",
             @"executionRoleArn" : @"ExecutionRoleArn",
             @"failureRetentionPeriodInDays" : @"FailureRetentionPeriodInDays",
             @"name" : @"Name",
             @"runConfig" : @"RunConfig",
             @"runtimeVersion" : @"RuntimeVersion",
             @"schedule" : @"Schedule",
             @"successRetentionPeriodInDays" : @"SuccessRetentionPeriodInDays",
             @"tags" : @"Tags",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSyntheticsCanaryCodeInput class]];
}

+ (NSValueTransformer *)runConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSyntheticsCanaryRunConfigInput class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSyntheticsCanaryScheduleInput class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSyntheticsVpcConfigInput class]];
}

@end

@implementation AWSSyntheticsCreateCanaryResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"canary" : @"Canary",
             };
}

+ (NSValueTransformer *)canaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSyntheticsCanary class]];
}

@end

@implementation AWSSyntheticsDeleteCanaryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSSyntheticsDeleteCanaryResponse

@end

@implementation AWSSyntheticsDescribeCanariesLastRunRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSyntheticsDescribeCanariesLastRunResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"canariesLastRun" : @"CanariesLastRun",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)canariesLastRunJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSyntheticsCanaryLastRun class]];
}

@end

@implementation AWSSyntheticsDescribeCanariesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSyntheticsDescribeCanariesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"canaries" : @"Canaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)canariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSyntheticsCanary class]];
}

@end

@implementation AWSSyntheticsDescribeRuntimeVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSyntheticsDescribeRuntimeVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"runtimeVersions" : @"RuntimeVersions",
             };
}

+ (NSValueTransformer *)runtimeVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSyntheticsRuntimeVersion class]];
}

@end

@implementation AWSSyntheticsGetCanaryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSSyntheticsGetCanaryResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"canary" : @"Canary",
             };
}

+ (NSValueTransformer *)canaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSyntheticsCanary class]];
}

@end

@implementation AWSSyntheticsGetCanaryRunsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"name" : @"Name",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSyntheticsGetCanaryRunsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"canaryRuns" : @"CanaryRuns",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)canaryRunsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSyntheticsCanaryRun class]];
}

@end

@implementation AWSSyntheticsListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSSyntheticsListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSSyntheticsRuntimeVersion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deprecationDate" : @"DeprecationDate",
             @"detail" : @"Description",
             @"releaseDate" : @"ReleaseDate",
             @"versionName" : @"VersionName",
             };
}

+ (NSValueTransformer *)deprecationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)releaseDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSyntheticsStartCanaryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSSyntheticsStartCanaryResponse

@end

@implementation AWSSyntheticsStopCanaryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSSyntheticsStopCanaryResponse

@end

@implementation AWSSyntheticsTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSSyntheticsTagResourceResponse

@end

@implementation AWSSyntheticsUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSSyntheticsUntagResourceResponse

@end

@implementation AWSSyntheticsUpdateCanaryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"executionRoleArn" : @"ExecutionRoleArn",
             @"failureRetentionPeriodInDays" : @"FailureRetentionPeriodInDays",
             @"name" : @"Name",
             @"runConfig" : @"RunConfig",
             @"runtimeVersion" : @"RuntimeVersion",
             @"schedule" : @"Schedule",
             @"successRetentionPeriodInDays" : @"SuccessRetentionPeriodInDays",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSyntheticsCanaryCodeInput class]];
}

+ (NSValueTransformer *)runConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSyntheticsCanaryRunConfigInput class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSyntheticsCanaryScheduleInput class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSyntheticsVpcConfigInput class]];
}

@end

@implementation AWSSyntheticsUpdateCanaryResponse

@end

@implementation AWSSyntheticsVpcConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             };
}

@end

@implementation AWSSyntheticsVpcConfigOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             @"vpcId" : @"VpcId",
             };
}

@end
