//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

// defined domain for errors from AWSRuntime.
FOUNDATION_EXPORT NSString *const AWSXMLBuilderErrorDomain;

/* NSError codes in AWSErrorDomain. */
typedef NS_ENUM(NSInteger, AWSXMLBuilderErrorType) {
    // AWSJSON Validation related errors
    AWSXMLBuilderUnknownError = 900, // Unknown Error found
    AWSXMLBuilderDefinitionFileIsEmpty = 901,
    AWSXMLBuilderUndefinedXMLNamespace = 902,
    AWSXMLBuilderUndefinedActionRule = 903,
    AWSXMLBuilderMissingRequiredXMLElements = 904,
    AWSXMLBuilderInvalidXMLValue = 905,
    AWSXMLBuilderUnCatchedRuleTypeInDifinitionFile = 906,
};

// defined domain for errors from AWSRuntime.
FOUNDATION_EXPORT NSString *const AWSXMLParserErrorDomain;

/* NSError codes in AWSErrorDomain. */
typedef NS_ENUM(NSInteger, AWSXMLParserErrorType) {
    // AWSJSON Validation related errors
    AWSXMLParserUnknownError, // Unknown Error found
    AWSXMLParserNoTypeDefinitionInRule, // Unknown Type in JSON Definition (rules) file
    AWSXMLParserUnHandledType, //Unhandled Type
    AWSXMLParserUnExpectedType, //Unexpected type
    AWSXMLParserDefinitionFileIsEmpty, //the rule is empty.
    AWSXMLParserUnexpectedXMLElement,
    AWSXMLParserXMLNameNotFoundInDefinition, //can not find the 'xmlname' key in definition file for unflattened xml list
    AWSXMLParserMissingRequiredXMLElements,
    AWSXMLParserInvalidXMLValue,
};

//defined domain for errors from AWSRuntime.
FOUNDATION_EXPORT NSString *const AWSQueryParamBuilderErrorDomain;

/* NSError codes in AWSErrorDomain. */
typedef NS_ENUM(NSInteger, AWSQueryParamBuilderErrorType) {
    AWSQueryParamBuilderUnknownError,
    AWSQueryParamBuilderDefinitionFileIsEmpty,
    AWSQueryParamBuilderUndefinedActionRule,
    AWSQueryParamBuilderInternalError,
    AWSQueryParamBuilderInvalidParameter,
};

//defined domain for errors from AWSRuntime.
FOUNDATION_EXPORT NSString *const AWSEC2ParamBuilderErrorDomain;

/* NSError codes in AWSErrorDomain. */
typedef NS_ENUM(NSInteger, AWSEC2ParamBuilderErrorType) {
    AWSEC2ParamBuilderUnknownError,
    AWSEC2ParamBuilderDefinitionFileIsEmpty,
    AWSEC2ParamBuilderUndefinedActionRule,
    AWSEC2ParamBuilderInternalError,
    AWSEC2ParamBuilderInvalidParameter,
};

//defined domain for errors from AWSRuntime.
FOUNDATION_EXPORT NSString *const AWSJSONBuilderErrorDomain;

/* NSError codes in AWSErrorDomain. */
typedef NS_ENUM(NSInteger, AWSJSONBuilderErrorType) {
    AWSJSONBuilderUnknownError,
    AWSJSONBuilderDefinitionFileIsEmpty,
    AWSJSONBuilderUndefinedActionRule,
    AWSJSONBuilderInternalError,
    AWSJSONBuilderInvalidParameter,
};

//defined domain for errors from AWSRuntime.
FOUNDATION_EXPORT NSString *const AWSJSONParserErrorDomain;

/* NSError codes in AWSErrorDomain. */
typedef NS_ENUM(NSInteger, AWSJSONParserErrorType) {
    AWSJSONParserUnknownError,
    AWSJSONParserDefinitionFileIsEmpty,
    AWSJSONParserUndefinedActionRule,
    AWSJSONParserInternalError,
    AWSJSONParserInvalidParameter,
};

@interface AWSJSONDictionary : NSDictionary

- (instancetype)initWithDictionary:(NSDictionary *)otherDictionary
                JSONDefinitionRule:(NSDictionary *)rule;
- (NSUInteger)count;
- (id)objectForKey:(id)aKey;

@end

@interface AWSXMLBuilder : NSObject

+ (NSData *)xmlDataForDictionary:(NSDictionary *)params
                      actionName:(NSString *)actionName
           serviceDefinitionRule:(NSDictionary *)serviceDefinitionRule
                           error:(NSError *__autoreleasing *)error;

+ (NSString *)xmlStringForDictionary:(NSDictionary *)params
                          actionName:(NSString *)actionName
               serviceDefinitionRule:(NSDictionary *)serviceDefinitionRule
                               error:(NSError *__autoreleasing *)error;

@end

@interface AWSXMLParser : NSObject

+ (AWSXMLParser *)sharedInstance;

- (NSMutableDictionary *)dictionaryForXMLData:(NSData *)data
                                   actionName:(NSString *)actionName
                        serviceDefinitionRule:(NSDictionary *)serviceDefinitionRule
                                        error:(NSError *__autoreleasing *)error;

@end

@interface AWSQueryParamBuilder : NSObject

+ (NSDictionary *)buildFormattedParams:(NSDictionary *)params
                            actionName:(NSString *)actionName
                 serviceDefinitionRule:(NSDictionary *)serviceDefinitionRule
                                 error:(NSError *__autoreleasing *)error;

@end

@interface AWSEC2ParamBuilder : NSObject

+ (NSDictionary *)buildFormattedParams:(NSDictionary *)params
                            actionName:(NSString *)actionName
                 serviceDefinitionRule:(NSDictionary *)serviceDefinitionRule
                                 error:(NSError *__autoreleasing *)error;

@end

@interface AWSJSONBuilder : NSObject

+ (NSData *)jsonDataForDictionary:(NSDictionary *)params
                       actionName:(NSString *)actionName
            serviceDefinitionRule:(NSDictionary *)serviceDefinitionRule
                            error:(NSError *__autoreleasing *)error;

@end

@interface AWSJSONParser : NSObject

+ (NSDictionary *)dictionaryForJsonData:(NSData *)data
                               response:(NSHTTPURLResponse *)response
                             actionName:(NSString *)actionName
                  serviceDefinitionRule:(NSDictionary *)serviceDefinitionRule
                                  error:(NSError *__autoreleasing *)error;

@end




