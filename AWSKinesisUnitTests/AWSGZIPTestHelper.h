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

#ifndef AWSGZIPTestHelper_h
#define AWSGZIPTestHelper_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AWSGZIPTestHelper : NSObject

@property (nonatomic, strong) id mockSerializer;
@property (nonatomic, strong) id mockSerializerClass;

@property (nonatomic, strong) __block NSString *requestContentEncoding;
@property (nonatomic, strong) __block NSData *requestHTTPBody;

- (instancetype)initWithOperationName:(NSString* _Nonnull)operationName
                       JSONDefinition:(NSDictionary* _Nonnull)JSONDefinition;

- (void)startMockingUsingSerializerClass:(Class)serializerClass;

- (void)stopMocking;

@end

NS_ASSUME_NONNULL_END

#endif /* AWSGZIPTestHelper_h */
