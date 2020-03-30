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
#import "AWSEC2Model.h"
#import "AWSEC2Resources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSEC2
FOUNDATION_EXPORT NSString *const AWSEC2SDKVersion;

/**
 <fullname>Amazon Elastic Compute Cloud</fullname><p>Amazon Elastic Compute Cloud (Amazon EC2) provides secure and resizable computing capacity in the AWS cloud. Using Amazon EC2 eliminates the need to invest in hardware up front, so you can develop and deploy applications faster.</p><p>To learn more, see the following resources:</p><ul><li><p>Amazon EC2: <a href="http://aws.amazon.com/ec2">AmazonEC2 product page</a>, <a href="http://aws.amazon.com/documentation/ec2">Amazon EC2 documentation</a></p></li><li><p>Amazon EBS: <a href="http://aws.amazon.com/ebs">Amazon EBS product page</a>, <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AmazonEBS.html">Amazon EBS documentation</a></p></li><li><p>Amazon VPC: <a href="http://aws.amazon.com/vpc">Amazon VPC product page</a>, <a href="http://aws.amazon.com/documentation/vpc">Amazon VPC documentation</a></p></li><li><p>AWS VPN: <a href="http://aws.amazon.com/vpn">AWS VPN product page</a>, <a href="http://aws.amazon.com/documentation/vpn">AWS VPN documentation</a></p></li></ul>
 */
@interface AWSEC2 : AWSService

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

     let EC2 = AWSEC2.default()

 *Objective-C*

     AWSEC2 *EC2 = [AWSEC2 defaultEC2];

 @return The default service client.
 */
+ (instancetype)defaultEC2;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSEC2.register(with: configuration!, forKey: "USWest2EC2")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSEC2 registerEC2WithConfiguration:configuration forKey:@"USWest2EC2"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let EC2 = AWSEC2(forKey: "USWest2EC2")

 *Objective-C*

     AWSEC2 *EC2 = [AWSEC2 EC2ForKey:@"USWest2EC2"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerEC2WithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerEC2WithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSEC2.register(with: configuration!, forKey: "USWest2EC2")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSEC2 registerEC2WithConfiguration:configuration forKey:@"USWest2EC2"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let EC2 = AWSEC2(forKey: "USWest2EC2")

 *Objective-C*

     AWSEC2 *EC2 = [AWSEC2 EC2ForKey:@"USWest2EC2"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)EC2ForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeEC2ForKey:(NSString *)key;

/**
 <p>Accepts the Convertible Reserved Instance exchange quote described in the <a>GetReservedInstancesExchangeQuote</a> call.</p>
 
 @param request A container for the necessary parameters to execute the AcceptReservedInstancesExchangeQuote service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AcceptReservedInstancesExchangeQuoteResult`.
 
 @see AWSEC2AcceptReservedInstancesExchangeQuoteRequest
 @see AWSEC2AcceptReservedInstancesExchangeQuoteResult
 */
- (AWSTask<AWSEC2AcceptReservedInstancesExchangeQuoteResult *> *)acceptReservedInstancesExchangeQuote:(AWSEC2AcceptReservedInstancesExchangeQuoteRequest *)request;

/**
 <p>Accepts the Convertible Reserved Instance exchange quote described in the <a>GetReservedInstancesExchangeQuote</a> call.</p>
 
 @param request A container for the necessary parameters to execute the AcceptReservedInstancesExchangeQuote service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AcceptReservedInstancesExchangeQuoteRequest
 @see AWSEC2AcceptReservedInstancesExchangeQuoteResult
 */
- (void)acceptReservedInstancesExchangeQuote:(AWSEC2AcceptReservedInstancesExchangeQuoteRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AcceptReservedInstancesExchangeQuoteResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Accepts a transit gateway peering attachment request. The peering attachment must be in the <code>pendingAcceptance</code> state.</p>
 
 @param request A container for the necessary parameters to execute the AcceptTransitGatewayPeeringAttachment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AcceptTransitGatewayPeeringAttachmentResult`.
 
 @see AWSEC2AcceptTransitGatewayPeeringAttachmentRequest
 @see AWSEC2AcceptTransitGatewayPeeringAttachmentResult
 */
- (AWSTask<AWSEC2AcceptTransitGatewayPeeringAttachmentResult *> *)acceptTransitGatewayPeeringAttachment:(AWSEC2AcceptTransitGatewayPeeringAttachmentRequest *)request;

/**
 <p>Accepts a transit gateway peering attachment request. The peering attachment must be in the <code>pendingAcceptance</code> state.</p>
 
 @param request A container for the necessary parameters to execute the AcceptTransitGatewayPeeringAttachment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AcceptTransitGatewayPeeringAttachmentRequest
 @see AWSEC2AcceptTransitGatewayPeeringAttachmentResult
 */
- (void)acceptTransitGatewayPeeringAttachment:(AWSEC2AcceptTransitGatewayPeeringAttachmentRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AcceptTransitGatewayPeeringAttachmentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Accepts a request to attach a VPC to a transit gateway.</p><p>The VPC attachment must be in the <code>pendingAcceptance</code> state. Use <a>DescribeTransitGatewayVpcAttachments</a> to view your pending VPC attachment requests. Use <a>RejectTransitGatewayVpcAttachment</a> to reject a VPC attachment request.</p>
 
 @param request A container for the necessary parameters to execute the AcceptTransitGatewayVpcAttachment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AcceptTransitGatewayVpcAttachmentResult`.
 
 @see AWSEC2AcceptTransitGatewayVpcAttachmentRequest
 @see AWSEC2AcceptTransitGatewayVpcAttachmentResult
 */
- (AWSTask<AWSEC2AcceptTransitGatewayVpcAttachmentResult *> *)acceptTransitGatewayVpcAttachment:(AWSEC2AcceptTransitGatewayVpcAttachmentRequest *)request;

/**
 <p>Accepts a request to attach a VPC to a transit gateway.</p><p>The VPC attachment must be in the <code>pendingAcceptance</code> state. Use <a>DescribeTransitGatewayVpcAttachments</a> to view your pending VPC attachment requests. Use <a>RejectTransitGatewayVpcAttachment</a> to reject a VPC attachment request.</p>
 
 @param request A container for the necessary parameters to execute the AcceptTransitGatewayVpcAttachment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AcceptTransitGatewayVpcAttachmentRequest
 @see AWSEC2AcceptTransitGatewayVpcAttachmentResult
 */
- (void)acceptTransitGatewayVpcAttachment:(AWSEC2AcceptTransitGatewayVpcAttachmentRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AcceptTransitGatewayVpcAttachmentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Accepts one or more interface VPC endpoint connection requests to your VPC endpoint service.</p>
 
 @param request A container for the necessary parameters to execute the AcceptVpcEndpointConnections service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AcceptVpcEndpointConnectionsResult`.
 
 @see AWSEC2AcceptVpcEndpointConnectionsRequest
 @see AWSEC2AcceptVpcEndpointConnectionsResult
 */
- (AWSTask<AWSEC2AcceptVpcEndpointConnectionsResult *> *)acceptVpcEndpointConnections:(AWSEC2AcceptVpcEndpointConnectionsRequest *)request;

/**
 <p>Accepts one or more interface VPC endpoint connection requests to your VPC endpoint service.</p>
 
 @param request A container for the necessary parameters to execute the AcceptVpcEndpointConnections service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AcceptVpcEndpointConnectionsRequest
 @see AWSEC2AcceptVpcEndpointConnectionsResult
 */
- (void)acceptVpcEndpointConnections:(AWSEC2AcceptVpcEndpointConnectionsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AcceptVpcEndpointConnectionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Accept a VPC peering connection request. To accept a request, the VPC peering connection must be in the <code>pending-acceptance</code> state, and you must be the owner of the peer VPC. Use <a>DescribeVpcPeeringConnections</a> to view your outstanding VPC peering connection requests.</p><p>For an inter-Region VPC peering connection request, you must accept the VPC peering connection in the Region of the accepter VPC.</p>
 
 @param request A container for the necessary parameters to execute the AcceptVpcPeeringConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AcceptVpcPeeringConnectionResult`.
 
 @see AWSEC2AcceptVpcPeeringConnectionRequest
 @see AWSEC2AcceptVpcPeeringConnectionResult
 */
- (AWSTask<AWSEC2AcceptVpcPeeringConnectionResult *> *)acceptVpcPeeringConnection:(AWSEC2AcceptVpcPeeringConnectionRequest *)request;

/**
 <p>Accept a VPC peering connection request. To accept a request, the VPC peering connection must be in the <code>pending-acceptance</code> state, and you must be the owner of the peer VPC. Use <a>DescribeVpcPeeringConnections</a> to view your outstanding VPC peering connection requests.</p><p>For an inter-Region VPC peering connection request, you must accept the VPC peering connection in the Region of the accepter VPC.</p>
 
 @param request A container for the necessary parameters to execute the AcceptVpcPeeringConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AcceptVpcPeeringConnectionRequest
 @see AWSEC2AcceptVpcPeeringConnectionResult
 */
- (void)acceptVpcPeeringConnection:(AWSEC2AcceptVpcPeeringConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AcceptVpcPeeringConnectionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Advertises an IPv4 or IPv6 address range that is provisioned for use with your AWS resources through bring your own IP addresses (BYOIP).</p><p>You can perform this operation at most once every 10 seconds, even if you specify different address ranges each time.</p><p>We recommend that you stop advertising the BYOIP CIDR from other locations when you advertise it from AWS. To minimize down time, you can configure your AWS resources to use an address from a BYOIP CIDR before it is advertised, and then simultaneously stop advertising it from the current location and start advertising it through AWS.</p><p>It can take a few minutes before traffic to the specified addresses starts routing to AWS because of BGP propagation delays.</p><p>To stop advertising the BYOIP CIDR, use <a>WithdrawByoipCidr</a>.</p>
 
 @param request A container for the necessary parameters to execute the AdvertiseByoipCidr service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AdvertiseByoipCidrResult`.
 
 @see AWSEC2AdvertiseByoipCidrRequest
 @see AWSEC2AdvertiseByoipCidrResult
 */
- (AWSTask<AWSEC2AdvertiseByoipCidrResult *> *)advertiseByoipCidr:(AWSEC2AdvertiseByoipCidrRequest *)request;

/**
 <p>Advertises an IPv4 or IPv6 address range that is provisioned for use with your AWS resources through bring your own IP addresses (BYOIP).</p><p>You can perform this operation at most once every 10 seconds, even if you specify different address ranges each time.</p><p>We recommend that you stop advertising the BYOIP CIDR from other locations when you advertise it from AWS. To minimize down time, you can configure your AWS resources to use an address from a BYOIP CIDR before it is advertised, and then simultaneously stop advertising it from the current location and start advertising it through AWS.</p><p>It can take a few minutes before traffic to the specified addresses starts routing to AWS because of BGP propagation delays.</p><p>To stop advertising the BYOIP CIDR, use <a>WithdrawByoipCidr</a>.</p>
 
 @param request A container for the necessary parameters to execute the AdvertiseByoipCidr service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AdvertiseByoipCidrRequest
 @see AWSEC2AdvertiseByoipCidrResult
 */
- (void)advertiseByoipCidr:(AWSEC2AdvertiseByoipCidrRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AdvertiseByoipCidrResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allocates an Elastic IP address to your AWS account. After you allocate the Elastic IP address you can associate it with an instance or network interface. After you release an Elastic IP address, it is released to the IP address pool and can be allocated to a different AWS account.</p><p>You can allocate an Elastic IP address from an address pool owned by AWS or from an address pool created from a public IPv4 address range that you have brought to AWS for use with your AWS resources using bring your own IP addresses (BYOIP). For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html">Bring Your Own IP Addresses (BYOIP)</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>[EC2-VPC] If you release an Elastic IP address, you might be able to recover it. You cannot recover an Elastic IP address that you released after it is allocated to another AWS account. You cannot recover an Elastic IP address for EC2-Classic. To attempt to recover an Elastic IP address that you released, specify it in this operation.</p><p>An Elastic IP address is for use either in the EC2-Classic platform or in a VPC. By default, you can allocate 5 Elastic IP addresses for EC2-Classic per Region and 5 Elastic IP addresses for EC2-VPC per Region.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AllocateAddress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AllocateAddressResult`.
 
 @see AWSEC2AllocateAddressRequest
 @see AWSEC2AllocateAddressResult
 */
- (AWSTask<AWSEC2AllocateAddressResult *> *)allocateAddress:(AWSEC2AllocateAddressRequest *)request;

/**
 <p>Allocates an Elastic IP address to your AWS account. After you allocate the Elastic IP address you can associate it with an instance or network interface. After you release an Elastic IP address, it is released to the IP address pool and can be allocated to a different AWS account.</p><p>You can allocate an Elastic IP address from an address pool owned by AWS or from an address pool created from a public IPv4 address range that you have brought to AWS for use with your AWS resources using bring your own IP addresses (BYOIP). For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html">Bring Your Own IP Addresses (BYOIP)</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>[EC2-VPC] If you release an Elastic IP address, you might be able to recover it. You cannot recover an Elastic IP address that you released after it is allocated to another AWS account. You cannot recover an Elastic IP address for EC2-Classic. To attempt to recover an Elastic IP address that you released, specify it in this operation.</p><p>An Elastic IP address is for use either in the EC2-Classic platform or in a VPC. By default, you can allocate 5 Elastic IP addresses for EC2-Classic per Region and 5 Elastic IP addresses for EC2-VPC per Region.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AllocateAddress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AllocateAddressRequest
 @see AWSEC2AllocateAddressResult
 */
- (void)allocateAddress:(AWSEC2AllocateAddressRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AllocateAddressResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allocates a Dedicated Host to your account. At a minimum, specify the supported instance type or instance family, the Availability Zone in which to allocate the host, and the number of hosts to allocate.</p>
 
 @param request A container for the necessary parameters to execute the AllocateHosts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AllocateHostsResult`.
 
 @see AWSEC2AllocateHostsRequest
 @see AWSEC2AllocateHostsResult
 */
- (AWSTask<AWSEC2AllocateHostsResult *> *)allocateHosts:(AWSEC2AllocateHostsRequest *)request;

/**
 <p>Allocates a Dedicated Host to your account. At a minimum, specify the supported instance type or instance family, the Availability Zone in which to allocate the host, and the number of hosts to allocate.</p>
 
 @param request A container for the necessary parameters to execute the AllocateHosts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AllocateHostsRequest
 @see AWSEC2AllocateHostsResult
 */
- (void)allocateHosts:(AWSEC2AllocateHostsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AllocateHostsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Applies a security group to the association between the target network and the Client VPN endpoint. This action replaces the existing security groups with the specified security groups.</p>
 
 @param request A container for the necessary parameters to execute the ApplySecurityGroupsToClientVpnTargetNetwork service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkResult`.
 
 @see AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkRequest
 @see AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkResult
 */
- (AWSTask<AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkResult *> *)applySecurityGroupsToClientVpnTargetNetwork:(AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkRequest *)request;

/**
 <p>Applies a security group to the association between the target network and the Client VPN endpoint. This action replaces the existing security groups with the specified security groups.</p>
 
 @param request A container for the necessary parameters to execute the ApplySecurityGroupsToClientVpnTargetNetwork service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkRequest
 @see AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkResult
 */
- (void)applySecurityGroupsToClientVpnTargetNetwork:(AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Assigns one or more IPv6 addresses to the specified network interface. You can specify one or more specific IPv6 addresses, or you can specify the number of IPv6 addresses to be automatically assigned from within the subnet's IPv6 CIDR block range. You can assign as many IPv6 addresses to a network interface as you can assign private IPv4 addresses, and the limit varies per instance type. For information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html#AvailableIpPerENI">IP Addresses Per Network Interface Per Instance Type</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>You must specify either the IPv6 addresses or the IPv6 address count in the request.</p>
 
 @param request A container for the necessary parameters to execute the AssignIpv6Addresses service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AssignIpv6AddressesResult`.
 
 @see AWSEC2AssignIpv6AddressesRequest
 @see AWSEC2AssignIpv6AddressesResult
 */
- (AWSTask<AWSEC2AssignIpv6AddressesResult *> *)assignIpv6Addresses:(AWSEC2AssignIpv6AddressesRequest *)request;

/**
 <p>Assigns one or more IPv6 addresses to the specified network interface. You can specify one or more specific IPv6 addresses, or you can specify the number of IPv6 addresses to be automatically assigned from within the subnet's IPv6 CIDR block range. You can assign as many IPv6 addresses to a network interface as you can assign private IPv4 addresses, and the limit varies per instance type. For information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html#AvailableIpPerENI">IP Addresses Per Network Interface Per Instance Type</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>You must specify either the IPv6 addresses or the IPv6 address count in the request.</p>
 
 @param request A container for the necessary parameters to execute the AssignIpv6Addresses service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AssignIpv6AddressesRequest
 @see AWSEC2AssignIpv6AddressesResult
 */
- (void)assignIpv6Addresses:(AWSEC2AssignIpv6AddressesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AssignIpv6AddressesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Assigns one or more secondary private IP addresses to the specified network interface.</p><p>You can specify one or more specific secondary IP addresses, or you can specify the number of secondary IP addresses to be automatically assigned within the subnet's CIDR block range. The number of secondary IP addresses that you can assign to an instance varies by instance type. For information about instance types, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">Instance Types</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. For more information about Elastic IP addresses, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>When you move a secondary private IP address to another network interface, any Elastic IP address that is associated with the IP address is also moved.</p><p>Remapping an IP address is an asynchronous operation. When you move an IP address from one network interface to another, check <code>network/interfaces/macs/mac/local-ipv4s</code> in the instance metadata to confirm that the remapping is complete.</p><p>You must specify either the IP addresses or the IP address count in the request.</p>
 
 @param request A container for the necessary parameters to execute the AssignPrivateIpAddresses service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AssignPrivateIpAddressesResult`.
 
 @see AWSEC2AssignPrivateIpAddressesRequest
 @see AWSEC2AssignPrivateIpAddressesResult
 */
- (AWSTask<AWSEC2AssignPrivateIpAddressesResult *> *)assignPrivateIpAddresses:(AWSEC2AssignPrivateIpAddressesRequest *)request;

/**
 <p>Assigns one or more secondary private IP addresses to the specified network interface.</p><p>You can specify one or more specific secondary IP addresses, or you can specify the number of secondary IP addresses to be automatically assigned within the subnet's CIDR block range. The number of secondary IP addresses that you can assign to an instance varies by instance type. For information about instance types, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">Instance Types</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. For more information about Elastic IP addresses, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>When you move a secondary private IP address to another network interface, any Elastic IP address that is associated with the IP address is also moved.</p><p>Remapping an IP address is an asynchronous operation. When you move an IP address from one network interface to another, check <code>network/interfaces/macs/mac/local-ipv4s</code> in the instance metadata to confirm that the remapping is complete.</p><p>You must specify either the IP addresses or the IP address count in the request.</p>
 
 @param request A container for the necessary parameters to execute the AssignPrivateIpAddresses service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AssignPrivateIpAddressesRequest
 @see AWSEC2AssignPrivateIpAddressesResult
 */
- (void)assignPrivateIpAddresses:(AWSEC2AssignPrivateIpAddressesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AssignPrivateIpAddressesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates an Elastic IP address with an instance or a network interface. Before you can use an Elastic IP address, you must allocate it to your account.</p><p>An Elastic IP address is for use in either the EC2-Classic platform or in a VPC. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>[EC2-Classic, VPC in an EC2-VPC-only account] If the Elastic IP address is already associated with a different instance, it is disassociated from that instance and associated with the specified instance. If you associate an Elastic IP address with an instance that has an existing Elastic IP address, the existing address is disassociated from the instance, but remains allocated to your account.</p><p>[VPC in an EC2-Classic account] If you don't specify a private IP address, the Elastic IP address is associated with the primary IP address. If the Elastic IP address is already associated with a different instance or a network interface, you get an error unless you allow reassociation. You cannot associate an Elastic IP address with an instance or network interface that has an existing Elastic IP address.</p><p>You cannot associate an Elastic IP address with an interface in a different network border group.</p><important><p>This is an idempotent operation. If you perform the operation more than once, Amazon EC2 doesn't return an error, and you may be charged for each time the Elastic IP address is remapped to the same instance. For more information, see the <i>Elastic IP Addresses</i> section of <a href="http://aws.amazon.com/ec2/pricing/">Amazon EC2 Pricing</a>.</p></important>
 
 @param request A container for the necessary parameters to execute the AssociateAddress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AssociateAddressResult`.
 
 @see AWSEC2AssociateAddressRequest
 @see AWSEC2AssociateAddressResult
 */
- (AWSTask<AWSEC2AssociateAddressResult *> *)associateAddress:(AWSEC2AssociateAddressRequest *)request;

/**
 <p>Associates an Elastic IP address with an instance or a network interface. Before you can use an Elastic IP address, you must allocate it to your account.</p><p>An Elastic IP address is for use in either the EC2-Classic platform or in a VPC. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>[EC2-Classic, VPC in an EC2-VPC-only account] If the Elastic IP address is already associated with a different instance, it is disassociated from that instance and associated with the specified instance. If you associate an Elastic IP address with an instance that has an existing Elastic IP address, the existing address is disassociated from the instance, but remains allocated to your account.</p><p>[VPC in an EC2-Classic account] If you don't specify a private IP address, the Elastic IP address is associated with the primary IP address. If the Elastic IP address is already associated with a different instance or a network interface, you get an error unless you allow reassociation. You cannot associate an Elastic IP address with an instance or network interface that has an existing Elastic IP address.</p><p>You cannot associate an Elastic IP address with an interface in a different network border group.</p><important><p>This is an idempotent operation. If you perform the operation more than once, Amazon EC2 doesn't return an error, and you may be charged for each time the Elastic IP address is remapped to the same instance. For more information, see the <i>Elastic IP Addresses</i> section of <a href="http://aws.amazon.com/ec2/pricing/">Amazon EC2 Pricing</a>.</p></important>
 
 @param request A container for the necessary parameters to execute the AssociateAddress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AssociateAddressRequest
 @see AWSEC2AssociateAddressResult
 */
- (void)associateAddress:(AWSEC2AssociateAddressRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AssociateAddressResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates a target network with a Client VPN endpoint. A target network is a subnet in a VPC. You can associate multiple subnets from the same VPC with a Client VPN endpoint. You can associate only one subnet in each Availability Zone. We recommend that you associate at least two subnets to provide Availability Zone redundancy.</p><p>If you specified a VPC when you created the Client VPN endpoint or if you have previous subnet associations, the specified subnet must be in the same VPC. To specify a subnet that's in a different VPC, you must first modify the Client VPN endpoint (<a>ModifyClientVpnEndpoint</a>) and change the VPC that's associated with it.</p>
 
 @param request A container for the necessary parameters to execute the AssociateClientVpnTargetNetwork service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AssociateClientVpnTargetNetworkResult`.
 
 @see AWSEC2AssociateClientVpnTargetNetworkRequest
 @see AWSEC2AssociateClientVpnTargetNetworkResult
 */
- (AWSTask<AWSEC2AssociateClientVpnTargetNetworkResult *> *)associateClientVpnTargetNetwork:(AWSEC2AssociateClientVpnTargetNetworkRequest *)request;

/**
 <p>Associates a target network with a Client VPN endpoint. A target network is a subnet in a VPC. You can associate multiple subnets from the same VPC with a Client VPN endpoint. You can associate only one subnet in each Availability Zone. We recommend that you associate at least two subnets to provide Availability Zone redundancy.</p><p>If you specified a VPC when you created the Client VPN endpoint or if you have previous subnet associations, the specified subnet must be in the same VPC. To specify a subnet that's in a different VPC, you must first modify the Client VPN endpoint (<a>ModifyClientVpnEndpoint</a>) and change the VPC that's associated with it.</p>
 
 @param request A container for the necessary parameters to execute the AssociateClientVpnTargetNetwork service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AssociateClientVpnTargetNetworkRequest
 @see AWSEC2AssociateClientVpnTargetNetworkResult
 */
- (void)associateClientVpnTargetNetwork:(AWSEC2AssociateClientVpnTargetNetworkRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AssociateClientVpnTargetNetworkResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates a set of DHCP options (that you've previously created) with the specified VPC, or associates no DHCP options with the VPC.</p><p>After you associate the options with the VPC, any existing instances and all new instances that you launch in that VPC use the options. You don't need to restart or relaunch the instances. They automatically pick up the changes within a few hours, depending on how frequently the instance renews its DHCP lease. You can explicitly renew the lease using the operating system on the instance.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_DHCP_Options.html">DHCP Options Sets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AssociateDhcpOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2AssociateDhcpOptionsRequest
 */
- (AWSTask *)associateDhcpOptions:(AWSEC2AssociateDhcpOptionsRequest *)request;

/**
 <p>Associates a set of DHCP options (that you've previously created) with the specified VPC, or associates no DHCP options with the VPC.</p><p>After you associate the options with the VPC, any existing instances and all new instances that you launch in that VPC use the options. You don't need to restart or relaunch the instances. They automatically pick up the changes within a few hours, depending on how frequently the instance renews its DHCP lease. You can explicitly renew the lease using the operating system on the instance.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_DHCP_Options.html">DHCP Options Sets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AssociateDhcpOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AssociateDhcpOptionsRequest
 */
- (void)associateDhcpOptions:(AWSEC2AssociateDhcpOptionsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Associates an IAM instance profile with a running or stopped instance. You cannot associate more than one IAM instance profile with an instance.</p>
 
 @param request A container for the necessary parameters to execute the AssociateIamInstanceProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AssociateIamInstanceProfileResult`.
 
 @see AWSEC2AssociateIamInstanceProfileRequest
 @see AWSEC2AssociateIamInstanceProfileResult
 */
- (AWSTask<AWSEC2AssociateIamInstanceProfileResult *> *)associateIamInstanceProfile:(AWSEC2AssociateIamInstanceProfileRequest *)request;

/**
 <p>Associates an IAM instance profile with a running or stopped instance. You cannot associate more than one IAM instance profile with an instance.</p>
 
 @param request A container for the necessary parameters to execute the AssociateIamInstanceProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AssociateIamInstanceProfileRequest
 @see AWSEC2AssociateIamInstanceProfileResult
 */
- (void)associateIamInstanceProfile:(AWSEC2AssociateIamInstanceProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AssociateIamInstanceProfileResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates a subnet in your VPC or an internet gateway or virtual private gateway attached to your VPC with a route table in your VPC. This association causes traffic from the subnet or gateway to be routed according to the routes in the route table. The action returns an association ID, which you need in order to disassociate the route table later. A route table can be associated with multiple subnets.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AssociateRouteTable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AssociateRouteTableResult`.
 
 @see AWSEC2AssociateRouteTableRequest
 @see AWSEC2AssociateRouteTableResult
 */
- (AWSTask<AWSEC2AssociateRouteTableResult *> *)associateRouteTable:(AWSEC2AssociateRouteTableRequest *)request;

/**
 <p>Associates a subnet in your VPC or an internet gateway or virtual private gateway attached to your VPC with a route table in your VPC. This association causes traffic from the subnet or gateway to be routed according to the routes in the route table. The action returns an association ID, which you need in order to disassociate the route table later. A route table can be associated with multiple subnets.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AssociateRouteTable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AssociateRouteTableRequest
 @see AWSEC2AssociateRouteTableResult
 */
- (void)associateRouteTable:(AWSEC2AssociateRouteTableRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AssociateRouteTableResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates a CIDR block with your subnet. You can only associate a single IPv6 CIDR block with your subnet. An IPv6 CIDR block must have a prefix length of /64.</p>
 
 @param request A container for the necessary parameters to execute the AssociateSubnetCidrBlock service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AssociateSubnetCidrBlockResult`.
 
 @see AWSEC2AssociateSubnetCidrBlockRequest
 @see AWSEC2AssociateSubnetCidrBlockResult
 */
- (AWSTask<AWSEC2AssociateSubnetCidrBlockResult *> *)associateSubnetCidrBlock:(AWSEC2AssociateSubnetCidrBlockRequest *)request;

/**
 <p>Associates a CIDR block with your subnet. You can only associate a single IPv6 CIDR block with your subnet. An IPv6 CIDR block must have a prefix length of /64.</p>
 
 @param request A container for the necessary parameters to execute the AssociateSubnetCidrBlock service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AssociateSubnetCidrBlockRequest
 @see AWSEC2AssociateSubnetCidrBlockResult
 */
- (void)associateSubnetCidrBlock:(AWSEC2AssociateSubnetCidrBlockRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AssociateSubnetCidrBlockResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates the specified subnets and transit gateway attachments with the specified transit gateway multicast domain.</p><p>The transit gateway attachment must be in the available state before you can add a resource. Use <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeTransitGatewayAttachments.html">DescribeTransitGatewayAttachments</a> to see the state of the attachment.</p>
 
 @param request A container for the necessary parameters to execute the AssociateTransitGatewayMulticastDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AssociateTransitGatewayMulticastDomainResult`.
 
 @see AWSEC2AssociateTransitGatewayMulticastDomainRequest
 @see AWSEC2AssociateTransitGatewayMulticastDomainResult
 */
- (AWSTask<AWSEC2AssociateTransitGatewayMulticastDomainResult *> *)associateTransitGatewayMulticastDomain:(AWSEC2AssociateTransitGatewayMulticastDomainRequest *)request;

/**
 <p>Associates the specified subnets and transit gateway attachments with the specified transit gateway multicast domain.</p><p>The transit gateway attachment must be in the available state before you can add a resource. Use <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeTransitGatewayAttachments.html">DescribeTransitGatewayAttachments</a> to see the state of the attachment.</p>
 
 @param request A container for the necessary parameters to execute the AssociateTransitGatewayMulticastDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AssociateTransitGatewayMulticastDomainRequest
 @see AWSEC2AssociateTransitGatewayMulticastDomainResult
 */
- (void)associateTransitGatewayMulticastDomain:(AWSEC2AssociateTransitGatewayMulticastDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AssociateTransitGatewayMulticastDomainResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates the specified attachment with the specified transit gateway route table. You can associate only one route table with an attachment.</p>
 
 @param request A container for the necessary parameters to execute the AssociateTransitGatewayRouteTable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AssociateTransitGatewayRouteTableResult`.
 
 @see AWSEC2AssociateTransitGatewayRouteTableRequest
 @see AWSEC2AssociateTransitGatewayRouteTableResult
 */
- (AWSTask<AWSEC2AssociateTransitGatewayRouteTableResult *> *)associateTransitGatewayRouteTable:(AWSEC2AssociateTransitGatewayRouteTableRequest *)request;

/**
 <p>Associates the specified attachment with the specified transit gateway route table. You can associate only one route table with an attachment.</p>
 
 @param request A container for the necessary parameters to execute the AssociateTransitGatewayRouteTable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AssociateTransitGatewayRouteTableRequest
 @see AWSEC2AssociateTransitGatewayRouteTableResult
 */
- (void)associateTransitGatewayRouteTable:(AWSEC2AssociateTransitGatewayRouteTableRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AssociateTransitGatewayRouteTableResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates a CIDR block with your VPC. You can associate a secondary IPv4 CIDR block, an Amazon-provided IPv6 CIDR block, or an IPv6 CIDR block from an IPv6 address pool that you provisioned through bring your own IP addresses (<a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html">BYOIP</a>). The IPv6 CIDR block size is fixed at /56.</p><p>You must specify one of the following in the request: an IPv4 CIDR block, an IPv6 pool, or an Amazon-provided IPv6 CIDR block.</p><p>For more information about associating CIDR blocks with your VPC and applicable restrictions, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html#VPC_Sizing">VPC and Subnet Sizing</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AssociateVpcCidrBlock service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AssociateVpcCidrBlockResult`.
 
 @see AWSEC2AssociateVpcCidrBlockRequest
 @see AWSEC2AssociateVpcCidrBlockResult
 */
- (AWSTask<AWSEC2AssociateVpcCidrBlockResult *> *)associateVpcCidrBlock:(AWSEC2AssociateVpcCidrBlockRequest *)request;

/**
 <p>Associates a CIDR block with your VPC. You can associate a secondary IPv4 CIDR block, an Amazon-provided IPv6 CIDR block, or an IPv6 CIDR block from an IPv6 address pool that you provisioned through bring your own IP addresses (<a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html">BYOIP</a>). The IPv6 CIDR block size is fixed at /56.</p><p>You must specify one of the following in the request: an IPv4 CIDR block, an IPv6 pool, or an Amazon-provided IPv6 CIDR block.</p><p>For more information about associating CIDR blocks with your VPC and applicable restrictions, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html#VPC_Sizing">VPC and Subnet Sizing</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AssociateVpcCidrBlock service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AssociateVpcCidrBlockRequest
 @see AWSEC2AssociateVpcCidrBlockResult
 */
- (void)associateVpcCidrBlock:(AWSEC2AssociateVpcCidrBlockRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AssociateVpcCidrBlockResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Links an EC2-Classic instance to a ClassicLink-enabled VPC through one or more of the VPC's security groups. You cannot link an EC2-Classic instance to more than one VPC at a time. You can only link an instance that's in the <code>running</code> state. An instance is automatically unlinked from a VPC when it's stopped - you can link it to the VPC again when you restart it.</p><p>After you've linked an instance, you cannot change the VPC security groups that are associated with it. To change the security groups, you must first unlink the instance, and then link it again.</p><p>Linking your instance to a VPC is sometimes referred to as <i>attaching</i> your instance.</p>
 
 @param request A container for the necessary parameters to execute the AttachClassicLinkVpc service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AttachClassicLinkVpcResult`.
 
 @see AWSEC2AttachClassicLinkVpcRequest
 @see AWSEC2AttachClassicLinkVpcResult
 */
- (AWSTask<AWSEC2AttachClassicLinkVpcResult *> *)attachClassicLinkVpc:(AWSEC2AttachClassicLinkVpcRequest *)request;

/**
 <p>Links an EC2-Classic instance to a ClassicLink-enabled VPC through one or more of the VPC's security groups. You cannot link an EC2-Classic instance to more than one VPC at a time. You can only link an instance that's in the <code>running</code> state. An instance is automatically unlinked from a VPC when it's stopped - you can link it to the VPC again when you restart it.</p><p>After you've linked an instance, you cannot change the VPC security groups that are associated with it. To change the security groups, you must first unlink the instance, and then link it again.</p><p>Linking your instance to a VPC is sometimes referred to as <i>attaching</i> your instance.</p>
 
 @param request A container for the necessary parameters to execute the AttachClassicLinkVpc service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AttachClassicLinkVpcRequest
 @see AWSEC2AttachClassicLinkVpcResult
 */
- (void)attachClassicLinkVpc:(AWSEC2AttachClassicLinkVpcRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AttachClassicLinkVpcResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attaches an internet gateway or a virtual private gateway to a VPC, enabling connectivity between the internet and the VPC. For more information about your VPC and internet gateway, see the <a href="https://docs.aws.amazon.com/vpc/latest/userguide/">Amazon Virtual Private Cloud User Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the AttachInternetGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2AttachInternetGatewayRequest
 */
- (AWSTask *)attachInternetGateway:(AWSEC2AttachInternetGatewayRequest *)request;

/**
 <p>Attaches an internet gateway or a virtual private gateway to a VPC, enabling connectivity between the internet and the VPC. For more information about your VPC and internet gateway, see the <a href="https://docs.aws.amazon.com/vpc/latest/userguide/">Amazon Virtual Private Cloud User Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the AttachInternetGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AttachInternetGatewayRequest
 */
- (void)attachInternetGateway:(AWSEC2AttachInternetGatewayRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Attaches a network interface to an instance.</p>
 
 @param request A container for the necessary parameters to execute the AttachNetworkInterface service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AttachNetworkInterfaceResult`.
 
 @see AWSEC2AttachNetworkInterfaceRequest
 @see AWSEC2AttachNetworkInterfaceResult
 */
- (AWSTask<AWSEC2AttachNetworkInterfaceResult *> *)attachNetworkInterface:(AWSEC2AttachNetworkInterfaceRequest *)request;

/**
 <p>Attaches a network interface to an instance.</p>
 
 @param request A container for the necessary parameters to execute the AttachNetworkInterface service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AttachNetworkInterfaceRequest
 @see AWSEC2AttachNetworkInterfaceResult
 */
- (void)attachNetworkInterface:(AWSEC2AttachNetworkInterfaceRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AttachNetworkInterfaceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attaches an EBS volume to a running or stopped instance and exposes it to the instance with the specified device name.</p><p>Encrypted EBS volumes must be attached to instances that support Amazon EBS encryption. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>After you attach an EBS volume, you must make it available. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-using-volumes.html">Making an EBS Volume Available For Use</a>.</p><p>If a volume has an AWS Marketplace product code:</p><ul><li><p>The volume can be attached only to a stopped instance.</p></li><li><p>AWS Marketplace product codes are copied from the volume to the instance.</p></li><li><p>You must be subscribed to the product.</p></li><li><p>The instance type and operating system of the instance must support the product. For example, you can't detach a volume from a Windows instance and attach it to a Linux instance.</p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-attaching-volume.html">Attaching Amazon EBS Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AttachVolume service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2VolumeAttachment`.
 
 @see AWSEC2AttachVolumeRequest
 @see AWSEC2VolumeAttachment
 */
- (AWSTask<AWSEC2VolumeAttachment *> *)attachVolume:(AWSEC2AttachVolumeRequest *)request;

/**
 <p>Attaches an EBS volume to a running or stopped instance and exposes it to the instance with the specified device name.</p><p>Encrypted EBS volumes must be attached to instances that support Amazon EBS encryption. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>After you attach an EBS volume, you must make it available. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-using-volumes.html">Making an EBS Volume Available For Use</a>.</p><p>If a volume has an AWS Marketplace product code:</p><ul><li><p>The volume can be attached only to a stopped instance.</p></li><li><p>AWS Marketplace product codes are copied from the volume to the instance.</p></li><li><p>You must be subscribed to the product.</p></li><li><p>The instance type and operating system of the instance must support the product. For example, you can't detach a volume from a Windows instance and attach it to a Linux instance.</p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-attaching-volume.html">Attaching Amazon EBS Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AttachVolume service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AttachVolumeRequest
 @see AWSEC2VolumeAttachment
 */
- (void)attachVolume:(AWSEC2AttachVolumeRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2VolumeAttachment * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attaches a virtual private gateway to a VPC. You can attach one virtual private gateway to one VPC at a time.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html">AWS Site-to-Site VPN</a> in the <i>AWS Site-to-Site VPN User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AttachVpnGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AttachVpnGatewayResult`.
 
 @see AWSEC2AttachVpnGatewayRequest
 @see AWSEC2AttachVpnGatewayResult
 */
- (AWSTask<AWSEC2AttachVpnGatewayResult *> *)attachVpnGateway:(AWSEC2AttachVpnGatewayRequest *)request;

/**
 <p>Attaches a virtual private gateway to a VPC. You can attach one virtual private gateway to one VPC at a time.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html">AWS Site-to-Site VPN</a> in the <i>AWS Site-to-Site VPN User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AttachVpnGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AttachVpnGatewayRequest
 @see AWSEC2AttachVpnGatewayResult
 */
- (void)attachVpnGateway:(AWSEC2AttachVpnGatewayRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AttachVpnGatewayResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds an ingress authorization rule to a Client VPN endpoint. Ingress authorization rules act as firewall rules that grant access to networks. You must configure ingress authorization rules to enable clients to access resources in AWS or on-premises networks.</p>
 
 @param request A container for the necessary parameters to execute the AuthorizeClientVpnIngress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AuthorizeClientVpnIngressResult`.
 
 @see AWSEC2AuthorizeClientVpnIngressRequest
 @see AWSEC2AuthorizeClientVpnIngressResult
 */
- (AWSTask<AWSEC2AuthorizeClientVpnIngressResult *> *)authorizeClientVpnIngress:(AWSEC2AuthorizeClientVpnIngressRequest *)request;

/**
 <p>Adds an ingress authorization rule to a Client VPN endpoint. Ingress authorization rules act as firewall rules that grant access to networks. You must configure ingress authorization rules to enable clients to access resources in AWS or on-premises networks.</p>
 
 @param request A container for the necessary parameters to execute the AuthorizeClientVpnIngress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AuthorizeClientVpnIngressRequest
 @see AWSEC2AuthorizeClientVpnIngressResult
 */
- (void)authorizeClientVpnIngress:(AWSEC2AuthorizeClientVpnIngressRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AuthorizeClientVpnIngressResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>[VPC only] Adds the specified egress rules to a security group for use with a VPC.</p><p>An outbound rule permits instances to send traffic to the specified IPv4 or IPv6 CIDR address ranges, or to the instances associated with the specified destination security groups.</p><p>You specify a protocol for each rule (for example, TCP). For the TCP and UDP protocols, you must also specify the destination port or port range. For the ICMP protocol, you must also specify the ICMP type and code. You can use -1 for the type or code to mean all types or all codes.</p><p>Rule changes are propagated to affected instances as quickly as possible. However, a small delay might occur.</p><p>For more information about VPC security group limits, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html">Amazon VPC Limits</a>.</p>
 
 @param request A container for the necessary parameters to execute the AuthorizeSecurityGroupEgress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2AuthorizeSecurityGroupEgressRequest
 */
- (AWSTask *)authorizeSecurityGroupEgress:(AWSEC2AuthorizeSecurityGroupEgressRequest *)request;

/**
 <p>[VPC only] Adds the specified egress rules to a security group for use with a VPC.</p><p>An outbound rule permits instances to send traffic to the specified IPv4 or IPv6 CIDR address ranges, or to the instances associated with the specified destination security groups.</p><p>You specify a protocol for each rule (for example, TCP). For the TCP and UDP protocols, you must also specify the destination port or port range. For the ICMP protocol, you must also specify the ICMP type and code. You can use -1 for the type or code to mean all types or all codes.</p><p>Rule changes are propagated to affected instances as quickly as possible. However, a small delay might occur.</p><p>For more information about VPC security group limits, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html">Amazon VPC Limits</a>.</p>
 
 @param request A container for the necessary parameters to execute the AuthorizeSecurityGroupEgress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AuthorizeSecurityGroupEgressRequest
 */
- (void)authorizeSecurityGroupEgress:(AWSEC2AuthorizeSecurityGroupEgressRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Adds the specified ingress rules to a security group.</p><p>An inbound rule permits instances to receive traffic from the specified IPv4 or IPv6 CIDR address ranges, or from the instances associated with the specified destination security groups.</p><p>You specify a protocol for each rule (for example, TCP). For TCP and UDP, you must also specify the destination port or port range. For ICMP/ICMPv6, you must also specify the ICMP/ICMPv6 type and code. You can use -1 to mean all types or all codes.</p><p>Rule changes are propagated to instances within the security group as quickly as possible. However, a small delay might occur.</p><p>For more information about VPC security group limits, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html">Amazon VPC Limits</a>.</p>
 
 @param request A container for the necessary parameters to execute the AuthorizeSecurityGroupIngress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2AuthorizeSecurityGroupIngressRequest
 */
- (AWSTask *)authorizeSecurityGroupIngress:(AWSEC2AuthorizeSecurityGroupIngressRequest *)request;

/**
 <p>Adds the specified ingress rules to a security group.</p><p>An inbound rule permits instances to receive traffic from the specified IPv4 or IPv6 CIDR address ranges, or from the instances associated with the specified destination security groups.</p><p>You specify a protocol for each rule (for example, TCP). For TCP and UDP, you must also specify the destination port or port range. For ICMP/ICMPv6, you must also specify the ICMP/ICMPv6 type and code. You can use -1 to mean all types or all codes.</p><p>Rule changes are propagated to instances within the security group as quickly as possible. However, a small delay might occur.</p><p>For more information about VPC security group limits, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html">Amazon VPC Limits</a>.</p>
 
 @param request A container for the necessary parameters to execute the AuthorizeSecurityGroupIngress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AuthorizeSecurityGroupIngressRequest
 */
- (void)authorizeSecurityGroupIngress:(AWSEC2AuthorizeSecurityGroupIngressRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Bundles an Amazon instance store-backed Windows instance.</p><p>During bundling, only the root device volume (C:\) is bundled. Data on other instance store volumes is not preserved.</p><note><p>This action is not applicable for Linux/Unix instances or Windows instances that are backed by Amazon EBS.</p></note>
 
 @param request A container for the necessary parameters to execute the BundleInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2BundleInstanceResult`.
 
 @see AWSEC2BundleInstanceRequest
 @see AWSEC2BundleInstanceResult
 */
- (AWSTask<AWSEC2BundleInstanceResult *> *)bundleInstance:(AWSEC2BundleInstanceRequest *)request;

/**
 <p>Bundles an Amazon instance store-backed Windows instance.</p><p>During bundling, only the root device volume (C:\) is bundled. Data on other instance store volumes is not preserved.</p><note><p>This action is not applicable for Linux/Unix instances or Windows instances that are backed by Amazon EBS.</p></note>
 
 @param request A container for the necessary parameters to execute the BundleInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2BundleInstanceRequest
 @see AWSEC2BundleInstanceResult
 */
- (void)bundleInstance:(AWSEC2BundleInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2BundleInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels a bundling operation for an instance store-backed Windows instance.</p>
 
 @param request A container for the necessary parameters to execute the CancelBundleTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CancelBundleTaskResult`.
 
 @see AWSEC2CancelBundleTaskRequest
 @see AWSEC2CancelBundleTaskResult
 */
- (AWSTask<AWSEC2CancelBundleTaskResult *> *)cancelBundleTask:(AWSEC2CancelBundleTaskRequest *)request;

/**
 <p>Cancels a bundling operation for an instance store-backed Windows instance.</p>
 
 @param request A container for the necessary parameters to execute the CancelBundleTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CancelBundleTaskRequest
 @see AWSEC2CancelBundleTaskResult
 */
- (void)cancelBundleTask:(AWSEC2CancelBundleTaskRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CancelBundleTaskResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels the specified Capacity Reservation, releases the reserved capacity, and changes the Capacity Reservation's state to <code>cancelled</code>.</p><p>Instances running in the reserved capacity continue running until you stop them. Stopped instances that target the Capacity Reservation can no longer launch. Modify these instances to either target a different Capacity Reservation, launch On-Demand Instance capacity, or run in any open Capacity Reservation that has matching attributes and sufficient capacity.</p>
 
 @param request A container for the necessary parameters to execute the CancelCapacityReservation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CancelCapacityReservationResult`.
 
 @see AWSEC2CancelCapacityReservationRequest
 @see AWSEC2CancelCapacityReservationResult
 */
- (AWSTask<AWSEC2CancelCapacityReservationResult *> *)cancelCapacityReservation:(AWSEC2CancelCapacityReservationRequest *)request;

/**
 <p>Cancels the specified Capacity Reservation, releases the reserved capacity, and changes the Capacity Reservation's state to <code>cancelled</code>.</p><p>Instances running in the reserved capacity continue running until you stop them. Stopped instances that target the Capacity Reservation can no longer launch. Modify these instances to either target a different Capacity Reservation, launch On-Demand Instance capacity, or run in any open Capacity Reservation that has matching attributes and sufficient capacity.</p>
 
 @param request A container for the necessary parameters to execute the CancelCapacityReservation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CancelCapacityReservationRequest
 @see AWSEC2CancelCapacityReservationResult
 */
- (void)cancelCapacityReservation:(AWSEC2CancelCapacityReservationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CancelCapacityReservationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels an active conversion task. The task can be the import of an instance or volume. The action removes all artifacts of the conversion, including a partially uploaded volume or instance. If the conversion is complete or is in the process of transferring the final disk image, the command fails and returns an exception.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/ec2-cli-vmimport-export.html">Importing a Virtual Machine Using the Amazon EC2 CLI</a>.</p>
 
 @param request A container for the necessary parameters to execute the CancelConversionTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2CancelConversionRequest
 */
- (AWSTask *)cancelConversionTask:(AWSEC2CancelConversionRequest *)request;

/**
 <p>Cancels an active conversion task. The task can be the import of an instance or volume. The action removes all artifacts of the conversion, including a partially uploaded volume or instance. If the conversion is complete or is in the process of transferring the final disk image, the command fails and returns an exception.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/ec2-cli-vmimport-export.html">Importing a Virtual Machine Using the Amazon EC2 CLI</a>.</p>
 
 @param request A container for the necessary parameters to execute the CancelConversionTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CancelConversionRequest
 */
- (void)cancelConversionTask:(AWSEC2CancelConversionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Cancels an active export task. The request removes all artifacts of the export, including any partially-created Amazon S3 objects. If the export task is complete or is in the process of transferring the final disk image, the command fails and returns an error.</p>
 
 @param request A container for the necessary parameters to execute the CancelExportTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2CancelExportTaskRequest
 */
- (AWSTask *)cancelExportTask:(AWSEC2CancelExportTaskRequest *)request;

/**
 <p>Cancels an active export task. The request removes all artifacts of the export, including any partially-created Amazon S3 objects. If the export task is complete or is in the process of transferring the final disk image, the command fails and returns an error.</p>
 
 @param request A container for the necessary parameters to execute the CancelExportTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CancelExportTaskRequest
 */
- (void)cancelExportTask:(AWSEC2CancelExportTaskRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Cancels an in-process import virtual machine or import snapshot task.</p>
 
 @param request A container for the necessary parameters to execute the CancelImportTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CancelImportTaskResult`.
 
 @see AWSEC2CancelImportTaskRequest
 @see AWSEC2CancelImportTaskResult
 */
- (AWSTask<AWSEC2CancelImportTaskResult *> *)cancelImportTask:(AWSEC2CancelImportTaskRequest *)request;

/**
 <p>Cancels an in-process import virtual machine or import snapshot task.</p>
 
 @param request A container for the necessary parameters to execute the CancelImportTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CancelImportTaskRequest
 @see AWSEC2CancelImportTaskResult
 */
- (void)cancelImportTask:(AWSEC2CancelImportTaskRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CancelImportTaskResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels the specified Reserved Instance listing in the Reserved Instance Marketplace.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CancelReservedInstancesListing service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CancelReservedInstancesListingResult`.
 
 @see AWSEC2CancelReservedInstancesListingRequest
 @see AWSEC2CancelReservedInstancesListingResult
 */
- (AWSTask<AWSEC2CancelReservedInstancesListingResult *> *)cancelReservedInstancesListing:(AWSEC2CancelReservedInstancesListingRequest *)request;

/**
 <p>Cancels the specified Reserved Instance listing in the Reserved Instance Marketplace.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CancelReservedInstancesListing service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CancelReservedInstancesListingRequest
 @see AWSEC2CancelReservedInstancesListingResult
 */
- (void)cancelReservedInstancesListing:(AWSEC2CancelReservedInstancesListingRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CancelReservedInstancesListingResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels the specified Spot Fleet requests.</p><p>After you cancel a Spot Fleet request, the Spot Fleet launches no new Spot Instances. You must specify whether the Spot Fleet should also terminate its Spot Instances. If you terminate the instances, the Spot Fleet request enters the <code>cancelled_terminating</code> state. Otherwise, the Spot Fleet request enters the <code>cancelled_running</code> state and the instances continue to run until they are interrupted or you terminate them manually.</p>
 
 @param request A container for the necessary parameters to execute the CancelSpotFleetRequests service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CancelSpotFleetRequestsResponse`.
 
 @see AWSEC2CancelSpotFleetRequestsRequest
 @see AWSEC2CancelSpotFleetRequestsResponse
 */
- (AWSTask<AWSEC2CancelSpotFleetRequestsResponse *> *)cancelSpotFleetRequests:(AWSEC2CancelSpotFleetRequestsRequest *)request;

/**
 <p>Cancels the specified Spot Fleet requests.</p><p>After you cancel a Spot Fleet request, the Spot Fleet launches no new Spot Instances. You must specify whether the Spot Fleet should also terminate its Spot Instances. If you terminate the instances, the Spot Fleet request enters the <code>cancelled_terminating</code> state. Otherwise, the Spot Fleet request enters the <code>cancelled_running</code> state and the instances continue to run until they are interrupted or you terminate them manually.</p>
 
 @param request A container for the necessary parameters to execute the CancelSpotFleetRequests service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CancelSpotFleetRequestsRequest
 @see AWSEC2CancelSpotFleetRequestsResponse
 */
- (void)cancelSpotFleetRequests:(AWSEC2CancelSpotFleetRequestsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CancelSpotFleetRequestsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels one or more Spot Instance requests.</p><important><p>Canceling a Spot Instance request does not terminate running Spot Instances associated with the request.</p></important>
 
 @param request A container for the necessary parameters to execute the CancelSpotInstanceRequests service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CancelSpotInstanceRequestsResult`.
 
 @see AWSEC2CancelSpotInstanceRequestsRequest
 @see AWSEC2CancelSpotInstanceRequestsResult
 */
- (AWSTask<AWSEC2CancelSpotInstanceRequestsResult *> *)cancelSpotInstanceRequests:(AWSEC2CancelSpotInstanceRequestsRequest *)request;

/**
 <p>Cancels one or more Spot Instance requests.</p><important><p>Canceling a Spot Instance request does not terminate running Spot Instances associated with the request.</p></important>
 
 @param request A container for the necessary parameters to execute the CancelSpotInstanceRequests service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CancelSpotInstanceRequestsRequest
 @see AWSEC2CancelSpotInstanceRequestsResult
 */
- (void)cancelSpotInstanceRequests:(AWSEC2CancelSpotInstanceRequestsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CancelSpotInstanceRequestsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Determines whether a product code is associated with an instance. This action can only be used by the owner of the product code. It is useful when a product code owner must verify whether another user's instance is eligible for support.</p>
 
 @param request A container for the necessary parameters to execute the ConfirmProductInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ConfirmProductInstanceResult`.
 
 @see AWSEC2ConfirmProductInstanceRequest
 @see AWSEC2ConfirmProductInstanceResult
 */
- (AWSTask<AWSEC2ConfirmProductInstanceResult *> *)confirmProductInstance:(AWSEC2ConfirmProductInstanceRequest *)request;

/**
 <p>Determines whether a product code is associated with an instance. This action can only be used by the owner of the product code. It is useful when a product code owner must verify whether another user's instance is eligible for support.</p>
 
 @param request A container for the necessary parameters to execute the ConfirmProductInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ConfirmProductInstanceRequest
 @see AWSEC2ConfirmProductInstanceResult
 */
- (void)confirmProductInstance:(AWSEC2ConfirmProductInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ConfirmProductInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Copies the specified Amazon FPGA Image (AFI) to the current Region.</p>
 
 @param request A container for the necessary parameters to execute the CopyFpgaImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ReplicateFpgaImageResult`.
 
 @see AWSEC2ReplicateFpgaImageRequest
 @see AWSEC2ReplicateFpgaImageResult
 */
- (AWSTask<AWSEC2ReplicateFpgaImageResult *> *)replicateFpgaImage:(AWSEC2ReplicateFpgaImageRequest *)request;

/**
 <p>Copies the specified Amazon FPGA Image (AFI) to the current Region.</p>
 
 @param request A container for the necessary parameters to execute the CopyFpgaImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ReplicateFpgaImageRequest
 @see AWSEC2ReplicateFpgaImageResult
 */
- (void)replicateFpgaImage:(AWSEC2ReplicateFpgaImageRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ReplicateFpgaImageResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates the copy of an AMI from the specified source Region to the current Region. You specify the destination Region by using its endpoint when making the request.</p><p>Copies of encrypted backing snapshots for the AMI are encrypted. Copies of unencrypted backing snapshots remain unencrypted, unless you set <code>Encrypted</code> during the copy operation. You cannot create an unencrypted copy of an encrypted backing snapshot.</p><p>For more information about the prerequisites and limits when copying an AMI, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/CopyingAMIs.html">Copying an AMI</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CopyImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ReplicateImageResult`.
 
 @see AWSEC2ReplicateImageRequest
 @see AWSEC2ReplicateImageResult
 */
- (AWSTask<AWSEC2ReplicateImageResult *> *)replicateImage:(AWSEC2ReplicateImageRequest *)request;

/**
 <p>Initiates the copy of an AMI from the specified source Region to the current Region. You specify the destination Region by using its endpoint when making the request.</p><p>Copies of encrypted backing snapshots for the AMI are encrypted. Copies of unencrypted backing snapshots remain unencrypted, unless you set <code>Encrypted</code> during the copy operation. You cannot create an unencrypted copy of an encrypted backing snapshot.</p><p>For more information about the prerequisites and limits when copying an AMI, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/CopyingAMIs.html">Copying an AMI</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CopyImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ReplicateImageRequest
 @see AWSEC2ReplicateImageResult
 */
- (void)replicateImage:(AWSEC2ReplicateImageRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ReplicateImageResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Copies a point-in-time snapshot of an EBS volume and stores it in Amazon S3. You can copy the snapshot within the same Region or from one Region to another. You can use the snapshot to create EBS volumes or Amazon Machine Images (AMIs).</p><p>Copies of encrypted EBS snapshots remain encrypted. Copies of unencrypted snapshots remain unencrypted, unless you enable encryption for the snapshot copy operation. By default, encrypted snapshot copies use the default AWS Key Management Service (AWS KMS) customer master key (CMK); however, you can specify a different CMK.</p><p>To copy an encrypted snapshot that has been shared from another account, you must have permissions for the CMK used to encrypt the snapshot.</p><p>Snapshots created by copying another snapshot have an arbitrary volume ID that should not be used for any purpose.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-copy-snapshot.html">Copying an Amazon EBS Snapshot</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CopySnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ReplicateSnapshotResult`.
 
 @see AWSEC2ReplicateSnapshotRequest
 @see AWSEC2ReplicateSnapshotResult
 */
- (AWSTask<AWSEC2ReplicateSnapshotResult *> *)replicateSnapshot:(AWSEC2ReplicateSnapshotRequest *)request;

/**
 <p>Copies a point-in-time snapshot of an EBS volume and stores it in Amazon S3. You can copy the snapshot within the same Region or from one Region to another. You can use the snapshot to create EBS volumes or Amazon Machine Images (AMIs).</p><p>Copies of encrypted EBS snapshots remain encrypted. Copies of unencrypted snapshots remain unencrypted, unless you enable encryption for the snapshot copy operation. By default, encrypted snapshot copies use the default AWS Key Management Service (AWS KMS) customer master key (CMK); however, you can specify a different CMK.</p><p>To copy an encrypted snapshot that has been shared from another account, you must have permissions for the CMK used to encrypt the snapshot.</p><p>Snapshots created by copying another snapshot have an arbitrary volume ID that should not be used for any purpose.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-copy-snapshot.html">Copying an Amazon EBS Snapshot</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CopySnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ReplicateSnapshotRequest
 @see AWSEC2ReplicateSnapshotResult
 */
- (void)replicateSnapshot:(AWSEC2ReplicateSnapshotRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ReplicateSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new Capacity Reservation with the specified attributes.</p><p>Capacity Reservations enable you to reserve capacity for your Amazon EC2 instances in a specific Availability Zone for any duration. This gives you the flexibility to selectively add capacity reservations and still get the Regional RI discounts for that usage. By creating Capacity Reservations, you ensure that you always have access to Amazon EC2 capacity when you need it, for as long as you need it. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-capacity-reservations.html">Capacity Reservations</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>Your request to create a Capacity Reservation could fail if Amazon EC2 does not have sufficient capacity to fulfill the request. If your request fails due to Amazon EC2 capacity constraints, either try again at a later time, try in a different Availability Zone, or request a smaller capacity reservation. If your application is flexible across instance types and sizes, try to create a Capacity Reservation with different instance attributes.</p><p>Your request could also fail if the requested quantity exceeds your On-Demand Instance limit for the selected instance type. If your request fails due to limit constraints, increase your On-Demand Instance limit for the required instance type and try again. For more information about increasing your instance limits, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-resource-limits.html">Amazon EC2 Service Limits</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateCapacityReservation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateCapacityReservationResult`.
 
 @see AWSEC2CreateCapacityReservationRequest
 @see AWSEC2CreateCapacityReservationResult
 */
- (AWSTask<AWSEC2CreateCapacityReservationResult *> *)createCapacityReservation:(AWSEC2CreateCapacityReservationRequest *)request;

/**
 <p>Creates a new Capacity Reservation with the specified attributes.</p><p>Capacity Reservations enable you to reserve capacity for your Amazon EC2 instances in a specific Availability Zone for any duration. This gives you the flexibility to selectively add capacity reservations and still get the Regional RI discounts for that usage. By creating Capacity Reservations, you ensure that you always have access to Amazon EC2 capacity when you need it, for as long as you need it. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-capacity-reservations.html">Capacity Reservations</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>Your request to create a Capacity Reservation could fail if Amazon EC2 does not have sufficient capacity to fulfill the request. If your request fails due to Amazon EC2 capacity constraints, either try again at a later time, try in a different Availability Zone, or request a smaller capacity reservation. If your application is flexible across instance types and sizes, try to create a Capacity Reservation with different instance attributes.</p><p>Your request could also fail if the requested quantity exceeds your On-Demand Instance limit for the selected instance type. If your request fails due to limit constraints, increase your On-Demand Instance limit for the required instance type and try again. For more information about increasing your instance limits, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-resource-limits.html">Amazon EC2 Service Limits</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateCapacityReservation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateCapacityReservationRequest
 @see AWSEC2CreateCapacityReservationResult
 */
- (void)createCapacityReservation:(AWSEC2CreateCapacityReservationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateCapacityReservationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Client VPN endpoint. A Client VPN endpoint is the resource you create and configure to enable and manage client VPN sessions. It is the destination endpoint at which all client VPN sessions are terminated.</p>
 
 @param request A container for the necessary parameters to execute the CreateClientVpnEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateClientVpnEndpointResult`.
 
 @see AWSEC2CreateClientVpnEndpointRequest
 @see AWSEC2CreateClientVpnEndpointResult
 */
- (AWSTask<AWSEC2CreateClientVpnEndpointResult *> *)createClientVpnEndpoint:(AWSEC2CreateClientVpnEndpointRequest *)request;

/**
 <p>Creates a Client VPN endpoint. A Client VPN endpoint is the resource you create and configure to enable and manage client VPN sessions. It is the destination endpoint at which all client VPN sessions are terminated.</p>
 
 @param request A container for the necessary parameters to execute the CreateClientVpnEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateClientVpnEndpointRequest
 @see AWSEC2CreateClientVpnEndpointResult
 */
- (void)createClientVpnEndpoint:(AWSEC2CreateClientVpnEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateClientVpnEndpointResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds a route to a network to a Client VPN endpoint. Each Client VPN endpoint has a route table that describes the available destination network routes. Each route in the route table specifies the path for traﬃc to speciﬁc resources or networks.</p>
 
 @param request A container for the necessary parameters to execute the CreateClientVpnRoute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateClientVpnRouteResult`.
 
 @see AWSEC2CreateClientVpnRouteRequest
 @see AWSEC2CreateClientVpnRouteResult
 */
- (AWSTask<AWSEC2CreateClientVpnRouteResult *> *)createClientVpnRoute:(AWSEC2CreateClientVpnRouteRequest *)request;

/**
 <p>Adds a route to a network to a Client VPN endpoint. Each Client VPN endpoint has a route table that describes the available destination network routes. Each route in the route table specifies the path for traﬃc to speciﬁc resources or networks.</p>
 
 @param request A container for the necessary parameters to execute the CreateClientVpnRoute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateClientVpnRouteRequest
 @see AWSEC2CreateClientVpnRouteResult
 */
- (void)createClientVpnRoute:(AWSEC2CreateClientVpnRouteRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateClientVpnRouteResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information to AWS about your VPN customer gateway device. The customer gateway is the appliance at your end of the VPN connection. (The device on the AWS side of the VPN connection is the virtual private gateway.) You must provide the Internet-routable IP address of the customer gateway's external interface. The IP address must be static and can be behind a device performing network address translation (NAT).</p><p>For devices that use Border Gateway Protocol (BGP), you can also provide the device's BGP Autonomous System Number (ASN). You can use an existing ASN assigned to your network. If you don't have an ASN already, you can use a private ASN (in the 64512 - 65534 range).</p><note><p>Amazon EC2 supports all 2-byte ASN numbers in the range of 1 - 65534, with the exception of 7224, which is reserved in the <code>us-east-1</code> Region, and 9059, which is reserved in the <code>eu-west-1</code> Region.</p></note><p>For more information, see <a href="https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html">AWS Site-to-Site VPN</a> in the <i>AWS Site-to-Site VPN User Guide</i>.</p><important><p>To create more than one customer gateway with the same VPN type, IP address, and BGP ASN, specify a unique device name for each customer gateway. Identical requests return information about the existing customer gateway and do not create new customer gateways.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateCustomerGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateCustomerGatewayResult`.
 
 @see AWSEC2CreateCustomerGatewayRequest
 @see AWSEC2CreateCustomerGatewayResult
 */
- (AWSTask<AWSEC2CreateCustomerGatewayResult *> *)createCustomerGateway:(AWSEC2CreateCustomerGatewayRequest *)request;

/**
 <p>Provides information to AWS about your VPN customer gateway device. The customer gateway is the appliance at your end of the VPN connection. (The device on the AWS side of the VPN connection is the virtual private gateway.) You must provide the Internet-routable IP address of the customer gateway's external interface. The IP address must be static and can be behind a device performing network address translation (NAT).</p><p>For devices that use Border Gateway Protocol (BGP), you can also provide the device's BGP Autonomous System Number (ASN). You can use an existing ASN assigned to your network. If you don't have an ASN already, you can use a private ASN (in the 64512 - 65534 range).</p><note><p>Amazon EC2 supports all 2-byte ASN numbers in the range of 1 - 65534, with the exception of 7224, which is reserved in the <code>us-east-1</code> Region, and 9059, which is reserved in the <code>eu-west-1</code> Region.</p></note><p>For more information, see <a href="https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html">AWS Site-to-Site VPN</a> in the <i>AWS Site-to-Site VPN User Guide</i>.</p><important><p>To create more than one customer gateway with the same VPN type, IP address, and BGP ASN, specify a unique device name for each customer gateway. Identical requests return information about the existing customer gateway and do not create new customer gateways.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateCustomerGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateCustomerGatewayRequest
 @see AWSEC2CreateCustomerGatewayResult
 */
- (void)createCustomerGateway:(AWSEC2CreateCustomerGatewayRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateCustomerGatewayResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a default subnet with a size <code>/20</code> IPv4 CIDR block in the specified Availability Zone in your default VPC. You can have only one default subnet per Availability Zone. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/default-vpc.html#create-default-subnet">Creating a Default Subnet</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDefaultSubnet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateDefaultSubnetResult`.
 
 @see AWSEC2CreateDefaultSubnetRequest
 @see AWSEC2CreateDefaultSubnetResult
 */
- (AWSTask<AWSEC2CreateDefaultSubnetResult *> *)createDefaultSubnet:(AWSEC2CreateDefaultSubnetRequest *)request;

/**
 <p>Creates a default subnet with a size <code>/20</code> IPv4 CIDR block in the specified Availability Zone in your default VPC. You can have only one default subnet per Availability Zone. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/default-vpc.html#create-default-subnet">Creating a Default Subnet</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDefaultSubnet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateDefaultSubnetRequest
 @see AWSEC2CreateDefaultSubnetResult
 */
- (void)createDefaultSubnet:(AWSEC2CreateDefaultSubnetRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateDefaultSubnetResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a default VPC with a size <code>/16</code> IPv4 CIDR block and a default subnet in each Availability Zone. For more information about the components of a default VPC, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/default-vpc.html">Default VPC and Default Subnets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>. You cannot specify the components of the default VPC yourself.</p><p>If you deleted your previous default VPC, you can create a default VPC. You cannot have more than one default VPC per Region.</p><p>If your account supports EC2-Classic, you cannot use this action to create a default VPC in a Region that supports EC2-Classic. If you want a default VPC in a Region that supports EC2-Classic, see "I really want a default VPC for my existing EC2 account. Is that possible?" in the <a href="http://aws.amazon.com/vpc/faqs/#Default_VPCs">Default VPCs FAQ</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDefaultVpc service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateDefaultVpcResult`.
 
 @see AWSEC2CreateDefaultVpcRequest
 @see AWSEC2CreateDefaultVpcResult
 */
- (AWSTask<AWSEC2CreateDefaultVpcResult *> *)createDefaultVpc:(AWSEC2CreateDefaultVpcRequest *)request;

/**
 <p>Creates a default VPC with a size <code>/16</code> IPv4 CIDR block and a default subnet in each Availability Zone. For more information about the components of a default VPC, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/default-vpc.html">Default VPC and Default Subnets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>. You cannot specify the components of the default VPC yourself.</p><p>If you deleted your previous default VPC, you can create a default VPC. You cannot have more than one default VPC per Region.</p><p>If your account supports EC2-Classic, you cannot use this action to create a default VPC in a Region that supports EC2-Classic. If you want a default VPC in a Region that supports EC2-Classic, see "I really want a default VPC for my existing EC2 account. Is that possible?" in the <a href="http://aws.amazon.com/vpc/faqs/#Default_VPCs">Default VPCs FAQ</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDefaultVpc service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateDefaultVpcRequest
 @see AWSEC2CreateDefaultVpcResult
 */
- (void)createDefaultVpc:(AWSEC2CreateDefaultVpcRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateDefaultVpcResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a set of DHCP options for your VPC. After creating the set, you must associate it with the VPC, causing all existing and new instances that you launch in the VPC to use this set of DHCP options. The following are the individual DHCP options you can specify. For more information about the options, see <a href="http://www.ietf.org/rfc/rfc2132.txt">RFC 2132</a>.</p><ul><li><p><code>domain-name-servers</code> - The IP addresses of up to four domain name servers, or AmazonProvidedDNS. The default DHCP option set specifies AmazonProvidedDNS. If specifying more than one domain name server, specify the IP addresses in a single parameter, separated by commas. To have your instance receive a custom DNS hostname as specified in <code>domain-name</code>, you must set <code>domain-name-servers</code> to a custom DNS server.</p></li><li><p><code>domain-name</code> - If you're using AmazonProvidedDNS in <code>us-east-1</code>, specify <code>ec2.internal</code>. If you're using AmazonProvidedDNS in another Region, specify <code>region.compute.internal</code> (for example, <code>ap-northeast-1.compute.internal</code>). Otherwise, specify a domain name (for example, <code>MyCompany.com</code>). This value is used to complete unqualified DNS hostnames. <b>Important</b>: Some Linux operating systems accept multiple domain names separated by spaces. However, Windows and other Linux operating systems treat the value as a single domain, which results in unexpected behavior. If your DHCP options set is associated with a VPC that has instances with multiple operating systems, specify only one domain name.</p></li><li><p><code>ntp-servers</code> - The IP addresses of up to four Network Time Protocol (NTP) servers.</p></li><li><p><code>netbios-name-servers</code> - The IP addresses of up to four NetBIOS name servers.</p></li><li><p><code>netbios-node-type</code> - The NetBIOS node type (1, 2, 4, or 8). We recommend that you specify 2 (broadcast and multicast are not currently supported). For more information about these node types, see <a href="http://www.ietf.org/rfc/rfc2132.txt">RFC 2132</a>.</p></li></ul><p>Your VPC automatically starts out with a set of DHCP options that includes only a DNS server that we provide (AmazonProvidedDNS). If you create a set of options, and if your VPC has an internet gateway, make sure to set the <code>domain-name-servers</code> option either to <code>AmazonProvidedDNS</code> or to a domain name server of your choice. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_DHCP_Options.html">DHCP Options Sets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDhcpOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateDhcpOptionsResult`.
 
 @see AWSEC2CreateDhcpOptionsRequest
 @see AWSEC2CreateDhcpOptionsResult
 */
- (AWSTask<AWSEC2CreateDhcpOptionsResult *> *)createDhcpOptions:(AWSEC2CreateDhcpOptionsRequest *)request;

/**
 <p>Creates a set of DHCP options for your VPC. After creating the set, you must associate it with the VPC, causing all existing and new instances that you launch in the VPC to use this set of DHCP options. The following are the individual DHCP options you can specify. For more information about the options, see <a href="http://www.ietf.org/rfc/rfc2132.txt">RFC 2132</a>.</p><ul><li><p><code>domain-name-servers</code> - The IP addresses of up to four domain name servers, or AmazonProvidedDNS. The default DHCP option set specifies AmazonProvidedDNS. If specifying more than one domain name server, specify the IP addresses in a single parameter, separated by commas. To have your instance receive a custom DNS hostname as specified in <code>domain-name</code>, you must set <code>domain-name-servers</code> to a custom DNS server.</p></li><li><p><code>domain-name</code> - If you're using AmazonProvidedDNS in <code>us-east-1</code>, specify <code>ec2.internal</code>. If you're using AmazonProvidedDNS in another Region, specify <code>region.compute.internal</code> (for example, <code>ap-northeast-1.compute.internal</code>). Otherwise, specify a domain name (for example, <code>MyCompany.com</code>). This value is used to complete unqualified DNS hostnames. <b>Important</b>: Some Linux operating systems accept multiple domain names separated by spaces. However, Windows and other Linux operating systems treat the value as a single domain, which results in unexpected behavior. If your DHCP options set is associated with a VPC that has instances with multiple operating systems, specify only one domain name.</p></li><li><p><code>ntp-servers</code> - The IP addresses of up to four Network Time Protocol (NTP) servers.</p></li><li><p><code>netbios-name-servers</code> - The IP addresses of up to four NetBIOS name servers.</p></li><li><p><code>netbios-node-type</code> - The NetBIOS node type (1, 2, 4, or 8). We recommend that you specify 2 (broadcast and multicast are not currently supported). For more information about these node types, see <a href="http://www.ietf.org/rfc/rfc2132.txt">RFC 2132</a>.</p></li></ul><p>Your VPC automatically starts out with a set of DHCP options that includes only a DNS server that we provide (AmazonProvidedDNS). If you create a set of options, and if your VPC has an internet gateway, make sure to set the <code>domain-name-servers</code> option either to <code>AmazonProvidedDNS</code> or to a domain name server of your choice. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_DHCP_Options.html">DHCP Options Sets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDhcpOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateDhcpOptionsRequest
 @see AWSEC2CreateDhcpOptionsResult
 */
- (void)createDhcpOptions:(AWSEC2CreateDhcpOptionsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateDhcpOptionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>[IPv6 only] Creates an egress-only internet gateway for your VPC. An egress-only internet gateway is used to enable outbound communication over IPv6 from instances in your VPC to the internet, and prevents hosts outside of your VPC from initiating an IPv6 connection with your instance.</p>
 
 @param request A container for the necessary parameters to execute the CreateEgressOnlyInternetGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateEgressOnlyInternetGatewayResult`.
 
 @see AWSEC2CreateEgressOnlyInternetGatewayRequest
 @see AWSEC2CreateEgressOnlyInternetGatewayResult
 */
- (AWSTask<AWSEC2CreateEgressOnlyInternetGatewayResult *> *)createEgressOnlyInternetGateway:(AWSEC2CreateEgressOnlyInternetGatewayRequest *)request;

/**
 <p>[IPv6 only] Creates an egress-only internet gateway for your VPC. An egress-only internet gateway is used to enable outbound communication over IPv6 from instances in your VPC to the internet, and prevents hosts outside of your VPC from initiating an IPv6 connection with your instance.</p>
 
 @param request A container for the necessary parameters to execute the CreateEgressOnlyInternetGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateEgressOnlyInternetGatewayRequest
 @see AWSEC2CreateEgressOnlyInternetGatewayResult
 */
- (void)createEgressOnlyInternetGateway:(AWSEC2CreateEgressOnlyInternetGatewayRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateEgressOnlyInternetGatewayResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Launches an EC2 Fleet.</p><p>You can create a single EC2 Fleet that includes multiple launch specifications that vary by instance type, AMI, Availability Zone, or subnet.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-fleet.html">Launching an EC2 Fleet</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateFleet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateFleetResult`.
 
 @see AWSEC2CreateFleetRequest
 @see AWSEC2CreateFleetResult
 */
- (AWSTask<AWSEC2CreateFleetResult *> *)createFleet:(AWSEC2CreateFleetRequest *)request;

/**
 <p>Launches an EC2 Fleet.</p><p>You can create a single EC2 Fleet that includes multiple launch specifications that vary by instance type, AMI, Availability Zone, or subnet.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-fleet.html">Launching an EC2 Fleet</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateFleet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateFleetRequest
 @see AWSEC2CreateFleetResult
 */
- (void)createFleet:(AWSEC2CreateFleetRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateFleetResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates one or more flow logs to capture information about IP traffic for a specific network interface, subnet, or VPC. </p><p>Flow log data for a monitored network interface is recorded as flow log records, which are log events consisting of fields that describe the traffic flow. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html#flow-log-records">Flow Log Records</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>When publishing to CloudWatch Logs, flow log records are published to a log group, and each network interface has a unique log stream in the log group. When publishing to Amazon S3, flow log records for all of the monitored network interfaces are published to a single log file object that is stored in the specified bucket.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html">VPC Flow Logs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateFlowLogs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateFlowLogsResult`.
 
 @see AWSEC2CreateFlowLogsRequest
 @see AWSEC2CreateFlowLogsResult
 */
- (AWSTask<AWSEC2CreateFlowLogsResult *> *)createFlowLogs:(AWSEC2CreateFlowLogsRequest *)request;

/**
 <p>Creates one or more flow logs to capture information about IP traffic for a specific network interface, subnet, or VPC. </p><p>Flow log data for a monitored network interface is recorded as flow log records, which are log events consisting of fields that describe the traffic flow. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html#flow-log-records">Flow Log Records</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>When publishing to CloudWatch Logs, flow log records are published to a log group, and each network interface has a unique log stream in the log group. When publishing to Amazon S3, flow log records for all of the monitored network interfaces are published to a single log file object that is stored in the specified bucket.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html">VPC Flow Logs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateFlowLogs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateFlowLogsRequest
 @see AWSEC2CreateFlowLogsResult
 */
- (void)createFlowLogs:(AWSEC2CreateFlowLogsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateFlowLogsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon FPGA Image (AFI) from the specified design checkpoint (DCP).</p><p>The create operation is asynchronous. To verify that the AFI is ready for use, check the output logs.</p><p>An AFI contains the FPGA bitstream that is ready to download to an FPGA. You can securely deploy an AFI on multiple FPGA-accelerated instances. For more information, see the <a href="https://github.com/aws/aws-fpga/">AWS FPGA Hardware Development Kit</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateFpgaImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateFpgaImageResult`.
 
 @see AWSEC2CreateFpgaImageRequest
 @see AWSEC2CreateFpgaImageResult
 */
- (AWSTask<AWSEC2CreateFpgaImageResult *> *)createFpgaImage:(AWSEC2CreateFpgaImageRequest *)request;

/**
 <p>Creates an Amazon FPGA Image (AFI) from the specified design checkpoint (DCP).</p><p>The create operation is asynchronous. To verify that the AFI is ready for use, check the output logs.</p><p>An AFI contains the FPGA bitstream that is ready to download to an FPGA. You can securely deploy an AFI on multiple FPGA-accelerated instances. For more information, see the <a href="https://github.com/aws/aws-fpga/">AWS FPGA Hardware Development Kit</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateFpgaImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateFpgaImageRequest
 @see AWSEC2CreateFpgaImageResult
 */
- (void)createFpgaImage:(AWSEC2CreateFpgaImageRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateFpgaImageResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon EBS-backed AMI from an Amazon EBS-backed instance that is either running or stopped.</p><p>If you customized your instance with instance store volumes or EBS volumes in addition to the root device volume, the new AMI contains block device mapping information for those volumes. When you launch an instance from this new AMI, the instance automatically launches with those additional volumes.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami-ebs.html">Creating Amazon EBS-Backed Linux AMIs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateImageResult`.
 
 @see AWSEC2CreateImageRequest
 @see AWSEC2CreateImageResult
 */
- (AWSTask<AWSEC2CreateImageResult *> *)createImage:(AWSEC2CreateImageRequest *)request;

/**
 <p>Creates an Amazon EBS-backed AMI from an Amazon EBS-backed instance that is either running or stopped.</p><p>If you customized your instance with instance store volumes or EBS volumes in addition to the root device volume, the new AMI contains block device mapping information for those volumes. When you launch an instance from this new AMI, the instance automatically launches with those additional volumes.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami-ebs.html">Creating Amazon EBS-Backed Linux AMIs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateImageRequest
 @see AWSEC2CreateImageResult
 */
- (void)createImage:(AWSEC2CreateImageRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateImageResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Exports a running or stopped instance to an S3 bucket.</p><p>For information about the supported operating systems, image formats, and known limitations for the types of instances you can export, see <a href="https://docs.aws.amazon.com/vm-import/latest/userguide/vmexport.html">Exporting an Instance as a VM Using VM Import/Export</a> in the <i>VM Import/Export User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateInstanceExportTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateInstanceExportTaskResult`.
 
 @see AWSEC2CreateInstanceExportTaskRequest
 @see AWSEC2CreateInstanceExportTaskResult
 */
- (AWSTask<AWSEC2CreateInstanceExportTaskResult *> *)createInstanceExportTask:(AWSEC2CreateInstanceExportTaskRequest *)request;

/**
 <p>Exports a running or stopped instance to an S3 bucket.</p><p>For information about the supported operating systems, image formats, and known limitations for the types of instances you can export, see <a href="https://docs.aws.amazon.com/vm-import/latest/userguide/vmexport.html">Exporting an Instance as a VM Using VM Import/Export</a> in the <i>VM Import/Export User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateInstanceExportTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateInstanceExportTaskRequest
 @see AWSEC2CreateInstanceExportTaskResult
 */
- (void)createInstanceExportTask:(AWSEC2CreateInstanceExportTaskRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateInstanceExportTaskResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an internet gateway for use with a VPC. After creating the internet gateway, you attach it to a VPC using <a>AttachInternetGateway</a>.</p><p>For more information about your VPC and internet gateway, see the <a href="https://docs.aws.amazon.com/vpc/latest/userguide/">Amazon Virtual Private Cloud User Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateInternetGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateInternetGatewayResult`.
 
 @see AWSEC2CreateInternetGatewayRequest
 @see AWSEC2CreateInternetGatewayResult
 */
- (AWSTask<AWSEC2CreateInternetGatewayResult *> *)createInternetGateway:(AWSEC2CreateInternetGatewayRequest *)request;

/**
 <p>Creates an internet gateway for use with a VPC. After creating the internet gateway, you attach it to a VPC using <a>AttachInternetGateway</a>.</p><p>For more information about your VPC and internet gateway, see the <a href="https://docs.aws.amazon.com/vpc/latest/userguide/">Amazon Virtual Private Cloud User Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateInternetGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateInternetGatewayRequest
 @see AWSEC2CreateInternetGatewayResult
 */
- (void)createInternetGateway:(AWSEC2CreateInternetGatewayRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateInternetGatewayResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a 2048-bit RSA key pair with the specified name. Amazon EC2 stores the public key and displays the private key for you to save to a file. The private key is returned as an unencrypted PEM encoded PKCS#1 private key. If a key with the specified name already exists, Amazon EC2 returns an error.</p><p>You can have up to five thousand key pairs per Region.</p><p>The key pair returned to you is available only in the Region in which you create it. If you prefer, you can create your own key pair using a third-party tool and upload it to any Region using <a>ImportKeyPair</a>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateKeyPair service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2KeyPair`.
 
 @see AWSEC2CreateKeyPairRequest
 @see AWSEC2KeyPair
 */
- (AWSTask<AWSEC2KeyPair *> *)createKeyPair:(AWSEC2CreateKeyPairRequest *)request;

/**
 <p>Creates a 2048-bit RSA key pair with the specified name. Amazon EC2 stores the public key and displays the private key for you to save to a file. The private key is returned as an unencrypted PEM encoded PKCS#1 private key. If a key with the specified name already exists, Amazon EC2 returns an error.</p><p>You can have up to five thousand key pairs per Region.</p><p>The key pair returned to you is available only in the Region in which you create it. If you prefer, you can create your own key pair using a third-party tool and upload it to any Region using <a>ImportKeyPair</a>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateKeyPair service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateKeyPairRequest
 @see AWSEC2KeyPair
 */
- (void)createKeyPair:(AWSEC2CreateKeyPairRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2KeyPair * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a launch template. A launch template contains the parameters to launch an instance. When you launch an instance using <a>RunInstances</a>, you can specify a launch template instead of providing the launch parameters in the request.</p>
 
 @param request A container for the necessary parameters to execute the CreateLaunchTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateLaunchTemplateResult`.
 
 @see AWSEC2CreateLaunchTemplateRequest
 @see AWSEC2CreateLaunchTemplateResult
 */
- (AWSTask<AWSEC2CreateLaunchTemplateResult *> *)createLaunchTemplate:(AWSEC2CreateLaunchTemplateRequest *)request;

/**
 <p>Creates a launch template. A launch template contains the parameters to launch an instance. When you launch an instance using <a>RunInstances</a>, you can specify a launch template instead of providing the launch parameters in the request.</p>
 
 @param request A container for the necessary parameters to execute the CreateLaunchTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateLaunchTemplateRequest
 @see AWSEC2CreateLaunchTemplateResult
 */
- (void)createLaunchTemplate:(AWSEC2CreateLaunchTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateLaunchTemplateResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new version for a launch template. You can specify an existing version of launch template from which to base the new version.</p><p>Launch template versions are numbered in the order in which they are created. You cannot specify, change, or replace the numbering of launch template versions.</p>
 
 @param request A container for the necessary parameters to execute the CreateLaunchTemplateVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateLaunchTemplateVersionResult`.
 
 @see AWSEC2CreateLaunchTemplateVersionRequest
 @see AWSEC2CreateLaunchTemplateVersionResult
 */
- (AWSTask<AWSEC2CreateLaunchTemplateVersionResult *> *)createLaunchTemplateVersion:(AWSEC2CreateLaunchTemplateVersionRequest *)request;

/**
 <p>Creates a new version for a launch template. You can specify an existing version of launch template from which to base the new version.</p><p>Launch template versions are numbered in the order in which they are created. You cannot specify, change, or replace the numbering of launch template versions.</p>
 
 @param request A container for the necessary parameters to execute the CreateLaunchTemplateVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateLaunchTemplateVersionRequest
 @see AWSEC2CreateLaunchTemplateVersionResult
 */
- (void)createLaunchTemplateVersion:(AWSEC2CreateLaunchTemplateVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateLaunchTemplateVersionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a static route for the specified local gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the CreateLocalGatewayRoute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateLocalGatewayRouteResult`.
 
 @see AWSEC2CreateLocalGatewayRouteRequest
 @see AWSEC2CreateLocalGatewayRouteResult
 */
- (AWSTask<AWSEC2CreateLocalGatewayRouteResult *> *)createLocalGatewayRoute:(AWSEC2CreateLocalGatewayRouteRequest *)request;

/**
 <p>Creates a static route for the specified local gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the CreateLocalGatewayRoute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateLocalGatewayRouteRequest
 @see AWSEC2CreateLocalGatewayRouteResult
 */
- (void)createLocalGatewayRoute:(AWSEC2CreateLocalGatewayRouteRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateLocalGatewayRouteResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates the specified VPC with the specified local gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the CreateLocalGatewayRouteTableVpcAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateLocalGatewayRouteTableVpcAssociationResult`.
 
 @see AWSEC2CreateLocalGatewayRouteTableVpcAssociationRequest
 @see AWSEC2CreateLocalGatewayRouteTableVpcAssociationResult
 */
- (AWSTask<AWSEC2CreateLocalGatewayRouteTableVpcAssociationResult *> *)createLocalGatewayRouteTableVpcAssociation:(AWSEC2CreateLocalGatewayRouteTableVpcAssociationRequest *)request;

/**
 <p>Associates the specified VPC with the specified local gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the CreateLocalGatewayRouteTableVpcAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateLocalGatewayRouteTableVpcAssociationRequest
 @see AWSEC2CreateLocalGatewayRouteTableVpcAssociationResult
 */
- (void)createLocalGatewayRouteTableVpcAssociation:(AWSEC2CreateLocalGatewayRouteTableVpcAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateLocalGatewayRouteTableVpcAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a NAT gateway in the specified public subnet. This action creates a network interface in the specified subnet with a private IP address from the IP address range of the subnet. Internet-bound traffic from a private subnet can be routed to the NAT gateway, therefore enabling instances in the private subnet to connect to the internet. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html">NAT Gateways</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNatGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateNatGatewayResult`.
 
 @see AWSEC2CreateNatGatewayRequest
 @see AWSEC2CreateNatGatewayResult
 */
- (AWSTask<AWSEC2CreateNatGatewayResult *> *)createNatGateway:(AWSEC2CreateNatGatewayRequest *)request;

/**
 <p>Creates a NAT gateway in the specified public subnet. This action creates a network interface in the specified subnet with a private IP address from the IP address range of the subnet. Internet-bound traffic from a private subnet can be routed to the NAT gateway, therefore enabling instances in the private subnet to connect to the internet. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html">NAT Gateways</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNatGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateNatGatewayRequest
 @see AWSEC2CreateNatGatewayResult
 */
- (void)createNatGateway:(AWSEC2CreateNatGatewayRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateNatGatewayResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a network ACL in a VPC. Network ACLs provide an optional layer of security (in addition to security groups) for the instances in your VPC.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNetworkAcl service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateNetworkAclResult`.
 
 @see AWSEC2CreateNetworkAclRequest
 @see AWSEC2CreateNetworkAclResult
 */
- (AWSTask<AWSEC2CreateNetworkAclResult *> *)createNetworkAcl:(AWSEC2CreateNetworkAclRequest *)request;

/**
 <p>Creates a network ACL in a VPC. Network ACLs provide an optional layer of security (in addition to security groups) for the instances in your VPC.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNetworkAcl service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateNetworkAclRequest
 @see AWSEC2CreateNetworkAclResult
 */
- (void)createNetworkAcl:(AWSEC2CreateNetworkAclRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateNetworkAclResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an entry (a rule) in a network ACL with the specified rule number. Each network ACL has a set of numbered ingress rules and a separate set of numbered egress rules. When determining whether a packet should be allowed in or out of a subnet associated with the ACL, we process the entries in the ACL according to the rule numbers, in ascending order. Each network ACL has a set of ingress rules and a separate set of egress rules.</p><p>We recommend that you leave room between the rule numbers (for example, 100, 110, 120, ...), and not number them one right after the other (for example, 101, 102, 103, ...). This makes it easier to add a rule between existing ones without having to renumber the rules.</p><p>After you add an entry, you can't modify it; you must either replace it, or create an entry and delete the old one.</p><p>For more information about network ACLs, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNetworkAclEntry service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2CreateNetworkAclEntryRequest
 */
- (AWSTask *)createNetworkAclEntry:(AWSEC2CreateNetworkAclEntryRequest *)request;

/**
 <p>Creates an entry (a rule) in a network ACL with the specified rule number. Each network ACL has a set of numbered ingress rules and a separate set of numbered egress rules. When determining whether a packet should be allowed in or out of a subnet associated with the ACL, we process the entries in the ACL according to the rule numbers, in ascending order. Each network ACL has a set of ingress rules and a separate set of egress rules.</p><p>We recommend that you leave room between the rule numbers (for example, 100, 110, 120, ...), and not number them one right after the other (for example, 101, 102, 103, ...). This makes it easier to add a rule between existing ones without having to renumber the rules.</p><p>After you add an entry, you can't modify it; you must either replace it, or create an entry and delete the old one.</p><p>For more information about network ACLs, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNetworkAclEntry service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateNetworkAclEntryRequest
 */
- (void)createNetworkAclEntry:(AWSEC2CreateNetworkAclEntryRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates a network interface in the specified subnet.</p><p>For more information about network interfaces, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html">Elastic Network Interfaces</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNetworkInterface service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateNetworkInterfaceResult`.
 
 @see AWSEC2CreateNetworkInterfaceRequest
 @see AWSEC2CreateNetworkInterfaceResult
 */
- (AWSTask<AWSEC2CreateNetworkInterfaceResult *> *)createNetworkInterface:(AWSEC2CreateNetworkInterfaceRequest *)request;

/**
 <p>Creates a network interface in the specified subnet.</p><p>For more information about network interfaces, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html">Elastic Network Interfaces</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNetworkInterface service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateNetworkInterfaceRequest
 @see AWSEC2CreateNetworkInterfaceResult
 */
- (void)createNetworkInterface:(AWSEC2CreateNetworkInterfaceRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateNetworkInterfaceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Grants an AWS-authorized account permission to attach the specified network interface to an instance in their account.</p><p>You can grant permission to a single AWS account only, and only one account at a time.</p>
 
 @param request A container for the necessary parameters to execute the CreateNetworkInterfacePermission service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateNetworkInterfacePermissionResult`.
 
 @see AWSEC2CreateNetworkInterfacePermissionRequest
 @see AWSEC2CreateNetworkInterfacePermissionResult
 */
- (AWSTask<AWSEC2CreateNetworkInterfacePermissionResult *> *)createNetworkInterfacePermission:(AWSEC2CreateNetworkInterfacePermissionRequest *)request;

/**
 <p>Grants an AWS-authorized account permission to attach the specified network interface to an instance in their account.</p><p>You can grant permission to a single AWS account only, and only one account at a time.</p>
 
 @param request A container for the necessary parameters to execute the CreateNetworkInterfacePermission service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateNetworkInterfacePermissionRequest
 @see AWSEC2CreateNetworkInterfacePermissionResult
 */
- (void)createNetworkInterfacePermission:(AWSEC2CreateNetworkInterfacePermissionRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateNetworkInterfacePermissionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a placement group in which to launch instances. The strategy of the placement group determines how the instances are organized within the group. </p><p>A <code>cluster</code> placement group is a logical grouping of instances within a single Availability Zone that benefit from low network latency, high network throughput. A <code>spread</code> placement group places instances on distinct hardware. A <code>partition</code> placement group places groups of instances in different partitions, where instances in one partition do not share the same hardware with instances in another partition.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">Placement Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreatePlacementGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2CreatePlacementGroupRequest
 */
- (AWSTask *)createPlacementGroup:(AWSEC2CreatePlacementGroupRequest *)request;

/**
 <p>Creates a placement group in which to launch instances. The strategy of the placement group determines how the instances are organized within the group. </p><p>A <code>cluster</code> placement group is a logical grouping of instances within a single Availability Zone that benefit from low network latency, high network throughput. A <code>spread</code> placement group places instances on distinct hardware. A <code>partition</code> placement group places groups of instances in different partitions, where instances in one partition do not share the same hardware with instances in another partition.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">Placement Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreatePlacementGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreatePlacementGroupRequest
 */
- (void)createPlacementGroup:(AWSEC2CreatePlacementGroupRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates a listing for Amazon EC2 Standard Reserved Instances to be sold in the Reserved Instance Marketplace. You can submit one Standard Reserved Instance listing at a time. To get a list of your Standard Reserved Instances, you can use the <a>DescribeReservedInstances</a> operation.</p><note><p>Only Standard Reserved Instances can be sold in the Reserved Instance Marketplace. Convertible Reserved Instances cannot be sold.</p></note><p>The Reserved Instance Marketplace matches sellers who want to resell Standard Reserved Instance capacity that they no longer need with buyers who want to purchase additional capacity. Reserved Instances bought and sold through the Reserved Instance Marketplace work like any other Reserved Instances.</p><p>To sell your Standard Reserved Instances, you must first register as a seller in the Reserved Instance Marketplace. After completing the registration process, you can create a Reserved Instance Marketplace listing of some or all of your Standard Reserved Instances, and specify the upfront price to receive for them. Your Standard Reserved Instance listings then become available for purchase. To view the details of your Standard Reserved Instance listing, you can use the <a>DescribeReservedInstancesListings</a> operation.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateReservedInstancesListing service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateReservedInstancesListingResult`.
 
 @see AWSEC2CreateReservedInstancesListingRequest
 @see AWSEC2CreateReservedInstancesListingResult
 */
- (AWSTask<AWSEC2CreateReservedInstancesListingResult *> *)createReservedInstancesListing:(AWSEC2CreateReservedInstancesListingRequest *)request;

/**
 <p>Creates a listing for Amazon EC2 Standard Reserved Instances to be sold in the Reserved Instance Marketplace. You can submit one Standard Reserved Instance listing at a time. To get a list of your Standard Reserved Instances, you can use the <a>DescribeReservedInstances</a> operation.</p><note><p>Only Standard Reserved Instances can be sold in the Reserved Instance Marketplace. Convertible Reserved Instances cannot be sold.</p></note><p>The Reserved Instance Marketplace matches sellers who want to resell Standard Reserved Instance capacity that they no longer need with buyers who want to purchase additional capacity. Reserved Instances bought and sold through the Reserved Instance Marketplace work like any other Reserved Instances.</p><p>To sell your Standard Reserved Instances, you must first register as a seller in the Reserved Instance Marketplace. After completing the registration process, you can create a Reserved Instance Marketplace listing of some or all of your Standard Reserved Instances, and specify the upfront price to receive for them. Your Standard Reserved Instance listings then become available for purchase. To view the details of your Standard Reserved Instance listing, you can use the <a>DescribeReservedInstancesListings</a> operation.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateReservedInstancesListing service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateReservedInstancesListingRequest
 @see AWSEC2CreateReservedInstancesListingResult
 */
- (void)createReservedInstancesListing:(AWSEC2CreateReservedInstancesListingRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateReservedInstancesListingResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a route in a route table within a VPC.</p><p>You must specify one of the following targets: internet gateway or virtual private gateway, NAT instance, NAT gateway, VPC peering connection, network interface, egress-only internet gateway, or transit gateway.</p><p>When determining how to route traffic, we use the route with the most specific match. For example, traffic is destined for the IPv4 address <code>192.0.2.3</code>, and the route table includes the following two IPv4 routes:</p><ul><li><p><code>192.0.2.0/24</code> (goes to some target A)</p></li><li><p><code>192.0.2.0/28</code> (goes to some target B)</p></li></ul><p>Both routes apply to the traffic destined for <code>192.0.2.3</code>. However, the second route in the list covers a smaller number of IP addresses and is therefore more specific, so we use that route to determine where to target the traffic.</p><p>For more information about route tables, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRoute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateRouteResult`.
 
 @see AWSEC2CreateRouteRequest
 @see AWSEC2CreateRouteResult
 */
- (AWSTask<AWSEC2CreateRouteResult *> *)createRoute:(AWSEC2CreateRouteRequest *)request;

/**
 <p>Creates a route in a route table within a VPC.</p><p>You must specify one of the following targets: internet gateway or virtual private gateway, NAT instance, NAT gateway, VPC peering connection, network interface, egress-only internet gateway, or transit gateway.</p><p>When determining how to route traffic, we use the route with the most specific match. For example, traffic is destined for the IPv4 address <code>192.0.2.3</code>, and the route table includes the following two IPv4 routes:</p><ul><li><p><code>192.0.2.0/24</code> (goes to some target A)</p></li><li><p><code>192.0.2.0/28</code> (goes to some target B)</p></li></ul><p>Both routes apply to the traffic destined for <code>192.0.2.3</code>. However, the second route in the list covers a smaller number of IP addresses and is therefore more specific, so we use that route to determine where to target the traffic.</p><p>For more information about route tables, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRoute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateRouteRequest
 @see AWSEC2CreateRouteResult
 */
- (void)createRoute:(AWSEC2CreateRouteRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateRouteResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a route table for the specified VPC. After you create a route table, you can add routes and associate the table with a subnet.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRouteTable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateRouteTableResult`.
 
 @see AWSEC2CreateRouteTableRequest
 @see AWSEC2CreateRouteTableResult
 */
- (AWSTask<AWSEC2CreateRouteTableResult *> *)createRouteTable:(AWSEC2CreateRouteTableRequest *)request;

/**
 <p>Creates a route table for the specified VPC. After you create a route table, you can add routes and associate the table with a subnet.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRouteTable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateRouteTableRequest
 @see AWSEC2CreateRouteTableResult
 */
- (void)createRouteTable:(AWSEC2CreateRouteTableRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateRouteTableResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a security group.</p><p>A security group acts as a virtual firewall for your instance to control inbound and outbound traffic. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html">Amazon EC2 Security Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i> and <a href="https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html">Security Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>When you create a security group, you specify a friendly name of your choice. You can have a security group for use in EC2-Classic with the same name as a security group for use in a VPC. However, you can't have two security groups for use in EC2-Classic with the same name or two security groups for use in a VPC with the same name.</p><p>You have a default security group for use in EC2-Classic and a default security group for use in your VPC. If you don't specify a security group when you launch an instance, the instance is launched into the appropriate default security group. A default security group includes a default rule that grants instances unrestricted network access to each other.</p><p>You can add or remove rules from your security groups using <a>AuthorizeSecurityGroupIngress</a>, <a>AuthorizeSecurityGroupEgress</a>, <a>RevokeSecurityGroupIngress</a>, and <a>RevokeSecurityGroupEgress</a>.</p><p>For more information about VPC security group limits, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html">Amazon VPC Limits</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSecurityGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateSecurityGroupResult`.
 
 @see AWSEC2CreateSecurityGroupRequest
 @see AWSEC2CreateSecurityGroupResult
 */
- (AWSTask<AWSEC2CreateSecurityGroupResult *> *)createSecurityGroup:(AWSEC2CreateSecurityGroupRequest *)request;

/**
 <p>Creates a security group.</p><p>A security group acts as a virtual firewall for your instance to control inbound and outbound traffic. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html">Amazon EC2 Security Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i> and <a href="https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html">Security Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>When you create a security group, you specify a friendly name of your choice. You can have a security group for use in EC2-Classic with the same name as a security group for use in a VPC. However, you can't have two security groups for use in EC2-Classic with the same name or two security groups for use in a VPC with the same name.</p><p>You have a default security group for use in EC2-Classic and a default security group for use in your VPC. If you don't specify a security group when you launch an instance, the instance is launched into the appropriate default security group. A default security group includes a default rule that grants instances unrestricted network access to each other.</p><p>You can add or remove rules from your security groups using <a>AuthorizeSecurityGroupIngress</a>, <a>AuthorizeSecurityGroupEgress</a>, <a>RevokeSecurityGroupIngress</a>, and <a>RevokeSecurityGroupEgress</a>.</p><p>For more information about VPC security group limits, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html">Amazon VPC Limits</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSecurityGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateSecurityGroupRequest
 @see AWSEC2CreateSecurityGroupResult
 */
- (void)createSecurityGroup:(AWSEC2CreateSecurityGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateSecurityGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a snapshot of an EBS volume and stores it in Amazon S3. You can use snapshots for backups, to make copies of EBS volumes, and to save data before shutting down an instance.</p><p>When a snapshot is created, any AWS Marketplace product codes that are associated with the source volume are propagated to the snapshot.</p><p>You can take a snapshot of an attached volume that is in use. However, snapshots only capture data that has been written to your EBS volume at the time the snapshot command is issued; this may exclude any data that has been cached by any applications or the operating system. If you can pause any file systems on the volume long enough to take a snapshot, your snapshot should be complete. However, if you cannot pause all file writes to the volume, you should unmount the volume from within the instance, issue the snapshot command, and then remount the volume to ensure a consistent and complete snapshot. You may remount and use your volume while the snapshot status is <code>pending</code>.</p><p>To create a snapshot for EBS volumes that serve as root devices, you should stop the instance before taking the snapshot.</p><p>Snapshots that are taken from encrypted volumes are automatically encrypted. Volumes that are created from encrypted snapshots are also automatically encrypted. Your encrypted volumes and any associated snapshots always remain protected.</p><p>You can tag your snapshots during creation. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Amazon EC2 Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AmazonEBS.html">Amazon Elastic Block Store</a> and <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2Snapshot`.
 
 @see AWSEC2CreateSnapshotRequest
 @see AWSEC2Snapshot
 */
- (AWSTask<AWSEC2Snapshot *> *)createSnapshot:(AWSEC2CreateSnapshotRequest *)request;

/**
 <p>Creates a snapshot of an EBS volume and stores it in Amazon S3. You can use snapshots for backups, to make copies of EBS volumes, and to save data before shutting down an instance.</p><p>When a snapshot is created, any AWS Marketplace product codes that are associated with the source volume are propagated to the snapshot.</p><p>You can take a snapshot of an attached volume that is in use. However, snapshots only capture data that has been written to your EBS volume at the time the snapshot command is issued; this may exclude any data that has been cached by any applications or the operating system. If you can pause any file systems on the volume long enough to take a snapshot, your snapshot should be complete. However, if you cannot pause all file writes to the volume, you should unmount the volume from within the instance, issue the snapshot command, and then remount the volume to ensure a consistent and complete snapshot. You may remount and use your volume while the snapshot status is <code>pending</code>.</p><p>To create a snapshot for EBS volumes that serve as root devices, you should stop the instance before taking the snapshot.</p><p>Snapshots that are taken from encrypted volumes are automatically encrypted. Volumes that are created from encrypted snapshots are also automatically encrypted. Your encrypted volumes and any associated snapshots always remain protected.</p><p>You can tag your snapshots during creation. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Amazon EC2 Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AmazonEBS.html">Amazon Elastic Block Store</a> and <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateSnapshotRequest
 @see AWSEC2Snapshot
 */
- (void)createSnapshot:(AWSEC2CreateSnapshotRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2Snapshot * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates crash-consistent snapshots of multiple EBS volumes and stores the data in S3. Volumes are chosen by specifying an instance. Any attached volumes will produce one snapshot each that is crash-consistent across the instance. Boot volumes can be excluded by changing the parameters. </p>
 
 @param request A container for the necessary parameters to execute the CreateSnapshots service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateSnapshotsResult`.
 
 @see AWSEC2CreateSnapshotsRequest
 @see AWSEC2CreateSnapshotsResult
 */
- (AWSTask<AWSEC2CreateSnapshotsResult *> *)createSnapshots:(AWSEC2CreateSnapshotsRequest *)request;

/**
 <p>Creates crash-consistent snapshots of multiple EBS volumes and stores the data in S3. Volumes are chosen by specifying an instance. Any attached volumes will produce one snapshot each that is crash-consistent across the instance. Boot volumes can be excluded by changing the parameters. </p>
 
 @param request A container for the necessary parameters to execute the CreateSnapshots service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateSnapshotsRequest
 @see AWSEC2CreateSnapshotsResult
 */
- (void)createSnapshots:(AWSEC2CreateSnapshotsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateSnapshotsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a data feed for Spot Instances, enabling you to view Spot Instance usage logs. You can create one data feed per AWS account. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-data-feeds.html">Spot Instance Data Feed</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSpotDatafeedSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateSpotDatafeedSubscriptionResult`.
 
 @see AWSEC2CreateSpotDatafeedSubscriptionRequest
 @see AWSEC2CreateSpotDatafeedSubscriptionResult
 */
- (AWSTask<AWSEC2CreateSpotDatafeedSubscriptionResult *> *)createSpotDatafeedSubscription:(AWSEC2CreateSpotDatafeedSubscriptionRequest *)request;

/**
 <p>Creates a data feed for Spot Instances, enabling you to view Spot Instance usage logs. You can create one data feed per AWS account. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-data-feeds.html">Spot Instance Data Feed</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSpotDatafeedSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateSpotDatafeedSubscriptionRequest
 @see AWSEC2CreateSpotDatafeedSubscriptionResult
 */
- (void)createSpotDatafeedSubscription:(AWSEC2CreateSpotDatafeedSubscriptionRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateSpotDatafeedSubscriptionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a subnet in an existing VPC.</p><p>When you create each subnet, you provide the VPC ID and IPv4 CIDR block for the subnet. After you create a subnet, you can't change its CIDR block. The size of the subnet's IPv4 CIDR block can be the same as a VPC's IPv4 CIDR block, or a subset of a VPC's IPv4 CIDR block. If you create more than one subnet in a VPC, the subnets' CIDR blocks must not overlap. The smallest IPv4 subnet (and VPC) you can create uses a /28 netmask (16 IPv4 addresses), and the largest uses a /16 netmask (65,536 IPv4 addresses).</p><p>If you've associated an IPv6 CIDR block with your VPC, you can create a subnet with an IPv6 CIDR block that uses a /64 prefix length. </p><important><p>AWS reserves both the first four and the last IPv4 address in each subnet's CIDR block. They're not available for use.</p></important><p>If you add more than one subnet to a VPC, they're set up in a star topology with a logical router in the middle.</p><p>If you launch an instance in a VPC using an Amazon EBS-backed AMI, the IP address doesn't change if you stop and restart the instance (unlike a similar instance launched outside a VPC, which gets a new IP address when restarted). It's therefore possible to have a subnet with no running instances (they're all stopped), but no remaining IP addresses available.</p><p>For more information about subnets, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">Your VPC and Subnets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSubnet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateSubnetResult`.
 
 @see AWSEC2CreateSubnetRequest
 @see AWSEC2CreateSubnetResult
 */
- (AWSTask<AWSEC2CreateSubnetResult *> *)createSubnet:(AWSEC2CreateSubnetRequest *)request;

/**
 <p>Creates a subnet in an existing VPC.</p><p>When you create each subnet, you provide the VPC ID and IPv4 CIDR block for the subnet. After you create a subnet, you can't change its CIDR block. The size of the subnet's IPv4 CIDR block can be the same as a VPC's IPv4 CIDR block, or a subset of a VPC's IPv4 CIDR block. If you create more than one subnet in a VPC, the subnets' CIDR blocks must not overlap. The smallest IPv4 subnet (and VPC) you can create uses a /28 netmask (16 IPv4 addresses), and the largest uses a /16 netmask (65,536 IPv4 addresses).</p><p>If you've associated an IPv6 CIDR block with your VPC, you can create a subnet with an IPv6 CIDR block that uses a /64 prefix length. </p><important><p>AWS reserves both the first four and the last IPv4 address in each subnet's CIDR block. They're not available for use.</p></important><p>If you add more than one subnet to a VPC, they're set up in a star topology with a logical router in the middle.</p><p>If you launch an instance in a VPC using an Amazon EBS-backed AMI, the IP address doesn't change if you stop and restart the instance (unlike a similar instance launched outside a VPC, which gets a new IP address when restarted). It's therefore possible to have a subnet with no running instances (they're all stopped), but no remaining IP addresses available.</p><p>For more information about subnets, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">Your VPC and Subnets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSubnet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateSubnetRequest
 @see AWSEC2CreateSubnetResult
 */
- (void)createSubnet:(AWSEC2CreateSubnetRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateSubnetResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds or overwrites the specified tags for the specified Amazon EC2 resource or resources. Each resource can have a maximum of 50 tags. Each tag consists of a key and optional value. Tag keys must be unique per resource.</p><p>For more information about tags, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. For more information about creating IAM policies that control users' access to resources based on tags, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-iam-actions-resources.html">Supported Resource-Level Permissions for Amazon EC2 API Actions</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2CreateTagsRequest
 */
- (AWSTask *)createTags:(AWSEC2CreateTagsRequest *)request;

/**
 <p>Adds or overwrites the specified tags for the specified Amazon EC2 resource or resources. Each resource can have a maximum of 50 tags. Each tag consists of a key and optional value. Tag keys must be unique per resource.</p><p>For more information about tags, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. For more information about creating IAM policies that control users' access to resources based on tags, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-iam-actions-resources.html">Supported Resource-Level Permissions for Amazon EC2 API Actions</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateTagsRequest
 */
- (void)createTags:(AWSEC2CreateTagsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Traffic Mirror filter.</p><p>A Traffic Mirror filter is a set of rules that defines the traffic to mirror.</p><p>By default, no traffic is mirrored. To mirror traffic, use <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateTrafficMirrorFilterRule.htm">CreateTrafficMirrorFilterRule</a> to add Traffic Mirror rules to the filter. The rules you add define what traffic gets mirrored. You can also use <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_ModifyTrafficMirrorFilterNetworkServices.html">ModifyTrafficMirrorFilterNetworkServices</a> to mirror supported network services.</p>
 
 @param request A container for the necessary parameters to execute the CreateTrafficMirrorFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateTrafficMirrorFilterResult`.
 
 @see AWSEC2CreateTrafficMirrorFilterRequest
 @see AWSEC2CreateTrafficMirrorFilterResult
 */
- (AWSTask<AWSEC2CreateTrafficMirrorFilterResult *> *)createTrafficMirrorFilter:(AWSEC2CreateTrafficMirrorFilterRequest *)request;

/**
 <p>Creates a Traffic Mirror filter.</p><p>A Traffic Mirror filter is a set of rules that defines the traffic to mirror.</p><p>By default, no traffic is mirrored. To mirror traffic, use <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateTrafficMirrorFilterRule.htm">CreateTrafficMirrorFilterRule</a> to add Traffic Mirror rules to the filter. The rules you add define what traffic gets mirrored. You can also use <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_ModifyTrafficMirrorFilterNetworkServices.html">ModifyTrafficMirrorFilterNetworkServices</a> to mirror supported network services.</p>
 
 @param request A container for the necessary parameters to execute the CreateTrafficMirrorFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateTrafficMirrorFilterRequest
 @see AWSEC2CreateTrafficMirrorFilterResult
 */
- (void)createTrafficMirrorFilter:(AWSEC2CreateTrafficMirrorFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateTrafficMirrorFilterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Traffic Mirror filter rule. </p><p>A Traffic Mirror rule defines the Traffic Mirror source traffic to mirror.</p><p>You need the Traffic Mirror filter ID when you create the rule.</p>
 
 @param request A container for the necessary parameters to execute the CreateTrafficMirrorFilterRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateTrafficMirrorFilterRuleResult`.
 
 @see AWSEC2CreateTrafficMirrorFilterRuleRequest
 @see AWSEC2CreateTrafficMirrorFilterRuleResult
 */
- (AWSTask<AWSEC2CreateTrafficMirrorFilterRuleResult *> *)createTrafficMirrorFilterRule:(AWSEC2CreateTrafficMirrorFilterRuleRequest *)request;

/**
 <p>Creates a Traffic Mirror filter rule. </p><p>A Traffic Mirror rule defines the Traffic Mirror source traffic to mirror.</p><p>You need the Traffic Mirror filter ID when you create the rule.</p>
 
 @param request A container for the necessary parameters to execute the CreateTrafficMirrorFilterRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateTrafficMirrorFilterRuleRequest
 @see AWSEC2CreateTrafficMirrorFilterRuleResult
 */
- (void)createTrafficMirrorFilterRule:(AWSEC2CreateTrafficMirrorFilterRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateTrafficMirrorFilterRuleResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Traffic Mirror session.</p><p>A Traffic Mirror session actively copies packets from a Traffic Mirror source to a Traffic Mirror target. Create a filter, and then assign it to the session to define a subset of the traffic to mirror, for example all TCP traffic.</p><p>The Traffic Mirror source and the Traffic Mirror target (monitoring appliances) can be in the same VPC, or in a different VPC connected via VPC peering or a transit gateway. </p><p>By default, no traffic is mirrored. Use <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateTrafficMirrorFilter.htm">CreateTrafficMirrorFilter</a> to create filter rules that specify the traffic to mirror.</p>
 
 @param request A container for the necessary parameters to execute the CreateTrafficMirrorSession service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateTrafficMirrorSessionResult`.
 
 @see AWSEC2CreateTrafficMirrorSessionRequest
 @see AWSEC2CreateTrafficMirrorSessionResult
 */
- (AWSTask<AWSEC2CreateTrafficMirrorSessionResult *> *)createTrafficMirrorSession:(AWSEC2CreateTrafficMirrorSessionRequest *)request;

/**
 <p>Creates a Traffic Mirror session.</p><p>A Traffic Mirror session actively copies packets from a Traffic Mirror source to a Traffic Mirror target. Create a filter, and then assign it to the session to define a subset of the traffic to mirror, for example all TCP traffic.</p><p>The Traffic Mirror source and the Traffic Mirror target (monitoring appliances) can be in the same VPC, or in a different VPC connected via VPC peering or a transit gateway. </p><p>By default, no traffic is mirrored. Use <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateTrafficMirrorFilter.htm">CreateTrafficMirrorFilter</a> to create filter rules that specify the traffic to mirror.</p>
 
 @param request A container for the necessary parameters to execute the CreateTrafficMirrorSession service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateTrafficMirrorSessionRequest
 @see AWSEC2CreateTrafficMirrorSessionResult
 */
- (void)createTrafficMirrorSession:(AWSEC2CreateTrafficMirrorSessionRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateTrafficMirrorSessionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a target for your Traffic Mirror session.</p><p>A Traffic Mirror target is the destination for mirrored traffic. The Traffic Mirror source and the Traffic Mirror target (monitoring appliances) can be in the same VPC, or in different VPCs connected via VPC peering or a transit gateway.</p><p>A Traffic Mirror target can be a network interface, or a Network Load Balancer.</p><p>To use the target in a Traffic Mirror session, use <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateTrafficMirrorSession.htm">CreateTrafficMirrorSession</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateTrafficMirrorTarget service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateTrafficMirrorTargetResult`.
 
 @see AWSEC2CreateTrafficMirrorTargetRequest
 @see AWSEC2CreateTrafficMirrorTargetResult
 */
- (AWSTask<AWSEC2CreateTrafficMirrorTargetResult *> *)createTrafficMirrorTarget:(AWSEC2CreateTrafficMirrorTargetRequest *)request;

/**
 <p>Creates a target for your Traffic Mirror session.</p><p>A Traffic Mirror target is the destination for mirrored traffic. The Traffic Mirror source and the Traffic Mirror target (monitoring appliances) can be in the same VPC, or in different VPCs connected via VPC peering or a transit gateway.</p><p>A Traffic Mirror target can be a network interface, or a Network Load Balancer.</p><p>To use the target in a Traffic Mirror session, use <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateTrafficMirrorSession.htm">CreateTrafficMirrorSession</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateTrafficMirrorTarget service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateTrafficMirrorTargetRequest
 @see AWSEC2CreateTrafficMirrorTargetResult
 */
- (void)createTrafficMirrorTarget:(AWSEC2CreateTrafficMirrorTargetRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateTrafficMirrorTargetResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a transit gateway.</p><p>You can use a transit gateway to interconnect your virtual private clouds (VPC) and on-premises networks. After the transit gateway enters the <code>available</code> state, you can attach your VPCs and VPN connections to the transit gateway.</p><p>To attach your VPCs, use <a>CreateTransitGatewayVpcAttachment</a>.</p><p>To attach a VPN connection, use <a>CreateCustomerGateway</a> to create a customer gateway and specify the ID of the customer gateway and the ID of the transit gateway in a call to <a>CreateVpnConnection</a>.</p><p>When you create a transit gateway, we create a default transit gateway route table and use it as the default association route table and the default propagation route table. You can use <a>CreateTransitGatewayRouteTable</a> to create additional transit gateway route tables. If you disable automatic route propagation, we do not create a default transit gateway route table. You can use <a>EnableTransitGatewayRouteTablePropagation</a> to propagate routes from a resource attachment to a transit gateway route table. If you disable automatic associations, you can use <a>AssociateTransitGatewayRouteTable</a> to associate a resource attachment with a transit gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the CreateTransitGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateTransitGatewayResult`.
 
 @see AWSEC2CreateTransitGatewayRequest
 @see AWSEC2CreateTransitGatewayResult
 */
- (AWSTask<AWSEC2CreateTransitGatewayResult *> *)createTransitGateway:(AWSEC2CreateTransitGatewayRequest *)request;

/**
 <p>Creates a transit gateway.</p><p>You can use a transit gateway to interconnect your virtual private clouds (VPC) and on-premises networks. After the transit gateway enters the <code>available</code> state, you can attach your VPCs and VPN connections to the transit gateway.</p><p>To attach your VPCs, use <a>CreateTransitGatewayVpcAttachment</a>.</p><p>To attach a VPN connection, use <a>CreateCustomerGateway</a> to create a customer gateway and specify the ID of the customer gateway and the ID of the transit gateway in a call to <a>CreateVpnConnection</a>.</p><p>When you create a transit gateway, we create a default transit gateway route table and use it as the default association route table and the default propagation route table. You can use <a>CreateTransitGatewayRouteTable</a> to create additional transit gateway route tables. If you disable automatic route propagation, we do not create a default transit gateway route table. You can use <a>EnableTransitGatewayRouteTablePropagation</a> to propagate routes from a resource attachment to a transit gateway route table. If you disable automatic associations, you can use <a>AssociateTransitGatewayRouteTable</a> to associate a resource attachment with a transit gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the CreateTransitGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateTransitGatewayRequest
 @see AWSEC2CreateTransitGatewayResult
 */
- (void)createTransitGateway:(AWSEC2CreateTransitGatewayRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateTransitGatewayResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a multicast domain using the specified transit gateway.</p><p>The transit gateway must be in the available state before you create a domain. Use <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeTransitGateways.html">DescribeTransitGateways</a> to see the state of transit gateway.</p>
 
 @param request A container for the necessary parameters to execute the CreateTransitGatewayMulticastDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateTransitGatewayMulticastDomainResult`.
 
 @see AWSEC2CreateTransitGatewayMulticastDomainRequest
 @see AWSEC2CreateTransitGatewayMulticastDomainResult
 */
- (AWSTask<AWSEC2CreateTransitGatewayMulticastDomainResult *> *)createTransitGatewayMulticastDomain:(AWSEC2CreateTransitGatewayMulticastDomainRequest *)request;

/**
 <p>Creates a multicast domain using the specified transit gateway.</p><p>The transit gateway must be in the available state before you create a domain. Use <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeTransitGateways.html">DescribeTransitGateways</a> to see the state of transit gateway.</p>
 
 @param request A container for the necessary parameters to execute the CreateTransitGatewayMulticastDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateTransitGatewayMulticastDomainRequest
 @see AWSEC2CreateTransitGatewayMulticastDomainResult
 */
- (void)createTransitGatewayMulticastDomain:(AWSEC2CreateTransitGatewayMulticastDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateTransitGatewayMulticastDomainResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Requests a transit gateway peering attachment between the specified transit gateway (requester) and a peer transit gateway (accepter). The transit gateways must be in different Regions. The peer transit gateway can be in your account or a different AWS account. </p><p>After you create the peering attachment, the owner of the accepter transit gateway must accept the attachment request.</p>
 
 @param request A container for the necessary parameters to execute the CreateTransitGatewayPeeringAttachment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateTransitGatewayPeeringAttachmentResult`.
 
 @see AWSEC2CreateTransitGatewayPeeringAttachmentRequest
 @see AWSEC2CreateTransitGatewayPeeringAttachmentResult
 */
- (AWSTask<AWSEC2CreateTransitGatewayPeeringAttachmentResult *> *)createTransitGatewayPeeringAttachment:(AWSEC2CreateTransitGatewayPeeringAttachmentRequest *)request;

/**
 <p>Requests a transit gateway peering attachment between the specified transit gateway (requester) and a peer transit gateway (accepter). The transit gateways must be in different Regions. The peer transit gateway can be in your account or a different AWS account. </p><p>After you create the peering attachment, the owner of the accepter transit gateway must accept the attachment request.</p>
 
 @param request A container for the necessary parameters to execute the CreateTransitGatewayPeeringAttachment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateTransitGatewayPeeringAttachmentRequest
 @see AWSEC2CreateTransitGatewayPeeringAttachmentResult
 */
- (void)createTransitGatewayPeeringAttachment:(AWSEC2CreateTransitGatewayPeeringAttachmentRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateTransitGatewayPeeringAttachmentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a static route for the specified transit gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the CreateTransitGatewayRoute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateTransitGatewayRouteResult`.
 
 @see AWSEC2CreateTransitGatewayRouteRequest
 @see AWSEC2CreateTransitGatewayRouteResult
 */
- (AWSTask<AWSEC2CreateTransitGatewayRouteResult *> *)createTransitGatewayRoute:(AWSEC2CreateTransitGatewayRouteRequest *)request;

/**
 <p>Creates a static route for the specified transit gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the CreateTransitGatewayRoute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateTransitGatewayRouteRequest
 @see AWSEC2CreateTransitGatewayRouteResult
 */
- (void)createTransitGatewayRoute:(AWSEC2CreateTransitGatewayRouteRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateTransitGatewayRouteResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a route table for the specified transit gateway.</p>
 
 @param request A container for the necessary parameters to execute the CreateTransitGatewayRouteTable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateTransitGatewayRouteTableResult`.
 
 @see AWSEC2CreateTransitGatewayRouteTableRequest
 @see AWSEC2CreateTransitGatewayRouteTableResult
 */
- (AWSTask<AWSEC2CreateTransitGatewayRouteTableResult *> *)createTransitGatewayRouteTable:(AWSEC2CreateTransitGatewayRouteTableRequest *)request;

/**
 <p>Creates a route table for the specified transit gateway.</p>
 
 @param request A container for the necessary parameters to execute the CreateTransitGatewayRouteTable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateTransitGatewayRouteTableRequest
 @see AWSEC2CreateTransitGatewayRouteTableResult
 */
- (void)createTransitGatewayRouteTable:(AWSEC2CreateTransitGatewayRouteTableRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateTransitGatewayRouteTableResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attaches the specified VPC to the specified transit gateway.</p><p>If you attach a VPC with a CIDR range that overlaps the CIDR range of a VPC that is already attached, the new VPC CIDR range is not propagated to the default propagation route table.</p><p>To send VPC traffic to an attached transit gateway, add a route to the VPC route table using <a>CreateRoute</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateTransitGatewayVpcAttachment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateTransitGatewayVpcAttachmentResult`.
 
 @see AWSEC2CreateTransitGatewayVpcAttachmentRequest
 @see AWSEC2CreateTransitGatewayVpcAttachmentResult
 */
- (AWSTask<AWSEC2CreateTransitGatewayVpcAttachmentResult *> *)createTransitGatewayVpcAttachment:(AWSEC2CreateTransitGatewayVpcAttachmentRequest *)request;

/**
 <p>Attaches the specified VPC to the specified transit gateway.</p><p>If you attach a VPC with a CIDR range that overlaps the CIDR range of a VPC that is already attached, the new VPC CIDR range is not propagated to the default propagation route table.</p><p>To send VPC traffic to an attached transit gateway, add a route to the VPC route table using <a>CreateRoute</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateTransitGatewayVpcAttachment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateTransitGatewayVpcAttachmentRequest
 @see AWSEC2CreateTransitGatewayVpcAttachmentResult
 */
- (void)createTransitGatewayVpcAttachment:(AWSEC2CreateTransitGatewayVpcAttachmentRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateTransitGatewayVpcAttachmentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an EBS volume that can be attached to an instance in the same Availability Zone. The volume is created in the regional endpoint that you send the HTTP request to. For more information see <a href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions and Endpoints</a>.</p><p>You can create a new empty volume or restore a volume from an EBS snapshot. Any AWS Marketplace product codes from the snapshot are propagated to the volume.</p><p>You can create encrypted volumes. Encrypted volumes must be attached to instances that support Amazon EBS encryption. Volumes that are created from encrypted snapshots are also automatically encrypted. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>You can tag your volumes during creation. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Amazon EC2 Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-creating-volume.html">Creating an Amazon EBS Volume</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVolume service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2Volume`.
 
 @see AWSEC2CreateVolumeRequest
 @see AWSEC2Volume
 */
- (AWSTask<AWSEC2Volume *> *)createVolume:(AWSEC2CreateVolumeRequest *)request;

/**
 <p>Creates an EBS volume that can be attached to an instance in the same Availability Zone. The volume is created in the regional endpoint that you send the HTTP request to. For more information see <a href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions and Endpoints</a>.</p><p>You can create a new empty volume or restore a volume from an EBS snapshot. Any AWS Marketplace product codes from the snapshot are propagated to the volume.</p><p>You can create encrypted volumes. Encrypted volumes must be attached to instances that support Amazon EBS encryption. Volumes that are created from encrypted snapshots are also automatically encrypted. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>You can tag your volumes during creation. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Amazon EC2 Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-creating-volume.html">Creating an Amazon EBS Volume</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVolume service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateVolumeRequest
 @see AWSEC2Volume
 */
- (void)createVolume:(AWSEC2CreateVolumeRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2Volume * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a VPC with the specified IPv4 CIDR block. The smallest VPC you can create uses a /28 netmask (16 IPv4 addresses), and the largest uses a /16 netmask (65,536 IPv4 addresses). For more information about how large to make your VPC, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">Your VPC and Subnets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>You can optionally request an IPv6 CIDR block for the VPC. You can request an Amazon-provided IPv6 CIDR block from Amazon's pool of IPv6 addresses, or an IPv6 CIDR block from an IPv6 address pool that you provisioned through bring your own IP addresses (<a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html">BYOIP</a>).</p><p>By default, each instance you launch in the VPC has the default DHCP options, which include only a default DNS server that we provide (AmazonProvidedDNS). For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_DHCP_Options.html">DHCP Options Sets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>You can specify the instance tenancy value for the VPC when you create it. You can't change this value for the VPC after you create it. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-instance.html">Dedicated Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpc service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateVpcResult`.
 
 @see AWSEC2CreateVpcRequest
 @see AWSEC2CreateVpcResult
 */
- (AWSTask<AWSEC2CreateVpcResult *> *)createVpc:(AWSEC2CreateVpcRequest *)request;

/**
 <p>Creates a VPC with the specified IPv4 CIDR block. The smallest VPC you can create uses a /28 netmask (16 IPv4 addresses), and the largest uses a /16 netmask (65,536 IPv4 addresses). For more information about how large to make your VPC, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">Your VPC and Subnets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>You can optionally request an IPv6 CIDR block for the VPC. You can request an Amazon-provided IPv6 CIDR block from Amazon's pool of IPv6 addresses, or an IPv6 CIDR block from an IPv6 address pool that you provisioned through bring your own IP addresses (<a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html">BYOIP</a>).</p><p>By default, each instance you launch in the VPC has the default DHCP options, which include only a default DNS server that we provide (AmazonProvidedDNS). For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_DHCP_Options.html">DHCP Options Sets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>You can specify the instance tenancy value for the VPC when you create it. You can't change this value for the VPC after you create it. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-instance.html">Dedicated Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpc service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateVpcRequest
 @see AWSEC2CreateVpcResult
 */
- (void)createVpc:(AWSEC2CreateVpcRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateVpcResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a VPC endpoint for a specified service. An endpoint enables you to create a private connection between your VPC and the service. The service may be provided by AWS, an AWS Marketplace Partner, or another AWS account. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/vpc-endpoints.html">VPC Endpoints</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>A <code>gateway</code> endpoint serves as a target for a route in your route table for traffic destined for the AWS service. You can specify an endpoint policy to attach to the endpoint, which will control access to the service from your VPC. You can also specify the VPC route tables that use the endpoint.</p><p>An <code>interface</code> endpoint is a network interface in your subnet that serves as an endpoint for communicating with the specified service. You can specify the subnets in which to create an endpoint, and the security groups to associate with the endpoint network interface.</p><p>Use <a>DescribeVpcEndpointServices</a> to get a list of supported services.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpcEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateVpcEndpointResult`.
 
 @see AWSEC2CreateVpcEndpointRequest
 @see AWSEC2CreateVpcEndpointResult
 */
- (AWSTask<AWSEC2CreateVpcEndpointResult *> *)createVpcEndpoint:(AWSEC2CreateVpcEndpointRequest *)request;

/**
 <p>Creates a VPC endpoint for a specified service. An endpoint enables you to create a private connection between your VPC and the service. The service may be provided by AWS, an AWS Marketplace Partner, or another AWS account. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/vpc-endpoints.html">VPC Endpoints</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>A <code>gateway</code> endpoint serves as a target for a route in your route table for traffic destined for the AWS service. You can specify an endpoint policy to attach to the endpoint, which will control access to the service from your VPC. You can also specify the VPC route tables that use the endpoint.</p><p>An <code>interface</code> endpoint is a network interface in your subnet that serves as an endpoint for communicating with the specified service. You can specify the subnets in which to create an endpoint, and the security groups to associate with the endpoint network interface.</p><p>Use <a>DescribeVpcEndpointServices</a> to get a list of supported services.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpcEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateVpcEndpointRequest
 @see AWSEC2CreateVpcEndpointResult
 */
- (void)createVpcEndpoint:(AWSEC2CreateVpcEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateVpcEndpointResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a connection notification for a specified VPC endpoint or VPC endpoint service. A connection notification notifies you of specific endpoint events. You must create an SNS topic to receive notifications. For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html">Create a Topic</a> in the <i>Amazon Simple Notification Service Developer Guide</i>.</p><p>You can create a connection notification for interface endpoints only.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpcEndpointConnectionNotification service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateVpcEndpointConnectionNotificationResult`.
 
 @see AWSEC2CreateVpcEndpointConnectionNotificationRequest
 @see AWSEC2CreateVpcEndpointConnectionNotificationResult
 */
- (AWSTask<AWSEC2CreateVpcEndpointConnectionNotificationResult *> *)createVpcEndpointConnectionNotification:(AWSEC2CreateVpcEndpointConnectionNotificationRequest *)request;

/**
 <p>Creates a connection notification for a specified VPC endpoint or VPC endpoint service. A connection notification notifies you of specific endpoint events. You must create an SNS topic to receive notifications. For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html">Create a Topic</a> in the <i>Amazon Simple Notification Service Developer Guide</i>.</p><p>You can create a connection notification for interface endpoints only.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpcEndpointConnectionNotification service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateVpcEndpointConnectionNotificationRequest
 @see AWSEC2CreateVpcEndpointConnectionNotificationResult
 */
- (void)createVpcEndpointConnectionNotification:(AWSEC2CreateVpcEndpointConnectionNotificationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateVpcEndpointConnectionNotificationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a VPC endpoint service configuration to which service consumers (AWS accounts, IAM users, and IAM roles) can connect. Service consumers can create an interface VPC endpoint to connect to your service.</p><p>To create an endpoint service configuration, you must first create a Network Load Balancer for your service. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-service.html">VPC Endpoint Services</a> in the <i>Amazon Virtual Private Cloud User Guide</i>. </p><p>If you set the private DNS name, you must prove that you own the private DNS domain name. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-services-dns-validation.html">VPC Endpoint Service Private DNS Name Verification</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpcEndpointServiceConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateVpcEndpointServiceConfigurationResult`.
 
 @see AWSEC2CreateVpcEndpointServiceConfigurationRequest
 @see AWSEC2CreateVpcEndpointServiceConfigurationResult
 */
- (AWSTask<AWSEC2CreateVpcEndpointServiceConfigurationResult *> *)createVpcEndpointServiceConfiguration:(AWSEC2CreateVpcEndpointServiceConfigurationRequest *)request;

/**
 <p>Creates a VPC endpoint service configuration to which service consumers (AWS accounts, IAM users, and IAM roles) can connect. Service consumers can create an interface VPC endpoint to connect to your service.</p><p>To create an endpoint service configuration, you must first create a Network Load Balancer for your service. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-service.html">VPC Endpoint Services</a> in the <i>Amazon Virtual Private Cloud User Guide</i>. </p><p>If you set the private DNS name, you must prove that you own the private DNS domain name. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-services-dns-validation.html">VPC Endpoint Service Private DNS Name Verification</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpcEndpointServiceConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateVpcEndpointServiceConfigurationRequest
 @see AWSEC2CreateVpcEndpointServiceConfigurationResult
 */
- (void)createVpcEndpointServiceConfiguration:(AWSEC2CreateVpcEndpointServiceConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateVpcEndpointServiceConfigurationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Requests a VPC peering connection between two VPCs: a requester VPC that you own and an accepter VPC with which to create the connection. The accepter VPC can belong to another AWS account and can be in a different Region to the requester VPC. The requester VPC and accepter VPC cannot have overlapping CIDR blocks.</p><note><p>Limitations and rules apply to a VPC peering connection. For more information, see the <a href="https://docs.aws.amazon.com/vpc/latest/peering/vpc-peering-basics.html#vpc-peering-limitations">limitations</a> section in the <i>VPC Peering Guide</i>.</p></note><p>The owner of the accepter VPC must accept the peering request to activate the peering connection. The VPC peering connection request expires after 7 days, after which it cannot be accepted or rejected.</p><p>If you create a VPC peering connection request between VPCs with overlapping CIDR blocks, the VPC peering connection has a status of <code>failed</code>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpcPeeringConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateVpcPeeringConnectionResult`.
 
 @see AWSEC2CreateVpcPeeringConnectionRequest
 @see AWSEC2CreateVpcPeeringConnectionResult
 */
- (AWSTask<AWSEC2CreateVpcPeeringConnectionResult *> *)createVpcPeeringConnection:(AWSEC2CreateVpcPeeringConnectionRequest *)request;

/**
 <p>Requests a VPC peering connection between two VPCs: a requester VPC that you own and an accepter VPC with which to create the connection. The accepter VPC can belong to another AWS account and can be in a different Region to the requester VPC. The requester VPC and accepter VPC cannot have overlapping CIDR blocks.</p><note><p>Limitations and rules apply to a VPC peering connection. For more information, see the <a href="https://docs.aws.amazon.com/vpc/latest/peering/vpc-peering-basics.html#vpc-peering-limitations">limitations</a> section in the <i>VPC Peering Guide</i>.</p></note><p>The owner of the accepter VPC must accept the peering request to activate the peering connection. The VPC peering connection request expires after 7 days, after which it cannot be accepted or rejected.</p><p>If you create a VPC peering connection request between VPCs with overlapping CIDR blocks, the VPC peering connection has a status of <code>failed</code>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpcPeeringConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateVpcPeeringConnectionRequest
 @see AWSEC2CreateVpcPeeringConnectionResult
 */
- (void)createVpcPeeringConnection:(AWSEC2CreateVpcPeeringConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateVpcPeeringConnectionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a VPN connection between an existing virtual private gateway and a VPN customer gateway. The supported connection type is <code>ipsec.1</code>.</p><p>The response includes information that you need to give to your network administrator to configure your customer gateway.</p><important><p>We strongly recommend that you use HTTPS when calling this operation because the response contains sensitive cryptographic information for configuring your customer gateway.</p></important><p>If you decide to shut down your VPN connection for any reason and later create a new VPN connection, you must reconfigure your customer gateway with the new information returned from this call.</p><p>This is an idempotent operation. If you perform the operation more than once, Amazon EC2 doesn't return an error.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html">AWS Site-to-Site VPN</a> in the <i>AWS Site-to-Site VPN User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpnConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateVpnConnectionResult`.
 
 @see AWSEC2CreateVpnConnectionRequest
 @see AWSEC2CreateVpnConnectionResult
 */
- (AWSTask<AWSEC2CreateVpnConnectionResult *> *)createVpnConnection:(AWSEC2CreateVpnConnectionRequest *)request;

/**
 <p>Creates a VPN connection between an existing virtual private gateway and a VPN customer gateway. The supported connection type is <code>ipsec.1</code>.</p><p>The response includes information that you need to give to your network administrator to configure your customer gateway.</p><important><p>We strongly recommend that you use HTTPS when calling this operation because the response contains sensitive cryptographic information for configuring your customer gateway.</p></important><p>If you decide to shut down your VPN connection for any reason and later create a new VPN connection, you must reconfigure your customer gateway with the new information returned from this call.</p><p>This is an idempotent operation. If you perform the operation more than once, Amazon EC2 doesn't return an error.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html">AWS Site-to-Site VPN</a> in the <i>AWS Site-to-Site VPN User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpnConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateVpnConnectionRequest
 @see AWSEC2CreateVpnConnectionResult
 */
- (void)createVpnConnection:(AWSEC2CreateVpnConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateVpnConnectionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a static route associated with a VPN connection between an existing virtual private gateway and a VPN customer gateway. The static route allows traffic to be routed from the virtual private gateway to the VPN customer gateway.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html">AWS Site-to-Site VPN</a> in the <i>AWS Site-to-Site VPN User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpnConnectionRoute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2CreateVpnConnectionRouteRequest
 */
- (AWSTask *)createVpnConnectionRoute:(AWSEC2CreateVpnConnectionRouteRequest *)request;

/**
 <p>Creates a static route associated with a VPN connection between an existing virtual private gateway and a VPN customer gateway. The static route allows traffic to be routed from the virtual private gateway to the VPN customer gateway.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html">AWS Site-to-Site VPN</a> in the <i>AWS Site-to-Site VPN User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpnConnectionRoute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateVpnConnectionRouteRequest
 */
- (void)createVpnConnectionRoute:(AWSEC2CreateVpnConnectionRouteRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates a virtual private gateway. A virtual private gateway is the endpoint on the VPC side of your VPN connection. You can create a virtual private gateway before creating the VPC itself.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html">AWS Site-to-Site VPN</a> in the <i>AWS Site-to-Site VPN User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpnGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateVpnGatewayResult`.
 
 @see AWSEC2CreateVpnGatewayRequest
 @see AWSEC2CreateVpnGatewayResult
 */
- (AWSTask<AWSEC2CreateVpnGatewayResult *> *)createVpnGateway:(AWSEC2CreateVpnGatewayRequest *)request;

/**
 <p>Creates a virtual private gateway. A virtual private gateway is the endpoint on the VPC side of your VPN connection. You can create a virtual private gateway before creating the VPC itself.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html">AWS Site-to-Site VPN</a> in the <i>AWS Site-to-Site VPN User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpnGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateVpnGatewayRequest
 @see AWSEC2CreateVpnGatewayResult
 */
- (void)createVpnGateway:(AWSEC2CreateVpnGatewayRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateVpnGatewayResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified Client VPN endpoint. You must disassociate all target networks before you can delete a Client VPN endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DeleteClientVpnEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteClientVpnEndpointResult`.
 
 @see AWSEC2DeleteClientVpnEndpointRequest
 @see AWSEC2DeleteClientVpnEndpointResult
 */
- (AWSTask<AWSEC2DeleteClientVpnEndpointResult *> *)deleteClientVpnEndpoint:(AWSEC2DeleteClientVpnEndpointRequest *)request;

/**
 <p>Deletes the specified Client VPN endpoint. You must disassociate all target networks before you can delete a Client VPN endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DeleteClientVpnEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteClientVpnEndpointRequest
 @see AWSEC2DeleteClientVpnEndpointResult
 */
- (void)deleteClientVpnEndpoint:(AWSEC2DeleteClientVpnEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteClientVpnEndpointResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a route from a Client VPN endpoint. You can only delete routes that you manually added using the <b>CreateClientVpnRoute</b> action. You cannot delete routes that were automatically added when associating a subnet. To remove routes that have been automatically added, disassociate the target subnet from the Client VPN endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DeleteClientVpnRoute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteClientVpnRouteResult`.
 
 @see AWSEC2DeleteClientVpnRouteRequest
 @see AWSEC2DeleteClientVpnRouteResult
 */
- (AWSTask<AWSEC2DeleteClientVpnRouteResult *> *)deleteClientVpnRoute:(AWSEC2DeleteClientVpnRouteRequest *)request;

/**
 <p>Deletes a route from a Client VPN endpoint. You can only delete routes that you manually added using the <b>CreateClientVpnRoute</b> action. You cannot delete routes that were automatically added when associating a subnet. To remove routes that have been automatically added, disassociate the target subnet from the Client VPN endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DeleteClientVpnRoute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteClientVpnRouteRequest
 @see AWSEC2DeleteClientVpnRouteResult
 */
- (void)deleteClientVpnRoute:(AWSEC2DeleteClientVpnRouteRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteClientVpnRouteResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified customer gateway. You must delete the VPN connection before you can delete the customer gateway.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCustomerGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteCustomerGatewayRequest
 */
- (AWSTask *)deleteCustomerGateway:(AWSEC2DeleteCustomerGatewayRequest *)request;

/**
 <p>Deletes the specified customer gateway. You must delete the VPN connection before you can delete the customer gateway.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCustomerGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteCustomerGatewayRequest
 */
- (void)deleteCustomerGateway:(AWSEC2DeleteCustomerGatewayRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified set of DHCP options. You must disassociate the set of DHCP options before you can delete it. You can disassociate the set of DHCP options by associating either a new set of options or the default set of options with the VPC.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDhcpOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteDhcpOptionsRequest
 */
- (AWSTask *)deleteDhcpOptions:(AWSEC2DeleteDhcpOptionsRequest *)request;

/**
 <p>Deletes the specified set of DHCP options. You must disassociate the set of DHCP options before you can delete it. You can disassociate the set of DHCP options by associating either a new set of options or the default set of options with the VPC.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDhcpOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteDhcpOptionsRequest
 */
- (void)deleteDhcpOptions:(AWSEC2DeleteDhcpOptionsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an egress-only internet gateway.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEgressOnlyInternetGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteEgressOnlyInternetGatewayResult`.
 
 @see AWSEC2DeleteEgressOnlyInternetGatewayRequest
 @see AWSEC2DeleteEgressOnlyInternetGatewayResult
 */
- (AWSTask<AWSEC2DeleteEgressOnlyInternetGatewayResult *> *)deleteEgressOnlyInternetGateway:(AWSEC2DeleteEgressOnlyInternetGatewayRequest *)request;

/**
 <p>Deletes an egress-only internet gateway.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEgressOnlyInternetGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteEgressOnlyInternetGatewayRequest
 @see AWSEC2DeleteEgressOnlyInternetGatewayResult
 */
- (void)deleteEgressOnlyInternetGateway:(AWSEC2DeleteEgressOnlyInternetGatewayRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteEgressOnlyInternetGatewayResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified EC2 Fleet.</p><p>After you delete an EC2 Fleet, it launches no new instances. You must specify whether an EC2 Fleet should also terminate its instances. If you terminate the instances, the EC2 Fleet enters the <code>deleted_terminating</code> state. Otherwise, the EC2 Fleet enters the <code>deleted_running</code> state, and the instances continue to run until they are interrupted or you terminate them manually. </p>
 
 @param request A container for the necessary parameters to execute the DeleteFleets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteFleetsResult`.
 
 @see AWSEC2DeleteFleetsRequest
 @see AWSEC2DeleteFleetsResult
 */
- (AWSTask<AWSEC2DeleteFleetsResult *> *)deleteFleets:(AWSEC2DeleteFleetsRequest *)request;

/**
 <p>Deletes the specified EC2 Fleet.</p><p>After you delete an EC2 Fleet, it launches no new instances. You must specify whether an EC2 Fleet should also terminate its instances. If you terminate the instances, the EC2 Fleet enters the <code>deleted_terminating</code> state. Otherwise, the EC2 Fleet enters the <code>deleted_running</code> state, and the instances continue to run until they are interrupted or you terminate them manually. </p>
 
 @param request A container for the necessary parameters to execute the DeleteFleets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteFleetsRequest
 @see AWSEC2DeleteFleetsResult
 */
- (void)deleteFleets:(AWSEC2DeleteFleetsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteFleetsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes one or more flow logs.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFlowLogs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteFlowLogsResult`.
 
 @see AWSEC2DeleteFlowLogsRequest
 @see AWSEC2DeleteFlowLogsResult
 */
- (AWSTask<AWSEC2DeleteFlowLogsResult *> *)deleteFlowLogs:(AWSEC2DeleteFlowLogsRequest *)request;

/**
 <p>Deletes one or more flow logs.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFlowLogs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteFlowLogsRequest
 @see AWSEC2DeleteFlowLogsResult
 */
- (void)deleteFlowLogs:(AWSEC2DeleteFlowLogsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteFlowLogsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified Amazon FPGA Image (AFI).</p>
 
 @param request A container for the necessary parameters to execute the DeleteFpgaImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteFpgaImageResult`.
 
 @see AWSEC2DeleteFpgaImageRequest
 @see AWSEC2DeleteFpgaImageResult
 */
- (AWSTask<AWSEC2DeleteFpgaImageResult *> *)deleteFpgaImage:(AWSEC2DeleteFpgaImageRequest *)request;

/**
 <p>Deletes the specified Amazon FPGA Image (AFI).</p>
 
 @param request A container for the necessary parameters to execute the DeleteFpgaImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteFpgaImageRequest
 @see AWSEC2DeleteFpgaImageResult
 */
- (void)deleteFpgaImage:(AWSEC2DeleteFpgaImageRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteFpgaImageResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified internet gateway. You must detach the internet gateway from the VPC before you can delete it.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInternetGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteInternetGatewayRequest
 */
- (AWSTask *)deleteInternetGateway:(AWSEC2DeleteInternetGatewayRequest *)request;

/**
 <p>Deletes the specified internet gateway. You must detach the internet gateway from the VPC before you can delete it.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInternetGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteInternetGatewayRequest
 */
- (void)deleteInternetGateway:(AWSEC2DeleteInternetGatewayRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified key pair, by removing the public key from Amazon EC2.</p>
 
 @param request A container for the necessary parameters to execute the DeleteKeyPair service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteKeyPairRequest
 */
- (AWSTask *)deleteKeyPair:(AWSEC2DeleteKeyPairRequest *)request;

/**
 <p>Deletes the specified key pair, by removing the public key from Amazon EC2.</p>
 
 @param request A container for the necessary parameters to execute the DeleteKeyPair service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteKeyPairRequest
 */
- (void)deleteKeyPair:(AWSEC2DeleteKeyPairRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a launch template. Deleting a launch template deletes all of its versions.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLaunchTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteLaunchTemplateResult`.
 
 @see AWSEC2DeleteLaunchTemplateRequest
 @see AWSEC2DeleteLaunchTemplateResult
 */
- (AWSTask<AWSEC2DeleteLaunchTemplateResult *> *)deleteLaunchTemplate:(AWSEC2DeleteLaunchTemplateRequest *)request;

/**
 <p>Deletes a launch template. Deleting a launch template deletes all of its versions.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLaunchTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteLaunchTemplateRequest
 @see AWSEC2DeleteLaunchTemplateResult
 */
- (void)deleteLaunchTemplate:(AWSEC2DeleteLaunchTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteLaunchTemplateResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes one or more versions of a launch template. You cannot delete the default version of a launch template; you must first assign a different version as the default. If the default version is the only version for the launch template, you must delete the entire launch template using <a>DeleteLaunchTemplate</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLaunchTemplateVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteLaunchTemplateVersionsResult`.
 
 @see AWSEC2DeleteLaunchTemplateVersionsRequest
 @see AWSEC2DeleteLaunchTemplateVersionsResult
 */
- (AWSTask<AWSEC2DeleteLaunchTemplateVersionsResult *> *)deleteLaunchTemplateVersions:(AWSEC2DeleteLaunchTemplateVersionsRequest *)request;

/**
 <p>Deletes one or more versions of a launch template. You cannot delete the default version of a launch template; you must first assign a different version as the default. If the default version is the only version for the launch template, you must delete the entire launch template using <a>DeleteLaunchTemplate</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLaunchTemplateVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteLaunchTemplateVersionsRequest
 @see AWSEC2DeleteLaunchTemplateVersionsResult
 */
- (void)deleteLaunchTemplateVersions:(AWSEC2DeleteLaunchTemplateVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteLaunchTemplateVersionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified route from the specified local gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLocalGatewayRoute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteLocalGatewayRouteResult`.
 
 @see AWSEC2DeleteLocalGatewayRouteRequest
 @see AWSEC2DeleteLocalGatewayRouteResult
 */
- (AWSTask<AWSEC2DeleteLocalGatewayRouteResult *> *)deleteLocalGatewayRoute:(AWSEC2DeleteLocalGatewayRouteRequest *)request;

/**
 <p>Deletes the specified route from the specified local gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLocalGatewayRoute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteLocalGatewayRouteRequest
 @see AWSEC2DeleteLocalGatewayRouteResult
 */
- (void)deleteLocalGatewayRoute:(AWSEC2DeleteLocalGatewayRouteRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteLocalGatewayRouteResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified association between a VPC and local gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLocalGatewayRouteTableVpcAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteLocalGatewayRouteTableVpcAssociationResult`.
 
 @see AWSEC2DeleteLocalGatewayRouteTableVpcAssociationRequest
 @see AWSEC2DeleteLocalGatewayRouteTableVpcAssociationResult
 */
- (AWSTask<AWSEC2DeleteLocalGatewayRouteTableVpcAssociationResult *> *)deleteLocalGatewayRouteTableVpcAssociation:(AWSEC2DeleteLocalGatewayRouteTableVpcAssociationRequest *)request;

/**
 <p>Deletes the specified association between a VPC and local gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLocalGatewayRouteTableVpcAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteLocalGatewayRouteTableVpcAssociationRequest
 @see AWSEC2DeleteLocalGatewayRouteTableVpcAssociationResult
 */
- (void)deleteLocalGatewayRouteTableVpcAssociation:(AWSEC2DeleteLocalGatewayRouteTableVpcAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteLocalGatewayRouteTableVpcAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified NAT gateway. Deleting a NAT gateway disassociates its Elastic IP address, but does not release the address from your account. Deleting a NAT gateway does not delete any NAT gateway routes in your route tables.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNatGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteNatGatewayResult`.
 
 @see AWSEC2DeleteNatGatewayRequest
 @see AWSEC2DeleteNatGatewayResult
 */
- (AWSTask<AWSEC2DeleteNatGatewayResult *> *)deleteNatGateway:(AWSEC2DeleteNatGatewayRequest *)request;

/**
 <p>Deletes the specified NAT gateway. Deleting a NAT gateway disassociates its Elastic IP address, but does not release the address from your account. Deleting a NAT gateway does not delete any NAT gateway routes in your route tables.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNatGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteNatGatewayRequest
 @see AWSEC2DeleteNatGatewayResult
 */
- (void)deleteNatGateway:(AWSEC2DeleteNatGatewayRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteNatGatewayResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified network ACL. You can't delete the ACL if it's associated with any subnets. You can't delete the default network ACL.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNetworkAcl service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteNetworkAclRequest
 */
- (AWSTask *)deleteNetworkAcl:(AWSEC2DeleteNetworkAclRequest *)request;

/**
 <p>Deletes the specified network ACL. You can't delete the ACL if it's associated with any subnets. You can't delete the default network ACL.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNetworkAcl service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteNetworkAclRequest
 */
- (void)deleteNetworkAcl:(AWSEC2DeleteNetworkAclRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified ingress or egress entry (rule) from the specified network ACL.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNetworkAclEntry service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteNetworkAclEntryRequest
 */
- (AWSTask *)deleteNetworkAclEntry:(AWSEC2DeleteNetworkAclEntryRequest *)request;

/**
 <p>Deletes the specified ingress or egress entry (rule) from the specified network ACL.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNetworkAclEntry service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteNetworkAclEntryRequest
 */
- (void)deleteNetworkAclEntry:(AWSEC2DeleteNetworkAclEntryRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified network interface. You must detach the network interface before you can delete it.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNetworkInterface service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteNetworkInterfaceRequest
 */
- (AWSTask *)deleteNetworkInterface:(AWSEC2DeleteNetworkInterfaceRequest *)request;

/**
 <p>Deletes the specified network interface. You must detach the network interface before you can delete it.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNetworkInterface service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteNetworkInterfaceRequest
 */
- (void)deleteNetworkInterface:(AWSEC2DeleteNetworkInterfaceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a permission for a network interface. By default, you cannot delete the permission if the account for which you're removing the permission has attached the network interface to an instance. However, you can force delete the permission, regardless of any attachment.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNetworkInterfacePermission service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteNetworkInterfacePermissionResult`.
 
 @see AWSEC2DeleteNetworkInterfacePermissionRequest
 @see AWSEC2DeleteNetworkInterfacePermissionResult
 */
- (AWSTask<AWSEC2DeleteNetworkInterfacePermissionResult *> *)deleteNetworkInterfacePermission:(AWSEC2DeleteNetworkInterfacePermissionRequest *)request;

/**
 <p>Deletes a permission for a network interface. By default, you cannot delete the permission if the account for which you're removing the permission has attached the network interface to an instance. However, you can force delete the permission, regardless of any attachment.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNetworkInterfacePermission service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteNetworkInterfacePermissionRequest
 @see AWSEC2DeleteNetworkInterfacePermissionResult
 */
- (void)deleteNetworkInterfacePermission:(AWSEC2DeleteNetworkInterfacePermissionRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteNetworkInterfacePermissionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified placement group. You must terminate all instances in the placement group before you can delete the placement group. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">Placement Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeletePlacementGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeletePlacementGroupRequest
 */
- (AWSTask *)deletePlacementGroup:(AWSEC2DeletePlacementGroupRequest *)request;

/**
 <p>Deletes the specified placement group. You must terminate all instances in the placement group before you can delete the placement group. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">Placement Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeletePlacementGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeletePlacementGroupRequest
 */
- (void)deletePlacementGroup:(AWSEC2DeletePlacementGroupRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the queued purchases for the specified Reserved Instances.</p>
 
 @param request A container for the necessary parameters to execute the DeleteQueuedReservedInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteQueuedReservedInstancesResult`.
 
 @see AWSEC2DeleteQueuedReservedInstancesRequest
 @see AWSEC2DeleteQueuedReservedInstancesResult
 */
- (AWSTask<AWSEC2DeleteQueuedReservedInstancesResult *> *)deleteQueuedReservedInstances:(AWSEC2DeleteQueuedReservedInstancesRequest *)request;

/**
 <p>Deletes the queued purchases for the specified Reserved Instances.</p>
 
 @param request A container for the necessary parameters to execute the DeleteQueuedReservedInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteQueuedReservedInstancesRequest
 @see AWSEC2DeleteQueuedReservedInstancesResult
 */
- (void)deleteQueuedReservedInstances:(AWSEC2DeleteQueuedReservedInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteQueuedReservedInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified route from the specified route table.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRoute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteRouteRequest
 */
- (AWSTask *)deleteRoute:(AWSEC2DeleteRouteRequest *)request;

/**
 <p>Deletes the specified route from the specified route table.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRoute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteRouteRequest
 */
- (void)deleteRoute:(AWSEC2DeleteRouteRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified route table. You must disassociate the route table from any subnets before you can delete it. You can't delete the main route table.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRouteTable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteRouteTableRequest
 */
- (AWSTask *)deleteRouteTable:(AWSEC2DeleteRouteTableRequest *)request;

/**
 <p>Deletes the specified route table. You must disassociate the route table from any subnets before you can delete it. You can't delete the main route table.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRouteTable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteRouteTableRequest
 */
- (void)deleteRouteTable:(AWSEC2DeleteRouteTableRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a security group.</p><p>If you attempt to delete a security group that is associated with an instance, or is referenced by another security group, the operation fails with <code>InvalidGroup.InUse</code> in EC2-Classic or <code>DependencyViolation</code> in EC2-VPC.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSecurityGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteSecurityGroupRequest
 */
- (AWSTask *)deleteSecurityGroup:(AWSEC2DeleteSecurityGroupRequest *)request;

/**
 <p>Deletes a security group.</p><p>If you attempt to delete a security group that is associated with an instance, or is referenced by another security group, the operation fails with <code>InvalidGroup.InUse</code> in EC2-Classic or <code>DependencyViolation</code> in EC2-VPC.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSecurityGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteSecurityGroupRequest
 */
- (void)deleteSecurityGroup:(AWSEC2DeleteSecurityGroupRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified snapshot.</p><p>When you make periodic snapshots of a volume, the snapshots are incremental, and only the blocks on the device that have changed since your last snapshot are saved in the new snapshot. When you delete a snapshot, only the data not needed for any other snapshot is removed. So regardless of which prior snapshots have been deleted, all active snapshots will have access to all the information needed to restore the volume.</p><p>You cannot delete a snapshot of the root device of an EBS volume used by a registered AMI. You must first de-register the AMI before you can delete the snapshot.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-deleting-snapshot.html">Deleting an Amazon EBS Snapshot</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteSnapshotRequest
 */
- (AWSTask *)deleteSnapshot:(AWSEC2DeleteSnapshotRequest *)request;

/**
 <p>Deletes the specified snapshot.</p><p>When you make periodic snapshots of a volume, the snapshots are incremental, and only the blocks on the device that have changed since your last snapshot are saved in the new snapshot. When you delete a snapshot, only the data not needed for any other snapshot is removed. So regardless of which prior snapshots have been deleted, all active snapshots will have access to all the information needed to restore the volume.</p><p>You cannot delete a snapshot of the root device of an EBS volume used by a registered AMI. You must first de-register the AMI before you can delete the snapshot.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-deleting-snapshot.html">Deleting an Amazon EBS Snapshot</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteSnapshotRequest
 */
- (void)deleteSnapshot:(AWSEC2DeleteSnapshotRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the data feed for Spot Instances.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSpotDatafeedSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteSpotDatafeedSubscriptionRequest
 */
- (AWSTask *)deleteSpotDatafeedSubscription:(AWSEC2DeleteSpotDatafeedSubscriptionRequest *)request;

/**
 <p>Deletes the data feed for Spot Instances.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSpotDatafeedSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteSpotDatafeedSubscriptionRequest
 */
- (void)deleteSpotDatafeedSubscription:(AWSEC2DeleteSpotDatafeedSubscriptionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified subnet. You must terminate all running instances in the subnet before you can delete the subnet.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSubnet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteSubnetRequest
 */
- (AWSTask *)deleteSubnet:(AWSEC2DeleteSubnetRequest *)request;

/**
 <p>Deletes the specified subnet. You must terminate all running instances in the subnet before you can delete the subnet.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSubnet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteSubnetRequest
 */
- (void)deleteSubnet:(AWSEC2DeleteSubnetRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified set of tags from the specified set of resources.</p><p>To list the current tags, use <a>DescribeTags</a>. For more information about tags, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteTagsRequest
 */
- (AWSTask *)deleteTags:(AWSEC2DeleteTagsRequest *)request;

/**
 <p>Deletes the specified set of tags from the specified set of resources.</p><p>To list the current tags, use <a>DescribeTags</a>. For more information about tags, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteTagsRequest
 */
- (void)deleteTags:(AWSEC2DeleteTagsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified Traffic Mirror filter.</p><p>You cannot delete a Traffic Mirror filter that is in use by a Traffic Mirror session.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrafficMirrorFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteTrafficMirrorFilterResult`.
 
 @see AWSEC2DeleteTrafficMirrorFilterRequest
 @see AWSEC2DeleteTrafficMirrorFilterResult
 */
- (AWSTask<AWSEC2DeleteTrafficMirrorFilterResult *> *)deleteTrafficMirrorFilter:(AWSEC2DeleteTrafficMirrorFilterRequest *)request;

/**
 <p>Deletes the specified Traffic Mirror filter.</p><p>You cannot delete a Traffic Mirror filter that is in use by a Traffic Mirror session.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrafficMirrorFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteTrafficMirrorFilterRequest
 @see AWSEC2DeleteTrafficMirrorFilterResult
 */
- (void)deleteTrafficMirrorFilter:(AWSEC2DeleteTrafficMirrorFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteTrafficMirrorFilterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified Traffic Mirror rule.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrafficMirrorFilterRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteTrafficMirrorFilterRuleResult`.
 
 @see AWSEC2DeleteTrafficMirrorFilterRuleRequest
 @see AWSEC2DeleteTrafficMirrorFilterRuleResult
 */
- (AWSTask<AWSEC2DeleteTrafficMirrorFilterRuleResult *> *)deleteTrafficMirrorFilterRule:(AWSEC2DeleteTrafficMirrorFilterRuleRequest *)request;

/**
 <p>Deletes the specified Traffic Mirror rule.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrafficMirrorFilterRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteTrafficMirrorFilterRuleRequest
 @see AWSEC2DeleteTrafficMirrorFilterRuleResult
 */
- (void)deleteTrafficMirrorFilterRule:(AWSEC2DeleteTrafficMirrorFilterRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteTrafficMirrorFilterRuleResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified Traffic Mirror session.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrafficMirrorSession service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteTrafficMirrorSessionResult`.
 
 @see AWSEC2DeleteTrafficMirrorSessionRequest
 @see AWSEC2DeleteTrafficMirrorSessionResult
 */
- (AWSTask<AWSEC2DeleteTrafficMirrorSessionResult *> *)deleteTrafficMirrorSession:(AWSEC2DeleteTrafficMirrorSessionRequest *)request;

/**
 <p>Deletes the specified Traffic Mirror session.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrafficMirrorSession service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteTrafficMirrorSessionRequest
 @see AWSEC2DeleteTrafficMirrorSessionResult
 */
- (void)deleteTrafficMirrorSession:(AWSEC2DeleteTrafficMirrorSessionRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteTrafficMirrorSessionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified Traffic Mirror target.</p><p>You cannot delete a Traffic Mirror target that is in use by a Traffic Mirror session.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrafficMirrorTarget service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteTrafficMirrorTargetResult`.
 
 @see AWSEC2DeleteTrafficMirrorTargetRequest
 @see AWSEC2DeleteTrafficMirrorTargetResult
 */
- (AWSTask<AWSEC2DeleteTrafficMirrorTargetResult *> *)deleteTrafficMirrorTarget:(AWSEC2DeleteTrafficMirrorTargetRequest *)request;

/**
 <p>Deletes the specified Traffic Mirror target.</p><p>You cannot delete a Traffic Mirror target that is in use by a Traffic Mirror session.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTrafficMirrorTarget service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteTrafficMirrorTargetRequest
 @see AWSEC2DeleteTrafficMirrorTargetResult
 */
- (void)deleteTrafficMirrorTarget:(AWSEC2DeleteTrafficMirrorTargetRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteTrafficMirrorTargetResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified transit gateway.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTransitGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteTransitGatewayResult`.
 
 @see AWSEC2DeleteTransitGatewayRequest
 @see AWSEC2DeleteTransitGatewayResult
 */
- (AWSTask<AWSEC2DeleteTransitGatewayResult *> *)deleteTransitGateway:(AWSEC2DeleteTransitGatewayRequest *)request;

/**
 <p>Deletes the specified transit gateway.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTransitGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteTransitGatewayRequest
 @see AWSEC2DeleteTransitGatewayResult
 */
- (void)deleteTransitGateway:(AWSEC2DeleteTransitGatewayRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteTransitGatewayResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified transit gateway multicast domain.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTransitGatewayMulticastDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteTransitGatewayMulticastDomainResult`.
 
 @see AWSEC2DeleteTransitGatewayMulticastDomainRequest
 @see AWSEC2DeleteTransitGatewayMulticastDomainResult
 */
- (AWSTask<AWSEC2DeleteTransitGatewayMulticastDomainResult *> *)deleteTransitGatewayMulticastDomain:(AWSEC2DeleteTransitGatewayMulticastDomainRequest *)request;

/**
 <p>Deletes the specified transit gateway multicast domain.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTransitGatewayMulticastDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteTransitGatewayMulticastDomainRequest
 @see AWSEC2DeleteTransitGatewayMulticastDomainResult
 */
- (void)deleteTransitGatewayMulticastDomain:(AWSEC2DeleteTransitGatewayMulticastDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteTransitGatewayMulticastDomainResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a transit gateway peering attachment.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTransitGatewayPeeringAttachment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteTransitGatewayPeeringAttachmentResult`.
 
 @see AWSEC2DeleteTransitGatewayPeeringAttachmentRequest
 @see AWSEC2DeleteTransitGatewayPeeringAttachmentResult
 */
- (AWSTask<AWSEC2DeleteTransitGatewayPeeringAttachmentResult *> *)deleteTransitGatewayPeeringAttachment:(AWSEC2DeleteTransitGatewayPeeringAttachmentRequest *)request;

/**
 <p>Deletes a transit gateway peering attachment.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTransitGatewayPeeringAttachment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteTransitGatewayPeeringAttachmentRequest
 @see AWSEC2DeleteTransitGatewayPeeringAttachmentResult
 */
- (void)deleteTransitGatewayPeeringAttachment:(AWSEC2DeleteTransitGatewayPeeringAttachmentRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteTransitGatewayPeeringAttachmentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified route from the specified transit gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTransitGatewayRoute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteTransitGatewayRouteResult`.
 
 @see AWSEC2DeleteTransitGatewayRouteRequest
 @see AWSEC2DeleteTransitGatewayRouteResult
 */
- (AWSTask<AWSEC2DeleteTransitGatewayRouteResult *> *)deleteTransitGatewayRoute:(AWSEC2DeleteTransitGatewayRouteRequest *)request;

/**
 <p>Deletes the specified route from the specified transit gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTransitGatewayRoute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteTransitGatewayRouteRequest
 @see AWSEC2DeleteTransitGatewayRouteResult
 */
- (void)deleteTransitGatewayRoute:(AWSEC2DeleteTransitGatewayRouteRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteTransitGatewayRouteResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified transit gateway route table. You must disassociate the route table from any transit gateway route tables before you can delete it.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTransitGatewayRouteTable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteTransitGatewayRouteTableResult`.
 
 @see AWSEC2DeleteTransitGatewayRouteTableRequest
 @see AWSEC2DeleteTransitGatewayRouteTableResult
 */
- (AWSTask<AWSEC2DeleteTransitGatewayRouteTableResult *> *)deleteTransitGatewayRouteTable:(AWSEC2DeleteTransitGatewayRouteTableRequest *)request;

/**
 <p>Deletes the specified transit gateway route table. You must disassociate the route table from any transit gateway route tables before you can delete it.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTransitGatewayRouteTable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteTransitGatewayRouteTableRequest
 @see AWSEC2DeleteTransitGatewayRouteTableResult
 */
- (void)deleteTransitGatewayRouteTable:(AWSEC2DeleteTransitGatewayRouteTableRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteTransitGatewayRouteTableResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified VPC attachment.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTransitGatewayVpcAttachment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteTransitGatewayVpcAttachmentResult`.
 
 @see AWSEC2DeleteTransitGatewayVpcAttachmentRequest
 @see AWSEC2DeleteTransitGatewayVpcAttachmentResult
 */
- (AWSTask<AWSEC2DeleteTransitGatewayVpcAttachmentResult *> *)deleteTransitGatewayVpcAttachment:(AWSEC2DeleteTransitGatewayVpcAttachmentRequest *)request;

/**
 <p>Deletes the specified VPC attachment.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTransitGatewayVpcAttachment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteTransitGatewayVpcAttachmentRequest
 @see AWSEC2DeleteTransitGatewayVpcAttachmentResult
 */
- (void)deleteTransitGatewayVpcAttachment:(AWSEC2DeleteTransitGatewayVpcAttachmentRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteTransitGatewayVpcAttachmentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified EBS volume. The volume must be in the <code>available</code> state (not attached to an instance).</p><p>The volume can remain in the <code>deleting</code> state for several minutes.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-deleting-volume.html">Deleting an Amazon EBS Volume</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVolume service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteVolumeRequest
 */
- (AWSTask *)deleteVolume:(AWSEC2DeleteVolumeRequest *)request;

/**
 <p>Deletes the specified EBS volume. The volume must be in the <code>available</code> state (not attached to an instance).</p><p>The volume can remain in the <code>deleting</code> state for several minutes.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-deleting-volume.html">Deleting an Amazon EBS Volume</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVolume service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteVolumeRequest
 */
- (void)deleteVolume:(AWSEC2DeleteVolumeRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified VPC. You must detach or delete all gateways and resources that are associated with the VPC before you can delete it. For example, you must terminate all instances running in the VPC, delete all security groups associated with the VPC (except the default one), delete all route tables associated with the VPC (except the default one), and so on.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVpc service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteVpcRequest
 */
- (AWSTask *)deleteVpc:(AWSEC2DeleteVpcRequest *)request;

/**
 <p>Deletes the specified VPC. You must detach or delete all gateways and resources that are associated with the VPC before you can delete it. For example, you must terminate all instances running in the VPC, delete all security groups associated with the VPC (except the default one), delete all route tables associated with the VPC (except the default one), and so on.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVpc service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteVpcRequest
 */
- (void)deleteVpc:(AWSEC2DeleteVpcRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes one or more VPC endpoint connection notifications.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVpcEndpointConnectionNotifications service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteVpcEndpointConnectionNotificationsResult`.
 
 @see AWSEC2DeleteVpcEndpointConnectionNotificationsRequest
 @see AWSEC2DeleteVpcEndpointConnectionNotificationsResult
 */
- (AWSTask<AWSEC2DeleteVpcEndpointConnectionNotificationsResult *> *)deleteVpcEndpointConnectionNotifications:(AWSEC2DeleteVpcEndpointConnectionNotificationsRequest *)request;

/**
 <p>Deletes one or more VPC endpoint connection notifications.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVpcEndpointConnectionNotifications service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteVpcEndpointConnectionNotificationsRequest
 @see AWSEC2DeleteVpcEndpointConnectionNotificationsResult
 */
- (void)deleteVpcEndpointConnectionNotifications:(AWSEC2DeleteVpcEndpointConnectionNotificationsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteVpcEndpointConnectionNotificationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes one or more VPC endpoint service configurations in your account. Before you delete the endpoint service configuration, you must reject any <code>Available</code> or <code>PendingAcceptance</code> interface endpoint connections that are attached to the service.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVpcEndpointServiceConfigurations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteVpcEndpointServiceConfigurationsResult`.
 
 @see AWSEC2DeleteVpcEndpointServiceConfigurationsRequest
 @see AWSEC2DeleteVpcEndpointServiceConfigurationsResult
 */
- (AWSTask<AWSEC2DeleteVpcEndpointServiceConfigurationsResult *> *)deleteVpcEndpointServiceConfigurations:(AWSEC2DeleteVpcEndpointServiceConfigurationsRequest *)request;

/**
 <p>Deletes one or more VPC endpoint service configurations in your account. Before you delete the endpoint service configuration, you must reject any <code>Available</code> or <code>PendingAcceptance</code> interface endpoint connections that are attached to the service.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVpcEndpointServiceConfigurations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteVpcEndpointServiceConfigurationsRequest
 @see AWSEC2DeleteVpcEndpointServiceConfigurationsResult
 */
- (void)deleteVpcEndpointServiceConfigurations:(AWSEC2DeleteVpcEndpointServiceConfigurationsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteVpcEndpointServiceConfigurationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes one or more specified VPC endpoints. Deleting a gateway endpoint also deletes the endpoint routes in the route tables that were associated with the endpoint. Deleting an interface endpoint deletes the endpoint network interfaces.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVpcEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteVpcEndpointsResult`.
 
 @see AWSEC2DeleteVpcEndpointsRequest
 @see AWSEC2DeleteVpcEndpointsResult
 */
- (AWSTask<AWSEC2DeleteVpcEndpointsResult *> *)deleteVpcEndpoints:(AWSEC2DeleteVpcEndpointsRequest *)request;

/**
 <p>Deletes one or more specified VPC endpoints. Deleting a gateway endpoint also deletes the endpoint routes in the route tables that were associated with the endpoint. Deleting an interface endpoint deletes the endpoint network interfaces.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVpcEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteVpcEndpointsRequest
 @see AWSEC2DeleteVpcEndpointsResult
 */
- (void)deleteVpcEndpoints:(AWSEC2DeleteVpcEndpointsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteVpcEndpointsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a VPC peering connection. Either the owner of the requester VPC or the owner of the accepter VPC can delete the VPC peering connection if it's in the <code>active</code> state. The owner of the requester VPC can delete a VPC peering connection in the <code>pending-acceptance</code> state. You cannot delete a VPC peering connection that's in the <code>failed</code> state.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVpcPeeringConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteVpcPeeringConnectionResult`.
 
 @see AWSEC2DeleteVpcPeeringConnectionRequest
 @see AWSEC2DeleteVpcPeeringConnectionResult
 */
- (AWSTask<AWSEC2DeleteVpcPeeringConnectionResult *> *)deleteVpcPeeringConnection:(AWSEC2DeleteVpcPeeringConnectionRequest *)request;

/**
 <p>Deletes a VPC peering connection. Either the owner of the requester VPC or the owner of the accepter VPC can delete the VPC peering connection if it's in the <code>active</code> state. The owner of the requester VPC can delete a VPC peering connection in the <code>pending-acceptance</code> state. You cannot delete a VPC peering connection that's in the <code>failed</code> state.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVpcPeeringConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteVpcPeeringConnectionRequest
 @see AWSEC2DeleteVpcPeeringConnectionResult
 */
- (void)deleteVpcPeeringConnection:(AWSEC2DeleteVpcPeeringConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeleteVpcPeeringConnectionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified VPN connection.</p><p>If you're deleting the VPC and its associated components, we recommend that you detach the virtual private gateway from the VPC and delete the VPC before deleting the VPN connection. If you believe that the tunnel credentials for your VPN connection have been compromised, you can delete the VPN connection and create a new one that has new keys, without needing to delete the VPC or virtual private gateway. If you create a new VPN connection, you must reconfigure the customer gateway using the new configuration information returned with the new VPN connection ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVpnConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteVpnConnectionRequest
 */
- (AWSTask *)deleteVpnConnection:(AWSEC2DeleteVpnConnectionRequest *)request;

/**
 <p>Deletes the specified VPN connection.</p><p>If you're deleting the VPC and its associated components, we recommend that you detach the virtual private gateway from the VPC and delete the VPC before deleting the VPN connection. If you believe that the tunnel credentials for your VPN connection have been compromised, you can delete the VPN connection and create a new one that has new keys, without needing to delete the VPC or virtual private gateway. If you create a new VPN connection, you must reconfigure the customer gateway using the new configuration information returned with the new VPN connection ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVpnConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteVpnConnectionRequest
 */
- (void)deleteVpnConnection:(AWSEC2DeleteVpnConnectionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified static route associated with a VPN connection between an existing virtual private gateway and a VPN customer gateway. The static route allows traffic to be routed from the virtual private gateway to the VPN customer gateway.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVpnConnectionRoute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteVpnConnectionRouteRequest
 */
- (AWSTask *)deleteVpnConnectionRoute:(AWSEC2DeleteVpnConnectionRouteRequest *)request;

/**
 <p>Deletes the specified static route associated with a VPN connection between an existing virtual private gateway and a VPN customer gateway. The static route allows traffic to be routed from the virtual private gateway to the VPN customer gateway.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVpnConnectionRoute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteVpnConnectionRouteRequest
 */
- (void)deleteVpnConnectionRoute:(AWSEC2DeleteVpnConnectionRouteRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified virtual private gateway. You must first detach the virtual private gateway from the VPC. Note that you don't need to delete the virtual private gateway if you plan to delete and recreate the VPN connection between your VPC and your network.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVpnGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteVpnGatewayRequest
 */
- (AWSTask *)deleteVpnGateway:(AWSEC2DeleteVpnGatewayRequest *)request;

/**
 <p>Deletes the specified virtual private gateway. You must first detach the virtual private gateway from the VPC. Note that you don't need to delete the virtual private gateway if you plan to delete and recreate the VPN connection between your VPC and your network.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVpnGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteVpnGatewayRequest
 */
- (void)deleteVpnGateway:(AWSEC2DeleteVpnGatewayRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Releases the specified address range that you provisioned for use with your AWS resources through bring your own IP addresses (BYOIP) and deletes the corresponding address pool.</p><p>Before you can release an address range, you must stop advertising it using <a>WithdrawByoipCidr</a> and you must not have any IP addresses allocated from its address range.</p>
 
 @param request A container for the necessary parameters to execute the DeprovisionByoipCidr service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeprovisionByoipCidrResult`.
 
 @see AWSEC2DeprovisionByoipCidrRequest
 @see AWSEC2DeprovisionByoipCidrResult
 */
- (AWSTask<AWSEC2DeprovisionByoipCidrResult *> *)deprovisionByoipCidr:(AWSEC2DeprovisionByoipCidrRequest *)request;

/**
 <p>Releases the specified address range that you provisioned for use with your AWS resources through bring your own IP addresses (BYOIP) and deletes the corresponding address pool.</p><p>Before you can release an address range, you must stop advertising it using <a>WithdrawByoipCidr</a> and you must not have any IP addresses allocated from its address range.</p>
 
 @param request A container for the necessary parameters to execute the DeprovisionByoipCidr service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeprovisionByoipCidrRequest
 @see AWSEC2DeprovisionByoipCidrResult
 */
- (void)deprovisionByoipCidr:(AWSEC2DeprovisionByoipCidrRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeprovisionByoipCidrResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deregisters the specified AMI. After you deregister an AMI, it can't be used to launch new instances; however, it doesn't affect any instances that you've already launched from the AMI. You'll continue to incur usage costs for those instances until you terminate them.</p><p>When you deregister an Amazon EBS-backed AMI, it doesn't affect the snapshot that was created for the root volume of the instance during the AMI creation process. When you deregister an instance store-backed AMI, it doesn't affect the files that you uploaded to Amazon S3 when you created the AMI.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeregisterImageRequest
 */
- (AWSTask *)deregisterImage:(AWSEC2DeregisterImageRequest *)request;

/**
 <p>Deregisters the specified AMI. After you deregister an AMI, it can't be used to launch new instances; however, it doesn't affect any instances that you've already launched from the AMI. You'll continue to incur usage costs for those instances until you terminate them.</p><p>When you deregister an Amazon EBS-backed AMI, it doesn't affect the snapshot that was created for the root volume of the instance during the AMI creation process. When you deregister an instance store-backed AMI, it doesn't affect the files that you uploaded to Amazon S3 when you created the AMI.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeregisterImageRequest
 */
- (void)deregisterImage:(AWSEC2DeregisterImageRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deregisters the specified members (network interfaces) from the transit gateway multicast group.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterTransitGatewayMulticastGroupMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeregisterTransitGatewayMulticastGroupMembersResult`.
 
 @see AWSEC2DeregisterTransitGatewayMulticastGroupMembersRequest
 @see AWSEC2DeregisterTransitGatewayMulticastGroupMembersResult
 */
- (AWSTask<AWSEC2DeregisterTransitGatewayMulticastGroupMembersResult *> *)deregisterTransitGatewayMulticastGroupMembers:(AWSEC2DeregisterTransitGatewayMulticastGroupMembersRequest *)request;

/**
 <p>Deregisters the specified members (network interfaces) from the transit gateway multicast group.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterTransitGatewayMulticastGroupMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeregisterTransitGatewayMulticastGroupMembersRequest
 @see AWSEC2DeregisterTransitGatewayMulticastGroupMembersResult
 */
- (void)deregisterTransitGatewayMulticastGroupMembers:(AWSEC2DeregisterTransitGatewayMulticastGroupMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeregisterTransitGatewayMulticastGroupMembersResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deregisters the specified sources (network interfaces) from the transit gateway multicast group.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterTransitGatewayMulticastGroupSources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeregisterTransitGatewayMulticastGroupSourcesResult`.
 
 @see AWSEC2DeregisterTransitGatewayMulticastGroupSourcesRequest
 @see AWSEC2DeregisterTransitGatewayMulticastGroupSourcesResult
 */
- (AWSTask<AWSEC2DeregisterTransitGatewayMulticastGroupSourcesResult *> *)deregisterTransitGatewayMulticastGroupSources:(AWSEC2DeregisterTransitGatewayMulticastGroupSourcesRequest *)request;

/**
 <p>Deregisters the specified sources (network interfaces) from the transit gateway multicast group.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterTransitGatewayMulticastGroupSources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeregisterTransitGatewayMulticastGroupSourcesRequest
 @see AWSEC2DeregisterTransitGatewayMulticastGroupSourcesResult
 */
- (void)deregisterTransitGatewayMulticastGroupSources:(AWSEC2DeregisterTransitGatewayMulticastGroupSourcesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DeregisterTransitGatewayMulticastGroupSourcesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes attributes of your AWS account. The following are the supported account attributes:</p><ul><li><p><code>supported-platforms</code>: Indicates whether your account can launch instances into EC2-Classic and EC2-VPC, or only into EC2-VPC.</p></li><li><p><code>default-vpc</code>: The ID of the default VPC for your account, or <code>none</code>.</p></li><li><p><code>max-instances</code>: This attribute is no longer supported. The returned value does not reflect your actual vCPU limit for running On-Demand Instances. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-on-demand-instances.html#ec2-on-demand-instances-limits">On-Demand Instance Limits</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p></li><li><p><code>vpc-max-security-groups-per-interface</code>: The maximum number of security groups that you can assign to a network interface.</p></li><li><p><code>max-elastic-ips</code>: The maximum number of Elastic IP addresses that you can allocate for use with EC2-Classic. </p></li><li><p><code>vpc-max-elastic-ips</code>: The maximum number of Elastic IP addresses that you can allocate for use with EC2-VPC.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeAccountAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeAccountAttributesResult`.
 
 @see AWSEC2DescribeAccountAttributesRequest
 @see AWSEC2DescribeAccountAttributesResult
 */
- (AWSTask<AWSEC2DescribeAccountAttributesResult *> *)describeAccountAttributes:(AWSEC2DescribeAccountAttributesRequest *)request;

/**
 <p>Describes attributes of your AWS account. The following are the supported account attributes:</p><ul><li><p><code>supported-platforms</code>: Indicates whether your account can launch instances into EC2-Classic and EC2-VPC, or only into EC2-VPC.</p></li><li><p><code>default-vpc</code>: The ID of the default VPC for your account, or <code>none</code>.</p></li><li><p><code>max-instances</code>: This attribute is no longer supported. The returned value does not reflect your actual vCPU limit for running On-Demand Instances. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-on-demand-instances.html#ec2-on-demand-instances-limits">On-Demand Instance Limits</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p></li><li><p><code>vpc-max-security-groups-per-interface</code>: The maximum number of security groups that you can assign to a network interface.</p></li><li><p><code>max-elastic-ips</code>: The maximum number of Elastic IP addresses that you can allocate for use with EC2-Classic. </p></li><li><p><code>vpc-max-elastic-ips</code>: The maximum number of Elastic IP addresses that you can allocate for use with EC2-VPC.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeAccountAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeAccountAttributesRequest
 @see AWSEC2DescribeAccountAttributesResult
 */
- (void)describeAccountAttributes:(AWSEC2DescribeAccountAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeAccountAttributesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified Elastic IP addresses or all of your Elastic IP addresses.</p><p>An Elastic IP address is for use in either the EC2-Classic platform or in a VPC. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAddresses service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeAddressesResult`.
 
 @see AWSEC2DescribeAddressesRequest
 @see AWSEC2DescribeAddressesResult
 */
- (AWSTask<AWSEC2DescribeAddressesResult *> *)describeAddresses:(AWSEC2DescribeAddressesRequest *)request;

/**
 <p>Describes the specified Elastic IP addresses or all of your Elastic IP addresses.</p><p>An Elastic IP address is for use in either the EC2-Classic platform or in a VPC. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAddresses service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeAddressesRequest
 @see AWSEC2DescribeAddressesResult
 */
- (void)describeAddresses:(AWSEC2DescribeAddressesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeAddressesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the longer ID format settings for all resource types in a specific Region. This request is useful for performing a quick audit to determine whether a specific Region is fully opted in for longer IDs (17-character IDs).</p><p>This request only returns information about resource types that support longer IDs.</p><p>The following resource types support longer IDs: <code>bundle</code> | <code>conversion-task</code> | <code>customer-gateway</code> | <code>dhcp-options</code> | <code>elastic-ip-allocation</code> | <code>elastic-ip-association</code> | <code>export-task</code> | <code>flow-log</code> | <code>image</code> | <code>import-task</code> | <code>instance</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-acl-association</code> | <code>network-interface</code> | <code>network-interface-attachment</code> | <code>prefix-list</code> | <code>reservation</code> | <code>route-table</code> | <code>route-table-association</code> | <code>security-group</code> | <code>snapshot</code> | <code>subnet</code> | <code>subnet-cidr-block-association</code> | <code>volume</code> | <code>vpc</code> | <code>vpc-cidr-block-association</code> | <code>vpc-endpoint</code> | <code>vpc-peering-connection</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAggregateIdFormat service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeAggregateIdFormatResult`.
 
 @see AWSEC2DescribeAggregateIdFormatRequest
 @see AWSEC2DescribeAggregateIdFormatResult
 */
- (AWSTask<AWSEC2DescribeAggregateIdFormatResult *> *)describeAggregateIdFormat:(AWSEC2DescribeAggregateIdFormatRequest *)request;

/**
 <p>Describes the longer ID format settings for all resource types in a specific Region. This request is useful for performing a quick audit to determine whether a specific Region is fully opted in for longer IDs (17-character IDs).</p><p>This request only returns information about resource types that support longer IDs.</p><p>The following resource types support longer IDs: <code>bundle</code> | <code>conversion-task</code> | <code>customer-gateway</code> | <code>dhcp-options</code> | <code>elastic-ip-allocation</code> | <code>elastic-ip-association</code> | <code>export-task</code> | <code>flow-log</code> | <code>image</code> | <code>import-task</code> | <code>instance</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-acl-association</code> | <code>network-interface</code> | <code>network-interface-attachment</code> | <code>prefix-list</code> | <code>reservation</code> | <code>route-table</code> | <code>route-table-association</code> | <code>security-group</code> | <code>snapshot</code> | <code>subnet</code> | <code>subnet-cidr-block-association</code> | <code>volume</code> | <code>vpc</code> | <code>vpc-cidr-block-association</code> | <code>vpc-endpoint</code> | <code>vpc-peering-connection</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAggregateIdFormat service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeAggregateIdFormatRequest
 @see AWSEC2DescribeAggregateIdFormatResult
 */
- (void)describeAggregateIdFormat:(AWSEC2DescribeAggregateIdFormatRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeAggregateIdFormatResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the Availability Zones and Local Zones that are available to you. If there is an event impacting an Availability Zone or Local Zone, you can use this request to view the state and any provided messages for that Availability Zone or Local Zone.</p><p>For more information about Availability Zones and Local Zones, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html">Regions and Availability Zones</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAvailabilityZones service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeAvailabilityZonesResult`.
 
 @see AWSEC2DescribeAvailabilityZonesRequest
 @see AWSEC2DescribeAvailabilityZonesResult
 */
- (AWSTask<AWSEC2DescribeAvailabilityZonesResult *> *)describeAvailabilityZones:(AWSEC2DescribeAvailabilityZonesRequest *)request;

/**
 <p>Describes the Availability Zones and Local Zones that are available to you. If there is an event impacting an Availability Zone or Local Zone, you can use this request to view the state and any provided messages for that Availability Zone or Local Zone.</p><p>For more information about Availability Zones and Local Zones, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html">Regions and Availability Zones</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAvailabilityZones service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeAvailabilityZonesRequest
 @see AWSEC2DescribeAvailabilityZonesResult
 */
- (void)describeAvailabilityZones:(AWSEC2DescribeAvailabilityZonesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeAvailabilityZonesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified bundle tasks or all of your bundle tasks.</p><note><p>Completed bundle tasks are listed for only a limited time. If your bundle task is no longer in the list, you can still register an AMI from it. Just use <code>RegisterImage</code> with the Amazon S3 bucket name and image manifest name you provided to the bundle task.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeBundleTasks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeBundleTasksResult`.
 
 @see AWSEC2DescribeBundleTasksRequest
 @see AWSEC2DescribeBundleTasksResult
 */
- (AWSTask<AWSEC2DescribeBundleTasksResult *> *)describeBundleTasks:(AWSEC2DescribeBundleTasksRequest *)request;

/**
 <p>Describes the specified bundle tasks or all of your bundle tasks.</p><note><p>Completed bundle tasks are listed for only a limited time. If your bundle task is no longer in the list, you can still register an AMI from it. Just use <code>RegisterImage</code> with the Amazon S3 bucket name and image manifest name you provided to the bundle task.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeBundleTasks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeBundleTasksRequest
 @see AWSEC2DescribeBundleTasksResult
 */
- (void)describeBundleTasks:(AWSEC2DescribeBundleTasksRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeBundleTasksResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the IP address ranges that were specified in calls to <a>ProvisionByoipCidr</a>.</p><p>To describe the address pools that were created when you provisioned the address ranges, use <a>DescribePublicIpv4Pools</a> or <a>DescribeIpv6Pools</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeByoipCidrs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeByoipCidrsResult`.
 
 @see AWSEC2DescribeByoipCidrsRequest
 @see AWSEC2DescribeByoipCidrsResult
 */
- (AWSTask<AWSEC2DescribeByoipCidrsResult *> *)describeByoipCidrs:(AWSEC2DescribeByoipCidrsRequest *)request;

/**
 <p>Describes the IP address ranges that were specified in calls to <a>ProvisionByoipCidr</a>.</p><p>To describe the address pools that were created when you provisioned the address ranges, use <a>DescribePublicIpv4Pools</a> or <a>DescribeIpv6Pools</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeByoipCidrs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeByoipCidrsRequest
 @see AWSEC2DescribeByoipCidrsResult
 */
- (void)describeByoipCidrs:(AWSEC2DescribeByoipCidrsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeByoipCidrsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your Capacity Reservations. The results describe only the Capacity Reservations in the AWS Region that you're currently using.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCapacityReservations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeCapacityReservationsResult`.
 
 @see AWSEC2DescribeCapacityReservationsRequest
 @see AWSEC2DescribeCapacityReservationsResult
 */
- (AWSTask<AWSEC2DescribeCapacityReservationsResult *> *)describeCapacityReservations:(AWSEC2DescribeCapacityReservationsRequest *)request;

/**
 <p>Describes one or more of your Capacity Reservations. The results describe only the Capacity Reservations in the AWS Region that you're currently using.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCapacityReservations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeCapacityReservationsRequest
 @see AWSEC2DescribeCapacityReservationsResult
 */
- (void)describeCapacityReservations:(AWSEC2DescribeCapacityReservationsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeCapacityReservationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your linked EC2-Classic instances. This request only returns information about EC2-Classic instances linked to a VPC through ClassicLink. You cannot use this request to return information about other instances.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClassicLinkInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeClassicLinkInstancesResult`.
 
 @see AWSEC2DescribeClassicLinkInstancesRequest
 @see AWSEC2DescribeClassicLinkInstancesResult
 */
- (AWSTask<AWSEC2DescribeClassicLinkInstancesResult *> *)describeClassicLinkInstances:(AWSEC2DescribeClassicLinkInstancesRequest *)request;

/**
 <p>Describes one or more of your linked EC2-Classic instances. This request only returns information about EC2-Classic instances linked to a VPC through ClassicLink. You cannot use this request to return information about other instances.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClassicLinkInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeClassicLinkInstancesRequest
 @see AWSEC2DescribeClassicLinkInstancesResult
 */
- (void)describeClassicLinkInstances:(AWSEC2DescribeClassicLinkInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeClassicLinkInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the authorization rules for a specified Client VPN endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClientVpnAuthorizationRules service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeClientVpnAuthorizationRulesResult`.
 
 @see AWSEC2DescribeClientVpnAuthorizationRulesRequest
 @see AWSEC2DescribeClientVpnAuthorizationRulesResult
 */
- (AWSTask<AWSEC2DescribeClientVpnAuthorizationRulesResult *> *)describeClientVpnAuthorizationRules:(AWSEC2DescribeClientVpnAuthorizationRulesRequest *)request;

/**
 <p>Describes the authorization rules for a specified Client VPN endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClientVpnAuthorizationRules service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeClientVpnAuthorizationRulesRequest
 @see AWSEC2DescribeClientVpnAuthorizationRulesResult
 */
- (void)describeClientVpnAuthorizationRules:(AWSEC2DescribeClientVpnAuthorizationRulesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeClientVpnAuthorizationRulesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes active client connections and connections that have been terminated within the last 60 minutes for the specified Client VPN endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClientVpnConnections service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeClientVpnConnectionsResult`.
 
 @see AWSEC2DescribeClientVpnConnectionsRequest
 @see AWSEC2DescribeClientVpnConnectionsResult
 */
- (AWSTask<AWSEC2DescribeClientVpnConnectionsResult *> *)describeClientVpnConnections:(AWSEC2DescribeClientVpnConnectionsRequest *)request;

/**
 <p>Describes active client connections and connections that have been terminated within the last 60 minutes for the specified Client VPN endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClientVpnConnections service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeClientVpnConnectionsRequest
 @see AWSEC2DescribeClientVpnConnectionsResult
 */
- (void)describeClientVpnConnections:(AWSEC2DescribeClientVpnConnectionsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeClientVpnConnectionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more Client VPN endpoints in the account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClientVpnEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeClientVpnEndpointsResult`.
 
 @see AWSEC2DescribeClientVpnEndpointsRequest
 @see AWSEC2DescribeClientVpnEndpointsResult
 */
- (AWSTask<AWSEC2DescribeClientVpnEndpointsResult *> *)describeClientVpnEndpoints:(AWSEC2DescribeClientVpnEndpointsRequest *)request;

/**
 <p>Describes one or more Client VPN endpoints in the account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClientVpnEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeClientVpnEndpointsRequest
 @see AWSEC2DescribeClientVpnEndpointsResult
 */
- (void)describeClientVpnEndpoints:(AWSEC2DescribeClientVpnEndpointsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeClientVpnEndpointsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the routes for the specified Client VPN endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClientVpnRoutes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeClientVpnRoutesResult`.
 
 @see AWSEC2DescribeClientVpnRoutesRequest
 @see AWSEC2DescribeClientVpnRoutesResult
 */
- (AWSTask<AWSEC2DescribeClientVpnRoutesResult *> *)describeClientVpnRoutes:(AWSEC2DescribeClientVpnRoutesRequest *)request;

/**
 <p>Describes the routes for the specified Client VPN endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClientVpnRoutes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeClientVpnRoutesRequest
 @see AWSEC2DescribeClientVpnRoutesResult
 */
- (void)describeClientVpnRoutes:(AWSEC2DescribeClientVpnRoutesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeClientVpnRoutesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the target networks associated with the specified Client VPN endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClientVpnTargetNetworks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeClientVpnTargetNetworksResult`.
 
 @see AWSEC2DescribeClientVpnTargetNetworksRequest
 @see AWSEC2DescribeClientVpnTargetNetworksResult
 */
- (AWSTask<AWSEC2DescribeClientVpnTargetNetworksResult *> *)describeClientVpnTargetNetworks:(AWSEC2DescribeClientVpnTargetNetworksRequest *)request;

/**
 <p>Describes the target networks associated with the specified Client VPN endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DescribeClientVpnTargetNetworks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeClientVpnTargetNetworksRequest
 @see AWSEC2DescribeClientVpnTargetNetworksResult
 */
- (void)describeClientVpnTargetNetworks:(AWSEC2DescribeClientVpnTargetNetworksRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeClientVpnTargetNetworksResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified customer-owned address pools or all of your customer-owned address pools.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCoipPools service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeCoipPoolsResult`.
 
 @see AWSEC2DescribeCoipPoolsRequest
 @see AWSEC2DescribeCoipPoolsResult
 */
- (AWSTask<AWSEC2DescribeCoipPoolsResult *> *)describeCoipPools:(AWSEC2DescribeCoipPoolsRequest *)request;

/**
 <p>Describes the specified customer-owned address pools or all of your customer-owned address pools.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCoipPools service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeCoipPoolsRequest
 @see AWSEC2DescribeCoipPoolsResult
 */
- (void)describeCoipPools:(AWSEC2DescribeCoipPoolsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeCoipPoolsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified conversion tasks or all your conversion tasks. For more information, see the <a href="https://docs.aws.amazon.com/vm-import/latest/userguide/">VM Import/Export User Guide</a>.</p><p>For information about the import manifest referenced by this API action, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html">VM Import Manifest</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeConversionTasks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeConversionTasksResult`.
 
 @see AWSEC2DescribeConversionTasksRequest
 @see AWSEC2DescribeConversionTasksResult
 */
- (AWSTask<AWSEC2DescribeConversionTasksResult *> *)describeConversionTasks:(AWSEC2DescribeConversionTasksRequest *)request;

/**
 <p>Describes the specified conversion tasks or all your conversion tasks. For more information, see the <a href="https://docs.aws.amazon.com/vm-import/latest/userguide/">VM Import/Export User Guide</a>.</p><p>For information about the import manifest referenced by this API action, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html">VM Import Manifest</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeConversionTasks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeConversionTasksRequest
 @see AWSEC2DescribeConversionTasksResult
 */
- (void)describeConversionTasks:(AWSEC2DescribeConversionTasksRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeConversionTasksResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your VPN customer gateways.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html">AWS Site-to-Site VPN</a> in the <i>AWS Site-to-Site VPN User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCustomerGateways service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeCustomerGatewaysResult`.
 
 @see AWSEC2DescribeCustomerGatewaysRequest
 @see AWSEC2DescribeCustomerGatewaysResult
 */
- (AWSTask<AWSEC2DescribeCustomerGatewaysResult *> *)describeCustomerGateways:(AWSEC2DescribeCustomerGatewaysRequest *)request;

/**
 <p>Describes one or more of your VPN customer gateways.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html">AWS Site-to-Site VPN</a> in the <i>AWS Site-to-Site VPN User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCustomerGateways service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeCustomerGatewaysRequest
 @see AWSEC2DescribeCustomerGatewaysResult
 */
- (void)describeCustomerGateways:(AWSEC2DescribeCustomerGatewaysRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeCustomerGatewaysResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your DHCP options sets.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_DHCP_Options.html">DHCP Options Sets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDhcpOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeDhcpOptionsResult`.
 
 @see AWSEC2DescribeDhcpOptionsRequest
 @see AWSEC2DescribeDhcpOptionsResult
 */
- (AWSTask<AWSEC2DescribeDhcpOptionsResult *> *)describeDhcpOptions:(AWSEC2DescribeDhcpOptionsRequest *)request;

/**
 <p>Describes one or more of your DHCP options sets.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_DHCP_Options.html">DHCP Options Sets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDhcpOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeDhcpOptionsRequest
 @see AWSEC2DescribeDhcpOptionsResult
 */
- (void)describeDhcpOptions:(AWSEC2DescribeDhcpOptionsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeDhcpOptionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your egress-only internet gateways.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEgressOnlyInternetGateways service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeEgressOnlyInternetGatewaysResult`.
 
 @see AWSEC2DescribeEgressOnlyInternetGatewaysRequest
 @see AWSEC2DescribeEgressOnlyInternetGatewaysResult
 */
- (AWSTask<AWSEC2DescribeEgressOnlyInternetGatewaysResult *> *)describeEgressOnlyInternetGateways:(AWSEC2DescribeEgressOnlyInternetGatewaysRequest *)request;

/**
 <p>Describes one or more of your egress-only internet gateways.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEgressOnlyInternetGateways service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeEgressOnlyInternetGatewaysRequest
 @see AWSEC2DescribeEgressOnlyInternetGatewaysResult
 */
- (void)describeEgressOnlyInternetGateways:(AWSEC2DescribeEgressOnlyInternetGatewaysRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeEgressOnlyInternetGatewaysResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the Elastic Graphics accelerator associated with your instances. For more information about Elastic Graphics, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/elastic-graphics.html">Amazon Elastic Graphics</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeElasticGpus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeElasticGpusResult`.
 
 @see AWSEC2DescribeElasticGpusRequest
 @see AWSEC2DescribeElasticGpusResult
 */
- (AWSTask<AWSEC2DescribeElasticGpusResult *> *)describeElasticGpus:(AWSEC2DescribeElasticGpusRequest *)request;

/**
 <p>Describes the Elastic Graphics accelerator associated with your instances. For more information about Elastic Graphics, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/elastic-graphics.html">Amazon Elastic Graphics</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeElasticGpus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeElasticGpusRequest
 @see AWSEC2DescribeElasticGpusResult
 */
- (void)describeElasticGpus:(AWSEC2DescribeElasticGpusRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeElasticGpusResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified export image tasks or all your export image tasks.</p>
 
 @param request A container for the necessary parameters to execute the DescribeExportImageTasks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeExportImageTasksResult`.
 
 @see AWSEC2DescribeExportImageTasksRequest
 @see AWSEC2DescribeExportImageTasksResult
 */
- (AWSTask<AWSEC2DescribeExportImageTasksResult *> *)describeExportImageTasks:(AWSEC2DescribeExportImageTasksRequest *)request;

/**
 <p>Describes the specified export image tasks or all your export image tasks.</p>
 
 @param request A container for the necessary parameters to execute the DescribeExportImageTasks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeExportImageTasksRequest
 @see AWSEC2DescribeExportImageTasksResult
 */
- (void)describeExportImageTasks:(AWSEC2DescribeExportImageTasksRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeExportImageTasksResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified export instance tasks or all your export instance tasks.</p>
 
 @param request A container for the necessary parameters to execute the DescribeExportTasks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeExportTasksResult`.
 
 @see AWSEC2DescribeExportTasksRequest
 @see AWSEC2DescribeExportTasksResult
 */
- (AWSTask<AWSEC2DescribeExportTasksResult *> *)describeExportTasks:(AWSEC2DescribeExportTasksRequest *)request;

/**
 <p>Describes the specified export instance tasks or all your export instance tasks.</p>
 
 @param request A container for the necessary parameters to execute the DescribeExportTasks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeExportTasksRequest
 @see AWSEC2DescribeExportTasksResult
 */
- (void)describeExportTasks:(AWSEC2DescribeExportTasksRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeExportTasksResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the state of fast snapshot restores for your snapshots.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFastSnapshotRestores service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeFastSnapshotRestoresResult`.
 
 @see AWSEC2DescribeFastSnapshotRestoresRequest
 @see AWSEC2DescribeFastSnapshotRestoresResult
 */
- (AWSTask<AWSEC2DescribeFastSnapshotRestoresResult *> *)describeFastSnapshotRestores:(AWSEC2DescribeFastSnapshotRestoresRequest *)request;

/**
 <p>Describes the state of fast snapshot restores for your snapshots.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFastSnapshotRestores service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeFastSnapshotRestoresRequest
 @see AWSEC2DescribeFastSnapshotRestoresResult
 */
- (void)describeFastSnapshotRestores:(AWSEC2DescribeFastSnapshotRestoresRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeFastSnapshotRestoresResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the events for the specified EC2 Fleet during the specified time.</p><p>EC2 Fleet events are delayed by up to 30 seconds before they can be described. This ensures that you can query by the last evaluated time and not miss a recorded event. EC2 Fleet events are available for 48 hours.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFleetHistory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeFleetHistoryResult`.
 
 @see AWSEC2DescribeFleetHistoryRequest
 @see AWSEC2DescribeFleetHistoryResult
 */
- (AWSTask<AWSEC2DescribeFleetHistoryResult *> *)describeFleetHistory:(AWSEC2DescribeFleetHistoryRequest *)request;

/**
 <p>Describes the events for the specified EC2 Fleet during the specified time.</p><p>EC2 Fleet events are delayed by up to 30 seconds before they can be described. This ensures that you can query by the last evaluated time and not miss a recorded event. EC2 Fleet events are available for 48 hours.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFleetHistory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeFleetHistoryRequest
 @see AWSEC2DescribeFleetHistoryResult
 */
- (void)describeFleetHistory:(AWSEC2DescribeFleetHistoryRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeFleetHistoryResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the running instances for the specified EC2 Fleet.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFleetInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeFleetInstancesResult`.
 
 @see AWSEC2DescribeFleetInstancesRequest
 @see AWSEC2DescribeFleetInstancesResult
 */
- (AWSTask<AWSEC2DescribeFleetInstancesResult *> *)describeFleetInstances:(AWSEC2DescribeFleetInstancesRequest *)request;

/**
 <p>Describes the running instances for the specified EC2 Fleet.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFleetInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeFleetInstancesRequest
 @see AWSEC2DescribeFleetInstancesResult
 */
- (void)describeFleetInstances:(AWSEC2DescribeFleetInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeFleetInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified EC2 Fleets or all of your EC2 Fleets.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFleets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeFleetsResult`.
 
 @see AWSEC2DescribeFleetsRequest
 @see AWSEC2DescribeFleetsResult
 */
- (AWSTask<AWSEC2DescribeFleetsResult *> *)describeFleets:(AWSEC2DescribeFleetsRequest *)request;

/**
 <p>Describes the specified EC2 Fleets or all of your EC2 Fleets.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFleets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeFleetsRequest
 @see AWSEC2DescribeFleetsResult
 */
- (void)describeFleets:(AWSEC2DescribeFleetsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeFleetsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more flow logs. To view the information in your flow logs (the log streams for the network interfaces), you must use the CloudWatch Logs console or the CloudWatch Logs API.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFlowLogs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeFlowLogsResult`.
 
 @see AWSEC2DescribeFlowLogsRequest
 @see AWSEC2DescribeFlowLogsResult
 */
- (AWSTask<AWSEC2DescribeFlowLogsResult *> *)describeFlowLogs:(AWSEC2DescribeFlowLogsRequest *)request;

/**
 <p>Describes one or more flow logs. To view the information in your flow logs (the log streams for the network interfaces), you must use the CloudWatch Logs console or the CloudWatch Logs API.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFlowLogs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeFlowLogsRequest
 @see AWSEC2DescribeFlowLogsResult
 */
- (void)describeFlowLogs:(AWSEC2DescribeFlowLogsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeFlowLogsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified attribute of the specified Amazon FPGA Image (AFI).</p>
 
 @param request A container for the necessary parameters to execute the DescribeFpgaImageAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeFpgaImageAttributeResult`.
 
 @see AWSEC2DescribeFpgaImageAttributeRequest
 @see AWSEC2DescribeFpgaImageAttributeResult
 */
- (AWSTask<AWSEC2DescribeFpgaImageAttributeResult *> *)describeFpgaImageAttribute:(AWSEC2DescribeFpgaImageAttributeRequest *)request;

/**
 <p>Describes the specified attribute of the specified Amazon FPGA Image (AFI).</p>
 
 @param request A container for the necessary parameters to execute the DescribeFpgaImageAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeFpgaImageAttributeRequest
 @see AWSEC2DescribeFpgaImageAttributeResult
 */
- (void)describeFpgaImageAttribute:(AWSEC2DescribeFpgaImageAttributeRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeFpgaImageAttributeResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the Amazon FPGA Images (AFIs) available to you. These include public AFIs, private AFIs that you own, and AFIs owned by other AWS accounts for which you have load permissions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFpgaImages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeFpgaImagesResult`.
 
 @see AWSEC2DescribeFpgaImagesRequest
 @see AWSEC2DescribeFpgaImagesResult
 */
- (AWSTask<AWSEC2DescribeFpgaImagesResult *> *)describeFpgaImages:(AWSEC2DescribeFpgaImagesRequest *)request;

/**
 <p>Describes the Amazon FPGA Images (AFIs) available to you. These include public AFIs, private AFIs that you own, and AFIs owned by other AWS accounts for which you have load permissions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFpgaImages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeFpgaImagesRequest
 @see AWSEC2DescribeFpgaImagesResult
 */
- (void)describeFpgaImages:(AWSEC2DescribeFpgaImagesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeFpgaImagesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the Dedicated Host reservations that are available to purchase.</p><p>The results describe all of the Dedicated Host reservation offerings, including offerings that might not match the instance family and Region of your Dedicated Hosts. When purchasing an offering, ensure that the instance family and Region of the offering matches that of the Dedicated Hosts with which it is to be associated. For more information about supported instance types, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-hosts-overview.html">Dedicated Hosts Overview</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeHostReservationOfferings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeHostReservationOfferingsResult`.
 
 @see AWSEC2DescribeHostReservationOfferingsRequest
 @see AWSEC2DescribeHostReservationOfferingsResult
 */
- (AWSTask<AWSEC2DescribeHostReservationOfferingsResult *> *)describeHostReservationOfferings:(AWSEC2DescribeHostReservationOfferingsRequest *)request;

/**
 <p>Describes the Dedicated Host reservations that are available to purchase.</p><p>The results describe all of the Dedicated Host reservation offerings, including offerings that might not match the instance family and Region of your Dedicated Hosts. When purchasing an offering, ensure that the instance family and Region of the offering matches that of the Dedicated Hosts with which it is to be associated. For more information about supported instance types, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-hosts-overview.html">Dedicated Hosts Overview</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeHostReservationOfferings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeHostReservationOfferingsRequest
 @see AWSEC2DescribeHostReservationOfferingsResult
 */
- (void)describeHostReservationOfferings:(AWSEC2DescribeHostReservationOfferingsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeHostReservationOfferingsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes reservations that are associated with Dedicated Hosts in your account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHostReservations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeHostReservationsResult`.
 
 @see AWSEC2DescribeHostReservationsRequest
 @see AWSEC2DescribeHostReservationsResult
 */
- (AWSTask<AWSEC2DescribeHostReservationsResult *> *)describeHostReservations:(AWSEC2DescribeHostReservationsRequest *)request;

/**
 <p>Describes reservations that are associated with Dedicated Hosts in your account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHostReservations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeHostReservationsRequest
 @see AWSEC2DescribeHostReservationsResult
 */
- (void)describeHostReservations:(AWSEC2DescribeHostReservationsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeHostReservationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified Dedicated Hosts or all your Dedicated Hosts.</p><p>The results describe only the Dedicated Hosts in the Region you're currently using. All listed instances consume capacity on your Dedicated Host. Dedicated Hosts that have recently been released are listed with the state <code>released</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHosts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeHostsResult`.
 
 @see AWSEC2DescribeHostsRequest
 @see AWSEC2DescribeHostsResult
 */
- (AWSTask<AWSEC2DescribeHostsResult *> *)describeHosts:(AWSEC2DescribeHostsRequest *)request;

/**
 <p>Describes the specified Dedicated Hosts or all your Dedicated Hosts.</p><p>The results describe only the Dedicated Hosts in the Region you're currently using. All listed instances consume capacity on your Dedicated Host. Dedicated Hosts that have recently been released are listed with the state <code>released</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHosts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeHostsRequest
 @see AWSEC2DescribeHostsResult
 */
- (void)describeHosts:(AWSEC2DescribeHostsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeHostsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes your IAM instance profile associations.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIamInstanceProfileAssociations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeIamInstanceProfileAssociationsResult`.
 
 @see AWSEC2DescribeIamInstanceProfileAssociationsRequest
 @see AWSEC2DescribeIamInstanceProfileAssociationsResult
 */
- (AWSTask<AWSEC2DescribeIamInstanceProfileAssociationsResult *> *)describeIamInstanceProfileAssociations:(AWSEC2DescribeIamInstanceProfileAssociationsRequest *)request;

/**
 <p>Describes your IAM instance profile associations.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIamInstanceProfileAssociations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeIamInstanceProfileAssociationsRequest
 @see AWSEC2DescribeIamInstanceProfileAssociationsResult
 */
- (void)describeIamInstanceProfileAssociations:(AWSEC2DescribeIamInstanceProfileAssociationsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeIamInstanceProfileAssociationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the ID format settings for your resources on a per-Region basis, for example, to view which resource types are enabled for longer IDs. This request only returns information about resource types whose ID formats can be modified; it does not return information about other resource types.</p><p>The following resource types support longer IDs: <code>bundle</code> | <code>conversion-task</code> | <code>customer-gateway</code> | <code>dhcp-options</code> | <code>elastic-ip-allocation</code> | <code>elastic-ip-association</code> | <code>export-task</code> | <code>flow-log</code> | <code>image</code> | <code>import-task</code> | <code>instance</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-acl-association</code> | <code>network-interface</code> | <code>network-interface-attachment</code> | <code>prefix-list</code> | <code>reservation</code> | <code>route-table</code> | <code>route-table-association</code> | <code>security-group</code> | <code>snapshot</code> | <code>subnet</code> | <code>subnet-cidr-block-association</code> | <code>volume</code> | <code>vpc</code> | <code>vpc-cidr-block-association</code> | <code>vpc-endpoint</code> | <code>vpc-peering-connection</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>. </p><p>These settings apply to the IAM user who makes the request; they do not apply to the entire AWS account. By default, an IAM user defaults to the same settings as the root user, unless they explicitly override the settings by running the <a>ModifyIdFormat</a> command. Resources created with longer IDs are visible to all IAM users, regardless of these settings and provided that they have permission to use the relevant <code>Describe</code> command for the resource type.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIdFormat service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeIdFormatResult`.
 
 @see AWSEC2DescribeIdFormatRequest
 @see AWSEC2DescribeIdFormatResult
 */
- (AWSTask<AWSEC2DescribeIdFormatResult *> *)describeIdFormat:(AWSEC2DescribeIdFormatRequest *)request;

/**
 <p>Describes the ID format settings for your resources on a per-Region basis, for example, to view which resource types are enabled for longer IDs. This request only returns information about resource types whose ID formats can be modified; it does not return information about other resource types.</p><p>The following resource types support longer IDs: <code>bundle</code> | <code>conversion-task</code> | <code>customer-gateway</code> | <code>dhcp-options</code> | <code>elastic-ip-allocation</code> | <code>elastic-ip-association</code> | <code>export-task</code> | <code>flow-log</code> | <code>image</code> | <code>import-task</code> | <code>instance</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-acl-association</code> | <code>network-interface</code> | <code>network-interface-attachment</code> | <code>prefix-list</code> | <code>reservation</code> | <code>route-table</code> | <code>route-table-association</code> | <code>security-group</code> | <code>snapshot</code> | <code>subnet</code> | <code>subnet-cidr-block-association</code> | <code>volume</code> | <code>vpc</code> | <code>vpc-cidr-block-association</code> | <code>vpc-endpoint</code> | <code>vpc-peering-connection</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>. </p><p>These settings apply to the IAM user who makes the request; they do not apply to the entire AWS account. By default, an IAM user defaults to the same settings as the root user, unless they explicitly override the settings by running the <a>ModifyIdFormat</a> command. Resources created with longer IDs are visible to all IAM users, regardless of these settings and provided that they have permission to use the relevant <code>Describe</code> command for the resource type.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIdFormat service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeIdFormatRequest
 @see AWSEC2DescribeIdFormatResult
 */
- (void)describeIdFormat:(AWSEC2DescribeIdFormatRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeIdFormatResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the ID format settings for resources for the specified IAM user, IAM role, or root user. For example, you can view the resource types that are enabled for longer IDs. This request only returns information about resource types whose ID formats can be modified; it does not return information about other resource types. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resource-ids.html">Resource IDs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. </p><p>The following resource types support longer IDs: <code>bundle</code> | <code>conversion-task</code> | <code>customer-gateway</code> | <code>dhcp-options</code> | <code>elastic-ip-allocation</code> | <code>elastic-ip-association</code> | <code>export-task</code> | <code>flow-log</code> | <code>image</code> | <code>import-task</code> | <code>instance</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-acl-association</code> | <code>network-interface</code> | <code>network-interface-attachment</code> | <code>prefix-list</code> | <code>reservation</code> | <code>route-table</code> | <code>route-table-association</code> | <code>security-group</code> | <code>snapshot</code> | <code>subnet</code> | <code>subnet-cidr-block-association</code> | <code>volume</code> | <code>vpc</code> | <code>vpc-cidr-block-association</code> | <code>vpc-endpoint</code> | <code>vpc-peering-connection</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>. </p><p>These settings apply to the principal specified in the request. They do not apply to the principal that makes the request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIdentityIdFormat service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeIdentityIdFormatResult`.
 
 @see AWSEC2DescribeIdentityIdFormatRequest
 @see AWSEC2DescribeIdentityIdFormatResult
 */
- (AWSTask<AWSEC2DescribeIdentityIdFormatResult *> *)describeIdentityIdFormat:(AWSEC2DescribeIdentityIdFormatRequest *)request;

/**
 <p>Describes the ID format settings for resources for the specified IAM user, IAM role, or root user. For example, you can view the resource types that are enabled for longer IDs. This request only returns information about resource types whose ID formats can be modified; it does not return information about other resource types. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resource-ids.html">Resource IDs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. </p><p>The following resource types support longer IDs: <code>bundle</code> | <code>conversion-task</code> | <code>customer-gateway</code> | <code>dhcp-options</code> | <code>elastic-ip-allocation</code> | <code>elastic-ip-association</code> | <code>export-task</code> | <code>flow-log</code> | <code>image</code> | <code>import-task</code> | <code>instance</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-acl-association</code> | <code>network-interface</code> | <code>network-interface-attachment</code> | <code>prefix-list</code> | <code>reservation</code> | <code>route-table</code> | <code>route-table-association</code> | <code>security-group</code> | <code>snapshot</code> | <code>subnet</code> | <code>subnet-cidr-block-association</code> | <code>volume</code> | <code>vpc</code> | <code>vpc-cidr-block-association</code> | <code>vpc-endpoint</code> | <code>vpc-peering-connection</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>. </p><p>These settings apply to the principal specified in the request. They do not apply to the principal that makes the request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIdentityIdFormat service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeIdentityIdFormatRequest
 @see AWSEC2DescribeIdentityIdFormatResult
 */
- (void)describeIdentityIdFormat:(AWSEC2DescribeIdentityIdFormatRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeIdentityIdFormatResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified attribute of the specified AMI. You can specify only one attribute at a time.</p>
 
 @param request A container for the necessary parameters to execute the DescribeImageAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ImageAttribute`.
 
 @see AWSEC2DescribeImageAttributeRequest
 @see AWSEC2ImageAttribute
 */
- (AWSTask<AWSEC2ImageAttribute *> *)describeImageAttribute:(AWSEC2DescribeImageAttributeRequest *)request;

/**
 <p>Describes the specified attribute of the specified AMI. You can specify only one attribute at a time.</p>
 
 @param request A container for the necessary parameters to execute the DescribeImageAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeImageAttributeRequest
 @see AWSEC2ImageAttribute
 */
- (void)describeImageAttribute:(AWSEC2DescribeImageAttributeRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ImageAttribute * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified images (AMIs, AKIs, and ARIs) available to you or all of the images available to you.</p><p>The images available to you include public images, private images that you own, and private images owned by other AWS accounts for which you have explicit launch permissions.</p><p>Recently deregistered images appear in the returned results for a short interval and then return empty results. After all instances that reference a deregistered AMI are terminated, specifying the ID of the image results in an error indicating that the AMI ID cannot be found.</p>
 
 @param request A container for the necessary parameters to execute the DescribeImages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeImagesResult`.
 
 @see AWSEC2DescribeImagesRequest
 @see AWSEC2DescribeImagesResult
 */
- (AWSTask<AWSEC2DescribeImagesResult *> *)describeImages:(AWSEC2DescribeImagesRequest *)request;

/**
 <p>Describes the specified images (AMIs, AKIs, and ARIs) available to you or all of the images available to you.</p><p>The images available to you include public images, private images that you own, and private images owned by other AWS accounts for which you have explicit launch permissions.</p><p>Recently deregistered images appear in the returned results for a short interval and then return empty results. After all instances that reference a deregistered AMI are terminated, specifying the ID of the image results in an error indicating that the AMI ID cannot be found.</p>
 
 @param request A container for the necessary parameters to execute the DescribeImages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeImagesRequest
 @see AWSEC2DescribeImagesResult
 */
- (void)describeImages:(AWSEC2DescribeImagesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeImagesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Displays details about an import virtual machine or import snapshot tasks that are already created.</p>
 
 @param request A container for the necessary parameters to execute the DescribeImportImageTasks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeImportImageTasksResult`.
 
 @see AWSEC2DescribeImportImageTasksRequest
 @see AWSEC2DescribeImportImageTasksResult
 */
- (AWSTask<AWSEC2DescribeImportImageTasksResult *> *)describeImportImageTasks:(AWSEC2DescribeImportImageTasksRequest *)request;

/**
 <p>Displays details about an import virtual machine or import snapshot tasks that are already created.</p>
 
 @param request A container for the necessary parameters to execute the DescribeImportImageTasks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeImportImageTasksRequest
 @see AWSEC2DescribeImportImageTasksResult
 */
- (void)describeImportImageTasks:(AWSEC2DescribeImportImageTasksRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeImportImageTasksResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes your import snapshot tasks.</p>
 
 @param request A container for the necessary parameters to execute the DescribeImportSnapshotTasks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeImportSnapshotTasksResult`.
 
 @see AWSEC2DescribeImportSnapshotTasksRequest
 @see AWSEC2DescribeImportSnapshotTasksResult
 */
- (AWSTask<AWSEC2DescribeImportSnapshotTasksResult *> *)describeImportSnapshotTasks:(AWSEC2DescribeImportSnapshotTasksRequest *)request;

/**
 <p>Describes your import snapshot tasks.</p>
 
 @param request A container for the necessary parameters to execute the DescribeImportSnapshotTasks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeImportSnapshotTasksRequest
 @see AWSEC2DescribeImportSnapshotTasksResult
 */
- (void)describeImportSnapshotTasks:(AWSEC2DescribeImportSnapshotTasksRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeImportSnapshotTasksResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified attribute of the specified instance. You can specify only one attribute at a time. Valid attribute values are: <code>instanceType</code> | <code>kernel</code> | <code>ramdisk</code> | <code>userData</code> | <code>disableApiTermination</code> | <code>instanceInitiatedShutdownBehavior</code> | <code>rootDeviceName</code> | <code>blockDeviceMapping</code> | <code>productCodes</code> | <code>sourceDestCheck</code> | <code>groupSet</code> | <code>ebsOptimized</code> | <code>sriovNetSupport</code></p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2InstanceAttribute`.
 
 @see AWSEC2DescribeInstanceAttributeRequest
 @see AWSEC2InstanceAttribute
 */
- (AWSTask<AWSEC2InstanceAttribute *> *)describeInstanceAttribute:(AWSEC2DescribeInstanceAttributeRequest *)request;

/**
 <p>Describes the specified attribute of the specified instance. You can specify only one attribute at a time. Valid attribute values are: <code>instanceType</code> | <code>kernel</code> | <code>ramdisk</code> | <code>userData</code> | <code>disableApiTermination</code> | <code>instanceInitiatedShutdownBehavior</code> | <code>rootDeviceName</code> | <code>blockDeviceMapping</code> | <code>productCodes</code> | <code>sourceDestCheck</code> | <code>groupSet</code> | <code>ebsOptimized</code> | <code>sriovNetSupport</code></p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeInstanceAttributeRequest
 @see AWSEC2InstanceAttribute
 */
- (void)describeInstanceAttribute:(AWSEC2DescribeInstanceAttributeRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2InstanceAttribute * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the credit option for CPU usage of the specified burstable performance instances. The credit options are <code>standard</code> and <code>unlimited</code>.</p><p>If you do not specify an instance ID, Amazon EC2 returns burstable performance instances with the <code>unlimited</code> credit option, as well as instances that were previously configured as T2, T3, and T3a with the <code>unlimited</code> credit option. For example, if you resize a T2 instance, while it is configured as <code>unlimited</code>, to an M4 instance, Amazon EC2 returns the M4 instance.</p><p>If you specify one or more instance IDs, Amazon EC2 returns the credit option (<code>standard</code> or <code>unlimited</code>) of those instances. If you specify an instance ID that is not valid, such as an instance that is not a burstable performance instance, an error is returned.</p><p>Recently terminated instances might appear in the returned results. This interval is usually less than one hour.</p><p>If an Availability Zone is experiencing a service disruption and you specify instance IDs in the affected zone, or do not specify any instance IDs at all, the call fails. If you specify only instance IDs in an unaffected zone, the call works normally.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html">Burstable Performance Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceCreditSpecifications service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeInstanceCreditSpecificationsResult`.
 
 @see AWSEC2DescribeInstanceCreditSpecificationsRequest
 @see AWSEC2DescribeInstanceCreditSpecificationsResult
 */
- (AWSTask<AWSEC2DescribeInstanceCreditSpecificationsResult *> *)describeInstanceCreditSpecifications:(AWSEC2DescribeInstanceCreditSpecificationsRequest *)request;

/**
 <p>Describes the credit option for CPU usage of the specified burstable performance instances. The credit options are <code>standard</code> and <code>unlimited</code>.</p><p>If you do not specify an instance ID, Amazon EC2 returns burstable performance instances with the <code>unlimited</code> credit option, as well as instances that were previously configured as T2, T3, and T3a with the <code>unlimited</code> credit option. For example, if you resize a T2 instance, while it is configured as <code>unlimited</code>, to an M4 instance, Amazon EC2 returns the M4 instance.</p><p>If you specify one or more instance IDs, Amazon EC2 returns the credit option (<code>standard</code> or <code>unlimited</code>) of those instances. If you specify an instance ID that is not valid, such as an instance that is not a burstable performance instance, an error is returned.</p><p>Recently terminated instances might appear in the returned results. This interval is usually less than one hour.</p><p>If an Availability Zone is experiencing a service disruption and you specify instance IDs in the affected zone, or do not specify any instance IDs at all, the call fails. If you specify only instance IDs in an unaffected zone, the call works normally.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html">Burstable Performance Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceCreditSpecifications service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeInstanceCreditSpecificationsRequest
 @see AWSEC2DescribeInstanceCreditSpecificationsResult
 */
- (void)describeInstanceCreditSpecifications:(AWSEC2DescribeInstanceCreditSpecificationsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeInstanceCreditSpecificationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the status of the specified instances or all of your instances. By default, only running instances are described, unless you specifically indicate to return the status of all instances.</p><p>Instance status includes the following components:</p><ul><li><p><b>Status checks</b> - Amazon EC2 performs status checks on running EC2 instances to identify hardware and software issues. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-system-instance-status-check.html">Status Checks for Your Instances</a> and <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstances.html">Troubleshooting Instances with Failed Status Checks</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p></li><li><p><b>Scheduled events</b> - Amazon EC2 can schedule events (such as reboot, stop, or terminate) for your instances related to hardware issues, software updates, or system maintenance. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-instances-status-check_sched.html">Scheduled Events for Your Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p></li><li><p><b>Instance state</b> - You can manage your instances from the moment you launch them through their termination. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html">Instance Lifecycle</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeInstanceStatusResult`.
 
 @see AWSEC2DescribeInstanceStatusRequest
 @see AWSEC2DescribeInstanceStatusResult
 */
- (AWSTask<AWSEC2DescribeInstanceStatusResult *> *)describeInstanceStatus:(AWSEC2DescribeInstanceStatusRequest *)request;

/**
 <p>Describes the status of the specified instances or all of your instances. By default, only running instances are described, unless you specifically indicate to return the status of all instances.</p><p>Instance status includes the following components:</p><ul><li><p><b>Status checks</b> - Amazon EC2 performs status checks on running EC2 instances to identify hardware and software issues. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-system-instance-status-check.html">Status Checks for Your Instances</a> and <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstances.html">Troubleshooting Instances with Failed Status Checks</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p></li><li><p><b>Scheduled events</b> - Amazon EC2 can schedule events (such as reboot, stop, or terminate) for your instances related to hardware issues, software updates, or system maintenance. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-instances-status-check_sched.html">Scheduled Events for Your Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p></li><li><p><b>Instance state</b> - You can manage your instances from the moment you launch them through their termination. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html">Instance Lifecycle</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeInstanceStatusRequest
 @see AWSEC2DescribeInstanceStatusResult
 */
- (void)describeInstanceStatus:(AWSEC2DescribeInstanceStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeInstanceStatusResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of all instance types offered. The results can be filtered by location (Region or Availability Zone). If no location is specified, the instance types offered in the current Region are returned.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceTypeOfferings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeInstanceTypeOfferingsResult`.
 
 @see AWSEC2DescribeInstanceTypeOfferingsRequest
 @see AWSEC2DescribeInstanceTypeOfferingsResult
 */
- (AWSTask<AWSEC2DescribeInstanceTypeOfferingsResult *> *)describeInstanceTypeOfferings:(AWSEC2DescribeInstanceTypeOfferingsRequest *)request;

/**
 <p>Returns a list of all instance types offered. The results can be filtered by location (Region or Availability Zone). If no location is specified, the instance types offered in the current Region are returned.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceTypeOfferings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeInstanceTypeOfferingsRequest
 @see AWSEC2DescribeInstanceTypeOfferingsResult
 */
- (void)describeInstanceTypeOfferings:(AWSEC2DescribeInstanceTypeOfferingsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeInstanceTypeOfferingsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of all instance types offered in your current AWS Region. The results can be filtered by the attributes of the instance types.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeInstanceTypesResult`.
 
 @see AWSEC2DescribeInstanceTypesRequest
 @see AWSEC2DescribeInstanceTypesResult
 */
- (AWSTask<AWSEC2DescribeInstanceTypesResult *> *)describeInstanceTypes:(AWSEC2DescribeInstanceTypesRequest *)request;

/**
 <p>Returns a list of all instance types offered in your current AWS Region. The results can be filtered by the attributes of the instance types.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeInstanceTypesRequest
 @see AWSEC2DescribeInstanceTypesResult
 */
- (void)describeInstanceTypes:(AWSEC2DescribeInstanceTypesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeInstanceTypesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified instances or all of AWS account's instances.</p><p>If you specify one or more instance IDs, Amazon EC2 returns information for those instances. If you do not specify instance IDs, Amazon EC2 returns information for all relevant instances. If you specify an instance ID that is not valid, an error is returned. If you specify an instance that you do not own, it is not included in the returned results.</p><p>Recently terminated instances might appear in the returned results. This interval is usually less than one hour.</p><p>If you describe instances in the rare case where an Availability Zone is experiencing a service disruption and you specify instance IDs that are in the affected zone, or do not specify any instance IDs at all, the call fails. If you describe instances and specify only instance IDs that are in an unaffected zone, the call works normally.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeInstancesResult`.
 
 @see AWSEC2DescribeInstancesRequest
 @see AWSEC2DescribeInstancesResult
 */
- (AWSTask<AWSEC2DescribeInstancesResult *> *)describeInstances:(AWSEC2DescribeInstancesRequest *)request;

/**
 <p>Describes the specified instances or all of AWS account's instances.</p><p>If you specify one or more instance IDs, Amazon EC2 returns information for those instances. If you do not specify instance IDs, Amazon EC2 returns information for all relevant instances. If you specify an instance ID that is not valid, an error is returned. If you specify an instance that you do not own, it is not included in the returned results.</p><p>Recently terminated instances might appear in the returned results. This interval is usually less than one hour.</p><p>If you describe instances in the rare case where an Availability Zone is experiencing a service disruption and you specify instance IDs that are in the affected zone, or do not specify any instance IDs at all, the call fails. If you describe instances and specify only instance IDs that are in an unaffected zone, the call works normally.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeInstancesRequest
 @see AWSEC2DescribeInstancesResult
 */
- (void)describeInstances:(AWSEC2DescribeInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your internet gateways.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInternetGateways service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeInternetGatewaysResult`.
 
 @see AWSEC2DescribeInternetGatewaysRequest
 @see AWSEC2DescribeInternetGatewaysResult
 */
- (AWSTask<AWSEC2DescribeInternetGatewaysResult *> *)describeInternetGateways:(AWSEC2DescribeInternetGatewaysRequest *)request;

/**
 <p>Describes one or more of your internet gateways.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInternetGateways service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeInternetGatewaysRequest
 @see AWSEC2DescribeInternetGatewaysResult
 */
- (void)describeInternetGateways:(AWSEC2DescribeInternetGatewaysRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeInternetGatewaysResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes your IPv6 address pools.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIpv6Pools service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeIpv6PoolsResult`.
 
 @see AWSEC2DescribeIpv6PoolsRequest
 @see AWSEC2DescribeIpv6PoolsResult
 */
- (AWSTask<AWSEC2DescribeIpv6PoolsResult *> *)describeIpv6Pools:(AWSEC2DescribeIpv6PoolsRequest *)request;

/**
 <p>Describes your IPv6 address pools.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIpv6Pools service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeIpv6PoolsRequest
 @see AWSEC2DescribeIpv6PoolsResult
 */
- (void)describeIpv6Pools:(AWSEC2DescribeIpv6PoolsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeIpv6PoolsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified key pairs or all of your key pairs.</p><p>For more information about key pairs, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeKeyPairs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeKeyPairsResult`.
 
 @see AWSEC2DescribeKeyPairsRequest
 @see AWSEC2DescribeKeyPairsResult
 */
- (AWSTask<AWSEC2DescribeKeyPairsResult *> *)describeKeyPairs:(AWSEC2DescribeKeyPairsRequest *)request;

/**
 <p>Describes the specified key pairs or all of your key pairs.</p><p>For more information about key pairs, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeKeyPairs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeKeyPairsRequest
 @see AWSEC2DescribeKeyPairsResult
 */
- (void)describeKeyPairs:(AWSEC2DescribeKeyPairsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeKeyPairsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more versions of a specified launch template. You can describe all versions, individual versions, or a range of versions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLaunchTemplateVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeLaunchTemplateVersionsResult`.
 
 @see AWSEC2DescribeLaunchTemplateVersionsRequest
 @see AWSEC2DescribeLaunchTemplateVersionsResult
 */
- (AWSTask<AWSEC2DescribeLaunchTemplateVersionsResult *> *)describeLaunchTemplateVersions:(AWSEC2DescribeLaunchTemplateVersionsRequest *)request;

/**
 <p>Describes one or more versions of a specified launch template. You can describe all versions, individual versions, or a range of versions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLaunchTemplateVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeLaunchTemplateVersionsRequest
 @see AWSEC2DescribeLaunchTemplateVersionsResult
 */
- (void)describeLaunchTemplateVersions:(AWSEC2DescribeLaunchTemplateVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeLaunchTemplateVersionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more launch templates.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLaunchTemplates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeLaunchTemplatesResult`.
 
 @see AWSEC2DescribeLaunchTemplatesRequest
 @see AWSEC2DescribeLaunchTemplatesResult
 */
- (AWSTask<AWSEC2DescribeLaunchTemplatesResult *> *)describeLaunchTemplates:(AWSEC2DescribeLaunchTemplatesRequest *)request;

/**
 <p>Describes one or more launch templates.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLaunchTemplates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeLaunchTemplatesRequest
 @see AWSEC2DescribeLaunchTemplatesResult
 */
- (void)describeLaunchTemplates:(AWSEC2DescribeLaunchTemplatesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeLaunchTemplatesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the associations between virtual interface groups and local gateway route tables.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsResult`.
 
 @see AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsRequest
 @see AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsResult
 */
- (AWSTask<AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsResult *> *)describeLocalGatewayRouteTableVirtualInterfaceGroupAssociations:(AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsRequest *)request;

/**
 <p>Describes the associations between virtual interface groups and local gateway route tables.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsRequest
 @see AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsResult
 */
- (void)describeLocalGatewayRouteTableVirtualInterfaceGroupAssociations:(AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified associations between VPCs and local gateway route tables.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLocalGatewayRouteTableVpcAssociations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsResult`.
 
 @see AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsRequest
 @see AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsResult
 */
- (AWSTask<AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsResult *> *)describeLocalGatewayRouteTableVpcAssociations:(AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsRequest *)request;

/**
 <p>Describes the specified associations between VPCs and local gateway route tables.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLocalGatewayRouteTableVpcAssociations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsRequest
 @see AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsResult
 */
- (void)describeLocalGatewayRouteTableVpcAssociations:(AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more local gateway route tables. By default, all local gateway route tables are described. Alternatively, you can filter the results.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLocalGatewayRouteTables service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeLocalGatewayRouteTablesResult`.
 
 @see AWSEC2DescribeLocalGatewayRouteTablesRequest
 @see AWSEC2DescribeLocalGatewayRouteTablesResult
 */
- (AWSTask<AWSEC2DescribeLocalGatewayRouteTablesResult *> *)describeLocalGatewayRouteTables:(AWSEC2DescribeLocalGatewayRouteTablesRequest *)request;

/**
 <p>Describes one or more local gateway route tables. By default, all local gateway route tables are described. Alternatively, you can filter the results.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLocalGatewayRouteTables service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeLocalGatewayRouteTablesRequest
 @see AWSEC2DescribeLocalGatewayRouteTablesResult
 */
- (void)describeLocalGatewayRouteTables:(AWSEC2DescribeLocalGatewayRouteTablesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeLocalGatewayRouteTablesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified local gateway virtual interface groups.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLocalGatewayVirtualInterfaceGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsResult`.
 
 @see AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsRequest
 @see AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsResult
 */
- (AWSTask<AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsResult *> *)describeLocalGatewayVirtualInterfaceGroups:(AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsRequest *)request;

/**
 <p>Describes the specified local gateway virtual interface groups.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLocalGatewayVirtualInterfaceGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsRequest
 @see AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsResult
 */
- (void)describeLocalGatewayVirtualInterfaceGroups:(AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified local gateway virtual interfaces.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLocalGatewayVirtualInterfaces service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeLocalGatewayVirtualInterfacesResult`.
 
 @see AWSEC2DescribeLocalGatewayVirtualInterfacesRequest
 @see AWSEC2DescribeLocalGatewayVirtualInterfacesResult
 */
- (AWSTask<AWSEC2DescribeLocalGatewayVirtualInterfacesResult *> *)describeLocalGatewayVirtualInterfaces:(AWSEC2DescribeLocalGatewayVirtualInterfacesRequest *)request;

/**
 <p>Describes the specified local gateway virtual interfaces.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLocalGatewayVirtualInterfaces service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeLocalGatewayVirtualInterfacesRequest
 @see AWSEC2DescribeLocalGatewayVirtualInterfacesResult
 */
- (void)describeLocalGatewayVirtualInterfaces:(AWSEC2DescribeLocalGatewayVirtualInterfacesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeLocalGatewayVirtualInterfacesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more local gateways. By default, all local gateways are described. Alternatively, you can filter the results.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLocalGateways service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeLocalGatewaysResult`.
 
 @see AWSEC2DescribeLocalGatewaysRequest
 @see AWSEC2DescribeLocalGatewaysResult
 */
- (AWSTask<AWSEC2DescribeLocalGatewaysResult *> *)describeLocalGateways:(AWSEC2DescribeLocalGatewaysRequest *)request;

/**
 <p>Describes one or more local gateways. By default, all local gateways are described. Alternatively, you can filter the results.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLocalGateways service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeLocalGatewaysRequest
 @see AWSEC2DescribeLocalGatewaysResult
 */
- (void)describeLocalGateways:(AWSEC2DescribeLocalGatewaysRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeLocalGatewaysResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes your Elastic IP addresses that are being moved to the EC2-VPC platform, or that are being restored to the EC2-Classic platform. This request does not return information about any other Elastic IP addresses in your account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMovingAddresses service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeMovingAddressesResult`.
 
 @see AWSEC2DescribeMovingAddressesRequest
 @see AWSEC2DescribeMovingAddressesResult
 */
- (AWSTask<AWSEC2DescribeMovingAddressesResult *> *)describeMovingAddresses:(AWSEC2DescribeMovingAddressesRequest *)request;

/**
 <p>Describes your Elastic IP addresses that are being moved to the EC2-VPC platform, or that are being restored to the EC2-Classic platform. This request does not return information about any other Elastic IP addresses in your account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMovingAddresses service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeMovingAddressesRequest
 @see AWSEC2DescribeMovingAddressesResult
 */
- (void)describeMovingAddresses:(AWSEC2DescribeMovingAddressesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeMovingAddressesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your NAT gateways.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNatGateways service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeNatGatewaysResult`.
 
 @see AWSEC2DescribeNatGatewaysRequest
 @see AWSEC2DescribeNatGatewaysResult
 */
- (AWSTask<AWSEC2DescribeNatGatewaysResult *> *)describeNatGateways:(AWSEC2DescribeNatGatewaysRequest *)request;

/**
 <p>Describes one or more of your NAT gateways.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNatGateways service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeNatGatewaysRequest
 @see AWSEC2DescribeNatGatewaysResult
 */
- (void)describeNatGateways:(AWSEC2DescribeNatGatewaysRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeNatGatewaysResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your network ACLs.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNetworkAcls service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeNetworkAclsResult`.
 
 @see AWSEC2DescribeNetworkAclsRequest
 @see AWSEC2DescribeNetworkAclsResult
 */
- (AWSTask<AWSEC2DescribeNetworkAclsResult *> *)describeNetworkAcls:(AWSEC2DescribeNetworkAclsRequest *)request;

/**
 <p>Describes one or more of your network ACLs.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNetworkAcls service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeNetworkAclsRequest
 @see AWSEC2DescribeNetworkAclsResult
 */
- (void)describeNetworkAcls:(AWSEC2DescribeNetworkAclsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeNetworkAclsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes a network interface attribute. You can specify only one attribute at a time.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNetworkInterfaceAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeNetworkInterfaceAttributeResult`.
 
 @see AWSEC2DescribeNetworkInterfaceAttributeRequest
 @see AWSEC2DescribeNetworkInterfaceAttributeResult
 */
- (AWSTask<AWSEC2DescribeNetworkInterfaceAttributeResult *> *)describeNetworkInterfaceAttribute:(AWSEC2DescribeNetworkInterfaceAttributeRequest *)request;

/**
 <p>Describes a network interface attribute. You can specify only one attribute at a time.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNetworkInterfaceAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeNetworkInterfaceAttributeRequest
 @see AWSEC2DescribeNetworkInterfaceAttributeResult
 */
- (void)describeNetworkInterfaceAttribute:(AWSEC2DescribeNetworkInterfaceAttributeRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeNetworkInterfaceAttributeResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the permissions for your network interfaces. </p>
 
 @param request A container for the necessary parameters to execute the DescribeNetworkInterfacePermissions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeNetworkInterfacePermissionsResult`.
 
 @see AWSEC2DescribeNetworkInterfacePermissionsRequest
 @see AWSEC2DescribeNetworkInterfacePermissionsResult
 */
- (AWSTask<AWSEC2DescribeNetworkInterfacePermissionsResult *> *)describeNetworkInterfacePermissions:(AWSEC2DescribeNetworkInterfacePermissionsRequest *)request;

/**
 <p>Describes the permissions for your network interfaces. </p>
 
 @param request A container for the necessary parameters to execute the DescribeNetworkInterfacePermissions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeNetworkInterfacePermissionsRequest
 @see AWSEC2DescribeNetworkInterfacePermissionsResult
 */
- (void)describeNetworkInterfacePermissions:(AWSEC2DescribeNetworkInterfacePermissionsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeNetworkInterfacePermissionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your network interfaces.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNetworkInterfaces service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeNetworkInterfacesResult`.
 
 @see AWSEC2DescribeNetworkInterfacesRequest
 @see AWSEC2DescribeNetworkInterfacesResult
 */
- (AWSTask<AWSEC2DescribeNetworkInterfacesResult *> *)describeNetworkInterfaces:(AWSEC2DescribeNetworkInterfacesRequest *)request;

/**
 <p>Describes one or more of your network interfaces.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNetworkInterfaces service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeNetworkInterfacesRequest
 @see AWSEC2DescribeNetworkInterfacesResult
 */
- (void)describeNetworkInterfaces:(AWSEC2DescribeNetworkInterfacesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeNetworkInterfacesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified placement groups or all of your placement groups. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">Placement Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribePlacementGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribePlacementGroupsResult`.
 
 @see AWSEC2DescribePlacementGroupsRequest
 @see AWSEC2DescribePlacementGroupsResult
 */
- (AWSTask<AWSEC2DescribePlacementGroupsResult *> *)describePlacementGroups:(AWSEC2DescribePlacementGroupsRequest *)request;

/**
 <p>Describes the specified placement groups or all of your placement groups. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">Placement Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribePlacementGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribePlacementGroupsRequest
 @see AWSEC2DescribePlacementGroupsResult
 */
- (void)describePlacementGroups:(AWSEC2DescribePlacementGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribePlacementGroupsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes available AWS services in a prefix list format, which includes the prefix list name and prefix list ID of the service and the IP address range for the service. A prefix list ID is required for creating an outbound security group rule that allows traffic from a VPC to access an AWS service through a gateway VPC endpoint. Currently, the services that support this action are Amazon S3 and Amazon DynamoDB.</p>
 
 @param request A container for the necessary parameters to execute the DescribePrefixLists service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribePrefixListsResult`.
 
 @see AWSEC2DescribePrefixListsRequest
 @see AWSEC2DescribePrefixListsResult
 */
- (AWSTask<AWSEC2DescribePrefixListsResult *> *)describePrefixLists:(AWSEC2DescribePrefixListsRequest *)request;

/**
 <p>Describes available AWS services in a prefix list format, which includes the prefix list name and prefix list ID of the service and the IP address range for the service. A prefix list ID is required for creating an outbound security group rule that allows traffic from a VPC to access an AWS service through a gateway VPC endpoint. Currently, the services that support this action are Amazon S3 and Amazon DynamoDB.</p>
 
 @param request A container for the necessary parameters to execute the DescribePrefixLists service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribePrefixListsRequest
 @see AWSEC2DescribePrefixListsResult
 */
- (void)describePrefixLists:(AWSEC2DescribePrefixListsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribePrefixListsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the ID format settings for the root user and all IAM roles and IAM users that have explicitly specified a longer ID (17-character ID) preference. </p><p>By default, all IAM roles and IAM users default to the same ID settings as the root user, unless they explicitly override the settings. This request is useful for identifying those IAM users and IAM roles that have overridden the default ID settings.</p><p>The following resource types support longer IDs: <code>bundle</code> | <code>conversion-task</code> | <code>customer-gateway</code> | <code>dhcp-options</code> | <code>elastic-ip-allocation</code> | <code>elastic-ip-association</code> | <code>export-task</code> | <code>flow-log</code> | <code>image</code> | <code>import-task</code> | <code>instance</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-acl-association</code> | <code>network-interface</code> | <code>network-interface-attachment</code> | <code>prefix-list</code> | <code>reservation</code> | <code>route-table</code> | <code>route-table-association</code> | <code>security-group</code> | <code>snapshot</code> | <code>subnet</code> | <code>subnet-cidr-block-association</code> | <code>volume</code> | <code>vpc</code> | <code>vpc-cidr-block-association</code> | <code>vpc-endpoint</code> | <code>vpc-peering-connection</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>. </p>
 
 @param request A container for the necessary parameters to execute the DescribePrincipalIdFormat service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribePrincipalIdFormatResult`.
 
 @see AWSEC2DescribePrincipalIdFormatRequest
 @see AWSEC2DescribePrincipalIdFormatResult
 */
- (AWSTask<AWSEC2DescribePrincipalIdFormatResult *> *)describePrincipalIdFormat:(AWSEC2DescribePrincipalIdFormatRequest *)request;

/**
 <p>Describes the ID format settings for the root user and all IAM roles and IAM users that have explicitly specified a longer ID (17-character ID) preference. </p><p>By default, all IAM roles and IAM users default to the same ID settings as the root user, unless they explicitly override the settings. This request is useful for identifying those IAM users and IAM roles that have overridden the default ID settings.</p><p>The following resource types support longer IDs: <code>bundle</code> | <code>conversion-task</code> | <code>customer-gateway</code> | <code>dhcp-options</code> | <code>elastic-ip-allocation</code> | <code>elastic-ip-association</code> | <code>export-task</code> | <code>flow-log</code> | <code>image</code> | <code>import-task</code> | <code>instance</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-acl-association</code> | <code>network-interface</code> | <code>network-interface-attachment</code> | <code>prefix-list</code> | <code>reservation</code> | <code>route-table</code> | <code>route-table-association</code> | <code>security-group</code> | <code>snapshot</code> | <code>subnet</code> | <code>subnet-cidr-block-association</code> | <code>volume</code> | <code>vpc</code> | <code>vpc-cidr-block-association</code> | <code>vpc-endpoint</code> | <code>vpc-peering-connection</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>. </p>
 
 @param request A container for the necessary parameters to execute the DescribePrincipalIdFormat service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribePrincipalIdFormatRequest
 @see AWSEC2DescribePrincipalIdFormatResult
 */
- (void)describePrincipalIdFormat:(AWSEC2DescribePrincipalIdFormatRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribePrincipalIdFormatResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified IPv4 address pools.</p>
 
 @param request A container for the necessary parameters to execute the DescribePublicIpv4Pools service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribePublicIpv4PoolsResult`.
 
 @see AWSEC2DescribePublicIpv4PoolsRequest
 @see AWSEC2DescribePublicIpv4PoolsResult
 */
- (AWSTask<AWSEC2DescribePublicIpv4PoolsResult *> *)describePublicIpv4Pools:(AWSEC2DescribePublicIpv4PoolsRequest *)request;

/**
 <p>Describes the specified IPv4 address pools.</p>
 
 @param request A container for the necessary parameters to execute the DescribePublicIpv4Pools service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribePublicIpv4PoolsRequest
 @see AWSEC2DescribePublicIpv4PoolsResult
 */
- (void)describePublicIpv4Pools:(AWSEC2DescribePublicIpv4PoolsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribePublicIpv4PoolsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the Regions that are enabled for your account, or all Regions.</p><p>For a list of the Regions supported by Amazon EC2, see <a href="https://docs.aws.amazon.com/general/latest/gr/rande.html#ec2_region"> Regions and Endpoints</a>.</p><p>For information about enabling and disabling Regions for your account, see <a href="https://docs.aws.amazon.com/general/latest/gr/rande-manage.html">Managing AWS Regions</a> in the <i>AWS General Reference</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRegions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeRegionsResult`.
 
 @see AWSEC2DescribeRegionsRequest
 @see AWSEC2DescribeRegionsResult
 */
- (AWSTask<AWSEC2DescribeRegionsResult *> *)describeRegions:(AWSEC2DescribeRegionsRequest *)request;

/**
 <p>Describes the Regions that are enabled for your account, or all Regions.</p><p>For a list of the Regions supported by Amazon EC2, see <a href="https://docs.aws.amazon.com/general/latest/gr/rande.html#ec2_region"> Regions and Endpoints</a>.</p><p>For information about enabling and disabling Regions for your account, see <a href="https://docs.aws.amazon.com/general/latest/gr/rande-manage.html">Managing AWS Regions</a> in the <i>AWS General Reference</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRegions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeRegionsRequest
 @see AWSEC2DescribeRegionsResult
 */
- (void)describeRegions:(AWSEC2DescribeRegionsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeRegionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of the Reserved Instances that you purchased.</p><p>For more information about Reserved Instances, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts-on-demand-reserved-instances.html">Reserved Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeReservedInstancesResult`.
 
 @see AWSEC2DescribeReservedInstancesRequest
 @see AWSEC2DescribeReservedInstancesResult
 */
- (AWSTask<AWSEC2DescribeReservedInstancesResult *> *)describeReservedInstances:(AWSEC2DescribeReservedInstancesRequest *)request;

/**
 <p>Describes one or more of the Reserved Instances that you purchased.</p><p>For more information about Reserved Instances, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts-on-demand-reserved-instances.html">Reserved Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeReservedInstancesRequest
 @see AWSEC2DescribeReservedInstancesResult
 */
- (void)describeReservedInstances:(AWSEC2DescribeReservedInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeReservedInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes your account's Reserved Instance listings in the Reserved Instance Marketplace.</p><p>The Reserved Instance Marketplace matches sellers who want to resell Reserved Instance capacity that they no longer need with buyers who want to purchase additional capacity. Reserved Instances bought and sold through the Reserved Instance Marketplace work like any other Reserved Instances.</p><p>As a seller, you choose to list some or all of your Reserved Instances, and you specify the upfront price to receive for them. Your Reserved Instances are then listed in the Reserved Instance Marketplace and are available for purchase.</p><p>As a buyer, you specify the configuration of the Reserved Instance to purchase, and the Marketplace matches what you're searching for with what's available. The Marketplace first sells the lowest priced Reserved Instances to you, and continues to sell available Reserved Instance listings to you until your demand is met. You are charged based on the total price of all of the listings that you purchase.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedInstancesListings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeReservedInstancesListingsResult`.
 
 @see AWSEC2DescribeReservedInstancesListingsRequest
 @see AWSEC2DescribeReservedInstancesListingsResult
 */
- (AWSTask<AWSEC2DescribeReservedInstancesListingsResult *> *)describeReservedInstancesListings:(AWSEC2DescribeReservedInstancesListingsRequest *)request;

/**
 <p>Describes your account's Reserved Instance listings in the Reserved Instance Marketplace.</p><p>The Reserved Instance Marketplace matches sellers who want to resell Reserved Instance capacity that they no longer need with buyers who want to purchase additional capacity. Reserved Instances bought and sold through the Reserved Instance Marketplace work like any other Reserved Instances.</p><p>As a seller, you choose to list some or all of your Reserved Instances, and you specify the upfront price to receive for them. Your Reserved Instances are then listed in the Reserved Instance Marketplace and are available for purchase.</p><p>As a buyer, you specify the configuration of the Reserved Instance to purchase, and the Marketplace matches what you're searching for with what's available. The Marketplace first sells the lowest priced Reserved Instances to you, and continues to sell available Reserved Instance listings to you until your demand is met. You are charged based on the total price of all of the listings that you purchase.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedInstancesListings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeReservedInstancesListingsRequest
 @see AWSEC2DescribeReservedInstancesListingsResult
 */
- (void)describeReservedInstancesListings:(AWSEC2DescribeReservedInstancesListingsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeReservedInstancesListingsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the modifications made to your Reserved Instances. If no parameter is specified, information about all your Reserved Instances modification requests is returned. If a modification ID is specified, only information about the specific modification is returned.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-modifying.html">Modifying Reserved Instances</a> in the Amazon Elastic Compute Cloud User Guide.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedInstancesModifications service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeReservedInstancesModificationsResult`.
 
 @see AWSEC2DescribeReservedInstancesModificationsRequest
 @see AWSEC2DescribeReservedInstancesModificationsResult
 */
- (AWSTask<AWSEC2DescribeReservedInstancesModificationsResult *> *)describeReservedInstancesModifications:(AWSEC2DescribeReservedInstancesModificationsRequest *)request;

/**
 <p>Describes the modifications made to your Reserved Instances. If no parameter is specified, information about all your Reserved Instances modification requests is returned. If a modification ID is specified, only information about the specific modification is returned.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-modifying.html">Modifying Reserved Instances</a> in the Amazon Elastic Compute Cloud User Guide.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedInstancesModifications service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeReservedInstancesModificationsRequest
 @see AWSEC2DescribeReservedInstancesModificationsResult
 */
- (void)describeReservedInstancesModifications:(AWSEC2DescribeReservedInstancesModificationsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeReservedInstancesModificationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes Reserved Instance offerings that are available for purchase. With Reserved Instances, you purchase the right to launch instances for a period of time. During that time period, you do not receive insufficient capacity errors, and you pay a lower usage rate than the rate charged for On-Demand instances for the actual time used.</p><p>If you have listed your own Reserved Instances for sale in the Reserved Instance Marketplace, they will be excluded from these results. This is to ensure that you do not purchase your own Reserved Instances.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedInstancesOfferings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeReservedInstancesOfferingsResult`.
 
 @see AWSEC2DescribeReservedInstancesOfferingsRequest
 @see AWSEC2DescribeReservedInstancesOfferingsResult
 */
- (AWSTask<AWSEC2DescribeReservedInstancesOfferingsResult *> *)describeReservedInstancesOfferings:(AWSEC2DescribeReservedInstancesOfferingsRequest *)request;

/**
 <p>Describes Reserved Instance offerings that are available for purchase. With Reserved Instances, you purchase the right to launch instances for a period of time. During that time period, you do not receive insufficient capacity errors, and you pay a lower usage rate than the rate charged for On-Demand instances for the actual time used.</p><p>If you have listed your own Reserved Instances for sale in the Reserved Instance Marketplace, they will be excluded from these results. This is to ensure that you do not purchase your own Reserved Instances.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedInstancesOfferings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeReservedInstancesOfferingsRequest
 @see AWSEC2DescribeReservedInstancesOfferingsResult
 */
- (void)describeReservedInstancesOfferings:(AWSEC2DescribeReservedInstancesOfferingsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeReservedInstancesOfferingsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your route tables.</p><p>Each subnet in your VPC must be associated with a route table. If a subnet is not explicitly associated with any route table, it is implicitly associated with the main route table. This command does not return the subnet ID for implicit associations.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRouteTables service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeRouteTablesResult`.
 
 @see AWSEC2DescribeRouteTablesRequest
 @see AWSEC2DescribeRouteTablesResult
 */
- (AWSTask<AWSEC2DescribeRouteTablesResult *> *)describeRouteTables:(AWSEC2DescribeRouteTablesRequest *)request;

/**
 <p>Describes one or more of your route tables.</p><p>Each subnet in your VPC must be associated with a route table. If a subnet is not explicitly associated with any route table, it is implicitly associated with the main route table. This command does not return the subnet ID for implicit associations.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRouteTables service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeRouteTablesRequest
 @see AWSEC2DescribeRouteTablesResult
 */
- (void)describeRouteTables:(AWSEC2DescribeRouteTablesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeRouteTablesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Finds available schedules that meet the specified criteria.</p><p>You can search for an available schedule no more than 3 months in advance. You must meet the minimum required duration of 1,200 hours per year. For example, the minimum daily schedule is 4 hours, the minimum weekly schedule is 24 hours, and the minimum monthly schedule is 100 hours.</p><p>After you find a schedule that meets your needs, call <a>PurchaseScheduledInstances</a> to purchase Scheduled Instances with that schedule.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScheduledInstanceAvailability service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeScheduledInstanceAvailabilityResult`.
 
 @see AWSEC2DescribeScheduledInstanceAvailabilityRequest
 @see AWSEC2DescribeScheduledInstanceAvailabilityResult
 */
- (AWSTask<AWSEC2DescribeScheduledInstanceAvailabilityResult *> *)describeScheduledInstanceAvailability:(AWSEC2DescribeScheduledInstanceAvailabilityRequest *)request;

/**
 <p>Finds available schedules that meet the specified criteria.</p><p>You can search for an available schedule no more than 3 months in advance. You must meet the minimum required duration of 1,200 hours per year. For example, the minimum daily schedule is 4 hours, the minimum weekly schedule is 24 hours, and the minimum monthly schedule is 100 hours.</p><p>After you find a schedule that meets your needs, call <a>PurchaseScheduledInstances</a> to purchase Scheduled Instances with that schedule.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScheduledInstanceAvailability service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeScheduledInstanceAvailabilityRequest
 @see AWSEC2DescribeScheduledInstanceAvailabilityResult
 */
- (void)describeScheduledInstanceAvailability:(AWSEC2DescribeScheduledInstanceAvailabilityRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeScheduledInstanceAvailabilityResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified Scheduled Instances or all your Scheduled Instances.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScheduledInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeScheduledInstancesResult`.
 
 @see AWSEC2DescribeScheduledInstancesRequest
 @see AWSEC2DescribeScheduledInstancesResult
 */
- (AWSTask<AWSEC2DescribeScheduledInstancesResult *> *)describeScheduledInstances:(AWSEC2DescribeScheduledInstancesRequest *)request;

/**
 <p>Describes the specified Scheduled Instances or all your Scheduled Instances.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScheduledInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeScheduledInstancesRequest
 @see AWSEC2DescribeScheduledInstancesResult
 */
- (void)describeScheduledInstances:(AWSEC2DescribeScheduledInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeScheduledInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>[VPC only] Describes the VPCs on the other side of a VPC peering connection that are referencing the security groups you've specified in this request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSecurityGroupReferences service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSecurityGroupReferencesResult`.
 
 @see AWSEC2DescribeSecurityGroupReferencesRequest
 @see AWSEC2DescribeSecurityGroupReferencesResult
 */
- (AWSTask<AWSEC2DescribeSecurityGroupReferencesResult *> *)describeSecurityGroupReferences:(AWSEC2DescribeSecurityGroupReferencesRequest *)request;

/**
 <p>[VPC only] Describes the VPCs on the other side of a VPC peering connection that are referencing the security groups you've specified in this request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSecurityGroupReferences service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeSecurityGroupReferencesRequest
 @see AWSEC2DescribeSecurityGroupReferencesResult
 */
- (void)describeSecurityGroupReferences:(AWSEC2DescribeSecurityGroupReferencesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeSecurityGroupReferencesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified security groups or all of your security groups.</p><p>A security group is for use with instances either in the EC2-Classic platform or in a specific VPC. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html">Amazon EC2 Security Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i> and <a href="https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html">Security Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSecurityGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSecurityGroupsResult`.
 
 @see AWSEC2DescribeSecurityGroupsRequest
 @see AWSEC2DescribeSecurityGroupsResult
 */
- (AWSTask<AWSEC2DescribeSecurityGroupsResult *> *)describeSecurityGroups:(AWSEC2DescribeSecurityGroupsRequest *)request;

/**
 <p>Describes the specified security groups or all of your security groups.</p><p>A security group is for use with instances either in the EC2-Classic platform or in a specific VPC. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html">Amazon EC2 Security Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i> and <a href="https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html">Security Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSecurityGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeSecurityGroupsRequest
 @see AWSEC2DescribeSecurityGroupsResult
 */
- (void)describeSecurityGroups:(AWSEC2DescribeSecurityGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeSecurityGroupsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified attribute of the specified snapshot. You can specify only one attribute at a time.</p><p>For more information about EBS snapshots, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html">Amazon EBS Snapshots</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSnapshotAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSnapshotAttributeResult`.
 
 @see AWSEC2DescribeSnapshotAttributeRequest
 @see AWSEC2DescribeSnapshotAttributeResult
 */
- (AWSTask<AWSEC2DescribeSnapshotAttributeResult *> *)describeSnapshotAttribute:(AWSEC2DescribeSnapshotAttributeRequest *)request;

/**
 <p>Describes the specified attribute of the specified snapshot. You can specify only one attribute at a time.</p><p>For more information about EBS snapshots, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html">Amazon EBS Snapshots</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSnapshotAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeSnapshotAttributeRequest
 @see AWSEC2DescribeSnapshotAttributeResult
 */
- (void)describeSnapshotAttribute:(AWSEC2DescribeSnapshotAttributeRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeSnapshotAttributeResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified EBS snapshots available to you or all of the EBS snapshots available to you.</p><p>The snapshots available to you include public snapshots, private snapshots that you own, and private snapshots owned by other AWS accounts for which you have explicit create volume permissions.</p><p>The create volume permissions fall into the following categories:</p><ul><li><p><i>public</i>: The owner of the snapshot granted create volume permissions for the snapshot to the <code>all</code> group. All AWS accounts have create volume permissions for these snapshots.</p></li><li><p><i>explicit</i>: The owner of the snapshot granted create volume permissions to a specific AWS account.</p></li><li><p><i>implicit</i>: An AWS account has implicit create volume permissions for all snapshots it owns.</p></li></ul><p>The list of snapshots returned can be filtered by specifying snapshot IDs, snapshot owners, or AWS accounts with create volume permissions. If no options are specified, Amazon EC2 returns all snapshots for which you have create volume permissions.</p><p>If you specify one or more snapshot IDs, only snapshots that have the specified IDs are returned. If you specify an invalid snapshot ID, an error is returned. If you specify a snapshot ID for which you do not have access, it is not included in the returned results.</p><p>If you specify one or more snapshot owners using the <code>OwnerIds</code> option, only snapshots from the specified owners and for which you have access are returned. The results can include the AWS account IDs of the specified owners, <code>amazon</code> for snapshots owned by Amazon, or <code>self</code> for snapshots that you own.</p><p>If you specify a list of restorable users, only snapshots with create snapshot permissions for those users are returned. You can specify AWS account IDs (if you own the snapshots), <code>self</code> for snapshots for which you own or have explicit permissions, or <code>all</code> for public snapshots.</p><p>If you are describing a long list of snapshots, you can paginate the output to make the list more manageable. The <code>MaxResults</code> parameter sets the maximum number of results returned in a single page. If the list of results exceeds your <code>MaxResults</code> value, then that number of results is returned along with a <code>NextToken</code> value that can be passed to a subsequent <code>DescribeSnapshots</code> request to retrieve the remaining results.</p><p>To get the state of fast snapshot restores for a snapshot, use <a>DescribeFastSnapshotRestores</a>.</p><p>For more information about EBS snapshots, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html">Amazon EBS Snapshots</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSnapshots service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSnapshotsResult`.
 
 @see AWSEC2DescribeSnapshotsRequest
 @see AWSEC2DescribeSnapshotsResult
 */
- (AWSTask<AWSEC2DescribeSnapshotsResult *> *)describeSnapshots:(AWSEC2DescribeSnapshotsRequest *)request;

/**
 <p>Describes the specified EBS snapshots available to you or all of the EBS snapshots available to you.</p><p>The snapshots available to you include public snapshots, private snapshots that you own, and private snapshots owned by other AWS accounts for which you have explicit create volume permissions.</p><p>The create volume permissions fall into the following categories:</p><ul><li><p><i>public</i>: The owner of the snapshot granted create volume permissions for the snapshot to the <code>all</code> group. All AWS accounts have create volume permissions for these snapshots.</p></li><li><p><i>explicit</i>: The owner of the snapshot granted create volume permissions to a specific AWS account.</p></li><li><p><i>implicit</i>: An AWS account has implicit create volume permissions for all snapshots it owns.</p></li></ul><p>The list of snapshots returned can be filtered by specifying snapshot IDs, snapshot owners, or AWS accounts with create volume permissions. If no options are specified, Amazon EC2 returns all snapshots for which you have create volume permissions.</p><p>If you specify one or more snapshot IDs, only snapshots that have the specified IDs are returned. If you specify an invalid snapshot ID, an error is returned. If you specify a snapshot ID for which you do not have access, it is not included in the returned results.</p><p>If you specify one or more snapshot owners using the <code>OwnerIds</code> option, only snapshots from the specified owners and for which you have access are returned. The results can include the AWS account IDs of the specified owners, <code>amazon</code> for snapshots owned by Amazon, or <code>self</code> for snapshots that you own.</p><p>If you specify a list of restorable users, only snapshots with create snapshot permissions for those users are returned. You can specify AWS account IDs (if you own the snapshots), <code>self</code> for snapshots for which you own or have explicit permissions, or <code>all</code> for public snapshots.</p><p>If you are describing a long list of snapshots, you can paginate the output to make the list more manageable. The <code>MaxResults</code> parameter sets the maximum number of results returned in a single page. If the list of results exceeds your <code>MaxResults</code> value, then that number of results is returned along with a <code>NextToken</code> value that can be passed to a subsequent <code>DescribeSnapshots</code> request to retrieve the remaining results.</p><p>To get the state of fast snapshot restores for a snapshot, use <a>DescribeFastSnapshotRestores</a>.</p><p>For more information about EBS snapshots, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html">Amazon EBS Snapshots</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSnapshots service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeSnapshotsRequest
 @see AWSEC2DescribeSnapshotsResult
 */
- (void)describeSnapshots:(AWSEC2DescribeSnapshotsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeSnapshotsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the data feed for Spot Instances. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-data-feeds.html">Spot Instance Data Feed</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSpotDatafeedSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSpotDatafeedSubscriptionResult`.
 
 @see AWSEC2DescribeSpotDatafeedSubscriptionRequest
 @see AWSEC2DescribeSpotDatafeedSubscriptionResult
 */
- (AWSTask<AWSEC2DescribeSpotDatafeedSubscriptionResult *> *)describeSpotDatafeedSubscription:(AWSEC2DescribeSpotDatafeedSubscriptionRequest *)request;

/**
 <p>Describes the data feed for Spot Instances. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-data-feeds.html">Spot Instance Data Feed</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSpotDatafeedSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeSpotDatafeedSubscriptionRequest
 @see AWSEC2DescribeSpotDatafeedSubscriptionResult
 */
- (void)describeSpotDatafeedSubscription:(AWSEC2DescribeSpotDatafeedSubscriptionRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeSpotDatafeedSubscriptionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the running instances for the specified Spot Fleet.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSpotFleetInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSpotFleetInstancesResponse`.
 
 @see AWSEC2DescribeSpotFleetInstancesRequest
 @see AWSEC2DescribeSpotFleetInstancesResponse
 */
- (AWSTask<AWSEC2DescribeSpotFleetInstancesResponse *> *)describeSpotFleetInstances:(AWSEC2DescribeSpotFleetInstancesRequest *)request;

/**
 <p>Describes the running instances for the specified Spot Fleet.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSpotFleetInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeSpotFleetInstancesRequest
 @see AWSEC2DescribeSpotFleetInstancesResponse
 */
- (void)describeSpotFleetInstances:(AWSEC2DescribeSpotFleetInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeSpotFleetInstancesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the events for the specified Spot Fleet request during the specified time.</p><p>Spot Fleet events are delayed by up to 30 seconds before they can be described. This ensures that you can query by the last evaluated time and not miss a recorded event. Spot Fleet events are available for 48 hours.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSpotFleetRequestHistory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSpotFleetRequestHistoryResponse`.
 
 @see AWSEC2DescribeSpotFleetRequestHistoryRequest
 @see AWSEC2DescribeSpotFleetRequestHistoryResponse
 */
- (AWSTask<AWSEC2DescribeSpotFleetRequestHistoryResponse *> *)describeSpotFleetRequestHistory:(AWSEC2DescribeSpotFleetRequestHistoryRequest *)request;

/**
 <p>Describes the events for the specified Spot Fleet request during the specified time.</p><p>Spot Fleet events are delayed by up to 30 seconds before they can be described. This ensures that you can query by the last evaluated time and not miss a recorded event. Spot Fleet events are available for 48 hours.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSpotFleetRequestHistory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeSpotFleetRequestHistoryRequest
 @see AWSEC2DescribeSpotFleetRequestHistoryResponse
 */
- (void)describeSpotFleetRequestHistory:(AWSEC2DescribeSpotFleetRequestHistoryRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeSpotFleetRequestHistoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes your Spot Fleet requests.</p><p>Spot Fleet requests are deleted 48 hours after they are canceled and their instances are terminated.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSpotFleetRequests service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSpotFleetRequestsResponse`.
 
 @see AWSEC2DescribeSpotFleetRequestsRequest
 @see AWSEC2DescribeSpotFleetRequestsResponse
 */
- (AWSTask<AWSEC2DescribeSpotFleetRequestsResponse *> *)describeSpotFleetRequests:(AWSEC2DescribeSpotFleetRequestsRequest *)request;

/**
 <p>Describes your Spot Fleet requests.</p><p>Spot Fleet requests are deleted 48 hours after they are canceled and their instances are terminated.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSpotFleetRequests service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeSpotFleetRequestsRequest
 @see AWSEC2DescribeSpotFleetRequestsResponse
 */
- (void)describeSpotFleetRequests:(AWSEC2DescribeSpotFleetRequestsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeSpotFleetRequestsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified Spot Instance requests.</p><p>You can use <code>DescribeSpotInstanceRequests</code> to find a running Spot Instance by examining the response. If the status of the Spot Instance is <code>fulfilled</code>, the instance ID appears in the response and contains the identifier of the instance. Alternatively, you can use <a>DescribeInstances</a> with a filter to look for instances where the instance lifecycle is <code>spot</code>.</p><p>We recommend that you set <code>MaxResults</code> to a value between 5 and 1000 to limit the number of results returned. This paginates the output, which makes the list more manageable and returns the results faster. If the list of results exceeds your <code>MaxResults</code> value, then that number of results is returned along with a <code>NextToken</code> value that can be passed to a subsequent <code>DescribeSpotInstanceRequests</code> request to retrieve the remaining results.</p><p>Spot Instance requests are deleted four hours after they are canceled and their instances are terminated.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSpotInstanceRequests service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSpotInstanceRequestsResult`.
 
 @see AWSEC2DescribeSpotInstanceRequestsRequest
 @see AWSEC2DescribeSpotInstanceRequestsResult
 */
- (AWSTask<AWSEC2DescribeSpotInstanceRequestsResult *> *)describeSpotInstanceRequests:(AWSEC2DescribeSpotInstanceRequestsRequest *)request;

/**
 <p>Describes the specified Spot Instance requests.</p><p>You can use <code>DescribeSpotInstanceRequests</code> to find a running Spot Instance by examining the response. If the status of the Spot Instance is <code>fulfilled</code>, the instance ID appears in the response and contains the identifier of the instance. Alternatively, you can use <a>DescribeInstances</a> with a filter to look for instances where the instance lifecycle is <code>spot</code>.</p><p>We recommend that you set <code>MaxResults</code> to a value between 5 and 1000 to limit the number of results returned. This paginates the output, which makes the list more manageable and returns the results faster. If the list of results exceeds your <code>MaxResults</code> value, then that number of results is returned along with a <code>NextToken</code> value that can be passed to a subsequent <code>DescribeSpotInstanceRequests</code> request to retrieve the remaining results.</p><p>Spot Instance requests are deleted four hours after they are canceled and their instances are terminated.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSpotInstanceRequests service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeSpotInstanceRequestsRequest
 @see AWSEC2DescribeSpotInstanceRequestsResult
 */
- (void)describeSpotInstanceRequests:(AWSEC2DescribeSpotInstanceRequestsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeSpotInstanceRequestsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the Spot price history. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances-history.html">Spot Instance Pricing History</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p><p>When you specify a start and end time, this operation returns the prices of the instance types within the time range that you specified and the time when the price changed. The price is valid within the time period that you specified; the response merely indicates the last time that the price changed.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSpotPriceHistory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSpotPriceHistoryResult`.
 
 @see AWSEC2DescribeSpotPriceHistoryRequest
 @see AWSEC2DescribeSpotPriceHistoryResult
 */
- (AWSTask<AWSEC2DescribeSpotPriceHistoryResult *> *)describeSpotPriceHistory:(AWSEC2DescribeSpotPriceHistoryRequest *)request;

/**
 <p>Describes the Spot price history. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances-history.html">Spot Instance Pricing History</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p><p>When you specify a start and end time, this operation returns the prices of the instance types within the time range that you specified and the time when the price changed. The price is valid within the time period that you specified; the response merely indicates the last time that the price changed.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSpotPriceHistory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeSpotPriceHistoryRequest
 @see AWSEC2DescribeSpotPriceHistoryResult
 */
- (void)describeSpotPriceHistory:(AWSEC2DescribeSpotPriceHistoryRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeSpotPriceHistoryResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>[VPC only] Describes the stale security group rules for security groups in a specified VPC. Rules are stale when they reference a deleted security group in a peer VPC, or a security group in a peer VPC for which the VPC peering connection has been deleted.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStaleSecurityGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeStaleSecurityGroupsResult`.
 
 @see AWSEC2DescribeStaleSecurityGroupsRequest
 @see AWSEC2DescribeStaleSecurityGroupsResult
 */
- (AWSTask<AWSEC2DescribeStaleSecurityGroupsResult *> *)describeStaleSecurityGroups:(AWSEC2DescribeStaleSecurityGroupsRequest *)request;

/**
 <p>[VPC only] Describes the stale security group rules for security groups in a specified VPC. Rules are stale when they reference a deleted security group in a peer VPC, or a security group in a peer VPC for which the VPC peering connection has been deleted.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStaleSecurityGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeStaleSecurityGroupsRequest
 @see AWSEC2DescribeStaleSecurityGroupsResult
 */
- (void)describeStaleSecurityGroups:(AWSEC2DescribeStaleSecurityGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeStaleSecurityGroupsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your subnets.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">Your VPC and Subnets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSubnets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSubnetsResult`.
 
 @see AWSEC2DescribeSubnetsRequest
 @see AWSEC2DescribeSubnetsResult
 */
- (AWSTask<AWSEC2DescribeSubnetsResult *> *)describeSubnets:(AWSEC2DescribeSubnetsRequest *)request;

/**
 <p>Describes one or more of your subnets.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">Your VPC and Subnets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSubnets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeSubnetsRequest
 @see AWSEC2DescribeSubnetsResult
 */
- (void)describeSubnets:(AWSEC2DescribeSubnetsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeSubnetsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified tags for your EC2 resources.</p><p>For more information about tags, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeTagsResult`.
 
 @see AWSEC2DescribeTagsRequest
 @see AWSEC2DescribeTagsResult
 */
- (AWSTask<AWSEC2DescribeTagsResult *> *)describeTags:(AWSEC2DescribeTagsRequest *)request;

/**
 <p>Describes the specified tags for your EC2 resources.</p><p>For more information about tags, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeTagsRequest
 @see AWSEC2DescribeTagsResult
 */
- (void)describeTags:(AWSEC2DescribeTagsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeTagsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more Traffic Mirror filters.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrafficMirrorFilters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeTrafficMirrorFiltersResult`.
 
 @see AWSEC2DescribeTrafficMirrorFiltersRequest
 @see AWSEC2DescribeTrafficMirrorFiltersResult
 */
- (AWSTask<AWSEC2DescribeTrafficMirrorFiltersResult *> *)describeTrafficMirrorFilters:(AWSEC2DescribeTrafficMirrorFiltersRequest *)request;

/**
 <p>Describes one or more Traffic Mirror filters.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrafficMirrorFilters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeTrafficMirrorFiltersRequest
 @see AWSEC2DescribeTrafficMirrorFiltersResult
 */
- (void)describeTrafficMirrorFilters:(AWSEC2DescribeTrafficMirrorFiltersRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeTrafficMirrorFiltersResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more Traffic Mirror sessions. By default, all Traffic Mirror sessions are described. Alternatively, you can filter the results.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrafficMirrorSessions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeTrafficMirrorSessionsResult`.
 
 @see AWSEC2DescribeTrafficMirrorSessionsRequest
 @see AWSEC2DescribeTrafficMirrorSessionsResult
 */
- (AWSTask<AWSEC2DescribeTrafficMirrorSessionsResult *> *)describeTrafficMirrorSessions:(AWSEC2DescribeTrafficMirrorSessionsRequest *)request;

/**
 <p>Describes one or more Traffic Mirror sessions. By default, all Traffic Mirror sessions are described. Alternatively, you can filter the results.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrafficMirrorSessions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeTrafficMirrorSessionsRequest
 @see AWSEC2DescribeTrafficMirrorSessionsResult
 */
- (void)describeTrafficMirrorSessions:(AWSEC2DescribeTrafficMirrorSessionsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeTrafficMirrorSessionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Information about one or more Traffic Mirror targets.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrafficMirrorTargets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeTrafficMirrorTargetsResult`.
 
 @see AWSEC2DescribeTrafficMirrorTargetsRequest
 @see AWSEC2DescribeTrafficMirrorTargetsResult
 */
- (AWSTask<AWSEC2DescribeTrafficMirrorTargetsResult *> *)describeTrafficMirrorTargets:(AWSEC2DescribeTrafficMirrorTargetsRequest *)request;

/**
 <p>Information about one or more Traffic Mirror targets.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTrafficMirrorTargets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeTrafficMirrorTargetsRequest
 @see AWSEC2DescribeTrafficMirrorTargetsResult
 */
- (void)describeTrafficMirrorTargets:(AWSEC2DescribeTrafficMirrorTargetsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeTrafficMirrorTargetsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more attachments between resources and transit gateways. By default, all attachments are described. Alternatively, you can filter the results by attachment ID, attachment state, resource ID, or resource owner.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTransitGatewayAttachments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeTransitGatewayAttachmentsResult`.
 
 @see AWSEC2DescribeTransitGatewayAttachmentsRequest
 @see AWSEC2DescribeTransitGatewayAttachmentsResult
 */
- (AWSTask<AWSEC2DescribeTransitGatewayAttachmentsResult *> *)describeTransitGatewayAttachments:(AWSEC2DescribeTransitGatewayAttachmentsRequest *)request;

/**
 <p>Describes one or more attachments between resources and transit gateways. By default, all attachments are described. Alternatively, you can filter the results by attachment ID, attachment state, resource ID, or resource owner.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTransitGatewayAttachments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeTransitGatewayAttachmentsRequest
 @see AWSEC2DescribeTransitGatewayAttachmentsResult
 */
- (void)describeTransitGatewayAttachments:(AWSEC2DescribeTransitGatewayAttachmentsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeTransitGatewayAttachmentsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more transit gateway multicast domains.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTransitGatewayMulticastDomains service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeTransitGatewayMulticastDomainsResult`.
 
 @see AWSEC2DescribeTransitGatewayMulticastDomainsRequest
 @see AWSEC2DescribeTransitGatewayMulticastDomainsResult
 */
- (AWSTask<AWSEC2DescribeTransitGatewayMulticastDomainsResult *> *)describeTransitGatewayMulticastDomains:(AWSEC2DescribeTransitGatewayMulticastDomainsRequest *)request;

/**
 <p>Describes one or more transit gateway multicast domains.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTransitGatewayMulticastDomains service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeTransitGatewayMulticastDomainsRequest
 @see AWSEC2DescribeTransitGatewayMulticastDomainsResult
 */
- (void)describeTransitGatewayMulticastDomains:(AWSEC2DescribeTransitGatewayMulticastDomainsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeTransitGatewayMulticastDomainsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes your transit gateway peering attachments.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTransitGatewayPeeringAttachments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeTransitGatewayPeeringAttachmentsResult`.
 
 @see AWSEC2DescribeTransitGatewayPeeringAttachmentsRequest
 @see AWSEC2DescribeTransitGatewayPeeringAttachmentsResult
 */
- (AWSTask<AWSEC2DescribeTransitGatewayPeeringAttachmentsResult *> *)describeTransitGatewayPeeringAttachments:(AWSEC2DescribeTransitGatewayPeeringAttachmentsRequest *)request;

/**
 <p>Describes your transit gateway peering attachments.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTransitGatewayPeeringAttachments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeTransitGatewayPeeringAttachmentsRequest
 @see AWSEC2DescribeTransitGatewayPeeringAttachmentsResult
 */
- (void)describeTransitGatewayPeeringAttachments:(AWSEC2DescribeTransitGatewayPeeringAttachmentsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeTransitGatewayPeeringAttachmentsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more transit gateway route tables. By default, all transit gateway route tables are described. Alternatively, you can filter the results.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTransitGatewayRouteTables service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeTransitGatewayRouteTablesResult`.
 
 @see AWSEC2DescribeTransitGatewayRouteTablesRequest
 @see AWSEC2DescribeTransitGatewayRouteTablesResult
 */
- (AWSTask<AWSEC2DescribeTransitGatewayRouteTablesResult *> *)describeTransitGatewayRouteTables:(AWSEC2DescribeTransitGatewayRouteTablesRequest *)request;

/**
 <p>Describes one or more transit gateway route tables. By default, all transit gateway route tables are described. Alternatively, you can filter the results.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTransitGatewayRouteTables service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeTransitGatewayRouteTablesRequest
 @see AWSEC2DescribeTransitGatewayRouteTablesResult
 */
- (void)describeTransitGatewayRouteTables:(AWSEC2DescribeTransitGatewayRouteTablesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeTransitGatewayRouteTablesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more VPC attachments. By default, all VPC attachments are described. Alternatively, you can filter the results.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTransitGatewayVpcAttachments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeTransitGatewayVpcAttachmentsResult`.
 
 @see AWSEC2DescribeTransitGatewayVpcAttachmentsRequest
 @see AWSEC2DescribeTransitGatewayVpcAttachmentsResult
 */
- (AWSTask<AWSEC2DescribeTransitGatewayVpcAttachmentsResult *> *)describeTransitGatewayVpcAttachments:(AWSEC2DescribeTransitGatewayVpcAttachmentsRequest *)request;

/**
 <p>Describes one or more VPC attachments. By default, all VPC attachments are described. Alternatively, you can filter the results.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTransitGatewayVpcAttachments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeTransitGatewayVpcAttachmentsRequest
 @see AWSEC2DescribeTransitGatewayVpcAttachmentsResult
 */
- (void)describeTransitGatewayVpcAttachments:(AWSEC2DescribeTransitGatewayVpcAttachmentsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeTransitGatewayVpcAttachmentsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more transit gateways. By default, all transit gateways are described. Alternatively, you can filter the results.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTransitGateways service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeTransitGatewaysResult`.
 
 @see AWSEC2DescribeTransitGatewaysRequest
 @see AWSEC2DescribeTransitGatewaysResult
 */
- (AWSTask<AWSEC2DescribeTransitGatewaysResult *> *)describeTransitGateways:(AWSEC2DescribeTransitGatewaysRequest *)request;

/**
 <p>Describes one or more transit gateways. By default, all transit gateways are described. Alternatively, you can filter the results.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTransitGateways service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeTransitGatewaysRequest
 @see AWSEC2DescribeTransitGatewaysResult
 */
- (void)describeTransitGateways:(AWSEC2DescribeTransitGatewaysRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeTransitGatewaysResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified attribute of the specified volume. You can specify only one attribute at a time.</p><p>For more information about EBS volumes, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumes.html">Amazon EBS Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVolumeAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVolumeAttributeResult`.
 
 @see AWSEC2DescribeVolumeAttributeRequest
 @see AWSEC2DescribeVolumeAttributeResult
 */
- (AWSTask<AWSEC2DescribeVolumeAttributeResult *> *)describeVolumeAttribute:(AWSEC2DescribeVolumeAttributeRequest *)request;

/**
 <p>Describes the specified attribute of the specified volume. You can specify only one attribute at a time.</p><p>For more information about EBS volumes, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumes.html">Amazon EBS Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVolumeAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeVolumeAttributeRequest
 @see AWSEC2DescribeVolumeAttributeResult
 */
- (void)describeVolumeAttribute:(AWSEC2DescribeVolumeAttributeRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeVolumeAttributeResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the status of the specified volumes. Volume status provides the result of the checks performed on your volumes to determine events that can impair the performance of your volumes. The performance of a volume can be affected if an issue occurs on the volume's underlying host. If the volume's underlying host experiences a power outage or system issue, after the system is restored, there could be data inconsistencies on the volume. Volume events notify you if this occurs. Volume actions notify you if any action needs to be taken in response to the event.</p><p>The <code>DescribeVolumeStatus</code> operation provides the following information about the specified volumes:</p><p><i>Status</i>: Reflects the current status of the volume. The possible values are <code>ok</code>, <code>impaired</code> , <code>warning</code>, or <code>insufficient-data</code>. If all checks pass, the overall status of the volume is <code>ok</code>. If the check fails, the overall status is <code>impaired</code>. If the status is <code>insufficient-data</code>, then the checks may still be taking place on your volume at the time. We recommend that you retry the request. For more information about volume status, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-volume-status.html">Monitoring the Status of Your Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p><i>Events</i>: Reflect the cause of a volume status and may require you to take action. For example, if your volume returns an <code>impaired</code> status, then the volume event might be <code>potential-data-inconsistency</code>. This means that your volume has been affected by an issue with the underlying host, has all I/O operations disabled, and may have inconsistent data.</p><p><i>Actions</i>: Reflect the actions you may have to take in response to an event. For example, if the status of the volume is <code>impaired</code> and the volume event shows <code>potential-data-inconsistency</code>, then the action shows <code>enable-volume-io</code>. This means that you may want to enable the I/O operations for the volume by calling the <a>EnableVolumeIO</a> action and then check the volume for data consistency.</p><p>Volume status is based on the volume status checks, and does not reflect the volume state. Therefore, volume status does not indicate volumes in the <code>error</code> state (for example, when a volume is incapable of accepting I/O.)</p>
 
 @param request A container for the necessary parameters to execute the DescribeVolumeStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVolumeStatusResult`.
 
 @see AWSEC2DescribeVolumeStatusRequest
 @see AWSEC2DescribeVolumeStatusResult
 */
- (AWSTask<AWSEC2DescribeVolumeStatusResult *> *)describeVolumeStatus:(AWSEC2DescribeVolumeStatusRequest *)request;

/**
 <p>Describes the status of the specified volumes. Volume status provides the result of the checks performed on your volumes to determine events that can impair the performance of your volumes. The performance of a volume can be affected if an issue occurs on the volume's underlying host. If the volume's underlying host experiences a power outage or system issue, after the system is restored, there could be data inconsistencies on the volume. Volume events notify you if this occurs. Volume actions notify you if any action needs to be taken in response to the event.</p><p>The <code>DescribeVolumeStatus</code> operation provides the following information about the specified volumes:</p><p><i>Status</i>: Reflects the current status of the volume. The possible values are <code>ok</code>, <code>impaired</code> , <code>warning</code>, or <code>insufficient-data</code>. If all checks pass, the overall status of the volume is <code>ok</code>. If the check fails, the overall status is <code>impaired</code>. If the status is <code>insufficient-data</code>, then the checks may still be taking place on your volume at the time. We recommend that you retry the request. For more information about volume status, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-volume-status.html">Monitoring the Status of Your Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p><i>Events</i>: Reflect the cause of a volume status and may require you to take action. For example, if your volume returns an <code>impaired</code> status, then the volume event might be <code>potential-data-inconsistency</code>. This means that your volume has been affected by an issue with the underlying host, has all I/O operations disabled, and may have inconsistent data.</p><p><i>Actions</i>: Reflect the actions you may have to take in response to an event. For example, if the status of the volume is <code>impaired</code> and the volume event shows <code>potential-data-inconsistency</code>, then the action shows <code>enable-volume-io</code>. This means that you may want to enable the I/O operations for the volume by calling the <a>EnableVolumeIO</a> action and then check the volume for data consistency.</p><p>Volume status is based on the volume status checks, and does not reflect the volume state. Therefore, volume status does not indicate volumes in the <code>error</code> state (for example, when a volume is incapable of accepting I/O.)</p>
 
 @param request A container for the necessary parameters to execute the DescribeVolumeStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeVolumeStatusRequest
 @see AWSEC2DescribeVolumeStatusResult
 */
- (void)describeVolumeStatus:(AWSEC2DescribeVolumeStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeVolumeStatusResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified EBS volumes or all of your EBS volumes.</p><p>If you are describing a long list of volumes, you can paginate the output to make the list more manageable. The <code>MaxResults</code> parameter sets the maximum number of results returned in a single page. If the list of results exceeds your <code>MaxResults</code> value, then that number of results is returned along with a <code>NextToken</code> value that can be passed to a subsequent <code>DescribeVolumes</code> request to retrieve the remaining results.</p><p>For more information about EBS volumes, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumes.html">Amazon EBS Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVolumes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVolumesResult`.
 
 @see AWSEC2DescribeVolumesRequest
 @see AWSEC2DescribeVolumesResult
 */
- (AWSTask<AWSEC2DescribeVolumesResult *> *)describeVolumes:(AWSEC2DescribeVolumesRequest *)request;

/**
 <p>Describes the specified EBS volumes or all of your EBS volumes.</p><p>If you are describing a long list of volumes, you can paginate the output to make the list more manageable. The <code>MaxResults</code> parameter sets the maximum number of results returned in a single page. If the list of results exceeds your <code>MaxResults</code> value, then that number of results is returned along with a <code>NextToken</code> value that can be passed to a subsequent <code>DescribeVolumes</code> request to retrieve the remaining results.</p><p>For more information about EBS volumes, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumes.html">Amazon EBS Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVolumes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeVolumesRequest
 @see AWSEC2DescribeVolumesResult
 */
- (void)describeVolumes:(AWSEC2DescribeVolumesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeVolumesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Reports the current modification status of EBS volumes.</p><p>Current-generation EBS volumes support modification of attributes including type, size, and (for <code>io1</code> volumes) IOPS provisioning while either attached to or detached from an instance. Following an action from the API or the console to modify a volume, the status of the modification may be <code>modifying</code>, <code>optimizing</code>, <code>completed</code>, or <code>failed</code>. If a volume has never been modified, then certain elements of the returned <code>VolumeModification</code> objects are null. </p><p> You can also use CloudWatch Events to check the status of a modification to an EBS volume. For information about CloudWatch Events, see the <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/">Amazon CloudWatch Events User Guide</a>. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html#monitoring_mods">Monitoring Volume Modifications"</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVolumesModifications service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVolumesModificationsResult`.
 
 @see AWSEC2DescribeVolumesModificationsRequest
 @see AWSEC2DescribeVolumesModificationsResult
 */
- (AWSTask<AWSEC2DescribeVolumesModificationsResult *> *)describeVolumesModifications:(AWSEC2DescribeVolumesModificationsRequest *)request;

/**
 <p>Reports the current modification status of EBS volumes.</p><p>Current-generation EBS volumes support modification of attributes including type, size, and (for <code>io1</code> volumes) IOPS provisioning while either attached to or detached from an instance. Following an action from the API or the console to modify a volume, the status of the modification may be <code>modifying</code>, <code>optimizing</code>, <code>completed</code>, or <code>failed</code>. If a volume has never been modified, then certain elements of the returned <code>VolumeModification</code> objects are null. </p><p> You can also use CloudWatch Events to check the status of a modification to an EBS volume. For information about CloudWatch Events, see the <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/">Amazon CloudWatch Events User Guide</a>. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html#monitoring_mods">Monitoring Volume Modifications"</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVolumesModifications service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeVolumesModificationsRequest
 @see AWSEC2DescribeVolumesModificationsResult
 */
- (void)describeVolumesModifications:(AWSEC2DescribeVolumesModificationsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeVolumesModificationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified attribute of the specified VPC. You can specify only one attribute at a time.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVpcAttributeResult`.
 
 @see AWSEC2DescribeVpcAttributeRequest
 @see AWSEC2DescribeVpcAttributeResult
 */
- (AWSTask<AWSEC2DescribeVpcAttributeResult *> *)describeVpcAttribute:(AWSEC2DescribeVpcAttributeRequest *)request;

/**
 <p>Describes the specified attribute of the specified VPC. You can specify only one attribute at a time.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeVpcAttributeRequest
 @see AWSEC2DescribeVpcAttributeResult
 */
- (void)describeVpcAttribute:(AWSEC2DescribeVpcAttributeRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeVpcAttributeResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the ClassicLink status of one or more VPCs.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcClassicLink service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVpcClassicLinkResult`.
 
 @see AWSEC2DescribeVpcClassicLinkRequest
 @see AWSEC2DescribeVpcClassicLinkResult
 */
- (AWSTask<AWSEC2DescribeVpcClassicLinkResult *> *)describeVpcClassicLink:(AWSEC2DescribeVpcClassicLinkRequest *)request;

/**
 <p>Describes the ClassicLink status of one or more VPCs.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcClassicLink service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeVpcClassicLinkRequest
 @see AWSEC2DescribeVpcClassicLinkResult
 */
- (void)describeVpcClassicLink:(AWSEC2DescribeVpcClassicLinkRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeVpcClassicLinkResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the ClassicLink DNS support status of one or more VPCs. If enabled, the DNS hostname of a linked EC2-Classic instance resolves to its private IP address when addressed from an instance in the VPC to which it's linked. Similarly, the DNS hostname of an instance in a VPC resolves to its private IP address when addressed from a linked EC2-Classic instance. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcClassicLinkDnsSupport service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVpcClassicLinkDnsSupportResult`.
 
 @see AWSEC2DescribeVpcClassicLinkDnsSupportRequest
 @see AWSEC2DescribeVpcClassicLinkDnsSupportResult
 */
- (AWSTask<AWSEC2DescribeVpcClassicLinkDnsSupportResult *> *)describeVpcClassicLinkDnsSupport:(AWSEC2DescribeVpcClassicLinkDnsSupportRequest *)request;

/**
 <p>Describes the ClassicLink DNS support status of one or more VPCs. If enabled, the DNS hostname of a linked EC2-Classic instance resolves to its private IP address when addressed from an instance in the VPC to which it's linked. Similarly, the DNS hostname of an instance in a VPC resolves to its private IP address when addressed from a linked EC2-Classic instance. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcClassicLinkDnsSupport service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeVpcClassicLinkDnsSupportRequest
 @see AWSEC2DescribeVpcClassicLinkDnsSupportResult
 */
- (void)describeVpcClassicLinkDnsSupport:(AWSEC2DescribeVpcClassicLinkDnsSupportRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeVpcClassicLinkDnsSupportResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the connection notifications for VPC endpoints and VPC endpoint services.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcEndpointConnectionNotifications service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVpcEndpointConnectionNotificationsResult`.
 
 @see AWSEC2DescribeVpcEndpointConnectionNotificationsRequest
 @see AWSEC2DescribeVpcEndpointConnectionNotificationsResult
 */
- (AWSTask<AWSEC2DescribeVpcEndpointConnectionNotificationsResult *> *)describeVpcEndpointConnectionNotifications:(AWSEC2DescribeVpcEndpointConnectionNotificationsRequest *)request;

/**
 <p>Describes the connection notifications for VPC endpoints and VPC endpoint services.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcEndpointConnectionNotifications service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeVpcEndpointConnectionNotificationsRequest
 @see AWSEC2DescribeVpcEndpointConnectionNotificationsResult
 */
- (void)describeVpcEndpointConnectionNotifications:(AWSEC2DescribeVpcEndpointConnectionNotificationsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeVpcEndpointConnectionNotificationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the VPC endpoint connections to your VPC endpoint services, including any endpoints that are pending your acceptance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcEndpointConnections service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVpcEndpointConnectionsResult`.
 
 @see AWSEC2DescribeVpcEndpointConnectionsRequest
 @see AWSEC2DescribeVpcEndpointConnectionsResult
 */
- (AWSTask<AWSEC2DescribeVpcEndpointConnectionsResult *> *)describeVpcEndpointConnections:(AWSEC2DescribeVpcEndpointConnectionsRequest *)request;

/**
 <p>Describes the VPC endpoint connections to your VPC endpoint services, including any endpoints that are pending your acceptance.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcEndpointConnections service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeVpcEndpointConnectionsRequest
 @see AWSEC2DescribeVpcEndpointConnectionsResult
 */
- (void)describeVpcEndpointConnections:(AWSEC2DescribeVpcEndpointConnectionsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeVpcEndpointConnectionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the VPC endpoint service configurations in your account (your services).</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcEndpointServiceConfigurations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVpcEndpointServiceConfigurationsResult`.
 
 @see AWSEC2DescribeVpcEndpointServiceConfigurationsRequest
 @see AWSEC2DescribeVpcEndpointServiceConfigurationsResult
 */
- (AWSTask<AWSEC2DescribeVpcEndpointServiceConfigurationsResult *> *)describeVpcEndpointServiceConfigurations:(AWSEC2DescribeVpcEndpointServiceConfigurationsRequest *)request;

/**
 <p>Describes the VPC endpoint service configurations in your account (your services).</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcEndpointServiceConfigurations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeVpcEndpointServiceConfigurationsRequest
 @see AWSEC2DescribeVpcEndpointServiceConfigurationsResult
 */
- (void)describeVpcEndpointServiceConfigurations:(AWSEC2DescribeVpcEndpointServiceConfigurationsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeVpcEndpointServiceConfigurationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the principals (service consumers) that are permitted to discover your VPC endpoint service.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcEndpointServicePermissions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVpcEndpointServicePermissionsResult`.
 
 @see AWSEC2DescribeVpcEndpointServicePermissionsRequest
 @see AWSEC2DescribeVpcEndpointServicePermissionsResult
 */
- (AWSTask<AWSEC2DescribeVpcEndpointServicePermissionsResult *> *)describeVpcEndpointServicePermissions:(AWSEC2DescribeVpcEndpointServicePermissionsRequest *)request;

/**
 <p>Describes the principals (service consumers) that are permitted to discover your VPC endpoint service.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcEndpointServicePermissions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeVpcEndpointServicePermissionsRequest
 @see AWSEC2DescribeVpcEndpointServicePermissionsResult
 */
- (void)describeVpcEndpointServicePermissions:(AWSEC2DescribeVpcEndpointServicePermissionsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeVpcEndpointServicePermissionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes available services to which you can create a VPC endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcEndpointServices service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVpcEndpointServicesResult`.
 
 @see AWSEC2DescribeVpcEndpointServicesRequest
 @see AWSEC2DescribeVpcEndpointServicesResult
 */
- (AWSTask<AWSEC2DescribeVpcEndpointServicesResult *> *)describeVpcEndpointServices:(AWSEC2DescribeVpcEndpointServicesRequest *)request;

/**
 <p>Describes available services to which you can create a VPC endpoint.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcEndpointServices service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeVpcEndpointServicesRequest
 @see AWSEC2DescribeVpcEndpointServicesResult
 */
- (void)describeVpcEndpointServices:(AWSEC2DescribeVpcEndpointServicesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeVpcEndpointServicesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your VPC endpoints.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVpcEndpointsResult`.
 
 @see AWSEC2DescribeVpcEndpointsRequest
 @see AWSEC2DescribeVpcEndpointsResult
 */
- (AWSTask<AWSEC2DescribeVpcEndpointsResult *> *)describeVpcEndpoints:(AWSEC2DescribeVpcEndpointsRequest *)request;

/**
 <p>Describes one or more of your VPC endpoints.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeVpcEndpointsRequest
 @see AWSEC2DescribeVpcEndpointsResult
 */
- (void)describeVpcEndpoints:(AWSEC2DescribeVpcEndpointsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeVpcEndpointsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your VPC peering connections.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcPeeringConnections service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVpcPeeringConnectionsResult`.
 
 @see AWSEC2DescribeVpcPeeringConnectionsRequest
 @see AWSEC2DescribeVpcPeeringConnectionsResult
 */
- (AWSTask<AWSEC2DescribeVpcPeeringConnectionsResult *> *)describeVpcPeeringConnections:(AWSEC2DescribeVpcPeeringConnectionsRequest *)request;

/**
 <p>Describes one or more of your VPC peering connections.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcPeeringConnections service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeVpcPeeringConnectionsRequest
 @see AWSEC2DescribeVpcPeeringConnectionsResult
 */
- (void)describeVpcPeeringConnections:(AWSEC2DescribeVpcPeeringConnectionsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeVpcPeeringConnectionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your VPCs.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVpcsResult`.
 
 @see AWSEC2DescribeVpcsRequest
 @see AWSEC2DescribeVpcsResult
 */
- (AWSTask<AWSEC2DescribeVpcsResult *> *)describeVpcs:(AWSEC2DescribeVpcsRequest *)request;

/**
 <p>Describes one or more of your VPCs.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeVpcsRequest
 @see AWSEC2DescribeVpcsResult
 */
- (void)describeVpcs:(AWSEC2DescribeVpcsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeVpcsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your VPN connections.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html">AWS Site-to-Site VPN</a> in the <i>AWS Site-to-Site VPN User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpnConnections service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVpnConnectionsResult`.
 
 @see AWSEC2DescribeVpnConnectionsRequest
 @see AWSEC2DescribeVpnConnectionsResult
 */
- (AWSTask<AWSEC2DescribeVpnConnectionsResult *> *)describeVpnConnections:(AWSEC2DescribeVpnConnectionsRequest *)request;

/**
 <p>Describes one or more of your VPN connections.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html">AWS Site-to-Site VPN</a> in the <i>AWS Site-to-Site VPN User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpnConnections service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeVpnConnectionsRequest
 @see AWSEC2DescribeVpnConnectionsResult
 */
- (void)describeVpnConnections:(AWSEC2DescribeVpnConnectionsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeVpnConnectionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your virtual private gateways.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html">AWS Site-to-Site VPN</a> in the <i>AWS Site-to-Site VPN User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpnGateways service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVpnGatewaysResult`.
 
 @see AWSEC2DescribeVpnGatewaysRequest
 @see AWSEC2DescribeVpnGatewaysResult
 */
- (AWSTask<AWSEC2DescribeVpnGatewaysResult *> *)describeVpnGateways:(AWSEC2DescribeVpnGatewaysRequest *)request;

/**
 <p>Describes one or more of your virtual private gateways.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html">AWS Site-to-Site VPN</a> in the <i>AWS Site-to-Site VPN User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpnGateways service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeVpnGatewaysRequest
 @see AWSEC2DescribeVpnGatewaysResult
 */
- (void)describeVpnGateways:(AWSEC2DescribeVpnGatewaysRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeVpnGatewaysResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Unlinks (detaches) a linked EC2-Classic instance from a VPC. After the instance has been unlinked, the VPC security groups are no longer associated with it. An instance is automatically unlinked from a VPC when it's stopped.</p>
 
 @param request A container for the necessary parameters to execute the DetachClassicLinkVpc service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DetachClassicLinkVpcResult`.
 
 @see AWSEC2DetachClassicLinkVpcRequest
 @see AWSEC2DetachClassicLinkVpcResult
 */
- (AWSTask<AWSEC2DetachClassicLinkVpcResult *> *)detachClassicLinkVpc:(AWSEC2DetachClassicLinkVpcRequest *)request;

/**
 <p>Unlinks (detaches) a linked EC2-Classic instance from a VPC. After the instance has been unlinked, the VPC security groups are no longer associated with it. An instance is automatically unlinked from a VPC when it's stopped.</p>
 
 @param request A container for the necessary parameters to execute the DetachClassicLinkVpc service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DetachClassicLinkVpcRequest
 @see AWSEC2DetachClassicLinkVpcResult
 */
- (void)detachClassicLinkVpc:(AWSEC2DetachClassicLinkVpcRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DetachClassicLinkVpcResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detaches an internet gateway from a VPC, disabling connectivity between the internet and the VPC. The VPC must not contain any running instances with Elastic IP addresses or public IPv4 addresses.</p>
 
 @param request A container for the necessary parameters to execute the DetachInternetGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DetachInternetGatewayRequest
 */
- (AWSTask *)detachInternetGateway:(AWSEC2DetachInternetGatewayRequest *)request;

/**
 <p>Detaches an internet gateway from a VPC, disabling connectivity between the internet and the VPC. The VPC must not contain any running instances with Elastic IP addresses or public IPv4 addresses.</p>
 
 @param request A container for the necessary parameters to execute the DetachInternetGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DetachInternetGatewayRequest
 */
- (void)detachInternetGateway:(AWSEC2DetachInternetGatewayRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Detaches a network interface from an instance.</p>
 
 @param request A container for the necessary parameters to execute the DetachNetworkInterface service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DetachNetworkInterfaceRequest
 */
- (AWSTask *)detachNetworkInterface:(AWSEC2DetachNetworkInterfaceRequest *)request;

/**
 <p>Detaches a network interface from an instance.</p>
 
 @param request A container for the necessary parameters to execute the DetachNetworkInterface service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DetachNetworkInterfaceRequest
 */
- (void)detachNetworkInterface:(AWSEC2DetachNetworkInterfaceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Detaches an EBS volume from an instance. Make sure to unmount any file systems on the device within your operating system before detaching the volume. Failure to do so can result in the volume becoming stuck in the <code>busy</code> state while detaching. If this happens, detachment can be delayed indefinitely until you unmount the volume, force detachment, reboot the instance, or all three. If an EBS volume is the root device of an instance, it can't be detached while the instance is running. To detach the root volume, stop the instance first.</p><p>When a volume with an AWS Marketplace product code is detached from an instance, the product code is no longer associated with the instance.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-detaching-volume.html">Detaching an Amazon EBS Volume</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DetachVolume service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2VolumeAttachment`.
 
 @see AWSEC2DetachVolumeRequest
 @see AWSEC2VolumeAttachment
 */
- (AWSTask<AWSEC2VolumeAttachment *> *)detachVolume:(AWSEC2DetachVolumeRequest *)request;

/**
 <p>Detaches an EBS volume from an instance. Make sure to unmount any file systems on the device within your operating system before detaching the volume. Failure to do so can result in the volume becoming stuck in the <code>busy</code> state while detaching. If this happens, detachment can be delayed indefinitely until you unmount the volume, force detachment, reboot the instance, or all three. If an EBS volume is the root device of an instance, it can't be detached while the instance is running. To detach the root volume, stop the instance first.</p><p>When a volume with an AWS Marketplace product code is detached from an instance, the product code is no longer associated with the instance.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-detaching-volume.html">Detaching an Amazon EBS Volume</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DetachVolume service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DetachVolumeRequest
 @see AWSEC2VolumeAttachment
 */
- (void)detachVolume:(AWSEC2DetachVolumeRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2VolumeAttachment * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detaches a virtual private gateway from a VPC. You do this if you're planning to turn off the VPC and not use it anymore. You can confirm a virtual private gateway has been completely detached from a VPC by describing the virtual private gateway (any attachments to the virtual private gateway are also described).</p><p>You must wait for the attachment's state to switch to <code>detached</code> before you can delete the VPC or attach a different VPC to the virtual private gateway.</p>
 
 @param request A container for the necessary parameters to execute the DetachVpnGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DetachVpnGatewayRequest
 */
- (AWSTask *)detachVpnGateway:(AWSEC2DetachVpnGatewayRequest *)request;

/**
 <p>Detaches a virtual private gateway from a VPC. You do this if you're planning to turn off the VPC and not use it anymore. You can confirm a virtual private gateway has been completely detached from a VPC by describing the virtual private gateway (any attachments to the virtual private gateway are also described).</p><p>You must wait for the attachment's state to switch to <code>detached</code> before you can delete the VPC or attach a different VPC to the virtual private gateway.</p>
 
 @param request A container for the necessary parameters to execute the DetachVpnGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DetachVpnGatewayRequest
 */
- (void)detachVpnGateway:(AWSEC2DetachVpnGatewayRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Disables EBS encryption by default for your account in the current Region.</p><p>After you disable encryption by default, you can still create encrypted volumes by enabling encryption when you create each volume.</p><p>Disabling encryption by default does not change the encryption status of your existing volumes.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DisableEbsEncryptionByDefault service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DisableEbsEncryptionByDefaultResult`.
 
 @see AWSEC2DisableEbsEncryptionByDefaultRequest
 @see AWSEC2DisableEbsEncryptionByDefaultResult
 */
- (AWSTask<AWSEC2DisableEbsEncryptionByDefaultResult *> *)disableEbsEncryptionByDefault:(AWSEC2DisableEbsEncryptionByDefaultRequest *)request;

/**
 <p>Disables EBS encryption by default for your account in the current Region.</p><p>After you disable encryption by default, you can still create encrypted volumes by enabling encryption when you create each volume.</p><p>Disabling encryption by default does not change the encryption status of your existing volumes.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DisableEbsEncryptionByDefault service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DisableEbsEncryptionByDefaultRequest
 @see AWSEC2DisableEbsEncryptionByDefaultResult
 */
- (void)disableEbsEncryptionByDefault:(AWSEC2DisableEbsEncryptionByDefaultRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DisableEbsEncryptionByDefaultResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables fast snapshot restores for the specified snapshots in the specified Availability Zones.</p>
 
 @param request A container for the necessary parameters to execute the DisableFastSnapshotRestores service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DisableFastSnapshotRestoresResult`.
 
 @see AWSEC2DisableFastSnapshotRestoresRequest
 @see AWSEC2DisableFastSnapshotRestoresResult
 */
- (AWSTask<AWSEC2DisableFastSnapshotRestoresResult *> *)disableFastSnapshotRestores:(AWSEC2DisableFastSnapshotRestoresRequest *)request;

/**
 <p>Disables fast snapshot restores for the specified snapshots in the specified Availability Zones.</p>
 
 @param request A container for the necessary parameters to execute the DisableFastSnapshotRestores service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DisableFastSnapshotRestoresRequest
 @see AWSEC2DisableFastSnapshotRestoresResult
 */
- (void)disableFastSnapshotRestores:(AWSEC2DisableFastSnapshotRestoresRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DisableFastSnapshotRestoresResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables the specified resource attachment from propagating routes to the specified propagation route table.</p>
 
 @param request A container for the necessary parameters to execute the DisableTransitGatewayRouteTablePropagation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DisableTransitGatewayRouteTablePropagationResult`.
 
 @see AWSEC2DisableTransitGatewayRouteTablePropagationRequest
 @see AWSEC2DisableTransitGatewayRouteTablePropagationResult
 */
- (AWSTask<AWSEC2DisableTransitGatewayRouteTablePropagationResult *> *)disableTransitGatewayRouteTablePropagation:(AWSEC2DisableTransitGatewayRouteTablePropagationRequest *)request;

/**
 <p>Disables the specified resource attachment from propagating routes to the specified propagation route table.</p>
 
 @param request A container for the necessary parameters to execute the DisableTransitGatewayRouteTablePropagation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DisableTransitGatewayRouteTablePropagationRequest
 @see AWSEC2DisableTransitGatewayRouteTablePropagationResult
 */
- (void)disableTransitGatewayRouteTablePropagation:(AWSEC2DisableTransitGatewayRouteTablePropagationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DisableTransitGatewayRouteTablePropagationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables a virtual private gateway (VGW) from propagating routes to a specified route table of a VPC.</p>
 
 @param request A container for the necessary parameters to execute the DisableVgwRoutePropagation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DisableVgwRoutePropagationRequest
 */
- (AWSTask *)disableVgwRoutePropagation:(AWSEC2DisableVgwRoutePropagationRequest *)request;

/**
 <p>Disables a virtual private gateway (VGW) from propagating routes to a specified route table of a VPC.</p>
 
 @param request A container for the necessary parameters to execute the DisableVgwRoutePropagation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DisableVgwRoutePropagationRequest
 */
- (void)disableVgwRoutePropagation:(AWSEC2DisableVgwRoutePropagationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Disables ClassicLink for a VPC. You cannot disable ClassicLink for a VPC that has EC2-Classic instances linked to it.</p>
 
 @param request A container for the necessary parameters to execute the DisableVpcClassicLink service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DisableVpcClassicLinkResult`.
 
 @see AWSEC2DisableVpcClassicLinkRequest
 @see AWSEC2DisableVpcClassicLinkResult
 */
- (AWSTask<AWSEC2DisableVpcClassicLinkResult *> *)disableVpcClassicLink:(AWSEC2DisableVpcClassicLinkRequest *)request;

/**
 <p>Disables ClassicLink for a VPC. You cannot disable ClassicLink for a VPC that has EC2-Classic instances linked to it.</p>
 
 @param request A container for the necessary parameters to execute the DisableVpcClassicLink service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DisableVpcClassicLinkRequest
 @see AWSEC2DisableVpcClassicLinkResult
 */
- (void)disableVpcClassicLink:(AWSEC2DisableVpcClassicLinkRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DisableVpcClassicLinkResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables ClassicLink DNS support for a VPC. If disabled, DNS hostnames resolve to public IP addresses when addressed between a linked EC2-Classic instance and instances in the VPC to which it's linked. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DisableVpcClassicLinkDnsSupport service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DisableVpcClassicLinkDnsSupportResult`.
 
 @see AWSEC2DisableVpcClassicLinkDnsSupportRequest
 @see AWSEC2DisableVpcClassicLinkDnsSupportResult
 */
- (AWSTask<AWSEC2DisableVpcClassicLinkDnsSupportResult *> *)disableVpcClassicLinkDnsSupport:(AWSEC2DisableVpcClassicLinkDnsSupportRequest *)request;

/**
 <p>Disables ClassicLink DNS support for a VPC. If disabled, DNS hostnames resolve to public IP addresses when addressed between a linked EC2-Classic instance and instances in the VPC to which it's linked. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DisableVpcClassicLinkDnsSupport service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DisableVpcClassicLinkDnsSupportRequest
 @see AWSEC2DisableVpcClassicLinkDnsSupportResult
 */
- (void)disableVpcClassicLinkDnsSupport:(AWSEC2DisableVpcClassicLinkDnsSupportRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DisableVpcClassicLinkDnsSupportResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates an Elastic IP address from the instance or network interface it's associated with.</p><p>An Elastic IP address is for use in either the EC2-Classic platform or in a VPC. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>This is an idempotent operation. If you perform the operation more than once, Amazon EC2 doesn't return an error.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateAddress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DisassociateAddressRequest
 */
- (AWSTask *)disassociateAddress:(AWSEC2DisassociateAddressRequest *)request;

/**
 <p>Disassociates an Elastic IP address from the instance or network interface it's associated with.</p><p>An Elastic IP address is for use in either the EC2-Classic platform or in a VPC. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>This is an idempotent operation. If you perform the operation more than once, Amazon EC2 doesn't return an error.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateAddress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DisassociateAddressRequest
 */
- (void)disassociateAddress:(AWSEC2DisassociateAddressRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a target network from the specified Client VPN endpoint. When you disassociate the last target network from a Client VPN, the following happens:</p><ul><li><p>The route that was automatically added for the VPC is deleted</p></li><li><p>All active client connections are terminated</p></li><li><p>New client connections are disallowed</p></li><li><p>The Client VPN endpoint's status changes to <code>pending-associate</code></p></li></ul>
 
 @param request A container for the necessary parameters to execute the DisassociateClientVpnTargetNetwork service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DisassociateClientVpnTargetNetworkResult`.
 
 @see AWSEC2DisassociateClientVpnTargetNetworkRequest
 @see AWSEC2DisassociateClientVpnTargetNetworkResult
 */
- (AWSTask<AWSEC2DisassociateClientVpnTargetNetworkResult *> *)disassociateClientVpnTargetNetwork:(AWSEC2DisassociateClientVpnTargetNetworkRequest *)request;

/**
 <p>Disassociates a target network from the specified Client VPN endpoint. When you disassociate the last target network from a Client VPN, the following happens:</p><ul><li><p>The route that was automatically added for the VPC is deleted</p></li><li><p>All active client connections are terminated</p></li><li><p>New client connections are disallowed</p></li><li><p>The Client VPN endpoint's status changes to <code>pending-associate</code></p></li></ul>
 
 @param request A container for the necessary parameters to execute the DisassociateClientVpnTargetNetwork service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DisassociateClientVpnTargetNetworkRequest
 @see AWSEC2DisassociateClientVpnTargetNetworkResult
 */
- (void)disassociateClientVpnTargetNetwork:(AWSEC2DisassociateClientVpnTargetNetworkRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DisassociateClientVpnTargetNetworkResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates an IAM instance profile from a running or stopped instance.</p><p>Use <a>DescribeIamInstanceProfileAssociations</a> to get the association ID.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateIamInstanceProfile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DisassociateIamInstanceProfileResult`.
 
 @see AWSEC2DisassociateIamInstanceProfileRequest
 @see AWSEC2DisassociateIamInstanceProfileResult
 */
- (AWSTask<AWSEC2DisassociateIamInstanceProfileResult *> *)disassociateIamInstanceProfile:(AWSEC2DisassociateIamInstanceProfileRequest *)request;

/**
 <p>Disassociates an IAM instance profile from a running or stopped instance.</p><p>Use <a>DescribeIamInstanceProfileAssociations</a> to get the association ID.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateIamInstanceProfile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DisassociateIamInstanceProfileRequest
 @see AWSEC2DisassociateIamInstanceProfileResult
 */
- (void)disassociateIamInstanceProfile:(AWSEC2DisassociateIamInstanceProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DisassociateIamInstanceProfileResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a subnet from a route table.</p><p>After you perform this action, the subnet no longer uses the routes in the route table. Instead, it uses the routes in the VPC's main route table. For more information about route tables, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateRouteTable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DisassociateRouteTableRequest
 */
- (AWSTask *)disassociateRouteTable:(AWSEC2DisassociateRouteTableRequest *)request;

/**
 <p>Disassociates a subnet from a route table.</p><p>After you perform this action, the subnet no longer uses the routes in the route table. Instead, it uses the routes in the VPC's main route table. For more information about route tables, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateRouteTable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DisassociateRouteTableRequest
 */
- (void)disassociateRouteTable:(AWSEC2DisassociateRouteTableRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a CIDR block from a subnet. Currently, you can disassociate an IPv6 CIDR block only. You must detach or delete all gateways and resources that are associated with the CIDR block before you can disassociate it. </p>
 
 @param request A container for the necessary parameters to execute the DisassociateSubnetCidrBlock service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DisassociateSubnetCidrBlockResult`.
 
 @see AWSEC2DisassociateSubnetCidrBlockRequest
 @see AWSEC2DisassociateSubnetCidrBlockResult
 */
- (AWSTask<AWSEC2DisassociateSubnetCidrBlockResult *> *)disassociateSubnetCidrBlock:(AWSEC2DisassociateSubnetCidrBlockRequest *)request;

/**
 <p>Disassociates a CIDR block from a subnet. Currently, you can disassociate an IPv6 CIDR block only. You must detach or delete all gateways and resources that are associated with the CIDR block before you can disassociate it. </p>
 
 @param request A container for the necessary parameters to execute the DisassociateSubnetCidrBlock service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DisassociateSubnetCidrBlockRequest
 @see AWSEC2DisassociateSubnetCidrBlockResult
 */
- (void)disassociateSubnetCidrBlock:(AWSEC2DisassociateSubnetCidrBlockRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DisassociateSubnetCidrBlockResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates the specified subnets from the transit gateway multicast domain. </p>
 
 @param request A container for the necessary parameters to execute the DisassociateTransitGatewayMulticastDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DisassociateTransitGatewayMulticastDomainResult`.
 
 @see AWSEC2DisassociateTransitGatewayMulticastDomainRequest
 @see AWSEC2DisassociateTransitGatewayMulticastDomainResult
 */
- (AWSTask<AWSEC2DisassociateTransitGatewayMulticastDomainResult *> *)disassociateTransitGatewayMulticastDomain:(AWSEC2DisassociateTransitGatewayMulticastDomainRequest *)request;

/**
 <p>Disassociates the specified subnets from the transit gateway multicast domain. </p>
 
 @param request A container for the necessary parameters to execute the DisassociateTransitGatewayMulticastDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DisassociateTransitGatewayMulticastDomainRequest
 @see AWSEC2DisassociateTransitGatewayMulticastDomainResult
 */
- (void)disassociateTransitGatewayMulticastDomain:(AWSEC2DisassociateTransitGatewayMulticastDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DisassociateTransitGatewayMulticastDomainResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a resource attachment from a transit gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateTransitGatewayRouteTable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DisassociateTransitGatewayRouteTableResult`.
 
 @see AWSEC2DisassociateTransitGatewayRouteTableRequest
 @see AWSEC2DisassociateTransitGatewayRouteTableResult
 */
- (AWSTask<AWSEC2DisassociateTransitGatewayRouteTableResult *> *)disassociateTransitGatewayRouteTable:(AWSEC2DisassociateTransitGatewayRouteTableRequest *)request;

/**
 <p>Disassociates a resource attachment from a transit gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateTransitGatewayRouteTable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DisassociateTransitGatewayRouteTableRequest
 @see AWSEC2DisassociateTransitGatewayRouteTableResult
 */
- (void)disassociateTransitGatewayRouteTable:(AWSEC2DisassociateTransitGatewayRouteTableRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DisassociateTransitGatewayRouteTableResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates a CIDR block from a VPC. To disassociate the CIDR block, you must specify its association ID. You can get the association ID by using <a>DescribeVpcs</a>. You must detach or delete all gateways and resources that are associated with the CIDR block before you can disassociate it. </p><p>You cannot disassociate the CIDR block with which you originally created the VPC (the primary CIDR block).</p>
 
 @param request A container for the necessary parameters to execute the DisassociateVpcCidrBlock service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DisassociateVpcCidrBlockResult`.
 
 @see AWSEC2DisassociateVpcCidrBlockRequest
 @see AWSEC2DisassociateVpcCidrBlockResult
 */
- (AWSTask<AWSEC2DisassociateVpcCidrBlockResult *> *)disassociateVpcCidrBlock:(AWSEC2DisassociateVpcCidrBlockRequest *)request;

/**
 <p>Disassociates a CIDR block from a VPC. To disassociate the CIDR block, you must specify its association ID. You can get the association ID by using <a>DescribeVpcs</a>. You must detach or delete all gateways and resources that are associated with the CIDR block before you can disassociate it. </p><p>You cannot disassociate the CIDR block with which you originally created the VPC (the primary CIDR block).</p>
 
 @param request A container for the necessary parameters to execute the DisassociateVpcCidrBlock service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DisassociateVpcCidrBlockRequest
 @see AWSEC2DisassociateVpcCidrBlockResult
 */
- (void)disassociateVpcCidrBlock:(AWSEC2DisassociateVpcCidrBlockRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DisassociateVpcCidrBlockResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables EBS encryption by default for your account in the current Region.</p><p>After you enable encryption by default, the EBS volumes that you create are are always encrypted, either using the default CMK or the CMK that you specified when you created each volume. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>You can specify the default CMK for encryption by default using <a>ModifyEbsDefaultKmsKeyId</a> or <a>ResetEbsDefaultKmsKeyId</a>.</p><p>Enabling encryption by default has no effect on the encryption status of your existing volumes.</p><p>After you enable encryption by default, you can no longer launch instances using instance types that do not support encryption. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html#EBSEncryption_supported_instances">Supported Instance Types</a>.</p>
 
 @param request A container for the necessary parameters to execute the EnableEbsEncryptionByDefault service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2EnableEbsEncryptionByDefaultResult`.
 
 @see AWSEC2EnableEbsEncryptionByDefaultRequest
 @see AWSEC2EnableEbsEncryptionByDefaultResult
 */
- (AWSTask<AWSEC2EnableEbsEncryptionByDefaultResult *> *)enableEbsEncryptionByDefault:(AWSEC2EnableEbsEncryptionByDefaultRequest *)request;

/**
 <p>Enables EBS encryption by default for your account in the current Region.</p><p>After you enable encryption by default, the EBS volumes that you create are are always encrypted, either using the default CMK or the CMK that you specified when you created each volume. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>You can specify the default CMK for encryption by default using <a>ModifyEbsDefaultKmsKeyId</a> or <a>ResetEbsDefaultKmsKeyId</a>.</p><p>Enabling encryption by default has no effect on the encryption status of your existing volumes.</p><p>After you enable encryption by default, you can no longer launch instances using instance types that do not support encryption. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html#EBSEncryption_supported_instances">Supported Instance Types</a>.</p>
 
 @param request A container for the necessary parameters to execute the EnableEbsEncryptionByDefault service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2EnableEbsEncryptionByDefaultRequest
 @see AWSEC2EnableEbsEncryptionByDefaultResult
 */
- (void)enableEbsEncryptionByDefault:(AWSEC2EnableEbsEncryptionByDefaultRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2EnableEbsEncryptionByDefaultResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables fast snapshot restores for the specified snapshots in the specified Availability Zones.</p><p>You get the full benefit of fast snapshot restores after they enter the <code>enabled</code> state. To get the current state of fast snapshot restores, use <a>DescribeFastSnapshotRestores</a>. To disable fast snapshot restores, use <a>DisableFastSnapshotRestores</a>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-fast-snapshot-restore.html">Amazon EBS Fast Snapshot Restore</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the EnableFastSnapshotRestores service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2EnableFastSnapshotRestoresResult`.
 
 @see AWSEC2EnableFastSnapshotRestoresRequest
 @see AWSEC2EnableFastSnapshotRestoresResult
 */
- (AWSTask<AWSEC2EnableFastSnapshotRestoresResult *> *)enableFastSnapshotRestores:(AWSEC2EnableFastSnapshotRestoresRequest *)request;

/**
 <p>Enables fast snapshot restores for the specified snapshots in the specified Availability Zones.</p><p>You get the full benefit of fast snapshot restores after they enter the <code>enabled</code> state. To get the current state of fast snapshot restores, use <a>DescribeFastSnapshotRestores</a>. To disable fast snapshot restores, use <a>DisableFastSnapshotRestores</a>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-fast-snapshot-restore.html">Amazon EBS Fast Snapshot Restore</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the EnableFastSnapshotRestores service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2EnableFastSnapshotRestoresRequest
 @see AWSEC2EnableFastSnapshotRestoresResult
 */
- (void)enableFastSnapshotRestores:(AWSEC2EnableFastSnapshotRestoresRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2EnableFastSnapshotRestoresResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables the specified attachment to propagate routes to the specified propagation route table.</p>
 
 @param request A container for the necessary parameters to execute the EnableTransitGatewayRouteTablePropagation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2EnableTransitGatewayRouteTablePropagationResult`.
 
 @see AWSEC2EnableTransitGatewayRouteTablePropagationRequest
 @see AWSEC2EnableTransitGatewayRouteTablePropagationResult
 */
- (AWSTask<AWSEC2EnableTransitGatewayRouteTablePropagationResult *> *)enableTransitGatewayRouteTablePropagation:(AWSEC2EnableTransitGatewayRouteTablePropagationRequest *)request;

/**
 <p>Enables the specified attachment to propagate routes to the specified propagation route table.</p>
 
 @param request A container for the necessary parameters to execute the EnableTransitGatewayRouteTablePropagation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2EnableTransitGatewayRouteTablePropagationRequest
 @see AWSEC2EnableTransitGatewayRouteTablePropagationResult
 */
- (void)enableTransitGatewayRouteTablePropagation:(AWSEC2EnableTransitGatewayRouteTablePropagationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2EnableTransitGatewayRouteTablePropagationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables a virtual private gateway (VGW) to propagate routes to the specified route table of a VPC.</p>
 
 @param request A container for the necessary parameters to execute the EnableVgwRoutePropagation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2EnableVgwRoutePropagationRequest
 */
- (AWSTask *)enableVgwRoutePropagation:(AWSEC2EnableVgwRoutePropagationRequest *)request;

/**
 <p>Enables a virtual private gateway (VGW) to propagate routes to the specified route table of a VPC.</p>
 
 @param request A container for the necessary parameters to execute the EnableVgwRoutePropagation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2EnableVgwRoutePropagationRequest
 */
- (void)enableVgwRoutePropagation:(AWSEC2EnableVgwRoutePropagationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Enables I/O operations for a volume that had I/O operations disabled because the data on the volume was potentially inconsistent.</p>
 
 @param request A container for the necessary parameters to execute the EnableVolumeIO service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2EnableVolumeIORequest
 */
- (AWSTask *)enableVolumeIO:(AWSEC2EnableVolumeIORequest *)request;

/**
 <p>Enables I/O operations for a volume that had I/O operations disabled because the data on the volume was potentially inconsistent.</p>
 
 @param request A container for the necessary parameters to execute the EnableVolumeIO service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2EnableVolumeIORequest
 */
- (void)enableVolumeIO:(AWSEC2EnableVolumeIORequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Enables a VPC for ClassicLink. You can then link EC2-Classic instances to your ClassicLink-enabled VPC to allow communication over private IP addresses. You cannot enable your VPC for ClassicLink if any of your VPC route tables have existing routes for address ranges within the <code>10.0.0.0/8</code> IP address range, excluding local routes for VPCs in the <code>10.0.0.0/16</code> and <code>10.1.0.0/16</code> IP address ranges. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the EnableVpcClassicLink service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2EnableVpcClassicLinkResult`.
 
 @see AWSEC2EnableVpcClassicLinkRequest
 @see AWSEC2EnableVpcClassicLinkResult
 */
- (AWSTask<AWSEC2EnableVpcClassicLinkResult *> *)enableVpcClassicLink:(AWSEC2EnableVpcClassicLinkRequest *)request;

/**
 <p>Enables a VPC for ClassicLink. You can then link EC2-Classic instances to your ClassicLink-enabled VPC to allow communication over private IP addresses. You cannot enable your VPC for ClassicLink if any of your VPC route tables have existing routes for address ranges within the <code>10.0.0.0/8</code> IP address range, excluding local routes for VPCs in the <code>10.0.0.0/16</code> and <code>10.1.0.0/16</code> IP address ranges. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the EnableVpcClassicLink service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2EnableVpcClassicLinkRequest
 @see AWSEC2EnableVpcClassicLinkResult
 */
- (void)enableVpcClassicLink:(AWSEC2EnableVpcClassicLinkRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2EnableVpcClassicLinkResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables a VPC to support DNS hostname resolution for ClassicLink. If enabled, the DNS hostname of a linked EC2-Classic instance resolves to its private IP address when addressed from an instance in the VPC to which it's linked. Similarly, the DNS hostname of an instance in a VPC resolves to its private IP address when addressed from a linked EC2-Classic instance. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the EnableVpcClassicLinkDnsSupport service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2EnableVpcClassicLinkDnsSupportResult`.
 
 @see AWSEC2EnableVpcClassicLinkDnsSupportRequest
 @see AWSEC2EnableVpcClassicLinkDnsSupportResult
 */
- (AWSTask<AWSEC2EnableVpcClassicLinkDnsSupportResult *> *)enableVpcClassicLinkDnsSupport:(AWSEC2EnableVpcClassicLinkDnsSupportRequest *)request;

/**
 <p>Enables a VPC to support DNS hostname resolution for ClassicLink. If enabled, the DNS hostname of a linked EC2-Classic instance resolves to its private IP address when addressed from an instance in the VPC to which it's linked. Similarly, the DNS hostname of an instance in a VPC resolves to its private IP address when addressed from a linked EC2-Classic instance. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the EnableVpcClassicLinkDnsSupport service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2EnableVpcClassicLinkDnsSupportRequest
 @see AWSEC2EnableVpcClassicLinkDnsSupportResult
 */
- (void)enableVpcClassicLinkDnsSupport:(AWSEC2EnableVpcClassicLinkDnsSupportRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2EnableVpcClassicLinkDnsSupportResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Downloads the client certificate revocation list for the specified Client VPN endpoint.</p>
 
 @param request A container for the necessary parameters to execute the ExportClientVpnClientCertificateRevocationList service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ExportClientVpnClientCertificateRevocationListResult`.
 
 @see AWSEC2ExportClientVpnClientCertificateRevocationListRequest
 @see AWSEC2ExportClientVpnClientCertificateRevocationListResult
 */
- (AWSTask<AWSEC2ExportClientVpnClientCertificateRevocationListResult *> *)exportClientVpnClientCertificateRevocationList:(AWSEC2ExportClientVpnClientCertificateRevocationListRequest *)request;

/**
 <p>Downloads the client certificate revocation list for the specified Client VPN endpoint.</p>
 
 @param request A container for the necessary parameters to execute the ExportClientVpnClientCertificateRevocationList service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ExportClientVpnClientCertificateRevocationListRequest
 @see AWSEC2ExportClientVpnClientCertificateRevocationListResult
 */
- (void)exportClientVpnClientCertificateRevocationList:(AWSEC2ExportClientVpnClientCertificateRevocationListRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ExportClientVpnClientCertificateRevocationListResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Downloads the contents of the Client VPN endpoint configuration file for the specified Client VPN endpoint. The Client VPN endpoint configuration file includes the Client VPN endpoint and certificate information clients need to establish a connection with the Client VPN endpoint.</p>
 
 @param request A container for the necessary parameters to execute the ExportClientVpnClientConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ExportClientVpnClientConfigurationResult`.
 
 @see AWSEC2ExportClientVpnClientConfigurationRequest
 @see AWSEC2ExportClientVpnClientConfigurationResult
 */
- (AWSTask<AWSEC2ExportClientVpnClientConfigurationResult *> *)exportClientVpnClientConfiguration:(AWSEC2ExportClientVpnClientConfigurationRequest *)request;

/**
 <p>Downloads the contents of the Client VPN endpoint configuration file for the specified Client VPN endpoint. The Client VPN endpoint configuration file includes the Client VPN endpoint and certificate information clients need to establish a connection with the Client VPN endpoint.</p>
 
 @param request A container for the necessary parameters to execute the ExportClientVpnClientConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ExportClientVpnClientConfigurationRequest
 @see AWSEC2ExportClientVpnClientConfigurationResult
 */
- (void)exportClientVpnClientConfiguration:(AWSEC2ExportClientVpnClientConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ExportClientVpnClientConfigurationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Exports an Amazon Machine Image (AMI) to a VM file. For more information, see <a href="https://docs.aws.amazon.com/vm-import/latest/userguide/vmexport_image.html">Exporting a VM Directory from an Amazon Machine Image (AMI)</a> in the <i>VM Import/Export User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ExportImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ExportImageResult`.
 
 @see AWSEC2ExportImageRequest
 @see AWSEC2ExportImageResult
 */
- (AWSTask<AWSEC2ExportImageResult *> *)exportImage:(AWSEC2ExportImageRequest *)request;

/**
 <p>Exports an Amazon Machine Image (AMI) to a VM file. For more information, see <a href="https://docs.aws.amazon.com/vm-import/latest/userguide/vmexport_image.html">Exporting a VM Directory from an Amazon Machine Image (AMI)</a> in the <i>VM Import/Export User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ExportImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ExportImageRequest
 @see AWSEC2ExportImageResult
 */
- (void)exportImage:(AWSEC2ExportImageRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ExportImageResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Exports routes from the specified transit gateway route table to the specified S3 bucket. By default, all routes are exported. Alternatively, you can filter by CIDR range.</p><p>The routes are saved to the specified bucket in a JSON file. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/tgw/tgw-route-tables.html#tgw-export-route-tables">Export Route Tables to Amazon S3</a> in <i>Transit Gateways</i>.</p>
 
 @param request A container for the necessary parameters to execute the ExportTransitGatewayRoutes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ExportTransitGatewayRoutesResult`.
 
 @see AWSEC2ExportTransitGatewayRoutesRequest
 @see AWSEC2ExportTransitGatewayRoutesResult
 */
- (AWSTask<AWSEC2ExportTransitGatewayRoutesResult *> *)exportTransitGatewayRoutes:(AWSEC2ExportTransitGatewayRoutesRequest *)request;

/**
 <p>Exports routes from the specified transit gateway route table to the specified S3 bucket. By default, all routes are exported. Alternatively, you can filter by CIDR range.</p><p>The routes are saved to the specified bucket in a JSON file. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/tgw/tgw-route-tables.html#tgw-export-route-tables">Export Route Tables to Amazon S3</a> in <i>Transit Gateways</i>.</p>
 
 @param request A container for the necessary parameters to execute the ExportTransitGatewayRoutes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ExportTransitGatewayRoutesRequest
 @see AWSEC2ExportTransitGatewayRoutesResult
 */
- (void)exportTransitGatewayRoutes:(AWSEC2ExportTransitGatewayRoutesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ExportTransitGatewayRoutesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the IPv6 CIDR block associations for a specified IPv6 address pool.</p>
 
 @param request A container for the necessary parameters to execute the GetAssociatedIpv6PoolCidrs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2GetAssociatedIpv6PoolCidrsResult`.
 
 @see AWSEC2GetAssociatedIpv6PoolCidrsRequest
 @see AWSEC2GetAssociatedIpv6PoolCidrsResult
 */
- (AWSTask<AWSEC2GetAssociatedIpv6PoolCidrsResult *> *)getAssociatedIpv6PoolCidrs:(AWSEC2GetAssociatedIpv6PoolCidrsRequest *)request;

/**
 <p>Gets information about the IPv6 CIDR block associations for a specified IPv6 address pool.</p>
 
 @param request A container for the necessary parameters to execute the GetAssociatedIpv6PoolCidrs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2GetAssociatedIpv6PoolCidrsRequest
 @see AWSEC2GetAssociatedIpv6PoolCidrsResult
 */
- (void)getAssociatedIpv6PoolCidrs:(AWSEC2GetAssociatedIpv6PoolCidrsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2GetAssociatedIpv6PoolCidrsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets usage information about a Capacity Reservation. If the Capacity Reservation is shared, it shows usage information for the Capacity Reservation owner and each AWS account that is currently using the shared capacity. If the Capacity Reservation is not shared, it shows only the Capacity Reservation owner's usage.</p>
 
 @param request A container for the necessary parameters to execute the GetCapacityReservationUsage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2GetCapacityReservationUsageResult`.
 
 @see AWSEC2GetCapacityReservationUsageRequest
 @see AWSEC2GetCapacityReservationUsageResult
 */
- (AWSTask<AWSEC2GetCapacityReservationUsageResult *> *)getCapacityReservationUsage:(AWSEC2GetCapacityReservationUsageRequest *)request;

/**
 <p>Gets usage information about a Capacity Reservation. If the Capacity Reservation is shared, it shows usage information for the Capacity Reservation owner and each AWS account that is currently using the shared capacity. If the Capacity Reservation is not shared, it shows only the Capacity Reservation owner's usage.</p>
 
 @param request A container for the necessary parameters to execute the GetCapacityReservationUsage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2GetCapacityReservationUsageRequest
 @see AWSEC2GetCapacityReservationUsageResult
 */
- (void)getCapacityReservationUsage:(AWSEC2GetCapacityReservationUsageRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2GetCapacityReservationUsageResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the allocations from the specified customer-owned address pool.</p>
 
 @param request A container for the necessary parameters to execute the GetCoipPoolUsage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2GetCoipPoolUsageResult`.
 
 @see AWSEC2GetCoipPoolUsageRequest
 @see AWSEC2GetCoipPoolUsageResult
 */
- (AWSTask<AWSEC2GetCoipPoolUsageResult *> *)getCoipPoolUsage:(AWSEC2GetCoipPoolUsageRequest *)request;

/**
 <p>Describes the allocations from the specified customer-owned address pool.</p>
 
 @param request A container for the necessary parameters to execute the GetCoipPoolUsage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2GetCoipPoolUsageRequest
 @see AWSEC2GetCoipPoolUsageResult
 */
- (void)getCoipPoolUsage:(AWSEC2GetCoipPoolUsageRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2GetCoipPoolUsageResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the console output for the specified instance. For Linux instances, the instance console output displays the exact console output that would normally be displayed on a physical monitor attached to a computer. For Windows instances, the instance console output includes the last three system event log errors.</p><p>By default, the console output returns buffered information that was posted shortly after an instance transition state (start, stop, reboot, or terminate). This information is available for at least one hour after the most recent post. Only the most recent 64 KB of console output is available.</p><p>You can optionally retrieve the latest serial console output at any time during the instance lifecycle. This option is supported on instance types that use the Nitro hypervisor.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-console.html#instance-console-console-output">Instance Console Output</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetConsoleOutput service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2GetConsoleOutputResult`.
 
 @see AWSEC2GetConsoleOutputRequest
 @see AWSEC2GetConsoleOutputResult
 */
- (AWSTask<AWSEC2GetConsoleOutputResult *> *)getConsoleOutput:(AWSEC2GetConsoleOutputRequest *)request;

/**
 <p>Gets the console output for the specified instance. For Linux instances, the instance console output displays the exact console output that would normally be displayed on a physical monitor attached to a computer. For Windows instances, the instance console output includes the last three system event log errors.</p><p>By default, the console output returns buffered information that was posted shortly after an instance transition state (start, stop, reboot, or terminate). This information is available for at least one hour after the most recent post. Only the most recent 64 KB of console output is available.</p><p>You can optionally retrieve the latest serial console output at any time during the instance lifecycle. This option is supported on instance types that use the Nitro hypervisor.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-console.html#instance-console-console-output">Instance Console Output</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetConsoleOutput service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2GetConsoleOutputRequest
 @see AWSEC2GetConsoleOutputResult
 */
- (void)getConsoleOutput:(AWSEC2GetConsoleOutputRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2GetConsoleOutputResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve a JPG-format screenshot of a running instance to help with troubleshooting.</p><p>The returned content is Base64-encoded.</p>
 
 @param request A container for the necessary parameters to execute the GetConsoleScreenshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2GetConsoleScreenshotResult`.
 
 @see AWSEC2GetConsoleScreenshotRequest
 @see AWSEC2GetConsoleScreenshotResult
 */
- (AWSTask<AWSEC2GetConsoleScreenshotResult *> *)getConsoleScreenshot:(AWSEC2GetConsoleScreenshotRequest *)request;

/**
 <p>Retrieve a JPG-format screenshot of a running instance to help with troubleshooting.</p><p>The returned content is Base64-encoded.</p>
 
 @param request A container for the necessary parameters to execute the GetConsoleScreenshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2GetConsoleScreenshotRequest
 @see AWSEC2GetConsoleScreenshotResult
 */
- (void)getConsoleScreenshot:(AWSEC2GetConsoleScreenshotRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2GetConsoleScreenshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the default credit option for CPU usage of a burstable performance instance family.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html">Burstable Performance Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetDefaultCreditSpecification service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2GetDefaultCreditSpecificationResult`.
 
 @see AWSEC2GetDefaultCreditSpecificationRequest
 @see AWSEC2GetDefaultCreditSpecificationResult
 */
- (AWSTask<AWSEC2GetDefaultCreditSpecificationResult *> *)getDefaultCreditSpecification:(AWSEC2GetDefaultCreditSpecificationRequest *)request;

/**
 <p>Describes the default credit option for CPU usage of a burstable performance instance family.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html">Burstable Performance Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetDefaultCreditSpecification service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2GetDefaultCreditSpecificationRequest
 @see AWSEC2GetDefaultCreditSpecificationResult
 */
- (void)getDefaultCreditSpecification:(AWSEC2GetDefaultCreditSpecificationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2GetDefaultCreditSpecificationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the default customer master key (CMK) for EBS encryption by default for your account in this Region. You can change the default CMK for encryption by default using <a>ModifyEbsDefaultKmsKeyId</a> or <a>ResetEbsDefaultKmsKeyId</a>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetEbsDefaultKmsKeyId service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2GetEbsDefaultKmsKeyIdResult`.
 
 @see AWSEC2GetEbsDefaultKmsKeyIdRequest
 @see AWSEC2GetEbsDefaultKmsKeyIdResult
 */
- (AWSTask<AWSEC2GetEbsDefaultKmsKeyIdResult *> *)getEbsDefaultKmsKeyId:(AWSEC2GetEbsDefaultKmsKeyIdRequest *)request;

/**
 <p>Describes the default customer master key (CMK) for EBS encryption by default for your account in this Region. You can change the default CMK for encryption by default using <a>ModifyEbsDefaultKmsKeyId</a> or <a>ResetEbsDefaultKmsKeyId</a>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetEbsDefaultKmsKeyId service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2GetEbsDefaultKmsKeyIdRequest
 @see AWSEC2GetEbsDefaultKmsKeyIdResult
 */
- (void)getEbsDefaultKmsKeyId:(AWSEC2GetEbsDefaultKmsKeyIdRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2GetEbsDefaultKmsKeyIdResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes whether EBS encryption by default is enabled for your account in the current Region.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetEbsEncryptionByDefault service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2GetEbsEncryptionByDefaultResult`.
 
 @see AWSEC2GetEbsEncryptionByDefaultRequest
 @see AWSEC2GetEbsEncryptionByDefaultResult
 */
- (AWSTask<AWSEC2GetEbsEncryptionByDefaultResult *> *)getEbsEncryptionByDefault:(AWSEC2GetEbsEncryptionByDefaultRequest *)request;

/**
 <p>Describes whether EBS encryption by default is enabled for your account in the current Region.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetEbsEncryptionByDefault service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2GetEbsEncryptionByDefaultRequest
 @see AWSEC2GetEbsEncryptionByDefaultResult
 */
- (void)getEbsEncryptionByDefault:(AWSEC2GetEbsEncryptionByDefaultRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2GetEbsEncryptionByDefaultResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Preview a reservation purchase with configurations that match those of your Dedicated Host. You must have active Dedicated Hosts in your account before you purchase a reservation.</p><p>This is a preview of the <a>PurchaseHostReservation</a> action and does not result in the offering being purchased.</p>
 
 @param request A container for the necessary parameters to execute the GetHostReservationPurchasePreview service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2GetHostReservationPurchasePreviewResult`.
 
 @see AWSEC2GetHostReservationPurchasePreviewRequest
 @see AWSEC2GetHostReservationPurchasePreviewResult
 */
- (AWSTask<AWSEC2GetHostReservationPurchasePreviewResult *> *)getHostReservationPurchasePreview:(AWSEC2GetHostReservationPurchasePreviewRequest *)request;

/**
 <p>Preview a reservation purchase with configurations that match those of your Dedicated Host. You must have active Dedicated Hosts in your account before you purchase a reservation.</p><p>This is a preview of the <a>PurchaseHostReservation</a> action and does not result in the offering being purchased.</p>
 
 @param request A container for the necessary parameters to execute the GetHostReservationPurchasePreview service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2GetHostReservationPurchasePreviewRequest
 @see AWSEC2GetHostReservationPurchasePreviewResult
 */
- (void)getHostReservationPurchasePreview:(AWSEC2GetHostReservationPurchasePreviewRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2GetHostReservationPurchasePreviewResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the configuration data of the specified instance. You can use this data to create a launch template.</p>
 
 @param request A container for the necessary parameters to execute the GetLaunchTemplateData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2GetLaunchTemplateDataResult`.
 
 @see AWSEC2GetLaunchTemplateDataRequest
 @see AWSEC2GetLaunchTemplateDataResult
 */
- (AWSTask<AWSEC2GetLaunchTemplateDataResult *> *)getLaunchTemplateData:(AWSEC2GetLaunchTemplateDataRequest *)request;

/**
 <p>Retrieves the configuration data of the specified instance. You can use this data to create a launch template.</p>
 
 @param request A container for the necessary parameters to execute the GetLaunchTemplateData service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2GetLaunchTemplateDataRequest
 @see AWSEC2GetLaunchTemplateDataResult
 */
- (void)getLaunchTemplateData:(AWSEC2GetLaunchTemplateDataRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2GetLaunchTemplateDataResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the encrypted administrator password for a running Windows instance.</p><p>The Windows password is generated at boot by the <code>EC2Config</code> service or <code>EC2Launch</code> scripts (Windows Server 2016 and later). This usually only happens the first time an instance is launched. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/UsingConfig_WinAMI.html">EC2Config</a> and <a href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2launch.html">EC2Launch</a> in the Amazon Elastic Compute Cloud User Guide.</p><p>For the <code>EC2Config</code> service, the password is not generated for rebundled AMIs unless <code>Ec2SetPassword</code> is enabled before bundling.</p><p>The password is encrypted using the key pair that you specified when you launched the instance. You must provide the corresponding key pair file.</p><p>When you launch an instance, password generation and encryption may take a few minutes. If you try to retrieve the password before it's available, the output returns an empty string. We recommend that you wait up to 15 minutes after launching an instance before trying to retrieve the generated password.</p>
 
 @param request A container for the necessary parameters to execute the GetPasswordData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2GetPasswordDataResult`.
 
 @see AWSEC2GetPasswordDataRequest
 @see AWSEC2GetPasswordDataResult
 */
- (AWSTask<AWSEC2GetPasswordDataResult *> *)getPasswordData:(AWSEC2GetPasswordDataRequest *)request;

/**
 <p>Retrieves the encrypted administrator password for a running Windows instance.</p><p>The Windows password is generated at boot by the <code>EC2Config</code> service or <code>EC2Launch</code> scripts (Windows Server 2016 and later). This usually only happens the first time an instance is launched. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/UsingConfig_WinAMI.html">EC2Config</a> and <a href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2launch.html">EC2Launch</a> in the Amazon Elastic Compute Cloud User Guide.</p><p>For the <code>EC2Config</code> service, the password is not generated for rebundled AMIs unless <code>Ec2SetPassword</code> is enabled before bundling.</p><p>The password is encrypted using the key pair that you specified when you launched the instance. You must provide the corresponding key pair file.</p><p>When you launch an instance, password generation and encryption may take a few minutes. If you try to retrieve the password before it's available, the output returns an empty string. We recommend that you wait up to 15 minutes after launching an instance before trying to retrieve the generated password.</p>
 
 @param request A container for the necessary parameters to execute the GetPasswordData service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2GetPasswordDataRequest
 @see AWSEC2GetPasswordDataResult
 */
- (void)getPasswordData:(AWSEC2GetPasswordDataRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2GetPasswordDataResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a quote and exchange information for exchanging one or more specified Convertible Reserved Instances for a new Convertible Reserved Instance. If the exchange cannot be performed, the reason is returned in the response. Use <a>AcceptReservedInstancesExchangeQuote</a> to perform the exchange.</p>
 
 @param request A container for the necessary parameters to execute the GetReservedInstancesExchangeQuote service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2GetReservedInstancesExchangeQuoteResult`.
 
 @see AWSEC2GetReservedInstancesExchangeQuoteRequest
 @see AWSEC2GetReservedInstancesExchangeQuoteResult
 */
- (AWSTask<AWSEC2GetReservedInstancesExchangeQuoteResult *> *)getReservedInstancesExchangeQuote:(AWSEC2GetReservedInstancesExchangeQuoteRequest *)request;

/**
 <p>Returns a quote and exchange information for exchanging one or more specified Convertible Reserved Instances for a new Convertible Reserved Instance. If the exchange cannot be performed, the reason is returned in the response. Use <a>AcceptReservedInstancesExchangeQuote</a> to perform the exchange.</p>
 
 @param request A container for the necessary parameters to execute the GetReservedInstancesExchangeQuote service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2GetReservedInstancesExchangeQuoteRequest
 @see AWSEC2GetReservedInstancesExchangeQuoteResult
 */
- (void)getReservedInstancesExchangeQuote:(AWSEC2GetReservedInstancesExchangeQuoteRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2GetReservedInstancesExchangeQuoteResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the route tables to which the specified resource attachment propagates routes.</p>
 
 @param request A container for the necessary parameters to execute the GetTransitGatewayAttachmentPropagations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2GetTransitGatewayAttachmentPropagationsResult`.
 
 @see AWSEC2GetTransitGatewayAttachmentPropagationsRequest
 @see AWSEC2GetTransitGatewayAttachmentPropagationsResult
 */
- (AWSTask<AWSEC2GetTransitGatewayAttachmentPropagationsResult *> *)getTransitGatewayAttachmentPropagations:(AWSEC2GetTransitGatewayAttachmentPropagationsRequest *)request;

/**
 <p>Lists the route tables to which the specified resource attachment propagates routes.</p>
 
 @param request A container for the necessary parameters to execute the GetTransitGatewayAttachmentPropagations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2GetTransitGatewayAttachmentPropagationsRequest
 @see AWSEC2GetTransitGatewayAttachmentPropagationsResult
 */
- (void)getTransitGatewayAttachmentPropagations:(AWSEC2GetTransitGatewayAttachmentPropagationsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2GetTransitGatewayAttachmentPropagationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the associations for the transit gateway multicast domain.</p>
 
 @param request A container for the necessary parameters to execute the GetTransitGatewayMulticastDomainAssociations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2GetTransitGatewayMulticastDomainAssociationsResult`.
 
 @see AWSEC2GetTransitGatewayMulticastDomainAssociationsRequest
 @see AWSEC2GetTransitGatewayMulticastDomainAssociationsResult
 */
- (AWSTask<AWSEC2GetTransitGatewayMulticastDomainAssociationsResult *> *)getTransitGatewayMulticastDomainAssociations:(AWSEC2GetTransitGatewayMulticastDomainAssociationsRequest *)request;

/**
 <p>Gets information about the associations for the transit gateway multicast domain.</p>
 
 @param request A container for the necessary parameters to execute the GetTransitGatewayMulticastDomainAssociations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2GetTransitGatewayMulticastDomainAssociationsRequest
 @see AWSEC2GetTransitGatewayMulticastDomainAssociationsResult
 */
- (void)getTransitGatewayMulticastDomainAssociations:(AWSEC2GetTransitGatewayMulticastDomainAssociationsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2GetTransitGatewayMulticastDomainAssociationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the associations for the specified transit gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the GetTransitGatewayRouteTableAssociations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2GetTransitGatewayRouteTableAssociationsResult`.
 
 @see AWSEC2GetTransitGatewayRouteTableAssociationsRequest
 @see AWSEC2GetTransitGatewayRouteTableAssociationsResult
 */
- (AWSTask<AWSEC2GetTransitGatewayRouteTableAssociationsResult *> *)getTransitGatewayRouteTableAssociations:(AWSEC2GetTransitGatewayRouteTableAssociationsRequest *)request;

/**
 <p>Gets information about the associations for the specified transit gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the GetTransitGatewayRouteTableAssociations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2GetTransitGatewayRouteTableAssociationsRequest
 @see AWSEC2GetTransitGatewayRouteTableAssociationsResult
 */
- (void)getTransitGatewayRouteTableAssociations:(AWSEC2GetTransitGatewayRouteTableAssociationsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2GetTransitGatewayRouteTableAssociationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the route table propagations for the specified transit gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the GetTransitGatewayRouteTablePropagations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2GetTransitGatewayRouteTablePropagationsResult`.
 
 @see AWSEC2GetTransitGatewayRouteTablePropagationsRequest
 @see AWSEC2GetTransitGatewayRouteTablePropagationsResult
 */
- (AWSTask<AWSEC2GetTransitGatewayRouteTablePropagationsResult *> *)getTransitGatewayRouteTablePropagations:(AWSEC2GetTransitGatewayRouteTablePropagationsRequest *)request;

/**
 <p>Gets information about the route table propagations for the specified transit gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the GetTransitGatewayRouteTablePropagations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2GetTransitGatewayRouteTablePropagationsRequest
 @see AWSEC2GetTransitGatewayRouteTablePropagationsResult
 */
- (void)getTransitGatewayRouteTablePropagations:(AWSEC2GetTransitGatewayRouteTablePropagationsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2GetTransitGatewayRouteTablePropagationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Uploads a client certificate revocation list to the specified Client VPN endpoint. Uploading a client certificate revocation list overwrites the existing client certificate revocation list.</p><p>Uploading a client certificate revocation list resets existing client connections.</p>
 
 @param request A container for the necessary parameters to execute the ImportClientVpnClientCertificateRevocationList service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ImportClientVpnClientCertificateRevocationListResult`.
 
 @see AWSEC2ImportClientVpnClientCertificateRevocationListRequest
 @see AWSEC2ImportClientVpnClientCertificateRevocationListResult
 */
- (AWSTask<AWSEC2ImportClientVpnClientCertificateRevocationListResult *> *)importClientVpnClientCertificateRevocationList:(AWSEC2ImportClientVpnClientCertificateRevocationListRequest *)request;

/**
 <p>Uploads a client certificate revocation list to the specified Client VPN endpoint. Uploading a client certificate revocation list overwrites the existing client certificate revocation list.</p><p>Uploading a client certificate revocation list resets existing client connections.</p>
 
 @param request A container for the necessary parameters to execute the ImportClientVpnClientCertificateRevocationList service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ImportClientVpnClientCertificateRevocationListRequest
 @see AWSEC2ImportClientVpnClientCertificateRevocationListResult
 */
- (void)importClientVpnClientCertificateRevocationList:(AWSEC2ImportClientVpnClientCertificateRevocationListRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ImportClientVpnClientCertificateRevocationListResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Import single or multi-volume disk images or EBS snapshots into an Amazon Machine Image (AMI). For more information, see <a href="https://docs.aws.amazon.com/vm-import/latest/userguide/vmimport-image-import.html">Importing a VM as an Image Using VM Import/Export</a> in the <i>VM Import/Export User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ImportImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ImportImageResult`.
 
 @see AWSEC2ImportImageRequest
 @see AWSEC2ImportImageResult
 */
- (AWSTask<AWSEC2ImportImageResult *> *)importImage:(AWSEC2ImportImageRequest *)request;

/**
 <p>Import single or multi-volume disk images or EBS snapshots into an Amazon Machine Image (AMI). For more information, see <a href="https://docs.aws.amazon.com/vm-import/latest/userguide/vmimport-image-import.html">Importing a VM as an Image Using VM Import/Export</a> in the <i>VM Import/Export User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ImportImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ImportImageRequest
 @see AWSEC2ImportImageResult
 */
- (void)importImage:(AWSEC2ImportImageRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ImportImageResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an import instance task using metadata from the specified disk image. <code>ImportInstance</code> only supports single-volume VMs. To import multi-volume VMs, use <a>ImportImage</a>. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/ec2-cli-vmimport-export.html">Importing a Virtual Machine Using the Amazon EC2 CLI</a>.</p><p>For information about the import manifest referenced by this API action, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html">VM Import Manifest</a>.</p>
 
 @param request A container for the necessary parameters to execute the ImportInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ImportInstanceResult`.
 
 @see AWSEC2ImportInstanceRequest
 @see AWSEC2ImportInstanceResult
 */
- (AWSTask<AWSEC2ImportInstanceResult *> *)importInstance:(AWSEC2ImportInstanceRequest *)request;

/**
 <p>Creates an import instance task using metadata from the specified disk image. <code>ImportInstance</code> only supports single-volume VMs. To import multi-volume VMs, use <a>ImportImage</a>. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/ec2-cli-vmimport-export.html">Importing a Virtual Machine Using the Amazon EC2 CLI</a>.</p><p>For information about the import manifest referenced by this API action, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html">VM Import Manifest</a>.</p>
 
 @param request A container for the necessary parameters to execute the ImportInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ImportInstanceRequest
 @see AWSEC2ImportInstanceResult
 */
- (void)importInstance:(AWSEC2ImportInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ImportInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Imports the public key from an RSA key pair that you created with a third-party tool. Compare this with <a>CreateKeyPair</a>, in which AWS creates the key pair and gives the keys to you (AWS keeps a copy of the public key). With ImportKeyPair, you create the key pair and give AWS just the public key. The private key is never transferred between you and AWS.</p><p>For more information about key pairs, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ImportKeyPair service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ImportKeyPairResult`.
 
 @see AWSEC2ImportKeyPairRequest
 @see AWSEC2ImportKeyPairResult
 */
- (AWSTask<AWSEC2ImportKeyPairResult *> *)importKeyPair:(AWSEC2ImportKeyPairRequest *)request;

/**
 <p>Imports the public key from an RSA key pair that you created with a third-party tool. Compare this with <a>CreateKeyPair</a>, in which AWS creates the key pair and gives the keys to you (AWS keeps a copy of the public key). With ImportKeyPair, you create the key pair and give AWS just the public key. The private key is never transferred between you and AWS.</p><p>For more information about key pairs, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ImportKeyPair service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ImportKeyPairRequest
 @see AWSEC2ImportKeyPairResult
 */
- (void)importKeyPair:(AWSEC2ImportKeyPairRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ImportKeyPairResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Imports a disk into an EBS snapshot.</p>
 
 @param request A container for the necessary parameters to execute the ImportSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ImportSnapshotResult`.
 
 @see AWSEC2ImportSnapshotRequest
 @see AWSEC2ImportSnapshotResult
 */
- (AWSTask<AWSEC2ImportSnapshotResult *> *)importSnapshot:(AWSEC2ImportSnapshotRequest *)request;

/**
 <p>Imports a disk into an EBS snapshot.</p>
 
 @param request A container for the necessary parameters to execute the ImportSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ImportSnapshotRequest
 @see AWSEC2ImportSnapshotResult
 */
- (void)importSnapshot:(AWSEC2ImportSnapshotRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ImportSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an import volume task using metadata from the specified disk image.For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/importing-your-volumes-into-amazon-ebs.html">Importing Disks to Amazon EBS</a>.</p><p>For information about the import manifest referenced by this API action, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html">VM Import Manifest</a>.</p>
 
 @param request A container for the necessary parameters to execute the ImportVolume service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ImportVolumeResult`.
 
 @see AWSEC2ImportVolumeRequest
 @see AWSEC2ImportVolumeResult
 */
- (AWSTask<AWSEC2ImportVolumeResult *> *)importVolume:(AWSEC2ImportVolumeRequest *)request;

/**
 <p>Creates an import volume task using metadata from the specified disk image.For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/importing-your-volumes-into-amazon-ebs.html">Importing Disks to Amazon EBS</a>.</p><p>For information about the import manifest referenced by this API action, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html">VM Import Manifest</a>.</p>
 
 @param request A container for the necessary parameters to execute the ImportVolume service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ImportVolumeRequest
 @see AWSEC2ImportVolumeResult
 */
- (void)importVolume:(AWSEC2ImportVolumeRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ImportVolumeResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables or disables an Availability Zone group for your account.</p><p>Use <a href="https://docs.aws.amazon.com/AWSEC2ApiDocReef/build/server-root/AWSEC2/latest/APIReference/API_DescribeAvailabilityZones.html">describe-availability-zones</a> to view the value for <code>GroupName</code>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyAvailabilityZoneGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyAvailabilityZoneGroupResult`.
 
 @see AWSEC2ModifyAvailabilityZoneGroupRequest
 @see AWSEC2ModifyAvailabilityZoneGroupResult
 */
- (AWSTask<AWSEC2ModifyAvailabilityZoneGroupResult *> *)modifyAvailabilityZoneGroup:(AWSEC2ModifyAvailabilityZoneGroupRequest *)request;

/**
 <p>Enables or disables an Availability Zone group for your account.</p><p>Use <a href="https://docs.aws.amazon.com/AWSEC2ApiDocReef/build/server-root/AWSEC2/latest/APIReference/API_DescribeAvailabilityZones.html">describe-availability-zones</a> to view the value for <code>GroupName</code>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyAvailabilityZoneGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyAvailabilityZoneGroupRequest
 @see AWSEC2ModifyAvailabilityZoneGroupResult
 */
- (void)modifyAvailabilityZoneGroup:(AWSEC2ModifyAvailabilityZoneGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyAvailabilityZoneGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies a Capacity Reservation's capacity and the conditions under which it is to be released. You cannot change a Capacity Reservation's instance type, EBS optimization, instance store settings, platform, Availability Zone, or instance eligibility. If you need to modify any of these attributes, we recommend that you cancel the Capacity Reservation, and then create a new one with the required attributes.</p>
 
 @param request A container for the necessary parameters to execute the ModifyCapacityReservation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyCapacityReservationResult`.
 
 @see AWSEC2ModifyCapacityReservationRequest
 @see AWSEC2ModifyCapacityReservationResult
 */
- (AWSTask<AWSEC2ModifyCapacityReservationResult *> *)modifyCapacityReservation:(AWSEC2ModifyCapacityReservationRequest *)request;

/**
 <p>Modifies a Capacity Reservation's capacity and the conditions under which it is to be released. You cannot change a Capacity Reservation's instance type, EBS optimization, instance store settings, platform, Availability Zone, or instance eligibility. If you need to modify any of these attributes, we recommend that you cancel the Capacity Reservation, and then create a new one with the required attributes.</p>
 
 @param request A container for the necessary parameters to execute the ModifyCapacityReservation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyCapacityReservationRequest
 @see AWSEC2ModifyCapacityReservationResult
 */
- (void)modifyCapacityReservation:(AWSEC2ModifyCapacityReservationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyCapacityReservationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the specified Client VPN endpoint. Modifying the DNS server resets existing client connections.</p>
 
 @param request A container for the necessary parameters to execute the ModifyClientVpnEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyClientVpnEndpointResult`.
 
 @see AWSEC2ModifyClientVpnEndpointRequest
 @see AWSEC2ModifyClientVpnEndpointResult
 */
- (AWSTask<AWSEC2ModifyClientVpnEndpointResult *> *)modifyClientVpnEndpoint:(AWSEC2ModifyClientVpnEndpointRequest *)request;

/**
 <p>Modifies the specified Client VPN endpoint. Modifying the DNS server resets existing client connections.</p>
 
 @param request A container for the necessary parameters to execute the ModifyClientVpnEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyClientVpnEndpointRequest
 @see AWSEC2ModifyClientVpnEndpointResult
 */
- (void)modifyClientVpnEndpoint:(AWSEC2ModifyClientVpnEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyClientVpnEndpointResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the default credit option for CPU usage of burstable performance instances. The default credit option is set at the account level per AWS Region, and is specified per instance family. All new burstable performance instances in the account launch using the default credit option.</p><p><code>ModifyDefaultCreditSpecification</code> is an asynchronous operation, which works at an AWS Region level and modifies the credit option for each Availability Zone. All zones in a Region are updated within five minutes. But if instances are launched during this operation, they might not get the new credit option until the zone is updated. To verify whether the update has occurred, you can call <code>GetDefaultCreditSpecification</code> and check <code>DefaultCreditSpecification</code> for updates.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html">Burstable Performance Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyDefaultCreditSpecification service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyDefaultCreditSpecificationResult`.
 
 @see AWSEC2ModifyDefaultCreditSpecificationRequest
 @see AWSEC2ModifyDefaultCreditSpecificationResult
 */
- (AWSTask<AWSEC2ModifyDefaultCreditSpecificationResult *> *)modifyDefaultCreditSpecification:(AWSEC2ModifyDefaultCreditSpecificationRequest *)request;

/**
 <p>Modifies the default credit option for CPU usage of burstable performance instances. The default credit option is set at the account level per AWS Region, and is specified per instance family. All new burstable performance instances in the account launch using the default credit option.</p><p><code>ModifyDefaultCreditSpecification</code> is an asynchronous operation, which works at an AWS Region level and modifies the credit option for each Availability Zone. All zones in a Region are updated within five minutes. But if instances are launched during this operation, they might not get the new credit option until the zone is updated. To verify whether the update has occurred, you can call <code>GetDefaultCreditSpecification</code> and check <code>DefaultCreditSpecification</code> for updates.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html">Burstable Performance Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyDefaultCreditSpecification service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyDefaultCreditSpecificationRequest
 @see AWSEC2ModifyDefaultCreditSpecificationResult
 */
- (void)modifyDefaultCreditSpecification:(AWSEC2ModifyDefaultCreditSpecificationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyDefaultCreditSpecificationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Changes the default customer master key (CMK) for EBS encryption by default for your account in this Region.</p><p>AWS creates a unique AWS managed CMK in each Region for use with encryption by default. If you change the default CMK to a symmetric customer managed CMK, it is used instead of the AWS managed CMK. To reset the default CMK to the AWS managed CMK for EBS, use <a>ResetEbsDefaultKmsKeyId</a>. Amazon EBS does not support asymmetric CMKs.</p><p>If you delete or disable the customer managed CMK that you specified for use with encryption by default, your instances will fail to launch.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyEbsDefaultKmsKeyId service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyEbsDefaultKmsKeyIdResult`.
 
 @see AWSEC2ModifyEbsDefaultKmsKeyIdRequest
 @see AWSEC2ModifyEbsDefaultKmsKeyIdResult
 */
- (AWSTask<AWSEC2ModifyEbsDefaultKmsKeyIdResult *> *)modifyEbsDefaultKmsKeyId:(AWSEC2ModifyEbsDefaultKmsKeyIdRequest *)request;

/**
 <p>Changes the default customer master key (CMK) for EBS encryption by default for your account in this Region.</p><p>AWS creates a unique AWS managed CMK in each Region for use with encryption by default. If you change the default CMK to a symmetric customer managed CMK, it is used instead of the AWS managed CMK. To reset the default CMK to the AWS managed CMK for EBS, use <a>ResetEbsDefaultKmsKeyId</a>. Amazon EBS does not support asymmetric CMKs.</p><p>If you delete or disable the customer managed CMK that you specified for use with encryption by default, your instances will fail to launch.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyEbsDefaultKmsKeyId service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyEbsDefaultKmsKeyIdRequest
 @see AWSEC2ModifyEbsDefaultKmsKeyIdResult
 */
- (void)modifyEbsDefaultKmsKeyId:(AWSEC2ModifyEbsDefaultKmsKeyIdRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyEbsDefaultKmsKeyIdResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the specified EC2 Fleet.</p><p>You can only modify an EC2 Fleet request of type <code>maintain</code>.</p><p>While the EC2 Fleet is being modified, it is in the <code>modifying</code> state.</p><p>To scale up your EC2 Fleet, increase its target capacity. The EC2 Fleet launches the additional Spot Instances according to the allocation strategy for the EC2 Fleet request. If the allocation strategy is <code>lowest-price</code>, the EC2 Fleet launches instances using the Spot Instance pool with the lowest price. If the allocation strategy is <code>diversified</code>, the EC2 Fleet distributes the instances across the Spot Instance pools. If the allocation strategy is <code>capacity-optimized</code>, EC2 Fleet launches instances from Spot Instance pools with optimal capacity for the number of instances that are launching.</p><p>To scale down your EC2 Fleet, decrease its target capacity. First, the EC2 Fleet cancels any open requests that exceed the new target capacity. You can request that the EC2 Fleet terminate Spot Instances until the size of the fleet no longer exceeds the new target capacity. If the allocation strategy is <code>lowest-price</code>, the EC2 Fleet terminates the instances with the highest price per unit. If the allocation strategy is <code>capacity-optimized</code>, the EC2 Fleet terminates the instances in the Spot Instance pools that have the least available Spot Instance capacity. If the allocation strategy is <code>diversified</code>, the EC2 Fleet terminates instances across the Spot Instance pools. Alternatively, you can request that the EC2 Fleet keep the fleet at its current size, but not replace any Spot Instances that are interrupted or that you terminate manually.</p><p>If you are finished with your EC2 Fleet for now, but will use it again later, you can set the target capacity to 0.</p>
 
 @param request A container for the necessary parameters to execute the ModifyFleet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyFleetResult`.
 
 @see AWSEC2ModifyFleetRequest
 @see AWSEC2ModifyFleetResult
 */
- (AWSTask<AWSEC2ModifyFleetResult *> *)modifyFleet:(AWSEC2ModifyFleetRequest *)request;

/**
 <p>Modifies the specified EC2 Fleet.</p><p>You can only modify an EC2 Fleet request of type <code>maintain</code>.</p><p>While the EC2 Fleet is being modified, it is in the <code>modifying</code> state.</p><p>To scale up your EC2 Fleet, increase its target capacity. The EC2 Fleet launches the additional Spot Instances according to the allocation strategy for the EC2 Fleet request. If the allocation strategy is <code>lowest-price</code>, the EC2 Fleet launches instances using the Spot Instance pool with the lowest price. If the allocation strategy is <code>diversified</code>, the EC2 Fleet distributes the instances across the Spot Instance pools. If the allocation strategy is <code>capacity-optimized</code>, EC2 Fleet launches instances from Spot Instance pools with optimal capacity for the number of instances that are launching.</p><p>To scale down your EC2 Fleet, decrease its target capacity. First, the EC2 Fleet cancels any open requests that exceed the new target capacity. You can request that the EC2 Fleet terminate Spot Instances until the size of the fleet no longer exceeds the new target capacity. If the allocation strategy is <code>lowest-price</code>, the EC2 Fleet terminates the instances with the highest price per unit. If the allocation strategy is <code>capacity-optimized</code>, the EC2 Fleet terminates the instances in the Spot Instance pools that have the least available Spot Instance capacity. If the allocation strategy is <code>diversified</code>, the EC2 Fleet terminates instances across the Spot Instance pools. Alternatively, you can request that the EC2 Fleet keep the fleet at its current size, but not replace any Spot Instances that are interrupted or that you terminate manually.</p><p>If you are finished with your EC2 Fleet for now, but will use it again later, you can set the target capacity to 0.</p>
 
 @param request A container for the necessary parameters to execute the ModifyFleet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyFleetRequest
 @see AWSEC2ModifyFleetResult
 */
- (void)modifyFleet:(AWSEC2ModifyFleetRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyFleetResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the specified attribute of the specified Amazon FPGA Image (AFI).</p>
 
 @param request A container for the necessary parameters to execute the ModifyFpgaImageAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyFpgaImageAttributeResult`.
 
 @see AWSEC2ModifyFpgaImageAttributeRequest
 @see AWSEC2ModifyFpgaImageAttributeResult
 */
- (AWSTask<AWSEC2ModifyFpgaImageAttributeResult *> *)modifyFpgaImageAttribute:(AWSEC2ModifyFpgaImageAttributeRequest *)request;

/**
 <p>Modifies the specified attribute of the specified Amazon FPGA Image (AFI).</p>
 
 @param request A container for the necessary parameters to execute the ModifyFpgaImageAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyFpgaImageAttributeRequest
 @see AWSEC2ModifyFpgaImageAttributeResult
 */
- (void)modifyFpgaImageAttribute:(AWSEC2ModifyFpgaImageAttributeRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyFpgaImageAttributeResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modify the auto-placement setting of a Dedicated Host. When auto-placement is enabled, any instances that you launch with a tenancy of <code>host</code> but without a specific host ID are placed onto any available Dedicated Host in your account that has auto-placement enabled. When auto-placement is disabled, you need to provide a host ID to have the instance launch onto a specific host. If no host ID is provided, the instance is launched onto a suitable host with auto-placement enabled.</p><p>You can also use this API action to modify a Dedicated Host to support either multiple instance types in an instance family, or to support a specific instance type only.</p>
 
 @param request A container for the necessary parameters to execute the ModifyHosts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyHostsResult`.
 
 @see AWSEC2ModifyHostsRequest
 @see AWSEC2ModifyHostsResult
 */
- (AWSTask<AWSEC2ModifyHostsResult *> *)modifyHosts:(AWSEC2ModifyHostsRequest *)request;

/**
 <p>Modify the auto-placement setting of a Dedicated Host. When auto-placement is enabled, any instances that you launch with a tenancy of <code>host</code> but without a specific host ID are placed onto any available Dedicated Host in your account that has auto-placement enabled. When auto-placement is disabled, you need to provide a host ID to have the instance launch onto a specific host. If no host ID is provided, the instance is launched onto a suitable host with auto-placement enabled.</p><p>You can also use this API action to modify a Dedicated Host to support either multiple instance types in an instance family, or to support a specific instance type only.</p>
 
 @param request A container for the necessary parameters to execute the ModifyHosts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyHostsRequest
 @see AWSEC2ModifyHostsResult
 */
- (void)modifyHosts:(AWSEC2ModifyHostsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyHostsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the ID format for the specified resource on a per-Region basis. You can specify that resources should receive longer IDs (17-character IDs) when they are created.</p><p>This request can only be used to modify longer ID settings for resource types that are within the opt-in period. Resources currently in their opt-in period include: <code>bundle</code> | <code>conversion-task</code> | <code>customer-gateway</code> | <code>dhcp-options</code> | <code>elastic-ip-allocation</code> | <code>elastic-ip-association</code> | <code>export-task</code> | <code>flow-log</code> | <code>image</code> | <code>import-task</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-acl-association</code> | <code>network-interface</code> | <code>network-interface-attachment</code> | <code>prefix-list</code> | <code>route-table</code> | <code>route-table-association</code> | <code>security-group</code> | <code>subnet</code> | <code>subnet-cidr-block-association</code> | <code>vpc</code> | <code>vpc-cidr-block-association</code> | <code>vpc-endpoint</code> | <code>vpc-peering-connection</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>.</p><p>This setting applies to the IAM user who makes the request; it does not apply to the entire AWS account. By default, an IAM user defaults to the same settings as the root user. If you're using this action as the root user, then these settings apply to the entire account, unless an IAM user explicitly overrides these settings for themselves. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resource-ids.html">Resource IDs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>Resources created with longer IDs are visible to all IAM roles and users, regardless of these settings and provided that they have permission to use the relevant <code>Describe</code> command for the resource type.</p>
 
 @param request A container for the necessary parameters to execute the ModifyIdFormat service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ModifyIdFormatRequest
 */
- (AWSTask *)modifyIdFormat:(AWSEC2ModifyIdFormatRequest *)request;

/**
 <p>Modifies the ID format for the specified resource on a per-Region basis. You can specify that resources should receive longer IDs (17-character IDs) when they are created.</p><p>This request can only be used to modify longer ID settings for resource types that are within the opt-in period. Resources currently in their opt-in period include: <code>bundle</code> | <code>conversion-task</code> | <code>customer-gateway</code> | <code>dhcp-options</code> | <code>elastic-ip-allocation</code> | <code>elastic-ip-association</code> | <code>export-task</code> | <code>flow-log</code> | <code>image</code> | <code>import-task</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-acl-association</code> | <code>network-interface</code> | <code>network-interface-attachment</code> | <code>prefix-list</code> | <code>route-table</code> | <code>route-table-association</code> | <code>security-group</code> | <code>subnet</code> | <code>subnet-cidr-block-association</code> | <code>vpc</code> | <code>vpc-cidr-block-association</code> | <code>vpc-endpoint</code> | <code>vpc-peering-connection</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>.</p><p>This setting applies to the IAM user who makes the request; it does not apply to the entire AWS account. By default, an IAM user defaults to the same settings as the root user. If you're using this action as the root user, then these settings apply to the entire account, unless an IAM user explicitly overrides these settings for themselves. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resource-ids.html">Resource IDs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>Resources created with longer IDs are visible to all IAM roles and users, regardless of these settings and provided that they have permission to use the relevant <code>Describe</code> command for the resource type.</p>
 
 @param request A container for the necessary parameters to execute the ModifyIdFormat service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyIdFormatRequest
 */
- (void)modifyIdFormat:(AWSEC2ModifyIdFormatRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the ID format of a resource for a specified IAM user, IAM role, or the root user for an account; or all IAM users, IAM roles, and the root user for an account. You can specify that resources should receive longer IDs (17-character IDs) when they are created. </p><p>This request can only be used to modify longer ID settings for resource types that are within the opt-in period. Resources currently in their opt-in period include: <code>bundle</code> | <code>conversion-task</code> | <code>customer-gateway</code> | <code>dhcp-options</code> | <code>elastic-ip-allocation</code> | <code>elastic-ip-association</code> | <code>export-task</code> | <code>flow-log</code> | <code>image</code> | <code>import-task</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-acl-association</code> | <code>network-interface</code> | <code>network-interface-attachment</code> | <code>prefix-list</code> | <code>route-table</code> | <code>route-table-association</code> | <code>security-group</code> | <code>subnet</code> | <code>subnet-cidr-block-association</code> | <code>vpc</code> | <code>vpc-cidr-block-association</code> | <code>vpc-endpoint</code> | <code>vpc-peering-connection</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>. </p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resource-ids.html">Resource IDs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. </p><p>This setting applies to the principal specified in the request; it does not apply to the principal that makes the request. </p><p>Resources created with longer IDs are visible to all IAM roles and users, regardless of these settings and provided that they have permission to use the relevant <code>Describe</code> command for the resource type.</p>
 
 @param request A container for the necessary parameters to execute the ModifyIdentityIdFormat service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ModifyIdentityIdFormatRequest
 */
- (AWSTask *)modifyIdentityIdFormat:(AWSEC2ModifyIdentityIdFormatRequest *)request;

/**
 <p>Modifies the ID format of a resource for a specified IAM user, IAM role, or the root user for an account; or all IAM users, IAM roles, and the root user for an account. You can specify that resources should receive longer IDs (17-character IDs) when they are created. </p><p>This request can only be used to modify longer ID settings for resource types that are within the opt-in period. Resources currently in their opt-in period include: <code>bundle</code> | <code>conversion-task</code> | <code>customer-gateway</code> | <code>dhcp-options</code> | <code>elastic-ip-allocation</code> | <code>elastic-ip-association</code> | <code>export-task</code> | <code>flow-log</code> | <code>image</code> | <code>import-task</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-acl-association</code> | <code>network-interface</code> | <code>network-interface-attachment</code> | <code>prefix-list</code> | <code>route-table</code> | <code>route-table-association</code> | <code>security-group</code> | <code>subnet</code> | <code>subnet-cidr-block-association</code> | <code>vpc</code> | <code>vpc-cidr-block-association</code> | <code>vpc-endpoint</code> | <code>vpc-peering-connection</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>. </p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resource-ids.html">Resource IDs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. </p><p>This setting applies to the principal specified in the request; it does not apply to the principal that makes the request. </p><p>Resources created with longer IDs are visible to all IAM roles and users, regardless of these settings and provided that they have permission to use the relevant <code>Describe</code> command for the resource type.</p>
 
 @param request A container for the necessary parameters to execute the ModifyIdentityIdFormat service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyIdentityIdFormatRequest
 */
- (void)modifyIdentityIdFormat:(AWSEC2ModifyIdentityIdFormatRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the specified attribute of the specified AMI. You can specify only one attribute at a time. You can use the <code>Attribute</code> parameter to specify the attribute or one of the following parameters: <code>Description</code>, <code>LaunchPermission</code>, or <code>ProductCode</code>.</p><p>AWS Marketplace product codes cannot be modified. Images with an AWS Marketplace product code cannot be made public.</p><p>To enable the SriovNetSupport enhanced networking attribute of an image, enable SriovNetSupport on an instance and create an AMI from the instance.</p>
 
 @param request A container for the necessary parameters to execute the ModifyImageAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ModifyImageAttributeRequest
 */
- (AWSTask *)modifyImageAttribute:(AWSEC2ModifyImageAttributeRequest *)request;

/**
 <p>Modifies the specified attribute of the specified AMI. You can specify only one attribute at a time. You can use the <code>Attribute</code> parameter to specify the attribute or one of the following parameters: <code>Description</code>, <code>LaunchPermission</code>, or <code>ProductCode</code>.</p><p>AWS Marketplace product codes cannot be modified. Images with an AWS Marketplace product code cannot be made public.</p><p>To enable the SriovNetSupport enhanced networking attribute of an image, enable SriovNetSupport on an instance and create an AMI from the instance.</p>
 
 @param request A container for the necessary parameters to execute the ModifyImageAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyImageAttributeRequest
 */
- (void)modifyImageAttribute:(AWSEC2ModifyImageAttributeRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the specified attribute of the specified instance. You can specify only one attribute at a time.</p><p><b>Note: </b>Using this action to change the security groups associated with an elastic network interface (ENI) attached to an instance in a VPC can result in an error if the instance has more than one ENI. To change the security groups associated with an ENI attached to an instance that has multiple ENIs, we recommend that you use the <a>ModifyNetworkInterfaceAttribute</a> action.</p><p>To modify some attributes, the instance must be stopped. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_ChangingAttributesWhileInstanceStopped.html">Modifying Attributes of a Stopped Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyInstanceAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ModifyInstanceAttributeRequest
 */
- (AWSTask *)modifyInstanceAttribute:(AWSEC2ModifyInstanceAttributeRequest *)request;

/**
 <p>Modifies the specified attribute of the specified instance. You can specify only one attribute at a time.</p><p><b>Note: </b>Using this action to change the security groups associated with an elastic network interface (ENI) attached to an instance in a VPC can result in an error if the instance has more than one ENI. To change the security groups associated with an ENI attached to an instance that has multiple ENIs, we recommend that you use the <a>ModifyNetworkInterfaceAttribute</a> action.</p><p>To modify some attributes, the instance must be stopped. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_ChangingAttributesWhileInstanceStopped.html">Modifying Attributes of a Stopped Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyInstanceAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyInstanceAttributeRequest
 */
- (void)modifyInstanceAttribute:(AWSEC2ModifyInstanceAttributeRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the Capacity Reservation settings for a stopped instance. Use this action to configure an instance to target a specific Capacity Reservation, run in any <code>open</code> Capacity Reservation with matching attributes, or run On-Demand Instance capacity.</p>
 
 @param request A container for the necessary parameters to execute the ModifyInstanceCapacityReservationAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyInstanceCapacityReservationAttributesResult`.
 
 @see AWSEC2ModifyInstanceCapacityReservationAttributesRequest
 @see AWSEC2ModifyInstanceCapacityReservationAttributesResult
 */
- (AWSTask<AWSEC2ModifyInstanceCapacityReservationAttributesResult *> *)modifyInstanceCapacityReservationAttributes:(AWSEC2ModifyInstanceCapacityReservationAttributesRequest *)request;

/**
 <p>Modifies the Capacity Reservation settings for a stopped instance. Use this action to configure an instance to target a specific Capacity Reservation, run in any <code>open</code> Capacity Reservation with matching attributes, or run On-Demand Instance capacity.</p>
 
 @param request A container for the necessary parameters to execute the ModifyInstanceCapacityReservationAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyInstanceCapacityReservationAttributesRequest
 @see AWSEC2ModifyInstanceCapacityReservationAttributesResult
 */
- (void)modifyInstanceCapacityReservationAttributes:(AWSEC2ModifyInstanceCapacityReservationAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyInstanceCapacityReservationAttributesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the credit option for CPU usage on a running or stopped burstable performance instance. The credit options are <code>standard</code> and <code>unlimited</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html">Burstable Performance Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyInstanceCreditSpecification service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyInstanceCreditSpecificationResult`.
 
 @see AWSEC2ModifyInstanceCreditSpecificationRequest
 @see AWSEC2ModifyInstanceCreditSpecificationResult
 */
- (AWSTask<AWSEC2ModifyInstanceCreditSpecificationResult *> *)modifyInstanceCreditSpecification:(AWSEC2ModifyInstanceCreditSpecificationRequest *)request;

/**
 <p>Modifies the credit option for CPU usage on a running or stopped burstable performance instance. The credit options are <code>standard</code> and <code>unlimited</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html">Burstable Performance Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyInstanceCreditSpecification service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyInstanceCreditSpecificationRequest
 @see AWSEC2ModifyInstanceCreditSpecificationResult
 */
- (void)modifyInstanceCreditSpecification:(AWSEC2ModifyInstanceCreditSpecificationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyInstanceCreditSpecificationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the start time for a scheduled Amazon EC2 instance event.</p>
 
 @param request A container for the necessary parameters to execute the ModifyInstanceEventStartTime service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyInstanceEventStartTimeResult`.
 
 @see AWSEC2ModifyInstanceEventStartTimeRequest
 @see AWSEC2ModifyInstanceEventStartTimeResult
 */
- (AWSTask<AWSEC2ModifyInstanceEventStartTimeResult *> *)modifyInstanceEventStartTime:(AWSEC2ModifyInstanceEventStartTimeRequest *)request;

/**
 <p>Modifies the start time for a scheduled Amazon EC2 instance event.</p>
 
 @param request A container for the necessary parameters to execute the ModifyInstanceEventStartTime service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyInstanceEventStartTimeRequest
 @see AWSEC2ModifyInstanceEventStartTimeResult
 */
- (void)modifyInstanceEventStartTime:(AWSEC2ModifyInstanceEventStartTimeRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyInstanceEventStartTimeResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modify the instance metadata parameters on a running or stopped instance. When you modify the parameters on a stopped instance, they are applied when the instance is started. When you modify the parameters on a running instance, the API responds with a state of “pending”. After the parameter modifications are successfully applied to the instance, the state of the modifications changes from “pending” to “applied” in subsequent describe-instances API calls. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html">Instance Metadata and User Data</a>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyInstanceMetadataOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyInstanceMetadataOptionsResult`.
 
 @see AWSEC2ModifyInstanceMetadataOptionsRequest
 @see AWSEC2ModifyInstanceMetadataOptionsResult
 */
- (AWSTask<AWSEC2ModifyInstanceMetadataOptionsResult *> *)modifyInstanceMetadataOptions:(AWSEC2ModifyInstanceMetadataOptionsRequest *)request;

/**
 <p>Modify the instance metadata parameters on a running or stopped instance. When you modify the parameters on a stopped instance, they are applied when the instance is started. When you modify the parameters on a running instance, the API responds with a state of “pending”. After the parameter modifications are successfully applied to the instance, the state of the modifications changes from “pending” to “applied” in subsequent describe-instances API calls. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html">Instance Metadata and User Data</a>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyInstanceMetadataOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyInstanceMetadataOptionsRequest
 @see AWSEC2ModifyInstanceMetadataOptionsResult
 */
- (void)modifyInstanceMetadataOptions:(AWSEC2ModifyInstanceMetadataOptionsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyInstanceMetadataOptionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the placement attributes for a specified instance. You can do the following:</p><ul><li><p>Modify the affinity between an instance and a <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-hosts-overview.html">Dedicated Host</a>. When affinity is set to <code>host</code> and the instance is not associated with a specific Dedicated Host, the next time the instance is launched, it is automatically associated with the host on which it lands. If the instance is restarted or rebooted, this relationship persists.</p></li><li><p>Change the Dedicated Host with which an instance is associated.</p></li><li><p>Change the instance tenancy of an instance from <code>host</code> to <code>dedicated</code>, or from <code>dedicated</code> to <code>host</code>.</p></li><li><p>Move an instance to or from a <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">placement group</a>.</p></li></ul><p>At least one attribute for affinity, host ID, tenancy, or placement group name must be specified in the request. Affinity and tenancy can be modified in the same request.</p><p>To modify the host ID, tenancy, placement group, or partition for an instance, the instance must be in the <code>stopped</code> state.</p>
 
 @param request A container for the necessary parameters to execute the ModifyInstancePlacement service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyInstancePlacementResult`.
 
 @see AWSEC2ModifyInstancePlacementRequest
 @see AWSEC2ModifyInstancePlacementResult
 */
- (AWSTask<AWSEC2ModifyInstancePlacementResult *> *)modifyInstancePlacement:(AWSEC2ModifyInstancePlacementRequest *)request;

/**
 <p>Modifies the placement attributes for a specified instance. You can do the following:</p><ul><li><p>Modify the affinity between an instance and a <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-hosts-overview.html">Dedicated Host</a>. When affinity is set to <code>host</code> and the instance is not associated with a specific Dedicated Host, the next time the instance is launched, it is automatically associated with the host on which it lands. If the instance is restarted or rebooted, this relationship persists.</p></li><li><p>Change the Dedicated Host with which an instance is associated.</p></li><li><p>Change the instance tenancy of an instance from <code>host</code> to <code>dedicated</code>, or from <code>dedicated</code> to <code>host</code>.</p></li><li><p>Move an instance to or from a <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">placement group</a>.</p></li></ul><p>At least one attribute for affinity, host ID, tenancy, or placement group name must be specified in the request. Affinity and tenancy can be modified in the same request.</p><p>To modify the host ID, tenancy, placement group, or partition for an instance, the instance must be in the <code>stopped</code> state.</p>
 
 @param request A container for the necessary parameters to execute the ModifyInstancePlacement service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyInstancePlacementRequest
 @see AWSEC2ModifyInstancePlacementResult
 */
- (void)modifyInstancePlacement:(AWSEC2ModifyInstancePlacementRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyInstancePlacementResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies a launch template. You can specify which version of the launch template to set as the default version. When launching an instance, the default version applies when a launch template version is not specified.</p>
 
 @param request A container for the necessary parameters to execute the ModifyLaunchTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyLaunchTemplateResult`.
 
 @see AWSEC2ModifyLaunchTemplateRequest
 @see AWSEC2ModifyLaunchTemplateResult
 */
- (AWSTask<AWSEC2ModifyLaunchTemplateResult *> *)modifyLaunchTemplate:(AWSEC2ModifyLaunchTemplateRequest *)request;

/**
 <p>Modifies a launch template. You can specify which version of the launch template to set as the default version. When launching an instance, the default version applies when a launch template version is not specified.</p>
 
 @param request A container for the necessary parameters to execute the ModifyLaunchTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyLaunchTemplateRequest
 @see AWSEC2ModifyLaunchTemplateResult
 */
- (void)modifyLaunchTemplate:(AWSEC2ModifyLaunchTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyLaunchTemplateResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the specified network interface attribute. You can specify only one attribute at a time. You can use this action to attach and detach security groups from an existing EC2 instance.</p>
 
 @param request A container for the necessary parameters to execute the ModifyNetworkInterfaceAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ModifyNetworkInterfaceAttributeRequest
 */
- (AWSTask *)modifyNetworkInterfaceAttribute:(AWSEC2ModifyNetworkInterfaceAttributeRequest *)request;

/**
 <p>Modifies the specified network interface attribute. You can specify only one attribute at a time. You can use this action to attach and detach security groups from an existing EC2 instance.</p>
 
 @param request A container for the necessary parameters to execute the ModifyNetworkInterfaceAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyNetworkInterfaceAttributeRequest
 */
- (void)modifyNetworkInterfaceAttribute:(AWSEC2ModifyNetworkInterfaceAttributeRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the Availability Zone, instance count, instance type, or network platform (EC2-Classic or EC2-VPC) of your Reserved Instances. The Reserved Instances to be modified must be identical, except for Availability Zone, network platform, and instance type.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-modifying.html">Modifying Reserved Instances</a> in the Amazon Elastic Compute Cloud User Guide.</p>
 
 @param request A container for the necessary parameters to execute the ModifyReservedInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyReservedInstancesResult`.
 
 @see AWSEC2ModifyReservedInstancesRequest
 @see AWSEC2ModifyReservedInstancesResult
 */
- (AWSTask<AWSEC2ModifyReservedInstancesResult *> *)modifyReservedInstances:(AWSEC2ModifyReservedInstancesRequest *)request;

/**
 <p>Modifies the Availability Zone, instance count, instance type, or network platform (EC2-Classic or EC2-VPC) of your Reserved Instances. The Reserved Instances to be modified must be identical, except for Availability Zone, network platform, and instance type.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-modifying.html">Modifying Reserved Instances</a> in the Amazon Elastic Compute Cloud User Guide.</p>
 
 @param request A container for the necessary parameters to execute the ModifyReservedInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyReservedInstancesRequest
 @see AWSEC2ModifyReservedInstancesResult
 */
- (void)modifyReservedInstances:(AWSEC2ModifyReservedInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyReservedInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds or removes permission settings for the specified snapshot. You may add or remove specified AWS account IDs from a snapshot's list of create volume permissions, but you cannot do both in a single operation. If you need to both add and remove account IDs for a snapshot, you must use multiple operations. You can make up to 500 modifications to a snapshot in a single operation.</p><p>Encrypted snapshots and snapshots with AWS Marketplace product codes cannot be made public. Snapshots encrypted with your default CMK cannot be shared with other accounts.</p><p>For more information about modifying snapshot permissions, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modifying-snapshot-permissions.html">Sharing Snapshots</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifySnapshotAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ModifySnapshotAttributeRequest
 */
- (AWSTask *)modifySnapshotAttribute:(AWSEC2ModifySnapshotAttributeRequest *)request;

/**
 <p>Adds or removes permission settings for the specified snapshot. You may add or remove specified AWS account IDs from a snapshot's list of create volume permissions, but you cannot do both in a single operation. If you need to both add and remove account IDs for a snapshot, you must use multiple operations. You can make up to 500 modifications to a snapshot in a single operation.</p><p>Encrypted snapshots and snapshots with AWS Marketplace product codes cannot be made public. Snapshots encrypted with your default CMK cannot be shared with other accounts.</p><p>For more information about modifying snapshot permissions, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modifying-snapshot-permissions.html">Sharing Snapshots</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifySnapshotAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifySnapshotAttributeRequest
 */
- (void)modifySnapshotAttribute:(AWSEC2ModifySnapshotAttributeRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the specified Spot Fleet request.</p><p>You can only modify a Spot Fleet request of type <code>maintain</code>.</p><p>While the Spot Fleet request is being modified, it is in the <code>modifying</code> state.</p><p>To scale up your Spot Fleet, increase its target capacity. The Spot Fleet launches the additional Spot Instances according to the allocation strategy for the Spot Fleet request. If the allocation strategy is <code>lowestPrice</code>, the Spot Fleet launches instances using the Spot Instance pool with the lowest price. If the allocation strategy is <code>diversified</code>, the Spot Fleet distributes the instances across the Spot Instance pools. If the allocation strategy is <code>capacityOptimized</code>, Spot Fleet launches instances from Spot Instance pools with optimal capacity for the number of instances that are launching.</p><p>To scale down your Spot Fleet, decrease its target capacity. First, the Spot Fleet cancels any open requests that exceed the new target capacity. You can request that the Spot Fleet terminate Spot Instances until the size of the fleet no longer exceeds the new target capacity. If the allocation strategy is <code>lowestPrice</code>, the Spot Fleet terminates the instances with the highest price per unit. If the allocation strategy is <code>capacityOptimized</code>, the Spot Fleet terminates the instances in the Spot Instance pools that have the least available Spot Instance capacity. If the allocation strategy is <code>diversified</code>, the Spot Fleet terminates instances across the Spot Instance pools. Alternatively, you can request that the Spot Fleet keep the fleet at its current size, but not replace any Spot Instances that are interrupted or that you terminate manually.</p><p>If you are finished with your Spot Fleet for now, but will use it again later, you can set the target capacity to 0.</p>
 
 @param request A container for the necessary parameters to execute the ModifySpotFleetRequest service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifySpotFleetRequestResponse`.
 
 @see AWSEC2ModifySpotFleetRequestRequest
 @see AWSEC2ModifySpotFleetRequestResponse
 */
- (AWSTask<AWSEC2ModifySpotFleetRequestResponse *> *)modifySpotFleetRequest:(AWSEC2ModifySpotFleetRequestRequest *)request;

/**
 <p>Modifies the specified Spot Fleet request.</p><p>You can only modify a Spot Fleet request of type <code>maintain</code>.</p><p>While the Spot Fleet request is being modified, it is in the <code>modifying</code> state.</p><p>To scale up your Spot Fleet, increase its target capacity. The Spot Fleet launches the additional Spot Instances according to the allocation strategy for the Spot Fleet request. If the allocation strategy is <code>lowestPrice</code>, the Spot Fleet launches instances using the Spot Instance pool with the lowest price. If the allocation strategy is <code>diversified</code>, the Spot Fleet distributes the instances across the Spot Instance pools. If the allocation strategy is <code>capacityOptimized</code>, Spot Fleet launches instances from Spot Instance pools with optimal capacity for the number of instances that are launching.</p><p>To scale down your Spot Fleet, decrease its target capacity. First, the Spot Fleet cancels any open requests that exceed the new target capacity. You can request that the Spot Fleet terminate Spot Instances until the size of the fleet no longer exceeds the new target capacity. If the allocation strategy is <code>lowestPrice</code>, the Spot Fleet terminates the instances with the highest price per unit. If the allocation strategy is <code>capacityOptimized</code>, the Spot Fleet terminates the instances in the Spot Instance pools that have the least available Spot Instance capacity. If the allocation strategy is <code>diversified</code>, the Spot Fleet terminates instances across the Spot Instance pools. Alternatively, you can request that the Spot Fleet keep the fleet at its current size, but not replace any Spot Instances that are interrupted or that you terminate manually.</p><p>If you are finished with your Spot Fleet for now, but will use it again later, you can set the target capacity to 0.</p>
 
 @param request A container for the necessary parameters to execute the ModifySpotFleetRequest service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifySpotFleetRequestRequest
 @see AWSEC2ModifySpotFleetRequestResponse
 */
- (void)modifySpotFleetRequest:(AWSEC2ModifySpotFleetRequestRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifySpotFleetRequestResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies a subnet attribute. You can only modify one attribute at a time.</p>
 
 @param request A container for the necessary parameters to execute the ModifySubnetAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ModifySubnetAttributeRequest
 */
- (AWSTask *)modifySubnetAttribute:(AWSEC2ModifySubnetAttributeRequest *)request;

/**
 <p>Modifies a subnet attribute. You can only modify one attribute at a time.</p>
 
 @param request A container for the necessary parameters to execute the ModifySubnetAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifySubnetAttributeRequest
 */
- (void)modifySubnetAttribute:(AWSEC2ModifySubnetAttributeRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Allows or restricts mirroring network services.</p><p> By default, Amazon DNS network services are not eligible for Traffic Mirror. Use <code>AddNetworkServices</code> to add network services to a Traffic Mirror filter. When a network service is added to the Traffic Mirror filter, all traffic related to that network service will be mirrored. When you no longer want to mirror network services, use <code>RemoveNetworkServices</code> to remove the network services from the Traffic Mirror filter. </p><p>For information about filter rule properties, see <a href="https://docs.aws.amazon.com/vpc/latest/mirroring/traffic-mirroring-considerations.html">Network Services</a> in the <i>Traffic Mirroring User Guide </i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyTrafficMirrorFilterNetworkServices service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyTrafficMirrorFilterNetworkServicesResult`.
 
 @see AWSEC2ModifyTrafficMirrorFilterNetworkServicesRequest
 @see AWSEC2ModifyTrafficMirrorFilterNetworkServicesResult
 */
- (AWSTask<AWSEC2ModifyTrafficMirrorFilterNetworkServicesResult *> *)modifyTrafficMirrorFilterNetworkServices:(AWSEC2ModifyTrafficMirrorFilterNetworkServicesRequest *)request;

/**
 <p>Allows or restricts mirroring network services.</p><p> By default, Amazon DNS network services are not eligible for Traffic Mirror. Use <code>AddNetworkServices</code> to add network services to a Traffic Mirror filter. When a network service is added to the Traffic Mirror filter, all traffic related to that network service will be mirrored. When you no longer want to mirror network services, use <code>RemoveNetworkServices</code> to remove the network services from the Traffic Mirror filter. </p><p>For information about filter rule properties, see <a href="https://docs.aws.amazon.com/vpc/latest/mirroring/traffic-mirroring-considerations.html">Network Services</a> in the <i>Traffic Mirroring User Guide </i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyTrafficMirrorFilterNetworkServices service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyTrafficMirrorFilterNetworkServicesRequest
 @see AWSEC2ModifyTrafficMirrorFilterNetworkServicesResult
 */
- (void)modifyTrafficMirrorFilterNetworkServices:(AWSEC2ModifyTrafficMirrorFilterNetworkServicesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyTrafficMirrorFilterNetworkServicesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the specified Traffic Mirror rule.</p><p><code>DestinationCidrBlock</code> and <code>SourceCidrBlock</code> must both be an IPv4 range or an IPv6 range.</p>
 
 @param request A container for the necessary parameters to execute the ModifyTrafficMirrorFilterRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyTrafficMirrorFilterRuleResult`.
 
 @see AWSEC2ModifyTrafficMirrorFilterRuleRequest
 @see AWSEC2ModifyTrafficMirrorFilterRuleResult
 */
- (AWSTask<AWSEC2ModifyTrafficMirrorFilterRuleResult *> *)modifyTrafficMirrorFilterRule:(AWSEC2ModifyTrafficMirrorFilterRuleRequest *)request;

/**
 <p>Modifies the specified Traffic Mirror rule.</p><p><code>DestinationCidrBlock</code> and <code>SourceCidrBlock</code> must both be an IPv4 range or an IPv6 range.</p>
 
 @param request A container for the necessary parameters to execute the ModifyTrafficMirrorFilterRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyTrafficMirrorFilterRuleRequest
 @see AWSEC2ModifyTrafficMirrorFilterRuleResult
 */
- (void)modifyTrafficMirrorFilterRule:(AWSEC2ModifyTrafficMirrorFilterRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyTrafficMirrorFilterRuleResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies a Traffic Mirror session.</p>
 
 @param request A container for the necessary parameters to execute the ModifyTrafficMirrorSession service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyTrafficMirrorSessionResult`.
 
 @see AWSEC2ModifyTrafficMirrorSessionRequest
 @see AWSEC2ModifyTrafficMirrorSessionResult
 */
- (AWSTask<AWSEC2ModifyTrafficMirrorSessionResult *> *)modifyTrafficMirrorSession:(AWSEC2ModifyTrafficMirrorSessionRequest *)request;

/**
 <p>Modifies a Traffic Mirror session.</p>
 
 @param request A container for the necessary parameters to execute the ModifyTrafficMirrorSession service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyTrafficMirrorSessionRequest
 @see AWSEC2ModifyTrafficMirrorSessionResult
 */
- (void)modifyTrafficMirrorSession:(AWSEC2ModifyTrafficMirrorSessionRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyTrafficMirrorSessionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the specified VPC attachment.</p>
 
 @param request A container for the necessary parameters to execute the ModifyTransitGatewayVpcAttachment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyTransitGatewayVpcAttachmentResult`.
 
 @see AWSEC2ModifyTransitGatewayVpcAttachmentRequest
 @see AWSEC2ModifyTransitGatewayVpcAttachmentResult
 */
- (AWSTask<AWSEC2ModifyTransitGatewayVpcAttachmentResult *> *)modifyTransitGatewayVpcAttachment:(AWSEC2ModifyTransitGatewayVpcAttachmentRequest *)request;

/**
 <p>Modifies the specified VPC attachment.</p>
 
 @param request A container for the necessary parameters to execute the ModifyTransitGatewayVpcAttachment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyTransitGatewayVpcAttachmentRequest
 @see AWSEC2ModifyTransitGatewayVpcAttachmentResult
 */
- (void)modifyTransitGatewayVpcAttachment:(AWSEC2ModifyTransitGatewayVpcAttachmentRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyTransitGatewayVpcAttachmentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>You can modify several parameters of an existing EBS volume, including volume size, volume type, and IOPS capacity. If your EBS volume is attached to a current-generation EC2 instance type, you may be able to apply these changes without stopping the instance or detaching the volume from it. For more information about modifying an EBS volume running Linux, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html">Modifying the Size, IOPS, or Type of an EBS Volume on Linux</a>. For more information about modifying an EBS volume running Windows, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ebs-expand-volume.html">Modifying the Size, IOPS, or Type of an EBS Volume on Windows</a>. </p><p> When you complete a resize operation on your volume, you need to extend the volume's file-system size to take advantage of the new storage capacity. For information about extending a Linux file system, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html#recognize-expanded-volume-linux">Extending a Linux File System</a>. For information about extending a Windows file system, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ebs-expand-volume.html#recognize-expanded-volume-windows">Extending a Windows File System</a>. </p><p> You can use CloudWatch Events to check the status of a modification to an EBS volume. For information about CloudWatch Events, see the <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/">Amazon CloudWatch Events User Guide</a>. You can also track the status of a modification using <a>DescribeVolumesModifications</a>. For information about tracking status changes using either method, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html#monitoring_mods">Monitoring Volume Modifications</a>. </p><p>With previous-generation instance types, resizing an EBS volume may require detaching and reattaching the volume or stopping and restarting the instance. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html">Modifying the Size, IOPS, or Type of an EBS Volume on Linux</a> and <a href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ebs-expand-volume.html">Modifying the Size, IOPS, or Type of an EBS Volume on Windows</a>.</p><p>If you reach the maximum volume modification rate per volume limit, you will need to wait at least six hours before applying further modifications to the affected EBS volume.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVolume service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyVolumeResult`.
 
 @see AWSEC2ModifyVolumeRequest
 @see AWSEC2ModifyVolumeResult
 */
- (AWSTask<AWSEC2ModifyVolumeResult *> *)modifyVolume:(AWSEC2ModifyVolumeRequest *)request;

/**
 <p>You can modify several parameters of an existing EBS volume, including volume size, volume type, and IOPS capacity. If your EBS volume is attached to a current-generation EC2 instance type, you may be able to apply these changes without stopping the instance or detaching the volume from it. For more information about modifying an EBS volume running Linux, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html">Modifying the Size, IOPS, or Type of an EBS Volume on Linux</a>. For more information about modifying an EBS volume running Windows, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ebs-expand-volume.html">Modifying the Size, IOPS, or Type of an EBS Volume on Windows</a>. </p><p> When you complete a resize operation on your volume, you need to extend the volume's file-system size to take advantage of the new storage capacity. For information about extending a Linux file system, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html#recognize-expanded-volume-linux">Extending a Linux File System</a>. For information about extending a Windows file system, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ebs-expand-volume.html#recognize-expanded-volume-windows">Extending a Windows File System</a>. </p><p> You can use CloudWatch Events to check the status of a modification to an EBS volume. For information about CloudWatch Events, see the <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/">Amazon CloudWatch Events User Guide</a>. You can also track the status of a modification using <a>DescribeVolumesModifications</a>. For information about tracking status changes using either method, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html#monitoring_mods">Monitoring Volume Modifications</a>. </p><p>With previous-generation instance types, resizing an EBS volume may require detaching and reattaching the volume or stopping and restarting the instance. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html">Modifying the Size, IOPS, or Type of an EBS Volume on Linux</a> and <a href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ebs-expand-volume.html">Modifying the Size, IOPS, or Type of an EBS Volume on Windows</a>.</p><p>If you reach the maximum volume modification rate per volume limit, you will need to wait at least six hours before applying further modifications to the affected EBS volume.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVolume service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyVolumeRequest
 @see AWSEC2ModifyVolumeResult
 */
- (void)modifyVolume:(AWSEC2ModifyVolumeRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyVolumeResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies a volume attribute.</p><p>By default, all I/O operations for the volume are suspended when the data on the volume is determined to be potentially inconsistent, to prevent undetectable, latent data corruption. The I/O access to the volume can be resumed by first enabling I/O access and then checking the data consistency on your volume.</p><p>You can change the default behavior to resume I/O operations. We recommend that you change this only for boot volumes or for volumes that are stateless or disposable.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVolumeAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ModifyVolumeAttributeRequest
 */
- (AWSTask *)modifyVolumeAttribute:(AWSEC2ModifyVolumeAttributeRequest *)request;

/**
 <p>Modifies a volume attribute.</p><p>By default, all I/O operations for the volume are suspended when the data on the volume is determined to be potentially inconsistent, to prevent undetectable, latent data corruption. The I/O access to the volume can be resumed by first enabling I/O access and then checking the data consistency on your volume.</p><p>You can change the default behavior to resume I/O operations. We recommend that you change this only for boot volumes or for volumes that are stateless or disposable.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVolumeAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyVolumeAttributeRequest
 */
- (void)modifyVolumeAttribute:(AWSEC2ModifyVolumeAttributeRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the specified attribute of the specified VPC.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpcAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ModifyVpcAttributeRequest
 */
- (AWSTask *)modifyVpcAttribute:(AWSEC2ModifyVpcAttributeRequest *)request;

/**
 <p>Modifies the specified attribute of the specified VPC.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpcAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyVpcAttributeRequest
 */
- (void)modifyVpcAttribute:(AWSEC2ModifyVpcAttributeRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Modifies attributes of a specified VPC endpoint. The attributes that you can modify depend on the type of VPC endpoint (interface or gateway). For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/vpc-endpoints.html">VPC Endpoints</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpcEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyVpcEndpointResult`.
 
 @see AWSEC2ModifyVpcEndpointRequest
 @see AWSEC2ModifyVpcEndpointResult
 */
- (AWSTask<AWSEC2ModifyVpcEndpointResult *> *)modifyVpcEndpoint:(AWSEC2ModifyVpcEndpointRequest *)request;

/**
 <p>Modifies attributes of a specified VPC endpoint. The attributes that you can modify depend on the type of VPC endpoint (interface or gateway). For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/vpc-endpoints.html">VPC Endpoints</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpcEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyVpcEndpointRequest
 @see AWSEC2ModifyVpcEndpointResult
 */
- (void)modifyVpcEndpoint:(AWSEC2ModifyVpcEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyVpcEndpointResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies a connection notification for VPC endpoint or VPC endpoint service. You can change the SNS topic for the notification, or the events for which to be notified. </p>
 
 @param request A container for the necessary parameters to execute the ModifyVpcEndpointConnectionNotification service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyVpcEndpointConnectionNotificationResult`.
 
 @see AWSEC2ModifyVpcEndpointConnectionNotificationRequest
 @see AWSEC2ModifyVpcEndpointConnectionNotificationResult
 */
- (AWSTask<AWSEC2ModifyVpcEndpointConnectionNotificationResult *> *)modifyVpcEndpointConnectionNotification:(AWSEC2ModifyVpcEndpointConnectionNotificationRequest *)request;

/**
 <p>Modifies a connection notification for VPC endpoint or VPC endpoint service. You can change the SNS topic for the notification, or the events for which to be notified. </p>
 
 @param request A container for the necessary parameters to execute the ModifyVpcEndpointConnectionNotification service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyVpcEndpointConnectionNotificationRequest
 @see AWSEC2ModifyVpcEndpointConnectionNotificationResult
 */
- (void)modifyVpcEndpointConnectionNotification:(AWSEC2ModifyVpcEndpointConnectionNotificationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyVpcEndpointConnectionNotificationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the attributes of your VPC endpoint service configuration. You can change the Network Load Balancers for your service, and you can specify whether acceptance is required for requests to connect to your endpoint service through an interface VPC endpoint.</p><p>If you set or modify the private DNS name, you must prove that you own the private DNS domain name. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-services-dns-validation.html">VPC Endpoint Service Private DNS Name Verification</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpcEndpointServiceConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyVpcEndpointServiceConfigurationResult`.
 
 @see AWSEC2ModifyVpcEndpointServiceConfigurationRequest
 @see AWSEC2ModifyVpcEndpointServiceConfigurationResult
 */
- (AWSTask<AWSEC2ModifyVpcEndpointServiceConfigurationResult *> *)modifyVpcEndpointServiceConfiguration:(AWSEC2ModifyVpcEndpointServiceConfigurationRequest *)request;

/**
 <p>Modifies the attributes of your VPC endpoint service configuration. You can change the Network Load Balancers for your service, and you can specify whether acceptance is required for requests to connect to your endpoint service through an interface VPC endpoint.</p><p>If you set or modify the private DNS name, you must prove that you own the private DNS domain name. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-services-dns-validation.html">VPC Endpoint Service Private DNS Name Verification</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpcEndpointServiceConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyVpcEndpointServiceConfigurationRequest
 @see AWSEC2ModifyVpcEndpointServiceConfigurationResult
 */
- (void)modifyVpcEndpointServiceConfiguration:(AWSEC2ModifyVpcEndpointServiceConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyVpcEndpointServiceConfigurationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the permissions for your <a href="https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-service.html">VPC endpoint service</a>. You can add or remove permissions for service consumers (IAM users, IAM roles, and AWS accounts) to connect to your endpoint service.</p><p>If you grant permissions to all principals, the service is public. Any users who know the name of a public service can send a request to attach an endpoint. If the service does not require manual approval, attachments are automatically approved.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpcEndpointServicePermissions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyVpcEndpointServicePermissionsResult`.
 
 @see AWSEC2ModifyVpcEndpointServicePermissionsRequest
 @see AWSEC2ModifyVpcEndpointServicePermissionsResult
 */
- (AWSTask<AWSEC2ModifyVpcEndpointServicePermissionsResult *> *)modifyVpcEndpointServicePermissions:(AWSEC2ModifyVpcEndpointServicePermissionsRequest *)request;

/**
 <p>Modifies the permissions for your <a href="https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-service.html">VPC endpoint service</a>. You can add or remove permissions for service consumers (IAM users, IAM roles, and AWS accounts) to connect to your endpoint service.</p><p>If you grant permissions to all principals, the service is public. Any users who know the name of a public service can send a request to attach an endpoint. If the service does not require manual approval, attachments are automatically approved.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpcEndpointServicePermissions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyVpcEndpointServicePermissionsRequest
 @see AWSEC2ModifyVpcEndpointServicePermissionsResult
 */
- (void)modifyVpcEndpointServicePermissions:(AWSEC2ModifyVpcEndpointServicePermissionsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyVpcEndpointServicePermissionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the VPC peering connection options on one side of a VPC peering connection. You can do the following:</p><ul><li><p>Enable/disable communication over the peering connection between an EC2-Classic instance that's linked to your VPC (using ClassicLink) and instances in the peer VPC.</p></li><li><p>Enable/disable communication over the peering connection between instances in your VPC and an EC2-Classic instance that's linked to the peer VPC.</p></li><li><p>Enable/disable the ability to resolve public DNS hostnames to private IP addresses when queried from instances in the peer VPC.</p></li></ul><p>If the peered VPCs are in the same AWS account, you can enable DNS resolution for queries from the local VPC. This ensures that queries from the local VPC resolve to private IP addresses in the peer VPC. This option is not available if the peered VPCs are in different AWS accounts or different Regions. For peered VPCs in different AWS accounts, each AWS account owner must initiate a separate request to modify the peering connection options. For inter-region peering connections, you must use the Region for the requester VPC to modify the requester VPC peering options and the Region for the accepter VPC to modify the accepter VPC peering options. To verify which VPCs are the accepter and the requester for a VPC peering connection, use the <a>DescribeVpcPeeringConnections</a> command.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpcPeeringConnectionOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyVpcPeeringConnectionOptionsResult`.
 
 @see AWSEC2ModifyVpcPeeringConnectionOptionsRequest
 @see AWSEC2ModifyVpcPeeringConnectionOptionsResult
 */
- (AWSTask<AWSEC2ModifyVpcPeeringConnectionOptionsResult *> *)modifyVpcPeeringConnectionOptions:(AWSEC2ModifyVpcPeeringConnectionOptionsRequest *)request;

/**
 <p>Modifies the VPC peering connection options on one side of a VPC peering connection. You can do the following:</p><ul><li><p>Enable/disable communication over the peering connection between an EC2-Classic instance that's linked to your VPC (using ClassicLink) and instances in the peer VPC.</p></li><li><p>Enable/disable communication over the peering connection between instances in your VPC and an EC2-Classic instance that's linked to the peer VPC.</p></li><li><p>Enable/disable the ability to resolve public DNS hostnames to private IP addresses when queried from instances in the peer VPC.</p></li></ul><p>If the peered VPCs are in the same AWS account, you can enable DNS resolution for queries from the local VPC. This ensures that queries from the local VPC resolve to private IP addresses in the peer VPC. This option is not available if the peered VPCs are in different AWS accounts or different Regions. For peered VPCs in different AWS accounts, each AWS account owner must initiate a separate request to modify the peering connection options. For inter-region peering connections, you must use the Region for the requester VPC to modify the requester VPC peering options and the Region for the accepter VPC to modify the accepter VPC peering options. To verify which VPCs are the accepter and the requester for a VPC peering connection, use the <a>DescribeVpcPeeringConnections</a> command.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpcPeeringConnectionOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyVpcPeeringConnectionOptionsRequest
 @see AWSEC2ModifyVpcPeeringConnectionOptionsResult
 */
- (void)modifyVpcPeeringConnectionOptions:(AWSEC2ModifyVpcPeeringConnectionOptionsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyVpcPeeringConnectionOptionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the instance tenancy attribute of the specified VPC. You can change the instance tenancy attribute of a VPC to <code>default</code> only. You cannot change the instance tenancy attribute to <code>dedicated</code>.</p><p>After you modify the tenancy of the VPC, any new instances that you launch into the VPC have a tenancy of <code>default</code>, unless you specify otherwise during launch. The tenancy of any existing instances in the VPC is not affected.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-instance.html">Dedicated Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpcTenancy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyVpcTenancyResult`.
 
 @see AWSEC2ModifyVpcTenancyRequest
 @see AWSEC2ModifyVpcTenancyResult
 */
- (AWSTask<AWSEC2ModifyVpcTenancyResult *> *)modifyVpcTenancy:(AWSEC2ModifyVpcTenancyRequest *)request;

/**
 <p>Modifies the instance tenancy attribute of the specified VPC. You can change the instance tenancy attribute of a VPC to <code>default</code> only. You cannot change the instance tenancy attribute to <code>dedicated</code>.</p><p>After you modify the tenancy of the VPC, any new instances that you launch into the VPC have a tenancy of <code>default</code>, unless you specify otherwise during launch. The tenancy of any existing instances in the VPC is not affected.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-instance.html">Dedicated Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpcTenancy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyVpcTenancyRequest
 @see AWSEC2ModifyVpcTenancyResult
 */
- (void)modifyVpcTenancy:(AWSEC2ModifyVpcTenancyRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyVpcTenancyResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the target gateway of an AWS Site-to-Site VPN connection. The following migration options are available:</p><ul><li><p>An existing virtual private gateway to a new virtual private gateway</p></li><li><p>An existing virtual private gateway to a transit gateway</p></li><li><p>An existing transit gateway to a new transit gateway</p></li><li><p>An existing transit gateway to a virtual private gateway</p></li></ul><p>Before you perform the migration to the new gateway, you must configure the new gateway. Use <a>CreateVpnGateway</a> to create a virtual private gateway, or <a>CreateTransitGateway</a> to create a transit gateway.</p><p>This step is required when you migrate from a virtual private gateway with static routes to a transit gateway. </p><p>You must delete the static routes before you migrate to the new gateway.</p><p>Keep a copy of the static route before you delete it. You will need to add back these routes to the transit gateway after the VPN connection migration is complete.</p><p>After you migrate to the new gateway, you might need to modify your VPC route table. Use <a>CreateRoute</a> and <a>DeleteRoute</a> to make the changes described in <a href="https://docs.aws.amazon.com/vpn/latest/s2svpn/modify-vpn-target.html#step-update-routing">VPN Gateway Target Modification Required VPC Route Table Updates</a> in the <i>AWS Site-to-Site VPN User Guide</i>.</p><p> When the new gateway is a transit gateway, modify the transit gateway route table to allow traffic between the VPC and the AWS Site-to-Site VPN connection. Use <a>CreateTransitGatewayRoute</a> to add the routes.</p><p> If you deleted VPN static routes, you must add the static routes to the transit gateway route table.</p><p>After you perform this operation, the AWS VPN endpoint's IP addresses on the AWS side and the tunnel options remain intact. Your AWS Site-to-Site VPN connection will be temporarily unavailable for a brief period while we provision the new endpoints.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpnConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyVpnConnectionResult`.
 
 @see AWSEC2ModifyVpnConnectionRequest
 @see AWSEC2ModifyVpnConnectionResult
 */
- (AWSTask<AWSEC2ModifyVpnConnectionResult *> *)modifyVpnConnection:(AWSEC2ModifyVpnConnectionRequest *)request;

/**
 <p>Modifies the target gateway of an AWS Site-to-Site VPN connection. The following migration options are available:</p><ul><li><p>An existing virtual private gateway to a new virtual private gateway</p></li><li><p>An existing virtual private gateway to a transit gateway</p></li><li><p>An existing transit gateway to a new transit gateway</p></li><li><p>An existing transit gateway to a virtual private gateway</p></li></ul><p>Before you perform the migration to the new gateway, you must configure the new gateway. Use <a>CreateVpnGateway</a> to create a virtual private gateway, or <a>CreateTransitGateway</a> to create a transit gateway.</p><p>This step is required when you migrate from a virtual private gateway with static routes to a transit gateway. </p><p>You must delete the static routes before you migrate to the new gateway.</p><p>Keep a copy of the static route before you delete it. You will need to add back these routes to the transit gateway after the VPN connection migration is complete.</p><p>After you migrate to the new gateway, you might need to modify your VPC route table. Use <a>CreateRoute</a> and <a>DeleteRoute</a> to make the changes described in <a href="https://docs.aws.amazon.com/vpn/latest/s2svpn/modify-vpn-target.html#step-update-routing">VPN Gateway Target Modification Required VPC Route Table Updates</a> in the <i>AWS Site-to-Site VPN User Guide</i>.</p><p> When the new gateway is a transit gateway, modify the transit gateway route table to allow traffic between the VPC and the AWS Site-to-Site VPN connection. Use <a>CreateTransitGatewayRoute</a> to add the routes.</p><p> If you deleted VPN static routes, you must add the static routes to the transit gateway route table.</p><p>After you perform this operation, the AWS VPN endpoint's IP addresses on the AWS side and the tunnel options remain intact. Your AWS Site-to-Site VPN connection will be temporarily unavailable for a brief period while we provision the new endpoints.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpnConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyVpnConnectionRequest
 @see AWSEC2ModifyVpnConnectionResult
 */
- (void)modifyVpnConnection:(AWSEC2ModifyVpnConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyVpnConnectionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the VPN tunnel endpoint certificate.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpnTunnelCertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyVpnTunnelCertificateResult`.
 
 @see AWSEC2ModifyVpnTunnelCertificateRequest
 @see AWSEC2ModifyVpnTunnelCertificateResult
 */
- (AWSTask<AWSEC2ModifyVpnTunnelCertificateResult *> *)modifyVpnTunnelCertificate:(AWSEC2ModifyVpnTunnelCertificateRequest *)request;

/**
 <p>Modifies the VPN tunnel endpoint certificate.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpnTunnelCertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyVpnTunnelCertificateRequest
 @see AWSEC2ModifyVpnTunnelCertificateResult
 */
- (void)modifyVpnTunnelCertificate:(AWSEC2ModifyVpnTunnelCertificateRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyVpnTunnelCertificateResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the options for a VPN tunnel in an AWS Site-to-Site VPN connection. You can modify multiple options for a tunnel in a single request, but you can only modify one tunnel at a time. For more information, see <a href="https://docs.aws.amazon.com/vpn/latest/s2svpn/VPNTunnels.html">Site-to-Site VPN Tunnel Options for Your Site-to-Site VPN Connection</a> in the <i>AWS Site-to-Site VPN User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpnTunnelOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyVpnTunnelOptionsResult`.
 
 @see AWSEC2ModifyVpnTunnelOptionsRequest
 @see AWSEC2ModifyVpnTunnelOptionsResult
 */
- (AWSTask<AWSEC2ModifyVpnTunnelOptionsResult *> *)modifyVpnTunnelOptions:(AWSEC2ModifyVpnTunnelOptionsRequest *)request;

/**
 <p>Modifies the options for a VPN tunnel in an AWS Site-to-Site VPN connection. You can modify multiple options for a tunnel in a single request, but you can only modify one tunnel at a time. For more information, see <a href="https://docs.aws.amazon.com/vpn/latest/s2svpn/VPNTunnels.html">Site-to-Site VPN Tunnel Options for Your Site-to-Site VPN Connection</a> in the <i>AWS Site-to-Site VPN User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpnTunnelOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyVpnTunnelOptionsRequest
 @see AWSEC2ModifyVpnTunnelOptionsResult
 */
- (void)modifyVpnTunnelOptions:(AWSEC2ModifyVpnTunnelOptionsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyVpnTunnelOptionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables detailed monitoring for a running instance. Otherwise, basic monitoring is enabled. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-cloudwatch.html">Monitoring Your Instances and Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>To disable detailed monitoring, see .</p>
 
 @param request A container for the necessary parameters to execute the MonitorInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2MonitorInstancesResult`.
 
 @see AWSEC2MonitorInstancesRequest
 @see AWSEC2MonitorInstancesResult
 */
- (AWSTask<AWSEC2MonitorInstancesResult *> *)monitorInstances:(AWSEC2MonitorInstancesRequest *)request;

/**
 <p>Enables detailed monitoring for a running instance. Otherwise, basic monitoring is enabled. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-cloudwatch.html">Monitoring Your Instances and Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>To disable detailed monitoring, see .</p>
 
 @param request A container for the necessary parameters to execute the MonitorInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2MonitorInstancesRequest
 @see AWSEC2MonitorInstancesResult
 */
- (void)monitorInstances:(AWSEC2MonitorInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2MonitorInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Moves an Elastic IP address from the EC2-Classic platform to the EC2-VPC platform. The Elastic IP address must be allocated to your account for more than 24 hours, and it must not be associated with an instance. After the Elastic IP address is moved, it is no longer available for use in the EC2-Classic platform, unless you move it back using the <a>RestoreAddressToClassic</a> request. You cannot move an Elastic IP address that was originally allocated for use in the EC2-VPC platform to the EC2-Classic platform. </p>
 
 @param request A container for the necessary parameters to execute the MoveAddressToVpc service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2MoveAddressToVpcResult`.
 
 @see AWSEC2MoveAddressToVpcRequest
 @see AWSEC2MoveAddressToVpcResult
 */
- (AWSTask<AWSEC2MoveAddressToVpcResult *> *)moveAddressToVpc:(AWSEC2MoveAddressToVpcRequest *)request;

/**
 <p>Moves an Elastic IP address from the EC2-Classic platform to the EC2-VPC platform. The Elastic IP address must be allocated to your account for more than 24 hours, and it must not be associated with an instance. After the Elastic IP address is moved, it is no longer available for use in the EC2-Classic platform, unless you move it back using the <a>RestoreAddressToClassic</a> request. You cannot move an Elastic IP address that was originally allocated for use in the EC2-VPC platform to the EC2-Classic platform. </p>
 
 @param request A container for the necessary parameters to execute the MoveAddressToVpc service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2MoveAddressToVpcRequest
 @see AWSEC2MoveAddressToVpcResult
 */
- (void)moveAddressToVpc:(AWSEC2MoveAddressToVpcRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2MoveAddressToVpcResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provisions an IPv4 or IPv6 address range for use with your AWS resources through bring your own IP addresses (BYOIP) and creates a corresponding address pool. After the address range is provisioned, it is ready to be advertised using <a>AdvertiseByoipCidr</a>.</p><p>AWS verifies that you own the address range and are authorized to advertise it. You must ensure that the address range is registered to you and that you created an RPKI ROA to authorize Amazon ASNs 16509 and 14618 to advertise the address range. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html">Bring Your Own IP Addresses (BYOIP)</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>Provisioning an address range is an asynchronous operation, so the call returns immediately, but the address range is not ready to use until its status changes from <code>pending-provision</code> to <code>provisioned</code>. To monitor the status of an address range, use <a>DescribeByoipCidrs</a>. To allocate an Elastic IP address from your IPv4 address pool, use <a>AllocateAddress</a> with either the specific address from the address pool or the ID of the address pool.</p>
 
 @param request A container for the necessary parameters to execute the ProvisionByoipCidr service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ProvisionByoipCidrResult`.
 
 @see AWSEC2ProvisionByoipCidrRequest
 @see AWSEC2ProvisionByoipCidrResult
 */
- (AWSTask<AWSEC2ProvisionByoipCidrResult *> *)provisionByoipCidr:(AWSEC2ProvisionByoipCidrRequest *)request;

/**
 <p>Provisions an IPv4 or IPv6 address range for use with your AWS resources through bring your own IP addresses (BYOIP) and creates a corresponding address pool. After the address range is provisioned, it is ready to be advertised using <a>AdvertiseByoipCidr</a>.</p><p>AWS verifies that you own the address range and are authorized to advertise it. You must ensure that the address range is registered to you and that you created an RPKI ROA to authorize Amazon ASNs 16509 and 14618 to advertise the address range. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html">Bring Your Own IP Addresses (BYOIP)</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>Provisioning an address range is an asynchronous operation, so the call returns immediately, but the address range is not ready to use until its status changes from <code>pending-provision</code> to <code>provisioned</code>. To monitor the status of an address range, use <a>DescribeByoipCidrs</a>. To allocate an Elastic IP address from your IPv4 address pool, use <a>AllocateAddress</a> with either the specific address from the address pool or the ID of the address pool.</p>
 
 @param request A container for the necessary parameters to execute the ProvisionByoipCidr service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ProvisionByoipCidrRequest
 @see AWSEC2ProvisionByoipCidrResult
 */
- (void)provisionByoipCidr:(AWSEC2ProvisionByoipCidrRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ProvisionByoipCidrResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Purchase a reservation with configurations that match those of your Dedicated Host. You must have active Dedicated Hosts in your account before you purchase a reservation. This action results in the specified reservation being purchased and charged to your account.</p>
 
 @param request A container for the necessary parameters to execute the PurchaseHostReservation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2PurchaseHostReservationResult`.
 
 @see AWSEC2PurchaseHostReservationRequest
 @see AWSEC2PurchaseHostReservationResult
 */
- (AWSTask<AWSEC2PurchaseHostReservationResult *> *)purchaseHostReservation:(AWSEC2PurchaseHostReservationRequest *)request;

/**
 <p>Purchase a reservation with configurations that match those of your Dedicated Host. You must have active Dedicated Hosts in your account before you purchase a reservation. This action results in the specified reservation being purchased and charged to your account.</p>
 
 @param request A container for the necessary parameters to execute the PurchaseHostReservation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2PurchaseHostReservationRequest
 @see AWSEC2PurchaseHostReservationResult
 */
- (void)purchaseHostReservation:(AWSEC2PurchaseHostReservationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2PurchaseHostReservationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Purchases a Reserved Instance for use with your account. With Reserved Instances, you pay a lower hourly rate compared to On-Demand instance pricing.</p><p>Use <a>DescribeReservedInstancesOfferings</a> to get a list of Reserved Instance offerings that match your specifications. After you've purchased a Reserved Instance, you can check for your new Reserved Instance with <a>DescribeReservedInstances</a>.</p><p>To queue a purchase for a future date and time, specify a purchase time. If you do not specify a purchase time, the default is the current time.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts-on-demand-reserved-instances.html">Reserved Instances</a> and <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PurchaseReservedInstancesOffering service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2PurchaseReservedInstancesOfferingResult`.
 
 @see AWSEC2PurchaseReservedInstancesOfferingRequest
 @see AWSEC2PurchaseReservedInstancesOfferingResult
 */
- (AWSTask<AWSEC2PurchaseReservedInstancesOfferingResult *> *)purchaseReservedInstancesOffering:(AWSEC2PurchaseReservedInstancesOfferingRequest *)request;

/**
 <p>Purchases a Reserved Instance for use with your account. With Reserved Instances, you pay a lower hourly rate compared to On-Demand instance pricing.</p><p>Use <a>DescribeReservedInstancesOfferings</a> to get a list of Reserved Instance offerings that match your specifications. After you've purchased a Reserved Instance, you can check for your new Reserved Instance with <a>DescribeReservedInstances</a>.</p><p>To queue a purchase for a future date and time, specify a purchase time. If you do not specify a purchase time, the default is the current time.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts-on-demand-reserved-instances.html">Reserved Instances</a> and <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PurchaseReservedInstancesOffering service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2PurchaseReservedInstancesOfferingRequest
 @see AWSEC2PurchaseReservedInstancesOfferingResult
 */
- (void)purchaseReservedInstancesOffering:(AWSEC2PurchaseReservedInstancesOfferingRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2PurchaseReservedInstancesOfferingResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Purchases the Scheduled Instances with the specified schedule.</p><p>Scheduled Instances enable you to purchase Amazon EC2 compute capacity by the hour for a one-year term. Before you can purchase a Scheduled Instance, you must call <a>DescribeScheduledInstanceAvailability</a> to check for available schedules and obtain a purchase token. After you purchase a Scheduled Instance, you must call <a>RunScheduledInstances</a> during each scheduled time period.</p><p>After you purchase a Scheduled Instance, you can't cancel, modify, or resell your purchase.</p>
 
 @param request A container for the necessary parameters to execute the PurchaseScheduledInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2PurchaseScheduledInstancesResult`.
 
 @see AWSEC2PurchaseScheduledInstancesRequest
 @see AWSEC2PurchaseScheduledInstancesResult
 */
- (AWSTask<AWSEC2PurchaseScheduledInstancesResult *> *)purchaseScheduledInstances:(AWSEC2PurchaseScheduledInstancesRequest *)request;

/**
 <p>Purchases the Scheduled Instances with the specified schedule.</p><p>Scheduled Instances enable you to purchase Amazon EC2 compute capacity by the hour for a one-year term. Before you can purchase a Scheduled Instance, you must call <a>DescribeScheduledInstanceAvailability</a> to check for available schedules and obtain a purchase token. After you purchase a Scheduled Instance, you must call <a>RunScheduledInstances</a> during each scheduled time period.</p><p>After you purchase a Scheduled Instance, you can't cancel, modify, or resell your purchase.</p>
 
 @param request A container for the necessary parameters to execute the PurchaseScheduledInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2PurchaseScheduledInstancesRequest
 @see AWSEC2PurchaseScheduledInstancesResult
 */
- (void)purchaseScheduledInstances:(AWSEC2PurchaseScheduledInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2PurchaseScheduledInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Requests a reboot of the specified instances. This operation is asynchronous; it only queues a request to reboot the specified instances. The operation succeeds if the instances are valid and belong to you. Requests to reboot terminated instances are ignored.</p><p>If an instance does not cleanly shut down within four minutes, Amazon EC2 performs a hard reboot.</p><p>For more information about troubleshooting, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-console.html">Getting Console Output and Rebooting Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RebootInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2RebootInstancesRequest
 */
- (AWSTask *)rebootInstances:(AWSEC2RebootInstancesRequest *)request;

/**
 <p>Requests a reboot of the specified instances. This operation is asynchronous; it only queues a request to reboot the specified instances. The operation succeeds if the instances are valid and belong to you. Requests to reboot terminated instances are ignored.</p><p>If an instance does not cleanly shut down within four minutes, Amazon EC2 performs a hard reboot.</p><p>For more information about troubleshooting, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-console.html">Getting Console Output and Rebooting Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RebootInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2RebootInstancesRequest
 */
- (void)rebootInstances:(AWSEC2RebootInstancesRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Registers an AMI. When you're creating an AMI, this is the final step you must complete before you can launch an instance from the AMI. For more information about creating AMIs, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami.html">Creating Your Own AMIs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><note><p>For Amazon EBS-backed instances, <a>CreateImage</a> creates and registers the AMI in a single request, so you don't have to register the AMI yourself.</p></note><p>You can also use <code>RegisterImage</code> to create an Amazon EBS-backed Linux AMI from a snapshot of a root device volume. You specify the snapshot using the block device mapping. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-launch-snapshot.html">Launching a Linux Instance from a Backup</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>You can't register an image where a secondary (non-root) snapshot has AWS Marketplace product codes.</p><p>Windows and some Linux distributions, such as Red Hat Enterprise Linux (RHEL) and SUSE Linux Enterprise Server (SLES), use the EC2 billing product code associated with an AMI to verify the subscription status for package updates. To create a new AMI for operating systems that require a billing product code, instead of registering the AMI, do the following to preserve the billing product code association:</p><ol><li><p>Launch an instance from an existing AMI with that billing product code.</p></li><li><p>Customize the instance.</p></li><li><p>Create an AMI from the instance using <a>CreateImage</a>.</p></li></ol><p>If you purchase a Reserved Instance to apply to an On-Demand Instance that was launched from an AMI with a billing product code, make sure that the Reserved Instance has the matching billing product code. If you purchase a Reserved Instance without the matching billing product code, the Reserved Instance will not be applied to the On-Demand Instance. For information about how to obtain the platform details and billing information of an AMI, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ami-billing-info.html">Obtaining Billing Information</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>If needed, you can deregister an AMI at any time. Any modifications you make to an AMI backed by an instance store volume invalidates its registration. If you make changes to an image, deregister the previous image and register the new image.</p>
 
 @param request A container for the necessary parameters to execute the RegisterImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2RegisterImageResult`.
 
 @see AWSEC2RegisterImageRequest
 @see AWSEC2RegisterImageResult
 */
- (AWSTask<AWSEC2RegisterImageResult *> *)registerImage:(AWSEC2RegisterImageRequest *)request;

/**
 <p>Registers an AMI. When you're creating an AMI, this is the final step you must complete before you can launch an instance from the AMI. For more information about creating AMIs, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami.html">Creating Your Own AMIs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><note><p>For Amazon EBS-backed instances, <a>CreateImage</a> creates and registers the AMI in a single request, so you don't have to register the AMI yourself.</p></note><p>You can also use <code>RegisterImage</code> to create an Amazon EBS-backed Linux AMI from a snapshot of a root device volume. You specify the snapshot using the block device mapping. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-launch-snapshot.html">Launching a Linux Instance from a Backup</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>You can't register an image where a secondary (non-root) snapshot has AWS Marketplace product codes.</p><p>Windows and some Linux distributions, such as Red Hat Enterprise Linux (RHEL) and SUSE Linux Enterprise Server (SLES), use the EC2 billing product code associated with an AMI to verify the subscription status for package updates. To create a new AMI for operating systems that require a billing product code, instead of registering the AMI, do the following to preserve the billing product code association:</p><ol><li><p>Launch an instance from an existing AMI with that billing product code.</p></li><li><p>Customize the instance.</p></li><li><p>Create an AMI from the instance using <a>CreateImage</a>.</p></li></ol><p>If you purchase a Reserved Instance to apply to an On-Demand Instance that was launched from an AMI with a billing product code, make sure that the Reserved Instance has the matching billing product code. If you purchase a Reserved Instance without the matching billing product code, the Reserved Instance will not be applied to the On-Demand Instance. For information about how to obtain the platform details and billing information of an AMI, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ami-billing-info.html">Obtaining Billing Information</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>If needed, you can deregister an AMI at any time. Any modifications you make to an AMI backed by an instance store volume invalidates its registration. If you make changes to an image, deregister the previous image and register the new image.</p>
 
 @param request A container for the necessary parameters to execute the RegisterImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2RegisterImageRequest
 @see AWSEC2RegisterImageResult
 */
- (void)registerImage:(AWSEC2RegisterImageRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2RegisterImageResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers members (network interfaces) with the transit gateway multicast group. A member is a network interface associated with a supported EC2 instance that receives multicast traffic. For information about supported instances, see <a href="https://docs.aws.amazon.com/vpc/latest/tgw/transit-gateway-limits.html#multicast-limits">Multicast Consideration</a> in <i>Amazon VPC Transit Gateways</i>.</p><p>After you add the members, use <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_SearchTransitGatewayMulticastGroups.html">SearchTransitGatewayMulticastGroups</a> to verify that the members were added to the transit gateway multicast group.</p>
 
 @param request A container for the necessary parameters to execute the RegisterTransitGatewayMulticastGroupMembers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2RegisterTransitGatewayMulticastGroupMembersResult`.
 
 @see AWSEC2RegisterTransitGatewayMulticastGroupMembersRequest
 @see AWSEC2RegisterTransitGatewayMulticastGroupMembersResult
 */
- (AWSTask<AWSEC2RegisterTransitGatewayMulticastGroupMembersResult *> *)registerTransitGatewayMulticastGroupMembers:(AWSEC2RegisterTransitGatewayMulticastGroupMembersRequest *)request;

/**
 <p>Registers members (network interfaces) with the transit gateway multicast group. A member is a network interface associated with a supported EC2 instance that receives multicast traffic. For information about supported instances, see <a href="https://docs.aws.amazon.com/vpc/latest/tgw/transit-gateway-limits.html#multicast-limits">Multicast Consideration</a> in <i>Amazon VPC Transit Gateways</i>.</p><p>After you add the members, use <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_SearchTransitGatewayMulticastGroups.html">SearchTransitGatewayMulticastGroups</a> to verify that the members were added to the transit gateway multicast group.</p>
 
 @param request A container for the necessary parameters to execute the RegisterTransitGatewayMulticastGroupMembers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2RegisterTransitGatewayMulticastGroupMembersRequest
 @see AWSEC2RegisterTransitGatewayMulticastGroupMembersResult
 */
- (void)registerTransitGatewayMulticastGroupMembers:(AWSEC2RegisterTransitGatewayMulticastGroupMembersRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2RegisterTransitGatewayMulticastGroupMembersResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers sources (network interfaces) with the specified transit gateway multicast group.</p><p>A multicast source is a network interface attached to a supported instance that sends multicast traffic. For information about supported instances, see <a href="https://docs.aws.amazon.com/vpc/latest/tgw/transit-gateway-limits.html#multicast-limits">Multicast Considerations</a> in <i>Amazon VPC Transit Gateways</i>.</p><p>After you add the source, use <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_SearchTransitGatewayMulticastGroups.html">SearchTransitGatewayMulticastGroups</a> to verify that the source was added to the multicast group.</p>
 
 @param request A container for the necessary parameters to execute the RegisterTransitGatewayMulticastGroupSources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2RegisterTransitGatewayMulticastGroupSourcesResult`.
 
 @see AWSEC2RegisterTransitGatewayMulticastGroupSourcesRequest
 @see AWSEC2RegisterTransitGatewayMulticastGroupSourcesResult
 */
- (AWSTask<AWSEC2RegisterTransitGatewayMulticastGroupSourcesResult *> *)registerTransitGatewayMulticastGroupSources:(AWSEC2RegisterTransitGatewayMulticastGroupSourcesRequest *)request;

/**
 <p>Registers sources (network interfaces) with the specified transit gateway multicast group.</p><p>A multicast source is a network interface attached to a supported instance that sends multicast traffic. For information about supported instances, see <a href="https://docs.aws.amazon.com/vpc/latest/tgw/transit-gateway-limits.html#multicast-limits">Multicast Considerations</a> in <i>Amazon VPC Transit Gateways</i>.</p><p>After you add the source, use <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_SearchTransitGatewayMulticastGroups.html">SearchTransitGatewayMulticastGroups</a> to verify that the source was added to the multicast group.</p>
 
 @param request A container for the necessary parameters to execute the RegisterTransitGatewayMulticastGroupSources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2RegisterTransitGatewayMulticastGroupSourcesRequest
 @see AWSEC2RegisterTransitGatewayMulticastGroupSourcesResult
 */
- (void)registerTransitGatewayMulticastGroupSources:(AWSEC2RegisterTransitGatewayMulticastGroupSourcesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2RegisterTransitGatewayMulticastGroupSourcesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Rejects a transit gateway peering attachment request.</p>
 
 @param request A container for the necessary parameters to execute the RejectTransitGatewayPeeringAttachment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2RejectTransitGatewayPeeringAttachmentResult`.
 
 @see AWSEC2RejectTransitGatewayPeeringAttachmentRequest
 @see AWSEC2RejectTransitGatewayPeeringAttachmentResult
 */
- (AWSTask<AWSEC2RejectTransitGatewayPeeringAttachmentResult *> *)rejectTransitGatewayPeeringAttachment:(AWSEC2RejectTransitGatewayPeeringAttachmentRequest *)request;

/**
 <p>Rejects a transit gateway peering attachment request.</p>
 
 @param request A container for the necessary parameters to execute the RejectTransitGatewayPeeringAttachment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2RejectTransitGatewayPeeringAttachmentRequest
 @see AWSEC2RejectTransitGatewayPeeringAttachmentResult
 */
- (void)rejectTransitGatewayPeeringAttachment:(AWSEC2RejectTransitGatewayPeeringAttachmentRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2RejectTransitGatewayPeeringAttachmentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Rejects a request to attach a VPC to a transit gateway.</p><p>The VPC attachment must be in the <code>pendingAcceptance</code> state. Use <a>DescribeTransitGatewayVpcAttachments</a> to view your pending VPC attachment requests. Use <a>AcceptTransitGatewayVpcAttachment</a> to accept a VPC attachment request.</p>
 
 @param request A container for the necessary parameters to execute the RejectTransitGatewayVpcAttachment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2RejectTransitGatewayVpcAttachmentResult`.
 
 @see AWSEC2RejectTransitGatewayVpcAttachmentRequest
 @see AWSEC2RejectTransitGatewayVpcAttachmentResult
 */
- (AWSTask<AWSEC2RejectTransitGatewayVpcAttachmentResult *> *)rejectTransitGatewayVpcAttachment:(AWSEC2RejectTransitGatewayVpcAttachmentRequest *)request;

/**
 <p>Rejects a request to attach a VPC to a transit gateway.</p><p>The VPC attachment must be in the <code>pendingAcceptance</code> state. Use <a>DescribeTransitGatewayVpcAttachments</a> to view your pending VPC attachment requests. Use <a>AcceptTransitGatewayVpcAttachment</a> to accept a VPC attachment request.</p>
 
 @param request A container for the necessary parameters to execute the RejectTransitGatewayVpcAttachment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2RejectTransitGatewayVpcAttachmentRequest
 @see AWSEC2RejectTransitGatewayVpcAttachmentResult
 */
- (void)rejectTransitGatewayVpcAttachment:(AWSEC2RejectTransitGatewayVpcAttachmentRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2RejectTransitGatewayVpcAttachmentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Rejects one or more VPC endpoint connection requests to your VPC endpoint service.</p>
 
 @param request A container for the necessary parameters to execute the RejectVpcEndpointConnections service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2RejectVpcEndpointConnectionsResult`.
 
 @see AWSEC2RejectVpcEndpointConnectionsRequest
 @see AWSEC2RejectVpcEndpointConnectionsResult
 */
- (AWSTask<AWSEC2RejectVpcEndpointConnectionsResult *> *)rejectVpcEndpointConnections:(AWSEC2RejectVpcEndpointConnectionsRequest *)request;

/**
 <p>Rejects one or more VPC endpoint connection requests to your VPC endpoint service.</p>
 
 @param request A container for the necessary parameters to execute the RejectVpcEndpointConnections service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2RejectVpcEndpointConnectionsRequest
 @see AWSEC2RejectVpcEndpointConnectionsResult
 */
- (void)rejectVpcEndpointConnections:(AWSEC2RejectVpcEndpointConnectionsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2RejectVpcEndpointConnectionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Rejects a VPC peering connection request. The VPC peering connection must be in the <code>pending-acceptance</code> state. Use the <a>DescribeVpcPeeringConnections</a> request to view your outstanding VPC peering connection requests. To delete an active VPC peering connection, or to delete a VPC peering connection request that you initiated, use <a>DeleteVpcPeeringConnection</a>.</p>
 
 @param request A container for the necessary parameters to execute the RejectVpcPeeringConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2RejectVpcPeeringConnectionResult`.
 
 @see AWSEC2RejectVpcPeeringConnectionRequest
 @see AWSEC2RejectVpcPeeringConnectionResult
 */
- (AWSTask<AWSEC2RejectVpcPeeringConnectionResult *> *)rejectVpcPeeringConnection:(AWSEC2RejectVpcPeeringConnectionRequest *)request;

/**
 <p>Rejects a VPC peering connection request. The VPC peering connection must be in the <code>pending-acceptance</code> state. Use the <a>DescribeVpcPeeringConnections</a> request to view your outstanding VPC peering connection requests. To delete an active VPC peering connection, or to delete a VPC peering connection request that you initiated, use <a>DeleteVpcPeeringConnection</a>.</p>
 
 @param request A container for the necessary parameters to execute the RejectVpcPeeringConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2RejectVpcPeeringConnectionRequest
 @see AWSEC2RejectVpcPeeringConnectionResult
 */
- (void)rejectVpcPeeringConnection:(AWSEC2RejectVpcPeeringConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2RejectVpcPeeringConnectionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Releases the specified Elastic IP address.</p><p>[EC2-Classic, default VPC] Releasing an Elastic IP address automatically disassociates it from any instance that it's associated with. To disassociate an Elastic IP address without releasing it, use <a>DisassociateAddress</a>.</p><p>[Nondefault VPC] You must use <a>DisassociateAddress</a> to disassociate the Elastic IP address before you can release it. Otherwise, Amazon EC2 returns an error (<code>InvalidIPAddress.InUse</code>).</p><p>After releasing an Elastic IP address, it is released to the IP address pool. Be sure to update your DNS records and any servers or devices that communicate with the address. If you attempt to release an Elastic IP address that you already released, you'll get an <code>AuthFailure</code> error if the address is already allocated to another AWS account.</p><p>[EC2-VPC] After you release an Elastic IP address for use in a VPC, you might be able to recover it. For more information, see <a>AllocateAddress</a>.</p>
 
 @param request A container for the necessary parameters to execute the ReleaseAddress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ReleaseAddressRequest
 */
- (AWSTask *)releaseAddress:(AWSEC2ReleaseAddressRequest *)request;

/**
 <p>Releases the specified Elastic IP address.</p><p>[EC2-Classic, default VPC] Releasing an Elastic IP address automatically disassociates it from any instance that it's associated with. To disassociate an Elastic IP address without releasing it, use <a>DisassociateAddress</a>.</p><p>[Nondefault VPC] You must use <a>DisassociateAddress</a> to disassociate the Elastic IP address before you can release it. Otherwise, Amazon EC2 returns an error (<code>InvalidIPAddress.InUse</code>).</p><p>After releasing an Elastic IP address, it is released to the IP address pool. Be sure to update your DNS records and any servers or devices that communicate with the address. If you attempt to release an Elastic IP address that you already released, you'll get an <code>AuthFailure</code> error if the address is already allocated to another AWS account.</p><p>[EC2-VPC] After you release an Elastic IP address for use in a VPC, you might be able to recover it. For more information, see <a>AllocateAddress</a>.</p>
 
 @param request A container for the necessary parameters to execute the ReleaseAddress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ReleaseAddressRequest
 */
- (void)releaseAddress:(AWSEC2ReleaseAddressRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>When you no longer want to use an On-Demand Dedicated Host it can be released. On-Demand billing is stopped and the host goes into <code>released</code> state. The host ID of Dedicated Hosts that have been released can no longer be specified in another request, for example, to modify the host. You must stop or terminate all instances on a host before it can be released.</p><p>When Dedicated Hosts are released, it may take some time for them to stop counting toward your limit and you may receive capacity errors when trying to allocate new Dedicated Hosts. Wait a few minutes and then try again.</p><p>Released hosts still appear in a <a>DescribeHosts</a> response.</p>
 
 @param request A container for the necessary parameters to execute the ReleaseHosts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ReleaseHostsResult`.
 
 @see AWSEC2ReleaseHostsRequest
 @see AWSEC2ReleaseHostsResult
 */
- (AWSTask<AWSEC2ReleaseHostsResult *> *)releaseHosts:(AWSEC2ReleaseHostsRequest *)request;

/**
 <p>When you no longer want to use an On-Demand Dedicated Host it can be released. On-Demand billing is stopped and the host goes into <code>released</code> state. The host ID of Dedicated Hosts that have been released can no longer be specified in another request, for example, to modify the host. You must stop or terminate all instances on a host before it can be released.</p><p>When Dedicated Hosts are released, it may take some time for them to stop counting toward your limit and you may receive capacity errors when trying to allocate new Dedicated Hosts. Wait a few minutes and then try again.</p><p>Released hosts still appear in a <a>DescribeHosts</a> response.</p>
 
 @param request A container for the necessary parameters to execute the ReleaseHosts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ReleaseHostsRequest
 @see AWSEC2ReleaseHostsResult
 */
- (void)releaseHosts:(AWSEC2ReleaseHostsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ReleaseHostsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Replaces an IAM instance profile for the specified running instance. You can use this action to change the IAM instance profile that's associated with an instance without having to disassociate the existing IAM instance profile first.</p><p>Use <a>DescribeIamInstanceProfileAssociations</a> to get the association ID.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceIamInstanceProfileAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ReplaceIamInstanceProfileAssociationResult`.
 
 @see AWSEC2ReplaceIamInstanceProfileAssociationRequest
 @see AWSEC2ReplaceIamInstanceProfileAssociationResult
 */
- (AWSTask<AWSEC2ReplaceIamInstanceProfileAssociationResult *> *)replaceIamInstanceProfileAssociation:(AWSEC2ReplaceIamInstanceProfileAssociationRequest *)request;

/**
 <p>Replaces an IAM instance profile for the specified running instance. You can use this action to change the IAM instance profile that's associated with an instance without having to disassociate the existing IAM instance profile first.</p><p>Use <a>DescribeIamInstanceProfileAssociations</a> to get the association ID.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceIamInstanceProfileAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ReplaceIamInstanceProfileAssociationRequest
 @see AWSEC2ReplaceIamInstanceProfileAssociationResult
 */
- (void)replaceIamInstanceProfileAssociation:(AWSEC2ReplaceIamInstanceProfileAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ReplaceIamInstanceProfileAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Changes which network ACL a subnet is associated with. By default when you create a subnet, it's automatically associated with the default network ACL. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>This is an idempotent operation.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceNetworkAclAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ReplaceNetworkAclAssociationResult`.
 
 @see AWSEC2ReplaceNetworkAclAssociationRequest
 @see AWSEC2ReplaceNetworkAclAssociationResult
 */
- (AWSTask<AWSEC2ReplaceNetworkAclAssociationResult *> *)replaceNetworkAclAssociation:(AWSEC2ReplaceNetworkAclAssociationRequest *)request;

/**
 <p>Changes which network ACL a subnet is associated with. By default when you create a subnet, it's automatically associated with the default network ACL. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>This is an idempotent operation.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceNetworkAclAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ReplaceNetworkAclAssociationRequest
 @see AWSEC2ReplaceNetworkAclAssociationResult
 */
- (void)replaceNetworkAclAssociation:(AWSEC2ReplaceNetworkAclAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ReplaceNetworkAclAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Replaces an entry (rule) in a network ACL. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceNetworkAclEntry service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ReplaceNetworkAclEntryRequest
 */
- (AWSTask *)replaceNetworkAclEntry:(AWSEC2ReplaceNetworkAclEntryRequest *)request;

/**
 <p>Replaces an entry (rule) in a network ACL. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceNetworkAclEntry service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ReplaceNetworkAclEntryRequest
 */
- (void)replaceNetworkAclEntry:(AWSEC2ReplaceNetworkAclEntryRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Replaces an existing route within a route table in a VPC. You must provide only one of the following: internet gateway, virtual private gateway, NAT instance, NAT gateway, VPC peering connection, network interface, egress-only internet gateway, or transit gateway.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceRoute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ReplaceRouteRequest
 */
- (AWSTask *)replaceRoute:(AWSEC2ReplaceRouteRequest *)request;

/**
 <p>Replaces an existing route within a route table in a VPC. You must provide only one of the following: internet gateway, virtual private gateway, NAT instance, NAT gateway, VPC peering connection, network interface, egress-only internet gateway, or transit gateway.</p><p>For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceRoute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ReplaceRouteRequest
 */
- (void)replaceRoute:(AWSEC2ReplaceRouteRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Changes the route table associated with a given subnet, internet gateway, or virtual private gateway in a VPC. After the operation completes, the subnet or gateway uses the routes in the new route table. For more information about route tables, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>You can also use this operation to change which table is the main route table in the VPC. Specify the main route table's association ID and the route table ID of the new main route table.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceRouteTableAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ReplaceRouteTableAssociationResult`.
 
 @see AWSEC2ReplaceRouteTableAssociationRequest
 @see AWSEC2ReplaceRouteTableAssociationResult
 */
- (AWSTask<AWSEC2ReplaceRouteTableAssociationResult *> *)replaceRouteTableAssociation:(AWSEC2ReplaceRouteTableAssociationRequest *)request;

/**
 <p>Changes the route table associated with a given subnet, internet gateway, or virtual private gateway in a VPC. After the operation completes, the subnet or gateway uses the routes in the new route table. For more information about route tables, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>You can also use this operation to change which table is the main route table in the VPC. Specify the main route table's association ID and the route table ID of the new main route table.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceRouteTableAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ReplaceRouteTableAssociationRequest
 @see AWSEC2ReplaceRouteTableAssociationResult
 */
- (void)replaceRouteTableAssociation:(AWSEC2ReplaceRouteTableAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ReplaceRouteTableAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Replaces the specified route in the specified transit gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceTransitGatewayRoute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ReplaceTransitGatewayRouteResult`.
 
 @see AWSEC2ReplaceTransitGatewayRouteRequest
 @see AWSEC2ReplaceTransitGatewayRouteResult
 */
- (AWSTask<AWSEC2ReplaceTransitGatewayRouteResult *> *)replaceTransitGatewayRoute:(AWSEC2ReplaceTransitGatewayRouteRequest *)request;

/**
 <p>Replaces the specified route in the specified transit gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceTransitGatewayRoute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ReplaceTransitGatewayRouteRequest
 @see AWSEC2ReplaceTransitGatewayRouteResult
 */
- (void)replaceTransitGatewayRoute:(AWSEC2ReplaceTransitGatewayRouteRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ReplaceTransitGatewayRouteResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Submits feedback about the status of an instance. The instance must be in the <code>running</code> state. If your experience with the instance differs from the instance status returned by <a>DescribeInstanceStatus</a>, use <a>ReportInstanceStatus</a> to report your experience with the instance. Amazon EC2 collects this information to improve the accuracy of status checks.</p><p>Use of this action does not change the value returned by <a>DescribeInstanceStatus</a>.</p>
 
 @param request A container for the necessary parameters to execute the ReportInstanceStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ReportInstanceStatusRequest
 */
- (AWSTask *)reportInstanceStatus:(AWSEC2ReportInstanceStatusRequest *)request;

/**
 <p>Submits feedback about the status of an instance. The instance must be in the <code>running</code> state. If your experience with the instance differs from the instance status returned by <a>DescribeInstanceStatus</a>, use <a>ReportInstanceStatus</a> to report your experience with the instance. Amazon EC2 collects this information to improve the accuracy of status checks.</p><p>Use of this action does not change the value returned by <a>DescribeInstanceStatus</a>.</p>
 
 @param request A container for the necessary parameters to execute the ReportInstanceStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ReportInstanceStatusRequest
 */
- (void)reportInstanceStatus:(AWSEC2ReportInstanceStatusRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Spot Fleet request.</p><p>The Spot Fleet request specifies the total target capacity and the On-Demand target capacity. Amazon EC2 calculates the difference between the total capacity and On-Demand capacity, and launches the difference as Spot capacity.</p><p>You can submit a single request that includes multiple launch specifications that vary by instance type, AMI, Availability Zone, or subnet.</p><p>By default, the Spot Fleet requests Spot Instances in the Spot Instance pool where the price per unit is the lowest. Each launch specification can include its own instance weighting that reflects the value of the instance type to your application workload.</p><p>Alternatively, you can specify that the Spot Fleet distribute the target capacity across the Spot pools included in its launch specifications. By ensuring that the Spot Instances in your Spot Fleet are in different Spot pools, you can improve the availability of your fleet.</p><p>You can specify tags for the Spot Fleet request and instances launched by the fleet. You cannot tag other resource types in a Spot Fleet request because only the <code>spot-fleet-request</code> and <code>instance</code> resource types are supported.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-fleet-requests.html">Spot Fleet Requests</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 
 @param request A container for the necessary parameters to execute the RequestSpotFleet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2RequestSpotFleetResponse`.
 
 @see AWSEC2RequestSpotFleetRequest
 @see AWSEC2RequestSpotFleetResponse
 */
- (AWSTask<AWSEC2RequestSpotFleetResponse *> *)requestSpotFleet:(AWSEC2RequestSpotFleetRequest *)request;

/**
 <p>Creates a Spot Fleet request.</p><p>The Spot Fleet request specifies the total target capacity and the On-Demand target capacity. Amazon EC2 calculates the difference between the total capacity and On-Demand capacity, and launches the difference as Spot capacity.</p><p>You can submit a single request that includes multiple launch specifications that vary by instance type, AMI, Availability Zone, or subnet.</p><p>By default, the Spot Fleet requests Spot Instances in the Spot Instance pool where the price per unit is the lowest. Each launch specification can include its own instance weighting that reflects the value of the instance type to your application workload.</p><p>Alternatively, you can specify that the Spot Fleet distribute the target capacity across the Spot pools included in its launch specifications. By ensuring that the Spot Instances in your Spot Fleet are in different Spot pools, you can improve the availability of your fleet.</p><p>You can specify tags for the Spot Fleet request and instances launched by the fleet. You cannot tag other resource types in a Spot Fleet request because only the <code>spot-fleet-request</code> and <code>instance</code> resource types are supported.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-fleet-requests.html">Spot Fleet Requests</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 
 @param request A container for the necessary parameters to execute the RequestSpotFleet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2RequestSpotFleetRequest
 @see AWSEC2RequestSpotFleetResponse
 */
- (void)requestSpotFleet:(AWSEC2RequestSpotFleetRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2RequestSpotFleetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Spot Instance request.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-requests.html">Spot Instance Requests</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 
 @param request A container for the necessary parameters to execute the RequestSpotInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2RequestSpotInstancesResult`.
 
 @see AWSEC2RequestSpotInstancesRequest
 @see AWSEC2RequestSpotInstancesResult
 */
- (AWSTask<AWSEC2RequestSpotInstancesResult *> *)requestSpotInstances:(AWSEC2RequestSpotInstancesRequest *)request;

/**
 <p>Creates a Spot Instance request.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-requests.html">Spot Instance Requests</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 
 @param request A container for the necessary parameters to execute the RequestSpotInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2RequestSpotInstancesRequest
 @see AWSEC2RequestSpotInstancesResult
 */
- (void)requestSpotInstances:(AWSEC2RequestSpotInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2RequestSpotInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Resets the default customer master key (CMK) for EBS encryption for your account in this Region to the AWS managed CMK for EBS.</p><p>After resetting the default CMK to the AWS managed CMK, you can continue to encrypt by a customer managed CMK by specifying it when you create the volume. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ResetEbsDefaultKmsKeyId service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ResetEbsDefaultKmsKeyIdResult`.
 
 @see AWSEC2ResetEbsDefaultKmsKeyIdRequest
 @see AWSEC2ResetEbsDefaultKmsKeyIdResult
 */
- (AWSTask<AWSEC2ResetEbsDefaultKmsKeyIdResult *> *)resetEbsDefaultKmsKeyId:(AWSEC2ResetEbsDefaultKmsKeyIdRequest *)request;

/**
 <p>Resets the default customer master key (CMK) for EBS encryption for your account in this Region to the AWS managed CMK for EBS.</p><p>After resetting the default CMK to the AWS managed CMK, you can continue to encrypt by a customer managed CMK by specifying it when you create the volume. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ResetEbsDefaultKmsKeyId service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ResetEbsDefaultKmsKeyIdRequest
 @see AWSEC2ResetEbsDefaultKmsKeyIdResult
 */
- (void)resetEbsDefaultKmsKeyId:(AWSEC2ResetEbsDefaultKmsKeyIdRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ResetEbsDefaultKmsKeyIdResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Resets the specified attribute of the specified Amazon FPGA Image (AFI) to its default value. You can only reset the load permission attribute.</p>
 
 @param request A container for the necessary parameters to execute the ResetFpgaImageAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ResetFpgaImageAttributeResult`.
 
 @see AWSEC2ResetFpgaImageAttributeRequest
 @see AWSEC2ResetFpgaImageAttributeResult
 */
- (AWSTask<AWSEC2ResetFpgaImageAttributeResult *> *)resetFpgaImageAttribute:(AWSEC2ResetFpgaImageAttributeRequest *)request;

/**
 <p>Resets the specified attribute of the specified Amazon FPGA Image (AFI) to its default value. You can only reset the load permission attribute.</p>
 
 @param request A container for the necessary parameters to execute the ResetFpgaImageAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ResetFpgaImageAttributeRequest
 @see AWSEC2ResetFpgaImageAttributeResult
 */
- (void)resetFpgaImageAttribute:(AWSEC2ResetFpgaImageAttributeRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ResetFpgaImageAttributeResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Resets an attribute of an AMI to its default value.</p><note><p>The productCodes attribute can't be reset.</p></note>
 
 @param request A container for the necessary parameters to execute the ResetImageAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ResetImageAttributeRequest
 */
- (AWSTask *)resetImageAttribute:(AWSEC2ResetImageAttributeRequest *)request;

/**
 <p>Resets an attribute of an AMI to its default value.</p><note><p>The productCodes attribute can't be reset.</p></note>
 
 @param request A container for the necessary parameters to execute the ResetImageAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ResetImageAttributeRequest
 */
- (void)resetImageAttribute:(AWSEC2ResetImageAttributeRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Resets an attribute of an instance to its default value. To reset the <code>kernel</code> or <code>ramdisk</code>, the instance must be in a stopped state. To reset the <code>sourceDestCheck</code>, the instance can be either running or stopped.</p><p>The <code>sourceDestCheck</code> attribute controls whether source/destination checking is enabled. The default value is <code>true</code>, which means checking is enabled. This value must be <code>false</code> for a NAT instance to perform NAT. For more information, see <a href="https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_NAT_Instance.html">NAT Instances</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ResetInstanceAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ResetInstanceAttributeRequest
 */
- (AWSTask *)resetInstanceAttribute:(AWSEC2ResetInstanceAttributeRequest *)request;

/**
 <p>Resets an attribute of an instance to its default value. To reset the <code>kernel</code> or <code>ramdisk</code>, the instance must be in a stopped state. To reset the <code>sourceDestCheck</code>, the instance can be either running or stopped.</p><p>The <code>sourceDestCheck</code> attribute controls whether source/destination checking is enabled. The default value is <code>true</code>, which means checking is enabled. This value must be <code>false</code> for a NAT instance to perform NAT. For more information, see <a href="https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_NAT_Instance.html">NAT Instances</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ResetInstanceAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ResetInstanceAttributeRequest
 */
- (void)resetInstanceAttribute:(AWSEC2ResetInstanceAttributeRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Resets a network interface attribute. You can specify only one attribute at a time.</p>
 
 @param request A container for the necessary parameters to execute the ResetNetworkInterfaceAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ResetNetworkInterfaceAttributeRequest
 */
- (AWSTask *)resetNetworkInterfaceAttribute:(AWSEC2ResetNetworkInterfaceAttributeRequest *)request;

/**
 <p>Resets a network interface attribute. You can specify only one attribute at a time.</p>
 
 @param request A container for the necessary parameters to execute the ResetNetworkInterfaceAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ResetNetworkInterfaceAttributeRequest
 */
- (void)resetNetworkInterfaceAttribute:(AWSEC2ResetNetworkInterfaceAttributeRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Resets permission settings for the specified snapshot.</p><p>For more information about modifying snapshot permissions, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modifying-snapshot-permissions.html">Sharing Snapshots</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ResetSnapshotAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ResetSnapshotAttributeRequest
 */
- (AWSTask *)resetSnapshotAttribute:(AWSEC2ResetSnapshotAttributeRequest *)request;

/**
 <p>Resets permission settings for the specified snapshot.</p><p>For more information about modifying snapshot permissions, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modifying-snapshot-permissions.html">Sharing Snapshots</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ResetSnapshotAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ResetSnapshotAttributeRequest
 */
- (void)resetSnapshotAttribute:(AWSEC2ResetSnapshotAttributeRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Restores an Elastic IP address that was previously moved to the EC2-VPC platform back to the EC2-Classic platform. You cannot move an Elastic IP address that was originally allocated for use in EC2-VPC. The Elastic IP address must not be associated with an instance or network interface.</p>
 
 @param request A container for the necessary parameters to execute the RestoreAddressToClassic service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2RestoreAddressToClassicResult`.
 
 @see AWSEC2RestoreAddressToClassicRequest
 @see AWSEC2RestoreAddressToClassicResult
 */
- (AWSTask<AWSEC2RestoreAddressToClassicResult *> *)restoreAddressToClassic:(AWSEC2RestoreAddressToClassicRequest *)request;

/**
 <p>Restores an Elastic IP address that was previously moved to the EC2-VPC platform back to the EC2-Classic platform. You cannot move an Elastic IP address that was originally allocated for use in EC2-VPC. The Elastic IP address must not be associated with an instance or network interface.</p>
 
 @param request A container for the necessary parameters to execute the RestoreAddressToClassic service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2RestoreAddressToClassicRequest
 @see AWSEC2RestoreAddressToClassicResult
 */
- (void)restoreAddressToClassic:(AWSEC2RestoreAddressToClassicRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2RestoreAddressToClassicResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes an ingress authorization rule from a Client VPN endpoint. </p>
 
 @param request A container for the necessary parameters to execute the RevokeClientVpnIngress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2RevokeClientVpnIngressResult`.
 
 @see AWSEC2RevokeClientVpnIngressRequest
 @see AWSEC2RevokeClientVpnIngressResult
 */
- (AWSTask<AWSEC2RevokeClientVpnIngressResult *> *)revokeClientVpnIngress:(AWSEC2RevokeClientVpnIngressRequest *)request;

/**
 <p>Removes an ingress authorization rule from a Client VPN endpoint. </p>
 
 @param request A container for the necessary parameters to execute the RevokeClientVpnIngress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2RevokeClientVpnIngressRequest
 @see AWSEC2RevokeClientVpnIngressResult
 */
- (void)revokeClientVpnIngress:(AWSEC2RevokeClientVpnIngressRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2RevokeClientVpnIngressResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>[VPC only] Removes the specified egress rules from a security group for EC2-VPC. This action doesn't apply to security groups for use in EC2-Classic. To remove a rule, the values that you specify (for example, ports) must match the existing rule's values exactly.</p><p>Each rule consists of the protocol and the IPv4 or IPv6 CIDR range or source security group. For the TCP and UDP protocols, you must also specify the destination port or range of ports. For the ICMP protocol, you must also specify the ICMP type and code. If the security group rule has a description, you do not have to specify the description to revoke the rule.</p><p>Rule changes are propagated to instances within the security group as quickly as possible. However, a small delay might occur.</p>
 
 @param request A container for the necessary parameters to execute the RevokeSecurityGroupEgress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2RevokeSecurityGroupEgressRequest
 */
- (AWSTask *)revokeSecurityGroupEgress:(AWSEC2RevokeSecurityGroupEgressRequest *)request;

/**
 <p>[VPC only] Removes the specified egress rules from a security group for EC2-VPC. This action doesn't apply to security groups for use in EC2-Classic. To remove a rule, the values that you specify (for example, ports) must match the existing rule's values exactly.</p><p>Each rule consists of the protocol and the IPv4 or IPv6 CIDR range or source security group. For the TCP and UDP protocols, you must also specify the destination port or range of ports. For the ICMP protocol, you must also specify the ICMP type and code. If the security group rule has a description, you do not have to specify the description to revoke the rule.</p><p>Rule changes are propagated to instances within the security group as quickly as possible. However, a small delay might occur.</p>
 
 @param request A container for the necessary parameters to execute the RevokeSecurityGroupEgress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2RevokeSecurityGroupEgressRequest
 */
- (void)revokeSecurityGroupEgress:(AWSEC2RevokeSecurityGroupEgressRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified ingress rules from a security group. To remove a rule, the values that you specify (for example, ports) must match the existing rule's values exactly.</p><note><p>[EC2-Classic only] If the values you specify do not match the existing rule's values, no error is returned. Use <a>DescribeSecurityGroups</a> to verify that the rule has been removed.</p></note><p>Each rule consists of the protocol and the CIDR range or source security group. For the TCP and UDP protocols, you must also specify the destination port or range of ports. For the ICMP protocol, you must also specify the ICMP type and code. If the security group rule has a description, you do not have to specify the description to revoke the rule.</p><p>Rule changes are propagated to instances within the security group as quickly as possible. However, a small delay might occur.</p>
 
 @param request A container for the necessary parameters to execute the RevokeSecurityGroupIngress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2RevokeSecurityGroupIngressRequest
 */
- (AWSTask *)revokeSecurityGroupIngress:(AWSEC2RevokeSecurityGroupIngressRequest *)request;

/**
 <p>Removes the specified ingress rules from a security group. To remove a rule, the values that you specify (for example, ports) must match the existing rule's values exactly.</p><note><p>[EC2-Classic only] If the values you specify do not match the existing rule's values, no error is returned. Use <a>DescribeSecurityGroups</a> to verify that the rule has been removed.</p></note><p>Each rule consists of the protocol and the CIDR range or source security group. For the TCP and UDP protocols, you must also specify the destination port or range of ports. For the ICMP protocol, you must also specify the ICMP type and code. If the security group rule has a description, you do not have to specify the description to revoke the rule.</p><p>Rule changes are propagated to instances within the security group as quickly as possible. However, a small delay might occur.</p>
 
 @param request A container for the necessary parameters to execute the RevokeSecurityGroupIngress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2RevokeSecurityGroupIngressRequest
 */
- (void)revokeSecurityGroupIngress:(AWSEC2RevokeSecurityGroupIngressRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Launches the specified number of instances using an AMI for which you have permissions. </p><p>You can specify a number of options, or leave the default options. The following rules apply:</p><ul><li><p>[EC2-VPC] If you don't specify a subnet ID, we choose a default subnet from your default VPC for you. If you don't have a default VPC, you must specify a subnet ID in the request.</p></li><li><p>[EC2-Classic] If don't specify an Availability Zone, we choose one for you.</p></li><li><p>Some instance types must be launched into a VPC. If you do not have a default VPC, or if you do not specify a subnet ID, the request fails. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-vpc.html#vpc-only-instance-types">Instance Types Available Only in a VPC</a>.</p></li><li><p>[EC2-VPC] All instances have a network interface with a primary private IPv4 address. If you don't specify this address, we choose one from the IPv4 range of your subnet.</p></li><li><p>Not all instance types support IPv6 addresses. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">Instance Types</a>.</p></li><li><p>If you don't specify a security group ID, we use the default security group. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html">Security Groups</a>.</p></li><li><p>If any of the AMIs have a product code attached for which the user has not subscribed, the request fails.</p></li></ul><p>You can create a <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html">launch template</a>, which is a resource that contains the parameters to launch an instance. When you launch an instance using <a>RunInstances</a>, you can specify the launch template instead of specifying the launch parameters.</p><p>To ensure faster instance launches, break up large requests into smaller batches. For example, create five separate launch requests for 100 instances each instead of one launch request for 500 instances.</p><p>An instance is ready for you to use when it's in the <code>running</code> state. You can check the state of your instance using <a>DescribeInstances</a>. You can tag instances and EBS volumes during launch, after launch, or both. For more information, see <a>CreateTags</a> and <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Amazon EC2 Resources</a>.</p><p>Linux instances have access to the public key of the key pair at boot. You can use this key to provide secure access to the instance. Amazon EC2 public images use this feature to provide secure access without passwords. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>For troubleshooting, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_InstanceStraightToTerminated.html">What To Do If An Instance Immediately Terminates</a>, and <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesConnecting.html">Troubleshooting Connecting to Your Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RunInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2Reservation`.
 
 @see AWSEC2RunInstancesRequest
 @see AWSEC2Reservation
 */
- (AWSTask<AWSEC2Reservation *> *)runInstances:(AWSEC2RunInstancesRequest *)request;

/**
 <p>Launches the specified number of instances using an AMI for which you have permissions. </p><p>You can specify a number of options, or leave the default options. The following rules apply:</p><ul><li><p>[EC2-VPC] If you don't specify a subnet ID, we choose a default subnet from your default VPC for you. If you don't have a default VPC, you must specify a subnet ID in the request.</p></li><li><p>[EC2-Classic] If don't specify an Availability Zone, we choose one for you.</p></li><li><p>Some instance types must be launched into a VPC. If you do not have a default VPC, or if you do not specify a subnet ID, the request fails. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-vpc.html#vpc-only-instance-types">Instance Types Available Only in a VPC</a>.</p></li><li><p>[EC2-VPC] All instances have a network interface with a primary private IPv4 address. If you don't specify this address, we choose one from the IPv4 range of your subnet.</p></li><li><p>Not all instance types support IPv6 addresses. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">Instance Types</a>.</p></li><li><p>If you don't specify a security group ID, we use the default security group. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html">Security Groups</a>.</p></li><li><p>If any of the AMIs have a product code attached for which the user has not subscribed, the request fails.</p></li></ul><p>You can create a <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html">launch template</a>, which is a resource that contains the parameters to launch an instance. When you launch an instance using <a>RunInstances</a>, you can specify the launch template instead of specifying the launch parameters.</p><p>To ensure faster instance launches, break up large requests into smaller batches. For example, create five separate launch requests for 100 instances each instead of one launch request for 500 instances.</p><p>An instance is ready for you to use when it's in the <code>running</code> state. You can check the state of your instance using <a>DescribeInstances</a>. You can tag instances and EBS volumes during launch, after launch, or both. For more information, see <a>CreateTags</a> and <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Amazon EC2 Resources</a>.</p><p>Linux instances have access to the public key of the key pair at boot. You can use this key to provide secure access to the instance. Amazon EC2 public images use this feature to provide secure access without passwords. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>For troubleshooting, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_InstanceStraightToTerminated.html">What To Do If An Instance Immediately Terminates</a>, and <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesConnecting.html">Troubleshooting Connecting to Your Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RunInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2RunInstancesRequest
 @see AWSEC2Reservation
 */
- (void)runInstances:(AWSEC2RunInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2Reservation * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Launches the specified Scheduled Instances.</p><p>Before you can launch a Scheduled Instance, you must purchase it and obtain an identifier using <a>PurchaseScheduledInstances</a>.</p><p>You must launch a Scheduled Instance during its scheduled time period. You can't stop or reboot a Scheduled Instance, but you can terminate it as needed. If you terminate a Scheduled Instance before the current scheduled time period ends, you can launch it again after a few minutes. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-scheduled-instances.html">Scheduled Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RunScheduledInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2RunScheduledInstancesResult`.
 
 @see AWSEC2RunScheduledInstancesRequest
 @see AWSEC2RunScheduledInstancesResult
 */
- (AWSTask<AWSEC2RunScheduledInstancesResult *> *)runScheduledInstances:(AWSEC2RunScheduledInstancesRequest *)request;

/**
 <p>Launches the specified Scheduled Instances.</p><p>Before you can launch a Scheduled Instance, you must purchase it and obtain an identifier using <a>PurchaseScheduledInstances</a>.</p><p>You must launch a Scheduled Instance during its scheduled time period. You can't stop or reboot a Scheduled Instance, but you can terminate it as needed. If you terminate a Scheduled Instance before the current scheduled time period ends, you can launch it again after a few minutes. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-scheduled-instances.html">Scheduled Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RunScheduledInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2RunScheduledInstancesRequest
 @see AWSEC2RunScheduledInstancesResult
 */
- (void)runScheduledInstances:(AWSEC2RunScheduledInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2RunScheduledInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches for routes in the specified local gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the SearchLocalGatewayRoutes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2SearchLocalGatewayRoutesResult`.
 
 @see AWSEC2SearchLocalGatewayRoutesRequest
 @see AWSEC2SearchLocalGatewayRoutesResult
 */
- (AWSTask<AWSEC2SearchLocalGatewayRoutesResult *> *)searchLocalGatewayRoutes:(AWSEC2SearchLocalGatewayRoutesRequest *)request;

/**
 <p>Searches for routes in the specified local gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the SearchLocalGatewayRoutes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2SearchLocalGatewayRoutesRequest
 @see AWSEC2SearchLocalGatewayRoutesResult
 */
- (void)searchLocalGatewayRoutes:(AWSEC2SearchLocalGatewayRoutesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2SearchLocalGatewayRoutesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches one or more transit gateway multicast groups and returns the group membership information.</p>
 
 @param request A container for the necessary parameters to execute the SearchTransitGatewayMulticastGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2SearchTransitGatewayMulticastGroupsResult`.
 
 @see AWSEC2SearchTransitGatewayMulticastGroupsRequest
 @see AWSEC2SearchTransitGatewayMulticastGroupsResult
 */
- (AWSTask<AWSEC2SearchTransitGatewayMulticastGroupsResult *> *)searchTransitGatewayMulticastGroups:(AWSEC2SearchTransitGatewayMulticastGroupsRequest *)request;

/**
 <p>Searches one or more transit gateway multicast groups and returns the group membership information.</p>
 
 @param request A container for the necessary parameters to execute the SearchTransitGatewayMulticastGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2SearchTransitGatewayMulticastGroupsRequest
 @see AWSEC2SearchTransitGatewayMulticastGroupsResult
 */
- (void)searchTransitGatewayMulticastGroups:(AWSEC2SearchTransitGatewayMulticastGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2SearchTransitGatewayMulticastGroupsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Searches for routes in the specified transit gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the SearchTransitGatewayRoutes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2SearchTransitGatewayRoutesResult`.
 
 @see AWSEC2SearchTransitGatewayRoutesRequest
 @see AWSEC2SearchTransitGatewayRoutesResult
 */
- (AWSTask<AWSEC2SearchTransitGatewayRoutesResult *> *)searchTransitGatewayRoutes:(AWSEC2SearchTransitGatewayRoutesRequest *)request;

/**
 <p>Searches for routes in the specified transit gateway route table.</p>
 
 @param request A container for the necessary parameters to execute the SearchTransitGatewayRoutes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2SearchTransitGatewayRoutesRequest
 @see AWSEC2SearchTransitGatewayRoutesResult
 */
- (void)searchTransitGatewayRoutes:(AWSEC2SearchTransitGatewayRoutesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2SearchTransitGatewayRoutesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sends a diagnostic interrupt to the specified Amazon EC2 instance to trigger a <i>kernel panic</i> (on Linux instances), or a <i>blue screen</i>/<i>stop error</i> (on Windows instances). For instances based on Intel and AMD processors, the interrupt is received as a <i>non-maskable interrupt</i> (NMI).</p><p>In general, the operating system crashes and reboots when a kernel panic or stop error is triggered. The operating system can also be configured to perform diagnostic tasks, such as generating a memory dump file, loading a secondary kernel, or obtaining a call trace.</p><p>Before sending a diagnostic interrupt to your instance, ensure that its operating system is configured to perform the required diagnostic tasks.</p><p>For more information about configuring your operating system to generate a crash dump when a kernel panic or stop error occurs, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/diagnostic-interrupt.html">Send a Diagnostic Interrupt</a> (Linux instances) or <a href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/diagnostic-interrupt.html">Send a Diagnostic Interrupt</a> (Windows instances).</p>
 
 @param request A container for the necessary parameters to execute the SendDiagnosticInterrupt service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2SendDiagnosticInterruptRequest
 */
- (AWSTask *)sendDiagnosticInterrupt:(AWSEC2SendDiagnosticInterruptRequest *)request;

/**
 <p>Sends a diagnostic interrupt to the specified Amazon EC2 instance to trigger a <i>kernel panic</i> (on Linux instances), or a <i>blue screen</i>/<i>stop error</i> (on Windows instances). For instances based on Intel and AMD processors, the interrupt is received as a <i>non-maskable interrupt</i> (NMI).</p><p>In general, the operating system crashes and reboots when a kernel panic or stop error is triggered. The operating system can also be configured to perform diagnostic tasks, such as generating a memory dump file, loading a secondary kernel, or obtaining a call trace.</p><p>Before sending a diagnostic interrupt to your instance, ensure that its operating system is configured to perform the required diagnostic tasks.</p><p>For more information about configuring your operating system to generate a crash dump when a kernel panic or stop error occurs, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/diagnostic-interrupt.html">Send a Diagnostic Interrupt</a> (Linux instances) or <a href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/diagnostic-interrupt.html">Send a Diagnostic Interrupt</a> (Windows instances).</p>
 
 @param request A container for the necessary parameters to execute the SendDiagnosticInterrupt service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2SendDiagnosticInterruptRequest
 */
- (void)sendDiagnosticInterrupt:(AWSEC2SendDiagnosticInterruptRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Starts an Amazon EBS-backed instance that you've previously stopped.</p><p>Instances that use Amazon EBS volumes as their root devices can be quickly stopped and started. When an instance is stopped, the compute resources are released and you are not billed for instance usage. However, your root partition Amazon EBS volume remains and continues to persist your data, and you are charged for Amazon EBS volume usage. You can restart your instance at any time. Every time you start your Windows instance, Amazon EC2 charges you for a full instance hour. If you stop and restart your Windows instance, a new instance hour begins and Amazon EC2 charges you for another full instance hour even if you are still within the same 60-minute period when it was stopped. Every time you start your Linux instance, Amazon EC2 charges a one-minute minimum for instance usage, and thereafter charges per second for instance usage.</p><p>Before stopping an instance, make sure it is in a state from which it can be restarted. Stopping an instance does not preserve data stored in RAM.</p><p>Performing this operation on an instance that uses an instance store as its root device returns an error.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Stop_Start.html">Stopping Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StartInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2StartInstancesResult`.
 
 @see AWSEC2StartInstancesRequest
 @see AWSEC2StartInstancesResult
 */
- (AWSTask<AWSEC2StartInstancesResult *> *)startInstances:(AWSEC2StartInstancesRequest *)request;

/**
 <p>Starts an Amazon EBS-backed instance that you've previously stopped.</p><p>Instances that use Amazon EBS volumes as their root devices can be quickly stopped and started. When an instance is stopped, the compute resources are released and you are not billed for instance usage. However, your root partition Amazon EBS volume remains and continues to persist your data, and you are charged for Amazon EBS volume usage. You can restart your instance at any time. Every time you start your Windows instance, Amazon EC2 charges you for a full instance hour. If you stop and restart your Windows instance, a new instance hour begins and Amazon EC2 charges you for another full instance hour even if you are still within the same 60-minute period when it was stopped. Every time you start your Linux instance, Amazon EC2 charges a one-minute minimum for instance usage, and thereafter charges per second for instance usage.</p><p>Before stopping an instance, make sure it is in a state from which it can be restarted. Stopping an instance does not preserve data stored in RAM.</p><p>Performing this operation on an instance that uses an instance store as its root device returns an error.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Stop_Start.html">Stopping Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StartInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2StartInstancesRequest
 @see AWSEC2StartInstancesResult
 */
- (void)startInstances:(AWSEC2StartInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2StartInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates the verification process to prove that the service provider owns the private DNS name domain for the endpoint service.</p><p>The service provider must successfully perform the verification before the consumer can use the name to access the service.</p><p>Before the service provider runs this command, they must add a record to the DNS server. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/ndpoint-services-dns-validation.html#add-dns-txt-record">Adding a TXT Record to Your Domain's DNS Server </a> in the <i>Amazon VPC User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StartVpcEndpointServicePrivateDnsVerification service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2StartVpcEndpointServicePrivateDnsVerificationResult`.
 
 @see AWSEC2StartVpcEndpointServicePrivateDnsVerificationRequest
 @see AWSEC2StartVpcEndpointServicePrivateDnsVerificationResult
 */
- (AWSTask<AWSEC2StartVpcEndpointServicePrivateDnsVerificationResult *> *)startVpcEndpointServicePrivateDnsVerification:(AWSEC2StartVpcEndpointServicePrivateDnsVerificationRequest *)request;

/**
 <p>Initiates the verification process to prove that the service provider owns the private DNS name domain for the endpoint service.</p><p>The service provider must successfully perform the verification before the consumer can use the name to access the service.</p><p>Before the service provider runs this command, they must add a record to the DNS server. For more information, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/ndpoint-services-dns-validation.html#add-dns-txt-record">Adding a TXT Record to Your Domain's DNS Server </a> in the <i>Amazon VPC User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StartVpcEndpointServicePrivateDnsVerification service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2StartVpcEndpointServicePrivateDnsVerificationRequest
 @see AWSEC2StartVpcEndpointServicePrivateDnsVerificationResult
 */
- (void)startVpcEndpointServicePrivateDnsVerification:(AWSEC2StartVpcEndpointServicePrivateDnsVerificationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2StartVpcEndpointServicePrivateDnsVerificationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops an Amazon EBS-backed instance.</p><p>You can use the Stop action to hibernate an instance if the instance is <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Hibernate.html#enabling-hibernation">enabled for hibernation</a> and it meets the <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Hibernate.html#hibernating-prerequisites">hibernation prerequisites</a>. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Hibernate.html">Hibernate Your Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>We don't charge usage for a stopped instance, or data transfer fees; however, your root partition Amazon EBS volume remains and continues to persist your data, and you are charged for Amazon EBS volume usage. Every time you start your Windows instance, Amazon EC2 charges you for a full instance hour. If you stop and restart your Windows instance, a new instance hour begins and Amazon EC2 charges you for another full instance hour even if you are still within the same 60-minute period when it was stopped. Every time you start your Linux instance, Amazon EC2 charges a one-minute minimum for instance usage, and thereafter charges per second for instance usage.</p><p>You can't stop or hibernate instance store-backed instances. You can't use the Stop action to hibernate Spot Instances, but you can specify that Amazon EC2 should hibernate Spot Instances when they are interrupted. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-interruptions.html#hibernate-spot-instances">Hibernating Interrupted Spot Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>When you stop or hibernate an instance, we shut it down. You can restart your instance at any time. Before stopping or hibernating an instance, make sure it is in a state from which it can be restarted. Stopping an instance does not preserve data stored in RAM, but hibernating an instance does preserve data stored in RAM. If an instance cannot hibernate successfully, a normal shutdown occurs.</p><p>Stopping and hibernating an instance is different to rebooting or terminating it. For example, when you stop or hibernate an instance, the root device and any other devices attached to the instance persist. When you terminate an instance, the root device and any other devices attached during the instance launch are automatically deleted. For more information about the differences between rebooting, stopping, hibernating, and terminating instances, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html">Instance Lifecycle</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>When you stop an instance, we attempt to shut it down forcibly after a short while. If your instance appears stuck in the stopping state after a period of time, there may be an issue with the underlying host computer. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesStopping.html">Troubleshooting Stopping Your Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StopInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2StopInstancesResult`.
 
 @see AWSEC2StopInstancesRequest
 @see AWSEC2StopInstancesResult
 */
- (AWSTask<AWSEC2StopInstancesResult *> *)stopInstances:(AWSEC2StopInstancesRequest *)request;

/**
 <p>Stops an Amazon EBS-backed instance.</p><p>You can use the Stop action to hibernate an instance if the instance is <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Hibernate.html#enabling-hibernation">enabled for hibernation</a> and it meets the <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Hibernate.html#hibernating-prerequisites">hibernation prerequisites</a>. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Hibernate.html">Hibernate Your Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>We don't charge usage for a stopped instance, or data transfer fees; however, your root partition Amazon EBS volume remains and continues to persist your data, and you are charged for Amazon EBS volume usage. Every time you start your Windows instance, Amazon EC2 charges you for a full instance hour. If you stop and restart your Windows instance, a new instance hour begins and Amazon EC2 charges you for another full instance hour even if you are still within the same 60-minute period when it was stopped. Every time you start your Linux instance, Amazon EC2 charges a one-minute minimum for instance usage, and thereafter charges per second for instance usage.</p><p>You can't stop or hibernate instance store-backed instances. You can't use the Stop action to hibernate Spot Instances, but you can specify that Amazon EC2 should hibernate Spot Instances when they are interrupted. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-interruptions.html#hibernate-spot-instances">Hibernating Interrupted Spot Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>When you stop or hibernate an instance, we shut it down. You can restart your instance at any time. Before stopping or hibernating an instance, make sure it is in a state from which it can be restarted. Stopping an instance does not preserve data stored in RAM, but hibernating an instance does preserve data stored in RAM. If an instance cannot hibernate successfully, a normal shutdown occurs.</p><p>Stopping and hibernating an instance is different to rebooting or terminating it. For example, when you stop or hibernate an instance, the root device and any other devices attached to the instance persist. When you terminate an instance, the root device and any other devices attached during the instance launch are automatically deleted. For more information about the differences between rebooting, stopping, hibernating, and terminating instances, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html">Instance Lifecycle</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>When you stop an instance, we attempt to shut it down forcibly after a short while. If your instance appears stuck in the stopping state after a period of time, there may be an issue with the underlying host computer. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesStopping.html">Troubleshooting Stopping Your Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StopInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2StopInstancesRequest
 @see AWSEC2StopInstancesResult
 */
- (void)stopInstances:(AWSEC2StopInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2StopInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Terminates active Client VPN endpoint connections. This action can be used to terminate a specific client connection, or up to five connections established by a specific user.</p>
 
 @param request A container for the necessary parameters to execute the TerminateClientVpnConnections service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2TerminateClientVpnConnectionsResult`.
 
 @see AWSEC2TerminateClientVpnConnectionsRequest
 @see AWSEC2TerminateClientVpnConnectionsResult
 */
- (AWSTask<AWSEC2TerminateClientVpnConnectionsResult *> *)terminateClientVpnConnections:(AWSEC2TerminateClientVpnConnectionsRequest *)request;

/**
 <p>Terminates active Client VPN endpoint connections. This action can be used to terminate a specific client connection, or up to five connections established by a specific user.</p>
 
 @param request A container for the necessary parameters to execute the TerminateClientVpnConnections service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2TerminateClientVpnConnectionsRequest
 @see AWSEC2TerminateClientVpnConnectionsResult
 */
- (void)terminateClientVpnConnections:(AWSEC2TerminateClientVpnConnectionsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2TerminateClientVpnConnectionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Shuts down the specified instances. This operation is idempotent; if you terminate an instance more than once, each call succeeds. </p><p>If you specify multiple instances and the request fails (for example, because of a single incorrect instance ID), none of the instances are terminated.</p><p>Terminated instances remain visible after termination (for approximately one hour).</p><p>By default, Amazon EC2 deletes all EBS volumes that were attached when the instance launched. Volumes attached after instance launch continue running.</p><p>You can stop, start, and terminate EBS-backed instances. You can only terminate instance store-backed instances. What happens to an instance differs if you stop it or terminate it. For example, when you stop an instance, the root device and any other devices attached to the instance persist. When you terminate an instance, any attached EBS volumes with the <code>DeleteOnTermination</code> block device mapping parameter set to <code>true</code> are automatically deleted. For more information about the differences between stopping and terminating instances, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html">Instance Lifecycle</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>For more information about troubleshooting, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesShuttingDown.html">Troubleshooting Terminating Your Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the TerminateInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2TerminateInstancesResult`.
 
 @see AWSEC2TerminateInstancesRequest
 @see AWSEC2TerminateInstancesResult
 */
- (AWSTask<AWSEC2TerminateInstancesResult *> *)terminateInstances:(AWSEC2TerminateInstancesRequest *)request;

/**
 <p>Shuts down the specified instances. This operation is idempotent; if you terminate an instance more than once, each call succeeds. </p><p>If you specify multiple instances and the request fails (for example, because of a single incorrect instance ID), none of the instances are terminated.</p><p>Terminated instances remain visible after termination (for approximately one hour).</p><p>By default, Amazon EC2 deletes all EBS volumes that were attached when the instance launched. Volumes attached after instance launch continue running.</p><p>You can stop, start, and terminate EBS-backed instances. You can only terminate instance store-backed instances. What happens to an instance differs if you stop it or terminate it. For example, when you stop an instance, the root device and any other devices attached to the instance persist. When you terminate an instance, any attached EBS volumes with the <code>DeleteOnTermination</code> block device mapping parameter set to <code>true</code> are automatically deleted. For more information about the differences between stopping and terminating instances, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html">Instance Lifecycle</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>For more information about troubleshooting, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesShuttingDown.html">Troubleshooting Terminating Your Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the TerminateInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2TerminateInstancesRequest
 @see AWSEC2TerminateInstancesResult
 */
- (void)terminateInstances:(AWSEC2TerminateInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2TerminateInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Unassigns one or more IPv6 addresses from a network interface.</p>
 
 @param request A container for the necessary parameters to execute the UnassignIpv6Addresses service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2UnassignIpv6AddressesResult`.
 
 @see AWSEC2UnassignIpv6AddressesRequest
 @see AWSEC2UnassignIpv6AddressesResult
 */
- (AWSTask<AWSEC2UnassignIpv6AddressesResult *> *)unassignIpv6Addresses:(AWSEC2UnassignIpv6AddressesRequest *)request;

/**
 <p>Unassigns one or more IPv6 addresses from a network interface.</p>
 
 @param request A container for the necessary parameters to execute the UnassignIpv6Addresses service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2UnassignIpv6AddressesRequest
 @see AWSEC2UnassignIpv6AddressesResult
 */
- (void)unassignIpv6Addresses:(AWSEC2UnassignIpv6AddressesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2UnassignIpv6AddressesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Unassigns one or more secondary private IP addresses from a network interface.</p>
 
 @param request A container for the necessary parameters to execute the UnassignPrivateIpAddresses service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2UnassignPrivateIpAddressesRequest
 */
- (AWSTask *)unassignPrivateIpAddresses:(AWSEC2UnassignPrivateIpAddressesRequest *)request;

/**
 <p>Unassigns one or more secondary private IP addresses from a network interface.</p>
 
 @param request A container for the necessary parameters to execute the UnassignPrivateIpAddresses service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2UnassignPrivateIpAddressesRequest
 */
- (void)unassignPrivateIpAddresses:(AWSEC2UnassignPrivateIpAddressesRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Disables detailed monitoring for a running instance. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-cloudwatch.html">Monitoring Your Instances and Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the UnmonitorInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2UnmonitorInstancesResult`.
 
 @see AWSEC2UnmonitorInstancesRequest
 @see AWSEC2UnmonitorInstancesResult
 */
- (AWSTask<AWSEC2UnmonitorInstancesResult *> *)unmonitorInstances:(AWSEC2UnmonitorInstancesRequest *)request;

/**
 <p>Disables detailed monitoring for a running instance. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-cloudwatch.html">Monitoring Your Instances and Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the UnmonitorInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2UnmonitorInstancesRequest
 @see AWSEC2UnmonitorInstancesResult
 */
- (void)unmonitorInstances:(AWSEC2UnmonitorInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2UnmonitorInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>[VPC only] Updates the description of an egress (outbound) security group rule. You can replace an existing description, or add a description to a rule that did not have one previously.</p><p>You specify the description as part of the IP permissions structure. You can remove a description for a security group rule by omitting the description parameter in the request.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSecurityGroupRuleDescriptionsEgress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2UpdateSecurityGroupRuleDescriptionsEgressResult`.
 
 @see AWSEC2UpdateSecurityGroupRuleDescriptionsEgressRequest
 @see AWSEC2UpdateSecurityGroupRuleDescriptionsEgressResult
 */
- (AWSTask<AWSEC2UpdateSecurityGroupRuleDescriptionsEgressResult *> *)updateSecurityGroupRuleDescriptionsEgress:(AWSEC2UpdateSecurityGroupRuleDescriptionsEgressRequest *)request;

/**
 <p>[VPC only] Updates the description of an egress (outbound) security group rule. You can replace an existing description, or add a description to a rule that did not have one previously.</p><p>You specify the description as part of the IP permissions structure. You can remove a description for a security group rule by omitting the description parameter in the request.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSecurityGroupRuleDescriptionsEgress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2UpdateSecurityGroupRuleDescriptionsEgressRequest
 @see AWSEC2UpdateSecurityGroupRuleDescriptionsEgressResult
 */
- (void)updateSecurityGroupRuleDescriptionsEgress:(AWSEC2UpdateSecurityGroupRuleDescriptionsEgressRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2UpdateSecurityGroupRuleDescriptionsEgressResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the description of an ingress (inbound) security group rule. You can replace an existing description, or add a description to a rule that did not have one previously.</p><p>You specify the description as part of the IP permissions structure. You can remove a description for a security group rule by omitting the description parameter in the request.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSecurityGroupRuleDescriptionsIngress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2UpdateSecurityGroupRuleDescriptionsIngressResult`.
 
 @see AWSEC2UpdateSecurityGroupRuleDescriptionsIngressRequest
 @see AWSEC2UpdateSecurityGroupRuleDescriptionsIngressResult
 */
- (AWSTask<AWSEC2UpdateSecurityGroupRuleDescriptionsIngressResult *> *)updateSecurityGroupRuleDescriptionsIngress:(AWSEC2UpdateSecurityGroupRuleDescriptionsIngressRequest *)request;

/**
 <p>Updates the description of an ingress (inbound) security group rule. You can replace an existing description, or add a description to a rule that did not have one previously.</p><p>You specify the description as part of the IP permissions structure. You can remove a description for a security group rule by omitting the description parameter in the request.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSecurityGroupRuleDescriptionsIngress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2UpdateSecurityGroupRuleDescriptionsIngressRequest
 @see AWSEC2UpdateSecurityGroupRuleDescriptionsIngressResult
 */
- (void)updateSecurityGroupRuleDescriptionsIngress:(AWSEC2UpdateSecurityGroupRuleDescriptionsIngressRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2UpdateSecurityGroupRuleDescriptionsIngressResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops advertising an address range that is provisioned as an address pool.</p><p>You can perform this operation at most once every 10 seconds, even if you specify different address ranges each time.</p><p>It can take a few minutes before traffic to the specified addresses stops routing to AWS because of BGP propagation delays.</p>
 
 @param request A container for the necessary parameters to execute the WithdrawByoipCidr service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2WithdrawByoipCidrResult`.
 
 @see AWSEC2WithdrawByoipCidrRequest
 @see AWSEC2WithdrawByoipCidrResult
 */
- (AWSTask<AWSEC2WithdrawByoipCidrResult *> *)withdrawByoipCidr:(AWSEC2WithdrawByoipCidrRequest *)request;

/**
 <p>Stops advertising an address range that is provisioned as an address pool.</p><p>You can perform this operation at most once every 10 seconds, even if you specify different address ranges each time.</p><p>It can take a few minutes before traffic to the specified addresses stops routing to AWS because of BGP propagation delays.</p>
 
 @param request A container for the necessary parameters to execute the WithdrawByoipCidr service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2WithdrawByoipCidrRequest
 @see AWSEC2WithdrawByoipCidrResult
 */
- (void)withdrawByoipCidr:(AWSEC2WithdrawByoipCidrRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2WithdrawByoipCidrResult * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
