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

FOUNDATION_EXPORT NSString *const AWSAppmeshErrorDomain;

typedef NS_ENUM(NSInteger, AWSAppmeshErrorType) {
    AWSAppmeshErrorUnknown,
    AWSAppmeshErrorResourceInUse,
    AWSAppmeshErrorBadRequest,
    AWSAppmeshErrorConflict,
    AWSAppmeshErrorInternalServerError,
    AWSAppmeshErrorForbidden,
    AWSAppmeshErrorNotFound,
    AWSAppmeshErrorServiceUnavailable,
    AWSAppmeshErrorLimitExceeded,
    AWSAppmeshErrorTooManyRequests,
    AWSAppmeshErrorTooManyTags,
};

typedef NS_ENUM(NSInteger, AWSAppmeshVirtualRouterStatusCode) {
    AWSAppmeshVirtualRouterStatusCodeUnknown,
    AWSAppmeshVirtualRouterStatusCodeActive,
    AWSAppmeshVirtualRouterStatusCodeDeleted,
    AWSAppmeshVirtualRouterStatusCodeInactive,
};

typedef NS_ENUM(NSInteger, AWSAppmeshListenerTlsMode) {
    AWSAppmeshListenerTlsModeUnknown,
    AWSAppmeshListenerTlsModeDisabled,
    AWSAppmeshListenerTlsModePermissive,
    AWSAppmeshListenerTlsModeStrict,
};

typedef NS_ENUM(NSInteger, AWSAppmeshTcpRetryPolicyEvent) {
    AWSAppmeshTcpRetryPolicyEventUnknown,
    AWSAppmeshTcpRetryPolicyEventConnectionError,
};

typedef NS_ENUM(NSInteger, AWSAppmeshHttpMethod) {
    AWSAppmeshHttpMethodUnknown,
    AWSAppmeshHttpMethodConnect,
    AWSAppmeshHttpMethodDelete,
    AWSAppmeshHttpMethodGet,
    AWSAppmeshHttpMethodHead,
    AWSAppmeshHttpMethodOptions,
    AWSAppmeshHttpMethodPatch,
    AWSAppmeshHttpMethodPost,
    AWSAppmeshHttpMethodPut,
    AWSAppmeshHttpMethodTrace,
};

typedef NS_ENUM(NSInteger, AWSAppmeshRouteStatusCode) {
    AWSAppmeshRouteStatusCodeUnknown,
    AWSAppmeshRouteStatusCodeActive,
    AWSAppmeshRouteStatusCodeDeleted,
    AWSAppmeshRouteStatusCodeInactive,
};

typedef NS_ENUM(NSInteger, AWSAppmeshGrpcRetryPolicyEvent) {
    AWSAppmeshGrpcRetryPolicyEventUnknown,
    AWSAppmeshGrpcRetryPolicyEventCancelled,
    AWSAppmeshGrpcRetryPolicyEventDeadlineExceeded,
    AWSAppmeshGrpcRetryPolicyEventInternal,
    AWSAppmeshGrpcRetryPolicyEventResourceExhausted,
    AWSAppmeshGrpcRetryPolicyEventUnavailable,
};

typedef NS_ENUM(NSInteger, AWSAppmeshEgressFilterType) {
    AWSAppmeshEgressFilterTypeUnknown,
    AWSAppmeshEgressFilterTypeAllowAll,
    AWSAppmeshEgressFilterTypeDropAll,
};

typedef NS_ENUM(NSInteger, AWSAppmeshPortProtocol) {
    AWSAppmeshPortProtocolUnknown,
    AWSAppmeshPortProtocolGrpc,
    AWSAppmeshPortProtocolHTTP,
    AWSAppmeshPortProtocolHttp2,
    AWSAppmeshPortProtocolTcp,
};

typedef NS_ENUM(NSInteger, AWSAppmeshVirtualNodeStatusCode) {
    AWSAppmeshVirtualNodeStatusCodeUnknown,
    AWSAppmeshVirtualNodeStatusCodeActive,
    AWSAppmeshVirtualNodeStatusCodeDeleted,
    AWSAppmeshVirtualNodeStatusCodeInactive,
};

typedef NS_ENUM(NSInteger, AWSAppmeshDurationUnit) {
    AWSAppmeshDurationUnitUnknown,
    AWSAppmeshDurationUnitMs,
    AWSAppmeshDurationUnitS,
};

typedef NS_ENUM(NSInteger, AWSAppmeshMeshStatusCode) {
    AWSAppmeshMeshStatusCodeUnknown,
    AWSAppmeshMeshStatusCodeActive,
    AWSAppmeshMeshStatusCodeDeleted,
    AWSAppmeshMeshStatusCodeInactive,
};

typedef NS_ENUM(NSInteger, AWSAppmeshHttpScheme) {
    AWSAppmeshHttpSchemeUnknown,
    AWSAppmeshHttpSchemeHTTP,
    AWSAppmeshHttpSchemeHTTPS,
};

typedef NS_ENUM(NSInteger, AWSAppmeshVirtualServiceStatusCode) {
    AWSAppmeshVirtualServiceStatusCodeUnknown,
    AWSAppmeshVirtualServiceStatusCodeActive,
    AWSAppmeshVirtualServiceStatusCodeDeleted,
    AWSAppmeshVirtualServiceStatusCodeInactive,
};

@class AWSAppmeshVirtualRouterListener;
@class AWSAppmeshGrpcRetryPolicy;
@class AWSAppmeshCreateVirtualNodeOutput;
@class AWSAppmeshLogging;
@class AWSAppmeshUpdateVirtualRouterOutput;
@class AWSAppmeshListVirtualRoutersOutput;
@class AWSAppmeshResourceMetadata;
@class AWSAppmeshUpdateVirtualNodeOutput;
@class AWSAppmeshListRoutesOutput;
@class AWSAppmeshVirtualServiceBackend;
@class AWSAppmeshHealthCheckPolicy;
@class AWSAppmeshEgressFilter;
@class AWSAppmeshClientPolicy;
@class AWSAppmeshDescribeVirtualServiceOutput;
@class AWSAppmeshDescribeVirtualNodeOutput;
@class AWSAppmeshCreateRouteOutput;
@class AWSAppmeshDnsServiceDiscovery;
@class AWSAppmeshDeleteRouteInput;
@class AWSAppmeshVirtualNodeData;
@class AWSAppmeshUntagResourceOutput;
@class AWSAppmeshBackend;
@class AWSAppmeshListMeshesInput;
@class AWSAppmeshVirtualRouterData;
@class AWSAppmeshUpdateMeshInput;
@class AWSAppmeshCreateVirtualRouterInput;
@class AWSAppmeshDescribeVirtualRouterOutput;
@class AWSAppmeshCreateMeshOutput;
@class AWSAppmeshCreateVirtualRouterOutput;
@class AWSAppmeshVirtualServiceStatus;
@class AWSAppmeshListenerTlsCertificate;
@class AWSAppmeshVirtualRouterSpec;
@class AWSAppmeshVirtualNodeSpec;
@class AWSAppmeshListMeshesOutput;
@class AWSAppmeshListenerTimeout;
@class AWSAppmeshTlsValidationContextTrust;
@class AWSAppmeshPortMapping;
@class AWSAppmeshListVirtualServicesOutput;
@class AWSAppmeshWeightedTarget;
@class AWSAppmeshRouteRef;
@class AWSAppmeshDeleteVirtualNodeInput;
@class AWSAppmeshRouteData;
@class AWSAppmeshTlsValidationContextAcmTrust;
@class AWSAppmeshHeaderMatchMethod;
@class AWSAppmeshDeleteMeshOutput;
@class AWSAppmeshTagResourceInput;
@class AWSAppmeshVirtualServiceProvider;
@class AWSAppmeshGrpcRouteMatch;
@class AWSAppmeshAwsCloudMapServiceDiscovery;
@class AWSAppmeshUpdateVirtualServiceOutput;
@class AWSAppmeshMeshStatus;
@class AWSAppmeshCreateVirtualNodeInput;
@class AWSAppmeshRouteSpec;
@class AWSAppmeshCreateVirtualServiceOutput;
@class AWSAppmeshFileAccessLog;
@class AWSAppmeshVirtualRouterServiceProvider;
@class AWSAppmeshHttpTimeout;
@class AWSAppmeshDeleteVirtualServiceInput;
@class AWSAppmeshTlsValidationContext;
@class AWSAppmeshDeleteVirtualRouterOutput;
@class AWSAppmeshDeleteVirtualNodeOutput;
@class AWSAppmeshUpdateVirtualNodeInput;
@class AWSAppmeshListenerTls;
@class AWSAppmeshDeleteMeshInput;
@class AWSAppmeshCreateVirtualServiceInput;
@class AWSAppmeshUpdateVirtualRouterInput;
@class AWSAppmeshListTagsForResourceInput;
@class AWSAppmeshDescribeMeshOutput;
@class AWSAppmeshDeleteVirtualRouterInput;
@class AWSAppmeshDescribeRouteInput;
@class AWSAppmeshDeleteRouteOutput;
@class AWSAppmeshUpdateVirtualServiceInput;
@class AWSAppmeshUpdateRouteOutput;
@class AWSAppmeshHttpRouteAction;
@class AWSAppmeshListRoutesInput;
@class AWSAppmeshVirtualServiceRef;
@class AWSAppmeshGrpcTimeout;
@class AWSAppmeshVirtualNodeStatus;
@class AWSAppmeshVirtualRouterRef;
@class AWSAppmeshVirtualServiceData;
@class AWSAppmeshHttpRouteHeader;
@class AWSAppmeshVirtualNodeRef;
@class AWSAppmeshCreateMeshInput;
@class AWSAppmeshGrpcRouteAction;
@class AWSAppmeshUpdateMeshOutput;
@class AWSAppmeshGrpcRouteMetadataMatchMethod;
@class AWSAppmeshDescribeVirtualServiceInput;
@class AWSAppmeshAwsCloudMapInstanceAttribute;
@class AWSAppmeshVirtualServiceSpec;
@class AWSAppmeshMatchRange;
@class AWSAppmeshTcpRoute;
@class AWSAppmeshListVirtualRoutersInput;
@class AWSAppmeshListVirtualServicesInput;
@class AWSAppmeshAccessLog;
@class AWSAppmeshListVirtualNodesInput;
@class AWSAppmeshDuration;
@class AWSAppmeshDescribeRouteOutput;
@class AWSAppmeshHttpRouteMatch;
@class AWSAppmeshTagRef;
@class AWSAppmeshMeshRef;
@class AWSAppmeshMeshData;
@class AWSAppmeshVirtualRouterStatus;
@class AWSAppmeshTcpRouteAction;
@class AWSAppmeshDescribeVirtualNodeInput;
@class AWSAppmeshRouteStatus;
@class AWSAppmeshListener;
@class AWSAppmeshGrpcRoute;
@class AWSAppmeshClientPolicyTls;
@class AWSAppmeshDeleteVirtualServiceOutput;
@class AWSAppmeshVirtualNodeServiceProvider;
@class AWSAppmeshBackendDefaults;
@class AWSAppmeshListenerTlsFileCertificate;
@class AWSAppmeshHttpRetryPolicy;
@class AWSAppmeshDescribeVirtualRouterInput;
@class AWSAppmeshTagResourceOutput;
@class AWSAppmeshTlsValidationContextFileTrust;
@class AWSAppmeshGrpcRouteMetadata;
@class AWSAppmeshCreateRouteInput;
@class AWSAppmeshTcpTimeout;
@class AWSAppmeshUpdateRouteInput;
@class AWSAppmeshHttpRoute;
@class AWSAppmeshDescribeMeshInput;
@class AWSAppmeshMeshSpec;
@class AWSAppmeshListTagsForResourceOutput;
@class AWSAppmeshServiceDiscovery;
@class AWSAppmeshListVirtualNodesOutput;
@class AWSAppmeshUntagResourceInput;
@class AWSAppmeshListenerTlsAcmCertificate;

/**
 <p>An object that represents a virtual router listener.</p>
 Required parameters: [portMapping]
 */
@interface AWSAppmeshVirtualRouterListener : AWSModel


/**
 <p>An object that represents a port mapping.</p>
 */
@property (nonatomic, strong) AWSAppmeshPortMapping * _Nullable portMapping;

@end

/**
 <p>An object that represents a retry policy. Specify at least one value for at least one of the types of <code>RetryEvents</code>, a value for <code>maxRetries</code>, and a value for <code>perRetryTimeout</code>.</p>
 Required parameters: [maxRetries, perRetryTimeout]
 */
@interface AWSAppmeshGrpcRetryPolicy : AWSModel


/**
 <p>Specify at least one of the valid values.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable grpcRetryEvents;

/**
 <p>Specify at least one of the following values.</p><ul><li><p><b>server-error</b> – HTTP status codes 500, 501, 502, 503, 504, 505, 506, 507, 508, 510, and 511</p></li><li><p><b>gateway-error</b> – HTTP status codes 502, 503, and 504</p></li><li><p><b>client-error</b> – HTTP status code 409</p></li><li><p><b>stream-error</b> – Retry on refused stream</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable httpRetryEvents;

/**
 <p>The maximum number of retry attempts.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRetries;

/**
 <p>An object that represents a duration of time.</p>
 */
@property (nonatomic, strong) AWSAppmeshDuration * _Nullable perRetryTimeout;

/**
 <p>Specify a valid value.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tcpRetryEvents;

@end

/**
 
 Required parameters: [virtualNode]
 */
@interface AWSAppmeshCreateVirtualNodeOutput : AWSModel


/**
 <p>The full description of your virtual node following the create call.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualNodeData * _Nullable virtualNode;

@end

/**
 <p>An object that represents the logging information for a virtual node.</p>
 */
@interface AWSAppmeshLogging : AWSModel


/**
 <p>The access log configuration for a virtual node.</p>
 */
@property (nonatomic, strong) AWSAppmeshAccessLog * _Nullable accessLog;

@end

/**
 
 Required parameters: [virtualRouter]
 */
@interface AWSAppmeshUpdateVirtualRouterOutput : AWSModel


/**
 <p>A full description of the virtual router that was updated.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualRouterData * _Nullable virtualRouter;

@end

/**
 
 Required parameters: [virtualRouters]
 */
@interface AWSAppmeshListVirtualRoutersOutput : AWSModel


/**
 <p>The <code>nextToken</code> value to include in a future <code>ListVirtualRouters</code>request. When the results of a <code>ListVirtualRouters</code> request exceed <code>limit</code>, you can use this value to retrieve the next page of results. Thisvalue is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of existing virtual routers for the specified service mesh.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppmeshVirtualRouterRef *> * _Nullable virtualRouters;

@end

/**
 <p>An object that represents metadata for a resource.</p>
 Required parameters: [arn, createdAt, lastUpdatedAt, meshOwner, resourceOwner, uid, version]
 */
@interface AWSAppmeshResourceMetadata : AWSModel


/**
 <p>The full Amazon Resource Name (ARN) for the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The Unix epoch timestamp in seconds for when the resource was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The Unix epoch timestamp in seconds for when the resource was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it'sthe ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The AWS IAM account ID of the resource owner. If the account ID is not your own, then it'sthe ID of the mesh owner or of another account that the mesh is shared with. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceOwner;

/**
 <p>The unique identifier for the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uid;

/**
 <p>The version of the resource. Resources are created at version 1, and this version isincremented each time that they're updated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 
 Required parameters: [virtualNode]
 */
@interface AWSAppmeshUpdateVirtualNodeOutput : AWSModel


/**
 <p>A full description of the virtual node that was updated.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualNodeData * _Nullable virtualNode;

@end

/**
 
 Required parameters: [routes]
 */
@interface AWSAppmeshListRoutesOutput : AWSModel


/**
 <p>The <code>nextToken</code> value to include in a future <code>ListRoutes</code> request.When the results of a <code>ListRoutes</code> request exceed <code>limit</code>, you canuse this value to retrieve the next page of results. This value is <code>null</code> whenthere are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of existing routes for the specified service mesh and virtual router.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppmeshRouteRef *> * _Nullable routes;

@end

/**
 <p>An object that represents a virtual service backend for a virtual node.</p>
 Required parameters: [virtualServiceName]
 */
@interface AWSAppmeshVirtualServiceBackend : AWSModel


/**
 <p>A reference to an object that represents the client policy for a backend.</p>
 */
@property (nonatomic, strong) AWSAppmeshClientPolicy * _Nullable clientPolicy;

/**
 <p>The name of the virtual service that is acting as a virtual node backend.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualServiceName;

@end

/**
 <p>An object that represents the health check policy for a virtual node's listener.</p>
 Required parameters: [healthyThreshold, intervalMillis, protocol, timeoutMillis, unhealthyThreshold]
 */
@interface AWSAppmeshHealthCheckPolicy : AWSModel


/**
 <p>The number of consecutive successful health checks that must occur before declaringlistener healthy.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthyThreshold;

/**
 <p>The time period in milliseconds between each health check execution.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable intervalMillis;

/**
 <p>The destination path for the health check request. This value is only used if thespecified protocol is HTTP or HTTP/2. For any other protocol, this value is ignored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>The destination port for the health check request. This port must match the port definedin the <a>PortMapping</a> for the listener.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The protocol for the health check request. If you specify <code>grpc</code>, then yourservice must conform to the <a href="https://github.com/grpc/grpc/blob/master/doc/health-checking.md">GRPC Health Checking Protocol</a>.</p>
 */
@property (nonatomic, assign) AWSAppmeshPortProtocol protocols;

/**
 <p>The amount of time to wait when receiving a response from the health check, inmilliseconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutMillis;

/**
 <p>The number of consecutive failed health checks that must occur before declaring avirtual node unhealthy. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable unhealthyThreshold;

@end

/**
 <p>An object that represents the egress filter rules for a service mesh.</p>
 Required parameters: [type]
 */
@interface AWSAppmeshEgressFilter : AWSModel


/**
 <p>The egress filter type. By default, the type is <code>DROP_ALL</code>, which allowsegress only from virtual nodes to other defined resources in the service mesh (and anytraffic to <code>*.amazonaws.com</code> for AWS API calls). You can set the egress filtertype to <code>ALLOW_ALL</code> to allow egress to any endpoint inside or outside of theservice mesh.</p>
 */
@property (nonatomic, assign) AWSAppmeshEgressFilterType types;

@end

/**
 <p>An object that represents a client policy.</p>
 */
@interface AWSAppmeshClientPolicy : AWSModel


/**
 <p>A reference to an object that represents a Transport Layer Security (TLS) client policy.</p>
 */
@property (nonatomic, strong) AWSAppmeshClientPolicyTls * _Nullable tls;

@end

/**
 
 Required parameters: [virtualService]
 */
@interface AWSAppmeshDescribeVirtualServiceOutput : AWSModel


/**
 <p>The full description of your virtual service.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualServiceData * _Nullable virtualService;

@end

/**
 
 Required parameters: [virtualNode]
 */
@interface AWSAppmeshDescribeVirtualNodeOutput : AWSModel


/**
 <p>The full description of your virtual node.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualNodeData * _Nullable virtualNode;

@end

/**
 
 Required parameters: [route]
 */
@interface AWSAppmeshCreateRouteOutput : AWSModel


/**
 <p>The full description of your mesh following the create call.</p>
 */
@property (nonatomic, strong) AWSAppmeshRouteData * _Nullable route;

@end

/**
 <p>An object that represents the DNS service discovery information for your virtualnode.</p>
 Required parameters: [hostname]
 */
@interface AWSAppmeshDnsServiceDiscovery : AWSModel


/**
 <p>Specifies the DNS service discovery hostname for the virtual node. </p>
 */
@property (nonatomic, strong) NSString * _Nullable hostname;

@end

/**
 
 Required parameters: [meshName, routeName, virtualRouterName]
 */
@interface AWSAppmeshDeleteRouteInput : AWSRequest


/**
 <p>The name of the service mesh to delete the route in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it'sthe ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The name of the route to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeName;

/**
 <p>The name of the virtual router to delete the route in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualRouterName;

@end

/**
 <p>An object that represents a virtual node returned by a describe operation.</p>
 Required parameters: [meshName, metadata, spec, status, virtualNodeName]
 */
@interface AWSAppmeshVirtualNodeData : AWSModel


/**
 <p>The name of the service mesh that the virtual node resides in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The associated metadata for the virtual node.</p>
 */
@property (nonatomic, strong) AWSAppmeshResourceMetadata * _Nullable metadata;

/**
 <p>The specifications of the virtual node.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualNodeSpec * _Nullable spec;

/**
 <p>The current status for the virtual node.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualNodeStatus * _Nullable status;

/**
 <p>The name of the virtual node.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualNodeName;

@end

/**
 
 */
@interface AWSAppmeshUntagResourceOutput : AWSModel


@end

/**
 <p>An object that represents the backends that a virtual node is expected to send outboundtraffic to. </p>
 */
@interface AWSAppmeshBackend : AWSModel


/**
 <p>Specifies a virtual service to use as a backend for a virtual node. </p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualServiceBackend * _Nullable virtualService;

@end

/**
 
 */
@interface AWSAppmeshListMeshesInput : AWSRequest


/**
 <p>The maximum number of results returned by <code>ListMeshes</code> in paginated output.When you use this parameter, <code>ListMeshes</code> returns only <code>limit</code>results in a single page along with a <code>nextToken</code> response element. You can seethe remaining results of the initial request by sending another <code>ListMeshes</code>request with the returned <code>nextToken</code> value. This value can be between1 and 100. If you don't use this parameter, <code>ListMeshes</code> returns up to 100 results and a <code>nextToken</code> value if applicable.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The <code>nextToken</code> value returned from a previous paginated <code>ListMeshes</code> request where <code>limit</code> was used and the resultsexceeded the value of that parameter. Pagination continues from the end of the previousresults that returned the <code>nextToken</code> value.</p><note><p>This token should be treated as an opaque identifier that is used only to retrieve the next items in a list and not for other programmatic purposes.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>An object that represents a virtual router returned by a describe operation.</p>
 Required parameters: [meshName, metadata, spec, status, virtualRouterName]
 */
@interface AWSAppmeshVirtualRouterData : AWSModel


/**
 <p>The name of the service mesh that the virtual router resides in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The associated metadata for the virtual router.</p>
 */
@property (nonatomic, strong) AWSAppmeshResourceMetadata * _Nullable metadata;

/**
 <p>The specifications of the virtual router.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualRouterSpec * _Nullable spec;

/**
 <p>The current status of the virtual router.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualRouterStatus * _Nullable status;

/**
 <p>The name of the virtual router.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualRouterName;

@end

/**
 
 Required parameters: [meshName]
 */
@interface AWSAppmeshUpdateMeshInput : AWSRequest


/**
 <p>Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Up to 36 letters, numbers, hyphens, and underscores are allowed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The name of the service mesh to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The service mesh specification to apply.</p>
 */
@property (nonatomic, strong) AWSAppmeshMeshSpec * _Nullable spec;

@end

/**
 
 Required parameters: [meshName, spec, virtualRouterName]
 */
@interface AWSAppmeshCreateVirtualRouterInput : AWSRequest


/**
 <p>Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Up to 36 letters, numbers, hyphens, and underscores are allowed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The name of the service mesh to create the virtual router in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, thenthe account that you specify must share the mesh with your account before you can create the resource in the service mesh. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The virtual router specification to apply.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualRouterSpec * _Nullable spec;

/**
 <p>Optional metadata that you can apply to the virtual router to assist with categorizationand organization. Each tag consists of a key and an optional value, both of which youdefine. Tag keys can have a maximum character length of 128 characters, and tag values can have a maximum length of 256 characters.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppmeshTagRef *> * _Nullable tags;

/**
 <p>The name to use for the virtual router.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualRouterName;

@end

/**
 
 Required parameters: [virtualRouter]
 */
@interface AWSAppmeshDescribeVirtualRouterOutput : AWSModel


/**
 <p>The full description of your virtual router.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualRouterData * _Nullable virtualRouter;

@end

/**
 
 Required parameters: [mesh]
 */
@interface AWSAppmeshCreateMeshOutput : AWSModel


/**
 <p>The full description of your service mesh following the create call.</p>
 */
@property (nonatomic, strong) AWSAppmeshMeshData * _Nullable mesh;

@end

/**
 
 Required parameters: [virtualRouter]
 */
@interface AWSAppmeshCreateVirtualRouterOutput : AWSModel


/**
 <p>The full description of your virtual router following the create call.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualRouterData * _Nullable virtualRouter;

@end

/**
 <p>An object that represents the status of a virtual service.</p>
 Required parameters: [status]
 */
@interface AWSAppmeshVirtualServiceStatus : AWSModel


/**
 <p>The current status of the virtual service.</p>
 */
@property (nonatomic, assign) AWSAppmeshVirtualServiceStatusCode status;

@end

/**
 <p>An object that represents a listener's Transport Layer Security (TLS) certificate.</p>
 */
@interface AWSAppmeshListenerTlsCertificate : AWSModel


/**
 <p>A reference to an object that represents an AWS Certicate Manager (ACM) certificate.</p>
 */
@property (nonatomic, strong) AWSAppmeshListenerTlsAcmCertificate * _Nullable acm;

/**
 <p>A reference to an object that represents a local file certificate.</p>
 */
@property (nonatomic, strong) AWSAppmeshListenerTlsFileCertificate * _Nullable file;

@end

/**
 <p>An object that represents the specification of a virtual router.</p>
 */
@interface AWSAppmeshVirtualRouterSpec : AWSModel


/**
 <p>The listeners that the virtual router is expected to receive inbound traffic from. Youcan specify one listener.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppmeshVirtualRouterListener *> * _Nullable listeners;

@end

/**
 <p>An object that represents the specification of a virtual node.</p>
 */
@interface AWSAppmeshVirtualNodeSpec : AWSModel


/**
 <p>A reference to an object that represents the defaults for backends.</p>
 */
@property (nonatomic, strong) AWSAppmeshBackendDefaults * _Nullable backendDefaults;

/**
 <p>The backends that the virtual node is expected to send outbound traffic to.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppmeshBackend *> * _Nullable backends;

/**
 <p>The listener that the virtual node is expected to receive inbound traffic from. You canspecify one listener.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppmeshListener *> * _Nullable listeners;

/**
 <p>The inbound and outbound access logging information for the virtual node.</p>
 */
@property (nonatomic, strong) AWSAppmeshLogging * _Nullable logging;

/**
 <p>The service discovery information for the virtual node. If your virtual node does notexpect ingress traffic, you can omit this parameter. If you specify a<code>listener</code>, then you must specify service discovery information.</p>
 */
@property (nonatomic, strong) AWSAppmeshServiceDiscovery * _Nullable serviceDiscovery;

@end

/**
 
 Required parameters: [meshes]
 */
@interface AWSAppmeshListMeshesOutput : AWSModel


/**
 <p>The list of existing service meshes.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppmeshMeshRef *> * _Nullable meshes;

/**
 <p>The <code>nextToken</code> value to include in a future <code>ListMeshes</code> request.When the results of a <code>ListMeshes</code> request exceed <code>limit</code>, you canuse this value to retrieve the next page of results. This value is <code>null</code> whenthere are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAppmeshListenerTimeout : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSAppmeshGrpcTimeout * _Nullable grpc;

/**
 
 */
@property (nonatomic, strong) AWSAppmeshHttpTimeout * _Nullable http;

/**
 
 */
@property (nonatomic, strong) AWSAppmeshHttpTimeout * _Nullable http2;

/**
 
 */
@property (nonatomic, strong) AWSAppmeshTcpTimeout * _Nullable tcp;

@end

/**
 <p>An object that represents a Transport Layer Security (TLS) validation context trust.</p>
 */
@interface AWSAppmeshTlsValidationContextTrust : AWSModel


/**
 <p>A reference to an object that represents a TLS validation context trust for an AWS Certicate Manager (ACM)certificate.</p>
 */
@property (nonatomic, strong) AWSAppmeshTlsValidationContextAcmTrust * _Nullable acm;

/**
 <p>An object that represents a TLS validation context trust for a local file.</p>
 */
@property (nonatomic, strong) AWSAppmeshTlsValidationContextFileTrust * _Nullable file;

@end

/**
 <p>An object that represents a port mapping.</p>
 Required parameters: [port, protocol]
 */
@interface AWSAppmeshPortMapping : AWSModel


/**
 <p>The port used for the port mapping.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The protocol used for the port mapping. Specify one protocol.</p>
 */
@property (nonatomic, assign) AWSAppmeshPortProtocol protocols;

@end

/**
 
 Required parameters: [virtualServices]
 */
@interface AWSAppmeshListVirtualServicesOutput : AWSModel


/**
 <p>The <code>nextToken</code> value to include in a future <code>ListVirtualServices</code>request. When the results of a <code>ListVirtualServices</code> request exceed <code>limit</code>, you can use this value to retrieve the next page of results. Thisvalue is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of existing virtual services for the specified service mesh.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppmeshVirtualServiceRef *> * _Nullable virtualServices;

@end

/**
 <p>An object that represents a target and its relative weight. Traffic is distributedacross targets according to their relative weight. For example, a weighted target with arelative weight of 50 receives five times as much traffic as one with a relative weight of10. The total weight for all targets combined must be less than or equal to 100.</p>
 Required parameters: [virtualNode, weight]
 */
@interface AWSAppmeshWeightedTarget : AWSModel


/**
 <p>The virtual node to associate with the weighted target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualNode;

/**
 <p>The relative weight of the weighted target.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable weight;

@end

/**
 <p>An object that represents a route returned by a list operation.</p>
 Required parameters: [arn, createdAt, lastUpdatedAt, meshName, meshOwner, resourceOwner, routeName, version, virtualRouterName]
 */
@interface AWSAppmeshRouteRef : AWSModel


/**
 <p>The full Amazon Resource Name (ARN) for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The Unix epoch timestamp in seconds for when the resource was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The Unix epoch timestamp in seconds for when the resource was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>The name of the service mesh that the route resides in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it'sthe ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The AWS IAM account ID of the resource owner. If the account ID is not your own, then it'sthe ID of the mesh owner or of another account that the mesh is shared with. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceOwner;

/**
 <p>The name of the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeName;

/**
 <p>The version of the resource. Resources are created at version 1, and this version is incremented each time that they're updated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

/**
 <p>The virtual router that the route is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualRouterName;

@end

/**
 
 Required parameters: [meshName, virtualNodeName]
 */
@interface AWSAppmeshDeleteVirtualNodeInput : AWSRequest


/**
 <p>The name of the service mesh to delete the virtual node in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it'sthe ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The name of the virtual node to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualNodeName;

@end

/**
 <p>An object that represents a route returned by a describe operation.</p>
 Required parameters: [meshName, metadata, routeName, spec, status, virtualRouterName]
 */
@interface AWSAppmeshRouteData : AWSModel


/**
 <p>The name of the service mesh that the route resides in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The associated metadata for the route.</p>
 */
@property (nonatomic, strong) AWSAppmeshResourceMetadata * _Nullable metadata;

/**
 <p>The name of the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeName;

/**
 <p>The specifications of the route.</p>
 */
@property (nonatomic, strong) AWSAppmeshRouteSpec * _Nullable spec;

/**
 <p>The status of the route.</p>
 */
@property (nonatomic, strong) AWSAppmeshRouteStatus * _Nullable status;

/**
 <p>The virtual router that the route is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualRouterName;

@end

/**
 <p>An object that represents a TLS validation context trust for an AWS Certicate Manager (ACM)certificate.</p>
 Required parameters: [certificateAuthorityArns]
 */
@interface AWSAppmeshTlsValidationContextAcmTrust : AWSModel


/**
 <p>One or more ACM Amazon Resource Name (ARN)s.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable certificateAuthorityArns;

@end

/**
 <p>An object that represents the method and value to match with the header value sent in arequest. Specify one match method.</p>
 */
@interface AWSAppmeshHeaderMatchMethod : AWSModel


/**
 <p>The value sent by the client must match the specified value exactly.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exact;

/**
 <p>The value sent by the client must begin with the specified characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>An object that represents the range of values to match on.</p>
 */
@property (nonatomic, strong) AWSAppmeshMatchRange * _Nullable range;

/**
 <p>The value sent by the client must include the specified characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regex;

/**
 <p>The value sent by the client must end with the specified characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable suffix;

@end

/**
 
 Required parameters: [mesh]
 */
@interface AWSAppmeshDeleteMeshOutput : AWSModel


/**
 <p>The service mesh that was deleted.</p>
 */
@property (nonatomic, strong) AWSAppmeshMeshData * _Nullable mesh;

@end

/**
 
 Required parameters: [resourceArn, tags]
 */
@interface AWSAppmeshTagResourceInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource to add tags to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tags to add to the resource. A tag is an array of key-value pairs.Tag keys can have a maximum character length of 128 characters, and tag values can have a maximum length of 256 characters.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppmeshTagRef *> * _Nullable tags;

@end

/**
 <p>An object that represents the provider for a virtual service.</p>
 */
@interface AWSAppmeshVirtualServiceProvider : AWSModel


/**
 <p>The virtual node associated with a virtual service.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualNodeServiceProvider * _Nullable virtualNode;

/**
 <p>The virtual router associated with a virtual service.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualRouterServiceProvider * _Nullable virtualRouter;

@end

/**
 <p>An object that represents the criteria for determining a request match.</p>
 */
@interface AWSAppmeshGrpcRouteMatch : AWSModel


/**
 <p>An object that represents the data to match from the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppmeshGrpcRouteMetadata *> * _Nullable metadata;

/**
 <p>The method name to match from the request. If you specify a name, you must also specifya <code>serviceName</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable methodName;

/**
 <p>The fully qualified domain name for the service to match from the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceName;

@end

/**
 <p>An object that represents the AWS Cloud Map service discovery information for your virtualnode.</p>
 Required parameters: [namespaceName, serviceName]
 */
@interface AWSAppmeshAwsCloudMapServiceDiscovery : AWSModel


/**
 <p>A string map that contains attributes with values that you can use to filter instancesby any custom attribute that you specified when you registered the instance. Only instancesthat match all of the specified key/value pairs will be returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppmeshAwsCloudMapInstanceAttribute *> * _Nullable attributes;

/**
 <p>The name of the AWS Cloud Map namespace to use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespaceName;

/**
 <p>The name of the AWS Cloud Map service to use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceName;

@end

/**
 
 Required parameters: [virtualService]
 */
@interface AWSAppmeshUpdateVirtualServiceOutput : AWSModel


/**
 <p>A full description of the virtual service that was updated.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualServiceData * _Nullable virtualService;

@end

/**
 <p>An object that represents the status of a service mesh.</p>
 */
@interface AWSAppmeshMeshStatus : AWSModel


/**
 <p>The current mesh status.</p>
 */
@property (nonatomic, assign) AWSAppmeshMeshStatusCode status;

@end

/**
 
 Required parameters: [meshName, spec, virtualNodeName]
 */
@interface AWSAppmeshCreateVirtualNodeInput : AWSRequest


/**
 <p>Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Up to 36 letters, numbers, hyphens, and underscores are allowed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The name of the service mesh to create the virtual node in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, thenthe account that you specify must share the mesh with your account before you can create the resource in the service mesh. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The virtual node specification to apply.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualNodeSpec * _Nullable spec;

/**
 <p>Optional metadata that you can apply to the virtual node to assist with categorizationand organization. Each tag consists of a key and an optional value, both of which youdefine. Tag keys can have a maximum character length of 128 characters, and tag values can have a maximum length of 256 characters.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppmeshTagRef *> * _Nullable tags;

/**
 <p>The name to use for the virtual node.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualNodeName;

@end

/**
 <p>An object that represents a route specification. Specify one route type.</p>
 */
@interface AWSAppmeshRouteSpec : AWSModel


/**
 <p>An object that represents the specification of a gRPC route.</p>
 */
@property (nonatomic, strong) AWSAppmeshGrpcRoute * _Nullable grpcRoute;

/**
 <p>An object that represents the specification of an HTTP/2 route.</p>
 */
@property (nonatomic, strong) AWSAppmeshHttpRoute * _Nullable http2Route;

/**
 <p>An object that represents the specification of an HTTP route.</p>
 */
@property (nonatomic, strong) AWSAppmeshHttpRoute * _Nullable httpRoute;

/**
 <p>The priority for the route. Routes are matched based on the specified value, where 0 isthe highest priority.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p>An object that represents the specification of a TCP route.</p>
 */
@property (nonatomic, strong) AWSAppmeshTcpRoute * _Nullable tcpRoute;

@end

/**
 
 Required parameters: [virtualService]
 */
@interface AWSAppmeshCreateVirtualServiceOutput : AWSModel


/**
 <p>The full description of your virtual service following the create call.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualServiceData * _Nullable virtualService;

@end

/**
 <p>An object that represents an access log file.</p>
 Required parameters: [path]
 */
@interface AWSAppmeshFileAccessLog : AWSModel


/**
 <p>The file path to write access logs to. You can use <code>/dev/stdout</code> to sendaccess logs to standard out and configure your Envoy container to use a log driver, such as <code>awslogs</code>, to export the access logs to a log storage service such as AmazonCloudWatch Logs. You can also specify a path in the Envoy container's file system to writethe files to disk.</p><note><p>The Envoy process must have write permissions to the path that you specify here. Otherwise, Envoy fails to bootstrap properly.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable path;

@end

/**
 <p>An object that represents a virtual node service provider.</p>
 Required parameters: [virtualRouterName]
 */
@interface AWSAppmeshVirtualRouterServiceProvider : AWSModel


/**
 <p>The name of the virtual router that is acting as a service provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualRouterName;

@end

/**
 
 */
@interface AWSAppmeshHttpTimeout : AWSModel


/**
 <p>An object that represents a duration of time.</p>
 */
@property (nonatomic, strong) AWSAppmeshDuration * _Nullable idle;

/**
 <p>An object that represents a duration of time.</p>
 */
@property (nonatomic, strong) AWSAppmeshDuration * _Nullable perRequest;

@end

/**
 
 Required parameters: [meshName, virtualServiceName]
 */
@interface AWSAppmeshDeleteVirtualServiceInput : AWSRequest


/**
 <p>The name of the service mesh to delete the virtual service in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it'sthe ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The name of the virtual service to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualServiceName;

@end

/**
 <p>An object that represents a Transport Layer Security (TLS) validation context.</p>
 Required parameters: [trust]
 */
@interface AWSAppmeshTlsValidationContext : AWSModel


/**
 <p>A reference to an object that represents a TLS validation context trust.</p>
 */
@property (nonatomic, strong) AWSAppmeshTlsValidationContextTrust * _Nullable trust;

@end

/**
 
 Required parameters: [virtualRouter]
 */
@interface AWSAppmeshDeleteVirtualRouterOutput : AWSModel


/**
 <p>The virtual router that was deleted.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualRouterData * _Nullable virtualRouter;

@end

/**
 
 Required parameters: [virtualNode]
 */
@interface AWSAppmeshDeleteVirtualNodeOutput : AWSModel


/**
 <p>The virtual node that was deleted.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualNodeData * _Nullable virtualNode;

@end

/**
 
 Required parameters: [meshName, spec, virtualNodeName]
 */
@interface AWSAppmeshUpdateVirtualNodeInput : AWSRequest


/**
 <p>Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Up to 36 letters, numbers, hyphens, and underscores are allowed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The name of the service mesh that the virtual node resides in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it'sthe ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The new virtual node specification to apply. This overwrites the existing data.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualNodeSpec * _Nullable spec;

/**
 <p>The name of the virtual node to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualNodeName;

@end

/**
 <p>An object that represents the Transport Layer Security (TLS) properties for a listener.</p>
 Required parameters: [certificate, mode]
 */
@interface AWSAppmeshListenerTls : AWSModel


/**
 <p>A reference to an object that represents a listener's TLS certificate.</p>
 */
@property (nonatomic, strong) AWSAppmeshListenerTlsCertificate * _Nullable certificate;

/**
 <p>Specify one of the following modes.</p><ul><li><p><b/>STRICT – Listener only accepts connections with TLSenabled. </p></li><li><p><b/>PERMISSIVE – Listener accepts connections with orwithout TLS enabled.</p></li><li><p><b/>DISABLED – Listener only accepts connections withoutTLS. </p></li></ul>
 */
@property (nonatomic, assign) AWSAppmeshListenerTlsMode mode;

@end

/**
 
 Required parameters: [meshName]
 */
@interface AWSAppmeshDeleteMeshInput : AWSRequest


/**
 <p>The name of the service mesh to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

@end

/**
 
 Required parameters: [meshName, spec, virtualServiceName]
 */
@interface AWSAppmeshCreateVirtualServiceInput : AWSRequest


/**
 <p>Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Up to 36 letters, numbers, hyphens, and underscores are allowed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The name of the service mesh to create the virtual service in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, thenthe account that you specify must share the mesh with your account before you can create the resource in the service mesh. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The virtual service specification to apply.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualServiceSpec * _Nullable spec;

/**
 <p>Optional metadata that you can apply to the virtual service to assist withcategorization and organization. Each tag consists of a key and an optional value, both ofwhich you define. Tag keys can have a maximum character length of 128 characters, and tag values can have a maximum length of 256 characters.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppmeshTagRef *> * _Nullable tags;

/**
 <p>The name to use for the virtual service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualServiceName;

@end

/**
 
 Required parameters: [meshName, spec, virtualRouterName]
 */
@interface AWSAppmeshUpdateVirtualRouterInput : AWSRequest


/**
 <p>Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Up to 36 letters, numbers, hyphens, and underscores are allowed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The name of the service mesh that the virtual router resides in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it'sthe ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The new virtual router specification to apply. This overwrites the existing data.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualRouterSpec * _Nullable spec;

/**
 <p>The name of the virtual router to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualRouterName;

@end

/**
 
 Required parameters: [resourceArn]
 */
@interface AWSAppmeshListTagsForResourceInput : AWSRequest


/**
 <p>The maximum number of tag results returned by <code>ListTagsForResource</code> inpaginated output. When this parameter is used, <code>ListTagsForResource</code> returnsonly <code>limit</code> results in a single page along with a <code>nextToken</code>response element. You can see the remaining results of the initial request by sendinganother <code>ListTagsForResource</code> request with the returned <code>nextToken</code>value. This value can be between 1 and 100. If you don't usethis parameter, <code>ListTagsForResource</code> returns up to 100results and a <code>nextToken</code> value if applicable.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The <code>nextToken</code> value returned from a previous paginated <code>ListTagsForResource</code> request where <code>limit</code> was used and theresults exceeded the value of that parameter. Pagination continues from the end of theprevious results that returned the <code>nextToken</code> value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The Amazon Resource Name (ARN) that identifies the resource to list the tags for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 Required parameters: [mesh]
 */
@interface AWSAppmeshDescribeMeshOutput : AWSModel


/**
 <p>The full description of your service mesh.</p>
 */
@property (nonatomic, strong) AWSAppmeshMeshData * _Nullable mesh;

@end

/**
 
 Required parameters: [meshName, virtualRouterName]
 */
@interface AWSAppmeshDeleteVirtualRouterInput : AWSRequest


/**
 <p>The name of the service mesh to delete the virtual router in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it'sthe ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The name of the virtual router to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualRouterName;

@end

/**
 
 Required parameters: [meshName, routeName, virtualRouterName]
 */
@interface AWSAppmeshDescribeRouteInput : AWSRequest


/**
 <p>The name of the service mesh that the route resides in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it'sthe ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The name of the route to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeName;

/**
 <p>The name of the virtual router that the route is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualRouterName;

@end

/**
 
 Required parameters: [route]
 */
@interface AWSAppmeshDeleteRouteOutput : AWSModel


/**
 <p>The route that was deleted.</p>
 */
@property (nonatomic, strong) AWSAppmeshRouteData * _Nullable route;

@end

/**
 
 Required parameters: [meshName, spec, virtualServiceName]
 */
@interface AWSAppmeshUpdateVirtualServiceInput : AWSRequest


/**
 <p>Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Up to 36 letters, numbers, hyphens, and underscores are allowed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The name of the service mesh that the virtual service resides in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it'sthe ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The new virtual service specification to apply. This overwrites the existingdata.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualServiceSpec * _Nullable spec;

/**
 <p>The name of the virtual service to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualServiceName;

@end

/**
 
 Required parameters: [route]
 */
@interface AWSAppmeshUpdateRouteOutput : AWSModel


/**
 <p>A full description of the route that was updated.</p>
 */
@property (nonatomic, strong) AWSAppmeshRouteData * _Nullable route;

@end

/**
 <p>An object that represents the action to take if a match is determined.</p>
 Required parameters: [weightedTargets]
 */
@interface AWSAppmeshHttpRouteAction : AWSModel


/**
 <p>An object that represents the targets that traffic is routed to when a request matches the route.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppmeshWeightedTarget *> * _Nullable weightedTargets;

@end

/**
 
 Required parameters: [meshName, virtualRouterName]
 */
@interface AWSAppmeshListRoutesInput : AWSRequest


/**
 <p>The maximum number of results returned by <code>ListRoutes</code> in paginated output.When you use this parameter, <code>ListRoutes</code> returns only <code>limit</code>results in a single page along with a <code>nextToken</code> response element. You can seethe remaining results of the initial request by sending another <code>ListRoutes</code>request with the returned <code>nextToken</code> value. This value can be between1 and 100. If you don't use this parameter, <code>ListRoutes</code> returns up to 100 results and a <code>nextToken</code> value if applicable.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The name of the service mesh to list routes in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it'sthe ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The <code>nextToken</code> value returned from a previous paginated <code>ListRoutes</code> request where <code>limit</code> was used and the resultsexceeded the value of that parameter. Pagination continues from the end of the previousresults that returned the <code>nextToken</code> value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the virtual router to list routes in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualRouterName;

@end

/**
 <p>An object that represents a virtual service returned by a list operation.</p>
 Required parameters: [arn, createdAt, lastUpdatedAt, meshName, meshOwner, resourceOwner, version, virtualServiceName]
 */
@interface AWSAppmeshVirtualServiceRef : AWSModel


/**
 <p>The full Amazon Resource Name (ARN) for the virtual service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The Unix epoch timestamp in seconds for when the resource was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The Unix epoch timestamp in seconds for when the resource was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>The name of the service mesh that the virtual service resides in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it'sthe ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The AWS IAM account ID of the resource owner. If the account ID is not your own, then it'sthe ID of the mesh owner or of another account that the mesh is shared with. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceOwner;

/**
 <p>The version of the resource. Resources are created at version 1, and this version is incremented each time that they're updated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

/**
 <p>The name of the virtual service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualServiceName;

@end

/**
 
 */
@interface AWSAppmeshGrpcTimeout : AWSModel


/**
 <p>An object that represents a duration of time.</p>
 */
@property (nonatomic, strong) AWSAppmeshDuration * _Nullable idle;

/**
 <p>An object that represents a duration of time.</p>
 */
@property (nonatomic, strong) AWSAppmeshDuration * _Nullable perRequest;

@end

/**
 <p>An object that represents the current status of the virtual node.</p>
 Required parameters: [status]
 */
@interface AWSAppmeshVirtualNodeStatus : AWSModel


/**
 <p>The current status of the virtual node.</p>
 */
@property (nonatomic, assign) AWSAppmeshVirtualNodeStatusCode status;

@end

/**
 <p>An object that represents a virtual router returned by a list operation.</p>
 Required parameters: [arn, createdAt, lastUpdatedAt, meshName, meshOwner, resourceOwner, version, virtualRouterName]
 */
@interface AWSAppmeshVirtualRouterRef : AWSModel


/**
 <p>The full Amazon Resource Name (ARN) for the virtual router.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The Unix epoch timestamp in seconds for when the resource was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The Unix epoch timestamp in seconds for when the resource was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>The name of the service mesh that the virtual router resides in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it'sthe ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The AWS IAM account ID of the resource owner. If the account ID is not your own, then it'sthe ID of the mesh owner or of another account that the mesh is shared with. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceOwner;

/**
 <p>The version of the resource. Resources are created at version 1, and this version is incremented each time that they're updated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

/**
 <p>The name of the virtual router.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualRouterName;

@end

/**
 <p>An object that represents a virtual service returned by a describe operation.</p>
 Required parameters: [meshName, metadata, spec, status, virtualServiceName]
 */
@interface AWSAppmeshVirtualServiceData : AWSModel


/**
 <p>The name of the service mesh that the virtual service resides in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>An object that represents metadata for a resource.</p>
 */
@property (nonatomic, strong) AWSAppmeshResourceMetadata * _Nullable metadata;

/**
 <p>The specifications of the virtual service.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualServiceSpec * _Nullable spec;

/**
 <p>The current status of the virtual service.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualServiceStatus * _Nullable status;

/**
 <p>The name of the virtual service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualServiceName;

@end

/**
 <p>An object that represents the HTTP header in the request.</p>
 Required parameters: [name]
 */
@interface AWSAppmeshHttpRouteHeader : AWSModel


/**
 <p>Specify <code>True</code> to match anything except the match criteria. The default value is <code>False</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable invert;

/**
 <p>The <code>HeaderMatchMethod</code> object.</p>
 */
@property (nonatomic, strong) AWSAppmeshHeaderMatchMethod * _Nullable match;

/**
 <p>A name for the HTTP header in the client request that will be matched on.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>An object that represents a virtual node returned by a list operation.</p>
 Required parameters: [arn, createdAt, lastUpdatedAt, meshName, meshOwner, resourceOwner, version, virtualNodeName]
 */
@interface AWSAppmeshVirtualNodeRef : AWSModel


/**
 <p>The full Amazon Resource Name (ARN) for the virtual node.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The Unix epoch timestamp in seconds for when the resource was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The Unix epoch timestamp in seconds for when the resource was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>The name of the service mesh that the virtual node resides in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it'sthe ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The AWS IAM account ID of the resource owner. If the account ID is not your own, then it'sthe ID of the mesh owner or of another account that the mesh is shared with. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceOwner;

/**
 <p>The version of the resource. Resources are created at version 1, and this version is incremented each time that they're updated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

/**
 <p>The name of the virtual node.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualNodeName;

@end

/**
 
 Required parameters: [meshName]
 */
@interface AWSAppmeshCreateMeshInput : AWSRequest


/**
 <p>Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Up to 36 letters, numbers, hyphens, and underscores are allowed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The name to use for the service mesh.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The service mesh specification to apply.</p>
 */
@property (nonatomic, strong) AWSAppmeshMeshSpec * _Nullable spec;

/**
 <p>Optional metadata that you can apply to the service mesh to assist with categorizationand organization. Each tag consists of a key and an optional value, both of which youdefine. Tag keys can have a maximum character length of 128 characters, and tag values can have a maximum length of 256 characters.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppmeshTagRef *> * _Nullable tags;

@end

/**
 <p>An object that represents the action to take if a match is determined.</p>
 Required parameters: [weightedTargets]
 */
@interface AWSAppmeshGrpcRouteAction : AWSModel


/**
 <p>An object that represents the targets that traffic is routed to when a request matches the route.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppmeshWeightedTarget *> * _Nullable weightedTargets;

@end

/**
 
 Required parameters: [mesh]
 */
@interface AWSAppmeshUpdateMeshOutput : AWSModel


/**
 <p>An object that represents a service mesh returned by a describe operation.</p>
 */
@property (nonatomic, strong) AWSAppmeshMeshData * _Nullable mesh;

@end

/**
 <p>An object that represents the match method. Specify one of the match values.</p>
 */
@interface AWSAppmeshGrpcRouteMetadataMatchMethod : AWSModel


/**
 <p>The value sent by the client must match the specified value exactly.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exact;

/**
 <p>The value sent by the client must begin with the specified characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>An object that represents the range of values to match on.</p>
 */
@property (nonatomic, strong) AWSAppmeshMatchRange * _Nullable range;

/**
 <p>The value sent by the client must include the specified characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regex;

/**
 <p>The value sent by the client must end with the specified characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable suffix;

@end

/**
 
 Required parameters: [meshName, virtualServiceName]
 */
@interface AWSAppmeshDescribeVirtualServiceInput : AWSRequest


/**
 <p>The name of the service mesh that the virtual service resides in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it'sthe ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The name of the virtual service to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualServiceName;

@end

/**
 <p>An object that represents the AWS Cloud Map attribute information for your virtualnode.</p>
 Required parameters: [key, value]
 */
@interface AWSAppmeshAwsCloudMapInstanceAttribute : AWSModel


/**
 <p>The name of an AWS Cloud Map service instance attribute key. Any AWS Cloud Map serviceinstance that contains the specified key and value is returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value of an AWS Cloud Map service instance attribute key. Any AWS Cloud Map serviceinstance that contains the specified key and value is returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>An object that represents the specification of a virtual service.</p>
 */
@interface AWSAppmeshVirtualServiceSpec : AWSModel


/**
 <p>The App Mesh object that is acting as the provider for a virtual service. You can specifya single virtual node or virtual router.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualServiceProvider * _Nullable provider;

@end

/**
 <p>An object that represents the range of values to match on. The first character of the range is included in the range, though the last character is not. For example, if the range specified were 1-100, only values 1-99 would be matched.</p>
 Required parameters: [end, start]
 */
@interface AWSAppmeshMatchRange : AWSModel


/**
 <p>The end of the range.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable end;

/**
 <p>The start of the range.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable start;

@end

/**
 <p>An object that represents a TCP route type.</p>
 Required parameters: [action]
 */
@interface AWSAppmeshTcpRoute : AWSModel


/**
 <p>The action to take if a match is determined.</p>
 */
@property (nonatomic, strong) AWSAppmeshTcpRouteAction * _Nullable action;

/**
 
 */
@property (nonatomic, strong) AWSAppmeshTcpTimeout * _Nullable timeout;

@end

/**
 
 Required parameters: [meshName]
 */
@interface AWSAppmeshListVirtualRoutersInput : AWSRequest


/**
 <p>The maximum number of results returned by <code>ListVirtualRouters</code> in paginatedoutput. When you use this parameter, <code>ListVirtualRouters</code> returns only <code>limit</code> results in a single page along with a <code>nextToken</code> responseelement. You can see the remaining results of the initial request by sending another <code>ListVirtualRouters</code> request with the returned <code>nextToken</code> value.This value can be between 1 and 100. If you don't use thisparameter, <code>ListVirtualRouters</code> returns up to 100 results anda <code>nextToken</code> value if applicable.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The name of the service mesh to list virtual routers in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it'sthe ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The <code>nextToken</code> value returned from a previous paginated <code>ListVirtualRouters</code> request where <code>limit</code> was used and theresults exceeded the value of that parameter. Pagination continues from the end of theprevious results that returned the <code>nextToken</code> value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 Required parameters: [meshName]
 */
@interface AWSAppmeshListVirtualServicesInput : AWSRequest


/**
 <p>The maximum number of results returned by <code>ListVirtualServices</code> in paginatedoutput. When you use this parameter, <code>ListVirtualServices</code> returns only <code>limit</code> results in a single page along with a <code>nextToken</code> responseelement. You can see the remaining results of the initial request by sending another <code>ListVirtualServices</code> request with the returned <code>nextToken</code> value.This value can be between 1 and 100. If you don't use thisparameter, <code>ListVirtualServices</code> returns up to 100 results anda <code>nextToken</code> value if applicable.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The name of the service mesh to list virtual services in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it'sthe ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The <code>nextToken</code> value returned from a previous paginated <code>ListVirtualServices</code> request where <code>limit</code> was used and theresults exceeded the value of that parameter. Pagination continues from the end of theprevious results that returned the <code>nextToken</code> value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>An object that represents the access logging information for a virtual node.</p>
 */
@interface AWSAppmeshAccessLog : AWSModel


/**
 <p>The file object to send virtual node access logs to.</p>
 */
@property (nonatomic, strong) AWSAppmeshFileAccessLog * _Nullable file;

@end

/**
 
 Required parameters: [meshName]
 */
@interface AWSAppmeshListVirtualNodesInput : AWSRequest


/**
 <p>The maximum number of results returned by <code>ListVirtualNodes</code> in paginatedoutput. When you use this parameter, <code>ListVirtualNodes</code> returns only <code>limit</code> results in a single page along with a <code>nextToken</code> responseelement. You can see the remaining results of the initial request by sending another <code>ListVirtualNodes</code> request with the returned <code>nextToken</code> value.This value can be between 1 and 100. If you don't use thisparameter, <code>ListVirtualNodes</code> returns up to 100 results and a <code>nextToken</code> value if applicable.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The name of the service mesh to list virtual nodes in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it'sthe ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The <code>nextToken</code> value returned from a previous paginated <code>ListVirtualNodes</code> request where <code>limit</code> was used and the resultsexceeded the value of that parameter. Pagination continues from the end of the previousresults that returned the <code>nextToken</code> value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>An object that represents a duration of time.</p>
 */
@interface AWSAppmeshDuration : AWSModel


/**
 <p>A unit of time.</p>
 */
@property (nonatomic, assign) AWSAppmeshDurationUnit unit;

/**
 <p>A number of time units.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 
 Required parameters: [route]
 */
@interface AWSAppmeshDescribeRouteOutput : AWSModel


/**
 <p>The full description of your route.</p>
 */
@property (nonatomic, strong) AWSAppmeshRouteData * _Nullable route;

@end

/**
 <p>An object that represents the requirements for a route to match HTTP requests for avirtual router.</p>
 Required parameters: [prefix]
 */
@interface AWSAppmeshHttpRouteMatch : AWSModel


/**
 <p>An object that represents the client request headers to match on.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppmeshHttpRouteHeader *> * _Nullable headers;

/**
 <p>The client request method to match on. Specify only one.</p>
 */
@property (nonatomic, assign) AWSAppmeshHttpMethod method;

/**
 <p>Specifies the path to match requests with. This parameter must always start with <code>/</code>, which by itself matches all requests to the virtual service name. Youcan also match for path-based routing of requests. For example, if your virtual servicename is <code>my-service.local</code> and you want the route to match requests to <code>my-service.local/metrics</code>, your prefix should be<code>/metrics</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>The client request scheme to match on. Specify only one.</p>
 */
@property (nonatomic, assign) AWSAppmeshHttpScheme scheme;

@end

/**
 <p>Optional metadata that you apply to a resource to assist with categorization andorganization. Each tag consists of a key and an optional value, both of which you define.Tag keys can have a maximum character length of 128 characters, and tag values can have a maximum length of 256 characters.</p>
 Required parameters: [key]
 */
@interface AWSAppmeshTagRef : AWSModel


/**
 <p>One part of a key-value pair that make up a tag. A <code>key</code> is a general labelthat acts like a category for more specific tag values.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The optional part of a key-value pair that make up a tag. A <code>value</code> acts as adescriptor within a tag category (key).</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>An object that represents a service mesh returned by a list operation.</p>
 Required parameters: [arn, createdAt, lastUpdatedAt, meshName, meshOwner, resourceOwner, version]
 */
@interface AWSAppmeshMeshRef : AWSModel


/**
 <p>The full Amazon Resource Name (ARN) of the service mesh.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The Unix epoch timestamp in seconds for when the resource was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The Unix epoch timestamp in seconds for when the resource was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>The name of the service mesh.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it'sthe ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The AWS IAM account ID of the resource owner. If the account ID is not your own, then it'sthe ID of the mesh owner or of another account that the mesh is shared with. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceOwner;

/**
 <p>The version of the resource. Resources are created at version 1, and this version is incremented each time that they're updated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>An object that represents a service mesh returned by a describe operation.</p>
 Required parameters: [meshName, metadata, spec, status]
 */
@interface AWSAppmeshMeshData : AWSModel


/**
 <p>The name of the service mesh.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The associated metadata for the service mesh.</p>
 */
@property (nonatomic, strong) AWSAppmeshResourceMetadata * _Nullable metadata;

/**
 <p>The associated specification for the service mesh.</p>
 */
@property (nonatomic, strong) AWSAppmeshMeshSpec * _Nullable spec;

/**
 <p>The status of the service mesh.</p>
 */
@property (nonatomic, strong) AWSAppmeshMeshStatus * _Nullable status;

@end

/**
 <p>An object that represents the status of a virtual router. </p>
 Required parameters: [status]
 */
@interface AWSAppmeshVirtualRouterStatus : AWSModel


/**
 <p>The current status of the virtual router.</p>
 */
@property (nonatomic, assign) AWSAppmeshVirtualRouterStatusCode status;

@end

/**
 <p>An object that represents the action to take if a match is determined.</p>
 Required parameters: [weightedTargets]
 */
@interface AWSAppmeshTcpRouteAction : AWSModel


/**
 <p>An object that represents the targets that traffic is routed to when a request matches the route.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppmeshWeightedTarget *> * _Nullable weightedTargets;

@end

/**
 
 Required parameters: [meshName, virtualNodeName]
 */
@interface AWSAppmeshDescribeVirtualNodeInput : AWSRequest


/**
 <p>The name of the service mesh that the virtual node resides in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it'sthe ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The name of the virtual node to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualNodeName;

@end

/**
 <p>An object that represents the current status of a route.</p>
 Required parameters: [status]
 */
@interface AWSAppmeshRouteStatus : AWSModel


/**
 <p>The current status for the route.</p>
 */
@property (nonatomic, assign) AWSAppmeshRouteStatusCode status;

@end

/**
 <p>An object that represents a listener for a virtual node.</p>
 Required parameters: [portMapping]
 */
@interface AWSAppmeshListener : AWSModel


/**
 <p>The health check information for the listener.</p>
 */
@property (nonatomic, strong) AWSAppmeshHealthCheckPolicy * _Nullable healthCheck;

/**
 <p>The port mapping information for the listener.</p>
 */
@property (nonatomic, strong) AWSAppmeshPortMapping * _Nullable portMapping;

/**
 
 */
@property (nonatomic, strong) AWSAppmeshListenerTimeout * _Nullable timeout;

/**
 <p>A reference to an object that represents the Transport Layer Security (TLS) properties for a listener.</p>
 */
@property (nonatomic, strong) AWSAppmeshListenerTls * _Nullable tls;

@end

/**
 <p>An object that represents a gRPC route type.</p>
 Required parameters: [action, match]
 */
@interface AWSAppmeshGrpcRoute : AWSModel


/**
 <p>An object that represents the action to take if a match is determined.</p>
 */
@property (nonatomic, strong) AWSAppmeshGrpcRouteAction * _Nullable action;

/**
 <p>An object that represents the criteria for determining a request match.</p>
 */
@property (nonatomic, strong) AWSAppmeshGrpcRouteMatch * _Nullable match;

/**
 <p>An object that represents a retry policy.</p>
 */
@property (nonatomic, strong) AWSAppmeshGrpcRetryPolicy * _Nullable retryPolicy;

/**
 
 */
@property (nonatomic, strong) AWSAppmeshGrpcTimeout * _Nullable timeout;

@end

/**
 <p>An object that represents a Transport Layer Security (TLS) client policy.</p>
 Required parameters: [validation]
 */
@interface AWSAppmeshClientPolicyTls : AWSModel


/**
 <p>Whether the policy is enforced. The default is <code>True</code>, if a value isn'tspecified.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enforce;

/**
 <p>One or more ports that the policy is enforced for.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable ports;

/**
 <p>A reference to an object that represents a TLS validation context.</p>
 */
@property (nonatomic, strong) AWSAppmeshTlsValidationContext * _Nullable validation;

@end

/**
 
 Required parameters: [virtualService]
 */
@interface AWSAppmeshDeleteVirtualServiceOutput : AWSModel


/**
 <p>The virtual service that was deleted.</p>
 */
@property (nonatomic, strong) AWSAppmeshVirtualServiceData * _Nullable virtualService;

@end

/**
 <p>An object that represents a virtual node service provider.</p>
 Required parameters: [virtualNodeName]
 */
@interface AWSAppmeshVirtualNodeServiceProvider : AWSModel


/**
 <p>The name of the virtual node that is acting as a service provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualNodeName;

@end

/**
 <p>An object that represents the default properties for a backend.</p>
 */
@interface AWSAppmeshBackendDefaults : AWSModel


/**
 <p>A reference to an object that represents a client policy.</p>
 */
@property (nonatomic, strong) AWSAppmeshClientPolicy * _Nullable clientPolicy;

@end

/**
 <p>An object that represents a local file certificate.The certificate must meet specific requirements and you must have proxy authorization enabled. For more information, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/tls.html#virtual-node-tls-prerequisites">Transport Layer Security (TLS)</a>.</p>
 Required parameters: [certificateChain, privateKey]
 */
@interface AWSAppmeshListenerTlsFileCertificate : AWSModel


/**
 <p>The certificate chain for the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateChain;

/**
 <p>The private key for a certificate stored on the file system of the virtual node that theproxy is running on.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateKey;

@end

/**
 <p>An object that represents a retry policy. Specify at least one value for at least one of the types of <code>RetryEvents</code>, a value for <code>maxRetries</code>, and a value for <code>perRetryTimeout</code>.</p>
 Required parameters: [maxRetries, perRetryTimeout]
 */
@interface AWSAppmeshHttpRetryPolicy : AWSModel


/**
 <p>Specify at least one of the following values.</p><ul><li><p><b>server-error</b> – HTTP status codes 500, 501, 502, 503, 504, 505, 506, 507, 508, 510, and 511</p></li><li><p><b>gateway-error</b> – HTTP status codes 502, 503, and 504</p></li><li><p><b>client-error</b> – HTTP status code 409</p></li><li><p><b>stream-error</b> – Retry on refused stream</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable httpRetryEvents;

/**
 <p>The maximum number of retry attempts.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRetries;

/**
 <p>An object that represents a duration of time.</p>
 */
@property (nonatomic, strong) AWSAppmeshDuration * _Nullable perRetryTimeout;

/**
 <p>Specify a valid value.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tcpRetryEvents;

@end

/**
 
 Required parameters: [meshName, virtualRouterName]
 */
@interface AWSAppmeshDescribeVirtualRouterInput : AWSRequest


/**
 <p>The name of the service mesh that the virtual router resides in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it'sthe ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The name of the virtual router to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualRouterName;

@end

/**
 
 */
@interface AWSAppmeshTagResourceOutput : AWSModel


@end

/**
 <p>An object that represents a Transport Layer Security (TLS) validation context trust for a local file.</p>
 Required parameters: [certificateChain]
 */
@interface AWSAppmeshTlsValidationContextFileTrust : AWSModel


/**
 <p>The certificate trust chain for a certificate stored on the file system of the virtualnode that the proxy is running on.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateChain;

@end

/**
 <p>An object that represents the match metadata for the route.</p>
 Required parameters: [name]
 */
@interface AWSAppmeshGrpcRouteMetadata : AWSModel


/**
 <p>Specify <code>True</code> to match anything except the match criteria. The default value is <code>False</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable invert;

/**
 <p>An object that represents the data to match from the request.</p>
 */
@property (nonatomic, strong) AWSAppmeshGrpcRouteMetadataMatchMethod * _Nullable match;

/**
 <p>The name of the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 Required parameters: [meshName, routeName, spec, virtualRouterName]
 */
@interface AWSAppmeshCreateRouteInput : AWSRequest


/**
 <p>Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Up to 36 letters, numbers, hyphens, and underscores are allowed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The name of the service mesh to create the route in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, thenthe account that you specify must share the mesh with your account before you can create the resource in the service mesh. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The name to use for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeName;

/**
 <p>The route specification to apply.</p>
 */
@property (nonatomic, strong) AWSAppmeshRouteSpec * _Nullable spec;

/**
 <p>Optional metadata that you can apply to the route to assist with categorization andorganization. Each tag consists of a key and an optional value, both of which you define.Tag keys can have a maximum character length of 128 characters, and tag values can have a maximum length of 256 characters.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppmeshTagRef *> * _Nullable tags;

/**
 <p>The name of the virtual router in which to create the route. If the virtual router is ina shared mesh, then you must be the owner of the virtual router resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualRouterName;

@end

/**
 
 */
@interface AWSAppmeshTcpTimeout : AWSModel


/**
 <p>An object that represents a duration of time.</p>
 */
@property (nonatomic, strong) AWSAppmeshDuration * _Nullable idle;

@end

/**
 
 Required parameters: [meshName, routeName, spec, virtualRouterName]
 */
@interface AWSAppmeshUpdateRouteInput : AWSRequest


/**
 <p>Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Up to 36 letters, numbers, hyphens, and underscores are allowed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The name of the service mesh that the route resides in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it'sthe ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

/**
 <p>The name of the route to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeName;

/**
 <p>The new route specification to apply. This overwrites the existing data.</p>
 */
@property (nonatomic, strong) AWSAppmeshRouteSpec * _Nullable spec;

/**
 <p>The name of the virtual router that the route is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualRouterName;

@end

/**
 <p>An object that represents an HTTP or HTTP/2 route type.</p>
 Required parameters: [action, match]
 */
@interface AWSAppmeshHttpRoute : AWSModel


/**
 <p>An object that represents the action to take if a match is determined.</p>
 */
@property (nonatomic, strong) AWSAppmeshHttpRouteAction * _Nullable action;

/**
 <p>An object that represents the criteria for determining a request match.</p>
 */
@property (nonatomic, strong) AWSAppmeshHttpRouteMatch * _Nullable match;

/**
 <p>An object that represents a retry policy.</p>
 */
@property (nonatomic, strong) AWSAppmeshHttpRetryPolicy * _Nullable retryPolicy;

/**
 
 */
@property (nonatomic, strong) AWSAppmeshHttpTimeout * _Nullable timeout;

@end

/**
 
 Required parameters: [meshName]
 */
@interface AWSAppmeshDescribeMeshInput : AWSRequest


/**
 <p>The name of the service mesh to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshName;

/**
 <p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it'sthe ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working with shared meshes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meshOwner;

@end

/**
 <p>An object that represents the specification of a service mesh.</p>
 */
@interface AWSAppmeshMeshSpec : AWSModel


/**
 <p>The egress filter rules for the service mesh.</p>
 */
@property (nonatomic, strong) AWSAppmeshEgressFilter * _Nullable egressFilter;

@end

/**
 
 Required parameters: [tags]
 */
@interface AWSAppmeshListTagsForResourceOutput : AWSModel


/**
 <p>The <code>nextToken</code> value to include in a future <code>ListTagsForResource</code>request. When the results of a <code>ListTagsForResource</code> request exceed <code>limit</code>, you can use this value to retrieve the next page of results. Thisvalue is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The tags for the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppmeshTagRef *> * _Nullable tags;

@end

/**
 <p>An object that represents the service discovery information for a virtual node.</p>
 */
@interface AWSAppmeshServiceDiscovery : AWSModel


/**
 <p>Specifies any AWS Cloud Map information for the virtual node.</p>
 */
@property (nonatomic, strong) AWSAppmeshAwsCloudMapServiceDiscovery * _Nullable awsCloudMap;

/**
 <p>Specifies the DNS information for the virtual node.</p>
 */
@property (nonatomic, strong) AWSAppmeshDnsServiceDiscovery * _Nullable dns;

@end

/**
 
 Required parameters: [virtualNodes]
 */
@interface AWSAppmeshListVirtualNodesOutput : AWSModel


/**
 <p>The <code>nextToken</code> value to include in a future <code>ListVirtualNodes</code>request. When the results of a <code>ListVirtualNodes</code> request exceed <code>limit</code>, you can use this value to retrieve the next page of results. Thisvalue is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of existing virtual nodes for the specified service mesh.</p>
 */
@property (nonatomic, strong) NSArray<AWSAppmeshVirtualNodeRef *> * _Nullable virtualNodes;

@end

/**
 
 Required parameters: [resourceArn, tagKeys]
 */
@interface AWSAppmeshUntagResourceInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource to delete tags from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The keys of the tags to be removed.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 <p>An object that represents an AWS Certicate Manager (ACM) certificate.</p>
 Required parameters: [certificateArn]
 */
@interface AWSAppmeshListenerTlsAcmCertificate : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the certificate. The certificate must meet specific requirements and you must have proxy authorization enabled. For more information, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/tls.html#virtual-node-tls-prerequisites">Transport Layer Security (TLS)</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

@end

NS_ASSUME_NONNULL_END
