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

#import <AWSCore/AWSCore.h>
#import "AWSTranscribeStreamingTranscriptResultStream+Helpers.h"
#import "AWSTranscribeStreamingClientDelegate.h"

@implementation AWSTranscribeStreamingTranscriptResultStream (Helpers)

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BadRequestException" : @(AWSTranscribeStreamingErrorBadRequest),
                            @"ConflictException" : @(AWSTranscribeStreamingErrorConflict),
                            @"InternalFailureException" : @(AWSTranscribeStreamingErrorInternalFailure),
                            @"LimitExceededException" : @(AWSTranscribeStreamingErrorLimitExceeded),
                            };
}

+ (nullable AWSTranscribeStreamingTranscriptResultStream *)resultStreamForWSSBody:(NSString *)body
                                                                          headers:(NSDictionary<NSString *, NSString *> *)headers
                                                                            error:(NSError * __autoreleasing *)errorPointer {
    
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:[body dataUsingEncoding:NSUTF8StringEncoding]
                                                               options:NSJSONReadingMutableContainers
                                                                 error:errorPointer];
    
    if (!jsonObject || *errorPointer) {
        return nil;
    }
    
    // Populate error payload
    if ([headers[@":message-type"] isEqualToString:@"exception"]) {
        NSString *errorType = headers[@":exception-type"];
        AWSTranscribeStreamingTranscriptResultStream *resultStream = [AWSTranscribeStreamingTranscriptResultStream resultStreamErrorMemberForJSONObject:jsonObject
                                                                                                                                              errorType:errorType
                                                                                                                                                  error:errorPointer];
        return resultStream;
    } else if ([headers[@":message-type"] isEqualToString:@"event"]) {
        AWSTranscribeStreamingTranscriptEvent *transcriptEvent = [AWSMTLJSONAdapter modelOfClass:[AWSTranscribeStreamingTranscriptEvent class]
                                                                              fromJSONDictionary:jsonObject
                                                                                           error:errorPointer];

        AWSTranscribeStreamingTranscriptResultStream *resultStream = [[AWSTranscribeStreamingTranscriptResultStream alloc] init];
        resultStream.transcriptEvent = transcriptEvent;
        return resultStream;
    } else {
        NSDictionary *userInfo = @{
                                   NSLocalizedDescriptionKey: @"Unable to deserialize event body into an exception or TranscriptEvent",
                                   @"jsonObject": jsonObject
                                   };
        *errorPointer = [NSError errorWithDomain:AWSTranscribeStreamingClientErrorDomain
                                                    code:AWSTranscribeStreamingClientErrorCodeEventSerializationError
                                                userInfo:userInfo];
        
        return nil;
    }
    
    return nil;
}

+ (nullable AWSTranscribeStreamingTranscriptResultStream *)resultStreamErrorMemberForJSONObject:(NSDictionary *)jsonObject
                                                                                      errorType:(NSString *)errorType
                                                                                          error:(NSError * __autoreleasing *)errorPointer {
    
    AWSTranscribeStreamingTranscriptResultStream *resultStream = [[AWSTranscribeStreamingTranscriptResultStream alloc] init];
    
    NSString *message = [jsonObject objectForKey:@"Message"];
    id errorCode = [errorCodeDictionary objectForKey:errorType];
    
    NSDictionary *userInfo = @{
                               NSLocalizedDescriptionKey: message ? message : [NSNull null],
                               NSLocalizedFailureReasonErrorKey: errorType
                               };
    
    NSError *error = [NSError errorWithDomain:AWSTranscribeStreamingErrorDomain
                                         code:[errorCode integerValue]
                                     userInfo:userInfo];
    
    switch ([errorCode integerValue]) {
        case AWSTranscribeStreamingErrorBadRequest:
            resultStream.badRequestException = error;
            break;
        case AWSTranscribeStreamingErrorConflict:
            resultStream.conflictException = error;
            break;
        case AWSTranscribeStreamingErrorInternalFailure:
            resultStream.internalFailureException = error;
            break;
        case AWSTranscribeStreamingErrorLimitExceeded:
            resultStream.limitExceededException = error;
            break;
        default:
            *errorPointer = error;
            return nil;
    }
    
    return resultStream;
}

@end
