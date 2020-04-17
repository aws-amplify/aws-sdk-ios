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

FOUNDATION_EXPORT NSString *const AWSfrauddetectorErrorDomain;

typedef NS_ENUM(NSInteger, AWSfrauddetectorErrorType) {
    AWSfrauddetectorErrorUnknown,
    AWSfrauddetectorErrorConflict,
    AWSfrauddetectorErrorInternalServer,
    AWSfrauddetectorErrorResourceNotFound,
    AWSfrauddetectorErrorThrottling,
    AWSfrauddetectorErrorValidation,
};

typedef NS_ENUM(NSInteger, AWSfrauddetectorDataSource) {
    AWSfrauddetectorDataSourceUnknown,
    AWSfrauddetectorDataSourceEvent,
    AWSfrauddetectorDataSourceModelScore,
    AWSfrauddetectorDataSourceExternalModelScore,
};

typedef NS_ENUM(NSInteger, AWSfrauddetectorDataType) {
    AWSfrauddetectorDataTypeUnknown,
    AWSfrauddetectorDataTypeString,
    AWSfrauddetectorDataTypeInteger,
    AWSfrauddetectorDataTypeFloat,
    AWSfrauddetectorDataTypeBoolean,
};

typedef NS_ENUM(NSInteger, AWSfrauddetectorDetectorVersionStatus) {
    AWSfrauddetectorDetectorVersionStatusUnknown,
    AWSfrauddetectorDetectorVersionStatusDraft,
    AWSfrauddetectorDetectorVersionStatusActive,
    AWSfrauddetectorDetectorVersionStatusInactive,
};

typedef NS_ENUM(NSInteger, AWSfrauddetectorLanguage) {
    AWSfrauddetectorLanguageUnknown,
    AWSfrauddetectorLanguageDetectorpl,
};

typedef NS_ENUM(NSInteger, AWSfrauddetectorModelEndpointStatus) {
    AWSfrauddetectorModelEndpointStatusUnknown,
    AWSfrauddetectorModelEndpointStatusAssociated,
    AWSfrauddetectorModelEndpointStatusDissociated,
};

typedef NS_ENUM(NSInteger, AWSfrauddetectorModelInputDataFormat) {
    AWSfrauddetectorModelInputDataFormatUnknown,
    AWSfrauddetectorModelInputDataFormatTextCsv,
    AWSfrauddetectorModelInputDataFormatApplicationJson,
};

typedef NS_ENUM(NSInteger, AWSfrauddetectorModelOutputDataFormat) {
    AWSfrauddetectorModelOutputDataFormatUnknown,
    AWSfrauddetectorModelOutputDataFormatTextCsv,
    AWSfrauddetectorModelOutputDataFormatApplicationJsonlines,
};

typedef NS_ENUM(NSInteger, AWSfrauddetectorModelSource) {
    AWSfrauddetectorModelSourceUnknown,
    AWSfrauddetectorModelSourceSagemaker,
};

typedef NS_ENUM(NSInteger, AWSfrauddetectorModelTypeEnum) {
    AWSfrauddetectorModelTypeEnumUnknown,
    AWSfrauddetectorModelTypeEnumOnlineFraudInsights,
};

typedef NS_ENUM(NSInteger, AWSfrauddetectorModelVersionStatus) {
    AWSfrauddetectorModelVersionStatusUnknown,
    AWSfrauddetectorModelVersionStatusTrainingInProgress,
    AWSfrauddetectorModelVersionStatusTrainingComplete,
    AWSfrauddetectorModelVersionStatusActivateRequested,
    AWSfrauddetectorModelVersionStatusActivateInProgress,
    AWSfrauddetectorModelVersionStatusActive,
    AWSfrauddetectorModelVersionStatusInactivateInProgress,
    AWSfrauddetectorModelVersionStatusInactive,
    AWSfrauddetectorModelVersionStatusError,
};

typedef NS_ENUM(NSInteger, AWSfrauddetectorRuleExecutionMode) {
    AWSfrauddetectorRuleExecutionModeUnknown,
    AWSfrauddetectorRuleExecutionModeAllMatched,
    AWSfrauddetectorRuleExecutionModeFirstMatched,
};

@class AWSfrauddetectorBatchCreateVariableError;
@class AWSfrauddetectorBatchCreateVariableRequest;
@class AWSfrauddetectorBatchCreateVariableResult;
@class AWSfrauddetectorBatchGetVariableError;
@class AWSfrauddetectorBatchGetVariableRequest;
@class AWSfrauddetectorBatchGetVariableResult;
@class AWSfrauddetectorCreateDetectorVersionRequest;
@class AWSfrauddetectorCreateDetectorVersionResult;
@class AWSfrauddetectorCreateModelVersionRequest;
@class AWSfrauddetectorCreateModelVersionResult;
@class AWSfrauddetectorCreateRuleRequest;
@class AWSfrauddetectorCreateRuleResult;
@class AWSfrauddetectorCreateVariableRequest;
@class AWSfrauddetectorCreateVariableResult;
@class AWSfrauddetectorDeleteDetectorRequest;
@class AWSfrauddetectorDeleteDetectorResult;
@class AWSfrauddetectorDeleteDetectorVersionRequest;
@class AWSfrauddetectorDeleteDetectorVersionResult;
@class AWSfrauddetectorDeleteEventRequest;
@class AWSfrauddetectorDeleteEventResult;
@class AWSfrauddetectorDeleteRuleVersionRequest;
@class AWSfrauddetectorDeleteRuleVersionResult;
@class AWSfrauddetectorDescribeDetectorRequest;
@class AWSfrauddetectorDescribeDetectorResult;
@class AWSfrauddetectorDescribeModelVersionsRequest;
@class AWSfrauddetectorDescribeModelVersionsResult;
@class AWSfrauddetectorDetector;
@class AWSfrauddetectorDetectorVersionSummary;
@class AWSfrauddetectorExternalModel;
@class AWSfrauddetectorGetDetectorVersionRequest;
@class AWSfrauddetectorGetDetectorVersionResult;
@class AWSfrauddetectorGetDetectorsRequest;
@class AWSfrauddetectorGetDetectorsResult;
@class AWSfrauddetectorGetExternalModelsRequest;
@class AWSfrauddetectorGetExternalModelsResult;
@class AWSfrauddetectorGetModelVersionRequest;
@class AWSfrauddetectorGetModelVersionResult;
@class AWSfrauddetectorGetModelsRequest;
@class AWSfrauddetectorGetModelsResult;
@class AWSfrauddetectorGetOutcomesRequest;
@class AWSfrauddetectorGetOutcomesResult;
@class AWSfrauddetectorGetPredictionRequest;
@class AWSfrauddetectorGetPredictionResult;
@class AWSfrauddetectorGetRulesRequest;
@class AWSfrauddetectorGetRulesResult;
@class AWSfrauddetectorGetVariablesRequest;
@class AWSfrauddetectorGetVariablesResult;
@class AWSfrauddetectorLabelSchema;
@class AWSfrauddetectorModel;
@class AWSfrauddetectorModelEndpointDataBlob;
@class AWSfrauddetectorModelInputConfiguration;
@class AWSfrauddetectorModelOutputConfiguration;
@class AWSfrauddetectorModelScores;
@class AWSfrauddetectorModelVariable;
@class AWSfrauddetectorModelVersion;
@class AWSfrauddetectorModelVersionDetail;
@class AWSfrauddetectorOutcome;
@class AWSfrauddetectorPutDetectorRequest;
@class AWSfrauddetectorPutDetectorResult;
@class AWSfrauddetectorPutExternalModelRequest;
@class AWSfrauddetectorPutExternalModelResult;
@class AWSfrauddetectorPutModelRequest;
@class AWSfrauddetectorPutModelResult;
@class AWSfrauddetectorPutOutcomeRequest;
@class AWSfrauddetectorPutOutcomeResult;
@class AWSfrauddetectorRole;
@class AWSfrauddetectorRule;
@class AWSfrauddetectorRuleDetail;
@class AWSfrauddetectorRuleResult;
@class AWSfrauddetectorTrainingDataSource;
@class AWSfrauddetectorUpdateDetectorVersionMetadataRequest;
@class AWSfrauddetectorUpdateDetectorVersionMetadataResult;
@class AWSfrauddetectorUpdateDetectorVersionRequest;
@class AWSfrauddetectorUpdateDetectorVersionResult;
@class AWSfrauddetectorUpdateDetectorVersionStatusRequest;
@class AWSfrauddetectorUpdateDetectorVersionStatusResult;
@class AWSfrauddetectorUpdateModelVersionRequest;
@class AWSfrauddetectorUpdateModelVersionResult;
@class AWSfrauddetectorUpdateRuleMetadataRequest;
@class AWSfrauddetectorUpdateRuleMetadataResult;
@class AWSfrauddetectorUpdateRuleVersionRequest;
@class AWSfrauddetectorUpdateRuleVersionResult;
@class AWSfrauddetectorUpdateVariableRequest;
@class AWSfrauddetectorUpdateVariableResult;
@class AWSfrauddetectorVariable;
@class AWSfrauddetectorVariableEntry;

/**
 <p>Provides the error of the batch create variable API.</p>
 */
@interface AWSfrauddetectorBatchCreateVariableError : AWSModel


/**
 <p>The error code. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable code;

/**
 <p>The error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSfrauddetectorBatchCreateVariableRequest : AWSRequest


/**
 <p>The list of variables for the batch create variable request.</p>
 */
@property (nonatomic, strong) NSArray<AWSfrauddetectorVariableEntry *> * _Nullable variableEntries;

@end

/**
 
 */
@interface AWSfrauddetectorBatchCreateVariableResult : AWSModel


/**
 <p>Provides the errors for the <code>BatchCreateVariable</code> request.</p>
 */
@property (nonatomic, strong) NSArray<AWSfrauddetectorBatchCreateVariableError *> * _Nullable errors;

@end

/**
 <p>Provides the error of the batch get variable API.</p>
 */
@interface AWSfrauddetectorBatchGetVariableError : AWSModel


/**
 <p>The error code. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable code;

/**
 <p>The error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The error name. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSfrauddetectorBatchGetVariableRequest : AWSRequest


/**
 <p>The list of variable names to get.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable names;

@end

/**
 
 */
@interface AWSfrauddetectorBatchGetVariableResult : AWSModel


/**
 <p>The errors from the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSfrauddetectorBatchGetVariableError *> * _Nullable errors;

/**
 <p>The returned variables.</p>
 */
@property (nonatomic, strong) NSArray<AWSfrauddetectorVariable *> * _Nullable variables;

@end

/**
 
 */
@interface AWSfrauddetectorCreateDetectorVersionRequest : AWSRequest


/**
 <p>The description of the detector version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID of the detector under which you want to create a new version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The Amazon Sagemaker model endpoints to include in the detector version.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable externalModelEndpoints;

/**
 <p>The model versions to include in the detector version.</p>
 */
@property (nonatomic, strong) NSArray<AWSfrauddetectorModelVersion *> * _Nullable modelVersions;

/**
 <p>The rule execution mode for the rules included in the detector version.</p><p>You can define and edit the rule mode at the detector version level, when it is in draft status.</p><p>If you specify <code>FIRST_MATCHED</code>, Amazon Fraud Detector evaluates rules sequentially, first to last, stopping at the first matched rule. Amazon Fraud dectector then provides the outcomes for that single rule.</p><p>If you specifiy <code>ALL_MATCHED</code>, Amazon Fraud Detector evaluates all rules and returns the outcomes for all matched rules. </p><p>The default behavior is <code>FIRST_MATCHED</code>.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorRuleExecutionMode ruleExecutionMode;

/**
 <p>The rules to include in the detector version.</p>
 */
@property (nonatomic, strong) NSArray<AWSfrauddetectorRule *> * _Nullable rules;

@end

/**
 
 */
@interface AWSfrauddetectorCreateDetectorVersionResult : AWSModel


/**
 <p>The ID for the created version's parent detector.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The ID for the created detector. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorVersionId;

/**
 <p>The status of the detector version.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorDetectorVersionStatus status;

@end

/**
 
 */
@interface AWSfrauddetectorCreateModelVersionRequest : AWSRequest


/**
 <p>The model version description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The model ID. </p>
 */
@property (nonatomic, strong) NSString * _Nullable modelId;

/**
 <p>The model type.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorModelTypeEnum modelType;

@end

/**
 
 */
@interface AWSfrauddetectorCreateModelVersionResult : AWSModel


/**
 <p>The model ID. </p>
 */
@property (nonatomic, strong) NSString * _Nullable modelId;

/**
 <p>The model type.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorModelTypeEnum modelType;

/**
 <p>The version of the model. </p>
 */
@property (nonatomic, strong) NSString * _Nullable modelVersionNumber;

/**
 <p>The model version status. </p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 
 */
@interface AWSfrauddetectorCreateRuleRequest : AWSRequest


/**
 <p>The rule description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The detector ID for the rule's parent detector.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The rule expression.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expression;

/**
 <p>The language of the rule.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorLanguage language;

/**
 <p>The outcome or outcomes returned when the rule expression matches.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable outcomes;

/**
 <p>The rule ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

@end

/**
 
 */
@interface AWSfrauddetectorCreateRuleResult : AWSModel


/**
 <p>The created rule.</p>
 */
@property (nonatomic, strong) AWSfrauddetectorRule * _Nullable rule;

@end

/**
 
 */
@interface AWSfrauddetectorCreateVariableRequest : AWSRequest


/**
 <p>The source of the data.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorDataSource dataSource;

/**
 <p>The data type.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorDataType dataType;

/**
 <p>The default value for the variable when no value is received.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultValue;

/**
 <p>The description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the variable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The variable type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable variableType;

@end

/**
 
 */
@interface AWSfrauddetectorCreateVariableResult : AWSModel


@end

/**
 
 */
@interface AWSfrauddetectorDeleteDetectorRequest : AWSRequest


/**
 <p>The ID of the detector to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSfrauddetectorDeleteDetectorResult : AWSModel


@end

/**
 
 */
@interface AWSfrauddetectorDeleteDetectorVersionRequest : AWSRequest


/**
 <p>The ID of the parent detector for the detector version to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The ID of the detector version to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorVersionId;

@end

/**
 
 */
@interface AWSfrauddetectorDeleteDetectorVersionResult : AWSModel


@end

/**
 
 */
@interface AWSfrauddetectorDeleteEventRequest : AWSRequest


/**
 <p>The ID of the event to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventId;

@end

/**
 
 */
@interface AWSfrauddetectorDeleteEventResult : AWSModel


@end

/**
 
 */
@interface AWSfrauddetectorDeleteRuleVersionRequest : AWSRequest


/**
 <p>The ID of the detector that includes the rule version to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The rule ID of the rule version to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

/**
 <p>The rule version to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleVersion;

@end

/**
 
 */
@interface AWSfrauddetectorDeleteRuleVersionResult : AWSModel


@end

/**
 
 */
@interface AWSfrauddetectorDescribeDetectorRequest : AWSRequest


/**
 <p>The detector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The maximum number of results to return for the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The next token from the previous response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSfrauddetectorDescribeDetectorResult : AWSModel


/**
 <p>The detector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The status and description for each detector version.</p>
 */
@property (nonatomic, strong) NSArray<AWSfrauddetectorDetectorVersionSummary *> * _Nullable detectorVersionSummaries;

/**
 <p>The next token to be used for subsequent requests.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSfrauddetectorDescribeModelVersionsRequest : AWSRequest


/**
 <p>The maximum number of results to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The model ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelId;

/**
 <p>The model type.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorModelTypeEnum modelType;

/**
 <p>The model version. </p>
 */
@property (nonatomic, strong) NSString * _Nullable modelVersionNumber;

/**
 <p>The next token from the previous results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSfrauddetectorDescribeModelVersionsResult : AWSModel


/**
 <p>The model version details.</p>
 */
@property (nonatomic, strong) NSArray<AWSfrauddetectorModelVersionDetail *> * _Nullable modelVersionDetails;

/**
 <p>The next token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>The detector.</p>
 */
@interface AWSfrauddetectorDetector : AWSModel


/**
 <p>Timestamp of when the detector was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdTime;

/**
 <p>The detector description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The detector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>Timestamp of when the detector was last updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastUpdatedTime;

@end

/**
 <p>The summary of the detector version.</p>
 */
@interface AWSfrauddetectorDetectorVersionSummary : AWSModel


/**
 <p>The detector version description. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The detector version ID. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorVersionId;

/**
 <p>Timestamp of when the detector version was last updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastUpdatedTime;

/**
 <p>The detector version status. </p>
 */
@property (nonatomic, assign) AWSfrauddetectorDetectorVersionStatus status;

@end

/**
 <p>The Amazon SageMaker model.</p>
 */
@interface AWSfrauddetectorExternalModel : AWSModel


/**
 <p>Timestamp of when the model was last created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdTime;

/**
 <p>The input configuration.</p>
 */
@property (nonatomic, strong) AWSfrauddetectorModelInputConfiguration * _Nullable inputConfiguration;

/**
 <p>Timestamp of when the model was last updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastUpdatedTime;

/**
 <p>The Amazon SageMaker model endpoints.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelEndpoint;

/**
 <p>The Amazon Fraud Detector status for the external model endpoint</p>
 */
@property (nonatomic, assign) AWSfrauddetectorModelEndpointStatus modelEndpointStatus;

/**
 <p>The source of the model.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorModelSource modelSource;

/**
 <p>The output configuration.</p>
 */
@property (nonatomic, strong) AWSfrauddetectorModelOutputConfiguration * _Nullable outputConfiguration;

/**
 <p>The role used to invoke the model. </p>
 */
@property (nonatomic, strong) AWSfrauddetectorRole * _Nullable role;

@end

/**
 
 */
@interface AWSfrauddetectorGetDetectorVersionRequest : AWSRequest


/**
 <p>The detector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The detector version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorVersionId;

@end

/**
 
 */
@interface AWSfrauddetectorGetDetectorVersionResult : AWSModel


/**
 <p>The timestamp when the detector version was created. </p>
 */
@property (nonatomic, strong) NSString * _Nullable createdTime;

/**
 <p>The detector version description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The detector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The detector version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorVersionId;

/**
 <p>The Amazon SageMaker model endpoints included in the detector version.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable externalModelEndpoints;

/**
 <p>The timestamp when the detector version was last updated. </p>
 */
@property (nonatomic, strong) NSString * _Nullable lastUpdatedTime;

/**
 <p>The model versions included in the detector version. </p>
 */
@property (nonatomic, strong) NSArray<AWSfrauddetectorModelVersion *> * _Nullable modelVersions;

/**
 <p>The execution mode of the rule in the dectector</p><p><code>FIRST_MATCHED</code> indicates that Amazon Fraud Detector evaluates rules sequentially, first to last, stopping at the first matched rule. Amazon Fraud dectector then provides the outcomes for that single rule.</p><p><code>ALL_MATCHED</code> indicates that Amazon Fraud Detector evaluates all rules and returns the outcomes for all matched rules. You can define and edit the rule mode at the detector version level, when it is in draft status.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorRuleExecutionMode ruleExecutionMode;

/**
 <p>The rules included in the detector version.</p>
 */
@property (nonatomic, strong) NSArray<AWSfrauddetectorRule *> * _Nullable rules;

/**
 <p>The status of the detector version.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorDetectorVersionStatus status;

@end

/**
 
 */
@interface AWSfrauddetectorGetDetectorsRequest : AWSRequest


/**
 <p>The detector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The maximum number of objects to return for the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The next token for the subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSfrauddetectorGetDetectorsResult : AWSModel


/**
 <p>The detectors.</p>
 */
@property (nonatomic, strong) NSArray<AWSfrauddetectorDetector *> * _Nullable detectors;

/**
 <p>The next page token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSfrauddetectorGetExternalModelsRequest : AWSRequest


/**
 <p>The maximum number of objects to return for the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The Amazon SageMaker model endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelEndpoint;

/**
 <p>The next page token for the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSfrauddetectorGetExternalModelsResult : AWSModel


/**
 <p>Gets the Amazon SageMaker models.</p>
 */
@property (nonatomic, strong) NSArray<AWSfrauddetectorExternalModel *> * _Nullable externalModels;

/**
 <p>The next page token to be used in subsequent requests.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSfrauddetectorGetModelVersionRequest : AWSRequest


/**
 <p>The model ID. </p>
 */
@property (nonatomic, strong) NSString * _Nullable modelId;

/**
 <p>The model type. </p>
 */
@property (nonatomic, assign) AWSfrauddetectorModelTypeEnum modelType;

/**
 <p>The model version. </p>
 */
@property (nonatomic, strong) NSString * _Nullable modelVersionNumber;

@end

/**
 
 */
@interface AWSfrauddetectorGetModelVersionResult : AWSModel


/**
 <p>The model version description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The model ID. </p>
 */
@property (nonatomic, strong) NSString * _Nullable modelId;

/**
 <p>The model type. </p>
 */
@property (nonatomic, assign) AWSfrauddetectorModelTypeEnum modelType;

/**
 <p>The model version. </p>
 */
@property (nonatomic, strong) NSString * _Nullable modelVersionNumber;

/**
 <p>The model version status. </p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 
 */
@interface AWSfrauddetectorGetModelsRequest : AWSRequest


/**
 <p>The maximum results to return for the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The model ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelId;

/**
 <p>The model type.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorModelTypeEnum modelType;

/**
 <p>The next token for the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSfrauddetectorGetModelsResult : AWSModel


/**
 <p>The returned models. </p>
 */
@property (nonatomic, strong) NSArray<AWSfrauddetectorModel *> * _Nullable models;

/**
 <p>The next token for subsequent requests. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSfrauddetectorGetOutcomesRequest : AWSRequest


/**
 <p>The maximum number of objects to return for the request. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The name of the outcome or outcomes to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The next page token for the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSfrauddetectorGetOutcomesResult : AWSModel


/**
 <p>The next page token for subsequent requests.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The outcomes. </p>
 */
@property (nonatomic, strong) NSArray<AWSfrauddetectorOutcome *> * _Nullable outcomes;

@end

/**
 
 */
@interface AWSfrauddetectorGetPredictionRequest : AWSRequest


/**
 <p>The detector ID. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The detector version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorVersionId;

/**
 <p>Names of variables you defined in Amazon Fraud Detector to represent event data elements and their corresponding values for the event you are sending for evaluation.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable eventAttributes;

/**
 <p>The unique ID used to identify the event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventId;

/**
 <p>The Amazon SageMaker model endpoint input data blobs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSfrauddetectorModelEndpointDataBlob *> * _Nullable externalModelEndpointDataBlobs;

@end

/**
 
 */
@interface AWSfrauddetectorGetPredictionResult : AWSModel


/**
 <p>The model scores for models used in the detector version.</p>
 */
@property (nonatomic, strong) NSArray<AWSfrauddetectorModelScores *> * _Nullable modelScores;

/**
 <p>The prediction outcomes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable outcomes;

/**
 <p>The rule results in the prediction.</p>
 */
@property (nonatomic, strong) NSArray<AWSfrauddetectorRuleResult *> * _Nullable ruleResults;

@end

/**
 
 */
@interface AWSfrauddetectorGetRulesRequest : AWSRequest


/**
 <p>The detector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The maximum number of rules to return for the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The next page token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The rule ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

/**
 <p>The rule version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleVersion;

@end

/**
 
 */
@interface AWSfrauddetectorGetRulesResult : AWSModel


/**
 <p>The next page token to be used in subsequent requests.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The details of the requested rule.</p>
 */
@property (nonatomic, strong) NSArray<AWSfrauddetectorRuleDetail *> * _Nullable ruleDetails;

@end

/**
 
 */
@interface AWSfrauddetectorGetVariablesRequest : AWSRequest


/**
 <p>The max size per page determined for the get variable request. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The name of the variable. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The next page token of the get variable request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSfrauddetectorGetVariablesResult : AWSModel


/**
 <p>The next page token to be used in subsequent requests. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The names of the variables returned. </p>
 */
@property (nonatomic, strong) NSArray<AWSfrauddetectorVariable *> * _Nullable variables;

@end

/**
 <p>The label schema.</p>
 Required parameters: [labelKey, labelMapper]
 */
@interface AWSfrauddetectorLabelSchema : AWSModel


/**
 <p>The label key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable labelKey;

/**
 <p>The label mapper maps the Amazon Fraud Detector supported label to the appropriate source labels. For example, if <code>"FRAUD"</code> and <code>"LEGIT"</code> are Amazon Fraud Detector supported labels, this mapper could be: <code>{"FRAUD" =&gt; ["0"]</code>, "LEGIT" =&gt; ["1"]} or <code>{"FRAUD" =&gt; ["false"], "LEGIT" =&gt; ["true"]}</code> or <code>{"FRAUD" =&gt; ["fraud", "abuse"], "LEGIT" =&gt; ["legit", "safe"]}</code>. The value part of the mapper is a list, because you may have multiple variants for a single Amazon Fraud Detector label. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable labelMapper;

@end

/**
 <p>The model.</p>
 */
@interface AWSfrauddetectorModel : AWSModel


/**
 <p>Timestamp of when the model was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdTime;

/**
 <p>The model description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The model label schema.</p>
 */
@property (nonatomic, strong) AWSfrauddetectorLabelSchema * _Nullable labelSchema;

/**
 <p>Timestamp of last time the model was updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastUpdatedTime;

/**
 <p>The model ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelId;

/**
 <p>The model type.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorModelTypeEnum modelType;

/**
 <p>The model input variables.</p>
 */
@property (nonatomic, strong) NSArray<AWSfrauddetectorModelVariable *> * _Nullable modelVariables;

/**
 <p>The model training data source in Amazon S3.</p>
 */
@property (nonatomic, strong) AWSfrauddetectorTrainingDataSource * _Nullable trainingDataSource;

@end

/**
 <p>A pre-formed Amazon SageMaker model input you can include if your detector version includes an imported Amazon SageMaker model endpoint with pass-through input configuration.</p>
 */
@interface AWSfrauddetectorModelEndpointDataBlob : AWSModel


/**
 <p>The byte buffer of the Amazon SageMaker model endpoint input data blob.</p>
 */
@property (nonatomic, strong) NSData * _Nullable byteBuffer;

/**
 <p>The content type of the Amazon SageMaker model endpoint input data blob. </p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

@end

/**
 <p>The model input configuration.</p>
 Required parameters: [isOpaque]
 */
@interface AWSfrauddetectorModelInputConfiguration : AWSModel


/**
 <p> Template for constructing the CSV input-data sent to SageMaker. At event-evaluation, the placeholders for variable-names in the template will be replaced with the variable values before being sent to SageMaker. </p>
 */
@property (nonatomic, strong) NSString * _Nullable csvInputTemplate;

/**
 <p> The format of the model input configuration. The format differs depending on if it is passed through to SageMaker or constructed by Amazon Fraud Detector.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorModelInputDataFormat format;

/**
 <p> For an opaque-model, the input to the model will be a ByteBuffer blob provided in the getPrediction request, and will be passed to SageMaker as-is. For non-opaque models, the input will be constructed by Amazon Fraud Detector based on the model-configuration. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isOpaque;

/**
 <p> Template for constructing the JSON input-data sent to SageMaker. At event-evaluation, the placeholders for variable names in the template will be replaced with the variable values before being sent to SageMaker. </p>
 */
@property (nonatomic, strong) NSString * _Nullable jsonInputTemplate;

@end

/**
 <p>Provides the model output configuration.</p>
 Required parameters: [format]
 */
@interface AWSfrauddetectorModelOutputConfiguration : AWSModel


/**
 <p>A map of CSV index values in the SageMaker response to the Amazon Fraud Detector variables. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable csvIndexToVariableMap;

/**
 <p>The format of the model output configuration.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorModelOutputDataFormat format;

/**
 <p>A map of JSON keys in response from SageMaker to the Amazon Fraud Detector variables. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable jsonKeyToVariableMap;

@end

/**
 <p>The fraud prediction scores.</p>
 */
@interface AWSfrauddetectorModelScores : AWSModel


/**
 <p>The model version.</p>
 */
@property (nonatomic, strong) AWSfrauddetectorModelVersion * _Nullable modelVersion;

/**
 <p>The model's fraud prediction scores.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable scores;

@end

/**
 <p>The model variable.&gt;</p>
 Required parameters: [name]
 */
@interface AWSfrauddetectorModelVariable : AWSModel


/**
 <p>The model variable's index.&gt;</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable index;

/**
 <p>The model variable's name.&gt;</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>The model version.</p>
 Required parameters: [modelId, modelType, modelVersionNumber]
 */
@interface AWSfrauddetectorModelVersion : AWSModel


/**
 <p>The parent model ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelId;

/**
 <p>The model type.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorModelTypeEnum modelType;

/**
 <p>The model version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelVersionNumber;

@end

/**
 <p>Provides the model version details. </p>
 */
@interface AWSfrauddetectorModelVersionDetail : AWSModel


/**
 <p>The timestamp when the model was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdTime;

/**
 <p>The model description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The model label schema.</p>
 */
@property (nonatomic, strong) AWSfrauddetectorLabelSchema * _Nullable labelSchema;

/**
 <p>The timestamp when the model was last updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastUpdatedTime;

/**
 <p>The model ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelId;

/**
 <p>The model type.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorModelTypeEnum modelType;

/**
 <p>The model variables.</p>
 */
@property (nonatomic, strong) NSArray<AWSfrauddetectorModelVariable *> * _Nullable modelVariables;

/**
 <p>The model version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelVersionNumber;

/**
 <p>The model status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The model training data source.</p>
 */
@property (nonatomic, strong) AWSfrauddetectorTrainingDataSource * _Nullable trainingDataSource;

/**
 <p>The model training metrics.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable trainingMetrics;

/**
 <p>The model validation metrics.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable validationMetrics;

@end

/**
 <p>The outcome.</p>
 */
@interface AWSfrauddetectorOutcome : AWSModel


/**
 <p>The timestamp when the outcome was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdTime;

/**
 <p>The outcome description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The timestamp when the outcome was last updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastUpdatedTime;

/**
 <p>The outcome name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSfrauddetectorPutDetectorRequest : AWSRequest


/**
 <p>The description of the detector.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The detector ID. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSfrauddetectorPutDetectorResult : AWSModel


@end

/**
 
 */
@interface AWSfrauddetectorPutExternalModelRequest : AWSRequest


/**
 <p>The model endpoint input configuration.</p>
 */
@property (nonatomic, strong) AWSfrauddetectorModelInputConfiguration * _Nullable inputConfiguration;

/**
 <p>The model endpoints name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelEndpoint;

/**
 <p>The model endpoint’s status in Amazon Fraud Detector.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorModelEndpointStatus modelEndpointStatus;

/**
 <p>The source of the model.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorModelSource modelSource;

/**
 <p>The model endpoint output configuration.</p>
 */
@property (nonatomic, strong) AWSfrauddetectorModelOutputConfiguration * _Nullable outputConfiguration;

/**
 <p>The IAM role used to invoke the model endpoint.</p>
 */
@property (nonatomic, strong) AWSfrauddetectorRole * _Nullable role;

@end

/**
 
 */
@interface AWSfrauddetectorPutExternalModelResult : AWSModel


@end

/**
 
 */
@interface AWSfrauddetectorPutModelRequest : AWSRequest


/**
 <p>The model description. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The label schema.</p>
 */
@property (nonatomic, strong) AWSfrauddetectorLabelSchema * _Nullable labelSchema;

/**
 <p>The model ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelId;

/**
 <p>The model type. </p>
 */
@property (nonatomic, assign) AWSfrauddetectorModelTypeEnum modelType;

/**
 <p>The model input variables.</p>
 */
@property (nonatomic, strong) NSArray<AWSfrauddetectorModelVariable *> * _Nullable modelVariables;

/**
 <p>The training data source location in Amazon S3. </p>
 */
@property (nonatomic, strong) AWSfrauddetectorTrainingDataSource * _Nullable trainingDataSource;

@end

/**
 
 */
@interface AWSfrauddetectorPutModelResult : AWSModel


@end

/**
 
 */
@interface AWSfrauddetectorPutOutcomeRequest : AWSRequest


/**
 <p>The outcome description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the outcome.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSfrauddetectorPutOutcomeResult : AWSModel


@end

/**
 <p>The role used to invoke external model endpoints.</p>
 Required parameters: [arn, name]
 */
@interface AWSfrauddetectorRole : AWSModel


/**
 <p>The role ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The role name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>A rule.</p>
 Required parameters: [detectorId, ruleId, ruleVersion]
 */
@interface AWSfrauddetectorRule : AWSModel


/**
 <p>The detector for which the rule is associated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The rule ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

/**
 <p>The rule version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleVersion;

@end

/**
 <p>The details of the rule.</p>
 */
@interface AWSfrauddetectorRuleDetail : AWSModel


/**
 <p>The timestamp of when the rule was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdTime;

/**
 <p>The rule description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The detector for which the rule is associated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The rule expression.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expression;

/**
 <p>The rule language.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorLanguage language;

/**
 <p>Timestamp of the last time the rule was updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastUpdatedTime;

/**
 <p>The rule outcomes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable outcomes;

/**
 <p>The rule ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

/**
 <p>The rule version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleVersion;

@end

/**
 <p>The rule results.</p>
 */
@interface AWSfrauddetectorRuleResult : AWSModel


/**
 <p>The outcomes of the matched rule, based on the rule execution mode.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable outcomes;

/**
 <p>The rule ID that was matched, based on the rule execution mode.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

@end

/**
 <p>The training data source.</p>
 Required parameters: [dataLocation, dataAccessRoleArn]
 */
@interface AWSfrauddetectorTrainingDataSource : AWSModel


/**
 <p>The data access role ARN for the training data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>The data location of the training data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataLocation;

@end

/**
 
 */
@interface AWSfrauddetectorUpdateDetectorVersionMetadataRequest : AWSRequest


/**
 <p>The description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The detector ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The detector version ID. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorVersionId;

@end

/**
 
 */
@interface AWSfrauddetectorUpdateDetectorVersionMetadataResult : AWSModel


@end

/**
 
 */
@interface AWSfrauddetectorUpdateDetectorVersionRequest : AWSRequest


/**
 <p>The detector version description. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The parent detector ID for the detector version you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The detector version ID. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorVersionId;

/**
 <p>The Amazon SageMaker model endpoints to include in the detector version.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable externalModelEndpoints;

/**
 <p>The model versions to include in the detector version.</p>
 */
@property (nonatomic, strong) NSArray<AWSfrauddetectorModelVersion *> * _Nullable modelVersions;

/**
 <p>The rule execution mode to add to the detector.</p><p>If you specify <code>FIRST_MATCHED</code>, Amazon Fraud Detector evaluates rules sequentially, first to last, stopping at the first matched rule. Amazon Fraud dectector then provides the outcomes for that single rule.</p><p>If you specifiy <code>ALL_MATCHED</code>, Amazon Fraud Detector evaluates all rules and returns the outcomes for all matched rules. You can define and edit the rule mode at the detector version level, when it is in draft status.</p><p>The default behavior is <code>FIRST_MATCHED</code>.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorRuleExecutionMode ruleExecutionMode;

/**
 <p>The rules to include in the detector version.</p>
 */
@property (nonatomic, strong) NSArray<AWSfrauddetectorRule *> * _Nullable rules;

@end

/**
 
 */
@interface AWSfrauddetectorUpdateDetectorVersionResult : AWSModel


@end

/**
 
 */
@interface AWSfrauddetectorUpdateDetectorVersionStatusRequest : AWSRequest


/**
 <p>The detector ID. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The detector version ID. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorVersionId;

/**
 <p>The new status.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorDetectorVersionStatus status;

@end

/**
 
 */
@interface AWSfrauddetectorUpdateDetectorVersionStatusResult : AWSModel


@end

/**
 
 */
@interface AWSfrauddetectorUpdateModelVersionRequest : AWSRequest


/**
 <p>The model description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The model ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelId;

/**
 <p>The model type.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorModelTypeEnum modelType;

/**
 <p>The model version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelVersionNumber;

/**
 <p>The new model status.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorModelVersionStatus status;

@end

/**
 
 */
@interface AWSfrauddetectorUpdateModelVersionResult : AWSModel


@end

/**
 
 */
@interface AWSfrauddetectorUpdateRuleMetadataRequest : AWSRequest


/**
 <p>The rule description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The rule to update.</p>
 */
@property (nonatomic, strong) AWSfrauddetectorRule * _Nullable rule;

@end

/**
 
 */
@interface AWSfrauddetectorUpdateRuleMetadataResult : AWSModel


@end

/**
 
 */
@interface AWSfrauddetectorUpdateRuleVersionRequest : AWSRequest


/**
 <p>The description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The rule expression.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expression;

/**
 <p>The language.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorLanguage language;

/**
 <p>The outcomes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable outcomes;

/**
 <p>The rule to update.</p>
 */
@property (nonatomic, strong) AWSfrauddetectorRule * _Nullable rule;

@end

/**
 
 */
@interface AWSfrauddetectorUpdateRuleVersionResult : AWSModel


/**
 <p>The new rule version that was created.</p>
 */
@property (nonatomic, strong) AWSfrauddetectorRule * _Nullable rule;

@end

/**
 
 */
@interface AWSfrauddetectorUpdateVariableRequest : AWSRequest


/**
 <p>The new default value of the variable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultValue;

/**
 <p>The new description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the variable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The variable type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable variableType;

@end

/**
 
 */
@interface AWSfrauddetectorUpdateVariableResult : AWSModel


@end

/**
 <p>The variable.</p>
 */
@interface AWSfrauddetectorVariable : AWSModel


/**
 <p>The time when the variable was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdTime;

/**
 <p>The data source of the variable.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorDataSource dataSource;

/**
 <p>The data type of the variable.</p>
 */
@property (nonatomic, assign) AWSfrauddetectorDataType dataType;

/**
 <p>The default value of the variable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultValue;

/**
 <p>The description of the variable. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The time when variable was last updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastUpdatedTime;

/**
 <p>The name of the variable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The variable type of the variable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable variableType;

@end

/**
 <p>The variable entry in a list.</p>
 */
@interface AWSfrauddetectorVariableEntry : AWSModel


/**
 <p>The data source of the variable entry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>The data type of the variable entry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataType;

/**
 <p>The default value of the variable entry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultValue;

/**
 <p>The description of the variable entry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the variable entry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of the variable entry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable variableType;

@end

NS_ASSUME_NONNULL_END
