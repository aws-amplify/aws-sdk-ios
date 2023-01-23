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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSComprehendErrorDomain;

typedef NS_ENUM(NSInteger, AWSComprehendErrorType) {
    AWSComprehendErrorUnknown,
    AWSComprehendErrorBatchSizeLimitExceeded,
    AWSComprehendErrorConcurrentModification,
    AWSComprehendErrorInternalServer,
    AWSComprehendErrorInvalidFilter,
    AWSComprehendErrorInvalidRequest,
    AWSComprehendErrorJobNotFound,
    AWSComprehendErrorKmsKeyValidation,
    AWSComprehendErrorResourceInUse,
    AWSComprehendErrorResourceLimitExceeded,
    AWSComprehendErrorResourceNotFound,
    AWSComprehendErrorResourceUnavailable,
    AWSComprehendErrorTextSizeLimitExceeded,
    AWSComprehendErrorTooManyRequests,
    AWSComprehendErrorTooManyTagKeys,
    AWSComprehendErrorTooManyTags,
    AWSComprehendErrorUnsupportedLanguage,
};

typedef NS_ENUM(NSInteger, AWSComprehendAugmentedManifestsDocumentTypeFormat) {
    AWSComprehendAugmentedManifestsDocumentTypeFormatUnknown,
    AWSComprehendAugmentedManifestsDocumentTypeFormatPlainTextDocument,
    AWSComprehendAugmentedManifestsDocumentTypeFormatSemiStructuredDocument,
};

typedef NS_ENUM(NSInteger, AWSComprehendBlockType) {
    AWSComprehendBlockTypeUnknown,
    AWSComprehendBlockTypeLine,
    AWSComprehendBlockTypeWord,
};

typedef NS_ENUM(NSInteger, AWSComprehendDocumentClassifierDataFormat) {
    AWSComprehendDocumentClassifierDataFormatUnknown,
    AWSComprehendDocumentClassifierDataFormatComprehendCsv,
    AWSComprehendDocumentClassifierDataFormatAugmentedManifest,
};

typedef NS_ENUM(NSInteger, AWSComprehendDocumentClassifierMode) {
    AWSComprehendDocumentClassifierModeUnknown,
    AWSComprehendDocumentClassifierModeMultiClass,
    AWSComprehendDocumentClassifierModeMultiLabel,
};

typedef NS_ENUM(NSInteger, AWSComprehendDocumentReadAction) {
    AWSComprehendDocumentReadActionUnknown,
    AWSComprehendDocumentReadActionTextractDetectDocumentText,
    AWSComprehendDocumentReadActionTextractAnalyzeDocument,
};

typedef NS_ENUM(NSInteger, AWSComprehendDocumentReadFeatureTypes) {
    AWSComprehendDocumentReadFeatureTypesUnknown,
    AWSComprehendDocumentReadFeatureTypesTables,
    AWSComprehendDocumentReadFeatureTypesForms,
};

typedef NS_ENUM(NSInteger, AWSComprehendDocumentReadMode) {
    AWSComprehendDocumentReadModeUnknown,
    AWSComprehendDocumentReadModeServiceDefault,
    AWSComprehendDocumentReadModeForceDocumentReadAction,
};

typedef NS_ENUM(NSInteger, AWSComprehendDocumentType) {
    AWSComprehendDocumentTypeUnknown,
    AWSComprehendDocumentTypeNativePdf,
    AWSComprehendDocumentTypeScannedPdf,
    AWSComprehendDocumentTypeMsWord,
    AWSComprehendDocumentTypeImage,
    AWSComprehendDocumentTypePlainText,
    AWSComprehendDocumentTypeTextractDetectDocumentTextJson,
    AWSComprehendDocumentTypeTextractAnalyzeDocumentJson,
};

typedef NS_ENUM(NSInteger, AWSComprehendEndpointStatus) {
    AWSComprehendEndpointStatusUnknown,
    AWSComprehendEndpointStatusCreating,
    AWSComprehendEndpointStatusDeleting,
    AWSComprehendEndpointStatusFailed,
    AWSComprehendEndpointStatusInService,
    AWSComprehendEndpointStatusUpdating,
};

typedef NS_ENUM(NSInteger, AWSComprehendEntityRecognizerDataFormat) {
    AWSComprehendEntityRecognizerDataFormatUnknown,
    AWSComprehendEntityRecognizerDataFormatComprehendCsv,
    AWSComprehendEntityRecognizerDataFormatAugmentedManifest,
};

typedef NS_ENUM(NSInteger, AWSComprehendEntityType) {
    AWSComprehendEntityTypeUnknown,
    AWSComprehendEntityTypePerson,
    AWSComprehendEntityTypeLocation,
    AWSComprehendEntityTypeOrganization,
    AWSComprehendEntityTypeCommercialItem,
    AWSComprehendEntityTypeEvent,
    AWSComprehendEntityTypeDate,
    AWSComprehendEntityTypeQuantity,
    AWSComprehendEntityTypeTitle,
    AWSComprehendEntityTypeOther,
};

typedef NS_ENUM(NSInteger, AWSComprehendInputFormat) {
    AWSComprehendInputFormatUnknown,
    AWSComprehendInputFormatOneDocPerFile,
    AWSComprehendInputFormatOneDocPerLine,
};

typedef NS_ENUM(NSInteger, AWSComprehendInvalidRequestDetailReason) {
    AWSComprehendInvalidRequestDetailReasonUnknown,
    AWSComprehendInvalidRequestDetailReasonDocumentSizeExceeded,
    AWSComprehendInvalidRequestDetailReasonUnsupportedDocType,
    AWSComprehendInvalidRequestDetailReasonPageLimitExceeded,
    AWSComprehendInvalidRequestDetailReasonTextractAccessDenied,
};

typedef NS_ENUM(NSInteger, AWSComprehendInvalidRequestReason) {
    AWSComprehendInvalidRequestReasonUnknown,
    AWSComprehendInvalidRequestReasonInvalidDocument,
};

typedef NS_ENUM(NSInteger, AWSComprehendJobStatus) {
    AWSComprehendJobStatusUnknown,
    AWSComprehendJobStatusSubmitted,
    AWSComprehendJobStatusInProgress,
    AWSComprehendJobStatusCompleted,
    AWSComprehendJobStatusFailed,
    AWSComprehendJobStatusStopRequested,
    AWSComprehendJobStatusStopped,
};

typedef NS_ENUM(NSInteger, AWSComprehendLanguageCode) {
    AWSComprehendLanguageCodeUnknown,
    AWSComprehendLanguageCodeEn,
    AWSComprehendLanguageCodeEs,
    AWSComprehendLanguageCodeFr,
    AWSComprehendLanguageCodeDe,
    AWSComprehendLanguageCodeIt,
    AWSComprehendLanguageCodePt,
    AWSComprehendLanguageCodeAr,
    AWSComprehendLanguageCodeHi,
    AWSComprehendLanguageCodeJa,
    AWSComprehendLanguageCodeKo,
    AWSComprehendLanguageCodeZh,
    AWSComprehendLanguageCodeZhTW,
};

typedef NS_ENUM(NSInteger, AWSComprehendModelStatus) {
    AWSComprehendModelStatusUnknown,
    AWSComprehendModelStatusSubmitted,
    AWSComprehendModelStatusTraining,
    AWSComprehendModelStatusDeleting,
    AWSComprehendModelStatusStopRequested,
    AWSComprehendModelStatusStopped,
    AWSComprehendModelStatusInError,
    AWSComprehendModelStatusTrained,
};

typedef NS_ENUM(NSInteger, AWSComprehendPageBasedErrorCode) {
    AWSComprehendPageBasedErrorCodeUnknown,
    AWSComprehendPageBasedErrorCodeTextractBadPage,
    AWSComprehendPageBasedErrorCodeTextractProvisionedThroughputExceeded,
    AWSComprehendPageBasedErrorCodePageCharactersExceeded,
    AWSComprehendPageBasedErrorCodePageSizeExceeded,
    AWSComprehendPageBasedErrorCodeInternalServerError,
};

typedef NS_ENUM(NSInteger, AWSComprehendPartOfSpeechTagType) {
    AWSComprehendPartOfSpeechTagTypeUnknown,
    AWSComprehendPartOfSpeechTagTypeAdj,
    AWSComprehendPartOfSpeechTagTypeAdp,
    AWSComprehendPartOfSpeechTagTypeAdv,
    AWSComprehendPartOfSpeechTagTypeAux,
    AWSComprehendPartOfSpeechTagTypeConj,
    AWSComprehendPartOfSpeechTagTypeCconj,
    AWSComprehendPartOfSpeechTagTypeDet,
    AWSComprehendPartOfSpeechTagTypeIntj,
    AWSComprehendPartOfSpeechTagTypeNoun,
    AWSComprehendPartOfSpeechTagTypeNum,
    AWSComprehendPartOfSpeechTagTypeO,
    AWSComprehendPartOfSpeechTagTypePart,
    AWSComprehendPartOfSpeechTagTypePron,
    AWSComprehendPartOfSpeechTagTypePropn,
    AWSComprehendPartOfSpeechTagTypePunct,
    AWSComprehendPartOfSpeechTagTypeSconj,
    AWSComprehendPartOfSpeechTagTypeSym,
    AWSComprehendPartOfSpeechTagTypeVerb,
};

typedef NS_ENUM(NSInteger, AWSComprehendPiiEntitiesDetectionMaskMode) {
    AWSComprehendPiiEntitiesDetectionMaskModeUnknown,
    AWSComprehendPiiEntitiesDetectionMaskModeMask,
    AWSComprehendPiiEntitiesDetectionMaskModeReplaceWithPiiEntityType,
};

typedef NS_ENUM(NSInteger, AWSComprehendPiiEntitiesDetectionMode) {
    AWSComprehendPiiEntitiesDetectionModeUnknown,
    AWSComprehendPiiEntitiesDetectionModeOnlyRedaction,
    AWSComprehendPiiEntitiesDetectionModeOnlyOffsets,
};

typedef NS_ENUM(NSInteger, AWSComprehendPiiEntityType) {
    AWSComprehendPiiEntityTypeUnknown,
    AWSComprehendPiiEntityTypeBankAccountNumber,
    AWSComprehendPiiEntityTypeBankRouting,
    AWSComprehendPiiEntityTypeCreditDebitNumber,
    AWSComprehendPiiEntityTypeCreditDebitCvv,
    AWSComprehendPiiEntityTypeCreditDebitExpiry,
    AWSComprehendPiiEntityTypePin,
    AWSComprehendPiiEntityTypeEmail,
    AWSComprehendPiiEntityTypeAddress,
    AWSComprehendPiiEntityTypeName,
    AWSComprehendPiiEntityTypePhone,
    AWSComprehendPiiEntityTypeSsn,
    AWSComprehendPiiEntityTypeDateTime,
    AWSComprehendPiiEntityTypePassportNumber,
    AWSComprehendPiiEntityTypeDriverId,
    AWSComprehendPiiEntityTypeUrl,
    AWSComprehendPiiEntityTypeAge,
    AWSComprehendPiiEntityTypeUsername,
    AWSComprehendPiiEntityTypePassword,
    AWSComprehendPiiEntityTypeAwsAccessKey,
    AWSComprehendPiiEntityTypeAwsSecretKey,
    AWSComprehendPiiEntityTypeIpAddress,
    AWSComprehendPiiEntityTypeMacAddress,
    AWSComprehendPiiEntityTypeAll,
    AWSComprehendPiiEntityTypeLicensePlate,
    AWSComprehendPiiEntityTypeVehicleIdentificationNumber,
    AWSComprehendPiiEntityTypeUkNationalInsuranceNumber,
    AWSComprehendPiiEntityTypeCaSocialInsuranceNumber,
    AWSComprehendPiiEntityTypeUsIndividualTaxIdentificationNumber,
    AWSComprehendPiiEntityTypeUkUniqueTaxpayerReferenceNumber,
    AWSComprehendPiiEntityTypeInPermanentAccountNumber,
    AWSComprehendPiiEntityTypeInNrega,
    AWSComprehendPiiEntityTypeInternationalBankAccountNumber,
    AWSComprehendPiiEntityTypeSwiftCode,
    AWSComprehendPiiEntityTypeUkNationalHealthServiceNumber,
    AWSComprehendPiiEntityTypeCaHealthNumber,
    AWSComprehendPiiEntityTypeInAadhaar,
    AWSComprehendPiiEntityTypeInVoterNumber,
};

typedef NS_ENUM(NSInteger, AWSComprehendRelationshipType) {
    AWSComprehendRelationshipTypeUnknown,
    AWSComprehendRelationshipTypeChild,
};

typedef NS_ENUM(NSInteger, AWSComprehendSentimentType) {
    AWSComprehendSentimentTypeUnknown,
    AWSComprehendSentimentTypePositive,
    AWSComprehendSentimentTypeNegative,
    AWSComprehendSentimentTypeNeutral,
    AWSComprehendSentimentTypeMixed,
};

typedef NS_ENUM(NSInteger, AWSComprehendSplit) {
    AWSComprehendSplitUnknown,
    AWSComprehendSplitTrain,
    AWSComprehendSplitTest,
};

typedef NS_ENUM(NSInteger, AWSComprehendSyntaxLanguageCode) {
    AWSComprehendSyntaxLanguageCodeUnknown,
    AWSComprehendSyntaxLanguageCodeEn,
    AWSComprehendSyntaxLanguageCodeEs,
    AWSComprehendSyntaxLanguageCodeFr,
    AWSComprehendSyntaxLanguageCodeDe,
    AWSComprehendSyntaxLanguageCodeIt,
    AWSComprehendSyntaxLanguageCodePt,
};

typedef NS_ENUM(NSInteger, AWSComprehendTargetedSentimentEntityType) {
    AWSComprehendTargetedSentimentEntityTypeUnknown,
    AWSComprehendTargetedSentimentEntityTypePerson,
    AWSComprehendTargetedSentimentEntityTypeLocation,
    AWSComprehendTargetedSentimentEntityTypeOrganization,
    AWSComprehendTargetedSentimentEntityTypeFacility,
    AWSComprehendTargetedSentimentEntityTypeBrand,
    AWSComprehendTargetedSentimentEntityTypeCommercialItem,
    AWSComprehendTargetedSentimentEntityTypeMovie,
    AWSComprehendTargetedSentimentEntityTypeMusic,
    AWSComprehendTargetedSentimentEntityTypeBook,
    AWSComprehendTargetedSentimentEntityTypeSoftware,
    AWSComprehendTargetedSentimentEntityTypeGame,
    AWSComprehendTargetedSentimentEntityTypePersonalTitle,
    AWSComprehendTargetedSentimentEntityTypeEvent,
    AWSComprehendTargetedSentimentEntityTypeDate,
    AWSComprehendTargetedSentimentEntityTypeQuantity,
    AWSComprehendTargetedSentimentEntityTypeAttribute,
    AWSComprehendTargetedSentimentEntityTypeOther,
};

@class AWSComprehendAugmentedManifestsListItem;
@class AWSComprehendBatchDetectDominantLanguageItemResult;
@class AWSComprehendBatchDetectDominantLanguageRequest;
@class AWSComprehendBatchDetectDominantLanguageResponse;
@class AWSComprehendBatchDetectEntitiesItemResult;
@class AWSComprehendBatchDetectEntitiesRequest;
@class AWSComprehendBatchDetectEntitiesResponse;
@class AWSComprehendBatchDetectKeyPhrasesItemResult;
@class AWSComprehendBatchDetectKeyPhrasesRequest;
@class AWSComprehendBatchDetectKeyPhrasesResponse;
@class AWSComprehendBatchDetectSentimentItemResult;
@class AWSComprehendBatchDetectSentimentRequest;
@class AWSComprehendBatchDetectSentimentResponse;
@class AWSComprehendBatchDetectSyntaxItemResult;
@class AWSComprehendBatchDetectSyntaxRequest;
@class AWSComprehendBatchDetectSyntaxResponse;
@class AWSComprehendBatchDetectTargetedSentimentItemResult;
@class AWSComprehendBatchDetectTargetedSentimentRequest;
@class AWSComprehendBatchDetectTargetedSentimentResponse;
@class AWSComprehendBatchItemError;
@class AWSComprehendBlock;
@class AWSComprehendBlockReference;
@class AWSComprehendBoundingBox;
@class AWSComprehendChildBlock;
@class AWSComprehendClassifierEvaluationMetrics;
@class AWSComprehendClassifierMetadata;
@class AWSComprehendClassifyDocumentRequest;
@class AWSComprehendClassifyDocumentResponse;
@class AWSComprehendContainsPiiEntitiesRequest;
@class AWSComprehendContainsPiiEntitiesResponse;
@class AWSComprehendCreateDocumentClassifierRequest;
@class AWSComprehendCreateDocumentClassifierResponse;
@class AWSComprehendCreateEndpointRequest;
@class AWSComprehendCreateEndpointResponse;
@class AWSComprehendCreateEntityRecognizerRequest;
@class AWSComprehendCreateEntityRecognizerResponse;
@class AWSComprehendDeleteDocumentClassifierRequest;
@class AWSComprehendDeleteDocumentClassifierResponse;
@class AWSComprehendDeleteEndpointRequest;
@class AWSComprehendDeleteEndpointResponse;
@class AWSComprehendDeleteEntityRecognizerRequest;
@class AWSComprehendDeleteEntityRecognizerResponse;
@class AWSComprehendDeleteResourcePolicyRequest;
@class AWSComprehendDeleteResourcePolicyResponse;
@class AWSComprehendDescribeDocumentClassificationJobRequest;
@class AWSComprehendDescribeDocumentClassificationJobResponse;
@class AWSComprehendDescribeDocumentClassifierRequest;
@class AWSComprehendDescribeDocumentClassifierResponse;
@class AWSComprehendDescribeDominantLanguageDetectionJobRequest;
@class AWSComprehendDescribeDominantLanguageDetectionJobResponse;
@class AWSComprehendDescribeEndpointRequest;
@class AWSComprehendDescribeEndpointResponse;
@class AWSComprehendDescribeEntitiesDetectionJobRequest;
@class AWSComprehendDescribeEntitiesDetectionJobResponse;
@class AWSComprehendDescribeEntityRecognizerRequest;
@class AWSComprehendDescribeEntityRecognizerResponse;
@class AWSComprehendDescribeEventsDetectionJobRequest;
@class AWSComprehendDescribeEventsDetectionJobResponse;
@class AWSComprehendDescribeKeyPhrasesDetectionJobRequest;
@class AWSComprehendDescribeKeyPhrasesDetectionJobResponse;
@class AWSComprehendDescribePiiEntitiesDetectionJobRequest;
@class AWSComprehendDescribePiiEntitiesDetectionJobResponse;
@class AWSComprehendDescribeResourcePolicyRequest;
@class AWSComprehendDescribeResourcePolicyResponse;
@class AWSComprehendDescribeSentimentDetectionJobRequest;
@class AWSComprehendDescribeSentimentDetectionJobResponse;
@class AWSComprehendDescribeTargetedSentimentDetectionJobRequest;
@class AWSComprehendDescribeTargetedSentimentDetectionJobResponse;
@class AWSComprehendDescribeTopicsDetectionJobRequest;
@class AWSComprehendDescribeTopicsDetectionJobResponse;
@class AWSComprehendDetectDominantLanguageRequest;
@class AWSComprehendDetectDominantLanguageResponse;
@class AWSComprehendDetectEntitiesRequest;
@class AWSComprehendDetectEntitiesResponse;
@class AWSComprehendDetectKeyPhrasesRequest;
@class AWSComprehendDetectKeyPhrasesResponse;
@class AWSComprehendDetectPiiEntitiesRequest;
@class AWSComprehendDetectPiiEntitiesResponse;
@class AWSComprehendDetectSentimentRequest;
@class AWSComprehendDetectSentimentResponse;
@class AWSComprehendDetectSyntaxRequest;
@class AWSComprehendDetectSyntaxResponse;
@class AWSComprehendDetectTargetedSentimentRequest;
@class AWSComprehendDetectTargetedSentimentResponse;
@class AWSComprehendDocumentClass;
@class AWSComprehendDocumentClassificationJobFilter;
@class AWSComprehendDocumentClassificationJobProperties;
@class AWSComprehendDocumentClassifierFilter;
@class AWSComprehendDocumentClassifierInputDataConfig;
@class AWSComprehendDocumentClassifierOutputDataConfig;
@class AWSComprehendDocumentClassifierProperties;
@class AWSComprehendDocumentClassifierSummary;
@class AWSComprehendDocumentLabel;
@class AWSComprehendDocumentMetadata;
@class AWSComprehendDocumentReaderConfig;
@class AWSComprehendDocumentTypeListItem;
@class AWSComprehendDominantLanguage;
@class AWSComprehendDominantLanguageDetectionJobFilter;
@class AWSComprehendDominantLanguageDetectionJobProperties;
@class AWSComprehendEndpointFilter;
@class AWSComprehendEndpointProperties;
@class AWSComprehendEntitiesDetectionJobFilter;
@class AWSComprehendEntitiesDetectionJobProperties;
@class AWSComprehendEntity;
@class AWSComprehendEntityLabel;
@class AWSComprehendEntityRecognizerAnnotations;
@class AWSComprehendEntityRecognizerDocuments;
@class AWSComprehendEntityRecognizerEntityList;
@class AWSComprehendEntityRecognizerEvaluationMetrics;
@class AWSComprehendEntityRecognizerFilter;
@class AWSComprehendEntityRecognizerInputDataConfig;
@class AWSComprehendEntityRecognizerMetadata;
@class AWSComprehendEntityRecognizerMetadataEntityTypesListItem;
@class AWSComprehendEntityRecognizerProperties;
@class AWSComprehendEntityRecognizerSummary;
@class AWSComprehendEntityTypesEvaluationMetrics;
@class AWSComprehendEntityTypesListItem;
@class AWSComprehendErrorsListItem;
@class AWSComprehendEventsDetectionJobFilter;
@class AWSComprehendEventsDetectionJobProperties;
@class AWSComprehendExtractedCharactersListItem;
@class AWSComprehendGeometry;
@class AWSComprehendImportModelRequest;
@class AWSComprehendImportModelResponse;
@class AWSComprehendInputDataConfig;
@class AWSComprehendInvalidRequestDetail;
@class AWSComprehendKeyPhrase;
@class AWSComprehendKeyPhrasesDetectionJobFilter;
@class AWSComprehendKeyPhrasesDetectionJobProperties;
@class AWSComprehendListDocumentClassificationJobsRequest;
@class AWSComprehendListDocumentClassificationJobsResponse;
@class AWSComprehendListDocumentClassifierSummariesRequest;
@class AWSComprehendListDocumentClassifierSummariesResponse;
@class AWSComprehendListDocumentClassifiersRequest;
@class AWSComprehendListDocumentClassifiersResponse;
@class AWSComprehendListDominantLanguageDetectionJobsRequest;
@class AWSComprehendListDominantLanguageDetectionJobsResponse;
@class AWSComprehendListEndpointsRequest;
@class AWSComprehendListEndpointsResponse;
@class AWSComprehendListEntitiesDetectionJobsRequest;
@class AWSComprehendListEntitiesDetectionJobsResponse;
@class AWSComprehendListEntityRecognizerSummariesRequest;
@class AWSComprehendListEntityRecognizerSummariesResponse;
@class AWSComprehendListEntityRecognizersRequest;
@class AWSComprehendListEntityRecognizersResponse;
@class AWSComprehendListEventsDetectionJobsRequest;
@class AWSComprehendListEventsDetectionJobsResponse;
@class AWSComprehendListKeyPhrasesDetectionJobsRequest;
@class AWSComprehendListKeyPhrasesDetectionJobsResponse;
@class AWSComprehendListPiiEntitiesDetectionJobsRequest;
@class AWSComprehendListPiiEntitiesDetectionJobsResponse;
@class AWSComprehendListSentimentDetectionJobsRequest;
@class AWSComprehendListSentimentDetectionJobsResponse;
@class AWSComprehendListTagsForResourceRequest;
@class AWSComprehendListTagsForResourceResponse;
@class AWSComprehendListTargetedSentimentDetectionJobsRequest;
@class AWSComprehendListTargetedSentimentDetectionJobsResponse;
@class AWSComprehendListTopicsDetectionJobsRequest;
@class AWSComprehendListTopicsDetectionJobsResponse;
@class AWSComprehendMentionSentiment;
@class AWSComprehendOutputDataConfig;
@class AWSComprehendPartOfSpeechTag;
@class AWSComprehendPiiEntitiesDetectionJobFilter;
@class AWSComprehendPiiEntitiesDetectionJobProperties;
@class AWSComprehendPiiEntity;
@class AWSComprehendPiiOutputDataConfig;
@class AWSComprehendPoint;
@class AWSComprehendPutResourcePolicyRequest;
@class AWSComprehendPutResourcePolicyResponse;
@class AWSComprehendRedactionConfig;
@class AWSComprehendRelationshipsListItem;
@class AWSComprehendSentimentDetectionJobFilter;
@class AWSComprehendSentimentDetectionJobProperties;
@class AWSComprehendSentimentScore;
@class AWSComprehendStartDocumentClassificationJobRequest;
@class AWSComprehendStartDocumentClassificationJobResponse;
@class AWSComprehendStartDominantLanguageDetectionJobRequest;
@class AWSComprehendStartDominantLanguageDetectionJobResponse;
@class AWSComprehendStartEntitiesDetectionJobRequest;
@class AWSComprehendStartEntitiesDetectionJobResponse;
@class AWSComprehendStartEventsDetectionJobRequest;
@class AWSComprehendStartEventsDetectionJobResponse;
@class AWSComprehendStartKeyPhrasesDetectionJobRequest;
@class AWSComprehendStartKeyPhrasesDetectionJobResponse;
@class AWSComprehendStartPiiEntitiesDetectionJobRequest;
@class AWSComprehendStartPiiEntitiesDetectionJobResponse;
@class AWSComprehendStartSentimentDetectionJobRequest;
@class AWSComprehendStartSentimentDetectionJobResponse;
@class AWSComprehendStartTargetedSentimentDetectionJobRequest;
@class AWSComprehendStartTargetedSentimentDetectionJobResponse;
@class AWSComprehendStartTopicsDetectionJobRequest;
@class AWSComprehendStartTopicsDetectionJobResponse;
@class AWSComprehendStopDominantLanguageDetectionJobRequest;
@class AWSComprehendStopDominantLanguageDetectionJobResponse;
@class AWSComprehendStopEntitiesDetectionJobRequest;
@class AWSComprehendStopEntitiesDetectionJobResponse;
@class AWSComprehendStopEventsDetectionJobRequest;
@class AWSComprehendStopEventsDetectionJobResponse;
@class AWSComprehendStopKeyPhrasesDetectionJobRequest;
@class AWSComprehendStopKeyPhrasesDetectionJobResponse;
@class AWSComprehendStopPiiEntitiesDetectionJobRequest;
@class AWSComprehendStopPiiEntitiesDetectionJobResponse;
@class AWSComprehendStopSentimentDetectionJobRequest;
@class AWSComprehendStopSentimentDetectionJobResponse;
@class AWSComprehendStopTargetedSentimentDetectionJobRequest;
@class AWSComprehendStopTargetedSentimentDetectionJobResponse;
@class AWSComprehendStopTrainingDocumentClassifierRequest;
@class AWSComprehendStopTrainingDocumentClassifierResponse;
@class AWSComprehendStopTrainingEntityRecognizerRequest;
@class AWSComprehendStopTrainingEntityRecognizerResponse;
@class AWSComprehendSyntaxToken;
@class AWSComprehendTag;
@class AWSComprehendTagResourceRequest;
@class AWSComprehendTagResourceResponse;
@class AWSComprehendTargetedSentimentDetectionJobFilter;
@class AWSComprehendTargetedSentimentDetectionJobProperties;
@class AWSComprehendTargetedSentimentEntity;
@class AWSComprehendTargetedSentimentMention;
@class AWSComprehendTopicsDetectionJobFilter;
@class AWSComprehendTopicsDetectionJobProperties;
@class AWSComprehendUntagResourceRequest;
@class AWSComprehendUntagResourceResponse;
@class AWSComprehendUpdateEndpointRequest;
@class AWSComprehendUpdateEndpointResponse;
@class AWSComprehendVpcConfig;

/**
 <p>An augmented manifest file that provides training data for your custom model. An augmented manifest file is a labeled dataset that is produced by Amazon SageMaker Ground Truth.</p>
 Required parameters: [S3Uri, AttributeNames]
 */
@interface AWSComprehendAugmentedManifestsListItem : AWSModel


/**
 <p>The S3 prefix to the annotation files that are referred in the augmented manifest file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable annotationDataS3Uri;

/**
 <p>The JSON attribute that contains the annotations for your training documents. The number of attribute names that you specify depends on whether your augmented manifest file is the output of a single labeling job or a chained labeling job.</p><p>If your file is the output of a single labeling job, specify the LabelAttributeName key that was used when the job was created in Ground Truth.</p><p>If your file is the output of a chained labeling job, specify the LabelAttributeName key for one or more jobs in the chain. Each LabelAttributeName key provides the annotations from an individual job.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributeNames;

/**
 <p>The type of augmented manifest. PlainTextDocument or SemiStructuredDocument. If you don't specify, the default is PlainTextDocument. </p><ul><li><p><code>PLAIN_TEXT_DOCUMENT</code> A document type that represents any unicode text that is encoded in UTF-8.</p></li><li><p><code>SEMI_STRUCTURED_DOCUMENT</code> A document type with positional and structural context, like a PDF. For training with Amazon Comprehend, only PDFs are supported. For inference, Amazon Comprehend support PDFs, DOCX and TXT.</p></li></ul>
 */
@property (nonatomic, assign) AWSComprehendAugmentedManifestsDocumentTypeFormat documentType;

/**
 <p>The Amazon S3 location of the augmented manifest file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

/**
 <p>The S3 prefix to the source files (PDFs) that are referred to in the augmented manifest file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceDocumentsS3Uri;

/**
 <p>The purpose of the data you've provided in the augmented manifest. You can either train or test this data. If you don't specify, the default is train.</p><p>TRAIN - all of the documents in the manifest will be used for training. If no test documents are provided, Amazon Comprehend will automatically reserve a portion of the training documents for testing.</p><p> TEST - all of the documents in the manifest will be used for testing.</p>
 */
@property (nonatomic, assign) AWSComprehendSplit split;

@end

/**
 <p>The result of calling the operation. The operation returns one object for each document that is successfully processed by the operation.</p>
 */
@interface AWSComprehendBatchDetectDominantLanguageItemResult : AWSModel


/**
 <p>The zero-based index of the document in the input list.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable index;

/**
 <p>One or more <a>DominantLanguage</a> objects describing the dominant languages in the document.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendDominantLanguage *> * _Nullable languages;

@end

/**
 
 */
@interface AWSComprehendBatchDetectDominantLanguageRequest : AWSRequest


/**
 <p>A list containing the UTF-8 encoded text of the input documents. The list can contain a maximum of 25 documents. Each document should contain at least 20 characters. The maximum size of each document is 5 KB.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable textList;

@end

/**
 
 */
@interface AWSComprehendBatchDetectDominantLanguageResponse : AWSModel


/**
 <p>A list containing one object for each document that contained an error. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If there are no errors in the batch, the <code>ErrorList</code> is empty.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendBatchItemError *> * _Nullable errorList;

/**
 <p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendBatchDetectDominantLanguageItemResult *> * _Nullable resultList;

@end

/**
 <p>The result of calling the operation. The operation returns one object for each document that is successfully processed by the operation.</p>
 */
@interface AWSComprehendBatchDetectEntitiesItemResult : AWSModel


/**
 <p>One or more <a>Entity</a> objects, one for each entity detected in the document.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendEntity *> * _Nullable entities;

/**
 <p>The zero-based index of the document in the input list.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable index;

@end

/**
 
 */
@interface AWSComprehendBatchDetectEntitiesRequest : AWSRequest


/**
 <p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>A list containing the UTF-8 encoded text of the input documents. The list can contain a maximum of 25 documents. The maximum size of each document is 5 KB.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable textList;

@end

/**
 
 */
@interface AWSComprehendBatchDetectEntitiesResponse : AWSModel


/**
 <p>A list containing one object for each document that contained an error. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If there are no errors in the batch, the <code>ErrorList</code> is empty.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendBatchItemError *> * _Nullable errorList;

/**
 <p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendBatchDetectEntitiesItemResult *> * _Nullable resultList;

@end

/**
 <p>The result of calling the operation. The operation returns one object for each document that is successfully processed by the operation.</p>
 */
@interface AWSComprehendBatchDetectKeyPhrasesItemResult : AWSModel


/**
 <p>The zero-based index of the document in the input list.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable index;

/**
 <p>One or more <a>KeyPhrase</a> objects, one for each key phrase detected in the document.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendKeyPhrase *> * _Nullable keyPhrases;

@end

/**
 
 */
@interface AWSComprehendBatchDetectKeyPhrasesRequest : AWSRequest


/**
 <p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>A list containing the UTF-8 encoded text of the input documents. The list can contain a maximum of 25 documents. The maximum size of each document is 5 KB.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable textList;

@end

/**
 
 */
@interface AWSComprehendBatchDetectKeyPhrasesResponse : AWSModel


/**
 <p>A list containing one object for each document that contained an error. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If there are no errors in the batch, the <code>ErrorList</code> is empty.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendBatchItemError *> * _Nullable errorList;

/**
 <p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendBatchDetectKeyPhrasesItemResult *> * _Nullable resultList;

@end

/**
 <p>The result of calling the operation. The operation returns one object for each document that is successfully processed by the operation.</p>
 */
@interface AWSComprehendBatchDetectSentimentItemResult : AWSModel


/**
 <p>The zero-based index of the document in the input list.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable index;

/**
 <p>The sentiment detected in the document.</p>
 */
@property (nonatomic, assign) AWSComprehendSentimentType sentiment;

/**
 <p>The level of confidence that Amazon Comprehend has in the accuracy of its sentiment detection.</p>
 */
@property (nonatomic, strong) AWSComprehendSentimentScore * _Nullable sentimentScore;

@end

/**
 
 */
@interface AWSComprehendBatchDetectSentimentRequest : AWSRequest


/**
 <p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>A list containing the UTF-8 encoded text of the input documents. The list can contain a maximum of 25 documents. The maximum size of each document is 5 KB. </p><note><p>Amazon Comprehend performs real-time sentiment analysis on the first 500 characters of the input text and ignores any additional text in the input.</p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable textList;

@end

/**
 
 */
@interface AWSComprehendBatchDetectSentimentResponse : AWSModel


/**
 <p>A list containing one object for each document that contained an error. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If there are no errors in the batch, the <code>ErrorList</code> is empty.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendBatchItemError *> * _Nullable errorList;

/**
 <p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendBatchDetectSentimentItemResult *> * _Nullable resultList;

@end

/**
 <p>The result of calling the operation. The operation returns one object that is successfully processed by the operation.</p>
 */
@interface AWSComprehendBatchDetectSyntaxItemResult : AWSModel


/**
 <p>The zero-based index of the document in the input list.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable index;

/**
 <p>The syntax tokens for the words in the document, one token for each word.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendSyntaxToken *> * _Nullable syntaxTokens;

@end

/**
 
 */
@interface AWSComprehendBatchDetectSyntaxRequest : AWSRequest


/**
 <p>The language of the input documents. You can specify any of the following languages supported by Amazon Comprehend: German ("de"), English ("en"), Spanish ("es"), French ("fr"), Italian ("it"), or Portuguese ("pt"). All documents must be in the same language.</p>
 */
@property (nonatomic, assign) AWSComprehendSyntaxLanguageCode languageCode;

/**
 <p>A list containing the UTF-8 encoded text of the input documents. The list can contain a maximum of 25 documents. The maximum size for each document is 5 KB.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable textList;

@end

/**
 
 */
@interface AWSComprehendBatchDetectSyntaxResponse : AWSModel


/**
 <p>A list containing one object for each document that contained an error. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If there are no errors in the batch, the <code>ErrorList</code> is empty.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendBatchItemError *> * _Nullable errorList;

/**
 <p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendBatchDetectSyntaxItemResult *> * _Nullable resultList;

@end

/**
 <p>Analysis results for one of the documents in the batch.</p>
 */
@interface AWSComprehendBatchDetectTargetedSentimentItemResult : AWSModel


/**
 <p>An array of targeted sentiment entities.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendTargetedSentimentEntity *> * _Nullable entities;

/**
 <p>The zero-based index of this result in the input list.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable index;

@end

/**
 
 */
@interface AWSComprehendBatchDetectTargetedSentimentRequest : AWSRequest


/**
 <p>The language of the input documents. Currently, English is the only supported language.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>A list containing the UTF-8 encoded text of the input documents. The list can contain a maximum of 25 documents. The maximum size of each document is 5 KB.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable textList;

@end

/**
 
 */
@interface AWSComprehendBatchDetectTargetedSentimentResponse : AWSModel


/**
 <p>List of errors that the operation can return.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendBatchItemError *> * _Nullable errorList;

/**
 <p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendBatchDetectTargetedSentimentItemResult *> * _Nullable resultList;

@end

/**
 <p>Describes an error that occurred while processing a document in a batch. The operation returns on <code>BatchItemError</code> object for each document that contained an error.</p>
 */
@interface AWSComprehendBatchItemError : AWSModel


/**
 <p>The numeric error code of the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>A text description of the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The zero-based index of the document in the input list.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable index;

@end

/**
 <p>Information about each word or line of text in the input document.</p><p>For additional information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/API_Block.html">Block</a> in the Amazon Textract API reference.</p>
 */
@interface AWSComprehendBlock : AWSModel


/**
 <p>The block represents a line of text or one word of text.</p><ul><li><p>WORD - A word that's detected on a document page. A word is one or more ISO basic Latin script characters that aren't separated by spaces.</p></li><li><p>LINE - A string of tab-delimited, contiguous words that are detected on a document page</p></li></ul>
 */
@property (nonatomic, assign) AWSComprehendBlockType blockType;

/**
 <p>Co-ordinates of the rectangle or polygon that contains the text.</p>
 */
@property (nonatomic, strong) AWSComprehendGeometry * _Nullable geometry;

/**
 <p>Unique identifier for the block.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Page number where the block appears.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable page;

/**
 <p>A list of child blocks of the current block. For example, a LINE object has child blocks for each WORD block that's part of the line of text. </p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendRelationshipsListItem *> * _Nullable relationships;

/**
 <p>The word or line of text extracted from the block.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 <p>A reference to a block. </p>
 */
@interface AWSComprehendBlockReference : AWSModel


/**
 <p>Offset of the start of the block within its parent block.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable beginOffset;

/**
 <p>Unique identifier for the block.</p>
 */
@property (nonatomic, strong) NSString * _Nullable blockId;

/**
 <p>List of child blocks within this block.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendChildBlock *> * _Nullable childBlocks;

/**
 <p>Offset of the end of the block within its parent block.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endOffset;

@end

/**
 <p>The bounding box around the detected page or around an element on a document page. The left (x-coordinate) and top (y-coordinate) are coordinates that represent the top and left sides of the bounding box. Note that the upper-left corner of the image is the origin (0,0). </p><p>For additional information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/API_BoundingBox.html">BoundingBox</a> in the Amazon Textract API reference.</p>
 */
@interface AWSComprehendBoundingBox : AWSModel


/**
 <p>The height of the bounding box as a ratio of the overall document page height.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable height;

/**
 <p>The left coordinate of the bounding box as a ratio of overall document page width.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable left;

/**
 <p>The top coordinate of the bounding box as a ratio of overall document page height.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable top;

/**
 <p>The width of the bounding box as a ratio of the overall document page width.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable width;

@end

/**
 <p>Nested block contained within a block.</p>
 */
@interface AWSComprehendChildBlock : AWSModel


/**
 <p>Offset of the start of the child block within its parent block.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable beginOffset;

/**
 <p>Unique identifier for the child block.</p>
 */
@property (nonatomic, strong) NSString * _Nullable childBlockId;

/**
 <p>Offset of the end of the child block within its parent block.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endOffset;

@end

/**
 <p>Describes the result metrics for the test data associated with an documentation classifier.</p>
 */
@interface AWSComprehendClassifierEvaluationMetrics : AWSModel


/**
 <p>The fraction of the labels that were correct recognized. It is computed by dividing the number of labels in the test documents that were correctly recognized by the total number of labels in the test documents.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable accuracy;

/**
 <p>A measure of how accurate the classifier results are for the test data. It is derived from the <code>Precision</code> and <code>Recall</code> values. The <code>F1Score</code> is the harmonic average of the two scores. The highest score is 1, and the worst score is 0. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable f1Score;

/**
 <p>Indicates the fraction of labels that are incorrectly predicted. Also seen as the fraction of wrong labels compared to the total number of labels. Scores closer to zero are better.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hammingLoss;

/**
 <p>A measure of how accurate the classifier results are for the test data. It is a combination of the <code>Micro Precision</code> and <code>Micro Recall</code> values. The <code>Micro F1Score</code> is the harmonic mean of the two scores. The highest score is 1, and the worst score is 0.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable microF1Score;

/**
 <p>A measure of the usefulness of the recognizer results in the test data. High precision means that the recognizer returned substantially more relevant results than irrelevant ones. Unlike the Precision metric which comes from averaging the precision of all available labels, this is based on the overall score of all precision scores added together.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable microPrecision;

/**
 <p>A measure of how complete the classifier results are for the test data. High recall means that the classifier returned most of the relevant results. Specifically, this indicates how many of the correct categories in the text that the model can predict. It is a percentage of correct categories in the text that can found. Instead of averaging the recall scores of all labels (as with Recall), micro Recall is based on the overall score of all recall scores added together.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable microRecall;

/**
 <p>A measure of the usefulness of the classifier results in the test data. High precision means that the classifier returned substantially more relevant results than irrelevant ones.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable precision;

/**
 <p>A measure of how complete the classifier results are for the test data. High recall means that the classifier returned most of the relevant results. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recall;

@end

/**
 <p>Provides information about a document classifier.</p>
 */
@interface AWSComprehendClassifierMetadata : AWSModel


/**
 <p> Describes the result metrics for the test data associated with an documentation classifier.</p>
 */
@property (nonatomic, strong) AWSComprehendClassifierEvaluationMetrics * _Nullable evaluationMetrics;

/**
 <p>The number of labels in the input data. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfLabels;

/**
 <p>The number of documents in the input data that were used to test the classifier. Typically this is 10 to 20 percent of the input documents, up to 10,000 documents.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfTestDocuments;

/**
 <p>The number of documents in the input data that were used to train the classifier. Typically this is 80 to 90 percent of the input documents.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfTrainedDocuments;

@end

/**
 
 */
@interface AWSComprehendClassifyDocumentRequest : AWSRequest


/**
 <p>Use the <code>Bytes</code> parameter to input a text, PDF, Word or image file. You can also use the <code>Bytes</code> parameter to input an Amazon Textract <code>DetectDocumentText</code> or <code>AnalyzeDocument</code> output file.</p><p>Provide the input document as a sequence of base64-encoded bytes. If your code uses an Amazon Web Services SDK to classify documents, the SDK may encode the document file bytes for you. </p><p>The maximum length of this field depends on the input document type. For details, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/idp-inputs-sync.html"> Inputs for real-time custom analysis</a> in the Comprehend Developer Guide. </p><p>If you use the <code>Bytes</code> parameter, do not use the <code>Text</code> parameter.</p>
 */
@property (nonatomic, strong) NSData * _Nullable bytes;

/**
 <p>Provides configuration parameters to override the default actions for extracting text from PDF documents and image files.</p>
 */
@property (nonatomic, strong) AWSComprehendDocumentReaderConfig * _Nullable documentReaderConfig;

/**
 <p>The Amazon Resource Number (ARN) of the endpoint. For information about endpoints, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html">Managing endpoints</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

/**
 <p>The document text to be analyzed. If you enter text using this parameter, do not use the <code>Bytes</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSComprehendClassifyDocumentResponse : AWSModel


/**
 <p>The classes used by the document being analyzed. These are used for multi-class trained models. Individual classes are mutually exclusive and each document is expected to have only a single class assigned to it. For example, an animal can be a dog or a cat, but not both at the same time. </p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendDocumentClass *> * _Nullable classes;

/**
 <p>Extraction information about the document. This field is present in the response only if your request includes the <code>Byte</code> parameter. </p>
 */
@property (nonatomic, strong) AWSComprehendDocumentMetadata * _Nullable documentMetadata;

/**
 <p>The document type for each page in the input document. This field is present in the response only if your request includes the <code>Byte</code> parameter. </p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendDocumentTypeListItem *> * _Nullable documentType;

/**
 <p>Page-level errors that the system detected while processing the input document. The field is empty if the system encountered no errors.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendErrorsListItem *> * _Nullable errors;

/**
 <p>The labels used the document being analyzed. These are used for multi-label trained models. Individual labels represent different categories that are related in some manner and are not mutually exclusive. For example, a movie can be just an action movie, or it can be an action movie, a science fiction movie, and a comedy, all at the same time. </p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendDocumentLabel *> * _Nullable labels;

@end

/**
 
 */
@interface AWSComprehendContainsPiiEntitiesRequest : AWSRequest


/**
 <p>The language of the input documents. Currently, English is the only valid language.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>A UTF-8 text string. The maximum string size is 100 KB.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSComprehendContainsPiiEntitiesResponse : AWSModel


/**
 <p>The labels used in the document being analyzed. Individual labels represent personally identifiable information (PII) entity types.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendEntityLabel *> * _Nullable labels;

@end

/**
 
 */
@interface AWSComprehendCreateDocumentClassifierRequest : AWSRequest


/**
 <p>A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>The name of the document classifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentClassifierName;

/**
 <p>Specifies the format and location of the input data for the job.</p>
 */
@property (nonatomic, strong) AWSComprehendDocumentClassifierInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The language of the input documents. You can specify any of the following languages supported by Amazon Comprehend: German ("de"), English ("en"), Spanish ("es"), French ("fr"), Italian ("it"), or Portuguese ("pt"). All documents must be in the same language.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>Indicates the mode in which the classifier will be trained. The classifier can be trained in multi-class mode, which identifies one and only one class for each document, or multi-label mode, which identifies one or more labels for each document. In multi-label mode, multiple labels for an individual document are separated by a delimiter. The default delimiter between labels is a pipe (|).</p>
 */
@property (nonatomic, assign) AWSComprehendDocumentClassifierMode mode;

/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt trained custom models. The ModelKmsKeyId can be either of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable modelKmsKeyId;

/**
 <p>The resource-based policy to attach to your custom document classifier model. You can use this policy to allow another AWS account to import your custom model.</p><p>Provide your policy as a JSON body that you enter as a UTF-8 encoded string without line breaks. To provide valid JSON, enclose the attribute names and values in double quotes. If the JSON body is also enclosed in double quotes, then you must escape the double quotes that are inside the policy:</p><p><code>"{\"attribute\": \"value\", \"attribute\": [\"value\"]}"</code></p><p>To avoid escaping quotes, you can use single quotes to enclose the policy and double quotes to enclose the JSON names and values:</p><p><code>'{"attribute": "value", "attribute": ["value"]}'</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable modelPolicy;

/**
 <p>Enables the addition of output results configuration parameters for custom classifier jobs.</p>
 */
@property (nonatomic, strong) AWSComprehendDocumentClassifierOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>Tags to be associated with the document classifier being created. A tag is a key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a resource to indicate its use by the sales department. </p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendTag *> * _Nullable tags;

/**
 <p>The version name given to the newly created classifier. Version names can have a maximum of 256 characters. Alphanumeric characters, hyphens (-) and underscores (_) are allowed. The version name must be unique among all models with the same classifier name in the account/AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionName;

/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

/**
 <p>Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your custom classifier. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon VPC</a>. </p>
 */
@property (nonatomic, strong) AWSComprehendVpcConfig * _Nullable vpcConfig;

@end

/**
 
 */
@interface AWSComprehendCreateDocumentClassifierResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) that identifies the document classifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentClassifierArn;

@end

/**
 
 */
@interface AWSComprehendCreateEndpointRequest : AWSRequest


/**
 <p>An idempotency token provided by the customer. If this token matches a previous endpoint creation request, Amazon Comprehend will not return a <code>ResourceInUseException</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The Amazon Resource Name (ARN) of the AWS identity and Access Management (IAM) role that grants Amazon Comprehend read access to trained custom models encrypted with a customer managed key (ModelKmsKeyId).</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p> The desired number of inference units to be used by the model using this endpoint. Each inference unit represents of a throughput of 100 characters per second.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable desiredInferenceUnits;

/**
 <p>This is the descriptive suffix that becomes part of the <code>EndpointArn</code> used for all subsequent requests to this resource. </p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

/**
 <p>The Amazon Resource Number (ARN) of the model to which the endpoint will be attached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelArn;

/**
 <p>Tags associated with the endpoint being created. A tag is a key-value pair that adds metadata to the endpoint. For example, a tag with "Sales" as the key might be added to an endpoint to indicate its use by the sales department. </p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSComprehendCreateEndpointResponse : AWSModel


/**
 <p>The Amazon Resource Number (ARN) of the endpoint being created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

@end

/**
 
 */
@interface AWSComprehendCreateEntityRecognizerRequest : AWSRequest


/**
 <p> A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>Specifies the format and location of the input data. The S3 bucket containing the input data must be located in the same region as the entity recognizer being created. </p>
 */
@property (nonatomic, strong) AWSComprehendEntityRecognizerInputDataConfig * _Nullable inputDataConfig;

/**
 <p> You can specify any of the following languages: English ("en"), Spanish ("es"), French ("fr"), Italian ("it"), German ("de"), or Portuguese ("pt"). If you plan to use this entity recognizer with PDF, Word, or image input files, you must specify English as the language. All training documents must be in the same language.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt trained custom models. The ModelKmsKeyId can be either of the following formats</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable modelKmsKeyId;

/**
 <p>The JSON resource-based policy to attach to your custom entity recognizer model. You can use this policy to allow another AWS account to import your custom model.</p><p>Provide your JSON as a UTF-8 encoded string without line breaks. To provide valid JSON for your policy, enclose the attribute names and values in double quotes. If the JSON body is also enclosed in double quotes, then you must escape the double quotes that are inside the policy:</p><p><code>"{\"attribute\": \"value\", \"attribute\": [\"value\"]}"</code></p><p>To avoid escaping quotes, you can use single quotes to enclose the policy and double quotes to enclose the JSON names and values:</p><p><code>'{"attribute": "value", "attribute": ["value"]}'</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable modelPolicy;

/**
 <p>The name given to the newly created recognizer. Recognizer names can be a maximum of 256 characters. Alphanumeric characters, hyphens (-) and underscores (_) are allowed. The name must be unique in the account/region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recognizerName;

/**
 <p>Tags to be associated with the entity recognizer being created. A tag is a key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a resource to indicate its use by the sales department. </p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendTag *> * _Nullable tags;

/**
 <p>The version name given to the newly created recognizer. Version names can be a maximum of 256 characters. Alphanumeric characters, hyphens (-) and underscores (_) are allowed. The version name must be unique among all models with the same recognizer name in the account/ AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionName;

/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

/**
 <p>Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your custom entity recognizer. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon VPC</a>. </p>
 */
@property (nonatomic, strong) AWSComprehendVpcConfig * _Nullable vpcConfig;

@end

/**
 
 */
@interface AWSComprehendCreateEntityRecognizerResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) that identifies the entity recognizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityRecognizerArn;

@end

/**
 
 */
@interface AWSComprehendDeleteDocumentClassifierRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) that identifies the document classifier. </p>
 */
@property (nonatomic, strong) NSString * _Nullable documentClassifierArn;

@end

/**
 
 */
@interface AWSComprehendDeleteDocumentClassifierResponse : AWSModel


@end

/**
 
 */
@interface AWSComprehendDeleteEndpointRequest : AWSRequest


/**
 <p>The Amazon Resource Number (ARN) of the endpoint being deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

@end

/**
 
 */
@interface AWSComprehendDeleteEndpointResponse : AWSModel


@end

/**
 
 */
@interface AWSComprehendDeleteEntityRecognizerRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) that identifies the entity recognizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityRecognizerArn;

@end

/**
 
 */
@interface AWSComprehendDeleteEntityRecognizerResponse : AWSModel


@end

/**
 
 */
@interface AWSComprehendDeleteResourcePolicyRequest : AWSRequest


/**
 <p>The revision ID of the policy to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyRevisionId;

/**
 <p>The Amazon Resource Name (ARN) of the custom model version that has the policy to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSComprehendDeleteResourcePolicyResponse : AWSModel


@end

/**
 
 */
@interface AWSComprehendDescribeDocumentClassificationJobRequest : AWSRequest


/**
 <p>The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSComprehendDescribeDocumentClassificationJobResponse : AWSModel


/**
 <p>An object that describes the properties associated with the document classification job.</p>
 */
@property (nonatomic, strong) AWSComprehendDocumentClassificationJobProperties * _Nullable documentClassificationJobProperties;

@end

/**
 
 */
@interface AWSComprehendDescribeDocumentClassifierRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) that identifies the document classifier. The operation returns this identifier in its response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentClassifierArn;

@end

/**
 
 */
@interface AWSComprehendDescribeDocumentClassifierResponse : AWSModel


/**
 <p>An object that contains the properties associated with a document classifier.</p>
 */
@property (nonatomic, strong) AWSComprehendDocumentClassifierProperties * _Nullable documentClassifierProperties;

@end

/**
 
 */
@interface AWSComprehendDescribeDominantLanguageDetectionJobRequest : AWSRequest


/**
 <p>The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSComprehendDescribeDominantLanguageDetectionJobResponse : AWSModel


/**
 <p>An object that contains the properties associated with a dominant language detection job.</p>
 */
@property (nonatomic, strong) AWSComprehendDominantLanguageDetectionJobProperties * _Nullable dominantLanguageDetectionJobProperties;

@end

/**
 
 */
@interface AWSComprehendDescribeEndpointRequest : AWSRequest


/**
 <p>The Amazon Resource Number (ARN) of the endpoint being described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

@end

/**
 
 */
@interface AWSComprehendDescribeEndpointResponse : AWSModel


/**
 <p>Describes information associated with the specific endpoint.</p>
 */
@property (nonatomic, strong) AWSComprehendEndpointProperties * _Nullable endpointProperties;

@end

/**
 
 */
@interface AWSComprehendDescribeEntitiesDetectionJobRequest : AWSRequest


/**
 <p>The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSComprehendDescribeEntitiesDetectionJobResponse : AWSModel


/**
 <p>An object that contains the properties associated with an entities detection job.</p>
 */
@property (nonatomic, strong) AWSComprehendEntitiesDetectionJobProperties * _Nullable entitiesDetectionJobProperties;

@end

/**
 
 */
@interface AWSComprehendDescribeEntityRecognizerRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) that identifies the entity recognizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityRecognizerArn;

@end

/**
 
 */
@interface AWSComprehendDescribeEntityRecognizerResponse : AWSModel


/**
 <p>Describes information associated with an entity recognizer.</p>
 */
@property (nonatomic, strong) AWSComprehendEntityRecognizerProperties * _Nullable entityRecognizerProperties;

@end

/**
 
 */
@interface AWSComprehendDescribeEventsDetectionJobRequest : AWSRequest


/**
 <p>The identifier of the events detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSComprehendDescribeEventsDetectionJobResponse : AWSModel


/**
 <p>An object that contains the properties associated with an event detection job.</p>
 */
@property (nonatomic, strong) AWSComprehendEventsDetectionJobProperties * _Nullable eventsDetectionJobProperties;

@end

/**
 
 */
@interface AWSComprehendDescribeKeyPhrasesDetectionJobRequest : AWSRequest


/**
 <p>The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSComprehendDescribeKeyPhrasesDetectionJobResponse : AWSModel


/**
 <p>An object that contains the properties associated with a key phrases detection job. </p>
 */
@property (nonatomic, strong) AWSComprehendKeyPhrasesDetectionJobProperties * _Nullable keyPhrasesDetectionJobProperties;

@end

/**
 
 */
@interface AWSComprehendDescribePiiEntitiesDetectionJobRequest : AWSRequest


/**
 <p>The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSComprehendDescribePiiEntitiesDetectionJobResponse : AWSModel


/**
 <p>Provides information about a PII entities detection job.</p>
 */
@property (nonatomic, strong) AWSComprehendPiiEntitiesDetectionJobProperties * _Nullable piiEntitiesDetectionJobProperties;

@end

/**
 
 */
@interface AWSComprehendDescribeResourcePolicyRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the custom model version that has the resource policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSComprehendDescribeResourcePolicyResponse : AWSModel


/**
 <p>The time at which the policy was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The time at which the policy was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The revision ID of the policy. Each time you modify a policy, Amazon Comprehend assigns a new revision ID, and it deletes the prior version of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyRevisionId;

/**
 <p>The JSON body of the resource-based policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourcePolicy;

@end

/**
 
 */
@interface AWSComprehendDescribeSentimentDetectionJobRequest : AWSRequest


/**
 <p>The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSComprehendDescribeSentimentDetectionJobResponse : AWSModel


/**
 <p>An object that contains the properties associated with a sentiment detection job.</p>
 */
@property (nonatomic, strong) AWSComprehendSentimentDetectionJobProperties * _Nullable sentimentDetectionJobProperties;

@end

/**
 
 */
@interface AWSComprehendDescribeTargetedSentimentDetectionJobRequest : AWSRequest


/**
 <p>The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSComprehendDescribeTargetedSentimentDetectionJobResponse : AWSModel


/**
 <p>An object that contains the properties associated with a targeted sentiment detection job.</p>
 */
@property (nonatomic, strong) AWSComprehendTargetedSentimentDetectionJobProperties * _Nullable targetedSentimentDetectionJobProperties;

@end

/**
 
 */
@interface AWSComprehendDescribeTopicsDetectionJobRequest : AWSRequest


/**
 <p>The identifier assigned by the user to the detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSComprehendDescribeTopicsDetectionJobResponse : AWSModel


/**
 <p>The list of properties for the requested job.</p>
 */
@property (nonatomic, strong) AWSComprehendTopicsDetectionJobProperties * _Nullable topicsDetectionJobProperties;

@end

/**
 
 */
@interface AWSComprehendDetectDominantLanguageRequest : AWSRequest


/**
 <p>A UTF-8 text string. The string must contain at least 20 characters. The maximum string size is 100 KB.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSComprehendDetectDominantLanguageResponse : AWSModel


/**
 <p>The languages that Amazon Comprehend detected in the input text. For each language, the response returns the RFC 5646 language code and the level of confidence that Amazon Comprehend has in the accuracy of its inference. For more information about RFC 5646, see <a href="https://tools.ietf.org/html/rfc5646">Tags for Identifying Languages</a> on the <i>IETF Tools</i> web site.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendDominantLanguage *> * _Nullable languages;

@end

/**
 
 */
@interface AWSComprehendDetectEntitiesRequest : AWSRequest


/**
 <p>This field applies only when you use a custom entity recognition model that was trained with PDF annotations. For other cases, enter your text input in the <code>Text</code> field.</p><p> Use the <code>Bytes</code> parameter to input a text, PDF, Word or image file. Using a plain-text file in the <code>Bytes</code> parameter is equivelent to using the <code>Text</code> parameter (the <code>Entities</code> field in the response is identical).</p><p>You can also use the <code>Bytes</code> parameter to input an Amazon Textract <code>DetectDocumentText</code> or <code>AnalyzeDocument</code> output file.</p><p>Provide the input document as a sequence of base64-encoded bytes. If your code uses an Amazon Web Services SDK to detect entities, the SDK may encode the document file bytes for you. </p><p>The maximum length of this field depends on the input document type. For details, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/idp-inputs-sync.html"> Inputs for real-time custom analysis</a> in the Comprehend Developer Guide. </p><p>If you use the <code>Bytes</code> parameter, do not use the <code>Text</code> parameter.</p>
 */
@property (nonatomic, strong) NSData * _Nullable bytes;

/**
 <p>Provides configuration parameters to override the default actions for extracting text from PDF documents and image files.</p>
 */
@property (nonatomic, strong) AWSComprehendDocumentReaderConfig * _Nullable documentReaderConfig;

/**
 <p>The Amazon Resource Name of an endpoint that is associated with a custom entity recognition model. Provide an endpoint if you want to detect entities by using your own custom model instead of the default model that is used by Amazon Comprehend.</p><p>If you specify an endpoint, Amazon Comprehend uses the language of your custom model, and it ignores any language code that you provide in your request.</p><p>For information about endpoints, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html">Managing endpoints</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

/**
 <p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. If your request includes the endpoint for a custom entity recognition model, Amazon Comprehend uses the language of your custom model, and it ignores any language code that you specify here.</p><p>All input documents must be in the same language.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>A UTF-8 text string. The maximum string size is 100 KB. If you enter text using this parameter, do not use the <code>Bytes</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSComprehendDetectEntitiesResponse : AWSModel


/**
 <p>Information about each block of text in the input document. Blocks are nested. A page block contains a block for each line of text, which contains a block for each word. </p><p>The <code>Block</code> content for a Word input document does not include a <code>Geometry</code> field.</p><p>The <code>Block</code> field is not present in the response for plain-text inputs.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendBlock *> * _Nullable blocks;

/**
 <p>Information about the document, discovered during text extraction. This field is present in the response only if your request used the <code>Byte</code> parameter. </p>
 */
@property (nonatomic, strong) AWSComprehendDocumentMetadata * _Nullable documentMetadata;

/**
 <p>The document type for each page in the input document. This field is present in the response only if your request used the <code>Byte</code> parameter. </p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendDocumentTypeListItem *> * _Nullable documentType;

/**
 <p>A collection of entities identified in the input text. For each entity, the response provides the entity text, entity type, where the entity text begins and ends, and the level of confidence that Amazon Comprehend has in the detection. </p><p>If your request uses a custom entity recognition model, Amazon Comprehend detects the entities that the model is trained to recognize. Otherwise, it detects the default entity types. For a list of default entity types, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/how-entities.html">Entities</a> in the Comprehend Developer Guide. </p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendEntity *> * _Nullable entities;

/**
 <p>Page-level errors that the system detected while processing the input document. The field is empty if the system encountered no errors.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendErrorsListItem *> * _Nullable errors;

@end

/**
 
 */
@interface AWSComprehendDetectKeyPhrasesRequest : AWSRequest


/**
 <p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>A UTF-8 text string. The string must contain less than 100 KB of UTF-8 encoded characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSComprehendDetectKeyPhrasesResponse : AWSModel


/**
 <p>A collection of key phrases that Amazon Comprehend identified in the input text. For each key phrase, the response provides the text of the key phrase, where the key phrase begins and ends, and the level of confidence that Amazon Comprehend has in the accuracy of the detection. </p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendKeyPhrase *> * _Nullable keyPhrases;

@end

/**
 
 */
@interface AWSComprehendDetectPiiEntitiesRequest : AWSRequest


/**
 <p>The language of the input documents. Currently, English is the only valid language.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>A UTF-8 text string. The maximum string size is 100 KB.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSComprehendDetectPiiEntitiesResponse : AWSModel


/**
 <p>A collection of PII entities identified in the input text. For each entity, the response provides the entity type, where the entity text begins and ends, and the level of confidence that Amazon Comprehend has in the detection.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendPiiEntity *> * _Nullable entities;

@end

/**
 
 */
@interface AWSComprehendDetectSentimentRequest : AWSRequest


/**
 <p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>A UTF-8 text string. The maximum string size is 5 KB.</p><note><p>Amazon Comprehend performs real-time sentiment analysis on the first 500 characters of the input text and ignores any additional text in the input.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSComprehendDetectSentimentResponse : AWSModel


/**
 <p>The inferred sentiment that Amazon Comprehend has the highest level of confidence in.</p>
 */
@property (nonatomic, assign) AWSComprehendSentimentType sentiment;

/**
 <p>An object that lists the sentiments, and their corresponding confidence levels.</p>
 */
@property (nonatomic, strong) AWSComprehendSentimentScore * _Nullable sentimentScore;

@end

/**
 
 */
@interface AWSComprehendDetectSyntaxRequest : AWSRequest


/**
 <p>The language code of the input documents. You can specify any of the following languages supported by Amazon Comprehend: German ("de"), English ("en"), Spanish ("es"), French ("fr"), Italian ("it"), or Portuguese ("pt").</p>
 */
@property (nonatomic, assign) AWSComprehendSyntaxLanguageCode languageCode;

/**
 <p>A UTF-8 string. The maximum string size is 5 KB.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSComprehendDetectSyntaxResponse : AWSModel


/**
 <p>A collection of syntax tokens describing the text. For each token, the response provides the text, the token type, where the text begins and ends, and the level of confidence that Amazon Comprehend has that the token is correct. For a list of token types, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/how-syntax.html">Syntax</a> in the Comprehend Developer Guide. </p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendSyntaxToken *> * _Nullable syntaxTokens;

@end

/**
 
 */
@interface AWSComprehendDetectTargetedSentimentRequest : AWSRequest


/**
 <p>The language of the input documents. Currently, English is the only supported language.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>A UTF-8 text string. The maximum string length is 5 KB.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSComprehendDetectTargetedSentimentResponse : AWSModel


/**
 <p>Targeted sentiment analysis for each of the entities identified in the input text.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendTargetedSentimentEntity *> * _Nullable entities;

@end

/**
 <p>Specifies the class that categorizes the document being analyzed</p>
 */
@interface AWSComprehendDocumentClass : AWSModel


/**
 <p>The name of the class.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Page number in the input document. This field is present in the response only if your request includes the <code>Byte</code> parameter. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable page;

/**
 <p>The confidence score that Amazon Comprehend has this class correctly attributed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

@end

/**
 <p>Provides information for filtering a list of document classification jobs. For more information, see the operation. You can provide only one filter parameter in each request.</p>
 */
@interface AWSComprehendDocumentClassificationJobFilter : AWSModel


/**
 <p>Filters on the name of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>Filters the list based on job status. Returns only jobs with the specified status.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

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
 <p>Provides information about a document classification job.</p>
 */
@interface AWSComprehendDocumentClassificationJobProperties : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the AWS identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>The Amazon Resource Name (ARN) that identifies the document classifier. </p>
 */
@property (nonatomic, strong) NSString * _Nullable documentClassifierArn;

/**
 <p>The time that the document classification job completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The input data configuration that you supplied when you created the document classification job.</p>
 */
@property (nonatomic, strong) AWSComprehendInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The Amazon Resource Name (ARN) of the document classification job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p><p><code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:document-classification-job/&lt;job-id&gt;</code></p><p>The following is an example job ARN:</p><p><code>arn:aws:comprehend:us-west-2:111122223333:document-classification-job/1234abcd12ab34cd56ef1234567890ab</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The identifier assigned to the document classification job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The name that you assigned to the document classification job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The current status of the document classification job. If the status is <code>FAILED</code>, the <code>Message</code> field shows the reason for the failure.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

/**
 <p>A description of the status of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The output data configuration that you supplied when you created the document classification job.</p>
 */
@property (nonatomic, strong) AWSComprehendOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>The time that the document classification job was submitted for processing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submitTime;

/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

/**
 <p> Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your document classification job. For more information, see <a href="https://docs.aws.amazon.com/vppc/latest/userguide/what-is-amazon-vpc.html">Amazon VPC</a>. </p>
 */
@property (nonatomic, strong) AWSComprehendVpcConfig * _Nullable vpcConfig;

@end

/**
 <p>Provides information for filtering a list of document classifiers. You can only specify one filtering parameter in a request. For more information, see the operation.</p>
 */
@interface AWSComprehendDocumentClassifierFilter : AWSModel


/**
 <p>The name that you assigned to the document classifier</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentClassifierName;

/**
 <p>Filters the list of classifiers based on status.</p>
 */
@property (nonatomic, assign) AWSComprehendModelStatus status;

/**
 <p>Filters the list of classifiers based on the time that the classifier was submitted for processing. Returns only classifiers submitted after the specified time. Classifiers are returned in descending order, newest to oldest.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submitTimeAfter;

/**
 <p>Filters the list of classifiers based on the time that the classifier was submitted for processing. Returns only classifiers submitted before the specified time. Classifiers are returned in ascending order, oldest to newest.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submitTimeBefore;

@end

/**
 <p>The input properties for training a document classifier. </p><p>For more information on how the input file is formatted, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/prep-classifier-data.html">Preparing training data</a> in the Comprehend Developer Guide. </p>
 */
@interface AWSComprehendDocumentClassifierInputDataConfig : AWSModel


/**
 <p>A list of augmented manifest files that provide training data for your custom model. An augmented manifest file is a labeled dataset that is produced by Amazon SageMaker Ground Truth.</p><p>This parameter is required if you set <code>DataFormat</code> to <code>AUGMENTED_MANIFEST</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendAugmentedManifestsListItem *> * _Nullable augmentedManifests;

/**
 <p>The format of your training data:</p><ul><li><p><code>COMPREHEND_CSV</code>: A two-column CSV file, where labels are provided in the first column, and documents are provided in the second. If you use this value, you must provide the <code>S3Uri</code> parameter in your request.</p></li><li><p><code>AUGMENTED_MANIFEST</code>: A labeled dataset that is produced by Amazon SageMaker Ground Truth. This file is in JSON lines format. Each line is a complete JSON object that contains a training document and its associated labels. </p><p>If you use this value, you must provide the <code>AugmentedManifests</code> parameter in your request.</p></li></ul><p>If you don't specify a value, Amazon Comprehend uses <code>COMPREHEND_CSV</code> as the default.</p>
 */
@property (nonatomic, assign) AWSComprehendDocumentClassifierDataFormat dataFormat;

/**
 <p>Indicates the delimiter used to separate each label for training a multi-label classifier. The default delimiter between labels is a pipe (|). You can use a different character as a delimiter (if it's an allowed character) by specifying it under Delimiter for labels. If the training documents use a delimiter other than the default or the delimiter you specify, the labels on that line will be combined to make a single unique label, such as LABELLABELLABEL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable labelDelimiter;

/**
 <p>The Amazon S3 URI for the input data. The S3 bucket must be in the same region as the API endpoint that you are calling. The URI can point to a single input file or it can provide the prefix for a collection of input files.</p><p>For example, if you use the URI <code>S3://bucketName/prefix</code>, if the prefix is a single file, Amazon Comprehend uses that file as input. If more than one file begins with the prefix, Amazon Comprehend uses all of them as input.</p><p>This parameter is required if you set <code>DataFormat</code> to <code>COMPREHEND_CSV</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

/**
 <p>This specifies the Amazon S3 location where the test annotations for an entity recognizer are located. The URI must be in the same AWS Region as the API endpoint that you are calling. </p>
 */
@property (nonatomic, strong) NSString * _Nullable testS3Uri;

@end

/**
 <p>Provides output results configuration parameters for custom classifier jobs. </p>
 */
@interface AWSComprehendDocumentClassifierOutputDataConfig : AWSModel


/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt the output results from an analysis job. The KmsKeyId can be one of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>KMS Key Alias: <code>"alias/ExampleAlias"</code></p></li><li><p>ARN of a KMS Key Alias: <code>"arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>When you use the <code>OutputDataConfig</code> object while creating a custom classifier, you specify the Amazon S3 location where you want to write the confusion matrix. The URI must be in the same region as the API endpoint that you are calling. The location is used as the prefix for the actual location of this output file.</p><p>When the custom classifier job is finished, the service creates the output file in a directory specific to the job. The <code>S3Uri</code> field contains the location of the output file, called <code>output.tar.gz</code>. It is a compressed archive that contains the confusion matrix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

@end

/**
 <p>Provides information about a document classifier.</p>
 */
@interface AWSComprehendDocumentClassifierProperties : AWSModel


/**
 <p>Information about the document classifier, including the number of documents used for training the classifier, the number of documents used for test the classifier, and an accuracy rating.</p>
 */
@property (nonatomic, strong) AWSComprehendClassifierMetadata * _Nullable classifierMetadata;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>The Amazon Resource Name (ARN) that identifies the document classifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentClassifierArn;

/**
 <p>The time that training the document classifier completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The input data configuration that you supplied when you created the document classifier for training.</p>
 */
@property (nonatomic, strong) AWSComprehendDocumentClassifierInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The language code for the language of the documents that the classifier was trained on.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>Additional information about the status of the classifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>Indicates the mode in which the specific classifier was trained. This also indicates the format of input documents and the format of the confusion matrix. Each classifier can only be trained in one mode and this cannot be changed once the classifier is trained.</p>
 */
@property (nonatomic, assign) AWSComprehendDocumentClassifierMode mode;

/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt trained custom models. The ModelKmsKeyId can be either of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable modelKmsKeyId;

/**
 <p> Provides output results configuration parameters for custom classifier jobs.</p>
 */
@property (nonatomic, strong) AWSComprehendDocumentClassifierOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>The Amazon Resource Name (ARN) of the source model. This model was imported from a different AWS account to create the document classifier model in your AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceModelArn;

/**
 <p>The status of the document classifier. If the status is <code>TRAINED</code> the classifier is ready to use. If the status is <code>FAILED</code> you can see additional information about why the classifier wasn't trained in the <code>Message</code> field.</p>
 */
@property (nonatomic, assign) AWSComprehendModelStatus status;

/**
 <p>The time that the document classifier was submitted for training.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submitTime;

/**
 <p>The time that training of the document classifier was completed. Indicates the time when the training completes on documentation classifiers. You are billed for the time interval between this time and the value of TrainingStartTime.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable trainingEndTime;

/**
 <p>Indicates the time when the training starts on documentation classifiers. You are billed for the time interval between this time and the value of TrainingEndTime. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable trainingStartTime;

/**
 <p>The version name that you assigned to the document classifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionName;

/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

/**
 <p> Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your custom classifier. For more information, see <a href="https://docs.aws.amazon.com/vppc/latest/userguide/what-is-amazon-vpc.html">Amazon VPC</a>. </p>
 */
@property (nonatomic, strong) AWSComprehendVpcConfig * _Nullable vpcConfig;

@end

/**
 <p>Describes information about a document classifier and its versions.</p>
 */
@interface AWSComprehendDocumentClassifierSummary : AWSModel


/**
 <p>The name that you assigned the document classifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentClassifierName;

/**
 <p>The time that the latest document classifier version was submitted for processing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable latestVersionCreatedAt;

/**
 <p>The version name you assigned to the latest document classifier version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestVersionName;

/**
 <p>Provides the status of the latest document classifier version.</p>
 */
@property (nonatomic, assign) AWSComprehendModelStatus latestVersionStatus;

/**
 <p>The number of versions you created.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfVersions;

@end

/**
 <p>Specifies one of the label or labels that categorize the document being analyzed.</p>
 */
@interface AWSComprehendDocumentLabel : AWSModel


/**
 <p>The name of the label.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Page number where the label occurs. This field is present in the response only if your request includes the <code>Byte</code> parameter. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable page;

/**
 <p>The confidence score that Amazon Comprehend has this label correctly attributed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

@end

/**
 <p>Information about the document, discovered during text extraction.</p>
 */
@interface AWSComprehendDocumentMetadata : AWSModel


/**
 <p>List of pages in the document, with the number of characters extracted from each page.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendExtractedCharactersListItem *> * _Nullable extractedCharacters;

/**
 <p>Number of pages in the document.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pages;

@end

/**
 <p>Provides configuration parameters to override the default actions for extracting text from PDF documents and image files. </p><p> By default, Amazon Comprehend performs the following actions to extract text from files, based on the input file type: </p><ul><li><p><b>Word files</b> - Amazon Comprehend parser extracts the text. </p></li><li><p><b>Digital PDF files</b> - Amazon Comprehend parser extracts the text. </p></li><li><p><b>Image files and scanned PDF files</b> - Amazon Comprehend uses the Amazon Textract <code>DetectDocumentText</code> API to extract the text. </p></li></ul><p><code>DocumentReaderConfig</code> does not apply to plain text files or Word files.</p><p> For image files and PDF documents, you can override these default actions using the fields listed below. For more information, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/detecting-cer.html#detecting-cer-pdf"> Setting text extraction options</a>. </p>
 Required parameters: [DocumentReadAction]
 */
@interface AWSComprehendDocumentReaderConfig : AWSModel


/**
 <p>This field defines the Amazon Textract API operation that Amazon Comprehend uses to extract text from PDF files and image files. Enter one of the following values:</p><ul><li><p><code>TEXTRACT_DETECT_DOCUMENT_TEXT</code> - The Amazon Comprehend service uses the <code>DetectDocumentText</code> API operation. </p></li><li><p><code>TEXTRACT_ANALYZE_DOCUMENT</code> - The Amazon Comprehend service uses the <code>AnalyzeDocument</code> API operation. </p></li></ul>
 */
@property (nonatomic, assign) AWSComprehendDocumentReadAction documentReadAction;

/**
 <p>Determines the text extraction actions for PDF files. Enter one of the following values:</p><ul><li><p><code>SERVICE_DEFAULT</code> - use the Amazon Comprehend service defaults for PDF files.</p></li><li><p><code>FORCE_DOCUMENT_READ_ACTION</code> - Amazon Comprehend uses the Textract API specified by DocumentReadAction for all PDF files, including digital PDF files. </p></li></ul>
 */
@property (nonatomic, assign) AWSComprehendDocumentReadMode documentReadMode;

/**
 <p>Specifies the type of Amazon Textract features to apply. If you chose <code>TEXTRACT_ANALYZE_DOCUMENT</code> as the read action, you must specify one or both of the following values:</p><ul><li><p><code>TABLES</code> - Returns information about any tables that are detected in the input document. </p></li><li><p><code>FORMS</code> - Returns information and the data from any forms that are detected in the input document. </p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable featureTypes;

@end

/**
 <p>Document type for each page in the document.</p>
 */
@interface AWSComprehendDocumentTypeListItem : AWSModel


/**
 <p>Page number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable page;

/**
 <p>Document type.</p>
 */
@property (nonatomic, assign) AWSComprehendDocumentType types;

@end

/**
 <p>Returns the code for the dominant language in the input text and the level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>
 */
@interface AWSComprehendDominantLanguage : AWSModel


/**
 <p>The RFC 5646 language code for the dominant language. For more information about RFC 5646, see <a href="https://tools.ietf.org/html/rfc5646">Tags for Identifying Languages</a> on the <i>IETF Tools</i> web site.</p>
 */
@property (nonatomic, strong) NSString * _Nullable languageCode;

/**
 <p>The level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

@end

/**
 <p>Provides information for filtering a list of dominant language detection jobs. For more information, see the operation.</p>
 */
@interface AWSComprehendDominantLanguageDetectionJobFilter : AWSModel


/**
 <p>Filters on the name of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>Filters the list of jobs based on job status. Returns only jobs with the specified status.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

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
 <p>Provides information about a dominant language detection job.</p>
 */
@interface AWSComprehendDominantLanguageDetectionJobProperties : AWSModel


/**
 <p>The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to your input data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>The time that the dominant language detection job completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The input data configuration that you supplied when you created the dominant language detection job.</p>
 */
@property (nonatomic, strong) AWSComprehendInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The Amazon Resource Name (ARN) of the dominant language detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p><p><code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:dominant-language-detection-job/&lt;job-id&gt;</code></p><p>The following is an example job ARN:</p><p><code>arn:aws:comprehend:us-west-2:111122223333:dominant-language-detection-job/1234abcd12ab34cd56ef1234567890ab</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The identifier assigned to the dominant language detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The name that you assigned to the dominant language detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The current status of the dominant language detection job. If the status is <code>FAILED</code>, the <code>Message</code> field shows the reason for the failure.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

/**
 <p>A description for the status of a job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The output data configuration that you supplied when you created the dominant language detection job.</p>
 */
@property (nonatomic, strong) AWSComprehendOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>The time that the dominant language detection job was submitted for processing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submitTime;

/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

/**
 <p> Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your dominant language detection job. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon VPC</a>. </p>
 */
@property (nonatomic, strong) AWSComprehendVpcConfig * _Nullable vpcConfig;

@end

/**
 <p>The filter used to determine which endpoints are returned. You can filter jobs on their name, model, status, or the date and time that they were created. You can only set one filter at a time. </p>
 */
@interface AWSComprehendEndpointFilter : AWSModel


/**
 <p>Specifies a date after which the returned endpoint or endpoints were created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeAfter;

/**
 <p>Specifies a date before which the returned endpoint or endpoints were created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeBefore;

/**
 <p>The Amazon Resource Number (ARN) of the model to which the endpoint is attached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelArn;

/**
 <p>Specifies the status of the endpoint being returned. Possible values are: Creating, Ready, Updating, Deleting, Failed.</p>
 */
@property (nonatomic, assign) AWSComprehendEndpointStatus status;

@end

/**
 <p>Specifies information about the specified endpoint. For information about endpoints, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html">Managing endpoints</a>.</p>
 */
@interface AWSComprehendEndpointProperties : AWSModel


/**
 <p>The creation date and time of the endpoint.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The number of inference units currently used by the model using this endpoint.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable currentInferenceUnits;

/**
 <p>The Amazon Resource Name (ARN) of the AWS identity and Access Management (IAM) role that grants Amazon Comprehend read access to trained custom models encrypted with a customer managed key (ModelKmsKeyId).</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>Data access role ARN to use in case the new model is encrypted with a customer KMS key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable desiredDataAccessRoleArn;

/**
 <p>The desired number of inference units to be used by the model using this endpoint. Each inference unit represents of a throughput of 100 characters per second.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable desiredInferenceUnits;

/**
 <p>ARN of the new model to use for updating an existing endpoint. This ARN is going to be different from the model ARN when the update is in progress</p>
 */
@property (nonatomic, strong) NSString * _Nullable desiredModelArn;

/**
 <p>The Amazon Resource Number (ARN) of the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

/**
 <p>The date and time that the endpoint was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>Specifies a reason for failure in cases of <code>Failed</code> status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The Amazon Resource Number (ARN) of the model to which the endpoint is attached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelArn;

/**
 <p>Specifies the status of the endpoint. Because the endpoint updates and creation are asynchronous, so customers will need to wait for the endpoint to be <code>Ready</code> status before making inference requests.</p>
 */
@property (nonatomic, assign) AWSComprehendEndpointStatus status;

@end

/**
 <p>Provides information for filtering a list of dominant language detection jobs. For more information, see the operation.</p>
 */
@interface AWSComprehendEntitiesDetectionJobFilter : AWSModel


/**
 <p>Filters on the name of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>Filters the list of jobs based on job status. Returns only jobs with the specified status.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

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
 <p>Provides information about an entities detection job.</p>
 */
@interface AWSComprehendEntitiesDetectionJobProperties : AWSModel


/**
 <p>The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to your input data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>The time that the entities detection job completed</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The Amazon Resource Name (ARN) that identifies the entity recognizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityRecognizerArn;

/**
 <p>The input data configuration that you supplied when you created the entities detection job.</p>
 */
@property (nonatomic, strong) AWSComprehendInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The Amazon Resource Name (ARN) of the entities detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p><p><code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:entities-detection-job/&lt;job-id&gt;</code></p><p>The following is an example job ARN:</p><p><code>arn:aws:comprehend:us-west-2:111122223333:entities-detection-job/1234abcd12ab34cd56ef1234567890ab</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The identifier assigned to the entities detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The name that you assigned the entities detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The current status of the entities detection job. If the status is <code>FAILED</code>, the <code>Message</code> field shows the reason for the failure.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

/**
 <p>The language code of the input documents.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>A description of the status of a job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The output data configuration that you supplied when you created the entities detection job. </p>
 */
@property (nonatomic, strong) AWSComprehendOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>The time that the entities detection job was submitted for processing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submitTime;

/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

/**
 <p> Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your entity detection job. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon VPC</a>. </p>
 */
@property (nonatomic, strong) AWSComprehendVpcConfig * _Nullable vpcConfig;

@end

/**
 <p>Provides information about an entity. </p><p></p>
 */
@interface AWSComprehendEntity : AWSModel


/**
 <p>The zero-based offset from the beginning of the source text to the first character in the entity.</p><p>This field is empty for non-text input.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable beginOffset;

/**
 <p>A reference to each block for this entity. This field is empty for plain-text input.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendBlockReference *> * _Nullable blockReferences;

/**
 <p>The zero-based offset from the beginning of the source text to the last character in the entity.</p><p>This field is empty for non-text input.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endOffset;

/**
 <p>The level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

/**
 <p>The text of the entity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

/**
 <p>The entity type. For entity detection using the built-in model, this field contains one of the standard entity types listed below.</p><p>For custom entity detection, this field contains one of the entity types that you specified when you trained your custom model.</p>
 */
@property (nonatomic, assign) AWSComprehendEntityType types;

@end

/**
 <p>Specifies one of the label or labels that categorize the personally identifiable information (PII) entity being analyzed.</p>
 */
@interface AWSComprehendEntityLabel : AWSModel


/**
 <p>The name of the label.</p>
 */
@property (nonatomic, assign) AWSComprehendPiiEntityType name;

/**
 <p>The level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

@end

/**
 <p>Describes the annotations associated with a entity recognizer.</p>
 Required parameters: [S3Uri]
 */
@interface AWSComprehendEntityRecognizerAnnotations : AWSModel


/**
 <p> Specifies the Amazon S3 location where the annotations for an entity recognizer are located. The URI must be in the same region as the API endpoint that you are calling.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

/**
 <p> Specifies the Amazon S3 location where the test annotations for an entity recognizer are located. The URI must be in the same region as the API endpoint that you are calling.</p>
 */
@property (nonatomic, strong) NSString * _Nullable testS3Uri;

@end

/**
 <p>Describes the training documents submitted with an entity recognizer.</p>
 Required parameters: [S3Uri]
 */
@interface AWSComprehendEntityRecognizerDocuments : AWSModel


/**
 <p> Specifies how the text in an input file should be processed. This is optional, and the default is ONE_DOC_PER_LINE. ONE_DOC_PER_FILE - Each file is considered a separate document. Use this option when you are processing large documents, such as newspaper articles or scientific papers. ONE_DOC_PER_LINE - Each line in a file is considered a separate document. Use this option when you are processing many short documents, such as text messages.</p>
 */
@property (nonatomic, assign) AWSComprehendInputFormat inputFormat;

/**
 <p> Specifies the Amazon S3 location where the training documents for an entity recognizer are located. The URI must be in the same region as the API endpoint that you are calling.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

/**
 <p> Specifies the Amazon S3 location where the test documents for an entity recognizer are located. The URI must be in the same AWS Region as the API endpoint that you are calling.</p>
 */
@property (nonatomic, strong) NSString * _Nullable testS3Uri;

@end

/**
 <p>Describes the entity recognizer submitted with an entity recognizer.</p>
 Required parameters: [S3Uri]
 */
@interface AWSComprehendEntityRecognizerEntityList : AWSModel


/**
 <p>Specifies the Amazon S3 location where the entity list is located. The URI must be in the same region as the API endpoint that you are calling.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

@end

/**
 <p>Detailed information about the accuracy of an entity recognizer. </p>
 */
@interface AWSComprehendEntityRecognizerEvaluationMetrics : AWSModel


/**
 <p>A measure of how accurate the recognizer results are for the test data. It is derived from the <code>Precision</code> and <code>Recall</code> values. The <code>F1Score</code> is the harmonic average of the two scores. For plain text entity recognizer models, the range is 0 to 100, where 100 is the best score. For PDF/Word entity recognizer models, the range is 0 to 1, where 1 is the best score. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable f1Score;

/**
 <p>A measure of the usefulness of the recognizer results in the test data. High precision means that the recognizer returned substantially more relevant results than irrelevant ones. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable precision;

/**
 <p>A measure of how complete the recognizer results are for the test data. High recall means that the recognizer returned most of the relevant results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recall;

@end

/**
 <p>Provides information for filtering a list of entity recognizers. You can only specify one filtering parameter in a request. For more information, see the operation./&gt;</p>
 */
@interface AWSComprehendEntityRecognizerFilter : AWSModel


/**
 <p>The name that you assigned the entity recognizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recognizerName;

/**
 <p>The status of an entity recognizer.</p>
 */
@property (nonatomic, assign) AWSComprehendModelStatus status;

/**
 <p>Filters the list of entities based on the time that the list was submitted for processing. Returns only jobs submitted after the specified time. Jobs are returned in ascending order, oldest to newest.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submitTimeAfter;

/**
 <p>Filters the list of entities based on the time that the list was submitted for processing. Returns only jobs submitted before the specified time. Jobs are returned in descending order, newest to oldest.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submitTimeBefore;

@end

/**
 <p>Specifies the format and location of the input data.</p>
 Required parameters: [EntityTypes]
 */
@interface AWSComprehendEntityRecognizerInputDataConfig : AWSModel


/**
 <p>The S3 location of the CSV file that annotates your training documents.</p>
 */
@property (nonatomic, strong) AWSComprehendEntityRecognizerAnnotations * _Nullable annotations;

/**
 <p>A list of augmented manifest files that provide training data for your custom model. An augmented manifest file is a labeled dataset that is produced by Amazon SageMaker Ground Truth.</p><p>This parameter is required if you set <code>DataFormat</code> to <code>AUGMENTED_MANIFEST</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendAugmentedManifestsListItem *> * _Nullable augmentedManifests;

/**
 <p>The format of your training data:</p><ul><li><p><code>COMPREHEND_CSV</code>: A CSV file that supplements your training documents. The CSV file contains information about the custom entities that your trained model will detect. The required format of the file depends on whether you are providing annotations or an entity list.</p><p>If you use this value, you must provide your CSV file by using either the <code>Annotations</code> or <code>EntityList</code> parameters. You must provide your training documents by using the <code>Documents</code> parameter.</p></li><li><p><code>AUGMENTED_MANIFEST</code>: A labeled dataset that is produced by Amazon SageMaker Ground Truth. This file is in JSON lines format. Each line is a complete JSON object that contains a training document and its labels. Each label annotates a named entity in the training document. </p><p>If you use this value, you must provide the <code>AugmentedManifests</code> parameter in your request.</p></li></ul><p>If you don't specify a value, Amazon Comprehend uses <code>COMPREHEND_CSV</code> as the default.</p>
 */
@property (nonatomic, assign) AWSComprehendEntityRecognizerDataFormat dataFormat;

/**
 <p>The S3 location of the folder that contains the training documents for your custom entity recognizer.</p><p>This parameter is required if you set <code>DataFormat</code> to <code>COMPREHEND_CSV</code>.</p>
 */
@property (nonatomic, strong) AWSComprehendEntityRecognizerDocuments * _Nullable documents;

/**
 <p>The S3 location of the CSV file that has the entity list for your custom entity recognizer.</p>
 */
@property (nonatomic, strong) AWSComprehendEntityRecognizerEntityList * _Nullable entityList;

/**
 <p>The entity types in the labeled training data that Amazon Comprehend uses to train the custom entity recognizer. Any entity types that you don't specify are ignored.</p><p>A maximum of 25 entity types can be used at one time to train an entity recognizer. Entity types must not contain the following invalid characters: \n (line break), \\n (escaped line break), \r (carriage return), \\r (escaped carriage return), \t (tab), \\t (escaped tab), space, and , (comma). </p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendEntityTypesListItem *> * _Nullable entityTypes;

@end

/**
 <p>Detailed information about an entity recognizer.</p>
 */
@interface AWSComprehendEntityRecognizerMetadata : AWSModel


/**
 <p>Entity types from the metadata of an entity recognizer.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendEntityRecognizerMetadataEntityTypesListItem *> * _Nullable entityTypes;

/**
 <p>Detailed information about the accuracy of an entity recognizer.</p>
 */
@property (nonatomic, strong) AWSComprehendEntityRecognizerEvaluationMetrics * _Nullable evaluationMetrics;

/**
 <p> The number of documents in the input data that were used to test the entity recognizer. Typically this is 10 to 20 percent of the input documents.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfTestDocuments;

/**
 <p> The number of documents in the input data that were used to train the entity recognizer. Typically this is 80 to 90 percent of the input documents.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfTrainedDocuments;

@end

/**
 <p>Individual item from the list of entity types in the metadata of an entity recognizer.</p>
 */
@interface AWSComprehendEntityRecognizerMetadataEntityTypesListItem : AWSModel


/**
 <p>Detailed information about the accuracy of the entity recognizer for a specific item on the list of entity types. </p>
 */
@property (nonatomic, strong) AWSComprehendEntityTypesEvaluationMetrics * _Nullable evaluationMetrics;

/**
 <p>Indicates the number of times the given entity type was seen in the training data. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfTrainMentions;

/**
 <p>Type of entity from the list of entity types in the metadata of an entity recognizer. </p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>Describes information about an entity recognizer.</p>
 */
@interface AWSComprehendEntityRecognizerProperties : AWSModel


/**
 <p> The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>The time that the recognizer creation completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The Amazon Resource Name (ARN) that identifies the entity recognizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityRecognizerArn;

/**
 <p>The input data properties of an entity recognizer.</p>
 */
@property (nonatomic, strong) AWSComprehendEntityRecognizerInputDataConfig * _Nullable inputDataConfig;

/**
 <p> The language of the input documents. All documents must be in the same language. Only English ("en") is currently supported.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p> A description of the status of the recognizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt trained custom models. The ModelKmsKeyId can be either of the following formats: </p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable modelKmsKeyId;

/**
 <p> Provides information about an entity recognizer.</p>
 */
@property (nonatomic, strong) AWSComprehendEntityRecognizerMetadata * _Nullable recognizerMetadata;

/**
 <p>The Amazon Resource Name (ARN) of the source model. This model was imported from a different AWS account to create the entity recognizer model in your AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceModelArn;

/**
 <p>Provides the status of the entity recognizer.</p>
 */
@property (nonatomic, assign) AWSComprehendModelStatus status;

/**
 <p>The time that the recognizer was submitted for processing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submitTime;

/**
 <p>The time that training of the entity recognizer was completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable trainingEndTime;

/**
 <p>The time that training of the entity recognizer started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable trainingStartTime;

/**
 <p>The version name you assigned to the entity recognizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionName;

/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

/**
 <p> Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your custom entity recognizer. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon VPC</a>. </p>
 */
@property (nonatomic, strong) AWSComprehendVpcConfig * _Nullable vpcConfig;

@end

/**
 <p> Describes the information about an entity recognizer and its versions.</p>
 */
@interface AWSComprehendEntityRecognizerSummary : AWSModel


/**
 <p> The time that the latest entity recognizer version was submitted for processing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable latestVersionCreatedAt;

/**
 <p> The version name you assigned to the latest entity recognizer version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestVersionName;

/**
 <p> Provides the status of the latest entity recognizer version.</p>
 */
@property (nonatomic, assign) AWSComprehendModelStatus latestVersionStatus;

/**
 <p> The number of versions you created.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfVersions;

/**
 <p> The name that you assigned the entity recognizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recognizerName;

@end

/**
 <p>Detailed information about the accuracy of an entity recognizer for a specific entity type. </p>
 */
@interface AWSComprehendEntityTypesEvaluationMetrics : AWSModel


/**
 <p>A measure of how accurate the recognizer results are for a specific entity type in the test data. It is derived from the <code>Precision</code> and <code>Recall</code> values. The <code>F1Score</code> is the harmonic average of the two scores. The highest score is 1, and the worst score is 0. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable f1Score;

/**
 <p>A measure of the usefulness of the recognizer results for a specific entity type in the test data. High precision means that the recognizer returned substantially more relevant results than irrelevant ones. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable precision;

/**
 <p>A measure of how complete the recognizer results are for a specific entity type in the test data. High recall means that the recognizer returned most of the relevant results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recall;

@end

/**
 <p>An entity type within a labeled training dataset that Amazon Comprehend uses to train a custom entity recognizer.</p>
 Required parameters: [Type]
 */
@interface AWSComprehendEntityTypesListItem : AWSModel


/**
 <p>An entity type within a labeled training dataset that Amazon Comprehend uses to train a custom entity recognizer.</p><p>Entity types must not contain the following invalid characters: \n (line break), \\n (escaped line break, \r (carriage return), \\r (escaped carriage return), \t (tab), \\t (escaped tab), space, and , (comma).</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>Text extraction encountered one or more page-level errors in the input document.</p><p>The <code>ErrorCode</code> contains one of the following values:</p><ul><li><p>TEXTRACT_BAD_PAGE - Amazon Textract cannot read the page. For more information about page limits in Amazon Textract, see <a href="https://docs.aws.amazon.com/textract/latest/dg/limits-document.html"> Page Quotas in Amazon Textract</a>.</p></li><li><p>TEXTRACT_PROVISIONED_THROUGHPUT_EXCEEDED - The number of requests exceeded your throughput limit. For more information about throughput quotas in Amazon Textract, see <a href="https://docs.aws.amazon.com/textract/latest/dg/limits-quotas-explained.html"> Default quotas in Amazon Textract</a>.</p></li><li><p>PAGE_CHARACTERS_EXCEEDED - Too many text characters on the page (10,000 characters maximum).</p></li><li><p>PAGE_SIZE_EXCEEDED - The maximum page size is 10 MB.</p></li><li><p>INTERNAL_SERVER_ERROR - The request encountered a service issue. Try the API request again.</p></li></ul>
 */
@interface AWSComprehendErrorsListItem : AWSModel


/**
 <p>Error code for the cause of the error.</p>
 */
@property (nonatomic, assign) AWSComprehendPageBasedErrorCode errorCode;

/**
 <p>Text message explaining the reason for the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>Page number where the error occurred.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable page;

@end

/**
 <p>Provides information for filtering a list of event detection jobs.</p>
 */
@interface AWSComprehendEventsDetectionJobFilter : AWSModel


/**
 <p>Filters on the name of the events detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>Filters the list of jobs based on job status. Returns only jobs with the specified status.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

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
 <p>Provides information about an events detection job.</p>
 */
@interface AWSComprehendEventsDetectionJobProperties : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the AWS Identify and Access Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>The time that the events detection job completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The input data configuration that you supplied when you created the events detection job.</p>
 */
@property (nonatomic, strong) AWSComprehendInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The Amazon Resource Name (ARN) of the events detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p><p><code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:events-detection-job/&lt;job-id&gt;</code></p><p>The following is an example job ARN:</p><p><code>arn:aws:comprehend:us-west-2:111122223333:events-detection-job/1234abcd12ab34cd56ef1234567890ab</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The identifier assigned to the events detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The name you assigned the events detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The current status of the events detection job.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

/**
 <p>The language code of the input documents.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>A description of the status of the events detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The output data configuration that you supplied when you created the events detection job.</p>
 */
@property (nonatomic, strong) AWSComprehendOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>The time that the events detection job was submitted for processing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submitTime;

/**
 <p>The types of events that are detected by the job.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetEventTypes;

@end

/**
 <p>Array of the number of characters extracted from each page.</p>
 */
@interface AWSComprehendExtractedCharactersListItem : AWSModel


/**
 <p>Number of characters extracted from each page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 <p>Page number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable page;

@end

/**
 <p>Information about the location of items on a document page.</p><p>For additional information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/API_Geometry.html">Geometry</a> in the Amazon Textract API reference.</p>
 */
@interface AWSComprehendGeometry : AWSModel


/**
 <p>An axis-aligned coarse representation of the location of the recognized item on the document page.</p>
 */
@property (nonatomic, strong) AWSComprehendBoundingBox * _Nullable boundingBox;

/**
 <p>Within the bounding box, a fine-grained polygon around the recognized item.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendPoint *> * _Nullable polygon;

@end

/**
 
 */
@interface AWSComprehendImportModelRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM) role that allows Amazon Comprehend to use Amazon Key Management Service (KMS) to encrypt or decrypt the custom model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt trained custom models. The ModelKmsKeyId can be either of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable modelKmsKeyId;

/**
 <p>The name to assign to the custom model that is created in Amazon Comprehend by this import.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelName;

/**
 <p>The Amazon Resource Name (ARN) of the custom model to import.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceModelArn;

/**
 <p>Tags to be associated with the custom model that is created by this import. A tag is a key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a resource to indicate its use by the sales department.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendTag *> * _Nullable tags;

/**
 <p>The version name given to the custom model that is created by this import. Version names can have a maximum of 256 characters. Alphanumeric characters, hyphens (-) and underscores (_) are allowed. The version name must be unique among all models with the same classifier name in the account/AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionName;

@end

/**
 
 */
@interface AWSComprehendImportModelResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the custom model being imported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelArn;

@end

/**
 <p>The input properties for an inference job. The document reader config field applies only to non-text inputs for custom analysis.</p>
 Required parameters: [S3Uri]
 */
@interface AWSComprehendInputDataConfig : AWSModel


/**
 <p>Provides configuration parameters to override the default actions for extracting text from PDF documents and image files.</p>
 */
@property (nonatomic, strong) AWSComprehendDocumentReaderConfig * _Nullable documentReaderConfig;

/**
 <p>Specifies how the text in an input file should be processed:</p><ul><li><p><code>ONE_DOC_PER_FILE</code> - Each file is considered a separate document. Use this option when you are processing large documents, such as newspaper articles or scientific papers.</p></li><li><p><code>ONE_DOC_PER_LINE</code> - Each line in a file is considered a separate document. Use this option when you are processing many short documents, such as text messages.</p></li></ul>
 */
@property (nonatomic, assign) AWSComprehendInputFormat inputFormat;

/**
 <p>The Amazon S3 URI for the input data. The URI must be in same region as the API endpoint that you are calling. The URI can point to a single input file or it can provide the prefix for a collection of data files. </p><p>For example, if you use the URI <code>S3://bucketName/prefix</code>, if the prefix is a single file, Amazon Comprehend uses that file as input. If more than one file begins with the prefix, Amazon Comprehend uses all of them as input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

@end

/**
 <p>Provides additional detail about why the request failed:</p><ul><li><p>Document size is too large - Check the size of your file and resubmit the request.</p></li><li><p>Document type is not supported - Check the file type and resubmit the request.</p></li><li><p>Too many pages in the document - Check the number of pages in your file and resubmit the request.</p></li><li><p>Access denied to Amazon Textract - Verify that your account has permission to use Amazon Textract API operations and resubmit the request.</p></li></ul>
 */
@interface AWSComprehendInvalidRequestDetail : AWSModel


/**
 <p>Reason code is <code>INVALID_DOCUMENT</code>.</p>
 */
@property (nonatomic, assign) AWSComprehendInvalidRequestDetailReason reason;

@end

/**
 <p>Describes a key noun phrase.</p>
 */
@interface AWSComprehendKeyPhrase : AWSModel


/**
 <p>The zero-based offset from the beginning of the source text to the first character in the key phrase.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable beginOffset;

/**
 <p>The zero-based offset from the beginning of the source text to the last character in the key phrase.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endOffset;

/**
 <p>The level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

/**
 <p>The text of a key noun phrase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 <p>Provides information for filtering a list of dominant language detection jobs. For more information, see the operation.</p>
 */
@interface AWSComprehendKeyPhrasesDetectionJobFilter : AWSModel


/**
 <p>Filters on the name of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>Filters the list of jobs based on job status. Returns only jobs with the specified status.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

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
 <p>Provides information about a key phrases detection job.</p>
 */
@interface AWSComprehendKeyPhrasesDetectionJobProperties : AWSModel


/**
 <p>The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to your input data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>The time that the key phrases detection job completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The input data configuration that you supplied when you created the key phrases detection job.</p>
 */
@property (nonatomic, strong) AWSComprehendInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The Amazon Resource Name (ARN) of the key phrases detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p><p><code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:key-phrases-detection-job/&lt;job-id&gt;</code></p><p>The following is an example job ARN:</p><p><code>arn:aws:comprehend:us-west-2:111122223333:key-phrases-detection-job/1234abcd12ab34cd56ef1234567890ab</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The identifier assigned to the key phrases detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The name that you assigned the key phrases detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The current status of the key phrases detection job. If the status is <code>FAILED</code>, the <code>Message</code> field shows the reason for the failure.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

/**
 <p>The language code of the input documents.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>A description of the status of a job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The output data configuration that you supplied when you created the key phrases detection job.</p>
 */
@property (nonatomic, strong) AWSComprehendOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>The time that the key phrases detection job was submitted for processing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submitTime;

/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

/**
 <p> Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your key phrases detection job. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon VPC</a>. </p>
 */
@property (nonatomic, strong) AWSComprehendVpcConfig * _Nullable vpcConfig;

@end

/**
 
 */
@interface AWSComprehendListDocumentClassificationJobsRequest : AWSRequest


/**
 <p>Filters the jobs that are returned. You can filter jobs on their names, status, or the date and time that they were submitted. You can only set one filter at a time.</p>
 */
@property (nonatomic, strong) AWSComprehendDocumentClassificationJobFilter * _Nullable filter;

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
@interface AWSComprehendListDocumentClassificationJobsResponse : AWSModel


/**
 <p>A list containing the properties of each job returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendDocumentClassificationJobProperties *> * _Nullable documentClassificationJobPropertiesList;

/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSComprehendListDocumentClassifierSummariesRequest : AWSRequest


/**
 <p>The maximum number of results to return on each page. The default is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSComprehendListDocumentClassifierSummariesResponse : AWSModel


/**
 <p>The list of summaries of document classifiers.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendDocumentClassifierSummary *> * _Nullable documentClassifierSummariesList;

/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSComprehendListDocumentClassifiersRequest : AWSRequest


/**
 <p>Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time.</p>
 */
@property (nonatomic, strong) AWSComprehendDocumentClassifierFilter * _Nullable filter;

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
@interface AWSComprehendListDocumentClassifiersResponse : AWSModel


/**
 <p>A list containing the properties of each job returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendDocumentClassifierProperties *> * _Nullable documentClassifierPropertiesList;

/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSComprehendListDominantLanguageDetectionJobsRequest : AWSRequest


/**
 <p>Filters that jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time.</p>
 */
@property (nonatomic, strong) AWSComprehendDominantLanguageDetectionJobFilter * _Nullable filter;

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
@interface AWSComprehendListDominantLanguageDetectionJobsResponse : AWSModel


/**
 <p>A list containing the properties of each job that is returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendDominantLanguageDetectionJobProperties *> * _Nullable dominantLanguageDetectionJobPropertiesList;

/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSComprehendListEndpointsRequest : AWSRequest


/**
 <p>Filters the endpoints that are returned. You can filter endpoints on their name, model, status, or the date and time that they were created. You can only set one filter at a time. </p>
 */
@property (nonatomic, strong) AWSComprehendEndpointFilter * _Nullable filter;

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
@interface AWSComprehendListEndpointsResponse : AWSModel


/**
 <p>Displays a list of endpoint properties being retrieved by the service in response to the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendEndpointProperties *> * _Nullable endpointPropertiesList;

/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSComprehendListEntitiesDetectionJobsRequest : AWSRequest


/**
 <p>Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time.</p>
 */
@property (nonatomic, strong) AWSComprehendEntitiesDetectionJobFilter * _Nullable filter;

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
@interface AWSComprehendListEntitiesDetectionJobsResponse : AWSModel


/**
 <p>A list containing the properties of each job that is returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendEntitiesDetectionJobProperties *> * _Nullable entitiesDetectionJobPropertiesList;

/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSComprehendListEntityRecognizerSummariesRequest : AWSRequest


/**
 <p>The maximum number of results to return on each page. The default is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSComprehendListEntityRecognizerSummariesResponse : AWSModel


/**
 <p>The list entity recognizer summaries.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendEntityRecognizerSummary *> * _Nullable entityRecognizerSummariesList;

/**
 <p>The list entity recognizer summaries.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSComprehendListEntityRecognizersRequest : AWSRequest


/**
 <p>Filters the list of entities returned. You can filter on <code>Status</code>, <code>SubmitTimeBefore</code>, or <code>SubmitTimeAfter</code>. You can only set one filter at a time.</p>
 */
@property (nonatomic, strong) AWSComprehendEntityRecognizerFilter * _Nullable filter;

/**
 <p> The maximum number of results to return on each page. The default is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSComprehendListEntityRecognizersResponse : AWSModel


/**
 <p>The list of properties of an entity recognizer.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendEntityRecognizerProperties *> * _Nullable entityRecognizerPropertiesList;

/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSComprehendListEventsDetectionJobsRequest : AWSRequest


/**
 <p>Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time.</p>
 */
@property (nonatomic, strong) AWSComprehendEventsDetectionJobFilter * _Nullable filter;

/**
 <p>The maximum number of results to return in each page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSComprehendListEventsDetectionJobsResponse : AWSModel


/**
 <p>A list containing the properties of each job that is returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendEventsDetectionJobProperties *> * _Nullable eventsDetectionJobPropertiesList;

/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSComprehendListKeyPhrasesDetectionJobsRequest : AWSRequest


/**
 <p>Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time.</p>
 */
@property (nonatomic, strong) AWSComprehendKeyPhrasesDetectionJobFilter * _Nullable filter;

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
@interface AWSComprehendListKeyPhrasesDetectionJobsResponse : AWSModel


/**
 <p>A list containing the properties of each job that is returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendKeyPhrasesDetectionJobProperties *> * _Nullable keyPhrasesDetectionJobPropertiesList;

/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSComprehendListPiiEntitiesDetectionJobsRequest : AWSRequest


/**
 <p>Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time.</p>
 */
@property (nonatomic, strong) AWSComprehendPiiEntitiesDetectionJobFilter * _Nullable filter;

/**
 <p>The maximum number of results to return in each page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSComprehendListPiiEntitiesDetectionJobsResponse : AWSModel


/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list containing the properties of each job that is returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendPiiEntitiesDetectionJobProperties *> * _Nullable piiEntitiesDetectionJobPropertiesList;

@end

/**
 
 */
@interface AWSComprehendListSentimentDetectionJobsRequest : AWSRequest


/**
 <p>Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time.</p>
 */
@property (nonatomic, strong) AWSComprehendSentimentDetectionJobFilter * _Nullable filter;

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
@interface AWSComprehendListSentimentDetectionJobsResponse : AWSModel


/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list containing the properties of each job that is returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendSentimentDetectionJobProperties *> * _Nullable sentimentDetectionJobPropertiesList;

@end

/**
 
 */
@interface AWSComprehendListTagsForResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the given Amazon Comprehend resource you are querying. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSComprehendListTagsForResourceResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the given Amazon Comprehend resource you are querying.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>Tags associated with the Amazon Comprehend resource being queried. A tag is a key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a resource to indicate its use by the sales department. </p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSComprehendListTargetedSentimentDetectionJobsRequest : AWSRequest


/**
 <p>Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time.</p>
 */
@property (nonatomic, strong) AWSComprehendTargetedSentimentDetectionJobFilter * _Nullable filter;

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
@interface AWSComprehendListTargetedSentimentDetectionJobsResponse : AWSModel


/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list containing the properties of each job that is returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendTargetedSentimentDetectionJobProperties *> * _Nullable targetedSentimentDetectionJobPropertiesList;

@end

/**
 
 */
@interface AWSComprehendListTopicsDetectionJobsRequest : AWSRequest


/**
 <p>Filters the jobs that are returned. Jobs can be filtered on their name, status, or the date and time that they were submitted. You can set only one filter at a time.</p>
 */
@property (nonatomic, strong) AWSComprehendTopicsDetectionJobFilter * _Nullable filter;

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
@interface AWSComprehendListTopicsDetectionJobsResponse : AWSModel


/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list containing the properties of each job that is returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendTopicsDetectionJobProperties *> * _Nullable topicsDetectionJobPropertiesList;

@end

/**
 <p>Contains the sentiment and sentiment score for one mention of an entity.</p><p>For more information about targeted sentiment, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html">Targeted sentiment</a>.</p>
 */
@interface AWSComprehendMentionSentiment : AWSModel


/**
 <p>The sentiment of the mention. </p>
 */
@property (nonatomic, assign) AWSComprehendSentimentType sentiment;

/**
 <p>Describes the level of confidence that Amazon Comprehend has in the accuracy of its detection of sentiments.</p>
 */
@property (nonatomic, strong) AWSComprehendSentimentScore * _Nullable sentimentScore;

@end

/**
 <p>Provides configuration parameters for the output of inference jobs.</p><p/>
 Required parameters: [S3Uri]
 */
@interface AWSComprehendOutputDataConfig : AWSModel


/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt the output results from an analysis job. The KmsKeyId can be one of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>KMS Key Alias: <code>"alias/ExampleAlias"</code></p></li><li><p>ARN of a KMS Key Alias: <code>"arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>When you use the <code>OutputDataConfig</code> object with asynchronous operations, you specify the Amazon S3 location where you want to write the output data. The URI must be in the same region as the API endpoint that you are calling. The location is used as the prefix for the actual location of the output file.</p><p>When the topic detection job is finished, the service creates an output file in a directory specific to the job. The <code>S3Uri</code> field contains the location of the output file, called <code>output.tar.gz</code>. It is a compressed archive that contains the ouput of the operation.</p><p> For a PII entity detection job, the output file is plain text, not a compressed archive. The output file name is the same as the input file, with <code>.out</code> appended at the end. </p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

@end

/**
 <p>Identifies the part of speech represented by the token and gives the confidence that Amazon Comprehend has that the part of speech was correctly identified. For more information about the parts of speech that Amazon Comprehend can identify, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/how-syntax.html">Syntax</a> in the Comprehend Developer Guide. </p>
 */
@interface AWSComprehendPartOfSpeechTag : AWSModel


/**
 <p>The confidence that Amazon Comprehend has that the part of speech was correctly identified.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

/**
 <p>Identifies the part of speech that the token represents.</p>
 */
@property (nonatomic, assign) AWSComprehendPartOfSpeechTagType tag;

@end

/**
 <p>Provides information for filtering a list of PII entity detection jobs.</p>
 */
@interface AWSComprehendPiiEntitiesDetectionJobFilter : AWSModel


/**
 <p>Filters on the name of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>Filters the list of jobs based on job status. Returns only jobs with the specified status.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

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
 <p>Provides information about a PII entities detection job.</p>
 */
@interface AWSComprehendPiiEntitiesDetectionJobProperties : AWSModel


/**
 <p>The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to your input data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>The time that the PII entities detection job completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The input properties for a PII entities detection job.</p>
 */
@property (nonatomic, strong) AWSComprehendInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The Amazon Resource Name (ARN) of the PII entities detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p><p><code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:pii-entities-detection-job/&lt;job-id&gt;</code></p><p>The following is an example job ARN:</p><p><code>arn:aws:comprehend:us-west-2:111122223333:pii-entities-detection-job/1234abcd12ab34cd56ef1234567890ab</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The identifier assigned to the PII entities detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The name that you assigned the PII entities detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The current status of the PII entities detection job. If the status is <code>FAILED</code>, the <code>Message</code> field shows the reason for the failure.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

/**
 <p>The language code of the input documents</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>A description of the status of a job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>Specifies whether the output provides the locations (offsets) of PII entities or a file in which PII entities are redacted.</p>
 */
@property (nonatomic, assign) AWSComprehendPiiEntitiesDetectionMode mode;

/**
 <p>The output data configuration that you supplied when you created the PII entities detection job.</p>
 */
@property (nonatomic, strong) AWSComprehendPiiOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>Provides configuration parameters for PII entity redaction.</p><p>This parameter is required if you set the <code>Mode</code> parameter to <code>ONLY_REDACTION</code>. In that case, you must provide a <code>RedactionConfig</code> definition that includes the <code>PiiEntityTypes</code> parameter.</p>
 */
@property (nonatomic, strong) AWSComprehendRedactionConfig * _Nullable redactionConfig;

/**
 <p>The time that the PII entities detection job was submitted for processing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submitTime;

@end

/**
 <p>Provides information about a PII entity.</p>
 */
@interface AWSComprehendPiiEntity : AWSModel


/**
 <p>The zero-based offset from the beginning of the source text to the first character in the entity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable beginOffset;

/**
 <p>The zero-based offset from the beginning of the source text to the last character in the entity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endOffset;

/**
 <p>The level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

/**
 <p>The entity's type.</p>
 */
@property (nonatomic, assign) AWSComprehendPiiEntityType types;

@end

/**
 <p>Provides configuration parameters for the output of PII entity detection jobs.</p>
 Required parameters: [S3Uri]
 */
@interface AWSComprehendPiiOutputDataConfig : AWSModel


/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt the output results from an analysis job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>When you use the <code>PiiOutputDataConfig</code> object with asynchronous operations, you specify the Amazon S3 location where you want to write the output data. </p><p> For a PII entity detection job, the output file is plain text, not a compressed archive. The output file name is the same as the input file, with <code>.out</code> appended at the end. </p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

@end

/**
 <p>The X and Y coordinates of a point on a document page.</p><p>For additional information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/API_Point.html">Point</a> in the Amazon Textract API reference.</p>
 */
@interface AWSComprehendPoint : AWSModel


/**
 <p>The value of the X coordinate for a point on a polygon</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable X;

/**
 <p>The value of the Y coordinate for a point on a polygon</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable Y;

@end

/**
 
 */
@interface AWSComprehendPutResourcePolicyRequest : AWSRequest


/**
 <p>The revision ID that Amazon Comprehend assigned to the policy that you are updating. If you are creating a new policy that has no prior version, don't use this parameter. Amazon Comprehend creates the revision ID for you.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyRevisionId;

/**
 <p>The Amazon Resource Name (ARN) of the custom model to attach the policy to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The JSON resource-based policy to attach to your custom model. Provide your JSON as a UTF-8 encoded string without line breaks. To provide valid JSON for your policy, enclose the attribute names and values in double quotes. If the JSON body is also enclosed in double quotes, then you must escape the double quotes that are inside the policy:</p><p><code>"{\"attribute\": \"value\", \"attribute\": [\"value\"]}"</code></p><p>To avoid escaping quotes, you can use single quotes to enclose the policy and double quotes to enclose the JSON names and values:</p><p><code>'{"attribute": "value", "attribute": ["value"]}'</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable resourcePolicy;

@end

/**
 
 */
@interface AWSComprehendPutResourcePolicyResponse : AWSModel


/**
 <p>The revision ID of the policy. Each time you modify a policy, Amazon Comprehend assigns a new revision ID, and it deletes the prior version of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyRevisionId;

@end

/**
 <p>Provides configuration parameters for PII entity redaction.</p>
 */
@interface AWSComprehendRedactionConfig : AWSModel


/**
 <p>A character that replaces each character in the redacted PII entity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maskCharacter;

/**
 <p>Specifies whether the PII entity is redacted with the mask character or the entity type.</p>
 */
@property (nonatomic, assign) AWSComprehendPiiEntitiesDetectionMaskMode maskMode;

/**
 <p>An array of the types of PII entities that Amazon Comprehend detects in the input text for your request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable piiEntityTypes;

@end

/**
 <p>List of child blocks for the current block.</p>
 */
@interface AWSComprehendRelationshipsListItem : AWSModel


/**
 <p>Identifers of the child blocks.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable ids;

/**
 <p>Only supported relationship is a child relationship.</p>
 */
@property (nonatomic, assign) AWSComprehendRelationshipType types;

@end

/**
 <p>Provides information for filtering a list of dominant language detection jobs. For more information, see the operation.</p>
 */
@interface AWSComprehendSentimentDetectionJobFilter : AWSModel


/**
 <p>Filters on the name of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>Filters the list of jobs based on job status. Returns only jobs with the specified status.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

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
 <p>Provides information about a sentiment detection job.</p>
 */
@interface AWSComprehendSentimentDetectionJobProperties : AWSModel


/**
 <p>The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to your input data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>The time that the sentiment detection job ended.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The input data configuration that you supplied when you created the sentiment detection job.</p>
 */
@property (nonatomic, strong) AWSComprehendInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The Amazon Resource Name (ARN) of the sentiment detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p><p><code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:sentiment-detection-job/&lt;job-id&gt;</code></p><p>The following is an example job ARN:</p><p><code>arn:aws:comprehend:us-west-2:111122223333:sentiment-detection-job/1234abcd12ab34cd56ef1234567890ab</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The identifier assigned to the sentiment detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The name that you assigned to the sentiment detection job</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The current status of the sentiment detection job. If the status is <code>FAILED</code>, the <code>Messages</code> field shows the reason for the failure.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

/**
 <p>The language code of the input documents.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>A description of the status of a job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The output data configuration that you supplied when you created the sentiment detection job.</p>
 */
@property (nonatomic, strong) AWSComprehendOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>The time that the sentiment detection job was submitted for processing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submitTime;

/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

/**
 <p> Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your sentiment detection job. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon VPC</a>. </p>
 */
@property (nonatomic, strong) AWSComprehendVpcConfig * _Nullable vpcConfig;

@end

/**
 <p>Describes the level of confidence that Amazon Comprehend has in the accuracy of its detection of sentiments.</p>
 */
@interface AWSComprehendSentimentScore : AWSModel


/**
 <p>The level of confidence that Amazon Comprehend has in the accuracy of its detection of the <code>MIXED</code> sentiment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mixed;

/**
 <p>The level of confidence that Amazon Comprehend has in the accuracy of its detection of the <code>NEGATIVE</code> sentiment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable negative;

/**
 <p>The level of confidence that Amazon Comprehend has in the accuracy of its detection of the <code>NEUTRAL</code> sentiment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable neutral;

/**
 <p>The level of confidence that Amazon Comprehend has in the accuracy of its detection of the <code>POSITIVE</code> sentiment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable positive;

@end

/**
 
 */
@interface AWSComprehendStartDocumentClassificationJobRequest : AWSRequest


/**
 <p>A unique identifier for the request. If you do not set the client request token, Amazon Comprehend generates one.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>The Amazon Resource Name (ARN) of the document classifier to use to process the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentClassifierArn;

/**
 <p>Specifies the format and location of the input data for the job.</p>
 */
@property (nonatomic, strong) AWSComprehendInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The identifier of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>Specifies where to send the output files.</p>
 */
@property (nonatomic, strong) AWSComprehendOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>Tags to be associated with the document classification job. A tag is a key-value pair that adds metadata to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a resource to indicate its use by the sales department.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendTag *> * _Nullable tags;

/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

/**
 <p>Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your document classification job. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon VPC</a>. </p>
 */
@property (nonatomic, strong) AWSComprehendVpcConfig * _Nullable vpcConfig;

@end

/**
 
 */
@interface AWSComprehendStartDocumentClassificationJobResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the document classification job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p><p><code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:document-classification-job/&lt;job-id&gt;</code></p><p>The following is an example job ARN:</p><p><code>arn:aws:comprehend:us-west-2:111122223333:document-classification-job/1234abcd12ab34cd56ef1234567890ab</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The identifier generated for the job. To get the status of the job, use this identifier with the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The status of the job:</p><ul><li><p>SUBMITTED - The job has been received and queued for processing.</p></li><li><p>IN_PROGRESS - Amazon Comprehend is processing the job.</p></li><li><p>COMPLETED - The job was successfully completed and the output is available.</p></li><li><p>FAILED - The job did not complete. For details, use the operation.</p></li><li><p>STOP_REQUESTED - Amazon Comprehend has received a stop request for the job and is processing the request.</p></li><li><p>STOPPED - The job was successfully stopped without completing.</p></li></ul>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

@end

/**
 
 */
@interface AWSComprehendStartDominantLanguageDetectionJobRequest : AWSRequest


/**
 <p>A unique identifier for the request. If you do not set the client request token, Amazon Comprehend generates one.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data. For more information, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions">https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>Specifies the format and location of the input data for the job.</p>
 */
@property (nonatomic, strong) AWSComprehendInputDataConfig * _Nullable inputDataConfig;

/**
 <p>An identifier for the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>Specifies where to send the output files.</p>
 */
@property (nonatomic, strong) AWSComprehendOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>Tags to be associated with the dominant language detection job. A tag is a key-value pair that adds metadata to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a resource to indicate its use by the sales department.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendTag *> * _Nullable tags;

/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

/**
 <p>Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your dominant language detection job. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon VPC</a>. </p>
 */
@property (nonatomic, strong) AWSComprehendVpcConfig * _Nullable vpcConfig;

@end

/**
 
 */
@interface AWSComprehendStartDominantLanguageDetectionJobResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the dominant language detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p><p><code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:dominant-language-detection-job/&lt;job-id&gt;</code></p><p>The following is an example job ARN:</p><p><code>arn:aws:comprehend:us-west-2:111122223333:dominant-language-detection-job/1234abcd12ab34cd56ef1234567890ab</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The identifier generated for the job. To get the status of a job, use this identifier with the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The status of the job. </p><ul><li><p>SUBMITTED - The job has been received and is queued for processing.</p></li><li><p>IN_PROGRESS - Amazon Comprehend is processing the job.</p></li><li><p>COMPLETED - The job was successfully completed and the output is available.</p></li><li><p>FAILED - The job did not complete. To get details, use the operation.</p></li></ul>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

@end

/**
 
 */
@interface AWSComprehendStartEntitiesDetectionJobRequest : AWSRequest


/**
 <p>A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data. For more information, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions">https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>The Amazon Resource Name (ARN) that identifies the specific entity recognizer to be used by the <code>StartEntitiesDetectionJob</code>. This ARN is optional and is only used for a custom entity recognition job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityRecognizerArn;

/**
 <p>Specifies the format and location of the input data for the job.</p>
 */
@property (nonatomic, strong) AWSComprehendInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The identifier of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The language of the input documents. All documents must be in the same language. You can specify any of the languages supported by Amazon Comprehend. If custom entities recognition is used, this parameter is ignored and the language used for training the model is used instead.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>Specifies where to send the output files.</p>
 */
@property (nonatomic, strong) AWSComprehendOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>Tags to be associated with the entities detection job. A tag is a key-value pair that adds metadata to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a resource to indicate its use by the sales department.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendTag *> * _Nullable tags;

/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

/**
 <p>Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your entity detection job. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon VPC</a>. </p>
 */
@property (nonatomic, strong) AWSComprehendVpcConfig * _Nullable vpcConfig;

@end

/**
 
 */
@interface AWSComprehendStartEntitiesDetectionJobResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the entities detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p><p><code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:entities-detection-job/&lt;job-id&gt;</code></p><p>The following is an example job ARN:</p><p><code>arn:aws:comprehend:us-west-2:111122223333:entities-detection-job/1234abcd12ab34cd56ef1234567890ab</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The identifier generated for the job. To get the status of job, use this identifier with the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The status of the job. </p><ul><li><p>SUBMITTED - The job has been received and is queued for processing.</p></li><li><p>IN_PROGRESS - Amazon Comprehend is processing the job.</p></li><li><p>COMPLETED - The job was successfully completed and the output is available.</p></li><li><p>FAILED - The job did not complete. To get details, use the operation.</p></li><li><p>STOP_REQUESTED - Amazon Comprehend has received a stop request for the job and is processing the request.</p></li><li><p>STOPPED - The job was successfully stopped without completing.</p></li></ul>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

@end

/**
 
 */
@interface AWSComprehendStartEventsDetectionJobRequest : AWSRequest


/**
 <p>An unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>Specifies the format and location of the input data for the job.</p>
 */
@property (nonatomic, strong) AWSComprehendInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The identifier of the events detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The language code of the input documents.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>Specifies where to send the output files.</p>
 */
@property (nonatomic, strong) AWSComprehendOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>Tags to be associated with the events detection job. A tag is a key-value pair that adds metadata to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a resource to indicate its use by the sales department.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendTag *> * _Nullable tags;

/**
 <p>The types of events to detect in the input documents.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetEventTypes;

@end

/**
 
 */
@interface AWSComprehendStartEventsDetectionJobResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the events detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p><p><code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:events-detection-job/&lt;job-id&gt;</code></p><p>The following is an example job ARN:</p><p><code>arn:aws:comprehend:us-west-2:111122223333:events-detection-job/1234abcd12ab34cd56ef1234567890ab</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>An unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The status of the events detection job.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

@end

/**
 
 */
@interface AWSComprehendStartKeyPhrasesDetectionJobRequest : AWSRequest


/**
 <p>A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data. For more information, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions">https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>Specifies the format and location of the input data for the job.</p>
 */
@property (nonatomic, strong) AWSComprehendInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The identifier of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>Specifies where to send the output files.</p>
 */
@property (nonatomic, strong) AWSComprehendOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>Tags to be associated with the key phrases detection job. A tag is a key-value pair that adds metadata to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a resource to indicate its use by the sales department.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendTag *> * _Nullable tags;

/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

/**
 <p> Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your key phrases detection job. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon VPC</a>. </p>
 */
@property (nonatomic, strong) AWSComprehendVpcConfig * _Nullable vpcConfig;

@end

/**
 
 */
@interface AWSComprehendStartKeyPhrasesDetectionJobResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the key phrase detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p><p><code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:key-phrases-detection-job/&lt;job-id&gt;</code></p><p>The following is an example job ARN:</p><p><code>arn:aws:comprehend:us-west-2:111122223333:key-phrases-detection-job/1234abcd12ab34cd56ef1234567890ab</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The identifier generated for the job. To get the status of a job, use this identifier with the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The status of the job. </p><ul><li><p>SUBMITTED - The job has been received and is queued for processing.</p></li><li><p>IN_PROGRESS - Amazon Comprehend is processing the job.</p></li><li><p>COMPLETED - The job was successfully completed and the output is available.</p></li><li><p>FAILED - The job did not complete. To get details, use the operation.</p></li></ul>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

@end

/**
 
 */
@interface AWSComprehendStartPiiEntitiesDetectionJobRequest : AWSRequest


/**
 <p>A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>The input properties for a PII entities detection job.</p>
 */
@property (nonatomic, strong) AWSComprehendInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The identifier of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The language of the input documents. Currently, English is the only valid language.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>Specifies whether the output provides the locations (offsets) of PII entities or a file in which PII entities are redacted.</p>
 */
@property (nonatomic, assign) AWSComprehendPiiEntitiesDetectionMode mode;

/**
 <p>Provides conﬁguration parameters for the output of PII entity detection jobs.</p>
 */
@property (nonatomic, strong) AWSComprehendOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>Provides configuration parameters for PII entity redaction.</p><p>This parameter is required if you set the <code>Mode</code> parameter to <code>ONLY_REDACTION</code>. In that case, you must provide a <code>RedactionConfig</code> definition that includes the <code>PiiEntityTypes</code> parameter.</p>
 */
@property (nonatomic, strong) AWSComprehendRedactionConfig * _Nullable redactionConfig;

/**
 <p>Tags to be associated with the PII entities detection job. A tag is a key-value pair that adds metadata to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a resource to indicate its use by the sales department.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSComprehendStartPiiEntitiesDetectionJobResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the PII entity detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p><p><code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:pii-entities-detection-job/&lt;job-id&gt;</code></p><p>The following is an example job ARN:</p><p><code>arn:aws:comprehend:us-west-2:111122223333:pii-entities-detection-job/1234abcd12ab34cd56ef1234567890ab</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The identifier generated for the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The status of the job.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

@end

/**
 
 */
@interface AWSComprehendStartSentimentDetectionJobRequest : AWSRequest


/**
 <p>A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data. For more information, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions">https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>Specifies the format and location of the input data for the job.</p>
 */
@property (nonatomic, strong) AWSComprehendInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The identifier of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>Specifies where to send the output files. </p>
 */
@property (nonatomic, strong) AWSComprehendOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>Tags to be associated with the sentiment detection job. A tag is a key-value pair that adds metadata to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a resource to indicate its use by the sales department.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendTag *> * _Nullable tags;

/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

/**
 <p>Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your sentiment detection job. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon VPC</a>. </p>
 */
@property (nonatomic, strong) AWSComprehendVpcConfig * _Nullable vpcConfig;

@end

/**
 
 */
@interface AWSComprehendStartSentimentDetectionJobResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the sentiment detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p><p><code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:sentiment-detection-job/&lt;job-id&gt;</code></p><p>The following is an example job ARN:</p><p><code>arn:aws:comprehend:us-west-2:111122223333:sentiment-detection-job/1234abcd12ab34cd56ef1234567890ab</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The identifier generated for the job. To get the status of a job, use this identifier with the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The status of the job. </p><ul><li><p>SUBMITTED - The job has been received and is queued for processing.</p></li><li><p>IN_PROGRESS - Amazon Comprehend is processing the job.</p></li><li><p>COMPLETED - The job was successfully completed and the output is available.</p></li><li><p>FAILED - The job did not complete. To get details, use the operation.</p></li></ul>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

@end

/**
 
 */
@interface AWSComprehendStartTargetedSentimentDetectionJobRequest : AWSRequest


/**
 <p>A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data. For more information, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions">Role-based permissions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>The input properties for an inference job. The document reader config field applies only to non-text inputs for custom analysis.</p>
 */
@property (nonatomic, strong) AWSComprehendInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The identifier of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The language of the input documents. Currently, English is the only supported language.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>Specifies where to send the output files. </p>
 */
@property (nonatomic, strong) AWSComprehendOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>Tags to be associated with the targeted sentiment detection job. A tag is a key-value pair that adds metadata to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a resource to indicate its use by the sales department.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendTag *> * _Nullable tags;

/**
 <p>ID for the KMS key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

/**
 <p> Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for the job. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon VPC</a>. </p>
 */
@property (nonatomic, strong) AWSComprehendVpcConfig * _Nullable vpcConfig;

@end

/**
 
 */
@interface AWSComprehendStartTargetedSentimentDetectionJobResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the targeted sentiment detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p><p><code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:targeted-sentiment-detection-job/&lt;job-id&gt;</code></p><p>The following is an example job ARN:</p><p><code>arn:aws:comprehend:us-west-2:111122223333:targeted-sentiment-detection-job/1234abcd12ab34cd56ef1234567890ab</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The identifier generated for the job. To get the status of a job, use this identifier with the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The status of the job. </p><ul><li><p>SUBMITTED - The job has been received and is queued for processing.</p></li><li><p>IN_PROGRESS - Amazon Comprehend is processing the job.</p></li><li><p>COMPLETED - The job was successfully completed and the output is available.</p></li><li><p>FAILED - The job did not complete. To get details, use the operation.</p></li></ul>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

@end

/**
 
 */
@interface AWSComprehendStartTopicsDetectionJobRequest : AWSRequest


/**
 <p>A unique identifier for the request. If you do not set the client request token, Amazon Comprehend generates one.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data. For more information, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions">https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>Specifies the format and location of the input data for the job.</p>
 */
@property (nonatomic, strong) AWSComprehendInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The identifier of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The number of topics to detect.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfTopics;

/**
 <p>Specifies where to send the output files. The output is a compressed archive with two files, <code>topic-terms.csv</code> that lists the terms associated with each topic, and <code>doc-topics.csv</code> that lists the documents associated with each topic</p>
 */
@property (nonatomic, strong) AWSComprehendOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>Tags to be associated with the topics detection job. A tag is a key-value pair that adds metadata to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a resource to indicate its use by the sales department.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendTag *> * _Nullable tags;

/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

/**
 <p>Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your topic detection job. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon VPC</a>. </p>
 */
@property (nonatomic, strong) AWSComprehendVpcConfig * _Nullable vpcConfig;

@end

/**
 
 */
@interface AWSComprehendStartTopicsDetectionJobResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the topics detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p><p><code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:topics-detection-job/&lt;job-id&gt;</code></p><p>The following is an example job ARN:</p><p><code>arn:aws:comprehend:us-west-2:111122223333:document-classification-job/1234abcd12ab34cd56ef1234567890ab</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The identifier generated for the job. To get the status of the job, use this identifier with the <code>DescribeTopicDetectionJob</code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The status of the job: </p><ul><li><p>SUBMITTED - The job has been received and is queued for processing.</p></li><li><p>IN_PROGRESS - Amazon Comprehend is processing the job.</p></li><li><p>COMPLETED - The job was successfully completed and the output is available.</p></li><li><p>FAILED - The job did not complete. To get details, use the <code>DescribeTopicDetectionJob</code> operation.</p></li></ul>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

@end

/**
 
 */
@interface AWSComprehendStopDominantLanguageDetectionJobRequest : AWSRequest


/**
 <p>The identifier of the dominant language detection job to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSComprehendStopDominantLanguageDetectionJobResponse : AWSModel


/**
 <p>The identifier of the dominant language detection job to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>Either <code>STOP_REQUESTED</code> if the job is currently running, or <code>STOPPED</code> if the job was previously stopped with the <code>StopDominantLanguageDetectionJob</code> operation.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

@end

/**
 
 */
@interface AWSComprehendStopEntitiesDetectionJobRequest : AWSRequest


/**
 <p>The identifier of the entities detection job to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSComprehendStopEntitiesDetectionJobResponse : AWSModel


/**
 <p>The identifier of the entities detection job to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>Either <code>STOP_REQUESTED</code> if the job is currently running, or <code>STOPPED</code> if the job was previously stopped with the <code>StopEntitiesDetectionJob</code> operation.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

@end

/**
 
 */
@interface AWSComprehendStopEventsDetectionJobRequest : AWSRequest


/**
 <p>The identifier of the events detection job to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSComprehendStopEventsDetectionJobResponse : AWSModel


/**
 <p>The identifier of the events detection job to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The status of the events detection job.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

@end

/**
 
 */
@interface AWSComprehendStopKeyPhrasesDetectionJobRequest : AWSRequest


/**
 <p>The identifier of the key phrases detection job to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSComprehendStopKeyPhrasesDetectionJobResponse : AWSModel


/**
 <p>The identifier of the key phrases detection job to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>Either <code>STOP_REQUESTED</code> if the job is currently running, or <code>STOPPED</code> if the job was previously stopped with the <code>StopKeyPhrasesDetectionJob</code> operation.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

@end

/**
 
 */
@interface AWSComprehendStopPiiEntitiesDetectionJobRequest : AWSRequest


/**
 <p>The identifier of the PII entities detection job to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSComprehendStopPiiEntitiesDetectionJobResponse : AWSModel


/**
 <p>The identifier of the PII entities detection job to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The status of the PII entities detection job.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

@end

/**
 
 */
@interface AWSComprehendStopSentimentDetectionJobRequest : AWSRequest


/**
 <p>The identifier of the sentiment detection job to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSComprehendStopSentimentDetectionJobResponse : AWSModel


/**
 <p>The identifier of the sentiment detection job to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>Either <code>STOP_REQUESTED</code> if the job is currently running, or <code>STOPPED</code> if the job was previously stopped with the <code>StopSentimentDetectionJob</code> operation.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

@end

/**
 
 */
@interface AWSComprehendStopTargetedSentimentDetectionJobRequest : AWSRequest


/**
 <p>The identifier of the targeted sentiment detection job to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSComprehendStopTargetedSentimentDetectionJobResponse : AWSModel


/**
 <p>The identifier of the targeted sentiment detection job to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>Either <code>STOP_REQUESTED</code> if the job is currently running, or <code>STOPPED</code> if the job was previously stopped with the <code>StopSentimentDetectionJob</code> operation.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

@end

/**
 
 */
@interface AWSComprehendStopTrainingDocumentClassifierRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) that identifies the document classifier currently being trained.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentClassifierArn;

@end

/**
 
 */
@interface AWSComprehendStopTrainingDocumentClassifierResponse : AWSModel


@end

/**
 
 */
@interface AWSComprehendStopTrainingEntityRecognizerRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) that identifies the entity recognizer currently being trained.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityRecognizerArn;

@end

/**
 
 */
@interface AWSComprehendStopTrainingEntityRecognizerResponse : AWSModel


@end

/**
 <p>Represents a work in the input text that was recognized and assigned a part of speech. There is one syntax token record for each word in the source text.</p>
 */
@interface AWSComprehendSyntaxToken : AWSModel


/**
 <p>The zero-based offset from the beginning of the source text to the first character in the word.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable beginOffset;

/**
 <p>The zero-based offset from the beginning of the source text to the last character in the word.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endOffset;

/**
 <p>Provides the part of speech label and the confidence level that Amazon Comprehend has that the part of speech was correctly identified. For more information, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/how-syntax.html">Syntax</a> in the Comprehend Developer Guide. </p>
 */
@property (nonatomic, strong) AWSComprehendPartOfSpeechTag * _Nullable partOfSpeech;

/**
 <p>The word that was recognized in the source text.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

/**
 <p>A unique identifier for a token.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tokenId;

@end

/**
 <p>A key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with the key-value pair ‘Department’:’Sales’ might be added to a resource to indicate its use by a particular department. </p>
 Required parameters: [Key]
 */
@interface AWSComprehendTag : AWSModel


/**
 <p>The initial part of a key-value pair that forms a tag associated with a given resource. For instance, if you want to show which resources are used by which departments, you might use “Department” as the key portion of the pair, with multiple possible values such as “sales,” “legal,” and “administration.” </p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p> The second part of a key-value pair that forms a tag associated with a given resource. For instance, if you want to show which resources are used by which departments, you might use “Department” as the initial (key) portion of the pair, with a value of “sales” to indicate the sales department. </p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSComprehendTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the given Amazon Comprehend resource to which you want to associate the tags. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>Tags being associated with a specific Amazon Comprehend resource. There can be a maximum of 50 tags (both existing and pending) associated with a specific resource. </p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSComprehendTagResourceResponse : AWSModel


@end

/**
 <p>Provides information for filtering a list of dominant language detection jobs. For more information, see the operation.</p>
 */
@interface AWSComprehendTargetedSentimentDetectionJobFilter : AWSModel


/**
 <p>Filters on the name of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>Filters the list of jobs based on job status. Returns only jobs with the specified status.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

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
 <p>Provides information about a targeted sentiment detection job.</p>
 */
@interface AWSComprehendTargetedSentimentDetectionJobProperties : AWSModel


/**
 <p>The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to your input data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>The time that the targeted sentiment detection job ended.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The input properties for an inference job. The document reader config field applies only to non-text inputs for custom analysis.</p>
 */
@property (nonatomic, strong) AWSComprehendInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The Amazon Resource Name (ARN) of the targeted sentiment detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p><p><code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:targeted-sentiment-detection-job/&lt;job-id&gt;</code></p><p>The following is an example job ARN:</p><p><code>arn:aws:comprehend:us-west-2:111122223333:targeted-sentiment-detection-job/1234abcd12ab34cd56ef1234567890ab</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The identifier assigned to the targeted sentiment detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The name that you assigned to the targeted sentiment detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The current status of the targeted sentiment detection job. If the status is <code>FAILED</code>, the <code>Messages</code> field shows the reason for the failure.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

/**
 <p>The language code of the input documents.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>A description of the status of a job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>Provides configuration parameters for the output of inference jobs.</p><p/>
 */
@property (nonatomic, strong) AWSComprehendOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>The time that the targeted sentiment detection job was submitted for processing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submitTime;

/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the targeted sentiment detection job. The VolumeKmsKeyId can be either of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

/**
 <p> Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for the job. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon VPC</a>. </p>
 */
@property (nonatomic, strong) AWSComprehendVpcConfig * _Nullable vpcConfig;

@end

/**
 <p>Information about one of the entities found by targeted sentiment analysis.</p><p>For more information about targeted sentiment, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html">Targeted sentiment</a>.</p>
 */
@interface AWSComprehendTargetedSentimentEntity : AWSModel


/**
 <p>One or more index into the Mentions array that provides the best name for the entity group.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable descriptiveMentionIndex;

/**
 <p>An array of mentions of the entity in the document. The array represents a co-reference group. See <a href="https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html#how-targeted-sentiment-values"> Co-reference group</a> for an example. </p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendTargetedSentimentMention *> * _Nullable mentions;

@end

/**
 <p>Information about one mention of an entity. The mention information includes the location of the mention in the text and the sentiment of the mention.</p><p>For more information about targeted sentiment, see <a href="https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html">Targeted sentiment</a>.</p>
 */
@interface AWSComprehendTargetedSentimentMention : AWSModel


/**
 <p>The offset into the document text where the mention begins.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable beginOffset;

/**
 <p>The offset into the document text where the mention ends.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endOffset;

/**
 <p>The confidence that all the entities mentioned in the group relate to the same entity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable groupScore;

/**
 <p>Contains the sentiment and sentiment score for the mention.</p>
 */
@property (nonatomic, strong) AWSComprehendMentionSentiment * _Nullable mentionSentiment;

/**
 <p>Model confidence that the entity is relevant. Value range is zero to one, where one is highest confidence.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

/**
 <p>The text in the document that identifies the entity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

/**
 <p>The type of the entity. Amazon Comprehend supports a variety of <a href="https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html#how-targeted-sentiment-entities">entity types</a>.</p>
 */
@property (nonatomic, assign) AWSComprehendTargetedSentimentEntityType types;

@end

/**
 <p>Provides information for filtering topic detection jobs. For more information, see .</p>
 */
@interface AWSComprehendTopicsDetectionJobFilter : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>Filters the list of topic detection jobs based on job status. Returns only jobs with the specified status.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

/**
 <p>Filters the list of jobs based on the time that the job was submitted for processing. Only returns jobs submitted after the specified time. Jobs are returned in ascending order, oldest to newest.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submitTimeAfter;

/**
 <p>Filters the list of jobs based on the time that the job was submitted for processing. Only returns jobs submitted before the specified time. Jobs are returned in descending order, newest to oldest.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submitTimeBefore;

@end

/**
 <p>Provides information about a topic detection job.</p>
 */
@interface AWSComprehendTopicsDetectionJobProperties : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM) role that grants Amazon Comprehend read access to your job data. </p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>The time that the topic detection job was completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The input data configuration supplied when you created the topic detection job.</p>
 */
@property (nonatomic, strong) AWSComprehendInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The Amazon Resource Name (ARN) of the topics detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p><p><code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:topics-detection-job/&lt;job-id&gt;</code></p><p>The following is an example job ARN:</p><p><code>arn:aws:comprehend:us-west-2:111122223333:topics-detection-job/1234abcd12ab34cd56ef1234567890ab</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The identifier assigned to the topic detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The name of the topic detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The current status of the topic detection job. If the status is <code>Failed</code>, the reason for the failure is shown in the <code>Message</code> field.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

/**
 <p>A description for the status of a job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The number of topics to detect supplied when you created the topic detection job. The default is 10. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfTopics;

/**
 <p>The output data configuration supplied when you created the topic detection job.</p>
 */
@property (nonatomic, strong) AWSComprehendOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>The time that the topic detection job was submitted for processing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submitTime;

/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

/**
 <p>Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your topic detection job. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon VPC</a>. </p>
 */
@property (nonatomic, strong) AWSComprehendVpcConfig * _Nullable vpcConfig;

@end

/**
 
 */
@interface AWSComprehendUntagResourceRequest : AWSRequest


/**
 <p> The Amazon Resource Name (ARN) of the given Amazon Comprehend resource from which you want to remove the tags. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The initial part of a key-value pair that forms a tag being removed from a given resource. For example, a tag with "Sales" as the key might be added to a resource to indicate its use by the sales department. Keys must be unique and cannot be duplicated for a particular resource. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSComprehendUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSComprehendUpdateEndpointRequest : AWSRequest


/**
 <p>Data access role ARN to use in case the new model is encrypted with a customer CMK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable desiredDataAccessRoleArn;

/**
 <p> The desired number of inference units to be used by the model using this endpoint. Each inference unit represents of a throughput of 100 characters per second.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable desiredInferenceUnits;

/**
 <p>The ARN of the new model to use when updating an existing endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable desiredModelArn;

/**
 <p>The Amazon Resource Number (ARN) of the endpoint being updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

@end

/**
 
 */
@interface AWSComprehendUpdateEndpointResponse : AWSModel


@end

/**
 <p> Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for the job. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon VPC</a>. </p>
 Required parameters: [SecurityGroupIds, Subnets]
 */
@interface AWSComprehendVpcConfig : AWSModel


/**
 <p>The ID number for a security group on an instance of your private VPC. Security groups on your VPC function serve as a virtual firewall to control inbound and outbound traffic and provides security for the resources that you’ll be accessing on the VPC. This ID number is preceded by "sg-", for instance: "sg-03b388029b0a285ea". For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html">Security Groups for your VPC</a>. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>The ID for each subnet being used in your private VPC. This subnet is a subset of the a range of IPv4 addresses used by the VPC and is specific to a given availability zone in the VPC’s region. This ID number is preceded by "subnet-", for instance: "subnet-04ccf456919e69055". For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">VPCs and Subnets</a>. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnets;

@end

NS_ASSUME_NONNULL_END
