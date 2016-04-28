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

#import "AWSURLRequestSerialization.h"

#import "AWSGZIP.h"
#import "AWSBolts.h"
#import "AWSNetworking.h"
#import "AWSValidation.h"
#import "AWSSerialization.h"
#import "AWSCategory.h"
#import "AWSLogging.h"
#import "AWSClientContext.h"

@interface NSMutableURLRequest (AWSRequestSerializer)

- (void)aws_validateHTTPMethodAndBody;

@end

@implementation NSMutableURLRequest (AWSRequestSerializer)

- (void)aws_validateHTTPMethodAndBody {
    // GET and DELETE requests should not have a body or body stream.
    if ([self.HTTPMethod isEqualToString:@"GET"]
        || [self.HTTPMethod isEqualToString:@"DELETE"]) {
        if (self.HTTPBody) {
            self.HTTPBody = nil;
        }
        if (self.HTTPBodyStream) {
            self.HTTPBodyStream = nil;
        }
    }
}

@end

@interface AWSJSONRequestSerializer()

@property (nonatomic, strong) NSDictionary *serviceDefinitionJSON;
@property (nonatomic, strong) NSString *actionName;

@end

@implementation AWSJSONRequestSerializer

- (instancetype)initWithJSONDefinition:(NSDictionary *)JSONDefinition
                            actionName:(NSString *)actionName {
    if (self = [super init]) {

        _serviceDefinitionJSON = JSONDefinition;
        if (_serviceDefinitionJSON == nil) {
            AWSLogError(@"serviceDefinitionJSON of is nil.");
            return nil;
        }
        _actionName = actionName;
    }

    return self;
}

- (AWSTask *)serializeRequest:(NSMutableURLRequest *)request
                      headers:(NSDictionary *)headers
                   parameters:(NSDictionary *)parameters {
    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;

    //If parameters contains clientContext key, move it to http header. This is a sepcial case
    if ([parameters objectForKey:@"clientContext"]) {
        [request setValue:[[[parameters objectForKey:@"clientContext"] dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:kNilOptions]
       forHTTPHeaderField:AWSClientContextHeader];
        [request setValue:@"base64"
       forHTTPHeaderField:AWSClientContextHeaderEncoding];
        NSMutableDictionary *mutableParameters = [parameters mutableCopy];
        [mutableParameters removeObjectForKey:@"clientContext"];
        parameters = mutableParameters;
    }

    NSDictionary *actionRules = [[self.serviceDefinitionJSON objectForKey:@"operations"] objectForKey:self.actionName];
    NSDictionary *shapeRules = [self.serviceDefinitionJSON objectForKey:@"shapes"];
    AWSJSONDictionary *inputRules = [[AWSJSONDictionary alloc] initWithDictionary:[actionRules objectForKey:@"input"] JSONDefinitionRule:shapeRules];

    NSDictionary *actionHTTPRule = [actionRules objectForKey:@"http"];
    NSString *ruleURIStr = [actionHTTPRule objectForKey:@"requestUri"];

    NSError *error = nil;

    [AWSXMLRequestSerializer constructURIandHeadersAndBody:request
                                                     rules:inputRules
                                                parameters:parameters
                                                 uriSchema:ruleURIStr
                                                     error:&error];
    if (error) {
        return [AWSTask taskWithError:error];
    }

    //construct HTTPBody only if HTTPBodyStream is nil
    if (!request.HTTPBodyStream) {
        NSData *bodyData = [AWSJSONBuilder jsonDataForDictionary:parameters actionName:self.actionName serviceDefinitionRule:self.serviceDefinitionJSON error:&error];
        if (!error) {
            if (headers[@"Content-Encoding"] && [headers[@"Content-Encoding"] rangeOfString:@"gzip"].location != NSNotFound) {
                //gzip the body
                request.HTTPBody = [bodyData awsgzip_gzippedData];
            } else {
                request.HTTPBody = bodyData;
            }
        }
    }

    [request aws_validateHTTPMethodAndBody];



    if (!error) {
        for (NSString *key in headers) {
            [request setValue:[headers objectForKey:key] forHTTPHeaderField:key];
        }

        return [AWSTask taskWithResult:nil];
    }

    return [AWSTask taskWithError:error];
}

- (AWSTask *)validateRequest:(NSURLRequest *)request {
    return [AWSTask taskWithResult:nil];

}

@end

@interface AWSXMLRequestSerializer()

@property (nonatomic, strong) NSDictionary *serviceDefinitionJSON;
@property (nonatomic, strong) NSString *actionName;

@end

@implementation AWSXMLRequestSerializer

- (instancetype)initWithJSONDefinition:(NSDictionary *)JSONDefinition
                            actionName:(NSString *)actionName {
    if (self = [super init]) {

        _serviceDefinitionJSON = JSONDefinition;
        if (_serviceDefinitionJSON == nil) {
            AWSLogError(@"serviceDefinitionJSON of is nil.");
            return nil;
        }
        _actionName = actionName;
    }

    return self;
}

/* need to overwrite this method to do serialization for self.parameter */
- (AWSTask *)serializeRequest:(NSMutableURLRequest *)request
                      headers:(NSDictionary *)headers
                   parameters:(NSDictionary *)parameters {
    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;

    NSDictionary *anActionRules = [[self.serviceDefinitionJSON objectForKey:@"operations"] objectForKey:self.actionName];

    NSDictionary *actionHTTPRule = [anActionRules objectForKey:@"http"];
    //Construct HTTPMethod
    NSString *ruleHTTPMethod = [actionHTTPRule objectForKey:@"method"];
    if ([ruleHTTPMethod length] > 0) {
        request.HTTPMethod = ruleHTTPMethod;
    }

    //Construct URI and Headers and HTTPBodyStream
    NSString *ruleURIStr = [actionHTTPRule objectForKey:@"requestUri"];
    NSDictionary *shapeRules = [self.serviceDefinitionJSON objectForKey:@"shapes"];
    AWSJSONDictionary *inputRules = [[AWSJSONDictionary alloc] initWithDictionary:[anActionRules objectForKey:@"input"] JSONDefinitionRule:shapeRules];

    NSError *error = nil;
    [AWSXMLRequestSerializer constructURIandHeadersAndBody:request
                                                     rules:inputRules
                                                parameters:parameters
                                                 uriSchema:ruleURIStr
                                                     error:&error];

    if (!error) {
        //construct HTTPBody only if HTTPBodyStream is nil
        if (!request.HTTPBodyStream) {
            request.HTTPBody = [AWSXMLBuilder xmlDataForDictionary:parameters
                                                        actionName:self.actionName
                                             serviceDefinitionRule:self.serviceDefinitionJSON
                                                             error:&error];
        }

        //contruct additional headers
        if (!error) {
            if (headers) {
                //generate HTTP header here
                for (NSString *key in headers.allKeys) {
                    [request setValue:[headers objectForKey:key] forHTTPHeaderField:key];
                }
            }
        }
    }

    [request aws_validateHTTPMethodAndBody];

    if (error) {
        return [AWSTask taskWithError:error];
    } else {
        return [AWSTask taskWithResult:nil];
    }
}

- (AWSTask *)validateRequest:(NSURLRequest *)request {
    return [AWSTask taskWithResult:nil];
}

+ (BOOL)constructURIandHeadersAndBody:(NSMutableURLRequest *)request
                                rules:(AWSJSONDictionary *)rules
                           parameters:(NSDictionary *)params
                            uriSchema:(NSString *)uriSchema
                                error:(NSError *__autoreleasing *)error {
    //If no rule just return
    if (rules == (id)[NSNull null] ||  [rules count] == 0) {
        return YES;
    }

    NSMutableDictionary *queryStringDictionary = [NSMutableDictionary new];

    rules = rules[@"members"] ? rules[@"members"] : @{};

    __block NSString *rawURI = uriSchema?uriSchema:@"";
    __block BOOL isValid = YES;
    __block NSError *blockErr = nil;
    [rules enumerateKeysAndObjectsUsingBlock:^(NSString *memberName, id memberRules, BOOL *stop) {

        NSString *xmlElementName = memberRules[@"locationName"]?memberRules[@"locationName"]:memberName;
        id value = nil;
        if (memberRules[@"locationName"]) {
            value = params[memberRules[@"locationName"]];
        }
        if (!value) {
            value = params[memberName];
        }

        if (value && value != [NSNull null] && [memberRules isKindOfClass:[NSDictionary class]]) {

            NSString *rulesType = memberRules[@"type"];
            NSString *valueStr = @"";

            if ([rulesType isEqualToString:@"integer"] || [rulesType isEqualToString:@"long"] || [rulesType isEqualToString:@"float"] || [rulesType isEqualToString:@"double"]) {
                if ([value isKindOfClass:[NSNumber class]]) {
                    valueStr = [value stringValue];
                }

            } else if ([rulesType isEqualToString:@"boolean"]) {
                if ([value isKindOfClass:[NSNumber class]]) {
                    valueStr = [value boolValue]?@"true":@"false";
                }
            } else if ([rulesType isEqualToString:@"string"]) {
                if ([value isKindOfClass:[NSString class]]) {
                    valueStr = value;
                }
            } else if ([rulesType isEqualToString:@"timestamp"]) {
                if ([value isKindOfClass:[NSNumber class]]) {
                    //if it is for header, we should convert to RFC822 format
                    if ([memberRules[@"location"] isEqualToString:@"header"]) {
                        NSDate *timeStampDate = [NSDate dateWithTimeIntervalSince1970:[value doubleValue]];
                        valueStr = [timeStampDate aws_stringValue:AWSDateRFC822DateFormat1];
                    } else {
                        valueStr = [value stringValue];
                    }

                } else if ([value isKindOfClass:[NSString class]]) {
                    valueStr = value; //timestamp will be treated as string here.
                }
            } else {
                valueStr = @"";
            }

            //If it is headers type, add to headers
            if ([memberRules[@"location"] isEqualToString:@"header"]) {

                [request addValue:valueStr forHTTPHeaderField:memberRules[@"locationName"]];
            }

            //if it is a map type with headers tag, add to headers
            if ([value isKindOfClass:[NSDictionary class]] && [rulesType isEqualToString:@"map"] && [memberRules[@"location"] isEqualToString:@"headers"] ) {
                for (NSString *key in value) {
                    NSString *keyName = [memberRules[@"locationName"] stringByAppendingString:key];
                    [request addValue:value[key] forHTTPHeaderField:keyName];
                }
            }

            //If it is uri type, construct uri
            if ([memberRules[@"location"] isEqualToString:@"uri"]) {
                NSString *keyToFind = [NSString stringWithFormat:@"{%@}", xmlElementName];
                NSString *greedyKeyToFind = [NSString stringWithFormat:@"{%@+}", xmlElementName];

                if ([rawURI rangeOfString:keyToFind].location != NSNotFound) {
                    rawURI = [rawURI stringByReplacingOccurrencesOfString:keyToFind
                                                               withString:[valueStr aws_stringWithURLEncoding]];

                } else if ([rawURI rangeOfString:greedyKeyToFind].location != NSNotFound) {
                    rawURI = [rawURI stringByReplacingOccurrencesOfString:greedyKeyToFind
                                                               withString:[valueStr aws_stringWithURLEncodingPath]];
                }


            }

            //if it is queryString type, construct queryString
            if ([memberRules[@"location"] isEqualToString:@"querystring"]) {
                [queryStringDictionary setObject:valueStr forKey:memberRules[@"locationName"]];
            }

            //If it is "Body" Type and streaming Type, contructBody
            if (([xmlElementName isEqualToString:@"Body"] || [xmlElementName isEqualToString:@"body"]) && [memberRules[@"streaming"] boolValue]) {
                if ([value isKindOfClass:[NSURL class]]) {
                    if ([value checkResourceIsReachableAndReturnError:&blockErr]) {
                        request.HTTPBodyStream = [NSInputStream inputStreamWithURL:value];
                    } else {
                        //URL is not reachable, stop enumeration
                        isValid = NO;
                        *stop = YES;
                    }

                } else {
                    if ([value isKindOfClass:[NSString class]]) {
                        value = [value dataUsingEncoding:NSUTF8StringEncoding];
                    }
                    if ([value isKindOfClass:[NSData class]]) {
                        request.HTTPBodyStream = [NSInputStream inputStreamWithData:value];
                    }

                }

            }
        }
    }];

    if (!isValid) {
        if (error) {
            *error = blockErr;
            if (*error == nil) {
                *error = [NSError errorWithDomain:AWSValidationErrorDomain code:AWSValidationUnknownError userInfo:[NSDictionary dictionaryWithObject:@"Unknown error happened while enumerating rules" forKey:NSLocalizedDescriptionKey]];
            }
        }
        return NO;
    }

    BOOL uriSchemaContainsQuestionMark = NO;
    NSRange hasQuestionMark = [uriSchema rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"?"]];
    if (hasQuestionMark.location != NSNotFound) {
        uriSchemaContainsQuestionMark = YES;
    }

    if ([queryStringDictionary count]) {
        NSArray *myKeys = [queryStringDictionary allKeys];
        NSArray *sortedKeys = [myKeys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
        NSString *queryString = @"";
        for (NSString *key in sortedKeys) {
            if ([queryString length] == 0 && uriSchemaContainsQuestionMark == NO) {
                queryString = [NSString stringWithFormat:@"?%@=%@",[key aws_stringWithURLEncoding],[queryStringDictionary[key] aws_stringWithURLEncoding]];
            } else {
                NSString *appendString = [NSString stringWithFormat:@"&%@=%@",[key aws_stringWithURLEncoding],[queryStringDictionary[key] aws_stringWithURLEncoding]];
                queryString = [queryString stringByAppendingString:appendString];
            }
        }
        rawURI = [rawURI stringByAppendingString:queryString];
    }

    //removed unused query key
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\{.*?\\}" options:NSRegularExpressionCaseInsensitive error:nil];
    rawURI = [regex stringByReplacingMatchesInString:rawURI options:0 range:NSMakeRange(0, [rawURI length]) withTemplate:@""];

    //validate URL
    NSRange r = [rawURI rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"{}"]];
    if (r.location != NSNotFound) {
        if (error) {
            *error = [NSError errorWithDomain:AWSValidationErrorDomain code:AWSValidationURIIsInvalid userInfo:[NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"the constructed request queryString is invalid:%@",rawURI] forKey:NSLocalizedDescriptionKey]];
        }
        request.URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/", request.URL]];

        return NO;
    } else {
        // fix query string
        // @"?location" -> @"?location="

        NSRange hasQuestionMark = [rawURI rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"?"]];
        NSRange hasEqualMark = [rawURI rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"="]];
        if ( (hasQuestionMark.location != NSNotFound) && (hasEqualMark.location == NSNotFound) ) {
            rawURI = [rawURI stringByAppendingString:@"="];
        }

        NSString *finalURL = [NSString stringWithFormat:@"%@%@", request.URL,rawURI];
        request.URL = [NSURL URLWithString:finalURL];
        if (!request.URL) {
            if (error) {
                *error = [NSError errorWithDomain:AWSValidationErrorDomain code:AWSValidationURIIsInvalid userInfo:[NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"unable the assigned URL to request, URL may be invalid:%@",finalURL] forKey:NSLocalizedDescriptionKey]];
            }
            return NO;
        }

        return YES;
    }
}

@end


@interface AWSQueryStringRequestSerializer()

@property (nonatomic, strong) NSDictionary *serviceDefinitionJSON;
@property (nonatomic, strong) NSString *actionName;

@end

@implementation AWSQueryStringRequestSerializer

- (instancetype)initWithJSONDefinition:(NSDictionary *)JSONDefinition
                            actionName:(NSString *)actionName {
    if (self = [super init]) {
        _serviceDefinitionJSON = JSONDefinition;
        if (_serviceDefinitionJSON == nil) {
            AWSLogError(@"serviceDefinitionJSON of is nil.");
            return nil;
        }
        _actionName = actionName;
    }

    return self;

}

- (void)processParameters:(NSDictionary *)parameters queryString:(NSMutableString *)queryString {
    for (NSString *key in parameters) {
        id obj = parameters[key];

        if ([obj isKindOfClass:[NSDictionary class]]) {
            [self processParameters:obj queryString:queryString];
        } else {

            if ([queryString length] > 0) {
                [queryString appendString:@"&"];
            }

            if ([obj isKindOfClass:[NSString class]]) {
                [queryString appendString:[key aws_stringWithURLEncoding]];
                [queryString appendString:@"="];
                NSString *urlEncodedString = [obj aws_stringWithURLEncoding];
                [queryString appendString:urlEncodedString];
            } else if ([obj isKindOfClass:[NSNumber class]]) {
                [queryString appendString:[key aws_stringWithURLEncoding]];
                [queryString appendString:@"="];
                [queryString appendString:[[obj stringValue] aws_stringWithURLEncoding]];
            } else {
                AWSLogError(@"key[%@] is invalid.", key);
                [queryString appendString:[key aws_stringWithURLEncoding]];
                [queryString appendString:@"="];
                [queryString appendString:[[obj description]aws_stringWithURLEncoding]];
            }
        }
    }

}

- (AWSTask *)serializeRequest:(NSMutableURLRequest *)request
                      headers:(NSDictionary *)headers
                   parameters:(NSDictionary *)parameters {
    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;

    parameters = [parameters mutableCopy];
    [self.additionalParameters enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [parameters setValue:obj forKey:key];
    }];

    //Need to add version and actionName
    NSError *error = nil;
    NSDictionary *formattedParams = [AWSQueryParamBuilder buildFormattedParams:parameters
                                                                    actionName:self.actionName
                                                         serviceDefinitionRule:self.serviceDefinitionJSON error:&error];
    if (error) {
        return [AWSTask taskWithError:error];
    }

    NSMutableString *queryString = [NSMutableString new];
    [self processParameters:formattedParams queryString:queryString];

    if ([queryString length] > 0) {
        request.HTTPBody = [queryString dataUsingEncoding:NSUTF8StringEncoding];
    }

    //contruct additional headers
    if (headers) {
        //generate HTTP header here
        for (NSString *key in headers.allKeys) {
            [request setValue:[headers objectForKey:key] forHTTPHeaderField:key];
        }
    }

    if (!request.allHTTPHeaderFields[@"Content-Type"]) {
        [request addValue:@"application/x-www-form-urlencoded; charset=utf-8"
       forHTTPHeaderField:@"Content-Type"];
    }

    [request aws_validateHTTPMethodAndBody];

    return [AWSTask taskWithResult:nil];
}

- (AWSTask *)validateRequest:(NSURLRequest *)request {
    return [AWSTask taskWithResult:nil];
}

@end

@implementation AWSEC2RequestSerializer

//overwrite serializeRequest method for EC2
- (AWSTask *)serializeRequest:(NSMutableURLRequest *)request
                      headers:(NSDictionary *)headers
                   parameters:(NSDictionary *)parameters {
    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;

    parameters = [parameters mutableCopy];
    [self.additionalParameters enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [parameters setValue:obj forKey:key];
    }];

    //Need to add version and actionName
    NSError *error = nil;
    NSDictionary *formattedParams = [AWSEC2ParamBuilder buildFormattedParams:parameters
                                                                  actionName:self.actionName
                                                       serviceDefinitionRule:self.serviceDefinitionJSON error:&error];
    if (error) {
        return [AWSTask taskWithError:error];
    }

    NSMutableString *queryString = [NSMutableString new];
    [self processParameters:formattedParams queryString:queryString];

    if ([queryString length] > 0) {
        request.HTTPBody = [queryString dataUsingEncoding:NSUTF8StringEncoding];
    }

    //contruct additional headers
    if (headers) {
        //generate HTTP header here
        for (NSString *key in headers.allKeys) {
            [request setValue:[headers objectForKey:key] forHTTPHeaderField:key];
        }
    }
    
    if (!request.allHTTPHeaderFields[@"Content-Type"]) {
        [request addValue:@"application/x-www-form-urlencoded; charset=utf-8"
       forHTTPHeaderField:@"Content-Type"];
    }
    
    [request aws_validateHTTPMethodAndBody];
    
    return [AWSTask taskWithResult:nil];
}

@end
