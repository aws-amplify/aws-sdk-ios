//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
    AWSSageMakerRuntimeErrorInternalDependency,
    AWSSageMakerRuntimeErrorInternalFailure,
    AWSSageMakerRuntimeErrorModel,
    AWSSageMakerRuntimeErrorModelNotReady,
    AWSSageMakerRuntimeErrorServiceUnavailable,
    AWSSageMakerRuntimeErrorValidation,
};

@class AWSSageMakerRuntimeInvokeEndpointAsyncInput;
@class AWSSageMakerRuntimeInvokeEndpointAsyncOutput;
@class AWSSageMakerRuntimeInvokeEndpointInput;
@class AWSSageMakerRuntimeInvokeEndpointOutput;

/**
 
 */
@interface AWSSageMakerRuntimeInvokeEndpointAsyncInput : AWSRequest


/**
 <p>The desired MIME type of the inference in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accept;

/**
 <p>The MIME type of the input data in the request body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>Provides additional information about a request for an inference submitted to a model hosted at an Amazon SageMaker endpoint. The information is an opaque value that is forwarded verbatim. You could use this value, for example, to provide an ID that you can use to track a request or to provide other metadata that a service endpoint was programmed to process. The value must consist of no more than 1024 visible US-ASCII characters as specified in <a href="https://datatracker.ietf.org/doc/html/rfc7230#section-3.2.6">Section 3.3.6. Field Value Components</a> of the Hypertext Transfer Protocol (HTTP/1.1). </p><p>The code in your model is responsible for setting or updating any custom attributes in the response. If your code does not set this value in the response, an empty value is returned. For example, if a custom attribute represents the trace ID, your model can prepend the custom attribute with <code>Trace ID</code>: in your post-processing function. </p><p>This feature is currently supported in the Amazon Web Services SDKs but not in the Amazon SageMaker Python SDK. </p>
 */
@property (nonatomic, strong) NSString * _Nullable customAttributes;

/**
 <p>The name of the endpoint that you specified when you created the endpoint using the <a href="https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateEndpoint.html"><code>CreateEndpoint</code></a> API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

/**
 <p>The identifier for the inference request. Amazon SageMaker will generate an identifier for you if none is specified. </p>
 */
@property (nonatomic, strong) NSString * _Nullable inferenceId;

/**
 <p>The Amazon S3 URI where the inference request payload is stored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputLocation;

/**
 <p>Maximum amount of time in seconds a request can be processed before it is marked as expired. The default is 15 minutes, or 900 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable invocationTimeoutSeconds;

/**
 <p>Maximum age in seconds a request can be in the queue before it is marked as expired. The default is 6 hours, or 21,600 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requestTTLSeconds;

@end

/**
 
 */
@interface AWSSageMakerRuntimeInvokeEndpointAsyncOutput : AWSModel


/**
 <p>The Amazon S3 URI where the inference failure response payload is stored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureLocation;

/**
 <p>Identifier for an inference request. This will be the same as the <code>InferenceId</code> specified in the input. Amazon SageMaker will generate an identifier for you if you do not specify one.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inferenceId;

/**
 <p>The Amazon S3 URI where the inference response payload is stored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputLocation;

@end

/**
 
 */
@interface AWSSageMakerRuntimeInvokeEndpointInput : AWSRequest


/**
 <p>The desired MIME type of the inference in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accept;

/**
 <p>Provides input data, in the format specified in the <code>ContentType</code> request header. Amazon SageMaker passes all of the data in the body to the model. </p><p>For information about the format of the request body, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/cdf-inference.html">Common Data Formats-Inference</a>.</p>
 */
@property (nonatomic, strong) NSData * _Nullable body;

/**
 <p>The MIME type of the input data in the request body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>Provides additional information about a request for an inference submitted to a model hosted at an Amazon SageMaker endpoint. The information is an opaque value that is forwarded verbatim. You could use this value, for example, to provide an ID that you can use to track a request or to provide other metadata that a service endpoint was programmed to process. The value must consist of no more than 1024 visible US-ASCII characters as specified in <a href="https://tools.ietf.org/html/rfc7230#section-3.2.6">Section 3.3.6. Field Value Components</a> of the Hypertext Transfer Protocol (HTTP/1.1). </p><p>The code in your model is responsible for setting or updating any custom attributes in the response. If your code does not set this value in the response, an empty value is returned. For example, if a custom attribute represents the trace ID, your model can prepend the custom attribute with <code>Trace ID:</code> in your post-processing function.</p><p>This feature is currently supported in the Amazon Web Services SDKs but not in the Amazon SageMaker Python SDK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customAttributes;

/**
 <p>An optional JMESPath expression used to override the <code>EnableExplanations</code> parameter of the <code>ClarifyExplainerConfig</code> API. See the <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/clarify-online-explainability-create-endpoint.html#clarify-online-explainability-create-endpoint-enable">EnableExplanations</a> section in the developer guide for more information. </p>
 */
@property (nonatomic, strong) NSString * _Nullable enableExplanations;

/**
 <p>The name of the endpoint that you specified when you created the endpoint using the <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/API_CreateEndpoint.html">CreateEndpoint</a> API. </p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

/**
 <p>If you provide a value, it is added to the captured data when you enable data capture on the endpoint. For information about data capture, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/model-monitor-data-capture.html">Capture Data</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inferenceId;

/**
 <p>If the endpoint hosts multiple containers and is configured to use direct invocation, this parameter specifies the host name of the container to invoke.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetContainerHostname;

/**
 <p>The model to request for inference when invoking a multi-model endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetModel;

/**
 <p>Specify the production variant to send the inference request to when invoking an endpoint that is running two or more variants. Note that this parameter overrides the default behavior for the endpoint, which is to distribute the invocation traffic based on the variant weights.</p><p>For information about how to use variant targeting to perform a/b testing, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/model-ab-testing.html">Test models in production</a></p>
 */
@property (nonatomic, strong) NSString * _Nullable targetVariant;

@end

/**
 
 */
@interface AWSSageMakerRuntimeInvokeEndpointOutput : AWSModel


/**
 <p>Includes the inference provided by the model. </p><p>For information about the format of the response body, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/cdf-inference.html">Common Data Formats-Inference</a>.</p><p>If the explainer is activated, the body includes the explanations provided by the model. For more information, see the <b>Response section</b> under <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/clarify-online-explainability-invoke-endpoint.html#clarify-online-explainability-response">Invoke the Endpoint</a> in the Developer Guide.</p>
 */
@property (nonatomic, strong) NSData * _Nullable body;

/**
 <p>The MIME type of the inference returned in the response body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>Provides additional information in the response about the inference returned by a model hosted at an Amazon SageMaker endpoint. The information is an opaque value that is forwarded verbatim. You could use this value, for example, to return an ID received in the <code>CustomAttributes</code> header of a request or other metadata that a service endpoint was programmed to produce. The value must consist of no more than 1024 visible US-ASCII characters as specified in <a href="https://tools.ietf.org/html/rfc7230#section-3.2.6">Section 3.3.6. Field Value Components</a> of the Hypertext Transfer Protocol (HTTP/1.1). If the customer wants the custom attribute returned, the model must set the custom attribute to be included on the way back. </p><p>The code in your model is responsible for setting or updating any custom attributes in the response. If your code does not set this value in the response, an empty value is returned. For example, if a custom attribute represents the trace ID, your model can prepend the custom attribute with <code>Trace ID:</code> in your post-processing function.</p><p>This feature is currently supported in the Amazon Web Services SDKs but not in the Amazon SageMaker Python SDK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customAttributes;

/**
 <p>Identifies the production variant that was invoked.</p>
 */
@property (nonatomic, strong) NSString * _Nullable invokedProductionVariant;

@end

NS_ASSUME_NONNULL_END
