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

FOUNDATION_EXPORT NSString *const AWSAWSComprehendMedicalErrorDomain;

typedef NS_ENUM(NSInteger, AWSAWSComprehendMedicalErrorType) {
    AWSAWSComprehendMedicalErrorUnknown,
    AWSAWSComprehendMedicalErrorInternalServer,
    AWSAWSComprehendMedicalErrorInvalidEncoding,
    AWSAWSComprehendMedicalErrorInvalidRequest,
    AWSAWSComprehendMedicalErrorResourceNotFound,
    AWSAWSComprehendMedicalErrorServiceUnavailable,
    AWSAWSComprehendMedicalErrorTextSizeLimitExceeded,
    AWSAWSComprehendMedicalErrorTooManyRequests,
    AWSAWSComprehendMedicalErrorValidation,
};

typedef NS_ENUM(NSInteger, AWSAWSComprehendMedicalAttributeName) {
    AWSAWSComprehendMedicalAttributeNameUnknown,
    AWSAWSComprehendMedicalAttributeNameSign,
    AWSAWSComprehendMedicalAttributeNameSymptom,
    AWSAWSComprehendMedicalAttributeNameDiagnosis,
    AWSAWSComprehendMedicalAttributeNameNegation,
};

typedef NS_ENUM(NSInteger, AWSAWSComprehendMedicalEntitySubType) {
    AWSAWSComprehendMedicalEntitySubTypeUnknown,
    AWSAWSComprehendMedicalEntitySubTypeName,
    AWSAWSComprehendMedicalEntitySubTypeDosage,
    AWSAWSComprehendMedicalEntitySubTypeRouteOrMode,
    AWSAWSComprehendMedicalEntitySubTypeForm,
    AWSAWSComprehendMedicalEntitySubTypeFrequency,
    AWSAWSComprehendMedicalEntitySubTypeDuration,
    AWSAWSComprehendMedicalEntitySubTypeGenericName,
    AWSAWSComprehendMedicalEntitySubTypeBrandName,
    AWSAWSComprehendMedicalEntitySubTypeStrength,
    AWSAWSComprehendMedicalEntitySubTypeRate,
    AWSAWSComprehendMedicalEntitySubTypeAcuity,
    AWSAWSComprehendMedicalEntitySubTypeTestName,
    AWSAWSComprehendMedicalEntitySubTypeTestValue,
    AWSAWSComprehendMedicalEntitySubTypeTestUnits,
    AWSAWSComprehendMedicalEntitySubTypeProcedureName,
    AWSAWSComprehendMedicalEntitySubTypeTreatmentName,
    AWSAWSComprehendMedicalEntitySubTypeDate,
    AWSAWSComprehendMedicalEntitySubTypeAge,
    AWSAWSComprehendMedicalEntitySubTypeContactPoint,
    AWSAWSComprehendMedicalEntitySubTypeEmail,
    AWSAWSComprehendMedicalEntitySubTypeIdentifier,
    AWSAWSComprehendMedicalEntitySubTypeUrl,
    AWSAWSComprehendMedicalEntitySubTypeAddress,
    AWSAWSComprehendMedicalEntitySubTypeProfession,
    AWSAWSComprehendMedicalEntitySubTypeSystemOrganSite,
    AWSAWSComprehendMedicalEntitySubTypeDirection,
    AWSAWSComprehendMedicalEntitySubTypeQuality,
    AWSAWSComprehendMedicalEntitySubTypeQuantity,
    AWSAWSComprehendMedicalEntitySubTypeTimeExpression,
    AWSAWSComprehendMedicalEntitySubTypeTimeToMedicationName,
    AWSAWSComprehendMedicalEntitySubTypeTimeToDxName,
    AWSAWSComprehendMedicalEntitySubTypeTimeToTestName,
    AWSAWSComprehendMedicalEntitySubTypeTimeToProcedureName,
    AWSAWSComprehendMedicalEntitySubTypeTimeToTreatmentName,
};

typedef NS_ENUM(NSInteger, AWSAWSComprehendMedicalEntityType) {
    AWSAWSComprehendMedicalEntityTypeUnknown,
    AWSAWSComprehendMedicalEntityTypeMedication,
    AWSAWSComprehendMedicalEntityTypeMedicalCondition,
    AWSAWSComprehendMedicalEntityTypeProtectedHealthInformation,
    AWSAWSComprehendMedicalEntityTypeTestTreatmentProcedure,
    AWSAWSComprehendMedicalEntityTypeAnatomy,
    AWSAWSComprehendMedicalEntityTypeTimeExpression,
};

typedef NS_ENUM(NSInteger, AWSAWSComprehendMedicalICD10CMAttributeType) {
    AWSAWSComprehendMedicalICD10CMAttributeTypeUnknown,
    AWSAWSComprehendMedicalICD10CMAttributeTypeAcuity,
    AWSAWSComprehendMedicalICD10CMAttributeTypeDirection,
    AWSAWSComprehendMedicalICD10CMAttributeTypeSystemOrganSite,
    AWSAWSComprehendMedicalICD10CMAttributeTypeQuality,
    AWSAWSComprehendMedicalICD10CMAttributeTypeQuantity,
};

typedef NS_ENUM(NSInteger, AWSAWSComprehendMedicalICD10CMEntityCategory) {
    AWSAWSComprehendMedicalICD10CMEntityCategoryUnknown,
    AWSAWSComprehendMedicalICD10CMEntityCategoryMedicalCondition,
};

typedef NS_ENUM(NSInteger, AWSAWSComprehendMedicalICD10CMEntityType) {
    AWSAWSComprehendMedicalICD10CMEntityTypeUnknown,
    AWSAWSComprehendMedicalICD10CMEntityTypeDxName,
};

typedef NS_ENUM(NSInteger, AWSAWSComprehendMedicalICD10CMTraitName) {
    AWSAWSComprehendMedicalICD10CMTraitNameUnknown,
    AWSAWSComprehendMedicalICD10CMTraitNameNegation,
    AWSAWSComprehendMedicalICD10CMTraitNameDiagnosis,
    AWSAWSComprehendMedicalICD10CMTraitNameSign,
    AWSAWSComprehendMedicalICD10CMTraitNameSymptom,
};

typedef NS_ENUM(NSInteger, AWSAWSComprehendMedicalJobStatus) {
    AWSAWSComprehendMedicalJobStatusUnknown,
    AWSAWSComprehendMedicalJobStatusSubmitted,
    AWSAWSComprehendMedicalJobStatusInProgress,
    AWSAWSComprehendMedicalJobStatusCompleted,
    AWSAWSComprehendMedicalJobStatusPartialSuccess,
    AWSAWSComprehendMedicalJobStatusFailed,
    AWSAWSComprehendMedicalJobStatusStopRequested,
    AWSAWSComprehendMedicalJobStatusStopped,
};

typedef NS_ENUM(NSInteger, AWSAWSComprehendMedicalLanguageCode) {
    AWSAWSComprehendMedicalLanguageCodeUnknown,
    AWSAWSComprehendMedicalLanguageCodeEn,
};

typedef NS_ENUM(NSInteger, AWSAWSComprehendMedicalRelationshipType) {
    AWSAWSComprehendMedicalRelationshipTypeUnknown,
    AWSAWSComprehendMedicalRelationshipTypeEvery,
    AWSAWSComprehendMedicalRelationshipTypeWithDosage,
    AWSAWSComprehendMedicalRelationshipTypeAdministeredVia,
    AWSAWSComprehendMedicalRelationshipTypeFor,
    AWSAWSComprehendMedicalRelationshipTypeNegative,
    AWSAWSComprehendMedicalRelationshipTypeOverlap,
    AWSAWSComprehendMedicalRelationshipTypeDosage,
    AWSAWSComprehendMedicalRelationshipTypeRouteOrMode,
    AWSAWSComprehendMedicalRelationshipTypeForm,
    AWSAWSComprehendMedicalRelationshipTypeFrequency,
    AWSAWSComprehendMedicalRelationshipTypeDuration,
    AWSAWSComprehendMedicalRelationshipTypeStrength,
    AWSAWSComprehendMedicalRelationshipTypeRate,
    AWSAWSComprehendMedicalRelationshipTypeAcuity,
    AWSAWSComprehendMedicalRelationshipTypeTestValue,
    AWSAWSComprehendMedicalRelationshipTypeTestUnits,
    AWSAWSComprehendMedicalRelationshipTypeDirection,
};

typedef NS_ENUM(NSInteger, AWSAWSComprehendMedicalRxNormAttributeType) {
    AWSAWSComprehendMedicalRxNormAttributeTypeUnknown,
    AWSAWSComprehendMedicalRxNormAttributeTypeDosage,
    AWSAWSComprehendMedicalRxNormAttributeTypeDuration,
    AWSAWSComprehendMedicalRxNormAttributeTypeForm,
    AWSAWSComprehendMedicalRxNormAttributeTypeFrequency,
    AWSAWSComprehendMedicalRxNormAttributeTypeRate,
    AWSAWSComprehendMedicalRxNormAttributeTypeRouteOrMode,
    AWSAWSComprehendMedicalRxNormAttributeTypeStrength,
};

typedef NS_ENUM(NSInteger, AWSAWSComprehendMedicalRxNormEntityCategory) {
    AWSAWSComprehendMedicalRxNormEntityCategoryUnknown,
    AWSAWSComprehendMedicalRxNormEntityCategoryMedication,
};

typedef NS_ENUM(NSInteger, AWSAWSComprehendMedicalRxNormEntityType) {
    AWSAWSComprehendMedicalRxNormEntityTypeUnknown,
    AWSAWSComprehendMedicalRxNormEntityTypeBrandName,
    AWSAWSComprehendMedicalRxNormEntityTypeGenericName,
};

typedef NS_ENUM(NSInteger, AWSAWSComprehendMedicalRxNormTraitName) {
    AWSAWSComprehendMedicalRxNormTraitNameUnknown,
    AWSAWSComprehendMedicalRxNormTraitNameNegation,
};

@class AWSAWSComprehendMedicalAttribute;
@class AWSAWSComprehendMedicalComprehendMedicalAsyncJobFilter;
@class AWSAWSComprehendMedicalComprehendMedicalAsyncJobProperties;
@class AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobRequest;
@class AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobResponse;
@class AWSAWSComprehendMedicalDescribeICD10CMInferenceJobRequest;
@class AWSAWSComprehendMedicalDescribeICD10CMInferenceJobResponse;
@class AWSAWSComprehendMedicalDescribePHIDetectionJobRequest;
@class AWSAWSComprehendMedicalDescribePHIDetectionJobResponse;
@class AWSAWSComprehendMedicalDescribeRxNormInferenceJobRequest;
@class AWSAWSComprehendMedicalDescribeRxNormInferenceJobResponse;
@class AWSAWSComprehendMedicalDetectEntitiesRequest;
@class AWSAWSComprehendMedicalDetectEntitiesResponse;
@class AWSAWSComprehendMedicalDetectEntitiesV2Request;
@class AWSAWSComprehendMedicalDetectEntitiesV2Response;
@class AWSAWSComprehendMedicalDetectPHIRequest;
@class AWSAWSComprehendMedicalDetectPHIResponse;
@class AWSAWSComprehendMedicalEntity;
@class AWSAWSComprehendMedicalICD10CMAttribute;
@class AWSAWSComprehendMedicalICD10CMConcept;
@class AWSAWSComprehendMedicalICD10CMEntity;
@class AWSAWSComprehendMedicalICD10CMTrait;
@class AWSAWSComprehendMedicalInferICD10CMRequest;
@class AWSAWSComprehendMedicalInferICD10CMResponse;
@class AWSAWSComprehendMedicalInferRxNormRequest;
@class AWSAWSComprehendMedicalInferRxNormResponse;
@class AWSAWSComprehendMedicalInputDataConfig;
@class AWSAWSComprehendMedicalListEntitiesDetectionV2JobsRequest;
@class AWSAWSComprehendMedicalListEntitiesDetectionV2JobsResponse;
@class AWSAWSComprehendMedicalListICD10CMInferenceJobsRequest;
@class AWSAWSComprehendMedicalListICD10CMInferenceJobsResponse;
@class AWSAWSComprehendMedicalListPHIDetectionJobsRequest;
@class AWSAWSComprehendMedicalListPHIDetectionJobsResponse;
@class AWSAWSComprehendMedicalListRxNormInferenceJobsRequest;
@class AWSAWSComprehendMedicalListRxNormInferenceJobsResponse;
@class AWSAWSComprehendMedicalOutputDataConfig;
@class AWSAWSComprehendMedicalRxNormAttribute;
@class AWSAWSComprehendMedicalRxNormConcept;
@class AWSAWSComprehendMedicalRxNormEntity;
@class AWSAWSComprehendMedicalRxNormTrait;
@class AWSAWSComprehendMedicalStartEntitiesDetectionV2JobRequest;
@class AWSAWSComprehendMedicalStartEntitiesDetectionV2JobResponse;
@class AWSAWSComprehendMedicalStartICD10CMInferenceJobRequest;
@class AWSAWSComprehendMedicalStartICD10CMInferenceJobResponse;
@class AWSAWSComprehendMedicalStartPHIDetectionJobRequest;
@class AWSAWSComprehendMedicalStartPHIDetectionJobResponse;
@class AWSAWSComprehendMedicalStartRxNormInferenceJobRequest;
@class AWSAWSComprehendMedicalStartRxNormInferenceJobResponse;
@class AWSAWSComprehendMedicalStopEntitiesDetectionV2JobRequest;
@class AWSAWSComprehendMedicalStopEntitiesDetectionV2JobResponse;
@class AWSAWSComprehendMedicalStopICD10CMInferenceJobRequest;
@class AWSAWSComprehendMedicalStopICD10CMInferenceJobResponse;
@class AWSAWSComprehendMedicalStopPHIDetectionJobRequest;
@class AWSAWSComprehendMedicalStopPHIDetectionJobResponse;
@class AWSAWSComprehendMedicalStopRxNormInferenceJobRequest;
@class AWSAWSComprehendMedicalStopRxNormInferenceJobResponse;
@class AWSAWSComprehendMedicalTrait;
@class AWSAWSComprehendMedicalUnmappedAttribute;

/**
 <p> An extracted segment of the text that is an attribute of an entity, or otherwise related to an entity, such as the dosage of a medication taken. It contains information about the attribute such as id, begin and end offset within the input text, and the segment of the input text. </p>
 */
@interface AWSAWSComprehendMedicalAttribute : AWSModel


/**
 <p> The 0-based character offset in the input text that shows where the attribute begins. The offset returns the UTF-8 code point in the string. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable beginOffset;

/**
 <p> The category of attribute. </p>
 */
@property (nonatomic, assign) AWSAWSComprehendMedicalEntityType category;

/**
 <p> The 0-based character offset in the input text that shows where the attribute ends. The offset returns the UTF-8 code point in the string.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endOffset;

/**
 <p> The numeric identifier for this attribute. This is a monotonically increasing id unique within this response rather than a global unique identifier. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable identifier;

/**
 <p> The level of confidence that Amazon Comprehend Medical has that this attribute is correctly related to this entity. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable relationshipScore;

/**
 <p>The type of relationship between the entity and attribute. Type for the relationship is <code>OVERLAP</code>, indicating that the entity occurred at the same time as the <code>Date_Expression</code>. </p>
 */
@property (nonatomic, assign) AWSAWSComprehendMedicalRelationshipType relationshipType;

/**
 <p> The level of confidence that Amazon Comprehend Medical has that the segment of text is correctly recognized as an attribute. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

/**
 <p> The segment of input text extracted as this attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

/**
 <p> Contextual information for this attribute. </p>
 */
@property (nonatomic, strong) NSArray<AWSAWSComprehendMedicalTrait *> * _Nullable traits;

/**
 <p> The type of attribute. </p>
 */
@property (nonatomic, assign) AWSAWSComprehendMedicalEntitySubType types;

@end

/**
 <p>Provides information for filtering a list of detection jobs.</p>
 */
@interface AWSAWSComprehendMedicalComprehendMedicalAsyncJobFilter : AWSModel


/**
 <p>Filters on the name of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>Filters the list of jobs based on job status. Returns only jobs with the specified status.</p>
 */
@property (nonatomic, assign) AWSAWSComprehendMedicalJobStatus jobStatus;

/**
 <p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted after the specified time. Jobs are returned in descending order, newest to oldest.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submitTimeAfter;

/**
 <p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted before the specified time. Jobs are returned in ascending order, oldest to newest.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submitTimeBefore;

@end

/**
 <p>Provides information about a detection job.</p>
 */
@interface AWSAWSComprehendMedicalComprehendMedicalAsyncJobProperties : AWSModel


/**
 <p>The Amazon Resource Name (ARN) that gives Amazon Comprehend Medical read access to your input data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>The time that the detection job completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The date and time that job metadata is deleted from the server. Output files in your S3 bucket will not be deleted. After the metadata is deleted, the job will no longer appear in the results of the <code>ListEntitiesDetectionV2Job</code> or the <code>ListPHIDetectionJobs</code> operation.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expirationTime;

/**
 <p>The input data configuration that you supplied when you created the detection job.</p>
 */
@property (nonatomic, strong) AWSAWSComprehendMedicalInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The identifier assigned to the detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The name that you assigned to the detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The current status of the detection job. If the status is <code>FAILED</code>, the <code>Message</code> field shows the reason for the failure.</p>
 */
@property (nonatomic, assign) AWSAWSComprehendMedicalJobStatus jobStatus;

/**
 <p>The AWS Key Management Service key, if any, used to encrypt the output files. </p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKey;

/**
 <p>The language code of the input documents.</p>
 */
@property (nonatomic, assign) AWSAWSComprehendMedicalLanguageCode languageCode;

/**
 <p>The path to the file that describes the results of a batch job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable manifestFilePath;

/**
 <p>A description of the status of a job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The version of the model used to analyze the documents. The version number looks like X.X.X. You can use this information to track the model used for a particular batch of documents.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelVersion;

/**
 <p>The output data configuration that you supplied when you created the detection job.</p>
 */
@property (nonatomic, strong) AWSAWSComprehendMedicalOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>The time that the detection job was submitted for processing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submitTime;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobRequest : AWSRequest


/**
 <p>The identifier that Amazon Comprehend Medical generated for the job. The <code>StartEntitiesDetectionV2Job</code> operation returns this identifier in its response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobResponse : AWSModel


/**
 <p>An object that contains the properties associated with a detection job.</p>
 */
@property (nonatomic, strong) AWSAWSComprehendMedicalComprehendMedicalAsyncJobProperties * _Nullable comprehendMedicalAsyncJobProperties;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalDescribeICD10CMInferenceJobRequest : AWSRequest


/**
 <p>The identifier that Amazon Comprehend Medical generated for the job. <code>The StartICD10CMInferenceJob</code> operation returns this identifier in its response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalDescribeICD10CMInferenceJobResponse : AWSModel


/**
 <p>An object that contains the properties associated with a detection job.</p>
 */
@property (nonatomic, strong) AWSAWSComprehendMedicalComprehendMedicalAsyncJobProperties * _Nullable comprehendMedicalAsyncJobProperties;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalDescribePHIDetectionJobRequest : AWSRequest


/**
 <p>The identifier that Amazon Comprehend Medical generated for the job. The <code>StartPHIDetectionJob</code> operation returns this identifier in its response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalDescribePHIDetectionJobResponse : AWSModel


/**
 <p>An object that contains the properties associated with a detection job.</p>
 */
@property (nonatomic, strong) AWSAWSComprehendMedicalComprehendMedicalAsyncJobProperties * _Nullable comprehendMedicalAsyncJobProperties;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalDescribeRxNormInferenceJobRequest : AWSRequest


/**
 <p>The identifier that Amazon Comprehend Medical generated for the job. The StartRxNormInferenceJob operation returns this identifier in its response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalDescribeRxNormInferenceJobResponse : AWSModel


/**
 <p>An object that contains the properties associated with a detection job.</p>
 */
@property (nonatomic, strong) AWSAWSComprehendMedicalComprehendMedicalAsyncJobProperties * _Nullable comprehendMedicalAsyncJobProperties;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalDetectEntitiesRequest : AWSRequest


/**
 <p> A UTF-8 text string containing the clinical content being examined for entities. Each string must contain fewer than 20,000 bytes of characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalDetectEntitiesResponse : AWSModel


/**
 <p> The collection of medical entities extracted from the input text and their associated information. For each entity, the response provides the entity text, the entity category, where the entity text begins and ends, and the level of confidence that Amazon Comprehend Medical has in the detection and analysis. Attributes and traits of the entity are also returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSComprehendMedicalEntity *> * _Nullable entities;

/**
 <p>The version of the model used to analyze the documents. The version number looks like X.X.X. You can use this information to track the model used for a particular batch of documents.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelVersion;

/**
 <p> If the result of the previous request to <code>DetectEntities</code> was truncated, include the <code>PaginationToken</code> to fetch the next page of entities.</p>
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

/**
 <p> Attributes extracted from the input text that we were unable to relate to an entity.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSComprehendMedicalUnmappedAttribute *> * _Nullable unmappedAttributes;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalDetectEntitiesV2Request : AWSRequest


/**
 <p>A UTF-8 string containing the clinical content being examined for entities. Each string must contain fewer than 20,000 bytes of characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalDetectEntitiesV2Response : AWSModel


/**
 <p>The collection of medical entities extracted from the input text and their associated information. For each entity, the response provides the entity text, the entity category, where the entity text begins and ends, and the level of confidence in the detection and analysis. Attributes and traits of the entity are also returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSComprehendMedicalEntity *> * _Nullable entities;

/**
 <p>The version of the model used to analyze the documents. The version number looks like X.X.X. You can use this information to track the model used for a particular batch of documents.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelVersion;

/**
 <p>If the result to the <code>DetectEntitiesV2</code> operation was truncated, include the <code>PaginationToken</code> to fetch the next page of entities.</p>
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

/**
 <p>Attributes extracted from the input text that couldn't be related to an entity.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSComprehendMedicalUnmappedAttribute *> * _Nullable unmappedAttributes;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalDetectPHIRequest : AWSRequest


/**
 <p> A UTF-8 text string containing the clinical content being examined for PHI entities. Each string must contain fewer than 20,000 bytes of characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalDetectPHIResponse : AWSModel


/**
 <p> The collection of PHI entities extracted from the input text and their associated information. For each entity, the response provides the entity text, the entity category, where the entity text begins and ends, and the level of confidence that Amazon Comprehend Medical has in its detection. </p>
 */
@property (nonatomic, strong) NSArray<AWSAWSComprehendMedicalEntity *> * _Nullable entities;

/**
 <p>The version of the model used to analyze the documents. The version number looks like X.X.X. You can use this information to track the model used for a particular batch of documents.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelVersion;

/**
 <p> If the result of the previous request to <code>DetectPHI</code> was truncated, include the <code>PaginationToken</code> to fetch the next page of PHI entities. </p>
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

@end

/**
 <p> Provides information about an extracted medical entity.</p>
 */
@interface AWSAWSComprehendMedicalEntity : AWSModel


/**
 <p> The extracted attributes that relate to this entity.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSComprehendMedicalAttribute *> * _Nullable attributes;

/**
 <p> The 0-based character offset in the input text that shows where the entity begins. The offset returns the UTF-8 code point in the string. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable beginOffset;

/**
 <p> The category of the entity.</p>
 */
@property (nonatomic, assign) AWSAWSComprehendMedicalEntityType category;

/**
 <p> The 0-based character offset in the input text that shows where the entity ends. The offset returns the UTF-8 code point in the string. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endOffset;

/**
 <p> The numeric identifier for the entity. This is a monotonically increasing id unique within this response rather than a global unique identifier. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable identifier;

/**
 <p>The level of confidence that Amazon Comprehend Medical has in the accuracy of the detection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

/**
 <p> The segment of input text extracted as this entity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

/**
 <p>Contextual information for the entity.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSComprehendMedicalTrait *> * _Nullable traits;

/**
 <p> Describes the specific type of entity with category of entities.</p>
 */
@property (nonatomic, assign) AWSAWSComprehendMedicalEntitySubType types;

@end

/**
 <p>The detected attributes that relate to an entity. This includes an extracted segment of the text that is an attribute of an entity, or otherwise related to an entity. InferICD10CM detects the following attributes: <code>Direction</code>, <code>System, Organ or Site</code>, and <code>Acuity</code>.</p>
 */
@interface AWSAWSComprehendMedicalICD10CMAttribute : AWSModel


/**
 <p>The 0-based character offset in the input text that shows where the attribute begins. The offset returns the UTF-8 code point in the string.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable beginOffset;

/**
 <p>The 0-based character offset in the input text that shows where the attribute ends. The offset returns the UTF-8 code point in the string.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endOffset;

/**
 <p>The numeric identifier for this attribute. This is a monotonically increasing id unique within this response rather than a global unique identifier.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable identifier;

/**
 <p>The level of confidence that Amazon Comprehend Medical has that this attribute is correctly related to this entity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable relationshipScore;

/**
 <p>The level of confidence that Amazon Comprehend Medical has that the segment of text is correctly recognized as an attribute.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

/**
 <p>The segment of input text which contains the detected attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

/**
 <p>The contextual information for the attribute. The traits recognized by InferICD10CM are <code>DIAGNOSIS</code>, <code>SIGN</code>, <code>SYMPTOM</code>, and <code>NEGATION</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSComprehendMedicalICD10CMTrait *> * _Nullable traits;

/**
 <p>The type of attribute. InferICD10CM detects entities of the type <code>DX_NAME</code>. </p>
 */
@property (nonatomic, assign) AWSAWSComprehendMedicalICD10CMAttributeType types;

@end

/**
 <p> The ICD-10-CM concepts that the entity could refer to, along with a score indicating the likelihood of the match.</p>
 */
@interface AWSAWSComprehendMedicalICD10CMConcept : AWSModel


/**
 <p>The ICD-10-CM code that identifies the concept found in the knowledge base from the Centers for Disease Control.</p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>The long description of the ICD-10-CM code in the ontology.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The level of confidence that Amazon Comprehend Medical has that the entity is accurately linked to an ICD-10-CM concept.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

@end

/**
 <p>The collection of medical entities extracted from the input text and their associated information. For each entity, the response provides the entity text, the entity category, where the entity text begins and ends, and the level of confidence that Amazon Comprehend Medical has in the detection and analysis. Attributes and traits of the entity are also returned. </p>
 */
@interface AWSAWSComprehendMedicalICD10CMEntity : AWSModel


/**
 <p>The detected attributes that relate to the entity. An extracted segment of the text that is an attribute of an entity, or otherwise related to an entity, such as the nature of a medical condition.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSComprehendMedicalICD10CMAttribute *> * _Nullable attributes;

/**
 <p>The 0-based character offset in the input text that shows where the entity begins. The offset returns the UTF-8 code point in the string.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable beginOffset;

/**
 <p> The category of the entity. InferICD10CM detects entities in the <code>MEDICAL_CONDITION</code> category. </p>
 */
@property (nonatomic, assign) AWSAWSComprehendMedicalICD10CMEntityCategory category;

/**
 <p>The 0-based character offset in the input text that shows where the entity ends. The offset returns the UTF-8 code point in the string.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endOffset;

/**
 <p>The ICD-10-CM concepts that the entity could refer to, along with a score indicating the likelihood of the match.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSComprehendMedicalICD10CMConcept *> * _Nullable ICD10CMConcepts;

/**
 <p>The numeric identifier for the entity. This is a monotonically increasing id unique within this response rather than a global unique identifier.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable identifier;

/**
 <p>The level of confidence that Amazon Comprehend Medical has in the accuracy of the detection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

/**
 <p>The segment of input text that is matched to the detected entity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

/**
 <p>Provides Contextual information for the entity. The traits recognized by InferICD10CM are <code>DIAGNOSIS</code>, <code>SIGN</code>, <code>SYMPTOM</code>, and <code>NEGATION.</code></p>
 */
@property (nonatomic, strong) NSArray<AWSAWSComprehendMedicalICD10CMTrait *> * _Nullable traits;

/**
 <p>Describes the specific type of entity with category of entities. InferICD10CM detects entities of the type <code>DX_NAME</code>.</p>
 */
@property (nonatomic, assign) AWSAWSComprehendMedicalICD10CMEntityType types;

@end

/**
 <p>Contextual information for the entity. The traits recognized by InferICD10CM are <code>DIAGNOSIS</code>, <code>SIGN</code>, <code>SYMPTOM</code>, and <code>NEGATION</code>.</p>
 */
@interface AWSAWSComprehendMedicalICD10CMTrait : AWSModel


/**
 <p>Provides a name or contextual description about the trait.</p>
 */
@property (nonatomic, assign) AWSAWSComprehendMedicalICD10CMTraitName name;

/**
 <p>The level of confidence that Amazon Comprehend Medical has that the segment of text is correctly recognized as a trait.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalInferICD10CMRequest : AWSRequest


/**
 <p>The input text used for analysis. The input for InferICD10CM is a string from 1 to 10000 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalInferICD10CMResponse : AWSModel


/**
 <p>The medical conditions detected in the text linked to ICD-10-CM concepts. If the action is successful, the service sends back an HTTP 200 response, as well as the entities detected.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSComprehendMedicalICD10CMEntity *> * _Nullable entities;

/**
 <p>The version of the model used to analyze the documents, in the format <i>n</i>.<i>n</i>.<i>n</i> You can use this information to track the model used for a particular batch of documents.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelVersion;

/**
 <p>If the result of the previous request to <code>InferICD10CM</code> was truncated, include the <code>PaginationToken</code> to fetch the next page of medical condition entities. </p>
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalInferRxNormRequest : AWSRequest


/**
 <p>The input text used for analysis. The input for InferRxNorm is a string from 1 to 10000 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalInferRxNormResponse : AWSModel


/**
 <p>The medication entities detected in the text linked to RxNorm concepts. If the action is successful, the service sends back an HTTP 200 response, as well as the entities detected.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSComprehendMedicalRxNormEntity *> * _Nullable entities;

/**
 <p>The version of the model used to analyze the documents, in the format <i>n</i>.<i>n</i>.<i>n</i> You can use this information to track the model used for a particular batch of documents.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelVersion;

/**
 <p>If the result of the previous request to <code>InferRxNorm</code> was truncated, include the <code>PaginationToken</code> to fetch the next page of medication entities.</p>
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

@end

/**
 <p>The input properties for an entities detection job. This includes the name of the S3 bucket and the path to the files to be analyzed. See <a>batch-manifest</a> for more information. </p>
 Required parameters: [S3Bucket]
 */
@interface AWSAWSComprehendMedicalInputDataConfig : AWSModel


/**
 <p>The URI of the S3 bucket that contains the input data. The bucket must be in the same region as the API endpoint that you are calling.</p><p>Each file in the document collection must be less than 40 KB. You can store a maximum of 30 GB in the bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Bucket;

/**
 <p>The path to the input data files in the S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Key;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalListEntitiesDetectionV2JobsRequest : AWSRequest


/**
 <p>Filters the jobs that are returned. You can filter jobs based on their names, status, or the date and time that they were submitted. You can only set one filter at a time.</p>
 */
@property (nonatomic, strong) AWSAWSComprehendMedicalComprehendMedicalAsyncJobFilter * _Nullable filter;

/**
 <p>The maximum number of results to return in each page. The default is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalListEntitiesDetectionV2JobsResponse : AWSModel


/**
 <p>A list containing the properties of each job returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSComprehendMedicalComprehendMedicalAsyncJobProperties *> * _Nullable comprehendMedicalAsyncJobPropertiesList;

/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalListICD10CMInferenceJobsRequest : AWSRequest


/**
 <p>Filters the jobs that are returned. You can filter jobs based on their names, status, or the date and time that they were submitted. You can only set one filter at a time.</p>
 */
@property (nonatomic, strong) AWSAWSComprehendMedicalComprehendMedicalAsyncJobFilter * _Nullable filter;

/**
 <p>The maximum number of results to return in each page. The default is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalListICD10CMInferenceJobsResponse : AWSModel


/**
 <p>A list containing the properties of each job that is returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSComprehendMedicalComprehendMedicalAsyncJobProperties *> * _Nullable comprehendMedicalAsyncJobPropertiesList;

/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalListPHIDetectionJobsRequest : AWSRequest


/**
 <p>Filters the jobs that are returned. You can filter jobs based on their names, status, or the date and time that they were submitted. You can only set one filter at a time.</p>
 */
@property (nonatomic, strong) AWSAWSComprehendMedicalComprehendMedicalAsyncJobFilter * _Nullable filter;

/**
 <p>The maximum number of results to return in each page. The default is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalListPHIDetectionJobsResponse : AWSModel


/**
 <p>A list containing the properties of each job returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSComprehendMedicalComprehendMedicalAsyncJobProperties *> * _Nullable comprehendMedicalAsyncJobPropertiesList;

/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalListRxNormInferenceJobsRequest : AWSRequest


/**
 <p>Filters the jobs that are returned. You can filter jobs based on their names, status, or the date and time that they were submitted. You can only set one filter at a time.</p>
 */
@property (nonatomic, strong) AWSAWSComprehendMedicalComprehendMedicalAsyncJobFilter * _Nullable filter;

/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalListRxNormInferenceJobsResponse : AWSModel


/**
 <p>The maximum number of results to return in each page. The default is 100.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSComprehendMedicalComprehendMedicalAsyncJobProperties *> * _Nullable comprehendMedicalAsyncJobPropertiesList;

/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>The output properties for a detection job.</p>
 Required parameters: [S3Bucket]
 */
@interface AWSAWSComprehendMedicalOutputDataConfig : AWSModel


/**
 <p>When you use the <code>OutputDataConfig</code> object with asynchronous operations, you specify the Amazon S3 location where you want to write the output data. The URI must be in the same region as the API endpoint that you are calling. The location is used as the prefix for the actual location of the output.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Bucket;

/**
 <p>The path to the output data files in the S3 bucket. Amazon Comprehend Medical creates an output directory using the job ID so that the output from one job does not overwrite the output of another.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Key;

@end

/**
 <p>The extracted attributes that relate to this entity. The attributes recognized by InferRxNorm are <code>DOSAGE</code>, <code>DURATION</code>, <code>FORM</code>, <code>FREQUENCY</code>, <code>RATE</code>, <code>ROUTE_OR_MODE</code>.</p>
 */
@interface AWSAWSComprehendMedicalRxNormAttribute : AWSModel


/**
 <p>The 0-based character offset in the input text that shows where the attribute begins. The offset returns the UTF-8 code point in the string.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable beginOffset;

/**
 <p>The 0-based character offset in the input text that shows where the attribute ends. The offset returns the UTF-8 code point in the string.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endOffset;

/**
 <p>The numeric identifier for this attribute. This is a monotonically increasing id unique within this response rather than a global unique identifier.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable identifier;

/**
 <p>The level of confidence that Amazon Comprehend Medical has that the attribute is accurately linked to an entity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable relationshipScore;

/**
 <p>The level of confidence that Comprehend Medical has that the segment of text is correctly recognized as an attribute.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

/**
 <p>The segment of input text which corresponds to the detected attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

/**
 <p>Contextual information for the attribute. InferRxNorm recognizes the trait <code>NEGATION</code> for attributes, i.e. that the patient is not taking a specific dose or form of a medication.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSComprehendMedicalRxNormTrait *> * _Nullable traits;

/**
 <p>The type of attribute. The types of attributes recognized by InferRxNorm are <code>BRAND_NAME</code> and <code>GENERIC_NAME</code>.</p>
 */
@property (nonatomic, assign) AWSAWSComprehendMedicalRxNormAttributeType types;

@end

/**
 <p>The RxNorm concept that the entity could refer to, along with a score indicating the likelihood of the match.</p>
 */
@interface AWSAWSComprehendMedicalRxNormConcept : AWSModel


/**
 <p>RxNorm concept ID, also known as the RxCUI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>The description of the RxNorm concept.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The level of confidence that Amazon Comprehend Medical has that the entity is accurately linked to the reported RxNorm concept.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

@end

/**
 <p>The collection of medical entities extracted from the input text and their associated information. For each entity, the response provides the entity text, the entity category, where the entity text begins and ends, and the level of confidence that Amazon Comprehend Medical has in the detection and analysis. Attributes and traits of the entity are also returned. </p>
 */
@interface AWSAWSComprehendMedicalRxNormEntity : AWSModel


/**
 <p>The extracted attributes that relate to the entity. The attributes recognized by InferRxNorm are <code>DOSAGE</code>, <code>DURATION</code>, <code>FORM</code>, <code>FREQUENCY</code>, <code>RATE</code>, <code>ROUTE_OR_MODE</code>, and <code>STRENGTH</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSComprehendMedicalRxNormAttribute *> * _Nullable attributes;

/**
 <p>The 0-based character offset in the input text that shows where the entity begins. The offset returns the UTF-8 code point in the string.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable beginOffset;

/**
 <p>The category of the entity. The recognized categories are <code>GENERIC</code> or <code>BRAND_NAME</code>.</p>
 */
@property (nonatomic, assign) AWSAWSComprehendMedicalRxNormEntityCategory category;

/**
 <p>The 0-based character offset in the input text that shows where the entity ends. The offset returns the UTF-8 code point in the string.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endOffset;

/**
 <p>The numeric identifier for the entity. This is a monotonically increasing id unique within this response rather than a global unique identifier.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable identifier;

/**
 <p> The RxNorm concepts that the entity could refer to, along with a score indicating the likelihood of the match.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSComprehendMedicalRxNormConcept *> * _Nullable rxNormConcepts;

/**
 <p>The level of confidence that Amazon Comprehend Medical has in the accuracy of the detected entity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

/**
 <p>The segment of input text extracted from which the entity was detected.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

/**
 <p> Contextual information for the entity.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSComprehendMedicalRxNormTrait *> * _Nullable traits;

/**
 <p> Describes the specific type of entity. For InferRxNorm, the recognized entity type is <code>MEDICATION</code>.</p>
 */
@property (nonatomic, assign) AWSAWSComprehendMedicalRxNormEntityType types;

@end

/**
 <p>The contextual information for the entity. InferRxNorm recognizes the trait <code>NEGATION</code>, which is any indication that the patient is not taking a medication. </p>
 */
@interface AWSAWSComprehendMedicalRxNormTrait : AWSModel


/**
 <p>Provides a name or contextual description about the trait.</p>
 */
@property (nonatomic, assign) AWSAWSComprehendMedicalRxNormTraitName name;

/**
 <p>The level of confidence that Amazon Comprehend Medical has in the accuracy of the detected trait.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalStartEntitiesDetectionV2JobRequest : AWSRequest


/**
 <p>A unique identifier for the request. If you don't set the client request token, Amazon Comprehend Medical generates one.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend Medical read access to your input data. For more information, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions-med.html#auth-role-permissions-med"> Role-Based Permissions Required for Asynchronous Operations</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>Specifies the format and location of the input data for the job.</p>
 */
@property (nonatomic, strong) AWSAWSComprehendMedicalInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The identifier of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>An AWS Key Management Service key to encrypt your output files. If you do not specify a key, the files are written in plain text.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKey;

/**
 <p>The language of the input documents. All documents must be in the same language.</p>
 */
@property (nonatomic, assign) AWSAWSComprehendMedicalLanguageCode languageCode;

/**
 <p>Specifies where to send the output files.</p>
 */
@property (nonatomic, strong) AWSAWSComprehendMedicalOutputDataConfig * _Nullable outputDataConfig;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalStartEntitiesDetectionV2JobResponse : AWSModel


/**
 <p>The identifier generated for the job. To get the status of a job, use this identifier with the <code>DescribeEntitiesDetectionV2Job</code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalStartICD10CMInferenceJobRequest : AWSRequest


/**
 <p>A unique identifier for the request. If you don't set the client request token, Amazon Comprehend Medical generates one.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend Medical read access to your input data. For more information, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions-med.html#auth-role-permissions-med"> Role-Based Permissions Required for Asynchronous Operations</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>Specifies the format and location of the input data for the job.</p>
 */
@property (nonatomic, strong) AWSAWSComprehendMedicalInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The identifier of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>An AWS Key Management Service key to encrypt your output files. If you do not specify a key, the files are written in plain text.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKey;

/**
 <p>The language of the input documents. All documents must be in the same language.</p>
 */
@property (nonatomic, assign) AWSAWSComprehendMedicalLanguageCode languageCode;

/**
 <p>Specifies where to send the output files.</p>
 */
@property (nonatomic, strong) AWSAWSComprehendMedicalOutputDataConfig * _Nullable outputDataConfig;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalStartICD10CMInferenceJobResponse : AWSModel


/**
 <p>The identifier generated for the job. To get the status of a job, use this identifier with the <code>StartICD10CMInferenceJob</code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalStartPHIDetectionJobRequest : AWSRequest


/**
 <p>A unique identifier for the request. If you don't set the client request token, Amazon Comprehend Medical generates one.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend Medical read access to your input data. For more information, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions-med.html#auth-role-permissions-med"> Role-Based Permissions Required for Asynchronous Operations</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>Specifies the format and location of the input data for the job.</p>
 */
@property (nonatomic, strong) AWSAWSComprehendMedicalInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The identifier of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>An AWS Key Management Service key to encrypt your output files. If you do not specify a key, the files are written in plain text.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKey;

/**
 <p>The language of the input documents. All documents must be in the same language.</p>
 */
@property (nonatomic, assign) AWSAWSComprehendMedicalLanguageCode languageCode;

/**
 <p>Specifies where to send the output files.</p>
 */
@property (nonatomic, strong) AWSAWSComprehendMedicalOutputDataConfig * _Nullable outputDataConfig;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalStartPHIDetectionJobResponse : AWSModel


/**
 <p>The identifier generated for the job. To get the status of a job, use this identifier with the <code>DescribePHIDetectionJob</code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalStartRxNormInferenceJobRequest : AWSRequest


/**
 <p>A unique identifier for the request. If you don't set the client request token, Amazon Comprehend Medical generates one.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend Medical read access to your input data. For more information, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions-med.html#auth-role-permissions-med"> Role-Based Permissions Required for Asynchronous Operations</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>Specifies the format and location of the input data for the job.</p>
 */
@property (nonatomic, strong) AWSAWSComprehendMedicalInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The identifier of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>An AWS Key Management Service key to encrypt your output files. If you do not specify a key, the files are written in plain text.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKey;

/**
 <p>The language of the input documents. All documents must be in the same language.</p>
 */
@property (nonatomic, assign) AWSAWSComprehendMedicalLanguageCode languageCode;

/**
 <p>Specifies where to send the output files.</p>
 */
@property (nonatomic, strong) AWSAWSComprehendMedicalOutputDataConfig * _Nullable outputDataConfig;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalStartRxNormInferenceJobResponse : AWSModel


/**
 <p>The identifier of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalStopEntitiesDetectionV2JobRequest : AWSRequest


/**
 <p>The identifier of the medical entities job to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalStopEntitiesDetectionV2JobResponse : AWSModel


/**
 <p>The identifier of the medical entities detection job that was stopped.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalStopICD10CMInferenceJobRequest : AWSRequest


/**
 <p>The identifier of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalStopICD10CMInferenceJobResponse : AWSModel


/**
 <p>The identifier generated for the job. To get the status of job, use this identifier with the <code>DescribeICD10CMInferenceJob</code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalStopPHIDetectionJobRequest : AWSRequest


/**
 <p>The identifier of the PHI detection job to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalStopPHIDetectionJobResponse : AWSModel


/**
 <p>The identifier of the PHI detection job that was stopped.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalStopRxNormInferenceJobRequest : AWSRequest


/**
 <p>The identifier of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSAWSComprehendMedicalStopRxNormInferenceJobResponse : AWSModel


/**
 <p>The identifier generated for the job. To get the status of job, use this identifier with the <code>DescribeRxNormInferenceJob</code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 <p> Provides contextual information about the extracted entity. </p>
 */
@interface AWSAWSComprehendMedicalTrait : AWSModel


/**
 <p> Provides a name or contextual description about the trait. </p>
 */
@property (nonatomic, assign) AWSAWSComprehendMedicalAttributeName name;

/**
 <p> The level of confidence that Amazon Comprehend Medical has in the accuracy of this trait.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

@end

/**
 <p> An attribute that we extracted, but were unable to relate to an entity. </p>
 */
@interface AWSAWSComprehendMedicalUnmappedAttribute : AWSModel


/**
 <p> The specific attribute that has been extracted but not mapped to an entity. </p>
 */
@property (nonatomic, strong) AWSAWSComprehendMedicalAttribute * _Nullable attribute;

/**
 <p> The type of the attribute, could be one of the following values: "MEDICATION", "MEDICAL_CONDITION", "ANATOMY", "TEST_AND_TREATMENT_PROCEDURE" or "PROTECTED_HEALTH_INFORMATION". </p>
 */
@property (nonatomic, assign) AWSAWSComprehendMedicalEntityType types;

@end

NS_ASSUME_NONNULL_END
