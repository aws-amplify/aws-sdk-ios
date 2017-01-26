//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSLambdaModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSLambdaErrorDomain = @"com.amazonaws.AWSLambdaErrorDomain";

@implementation AWSLambdaAddPermissionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"eventSourceToken" : @"EventSourceToken",
             @"functionName" : @"FunctionName",
             @"principal" : @"Principal",
             @"qualifier" : @"Qualifier",
             @"sourceAccount" : @"SourceAccount",
             @"sourceArn" : @"SourceArn",
             @"statementId" : @"StatementId",
             };
}

@end

@implementation AWSLambdaAddPermissionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"statement" : @"Statement",
             };
}

@end

@implementation AWSLambdaAliasConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliasArn" : @"AliasArn",
             @"detail" : @"Description",
             @"functionVersion" : @"FunctionVersion",
             @"name" : @"Name",
             };
}

@end

@implementation AWSLambdaCreateAliasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"functionName" : @"FunctionName",
             @"functionVersion" : @"FunctionVersion",
             @"name" : @"Name",
             };
}

@end

@implementation AWSLambdaCreateEventSourceMappingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchSize" : @"BatchSize",
             @"enabled" : @"Enabled",
             @"eventSourceArn" : @"EventSourceArn",
             @"functionName" : @"FunctionName",
             @"startingPosition" : @"StartingPosition",
             };
}

+ (NSValueTransformer *)startingPositionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRIM_HORIZON"] == NSOrderedSame) {
            return @(AWSLambdaEventSourcePositionTrimHorizon);
        }
        if ([value caseInsensitiveCompare:@"LATEST"] == NSOrderedSame) {
            return @(AWSLambdaEventSourcePositionLatest);
        }
        return @(AWSLambdaEventSourcePositionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaEventSourcePositionTrimHorizon:
                return @"TRIM_HORIZON";
            case AWSLambdaEventSourcePositionLatest:
                return @"LATEST";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLambdaCreateFunctionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"detail" : @"Description",
             @"functionName" : @"FunctionName",
             @"handler" : @"Handler",
             @"memorySize" : @"MemorySize",
             @"publish" : @"Publish",
             @"role" : @"Role",
             @"runtime" : @"Runtime",
             @"timeout" : @"Timeout",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaFunctionCode class]];
}

+ (NSValueTransformer *)runtimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"nodejs"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs);
        }
        if ([value caseInsensitiveCompare:@"nodejs4.3"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs43);
        }
        if ([value caseInsensitiveCompare:@"java8"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeJava8);
        }
        if ([value caseInsensitiveCompare:@"python2.7"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython27);
        }
        return @(AWSLambdaRuntimeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaRuntimeNodejs:
                return @"nodejs";
            case AWSLambdaRuntimeNodejs43:
                return @"nodejs4.3";
            case AWSLambdaRuntimeJava8:
                return @"java8";
            case AWSLambdaRuntimePython27:
                return @"python2.7";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaVpcConfig class]];
}

@end

@implementation AWSLambdaDeleteAliasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"name" : @"Name",
             };
}

@end

@implementation AWSLambdaDeleteEventSourceMappingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"UUID" : @"UUID",
             };
}

@end

@implementation AWSLambdaDeleteFunctionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"qualifier" : @"Qualifier",
             };
}

@end

@implementation AWSLambdaEventSourceMappingConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchSize" : @"BatchSize",
             @"eventSourceArn" : @"EventSourceArn",
             @"functionArn" : @"FunctionArn",
             @"lastModified" : @"LastModified",
             @"lastProcessingResult" : @"LastProcessingResult",
             @"state" : @"State",
             @"stateTransitionReason" : @"StateTransitionReason",
             @"UUID" : @"UUID",
             };
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLambdaFunctionCode

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Bucket" : @"S3Bucket",
             @"s3Key" : @"S3Key",
             @"s3ObjectVersion" : @"S3ObjectVersion",
             @"zipFile" : @"ZipFile",
             };
}

@end

@implementation AWSLambdaFunctionCodeLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"location" : @"Location",
             @"repositoryType" : @"RepositoryType",
             };
}

@end

@implementation AWSLambdaFunctionConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeSha256" : @"CodeSha256",
             @"codeSize" : @"CodeSize",
             @"detail" : @"Description",
             @"functionArn" : @"FunctionArn",
             @"functionName" : @"FunctionName",
             @"handler" : @"Handler",
             @"lastModified" : @"LastModified",
             @"memorySize" : @"MemorySize",
             @"role" : @"Role",
             @"runtime" : @"Runtime",
             @"timeout" : @"Timeout",
             @"version" : @"Version",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)runtimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"nodejs"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs);
        }
        if ([value caseInsensitiveCompare:@"nodejs4.3"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs43);
        }
        if ([value caseInsensitiveCompare:@"java8"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeJava8);
        }
        if ([value caseInsensitiveCompare:@"python2.7"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython27);
        }
        return @(AWSLambdaRuntimeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaRuntimeNodejs:
                return @"nodejs";
            case AWSLambdaRuntimeNodejs43:
                return @"nodejs4.3";
            case AWSLambdaRuntimeJava8:
                return @"java8";
            case AWSLambdaRuntimePython27:
                return @"python2.7";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaVpcConfigResponse class]];
}

@end

@implementation AWSLambdaGetAliasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"name" : @"Name",
             };
}

@end

@implementation AWSLambdaGetEventSourceMappingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"UUID" : @"UUID",
             };
}

@end

@implementation AWSLambdaGetFunctionConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"qualifier" : @"Qualifier",
             };
}

@end

@implementation AWSLambdaGetFunctionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"qualifier" : @"Qualifier",
             };
}

@end

@implementation AWSLambdaGetFunctionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"configuration" : @"Configuration",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaFunctionCodeLocation class]];
}

+ (NSValueTransformer *)configurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaFunctionConfiguration class]];
}

@end

@implementation AWSLambdaGetPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"qualifier" : @"Qualifier",
             };
}

@end

@implementation AWSLambdaGetPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             };
}

@end

@implementation AWSLambdaInvocationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientContext" : @"ClientContext",
             @"functionName" : @"FunctionName",
             @"invocationType" : @"InvocationType",
             @"logType" : @"LogType",
             @"payload" : @"Payload",
             @"qualifier" : @"Qualifier",
             };
}

+ (NSValueTransformer *)invocationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Event"] == NSOrderedSame) {
            return @(AWSLambdaInvocationTypeEvent);
        }
        if ([value caseInsensitiveCompare:@"RequestResponse"] == NSOrderedSame) {
            return @(AWSLambdaInvocationTypeRequestResponse);
        }
        if ([value caseInsensitiveCompare:@"DryRun"] == NSOrderedSame) {
            return @(AWSLambdaInvocationTypeDryRun);
        }
        return @(AWSLambdaInvocationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaInvocationTypeEvent:
                return @"Event";
            case AWSLambdaInvocationTypeRequestResponse:
                return @"RequestResponse";
            case AWSLambdaInvocationTypeDryRun:
                return @"DryRun";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)logTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSLambdaLogTypeNone);
        }
        if ([value caseInsensitiveCompare:@"Tail"] == NSOrderedSame) {
            return @(AWSLambdaLogTypeTail);
        }
        return @(AWSLambdaLogTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaLogTypeNone:
                return @"None";
            case AWSLambdaLogTypeTail:
                return @"Tail";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLambdaInvocationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionError" : @"FunctionError",
             @"logResult" : @"LogResult",
             @"payload" : @"Payload",
             @"statusCode" : @"StatusCode",
             };
}

@end

@implementation AWSLambdaInvokeAsyncRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"invokeArgs" : @"InvokeArgs",
             };
}

@end

@implementation AWSLambdaInvokeAsyncResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             };
}

@end

@implementation AWSLambdaListAliasesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"functionVersion" : @"FunctionVersion",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSLambdaListAliasesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliases" : @"Aliases",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)aliasesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLambdaAliasConfiguration class]];
}

@end

@implementation AWSLambdaListEventSourceMappingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSourceArn" : @"EventSourceArn",
             @"functionName" : @"FunctionName",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSLambdaListEventSourceMappingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSourceMappings" : @"EventSourceMappings",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)eventSourceMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLambdaEventSourceMappingConfiguration class]];
}

@end

@implementation AWSLambdaListFunctionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSLambdaListFunctionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functions" : @"Functions",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)functionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLambdaFunctionConfiguration class]];
}

@end

@implementation AWSLambdaListVersionsByFunctionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSLambdaListVersionsByFunctionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"versions" : @"Versions",
             };
}

+ (NSValueTransformer *)versionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLambdaFunctionConfiguration class]];
}

@end

@implementation AWSLambdaPublishVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeSha256" : @"CodeSha256",
             @"detail" : @"Description",
             @"functionName" : @"FunctionName",
             };
}

@end

@implementation AWSLambdaRemovePermissionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"qualifier" : @"Qualifier",
             @"statementId" : @"StatementId",
             };
}

@end

@implementation AWSLambdaUpdateAliasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"functionName" : @"FunctionName",
             @"functionVersion" : @"FunctionVersion",
             @"name" : @"Name",
             };
}

@end

@implementation AWSLambdaUpdateEventSourceMappingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchSize" : @"BatchSize",
             @"enabled" : @"Enabled",
             @"functionName" : @"FunctionName",
             @"UUID" : @"UUID",
             };
}

@end

@implementation AWSLambdaUpdateFunctionCodeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"publish" : @"Publish",
             @"s3Bucket" : @"S3Bucket",
             @"s3Key" : @"S3Key",
             @"s3ObjectVersion" : @"S3ObjectVersion",
             @"zipFile" : @"ZipFile",
             };
}

@end

@implementation AWSLambdaUpdateFunctionConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"functionName" : @"FunctionName",
             @"handler" : @"Handler",
             @"memorySize" : @"MemorySize",
             @"role" : @"Role",
             @"runtime" : @"Runtime",
             @"timeout" : @"Timeout",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)runtimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"nodejs"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs);
        }
        if ([value caseInsensitiveCompare:@"nodejs4.3"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs43);
        }
        if ([value caseInsensitiveCompare:@"java8"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeJava8);
        }
        if ([value caseInsensitiveCompare:@"python2.7"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython27);
        }
        return @(AWSLambdaRuntimeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaRuntimeNodejs:
                return @"nodejs";
            case AWSLambdaRuntimeNodejs43:
                return @"nodejs4.3";
            case AWSLambdaRuntimeJava8:
                return @"java8";
            case AWSLambdaRuntimePython27:
                return @"python2.7";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaVpcConfig class]];
}

@end

@implementation AWSLambdaVpcConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             };
}

@end

@implementation AWSLambdaVpcConfigResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             @"vpcId" : @"VpcId",
             };
}

@end
