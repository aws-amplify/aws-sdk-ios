//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
    AWSTranslateErrorInvalidRequest,
    AWSTranslateErrorServiceUnavailable,
    AWSTranslateErrorTextSizeLimitExceeded,
    AWSTranslateErrorTooManyRequests,
    AWSTranslateErrorUnsupportedLanguagePair,
};

@class AWSTranslateTranslateTextRequest;
@class AWSTranslateTranslateTextResponse;

/**
 
 */
@interface AWSTranslateTranslateTextRequest : AWSRequest


/**
 <p>One of the supported language codes for the source text. If the <code>TargetLanguageCode</code> is not "en", the <code>SourceLanguageCode</code> must be "en".</p><p>To have Amazon Translate determine the source language of your text, you can specify <code>auto</code> in the <code>SourceLanguageCode</code> field. If you specify <code>auto</code>, Amazon Translate will call Amazon Comprehend to determine the source language.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceLanguageCode;

/**
 <p>One of the supported language codes for the target text. If the <code>SourceLanguageCode</code> is not "en", the <code>TargetLanguageCode</code> must be "en".</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetLanguageCode;

/**
 <p>The text to translate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSTranslateTranslateTextResponse : AWSModel


/**
 <p>The language code for the language of the input text. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceLanguageCode;

/**
 <p>The language code for the language of the translated text. </p>
 */
@property (nonatomic, strong) NSString * _Nullable targetLanguageCode;

/**
 <p>The text translated into the target language.</p>
 */
@property (nonatomic, strong) NSString * _Nullable translatedText;

@end

NS_ASSUME_NONNULL_END
