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

FOUNDATION_EXPORT NSString *const AWSapigatewayErrorDomain;

typedef NS_ENUM(NSInteger, AWSapigatewayErrorType) {
    AWSapigatewayErrorUnknown,
    AWSapigatewayErrorAccessDenied,
    AWSapigatewayErrorBadRequest,
    AWSapigatewayErrorConflict,
    AWSapigatewayErrorNotFound,
    AWSapigatewayErrorTooManyRequests,
};

typedef NS_ENUM(NSInteger, AWSapigatewayAuthorizationType) {
    AWSapigatewayAuthorizationTypeUnknown,
    AWSapigatewayAuthorizationTypeNone,
    AWSapigatewayAuthorizationTypeAwsIam,
    AWSapigatewayAuthorizationTypeCustom,
    AWSapigatewayAuthorizationTypeJwt,
};

typedef NS_ENUM(NSInteger, AWSapigatewayAuthorizerType) {
    AWSapigatewayAuthorizerTypeUnknown,
    AWSapigatewayAuthorizerTypeRequest,
    AWSapigatewayAuthorizerTypeJwt,
};

typedef NS_ENUM(NSInteger, AWSapigatewayConnectionType) {
    AWSapigatewayConnectionTypeUnknown,
    AWSapigatewayConnectionTypeInternet,
    AWSapigatewayConnectionTypeVpcLink,
};

typedef NS_ENUM(NSInteger, AWSapigatewayContentHandlingStrategy) {
    AWSapigatewayContentHandlingStrategyUnknown,
    AWSapigatewayContentHandlingStrategyConvertToBinary,
    AWSapigatewayContentHandlingStrategyConvertToText,
};

typedef NS_ENUM(NSInteger, AWSapigatewayDeploymentStatus) {
    AWSapigatewayDeploymentStatusUnknown,
    AWSapigatewayDeploymentStatusPending,
    AWSapigatewayDeploymentStatusFailed,
    AWSapigatewayDeploymentStatusDeployed,
};

typedef NS_ENUM(NSInteger, AWSapigatewayDomainNameStatus) {
    AWSapigatewayDomainNameStatusUnknown,
    AWSapigatewayDomainNameStatusAvailable,
    AWSapigatewayDomainNameStatusUpdating,
};

typedef NS_ENUM(NSInteger, AWSapigatewayEndpointType) {
    AWSapigatewayEndpointTypeUnknown,
    AWSapigatewayEndpointTypeRegional,
    AWSapigatewayEndpointTypeEdge,
};

typedef NS_ENUM(NSInteger, AWSapigatewayIntegrationType) {
    AWSapigatewayIntegrationTypeUnknown,
    AWSapigatewayIntegrationTypeAws,
    AWSapigatewayIntegrationTypeHttp,
    AWSapigatewayIntegrationTypeMock,
    AWSapigatewayIntegrationTypeHttpProxy,
    AWSapigatewayIntegrationTypeAwsProxy,
};

typedef NS_ENUM(NSInteger, AWSapigatewayLoggingLevel) {
    AWSapigatewayLoggingLevelUnknown,
    AWSapigatewayLoggingLevelError,
    AWSapigatewayLoggingLevelInfo,
    AWSapigatewayLoggingLevelOff,
};

typedef NS_ENUM(NSInteger, AWSapigatewayPassthroughBehavior) {
    AWSapigatewayPassthroughBehaviorUnknown,
    AWSapigatewayPassthroughBehaviorWhenNoMatch,
    AWSapigatewayPassthroughBehaviorNever,
    AWSapigatewayPassthroughBehaviorWhenNoTemplates,
};

typedef NS_ENUM(NSInteger, AWSapigatewayProtocolType) {
    AWSapigatewayProtocolTypeUnknown,
    AWSapigatewayProtocolTypeWebsocket,
    AWSapigatewayProtocolTypeHttp,
};

typedef NS_ENUM(NSInteger, AWSapigatewaySecurityPolicy) {
    AWSapigatewaySecurityPolicyUnknown,
    AWSapigatewaySecurityPolicyTls10,
    AWSapigatewaySecurityPolicyTls12,
};

typedef NS_ENUM(NSInteger, AWSapigatewayVpcLinkStatus) {
    AWSapigatewayVpcLinkStatusUnknown,
    AWSapigatewayVpcLinkStatusPending,
    AWSapigatewayVpcLinkStatusAvailable,
    AWSapigatewayVpcLinkStatusDeleting,
    AWSapigatewayVpcLinkStatusFailed,
    AWSapigatewayVpcLinkStatusInactive,
};

typedef NS_ENUM(NSInteger, AWSapigatewayVpcLinkVersion) {
    AWSapigatewayVpcLinkVersionUnknown,
    AWSapigatewayVpcLinkVersionV2,
};

@class AWSapigatewayAccessLogSettings;
@class AWSapigatewayApi;
@class AWSapigatewayApiMapping;
@class AWSapigatewayApiMappings;
@class AWSapigatewayApis;
@class AWSapigatewayAuthorizer;
@class AWSapigatewayAuthorizers;
@class AWSapigatewayCors;
@class AWSapigatewayCreateApiInput;
@class AWSapigatewayCreateApiMappingInput;
@class AWSapigatewayCreateApiMappingRequest;
@class AWSapigatewayCreateApiMappingResponse;
@class AWSapigatewayCreateApiRequest;
@class AWSapigatewayCreateApiResponse;
@class AWSapigatewayCreateAuthorizerInput;
@class AWSapigatewayCreateAuthorizerRequest;
@class AWSapigatewayCreateAuthorizerResponse;
@class AWSapigatewayCreateDeploymentInput;
@class AWSapigatewayCreateDeploymentRequest;
@class AWSapigatewayCreateDeploymentResponse;
@class AWSapigatewayCreateDomainNameInput;
@class AWSapigatewayCreateDomainNameRequest;
@class AWSapigatewayCreateDomainNameResponse;
@class AWSapigatewayCreateIntegrationInput;
@class AWSapigatewayCreateIntegrationRequest;
@class AWSapigatewayCreateIntegrationResult;
@class AWSapigatewayCreateIntegrationResponseInput;
@class AWSapigatewayCreateIntegrationResponseRequest;
@class AWSapigatewayCreateIntegrationResponseResponse;
@class AWSapigatewayCreateModelInput;
@class AWSapigatewayCreateModelRequest;
@class AWSapigatewayCreateModelResponse;
@class AWSapigatewayCreateRouteInput;
@class AWSapigatewayCreateRouteRequest;
@class AWSapigatewayCreateRouteResult;
@class AWSapigatewayCreateRouteResponseInput;
@class AWSapigatewayCreateRouteResponseRequest;
@class AWSapigatewayCreateRouteResponseResponse;
@class AWSapigatewayCreateStageInput;
@class AWSapigatewayCreateStageRequest;
@class AWSapigatewayCreateStageResponse;
@class AWSapigatewayCreateVpcLinkInput;
@class AWSapigatewayCreateVpcLinkRequest;
@class AWSapigatewayCreateVpcLinkResponse;
@class AWSapigatewayDeleteAccessLogSettingsRequest;
@class AWSapigatewayDeleteApiMappingRequest;
@class AWSapigatewayDeleteApiRequest;
@class AWSapigatewayDeleteAuthorizerRequest;
@class AWSapigatewayDeleteCorsConfigurationRequest;
@class AWSapigatewayDeleteDeploymentRequest;
@class AWSapigatewayDeleteDomainNameRequest;
@class AWSapigatewayDeleteIntegrationRequest;
@class AWSapigatewayDeleteIntegrationResponseRequest;
@class AWSapigatewayDeleteModelRequest;
@class AWSapigatewayDeleteRouteRequest;
@class AWSapigatewayDeleteRouteRequestParameterRequest;
@class AWSapigatewayDeleteRouteResponseRequest;
@class AWSapigatewayDeleteRouteSettingsRequest;
@class AWSapigatewayDeleteStageRequest;
@class AWSapigatewayDeleteVpcLinkRequest;
@class AWSapigatewayDeleteVpcLinkResponse;
@class AWSapigatewayDeployment;
@class AWSapigatewayDeployments;
@class AWSapigatewayDomainName;
@class AWSapigatewayDomainNameConfiguration;
@class AWSapigatewayDomainNames;
@class AWSapigatewayExportApiRequest;
@class AWSapigatewayExportApiResponse;
@class AWSapigatewayGetApiMappingRequest;
@class AWSapigatewayGetApiMappingResponse;
@class AWSapigatewayGetApiMappingsRequest;
@class AWSapigatewayGetApiMappingsResponse;
@class AWSapigatewayGetApiRequest;
@class AWSapigatewayGetApiResponse;
@class AWSapigatewayGetApisRequest;
@class AWSapigatewayGetApisResponse;
@class AWSapigatewayGetAuthorizerRequest;
@class AWSapigatewayGetAuthorizerResponse;
@class AWSapigatewayGetAuthorizersRequest;
@class AWSapigatewayGetAuthorizersResponse;
@class AWSapigatewayGetDeploymentRequest;
@class AWSapigatewayGetDeploymentResponse;
@class AWSapigatewayGetDeploymentsRequest;
@class AWSapigatewayGetDeploymentsResponse;
@class AWSapigatewayGetDomainNameRequest;
@class AWSapigatewayGetDomainNameResponse;
@class AWSapigatewayGetDomainNamesRequest;
@class AWSapigatewayGetDomainNamesResponse;
@class AWSapigatewayGetIntegrationRequest;
@class AWSapigatewayGetIntegrationResult;
@class AWSapigatewayGetIntegrationResponseRequest;
@class AWSapigatewayGetIntegrationResponseResponse;
@class AWSapigatewayGetIntegrationResponsesRequest;
@class AWSapigatewayGetIntegrationResponsesResponse;
@class AWSapigatewayGetIntegrationsRequest;
@class AWSapigatewayGetIntegrationsResponse;
@class AWSapigatewayGetModelRequest;
@class AWSapigatewayGetModelResponse;
@class AWSapigatewayGetModelTemplateRequest;
@class AWSapigatewayGetModelTemplateResponse;
@class AWSapigatewayGetModelsRequest;
@class AWSapigatewayGetModelsResponse;
@class AWSapigatewayGetRouteRequest;
@class AWSapigatewayGetRouteResult;
@class AWSapigatewayGetRouteResponseRequest;
@class AWSapigatewayGetRouteResponseResponse;
@class AWSapigatewayGetRouteResponsesRequest;
@class AWSapigatewayGetRouteResponsesResponse;
@class AWSapigatewayGetRoutesRequest;
@class AWSapigatewayGetRoutesResponse;
@class AWSapigatewayGetStageRequest;
@class AWSapigatewayGetStageResponse;
@class AWSapigatewayGetStagesRequest;
@class AWSapigatewayGetStagesResponse;
@class AWSapigatewayGetTagsRequest;
@class AWSapigatewayGetTagsResponse;
@class AWSapigatewayGetVpcLinkRequest;
@class AWSapigatewayGetVpcLinkResponse;
@class AWSapigatewayGetVpcLinksRequest;
@class AWSapigatewayGetVpcLinksResponse;
@class AWSapigatewayImportApiInput;
@class AWSapigatewayImportApiRequest;
@class AWSapigatewayImportApiResponse;
@class AWSapigatewayIntegration;
@class AWSapigatewayIntegrationResponse;
@class AWSapigatewayIntegrationResponses;
@class AWSapigatewayIntegrations;
@class AWSapigatewayJWTConfiguration;
@class AWSapigatewayLimitExceededException;
@class AWSapigatewayModel;
@class AWSapigatewayModels;
@class AWSapigatewayParameterConstraints;
@class AWSapigatewayReimportApiInput;
@class AWSapigatewayReimportApiRequest;
@class AWSapigatewayReimportApiResponse;
@class AWSapigatewayRoute;
@class AWSapigatewayRouteResponse;
@class AWSapigatewayRouteResponses;
@class AWSapigatewayRouteSettings;
@class AWSapigatewayRoutes;
@class AWSapigatewayStage;
@class AWSapigatewayStages;
@class AWSapigatewayTagResourceInput;
@class AWSapigatewayTagResourceRequest;
@class AWSapigatewayTagResourceResponse;
@class AWSapigatewayTemplate;
@class AWSapigatewayTlsConfig;
@class AWSapigatewayTlsConfigInput;
@class AWSapigatewayUntagResourceRequest;
@class AWSapigatewayUpdateApiInput;
@class AWSapigatewayUpdateApiMappingInput;
@class AWSapigatewayUpdateApiMappingRequest;
@class AWSapigatewayUpdateApiMappingResponse;
@class AWSapigatewayUpdateApiRequest;
@class AWSapigatewayUpdateApiResponse;
@class AWSapigatewayUpdateAuthorizerInput;
@class AWSapigatewayUpdateAuthorizerRequest;
@class AWSapigatewayUpdateAuthorizerResponse;
@class AWSapigatewayUpdateDeploymentInput;
@class AWSapigatewayUpdateDeploymentRequest;
@class AWSapigatewayUpdateDeploymentResponse;
@class AWSapigatewayUpdateDomainNameInput;
@class AWSapigatewayUpdateDomainNameRequest;
@class AWSapigatewayUpdateDomainNameResponse;
@class AWSapigatewayUpdateIntegrationInput;
@class AWSapigatewayUpdateIntegrationRequest;
@class AWSapigatewayUpdateIntegrationResult;
@class AWSapigatewayUpdateIntegrationResponseInput;
@class AWSapigatewayUpdateIntegrationResponseRequest;
@class AWSapigatewayUpdateIntegrationResponseResponse;
@class AWSapigatewayUpdateModelInput;
@class AWSapigatewayUpdateModelRequest;
@class AWSapigatewayUpdateModelResponse;
@class AWSapigatewayUpdateRouteInput;
@class AWSapigatewayUpdateRouteRequest;
@class AWSapigatewayUpdateRouteResult;
@class AWSapigatewayUpdateRouteResponseInput;
@class AWSapigatewayUpdateRouteResponseRequest;
@class AWSapigatewayUpdateRouteResponseResponse;
@class AWSapigatewayUpdateStageInput;
@class AWSapigatewayUpdateStageRequest;
@class AWSapigatewayUpdateStageResponse;
@class AWSapigatewayUpdateVpcLinkInput;
@class AWSapigatewayUpdateVpcLinkRequest;
@class AWSapigatewayUpdateVpcLinkResponse;
@class AWSapigatewayVpcLink;
@class AWSapigatewayVpcLinks;

/**
 <p>Settings for logging access in a stage.</p>
 */
@interface AWSapigatewayAccessLogSettings : AWSModel


/**
 <p>The ARN of the CloudWatch Logs log group to receive access logs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationArn;

/**
 <p>A single line format of the access logs of data, as specified by selected $context variables. The format must include at least $context.requestId.</p>
 */
@property (nonatomic, strong) NSString * _Nullable format;

@end

/**
 <p>Represents an API.</p>
 Required parameters: [RouteSelectionExpression, Name, ProtocolType]
 */
@interface AWSapigatewayApi : AWSModel


/**
 <p>The URI of the API, of the form {api-id}.execute-api.{region}.amazonaws.com. The stage name is typically appended to this URI to form a complete path to a deployed API stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiEndpoint;

/**
 <p>The API ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>An API key selection expression. Supported only for WebSocket APIs. See <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API Key Selection Expressions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiKeySelectionExpression;

/**
 <p>A CORS configuration. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) AWSapigatewayCors * _Nullable corsConfiguration;

/**
 <p>The timestamp when the API was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The description of the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Avoid validating models when creating a deployment. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableSchemaValidation;

/**
 <p>The validation information during API import. This may include particular properties of your OpenAPI definition which are ignored during import. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable importInfo;

/**
 <p>The name of the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The API protocol.</p>
 */
@property (nonatomic, assign) AWSapigatewayProtocolType protocolType;

/**
 <p>The route selection expression for the API. For HTTP APIs, the routeSelectionExpression must be ${request.method} ${request.path}. If not provided, this will be the default for HTTP APIs. This property is required for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeSelectionExpression;

/**
 <p>A collection of tags associated with the API.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>A version identifier for the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

/**
 <p>The warning messages reported when failonwarnings is turned on during API import.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable warnings;

@end

/**
 <p>Represents an API mapping.</p>
 Required parameters: [Stage, ApiId]
 */
@interface AWSapigatewayApiMapping : AWSModel


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The API mapping identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiMappingId;

/**
 <p>The API mapping key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiMappingKey;

/**
 <p>The API stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stage;

@end

/**
 <p>Represents a collection of ApiMappings resources.</p>
 */
@interface AWSapigatewayApiMappings : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayApiMapping *> * _Nullable items;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Represents a collection of APIs.</p>
 */
@interface AWSapigatewayApis : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayApi *> * _Nullable items;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Represents an authorizer.</p>
 Required parameters: [Name]
 */
@interface AWSapigatewayAuthorizer : AWSModel


/**
 <p>Specifies the required credentials as an IAM role for API Gateway to invoke the authorizer. To specify an IAM role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To use resource-based permissions on the Lambda function, specify null. Supported only for REQUEST authorizers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerCredentialsArn;

/**
 <p>The authorizer identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerId;

/**
 <p>Authorizer caching is not currently supported. Don't specify this value for authorizers.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable authorizerResultTtlInSeconds;

/**
 <p>The authorizer type. For WebSocket APIs, specify REQUEST for a Lambda function using incoming request parameters. For HTTP APIs, specify JWT to use JSON Web Tokens.</p>
 */
@property (nonatomic, assign) AWSapigatewayAuthorizerType authorizerType;

/**
 <p>The authorizer's Uniform Resource Identifier (URI). ForREQUEST authorizers, this must be a well-formed Lambda function URI, for example, arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:<replaceable>{account_id}</replaceable>:function:<replaceable>{lambda_function_name}</replaceable>/invocations. In general, the URI has this form: arn:aws:apigateway:<replaceable>{region}</replaceable>:lambda:path/<replaceable>{service_api}</replaceable>, where <replaceable></replaceable>{region} is the same as the region hosting the Lambda function, path indicates that the remaining substring in the URI should be treated as the path to the resource, including the initial /. For Lambda functions, this is usually of the form /2015-03-31/functions/[FunctionARN]/invocations. Supported only for REQUEST authorizers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerUri;

/**
 <p>The identity source for which authorization is requested.</p><p>For a REQUEST authorizer, this is optional. The value is a set of one or more mapping expressions of the specified request parameters. Currently, the identity source can be headers, query string parameters, stage variables, and context parameters. For example, if an Auth header and a Name query string parameter are defined as identity sources, this value is route.request.header.Auth, route.request.querystring.Name. These parameters will be used to perform runtime validation for Lambda-based authorizers by verifying all of the identity-related request parameters are present in the request, not null, and non-empty. Only when this is true does the authorizer invoke the authorizer Lambda function. Otherwise, it returns a 401 Unauthorized response without calling the Lambda function.</p><p>For JWT, a single entry that specifies where to extract the JSON Web Token (JWT) from inbound requests. Currently only header-based and query parameter-based selections are supported, for example "$request.header.Authorization".</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable identitySource;

/**
 <p>The validation expression does not apply to the REQUEST authorizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityValidationExpression;

/**
 <p>Represents the configuration of a JWT authorizer. Required for the JWT authorizer type. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) AWSapigatewayJWTConfiguration * _Nullable jwtConfiguration;

/**
 <p>The name of the authorizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Represents a collection of authorizers.</p>
 */
@interface AWSapigatewayAuthorizers : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayAuthorizer *> * _Nullable items;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Represents a CORS configuration. Supported only for HTTP APIs. See <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-cors.html">Configuring CORS</a> for more information.</p>
 */
@interface AWSapigatewayCors : AWSModel


/**
 <p>Specifies whether credentials are included in the CORS request. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowCredentials;

/**
 <p>Represents a collection of allowed headers. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowHeaders;

/**
 <p>Represents a collection of allowed HTTP methods. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowMethods;

/**
 <p>Represents a collection of allowed origins. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowOrigins;

/**
 <p>Represents a collection of exposed headers. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable exposeHeaders;

/**
 <p>The number of seconds that the browser should cache preflight request results. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxAge;

@end

/**
 <p>Represents the input parameters for a CreateApi request.</p>
 Required parameters: [ProtocolType, Name]
 */
@interface AWSapigatewayCreateApiInput : AWSModel


/**
 <p>An API key selection expression. Supported only for WebSocket APIs. See <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API Key Selection Expressions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiKeySelectionExpression;

/**
 <p>A CORS configuration. Supported only for HTTP APIs. See <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-cors.html">Configuring CORS</a> for more information.</p>
 */
@property (nonatomic, strong) AWSapigatewayCors * _Nullable corsConfiguration;

/**
 <p>This property is part of quick create. It specifies the credentials required for the integration, if any. For a Lambda integration, three options are available. To specify an IAM Role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To require that the caller's identity be passed through from the request, specify arn:aws:iam::*:user/*. To use resource-based permissions on supported AWS services, specify null. Currently, this property is not used for HTTP integrations. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable credentialsArn;

/**
 <p>The description of the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Avoid validating models when creating a deployment. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableSchemaValidation;

/**
 <p>The name of the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The API protocol.</p>
 */
@property (nonatomic, assign) AWSapigatewayProtocolType protocolType;

/**
 <p>This property is part of quick create. If you don't specify a routeKey, a default route of $default is created. The $default route acts as a catch-all for any request made to your API, for a particular stage. The $default route key can't be modified. You can add routes after creating the API, and you can update the route keys of additional routes. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeKey;

/**
 <p>The route selection expression for the API. For HTTP APIs, the routeSelectionExpression must be ${request.method} ${request.path}. If not provided, this will be the default for HTTP APIs. This property is required for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeSelectionExpression;

/**
 <p>The collection of tags. Each tag element is associated with a given resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>This property is part of quick create. Quick create produces an API with an integration, a default catch-all route, and a default stage which is configured to automatically deploy changes. For HTTP integrations, specify a fully qualified URL. For Lambda integrations, specify a function ARN. The type of the integration will be HTTP_PROXY or AWS_PROXY, respectively. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

/**
 <p>A version identifier for the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>Represents the input parameters for a CreateApiMapping request.</p>
 Required parameters: [Stage, ApiId]
 */
@interface AWSapigatewayCreateApiMappingInput : AWSModel


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 The API mapping key.
 */
@property (nonatomic, strong) NSString * _Nullable apiMappingKey;

/**
 <p>The API stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stage;

@end

/**
 <p>Creates a new ApiMapping resource to represent an API mapping.</p>
 Required parameters: [DomainName, Stage, ApiId]
 */
@interface AWSapigatewayCreateApiMappingRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 The API mapping key.
 */
@property (nonatomic, strong) NSString * _Nullable apiMappingKey;

/**
 <p>The domain name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The API stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stage;

@end

/**
 
 */
@interface AWSapigatewayCreateApiMappingResponse : AWSModel


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The API mapping identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiMappingId;

/**
 <p>The API mapping key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiMappingKey;

/**
 <p>The API stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stage;

@end

/**
 <p>Creates a new Api resource to represent an API.</p>
 Required parameters: [ProtocolType, Name]
 */
@interface AWSapigatewayCreateApiRequest : AWSRequest


/**
 <p>An API key selection expression. Supported only for WebSocket APIs. See <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API Key Selection Expressions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiKeySelectionExpression;

/**
 <p>A CORS configuration. Supported only for HTTP APIs. See <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-cors.html">Configuring CORS</a> for more information.</p>
 */
@property (nonatomic, strong) AWSapigatewayCors * _Nullable corsConfiguration;

/**
 <p>This property is part of quick create. It specifies the credentials required for the integration, if any. For a Lambda integration, three options are available. To specify an IAM Role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To require that the caller's identity be passed through from the request, specify arn:aws:iam::*:user/*. To use resource-based permissions on supported AWS services, specify null. Currently, this property is not used for HTTP integrations. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable credentialsArn;

/**
 <p>The description of the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Avoid validating models when creating a deployment. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableSchemaValidation;

/**
 <p>The name of the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The API protocol.</p>
 */
@property (nonatomic, assign) AWSapigatewayProtocolType protocolType;

/**
 <p>This property is part of quick create. If you don't specify a routeKey, a default route of $default is created. The $default route acts as a catch-all for any request made to your API, for a particular stage. The $default route key can't be modified. You can add routes after creating the API, and you can update the route keys of additional routes. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeKey;

/**
 <p>The route selection expression for the API. For HTTP APIs, the routeSelectionExpression must be ${request.method} ${request.path}. If not provided, this will be the default for HTTP APIs. This property is required for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeSelectionExpression;

/**
 <p>The collection of tags. Each tag element is associated with a given resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>This property is part of quick create. Quick create produces an API with an integration, a default catch-all route, and a default stage which is configured to automatically deploy changes. For HTTP integrations, specify a fully qualified URL. For Lambda integrations, specify a function ARN. The type of the integration will be HTTP_PROXY or AWS_PROXY, respectively. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

/**
 <p>A version identifier for the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSapigatewayCreateApiResponse : AWSModel


/**
 <p>The URI of the API, of the form {api-id}.execute-api.{region}.amazonaws.com. The stage name is typically appended to this URI to form a complete path to a deployed API stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiEndpoint;

/**
 <p>The API ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>An API key selection expression. Supported only for WebSocket APIs. See <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API Key Selection Expressions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiKeySelectionExpression;

/**
 <p>A CORS configuration. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) AWSapigatewayCors * _Nullable corsConfiguration;

/**
 <p>The timestamp when the API was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The description of the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Avoid validating models when creating a deployment. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableSchemaValidation;

/**
 <p>The validation information during API import. This may include particular properties of your OpenAPI definition which are ignored during import. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable importInfo;

/**
 <p>The name of the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The API protocol.</p>
 */
@property (nonatomic, assign) AWSapigatewayProtocolType protocolType;

/**
 <p>The route selection expression for the API. For HTTP APIs, the routeSelectionExpression must be ${request.method} ${request.path}. If not provided, this will be the default for HTTP APIs. This property is required for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeSelectionExpression;

/**
 <p>A collection of tags associated with the API.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>A version identifier for the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

/**
 <p>The warning messages reported when failonwarnings is turned on during API import.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable warnings;

@end

/**
 <p>Represents the input parameters for a CreateAuthorizer request.</p>
 Required parameters: [AuthorizerType, IdentitySource, Name]
 */
@interface AWSapigatewayCreateAuthorizerInput : AWSModel


/**
 <p>Specifies the required credentials as an IAM role for API Gateway to invoke the authorizer. To specify an IAM role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To use resource-based permissions on the Lambda function, specify null. Supported only for REQUEST authorizers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerCredentialsArn;

/**
 <p>Authorizer caching is not currently supported. Don't specify this value for authorizers.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable authorizerResultTtlInSeconds;

/**
 <p>The authorizer type. For WebSocket APIs, specify REQUEST for a Lambda function using incoming request parameters. For HTTP APIs, specify JWT to use JSON Web Tokens.</p>
 */
@property (nonatomic, assign) AWSapigatewayAuthorizerType authorizerType;

/**
 <p>The authorizer's Uniform Resource Identifier (URI). For REQUEST authorizers, this must be a well-formed Lambda function URI, for example, arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:<replaceable>{account_id}</replaceable>:function:<replaceable>{lambda_function_name}</replaceable>/invocations. In general, the URI has this form: arn:aws:apigateway:<replaceable>{region}</replaceable>:lambda:path/<replaceable>{service_api}</replaceable>, where <replaceable></replaceable>{region} is the same as the region hosting the Lambda function, path indicates that the remaining substring in the URI should be treated as the path to the resource, including the initial /. For Lambda functions, this is usually of the form /2015-03-31/functions/[FunctionARN]/invocations. Supported only for REQUEST authorizers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerUri;

/**
 <p>The identity source for which authorization is requested.</p><p>For a REQUEST authorizer, this is optional. The value is a set of one or more mapping expressions of the specified request parameters. Currently, the identity source can be headers, query string parameters, stage variables, and context parameters. For example, if an Auth header and a Name query string parameter are defined as identity sources, this value is route.request.header.Auth, route.request.querystring.Name. These parameters will be used to perform runtime validation for Lambda-based authorizers by verifying all of the identity-related request parameters are present in the request, not null, and non-empty. Only when this is true does the authorizer invoke the authorizer Lambda function. Otherwise, it returns a 401 Unauthorized response without calling the Lambda function.</p><p>For JWT, a single entry that specifies where to extract the JSON Web Token (JWT )from inbound requests. Currently only header-based and query parameter-based selections are supported, for example "$request.header.Authorization".</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable identitySource;

/**
 <p>This parameter is not used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityValidationExpression;

/**
 <p>Represents the configuration of a JWT authorizer. Required for the JWT authorizer type. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) AWSapigatewayJWTConfiguration * _Nullable jwtConfiguration;

/**
 <p>The name of the authorizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Creates a new Authorizer resource to represent an authorizer.</p>
 Required parameters: [ApiId, AuthorizerType, IdentitySource, Name]
 */
@interface AWSapigatewayCreateAuthorizerRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>Specifies the required credentials as an IAM role for API Gateway to invoke the authorizer. To specify an IAM role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To use resource-based permissions on the Lambda function, specify null. Supported only for REQUEST authorizers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerCredentialsArn;

/**
 <p>Authorizer caching is not currently supported. Don't specify this value for authorizers.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable authorizerResultTtlInSeconds;

/**
 <p>The authorizer type. For WebSocket APIs, specify REQUEST for a Lambda function using incoming request parameters. For HTTP APIs, specify JWT to use JSON Web Tokens.</p>
 */
@property (nonatomic, assign) AWSapigatewayAuthorizerType authorizerType;

/**
 <p>The authorizer's Uniform Resource Identifier (URI). For REQUEST authorizers, this must be a well-formed Lambda function URI, for example, arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:<replaceable>{account_id}</replaceable>:function:<replaceable>{lambda_function_name}</replaceable>/invocations. In general, the URI has this form: arn:aws:apigateway:<replaceable>{region}</replaceable>:lambda:path/<replaceable>{service_api}</replaceable>, where <replaceable></replaceable>{region} is the same as the region hosting the Lambda function, path indicates that the remaining substring in the URI should be treated as the path to the resource, including the initial /. For Lambda functions, this is usually of the form /2015-03-31/functions/[FunctionARN]/invocations. Supported only for REQUEST authorizers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerUri;

/**
 <p>The identity source for which authorization is requested.</p><p>For a REQUEST authorizer, this is optional. The value is a set of one or more mapping expressions of the specified request parameters. Currently, the identity source can be headers, query string parameters, stage variables, and context parameters. For example, if an Auth header and a Name query string parameter are defined as identity sources, this value is route.request.header.Auth, route.request.querystring.Name. These parameters will be used to perform runtime validation for Lambda-based authorizers by verifying all of the identity-related request parameters are present in the request, not null, and non-empty. Only when this is true does the authorizer invoke the authorizer Lambda function. Otherwise, it returns a 401 Unauthorized response without calling the Lambda function.</p><p>For JWT, a single entry that specifies where to extract the JSON Web Token (JWT )from inbound requests. Currently only header-based and query parameter-based selections are supported, for example "$request.header.Authorization".</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable identitySource;

/**
 <p>This parameter is not used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityValidationExpression;

/**
 <p>Represents the configuration of a JWT authorizer. Required for the JWT authorizer type. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) AWSapigatewayJWTConfiguration * _Nullable jwtConfiguration;

/**
 <p>The name of the authorizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSapigatewayCreateAuthorizerResponse : AWSModel


/**
 <p>Specifies the required credentials as an IAM role for API Gateway to invoke the authorizer. To specify an IAM role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To use resource-based permissions on the Lambda function, specify null. Supported only for REQUEST authorizers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerCredentialsArn;

/**
 <p>The authorizer identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerId;

/**
 <p>Authorizer caching is not currently supported. Don't specify this value for authorizers.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable authorizerResultTtlInSeconds;

/**
 <p>The authorizer type. For WebSocket APIs, specify REQUEST for a Lambda function using incoming request parameters. For HTTP APIs, specify JWT to use JSON Web Tokens.</p>
 */
@property (nonatomic, assign) AWSapigatewayAuthorizerType authorizerType;

/**
 <p>The authorizer's Uniform Resource Identifier (URI). ForREQUEST authorizers, this must be a well-formed Lambda function URI, for example, arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:<replaceable>{account_id}</replaceable>:function:<replaceable>{lambda_function_name}</replaceable>/invocations. In general, the URI has this form: arn:aws:apigateway:<replaceable>{region}</replaceable>:lambda:path/<replaceable>{service_api}</replaceable>, where <replaceable></replaceable>{region} is the same as the region hosting the Lambda function, path indicates that the remaining substring in the URI should be treated as the path to the resource, including the initial /. For Lambda functions, this is usually of the form /2015-03-31/functions/[FunctionARN]/invocations. Supported only for REQUEST authorizers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerUri;

/**
 <p>The identity source for which authorization is requested.</p><p>For a REQUEST authorizer, this is optional. The value is a set of one or more mapping expressions of the specified request parameters. Currently, the identity source can be headers, query string parameters, stage variables, and context parameters. For example, if an Auth header and a Name query string parameter are defined as identity sources, this value is route.request.header.Auth, route.request.querystring.Name. These parameters will be used to perform runtime validation for Lambda-based authorizers by verifying all of the identity-related request parameters are present in the request, not null, and non-empty. Only when this is true does the authorizer invoke the authorizer Lambda function. Otherwise, it returns a 401 Unauthorized response without calling the Lambda function.</p><p>For JWT, a single entry that specifies where to extract the JSON Web Token (JWT) from inbound requests. Currently only header-based and query parameter-based selections are supported, for example "$request.header.Authorization".</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable identitySource;

/**
 <p>The validation expression does not apply to the REQUEST authorizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityValidationExpression;

/**
 <p>Represents the configuration of a JWT authorizer. Required for the JWT authorizer type. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) AWSapigatewayJWTConfiguration * _Nullable jwtConfiguration;

/**
 <p>The name of the authorizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Represents the input parameters for a CreateDeployment request.</p>
 */
@interface AWSapigatewayCreateDeploymentInput : AWSModel


/**
 <p>The description for the deployment resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the Stage resource for the Deployment resource to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stageName;

@end

/**
 <p>Creates a new Deployment resource to represent a deployment.</p>
 Required parameters: [ApiId]
 */
@interface AWSapigatewayCreateDeploymentRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The description for the deployment resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the Stage resource for the Deployment resource to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stageName;

@end

/**
 
 */
@interface AWSapigatewayCreateDeploymentResponse : AWSModel


/**
 <p>Specifies whether a deployment was automatically released.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoDeployed;

/**
 <p>The date and time when the Deployment resource was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The identifier for the deployment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p>The status of the deployment: PENDING, FAILED, or SUCCEEDED.</p>
 */
@property (nonatomic, assign) AWSapigatewayDeploymentStatus deploymentStatus;

/**
 <p>May contain additional feedback on the status of an API deployment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentStatusMessage;

/**
 <p>The description for the deployment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 <p>Represents the input parameters for a CreateDomainName request.</p>
 Required parameters: [DomainName]
 */
@interface AWSapigatewayCreateDomainNameInput : AWSModel


/**
 <p>The domain name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The domain name configurations.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayDomainNameConfiguration *> * _Nullable domainNameConfigurations;

/**
 <p>The collection of tags associated with a domain name.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Creates a new DomainName resource to represent a domain name.</p>
 Required parameters: [DomainName]
 */
@interface AWSapigatewayCreateDomainNameRequest : AWSRequest


/**
 <p>The domain name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The domain name configurations.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayDomainNameConfiguration *> * _Nullable domainNameConfigurations;

/**
 <p>The collection of tags associated with a domain name.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSapigatewayCreateDomainNameResponse : AWSModel


/**
 <p>The API mapping selection expression.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiMappingSelectionExpression;

/**
 <p>The name of the DomainName resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The domain name configurations.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayDomainNameConfiguration *> * _Nullable domainNameConfigurations;

/**
 <p>The collection of tags associated with a domain name.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Represents the input parameters for a CreateIntegration request.</p>
 Required parameters: [IntegrationType]
 */
@interface AWSapigatewayCreateIntegrationInput : AWSModel


/**
 <p>The ID of the VPC link for a private integration. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>The type of the network connection to the integration endpoint. Specify INTERNET for connections through the public routable internet or VPC_LINK for private connections between API Gateway and resources in a VPC. The default value is INTERNET.</p>
 */
@property (nonatomic, assign) AWSapigatewayConnectionType connectionType;

/**
 <p>Supported only for WebSocket APIs. Specifies how to handle response payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following behaviors:</p><p>CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the corresponding binary blob.</p><p>CONVERT_TO_TEXT: Converts a response payload from a binary blob to a Base64-encoded string.</p><p>If this property is not defined, the response payload will be passed through from the integration response to the route response or method response without modification.</p>
 */
@property (nonatomic, assign) AWSapigatewayContentHandlingStrategy contentHandlingStrategy;

/**
 <p>Specifies the credentials required for the integration, if any. For AWS integrations, three options are available. To specify an IAM Role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To require that the caller's identity be passed through from the request, specify the string arn:aws:iam::*:user/*. To use resource-based permissions on supported AWS services, specify null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable credentialsArn;

/**
 <p>The description of the integration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Specifies the integration's HTTP method type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationMethod;

/**
 <p>The integration type of an integration. One of the following:</p><p>AWS: for integrating the route or method request with an AWS service action, including the Lambda function-invoking action. With the Lambda function-invoking action, this is referred to as the Lambda custom integration. With any other AWS service action, this is known as AWS integration. Supported only for WebSocket APIs.</p><p>AWS_PROXY: for integrating the route or method request with the Lambda function-invoking action with the client request passed through as-is. This integration is also referred to as Lambda proxy integration.</p><p>HTTP: for integrating the route or method request with an HTTP endpoint. This integration is also referred to as the HTTP custom integration. Supported only for WebSocket APIs.</p><p>HTTP_PROXY: for integrating the route or method request with an HTTP endpoint, with the client request passed through as-is. This is also referred to as HTTP proxy integration. For HTTP API private integrations, use an HTTP_PROXY integration.</p><p>MOCK: for integrating the route or method request with API Gateway as a "loopback" endpoint without invoking any backend. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, assign) AWSapigatewayIntegrationType integrationType;

/**
 <p>For a Lambda integration, specify the URI of a Lambda function.</p><p>For an HTTP integration, specify a fully-qualified URL.</p><p>For an HTTP API private integration, specify the ARN of an Application Load Balancer listener, Network Load Balancer listener, or AWS Cloud Map service. If you specify the ARN of an AWS Cloud Map service, API Gateway uses DiscoverInstances to identify resources. You can use query parameters to target specific resources. To learn more, see <a href="https://docs.aws.amazon.com/cloud-map/latest/api/API_DiscoverInstances.html">DiscoverInstances</a>. For private integrations, all resources must be owned by the same AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationUri;

/**
 <p>Specifies the pass-through behavior for incoming requests based on the Content-Type header in the request, and the available mapping templates specified as the requestTemplates property on the Integration resource. There are three valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, and NEVER. Supported only for WebSocket APIs.</p><p>WHEN_NO_MATCH passes the request body for unmapped content types through to the integration backend without transformation.</p><p>NEVER rejects unmapped content types with an HTTP 415 Unsupported Media Type response.</p><p>WHEN_NO_TEMPLATES allows pass-through when the integration has no content types mapped to templates. However, if there is at least one content type defined, unmapped content types will be rejected with the same HTTP 415 Unsupported Media Type response.</p>
 */
@property (nonatomic, assign) AWSapigatewayPassthroughBehavior passthroughBehavior;

/**
 <p>Specifies the format of the payload sent to an integration. Required for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable payloadFormatVersion;

/**
 <p>A key-value map specifying request parameters that are passed from the method request to the backend. The key is an integration request parameter name and the associated value is a method request parameter value or static value that must be enclosed within single quotes and pre-encoded as required by the backend. The method request parameter value must match the pattern of method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>, where<replaceable>{location}</replaceable> is querystring, path, or header; and<replaceable>{name}</replaceable> must be a valid and unique method request parameter name. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestParameters;

/**
 <p>Represents a map of Velocity templates that are applied on the request payload based on the value of the Content-Type header sent by the client. The content type value is the key in this map, and the template (as a String) is the value. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestTemplates;

/**
 <p>The template selection expression for the integration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateSelectionExpression;

/**
 <p>Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and between 50 and 30,000 milliseconds for HTTP APIs. The default timeout is 29 seconds for WebSocket APIs and 30 seconds for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutInMillis;

/**
 <p>The TLS configuration for a private integration. If you specify a TLS configuration, private integration traffic uses the HTTPS protocol. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) AWSapigatewayTlsConfigInput * _Nullable tlsConfig;

@end

/**
 <p>Creates a new Integration resource to represent an integration.</p>
 Required parameters: [ApiId, IntegrationType]
 */
@interface AWSapigatewayCreateIntegrationRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The ID of the VPC link for a private integration. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>The type of the network connection to the integration endpoint. Specify INTERNET for connections through the public routable internet or VPC_LINK for private connections between API Gateway and resources in a VPC. The default value is INTERNET.</p>
 */
@property (nonatomic, assign) AWSapigatewayConnectionType connectionType;

/**
 <p>Supported only for WebSocket APIs. Specifies how to handle response payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following behaviors:</p><p>CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the corresponding binary blob.</p><p>CONVERT_TO_TEXT: Converts a response payload from a binary blob to a Base64-encoded string.</p><p>If this property is not defined, the response payload will be passed through from the integration response to the route response or method response without modification.</p>
 */
@property (nonatomic, assign) AWSapigatewayContentHandlingStrategy contentHandlingStrategy;

/**
 <p>Specifies the credentials required for the integration, if any. For AWS integrations, three options are available. To specify an IAM Role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To require that the caller's identity be passed through from the request, specify the string arn:aws:iam::*:user/*. To use resource-based permissions on supported AWS services, specify null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable credentialsArn;

/**
 <p>The description of the integration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Specifies the integration's HTTP method type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationMethod;

/**
 <p>The integration type of an integration. One of the following:</p><p>AWS: for integrating the route or method request with an AWS service action, including the Lambda function-invoking action. With the Lambda function-invoking action, this is referred to as the Lambda custom integration. With any other AWS service action, this is known as AWS integration. Supported only for WebSocket APIs.</p><p>AWS_PROXY: for integrating the route or method request with the Lambda function-invoking action with the client request passed through as-is. This integration is also referred to as Lambda proxy integration.</p><p>HTTP: for integrating the route or method request with an HTTP endpoint. This integration is also referred to as the HTTP custom integration. Supported only for WebSocket APIs.</p><p>HTTP_PROXY: for integrating the route or method request with an HTTP endpoint, with the client request passed through as-is. This is also referred to as HTTP proxy integration. For HTTP API private integrations, use an HTTP_PROXY integration.</p><p>MOCK: for integrating the route or method request with API Gateway as a "loopback" endpoint without invoking any backend. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, assign) AWSapigatewayIntegrationType integrationType;

/**
 <p>For a Lambda integration, specify the URI of a Lambda function.</p><p>For an HTTP integration, specify a fully-qualified URL.</p><p>For an HTTP API private integration, specify the ARN of an Application Load Balancer listener, Network Load Balancer listener, or AWS Cloud Map service. If you specify the ARN of an AWS Cloud Map service, API Gateway uses DiscoverInstances to identify resources. You can use query parameters to target specific resources. To learn more, see <a href="https://docs.aws.amazon.com/cloud-map/latest/api/API_DiscoverInstances.html">DiscoverInstances</a>. For private integrations, all resources must be owned by the same AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationUri;

/**
 <p>Specifies the pass-through behavior for incoming requests based on the Content-Type header in the request, and the available mapping templates specified as the requestTemplates property on the Integration resource. There are three valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, and NEVER. Supported only for WebSocket APIs.</p><p>WHEN_NO_MATCH passes the request body for unmapped content types through to the integration backend without transformation.</p><p>NEVER rejects unmapped content types with an HTTP 415 Unsupported Media Type response.</p><p>WHEN_NO_TEMPLATES allows pass-through when the integration has no content types mapped to templates. However, if there is at least one content type defined, unmapped content types will be rejected with the same HTTP 415 Unsupported Media Type response.</p>
 */
@property (nonatomic, assign) AWSapigatewayPassthroughBehavior passthroughBehavior;

/**
 <p>Specifies the format of the payload sent to an integration. Required for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable payloadFormatVersion;

/**
 <p>A key-value map specifying request parameters that are passed from the method request to the backend. The key is an integration request parameter name and the associated value is a method request parameter value or static value that must be enclosed within single quotes and pre-encoded as required by the backend. The method request parameter value must match the pattern of method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>, where<replaceable>{location}</replaceable> is querystring, path, or header; and<replaceable>{name}</replaceable> must be a valid and unique method request parameter name. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestParameters;

/**
 <p>Represents a map of Velocity templates that are applied on the request payload based on the value of the Content-Type header sent by the client. The content type value is the key in this map, and the template (as a String) is the value. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestTemplates;

/**
 <p>The template selection expression for the integration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateSelectionExpression;

/**
 <p>Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and between 50 and 30,000 milliseconds for HTTP APIs. The default timeout is 29 seconds for WebSocket APIs and 30 seconds for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutInMillis;

/**
 <p>The TLS configuration for a private integration. If you specify a TLS configuration, private integration traffic uses the HTTPS protocol. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) AWSapigatewayTlsConfigInput * _Nullable tlsConfig;

@end

/**
 
 */
@interface AWSapigatewayCreateIntegrationResult : AWSModel


/**
 <p>Specifies whether an integration is managed by API Gateway. If you created an API using using quick create, the resulting integration is managed by API Gateway. You can update a managed integration, but you can't delete it.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable apiGatewayManaged;

/**
 <p>The ID of the VPC link for a private integration. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>The type of the network connection to the integration endpoint. Specify INTERNET for connections through the public routable internet or VPC_LINK for private connections between API Gateway and resources in a VPC. The default value is INTERNET.</p>
 */
@property (nonatomic, assign) AWSapigatewayConnectionType connectionType;

/**
 <p>Supported only for WebSocket APIs. Specifies how to handle response payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following behaviors:</p><p>CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the corresponding binary blob.</p><p>CONVERT_TO_TEXT: Converts a response payload from a binary blob to a Base64-encoded string.</p><p>If this property is not defined, the response payload will be passed through from the integration response to the route response or method response without modification.</p>
 */
@property (nonatomic, assign) AWSapigatewayContentHandlingStrategy contentHandlingStrategy;

/**
 <p>Specifies the credentials required for the integration, if any. For AWS integrations, three options are available. To specify an IAM Role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To require that the caller's identity be passed through from the request, specify the string arn:aws:iam::*:user/*. To use resource-based permissions on supported AWS services, specify null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable credentialsArn;

/**
 <p>Represents the description of an integration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Represents the identifier of an integration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationId;

/**
 <p>Specifies the integration's HTTP method type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationMethod;

/**
 <p>The integration response selection expression for the integration. Supported only for WebSocket APIs. See <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-integration-response-selection-expressions">Integration Response Selection Expressions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationResponseSelectionExpression;

/**
 <p>The integration type of an integration. One of the following:</p><p>AWS: for integrating the route or method request with an AWS service action, including the Lambda function-invoking action. With the Lambda function-invoking action, this is referred to as the Lambda custom integration. With any other AWS service action, this is known as AWS integration. Supported only for WebSocket APIs.</p><p>AWS_PROXY: for integrating the route or method request with the Lambda function-invoking action with the client request passed through as-is. This integration is also referred to as Lambda proxy integration.</p><p>HTTP: for integrating the route or method request with an HTTP endpoint. This integration is also referred to as the HTTP custom integration. Supported only for WebSocket APIs.</p><p>HTTP_PROXY: for integrating the route or method request with an HTTP endpoint, with the client request passed through as-is. This is also referred to as HTTP proxy integration.</p><p>MOCK: for integrating the route or method request with API Gateway as a "loopback" endpoint without invoking any backend. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, assign) AWSapigatewayIntegrationType integrationType;

/**
 <p>For a Lambda integration, specify the URI of a Lambda function.</p><p>For an HTTP integration, specify a fully-qualified URL.</p><p>For an HTTP API private integration, specify the ARN of an Application Load Balancer listener, Network Load Balancer listener, or AWS Cloud Map service. If you specify the ARN of an AWS Cloud Map service, API Gateway uses DiscoverInstances to identify resources. You can use query parameters to target specific resources. To learn more, see <a href="https://docs.aws.amazon.com/cloud-map/latest/api/API_DiscoverInstances.html">DiscoverInstances</a>. For private integrations, all resources must be owned by the same AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationUri;

/**
 <p>Specifies the pass-through behavior for incoming requests based on the Content-Type header in the request, and the available mapping templates specified as the requestTemplates property on the Integration resource. There are three valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, and NEVER. Supported only for WebSocket APIs.</p><p>WHEN_NO_MATCH passes the request body for unmapped content types through to the integration backend without transformation.</p><p>NEVER rejects unmapped content types with an HTTP 415 Unsupported Media Type response.</p><p>WHEN_NO_TEMPLATES allows pass-through when the integration has no content types mapped to templates. However, if there is at least one content type defined, unmapped content types will be rejected with the same HTTP 415 Unsupported Media Type response.</p>
 */
@property (nonatomic, assign) AWSapigatewayPassthroughBehavior passthroughBehavior;

/**
 <p>Specifies the format of the payload sent to an integration. Required for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable payloadFormatVersion;

/**
 <p>A key-value map specifying request parameters that are passed from the method request to the backend. The key is an integration request parameter name and the associated value is a method request parameter value or static value that must be enclosed within single quotes and pre-encoded as required by the backend. The method request parameter value must match the pattern of method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>, where<replaceable>{location}</replaceable> is querystring, path, or header; and<replaceable>{name}</replaceable> must be a valid and unique method request parameter name. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestParameters;

/**
 <p>Represents a map of Velocity templates that are applied on the request payload based on the value of the Content-Type header sent by the client. The content type value is the key in this map, and the template (as a String) is the value. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestTemplates;

/**
 <p>The template selection expression for the integration. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateSelectionExpression;

/**
 <p>Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and between 50 and 30,000 milliseconds for HTTP APIs. The default timeout is 29 seconds for WebSocket APIs and 30 seconds for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutInMillis;

/**
 <p>The TLS configuration for a private integration. If you specify a TLS configuration, private integration traffic uses the HTTPS protocol. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) AWSapigatewayTlsConfig * _Nullable tlsConfig;

@end

/**
 <p>Represents the input parameters for a CreateIntegrationResponse request.</p>
 Required parameters: [IntegrationResponseKey]
 */
@interface AWSapigatewayCreateIntegrationResponseInput : AWSModel


/**
 <p>Specifies how to handle response payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following behaviors:</p><p>CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the corresponding binary blob.</p><p>CONVERT_TO_TEXT: Converts a response payload from a binary blob to a Base64-encoded string.</p><p>If this property is not defined, the response payload will be passed through from the integration response to the route response or method response without modification.</p>
 */
@property (nonatomic, assign) AWSapigatewayContentHandlingStrategy contentHandlingStrategy;

/**
 <p>The integration response key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationResponseKey;

/**
 <p>A key-value map specifying response parameters that are passed to the method response from the backend. The key is a method response header parameter name and the mapped value is an integration response header value, a static value enclosed within a pair of single quotes, or a JSON expression from the integration response body. The mapping key must match the pattern of method.response.header.{name}, where {name} is a valid and unique header name. The mapped non-static value must match the pattern of integration.response.header.{name} or integration.response.body.{JSON-expression}, where {name} is a valid and unique response header name and {JSON-expression} is a valid JSON expression without the $ prefix.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable responseParameters;

/**
 <p>The collection of response templates for the integration response as a string-to-string map of key-value pairs. Response templates are represented as a key/value map, with a content-type as the key and a template as the value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable responseTemplates;

/**
 <p>The template selection expression for the integration response. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateSelectionExpression;

@end

/**
 <p>Creates a new IntegrationResponse resource to represent an integration response.</p>
 Required parameters: [ApiId, IntegrationId, IntegrationResponseKey]
 */
@interface AWSapigatewayCreateIntegrationResponseRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>Specifies how to handle response payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following behaviors:</p><p>CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the corresponding binary blob.</p><p>CONVERT_TO_TEXT: Converts a response payload from a binary blob to a Base64-encoded string.</p><p>If this property is not defined, the response payload will be passed through from the integration response to the route response or method response without modification.</p>
 */
@property (nonatomic, assign) AWSapigatewayContentHandlingStrategy contentHandlingStrategy;

/**
 <p>The integration ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationId;

/**
 <p>The integration response key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationResponseKey;

/**
 <p>A key-value map specifying response parameters that are passed to the method response from the backend. The key is a method response header parameter name and the mapped value is an integration response header value, a static value enclosed within a pair of single quotes, or a JSON expression from the integration response body. The mapping key must match the pattern of method.response.header.{name}, where {name} is a valid and unique header name. The mapped non-static value must match the pattern of integration.response.header.{name} or integration.response.body.{JSON-expression}, where {name} is a valid and unique response header name and {JSON-expression} is a valid JSON expression without the $ prefix.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable responseParameters;

/**
 <p>The collection of response templates for the integration response as a string-to-string map of key-value pairs. Response templates are represented as a key/value map, with a content-type as the key and a template as the value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable responseTemplates;

/**
 <p>The template selection expression for the integration response. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateSelectionExpression;

@end

/**
 
 */
@interface AWSapigatewayCreateIntegrationResponseResponse : AWSModel


/**
 <p>Supported only for WebSocket APIs. Specifies how to handle response payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following behaviors:</p><p>CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the corresponding binary blob.</p><p>CONVERT_TO_TEXT: Converts a response payload from a binary blob to a Base64-encoded string.</p><p>If this property is not defined, the response payload will be passed through from the integration response to the route response or method response without modification.</p>
 */
@property (nonatomic, assign) AWSapigatewayContentHandlingStrategy contentHandlingStrategy;

/**
 <p>The integration response ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationResponseId;

/**
 <p>The integration response key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationResponseKey;

/**
 <p>A key-value map specifying response parameters that are passed to the method response from the backend. The key is a method response header parameter name and the mapped value is an integration response header value, a static value enclosed within a pair of single quotes, or a JSON expression from the integration response body. The mapping key must match the pattern of method.response.header.{name}, where name is a valid and unique header name. The mapped non-static value must match the pattern of integration.response.header.{name} or integration.response.body.{JSON-expression}, where name is a valid and unique response header name and JSON-expression is a valid JSON expression without the $ prefix.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable responseParameters;

/**
 <p>The collection of response templates for the integration response as a string-to-string map of key-value pairs. Response templates are represented as a key/value map, with a content-type as the key and a template as the value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable responseTemplates;

/**
 <p>The template selection expressions for the integration response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateSelectionExpression;

@end

/**
 <p>Represents the input parameters for a CreateModel request.</p>
 Required parameters: [Schema, Name]
 */
@interface AWSapigatewayCreateModelInput : AWSModel


/**
 <p>The content-type for the model, for example, "application/json".</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The description of the model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the model. Must be alphanumeric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The schema for the model. For application/json models, this should be JSON schema draft 4 model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schema;

@end

/**
 <p>Creates a new Model.</p>
 Required parameters: [ApiId, Schema, Name]
 */
@interface AWSapigatewayCreateModelRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The content-type for the model, for example, "application/json".</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The description of the model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the model. Must be alphanumeric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The schema for the model. For application/json models, this should be JSON schema draft 4 model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schema;

@end

/**
 
 */
@interface AWSapigatewayCreateModelResponse : AWSModel


/**
 <p>The content-type for the model, for example, "application/json".</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The description of the model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The model identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelId;

/**
 <p>The name of the model. Must be alphanumeric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The schema for the model. For application/json models, this should be JSON schema draft 4 model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schema;

@end

/**
 <p>Represents the input parameters for a CreateRoute request.</p>
 Required parameters: [RouteKey]
 */
@interface AWSapigatewayCreateRouteInput : AWSModel


/**
 <p>Specifies whether an API key is required for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable apiKeyRequired;

/**
 <p>The authorization scopes supported by this route.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable authorizationScopes;

/**
 <p>The authorization type for the route. For WebSocket APIs, valid values are NONE for open access, AWS_IAM for using AWS IAM permissions, and CUSTOM for using a Lambda authorizer For HTTP APIs, valid values are NONE for open access, or JWT for using JSON Web Tokens.</p>
 */
@property (nonatomic, assign) AWSapigatewayAuthorizationType authorizationType;

/**
 <p>The identifier of the Authorizer resource to be associated with this route. The authorizer identifier is generated by API Gateway when you created the authorizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerId;

/**
 <p>The model selection expression for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelSelectionExpression;

/**
 <p>The operation name for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationName;

/**
 <p>The request models for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestModels;

/**
 <p>The request parameters for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSapigatewayParameterConstraints *> * _Nullable requestParameters;

/**
 <p>The route key for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeKey;

/**
 <p>The route response selection expression for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeResponseSelectionExpression;

/**
 <p>The target for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

@end

/**
 <p>Creates a new Route resource to represent a route.</p>
 Required parameters: [ApiId, RouteKey]
 */
@interface AWSapigatewayCreateRouteRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>Specifies whether an API key is required for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable apiKeyRequired;

/**
 <p>The authorization scopes supported by this route.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable authorizationScopes;

/**
 <p>The authorization type for the route. For WebSocket APIs, valid values are NONE for open access, AWS_IAM for using AWS IAM permissions, and CUSTOM for using a Lambda authorizer For HTTP APIs, valid values are NONE for open access, or JWT for using JSON Web Tokens.</p>
 */
@property (nonatomic, assign) AWSapigatewayAuthorizationType authorizationType;

/**
 <p>The identifier of the Authorizer resource to be associated with this route. The authorizer identifier is generated by API Gateway when you created the authorizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerId;

/**
 <p>The model selection expression for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelSelectionExpression;

/**
 <p>The operation name for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationName;

/**
 <p>The request models for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestModels;

/**
 <p>The request parameters for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSapigatewayParameterConstraints *> * _Nullable requestParameters;

/**
 <p>The route key for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeKey;

/**
 <p>The route response selection expression for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeResponseSelectionExpression;

/**
 <p>The target for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

@end

/**
 
 */
@interface AWSapigatewayCreateRouteResult : AWSModel


/**
 <p>Specifies whether a route is managed by API Gateway. If you created an API using quick create, the $default route is managed by API Gateway. You can't modify the $default route key.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable apiGatewayManaged;

/**
 <p>Specifies whether an API key is required for this route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable apiKeyRequired;

/**
 <p>A list of authorization scopes configured on a route. The scopes are used with a JWT authorizer to authorize the method invocation. The authorization works by matching the route scopes against the scopes parsed from the access token in the incoming request. The method invocation is authorized if any route scope matches a claimed scope in the access token. Otherwise, the invocation is not authorized. When the route scope is configured, the client must provide an access token instead of an identity token for authorization purposes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable authorizationScopes;

/**
 <p>The authorization type for the route. For WebSocket APIs, valid values are NONE for open access, AWS_IAM for using AWS IAM permissions, and CUSTOM for using a Lambda authorizer For HTTP APIs, valid values are NONE for open access, or JWT for using JSON Web Tokens.</p>
 */
@property (nonatomic, assign) AWSapigatewayAuthorizationType authorizationType;

/**
 <p>The identifier of the Authorizer resource to be associated with this route. The authorizer identifier is generated by API Gateway when you created the authorizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerId;

/**
 <p>The model selection expression for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelSelectionExpression;

/**
 <p>The operation name for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationName;

/**
 <p>The request models for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestModels;

/**
 <p>The request parameters for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSapigatewayParameterConstraints *> * _Nullable requestParameters;

/**
 <p>The route ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeId;

/**
 <p>The route key for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeKey;

/**
 <p>The route response selection expression for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeResponseSelectionExpression;

/**
 <p>The target for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

@end

/**
 <p>Represents the input parameters for an CreateRouteResponse request.</p>
 Required parameters: [RouteResponseKey]
 */
@interface AWSapigatewayCreateRouteResponseInput : AWSModel


/**
 <p>The model selection expression for the route response. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelSelectionExpression;

/**
 <p>The response models for the route response.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable responseModels;

/**
 <p>The route response parameters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSapigatewayParameterConstraints *> * _Nullable responseParameters;

/**
 <p>The route response key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeResponseKey;

@end

/**
 <p>Creates a new RouteResponse resource to represent a route response.</p>
 Required parameters: [ApiId, RouteId, RouteResponseKey]
 */
@interface AWSapigatewayCreateRouteResponseRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The model selection expression for the route response. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelSelectionExpression;

/**
 <p>The response models for the route response.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable responseModels;

/**
 <p>The route response parameters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSapigatewayParameterConstraints *> * _Nullable responseParameters;

/**
 <p>The route ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeId;

/**
 <p>The route response key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeResponseKey;

@end

/**
 
 */
@interface AWSapigatewayCreateRouteResponseResponse : AWSModel


/**
 <p>Represents the model selection expression of a route response. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelSelectionExpression;

/**
 <p>Represents the response models of a route response.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable responseModels;

/**
 <p>Represents the response parameters of a route response.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSapigatewayParameterConstraints *> * _Nullable responseParameters;

/**
 <p>Represents the identifier of a route response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeResponseId;

/**
 <p>Represents the route response key of a route response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeResponseKey;

@end

/**
 <p>Represents the input parameters for a CreateStage request.</p>
 Required parameters: [StageName]
 */
@interface AWSapigatewayCreateStageInput : AWSModel


/**
 <p>Settings for logging access in this stage.</p>
 */
@property (nonatomic, strong) AWSapigatewayAccessLogSettings * _Nullable accessLogSettings;

/**
 <p>Specifies whether updates to an API automatically trigger a new deployment. The default value is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoDeploy;

/**
 <p>The identifier of a client certificate for a Stage. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientCertificateId;

/**
 <p>The default route settings for the stage.</p>
 */
@property (nonatomic, strong) AWSapigatewayRouteSettings * _Nullable defaultRouteSettings;

/**
 <p>The deployment identifier of the API stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p>The description for the API stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Route settings for the stage, by routeKey.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSapigatewayRouteSettings *> * _Nullable routeSettings;

/**
 <p>The name of the stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stageName;

/**
 <p>A map that defines the stage variables for a Stage. Variable names can have alphanumeric and underscore characters, and the values must match [A-Za-z0-9-._~:/?#&amp;=,]+.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable stageVariables;

/**
 <p>The collection of tags. Each tag element is associated with a given resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Creates a new Stage resource to represent a stage.</p>
 Required parameters: [ApiId, StageName]
 */
@interface AWSapigatewayCreateStageRequest : AWSRequest


/**
 <p>Settings for logging access in this stage.</p>
 */
@property (nonatomic, strong) AWSapigatewayAccessLogSettings * _Nullable accessLogSettings;

/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>Specifies whether updates to an API automatically trigger a new deployment. The default value is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoDeploy;

/**
 <p>The identifier of a client certificate for a Stage. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientCertificateId;

/**
 <p>The default route settings for the stage.</p>
 */
@property (nonatomic, strong) AWSapigatewayRouteSettings * _Nullable defaultRouteSettings;

/**
 <p>The deployment identifier of the API stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p>The description for the API stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Route settings for the stage, by routeKey.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSapigatewayRouteSettings *> * _Nullable routeSettings;

/**
 <p>The name of the stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stageName;

/**
 <p>A map that defines the stage variables for a Stage. Variable names can have alphanumeric and underscore characters, and the values must match [A-Za-z0-9-._~:/?#&amp;=,]+.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable stageVariables;

/**
 <p>The collection of tags. Each tag element is associated with a given resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSapigatewayCreateStageResponse : AWSModel


/**
 <p>Settings for logging access in this stage.</p>
 */
@property (nonatomic, strong) AWSapigatewayAccessLogSettings * _Nullable accessLogSettings;

/**
 <p>Specifies whether a stage is managed by API Gateway. If you created an API using quick create, the $default stage is managed by API Gateway. You can't modify the $default stage.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable apiGatewayManaged;

/**
 <p>Specifies whether updates to an API automatically trigger a new deployment. The default value is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoDeploy;

/**
 <p>The identifier of a client certificate for a Stage. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientCertificateId;

/**
 <p>The timestamp when the stage was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>Default route settings for the stage.</p>
 */
@property (nonatomic, strong) AWSapigatewayRouteSettings * _Nullable defaultRouteSettings;

/**
 <p>The identifier of the Deployment that the Stage is associated with. Can't be updated if autoDeploy is enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p>The description of the stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Describes the status of the last deployment of a stage. Supported only for stages with autoDeploy enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastDeploymentStatusMessage;

/**
 <p>The timestamp when the stage was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDate;

/**
 <p>Route settings for the stage, by routeKey.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSapigatewayRouteSettings *> * _Nullable routeSettings;

/**
 <p>The name of the stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stageName;

/**
 <p>A map that defines the stage variables for a stage resource. Variable names can have alphanumeric and underscore characters, and the values must match [A-Za-z0-9-._~:/?#&amp;=,]+.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable stageVariables;

/**
 <p>The collection of tags. Each tag element is associated with a given resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Represents the input parameters for a CreateVpcLink request.</p>
 Required parameters: [SubnetIds, Name]
 */
@interface AWSapigatewayCreateVpcLinkInput : AWSModel


/**
 <p>The name of the VPC link.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of security group IDs for the VPC link.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>A list of subnet IDs to include in the VPC link.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>A list of tags.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Creates a VPC link</p>
 Required parameters: [SubnetIds, Name]
 */
@interface AWSapigatewayCreateVpcLinkRequest : AWSRequest


/**
 <p>The name of the VPC link.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of security group IDs for the VPC link.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>A list of subnet IDs to include in the VPC link.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>A list of tags.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSapigatewayCreateVpcLinkResponse : AWSModel


/**
 <p>The timestamp when the VPC link was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The name of the VPC link.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of security group IDs for the VPC link.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>A list of subnet IDs to include in the VPC link.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>Tags for the VPC link.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The ID of the VPC link.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcLinkId;

/**
 <p>The status of the VPC link.</p>
 */
@property (nonatomic, assign) AWSapigatewayVpcLinkStatus vpcLinkStatus;

/**
 <p>A message summarizing the cause of the status of the VPC link.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcLinkStatusMessage;

/**
 <p>The version of the VPC link.</p>
 */
@property (nonatomic, assign) AWSapigatewayVpcLinkVersion vpcLinkVersion;

@end

/**
 
 */
@interface AWSapigatewayDeleteAccessLogSettingsRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The stage name. Stage names can only contain alphanumeric characters, hyphens, and underscores. Maximum length is 128 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stageName;

@end

/**
 
 */
@interface AWSapigatewayDeleteApiMappingRequest : AWSRequest


/**
 <p>The API mapping identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiMappingId;

/**
 <p>The domain name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 
 */
@interface AWSapigatewayDeleteApiRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

@end

/**
 
 */
@interface AWSapigatewayDeleteAuthorizerRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The authorizer identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerId;

@end

/**
 
 */
@interface AWSapigatewayDeleteCorsConfigurationRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

@end

/**
 
 */
@interface AWSapigatewayDeleteDeploymentRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The deployment ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

@end

/**
 
 */
@interface AWSapigatewayDeleteDomainNameRequest : AWSRequest


/**
 <p>The domain name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 
 */
@interface AWSapigatewayDeleteIntegrationRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The integration ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationId;

@end

/**
 
 */
@interface AWSapigatewayDeleteIntegrationResponseRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The integration ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationId;

/**
 <p>The integration response ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationResponseId;

@end

/**
 
 */
@interface AWSapigatewayDeleteModelRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The model ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelId;

@end

/**
 
 */
@interface AWSapigatewayDeleteRouteRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The route ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeId;

@end

/**
 
 */
@interface AWSapigatewayDeleteRouteRequestParameterRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The route request parameter key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestParameterKey;

/**
 <p>The route ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeId;

@end

/**
 
 */
@interface AWSapigatewayDeleteRouteResponseRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The route ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeId;

/**
 <p>The route response ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeResponseId;

@end

/**
 
 */
@interface AWSapigatewayDeleteRouteSettingsRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The route key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeKey;

/**
 <p>The stage name. Stage names can only contain alphanumeric characters, hyphens, and underscores. Maximum length is 128 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stageName;

@end

/**
 
 */
@interface AWSapigatewayDeleteStageRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The stage name. Stage names can only contain alphanumeric characters, hyphens, and underscores. Maximum length is 128 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stageName;

@end

/**
 
 */
@interface AWSapigatewayDeleteVpcLinkRequest : AWSRequest


/**
 <p>The ID of the VPC link.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcLinkId;

@end

/**
 
 */
@interface AWSapigatewayDeleteVpcLinkResponse : AWSModel


@end

/**
 <p>An immutable representation of an API that can be called by users. A Deployment must be associated with a Stage for it to be callable over the internet.</p>
 */
@interface AWSapigatewayDeployment : AWSModel


/**
 <p>Specifies whether a deployment was automatically released.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoDeployed;

/**
 <p>The date and time when the Deployment resource was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The identifier for the deployment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p>The status of the deployment: PENDING, FAILED, or SUCCEEDED.</p>
 */
@property (nonatomic, assign) AWSapigatewayDeploymentStatus deploymentStatus;

/**
 <p>May contain additional feedback on the status of an API deployment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentStatusMessage;

/**
 <p>The description for the deployment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 <p>A collection resource that contains zero or more references to your existing deployments, and links that guide you on how to interact with your collection. The collection offers a paginated view of the contained deployments.</p>
 */
@interface AWSapigatewayDeployments : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayDeployment *> * _Nullable items;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Represents a domain name.</p>
 Required parameters: [DomainName]
 */
@interface AWSapigatewayDomainName : AWSModel


/**
 <p>The API mapping selection expression.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiMappingSelectionExpression;

/**
 <p>The name of the DomainName resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The domain name configurations.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayDomainNameConfiguration *> * _Nullable domainNameConfigurations;

/**
 <p>The collection of tags associated with a domain name.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>The domain name configuration.</p>
 */
@interface AWSapigatewayDomainNameConfiguration : AWSModel


/**
 <p>A domain name for the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiGatewayDomainName;

/**
 <p>An AWS-managed certificate that will be used by the edge-optimized endpoint for this domain name. AWS Certificate Manager is the only supported source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The user-friendly name of the certificate that will be used by the edge-optimized endpoint for this domain name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateName;

/**
 <p>The timestamp when the certificate that was used by edge-optimized endpoint for this domain name was uploaded.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable certificateUploadDate;

/**
 <p>The status of the domain name migration. The valid values are AVAILABLE and UPDATING. If the status is UPDATING, the domain cannot be modified further until the existing operation is complete. If it is AVAILABLE, the domain can be updated.</p>
 */
@property (nonatomic, assign) AWSapigatewayDomainNameStatus domainNameStatus;

/**
 <p>An optional text message containing detailed information about status of the domain name migration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainNameStatusMessage;

/**
 <p>The endpoint type.</p>
 */
@property (nonatomic, assign) AWSapigatewayEndpointType endpointType;

/**
 <p>The Amazon Route 53 Hosted Zone ID of the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneId;

/**
 <p>The Transport Layer Security (TLS) version of the security policy for this domain name. The valid values are TLS_1_0 and TLS_1_2.</p>
 */
@property (nonatomic, assign) AWSapigatewaySecurityPolicy securityPolicy;

@end

/**
 <p>Represents a collection of domain names.</p>
 */
@interface AWSapigatewayDomainNames : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayDomainName *> * _Nullable items;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapigatewayExportApiRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The version of the API Gateway export algorithm. API Gateway uses the latest version by default. Currently, the only supported version is 1.0.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exportVersion;

/**
 <p>Specifies whether to include <a href="https://docs.aws.amazon.com//apigateway/latest/developerguide/api-gateway-swagger-extensions.html">API Gateway extensions</a> in the exported API definition. API Gateway extensions are included by default.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeExtensions;

/**
 <p>The output type of the exported definition file. Valid values are JSON and YAML.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputType;

/**
 <p>The version of the API specification to use. OAS30, for OpenAPI 3.0, is the only supported value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable specification;

/**
 <p>The name of the API stage to export. If you don't specify this property, a representation of the latest API configuration is exported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stageName;

@end

/**
 
 */
@interface AWSapigatewayExportApiResponse : AWSModel


/**
 <p>Represents an exported definition of an API in a particular output format, for example, YAML. The API is serialized to the requested specification, for example, OpenAPI 3.0.</p>
 */
@property (nonatomic, strong) NSData * _Nullable body;

@end

/**
 
 */
@interface AWSapigatewayGetApiMappingRequest : AWSRequest


/**
 <p>The API mapping identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiMappingId;

/**
 <p>The domain name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 
 */
@interface AWSapigatewayGetApiMappingResponse : AWSModel


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The API mapping identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiMappingId;

/**
 <p>The API mapping key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiMappingKey;

/**
 <p>The API stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stage;

@end

/**
 
 */
@interface AWSapigatewayGetApiMappingsRequest : AWSRequest


/**
 <p>The domain name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The maximum number of elements to be returned for this resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxResults;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapigatewayGetApiMappingsResponse : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayApiMapping *> * _Nullable items;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapigatewayGetApiRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

@end

/**
 
 */
@interface AWSapigatewayGetApiResponse : AWSModel


/**
 <p>The URI of the API, of the form {api-id}.execute-api.{region}.amazonaws.com. The stage name is typically appended to this URI to form a complete path to a deployed API stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiEndpoint;

/**
 <p>The API ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>An API key selection expression. Supported only for WebSocket APIs. See <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API Key Selection Expressions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiKeySelectionExpression;

/**
 <p>A CORS configuration. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) AWSapigatewayCors * _Nullable corsConfiguration;

/**
 <p>The timestamp when the API was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The description of the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Avoid validating models when creating a deployment. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableSchemaValidation;

/**
 <p>The validation information during API import. This may include particular properties of your OpenAPI definition which are ignored during import. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable importInfo;

/**
 <p>The name of the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The API protocol.</p>
 */
@property (nonatomic, assign) AWSapigatewayProtocolType protocolType;

/**
 <p>The route selection expression for the API. For HTTP APIs, the routeSelectionExpression must be ${request.method} ${request.path}. If not provided, this will be the default for HTTP APIs. This property is required for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeSelectionExpression;

/**
 <p>A collection of tags associated with the API.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>A version identifier for the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

/**
 <p>The warning messages reported when failonwarnings is turned on during API import.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable warnings;

@end

/**
 
 */
@interface AWSapigatewayGetApisRequest : AWSRequest


/**
 <p>The maximum number of elements to be returned for this resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxResults;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapigatewayGetApisResponse : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayApi *> * _Nullable items;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapigatewayGetAuthorizerRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The authorizer identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerId;

@end

/**
 
 */
@interface AWSapigatewayGetAuthorizerResponse : AWSModel


/**
 <p>Specifies the required credentials as an IAM role for API Gateway to invoke the authorizer. To specify an IAM role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To use resource-based permissions on the Lambda function, specify null. Supported only for REQUEST authorizers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerCredentialsArn;

/**
 <p>The authorizer identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerId;

/**
 <p>Authorizer caching is not currently supported. Don't specify this value for authorizers.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable authorizerResultTtlInSeconds;

/**
 <p>The authorizer type. For WebSocket APIs, specify REQUEST for a Lambda function using incoming request parameters. For HTTP APIs, specify JWT to use JSON Web Tokens.</p>
 */
@property (nonatomic, assign) AWSapigatewayAuthorizerType authorizerType;

/**
 <p>The authorizer's Uniform Resource Identifier (URI). ForREQUEST authorizers, this must be a well-formed Lambda function URI, for example, arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:<replaceable>{account_id}</replaceable>:function:<replaceable>{lambda_function_name}</replaceable>/invocations. In general, the URI has this form: arn:aws:apigateway:<replaceable>{region}</replaceable>:lambda:path/<replaceable>{service_api}</replaceable>, where <replaceable></replaceable>{region} is the same as the region hosting the Lambda function, path indicates that the remaining substring in the URI should be treated as the path to the resource, including the initial /. For Lambda functions, this is usually of the form /2015-03-31/functions/[FunctionARN]/invocations. Supported only for REQUEST authorizers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerUri;

/**
 <p>The identity source for which authorization is requested.</p><p>For a REQUEST authorizer, this is optional. The value is a set of one or more mapping expressions of the specified request parameters. Currently, the identity source can be headers, query string parameters, stage variables, and context parameters. For example, if an Auth header and a Name query string parameter are defined as identity sources, this value is route.request.header.Auth, route.request.querystring.Name. These parameters will be used to perform runtime validation for Lambda-based authorizers by verifying all of the identity-related request parameters are present in the request, not null, and non-empty. Only when this is true does the authorizer invoke the authorizer Lambda function. Otherwise, it returns a 401 Unauthorized response without calling the Lambda function.</p><p>For JWT, a single entry that specifies where to extract the JSON Web Token (JWT) from inbound requests. Currently only header-based and query parameter-based selections are supported, for example "$request.header.Authorization".</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable identitySource;

/**
 <p>The validation expression does not apply to the REQUEST authorizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityValidationExpression;

/**
 <p>Represents the configuration of a JWT authorizer. Required for the JWT authorizer type. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) AWSapigatewayJWTConfiguration * _Nullable jwtConfiguration;

/**
 <p>The name of the authorizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSapigatewayGetAuthorizersRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The maximum number of elements to be returned for this resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxResults;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapigatewayGetAuthorizersResponse : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayAuthorizer *> * _Nullable items;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapigatewayGetDeploymentRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The deployment ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

@end

/**
 
 */
@interface AWSapigatewayGetDeploymentResponse : AWSModel


/**
 <p>Specifies whether a deployment was automatically released.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoDeployed;

/**
 <p>The date and time when the Deployment resource was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The identifier for the deployment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p>The status of the deployment: PENDING, FAILED, or SUCCEEDED.</p>
 */
@property (nonatomic, assign) AWSapigatewayDeploymentStatus deploymentStatus;

/**
 <p>May contain additional feedback on the status of an API deployment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentStatusMessage;

/**
 <p>The description for the deployment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 
 */
@interface AWSapigatewayGetDeploymentsRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The maximum number of elements to be returned for this resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxResults;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapigatewayGetDeploymentsResponse : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayDeployment *> * _Nullable items;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapigatewayGetDomainNameRequest : AWSRequest


/**
 <p>The domain name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 
 */
@interface AWSapigatewayGetDomainNameResponse : AWSModel


/**
 <p>The API mapping selection expression.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiMappingSelectionExpression;

/**
 <p>The name of the DomainName resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The domain name configurations.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayDomainNameConfiguration *> * _Nullable domainNameConfigurations;

/**
 <p>The collection of tags associated with a domain name.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSapigatewayGetDomainNamesRequest : AWSRequest


/**
 <p>The maximum number of elements to be returned for this resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxResults;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapigatewayGetDomainNamesResponse : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayDomainName *> * _Nullable items;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapigatewayGetIntegrationRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The integration ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationId;

@end

/**
 
 */
@interface AWSapigatewayGetIntegrationResult : AWSModel


/**
 <p>Specifies whether an integration is managed by API Gateway. If you created an API using using quick create, the resulting integration is managed by API Gateway. You can update a managed integration, but you can't delete it.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable apiGatewayManaged;

/**
 <p>The ID of the VPC link for a private integration. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>The type of the network connection to the integration endpoint. Specify INTERNET for connections through the public routable internet or VPC_LINK for private connections between API Gateway and resources in a VPC. The default value is INTERNET.</p>
 */
@property (nonatomic, assign) AWSapigatewayConnectionType connectionType;

/**
 <p>Supported only for WebSocket APIs. Specifies how to handle response payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following behaviors:</p><p>CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the corresponding binary blob.</p><p>CONVERT_TO_TEXT: Converts a response payload from a binary blob to a Base64-encoded string.</p><p>If this property is not defined, the response payload will be passed through from the integration response to the route response or method response without modification.</p>
 */
@property (nonatomic, assign) AWSapigatewayContentHandlingStrategy contentHandlingStrategy;

/**
 <p>Specifies the credentials required for the integration, if any. For AWS integrations, three options are available. To specify an IAM Role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To require that the caller's identity be passed through from the request, specify the string arn:aws:iam::*:user/*. To use resource-based permissions on supported AWS services, specify null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable credentialsArn;

/**
 <p>Represents the description of an integration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Represents the identifier of an integration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationId;

/**
 <p>Specifies the integration's HTTP method type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationMethod;

/**
 <p>The integration response selection expression for the integration. Supported only for WebSocket APIs. See <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-integration-response-selection-expressions">Integration Response Selection Expressions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationResponseSelectionExpression;

/**
 <p>The integration type of an integration. One of the following:</p><p>AWS: for integrating the route or method request with an AWS service action, including the Lambda function-invoking action. With the Lambda function-invoking action, this is referred to as the Lambda custom integration. With any other AWS service action, this is known as AWS integration. Supported only for WebSocket APIs.</p><p>AWS_PROXY: for integrating the route or method request with the Lambda function-invoking action with the client request passed through as-is. This integration is also referred to as Lambda proxy integration.</p><p>HTTP: for integrating the route or method request with an HTTP endpoint. This integration is also referred to as the HTTP custom integration. Supported only for WebSocket APIs.</p><p>HTTP_PROXY: for integrating the route or method request with an HTTP endpoint, with the client request passed through as-is. This is also referred to as HTTP proxy integration.</p><p>MOCK: for integrating the route or method request with API Gateway as a "loopback" endpoint without invoking any backend. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, assign) AWSapigatewayIntegrationType integrationType;

/**
 <p>For a Lambda integration, specify the URI of a Lambda function.</p><p>For an HTTP integration, specify a fully-qualified URL.</p><p>For an HTTP API private integration, specify the ARN of an Application Load Balancer listener, Network Load Balancer listener, or AWS Cloud Map service. If you specify the ARN of an AWS Cloud Map service, API Gateway uses DiscoverInstances to identify resources. You can use query parameters to target specific resources. To learn more, see <a href="https://docs.aws.amazon.com/cloud-map/latest/api/API_DiscoverInstances.html">DiscoverInstances</a>. For private integrations, all resources must be owned by the same AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationUri;

/**
 <p>Specifies the pass-through behavior for incoming requests based on the Content-Type header in the request, and the available mapping templates specified as the requestTemplates property on the Integration resource. There are three valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, and NEVER. Supported only for WebSocket APIs.</p><p>WHEN_NO_MATCH passes the request body for unmapped content types through to the integration backend without transformation.</p><p>NEVER rejects unmapped content types with an HTTP 415 Unsupported Media Type response.</p><p>WHEN_NO_TEMPLATES allows pass-through when the integration has no content types mapped to templates. However, if there is at least one content type defined, unmapped content types will be rejected with the same HTTP 415 Unsupported Media Type response.</p>
 */
@property (nonatomic, assign) AWSapigatewayPassthroughBehavior passthroughBehavior;

/**
 <p>Specifies the format of the payload sent to an integration. Required for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable payloadFormatVersion;

/**
 <p>A key-value map specifying request parameters that are passed from the method request to the backend. The key is an integration request parameter name and the associated value is a method request parameter value or static value that must be enclosed within single quotes and pre-encoded as required by the backend. The method request parameter value must match the pattern of method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>, where<replaceable>{location}</replaceable> is querystring, path, or header; and<replaceable>{name}</replaceable> must be a valid and unique method request parameter name. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestParameters;

/**
 <p>Represents a map of Velocity templates that are applied on the request payload based on the value of the Content-Type header sent by the client. The content type value is the key in this map, and the template (as a String) is the value. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestTemplates;

/**
 <p>The template selection expression for the integration. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateSelectionExpression;

/**
 <p>Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and between 50 and 30,000 milliseconds for HTTP APIs. The default timeout is 29 seconds for WebSocket APIs and 30 seconds for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutInMillis;

/**
 <p>The TLS configuration for a private integration. If you specify a TLS configuration, private integration traffic uses the HTTPS protocol. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) AWSapigatewayTlsConfig * _Nullable tlsConfig;

@end

/**
 
 */
@interface AWSapigatewayGetIntegrationResponseRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The integration ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationId;

/**
 <p>The integration response ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationResponseId;

@end

/**
 
 */
@interface AWSapigatewayGetIntegrationResponseResponse : AWSModel


/**
 <p>Supported only for WebSocket APIs. Specifies how to handle response payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following behaviors:</p><p>CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the corresponding binary blob.</p><p>CONVERT_TO_TEXT: Converts a response payload from a binary blob to a Base64-encoded string.</p><p>If this property is not defined, the response payload will be passed through from the integration response to the route response or method response without modification.</p>
 */
@property (nonatomic, assign) AWSapigatewayContentHandlingStrategy contentHandlingStrategy;

/**
 <p>The integration response ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationResponseId;

/**
 <p>The integration response key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationResponseKey;

/**
 <p>A key-value map specifying response parameters that are passed to the method response from the backend. The key is a method response header parameter name and the mapped value is an integration response header value, a static value enclosed within a pair of single quotes, or a JSON expression from the integration response body. The mapping key must match the pattern of method.response.header.{name}, where name is a valid and unique header name. The mapped non-static value must match the pattern of integration.response.header.{name} or integration.response.body.{JSON-expression}, where name is a valid and unique response header name and JSON-expression is a valid JSON expression without the $ prefix.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable responseParameters;

/**
 <p>The collection of response templates for the integration response as a string-to-string map of key-value pairs. Response templates are represented as a key/value map, with a content-type as the key and a template as the value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable responseTemplates;

/**
 <p>The template selection expressions for the integration response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateSelectionExpression;

@end

/**
 
 */
@interface AWSapigatewayGetIntegrationResponsesRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The integration ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationId;

/**
 <p>The maximum number of elements to be returned for this resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxResults;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapigatewayGetIntegrationResponsesResponse : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayIntegrationResponse *> * _Nullable items;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapigatewayGetIntegrationsRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The maximum number of elements to be returned for this resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxResults;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapigatewayGetIntegrationsResponse : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayIntegration *> * _Nullable items;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapigatewayGetModelRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The model ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelId;

@end

/**
 
 */
@interface AWSapigatewayGetModelResponse : AWSModel


/**
 <p>The content-type for the model, for example, "application/json".</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The description of the model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The model identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelId;

/**
 <p>The name of the model. Must be alphanumeric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The schema for the model. For application/json models, this should be JSON schema draft 4 model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schema;

@end

/**
 
 */
@interface AWSapigatewayGetModelTemplateRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The model ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelId;

@end

/**
 
 */
@interface AWSapigatewayGetModelTemplateResponse : AWSModel


/**
 <p>The template value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSapigatewayGetModelsRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The maximum number of elements to be returned for this resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxResults;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapigatewayGetModelsResponse : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayModel *> * _Nullable items;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapigatewayGetRouteRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The route ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeId;

@end

/**
 
 */
@interface AWSapigatewayGetRouteResult : AWSModel


/**
 <p>Specifies whether a route is managed by API Gateway. If you created an API using quick create, the $default route is managed by API Gateway. You can't modify the $default route key.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable apiGatewayManaged;

/**
 <p>Specifies whether an API key is required for this route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable apiKeyRequired;

/**
 <p>A list of authorization scopes configured on a route. The scopes are used with a JWT authorizer to authorize the method invocation. The authorization works by matching the route scopes against the scopes parsed from the access token in the incoming request. The method invocation is authorized if any route scope matches a claimed scope in the access token. Otherwise, the invocation is not authorized. When the route scope is configured, the client must provide an access token instead of an identity token for authorization purposes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable authorizationScopes;

/**
 <p>The authorization type for the route. For WebSocket APIs, valid values are NONE for open access, AWS_IAM for using AWS IAM permissions, and CUSTOM for using a Lambda authorizer For HTTP APIs, valid values are NONE for open access, or JWT for using JSON Web Tokens.</p>
 */
@property (nonatomic, assign) AWSapigatewayAuthorizationType authorizationType;

/**
 <p>The identifier of the Authorizer resource to be associated with this route. The authorizer identifier is generated by API Gateway when you created the authorizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerId;

/**
 <p>The model selection expression for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelSelectionExpression;

/**
 <p>The operation name for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationName;

/**
 <p>The request models for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestModels;

/**
 <p>The request parameters for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSapigatewayParameterConstraints *> * _Nullable requestParameters;

/**
 <p>The route ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeId;

/**
 <p>The route key for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeKey;

/**
 <p>The route response selection expression for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeResponseSelectionExpression;

/**
 <p>The target for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

@end

/**
 
 */
@interface AWSapigatewayGetRouteResponseRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The route ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeId;

/**
 <p>The route response ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeResponseId;

@end

/**
 
 */
@interface AWSapigatewayGetRouteResponseResponse : AWSModel


/**
 <p>Represents the model selection expression of a route response. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelSelectionExpression;

/**
 <p>Represents the response models of a route response.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable responseModels;

/**
 <p>Represents the response parameters of a route response.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSapigatewayParameterConstraints *> * _Nullable responseParameters;

/**
 <p>Represents the identifier of a route response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeResponseId;

/**
 <p>Represents the route response key of a route response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeResponseKey;

@end

/**
 
 */
@interface AWSapigatewayGetRouteResponsesRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The maximum number of elements to be returned for this resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxResults;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The route ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeId;

@end

/**
 
 */
@interface AWSapigatewayGetRouteResponsesResponse : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayRouteResponse *> * _Nullable items;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapigatewayGetRoutesRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The maximum number of elements to be returned for this resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxResults;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapigatewayGetRoutesResponse : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayRoute *> * _Nullable items;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapigatewayGetStageRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The stage name. Stage names can only contain alphanumeric characters, hyphens, and underscores. Maximum length is 128 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stageName;

@end

/**
 
 */
@interface AWSapigatewayGetStageResponse : AWSModel


/**
 <p>Settings for logging access in this stage.</p>
 */
@property (nonatomic, strong) AWSapigatewayAccessLogSettings * _Nullable accessLogSettings;

/**
 <p>Specifies whether a stage is managed by API Gateway. If you created an API using quick create, the $default stage is managed by API Gateway. You can't modify the $default stage.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable apiGatewayManaged;

/**
 <p>Specifies whether updates to an API automatically trigger a new deployment. The default value is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoDeploy;

/**
 <p>The identifier of a client certificate for a Stage. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientCertificateId;

/**
 <p>The timestamp when the stage was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>Default route settings for the stage.</p>
 */
@property (nonatomic, strong) AWSapigatewayRouteSettings * _Nullable defaultRouteSettings;

/**
 <p>The identifier of the Deployment that the Stage is associated with. Can't be updated if autoDeploy is enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p>The description of the stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Describes the status of the last deployment of a stage. Supported only for stages with autoDeploy enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastDeploymentStatusMessage;

/**
 <p>The timestamp when the stage was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDate;

/**
 <p>Route settings for the stage, by routeKey.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSapigatewayRouteSettings *> * _Nullable routeSettings;

/**
 <p>The name of the stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stageName;

/**
 <p>A map that defines the stage variables for a stage resource. Variable names can have alphanumeric and underscore characters, and the values must match [A-Za-z0-9-._~:/?#&amp;=,]+.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable stageVariables;

/**
 <p>The collection of tags. Each tag element is associated with a given resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSapigatewayGetStagesRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The maximum number of elements to be returned for this resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxResults;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapigatewayGetStagesResponse : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayStage *> * _Nullable items;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapigatewayGetTagsRequest : AWSRequest


/**
 <p>The resource ARN for the tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSapigatewayGetTagsResponse : AWSModel


/**
 <p>Represents a collection of tags associated with the resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSapigatewayGetVpcLinkRequest : AWSRequest


/**
 <p>The ID of the VPC link.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcLinkId;

@end

/**
 
 */
@interface AWSapigatewayGetVpcLinkResponse : AWSModel


/**
 <p>The timestamp when the VPC link was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The name of the VPC link.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of security group IDs for the VPC link.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>A list of subnet IDs to include in the VPC link.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>Tags for the VPC link.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The ID of the VPC link.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcLinkId;

/**
 <p>The status of the VPC link.</p>
 */
@property (nonatomic, assign) AWSapigatewayVpcLinkStatus vpcLinkStatus;

/**
 <p>A message summarizing the cause of the status of the VPC link.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcLinkStatusMessage;

/**
 <p>The version of the VPC link.</p>
 */
@property (nonatomic, assign) AWSapigatewayVpcLinkVersion vpcLinkVersion;

@end

/**
 
 */
@interface AWSapigatewayGetVpcLinksRequest : AWSRequest


/**
 <p>The maximum number of elements to be returned for this resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxResults;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapigatewayGetVpcLinksResponse : AWSModel


/**
 <p>A collection of VPC links.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayVpcLink *> * _Nullable items;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Represents the input to ImportAPI. Supported only for HTTP APIs.</p>
 Required parameters: [Body]
 */
@interface AWSapigatewayImportApiInput : AWSModel


/**
 <p>The OpenAPI definition. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

@end

/**
 <p></p>
 Required parameters: [Body]
 */
@interface AWSapigatewayImportApiRequest : AWSRequest


/**
 <p>Specifies how to interpret the base path of the API during import. Valid values are ignore, prepend, and split. The default value is ignore. To learn more, see <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-import-api-basePath.html">Set the OpenAPI basePath Property</a>. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable basepath;

/**
 <p>The OpenAPI definition. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 <p>Specifies whether to rollback the API creation when a warning is encountered. By default, API creation continues if a warning is encountered.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failOnWarnings;

@end

/**
 
 */
@interface AWSapigatewayImportApiResponse : AWSModel


/**
 <p>The URI of the API, of the form {api-id}.execute-api.{region}.amazonaws.com. The stage name is typically appended to this URI to form a complete path to a deployed API stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiEndpoint;

/**
 <p>The API ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>An API key selection expression. Supported only for WebSocket APIs. See <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API Key Selection Expressions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiKeySelectionExpression;

/**
 <p>A CORS configuration. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) AWSapigatewayCors * _Nullable corsConfiguration;

/**
 <p>The timestamp when the API was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The description of the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Avoid validating models when creating a deployment. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableSchemaValidation;

/**
 <p>The validation information during API import. This may include particular properties of your OpenAPI definition which are ignored during import. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable importInfo;

/**
 <p>The name of the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The API protocol.</p>
 */
@property (nonatomic, assign) AWSapigatewayProtocolType protocolType;

/**
 <p>The route selection expression for the API. For HTTP APIs, the routeSelectionExpression must be ${request.method} ${request.path}. If not provided, this will be the default for HTTP APIs. This property is required for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeSelectionExpression;

/**
 <p>A collection of tags associated with the API.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>A version identifier for the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

/**
 <p>The warning messages reported when failonwarnings is turned on during API import.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable warnings;

@end

/**
 <p>Represents an integration.</p>
 */
@interface AWSapigatewayIntegration : AWSModel


/**
 <p>Specifies whether an integration is managed by API Gateway. If you created an API using using quick create, the resulting integration is managed by API Gateway. You can update a managed integration, but you can't delete it.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable apiGatewayManaged;

/**
 <p>The ID of the VPC link for a private integration. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>The type of the network connection to the integration endpoint. Specify INTERNET for connections through the public routable internet or VPC_LINK for private connections between API Gateway and resources in a VPC. The default value is INTERNET.</p>
 */
@property (nonatomic, assign) AWSapigatewayConnectionType connectionType;

/**
 <p>Supported only for WebSocket APIs. Specifies how to handle response payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following behaviors:</p><p>CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the corresponding binary blob.</p><p>CONVERT_TO_TEXT: Converts a response payload from a binary blob to a Base64-encoded string.</p><p>If this property is not defined, the response payload will be passed through from the integration response to the route response or method response without modification.</p>
 */
@property (nonatomic, assign) AWSapigatewayContentHandlingStrategy contentHandlingStrategy;

/**
 <p>Specifies the credentials required for the integration, if any. For AWS integrations, three options are available. To specify an IAM Role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To require that the caller's identity be passed through from the request, specify the string arn:aws:iam::*:user/*. To use resource-based permissions on supported AWS services, specify null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable credentialsArn;

/**
 <p>Represents the description of an integration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Represents the identifier of an integration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationId;

/**
 <p>Specifies the integration's HTTP method type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationMethod;

/**
 <p>The integration response selection expression for the integration. Supported only for WebSocket APIs. See <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-integration-response-selection-expressions">Integration Response Selection Expressions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationResponseSelectionExpression;

/**
 <p>The integration type of an integration. One of the following:</p><p>AWS: for integrating the route or method request with an AWS service action, including the Lambda function-invoking action. With the Lambda function-invoking action, this is referred to as the Lambda custom integration. With any other AWS service action, this is known as AWS integration. Supported only for WebSocket APIs.</p><p>AWS_PROXY: for integrating the route or method request with the Lambda function-invoking action with the client request passed through as-is. This integration is also referred to as Lambda proxy integration.</p><p>HTTP: for integrating the route or method request with an HTTP endpoint. This integration is also referred to as the HTTP custom integration. Supported only for WebSocket APIs.</p><p>HTTP_PROXY: for integrating the route or method request with an HTTP endpoint, with the client request passed through as-is. This is also referred to as HTTP proxy integration.</p><p>MOCK: for integrating the route or method request with API Gateway as a "loopback" endpoint without invoking any backend. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, assign) AWSapigatewayIntegrationType integrationType;

/**
 <p>For a Lambda integration, specify the URI of a Lambda function.</p><p>For an HTTP integration, specify a fully-qualified URL.</p><p>For an HTTP API private integration, specify the ARN of an Application Load Balancer listener, Network Load Balancer listener, or AWS Cloud Map service. If you specify the ARN of an AWS Cloud Map service, API Gateway uses DiscoverInstances to identify resources. You can use query parameters to target specific resources. To learn more, see <a href="https://docs.aws.amazon.com/cloud-map/latest/api/API_DiscoverInstances.html">DiscoverInstances</a>. For private integrations, all resources must be owned by the same AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationUri;

/**
 <p>Specifies the pass-through behavior for incoming requests based on the Content-Type header in the request, and the available mapping templates specified as the requestTemplates property on the Integration resource. There are three valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, and NEVER. Supported only for WebSocket APIs.</p><p>WHEN_NO_MATCH passes the request body for unmapped content types through to the integration backend without transformation.</p><p>NEVER rejects unmapped content types with an HTTP 415 Unsupported Media Type response.</p><p>WHEN_NO_TEMPLATES allows pass-through when the integration has no content types mapped to templates. However, if there is at least one content type defined, unmapped content types will be rejected with the same HTTP 415 Unsupported Media Type response.</p>
 */
@property (nonatomic, assign) AWSapigatewayPassthroughBehavior passthroughBehavior;

/**
 <p>Specifies the format of the payload sent to an integration. Required for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable payloadFormatVersion;

/**
 <p>A key-value map specifying request parameters that are passed from the method request to the backend. The key is an integration request parameter name and the associated value is a method request parameter value or static value that must be enclosed within single quotes and pre-encoded as required by the backend. The method request parameter value must match the pattern of method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>, where<replaceable>{location}</replaceable> is querystring, path, or header; and<replaceable>{name}</replaceable> must be a valid and unique method request parameter name. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestParameters;

/**
 <p>Represents a map of Velocity templates that are applied on the request payload based on the value of the Content-Type header sent by the client. The content type value is the key in this map, and the template (as a String) is the value. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestTemplates;

/**
 <p>The template selection expression for the integration. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateSelectionExpression;

/**
 <p>Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and between 50 and 30,000 milliseconds for HTTP APIs. The default timeout is 29 seconds for WebSocket APIs and 30 seconds for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutInMillis;

/**
 <p>The TLS configuration for a private integration. If you specify a TLS configuration, private integration traffic uses the HTTPS protocol. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) AWSapigatewayTlsConfig * _Nullable tlsConfig;

@end

/**
 <p>Represents an integration response.</p>
 Required parameters: [IntegrationResponseKey]
 */
@interface AWSapigatewayIntegrationResponse : AWSModel


/**
 <p>Supported only for WebSocket APIs. Specifies how to handle response payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following behaviors:</p><p>CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the corresponding binary blob.</p><p>CONVERT_TO_TEXT: Converts a response payload from a binary blob to a Base64-encoded string.</p><p>If this property is not defined, the response payload will be passed through from the integration response to the route response or method response without modification.</p>
 */
@property (nonatomic, assign) AWSapigatewayContentHandlingStrategy contentHandlingStrategy;

/**
 <p>The integration response ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationResponseId;

/**
 <p>The integration response key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationResponseKey;

/**
 <p>A key-value map specifying response parameters that are passed to the method response from the backend. The key is a method response header parameter name and the mapped value is an integration response header value, a static value enclosed within a pair of single quotes, or a JSON expression from the integration response body. The mapping key must match the pattern of method.response.header.{name}, where name is a valid and unique header name. The mapped non-static value must match the pattern of integration.response.header.{name} or integration.response.body.{JSON-expression}, where name is a valid and unique response header name and JSON-expression is a valid JSON expression without the $ prefix.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable responseParameters;

/**
 <p>The collection of response templates for the integration response as a string-to-string map of key-value pairs. Response templates are represented as a key/value map, with a content-type as the key and a template as the value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable responseTemplates;

/**
 <p>The template selection expressions for the integration response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateSelectionExpression;

@end

/**
 <p>Represents a collection of integration responses.</p>
 */
@interface AWSapigatewayIntegrationResponses : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayIntegrationResponse *> * _Nullable items;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Represents a collection of integrations.</p>
 */
@interface AWSapigatewayIntegrations : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayIntegration *> * _Nullable items;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Represents the configuration of a JWT authorizer. Required for the JWT authorizer type. Supported only for HTTP APIs.</p>
 */
@interface AWSapigatewayJWTConfiguration : AWSModel


/**
 <p>A list of the intended recipients of the JWT. A valid JWT must provide an aud that matches at least one entry in this list. See <a href="https://tools.ietf.org/html/rfc7519#section-4.1.3">RFC 7519</a>. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable audience;

/**
 <p>The base domain of the identity provider that issues JSON Web Tokens. For example, an Amazon Cognito user pool has the following format: https://cognito-idp.<replaceable>{region}</replaceable>.amazonaws.com/<replaceable>{userPoolId}</replaceable>. Required for the JWT authorizer type. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable issuer;

@end

/**
 <p>A limit has been exceeded. See the accompanying error message for details.</p>
 */
@interface AWSapigatewayLimitExceededException : AWSModel


/**
 <p>The limit type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable limitType;

/**
 <p>Describes the error encountered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Represents a data model for an API. Supported only for WebSocket APIs. See <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/models-mappings.html">Create Models and Mapping Templates for Request and Response Mappings</a>.</p>
 Required parameters: [Name]
 */
@interface AWSapigatewayModel : AWSModel


/**
 <p>The content-type for the model, for example, "application/json".</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The description of the model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The model identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelId;

/**
 <p>The name of the model. Must be alphanumeric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The schema for the model. For application/json models, this should be JSON schema draft 4 model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schema;

@end

/**
 <p>Represents a collection of data models. See <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/models-mappings.html">Create Models and Mapping Templates for Request and Response Mappings</a>.</p>
 */
@interface AWSapigatewayModels : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayModel *> * _Nullable items;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Validation constraints imposed on parameters of a request (path, query string, headers).</p>
 */
@interface AWSapigatewayParameterConstraints : AWSModel


/**
 <p>Whether or not the parameter is required.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable required;

@end

/**
 <p>Overwrites the configuration of an existing API using the provided definition. Supported only for HTTP APIs.</p>
 Required parameters: [Body]
 */
@interface AWSapigatewayReimportApiInput : AWSModel


/**
 <p>The OpenAPI definition. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

@end

/**
 <p></p>
 Required parameters: [ApiId, Body]
 */
@interface AWSapigatewayReimportApiRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>Specifies how to interpret the base path of the API during import. Valid values are ignore, prepend, and split. The default value is ignore. To learn more, see <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-import-api-basePath.html">Set the OpenAPI basePath Property</a>. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable basepath;

/**
 <p>The OpenAPI definition. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 <p>Specifies whether to rollback the API creation when a warning is encountered. By default, API creation continues if a warning is encountered.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failOnWarnings;

@end

/**
 
 */
@interface AWSapigatewayReimportApiResponse : AWSModel


/**
 <p>The URI of the API, of the form {api-id}.execute-api.{region}.amazonaws.com. The stage name is typically appended to this URI to form a complete path to a deployed API stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiEndpoint;

/**
 <p>The API ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>An API key selection expression. Supported only for WebSocket APIs. See <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API Key Selection Expressions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiKeySelectionExpression;

/**
 <p>A CORS configuration. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) AWSapigatewayCors * _Nullable corsConfiguration;

/**
 <p>The timestamp when the API was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The description of the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Avoid validating models when creating a deployment. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableSchemaValidation;

/**
 <p>The validation information during API import. This may include particular properties of your OpenAPI definition which are ignored during import. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable importInfo;

/**
 <p>The name of the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The API protocol.</p>
 */
@property (nonatomic, assign) AWSapigatewayProtocolType protocolType;

/**
 <p>The route selection expression for the API. For HTTP APIs, the routeSelectionExpression must be ${request.method} ${request.path}. If not provided, this will be the default for HTTP APIs. This property is required for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeSelectionExpression;

/**
 <p>A collection of tags associated with the API.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>A version identifier for the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

/**
 <p>The warning messages reported when failonwarnings is turned on during API import.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable warnings;

@end

/**
 <p>Represents a route.</p>
 Required parameters: [RouteKey]
 */
@interface AWSapigatewayRoute : AWSModel


/**
 <p>Specifies whether a route is managed by API Gateway. If you created an API using quick create, the $default route is managed by API Gateway. You can't modify the $default route key.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable apiGatewayManaged;

/**
 <p>Specifies whether an API key is required for this route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable apiKeyRequired;

/**
 <p>A list of authorization scopes configured on a route. The scopes are used with a JWT authorizer to authorize the method invocation. The authorization works by matching the route scopes against the scopes parsed from the access token in the incoming request. The method invocation is authorized if any route scope matches a claimed scope in the access token. Otherwise, the invocation is not authorized. When the route scope is configured, the client must provide an access token instead of an identity token for authorization purposes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable authorizationScopes;

/**
 <p>The authorization type for the route. For WebSocket APIs, valid values are NONE for open access, AWS_IAM for using AWS IAM permissions, and CUSTOM for using a Lambda authorizer For HTTP APIs, valid values are NONE for open access, or JWT for using JSON Web Tokens.</p>
 */
@property (nonatomic, assign) AWSapigatewayAuthorizationType authorizationType;

/**
 <p>The identifier of the Authorizer resource to be associated with this route. The authorizer identifier is generated by API Gateway when you created the authorizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerId;

/**
 <p>The model selection expression for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelSelectionExpression;

/**
 <p>The operation name for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationName;

/**
 <p>The request models for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestModels;

/**
 <p>The request parameters for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSapigatewayParameterConstraints *> * _Nullable requestParameters;

/**
 <p>The route ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeId;

/**
 <p>The route key for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeKey;

/**
 <p>The route response selection expression for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeResponseSelectionExpression;

/**
 <p>The target for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

@end

/**
 <p>Represents a route response.</p>
 Required parameters: [RouteResponseKey]
 */
@interface AWSapigatewayRouteResponse : AWSModel


/**
 <p>Represents the model selection expression of a route response. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelSelectionExpression;

/**
 <p>Represents the response models of a route response.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable responseModels;

/**
 <p>Represents the response parameters of a route response.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSapigatewayParameterConstraints *> * _Nullable responseParameters;

/**
 <p>Represents the identifier of a route response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeResponseId;

/**
 <p>Represents the route response key of a route response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeResponseKey;

@end

/**
 <p>Represents a collection of route responses.</p>
 */
@interface AWSapigatewayRouteResponses : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayRouteResponse *> * _Nullable items;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Represents a collection of route settings.</p>
 */
@interface AWSapigatewayRouteSettings : AWSModel


/**
 <p>Specifies whether (true) or not (false) data trace logging is enabled for this route. This property affects the log entries pushed to Amazon CloudWatch Logs. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dataTraceEnabled;

/**
 <p>Specifies whether detailed metrics are enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable detailedMetricsEnabled;

/**
 <p>Specifies the logging level for this route: INFO, ERROR, or OFF. This property affects the log entries pushed to Amazon CloudWatch Logs. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, assign) AWSapigatewayLoggingLevel loggingLevel;

/**
 <p>Specifies the throttling burst limit.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable throttlingBurstLimit;

/**
 <p>Specifies the throttling rate limit.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable throttlingRateLimit;

@end

/**
 <p>Represents a collection of routes.</p>
 */
@interface AWSapigatewayRoutes : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayRoute *> * _Nullable items;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Represents an API stage.</p>
 Required parameters: [StageName]
 */
@interface AWSapigatewayStage : AWSModel


/**
 <p>Settings for logging access in this stage.</p>
 */
@property (nonatomic, strong) AWSapigatewayAccessLogSettings * _Nullable accessLogSettings;

/**
 <p>Specifies whether a stage is managed by API Gateway. If you created an API using quick create, the $default stage is managed by API Gateway. You can't modify the $default stage.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable apiGatewayManaged;

/**
 <p>Specifies whether updates to an API automatically trigger a new deployment. The default value is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoDeploy;

/**
 <p>The identifier of a client certificate for a Stage. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientCertificateId;

/**
 <p>The timestamp when the stage was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>Default route settings for the stage.</p>
 */
@property (nonatomic, strong) AWSapigatewayRouteSettings * _Nullable defaultRouteSettings;

/**
 <p>The identifier of the Deployment that the Stage is associated with. Can't be updated if autoDeploy is enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p>The description of the stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Describes the status of the last deployment of a stage. Supported only for stages with autoDeploy enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastDeploymentStatusMessage;

/**
 <p>The timestamp when the stage was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDate;

/**
 <p>Route settings for the stage, by routeKey.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSapigatewayRouteSettings *> * _Nullable routeSettings;

/**
 <p>The name of the stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stageName;

/**
 <p>A map that defines the stage variables for a stage resource. Variable names can have alphanumeric and underscore characters, and the values must match [A-Za-z0-9-._~:/?#&amp;=,]+.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable stageVariables;

/**
 <p>The collection of tags. Each tag element is associated with a given resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>A collection of Stage resources that are associated with the ApiKey resource.</p>
 */
@interface AWSapigatewayStages : AWSModel


/**
 <p>The elements from this collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayStage *> * _Nullable items;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Represents the input parameters for a TagResource request.</p>
 */
@interface AWSapigatewayTagResourceInput : AWSModel


/**
 <p>The collection of tags. Each tag element is associated with a given resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Creates a new Tag resource to represent a tag.</p>
 Required parameters: [ResourceArn]
 */
@interface AWSapigatewayTagResourceRequest : AWSRequest


/**
 <p>The resource ARN for the tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The collection of tags. Each tag element is associated with a given resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSapigatewayTagResourceResponse : AWSModel


@end

/**
 <p>Represents a template.</p>
 */
@interface AWSapigatewayTemplate : AWSModel


/**
 <p>The template value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>The TLS configuration for a private integration. If you specify a TLS configuration, private integration traffic uses the HTTPS protocol. Supported only for HTTP APIs.</p>
 */
@interface AWSapigatewayTlsConfig : AWSModel


/**
 <p>If you specify a server name, API Gateway uses it to verify the hostname on the integration's certificate. The server name is also included in the TLS handshake to support Server Name Indication (SNI) or virtual hosting.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverNameToVerify;

@end

/**
 <p>The TLS configuration for a private integration. If you specify a TLS configuration, private integration traffic uses the HTTPS protocol. Supported only for HTTP APIs.</p>
 */
@interface AWSapigatewayTlsConfigInput : AWSModel


/**
 <p>If you specify a server name, API Gateway uses it to verify the hostname on the integration's certificate. The server name is also included in the TLS handshake to support Server Name Indication (SNI) or virtual hosting.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverNameToVerify;

@end

/**
 
 */
@interface AWSapigatewayUntagResourceRequest : AWSRequest


/**
 <p>The resource ARN for the tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The Tag keys to delete</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 <p>Represents the input parameters for an UpdateApi request.</p>
 */
@interface AWSapigatewayUpdateApiInput : AWSModel


/**
 <p>An API key selection expression. Supported only for WebSocket APIs. See <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API Key Selection Expressions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiKeySelectionExpression;

/**
 <p>A CORS configuration. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) AWSapigatewayCors * _Nullable corsConfiguration;

/**
 <p>This property is part of quick create. It specifies the credentials required for the integration, if any. For a Lambda integration, three options are available. To specify an IAM Role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To require that the caller's identity be passed through from the request, specify arn:aws:iam::*:user/*. To use resource-based permissions on supported AWS services, specify null. Currently, this property is not used for HTTP integrations. If provided, this value replaces the credentials associated with the quick create integration. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable credentialsArn;

/**
 <p>The description of the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Avoid validating models when creating a deployment. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableSchemaValidation;

/**
 <p>The name of the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>This property is part of quick create. If not specified, the route created using quick create is kept. Otherwise, this value replaces the route key of the quick create route. Additional routes may still be added after the API is updated. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeKey;

/**
 <p>The route selection expression for the API. For HTTP APIs, the routeSelectionExpression must be ${request.method} ${request.path}. If not provided, this will be the default for HTTP APIs. This property is required for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeSelectionExpression;

/**
 <p>This property is part of quick create. For HTTP integrations, specify a fully qualified URL. For Lambda integrations, specify a function ARN. The type of the integration will be HTTP_PROXY or AWS_PROXY, respectively. The value provided updates the integration URI and integration type. You can update a quick-created target, but you can't remove it from an API. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

/**
 <p>A version identifier for the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>Represents the input parameters for an UpdateApiMapping request.</p>
 */
@interface AWSapigatewayUpdateApiMappingInput : AWSModel


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The API mapping key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiMappingKey;

/**
 <p>The API stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stage;

@end

/**
 <p>Updates an ApiMapping.</p>
 Required parameters: [ApiMappingId, ApiId, DomainName]
 */
@interface AWSapigatewayUpdateApiMappingRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The API mapping identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiMappingId;

/**
 <p>The API mapping key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiMappingKey;

/**
 <p>The domain name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The API stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stage;

@end

/**
 
 */
@interface AWSapigatewayUpdateApiMappingResponse : AWSModel


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The API mapping identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiMappingId;

/**
 <p>The API mapping key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiMappingKey;

/**
 <p>The API stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stage;

@end

/**
 <p>Updates an Api.</p>
 Required parameters: [ApiId]
 */
@interface AWSapigatewayUpdateApiRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>An API key selection expression. Supported only for WebSocket APIs. See <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API Key Selection Expressions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiKeySelectionExpression;

/**
 <p>A CORS configuration. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) AWSapigatewayCors * _Nullable corsConfiguration;

/**
 <p>This property is part of quick create. It specifies the credentials required for the integration, if any. For a Lambda integration, three options are available. To specify an IAM Role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To require that the caller's identity be passed through from the request, specify arn:aws:iam::*:user/*. To use resource-based permissions on supported AWS services, specify null. Currently, this property is not used for HTTP integrations. If provided, this value replaces the credentials associated with the quick create integration. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable credentialsArn;

/**
 <p>The description of the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Avoid validating models when creating a deployment. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableSchemaValidation;

/**
 <p>The name of the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>This property is part of quick create. If not specified, the route created using quick create is kept. Otherwise, this value replaces the route key of the quick create route. Additional routes may still be added after the API is updated. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeKey;

/**
 <p>The route selection expression for the API. For HTTP APIs, the routeSelectionExpression must be ${request.method} ${request.path}. If not provided, this will be the default for HTTP APIs. This property is required for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeSelectionExpression;

/**
 <p>This property is part of quick create. For HTTP integrations, specify a fully qualified URL. For Lambda integrations, specify a function ARN. The type of the integration will be HTTP_PROXY or AWS_PROXY, respectively. The value provided updates the integration URI and integration type. You can update a quick-created target, but you can't remove it from an API. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

/**
 <p>A version identifier for the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSapigatewayUpdateApiResponse : AWSModel


/**
 <p>The URI of the API, of the form {api-id}.execute-api.{region}.amazonaws.com. The stage name is typically appended to this URI to form a complete path to a deployed API stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiEndpoint;

/**
 <p>The API ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>An API key selection expression. Supported only for WebSocket APIs. See <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API Key Selection Expressions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiKeySelectionExpression;

/**
 <p>A CORS configuration. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) AWSapigatewayCors * _Nullable corsConfiguration;

/**
 <p>The timestamp when the API was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The description of the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Avoid validating models when creating a deployment. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableSchemaValidation;

/**
 <p>The validation information during API import. This may include particular properties of your OpenAPI definition which are ignored during import. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable importInfo;

/**
 <p>The name of the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The API protocol.</p>
 */
@property (nonatomic, assign) AWSapigatewayProtocolType protocolType;

/**
 <p>The route selection expression for the API. For HTTP APIs, the routeSelectionExpression must be ${request.method} ${request.path}. If not provided, this will be the default for HTTP APIs. This property is required for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeSelectionExpression;

/**
 <p>A collection of tags associated with the API.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>A version identifier for the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

/**
 <p>The warning messages reported when failonwarnings is turned on during API import.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable warnings;

@end

/**
 <p>The input parameters for an UpdateAuthorizer request.</p>
 */
@interface AWSapigatewayUpdateAuthorizerInput : AWSModel


/**
 <p>Specifies the required credentials as an IAM role for API Gateway to invoke the authorizer. To specify an IAM role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To use resource-based permissions on the Lambda function, specify null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerCredentialsArn;

/**
 <p>Authorizer caching is not currently supported. Don't specify this value for authorizers.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable authorizerResultTtlInSeconds;

/**
 <p>The authorizer type. For WebSocket APIs, specify REQUEST for a Lambda function using incoming request parameters. For HTTP APIs, specify JWT to use JSON Web Tokens.</p>
 */
@property (nonatomic, assign) AWSapigatewayAuthorizerType authorizerType;

/**
 <p>The authorizer's Uniform Resource Identifier (URI). For REQUEST authorizers, this must be a well-formed Lambda function URI, for example, arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:<replaceable>{account_id}</replaceable>:function:<replaceable>{lambda_function_name}</replaceable>/invocations. In general, the URI has this form: arn:aws:apigateway:<replaceable>{region}</replaceable>:lambda:path/<replaceable>{service_api}</replaceable>, where <replaceable></replaceable>{region} is the same as the region hosting the Lambda function, path indicates that the remaining substring in the URI should be treated as the path to the resource, including the initial /. For Lambda functions, this is usually of the form /2015-03-31/functions/[FunctionARN]/invocations. Supported only for REQUEST authorizers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerUri;

/**
 <p>The identity source for which authorization is requested.</p><p>For a REQUEST authorizer, this is optional. The value is a set of one or more mapping expressions of the specified request parameters. Currently, the identity source can be headers, query string parameters, stage variables, and context parameters. For example, if an Auth header and a Name query string parameter are defined as identity sources, this value is route.request.header.Auth, route.request.querystring.Name. These parameters will be used to perform runtime validation for Lambda-based authorizers by verifying all of the identity-related request parameters are present in the request, not null, and non-empty. Only when this is true does the authorizer invoke the authorizer Lambda function. Otherwise, it returns a 401 Unauthorized response without calling the Lambda function.</p><p>For JWT, a single entry that specifies where to extract the JSON Web Token (JWT) from inbound requests. Currently only header-based and query parameter-based selections are supported, for example "$request.header.Authorization".</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable identitySource;

/**
 <p>This parameter is not used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityValidationExpression;

/**
 <p>Represents the configuration of a JWT authorizer. Required for the JWT authorizer type. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) AWSapigatewayJWTConfiguration * _Nullable jwtConfiguration;

/**
 <p>The name of the authorizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Updates an Authorizer.</p>
 Required parameters: [AuthorizerId, ApiId]
 */
@interface AWSapigatewayUpdateAuthorizerRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>Specifies the required credentials as an IAM role for API Gateway to invoke the authorizer. To specify an IAM role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To use resource-based permissions on the Lambda function, specify null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerCredentialsArn;

/**
 <p>The authorizer identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerId;

/**
 <p>Authorizer caching is not currently supported. Don't specify this value for authorizers.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable authorizerResultTtlInSeconds;

/**
 <p>The authorizer type. For WebSocket APIs, specify REQUEST for a Lambda function using incoming request parameters. For HTTP APIs, specify JWT to use JSON Web Tokens.</p>
 */
@property (nonatomic, assign) AWSapigatewayAuthorizerType authorizerType;

/**
 <p>The authorizer's Uniform Resource Identifier (URI). For REQUEST authorizers, this must be a well-formed Lambda function URI, for example, arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:<replaceable>{account_id}</replaceable>:function:<replaceable>{lambda_function_name}</replaceable>/invocations. In general, the URI has this form: arn:aws:apigateway:<replaceable>{region}</replaceable>:lambda:path/<replaceable>{service_api}</replaceable>, where <replaceable></replaceable>{region} is the same as the region hosting the Lambda function, path indicates that the remaining substring in the URI should be treated as the path to the resource, including the initial /. For Lambda functions, this is usually of the form /2015-03-31/functions/[FunctionARN]/invocations. Supported only for REQUEST authorizers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerUri;

/**
 <p>The identity source for which authorization is requested.</p><p>For a REQUEST authorizer, this is optional. The value is a set of one or more mapping expressions of the specified request parameters. Currently, the identity source can be headers, query string parameters, stage variables, and context parameters. For example, if an Auth header and a Name query string parameter are defined as identity sources, this value is route.request.header.Auth, route.request.querystring.Name. These parameters will be used to perform runtime validation for Lambda-based authorizers by verifying all of the identity-related request parameters are present in the request, not null, and non-empty. Only when this is true does the authorizer invoke the authorizer Lambda function. Otherwise, it returns a 401 Unauthorized response without calling the Lambda function.</p><p>For JWT, a single entry that specifies where to extract the JSON Web Token (JWT) from inbound requests. Currently only header-based and query parameter-based selections are supported, for example "$request.header.Authorization".</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable identitySource;

/**
 <p>This parameter is not used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityValidationExpression;

/**
 <p>Represents the configuration of a JWT authorizer. Required for the JWT authorizer type. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) AWSapigatewayJWTConfiguration * _Nullable jwtConfiguration;

/**
 <p>The name of the authorizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSapigatewayUpdateAuthorizerResponse : AWSModel


/**
 <p>Specifies the required credentials as an IAM role for API Gateway to invoke the authorizer. To specify an IAM role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To use resource-based permissions on the Lambda function, specify null. Supported only for REQUEST authorizers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerCredentialsArn;

/**
 <p>The authorizer identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerId;

/**
 <p>Authorizer caching is not currently supported. Don't specify this value for authorizers.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable authorizerResultTtlInSeconds;

/**
 <p>The authorizer type. For WebSocket APIs, specify REQUEST for a Lambda function using incoming request parameters. For HTTP APIs, specify JWT to use JSON Web Tokens.</p>
 */
@property (nonatomic, assign) AWSapigatewayAuthorizerType authorizerType;

/**
 <p>The authorizer's Uniform Resource Identifier (URI). ForREQUEST authorizers, this must be a well-formed Lambda function URI, for example, arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:<replaceable>{account_id}</replaceable>:function:<replaceable>{lambda_function_name}</replaceable>/invocations. In general, the URI has this form: arn:aws:apigateway:<replaceable>{region}</replaceable>:lambda:path/<replaceable>{service_api}</replaceable>, where <replaceable></replaceable>{region} is the same as the region hosting the Lambda function, path indicates that the remaining substring in the URI should be treated as the path to the resource, including the initial /. For Lambda functions, this is usually of the form /2015-03-31/functions/[FunctionARN]/invocations. Supported only for REQUEST authorizers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerUri;

/**
 <p>The identity source for which authorization is requested.</p><p>For a REQUEST authorizer, this is optional. The value is a set of one or more mapping expressions of the specified request parameters. Currently, the identity source can be headers, query string parameters, stage variables, and context parameters. For example, if an Auth header and a Name query string parameter are defined as identity sources, this value is route.request.header.Auth, route.request.querystring.Name. These parameters will be used to perform runtime validation for Lambda-based authorizers by verifying all of the identity-related request parameters are present in the request, not null, and non-empty. Only when this is true does the authorizer invoke the authorizer Lambda function. Otherwise, it returns a 401 Unauthorized response without calling the Lambda function.</p><p>For JWT, a single entry that specifies where to extract the JSON Web Token (JWT) from inbound requests. Currently only header-based and query parameter-based selections are supported, for example "$request.header.Authorization".</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable identitySource;

/**
 <p>The validation expression does not apply to the REQUEST authorizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityValidationExpression;

/**
 <p>Represents the configuration of a JWT authorizer. Required for the JWT authorizer type. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) AWSapigatewayJWTConfiguration * _Nullable jwtConfiguration;

/**
 <p>The name of the authorizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Represents the input parameters for an UpdateDeployment request.</p>
 */
@interface AWSapigatewayUpdateDeploymentInput : AWSModel


/**
 <p>The description for the deployment resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 <p>Updates a Deployment.</p>
 Required parameters: [ApiId, DeploymentId]
 */
@interface AWSapigatewayUpdateDeploymentRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The deployment ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p>The description for the deployment resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 
 */
@interface AWSapigatewayUpdateDeploymentResponse : AWSModel


/**
 <p>Specifies whether a deployment was automatically released.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoDeployed;

/**
 <p>The date and time when the Deployment resource was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The identifier for the deployment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p>The status of the deployment: PENDING, FAILED, or SUCCEEDED.</p>
 */
@property (nonatomic, assign) AWSapigatewayDeploymentStatus deploymentStatus;

/**
 <p>May contain additional feedback on the status of an API deployment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentStatusMessage;

/**
 <p>The description for the deployment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 <p>Represents the input parameters for an UpdateDomainName request.</p>
 */
@interface AWSapigatewayUpdateDomainNameInput : AWSModel


/**
 <p>The domain name configurations.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayDomainNameConfiguration *> * _Nullable domainNameConfigurations;

@end

/**
 <p>Updates a DomainName.</p>
 Required parameters: [DomainName]
 */
@interface AWSapigatewayUpdateDomainNameRequest : AWSRequest


/**
 <p>The domain name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The domain name configurations.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayDomainNameConfiguration *> * _Nullable domainNameConfigurations;

@end

/**
 
 */
@interface AWSapigatewayUpdateDomainNameResponse : AWSModel


/**
 <p>The API mapping selection expression.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiMappingSelectionExpression;

/**
 <p>The name of the DomainName resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The domain name configurations.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayDomainNameConfiguration *> * _Nullable domainNameConfigurations;

/**
 <p>The collection of tags associated with a domain name.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Represents the input parameters for an UpdateIntegration request.</p>
 */
@interface AWSapigatewayUpdateIntegrationInput : AWSModel


/**
 <p>The ID of the VPC link for a private integration. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>The type of the network connection to the integration endpoint. Specify INTERNET for connections through the public routable internet or VPC_LINK for private connections between API Gateway and resources in a VPC. The default value is INTERNET.</p>
 */
@property (nonatomic, assign) AWSapigatewayConnectionType connectionType;

/**
 <p>Supported only for WebSocket APIs. Specifies how to handle response payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following behaviors:</p><p>CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the corresponding binary blob.</p><p>CONVERT_TO_TEXT: Converts a response payload from a binary blob to a Base64-encoded string.</p><p>If this property is not defined, the response payload will be passed through from the integration response to the route response or method response without modification.</p>
 */
@property (nonatomic, assign) AWSapigatewayContentHandlingStrategy contentHandlingStrategy;

/**
 <p>Specifies the credentials required for the integration, if any. For AWS integrations, three options are available. To specify an IAM Role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To require that the caller's identity be passed through from the request, specify the string arn:aws:iam::*:user/*. To use resource-based permissions on supported AWS services, specify null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable credentialsArn;

/**
 <p>The description of the integration</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Specifies the integration's HTTP method type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationMethod;

/**
 <p>The integration type of an integration. One of the following:</p><p>AWS: for integrating the route or method request with an AWS service action, including the Lambda function-invoking action. With the Lambda function-invoking action, this is referred to as the Lambda custom integration. With any other AWS service action, this is known as AWS integration. Supported only for WebSocket APIs.</p><p>AWS_PROXY: for integrating the route or method request with the Lambda function-invoking action with the client request passed through as-is. This integration is also referred to as Lambda proxy integration.</p><p>HTTP: for integrating the route or method request with an HTTP endpoint. This integration is also referred to as the HTTP custom integration. Supported only for WebSocket APIs.</p><p>HTTP_PROXY: for integrating the route or method request with an HTTP endpoint, with the client request passed through as-is. This is also referred to as HTTP proxy integration. For HTTP API private integrations, use an HTTP_PROXY integration.</p><p>MOCK: for integrating the route or method request with API Gateway as a "loopback" endpoint without invoking any backend. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, assign) AWSapigatewayIntegrationType integrationType;

/**
 <p>For a Lambda integration, specify the URI of a Lambda function.</p><p>For an HTTP integration, specify a fully-qualified URL.</p><p>For an HTTP API private integration, specify the ARN of an Application Load Balancer listener, Network Load Balancer listener, or AWS Cloud Map service. If you specify the ARN of an AWS Cloud Map service, API Gateway uses DiscoverInstances to identify resources. You can use query parameters to target specific resources. To learn more, see <a href="https://docs.aws.amazon.com/cloud-map/latest/api/API_DiscoverInstances.html">DiscoverInstances</a>. For private integrations, all resources must be owned by the same AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationUri;

/**
 <p>Specifies the pass-through behavior for incoming requests based on the Content-Type header in the request, and the available mapping templates specified as the requestTemplates property on the Integration resource. There are three valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, and NEVER. Supported only for WebSocket APIs.</p><p>WHEN_NO_MATCH passes the request body for unmapped content types through to the integration backend without transformation.</p><p>NEVER rejects unmapped content types with an HTTP 415 Unsupported Media Type response.</p><p>WHEN_NO_TEMPLATES allows pass-through when the integration has no content types mapped to templates. However, if there is at least one content type defined, unmapped content types will be rejected with the same HTTP 415 Unsupported Media Type response.</p>
 */
@property (nonatomic, assign) AWSapigatewayPassthroughBehavior passthroughBehavior;

/**
 <p>Specifies the format of the payload sent to an integration. Required for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable payloadFormatVersion;

/**
 <p>A key-value map specifying request parameters that are passed from the method request to the backend. The key is an integration request parameter name and the associated value is a method request parameter value or static value that must be enclosed within single quotes and pre-encoded as required by the backend. The method request parameter value must match the pattern of method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>, where<replaceable>{location}</replaceable> is querystring, path, or header; and<replaceable>{name}</replaceable> must be a valid and unique method request parameter name. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestParameters;

/**
 <p>Represents a map of Velocity templates that are applied on the request payload based on the value of the Content-Type header sent by the client. The content type value is the key in this map, and the template (as a String) is the value. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestTemplates;

/**
 <p>The template selection expression for the integration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateSelectionExpression;

/**
 <p>Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and between 50 and 30,000 milliseconds for HTTP APIs. The default timeout is 29 seconds for WebSocket APIs and 30 seconds for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutInMillis;

/**
 <p>The TLS configuration for a private integration. If you specify a TLS configuration, private integration traffic uses the HTTPS protocol. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) AWSapigatewayTlsConfigInput * _Nullable tlsConfig;

@end

/**
 <p>Updates an Integration.</p>
 Required parameters: [ApiId, IntegrationId]
 */
@interface AWSapigatewayUpdateIntegrationRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The ID of the VPC link for a private integration. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>The type of the network connection to the integration endpoint. Specify INTERNET for connections through the public routable internet or VPC_LINK for private connections between API Gateway and resources in a VPC. The default value is INTERNET.</p>
 */
@property (nonatomic, assign) AWSapigatewayConnectionType connectionType;

/**
 <p>Supported only for WebSocket APIs. Specifies how to handle response payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following behaviors:</p><p>CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the corresponding binary blob.</p><p>CONVERT_TO_TEXT: Converts a response payload from a binary blob to a Base64-encoded string.</p><p>If this property is not defined, the response payload will be passed through from the integration response to the route response or method response without modification.</p>
 */
@property (nonatomic, assign) AWSapigatewayContentHandlingStrategy contentHandlingStrategy;

/**
 <p>Specifies the credentials required for the integration, if any. For AWS integrations, three options are available. To specify an IAM Role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To require that the caller's identity be passed through from the request, specify the string arn:aws:iam::*:user/*. To use resource-based permissions on supported AWS services, specify null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable credentialsArn;

/**
 <p>The description of the integration</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The integration ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationId;

/**
 <p>Specifies the integration's HTTP method type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationMethod;

/**
 <p>The integration type of an integration. One of the following:</p><p>AWS: for integrating the route or method request with an AWS service action, including the Lambda function-invoking action. With the Lambda function-invoking action, this is referred to as the Lambda custom integration. With any other AWS service action, this is known as AWS integration. Supported only for WebSocket APIs.</p><p>AWS_PROXY: for integrating the route or method request with the Lambda function-invoking action with the client request passed through as-is. This integration is also referred to as Lambda proxy integration.</p><p>HTTP: for integrating the route or method request with an HTTP endpoint. This integration is also referred to as the HTTP custom integration. Supported only for WebSocket APIs.</p><p>HTTP_PROXY: for integrating the route or method request with an HTTP endpoint, with the client request passed through as-is. This is also referred to as HTTP proxy integration. For HTTP API private integrations, use an HTTP_PROXY integration.</p><p>MOCK: for integrating the route or method request with API Gateway as a "loopback" endpoint without invoking any backend. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, assign) AWSapigatewayIntegrationType integrationType;

/**
 <p>For a Lambda integration, specify the URI of a Lambda function.</p><p>For an HTTP integration, specify a fully-qualified URL.</p><p>For an HTTP API private integration, specify the ARN of an Application Load Balancer listener, Network Load Balancer listener, or AWS Cloud Map service. If you specify the ARN of an AWS Cloud Map service, API Gateway uses DiscoverInstances to identify resources. You can use query parameters to target specific resources. To learn more, see <a href="https://docs.aws.amazon.com/cloud-map/latest/api/API_DiscoverInstances.html">DiscoverInstances</a>. For private integrations, all resources must be owned by the same AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationUri;

/**
 <p>Specifies the pass-through behavior for incoming requests based on the Content-Type header in the request, and the available mapping templates specified as the requestTemplates property on the Integration resource. There are three valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, and NEVER. Supported only for WebSocket APIs.</p><p>WHEN_NO_MATCH passes the request body for unmapped content types through to the integration backend without transformation.</p><p>NEVER rejects unmapped content types with an HTTP 415 Unsupported Media Type response.</p><p>WHEN_NO_TEMPLATES allows pass-through when the integration has no content types mapped to templates. However, if there is at least one content type defined, unmapped content types will be rejected with the same HTTP 415 Unsupported Media Type response.</p>
 */
@property (nonatomic, assign) AWSapigatewayPassthroughBehavior passthroughBehavior;

/**
 <p>Specifies the format of the payload sent to an integration. Required for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable payloadFormatVersion;

/**
 <p>A key-value map specifying request parameters that are passed from the method request to the backend. The key is an integration request parameter name and the associated value is a method request parameter value or static value that must be enclosed within single quotes and pre-encoded as required by the backend. The method request parameter value must match the pattern of method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>, where<replaceable>{location}</replaceable> is querystring, path, or header; and<replaceable>{name}</replaceable> must be a valid and unique method request parameter name. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestParameters;

/**
 <p>Represents a map of Velocity templates that are applied on the request payload based on the value of the Content-Type header sent by the client. The content type value is the key in this map, and the template (as a String) is the value. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestTemplates;

/**
 <p>The template selection expression for the integration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateSelectionExpression;

/**
 <p>Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and between 50 and 30,000 milliseconds for HTTP APIs. The default timeout is 29 seconds for WebSocket APIs and 30 seconds for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutInMillis;

/**
 <p>The TLS configuration for a private integration. If you specify a TLS configuration, private integration traffic uses the HTTPS protocol. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) AWSapigatewayTlsConfigInput * _Nullable tlsConfig;

@end

/**
 
 */
@interface AWSapigatewayUpdateIntegrationResult : AWSModel


/**
 <p>Specifies whether an integration is managed by API Gateway. If you created an API using using quick create, the resulting integration is managed by API Gateway. You can update a managed integration, but you can't delete it.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable apiGatewayManaged;

/**
 <p>The ID of the VPC link for a private integration. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>The type of the network connection to the integration endpoint. Specify INTERNET for connections through the public routable internet or VPC_LINK for private connections between API Gateway and resources in a VPC. The default value is INTERNET.</p>
 */
@property (nonatomic, assign) AWSapigatewayConnectionType connectionType;

/**
 <p>Supported only for WebSocket APIs. Specifies how to handle response payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following behaviors:</p><p>CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the corresponding binary blob.</p><p>CONVERT_TO_TEXT: Converts a response payload from a binary blob to a Base64-encoded string.</p><p>If this property is not defined, the response payload will be passed through from the integration response to the route response or method response without modification.</p>
 */
@property (nonatomic, assign) AWSapigatewayContentHandlingStrategy contentHandlingStrategy;

/**
 <p>Specifies the credentials required for the integration, if any. For AWS integrations, three options are available. To specify an IAM Role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To require that the caller's identity be passed through from the request, specify the string arn:aws:iam::*:user/*. To use resource-based permissions on supported AWS services, specify null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable credentialsArn;

/**
 <p>Represents the description of an integration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Represents the identifier of an integration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationId;

/**
 <p>Specifies the integration's HTTP method type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationMethod;

/**
 <p>The integration response selection expression for the integration. Supported only for WebSocket APIs. See <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-integration-response-selection-expressions">Integration Response Selection Expressions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationResponseSelectionExpression;

/**
 <p>The integration type of an integration. One of the following:</p><p>AWS: for integrating the route or method request with an AWS service action, including the Lambda function-invoking action. With the Lambda function-invoking action, this is referred to as the Lambda custom integration. With any other AWS service action, this is known as AWS integration. Supported only for WebSocket APIs.</p><p>AWS_PROXY: for integrating the route or method request with the Lambda function-invoking action with the client request passed through as-is. This integration is also referred to as Lambda proxy integration.</p><p>HTTP: for integrating the route or method request with an HTTP endpoint. This integration is also referred to as the HTTP custom integration. Supported only for WebSocket APIs.</p><p>HTTP_PROXY: for integrating the route or method request with an HTTP endpoint, with the client request passed through as-is. This is also referred to as HTTP proxy integration.</p><p>MOCK: for integrating the route or method request with API Gateway as a "loopback" endpoint without invoking any backend. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, assign) AWSapigatewayIntegrationType integrationType;

/**
 <p>For a Lambda integration, specify the URI of a Lambda function.</p><p>For an HTTP integration, specify a fully-qualified URL.</p><p>For an HTTP API private integration, specify the ARN of an Application Load Balancer listener, Network Load Balancer listener, or AWS Cloud Map service. If you specify the ARN of an AWS Cloud Map service, API Gateway uses DiscoverInstances to identify resources. You can use query parameters to target specific resources. To learn more, see <a href="https://docs.aws.amazon.com/cloud-map/latest/api/API_DiscoverInstances.html">DiscoverInstances</a>. For private integrations, all resources must be owned by the same AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationUri;

/**
 <p>Specifies the pass-through behavior for incoming requests based on the Content-Type header in the request, and the available mapping templates specified as the requestTemplates property on the Integration resource. There are three valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, and NEVER. Supported only for WebSocket APIs.</p><p>WHEN_NO_MATCH passes the request body for unmapped content types through to the integration backend without transformation.</p><p>NEVER rejects unmapped content types with an HTTP 415 Unsupported Media Type response.</p><p>WHEN_NO_TEMPLATES allows pass-through when the integration has no content types mapped to templates. However, if there is at least one content type defined, unmapped content types will be rejected with the same HTTP 415 Unsupported Media Type response.</p>
 */
@property (nonatomic, assign) AWSapigatewayPassthroughBehavior passthroughBehavior;

/**
 <p>Specifies the format of the payload sent to an integration. Required for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable payloadFormatVersion;

/**
 <p>A key-value map specifying request parameters that are passed from the method request to the backend. The key is an integration request parameter name and the associated value is a method request parameter value or static value that must be enclosed within single quotes and pre-encoded as required by the backend. The method request parameter value must match the pattern of method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>, where<replaceable>{location}</replaceable> is querystring, path, or header; and<replaceable>{name}</replaceable> must be a valid and unique method request parameter name. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestParameters;

/**
 <p>Represents a map of Velocity templates that are applied on the request payload based on the value of the Content-Type header sent by the client. The content type value is the key in this map, and the template (as a String) is the value. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestTemplates;

/**
 <p>The template selection expression for the integration. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateSelectionExpression;

/**
 <p>Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and between 50 and 30,000 milliseconds for HTTP APIs. The default timeout is 29 seconds for WebSocket APIs and 30 seconds for HTTP APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutInMillis;

/**
 <p>The TLS configuration for a private integration. If you specify a TLS configuration, private integration traffic uses the HTTPS protocol. Supported only for HTTP APIs.</p>
 */
@property (nonatomic, strong) AWSapigatewayTlsConfig * _Nullable tlsConfig;

@end

/**
 <p>Represents the input parameters for an UpdateIntegrationResponse request.</p>
 */
@interface AWSapigatewayUpdateIntegrationResponseInput : AWSModel


/**
 <p>Supported only for WebSocket APIs. Specifies how to handle response payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following behaviors:</p><p>CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the corresponding binary blob.</p><p>CONVERT_TO_TEXT: Converts a response payload from a binary blob to a Base64-encoded string.</p><p>If this property is not defined, the response payload will be passed through from the integration response to the route response or method response without modification.</p>
 */
@property (nonatomic, assign) AWSapigatewayContentHandlingStrategy contentHandlingStrategy;

/**
 <p>The integration response key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationResponseKey;

/**
 <p>A key-value map specifying response parameters that are passed to the method response from the backend. The key is a method response header parameter name and the mapped value is an integration response header value, a static value enclosed within a pair of single quotes, or a JSON expression from the integration response body. The mapping key must match the pattern of method.response.header.<replaceable>{name}</replaceable>, where name is a valid and unique header name. The mapped non-static value must match the pattern of integration.response.header.<replaceable>{name}</replaceable> or integration.response.body.<replaceable>{JSON-expression}</replaceable>, where<replaceable>{name}</replaceable> is a valid and unique response header name and<replaceable>{JSON-expression}</replaceable> is a valid JSON expression without the $ prefix.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable responseParameters;

/**
 <p>The collection of response templates for the integration response as a string-to-string map of key-value pairs. Response templates are represented as a key/value map, with a content-type as the key and a template as the value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable responseTemplates;

/**
 <p>The template selection expression for the integration response. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateSelectionExpression;

@end

/**
 <p>Updates an IntegrationResponses.</p>
 Required parameters: [ApiId, IntegrationResponseId, IntegrationId]
 */
@interface AWSapigatewayUpdateIntegrationResponseRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>Supported only for WebSocket APIs. Specifies how to handle response payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following behaviors:</p><p>CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the corresponding binary blob.</p><p>CONVERT_TO_TEXT: Converts a response payload from a binary blob to a Base64-encoded string.</p><p>If this property is not defined, the response payload will be passed through from the integration response to the route response or method response without modification.</p>
 */
@property (nonatomic, assign) AWSapigatewayContentHandlingStrategy contentHandlingStrategy;

/**
 <p>The integration ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationId;

/**
 <p>The integration response ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationResponseId;

/**
 <p>The integration response key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationResponseKey;

/**
 <p>A key-value map specifying response parameters that are passed to the method response from the backend. The key is a method response header parameter name and the mapped value is an integration response header value, a static value enclosed within a pair of single quotes, or a JSON expression from the integration response body. The mapping key must match the pattern of method.response.header.<replaceable>{name}</replaceable>, where name is a valid and unique header name. The mapped non-static value must match the pattern of integration.response.header.<replaceable>{name}</replaceable> or integration.response.body.<replaceable>{JSON-expression}</replaceable>, where<replaceable>{name}</replaceable> is a valid and unique response header name and<replaceable>{JSON-expression}</replaceable> is a valid JSON expression without the $ prefix.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable responseParameters;

/**
 <p>The collection of response templates for the integration response as a string-to-string map of key-value pairs. Response templates are represented as a key/value map, with a content-type as the key and a template as the value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable responseTemplates;

/**
 <p>The template selection expression for the integration response. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateSelectionExpression;

@end

/**
 
 */
@interface AWSapigatewayUpdateIntegrationResponseResponse : AWSModel


/**
 <p>Supported only for WebSocket APIs. Specifies how to handle response payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following behaviors:</p><p>CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the corresponding binary blob.</p><p>CONVERT_TO_TEXT: Converts a response payload from a binary blob to a Base64-encoded string.</p><p>If this property is not defined, the response payload will be passed through from the integration response to the route response or method response without modification.</p>
 */
@property (nonatomic, assign) AWSapigatewayContentHandlingStrategy contentHandlingStrategy;

/**
 <p>The integration response ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationResponseId;

/**
 <p>The integration response key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationResponseKey;

/**
 <p>A key-value map specifying response parameters that are passed to the method response from the backend. The key is a method response header parameter name and the mapped value is an integration response header value, a static value enclosed within a pair of single quotes, or a JSON expression from the integration response body. The mapping key must match the pattern of method.response.header.{name}, where name is a valid and unique header name. The mapped non-static value must match the pattern of integration.response.header.{name} or integration.response.body.{JSON-expression}, where name is a valid and unique response header name and JSON-expression is a valid JSON expression without the $ prefix.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable responseParameters;

/**
 <p>The collection of response templates for the integration response as a string-to-string map of key-value pairs. Response templates are represented as a key/value map, with a content-type as the key and a template as the value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable responseTemplates;

/**
 <p>The template selection expressions for the integration response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateSelectionExpression;

@end

/**
 <p>Represents the input parameters for an UpdateModel request. Supported only for WebSocket APIs.</p>
 */
@interface AWSapigatewayUpdateModelInput : AWSModel


/**
 <p>The content-type for the model, for example, "application/json".</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The description of the model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The schema for the model. For application/json models, this should be JSON schema draft 4 model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schema;

@end

/**
 <p>Updates a Model.</p>
 Required parameters: [ModelId, ApiId]
 */
@interface AWSapigatewayUpdateModelRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The content-type for the model, for example, "application/json".</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The description of the model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The model ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelId;

/**
 <p>The name of the model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The schema for the model. For application/json models, this should be JSON schema draft 4 model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schema;

@end

/**
 
 */
@interface AWSapigatewayUpdateModelResponse : AWSModel


/**
 <p>The content-type for the model, for example, "application/json".</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The description of the model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The model identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelId;

/**
 <p>The name of the model. Must be alphanumeric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The schema for the model. For application/json models, this should be JSON schema draft 4 model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schema;

@end

/**
 <p>Represents the input parameters for an UpdateRoute request.</p>
 */
@interface AWSapigatewayUpdateRouteInput : AWSModel


/**
 <p>Specifies whether an API key is required for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable apiKeyRequired;

/**
 <p>The authorization scopes supported by this route.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable authorizationScopes;

/**
 <p>The authorization type for the route. For WebSocket APIs, valid values are NONE for open access, AWS_IAM for using AWS IAM permissions, and CUSTOM for using a Lambda authorizer For HTTP APIs, valid values are NONE for open access, or JWT for using JSON Web Tokens.</p>
 */
@property (nonatomic, assign) AWSapigatewayAuthorizationType authorizationType;

/**
 <p>The identifier of the Authorizer resource to be associated with this route. The authorizer identifier is generated by API Gateway when you created the authorizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerId;

/**
 <p>The model selection expression for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelSelectionExpression;

/**
 <p>The operation name for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationName;

/**
 <p>The request models for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestModels;

/**
 <p>The request parameters for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSapigatewayParameterConstraints *> * _Nullable requestParameters;

/**
 <p>The route key for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeKey;

/**
 <p>The route response selection expression for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeResponseSelectionExpression;

/**
 <p>The target for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

@end

/**
 <p>Updates a Route.</p>
 Required parameters: [ApiId, RouteId]
 */
@interface AWSapigatewayUpdateRouteRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>Specifies whether an API key is required for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable apiKeyRequired;

/**
 <p>The authorization scopes supported by this route.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable authorizationScopes;

/**
 <p>The authorization type for the route. For WebSocket APIs, valid values are NONE for open access, AWS_IAM for using AWS IAM permissions, and CUSTOM for using a Lambda authorizer For HTTP APIs, valid values are NONE for open access, or JWT for using JSON Web Tokens.</p>
 */
@property (nonatomic, assign) AWSapigatewayAuthorizationType authorizationType;

/**
 <p>The identifier of the Authorizer resource to be associated with this route. The authorizer identifier is generated by API Gateway when you created the authorizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerId;

/**
 <p>The model selection expression for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelSelectionExpression;

/**
 <p>The operation name for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationName;

/**
 <p>The request models for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestModels;

/**
 <p>The request parameters for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSapigatewayParameterConstraints *> * _Nullable requestParameters;

/**
 <p>The route ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeId;

/**
 <p>The route key for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeKey;

/**
 <p>The route response selection expression for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeResponseSelectionExpression;

/**
 <p>The target for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

@end

/**
 
 */
@interface AWSapigatewayUpdateRouteResult : AWSModel


/**
 <p>Specifies whether a route is managed by API Gateway. If you created an API using quick create, the $default route is managed by API Gateway. You can't modify the $default route key.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable apiGatewayManaged;

/**
 <p>Specifies whether an API key is required for this route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable apiKeyRequired;

/**
 <p>A list of authorization scopes configured on a route. The scopes are used with a JWT authorizer to authorize the method invocation. The authorization works by matching the route scopes against the scopes parsed from the access token in the incoming request. The method invocation is authorized if any route scope matches a claimed scope in the access token. Otherwise, the invocation is not authorized. When the route scope is configured, the client must provide an access token instead of an identity token for authorization purposes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable authorizationScopes;

/**
 <p>The authorization type for the route. For WebSocket APIs, valid values are NONE for open access, AWS_IAM for using AWS IAM permissions, and CUSTOM for using a Lambda authorizer For HTTP APIs, valid values are NONE for open access, or JWT for using JSON Web Tokens.</p>
 */
@property (nonatomic, assign) AWSapigatewayAuthorizationType authorizationType;

/**
 <p>The identifier of the Authorizer resource to be associated with this route. The authorizer identifier is generated by API Gateway when you created the authorizer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerId;

/**
 <p>The model selection expression for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelSelectionExpression;

/**
 <p>The operation name for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationName;

/**
 <p>The request models for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable requestModels;

/**
 <p>The request parameters for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSapigatewayParameterConstraints *> * _Nullable requestParameters;

/**
 <p>The route ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeId;

/**
 <p>The route key for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeKey;

/**
 <p>The route response selection expression for the route. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeResponseSelectionExpression;

/**
 <p>The target for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

@end

/**
 <p>Represents the input parameters for an UpdateRouteResponse request.</p>
 */
@interface AWSapigatewayUpdateRouteResponseInput : AWSModel


/**
 <p>The model selection expression for the route response. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelSelectionExpression;

/**
 <p>The response models for the route response.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable responseModels;

/**
 <p>The route response parameters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSapigatewayParameterConstraints *> * _Nullable responseParameters;

/**
 <p>The route response key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeResponseKey;

@end

/**
 <p>Updates a RouteResponse.</p>
 Required parameters: [RouteResponseId, ApiId, RouteId]
 */
@interface AWSapigatewayUpdateRouteResponseRequest : AWSRequest


/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>The model selection expression for the route response. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelSelectionExpression;

/**
 <p>The response models for the route response.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable responseModels;

/**
 <p>The route response parameters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSapigatewayParameterConstraints *> * _Nullable responseParameters;

/**
 <p>The route ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeId;

/**
 <p>The route response ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeResponseId;

/**
 <p>The route response key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeResponseKey;

@end

/**
 
 */
@interface AWSapigatewayUpdateRouteResponseResponse : AWSModel


/**
 <p>Represents the model selection expression of a route response. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelSelectionExpression;

/**
 <p>Represents the response models of a route response.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable responseModels;

/**
 <p>Represents the response parameters of a route response.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSapigatewayParameterConstraints *> * _Nullable responseParameters;

/**
 <p>Represents the identifier of a route response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeResponseId;

/**
 <p>Represents the route response key of a route response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeResponseKey;

@end

/**
 <p>Represents the input parameters for an UpdateStage request.</p>
 */
@interface AWSapigatewayUpdateStageInput : AWSModel


/**
 <p>Settings for logging access in this stage.</p>
 */
@property (nonatomic, strong) AWSapigatewayAccessLogSettings * _Nullable accessLogSettings;

/**
 <p>Specifies whether updates to an API automatically trigger a new deployment. The default value is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoDeploy;

/**
 <p>The identifier of a client certificate for a Stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientCertificateId;

/**
 <p>The default route settings for the stage.</p>
 */
@property (nonatomic, strong) AWSapigatewayRouteSettings * _Nullable defaultRouteSettings;

/**
 <p>The deployment identifier for the API stage. Can't be updated if autoDeploy is enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p>The description for the API stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Route settings for the stage.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSapigatewayRouteSettings *> * _Nullable routeSettings;

/**
 <p>A map that defines the stage variables for a Stage. Variable names can have alphanumeric and underscore characters, and the values must match [A-Za-z0-9-._~:/?#&amp;=,]+.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable stageVariables;

@end

/**
 <p>Updates a Stage.</p>
 Required parameters: [StageName, ApiId]
 */
@interface AWSapigatewayUpdateStageRequest : AWSRequest


/**
 <p>Settings for logging access in this stage.</p>
 */
@property (nonatomic, strong) AWSapigatewayAccessLogSettings * _Nullable accessLogSettings;

/**
 <p>The API identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiId;

/**
 <p>Specifies whether updates to an API automatically trigger a new deployment. The default value is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoDeploy;

/**
 <p>The identifier of a client certificate for a Stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientCertificateId;

/**
 <p>The default route settings for the stage.</p>
 */
@property (nonatomic, strong) AWSapigatewayRouteSettings * _Nullable defaultRouteSettings;

/**
 <p>The deployment identifier for the API stage. Can't be updated if autoDeploy is enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p>The description for the API stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Route settings for the stage.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSapigatewayRouteSettings *> * _Nullable routeSettings;

/**
 <p>The stage name. Stage names can only contain alphanumeric characters, hyphens, and underscores. Maximum length is 128 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stageName;

/**
 <p>A map that defines the stage variables for a Stage. Variable names can have alphanumeric and underscore characters, and the values must match [A-Za-z0-9-._~:/?#&amp;=,]+.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable stageVariables;

@end

/**
 
 */
@interface AWSapigatewayUpdateStageResponse : AWSModel


/**
 <p>Settings for logging access in this stage.</p>
 */
@property (nonatomic, strong) AWSapigatewayAccessLogSettings * _Nullable accessLogSettings;

/**
 <p>Specifies whether a stage is managed by API Gateway. If you created an API using quick create, the $default stage is managed by API Gateway. You can't modify the $default stage.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable apiGatewayManaged;

/**
 <p>Specifies whether updates to an API automatically trigger a new deployment. The default value is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoDeploy;

/**
 <p>The identifier of a client certificate for a Stage. Supported only for WebSocket APIs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientCertificateId;

/**
 <p>The timestamp when the stage was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>Default route settings for the stage.</p>
 */
@property (nonatomic, strong) AWSapigatewayRouteSettings * _Nullable defaultRouteSettings;

/**
 <p>The identifier of the Deployment that the Stage is associated with. Can't be updated if autoDeploy is enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p>The description of the stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Describes the status of the last deployment of a stage. Supported only for stages with autoDeploy enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastDeploymentStatusMessage;

/**
 <p>The timestamp when the stage was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDate;

/**
 <p>Route settings for the stage, by routeKey.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSapigatewayRouteSettings *> * _Nullable routeSettings;

/**
 <p>The name of the stage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stageName;

/**
 <p>A map that defines the stage variables for a stage resource. Variable names can have alphanumeric and underscore characters, and the values must match [A-Za-z0-9-._~:/?#&amp;=,]+.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable stageVariables;

/**
 <p>The collection of tags. Each tag element is associated with a given resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Represents the input parameters for an UpdateVpcLink request.</p>
 */
@interface AWSapigatewayUpdateVpcLinkInput : AWSModel


/**
 <p>The name of the VPC link.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Updates a VPC link.</p>
 Required parameters: [VpcLinkId]
 */
@interface AWSapigatewayUpdateVpcLinkRequest : AWSRequest


/**
 <p>The name of the VPC link.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ID of the VPC link.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcLinkId;

@end

/**
 
 */
@interface AWSapigatewayUpdateVpcLinkResponse : AWSModel


/**
 <p>The timestamp when the VPC link was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The name of the VPC link.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of security group IDs for the VPC link.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>A list of subnet IDs to include in the VPC link.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>Tags for the VPC link.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The ID of the VPC link.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcLinkId;

/**
 <p>The status of the VPC link.</p>
 */
@property (nonatomic, assign) AWSapigatewayVpcLinkStatus vpcLinkStatus;

/**
 <p>A message summarizing the cause of the status of the VPC link.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcLinkStatusMessage;

/**
 <p>The version of the VPC link.</p>
 */
@property (nonatomic, assign) AWSapigatewayVpcLinkVersion vpcLinkVersion;

@end

/**
 <p>Represents a VPC link.</p>
 Required parameters: [VpcLinkId, SecurityGroupIds, SubnetIds, Name]
 */
@interface AWSapigatewayVpcLink : AWSModel


/**
 <p>The timestamp when the VPC link was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The name of the VPC link.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of security group IDs for the VPC link.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>A list of subnet IDs to include in the VPC link.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>Tags for the VPC link.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The ID of the VPC link.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcLinkId;

/**
 <p>The status of the VPC link.</p>
 */
@property (nonatomic, assign) AWSapigatewayVpcLinkStatus vpcLinkStatus;

/**
 <p>A message summarizing the cause of the status of the VPC link.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcLinkStatusMessage;

/**
 <p>The version of the VPC link.</p>
 */
@property (nonatomic, assign) AWSapigatewayVpcLinkVersion vpcLinkVersion;

@end

/**
 <p>Represents a collection of VPCLinks.</p>
 */
@interface AWSapigatewayVpcLinks : AWSModel


/**
 <p>A collection of VPC links.</p>
 */
@property (nonatomic, strong) NSArray<AWSapigatewayVpcLink *> * _Nullable items;

/**
 <p>The next page of elements from this collection. Not valid for the last element of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

NS_ASSUME_NONNULL_END
