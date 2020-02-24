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

#import "AWSLambdaModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSLambdaErrorDomain = @"com.amazonaws.AWSLambdaErrorDomain";

@implementation AWSLambdaAccountLimit

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeSizeUnzipped" : @"CodeSizeUnzipped",
             @"codeSizeZipped" : @"CodeSizeZipped",
             @"concurrentExecutions" : @"ConcurrentExecutions",
             @"totalCodeSize" : @"TotalCodeSize",
             @"unreservedConcurrentExecutions" : @"UnreservedConcurrentExecutions",
             };
}

@end

@implementation AWSLambdaAccountUsage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionCount" : @"FunctionCount",
             @"totalCodeSize" : @"TotalCodeSize",
             };
}

@end

@implementation AWSLambdaAddLayerVersionPermissionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"layerName" : @"LayerName",
             @"organizationId" : @"OrganizationId",
             @"principal" : @"Principal",
             @"revisionId" : @"RevisionId",
             @"statementId" : @"StatementId",
             @"versionNumber" : @"VersionNumber",
             };
}

@end

@implementation AWSLambdaAddLayerVersionPermissionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"revisionId" : @"RevisionId",
             @"statement" : @"Statement",
             };
}

@end

@implementation AWSLambdaAddPermissionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"eventSourceToken" : @"EventSourceToken",
             @"functionName" : @"FunctionName",
             @"principal" : @"Principal",
             @"qualifier" : @"Qualifier",
             @"revisionId" : @"RevisionId",
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
             @"revisionId" : @"RevisionId",
             @"routingConfig" : @"RoutingConfig",
             };
}

+ (NSValueTransformer *)routingConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaAliasRoutingConfiguration class]];
}

@end

@implementation AWSLambdaAliasRoutingConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalVersionWeights" : @"AdditionalVersionWeights",
             };
}

@end

@implementation AWSLambdaConcurrency

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservedConcurrentExecutions" : @"ReservedConcurrentExecutions",
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
             @"routingConfig" : @"RoutingConfig",
             };
}

+ (NSValueTransformer *)routingConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaAliasRoutingConfiguration class]];
}

@end

@implementation AWSLambdaCreateEventSourceMappingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchSize" : @"BatchSize",
             @"bisectBatchOnFunctionError" : @"BisectBatchOnFunctionError",
             @"destinationConfig" : @"DestinationConfig",
             @"enabled" : @"Enabled",
             @"eventSourceArn" : @"EventSourceArn",
             @"functionName" : @"FunctionName",
             @"maximumBatchingWindowInSeconds" : @"MaximumBatchingWindowInSeconds",
             @"maximumRecordAgeInSeconds" : @"MaximumRecordAgeInSeconds",
             @"maximumRetryAttempts" : @"MaximumRetryAttempts",
             @"parallelizationFactor" : @"ParallelizationFactor",
             @"startingPosition" : @"StartingPosition",
             @"startingPositionTimestamp" : @"StartingPositionTimestamp",
             };
}

+ (NSValueTransformer *)destinationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaDestinationConfig class]];
}

+ (NSValueTransformer *)startingPositionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRIM_HORIZON"] == NSOrderedSame) {
            return @(AWSLambdaEventSourcePositionTrimHorizon);
        }
        if ([value caseInsensitiveCompare:@"LATEST"] == NSOrderedSame) {
            return @(AWSLambdaEventSourcePositionLatest);
        }
        if ([value caseInsensitiveCompare:@"AT_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSLambdaEventSourcePositionAtTimestamp);
        }
        return @(AWSLambdaEventSourcePositionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaEventSourcePositionTrimHorizon:
                return @"TRIM_HORIZON";
            case AWSLambdaEventSourcePositionLatest:
                return @"LATEST";
            case AWSLambdaEventSourcePositionAtTimestamp:
                return @"AT_TIMESTAMP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)startingPositionTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLambdaCreateFunctionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"deadLetterConfig" : @"DeadLetterConfig",
             @"detail" : @"Description",
             @"environment" : @"Environment",
             @"functionName" : @"FunctionName",
             @"handler" : @"Handler",
             @"KMSKeyArn" : @"KMSKeyArn",
             @"layers" : @"Layers",
             @"memorySize" : @"MemorySize",
             @"publish" : @"Publish",
             @"role" : @"Role",
             @"runtime" : @"Runtime",
             @"tags" : @"Tags",
             @"timeout" : @"Timeout",
             @"tracingConfig" : @"TracingConfig",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaFunctionCode class]];
}

+ (NSValueTransformer *)deadLetterConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaDeadLetterConfig class]];
}

+ (NSValueTransformer *)environmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaEnvironment class]];
}

+ (NSValueTransformer *)runtimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"nodejs"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs);
        }
        if ([value caseInsensitiveCompare:@"nodejs4.3"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs43);
        }
        if ([value caseInsensitiveCompare:@"nodejs6.10"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs610);
        }
        if ([value caseInsensitiveCompare:@"nodejs8.10"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs810);
        }
        if ([value caseInsensitiveCompare:@"nodejs10.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs10X);
        }
        if ([value caseInsensitiveCompare:@"nodejs12.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs12X);
        }
        if ([value caseInsensitiveCompare:@"java8"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeJava8);
        }
        if ([value caseInsensitiveCompare:@"java11"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeJava11);
        }
        if ([value caseInsensitiveCompare:@"python2.7"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython27);
        }
        if ([value caseInsensitiveCompare:@"python3.6"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython36);
        }
        if ([value caseInsensitiveCompare:@"python3.7"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython37);
        }
        if ([value caseInsensitiveCompare:@"python3.8"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython38);
        }
        if ([value caseInsensitiveCompare:@"dotnetcore1.0"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnetcore10);
        }
        if ([value caseInsensitiveCompare:@"dotnetcore2.0"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnetcore20);
        }
        if ([value caseInsensitiveCompare:@"dotnetcore2.1"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnetcore21);
        }
        if ([value caseInsensitiveCompare:@"nodejs4.3-edge"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs43Edge);
        }
        if ([value caseInsensitiveCompare:@"go1.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeGo1X);
        }
        if ([value caseInsensitiveCompare:@"ruby2.5"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeRuby25);
        }
        if ([value caseInsensitiveCompare:@"ruby2.7"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeRuby27);
        }
        if ([value caseInsensitiveCompare:@"provided"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeProvided);
        }
        return @(AWSLambdaRuntimeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaRuntimeNodejs:
                return @"nodejs";
            case AWSLambdaRuntimeNodejs43:
                return @"nodejs4.3";
            case AWSLambdaRuntimeNodejs610:
                return @"nodejs6.10";
            case AWSLambdaRuntimeNodejs810:
                return @"nodejs8.10";
            case AWSLambdaRuntimeNodejs10X:
                return @"nodejs10.x";
            case AWSLambdaRuntimeNodejs12X:
                return @"nodejs12.x";
            case AWSLambdaRuntimeJava8:
                return @"java8";
            case AWSLambdaRuntimeJava11:
                return @"java11";
            case AWSLambdaRuntimePython27:
                return @"python2.7";
            case AWSLambdaRuntimePython36:
                return @"python3.6";
            case AWSLambdaRuntimePython37:
                return @"python3.7";
            case AWSLambdaRuntimePython38:
                return @"python3.8";
            case AWSLambdaRuntimeDotnetcore10:
                return @"dotnetcore1.0";
            case AWSLambdaRuntimeDotnetcore20:
                return @"dotnetcore2.0";
            case AWSLambdaRuntimeDotnetcore21:
                return @"dotnetcore2.1";
            case AWSLambdaRuntimeNodejs43Edge:
                return @"nodejs4.3-edge";
            case AWSLambdaRuntimeGo1X:
                return @"go1.x";
            case AWSLambdaRuntimeRuby25:
                return @"ruby2.5";
            case AWSLambdaRuntimeRuby27:
                return @"ruby2.7";
            case AWSLambdaRuntimeProvided:
                return @"provided";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tracingConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaTracingConfig class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaVpcConfig class]];
}

@end

@implementation AWSLambdaDeadLetterConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetArn" : @"TargetArn",
             };
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

@implementation AWSLambdaDeleteFunctionConcurrencyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             };
}

@end

@implementation AWSLambdaDeleteFunctionEventInvokeConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"qualifier" : @"Qualifier",
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

@implementation AWSLambdaDeleteLayerVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"layerName" : @"LayerName",
             @"versionNumber" : @"VersionNumber",
             };
}

@end

@implementation AWSLambdaDeleteProvisionedConcurrencyConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"qualifier" : @"Qualifier",
             };
}

@end

@implementation AWSLambdaDestinationConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"onFailure" : @"OnFailure",
             @"onSuccess" : @"OnSuccess",
             };
}

+ (NSValueTransformer *)onFailureJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaOnFailure class]];
}

+ (NSValueTransformer *)onSuccessJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaOnSuccess class]];
}

@end

@implementation AWSLambdaEnvironment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"variables" : @"Variables",
             };
}

@end

@implementation AWSLambdaEnvironmentError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"message" : @"Message",
             };
}

@end

@implementation AWSLambdaEnvironmentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"error" : @"Error",
             @"variables" : @"Variables",
             };
}

+ (NSValueTransformer *)errorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaEnvironmentError class]];
}

@end

@implementation AWSLambdaEventSourceMappingConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchSize" : @"BatchSize",
             @"bisectBatchOnFunctionError" : @"BisectBatchOnFunctionError",
             @"destinationConfig" : @"DestinationConfig",
             @"eventSourceArn" : @"EventSourceArn",
             @"functionArn" : @"FunctionArn",
             @"lastModified" : @"LastModified",
             @"lastProcessingResult" : @"LastProcessingResult",
             @"maximumBatchingWindowInSeconds" : @"MaximumBatchingWindowInSeconds",
             @"maximumRecordAgeInSeconds" : @"MaximumRecordAgeInSeconds",
             @"maximumRetryAttempts" : @"MaximumRetryAttempts",
             @"parallelizationFactor" : @"ParallelizationFactor",
             @"state" : @"State",
             @"stateTransitionReason" : @"StateTransitionReason",
             @"UUID" : @"UUID",
             };
}

+ (NSValueTransformer *)destinationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaDestinationConfig class]];
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
             @"deadLetterConfig" : @"DeadLetterConfig",
             @"detail" : @"Description",
             @"environment" : @"Environment",
             @"functionArn" : @"FunctionArn",
             @"functionName" : @"FunctionName",
             @"handler" : @"Handler",
             @"KMSKeyArn" : @"KMSKeyArn",
             @"lastModified" : @"LastModified",
             @"lastUpdateStatus" : @"LastUpdateStatus",
             @"lastUpdateStatusReason" : @"LastUpdateStatusReason",
             @"lastUpdateStatusReasonCode" : @"LastUpdateStatusReasonCode",
             @"layers" : @"Layers",
             @"masterArn" : @"MasterArn",
             @"memorySize" : @"MemorySize",
             @"revisionId" : @"RevisionId",
             @"role" : @"Role",
             @"runtime" : @"Runtime",
             @"state" : @"State",
             @"stateReason" : @"StateReason",
             @"stateReasonCode" : @"StateReasonCode",
             @"timeout" : @"Timeout",
             @"tracingConfig" : @"TracingConfig",
             @"version" : @"Version",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)deadLetterConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaDeadLetterConfig class]];
}

+ (NSValueTransformer *)environmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaEnvironmentResponse class]];
}

+ (NSValueTransformer *)lastUpdateStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Successful"] == NSOrderedSame) {
            return @(AWSLambdaLastUpdateStatusSuccessful);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSLambdaLastUpdateStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSLambdaLastUpdateStatusInProgress);
        }
        return @(AWSLambdaLastUpdateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaLastUpdateStatusSuccessful:
                return @"Successful";
            case AWSLambdaLastUpdateStatusFailed:
                return @"Failed";
            case AWSLambdaLastUpdateStatusInProgress:
                return @"InProgress";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastUpdateStatusReasonCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EniLimitExceeded"] == NSOrderedSame) {
            return @(AWSLambdaLastUpdateStatusReasonCodeEniLimitExceeded);
        }
        if ([value caseInsensitiveCompare:@"InsufficientRolePermissions"] == NSOrderedSame) {
            return @(AWSLambdaLastUpdateStatusReasonCodeInsufficientRolePermissions);
        }
        if ([value caseInsensitiveCompare:@"InvalidConfiguration"] == NSOrderedSame) {
            return @(AWSLambdaLastUpdateStatusReasonCodeInvalidConfiguration);
        }
        if ([value caseInsensitiveCompare:@"InternalError"] == NSOrderedSame) {
            return @(AWSLambdaLastUpdateStatusReasonCodeInternalError);
        }
        if ([value caseInsensitiveCompare:@"SubnetOutOfIPAddresses"] == NSOrderedSame) {
            return @(AWSLambdaLastUpdateStatusReasonCodeSubnetOutOfIPAddresses);
        }
        if ([value caseInsensitiveCompare:@"InvalidSubnet"] == NSOrderedSame) {
            return @(AWSLambdaLastUpdateStatusReasonCodeInvalidSubnet);
        }
        if ([value caseInsensitiveCompare:@"InvalidSecurityGroup"] == NSOrderedSame) {
            return @(AWSLambdaLastUpdateStatusReasonCodeInvalidSecurityGroup);
        }
        return @(AWSLambdaLastUpdateStatusReasonCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaLastUpdateStatusReasonCodeEniLimitExceeded:
                return @"EniLimitExceeded";
            case AWSLambdaLastUpdateStatusReasonCodeInsufficientRolePermissions:
                return @"InsufficientRolePermissions";
            case AWSLambdaLastUpdateStatusReasonCodeInvalidConfiguration:
                return @"InvalidConfiguration";
            case AWSLambdaLastUpdateStatusReasonCodeInternalError:
                return @"InternalError";
            case AWSLambdaLastUpdateStatusReasonCodeSubnetOutOfIPAddresses:
                return @"SubnetOutOfIPAddresses";
            case AWSLambdaLastUpdateStatusReasonCodeInvalidSubnet:
                return @"InvalidSubnet";
            case AWSLambdaLastUpdateStatusReasonCodeInvalidSecurityGroup:
                return @"InvalidSecurityGroup";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)layersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLambdaLayer class]];
}

+ (NSValueTransformer *)runtimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"nodejs"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs);
        }
        if ([value caseInsensitiveCompare:@"nodejs4.3"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs43);
        }
        if ([value caseInsensitiveCompare:@"nodejs6.10"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs610);
        }
        if ([value caseInsensitiveCompare:@"nodejs8.10"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs810);
        }
        if ([value caseInsensitiveCompare:@"nodejs10.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs10X);
        }
        if ([value caseInsensitiveCompare:@"nodejs12.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs12X);
        }
        if ([value caseInsensitiveCompare:@"java8"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeJava8);
        }
        if ([value caseInsensitiveCompare:@"java11"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeJava11);
        }
        if ([value caseInsensitiveCompare:@"python2.7"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython27);
        }
        if ([value caseInsensitiveCompare:@"python3.6"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython36);
        }
        if ([value caseInsensitiveCompare:@"python3.7"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython37);
        }
        if ([value caseInsensitiveCompare:@"python3.8"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython38);
        }
        if ([value caseInsensitiveCompare:@"dotnetcore1.0"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnetcore10);
        }
        if ([value caseInsensitiveCompare:@"dotnetcore2.0"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnetcore20);
        }
        if ([value caseInsensitiveCompare:@"dotnetcore2.1"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnetcore21);
        }
        if ([value caseInsensitiveCompare:@"nodejs4.3-edge"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs43Edge);
        }
        if ([value caseInsensitiveCompare:@"go1.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeGo1X);
        }
        if ([value caseInsensitiveCompare:@"ruby2.5"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeRuby25);
        }
        if ([value caseInsensitiveCompare:@"ruby2.7"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeRuby27);
        }
        if ([value caseInsensitiveCompare:@"provided"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeProvided);
        }
        return @(AWSLambdaRuntimeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaRuntimeNodejs:
                return @"nodejs";
            case AWSLambdaRuntimeNodejs43:
                return @"nodejs4.3";
            case AWSLambdaRuntimeNodejs610:
                return @"nodejs6.10";
            case AWSLambdaRuntimeNodejs810:
                return @"nodejs8.10";
            case AWSLambdaRuntimeNodejs10X:
                return @"nodejs10.x";
            case AWSLambdaRuntimeNodejs12X:
                return @"nodejs12.x";
            case AWSLambdaRuntimeJava8:
                return @"java8";
            case AWSLambdaRuntimeJava11:
                return @"java11";
            case AWSLambdaRuntimePython27:
                return @"python2.7";
            case AWSLambdaRuntimePython36:
                return @"python3.6";
            case AWSLambdaRuntimePython37:
                return @"python3.7";
            case AWSLambdaRuntimePython38:
                return @"python3.8";
            case AWSLambdaRuntimeDotnetcore10:
                return @"dotnetcore1.0";
            case AWSLambdaRuntimeDotnetcore20:
                return @"dotnetcore2.0";
            case AWSLambdaRuntimeDotnetcore21:
                return @"dotnetcore2.1";
            case AWSLambdaRuntimeNodejs43Edge:
                return @"nodejs4.3-edge";
            case AWSLambdaRuntimeGo1X:
                return @"go1.x";
            case AWSLambdaRuntimeRuby25:
                return @"ruby2.5";
            case AWSLambdaRuntimeRuby27:
                return @"ruby2.7";
            case AWSLambdaRuntimeProvided:
                return @"provided";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSLambdaStatePending);
        }
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSLambdaStateActive);
        }
        if ([value caseInsensitiveCompare:@"Inactive"] == NSOrderedSame) {
            return @(AWSLambdaStateInactive);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSLambdaStateFailed);
        }
        return @(AWSLambdaStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaStatePending:
                return @"Pending";
            case AWSLambdaStateActive:
                return @"Active";
            case AWSLambdaStateInactive:
                return @"Inactive";
            case AWSLambdaStateFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateReasonCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Idle"] == NSOrderedSame) {
            return @(AWSLambdaStateReasonCodeIdle);
        }
        if ([value caseInsensitiveCompare:@"Creating"] == NSOrderedSame) {
            return @(AWSLambdaStateReasonCodeCreating);
        }
        if ([value caseInsensitiveCompare:@"Restoring"] == NSOrderedSame) {
            return @(AWSLambdaStateReasonCodeRestoring);
        }
        if ([value caseInsensitiveCompare:@"EniLimitExceeded"] == NSOrderedSame) {
            return @(AWSLambdaStateReasonCodeEniLimitExceeded);
        }
        if ([value caseInsensitiveCompare:@"InsufficientRolePermissions"] == NSOrderedSame) {
            return @(AWSLambdaStateReasonCodeInsufficientRolePermissions);
        }
        if ([value caseInsensitiveCompare:@"InvalidConfiguration"] == NSOrderedSame) {
            return @(AWSLambdaStateReasonCodeInvalidConfiguration);
        }
        if ([value caseInsensitiveCompare:@"InternalError"] == NSOrderedSame) {
            return @(AWSLambdaStateReasonCodeInternalError);
        }
        if ([value caseInsensitiveCompare:@"SubnetOutOfIPAddresses"] == NSOrderedSame) {
            return @(AWSLambdaStateReasonCodeSubnetOutOfIPAddresses);
        }
        if ([value caseInsensitiveCompare:@"InvalidSubnet"] == NSOrderedSame) {
            return @(AWSLambdaStateReasonCodeInvalidSubnet);
        }
        if ([value caseInsensitiveCompare:@"InvalidSecurityGroup"] == NSOrderedSame) {
            return @(AWSLambdaStateReasonCodeInvalidSecurityGroup);
        }
        return @(AWSLambdaStateReasonCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaStateReasonCodeIdle:
                return @"Idle";
            case AWSLambdaStateReasonCodeCreating:
                return @"Creating";
            case AWSLambdaStateReasonCodeRestoring:
                return @"Restoring";
            case AWSLambdaStateReasonCodeEniLimitExceeded:
                return @"EniLimitExceeded";
            case AWSLambdaStateReasonCodeInsufficientRolePermissions:
                return @"InsufficientRolePermissions";
            case AWSLambdaStateReasonCodeInvalidConfiguration:
                return @"InvalidConfiguration";
            case AWSLambdaStateReasonCodeInternalError:
                return @"InternalError";
            case AWSLambdaStateReasonCodeSubnetOutOfIPAddresses:
                return @"SubnetOutOfIPAddresses";
            case AWSLambdaStateReasonCodeInvalidSubnet:
                return @"InvalidSubnet";
            case AWSLambdaStateReasonCodeInvalidSecurityGroup:
                return @"InvalidSecurityGroup";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tracingConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaTracingConfigResponse class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaVpcConfigResponse class]];
}

@end

@implementation AWSLambdaFunctionEventInvokeConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationConfig" : @"DestinationConfig",
             @"functionArn" : @"FunctionArn",
             @"lastModified" : @"LastModified",
             @"maximumEventAgeInSeconds" : @"MaximumEventAgeInSeconds",
             @"maximumRetryAttempts" : @"MaximumRetryAttempts",
             };
}

+ (NSValueTransformer *)destinationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaDestinationConfig class]];
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLambdaGetAccountSettingsRequest

@end

@implementation AWSLambdaGetAccountSettingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountLimit" : @"AccountLimit",
             @"accountUsage" : @"AccountUsage",
             };
}

+ (NSValueTransformer *)accountLimitJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaAccountLimit class]];
}

+ (NSValueTransformer *)accountUsageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaAccountUsage class]];
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

@implementation AWSLambdaGetFunctionConcurrencyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             };
}

@end

@implementation AWSLambdaGetFunctionConcurrencyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservedConcurrentExecutions" : @"ReservedConcurrentExecutions",
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

@implementation AWSLambdaGetFunctionEventInvokeConfigRequest

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
             @"concurrency" : @"Concurrency",
             @"configuration" : @"Configuration",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaFunctionCodeLocation class]];
}

+ (NSValueTransformer *)concurrencyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaConcurrency class]];
}

+ (NSValueTransformer *)configurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaFunctionConfiguration class]];
}

@end

@implementation AWSLambdaGetLayerVersionByArnRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             };
}

@end

@implementation AWSLambdaGetLayerVersionPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"layerName" : @"LayerName",
             @"versionNumber" : @"VersionNumber",
             };
}

@end

@implementation AWSLambdaGetLayerVersionPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSLambdaGetLayerVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"layerName" : @"LayerName",
             @"versionNumber" : @"VersionNumber",
             };
}

@end

@implementation AWSLambdaGetLayerVersionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compatibleRuntimes" : @"CompatibleRuntimes",
             @"content" : @"Content",
             @"createdDate" : @"CreatedDate",
             @"detail" : @"Description",
             @"layerArn" : @"LayerArn",
             @"layerVersionArn" : @"LayerVersionArn",
             @"licenseInfo" : @"LicenseInfo",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)contentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaLayerVersionContentOutput class]];
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
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSLambdaGetProvisionedConcurrencyConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"qualifier" : @"Qualifier",
             };
}

@end

@implementation AWSLambdaGetProvisionedConcurrencyConfigResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocatedProvisionedConcurrentExecutions" : @"AllocatedProvisionedConcurrentExecutions",
             @"availableProvisionedConcurrentExecutions" : @"AvailableProvisionedConcurrentExecutions",
             @"lastModified" : @"LastModified",
             @"requestedProvisionedConcurrentExecutions" : @"RequestedProvisionedConcurrentExecutions",
             @"status" : @"Status",
             @"statusReason" : @"StatusReason",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSLambdaProvisionedConcurrencyStatusEnumInProgress);
        }
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSLambdaProvisionedConcurrencyStatusEnumReady);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSLambdaProvisionedConcurrencyStatusEnumFailed);
        }
        return @(AWSLambdaProvisionedConcurrencyStatusEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaProvisionedConcurrencyStatusEnumInProgress:
                return @"IN_PROGRESS";
            case AWSLambdaProvisionedConcurrencyStatusEnumReady:
                return @"READY";
            case AWSLambdaProvisionedConcurrencyStatusEnumFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
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
             @"executedVersion" : @"ExecutedVersion",
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

@implementation AWSLambdaLayer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"codeSize" : @"CodeSize",
             };
}

@end

@implementation AWSLambdaLayerVersionContentInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Bucket" : @"S3Bucket",
             @"s3Key" : @"S3Key",
             @"s3ObjectVersion" : @"S3ObjectVersion",
             @"zipFile" : @"ZipFile",
             };
}

@end

@implementation AWSLambdaLayerVersionContentOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeSha256" : @"CodeSha256",
             @"codeSize" : @"CodeSize",
             @"location" : @"Location",
             };
}

@end

@implementation AWSLambdaLayerVersionsListItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compatibleRuntimes" : @"CompatibleRuntimes",
             @"createdDate" : @"CreatedDate",
             @"detail" : @"Description",
             @"layerVersionArn" : @"LayerVersionArn",
             @"licenseInfo" : @"LicenseInfo",
             @"version" : @"Version",
             };
}

@end

@implementation AWSLambdaLayersListItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"latestMatchingVersion" : @"LatestMatchingVersion",
             @"layerArn" : @"LayerArn",
             @"layerName" : @"LayerName",
             };
}

+ (NSValueTransformer *)latestMatchingVersionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaLayerVersionsListItem class]];
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

@implementation AWSLambdaListFunctionEventInvokeConfigsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSLambdaListFunctionEventInvokeConfigsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionEventInvokeConfigs" : @"FunctionEventInvokeConfigs",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)functionEventInvokeConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLambdaFunctionEventInvokeConfig class]];
}

@end

@implementation AWSLambdaListFunctionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionVersion" : @"FunctionVersion",
             @"marker" : @"Marker",
             @"masterRegion" : @"MasterRegion",
             @"maxItems" : @"MaxItems",
             };
}

+ (NSValueTransformer *)functionVersionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSLambdaFunctionVersionAll);
        }
        return @(AWSLambdaFunctionVersionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaFunctionVersionAll:
                return @"ALL";
            default:
                return nil;
        }
    }];
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

@implementation AWSLambdaListLayerVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compatibleRuntime" : @"CompatibleRuntime",
             @"layerName" : @"LayerName",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

+ (NSValueTransformer *)compatibleRuntimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"nodejs"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs);
        }
        if ([value caseInsensitiveCompare:@"nodejs4.3"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs43);
        }
        if ([value caseInsensitiveCompare:@"nodejs6.10"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs610);
        }
        if ([value caseInsensitiveCompare:@"nodejs8.10"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs810);
        }
        if ([value caseInsensitiveCompare:@"nodejs10.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs10X);
        }
        if ([value caseInsensitiveCompare:@"nodejs12.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs12X);
        }
        if ([value caseInsensitiveCompare:@"java8"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeJava8);
        }
        if ([value caseInsensitiveCompare:@"java11"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeJava11);
        }
        if ([value caseInsensitiveCompare:@"python2.7"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython27);
        }
        if ([value caseInsensitiveCompare:@"python3.6"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython36);
        }
        if ([value caseInsensitiveCompare:@"python3.7"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython37);
        }
        if ([value caseInsensitiveCompare:@"python3.8"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython38);
        }
        if ([value caseInsensitiveCompare:@"dotnetcore1.0"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnetcore10);
        }
        if ([value caseInsensitiveCompare:@"dotnetcore2.0"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnetcore20);
        }
        if ([value caseInsensitiveCompare:@"dotnetcore2.1"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnetcore21);
        }
        if ([value caseInsensitiveCompare:@"nodejs4.3-edge"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs43Edge);
        }
        if ([value caseInsensitiveCompare:@"go1.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeGo1X);
        }
        if ([value caseInsensitiveCompare:@"ruby2.5"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeRuby25);
        }
        if ([value caseInsensitiveCompare:@"ruby2.7"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeRuby27);
        }
        if ([value caseInsensitiveCompare:@"provided"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeProvided);
        }
        return @(AWSLambdaRuntimeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaRuntimeNodejs:
                return @"nodejs";
            case AWSLambdaRuntimeNodejs43:
                return @"nodejs4.3";
            case AWSLambdaRuntimeNodejs610:
                return @"nodejs6.10";
            case AWSLambdaRuntimeNodejs810:
                return @"nodejs8.10";
            case AWSLambdaRuntimeNodejs10X:
                return @"nodejs10.x";
            case AWSLambdaRuntimeNodejs12X:
                return @"nodejs12.x";
            case AWSLambdaRuntimeJava8:
                return @"java8";
            case AWSLambdaRuntimeJava11:
                return @"java11";
            case AWSLambdaRuntimePython27:
                return @"python2.7";
            case AWSLambdaRuntimePython36:
                return @"python3.6";
            case AWSLambdaRuntimePython37:
                return @"python3.7";
            case AWSLambdaRuntimePython38:
                return @"python3.8";
            case AWSLambdaRuntimeDotnetcore10:
                return @"dotnetcore1.0";
            case AWSLambdaRuntimeDotnetcore20:
                return @"dotnetcore2.0";
            case AWSLambdaRuntimeDotnetcore21:
                return @"dotnetcore2.1";
            case AWSLambdaRuntimeNodejs43Edge:
                return @"nodejs4.3-edge";
            case AWSLambdaRuntimeGo1X:
                return @"go1.x";
            case AWSLambdaRuntimeRuby25:
                return @"ruby2.5";
            case AWSLambdaRuntimeRuby27:
                return @"ruby2.7";
            case AWSLambdaRuntimeProvided:
                return @"provided";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLambdaListLayerVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"layerVersions" : @"LayerVersions",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)layerVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLambdaLayerVersionsListItem class]];
}

@end

@implementation AWSLambdaListLayersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compatibleRuntime" : @"CompatibleRuntime",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

+ (NSValueTransformer *)compatibleRuntimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"nodejs"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs);
        }
        if ([value caseInsensitiveCompare:@"nodejs4.3"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs43);
        }
        if ([value caseInsensitiveCompare:@"nodejs6.10"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs610);
        }
        if ([value caseInsensitiveCompare:@"nodejs8.10"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs810);
        }
        if ([value caseInsensitiveCompare:@"nodejs10.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs10X);
        }
        if ([value caseInsensitiveCompare:@"nodejs12.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs12X);
        }
        if ([value caseInsensitiveCompare:@"java8"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeJava8);
        }
        if ([value caseInsensitiveCompare:@"java11"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeJava11);
        }
        if ([value caseInsensitiveCompare:@"python2.7"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython27);
        }
        if ([value caseInsensitiveCompare:@"python3.6"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython36);
        }
        if ([value caseInsensitiveCompare:@"python3.7"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython37);
        }
        if ([value caseInsensitiveCompare:@"python3.8"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython38);
        }
        if ([value caseInsensitiveCompare:@"dotnetcore1.0"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnetcore10);
        }
        if ([value caseInsensitiveCompare:@"dotnetcore2.0"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnetcore20);
        }
        if ([value caseInsensitiveCompare:@"dotnetcore2.1"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnetcore21);
        }
        if ([value caseInsensitiveCompare:@"nodejs4.3-edge"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs43Edge);
        }
        if ([value caseInsensitiveCompare:@"go1.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeGo1X);
        }
        if ([value caseInsensitiveCompare:@"ruby2.5"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeRuby25);
        }
        if ([value caseInsensitiveCompare:@"ruby2.7"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeRuby27);
        }
        if ([value caseInsensitiveCompare:@"provided"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeProvided);
        }
        return @(AWSLambdaRuntimeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaRuntimeNodejs:
                return @"nodejs";
            case AWSLambdaRuntimeNodejs43:
                return @"nodejs4.3";
            case AWSLambdaRuntimeNodejs610:
                return @"nodejs6.10";
            case AWSLambdaRuntimeNodejs810:
                return @"nodejs8.10";
            case AWSLambdaRuntimeNodejs10X:
                return @"nodejs10.x";
            case AWSLambdaRuntimeNodejs12X:
                return @"nodejs12.x";
            case AWSLambdaRuntimeJava8:
                return @"java8";
            case AWSLambdaRuntimeJava11:
                return @"java11";
            case AWSLambdaRuntimePython27:
                return @"python2.7";
            case AWSLambdaRuntimePython36:
                return @"python3.6";
            case AWSLambdaRuntimePython37:
                return @"python3.7";
            case AWSLambdaRuntimePython38:
                return @"python3.8";
            case AWSLambdaRuntimeDotnetcore10:
                return @"dotnetcore1.0";
            case AWSLambdaRuntimeDotnetcore20:
                return @"dotnetcore2.0";
            case AWSLambdaRuntimeDotnetcore21:
                return @"dotnetcore2.1";
            case AWSLambdaRuntimeNodejs43Edge:
                return @"nodejs4.3-edge";
            case AWSLambdaRuntimeGo1X:
                return @"go1.x";
            case AWSLambdaRuntimeRuby25:
                return @"ruby2.5";
            case AWSLambdaRuntimeRuby27:
                return @"ruby2.7";
            case AWSLambdaRuntimeProvided:
                return @"provided";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLambdaListLayersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"layers" : @"Layers",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)layersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLambdaLayersListItem class]];
}

@end

@implementation AWSLambdaListProvisionedConcurrencyConfigsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSLambdaListProvisionedConcurrencyConfigsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"provisionedConcurrencyConfigs" : @"ProvisionedConcurrencyConfigs",
             };
}

+ (NSValueTransformer *)provisionedConcurrencyConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLambdaProvisionedConcurrencyConfigListItem class]];
}

@end

@implementation AWSLambdaListTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resource" : @"Resource",
             };
}

@end

@implementation AWSLambdaListTagsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
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

@implementation AWSLambdaOnFailure

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"Destination",
             };
}

@end

@implementation AWSLambdaOnSuccess

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"Destination",
             };
}

@end

@implementation AWSLambdaProvisionedConcurrencyConfigListItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocatedProvisionedConcurrentExecutions" : @"AllocatedProvisionedConcurrentExecutions",
             @"availableProvisionedConcurrentExecutions" : @"AvailableProvisionedConcurrentExecutions",
             @"functionArn" : @"FunctionArn",
             @"lastModified" : @"LastModified",
             @"requestedProvisionedConcurrentExecutions" : @"RequestedProvisionedConcurrentExecutions",
             @"status" : @"Status",
             @"statusReason" : @"StatusReason",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSLambdaProvisionedConcurrencyStatusEnumInProgress);
        }
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSLambdaProvisionedConcurrencyStatusEnumReady);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSLambdaProvisionedConcurrencyStatusEnumFailed);
        }
        return @(AWSLambdaProvisionedConcurrencyStatusEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaProvisionedConcurrencyStatusEnumInProgress:
                return @"IN_PROGRESS";
            case AWSLambdaProvisionedConcurrencyStatusEnumReady:
                return @"READY";
            case AWSLambdaProvisionedConcurrencyStatusEnumFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLambdaPublishLayerVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compatibleRuntimes" : @"CompatibleRuntimes",
             @"content" : @"Content",
             @"detail" : @"Description",
             @"layerName" : @"LayerName",
             @"licenseInfo" : @"LicenseInfo",
             };
}

+ (NSValueTransformer *)contentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaLayerVersionContentInput class]];
}

@end

@implementation AWSLambdaPublishLayerVersionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compatibleRuntimes" : @"CompatibleRuntimes",
             @"content" : @"Content",
             @"createdDate" : @"CreatedDate",
             @"detail" : @"Description",
             @"layerArn" : @"LayerArn",
             @"layerVersionArn" : @"LayerVersionArn",
             @"licenseInfo" : @"LicenseInfo",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)contentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaLayerVersionContentOutput class]];
}

@end

@implementation AWSLambdaPublishVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeSha256" : @"CodeSha256",
             @"detail" : @"Description",
             @"functionName" : @"FunctionName",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSLambdaPutFunctionConcurrencyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"reservedConcurrentExecutions" : @"ReservedConcurrentExecutions",
             };
}

@end

@implementation AWSLambdaPutFunctionEventInvokeConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationConfig" : @"DestinationConfig",
             @"functionName" : @"FunctionName",
             @"maximumEventAgeInSeconds" : @"MaximumEventAgeInSeconds",
             @"maximumRetryAttempts" : @"MaximumRetryAttempts",
             @"qualifier" : @"Qualifier",
             };
}

+ (NSValueTransformer *)destinationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaDestinationConfig class]];
}

@end

@implementation AWSLambdaPutProvisionedConcurrencyConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"provisionedConcurrentExecutions" : @"ProvisionedConcurrentExecutions",
             @"qualifier" : @"Qualifier",
             };
}

@end

@implementation AWSLambdaPutProvisionedConcurrencyConfigResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocatedProvisionedConcurrentExecutions" : @"AllocatedProvisionedConcurrentExecutions",
             @"availableProvisionedConcurrentExecutions" : @"AvailableProvisionedConcurrentExecutions",
             @"lastModified" : @"LastModified",
             @"requestedProvisionedConcurrentExecutions" : @"RequestedProvisionedConcurrentExecutions",
             @"status" : @"Status",
             @"statusReason" : @"StatusReason",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSLambdaProvisionedConcurrencyStatusEnumInProgress);
        }
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSLambdaProvisionedConcurrencyStatusEnumReady);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSLambdaProvisionedConcurrencyStatusEnumFailed);
        }
        return @(AWSLambdaProvisionedConcurrencyStatusEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaProvisionedConcurrencyStatusEnumInProgress:
                return @"IN_PROGRESS";
            case AWSLambdaProvisionedConcurrencyStatusEnumReady:
                return @"READY";
            case AWSLambdaProvisionedConcurrencyStatusEnumFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLambdaRemoveLayerVersionPermissionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"layerName" : @"LayerName",
             @"revisionId" : @"RevisionId",
             @"statementId" : @"StatementId",
             @"versionNumber" : @"VersionNumber",
             };
}

@end

@implementation AWSLambdaRemovePermissionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"qualifier" : @"Qualifier",
             @"revisionId" : @"RevisionId",
             @"statementId" : @"StatementId",
             };
}

@end

@implementation AWSLambdaTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resource" : @"Resource",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSLambdaTracingConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mode" : @"Mode",
             };
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSLambdaTracingModeActive);
        }
        if ([value caseInsensitiveCompare:@"PassThrough"] == NSOrderedSame) {
            return @(AWSLambdaTracingModePassThrough);
        }
        return @(AWSLambdaTracingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaTracingModeActive:
                return @"Active";
            case AWSLambdaTracingModePassThrough:
                return @"PassThrough";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLambdaTracingConfigResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mode" : @"Mode",
             };
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSLambdaTracingModeActive);
        }
        if ([value caseInsensitiveCompare:@"PassThrough"] == NSOrderedSame) {
            return @(AWSLambdaTracingModePassThrough);
        }
        return @(AWSLambdaTracingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaTracingModeActive:
                return @"Active";
            case AWSLambdaTracingModePassThrough:
                return @"PassThrough";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLambdaUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resource" : @"Resource",
             @"tagKeys" : @"TagKeys",
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
             @"revisionId" : @"RevisionId",
             @"routingConfig" : @"RoutingConfig",
             };
}

+ (NSValueTransformer *)routingConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaAliasRoutingConfiguration class]];
}

@end

@implementation AWSLambdaUpdateEventSourceMappingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchSize" : @"BatchSize",
             @"bisectBatchOnFunctionError" : @"BisectBatchOnFunctionError",
             @"destinationConfig" : @"DestinationConfig",
             @"enabled" : @"Enabled",
             @"functionName" : @"FunctionName",
             @"maximumBatchingWindowInSeconds" : @"MaximumBatchingWindowInSeconds",
             @"maximumRecordAgeInSeconds" : @"MaximumRecordAgeInSeconds",
             @"maximumRetryAttempts" : @"MaximumRetryAttempts",
             @"parallelizationFactor" : @"ParallelizationFactor",
             @"UUID" : @"UUID",
             };
}

+ (NSValueTransformer *)destinationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaDestinationConfig class]];
}

@end

@implementation AWSLambdaUpdateFunctionCodeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"functionName" : @"FunctionName",
             @"publish" : @"Publish",
             @"revisionId" : @"RevisionId",
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
             @"deadLetterConfig" : @"DeadLetterConfig",
             @"detail" : @"Description",
             @"environment" : @"Environment",
             @"functionName" : @"FunctionName",
             @"handler" : @"Handler",
             @"KMSKeyArn" : @"KMSKeyArn",
             @"layers" : @"Layers",
             @"memorySize" : @"MemorySize",
             @"revisionId" : @"RevisionId",
             @"role" : @"Role",
             @"runtime" : @"Runtime",
             @"timeout" : @"Timeout",
             @"tracingConfig" : @"TracingConfig",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)deadLetterConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaDeadLetterConfig class]];
}

+ (NSValueTransformer *)environmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaEnvironment class]];
}

+ (NSValueTransformer *)runtimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"nodejs"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs);
        }
        if ([value caseInsensitiveCompare:@"nodejs4.3"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs43);
        }
        if ([value caseInsensitiveCompare:@"nodejs6.10"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs610);
        }
        if ([value caseInsensitiveCompare:@"nodejs8.10"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs810);
        }
        if ([value caseInsensitiveCompare:@"nodejs10.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs10X);
        }
        if ([value caseInsensitiveCompare:@"nodejs12.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs12X);
        }
        if ([value caseInsensitiveCompare:@"java8"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeJava8);
        }
        if ([value caseInsensitiveCompare:@"java11"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeJava11);
        }
        if ([value caseInsensitiveCompare:@"python2.7"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython27);
        }
        if ([value caseInsensitiveCompare:@"python3.6"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython36);
        }
        if ([value caseInsensitiveCompare:@"python3.7"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython37);
        }
        if ([value caseInsensitiveCompare:@"python3.8"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython38);
        }
        if ([value caseInsensitiveCompare:@"dotnetcore1.0"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnetcore10);
        }
        if ([value caseInsensitiveCompare:@"dotnetcore2.0"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnetcore20);
        }
        if ([value caseInsensitiveCompare:@"dotnetcore2.1"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnetcore21);
        }
        if ([value caseInsensitiveCompare:@"nodejs4.3-edge"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs43Edge);
        }
        if ([value caseInsensitiveCompare:@"go1.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeGo1X);
        }
        if ([value caseInsensitiveCompare:@"ruby2.5"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeRuby25);
        }
        if ([value caseInsensitiveCompare:@"ruby2.7"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeRuby27);
        }
        if ([value caseInsensitiveCompare:@"provided"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeProvided);
        }
        return @(AWSLambdaRuntimeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaRuntimeNodejs:
                return @"nodejs";
            case AWSLambdaRuntimeNodejs43:
                return @"nodejs4.3";
            case AWSLambdaRuntimeNodejs610:
                return @"nodejs6.10";
            case AWSLambdaRuntimeNodejs810:
                return @"nodejs8.10";
            case AWSLambdaRuntimeNodejs10X:
                return @"nodejs10.x";
            case AWSLambdaRuntimeNodejs12X:
                return @"nodejs12.x";
            case AWSLambdaRuntimeJava8:
                return @"java8";
            case AWSLambdaRuntimeJava11:
                return @"java11";
            case AWSLambdaRuntimePython27:
                return @"python2.7";
            case AWSLambdaRuntimePython36:
                return @"python3.6";
            case AWSLambdaRuntimePython37:
                return @"python3.7";
            case AWSLambdaRuntimePython38:
                return @"python3.8";
            case AWSLambdaRuntimeDotnetcore10:
                return @"dotnetcore1.0";
            case AWSLambdaRuntimeDotnetcore20:
                return @"dotnetcore2.0";
            case AWSLambdaRuntimeDotnetcore21:
                return @"dotnetcore2.1";
            case AWSLambdaRuntimeNodejs43Edge:
                return @"nodejs4.3-edge";
            case AWSLambdaRuntimeGo1X:
                return @"go1.x";
            case AWSLambdaRuntimeRuby25:
                return @"ruby2.5";
            case AWSLambdaRuntimeRuby27:
                return @"ruby2.7";
            case AWSLambdaRuntimeProvided:
                return @"provided";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tracingConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaTracingConfig class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaVpcConfig class]];
}

@end

@implementation AWSLambdaUpdateFunctionEventInvokeConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationConfig" : @"DestinationConfig",
             @"functionName" : @"FunctionName",
             @"maximumEventAgeInSeconds" : @"MaximumEventAgeInSeconds",
             @"maximumRetryAttempts" : @"MaximumRetryAttempts",
             @"qualifier" : @"Qualifier",
             };
}

+ (NSValueTransformer *)destinationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaDestinationConfig class]];
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
