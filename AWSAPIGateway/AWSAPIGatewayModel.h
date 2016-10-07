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
#import <AWSCore/AWSCore.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  The request object for invoking an AWS API Gateway API.
 */
@interface AWSAPIGatewayRequest : NSObject

/**
 *  Creates an instance of `AWSAPIGatewayRequest` which is required to invoke an API using the `invoke` method.
 *
 *  @param HTTPMethod       The HTTP method to be invoked(E.g. : GET, PUT, POST, PATCH, UPDATE, DELETE, HEAD)
 *  @param URLString        The path to be invoked(E.g. : /cars)
 *  @param queryParameters  The query string parameters for the invocation request
 *  @param headerParameters The header parameters for the request
 *  @param HTTPBody         The Http body for the request (Could be of type NSString, NSData, NSInputStream)
 *
 *  @return An instance of `AWSAPIGateway`
 */
- (instancetype)initWithHTTPMethod:(NSString *)HTTPMethod
                         URLString:(NSString * _Nullable )URLString
                   queryParameters:(NSDictionary * _Nullable)queryParameters
                  headerParameters:(NSDictionary * _Nullable)headerParameters
                          HTTPBody:(id _Nullable)HTTPBody;

@end

/**
 *  The response object for a successful AWS API Gateway invocation using the `invoke` method.
 */
@interface AWSAPIGatewayResponse : NSObject

/**
 *  The response headers received in NSURLResponse on invocation of an API.
 */
@property (nonatomic, readonly) NSDictionary *headers;

/**
 *  The response data received in NSURLResponse on invocation of an API.
 */
@property (nonatomic, readonly, nullable) NSData *responseData;

/**
 *  The Raw NSURLResponse received on an API invocation.
 */
@property (nonatomic, readonly) NSURLResponse *rawReponse;

/**
 *  The status code received in NSURLResponse on invocation of an API.
 */
@property (nonatomic, readonly) NSInteger statusCode;

@end

NS_ASSUME_NONNULL_END
