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

#import "AWSValidation.h"
#import "AWSCategory.h"

NSString *const AWSValidationErrorDomain = @"com.amazonaws.AWSValidationErrorDomain";

@implementation AWSJSONValidator

+ (BOOL)failWithCode:(NSInteger)code description:(NSString *)description error:(NSError *__autoreleasing *)error {
    if (error) {
        *error = [NSError errorWithDomain:AWSValidationErrorDomain
                                     code:code
                                 userInfo:@{NSLocalizedDescriptionKey : description}];
    }
    return NO;
}

+ (BOOL)validateParams:(NSDictionary *)params byRule:(NSDictionary *)rule error:(NSError *__autoreleasing *)error {
    return [self validateStructureByRule:rule params:params context:@"params" error:error];
}

+ (BOOL)validateStructureByRule:(NSDictionary *)rule params:(NSDictionary *)params context:(NSString *)context error:(NSError *__autoreleasing *)error {
    //validate the rule is a structure type
    if (![self validateTypeWithContext:context value:params acceptedTypes:@[[NSDictionary new]] type:@"structure" error:error]) return NO;

    //validate the constraint of the structure
    if (![self validateConstraintByRule:rule forValue:params context:context error:error]) return NO;

    NSDictionary *memberRule = rule[@"members"]?rule[@"members"]:[NSDictionary new];
    //validate value of params
    __block BOOL isValid = YES;
    __block NSError *blockErr = nil;
    [params enumerateKeysAndObjectsUsingBlock:^(NSString* key, id paramValue, BOOL *stop) {
        NSDictionary *subRule = memberRule[key];
        if (!subRule) {
            isValid = [self failWithCode:AWSValidationUnexpectedParameter
                             description:[NSString stringWithFormat:@"Unexpected key:%@ found in %@", key, context]
                                   error:&blockErr];
            *stop = YES;
            return;

        } else {
            NSString *memberContext = [@[context,key] componentsJoinedByString:@"."];
            if (![self validateMemberByRule:subRule params:paramValue context:memberContext error:&blockErr]) {
                isValid = NO;
                *stop = YES;
            }
        }
    }];
    if (error) *error = blockErr;
    return isValid;
}

+ (BOOL)validateMemberByRule:(NSDictionary *)rule params:(id)params context:(NSString *)context error:(NSError *__autoreleasing *)error {

    if ([rule[@"type"] isEqualToString:@"structure"]) {
        return [self validateStructureByRule:rule params:params context:context error:error];
    }else if ([rule[@"type"] isEqualToString:@"list"]) {
        return [self validateListByRule:rule params:params context:context error:error];
    }else if ([rule[@"type"] isEqualToString:@"map"]) {
        return [self validateMapByRule:rule  params:params context:context error:error];
    }else {
        return [self validateScalarByRule:rule value:params context:context error:error];
    }
}

+ (BOOL)validateListByRule:(NSDictionary *)rule params:(NSArray *)params context:(NSString *)context error:(NSError *__autoreleasing *)error {
    //validate type
    if (![self validateTypeWithContext:context value:params acceptedTypes:@[[NSArray new]] type:nil error:error]) return NO;
    //validate constraint
    if (![self validateConstraintByRule:rule forValue:params context:context error:error]) return NO;

    //validate array members
    __block BOOL isValid = YES;
    __block NSError *blockErr = nil;
    NSDictionary *memberRule = rule[@"members"]?rule[@"members"]:[NSDictionary new];
    [params enumerateObjectsUsingBlock:^(id subParam, NSUInteger idx, BOOL *stop) {
        if (![self validateMemberByRule:memberRule params:subParam context:[NSString stringWithFormat:@"%@ [%lu]",context,(unsigned long)idx] error:&blockErr]) {
            isValid = NO;
            *stop = YES;
        }
    }];
    if (error) *error = blockErr;
    return isValid;
}

+ (BOOL)validateMapByRule:(NSDictionary *)rule params:(NSDictionary *)params context:(NSString *)context error:(NSError *__autoreleasing *)error {
    //validate type
    if (![self validateTypeWithContext:context value:params acceptedTypes:@[[NSDictionary new]] type:@"map" error:error]) return NO;
    //validate constraint
    if (![self validateConstraintByRule:rule forValue:params context:context error:error]) return NO;

    //validate members of the map
    NSDictionary *keyRule = rule[@"keys"]?rule[@"keys"]:[NSDictionary new];
    NSDictionary *memberRule = rule[@"members"]?rule[@"members"]:[NSDictionary new];

    __block BOOL isValid = YES;
    __block NSError *blockErr = nil;
    [params enumerateKeysAndObjectsUsingBlock:^(NSString* keyName, id paramValue, BOOL *stop) {
        //validate map keys
        if (![self validateMemberByRule:keyRule params:keyName context:[NSString stringWithFormat:@"%@ (%@)",context,keyRule[@"shape_name"]] error:&blockErr]){
            isValid = NO;
            *stop = YES;
            return;
        }
        //validate map members
        if (![self validateMemberByRule:memberRule params:paramValue context:[NSString stringWithFormat:@"%@ [%@]",context,keyName] error:&blockErr]){
            isValid = NO;
            *stop = YES;
            return;
        }
    }];
    if (error) *error = blockErr;
    return isValid;
}

+ (BOOL)validateScalarByRule:(NSDictionary *)rule value:(id)value context:(NSString *)context error:(NSError *__autoreleasing *)error {
    BOOL isValid = YES;
    if ([rule[@"type"] isEqualToString:@"string"]) {
        isValid = [self validateTypeWithContext:context value:value acceptedTypes:@[@"string"] type:nil error:error];
    } else if ([rule[@"type"] isEqualToString:@"blob"]) {
        isValid = [self validateBinaryWithContext:context data:value error:error];
    } else if ([rule[@"type"] isEqualToString:@"integer"] || [rule[@"type"] isEqualToString:@"long"] || [rule[@"type"] isEqualToString:@"float"] || [rule[@"type"] isEqualToString:@"double"]) {
        isValid = [self validateNumberWithContext:context number:value acceptedType:rule[@"type"] error:error];
    } else if ([rule[@"type"] isEqualToString:@"boolean"]) {
        isValid = [self validateTypeWithContext:context value:value acceptedTypes:@[@"boolean"] type:nil error:error];
    } else if ([rule[@"type"] isEqualToString:@"timestamp"]) {
        isValid = [self validateNumberWithContext:context number:value acceptedType:@"timestamp" error:error];
    } else {
        return [self failWithCode:AWSValidationUnhandledType
                      description:[NSString stringWithFormat:@"'%@' expected to be:%@ but got:%@", context, rule[@"type"], NSStringFromClass([value class])]
                            error:error];
    }

    //validate contraint
    return isValid?[self validateConstraintByRule:rule forValue:value context:context error:error]:NO;
}

+ (BOOL)validateConstraintByRule:(NSDictionary *)rule forValue:(id)value context:(NSString *)context error:(NSError *__autoreleasing *)error {

    //validate the existence of  required parameters.
    while ([rule[@"required"] boolValue]) {
        //value is a structure or map
        if ([value isKindOfClass:[NSDictionary class]] && [value count]>0) break;
        //value is a list
        if ([value isKindOfClass:[NSArray class]] && [value count]>0) break;
        //value is a string
        if ([value isKindOfClass:[NSString class]] && [value length] > 0) break;
        //value is NSNumber( e.g long, integer, double, float)
        if ([value isKindOfClass:[NSNumber class]]) break;

        return [self failWithCode:AWSValidationMissingRequiredParameter
                      description:[NSString stringWithFormat:@"Missing required key: %@ in %@", rule[@"shape_name"], context]
                            error:error];
    }

    //validate length
    NSUInteger minL = 0;
    NSUInteger maxL = NSUIntegerMax;
    while (rule[@"min_length"] || rule[@"max_length"]) {
        NSUInteger currentNumber = 0;
        minL = rule[@"min_length"] ? [rule[@"min_length"] intValue] : minL;
        maxL = rule[@"max_length"] ? [rule[@"max_length"] intValue] : maxL;
        //a map (NSDictionary)
        //TODO: temporarily turned off length validation for map value. server reponse getBatchItem->unprocessedKeys has 0 value while rule required min_length is 1.
        if ([value isKindOfClass:[NSDictionary class]]) {
            /*currentNumber = [value count];
            if([value count] >= minL && [value count] <= maxL)*/ break;
        }
        //a list (NSArray)
        if ([value isKindOfClass:[NSArray class]] ) {
            currentNumber = [value count];
            if ([value count] >= minL && [value count] <= maxL) break;
        }
        //a string
        if ([value isKindOfClass:[NSString class]] ) {
            currentNumber = [value length];
            if ([value length] >= minL && [value length] <= maxL) break;
        }
        //a long or integer
        if ([value isKindOfClass:[NSNumber class]]) {
            //TODO: temporily turned off length validation for number value. reason: DescribeTable->ProvisonedThroughput->NumberOfDecreasedToday returns 0, but the rule has a min_length of 1 which made the validation failed.
            /*
            currentNumber = [value intValue];
            if ([value intValue] >= minL && [value intValue] <= maxL)*/ break;
            
        }
        

        return [self failWithCode:AWSValidationOutOfRangeParameter
                      description:[NSString stringWithFormat:@"key: %@ in %@ should have range of [%lu,%lu] but got:%lu", [value description], context, (unsigned long)minL, (unsigned long)maxL, (unsigned long)currentNumber]
                            error:error];
    }

    //validate pattern for string
    if (rule[@"pattern"] && [value isKindOfClass:[NSString class]]) {
        NSString *pattern = rule[@"pattern"];
        NSPredicate *aPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
        if (![aPredicate evaluateWithObject:value]) {
            return [self failWithCode:AWSValidationInvalidStringParameter
                          description:[NSString stringWithFormat:@"key: %@ in %@ has invalid characters:%@", rule[@"shape_name"], context, value]
                                error:error];
        }
    }

    //validate value of string according to tnum list
    if (rule[@"enum"] && [value isKindOfClass:[NSString class]]) {
        NSArray *enumArray = rule[@"enum"];
        if (![enumArray containsObject:value]) {
            return [self failWithCode:AWSValidationUnexpectedStringParameter
                          description:[NSString stringWithFormat:@"key: %@ in %@ has unexpected string:%@ not in the enum list:%@", rule[@"shape_name"], context, value, [enumArray description]]
                                error:error];
        }
    }

    return YES;
}

+ (NSString *)convertArrayToString:(NSArray *)myArray {
    NSString *result=@"[";

    for (id aType in myArray) {
        if ([aType isKindOfClass:[NSDictionary class]]) result = [result stringByAppendingString:@"NSDictionary or"];
        if ([aType isKindOfClass:[NSArray class]]) result = [result stringByAppendingString:@"NSArray or"];
        if ([aType isKindOfClass:[NSDate class]]) result = [result stringByAppendingString:@"NSDate or"];
        if ([aType isKindOfClass:[NSString class]]) result = [NSString stringWithFormat:@"%@ %@ or", result, aType];
    }
    result = [result stringByAppendingString:@"]"];
    
    return result;
}

+ (BOOL)validateTypeWithContext:(NSString *)context value:(id)value acceptedTypes:(NSArray *)acceptedTypes type:(NSString *)type error:(NSError *__autoreleasing *)error {

    for (int i=0;i < acceptedTypes.count; i++){
        if ([acceptedTypes[i] isKindOfClass:[NSString class]]) { //@"string" @"boolean" @"TimestampString"
            if ([acceptedTypes[i] isEqualToString:@"string"] && [value isKindOfClass:[NSString class]]) return YES;
            if ([acceptedTypes[i] isEqualToString:@"boolean"] && [value isKindOfClass:[NSNumber class]]) return YES;
            if ([acceptedTypes[i] isEqualToString:@"TimestampString"] && [value isKindOfClass:[NSString class]]) {
                if ([[NSNumberFormatter new] numberFromString:value]) return YES;
            }

        } else { //kindOfClass maybe NSArray, NSDictionary, NSDate
            if ([acceptedTypes[i] isKindOfClass:[NSDictionary class]] && [value isKindOfClass:[NSDictionary class]]) return YES;
            if ([acceptedTypes[i] isKindOfClass:[NSArray class]] && [value isKindOfClass:[NSArray class]]) return YES;
            if ([acceptedTypes[i] isKindOfClass:[NSDate class]] && [value isKindOfClass:[NSDate class]]) return YES;
        }
    }

    return [self failWithCode:AWSValidationInvalidParameterType description:[NSString stringWithFormat:@"Expect '%@' to be a %@ but got %@",context,[self convertArrayToString:acceptedTypes],NSStringFromClass([value class])] error:error];
}
+ (BOOL)validateNumberWithContext:(NSString *)context number:(id)number acceptedType:(NSString *)acceptedType error:(NSError *__autoreleasing *)error {
    if (![number isKindOfClass:[NSNumber class]]) {
        return [self failWithCode:AWSValidationInvalidParameterType
                      description:[NSString stringWithFormat:@"Expected '%@' to be a NSNumber but got %@", context, NSStringFromClass([number class])]
                            error:error];
    } else if ([acceptedType isEqualToString:@"integer"] && CFNumberIsFloatType((CFNumberRef)number)) {
        return [self failWithCode:AWSValidationInvalidParameterType
                      description:[NSString stringWithFormat:@"Expected '%@' to be a NSNumber(Integer) but got NSNumber(float)", context]
                            error:error];
    } else if ([acceptedType isEqualToString:@"timestamp"]) {
        //a value with NSNumber type should be a good timestamp.
    }

    return YES;
}

+ (BOOL)validateBinaryWithContext:(NSString *)context  data:(id)data error:(NSError *__autoreleasing *)error {
    //The Binary should be a base64 format
    if ([data isKindOfClass:[NSString class]]) {
        if ([data aws_isBase64Data]) return YES;
    }

    return [self failWithCode:AWSValidationInvalidBase64Data
                  description:[NSString stringWithFormat:@"Expected '%@' to be a Base64String.", context]
                        error:error];
}

@end
