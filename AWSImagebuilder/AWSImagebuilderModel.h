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

FOUNDATION_EXPORT NSString *const AWSImagebuilderErrorDomain;

typedef NS_ENUM(NSInteger, AWSImagebuilderErrorType) {
    AWSImagebuilderErrorUnknown,
    AWSImagebuilderErrorCallRateLimitExceeded,
    AWSImagebuilderErrorClient,
    AWSImagebuilderErrorForbidden,
    AWSImagebuilderErrorIdempotentParameterMismatch,
    AWSImagebuilderErrorInvalidPaginationToken,
    AWSImagebuilderErrorInvalidParameterCombination,
    AWSImagebuilderErrorInvalidParameter,
    AWSImagebuilderErrorInvalidParameterValue,
    AWSImagebuilderErrorInvalidRequest,
    AWSImagebuilderErrorInvalidVersionNumber,
    AWSImagebuilderErrorResourceAlreadyExists,
    AWSImagebuilderErrorResourceDependency,
    AWSImagebuilderErrorResourceInUse,
    AWSImagebuilderErrorResourceNotFound,
    AWSImagebuilderErrorService,
    AWSImagebuilderErrorServiceUnavailable,
};

typedef NS_ENUM(NSInteger, AWSImagebuilderComponentFormat) {
    AWSImagebuilderComponentFormatUnknown,
    AWSImagebuilderComponentFormatShell,
};

typedef NS_ENUM(NSInteger, AWSImagebuilderComponentType) {
    AWSImagebuilderComponentTypeUnknown,
    AWSImagebuilderComponentTypeBuild,
    AWSImagebuilderComponentTypeTest,
};

typedef NS_ENUM(NSInteger, AWSImagebuilderEbsVolumeType) {
    AWSImagebuilderEbsVolumeTypeUnknown,
    AWSImagebuilderEbsVolumeTypeStandard,
    AWSImagebuilderEbsVolumeTypeIO1,
    AWSImagebuilderEbsVolumeTypeGp2,
    AWSImagebuilderEbsVolumeTypeSc1,
    AWSImagebuilderEbsVolumeTypeSt1,
};

typedef NS_ENUM(NSInteger, AWSImagebuilderImageStatus) {
    AWSImagebuilderImageStatusUnknown,
    AWSImagebuilderImageStatusPending,
    AWSImagebuilderImageStatusCreating,
    AWSImagebuilderImageStatusBuilding,
    AWSImagebuilderImageStatusTesting,
    AWSImagebuilderImageStatusDistributing,
    AWSImagebuilderImageStatusIntegrating,
    AWSImagebuilderImageStatusAvailable,
    AWSImagebuilderImageStatusCancelled,
    AWSImagebuilderImageStatusFailed,
    AWSImagebuilderImageStatusDeprecated,
    AWSImagebuilderImageStatusDeleted,
};

typedef NS_ENUM(NSInteger, AWSImagebuilderOwnership) {
    AWSImagebuilderOwnershipUnknown,
    AWSImagebuilderOwnershipSelf,
    AWSImagebuilderOwnershipShared,
    AWSImagebuilderOwnershipAmazon,
};

typedef NS_ENUM(NSInteger, AWSImagebuilderPipelineExecutionStartCondition) {
    AWSImagebuilderPipelineExecutionStartConditionUnknown,
    AWSImagebuilderPipelineExecutionStartConditionExpressionMatchOnly,
    AWSImagebuilderPipelineExecutionStartConditionExpressionMatchAndDependencyUpdatesAvailable,
};

typedef NS_ENUM(NSInteger, AWSImagebuilderPipelineStatus) {
    AWSImagebuilderPipelineStatusUnknown,
    AWSImagebuilderPipelineStatusDisabled,
    AWSImagebuilderPipelineStatusEnabled,
};

typedef NS_ENUM(NSInteger, AWSImagebuilderPlatform) {
    AWSImagebuilderPlatformUnknown,
    AWSImagebuilderPlatformWindows,
    AWSImagebuilderPlatformLinux,
};

@class AWSImagebuilderAmi;
@class AWSImagebuilderAmiDistributionConfiguration;
@class AWSImagebuilderCancelImageCreationRequest;
@class AWSImagebuilderCancelImageCreationResponse;
@class AWSImagebuilderComponent;
@class AWSImagebuilderComponentConfiguration;
@class AWSImagebuilderComponentSummary;
@class AWSImagebuilderComponentVersion;
@class AWSImagebuilderCreateComponentRequest;
@class AWSImagebuilderCreateComponentResponse;
@class AWSImagebuilderCreateDistributionConfigurationRequest;
@class AWSImagebuilderCreateDistributionConfigurationResponse;
@class AWSImagebuilderCreateImagePipelineRequest;
@class AWSImagebuilderCreateImagePipelineResponse;
@class AWSImagebuilderCreateImageRecipeRequest;
@class AWSImagebuilderCreateImageRecipeResponse;
@class AWSImagebuilderCreateImageRequest;
@class AWSImagebuilderCreateImageResponse;
@class AWSImagebuilderCreateInfrastructureConfigurationRequest;
@class AWSImagebuilderCreateInfrastructureConfigurationResponse;
@class AWSImagebuilderDeleteComponentRequest;
@class AWSImagebuilderDeleteComponentResponse;
@class AWSImagebuilderDeleteDistributionConfigurationRequest;
@class AWSImagebuilderDeleteDistributionConfigurationResponse;
@class AWSImagebuilderDeleteImagePipelineRequest;
@class AWSImagebuilderDeleteImagePipelineResponse;
@class AWSImagebuilderDeleteImageRecipeRequest;
@class AWSImagebuilderDeleteImageRecipeResponse;
@class AWSImagebuilderDeleteImageRequest;
@class AWSImagebuilderDeleteImageResponse;
@class AWSImagebuilderDeleteInfrastructureConfigurationRequest;
@class AWSImagebuilderDeleteInfrastructureConfigurationResponse;
@class AWSImagebuilderDistribution;
@class AWSImagebuilderDistributionConfiguration;
@class AWSImagebuilderDistributionConfigurationSummary;
@class AWSImagebuilderEbsInstanceBlockDeviceSpecification;
@class AWSImagebuilderFilter;
@class AWSImagebuilderGetComponentPolicyRequest;
@class AWSImagebuilderGetComponentPolicyResponse;
@class AWSImagebuilderGetComponentRequest;
@class AWSImagebuilderGetComponentResponse;
@class AWSImagebuilderGetDistributionConfigurationRequest;
@class AWSImagebuilderGetDistributionConfigurationResponse;
@class AWSImagebuilderGetImagePipelineRequest;
@class AWSImagebuilderGetImagePipelineResponse;
@class AWSImagebuilderGetImagePolicyRequest;
@class AWSImagebuilderGetImagePolicyResponse;
@class AWSImagebuilderGetImageRecipePolicyRequest;
@class AWSImagebuilderGetImageRecipePolicyResponse;
@class AWSImagebuilderGetImageRecipeRequest;
@class AWSImagebuilderGetImageRecipeResponse;
@class AWSImagebuilderGetImageRequest;
@class AWSImagebuilderGetImageResponse;
@class AWSImagebuilderGetInfrastructureConfigurationRequest;
@class AWSImagebuilderGetInfrastructureConfigurationResponse;
@class AWSImagebuilderImage;
@class AWSImagebuilderImagePipeline;
@class AWSImagebuilderImageRecipe;
@class AWSImagebuilderImageRecipeSummary;
@class AWSImagebuilderImageState;
@class AWSImagebuilderImageSummary;
@class AWSImagebuilderImageTestsConfiguration;
@class AWSImagebuilderImageVersion;
@class AWSImagebuilderImportComponentRequest;
@class AWSImagebuilderImportComponentResponse;
@class AWSImagebuilderInfrastructureConfiguration;
@class AWSImagebuilderInfrastructureConfigurationSummary;
@class AWSImagebuilderInstanceBlockDeviceMapping;
@class AWSImagebuilderLaunchPermissionConfiguration;
@class AWSImagebuilderListComponentBuildVersionsRequest;
@class AWSImagebuilderListComponentBuildVersionsResponse;
@class AWSImagebuilderListComponentsRequest;
@class AWSImagebuilderListComponentsResponse;
@class AWSImagebuilderListDistributionConfigurationsRequest;
@class AWSImagebuilderListDistributionConfigurationsResponse;
@class AWSImagebuilderListImageBuildVersionsRequest;
@class AWSImagebuilderListImageBuildVersionsResponse;
@class AWSImagebuilderListImagePipelineImagesRequest;
@class AWSImagebuilderListImagePipelineImagesResponse;
@class AWSImagebuilderListImagePipelinesRequest;
@class AWSImagebuilderListImagePipelinesResponse;
@class AWSImagebuilderListImageRecipesRequest;
@class AWSImagebuilderListImageRecipesResponse;
@class AWSImagebuilderListImagesRequest;
@class AWSImagebuilderListImagesResponse;
@class AWSImagebuilderListInfrastructureConfigurationsRequest;
@class AWSImagebuilderListInfrastructureConfigurationsResponse;
@class AWSImagebuilderListTagsForResourceRequest;
@class AWSImagebuilderListTagsForResourceResponse;
@class AWSImagebuilderLogging;
@class AWSImagebuilderOutputResources;
@class AWSImagebuilderPutComponentPolicyRequest;
@class AWSImagebuilderPutComponentPolicyResponse;
@class AWSImagebuilderPutImagePolicyRequest;
@class AWSImagebuilderPutImagePolicyResponse;
@class AWSImagebuilderPutImageRecipePolicyRequest;
@class AWSImagebuilderPutImageRecipePolicyResponse;
@class AWSImagebuilderS3Logs;
@class AWSImagebuilderSchedule;
@class AWSImagebuilderStartImagePipelineExecutionRequest;
@class AWSImagebuilderStartImagePipelineExecutionResponse;
@class AWSImagebuilderTagResourceRequest;
@class AWSImagebuilderTagResourceResponse;
@class AWSImagebuilderUntagResourceRequest;
@class AWSImagebuilderUntagResourceResponse;
@class AWSImagebuilderUpdateDistributionConfigurationRequest;
@class AWSImagebuilderUpdateDistributionConfigurationResponse;
@class AWSImagebuilderUpdateImagePipelineRequest;
@class AWSImagebuilderUpdateImagePipelineResponse;
@class AWSImagebuilderUpdateInfrastructureConfigurationRequest;
@class AWSImagebuilderUpdateInfrastructureConfigurationResponse;

/**
 <p> Details of an EC2 AMI. </p>
 */
@interface AWSImagebuilderAmi : AWSModel


/**
 <p>The description of the EC2 AMI. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The AMI ID of the EC2 AMI. </p>
 */
@property (nonatomic, strong) NSString * _Nullable image;

/**
 <p>The name of the EC2 AMI. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The AWS Region of the EC2 AMI. </p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p> Image state shows the image status and the reason for that status. </p>
 */
@property (nonatomic, strong) AWSImagebuilderImageState * _Nullable state;

@end

/**
 <p> Define and configure the output AMIs of the pipeline. </p>
 */
@interface AWSImagebuilderAmiDistributionConfiguration : AWSModel


/**
 <p>The tags to apply to AMIs distributed to this Region. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable amiTags;

/**
 <p>The description of the distribution configuration. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p> Launch permissions can be used to configure which AWS accounts can use the AMI to launch instances. </p>
 */
@property (nonatomic, strong) AWSImagebuilderLaunchPermissionConfiguration * _Nullable launchPermission;

/**
 <p>The name of the distribution configuration. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSImagebuilderCancelImageCreationRequest : AWSRequest


/**
 <p>The idempotency token used to make this request idempotent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The Amazon Resource Name (ARN) of the image whose creation you want to cancel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageBuildVersionArn;

@end

/**
 
 */
@interface AWSImagebuilderCancelImageCreationResponse : AWSModel


/**
 <p>The idempotency token used to make this request idempotent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The Amazon Resource Name (ARN) of the image whose creation has been cancelled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageBuildVersionArn;

/**
 <p>The request ID that uniquely identifies this request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 <p>A detailed view of a component.</p>
 */
@interface AWSImagebuilderComponent : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The change description of the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeDescription;

/**
 <p>The data of the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable data;

/**
 <p>The date that the component was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dateCreated;

/**
 <p>The description of the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The encryption status of the component.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable encrypted;

/**
 <p>The KMS key identifier used to encrypt the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The name of the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The owner of the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p>The platform of the component.</p>
 */
@property (nonatomic, assign) AWSImagebuilderPlatform platform;

/**
 <p>The operating system (OS) version supported by the component. If the OS information is available, a prefix match is performed against the parent image OS version during image recipe creation. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedOsVersions;

/**
 <p>The tags associated with the component.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The type of the component denotes whether the component is used to build the image or only to test it.</p>
 */
@property (nonatomic, assign) AWSImagebuilderComponentType types;

/**
 <p>The version of the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p> Configuration details of the component. </p>
 Required parameters: [componentArn]
 */
@interface AWSImagebuilderComponentConfiguration : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the component. </p>
 */
@property (nonatomic, strong) NSString * _Nullable componentArn;

@end

/**
 <p>A high-level summary of a component.</p>
 */
@interface AWSImagebuilderComponentSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The change description of the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeDescription;

/**
 <p>The date that the component was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dateCreated;

/**
 <p>The description of the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The owner of the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p>The platform of the component.</p>
 */
@property (nonatomic, assign) AWSImagebuilderPlatform platform;

/**
 <p>The operating system (OS) version supported by the component. If the OS information is available, a prefix match is performed against the parent image OS version during image recipe creation. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedOsVersions;

/**
 <p>The tags associated with the component.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The type of the component denotes whether the component is used to build the image or only to test it.</p>
 */
@property (nonatomic, assign) AWSImagebuilderComponentType types;

/**
 <p>The version of the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>A high-level overview of a component semantic version.</p>
 */
@interface AWSImagebuilderComponentVersion : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date that the component was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dateCreated;

/**
 <p>The description of the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The owner of the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p>The platform of the component.</p>
 */
@property (nonatomic, assign) AWSImagebuilderPlatform platform;

/**
 <p> The operating system (OS) version supported by the component. If the OS information is available, a prefix match is performed against the parent image OS version during image recipe creation. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedOsVersions;

/**
 <p>The type of the component denotes whether the component is used to build the image or only to test it.</p>
 */
@property (nonatomic, assign) AWSImagebuilderComponentType types;

/**
 <p>The semantic version of the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSImagebuilderCreateComponentRequest : AWSRequest


/**
 <p>The change description of the component. Describes what change has been made in this version, or what makes this version different from other versions of this component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeDescription;

/**
 <p>The idempotency token of the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The data of the component. Used to specify the data inline. Either <code>data</code> or <code>uri</code> can be used to specify the data within the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable data;

/**
 <p>The description of the component. Describes the contents of the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID of the KMS key that should be used to encrypt this component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The name of the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The platform of the component.</p>
 */
@property (nonatomic, assign) AWSImagebuilderPlatform platform;

/**
 <p>The semantic version of the component. This version follows the semantic version syntax. For example, major.minor.patch. This could be versioned like software (2.0.1) or like a date (2019.12.01).</p>
 */
@property (nonatomic, strong) NSString * _Nullable semanticVersion;

/**
 <p> The operating system (OS) version supported by the component. If the OS information is available, a prefix match is performed against the parent image OS version during image recipe creation. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedOsVersions;

/**
 <p>The tags of the component.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The uri of the component. Must be an S3 URL and the requester must have permission to access the S3 bucket. If you use S3, you can specify component content up to your service quota. Either <code>data</code> or <code>uri</code> can be used to specify the data within the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uri;

@end

/**
 
 */
@interface AWSImagebuilderCreateComponentResponse : AWSModel


/**
 <p>The idempotency token used to make this request idempotent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The Amazon Resource Name (ARN) of the component that was created by this request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable componentBuildVersionArn;

/**
 <p>The request ID that uniquely identifies this request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderCreateDistributionConfigurationRequest : AWSRequest


/**
 <p> The idempotency token of the distribution configuration. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p> The description of the distribution configuration. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p> The distributions of the distribution configuration. </p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderDistribution *> * _Nullable distributions;

/**
 <p> The name of the distribution configuration. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> The tags of the distribution configuration. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSImagebuilderCreateDistributionConfigurationResponse : AWSModel


/**
 <p> The idempotency token used to make this request idempotent. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p> The Amazon Resource Name (ARN) of the distribution configuration that was created by this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable distributionConfigurationArn;

/**
 <p> The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderCreateImagePipelineRequest : AWSRequest


/**
 <p> The idempotency token used to make this request idempotent. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p> The description of the image pipeline. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p> The Amazon Resource Name (ARN) of the distribution configuration that will be used to configure and distribute images created by this image pipeline. </p>
 */
@property (nonatomic, strong) NSString * _Nullable distributionConfigurationArn;

/**
 <p> Collects additional information about the image being created, including the operating system (OS) version and package list. This information is used to enhance the overall experience of using EC2 Image Builder. Enabled by default. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enhancedImageMetadataEnabled;

/**
 <p> The Amazon Resource Name (ARN) of the image recipe that will be used to configure images created by this image pipeline. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imageRecipeArn;

/**
 <p> The image test configuration of the image pipeline. </p>
 */
@property (nonatomic, strong) AWSImagebuilderImageTestsConfiguration * _Nullable imageTestsConfiguration;

/**
 <p> The Amazon Resource Name (ARN) of the infrastructure configuration that will be used to build images created by this image pipeline. </p>
 */
@property (nonatomic, strong) NSString * _Nullable infrastructureConfigurationArn;

/**
 <p> The name of the image pipeline. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> The schedule of the image pipeline. </p>
 */
@property (nonatomic, strong) AWSImagebuilderSchedule * _Nullable schedule;

/**
 <p> The status of the image pipeline. </p>
 */
@property (nonatomic, assign) AWSImagebuilderPipelineStatus status;

/**
 <p> The tags of the image pipeline. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSImagebuilderCreateImagePipelineResponse : AWSModel


/**
 <p> The idempotency token used to make this request idempotent. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p> The Amazon Resource Name (ARN) of the image pipeline that was created by this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imagePipelineArn;

/**
 <p> The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderCreateImageRecipeRequest : AWSRequest


/**
 <p>The block device mappings of the image recipe. </p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderInstanceBlockDeviceMapping *> * _Nullable blockDeviceMappings;

/**
 <p>The idempotency token used to make this request idempotent. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The components of the image recipe. </p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderComponentConfiguration *> * _Nullable components;

/**
 <p> The description of the image recipe. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p> The name of the image recipe. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The parent image of the image recipe. The value of the string can be the ARN of the parent image or an AMI ID. The format for the ARN follows this example: <code>arn:aws:imagebuilder:us-west-2:aws:image/windows-server-2016-english-full-base-x86/2019.x.x</code>. The ARN ends with <code>/20xx.x.x</code>, which communicates to EC2 Image Builder that you want to use the latest AMI created in 20xx (year). You can provide the specific version that you want to use, or you can use a wildcard in all of the fields. If you enter an AMI ID for the string value, you must have access to the AMI, and the AMI must be in the same Region in which you are using Image Builder. </p>
 */
@property (nonatomic, strong) NSString * _Nullable parentImage;

/**
 <p>The semantic version of the image recipe. </p>
 */
@property (nonatomic, strong) NSString * _Nullable semanticVersion;

/**
 <p> The tags of the image recipe. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSImagebuilderCreateImageRecipeResponse : AWSModel


/**
 <p>The idempotency token used to make this request idempotent. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The Amazon Resource Name (ARN) of the image recipe that was created by this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imageRecipeArn;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderCreateImageRequest : AWSRequest


/**
 <p> The idempotency token used to make this request idempotent. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p> The Amazon Resource Name (ARN) of the distribution configuration that defines and configures the outputs of your pipeline. </p>
 */
@property (nonatomic, strong) NSString * _Nullable distributionConfigurationArn;

/**
 <p> Collects additional information about the image being created, including the operating system (OS) version and package list. This information is used to enhance the overall experience of using EC2 Image Builder. Enabled by default. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enhancedImageMetadataEnabled;

/**
 <p> The Amazon Resource Name (ARN) of the image recipe that defines how images are configured, tested, and assessed. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imageRecipeArn;

/**
 <p> The image tests configuration of the image. </p>
 */
@property (nonatomic, strong) AWSImagebuilderImageTestsConfiguration * _Nullable imageTestsConfiguration;

/**
 <p> The Amazon Resource Name (ARN) of the infrastructure configuration that defines the environment in which your image will be built and tested. </p>
 */
@property (nonatomic, strong) NSString * _Nullable infrastructureConfigurationArn;

/**
 <p> The tags of the image. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSImagebuilderCreateImageResponse : AWSModel


/**
 <p> The idempotency token used to make this request idempotent. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p> The Amazon Resource Name (ARN) of the image that was created by this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imageBuildVersionArn;

/**
 <p> The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderCreateInfrastructureConfigurationRequest : AWSRequest


/**
 <p>The idempotency token used to make this request idempotent. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The description of the infrastructure configuration. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The instance profile to associate with the instance used to customize your EC2 AMI. </p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceProfileName;

/**
 <p>The instance types of the infrastructure configuration. You can specify one or more instance types to use for this build. The service will pick one of these instance types based on availability. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceTypes;

/**
 <p>The key pair of the infrastructure configuration. This can be used to log on to and debug the instance used to create your image. </p>
 */
@property (nonatomic, strong) NSString * _Nullable keyPair;

/**
 <p>The logging configuration of the infrastructure configuration. </p>
 */
@property (nonatomic, strong) AWSImagebuilderLogging * _Nullable logging;

/**
 <p>The name of the infrastructure configuration. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The security group IDs to associate with the instance used to customize your EC2 AMI. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>The SNS topic on which to send image build events. </p>
 */
@property (nonatomic, strong) NSString * _Nullable snsTopicArn;

/**
 <p>The subnet ID in which to place the instance used to customize your EC2 AMI. </p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

/**
 <p>The tags of the infrastructure configuration. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The terminate instance on failure setting of the infrastructure configuration. Set to false if you want Image Builder to retain the instance used to configure your AMI if the build or test phase of your workflow fails. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable terminateInstanceOnFailure;

@end

/**
 
 */
@interface AWSImagebuilderCreateInfrastructureConfigurationResponse : AWSModel


/**
 <p>The idempotency token used to make this request idempotent. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The Amazon Resource Name (ARN) of the infrastructure configuration that was created by this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable infrastructureConfigurationArn;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderDeleteComponentRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the component build version to delete. </p>
 */
@property (nonatomic, strong) NSString * _Nullable componentBuildVersionArn;

@end

/**
 
 */
@interface AWSImagebuilderDeleteComponentResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the component build version that was deleted. </p>
 */
@property (nonatomic, strong) NSString * _Nullable componentBuildVersionArn;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderDeleteDistributionConfigurationRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the distribution configuration to delete. </p>
 */
@property (nonatomic, strong) NSString * _Nullable distributionConfigurationArn;

@end

/**
 
 */
@interface AWSImagebuilderDeleteDistributionConfigurationResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the distribution configuration that was deleted. </p>
 */
@property (nonatomic, strong) NSString * _Nullable distributionConfigurationArn;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderDeleteImagePipelineRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the image pipeline to delete. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imagePipelineArn;

@end

/**
 
 */
@interface AWSImagebuilderDeleteImagePipelineResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the image pipeline that was deleted. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imagePipelineArn;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderDeleteImageRecipeRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the image recipe to delete. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imageRecipeArn;

@end

/**
 
 */
@interface AWSImagebuilderDeleteImageRecipeResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the image recipe that was deleted. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imageRecipeArn;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderDeleteImageRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the image to delete. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imageBuildVersionArn;

@end

/**
 
 */
@interface AWSImagebuilderDeleteImageResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the image that was deleted. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imageBuildVersionArn;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderDeleteInfrastructureConfigurationRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the infrastructure configuration to delete. </p>
 */
@property (nonatomic, strong) NSString * _Nullable infrastructureConfigurationArn;

@end

/**
 
 */
@interface AWSImagebuilderDeleteInfrastructureConfigurationResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the infrastructure configuration that was deleted. </p>
 */
@property (nonatomic, strong) NSString * _Nullable infrastructureConfigurationArn;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 <p> Defines the settings for a specific Region. </p>
 Required parameters: [region]
 */
@interface AWSImagebuilderDistribution : AWSModel


/**
 <p>The specific AMI settings (for example, launch permissions, AMI tags). </p>
 */
@property (nonatomic, strong) AWSImagebuilderAmiDistributionConfiguration * _Nullable amiDistributionConfiguration;

/**
 <p>The License Manager Configuration to associate with the AMI in the specified Region.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable licenseConfigurationArns;

/**
 <p>The target Region. </p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

@end

/**
 <p>A distribution configuration.</p>
 Required parameters: [timeoutMinutes]
 */
@interface AWSImagebuilderDistributionConfiguration : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the distribution configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date on which this distribution configuration was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dateCreated;

/**
 <p>The date on which this distribution configuration was last updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dateUpdated;

/**
 <p>The description of the distribution configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The distributions of the distribution configuration.</p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderDistribution *> * _Nullable distributions;

/**
 <p>The name of the distribution configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The tags of the distribution configuration.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The maximum duration in minutes for this distribution configuration.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutMinutes;

@end

/**
 <p>A high-level overview of a distribution configuration.</p>
 */
@interface AWSImagebuilderDistributionConfigurationSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the distribution configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date on which the distribution configuration was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dateCreated;

/**
 <p>The date on which the distribution configuration was updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dateUpdated;

/**
 <p>The description of the distribution configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the distribution configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The tags associated with the distribution configuration.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Amazon EBS-specific block device mapping specifications.</p>
 */
@interface AWSImagebuilderEbsInstanceBlockDeviceSpecification : AWSModel


/**
 <p>Use to configure delete on termination of the associated device.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteOnTermination;

/**
 <p>Use to configure device encryption.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable encrypted;

/**
 <p>Use to configure device IOPS.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable iops;

/**
 <p>Use to configure the KMS key to use when encrypting the device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The snapshot that defines the device contents.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotId;

/**
 <p>Use to override the device's volume size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeSize;

/**
 <p>Use to override the device's volume type.</p>
 */
@property (nonatomic, assign) AWSImagebuilderEbsVolumeType volumeType;

@end

/**
 <p>A filter name and value pair that is used to return a more specific list of results from a list operation. Filters can be used to match a set of resources by specific criteria, such as tags, attributes, or IDs. </p>
 */
@interface AWSImagebuilderFilter : AWSModel


/**
 <p>The name of the filter. Filter names are case-sensitive. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The filter values. Filter values are case-sensitive. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 
 */
@interface AWSImagebuilderGetComponentPolicyRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the component whose policy you want to retrieve. </p>
 */
@property (nonatomic, strong) NSString * _Nullable componentArn;

@end

/**
 
 */
@interface AWSImagebuilderGetComponentPolicyResponse : AWSModel


/**
 <p>The component policy. </p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderGetComponentRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the component that you want to retrieve. Regex requires "/\d+$" suffix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable componentBuildVersionArn;

@end

/**
 
 */
@interface AWSImagebuilderGetComponentResponse : AWSModel


/**
 <p>The component object associated with the specified ARN. </p>
 */
@property (nonatomic, strong) AWSImagebuilderComponent * _Nullable component;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderGetDistributionConfigurationRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the distribution configuration that you want to retrieve. </p>
 */
@property (nonatomic, strong) NSString * _Nullable distributionConfigurationArn;

@end

/**
 
 */
@interface AWSImagebuilderGetDistributionConfigurationResponse : AWSModel


/**
 <p>The distribution configuration object. </p>
 */
@property (nonatomic, strong) AWSImagebuilderDistributionConfiguration * _Nullable distributionConfiguration;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderGetImagePipelineRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the image pipeline that you want to retrieve. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imagePipelineArn;

@end

/**
 
 */
@interface AWSImagebuilderGetImagePipelineResponse : AWSModel


/**
 <p>The image pipeline object. </p>
 */
@property (nonatomic, strong) AWSImagebuilderImagePipeline * _Nullable imagePipeline;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderGetImagePolicyRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the image whose policy you want to retrieve. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imageArn;

@end

/**
 
 */
@interface AWSImagebuilderGetImagePolicyResponse : AWSModel


/**
 <p>The image policy object. </p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderGetImageRecipePolicyRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the image recipe whose policy you want to retrieve. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imageRecipeArn;

@end

/**
 
 */
@interface AWSImagebuilderGetImageRecipePolicyResponse : AWSModel


/**
 <p>The image recipe policy object. </p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderGetImageRecipeRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the image recipe that you want to retrieve. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imageRecipeArn;

@end

/**
 
 */
@interface AWSImagebuilderGetImageRecipeResponse : AWSModel


/**
 <p>The image recipe object. </p>
 */
@property (nonatomic, strong) AWSImagebuilderImageRecipe * _Nullable imageRecipe;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderGetImageRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the image that you want to retrieve. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imageBuildVersionArn;

@end

/**
 
 */
@interface AWSImagebuilderGetImageResponse : AWSModel


/**
 <p>The image object. </p>
 */
@property (nonatomic, strong) AWSImagebuilderImage * _Nullable image;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 <p> GetInfrastructureConfiguration request object. </p>
 Required parameters: [infrastructureConfigurationArn]
 */
@interface AWSImagebuilderGetInfrastructureConfigurationRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the infrastructure configuration that you want to retrieve. </p>
 */
@property (nonatomic, strong) NSString * _Nullable infrastructureConfigurationArn;

@end

/**
 <p>GetInfrastructureConfiguration response object. </p>
 */
@interface AWSImagebuilderGetInfrastructureConfigurationResponse : AWSModel


/**
 <p>The infrastructure configuration object. </p>
 */
@property (nonatomic, strong) AWSImagebuilderInfrastructureConfiguration * _Nullable infrastructureConfiguration;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 <p>An image build version.</p>
 */
@interface AWSImagebuilderImage : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date on which this image was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dateCreated;

/**
 <p>The distribution configuration used when creating this image.</p>
 */
@property (nonatomic, strong) AWSImagebuilderDistributionConfiguration * _Nullable distributionConfiguration;

/**
 <p> Collects additional information about the image being created, including the operating system (OS) version and package list. This information is used to enhance the overall experience of using EC2 Image Builder. Enabled by default. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enhancedImageMetadataEnabled;

/**
 <p>The image recipe used when creating the image.</p>
 */
@property (nonatomic, strong) AWSImagebuilderImageRecipe * _Nullable imageRecipe;

/**
 <p>The image tests configuration used when creating this image.</p>
 */
@property (nonatomic, strong) AWSImagebuilderImageTestsConfiguration * _Nullable imageTestsConfiguration;

/**
 <p>The infrastructure used when creating this image.</p>
 */
@property (nonatomic, strong) AWSImagebuilderInfrastructureConfiguration * _Nullable infrastructureConfiguration;

/**
 <p>The name of the image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The operating system version of the instance. For example, Amazon Linux 2, Ubuntu 18, or Microsoft Windows Server 2019. </p>
 */
@property (nonatomic, strong) NSString * _Nullable osVersion;

/**
 <p>The output resources produced when creating this image.</p>
 */
@property (nonatomic, strong) AWSImagebuilderOutputResources * _Nullable outputResources;

/**
 <p>The platform of the image.</p>
 */
@property (nonatomic, assign) AWSImagebuilderPlatform platform;

/**
 <p>The Amazon Resource Name (ARN) of the image pipeline that created this image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourcePipelineArn;

/**
 <p>The name of the image pipeline that created this image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourcePipelineName;

/**
 <p>The state of the image.</p>
 */
@property (nonatomic, strong) AWSImagebuilderImageState * _Nullable state;

/**
 <p>The tags of the image.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The semantic version of the image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>Details of an image pipeline.</p>
 */
@interface AWSImagebuilderImagePipeline : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the image pipeline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date on which this image pipeline was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dateCreated;

/**
 <p>The date on which this image pipeline was last run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dateLastRun;

/**
 <p>The date on which this image pipeline will next be run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dateNextRun;

/**
 <p>The date on which this image pipeline was last updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dateUpdated;

/**
 <p>The description of the image pipeline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The Amazon Resource Name (ARN) of the distribution configuration associated with this image pipeline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable distributionConfigurationArn;

/**
 <p> Collects additional information about the image being created, including the operating system (OS) version and package list. This information is used to enhance the overall experience of using EC2 Image Builder. Enabled by default. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enhancedImageMetadataEnabled;

/**
 <p>The Amazon Resource Name (ARN) of the image recipe associated with this image pipeline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageRecipeArn;

/**
 <p>The image tests configuration of the image pipeline.</p>
 */
@property (nonatomic, strong) AWSImagebuilderImageTestsConfiguration * _Nullable imageTestsConfiguration;

/**
 <p>The Amazon Resource Name (ARN) of the infrastructure configuration associated with this image pipeline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable infrastructureConfigurationArn;

/**
 <p>The name of the image pipeline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The platform of the image pipeline.</p>
 */
@property (nonatomic, assign) AWSImagebuilderPlatform platform;

/**
 <p>The schedule of the image pipeline.</p>
 */
@property (nonatomic, strong) AWSImagebuilderSchedule * _Nullable schedule;

/**
 <p>The status of the image pipeline.</p>
 */
@property (nonatomic, assign) AWSImagebuilderPipelineStatus status;

/**
 <p>The tags of this image pipeline.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>An image recipe.</p>
 */
@interface AWSImagebuilderImageRecipe : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the image recipe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The block device mappings to apply when creating images from this recipe.</p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderInstanceBlockDeviceMapping *> * _Nullable blockDeviceMappings;

/**
 <p>The components of the image recipe.</p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderComponentConfiguration *> * _Nullable components;

/**
 <p>The date on which this image recipe was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dateCreated;

/**
 <p>The description of the image recipe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the image recipe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The owner of the image recipe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p>The parent image of the image recipe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentImage;

/**
 <p>The platform of the image recipe.</p>
 */
@property (nonatomic, assign) AWSImagebuilderPlatform platform;

/**
 <p>The tags of the image recipe.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The version of the image recipe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>A summary of an image recipe.</p>
 */
@interface AWSImagebuilderImageRecipeSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the image recipe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date on which this image recipe was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dateCreated;

/**
 <p>The name of the image recipe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The owner of the image recipe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p>The parent image of the image recipe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentImage;

/**
 <p>The platform of the image recipe.</p>
 */
@property (nonatomic, assign) AWSImagebuilderPlatform platform;

/**
 <p>The tags of the image recipe.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p> Image state shows the image status and the reason for that status. </p>
 */
@interface AWSImagebuilderImageState : AWSModel


/**
 <p>The reason for the image's status. </p>
 */
@property (nonatomic, strong) NSString * _Nullable reason;

/**
 <p>The status of the image. </p>
 */
@property (nonatomic, assign) AWSImagebuilderImageStatus status;

@end

/**
 <p>An image summary.</p>
 */
@interface AWSImagebuilderImageSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date on which this image was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dateCreated;

/**
 <p>The name of the image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The operating system version of the instance. For example, Amazon Linux 2, Ubuntu 18, or Microsoft Windows Server 2019. </p>
 */
@property (nonatomic, strong) NSString * _Nullable osVersion;

/**
 <p>The output resources produced when creating this image.</p>
 */
@property (nonatomic, strong) AWSImagebuilderOutputResources * _Nullable outputResources;

/**
 <p>The owner of the image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p>The platform of the image.</p>
 */
@property (nonatomic, assign) AWSImagebuilderPlatform platform;

/**
 <p>The state of the image.</p>
 */
@property (nonatomic, strong) AWSImagebuilderImageState * _Nullable state;

/**
 <p>The tags of the image.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The version of the image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>Image tests configuration.</p>
 */
@interface AWSImagebuilderImageTestsConfiguration : AWSModel


/**
 <p>Defines if tests should be executed when building this image.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable imageTestsEnabled;

/**
 <p>The maximum time in minutes that tests are permitted to run.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutMinutes;

@end

/**
 <p>An image semantic version.</p>
 */
@interface AWSImagebuilderImageVersion : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the image semantic version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date at which this image semantic version was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dateCreated;

/**
 <p>The name of the image semantic version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> The operating system version of the instance. For example, Amazon Linux 2, Ubuntu 18, or Microsoft Windows Server 2019. </p>
 */
@property (nonatomic, strong) NSString * _Nullable osVersion;

/**
 <p>The owner of the image semantic version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p>The platform of the image semantic version.</p>
 */
@property (nonatomic, assign) AWSImagebuilderPlatform platform;

/**
 <p>The semantic version of the image semantic version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSImagebuilderImportComponentRequest : AWSRequest


/**
 <p>The change description of the component. Describes what change has been made in this version, or what makes this version different from other versions of this component. </p>
 */
@property (nonatomic, strong) NSString * _Nullable changeDescription;

/**
 <p>The idempotency token of the component. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The data of the component. Used to specify the data inline. Either <code>data</code> or <code>uri</code> can be used to specify the data within the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable data;

/**
 <p>The description of the component. Describes the contents of the component. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The format of the resource that you want to import as a component. </p>
 */
@property (nonatomic, assign) AWSImagebuilderComponentFormat format;

/**
 <p>The ID of the KMS key that should be used to encrypt this component. </p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p> The name of the component. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The platform of the component. </p>
 */
@property (nonatomic, assign) AWSImagebuilderPlatform platform;

/**
 <p>The semantic version of the component. This version follows the semantic version syntax. For example, major.minor.patch. This could be versioned like software (2.0.1) or like a date (2019.12.01).</p>
 */
@property (nonatomic, strong) NSString * _Nullable semanticVersion;

/**
 <p>The tags of the component. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The type of the component denotes whether the component is used to build the image or only to test it. </p>
 */
@property (nonatomic, assign) AWSImagebuilderComponentType types;

/**
 <p>The uri of the component. Must be an S3 URL and the requester must have permission to access the S3 bucket. If you use S3, you can specify component content up to your service quota. Either <code>data</code> or <code>uri</code> can be used to specify the data within the component. </p>
 */
@property (nonatomic, strong) NSString * _Nullable uri;

@end

/**
 
 */
@interface AWSImagebuilderImportComponentResponse : AWSModel


/**
 <p>The idempotency token used to make this request idempotent. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The Amazon Resource Name (ARN) of the imported component. </p>
 */
@property (nonatomic, strong) NSString * _Nullable componentBuildVersionArn;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 <p>Details of the infrastructure configuration.</p>
 */
@interface AWSImagebuilderInfrastructureConfiguration : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the infrastructure configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date on which the infrastructure configuration was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dateCreated;

/**
 <p>The date on which the infrastructure configuration was last updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dateUpdated;

/**
 <p>The description of the infrastructure configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The instance profile of the infrastructure configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceProfileName;

/**
 <p>The instance types of the infrastructure configuration.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceTypes;

/**
 <p>The EC2 key pair of the infrastructure configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyPair;

/**
 <p>The logging configuration of the infrastructure configuration.</p>
 */
@property (nonatomic, strong) AWSImagebuilderLogging * _Nullable logging;

/**
 <p>The name of the infrastructure configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The security group IDs of the infrastructure configuration.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>The SNS topic Amazon Resource Name (ARN) of the infrastructure configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snsTopicArn;

/**
 <p>The subnet ID of the infrastructure configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

/**
 <p>The tags of the infrastructure configuration.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The terminate instance on failure configuration of the infrastructure configuration.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable terminateInstanceOnFailure;

@end

/**
 <p>The infrastructure used when building EC2 AMIs.</p>
 */
@interface AWSImagebuilderInfrastructureConfigurationSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the infrastructure configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date on which the infrastructure configuration was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dateCreated;

/**
 <p>The date on which the infrastructure configuration was last updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dateUpdated;

/**
 <p>The description of the infrastructure configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the infrastructure configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The tags of the infrastructure configuration.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Defines block device mappings for the instance used to configure your image.</p>
 */
@interface AWSImagebuilderInstanceBlockDeviceMapping : AWSModel


/**
 <p>The device to which these mappings apply.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceName;

/**
 <p>Use to manage Amazon EBS-specific configuration for this mapping.</p>
 */
@property (nonatomic, strong) AWSImagebuilderEbsInstanceBlockDeviceSpecification * _Nullable ebs;

/**
 <p>Use to remove a mapping from the parent image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable noDevice;

/**
 <p>Use to manage instance ephemeral devices.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualName;

@end

/**
 <p>Describes the configuration for a launch permission. The launch permission modification request is sent to the <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_ModifyImageAttribute.html">EC2 ModifyImageAttribute</a> API on behalf of the user for each Region they have selected to distribute the AMI.</p>
 */
@interface AWSImagebuilderLaunchPermissionConfiguration : AWSModel


/**
 <p>The name of the group. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable userGroups;

/**
 <p>The AWS account ID. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable userIds;

@end

/**
 
 */
@interface AWSImagebuilderListComponentBuildVersionsRequest : AWSRequest


/**
 <p>The component version Amazon Resource Name (ARN) whose versions you want to list. </p>
 */
@property (nonatomic, strong) NSString * _Nullable componentVersionArn;

/**
 <p>The maximum items to return in a request. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to specify where to start paginating. This is the NextToken from a previously truncated response. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSImagebuilderListComponentBuildVersionsResponse : AWSModel


/**
 <p>The list of component summaries for the specified semantic version. </p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderComponentSummary *> * _Nullable componentSummaryList;

/**
 <p>The next token used for paginated responses. When this is not empty, there are additional elements that the service has not included in this request. Use this token with the next request to retrieve additional objects. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderListComponentsRequest : AWSRequest


/**
 <p>The filters. </p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderFilter *> * _Nullable filters;

/**
 <p>The maximum items to return in a request. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to specify where to start paginating. This is the NextToken from a previously truncated response. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The owner defines which components you want to list. By default, this request will only show components owned by your account. You can use this field to specify if you want to view components owned by yourself, by Amazon, or those components that have been shared with you by other customers. </p>
 */
@property (nonatomic, assign) AWSImagebuilderOwnership owner;

@end

/**
 
 */
@interface AWSImagebuilderListComponentsResponse : AWSModel


/**
 <p>The list of component semantic versions. </p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderComponentVersion *> * _Nullable componentVersionList;

/**
 <p>The next token used for paginated responses. When this is not empty, there are additional elements that the service has not included in this request. Use this token with the next request to retrieve additional objects. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderListDistributionConfigurationsRequest : AWSRequest


/**
 <p>The filters. </p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderFilter *> * _Nullable filters;

/**
 <p>The maximum items to return in a request. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to specify where to start paginating. This is the NextToken from a previously truncated response. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSImagebuilderListDistributionConfigurationsResponse : AWSModel


/**
 <p>The list of distributions. </p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderDistributionConfigurationSummary *> * _Nullable distributionConfigurationSummaryList;

/**
 <p>The next token used for paginated responses. When this is not empty, there are additional elements that the service has not included in this request. Use this token with the next request to retrieve additional objects. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderListImageBuildVersionsRequest : AWSRequest


/**
 <p>The filters. </p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderFilter *> * _Nullable filters;

/**
 <p>The Amazon Resource Name (ARN) of the image whose build versions you want to retrieve. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imageVersionArn;

/**
 <p>The maximum items to return in a request. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to specify where to start paginating. This is the NextToken from a previously truncated response. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSImagebuilderListImageBuildVersionsResponse : AWSModel


/**
 <p>The list of image build versions. </p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderImageSummary *> * _Nullable imageSummaryList;

/**
 <p>The next token used for paginated responses. When this is not empty, there are additional elements that the service has not included in this request. Use this token with the next request to retrieve additional objects. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderListImagePipelineImagesRequest : AWSRequest


/**
 <p>The filters. </p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderFilter *> * _Nullable filters;

/**
 <p>The Amazon Resource Name (ARN) of the image pipeline whose images you want to view. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imagePipelineArn;

/**
 <p>The maximum items to return in a request. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to specify where to start paginating. This is the NextToken from a previously truncated response. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSImagebuilderListImagePipelineImagesResponse : AWSModel


/**
 <p>The list of images built by this pipeline. </p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderImageSummary *> * _Nullable imageSummaryList;

/**
 <p>The next token used for paginated responses. When this is not empty, there are additional elements that the service has not included in this request. Use this token with the next request to retrieve additional objects. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderListImagePipelinesRequest : AWSRequest


/**
 <p>The filters. </p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderFilter *> * _Nullable filters;

/**
 <p>The maximum items to return in a request. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to specify where to start paginating. This is the NextToken from a previously truncated response. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSImagebuilderListImagePipelinesResponse : AWSModel


/**
 <p>The list of image pipelines. </p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderImagePipeline *> * _Nullable imagePipelineList;

/**
 <p>The next token used for paginated responses. When this is not empty, there are additional elements that the service has not included in this request. Use this token with the next request to retrieve additional objects. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderListImageRecipesRequest : AWSRequest


/**
 <p>The filters. </p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderFilter *> * _Nullable filters;

/**
 <p>The maximum items to return in a request. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to specify where to start paginating. This is the NextToken from a previously truncated response. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The owner defines which image recipes you want to list. By default, this request will only show image recipes owned by your account. You can use this field to specify if you want to view image recipes owned by yourself, by Amazon, or those image recipes that have been shared with you by other customers. </p>
 */
@property (nonatomic, assign) AWSImagebuilderOwnership owner;

@end

/**
 
 */
@interface AWSImagebuilderListImageRecipesResponse : AWSModel


/**
 <p>The list of image pipelines. </p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderImageRecipeSummary *> * _Nullable imageRecipeSummaryList;

/**
 <p>The next token used for paginated responses. When this is not empty, there are additional elements that the service has not included in this request. Use this token with the next request to retrieve additional objects. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderListImagesRequest : AWSRequest


/**
 <p>The filters. </p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderFilter *> * _Nullable filters;

/**
 <p>The maximum items to return in a request. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to specify where to start paginating. This is the NextToken from a previously truncated response. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The owner defines which images you want to list. By default, this request will only show images owned by your account. You can use this field to specify if you want to view images owned by yourself, by Amazon, or those images that have been shared with you by other customers. </p>
 */
@property (nonatomic, assign) AWSImagebuilderOwnership owner;

@end

/**
 
 */
@interface AWSImagebuilderListImagesResponse : AWSModel


/**
 <p>The list of image semantic versions. </p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderImageVersion *> * _Nullable imageVersionList;

/**
 <p>The next token used for paginated responses. When this is not empty, there are additional elements that the service has not included in this request. Use this token with the next request to retrieve additional objects. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderListInfrastructureConfigurationsRequest : AWSRequest


/**
 <p>The filters. </p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderFilter *> * _Nullable filters;

/**
 <p>The maximum items to return in a request. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to specify where to start paginating. This is the NextToken from a previously truncated response. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSImagebuilderListInfrastructureConfigurationsResponse : AWSModel


/**
 <p>The list of infrastructure configurations. </p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderInfrastructureConfigurationSummary *> * _Nullable infrastructureConfigurationSummaryList;

/**
 <p>The next token used for paginated responses. When this is not empty, there are additional elements that the service has not included in this request. Use this token with the next request to retrieve additional objects.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderListTagsForResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource whose tags you want to retrieve. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSImagebuilderListTagsForResourceResponse : AWSModel


/**
 <p>The tags for the specified resource. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Logging configuration defines where Image Builder uploads your logs.</p>
 */
@interface AWSImagebuilderLogging : AWSModel


/**
 <p>The Amazon S3 logging configuration.</p>
 */
@property (nonatomic, strong) AWSImagebuilderS3Logs * _Nullable s3Logs;

@end

/**
 <p>The resources produced by this image. </p>
 */
@interface AWSImagebuilderOutputResources : AWSModel


/**
 <p>The EC2 AMIs created by this image. </p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderAmi *> * _Nullable amis;

@end

/**
 
 */
@interface AWSImagebuilderPutComponentPolicyRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the component that this policy should be applied to. </p>
 */
@property (nonatomic, strong) NSString * _Nullable componentArn;

/**
 <p>The policy to apply. </p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

@end

/**
 
 */
@interface AWSImagebuilderPutComponentPolicyResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the component that this policy was applied to. </p>
 */
@property (nonatomic, strong) NSString * _Nullable componentArn;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderPutImagePolicyRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the image that this policy should be applied to. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imageArn;

/**
 <p>The policy to apply. </p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

@end

/**
 
 */
@interface AWSImagebuilderPutImagePolicyResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the image that this policy was applied to. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imageArn;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderPutImageRecipePolicyRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the image recipe that this policy should be applied to. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imageRecipeArn;

/**
 <p>The policy to apply. </p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

@end

/**
 
 */
@interface AWSImagebuilderPutImageRecipePolicyResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the image recipe that this policy was applied to. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imageRecipeArn;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 <p>Amazon S3 logging configuration.</p>
 */
@interface AWSImagebuilderS3Logs : AWSModel


/**
 <p>The Amazon S3 bucket in which to store the logs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3BucketName;

/**
 <p>The Amazon S3 path in which to store the logs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3KeyPrefix;

@end

/**
 <p>A schedule configures how often and when a pipeline will automatically create a new image. </p>
 */
@interface AWSImagebuilderSchedule : AWSModel


/**
 <p>The condition configures when the pipeline should trigger a new image build. When the <code>pipelineExecutionStartCondition</code> is set to <code>EXPRESSION_MATCH_AND_DEPENDENCY_UPDATES_AVAILABLE</code>, EC2 Image Builder will build a new image only when there are known changes pending. When it is set to <code>EXPRESSION_MATCH_ONLY</code>, it will build a new image every time the CRON expression matches the current time.</p>
 */
@property (nonatomic, assign) AWSImagebuilderPipelineExecutionStartCondition pipelineExecutionStartCondition;

/**
 <p>The expression determines how often EC2 Image Builder evaluates your <code>pipelineExecutionStartCondition</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleExpression;

@end

/**
 
 */
@interface AWSImagebuilderStartImagePipelineExecutionRequest : AWSRequest


/**
 <p>The idempotency token used to make this request idempotent. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The Amazon Resource Name (ARN) of the image pipeline that you want to manually invoke. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imagePipelineArn;

@end

/**
 
 */
@interface AWSImagebuilderStartImagePipelineExecutionResponse : AWSModel


/**
 <p>The idempotency token used to make this request idempotent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The Amazon Resource Name (ARN) of the image that was created by this request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageBuildVersionArn;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource that you want to tag. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tags to apply to the resource. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSImagebuilderTagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSImagebuilderUntagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource that you want to untag. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tag keys to remove from the resource. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSImagebuilderUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSImagebuilderUpdateDistributionConfigurationRequest : AWSRequest


/**
 <p>The idempotency token of the distribution configuration. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The description of the distribution configuration. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The Amazon Resource Name (ARN) of the distribution configuration that you want to update. </p>
 */
@property (nonatomic, strong) NSString * _Nullable distributionConfigurationArn;

/**
 <p>The distributions of the distribution configuration. </p>
 */
@property (nonatomic, strong) NSArray<AWSImagebuilderDistribution *> * _Nullable distributions;

@end

/**
 
 */
@interface AWSImagebuilderUpdateDistributionConfigurationResponse : AWSModel


/**
 <p>The idempotency token used to make this request idempotent. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The Amazon Resource Name (ARN) of the distribution configuration that was updated by this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable distributionConfigurationArn;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderUpdateImagePipelineRequest : AWSRequest


/**
 <p>The idempotency token used to make this request idempotent. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The description of the image pipeline. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The Amazon Resource Name (ARN) of the distribution configuration that will be used to configure and distribute images updated by this image pipeline. </p>
 */
@property (nonatomic, strong) NSString * _Nullable distributionConfigurationArn;

/**
 <p> Collects additional information about the image being created, including the operating system (OS) version and package list. This information is used to enhance the overall experience of using EC2 Image Builder. Enabled by default. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enhancedImageMetadataEnabled;

/**
 <p>The Amazon Resource Name (ARN) of the image pipeline that you want to update. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imagePipelineArn;

/**
 <p>The Amazon Resource Name (ARN) of the image recipe that will be used to configure images updated by this image pipeline. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imageRecipeArn;

/**
 <p>The image test configuration of the image pipeline. </p>
 */
@property (nonatomic, strong) AWSImagebuilderImageTestsConfiguration * _Nullable imageTestsConfiguration;

/**
 <p>The Amazon Resource Name (ARN) of the infrastructure configuration that will be used to build images updated by this image pipeline. </p>
 */
@property (nonatomic, strong) NSString * _Nullable infrastructureConfigurationArn;

/**
 <p>The schedule of the image pipeline. </p>
 */
@property (nonatomic, strong) AWSImagebuilderSchedule * _Nullable schedule;

/**
 <p>The status of the image pipeline. </p>
 */
@property (nonatomic, assign) AWSImagebuilderPipelineStatus status;

@end

/**
 
 */
@interface AWSImagebuilderUpdateImagePipelineResponse : AWSModel


/**
 <p>The idempotency token used to make this request idempotent. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The Amazon Resource Name (ARN) of the image pipeline that was updated by this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imagePipelineArn;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSImagebuilderUpdateInfrastructureConfigurationRequest : AWSRequest


/**
 <p>The idempotency token used to make this request idempotent. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The description of the infrastructure configuration. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The Amazon Resource Name (ARN) of the infrastructure configuration that you want to update. </p>
 */
@property (nonatomic, strong) NSString * _Nullable infrastructureConfigurationArn;

/**
 <p>The instance profile to associate with the instance used to customize your EC2 AMI. </p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceProfileName;

/**
 <p>The instance types of the infrastructure configuration. You can specify one or more instance types to use for this build. The service will pick one of these instance types based on availability. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceTypes;

/**
 <p>The key pair of the infrastructure configuration. This can be used to log on to and debug the instance used to create your image. </p>
 */
@property (nonatomic, strong) NSString * _Nullable keyPair;

/**
 <p>The logging configuration of the infrastructure configuration. </p>
 */
@property (nonatomic, strong) AWSImagebuilderLogging * _Nullable logging;

/**
 <p>The security group IDs to associate with the instance used to customize your EC2 AMI. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>The SNS topic on which to send image build events. </p>
 */
@property (nonatomic, strong) NSString * _Nullable snsTopicArn;

/**
 <p>The subnet ID to place the instance used to customize your EC2 AMI in. </p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

/**
 <p>The terminate instance on failure setting of the infrastructure configuration. Set to false if you want Image Builder to retain the instance used to configure your AMI if the build or test phase of your workflow fails. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable terminateInstanceOnFailure;

@end

/**
 
 */
@interface AWSImagebuilderUpdateInfrastructureConfigurationResponse : AWSModel


/**
 <p>The idempotency token used to make this request idempotent. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The Amazon Resource Name (ARN) of the infrastructure configuration that was updated by this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable infrastructureConfigurationArn;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

NS_ASSUME_NONNULL_END
