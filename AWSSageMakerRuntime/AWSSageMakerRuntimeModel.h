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
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSSageMakerRuntimeErrorDomain;

typedef NS_ENUM(NSInteger, AWSSageMakerRuntimeErrorType) {
    AWSSageMakerRuntimeErrorUnknown,
    AWSSageMakerRuntimeErrorInternalFailure,
    AWSSageMakerRuntimeErrorModel,
    AWSSageMakerRuntimeErrorServiceUnavailable,
    AWSSageMakerRuntimeErrorValidation,
};

@class AWSSageMakerRuntimeInvokeEndpointInput;
@class AWSSageMakerRuntimeInvokeEndpointOutput;

/**
 
 */
@interface AWSSageMakerRuntimeInvokeEndpointInput : AWSRequest


/**
 <p>The desired MIME type of the inference in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accept;

/**
 <p>Provides input data, in the format specified in the <code>ContentType</code> request header. Amazon SageMaker passes all of the data in the body to the model. </p><p>For information about the format of the request body, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/cdf-inference.html">Common Data Formats—Inference</a>.</p>
 */
@property (nonatomic, strong) NSData * _Nullable body;

/**
 <p>The MIME type of the input data in the request body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>Provides additional information about a request for an inference submitted to a model hosted at an Amazon SageMaker endpoint. The information is an opaque value that is forwarded verbatim. You could use this value, for example, to provide an ID that you can use to track a request or to provide other metadata that a service endpoint was programmed to process. The value must consist of no more than 1024 visible US-ASCII characters as specified in <a href="https://tools.ietf.org/html/rfc7230#section-3.2.6">Section 3.3.6. Field Value Components</a> of the Hypertext Transfer Protocol (HTTP/1.1). This feature is currently supported in the AWS SDKs but not in the Amazon SageMaker Python SDK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customAttributes;

/**
 <p>The name of the endpoint that you specified when you created the endpoint using the <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/API_CreateEndpoint.html">CreateEndpoint</a> API. </p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

/**
 <p>Specifies the model to be requested for an inference when invoking a multi-model endpoint. </p>
 */
@property (nonatomic, strong) NSString * _Nullable targetModel;

@end

/**
 
 */
@interface AWSSageMakerRuntimeInvokeEndpointOutput : AWSModel


/**
 <p>Includes the inference provided by the model.</p><p>For information about the format of the response body, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/cdf-inference.html">Common Data Formats—Inference</a>.</p>
 */
@property (nonatomic, strong) NSData * _Nullable body;

/**
 <p>The MIME type of the inference returned in the response body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>Provides additional information in the response about the inference returned by a model hosted at an Amazon SageMaker endpoint. The information is an opaque value that is forwarded verbatim. You could use this value, for example, to return an ID received in the <code>CustomAttributes</code> header of a request or other metadata that a service endpoint was programmed to produce. The value must consist of no more than 1024 visible US-ASCII characters as specified in <a href="https://tools.ietf.org/html/rfc7230#section-3.2.6">Section 3.3.6. Field Value Components</a> of the Hypertext Transfer Protocol (HTTP/1.1). If the customer wants the custom attribute returned, the model must set the custom attribute to be included on the way back. </p><p>This feature is currently supported in the AWS SDKs but not in the Amazon SageMaker Python SDK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customAttributes;

/**
 <p>Identifies the production variant that was invoked.</p>
 */
@property (nonatomic, strong) NSString * _Nullable invokedProductionVariant;

@end

NS_ASSUME_NONNULL_END
