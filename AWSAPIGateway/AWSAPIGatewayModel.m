//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSAPIGatewayModel.h"

@interface AWSAPIGatewayRequest()

@property (nonatomic, strong) NSString *HTTPMethod;
@property (nonatomic, strong) NSString *URLString;
@property (nonatomic, strong) NSDictionary *queryParameters;
@property (nonatomic, strong) NSDictionary *headerParameters;
@property (nonatomic, strong) id HTTPBody;

@end

@implementation AWSAPIGatewayRequest

+ (void)initialize {
    [super initialize];
}


- (instancetype)initWithHTTPMethod:(NSString *)httpMethod
                         URLString:(NSString *)urlString
                   queryParameters:(NSDictionary *)queryParameters
                  headerParameters:(NSDictionary *)headerParameters
                          HTTPBody:(id)body{
    if (self = [super init]) {
        self.HTTPMethod = httpMethod;
        self.URLString = urlString;
        self.queryParameters = queryParameters;
        self.headerParameters = headerParameters;
        self.HTTPBody = body;
    }
    return self;
}

@end

@interface AWSAPIGatewayResponse()

@property (nonatomic, readwrite) NSDictionary *headers;
@property (nonatomic, readwrite) NSData *responseData;
@property (nonatomic, readwrite) NSURLResponse *rawResponse;
@property (nonatomic, readwrite) NSInteger statusCode;

- (instancetype)initWithHeaders:(NSDictionary *)headers
                   responseData:(NSData *)responseData
            NSURLResponseObject:(NSURLResponse *)NSURLResponseObject
                     statusCode:(NSInteger)statusCode;

@end

@implementation AWSAPIGatewayResponse

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"Cannot initialize this object."
                                 userInfo:nil];
    return nil;
}

- (instancetype)initWithHeaders:(NSDictionary *)headers
                   responseData:(NSData *)responseData
            NSURLResponseObject:(NSURLResponse *)NSURLResponseObject
                     statusCode:(NSInteger)statusCode {
    if(self = [super init]) {
        self.headers = headers;
        self.rawResponse = NSURLResponseObject;
        self.responseData = responseData;
        self.statusCode = statusCode;
    }
    return self;
}

@end
