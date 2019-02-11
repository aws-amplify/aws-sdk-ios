//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

FOUNDATION_EXPORT NSString *const AWSTranslateErrorDomain;

typedef NS_ENUM(NSInteger, AWSTranslateErrorType) {
    AWSTranslateErrorUnknown,
    AWSTranslateErrorDetectedLanguageLowConfidence,
    AWSTranslateErrorInternalServer,
    AWSTranslateErrorInvalidParameterValue,
    AWSTranslateErrorInvalidRequest,
    AWSTranslateErrorLimitExceeded,
    AWSTranslateErrorResourceNotFound,
    AWSTranslateErrorServiceUnavailable,
    AWSTranslateErrorTextSizeLimitExceeded,
    AWSTranslateErrorTooManyRequests,
    AWSTranslateErrorUnsupportedLanguagePair,
};

typedef NS_ENUM(NSInteger, AWSTranslateEncryptionKeyType) {
    AWSTranslateEncryptionKeyTypeUnknown,
    AWSTranslateEncryptionKeyTypeKms,
};

typedef NS_ENUM(NSInteger, AWSTranslateMergeStrategy) {
    AWSTranslateMergeStrategyUnknown,
    AWSTranslateMergeStrategyOverwrite,
};

typedef NS_ENUM(NSInteger, AWSTranslateTerminologyDataFormat) {
    AWSTranslateTerminologyDataFormatUnknown,
    AWSTranslateTerminologyDataFormatCsv,
    AWSTranslateTerminologyDataFormatTmx,
};

@class AWSTranslateAppliedTerminology;
@class AWSTranslateDeleteTerminologyRequest;
@class AWSTranslateEncryptionKey;
@class AWSTranslateGetTerminologyRequest;
@class AWSTranslateGetTerminologyResponse;
@class AWSTranslateImportTerminologyRequest;
@class AWSTranslateImportTerminologyResponse;
@class AWSTranslateListTerminologiesRequest;
@class AWSTranslateListTerminologiesResponse;
@class AWSTranslateTerm;
@class AWSTranslateTerminologyData;
@class AWSTranslateTerminologyDataLocation;
@class AWSTranslateTerminologyProperties;
@class AWSTranslateTranslateTextRequest;
@class AWSTranslateTranslateTextResponse;

/**
 <p>The custom terminology applied to the input text by Amazon Translate for the translated text response. This is optional in the response and will only be present if you specified terminology input in the request. Currently, only one terminology can be applied per TranslateText request.</p>
 */
@interface AWSTranslateAppliedTerminology : AWSModel


/**
 <p>The name of the custom terminology applied to the input text by Amazon Translate for the translated text response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The specific terms of the custom terminology applied to the input text by Amazon Translate for the translated text response. A maximum of 250 terms will be returned, and the specific terms applied will be the first 250 terms in the source text. </p>
 */
@property (nonatomic, strong) NSArray<AWSTranslateTerm *> * _Nullable terms;

@end

/**
 
 */
@interface AWSTranslateDeleteTerminologyRequest : AWSRequest


/**
 <p>The name of the custom terminology being deleted. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>The encryption key used to encrypt the custom terminologies used by Amazon Translate.</p>
 Required parameters: [Type, Id]
 */
@interface AWSTranslateEncryptionKey : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the encryption key being used to encrypt the custom terminology.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The type of encryption key used by Amazon Translate to encrypt custom terminologies.</p>
 */
@property (nonatomic, assign) AWSTranslateEncryptionKeyType types;

@end

/**
 
 */
@interface AWSTranslateGetTerminologyRequest : AWSRequest


/**
 <p>The name of the custom terminology being retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The data format of the custom terminology being retrieved, either CSV or TMX.</p>
 */
@property (nonatomic, assign) AWSTranslateTerminologyDataFormat terminologyDataFormat;

@end

/**
 
 */
@interface AWSTranslateGetTerminologyResponse : AWSModel


/**
 <p>The data location of the custom terminology being retrieved. The custom terminology file is returned in a presigned url that has a 30 minute expiration.</p>
 */
@property (nonatomic, strong) AWSTranslateTerminologyDataLocation * _Nullable terminologyDataLocation;

/**
 <p>The properties of the custom terminology being retrieved.</p>
 */
@property (nonatomic, strong) AWSTranslateTerminologyProperties * _Nullable terminologyProperties;

@end

/**
 
 */
@interface AWSTranslateImportTerminologyRequest : AWSRequest


/**
 <p>The description of the custom terminology being imported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The encryption key for the custom terminology being imported.</p>
 */
@property (nonatomic, strong) AWSTranslateEncryptionKey * _Nullable encryptionKey;

/**
 <p>The merge strategy of the custom terminology being imported. Currently, only the OVERWRITE merge strategy is supported. In this case, the imported terminology will overwrite an existing terminology of the same name.</p>
 */
@property (nonatomic, assign) AWSTranslateMergeStrategy mergeStrategy;

/**
 <p>The name of the custom terminology being imported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The terminology data for the custom terminology being imported.</p>
 */
@property (nonatomic, strong) AWSTranslateTerminologyData * _Nullable terminologyData;

@end

/**
 
 */
@interface AWSTranslateImportTerminologyResponse : AWSModel


/**
 <p>The properties of the custom terminology being imported.</p>
 */
@property (nonatomic, strong) AWSTranslateTerminologyProperties * _Nullable terminologyProperties;

@end

/**
 
 */
@interface AWSTranslateListTerminologiesRequest : AWSRequest


/**
 <p>The maximum number of custom terminologies returned per list request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the result of the request to ListTerminologies was truncated, include the NextToken to fetch the next group of custom terminologies. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSTranslateListTerminologiesResponse : AWSModel


/**
 <p> If the response to the ListTerminologies was truncated, the NextToken fetches the next group of custom terminologies. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The properties list of the custom terminologies returned on the list request.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranslateTerminologyProperties *> * _Nullable terminologyPropertiesList;

@end

/**
 <p>The term being translated by the custom terminology.</p>
 */
@interface AWSTranslateTerm : AWSModel


/**
 <p>The source text of the term being translated by the custom terminology.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceText;

/**
 <p>The target text of the term being translated by the custom terminology.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetText;

@end

/**
 <p>The data associated with the custom terminology.</p>
 Required parameters: [File, Format]
 */
@interface AWSTranslateTerminologyData : AWSModel


/**
 <p>The file containing the custom terminology data.</p>
 */
@property (nonatomic, strong) NSData * _Nullable file;

/**
 <p>The data format of the custom terminology. Either CSV or TMX.</p>
 */
@property (nonatomic, assign) AWSTranslateTerminologyDataFormat format;

@end

/**
 <p>The location of the custom terminology data.</p>
 Required parameters: [RepositoryType, Location]
 */
@interface AWSTranslateTerminologyDataLocation : AWSModel


/**
 <p>The location of the custom terminology data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>The repository type for the custom terminology data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryType;

@end

/**
 <p>The properties of the custom terminology.</p>
 */
@interface AWSTranslateTerminologyProperties : AWSModel


/**
 <p> The Amazon Resource Name (ARN) of the custom terminology. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The time at which the custom terminology was created, based on the timestamp.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The description of the custom terminology properties.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The encryption key for the custom terminology.</p>
 */
@property (nonatomic, strong) AWSTranslateEncryptionKey * _Nullable encryptionKey;

/**
 <p>The time at which the custom terminology was last update, based on the timestamp.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>The name of the custom terminology.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The size of the file used when importing a custom terminology.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizeBytes;

/**
 <p>The language code for the source text of the translation request for which the custom terminology is being used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceLanguageCode;

/**
 <p>The language codes for the target languages available with the custom terminology file. All possible target languages are returned in array.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetLanguageCodes;

/**
 <p>The number of terms included in the custom terminology.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable termCount;

@end

/**
 
 */
@interface AWSTranslateTranslateTextRequest : AWSRequest


/**
 <p>The language code for the language of the source text. The language must be a language supported by Amazon Translate. </p><p>To have Amazon Translate determine the source language of your text, you can specify <code>auto</code> in the <code>SourceLanguageCode</code> field. If you specify <code>auto</code>, Amazon Translate will call Amazon Comprehend to determine the source language.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceLanguageCode;

/**
 <p>The language code requested for the language of the target text. The language must be a language supported by Amazon Translate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetLanguageCode;

/**
 <p>The TerminologyNames list that is taken as input to the TranslateText request. This has a minimum length of 0 and a maximum length of 1.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable terminologyNames;

/**
 <p>The text to translate. The text string can be a maximum of 5,000 bytes long. Depending on your character set, this may be fewer than 5,000 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSTranslateTranslateTextResponse : AWSModel


/**
 <p>The names of the custom terminologies applied to the input text by Amazon Translate for the translated text response.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranslateAppliedTerminology *> * _Nullable appliedTerminologies;

/**
 <p>The language code for the language of the source text. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceLanguageCode;

/**
 <p>The language code for the language of the target text. </p>
 */
@property (nonatomic, strong) NSString * _Nullable targetLanguageCode;

/**
 <p>The the translated text. The maximum length of this text is 5kb.</p>
 */
@property (nonatomic, strong) NSString * _Nullable translatedText;

@end

NS_ASSUME_NONNULL_END
