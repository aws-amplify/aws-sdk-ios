//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionCount" : @"FunctionCount",
             @"totalCodeSize" : @"TotalCodeSize",
             };
}

@end

@implementation AWSLambdaAddLayerVersionPermissionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"revisionId" : @"RevisionId",
             @"statement" : @"Statement",
             };
}

@end

@implementation AWSLambdaAddPermissionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"eventSourceToken" : @"EventSourceToken",
             @"functionName" : @"FunctionName",
             @"functionUrlAuthType" : @"FunctionUrlAuthType",
             @"principal" : @"Principal",
             @"principalOrgID" : @"PrincipalOrgID",
             @"qualifier" : @"Qualifier",
             @"revisionId" : @"RevisionId",
             @"sourceAccount" : @"SourceAccount",
             @"sourceArn" : @"SourceArn",
             @"statementId" : @"StatementId",
             };
}

+ (NSValueTransformer *)functionUrlAuthTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSLambdaFunctionUrlAuthTypeNone);
        }
        if ([value caseInsensitiveCompare:@"AWS_IAM"] == NSOrderedSame) {
            return @(AWSLambdaFunctionUrlAuthTypeAwsIam);
        }
        return @(AWSLambdaFunctionUrlAuthTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaFunctionUrlAuthTypeNone:
                return @"NONE";
            case AWSLambdaFunctionUrlAuthTypeAwsIam:
                return @"AWS_IAM";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLambdaAddPermissionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"statement" : @"Statement",
             };
}

@end

@implementation AWSLambdaAliasConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalVersionWeights" : @"AdditionalVersionWeights",
             };
}

@end

@implementation AWSLambdaAllowedPublishers

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"signingProfileVersionArns" : @"SigningProfileVersionArns",
             };
}

@end

@implementation AWSLambdaAmazonManagedKafkaEventSourceConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"consumerGroupId" : @"ConsumerGroupId",
             };
}

@end

@implementation AWSLambdaCodeSigningConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedPublishers" : @"AllowedPublishers",
             @"codeSigningConfigArn" : @"CodeSigningConfigArn",
             @"codeSigningConfigId" : @"CodeSigningConfigId",
             @"codeSigningPolicies" : @"CodeSigningPolicies",
             @"detail" : @"Description",
             @"lastModified" : @"LastModified",
             };
}

+ (NSValueTransformer *)allowedPublishersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaAllowedPublishers class]];
}

+ (NSValueTransformer *)codeSigningPoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaCodeSigningPolicies class]];
}

@end

@implementation AWSLambdaCodeSigningPolicies

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"untrustedArtifactOnDeployment" : @"UntrustedArtifactOnDeployment",
             };
}

+ (NSValueTransformer *)untrustedArtifactOnDeploymentJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Warn"] == NSOrderedSame) {
            return @(AWSLambdaCodeSigningPolicyWarn);
        }
        if ([value caseInsensitiveCompare:@"Enforce"] == NSOrderedSame) {
            return @(AWSLambdaCodeSigningPolicyEnforce);
        }
        return @(AWSLambdaCodeSigningPolicyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaCodeSigningPolicyWarn:
                return @"Warn";
            case AWSLambdaCodeSigningPolicyEnforce:
                return @"Enforce";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLambdaConcurrency

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservedConcurrentExecutions" : @"ReservedConcurrentExecutions",
             };
}

@end

@implementation AWSLambdaCors

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowCredentials" : @"AllowCredentials",
             @"allowHeaders" : @"AllowHeaders",
             @"allowMethods" : @"AllowMethods",
             @"allowOrigins" : @"AllowOrigins",
             @"exposeHeaders" : @"ExposeHeaders",
             @"maxAge" : @"MaxAge",
             };
}

@end

@implementation AWSLambdaCreateAliasRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSLambdaCreateCodeSigningConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedPublishers" : @"AllowedPublishers",
             @"codeSigningPolicies" : @"CodeSigningPolicies",
             @"detail" : @"Description",
             };
}

+ (NSValueTransformer *)allowedPublishersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaAllowedPublishers class]];
}

+ (NSValueTransformer *)codeSigningPoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaCodeSigningPolicies class]];
}

@end

@implementation AWSLambdaCreateCodeSigningConfigResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeSigningConfig" : @"CodeSigningConfig",
             };
}

+ (NSValueTransformer *)codeSigningConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaCodeSigningConfig class]];
}

@end

@implementation AWSLambdaCreateEventSourceMappingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amazonManagedKafkaEventSourceConfig" : @"AmazonManagedKafkaEventSourceConfig",
             @"batchSize" : @"BatchSize",
             @"bisectBatchOnFunctionError" : @"BisectBatchOnFunctionError",
             @"destinationConfig" : @"DestinationConfig",
             @"documentDBEventSourceConfig" : @"DocumentDBEventSourceConfig",
             @"enabled" : @"Enabled",
             @"eventSourceArn" : @"EventSourceArn",
             @"filterCriteria" : @"FilterCriteria",
             @"functionName" : @"FunctionName",
             @"functionResponseTypes" : @"FunctionResponseTypes",
             @"maximumBatchingWindowInSeconds" : @"MaximumBatchingWindowInSeconds",
             @"maximumRecordAgeInSeconds" : @"MaximumRecordAgeInSeconds",
             @"maximumRetryAttempts" : @"MaximumRetryAttempts",
             @"parallelizationFactor" : @"ParallelizationFactor",
             @"queues" : @"Queues",
             @"scalingConfig" : @"ScalingConfig",
             @"selfManagedEventSource" : @"SelfManagedEventSource",
             @"selfManagedKafkaEventSourceConfig" : @"SelfManagedKafkaEventSourceConfig",
             @"sourceAccessConfigurations" : @"SourceAccessConfigurations",
             @"startingPosition" : @"StartingPosition",
             @"startingPositionTimestamp" : @"StartingPositionTimestamp",
             @"topics" : @"Topics",
             @"tumblingWindowInSeconds" : @"TumblingWindowInSeconds",
             };
}

+ (NSValueTransformer *)amazonManagedKafkaEventSourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaAmazonManagedKafkaEventSourceConfig class]];
}

+ (NSValueTransformer *)destinationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaDestinationConfig class]];
}

+ (NSValueTransformer *)documentDBEventSourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaDocumentDBEventSourceConfig class]];
}

+ (NSValueTransformer *)filterCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaFilterCriteria class]];
}

+ (NSValueTransformer *)scalingConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaScalingConfig class]];
}

+ (NSValueTransformer *)selfManagedEventSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaSelfManagedEventSource class]];
}

+ (NSValueTransformer *)selfManagedKafkaEventSourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaSelfManagedKafkaEventSourceConfig class]];
}

+ (NSValueTransformer *)sourceAccessConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLambdaSourceAccessConfiguration class]];
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"architectures" : @"Architectures",
             @"code" : @"Code",
             @"codeSigningConfigArn" : @"CodeSigningConfigArn",
             @"deadLetterConfig" : @"DeadLetterConfig",
             @"detail" : @"Description",
             @"environment" : @"Environment",
             @"ephemeralStorage" : @"EphemeralStorage",
             @"fileSystemConfigs" : @"FileSystemConfigs",
             @"functionName" : @"FunctionName",
             @"handler" : @"Handler",
             @"imageConfig" : @"ImageConfig",
             @"KMSKeyArn" : @"KMSKeyArn",
             @"layers" : @"Layers",
             @"memorySize" : @"MemorySize",
             @"packageType" : @"PackageType",
             @"publish" : @"Publish",
             @"role" : @"Role",
             @"runtime" : @"Runtime",
             @"snapStart" : @"SnapStart",
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

+ (NSValueTransformer *)ephemeralStorageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaEphemeralStorage class]];
}

+ (NSValueTransformer *)fileSystemConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLambdaFileSystemConfig class]];
}

+ (NSValueTransformer *)imageConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaImageConfig class]];
}

+ (NSValueTransformer *)packageTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Zip"] == NSOrderedSame) {
            return @(AWSLambdaPackageTypeZip);
        }
        if ([value caseInsensitiveCompare:@"Image"] == NSOrderedSame) {
            return @(AWSLambdaPackageTypeImage);
        }
        return @(AWSLambdaPackageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaPackageTypeZip:
                return @"Zip";
            case AWSLambdaPackageTypeImage:
                return @"Image";
            default:
                return nil;
        }
    }];
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
        if ([value caseInsensitiveCompare:@"nodejs14.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs14X);
        }
        if ([value caseInsensitiveCompare:@"nodejs16.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs16X);
        }
        if ([value caseInsensitiveCompare:@"java8"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeJava8);
        }
        if ([value caseInsensitiveCompare:@"java8.al2"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeJava8Al2);
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
        if ([value caseInsensitiveCompare:@"python3.9"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython39);
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
        if ([value caseInsensitiveCompare:@"dotnetcore3.1"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnetcore31);
        }
        if ([value caseInsensitiveCompare:@"dotnet6"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnet6);
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
        if ([value caseInsensitiveCompare:@"provided.al2"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeProvidedAl2);
        }
        if ([value caseInsensitiveCompare:@"nodejs18.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs18X);
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
            case AWSLambdaRuntimeNodejs14X:
                return @"nodejs14.x";
            case AWSLambdaRuntimeNodejs16X:
                return @"nodejs16.x";
            case AWSLambdaRuntimeJava8:
                return @"java8";
            case AWSLambdaRuntimeJava8Al2:
                return @"java8.al2";
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
            case AWSLambdaRuntimePython39:
                return @"python3.9";
            case AWSLambdaRuntimeDotnetcore10:
                return @"dotnetcore1.0";
            case AWSLambdaRuntimeDotnetcore20:
                return @"dotnetcore2.0";
            case AWSLambdaRuntimeDotnetcore21:
                return @"dotnetcore2.1";
            case AWSLambdaRuntimeDotnetcore31:
                return @"dotnetcore3.1";
            case AWSLambdaRuntimeDotnet6:
                return @"dotnet6";
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
            case AWSLambdaRuntimeProvidedAl2:
                return @"provided.al2";
            case AWSLambdaRuntimeNodejs18X:
                return @"nodejs18.x";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)snapStartJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaSnapStart class]];
}

+ (NSValueTransformer *)tracingConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaTracingConfig class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaVpcConfig class]];
}

@end

@implementation AWSLambdaCreateFunctionUrlConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authType" : @"AuthType",
             @"cors" : @"Cors",
             @"functionName" : @"FunctionName",
             @"qualifier" : @"Qualifier",
             };
}

+ (NSValueTransformer *)authTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSLambdaFunctionUrlAuthTypeNone);
        }
        if ([value caseInsensitiveCompare:@"AWS_IAM"] == NSOrderedSame) {
            return @(AWSLambdaFunctionUrlAuthTypeAwsIam);
        }
        return @(AWSLambdaFunctionUrlAuthTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaFunctionUrlAuthTypeNone:
                return @"NONE";
            case AWSLambdaFunctionUrlAuthTypeAwsIam:
                return @"AWS_IAM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)corsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaCors class]];
}

@end

@implementation AWSLambdaCreateFunctionUrlConfigResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authType" : @"AuthType",
             @"cors" : @"Cors",
             @"creationTime" : @"CreationTime",
             @"functionArn" : @"FunctionArn",
             @"functionUrl" : @"FunctionUrl",
             };
}

+ (NSValueTransformer *)authTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSLambdaFunctionUrlAuthTypeNone);
        }
        if ([value caseInsensitiveCompare:@"AWS_IAM"] == NSOrderedSame) {
            return @(AWSLambdaFunctionUrlAuthTypeAwsIam);
        }
        return @(AWSLambdaFunctionUrlAuthTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaFunctionUrlAuthTypeNone:
                return @"NONE";
            case AWSLambdaFunctionUrlAuthTypeAwsIam:
                return @"AWS_IAM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)corsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaCors class]];
}

@end

@implementation AWSLambdaDeadLetterConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetArn" : @"TargetArn",
             };
}

@end

@implementation AWSLambdaDeleteAliasRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"name" : @"Name",
             };
}

@end

@implementation AWSLambdaDeleteCodeSigningConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeSigningConfigArn" : @"CodeSigningConfigArn",
             };
}

@end

@implementation AWSLambdaDeleteCodeSigningConfigResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSLambdaDeleteEventSourceMappingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"UUID" : @"UUID",
             };
}

@end

@implementation AWSLambdaDeleteFunctionCodeSigningConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             };
}

@end

@implementation AWSLambdaDeleteFunctionConcurrencyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             };
}

@end

@implementation AWSLambdaDeleteFunctionEventInvokeConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"qualifier" : @"Qualifier",
             };
}

@end

@implementation AWSLambdaDeleteFunctionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"qualifier" : @"Qualifier",
             };
}

@end

@implementation AWSLambdaDeleteFunctionUrlConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"qualifier" : @"Qualifier",
             };
}

@end

@implementation AWSLambdaDeleteLayerVersionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"layerName" : @"LayerName",
             @"versionNumber" : @"VersionNumber",
             };
}

@end

@implementation AWSLambdaDeleteProvisionedConcurrencyConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"qualifier" : @"Qualifier",
             };
}

@end

@implementation AWSLambdaDestinationConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSLambdaDocumentDBEventSourceConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionName" : @"CollectionName",
             @"databaseName" : @"DatabaseName",
             @"fullDocument" : @"FullDocument",
             };
}

+ (NSValueTransformer *)fullDocumentJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UpdateLookup"] == NSOrderedSame) {
            return @(AWSLambdaFullDocumentUpdateLookup);
        }
        if ([value caseInsensitiveCompare:@"Default"] == NSOrderedSame) {
            return @(AWSLambdaFullDocumentDefault);
        }
        return @(AWSLambdaFullDocumentUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaFullDocumentUpdateLookup:
                return @"UpdateLookup";
            case AWSLambdaFullDocumentDefault:
                return @"Default";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLambdaEnvironment

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"variables" : @"Variables",
             };
}

@end

@implementation AWSLambdaEnvironmentError

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"message" : @"Message",
             };
}

@end

@implementation AWSLambdaEnvironmentResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSLambdaEphemeralStorage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"size" : @"Size",
             };
}

@end

@implementation AWSLambdaEventSourceMappingConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amazonManagedKafkaEventSourceConfig" : @"AmazonManagedKafkaEventSourceConfig",
             @"batchSize" : @"BatchSize",
             @"bisectBatchOnFunctionError" : @"BisectBatchOnFunctionError",
             @"destinationConfig" : @"DestinationConfig",
             @"documentDBEventSourceConfig" : @"DocumentDBEventSourceConfig",
             @"eventSourceArn" : @"EventSourceArn",
             @"filterCriteria" : @"FilterCriteria",
             @"functionArn" : @"FunctionArn",
             @"functionResponseTypes" : @"FunctionResponseTypes",
             @"lastModified" : @"LastModified",
             @"lastProcessingResult" : @"LastProcessingResult",
             @"maximumBatchingWindowInSeconds" : @"MaximumBatchingWindowInSeconds",
             @"maximumRecordAgeInSeconds" : @"MaximumRecordAgeInSeconds",
             @"maximumRetryAttempts" : @"MaximumRetryAttempts",
             @"parallelizationFactor" : @"ParallelizationFactor",
             @"queues" : @"Queues",
             @"scalingConfig" : @"ScalingConfig",
             @"selfManagedEventSource" : @"SelfManagedEventSource",
             @"selfManagedKafkaEventSourceConfig" : @"SelfManagedKafkaEventSourceConfig",
             @"sourceAccessConfigurations" : @"SourceAccessConfigurations",
             @"startingPosition" : @"StartingPosition",
             @"startingPositionTimestamp" : @"StartingPositionTimestamp",
             @"state" : @"State",
             @"stateTransitionReason" : @"StateTransitionReason",
             @"topics" : @"Topics",
             @"tumblingWindowInSeconds" : @"TumblingWindowInSeconds",
             @"UUID" : @"UUID",
             };
}

+ (NSValueTransformer *)amazonManagedKafkaEventSourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaAmazonManagedKafkaEventSourceConfig class]];
}

+ (NSValueTransformer *)destinationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaDestinationConfig class]];
}

+ (NSValueTransformer *)documentDBEventSourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaDocumentDBEventSourceConfig class]];
}

+ (NSValueTransformer *)filterCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaFilterCriteria class]];
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)scalingConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaScalingConfig class]];
}

+ (NSValueTransformer *)selfManagedEventSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaSelfManagedEventSource class]];
}

+ (NSValueTransformer *)selfManagedKafkaEventSourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaSelfManagedKafkaEventSourceConfig class]];
}

+ (NSValueTransformer *)sourceAccessConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLambdaSourceAccessConfiguration class]];
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

@implementation AWSLambdaFileSystemConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"localMountPath" : @"LocalMountPath",
             };
}

@end

@implementation AWSLambdaFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pattern" : @"Pattern",
             };
}

@end

@implementation AWSLambdaFilterCriteria

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLambdaFilter class]];
}

@end

@implementation AWSLambdaFunctionCode

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageUri" : @"ImageUri",
             @"s3Bucket" : @"S3Bucket",
             @"s3Key" : @"S3Key",
             @"s3ObjectVersion" : @"S3ObjectVersion",
             @"zipFile" : @"ZipFile",
             };
}

@end

@implementation AWSLambdaFunctionCodeLocation

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageUri" : @"ImageUri",
             @"location" : @"Location",
             @"repositoryType" : @"RepositoryType",
             @"resolvedImageUri" : @"ResolvedImageUri",
             };
}

@end

@implementation AWSLambdaFunctionConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"architectures" : @"Architectures",
             @"codeSha256" : @"CodeSha256",
             @"codeSize" : @"CodeSize",
             @"deadLetterConfig" : @"DeadLetterConfig",
             @"detail" : @"Description",
             @"environment" : @"Environment",
             @"ephemeralStorage" : @"EphemeralStorage",
             @"fileSystemConfigs" : @"FileSystemConfigs",
             @"functionArn" : @"FunctionArn",
             @"functionName" : @"FunctionName",
             @"handler" : @"Handler",
             @"imageConfigResponse" : @"ImageConfigResponse",
             @"KMSKeyArn" : @"KMSKeyArn",
             @"lastModified" : @"LastModified",
             @"lastUpdateStatus" : @"LastUpdateStatus",
             @"lastUpdateStatusReason" : @"LastUpdateStatusReason",
             @"lastUpdateStatusReasonCode" : @"LastUpdateStatusReasonCode",
             @"layers" : @"Layers",
             @"masterArn" : @"MasterArn",
             @"memorySize" : @"MemorySize",
             @"packageType" : @"PackageType",
             @"revisionId" : @"RevisionId",
             @"role" : @"Role",
             @"runtime" : @"Runtime",
             @"runtimeVersionConfig" : @"RuntimeVersionConfig",
             @"signingJobArn" : @"SigningJobArn",
             @"signingProfileVersionArn" : @"SigningProfileVersionArn",
             @"snapStart" : @"SnapStart",
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

+ (NSValueTransformer *)ephemeralStorageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaEphemeralStorage class]];
}

+ (NSValueTransformer *)fileSystemConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLambdaFileSystemConfig class]];
}

+ (NSValueTransformer *)imageConfigResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaImageConfigResponse class]];
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
        if ([value caseInsensitiveCompare:@"ImageDeleted"] == NSOrderedSame) {
            return @(AWSLambdaLastUpdateStatusReasonCodeImageDeleted);
        }
        if ([value caseInsensitiveCompare:@"ImageAccessDenied"] == NSOrderedSame) {
            return @(AWSLambdaLastUpdateStatusReasonCodeImageAccessDenied);
        }
        if ([value caseInsensitiveCompare:@"InvalidImage"] == NSOrderedSame) {
            return @(AWSLambdaLastUpdateStatusReasonCodeInvalidImage);
        }
        if ([value caseInsensitiveCompare:@"KMSKeyAccessDenied"] == NSOrderedSame) {
            return @(AWSLambdaLastUpdateStatusReasonCodeKMSKeyAccessDenied);
        }
        if ([value caseInsensitiveCompare:@"KMSKeyNotFound"] == NSOrderedSame) {
            return @(AWSLambdaLastUpdateStatusReasonCodeKMSKeyNotFound);
        }
        if ([value caseInsensitiveCompare:@"InvalidStateKMSKey"] == NSOrderedSame) {
            return @(AWSLambdaLastUpdateStatusReasonCodeInvalidStateKMSKey);
        }
        if ([value caseInsensitiveCompare:@"DisabledKMSKey"] == NSOrderedSame) {
            return @(AWSLambdaLastUpdateStatusReasonCodeDisabledKMSKey);
        }
        if ([value caseInsensitiveCompare:@"EFSIOError"] == NSOrderedSame) {
            return @(AWSLambdaLastUpdateStatusReasonCodeEFSIOError);
        }
        if ([value caseInsensitiveCompare:@"EFSMountConnectivityError"] == NSOrderedSame) {
            return @(AWSLambdaLastUpdateStatusReasonCodeEFSMountConnectivityError);
        }
        if ([value caseInsensitiveCompare:@"EFSMountFailure"] == NSOrderedSame) {
            return @(AWSLambdaLastUpdateStatusReasonCodeEFSMountFailure);
        }
        if ([value caseInsensitiveCompare:@"EFSMountTimeout"] == NSOrderedSame) {
            return @(AWSLambdaLastUpdateStatusReasonCodeEFSMountTimeout);
        }
        if ([value caseInsensitiveCompare:@"InvalidRuntime"] == NSOrderedSame) {
            return @(AWSLambdaLastUpdateStatusReasonCodeInvalidRuntime);
        }
        if ([value caseInsensitiveCompare:@"InvalidZipFileException"] == NSOrderedSame) {
            return @(AWSLambdaLastUpdateStatusReasonCodeInvalidZipFileException);
        }
        if ([value caseInsensitiveCompare:@"FunctionError"] == NSOrderedSame) {
            return @(AWSLambdaLastUpdateStatusReasonCodeFunctionError);
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
            case AWSLambdaLastUpdateStatusReasonCodeImageDeleted:
                return @"ImageDeleted";
            case AWSLambdaLastUpdateStatusReasonCodeImageAccessDenied:
                return @"ImageAccessDenied";
            case AWSLambdaLastUpdateStatusReasonCodeInvalidImage:
                return @"InvalidImage";
            case AWSLambdaLastUpdateStatusReasonCodeKMSKeyAccessDenied:
                return @"KMSKeyAccessDenied";
            case AWSLambdaLastUpdateStatusReasonCodeKMSKeyNotFound:
                return @"KMSKeyNotFound";
            case AWSLambdaLastUpdateStatusReasonCodeInvalidStateKMSKey:
                return @"InvalidStateKMSKey";
            case AWSLambdaLastUpdateStatusReasonCodeDisabledKMSKey:
                return @"DisabledKMSKey";
            case AWSLambdaLastUpdateStatusReasonCodeEFSIOError:
                return @"EFSIOError";
            case AWSLambdaLastUpdateStatusReasonCodeEFSMountConnectivityError:
                return @"EFSMountConnectivityError";
            case AWSLambdaLastUpdateStatusReasonCodeEFSMountFailure:
                return @"EFSMountFailure";
            case AWSLambdaLastUpdateStatusReasonCodeEFSMountTimeout:
                return @"EFSMountTimeout";
            case AWSLambdaLastUpdateStatusReasonCodeInvalidRuntime:
                return @"InvalidRuntime";
            case AWSLambdaLastUpdateStatusReasonCodeInvalidZipFileException:
                return @"InvalidZipFileException";
            case AWSLambdaLastUpdateStatusReasonCodeFunctionError:
                return @"FunctionError";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)layersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLambdaLayer class]];
}

+ (NSValueTransformer *)packageTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Zip"] == NSOrderedSame) {
            return @(AWSLambdaPackageTypeZip);
        }
        if ([value caseInsensitiveCompare:@"Image"] == NSOrderedSame) {
            return @(AWSLambdaPackageTypeImage);
        }
        return @(AWSLambdaPackageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaPackageTypeZip:
                return @"Zip";
            case AWSLambdaPackageTypeImage:
                return @"Image";
            default:
                return nil;
        }
    }];
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
        if ([value caseInsensitiveCompare:@"nodejs14.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs14X);
        }
        if ([value caseInsensitiveCompare:@"nodejs16.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs16X);
        }
        if ([value caseInsensitiveCompare:@"java8"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeJava8);
        }
        if ([value caseInsensitiveCompare:@"java8.al2"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeJava8Al2);
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
        if ([value caseInsensitiveCompare:@"python3.9"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython39);
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
        if ([value caseInsensitiveCompare:@"dotnetcore3.1"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnetcore31);
        }
        if ([value caseInsensitiveCompare:@"dotnet6"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnet6);
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
        if ([value caseInsensitiveCompare:@"provided.al2"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeProvidedAl2);
        }
        if ([value caseInsensitiveCompare:@"nodejs18.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs18X);
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
            case AWSLambdaRuntimeNodejs14X:
                return @"nodejs14.x";
            case AWSLambdaRuntimeNodejs16X:
                return @"nodejs16.x";
            case AWSLambdaRuntimeJava8:
                return @"java8";
            case AWSLambdaRuntimeJava8Al2:
                return @"java8.al2";
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
            case AWSLambdaRuntimePython39:
                return @"python3.9";
            case AWSLambdaRuntimeDotnetcore10:
                return @"dotnetcore1.0";
            case AWSLambdaRuntimeDotnetcore20:
                return @"dotnetcore2.0";
            case AWSLambdaRuntimeDotnetcore21:
                return @"dotnetcore2.1";
            case AWSLambdaRuntimeDotnetcore31:
                return @"dotnetcore3.1";
            case AWSLambdaRuntimeDotnet6:
                return @"dotnet6";
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
            case AWSLambdaRuntimeProvidedAl2:
                return @"provided.al2";
            case AWSLambdaRuntimeNodejs18X:
                return @"nodejs18.x";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)runtimeVersionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaRuntimeVersionConfig class]];
}

+ (NSValueTransformer *)snapStartJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaSnapStartResponse class]];
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
        if ([value caseInsensitiveCompare:@"ImageDeleted"] == NSOrderedSame) {
            return @(AWSLambdaStateReasonCodeImageDeleted);
        }
        if ([value caseInsensitiveCompare:@"ImageAccessDenied"] == NSOrderedSame) {
            return @(AWSLambdaStateReasonCodeImageAccessDenied);
        }
        if ([value caseInsensitiveCompare:@"InvalidImage"] == NSOrderedSame) {
            return @(AWSLambdaStateReasonCodeInvalidImage);
        }
        if ([value caseInsensitiveCompare:@"KMSKeyAccessDenied"] == NSOrderedSame) {
            return @(AWSLambdaStateReasonCodeKMSKeyAccessDenied);
        }
        if ([value caseInsensitiveCompare:@"KMSKeyNotFound"] == NSOrderedSame) {
            return @(AWSLambdaStateReasonCodeKMSKeyNotFound);
        }
        if ([value caseInsensitiveCompare:@"InvalidStateKMSKey"] == NSOrderedSame) {
            return @(AWSLambdaStateReasonCodeInvalidStateKMSKey);
        }
        if ([value caseInsensitiveCompare:@"DisabledKMSKey"] == NSOrderedSame) {
            return @(AWSLambdaStateReasonCodeDisabledKMSKey);
        }
        if ([value caseInsensitiveCompare:@"EFSIOError"] == NSOrderedSame) {
            return @(AWSLambdaStateReasonCodeEFSIOError);
        }
        if ([value caseInsensitiveCompare:@"EFSMountConnectivityError"] == NSOrderedSame) {
            return @(AWSLambdaStateReasonCodeEFSMountConnectivityError);
        }
        if ([value caseInsensitiveCompare:@"EFSMountFailure"] == NSOrderedSame) {
            return @(AWSLambdaStateReasonCodeEFSMountFailure);
        }
        if ([value caseInsensitiveCompare:@"EFSMountTimeout"] == NSOrderedSame) {
            return @(AWSLambdaStateReasonCodeEFSMountTimeout);
        }
        if ([value caseInsensitiveCompare:@"InvalidRuntime"] == NSOrderedSame) {
            return @(AWSLambdaStateReasonCodeInvalidRuntime);
        }
        if ([value caseInsensitiveCompare:@"InvalidZipFileException"] == NSOrderedSame) {
            return @(AWSLambdaStateReasonCodeInvalidZipFileException);
        }
        if ([value caseInsensitiveCompare:@"FunctionError"] == NSOrderedSame) {
            return @(AWSLambdaStateReasonCodeFunctionError);
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
            case AWSLambdaStateReasonCodeImageDeleted:
                return @"ImageDeleted";
            case AWSLambdaStateReasonCodeImageAccessDenied:
                return @"ImageAccessDenied";
            case AWSLambdaStateReasonCodeInvalidImage:
                return @"InvalidImage";
            case AWSLambdaStateReasonCodeKMSKeyAccessDenied:
                return @"KMSKeyAccessDenied";
            case AWSLambdaStateReasonCodeKMSKeyNotFound:
                return @"KMSKeyNotFound";
            case AWSLambdaStateReasonCodeInvalidStateKMSKey:
                return @"InvalidStateKMSKey";
            case AWSLambdaStateReasonCodeDisabledKMSKey:
                return @"DisabledKMSKey";
            case AWSLambdaStateReasonCodeEFSIOError:
                return @"EFSIOError";
            case AWSLambdaStateReasonCodeEFSMountConnectivityError:
                return @"EFSMountConnectivityError";
            case AWSLambdaStateReasonCodeEFSMountFailure:
                return @"EFSMountFailure";
            case AWSLambdaStateReasonCodeEFSMountTimeout:
                return @"EFSMountTimeout";
            case AWSLambdaStateReasonCodeInvalidRuntime:
                return @"InvalidRuntime";
            case AWSLambdaStateReasonCodeInvalidZipFileException:
                return @"InvalidZipFileException";
            case AWSLambdaStateReasonCodeFunctionError:
                return @"FunctionError";
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSLambdaFunctionUrlConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authType" : @"AuthType",
             @"cors" : @"Cors",
             @"creationTime" : @"CreationTime",
             @"functionArn" : @"FunctionArn",
             @"functionUrl" : @"FunctionUrl",
             @"lastModifiedTime" : @"LastModifiedTime",
             };
}

+ (NSValueTransformer *)authTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSLambdaFunctionUrlAuthTypeNone);
        }
        if ([value caseInsensitiveCompare:@"AWS_IAM"] == NSOrderedSame) {
            return @(AWSLambdaFunctionUrlAuthTypeAwsIam);
        }
        return @(AWSLambdaFunctionUrlAuthTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaFunctionUrlAuthTypeNone:
                return @"NONE";
            case AWSLambdaFunctionUrlAuthTypeAwsIam:
                return @"AWS_IAM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)corsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaCors class]];
}

@end

@implementation AWSLambdaGetAccountSettingsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSLambdaGetAccountSettingsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"name" : @"Name",
             };
}

@end

@implementation AWSLambdaGetCodeSigningConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeSigningConfigArn" : @"CodeSigningConfigArn",
             };
}

@end

@implementation AWSLambdaGetCodeSigningConfigResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeSigningConfig" : @"CodeSigningConfig",
             };
}

+ (NSValueTransformer *)codeSigningConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaCodeSigningConfig class]];
}

@end

@implementation AWSLambdaGetEventSourceMappingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"UUID" : @"UUID",
             };
}

@end

@implementation AWSLambdaGetFunctionCodeSigningConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             };
}

@end

@implementation AWSLambdaGetFunctionCodeSigningConfigResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeSigningConfigArn" : @"CodeSigningConfigArn",
             @"functionName" : @"FunctionName",
             };
}

@end

@implementation AWSLambdaGetFunctionConcurrencyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             };
}

@end

@implementation AWSLambdaGetFunctionConcurrencyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservedConcurrentExecutions" : @"ReservedConcurrentExecutions",
             };
}

@end

@implementation AWSLambdaGetFunctionConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"qualifier" : @"Qualifier",
             };
}

@end

@implementation AWSLambdaGetFunctionEventInvokeConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"qualifier" : @"Qualifier",
             };
}

@end

@implementation AWSLambdaGetFunctionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"qualifier" : @"Qualifier",
             };
}

@end

@implementation AWSLambdaGetFunctionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSLambdaGetFunctionUrlConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"qualifier" : @"Qualifier",
             };
}

@end

@implementation AWSLambdaGetFunctionUrlConfigResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authType" : @"AuthType",
             @"cors" : @"Cors",
             @"creationTime" : @"CreationTime",
             @"functionArn" : @"FunctionArn",
             @"functionUrl" : @"FunctionUrl",
             @"lastModifiedTime" : @"LastModifiedTime",
             };
}

+ (NSValueTransformer *)authTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSLambdaFunctionUrlAuthTypeNone);
        }
        if ([value caseInsensitiveCompare:@"AWS_IAM"] == NSOrderedSame) {
            return @(AWSLambdaFunctionUrlAuthTypeAwsIam);
        }
        return @(AWSLambdaFunctionUrlAuthTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaFunctionUrlAuthTypeNone:
                return @"NONE";
            case AWSLambdaFunctionUrlAuthTypeAwsIam:
                return @"AWS_IAM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)corsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaCors class]];
}

@end

@implementation AWSLambdaGetLayerVersionByArnRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             };
}

@end

@implementation AWSLambdaGetLayerVersionPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"layerName" : @"LayerName",
             @"versionNumber" : @"VersionNumber",
             };
}

@end

@implementation AWSLambdaGetLayerVersionPolicyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSLambdaGetLayerVersionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"layerName" : @"LayerName",
             @"versionNumber" : @"VersionNumber",
             };
}

@end

@implementation AWSLambdaGetLayerVersionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compatibleArchitectures" : @"CompatibleArchitectures",
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"qualifier" : @"Qualifier",
             };
}

@end

@implementation AWSLambdaGetPolicyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSLambdaGetProvisionedConcurrencyConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"qualifier" : @"Qualifier",
             };
}

@end

@implementation AWSLambdaGetProvisionedConcurrencyConfigResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSLambdaGetRuntimeManagementConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"qualifier" : @"Qualifier",
             };
}

@end

@implementation AWSLambdaGetRuntimeManagementConfigResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionArn" : @"FunctionArn",
             @"runtimeVersionArn" : @"RuntimeVersionArn",
             @"updateRuntimeOn" : @"UpdateRuntimeOn",
             };
}

+ (NSValueTransformer *)updateRuntimeOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Auto"] == NSOrderedSame) {
            return @(AWSLambdaUpdateRuntimeOnAuto);
        }
        if ([value caseInsensitiveCompare:@"Manual"] == NSOrderedSame) {
            return @(AWSLambdaUpdateRuntimeOnManual);
        }
        if ([value caseInsensitiveCompare:@"FunctionUpdate"] == NSOrderedSame) {
            return @(AWSLambdaUpdateRuntimeOnFunctionUpdate);
        }
        return @(AWSLambdaUpdateRuntimeOnUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaUpdateRuntimeOnAuto:
                return @"Auto";
            case AWSLambdaUpdateRuntimeOnManual:
                return @"Manual";
            case AWSLambdaUpdateRuntimeOnFunctionUpdate:
                return @"FunctionUpdate";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLambdaImageConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"command" : @"Command",
             @"entryPoint" : @"EntryPoint",
             @"workingDirectory" : @"WorkingDirectory",
             };
}

@end

@implementation AWSLambdaImageConfigError

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"message" : @"Message",
             };
}

@end

@implementation AWSLambdaImageConfigResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"error" : @"Error",
             @"imageConfig" : @"ImageConfig",
             };
}

+ (NSValueTransformer *)errorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaImageConfigError class]];
}

+ (NSValueTransformer *)imageConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaImageConfig class]];
}

@end

@implementation AWSLambdaInvocationRequest

+ (BOOL)supportsSecureCoding {
    return NO;
}

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

+ (BOOL)supportsSecureCoding {
    return NO;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"invokeArgs" : @"InvokeArgs",
             };
}

@end

@implementation AWSLambdaInvokeAsyncResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             };
}

@end

@implementation AWSLambdaLayer

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"codeSize" : @"CodeSize",
             @"signingJobArn" : @"SigningJobArn",
             @"signingProfileVersionArn" : @"SigningProfileVersionArn",
             };
}

@end

@implementation AWSLambdaLayerVersionContentInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeSha256" : @"CodeSha256",
             @"codeSize" : @"CodeSize",
             @"location" : @"Location",
             @"signingJobArn" : @"SigningJobArn",
             @"signingProfileVersionArn" : @"SigningProfileVersionArn",
             };
}

@end

@implementation AWSLambdaLayerVersionsListItem

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compatibleArchitectures" : @"CompatibleArchitectures",
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSLambdaListCodeSigningConfigsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSLambdaListCodeSigningConfigsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeSigningConfigs" : @"CodeSigningConfigs",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)codeSigningConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLambdaCodeSigningConfig class]];
}

@end

@implementation AWSLambdaListEventSourceMappingsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSLambdaListFunctionEventInvokeConfigsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSLambdaListFunctionUrlConfigsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSLambdaListFunctionUrlConfigsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionUrlConfigs" : @"FunctionUrlConfigs",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)functionUrlConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLambdaFunctionUrlConfig class]];
}

@end

@implementation AWSLambdaListFunctionsByCodeSigningConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeSigningConfigArn" : @"CodeSigningConfigArn",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSLambdaListFunctionsByCodeSigningConfigResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionArns" : @"FunctionArns",
             @"nextMarker" : @"NextMarker",
             };
}

@end

@implementation AWSLambdaListFunctionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compatibleArchitecture" : @"CompatibleArchitecture",
             @"compatibleRuntime" : @"CompatibleRuntime",
             @"layerName" : @"LayerName",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

+ (NSValueTransformer *)compatibleArchitectureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"x86_64"] == NSOrderedSame) {
            return @(AWSLambdaArchitectureX86_64);
        }
        if ([value caseInsensitiveCompare:@"arm64"] == NSOrderedSame) {
            return @(AWSLambdaArchitectureArm64);
        }
        return @(AWSLambdaArchitectureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaArchitectureX86_64:
                return @"x86_64";
            case AWSLambdaArchitectureArm64:
                return @"arm64";
            default:
                return nil;
        }
    }];
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
        if ([value caseInsensitiveCompare:@"nodejs14.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs14X);
        }
        if ([value caseInsensitiveCompare:@"nodejs16.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs16X);
        }
        if ([value caseInsensitiveCompare:@"java8"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeJava8);
        }
        if ([value caseInsensitiveCompare:@"java8.al2"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeJava8Al2);
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
        if ([value caseInsensitiveCompare:@"python3.9"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython39);
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
        if ([value caseInsensitiveCompare:@"dotnetcore3.1"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnetcore31);
        }
        if ([value caseInsensitiveCompare:@"dotnet6"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnet6);
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
        if ([value caseInsensitiveCompare:@"provided.al2"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeProvidedAl2);
        }
        if ([value caseInsensitiveCompare:@"nodejs18.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs18X);
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
            case AWSLambdaRuntimeNodejs14X:
                return @"nodejs14.x";
            case AWSLambdaRuntimeNodejs16X:
                return @"nodejs16.x";
            case AWSLambdaRuntimeJava8:
                return @"java8";
            case AWSLambdaRuntimeJava8Al2:
                return @"java8.al2";
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
            case AWSLambdaRuntimePython39:
                return @"python3.9";
            case AWSLambdaRuntimeDotnetcore10:
                return @"dotnetcore1.0";
            case AWSLambdaRuntimeDotnetcore20:
                return @"dotnetcore2.0";
            case AWSLambdaRuntimeDotnetcore21:
                return @"dotnetcore2.1";
            case AWSLambdaRuntimeDotnetcore31:
                return @"dotnetcore3.1";
            case AWSLambdaRuntimeDotnet6:
                return @"dotnet6";
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
            case AWSLambdaRuntimeProvidedAl2:
                return @"provided.al2";
            case AWSLambdaRuntimeNodejs18X:
                return @"nodejs18.x";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLambdaListLayerVersionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compatibleArchitecture" : @"CompatibleArchitecture",
             @"compatibleRuntime" : @"CompatibleRuntime",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

+ (NSValueTransformer *)compatibleArchitectureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"x86_64"] == NSOrderedSame) {
            return @(AWSLambdaArchitectureX86_64);
        }
        if ([value caseInsensitiveCompare:@"arm64"] == NSOrderedSame) {
            return @(AWSLambdaArchitectureArm64);
        }
        return @(AWSLambdaArchitectureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaArchitectureX86_64:
                return @"x86_64";
            case AWSLambdaArchitectureArm64:
                return @"arm64";
            default:
                return nil;
        }
    }];
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
        if ([value caseInsensitiveCompare:@"nodejs14.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs14X);
        }
        if ([value caseInsensitiveCompare:@"nodejs16.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs16X);
        }
        if ([value caseInsensitiveCompare:@"java8"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeJava8);
        }
        if ([value caseInsensitiveCompare:@"java8.al2"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeJava8Al2);
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
        if ([value caseInsensitiveCompare:@"python3.9"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython39);
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
        if ([value caseInsensitiveCompare:@"dotnetcore3.1"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnetcore31);
        }
        if ([value caseInsensitiveCompare:@"dotnet6"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnet6);
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
        if ([value caseInsensitiveCompare:@"provided.al2"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeProvidedAl2);
        }
        if ([value caseInsensitiveCompare:@"nodejs18.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs18X);
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
            case AWSLambdaRuntimeNodejs14X:
                return @"nodejs14.x";
            case AWSLambdaRuntimeNodejs16X:
                return @"nodejs16.x";
            case AWSLambdaRuntimeJava8:
                return @"java8";
            case AWSLambdaRuntimeJava8Al2:
                return @"java8.al2";
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
            case AWSLambdaRuntimePython39:
                return @"python3.9";
            case AWSLambdaRuntimeDotnetcore10:
                return @"dotnetcore1.0";
            case AWSLambdaRuntimeDotnetcore20:
                return @"dotnetcore2.0";
            case AWSLambdaRuntimeDotnetcore21:
                return @"dotnetcore2.1";
            case AWSLambdaRuntimeDotnetcore31:
                return @"dotnetcore3.1";
            case AWSLambdaRuntimeDotnet6:
                return @"dotnet6";
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
            case AWSLambdaRuntimeProvidedAl2:
                return @"provided.al2";
            case AWSLambdaRuntimeNodejs18X:
                return @"nodejs18.x";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLambdaListLayersResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSLambdaListProvisionedConcurrencyConfigsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resource" : @"Resource",
             };
}

@end

@implementation AWSLambdaListTagsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSLambdaListVersionsByFunctionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSLambdaListVersionsByFunctionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"Destination",
             };
}

@end

@implementation AWSLambdaOnSuccess

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"Destination",
             };
}

@end

@implementation AWSLambdaProvisionedConcurrencyConfigListItem

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compatibleArchitectures" : @"CompatibleArchitectures",
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compatibleArchitectures" : @"CompatibleArchitectures",
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeSha256" : @"CodeSha256",
             @"detail" : @"Description",
             @"functionName" : @"FunctionName",
             @"revisionId" : @"RevisionId",
             };
}

@end

@implementation AWSLambdaPutFunctionCodeSigningConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeSigningConfigArn" : @"CodeSigningConfigArn",
             @"functionName" : @"FunctionName",
             };
}

@end

@implementation AWSLambdaPutFunctionCodeSigningConfigResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeSigningConfigArn" : @"CodeSigningConfigArn",
             @"functionName" : @"FunctionName",
             };
}

@end

@implementation AWSLambdaPutFunctionConcurrencyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"reservedConcurrentExecutions" : @"ReservedConcurrentExecutions",
             };
}

@end

@implementation AWSLambdaPutFunctionEventInvokeConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"provisionedConcurrentExecutions" : @"ProvisionedConcurrentExecutions",
             @"qualifier" : @"Qualifier",
             };
}

@end

@implementation AWSLambdaPutProvisionedConcurrencyConfigResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSLambdaPutRuntimeManagementConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"qualifier" : @"Qualifier",
             @"runtimeVersionArn" : @"RuntimeVersionArn",
             @"updateRuntimeOn" : @"UpdateRuntimeOn",
             };
}

+ (NSValueTransformer *)updateRuntimeOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Auto"] == NSOrderedSame) {
            return @(AWSLambdaUpdateRuntimeOnAuto);
        }
        if ([value caseInsensitiveCompare:@"Manual"] == NSOrderedSame) {
            return @(AWSLambdaUpdateRuntimeOnManual);
        }
        if ([value caseInsensitiveCompare:@"FunctionUpdate"] == NSOrderedSame) {
            return @(AWSLambdaUpdateRuntimeOnFunctionUpdate);
        }
        return @(AWSLambdaUpdateRuntimeOnUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaUpdateRuntimeOnAuto:
                return @"Auto";
            case AWSLambdaUpdateRuntimeOnManual:
                return @"Manual";
            case AWSLambdaUpdateRuntimeOnFunctionUpdate:
                return @"FunctionUpdate";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLambdaPutRuntimeManagementConfigResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionArn" : @"FunctionArn",
             @"runtimeVersionArn" : @"RuntimeVersionArn",
             @"updateRuntimeOn" : @"UpdateRuntimeOn",
             };
}

+ (NSValueTransformer *)updateRuntimeOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Auto"] == NSOrderedSame) {
            return @(AWSLambdaUpdateRuntimeOnAuto);
        }
        if ([value caseInsensitiveCompare:@"Manual"] == NSOrderedSame) {
            return @(AWSLambdaUpdateRuntimeOnManual);
        }
        if ([value caseInsensitiveCompare:@"FunctionUpdate"] == NSOrderedSame) {
            return @(AWSLambdaUpdateRuntimeOnFunctionUpdate);
        }
        return @(AWSLambdaUpdateRuntimeOnUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaUpdateRuntimeOnAuto:
                return @"Auto";
            case AWSLambdaUpdateRuntimeOnManual:
                return @"Manual";
            case AWSLambdaUpdateRuntimeOnFunctionUpdate:
                return @"FunctionUpdate";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLambdaRemoveLayerVersionPermissionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionName" : @"FunctionName",
             @"qualifier" : @"Qualifier",
             @"revisionId" : @"RevisionId",
             @"statementId" : @"StatementId",
             };
}

@end

@implementation AWSLambdaRuntimeVersionConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"error" : @"Error",
             @"runtimeVersionArn" : @"RuntimeVersionArn",
             };
}

+ (NSValueTransformer *)errorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaRuntimeVersionError class]];
}

@end

@implementation AWSLambdaRuntimeVersionError

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"message" : @"Message",
             };
}

@end

@implementation AWSLambdaScalingConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maximumConcurrency" : @"MaximumConcurrency",
             };
}

@end

@implementation AWSLambdaSelfManagedEventSource

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoints" : @"Endpoints",
             };
}

@end

@implementation AWSLambdaSelfManagedKafkaEventSourceConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"consumerGroupId" : @"ConsumerGroupId",
             };
}

@end

@implementation AWSLambdaSnapStart

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyOn" : @"ApplyOn",
             };
}

+ (NSValueTransformer *)applyOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PublishedVersions"] == NSOrderedSame) {
            return @(AWSLambdaSnapStartApplyOnPublishedVersions);
        }
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSLambdaSnapStartApplyOnNone);
        }
        return @(AWSLambdaSnapStartApplyOnUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaSnapStartApplyOnPublishedVersions:
                return @"PublishedVersions";
            case AWSLambdaSnapStartApplyOnNone:
                return @"None";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLambdaSnapStartResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyOn" : @"ApplyOn",
             @"optimizationStatus" : @"OptimizationStatus",
             };
}

+ (NSValueTransformer *)applyOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PublishedVersions"] == NSOrderedSame) {
            return @(AWSLambdaSnapStartApplyOnPublishedVersions);
        }
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSLambdaSnapStartApplyOnNone);
        }
        return @(AWSLambdaSnapStartApplyOnUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaSnapStartApplyOnPublishedVersions:
                return @"PublishedVersions";
            case AWSLambdaSnapStartApplyOnNone:
                return @"None";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)optimizationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"On"] == NSOrderedSame) {
            return @(AWSLambdaSnapStartOptimizationStatusOn);
        }
        if ([value caseInsensitiveCompare:@"Off"] == NSOrderedSame) {
            return @(AWSLambdaSnapStartOptimizationStatusOff);
        }
        return @(AWSLambdaSnapStartOptimizationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaSnapStartOptimizationStatusOn:
                return @"On";
            case AWSLambdaSnapStartOptimizationStatusOff:
                return @"Off";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLambdaSourceAccessConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             @"URI" : @"URI",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BASIC_AUTH"] == NSOrderedSame) {
            return @(AWSLambdaSourceAccessTypeBasicAuth);
        }
        if ([value caseInsensitiveCompare:@"VPC_SUBNET"] == NSOrderedSame) {
            return @(AWSLambdaSourceAccessTypeVpcSubnet);
        }
        if ([value caseInsensitiveCompare:@"VPC_SECURITY_GROUP"] == NSOrderedSame) {
            return @(AWSLambdaSourceAccessTypeVpcSecurityGroup);
        }
        if ([value caseInsensitiveCompare:@"SASL_SCRAM_512_AUTH"] == NSOrderedSame) {
            return @(AWSLambdaSourceAccessTypeSaslScram512Auth);
        }
        if ([value caseInsensitiveCompare:@"SASL_SCRAM_256_AUTH"] == NSOrderedSame) {
            return @(AWSLambdaSourceAccessTypeSaslScram256Auth);
        }
        if ([value caseInsensitiveCompare:@"VIRTUAL_HOST"] == NSOrderedSame) {
            return @(AWSLambdaSourceAccessTypeVirtualHost);
        }
        if ([value caseInsensitiveCompare:@"CLIENT_CERTIFICATE_TLS_AUTH"] == NSOrderedSame) {
            return @(AWSLambdaSourceAccessTypeClientCertificateTlsAuth);
        }
        if ([value caseInsensitiveCompare:@"SERVER_ROOT_CA_CERTIFICATE"] == NSOrderedSame) {
            return @(AWSLambdaSourceAccessTypeServerRootCaCertificate);
        }
        return @(AWSLambdaSourceAccessTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaSourceAccessTypeBasicAuth:
                return @"BASIC_AUTH";
            case AWSLambdaSourceAccessTypeVpcSubnet:
                return @"VPC_SUBNET";
            case AWSLambdaSourceAccessTypeVpcSecurityGroup:
                return @"VPC_SECURITY_GROUP";
            case AWSLambdaSourceAccessTypeSaslScram512Auth:
                return @"SASL_SCRAM_512_AUTH";
            case AWSLambdaSourceAccessTypeSaslScram256Auth:
                return @"SASL_SCRAM_256_AUTH";
            case AWSLambdaSourceAccessTypeVirtualHost:
                return @"VIRTUAL_HOST";
            case AWSLambdaSourceAccessTypeClientCertificateTlsAuth:
                return @"CLIENT_CERTIFICATE_TLS_AUTH";
            case AWSLambdaSourceAccessTypeServerRootCaCertificate:
                return @"SERVER_ROOT_CA_CERTIFICATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLambdaTagResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resource" : @"Resource",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSLambdaTracingConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resource" : @"Resource",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSLambdaUpdateAliasRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSLambdaUpdateCodeSigningConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedPublishers" : @"AllowedPublishers",
             @"codeSigningConfigArn" : @"CodeSigningConfigArn",
             @"codeSigningPolicies" : @"CodeSigningPolicies",
             @"detail" : @"Description",
             };
}

+ (NSValueTransformer *)allowedPublishersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaAllowedPublishers class]];
}

+ (NSValueTransformer *)codeSigningPoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaCodeSigningPolicies class]];
}

@end

@implementation AWSLambdaUpdateCodeSigningConfigResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeSigningConfig" : @"CodeSigningConfig",
             };
}

+ (NSValueTransformer *)codeSigningConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaCodeSigningConfig class]];
}

@end

@implementation AWSLambdaUpdateEventSourceMappingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchSize" : @"BatchSize",
             @"bisectBatchOnFunctionError" : @"BisectBatchOnFunctionError",
             @"destinationConfig" : @"DestinationConfig",
             @"documentDBEventSourceConfig" : @"DocumentDBEventSourceConfig",
             @"enabled" : @"Enabled",
             @"filterCriteria" : @"FilterCriteria",
             @"functionName" : @"FunctionName",
             @"functionResponseTypes" : @"FunctionResponseTypes",
             @"maximumBatchingWindowInSeconds" : @"MaximumBatchingWindowInSeconds",
             @"maximumRecordAgeInSeconds" : @"MaximumRecordAgeInSeconds",
             @"maximumRetryAttempts" : @"MaximumRetryAttempts",
             @"parallelizationFactor" : @"ParallelizationFactor",
             @"scalingConfig" : @"ScalingConfig",
             @"sourceAccessConfigurations" : @"SourceAccessConfigurations",
             @"tumblingWindowInSeconds" : @"TumblingWindowInSeconds",
             @"UUID" : @"UUID",
             };
}

+ (NSValueTransformer *)destinationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaDestinationConfig class]];
}

+ (NSValueTransformer *)documentDBEventSourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaDocumentDBEventSourceConfig class]];
}

+ (NSValueTransformer *)filterCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaFilterCriteria class]];
}

+ (NSValueTransformer *)scalingConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaScalingConfig class]];
}

+ (NSValueTransformer *)sourceAccessConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLambdaSourceAccessConfiguration class]];
}

@end

@implementation AWSLambdaUpdateFunctionCodeRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"architectures" : @"Architectures",
             @"dryRun" : @"DryRun",
             @"functionName" : @"FunctionName",
             @"imageUri" : @"ImageUri",
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deadLetterConfig" : @"DeadLetterConfig",
             @"detail" : @"Description",
             @"environment" : @"Environment",
             @"ephemeralStorage" : @"EphemeralStorage",
             @"fileSystemConfigs" : @"FileSystemConfigs",
             @"functionName" : @"FunctionName",
             @"handler" : @"Handler",
             @"imageConfig" : @"ImageConfig",
             @"KMSKeyArn" : @"KMSKeyArn",
             @"layers" : @"Layers",
             @"memorySize" : @"MemorySize",
             @"revisionId" : @"RevisionId",
             @"role" : @"Role",
             @"runtime" : @"Runtime",
             @"snapStart" : @"SnapStart",
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

+ (NSValueTransformer *)ephemeralStorageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaEphemeralStorage class]];
}

+ (NSValueTransformer *)fileSystemConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLambdaFileSystemConfig class]];
}

+ (NSValueTransformer *)imageConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaImageConfig class]];
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
        if ([value caseInsensitiveCompare:@"nodejs14.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs14X);
        }
        if ([value caseInsensitiveCompare:@"nodejs16.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs16X);
        }
        if ([value caseInsensitiveCompare:@"java8"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeJava8);
        }
        if ([value caseInsensitiveCompare:@"java8.al2"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeJava8Al2);
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
        if ([value caseInsensitiveCompare:@"python3.9"] == NSOrderedSame) {
            return @(AWSLambdaRuntimePython39);
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
        if ([value caseInsensitiveCompare:@"dotnetcore3.1"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnetcore31);
        }
        if ([value caseInsensitiveCompare:@"dotnet6"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeDotnet6);
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
        if ([value caseInsensitiveCompare:@"provided.al2"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeProvidedAl2);
        }
        if ([value caseInsensitiveCompare:@"nodejs18.x"] == NSOrderedSame) {
            return @(AWSLambdaRuntimeNodejs18X);
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
            case AWSLambdaRuntimeNodejs14X:
                return @"nodejs14.x";
            case AWSLambdaRuntimeNodejs16X:
                return @"nodejs16.x";
            case AWSLambdaRuntimeJava8:
                return @"java8";
            case AWSLambdaRuntimeJava8Al2:
                return @"java8.al2";
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
            case AWSLambdaRuntimePython39:
                return @"python3.9";
            case AWSLambdaRuntimeDotnetcore10:
                return @"dotnetcore1.0";
            case AWSLambdaRuntimeDotnetcore20:
                return @"dotnetcore2.0";
            case AWSLambdaRuntimeDotnetcore21:
                return @"dotnetcore2.1";
            case AWSLambdaRuntimeDotnetcore31:
                return @"dotnetcore3.1";
            case AWSLambdaRuntimeDotnet6:
                return @"dotnet6";
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
            case AWSLambdaRuntimeProvidedAl2:
                return @"provided.al2";
            case AWSLambdaRuntimeNodejs18X:
                return @"nodejs18.x";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)snapStartJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaSnapStart class]];
}

+ (NSValueTransformer *)tracingConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaTracingConfig class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaVpcConfig class]];
}

@end

@implementation AWSLambdaUpdateFunctionEventInvokeConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSLambdaUpdateFunctionUrlConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authType" : @"AuthType",
             @"cors" : @"Cors",
             @"functionName" : @"FunctionName",
             @"qualifier" : @"Qualifier",
             };
}

+ (NSValueTransformer *)authTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSLambdaFunctionUrlAuthTypeNone);
        }
        if ([value caseInsensitiveCompare:@"AWS_IAM"] == NSOrderedSame) {
            return @(AWSLambdaFunctionUrlAuthTypeAwsIam);
        }
        return @(AWSLambdaFunctionUrlAuthTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaFunctionUrlAuthTypeNone:
                return @"NONE";
            case AWSLambdaFunctionUrlAuthTypeAwsIam:
                return @"AWS_IAM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)corsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaCors class]];
}

@end

@implementation AWSLambdaUpdateFunctionUrlConfigResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authType" : @"AuthType",
             @"cors" : @"Cors",
             @"creationTime" : @"CreationTime",
             @"functionArn" : @"FunctionArn",
             @"functionUrl" : @"FunctionUrl",
             @"lastModifiedTime" : @"LastModifiedTime",
             };
}

+ (NSValueTransformer *)authTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSLambdaFunctionUrlAuthTypeNone);
        }
        if ([value caseInsensitiveCompare:@"AWS_IAM"] == NSOrderedSame) {
            return @(AWSLambdaFunctionUrlAuthTypeAwsIam);
        }
        return @(AWSLambdaFunctionUrlAuthTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLambdaFunctionUrlAuthTypeNone:
                return @"NONE";
            case AWSLambdaFunctionUrlAuthTypeAwsIam:
                return @"AWS_IAM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)corsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLambdaCors class]];
}

@end

@implementation AWSLambdaVpcConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             };
}

@end

@implementation AWSLambdaVpcConfigResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             @"vpcId" : @"VpcId",
             };
}

@end
