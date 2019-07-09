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

NS_ASSUME_NONNULL_BEGIN

/**
 * A subclass of NSInputStream that wraps an input stream and adds
 * signature of chunk data.
 *
 * This class is created to handle `NSInputStream` as the input type
 * One way of handling streaming is that we allow user to specify an input stream
 * where they can keep writing data. We can then use that input stream to add headers,
 * sign the request and publish the data packet in our outbound http2 stream
 **/
@interface AWSTranscribeStreamingChunkedEncodingInputStream : NSInputStream <NSStreamDelegate>

@property (atomic, assign) int64_t totalLengthOfChunkSignatureSent;

/**
 * Initialize the input stream with date, scope, signing key and signature
 * of request headers.
 **/
- (instancetype)initWithInputStream:(NSInputStream *)stream
                               date:(NSDate *)date
                              scope:(NSString *)scope
                           kSigning:(NSData *)kSigning
                    headerSignature:(NSString *)headerSignature;

/**
 * Computes new content length after data being chunked encoded.
 **/
+ (NSUInteger)computeContentLengthForChunkedData:(NSUInteger)dataLength;

+ (NSInputStream *)getInputStream;

@end

NS_ASSUME_NONNULL_END
