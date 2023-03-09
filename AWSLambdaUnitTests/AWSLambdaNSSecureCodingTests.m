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

#import <XCTest/XCTest.h>
#import <AWSNSSecureCodingTestBase/AWSNSSecureCodingTestBase.h>
#import "AWSLambdaModel.h"

@interface AWSLambdaNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSLambdaAccountLimit API_AVAILABLE(ios(11));
- (void) test_AWSLambdaAccountUsage API_AVAILABLE(ios(11));
- (void) test_AWSLambdaAddLayerVersionPermissionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaAddLayerVersionPermissionResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaAddPermissionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaAddPermissionResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaAliasConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSLambdaAliasRoutingConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSLambdaAllowedPublishers API_AVAILABLE(ios(11));
- (void) test_AWSLambdaAmazonManagedKafkaEventSourceConfig API_AVAILABLE(ios(11));
- (void) test_AWSLambdaCodeSigningConfig API_AVAILABLE(ios(11));
- (void) test_AWSLambdaCodeSigningPolicies API_AVAILABLE(ios(11));
- (void) test_AWSLambdaConcurrency API_AVAILABLE(ios(11));
- (void) test_AWSLambdaCors API_AVAILABLE(ios(11));
- (void) test_AWSLambdaCreateAliasRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaCreateCodeSigningConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaCreateCodeSigningConfigResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaCreateEventSourceMappingRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaCreateFunctionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaCreateFunctionUrlConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaCreateFunctionUrlConfigResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaDeadLetterConfig API_AVAILABLE(ios(11));
- (void) test_AWSLambdaDeleteAliasRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaDeleteCodeSigningConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaDeleteCodeSigningConfigResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaDeleteEventSourceMappingRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaDeleteFunctionCodeSigningConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaDeleteFunctionConcurrencyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaDeleteFunctionEventInvokeConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaDeleteFunctionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaDeleteFunctionUrlConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaDeleteLayerVersionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaDeleteProvisionedConcurrencyConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaDestinationConfig API_AVAILABLE(ios(11));
- (void) test_AWSLambdaDocumentDBEventSourceConfig API_AVAILABLE(ios(11));
- (void) test_AWSLambdaEnvironment API_AVAILABLE(ios(11));
- (void) test_AWSLambdaEnvironmentError API_AVAILABLE(ios(11));
- (void) test_AWSLambdaEnvironmentResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaEphemeralStorage API_AVAILABLE(ios(11));
- (void) test_AWSLambdaEventSourceMappingConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSLambdaFileSystemConfig API_AVAILABLE(ios(11));
- (void) test_AWSLambdaFilter API_AVAILABLE(ios(11));
- (void) test_AWSLambdaFilterCriteria API_AVAILABLE(ios(11));
- (void) test_AWSLambdaFunctionCode API_AVAILABLE(ios(11));
- (void) test_AWSLambdaFunctionCodeLocation API_AVAILABLE(ios(11));
- (void) test_AWSLambdaFunctionConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSLambdaFunctionEventInvokeConfig API_AVAILABLE(ios(11));
- (void) test_AWSLambdaFunctionUrlConfig API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetAccountSettingsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetAccountSettingsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetAliasRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetCodeSigningConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetCodeSigningConfigResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetEventSourceMappingRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetFunctionCodeSigningConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetFunctionCodeSigningConfigResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetFunctionConcurrencyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetFunctionConcurrencyResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetFunctionConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetFunctionEventInvokeConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetFunctionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetFunctionResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetFunctionUrlConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetFunctionUrlConfigResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetLayerVersionByArnRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetLayerVersionPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetLayerVersionPolicyResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetLayerVersionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetLayerVersionResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetPolicyResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetProvisionedConcurrencyConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetProvisionedConcurrencyConfigResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetRuntimeManagementConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaGetRuntimeManagementConfigResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaImageConfig API_AVAILABLE(ios(11));
- (void) test_AWSLambdaImageConfigError API_AVAILABLE(ios(11));
- (void) test_AWSLambdaImageConfigResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaInvocationRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaInvocationResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaInvokeAsyncRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaInvokeAsyncResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaLayer API_AVAILABLE(ios(11));
- (void) test_AWSLambdaLayerVersionContentInput API_AVAILABLE(ios(11));
- (void) test_AWSLambdaLayerVersionContentOutput API_AVAILABLE(ios(11));
- (void) test_AWSLambdaLayerVersionsListItem API_AVAILABLE(ios(11));
- (void) test_AWSLambdaLayersListItem API_AVAILABLE(ios(11));
- (void) test_AWSLambdaListAliasesRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaListAliasesResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaListCodeSigningConfigsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaListCodeSigningConfigsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaListEventSourceMappingsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaListEventSourceMappingsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaListFunctionEventInvokeConfigsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaListFunctionEventInvokeConfigsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaListFunctionUrlConfigsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaListFunctionUrlConfigsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaListFunctionsByCodeSigningConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaListFunctionsByCodeSigningConfigResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaListFunctionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaListFunctionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaListLayerVersionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaListLayerVersionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaListLayersRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaListLayersResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaListProvisionedConcurrencyConfigsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaListProvisionedConcurrencyConfigsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaListTagsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaListTagsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaListVersionsByFunctionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaListVersionsByFunctionResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaOnFailure API_AVAILABLE(ios(11));
- (void) test_AWSLambdaOnSuccess API_AVAILABLE(ios(11));
- (void) test_AWSLambdaProvisionedConcurrencyConfigListItem API_AVAILABLE(ios(11));
- (void) test_AWSLambdaPublishLayerVersionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaPublishLayerVersionResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaPublishVersionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaPutFunctionCodeSigningConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaPutFunctionCodeSigningConfigResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaPutFunctionConcurrencyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaPutFunctionEventInvokeConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaPutProvisionedConcurrencyConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaPutProvisionedConcurrencyConfigResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaPutRuntimeManagementConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaPutRuntimeManagementConfigResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaRemoveLayerVersionPermissionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaRemovePermissionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaRuntimeVersionConfig API_AVAILABLE(ios(11));
- (void) test_AWSLambdaRuntimeVersionError API_AVAILABLE(ios(11));
- (void) test_AWSLambdaScalingConfig API_AVAILABLE(ios(11));
- (void) test_AWSLambdaSelfManagedEventSource API_AVAILABLE(ios(11));
- (void) test_AWSLambdaSelfManagedKafkaEventSourceConfig API_AVAILABLE(ios(11));
- (void) test_AWSLambdaSnapStart API_AVAILABLE(ios(11));
- (void) test_AWSLambdaSnapStartResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaSourceAccessConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSLambdaTagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaTracingConfig API_AVAILABLE(ios(11));
- (void) test_AWSLambdaTracingConfigResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaUntagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaUpdateAliasRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaUpdateCodeSigningConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaUpdateCodeSigningConfigResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaUpdateEventSourceMappingRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaUpdateFunctionCodeRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaUpdateFunctionConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaUpdateFunctionEventInvokeConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaUpdateFunctionUrlConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSLambdaUpdateFunctionUrlConfigResponse API_AVAILABLE(ios(11));
- (void) test_AWSLambdaVpcConfig API_AVAILABLE(ios(11));
- (void) test_AWSLambdaVpcConfigResponse API_AVAILABLE(ios(11));

@end

@implementation AWSLambdaNSSecureCodingTests

- (void) test_AWSLambdaAccountLimit {
    [self validateSecureCodingForClass:[AWSLambdaAccountLimit class]];
}

- (void) test_AWSLambdaAccountUsage {
    [self validateSecureCodingForClass:[AWSLambdaAccountUsage class]];
}

- (void) test_AWSLambdaAddLayerVersionPermissionRequest {
    [self validateSecureCodingForClass:[AWSLambdaAddLayerVersionPermissionRequest class]];
}

- (void) test_AWSLambdaAddLayerVersionPermissionResponse {
    [self validateSecureCodingForClass:[AWSLambdaAddLayerVersionPermissionResponse class]];
}

- (void) test_AWSLambdaAddPermissionRequest {
    [self validateSecureCodingForClass:[AWSLambdaAddPermissionRequest class]];
}

- (void) test_AWSLambdaAddPermissionResponse {
    [self validateSecureCodingForClass:[AWSLambdaAddPermissionResponse class]];
}

- (void) test_AWSLambdaAliasConfiguration {
    [self validateSecureCodingForClass:[AWSLambdaAliasConfiguration class]];
}

- (void) test_AWSLambdaAliasRoutingConfiguration {
    [self validateSecureCodingForClass:[AWSLambdaAliasRoutingConfiguration class]];
}

- (void) test_AWSLambdaAllowedPublishers {
    [self validateSecureCodingForClass:[AWSLambdaAllowedPublishers class]];
}

- (void) test_AWSLambdaAmazonManagedKafkaEventSourceConfig {
    [self validateSecureCodingForClass:[AWSLambdaAmazonManagedKafkaEventSourceConfig class]];
}

- (void) test_AWSLambdaCodeSigningConfig {
    [self validateSecureCodingForClass:[AWSLambdaCodeSigningConfig class]];
}

- (void) test_AWSLambdaCodeSigningPolicies {
    [self validateSecureCodingForClass:[AWSLambdaCodeSigningPolicies class]];
}

- (void) test_AWSLambdaConcurrency {
    [self validateSecureCodingForClass:[AWSLambdaConcurrency class]];
}

- (void) test_AWSLambdaCors {
    [self validateSecureCodingForClass:[AWSLambdaCors class]];
}

- (void) test_AWSLambdaCreateAliasRequest {
    [self validateSecureCodingForClass:[AWSLambdaCreateAliasRequest class]];
}

- (void) test_AWSLambdaCreateCodeSigningConfigRequest {
    [self validateSecureCodingForClass:[AWSLambdaCreateCodeSigningConfigRequest class]];
}

- (void) test_AWSLambdaCreateCodeSigningConfigResponse {
    [self validateSecureCodingForClass:[AWSLambdaCreateCodeSigningConfigResponse class]];
}

- (void) test_AWSLambdaCreateEventSourceMappingRequest {
    [self validateSecureCodingForClass:[AWSLambdaCreateEventSourceMappingRequest class]];
}

- (void) test_AWSLambdaCreateFunctionRequest {
    [self validateSecureCodingForClass:[AWSLambdaCreateFunctionRequest class]];
}

- (void) test_AWSLambdaCreateFunctionUrlConfigRequest {
    [self validateSecureCodingForClass:[AWSLambdaCreateFunctionUrlConfigRequest class]];
}

- (void) test_AWSLambdaCreateFunctionUrlConfigResponse {
    [self validateSecureCodingForClass:[AWSLambdaCreateFunctionUrlConfigResponse class]];
}

- (void) test_AWSLambdaDeadLetterConfig {
    [self validateSecureCodingForClass:[AWSLambdaDeadLetterConfig class]];
}

- (void) test_AWSLambdaDeleteAliasRequest {
    [self validateSecureCodingForClass:[AWSLambdaDeleteAliasRequest class]];
}

- (void) test_AWSLambdaDeleteCodeSigningConfigRequest {
    [self validateSecureCodingForClass:[AWSLambdaDeleteCodeSigningConfigRequest class]];
}

- (void) test_AWSLambdaDeleteCodeSigningConfigResponse {
    [self validateSecureCodingForClass:[AWSLambdaDeleteCodeSigningConfigResponse class]];
}

- (void) test_AWSLambdaDeleteEventSourceMappingRequest {
    [self validateSecureCodingForClass:[AWSLambdaDeleteEventSourceMappingRequest class]];
}

- (void) test_AWSLambdaDeleteFunctionCodeSigningConfigRequest {
    [self validateSecureCodingForClass:[AWSLambdaDeleteFunctionCodeSigningConfigRequest class]];
}

- (void) test_AWSLambdaDeleteFunctionConcurrencyRequest {
    [self validateSecureCodingForClass:[AWSLambdaDeleteFunctionConcurrencyRequest class]];
}

- (void) test_AWSLambdaDeleteFunctionEventInvokeConfigRequest {
    [self validateSecureCodingForClass:[AWSLambdaDeleteFunctionEventInvokeConfigRequest class]];
}

- (void) test_AWSLambdaDeleteFunctionRequest {
    [self validateSecureCodingForClass:[AWSLambdaDeleteFunctionRequest class]];
}

- (void) test_AWSLambdaDeleteFunctionUrlConfigRequest {
    [self validateSecureCodingForClass:[AWSLambdaDeleteFunctionUrlConfigRequest class]];
}

- (void) test_AWSLambdaDeleteLayerVersionRequest {
    [self validateSecureCodingForClass:[AWSLambdaDeleteLayerVersionRequest class]];
}

- (void) test_AWSLambdaDeleteProvisionedConcurrencyConfigRequest {
    [self validateSecureCodingForClass:[AWSLambdaDeleteProvisionedConcurrencyConfigRequest class]];
}

- (void) test_AWSLambdaDestinationConfig {
    [self validateSecureCodingForClass:[AWSLambdaDestinationConfig class]];
}

- (void) test_AWSLambdaDocumentDBEventSourceConfig {
    [self validateSecureCodingForClass:[AWSLambdaDocumentDBEventSourceConfig class]];
}

- (void) test_AWSLambdaEnvironment {
    [self validateSecureCodingForClass:[AWSLambdaEnvironment class]];
}

- (void) test_AWSLambdaEnvironmentError {
    [self validateSecureCodingForClass:[AWSLambdaEnvironmentError class]];
}

- (void) test_AWSLambdaEnvironmentResponse {
    [self validateSecureCodingForClass:[AWSLambdaEnvironmentResponse class]];
}

- (void) test_AWSLambdaEphemeralStorage {
    [self validateSecureCodingForClass:[AWSLambdaEphemeralStorage class]];
}

- (void) test_AWSLambdaEventSourceMappingConfiguration {
    [self validateSecureCodingForClass:[AWSLambdaEventSourceMappingConfiguration class]];
}

- (void) test_AWSLambdaFileSystemConfig {
    [self validateSecureCodingForClass:[AWSLambdaFileSystemConfig class]];
}

- (void) test_AWSLambdaFilter {
    [self validateSecureCodingForClass:[AWSLambdaFilter class]];
}

- (void) test_AWSLambdaFilterCriteria {
    [self validateSecureCodingForClass:[AWSLambdaFilterCriteria class]];
}

- (void) test_AWSLambdaFunctionCode {
    [self validateSecureCodingForClass:[AWSLambdaFunctionCode class]];
}

- (void) test_AWSLambdaFunctionCodeLocation {
    [self validateSecureCodingForClass:[AWSLambdaFunctionCodeLocation class]];
}

- (void) test_AWSLambdaFunctionConfiguration {
    [self validateSecureCodingForClass:[AWSLambdaFunctionConfiguration class]];
}

- (void) test_AWSLambdaFunctionEventInvokeConfig {
    [self validateSecureCodingForClass:[AWSLambdaFunctionEventInvokeConfig class]];
}

- (void) test_AWSLambdaFunctionUrlConfig {
    [self validateSecureCodingForClass:[AWSLambdaFunctionUrlConfig class]];
}

- (void) test_AWSLambdaGetAccountSettingsRequest {
    [self validateSecureCodingForClass:[AWSLambdaGetAccountSettingsRequest class]];
}

- (void) test_AWSLambdaGetAccountSettingsResponse {
    [self validateSecureCodingForClass:[AWSLambdaGetAccountSettingsResponse class]];
}

- (void) test_AWSLambdaGetAliasRequest {
    [self validateSecureCodingForClass:[AWSLambdaGetAliasRequest class]];
}

- (void) test_AWSLambdaGetCodeSigningConfigRequest {
    [self validateSecureCodingForClass:[AWSLambdaGetCodeSigningConfigRequest class]];
}

- (void) test_AWSLambdaGetCodeSigningConfigResponse {
    [self validateSecureCodingForClass:[AWSLambdaGetCodeSigningConfigResponse class]];
}

- (void) test_AWSLambdaGetEventSourceMappingRequest {
    [self validateSecureCodingForClass:[AWSLambdaGetEventSourceMappingRequest class]];
}

- (void) test_AWSLambdaGetFunctionCodeSigningConfigRequest {
    [self validateSecureCodingForClass:[AWSLambdaGetFunctionCodeSigningConfigRequest class]];
}

- (void) test_AWSLambdaGetFunctionCodeSigningConfigResponse {
    [self validateSecureCodingForClass:[AWSLambdaGetFunctionCodeSigningConfigResponse class]];
}

- (void) test_AWSLambdaGetFunctionConcurrencyRequest {
    [self validateSecureCodingForClass:[AWSLambdaGetFunctionConcurrencyRequest class]];
}

- (void) test_AWSLambdaGetFunctionConcurrencyResponse {
    [self validateSecureCodingForClass:[AWSLambdaGetFunctionConcurrencyResponse class]];
}

- (void) test_AWSLambdaGetFunctionConfigurationRequest {
    [self validateSecureCodingForClass:[AWSLambdaGetFunctionConfigurationRequest class]];
}

- (void) test_AWSLambdaGetFunctionEventInvokeConfigRequest {
    [self validateSecureCodingForClass:[AWSLambdaGetFunctionEventInvokeConfigRequest class]];
}

- (void) test_AWSLambdaGetFunctionRequest {
    [self validateSecureCodingForClass:[AWSLambdaGetFunctionRequest class]];
}

- (void) test_AWSLambdaGetFunctionResponse {
    [self validateSecureCodingForClass:[AWSLambdaGetFunctionResponse class]];
}

- (void) test_AWSLambdaGetFunctionUrlConfigRequest {
    [self validateSecureCodingForClass:[AWSLambdaGetFunctionUrlConfigRequest class]];
}

- (void) test_AWSLambdaGetFunctionUrlConfigResponse {
    [self validateSecureCodingForClass:[AWSLambdaGetFunctionUrlConfigResponse class]];
}

- (void) test_AWSLambdaGetLayerVersionByArnRequest {
    [self validateSecureCodingForClass:[AWSLambdaGetLayerVersionByArnRequest class]];
}

- (void) test_AWSLambdaGetLayerVersionPolicyRequest {
    [self validateSecureCodingForClass:[AWSLambdaGetLayerVersionPolicyRequest class]];
}

- (void) test_AWSLambdaGetLayerVersionPolicyResponse {
    [self validateSecureCodingForClass:[AWSLambdaGetLayerVersionPolicyResponse class]];
}

- (void) test_AWSLambdaGetLayerVersionRequest {
    [self validateSecureCodingForClass:[AWSLambdaGetLayerVersionRequest class]];
}

- (void) test_AWSLambdaGetLayerVersionResponse {
    [self validateSecureCodingForClass:[AWSLambdaGetLayerVersionResponse class]];
}

- (void) test_AWSLambdaGetPolicyRequest {
    [self validateSecureCodingForClass:[AWSLambdaGetPolicyRequest class]];
}

- (void) test_AWSLambdaGetPolicyResponse {
    [self validateSecureCodingForClass:[AWSLambdaGetPolicyResponse class]];
}

- (void) test_AWSLambdaGetProvisionedConcurrencyConfigRequest {
    [self validateSecureCodingForClass:[AWSLambdaGetProvisionedConcurrencyConfigRequest class]];
}

- (void) test_AWSLambdaGetProvisionedConcurrencyConfigResponse {
    [self validateSecureCodingForClass:[AWSLambdaGetProvisionedConcurrencyConfigResponse class]];
}

- (void) test_AWSLambdaGetRuntimeManagementConfigRequest {
    [self validateSecureCodingForClass:[AWSLambdaGetRuntimeManagementConfigRequest class]];
}

- (void) test_AWSLambdaGetRuntimeManagementConfigResponse {
    [self validateSecureCodingForClass:[AWSLambdaGetRuntimeManagementConfigResponse class]];
}

- (void) test_AWSLambdaImageConfig {
    [self validateSecureCodingForClass:[AWSLambdaImageConfig class]];
}

- (void) test_AWSLambdaImageConfigError {
    [self validateSecureCodingForClass:[AWSLambdaImageConfigError class]];
}

- (void) test_AWSLambdaImageConfigResponse {
    [self validateSecureCodingForClass:[AWSLambdaImageConfigResponse class]];
}

- (void) test_AWSLambdaInvocationRequest {
    [self validateClassDoesNotSupportSecureCoding:[AWSLambdaInvocationRequest class]];
}

- (void) test_AWSLambdaInvocationResponse {
    [self validateClassDoesNotSupportSecureCoding:[AWSLambdaInvocationResponse class]];
}

- (void) test_AWSLambdaInvokeAsyncRequest {
    [self validateSecureCodingForClass:[AWSLambdaInvokeAsyncRequest class]];
}

- (void) test_AWSLambdaInvokeAsyncResponse {
    [self validateSecureCodingForClass:[AWSLambdaInvokeAsyncResponse class]];
}

- (void) test_AWSLambdaLayer {
    [self validateSecureCodingForClass:[AWSLambdaLayer class]];
}

- (void) test_AWSLambdaLayerVersionContentInput {
    [self validateSecureCodingForClass:[AWSLambdaLayerVersionContentInput class]];
}

- (void) test_AWSLambdaLayerVersionContentOutput {
    [self validateSecureCodingForClass:[AWSLambdaLayerVersionContentOutput class]];
}

- (void) test_AWSLambdaLayerVersionsListItem {
    [self validateSecureCodingForClass:[AWSLambdaLayerVersionsListItem class]];
}

- (void) test_AWSLambdaLayersListItem {
    [self validateSecureCodingForClass:[AWSLambdaLayersListItem class]];
}

- (void) test_AWSLambdaListAliasesRequest {
    [self validateSecureCodingForClass:[AWSLambdaListAliasesRequest class]];
}

- (void) test_AWSLambdaListAliasesResponse {
    [self validateSecureCodingForClass:[AWSLambdaListAliasesResponse class]];
}

- (void) test_AWSLambdaListCodeSigningConfigsRequest {
    [self validateSecureCodingForClass:[AWSLambdaListCodeSigningConfigsRequest class]];
}

- (void) test_AWSLambdaListCodeSigningConfigsResponse {
    [self validateSecureCodingForClass:[AWSLambdaListCodeSigningConfigsResponse class]];
}

- (void) test_AWSLambdaListEventSourceMappingsRequest {
    [self validateSecureCodingForClass:[AWSLambdaListEventSourceMappingsRequest class]];
}

- (void) test_AWSLambdaListEventSourceMappingsResponse {
    [self validateSecureCodingForClass:[AWSLambdaListEventSourceMappingsResponse class]];
}

- (void) test_AWSLambdaListFunctionEventInvokeConfigsRequest {
    [self validateSecureCodingForClass:[AWSLambdaListFunctionEventInvokeConfigsRequest class]];
}

- (void) test_AWSLambdaListFunctionEventInvokeConfigsResponse {
    [self validateSecureCodingForClass:[AWSLambdaListFunctionEventInvokeConfigsResponse class]];
}

- (void) test_AWSLambdaListFunctionUrlConfigsRequest {
    [self validateSecureCodingForClass:[AWSLambdaListFunctionUrlConfigsRequest class]];
}

- (void) test_AWSLambdaListFunctionUrlConfigsResponse {
    [self validateSecureCodingForClass:[AWSLambdaListFunctionUrlConfigsResponse class]];
}

- (void) test_AWSLambdaListFunctionsByCodeSigningConfigRequest {
    [self validateSecureCodingForClass:[AWSLambdaListFunctionsByCodeSigningConfigRequest class]];
}

- (void) test_AWSLambdaListFunctionsByCodeSigningConfigResponse {
    [self validateSecureCodingForClass:[AWSLambdaListFunctionsByCodeSigningConfigResponse class]];
}

- (void) test_AWSLambdaListFunctionsRequest {
    [self validateSecureCodingForClass:[AWSLambdaListFunctionsRequest class]];
}

- (void) test_AWSLambdaListFunctionsResponse {
    [self validateSecureCodingForClass:[AWSLambdaListFunctionsResponse class]];
}

- (void) test_AWSLambdaListLayerVersionsRequest {
    [self validateSecureCodingForClass:[AWSLambdaListLayerVersionsRequest class]];
}

- (void) test_AWSLambdaListLayerVersionsResponse {
    [self validateSecureCodingForClass:[AWSLambdaListLayerVersionsResponse class]];
}

- (void) test_AWSLambdaListLayersRequest {
    [self validateSecureCodingForClass:[AWSLambdaListLayersRequest class]];
}

- (void) test_AWSLambdaListLayersResponse {
    [self validateSecureCodingForClass:[AWSLambdaListLayersResponse class]];
}

- (void) test_AWSLambdaListProvisionedConcurrencyConfigsRequest {
    [self validateSecureCodingForClass:[AWSLambdaListProvisionedConcurrencyConfigsRequest class]];
}

- (void) test_AWSLambdaListProvisionedConcurrencyConfigsResponse {
    [self validateSecureCodingForClass:[AWSLambdaListProvisionedConcurrencyConfigsResponse class]];
}

- (void) test_AWSLambdaListTagsRequest {
    [self validateSecureCodingForClass:[AWSLambdaListTagsRequest class]];
}

- (void) test_AWSLambdaListTagsResponse {
    [self validateSecureCodingForClass:[AWSLambdaListTagsResponse class]];
}

- (void) test_AWSLambdaListVersionsByFunctionRequest {
    [self validateSecureCodingForClass:[AWSLambdaListVersionsByFunctionRequest class]];
}

- (void) test_AWSLambdaListVersionsByFunctionResponse {
    [self validateSecureCodingForClass:[AWSLambdaListVersionsByFunctionResponse class]];
}

- (void) test_AWSLambdaOnFailure {
    [self validateSecureCodingForClass:[AWSLambdaOnFailure class]];
}

- (void) test_AWSLambdaOnSuccess {
    [self validateSecureCodingForClass:[AWSLambdaOnSuccess class]];
}

- (void) test_AWSLambdaProvisionedConcurrencyConfigListItem {
    [self validateSecureCodingForClass:[AWSLambdaProvisionedConcurrencyConfigListItem class]];
}

- (void) test_AWSLambdaPublishLayerVersionRequest {
    [self validateSecureCodingForClass:[AWSLambdaPublishLayerVersionRequest class]];
}

- (void) test_AWSLambdaPublishLayerVersionResponse {
    [self validateSecureCodingForClass:[AWSLambdaPublishLayerVersionResponse class]];
}

- (void) test_AWSLambdaPublishVersionRequest {
    [self validateSecureCodingForClass:[AWSLambdaPublishVersionRequest class]];
}

- (void) test_AWSLambdaPutFunctionCodeSigningConfigRequest {
    [self validateSecureCodingForClass:[AWSLambdaPutFunctionCodeSigningConfigRequest class]];
}

- (void) test_AWSLambdaPutFunctionCodeSigningConfigResponse {
    [self validateSecureCodingForClass:[AWSLambdaPutFunctionCodeSigningConfigResponse class]];
}

- (void) test_AWSLambdaPutFunctionConcurrencyRequest {
    [self validateSecureCodingForClass:[AWSLambdaPutFunctionConcurrencyRequest class]];
}

- (void) test_AWSLambdaPutFunctionEventInvokeConfigRequest {
    [self validateSecureCodingForClass:[AWSLambdaPutFunctionEventInvokeConfigRequest class]];
}

- (void) test_AWSLambdaPutProvisionedConcurrencyConfigRequest {
    [self validateSecureCodingForClass:[AWSLambdaPutProvisionedConcurrencyConfigRequest class]];
}

- (void) test_AWSLambdaPutProvisionedConcurrencyConfigResponse {
    [self validateSecureCodingForClass:[AWSLambdaPutProvisionedConcurrencyConfigResponse class]];
}

- (void) test_AWSLambdaPutRuntimeManagementConfigRequest {
    [self validateSecureCodingForClass:[AWSLambdaPutRuntimeManagementConfigRequest class]];
}

- (void) test_AWSLambdaPutRuntimeManagementConfigResponse {
    [self validateSecureCodingForClass:[AWSLambdaPutRuntimeManagementConfigResponse class]];
}

- (void) test_AWSLambdaRemoveLayerVersionPermissionRequest {
    [self validateSecureCodingForClass:[AWSLambdaRemoveLayerVersionPermissionRequest class]];
}

- (void) test_AWSLambdaRemovePermissionRequest {
    [self validateSecureCodingForClass:[AWSLambdaRemovePermissionRequest class]];
}

- (void) test_AWSLambdaRuntimeVersionConfig {
    [self validateSecureCodingForClass:[AWSLambdaRuntimeVersionConfig class]];
}

- (void) test_AWSLambdaRuntimeVersionError {
    [self validateSecureCodingForClass:[AWSLambdaRuntimeVersionError class]];
}

- (void) test_AWSLambdaScalingConfig {
    [self validateSecureCodingForClass:[AWSLambdaScalingConfig class]];
}

- (void) test_AWSLambdaSelfManagedEventSource {
    [self validateSecureCodingForClass:[AWSLambdaSelfManagedEventSource class]];
}

- (void) test_AWSLambdaSelfManagedKafkaEventSourceConfig {
    [self validateSecureCodingForClass:[AWSLambdaSelfManagedKafkaEventSourceConfig class]];
}

- (void) test_AWSLambdaSnapStart {
    [self validateSecureCodingForClass:[AWSLambdaSnapStart class]];
}

- (void) test_AWSLambdaSnapStartResponse {
    [self validateSecureCodingForClass:[AWSLambdaSnapStartResponse class]];
}

- (void) test_AWSLambdaSourceAccessConfiguration {
    [self validateSecureCodingForClass:[AWSLambdaSourceAccessConfiguration class]];
}

- (void) test_AWSLambdaTagResourceRequest {
    [self validateSecureCodingForClass:[AWSLambdaTagResourceRequest class]];
}

- (void) test_AWSLambdaTracingConfig {
    [self validateSecureCodingForClass:[AWSLambdaTracingConfig class]];
}

- (void) test_AWSLambdaTracingConfigResponse {
    [self validateSecureCodingForClass:[AWSLambdaTracingConfigResponse class]];
}

- (void) test_AWSLambdaUntagResourceRequest {
    [self validateSecureCodingForClass:[AWSLambdaUntagResourceRequest class]];
}

- (void) test_AWSLambdaUpdateAliasRequest {
    [self validateSecureCodingForClass:[AWSLambdaUpdateAliasRequest class]];
}

- (void) test_AWSLambdaUpdateCodeSigningConfigRequest {
    [self validateSecureCodingForClass:[AWSLambdaUpdateCodeSigningConfigRequest class]];
}

- (void) test_AWSLambdaUpdateCodeSigningConfigResponse {
    [self validateSecureCodingForClass:[AWSLambdaUpdateCodeSigningConfigResponse class]];
}

- (void) test_AWSLambdaUpdateEventSourceMappingRequest {
    [self validateSecureCodingForClass:[AWSLambdaUpdateEventSourceMappingRequest class]];
}

- (void) test_AWSLambdaUpdateFunctionCodeRequest {
    [self validateSecureCodingForClass:[AWSLambdaUpdateFunctionCodeRequest class]];
}

- (void) test_AWSLambdaUpdateFunctionConfigurationRequest {
    [self validateSecureCodingForClass:[AWSLambdaUpdateFunctionConfigurationRequest class]];
}

- (void) test_AWSLambdaUpdateFunctionEventInvokeConfigRequest {
    [self validateSecureCodingForClass:[AWSLambdaUpdateFunctionEventInvokeConfigRequest class]];
}

- (void) test_AWSLambdaUpdateFunctionUrlConfigRequest {
    [self validateSecureCodingForClass:[AWSLambdaUpdateFunctionUrlConfigRequest class]];
}

- (void) test_AWSLambdaUpdateFunctionUrlConfigResponse {
    [self validateSecureCodingForClass:[AWSLambdaUpdateFunctionUrlConfigResponse class]];
}

- (void) test_AWSLambdaVpcConfig {
    [self validateSecureCodingForClass:[AWSLambdaVpcConfig class]];
}

- (void) test_AWSLambdaVpcConfigResponse {
    [self validateSecureCodingForClass:[AWSLambdaVpcConfigResponse class]];
}

@end

