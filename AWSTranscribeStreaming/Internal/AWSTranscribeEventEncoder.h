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
#import "AWSTranscribeStreamingModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AWSTranscribeEventEncoder : NSObject

+(NSData *)getEndFrameData;

/// Encodes a chunk of data into the stream, per
/// https://docs.aws.amazon.com/transcribe/latest/dg/streaming-format.html
+(NSData *)encodeChunk:(NSData *)data
               headers:(NSDictionary<NSString *, NSString *> *)headers;

@end

NS_ASSUME_NONNULL_END
