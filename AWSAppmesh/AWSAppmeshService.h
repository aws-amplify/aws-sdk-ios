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
#import <AWSCore/AWSCore.h>
#import "AWSAppmeshModel.h"
#import "AWSAppmeshResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSAppmesh
FOUNDATION_EXPORT NSString *const AWSAppmeshSDKVersion;

/**
 <p>AWS App Mesh is a service mesh based on the Envoy proxy that makes it easy to monitor andcontrol microservices. App Mesh standardizes how your microservices communicate, giving youend-to-end visibility and helping to ensure high availability for your applications.</p><p>App Mesh gives you consistent visibility and network traffic controls for everymicroservice in an application. You can use App Mesh with AWS Fargate, Amazon ECS, Amazon EKS,Kubernetes on AWS, and Amazon EC2.</p><note><p>App Mesh supports microservice applications that use service discovery naming for their components. For more information about service discovery on Amazon ECS, see <a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html">Service Discovery</a> in the <i>Amazon Elastic Container Service Developer Guide</i>. Kubernetes<code>kube-dns</code> and <code>coredns</code> are supported. For more information, see <a href="https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/">DNSfor Services and Pods</a> in the Kubernetes documentation.</p></note>
 */
@interface AWSAppmesh : AWSService

/**
 The service configuration used to instantiate this service client.
 
 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 */
@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

/**
 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`
 
 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
          AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                          identityPoolId:@"YourIdentityPoolId"];
          AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
          [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;

          return YES;
      }

 Then call the following to get the default service client:

 *Swift*

     let Appmesh = AWSAppmesh.default()

 *Objective-C*

     AWSAppmesh *Appmesh = [AWSAppmesh defaultAppmesh];

 @return The default service client.
 */
+ (instancetype)defaultAppmesh;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSAppmesh.register(with: configuration!, forKey: "USWest2Appmesh")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSAppmesh registerAppmeshWithConfiguration:configuration forKey:@"USWest2Appmesh"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Appmesh = AWSAppmesh(forKey: "USWest2Appmesh")

 *Objective-C*

     AWSAppmesh *Appmesh = [AWSAppmesh AppmeshForKey:@"USWest2Appmesh"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerAppmeshWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerAppmeshWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSAppmesh.register(with: configuration!, forKey: "USWest2Appmesh")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSAppmesh registerAppmeshWithConfiguration:configuration forKey:@"USWest2Appmesh"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Appmesh = AWSAppmesh(forKey: "USWest2Appmesh")

 *Objective-C*

     AWSAppmesh *Appmesh = [AWSAppmesh AppmeshForKey:@"USWest2Appmesh"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)AppmeshForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeAppmeshForKey:(NSString *)key;

/**
 <p>Creates a service mesh.</p><p> A service mesh is a logical boundary for network traffic between services that arerepresented by resources within the mesh. After you create your service mesh, you cancreate virtual services, virtual nodes, virtual routers, and routes to distribute trafficbetween the applications in your mesh.</p><p>For more information about service meshes, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/meshes.html">Service meshes</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateMesh service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshCreateMeshOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorConflict`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorLimitExceeded`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshCreateMeshInput
 @see AWSAppmeshCreateMeshOutput
 */
- (AWSTask<AWSAppmeshCreateMeshOutput *> *)createMesh:(AWSAppmeshCreateMeshInput *)request;

/**
 <p>Creates a service mesh.</p><p> A service mesh is a logical boundary for network traffic between services that arerepresented by resources within the mesh. After you create your service mesh, you cancreate virtual services, virtual nodes, virtual routers, and routes to distribute trafficbetween the applications in your mesh.</p><p>For more information about service meshes, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/meshes.html">Service meshes</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateMesh service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorConflict`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorLimitExceeded`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshCreateMeshInput
 @see AWSAppmeshCreateMeshOutput
 */
- (void)createMesh:(AWSAppmeshCreateMeshInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshCreateMeshOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a route that is associated with a virtual router.</p><p> You can route several different protocols and define a retry policy for a route.Traffic can be routed to one or more virtual nodes.</p><p>For more information about routes, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/routes.html">Routes</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRoute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshCreateRouteOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorConflict`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorLimitExceeded`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshCreateRouteInput
 @see AWSAppmeshCreateRouteOutput
 */
- (AWSTask<AWSAppmeshCreateRouteOutput *> *)createRoute:(AWSAppmeshCreateRouteInput *)request;

/**
 <p>Creates a route that is associated with a virtual router.</p><p> You can route several different protocols and define a retry policy for a route.Traffic can be routed to one or more virtual nodes.</p><p>For more information about routes, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/routes.html">Routes</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRoute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorConflict`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorLimitExceeded`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshCreateRouteInput
 @see AWSAppmeshCreateRouteOutput
 */
- (void)createRoute:(AWSAppmeshCreateRouteInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshCreateRouteOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a virtual node within a service mesh.</p><p> A virtual node acts as a logical pointer to a particular task group, such as an Amazon ECSservice or a Kubernetes deployment. When you create a virtual node, you can specify theservice discovery information for your task group, and whether the proxy running in a taskgroup will communicate with other proxies using Transport Layer Security (TLS).</p><p>You define a <code>listener</code> for any inbound traffic that your virtual nodeexpects. Any virtual service that your virtual node expects to communicate to is specifiedas a <code>backend</code>.</p><p>The response metadata for your new virtual node contains the <code>arn</code> that isassociated with the virtual node. Set this value (either the full ARN or the truncatedresource name: for example, <code>mesh/default/virtualNode/simpleapp</code>) as the <code>APPMESH_VIRTUAL_NODE_NAME</code> environment variable for your task group's Envoyproxy container in your task definition or pod spec. This is then mapped to the <code>node.id</code> and <code>node.cluster</code> Envoy parameters.</p><note><p>If you require your Envoy stats or tracing to use a different name, you can override the <code>node.cluster</code> value that is set by<code>APPMESH_VIRTUAL_NODE_NAME</code> with the<code>APPMESH_VIRTUAL_NODE_CLUSTER</code> environment variable.</p></note><p>For more information about virtual nodes, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/virtual_nodes.html">Virtual nodes</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVirtualNode service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshCreateVirtualNodeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorConflict`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorLimitExceeded`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshCreateVirtualNodeInput
 @see AWSAppmeshCreateVirtualNodeOutput
 */
- (AWSTask<AWSAppmeshCreateVirtualNodeOutput *> *)createVirtualNode:(AWSAppmeshCreateVirtualNodeInput *)request;

/**
 <p>Creates a virtual node within a service mesh.</p><p> A virtual node acts as a logical pointer to a particular task group, such as an Amazon ECSservice or a Kubernetes deployment. When you create a virtual node, you can specify theservice discovery information for your task group, and whether the proxy running in a taskgroup will communicate with other proxies using Transport Layer Security (TLS).</p><p>You define a <code>listener</code> for any inbound traffic that your virtual nodeexpects. Any virtual service that your virtual node expects to communicate to is specifiedas a <code>backend</code>.</p><p>The response metadata for your new virtual node contains the <code>arn</code> that isassociated with the virtual node. Set this value (either the full ARN or the truncatedresource name: for example, <code>mesh/default/virtualNode/simpleapp</code>) as the <code>APPMESH_VIRTUAL_NODE_NAME</code> environment variable for your task group's Envoyproxy container in your task definition or pod spec. This is then mapped to the <code>node.id</code> and <code>node.cluster</code> Envoy parameters.</p><note><p>If you require your Envoy stats or tracing to use a different name, you can override the <code>node.cluster</code> value that is set by<code>APPMESH_VIRTUAL_NODE_NAME</code> with the<code>APPMESH_VIRTUAL_NODE_CLUSTER</code> environment variable.</p></note><p>For more information about virtual nodes, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/virtual_nodes.html">Virtual nodes</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVirtualNode service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorConflict`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorLimitExceeded`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshCreateVirtualNodeInput
 @see AWSAppmeshCreateVirtualNodeOutput
 */
- (void)createVirtualNode:(AWSAppmeshCreateVirtualNodeInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshCreateVirtualNodeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a virtual router within a service mesh.</p><p>Specify a <code>listener</code> for any inbound traffic that your virtual routerreceives. Create a virtual router for each protocol and port that you need to route.Virtual routers handle traffic for one or more virtual services within your mesh. After youcreate your virtual router, create and associate routes for your virtual router that directincoming requests to different virtual nodes.</p><p>For more information about virtual routers, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/virtual_routers.html">Virtual routers</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVirtualRouter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshCreateVirtualRouterOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorConflict`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorLimitExceeded`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshCreateVirtualRouterInput
 @see AWSAppmeshCreateVirtualRouterOutput
 */
- (AWSTask<AWSAppmeshCreateVirtualRouterOutput *> *)createVirtualRouter:(AWSAppmeshCreateVirtualRouterInput *)request;

/**
 <p>Creates a virtual router within a service mesh.</p><p>Specify a <code>listener</code> for any inbound traffic that your virtual routerreceives. Create a virtual router for each protocol and port that you need to route.Virtual routers handle traffic for one or more virtual services within your mesh. After youcreate your virtual router, create and associate routes for your virtual router that directincoming requests to different virtual nodes.</p><p>For more information about virtual routers, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/virtual_routers.html">Virtual routers</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVirtualRouter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorConflict`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorLimitExceeded`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshCreateVirtualRouterInput
 @see AWSAppmeshCreateVirtualRouterOutput
 */
- (void)createVirtualRouter:(AWSAppmeshCreateVirtualRouterInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshCreateVirtualRouterOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a virtual service within a service mesh.</p><p>A virtual service is an abstraction of a real service that is provided by a virtual nodedirectly or indirectly by means of a virtual router. Dependent services call your virtualservice by its <code>virtualServiceName</code>, and those requests are routed to thevirtual node or virtual router that is specified as the provider for the virtualservice.</p><p>For more information about virtual services, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/virtual_services.html">Virtual services</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVirtualService service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshCreateVirtualServiceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorConflict`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorLimitExceeded`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshCreateVirtualServiceInput
 @see AWSAppmeshCreateVirtualServiceOutput
 */
- (AWSTask<AWSAppmeshCreateVirtualServiceOutput *> *)createVirtualService:(AWSAppmeshCreateVirtualServiceInput *)request;

/**
 <p>Creates a virtual service within a service mesh.</p><p>A virtual service is an abstraction of a real service that is provided by a virtual nodedirectly or indirectly by means of a virtual router. Dependent services call your virtualservice by its <code>virtualServiceName</code>, and those requests are routed to thevirtual node or virtual router that is specified as the provider for the virtualservice.</p><p>For more information about virtual services, see <a href="https://docs.aws.amazon.com/app-mesh/latest/userguide/virtual_services.html">Virtual services</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVirtualService service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorConflict`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorLimitExceeded`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshCreateVirtualServiceInput
 @see AWSAppmeshCreateVirtualServiceOutput
 */
- (void)createVirtualService:(AWSAppmeshCreateVirtualServiceInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshCreateVirtualServiceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an existing service mesh.</p><p>You must delete all resources (virtual services, routes, virtual routers, and virtualnodes) in the service mesh before you can delete the mesh itself.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMesh service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshDeleteMeshOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorResourceInUse`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshDeleteMeshInput
 @see AWSAppmeshDeleteMeshOutput
 */
- (AWSTask<AWSAppmeshDeleteMeshOutput *> *)deleteMesh:(AWSAppmeshDeleteMeshInput *)request;

/**
 <p>Deletes an existing service mesh.</p><p>You must delete all resources (virtual services, routes, virtual routers, and virtualnodes) in the service mesh before you can delete the mesh itself.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMesh service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorResourceInUse`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshDeleteMeshInput
 @see AWSAppmeshDeleteMeshOutput
 */
- (void)deleteMesh:(AWSAppmeshDeleteMeshInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshDeleteMeshOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an existing route.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRoute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshDeleteRouteOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorResourceInUse`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshDeleteRouteInput
 @see AWSAppmeshDeleteRouteOutput
 */
- (AWSTask<AWSAppmeshDeleteRouteOutput *> *)deleteRoute:(AWSAppmeshDeleteRouteInput *)request;

/**
 <p>Deletes an existing route.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRoute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorResourceInUse`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshDeleteRouteInput
 @see AWSAppmeshDeleteRouteOutput
 */
- (void)deleteRoute:(AWSAppmeshDeleteRouteInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshDeleteRouteOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an existing virtual node.</p><p>You must delete any virtual services that list a virtual node as a service providerbefore you can delete the virtual node itself.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVirtualNode service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshDeleteVirtualNodeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorResourceInUse`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshDeleteVirtualNodeInput
 @see AWSAppmeshDeleteVirtualNodeOutput
 */
- (AWSTask<AWSAppmeshDeleteVirtualNodeOutput *> *)deleteVirtualNode:(AWSAppmeshDeleteVirtualNodeInput *)request;

/**
 <p>Deletes an existing virtual node.</p><p>You must delete any virtual services that list a virtual node as a service providerbefore you can delete the virtual node itself.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVirtualNode service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorResourceInUse`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshDeleteVirtualNodeInput
 @see AWSAppmeshDeleteVirtualNodeOutput
 */
- (void)deleteVirtualNode:(AWSAppmeshDeleteVirtualNodeInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshDeleteVirtualNodeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an existing virtual router.</p><p>You must delete any routes associated with the virtual router before you can delete therouter itself.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVirtualRouter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshDeleteVirtualRouterOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorResourceInUse`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshDeleteVirtualRouterInput
 @see AWSAppmeshDeleteVirtualRouterOutput
 */
- (AWSTask<AWSAppmeshDeleteVirtualRouterOutput *> *)deleteVirtualRouter:(AWSAppmeshDeleteVirtualRouterInput *)request;

/**
 <p>Deletes an existing virtual router.</p><p>You must delete any routes associated with the virtual router before you can delete therouter itself.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVirtualRouter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorResourceInUse`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshDeleteVirtualRouterInput
 @see AWSAppmeshDeleteVirtualRouterOutput
 */
- (void)deleteVirtualRouter:(AWSAppmeshDeleteVirtualRouterInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshDeleteVirtualRouterOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an existing virtual service.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVirtualService service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshDeleteVirtualServiceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorResourceInUse`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshDeleteVirtualServiceInput
 @see AWSAppmeshDeleteVirtualServiceOutput
 */
- (AWSTask<AWSAppmeshDeleteVirtualServiceOutput *> *)deleteVirtualService:(AWSAppmeshDeleteVirtualServiceInput *)request;

/**
 <p>Deletes an existing virtual service.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVirtualService service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorResourceInUse`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshDeleteVirtualServiceInput
 @see AWSAppmeshDeleteVirtualServiceOutput
 */
- (void)deleteVirtualService:(AWSAppmeshDeleteVirtualServiceInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshDeleteVirtualServiceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes an existing service mesh.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMesh service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshDescribeMeshOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshDescribeMeshInput
 @see AWSAppmeshDescribeMeshOutput
 */
- (AWSTask<AWSAppmeshDescribeMeshOutput *> *)describeMesh:(AWSAppmeshDescribeMeshInput *)request;

/**
 <p>Describes an existing service mesh.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMesh service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshDescribeMeshInput
 @see AWSAppmeshDescribeMeshOutput
 */
- (void)describeMesh:(AWSAppmeshDescribeMeshInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshDescribeMeshOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes an existing route.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRoute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshDescribeRouteOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshDescribeRouteInput
 @see AWSAppmeshDescribeRouteOutput
 */
- (AWSTask<AWSAppmeshDescribeRouteOutput *> *)describeRoute:(AWSAppmeshDescribeRouteInput *)request;

/**
 <p>Describes an existing route.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRoute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshDescribeRouteInput
 @see AWSAppmeshDescribeRouteOutput
 */
- (void)describeRoute:(AWSAppmeshDescribeRouteInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshDescribeRouteOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes an existing virtual node.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVirtualNode service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshDescribeVirtualNodeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshDescribeVirtualNodeInput
 @see AWSAppmeshDescribeVirtualNodeOutput
 */
- (AWSTask<AWSAppmeshDescribeVirtualNodeOutput *> *)describeVirtualNode:(AWSAppmeshDescribeVirtualNodeInput *)request;

/**
 <p>Describes an existing virtual node.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVirtualNode service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshDescribeVirtualNodeInput
 @see AWSAppmeshDescribeVirtualNodeOutput
 */
- (void)describeVirtualNode:(AWSAppmeshDescribeVirtualNodeInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshDescribeVirtualNodeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes an existing virtual router.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVirtualRouter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshDescribeVirtualRouterOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshDescribeVirtualRouterInput
 @see AWSAppmeshDescribeVirtualRouterOutput
 */
- (AWSTask<AWSAppmeshDescribeVirtualRouterOutput *> *)describeVirtualRouter:(AWSAppmeshDescribeVirtualRouterInput *)request;

/**
 <p>Describes an existing virtual router.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVirtualRouter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshDescribeVirtualRouterInput
 @see AWSAppmeshDescribeVirtualRouterOutput
 */
- (void)describeVirtualRouter:(AWSAppmeshDescribeVirtualRouterInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshDescribeVirtualRouterOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes an existing virtual service.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVirtualService service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshDescribeVirtualServiceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshDescribeVirtualServiceInput
 @see AWSAppmeshDescribeVirtualServiceOutput
 */
- (AWSTask<AWSAppmeshDescribeVirtualServiceOutput *> *)describeVirtualService:(AWSAppmeshDescribeVirtualServiceInput *)request;

/**
 <p>Describes an existing virtual service.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVirtualService service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshDescribeVirtualServiceInput
 @see AWSAppmeshDescribeVirtualServiceOutput
 */
- (void)describeVirtualService:(AWSAppmeshDescribeVirtualServiceInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshDescribeVirtualServiceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of existing service meshes.</p>
 
 @param request A container for the necessary parameters to execute the ListMeshes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshListMeshesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshListMeshesInput
 @see AWSAppmeshListMeshesOutput
 */
- (AWSTask<AWSAppmeshListMeshesOutput *> *)listMeshes:(AWSAppmeshListMeshesInput *)request;

/**
 <p>Returns a list of existing service meshes.</p>
 
 @param request A container for the necessary parameters to execute the ListMeshes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshListMeshesInput
 @see AWSAppmeshListMeshesOutput
 */
- (void)listMeshes:(AWSAppmeshListMeshesInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshListMeshesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of existing routes in a service mesh.</p>
 
 @param request A container for the necessary parameters to execute the ListRoutes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshListRoutesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshListRoutesInput
 @see AWSAppmeshListRoutesOutput
 */
- (AWSTask<AWSAppmeshListRoutesOutput *> *)listRoutes:(AWSAppmeshListRoutesInput *)request;

/**
 <p>Returns a list of existing routes in a service mesh.</p>
 
 @param request A container for the necessary parameters to execute the ListRoutes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshListRoutesInput
 @see AWSAppmeshListRoutesOutput
 */
- (void)listRoutes:(AWSAppmeshListRoutesInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshListRoutesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List the tags for an App Mesh resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshListTagsForResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshListTagsForResourceInput
 @see AWSAppmeshListTagsForResourceOutput
 */
- (AWSTask<AWSAppmeshListTagsForResourceOutput *> *)listTagsForResource:(AWSAppmeshListTagsForResourceInput *)request;

/**
 <p>List the tags for an App Mesh resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshListTagsForResourceInput
 @see AWSAppmeshListTagsForResourceOutput
 */
- (void)listTagsForResource:(AWSAppmeshListTagsForResourceInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshListTagsForResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of existing virtual nodes.</p>
 
 @param request A container for the necessary parameters to execute the ListVirtualNodes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshListVirtualNodesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshListVirtualNodesInput
 @see AWSAppmeshListVirtualNodesOutput
 */
- (AWSTask<AWSAppmeshListVirtualNodesOutput *> *)listVirtualNodes:(AWSAppmeshListVirtualNodesInput *)request;

/**
 <p>Returns a list of existing virtual nodes.</p>
 
 @param request A container for the necessary parameters to execute the ListVirtualNodes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshListVirtualNodesInput
 @see AWSAppmeshListVirtualNodesOutput
 */
- (void)listVirtualNodes:(AWSAppmeshListVirtualNodesInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshListVirtualNodesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of existing virtual routers in a service mesh.</p>
 
 @param request A container for the necessary parameters to execute the ListVirtualRouters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshListVirtualRoutersOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshListVirtualRoutersInput
 @see AWSAppmeshListVirtualRoutersOutput
 */
- (AWSTask<AWSAppmeshListVirtualRoutersOutput *> *)listVirtualRouters:(AWSAppmeshListVirtualRoutersInput *)request;

/**
 <p>Returns a list of existing virtual routers in a service mesh.</p>
 
 @param request A container for the necessary parameters to execute the ListVirtualRouters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshListVirtualRoutersInput
 @see AWSAppmeshListVirtualRoutersOutput
 */
- (void)listVirtualRouters:(AWSAppmeshListVirtualRoutersInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshListVirtualRoutersOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of existing virtual services in a service mesh.</p>
 
 @param request A container for the necessary parameters to execute the ListVirtualServices service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshListVirtualServicesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshListVirtualServicesInput
 @see AWSAppmeshListVirtualServicesOutput
 */
- (AWSTask<AWSAppmeshListVirtualServicesOutput *> *)listVirtualServices:(AWSAppmeshListVirtualServicesInput *)request;

/**
 <p>Returns a list of existing virtual services in a service mesh.</p>
 
 @param request A container for the necessary parameters to execute the ListVirtualServices service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshListVirtualServicesInput
 @see AWSAppmeshListVirtualServicesOutput
 */
- (void)listVirtualServices:(AWSAppmeshListVirtualServicesInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshListVirtualServicesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates the specified tags to a resource with the specified <code>resourceArn</code>.If existing tags on a resource aren't specified in the request parameters, they aren'tchanged. When a resource is deleted, the tags associated with that resource are alsodeleted.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshTagResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`, `AWSAppmeshErrorTooManyTags`.
 
 @see AWSAppmeshTagResourceInput
 @see AWSAppmeshTagResourceOutput
 */
- (AWSTask<AWSAppmeshTagResourceOutput *> *)tagResource:(AWSAppmeshTagResourceInput *)request;

/**
 <p>Associates the specified tags to a resource with the specified <code>resourceArn</code>.If existing tags on a resource aren't specified in the request parameters, they aren'tchanged. When a resource is deleted, the tags associated with that resource are alsodeleted.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`, `AWSAppmeshErrorTooManyTags`.
 
 @see AWSAppmeshTagResourceInput
 @see AWSAppmeshTagResourceOutput
 */
- (void)tagResource:(AWSAppmeshTagResourceInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshTagResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes specified tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshUntagResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshUntagResourceInput
 @see AWSAppmeshUntagResourceOutput
 */
- (AWSTask<AWSAppmeshUntagResourceOutput *> *)untagResource:(AWSAppmeshUntagResourceInput *)request;

/**
 <p>Deletes specified tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshUntagResourceInput
 @see AWSAppmeshUntagResourceOutput
 */
- (void)untagResource:(AWSAppmeshUntagResourceInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshUntagResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing service mesh.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMesh service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshUpdateMeshOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorConflict`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshUpdateMeshInput
 @see AWSAppmeshUpdateMeshOutput
 */
- (AWSTask<AWSAppmeshUpdateMeshOutput *> *)updateMesh:(AWSAppmeshUpdateMeshInput *)request;

/**
 <p>Updates an existing service mesh.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMesh service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorConflict`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshUpdateMeshInput
 @see AWSAppmeshUpdateMeshOutput
 */
- (void)updateMesh:(AWSAppmeshUpdateMeshInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshUpdateMeshOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing route for a specified service mesh and virtual router.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRoute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshUpdateRouteOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorConflict`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorLimitExceeded`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshUpdateRouteInput
 @see AWSAppmeshUpdateRouteOutput
 */
- (AWSTask<AWSAppmeshUpdateRouteOutput *> *)updateRoute:(AWSAppmeshUpdateRouteInput *)request;

/**
 <p>Updates an existing route for a specified service mesh and virtual router.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRoute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorConflict`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorLimitExceeded`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshUpdateRouteInput
 @see AWSAppmeshUpdateRouteOutput
 */
- (void)updateRoute:(AWSAppmeshUpdateRouteInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshUpdateRouteOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing virtual node in a specified service mesh.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVirtualNode service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshUpdateVirtualNodeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorConflict`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorLimitExceeded`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshUpdateVirtualNodeInput
 @see AWSAppmeshUpdateVirtualNodeOutput
 */
- (AWSTask<AWSAppmeshUpdateVirtualNodeOutput *> *)updateVirtualNode:(AWSAppmeshUpdateVirtualNodeInput *)request;

/**
 <p>Updates an existing virtual node in a specified service mesh.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVirtualNode service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorConflict`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorLimitExceeded`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshUpdateVirtualNodeInput
 @see AWSAppmeshUpdateVirtualNodeOutput
 */
- (void)updateVirtualNode:(AWSAppmeshUpdateVirtualNodeInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshUpdateVirtualNodeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing virtual router in a specified service mesh.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVirtualRouter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshUpdateVirtualRouterOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorConflict`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorLimitExceeded`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshUpdateVirtualRouterInput
 @see AWSAppmeshUpdateVirtualRouterOutput
 */
- (AWSTask<AWSAppmeshUpdateVirtualRouterOutput *> *)updateVirtualRouter:(AWSAppmeshUpdateVirtualRouterInput *)request;

/**
 <p>Updates an existing virtual router in a specified service mesh.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVirtualRouter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorConflict`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorLimitExceeded`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshUpdateVirtualRouterInput
 @see AWSAppmeshUpdateVirtualRouterOutput
 */
- (void)updateVirtualRouter:(AWSAppmeshUpdateVirtualRouterInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshUpdateVirtualRouterOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing virtual service in a specified service mesh.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVirtualService service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAppmeshUpdateVirtualServiceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorConflict`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorLimitExceeded`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshUpdateVirtualServiceInput
 @see AWSAppmeshUpdateVirtualServiceOutput
 */
- (AWSTask<AWSAppmeshUpdateVirtualServiceOutput *> *)updateVirtualService:(AWSAppmeshUpdateVirtualServiceInput *)request;

/**
 <p>Updates an existing virtual service in a specified service mesh.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVirtualService service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAppmeshErrorDomain` domain and the following error code: `AWSAppmeshErrorBadRequest`, `AWSAppmeshErrorConflict`, `AWSAppmeshErrorForbidden`, `AWSAppmeshErrorInternalServerError`, `AWSAppmeshErrorLimitExceeded`, `AWSAppmeshErrorNotFound`, `AWSAppmeshErrorServiceUnavailable`, `AWSAppmeshErrorTooManyRequests`.
 
 @see AWSAppmeshUpdateVirtualServiceInput
 @see AWSAppmeshUpdateVirtualServiceOutput
 */
- (void)updateVirtualService:(AWSAppmeshUpdateVirtualServiceInput *)request completionHandler:(void (^ _Nullable)(AWSAppmeshUpdateVirtualServiceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
