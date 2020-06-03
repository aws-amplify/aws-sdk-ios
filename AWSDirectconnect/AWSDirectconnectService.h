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
#import "AWSDirectconnectModel.h"
#import "AWSDirectconnectResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSDirectconnect
FOUNDATION_EXPORT NSString *const AWSDirectconnectSDKVersion;

/**
 <p>AWS Direct Connect links your internal network to an AWS Direct Connect location over a standard Ethernet fiber-optic cable. One end of the cable is connected to your router, the other to an AWS Direct Connect router. With this connection in place, you can create virtual interfaces directly to the AWS cloud (for example, to Amazon EC2 and Amazon S3) and to Amazon VPC, bypassing Internet service providers in your network path. A connection provides access to all AWS Regions except the China (Beijing) and (China) Ningxia Regions. AWS resources in the China Regions can only be accessed through locations associated with those Regions.</p>
 */
@interface AWSDirectconnect : AWSService

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

     let Directconnect = AWSDirectconnect.default()

 *Objective-C*

     AWSDirectconnect *Directconnect = [AWSDirectconnect defaultDirectconnect];

 @return The default service client.
 */
+ (instancetype)defaultDirectconnect;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSDirectconnect.register(with: configuration!, forKey: "USWest2Directconnect")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:@"USWest2Directconnect"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Directconnect = AWSDirectconnect(forKey: "USWest2Directconnect")

 *Objective-C*

     AWSDirectconnect *Directconnect = [AWSDirectconnect DirectconnectForKey:@"USWest2Directconnect"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerDirectconnectWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerDirectconnectWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSDirectconnect.register(with: configuration!, forKey: "USWest2Directconnect")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:@"USWest2Directconnect"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Directconnect = AWSDirectconnect(forKey: "USWest2Directconnect")

 *Objective-C*

     AWSDirectconnect *Directconnect = [AWSDirectconnect DirectconnectForKey:@"USWest2Directconnect"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)DirectconnectForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeDirectconnectForKey:(NSString *)key;

/**
 <p>Accepts a proposal request to attach a virtual private gateway or transit gateway to a Direct Connect gateway.</p>
 
 @param request A container for the necessary parameters to execute the AcceptDirectConnectGatewayAssociationProposal service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalResult`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalRequest
 @see AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalResult
 */
- (AWSTask<AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalResult *> *)acceptDirectConnectGatewayAssociationProposal:(AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalRequest *)request;

/**
 <p>Accepts a proposal request to attach a virtual private gateway or transit gateway to a Direct Connect gateway.</p>
 
 @param request A container for the necessary parameters to execute the AcceptDirectConnectGatewayAssociationProposal service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalRequest
 @see AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalResult
 */
- (void)acceptDirectConnectGatewayAssociationProposal:(AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deprecated. Use <a>AllocateHostedConnection</a> instead.</p><p>Creates a hosted connection on an interconnect.</p><p>Allocates a VLAN number and a specified amount of bandwidth for use by a hosted connection on the specified interconnect.</p><note><p>Intended for use by AWS Direct Connect Partners only.</p></note>
 
 @param request A container for the necessary parameters to execute the AllocateConnectionOnInterconnect service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectConnection`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectAllocateConnectionOnInterconnectRequest
 @see AWSDirectconnectConnection
 */
- (AWSTask<AWSDirectconnectConnection *> *)allocateConnectionOnInterconnect:(AWSDirectconnectAllocateConnectionOnInterconnectRequest *)request;

/**
 <p>Deprecated. Use <a>AllocateHostedConnection</a> instead.</p><p>Creates a hosted connection on an interconnect.</p><p>Allocates a VLAN number and a specified amount of bandwidth for use by a hosted connection on the specified interconnect.</p><note><p>Intended for use by AWS Direct Connect Partners only.</p></note>
 
 @param request A container for the necessary parameters to execute the AllocateConnectionOnInterconnect service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectAllocateConnectionOnInterconnectRequest
 @see AWSDirectconnectConnection
 */
- (void)allocateConnectionOnInterconnect:(AWSDirectconnectAllocateConnectionOnInterconnectRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectConnection * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a hosted connection on the specified interconnect or a link aggregation group (LAG) of interconnects.</p><p>Allocates a VLAN number and a specified amount of capacity (bandwidth) for use by a hosted connection on the specified interconnect or LAG of interconnects. AWS polices the hosted connection for the specified capacity and the AWS Direct Connect Partner must also police the hosted connection for the specified capacity.</p><note><p>Intended for use by AWS Direct Connect Partners only.</p></note>
 
 @param request A container for the necessary parameters to execute the AllocateHostedConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectConnection`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDuplicateTagKeys`, `AWSDirectconnectErrorTooManyTags`, `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectAllocateHostedConnectionRequest
 @see AWSDirectconnectConnection
 */
- (AWSTask<AWSDirectconnectConnection *> *)allocateHostedConnection:(AWSDirectconnectAllocateHostedConnectionRequest *)request;

/**
 <p>Creates a hosted connection on the specified interconnect or a link aggregation group (LAG) of interconnects.</p><p>Allocates a VLAN number and a specified amount of capacity (bandwidth) for use by a hosted connection on the specified interconnect or LAG of interconnects. AWS polices the hosted connection for the specified capacity and the AWS Direct Connect Partner must also police the hosted connection for the specified capacity.</p><note><p>Intended for use by AWS Direct Connect Partners only.</p></note>
 
 @param request A container for the necessary parameters to execute the AllocateHostedConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDuplicateTagKeys`, `AWSDirectconnectErrorTooManyTags`, `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectAllocateHostedConnectionRequest
 @see AWSDirectconnectConnection
 */
- (void)allocateHostedConnection:(AWSDirectconnectAllocateHostedConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectConnection * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provisions a private virtual interface to be owned by the specified AWS account.</p><p>Virtual interfaces created using this action must be confirmed by the owner using <a>ConfirmPrivateVirtualInterface</a>. Until then, the virtual interface is in the <code>Confirming</code> state and is not available to handle traffic.</p>
 
 @param request A container for the necessary parameters to execute the AllocatePrivateVirtualInterface service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectVirtualInterface`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDuplicateTagKeys`, `AWSDirectconnectErrorTooManyTags`, `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectAllocatePrivateVirtualInterfaceRequest
 @see AWSDirectconnectVirtualInterface
 */
- (AWSTask<AWSDirectconnectVirtualInterface *> *)allocatePrivateVirtualInterface:(AWSDirectconnectAllocatePrivateVirtualInterfaceRequest *)request;

/**
 <p>Provisions a private virtual interface to be owned by the specified AWS account.</p><p>Virtual interfaces created using this action must be confirmed by the owner using <a>ConfirmPrivateVirtualInterface</a>. Until then, the virtual interface is in the <code>Confirming</code> state and is not available to handle traffic.</p>
 
 @param request A container for the necessary parameters to execute the AllocatePrivateVirtualInterface service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDuplicateTagKeys`, `AWSDirectconnectErrorTooManyTags`, `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectAllocatePrivateVirtualInterfaceRequest
 @see AWSDirectconnectVirtualInterface
 */
- (void)allocatePrivateVirtualInterface:(AWSDirectconnectAllocatePrivateVirtualInterfaceRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectVirtualInterface * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provisions a public virtual interface to be owned by the specified AWS account.</p><p>The owner of a connection calls this function to provision a public virtual interface to be owned by the specified AWS account.</p><p>Virtual interfaces created using this function must be confirmed by the owner using <a>ConfirmPublicVirtualInterface</a>. Until this step has been completed, the virtual interface is in the <code>confirming</code> state and is not available to handle traffic.</p><p>When creating an IPv6 public virtual interface, omit the Amazon address and customer address. IPv6 addresses are automatically assigned from the Amazon pool of IPv6 addresses; you cannot specify custom IPv6 addresses.</p>
 
 @param request A container for the necessary parameters to execute the AllocatePublicVirtualInterface service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectVirtualInterface`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDuplicateTagKeys`, `AWSDirectconnectErrorTooManyTags`, `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectAllocatePublicVirtualInterfaceRequest
 @see AWSDirectconnectVirtualInterface
 */
- (AWSTask<AWSDirectconnectVirtualInterface *> *)allocatePublicVirtualInterface:(AWSDirectconnectAllocatePublicVirtualInterfaceRequest *)request;

/**
 <p>Provisions a public virtual interface to be owned by the specified AWS account.</p><p>The owner of a connection calls this function to provision a public virtual interface to be owned by the specified AWS account.</p><p>Virtual interfaces created using this function must be confirmed by the owner using <a>ConfirmPublicVirtualInterface</a>. Until this step has been completed, the virtual interface is in the <code>confirming</code> state and is not available to handle traffic.</p><p>When creating an IPv6 public virtual interface, omit the Amazon address and customer address. IPv6 addresses are automatically assigned from the Amazon pool of IPv6 addresses; you cannot specify custom IPv6 addresses.</p>
 
 @param request A container for the necessary parameters to execute the AllocatePublicVirtualInterface service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDuplicateTagKeys`, `AWSDirectconnectErrorTooManyTags`, `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectAllocatePublicVirtualInterfaceRequest
 @see AWSDirectconnectVirtualInterface
 */
- (void)allocatePublicVirtualInterface:(AWSDirectconnectAllocatePublicVirtualInterfaceRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectVirtualInterface * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provisions a transit virtual interface to be owned by the specified AWS account. Use this type of interface to connect a transit gateway to your Direct Connect gateway.</p><p>The owner of a connection provisions a transit virtual interface to be owned by the specified AWS account.</p><p>After you create a transit virtual interface, it must be confirmed by the owner using <a>ConfirmTransitVirtualInterface</a>. Until this step has been completed, the transit virtual interface is in the <code>requested</code> state and is not available to handle traffic.</p>
 
 @param request A container for the necessary parameters to execute the AllocateTransitVirtualInterface service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectAllocateTransitVirtualInterfaceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDuplicateTagKeys`, `AWSDirectconnectErrorTooManyTags`, `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectAllocateTransitVirtualInterfaceRequest
 @see AWSDirectconnectAllocateTransitVirtualInterfaceResult
 */
- (AWSTask<AWSDirectconnectAllocateTransitVirtualInterfaceResult *> *)allocateTransitVirtualInterface:(AWSDirectconnectAllocateTransitVirtualInterfaceRequest *)request;

/**
 <p>Provisions a transit virtual interface to be owned by the specified AWS account. Use this type of interface to connect a transit gateway to your Direct Connect gateway.</p><p>The owner of a connection provisions a transit virtual interface to be owned by the specified AWS account.</p><p>After you create a transit virtual interface, it must be confirmed by the owner using <a>ConfirmTransitVirtualInterface</a>. Until this step has been completed, the transit virtual interface is in the <code>requested</code> state and is not available to handle traffic.</p>
 
 @param request A container for the necessary parameters to execute the AllocateTransitVirtualInterface service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDuplicateTagKeys`, `AWSDirectconnectErrorTooManyTags`, `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectAllocateTransitVirtualInterfaceRequest
 @see AWSDirectconnectAllocateTransitVirtualInterfaceResult
 */
- (void)allocateTransitVirtualInterface:(AWSDirectconnectAllocateTransitVirtualInterfaceRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectAllocateTransitVirtualInterfaceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates an existing connection with a link aggregation group (LAG). The connection is interrupted and re-established as a member of the LAG (connectivity to AWS is interrupted). The connection must be hosted on the same AWS Direct Connect endpoint as the LAG, and its bandwidth must match the bandwidth for the LAG. You can re-associate a connection that's currently associated with a different LAG; however, if removing the connection would cause the original LAG to fall below its setting for minimum number of operational connections, the request fails.</p><p>Any virtual interfaces that are directly associated with the connection are automatically re-associated with the LAG. If the connection was originally associated with a different LAG, the virtual interfaces remain associated with the original LAG.</p><p>For interconnects, any hosted connections are automatically re-associated with the LAG. If the interconnect was originally associated with a different LAG, the hosted connections remain associated with the original LAG.</p>
 
 @param request A container for the necessary parameters to execute the AssociateConnectionWithLag service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectConnection`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectAssociateConnectionWithLagRequest
 @see AWSDirectconnectConnection
 */
- (AWSTask<AWSDirectconnectConnection *> *)associateConnectionWithLag:(AWSDirectconnectAssociateConnectionWithLagRequest *)request;

/**
 <p>Associates an existing connection with a link aggregation group (LAG). The connection is interrupted and re-established as a member of the LAG (connectivity to AWS is interrupted). The connection must be hosted on the same AWS Direct Connect endpoint as the LAG, and its bandwidth must match the bandwidth for the LAG. You can re-associate a connection that's currently associated with a different LAG; however, if removing the connection would cause the original LAG to fall below its setting for minimum number of operational connections, the request fails.</p><p>Any virtual interfaces that are directly associated with the connection are automatically re-associated with the LAG. If the connection was originally associated with a different LAG, the virtual interfaces remain associated with the original LAG.</p><p>For interconnects, any hosted connections are automatically re-associated with the LAG. If the interconnect was originally associated with a different LAG, the hosted connections remain associated with the original LAG.</p>
 
 @param request A container for the necessary parameters to execute the AssociateConnectionWithLag service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectAssociateConnectionWithLagRequest
 @see AWSDirectconnectConnection
 */
- (void)associateConnectionWithLag:(AWSDirectconnectAssociateConnectionWithLagRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectConnection * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates a hosted connection and its virtual interfaces with a link aggregation group (LAG) or interconnect. If the target interconnect or LAG has an existing hosted connection with a conflicting VLAN number or IP address, the operation fails. This action temporarily interrupts the hosted connection's connectivity to AWS as it is being migrated.</p><note><p>Intended for use by AWS Direct Connect Partners only.</p></note>
 
 @param request A container for the necessary parameters to execute the AssociateHostedConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectConnection`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectAssociateHostedConnectionRequest
 @see AWSDirectconnectConnection
 */
- (AWSTask<AWSDirectconnectConnection *> *)associateHostedConnection:(AWSDirectconnectAssociateHostedConnectionRequest *)request;

/**
 <p>Associates a hosted connection and its virtual interfaces with a link aggregation group (LAG) or interconnect. If the target interconnect or LAG has an existing hosted connection with a conflicting VLAN number or IP address, the operation fails. This action temporarily interrupts the hosted connection's connectivity to AWS as it is being migrated.</p><note><p>Intended for use by AWS Direct Connect Partners only.</p></note>
 
 @param request A container for the necessary parameters to execute the AssociateHostedConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectAssociateHostedConnectionRequest
 @see AWSDirectconnectConnection
 */
- (void)associateHostedConnection:(AWSDirectconnectAssociateHostedConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectConnection * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates a virtual interface with a specified link aggregation group (LAG) or connection. Connectivity to AWS is temporarily interrupted as the virtual interface is being migrated. If the target connection or LAG has an associated virtual interface with a conflicting VLAN number or a conflicting IP address, the operation fails.</p><p>Virtual interfaces associated with a hosted connection cannot be associated with a LAG; hosted connections must be migrated along with their virtual interfaces using <a>AssociateHostedConnection</a>.</p><p>To reassociate a virtual interface to a new connection or LAG, the requester must own either the virtual interface itself or the connection to which the virtual interface is currently associated. Additionally, the requester must own the connection or LAG for the association.</p>
 
 @param request A container for the necessary parameters to execute the AssociateVirtualInterface service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectVirtualInterface`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectAssociateVirtualInterfaceRequest
 @see AWSDirectconnectVirtualInterface
 */
- (AWSTask<AWSDirectconnectVirtualInterface *> *)associateVirtualInterface:(AWSDirectconnectAssociateVirtualInterfaceRequest *)request;

/**
 <p>Associates a virtual interface with a specified link aggregation group (LAG) or connection. Connectivity to AWS is temporarily interrupted as the virtual interface is being migrated. If the target connection or LAG has an associated virtual interface with a conflicting VLAN number or a conflicting IP address, the operation fails.</p><p>Virtual interfaces associated with a hosted connection cannot be associated with a LAG; hosted connections must be migrated along with their virtual interfaces using <a>AssociateHostedConnection</a>.</p><p>To reassociate a virtual interface to a new connection or LAG, the requester must own either the virtual interface itself or the connection to which the virtual interface is currently associated. Additionally, the requester must own the connection or LAG for the association.</p>
 
 @param request A container for the necessary parameters to execute the AssociateVirtualInterface service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectAssociateVirtualInterfaceRequest
 @see AWSDirectconnectVirtualInterface
 */
- (void)associateVirtualInterface:(AWSDirectconnectAssociateVirtualInterfaceRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectVirtualInterface * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Confirms the creation of the specified hosted connection on an interconnect.</p><p>Upon creation, the hosted connection is initially in the <code>Ordering</code> state, and remains in this state until the owner confirms creation of the hosted connection.</p>
 
 @param request A container for the necessary parameters to execute the ConfirmConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectConfirmConnectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectConfirmConnectionRequest
 @see AWSDirectconnectConfirmConnectionResponse
 */
- (AWSTask<AWSDirectconnectConfirmConnectionResponse *> *)confirmConnection:(AWSDirectconnectConfirmConnectionRequest *)request;

/**
 <p>Confirms the creation of the specified hosted connection on an interconnect.</p><p>Upon creation, the hosted connection is initially in the <code>Ordering</code> state, and remains in this state until the owner confirms creation of the hosted connection.</p>
 
 @param request A container for the necessary parameters to execute the ConfirmConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectConfirmConnectionRequest
 @see AWSDirectconnectConfirmConnectionResponse
 */
- (void)confirmConnection:(AWSDirectconnectConfirmConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectConfirmConnectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Accepts ownership of a private virtual interface created by another AWS account.</p><p>After the virtual interface owner makes this call, the virtual interface is created and attached to the specified virtual private gateway or Direct Connect gateway, and is made available to handle traffic.</p>
 
 @param request A container for the necessary parameters to execute the ConfirmPrivateVirtualInterface service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectConfirmPrivateVirtualInterfaceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectConfirmPrivateVirtualInterfaceRequest
 @see AWSDirectconnectConfirmPrivateVirtualInterfaceResponse
 */
- (AWSTask<AWSDirectconnectConfirmPrivateVirtualInterfaceResponse *> *)confirmPrivateVirtualInterface:(AWSDirectconnectConfirmPrivateVirtualInterfaceRequest *)request;

/**
 <p>Accepts ownership of a private virtual interface created by another AWS account.</p><p>After the virtual interface owner makes this call, the virtual interface is created and attached to the specified virtual private gateway or Direct Connect gateway, and is made available to handle traffic.</p>
 
 @param request A container for the necessary parameters to execute the ConfirmPrivateVirtualInterface service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectConfirmPrivateVirtualInterfaceRequest
 @see AWSDirectconnectConfirmPrivateVirtualInterfaceResponse
 */
- (void)confirmPrivateVirtualInterface:(AWSDirectconnectConfirmPrivateVirtualInterfaceRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectConfirmPrivateVirtualInterfaceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Accepts ownership of a public virtual interface created by another AWS account.</p><p>After the virtual interface owner makes this call, the specified virtual interface is created and made available to handle traffic.</p>
 
 @param request A container for the necessary parameters to execute the ConfirmPublicVirtualInterface service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectConfirmPublicVirtualInterfaceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectConfirmPublicVirtualInterfaceRequest
 @see AWSDirectconnectConfirmPublicVirtualInterfaceResponse
 */
- (AWSTask<AWSDirectconnectConfirmPublicVirtualInterfaceResponse *> *)confirmPublicVirtualInterface:(AWSDirectconnectConfirmPublicVirtualInterfaceRequest *)request;

/**
 <p>Accepts ownership of a public virtual interface created by another AWS account.</p><p>After the virtual interface owner makes this call, the specified virtual interface is created and made available to handle traffic.</p>
 
 @param request A container for the necessary parameters to execute the ConfirmPublicVirtualInterface service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectConfirmPublicVirtualInterfaceRequest
 @see AWSDirectconnectConfirmPublicVirtualInterfaceResponse
 */
- (void)confirmPublicVirtualInterface:(AWSDirectconnectConfirmPublicVirtualInterfaceRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectConfirmPublicVirtualInterfaceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Accepts ownership of a transit virtual interface created by another AWS account.</p><p> After the owner of the transit virtual interface makes this call, the specified transit virtual interface is created and made available to handle traffic.</p>
 
 @param request A container for the necessary parameters to execute the ConfirmTransitVirtualInterface service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectConfirmTransitVirtualInterfaceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectConfirmTransitVirtualInterfaceRequest
 @see AWSDirectconnectConfirmTransitVirtualInterfaceResponse
 */
- (AWSTask<AWSDirectconnectConfirmTransitVirtualInterfaceResponse *> *)confirmTransitVirtualInterface:(AWSDirectconnectConfirmTransitVirtualInterfaceRequest *)request;

/**
 <p>Accepts ownership of a transit virtual interface created by another AWS account.</p><p> After the owner of the transit virtual interface makes this call, the specified transit virtual interface is created and made available to handle traffic.</p>
 
 @param request A container for the necessary parameters to execute the ConfirmTransitVirtualInterface service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectConfirmTransitVirtualInterfaceRequest
 @see AWSDirectconnectConfirmTransitVirtualInterfaceResponse
 */
- (void)confirmTransitVirtualInterface:(AWSDirectconnectConfirmTransitVirtualInterfaceRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectConfirmTransitVirtualInterfaceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a BGP peer on the specified virtual interface.</p><p>You must create a BGP peer for the corresponding address family (IPv4/IPv6) in order to access AWS resources that also use that address family.</p><p>If logical redundancy is not supported by the connection, interconnect, or LAG, the BGP peer cannot be in the same address family as an existing BGP peer on the virtual interface.</p><p>When creating a IPv6 BGP peer, omit the Amazon address and customer address. IPv6 addresses are automatically assigned from the Amazon pool of IPv6 addresses; you cannot specify custom IPv6 addresses.</p><p>For a public virtual interface, the Autonomous System Number (ASN) must be private or already whitelisted for the virtual interface.</p>
 
 @param request A container for the necessary parameters to execute the CreateBGPPeer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectCreateBGPPeerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectCreateBGPPeerRequest
 @see AWSDirectconnectCreateBGPPeerResponse
 */
- (AWSTask<AWSDirectconnectCreateBGPPeerResponse *> *)createBGPPeer:(AWSDirectconnectCreateBGPPeerRequest *)request;

/**
 <p>Creates a BGP peer on the specified virtual interface.</p><p>You must create a BGP peer for the corresponding address family (IPv4/IPv6) in order to access AWS resources that also use that address family.</p><p>If logical redundancy is not supported by the connection, interconnect, or LAG, the BGP peer cannot be in the same address family as an existing BGP peer on the virtual interface.</p><p>When creating a IPv6 BGP peer, omit the Amazon address and customer address. IPv6 addresses are automatically assigned from the Amazon pool of IPv6 addresses; you cannot specify custom IPv6 addresses.</p><p>For a public virtual interface, the Autonomous System Number (ASN) must be private or already whitelisted for the virtual interface.</p>
 
 @param request A container for the necessary parameters to execute the CreateBGPPeer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectCreateBGPPeerRequest
 @see AWSDirectconnectCreateBGPPeerResponse
 */
- (void)createBGPPeer:(AWSDirectconnectCreateBGPPeerRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectCreateBGPPeerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a connection between a customer network and a specific AWS Direct Connect location.</p><p>A connection links your internal network to an AWS Direct Connect location over a standard Ethernet fiber-optic cable. One end of the cable is connected to your router, the other to an AWS Direct Connect router.</p><p>To find the locations for your Region, use <a>DescribeLocations</a>.</p><p>You can automatically add the new connection to a link aggregation group (LAG) by specifying a LAG ID in the request. This ensures that the new connection is allocated on the same AWS Direct Connect endpoint that hosts the specified LAG. If there are no available ports on the endpoint, the request fails and no connection is created.</p>
 
 @param request A container for the necessary parameters to execute the CreateConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectConnection`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDuplicateTagKeys`, `AWSDirectconnectErrorTooManyTags`, `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectCreateConnectionRequest
 @see AWSDirectconnectConnection
 */
- (AWSTask<AWSDirectconnectConnection *> *)createConnection:(AWSDirectconnectCreateConnectionRequest *)request;

/**
 <p>Creates a connection between a customer network and a specific AWS Direct Connect location.</p><p>A connection links your internal network to an AWS Direct Connect location over a standard Ethernet fiber-optic cable. One end of the cable is connected to your router, the other to an AWS Direct Connect router.</p><p>To find the locations for your Region, use <a>DescribeLocations</a>.</p><p>You can automatically add the new connection to a link aggregation group (LAG) by specifying a LAG ID in the request. This ensures that the new connection is allocated on the same AWS Direct Connect endpoint that hosts the specified LAG. If there are no available ports on the endpoint, the request fails and no connection is created.</p>
 
 @param request A container for the necessary parameters to execute the CreateConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDuplicateTagKeys`, `AWSDirectconnectErrorTooManyTags`, `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectCreateConnectionRequest
 @see AWSDirectconnectConnection
 */
- (void)createConnection:(AWSDirectconnectCreateConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectConnection * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Direct Connect gateway, which is an intermediate object that enables you to connect a set of virtual interfaces and virtual private gateways. A Direct Connect gateway is global and visible in any AWS Region after it is created. The virtual interfaces and virtual private gateways that are connected through a Direct Connect gateway can be in different AWS Regions. This enables you to connect to a VPC in any Region, regardless of the Region in which the virtual interfaces are located, and pass traffic between them.</p>
 
 @param request A container for the necessary parameters to execute the CreateDirectConnectGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectCreateDirectConnectGatewayResult`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectCreateDirectConnectGatewayRequest
 @see AWSDirectconnectCreateDirectConnectGatewayResult
 */
- (AWSTask<AWSDirectconnectCreateDirectConnectGatewayResult *> *)createDirectConnectGateway:(AWSDirectconnectCreateDirectConnectGatewayRequest *)request;

/**
 <p>Creates a Direct Connect gateway, which is an intermediate object that enables you to connect a set of virtual interfaces and virtual private gateways. A Direct Connect gateway is global and visible in any AWS Region after it is created. The virtual interfaces and virtual private gateways that are connected through a Direct Connect gateway can be in different AWS Regions. This enables you to connect to a VPC in any Region, regardless of the Region in which the virtual interfaces are located, and pass traffic between them.</p>
 
 @param request A container for the necessary parameters to execute the CreateDirectConnectGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectCreateDirectConnectGatewayRequest
 @see AWSDirectconnectCreateDirectConnectGatewayResult
 */
- (void)createDirectConnectGateway:(AWSDirectconnectCreateDirectConnectGatewayRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectCreateDirectConnectGatewayResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an association between a Direct Connect gateway and a virtual private gateway. The virtual private gateway must be attached to a VPC and must not be associated with another Direct Connect gateway.</p>
 
 @param request A container for the necessary parameters to execute the CreateDirectConnectGatewayAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectCreateDirectConnectGatewayAssociationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectCreateDirectConnectGatewayAssociationRequest
 @see AWSDirectconnectCreateDirectConnectGatewayAssociationResult
 */
- (AWSTask<AWSDirectconnectCreateDirectConnectGatewayAssociationResult *> *)createDirectConnectGatewayAssociation:(AWSDirectconnectCreateDirectConnectGatewayAssociationRequest *)request;

/**
 <p>Creates an association between a Direct Connect gateway and a virtual private gateway. The virtual private gateway must be attached to a VPC and must not be associated with another Direct Connect gateway.</p>
 
 @param request A container for the necessary parameters to execute the CreateDirectConnectGatewayAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectCreateDirectConnectGatewayAssociationRequest
 @see AWSDirectconnectCreateDirectConnectGatewayAssociationResult
 */
- (void)createDirectConnectGatewayAssociation:(AWSDirectconnectCreateDirectConnectGatewayAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectCreateDirectConnectGatewayAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a proposal to associate the specified virtual private gateway or transit gateway with the specified Direct Connect gateway.</p><p>You can only associate a Direct Connect gateway and virtual private gateway or transit gateway when the account that owns the Direct Connect gateway and the account that owns the virtual private gateway or transit gateway have the same AWS Payer ID.</p>
 
 @param request A container for the necessary parameters to execute the CreateDirectConnectGatewayAssociationProposal service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectCreateDirectConnectGatewayAssociationProposalResult`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectCreateDirectConnectGatewayAssociationProposalRequest
 @see AWSDirectconnectCreateDirectConnectGatewayAssociationProposalResult
 */
- (AWSTask<AWSDirectconnectCreateDirectConnectGatewayAssociationProposalResult *> *)createDirectConnectGatewayAssociationProposal:(AWSDirectconnectCreateDirectConnectGatewayAssociationProposalRequest *)request;

/**
 <p>Creates a proposal to associate the specified virtual private gateway or transit gateway with the specified Direct Connect gateway.</p><p>You can only associate a Direct Connect gateway and virtual private gateway or transit gateway when the account that owns the Direct Connect gateway and the account that owns the virtual private gateway or transit gateway have the same AWS Payer ID.</p>
 
 @param request A container for the necessary parameters to execute the CreateDirectConnectGatewayAssociationProposal service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectCreateDirectConnectGatewayAssociationProposalRequest
 @see AWSDirectconnectCreateDirectConnectGatewayAssociationProposalResult
 */
- (void)createDirectConnectGatewayAssociationProposal:(AWSDirectconnectCreateDirectConnectGatewayAssociationProposalRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectCreateDirectConnectGatewayAssociationProposalResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an interconnect between an AWS Direct Connect Partner's network and a specific AWS Direct Connect location.</p><p>An interconnect is a connection that is capable of hosting other connections. The AWS Direct Connect partner can use an interconnect to provide AWS Direct Connect hosted connections to customers through their own network services. Like a standard connection, an interconnect links the partner's network to an AWS Direct Connect location over a standard Ethernet fiber-optic cable. One end is connected to the partner's router, the other to an AWS Direct Connect router.</p><p>You can automatically add the new interconnect to a link aggregation group (LAG) by specifying a LAG ID in the request. This ensures that the new interconnect is allocated on the same AWS Direct Connect endpoint that hosts the specified LAG. If there are no available ports on the endpoint, the request fails and no interconnect is created.</p><p>For each end customer, the AWS Direct Connect Partner provisions a connection on their interconnect by calling <a>AllocateHostedConnection</a>. The end customer can then connect to AWS resources by creating a virtual interface on their connection, using the VLAN assigned to them by the AWS Direct Connect Partner.</p><note><p>Intended for use by AWS Direct Connect Partners only.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateInterconnect service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectInterconnect`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDuplicateTagKeys`, `AWSDirectconnectErrorTooManyTags`, `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectCreateInterconnectRequest
 @see AWSDirectconnectInterconnect
 */
- (AWSTask<AWSDirectconnectInterconnect *> *)createInterconnect:(AWSDirectconnectCreateInterconnectRequest *)request;

/**
 <p>Creates an interconnect between an AWS Direct Connect Partner's network and a specific AWS Direct Connect location.</p><p>An interconnect is a connection that is capable of hosting other connections. The AWS Direct Connect partner can use an interconnect to provide AWS Direct Connect hosted connections to customers through their own network services. Like a standard connection, an interconnect links the partner's network to an AWS Direct Connect location over a standard Ethernet fiber-optic cable. One end is connected to the partner's router, the other to an AWS Direct Connect router.</p><p>You can automatically add the new interconnect to a link aggregation group (LAG) by specifying a LAG ID in the request. This ensures that the new interconnect is allocated on the same AWS Direct Connect endpoint that hosts the specified LAG. If there are no available ports on the endpoint, the request fails and no interconnect is created.</p><p>For each end customer, the AWS Direct Connect Partner provisions a connection on their interconnect by calling <a>AllocateHostedConnection</a>. The end customer can then connect to AWS resources by creating a virtual interface on their connection, using the VLAN assigned to them by the AWS Direct Connect Partner.</p><note><p>Intended for use by AWS Direct Connect Partners only.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateInterconnect service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDuplicateTagKeys`, `AWSDirectconnectErrorTooManyTags`, `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectCreateInterconnectRequest
 @see AWSDirectconnectInterconnect
 */
- (void)createInterconnect:(AWSDirectconnectCreateInterconnectRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectInterconnect * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a link aggregation group (LAG) with the specified number of bundled physical connections between the customer network and a specific AWS Direct Connect location. A LAG is a logical interface that uses the Link Aggregation Control Protocol (LACP) to aggregate multiple interfaces, enabling you to treat them as a single interface.</p><p>All connections in a LAG must use the same bandwidth and must terminate at the same AWS Direct Connect endpoint.</p><p>You can have up to 10 connections per LAG. Regardless of this limit, if you request more connections for the LAG than AWS Direct Connect can allocate on a single endpoint, no LAG is created.</p><p>You can specify an existing physical connection or interconnect to include in the LAG (which counts towards the total number of connections). Doing so interrupts the current physical connection or hosted connections, and re-establishes them as a member of the LAG. The LAG will be created on the same AWS Direct Connect endpoint to which the connection terminates. Any virtual interfaces associated with the connection are automatically disassociated and re-associated with the LAG. The connection ID does not change.</p><p>If the AWS account used to create a LAG is a registered AWS Direct Connect Partner, the LAG is automatically enabled to host sub-connections. For a LAG owned by a partner, any associated virtual interfaces cannot be directly configured.</p>
 
 @param request A container for the necessary parameters to execute the CreateLag service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectLag`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDuplicateTagKeys`, `AWSDirectconnectErrorTooManyTags`, `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectCreateLagRequest
 @see AWSDirectconnectLag
 */
- (AWSTask<AWSDirectconnectLag *> *)createLag:(AWSDirectconnectCreateLagRequest *)request;

/**
 <p>Creates a link aggregation group (LAG) with the specified number of bundled physical connections between the customer network and a specific AWS Direct Connect location. A LAG is a logical interface that uses the Link Aggregation Control Protocol (LACP) to aggregate multiple interfaces, enabling you to treat them as a single interface.</p><p>All connections in a LAG must use the same bandwidth and must terminate at the same AWS Direct Connect endpoint.</p><p>You can have up to 10 connections per LAG. Regardless of this limit, if you request more connections for the LAG than AWS Direct Connect can allocate on a single endpoint, no LAG is created.</p><p>You can specify an existing physical connection or interconnect to include in the LAG (which counts towards the total number of connections). Doing so interrupts the current physical connection or hosted connections, and re-establishes them as a member of the LAG. The LAG will be created on the same AWS Direct Connect endpoint to which the connection terminates. Any virtual interfaces associated with the connection are automatically disassociated and re-associated with the LAG. The connection ID does not change.</p><p>If the AWS account used to create a LAG is a registered AWS Direct Connect Partner, the LAG is automatically enabled to host sub-connections. For a LAG owned by a partner, any associated virtual interfaces cannot be directly configured.</p>
 
 @param request A container for the necessary parameters to execute the CreateLag service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDuplicateTagKeys`, `AWSDirectconnectErrorTooManyTags`, `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectCreateLagRequest
 @see AWSDirectconnectLag
 */
- (void)createLag:(AWSDirectconnectCreateLagRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectLag * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a private virtual interface. A virtual interface is the VLAN that transports AWS Direct Connect traffic. A private virtual interface can be connected to either a Direct Connect gateway or a Virtual Private Gateway (VGW). Connecting the private virtual interface to a Direct Connect gateway enables the possibility for connecting to multiple VPCs, including VPCs in different AWS Regions. Connecting the private virtual interface to a VGW only provides access to a single VPC within the same Region.</p><p>Setting the MTU of a virtual interface to 9001 (jumbo frames) can cause an update to the underlying physical connection if it wasn't updated to support jumbo frames. Updating the connection disrupts network connectivity for all virtual interfaces associated with the connection for up to 30 seconds. To check whether your connection supports jumbo frames, call <a>DescribeConnections</a>. To check whether your virtual interface supports jumbo frames, call <a>DescribeVirtualInterfaces</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreatePrivateVirtualInterface service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectVirtualInterface`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDuplicateTagKeys`, `AWSDirectconnectErrorTooManyTags`, `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectCreatePrivateVirtualInterfaceRequest
 @see AWSDirectconnectVirtualInterface
 */
- (AWSTask<AWSDirectconnectVirtualInterface *> *)createPrivateVirtualInterface:(AWSDirectconnectCreatePrivateVirtualInterfaceRequest *)request;

/**
 <p>Creates a private virtual interface. A virtual interface is the VLAN that transports AWS Direct Connect traffic. A private virtual interface can be connected to either a Direct Connect gateway or a Virtual Private Gateway (VGW). Connecting the private virtual interface to a Direct Connect gateway enables the possibility for connecting to multiple VPCs, including VPCs in different AWS Regions. Connecting the private virtual interface to a VGW only provides access to a single VPC within the same Region.</p><p>Setting the MTU of a virtual interface to 9001 (jumbo frames) can cause an update to the underlying physical connection if it wasn't updated to support jumbo frames. Updating the connection disrupts network connectivity for all virtual interfaces associated with the connection for up to 30 seconds. To check whether your connection supports jumbo frames, call <a>DescribeConnections</a>. To check whether your virtual interface supports jumbo frames, call <a>DescribeVirtualInterfaces</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreatePrivateVirtualInterface service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDuplicateTagKeys`, `AWSDirectconnectErrorTooManyTags`, `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectCreatePrivateVirtualInterfaceRequest
 @see AWSDirectconnectVirtualInterface
 */
- (void)createPrivateVirtualInterface:(AWSDirectconnectCreatePrivateVirtualInterfaceRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectVirtualInterface * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a public virtual interface. A virtual interface is the VLAN that transports AWS Direct Connect traffic. A public virtual interface supports sending traffic to public services of AWS such as Amazon S3.</p><p>When creating an IPv6 public virtual interface (<code>addressFamily</code> is <code>ipv6</code>), leave the <code>customer</code> and <code>amazon</code> address fields blank to use auto-assigned IPv6 space. Custom IPv6 addresses are not supported.</p>
 
 @param request A container for the necessary parameters to execute the CreatePublicVirtualInterface service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectVirtualInterface`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDuplicateTagKeys`, `AWSDirectconnectErrorTooManyTags`, `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectCreatePublicVirtualInterfaceRequest
 @see AWSDirectconnectVirtualInterface
 */
- (AWSTask<AWSDirectconnectVirtualInterface *> *)createPublicVirtualInterface:(AWSDirectconnectCreatePublicVirtualInterfaceRequest *)request;

/**
 <p>Creates a public virtual interface. A virtual interface is the VLAN that transports AWS Direct Connect traffic. A public virtual interface supports sending traffic to public services of AWS such as Amazon S3.</p><p>When creating an IPv6 public virtual interface (<code>addressFamily</code> is <code>ipv6</code>), leave the <code>customer</code> and <code>amazon</code> address fields blank to use auto-assigned IPv6 space. Custom IPv6 addresses are not supported.</p>
 
 @param request A container for the necessary parameters to execute the CreatePublicVirtualInterface service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDuplicateTagKeys`, `AWSDirectconnectErrorTooManyTags`, `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectCreatePublicVirtualInterfaceRequest
 @see AWSDirectconnectVirtualInterface
 */
- (void)createPublicVirtualInterface:(AWSDirectconnectCreatePublicVirtualInterfaceRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectVirtualInterface * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a transit virtual interface. A transit virtual interface should be used to access one or more transit gateways associated with Direct Connect gateways. A transit virtual interface enables the connection of multiple VPCs attached to a transit gateway to a Direct Connect gateway.</p><important><p>If you associate your transit gateway with one or more Direct Connect gateways, the Autonomous System Number (ASN) used by the transit gateway and the Direct Connect gateway must be different. For example, if you use the default ASN 64512 for both your the transit gateway and Direct Connect gateway, the association request fails.</p></important><p>Setting the MTU of a virtual interface to 8500 (jumbo frames) can cause an update to the underlying physical connection if it wasn't updated to support jumbo frames. Updating the connection disrupts network connectivity for all virtual interfaces associated with the connection for up to 30 seconds. To check whether your connection supports jumbo frames, call <a>DescribeConnections</a>. To check whether your virtual interface supports jumbo frames, call <a>DescribeVirtualInterfaces</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateTransitVirtualInterface service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectCreateTransitVirtualInterfaceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDuplicateTagKeys`, `AWSDirectconnectErrorTooManyTags`, `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectCreateTransitVirtualInterfaceRequest
 @see AWSDirectconnectCreateTransitVirtualInterfaceResult
 */
- (AWSTask<AWSDirectconnectCreateTransitVirtualInterfaceResult *> *)createTransitVirtualInterface:(AWSDirectconnectCreateTransitVirtualInterfaceRequest *)request;

/**
 <p>Creates a transit virtual interface. A transit virtual interface should be used to access one or more transit gateways associated with Direct Connect gateways. A transit virtual interface enables the connection of multiple VPCs attached to a transit gateway to a Direct Connect gateway.</p><important><p>If you associate your transit gateway with one or more Direct Connect gateways, the Autonomous System Number (ASN) used by the transit gateway and the Direct Connect gateway must be different. For example, if you use the default ASN 64512 for both your the transit gateway and Direct Connect gateway, the association request fails.</p></important><p>Setting the MTU of a virtual interface to 8500 (jumbo frames) can cause an update to the underlying physical connection if it wasn't updated to support jumbo frames. Updating the connection disrupts network connectivity for all virtual interfaces associated with the connection for up to 30 seconds. To check whether your connection supports jumbo frames, call <a>DescribeConnections</a>. To check whether your virtual interface supports jumbo frames, call <a>DescribeVirtualInterfaces</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateTransitVirtualInterface service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDuplicateTagKeys`, `AWSDirectconnectErrorTooManyTags`, `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectCreateTransitVirtualInterfaceRequest
 @see AWSDirectconnectCreateTransitVirtualInterfaceResult
 */
- (void)createTransitVirtualInterface:(AWSDirectconnectCreateTransitVirtualInterfaceRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectCreateTransitVirtualInterfaceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified BGP peer on the specified virtual interface with the specified customer address and ASN.</p><p>You cannot delete the last BGP peer from a virtual interface.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBGPPeer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectDeleteBGPPeerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDeleteBGPPeerRequest
 @see AWSDirectconnectDeleteBGPPeerResponse
 */
- (AWSTask<AWSDirectconnectDeleteBGPPeerResponse *> *)deleteBGPPeer:(AWSDirectconnectDeleteBGPPeerRequest *)request;

/**
 <p>Deletes the specified BGP peer on the specified virtual interface with the specified customer address and ASN.</p><p>You cannot delete the last BGP peer from a virtual interface.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBGPPeer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDeleteBGPPeerRequest
 @see AWSDirectconnectDeleteBGPPeerResponse
 */
- (void)deleteBGPPeer:(AWSDirectconnectDeleteBGPPeerRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectDeleteBGPPeerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified connection.</p><p>Deleting a connection only stops the AWS Direct Connect port hour and data transfer charges. If you are partnering with any third parties to connect with the AWS Direct Connect location, you must cancel your service with them separately.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectConnection`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDeleteConnectionRequest
 @see AWSDirectconnectConnection
 */
- (AWSTask<AWSDirectconnectConnection *> *)deleteConnection:(AWSDirectconnectDeleteConnectionRequest *)request;

/**
 <p>Deletes the specified connection.</p><p>Deleting a connection only stops the AWS Direct Connect port hour and data transfer charges. If you are partnering with any third parties to connect with the AWS Direct Connect location, you must cancel your service with them separately.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDeleteConnectionRequest
 @see AWSDirectconnectConnection
 */
- (void)deleteConnection:(AWSDirectconnectDeleteConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectConnection * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified Direct Connect gateway. You must first delete all virtual interfaces that are attached to the Direct Connect gateway and disassociate all virtual private gateways associated with the Direct Connect gateway.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDirectConnectGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectDeleteDirectConnectGatewayResult`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDeleteDirectConnectGatewayRequest
 @see AWSDirectconnectDeleteDirectConnectGatewayResult
 */
- (AWSTask<AWSDirectconnectDeleteDirectConnectGatewayResult *> *)deleteDirectConnectGateway:(AWSDirectconnectDeleteDirectConnectGatewayRequest *)request;

/**
 <p>Deletes the specified Direct Connect gateway. You must first delete all virtual interfaces that are attached to the Direct Connect gateway and disassociate all virtual private gateways associated with the Direct Connect gateway.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDirectConnectGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDeleteDirectConnectGatewayRequest
 @see AWSDirectconnectDeleteDirectConnectGatewayResult
 */
- (void)deleteDirectConnectGateway:(AWSDirectconnectDeleteDirectConnectGatewayRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectDeleteDirectConnectGatewayResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the association between the specified Direct Connect gateway and virtual private gateway.</p><p>We recommend that you specify the <code>associationID</code> to delete the association. Alternatively, if you own virtual gateway and a Direct Connect gateway association, you can specify the <code>virtualGatewayId</code> and <code>directConnectGatewayId</code> to delete an association.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDirectConnectGatewayAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectDeleteDirectConnectGatewayAssociationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDeleteDirectConnectGatewayAssociationRequest
 @see AWSDirectconnectDeleteDirectConnectGatewayAssociationResult
 */
- (AWSTask<AWSDirectconnectDeleteDirectConnectGatewayAssociationResult *> *)deleteDirectConnectGatewayAssociation:(AWSDirectconnectDeleteDirectConnectGatewayAssociationRequest *)request;

/**
 <p>Deletes the association between the specified Direct Connect gateway and virtual private gateway.</p><p>We recommend that you specify the <code>associationID</code> to delete the association. Alternatively, if you own virtual gateway and a Direct Connect gateway association, you can specify the <code>virtualGatewayId</code> and <code>directConnectGatewayId</code> to delete an association.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDirectConnectGatewayAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDeleteDirectConnectGatewayAssociationRequest
 @see AWSDirectconnectDeleteDirectConnectGatewayAssociationResult
 */
- (void)deleteDirectConnectGatewayAssociation:(AWSDirectconnectDeleteDirectConnectGatewayAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectDeleteDirectConnectGatewayAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the association proposal request between the specified Direct Connect gateway and virtual private gateway or transit gateway.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDirectConnectGatewayAssociationProposal service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalResult`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalRequest
 @see AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalResult
 */
- (AWSTask<AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalResult *> *)deleteDirectConnectGatewayAssociationProposal:(AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalRequest *)request;

/**
 <p>Deletes the association proposal request between the specified Direct Connect gateway and virtual private gateway or transit gateway.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDirectConnectGatewayAssociationProposal service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalRequest
 @see AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalResult
 */
- (void)deleteDirectConnectGatewayAssociationProposal:(AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified interconnect.</p><note><p>Intended for use by AWS Direct Connect Partners only.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteInterconnect service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectDeleteInterconnectResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDeleteInterconnectRequest
 @see AWSDirectconnectDeleteInterconnectResponse
 */
- (AWSTask<AWSDirectconnectDeleteInterconnectResponse *> *)deleteInterconnect:(AWSDirectconnectDeleteInterconnectRequest *)request;

/**
 <p>Deletes the specified interconnect.</p><note><p>Intended for use by AWS Direct Connect Partners only.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteInterconnect service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDeleteInterconnectRequest
 @see AWSDirectconnectDeleteInterconnectResponse
 */
- (void)deleteInterconnect:(AWSDirectconnectDeleteInterconnectRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectDeleteInterconnectResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified link aggregation group (LAG). You cannot delete a LAG if it has active virtual interfaces or hosted connections.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLag service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectLag`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDeleteLagRequest
 @see AWSDirectconnectLag
 */
- (AWSTask<AWSDirectconnectLag *> *)deleteLag:(AWSDirectconnectDeleteLagRequest *)request;

/**
 <p>Deletes the specified link aggregation group (LAG). You cannot delete a LAG if it has active virtual interfaces or hosted connections.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLag service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDeleteLagRequest
 @see AWSDirectconnectLag
 */
- (void)deleteLag:(AWSDirectconnectDeleteLagRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectLag * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a virtual interface.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVirtualInterface service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectDeleteVirtualInterfaceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDeleteVirtualInterfaceRequest
 @see AWSDirectconnectDeleteVirtualInterfaceResponse
 */
- (AWSTask<AWSDirectconnectDeleteVirtualInterfaceResponse *> *)deleteVirtualInterface:(AWSDirectconnectDeleteVirtualInterfaceRequest *)request;

/**
 <p>Deletes a virtual interface.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVirtualInterface service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDeleteVirtualInterfaceRequest
 @see AWSDirectconnectDeleteVirtualInterfaceResponse
 */
- (void)deleteVirtualInterface:(AWSDirectconnectDeleteVirtualInterfaceRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectDeleteVirtualInterfaceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deprecated. Use <a>DescribeLoa</a> instead.</p><p>Gets the LOA-CFA for a connection.</p><p>The Letter of Authorization - Connecting Facility Assignment (LOA-CFA) is a document that your APN partner or service provider uses when establishing your cross connect to AWS at the colocation facility. For more information, see <a href="https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html">Requesting Cross Connects at AWS Direct Connect Locations</a> in the <i>AWS Direct Connect User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeConnectionLoa service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectDescribeConnectionLoaResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeConnectionLoaRequest
 @see AWSDirectconnectDescribeConnectionLoaResponse
 */
- (AWSTask<AWSDirectconnectDescribeConnectionLoaResponse *> *)describeConnectionLoa:(AWSDirectconnectDescribeConnectionLoaRequest *)request;

/**
 <p>Deprecated. Use <a>DescribeLoa</a> instead.</p><p>Gets the LOA-CFA for a connection.</p><p>The Letter of Authorization - Connecting Facility Assignment (LOA-CFA) is a document that your APN partner or service provider uses when establishing your cross connect to AWS at the colocation facility. For more information, see <a href="https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html">Requesting Cross Connects at AWS Direct Connect Locations</a> in the <i>AWS Direct Connect User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeConnectionLoa service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeConnectionLoaRequest
 @see AWSDirectconnectDescribeConnectionLoaResponse
 */
- (void)describeConnectionLoa:(AWSDirectconnectDescribeConnectionLoaRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectDescribeConnectionLoaResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Displays the specified connection or all connections in this Region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeConnections service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectConnections`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeConnectionsRequest
 @see AWSDirectconnectConnections
 */
- (AWSTask<AWSDirectconnectConnections *> *)describeConnections:(AWSDirectconnectDescribeConnectionsRequest *)request;

/**
 <p>Displays the specified connection or all connections in this Region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeConnections service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeConnectionsRequest
 @see AWSDirectconnectConnections
 */
- (void)describeConnections:(AWSDirectconnectDescribeConnectionsRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectConnections * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deprecated. Use <a>DescribeHostedConnections</a> instead.</p><p>Lists the connections that have been provisioned on the specified interconnect.</p><note><p>Intended for use by AWS Direct Connect Partners only.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeConnectionsOnInterconnect service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectConnections`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeConnectionsOnInterconnectRequest
 @see AWSDirectconnectConnections
 */
- (AWSTask<AWSDirectconnectConnections *> *)describeConnectionsOnInterconnect:(AWSDirectconnectDescribeConnectionsOnInterconnectRequest *)request;

/**
 <p>Deprecated. Use <a>DescribeHostedConnections</a> instead.</p><p>Lists the connections that have been provisioned on the specified interconnect.</p><note><p>Intended for use by AWS Direct Connect Partners only.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeConnectionsOnInterconnect service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeConnectionsOnInterconnectRequest
 @see AWSDirectconnectConnections
 */
- (void)describeConnectionsOnInterconnect:(AWSDirectconnectDescribeConnectionsOnInterconnectRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectConnections * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more association proposals for connection between a virtual private gateway or transit gateway and a Direct Connect gateway. </p>
 
 @param request A container for the necessary parameters to execute the DescribeDirectConnectGatewayAssociationProposals service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsRequest
 @see AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsResult
 */
- (AWSTask<AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsResult *> *)describeDirectConnectGatewayAssociationProposals:(AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsRequest *)request;

/**
 <p>Describes one or more association proposals for connection between a virtual private gateway or transit gateway and a Direct Connect gateway. </p>
 
 @param request A container for the necessary parameters to execute the DescribeDirectConnectGatewayAssociationProposals service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsRequest
 @see AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsResult
 */
- (void)describeDirectConnectGatewayAssociationProposals:(AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the associations between your Direct Connect gateways and virtual private gateways. You must specify a Direct Connect gateway, a virtual private gateway, or both. If you specify a Direct Connect gateway, the response contains all virtual private gateways associated with the Direct Connect gateway. If you specify a virtual private gateway, the response contains all Direct Connect gateways associated with the virtual private gateway. If you specify both, the response contains the association between the Direct Connect gateway and the virtual private gateway.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDirectConnectGatewayAssociations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectDescribeDirectConnectGatewayAssociationsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeDirectConnectGatewayAssociationsRequest
 @see AWSDirectconnectDescribeDirectConnectGatewayAssociationsResult
 */
- (AWSTask<AWSDirectconnectDescribeDirectConnectGatewayAssociationsResult *> *)describeDirectConnectGatewayAssociations:(AWSDirectconnectDescribeDirectConnectGatewayAssociationsRequest *)request;

/**
 <p>Lists the associations between your Direct Connect gateways and virtual private gateways. You must specify a Direct Connect gateway, a virtual private gateway, or both. If you specify a Direct Connect gateway, the response contains all virtual private gateways associated with the Direct Connect gateway. If you specify a virtual private gateway, the response contains all Direct Connect gateways associated with the virtual private gateway. If you specify both, the response contains the association between the Direct Connect gateway and the virtual private gateway.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDirectConnectGatewayAssociations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeDirectConnectGatewayAssociationsRequest
 @see AWSDirectconnectDescribeDirectConnectGatewayAssociationsResult
 */
- (void)describeDirectConnectGatewayAssociations:(AWSDirectconnectDescribeDirectConnectGatewayAssociationsRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectDescribeDirectConnectGatewayAssociationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the attachments between your Direct Connect gateways and virtual interfaces. You must specify a Direct Connect gateway, a virtual interface, or both. If you specify a Direct Connect gateway, the response contains all virtual interfaces attached to the Direct Connect gateway. If you specify a virtual interface, the response contains all Direct Connect gateways attached to the virtual interface. If you specify both, the response contains the attachment between the Direct Connect gateway and the virtual interface.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDirectConnectGatewayAttachments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectDescribeDirectConnectGatewayAttachmentsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeDirectConnectGatewayAttachmentsRequest
 @see AWSDirectconnectDescribeDirectConnectGatewayAttachmentsResult
 */
- (AWSTask<AWSDirectconnectDescribeDirectConnectGatewayAttachmentsResult *> *)describeDirectConnectGatewayAttachments:(AWSDirectconnectDescribeDirectConnectGatewayAttachmentsRequest *)request;

/**
 <p>Lists the attachments between your Direct Connect gateways and virtual interfaces. You must specify a Direct Connect gateway, a virtual interface, or both. If you specify a Direct Connect gateway, the response contains all virtual interfaces attached to the Direct Connect gateway. If you specify a virtual interface, the response contains all Direct Connect gateways attached to the virtual interface. If you specify both, the response contains the attachment between the Direct Connect gateway and the virtual interface.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDirectConnectGatewayAttachments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeDirectConnectGatewayAttachmentsRequest
 @see AWSDirectconnectDescribeDirectConnectGatewayAttachmentsResult
 */
- (void)describeDirectConnectGatewayAttachments:(AWSDirectconnectDescribeDirectConnectGatewayAttachmentsRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectDescribeDirectConnectGatewayAttachmentsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all your Direct Connect gateways or only the specified Direct Connect gateway. Deleted Direct Connect gateways are not returned.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDirectConnectGateways service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectDescribeDirectConnectGatewaysResult`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeDirectConnectGatewaysRequest
 @see AWSDirectconnectDescribeDirectConnectGatewaysResult
 */
- (AWSTask<AWSDirectconnectDescribeDirectConnectGatewaysResult *> *)describeDirectConnectGateways:(AWSDirectconnectDescribeDirectConnectGatewaysRequest *)request;

/**
 <p>Lists all your Direct Connect gateways or only the specified Direct Connect gateway. Deleted Direct Connect gateways are not returned.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDirectConnectGateways service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeDirectConnectGatewaysRequest
 @see AWSDirectconnectDescribeDirectConnectGatewaysResult
 */
- (void)describeDirectConnectGateways:(AWSDirectconnectDescribeDirectConnectGatewaysRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectDescribeDirectConnectGatewaysResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the hosted connections that have been provisioned on the specified interconnect or link aggregation group (LAG).</p><note><p>Intended for use by AWS Direct Connect Partners only.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeHostedConnections service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectConnections`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeHostedConnectionsRequest
 @see AWSDirectconnectConnections
 */
- (AWSTask<AWSDirectconnectConnections *> *)describeHostedConnections:(AWSDirectconnectDescribeHostedConnectionsRequest *)request;

/**
 <p>Lists the hosted connections that have been provisioned on the specified interconnect or link aggregation group (LAG).</p><note><p>Intended for use by AWS Direct Connect Partners only.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeHostedConnections service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeHostedConnectionsRequest
 @see AWSDirectconnectConnections
 */
- (void)describeHostedConnections:(AWSDirectconnectDescribeHostedConnectionsRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectConnections * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deprecated. Use <a>DescribeLoa</a> instead.</p><p>Gets the LOA-CFA for the specified interconnect.</p><p>The Letter of Authorization - Connecting Facility Assignment (LOA-CFA) is a document that is used when establishing your cross connect to AWS at the colocation facility. For more information, see <a href="https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html">Requesting Cross Connects at AWS Direct Connect Locations</a> in the <i>AWS Direct Connect User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInterconnectLoa service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectDescribeInterconnectLoaResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeInterconnectLoaRequest
 @see AWSDirectconnectDescribeInterconnectLoaResponse
 */
- (AWSTask<AWSDirectconnectDescribeInterconnectLoaResponse *> *)describeInterconnectLoa:(AWSDirectconnectDescribeInterconnectLoaRequest *)request;

/**
 <p>Deprecated. Use <a>DescribeLoa</a> instead.</p><p>Gets the LOA-CFA for the specified interconnect.</p><p>The Letter of Authorization - Connecting Facility Assignment (LOA-CFA) is a document that is used when establishing your cross connect to AWS at the colocation facility. For more information, see <a href="https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html">Requesting Cross Connects at AWS Direct Connect Locations</a> in the <i>AWS Direct Connect User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInterconnectLoa service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeInterconnectLoaRequest
 @see AWSDirectconnectDescribeInterconnectLoaResponse
 */
- (void)describeInterconnectLoa:(AWSDirectconnectDescribeInterconnectLoaRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectDescribeInterconnectLoaResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the interconnects owned by the AWS account or only the specified interconnect.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInterconnects service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectInterconnects`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeInterconnectsRequest
 @see AWSDirectconnectInterconnects
 */
- (AWSTask<AWSDirectconnectInterconnects *> *)describeInterconnects:(AWSDirectconnectDescribeInterconnectsRequest *)request;

/**
 <p>Lists the interconnects owned by the AWS account or only the specified interconnect.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInterconnects service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeInterconnectsRequest
 @see AWSDirectconnectInterconnects
 */
- (void)describeInterconnects:(AWSDirectconnectDescribeInterconnectsRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectInterconnects * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes all your link aggregation groups (LAG) or the specified LAG.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectLags`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeLagsRequest
 @see AWSDirectconnectLags
 */
- (AWSTask<AWSDirectconnectLags *> *)describeLags:(AWSDirectconnectDescribeLagsRequest *)request;

/**
 <p>Describes all your link aggregation groups (LAG) or the specified LAG.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeLagsRequest
 @see AWSDirectconnectLags
 */
- (void)describeLags:(AWSDirectconnectDescribeLagsRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectLags * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the LOA-CFA for a connection, interconnect, or link aggregation group (LAG).</p><p>The Letter of Authorization - Connecting Facility Assignment (LOA-CFA) is a document that is used when establishing your cross connect to AWS at the colocation facility. For more information, see <a href="https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html">Requesting Cross Connects at AWS Direct Connect Locations</a> in the <i>AWS Direct Connect User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLoa service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectLoa`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeLoaRequest
 @see AWSDirectconnectLoa
 */
- (AWSTask<AWSDirectconnectLoa *> *)describeLoa:(AWSDirectconnectDescribeLoaRequest *)request;

/**
 <p>Gets the LOA-CFA for a connection, interconnect, or link aggregation group (LAG).</p><p>The Letter of Authorization - Connecting Facility Assignment (LOA-CFA) is a document that is used when establishing your cross connect to AWS at the colocation facility. For more information, see <a href="https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html">Requesting Cross Connects at AWS Direct Connect Locations</a> in the <i>AWS Direct Connect User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLoa service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeLoaRequest
 @see AWSDirectconnectLoa
 */
- (void)describeLoa:(AWSDirectconnectDescribeLoaRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectLoa * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the AWS Direct Connect locations in the current AWS Region. These are the locations that can be selected when calling <a>CreateConnection</a> or <a>CreateInterconnect</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLocations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectLocations`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSRequest
 @see AWSDirectconnectLocations
 */
- (AWSTask<AWSDirectconnectLocations *> *)describeLocations:(AWSRequest *)request;

/**
 <p>Lists the AWS Direct Connect locations in the current AWS Region. These are the locations that can be selected when calling <a>CreateConnection</a> or <a>CreateInterconnect</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLocations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSRequest
 @see AWSDirectconnectLocations
 */
- (void)describeLocations:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectLocations * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the tags associated with the specified AWS Direct Connect resources.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectDescribeTagsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeTagsRequest
 @see AWSDirectconnectDescribeTagsResponse
 */
- (AWSTask<AWSDirectconnectDescribeTagsResponse *> *)describeTags:(AWSDirectconnectDescribeTagsRequest *)request;

/**
 <p>Describes the tags associated with the specified AWS Direct Connect resources.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeTagsRequest
 @see AWSDirectconnectDescribeTagsResponse
 */
- (void)describeTags:(AWSDirectconnectDescribeTagsRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectDescribeTagsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the virtual private gateways owned by the AWS account.</p><p>You can create one or more AWS Direct Connect private virtual interfaces linked to a virtual private gateway.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVirtualGateways service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectVirtualGateways`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSRequest
 @see AWSDirectconnectVirtualGateways
 */
- (AWSTask<AWSDirectconnectVirtualGateways *> *)describeVirtualGateways:(AWSRequest *)request;

/**
 <p>Lists the virtual private gateways owned by the AWS account.</p><p>You can create one or more AWS Direct Connect private virtual interfaces linked to a virtual private gateway.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVirtualGateways service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSRequest
 @see AWSDirectconnectVirtualGateways
 */
- (void)describeVirtualGateways:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectVirtualGateways * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Displays all virtual interfaces for an AWS account. Virtual interfaces deleted fewer than 15 minutes before you make the request are also returned. If you specify a connection ID, only the virtual interfaces associated with the connection are returned. If you specify a virtual interface ID, then only a single virtual interface is returned.</p><p>A virtual interface (VLAN) transmits the traffic between the AWS Direct Connect location and the customer network.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVirtualInterfaces service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectVirtualInterfaces`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeVirtualInterfacesRequest
 @see AWSDirectconnectVirtualInterfaces
 */
- (AWSTask<AWSDirectconnectVirtualInterfaces *> *)describeVirtualInterfaces:(AWSDirectconnectDescribeVirtualInterfacesRequest *)request;

/**
 <p>Displays all virtual interfaces for an AWS account. Virtual interfaces deleted fewer than 15 minutes before you make the request are also returned. If you specify a connection ID, only the virtual interfaces associated with the connection are returned. If you specify a virtual interface ID, then only a single virtual interface is returned.</p><p>A virtual interface (VLAN) transmits the traffic between the AWS Direct Connect location and the customer network.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVirtualInterfaces service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDescribeVirtualInterfacesRequest
 @see AWSDirectconnectVirtualInterfaces
 */
- (void)describeVirtualInterfaces:(AWSDirectconnectDescribeVirtualInterfacesRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectVirtualInterfaces * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a connection from a link aggregation group (LAG). The connection is interrupted and re-established as a standalone connection (the connection is not deleted; to delete the connection, use the <a>DeleteConnection</a> request). If the LAG has associated virtual interfaces or hosted connections, they remain associated with the LAG. A disassociated connection owned by an AWS Direct Connect Partner is automatically converted to an interconnect.</p><p>If disassociating the connection would cause the LAG to fall below its setting for minimum number of operational connections, the request fails, except when it's the last member of the LAG. If all connections are disassociated, the LAG continues to exist as an empty LAG with no physical connections. </p>
 
 @param request A container for the necessary parameters to execute the DisassociateConnectionFromLag service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectConnection`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDisassociateConnectionFromLagRequest
 @see AWSDirectconnectConnection
 */
- (AWSTask<AWSDirectconnectConnection *> *)disassociateConnectionFromLag:(AWSDirectconnectDisassociateConnectionFromLagRequest *)request;

/**
 <p>Disassociates a connection from a link aggregation group (LAG). The connection is interrupted and re-established as a standalone connection (the connection is not deleted; to delete the connection, use the <a>DeleteConnection</a> request). If the LAG has associated virtual interfaces or hosted connections, they remain associated with the LAG. A disassociated connection owned by an AWS Direct Connect Partner is automatically converted to an interconnect.</p><p>If disassociating the connection would cause the LAG to fall below its setting for minimum number of operational connections, the request fails, except when it's the last member of the LAG. If all connections are disassociated, the LAG continues to exist as an empty LAG with no physical connections. </p>
 
 @param request A container for the necessary parameters to execute the DisassociateConnectionFromLag service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectDisassociateConnectionFromLagRequest
 @see AWSDirectconnectConnection
 */
- (void)disassociateConnectionFromLag:(AWSDirectconnectDisassociateConnectionFromLagRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectConnection * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the virtual interface failover test history.</p>
 
 @param request A container for the necessary parameters to execute the ListVirtualInterfaceTestHistory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectListVirtualInterfaceTestHistoryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectListVirtualInterfaceTestHistoryRequest
 @see AWSDirectconnectListVirtualInterfaceTestHistoryResponse
 */
- (AWSTask<AWSDirectconnectListVirtualInterfaceTestHistoryResponse *> *)listVirtualInterfaceTestHistory:(AWSDirectconnectListVirtualInterfaceTestHistoryRequest *)request;

/**
 <p>Lists the virtual interface failover test history.</p>
 
 @param request A container for the necessary parameters to execute the ListVirtualInterfaceTestHistory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectListVirtualInterfaceTestHistoryRequest
 @see AWSDirectconnectListVirtualInterfaceTestHistoryResponse
 */
- (void)listVirtualInterfaceTestHistory:(AWSDirectconnectListVirtualInterfaceTestHistoryRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectListVirtualInterfaceTestHistoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts the virtual interface failover test that verifies your configuration meets your resiliency requirements by placing the BGP peering session in the DOWN state. You can then send traffic to verify that there are no outages.</p><p>You can run the test on public, private, transit, and hosted virtual interfaces.</p><p>You can use <a href="https://docs.aws.amazon.com/directconnect/latest/APIReference/API_ListVirtualInterfaceTestHistory.html">ListVirtualInterfaceTestHistory</a> to view the virtual interface test history.</p><p>If you need to stop the test before the test interval completes, use <a href="https://docs.aws.amazon.com/directconnect/latest/APIReference/API_StopBgpFailoverTest.html">StopBgpFailoverTest</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartBgpFailoverTest service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectStartBgpFailoverTestResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectStartBgpFailoverTestRequest
 @see AWSDirectconnectStartBgpFailoverTestResponse
 */
- (AWSTask<AWSDirectconnectStartBgpFailoverTestResponse *> *)startBgpFailoverTest:(AWSDirectconnectStartBgpFailoverTestRequest *)request;

/**
 <p>Starts the virtual interface failover test that verifies your configuration meets your resiliency requirements by placing the BGP peering session in the DOWN state. You can then send traffic to verify that there are no outages.</p><p>You can run the test on public, private, transit, and hosted virtual interfaces.</p><p>You can use <a href="https://docs.aws.amazon.com/directconnect/latest/APIReference/API_ListVirtualInterfaceTestHistory.html">ListVirtualInterfaceTestHistory</a> to view the virtual interface test history.</p><p>If you need to stop the test before the test interval completes, use <a href="https://docs.aws.amazon.com/directconnect/latest/APIReference/API_StopBgpFailoverTest.html">StopBgpFailoverTest</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartBgpFailoverTest service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectStartBgpFailoverTestRequest
 @see AWSDirectconnectStartBgpFailoverTestResponse
 */
- (void)startBgpFailoverTest:(AWSDirectconnectStartBgpFailoverTestRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectStartBgpFailoverTestResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops the virtual interface failover test.</p>
 
 @param request A container for the necessary parameters to execute the StopBgpFailoverTest service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectStopBgpFailoverTestResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectStopBgpFailoverTestRequest
 @see AWSDirectconnectStopBgpFailoverTestResponse
 */
- (AWSTask<AWSDirectconnectStopBgpFailoverTestResponse *> *)stopBgpFailoverTest:(AWSDirectconnectStopBgpFailoverTestRequest *)request;

/**
 <p>Stops the virtual interface failover test.</p>
 
 @param request A container for the necessary parameters to execute the StopBgpFailoverTest service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectStopBgpFailoverTestRequest
 @see AWSDirectconnectStopBgpFailoverTestResponse
 */
- (void)stopBgpFailoverTest:(AWSDirectconnectStopBgpFailoverTestRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectStopBgpFailoverTestResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds the specified tags to the specified AWS Direct Connect resource. Each resource can have a maximum of 50 tags.</p><p>Each tag consists of a key and an optional value. If a tag with the same key is already associated with the resource, this action updates its value.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDuplicateTagKeys`, `AWSDirectconnectErrorTooManyTags`, `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectTagResourceRequest
 @see AWSDirectconnectTagResourceResponse
 */
- (AWSTask<AWSDirectconnectTagResourceResponse *> *)tagResource:(AWSDirectconnectTagResourceRequest *)request;

/**
 <p>Adds the specified tags to the specified AWS Direct Connect resource. Each resource can have a maximum of 50 tags.</p><p>Each tag consists of a key and an optional value. If a tag with the same key is already associated with the resource, this action updates its value.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDuplicateTagKeys`, `AWSDirectconnectErrorTooManyTags`, `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectTagResourceRequest
 @see AWSDirectconnectTagResourceResponse
 */
- (void)tagResource:(AWSDirectconnectTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes one or more tags from the specified AWS Direct Connect resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectUntagResourceRequest
 @see AWSDirectconnectUntagResourceResponse
 */
- (AWSTask<AWSDirectconnectUntagResourceResponse *> *)untagResource:(AWSDirectconnectUntagResourceRequest *)request;

/**
 <p>Removes one or more tags from the specified AWS Direct Connect resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectUntagResourceRequest
 @see AWSDirectconnectUntagResourceResponse
 */
- (void)untagResource:(AWSDirectconnectUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified attributes of the Direct Connect gateway association.</p><p>Add or remove prefixes from the association.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDirectConnectGatewayAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectUpdateDirectConnectGatewayAssociationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectUpdateDirectConnectGatewayAssociationRequest
 @see AWSDirectconnectUpdateDirectConnectGatewayAssociationResult
 */
- (AWSTask<AWSDirectconnectUpdateDirectConnectGatewayAssociationResult *> *)updateDirectConnectGatewayAssociation:(AWSDirectconnectUpdateDirectConnectGatewayAssociationRequest *)request;

/**
 <p>Updates the specified attributes of the Direct Connect gateway association.</p><p>Add or remove prefixes from the association.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDirectConnectGatewayAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectUpdateDirectConnectGatewayAssociationRequest
 @see AWSDirectconnectUpdateDirectConnectGatewayAssociationResult
 */
- (void)updateDirectConnectGatewayAssociation:(AWSDirectconnectUpdateDirectConnectGatewayAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectUpdateDirectConnectGatewayAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the attributes of the specified link aggregation group (LAG).</p><p>You can update the following attributes:</p><ul><li><p>The name of the LAG.</p></li><li><p>The value for the minimum number of connections that must be operational for the LAG itself to be operational. </p></li></ul><p>When you create a LAG, the default value for the minimum number of operational connections is zero (0). If you update this value and the number of operational connections falls below the specified value, the LAG automatically goes down to avoid over-utilization of the remaining connections. Adjust this value with care, as it could force the LAG down if it is set higher than the current number of operational connections.</p>
 
 @param request A container for the necessary parameters to execute the UpdateLag service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectLag`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectUpdateLagRequest
 @see AWSDirectconnectLag
 */
- (AWSTask<AWSDirectconnectLag *> *)updateLag:(AWSDirectconnectUpdateLagRequest *)request;

/**
 <p>Updates the attributes of the specified link aggregation group (LAG).</p><p>You can update the following attributes:</p><ul><li><p>The name of the LAG.</p></li><li><p>The value for the minimum number of connections that must be operational for the LAG itself to be operational. </p></li></ul><p>When you create a LAG, the default value for the minimum number of operational connections is zero (0). If you update this value and the number of operational connections falls below the specified value, the LAG automatically goes down to avoid over-utilization of the remaining connections. Adjust this value with care, as it could force the LAG down if it is set higher than the current number of operational connections.</p>
 
 @param request A container for the necessary parameters to execute the UpdateLag service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectUpdateLagRequest
 @see AWSDirectconnectLag
 */
- (void)updateLag:(AWSDirectconnectUpdateLagRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectLag * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified attributes of the specified virtual private interface.</p><p>Setting the MTU of a virtual interface to 9001 (jumbo frames) can cause an update to the underlying physical connection if it wasn't updated to support jumbo frames. Updating the connection disrupts network connectivity for all virtual interfaces associated with the connection for up to 30 seconds. To check whether your connection supports jumbo frames, call <a>DescribeConnections</a>. To check whether your virtual q interface supports jumbo frames, call <a>DescribeVirtualInterfaces</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVirtualInterfaceAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDirectconnectVirtualInterface`. On failed execution, `task.error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectUpdateVirtualInterfaceAttributesRequest
 @see AWSDirectconnectVirtualInterface
 */
- (AWSTask<AWSDirectconnectVirtualInterface *> *)updateVirtualInterfaceAttributes:(AWSDirectconnectUpdateVirtualInterfaceAttributesRequest *)request;

/**
 <p>Updates the specified attributes of the specified virtual private interface.</p><p>Setting the MTU of a virtual interface to 9001 (jumbo frames) can cause an update to the underlying physical connection if it wasn't updated to support jumbo frames. Updating the connection disrupts network connectivity for all virtual interfaces associated with the connection for up to 30 seconds. To check whether your connection supports jumbo frames, call <a>DescribeConnections</a>. To check whether your virtual q interface supports jumbo frames, call <a>DescribeVirtualInterfaces</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVirtualInterfaceAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDirectconnectErrorDomain` domain and the following error code: `AWSDirectconnectErrorDirectConnectServer`, `AWSDirectconnectErrorDirectConnectClient`.
 
 @see AWSDirectconnectUpdateVirtualInterfaceAttributesRequest
 @see AWSDirectconnectVirtualInterface
 */
- (void)updateVirtualInterfaceAttributes:(AWSDirectconnectUpdateVirtualInterfaceAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSDirectconnectVirtualInterface * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
