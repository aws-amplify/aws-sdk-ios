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

#import "AWSGZIPTestHelper.h"

#import "OCMock.h"
#import "AWSTestUtility.h"
#import "AWSGZIPEncodingJSONRequestSerializer.h"

@implementation AWSGZIPTestHelper

+ (AWSGZIPEncodingJSONRequestSerializer *)makeRealSerializerForOperationName:(NSString *)operationName
                                                              JSONDefinition:(NSDictionary *)JSONDefinition {
    AWSGZIPEncodingJSONRequestSerializer *realSerializer =
        [[AWSGZIPEncodingJSONRequestSerializer alloc] initWithJSONDefinition:JSONDefinition
                                                                  actionName:operationName];
    return realSerializer;
}

- (instancetype)initWithOperationName:(NSString *)operationName
                       JSONDefinition:(NSDictionary *)JSONDefinition {
    if (self = [super init]) {
        AWSGZIPEncodingJSONRequestSerializer *realSerializer =
            [AWSGZIPTestHelper makeRealSerializerForOperationName:operationName
                                                   JSONDefinition:JSONDefinition];

        _mockSerializer = OCMPartialMock(realSerializer);

        OCMStub([_mockSerializer initWithJSONDefinition:[OCMArg any]
                                             actionName:[OCMArg any]])
            .andReturn(_mockSerializer);

        __weak __typeof__(self) weakSelf = self;
        void (^extractContentTypeAndHTTPBodyFromRequest)(NSInvocation *invocation) = ^(NSInvocation *invocation) {
            AWSTask *errorTask = [AWSTask taskWithError:[NSError errorWithDomain:@"OCMockExpectedNetworkingError"
                                                                            code:8848 userInfo:nil]];
            [invocation retainArguments];
            [invocation setReturnValue:&errorTask];

            // Remember that arg0 is `self`, that is, the Request Serializer; and
            // arg1 is _cmd. The first argument to the method is at index 2
            NSURLRequest *request = nil;
            [invocation getArgument:&request atIndex:2];

            weakSelf.requestContentEncoding = [[request valueForHTTPHeaderField:@"Content-Encoding"] copy];
            weakSelf.requestHTTPBody = [request.HTTPBody copy];
        };

        OCMStub([_mockSerializer validateRequest:[OCMArg any]])
            .andDo(extractContentTypeAndHTTPBodyFromRequest);

    }

    return self;
}

- (void)startMockingUsingSerializerClass:(Class)serializerClass {
    self.mockSerializerClass = OCMClassMock(serializerClass);

    OCMStub([self.mockSerializerClass alloc])
        .andReturn(self.mockSerializer);
}

- (void)stopMocking {
    [self.mockSerializerClass stopMocking];
}

@end
