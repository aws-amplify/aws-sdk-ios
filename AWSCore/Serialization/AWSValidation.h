/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>

// defined domain for errors from AWSRuntime.
FOUNDATION_EXPORT NSString *const AWSValidationErrorDomain;

/* NSError codes in AWSErrorDomain. */
typedef NS_ENUM(NSInteger, AWSValidationErrorType) {
    // AWSJSON Validation related errors
    AWSValidationUnknownError, // Unknown Error found during JSON Validation
    AWSValidationUnexpectedParameter, // Unexpected Parameters found in HTTP Body
    AWSValidationUnhandledType,
    AWSValidationMissingRequiredParameter,
    AWSValidationOutOfRangeParameter,
    AWSValidationInvalidStringParameter,
    AWSValidationUnexpectedStringParameter,
    AWSValidationInvalidParameterType,
    AWSValidationInvalidBase64Data,
    AWSValidationHeaderTargetInvalid,
    AWSValidationHeaderAPIActionIsUndefined,
    AWSValidationHeaderDefinitionFileIsNotFound,
    AWSValidationHeaderDefinitionFileIsEmpty,
    AWSValidationHeaderAPIActionIsInvalid,
    AWSValidationURIIsInvalid
};

@interface AWSJSONValidator : NSObject

+ (BOOL)validateParams:(NSDictionary*)params
                byRule:(NSDictionary*)rule
                 error:(NSError *__autoreleasing *)error;

@end
