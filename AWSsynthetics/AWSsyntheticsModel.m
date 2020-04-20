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

#import "AWSsyntheticsModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSsyntheticsErrorDomain = @"com.amazonaws.AWSsyntheticsErrorDomain";

@implementation AWSsyntheticsCanary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsyntheticsCanaryCodeOutput class]];
}

+ (NSValueTransformer *)runConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsyntheticsCanaryRunConfigOutput class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsyntheticsCanaryScheduleOutput class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsyntheticsCanaryStatus class]];
}

+ (NSValueTransformer *)timelineJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsyntheticsCanaryTimeline class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsyntheticsVpcConfigOutput class]];
}

@end

@implementation AWSsyntheticsCanaryCodeInput

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

@implementation AWSsyntheticsCanaryCodeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"handler" : @"Handler",
             @"sourceLocationArn" : @"SourceLocationArn",
             };
}

@end

@implementation AWSsyntheticsCanaryLastRun

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"canaryName" : @"CanaryName",
             @"lastRun" : @"LastRun",
             };
}

+ (NSValueTransformer *)lastRunJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsyntheticsCanaryRun class]];
}

@end

@implementation AWSsyntheticsCanaryRun

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"artifactS3Location" : @"ArtifactS3Location",
             @"name" : @"Name",
             @"status" : @"Status",
             @"timeline" : @"Timeline",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsyntheticsCanaryRunStatus class]];
}

+ (NSValueTransformer *)timelineJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsyntheticsCanaryRunTimeline class]];
}

@end

@implementation AWSsyntheticsCanaryRunConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"timeoutInSeconds" : @"TimeoutInSeconds",
             };
}

@end

@implementation AWSsyntheticsCanaryRunConfigOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"timeoutInSeconds" : @"TimeoutInSeconds",
             };
}

@end

@implementation AWSsyntheticsCanaryRunStatus

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
            return @(AWSsyntheticsCanaryRunStateRunning);
        }
        if ([value caseInsensitiveCompare:@"PASSED"] == NSOrderedSame) {
            return @(AWSsyntheticsCanaryRunStatePassed);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSsyntheticsCanaryRunStateFailed);
        }
        return @(AWSsyntheticsCanaryRunStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsyntheticsCanaryRunStateRunning:
                return @"RUNNING";
            case AWSsyntheticsCanaryRunStatePassed:
                return @"PASSED";
            case AWSsyntheticsCanaryRunStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateReasonCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CANARY_FAILURE"] == NSOrderedSame) {
            return @(AWSsyntheticsCanaryRunStateReasonCodeCanaryFailure);
        }
        if ([value caseInsensitiveCompare:@"EXECUTION_FAILURE"] == NSOrderedSame) {
            return @(AWSsyntheticsCanaryRunStateReasonCodeExecutionFailure);
        }
        return @(AWSsyntheticsCanaryRunStateReasonCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsyntheticsCanaryRunStateReasonCodeCanaryFailure:
                return @"CANARY_FAILURE";
            case AWSsyntheticsCanaryRunStateReasonCodeExecutionFailure:
                return @"EXECUTION_FAILURE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSsyntheticsCanaryRunTimeline

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

@implementation AWSsyntheticsCanaryScheduleInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInSeconds" : @"DurationInSeconds",
             @"expression" : @"Expression",
             };
}

@end

@implementation AWSsyntheticsCanaryScheduleOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInSeconds" : @"DurationInSeconds",
             @"expression" : @"Expression",
             };
}

@end

@implementation AWSsyntheticsCanaryStatus

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
            return @(AWSsyntheticsCanaryStateCreating);
        }
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSsyntheticsCanaryStateReady);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSsyntheticsCanaryStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSsyntheticsCanaryStateRunning);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSsyntheticsCanaryStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSsyntheticsCanaryStateStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSsyntheticsCanaryStateStopped);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSsyntheticsCanaryStateError);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSsyntheticsCanaryStateDeleting);
        }
        return @(AWSsyntheticsCanaryStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsyntheticsCanaryStateCreating:
                return @"CREATING";
            case AWSsyntheticsCanaryStateReady:
                return @"READY";
            case AWSsyntheticsCanaryStateStarting:
                return @"STARTING";
            case AWSsyntheticsCanaryStateRunning:
                return @"RUNNING";
            case AWSsyntheticsCanaryStateUpdating:
                return @"UPDATING";
            case AWSsyntheticsCanaryStateStopping:
                return @"STOPPING";
            case AWSsyntheticsCanaryStateStopped:
                return @"STOPPED";
            case AWSsyntheticsCanaryStateError:
                return @"ERROR";
            case AWSsyntheticsCanaryStateDeleting:
                return @"DELETING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateReasonCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INVALID_PERMISSIONS"] == NSOrderedSame) {
            return @(AWSsyntheticsCanaryStateReasonCodeInvalidPermissions);
        }
        return @(AWSsyntheticsCanaryStateReasonCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsyntheticsCanaryStateReasonCodeInvalidPermissions:
                return @"INVALID_PERMISSIONS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSsyntheticsCanaryTimeline

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

@implementation AWSsyntheticsCreateCanaryRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsyntheticsCanaryCodeInput class]];
}

+ (NSValueTransformer *)runConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsyntheticsCanaryRunConfigInput class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsyntheticsCanaryScheduleInput class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsyntheticsVpcConfigInput class]];
}

@end

@implementation AWSsyntheticsCreateCanaryResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"canary" : @"Canary",
             };
}

+ (NSValueTransformer *)canaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsyntheticsCanary class]];
}

@end

@implementation AWSsyntheticsDeleteCanaryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSsyntheticsDeleteCanaryResponse

@end

@implementation AWSsyntheticsDescribeCanariesLastRunRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSsyntheticsDescribeCanariesLastRunResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"canariesLastRun" : @"CanariesLastRun",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)canariesLastRunJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsyntheticsCanaryLastRun class]];
}

@end

@implementation AWSsyntheticsDescribeCanariesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSsyntheticsDescribeCanariesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"canaries" : @"Canaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)canariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsyntheticsCanary class]];
}

@end

@implementation AWSsyntheticsDescribeRuntimeVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSsyntheticsDescribeRuntimeVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"runtimeVersions" : @"RuntimeVersions",
             };
}

+ (NSValueTransformer *)runtimeVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsyntheticsRuntimeVersion class]];
}

@end

@implementation AWSsyntheticsGetCanaryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSsyntheticsGetCanaryResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"canary" : @"Canary",
             };
}

+ (NSValueTransformer *)canaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsyntheticsCanary class]];
}

@end

@implementation AWSsyntheticsGetCanaryRunsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"name" : @"Name",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSsyntheticsGetCanaryRunsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"canaryRuns" : @"CanaryRuns",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)canaryRunsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsyntheticsCanaryRun class]];
}

@end

@implementation AWSsyntheticsListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSsyntheticsListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSsyntheticsRuntimeVersion

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

@implementation AWSsyntheticsStartCanaryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSsyntheticsStartCanaryResponse

@end

@implementation AWSsyntheticsStopCanaryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSsyntheticsStopCanaryResponse

@end

@implementation AWSsyntheticsTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSsyntheticsTagResourceResponse

@end

@implementation AWSsyntheticsUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSsyntheticsUntagResourceResponse

@end

@implementation AWSsyntheticsUpdateCanaryRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsyntheticsCanaryCodeInput class]];
}

+ (NSValueTransformer *)runConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsyntheticsCanaryRunConfigInput class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsyntheticsCanaryScheduleInput class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsyntheticsVpcConfigInput class]];
}

@end

@implementation AWSsyntheticsUpdateCanaryResponse

@end

@implementation AWSsyntheticsVpcConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             };
}

@end

@implementation AWSsyntheticsVpcConfigOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             @"vpcId" : @"VpcId",
             };
}

@end
