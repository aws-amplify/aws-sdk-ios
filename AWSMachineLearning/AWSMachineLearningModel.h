/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSMachineLearningErrorDomain;

typedef NS_ENUM(NSInteger, AWSMachineLearningErrorType) {
    AWSMachineLearningErrorUnknown,
    AWSMachineLearningErrorIncompleteSignature,
    AWSMachineLearningErrorInvalidClientTokenId,
    AWSMachineLearningErrorMissingAuthenticationToken,
    AWSMachineLearningErrorInternalServer,
    AWSMachineLearningErrorInvalidInput,
    AWSMachineLearningErrorLimitExceeded,
    AWSMachineLearningErrorPredictorNotMounted,
    AWSMachineLearningErrorResourceNotFound,
};

typedef NS_ENUM(NSInteger, AWSMachineLearningDetailsAttributes) {
    AWSMachineLearningDetailsAttributesUnknown,
    AWSMachineLearningDetailsAttributesPredictiveModelType,
    AWSMachineLearningDetailsAttributesAlgorithm,
};

typedef NS_ENUM(NSInteger, AWSMachineLearningEntityStatus) {
    AWSMachineLearningEntityStatusUnknown,
    AWSMachineLearningEntityStatusPending,
    AWSMachineLearningEntityStatusInprogress,
    AWSMachineLearningEntityStatusFailed,
    AWSMachineLearningEntityStatusCompleted,
    AWSMachineLearningEntityStatusDeleted,
};

typedef NS_ENUM(NSInteger, AWSMachineLearningMLModelType) {
    AWSMachineLearningMLModelTypeUnknown,
    AWSMachineLearningMLModelTypeRegression,
    AWSMachineLearningMLModelTypeBinary,
    AWSMachineLearningMLModelTypeMulticlass,
};

typedef NS_ENUM(NSInteger, AWSMachineLearningRealtimeEndpointStatus) {
    AWSMachineLearningRealtimeEndpointStatusUnknown,
    AWSMachineLearningRealtimeEndpointStatusNone,
    AWSMachineLearningRealtimeEndpointStatusReady,
    AWSMachineLearningRealtimeEndpointStatusUpdating,
    AWSMachineLearningRealtimeEndpointStatusFailed,
};

@class AWSMachineLearningGetMLModelInput;
@class AWSMachineLearningGetMLModelOutput;
@class AWSMachineLearningPredictInput;
@class AWSMachineLearningPredictOutput;
@class AWSMachineLearningPrediction;
@class AWSMachineLearningRealtimeEndpointInfo;

/**
 
 */
@interface AWSMachineLearningGetMLModelInput : AWSRequest


/**
 <p>The ID assigned to the <code>MLModel</code> at creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelId;

/**
 <p>Specifies whether the <code>GetMLModel</code> operation should return <code>Recipe</code>.</p><p>If true, <code>Recipe</code> is returned.</p><p>If false, <code>Recipe</code> is not returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable verbose;

@end

/**
 <p>Represents the output of a <a>GetMLModel</a> operation, and provides detailed information about a <code>MLModel</code>.</p>
 */
@interface AWSMachineLearningGetMLModelOutput : AWSModel


/**
 <p>The time that the <code>MLModel</code> was created. The time is expressed in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The AWS user account from which the <code>MLModel</code> was created. The account type can be either an AWS root account or an AWS Identity and Access Management (IAM) user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdByIamUser;

/**
 <p>The current endpoint of the <code>MLModel</code></p>
 */
@property (nonatomic, strong) AWSMachineLearningRealtimeEndpointInfo * _Nullable endpointInfo;

/**
 <p>The location of the data file or directory in Amazon Simple Storage Service (Amazon S3).</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputDataLocationS3;

/**
 <p>The time of the most recent edit to the <code>MLModel</code>. The time is expressed in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>A link to the file that contains logs of the <code>CreateMLModel</code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logUri;

/**
 <p>The MLModel ID which is same as the <code>MLModelId</code> in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelId;

/**
 <p>Identifies the <code>MLModel</code> category. The following are the available types: </p><ul><li>REGRESSION -- Produces a numeric result. For example, "What listing price should a house have?"</li><li>BINARY -- Produces one of two possible results. For example, "Is this an e-commerce website?"</li><li>MULTICLASS -- Produces more than two possible results. For example, "Is this a HIGH, LOW or MEDIUM risk trade?"</li></ul>
 */
@property (nonatomic, assign) AWSMachineLearningMLModelType MLModelType;

/**
 <p>Description of the most recent details about accessing the <code>MLModel</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>A user-supplied name or description of the <code>MLModel</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The recipe to use when training the <code>MLModel</code>. The <code>Recipe</code> provides detailed information about the observation data to use during training, as well as manipulations to perform on the observation data during training.</p><note><title>Note</title><p>This parameter is provided as part of the verbose format.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable recipe;

/**
 <p>The schema used by all of the data files referenced by the <code>DataSource</code>.</p><note><title>Note</title><p>This parameter is provided as part of the verbose format.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable schema;

/**
 <p>The scoring threshold is used in binary classification <code>MLModel</code>s, and marks the boundary between a positive prediction and a negative prediction.</p><p>Output values greater than or equal to the threshold receive a positive result from the MLModel, such as <code>true</code>. Output values less than the threshold receive a negative response from the MLModel, such as <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scoreThreshold;

/**
 <p>The time of the most recent edit to the <code>ScoreThreshold</code>. The time is expressed in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable scoreThresholdLastUpdatedAt;

/**
 <p>Long integer type that is a 64-bit signed number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizeInBytes;

/**
 <p>The current status of the <code>MLModel</code>. This element can have one of the following values:</p><ul><li><code>PENDING</code> - Amazon Machine Learning (Amazon ML) submitted a request to describe a <code>MLModel</code>.</li><li><code>INPROGRESS</code> - The request is processing.</li><li><code>FAILED</code> - The request did not run to completion. It is not usable.</li><li><code>COMPLETED</code> - The request completed successfully.</li><li><code>DELETED</code> - The <code>MLModel</code> is marked as deleted. It is not usable.</li></ul>
 */
@property (nonatomic, assign) AWSMachineLearningEntityStatus status;

/**
 <p>The ID of the training <code>DataSource</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trainingDataSourceId;

/**
 <p>A list of the training parameters in the <code>MLModel</code>. The list is implemented as a map of key/value pairs.</p><p>The following is the current set of training parameters: </p><ul><li><p><code>sgd.l1RegularizationAmount</code> - Coefficient regularization L1 norm. It controls overfitting the data by penalizing large coefficients. This tends to drive coefficients to zero, resulting in a sparse feature set. If you use this parameter, specify a small value, such as 1.0E-04 or 1.0E-08.</p><p>The value is a double that ranges from 0 to MAX_DOUBLE. The default is not to use L1 normalization. The parameter cannot be used when <code>L2</code> is specified. Use this parameter sparingly.</p></li><li><p><code>sgd.l2RegularizationAmount</code> - Coefficient regularization L2 norm. It controls overfitting the data by penalizing large coefficients. This tends to drive coefficients to small, nonzero values. If you use this parameter, specify a small value, such as 1.0E-04 or 1.0E-08.</p><p>The value is a double that ranges from 0 to MAX_DOUBLE. The default is not to use L2 normalization. This parameter cannot be used when <code>L1</code> is specified. Use this parameter sparingly.</p></li><li><p><code>sgd.maxPasses</code> - The number of times that the training process traverses the observations to build the <code>MLModel</code>. The value is an integer that ranges from 1 to 10000. The default value is 10. </p></li><li><p><code>sgd.maxMLModelSizeInBytes</code> - The maximum allowed size of the model. Depending on the input data, the model size might affect performance. </p><p> The value is an integer that ranges from 100000 to 2147483648. The default value is 33554432. </p></li></ul>
 */
@property (nonatomic, strong) NSDictionary * _Nullable trainingParameters;

@end

/**
 
 */
@interface AWSMachineLearningPredictInput : AWSRequest


/**
 <p>A unique identifier of the <code>MLModel</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable predictEndpoint;

/**
 <p>A map of variable name-value pairs that represent an observation.</p>
 */
@property (nonatomic, strong) NSDictionary * _Nullable record;

@end

/**
 
 */
@interface AWSMachineLearningPredictOutput : AWSModel


/**
 <p>The output from a <code>Predict</code> operation: </p><ul><li><p><code>Details</code> - Contains the following attributes: DetailsAttributes.PREDICTIVE_MODEL_TYPE - REGRESSION | BINARY | MULTICLASS DetailsAttributes.ALGORITHM - SGD </p></li><li><p><code>PredictedLabel</code> - Present for either a BINARY or MULTICLASS <code>MLModel</code> request. </p></li><li><p><code>PredictedScores</code> - Contains the raw classification score corresponding to each label. </p></li><li><p><code>PredictedValue</code> - Present for a REGRESSION <code>MLModel</code> request. </p></li></ul>
 */
@property (nonatomic, strong) AWSMachineLearningPrediction * _Nullable prediction;

@end

/**
 <p>The output from a <code>Predict</code> operation: </p><ul><li><p><code>Details</code> - Contains the following attributes: DetailsAttributes.PREDICTIVE_MODEL_TYPE - REGRESSION | BINARY | MULTICLASS DetailsAttributes.ALGORITHM - SGD </p></li><li><p><code>PredictedLabel</code> - Present for either a BINARY or MULTICLASS <code>MLModel</code> request. </p></li><li><p><code>PredictedScores</code> - Contains the raw classification score corresponding to each label. </p></li><li><p><code>PredictedValue</code> - Present for a REGRESSION <code>MLModel</code> request. </p></li></ul>
 */
@interface AWSMachineLearningPrediction : AWSModel


/**
 Provides any additional details regarding the prediction.
 */
@property (nonatomic, strong) NSDictionary * _Nullable details;

/**
 The prediction label for either a BINARY or MULTICLASS <code>MLModel</code>.
 */
@property (nonatomic, strong) NSString * _Nullable predictedLabel;

/**
 Provides the raw classification score corresponding to each label.
 */
@property (nonatomic, strong) NSDictionary * _Nullable predictedScores;

/**
 The prediction value for REGRESSION <code>MLModel</code>.
 */
@property (nonatomic, strong) NSNumber * _Nullable predictedValue;

@end

/**
 <p> Describes the real-time endpoint information for an <code>MLModel</code>.</p>
 */
@interface AWSMachineLearningRealtimeEndpointInfo : AWSModel


/**
 <p>The time that the request to create the real-time endpoint for the <code>MLModel</code> was received. The time is expressed in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p> The current status of the real-time endpoint for the <code>MLModel</code>. This element can have one of the following values: </p><ul><li>NONE - Endpoint does not exist or was previously deleted.</li><li>READY - Endpoint is ready to be used for real-time predictions.</li><li>UPDATING - Updating/creating the endpoint. </li></ul>
 */
@property (nonatomic, assign) AWSMachineLearningRealtimeEndpointStatus endpointStatus;

/**
 <p>The URI that specifies where to send real-time prediction requests for the <code>MLModel</code>.</p><note><title>Note</title><p>The application must wait until the real-time endpoint is ready before using this URI.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable endpointUrl;

/**
 <p> The maximum processing rate for the real-time endpoint for <code>MLModel</code>, measured in incoming requests per second.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable peakRequestsPerSecond;

@end

NS_ASSUME_NONNULL_END
