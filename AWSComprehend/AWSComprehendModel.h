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

typedef NS_ENUM(NSInteger, AWSComprehendDocumentClassifierMode) {
    AWSComprehendDocumentClassifierModeUnknown,
    AWSComprehendDocumentClassifierModeMultiClass,
    AWSComprehendDocumentClassifierModeMultiLabel,
};

typedef NS_ENUM(NSInteger, AWSComprehendEndpointStatus) {
    AWSComprehendEndpointStatusUnknown,
    AWSComprehendEndpointStatusCreating,
    AWSComprehendEndpointStatusDeleting,
    AWSComprehendEndpointStatusFailed,
    AWSComprehendEndpointStatusInService,
    AWSComprehendEndpointStatusUpdating,
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

typedef NS_ENUM(NSInteger, AWSComprehendSentimentType) {
    AWSComprehendSentimentTypeUnknown,
    AWSComprehendSentimentTypePositive,
    AWSComprehendSentimentTypeNegative,
    AWSComprehendSentimentTypeNeutral,
    AWSComprehendSentimentTypeMixed,
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
@class AWSComprehendBatchItemError;
@class AWSComprehendClassifierEvaluationMetrics;
@class AWSComprehendClassifierMetadata;
@class AWSComprehendClassifyDocumentRequest;
@class AWSComprehendClassifyDocumentResponse;
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
@class AWSComprehendDescribeKeyPhrasesDetectionJobRequest;
@class AWSComprehendDescribeKeyPhrasesDetectionJobResponse;
@class AWSComprehendDescribeSentimentDetectionJobRequest;
@class AWSComprehendDescribeSentimentDetectionJobResponse;
@class AWSComprehendDescribeTopicsDetectionJobRequest;
@class AWSComprehendDescribeTopicsDetectionJobResponse;
@class AWSComprehendDetectDominantLanguageRequest;
@class AWSComprehendDetectDominantLanguageResponse;
@class AWSComprehendDetectEntitiesRequest;
@class AWSComprehendDetectEntitiesResponse;
@class AWSComprehendDetectKeyPhrasesRequest;
@class AWSComprehendDetectKeyPhrasesResponse;
@class AWSComprehendDetectSentimentRequest;
@class AWSComprehendDetectSentimentResponse;
@class AWSComprehendDetectSyntaxRequest;
@class AWSComprehendDetectSyntaxResponse;
@class AWSComprehendDocumentClass;
@class AWSComprehendDocumentClassificationJobFilter;
@class AWSComprehendDocumentClassificationJobProperties;
@class AWSComprehendDocumentClassifierFilter;
@class AWSComprehendDocumentClassifierInputDataConfig;
@class AWSComprehendDocumentClassifierOutputDataConfig;
@class AWSComprehendDocumentClassifierProperties;
@class AWSComprehendDocumentLabel;
@class AWSComprehendDominantLanguage;
@class AWSComprehendDominantLanguageDetectionJobFilter;
@class AWSComprehendDominantLanguageDetectionJobProperties;
@class AWSComprehendEndpointFilter;
@class AWSComprehendEndpointProperties;
@class AWSComprehendEntitiesDetectionJobFilter;
@class AWSComprehendEntitiesDetectionJobProperties;
@class AWSComprehendEntity;
@class AWSComprehendEntityRecognizerAnnotations;
@class AWSComprehendEntityRecognizerDocuments;
@class AWSComprehendEntityRecognizerEntityList;
@class AWSComprehendEntityRecognizerEvaluationMetrics;
@class AWSComprehendEntityRecognizerFilter;
@class AWSComprehendEntityRecognizerInputDataConfig;
@class AWSComprehendEntityRecognizerMetadata;
@class AWSComprehendEntityRecognizerMetadataEntityTypesListItem;
@class AWSComprehendEntityRecognizerProperties;
@class AWSComprehendEntityTypesEvaluationMetrics;
@class AWSComprehendEntityTypesListItem;
@class AWSComprehendInputDataConfig;
@class AWSComprehendKeyPhrase;
@class AWSComprehendKeyPhrasesDetectionJobFilter;
@class AWSComprehendKeyPhrasesDetectionJobProperties;
@class AWSComprehendListDocumentClassificationJobsRequest;
@class AWSComprehendListDocumentClassificationJobsResponse;
@class AWSComprehendListDocumentClassifiersRequest;
@class AWSComprehendListDocumentClassifiersResponse;
@class AWSComprehendListDominantLanguageDetectionJobsRequest;
@class AWSComprehendListDominantLanguageDetectionJobsResponse;
@class AWSComprehendListEndpointsRequest;
@class AWSComprehendListEndpointsResponse;
@class AWSComprehendListEntitiesDetectionJobsRequest;
@class AWSComprehendListEntitiesDetectionJobsResponse;
@class AWSComprehendListEntityRecognizersRequest;
@class AWSComprehendListEntityRecognizersResponse;
@class AWSComprehendListKeyPhrasesDetectionJobsRequest;
@class AWSComprehendListKeyPhrasesDetectionJobsResponse;
@class AWSComprehendListSentimentDetectionJobsRequest;
@class AWSComprehendListSentimentDetectionJobsResponse;
@class AWSComprehendListTagsForResourceRequest;
@class AWSComprehendListTagsForResourceResponse;
@class AWSComprehendListTopicsDetectionJobsRequest;
@class AWSComprehendListTopicsDetectionJobsResponse;
@class AWSComprehendOutputDataConfig;
@class AWSComprehendPartOfSpeechTag;
@class AWSComprehendSentimentDetectionJobFilter;
@class AWSComprehendSentimentDetectionJobProperties;
@class AWSComprehendSentimentScore;
@class AWSComprehendStartDocumentClassificationJobRequest;
@class AWSComprehendStartDocumentClassificationJobResponse;
@class AWSComprehendStartDominantLanguageDetectionJobRequest;
@class AWSComprehendStartDominantLanguageDetectionJobResponse;
@class AWSComprehendStartEntitiesDetectionJobRequest;
@class AWSComprehendStartEntitiesDetectionJobResponse;
@class AWSComprehendStartKeyPhrasesDetectionJobRequest;
@class AWSComprehendStartKeyPhrasesDetectionJobResponse;
@class AWSComprehendStartSentimentDetectionJobRequest;
@class AWSComprehendStartSentimentDetectionJobResponse;
@class AWSComprehendStartTopicsDetectionJobRequest;
@class AWSComprehendStartTopicsDetectionJobResponse;
@class AWSComprehendStopDominantLanguageDetectionJobRequest;
@class AWSComprehendStopDominantLanguageDetectionJobResponse;
@class AWSComprehendStopEntitiesDetectionJobRequest;
@class AWSComprehendStopEntitiesDetectionJobResponse;
@class AWSComprehendStopKeyPhrasesDetectionJobRequest;
@class AWSComprehendStopKeyPhrasesDetectionJobResponse;
@class AWSComprehendStopSentimentDetectionJobRequest;
@class AWSComprehendStopSentimentDetectionJobResponse;
@class AWSComprehendStopTrainingDocumentClassifierRequest;
@class AWSComprehendStopTrainingDocumentClassifierResponse;
@class AWSComprehendStopTrainingEntityRecognizerRequest;
@class AWSComprehendStopTrainingEntityRecognizerResponse;
@class AWSComprehendSyntaxToken;
@class AWSComprehendTag;
@class AWSComprehendTagResourceRequest;
@class AWSComprehendTagResourceResponse;
@class AWSComprehendTopicsDetectionJobFilter;
@class AWSComprehendTopicsDetectionJobProperties;
@class AWSComprehendUntagResourceRequest;
@class AWSComprehendUntagResourceResponse;
@class AWSComprehendUpdateEndpointRequest;
@class AWSComprehendUpdateEndpointResponse;
@class AWSComprehendVpcConfig;

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
 <p>A list containing the text of the input documents. The list can contain a maximum of 25 documents. Each document should contain at least 20 characters and must contain fewer than 5,000 bytes of UTF-8 encoded characters.</p>
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
 <p>A list containing the text of the input documents. The list can contain a maximum of 25 documents. Each document must contain fewer than 5,000 bytes of UTF-8 encoded characters.</p>
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
 <p>A list containing the text of the input documents. The list can contain a maximum of 25 documents. Each document must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>
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
 <p>A list containing the text of the input documents. The list can contain a maximum of 25 documents. Each document must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>
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
 <p>A list containing the text of the input documents. The list can contain a maximum of 25 documents. Each document must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>
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
 <p>The number of documents in the input data that were used to test the classifier. Typically this is 10 to 20 percent of the input documents.</p>
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
 <p>The Amazon Resource Number (ARN) of the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

/**
 <p>The document text to be analyzed.</p>
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
 <p>The labels used the document being analyzed. These are used for multi-label trained models. Individual labels represent different categories that are related in some manner and are not multually exclusive. For example, a movie can be just an action movie, or it can be an action movie, a science fiction movie, and a comedy, all at the same time. </p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendDocumentLabel *> * _Nullable labels;

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
 <p>Enables the addition of output results configuration parameters for custom classifier jobs.</p>
 */
@property (nonatomic, strong) AWSComprehendDocumentClassifierOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>Tags to be associated with the document classifier being created. A tag is a key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a resource to indicate its use by the sales department. </p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendTag *> * _Nullable tags;

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
 <p> The language of the input documents. All documents must be in the same language. Only English ("en") is currently supported. </p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>The name given to the newly created recognizer. Recognizer names can be a maximum of 256 characters. Alphanumeric characters, hyphens (-) and underscores (_) are allowed. The name must be unique in the account/region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recognizerName;

/**
 <p>Tags to be associated with the entity recognizer being created. A tag is a key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a resource to indicate its use by the sales department. </p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendTag *> * _Nullable tags;

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
 <p>A UTF-8 text string. Each string should contain at least 20 characters and must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>
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
 <p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>A UTF-8 text string. Each string must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSComprehendDetectEntitiesResponse : AWSModel


/**
 <p>A collection of entities identified in the input text. For each entity, the response provides the entity text, entity type, where the entity text begins and ends, and the level of confidence that Amazon Comprehend has in the detection. For a list of entity types, see <a>how-entities</a>. </p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendEntity *> * _Nullable entities;

@end

/**
 
 */
@interface AWSComprehendDetectKeyPhrasesRequest : AWSRequest


/**
 <p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>A UTF-8 text string. Each string must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>
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
@interface AWSComprehendDetectSentimentRequest : AWSRequest


/**
 <p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>A UTF-8 text string. Each string must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>
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
 <p>A UTF-8 string. Each string must contain fewer that 5,000 bytes of UTF encoded characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSComprehendDetectSyntaxResponse : AWSModel


/**
 <p>A collection of syntax tokens describing the text. For each token, the response provides the text, the token type, where the text begins and ends, and the level of confidence that Amazon Comprehend has that the token is correct. For a list of token types, see <a>how-syntax</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendSyntaxToken *> * _Nullable syntaxTokens;

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
 <p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted before the specified time. Jobs are returned in descending order, newest to oldest.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submitTimeAfter;

/**
 <p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted after the specified time. Jobs are returned in ascending order, oldest to newest.</p>
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
 <p> Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your document classification job. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon VPC</a>. </p>
 */
@property (nonatomic, strong) AWSComprehendVpcConfig * _Nullable vpcConfig;

@end

/**
 <p>Provides information for filtering a list of document classifiers. You can only specify one filtering parameter in a request. For more information, see the operation.</p>
 */
@interface AWSComprehendDocumentClassifierFilter : AWSModel


/**
 <p>Filters the list of classifiers based on status. </p>
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
 <p>The input properties for training a document classifier. </p><p>For more information on how the input file is formatted, see <a>how-document-classification-training-data</a>. </p>
 Required parameters: [S3Uri]
 */
@interface AWSComprehendDocumentClassifierInputDataConfig : AWSModel


/**
 <p>Indicates the delimiter used to separate each label for training a multi-label classifier. The default delimiter between labels is a pipe (|). You can use a different character as a delimiter (if it's an allowed character) by specifying it under Delimiter for labels. If the training documents use a delimiter other than the default or the delimiter you specify, the labels on that line will be combined to make a single unique label, such as LABELLABELLABEL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable labelDelimiter;

/**
 <p>The Amazon S3 URI for the input data. The S3 bucket must be in the same region as the API endpoint that you are calling. The URI can point to a single input file or it can provide the prefix for a collection of input files.</p><p>For example, if you use the URI <code>S3://bucketName/prefix</code>, if the prefix is a single file, Amazon Comprehend uses that file as input. If more than one file begins with the prefix, Amazon Comprehend uses all of them as input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

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
 <p> Provides output results configuration parameters for custom classifier jobs.</p>
 */
@property (nonatomic, strong) AWSComprehendDocumentClassifierOutputDataConfig * _Nullable outputDataConfig;

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
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

/**
 <p> Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your custom classifier. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon VPC</a>. </p>
 */
@property (nonatomic, strong) AWSComprehendVpcConfig * _Nullable vpcConfig;

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
 <p>The confidence score that Amazon Comprehend has this label correctly attributed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

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
 <p>The filter used to determine which endpoints are are returned. You can filter jobs on their name, model, status, or the date and time that they were created. You can only set one filter at a time. </p>
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
 <p>Specifies information about the specified endpoint.</p>
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
 <p>The desired number of inference units to be used by the model using this endpoint. Each inference unit represents of a throughput of 100 characters per second.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable desiredInferenceUnits;

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
 <p>A character offset in the input text that shows where the entity begins (the first character is at position 0). The offset returns the position of each UTF-8 code point in the string. A <i>code point</i> is the abstract character from a particular graphical representation. For example, a multi-byte UTF-8 character maps to a single code point.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable beginOffset;

/**
 <p>A character offset in the input text that shows where the entity ends. The offset returns the position of each UTF-8 code point in the string. A <i>code point</i> is the abstract character from a particular graphical representation. For example, a multi-byte UTF-8 character maps to a single code point. </p>
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
 <p>The entity's type.</p>
 */
@property (nonatomic, assign) AWSComprehendEntityType types;

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

@end

/**
 <p>Describes the training documents submitted with an entity recognizer.</p>
 Required parameters: [S3Uri]
 */
@interface AWSComprehendEntityRecognizerDocuments : AWSModel


/**
 <p> Specifies the Amazon S3 location where the training documents for an entity recognizer are located. The URI must be in the same region as the API endpoint that you are calling.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

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
 <p>A measure of how accurate the recognizer results are for the test data. It is derived from the <code>Precision</code> and <code>Recall</code> values. The <code>F1Score</code> is the harmonic average of the two scores. The highest score is 1, and the worst score is 0. </p>
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
 Required parameters: [EntityTypes, Documents]
 */
@interface AWSComprehendEntityRecognizerInputDataConfig : AWSModel


/**
 <p>S3 location of the annotations file for an entity recognizer.</p>
 */
@property (nonatomic, strong) AWSComprehendEntityRecognizerAnnotations * _Nullable annotations;

/**
 <p>S3 location of the documents folder for an entity recognizer</p>
 */
@property (nonatomic, strong) AWSComprehendEntityRecognizerDocuments * _Nullable documents;

/**
 <p>S3 location of the entity list for an entity recognizer.</p>
 */
@property (nonatomic, strong) AWSComprehendEntityRecognizerEntityList * _Nullable entityList;

/**
 <p>The entity types in the input data for an entity recognizer. A maximum of 12 entity types can be used at one time to train an entity recognizer.</p>
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
 <p> Provides information about an entity recognizer.</p>
 */
@property (nonatomic, strong) AWSComprehendEntityRecognizerMetadata * _Nullable recognizerMetadata;

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
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

/**
 <p> Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your custom entity recognizer. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon VPC</a>. </p>
 */
@property (nonatomic, strong) AWSComprehendVpcConfig * _Nullable vpcConfig;

@end

/**
 <p>Detailed information about the accuracy of an entity recognizer for a specific entity type. </p>
 */
@interface AWSComprehendEntityTypesEvaluationMetrics : AWSModel


/**
 <p>A measure of how accurate the recognizer results are for for a specific entity type in the test data. It is derived from the <code>Precision</code> and <code>Recall</code> values. The <code>F1Score</code> is the harmonic average of the two scores. The highest score is 1, and the worst score is 0. </p>
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
 <p>Information about an individual item on a list of entity types.</p>
 Required parameters: [Type]
 */
@interface AWSComprehendEntityTypesListItem : AWSModel


/**
 <p>Entity type of an item on an entity type list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>The input properties for a topic detection job.</p>
 Required parameters: [S3Uri]
 */
@interface AWSComprehendInputDataConfig : AWSModel


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
 <p>Describes a key noun phrase.</p>
 */
@interface AWSComprehendKeyPhrase : AWSModel


/**
 <p>A character offset in the input text that shows where the key phrase begins (the first character is at position 0). The offset returns the position of each UTF-8 code point in the string. A <i>code point</i> is the abstract character from a particular graphical representation. For example, a multi-byte UTF-8 character maps to a single code point.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable beginOffset;

/**
 <p>A character offset in the input text where the key phrase ends. The offset returns the position of each UTF-8 code point in the string. A <code>code point</code> is the abstract character from a particular graphical representation. For example, a multi-byte UTF-8 character maps to a single code point.</p>
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
 <p>Provides configuration parameters for the output of topic detection jobs.</p><p/>
 Required parameters: [S3Uri]
 */
@interface AWSComprehendOutputDataConfig : AWSModel


/**
 <p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt the output results from an analysis job. The KmsKeyId can be one of the following formats:</p><ul><li><p>KMS Key ID: <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>Amazon Resource Name (ARN) of a KMS Key: <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>KMS Key Alias: <code>"alias/ExampleAlias"</code></p></li><li><p>ARN of a KMS Key Alias: <code>"arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>When you use the <code>OutputDataConfig</code> object with asynchronous operations, you specify the Amazon S3 location where you want to write the output data. The URI must be in the same region as the API endpoint that you are calling. The location is used as the prefix for the actual location of the output file.</p><p>When the topic detection job is finished, the service creates an output file in a directory specific to the job. The <code>S3Uri</code> field contains the location of the output file, called <code>output.tar.gz</code>. It is a compressed archive that contains the ouput of the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

@end

/**
 <p>Identifies the part of speech represented by the token and gives the confidence that Amazon Comprehend has that the part of speech was correctly identified. For more information about the parts of speech that Amazon Comprehend can identify, see <a>how-syntax</a>.</p>
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
 <p>Provides the part of speech label and the confidence level that Amazon Comprehend has that the part of speech was correctly identified. For more information, see <a>how-syntax</a>.</p>
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
 <p> The desired number of inference units to be used by the model using this endpoint. Each inference unit represents of a throughput of 100 characters per second.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable desiredInferenceUnits;

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
 <p> Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for the job. For For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html">Amazon VPC</a>. </p>
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
