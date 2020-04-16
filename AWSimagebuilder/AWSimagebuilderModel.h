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

FOUNDATION_EXPORT NSString *const AWSimagebuilderErrorDomain;

typedef NS_ENUM(NSInteger, AWSimagebuilderErrorType) {
    AWSimagebuilderErrorUnknown,
    AWSimagebuilderErrorCallRateLimitExceeded,
    AWSimagebuilderErrorClient,
    AWSimagebuilderErrorForbidden,
    AWSimagebuilderErrorIdempotentParameterMismatch,
    AWSimagebuilderErrorInvalidPaginationToken,
    AWSimagebuilderErrorInvalidParameterCombination,
    AWSimagebuilderErrorInvalidParameter,
    AWSimagebuilderErrorInvalidParameterValue,
    AWSimagebuilderErrorInvalidRequest,
    AWSimagebuilderErrorInvalidVersionNumber,
    AWSimagebuilderErrorResourceAlreadyExists,
    AWSimagebuilderErrorResourceDependency,
    AWSimagebuilderErrorResourceInUse,
    AWSimagebuilderErrorResourceNotFound,
    AWSimagebuilderErrorService,
    AWSimagebuilderErrorServiceUnavailable,
};

typedef NS_ENUM(NSInteger, AWSimagebuilderComponentFormat) {
    AWSimagebuilderComponentFormatUnknown,
    AWSimagebuilderComponentFormatShell,
};

typedef NS_ENUM(NSInteger, AWSimagebuilderComponentType) {
    AWSimagebuilderComponentTypeUnknown,
    AWSimagebuilderComponentTypeBuild,
    AWSimagebuilderComponentTypeTest,
};

typedef NS_ENUM(NSInteger, AWSimagebuilderEbsVolumeType) {
    AWSimagebuilderEbsVolumeTypeUnknown,
    AWSimagebuilderEbsVolumeTypeStandard,
    AWSimagebuilderEbsVolumeTypeIO1,
    AWSimagebuilderEbsVolumeTypeGp2,
    AWSimagebuilderEbsVolumeTypeSc1,
    AWSimagebuilderEbsVolumeTypeSt1,
};

typedef NS_ENUM(NSInteger, AWSimagebuilderImageStatus) {
    AWSimagebuilderImageStatusUnknown,
    AWSimagebuilderImageStatusPending,
    AWSimagebuilderImageStatusCreating,
    AWSimagebuilderImageStatusBuilding,
    AWSimagebuilderImageStatusTesting,
    AWSimagebuilderImageStatusDistributing,
    AWSimagebuilderImageStatusIntegrating,
    AWSimagebuilderImageStatusAvailable,
    AWSimagebuilderImageStatusCancelled,
    AWSimagebuilderImageStatusFailed,
    AWSimagebuilderImageStatusDeprecated,
    AWSimagebuilderImageStatusDeleted,
};

typedef NS_ENUM(NSInteger, AWSimagebuilderOwnership) {
    AWSimagebuilderOwnershipUnknown,
    AWSimagebuilderOwnershipSelf,
    AWSimagebuilderOwnershipShared,
    AWSimagebuilderOwnershipAmazon,
};

typedef NS_ENUM(NSInteger, AWSimagebuilderPipelineExecutionStartCondition) {
    AWSimagebuilderPipelineExecutionStartConditionUnknown,
    AWSimagebuilderPipelineExecutionStartConditionExpressionMatchOnly,
    AWSimagebuilderPipelineExecutionStartConditionExpressionMatchAndDependencyUpdatesAvailable,
};

typedef NS_ENUM(NSInteger, AWSimagebuilderPipelineStatus) {
    AWSimagebuilderPipelineStatusUnknown,
    AWSimagebuilderPipelineStatusDisabled,
    AWSimagebuilderPipelineStatusEnabled,
};

typedef NS_ENUM(NSInteger, AWSimagebuilderPlatform) {
    AWSimagebuilderPlatformUnknown,
    AWSimagebuilderPlatformWindows,
    AWSimagebuilderPlatformLinux,
};

@class AWSimagebuilderAmi;
@class AWSimagebuilderAmiDistributionConfiguration;
@class AWSimagebuilderCancelImageCreationRequest;
@class AWSimagebuilderCancelImageCreationResponse;
@class AWSimagebuilderComponent;
@class AWSimagebuilderComponentConfiguration;
@class AWSimagebuilderComponentSummary;
@class AWSimagebuilderComponentVersion;
@class AWSimagebuilderCreateComponentRequest;
@class AWSimagebuilderCreateComponentResponse;
@class AWSimagebuilderCreateDistributionConfigurationRequest;
@class AWSimagebuilderCreateDistributionConfigurationResponse;
@class AWSimagebuilderCreateImagePipelineRequest;
@class AWSimagebuilderCreateImagePipelineResponse;
@class AWSimagebuilderCreateImageRecipeRequest;
@class AWSimagebuilderCreateImageRecipeResponse;
@class AWSimagebuilderCreateImageRequest;
@class AWSimagebuilderCreateImageResponse;
@class AWSimagebuilderCreateInfrastructureConfigurationRequest;
@class AWSimagebuilderCreateInfrastructureConfigurationResponse;
@class AWSimagebuilderDeleteComponentRequest;
@class AWSimagebuilderDeleteComponentResponse;
@class AWSimagebuilderDeleteDistributionConfigurationRequest;
@class AWSimagebuilderDeleteDistributionConfigurationResponse;
@class AWSimagebuilderDeleteImagePipelineRequest;
@class AWSimagebuilderDeleteImagePipelineResponse;
@class AWSimagebuilderDeleteImageRecipeRequest;
@class AWSimagebuilderDeleteImageRecipeResponse;
@class AWSimagebuilderDeleteImageRequest;
@class AWSimagebuilderDeleteImageResponse;
@class AWSimagebuilderDeleteInfrastructureConfigurationRequest;
@class AWSimagebuilderDeleteInfrastructureConfigurationResponse;
@class AWSimagebuilderDistribution;
@class AWSimagebuilderDistributionConfiguration;
@class AWSimagebuilderDistributionConfigurationSummary;
@class AWSimagebuilderEbsInstanceBlockDeviceSpecification;
@class AWSimagebuilderFilter;
@class AWSimagebuilderGetComponentPolicyRequest;
@class AWSimagebuilderGetComponentPolicyResponse;
@class AWSimagebuilderGetComponentRequest;
@class AWSimagebuilderGetComponentResponse;
@class AWSimagebuilderGetDistributionConfigurationRequest;
@class AWSimagebuilderGetDistributionConfigurationResponse;
@class AWSimagebuilderGetImagePipelineRequest;
@class AWSimagebuilderGetImagePipelineResponse;
@class AWSimagebuilderGetImagePolicyRequest;
@class AWSimagebuilderGetImagePolicyResponse;
@class AWSimagebuilderGetImageRecipePolicyRequest;
@class AWSimagebuilderGetImageRecipePolicyResponse;
@class AWSimagebuilderGetImageRecipeRequest;
@class AWSimagebuilderGetImageRecipeResponse;
@class AWSimagebuilderGetImageRequest;
@class AWSimagebuilderGetImageResponse;
@class AWSimagebuilderGetInfrastructureConfigurationRequest;
@class AWSimagebuilderGetInfrastructureConfigurationResponse;
@class AWSimagebuilderImage;
@class AWSimagebuilderImagePipeline;
@class AWSimagebuilderImageRecipe;
@class AWSimagebuilderImageRecipeSummary;
@class AWSimagebuilderImageState;
@class AWSimagebuilderImageSummary;
@class AWSimagebuilderImageTestsConfiguration;
@class AWSimagebuilderImageVersion;
@class AWSimagebuilderImportComponentRequest;
@class AWSimagebuilderImportComponentResponse;
@class AWSimagebuilderInfrastructureConfiguration;
@class AWSimagebuilderInfrastructureConfigurationSummary;
@class AWSimagebuilderInstanceBlockDeviceMapping;
@class AWSimagebuilderLaunchPermissionConfiguration;
@class AWSimagebuilderListComponentBuildVersionsRequest;
@class AWSimagebuilderListComponentBuildVersionsResponse;
@class AWSimagebuilderListComponentsRequest;
@class AWSimagebuilderListComponentsResponse;
@class AWSimagebuilderListDistributionConfigurationsRequest;
@class AWSimagebuilderListDistributionConfigurationsResponse;
@class AWSimagebuilderListImageBuildVersionsRequest;
@class AWSimagebuilderListImageBuildVersionsResponse;
@class AWSimagebuilderListImagePipelineImagesRequest;
@class AWSimagebuilderListImagePipelineImagesResponse;
@class AWSimagebuilderListImagePipelinesRequest;
@class AWSimagebuilderListImagePipelinesResponse;
@class AWSimagebuilderListImageRecipesRequest;
@class AWSimagebuilderListImageRecipesResponse;
@class AWSimagebuilderListImagesRequest;
@class AWSimagebuilderListImagesResponse;
@class AWSimagebuilderListInfrastructureConfigurationsRequest;
@class AWSimagebuilderListInfrastructureConfigurationsResponse;
@class AWSimagebuilderListTagsForResourceRequest;
@class AWSimagebuilderListTagsForResourceResponse;
@class AWSimagebuilderLogging;
@class AWSimagebuilderOutputResources;
@class AWSimagebuilderPutComponentPolicyRequest;
@class AWSimagebuilderPutComponentPolicyResponse;
@class AWSimagebuilderPutImagePolicyRequest;
@class AWSimagebuilderPutImagePolicyResponse;
@class AWSimagebuilderPutImageRecipePolicyRequest;
@class AWSimagebuilderPutImageRecipePolicyResponse;
@class AWSimagebuilderS3Logs;
@class AWSimagebuilderSchedule;
@class AWSimagebuilderStartImagePipelineExecutionRequest;
@class AWSimagebuilderStartImagePipelineExecutionResponse;
@class AWSimagebuilderTagResourceRequest;
@class AWSimagebuilderTagResourceResponse;
@class AWSimagebuilderUntagResourceRequest;
@class AWSimagebuilderUntagResourceResponse;
@class AWSimagebuilderUpdateDistributionConfigurationRequest;
@class AWSimagebuilderUpdateDistributionConfigurationResponse;
@class AWSimagebuilderUpdateImagePipelineRequest;
@class AWSimagebuilderUpdateImagePipelineResponse;
@class AWSimagebuilderUpdateInfrastructureConfigurationRequest;
@class AWSimagebuilderUpdateInfrastructureConfigurationResponse;

/**
 <p> Details of an EC2 AMI. </p>
 */
@interface AWSimagebuilderAmi : AWSModel


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
@property (nonatomic, strong) AWSimagebuilderImageState * _Nullable state;

@end

/**
 <p> Define and configure the output AMIs of the pipeline. </p>
 */
@interface AWSimagebuilderAmiDistributionConfiguration : AWSModel


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
@property (nonatomic, strong) AWSimagebuilderLaunchPermissionConfiguration * _Nullable launchPermission;

/**
 <p>The name of the distribution configuration. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSimagebuilderCancelImageCreationRequest : AWSRequest


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
@interface AWSimagebuilderCancelImageCreationResponse : AWSModel


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
@interface AWSimagebuilderComponent : AWSModel


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
@property (nonatomic, assign) AWSimagebuilderPlatform platform;

/**
 <p>The tags associated with the component.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The type of the component denotes whether the component is used to build the image or only to test it.</p>
 */
@property (nonatomic, assign) AWSimagebuilderComponentType types;

/**
 <p>The version of the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p> Configuration details of the component. </p>
 Required parameters: [componentArn]
 */
@interface AWSimagebuilderComponentConfiguration : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the component. </p>
 */
@property (nonatomic, strong) NSString * _Nullable componentArn;

@end

/**
 <p>A high-level summary of a component.</p>
 */
@interface AWSimagebuilderComponentSummary : AWSModel


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
@property (nonatomic, assign) AWSimagebuilderPlatform platform;

/**
 <p>The tags associated with the component.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The type of the component denotes whether the component is used to build the image or only to test it.</p>
 */
@property (nonatomic, assign) AWSimagebuilderComponentType types;

/**
 <p>The version of the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>A high-level overview of a component semantic version.</p>
 */
@interface AWSimagebuilderComponentVersion : AWSModel


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
@property (nonatomic, assign) AWSimagebuilderPlatform platform;

/**
 <p>The type of the component denotes whether the component is used to build the image or only to test it.</p>
 */
@property (nonatomic, assign) AWSimagebuilderComponentType types;

/**
 <p>The semantic version of the component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSimagebuilderCreateComponentRequest : AWSRequest


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
@property (nonatomic, assign) AWSimagebuilderPlatform platform;

/**
 <p>The semantic version of the component. This version follows the semantic version syntax. For example, major.minor.patch. This could be versioned like software (2.0.1) or like a date (2019.12.01).</p>
 */
@property (nonatomic, strong) NSString * _Nullable semanticVersion;

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
@interface AWSimagebuilderCreateComponentResponse : AWSModel


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
@interface AWSimagebuilderCreateDistributionConfigurationRequest : AWSRequest


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
@property (nonatomic, strong) NSArray<AWSimagebuilderDistribution *> * _Nullable distributions;

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
@interface AWSimagebuilderCreateDistributionConfigurationResponse : AWSModel


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
@interface AWSimagebuilderCreateImagePipelineRequest : AWSRequest


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
@property (nonatomic, strong) AWSimagebuilderImageTestsConfiguration * _Nullable imageTestsConfiguration;

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
@property (nonatomic, strong) AWSimagebuilderSchedule * _Nullable schedule;

/**
 <p> The status of the image pipeline. </p>
 */
@property (nonatomic, assign) AWSimagebuilderPipelineStatus status;

/**
 <p> The tags of the image pipeline. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSimagebuilderCreateImagePipelineResponse : AWSModel


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
@interface AWSimagebuilderCreateImageRecipeRequest : AWSRequest


/**
 <p>The block device mappings of the image recipe. </p>
 */
@property (nonatomic, strong) NSArray<AWSimagebuilderInstanceBlockDeviceMapping *> * _Nullable blockDeviceMappings;

/**
 <p>The idempotency token used to make this request idempotent. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The components of the image recipe. </p>
 */
@property (nonatomic, strong) NSArray<AWSimagebuilderComponentConfiguration *> * _Nullable components;

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
@interface AWSimagebuilderCreateImageRecipeResponse : AWSModel


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
@interface AWSimagebuilderCreateImageRequest : AWSRequest


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
@property (nonatomic, strong) AWSimagebuilderImageTestsConfiguration * _Nullable imageTestsConfiguration;

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
@interface AWSimagebuilderCreateImageResponse : AWSModel


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
@interface AWSimagebuilderCreateInfrastructureConfigurationRequest : AWSRequest


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
@property (nonatomic, strong) AWSimagebuilderLogging * _Nullable logging;

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
@interface AWSimagebuilderCreateInfrastructureConfigurationResponse : AWSModel


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
@interface AWSimagebuilderDeleteComponentRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the component build version to delete. </p>
 */
@property (nonatomic, strong) NSString * _Nullable componentBuildVersionArn;

@end

/**
 
 */
@interface AWSimagebuilderDeleteComponentResponse : AWSModel


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
@interface AWSimagebuilderDeleteDistributionConfigurationRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the distribution configuration to delete. </p>
 */
@property (nonatomic, strong) NSString * _Nullable distributionConfigurationArn;

@end

/**
 
 */
@interface AWSimagebuilderDeleteDistributionConfigurationResponse : AWSModel


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
@interface AWSimagebuilderDeleteImagePipelineRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the image pipeline to delete. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imagePipelineArn;

@end

/**
 
 */
@interface AWSimagebuilderDeleteImagePipelineResponse : AWSModel


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
@interface AWSimagebuilderDeleteImageRecipeRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the image recipe to delete. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imageRecipeArn;

@end

/**
 
 */
@interface AWSimagebuilderDeleteImageRecipeResponse : AWSModel


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
@interface AWSimagebuilderDeleteImageRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the image to delete. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imageBuildVersionArn;

@end

/**
 
 */
@interface AWSimagebuilderDeleteImageResponse : AWSModel


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
@interface AWSimagebuilderDeleteInfrastructureConfigurationRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the infrastructure configuration to delete. </p>
 */
@property (nonatomic, strong) NSString * _Nullable infrastructureConfigurationArn;

@end

/**
 
 */
@interface AWSimagebuilderDeleteInfrastructureConfigurationResponse : AWSModel


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
@interface AWSimagebuilderDistribution : AWSModel


/**
 <p>The specific AMI settings (for example, launch permissions, AMI tags). </p>
 */
@property (nonatomic, strong) AWSimagebuilderAmiDistributionConfiguration * _Nullable amiDistributionConfiguration;

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
@interface AWSimagebuilderDistributionConfiguration : AWSModel


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
@property (nonatomic, strong) NSArray<AWSimagebuilderDistribution *> * _Nullable distributions;

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
@interface AWSimagebuilderDistributionConfigurationSummary : AWSModel


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
@interface AWSimagebuilderEbsInstanceBlockDeviceSpecification : AWSModel


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
@property (nonatomic, assign) AWSimagebuilderEbsVolumeType volumeType;

@end

/**
 <p>A filter name and value pair that is used to return a more specific list of results from a list operation. Filters can be used to match a set of resources by specific criteria, such as tags, attributes, or IDs. </p>
 */
@interface AWSimagebuilderFilter : AWSModel


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
@interface AWSimagebuilderGetComponentPolicyRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the component whose policy you want to retrieve. </p>
 */
@property (nonatomic, strong) NSString * _Nullable componentArn;

@end

/**
 
 */
@interface AWSimagebuilderGetComponentPolicyResponse : AWSModel


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
@interface AWSimagebuilderGetComponentRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the component that you want to retrieve. Regex requires "/\d+$" suffix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable componentBuildVersionArn;

@end

/**
 
 */
@interface AWSimagebuilderGetComponentResponse : AWSModel


/**
 <p>The component object associated with the specified ARN. </p>
 */
@property (nonatomic, strong) AWSimagebuilderComponent * _Nullable component;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSimagebuilderGetDistributionConfigurationRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the distribution configuration that you want to retrieve. </p>
 */
@property (nonatomic, strong) NSString * _Nullable distributionConfigurationArn;

@end

/**
 
 */
@interface AWSimagebuilderGetDistributionConfigurationResponse : AWSModel


/**
 <p>The distribution configuration object. </p>
 */
@property (nonatomic, strong) AWSimagebuilderDistributionConfiguration * _Nullable distributionConfiguration;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSimagebuilderGetImagePipelineRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the image pipeline that you want to retrieve. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imagePipelineArn;

@end

/**
 
 */
@interface AWSimagebuilderGetImagePipelineResponse : AWSModel


/**
 <p>The image pipeline object. </p>
 */
@property (nonatomic, strong) AWSimagebuilderImagePipeline * _Nullable imagePipeline;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSimagebuilderGetImagePolicyRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the image whose policy you want to retrieve. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imageArn;

@end

/**
 
 */
@interface AWSimagebuilderGetImagePolicyResponse : AWSModel


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
@interface AWSimagebuilderGetImageRecipePolicyRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the image recipe whose policy you want to retrieve. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imageRecipeArn;

@end

/**
 
 */
@interface AWSimagebuilderGetImageRecipePolicyResponse : AWSModel


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
@interface AWSimagebuilderGetImageRecipeRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the image recipe that you want to retrieve. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imageRecipeArn;

@end

/**
 
 */
@interface AWSimagebuilderGetImageRecipeResponse : AWSModel


/**
 <p>The image recipe object. </p>
 */
@property (nonatomic, strong) AWSimagebuilderImageRecipe * _Nullable imageRecipe;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 
 */
@interface AWSimagebuilderGetImageRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the image that you want to retrieve. </p>
 */
@property (nonatomic, strong) NSString * _Nullable imageBuildVersionArn;

@end

/**
 
 */
@interface AWSimagebuilderGetImageResponse : AWSModel


/**
 <p>The image object. </p>
 */
@property (nonatomic, strong) AWSimagebuilderImage * _Nullable image;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 <p> GetInfrastructureConfiguration request object. </p>
 Required parameters: [infrastructureConfigurationArn]
 */
@interface AWSimagebuilderGetInfrastructureConfigurationRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the infrastructure configuration that you want to retrieve. </p>
 */
@property (nonatomic, strong) NSString * _Nullable infrastructureConfigurationArn;

@end

/**
 <p>GetInfrastructureConfiguration response object. </p>
 */
@interface AWSimagebuilderGetInfrastructureConfigurationResponse : AWSModel


/**
 <p>The infrastructure configuration object. </p>
 */
@property (nonatomic, strong) AWSimagebuilderInfrastructureConfiguration * _Nullable infrastructureConfiguration;

/**
 <p>The request ID that uniquely identifies this request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 <p>An image build version.</p>
 */
@interface AWSimagebuilderImage : AWSModel


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
@property (nonatomic, strong) AWSimagebuilderDistributionConfiguration * _Nullable distributionConfiguration;

/**
 <p> Collects additional information about the image being created, including the operating system (OS) version and package list. This information is used to enhance the overall experience of using EC2 Image Builder. Enabled by default. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enhancedImageMetadataEnabled;

/**
 <p>The image recipe used when creating the image.</p>
 */
@property (nonatomic, strong) AWSimagebuilderImageRecipe * _Nullable imageRecipe;

/**
 <p>The image tests configuration used when creating this image.</p>
 */
@property (nonatomic, strong) AWSimagebuilderImageTestsConfiguration * _Nullable imageTestsConfiguration;

/**
 <p>The infrastructure used when creating this image.</p>
 */
@property (nonatomic, strong) AWSimagebuilderInfrastructureConfiguration * _Nullable infrastructureConfiguration;

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
@property (nonatomic, strong) AWSimagebuilderOutputResources * _Nullable outputResources;

/**
 <p>The platform of the image.</p>
 */
@property (nonatomic, assign) AWSimagebuilderPlatform platform;

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
@property (nonatomic, strong) AWSimagebuilderImageState * _Nullable state;

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
@interface AWSimagebuilderImagePipeline : AWSModel


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
@property (nonatomic, strong) AWSimagebuilderImageTestsConfiguration * _Nullable imageTestsConfiguration;

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
@property (nonatomic, assign) AWSimagebuilderPlatform platform;

/**
 <p>The schedule of the image pipeline.</p>
 */
@property (nonatomic, strong) AWSimagebuilderSchedule * _Nullable schedule;

/**
 <p>The status of the image pipeline.</p>
 */
@property (nonatomic, assign) AWSimagebuilderPipelineStatus status;

/**
 <p>The tags of this image pipeline.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>An image recipe.</p>
 */
@interface AWSimagebuilderImageRecipe : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the image recipe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The block device mappings to apply when creating images from this recipe.</p>
 */
@property (nonatomic, strong) NSArray<AWSimagebuilderInstanceBlockDeviceMapping *> * _Nullable blockDeviceMappings;

/**
 <p>The components of the image recipe.</p>
 */
@property (nonatomic, strong) NSArray<AWSimagebuilderComponentConfiguration *> * _Nullable components;

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
@property (nonatomic, assign) AWSimagebuilderPlatform platform;

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
@interface AWSimagebuilderImageRecipeSummary : AWSModel


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
@property (nonatomic, assign) AWSimagebuilderPlatform platform;

/**
 <p>The tags of the image recipe.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p> Image state shows the image status and the reason for that status. </p>
 */
@interface AWSimagebuilderImageState : AWSModel


/**
 <p>The reason for the image's status. </p>
 */
@property (nonatomic, strong) NSString * _Nullable reason;

/**
 <p>The status of the image. </p>
 */
@property (nonatomic, assign) AWSimagebuilderImageStatus status;

@end

/**
 <p>An image summary.</p>
 */
@interface AWSimagebuilderImageSummary : AWSModel


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
@property (nonatomic, strong) AWSimagebuilderOutputResources * _Nullable outputResources;

/**
 <p>The owner of the image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p>The platform of the image.</p>
 */
@property (nonatomic, assign) AWSimagebuilderPlatform platform;

/**
 <p>The state of the image.</p>
 */
@property (nonatomic, strong) AWSimagebuilderImageState * _Nullable state;

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
@interface AWSimagebuilderImageTestsConfiguration : AWSModel


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
@interface AWSimagebuilderImageVersion : AWSModel


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
@property (nonatomic, assign) AWSimagebuilderPlatform platform;

/**
 <p>The semantic version of the image semantic version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSimagebuilderImportComponentRequest : AWSRequest


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
@property (nonatomic, assign) AWSimagebuilderComponentFormat format;

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
@property (nonatomic, assign) AWSimagebuilderPlatform platform;

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
@property (nonatomic, assign) AWSimagebuilderComponentType types;

/**
 <p>The uri of the component. Must be an S3 URL and the requester must have permission to access the S3 bucket. If you use S3, you can specify component content up to your service quota. Either <code>data</code> or <code>uri</code> can be used to specify the data within the component. </p>
 */
@property (nonatomic, strong) NSString * _Nullable uri;

@end

/**
 
 */
@interface AWSimagebuilderImportComponentResponse : AWSModel


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
@interface AWSimagebuilderInfrastructureConfiguration : AWSModel


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
@property (nonatomic, strong) AWSimagebuilderLogging * _Nullable logging;

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
@interface AWSimagebuilderInfrastructureConfigurationSummary : AWSModel


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
@interface AWSimagebuilderInstanceBlockDeviceMapping : AWSModel


/**
 <p>The device to which these mappings apply.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceName;

/**
 <p>Use to manage Amazon EBS-specific configuration for this mapping.</p>
 */
@property (nonatomic, strong) AWSimagebuilderEbsInstanceBlockDeviceSpecification * _Nullable ebs;

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
@interface AWSimagebuilderLaunchPermissionConfiguration : AWSModel


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
@interface AWSimagebuilderListComponentBuildVersionsRequest : AWSRequest


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
@interface AWSimagebuilderListComponentBuildVersionsResponse : AWSModel


/**
 <p>The list of component summaries for the specified semantic version. </p>
 */
@property (nonatomic, strong) NSArray<AWSimagebuilderComponentSummary *> * _Nullable componentSummaryList;

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
@interface AWSimagebuilderListComponentsRequest : AWSRequest


/**
 <p>The filters. </p>
 */
@property (nonatomic, strong) NSArray<AWSimagebuilderFilter *> * _Nullable filters;

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
@property (nonatomic, assign) AWSimagebuilderOwnership owner;

@end

/**
 
 */
@interface AWSimagebuilderListComponentsResponse : AWSModel


/**
 <p>The list of component semantic versions. </p>
 */
@property (nonatomic, strong) NSArray<AWSimagebuilderComponentVersion *> * _Nullable componentVersionList;

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
@interface AWSimagebuilderListDistributionConfigurationsRequest : AWSRequest


/**
 <p>The filters. </p>
 */
@property (nonatomic, strong) NSArray<AWSimagebuilderFilter *> * _Nullable filters;

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
@interface AWSimagebuilderListDistributionConfigurationsResponse : AWSModel


/**
 <p>The list of distributions. </p>
 */
@property (nonatomic, strong) NSArray<AWSimagebuilderDistributionConfigurationSummary *> * _Nullable distributionConfigurationSummaryList;

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
@interface AWSimagebuilderListImageBuildVersionsRequest : AWSRequest


/**
 <p>The filters. </p>
 */
@property (nonatomic, strong) NSArray<AWSimagebuilderFilter *> * _Nullable filters;

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
@interface AWSimagebuilderListImageBuildVersionsResponse : AWSModel


/**
 <p>The list of image build versions. </p>
 */
@property (nonatomic, strong) NSArray<AWSimagebuilderImageSummary *> * _Nullable imageSummaryList;

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
@interface AWSimagebuilderListImagePipelineImagesRequest : AWSRequest


/**
 <p>The filters. </p>
 */
@property (nonatomic, strong) NSArray<AWSimagebuilderFilter *> * _Nullable filters;

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
@interface AWSimagebuilderListImagePipelineImagesResponse : AWSModel


/**
 <p>The list of images built by this pipeline. </p>
 */
@property (nonatomic, strong) NSArray<AWSimagebuilderImageSummary *> * _Nullable imageSummaryList;

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
@interface AWSimagebuilderListImagePipelinesRequest : AWSRequest


/**
 <p>The filters. </p>
 */
@property (nonatomic, strong) NSArray<AWSimagebuilderFilter *> * _Nullable filters;

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
@interface AWSimagebuilderListImagePipelinesResponse : AWSModel


/**
 <p>The list of image pipelines. </p>
 */
@property (nonatomic, strong) NSArray<AWSimagebuilderImagePipeline *> * _Nullable imagePipelineList;

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
@interface AWSimagebuilderListImageRecipesRequest : AWSRequest


/**
 <p>The filters. </p>
 */
@property (nonatomic, strong) NSArray<AWSimagebuilderFilter *> * _Nullable filters;

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
@property (nonatomic, assign) AWSimagebuilderOwnership owner;

@end

/**
 
 */
@interface AWSimagebuilderListImageRecipesResponse : AWSModel


/**
 <p>The list of image pipelines. </p>
 */
@property (nonatomic, strong) NSArray<AWSimagebuilderImageRecipeSummary *> * _Nullable imageRecipeSummaryList;

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
@interface AWSimagebuilderListImagesRequest : AWSRequest


/**
 <p>The filters. </p>
 */
@property (nonatomic, strong) NSArray<AWSimagebuilderFilter *> * _Nullable filters;

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
@property (nonatomic, assign) AWSimagebuilderOwnership owner;

@end

/**
 
 */
@interface AWSimagebuilderListImagesResponse : AWSModel


/**
 <p>The list of image semantic versions. </p>
 */
@property (nonatomic, strong) NSArray<AWSimagebuilderImageVersion *> * _Nullable imageVersionList;

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
@interface AWSimagebuilderListInfrastructureConfigurationsRequest : AWSRequest


/**
 <p>The filters. </p>
 */
@property (nonatomic, strong) NSArray<AWSimagebuilderFilter *> * _Nullable filters;

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
@interface AWSimagebuilderListInfrastructureConfigurationsResponse : AWSModel


/**
 <p>The list of infrastructure configurations. </p>
 */
@property (nonatomic, strong) NSArray<AWSimagebuilderInfrastructureConfigurationSummary *> * _Nullable infrastructureConfigurationSummaryList;

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
@interface AWSimagebuilderListTagsForResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource whose tags you want to retrieve. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSimagebuilderListTagsForResourceResponse : AWSModel


/**
 <p>The tags for the specified resource. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Logging configuration defines where Image Builder uploads your logs.</p>
 */
@interface AWSimagebuilderLogging : AWSModel


/**
 <p>The Amazon S3 logging configuration.</p>
 */
@property (nonatomic, strong) AWSimagebuilderS3Logs * _Nullable s3Logs;

@end

/**
 <p>The resources produced by this image. </p>
 */
@interface AWSimagebuilderOutputResources : AWSModel


/**
 <p>The EC2 AMIs created by this image. </p>
 */
@property (nonatomic, strong) NSArray<AWSimagebuilderAmi *> * _Nullable amis;

@end

/**
 
 */
@interface AWSimagebuilderPutComponentPolicyRequest : AWSRequest


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
@interface AWSimagebuilderPutComponentPolicyResponse : AWSModel


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
@interface AWSimagebuilderPutImagePolicyRequest : AWSRequest


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
@interface AWSimagebuilderPutImagePolicyResponse : AWSModel


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
@interface AWSimagebuilderPutImageRecipePolicyRequest : AWSRequest


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
@interface AWSimagebuilderPutImageRecipePolicyResponse : AWSModel


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
@interface AWSimagebuilderS3Logs : AWSModel


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
@interface AWSimagebuilderSchedule : AWSModel


/**
 <p>The condition configures when the pipeline should trigger a new image build. When the <code>pipelineExecutionStartCondition</code> is set to <code>EXPRESSION_MATCH_AND_DEPENDENCY_UPDATES_AVAILABLE</code>, EC2 Image Builder will build a new image only when there are known changes pending. When it is set to <code>EXPRESSION_MATCH_ONLY</code>, it will build a new image every time the CRON expression matches the current time.</p>
 */
@property (nonatomic, assign) AWSimagebuilderPipelineExecutionStartCondition pipelineExecutionStartCondition;

/**
 <p>The expression determines how often EC2 Image Builder evaluates your <code>pipelineExecutionStartCondition</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleExpression;

@end

/**
 
 */
@interface AWSimagebuilderStartImagePipelineExecutionRequest : AWSRequest


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
@interface AWSimagebuilderStartImagePipelineExecutionResponse : AWSModel


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
@interface AWSimagebuilderTagResourceRequest : AWSRequest


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
@interface AWSimagebuilderTagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSimagebuilderUntagResourceRequest : AWSRequest


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
@interface AWSimagebuilderUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSimagebuilderUpdateDistributionConfigurationRequest : AWSRequest


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
@property (nonatomic, strong) NSArray<AWSimagebuilderDistribution *> * _Nullable distributions;

@end

/**
 
 */
@interface AWSimagebuilderUpdateDistributionConfigurationResponse : AWSModel


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
@interface AWSimagebuilderUpdateImagePipelineRequest : AWSRequest


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
@property (nonatomic, strong) AWSimagebuilderImageTestsConfiguration * _Nullable imageTestsConfiguration;

/**
 <p>The Amazon Resource Name (ARN) of the infrastructure configuration that will be used to build images updated by this image pipeline. </p>
 */
@property (nonatomic, strong) NSString * _Nullable infrastructureConfigurationArn;

/**
 <p>The schedule of the image pipeline. </p>
 */
@property (nonatomic, strong) AWSimagebuilderSchedule * _Nullable schedule;

/**
 <p>The status of the image pipeline. </p>
 */
@property (nonatomic, assign) AWSimagebuilderPipelineStatus status;

@end

/**
 
 */
@interface AWSimagebuilderUpdateImagePipelineResponse : AWSModel


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
@interface AWSimagebuilderUpdateInfrastructureConfigurationRequest : AWSRequest


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
@property (nonatomic, strong) AWSimagebuilderLogging * _Nullable logging;

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
@interface AWSimagebuilderUpdateInfrastructureConfigurationResponse : AWSModel


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
